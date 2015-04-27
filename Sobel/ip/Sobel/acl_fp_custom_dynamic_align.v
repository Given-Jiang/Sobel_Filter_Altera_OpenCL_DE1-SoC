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
    


module acl_fp_custom_dynamic_align(  clock, resetn,
          dataa, datab, result,
          valid_in, valid_out, stall_in, stall_out,
          enable);
  // This module performs dynamic alignment of inputs for adder trees only. Dynamic means that both inputs can be shifted to their
  // appropriate position, the larger one is shifted left, the smaller one is shifted right.
  // To do this correctly, both the left and the right inputs are compared using both the exponent and the mantissa.
  // Leading zeroes in the mantissa affect the exponent.
  //
  // Another difference from regular alignment module is that the input mantissa is 28 bits. This is to deal with the fact that the
  // input may be in overflow as a result of addition that preceeded this module.
  //
  // Note that this module is not IEEE754 compliant because:
  // - it removes sticky bits
  // - works only on finite math (no infinities or nans are supported)
  // - may flush denorms to zero
  //
  parameter HIGH_CAPACITY = 0;
  parameter HIGH_LATENCY = 0;
    
  input clock, resetn;
  input [37:0] dataa;
  input [37:0] datab;
  output [37:0] result;
    
  input enable, valid_in, stall_in;
  output valid_out, stall_out;

  wire [27:0] input_a_mantissa = dataa[27:0];
  wire [8:0] input_a_exponent = dataa[36:28];
  wire input_a_sign = dataa[37];
  wire [27:0] input_b_mantissa = datab[27:0];
  wire [8:0] input_b_exponent = datab[36:28];
  wire input_b_sign = datab[37];
  
  // This module aligns two floating point input values such that their exponents are equal,
  // permitting a proper addition of the two numbers.
    
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_valid;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c2_valid;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c3_valid;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c4_valid;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c5_valid;
  wire c1_enable;
  wire c2_enable;
  wire c3_enable;
  wire c4_enable;
  wire c5_enable;
  wire c1_stall;
  wire c2_stall;
  wire c3_stall;
  wire c4_stall;
  wire c5_stall;
  
  // Cycle 1 - compare input values by looking at their exponents and mantissas. To do this, first adjust the
  // exponents by counting leading zeroes.
  
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c1_mantissa_left;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c1_mantissa_right;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c1_exponent_left;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c1_exponent_right;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c1_exp_difference;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [4:0] c1_lead_zeroes;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_sign_left;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_sign_right;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_direction;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_left_clear;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_right_clear;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_increment_left, c1_increment_right;
  
  assign c1_enable = (HIGH_CAPACITY == 1) ? (~c1_valid | ~c1_stall) : enable;
  assign stall_out = c1_valid & c1_stall;
  
  wire [4:0] left_count;
  wire [4:0] right_count;
  
  wire left_clear, right_clear;
  
  acl_fp_custom_clz left(.mantissa(input_a_mantissa[26:0]), .result(left_count), .all_zero(left_clear));
  acl_fp_custom_clz right(.mantissa(input_b_mantissa[26:0]), .result(right_count), .all_zero(right_clear));
  wire [8:0] diff_a_b = {1'b0, input_a_exponent} - {1'b0, input_b_exponent} +
                         {{8{~input_a_mantissa[27] & input_b_mantissa[27]}}, input_a_mantissa[27] ^ input_b_mantissa[27]};
  wire [8:0] diff_b_a = {1'b0, input_b_exponent} - {1'b0, input_a_exponent} +
                         {{8{~input_b_mantissa[27] & input_a_mantissa[27]}}, input_a_mantissa[27] ^ input_b_mantissa[27]};
                  
  always@(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      c1_valid <= 1'b0;
      c1_mantissa_left <= 27'dx;
      c1_mantissa_right <= 27'dx;
      c1_exponent_left <= 9'dx;
      c1_exponent_right <= 9'dx;
      c1_sign_left <= 1'bx;
      c1_sign_right <= 1'bx;
      c1_exp_difference <= 9'dx;
      c1_direction <= 1'bx;
      c1_left_clear <= 1'bx;
      c1_right_clear <= 1'bx;
      c1_increment_left <= 1'bx;
      c1_increment_right <= 1'bx;
      c1_lead_zeroes <= 5'dx;
    end
    else if (c1_enable)
    begin
      c1_valid <= valid_in;
      // Adjust exponents for overflow.
      c1_increment_left <= input_a_mantissa[27];
      c1_increment_right <= input_b_mantissa[27];
      // Delay this computation by 2 cycles.
      // c1_exponent_left <= input_a_exponent + {1'b0, input_a_mantissa[27]};
      // c1_exponent_right <= input_b_exponent + {1'b0, input_b_mantissa[27]};
      c1_exponent_left <= input_a_exponent;
      c1_exponent_right <= input_b_exponent;
      if (diff_a_b[8])
      begin
        // Adjust mantissas for overflow.
        c1_mantissa_right <= input_a_mantissa[27] ? input_a_mantissa[27:1] : input_a_mantissa[26:0];
        c1_mantissa_left <= input_b_mantissa[27] ? input_b_mantissa[27:1] : input_b_mantissa[26:0];
        // Copy signs over
        c1_sign_right <= input_a_sign;
        c1_sign_left <= input_b_sign;
      end
      else
      begin
        // Adjust mantissas for overflow.
        c1_mantissa_left <= input_a_mantissa[27] ? input_a_mantissa[27:1] : input_a_mantissa[26:0];
        c1_mantissa_right <= input_b_mantissa[27] ? input_b_mantissa[27:1] : input_b_mantissa[26:0];
        // Copy signs over
        c1_sign_left <= input_a_sign;
        c1_sign_right <= input_b_sign;
      end
      // Count leading zeroes.
      c1_lead_zeroes <= diff_a_b[8] ? ({5{~input_b_mantissa[27]}} & right_count) : ({5{~input_a_mantissa[27]}} & left_count);
      c1_left_clear <= left_clear & ~input_a_mantissa[27];
      c1_right_clear <= right_clear & ~input_b_mantissa[27];    
      // Exponent difference.
      c1_exp_difference <= diff_a_b[8] ? diff_b_a : diff_a_b;
      c1_direction <= diff_a_b[8];
    end
  end
  
  // Cycle 2 - In this stage we have to decide by how much to shift each number.
  // one will be shifted to the left, the other to the right.
  // The first level of comparisons is the exponent difference combined with the number of leading zeroes.
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c2_mantissa_left;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c2_mantissa_right;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c2_exponent;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c2_sign_left;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c2_sign_right;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c2_increment_exp;
  
  assign c2_enable = (HIGH_CAPACITY == 1) ? (~c2_valid | ~c2_stall) : enable;
  assign c1_stall = c2_valid & c2_stall;
  reg [4:0] c2_exp_shift_left; // left will be the greater value
  reg [4:0] c2_exp_shift_right; // right will be the smaller value
  
  //wire c2_comp_lz_to_diff = c1_lead_zeroes >= c1_exp_difference;
  //wire [8:0] c2_v = c2_comp_lz_to_diff ? c1_exp_difference : {3'd0, c1_lead_zeroes};
  //wire [8:0] c2_v_minus_diff = c1_exp_difference - c2_v;
  wire [8:0] c2_compare = c1_exp_difference - {1'b0, c1_lead_zeroes};
  wire [8:0] c2_v = c2_compare[8] ? c1_exp_difference : {3'd0, c1_lead_zeroes};
  wire [4:0] c2_v_minus_diff = (c2_compare[4:0] | {5{|c2_compare[7:5]}}) & {5{~c2_compare[8]}};
  wire c2_left_is_zero = c1_left_clear;
  wire c2_right_is_zero = c1_right_clear;
  
  always@(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      c2_mantissa_left <= 27'dx;
      c2_mantissa_right <= 27'dx;
      c2_exponent <= 9'dx;
      c2_sign_left <= 1'bx;
      c2_sign_right <= 1'bx;
      c2_exp_shift_left <= 5'dx;
      c2_exp_shift_right <= 5'dx;
      c2_increment_exp <= 1'bx;
      c2_valid <= 1'b0;
    end
    else if (c2_enable)
    begin
      // To determine which way to shift which input, we must compare the values. To do this, we must first shift both values to
      // have the same exponent, accounting for the leading zeroes in each number.
      // Now, in order to do this efficiently, we must carefully pick which number to shift left and which to shift right.
      c2_valid <= c1_valid;
    
      // To keep things clean, the right number will be shifted right, the left number will be shifed left.
      // So, pick them carefully now for shifting in the following stages.
      // The most accurate solution here is to shift the value with the bigger exponent to the left as much as possible, no exceeding the
      // exponent difference. Then, if the difference is not large enough, shift the value with the smaller exponent to the right,
      // bringing its exponent value up.
    
      // c1_direction = 1 means exponent of B is greater than exponent of A, so B is shifted left, A is shifted right.
      // Otherwise A is shifted left and B is shifted right.
      c2_mantissa_left <= c1_mantissa_left;
      c2_mantissa_right <= c1_mantissa_right;
      c2_sign_left <= c1_sign_left;
      c2_sign_right <= c1_sign_right;
        
      if ((c2_left_is_zero) || (c2_right_is_zero))
      begin
        // both mantissas are clear, so zero the exponent.
        c2_exponent <= ({9{~c2_left_is_zero}} & c1_exponent_left) | ({9{~c2_right_is_zero}} & c1_exponent_right);
        c2_increment_exp <= (~c2_left_is_zero & c1_increment_left) | (~c2_right_is_zero & c1_increment_right);
        c2_exp_shift_left <= 5'd0;
        c2_exp_shift_right <= 5'd0;      
      end
      else
      begin
        c2_exp_shift_left <= c2_v[4:0];
        c2_exp_shift_right <= c2_v_minus_diff;//{5{|c2_v_minus_diff[8:5]}} | c2_v_minus_diff[4:0];
        if (c1_direction)
        begin
          // input B had a greater exponent than the input A, so shift it left. Also, swap inputs A and B (B=> left, A=>right)
          c2_exponent <= c1_exponent_right;
          c2_increment_exp <= c1_increment_right;
        end
        else
        begin
          // input A had a greater exponent than the input B, so shift it left. (A=> left, B=>right)
          c2_exponent <= c1_exponent_left;
          c2_increment_exp <= c1_increment_left;
        end     
      end
    end
  end
  
  // Cycle 3 - shift inputs as needed. Reduce the exponent by the c2_exp_shift_left value.
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c3_mantissa_left;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c3_mantissa_right;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c3_exponent;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c3_sign_left;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c3_sign_right;
  
  assign c3_enable = (HIGH_CAPACITY == 1) ? (~c3_valid | ~c3_stall) : enable;
  assign c2_stall = c3_valid & c3_stall;
  
  always@(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      c3_mantissa_left <= 27'dx;
      c3_mantissa_right <= 27'dx;
      c3_exponent <= 9'dx;
      c3_sign_left <= 1'bx;
      c3_sign_right <= 1'bx;
      c3_valid <= 1'b0;
    end
    else if (c3_enable)
    begin
      c3_mantissa_left <= c2_mantissa_left << c2_exp_shift_left;
      c3_mantissa_right <= c2_mantissa_right >> c2_exp_shift_right;    
      c3_exponent <= c2_exponent - {1'b0, c2_exp_shift_left} + c2_increment_exp;
      c3_sign_left <= c2_sign_left;
      c3_sign_right <= c2_sign_right;
      c3_valid <= c2_valid;   
    end
  end

  // Cycle 4 - final shift of inputs.
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c4_mantissa_left;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c4_mantissa_right;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c4_exponent;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c4_sign_left;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c4_sign_right;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c4_do_subtraction;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c4_swap_inputs;
  
  assign c4_enable = (HIGH_CAPACITY == 1) ? (~c4_valid | ~c4_stall) : enable;
  assign c3_stall = c4_valid & c4_stall;
    
  always@(posedge clock or negedge resetn)
  begin
   if (~resetn)
   begin
     c4_mantissa_left <= 27'dx;
     c4_mantissa_right <= 27'dx;
     c4_exponent <= 9'dx;
     c4_sign_left <= 1'bx;
     c4_sign_right <= 1'bx;
     c4_do_subtraction <= 1'bx;
     c4_swap_inputs <= 1'bx;
     c4_valid <= 1'b0;
   end
   else if (c4_enable)
   begin
     c4_mantissa_left <= c3_mantissa_left;
     c4_mantissa_right <= c3_mantissa_right;
     c4_exponent <= c3_exponent;
     c4_sign_left <= c3_sign_left;
     c4_sign_right <= c3_sign_right;
     c4_valid <= c3_valid;
     c4_do_subtraction <= c3_sign_left ^ c3_sign_right;
     c4_swap_inputs <= (c3_mantissa_right > c3_mantissa_left);
   end
  end
  
  // Cycle 5 - Perform addition/subtraction.
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [27:0] c5_mantissa;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c5_exponent;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c5_sign;
  
  assign c5_enable = (HIGH_CAPACITY == 1) ? (~c5_valid | ~c5_stall) : enable;
  assign c4_stall = c5_valid & c5_stall;
  wire [27:0] c5_op_ab = ({28{c4_do_subtraction & c4_swap_inputs}} ^ {1'b0,c4_mantissa_left}) + ({28{c4_do_subtraction & ~c4_swap_inputs}} ^ {1'b0, c4_mantissa_right}) + c4_do_subtraction;
    
  always@(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      c5_mantissa <= 28'dx;
      c5_exponent <= 9'dx;
      c5_sign <= 1'bx;
      c5_valid <= 1'b0;
    end
    else if (c5_enable)
    begin
      c5_mantissa <= c5_op_ab;
      c5_sign <= c4_swap_inputs ? c4_sign_right : c4_sign_left;
      c5_exponent <= c4_exponent;
      c5_valid <= c4_valid;   
    end
  end
 
  assign valid_out = c5_valid;
  assign c5_stall = stall_in;
  assign result = {c5_sign, c5_exponent, c5_mantissa};
endmodule

