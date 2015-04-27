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
    


module vfabric_buffered_fifo(clock, resetn, 
  data_in, valid_in, stall_out, 
  data_out, valid_out, stall_in);

parameter DATA_WIDTH = 32;
parameter DEPTH = 64;
parameter EXTRA_FIFO_SPACE = 32; //256;
parameter IMPLEMENTATION_MODE = "MLAB";

localparam REAL_DEPTH=DEPTH-EXTRA_FIFO_SPACE; 

 input clock, resetn;
 input [DATA_WIDTH-1:0] data_in;
 input valid_in;
 output stall_out;
 output [DATA_WIDTH-1:0] data_out;
 output valid_out;
 input stall_in;

 wire fifo_almost_full;

generate
if (IMPLEMENTATION_MODE == "RAM")
begin
 
  acl_fifo fifo_a ( .clock(clock), .resetn(resetn), 
      .data_in(data_in), .data_out(data_out), .valid_in(valid_in),
      .valid_out( valid_out ), .stall_in(stall_in), .stall_out(),
      .almost_full( fifo_almost_full ) );
  defparam fifo_a.DATA_WIDTH = DATA_WIDTH;
  defparam fifo_a.DEPTH = DEPTH;
  defparam fifo_a.ALMOST_FULL_VALUE = REAL_DEPTH;
end
else
begin

  acl_mlab_fifo fifo_a ( .clock(clock), .resetn(resetn), 
      .data_in(data_in), .data_out(data_out), .valid_in(valid_in),
      .valid_out( valid_out ), .stall_in(stall_in), .stall_out(),
      .almost_full( fifo_almost_full ) );
  defparam fifo_a.DATA_WIDTH = DATA_WIDTH;
  defparam fifo_a.DEPTH = DEPTH;
  defparam fifo_a.ALMOST_FULL_VALUE = REAL_DEPTH;
 
end
endgenerate

 assign stall_out = fifo_almost_full;

endmodule
