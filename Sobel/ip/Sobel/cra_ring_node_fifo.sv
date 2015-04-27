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
    


/* This module translates between an Avalon-MM slave with a waitrqeuest
 * to the CRA-ring protocol.  The CRA-ring obeys Avalon-MM except that 
 * there is a delay of STALL_TO_VALID_LATENCY cycles after wait request
 * is asserted until there are guaranteed to be no more valid requests.
 */
module cra_ring_node_fifo #(
  parameter integer CRA_ADDR_W = 32,
  parameter integer DATA_W = 32,
  parameter integer STALL_TO_VALID_LATENCY = 1
)
(
  // clock/reset
  input logic clk,
  input logic rst_n,

  // avalon-master port
  output logic avm_read,
  output logic avm_write,
  output logic [CRA_ADDR_W-1:0] avm_addr,
  output logic [DATA_W/8-1:0] avm_byteena,
  output logic [DATA_W-1:0] avm_writedata,
  input logic [DATA_W-1:0] avm_readdata,
  input logic avm_readdatavalid,
  input logic avm_waitrequest,

  // avalon-slave port
  input logic avs_read,
  input logic avs_write,
  input logic [CRA_ADDR_W-1:0] avs_addr,
  input logic [DATA_W/8-1:0] avs_byteena,
  input logic [DATA_W-1:0] avs_writedata,
  output logic [DATA_W-1:0] avs_readdata,
  output logic avs_readdatavalid,
  output logic avs_waitrequest
);

function integer my_local_log;
input [31:0] value;
  for (my_local_log=0; value>0; my_local_log=my_local_log+1)
    value = value>>1;
endfunction		

// Report that the FIFO is almost full once we have 4 items inside.  Selecting
// at least 3 allows us to avoid stalling during normal operation (due to
// write->q latency of 2 cycles + 1 cycle of pipelined waitrequest + 1)
localparam ALMOST_FULL_VALUE = 4;
// FIFO needs enough space for STALL_TO_VALID_LATENCY once waitrequest is
// asserted
localparam FIFO_DEPTH = STALL_TO_VALID_LATENCY + ALMOST_FULL_VALUE;
// FIFO width is the width of all control signals, see assignment to
// fifo_data_in for breakdown of signals
localparam FIFO_WIDTH = CRA_ADDR_W + DATA_W/8 + DATA_W + 1 + 1;
localparam NUM_BITS_USED_WORDS = FIFO_DEPTH == 1 ? 1 : my_local_log(FIFO_DEPTH-1);

wire empty;
wire almost_full;
wire [FIFO_WIDTH-1:0] fifo_data_in;
wire [FIFO_WIDTH-1:0] fifo_data_out;

assign fifo_data_in = {avs_addr, avs_byteena, avs_writedata, avs_read, avs_write};
assign {avm_addr, avm_byteena, avm_writedata, avm_read, avm_write} = fifo_data_out & {FIFO_WIDTH{!empty}};

// Avalon connections
always@(posedge clk or negedge rst_n) begin
  if(rst_n == 1'b0) begin
    avs_readdata <= 'x;
    avs_readdatavalid <= 1'b0;
    avs_waitrequest <= 1'b0;
  end else begin
    avs_readdata <= avm_readdata;
    avs_readdatavalid <= avm_readdatavalid;
    avs_waitrequest <= avm_waitrequest || almost_full;
  end
end

// The FIFO to store any requests flushed during waitrequest cycles
scfifo	scfifo_component (
      .clock  (clk),
      .aclr   (!rst_n),
      .data   (fifo_data_in),
      .q      (fifo_data_out),
      .rdreq  ((!avm_waitrequest) && (!empty)),
      .wrreq  ((avs_read || avs_write)),
      .empty  (empty),
      .almost_full  (almost_full));
defparam
  scfifo_component.add_ram_output_register = "ON",
  scfifo_component.intended_device_family = "Stratix V",
  scfifo_component.lpm_numwords = FIFO_DEPTH,
  scfifo_component.lpm_showahead = "ON",
  scfifo_component.lpm_type = "scfifo",
  scfifo_component.lpm_width = FIFO_WIDTH,
  scfifo_component.lpm_widthu = NUM_BITS_USED_WORDS,
  scfifo_component.overflow_checking = "OFF",
  scfifo_component.underflow_checking = "OFF",
  scfifo_component.use_eab = "ON",
  scfifo_component.almost_full_value = ALMOST_FULL_VALUE;

endmodule

