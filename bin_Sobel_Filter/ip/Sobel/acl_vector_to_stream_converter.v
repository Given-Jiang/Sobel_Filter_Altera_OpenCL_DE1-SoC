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
    


///////////////////////////////////////////////////////////////////////////////////////////////////
//
// This module facilitates a transition between two clock domains. We assume that the input
// is provided in the clock domain in parallel (2 data sets) and is to be serialized into two
// subsequent transactions in the clock2x domain.
//
// Note that this operation consumes 3 clock2x cycles. Thus a mirror operation will have to do the
// same, or the data will become desynchronized.
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module acl_vector_to_stream_converter(
			clock, clock2x, resetn, start,
			a1, a2, b1, b2, dataa, datab,
			valid_in, valid_out, stall_in, stall_out);
	parameter WIDTH = 32;
	
  input clock, clock2x, resetn, valid_in, stall_in, start;
	input [WIDTH-1:0] a1;
  input [WIDTH-1:0] b1;
  input [WIDTH-1:0] a2;
  input [WIDTH-1:0] b2;
  output [WIDTH-1:0] dataa;
  output [WIDTH-1:0] datab;
	output valid_out;
	output stall_out;
	 
	acl_vector_to_stream_converter_single inst_a(
    .clock(clock),
    .clock2x(clock2x),
    .start(start),
    .resetn(resetn),
    .valid_in(valid_in),
    .stall_in(stall_in),
	  .a1(a1),
	  .a2(a2),
    .dataa(dataa),
	  .valid_out(valid_out),
	  .stall_out(stall_out));
    defparam inst_a.WIDTH=WIDTH;

	acl_vector_to_stream_converter_single inst_b(
    .clock(clock),
    .clock2x(clock2x),
    .start(start),    
    .resetn(resetn),
    .valid_in(valid_in),
    .stall_in(stall_in),
	  .a1(b1),
	  .a2(b2),
    .dataa(datab),
	  .valid_out(),
	  .stall_out());
    defparam inst_b.WIDTH=WIDTH;
	
endmodule
