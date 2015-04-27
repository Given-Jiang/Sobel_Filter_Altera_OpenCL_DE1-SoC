//Copyright (C) 1991-2012 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.

module acl_fp_custom_mul_op (
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
  input [26:0] mantissa_left;
  input [8:0] exponent_left;
  input sign_left;
  input [26:0] mantissa_right;
  input [8:0] exponent_right;
  input sign_right;
  input enable;
  input stall_in, valid_in;
  output stall_out, valid_out;
  output [27:0] result_mantissa;
  output [8:0] result_exponent;
  output result_sign;

  wire [53:0] sub_wire0;
  wire enable_mult_stage;

  // The multiplier. 
  lpm_mult  lpm_mult_component (
        .clock (clock),
        .datab (mantissa_right),
        .clken (enable_mult_stage),
        .dataa (mantissa_left),
        .result (sub_wire0),
        .aclr (1'b0),
        .sum (1'b0));
  defparam
    lpm_mult_component.lpm_hint = "MAXIMIZE_SPEED=9",
    lpm_mult_component.lpm_pipeline = (HIGH_LATENCY == 1) ? 3 : 2,
    lpm_mult_component.lpm_representation = "UNSIGNED",
    lpm_mult_component.lpm_type = "LPM_MULT",
    lpm_mult_component.lpm_widtha = 27,
    lpm_mult_component.lpm_widthb = 27,
    lpm_mult_component.lpm_widthp = 54;

  reg [9:0] exponent_1;
  reg [8:0] exponent_2;
  reg [8:0] exponent_3;
  reg [5:0] man_a_clear;
  reg [5:0] man_b_clear;
  reg exp_zeroed;
  reg sign_1, sign_2, sign_3, exp_out_of_range, generate_inf, exp_left, exp_right;
  reg valid_1, valid_2, valid_3, flush_mantissa, make_nan, make_nan_r;
  wire stall_mult;
  
  assign enable_mult_stage = (HIGH_CAPACITY == 1) ? (~valid_2 | ~stall_mult) : enable;
  assign stall_out = valid_2 & stall_mult;

  generate
  if (HIGH_LATENCY == 1)
  begin
    reg flush_mantissa_r;
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        exponent_1 <= 10'dx;
        exponent_2 <= 9'dx;
        exponent_3 <= 9'dx;
        exp_out_of_range <= 1'bx;
        sign_1 <= 1'bx;
        sign_2 <= 1'bx;
        sign_3 <= 1'bx;
        flush_mantissa_r <= 1'bx;
        flush_mantissa <= 1'bx;
        man_a_clear <= 6'dx;
        man_b_clear <= 6'dx;
        make_nan_r <= 1'bx;
        make_nan <= 1'bx;
        valid_1 <= 1'b0;
        valid_2 <= 1'b0;
        valid_3 <= 1'b0;
        exp_left <= 1'bx;
        exp_right <= 1'bx;
        exp_zeroed <= 1'bx;
      end
      else if (enable_mult_stage)
      begin
        valid_1 <= valid_in;
        valid_2 <= valid_1;
        sign_1 <= sign_left ^ sign_right;
        sign_2 <= sign_1;
        exp_left <= exponent_left[8];
        exp_right <= exponent_right[8];
        exp_out_of_range <= (exponent_left[8] | exponent_right[8]);
        if ((exponent_left[8] || exponent_right[8]) && (FINITE_MATH_ONLY == 0))
          exponent_1 <= 10'h1ff;  
        else
          exponent_1 <= exponent_left + exponent_right - 10'd127;
          
        man_a_clear <= {mantissa_left[26], |mantissa_left[25:21], |mantissa_left[20:15], |mantissa_left[14:10], |mantissa_left[9:5], |mantissa_left[4:0]};
        man_b_clear <= {mantissa_right[26], |mantissa_right[25:21], |mantissa_right[20:15], |mantissa_right[14:10], |mantissa_right[9:5], |mantissa_right[4:0]};
        
        // Second cycle.
        flush_mantissa_r <= 1'b0;
        make_nan_r <= 1'b0;
        if (exp_out_of_range && (FINITE_MATH_ONLY == 0))
        begin
          exponent_2 <= 9'h1ff;
          if (((exp_left & (~|man_a_clear[4:0])) & (~exp_right & (~|man_b_clear))) ||
             ((exp_right & (~|man_b_clear[4:0])) & (~exp_left & (~|man_a_clear))) ||
             ((exp_left & (|man_a_clear[4:0])) || (exp_right & (|man_b_clear[4:0]))))
             make_nan_r <= 1'b1;
          else
             flush_mantissa_r <= 1'b1;
        end
        else if (exponent_1[9]) // resulting exponent is less than zero.
        begin
          exponent_2 <= 9'd0;
          flush_mantissa_r <= 1'b1;
        end
        else if ((exponent_1[8:0] >= 9'd255) && (FINITE_MATH_ONLY == 0))// resulting exponent is above max
        begin
          flush_mantissa_r <= 1'b1;
          exponent_2 <= 9'h1ff;
        end
        else
          exponent_2 <= exponent_1[8:0];
        
        // Third cycle.
        exp_zeroed <= ~|exponent_2;
        flush_mantissa <= flush_mantissa_r;
        exponent_3 <= exponent_2;
        sign_3 <= sign_2;
        valid_3 <= valid_2;
        make_nan <= make_nan_r;
      end
    end
  end
  else
  begin
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        exponent_1 <= 10'dx;
        exponent_2 <= 9'dx;
        exp_out_of_range <= 1'bx;
        sign_1 <= 1'bx;
        sign_2 <= 1'bx;
        flush_mantissa <= 1'bx;
        man_a_clear <= 5'dx;
        man_b_clear <= 5'dx;
        make_nan <= 1'bx;        
        valid_1 <= 1'b0;
        valid_2 <= 1'b0;
        exp_left <= 1'bx;
        exp_right <= 1'bx;
        exp_zeroed <= 1'bx;        
      end
      else if (enable_mult_stage)
      begin
        valid_1 <= valid_in;
        valid_2 <= valid_1;
        sign_1 <= sign_left ^ sign_right;
        sign_2 <= sign_1;
        exp_out_of_range <= exponent_left[8] | exponent_right[8];
        exp_left <= exponent_left[8];
        exp_right <= exponent_right[8];        
        if ((exponent_left[8] || exponent_right[8]) && (FINITE_MATH_ONLY == 0))
          exponent_1 <= 10'h1ff;  
        else
          exponent_1 <= exponent_left + exponent_right - 10'd127;
        
        man_a_clear <= {mantissa_left[26], |mantissa_left[25:21], |mantissa_left[20:15], |mantissa_left[14:10], |mantissa_left[9:5], |mantissa_left[4:0]};
        man_b_clear <= {mantissa_right[26], |mantissa_right[25:21], |mantissa_right[20:15], |mantissa_right[14:10], |mantissa_right[9:5], |mantissa_right[4:0]};
        
        // Second cycle.
        flush_mantissa <= 1'b0;
        make_nan <= 1'b0;
        if (exp_out_of_range && (FINITE_MATH_ONLY == 0))
        begin
          exponent_2 <= 9'h1ff;
          if (((exp_left & (~|man_a_clear[4:0])) & (~exp_right & (~|man_b_clear))) ||
             ((exp_right & (~|man_b_clear[4:0])) & (~exp_left & (~|man_a_clear))) ||
             ((exp_left & (|man_a_clear[4:0])) || (exp_right & (|man_b_clear[4:0]))))
             make_nan <= 1'b1;
          else
            flush_mantissa <= 1'b1;
        end
        else if (exponent_1[9]) // resulting exponent is less than zero.
        begin
          exponent_2 <= 9'd0;
          flush_mantissa <= 1'b1;
        end
        else if ((exponent_1[8:0] >= 9'd255) && (FINITE_MATH_ONLY == 0)) // resulting exponent is above max
        begin
          flush_mantissa <= 1'b1;
          exponent_2 <= 9'h1ff;
        end
        else
          exponent_2 <= exponent_1[8:0];
        exp_zeroed <= ~|exponent_1;
      end
    end
  end
  endgenerate

  // Now collect results in registers.
  reg [27:0] mult_result_int;
  reg [8:0] mult_exp_int;
  reg mult_sign_int;
  reg mult_valid_int;
  reg [4:0] mult_tail_bits;
  reg exp_was_zero;
  reg clear_mantissa;
  reg is_nan;
  wire stall_post_int;
  wire enable_post_mult_stage_int;

  assign enable_post_mult_stage_int = (HIGH_CAPACITY == 1) ? (~mult_valid_int | ~stall_post_int) : enable;
  assign stall_mult = mult_valid_int & stall_post_int;
  
  generate
  if (HIGH_LATENCY == 1)
  begin
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        mult_valid_int <= 1'b0;
        mult_result_int <= 28'dx;
        mult_exp_int <= 9'dx;
        clear_mantissa <= 1'bx;
        mult_tail_bits <= 5'dx;
        exp_was_zero <= 1'bx;
        is_nan <= 1'bx;
        mult_sign_int <= 1'bx;      
      end
      else if (enable_post_mult_stage_int)
      begin
        mult_valid_int <= (HIGH_LATENCY == 1) ? valid_3 : valid_2;
        is_nan <= make_nan;
        clear_mantissa <= flush_mantissa | ((FLUSH_DENORMS == 1) & exp_zeroed & (~|sub_wire0[53:52]));
        mult_result_int <= sub_wire0[53:26];
        exp_was_zero <= exp_zeroed;
        mult_exp_int <= (HIGH_LATENCY == 1) ? exponent_3 : exponent_2;
        mult_sign_int <= (HIGH_LATENCY == 1) ? sign_3 : sign_2;
        if (REMOVE_STICKY == 1)
          mult_tail_bits <= 5'd0;
        else
          mult_tail_bits <= {|sub_wire0[25:20],|sub_wire0[19:15],|sub_wire0[14:10],|sub_wire0[9:5],|sub_wire0[4:0]};
      end
    end
  end
  else
  begin
    always@(*)
    begin
      mult_valid_int <= (HIGH_LATENCY == 1) ? valid_3 : valid_2;
      is_nan <= make_nan;
      clear_mantissa <= flush_mantissa | ((FLUSH_DENORMS == 1) & exp_zeroed & (~|sub_wire0[53:52]));
      mult_result_int <= sub_wire0[53:26];
      exp_was_zero <= exp_zeroed;
      mult_exp_int <= (HIGH_LATENCY == 1) ? exponent_3 : exponent_2;
      mult_sign_int <= (HIGH_LATENCY == 1) ? sign_3 : sign_2;
      if (REMOVE_STICKY == 1)
        mult_tail_bits <= 5'd0;
      else
        mult_tail_bits <= {|sub_wire0[25:20],|sub_wire0[19:15],|sub_wire0[14:10],|sub_wire0[9:5],|sub_wire0[4:0]};
    end
  end
  endgenerate  
  // Now collect results in registers.
  reg [27:0] mult_result;
  reg [8:0] mult_exp;
  reg mult_sign;
  reg mult_valid;
  wire stall_post, enable_post_mult_stage;
  
  assign enable_post_mult_stage = (HIGH_CAPACITY == 1) ? (~mult_valid | ~stall_post) : enable;
  assign stall_post_int = mult_valid & stall_post;
  
   generate
  if (HIGH_LATENCY == 1)
  begin
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        mult_valid <= 1'b0;
        mult_result <= 28'dx;
        mult_exp <= 9'dx;
        mult_sign <= 1'bx;      
      end
      else if (enable_post_mult_stage)
      begin
        mult_valid <= mult_valid_int;
        if (REMOVE_STICKY == 1)
        begin
          if (exp_was_zero & ~is_nan &~clear_mantissa)
            mult_result <= {1'b0, mult_result_int[27:1]};
          else
            mult_result <= is_nan ? 28'h7ffffff : {28{~clear_mantissa}} & mult_result_int[27:0];
        end
        else
        begin  
          if (exp_was_zero & ~is_nan &~clear_mantissa)
            mult_result <= {1'b0, mult_result_int[27:2], |mult_result_int[1:0] | (|mult_tail_bits)};
          else
            mult_result <= is_nan ? 28'h7ffffff : {28{~clear_mantissa}} & {mult_result_int[27:1], mult_result_int[0] | (|mult_tail_bits)};
        end
                  
        if (exp_was_zero & ~is_nan & mult_result_int[27] & ~clear_mantissa)
          mult_exp <= 9'd1;
        else
          mult_exp <= mult_exp_int;
        mult_sign <= mult_sign_int;
      end
    end
  end
  else
  begin
    always@(*)
    begin
      mult_valid <= mult_valid_int;
      if (REMOVE_STICKY == 1)
      begin
        if (exp_was_zero & ~is_nan &~clear_mantissa)
          mult_result <= {1'b0, mult_result_int[27:1]};
        else
          mult_result <= is_nan ? 28'h7ffffff : {28{~clear_mantissa}} & mult_result_int[27:0];
      end
      else
      begin
        if (exp_was_zero & ~is_nan &~clear_mantissa)
          mult_result <= {1'b0, mult_result_int[27:2], |mult_result_int[1:0] | (|mult_tail_bits)};
        else
          mult_result <= is_nan ? 28'h7ffffff : {28{~clear_mantissa}} & {mult_result_int[27:1], mult_result_int[0] | (|mult_tail_bits)};
      end
        
      if (exp_was_zero & ~is_nan & mult_result_int[27] & ~clear_mantissa)
        mult_exp <= 9'd1;
      else
        mult_exp <= mult_exp_int;
       mult_sign <= mult_sign_int;
    end
  end
  endgenerate
  
  // Now put a staging register if we are in high-capacity mode
  generate
  if (HIGH_CAPACITY == 1)
  begin
    reg [27:0] result_mantissa_sr;
    reg [8:0] result_exponent_sr;
    reg result_sign_sr;
    reg result_sr_valid;
    
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        result_mantissa_sr <= 28'dx;
        result_exponent_sr <= 9'dx;
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
