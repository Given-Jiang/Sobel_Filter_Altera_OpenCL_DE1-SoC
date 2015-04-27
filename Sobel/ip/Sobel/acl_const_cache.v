// (C) 1992-2014 Altera Corporation. All rights reserved.                         
// Your use of Altera Corporation's design tools, logic functions and other       
// software and tools, and its AMPP partner logic functions, and any output       
// files any of the foregoing (including device programming or simulation         
// files), and any associated documentation or information are expressly subject  
// to the terms and conditions of the Altera Program License Subscription         
// Agreement, Altera MegaCore Function License Agreement, or other applicable     
// license agreement, including, without limitation, that your use is for the     
// sole purpose of programming logic devices manufactured by Altera and sold by   
// Altera or its authorized distributors.  Please refer to the applicable         
// agreement for further details.                                                 
    


/**********************
* Constant cache core
*
*   This module replicates as many block RAMs as is necessary to achieve the
*   desired NUMPORTS, each of which is read-only and referred to as rdports.
*   All block RAMs are double-pumped to achieve 4 read ports, this results in a
*   4 cycle latency plus 1 to resolve hit/misses.  The data must be present in
*   the cache on the first cycle for it to be a cache hit.
*
*   The cache is optimized for cache hits only.  Requests flow through a given
*   cache rdport in a fully pipelined fashion, however once there's a miss,
*   that rdport (i) stalls; (ii) services all currently queued requests in
*   order; (iii) resumes accepting requests once the queue is empty.
*
*   Normally the requests are pipelined alongside the accesses to the cache's
*   block RAMs, however once stalled (due to a miss) only the requests are
*   stalled while the cache block RAMs are continuously fed the missed request
*   until it hits.  Then the pipeline drains the copies of these missed request
*   and resumes pipelining the requests along with the block RAMs.  Because of
*   this, there's basically two pipelines you can think of.  The request
*   pipeline and the cache memory blocks pipeline.  Illustrated below.
*
*   For example let's say we have the following access pattern with lower case
*   indicating a hit, and upper a miss:  abCdefgh.  Also let's assume the 
*   CACHE_LATENCY is 5 so that the 5th stage resolves hits/misses.
*  
*    Request Queue (5 stages)     Cache Memory Blocks (4 stages)
*       12345                           1234   state
*      +-----+                         +-----+
* t=0 a|     |                        a|     | PIPELINE  
* t=1 b|a    |                        b|a    |           
* t=2 C|ba   |                        C|ba   |           
* ... d|Cba  |                        d|Cba  |           
*     e|dCba |                        e|dCba |           
*     f|edCba|a hits and returns      f|edCb |           
*     g|fedCb|b hits and returns      g|fedC |
*     h|gfedC|!miss! stall!           C|gfed |
*     h|gfedC|stall!                  C|Cgfe | FILL
*     h|gfedC|stall!                  C|CCgf |
*     h|gfedC|stall!                  C|CCCg |
*     h|gfedC|stall!                  C|CCCC | MISS
*     h|gfedC|stall!                  C|CCCC |
*     h|gfedC|stall! C arrives        C|CCCC |
*     h|gfedC|C hits and returns      C|CCCC | 
*     h| gfed|                        d|CCCC | DRAIN
*     h|d gfe|                        e|dCCC |
*     h|ed gf|                        f|edCC |
*     h|fed g|                        g|fedC |
*     h|gfed |                        h|gfed | PIPELINE
*      |hgfed|d hits and returns       |hgfe |
*      | hgfe|e hits and returns       | hgf |
*      |  hgf|f hits and returns       |  hg |      
*      |   hg|g hits and returns       |   h |      
* t=n  |    h|                         |     |
*      +-----+                         +-----+      
*                                      
*
*   There is only one write port for the entire cache, it is used to receive
*   and store data read from global memory.  This is referred to as the fill
*   port (fills the cache with data).
*
*   The snoop support takes an incoming stream of snooped writes (in a separate
*   clock domain), and buffers them in a dc_fifo which i) converts to the local
*   clock domain; and ii) flushes the entire cache if it overflows.  This means
*   functionality is preserved in the case where we're receiving invalidations
*   quicker than we can service them.  More details about how the snooping
*   actually works can be found in that module.
*
* Stages
* |    0    |    1    |    2    |    3    |    4    |    5    |    6    |
*  rdport_                                  hit_comb  hit
*  cache_                                   cache_    miss
*
* WARNING - this module ASSUMES read_during_write_mode_mixed_ports is OLD_DATA
*
* TODO:
* a) Make sure flush doesn't hang outstanding requests by killing the fetch
* b) Add byteenable to fill port support cache width > mem width
* c) (optional) Support cache_waitrequest - right now doesn't work but is unused
**********************/


module acl_const_cache 
#(
  parameter NUMPORTS=13,       // Number of ports desired
  parameter LOG2SIZE=10,       //in bytes
  parameter LOG2WIDTH=5,       //in bits
  parameter AWIDTH=32,         //Word address width
  parameter WIDTH=2**LOG2WIDTH,
  parameter MWIDTH=WIDTH,
  parameter MAWIDTH=AWIDTH-$clog2(MWIDTH/WIDTH), //Word address width
  parameter BURSTWIDTH=6
)
(
  input   clk,
  input   clk2x,
  input   resetn,

  // Cache fill port interface
  output [MAWIDTH-1:0]     fill_addr,  //word-address
  output                   fill_read,
  input                    fill_waitrequest,
  input                    fill_readdatavalid,
  input  [MWIDTH-1:0]      fill_readdata,

  input tri0               flush_cache,

  // Snoop port interface - if address is cached invalidate it
  input                         snoop_clk,
  input                         snoop_overflow,
  input  [MAWIDTH-1:0]          snoop_addr,  //word-address
  input  [BURSTWIDTH-1:0]       snoop_burst,
  input                         snoop_write,
  output                        snoop_ready,

  // Cache ports interfaces
  input      [NUMPORTS*AWIDTH-1:0]      rdport_addr,  //word-address
  input      [NUMPORTS-1:0]             rdport_read,
  output     [NUMPORTS-1:0]             rdport_waitrequest,
  output     [NUMPORTS-1:0]             rdport_readdatavalid,
  output reg [NUMPORTS*WIDTH-1:0]       rdport_readdata
);

  /******************
  * LOCAL PARAMETERS
  *******************/
  localparam USE2XCLOCK=(NUMPORTS>1);
  localparam CACHE_LATENCY=(USE2XCLOCK ? 4 : 2) + 1;

  localparam LOG2NUMCACHEENTRIES=LOG2SIZE-(LOG2WIDTH-3);

  // Address is byte address
  //localparam TAGSIZE=AWIDTH-LOG2SIZE;
  //`define TAGRANGE AWIDTH-1:LOG2SIZE
  //`define OFFSETRANGE LOG2SIZE-1:LOG2WIDTH-3

  // Address is word address (word size defined by WIDTH)
  localparam TAGSIZE=AWIDTH-(LOG2SIZE-LOG2WIDTH+3);
  `define TAGRANGE AWIDTH-1:LOG2SIZE-LOG2WIDTH+3
  `define OFFSETRANGE LOG2SIZE-(LOG2WIDTH-3)-1:0

  localparam DEVICE_BLOCKRAM_BITS = 8192; //Stratix IV M9Ks

  localparam SNOOP_BURSTWIDTH = BURSTWIDTH + $clog2(MWIDTH/WIDTH);

  /******************
  * SIGNALS
  *******************/

  reg  [NUMPORTS-1:0]             _rdport_readdatavalid;

  reg  [NUMPORTS-1:0] hit;        // Cache hit signal (registered)
  reg  [NUMPORTS-1:0] miss;       // Cache miss signal (registered)
  wire [NUMPORTS-1:0] hit_comb;   // Cache hit signal
  wire [NUMPORTS-1:0] miss_comb;  // Cache miss signal 

  wire [NUMPORTS-1:0] en;         // Pipeline enable signal for the cache
  wire [NUMPORTS-1:0] rotate;     // Rotate the pipeline to replay requests
  wire [NUMPORTS-1:0] cache_valid;
  wire [NUMPORTS-1:0] cache_read;
  wire [NUMPORTS*AWIDTH-1:0] cache_addr_full;
  wire [NUMPORTS*LOG2NUMCACHEENTRIES-1:0] cache_addr;
  wire [NUMPORTS-1:0]             cache_readdatavalid;
  wire [NUMPORTS*WIDTH-1:0]       cache_readdata;
  wire [NUMPORTS-1:0] cache_waitrequest;
  wire [NUMPORTS*TAGSIZE-1:0] cache_tagout;

  wire [AWIDTH-1:0] fill_readdata_addr;
  reg  [AWIDTH-1:0] fill_readdata_addr_r;
  reg fill_readdatavalid_r;
  reg [WIDTH-1:0] fill_readdata_r;

  wire [AWIDTH-1:0]     fill_cc_addr;  //word-address of cache

  // Snoop signals 
  reg  [AWIDTH-1:0] valid_addr;
  reg               valid_writedata;
  reg               valid_write;
  wire [AWIDTH-1:0] invalidate_addr;
  wire              invalidate_en;

  wire snoop_stall;

  localparam [1:0] s_INVALIDATE=2'b00;
  localparam [1:0] s_FILL=2'b01;
  localparam [1:0] s_FLUSH=2'b10;
  wire [1:0] valid_sel;
    
  // Cache flush signals 
  reg  [LOG2NUMCACHEENTRIES-1:0] flush_counter;
  reg                            flushing;
  wire                           flush_overflow;
  wire                           do_flush;  // one cycle pulse

  wire [CACHE_LATENCY*AWIDTH-1:0] queued_addr[NUMPORTS-1:0];
  wire [CACHE_LATENCY-1:0]        queued_read[NUMPORTS-1:0];
  wire [AWIDTH-1:0]               _cache_addr_full[NUMPORTS-1:0];
  wire [AWIDTH-1:0]               compare_addr[NUMPORTS-1:0];
  wire [NUMPORTS-1:0]             compare_read;
  wire [AWIDTH-1:0]               miss_addr[NUMPORTS-1:0];
  wire [NUMPORTS-1:0]             miss_read;
  reg  [NUMPORTS-1:0]             miss_issued;

  reg  [NUMPORTS*AWIDTH-1:0] upstream_arb_addr;
  reg  [NUMPORTS-1:0] upstream_arb_read;
  wire [NUMPORTS-1:0] miss_waitrequest;

  wire                           clockcross_overflow;

  reg  [1:0] state[NUMPORTS-1:0];
  reg  [3:0] count[NUMPORTS-1:0]; // Must be able to store CACHE_LATENCY
  localparam p_PIPELINE=2'b00;
  localparam p_FILL=2'b01;
  localparam p_MISS=2'b10;
  localparam p_DRAIN=2'b11;

  /******************
  * ARCHITECTURE
  *******************/

  /********************
  * The cache accepts requests in a pipelined fashion.  By the time a single
  * request has been resolved (hit or miss) several requests are already in
  * flight in the cache's pipeline.  We have a few states to deal with this:
  *    PIPELINE - requests are being pipelined through, default behaviour
  *    FILL - A miss has occurred so we must fill the cache only with copies of
  *           the missed request.  During this time we ignore hit/miss
  *           discoveries of the requests behind the miss and stall
  *    MISS - At this point the pipeline is filled with requests from the 
  *           miss, we wait for one of these to hit to return the data
  *    DRAIN - The miss was completed, we rotate the unserved requests stalled
  *            behind it and ignore hits/misses from the copies of the miss
  **********************/
  generate
  genvar p;
  for (p=0; p<NUMPORTS; p=p+1)
  begin : portgen

    always@(posedge clk or negedge resetn)
    begin
      if (!resetn)
      begin
        state[p] <= p_PIPELINE;
        count[p] <= {4{1'b0}};
      end
      else
      begin
        case (state[p])
          p_PIPELINE: 
          begin
            state[p]<= (miss[p]) ? p_FILL : p_PIPELINE;
            count[p]<=CACHE_LATENCY-1;
          end
          p_FILL:
          begin
            state[p]<= (count[p]==0) ? p_MISS : p_FILL;
            count[p]<=count[p]-2'b01;
          end
          p_MISS:
          begin
            state[p]<= (hit[p]) ? p_DRAIN : p_MISS;
            count[p]<=CACHE_LATENCY-1;
          end
          p_DRAIN:
          begin
            state[p]<= (count[p]==0) ? p_PIPELINE : p_DRAIN;
            count[p]<=count[p]-2'b01;
          end
        endcase
      end
    end

    // State passed along in request pipeline
    //    addr   - the address
    //    read   - tells us if this is actually a read request vs nop
    pipe # (.WIDTH(AWIDTH), .DEPTH(CACHE_LATENCY)) request_queue 
    ( .clk(clk), .resetn(resetn), 
      .en({CACHE_LATENCY{en[p]}}),
      .d( rotate[p] ? queued_addr[p][(CACHE_LATENCY-1)*AWIDTH +: AWIDTH] : 
                      rdport_addr[p*AWIDTH +: AWIDTH]),
      .q( queued_addr[p]));

    pipe # (.WIDTH(1), .DEPTH(CACHE_LATENCY)) request_queue_read
    ( .clk(clk), .resetn(resetn), 
      .en({CACHE_LATENCY{en[p]}}),
      .d( (!rotate[p]) ?  rdport_read[p] :
        queued_read[p][CACHE_LATENCY-1]), 
      .q( queued_read[p]));

    assign en[p]=((state[p]==p_PIPELINE && !miss[p]) || (state[p]==p_MISS && hit[p]) || state[p]==p_DRAIN) && !cache_waitrequest[p];
    assign rotate[p]=state[p]==p_DRAIN || flushing;

    //These are the signals that actually feed the cache inputs
    assign cache_read[p]=(state[p]==p_PIPELINE) ? 
      rdport_read[p] :
      queued_read[p][CACHE_LATENCY-1] ; 
    assign cache_addr_full[p*AWIDTH +: AWIDTH]=(state[p]==p_PIPELINE) ? 
      rdport_addr[p*AWIDTH +: AWIDTH] :
      queued_addr[p][(CACHE_LATENCY-1)*AWIDTH +: AWIDTH];
    assign _cache_addr_full[p]=cache_addr_full[p*AWIDTH +: AWIDTH];
    assign cache_addr[p*LOG2NUMCACHEENTRIES +: LOG2NUMCACHEENTRIES] = _cache_addr_full[p][`OFFSETRANGE];

    //Get the addr of 2nd last stage to do tag comparison
    assign compare_addr[p]= (state[p]==p_MISS || (state[p]==p_FILL && count[p]==0)) ? 
      queued_addr[p][(CACHE_LATENCY-1)*AWIDTH +: AWIDTH] :
      queued_addr[p][(CACHE_LATENCY-2)*AWIDTH +: AWIDTH] ;
    assign compare_read[p]= (state[p]==p_MISS || (state[p]==p_FILL && count[p]==0)) ?
      queued_read[p][CACHE_LATENCY-1] :
      queued_read[p][CACHE_LATENCY-2] ;

    // The pipeline freezes when there is a miss, we need to track whether
    // the miss was issued or not to re-issue if the arbitration stalls
    always@(posedge clk or negedge resetn)
    begin
      if (!resetn)
        miss_issued[p] <= 1'b0;
      else if (state[p]==p_MISS && hit[p])  // Order matters!
        miss_issued[p]=1'b0;
      else if (miss_read[p] && !miss_waitrequest[p])
        miss_issued[p]=1'b1;
    end

    //Get the last stage of the shift register to issue miss request
    //Issue miss if it hasn't been issued already
    assign miss_addr[p]=queued_addr[p][(CACHE_LATENCY-1)*AWIDTH +: AWIDTH];
    assign miss_read[p]= queued_read[p][CACHE_LATENCY-1] && 
      ((miss[p] && state[p]==p_PIPELINE) || 
       (!miss_issued[p] && (state[p]==p_FILL || (state[p]==p_MISS && !hit[p]))));

    //Last stage of cache lookup computes hit or miss (registered)
    always@(posedge clk or negedge resetn)
      if (!resetn)
      begin
        hit[p]<=1'b0;
        miss[p]<=1'b0;
      end
      else
      begin
        hit[p]<=hit_comb[p];
        miss[p]<=miss_comb[p];
      end

    assign hit_comb[p]=cache_valid[p]===1'b1 && compare_read[p] &&
      (cache_tagout[p*TAGSIZE +: TAGSIZE]==compare_addr[p][`TAGRANGE]);
    assign miss_comb[p]=compare_read[p] && (cache_valid[p]!==1'b1 ||
      (cache_tagout[p*TAGSIZE +: TAGSIZE]!=compare_addr[p][`TAGRANGE]));

    assign rdport_waitrequest[p]=cache_waitrequest[p] || flushing ||
      !((state[p]==p_PIPELINE && !miss[p]) || (state[p]==p_MISS && hit[p]));

    assign rdport_readdatavalid[p]=_rdport_readdatavalid[p] && 
      (state[p]==p_PIPELINE ||state[p]==p_MISS);
    always@(posedge clk)
      _rdport_readdatavalid[p]<=cache_readdatavalid[p] && hit_comb[p];

    always@(posedge clk)
      rdport_readdata[p*WIDTH +: WIDTH]<=cache_readdata[p*WIDTH +: WIDTH];

  end
  endgenerate

  // Width Adapter on fill port
  generate
  if (MWIDTH > WIDTH)
  begin
    reg  [AWIDTH-1:0] fill_readdata_addr_r0; // Width adapted signals
    reg fill_readdatavalid_r0;
    reg [MWIDTH-1:0] fill_readdata_r0;

    //Register fill data before broadcasting it
    always@(posedge clk)
      fill_readdatavalid_r<=fill_readdatavalid_r0;
    always@(posedge clk)
      fill_readdata_r<=fill_readdata_r0[fill_readdata_addr_r0[$clog2(MWIDTH/WIDTH)-1:0]*WIDTH +: WIDTH];
    always@(posedge clk)  
      fill_readdata_addr_r<=fill_readdata_addr_r0;

    always@(posedge clk) fill_readdatavalid_r0<=fill_readdatavalid;
    always@(posedge clk) fill_readdata_r0<=fill_readdata;
    always@(posedge clk) fill_readdata_addr_r0<=fill_readdata_addr;
  end
  else
  begin
    //Register fill data before broadcasting it
    always@(posedge clk)
      fill_readdatavalid_r<=fill_readdatavalid;
    always@(posedge clk)
      fill_readdata_r<=fill_readdata;
    always@(posedge clk)  
      fill_readdata_addr_r<=fill_readdata_addr;
  end
  endgenerate

  assign fill_addr = fill_cc_addr >> $clog2(MWIDTH/WIDTH);


  acl_multireadport_mem 
  #(
    .LOG2DEPTH(LOG2NUMCACHEENTRIES),
    .WIDTH(1),
    .NUMPORTS(NUMPORTS),
    .USE2XCLOCK(USE2XCLOCK),
    .DEDICATED_BROADCAST_PORT(1)
  )
  valid (
    .clk(clk),
    .clk2x(clk2x),
    .resetn(resetn),
    .broadcast_addr(valid_addr),
    .broadcast_writedata(valid_writedata),
    .broadcast_read(),
    .broadcast_write(valid_write),
    .rdport_addr(cache_addr),
    .rdport_read(cache_read),
    .rdport_waitrequest(cache_waitrequest),
    .rdport_readdatavalid(),
    .rdport_readdata(cache_valid)
  );

  acl_multireadport_mem 
  #(
    .LOG2DEPTH(LOG2NUMCACHEENTRIES),
    .WIDTH(TAGSIZE),
    .NUMPORTS(NUMPORTS),
    .USE2XCLOCK(USE2XCLOCK),
    .DEDICATED_BROADCAST_PORT(1)
  )
  tag (
    .clk(clk),
    .clk2x(clk2x),
    .resetn(resetn),
    .broadcast_addr(fill_readdata_addr_r[`OFFSETRANGE]),
    .broadcast_writedata(fill_readdata_addr_r[`TAGRANGE]),
    .broadcast_write(fill_readdatavalid_r),
    .rdport_addr(cache_addr),
    .rdport_read(cache_read),
    .rdport_waitrequest(),
    .rdport_readdatavalid(),
    .rdport_readdata(cache_tagout)
  );

  acl_multireadport_mem 
  #(
    .LOG2DEPTH(LOG2NUMCACHEENTRIES), 
    .WIDTH(WIDTH),
    .NUMPORTS(NUMPORTS),
    .USE2XCLOCK(USE2XCLOCK),
    .DEDICATED_BROADCAST_PORT(1)
  )
  data (
    .clk(clk),
    .clk2x(clk2x),
    .resetn(resetn),
    .broadcast_addr(fill_readdata_addr_r[`OFFSETRANGE]),
    .broadcast_writedata(fill_readdata_r),
    .broadcast_write(fill_readdatavalid_r),
    .rdport_addr(cache_addr),
    .rdport_read(cache_read),
    .rdport_waitrequest(),
    .rdport_readdatavalid(cache_readdatavalid),
    .rdport_readdata(cache_readdata)
  );

  // FIFO to store address of fetched data
  scfifo  scfifo_component (
    .clock (clk),
    .data (fill_cc_addr),
    .rdreq ((fill_readdatavalid)),
    .sclr (),
    .wrreq ((fill_read&~fill_waitrequest)),
    .empty (),
    .full (),
    .q (fill_readdata_addr),
    .aclr (~resetn),
    .almost_empty (),
    .almost_full (),
    .usedw ());
  defparam
    scfifo_component.add_ram_output_register = "OFF",
    scfifo_component.intended_device_family = "Stratix IV",
    scfifo_component.lpm_numwords = DEVICE_BLOCKRAM_BITS/AWIDTH,
    scfifo_component.lpm_showahead = "ON",
    scfifo_component.lpm_type = "scfifo",
    scfifo_component.lpm_width = AWIDTH,
    scfifo_component.lpm_widthu = $clog2(DEVICE_BLOCKRAM_BITS/AWIDTH),
    scfifo_component.overflow_checking = "ON",
    scfifo_component.underflow_checking = "ON",
    scfifo_component.use_eab = "ON";

  // Convert 2-D arrays into 1-D bit vector 
  integer pa;
  always@*
  begin
    upstream_arb_addr={NUMPORTS*AWIDTH{1'b0}};
    upstream_arb_read={NUMPORTS{1'b0}};
    for (pa=NUMPORTS-1; pa>=0; pa=pa-1)
    begin
      upstream_arb_addr={NUMPORTS*AWIDTH{1'b0}} | 
        (upstream_arb_addr<<AWIDTH) | 
        miss_addr[pa];
      upstream_arb_read={NUMPORTS{1'b0}} | (upstream_arb_read<<1) | 
        (miss_read[pa]);
    end
  end

  /********************************************
  *  + Arbitrate between all fill requests - options:
  *    a) Push to SOPC - but then must arbitrate between readdata
  *    b) Build my own
  *
  *    Do b) although simplified - don't have to steer data back to 
  *    each requesting unit.  Updates are global to all ports
  *********************************************/
  cachefill_arbiter #(.WIDTH(AWIDTH), .NUMPORTS(NUMPORTS)) arb (
      .clk(clk),
      .resetn(resetn),
      .addr(upstream_arb_addr),
      .read(upstream_arb_read),
      .waitrequest(miss_waitrequest),
      .fill_addr(fill_cc_addr),
      .fill_read(fill_read),
      .fill_waitrequest(fill_waitrequest));

  // Flush logic - invalidate all entries in cache
  // The cache gets flushed when the snoop fifo overflows
  assign do_flush = (flush_counter==0 && (flush_cache || flush_overflow));
  always@(posedge clk or negedge resetn)
    if (!resetn)
      flush_counter<={LOG2NUMCACHEENTRIES{1'b0}};
    else if (do_flush)
      flush_counter<={LOG2NUMCACHEENTRIES{1'b1}};
    else if (flush_counter!=0 && valid_sel==s_FLUSH)
      flush_counter<=flush_counter-1;

  always@(posedge clk)
    flushing<=do_flush || !(flush_counter==0);

  // Snoop datapath - fifo, filter, burst chunks, tag check
  acl_snoop 
  #(
    .LOG2SIZE(LOG2SIZE),
    .LOG2WIDTH(LOG2WIDTH),
    .AWIDTH(AWIDTH),
    .WIDTH(WIDTH),
    .BURSTWIDTH(SNOOP_BURSTWIDTH)
  ) snoop_datapath (
    .clk(clk),
    .resetn(resetn),
    .flush(flushing),
    .fill_readdata_addr(fill_readdata_addr_r),
    .fill_readdatavalid(fill_readdatavalid_r),
    .snoop_clk(snoop_clk),
    .snoop_overflow(snoop_overflow),
    .snoop_addr({64'b0,snoop_addr} * MWIDTH/WIDTH),
    .snoop_burst(snoop_burst * MWIDTH/WIDTH),
    .snoop_valid(snoop_write),
    .snoop_stall(snoop_stall),
    .invalidate_addr(invalidate_addr),
    .invalidate_en(invalidate_en),
    .invalidate_waitrequest((valid_sel!=s_INVALIDATE)),
    .overflow(flush_overflow));

  assign snoop_ready = ~snoop_stall;

  // Multiplexer for valid bit - between filldata, snoop invalidations, or flush
  // We always service readdata coming in first, since user must ensure data is
  // not modified while kernel active so these should be valid requests.
  assign valid_sel = (fill_readdatavalid_r) ? s_FILL : 
                        (flushing) ? s_FLUSH : s_INVALIDATE;

  always@*
    valid_addr<= (valid_sel==s_FLUSH) ? flush_counter : 
                    (valid_sel==s_INVALIDATE) ? invalidate_addr :
                      fill_readdata_addr_r[`OFFSETRANGE];
  always@*
    valid_write<= (valid_sel==s_FLUSH) ? 1'b1 :
                    (valid_sel==s_INVALIDATE) ? invalidate_en :
                      fill_readdatavalid_r;
  always@*
    valid_writedata<= (valid_sel==s_FLUSH) ? 1'b0 :
                    (valid_sel==s_INVALIDATE) ? 1'b0 : 1'b1;

endmodule


/***************************************************************
* Simple (Shift Register) Arbiter
* Register all requests and shift out requests to global memory. Stall the port
* if the register is occupied.
**************************************************************/
module cachefill_arbiter #(parameter WIDTH=32, parameter NUMPORTS=4)
( 
  input  clk,
  input  resetn,
  input  [NUMPORTS*WIDTH-1:0] addr,
  input  [NUMPORTS-1:0] read,
  output [NUMPORTS-1:0] waitrequest,
  output [WIDTH-1:0] fill_addr,
  output fill_read,
  input  fill_waitrequest
);

  reg  [(NUMPORTS+1)*WIDTH-1:0] queued_addr;
  reg  [(NUMPORTS+1)-1:0] queued_read;

  generate
  genvar p;
    for (p=0; p<NUMPORTS; p=p+1)
    begin : port_gen
      always@(posedge clk or negedge resetn)
        if (!resetn)
        begin
          queued_addr[p*WIDTH +: WIDTH]<=0;
          queued_read[p]<=0;
        end
        else if (fill_waitrequest && !queued_read[p])
        begin
          queued_addr[p*WIDTH +: WIDTH]<=addr[p*WIDTH +: WIDTH];
          queued_read[p]<=read[p];
        end
        else if (!fill_waitrequest)
          if (!queued_read[p+1])
          begin
            queued_addr[p*WIDTH +: WIDTH]<=addr[p*WIDTH +: WIDTH];
            queued_read[p]<=read[p];
          end
          else
          begin
            queued_addr[p*WIDTH +: WIDTH]<=queued_addr[(p+1)*WIDTH +: WIDTH];
            queued_read[p]<=queued_read[p+1];
          end
    end
  endgenerate

  always@(posedge clk) queued_read[NUMPORTS]=1'b0;
  always@(posedge clk) queued_addr[NUMPORTS*WIDTH +: WIDTH]=0;

  assign fill_addr=queued_addr[WIDTH-1:0];
  assign fill_read=queued_read[0];
  assign waitrequest=(fill_waitrequest) ? queued_read : queued_read>>1;

endmodule


/****************************************************************************
     Pipeline register - for transmitting a signal down several stages

  DEPTH - number of actual pipeline registers needed
****************************************************************************/
module pipe(
    d,
    clk,
    resetn,
    en,
    squash,
    q
    );
parameter WIDTH=32;
parameter DEPTH=1;
parameter RESETVALUE={WIDTH{1'b0}};

input [WIDTH-1:0]  d;
input              clk;
input              resetn;
input  [DEPTH-1:0] en;
input  [DEPTH-1:0] squash;
output [WIDTH*DEPTH-1:0] q;

reg [WIDTH*DEPTH-1:0] q;
integer i;

  always@(posedge clk or negedge resetn)
  begin
    // 1st register
    if ( !resetn )
      q[ WIDTH-1:0 ]<=RESETVALUE;
    else if ( squash[0] )
      q[ WIDTH-1:0 ]<=RESETVALUE;
    else if (en[0])
      q[ WIDTH-1:0 ]<=d;

    // All the rest registers
    for (i=1; i<DEPTH; i=i+1)
      if (!resetn)
        q[i*WIDTH +: WIDTH ]<=RESETVALUE;
      else if ( squash[i] )
        q[i*WIDTH +: WIDTH ]<=RESETVALUE;
      else if (en[i])
        q[i*WIDTH +: WIDTH ]<=q[(i-1)*WIDTH +: WIDTH ];
  end

endmodule

