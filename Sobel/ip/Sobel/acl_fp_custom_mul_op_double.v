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
    


module acl_fp_custom_mul_op_double (
    clock, resetn,
    mantissa_left, exponent_left, sign_left,
    mantissa_right, exponent_right, sign_right,
    result_mantissa,
    result_exponent,
    result_sign,
    // Used in HIGH_CAPACITY = 1 mode
    stall_in, valid_in, stall_out, valid_out,
    // Used in HIGH_CAPACITY = 0 mode
    enable);

  parameter HIGH_CAPACITY = 1;
  parameter FLUSH_DENORMS = 0;
  parameter REMOVE_STICKY = 1;
  parameter FINITE_MATH_ONLY = 1;
  parameter HIGH_LATENCY = 1;

  input clock, resetn;
  input [55:0] mantissa_left;
  input [11:0] exponent_left;
  input sign_left;
  input [55:0] mantissa_right;
  input [11:0] exponent_right;
  input sign_right;
  input enable;
  input stall_in, valid_in;
  output stall_out, valid_out;
  output [56:0] result_mantissa;
  output [11:0] result_exponent;
  output result_sign;

  wire [107:0] sub_wire0;
  wire enable_mult_stage;

  // The multiplier. 
  // Notice here that we are dropping two LSBs from the input. This is because we would require far more
  // DSPs otherwise. Since in IEEE754 the last three digits would be 0, then in FPC flow we actually get one more
  // bit of precision. We get 3-bits of extra precision in the adder, but that costs far less than 3 additional DSP blocks.
  lpm_mult  lpm_mult_component (
        .clock (clock),
        .dataa (mantissa_left[55:2]),
        .datab (mantissa_right[55:2]),
        .clken (enable_mult_stage),
        .result (sub_wire0),
        .aclr (1'b0),
        .sum (1'b0));
  defparam
    lpm_mult_component.lpm_hint = "MAXIMIZE_SPEED=9",
    lpm_mult_component.lpm_pipeline = 3,
    lpm_mult_component.lpm_representation = "UNSIGNED",
    lpm_mult_component.lpm_type = "LPM_MULT",
    lpm_mult_component.lpm_widtha = 54,
    lpm_mult_component.lpm_widthb = 54,
    lpm_mult_component.lpm_widthp = 108;

  reg [11:0] exponent_1;
  reg [11:0] exponent_2;
  reg [11:0] exponent_3;
  reg [14:0] man_a_clear;
  reg [14:0] man_b_clear;
  reg [14:0] man_a_clear_2;
  reg [14:0] man_b_clear_2;
  reg exp_zeroed;
  reg sign_1, sign_2, sign_3, exp_out_of_range_1, exp_out_of_range_2, generate_inf;
  reg exp_left_1, exp_right_1;
  reg exp_left_2, exp_right_2;
  reg valid_1, valid_2, valid_3, flush_mantissa, make_nan;
  wire stall_mult;
  
  assign enable_mult_stage = (HIGH_CAPACITY == 1) ? (~valid_2 | ~stall_mult) : enable;
  assign stall_out = valid_2 & stall_mult;

  always@(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      exponent_1 <= 12'dx;
      exponent_2 <= 12'dx;
      exponent_3 <= 12'dx;
      exp_out_of_range_1 <= 1'bx;
      exp_out_of_range_2 <= 1'bx;
      sign_1 <= 1'bx;
      sign_2 <= 1'bx;
      sign_3 <= 1'bx;
      flush_mantissa <= 1'bx;
      man_a_clear <= 15'dx;
      man_b_clear <= 15'dx;
      man_a_clear_2 <= 15'dx;
      man_b_clear_2 <= 15'dx;
      make_nan <= 1'bx;
      valid_1 <= 1'b0;
      valid_2 <= 1'b0;
      valid_3 <= 1'b0;
      exp_left_1 <= 1'bx;
      exp_right_1 <= 1'bx;
      exp_left_2 <= 1'bx;
      exp_right_2 <= 1'bx;
      exp_zeroed <= 1'bx;
    end
    else if (enable_mult_stage)
    begin
      valid_1 <= valid_in;
      sign_1 <= sign_left ^ sign_right;
      exp_left_1 <= exponent_left[11];
      exp_right_1 <= exponent_right[11];
      exp_out_of_range_1 <= (exponent_left[11] | exponent_right[11]);
      if ((exponent_left[11] || exponent_right[11]) && (FINITE_MATH_ONLY == 0))
        exponent_1 <= 12'hfff;  
      else
        exponent_1 <= exponent_left + exponent_right - 12'd1023;
          
      man_a_clear <= {mantissa_left[55], |mantissa_left[54:52], |mantissa_left[51:48], |mantissa_left[47:44], |mantissa_left[43:40], |mantissa_left[39:36], |mantissa_left[35:32], |mantissa_left[31:28], |mantissa_left[27:24], |mantissa_left[23:20], |mantissa_left[19:16], |mantissa_left[15:12], |mantissa_left[11:8], |mantissa_left[7:4], |mantissa_left[3:0]};
      man_b_clear <= {mantissa_right[55], |mantissa_right[54:52], |mantissa_right[51:48], |mantissa_right[47:44], |mantissa_right[43:40], |mantissa_right[39:36], |mantissa_right[35:32], |mantissa_right[31:28], |mantissa_right[27:24], |mantissa_right[23:20], |mantissa_right[19:16], |mantissa_right[15:12], |mantissa_right[11:8], |mantissa_right[7:4], |mantissa_right[3:0]};
        
      // Second cycle.
      man_a_clear_2 <= {man_a_clear[14], |man_a_clear[13:10], |man_a_clear[9:6], |man_a_clear[5:2], |man_a_clear[1:0]};
      man_b_clear_2 <= {man_b_clear[14], |man_b_clear[13:10], |man_b_clear[9:6], |man_b_clear[5:2], |man_b_clear[1:0]};
      exponent_2 <= exponent_1;
      exp_out_of_range_2 <= exp_out_of_range_1;
      valid_2 <= valid_1;
      sign_2 <= sign_1;
      exp_left_2 <= exp_left_1;
      exp_right_2 <= exp_right_1;
        
      // Third cycle
		  make_nan <= 1'b0;
		  flush_mantissa <= 1'b0;
      exp_zeroed <= ~|exponent_2;
      if (exp_out_of_range_2 && (FINITE_MATH_ONLY == 0))
      begin
        exponent_3 <= 12'hfff;
        if (((exp_left_2 & (~|man_a_clear_2[3:0])) & (~exp_right_2 & (~|man_b_clear_2))) ||
           ((exp_right_2 & (~|man_b_clear_2[3:0])) & (~exp_left_2 & (~|man_a_clear_2))) ||
           ((exp_left_2 & (|man_a_clear_2[3:0])) || (exp_right_2 & (|man_b_clear_2[3:0]))))
           make_nan <= 1'b1;
        else
           flush_mantissa <= 1'b1;
      end
      else if (exponent_2[11]) // resulting exponent is less than zero.
      begin
        exponent_3 <= 12'd0;
		  exp_zeroed <= 1'b1;
        flush_mantissa <= 1'b1;
      end
      else if ((exponent_2[10:0] >= 12'd2047) && (FINITE_MATH_ONLY == 0))// resulting exponent is above max
      begin
        flush_mantissa <= 1'b1;
        exponent_3 <= 12'h1ff;
      end
      else
        exponent_3 <= exponent_2;
      
      sign_3 <= sign_2;
      valid_3 <= valid_2;
    end
  end

  // Now collect results in registers.
  reg [56:0] mult_result_int;
  reg [11:0] mult_exp_int;
  reg mult_sign_int;
  reg mult_valid_int;
  reg [12:0] mult_tail_bits;
  reg exp_was_zero;
  reg clear_mantissa;
  reg is_nan;
  wire stall_post_int;
  wire enable_post_mult_stage_int;

  assign enable_post_mult_stage_int = (HIGH_CAPACITY == 1) ? (~mult_valid_int | ~stall_post_int) : enable;
  assign stall_mult = mult_valid_int & stall_post_int;
  
  generate
  if (REMOVE_STICKY == 1)
  begin
  always@(*)
  begin
    mult_valid_int <= valid_3;
    is_nan <= make_nan;
    clear_mantissa <= flush_mantissa | ((FLUSH_DENORMS == 1) & exp_zeroed & (~|sub_wire0[107:106]));
    mult_result_int <= sub_wire0[107:51];
    exp_was_zero <= exp_zeroed;
    mult_exp_int <= exponent_3;
    mult_sign_int <= sign_3;
    mult_tail_bits <= 13'd0;
  end
  end
  else
  begin
  always@(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      mult_valid_int <= 1'b0;
      mult_result_int <= 57'dx;
      mult_exp_int <= 12'dx;
      clear_mantissa <= 1'bx;
      mult_tail_bits <= 13'dx;
      exp_was_zero <= 1'bx;
      is_nan <= 1'bx;
      mult_sign_int <= 1'bx;      
    end
    else if (enable_post_mult_stage_int)
    begin
      mult_valid_int <= valid_3;
      is_nan <= make_nan;
      clear_mantissa <= flush_mantissa | ((FLUSH_DENORMS == 1) & exp_zeroed & (~|sub_wire0[107:106]));
      mult_result_int <= sub_wire0[107:51];
      exp_was_zero <= exp_zeroed;
      mult_exp_int <= exponent_3;
      mult_sign_int <= sign_3;
      mult_tail_bits <= {|sub_wire0[50:48],|sub_wire0[47:44],|sub_wire0[43:40],|sub_wire0[39:36],|sub_wire0[35:32],|sub_wire0[31:28],|sub_wire0[27:24],|sub_wire0[23:20],|sub_wire0[19:16],|sub_wire0[15:12],|sub_wire0[11:8],|sub_wire0[7:4],|sub_wire0[3:0]};
    end
  end
  end
  endgenerate

  // Now collect results in registers.
  reg [56:0] mult_result;
  reg [11:0] mult_exp;
  reg mult_sign;
  reg mult_valid;
  wire stall_post, enable_post_mult_stage;
  
  assign enable_post_mult_stage = (HIGH_CAPACITY == 1) ? (~mult_valid | ~stall_post) : enable;
  assign stall_post_int = mult_valid & stall_post;
  
  always@(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      mult_valid <= 1'b0;
      mult_result <= 57'dx;
      mult_exp <= 12'dx;
      mult_sign <= 1'bx;      
    end
    else if (enable_post_mult_stage)
    begin
      mult_valid <= mult_valid_int;
      if (REMOVE_STICKY == 1)
      begin
        if (exp_was_zero & ~is_nan &~clear_mantissa)
          mult_result <= {1'b0, mult_result_int[56:1]};
        else
          mult_result <= is_nan ? 57'h0ffffffffffffff : {57{~clear_mantissa}} & mult_result_int[56:0];
      end
      else
      begin  
        if (exp_was_zero & ~is_nan &~clear_mantissa)
          mult_result <= {1'b0, mult_result_int[56:2], |mult_result_int[1:0] | (|mult_tail_bits)};
        else
          mult_result <= is_nan ? 57'h0ffffffffffffff : {57{~clear_mantissa}} & {mult_result_int[56:1], mult_result_int[0] | (|mult_tail_bits)};
      end
                
      if (exp_was_zero & ~is_nan & mult_result_int[56] & ~clear_mantissa)
        mult_exp <= 12'd1;
      else
        mult_exp <= mult_exp_int;
      mult_sign <= mult_sign_int;
    end
  end
  
  // Now put a staging register if we are in high-capacity mode
  generate
  if (HIGH_CAPACITY == 1)
  begin
    reg [56:0] result_mantissa_sr;
    reg [11:0] result_exponent_sr;
    reg result_sign_sr;
    reg result_sr_valid;
    
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        result_mantissa_sr <= 57'dx;
        result_exponent_sr <= 12'dx;
        result_sign_sr <= 1'bx;      
        result_sr_valid <= 1'b0;
      end
      else
      begin
        if (~stall_in)
          result_sr_valid <= 1'b0;
        else if (~result_sr_valid)
          result_sr_valid <= mult_valid;
      
        if (~result_sr_valid)
        begin
          result_mantissa_sr <= mult_result;
          result_exponent_sr <= mult_exp;
          result_sign_sr <= mult_sign;
        end          
      end
    end
    assign result_mantissa = result_sr_valid ? result_mantissa_sr : mult_result;
    assign result_exponent = result_sr_valid ? result_exponent_sr : mult_exp;
    assign result_sign = result_sr_valid ? result_sign_sr : mult_sign;      
    assign valid_out = result_sr_valid | mult_valid;
    assign stall_post = result_sr_valid;
  end
  else
  begin
    assign result_mantissa = mult_result;
    assign result_exponent = mult_exp;
    assign result_sign = mult_sign;  
    assign valid_out = mult_valid;
    assign stall_post = stall_in;
  end
  endgenerate

endmodule
