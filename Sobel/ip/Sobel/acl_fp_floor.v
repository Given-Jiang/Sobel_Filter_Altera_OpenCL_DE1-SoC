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
    


module acl_fp_floor(clock, resetn, enable, dataa, result);
	input clock, resetn, enable;
	input [31:0] dataa;
	output [31:0] result;
	
	// Cycle 1: Store inputs in registers.
	reg sign_in;
	reg [7:0] exp_in;
	reg [22:0] man_in;
	
	always@(posedge clock or negedge resetn)
	begin
		if (~resetn)
		begin
			sign_in <= 1'b0;
			exp_in <= 8'd0;
			man_in <= 23'd0;
		end
		else if (enable)
		begin
			sign_in <= dataa[31];
			exp_in <= dataa[30:23];
			man_in <= dataa[22:0];			
		end
	end
	
	// Cycle 2: First determine if there is any fractional part in this value
	reg sign_1;
	reg [7:0] exp_1;
	reg [24:0] man_1;
	reg is_fraction;
	reg zero_exponent;
	reg [24:0] addition;
	always@(posedge clock or negedge resetn)
	begin
		if (~resetn)
		begin
			sign_1 <= 1'b0;
			exp_1 <= 8'd0;
			man_1 <= 25'd0;
			is_fraction <= 1'b0;
			zero_exponent <= 1'b0;
			addition <= 25'd0;
		end
		else if (enable)
		begin
			sign_1 <= sign_in;
			exp_1 <= exp_in;
			zero_exponent <= 1'b0;
			man_1[24:23] <= {1'b0, |exp_in};
			case (exp_in)
				8'd127 : begin
								is_fraction <= |(man_in[22:0]);
								addition <= 25'h0800000;
								man_1[22:0] <= 23'd0;
							end
				8'd128 : begin
								is_fraction <= |(man_in[21:0]);
								man_1[22:0] <= {man_in[22], 22'd0};
								addition <= 25'h0400000;								
							end
				8'd129 : begin
								is_fraction <= |(man_in[20:0]);
								man_1[22:0] <= {man_in[22:21], 21'd0};
								addition <= 25'h0200000;								
							end
				8'd130 : begin
								is_fraction <= |(man_in[19:0]);
								man_1[22:0] <= {man_in[22:20], 20'd0};
								addition <= 25'h0100000;								
							end
				8'd131 : begin
								is_fraction <= |(man_in[18:0]);
								man_1[22:0] <= {man_in[22:19], 19'd0};
								addition <= 25'h0080000;																
							end
				8'd132 : begin
								is_fraction <= |(man_in[17:0]);
								man_1[22:0] <= {man_in[22:18], 18'd0};
								addition <= 25'h0040000;																
							end
				8'd133 : begin
								is_fraction <= |(man_in[16:0]);
								man_1[22:0] <= {man_in[22:17], 17'd0};
								addition <= 25'h0020000;																
							end
				8'd134 : begin
								is_fraction <= |(man_in[15:0]);
								man_1[22:0] <= {man_in[22:16], 16'd0};
								addition <= 25'h0010000;																
							end
				8'd135 : begin
								is_fraction <= |(man_in[14:0]);
								man_1[22:0] <= {man_in[22:15], 15'd0};
								addition <= 25'h0008000;																
							end
				8'd136 : begin
								is_fraction <= |(man_in[13:0]);
								man_1[22:0] <= {man_in[22:14], 14'd0};
								addition <= 25'h0004000;																
							end
				8'd137 : begin
								is_fraction <= |(man_in[12:0]);
								man_1[22:0] <= {man_in[22:13], 13'd0};
								addition <= 25'h0002000;																
							end
				8'd138 : begin
								is_fraction <= |(man_in[11:0]);
								man_1[22:0] <= {man_in[22:12], 12'd0};
								addition <= 25'h0001000;																
							end
				8'd139 : begin
								is_fraction <= |(man_in[10:0]);
								man_1[22:0] <= {man_in[22:11], 11'd0};
								addition <= 25'h0000800;																
							end
				8'd140 : begin
								is_fraction <= |(man_in[9:0]);
								man_1[22:0] <= {man_in[22:10], 10'd0};
								addition <= 25'h0000400;																
							end
				8'd141 : begin
								is_fraction <= |(man_in[8:0]);
								man_1[22:0] <= {man_in[22:9], 9'd0};
								addition <= 25'h0000200;																
							end
				8'd142 : begin
								is_fraction <= |(man_in[7:0]);
								man_1[22:0] <= {man_in[22:8], 8'd0};
								addition <= 25'h0000100;																
							end
				8'd143 : begin
								is_fraction <= |(man_in[6:0]);
								man_1[22:0] <= {man_in[22:7], 7'd0};
								addition <= 25'h0000080;																
							end
				8'd144 : begin
								is_fraction <= |(man_in[5:0]);
								man_1[22:0] <= {man_in[22:6], 6'd0};
								addition <= 25'h0000040;																
							end
				8'd145 : begin
								is_fraction <= |(man_in[4:0]);
								man_1[22:0] <= {man_in[22:5], 5'd0};
								addition <= 25'h0000020;																
							end
				8'd146 : begin
								is_fraction <= |(man_in[3:0]);
								man_1[22:0] <= {man_in[22:4], 4'd0};
								addition <= 25'h0000010;																
							end
				8'd147 : begin
								is_fraction <= |(man_in[2:0]);
								man_1[22:0] <= {man_in[22:3], 3'd0};
								addition <= 25'h0000008;																
							end
				8'd148 : begin
								is_fraction <= |(man_in[1:0]);
								man_1[22:0] <= {man_in[22:2], 2'd0};
								addition <= 25'h0000004;																
							end
				8'd149 : begin
								is_fraction <= man_in[0];
								man_1[22:0] <= {man_in[22:1], 1'd0};
								addition <= 25'h0000002;																
							end
				8'd150 : begin
								is_fraction <= 1'b0;
								man_1[22:0] <= man_in;
								addition <= 25'h0000001;																
							end
				default:																
							if (exp_in > 8'd150)
							begin
								is_fraction <= 1'b0;
								man_1[22:0] <= man_in;
								zero_exponent <= 1'b0;
								addition <= 25'h0000000;
							end
							else 
							begin
								// Exp < 8'd127
								is_fraction <= (|man_in) | (|exp_in);
								addition <= 25'h0800000;
								// Exponent will be either 127 or 0, depending on the fraction and the sign.
								zero_exponent <= 1'b1;
								// Mantissa will be zero because the result is either 0 or -1.
								man_1[22:0] <= 23'd0; 
							end
			endcase
		end
	end
	
	// Cycle 3: Depending on the sign and presence of a fraction, add 1 to the result.
	reg sign_2;
	reg [7:0] exp_2;
	reg [24:0] man_2;
	always@(posedge clock or negedge resetn)
	begin
		if (~resetn)
		begin
			sign_2 <= 1'b0;
			exp_2 <= 8'd0;
			man_2 <= 25'd0;
		end
		else if (enable)
		begin
			sign_2 <= sign_1;
			if (zero_exponent)
			begin
				// In this case we are dealing with a scenario where the number is less than 1.
				// So the result can only be either 0 or -1.
				if (sign_1 & is_fraction)
				begin
				   // This is the -1 case.
					exp_2 <= 8'd127;
					man_2 <= 25'h0800000;
				end
				else
				begin
				   // This is the 0 case.
					exp_2 <= 8'd0;
					man_2 <= 25'h0000000;
				end
			end
			else
			begin
			   exp_2 <= exp_1;
			   if (is_fraction & sign_1)
					man_2 <= man_1 + addition;
				else
					man_2 <= man_1;
			end
		end
	end

	// Cycle 4: Normalize.
	reg sign_3;
	reg [7:0] exp_3;
	reg [22:0] man_3;
	always@(posedge clock or negedge resetn)
	begin
		if (~resetn)
		begin
			sign_3 <= 1'b0;
			exp_3 <= 8'd0;
			man_3 <= 23'd0;
		end
		else if (enable)
		begin
			sign_3 <= sign_2;
			if (man_2[24])
			begin
				man_3 <= man_2[23:1];
				exp_3 <= exp_2 + 1'b1;
			end
			else
			begin
				man_3 <= man_2[22:0];
				if (man_2[23] && (exp_2 == 8'd0))
					exp_3 <= 8'd1;
				else
					exp_3 <= exp_2;
			end
		end
	end
	
	assign result = {sign_3, exp_3, man_3};
	
endmodule
