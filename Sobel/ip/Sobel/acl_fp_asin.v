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
    


module acl_fp_asin(clock, resetn, enable, dataa, result);
  input clock, resetn, enable;
  input [31:0] dataa;
  output [31:0] result;
  
  fp_asin core(
      .sysclk(clock),
      .reset(~resetn),
      .enable(enable),
      .signin(dataa[31]),
      .exponentin(dataa[30:23]),
      .mantissain(dataa[22:0]),
      .signout(result[31]),
      .exponentout(result[30:23]),
      .mantissaout(result[22:0])
		);

endmodule

