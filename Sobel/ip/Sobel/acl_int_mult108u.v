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
    


module acl_int_mult108u (clock, enable, dataa, datab, result);
  input clock, enable;
  input [53:0] dataa;
  input [53:0] datab;
  output [107:0] result;

  lpm_mult  lpm_mult_component (
        .clock (clock),
        .dataa (dataa),
        .datab (datab),
        .clken (enable),
        .result (result),
        .aclr (1'b0),
        .sum (1'b0));
  defparam
    lpm_mult_component.lpm_hint = "MAXIMIZE_SPEED=9",
    lpm_mult_component.lpm_pipeline = 3,
    lpm_mult_component.lpm_representation = "UNSIGNED",
    lpm_mult_component.lpm_type = "LPM_MULT",
    lpm_mult_component.lpm_widtha = 54,
    lpm_mult_component.lpm_widthb = 54,
    lpm_mult_component.lpm_widthp = 108;
    
endmodule

