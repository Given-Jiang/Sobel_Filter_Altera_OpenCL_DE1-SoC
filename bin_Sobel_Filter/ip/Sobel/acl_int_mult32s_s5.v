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
    



// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module acl_int_mult32s_s5 (
	enable,
	clock,
	dataa,
	datab,
	result);

  parameter INPUT1_WIDTH = 32;
  parameter INPUT2_WIDTH = 32;

  localparam INPUT1_WIDTH_WITH_SIGN = INPUT1_WIDTH < 32 ? INPUT1_WIDTH + 1 : INPUT1_WIDTH;
  localparam INPUT2_WIDTH_WITH_SIGN = INPUT2_WIDTH < 32 ? INPUT2_WIDTH + 1 : INPUT2_WIDTH;
    
	input	  enable;
	input	  clock;
	input	[INPUT1_WIDTH_WITH_SIGN - 1 : 0]  dataa;
	input	[INPUT2_WIDTH_WITH_SIGN - 1 : 0]  datab;

	(* altera_attribute = "-name auto_shift_register_recognition OFF" *) output reg [31:0] result;
	(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [INPUT1_WIDTH_WITH_SIGN - 1 : 0]  reg_dataa;
	(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [INPUT2_WIDTH_WITH_SIGN - 1 : 0]  reg_datab;
	(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [INPUT1_WIDTH_WITH_SIGN - 1 : 0]  reg_dataa2;
	(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [INPUT2_WIDTH_WITH_SIGN - 1 : 0]  reg_datab2;

generate
if(INPUT1_WIDTH>=19 && INPUT1_WIDTH<=27 && INPUT2_WIDTH>=19 && INPUT2_WIDTH<=27)
begin
  // Use a special WYSIWYG for the 27x27 multiplier mode

  always@(posedge clock)
  begin
    if (enable)
    begin
      reg_dataa <= dataa;
      reg_datab <= datab;
    end
  end

  wire [53:0] mul_result;
  wire [26:0] inp_a;
  wire [26:0] inp_b;

  assign inp_a = reg_dataa;
  assign inp_b = reg_datab;

  sv_mult27 the_multiplier(clock,enable,inp_a,inp_b,mul_result);

  always@(*)
  begin
     result <= mul_result;
  end
end
else
begin
  // Default LPM_MULT inference
  always@(posedge clock)
  begin
    if (enable)
    begin
      result <= reg_dataa2 * reg_datab2; 
      reg_dataa <= dataa;
      reg_datab <= datab;
      reg_dataa2 <= reg_dataa;
      reg_datab2 <= reg_datab;
    end
  end
end
endgenerate

endmodule

