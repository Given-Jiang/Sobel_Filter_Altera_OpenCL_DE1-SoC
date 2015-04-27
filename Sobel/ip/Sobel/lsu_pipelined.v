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
    


//
// Top level module for pipelined memory access.
//
// Properties - Coalesced: No, Ordered: N/A, Hazard-Safe: Yes, Pipelined: Yes
//              (see lsu_top.v for details)
//
// Description: Requests are submitted as soon as they are received.
//              Pipelined access to memory so multiple requests can be 
//              in flight at a time.

// Pipelined read unit:
//    Accept read requests on the upstream interface.  When a request is
//    received, store the requested byte address in the request fifo and
//    pass the request through to the avalon interface.  Response data
//    is buffered in the response fifo and the appropriate word is muxed
//    out of the response fifo based on the address in the request fifo.
//    The response fifo has limited capacity, so a counter is used to track
//    the number of pending responses to generate an upstream stall if
//    we run out of room.
module lsu_pipelined_read
(
    clk, reset, o_stall, i_valid, i_address, i_burstcount, i_stall, o_valid, o_readdata, 
    o_active, //Debugging signal
    avm_address, avm_read, avm_readdata, avm_waitrequest, avm_byteenable,
    avm_readdatavalid,
    o_input_fifo_depth,
    avm_burstcount
);

/*************
* Parameters *
*************/
parameter AWIDTH=32;            // Address width (32-bits for Avalon)
parameter WIDTH_BYTES=4;        // Width of the memory access (bytes)
parameter MWIDTH_BYTES=32;      // Width of the global memory bus (bytes)
parameter ALIGNMENT_ABITS=2;    // Request address alignment (address bits)
parameter KERNEL_SIDE_MEM_LATENCY=32;    // The max number of live threads
parameter USEBURST=0;
parameter BURSTCOUNT_WIDTH=6;   // Size of Avalon burst count port
parameter USEINPUTFIFO=1;
parameter USEOUTPUTFIFO=1;
parameter INPUTFIFOSIZE=32;
parameter PIPELINE_INPUT=0;
parameter SUPERPIPELINE=0;      // Enable extremely aggressive pipelining of the LSU
parameter HIGH_FMAX=1;

localparam INPUTFIFO_USEDW_MAXBITS=$clog2(INPUTFIFOSIZE);

// Derived parameters
localparam MAX_BURST=2**(BURSTCOUNT_WIDTH-1);
localparam WIDTH=8*WIDTH_BYTES;
localparam MWIDTH=8*MWIDTH_BYTES;
localparam BYTE_SELECT_BITS=$clog2(MWIDTH_BYTES);
localparam SEGMENT_SELECT_BITS=BYTE_SELECT_BITS-ALIGNMENT_ABITS;
//
// We only o_stall if we have more than KERNEL_SIDE_MEM_LATENCY inflight requests
//
localparam RETURN_FIFO_SIZE=KERNEL_SIDE_MEM_LATENCY+(USEBURST ? 0 : 1);
localparam COUNTER_WIDTH=USEBURST ? $clog2(RETURN_FIFO_SIZE+1+MAX_BURST) : $clog2(RETURN_FIFO_SIZE+1);

/********
* Ports *
********/
// Standard global signals
input clk;
input reset;

// Upstream interface
output o_stall;
input i_valid;
input [AWIDTH-1:0] i_address;
input [BURSTCOUNT_WIDTH-1:0] i_burstcount;

// Downstream interface
input i_stall;
output o_valid;
output [WIDTH-1:0] o_readdata;
output reg o_active;

// Avalon interface
output [AWIDTH-1:0] avm_address;
output avm_read;
input [MWIDTH-1:0] avm_readdata;
input avm_waitrequest;
output [MWIDTH_BYTES-1:0] avm_byteenable;
input avm_readdatavalid;

output [BURSTCOUNT_WIDTH-1:0] avm_burstcount;

// For profiler/performance monitor
output [INPUTFIFO_USEDW_MAXBITS-1:0] o_input_fifo_depth;

/***************
* Architecture *
***************/

wire i_valid_from_fifo;
wire [AWIDTH-1:0] i_address_from_fifo;
wire o_stall_to_fifo;
wire [BURSTCOUNT_WIDTH-1:0] i_burstcount_from_fifo;

wire read_accepted;
wire read_used;
wire [BYTE_SELECT_BITS-1:0] byte_select;
wire ready;
wire out_fifo_wait;

localparam FIFO_DEPTH_BITS=USEINPUTFIFO ? $clog2(INPUTFIFOSIZE) : 0;
wire [FIFO_DEPTH_BITS-1:0] usedw_true_width;
generate
   if (USEINPUTFIFO)
      assign o_input_fifo_depth[FIFO_DEPTH_BITS-1:0] = usedw_true_width;

   // Set unused bits to 0
   genvar bit_index;
   for(bit_index = FIFO_DEPTH_BITS; bit_index < INPUTFIFO_USEDW_MAXBITS; bit_index = bit_index + 1)
   begin: read_fifo_depth_zero_assign
      assign o_input_fifo_depth[bit_index] = 1'b0;
   end
endgenerate


generate
if(USEINPUTFIFO && SUPERPIPELINE)
begin

  wire int_stall;
  wire int_valid;
  wire [AWIDTH+BURSTCOUNT_WIDTH-1:0] int_data;

  acl_fifo #(
    .DATA_WIDTH(AWIDTH+BURSTCOUNT_WIDTH),
    .DEPTH(INPUTFIFOSIZE)
  ) input_fifo (
    .clock(clk),
    .resetn(!reset),
    .data_in( {i_address,i_burstcount} ),
    .data_out( int_data ),
    .valid_in( i_valid ),
    .valid_out( int_valid ),
    .stall_in( int_stall ),
    .stall_out( o_stall ),
    .usedw( usedw_true_width )
  );

  // Add a pipeline and stall-breaking FIFO
  // TODO: Consider making this parameterizeable

  acl_data_fifo #(
    .DATA_WIDTH(AWIDTH+BURSTCOUNT_WIDTH),
    .DEPTH(2),
    .IMPL("ll_reg")
  ) input_fifo_buffer (
    .clock(clk),
    .resetn(!reset),
    .data_in( int_data ),
    .valid_in( int_valid ),
    .data_out( {i_address_from_fifo,i_burstcount_from_fifo} ),
    .valid_out( i_valid_from_fifo ),
    .stall_in( o_stall_to_fifo ),
    .stall_out( int_stall )
  );

end
else if(USEINPUTFIFO && !SUPERPIPELINE)
begin
  acl_fifo #(
    .DATA_WIDTH(AWIDTH+BURSTCOUNT_WIDTH),
    .DEPTH(INPUTFIFOSIZE)
  ) input_fifo (
    .clock(clk),
    .resetn(!reset),
    .data_in( {i_address,i_burstcount} ),
    .data_out( {i_address_from_fifo,i_burstcount_from_fifo} ),
    .valid_in( i_valid ),
    .valid_out( i_valid_from_fifo ),
    .stall_in( o_stall_to_fifo ),
    .stall_out( o_stall ),
    .usedw( usedw_true_width )
  );
end
else if(PIPELINE_INPUT)
begin
  reg r_valid;
  reg [AWIDTH-1:0] r_address;
  reg [BURSTCOUNT_WIDTH-1:0] r_burstcount;

  assign o_stall = r_valid && o_stall_to_fifo;

  always@(posedge clk or posedge reset)
  begin
    if(reset == 1'b1)
      r_valid <= 1'b0;
    else
    begin
      if (!o_stall)
      begin 
        r_valid <= i_valid;
        r_address <= i_address;
        r_burstcount <= i_burstcount;
      end
    end 
  end

  assign i_valid_from_fifo = r_valid;
  assign i_address_from_fifo = r_address;
  assign i_burstcount_from_fifo = r_burstcount;
end
else
begin
  assign i_valid_from_fifo = i_valid;
  assign i_address_from_fifo = i_address;
  assign o_stall = o_stall_to_fifo;
  assign i_burstcount_from_fifo = i_burstcount;
end
endgenerate

// Track the number of transactions waiting in the pipeline here
reg [COUNTER_WIDTH-1:0] counter;
wire incr, decr;
assign incr = read_accepted;
assign decr = read_used;
always@(posedge clk or posedge reset)
begin
    if(reset == 1'b1)
    begin
        counter <= {COUNTER_WIDTH{1'b0}};
        o_active <= 1'b0;
    end
    else
    begin
        o_active <= (counter != {COUNTER_WIDTH{1'b0}});

        // incr - add one or i_burstcount_from_fifo; decr - subtr one; 
        if (USEBURST==1) 
           counter <= counter + (incr ? i_burstcount_from_fifo : 0) - decr;
        else
           counter <= counter + incr - decr;
    end 
end


generate
if(USEBURST)
   // Use the burstcount to figure out if there is enough space
   assign ready = ((counter+i_burstcount_from_fifo) <= RETURN_FIFO_SIZE);
   //
   // Can also use decr in this calaculation to make ready respond faster
   // but this seems to hurt Fmax ( ie. not worth it )
   //assign ready = ((counter+i_burstcount_from_fifo-decr) <= RETURN_FIFO_SIZE);
else
   // Can we hold one more item 
   assign ready = (counter <= (RETURN_FIFO_SIZE-1));
endgenerate

assign o_stall_to_fifo = !ready || out_fifo_wait;

// Optional Pipeline register before return
//
reg r_avm_readdatavalid;
reg [MWIDTH-1:0] r_avm_readdata;

generate
if(SUPERPIPELINE)
begin
  always@(posedge clk or posedge reset)
  begin
    if(reset == 1'b1)
    begin
      r_avm_readdata <= 'x;
      r_avm_readdatavalid <= 1'b0;
    end
    else
    begin
      r_avm_readdata <= avm_readdata;
      r_avm_readdatavalid <= avm_readdatavalid;
    end
  end
end
else
begin
  // Don't register the return
  always@(*)
  begin
    r_avm_readdata = avm_readdata;
    r_avm_readdatavalid = avm_readdatavalid;
  end
end
endgenerate

wire [WIDTH-1:0] rdata;
// Byte-addresses enter a FIFO so we can demux the appropriate data back out.
generate
if(SEGMENT_SELECT_BITS > 0)
begin
  wire [SEGMENT_SELECT_BITS-1:0] segment_address_out;
  wire [SEGMENT_SELECT_BITS-1:0] segment_address_in;
  assign segment_address_in = i_address_from_fifo[ALIGNMENT_ABITS +: BYTE_SELECT_BITS-ALIGNMENT_ABITS];
  acl_ll_fifo #(
      .WIDTH(SEGMENT_SELECT_BITS),
      .DEPTH(KERNEL_SIDE_MEM_LATENCY+1)
  ) req_fifo (
      .clk(clk),
      .reset(reset),
      .data_in( segment_address_in ),
      .data_out( segment_address_out ),
      .write( read_accepted ),
      .read( r_avm_readdatavalid ),
      .empty(),
      .full()
  );
  assign byte_select = (segment_address_out << ALIGNMENT_ABITS);
  assign rdata = r_avm_readdata[8*byte_select +: WIDTH];
end
else
begin
  assign byte_select = '0;
  assign rdata = r_avm_readdata;
end
endgenerate

// Status bits
assign read_accepted = i_valid_from_fifo && ready && !out_fifo_wait;
assign read_used = o_valid && !i_stall;

assign avm_byteenable = {MWIDTH_BYTES{1'b1}};

// Optional: Pipelining FIFO on the AVM interface
//
generate
if(SUPERPIPELINE)
begin
  acl_data_fifo #(
      .DATA_WIDTH(AWIDTH+BURSTCOUNT_WIDTH),
      .DEPTH(2),
      .IMPL("ll_reg")
  ) avm_buffer (
      .clock(clk),
      .resetn(!reset),
      .data_in({((i_address_from_fifo >> BYTE_SELECT_BITS) << BYTE_SELECT_BITS),i_burstcount_from_fifo}),
      .valid_in( i_valid_from_fifo && ready ),
      .data_out( {avm_address,avm_burstcount} ),
      .valid_out( avm_read ),
      .stall_in( avm_waitrequest ),
      .stall_out( out_fifo_wait )
  );
end
else
begin
  // No interface pipelining

  assign out_fifo_wait = avm_waitrequest;
  assign avm_address = ((i_address_from_fifo >> BYTE_SELECT_BITS) << BYTE_SELECT_BITS);
  assign avm_read = i_valid_from_fifo && ready;
  assign avm_burstcount = i_burstcount_from_fifo;
end
endgenerate

// ---------------------------------------------------------------------------------
// Output fifo - must be at least as deep as the maximum number of pending requests
// so that we can guarantee a place for the response data if the downstream blocks
// are stalling.
//
generate
if(USEOUTPUTFIFO)
begin
acl_data_fifo #(
   .DATA_WIDTH(WIDTH),
   .DEPTH(RETURN_FIFO_SIZE),
   .IMPL((SUPERPIPELINE && HIGH_FMAX) ? "ram_plus_reg" : "ram")
) data_fifo (
   .clock(clk),
   .resetn(!reset),
   .data_in( rdata ),
   .data_out( o_readdata ),
   .valid_in( r_avm_readdatavalid ),
   .valid_out( o_valid ),
   .stall_in( i_stall ),
   .stall_out()
);
end
else
begin
   assign o_valid = r_avm_readdatavalid;
   assign o_readdata = rdata;
end
endgenerate

endmodule

/******************************************************************************/

// Pipelined write unit:
//    Accept write requests on the upstream interface.  Mux the data into the
//    appropriate word lines based on the segment select bits.  Also toggle
//    the appropriate byte-enable lines to preserve data we are not 
//    overwriting.  A counter keeps track of how many requests have been
//    send but not yet acknowledged by downstream blocks.
module lsu_pipelined_write
(
    clk, reset, o_stall, i_valid, i_address, i_writedata, i_stall, o_valid, i_byteenable,
    o_active, //Debugging signal
    avm_address, avm_write, avm_writeack, avm_writedata, avm_byteenable, avm_waitrequest, o_input_fifo_depth
);

/*************
* Parameters *
*************/
parameter AWIDTH=32;    // Address width (32-bits for Avalon)
parameter WIDTH_BYTES=4;     // Width of the memory access
parameter MWIDTH_BYTES=32;   // Width of the global memory bus
parameter ALIGNMENT_ABITS=2;    // Request address alignment (address bits)
parameter COUNTER_WIDTH=6;
parameter KERNEL_SIDE_MEM_LATENCY=32;
parameter USEINPUTFIFO=1;
parameter USE_BYTE_EN=0;
parameter INPUTFIFOSIZE=32;
parameter INPUTFIFO_USEDW_MAXBITS=$clog2(INPUTFIFOSIZE);

localparam WIDTH=8*WIDTH_BYTES;
localparam MWIDTH=8*MWIDTH_BYTES;
localparam BYTE_SELECT_BITS=$clog2(MWIDTH_BYTES);
localparam SEGMENT_SELECT_BITS=BYTE_SELECT_BITS-ALIGNMENT_ABITS;
localparam NUM_SEGMENTS=2**SEGMENT_SELECT_BITS;
localparam SEGMENT_WIDTH=8*(2**ALIGNMENT_ABITS);
localparam SEGMENT_WIDTH_BYTES=(2**ALIGNMENT_ABITS);

/********
* Ports *
********/
// Standard global signals
input clk;
input reset;

// Upstream interface
output o_stall;
input i_valid;
input [AWIDTH-1:0] i_address;
input [WIDTH-1:0] i_writedata;
input [WIDTH_BYTES-1:0] i_byteenable;
// Downstream interface
input i_stall;
output o_valid;
output reg o_active;

// Avalon interface
output [AWIDTH-1:0] avm_address;
output avm_write;
input avm_writeack;
output reg [MWIDTH-1:0] avm_writedata;
output reg [MWIDTH_BYTES-1:0] avm_byteenable;
input avm_waitrequest;

// For profiler/performance monitor
output [INPUTFIFO_USEDW_MAXBITS-1:0] o_input_fifo_depth;

/***************
* Architecture *
***************/
reg transaction_complete;
wire write_accepted;
wire ready;
wire sr_stall;

wire i_valid_from_fifo;
wire [AWIDTH-1:0] i_address_from_fifo;
wire [WIDTH-1:0] i_writedata_from_fifo;
wire [WIDTH_BYTES-1:0] i_byteenable_from_fifo;
wire o_stall_to_fifo;

localparam FIFO_DEPTH_BITS=USEINPUTFIFO ? $clog2(INPUTFIFOSIZE) : 0;
wire [FIFO_DEPTH_BITS-1:0] usedw_true_width;
generate
   if (USEINPUTFIFO)
      assign o_input_fifo_depth[FIFO_DEPTH_BITS-1:0] = usedw_true_width;

   // Set unused bits to 0
   genvar bit_index;
   for(bit_index = FIFO_DEPTH_BITS; bit_index < INPUTFIFO_USEDW_MAXBITS; bit_index = bit_index + 1)
   begin: write_fifo_depth_zero_assign
      assign o_input_fifo_depth[bit_index] = 1'b0;
   end
endgenerate


localparam DATA_WIDTH = AWIDTH+WIDTH+(USE_BYTE_EN ? WIDTH_BYTES : 0);

generate
if(USEINPUTFIFO)
begin
wire valid_int;
wire stall_int;
wire [DATA_WIDTH-1:0] data_int;

   if(!USE_BYTE_EN)
   begin
     
      acl_fifo #(
          .DATA_WIDTH(AWIDTH+WIDTH),
          .DEPTH(INPUTFIFOSIZE)
      ) data_fifo (
          .clock(clk),
          .resetn(!reset),
          .data_in( {i_address,i_writedata} ),
          .data_out( data_int ),
          .valid_in( i_valid ),
          .valid_out( valid_int ),
          .stall_in( stall_int ),
          .stall_out( o_stall ),
          .usedw( usedw_true_width )
      );
      acl_data_fifo #(
          .DATA_WIDTH(AWIDTH+WIDTH),
          .DEPTH(2),
          .IMPL("ll_reg")
      ) input_buf (
          .clock(clk),
          .resetn(!reset),
          .data_in( data_int ),
          .data_out( {i_address_from_fifo,i_writedata_from_fifo} ),
          .valid_in( valid_int ),
          .valid_out( i_valid_from_fifo ),
          .stall_in( o_stall_to_fifo ),
          .stall_out( stall_int )
      );
      assign i_byteenable_from_fifo =  {WIDTH_BYTES{1'b1}};

   end else begin
      acl_fifo #(
          .DATA_WIDTH(DATA_WIDTH),
          .DEPTH(INPUTFIFOSIZE)
      ) data_fifo (
          .clock(clk),
          .resetn(!reset),
          .data_in( {i_byteenable, i_address,i_writedata}),
          .data_out( data_int ),
          .valid_in( i_valid ),
          .valid_out( valid_int ),
          .stall_in( stall_int ),
          .stall_out( o_stall ),
          .usedw( usedw_true_width )
      );
      acl_data_fifo #(
          .DATA_WIDTH(DATA_WIDTH),
          .DEPTH(2),
          .IMPL("ll_reg")
      ) input_buf (
          .clock(clk),
          .resetn(!reset),
          .data_in( data_int ),
          .data_out({i_byteenable_from_fifo,i_address_from_fifo,i_writedata_from_fifo}),
          .valid_in( valid_int ),
          .valid_out( i_valid_from_fifo ),
          .stall_in( o_stall_to_fifo ),
          .stall_out( stall_int )
      );
   end  

end
else
begin
   assign i_valid_from_fifo = i_valid;
   assign i_address_from_fifo = i_address;
   assign i_writedata_from_fifo = i_writedata;
   assign o_stall = o_stall_to_fifo;
   assign i_byteenable_from_fifo = USE_BYTE_EN ? i_byteenable : {WIDTH_BYTES{1'b1}}; 
end
endgenerate

// Avalon interface
assign avm_address = ((i_address_from_fifo >> BYTE_SELECT_BITS) << BYTE_SELECT_BITS);
assign avm_write = ready && i_valid_from_fifo;


// Mux in the correct data
generate
if(SEGMENT_SELECT_BITS > 0)
begin
  wire [SEGMENT_SELECT_BITS-1:0] segment_select;
  assign segment_select = i_address_from_fifo[ALIGNMENT_ABITS +: BYTE_SELECT_BITS-ALIGNMENT_ABITS];
  always@(*)
  begin
    avm_writedata = {MWIDTH{1'bx}};
    avm_writedata[segment_select*SEGMENT_WIDTH +: WIDTH] = i_writedata_from_fifo;

    avm_byteenable = {MWIDTH_BYTES{1'b0}};
    avm_byteenable[segment_select*SEGMENT_WIDTH_BYTES +: WIDTH_BYTES] = i_byteenable_from_fifo;
  end
end
else
begin
  always@(*)
  begin
    avm_writedata = i_writedata_from_fifo;
    avm_byteenable = i_byteenable_from_fifo;
  end
end
endgenerate

// Control logic
reg [COUNTER_WIDTH-1:0] occ_counter; // occupancy counter
wire occ_incr, occ_decr;
reg [COUNTER_WIDTH-1:0] ack_counter; // acknowledge writes counter
wire ack_incr, ack_decr;

// Track the number of transactions waiting in the pipeline here
assign occ_incr = write_accepted;
assign occ_decr = o_valid && !i_stall;
assign ack_incr = avm_writeack;
assign ack_decr = o_valid && !i_stall;
always@(posedge clk or posedge reset)
begin
    if(reset == 1'b1)
    begin
        occ_counter <= {COUNTER_WIDTH{1'b0}};
        ack_counter <= {COUNTER_WIDTH{1'b0}};
        o_active <= 1'b0;
    end
    else
    begin
        // incr - add one; decr - subtr one; both - stay the same
        occ_counter <= occ_counter + { {(COUNTER_WIDTH-1){!occ_incr && occ_decr}}, (occ_incr ^ occ_decr) };
        ack_counter <= ack_counter + { {(COUNTER_WIDTH-1){!ack_incr && ack_decr}}, (ack_incr ^ ack_decr) };
        o_active <= (occ_counter != {COUNTER_WIDTH{1'b0}});
    end
end
assign ready = (occ_counter != {COUNTER_WIDTH{1'b1}});
assign write_accepted = avm_write && !avm_waitrequest;
assign o_stall_to_fifo = !ready || avm_waitrequest;
assign o_valid = (ack_counter != {COUNTER_WIDTH{1'b0}});

endmodule

