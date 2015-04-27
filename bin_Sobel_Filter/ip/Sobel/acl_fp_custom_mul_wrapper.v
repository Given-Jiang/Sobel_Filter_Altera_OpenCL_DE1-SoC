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
    


module acl_fp_custom_mul_wrapper(clock, resetn, dataa, datab, result, valid_in, valid_out, stall_in, stall_out, enable);
  input clock, resetn;
  input valid_in, stall_in;
  output valid_out, stall_out;
  input enable;
  input [31:0] dataa;
  input [31:0] datab;
  output [36:0] result;
  
  parameter HIGH_CAPACITY = 0;
  parameter FLUSH_DENORMS = 0;
  parameter HIGH_LATENCY = 0;
  parameter ROUNDING_MODE = 0;
  parameter FINITE_MATH_ONLY = 1;  
  parameter REMOVE_STICKY = 1;  
  
  // Total Latency = 12-7.
  wire [26:0] input_a_mantissa;
  wire [26:0] input_b_mantissa;
  wire input_a_sign;
  wire input_b_sign;
  wire [8:0] input_a_exponent;
  wire [8:0] input_b_exponent;
  wire [26:0] left_mantissa;
  wire [26:0] right_mantissa;
  wire left_sign, right_sign, align_valid_out;
  wire [8:0] align_exponent;
  wire stall_align, conversion_valid;
  wire conv_stall;
  
   /*acl_fp_convert_to_internal left(
        .clock(clock),
        .resetn(resetn),
        .data(dataa),
        .mantissa(input_a_mantissa),
        .exponent(input_a_exponent),
        .sign(input_a_sign),
        .valid_in(valid_in),
        .valid_out(conversion_valid),
        .stall_in(conv_stall),
        .stall_out(stall_out),
        .enable(enable));
    defparam left.HIGH_CAPACITY = HIGH_CAPACITY;
    defparam left.FLUSH_DENORMS = 0;
    defparam left.FINITE_MATH_ONLY = FINITE_MATH_ONLY;
    
   acl_fp_convert_to_internal right(
        .clock(clock),
        .resetn(resetn),
        .data(datab),
        .mantissa(input_b_mantissa),
        .exponent(input_b_exponent),
        .sign(input_b_sign),
        .valid_in(valid_in),
        .valid_out(),
        .stall_in(conv_stall),
        .stall_out(),
        .enable(enable));
    defparam right.HIGH_CAPACITY = HIGH_CAPACITY;
    defparam right.FLUSH_DENORMS = 0;
    defparam right.FINITE_MATH_ONLY = FINITE_MATH_ONLY;*/
  assign stall_out = conv_stall;
  assign conversion_valid = valid_in;
  assign input_a_mantissa = {|dataa[30:23], dataa[22:0], 3'd0};
  assign input_b_mantissa = {|datab[30:23], datab[22:0], 3'd0};
  assign input_a_exponent = {1'b0, dataa[30:23]};
  assign input_b_exponent = {1'b0, datab[30:23]};
  assign input_a_sign = dataa[31];
  assign input_b_sign = datab[31];
          
  wire [27:0] resulting_mantissa;
  wire [8:0] resulting_exponent;
  wire resulting_sign;
  wire valid_mul;
  wire stall_mul;
  
  acl_fp_custom_mul_op op(
     .clock(clock),
     .resetn(resetn),
     .mantissa_left(input_a_mantissa),
     .mantissa_right(input_b_mantissa),
     .sign_left(input_a_sign),
     .sign_right(input_b_sign),
     .exponent_left(input_a_exponent),
     .exponent_right(input_b_exponent),
	  .result_mantissa(resulting_mantissa),
     .result_exponent(resulting_exponent),
     .result_sign(resulting_sign),
	  .valid_in(conversion_valid),
     .valid_out(valid_mul),
     .stall_in(stall_mul),
     .stall_out(conv_stall),
     .enable(enable));
     defparam op.HIGH_CAPACITY = HIGH_CAPACITY;
     defparam op.HIGH_LATENCY = HIGH_LATENCY;
     defparam op.REMOVE_STICKY = REMOVE_STICKY;
     defparam op.FINITE_MATH_ONLY = FINITE_MATH_ONLY;
  
  wire stall_from_norm;
  wire [27:0] new_mantissa;
  wire [8:0] new_exponent;
  wire new_sign, new_valid;
  
  generate
  if ((HIGH_CAPACITY==1) && (HIGH_LATENCY==1))
  begin
    // Staging register.
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [27:0] mantissa_str;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [7:0] exponent_str;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg sign_str;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg staging_valid;
    
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        staging_valid <= 1'b0;
        mantissa_str <= 28'bxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        exponent_str <= 8'bxxxxxxxx;
        sign_str <= 1'bx;      
      end
      else
      begin
        if (~stall_from_norm)
          staging_valid <= 1'b0;
        else if (~staging_valid)
          staging_valid <= valid_mul;
      
        if (~staging_valid)
        begin
          mantissa_str <= resulting_mantissa;
          exponent_str <= resulting_exponent;
          sign_str <= resulting_sign;
        end      
      end  
    end
    
    assign new_mantissa = staging_valid ? mantissa_str : resulting_mantissa;
    assign new_exponent = staging_valid ? exponent_str : resulting_exponent;
    assign new_sign = staging_valid ? sign_str : resulting_sign;
    assign new_valid = valid_mul | staging_valid;
    assign stall_mul = staging_valid;
  end
  else
  begin
    assign new_mantissa = resulting_mantissa;
    assign new_exponent = resulting_exponent;
    assign new_sign = resulting_sign;
    assign new_valid = valid_mul;
    assign stall_mul = stall_from_norm;  
  end
  endgenerate
  
  wire rednorm_valid_out, stall_from_round;
  wire [26:0] mantissa_norm;
  wire [8:0] exponent_norm;
  wire sign_norm;  
  
  acl_fp_custom_reduced_normalize_mult rednorm(
    .clock(clock),
    .resetn(resetn),
    .mantissa(new_mantissa),
    .exponent(new_exponent),
    .sign(new_sign),
    .stall_in(stall_in),
    .valid_in(new_valid),
    .stall_out(stall_from_norm),
    .valid_out(valid_out),
    .enable(enable),  
    .mantissa_out(mantissa_norm),
    .exponent_out(exponent_norm),
    .sign_out(sign_norm));
    defparam rednorm.HIGH_CAPACITY = HIGH_CAPACITY;
    defparam rednorm.REMOVE_STICKY = REMOVE_STICKY;
    defparam rednorm.FINITE_MATH_ONLY = FINITE_MATH_ONLY;
    
  wire round_valid_out, stall_from_ieee;
  wire [26:0] mantissa_round;
  wire [8:0] exponent_round;
  wire sign_round; 
      
  assign result = {sign_norm, exponent_norm, mantissa_norm};
  
endmodule
