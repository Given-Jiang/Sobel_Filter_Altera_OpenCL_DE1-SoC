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
    


// Reduced Normalization module
//
// This module performs realignment of data such that the most significant
// bit is 1 for any number with exponent >= 1, and zero otherwise.
//


module acl_fp_custom_reduced_normalize(
  clock, resetn,
  mantissa, exponent, sign,
  // Used in HIGH_CAPACITY = 1 mode
  stall_in, valid_in, stall_out, valid_out,
  // Used in HIGH_CAPACITY = 0 mode
  enable,  
  mantissa_out, exponent_out, sign_out);
    
  parameter HIGH_CAPACITY = 1;
  parameter FLUSH_DENORMS = 0;
  parameter HIGH_LATENCY = 1;
  parameter REMOVE_STICKY = 1;
  parameter FINITE_MATH_ONLY = 1;
    
    
  input clock, resetn;
  input stall_in, valid_in;
  output stall_out, valid_out;
  input enable;
    
  // Data in
  input [27:0] mantissa;
  input [8:0] exponent; // Exponent with MSB set to 1 is an exception.
  input sign;
    
  // Data output
  output [26:0] mantissa_out; // When mantissa_out[25] = 1 and exponent_out[8] == 1 then the number is NaN.
  output [8:0] exponent_out; // Exponent with MSB set to 1 is an exception.
  output sign_out;

  // Stall/valid and enable signals on per-stage basis.
  reg c1_valid;
  reg c2_valid;
  reg c3_valid;
  reg c4_valid;
  wire c1_stall;
  wire c2_stall;
  wire c3_stall;
  wire c4_stall;
  wire c1_enable;
  wire c2_enable;
  wire c3_enable;
  wire c4_enable;
    
  // Cycle 1 - We are just doing the shifting here.
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [27:0] c1_mantissa;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c1_exponent;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [4:0] c1_max_shift;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_sign;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_exponent_is_max;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_exponent_is_nonzero;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [5:0] c1_mantissa_nonzero;
    
  assign c1_enable = (HIGH_CAPACITY == 1) ? (~c1_valid | ~c1_stall) : enable;
  assign stall_out = c1_valid & c1_stall;
    
  generate
  if (FINITE_MATH_ONLY == 1)
  begin
    always@(*)
    begin
        c1_valid <= valid_in;
        c1_sign <= sign;
        c1_exponent <= exponent;
        c1_exponent_is_max <= (&exponent[7:1]) & ~exponent[0];
        c1_exponent_is_nonzero <= |exponent[7:0];
        c1_mantissa_nonzero <= {|mantissa[26:23], |mantissa[22:19], |mantissa[18:15], |mantissa[14:11], |mantissa[10:7], |mantissa[6:3]};
        c1_mantissa <= mantissa;
        c1_max_shift <= exponent[8] ? 5'd0 : ({5{|exponent[7:5]}} | {exponent[4:0] - 1'b1});
    end
  end
  else
  begin
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        c1_mantissa <= 28'dx;
        c1_exponent <= 9'dx;
        c1_sign <= 1'bx;
        c1_exponent_is_max <= 1'bx;
        c1_exponent_is_nonzero <= 1'bx;
        c1_mantissa_nonzero <= 6'dx;
        c1_max_shift <= 5'dx;
        c1_valid <= 1'b0;
      end
      else if (c1_enable)
      begin
        c1_valid <= valid_in;
        c1_sign <= sign;
        c1_exponent <= exponent;
        c1_exponent_is_max <= (&exponent[7:1]) & ~exponent[0];
        c1_exponent_is_nonzero <= |exponent[7:0];
        c1_mantissa_nonzero <= {|mantissa[26:23], |mantissa[22:19], |mantissa[18:15], |mantissa[14:11], |mantissa[10:7], |mantissa[6:3]};
        if ((FINITE_MATH_ONLY == 0) && ((exponent == 9'h0fe) && mantissa[27]))
           c1_mantissa <= 28'h8000000;
        else
           c1_mantissa <= mantissa;
        c1_max_shift <= exponent[8] ? 5'd0 : ({5{|exponent[7:5]}} | {exponent[4:0] - 1'b1});
      end
    end
  end
  endgenerate
    
  // Cycle 2 - Shift by 16, 0 or -1. 
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c2_mantissa;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c2_exponent;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c2_sign;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [3:0] c2_max_shift;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [2:0] c2_mantissa_nonzero;
    
  assign c2_enable = (HIGH_CAPACITY == 1) ? (~c2_valid | ~c2_stall) : enable;
  assign c1_stall = c2_valid & c2_stall;
  
  reg [1:0] c2_select;
  reg [8:0] c2_exponent_adjust;
  
  always@(*)
  begin
    if (c1_mantissa[27])
    begin
      c2_select = 2'b11;
      c2_exponent_adjust = {7'd0, ~c1_exponent_is_nonzero, c1_exponent_is_nonzero}; // +1/+2
    end
    else if (~(|c1_mantissa_nonzero[5:2]) && (c1_max_shift[4]) && c1_exponent_is_nonzero)
    begin
      c2_select = 2'b10;
      c2_exponent_adjust = 9'b111110000; // -16
    end
    else
    begin
      c2_select = 2'b00;
      c2_exponent_adjust = 9'd0; //0
    end
  end
  
  generate
    if (HIGH_LATENCY == 1)
    begin
      always@(posedge clock or negedge resetn)
      begin
        if (~resetn)
        begin
          c2_mantissa <= 27'dx;
          c2_exponent <= 9'dx;
          c2_sign <= 1'bx;
          c2_mantissa_nonzero <= 3'dx;
          c2_max_shift <= 4'dx;
          c2_valid <= 1'b0;
        end
        else if (c2_enable)
        begin
          c2_valid <= c1_valid;
          c2_sign <= c1_sign;
          case (c2_select)
            2'b11:
              begin
                // -1 
                c2_mantissa_nonzero <= 3'b111;
                if (REMOVE_STICKY == 1)
                  c2_mantissa <= c1_mantissa[27:1];
                else
                  c2_mantissa <= {c1_mantissa[27:2], |c1_mantissa[1:0]};
                c2_max_shift <= 4'd0;
                if ((c1_exponent_is_max) && (FINITE_MATH_ONLY == 0))
                  c2_exponent <= 9'h1ff;
                else
                  c2_exponent <= c1_exponent + c2_exponent_adjust;
              end
            2'b10:
              begin
                // 16
                c2_mantissa <= {c1_mantissa[10:0], 16'd0};
                c2_exponent <= c1_exponent + c2_exponent_adjust;            
                c2_mantissa_nonzero <= {c1_mantissa_nonzero[1:0], |c1_mantissa[2:0]};
                c2_max_shift <= (c1_max_shift[3:0]) & {4{c1_exponent_is_nonzero}};
              end
            default:
              begin
                // 0
                c2_mantissa <= c1_mantissa[26:0];
                c2_exponent <= c1_exponent + c2_exponent_adjust;
                c2_mantissa_nonzero <= c1_mantissa_nonzero[5:3];
                c2_max_shift <= ({4{c1_max_shift[4]}} | c1_max_shift[3:0]) & {4{c1_exponent_is_nonzero}};
              end
          endcase
        end
      end
    end
    else
    begin
      // in low latency mode, do not register this stage.
      always@(*)
      begin
        c2_valid <= c1_valid;
        c2_sign <= c1_sign;
        case (c2_select)
          2'b11:
            begin
              // -1 
              c2_mantissa_nonzero <= 3'b111;
              if (REMOVE_STICKY == 1)
                c2_mantissa <= c1_mantissa[27:1];
              else
                c2_mantissa <= {c1_mantissa[27:2], |c1_mantissa[1:0]};
              c2_max_shift <= 4'd0;
              if ((c1_exponent_is_max) && (FINITE_MATH_ONLY == 0))
                c2_exponent <= 9'h1ff;
              else
                c2_exponent <= c1_exponent + c2_exponent_adjust;
            end
          2'b10:
            begin
              // 16
              c2_mantissa <= {c1_mantissa[10:0], 16'd0};
              c2_exponent <= c1_exponent + c2_exponent_adjust;            
              c2_mantissa_nonzero <= {c1_mantissa_nonzero[1:0], |c1_mantissa[2:0]};
              c2_max_shift <= (c1_max_shift[3:0]) & {4{c1_exponent_is_nonzero}};
            end
          default:
            begin
              // 0
              c2_mantissa <= c1_mantissa[26:0];
              c2_exponent <= c1_exponent + c2_exponent_adjust;
              c2_mantissa_nonzero <= c1_mantissa_nonzero[5:3];
              c2_max_shift <= ({4{c1_max_shift[4]}} | c1_max_shift[3:0]) & {4{c1_exponent_is_nonzero}};
            end
        endcase
      end
    end
  endgenerate    
      
  // Cycle 3 - Shift by 12, 8, 4 or 0 here. 
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c3_mantissa;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c3_exponent;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [1:0] c3_max_shift;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c3_sign;
    
  assign c3_enable = (HIGH_CAPACITY == 1) ? (~c3_valid | ~c3_stall) : enable;
  assign c2_stall = c3_valid & c3_stall;
   
  reg [1:0] c3_select; 
  
  always@(*)
  begin
    if (~(|c2_mantissa_nonzero) && (&c2_max_shift[3:2]))
      c3_select = 2'b11;
    else if (~(|c2_mantissa_nonzero[2:1]) && (c2_max_shift[3]))
      c3_select = 2'b10;
    else if (~c2_mantissa_nonzero[2] && (|c2_max_shift[3:2]))
      c3_select = 2'b01;
    else
      c3_select = 2'b00;
  end
  
  always@(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      c3_mantissa <= 27'dx;
      c3_exponent <= 9'dx;
      c3_sign <= 1'bx;
      c3_max_shift <= 2'dx;
      c3_valid <= 1'b0;
    end
    else if (c3_enable)
    begin
      c3_valid <= c2_valid;
      c3_sign <= c2_sign;
      c3_exponent <= c2_exponent - {1'b0, c3_select, 2'b00};
      case(c3_select)
        2'b11:
          begin
            // 12
            c3_mantissa <= {c2_mantissa[14:0], 12'd0};
            c3_max_shift <= c2_max_shift[1:0];
          end
        2'b10:
          begin
            // 8
            c3_mantissa <= {c2_mantissa[18:0], 8'd0};
            c3_max_shift <= c2_max_shift[1:0] | {2{c2_max_shift[2]}};
          end
        2'b01:
          begin
            // 4
            c3_mantissa <= {c2_mantissa[22:0], 4'd0};
            c3_max_shift <= c2_max_shift[1:0] | {2{c2_max_shift[3]}};
          end
        2'b00:
          begin
            // 0
            c3_mantissa <= c2_mantissa;
            c3_max_shift <= c2_max_shift[1:0] | {2{|c2_max_shift[3:2]}};
          end
      endcase
    end
  end
    
  // Cycle 4 - Shift by 2, 1, or 0 here. 
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c4_mantissa;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c4_exponent;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c4_sign;
    
  assign c4_enable = (HIGH_CAPACITY == 1) ? (~c4_valid | ~c4_stall) : enable;
  assign c3_stall = c4_valid & c4_stall;
    
  reg [1:0] shift_by;
  always@(*)
  begin
    if (~(|c3_mantissa[26:24]) && ~c3_exponent[8])
      shift_by <= c3_max_shift;
    else if (~(|c3_mantissa[26:25]) && ~c3_exponent[8])
      shift_by <= {c3_max_shift[1], ~c3_max_shift[1] & c3_max_shift[0]};
    else if (~(c3_mantissa[26]) && ~c3_exponent[8])
      shift_by <= {1'b0, |c3_max_shift};
    else
      shift_by <= 2'b00;
  end
    
  wire [26:0] resulting_mantissa = c3_mantissa << shift_by;
    
  always@(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      c4_mantissa <= 27'dx;
      c4_exponent <= 9'dx;
      c4_sign <= 1'bx;
      c4_valid <= 1'b0;
    end
    else if (c4_enable)
    begin
      c4_valid <= c3_valid;
      c4_sign <= c3_sign;
      c4_mantissa <= resulting_mantissa;
      if (~c3_exponent[8] && ~resulting_mantissa[26])
      begin
        // This number just became denormalized
        c4_exponent <= 9'd0;
      end
      else
      begin
        c4_exponent <= c3_exponent - {1'b0, shift_by};
      end
    end
  end

  assign mantissa_out = c4_mantissa;
  assign exponent_out = c4_exponent;
  assign sign_out = c4_sign;
  assign valid_out = c4_valid;
  assign c4_stall = stall_in;
endmodule
