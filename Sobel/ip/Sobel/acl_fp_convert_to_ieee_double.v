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
    


module acl_fp_convert_to_ieee_double(clock, resetn, mantissa, exponent, sign, result, valid_in, valid_out, stall_in, stall_out, enable);
  input clock, resetn;
  input [55:0] mantissa;
  input [11:0] exponent;
  input sign;
  output [63:0] result;
  input valid_in, stall_in, enable;
  output valid_out, stall_out;
  parameter FINITE_MATH_ONLY = 1;  
  
  assign valid_out = valid_in;
  assign stall_out = stall_in;
  generate
    if (FINITE_MATH_ONLY == 0)  
      assign result = {sign, {11{exponent[11]}} | exponent[10:0], mantissa[54:3]};
    else
      assign result = {sign, exponent[10:0], mantissa[54:3]};
  endgenerate      
endmodule
