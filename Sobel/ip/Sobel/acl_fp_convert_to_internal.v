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
    


module acl_fp_convert_to_internal(clock, resetn, data, mantissa, exponent, sign, valid_in, valid_out, stall_in, stall_out, enable);
  // This module converts an IEEE 754 floating-point number representation to
  // internal format represented as 27-bit mantissa, 9 bit exponent and a sign.
  parameter HIGH_CAPACITY = 1;
  parameter HIGH_LATENCY = 1;
  parameter FLUSH_DENORMS = 0;
  parameter FINITE_MATH_ONLY = 1;    
  
  input clock, resetn;
  input [31:0] data;
  output [26:0] mantissa;
  output [8:0] exponent;
  output sign;
  
  input enable, valid_in, stall_in;
  output valid_out, stall_out;
  
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_valid;
  wire c1_enable;
  wire c1_stall;
  
  // Cycle 1 - Convert from 32-bit representation to internal format
  assign c1_enable = (HIGH_CAPACITY ? (~c1_stall | ~c1_valid) : enable);
  assign stall_out = c1_stall & c1_valid;
  
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [26:0] c1_mantissa;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [8:0] c1_exponent;
  (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg c1_sign;
  
  generate
  if (HIGH_LATENCY == 1)
  begin 
    always @(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        c1_mantissa <= 27'dx;
        c1_exponent <= 9'dx;
        c1_sign <= 1'bx;
        c1_valid  <= 1'b0;
      end
      else if (c1_enable)
      begin
        c1_valid <= valid_in;
        if ((FLUSH_DENORMS) && (data[30:23] == 8'd0))
          c1_mantissa <= 27'd0;
        else
          c1_mantissa <= {|data[30:23],data[22:0],3'd0};
      
        if (FINITE_MATH_ONLY == 0)
          c1_exponent <= {&data[30:23], data[30:23]};
        else
          c1_exponent <= {1'b0, data[30:23]};
        c1_sign <= data[31];
      end
    end
  end
  else
  begin 
    always @(*)
    begin
      c1_valid <= valid_in;
      if ((FLUSH_DENORMS) && (data[30:23] == 8'd0))
        c1_mantissa <= 27'd0;
      else
        c1_mantissa <= {|data[30:23],data[22:0],3'd0};
    
      if (FINITE_MATH_ONLY == 0)
        c1_exponent <= {&data[30:23], data[30:23]};
      else
        c1_exponent <= {1'b0, data[30:23]};
      c1_sign <= data[31];
    end
  end
  endgenerate  
  
  assign c1_stall = stall_in;
  assign valid_out = c1_valid;
  assign mantissa = c1_mantissa;
  assign exponent = c1_exponent;
  assign sign = c1_sign;
endmodule

