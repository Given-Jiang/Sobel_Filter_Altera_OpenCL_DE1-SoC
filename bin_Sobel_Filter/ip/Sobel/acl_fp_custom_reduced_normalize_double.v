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
    


// Reduced Normalization module
//
// This module performs realignment of data such that the most significant bit is
// 1 for any number with exponent >= 1, and zero otherwise.
//


module acl_fp_custom_reduced_normalize_double(
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
    input [56:0] mantissa;
    input [11:0] exponent; // Exponent with MSB set to 1 is an exception.
    input sign;
    
    // Data output
    output [55:0] mantissa_out; // When mantissa_out[54] = 1 and exponent_out[11] == 1 then the number is NaN.
    output [11:0] exponent_out; // Exponent with MSB set to 1 is an exception.
    output sign_out;

    // Stall/valid and enable signals on per-stage basis.
    reg c1_valid;
    reg c2_valid;
    reg c3_valid;
    reg c4_valid;
    reg c5_valid;
    wire c1_stall;
    wire c2_stall;
    wire c3_stall;
    wire c4_stall;
    wire c5_stall;
    wire c1_enable;
    wire c2_enable;
    wire c3_enable;
    wire c4_enable;
    wire c5_enable;
    
    // Cycle 1 - We are just doing the shifting here.
    reg [56:0] c1_mantissa;
    reg [11:0] c1_exponent;
    reg [5:0] c1_max_shift;
    reg c1_sign;
    reg c1_exponent_is_max;
    reg c1_exponent_is_nonzero;
    reg [13:0] c1_mantissa_nonzero;
    
    assign c1_enable = (HIGH_CAPACITY == 1) ? (~c1_valid | ~c1_stall) : enable;
    assign stall_out = c1_valid & c1_stall;
    
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        c1_mantissa <= 57'dx;
        c1_exponent <= 12'dx;
        c1_sign <= 1'bx;
        c1_exponent_is_max <= 1'bx;
        c1_exponent_is_nonzero <= 1'bx;
        c1_mantissa_nonzero <= 14'dx;
        c1_max_shift <= 6'dx;
        c1_valid <= 1'b0;
      end
      else if (c1_enable)
      begin
        c1_valid <= valid_in;
        c1_sign <= sign;
        c1_exponent <= exponent;
        c1_exponent_is_max <= (&exponent[10:1]) & ~exponent[0];
        c1_exponent_is_nonzero <= |exponent[10:0];
        c1_mantissa_nonzero <= {|mantissa[55:52], |mantissa[51:48], |mantissa[47:44], |mantissa[43:40], |mantissa[39:36], |mantissa[35:32], |mantissa[31:28], |mantissa[27:24], |mantissa[23:20], |mantissa[19:16], |mantissa[15:12], |mantissa[11:8], |mantissa[7:4], |mantissa[3:0]};
        if ((FINITE_MATH_ONLY == 0) && (exponent == 12'h7fe) && mantissa[56])
        begin
          c1_mantissa[56] <= 1'b1;
          c1_mantissa[55:0] <= 56'd0;
        end
        else
          c1_mantissa <= mantissa;
        c1_max_shift <= exponent[11] ? 6'd0 : ({6{|exponent[10:6]}} | {exponent[5:0] - 1'b1});
      end
    end
    
    // Cycle 2 - Shift by 32, 0 or -1. 
    reg [55:0] c2_mantissa;
    reg [11:0] c2_exponent;
    reg c2_sign;
    reg [4:0] c2_max_shift;
    reg [2:0] c2_mantissa_nonzero;
    
    assign c2_enable = (HIGH_CAPACITY == 1) ? (~c2_valid | ~c2_stall) : enable;
    assign c1_stall = c2_valid & c2_stall;
    
    generate
    if (HIGH_LATENCY == 1)
    begin
      always@(posedge clock or negedge resetn)
      begin
        if (~resetn)
        begin
          c2_mantissa <= 56'dx;
          c2_exponent <= 12'dx;
          c2_sign <= 1'bx;
          c2_mantissa_nonzero <= 3'dx;
          c2_max_shift <= 5'dx;
          c2_valid <= 1'b0;
        end
        else if (c2_enable)
        begin
          c2_valid <= c1_valid;
          c2_sign <= c1_sign;
          if (c1_mantissa[56])
          begin
            // -1 
            c2_mantissa_nonzero <= 3'b111;
            if (REMOVE_STICKY == 1)
              c2_mantissa <= c1_mantissa[56:1];
            else
              c2_mantissa <= {c1_mantissa[56:2], |c1_mantissa[1:0]};
            c2_mantissa_nonzero <= 3'b111;
            c2_max_shift <= 4'd0;
            if ((c1_exponent_is_max) && (FINITE_MATH_ONLY == 0))
              c2_exponent <= 12'hfff;
            else
              c2_exponent <= c1_exponent + {1'b0, ~c1_exponent_is_nonzero, c1_exponent_is_nonzero};
          end
          else
          if (~(|c1_mantissa_nonzero[13:6]) && (c1_max_shift[5]) && c1_exponent_is_nonzero)
          begin
            // 32
            c2_mantissa <= {c1_mantissa[23:0], 32'd0};
            c2_exponent <= c1_exponent - 7'd32;
            c2_mantissa_nonzero <= {|c1_mantissa_nonzero[5:4], |c1_mantissa_nonzero[3:2], |c1_mantissa_nonzero[1:0]};
            c2_max_shift <= (c1_max_shift[4:0]) & {5{c1_exponent_is_nonzero}};
          end
          else
          begin
            // 0
            c2_mantissa <= c1_mantissa[55:0];
            c2_exponent <= c1_exponent;
            c2_mantissa_nonzero <= {|c1_mantissa_nonzero[13:12], |c1_mantissa_nonzero[11:10], |c1_mantissa_nonzero[9:8]};
            c2_max_shift <= ({5{c1_max_shift[5]}} | c1_max_shift[4:0]) & {5{c1_exponent_is_nonzero}};
          end
        end
      end
    end
    else
    begin
      // Do not register this stage in low-latency mode.
      always@(*)
      begin
        c2_valid <= c1_valid;
        c2_sign <= c1_sign;
        if (c1_mantissa[56])
        begin
          // -1 
          c2_mantissa_nonzero <= 3'b111;
          if (REMOVE_STICKY == 1)
            c2_mantissa <= c1_mantissa[56:1];
          else
            c2_mantissa <= {c1_mantissa[56:2], |c1_mantissa[1:0]};
          c2_mantissa_nonzero <= 3'b111;
          c2_max_shift <= 4'd0;
          if ((c1_exponent_is_max) && (FINITE_MATH_ONLY == 0))
            c2_exponent <= 12'hfff;
          else
            c2_exponent <= c1_exponent + {1'b0, ~c1_exponent_is_nonzero, c1_exponent_is_nonzero};
        end
        else
        if (~(|c1_mantissa_nonzero[13:6]) && (c1_max_shift[5]) && c1_exponent_is_nonzero)
        begin
          // 32
          c2_mantissa <= {c1_mantissa[23:0], 32'd0};
          c2_exponent <= c1_exponent - 7'd32;
          c2_mantissa_nonzero <= {|c1_mantissa_nonzero[5:4], |c1_mantissa_nonzero[3:2], |c1_mantissa_nonzero[1:0]};
          c2_max_shift <= (c1_max_shift[4:0]) & {5{c1_exponent_is_nonzero}};
        end
        else
        begin
          // 0
          c2_mantissa <= c1_mantissa[55:0];
          c2_exponent <= c1_exponent;
          c2_mantissa_nonzero <= {|c1_mantissa_nonzero[13:12], |c1_mantissa_nonzero[11:10], |c1_mantissa_nonzero[9:8]};
          c2_max_shift <= ({5{c1_max_shift[5]}} | c1_max_shift[4:0]) & {5{c1_exponent_is_nonzero}};
        end
      end
    end
    endgenerate
    
    // Cycle 3 - Shift by 16 or 0 here. 
    reg [55:0] c3_mantissa;
    reg [11:0] c3_exponent;
    reg [3:0] c3_max_shift;
    reg c3_mantissa_nonzero;
    reg c3_sign;
    
    assign c3_enable = (HIGH_CAPACITY == 1) ? (~c3_valid | ~c3_stall) : enable;
    assign c2_stall = c3_valid & c3_stall;
    
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        c3_mantissa <= 56'dx;
        c3_exponent <= 12'dx;
        c3_sign <= 1'bx;
        c3_max_shift <= 4'dx;
        c3_mantissa_nonzero <= 1'bx;
        c3_valid <= 1'b0;
      end
      else if (c3_enable)
      begin
        c3_valid <= c2_valid;
        c3_sign <= c2_sign;
        if (~(|c2_mantissa_nonzero[2:1]) && (c2_max_shift[4]))
        begin
          // 16
          c3_mantissa <= {c2_mantissa[39:0], 16'd0};
          c3_exponent <= c2_exponent - 6'd16;
          c3_max_shift <= c2_max_shift[3:0];
          c3_mantissa_nonzero <= c2_mantissa_nonzero[0];
        end
        else
        begin
          // 0
          c3_mantissa <= c2_mantissa;
          c3_exponent <= c2_exponent;
          c3_max_shift <= c2_max_shift[3:0] | {4{c2_max_shift[4]}};
          c3_mantissa_nonzero <= c2_mantissa_nonzero[2];
        end
      end
    end

    
    
    // Cycle 4 - Shift by 12, 8, 4 or 0 here. 
    reg [55:0] c4_mantissa;
    reg [11:0] c4_exponent;
    reg [1:0] c4_max_shift;
    reg c4_sign;
    
    assign c4_enable = (HIGH_CAPACITY == 1) ? (~c4_valid | ~c4_stall) : enable;
    assign c3_stall = c4_valid & c4_stall;
    
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        c4_mantissa <= 56'dx;
        c4_exponent <= 12'dx;
        c4_sign <= 1'bx;
        c4_valid <= 1'b0;
      end
      else if (c4_enable)
      begin
        c4_valid <= c3_valid;
        c4_sign <= c3_sign;
        if (~c3_mantissa_nonzero && (~|c3_mantissa[47:44]) && (&c3_max_shift[3:2]))
        begin
          // 12
          c4_mantissa <= {c3_mantissa[43:0], 12'd0};
          c4_exponent <= c3_exponent - 6'd12;
          c4_max_shift <= c3_max_shift[1:0];
        end
        else
        if (~c3_mantissa_nonzero && (c3_max_shift[3]))
        begin
          // 8
          c4_mantissa <= {c3_mantissa[47:0], 8'd0};
          c4_exponent <= c3_exponent - 6'd8;
          c4_max_shift <= c3_max_shift[1:0] | {2{c3_max_shift[2]}};
        end
        else
        if ((~|c3_mantissa[55:52]) && (c3_max_shift[2]))
        begin
          // 4
          c4_mantissa <= {c3_mantissa[51:0], 4'd0};
          c4_exponent <= c3_exponent - 6'd4;
          c4_max_shift <= c3_max_shift[1:0] | {2{c3_max_shift[3]}};
        end
        else
        begin
          // 0
          c4_mantissa <= c3_mantissa;
          c4_exponent <= c3_exponent;
          c4_max_shift <= c3_max_shift[1:0] | {2{|c3_max_shift[3:2]}};
        end
      end
    end
    
    // Cycle 5 - Shift by 3,2,1 or 0 here. 
    reg [55:0] c5_mantissa;
    reg [11:0] c5_exponent;
    reg c5_sign;
    
    assign c5_enable = (HIGH_CAPACITY == 1) ? (~c5_valid | ~c5_stall) : enable;
    assign c4_stall = c5_valid & c5_stall;
    
    reg [1:0] shift_by;
    
    always@(*)
    begin
      if (~|c4_mantissa[55:53])
        shift_by = c4_max_shift;
      else if (~|c4_mantissa[55:54])
        shift_by = {c4_max_shift[1], c4_max_shift[0] & ~c4_max_shift[1]};
      else if (~c4_mantissa[55])
        shift_by = {1'b0, |c4_max_shift};
      else
        shift_by = 2'b00;
    end
    
    wire [55:0] resulting_mantissa = c4_mantissa << shift_by;
    
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        c5_mantissa <= 56'dx;
        c5_exponent <= 12'dx;
        c5_sign <= 1'bx;
        c5_valid <= 1'b0;
      end
      else if (c5_enable)
      begin
        c5_valid <= c4_valid;
        c5_sign <= c4_sign;
        c5_mantissa <= resulting_mantissa;
        
        if (~resulting_mantissa[55] && ~c4_exponent[11])
        begin
          // This number just became denormalized
          c5_exponent <= 12'd0;
        end
        else
        begin
          c5_exponent <= c4_exponent - {1'b0, shift_by};
        end
      end
    end    
  
  assign mantissa_out = c5_mantissa;
  assign exponent_out = c5_exponent;
  assign sign_out = c5_sign;
  assign valid_out = c5_valid;
  assign c5_stall = stall_in;
endmodule
