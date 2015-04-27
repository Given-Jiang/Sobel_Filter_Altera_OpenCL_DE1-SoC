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
    


module acl_fp_call_sqrtf(clock, start, finish, input_0_argument, result);

	input clock;
	input start;
	output finish;
	input [31:0] input_0_argument;
	output [31:0] result;
	
	acl_fp_sqrt( .clock(clock), .data(input_0_argument), .result(result));
	
	reg [15:0] delay;
	always@(posedge clock)
	begin
		delay[0] <= start;
		delay[15:1] <= delay[14:0];
	end
	
	assign finish = delay[15];
endmodule

		
