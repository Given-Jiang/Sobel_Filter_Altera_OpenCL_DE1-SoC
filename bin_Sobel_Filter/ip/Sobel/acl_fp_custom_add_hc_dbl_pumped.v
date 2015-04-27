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
    


// Double pumped single precision floating point adder with the ability to crush pipeline bubbles.
// Latency = 9
//

module acl_fp_custom_add_hc_dbl_pumped
#( parameter WIDTH = 32 )
(
    input clock,
    input clock2x,
    input resetn,
	 input valid_in,
	 input stall_in,
	 output valid_out,
	 output stall_out,
    input [WIDTH-1:0] a1,
    input [WIDTH-1:0] b1,
    input [WIDTH-1:0] a2,
    input [WIDTH-1:0] b2,
    output [WIDTH-1:0] y1,
    output [WIDTH-1:0] y2
    );

  wire [WIDTH-1:0] serial_dataa;
  wire [WIDTH-1:0] serial_datab;
  wire [WIDTH-1:0] serial_result;
  wire valid_from_in_conv, stall_to_in_conv;
  wire valid_from_adder, stall_to_adder;
  // 3 clock2x cycles
  acl_vector_to_stream_converter in_conv(
			.clock(clock),
			.clock2x(clock2x),
      .start(1'b0),
			.resetn(resetn),
			.a1(a1),
			.a2(a2),
			.b1(b1),
			.b2(b2),
			.dataa(serial_dataa),
			.datab(serial_datab),
			.valid_in(valid_in),
			.valid_out(valid_from_in_conv),
			.stall_in(stall_to_in_conv),
			.stall_out(stall_out));
  
  // 12 clock2x cycles
  acl_fp_custom_add_hc the_add(
          .resetn(resetn),
			 .valid_in(valid_from_in_conv),
			 .stall_in(stall_to_adder),
			 .valid_out(valid_from_adder),
			 .stall_out(stall_to_in_conv),
          .clock(clock2x), 
          .dataa(serial_dataa), 
          .datab(serial_datab), 
          .result(serial_result));

  // 3 clock2x cycles
  acl_stream_to_vector_converter out_conv(
			.clock(clock),
			.clock2x(clock2x),
			.resetn(resetn),
			.dataa(serial_result),
			.y1(y1),
			.y2(y2),
			.valid_in(valid_from_adder),
			.valid_out(valid_out),
			.stall_in(stall_in),
			.stall_out(stall_to_adder));
endmodule


