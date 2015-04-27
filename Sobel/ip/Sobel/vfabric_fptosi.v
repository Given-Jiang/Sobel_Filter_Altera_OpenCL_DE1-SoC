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
    


module vfabric_fptosi(clock, resetn, 
    i_datain, i_datain_valid, o_datain_stall, 
    o_dataout, i_dataout_stall, o_dataout_valid);

parameter DATA_WIDTH = 32;
parameter LATENCY = 3;
parameter FIFO_DEPTH = 64;

  input clock, resetn;
  input [DATA_WIDTH-1:0] i_datain;
  input i_datain_valid;
  output o_datain_stall;
  output [DATA_WIDTH-1:0] o_dataout;
  input i_dataout_stall;
  output o_dataout_valid;
  
  reg [LATENCY-1:0] shift_reg_valid;
  wire [DATA_WIDTH-1:0] fifo_dataout;
  wire fifo_dataout_valid;
  wire is_stalled;
  wire is_fifo_stalled;
   
  vfabric_buffered_fifo fifo_in ( .clock(clock), .resetn(resetn), 
      .data_in(i_datain), .data_out(fifo_dataout), .valid_in(i_datain_valid),
      .valid_out( fifo_dataout_valid ), .stall_in(is_fifo_stalled), .stall_out(o_datain_stall) );
  defparam fifo_in.DATA_WIDTH = DATA_WIDTH;
  defparam fifo_in.DEPTH = FIFO_DEPTH;
  
  acl_fp_fptosi fp2si( .clock(clock), .enable(~is_stalled), 
	    .resetn(resetn), .dataa(fifo_dataout), .result(o_dataout));

  always @(posedge clock or negedge resetn)
  begin
  if (~resetn)
    begin
    shift_reg_valid <= {LATENCY{1'b0}};
  end
  else
  begin
    if(~is_stalled)
      shift_reg_valid <= { fifo_dataout_valid, shift_reg_valid[LATENCY-1:1] };
  end
  end
  
  assign is_stalled = (shift_reg_valid[0] & i_dataout_stall);
  assign is_fifo_stalled = (shift_reg_valid[0] & i_dataout_stall) | ~fifo_dataout_valid;
  
  assign o_dataout_valid = shift_reg_valid[0];
 
endmodule
