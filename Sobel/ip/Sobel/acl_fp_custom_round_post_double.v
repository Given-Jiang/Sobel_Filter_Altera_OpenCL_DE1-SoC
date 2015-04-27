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
    


// This module performs a rounding of a floating-point number. This rounding is expected to happen after the barrel shifter
// shifts the data to a position with leading 1 in the most significant bit of the input.

module acl_fp_custom_round_post_double(
      clock, resetn, mantissa, exponent, sign, mantissa_out, exponent_out, sign_out,
      valid_in, valid_out, stall_in, stall_out, enable);
      
    parameter HIGH_CAPACITY = 1;
    parameter FLUSH_DENORMS = 0;
    parameter HIGH_LATENCY = 1;      
    parameter ROUNDING_MODE = 0;
    parameter REMOVE_STICKY = 1;
    parameter FINITE_MATH_ONLY = 1;    

    input clock, resetn;
    input stall_in, valid_in;
    output stall_out, valid_out;
    input enable;
    
    // Data in
    input [55:0] mantissa;
    input [11:0] exponent; // Exponent with MSB set to 1 is an exception.
    input sign;
    
    // Data output
    output [55:0] mantissa_out; // When mantissa_out[54] = 1 and exponent_out[11] == 1 then the number is NaN.
    output [11:0] exponent_out; // Exponent with MSB set to 1 is an exception.
    output sign_out;

    reg c1_valid;
    reg c2_valid;
    wire c1_stall;
    wire c2_stall;
    wire c1_enable;
    wire c2_enable;
    
    // Cycle 1 - first check for overflow. Shift data right by one bit if this is the case.
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [56:0] c1_mantissa;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [11:0] c1_exponent;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_sign;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_exponent_is_max;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_exponent_is_nonzero;
    
    assign c1_enable = (HIGH_CAPACITY == 1) ? (~c1_valid | ~c1_stall) : enable;
    assign stall_out = c1_valid & c1_stall;
    
    wire [54:0] rounding = mantissa[55:2] + 1'b1;
    
    generate
    if (HIGH_LATENCY == 1)
    begin
      always@(posedge clock or negedge resetn)
      begin
        if (~resetn)
        begin
          c1_mantissa <= 57'dx;
          c1_exponent <= 12'dx;
          c1_sign <= 1'bx;
          c1_exponent_is_max <= 1'bx;
          c1_exponent_is_nonzero <= 1'bx;
          c1_valid <= 1'b0;
        end
        else if (c1_enable)
        begin
          c1_valid <= valid_in;
          c1_sign <= sign;
          c1_exponent_is_max <= (&exponent[10:1]) & ~exponent[0];
          c1_exponent_is_nonzero <= |exponent[10:0];
          c1_exponent <= exponent;
          if (FINITE_MATH_ONLY == 1)
          begin
            if (&mantissa[3:2] || (mantissa[2] & (|mantissa[1:0])))
              c1_mantissa <= {rounding, 2'b00}; // Also clear the least significant bits since you just rounded them up.
            else
              c1_mantissa <= {1'b0, mantissa};
          end
          else
          begin
            if (~exponent[11] && (&mantissa[3:2] || (mantissa[2] & (|mantissa[1:0]))))
              c1_mantissa <= {rounding, 2'b00}; // Also clear the least significant bits since you just rounded them up.
            else
              c1_mantissa <= {1'b0, mantissa};
          end
        end
      end
    end
    else
    begin
      // In low-latency mode do not register this stage.
      always@(*)
      begin
        c1_valid <= valid_in;
        c1_sign <= sign;
        c1_exponent_is_max <= (&exponent[10:1]) & ~exponent[0];
        c1_exponent_is_nonzero <= |exponent[10:0];
        c1_exponent <= exponent;
        if (FINITE_MATH_ONLY == 1)
        begin
          if (&mantissa[3:2] || (mantissa[2] & (|mantissa[1:0])))
            c1_mantissa <= {rounding, 2'b00}; // Also clear the least significant bits since you just rounded them up.
          else
            c1_mantissa <= {1'b0, mantissa};
        end
        else
        begin
          if (~exponent[11] && (&mantissa[3:2] || (mantissa[2] & (|mantissa[1:0]))))
            c1_mantissa <= {rounding, 2'b00}; // Also clear the least significant bits since you just rounded them up.
          else
            c1_mantissa <= {1'b0, mantissa};
        end
      end
    end
    endgenerate
    
    // Cycle 2 - Compute any necessary rounding and apply it.
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [55:0] c2_mantissa;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [11:0] c2_exponent;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c2_sign;
    
    assign c2_enable = (HIGH_CAPACITY == 1) ? (~c2_valid | ~c2_stall) : enable;
    assign c1_stall = c2_valid & c2_stall;
    
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        c2_mantissa <= 56'dx;
        c2_exponent <= 12'dx;
        c2_sign <= 1'bx;
        c2_valid <= 1'b0;      
      end
      else if (c2_enable)
      begin
        c2_valid <= c1_valid;
        c2_sign <= c1_sign;
        
        if ((FINITE_MATH_ONLY == 0) && (c1_mantissa[56] & ~c1_exponent[11]))
        begin
          if (c1_exponent_is_max)
            c2_mantissa <= 56'h80000000000000;
          else
          begin
            if (REMOVE_STICKY == 1)
              c2_mantissa <= c1_mantissa[56:1];
            else
              c2_mantissa <= {c1_mantissa[56:2], |c1_mantissa[1:0]};
          end
        end
        else
        begin
          if (FLUSH_DENORMS == 1) 
            c2_mantissa <= c1_mantissa[55:0] & {56{c1_exponent_is_nonzero}};
          else
            c2_mantissa <= c1_mantissa[55:0];          
        end
        
        if ((FINITE_MATH_ONLY == 0) && (c1_exponent[11] | c1_mantissa[56] & c1_exponent_is_max))
          c2_exponent <= 12'hfff;
        else
          c2_exponent <= c1_exponent + {1'b0, c1_mantissa[56] & ~c1_exponent_is_nonzero,
                                  c1_mantissa[56] & c1_exponent_is_nonzero | ~c1_mantissa[56] & c1_mantissa[55] & ~c1_exponent_is_nonzero};        
      end
    end  
  
    assign mantissa_out = c2_mantissa;
    assign exponent_out = c2_exponent;
    assign sign_out = c2_sign;   
    assign valid_out = c2_valid;
    assign c2_stall = stall_in;
endmodule
    
      
