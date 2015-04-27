// (C) 1992-2012 Altera Corporation. All rights reserved.                         
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
    


module acl_fp_custom_add_op_double(	clock, resetn, left_mantissa, right_mantissa, left_sign, right_sign, common_exponent,
										resulting_mantissa, resulting_exponent, resulting_sign,
										valid_in, valid_out, stall_in, stall_out, enable);

	parameter HIGH_CAPACITY = 1;
	
	// Latency = 1 cycle.
	input clock, resetn, left_sign, right_sign;
	input [55:0] left_mantissa;
	input [55:0] right_mantissa;
	input [11:0] common_exponent;
	input valid_in, stall_in, enable;
	(* altera_attribute = "-name auto_shift_register_recognition OFF" *) output reg [56:0] resulting_mantissa;
	(* altera_attribute = "-name auto_shift_register_recognition OFF" *) output reg [11:0] resulting_exponent;
	(* altera_attribute = "-name auto_shift_register_recognition OFF" *) output reg resulting_sign;
	(* altera_attribute = "-name auto_shift_register_recognition OFF" *) output reg valid_out;
	output stall_out;
	
	wire enable_add = (HIGH_CAPACITY==1) ? (~valid_out | ~stall_in) : enable;
	wire do_subtraction = right_sign ^ left_sign;
	assign stall_out = valid_out & stall_in;
	wire [56:0] op_ab = {1'b0, left_mantissa} + ({57{do_subtraction}} ^ {1'b0, right_mantissa}) + do_subtraction;
	
	always@(posedge clock or negedge resetn)
	begin
		if (~resetn)
		begin
			resulting_mantissa <= 57'dx;
			resulting_exponent <= 12'dx;
			resulting_sign <= 1'bx;
			valid_out <= 1'b0;
		end
		else if (enable_add)
		begin
			valid_out <= valid_in;
			resulting_mantissa <= op_ab;
			resulting_exponent <= common_exponent;
			resulting_sign <= left_sign;
		end
	end
	
endmodule

