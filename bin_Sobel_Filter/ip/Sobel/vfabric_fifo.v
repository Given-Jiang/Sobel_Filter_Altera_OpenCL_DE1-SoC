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
    


module vfabric_fifo(clock, resetn, 
  i_datain, i_datain_valid, o_datain_stall, 
  o_dataout, o_dataout_valid, i_dataout_stall);

parameter DATA_WIDTH = 32;
parameter FIFO_DEPTH = 512;

localparam IMPL_MODE = (DATA_WIDTH == 1) ? "MLAB" : "RAM";

  input clock, resetn;
  input [DATA_WIDTH-1:0] i_datain;
  input i_datain_valid;
  output o_datain_stall;
  output [DATA_WIDTH-1:0] o_dataout;
  output o_dataout_valid;
  input i_dataout_stall;
  
  vfabric_buffered_fifo fifo0 ( .clock(clock), .resetn(resetn), 
    .data_in(i_datain), .data_out(o_dataout), .valid_in(i_datain_valid),
    .valid_out( o_dataout_valid ), .stall_in(i_dataout_stall), 
    .stall_out(o_datain_stall) );
  defparam fifo0.DATA_WIDTH = DATA_WIDTH;
  defparam fifo0.DEPTH = FIFO_DEPTH;
  defparam fifo0.EXTRA_FIFO_SPACE = 32;
  defparam fifo0.IMPLEMENTATION_MODE = IMPL_MODE;
 
endmodule
