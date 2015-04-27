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
    


module acl_fp_convert_to_ieee(clock, resetn, mantissa, exponent, sign, result, valid_in, valid_out, stall_in, stall_out, enable);
  input clock, resetn;
  input [26:0] mantissa;
  input [8:0] exponent;
  input sign;
  output [31:0] result;
  input valid_in, stall_in, enable;
  output valid_out, stall_out;
  
  parameter FINITE_MATH_ONLY = 1;
  
  assign valid_out = valid_in;
  assign stall_out = stall_in;
  
  generate
    if (FINITE_MATH_ONLY == 0)
      assign result = {sign, {8{exponent[8]}} | exponent[7:0], mantissa[25:3]};
    else
      assign result = {sign, exponent[7:0], mantissa[25:3]};
  endgenerate
endmodule
