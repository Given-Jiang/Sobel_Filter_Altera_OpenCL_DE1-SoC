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


module acl_fp_custom_align_double(  clock, resetn,
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
    input [55:0] input_a_mantissa;
    input [11:0] input_a_exponent;
    input input_a_sign;
    input [55:0] input_b_mantissa;
    input [11:0] input_b_exponent;
    input input_b_sign;
    output [55:0] left_mantissa;
    output [11:0] left_exponent;
    output left_sign;
    output [55:0] right_mantissa;
    output [11:0] right_exponent;
    output right_sign;
    
    input enable, valid_in, stall_in;
    output valid_out, stall_out;
    
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
    
    // Cycle 1 - Determine the magnitude of both numbers.
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [55:0] c1_l_mantissa;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [55:0] c1_r_mantissa;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [11:0] c1_l_exponent;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [11:0] c1_r_exponent;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [13:0] c1_l_mantissa_nonzero;    
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [13:0] c1_r_mantissa_nonzero;        
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_l_sign, c1_r_sign;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [11:0] c1_exp_diff;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [1:0]c1_matissa_r_greater, c1_matissas_equal;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_exp_equal;
    
    assign c1_enable = (HIGH_CAPACITY ? (~c1_stall | ~c1_valid) : enable);
    assign stall_out = c1_stall & c1_valid;
    
    always @(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        c1_l_mantissa <= 56'dx;
        c1_r_mantissa <= 56'dx;
        c1_l_exponent <= 12'dx;
        c1_r_exponent <= 12'dx;
        c1_l_mantissa_nonzero <= 14'dx;    
        c1_r_mantissa_nonzero <= 14'dx;          
        c1_l_sign <= 1'bx;
        c1_r_sign <= 1'bx;
        c1_matissa_r_greater <= 2'bxx;
        c1_exp_diff <= 12'dx;
        c1_exp_equal <= 1'bx;  
        c1_matissas_equal <= 2'bxx;
        c1_valid  <= 1'b0;
      end
      else if (c1_enable)
      begin
        c1_valid <= valid_in;
        if ((FINITE_MATH_ONLY == 0) && (input_a_exponent[11] || input_b_exponent[11]))
        begin
          c1_exp_diff <= 12'd0;
          c1_exp_equal <= 1'b1;  
        end
        else
        begin
          c1_exp_diff <= {1'b0, input_a_exponent[10:0]} - {1'b0, input_b_exponent[10:0]};
          c1_exp_equal <= (input_a_exponent[10:0] == input_b_exponent[10:0]);  
        end
        c1_l_mantissa <= input_a_mantissa;
        c1_r_mantissa <= input_b_mantissa;
        c1_l_exponent <= input_a_exponent;
        c1_r_exponent <= input_b_exponent;
        c1_l_mantissa_nonzero <= {input_a_exponent[11] ? (|input_a_mantissa[54:52]) : (|input_a_mantissa[55:52]), |input_a_mantissa[51:48], |input_a_mantissa[47:44], |input_a_mantissa[43:40], |input_a_mantissa[39:36], |input_a_mantissa[35:32], |input_a_mantissa[31:28], |input_a_mantissa[27:24], |input_a_mantissa[23:20], |input_a_mantissa[19:16], |input_a_mantissa[15:12], |input_a_mantissa[11:8], |input_a_mantissa[7:3], |input_a_mantissa[2:0]};
        c1_r_mantissa_nonzero <= {input_b_exponent[11] ? (|input_b_mantissa[54:52]) : (|input_b_mantissa[55:52]), |input_b_mantissa[51:48], |input_b_mantissa[47:44], |input_b_mantissa[43:40], |input_b_mantissa[39:36], |input_b_mantissa[35:32], |input_b_mantissa[31:28], |input_b_mantissa[27:24], |input_b_mantissa[23:20], |input_b_mantissa[19:16], |input_b_mantissa[15:12], |input_b_mantissa[11:8], |input_b_mantissa[7:3], |input_b_mantissa[2:0]};
        c1_l_sign <= input_a_sign;
        c1_r_sign <= input_b_sign;
        c1_matissa_r_greater <= {{1'b0, input_b_mantissa[55:28]} > {1'b0, input_a_mantissa[55:28]}, {1'b0, input_b_mantissa[27:0]} > {1'b0, input_a_mantissa[27:0]} };
        c1_matissas_equal <= {(input_b_mantissa[55:28] == input_a_mantissa[55:28]),(input_b_mantissa[27:0] == input_a_mantissa[27:0])};
      end
    end
    
    // Cycle 2 - Swap numbers such that the larger one is the left and the smaller one is the right.
    // If the numbers are equal in magnitude, then pick the positive one to be the left one.
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [55:0] c2_l_mantissa;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [55:0] c2_r_mantissa;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [11:0] c2_l_exponent;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c2_l_sign, c2_r_sign;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [11:0] c2_exp_diff;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [3:0] c2_r_mantissa_nonzero;  
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [3:0] c2_lr_mantissa_info;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c2_diff_signs;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [1:0] c2_exponents;    

    assign c2_enable = (HIGH_CAPACITY ? (~c2_stall | ~c2_valid) : enable);
    assign c1_stall = c2_stall & c2_valid;    
    
    generate
    if (HIGH_LATENCY == 1)
    begin
      always @(posedge clock or negedge resetn)
      begin
        if (~resetn)
        begin
          c2_l_mantissa <= 56'dx;
          c2_r_mantissa <= 56'dx;
          c2_l_exponent <= 12'dx;
          c2_l_sign <= 1'bx;
          c2_r_sign <= 1'bx;
          c2_r_mantissa_nonzero <= 4'dx;
          c2_lr_mantissa_info <= 4'dx;
          c2_diff_signs <= 1'bx;
          c2_exponents <= 2'bxx;        
          c2_valid  <= 1'b0;
        end
        else if (c2_enable)
        begin
          c2_valid <= c1_valid;
          c2_diff_signs <= c1_l_sign ^ c1_r_sign;
          c2_exponents <= {c1_l_exponent[11], c1_r_exponent[11]};
          
          // Here we account for denorms
          if (c1_exp_diff[11])
          begin
            c2_exp_diff <= {12{c1_r_mantissa[55] ^ c1_l_mantissa[55]}} - c1_exp_diff;
          end
          else
          begin
            if (FINITE_MATH_ONLY == 0)
              c2_exp_diff <= (c1_l_exponent[11] || c1_r_exponent[11]) ? c1_exp_diff : c1_exp_diff - {1'b0, c1_r_mantissa[55] ^ c1_l_mantissa[55]};
            else
              c2_exp_diff <= c1_exp_diff - {1'b0, c1_r_mantissa[55] ^ c1_l_mantissa[55]};              
          end
          
          if ((c1_l_exponent[11] || c1_r_exponent[11]) && (FINITE_MATH_ONLY == 0))
          begin
            // Here we handle the cases of NaN and Inf values.
            // I need to split this into two stages, otherwise the logic is really complicated.
            // When testing for non-zero mantissa we need to check that the exponent is maxed out.
            // We use c3_lr_mantissa_info to convey this information to the next cycle.
            c2_lr_mantissa_info <= {|c1_l_mantissa_nonzero[13:7], |c1_l_mantissa_nonzero[6:0], |c1_r_mantissa_nonzero[13:7], |c1_r_mantissa_nonzero[6:0]};
            c2_l_mantissa[55] <= 1'b1; // Inf
            c2_l_mantissa[54:0] <= 55'd0; // Inf
            c2_r_mantissa <= 56'd0;
            c2_l_exponent <= 12'hfff;
            c2_l_sign <= c1_l_exponent[11] ? c1_l_sign : c1_r_sign;
            c2_r_sign <= c1_l_exponent[11] ? c1_l_sign : c1_r_sign;
            c2_r_mantissa_nonzero <= {|c1_r_mantissa_nonzero[13:12], |c1_r_mantissa_nonzero[11:8], |c1_r_mantissa_nonzero[7:4], |c1_r_mantissa_nonzero[3:0]};
          end
          else    
          if ((&c1_matissas_equal) & c1_exp_equal & ~c1_r_sign |
             (c1_exp_equal & (c1_matissa_r_greater[1] | c1_matissas_equal[1] & c1_matissa_r_greater[0])) | (c1_exp_diff[11]))
          begin
            // Swap left and right inputs
            c2_lr_mantissa_info <= 4'd0;
            c2_l_mantissa <= c1_r_mantissa;
            c2_r_mantissa <= c1_l_mantissa;
            c2_l_exponent <= c1_r_exponent;
            c2_l_sign <= c1_r_sign;
            c2_r_sign <= c1_l_sign;
            c2_r_mantissa_nonzero <= {|c1_l_mantissa_nonzero[13:12], |c1_l_mantissa_nonzero[11:8], |c1_l_mantissa_nonzero[7:4], |c1_l_mantissa_nonzero[3:0]};
          end
          else
          begin
            c2_lr_mantissa_info <= 4'd0;        
            c2_l_mantissa <= c1_l_mantissa;
            c2_r_mantissa <= c1_r_mantissa;
            c2_l_exponent <= c1_l_exponent;
            c2_l_sign <= c1_l_sign;
            c2_r_sign <= c1_r_sign;
            c2_r_mantissa_nonzero <= {|c1_r_mantissa_nonzero[13:12], |c1_r_mantissa_nonzero[11:8], |c1_r_mantissa_nonzero[7:4], |c1_r_mantissa_nonzero[3:0]};                
          end
        end
      end
    end
    else
    begin
      // Do not register this stage in low-latency mode.
      always @(*)
      begin
        c2_valid <= c1_valid;
        c2_diff_signs <= c1_l_sign ^ c1_r_sign;
        c2_exponents <= {c1_l_exponent[11], c1_r_exponent[11]};
        
        // Here we account for denorms
        if (c1_exp_diff[11])
        begin
          c2_exp_diff <= {12{c1_r_mantissa[55] ^ c1_l_mantissa[55]}} - c1_exp_diff;
        end
        else
        begin
          if (FINITE_MATH_ONLY == 0)
            c2_exp_diff <= (c1_l_exponent[11] || c1_r_exponent[11]) ? c1_exp_diff : c1_exp_diff - {1'b0, c1_r_mantissa[55] ^ c1_l_mantissa[55]};
          else
            c2_exp_diff <= c1_exp_diff - {1'b0, c1_r_mantissa[55] ^ c1_l_mantissa[55]};            
        end
        
        if ((c1_l_exponent[11] || c1_r_exponent[11]) && (FINITE_MATH_ONLY == 0))
        begin
          // Here we handle the cases of NaN and Inf values.
          // I need to split this into two stages, otherwise the logic is really complicated.
          // When testing for non-zero mantissa we need to check that the exponent is maxed out.
          // We use c3_lr_mantissa_info to convey this information to the next cycle.
          c2_lr_mantissa_info <= {|c1_l_mantissa_nonzero[13:7], |c1_l_mantissa_nonzero[6:0], |c1_r_mantissa_nonzero[13:7], |c1_r_mantissa_nonzero[6:0]};
          c2_l_mantissa[55] <= 1'b1; // Inf
          c2_l_mantissa[54:0] <= 55'd0; // Inf
          c2_r_mantissa <= 56'd0;
          c2_l_exponent <= 12'hfff;
          c2_l_sign <= c1_l_exponent[11] ? c1_l_sign : c1_r_sign;
          c2_r_sign <= c1_l_exponent[11] ? c1_l_sign : c1_r_sign;
          c2_r_mantissa_nonzero <= {|c1_r_mantissa_nonzero[13:12], |c1_r_mantissa_nonzero[11:8], |c1_r_mantissa_nonzero[7:4], |c1_r_mantissa_nonzero[3:0]};
        end
        else    
        if ((&c1_matissas_equal) & c1_exp_equal & ~c1_r_sign |
           (c1_exp_equal & (c1_matissa_r_greater[1] | c1_matissas_equal[1] & c1_matissa_r_greater[0])) | (c1_exp_diff[11]))
        begin
          // Swap left and right inputs
          c2_lr_mantissa_info <= 4'd0;
          c2_l_mantissa <= c1_r_mantissa;
          c2_r_mantissa <= c1_l_mantissa;
          c2_l_exponent <= c1_r_exponent;
          c2_l_sign <= c1_r_sign;
          c2_r_sign <= c1_l_sign;
          c2_r_mantissa_nonzero <= {|c1_l_mantissa_nonzero[13:12], |c1_l_mantissa_nonzero[11:8], |c1_l_mantissa_nonzero[7:4], |c1_l_mantissa_nonzero[3:0]};
        end
        else
        begin
          c2_lr_mantissa_info <= 4'd0;        
          c2_l_mantissa <= c1_l_mantissa;
          c2_r_mantissa <= c1_r_mantissa;
          c2_l_exponent <= c1_l_exponent;
          c2_l_sign <= c1_l_sign;
          c2_r_sign <= c1_r_sign;
          c2_r_mantissa_nonzero <= {|c1_r_mantissa_nonzero[13:12], |c1_r_mantissa_nonzero[11:8], |c1_r_mantissa_nonzero[7:4], |c1_r_mantissa_nonzero[3:0]};                
        end
      end    
    end
    endgenerate

    // Cycle 3 - shift data in the right input as much as needed to match exponents
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [55:0] c3_l_mantissa;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [55:0] c3_r_mantissa;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [11:0] c3_l_exponent;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c3_l_sign, c3_r_sign;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [11:0] c3_exp_diff;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c3_clear_right;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c3_sticky_right;
  
    assign c3_enable = (HIGH_CAPACITY ? (~c3_stall | ~c3_valid) : enable);
    assign c2_stall = c3_stall & c3_valid;    
    
    reg [1:0] c3_select;
  
    always@(*)
    begin
      if (c2_exp_diff >= 9'd48)
        c3_select = 2'b11;
      else if (c2_exp_diff >= 9'd32)
        c3_select = 2'b10;
      else if (c2_exp_diff >= 9'd16)
        c3_select = 2'b01;
      else
        c3_select = 2'b00;
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
        c3_clear_right <= 1'bx;
        c3_sticky_right <= 1'bx;        
        c3_valid  <= 1'b0;
      end
      else if (c3_enable)
      begin
        c3_valid <= c2_valid;
        // A number becomes a NaN when
        // 1. it is a sum of positive and negative infinities
        // 2. one of the numbers is a NaN
        if ((FINITE_MATH_ONLY == 0) && ((c2_exponents[1] & c2_exponents[0] & ~(|c2_lr_mantissa_info) & c2_diff_signs) ||
          (c2_exponents[1] & (|c2_lr_mantissa_info[3:2]) | c2_exponents[0] & (|c2_lr_mantissa_info[1:0]))))
          c3_l_mantissa[54] <= 1'b1; // Make a number into a NaN if it was infinity before.
        else
          c3_l_mantissa[54] <= c2_l_mantissa[54];
          
        c3_l_mantissa[55] <= c2_l_mantissa[55];        
        c3_l_mantissa[53:0] <= c2_l_mantissa[53:0];        
        c3_l_exponent <= c2_l_exponent;
        c3_l_sign <= c2_l_sign;
        c3_r_sign <= c2_r_sign;
        c3_clear_right <= (c2_exp_diff >= 12'd56);
        if (REMOVE_STICKY == 1)
          c3_sticky_right <= 1'b0;
        else
          c3_sticky_right <= |c2_r_mantissa_nonzero;
          
        c3_exp_diff <= c2_exp_diff - {1'b0, c3_select, 4'd0};
        case(c3_select)
          2'b11:
            begin
              if (REMOVE_STICKY == 1)
                c3_r_mantissa <= {48'd0, c2_r_mantissa[55:49], c2_r_mantissa[48]};
              else
                c3_r_mantissa <= {48'd0, c2_r_mantissa[55:49], c2_r_mantissa[48] | (|c2_r_mantissa_nonzero[2:0])};
              end
          2'b10:
            begin
              if (REMOVE_STICKY == 1)
                c3_r_mantissa <= {32'd0, c2_r_mantissa[55:33], c2_r_mantissa[32]};
              else
                c3_r_mantissa <= {32'd0, c2_r_mantissa[55:33], c2_r_mantissa[32] | (|c2_r_mantissa_nonzero[1:0])};
            end
          2'b01:
            begin
              if (REMOVE_STICKY == 1)
                c3_r_mantissa <= {16'd0, c2_r_mantissa[55:17], c2_r_mantissa[16]};
              else
                c3_r_mantissa <= {16'd0, c2_r_mantissa[55:17], c2_r_mantissa[16] | (c2_r_mantissa_nonzero[0])};
            end
          2'b00:
            begin
              c3_r_mantissa <= c2_r_mantissa;
            end
        endcase        
      end
    end
    
      // Cycle 4 - Shift by 12, 8 or 4.
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [55:0] c4_l_mantissa;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [55:0] c4_r_mantissa;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [11:0] c4_l_exponent;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [1:0] c4_exp_diff;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c4_l_sign, c4_r_sign;
  
    assign c4_enable = (HIGH_CAPACITY ? (~c4_stall | ~c4_valid) : enable);
    assign c3_stall = c4_stall & c4_valid;    
    
    reg c4_sticky_bit;
    always@(*)
    begin
      if (REMOVE_STICKY == 1)
        c4_sticky_bit = 1'b0;
      else
      begin
        case(c3_exp_diff[3:2])
          2'h3: c4_sticky_bit = |c3_r_mantissa[11:0];
          2'h2: c4_sticky_bit = |c3_r_mantissa[7:0];
          2'h1: c4_sticky_bit = |c3_r_mantissa[3:0];
          2'h0: c4_sticky_bit = 1'b0;
        endcase
      end
    end
    
    generate
    if (HIGH_LATENCY == 1)
    begin
      always @(posedge clock or negedge resetn)
      begin
        if (~resetn)
        begin
          c4_l_mantissa <= 56'dx;
          c4_r_mantissa <= 56'dx;
          c4_l_exponent <= 12'dx;
          c4_l_sign <= 1'bx;
          c4_r_sign <= 1'bx;
          c4_exp_diff  <= 2'bxx;
          c4_valid  <= 1'b0;
        end
        else if (c4_enable)
        begin
          c4_valid <= c3_valid;
          c4_l_mantissa <= c3_l_mantissa;
          c4_l_exponent <= c3_l_exponent;
          c4_l_sign <= c3_l_sign;
          c4_r_sign <= c3_r_sign;
          c4_exp_diff <= c3_exp_diff[1:0];
          if (c3_clear_right)
          begin
            c4_r_mantissa <= c3_sticky_right ? 56'd1 : 56'd0;
          end
          else
          begin
            case(c3_exp_diff[3:2])
              2'h3: c4_r_mantissa <= {12'd0, c3_r_mantissa[55:13], c3_r_mantissa[12] | c4_sticky_bit};
              2'h2: c4_r_mantissa <= {8'd0, c3_r_mantissa[55:9], c3_r_mantissa[8] | c4_sticky_bit};
              2'h1: c4_r_mantissa <= {4'd0, c3_r_mantissa[55:5], c3_r_mantissa[4] | c4_sticky_bit};
              2'h0: c4_r_mantissa <= c3_r_mantissa;
            endcase
          end
        end
      end
    end
    else
    begin
       // in low latency mode do not register this stage.
      always @(*)
      begin
        c4_valid <= c3_valid;
        c4_l_mantissa <= c3_l_mantissa;
        c4_l_exponent <= c3_l_exponent;
        c4_l_sign <= c3_l_sign;
        c4_r_sign <= c3_r_sign;
        c4_exp_diff <= c3_exp_diff[1:0];
        if (c3_clear_right)
        begin
          c4_r_mantissa <= c3_sticky_right ? 56'd1 : 56'd0;
        end
        else
        begin
          case(c3_exp_diff[3:2])
            2'h3: c4_r_mantissa <= {12'd0, c3_r_mantissa[55:13], c3_r_mantissa[12] | c4_sticky_bit};
            2'h2: c4_r_mantissa <= {8'd0, c3_r_mantissa[55:9], c3_r_mantissa[8] | c4_sticky_bit};
            2'h1: c4_r_mantissa <= {4'd0, c3_r_mantissa[55:5], c3_r_mantissa[4] | c4_sticky_bit};
            2'h0: c4_r_mantissa <= c3_r_mantissa;
          endcase
        end
      end
    end
    endgenerate

    // Cycle 5 - Complete the shifting of data and produce a final result
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [55:0] c5_l_mantissa;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [55:0] c5_r_mantissa;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [11:0] c5_l_exponent;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c5_l_sign, c5_r_sign;
  
    assign c5_enable = (HIGH_CAPACITY ? (~c5_stall | ~c5_valid) : enable);
    assign c4_stall = c5_stall & c5_valid;    
    
    reg c5_sticky_bit;
    always@(*)
    begin
      case(c4_exp_diff)
        2'h3: c5_sticky_bit = |c4_r_mantissa[2:0];
        2'h2: c5_sticky_bit = |c4_r_mantissa[1:0];
        2'h1: c5_sticky_bit = c4_r_mantissa[0];
        2'h0: c5_sticky_bit = 1'b0;
      endcase
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
        c5_r_mantissa <= (c4_r_mantissa >> c4_exp_diff) | c5_sticky_bit;
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
