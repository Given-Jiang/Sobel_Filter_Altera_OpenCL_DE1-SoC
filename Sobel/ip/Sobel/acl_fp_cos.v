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
    



// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module acl_fp_cos (
	enable,
	clock,
	dataa,
  resetn,
	result);

	input	  enable;
	input	  clock;
  input resetn;
	input	[31:0]  dataa;
	output	[31:0]  result;

	wire [31:0] sub_wire0;
	wire [31:0] result = sub_wire0[31:0];

  fp_cos fpc_cos(
      .sysclk(clock),
      .reset(~resetn),
      .enable(enable),
      .signin(dataa[31]),
      .exponentin(dataa[30:23]),
      .mantissain(dataa[22:0]),
      .signout(sub_wire0[31]),
      .exponentout(sub_wire0[30:23]),
      .mantissaout(sub_wire0[22:0])
     );

endmodule

