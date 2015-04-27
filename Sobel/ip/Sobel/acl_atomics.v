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
    


module acl_atomics
(
   clock, resetn,

   // arbitration port
   mem_arb_read,
   mem_arb_write,
   mem_arb_burstcount,
   mem_arb_address,
   mem_arb_writedata,
   mem_arb_byteenable,
   mem_arb_waitrequest,
   mem_arb_readdata,
   mem_arb_readdatavalid,
   mem_arb_writeack,

   //  Avalon port
   mem_avm_read,
   mem_avm_write,
   mem_avm_burstcount,
   mem_avm_address,
   mem_avm_writedata,
   mem_avm_byteenable,
   mem_avm_waitrequest,
   mem_avm_readdata,
   mem_avm_readdatavalid,
   mem_avm_writeack
);

/*************
* Parameters *
*************/

// default parameters if host does not specify them
parameter ADDR_WIDTH=27;         // Address width
parameter DATA_WIDTH=256;        // Data width
parameter BURST_WIDTH=6;
parameter BYTEEN_WIDTH=32;
parameter OPERATION_WIDTH=32; // atomic operations are ALL 32-bit
parameter ATOMIC_OP_WIDTH=5;

parameter LATENCY=4096; // assuming we get a response back in this many cycles

/******************
* Local Variables *
******************/

localparam BYTE_SELECT_BITS=$clog2(OPERATION_WIDTH);
localparam LATENCY_BITS=$clog2(LATENCY);
localparam DATA_WIDTH_BITS=$clog2(DATA_WIDTH);

// these should match ACLIntrinsics::ID enum in ACLIntrinsics.h
localparam a_ADD=0;
localparam a_SUB=1;
localparam a_XCHG=2;
localparam a_INC=3;
localparam a_DEC=4;
localparam a_CMPXCHG=5;
localparam a_MIN=6;
localparam a_MAX=7;
localparam a_AND=8;
localparam a_OR=9;
localparam a_XOR=10;

// atomic operation states
localparam a_IDLE=0;
localparam a_STARTED=1;
localparam a_READCOMPLETE=2;
localparam a_WRITEBACK=3;

/********
* Ports *
********/

// Standard global signals
input logic clock;
input logic resetn;

// Arbitration port
input logic mem_arb_read;
input logic mem_arb_write;
input logic [BURST_WIDTH-1:0] mem_arb_burstcount;
input logic [ADDR_WIDTH-1:0] mem_arb_address;
input logic [DATA_WIDTH-1:0] mem_arb_writedata;
input logic [BYTEEN_WIDTH-1:0] mem_arb_byteenable;
output logic mem_arb_waitrequest;
output logic [DATA_WIDTH-1:0] mem_arb_readdata;
output logic mem_arb_readdatavalid;
output logic mem_arb_writeack;

// Avalon port
output mem_avm_read;
output mem_avm_write;
output [BURST_WIDTH-1:0] mem_avm_burstcount;
output [ADDR_WIDTH-1:0] mem_avm_address;
output [DATA_WIDTH-1:0] mem_avm_writedata;
output [BYTEEN_WIDTH-1:0] mem_avm_byteenable;
input mem_avm_waitrequest;
input [DATA_WIDTH-1:0] mem_avm_readdata;
input mem_avm_readdatavalid;
input mem_avm_writeack;

/**********
* Signals *
**********/

wire atomic;
reg [OPERATION_WIDTH-1:0] a_operand0;
reg [OPERATION_WIDTH-1:0] a_operand1;
reg [DATA_WIDTH_BITS-1:0] a_segment_address;
reg [ATOMIC_OP_WIDTH-1:0] a_atomic_op;
reg [BURST_WIDTH-1:0] a_burstcount;

reg [7:0] counter;

wire atomic_read_ready; // high when memory is ready to receive to a read request 
wire atomic_write_ready; // high when memory is ready to receive to a write request

reg [OPERATION_WIDTH-1:0] a_masked_readdata; 
wire [OPERATION_WIDTH-1:0] atomic_add_out;
wire [OPERATION_WIDTH-1:0] atomic_sub_out;
wire [OPERATION_WIDTH-1:0] atomic_xchg_out;
wire [OPERATION_WIDTH-1:0] atomic_inc_out;
wire [OPERATION_WIDTH-1:0] atomic_dec_out;
wire [OPERATION_WIDTH-1:0] atomic_cmpxchg_out;
wire [OPERATION_WIDTH-1:0] atomic_min_out;
wire [OPERATION_WIDTH-1:0] atomic_max_out;
wire [OPERATION_WIDTH-1:0] atomic_and_out;
wire [OPERATION_WIDTH-1:0] atomic_or_out;
wire [OPERATION_WIDTH-1:0] atomic_xor_out;
wire [OPERATION_WIDTH-1:0] atomic_out;

// count responses/requests so we can determine when the atomic load is returned
reg [LATENCY_BITS-1:0] count_requests;
reg [LATENCY_BITS-1:0] count_responses;
reg [LATENCY_BITS-1:0] count_atomic;
wire waiting_atomic_read_response;
wire atomic_read_response;

// keep track of atomic operation state
reg [1:0] atomic_state;
wire atomic_idle;
wire atomic_started;
wire atomic_read_complete;
wire atomic_writeback;

// current atomic operation we are servicing
reg [DATA_WIDTH-1:0] a_writedata;
reg [BYTEEN_WIDTH-1:0] a_byteenable;
reg [ADDR_WIDTH-1:0] a_address;

/************************************
* Read Atomic Inputs, Write Output *
************************************/

always@(posedge clock or negedge resetn)
begin

   if ( !resetn ) begin
     a_writedata <= {DATA_WIDTH{1'b0}};
     a_byteenable <= {BYTEEN_WIDTH{1'b0}};
     a_address <= {ADDR_WIDTH{1'b0}}; 
     a_operand0 <= {OPERATION_WIDTH{1'b0}};
     a_operand1 <= {OPERATION_WIDTH{1'b0}};
     a_segment_address <= {DATA_WIDTH_BITS{1'b0}};
     a_atomic_op <= {ATOMIC_OP_WIDTH{1'b0}};
     a_burstcount <= {BURST_WIDTH{1'b0}};
   end
   else if( atomic_read_ready ) begin
     a_operand0 <= mem_arb_writedata[32:1];
     a_operand1 <= mem_arb_writedata[64:33];
     a_atomic_op <= mem_arb_writedata[70:65];
     a_segment_address <= ( OPERATION_WIDTH * mem_arb_writedata[75:71]);
     a_byteenable <= mem_arb_byteenable;
     a_address <= mem_arb_address;
     a_burstcount <= mem_arb_burstcount;
   end
   else if( atomic_read_complete ) begin
     a_writedata <= ( atomic_out << a_segment_address );
   end
   else if( atomic_write_ready ) begin
     a_writedata <= {DATA_WIDTH{1'b0}};
   end
end

/*******************************
* Extract inputs from writedata *
********************************/

assign atomic = mem_arb_read & mem_arb_writedata[0:0];

/*********************************
* Arbitration/Avalon connections *
*********************************/

// mask the response
assign mem_arb_readdatavalid = mem_avm_readdatavalid;
assign mem_arb_writeack =  mem_avm_writeack;
assign mem_arb_readdata = mem_avm_readdata;

// dont send a new read/write if servicing an atomic
assign mem_avm_read = ( mem_arb_read & atomic_idle );
assign mem_avm_write = ( mem_arb_write & atomic_idle ) | atomic_writeback;
assign mem_avm_burstcount = atomic_writeback ? a_burstcount : mem_arb_burstcount;
assign mem_avm_address = atomic_writeback ? a_address : mem_arb_address;
assign mem_avm_writedata = atomic_writeback ? a_writedata : mem_arb_writedata;
assign mem_avm_byteenable = atomic_writeback ? a_byteenable : mem_arb_byteenable;

// stall IC 1. stalled by memory
//          2. when servicing an atomic
assign mem_arb_waitrequest = mem_avm_waitrequest | atomic_started | atomic_read_complete | atomic_writeback;

/****************************************
* Keep track of atomic operation states *
****************************************/

always@(posedge clock or negedge resetn)
begin

   if ( !resetn ) begin
     atomic_state <= a_IDLE;
   end
   else begin
     if( atomic_idle & atomic_read_ready ) atomic_state <= a_STARTED;
     else if( atomic_started & atomic_read_response ) atomic_state <= a_READCOMPLETE;
     else if( atomic_read_complete ) atomic_state <= a_WRITEBACK;
     else if( atomic_writeback & atomic_write_ready ) atomic_state <= a_IDLE;
   end
end

assign atomic_idle = ( atomic_state == a_IDLE );
assign atomic_started = ( atomic_state == a_STARTED );
assign atomic_read_complete = ( atomic_state == a_READCOMPLETE );
assign atomic_writeback = ( atomic_state == a_WRITEBACK );

assign atomic_read_ready = ( atomic & atomic_idle & ~mem_avm_waitrequest );
assign atomic_write_ready = ( atomic_writeback & ~mem_avm_waitrequest );

/****************************
* ALU for atomic operations *
****************************/

// read readdata from memory
always@(posedge clock or negedge resetn)
begin
   if ( !resetn ) begin
     a_masked_readdata <= {OPERATION_WIDTH{1'bx}};
   end
   else begin
     a_masked_readdata <= mem_avm_readdata[a_segment_address +: OPERATION_WIDTH];
   end
end

assign atomic_add_out = a_masked_readdata + a_operand0;
assign atomic_sub_out = a_masked_readdata - a_operand0;
assign atomic_xchg_out = a_operand0;
assign atomic_inc_out = a_masked_readdata + 1;
assign atomic_dec_out = a_masked_readdata - 1;
assign atomic_cmpxchg_out = ( a_masked_readdata == a_operand0 ) ? a_operand1 : a_masked_readdata;
assign atomic_min_out = ( a_masked_readdata < a_operand0 ) ? a_masked_readdata : a_operand0;
assign atomic_max_out = ( a_masked_readdata > a_operand0 ) ? a_masked_readdata : a_operand0;
assign atomic_and_out = ( a_masked_readdata & a_operand0 );
assign atomic_or_out = ( a_masked_readdata | a_operand0 );
assign atomic_xor_out = ( a_masked_readdata ^ a_operand0 );

// select the output based on atomic operation
assign atomic_out = 
      ( a_atomic_op == a_ADD )     ? atomic_add_out :
      ( a_atomic_op == a_SUB )     ? atomic_sub_out :
      ( a_atomic_op == a_XCHG )    ? atomic_xchg_out :
      ( a_atomic_op == a_INC )     ? atomic_inc_out :
      ( a_atomic_op == a_DEC )     ? atomic_dec_out :
      ( a_atomic_op == a_CMPXCHG ) ? atomic_cmpxchg_out :
      ( a_atomic_op == a_MIN )     ? atomic_min_out :
      ( a_atomic_op == a_MAX )     ? atomic_max_out :
      ( a_atomic_op == a_AND )     ? atomic_and_out :
      ( a_atomic_op == a_OR )      ? atomic_or_out  :
      ( a_atomic_op == a_XOR )     ? atomic_xor_out : {OPERATION_WIDTH{1'bx}};

/***********************
* Find atomic response *
***********************/

always@(posedge clock or negedge resetn)
begin

   // atomic response, clear counters
   if ( !resetn ) begin
     count_requests <= { LATENCY_BITS{1'b0} };
     count_responses <= { LATENCY_BITS{1'b0} };
     count_atomic <= {1'b0};
   end
   else begin
     
     // new read request
     if( mem_avm_read & ~mem_avm_waitrequest ) begin
       count_requests <= count_requests + mem_arb_burstcount;
     end

     // new read response
     if( mem_avm_readdatavalid ) begin
       count_responses <= count_responses + 1;
     end

     // new read atomic request
     if( atomic_read_ready ) begin
       count_atomic <= count_requests;
     end

   end
end

// we already sent a request for an atomic
// the next response will be for atomic
assign waiting_atomic_read_response = atomic_started & ( count_atomic == count_responses );

assign atomic_read_response = ( waiting_atomic_read_response & mem_avm_readdatavalid );

endmodule
