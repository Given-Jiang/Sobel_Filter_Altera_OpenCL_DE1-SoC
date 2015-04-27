
// This module converts a singed or an unsigned integer into a floating point number.
module acl_fp_convert_from_int(clock, resetn, dataa, result, enable, valid_in, valid_out, stall_in, stall_out);
	parameter UNSIGNED = 0;
	parameter HIGH_CAPACITY = 1;
	parameter ROUNDING_MODE = 0;	
    // 0 - round to nearest even
    // 1 - round to nearest with ties away from zero
    // 2 - round towards zero (truncation)
    // 3 - round up
    // 4 - round down	
	
	input clock, resetn;
	input [31:0] dataa;
	output [31:0] result;
	input enable, valid_in, stall_in;
	output valid_out, stall_out;
	
	reg c1_valid;
	wire c1_stall;
	wire c1_enable;
	reg c2_valid;
	wire c2_stall;
	wire c2_enable;
	reg c3_valid;
	wire c3_stall;
	wire c3_enable;
	reg c4_valid;
	wire c4_stall;
	wire c4_enable;
	reg c5_valid;
	wire c5_stall;
	wire c5_enable;	
	
	// Cycle 1 - convert the number to an appropriately signed value and determine the sign of the resulting number.
	reg [31:0] c1_value_to_convert;
	reg c1_sign;
	assign c1_enable = (HIGH_CAPACITY == 1) ? (~c1_valid | ~c1_stall) : enable;
	assign stall_out = c1_valid & c1_stall;
	
	always@(posedge clock or negedge resetn)
	begin
		if (~resetn)
		begin
			c1_valid <= 1'b0;
			c1_sign <= 1'bx;
			c1_value_to_convert <= 32'dx;
		end
		else if (c1_enable)
		begin
			c1_valid <= valid_in;
			
			if (UNSIGNED == 1)
			begin
				c1_sign <= 1'b0;
				c1_value_to_convert <= dataa;
			end
			else
			begin
				c1_sign <= dataa[31];
				// Convert the value to be positive prior to conversion
				c1_value_to_convert <= (dataa ^ {32{dataa[31]}}) + {1'b0, dataa[31]};
			end
		end
	end
	
	// Cycle 2 - initial shifting to determine the magnitude of the number
	reg [31:0] c2_value_to_convert;
	reg [7:0] c2_exponent;
	reg c2_sign, c2_done;
	assign c2_enable = (HIGH_CAPACITY == 1) ? (~c2_valid | ~c2_stall) : enable;
	assign c1_stall = c2_valid & c2_stall;	
	
	wire top_bits_0 = ~(|c1_value_to_convert[31:16]);
	wire bottom_bits_0 = ~(|c1_value_to_convert[15:0]);
	
	always@(posedge clock or negedge resetn)
	begin
		if (~resetn)
		begin
			c2_valid <= 1'b0;
			c2_value_to_convert <= 32'dx;
			c2_exponent <= 8'dx;
			c2_sign <= 1'bx;
			c2_done <= 1'bx;
		end
		else if (c2_enable)
		begin
			c2_valid <= c1_valid;
			c2_sign <= c1_sign;
   		c2_done <= top_bits_0 & bottom_bits_0;			
			if (top_bits_0 & bottom_bits_0)
			begin
				c2_exponent <= 8'd0;
				c2_value_to_convert <= c1_value_to_convert;
			end
			else if (top_bits_0)
			begin
				c2_exponent <= 8'd142; // = 8'd158 - 8'd16;
				c2_value_to_convert <= {c1_value_to_convert[15:0], 16'd0};
			end
			else
			begin
				c2_exponent <= 8'd158;
				c2_value_to_convert <= c1_value_to_convert;
			end
		end
	end
	
	// Cycle 3 - second stage of shifting
	reg [31:0] c3_value_to_convert;
	reg [7:0] c3_exponent;
	reg c3_sign, c3_done;
	assign c3_enable = (HIGH_CAPACITY == 1) ? (~c3_valid | ~c3_stall) : enable;
	assign c2_stall = c3_valid & c3_stall;	
	
	wire top_12bits_0 = ~(|c2_value_to_convert[31:20]);
	wire top_8bits_0 = ~(|c2_value_to_convert[31:24]);
	wire top_4bits_0 = ~(|c2_value_to_convert[31:28]);
	
	reg [1:0] c3_exp_adjust;
	always@(*)
	begin
		if (top_12bits_0 & ~c2_done)
			c3_exp_adjust = 2'd3;
		else if (top_8bits_0 & ~c2_done)
			c3_exp_adjust = 2'd2;
		else if (top_4bits_0 & ~c2_done)
			c3_exp_adjust = 2'd1;
		else
			c3_exp_adjust = 2'd0;
	end
	
	always@(posedge clock or negedge resetn)
	begin
		if (~resetn)
		begin
			c3_valid <= 1'b0;
			c3_value_to_convert <= 32'dx;
			c3_exponent <= 8'dx;
			c3_sign <= 1'bx;
			c3_done <= 1'bx;
		end
		else if (c3_enable)
		begin
			c3_valid <= c2_valid;
			c3_sign <= c2_sign;
			c3_done <= c2_done;
			c3_exponent <= c2_exponent - {1'b0, c3_exp_adjust, 2'd0};
			case (c3_exp_adjust)
				2'b11: c3_value_to_convert <= {c2_value_to_convert[19:0], 12'd0};
				2'b10: c3_value_to_convert <= {c2_value_to_convert[23:0], 8'd0};
				2'b01: c3_value_to_convert <= {c2_value_to_convert[27:0], 4'd0};
				2'b00: c3_value_to_convert <= c2_value_to_convert;
			endcase
		end
	end	

	// Cycle 4 - Last stage of shifting
	reg [31:0] c4_value_to_convert;
	reg [7:0] c4_exponent;
	reg c4_sign;
	assign c4_enable = (HIGH_CAPACITY == 1) ? (~c4_valid | ~c4_stall) : enable;
	assign c3_stall = c4_valid & c4_stall;	
	
	wire top_3bits_0 = ~(|c3_value_to_convert[31:29]);
	wire top_2bits_0 = ~(|c3_value_to_convert[31:30]);
	wire top_1bits_0 = ~(c3_value_to_convert[31]);
	
	reg [1:0] c4_exp_adjust;
	always@(*)
	begin
		if (top_3bits_0 & ~c3_done)
			c4_exp_adjust = 2'd3;
		else if (top_2bits_0 & ~c3_done)
			c4_exp_adjust = 2'd2;
		else if (top_1bits_0 & ~c3_done)
			c4_exp_adjust = 2'd1;
		else
			c4_exp_adjust = 2'd0;
	end
	
	always@(posedge clock or negedge resetn)
	begin
		if (~resetn)
		begin
			c4_valid <= 1'b0;
			c4_value_to_convert <= 32'dx;
			c4_exponent <= 8'dx;
			c4_sign <= 1'bx;
		end
		else if (c4_enable)
		begin
			c4_valid <= c3_valid;
			c4_sign <= c3_sign;
			c4_exponent <= c3_exponent - {1'b0, c4_exp_adjust};
			case (c4_exp_adjust)
				2'b11: c4_value_to_convert <= {c3_value_to_convert[28:0], 3'd0};
				2'b10: c4_value_to_convert <= {c3_value_to_convert[29:0], 2'd0};
				2'b01: c4_value_to_convert <= {c3_value_to_convert[30:0], 1'd0};
				2'b00: c4_value_to_convert <= c3_value_to_convert;
			endcase
		end
	end	
	
	// Cycle 5 - Rounding stage
	reg [22:0] c5_mantissa;
	reg [7:0] c5_exponent;
	reg c5_sign;
	
	assign c5_enable = (HIGH_CAPACITY == 1) ? (~c5_valid | ~c5_stall) : enable;
	assign c4_stall = c5_valid & c5_stall;	
	wire [3:0] c5_bottom_4 = {c4_value_to_convert[8:6], |c4_value_to_convert[5:0]};
	reg [24:0] c5_temp_mantissa;
    // 1 - round to nearest with ties away from zero
    // 2 - round towards zero (truncation)
    // 3 - round up
    // 4 - round down	
	always@(*)
	begin
		case (ROUNDING_MODE)
			4: // 4 - round down (towards -infinity)
			begin
				if (UNSIGNED == 1)
				begin
					c5_temp_mantissa <= {1'b0, c4_value_to_convert[31:8]};
				end
				else
				begin		
					if (|c5_bottom_4[2:0] & c4_sign)
						c5_temp_mantissa <= {1'b0, c4_value_to_convert[31:8]} + 1'b1;
					else
						c5_temp_mantissa <= {1'b0, c4_value_to_convert[31:8]};
				end
			end
		
			3: // 3 - round up (towards +infinity)
			begin
				if (UNSIGNED == 1)
				begin
					if (|c5_bottom_4[2:0])
						c5_temp_mantissa <= {1'b0, c4_value_to_convert[31:8]} + 1'b1;
					else
						c5_temp_mantissa <= {1'b0, c4_value_to_convert[31:8]};
				end
				else
				begin		
					if (|c5_bottom_4[2:0] & ~c4_sign)
						c5_temp_mantissa <= {1'b0, c4_value_to_convert[31:8]} + 1'b1;
					else
						c5_temp_mantissa <= {1'b0, c4_value_to_convert[31:8]};
				end
			end

   		2: // 2 - round towards zero (truncation)
			begin
				c5_temp_mantissa <= {1'b0, c4_value_to_convert[31:8]};
			end
			
			1: // 1 - round to nearest with ties away from zero
			begin
				if (c5_bottom_4[2])
					c5_temp_mantissa <= {1'b0, c4_value_to_convert[31:8]} + 1'b1;
				else
					c5_temp_mantissa <= {1'b0, c4_value_to_convert[31:8]};
			end

  		   default: // 0 and default are round to nearest-even.
			begin
				if ((&c5_bottom_4[3:2]) || (c5_bottom_4[2] & |c5_bottom_4[1:0]))
					c5_temp_mantissa <= {1'b0, c4_value_to_convert[31:8]} + 1'b1;
				else
					c5_temp_mantissa <= {1'b0, c4_value_to_convert[31:8]};
			end
		endcase	
	end
	
	always@(posedge clock or negedge resetn)
	begin
		if (~resetn)
		begin
			c5_valid <= 1'b0;
			c5_mantissa <= 32'dx;
			c5_exponent <= 8'dx;
			c5_sign <= 1'bx;
		end
		else if (c5_enable)
		begin
			c5_valid <= c4_valid;
			c5_sign <= c4_sign;
			c5_exponent <= c4_exponent + c5_temp_mantissa[24];
			c5_mantissa <= c5_temp_mantissa[24] ? c5_temp_mantissa[23:1] :  c5_temp_mantissa[22:0];
		end
	end	

	assign c5_stall = stall_in;
	assign result = {c5_sign, c5_exponent, c5_mantissa};
	assign valid_out = c5_valid;
endmodule

