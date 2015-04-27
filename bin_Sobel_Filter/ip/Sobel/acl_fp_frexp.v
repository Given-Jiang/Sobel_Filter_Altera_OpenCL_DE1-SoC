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
    


// This module implements frexp function specified in the OpenCL 1.0 specification.
// It takes as input a floating point number (x), single or double precision, and returns
// a single or double precision number that represents the fraction (r) of the supplied floating point number
// in the range of [0.5, 1) or 0 and an integer (n) that represents the exponent of the input value.
//
// The result of the operation must be such that x = r*2^n.
// Notes:
// - Denormalized numbers are flushed to 0.
// - if the number is infinity or a nan, the returned fraction is the original input and the exponent is 32'd0.

module acl_fp_frexp( clock, resetn, enable, valid_in, valid_out, stall_in, stall_out, dataa, result_fr, result_exp);

	parameter WIDTH = 32;
	parameter HIGH_CAPACITY = 1;
	
	input clock, resetn;
	input enable, valid_in, stall_in;
	output valid_out, stall_out;
	input [WIDTH-1:0] dataa;
	output [WIDTH-1:0] result_fr;
	output [31:0] result_exp;
	
	// Simply extract the mantissa and at the most shift it to the right by one position.
	reg c1_valid;
	wire c1_stall;
	wire c1_enable = (HIGH_CAPACITY == 1) ? (~c1_valid | ~c1_stall) : enable;
	assign stall_out = c1_valid & c1_stall;
	reg [WIDTH-1:0] c1_fraction;
	reg [31:0] c1_exponent;
	
	always@(posedge clock or negedge resetn)
	begin
		if (~resetn)
		begin
		end
		else if (c1_enable)
		begin
			c1_valid <= valid_in;
			if (WIDTH==32)
			begin
			  if (~(|dataa[WIDTH-2:WIDTH-9]))
				begin
					c1_fraction <= 32'd0;
					c1_exponent <= 32'd0;
				end
        else if (&dataa[WIDTH-2:WIDTH-9])
				begin
					c1_fraction <= dataa;
					c1_exponent <= 32'd0;
				end
				else
				begin
					c1_fraction <= {dataa[WIDTH-1], 8'h7e, dataa[WIDTH-10:0]};
					c1_exponent <= {1'b0, dataa[WIDTH-2:WIDTH-9]} - 9'd126;
				end
			end
			else
			begin
			  if (~(|dataa[WIDTH-2:WIDTH-12]))
				begin
					c1_fraction <= 64'd0;
					c1_exponent <= 32'd0;
				end
				else
			  if (&dataa[WIDTH-2:WIDTH-12])
				begin
					c1_fraction <= dataa;
					c1_exponent <= 32'd0;
				end
				else
				begin
					c1_fraction <= {dataa[WIDTH-1], 11'h3fe, dataa[WIDTH-13:0]};
					c1_exponent <= {1'b0, dataa[WIDTH-2:WIDTH-12]} - 12'd1022;
				end
			end			
		end
	end
	
	assign c1_stall = stall_in;
	assign valid_out = c1_valid;
	assign result_fr = c1_fraction;
	assign result_exp = c1_exponent;	
	
endmodule
