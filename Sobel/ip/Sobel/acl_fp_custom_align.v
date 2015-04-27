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
    
 

module acl_fp_custom_align(  clock, resetn,
          input_a_mantissa, input_a_exponent, input_a_sign,
          input_b_mantissa, input_b_exponent, input_b_sign,
          left_mantissa, left_exponent, left_sign,
          right_mantissa, right_exponent, right_sign,
          valid_in, valid_out, stall_in, stall_out,
          enable);
  parameter HIGH_CAPACITY = 1;
  parameter FLUSH_DENORMS = 0;
  parameter HIGH_LATENCY = 1;
  parameter ROUNDING_MODE = 0;
  parameter REMOVE_STICKY = 1;
  parameter FINITE_MATH_ONLY = 1;    
    
  input clock, resetn;
  input [26:0] input_a_mantissa;
  input [8:0] input_a_exponent;
  input input_a_sign;
  input [26:0] input_b_mantissa;
  input [8:0] input_b_exponent;
  input input_b_sign;
  output [26:0] left_mantissa;
  output [8:0] left_exponent;
  output left_sign;
  output [26:0] right_mantissa;
  output [8:0] right_exponent;
  output right_sign;
    
  input enable, valid_in, stall_in;
  output valid_out, stall_out;
    
  // This module aligns two floating point input values such that their exponents are equal,
  // permitting a proper addition of the two numbers.
    
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c2_valid;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c3_valid;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c4_valid;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c5_valid;
  wire c2_enable;
  wire c3_enable;
  wire c4_enable;
  wire c5_enable;
  wire c1_stall;
  wire c2_stall;
  wire c3_stall;
  wire c4_stall;
  wire c5_stall;
    
  // Cycle 1 - Convert from 32-bit representation to internal format
  assign stall_out = c1_stall;
    
  wire c1_valid = valid_in;
  wire [26:0] c1_l_mantissa = input_a_mantissa;
  wire [8:0] c1_l_exponent = input_a_exponent;
  wire c1_l_sign = input_a_sign;
  wire [26:0] c1_r_mantissa = input_b_mantissa;
  wire [8:0] c1_r_exponent = input_b_exponent;
  wire c1_r_sign = input_b_sign;
    
  // Cycle 2 - Determine the magnitude of both numbers.
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c2_l_mantissa;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c2_r_mantissa;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c2_l_exponent;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c2_r_exponent;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [6:0] c2_l_mantissa_nonzero;    
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [6:0] c2_r_mantissa_nonzero;        
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c2_l_sign, c2_r_sign;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c2_exp_diff;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c2_matissa_r_greater, c2_matissas_equal;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c2_exp_equal;
    
  assign c2_enable = (HIGH_CAPACITY ? (~c2_stall | ~c2_valid) : enable);
  assign c1_stall = c2_stall & c2_valid;
    
  generate
    if (HIGH_LATENCY == 1)
    begin
      always @(posedge clock or negedge resetn)
      begin
        if (~resetn)
        begin
          c2_l_mantissa <= 27'dx;
          c2_r_mantissa <= 27'dx;
          c2_l_exponent <= 9'dx;
          c2_r_exponent <= 9'dx;
          c2_l_mantissa_nonzero <= 7'dx;    
          c2_r_mantissa_nonzero <= 7'dx;          
          c2_l_sign <= 1'bx;
          c2_r_sign <= 1'bx;
          c2_matissa_r_greater <= 1'bx;
          c2_exp_diff <= 9'dx;
          c2_exp_equal <= 1'bx;  
          c2_matissas_equal <= 1'bx;
          c2_valid  <= 1'b0;
        end
        else if (c2_enable)
        begin
          c2_valid <= c1_valid;
          if ((FINITE_MATH_ONLY == 0) && (c1_l_exponent[8] || c1_r_exponent[8]))
          begin
            c2_exp_diff <= 9'd0;
            c2_exp_equal <= 1'b1;  
          end
          else
          begin
            c2_exp_diff <= {1'b0, c1_l_exponent[7:0]} - {1'b0, c1_r_exponent[7:0]};
            c2_exp_equal <= (c1_l_exponent[7:0] == c1_r_exponent[7:0]);  
          end
          c2_l_mantissa <= c1_l_mantissa;
          c2_r_mantissa <= c1_r_mantissa;
          c2_l_exponent <= c1_l_exponent;
          c2_r_exponent <= c1_r_exponent;
          c2_l_mantissa_nonzero <= {c1_l_mantissa[26], |c1_l_mantissa[25:20], |c1_l_mantissa[19:16], |c1_l_mantissa[15:11], |c1_l_mantissa[10:8], |c1_l_mantissa[7:3], |c1_l_mantissa[2:0]};
          c2_r_mantissa_nonzero <= {c1_r_mantissa[26], |c1_r_mantissa[25:20], |c1_r_mantissa[19:16], |c1_r_mantissa[15:11], |c1_r_mantissa[10:8], |c1_r_mantissa[7:3], |c1_r_mantissa[2:0]};                          
          c2_l_sign <= c1_l_sign;
          c2_r_sign <= c1_r_sign;
          c2_matissa_r_greater <= {1'b0, c1_r_mantissa[26:0]} > {1'b0, c1_l_mantissa[26:0]};
          c2_matissas_equal <= (c1_r_mantissa[26:0] == c1_l_mantissa[26:0]);
        end
      end
    end
    else
    begin
      // In a low latency mode, do not register this stage of the computation.
      always @(*)
      begin
        c2_valid <= c1_valid;
        if ((FINITE_MATH_ONLY == 0) && (c1_l_exponent[8] || c1_r_exponent[8]))
        begin
          c2_exp_diff <= 9'd0;
          c2_exp_equal <= 1'b1;  
        end
        else
        begin
          c2_exp_diff <= {1'b0, c1_l_exponent[7:0]} - {1'b0, c1_r_exponent[7:0]};
          c2_exp_equal <= (c1_l_exponent[7:0] == c1_r_exponent[7:0]);  
        end
        c2_l_mantissa <= c1_l_mantissa;
        c2_r_mantissa <= c1_r_mantissa;
        c2_l_exponent <= c1_l_exponent;
        c2_r_exponent <= c1_r_exponent;
        c2_l_mantissa_nonzero <= {c1_l_mantissa[26], |c1_l_mantissa[25:20], |c1_l_mantissa[19:16], |c1_l_mantissa[15:11], |c1_l_mantissa[10:8], |c1_l_mantissa[7:3], |c1_l_mantissa[2:0]};
        c2_r_mantissa_nonzero <= {c1_r_mantissa[26], |c1_r_mantissa[25:20], |c1_r_mantissa[19:16], |c1_r_mantissa[15:11], |c1_r_mantissa[10:8], |c1_r_mantissa[7:3], |c1_r_mantissa[2:0]};                          
        c2_l_sign <= c1_l_sign;
        c2_r_sign <= c1_r_sign;
        c2_matissa_r_greater <= {1'b0, c1_r_mantissa[26:0]} > {1'b0, c1_l_mantissa[26:0]};
        c2_matissas_equal <= (c1_r_mantissa[26:0] == c1_l_mantissa[26:0]);
      end    
    end
  endgenerate
    
  // Cycle 3 - Swap numbers such that the larger one is the left and the smaller one is the right.
  // If the numbers are equal in magnitude, then pick the positive one to be the left one.
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c3_l_mantissa;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c3_r_mantissa;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c3_l_exponent;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c3_l_sign, c3_r_sign;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [4:0] c3_exp_diff;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [6:0] c3_r_mantissa_nonzero;  
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [3:0] c3_lr_mantissa_info;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c3_diff_signs;
  reg [8:0] c3_diff;

  assign c3_enable = (HIGH_CAPACITY ? (~c3_stall | ~c3_valid) : enable);
  assign c2_stall = c3_stall & c3_valid;
  
  always@(*)
  begin  
    if (FINITE_MATH_ONLY == 0)
    begin
      c3_diff <= ({9{c2_exp_diff[8]}} ^ c2_exp_diff) + (c2_exp_diff[8] ? {1'b0, (c2_r_mantissa[26] == c2_l_mantissa[26])} : {9{~c2_exp_equal & (c2_r_mantissa[26] ^ c2_l_mantissa[26])}});
    end
    else
    begin
      c3_diff <= ({9{c2_exp_diff[8]}} ^ c2_exp_diff) + (c2_exp_diff[8] ? {1'b0, (c2_r_mantissa[26] == c2_l_mantissa[26])} : {9{c2_r_mantissa[26] ^ c2_l_mantissa[26]}});
    end      
  end
    
  always @(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      c3_l_mantissa <= 27'dx;
      c3_r_mantissa <= 27'dx;
      c3_l_exponent <= 9'dx;
      c3_l_sign <= 1'bx;
      c3_r_sign <= 1'bx;
      c3_r_mantissa_nonzero <= 7'dx;
      c3_lr_mantissa_info <= 4'dx;
      c3_diff_signs <= 1'bx;        
      c3_valid  <= 1'b0;
      c3_exp_diff <= 5'dx;
    end
    else if (c3_enable)
    begin
      c3_valid <= c2_valid;
      c3_diff_signs <= c2_l_sign ^ c2_r_sign;
        
      //if (c2_exp_diff[8])
      //begin
      //  c3_exp_diff <= {9{c2_r_mantissa[26] ^ c2_l_mantissa[26]}} - c2_exp_diff;
      //end
      //else
      //begin
      //  if (FINITE_MATH_ONLY == 0)
      //    c3_exp_diff <= (c2_l_exponent[8] || c2_r_exponent[8]) ? c2_exp_diff : c2_exp_diff - {1'b0, c2_r_mantissa[26] ^ c2_l_mantissa[26]};
      //  else
      //    c3_exp_diff <= c2_exp_diff - {1'b0, c2_r_mantissa[26] ^ c2_l_mantissa[26]};
      //end
      //if (FINITE_MATH_ONLY == 0)
      //begin
      //  c3_exp_diff <= ({9{c2_exp_diff[8]}} ^ c2_exp_diff) + (c2_exp_diff[8] ? {1'b0, (c2_r_mantissa[26] == c2_l_mantissa[26])} : {9{~c2_exp_equal & (c2_r_mantissa[26] ^ c2_l_mantissa[26])}});
      //end
      //else
      //begin
      //  c3_exp_diff <= ({9{c2_exp_diff[8]}} ^ c2_exp_diff) + (c2_exp_diff[8] ? {1'b0, (c2_r_mantissa[26] == c2_l_mantissa[26])} : {9{c2_r_mantissa[26] ^ c2_l_mantissa[26]}});
      //end
      c3_exp_diff <= {5{|c3_diff[8:5]}} | c3_diff[4:0];
      
      if ((c2_l_exponent[8] || c2_r_exponent[8]) && (FINITE_MATH_ONLY == 0))
      begin
        // Here we handle the cases of NaN and Inf values.
        // We need to split this into two stages, otherwise the logic is really complicated.
        // When testing for non-zero mantissa we need to check that the exponent is maxed out.
        // We use c3_lr_mantissa_info to convey this information to the next cycle.
        c3_lr_mantissa_info <= {c2_l_exponent[8], |c2_l_mantissa_nonzero[5:0], c2_r_exponent[8], |c2_r_mantissa_nonzero[5:0]};
        c3_l_mantissa <= 27'h4000000; // Inf
        c3_r_mantissa <= 27'd0;
        c3_l_exponent <= 9'h1ff;
        c3_l_sign <= c2_l_exponent[8] ? c2_l_sign : c2_r_sign;
        c3_r_sign <= c2_l_exponent[8] ? c2_l_sign : c2_r_sign;
        c3_r_mantissa_nonzero <= c2_r_mantissa_nonzero;
      end
      else    
      if ((c2_matissas_equal & c2_exp_equal & ~c2_r_sign) |
          (c2_exp_equal & c2_matissa_r_greater) | (c2_exp_diff[8]))
      begin
        // Swap left and right inputs
        c3_lr_mantissa_info <= 4'd0;
        c3_l_mantissa <= c2_r_mantissa;
        c3_r_mantissa <= c2_l_mantissa;
        c3_l_exponent <= c2_r_exponent;
        c3_l_sign <= c2_r_sign;
        c3_r_sign <= c2_l_sign;
        c3_r_mantissa_nonzero <= c2_l_mantissa_nonzero;
      end
      else
      begin
        c3_lr_mantissa_info <= 4'd0;        
        c3_l_mantissa <= c2_l_mantissa;
        c3_r_mantissa <= c2_r_mantissa;
        c3_l_exponent <= c2_l_exponent;
        c3_l_sign <= c2_l_sign;
        c3_r_sign <= c2_r_sign;
        c3_r_mantissa_nonzero <= c2_r_mantissa_nonzero;                  
      end
    end
  end

  // Cycle 4 - shift data in the right input as much as needed to match exponents
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c4_l_mantissa;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c4_r_mantissa;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c4_l_exponent;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c4_l_sign, c4_r_sign;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [2:0] c4_exp_diff;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c4_clear_right;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c4_sticky_right;
  
  assign c4_enable = (HIGH_CAPACITY ? (~c4_stall | ~c4_valid) : enable);
  assign c3_stall = c4_stall & c4_valid;    
  
  reg [1:0] c4_select;
  
  always@(*)
  begin
    c4_select[1] = c3_exp_diff[4];
    c4_select[0] = c3_exp_diff[3];
  end
  
  generate
    if (HIGH_LATENCY)
    begin
      always @(posedge clock or negedge resetn)
      begin
        if (~resetn)
        begin
          c4_l_mantissa <= 27'dx;
          c4_r_mantissa <= 27'dx;
          c4_l_exponent <= 9'dx;
          c4_l_sign <= 1'bx;
          c4_r_sign <= 1'bx;
          c4_clear_right <= 1'bx;
          c4_sticky_right <= 1'bx;        
          c4_valid  <= 1'b0;
          c4_exp_diff <= 3'dx;
        end
        else if (c4_enable)
        begin
          c4_valid <= c3_valid;
          // A number becomes a NaN when
          // 1. it is a sum of positive and negative infinities
          // 2. one of the numbers is a NaN
          if ((FINITE_MATH_ONLY == 0) &&
              ((c3_lr_mantissa_info[3] & ~c3_lr_mantissa_info[2] & c3_lr_mantissa_info[1] & ~c3_lr_mantissa_info[0] & c3_diff_signs) ||
               (c3_lr_mantissa_info[3] & c3_lr_mantissa_info[2] | c3_lr_mantissa_info[1] & c3_lr_mantissa_info[0])))
            c4_l_mantissa <= c3_l_mantissa | 27'h2000000; // Make a number into a NaN if it was infinity before.
          else
            c4_l_mantissa <= c3_l_mantissa;
          c4_l_exponent <= c3_l_exponent;
          c4_l_sign <= c3_l_sign;
          c4_r_sign <= c3_r_sign;
          c4_clear_right <= (c3_exp_diff >= 9'd27);
          if (REMOVE_STICKY == 1)
            c4_sticky_right <= 1'b0;
          else
            c4_sticky_right <= |c3_r_mantissa_nonzero;
            
          c4_exp_diff <= c3_exp_diff[2:0];  
          case(c4_select)
            2'b11:
              begin
                if (REMOVE_STICKY == 1)
                  c4_r_mantissa <= {24'd0, c3_r_mantissa[26:25], c3_r_mantissa[24]};
                else
                  c4_r_mantissa <= {24'd0, c3_r_mantissa[26:25], c3_r_mantissa[24] | (|c3_r_mantissa_nonzero[5:0])};
              end
            2'b10:
              begin
                if (REMOVE_STICKY == 1)
                  c4_r_mantissa <= {16'd0, c3_r_mantissa[26:17], c3_r_mantissa[16]};
                else
                  c4_r_mantissa <= {16'd0, c3_r_mantissa[26:17], c3_r_mantissa[16] | (|c3_r_mantissa_nonzero[3:0])};
              end
            2'b01:
              begin
                if (REMOVE_STICKY == 1)
                  c4_r_mantissa <= {8'd0, c3_r_mantissa[26:9], c3_r_mantissa[8]};
                else
                  c4_r_mantissa <= {8'd0, c3_r_mantissa[26:9], c3_r_mantissa[8] | (|c3_r_mantissa_nonzero[1:0])};
              end
            2'b00:
              begin
                c4_r_mantissa <= c3_r_mantissa;
              end
          endcase
        end
      end
    end
    else
    begin
      // In low latency mode, unregister this stage.
      always @(*)
      begin
        c4_valid <= c3_valid;
        // A number becomes a NaN when
        // 1. it is a sum of positive and negative infinities
        // 2. one of the numbers is a NaN
        if ((FINITE_MATH_ONLY == 0) &&
           ((c3_lr_mantissa_info[3] & ~c3_lr_mantissa_info[2] & c3_lr_mantissa_info[1] & ~c3_lr_mantissa_info[0] & c3_diff_signs) ||
            (c3_lr_mantissa_info[3] & c3_lr_mantissa_info[2] | c3_lr_mantissa_info[1] & c3_lr_mantissa_info[0])))
          c4_l_mantissa <= c3_l_mantissa | 27'h2000000; // Make a number into a NaN if it was infinity before.
        else
          c4_l_mantissa <= c3_l_mantissa;
        c4_l_exponent <= c3_l_exponent;
        c4_l_sign <= c3_l_sign;
        c4_r_sign <= c3_r_sign;
        c4_clear_right <= (c3_exp_diff >= 9'd27);
        if (REMOVE_STICKY == 1)
          c4_sticky_right <= 1'b0;
        else
          c4_sticky_right <= |c3_r_mantissa_nonzero;
          
        c4_exp_diff <= c3_exp_diff[2:0];  
        case(c4_select)
          2'b11:
            begin
              if (REMOVE_STICKY == 1)
                c4_r_mantissa <= {24'd0, c3_r_mantissa[26:25], c3_r_mantissa[24]};
              else
                c4_r_mantissa <= {24'd0, c3_r_mantissa[26:25], c3_r_mantissa[24] | (|c3_r_mantissa_nonzero[5:0])};
            end
          2'b10:
            begin
              if (REMOVE_STICKY == 1)
                c4_r_mantissa <= {16'd0, c3_r_mantissa[26:17], c3_r_mantissa[16]};
              else
                c4_r_mantissa <= {16'd0, c3_r_mantissa[26:17], c3_r_mantissa[16] | (|c3_r_mantissa_nonzero[3:0])};
            end
          2'b01:
            begin
              if (REMOVE_STICKY == 1)
                c4_r_mantissa <= {8'd0, c3_r_mantissa[26:9], c3_r_mantissa[8]};
              else
                c4_r_mantissa <= {8'd0, c3_r_mantissa[26:9], c3_r_mantissa[8] | (|c3_r_mantissa_nonzero[1:0])};
            end
          2'b00:
            begin
              c4_r_mantissa <= c3_r_mantissa;
            end
        endcase
      end
    end
  endgenerate

  // Cycle 5 - Complete the shifting of data and produce a final result
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c5_l_mantissa;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c5_r_mantissa;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c5_l_exponent;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c5_l_sign, c5_r_sign;
  
  assign c5_enable = (HIGH_CAPACITY ? (~c5_stall | ~c5_valid) : enable);
  assign c4_stall = c5_stall & c5_valid;    
    
  reg c5_sticky_bit;
  always@(*)
  begin
    if (REMOVE_STICKY == 1)
      c5_sticky_bit = 1'b0;
    else
    begin
      case(c4_exp_diff)
        3'h7: c5_sticky_bit = |c4_r_mantissa[6:0];
        3'h6: c5_sticky_bit = |c4_r_mantissa[5:0];
        3'h5: c5_sticky_bit = |c4_r_mantissa[4:0];
        3'h4: c5_sticky_bit = |c4_r_mantissa[3:0];
        3'h3: c5_sticky_bit = |c4_r_mantissa[2:0];
        3'h2: c5_sticky_bit = |c4_r_mantissa[1:0];
        3'h1: c5_sticky_bit = c4_r_mantissa[0];
        3'h0: c5_sticky_bit = 1'b0;
      endcase
    end
  end
      
  always @(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      c5_l_mantissa <= 27'dx;
      c5_r_mantissa <= 27'dx;
      c5_l_exponent <= 9'dx;
      c5_l_sign <= 1'bx;
      c5_r_sign <= 1'bx;      
      c5_valid  <= 1'b0;
    end
    else if (c5_enable)
    begin
      c5_valid <= c4_valid;
      c5_l_mantissa <= c4_l_mantissa;
      c5_l_exponent <= c4_l_exponent;
      c5_l_sign <= c4_l_sign;
      c5_r_sign <= c4_r_sign;
      if (c4_clear_right)
      begin
        c5_r_mantissa <= c4_sticky_right ? 27'd1 : 27'd0;
      end
      else
      begin
        c5_r_mantissa <= (c4_r_mantissa >> c4_exp_diff) | c5_sticky_bit;
      end
    end
  end    
    
  assign c5_stall = stall_in;
  assign valid_out = c5_valid;    
  assign left_mantissa = c5_l_mantissa;
  assign left_exponent = c5_l_exponent;
  assign left_sign = c5_l_sign;
  assign right_mantissa = c5_r_mantissa;
  assign right_exponent = c5_l_exponent;
  assign right_sign = c5_r_sign;    
endmodule
