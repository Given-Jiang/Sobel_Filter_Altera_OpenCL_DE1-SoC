//Copyright (C) 1991-2012 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


//altfp_sqrt CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Stratix V" PIPELINE=30 ROUNDING="TO_NEAREST" WIDTH_EXP=11 WIDTH_MAN=52 clk_en clock data result
//VERSION_BEGIN 12.0 cbx_altfp_sqrt 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



//alt_sqrt_block CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Stratix V" PIPELINE=30 WIDTH_SQRT=54 aclr clken clock rad root_result
//VERSION_BEGIN 12.0 cbx_altfp_sqrt 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 54 reg 2383 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_sqrt_s5_double_alt_sqrt_block_odb
	( 
	aclr,
	clken,
	clock,
	rad,
	root_result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [54:0]  rad;
	output   [53:0]  root_result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[1:0]	q_ff0c;
	reg	[51:0]	q_ff10c;
	reg	[51:0]	q_ff12c;
	reg	[51:0]	q_ff14c;
	reg	[51:0]	q_ff16c;
	reg	[51:0]	q_ff18c;
	reg	[51:0]	q_ff20c;
	reg	[51:0]	q_ff22c;
	reg	[51:0]	q_ff24c;
	reg	[51:0]	q_ff26c;
	reg	[51:0]	q_ff28c;
	reg	[51:0]	q_ff2c;
	reg	[51:0]	q_ff30c;
	reg	[51:0]	q_ff32c;
	reg	[51:0]	q_ff34c;
	reg	[51:0]	q_ff36c;
	reg	[51:0]	q_ff38c;
	reg	[51:0]	q_ff40c;
	reg	[51:0]	q_ff42c;
	reg	[51:0]	q_ff44c;
	reg	[51:0]	q_ff46c;
	reg	[51:0]	q_ff48c;
	reg	[51:0]	q_ff4c;
	reg	[51:0]	q_ff50c;
	reg	[26:0]	q_ff52c;
	reg	[51:0]	q_ff6c;
	reg	[51:0]	q_ff8c;
	reg	[43:0]	rad_ff11c;
	reg	[41:0]	rad_ff13c;
	reg	[39:0]	rad_ff15c;
	reg	[37:0]	rad_ff17c;
	reg	[35:0]	rad_ff19c;
	reg	[53:0]	rad_ff1c;
	reg	[33:0]	rad_ff21c;
	reg	[31:0]	rad_ff23c;
	reg	[29:0]	rad_ff25c;
	reg	[27:0]	rad_ff27c;
	reg	[28:0]	rad_ff29c;
	reg	[30:0]	rad_ff31c;
	reg	[32:0]	rad_ff33c;
	reg	[34:0]	rad_ff35c;
	reg	[36:0]	rad_ff37c;
	reg	[38:0]	rad_ff39c;
	reg	[51:0]	rad_ff3c;
	reg	[40:0]	rad_ff41c;
	reg	[42:0]	rad_ff43c;
	reg	[44:0]	rad_ff45c;
	reg	[46:0]	rad_ff47c;
	reg	[48:0]	rad_ff49c;
	reg	[50:0]	rad_ff51c;
	reg	[49:0]	rad_ff5c;
	reg	[47:0]	rad_ff7c;
	reg	[45:0]	rad_ff9c;
	wire  [8:0]   wire_add_sub10_result;
	wire  [9:0]   wire_add_sub11_result;
	wire  [10:0]   wire_add_sub12_result;
	wire  [11:0]   wire_add_sub13_result;
	wire  [12:0]   wire_add_sub14_result;
	wire  [13:0]   wire_add_sub15_result;
	wire  [14:0]   wire_add_sub16_result;
	wire  [15:0]   wire_add_sub17_result;
	wire  [16:0]   wire_add_sub18_result;
	wire  [17:0]   wire_add_sub19_result;
	wire  [18:0]   wire_add_sub20_result;
	wire  [19:0]   wire_add_sub21_result;
	wire  [20:0]   wire_add_sub22_result;
	wire  [21:0]   wire_add_sub23_result;
	wire  [22:0]   wire_add_sub24_result;
	wire  [23:0]   wire_add_sub25_result;
	wire  [24:0]   wire_add_sub26_result;
	wire  [25:0]   wire_add_sub27_result;
	wire  [26:0]   wire_add_sub28_result;
	wire  [27:0]   wire_add_sub29_result;
	wire  [28:0]   wire_add_sub30_result;
	wire  [27:0]   wire_add_sub31_result;
	wire  [27:0]   wire_add_sub32_result;
	wire  [28:0]   wire_add_sub33_result;
	wire  [29:0]   wire_add_sub34_result;
	wire  [30:0]   wire_add_sub35_result;
	wire  [31:0]   wire_add_sub36_result;
	wire  [32:0]   wire_add_sub37_result;
	wire  [33:0]   wire_add_sub38_result;
	wire  [34:0]   wire_add_sub39_result;
	wire  [2:0]   wire_add_sub4_result;
	wire  [35:0]   wire_add_sub40_result;
	wire  [36:0]   wire_add_sub41_result;
	wire  [37:0]   wire_add_sub42_result;
	wire  [38:0]   wire_add_sub43_result;
	wire  [39:0]   wire_add_sub44_result;
	wire  [40:0]   wire_add_sub45_result;
	wire  [41:0]   wire_add_sub46_result;
	wire  [42:0]   wire_add_sub47_result;
	wire  [43:0]   wire_add_sub48_result;
	wire  [44:0]   wire_add_sub49_result;
	wire  [3:0]   wire_add_sub5_result;
	wire  [45:0]   wire_add_sub50_result;
	wire  [46:0]   wire_add_sub51_result;
	wire  [47:0]   wire_add_sub52_result;
	wire  [48:0]   wire_add_sub53_result;
	wire  [49:0]   wire_add_sub54_result;
	wire  [50:0]   wire_add_sub55_result;
	wire  [51:0]   wire_add_sub56_result;
	wire  [52:0]   wire_add_sub57_result;
	wire  [4:0]   wire_add_sub6_result;
	wire  [5:0]   wire_add_sub7_result;
	wire  [6:0]   wire_add_sub8_result;
	wire  [7:0]   wire_add_sub9_result;
	wire  [55:0]  addnode_w0c;
	wire  [55:0]  addnode_w10c;
	wire  [55:0]  addnode_w11c;
	wire  [55:0]  addnode_w12c;
	wire  [55:0]  addnode_w13c;
	wire  [55:0]  addnode_w14c;
	wire  [55:0]  addnode_w15c;
	wire  [55:0]  addnode_w16c;
	wire  [55:0]  addnode_w17c;
	wire  [55:0]  addnode_w18c;
	wire  [55:0]  addnode_w19c;
	wire  [55:0]  addnode_w1c;
	wire  [55:0]  addnode_w20c;
	wire  [55:0]  addnode_w21c;
	wire  [55:0]  addnode_w22c;
	wire  [55:0]  addnode_w23c;
	wire  [55:0]  addnode_w24c;
	wire  [55:0]  addnode_w25c;
	wire  [55:0]  addnode_w26c;
	wire  [55:0]  addnode_w27c;
	wire  [55:0]  addnode_w28c;
	wire  [55:0]  addnode_w29c;
	wire  [55:0]  addnode_w2c;
	wire  [55:0]  addnode_w30c;
	wire  [55:0]  addnode_w31c;
	wire  [55:0]  addnode_w32c;
	wire  [55:0]  addnode_w33c;
	wire  [55:0]  addnode_w34c;
	wire  [55:0]  addnode_w35c;
	wire  [55:0]  addnode_w36c;
	wire  [55:0]  addnode_w37c;
	wire  [55:0]  addnode_w38c;
	wire  [55:0]  addnode_w39c;
	wire  [55:0]  addnode_w3c;
	wire  [55:0]  addnode_w40c;
	wire  [55:0]  addnode_w41c;
	wire  [55:0]  addnode_w42c;
	wire  [55:0]  addnode_w43c;
	wire  [55:0]  addnode_w44c;
	wire  [55:0]  addnode_w45c;
	wire  [55:0]  addnode_w46c;
	wire  [55:0]  addnode_w47c;
	wire  [55:0]  addnode_w48c;
	wire  [55:0]  addnode_w49c;
	wire  [55:0]  addnode_w4c;
	wire  [55:0]  addnode_w50c;
	wire  [55:0]  addnode_w51c;
	wire  [55:0]  addnode_w52c;
	wire  [55:0]  addnode_w53c;
	wire  [55:0]  addnode_w5c;
	wire  [55:0]  addnode_w6c;
	wire  [55:0]  addnode_w7c;
	wire  [55:0]  addnode_w8c;
	wire  [55:0]  addnode_w9c;
	wire  [2:0]  qlevel_w0c;
	wire  [12:0]  qlevel_w10c;
	wire  [13:0]  qlevel_w11c;
	wire  [14:0]  qlevel_w12c;
	wire  [15:0]  qlevel_w13c;
	wire  [16:0]  qlevel_w14c;
	wire  [17:0]  qlevel_w15c;
	wire  [18:0]  qlevel_w16c;
	wire  [19:0]  qlevel_w17c;
	wire  [20:0]  qlevel_w18c;
	wire  [21:0]  qlevel_w19c;
	wire  [3:0]  qlevel_w1c;
	wire  [22:0]  qlevel_w20c;
	wire  [23:0]  qlevel_w21c;
	wire  [24:0]  qlevel_w22c;
	wire  [25:0]  qlevel_w23c;
	wire  [26:0]  qlevel_w24c;
	wire  [27:0]  qlevel_w25c;
	wire  [28:0]  qlevel_w26c;
	wire  [29:0]  qlevel_w27c;
	wire  [30:0]  qlevel_w28c;
	wire  [31:0]  qlevel_w29c;
	wire  [4:0]  qlevel_w2c;
	wire  [32:0]  qlevel_w30c;
	wire  [33:0]  qlevel_w31c;
	wire  [34:0]  qlevel_w32c;
	wire  [35:0]  qlevel_w33c;
	wire  [36:0]  qlevel_w34c;
	wire  [37:0]  qlevel_w35c;
	wire  [38:0]  qlevel_w36c;
	wire  [39:0]  qlevel_w37c;
	wire  [40:0]  qlevel_w38c;
	wire  [41:0]  qlevel_w39c;
	wire  [5:0]  qlevel_w3c;
	wire  [42:0]  qlevel_w40c;
	wire  [43:0]  qlevel_w41c;
	wire  [44:0]  qlevel_w42c;
	wire  [45:0]  qlevel_w43c;
	wire  [46:0]  qlevel_w44c;
	wire  [47:0]  qlevel_w45c;
	wire  [48:0]  qlevel_w46c;
	wire  [49:0]  qlevel_w47c;
	wire  [50:0]  qlevel_w48c;
	wire  [51:0]  qlevel_w49c;
	wire  [6:0]  qlevel_w4c;
	wire  [52:0]  qlevel_w50c;
	wire  [53:0]  qlevel_w51c;
	wire  [54:0]  qlevel_w52c;
	wire  [55:0]  qlevel_w53c;
	wire  [7:0]  qlevel_w5c;
	wire  [8:0]  qlevel_w6c;
	wire  [9:0]  qlevel_w7c;
	wire  [10:0]  qlevel_w8c;
	wire  [11:0]  qlevel_w9c;
	wire  [55:0]  slevel_w0c;
	wire  [55:0]  slevel_w10c;
	wire  [55:0]  slevel_w11c;
	wire  [55:0]  slevel_w12c;
	wire  [55:0]  slevel_w13c;
	wire  [55:0]  slevel_w14c;
	wire  [55:0]  slevel_w15c;
	wire  [55:0]  slevel_w16c;
	wire  [55:0]  slevel_w17c;
	wire  [55:0]  slevel_w18c;
	wire  [55:0]  slevel_w19c;
	wire  [55:0]  slevel_w1c;
	wire  [55:0]  slevel_w20c;
	wire  [55:0]  slevel_w21c;
	wire  [55:0]  slevel_w22c;
	wire  [55:0]  slevel_w23c;
	wire  [55:0]  slevel_w24c;
	wire  [55:0]  slevel_w25c;
	wire  [55:0]  slevel_w26c;
	wire  [55:0]  slevel_w27c;
	wire  [55:0]  slevel_w28c;
	wire  [55:0]  slevel_w29c;
	wire  [55:0]  slevel_w2c;
	wire  [55:0]  slevel_w30c;
	wire  [55:0]  slevel_w31c;
	wire  [55:0]  slevel_w32c;
	wire  [55:0]  slevel_w33c;
	wire  [55:0]  slevel_w34c;
	wire  [55:0]  slevel_w35c;
	wire  [55:0]  slevel_w36c;
	wire  [55:0]  slevel_w37c;
	wire  [55:0]  slevel_w38c;
	wire  [55:0]  slevel_w39c;
	wire  [55:0]  slevel_w3c;
	wire  [55:0]  slevel_w40c;
	wire  [55:0]  slevel_w41c;
	wire  [55:0]  slevel_w42c;
	wire  [55:0]  slevel_w43c;
	wire  [55:0]  slevel_w44c;
	wire  [55:0]  slevel_w45c;
	wire  [55:0]  slevel_w46c;
	wire  [55:0]  slevel_w47c;
	wire  [55:0]  slevel_w48c;
	wire  [55:0]  slevel_w49c;
	wire  [55:0]  slevel_w4c;
	wire  [55:0]  slevel_w50c;
	wire  [55:0]  slevel_w51c;
	wire  [55:0]  slevel_w52c;
	wire  [55:0]  slevel_w53c;
	wire  [55:0]  slevel_w5c;
	wire  [55:0]  slevel_w6c;
	wire  [55:0]  slevel_w7c;
	wire  [55:0]  slevel_w8c;
	wire  [55:0]  slevel_w9c;

	// synopsys translate_off
	initial
		q_ff0c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff0c <= 2'b0;
		else if  (clken == 1'b1)   q_ff0c <= {(~ addnode_w52c[55]), (~ addnode_w53c[55])};
	// synopsys translate_off
	initial
		q_ff10c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff10c <= 52'b0;
		else if  (clken == 1'b1)   q_ff10c <= {q_ff10c[49:0], (~ addnode_w42c[55]), (~ addnode_w43c[55])};
	// synopsys translate_off
	initial
		q_ff12c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff12c <= 52'b0;
		else if  (clken == 1'b1)   q_ff12c <= {q_ff12c[49:0], (~ addnode_w40c[55]), (~ addnode_w41c[55])};
	// synopsys translate_off
	initial
		q_ff14c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff14c <= 52'b0;
		else if  (clken == 1'b1)   q_ff14c <= {q_ff14c[49:0], (~ addnode_w38c[55]), (~ addnode_w39c[55])};
	// synopsys translate_off
	initial
		q_ff16c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff16c <= 52'b0;
		else if  (clken == 1'b1)   q_ff16c <= {q_ff16c[49:0], (~ addnode_w36c[55]), (~ addnode_w37c[55])};
	// synopsys translate_off
	initial
		q_ff18c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff18c <= 52'b0;
		else if  (clken == 1'b1)   q_ff18c <= {q_ff18c[49:0], (~ addnode_w34c[55]), (~ addnode_w35c[55])};
	// synopsys translate_off
	initial
		q_ff20c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff20c <= 52'b0;
		else if  (clken == 1'b1)   q_ff20c <= {q_ff20c[49:0], (~ addnode_w32c[55]), (~ addnode_w33c[55])};
	// synopsys translate_off
	initial
		q_ff22c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff22c <= 52'b0;
		else if  (clken == 1'b1)   q_ff22c <= {q_ff22c[49:0], (~ addnode_w30c[55]), (~ addnode_w31c[55])};
	// synopsys translate_off
	initial
		q_ff24c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff24c <= 52'b0;
		else if  (clken == 1'b1)   q_ff24c <= {q_ff24c[49:0], (~ addnode_w28c[55]), (~ addnode_w29c[55])};
	// synopsys translate_off
	initial
		q_ff26c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff26c <= 52'b0;
		else if  (clken == 1'b1)   q_ff26c <= {q_ff26c[49:0], (~ addnode_w26c[55]), (~ addnode_w27c[55])};
	// synopsys translate_off
	initial
		q_ff28c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff28c <= 52'b0;
		else if  (clken == 1'b1)   q_ff28c <= {q_ff28c[49:0], (~ addnode_w24c[55]), (~ addnode_w25c[55])};
	// synopsys translate_off
	initial
		q_ff2c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff2c <= 52'b0;
		else if  (clken == 1'b1)   q_ff2c <= {q_ff2c[49:0], (~ addnode_w50c[55]), (~ addnode_w51c[55])};
	// synopsys translate_off
	initial
		q_ff30c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff30c <= 52'b0;
		else if  (clken == 1'b1)   q_ff30c <= {q_ff30c[49:0], (~ addnode_w22c[55]), (~ addnode_w23c[55])};
	// synopsys translate_off
	initial
		q_ff32c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff32c <= 52'b0;
		else if  (clken == 1'b1)   q_ff32c <= {q_ff32c[49:0], (~ addnode_w20c[55]), (~ addnode_w21c[55])};
	// synopsys translate_off
	initial
		q_ff34c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff34c <= 52'b0;
		else if  (clken == 1'b1)   q_ff34c <= {q_ff34c[49:0], (~ addnode_w18c[55]), (~ addnode_w19c[55])};
	// synopsys translate_off
	initial
		q_ff36c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff36c <= 52'b0;
		else if  (clken == 1'b1)   q_ff36c <= {q_ff36c[49:0], (~ addnode_w16c[55]), (~ addnode_w17c[55])};
	// synopsys translate_off
	initial
		q_ff38c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff38c <= 52'b0;
		else if  (clken == 1'b1)   q_ff38c <= {q_ff38c[49:0], (~ addnode_w14c[55]), (~ addnode_w15c[55])};
	// synopsys translate_off
	initial
		q_ff40c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff40c <= 52'b0;
		else if  (clken == 1'b1)   q_ff40c <= {q_ff40c[49:0], (~ addnode_w12c[55]), (~ addnode_w13c[55])};
	// synopsys translate_off
	initial
		q_ff42c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff42c <= 52'b0;
		else if  (clken == 1'b1)   q_ff42c <= {q_ff42c[49:0], (~ addnode_w10c[55]), (~ addnode_w11c[55])};
	// synopsys translate_off
	initial
		q_ff44c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff44c <= 52'b0;
		else if  (clken == 1'b1)   q_ff44c <= {q_ff44c[49:0], (~ addnode_w8c[55]), (~ addnode_w9c[55])};
	// synopsys translate_off
	initial
		q_ff46c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff46c <= 52'b0;
		else if  (clken == 1'b1)   q_ff46c <= {q_ff46c[49:0], (~ addnode_w6c[55]), (~ addnode_w7c[55])};
	// synopsys translate_off
	initial
		q_ff48c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff48c <= 52'b0;
		else if  (clken == 1'b1)   q_ff48c <= {q_ff48c[49:0], (~ addnode_w4c[55]), (~ addnode_w5c[55])};
	// synopsys translate_off
	initial
		q_ff4c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff4c <= 52'b0;
		else if  (clken == 1'b1)   q_ff4c <= {q_ff4c[49:0], (~ addnode_w48c[55]), (~ addnode_w49c[55])};
	// synopsys translate_off
	initial
		q_ff50c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff50c <= 52'b0;
		else if  (clken == 1'b1)   q_ff50c <= {q_ff50c[49:0], (~ addnode_w2c[55]), (~ addnode_w3c[55])};
	// synopsys translate_off
	initial
		q_ff52c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff52c <= 27'b0;
		else if  (clken == 1'b1)   q_ff52c <= {q_ff52c[25:0], (~ addnode_w1c[55])};
	// synopsys translate_off
	initial
		q_ff6c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff6c <= 52'b0;
		else if  (clken == 1'b1)   q_ff6c <= {q_ff6c[49:0], (~ addnode_w46c[55]), (~ addnode_w47c[55])};
	// synopsys translate_off
	initial
		q_ff8c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff8c <= 52'b0;
		else if  (clken == 1'b1)   q_ff8c <= {q_ff8c[49:0], (~ addnode_w44c[55]), (~ addnode_w45c[55])};
	// synopsys translate_off
	initial
		rad_ff11c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff11c <= 44'b0;
		else if  (clken == 1'b1)   rad_ff11c <= addnode_w11c[55:12];
	// synopsys translate_off
	initial
		rad_ff13c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff13c <= 42'b0;
		else if  (clken == 1'b1)   rad_ff13c <= addnode_w13c[55:14];
	// synopsys translate_off
	initial
		rad_ff15c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff15c <= 40'b0;
		else if  (clken == 1'b1)   rad_ff15c <= addnode_w15c[55:16];
	// synopsys translate_off
	initial
		rad_ff17c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff17c <= 38'b0;
		else if  (clken == 1'b1)   rad_ff17c <= addnode_w17c[55:18];
	// synopsys translate_off
	initial
		rad_ff19c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff19c <= 36'b0;
		else if  (clken == 1'b1)   rad_ff19c <= addnode_w19c[55:20];
	// synopsys translate_off
	initial
		rad_ff1c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff1c <= 54'b0;
		else if  (clken == 1'b1)   rad_ff1c <= addnode_w1c[55:2];
	// synopsys translate_off
	initial
		rad_ff21c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff21c <= 34'b0;
		else if  (clken == 1'b1)   rad_ff21c <= addnode_w21c[55:22];
	// synopsys translate_off
	initial
		rad_ff23c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff23c <= 32'b0;
		else if  (clken == 1'b1)   rad_ff23c <= addnode_w23c[55:24];
	// synopsys translate_off
	initial
		rad_ff25c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff25c <= 30'b0;
		else if  (clken == 1'b1)   rad_ff25c <= addnode_w25c[55:26];
	// synopsys translate_off
	initial
		rad_ff27c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff27c <= 28'b0;
		else if  (clken == 1'b1)   rad_ff27c <= addnode_w27c[55:28];
	// synopsys translate_off
	initial
		rad_ff29c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff29c <= 29'b0;
		else if  (clken == 1'b1)   rad_ff29c <= addnode_w29c[55:27];
	// synopsys translate_off
	initial
		rad_ff31c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff31c <= 31'b0;
		else if  (clken == 1'b1)   rad_ff31c <= addnode_w31c[55:25];
	// synopsys translate_off
	initial
		rad_ff33c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff33c <= 33'b0;
		else if  (clken == 1'b1)   rad_ff33c <= addnode_w33c[55:23];
	// synopsys translate_off
	initial
		rad_ff35c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff35c <= 35'b0;
		else if  (clken == 1'b1)   rad_ff35c <= addnode_w35c[55:21];
	// synopsys translate_off
	initial
		rad_ff37c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff37c <= 37'b0;
		else if  (clken == 1'b1)   rad_ff37c <= addnode_w37c[55:19];
	// synopsys translate_off
	initial
		rad_ff39c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff39c <= 39'b0;
		else if  (clken == 1'b1)   rad_ff39c <= addnode_w39c[55:17];
	// synopsys translate_off
	initial
		rad_ff3c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff3c <= 52'b0;
		else if  (clken == 1'b1)   rad_ff3c <= addnode_w3c[55:4];
	// synopsys translate_off
	initial
		rad_ff41c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff41c <= 41'b0;
		else if  (clken == 1'b1)   rad_ff41c <= addnode_w41c[55:15];
	// synopsys translate_off
	initial
		rad_ff43c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff43c <= 43'b0;
		else if  (clken == 1'b1)   rad_ff43c <= addnode_w43c[55:13];
	// synopsys translate_off
	initial
		rad_ff45c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff45c <= 45'b0;
		else if  (clken == 1'b1)   rad_ff45c <= addnode_w45c[55:11];
	// synopsys translate_off
	initial
		rad_ff47c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff47c <= 47'b0;
		else if  (clken == 1'b1)   rad_ff47c <= addnode_w47c[55:9];
	// synopsys translate_off
	initial
		rad_ff49c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff49c <= 49'b0;
		else if  (clken == 1'b1)   rad_ff49c <= addnode_w49c[55:7];
	// synopsys translate_off
	initial
		rad_ff51c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff51c <= 51'b0;
		else if  (clken == 1'b1)   rad_ff51c <= addnode_w51c[55:5];
	// synopsys translate_off
	initial
		rad_ff5c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff5c <= 50'b0;
		else if  (clken == 1'b1)   rad_ff5c <= addnode_w5c[55:6];
	// synopsys translate_off
	initial
		rad_ff7c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff7c <= 48'b0;
		else if  (clken == 1'b1)   rad_ff7c <= addnode_w7c[55:8];
	// synopsys translate_off
	initial
		rad_ff9c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff9c <= 46'b0;
		else if  (clken == 1'b1)   rad_ff9c <= addnode_w9c[55:10];
	lpm_add_sub   add_sub10
	( 
	.cout(),
	.dataa({slevel_w6c[55:47]}),
	.datab({(({7{(~ rad_ff5c[49])}} & (~ qlevel_w6c[8:2])) | ({7{rad_ff5c[49]}} & qlevel_w6c[8:2])), qlevel_w6c[1:0]}),
	.overflow(),
	.result(wire_add_sub10_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub10.lpm_direction = "ADD",
		add_sub10.lpm_pipeline = 0,
		add_sub10.lpm_width = 9,
		add_sub10.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub11
	( 
	.cout(),
	.dataa({slevel_w7c[55:46]}),
	.datab({(({8{(~ addnode_w6c[55])}} & (~ qlevel_w7c[9:2])) | ({8{addnode_w6c[55]}} & qlevel_w7c[9:2])), qlevel_w7c[1:0]}),
	.overflow(),
	.result(wire_add_sub11_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub11.lpm_direction = "ADD",
		add_sub11.lpm_pipeline = 0,
		add_sub11.lpm_width = 10,
		add_sub11.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub12
	( 
	.cout(),
	.dataa({slevel_w8c[55:45]}),
	.datab({(({9{(~ rad_ff7c[47])}} & (~ qlevel_w8c[10:2])) | ({9{rad_ff7c[47]}} & qlevel_w8c[10:2])), qlevel_w8c[1:0]}),
	.overflow(),
	.result(wire_add_sub12_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub12.lpm_direction = "ADD",
		add_sub12.lpm_pipeline = 0,
		add_sub12.lpm_width = 11,
		add_sub12.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub13
	( 
	.cout(),
	.dataa({slevel_w9c[55:44]}),
	.datab({(({10{(~ addnode_w8c[55])}} & (~ qlevel_w9c[11:2])) | ({10{addnode_w8c[55]}} & qlevel_w9c[11:2])), qlevel_w9c[1:0]}),
	.overflow(),
	.result(wire_add_sub13_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub13.lpm_direction = "ADD",
		add_sub13.lpm_pipeline = 0,
		add_sub13.lpm_width = 12,
		add_sub13.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub14
	( 
	.cout(),
	.dataa({slevel_w10c[55:43]}),
	.datab({(({11{(~ rad_ff9c[45])}} & (~ qlevel_w10c[12:2])) | ({11{rad_ff9c[45]}} & qlevel_w10c[12:2])), qlevel_w10c[1:0]}),
	.overflow(),
	.result(wire_add_sub14_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub14.lpm_direction = "ADD",
		add_sub14.lpm_pipeline = 0,
		add_sub14.lpm_width = 13,
		add_sub14.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub15
	( 
	.cout(),
	.dataa({slevel_w11c[55:42]}),
	.datab({(({12{(~ addnode_w10c[55])}} & (~ qlevel_w11c[13:2])) | ({12{addnode_w10c[55]}} & qlevel_w11c[13:2])), qlevel_w11c[1:0]}),
	.overflow(),
	.result(wire_add_sub15_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub15.lpm_direction = "ADD",
		add_sub15.lpm_pipeline = 0,
		add_sub15.lpm_width = 14,
		add_sub15.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub16
	( 
	.cout(),
	.dataa({slevel_w12c[55:41]}),
	.datab({(({13{(~ rad_ff11c[43])}} & (~ qlevel_w12c[14:2])) | ({13{rad_ff11c[43]}} & qlevel_w12c[14:2])), qlevel_w12c[1:0]}),
	.overflow(),
	.result(wire_add_sub16_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub16.lpm_direction = "ADD",
		add_sub16.lpm_pipeline = 0,
		add_sub16.lpm_width = 15,
		add_sub16.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub17
	( 
	.cout(),
	.dataa({slevel_w13c[55:40]}),
	.datab({(({14{(~ addnode_w12c[55])}} & (~ qlevel_w13c[15:2])) | ({14{addnode_w12c[55]}} & qlevel_w13c[15:2])), qlevel_w13c[1:0]}),
	.overflow(),
	.result(wire_add_sub17_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub17.lpm_direction = "ADD",
		add_sub17.lpm_pipeline = 0,
		add_sub17.lpm_width = 16,
		add_sub17.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub18
	( 
	.cout(),
	.dataa({slevel_w14c[55:39]}),
	.datab({(({15{(~ rad_ff13c[41])}} & (~ qlevel_w14c[16:2])) | ({15{rad_ff13c[41]}} & qlevel_w14c[16:2])), qlevel_w14c[1:0]}),
	.overflow(),
	.result(wire_add_sub18_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub18.lpm_direction = "ADD",
		add_sub18.lpm_pipeline = 0,
		add_sub18.lpm_width = 17,
		add_sub18.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub19
	( 
	.cout(),
	.dataa({slevel_w15c[55:38]}),
	.datab({(({16{(~ addnode_w14c[55])}} & (~ qlevel_w15c[17:2])) | ({16{addnode_w14c[55]}} & qlevel_w15c[17:2])), qlevel_w15c[1:0]}),
	.overflow(),
	.result(wire_add_sub19_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub19.lpm_direction = "ADD",
		add_sub19.lpm_pipeline = 0,
		add_sub19.lpm_width = 18,
		add_sub19.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub20
	( 
	.cout(),
	.dataa({slevel_w16c[55:37]}),
	.datab({(({17{(~ rad_ff15c[39])}} & (~ qlevel_w16c[18:2])) | ({17{rad_ff15c[39]}} & qlevel_w16c[18:2])), qlevel_w16c[1:0]}),
	.overflow(),
	.result(wire_add_sub20_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub20.lpm_direction = "ADD",
		add_sub20.lpm_pipeline = 0,
		add_sub20.lpm_width = 19,
		add_sub20.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub21
	( 
	.cout(),
	.dataa({slevel_w17c[55:36]}),
	.datab({(({18{(~ addnode_w16c[55])}} & (~ qlevel_w17c[19:2])) | ({18{addnode_w16c[55]}} & qlevel_w17c[19:2])), qlevel_w17c[1:0]}),
	.overflow(),
	.result(wire_add_sub21_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub21.lpm_direction = "ADD",
		add_sub21.lpm_pipeline = 0,
		add_sub21.lpm_width = 20,
		add_sub21.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub22
	( 
	.cout(),
	.dataa({slevel_w18c[55:35]}),
	.datab({(({19{(~ rad_ff17c[37])}} & (~ qlevel_w18c[20:2])) | ({19{rad_ff17c[37]}} & qlevel_w18c[20:2])), qlevel_w18c[1:0]}),
	.overflow(),
	.result(wire_add_sub22_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub22.lpm_direction = "ADD",
		add_sub22.lpm_pipeline = 0,
		add_sub22.lpm_width = 21,
		add_sub22.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub23
	( 
	.cout(),
	.dataa({slevel_w19c[55:34]}),
	.datab({(({20{(~ addnode_w18c[55])}} & (~ qlevel_w19c[21:2])) | ({20{addnode_w18c[55]}} & qlevel_w19c[21:2])), qlevel_w19c[1:0]}),
	.overflow(),
	.result(wire_add_sub23_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub23.lpm_direction = "ADD",
		add_sub23.lpm_pipeline = 0,
		add_sub23.lpm_width = 22,
		add_sub23.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub24
	( 
	.cout(),
	.dataa({slevel_w20c[55:33]}),
	.datab({(({21{(~ rad_ff19c[35])}} & (~ qlevel_w20c[22:2])) | ({21{rad_ff19c[35]}} & qlevel_w20c[22:2])), qlevel_w20c[1:0]}),
	.overflow(),
	.result(wire_add_sub24_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub24.lpm_direction = "ADD",
		add_sub24.lpm_pipeline = 0,
		add_sub24.lpm_width = 23,
		add_sub24.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub25
	( 
	.cout(),
	.dataa({slevel_w21c[55:32]}),
	.datab({(({22{(~ addnode_w20c[55])}} & (~ qlevel_w21c[23:2])) | ({22{addnode_w20c[55]}} & qlevel_w21c[23:2])), qlevel_w21c[1:0]}),
	.overflow(),
	.result(wire_add_sub25_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub25.lpm_direction = "ADD",
		add_sub25.lpm_pipeline = 0,
		add_sub25.lpm_width = 24,
		add_sub25.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub26
	( 
	.cout(),
	.dataa({slevel_w22c[55:31]}),
	.datab({(({23{(~ rad_ff21c[33])}} & (~ qlevel_w22c[24:2])) | ({23{rad_ff21c[33]}} & qlevel_w22c[24:2])), qlevel_w22c[1:0]}),
	.overflow(),
	.result(wire_add_sub26_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub26.lpm_direction = "ADD",
		add_sub26.lpm_pipeline = 0,
		add_sub26.lpm_width = 25,
		add_sub26.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub27
	( 
	.cout(),
	.dataa({slevel_w23c[55:30]}),
	.datab({(({24{(~ addnode_w22c[55])}} & (~ qlevel_w23c[25:2])) | ({24{addnode_w22c[55]}} & qlevel_w23c[25:2])), qlevel_w23c[1:0]}),
	.overflow(),
	.result(wire_add_sub27_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub27.lpm_direction = "ADD",
		add_sub27.lpm_pipeline = 0,
		add_sub27.lpm_width = 26,
		add_sub27.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub28
	( 
	.cout(),
	.dataa({slevel_w24c[55:29]}),
	.datab({(({25{(~ rad_ff23c[31])}} & (~ qlevel_w24c[26:2])) | ({25{rad_ff23c[31]}} & qlevel_w24c[26:2])), qlevel_w24c[1:0]}),
	.overflow(),
	.result(wire_add_sub28_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub28.lpm_direction = "ADD",
		add_sub28.lpm_pipeline = 0,
		add_sub28.lpm_width = 27,
		add_sub28.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub29
	( 
	.cout(),
	.dataa({slevel_w25c[55:28]}),
	.datab({(({26{(~ addnode_w24c[55])}} & (~ qlevel_w25c[27:2])) | ({26{addnode_w24c[55]}} & qlevel_w25c[27:2])), qlevel_w25c[1:0]}),
	.overflow(),
	.result(wire_add_sub29_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub29.lpm_direction = "ADD",
		add_sub29.lpm_pipeline = 0,
		add_sub29.lpm_width = 28,
		add_sub29.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub30
	( 
	.cout(),
	.dataa({slevel_w26c[55:27]}),
	.datab({(({27{(~ rad_ff25c[29])}} & (~ qlevel_w26c[28:2])) | ({27{rad_ff25c[29]}} & qlevel_w26c[28:2])), qlevel_w26c[1:0]}),
	.overflow(),
	.result(wire_add_sub30_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub30.lpm_direction = "ADD",
		add_sub30.lpm_pipeline = 0,
		add_sub30.lpm_width = 29,
		add_sub30.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub31
	( 
	.cout(),
	.dataa({slevel_w27c[55:28]}),
	.datab({(({28{(~ addnode_w26c[55])}} & (~ qlevel_w27c[29:2])) | ({28{addnode_w26c[55]}} & qlevel_w27c[29:2]))}),
	.overflow(),
	.result(wire_add_sub31_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub31.lpm_direction = "ADD",
		add_sub31.lpm_pipeline = 0,
		add_sub31.lpm_width = 28,
		add_sub31.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub32
	( 
	.cout(),
	.dataa({slevel_w28c[55:28]}),
	.datab({(({28{(~ rad_ff27c[27])}} & (~ qlevel_w28c[30:3])) | ({28{rad_ff27c[27]}} & qlevel_w28c[30:3]))}),
	.overflow(),
	.result(wire_add_sub32_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub32.lpm_direction = "ADD",
		add_sub32.lpm_pipeline = 0,
		add_sub32.lpm_width = 28,
		add_sub32.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub33
	( 
	.cout(),
	.dataa({slevel_w29c[55:27]}),
	.datab({(({29{(~ addnode_w28c[55])}} & (~ qlevel_w29c[31:3])) | ({29{addnode_w28c[55]}} & qlevel_w29c[31:3]))}),
	.overflow(),
	.result(wire_add_sub33_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub33.lpm_direction = "ADD",
		add_sub33.lpm_pipeline = 0,
		add_sub33.lpm_width = 29,
		add_sub33.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub34
	( 
	.cout(),
	.dataa({slevel_w30c[55:26]}),
	.datab({(({30{(~ rad_ff29c[28])}} & (~ qlevel_w30c[32:3])) | ({30{rad_ff29c[28]}} & qlevel_w30c[32:3]))}),
	.overflow(),
	.result(wire_add_sub34_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub34.lpm_direction = "ADD",
		add_sub34.lpm_pipeline = 0,
		add_sub34.lpm_width = 30,
		add_sub34.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub35
	( 
	.cout(),
	.dataa({slevel_w31c[55:25]}),
	.datab({(({31{(~ addnode_w30c[55])}} & (~ qlevel_w31c[33:3])) | ({31{addnode_w30c[55]}} & qlevel_w31c[33:3]))}),
	.overflow(),
	.result(wire_add_sub35_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub35.lpm_direction = "ADD",
		add_sub35.lpm_pipeline = 0,
		add_sub35.lpm_width = 31,
		add_sub35.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub36
	( 
	.cout(),
	.dataa({slevel_w32c[55:24]}),
	.datab({(({32{(~ rad_ff31c[30])}} & (~ qlevel_w32c[34:3])) | ({32{rad_ff31c[30]}} & qlevel_w32c[34:3]))}),
	.overflow(),
	.result(wire_add_sub36_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub36.lpm_direction = "ADD",
		add_sub36.lpm_pipeline = 0,
		add_sub36.lpm_width = 32,
		add_sub36.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub37
	( 
	.cout(),
	.dataa({slevel_w33c[55:23]}),
	.datab({(({33{(~ addnode_w32c[55])}} & (~ qlevel_w33c[35:3])) | ({33{addnode_w32c[55]}} & qlevel_w33c[35:3]))}),
	.overflow(),
	.result(wire_add_sub37_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub37.lpm_direction = "ADD",
		add_sub37.lpm_pipeline = 0,
		add_sub37.lpm_width = 33,
		add_sub37.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub38
	( 
	.cout(),
	.dataa({slevel_w34c[55:22]}),
	.datab({(({34{(~ rad_ff33c[32])}} & (~ qlevel_w34c[36:3])) | ({34{rad_ff33c[32]}} & qlevel_w34c[36:3]))}),
	.overflow(),
	.result(wire_add_sub38_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub38.lpm_direction = "ADD",
		add_sub38.lpm_pipeline = 0,
		add_sub38.lpm_width = 34,
		add_sub38.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub39
	( 
	.cout(),
	.dataa({slevel_w35c[55:21]}),
	.datab({(({35{(~ addnode_w34c[55])}} & (~ qlevel_w35c[37:3])) | ({35{addnode_w34c[55]}} & qlevel_w35c[37:3]))}),
	.overflow(),
	.result(wire_add_sub39_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub39.lpm_direction = "ADD",
		add_sub39.lpm_pipeline = 0,
		add_sub39.lpm_width = 35,
		add_sub39.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub4
	( 
	.cout(),
	.dataa({slevel_w0c[55:53]}),
	.datab({qlevel_w0c[2:0]}),
	.overflow(),
	.result(wire_add_sub4_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub4.lpm_direction = "ADD",
		add_sub4.lpm_pipeline = 0,
		add_sub4.lpm_width = 3,
		add_sub4.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub40
	( 
	.cout(),
	.dataa({slevel_w36c[55:20]}),
	.datab({(({36{(~ rad_ff35c[34])}} & (~ qlevel_w36c[38:3])) | ({36{rad_ff35c[34]}} & qlevel_w36c[38:3]))}),
	.overflow(),
	.result(wire_add_sub40_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub40.lpm_direction = "ADD",
		add_sub40.lpm_pipeline = 0,
		add_sub40.lpm_width = 36,
		add_sub40.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub41
	( 
	.cout(),
	.dataa({slevel_w37c[55:19]}),
	.datab({(({37{(~ addnode_w36c[55])}} & (~ qlevel_w37c[39:3])) | ({37{addnode_w36c[55]}} & qlevel_w37c[39:3]))}),
	.overflow(),
	.result(wire_add_sub41_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub41.lpm_direction = "ADD",
		add_sub41.lpm_pipeline = 0,
		add_sub41.lpm_width = 37,
		add_sub41.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub42
	( 
	.cout(),
	.dataa({slevel_w38c[55:18]}),
	.datab({(({38{(~ rad_ff37c[36])}} & (~ qlevel_w38c[40:3])) | ({38{rad_ff37c[36]}} & qlevel_w38c[40:3]))}),
	.overflow(),
	.result(wire_add_sub42_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub42.lpm_direction = "ADD",
		add_sub42.lpm_pipeline = 0,
		add_sub42.lpm_width = 38,
		add_sub42.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub43
	( 
	.cout(),
	.dataa({slevel_w39c[55:17]}),
	.datab({(({39{(~ addnode_w38c[55])}} & (~ qlevel_w39c[41:3])) | ({39{addnode_w38c[55]}} & qlevel_w39c[41:3]))}),
	.overflow(),
	.result(wire_add_sub43_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub43.lpm_direction = "ADD",
		add_sub43.lpm_pipeline = 0,
		add_sub43.lpm_width = 39,
		add_sub43.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub44
	( 
	.cout(),
	.dataa({slevel_w40c[55:16]}),
	.datab({(({40{(~ rad_ff39c[38])}} & (~ qlevel_w40c[42:3])) | ({40{rad_ff39c[38]}} & qlevel_w40c[42:3]))}),
	.overflow(),
	.result(wire_add_sub44_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub44.lpm_direction = "ADD",
		add_sub44.lpm_pipeline = 0,
		add_sub44.lpm_width = 40,
		add_sub44.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub45
	( 
	.cout(),
	.dataa({slevel_w41c[55:15]}),
	.datab({(({41{(~ addnode_w40c[55])}} & (~ qlevel_w41c[43:3])) | ({41{addnode_w40c[55]}} & qlevel_w41c[43:3]))}),
	.overflow(),
	.result(wire_add_sub45_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub45.lpm_direction = "ADD",
		add_sub45.lpm_pipeline = 0,
		add_sub45.lpm_width = 41,
		add_sub45.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub46
	( 
	.cout(),
	.dataa({slevel_w42c[55:14]}),
	.datab({(({42{(~ rad_ff41c[40])}} & (~ qlevel_w42c[44:3])) | ({42{rad_ff41c[40]}} & qlevel_w42c[44:3]))}),
	.overflow(),
	.result(wire_add_sub46_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub46.lpm_direction = "ADD",
		add_sub46.lpm_pipeline = 0,
		add_sub46.lpm_width = 42,
		add_sub46.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub47
	( 
	.cout(),
	.dataa({slevel_w43c[55:13]}),
	.datab({(({43{(~ addnode_w42c[55])}} & (~ qlevel_w43c[45:3])) | ({43{addnode_w42c[55]}} & qlevel_w43c[45:3]))}),
	.overflow(),
	.result(wire_add_sub47_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub47.lpm_direction = "ADD",
		add_sub47.lpm_pipeline = 0,
		add_sub47.lpm_width = 43,
		add_sub47.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub48
	( 
	.cout(),
	.dataa({slevel_w44c[55:12]}),
	.datab({(({44{(~ rad_ff43c[42])}} & (~ qlevel_w44c[46:3])) | ({44{rad_ff43c[42]}} & qlevel_w44c[46:3]))}),
	.overflow(),
	.result(wire_add_sub48_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub48.lpm_direction = "ADD",
		add_sub48.lpm_pipeline = 0,
		add_sub48.lpm_width = 44,
		add_sub48.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub49
	( 
	.cout(),
	.dataa({slevel_w45c[55:11]}),
	.datab({(({45{(~ addnode_w44c[55])}} & (~ qlevel_w45c[47:3])) | ({45{addnode_w44c[55]}} & qlevel_w45c[47:3]))}),
	.overflow(),
	.result(wire_add_sub49_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub49.lpm_direction = "ADD",
		add_sub49.lpm_pipeline = 0,
		add_sub49.lpm_width = 45,
		add_sub49.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub5
	( 
	.cout(),
	.dataa({slevel_w1c[55:52]}),
	.datab({qlevel_w1c[3:0]}),
	.overflow(),
	.result(wire_add_sub5_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub5.lpm_direction = "ADD",
		add_sub5.lpm_pipeline = 0,
		add_sub5.lpm_width = 4,
		add_sub5.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub50
	( 
	.cout(),
	.dataa({slevel_w46c[55:10]}),
	.datab({(({46{(~ rad_ff45c[44])}} & (~ qlevel_w46c[48:3])) | ({46{rad_ff45c[44]}} & qlevel_w46c[48:3]))}),
	.overflow(),
	.result(wire_add_sub50_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub50.lpm_direction = "ADD",
		add_sub50.lpm_pipeline = 0,
		add_sub50.lpm_width = 46,
		add_sub50.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub51
	( 
	.cout(),
	.dataa({slevel_w47c[55:9]}),
	.datab({(({47{(~ addnode_w46c[55])}} & (~ qlevel_w47c[49:3])) | ({47{addnode_w46c[55]}} & qlevel_w47c[49:3]))}),
	.overflow(),
	.result(wire_add_sub51_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub51.lpm_direction = "ADD",
		add_sub51.lpm_pipeline = 0,
		add_sub51.lpm_width = 47,
		add_sub51.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub52
	( 
	.cout(),
	.dataa({slevel_w48c[55:8]}),
	.datab({(({48{(~ rad_ff47c[46])}} & (~ qlevel_w48c[50:3])) | ({48{rad_ff47c[46]}} & qlevel_w48c[50:3]))}),
	.overflow(),
	.result(wire_add_sub52_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub52.lpm_direction = "ADD",
		add_sub52.lpm_pipeline = 0,
		add_sub52.lpm_width = 48,
		add_sub52.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub53
	( 
	.cout(),
	.dataa({slevel_w49c[55:7]}),
	.datab({(({49{(~ addnode_w48c[55])}} & (~ qlevel_w49c[51:3])) | ({49{addnode_w48c[55]}} & qlevel_w49c[51:3]))}),
	.overflow(),
	.result(wire_add_sub53_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub53.lpm_direction = "ADD",
		add_sub53.lpm_pipeline = 0,
		add_sub53.lpm_width = 49,
		add_sub53.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub54
	( 
	.cout(),
	.dataa({slevel_w50c[55:6]}),
	.datab({(({50{(~ rad_ff49c[48])}} & (~ qlevel_w50c[52:3])) | ({50{rad_ff49c[48]}} & qlevel_w50c[52:3]))}),
	.overflow(),
	.result(wire_add_sub54_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub54.lpm_direction = "ADD",
		add_sub54.lpm_pipeline = 0,
		add_sub54.lpm_width = 50,
		add_sub54.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub55
	( 
	.cout(),
	.dataa({slevel_w51c[55:5]}),
	.datab({(({51{(~ addnode_w50c[55])}} & (~ qlevel_w51c[53:3])) | ({51{addnode_w50c[55]}} & qlevel_w51c[53:3]))}),
	.overflow(),
	.result(wire_add_sub55_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub55.lpm_direction = "ADD",
		add_sub55.lpm_pipeline = 0,
		add_sub55.lpm_width = 51,
		add_sub55.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub56
	( 
	.cout(),
	.dataa({slevel_w52c[55:4]}),
	.datab({(({52{(~ rad_ff51c[50])}} & (~ qlevel_w52c[54:3])) | ({52{rad_ff51c[50]}} & qlevel_w52c[54:3]))}),
	.overflow(),
	.result(wire_add_sub56_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub56.lpm_direction = "ADD",
		add_sub56.lpm_pipeline = 0,
		add_sub56.lpm_width = 52,
		add_sub56.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub57
	( 
	.cout(),
	.dataa({slevel_w53c[55:3]}),
	.datab({qlevel_w53c[55:54], (({51{(~ addnode_w52c[55])}} & (~ qlevel_w53c[53:3])) | ({51{addnode_w52c[55]}} & qlevel_w53c[53:3]))}),
	.overflow(),
	.result(wire_add_sub57_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub57.lpm_direction = "ADD",
		add_sub57.lpm_pipeline = 0,
		add_sub57.lpm_width = 53,
		add_sub57.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub6
	( 
	.cout(),
	.dataa({slevel_w2c[55:51]}),
	.datab({(({3{(~ rad_ff1c[53])}} & (~ qlevel_w2c[4:2])) | ({3{rad_ff1c[53]}} & qlevel_w2c[4:2])), qlevel_w2c[1:0]}),
	.overflow(),
	.result(wire_add_sub6_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub6.lpm_direction = "ADD",
		add_sub6.lpm_pipeline = 0,
		add_sub6.lpm_width = 5,
		add_sub6.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub7
	( 
	.cout(),
	.dataa({slevel_w3c[55:50]}),
	.datab({(({4{(~ addnode_w2c[55])}} & (~ qlevel_w3c[5:2])) | ({4{addnode_w2c[55]}} & qlevel_w3c[5:2])), qlevel_w3c[1:0]}),
	.overflow(),
	.result(wire_add_sub7_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub7.lpm_direction = "ADD",
		add_sub7.lpm_pipeline = 0,
		add_sub7.lpm_width = 6,
		add_sub7.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub8
	( 
	.cout(),
	.dataa({slevel_w4c[55:49]}),
	.datab({(({5{(~ rad_ff3c[51])}} & (~ qlevel_w4c[6:2])) | ({5{rad_ff3c[51]}} & qlevel_w4c[6:2])), qlevel_w4c[1:0]}),
	.overflow(),
	.result(wire_add_sub8_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub8.lpm_direction = "ADD",
		add_sub8.lpm_pipeline = 0,
		add_sub8.lpm_width = 7,
		add_sub8.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub9
	( 
	.cout(),
	.dataa({slevel_w5c[55:48]}),
	.datab({(({6{(~ addnode_w4c[55])}} & (~ qlevel_w5c[7:2])) | ({6{addnode_w4c[55]}} & qlevel_w5c[7:2])), qlevel_w5c[1:0]}),
	.overflow(),
	.result(wire_add_sub9_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub9.lpm_direction = "ADD",
		add_sub9.lpm_pipeline = 0,
		add_sub9.lpm_width = 8,
		add_sub9.lpm_type = "lpm_add_sub";
	assign
		addnode_w0c = {wire_add_sub4_result[2:0], slevel_w0c[52:0]},
		addnode_w10c = {wire_add_sub14_result[12:0], slevel_w10c[42:0]},
		addnode_w11c = {wire_add_sub15_result[13:0], slevel_w11c[41:0]},
		addnode_w12c = {wire_add_sub16_result[14:0], slevel_w12c[40:0]},
		addnode_w13c = {wire_add_sub17_result[15:0], slevel_w13c[39:0]},
		addnode_w14c = {wire_add_sub18_result[16:0], slevel_w14c[38:0]},
		addnode_w15c = {wire_add_sub19_result[17:0], slevel_w15c[37:0]},
		addnode_w16c = {wire_add_sub20_result[18:0], slevel_w16c[36:0]},
		addnode_w17c = {wire_add_sub21_result[19:0], slevel_w17c[35:0]},
		addnode_w18c = {wire_add_sub22_result[20:0], slevel_w18c[34:0]},
		addnode_w19c = {wire_add_sub23_result[21:0], slevel_w19c[33:0]},
		addnode_w1c = {wire_add_sub5_result[3:0], slevel_w1c[51:0]},
		addnode_w20c = {wire_add_sub24_result[22:0], slevel_w20c[32:0]},
		addnode_w21c = {wire_add_sub25_result[23:0], slevel_w21c[31:0]},
		addnode_w22c = {wire_add_sub26_result[24:0], slevel_w22c[30:0]},
		addnode_w23c = {wire_add_sub27_result[25:0], slevel_w23c[29:0]},
		addnode_w24c = {wire_add_sub28_result[26:0], slevel_w24c[28:0]},
		addnode_w25c = {wire_add_sub29_result[27:0], slevel_w25c[27:0]},
		addnode_w26c = {wire_add_sub30_result[28:0], slevel_w26c[26:0]},
		addnode_w27c = {wire_add_sub31_result[27:0], qlevel_w27c[1:0], slevel_w27c[25:0]},
		addnode_w28c = {wire_add_sub32_result[27:0], 1'b1, qlevel_w28c[1:0], slevel_w28c[24:0]},
		addnode_w29c = {wire_add_sub33_result[28:0], 1'b1, qlevel_w29c[1:0], slevel_w29c[23:0]},
		addnode_w2c = {wire_add_sub6_result[4:0], slevel_w2c[50:0]},
		addnode_w30c = {wire_add_sub34_result[29:0], 1'b1, qlevel_w30c[1:0], slevel_w30c[22:0]},
		addnode_w31c = {wire_add_sub35_result[30:0], 1'b1, qlevel_w31c[1:0], slevel_w31c[21:0]},
		addnode_w32c = {wire_add_sub36_result[31:0], 1'b1, qlevel_w32c[1:0], slevel_w32c[20:0]},
		addnode_w33c = {wire_add_sub37_result[32:0], 1'b1, qlevel_w33c[1:0], slevel_w33c[19:0]},
		addnode_w34c = {wire_add_sub38_result[33:0], 1'b1, qlevel_w34c[1:0], slevel_w34c[18:0]},
		addnode_w35c = {wire_add_sub39_result[34:0], 1'b1, qlevel_w35c[1:0], slevel_w35c[17:0]},
		addnode_w36c = {wire_add_sub40_result[35:0], 1'b1, qlevel_w36c[1:0], slevel_w36c[16:0]},
		addnode_w37c = {wire_add_sub41_result[36:0], 1'b1, qlevel_w37c[1:0], slevel_w37c[15:0]},
		addnode_w38c = {wire_add_sub42_result[37:0], 1'b1, qlevel_w38c[1:0], slevel_w38c[14:0]},
		addnode_w39c = {wire_add_sub43_result[38:0], 1'b1, qlevel_w39c[1:0], slevel_w39c[13:0]},
		addnode_w3c = {wire_add_sub7_result[5:0], slevel_w3c[49:0]},
		addnode_w40c = {wire_add_sub44_result[39:0], 1'b1, qlevel_w40c[1:0], slevel_w40c[12:0]},
		addnode_w41c = {wire_add_sub45_result[40:0], 1'b1, qlevel_w41c[1:0], slevel_w41c[11:0]},
		addnode_w42c = {wire_add_sub46_result[41:0], 1'b1, qlevel_w42c[1:0], slevel_w42c[10:0]},
		addnode_w43c = {wire_add_sub47_result[42:0], 1'b1, qlevel_w43c[1:0], slevel_w43c[9:0]},
		addnode_w44c = {wire_add_sub48_result[43:0], 1'b1, qlevel_w44c[1:0], slevel_w44c[8:0]},
		addnode_w45c = {wire_add_sub49_result[44:0], 1'b1, qlevel_w45c[1:0], slevel_w45c[7:0]},
		addnode_w46c = {wire_add_sub50_result[45:0], 1'b1, qlevel_w46c[1:0], slevel_w46c[6:0]},
		addnode_w47c = {wire_add_sub51_result[46:0], 1'b1, qlevel_w47c[1:0], slevel_w47c[5:0]},
		addnode_w48c = {wire_add_sub52_result[47:0], 1'b1, qlevel_w48c[1:0], slevel_w48c[4:0]},
		addnode_w49c = {wire_add_sub53_result[48:0], 1'b1, qlevel_w49c[1:0], slevel_w49c[3:0]},
		addnode_w4c = {wire_add_sub8_result[6:0], slevel_w4c[48:0]},
		addnode_w50c = {wire_add_sub54_result[49:0], 1'b1, qlevel_w50c[1:0], slevel_w50c[2:0]},
		addnode_w51c = {wire_add_sub55_result[50:0], 1'b1, qlevel_w51c[1:0], slevel_w51c[1:0]},
		addnode_w52c = {wire_add_sub56_result[51:0], 1'b1, qlevel_w52c[1:0], slevel_w52c[0]},
		addnode_w53c = {wire_add_sub57_result[52:0], 1'b1, qlevel_w53c[1:0]},
		addnode_w5c = {wire_add_sub9_result[7:0], slevel_w5c[47:0]},
		addnode_w6c = {wire_add_sub10_result[8:0], slevel_w6c[46:0]},
		addnode_w7c = {wire_add_sub11_result[9:0], slevel_w7c[45:0]},
		addnode_w8c = {wire_add_sub12_result[10:0], slevel_w8c[44:0]},
		addnode_w9c = {wire_add_sub13_result[11:0], slevel_w9c[43:0]},
		qlevel_w0c = {3{1'b1}},
		qlevel_w10c = {1'b0, 1'b1, q_ff52c[4], q_ff50c[7:6], q_ff48c[5:4], q_ff46c[3:2], q_ff44c[1:0], {2{1'b1}}},
		qlevel_w11c = {1'b0, 1'b1, q_ff52c[4], q_ff50c[7:6], q_ff48c[5:4], q_ff46c[3:2], q_ff44c[1:0], (~ addnode_w10c[55]), {2{1'b1}}},
		qlevel_w12c = {1'b0, 1'b1, q_ff52c[5], q_ff50c[9:8], q_ff48c[7:6], q_ff46c[5:4], q_ff44c[3:2], q_ff42c[1:0], {2{1'b1}}},
		qlevel_w13c = {1'b0, 1'b1, q_ff52c[5], q_ff50c[9:8], q_ff48c[7:6], q_ff46c[5:4], q_ff44c[3:2], q_ff42c[1:0], (~ addnode_w12c[55]), {2{1'b1}}},
		qlevel_w14c = {1'b0, 1'b1, q_ff52c[6], q_ff50c[11:10], q_ff48c[9:8], q_ff46c[7:6], q_ff44c[5:4], q_ff42c[3:2], q_ff40c[1:0], {2{1'b1}}},
		qlevel_w15c = {1'b0, 1'b1, q_ff52c[6], q_ff50c[11:10], q_ff48c[9:8], q_ff46c[7:6], q_ff44c[5:4], q_ff42c[3:2], q_ff40c[1:0], (~ addnode_w14c[55]), {2{1'b1}}},
		qlevel_w16c = {1'b0, 1'b1, q_ff52c[7], q_ff50c[13:12], q_ff48c[11:10], q_ff46c[9:8], q_ff44c[7:6], q_ff42c[5:4], q_ff40c[3:2], q_ff38c[1:0], {2{1'b1}}},
		qlevel_w17c = {1'b0, 1'b1, q_ff52c[7], q_ff50c[13:12], q_ff48c[11:10], q_ff46c[9:8], q_ff44c[7:6], q_ff42c[5:4], q_ff40c[3:2], q_ff38c[1:0], (~ addnode_w16c[55]), {2{1'b1}}},
		qlevel_w18c = {1'b0, 1'b1, q_ff52c[8], q_ff50c[15:14], q_ff48c[13:12], q_ff46c[11:10], q_ff44c[9:8], q_ff42c[7:6], q_ff40c[5:4], q_ff38c[3:2], q_ff36c[1:0], {2{1'b1}}},
		qlevel_w19c = {1'b0, 1'b1, q_ff52c[8], q_ff50c[15:14], q_ff48c[13:12], q_ff46c[11:10], q_ff44c[9:8], q_ff42c[7:6], q_ff40c[5:4], q_ff38c[3:2], q_ff36c[1:0], (~ addnode_w18c[55]), {2{1'b1}}},
		qlevel_w1c = {1'b1, 1'b0, {2{1'b1}}},
		qlevel_w20c = {1'b0, 1'b1, q_ff52c[9], q_ff50c[17:16], q_ff48c[15:14], q_ff46c[13:12], q_ff44c[11:10], q_ff42c[9:8], q_ff40c[7:6], q_ff38c[5:4], q_ff36c[3:2], q_ff34c[1:0], {2{1'b1}}},
		qlevel_w21c = {1'b0, 1'b1, q_ff52c[9], q_ff50c[17:16], q_ff48c[15:14], q_ff46c[13:12], q_ff44c[11:10], q_ff42c[9:8], q_ff40c[7:6], q_ff38c[5:4], q_ff36c[3:2], q_ff34c[1:0], (~ addnode_w20c[55]), {2{1'b1}}},
		qlevel_w22c = {1'b0, 1'b1, q_ff52c[10], q_ff50c[19:18], q_ff48c[17:16], q_ff46c[15:14], q_ff44c[13:12], q_ff42c[11:10], q_ff40c[9:8], q_ff38c[7:6], q_ff36c[5:4], q_ff34c[3:2], q_ff32c[1:0], {2{1'b1}}},
		qlevel_w23c = {1'b0, 1'b1, q_ff52c[10], q_ff50c[19:18], q_ff48c[17:16], q_ff46c[15:14], q_ff44c[13:12], q_ff42c[11:10], q_ff40c[9:8], q_ff38c[7:6], q_ff36c[5:4], q_ff34c[3:2], q_ff32c[1:0], (~ addnode_w22c[55]), {2{1'b1}}},
		qlevel_w24c = {1'b0, 1'b1, q_ff52c[11], q_ff50c[21:20], q_ff48c[19:18], q_ff46c[17:16], q_ff44c[15:14], q_ff42c[13:12], q_ff40c[11:10], q_ff38c[9:8], q_ff36c[7:6], q_ff34c[5:4], q_ff32c[3:2], q_ff30c[1:0], {2{1'b1}}},
		qlevel_w25c = {1'b0, 1'b1, q_ff52c[11], q_ff50c[21:20], q_ff48c[19:18], q_ff46c[17:16], q_ff44c[15:14], q_ff42c[13:12], q_ff40c[11:10], q_ff38c[9:8], q_ff36c[7:6], q_ff34c[5:4], q_ff32c[3:2], q_ff30c[1:0], (~ addnode_w24c[55]), {2{1'b1}}},
		qlevel_w26c = {1'b0, 1'b1, q_ff52c[12], q_ff50c[23:22], q_ff48c[21:20], q_ff46c[19:18], q_ff44c[17:16], q_ff42c[15:14], q_ff40c[13:12], q_ff38c[11:10], q_ff36c[9:8], q_ff34c[7:6], q_ff32c[5:4], q_ff30c[3:2], q_ff28c[1:0], {2{1'b1}}},
		qlevel_w27c = {1'b0, 1'b1, q_ff52c[12], q_ff50c[23:22], q_ff48c[21:20], q_ff46c[19:18], q_ff44c[17:16], q_ff42c[15:14], q_ff40c[13:12], q_ff38c[11:10], q_ff36c[9:8], q_ff34c[7:6], q_ff32c[5:4], q_ff30c[3:2], q_ff28c[1:0], (~ addnode_w26c[55]), {2{1'b1}}},
		qlevel_w28c = {1'b0, 1'b1, q_ff52c[13], q_ff50c[25:24], q_ff48c[23:22], q_ff46c[21:20], q_ff44c[19:18], q_ff42c[17:16], q_ff40c[15:14], q_ff38c[13:12], q_ff36c[11:10], q_ff34c[9:8], q_ff32c[7:6], q_ff30c[5:4], q_ff28c[3:2], q_ff26c[1:0], {2{1'b1}}},
		qlevel_w29c = {1'b0, 1'b1, q_ff52c[13], q_ff50c[25:24], q_ff48c[23:22], q_ff46c[21:20], q_ff44c[19:18], q_ff42c[17:16], q_ff40c[15:14], q_ff38c[13:12], q_ff36c[11:10], q_ff34c[9:8], q_ff32c[7:6], q_ff30c[5:4], q_ff28c[3:2], q_ff26c[1:0], (~ addnode_w28c[55]), {2{1'b1}}},
		qlevel_w2c = {1'b0, 1'b1, q_ff52c[0], {2{1'b1}}},
		qlevel_w30c = {1'b0, 1'b1, q_ff52c[14], q_ff50c[27:26], q_ff48c[25:24], q_ff46c[23:22], q_ff44c[21:20], q_ff42c[19:18], q_ff40c[17:16], q_ff38c[15:14], q_ff36c[13:12], q_ff34c[11:10], q_ff32c[9:8], q_ff30c[7:6], q_ff28c[5:4], q_ff26c[3:2], q_ff24c[1:0], {2{1'b1}}},
		qlevel_w31c = {1'b0, 1'b1, q_ff52c[14], q_ff50c[27:26], q_ff48c[25:24], q_ff46c[23:22], q_ff44c[21:20], q_ff42c[19:18], q_ff40c[17:16], q_ff38c[15:14], q_ff36c[13:12], q_ff34c[11:10], q_ff32c[9:8], q_ff30c[7:6], q_ff28c[5:4], q_ff26c[3:2], q_ff24c[1:0], (~ addnode_w30c[55]), {2{1'b1}}},
		qlevel_w32c = {1'b0, 1'b1, q_ff52c[15], q_ff50c[29:28], q_ff48c[27:26], q_ff46c[25:24], q_ff44c[23:22], q_ff42c[21:20], q_ff40c[19:18], q_ff38c[17:16], q_ff36c[15:14], q_ff34c[13:12], q_ff32c[11:10], q_ff30c[9:8], q_ff28c[7:6], q_ff26c[5:4], q_ff24c[3:2], q_ff22c[1:0], {2{1'b1}}},
		qlevel_w33c = {1'b0, 1'b1, q_ff52c[15], q_ff50c[29:28], q_ff48c[27:26], q_ff46c[25:24], q_ff44c[23:22], q_ff42c[21:20], q_ff40c[19:18], q_ff38c[17:16], q_ff36c[15:14], q_ff34c[13:12], q_ff32c[11:10], q_ff30c[9:8], q_ff28c[7:6], q_ff26c[5:4], q_ff24c[3:2], q_ff22c[1:0], (~ addnode_w32c[55]), {2{1'b1}}},
		qlevel_w34c = {1'b0, 1'b1, q_ff52c[16], q_ff50c[31:30], q_ff48c[29:28], q_ff46c[27:26], q_ff44c[25:24], q_ff42c[23:22], q_ff40c[21:20], q_ff38c[19:18], q_ff36c[17:16], q_ff34c[15:14], q_ff32c[13:12], q_ff30c[11:10], q_ff28c[9:8], q_ff26c[7:6], q_ff24c[5:4], q_ff22c[3:2], q_ff20c[1:0], {2{1'b1}}},
		qlevel_w35c = {1'b0, 1'b1, q_ff52c[16], q_ff50c[31:30], q_ff48c[29:28], q_ff46c[27:26], q_ff44c[25:24], q_ff42c[23:22], q_ff40c[21:20], q_ff38c[19:18], q_ff36c[17:16], q_ff34c[15:14], q_ff32c[13:12], q_ff30c[11:10], q_ff28c[9:8], q_ff26c[7:6], q_ff24c[5:4], q_ff22c[3:2], q_ff20c[1:0], (~ addnode_w34c[55]), {2{1'b1}}},
		qlevel_w36c = {1'b0, 1'b1, q_ff52c[17], q_ff50c[33:32], q_ff48c[31:30], q_ff46c[29:28], q_ff44c[27:26], q_ff42c[25:24], q_ff40c[23:22], q_ff38c[21:20], q_ff36c[19:18], q_ff34c[17:16], q_ff32c[15:14], q_ff30c[13:12], q_ff28c[11:10], q_ff26c[9:8], q_ff24c[7:6], q_ff22c[5:4], q_ff20c[3:2], q_ff18c[1:0], {2{1'b1}}},
		qlevel_w37c = {1'b0, 1'b1, q_ff52c[17], q_ff50c[33:32], q_ff48c[31:30], q_ff46c[29:28], q_ff44c[27:26], q_ff42c[25:24], q_ff40c[23:22], q_ff38c[21:20], q_ff36c[19:18], q_ff34c[17:16], q_ff32c[15:14], q_ff30c[13:12], q_ff28c[11:10], q_ff26c[9:8], q_ff24c[7:6], q_ff22c[5:4], q_ff20c[3:2], q_ff18c[1:0], (~ addnode_w36c[55]), {2{1'b1}}},
		qlevel_w38c = {1'b0, 1'b1, q_ff52c[18], q_ff50c[35:34], q_ff48c[33:32], q_ff46c[31:30], q_ff44c[29:28], q_ff42c[27:26], q_ff40c[25:24], q_ff38c[23:22], q_ff36c[21:20], q_ff34c[19:18], q_ff32c[17:16], q_ff30c[15:14], q_ff28c[13:12], q_ff26c[11:10], q_ff24c[9:8], q_ff22c[7:6], q_ff20c[5:4], q_ff18c[3:2], q_ff16c[1:0], {2{1'b1}}},
		qlevel_w39c = {1'b0, 1'b1, q_ff52c[18], q_ff50c[35:34], q_ff48c[33:32], q_ff46c[31:30], q_ff44c[29:28], q_ff42c[27:26], q_ff40c[25:24], q_ff38c[23:22], q_ff36c[21:20], q_ff34c[19:18], q_ff32c[17:16], q_ff30c[15:14], q_ff28c[13:12], q_ff26c[11:10], q_ff24c[9:8], q_ff22c[7:6], q_ff20c[5:4], q_ff18c[3:2], q_ff16c[1:0], (~ addnode_w38c[55]), {2{1'b1}}},
		qlevel_w3c = {1'b0, 1'b1, q_ff52c[0], (~ addnode_w2c[55]), {2{1'b1}}},
		qlevel_w40c = {1'b0, 1'b1, q_ff52c[19], q_ff50c[37:36], q_ff48c[35:34], q_ff46c[33:32], q_ff44c[31:30], q_ff42c[29:28], q_ff40c[27:26], q_ff38c[25:24], q_ff36c[23:22], q_ff34c[21:20], q_ff32c[19:18], q_ff30c[17:16], q_ff28c[15:14], q_ff26c[13:12], q_ff24c[11:10], q_ff22c[9:8], q_ff20c[7:6], q_ff18c[5:4], q_ff16c[3:2], q_ff14c[1:0], {2{1'b1}}},
		qlevel_w41c = {1'b0, 1'b1, q_ff52c[19], q_ff50c[37:36], q_ff48c[35:34], q_ff46c[33:32], q_ff44c[31:30], q_ff42c[29:28], q_ff40c[27:26], q_ff38c[25:24], q_ff36c[23:22], q_ff34c[21:20], q_ff32c[19:18], q_ff30c[17:16], q_ff28c[15:14], q_ff26c[13:12], q_ff24c[11:10], q_ff22c[9:8], q_ff20c[7:6], q_ff18c[5:4], q_ff16c[3:2], q_ff14c[1:0], (~ addnode_w40c[55]), {2{1'b1}}},
		qlevel_w42c = {1'b0, 1'b1, q_ff52c[20], q_ff50c[39:38], q_ff48c[37:36], q_ff46c[35:34], q_ff44c[33:32], q_ff42c[31:30], q_ff40c[29:28], q_ff38c[27:26], q_ff36c[25:24], q_ff34c[23:22], q_ff32c[21:20], q_ff30c[19:18], q_ff28c[17:16], q_ff26c[15:14], q_ff24c[13:12], q_ff22c[11:10], q_ff20c[9:8], q_ff18c[7:6], q_ff16c[5:4], q_ff14c[3:2], q_ff12c[1:0], {2{1'b1}}},
		qlevel_w43c = {1'b0, 1'b1, q_ff52c[20], q_ff50c[39:38], q_ff48c[37:36], q_ff46c[35:34], q_ff44c[33:32], q_ff42c[31:30], q_ff40c[29:28], q_ff38c[27:26], q_ff36c[25:24], q_ff34c[23:22], q_ff32c[21:20], q_ff30c[19:18], q_ff28c[17:16], q_ff26c[15:14], q_ff24c[13:12], q_ff22c[11:10], q_ff20c[9:8], q_ff18c[7:6], q_ff16c[5:4], q_ff14c[3:2], q_ff12c[1:0], (~ addnode_w42c[55]), {2{1'b1}}},
		qlevel_w44c = {1'b0, 1'b1, q_ff52c[21], q_ff50c[41:40], q_ff48c[39:38], q_ff46c[37:36], q_ff44c[35:34], q_ff42c[33:32], q_ff40c[31:30], q_ff38c[29:28], q_ff36c[27:26], q_ff34c[25:24], q_ff32c[23:22], q_ff30c[21:20], q_ff28c[19:18], q_ff26c[17:16], q_ff24c[15:14], q_ff22c[13:12], q_ff20c[11:10], q_ff18c[9:8], q_ff16c[7:6], q_ff14c[5:4], q_ff12c[3:2], q_ff10c[1:0], {2{1'b1}}},
		qlevel_w45c = {1'b0, 1'b1, q_ff52c[21], q_ff50c[41:40], q_ff48c[39:38], q_ff46c[37:36], q_ff44c[35:34], q_ff42c[33:32], q_ff40c[31:30], q_ff38c[29:28], q_ff36c[27:26], q_ff34c[25:24], q_ff32c[23:22], q_ff30c[21:20], q_ff28c[19:18], q_ff26c[17:16], q_ff24c[15:14], q_ff22c[13:12], q_ff20c[11:10], q_ff18c[9:8], q_ff16c[7:6], q_ff14c[5:4], q_ff12c[3:2], q_ff10c[1:0], (~ addnode_w44c[55]), {2{1'b1}}},
		qlevel_w46c = {1'b0, 1'b1, q_ff52c[22], q_ff50c[43:42], q_ff48c[41:40], q_ff46c[39:38], q_ff44c[37:36], q_ff42c[35:34], q_ff40c[33:32], q_ff38c[31:30], q_ff36c[29:28], q_ff34c[27:26], q_ff32c[25:24], q_ff30c[23:22], q_ff28c[21:20], q_ff26c[19:18], q_ff24c[17:16], q_ff22c[15:14], q_ff20c[13:12], q_ff18c[11:10], q_ff16c[9:8], q_ff14c[7:6], q_ff12c[5:4], q_ff10c[3:2], q_ff8c[1:0], {2{1'b1}}},
		qlevel_w47c = {1'b0, 1'b1, q_ff52c[22], q_ff50c[43:42], q_ff48c[41:40], q_ff46c[39:38], q_ff44c[37:36], q_ff42c[35:34], q_ff40c[33:32], q_ff38c[31:30], q_ff36c[29:28], q_ff34c[27:26], q_ff32c[25:24], q_ff30c[23:22], q_ff28c[21:20], q_ff26c[19:18], q_ff24c[17:16], q_ff22c[15:14], q_ff20c[13:12], q_ff18c[11:10], q_ff16c[9:8], q_ff14c[7:6], q_ff12c[5:4], q_ff10c[3:2], q_ff8c[1:0], (~ addnode_w46c[55]), {2{1'b1}}},
		qlevel_w48c = {1'b0, 1'b1, q_ff52c[23], q_ff50c[45:44], q_ff48c[43:42], q_ff46c[41:40], q_ff44c[39:38], q_ff42c[37:36], q_ff40c[35:34], q_ff38c[33:32], q_ff36c[31:30], q_ff34c[29:28], q_ff32c[27:26], q_ff30c[25:24], q_ff28c[23:22], q_ff26c[21:20], q_ff24c[19:18], q_ff22c[17:16], q_ff20c[15:14], q_ff18c[13:12], q_ff16c[11:10], q_ff14c[9:8], q_ff12c[7:6], q_ff10c[5:4], q_ff8c[3:2], q_ff6c[1:0], {2{1'b1}}},
		qlevel_w49c = {1'b0, 1'b1, q_ff52c[23], q_ff50c[45:44], q_ff48c[43:42], q_ff46c[41:40], q_ff44c[39:38], q_ff42c[37:36], q_ff40c[35:34], q_ff38c[33:32], q_ff36c[31:30], q_ff34c[29:28], q_ff32c[27:26], q_ff30c[25:24], q_ff28c[23:22], q_ff26c[21:20], q_ff24c[19:18], q_ff22c[17:16], q_ff20c[15:14], q_ff18c[13:12], q_ff16c[11:10], q_ff14c[9:8], q_ff12c[7:6], q_ff10c[5:4], q_ff8c[3:2], q_ff6c[1:0], (~ addnode_w48c[55]), {2{1'b1}}},
		qlevel_w4c = {1'b0, 1'b1, q_ff52c[1], q_ff50c[1:0], {2{1'b1}}},
		qlevel_w50c = {1'b0, 1'b1, q_ff52c[24], q_ff50c[47:46], q_ff48c[45:44], q_ff46c[43:42], q_ff44c[41:40], q_ff42c[39:38], q_ff40c[37:36], q_ff38c[35:34], q_ff36c[33:32], q_ff34c[31:30], q_ff32c[29:28], q_ff30c[27:26], q_ff28c[25:24], q_ff26c[23:22], q_ff24c[21:20], q_ff22c[19:18], q_ff20c[17:16], q_ff18c[15:14], q_ff16c[13:12], q_ff14c[11:10], q_ff12c[9:8], q_ff10c[7:6], q_ff8c[5:4], q_ff6c[3:2], q_ff4c[1:0], {2{1'b1}}},
		qlevel_w51c = {1'b0, 1'b1, q_ff52c[24], q_ff50c[47:46], q_ff48c[45:44], q_ff46c[43:42], q_ff44c[41:40], q_ff42c[39:38], q_ff40c[37:36], q_ff38c[35:34], q_ff36c[33:32], q_ff34c[31:30], q_ff32c[29:28], q_ff30c[27:26], q_ff28c[25:24], q_ff26c[23:22], q_ff24c[21:20], q_ff22c[19:18], q_ff20c[17:16], q_ff18c[15:14], q_ff16c[13:12], q_ff14c[11:10], q_ff12c[9:8], q_ff10c[7:6], q_ff8c[5:4], q_ff6c[3:2], q_ff4c[1:0], (~ addnode_w50c[55]), {2{1'b1}}},
		qlevel_w52c = {1'b0, 1'b1, q_ff52c[25], q_ff50c[49:48], q_ff48c[47:46], q_ff46c[45:44], q_ff44c[43:42], q_ff42c[41:40], q_ff40c[39:38], q_ff38c[37:36], q_ff36c[35:34], q_ff34c[33:32], q_ff32c[31:30], q_ff30c[29:28], q_ff28c[27:26], q_ff26c[25:24], q_ff24c[23:22], q_ff22c[21:20], q_ff20c[19:18], q_ff18c[17:16], q_ff16c[15:14], q_ff14c[13:12], q_ff12c[11:10], q_ff10c[9:8], q_ff8c[7:6], q_ff6c[5:4], q_ff4c[3:2], q_ff2c[1:0], {2{1'b1}}},
		qlevel_w53c = {(~ addnode_w52c[55]), addnode_w52c[55], q_ff52c[25], q_ff50c[49:48], q_ff48c[47:46], q_ff46c[45:44], q_ff44c[43:42], q_ff42c[41:40], q_ff40c[39:38], q_ff38c[37:36], q_ff36c[35:34], q_ff34c[33:32], q_ff32c[31:30], q_ff30c[29:28], q_ff28c[27:26], q_ff26c[25:24], q_ff24c[23:22], q_ff22c[21:20], q_ff20c[19:18], q_ff18c[17:16], q_ff16c[15:14], q_ff14c[13:12], q_ff12c[11:10], q_ff10c[9:8], q_ff8c[7:6], q_ff6c[5:4], q_ff4c[3:2], q_ff2c[1:0], (~ addnode_w52c[55]), {2{1'b1}}},
		qlevel_w5c = {1'b0, 1'b1, q_ff52c[1], q_ff50c[1:0], (~ addnode_w4c[55]), {2{1'b1}}},
		qlevel_w6c = {1'b0, 1'b1, q_ff52c[2], q_ff50c[3:2], q_ff48c[1:0], {2{1'b1}}},
		qlevel_w7c = {1'b0, 1'b1, q_ff52c[2], q_ff50c[3:2], q_ff48c[1:0], (~ addnode_w6c[55]), {2{1'b1}}},
		qlevel_w8c = {1'b0, 1'b1, q_ff52c[3], q_ff50c[5:4], q_ff48c[3:2], q_ff46c[1:0], {2{1'b1}}},
		qlevel_w9c = {1'b0, 1'b1, q_ff52c[3], q_ff50c[5:4], q_ff48c[3:2], q_ff46c[1:0], (~ addnode_w8c[55]), {2{1'b1}}},
		root_result = {1'b1, q_ff52c[26], q_ff50c[51:50], q_ff48c[49:48], q_ff46c[47:46], q_ff44c[45:44], q_ff42c[43:42], q_ff40c[41:40], q_ff38c[39:38], q_ff36c[37:36], q_ff34c[35:34], q_ff32c[33:32], q_ff30c[31:30], q_ff28c[29:28], q_ff26c[27:26], q_ff24c[25:24], q_ff22c[23:22], q_ff20c[21:20], q_ff18c[19:18], q_ff16c[17:16], q_ff14c[15:14], q_ff12c[13:12], q_ff10c[11:10], q_ff8c[9:8], q_ff6c[7:6], q_ff4c[5:4], q_ff2c[3:2], q_ff0c[1:0]},
		slevel_w0c = {1'b0, rad},
		slevel_w10c = {rad_ff9c[44:0], {11{1'b0}}},
		slevel_w11c = {addnode_w10c[54:11], {12{1'b0}}},
		slevel_w12c = {rad_ff11c[42:0], {13{1'b0}}},
		slevel_w13c = {addnode_w12c[54:13], {14{1'b0}}},
		slevel_w14c = {rad_ff13c[40:0], {15{1'b0}}},
		slevel_w15c = {addnode_w14c[54:15], {16{1'b0}}},
		slevel_w16c = {rad_ff15c[38:0], {17{1'b0}}},
		slevel_w17c = {addnode_w16c[54:17], {18{1'b0}}},
		slevel_w18c = {rad_ff17c[36:0], {19{1'b0}}},
		slevel_w19c = {addnode_w18c[54:19], {20{1'b0}}},
		slevel_w1c = {addnode_w0c[54:1], {2{1'b0}}},
		slevel_w20c = {rad_ff19c[34:0], {21{1'b0}}},
		slevel_w21c = {addnode_w20c[54:21], {22{1'b0}}},
		slevel_w22c = {rad_ff21c[32:0], {23{1'b0}}},
		slevel_w23c = {addnode_w22c[54:23], {24{1'b0}}},
		slevel_w24c = {rad_ff23c[30:0], {25{1'b0}}},
		slevel_w25c = {addnode_w24c[54:25], {26{1'b0}}},
		slevel_w26c = {rad_ff25c[28:0], {27{1'b0}}},
		slevel_w27c = {addnode_w26c[54:27], {28{1'b0}}},
		slevel_w28c = {rad_ff27c[26:0], {2{1'b1}}, {27{1'b0}}},
		slevel_w29c = {addnode_w28c[54:28], {3{1'b1}}, {26{1'b0}}},
		slevel_w2c = {rad_ff1c[52:0], {3{1'b0}}},
		slevel_w30c = {rad_ff29c[27:0], {3{1'b1}}, {25{1'b0}}},
		slevel_w31c = {addnode_w30c[54:26], {3{1'b1}}, {24{1'b0}}},
		slevel_w32c = {rad_ff31c[29:0], {3{1'b1}}, {23{1'b0}}},
		slevel_w33c = {addnode_w32c[54:24], {3{1'b1}}, {22{1'b0}}},
		slevel_w34c = {rad_ff33c[31:0], {3{1'b1}}, {21{1'b0}}},
		slevel_w35c = {addnode_w34c[54:22], {3{1'b1}}, {20{1'b0}}},
		slevel_w36c = {rad_ff35c[33:0], {3{1'b1}}, {19{1'b0}}},
		slevel_w37c = {addnode_w36c[54:20], {3{1'b1}}, {18{1'b0}}},
		slevel_w38c = {rad_ff37c[35:0], {3{1'b1}}, {17{1'b0}}},
		slevel_w39c = {addnode_w38c[54:18], {3{1'b1}}, {16{1'b0}}},
		slevel_w3c = {addnode_w2c[54:3], {4{1'b0}}},
		slevel_w40c = {rad_ff39c[37:0], {3{1'b1}}, {15{1'b0}}},
		slevel_w41c = {addnode_w40c[54:16], {3{1'b1}}, {14{1'b0}}},
		slevel_w42c = {rad_ff41c[39:0], {3{1'b1}}, {13{1'b0}}},
		slevel_w43c = {addnode_w42c[54:14], {3{1'b1}}, {12{1'b0}}},
		slevel_w44c = {rad_ff43c[41:0], {3{1'b1}}, {11{1'b0}}},
		slevel_w45c = {addnode_w44c[54:12], {3{1'b1}}, {10{1'b0}}},
		slevel_w46c = {rad_ff45c[43:0], {3{1'b1}}, {9{1'b0}}},
		slevel_w47c = {addnode_w46c[54:10], {3{1'b1}}, {8{1'b0}}},
		slevel_w48c = {rad_ff47c[45:0], {3{1'b1}}, {7{1'b0}}},
		slevel_w49c = {addnode_w48c[54:8], {3{1'b1}}, {6{1'b0}}},
		slevel_w4c = {rad_ff3c[50:0], {5{1'b0}}},
		slevel_w50c = {rad_ff49c[47:0], {3{1'b1}}, {5{1'b0}}},
		slevel_w51c = {addnode_w50c[54:6], {3{1'b1}}, {4{1'b0}}},
		slevel_w52c = {rad_ff51c[49:0], {3{1'b1}}, {3{1'b0}}},
		slevel_w53c = {addnode_w52c[54:4], {3{1'b1}}, {2{1'b0}}},
		slevel_w5c = {addnode_w4c[54:5], {6{1'b0}}},
		slevel_w6c = {rad_ff5c[48:0], {7{1'b0}}},
		slevel_w7c = {addnode_w6c[54:7], {8{1'b0}}},
		slevel_w8c = {rad_ff7c[46:0], {9{1'b0}}},
		slevel_w9c = {addnode_w8c[54:9], {10{1'b0}}};
endmodule //acl_fp_sqrt_s5_double_alt_sqrt_block_odb

//synthesis_resources = lpm_add_sub 56 reg 2983 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_sqrt_s5_double_altfp_sqrt_n9d
	( 
	clk_en,
	clock,
	data,
	result) ;
	input   clk_en;
	input   clock;
	input   [63:0]  data;
	output   [63:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   clk_en;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [53:0]   wire_alt_sqrt_block2_root_result;
	reg	exp_all_one_ff;
	reg	[10:0]	exp_ff1;
	reg	[10:0]	exp_ff20c;
	reg	[10:0]	exp_ff210c;
	reg	[10:0]	exp_ff211c;
	reg	[10:0]	exp_ff212c;
	reg	[10:0]	exp_ff213c;
	reg	[10:0]	exp_ff214c;
	reg	[10:0]	exp_ff215c;
	reg	[10:0]	exp_ff216c;
	reg	[10:0]	exp_ff217c;
	reg	[10:0]	exp_ff218c;
	reg	[10:0]	exp_ff219c;
	reg	[10:0]	exp_ff21c;
	reg	[10:0]	exp_ff220c;
	reg	[10:0]	exp_ff221c;
	reg	[10:0]	exp_ff222c;
	reg	[10:0]	exp_ff223c;
	reg	[10:0]	exp_ff224c;
	reg	[10:0]	exp_ff225c;
	reg	[10:0]	exp_ff226c;
	reg	[10:0]	exp_ff22c;
	reg	[10:0]	exp_ff23c;
	reg	[10:0]	exp_ff24c;
	reg	[10:0]	exp_ff25c;
	reg	[10:0]	exp_ff26c;
	reg	[10:0]	exp_ff27c;
	reg	[10:0]	exp_ff28c;
	reg	[10:0]	exp_ff29c;
	reg	[10:0]	exp_in_ff;
	reg	exp_not_zero_ff;
	reg	[10:0]	exp_result_ff;
	reg	[0:0]	infinity_ff0;
	reg	[0:0]	infinity_ff1;
	reg	[0:0]	infinity_ff2;
	reg	[0:0]	infinity_ff3;
	reg	[0:0]	infinity_ff4;
	reg	[0:0]	infinity_ff5;
	reg	[0:0]	infinity_ff6;
	reg	[0:0]	infinity_ff7;
	reg	[0:0]	infinity_ff8;
	reg	[0:0]	infinity_ff9;
	reg	[0:0]	infinity_ff10;
	reg	[0:0]	infinity_ff11;
	reg	[0:0]	infinity_ff12;
	reg	[0:0]	infinity_ff13;
	reg	[0:0]	infinity_ff14;
	reg	[0:0]	infinity_ff15;
	reg	[0:0]	infinity_ff16;
	reg	[0:0]	infinity_ff17;
	reg	[0:0]	infinity_ff18;
	reg	[0:0]	infinity_ff19;
	reg	[0:0]	infinity_ff20;
	reg	[0:0]	infinity_ff21;
	reg	[0:0]	infinity_ff22;
	reg	[0:0]	infinity_ff23;
	reg	[0:0]	infinity_ff24;
	reg	[0:0]	infinity_ff25;
	reg	[0:0]	infinity_ff26;
	reg	[51:0]	man_in_ff;
	reg	man_not_zero_ff;
	reg	[51:0]	man_result_ff;
	reg	[51:0]	man_rounding_ff;
	reg	[0:0]	nan_man_ff0;
	reg	[0:0]	nan_man_ff1;
	reg	[0:0]	nan_man_ff2;
	reg	[0:0]	nan_man_ff3;
	reg	[0:0]	nan_man_ff4;
	reg	[0:0]	nan_man_ff5;
	reg	[0:0]	nan_man_ff6;
	reg	[0:0]	nan_man_ff7;
	reg	[0:0]	nan_man_ff8;
	reg	[0:0]	nan_man_ff9;
	reg	[0:0]	nan_man_ff10;
	reg	[0:0]	nan_man_ff11;
	reg	[0:0]	nan_man_ff12;
	reg	[0:0]	nan_man_ff13;
	reg	[0:0]	nan_man_ff14;
	reg	[0:0]	nan_man_ff15;
	reg	[0:0]	nan_man_ff16;
	reg	[0:0]	nan_man_ff17;
	reg	[0:0]	nan_man_ff18;
	reg	[0:0]	nan_man_ff19;
	reg	[0:0]	nan_man_ff20;
	reg	[0:0]	nan_man_ff21;
	reg	[0:0]	nan_man_ff22;
	reg	[0:0]	nan_man_ff23;
	reg	[0:0]	nan_man_ff24;
	reg	[0:0]	nan_man_ff25;
	reg	[0:0]	nan_man_ff26;
	reg	[0:0]	sign_node_ff0;
	reg	[0:0]	sign_node_ff1;
	reg	[0:0]	sign_node_ff2;
	reg	[0:0]	sign_node_ff3;
	reg	[0:0]	sign_node_ff4;
	reg	[0:0]	sign_node_ff5;
	reg	[0:0]	sign_node_ff6;
	reg	[0:0]	sign_node_ff7;
	reg	[0:0]	sign_node_ff8;
	reg	[0:0]	sign_node_ff9;
	reg	[0:0]	sign_node_ff10;
	reg	[0:0]	sign_node_ff11;
	reg	[0:0]	sign_node_ff12;
	reg	[0:0]	sign_node_ff13;
	reg	[0:0]	sign_node_ff14;
	reg	[0:0]	sign_node_ff15;
	reg	[0:0]	sign_node_ff16;
	reg	[0:0]	sign_node_ff17;
	reg	[0:0]	sign_node_ff18;
	reg	[0:0]	sign_node_ff19;
	reg	[0:0]	sign_node_ff20;
	reg	[0:0]	sign_node_ff21;
	reg	[0:0]	sign_node_ff22;
	reg	[0:0]	sign_node_ff23;
	reg	[0:0]	sign_node_ff24;
	reg	[0:0]	sign_node_ff25;
	reg	[0:0]	sign_node_ff26;
	reg	[0:0]	sign_node_ff27;
	reg	[0:0]	sign_node_ff28;
	reg	[0:0]	sign_node_ff29;
	reg	[0:0]	zero_exp_ff0;
	reg	[0:0]	zero_exp_ff1;
	reg	[0:0]	zero_exp_ff2;
	reg	[0:0]	zero_exp_ff3;
	reg	[0:0]	zero_exp_ff4;
	reg	[0:0]	zero_exp_ff5;
	reg	[0:0]	zero_exp_ff6;
	reg	[0:0]	zero_exp_ff7;
	reg	[0:0]	zero_exp_ff8;
	reg	[0:0]	zero_exp_ff9;
	reg	[0:0]	zero_exp_ff10;
	reg	[0:0]	zero_exp_ff11;
	reg	[0:0]	zero_exp_ff12;
	reg	[0:0]	zero_exp_ff13;
	reg	[0:0]	zero_exp_ff14;
	reg	[0:0]	zero_exp_ff15;
	reg	[0:0]	zero_exp_ff16;
	reg	[0:0]	zero_exp_ff17;
	reg	[0:0]	zero_exp_ff18;
	reg	[0:0]	zero_exp_ff19;
	reg	[0:0]	zero_exp_ff20;
	reg	[0:0]	zero_exp_ff21;
	reg	[0:0]	zero_exp_ff22;
	reg	[0:0]	zero_exp_ff23;
	reg	[0:0]	zero_exp_ff24;
	reg	[0:0]	zero_exp_ff25;
	reg	[0:0]	zero_exp_ff26;
	wire  [11:0]   wire_add_sub1_result;
	wire  [51:0]   wire_add_sub3_result;
	wire aclr;
	wire  [10:0]  bias;
	wire  [10:0]  exp_all_one_w;
	wire  [10:0]  exp_div_w;
	wire  [10:0]  exp_ff2_w;
	wire  [10:0]  exp_not_zero_w;
	wire  infinitycondition_w;
	wire  [51:0]  man_not_zero_w;
	wire  [53:0]  man_root_result_w;
	wire  nancondition_w;
	wire  preadjust_w;
	wire  [54:0]  radicand_w;
	wire  roundbit_w;

	acl_fp_sqrt_s5_double_alt_sqrt_block_odb   alt_sqrt_block2
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.rad(radicand_w),
	.root_result(wire_alt_sqrt_block2_root_result));
	// synopsys translate_off
	initial
		exp_all_one_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_all_one_ff <= 1'b0;
		else if  (clk_en == 1'b1)   exp_all_one_ff <= exp_all_one_w[10];
	// synopsys translate_off
	initial
		exp_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff1 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff1 <= exp_div_w;
	// synopsys translate_off
	initial
		exp_ff20c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff20c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff20c <= exp_ff1;
	// synopsys translate_off
	initial
		exp_ff210c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff210c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff210c <= exp_ff29c;
	// synopsys translate_off
	initial
		exp_ff211c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff211c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff211c <= exp_ff210c;
	// synopsys translate_off
	initial
		exp_ff212c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff212c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff212c <= exp_ff211c;
	// synopsys translate_off
	initial
		exp_ff213c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff213c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff213c <= exp_ff212c;
	// synopsys translate_off
	initial
		exp_ff214c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff214c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff214c <= exp_ff213c;
	// synopsys translate_off
	initial
		exp_ff215c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff215c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff215c <= exp_ff214c;
	// synopsys translate_off
	initial
		exp_ff216c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff216c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff216c <= exp_ff215c;
	// synopsys translate_off
	initial
		exp_ff217c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff217c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff217c <= exp_ff216c;
	// synopsys translate_off
	initial
		exp_ff218c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff218c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff218c <= exp_ff217c;
	// synopsys translate_off
	initial
		exp_ff219c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff219c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff219c <= exp_ff218c;
	// synopsys translate_off
	initial
		exp_ff21c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff21c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff21c <= exp_ff20c;
	// synopsys translate_off
	initial
		exp_ff220c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff220c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff220c <= exp_ff219c;
	// synopsys translate_off
	initial
		exp_ff221c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff221c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff221c <= exp_ff220c;
	// synopsys translate_off
	initial
		exp_ff222c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff222c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff222c <= exp_ff221c;
	// synopsys translate_off
	initial
		exp_ff223c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff223c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff223c <= exp_ff222c;
	// synopsys translate_off
	initial
		exp_ff224c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff224c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff224c <= exp_ff223c;
	// synopsys translate_off
	initial
		exp_ff225c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff225c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff225c <= exp_ff224c;
	// synopsys translate_off
	initial
		exp_ff226c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff226c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff226c <= exp_ff225c;
	// synopsys translate_off
	initial
		exp_ff22c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff22c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff22c <= exp_ff21c;
	// synopsys translate_off
	initial
		exp_ff23c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff23c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff23c <= exp_ff22c;
	// synopsys translate_off
	initial
		exp_ff24c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff24c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff24c <= exp_ff23c;
	// synopsys translate_off
	initial
		exp_ff25c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff25c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff25c <= exp_ff24c;
	// synopsys translate_off
	initial
		exp_ff26c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff26c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff26c <= exp_ff25c;
	// synopsys translate_off
	initial
		exp_ff27c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff27c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff27c <= exp_ff26c;
	// synopsys translate_off
	initial
		exp_ff28c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff28c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff28c <= exp_ff27c;
	// synopsys translate_off
	initial
		exp_ff29c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff29c <= 11'b0;
		else if  (clk_en == 1'b1)   exp_ff29c <= exp_ff28c;
	// synopsys translate_off
	initial
		exp_in_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_in_ff <= 11'b0;
		else if  (clk_en == 1'b1)   exp_in_ff <= data[62:52];
	// synopsys translate_off
	initial
		exp_not_zero_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_not_zero_ff <= 1'b0;
		else if  (clk_en == 1'b1)   exp_not_zero_ff <= exp_not_zero_w[10];
	// synopsys translate_off
	initial
		exp_result_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_ff <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_ff <= (((exp_ff2_w & {11{zero_exp_ff26[0:0]}}) | {11{nan_man_ff26[0:0]}}) | {11{infinity_ff26[0:0]}});
	// synopsys translate_off
	initial
		infinity_ff0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff0 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff0 <= (infinitycondition_w & (~ sign_node_ff1[0:0]));
	// synopsys translate_off
	initial
		infinity_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff1 <= infinity_ff0[0:0];
	// synopsys translate_off
	initial
		infinity_ff2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff2 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff2 <= infinity_ff1[0:0];
	// synopsys translate_off
	initial
		infinity_ff3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff3 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff3 <= infinity_ff2[0:0];
	// synopsys translate_off
	initial
		infinity_ff4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff4 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff4 <= infinity_ff3[0:0];
	// synopsys translate_off
	initial
		infinity_ff5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff5 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff5 <= infinity_ff4[0:0];
	// synopsys translate_off
	initial
		infinity_ff6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff6 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff6 <= infinity_ff5[0:0];
	// synopsys translate_off
	initial
		infinity_ff7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff7 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff7 <= infinity_ff6[0:0];
	// synopsys translate_off
	initial
		infinity_ff8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff8 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff8 <= infinity_ff7[0:0];
	// synopsys translate_off
	initial
		infinity_ff9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff9 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff9 <= infinity_ff8[0:0];
	// synopsys translate_off
	initial
		infinity_ff10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff10 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff10 <= infinity_ff9[0:0];
	// synopsys translate_off
	initial
		infinity_ff11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff11 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff11 <= infinity_ff10[0:0];
	// synopsys translate_off
	initial
		infinity_ff12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff12 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff12 <= infinity_ff11[0:0];
	// synopsys translate_off
	initial
		infinity_ff13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff13 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff13 <= infinity_ff12[0:0];
	// synopsys translate_off
	initial
		infinity_ff14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff14 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff14 <= infinity_ff13[0:0];
	// synopsys translate_off
	initial
		infinity_ff15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff15 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff15 <= infinity_ff14[0:0];
	// synopsys translate_off
	initial
		infinity_ff16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff16 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff16 <= infinity_ff15[0:0];
	// synopsys translate_off
	initial
		infinity_ff17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff17 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff17 <= infinity_ff16[0:0];
	// synopsys translate_off
	initial
		infinity_ff18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff18 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff18 <= infinity_ff17[0:0];
	// synopsys translate_off
	initial
		infinity_ff19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff19 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff19 <= infinity_ff18[0:0];
	// synopsys translate_off
	initial
		infinity_ff20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff20 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff20 <= infinity_ff19[0:0];
	// synopsys translate_off
	initial
		infinity_ff21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff21 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff21 <= infinity_ff20[0:0];
	// synopsys translate_off
	initial
		infinity_ff22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff22 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff22 <= infinity_ff21[0:0];
	// synopsys translate_off
	initial
		infinity_ff23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff23 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff23 <= infinity_ff22[0:0];
	// synopsys translate_off
	initial
		infinity_ff24 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff24 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff24 <= infinity_ff23[0:0];
	// synopsys translate_off
	initial
		infinity_ff25 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff25 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff25 <= infinity_ff24[0:0];
	// synopsys translate_off
	initial
		infinity_ff26 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff26 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff26 <= infinity_ff25[0:0];
	// synopsys translate_off
	initial
		man_in_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_in_ff <= 52'b0;
		else if  (clk_en == 1'b1)   man_in_ff <= data[51:0];
	// synopsys translate_off
	initial
		man_not_zero_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_not_zero_ff <= 1'b0;
		else if  (clk_en == 1'b1)   man_not_zero_ff <= man_not_zero_w[51];
	// synopsys translate_off
	initial
		man_result_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_result_ff <= 52'b0;
		else if  (clk_en == 1'b1)   man_result_ff <= ((man_rounding_ff & {52{zero_exp_ff26[0:0]}}) | {52{nan_man_ff26[0:0]}});
	// synopsys translate_off
	initial
		man_rounding_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_rounding_ff <= 52'b0;
		else if  (clk_en == 1'b1)   man_rounding_ff <= wire_add_sub3_result;
	// synopsys translate_off
	initial
		nan_man_ff0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff0 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff0 <= nancondition_w;
	// synopsys translate_off
	initial
		nan_man_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff1 <= nan_man_ff0[0:0];
	// synopsys translate_off
	initial
		nan_man_ff2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff2 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff2 <= nan_man_ff1[0:0];
	// synopsys translate_off
	initial
		nan_man_ff3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff3 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff3 <= nan_man_ff2[0:0];
	// synopsys translate_off
	initial
		nan_man_ff4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff4 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff4 <= nan_man_ff3[0:0];
	// synopsys translate_off
	initial
		nan_man_ff5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff5 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff5 <= nan_man_ff4[0:0];
	// synopsys translate_off
	initial
		nan_man_ff6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff6 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff6 <= nan_man_ff5[0:0];
	// synopsys translate_off
	initial
		nan_man_ff7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff7 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff7 <= nan_man_ff6[0:0];
	// synopsys translate_off
	initial
		nan_man_ff8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff8 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff8 <= nan_man_ff7[0:0];
	// synopsys translate_off
	initial
		nan_man_ff9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff9 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff9 <= nan_man_ff8[0:0];
	// synopsys translate_off
	initial
		nan_man_ff10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff10 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff10 <= nan_man_ff9[0:0];
	// synopsys translate_off
	initial
		nan_man_ff11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff11 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff11 <= nan_man_ff10[0:0];
	// synopsys translate_off
	initial
		nan_man_ff12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff12 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff12 <= nan_man_ff11[0:0];
	// synopsys translate_off
	initial
		nan_man_ff13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff13 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff13 <= nan_man_ff12[0:0];
	// synopsys translate_off
	initial
		nan_man_ff14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff14 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff14 <= nan_man_ff13[0:0];
	// synopsys translate_off
	initial
		nan_man_ff15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff15 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff15 <= nan_man_ff14[0:0];
	// synopsys translate_off
	initial
		nan_man_ff16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff16 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff16 <= nan_man_ff15[0:0];
	// synopsys translate_off
	initial
		nan_man_ff17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff17 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff17 <= nan_man_ff16[0:0];
	// synopsys translate_off
	initial
		nan_man_ff18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff18 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff18 <= nan_man_ff17[0:0];
	// synopsys translate_off
	initial
		nan_man_ff19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff19 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff19 <= nan_man_ff18[0:0];
	// synopsys translate_off
	initial
		nan_man_ff20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff20 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff20 <= nan_man_ff19[0:0];
	// synopsys translate_off
	initial
		nan_man_ff21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff21 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff21 <= nan_man_ff20[0:0];
	// synopsys translate_off
	initial
		nan_man_ff22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff22 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff22 <= nan_man_ff21[0:0];
	// synopsys translate_off
	initial
		nan_man_ff23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff23 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff23 <= nan_man_ff22[0:0];
	// synopsys translate_off
	initial
		nan_man_ff24 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff24 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff24 <= nan_man_ff23[0:0];
	// synopsys translate_off
	initial
		nan_man_ff25 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff25 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff25 <= nan_man_ff24[0:0];
	// synopsys translate_off
	initial
		nan_man_ff26 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff26 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff26 <= nan_man_ff25[0:0];
	// synopsys translate_off
	initial
		sign_node_ff0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff0 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff0 <= data[63];
	// synopsys translate_off
	initial
		sign_node_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff1 <= sign_node_ff0[0:0];
	// synopsys translate_off
	initial
		sign_node_ff2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff2 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff2 <= sign_node_ff1[0:0];
	// synopsys translate_off
	initial
		sign_node_ff3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff3 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff3 <= sign_node_ff2[0:0];
	// synopsys translate_off
	initial
		sign_node_ff4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff4 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff4 <= sign_node_ff3[0:0];
	// synopsys translate_off
	initial
		sign_node_ff5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff5 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff5 <= sign_node_ff4[0:0];
	// synopsys translate_off
	initial
		sign_node_ff6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff6 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff6 <= sign_node_ff5[0:0];
	// synopsys translate_off
	initial
		sign_node_ff7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff7 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff7 <= sign_node_ff6[0:0];
	// synopsys translate_off
	initial
		sign_node_ff8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff8 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff8 <= sign_node_ff7[0:0];
	// synopsys translate_off
	initial
		sign_node_ff9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff9 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff9 <= sign_node_ff8[0:0];
	// synopsys translate_off
	initial
		sign_node_ff10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff10 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff10 <= sign_node_ff9[0:0];
	// synopsys translate_off
	initial
		sign_node_ff11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff11 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff11 <= sign_node_ff10[0:0];
	// synopsys translate_off
	initial
		sign_node_ff12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff12 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff12 <= sign_node_ff11[0:0];
	// synopsys translate_off
	initial
		sign_node_ff13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff13 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff13 <= sign_node_ff12[0:0];
	// synopsys translate_off
	initial
		sign_node_ff14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff14 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff14 <= sign_node_ff13[0:0];
	// synopsys translate_off
	initial
		sign_node_ff15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff15 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff15 <= sign_node_ff14[0:0];
	// synopsys translate_off
	initial
		sign_node_ff16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff16 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff16 <= sign_node_ff15[0:0];
	// synopsys translate_off
	initial
		sign_node_ff17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff17 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff17 <= sign_node_ff16[0:0];
	// synopsys translate_off
	initial
		sign_node_ff18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff18 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff18 <= sign_node_ff17[0:0];
	// synopsys translate_off
	initial
		sign_node_ff19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff19 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff19 <= sign_node_ff18[0:0];
	// synopsys translate_off
	initial
		sign_node_ff20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff20 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff20 <= sign_node_ff19[0:0];
	// synopsys translate_off
	initial
		sign_node_ff21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff21 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff21 <= sign_node_ff20[0:0];
	// synopsys translate_off
	initial
		sign_node_ff22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff22 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff22 <= sign_node_ff21[0:0];
	// synopsys translate_off
	initial
		sign_node_ff23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff23 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff23 <= sign_node_ff22[0:0];
	// synopsys translate_off
	initial
		sign_node_ff24 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff24 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff24 <= sign_node_ff23[0:0];
	// synopsys translate_off
	initial
		sign_node_ff25 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff25 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff25 <= sign_node_ff24[0:0];
	// synopsys translate_off
	initial
		sign_node_ff26 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff26 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff26 <= sign_node_ff25[0:0];
	// synopsys translate_off
	initial
		sign_node_ff27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff27 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff27 <= sign_node_ff26[0:0];
	// synopsys translate_off
	initial
		sign_node_ff28 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff28 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff28 <= sign_node_ff27[0:0];
	// synopsys translate_off
	initial
		sign_node_ff29 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff29 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff29 <= sign_node_ff28[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff0 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff0 <= exp_not_zero_ff;
	// synopsys translate_off
	initial
		zero_exp_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff1 <= zero_exp_ff0[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff2 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff2 <= zero_exp_ff1[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff3 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff3 <= zero_exp_ff2[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff4 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff4 <= zero_exp_ff3[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff5 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff5 <= zero_exp_ff4[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff6 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff6 <= zero_exp_ff5[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff7 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff7 <= zero_exp_ff6[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff8 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff8 <= zero_exp_ff7[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff9 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff9 <= zero_exp_ff8[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff10 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff10 <= zero_exp_ff9[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff11 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff11 <= zero_exp_ff10[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff12 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff12 <= zero_exp_ff11[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff13 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff13 <= zero_exp_ff12[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff14 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff14 <= zero_exp_ff13[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff15 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff15 <= zero_exp_ff14[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff16 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff16 <= zero_exp_ff15[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff17 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff17 <= zero_exp_ff16[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff18 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff18 <= zero_exp_ff17[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff19 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff19 <= zero_exp_ff18[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff20 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff20 <= zero_exp_ff19[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff21 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff21 <= zero_exp_ff20[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff22 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff22 <= zero_exp_ff21[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff23 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff23 <= zero_exp_ff22[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff24 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff24 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff24 <= zero_exp_ff23[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff25 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff25 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff25 <= zero_exp_ff24[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff26 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff26 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff26 <= zero_exp_ff25[0:0];
	lpm_add_sub   add_sub1
	( 
	.cout(),
	.dataa({1'b0, exp_in_ff}),
	.datab({1'b0, bias}),
	.overflow(),
	.result(wire_add_sub1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub1.lpm_direction = "ADD",
		add_sub1.lpm_pipeline = 0,
		add_sub1.lpm_width = 12,
		add_sub1.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub3
	( 
	.cout(),
	.dataa(man_root_result_w[52:1]),
	.datab({{51{1'b0}}, roundbit_w}),
	.overflow(),
	.result(wire_add_sub3_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub3.lpm_direction = "ADD",
		add_sub3.lpm_pipeline = 0,
		add_sub3.lpm_width = 52,
		add_sub3.lpm_type = "lpm_add_sub";
	assign
		aclr = 1'b0,
		bias = {1'b0, {10{1'b1}}},
		exp_all_one_w = {(exp_in_ff[10] & exp_all_one_w[9]), (exp_in_ff[9] & exp_all_one_w[8]), (exp_in_ff[8] & exp_all_one_w[7]), (exp_in_ff[7] & exp_all_one_w[6]), (exp_in_ff[6] & exp_all_one_w[5]), (exp_in_ff[5] & exp_all_one_w[4]), (exp_in_ff[4] & exp_all_one_w[3]), (exp_in_ff[3] & exp_all_one_w[2]), (exp_in_ff[2] & exp_all_one_w[1]), (exp_in_ff[1] & exp_all_one_w[0]), exp_in_ff[0]},
		exp_div_w = {wire_add_sub1_result[11:1]},
		exp_ff2_w = exp_ff226c,
		exp_not_zero_w = {(exp_in_ff[10] | exp_not_zero_w[9]), (exp_in_ff[9] | exp_not_zero_w[8]), (exp_in_ff[8] | exp_not_zero_w[7]), (exp_in_ff[7] | exp_not_zero_w[6]), (exp_in_ff[6] | exp_not_zero_w[5]), (exp_in_ff[5] | exp_not_zero_w[4]), (exp_in_ff[4] | exp_not_zero_w[3]), (exp_in_ff[3] | exp_not_zero_w[2]), (exp_in_ff[2] | exp_not_zero_w[1]), (exp_in_ff[1] | exp_not_zero_w[0]), exp_in_ff[0]},
		infinitycondition_w = ((~ man_not_zero_ff) & exp_all_one_ff),
		man_not_zero_w = {(man_in_ff[51] | man_not_zero_w[50]), (man_in_ff[50] | man_not_zero_w[49]), (man_in_ff[49] | man_not_zero_w[48]), (man_in_ff[48] | man_not_zero_w[47]), (man_in_ff[47] | man_not_zero_w[46]), (man_in_ff[46] | man_not_zero_w[45]), (man_in_ff[45] | man_not_zero_w[44]), (man_in_ff[44] | man_not_zero_w[43]), (man_in_ff[43] | man_not_zero_w[42]), (man_in_ff[42] | man_not_zero_w[41]), (man_in_ff[41] | man_not_zero_w[40]), (man_in_ff[40] | man_not_zero_w[39]), (man_in_ff[39] | man_not_zero_w[38]), (man_in_ff[38] | man_not_zero_w[37]), (man_in_ff[37] | man_not_zero_w[36]), (man_in_ff[36] | man_not_zero_w[35]), (man_in_ff[35] | man_not_zero_w[34]), (man_in_ff[34] | man_not_zero_w[33]), (man_in_ff[33] | man_not_zero_w[32]), (man_in_ff[32] | man_not_zero_w[31]), (man_in_ff[31] | man_not_zero_w[30]), (man_in_ff[30] | man_not_zero_w[29]), (man_in_ff[29] | man_not_zero_w[28]), (man_in_ff[28] | man_not_zero_w[27]), (man_in_ff[27] | man_not_zero_w[26]), (man_in_ff[26] | man_not_zero_w[25]), (man_in_ff[25] | man_not_zero_w[24]), (man_in_ff[24] | man_not_zero_w[23]), (man_in_ff[23] | man_not_zero_w[22]), (man_in_ff[22] | man_not_zero_w[21]), (man_in_ff[21] | man_not_zero_w[20]), (man_in_ff[20] | man_not_zero_w[19]), (man_in_ff[19] | man_not_zero_w[18]), (man_in_ff[18] | man_not_zero_w[17]), (man_in_ff[17] | man_not_zero_w[16]), (man_in_ff[16] | man_not_zero_w[15]), (man_in_ff[15] | man_not_zero_w[14]), (man_in_ff[14] | man_not_zero_w[13]), (man_in_ff[13] | man_not_zero_w[12]), (man_in_ff[12] | man_not_zero_w[11]), (man_in_ff[11] | man_not_zero_w[10]), (man_in_ff[10] | man_not_zero_w[9]), (man_in_ff[9] | man_not_zero_w[8]), (man_in_ff[8] | man_not_zero_w[7]), (man_in_ff[7] | man_not_zero_w[6]), (man_in_ff[6] | man_not_zero_w[5]), (man_in_ff[5] | man_not_zero_w[4]), (man_in_ff[4] | man_not_zero_w[3]), (man_in_ff[3] | man_not_zero_w[2]), (man_in_ff[2] | man_not_zero_w[1]), (man_in_ff[1] | man_not_zero_w[0]), man_in_ff[0]},
		man_root_result_w = wire_alt_sqrt_block2_root_result,
		nancondition_w = ((sign_node_ff1[0:0] & exp_not_zero_ff) | (exp_all_one_ff & man_not_zero_ff)),
		preadjust_w = exp_in_ff[0],
		radicand_w = {(~ preadjust_w), (preadjust_w | (man_in_ff[51] & (~ preadjust_w))), ((man_in_ff[51:1] & {51{preadjust_w}}) | (man_in_ff[50:0] & {51{(~ preadjust_w)}})), (man_in_ff[0] & preadjust_w), 1'b0},
		result = {sign_node_ff29[0:0], exp_result_ff, man_result_ff},
		roundbit_w = wire_alt_sqrt_block2_root_result[0];
endmodule //acl_fp_sqrt_s5_double_altfp_sqrt_n9d
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module acl_fp_sqrt_s5_double (
	enable,
	clock,
	dataa,
	result);

	input	  enable;
	input	  clock;
	input	[63:0]  dataa;
	output	[63:0]  result;

	wire [63:0] sub_wire0;
	wire [63:0] result = sub_wire0[63:0];

	acl_fp_sqrt_s5_double_altfp_sqrt_n9d	acl_fp_sqrt_s5_double_altfp_sqrt_n9d_component (
				.clk_en (enable),
				.clock (clock),
				.data (dataa),
				.result (sub_wire0));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: FPM_FORMAT NUMERIC "1"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix V"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix V"
// Retrieval info: CONSTANT: PIPELINE NUMERIC "30"
// Retrieval info: CONSTANT: ROUNDING STRING "TO_NEAREST"
// Retrieval info: CONSTANT: WIDTH_EXP NUMERIC "11"
// Retrieval info: CONSTANT: WIDTH_MAN NUMERIC "52"
// Retrieval info: USED_PORT: clk_en 0 0 0 0 INPUT NODEFVAL "clk_en"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: USED_PORT: data 0 0 64 0 INPUT NODEFVAL "data[63..0]"
// Retrieval info: USED_PORT: result 0 0 64 0 OUTPUT NODEFVAL "result[63..0]"
// Retrieval info: CONNECT: @clk_en 0 0 0 0 clk_en 0 0 0 0
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @data 0 0 64 0 data 0 0 64 0
// Retrieval info: CONNECT: result 0 0 64 0 @result 0 0 64 0
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_sqrt_s5_double.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_sqrt_s5_double.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_sqrt_s5_double.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_sqrt_s5_double.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_sqrt_s5_double_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_sqrt_s5_double_bb.v TRUE
// Retrieval info: LIB_FILE: lpm
