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
// This module defines the LDEXP function, which multiplies a floating point number by 2^(shift_in).
// The result is a valid floating point number within single-precision range, +/- INF or 0.
// If a denormalized number is supplied as input, the result will be zero (until we add denormalized 
// number support).
//
module acl_fp_ldexp_double_hc(clock, resetn, dataa, datab, valid_in, valid_out, stall_in, stall_out, result);
	input clock, resetn;
	input [63:0] dataa;
	input [31:0] datab;
	input valid_in, stall_in;
	output valid_out, stall_out;
	output [63:0] result;
	
	// Cycle 1: Test inputs and compute resulting exponents.
	wire [10:0] exponent_in = dataa[62:52];
	wire [51:0] mantissa_in = dataa[51:0];
	wire sign_in = dataa[63];
	wire [31:0] shift_in = datab;
	wire [31:0] intermediate_exp = shift_in + {1'b0, exponent_in};
	
	reg [10:0] exp_stage_1;
	reg [51:0] man_stage_1;
	reg sign_stage_1;
	reg stage_1_valid;
	wire enable_stage_1;
	
	always@(posedge clock or negedge resetn)
	begin
		if (~resetn)
		begin
			exp_stage_1 <= 11'dx;
			man_stage_1 <= 52'dx;
			sign_stage_1 <= 1'bx;
			stage_1_valid <= 1'b0;
		end
		else if (enable_stage_1)
		begin
			stage_1_valid <= valid_in;
			sign_stage_1 <= sign_in;
			if (exponent_in == 11'h7ff)
			begin
			   // NaN / Inf input, so produce an NaN / Inf output.
				man_stage_1 <= mantissa_in;
				exp_stage_1 <= exponent_in;
			end
			else
		  if (intermediate_exp[31] | (exponent_in == 11'd0))
			begin
        // This flushes denorms to zero, even is a denorm is an input to this module.
				man_stage_1 <= 52'd0;
				exp_stage_1 <= 11'd0;
			end
			else if ({1'b0, intermediate_exp[30:0]} >= 12'h7ff)
			begin
				// infinity
				man_stage_1 <= 52'd0;
				exp_stage_1 <= 11'h7ff;				
			end
			else if (intermediate_exp[10:0] == 11'd0)
			begin
				// If exponent ends up at 0, then flush the result to 0.
        // This is the flushing of a denorm to zero after the ldexp operation.
				man_stage_1 <= 52'd0;
				exp_stage_1 <= 11'd0;				
			end			
			else
			begin
				man_stage_1 <= mantissa_in;
				exp_stage_1 <= intermediate_exp[10:0];
			end
		end
	end
	
	assign enable_stage_1 = ~stage_1_valid | ~stall_in;
	assign valid_out = stage_1_valid;
	assign stall_out = stage_1_valid & stall_in;
	assign result = {sign_stage_1, exp_stage_1, man_stage_1};
endmodule
