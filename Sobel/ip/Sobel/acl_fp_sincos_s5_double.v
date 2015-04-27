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
    


module acl_fp_sincos_s5_double(clock, resetn, enable, dataa, result_a, result_b);
  // This is a module intended for Stratix IV family
  // Latency = 52.
  input clock, resetn, enable;
  input [63:0] dataa;
  output [63:0] result_a; // sin
  output [63:0] result_b; // cos
  
  FPSinCosXDPS5f375 core(
    .xIn_v(1'b1),
    .xIn_c(8'd0),
    .xIn_0(dataa),
    .en(enable),
    .xOut_v(),
    .xOut_c(),
    .xOut_0(result_a),
    .xOut_1(result_b),
    .clk(clock),
    .areset(~resetn));
endmodule
