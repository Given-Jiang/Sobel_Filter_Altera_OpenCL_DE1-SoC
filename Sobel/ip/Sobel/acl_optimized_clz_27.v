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
    


module acl_optimized_clz_27(dataa, result);
  // count the number of leading zeros in the 27-bit mantissa
  input [31:0] dataa;
  output [31:0] result;
  wire all_zero;
  
  acl_fp_custom_clz myclz( .mantissa(dataa[26:0]),
                           .result(result[4:0]),
                           .all_zero(all_zero));
  assign result[5] = all_zero;
  assign result[31:6] = 26'd0;        
endmodule

