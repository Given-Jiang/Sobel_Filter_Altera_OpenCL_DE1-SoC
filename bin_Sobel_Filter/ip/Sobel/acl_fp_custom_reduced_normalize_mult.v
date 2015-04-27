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
// This module performs realignment of data such that the most significant bit is 1 for any number with exponent >= 1,
// and zero otherwise. This version of the module is specifically designed for the multiplier with no support for denormalized
// numbers. As such it is far smaller.
//


module acl_fp_custom_reduced_normalize_mult(
    clock, resetn,
    mantissa, exponent, sign,
    // Used in HIGH_CAPACITY = 1 mode
    stall_in, valid_in, stall_out, valid_out,
    // Used in HIGH_CAPACITY = 0 mode
    enable,
    
    mantissa_out, exponent_out, sign_out);
    
    parameter HIGH_CAPACITY = 1;
    parameter FINITE_MATH_ONLY = 1;
    parameter REMOVE_STICKY = 1;
    
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
    wire c1_stall;
    wire c1_enable;
    
    // Cycle 1 - There is not much to do for a multiplier that does not support denormalized numbers.
    // At the most, shift right by 1.
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c1_mantissa;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c1_exponent;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_sign;
    
    assign c1_enable = (HIGH_CAPACITY == 1) ? (~c1_valid | ~c1_stall) : enable;
    assign stall_out = c1_valid & c1_stall;
    
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        c1_mantissa <= 27'dx;
         c1_exponent <= 9'dx;
        c1_sign <= 1'bx;
        c1_valid <= 1'b0;
       end
      else if (c1_enable)
      begin
        c1_valid <= valid_in;
        c1_sign <= sign;
        
        // Handle mantissa
        if (mantissa[27])
        begin
          if ((exponent == 9'h0fe) && (FINITE_MATH_ONLY == 0))
          begin
            c1_mantissa <= 27'h4000000;
          end
          else
          begin
            if (REMOVE_STICKY == 1)
            begin
              c1_mantissa <= mantissa[27:1];
            end
            else
            begin        
              c1_mantissa <= {mantissa[27:2], |mantissa[1:0]};
            end
          end
        end
        else
        begin
          c1_mantissa <= mantissa[26:0];
        end
        
        // handle exponent
        if (FINITE_MATH_ONLY == 0)
        begin
          if (mantissa[27])
          begin
            if (exponent == 9'h0fe)
            begin
              c1_exponent <= 9'h1ff;
            end
            else
            begin
              c1_exponent <= exponent + 1'b1;
            end
          end
          else
          begin
            if (~mantissa[26] & ~exponent[8])
              c1_exponent <= 9'd0;
            else
              c1_exponent <= exponent;
          end
        end
        else
        begin
          c1_exponent <= (exponent & {9{mantissa[27] | mantissa[26]}}) + {1'b0, mantissa[27]};
        end        
      end
    end
  
  assign mantissa_out = c1_mantissa;
  assign exponent_out = c1_exponent;
  assign sign_out = c1_sign;
  assign valid_out = c1_valid;
  assign c1_stall = stall_in;
endmodule
