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
* Snoop data path
*   1) First buffer in dc fifo since snoops are on another clock domain
*   2) Filter out requests beyond the currently cached address range
*   3) Break up bursts
*   4) Check if there's a tagmatch
*   5) If so, issue invalidation to cache
**********************/


module acl_snoop
#(
  parameter LOG2SIZE=10,       //in bytes
  parameter LOG2WIDTH=5,       //in bits
  parameter AWIDTH=32,         //Word address width
  parameter WIDTH=2**LOG2WIDTH,
  parameter BURSTWIDTH=6,
  parameter CLOCKCROSSFIFO=0
)
(
  input   clk,
  input   resetn,
  input   flush,

  // Cache fill port interface - must keep tag filter synced w/ cache
  input [AWIDTH-1:0]       fill_readdata_addr,  //word-address
  input                    fill_readdatavalid,

  // Snoop port interface - these are the addresses being modified
  input                         snoop_clk,
  input  [AWIDTH-1:0]           snoop_addr,  //word-address
  input  [BURSTWIDTH-1:0]       snoop_burst,
  input                         snoop_valid,
  input                         snoop_overflow, // Only used without CLOCKCROSSFIFO
  output                        snoop_stall,

  // Invalidation interface - these cache lines should be invalidated
  output reg [AWIDTH-1:0]        invalidate_addr,  //word-address
  output reg                     invalidate_en,
  input                          invalidate_waitrequest,

  output reg                     overflow
);

  /******************
  * LOCAL PARAMETERS
  *******************/

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

  localparam FIFO_SIZE = DEVICE_BLOCKRAM_BITS*2/(AWIDTH+BURSTWIDTH);
  localparam LOG2_FIFO_SIZE =$clog2(FIFO_SIZE);

  /******************
  * SIGNALS
  *******************/


  // Snoop signals 
  wire [AWIDTH-1:0] snoop_fifo_addr;
  wire [BURSTWIDTH-1:0] snoop_fifo_burst;
  wire snoop_fifo_valid;
  wire snoop_fifo_empty;
  reg               fill_readdatavalid_r;
  reg  [AWIDTH-1:0] fill_readdata_addr_r;
  reg  [AWIDTH-1:0] max_fill_readdata_addr;
  reg  [AWIDTH-1:0] min_fill_readdata_addr;

  // Snoop request after filtering
  reg   [AWIDTH-1:0]           filtered_addr;  //word-address
  reg   [BURSTWIDTH-1:0]       filtered_burst; 
  reg                          filtered_en;
  wire                         filtered_waitrequest;

  // Break up bursts
  reg   [AWIDTH-1:0]           breakup_addr;  //word-address
  reg   [BURSTWIDTH-1:0]       breakup_burst; 
  reg                          breakup_en;
  wire                         breakup_waitrequest;
  wire  [TAGSIZE-1:0]          tag_out;  //word-address

  // Cache check 
  reg   [AWIDTH-1:0]           cache_addr;  //word-address
  reg                          cache_en;
  wire                         cache_waitrequest;

  /******************
  * ARCHITECTURE
  *******************/

  // Capture max and min addresses that have ever been cached.  We can use
  // these to filter out snoop requests that will for sure miss in the cache
  always@(posedge clk)
    fill_readdata_addr_r <= fill_readdata_addr;
  always@(posedge clk)
    fill_readdatavalid_r <= fill_readdatavalid;

  initial
  begin
    max_fill_readdata_addr<={AWIDTH{1'b0}};
    min_fill_readdata_addr<={AWIDTH{1'b1}};
  end
  always@(posedge clk or posedge flush)
    if (flush)
    begin
      max_fill_readdata_addr<={AWIDTH{1'b0}};
      min_fill_readdata_addr<={AWIDTH{1'b1}};
    end
    else if (fill_readdatavalid_r)
    begin
      if ( fill_readdata_addr_r > max_fill_readdata_addr )
        max_fill_readdata_addr<= fill_readdata_addr_r;
      if ( fill_readdata_addr_r < min_fill_readdata_addr )
        min_fill_readdata_addr<= fill_readdata_addr_r;
    end

  // Register snoop data from iface
  reg  [AWIDTH-1:0]     snoop_addr_r;  //word-address
  reg  [BURSTWIDTH-1:0] snoop_burst_r;
  reg                   snoop_valid_r;
  always@(posedge snoop_clk or negedge resetn)
    if (!resetn)
    begin
      snoop_addr_r<={AWIDTH{1'b0}};
      snoop_burst_r<={BURSTWIDTH{1'b0}};
      snoop_valid_r<=1'b0;
    end
    else if (!snoop_stall)
    begin
      snoop_addr_r<=snoop_addr;
      snoop_burst_r<=snoop_burst;
      snoop_valid_r<=snoop_valid;
    end

generate 
  if ( CLOCKCROSSFIFO==1 )
  begin
    //Here we assume snoop_clk is different than clk

    wire [ LOG2_FIFO_SIZE-1 : 0] rdusedw;

    // 1) Fifo to store snooped accesses from host
    dcfifo  dcfifo_component (
      .data ({snoop_addr_r,snoop_burst_r}),
      .wrclk (snoop_clk),
      .wrreq (snoop_valid_r),
      .rdclk (clk),
      .rdreq (~filtered_waitrequest),
      .q ({snoop_fifo_addr,snoop_fifo_burst}),
      .rdempty (snoop_fifo_empty),
      .rdfull (),
      .aclr (~resetn),
      .rdusedw (rdusedw),
      .wrempty (),
      .wrfull (snoop_stall),
      .wrusedw ());
    defparam
      dcfifo_component.intended_device_family = "Stratix IV",
      dcfifo_component.lpm_numwords = FIFO_SIZE,
      dcfifo_component.lpm_showahead = "ON",
      dcfifo_component.lpm_type = "dcfifo",
      dcfifo_component.lpm_width = AWIDTH+BURSTWIDTH,
      dcfifo_component.lpm_widthu = LOG2_FIFO_SIZE,
      dcfifo_component.overflow_checking = "ON",
      dcfifo_component.rdsync_delaypipe = 4,
      dcfifo_component.underflow_checking = "ON",
      dcfifo_component.use_eab = "ON",
      dcfifo_component.wrsync_delaypipe = 4;

    assign snoop_fifo_valid=~snoop_fifo_empty;

    always@(posedge clk) 
      overflow = ((rdusedw >> (LOG2_FIFO_SIZE-2)) == 2'b11);
  end
  else
  begin
    //Here we assume snoop_clk is identical to clk (same clock domain)
    assign snoop_fifo_addr = snoop_addr_r;
    assign snoop_fifo_burst = snoop_burst_r;
    assign snoop_fifo_valid = snoop_valid_r;
    assign snoop_stall = filtered_waitrequest && !flush;  // Don't stall if flushing
    always@(posedge clk) 
      overflow = snoop_overflow;
  end
endgenerate

  // 2) Filter out snoops beyond cached address range
  assign filtered_waitrequest=filtered_en && breakup_waitrequest;
  always@(posedge clk or negedge resetn) 
  begin
    if (!resetn)
    begin
      filtered_addr <= {AWIDTH{1'b0}};
      filtered_burst <= {BURSTWIDTH{1'b0}};
      filtered_en <= 1'b0;
    end
    else if ((~filtered_en) || ~breakup_waitrequest)
    begin
      filtered_addr <= snoop_fifo_addr;  //word-address
      filtered_burst <= snoop_fifo_burst;
      filtered_en <= snoop_fifo_valid &&
        !((snoop_fifo_addr + snoop_fifo_burst <= min_fill_readdata_addr) ||
          (snoop_fifo_addr > max_fill_readdata_addr));
    end
  end

  // 3) Break up bursts into single cache line accesses (assume cache line size
  // matches snooped data bus width)
  assign breakup_waitrequest=breakup_en && !(breakup_burst==1 && ~cache_waitrequest);
  always@(posedge clk or negedge resetn) 
  begin
    if (!resetn)
    begin
      breakup_addr <= {AWIDTH{1'b0}};
      breakup_burst <= {BURSTWIDTH{1'b0}};
      breakup_en <= 1'b0;
    end
    else if ((~breakup_en) || breakup_burst==1 && ~cache_waitrequest)
    begin
      breakup_addr <= filtered_addr;
      breakup_burst <= filtered_burst;
      breakup_en <= filtered_en;
    end
    else if (breakup_en && !invalidate_waitrequest)
    begin
      breakup_addr <= breakup_addr+1;
      breakup_burst <= breakup_burst-1;
    end
  end

  // 4) Check if tags are in cache - must keep this synchronized with cache's tags
  assign cache_waitrequest=cache_en && invalidate_waitrequest;
  always@(posedge clk or negedge resetn) 
  begin
    if (!resetn)
    begin
      cache_addr <= {AWIDTH{1'b0}};  //word-address
      cache_en <= 1'b0;
    end
    else 
    begin
      cache_addr <= breakup_addr;  //word-address
      cache_en <= breakup_en && breakup_burst>=1;
    end
  end

  altsyncram  tags (
    .clock0 (clk),
    .wren_a (fill_readdatavalid),
    .address_a (fill_readdata_addr[`OFFSETRANGE]),
    .data_a (fill_readdata_addr[`TAGRANGE]),
    .address_b (breakup_addr[`OFFSETRANGE]),
    .q_b (tag_out),
    .addressstall_b (invalidate_waitrequest),
    .q_a (),
    .data_b (),
    .wren_b (),
    .aclr0 (1'b0),
    .aclr1 (1'b0),
    .addressstall_a (1'b0),
    .byteena_a (1'b1),
    .byteena_b (1'b1),
    .clock1 (1'b1),
    .clocken0 (1'b1),
    .clocken1 (1'b1),
    .clocken2 (1'b1),
    .clocken3 (1'b1),
    .eccstatus (),
    .rden_a (1'b1),
    .rden_b (1'b1));
  defparam tags.address_reg_b = "CLOCK0",
    tags.clock_enable_input_a = "BYPASS",
    tags.clock_enable_input_b = "BYPASS",
    tags.clock_enable_output_a = "BYPASS",
    tags.clock_enable_output_b = "BYPASS",
    tags.address_reg_b = "CLOCK0",
    tags.rdcontrol_reg_b = "CLOCK0",
    tags.byteena_reg_b = "CLOCK0",
    tags.indata_reg_b = "CLOCK0",
    tags.intended_device_family = "Stratix IV",
    tags.lpm_type = "altsyncram",
    tags.operation_mode = "DUAL_PORT",
    tags.outdata_aclr_a = "NONE",
    tags.outdata_aclr_b = "NONE",
    tags.outdata_reg_a = "UNREGISTERED",
    tags.outdata_reg_b = "UNREGISTERED",
    tags.power_up_uninitialized = "FALSE",
    tags.read_during_write_mode_mixed_ports = "DONT_CARE",
    tags.read_during_write_mode_port_a = "DONT_CARE",
    tags.read_during_write_mode_port_b = "DONT_CARE",
    tags.widthad_a = LOG2NUMCACHEENTRIES,
    tags.widthad_b = LOG2NUMCACHEENTRIES,
    tags.width_a = TAGSIZE,
    tags.width_b = TAGSIZE,
    tags.width_byteena_a = 1,
    tags.width_byteena_b = 1,
    tags.wrcontrol_wraddress_reg_b = "CLOCK0";

  // 5) If the tag matches, invalidate this entry
  always@(posedge clk or negedge resetn) 
  begin
    if (!resetn)
    begin
      invalidate_addr <= {AWIDTH{1'b0}};  
      invalidate_en <= 1'b0;
    end
    else 
    begin
      invalidate_addr <= cache_addr;  
      invalidate_en <= cache_en && (tag_out==cache_addr[`TAGRANGE]);
    end
  end


endmodule
