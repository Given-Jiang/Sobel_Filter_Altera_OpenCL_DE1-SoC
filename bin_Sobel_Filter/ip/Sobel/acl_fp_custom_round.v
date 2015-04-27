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
    


// This module performs a rounding of a floating-point number.

module acl_fp_custom_round(
			clock, resetn, mantissa, exponent, sign, mantissa_out, exponent_out, sign_out,
			valid_in, valid_out, stall_in, stall_out, enable);
			
		parameter HIGH_CAPACITY = 1;
		parameter FLUSH_DENORMS = 0;
		parameter HIGH_LATENCY = 1;			
		parameter ROUNDING_MODE = 0;

		input clock, resetn;
		input stall_in, valid_in;
		output stall_out, valid_out;
		input enable;
		
		// Data in
		input [27:0] mantissa;
		input [8:0] exponent; // Exponent with MSB set to 1 is an exception.
		input sign;
		
		// Data output
		output [27:0] mantissa_out; // When mantissa_out[25] = 1 and exponent_out[8] == 1 then the number is NaN.
		output [8:0] exponent_out; // Exponent with MSB set to 1 is an exception.
		output sign_out;

		reg c1_valid;
		reg c2_valid;
		wire c1_stall;
		wire c2_stall;
		wire c1_enable;
		wire c2_enable;
		
		// Cycle 1 - first check for overflow. Shift data right by one bit if this is the case.
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c1_mantissa;
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c1_exponent;
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_sign;
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_rounding_required;
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_exponent_is_max;
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_exponent_is_nonzero;
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_input_man_27;
		
		assign c1_enable = (HIGH_CAPACITY == 1) ? (~c1_valid | ~c1_stall) : enable;
		assign stall_out = c1_valid & c1_stall;
		
		always@(posedge clock or negedge resetn)
		begin
			if (~resetn)
			begin
				c1_mantissa <= 27'dx;
				c1_exponent <= 9'dx;
				c1_sign <= 1'bx;
				c1_rounding_required <= 1'bx;
				c1_exponent_is_max <= 1'bx;
				c1_exponent_is_nonzero <= 1'bx;
				c1_input_man_27 <= 1'bx;
				c1_valid <= 1'b0;
			end
			else if (c1_enable)
			begin
				c1_valid <= valid_in;
				c1_sign <= sign;
				c1_exponent_is_max <= (&exponent[7:1]) & ~exponent[0];
				c1_exponent_is_nonzero <= |exponent[7:0];
				c1_input_man_27 <= mantissa[27];
				
				// Here is where we decide on when to round. In ROUND_TO_NEAREST mode, we need to round
				// when shifting to the left does not move all of 1 out of guard, round and sticky bits.
				if ((exponent[8]) || (~mantissa[27] && (mantissa[26:24] == 3'b000) && (exponent[7:0] >= 8'd4)) ||
				    (mantissa[27] && (&exponent[7:1])))
					c1_rounding_required <= 1'b0;
				else
					c1_rounding_required <= 1'b1;	
					
				// I am going to split this computation over two clock cycles.
				if (exponent[8] || ~mantissa[27])
					c1_mantissa <= mantissa[26:0];
				else
					c1_mantissa <= {mantissa[27:2], |mantissa[1:0]};
				
				if (mantissa[27] & &exponent[7:1] & ~exponent[8])
					c1_exponent <= 9'h1ff;
				else
					c1_exponent <= exponent;				
			end
		end
		
		// Cycle 2 - Compute any necessary rounding and apply it.
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [27:0] c2_mantissa;
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c2_exponent;
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [2:0] rounding_value;
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c2_sign;
		
		assign c2_enable = (HIGH_CAPACITY == 1) ? (~c2_valid | ~c2_stall) : enable;
		assign c1_stall = c2_valid & c2_stall;
		
		always@(*)
		begin
			if (c1_rounding_required)
			begin
			   // If we need rounding then the nice thing is that we know a shift of at most 4 will take place.
				if (c1_mantissa[26] && (c1_mantissa[2]) && (c1_mantissa[3] | (|c1_mantissa[1:0])))
				begin
					rounding_value = 3'b100;
				end
				else if (c1_mantissa[25] && (c1_mantissa[1]) && (c1_mantissa[2] | (c1_mantissa[0])))
				begin
					rounding_value = 3'b010;
				end
				else if (c1_mantissa[24] && (c1_mantissa[0] & c1_mantissa[1]))
				begin
					rounding_value = 3'b001;
				end
				else
				begin
					rounding_value = 3'b000;
				end
			end
			else
			begin
			   // If no rounding is needed, then we can shift the mantissa by 4 positions if it is possible.
				rounding_value = 3'b000;
			end
		end
		
		always@(posedge clock or negedge resetn)
		begin
			if (~resetn)
			begin
				c2_mantissa <= 28'dx;
				c2_exponent <= 9'dx;
				c2_sign <= 1'bx;
				c2_valid <= 1'b0;			
			end
			else if (c2_enable)
			begin
			   c2_valid <= c1_valid;
			   c2_sign <= c1_sign;
				
				if (c1_exponent_is_max & c1_input_man_27)
					c2_mantissa <= 28'd0;
				else
					c2_mantissa <= c1_mantissa + rounding_value;
				
				if (c1_exponent[8])
					c2_exponent <= c1_exponent;
				else
					c2_exponent <= c1_exponent + {1'b0, c1_input_man_27 & ~c1_exponent_is_nonzero,
																	c1_input_man_27 & c1_exponent_is_nonzero | ~c1_input_man_27 & c1_mantissa[26] & ~c1_exponent_is_nonzero};				
			end
		end	
	
		assign mantissa_out = c2_mantissa;
		assign exponent_out = c2_exponent;
		assign sign_out = c2_sign;	 
		assign valid_out = c2_valid;
		assign c2_stall = stall_in;
endmodule
		
			
