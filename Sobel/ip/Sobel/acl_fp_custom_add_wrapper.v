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
    


module acl_fp_custom_add_wrapper(clock, resetn, dataa, datab, result, valid_in, valid_out, stall_in, stall_out, enable);
  input clock, resetn;
  input valid_in, stall_in;
  output valid_out, stall_out;
  input enable;
  input [36:0] dataa;
  input [36:0] datab;
  output [37:0] result;
  
  parameter HIGH_CAPACITY = 0;
  parameter FLUSH_DENORMS = 0;
  parameter HIGH_LATENCY = 0;
  parameter ROUNDING_MODE = 0;
  parameter FINITE_MATH_ONLY = 1;  
  parameter REMOVE_STICKY = 1;  
  
  // Total Latency = 12-7.
  wire [26:0] input_a_mantissa = dataa[26:0];
  wire [26:0] input_b_mantissa = datab[26:0];
  wire input_a_sign = dataa[36];
  wire input_b_sign = datab[36];
  wire [8:0] input_a_exponent = dataa[35:27];
  wire [8:0] input_b_exponent = datab[35:27];
  wire [26:0] left_mantissa;
  wire [26:0] right_mantissa;
  wire left_sign, right_sign, align_valid_out;
  wire [8:0] align_exponent;
  wire stall_align;
  wire conversion_valid = valid_in;
  wire alignment_stall;
  assign stall_out = alignment_stall;
  
  acl_fp_custom_align alignment(
          .clock(clock),
          .resetn(resetn),
          .input_a_mantissa(input_a_mantissa),
          .input_a_exponent(input_a_exponent),
          .input_a_sign(input_a_sign),
          .input_b_mantissa(input_b_mantissa),
          .input_b_exponent(input_b_exponent),
          .input_b_sign(input_b_sign),
          .left_mantissa(left_mantissa),
          .left_exponent(align_exponent),
          .left_sign(left_sign),
          .right_mantissa(right_mantissa),
          .right_exponent(),
          .right_sign(right_sign),
          .valid_in(conversion_valid),
          .valid_out(align_valid_out),
          .stall_in(stall_align),
          .stall_out(alignment_stall),
          .enable(enable));
    defparam alignment.HIGH_CAPACITY = HIGH_CAPACITY;
    defparam alignment.FLUSH_DENORMS = FLUSH_DENORMS;
    defparam alignment.HIGH_LATENCY = HIGH_LATENCY;
    defparam alignment.ROUNDING_MODE = ROUNDING_MODE;            
    defparam alignment.FINITE_MATH_ONLY = FINITE_MATH_ONLY;
    defparam alignment.REMOVE_STICKY = REMOVE_STICKY;
  
  wire [27:0] resulting_mantissa;
  wire [8:0] resulting_exponent;
  wire resulting_sign;
  wire valid_sum;
  
  acl_fp_custom_add_op op(
     .clock(clock),
     .resetn(resetn),
     .left_mantissa(left_mantissa),
     .right_mantissa(right_mantissa),
     .left_sign(left_sign),
     .right_sign(right_sign),
     .common_exponent(align_exponent),
	  .resulting_mantissa(resulting_mantissa),
     .resulting_exponent(resulting_exponent),
     .resulting_sign(resulting_sign),
	  .valid_in(align_valid_out),
     .valid_out(valid_out),
     .stall_in(stall_in),
     .stall_out(stall_align),
     .enable(enable));
     defparam op.HIGH_CAPACITY = HIGH_CAPACITY;
 
  assign result = {resulting_sign, resulting_exponent, resulting_mantissa};
  
endmodule
