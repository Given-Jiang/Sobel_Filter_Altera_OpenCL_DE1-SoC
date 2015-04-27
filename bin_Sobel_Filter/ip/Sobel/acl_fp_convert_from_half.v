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
    


module acl_fp_convert_from_half(clock, resetn, dataa, result, valid_in, valid_out, stall_in, stall_out, enable);
  // Convert a floating-point number from half-precision to single-precision. No rounding is required.
  // Half format is [sign, 5-bit exponent, 10-bit mantissa]
  parameter HIGH_CAPACITY = 1;
  input clock, resetn;
  input [15:0] dataa;
  output [31:0] result;
  input valid_in, stall_in, enable;
  output valid_out, stall_out;
    
  wire c1_enable;
  reg c1_valid;
  wire c1_stall;
  
  reg [7:0] c1_exponent;
  reg [22:0] c1_mantissa;
  reg c1_sign;
  
  assign c1_enable = (HIGH_CAPACITY == 1) ? (~c1_valid | ~c1_stall) : enable;
  assign stall_out = c1_valid & c1_stall;
  
  wire [3:0] count;
  wire [9:0] shifted_mantissa;
  
  half_type_clz clz(.mantissa(dataa[9:0]), .count(count));
  assign shifted_mantissa = dataa[9:0] << count;
  
  always@(posedge clock or negedge resetn)
  begin
    if(~resetn)
    begin
      c1_valid <= 1'b0;
      c1_exponent <= 8'dx;
      c1_mantissa <= 23'dx;
      c1_sign <= 1'bx;
    end
    else if (c1_enable)
    begin
      c1_valid <= valid_in;
      c1_sign <= dataa[15];
      if (&dataa[14:10])
      begin
        c1_exponent <= 8'hff;
        c1_mantissa <= {dataa[9:0], 13'd0};
      end
      else if (~(|dataa[14:10]))
      begin
        // in a case of exponent being 0, we only set exponent to zero if the mantissa is all zeros.
        // Otherwise, we must shift the mantissa left and adjust the exponent accordingly.
        if (~|dataa[9:0])
        begin
          c1_exponent <= 8'd0;
          c1_mantissa <= 23'd0;
        end
        else
        begin
          c1_exponent <= 8'd112 - {1'b0, count};
          c1_mantissa <= {shifted_mantissa[8:0], 14'd0};
        end
      end
      else
      begin
        c1_exponent <= 8'd112 + {1'b0, dataa[14:10]};
        c1_mantissa <= {dataa[9:0], 13'd0};
    end
    end
  end
    
  assign result = {c1_sign, c1_exponent, c1_mantissa};
  assign valid_out = c1_valid;
  assign c1_stall = stall_in;
  
 endmodule
 
 
 module half_type_clz(mantissa, count);
   input [9:0] mantissa;
   output [3:0] count;
   
   assign count[3] = ~|mantissa[9:2];
   assign count[2] = |mantissa[9:2] & ~|mantissa[9:6];
   assign count[1] = count[3] & ~|mantissa[1:0] | ~count[3] & (~count[2] & ~|mantissa[9:8] | count[2] & ~|mantissa[5:4]);
   assign count[0] = (mantissa[9:8] == 2'b01) |
                     (mantissa[9:6] == 4'b0001) |
                     (mantissa[9:4] == 6'b000001) |
                     (mantissa[9:2] == 8'b00000001) |
                     (mantissa == 10'b0000000001);
 endmodule
  
