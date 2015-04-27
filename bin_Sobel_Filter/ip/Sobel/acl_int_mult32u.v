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
module acl_int_mult32u (
	enable,
	clock,
	dataa,
	datab,
	result);

    parameter INPUT1_WIDTH = 32;
    parameter INPUT2_WIDTH = 32;

	input	  enable;
	input	  clock;
	input	[INPUT1_WIDTH - 1 : 0]  dataa;
	input	[INPUT2_WIDTH - 1 : 0]  datab;
	output reg[31:0]  result;

	wire [INPUT1_WIDTH + INPUT2_WIDTH - 1 : 0] sub_wire0;

	lpm_mult	lpm_mult_component (
				.clock (clock),
				.datab (datab),
				.clken (enable),
				.dataa (dataa),
				.result (sub_wire0),
				.aclr (1'b0),
				.sum (1'b0));
	defparam
		lpm_mult_component.lpm_hint = "MAXIMIZE_SPEED=9",
		lpm_mult_component.lpm_pipeline = 3,
		lpm_mult_component.lpm_representation = "UNSIGNED",
		lpm_mult_component.lpm_type = "LPM_MULT",
		lpm_mult_component.lpm_widtha = INPUT1_WIDTH,
		lpm_mult_component.lpm_widthb = INPUT2_WIDTH,
		lpm_mult_component.lpm_widthp = INPUT1_WIDTH + INPUT2_WIDTH;

  always@(posedge clock)
  begin
    if (enable)
      result <= {0, sub_wire0[INPUT1_WIDTH + INPUT2_WIDTH - 1 : 0]};
  end

endmodule

