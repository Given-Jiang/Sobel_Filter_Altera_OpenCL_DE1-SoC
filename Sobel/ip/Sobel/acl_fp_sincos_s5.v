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
    


module acl_fp_sincos_s5(clock, resetn, dataa, result_a, result_b, enable);
  input clock, resetn, enable;
  input [31:0] dataa;
  output [31:0] result_a; // sin
  output [31:0] result_b; // cos

  fp_sincos_s5 fused(
    .clk(clock),
    .areset(1'b0),
    .en(enable),
    .a(dataa),
    .s(result_a),
    .c(result_b));
    
endmodule
