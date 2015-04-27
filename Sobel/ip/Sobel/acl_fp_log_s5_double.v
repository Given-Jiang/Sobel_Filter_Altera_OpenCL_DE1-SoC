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


//altfp_log CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Stratix V" PIPELINE=34 WIDTH_EXP=11 WIDTH_MAN=52 clk_en clock data result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



//altbarrel_shift CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Stratix V" PIPELINE=1 SHIFTDIR="LEFT" WIDTH=64 WIDTHDIST=6 aclr clk_en clock data distance result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END

//synthesis_resources = reg 65 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altbarrel_shift_qud
	( 
	aclr,
	clk_en,
	clock,
	data,
	distance,
	result) ;
	input   aclr;
	input   clk_en;
	input   clock;
	input   [63:0]  data;
	input   [5:0]  distance;
	output   [63:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clk_en;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[0:0]	dir_pipe;
	reg	[63:0]	sbit_piper1d;
	wire  [6:0]  dir_w;
	wire  direction_w;
	wire  [31:0]  pad_w;
	wire  [447:0]  sbit_w;
	wire  [5:0]  sel_w;
	wire  [383:0]  smux_w;

	// synopsys translate_off
	initial
		dir_pipe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dir_pipe <= 1'b0;
		else if  (clk_en == 1'b1)   dir_pipe <= {dir_w[5]};
	// synopsys translate_off
	initial
		sbit_piper1d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sbit_piper1d <= 64'b0;
		else if  (clk_en == 1'b1)   sbit_piper1d <= smux_w[383:320];
	assign
		dir_w = {dir_pipe[0], dir_w[4:0], direction_w},
		direction_w = 1'b0,
		pad_w = {32{1'b0}},
		result = sbit_w[447:384],
		sbit_w = {sbit_piper1d, smux_w[319:0], data},
		sel_w = {distance[5:0]},
		smux_w = {((({64{(sel_w[5] & (~ dir_w[5]))}} & {sbit_w[351:320], pad_w[31:0]}) | ({64{(sel_w[5] & dir_w[5])}} & {pad_w[31:0], sbit_w[383:352]})) | ({64{(~ sel_w[5])}} & sbit_w[383:320])), ((({64{(sel_w[4] & (~ dir_w[4]))}} & {sbit_w[303:256], pad_w[15:0]}) | ({64{(sel_w[4] & dir_w[4])}} & {pad_w[15:0], sbit_w[319:272]})) | ({64{(~ sel_w[4])}} & sbit_w[319:256])), ((({64{(sel_w[3] & (~ dir_w[3]))}} & {sbit_w[247:192], pad_w[7:0]}) | ({64{(sel_w[3] & dir_w[3])}} & {pad_w[7:0], sbit_w[255:200]})) | ({64{(~ sel_w[3])}} & sbit_w[255:192])), ((({64{(sel_w[2] & (~ dir_w[2]))}} & {sbit_w[187:128], pad_w[3:0]}) | ({64{(sel_w[2] & dir_w[2])}} & {pad_w[3:0], sbit_w[191:132]})) | ({64{(~ sel_w[2])}} & sbit_w[191:128])), ((({64{(sel_w[1] & (~ dir_w[1]))}} & {sbit_w[125:64], pad_w[1:0]}) | ({64{(sel_w[1] & dir_w[1])}} & {pad_w[1:0], sbit_w[127:66]})) | ({64{(~ sel_w[1])}} & sbit_w[127:64])), ((({64{(sel_w[0] & (~ dir_w[0]))}} & {sbit_w[62:0], pad_w[0]}) | ({64{(sel_w[0] & dir_w[0])}} & {pad_w[0], sbit_w[63:1]})) | ({64{(~ sel_w[0])}} & sbit_w[63:0]))};
endmodule //acl_fp_log_s5_double_altbarrel_shift_qud


//altbarrel_shift CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Stratix V" SHIFTDIR="LEFT" WIDTH=128 WIDTHDIST=7 data distance result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altbarrel_shift_edb
	( 
	data,
	distance,
	result) ;
	input   [127:0]  data;
	input   [6:0]  distance;
	output   [127:0]  result;

	wire  [7:0]  dir_w;
	wire  direction_w;
	wire  [63:0]  pad_w;
	wire  [1023:0]  sbit_w;
	wire  [6:0]  sel_w;
	wire  [895:0]  smux_w;

	assign
		dir_w = {dir_w[6:0], direction_w},
		direction_w = 1'b0,
		pad_w = {64{1'b0}},
		result = sbit_w[1023:896],
		sbit_w = {smux_w[895:0], data},
		sel_w = {distance[6:0]},
		smux_w = {((({128{(sel_w[6] & (~ dir_w[6]))}} & {sbit_w[831:768], pad_w[63:0]}) | ({128{(sel_w[6] & dir_w[6])}} & {pad_w[63:0], sbit_w[895:832]})) | ({128{(~ sel_w[6])}} & sbit_w[895:768])), ((({128{(sel_w[5] & (~ dir_w[5]))}} & {sbit_w[735:640], pad_w[31:0]}) | ({128{(sel_w[5] & dir_w[5])}} & {pad_w[31:0], sbit_w[767:672]})) | ({128{(~ sel_w[5])}} & sbit_w[767:640])), ((({128{(sel_w[4] & (~ dir_w[4]))}} & {sbit_w[623:512], pad_w[15:0]}) | ({128{(sel_w[4] & dir_w[4])}} & {pad_w[15:0], sbit_w[639:528]})) | ({128{(~ sel_w[4])}} & sbit_w[639:512])), ((({128{(sel_w[3] & (~ dir_w[3]))}} & {sbit_w[503:384], pad_w[7:0]}) | ({128{(sel_w[3] & dir_w[3])}} & {pad_w[7:0], sbit_w[511:392]})) | ({128{(~ sel_w[3])}} & sbit_w[511:384])), ((({128{(sel_w[2] & (~ dir_w[2]))}} & {sbit_w[379:256], pad_w[3:0]}) | ({128{(sel_w[2] & dir_w[2])}} & {pad_w[3:0], sbit_w[383:260]})) | ({128{(~ sel_w[2])}} & sbit_w[383:256])), ((({128{(sel_w[1] & (~ dir_w[1]))}} & {sbit_w[253:128], pad_w[1:0]}) | ({128{(sel_w[1] & dir_w[1])}} & {pad_w[1:0], sbit_w[255:130]})) | ({128{(~ sel_w[1])}} & sbit_w[255:128])), ((({128{(sel_w[0] & (~ dir_w[0]))}} & {sbit_w[126:0], pad_w[0]}) | ({128{(sel_w[0] & dir_w[0])}} & {pad_w[0], sbit_w[127:1]})) | ({128{(~ sel_w[0])}} & sbit_w[127:0]))};
endmodule //acl_fp_log_s5_double_altbarrel_shift_edb


//altbarrel_shift CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Stratix V" PIPELINE=1 SHIFTDIR="RIGHT" WIDTH=64 WIDTHDIST=6 aclr clk_en clock data distance result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END

//synthesis_resources = reg 65 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altbarrel_shift_d2e
	( 
	aclr,
	clk_en,
	clock,
	data,
	distance,
	result) ;
	input   aclr;
	input   clk_en;
	input   clock;
	input   [63:0]  data;
	input   [5:0]  distance;
	output   [63:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clk_en;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[0:0]	dir_pipe;
	reg	[63:0]	sbit_piper1d;
	wire  [6:0]  dir_w;
	wire  direction_w;
	wire  [31:0]  pad_w;
	wire  [447:0]  sbit_w;
	wire  [5:0]  sel_w;
	wire  [383:0]  smux_w;

	// synopsys translate_off
	initial
		dir_pipe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dir_pipe <= 1'b0;
		else if  (clk_en == 1'b1)   dir_pipe <= {dir_w[5]};
	// synopsys translate_off
	initial
		sbit_piper1d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sbit_piper1d <= 64'b0;
		else if  (clk_en == 1'b1)   sbit_piper1d <= smux_w[383:320];
	assign
		dir_w = {dir_pipe[0], dir_w[4:0], direction_w},
		direction_w = 1'b1,
		pad_w = {32{1'b0}},
		result = sbit_w[447:384],
		sbit_w = {sbit_piper1d, smux_w[319:0], data},
		sel_w = {distance[5:0]},
		smux_w = {((({64{(sel_w[5] & (~ dir_w[5]))}} & {sbit_w[351:320], pad_w[31:0]}) | ({64{(sel_w[5] & dir_w[5])}} & {pad_w[31:0], sbit_w[383:352]})) | ({64{(~ sel_w[5])}} & sbit_w[383:320])), ((({64{(sel_w[4] & (~ dir_w[4]))}} & {sbit_w[303:256], pad_w[15:0]}) | ({64{(sel_w[4] & dir_w[4])}} & {pad_w[15:0], sbit_w[319:272]})) | ({64{(~ sel_w[4])}} & sbit_w[319:256])), ((({64{(sel_w[3] & (~ dir_w[3]))}} & {sbit_w[247:192], pad_w[7:0]}) | ({64{(sel_w[3] & dir_w[3])}} & {pad_w[7:0], sbit_w[255:200]})) | ({64{(~ sel_w[3])}} & sbit_w[255:192])), ((({64{(sel_w[2] & (~ dir_w[2]))}} & {sbit_w[187:128], pad_w[3:0]}) | ({64{(sel_w[2] & dir_w[2])}} & {pad_w[3:0], sbit_w[191:132]})) | ({64{(~ sel_w[2])}} & sbit_w[191:128])), ((({64{(sel_w[1] & (~ dir_w[1]))}} & {sbit_w[125:64], pad_w[1:0]}) | ({64{(sel_w[1] & dir_w[1])}} & {pad_w[1:0], sbit_w[127:66]})) | ({64{(~ sel_w[1])}} & sbit_w[127:64])), ((({64{(sel_w[0] & (~ dir_w[0]))}} & {sbit_w[62:0], pad_w[0]}) | ({64{(sel_w[0] & dir_w[0])}} & {pad_w[0], sbit_w[63:1]})) | ({64{(~ sel_w[0])}} & sbit_w[63:0]))};
endmodule //acl_fp_log_s5_double_altbarrel_shift_d2e


//altfp_log_and_or CBX_AUTO_BLACKBOX="ALL" LUT_INPUT_COUNT=6 OPERATION="AND" PIPELINE=3 WIDTH=11 aclr clken clock data result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = reg 4 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_and_or_rab
	( 
	aclr,
	clken,
	clock,
	data,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [10:0]  data;
	output   result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [10:0]  data;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[1:0]	connection_dffe0;
	reg	[0:0]	connection_dffe1;
	reg	connection_dffe2;
	wire  [10:0]  connection_r0_w;
	wire  [1:0]  connection_r1_w;
	wire  [0:0]  connection_r2_w;
	wire  [10:0]  operation_r1_w;
	wire  [1:0]  operation_r2_w;

	// synopsys translate_off
	initial
		connection_dffe0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) connection_dffe0 <= 2'b0;
		else if  (clken == 1'b1)   connection_dffe0 <= {operation_r1_w[10], operation_r1_w[5]};
	// synopsys translate_off
	initial
		connection_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) connection_dffe1 <= 1'b0;
		else if  (clken == 1'b1)   connection_dffe1 <= {operation_r2_w[1]};
	// synopsys translate_off
	initial
		connection_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) connection_dffe2 <= 1'b0;
		else if  (clken == 1'b1)   connection_dffe2 <= connection_r2_w[0];
	assign
		connection_r0_w = data,
		connection_r1_w = connection_dffe0,
		connection_r2_w = connection_dffe1,
		operation_r1_w = {(operation_r1_w[9] & connection_r0_w[10]), (operation_r1_w[8] & connection_r0_w[9]), (operation_r1_w[7] & connection_r0_w[8]), (operation_r1_w[6] & connection_r0_w[7]), connection_r0_w[6], (operation_r1_w[4] & connection_r0_w[5]), (operation_r1_w[3] & connection_r0_w[4]), (operation_r1_w[2] & connection_r0_w[3]), (operation_r1_w[1] & connection_r0_w[2]), (operation_r1_w[0] & connection_r0_w[1]), connection_r0_w[0]},
		operation_r2_w = {(operation_r2_w[0] & connection_r1_w[1]), connection_r1_w[0]},
		result = connection_dffe2;
endmodule //acl_fp_log_s5_double_altfp_log_and_or_rab


//altfp_log_and_or CBX_AUTO_BLACKBOX="ALL" LUT_INPUT_COUNT=6 OPERATION="OR" PIPELINE=3 WIDTH=11 aclr clken clock data result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = reg 4 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_and_or_98b
	( 
	aclr,
	clken,
	clock,
	data,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [10:0]  data;
	output   result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [10:0]  data;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[1:0]	connection_dffe0;
	reg	[0:0]	connection_dffe1;
	reg	connection_dffe2;
	wire  [10:0]  connection_r0_w;
	wire  [1:0]  connection_r1_w;
	wire  [0:0]  connection_r2_w;
	wire  [10:0]  operation_r1_w;
	wire  [1:0]  operation_r2_w;

	// synopsys translate_off
	initial
		connection_dffe0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) connection_dffe0 <= 2'b0;
		else if  (clken == 1'b1)   connection_dffe0 <= {operation_r1_w[10], operation_r1_w[5]};
	// synopsys translate_off
	initial
		connection_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) connection_dffe1 <= 1'b0;
		else if  (clken == 1'b1)   connection_dffe1 <= {operation_r2_w[1]};
	// synopsys translate_off
	initial
		connection_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) connection_dffe2 <= 1'b0;
		else if  (clken == 1'b1)   connection_dffe2 <= connection_r2_w[0];
	assign
		connection_r0_w = data,
		connection_r1_w = connection_dffe0,
		connection_r2_w = connection_dffe1,
		operation_r1_w = {(operation_r1_w[9] | connection_r0_w[10]), (operation_r1_w[8] | connection_r0_w[9]), (operation_r1_w[7] | connection_r0_w[8]), (operation_r1_w[6] | connection_r0_w[7]), connection_r0_w[6], (operation_r1_w[4] | connection_r0_w[5]), (operation_r1_w[3] | connection_r0_w[4]), (operation_r1_w[2] | connection_r0_w[3]), (operation_r1_w[1] | connection_r0_w[2]), (operation_r1_w[0] | connection_r0_w[1]), connection_r0_w[0]},
		operation_r2_w = {(operation_r2_w[0] | connection_r1_w[1]), connection_r1_w[0]},
		result = connection_dffe2;
endmodule //acl_fp_log_s5_double_altfp_log_and_or_98b


//altfp_log_and_or CBX_AUTO_BLACKBOX="ALL" LUT_INPUT_COUNT=6 OPERATION="OR" PIPELINE=3 WIDTH=52 aclr clken clock data result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = reg 12 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_and_or_e8b
	( 
	aclr,
	clken,
	clock,
	data,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [51:0]  data;
	output   result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [51:0]  data;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[8:0]	connection_dffe0;
	reg	[1:0]	connection_dffe1;
	reg	[0:0]	connection_dffe2;
	wire  [51:0]  connection_r0_w;
	wire  [8:0]  connection_r1_w;
	wire  [1:0]  connection_r2_w;
	wire  [0:0]  connection_r3_w;
	wire  [51:0]  operation_r1_w;
	wire  [8:0]  operation_r2_w;
	wire  [1:0]  operation_r3_w;

	// synopsys translate_off
	initial
		connection_dffe0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) connection_dffe0 <= 9'b0;
		else if  (clken == 1'b1)   connection_dffe0 <= {operation_r1_w[51], operation_r1_w[47], operation_r1_w[41], operation_r1_w[35], operation_r1_w[29], operation_r1_w[23], operation_r1_w[17], operation_r1_w[11], operation_r1_w[5]};
	// synopsys translate_off
	initial
		connection_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) connection_dffe1 <= 2'b0;
		else if  (clken == 1'b1)   connection_dffe1 <= {operation_r2_w[8], operation_r2_w[5]};
	// synopsys translate_off
	initial
		connection_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) connection_dffe2 <= 1'b0;
		else if  (clken == 1'b1)   connection_dffe2 <= {operation_r3_w[1]};
	assign
		connection_r0_w = data,
		connection_r1_w = connection_dffe0,
		connection_r2_w = connection_dffe1,
		connection_r3_w = connection_dffe2,
		operation_r1_w = {(operation_r1_w[50] | connection_r0_w[51]), (operation_r1_w[49] | connection_r0_w[50]), (operation_r1_w[48] | connection_r0_w[49]), connection_r0_w[48], (operation_r1_w[46] | connection_r0_w[47]), (operation_r1_w[45] | connection_r0_w[46]), (operation_r1_w[44] | connection_r0_w[45]), (operation_r1_w[43] | connection_r0_w[44]), (operation_r1_w[42] | connection_r0_w[43]), connection_r0_w[42], (operation_r1_w[40] | connection_r0_w[41]), (operation_r1_w[39] | connection_r0_w[40]), (operation_r1_w[38] | connection_r0_w[39]), (operation_r1_w[37] | connection_r0_w[38]), (operation_r1_w[36] | connection_r0_w[37]), connection_r0_w[36], (operation_r1_w[34] | connection_r0_w[35]), (operation_r1_w[33] | connection_r0_w[34]), (operation_r1_w[32] | connection_r0_w[33]), (operation_r1_w[31] | connection_r0_w[32]), (operation_r1_w[30] | connection_r0_w[31]), connection_r0_w[30], (operation_r1_w[28] | connection_r0_w[29]), (operation_r1_w[27] | connection_r0_w[28]), (operation_r1_w[26] | connection_r0_w[27]), (operation_r1_w[25] | connection_r0_w[26]), (operation_r1_w[24] | connection_r0_w[25]), connection_r0_w[24], (operation_r1_w[22] | connection_r0_w[23]), (operation_r1_w[21] | connection_r0_w[22]), (operation_r1_w[20] | connection_r0_w[21]), (operation_r1_w[19] | connection_r0_w[20]), (operation_r1_w[18] | connection_r0_w[19]), connection_r0_w[18], (operation_r1_w[16] | connection_r0_w[17]), (operation_r1_w[15] | connection_r0_w[16]), (operation_r1_w[14] | connection_r0_w[15]), (operation_r1_w[13] | connection_r0_w[14]), (operation_r1_w[12] | connection_r0_w[13]), connection_r0_w[12], (operation_r1_w[10] | connection_r0_w[11]), (operation_r1_w[9] | connection_r0_w[10]), (operation_r1_w[8] | connection_r0_w[9]), (operation_r1_w[7] | connection_r0_w[8]), (operation_r1_w[6] | connection_r0_w[7]), connection_r0_w[6], (operation_r1_w[4] | connection_r0_w[5]), (operation_r1_w[3] | connection_r0_w[4]), (operation_r1_w[2] | connection_r0_w[3]), (operation_r1_w[1] | connection_r0_w[2]), (operation_r1_w[0] | connection_r0_w[1]
), connection_r0_w[0]},
		operation_r2_w = {(operation_r2_w[7] | connection_r1_w[8]), (operation_r2_w[6] | connection_r1_w[7]), connection_r1_w[6], (operation_r2_w[4] | connection_r1_w[5]), (operation_r2_w[3] | connection_r1_w[4]), (operation_r2_w[2] | connection_r1_w[3]), (operation_r2_w[1] | connection_r1_w[2]), (operation_r2_w[0] | connection_r1_w[1]), connection_r1_w[0]},
		operation_r3_w = {(operation_r3_w[0] | connection_r2_w[1]), connection_r2_w[0]},
		result = connection_r3_w[0];
endmodule //acl_fp_log_s5_double_altfp_log_and_or_e8b


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="ADD" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=83 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_r0e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [82:0]  dataa;
	input   [82:0]  datab;
	output   [82:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [82:0]  dataa;
	tri0   [82:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [41:0]   wire_csa_lower_result;
	wire  [40:0]   wire_csa_upper0_result;
	wire  [40:0]   wire_csa_upper1_result;
	wire  [82:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[41:0]),
	.datab(datab[41:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "ADD",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 42,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[82:42]),
	.datab(datab[82:42]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "ADD",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 41,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[82:42]),
	.datab(datab[82:42]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "ADD",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 41,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({41{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({41{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_r0e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="ADD" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=63 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_p0e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [62:0]  dataa;
	input   [62:0]  datab;
	output   [62:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [62:0]  dataa;
	tri0   [62:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [31:0]   wire_csa_lower_result;
	wire  [30:0]   wire_csa_upper0_result;
	wire  [30:0]   wire_csa_upper1_result;
	wire  [62:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[31:0]),
	.datab(datab[31:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "ADD",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 32,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[62:32]),
	.datab(datab[62:32]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "ADD",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 31,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[62:32]),
	.datab(datab[62:32]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "ADD",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 31,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({31{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({31{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_p0e


//altfp_log_csa CARRY_SELECT="NO" CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="SUB" LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=11 dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_aoc
	( 
	dataa,
	datab,
	result) ;
	input   [10:0]  dataa;
	input   [10:0]  datab;
	output   [10:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [10:0]  dataa;
	tri0   [10:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [10:0]   wire_add_sub1_result;
	wire  [10:0]  result_w;

	lpm_add_sub   add_sub1
	( 
	.cout(),
	.dataa(dataa),
	.datab(datab),
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
		add_sub1.lpm_direction = "SUB",
		add_sub1.lpm_representation = "UNSIGNED",
		add_sub1.lpm_width = 11,
		add_sub1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = wire_add_sub1_result;
endmodule //acl_fp_log_s5_double_altfp_log_csa_aoc


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="SUB" LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=26 dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_i4b
	( 
	dataa,
	datab,
	result) ;
	input   [25:0]  dataa;
	input   [25:0]  datab;
	output   [25:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [25:0]  dataa;
	tri0   [25:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [12:0]   wire_csa_lower_result;
	wire  [12:0]   wire_csa_upper0_result;
	wire  [12:0]   wire_csa_upper1_result;
	wire  [25:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.cout(wire_csa_lower_cout),
	.dataa(dataa[12:0]),
	.datab(datab[12:0]),
	.overflow(),
	.result(wire_csa_lower_result)
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
		csa_lower.lpm_direction = "SUB",
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 13,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.cin(1'b0),
	.cout(),
	.dataa(dataa[25:13]),
	.datab(datab[25:13]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "SUB",
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 13,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.cin(1'b1),
	.cout(),
	.dataa(dataa[25:13]),
	.datab(datab[25:13]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "SUB",
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 13,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({13{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({13{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_i4b


//altfp_log_csa CARRY_SELECT="NO" CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="SUB" LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=7 dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_vmc
	( 
	dataa,
	datab,
	result) ;
	input   [6:0]  dataa;
	input   [6:0]  datab;
	output   [6:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [6:0]  dataa;
	tri0   [6:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [6:0]   wire_add_sub2_result;
	wire  [6:0]  result_w;

	lpm_add_sub   add_sub2
	( 
	.cout(),
	.dataa(dataa),
	.datab(datab),
	.overflow(),
	.result(wire_add_sub2_result)
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
		add_sub2.lpm_direction = "SUB",
		add_sub2.lpm_representation = "UNSIGNED",
		add_sub2.lpm_width = 7,
		add_sub2.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = wire_add_sub2_result;
endmodule //acl_fp_log_s5_double_altfp_log_csa_vmc


//altfp_log_csa CARRY_SELECT="NO" CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="SUB" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=55 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_plf
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [54:0]  dataa;
	input   [54:0]  datab;
	output   [54:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [54:0]  dataa;
	tri0   [54:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [54:0]   wire_add_sub3_result;
	wire  [54:0]  result_w;

	lpm_add_sub   add_sub3
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa),
	.datab(datab),
	.overflow(),
	.result(wire_add_sub3_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub3.lpm_direction = "SUB",
		add_sub3.lpm_pipeline = 1,
		add_sub3.lpm_representation = "UNSIGNED",
		add_sub3.lpm_width = 55,
		add_sub3.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = wire_add_sub3_result;
endmodule //acl_fp_log_s5_double_altfp_log_csa_plf


//altfp_log_csa CARRY_SELECT="NO" CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="SUB" LPM_PIPELINE=2 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=11 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_ilf
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [10:0]  dataa;
	input   [10:0]  datab;
	output   [10:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [10:0]  dataa;
	tri0   [10:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [10:0]   wire_add_sub4_result;
	wire  [10:0]  result_w;

	lpm_add_sub   add_sub4
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa),
	.datab(datab),
	.overflow(),
	.result(wire_add_sub4_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub4.lpm_direction = "SUB",
		add_sub4.lpm_pipeline = 2,
		add_sub4.lpm_representation = "UNSIGNED",
		add_sub4.lpm_width = 11,
		add_sub4.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = wire_add_sub4_result;
endmodule //acl_fp_log_s5_double_altfp_log_csa_ilf


//altfp_log_rr_block CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Stratix V" WIDTH_ALMOSTLOG=83 WIDTH_Y0=54 WIDTH_Z=55 a0_in aclr almostlog clk_en clock y0_in z
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="ADD" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=60 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_m0e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [59:0]  dataa;
	input   [59:0]  datab;
	output   [59:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [59:0]  dataa;
	tri0   [59:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [29:0]   wire_csa_lower_result;
	wire  [29:0]   wire_csa_upper0_result;
	wire  [29:0]   wire_csa_upper1_result;
	wire  [59:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[29:0]),
	.datab(datab[29:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "ADD",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 30,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[59:30]),
	.datab(datab[59:30]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "ADD",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 30,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[59:30]),
	.datab(datab[59:30]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "ADD",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 30,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({30{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({30{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_m0e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="ADD" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=69 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_v0e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [68:0]  dataa;
	input   [68:0]  datab;
	output   [68:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [68:0]  dataa;
	tri0   [68:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [34:0]   wire_csa_lower_result;
	wire  [33:0]   wire_csa_upper0_result;
	wire  [33:0]   wire_csa_upper1_result;
	wire  [68:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[34:0]),
	.datab(datab[34:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "ADD",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 35,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[68:35]),
	.datab(datab[68:35]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "ADD",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 34,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[68:35]),
	.datab(datab[68:35]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "ADD",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 34,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({34{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({34{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_v0e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="ADD" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=70 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_n0e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [69:0]  dataa;
	input   [69:0]  datab;
	output   [69:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [69:0]  dataa;
	tri0   [69:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [34:0]   wire_csa_lower_result;
	wire  [34:0]   wire_csa_upper0_result;
	wire  [34:0]   wire_csa_upper1_result;
	wire  [69:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[34:0]),
	.datab(datab[34:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "ADD",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 35,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[69:35]),
	.datab(datab[69:35]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "ADD",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 35,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[69:35]),
	.datab(datab[69:35]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "ADD",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 35,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({35{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({35{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_n0e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="ADD" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=67 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_t0e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [66:0]  dataa;
	input   [66:0]  datab;
	output   [66:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [66:0]  dataa;
	tri0   [66:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [33:0]   wire_csa_lower_result;
	wire  [32:0]   wire_csa_upper0_result;
	wire  [32:0]   wire_csa_upper1_result;
	wire  [66:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[33:0]),
	.datab(datab[33:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "ADD",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 34,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[66:34]),
	.datab(datab[66:34]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "ADD",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 33,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[66:34]),
	.datab(datab[66:34]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "ADD",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 33,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({33{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({33{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_t0e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="ADD" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=64 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_q0e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [63:0]  dataa;
	input   [63:0]  datab;
	output   [63:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [63:0]  dataa;
	tri0   [63:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [31:0]   wire_csa_lower_result;
	wire  [31:0]   wire_csa_upper0_result;
	wire  [31:0]   wire_csa_upper1_result;
	wire  [63:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[31:0]),
	.datab(datab[31:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "ADD",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 32,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[63:32]),
	.datab(datab[63:32]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "ADD",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 32,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[63:32]),
	.datab(datab[63:32]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "ADD",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 32,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({32{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({32{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_q0e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="ADD" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=61 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_o0e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [60:0]  dataa;
	input   [60:0]  datab;
	output   [60:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [60:0]  dataa;
	tri0   [60:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [30:0]   wire_csa_lower_result;
	wire  [29:0]   wire_csa_upper0_result;
	wire  [29:0]   wire_csa_upper1_result;
	wire  [60:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[30:0]),
	.datab(datab[30:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "ADD",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 31,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[60:31]),
	.datab(datab[60:31]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "ADD",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 30,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[60:31]),
	.datab(datab[60:31]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "ADD",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 30,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({30{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({30{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_o0e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="ADD" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=58 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_u0e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [57:0]  dataa;
	input   [57:0]  datab;
	output   [57:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [57:0]  dataa;
	tri0   [57:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [28:0]   wire_csa_lower_result;
	wire  [28:0]   wire_csa_upper0_result;
	wire  [28:0]   wire_csa_upper1_result;
	wire  [57:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[28:0]),
	.datab(datab[28:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "ADD",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 29,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[57:29]),
	.datab(datab[57:29]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "ADD",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 29,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[57:29]),
	.datab(datab[57:29]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "ADD",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 29,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({29{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({29{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_u0e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="ADD" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=55 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_s0e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [54:0]  dataa;
	input   [54:0]  datab;
	output   [54:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [54:0]  dataa;
	tri0   [54:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [27:0]   wire_csa_lower_result;
	wire  [26:0]   wire_csa_upper0_result;
	wire  [26:0]   wire_csa_upper1_result;
	wire  [54:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[27:0]),
	.datab(datab[27:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "ADD",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 28,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[54:28]),
	.datab(datab[54:28]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "ADD",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 27,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[54:28]),
	.datab(datab[54:28]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "ADD",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 27,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({27{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({27{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_s0e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="SUB" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=60 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_n1e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [59:0]  dataa;
	input   [59:0]  datab;
	output   [59:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [59:0]  dataa;
	tri0   [59:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [29:0]   wire_csa_lower_result;
	wire  [29:0]   wire_csa_upper0_result;
	wire  [29:0]   wire_csa_upper1_result;
	wire  [59:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[29:0]),
	.datab(datab[29:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "SUB",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 30,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[59:30]),
	.datab(datab[59:30]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "SUB",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 30,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[59:30]),
	.datab(datab[59:30]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "SUB",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 30,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({30{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({30{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_n1e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="SUB" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=69 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_02e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [68:0]  dataa;
	input   [68:0]  datab;
	output   [68:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [68:0]  dataa;
	tri0   [68:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [34:0]   wire_csa_lower_result;
	wire  [33:0]   wire_csa_upper0_result;
	wire  [33:0]   wire_csa_upper1_result;
	wire  [68:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[34:0]),
	.datab(datab[34:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "SUB",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 35,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[68:35]),
	.datab(datab[68:35]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "SUB",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 34,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[68:35]),
	.datab(datab[68:35]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "SUB",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 34,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({34{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({34{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_02e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="SUB" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=70 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_o1e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [69:0]  dataa;
	input   [69:0]  datab;
	output   [69:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [69:0]  dataa;
	tri0   [69:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [34:0]   wire_csa_lower_result;
	wire  [34:0]   wire_csa_upper0_result;
	wire  [34:0]   wire_csa_upper1_result;
	wire  [69:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[34:0]),
	.datab(datab[34:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "SUB",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 35,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[69:35]),
	.datab(datab[69:35]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "SUB",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 35,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[69:35]),
	.datab(datab[69:35]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "SUB",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 35,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({35{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({35{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_o1e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="SUB" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=67 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_u1e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [66:0]  dataa;
	input   [66:0]  datab;
	output   [66:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [66:0]  dataa;
	tri0   [66:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [33:0]   wire_csa_lower_result;
	wire  [32:0]   wire_csa_upper0_result;
	wire  [32:0]   wire_csa_upper1_result;
	wire  [66:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[33:0]),
	.datab(datab[33:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "SUB",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 34,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[66:34]),
	.datab(datab[66:34]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "SUB",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 33,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[66:34]),
	.datab(datab[66:34]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "SUB",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 33,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({33{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({33{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_u1e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="SUB" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=64 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_r1e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [63:0]  dataa;
	input   [63:0]  datab;
	output   [63:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [63:0]  dataa;
	tri0   [63:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [31:0]   wire_csa_lower_result;
	wire  [31:0]   wire_csa_upper0_result;
	wire  [31:0]   wire_csa_upper1_result;
	wire  [63:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[31:0]),
	.datab(datab[31:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "SUB",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 32,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[63:32]),
	.datab(datab[63:32]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "SUB",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 32,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[63:32]),
	.datab(datab[63:32]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "SUB",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 32,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({32{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({32{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_r1e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="SUB" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=61 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_p1e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [60:0]  dataa;
	input   [60:0]  datab;
	output   [60:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [60:0]  dataa;
	tri0   [60:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [30:0]   wire_csa_lower_result;
	wire  [29:0]   wire_csa_upper0_result;
	wire  [29:0]   wire_csa_upper1_result;
	wire  [60:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[30:0]),
	.datab(datab[30:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "SUB",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 31,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[60:31]),
	.datab(datab[60:31]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "SUB",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 30,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[60:31]),
	.datab(datab[60:31]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "SUB",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 30,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({30{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({30{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_p1e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="SUB" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=58 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_v1e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [57:0]  dataa;
	input   [57:0]  datab;
	output   [57:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [57:0]  dataa;
	tri0   [57:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [28:0]   wire_csa_lower_result;
	wire  [28:0]   wire_csa_upper0_result;
	wire  [28:0]   wire_csa_upper1_result;
	wire  [57:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[28:0]),
	.datab(datab[28:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "SUB",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 29,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[57:29]),
	.datab(datab[57:29]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "SUB",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 29,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[57:29]),
	.datab(datab[57:29]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "SUB",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 29,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({29{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({29{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_v1e


//altfp_log_csa CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="SUB" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=55 aclr clken clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_log 2012:05:31:20:08:02:SJ cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_altsquare 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_csa_s1e
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [54:0]  dataa;
	input   [54:0]  datab;
	output   [54:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [54:0]  dataa;
	tri0   [54:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [27:0]   wire_csa_lower_result;
	wire  [26:0]   wire_csa_upper0_result;
	wire  [26:0]   wire_csa_upper1_result;
	wire  [54:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[27:0]),
	.datab(datab[27:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "SUB",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "UNSIGNED",
		csa_lower.lpm_width = 28,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[54:28]),
	.datab(datab[54:28]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "SUB",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "UNSIGNED",
		csa_upper0.lpm_width = 27,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[54:28]),
	.datab(datab[54:28]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "SUB",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "UNSIGNED",
		csa_upper1.lpm_width = 27,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({27{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({27{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //acl_fp_log_s5_double_altfp_log_csa_s1e

//synthesis_resources = lpm_add_sub 72 lpm_mult 9 lpm_mux 10 reg 2344 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_range_reduction_3sd
	( 
	a0_in,
	aclr,
	almostlog,
	clk_en,
	clock,
	y0_in,
	z) ;
	input   [4:0]  a0_in;
	input   aclr;
	output   [82:0]  almostlog;
	input   clk_en;
	input   clock;
	input   [53:0]  y0_in;
	output   [54:0]  z;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clk_en;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [82:0]   wire_add0_1_result;
	wire  [82:0]   wire_add0_2_result;
	wire  [82:0]   wire_add0_3_result;
	wire  [82:0]   wire_add0_4_result;
	wire  [82:0]   wire_add0_5_result;
	wire  [82:0]   wire_add0_6_result;
	wire  [82:0]   wire_add0_7_result;
	wire  [82:0]   wire_add0_8_result;
	wire  [59:0]   wire_add1_1_result;
	wire  [68:0]   wire_add1_2_result;
	wire  [69:0]   wire_add1_3_result;
	wire  [66:0]   wire_add1_4_result;
	wire  [63:0]   wire_add1_5_result;
	wire  [60:0]   wire_add1_6_result;
	wire  [57:0]   wire_add1_7_result;
	wire  [54:0]   wire_add1_8_result;
	wire  [59:0]   wire_sub1_1_result;
	wire  [68:0]   wire_sub1_2_result;
	wire  [69:0]   wire_sub1_3_result;
	wire  [66:0]   wire_sub1_4_result;
	wire  [63:0]   wire_sub1_5_result;
	wire  [60:0]   wire_sub1_6_result;
	wire  [57:0]   wire_sub1_7_result;
	wire  [54:0]   wire_sub1_8_result;
	reg	[4:0]	A_pipe0_reg0;
	reg	[4:0]	A_pipe0_reg1;
	reg	[3:0]	A_wire1_reg0;
	reg	[3:0]	A_wire2_reg0;
	reg	[3:0]	A_wire3_reg0;
	reg	[3:0]	A_wire4_reg0;
	reg	[3:0]	A_wire5_reg0;
	reg	[3:0]	A_wire6_reg0;
	reg	[3:0]	A_wire7_reg0;
	reg	[3:0]	A_wire8_reg0;
	reg	[49:0]	B_wire1_reg0;
	reg	[55:0]	B_wire2_reg0;
	reg	[64:0]	B_wire3_reg0;
	reg	[65:0]	B_wire4_reg0;
	reg	[62:0]	B_wire5_reg0;
	reg	[59:0]	B_wire6_reg0;
	reg	[56:0]	B_wire7_reg0;
	reg	[53:0]	B_wire8_reg0;
	reg	[82:0]	S_pipe22_reg0;
	reg	[82:0]	S_pipe23_reg0;
	reg	[82:0]	S_pipe24_reg0;
	reg	[82:0]	S_pipe25_reg0;
	reg	[82:0]	S_pipe26_reg0;
	reg	[82:0]	S_pipe27_reg0;
	reg	[82:0]	S_pipe28_reg0;
	reg	[82:0]	S_pipe29_reg0;
	reg	[82:0]	S_wire1_reg0;
	reg	[82:0]	S_wire2_reg0;
	reg	[82:0]	S_wire3_reg0;
	reg	[82:0]	S_wire4_reg0;
	reg	[82:0]	S_wire5_reg0;
	reg	[82:0]	S_wire6_reg0;
	reg	[82:0]	S_wire7_reg0;
	reg	[82:0]	S_wire8_reg0;
	reg	[53:0]	Z_wire1_reg0;
	reg	[59:0]	Z_wire2_reg0;
	reg	[68:0]	Z_wire3_reg0;
	reg	[69:0]	Z_wire4_reg0;
	reg	[66:0]	Z_wire5_reg0;
	reg	[63:0]	Z_wire6_reg0;
	reg	[60:0]	Z_wire7_reg0;
	reg	[57:0]	Z_wire8_reg0;
	wire  [59:0]   wire_mult0_result;
	wire  [57:0]   wire_mult1_result;
	wire  [63:0]   wire_mult2_result;
	wire  [66:0]   wire_mult3_result;
	wire  [60:0]   wire_mult4_result;
	wire  [54:0]   wire_mult5_result;
	wire  [48:0]   wire_mult6_result;
	wire  [42:0]   wire_mult7_result;
	wire  [36:0]   wire_mult8_result;
	wire  [5:0]   wire_InvTable0_result;
	wire  [82:0]   wire_LogTable0_result;
	wire  [78:0]   wire_LogTable1_result;
	wire  [75:0]   wire_LogTable2_result;
	wire  [72:0]   wire_LogTable3_result;
	wire  [69:0]   wire_LogTable4_result;
	wire  [66:0]   wire_LogTable5_result;
	wire  [63:0]   wire_LogTable6_result;
	wire  [60:0]   wire_LogTable7_result;
	wire  [57:0]   wire_LogTable8_result;
	wire  [3:0]  A1_is_all_zero;
	wire  [3:0]  A1_is_not_zero;
	wire  [3:0]  A_all_zero2;
	wire  [3:0]  A_all_zero3;
	wire  [3:0]  A_all_zero4;
	wire  [3:0]  A_all_zero5;
	wire  [3:0]  A_all_zero6;
	wire  [3:0]  A_all_zero7;
	wire  [3:0]  A_all_zero8;
	wire  [4:0]  A_pipe0;
	wire  [3:0]  A_pipe11;
	wire  [3:0]  A_pipe12;
	wire  [3:0]  A_pipe13;
	wire  [3:0]  A_pipe14;
	wire  [3:0]  A_pipe15;
	wire  [3:0]  A_pipe16;
	wire  [3:0]  A_pipe17;
	wire  [3:0]  A_pipe18;
	wire  [4:0]  A_wire0;
	wire  [3:0]  A_wire1;
	wire  [3:0]  A_wire2;
	wire  [3:0]  A_wire3;
	wire  [3:0]  A_wire4;
	wire  [3:0]  A_wire5;
	wire  [3:0]  A_wire6;
	wire  [3:0]  A_wire7;
	wire  [3:0]  A_wire8;
	wire  [59:0]  B_pad_wire1;
	wire  [68:0]  B_pad_wire2;
	wire  [69:0]  B_pad_wire3;
	wire  [66:0]  B_pad_wire4;
	wire  [63:0]  B_pad_wire5;
	wire  [60:0]  B_pad_wire6;
	wire  [57:0]  B_pad_wire7;
	wire  [54:0]  B_pad_wire8;
	wire  [49:0]  B_pipe1;
	wire  [55:0]  B_pipe2;
	wire  [64:0]  B_pipe3;
	wire  [65:0]  B_pipe4;
	wire  [62:0]  B_pipe5;
	wire  [59:0]  B_pipe6;
	wire  [56:0]  B_pipe7;
	wire  [53:0]  B_pipe8;
	wire  [49:0]  B_wire1;
	wire  [55:0]  B_wire2;
	wire  [64:0]  B_wire3;
	wire  [65:0]  B_wire4;
	wire  [62:0]  B_wire5;
	wire  [59:0]  B_wire6;
	wire  [56:0]  B_wire7;
	wire  [53:0]  B_wire8;
	wire  [59:0]  epsZ_pad_wire1;
	wire  [68:0]  epsZ_pad_wire2;
	wire  [69:0]  epsZ_pad_wire3;
	wire  [66:0]  epsZ_pad_wire4;
	wire  [63:0]  epsZ_pad_wire5;
	wire  [60:0]  epsZ_pad_wire6;
	wire  [57:0]  epsZ_pad_wire7;
	wire  [54:0]  epsZ_pad_wire8;
	wire  [59:0]  epsZ_wire1;
	wire  [68:0]  epsZ_wire2;
	wire  [80:0]  epsZ_wire3;
	wire  [84:0]  epsZ_wire4;
	wire  [84:0]  epsZ_wire5;
	wire  [84:0]  epsZ_wire6;
	wire  [84:0]  epsZ_wire7;
	wire  [84:0]  epsZ_wire8;
	wire  [5:0]  InvA0;
	wire  [82:0]  L_wire0;
	wire  [78:0]  L_wire1;
	wire  [75:0]  L_wire2;
	wire  [72:0]  L_wire3;
	wire  [69:0]  L_wire4;
	wire  [66:0]  L_wire5;
	wire  [63:0]  L_wire6;
	wire  [60:0]  L_wire7;
	wire  [57:0]  L_wire8;
	wire  [59:0]  mux0_data0;
	wire  [59:0]  mux0_data1;
	wire  [59:0]  P_pad_wire1;
	wire  [68:0]  P_pad_wire2;
	wire  [69:0]  P_pad_wire3;
	wire  [66:0]  P_pad_wire4;
	wire  [63:0]  P_pad_wire5;
	wire  [60:0]  P_pad_wire6;
	wire  [57:0]  P_pad_wire7;
	wire  [54:0]  P_pad_wire8;
	wire  [59:0]  P_wire0;
	wire  [57:0]  P_wire1;
	wire  [63:0]  P_wire2;
	wire  [66:0]  P_wire3;
	wire  [60:0]  P_wire4;
	wire  [54:0]  P_wire5;
	wire  [48:0]  P_wire6;
	wire  [42:0]  P_wire7;
	wire  [36:0]  P_wire8;
	wire  [82:0]  S_pipe11;
	wire  [82:0]  S_pipe12;
	wire  [82:0]  S_pipe13;
	wire  [82:0]  S_pipe14;
	wire  [82:0]  S_pipe15;
	wire  [82:0]  S_pipe16;
	wire  [82:0]  S_pipe17;
	wire  [82:0]  S_pipe18;
	wire  [82:0]  S_pipe22;
	wire  [82:0]  S_pipe23;
	wire  [82:0]  S_pipe24;
	wire  [82:0]  S_pipe25;
	wire  [82:0]  S_pipe26;
	wire  [82:0]  S_pipe27;
	wire  [82:0]  S_pipe28;
	wire  [82:0]  S_pipe29;
	wire  [82:0]  S_wire1;
	wire  [82:0]  S_wire2;
	wire  [82:0]  S_wire3;
	wire  [82:0]  S_wire4;
	wire  [82:0]  S_wire5;
	wire  [82:0]  S_wire6;
	wire  [82:0]  S_wire7;
	wire  [82:0]  S_wire8;
	wire  [82:0]  S_wire9;
	wire  [53:0]  Z_pipe1;
	wire  [59:0]  Z_pipe2;
	wire  [68:0]  Z_pipe3;
	wire  [69:0]  Z_pipe4;
	wire  [66:0]  Z_pipe5;
	wire  [63:0]  Z_pipe6;
	wire  [60:0]  Z_pipe7;
	wire  [57:0]  Z_pipe8;
	wire  [53:0]  Z_wire1;
	wire  [59:0]  Z_wire2;
	wire  [68:0]  Z_wire3;
	wire  [69:0]  Z_wire4;
	wire  [66:0]  Z_wire5;
	wire  [63:0]  Z_wire6;
	wire  [60:0]  Z_wire7;
	wire  [57:0]  Z_wire8;
	wire  [54:0]  Z_wire9;
	wire  [53:0]  ZM_wire1;
	wire  [59:0]  ZM_wire2;
	wire  [62:0]  ZM_wire3;
	wire  [56:0]  ZM_wire4;
	wire  [50:0]  ZM_wire5;
	wire  [44:0]  ZM_wire6;
	wire  [38:0]  ZM_wire7;
	wire  [32:0]  ZM_wire8;

	acl_fp_log_s5_double_altfp_log_csa_r0e   add0_1
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(S_pipe11),
	.datab({{4{1'b0}}, L_wire1}),
	.result(wire_add0_1_result));
	acl_fp_log_s5_double_altfp_log_csa_r0e   add0_2
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(S_pipe12),
	.datab({{7{1'b0}}, L_wire2}),
	.result(wire_add0_2_result));
	acl_fp_log_s5_double_altfp_log_csa_r0e   add0_3
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(S_pipe13),
	.datab({{10{1'b0}}, L_wire3}),
	.result(wire_add0_3_result));
	acl_fp_log_s5_double_altfp_log_csa_r0e   add0_4
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(S_pipe14),
	.datab({{13{1'b0}}, L_wire4}),
	.result(wire_add0_4_result));
	acl_fp_log_s5_double_altfp_log_csa_r0e   add0_5
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(S_pipe15),
	.datab({{16{1'b0}}, L_wire5}),
	.result(wire_add0_5_result));
	acl_fp_log_s5_double_altfp_log_csa_r0e   add0_6
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(S_pipe16),
	.datab({{19{1'b0}}, L_wire6}),
	.result(wire_add0_6_result));
	acl_fp_log_s5_double_altfp_log_csa_r0e   add0_7
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(S_pipe17),
	.datab({{22{1'b0}}, L_wire7}),
	.result(wire_add0_7_result));
	acl_fp_log_s5_double_altfp_log_csa_r0e   add0_8
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(S_pipe18),
	.datab({{25{1'b0}}, L_wire8}),
	.result(wire_add0_8_result));
	acl_fp_log_s5_double_altfp_log_csa_m0e   add1_1
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(B_pad_wire1),
	.datab(epsZ_pad_wire1),
	.result(wire_add1_1_result));
	acl_fp_log_s5_double_altfp_log_csa_v0e   add1_2
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(B_pad_wire2),
	.datab(epsZ_pad_wire2),
	.result(wire_add1_2_result));
	acl_fp_log_s5_double_altfp_log_csa_n0e   add1_3
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(B_pad_wire3),
	.datab(epsZ_pad_wire3),
	.result(wire_add1_3_result));
	acl_fp_log_s5_double_altfp_log_csa_t0e   add1_4
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(B_pad_wire4),
	.datab(epsZ_pad_wire4),
	.result(wire_add1_4_result));
	acl_fp_log_s5_double_altfp_log_csa_q0e   add1_5
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(B_pad_wire5),
	.datab(epsZ_pad_wire5),
	.result(wire_add1_5_result));
	acl_fp_log_s5_double_altfp_log_csa_o0e   add1_6
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(B_pad_wire6),
	.datab(epsZ_pad_wire6),
	.result(wire_add1_6_result));
	acl_fp_log_s5_double_altfp_log_csa_u0e   add1_7
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(B_pad_wire7),
	.datab(epsZ_pad_wire7),
	.result(wire_add1_7_result));
	acl_fp_log_s5_double_altfp_log_csa_s0e   add1_8
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(B_pad_wire8),
	.datab(epsZ_pad_wire8),
	.result(wire_add1_8_result));
	acl_fp_log_s5_double_altfp_log_csa_n1e   sub1_1
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(wire_add1_1_result),
	.datab(P_pad_wire1),
	.result(wire_sub1_1_result));
	acl_fp_log_s5_double_altfp_log_csa_02e   sub1_2
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(wire_add1_2_result),
	.datab(P_pad_wire2),
	.result(wire_sub1_2_result));
	acl_fp_log_s5_double_altfp_log_csa_o1e   sub1_3
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(wire_add1_3_result),
	.datab(P_pad_wire3),
	.result(wire_sub1_3_result));
	acl_fp_log_s5_double_altfp_log_csa_u1e   sub1_4
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(wire_add1_4_result),
	.datab(P_pad_wire4),
	.result(wire_sub1_4_result));
	acl_fp_log_s5_double_altfp_log_csa_r1e   sub1_5
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(wire_add1_5_result),
	.datab(P_pad_wire5),
	.result(wire_sub1_5_result));
	acl_fp_log_s5_double_altfp_log_csa_p1e   sub1_6
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(wire_add1_6_result),
	.datab(P_pad_wire6),
	.result(wire_sub1_6_result));
	acl_fp_log_s5_double_altfp_log_csa_v1e   sub1_7
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(wire_add1_7_result),
	.datab(P_pad_wire7),
	.result(wire_sub1_7_result));
	acl_fp_log_s5_double_altfp_log_csa_s1e   sub1_8
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(wire_add1_8_result),
	.datab(P_pad_wire8),
	.result(wire_sub1_8_result));
	// synopsys translate_off
	initial
		A_pipe0_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) A_pipe0_reg0 <= 5'b0;
		else if  (clk_en == 1'b1)   A_pipe0_reg0 <= A_pipe0;
	// synopsys translate_off
	initial
		A_pipe0_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) A_pipe0_reg1 <= 5'b0;
		else if  (clk_en == 1'b1)   A_pipe0_reg1 <= A_pipe0_reg0;
	// synopsys translate_off
	initial
		A_wire1_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) A_wire1_reg0 <= 4'b0;
		else if  (clk_en == 1'b1)   A_wire1_reg0 <= A_wire1;
	// synopsys translate_off
	initial
		A_wire2_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) A_wire2_reg0 <= 4'b0;
		else if  (clk_en == 1'b1)   A_wire2_reg0 <= A_wire2;
	// synopsys translate_off
	initial
		A_wire3_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) A_wire3_reg0 <= 4'b0;
		else if  (clk_en == 1'b1)   A_wire3_reg0 <= A_wire3;
	// synopsys translate_off
	initial
		A_wire4_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) A_wire4_reg0 <= 4'b0;
		else if  (clk_en == 1'b1)   A_wire4_reg0 <= A_wire4;
	// synopsys translate_off
	initial
		A_wire5_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) A_wire5_reg0 <= 4'b0;
		else if  (clk_en == 1'b1)   A_wire5_reg0 <= A_wire5;
	// synopsys translate_off
	initial
		A_wire6_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) A_wire6_reg0 <= 4'b0;
		else if  (clk_en == 1'b1)   A_wire6_reg0 <= A_wire6;
	// synopsys translate_off
	initial
		A_wire7_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) A_wire7_reg0 <= 4'b0;
		else if  (clk_en == 1'b1)   A_wire7_reg0 <= A_wire7;
	// synopsys translate_off
	initial
		A_wire8_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) A_wire8_reg0 <= 4'b0;
		else if  (clk_en == 1'b1)   A_wire8_reg0 <= A_wire8;
	// synopsys translate_off
	initial
		B_wire1_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) B_wire1_reg0 <= 50'b0;
		else if  (clk_en == 1'b1)   B_wire1_reg0 <= B_wire1;
	// synopsys translate_off
	initial
		B_wire2_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) B_wire2_reg0 <= 56'b0;
		else if  (clk_en == 1'b1)   B_wire2_reg0 <= B_wire2;
	// synopsys translate_off
	initial
		B_wire3_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) B_wire3_reg0 <= 65'b0;
		else if  (clk_en == 1'b1)   B_wire3_reg0 <= B_wire3;
	// synopsys translate_off
	initial
		B_wire4_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) B_wire4_reg0 <= 66'b0;
		else if  (clk_en == 1'b1)   B_wire4_reg0 <= B_wire4;
	// synopsys translate_off
	initial
		B_wire5_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) B_wire5_reg0 <= 63'b0;
		else if  (clk_en == 1'b1)   B_wire5_reg0 <= B_wire5;
	// synopsys translate_off
	initial
		B_wire6_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) B_wire6_reg0 <= 60'b0;
		else if  (clk_en == 1'b1)   B_wire6_reg0 <= B_wire6;
	// synopsys translate_off
	initial
		B_wire7_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) B_wire7_reg0 <= 57'b0;
		else if  (clk_en == 1'b1)   B_wire7_reg0 <= B_wire7;
	// synopsys translate_off
	initial
		B_wire8_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) B_wire8_reg0 <= 54'b0;
		else if  (clk_en == 1'b1)   B_wire8_reg0 <= B_wire8;
	// synopsys translate_off
	initial
		S_pipe22_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_pipe22_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_pipe22_reg0 <= S_pipe22;
	// synopsys translate_off
	initial
		S_pipe23_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_pipe23_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_pipe23_reg0 <= S_pipe23;
	// synopsys translate_off
	initial
		S_pipe24_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_pipe24_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_pipe24_reg0 <= S_pipe24;
	// synopsys translate_off
	initial
		S_pipe25_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_pipe25_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_pipe25_reg0 <= S_pipe25;
	// synopsys translate_off
	initial
		S_pipe26_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_pipe26_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_pipe26_reg0 <= S_pipe26;
	// synopsys translate_off
	initial
		S_pipe27_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_pipe27_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_pipe27_reg0 <= S_pipe27;
	// synopsys translate_off
	initial
		S_pipe28_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_pipe28_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_pipe28_reg0 <= S_pipe28;
	// synopsys translate_off
	initial
		S_pipe29_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_pipe29_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_pipe29_reg0 <= S_pipe29;
	// synopsys translate_off
	initial
		S_wire1_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_wire1_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_wire1_reg0 <= S_wire1;
	// synopsys translate_off
	initial
		S_wire2_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_wire2_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_wire2_reg0 <= S_wire2;
	// synopsys translate_off
	initial
		S_wire3_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_wire3_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_wire3_reg0 <= S_wire3;
	// synopsys translate_off
	initial
		S_wire4_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_wire4_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_wire4_reg0 <= S_wire4;
	// synopsys translate_off
	initial
		S_wire5_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_wire5_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_wire5_reg0 <= S_wire5;
	// synopsys translate_off
	initial
		S_wire6_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_wire6_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_wire6_reg0 <= S_wire6;
	// synopsys translate_off
	initial
		S_wire7_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_wire7_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_wire7_reg0 <= S_wire7;
	// synopsys translate_off
	initial
		S_wire8_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) S_wire8_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   S_wire8_reg0 <= S_wire8;
	// synopsys translate_off
	initial
		Z_wire1_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Z_wire1_reg0 <= 54'b0;
		else if  (clk_en == 1'b1)   Z_wire1_reg0 <= Z_wire1;
	// synopsys translate_off
	initial
		Z_wire2_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Z_wire2_reg0 <= 60'b0;
		else if  (clk_en == 1'b1)   Z_wire2_reg0 <= Z_wire2;
	// synopsys translate_off
	initial
		Z_wire3_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Z_wire3_reg0 <= 69'b0;
		else if  (clk_en == 1'b1)   Z_wire3_reg0 <= Z_wire3;
	// synopsys translate_off
	initial
		Z_wire4_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Z_wire4_reg0 <= 70'b0;
		else if  (clk_en == 1'b1)   Z_wire4_reg0 <= Z_wire4;
	// synopsys translate_off
	initial
		Z_wire5_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Z_wire5_reg0 <= 67'b0;
		else if  (clk_en == 1'b1)   Z_wire5_reg0 <= Z_wire5;
	// synopsys translate_off
	initial
		Z_wire6_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Z_wire6_reg0 <= 64'b0;
		else if  (clk_en == 1'b1)   Z_wire6_reg0 <= Z_wire6;
	// synopsys translate_off
	initial
		Z_wire7_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Z_wire7_reg0 <= 61'b0;
		else if  (clk_en == 1'b1)   Z_wire7_reg0 <= Z_wire7;
	// synopsys translate_off
	initial
		Z_wire8_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Z_wire8_reg0 <= 58'b0;
		else if  (clk_en == 1'b1)   Z_wire8_reg0 <= Z_wire8;
	lpm_mult   mult0
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(InvA0),
	.datab(y0_in),
	.result(wire_mult0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mult0.lpm_pipeline = 2,
		mult0.lpm_representation = "UNSIGNED",
		mult0.lpm_widtha = 6,
		mult0.lpm_widthb = 54,
		mult0.lpm_widthp = 60,
		mult0.lpm_type = "lpm_mult";
	lpm_mult   mult1
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(A_wire1),
	.datab(ZM_wire1),
	.result(wire_mult1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mult1.lpm_pipeline = 2,
		mult1.lpm_representation = "UNSIGNED",
		mult1.lpm_widtha = 4,
		mult1.lpm_widthb = 54,
		mult1.lpm_widthp = 58,
		mult1.lpm_type = "lpm_mult";
	lpm_mult   mult2
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(A_wire2),
	.datab(ZM_wire2),
	.result(wire_mult2_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mult2.lpm_pipeline = 2,
		mult2.lpm_representation = "UNSIGNED",
		mult2.lpm_widtha = 4,
		mult2.lpm_widthb = 60,
		mult2.lpm_widthp = 64,
		mult2.lpm_type = "lpm_mult";
	lpm_mult   mult3
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(A_wire3),
	.datab(ZM_wire3),
	.result(wire_mult3_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mult3.lpm_pipeline = 2,
		mult3.lpm_representation = "UNSIGNED",
		mult3.lpm_widtha = 4,
		mult3.lpm_widthb = 63,
		mult3.lpm_widthp = 67,
		mult3.lpm_type = "lpm_mult";
	lpm_mult   mult4
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(A_wire4),
	.datab(ZM_wire4),
	.result(wire_mult4_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mult4.lpm_pipeline = 2,
		mult4.lpm_representation = "UNSIGNED",
		mult4.lpm_widtha = 4,
		mult4.lpm_widthb = 57,
		mult4.lpm_widthp = 61,
		mult4.lpm_type = "lpm_mult";
	lpm_mult   mult5
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(A_wire5),
	.datab(ZM_wire5),
	.result(wire_mult5_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mult5.lpm_pipeline = 2,
		mult5.lpm_representation = "UNSIGNED",
		mult5.lpm_widtha = 4,
		mult5.lpm_widthb = 51,
		mult5.lpm_widthp = 55,
		mult5.lpm_type = "lpm_mult";
	lpm_mult   mult6
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(A_wire6),
	.datab(ZM_wire6),
	.result(wire_mult6_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mult6.lpm_pipeline = 2,
		mult6.lpm_representation = "UNSIGNED",
		mult6.lpm_widtha = 4,
		mult6.lpm_widthb = 45,
		mult6.lpm_widthp = 49,
		mult6.lpm_type = "lpm_mult";
	lpm_mult   mult7
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(A_wire7),
	.datab(ZM_wire7),
	.result(wire_mult7_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mult7.lpm_pipeline = 2,
		mult7.lpm_representation = "UNSIGNED",
		mult7.lpm_widtha = 4,
		mult7.lpm_widthb = 39,
		mult7.lpm_widthp = 43,
		mult7.lpm_type = "lpm_mult";
	lpm_mult   mult8
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(A_wire8),
	.datab(ZM_wire8),
	.result(wire_mult8_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mult8.lpm_pipeline = 2,
		mult8.lpm_representation = "UNSIGNED",
		mult8.lpm_widtha = 4,
		mult8.lpm_widthb = 33,
		mult8.lpm_widthp = 37,
		mult8.lpm_type = "lpm_mult";
	lpm_mux   InvTable0
	( 
	.data({6'b100001, {2{6'b100010}}, {2{6'b100011}}, {2{6'b100100}}, 6'b100101, {2{6'b100110}}, 6'b100111, 6'b101000, {2{6'b101001}}, 6'b101010, 6'b101011, 6'b010110, {2{6'b010111}}, {2{6'b011000}}, {2{6'b011001}}, 6'b011010, {2{6'b011011}}, 6'b011100, 6'b011101, 6'b011110, 6'b011111, {2{6'b100000}}}),
	.result(wire_InvTable0_result),
	.sel(a0_in)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		InvTable0.lpm_size = 32,
		InvTable0.lpm_width = 6,
		InvTable0.lpm_widths = 5,
		InvTable0.lpm_type = "lpm_mux";
	lpm_mux   LogTable0
	( 
	.data({83'b11111000000111110101100100111100011000011111001100111111111011001100000111000001000, {2{83'b11110000011110101110011110011111111101110100111010101100110011110100000110011011011}}, {2{83'b11101001000011110010110101110101000110101001010010110100011001000001101101100110011}}, {2{83'b11100001110110001111100010010001110101010000110100011010000101100001010101111000001}}, 83'b11011010110101010101101000001111110000000001010110111001011001111111010001000111001, {2{83'b11010100000000011001111100011110101100001101100001011000011011110001100000111100000}}, 83'b11001101010110110100101011000110000101110101001010010111000100110111110110011111001, 83'b11000110111000000001000001110000110010101100101110111100101001111011010001001111111, {2{83'b11000000100011011100111100100101010000111000001110101010111001010101010101110011010}}, 83'b10111010011000101000110101010001010100010110011111000111111100011000110011100000110, 83'b10110100010111000111010100010100011110111000101100111101100011110100110011011011101, 83'b01011111111010111110100011101111011000000101010001101111101101111001101111110110110, {2{83'b01010100100010101011100000011100111000101000111101011111001110000100000010110010011}}, {2{83'b01001001101001011000100001000100110100110110111001001001111000001110111110101101110}}, {2{83'b00111111001100100011100011011001011001110110011011110010111110110011001010000011001}}, 83'b00110101001001111101101001111001000101011011001111000110110111100101011111010100111, {2{83'b00101011011111101000000011010110101010000111101101100011111101110000010100100101110}}, 83'b00100010001011110001110100000100010011111100100011110111101111000110011100010110100, 83'b00011001001100110101111001011101010110010100100110001000101011100001110101011110101, 83'b00010000100001011001100010110101100111100011101000000110100010001010001111111101100, 83'b00001000001000001010111011000100111100111010001000100010001110000000101110011110001, {2{{83{1'b0}}}}}),
	.result(wire_LogTable0_result),
	.sel(A_wire0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		LogTable0.lpm_size = 32,
		LogTable0.lpm_width = 83,
		LogTable0.lpm_widths = 5,
		LogTable0.lpm_type = "lpm_mux";
	lpm_mux   LogTable1
	( 
	.data({79'b1110011001011011100111100110111011101101100101100101110000110110111000001001111, 79'b1101010101110111100101101000011111011000100001111110000011010001101010011101110, 79'b1100010010100101010100001010010011111101100110100001100110101000101111101001011, 79'b1011001111100100101001111001011010100101110110101100001000001000001001111100110, 79'b1010001100110101011101101010000101101111000111110100110001100100010100100001000, 79'b1001001010010111100110010111110001101000110000011111010011010111000000010000110, 79'b1000001000001010111011000100111100111010001000100010001110000000101110011110001, 79'b0111000110001111010010111011000001010010101010111100011000110001111111001111010, 79'b0110100101010111110101010010001100010111000100001111110001111011000001101001011, 79'b0101100011110101100001011110000110100100001011110101011111100111000100101011001, 79'b0100100010100011111011000111111110101000101110001001111100011001010000100100110, 79'b0011100001100010111001110000100110001110101111100000110011000000001100010000010, 79'b0010100000110010010100111111001011010000011001011101111100011101010101110100000, 79'b0001100000010010000100100001010001011000011010110101010000001110000010100101110, 79'b0000100000000010000000001010101011101010110001000100111011110011100000110011100, {79{1'b0}}}),
	.result(wire_LogTable1_result),
	.sel(A_pipe11)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		LogTable1.lpm_size = 16,
		LogTable1.lpm_width = 79,
		LogTable1.lpm_widths = 4,
		LogTable1.lpm_type = "lpm_mux";
	lpm_mux   LogTable2
	( 
	.data({76'b1110100011010011001111110110100010100111001100001111110101111111001001110100, 76'b1101100010110111000011100000110011011110011000000001100101010100010111011111, 76'b1100100010011100111000111000001001010110011011011110010110000111001001101001, 76'b1011100010000100101111110100011010010111010101011001111111111010110110101110, 76'b1010100001101110101000001101011101011010010000110010101110000000011000110100, 76'b1001100001011010100001111011001010001001011110100101100010011110100100010001, 76'b1000100001001000011100110101011001000000001111100011110111011110011100000010, 76'b0111100000111000011000110100000011001010101110001001111110001111111000010011, 76'b0110100000101010010101101111000010100101111000010110011011111010110110000100, 76'b0101100000011110010011011110010001111111011001100010100011110001101001010111, 76'b0100100000010100010001111001101100110101100100011011101110111000101110000001, 76'b0011100000001100010000111001001111010111001100111101110000111000010101010011, 76'b0010100000000110010000010100110110100011100010001110001001101100110001111100, 76'b0001100000000010010000000100100000001010001000011000010100001001100101101001, 76'b0000100000000000010000000000001010101010110010101010110001000100010110011001, {76{1'b0}}}),
	.result(wire_LogTable2_result),
	.sel(A_pipe12)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		LogTable2.lpm_size = 16,
		LogTable2.lpm_width = 76,
		LogTable2.lpm_widths = 4,
		LogTable2.lpm_type = "lpm_mux";
	lpm_mux   LogTable3
	( 
	.data({73'b1110100000011010010010111111100011100010001000011011011101101010000110000, 73'b1101100000010110110010110011010010100001110101001111100011100100101010000, 73'b1100100000010011100010101000101101101010000101111010001111001010011101000, 73'b1011100000010000100010011111101100111001101100010011100100000000010101011, 73'b1010100000001101110010011000001000001111100000010100110000110100010101011, 73'b1001100000001011010010010001110111101010011111111000001001011100010001010, 73'b1000100000001001000010001100110011001001101110111001000000110100011100100, 73'b0111100000000111000010001000110010101100010111010011100010111110011110101, 73'b0110100000000101010010000101101110010001101001000100101111000000001111101, 73'b0101100000000011110010000011011101111000111010001010010001000010111100001, 73'b0100100000000010100010000001111001100001100110100010011100010010010000000, 73'b0011100000000001100010000000111001001011010000001100000100111011101010100, 73'b0010100000000000110010000000010100110101011111000110011010001101110111111, 73'b0001100000000000010010000000000100100000000001010001000000011000010011010, 73'b0000100000000000000010000000000000001010101010101011101010101010110001000, {73{1'b0}}}),
	.result(wire_LogTable3_result),
	.sel(A_pipe13)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		LogTable3.lpm_size = 16,
		LogTable3.lpm_width = 73,
		LogTable3.lpm_widths = 4,
		LogTable3.lpm_type = "lpm_mux";
	lpm_mux   LogTable4
	( 
	.data({70'b1110100000000011010010010000111111100001001010111010110111010010001000, 70'b1101100000000010110110010000110011010000110000001110000011100110010110, 70'b1100100000000010011100010000101000101100010110100101101010100001000110, 70'b1011100000000010000100010000011111101011111101110111111011111010011110, 70'b1010100000000001101110010000011000000111100101111011110111101011101101, 70'b1001100000000001011010010000010001110111001110101001001101101111000111, 70'b1000100000000001001000010000001100110010110111111000011101111111111111, 70'b0111100000000000111000010000001000110010100001100010111000011010100010, 70'b0110100000000000101010010000000101101110001011100010011100111011101110, 70'b0101100000000000011110010000000011011101110101110001111011100001010000, 70'b0100100000000000010100010000000001111001100000001100110100001001011100, 70'b0011100000000000001100010000000000111001001010101111010110110011000100, 70'b0010100000000000000110010000000000010100110101010110100011011101011010, 70'b0001100000000000000010010000000000000100100000000000001010001000000000, 70'b0000100000000000000000010000000000000000001010101010101010110010101010, {70{1'b0}}}),
	.result(wire_LogTable4_result),
	.sel(A_pipe14)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		LogTable4.lpm_size = 16,
		LogTable4.lpm_width = 70,
		LogTable4.lpm_widths = 4,
		LogTable4.lpm_type = "lpm_mux";
	lpm_mux   LogTable5
	( 
	.data({67'b1110100000000000011010010010000000111111100000111000000010000000101, 67'b1101100000000000010110110010000000110011010000100010000001101111110, 67'b1100100000000000010011100010000000101000101100001100001010000010001, 67'b1011100000000000010000100010000000011111101011110110011001101001111, 67'b1010100000000000001101110010000000011000000111100000101111011110110, 67'b1001100000000000001011010010000000010001110111001011001010011110111, 67'b1000100000000000001001000010000000001100110010110101101001101110010, 67'b0111100000000000000111000010000000001000110010100000001100010111000, 67'b0110100000000000000101010010000000000101101110001010110001101000111, 67'b0101100000000000000011110010000000000011011101110101011000111010000, 67'b0100100000000000000010100010000000000001111001100000000001100110100, 67'b0011100000000000000001100010000000000000111001001010101011010000001, 67'b0010100000000000000000110010000000000000010100110101010101011111000, 67'b0001100000000000000000010010000000000000000100100000000000000001010, 67'b0000100000000000000000000010000000000000000000001010101010101010101, {67{1'b0}}}),
	.result(wire_LogTable5_result),
	.sel(A_pipe15)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		LogTable5.lpm_size = 16,
		LogTable5.lpm_width = 67,
		LogTable5.lpm_widths = 4,
		LogTable5.lpm_type = "lpm_mux";
	lpm_mux   LogTable6
	( 
	.data({64'b1110100000000000000011010010010000000000111111100000110101101010, 64'b1101100000000000000010110110010000000000110011010000100000010000, 64'b1100100000000000000010011100010000000000101000101100001010110110, 64'b1011100000000000000010000100010000000000011111101011110101011101, 64'b1010100000000000000001101110010000000000011000000111100000000101, 64'b1001100000000000000001011010010000000000010001110111001010101110, 64'b1000100000000000000001001000010000000000001100110010110101010111, 64'b0111100000000000000000111000010000000000001000110010100000000001, 64'b0110100000000000000000101010010000000000000101101110001010101011, 64'b0101100000000000000000011110010000000000000011011101110101010101, 64'b0100100000000000000000010100010000000000000001111001100000000000, 64'b0011100000000000000000001100010000000000000000111001001010101010, 64'b0010100000000000000000000110010000000000000000010100110101010101, 64'b0001100000000000000000000010010000000000000000000100100000000000, 64'b0000100000000000000000000000010000000000000000000000001010101010, {64{1'b0}}}),
	.result(wire_LogTable6_result),
	.sel(A_pipe16)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		LogTable6.lpm_size = 16,
		LogTable6.lpm_width = 64,
		LogTable6.lpm_widths = 4,
		LogTable6.lpm_type = "lpm_mux";
	lpm_mux   LogTable7
	( 
	.data({61'b1110100000000000000000011010010010000000000000111111100000110, 61'b1101100000000000000000010110110010000000000000110011010000100, 61'b1100100000000000000000010011100010000000000000101000101100001, 61'b1011100000000000000000010000100010000000000000011111101011110, 61'b1010100000000000000000001101110010000000000000011000000111100, 61'b1001100000000000000000001011010010000000000000010001110111001, 61'b1000100000000000000000001001000010000000000000001100110010110, 61'b0111100000000000000000000111000010000000000000001000110010100, 61'b0110100000000000000000000101010010000000000000000101101110001, 61'b0101100000000000000000000011110010000000000000000011011101110, 61'b0100100000000000000000000010100010000000000000000001111001100, 61'b0011100000000000000000000001100010000000000000000000111001001, 61'b0010100000000000000000000000110010000000000000000000010100110, 61'b0001100000000000000000000000010010000000000000000000000100100, 61'b0000100000000000000000000000000010000000000000000000000000001, {61{1'b0}}}),
	.result(wire_LogTable7_result),
	.sel(A_pipe17)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		LogTable7.lpm_size = 16,
		LogTable7.lpm_width = 61,
		LogTable7.lpm_widths = 4,
		LogTable7.lpm_type = "lpm_mux";
	lpm_mux   LogTable8
	( 
	.data({58'b1110100000000000000000000011010010010000000000000000111111, 58'b1101100000000000000000000010110110010000000000000000110011, 58'b1100100000000000000000000010011100010000000000000000101000, 58'b1011100000000000000000000010000100010000000000000000011111, 58'b1010100000000000000000000001101110010000000000000000011000, 58'b1001100000000000000000000001011010010000000000000000010001, 58'b1000100000000000000000000001001000010000000000000000001100, 58'b0111100000000000000000000000111000010000000000000000001000, 58'b0110100000000000000000000000101010010000000000000000000101, 58'b0101100000000000000000000000011110010000000000000000000011, 58'b0100100000000000000000000000010100010000000000000000000001, 58'b0011100000000000000000000000001100010000000000000000000000, 58'b0010100000000000000000000000000110010000000000000000000000, 58'b0001100000000000000000000000000010010000000000000000000000, 58'b0000100000000000000000000000000000010000000000000000000000, {58{1'b0}}}),
	.result(wire_LogTable8_result),
	.sel(A_pipe18)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		LogTable8.lpm_size = 16,
		LogTable8.lpm_width = 58,
		LogTable8.lpm_widths = 4,
		LogTable8.lpm_type = "lpm_mux";
	assign
		A1_is_all_zero = {(A_pipe11[3] | A1_is_all_zero[2]), (A_pipe11[2] | A1_is_all_zero[1]), (A_pipe11[1] | A1_is_all_zero[0]), A_pipe11[0]},
		A1_is_not_zero = {((~ A_pipe11[3]) & A1_is_not_zero[2]), (A_pipe11[2] | A1_is_not_zero[1]), (A_pipe11[1] | A1_is_not_zero[0]), A_pipe11[0]},
		A_all_zero2 = {((~ A_pipe12[3]) & A_all_zero2[2]), ((~ A_pipe12[2]) & A_all_zero2[1]), ((~ A_pipe12[1]) & A_all_zero2[0]), (~ A_pipe12[0])},
		A_all_zero3 = {((~ A_pipe13[3]) & A_all_zero3[2]), ((~ A_pipe13[2]) & A_all_zero3[1]), ((~ A_pipe13[1]) & A_all_zero3[0]), (~ A_pipe13[0])},
		A_all_zero4 = {((~ A_pipe14[3]) & A_all_zero4[2]), ((~ A_pipe14[2]) & A_all_zero4[1]), ((~ A_pipe14[1]) & A_all_zero4[0]), (~ A_pipe14[0])},
		A_all_zero5 = {((~ A_pipe15[3]) & A_all_zero5[2]), ((~ A_pipe15[2]) & A_all_zero5[1]), ((~ A_pipe15[1]) & A_all_zero5[0]), (~ A_pipe15[0])},
		A_all_zero6 = {((~ A_pipe16[3]) & A_all_zero6[2]), ((~ A_pipe16[2]) & A_all_zero6[1]), ((~ A_pipe16[1]) & A_all_zero6[0]), (~ A_pipe16[0])},
		A_all_zero7 = {((~ A_pipe17[3]) & A_all_zero7[2]), ((~ A_pipe17[2]) & A_all_zero7[1]), ((~ A_pipe17[1]) & A_all_zero7[0]), (~ A_pipe17[0])},
		A_all_zero8 = {((~ A_pipe18[3]) & A_all_zero8[2]), ((~ A_pipe18[2]) & A_all_zero8[1]), ((~ A_pipe18[1]) & A_all_zero8[0]), (~ A_pipe18[0])},
		A_pipe0 = a0_in,
		A_pipe11 = A_wire1_reg0,
		A_pipe12 = A_wire2_reg0,
		A_pipe13 = A_wire3_reg0,
		A_pipe14 = A_wire4_reg0,
		A_pipe15 = A_wire5_reg0,
		A_pipe16 = A_wire6_reg0,
		A_pipe17 = A_wire7_reg0,
		A_pipe18 = A_wire8_reg0,
		A_wire0 = A_pipe0_reg1,
		A_wire1 = Z_wire1[53:50],
		A_wire2 = Z_wire2[59:56],
		A_wire3 = Z_wire3[68:65],
		A_wire4 = Z_wire4[69:66],
		A_wire5 = Z_wire5[66:63],
		A_wire6 = Z_wire6[63:60],
		A_wire7 = Z_wire7[60:57],
		A_wire8 = Z_wire8[57:54],
		almostlog = S_wire9,
		B_pad_wire1 = {1'b0, B_pipe1, {9{1'b0}}},
		B_pad_wire2 = {1'b0, B_pipe2, {12{1'b0}}},
		B_pad_wire3 = {1'b0, B_pipe3, {4{1'b0}}},
		B_pad_wire4 = {1'b0, B_pipe4},
		B_pad_wire5 = {1'b0, B_pipe5},
		B_pad_wire6 = {1'b0, B_pipe6},
		B_pad_wire7 = {1'b0, B_pipe7},
		B_pad_wire8 = {1'b0, B_pipe8},
		B_pipe1 = B_wire1_reg0,
		B_pipe2 = B_wire2_reg0,
		B_pipe3 = B_wire3_reg0,
		B_pipe4 = B_wire4_reg0,
		B_pipe5 = B_wire5_reg0,
		B_pipe6 = B_wire6_reg0,
		B_pipe7 = B_wire7_reg0,
		B_pipe8 = B_wire8_reg0,
		B_wire1 = Z_wire1[49:0],
		B_wire2 = Z_wire2[55:0],
		B_wire3 = Z_wire3[64:0],
		B_wire4 = Z_wire4[65:0],
		B_wire5 = Z_wire5[62:0],
		B_wire6 = Z_wire6[59:0],
		B_wire7 = Z_wire7[56:0],
		B_wire8 = Z_wire8[53:0],
		epsZ_pad_wire1 = epsZ_wire1[59:0],
		epsZ_pad_wire2 = epsZ_wire2[68:0],
		epsZ_pad_wire3 = epsZ_wire3[80:11],
		epsZ_pad_wire4 = epsZ_wire4[84:18],
		epsZ_pad_wire5 = epsZ_wire5[84:21],
		epsZ_pad_wire6 = epsZ_wire6[84:24],
		epsZ_pad_wire7 = epsZ_wire7[84:27],
		epsZ_pad_wire8 = epsZ_wire8[84:30],
		epsZ_wire1 = ({60{A1_is_all_zero[3]}} & (({60{(~ A1_is_not_zero[3])}} & mux0_data0) | ({60{A1_is_not_zero[3]}} & mux0_data1))),
		epsZ_wire2 = {1'b0, (~ A_all_zero2[3]), {7{1'b0}}, ({60{(~ A_all_zero2[3])}} & Z_pipe2)},
		epsZ_wire3 = {1'b0, (~ A_all_zero3[3]), {10{1'b0}}, ({69{(~ A_all_zero3[3])}} & Z_pipe3)},
		epsZ_wire4 = {1'b0, (~ A_all_zero4[3]), {13{1'b0}}, ({70{(~ A_all_zero4[3])}} & Z_pipe4)},
		epsZ_wire5 = {1'b0, (~ A_all_zero5[3]), {16{1'b0}}, ({67{(~ A_all_zero5[3])}} & Z_pipe5)},
		epsZ_wire6 = {1'b0, (~ A_all_zero6[3]), {19{1'b0}}, ({64{(~ A_all_zero6[3])}} & Z_pipe6)},
		epsZ_wire7 = {1'b0, (~ A_all_zero7[3]), {22{1'b0}}, ({61{(~ A_all_zero7[3])}} & Z_pipe7)},
		epsZ_wire8 = {1'b0, (~ A_all_zero8[3]), {25{1'b0}}, ({58{(~ A_all_zero8[3])}} & Z_pipe8)},
		InvA0 = wire_InvTable0_result,
		L_wire0 = wire_LogTable0_result,
		L_wire1 = wire_LogTable1_result,
		L_wire2 = wire_LogTable2_result,
		L_wire3 = wire_LogTable3_result,
		L_wire4 = wire_LogTable4_result,
		L_wire5 = wire_LogTable5_result,
		L_wire6 = wire_LogTable6_result,
		L_wire7 = wire_LogTable7_result,
		L_wire8 = wire_LogTable8_result,
		mux0_data0 = {1'b1, {4{1'b0}}, Z_pipe1, 1'b0},
		mux0_data1 = {1'b0, 1'b1, {4{1'b0}}, Z_pipe1},
		P_pad_wire1 = {1'b0, P_wire1, 1'b0},
		P_pad_wire2 = {{4{1'b0}}, P_wire2, 1'b0},
		P_pad_wire3 = {{7{1'b0}}, P_wire3[66:4]},
		P_pad_wire4 = {{10{1'b0}}, P_wire4[60:4]},
		P_pad_wire5 = {{13{1'b0}}, P_wire5[54:4]},
		P_pad_wire6 = {{16{1'b0}}, P_wire6[48:4]},
		P_pad_wire7 = {{19{1'b0}}, P_wire7[42:4]},
		P_pad_wire8 = {{22{1'b0}}, P_wire8[36:4]},
		P_wire0 = wire_mult0_result,
		P_wire1 = wire_mult1_result,
		P_wire2 = wire_mult2_result,
		P_wire3 = wire_mult3_result,
		P_wire4 = wire_mult4_result,
		P_wire5 = wire_mult5_result,
		P_wire6 = wire_mult6_result,
		P_wire7 = wire_mult7_result,
		P_wire8 = wire_mult8_result,
		S_pipe11 = S_wire1_reg0,
		S_pipe12 = S_wire2_reg0,
		S_pipe13 = S_wire3_reg0,
		S_pipe14 = S_wire4_reg0,
		S_pipe15 = S_wire5_reg0,
		S_pipe16 = S_wire6_reg0,
		S_pipe17 = S_wire7_reg0,
		S_pipe18 = S_wire8_reg0,
		S_pipe22 = wire_add0_1_result,
		S_pipe23 = wire_add0_2_result,
		S_pipe24 = wire_add0_3_result,
		S_pipe25 = wire_add0_4_result,
		S_pipe26 = wire_add0_5_result,
		S_pipe27 = wire_add0_6_result,
		S_pipe28 = wire_add0_7_result,
		S_pipe29 = wire_add0_8_result,
		S_wire1 = L_wire0,
		S_wire2 = S_pipe22_reg0,
		S_wire3 = S_pipe23_reg0,
		S_wire4 = S_pipe24_reg0,
		S_wire5 = S_pipe25_reg0,
		S_wire6 = S_pipe26_reg0,
		S_wire7 = S_pipe27_reg0,
		S_wire8 = S_pipe28_reg0,
		S_wire9 = S_pipe29_reg0,
		z = Z_wire9,
		Z_pipe1 = Z_wire1_reg0,
		Z_pipe2 = Z_wire2_reg0,
		Z_pipe3 = Z_wire3_reg0,
		Z_pipe4 = Z_wire4_reg0,
		Z_pipe5 = Z_wire5_reg0,
		Z_pipe6 = Z_wire6_reg0,
		Z_pipe7 = Z_wire7_reg0,
		Z_pipe8 = Z_wire8_reg0,
		Z_wire1 = P_wire0[53:0],
		Z_wire2 = wire_sub1_1_result,
		Z_wire3 = wire_sub1_2_result,
		Z_wire4 = wire_sub1_3_result,
		Z_wire5 = wire_sub1_4_result,
		Z_wire6 = wire_sub1_5_result,
		Z_wire7 = wire_sub1_6_result,
		Z_wire8 = wire_sub1_7_result,
		Z_wire9 = wire_sub1_8_result,
		ZM_wire1 = Z_wire1,
		ZM_wire2 = Z_wire2,
		ZM_wire3 = Z_wire3[68:6],
		ZM_wire4 = Z_wire4[69:13],
		ZM_wire5 = Z_wire5[66:16],
		ZM_wire6 = Z_wire6[63:19],
		ZM_wire7 = Z_wire7[60:22],
		ZM_wire8 = Z_wire8[57:25];
endmodule //acl_fp_log_s5_double_range_reduction_3sd


//altpriority_encoder CBX_AUTO_BLACKBOX="ALL" LSB_PRIORITY="NO" PIPELINE=1 WIDTH=128 WIDTHAD=7 aclr clk_en clock data q
//VERSION_BEGIN 12.0 cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ALL" LSB_PRIORITY="NO" PIPELINE=0 WIDTH=64 WIDTHAD=6 data q
//VERSION_BEGIN 12.0 cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ALL" LSB_PRIORITY="NO" WIDTH=32 WIDTHAD=5 data q
//VERSION_BEGIN 12.0 cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ALL" LSB_PRIORITY="NO" WIDTH=16 WIDTHAD=4 data q zero
//VERSION_BEGIN 12.0 cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ALL" LSB_PRIORITY="NO" WIDTH=8 WIDTHAD=3 data q zero
//VERSION_BEGIN 12.0 cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ALL" LSB_PRIORITY="NO" WIDTH=4 WIDTHAD=2 data q zero
//VERSION_BEGIN 12.0 cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ALL" LSB_PRIORITY="NO" WIDTH=2 WIDTHAD=1 data q zero
//VERSION_BEGIN 12.0 cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altpriority_encoder_3e8
	( 
	data,
	q,
	zero) ;
	input   [1:0]  data;
	output   [0:0]  q;
	output   zero;


	assign
		q = {data[1]},
		zero = (~ (data[0] | data[1]));
endmodule //acl_fp_log_s5_double_altpriority_encoder_3e8

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altpriority_encoder_6e8
	( 
	data,
	q,
	zero) ;
	input   [3:0]  data;
	output   [1:0]  q;
	output   zero;

	wire  [0:0]   wire_altpriority_encoder15_q;
	wire  wire_altpriority_encoder15_zero;
	wire  [0:0]   wire_altpriority_encoder16_q;
	wire  wire_altpriority_encoder16_zero;

	acl_fp_log_s5_double_altpriority_encoder_3e8   altpriority_encoder15
	( 
	.data(data[1:0]),
	.q(wire_altpriority_encoder15_q),
	.zero(wire_altpriority_encoder15_zero));
	acl_fp_log_s5_double_altpriority_encoder_3e8   altpriority_encoder16
	( 
	.data(data[3:2]),
	.q(wire_altpriority_encoder16_q),
	.zero(wire_altpriority_encoder16_zero));
	assign
		q = {(~ wire_altpriority_encoder16_zero), ((wire_altpriority_encoder16_zero & wire_altpriority_encoder15_q) | ((~ wire_altpriority_encoder16_zero) & wire_altpriority_encoder16_q))},
		zero = (wire_altpriority_encoder15_zero & wire_altpriority_encoder16_zero);
endmodule //acl_fp_log_s5_double_altpriority_encoder_6e8

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altpriority_encoder_be8
	( 
	data,
	q,
	zero) ;
	input   [7:0]  data;
	output   [2:0]  q;
	output   zero;

	wire  [1:0]   wire_altpriority_encoder13_q;
	wire  wire_altpriority_encoder13_zero;
	wire  [1:0]   wire_altpriority_encoder14_q;
	wire  wire_altpriority_encoder14_zero;

	acl_fp_log_s5_double_altpriority_encoder_6e8   altpriority_encoder13
	( 
	.data(data[3:0]),
	.q(wire_altpriority_encoder13_q),
	.zero(wire_altpriority_encoder13_zero));
	acl_fp_log_s5_double_altpriority_encoder_6e8   altpriority_encoder14
	( 
	.data(data[7:4]),
	.q(wire_altpriority_encoder14_q),
	.zero(wire_altpriority_encoder14_zero));
	assign
		q = {(~ wire_altpriority_encoder14_zero), (({2{wire_altpriority_encoder14_zero}} & wire_altpriority_encoder13_q) | ({2{(~ wire_altpriority_encoder14_zero)}} & wire_altpriority_encoder14_q))},
		zero = (wire_altpriority_encoder13_zero & wire_altpriority_encoder14_zero);
endmodule //acl_fp_log_s5_double_altpriority_encoder_be8

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altpriority_encoder_rf8
	( 
	data,
	q,
	zero) ;
	input   [15:0]  data;
	output   [3:0]  q;
	output   zero;

	wire  [2:0]   wire_altpriority_encoder11_q;
	wire  wire_altpriority_encoder11_zero;
	wire  [2:0]   wire_altpriority_encoder12_q;
	wire  wire_altpriority_encoder12_zero;

	acl_fp_log_s5_double_altpriority_encoder_be8   altpriority_encoder11
	( 
	.data(data[7:0]),
	.q(wire_altpriority_encoder11_q),
	.zero(wire_altpriority_encoder11_zero));
	acl_fp_log_s5_double_altpriority_encoder_be8   altpriority_encoder12
	( 
	.data(data[15:8]),
	.q(wire_altpriority_encoder12_q),
	.zero(wire_altpriority_encoder12_zero));
	assign
		q = {(~ wire_altpriority_encoder12_zero), (({3{wire_altpriority_encoder12_zero}} & wire_altpriority_encoder11_q) | ({3{(~ wire_altpriority_encoder12_zero)}} & wire_altpriority_encoder12_q))},
		zero = (wire_altpriority_encoder11_zero & wire_altpriority_encoder12_zero);
endmodule //acl_fp_log_s5_double_altpriority_encoder_rf8


//altpriority_encoder CBX_AUTO_BLACKBOX="ALL" LSB_PRIORITY="NO" WIDTH=16 WIDTHAD=4 data q
//VERSION_BEGIN 12.0 cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ALL" LSB_PRIORITY="NO" WIDTH=8 WIDTHAD=3 data q
//VERSION_BEGIN 12.0 cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ALL" LSB_PRIORITY="NO" WIDTH=4 WIDTHAD=2 data q
//VERSION_BEGIN 12.0 cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ALL" LSB_PRIORITY="NO" WIDTH=2 WIDTHAD=1 data q
//VERSION_BEGIN 12.0 cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altpriority_encoder_3v7
	( 
	data,
	q) ;
	input   [1:0]  data;
	output   [0:0]  q;


	assign
		q = {data[1]};
endmodule //acl_fp_log_s5_double_altpriority_encoder_3v7

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altpriority_encoder_6v7
	( 
	data,
	q) ;
	input   [3:0]  data;
	output   [1:0]  q;

	wire  [0:0]   wire_altpriority_encoder21_q;
	wire  [0:0]   wire_altpriority_encoder22_q;
	wire  wire_altpriority_encoder22_zero;

	acl_fp_log_s5_double_altpriority_encoder_3v7   altpriority_encoder21
	( 
	.data(data[1:0]),
	.q(wire_altpriority_encoder21_q));
	acl_fp_log_s5_double_altpriority_encoder_3e8   altpriority_encoder22
	( 
	.data(data[3:2]),
	.q(wire_altpriority_encoder22_q),
	.zero(wire_altpriority_encoder22_zero));
	assign
		q = {(~ wire_altpriority_encoder22_zero), ((wire_altpriority_encoder22_zero & wire_altpriority_encoder21_q) | ((~ wire_altpriority_encoder22_zero) & wire_altpriority_encoder22_q))};
endmodule //acl_fp_log_s5_double_altpriority_encoder_6v7

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altpriority_encoder_bv7
	( 
	data,
	q) ;
	input   [7:0]  data;
	output   [2:0]  q;

	wire  [1:0]   wire_altpriority_encoder19_q;
	wire  [1:0]   wire_altpriority_encoder20_q;
	wire  wire_altpriority_encoder20_zero;

	acl_fp_log_s5_double_altpriority_encoder_6v7   altpriority_encoder19
	( 
	.data(data[3:0]),
	.q(wire_altpriority_encoder19_q));
	acl_fp_log_s5_double_altpriority_encoder_6e8   altpriority_encoder20
	( 
	.data(data[7:4]),
	.q(wire_altpriority_encoder20_q),
	.zero(wire_altpriority_encoder20_zero));
	assign
		q = {(~ wire_altpriority_encoder20_zero), (({2{wire_altpriority_encoder20_zero}} & wire_altpriority_encoder19_q) | ({2{(~ wire_altpriority_encoder20_zero)}} & wire_altpriority_encoder20_q))};
endmodule //acl_fp_log_s5_double_altpriority_encoder_bv7

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altpriority_encoder_r08
	( 
	data,
	q) ;
	input   [15:0]  data;
	output   [3:0]  q;

	wire  [2:0]   wire_altpriority_encoder17_q;
	wire  [2:0]   wire_altpriority_encoder18_q;
	wire  wire_altpriority_encoder18_zero;

	acl_fp_log_s5_double_altpriority_encoder_bv7   altpriority_encoder17
	( 
	.data(data[7:0]),
	.q(wire_altpriority_encoder17_q));
	acl_fp_log_s5_double_altpriority_encoder_be8   altpriority_encoder18
	( 
	.data(data[15:8]),
	.q(wire_altpriority_encoder18_q),
	.zero(wire_altpriority_encoder18_zero));
	assign
		q = {(~ wire_altpriority_encoder18_zero), (({3{wire_altpriority_encoder18_zero}} & wire_altpriority_encoder17_q) | ({3{(~ wire_altpriority_encoder18_zero)}} & wire_altpriority_encoder18_q))};
endmodule //acl_fp_log_s5_double_altpriority_encoder_r08

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altpriority_encoder_q08
	( 
	data,
	q) ;
	input   [31:0]  data;
	output   [4:0]  q;

	wire  [3:0]   wire_altpriority_encoder10_q;
	wire  wire_altpriority_encoder10_zero;
	wire  [3:0]   wire_altpriority_encoder9_q;

	acl_fp_log_s5_double_altpriority_encoder_rf8   altpriority_encoder10
	( 
	.data(data[31:16]),
	.q(wire_altpriority_encoder10_q),
	.zero(wire_altpriority_encoder10_zero));
	acl_fp_log_s5_double_altpriority_encoder_r08   altpriority_encoder9
	( 
	.data(data[15:0]),
	.q(wire_altpriority_encoder9_q));
	assign
		q = {(~ wire_altpriority_encoder10_zero), (({4{wire_altpriority_encoder10_zero}} & wire_altpriority_encoder9_q) | ({4{(~ wire_altpriority_encoder10_zero)}} & wire_altpriority_encoder10_q))};
endmodule //acl_fp_log_s5_double_altpriority_encoder_q08


//altpriority_encoder CBX_AUTO_BLACKBOX="ALL" LSB_PRIORITY="NO" WIDTH=32 WIDTHAD=5 data q zero
//VERSION_BEGIN 12.0 cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altpriority_encoder_qf8
	( 
	data,
	q,
	zero) ;
	input   [31:0]  data;
	output   [4:0]  q;
	output   zero;

	wire  [3:0]   wire_altpriority_encoder23_q;
	wire  wire_altpriority_encoder23_zero;
	wire  [3:0]   wire_altpriority_encoder24_q;
	wire  wire_altpriority_encoder24_zero;

	acl_fp_log_s5_double_altpriority_encoder_rf8   altpriority_encoder23
	( 
	.data(data[15:0]),
	.q(wire_altpriority_encoder23_q),
	.zero(wire_altpriority_encoder23_zero));
	acl_fp_log_s5_double_altpriority_encoder_rf8   altpriority_encoder24
	( 
	.data(data[31:16]),
	.q(wire_altpriority_encoder24_q),
	.zero(wire_altpriority_encoder24_zero));
	assign
		q = {(~ wire_altpriority_encoder24_zero), (({4{wire_altpriority_encoder24_zero}} & wire_altpriority_encoder23_q) | ({4{(~ wire_altpriority_encoder24_zero)}} & wire_altpriority_encoder24_q))},
		zero = (wire_altpriority_encoder23_zero & wire_altpriority_encoder24_zero);
endmodule //acl_fp_log_s5_double_altpriority_encoder_qf8

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altpriority_encoder_309
	( 
	data,
	q) ;
	input   [63:0]  data;
	output   [5:0]  q;

	wire  [4:0]   wire_altpriority_encoder7_q;
	wire  [4:0]   wire_altpriority_encoder8_q;
	wire  wire_altpriority_encoder8_zero;

	acl_fp_log_s5_double_altpriority_encoder_q08   altpriority_encoder7
	( 
	.data(data[31:0]),
	.q(wire_altpriority_encoder7_q));
	acl_fp_log_s5_double_altpriority_encoder_qf8   altpriority_encoder8
	( 
	.data(data[63:32]),
	.q(wire_altpriority_encoder8_q),
	.zero(wire_altpriority_encoder8_zero));
	assign
		q = {(~ wire_altpriority_encoder8_zero), (({5{wire_altpriority_encoder8_zero}} & wire_altpriority_encoder7_q) | ({5{(~ wire_altpriority_encoder8_zero)}} & wire_altpriority_encoder8_q))};
endmodule //acl_fp_log_s5_double_altpriority_encoder_309


//altpriority_encoder CBX_AUTO_BLACKBOX="ALL" LSB_PRIORITY="NO" PIPELINE=0 WIDTH=64 WIDTHAD=6 data q zero
//VERSION_BEGIN 12.0 cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altpriority_encoder_3f9
	( 
	data,
	q,
	zero) ;
	input   [63:0]  data;
	output   [5:0]  q;
	output   zero;

	wire  [4:0]   wire_altpriority_encoder25_q;
	wire  wire_altpriority_encoder25_zero;
	wire  [4:0]   wire_altpriority_encoder26_q;
	wire  wire_altpriority_encoder26_zero;

	acl_fp_log_s5_double_altpriority_encoder_qf8   altpriority_encoder25
	( 
	.data(data[31:0]),
	.q(wire_altpriority_encoder25_q),
	.zero(wire_altpriority_encoder25_zero));
	acl_fp_log_s5_double_altpriority_encoder_qf8   altpriority_encoder26
	( 
	.data(data[63:32]),
	.q(wire_altpriority_encoder26_q),
	.zero(wire_altpriority_encoder26_zero));
	assign
		q = {(~ wire_altpriority_encoder26_zero), (({5{wire_altpriority_encoder26_zero}} & wire_altpriority_encoder25_q) | ({5{(~ wire_altpriority_encoder26_zero)}} & wire_altpriority_encoder26_q))},
		zero = (wire_altpriority_encoder25_zero & wire_altpriority_encoder26_zero);
endmodule //acl_fp_log_s5_double_altpriority_encoder_3f9

//synthesis_resources = reg 7 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altpriority_encoder_gla
	( 
	aclr,
	clk_en,
	clock,
	data,
	q) ;
	input   aclr;
	input   clk_en;
	input   clock;
	input   [127:0]  data;
	output   [6:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clk_en;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [5:0]   wire_altpriority_encoder5_q;
	wire  [5:0]   wire_altpriority_encoder6_q;
	wire  wire_altpriority_encoder6_zero;
	reg	[6:0]	pipeline_q_dffe;
	wire  [6:0]  tmp_q_wire;

	acl_fp_log_s5_double_altpriority_encoder_309   altpriority_encoder5
	( 
	.data(data[63:0]),
	.q(wire_altpriority_encoder5_q));
	acl_fp_log_s5_double_altpriority_encoder_3f9   altpriority_encoder6
	( 
	.data(data[127:64]),
	.q(wire_altpriority_encoder6_q),
	.zero(wire_altpriority_encoder6_zero));
	// synopsys translate_off
	initial
		pipeline_q_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) pipeline_q_dffe <= 7'b0;
		else if  (clk_en == 1'b1)   pipeline_q_dffe <= tmp_q_wire;
	assign
		q = pipeline_q_dffe,
		tmp_q_wire = {(~ wire_altpriority_encoder6_zero), (({6{wire_altpriority_encoder6_zero}} & wire_altpriority_encoder5_q) | ({6{(~ wire_altpriority_encoder6_zero)}} & wire_altpriority_encoder6_q))};
endmodule //acl_fp_log_s5_double_altpriority_encoder_gla


//altpriority_encoder CBX_AUTO_BLACKBOX="ALL" LSB_PRIORITY="NO" WIDTH=64 WIDTHAD=6 data q
//VERSION_BEGIN 12.0 cbx_altpriority_encoder 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altpriority_encoder_018
	( 
	data,
	q) ;
	input   [63:0]  data;
	output   [5:0]  q;

	wire  [4:0]   wire_altpriority_encoder27_q;
	wire  [4:0]   wire_altpriority_encoder28_q;
	wire  wire_altpriority_encoder28_zero;

	acl_fp_log_s5_double_altpriority_encoder_q08   altpriority_encoder27
	( 
	.data(data[31:0]),
	.q(wire_altpriority_encoder27_q));
	acl_fp_log_s5_double_altpriority_encoder_qf8   altpriority_encoder28
	( 
	.data(data[63:32]),
	.q(wire_altpriority_encoder28_q),
	.zero(wire_altpriority_encoder28_zero));
	assign
		q = {(~ wire_altpriority_encoder28_zero), (({5{wire_altpriority_encoder28_zero}} & wire_altpriority_encoder27_q) | ({5{(~ wire_altpriority_encoder28_zero)}} & wire_altpriority_encoder28_q))};
endmodule //acl_fp_log_s5_double_altpriority_encoder_018

//synthesis_resources = altsquare 1 lpm_add_sub 89 lpm_mult 10 lpm_mux 10 mux21 63 reg 4847 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_log_s5_double_altfp_log_o3b
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

	wire  [63:0]   wire_Lshiftsmall_result;
	wire  [127:0]   wire_lzc_norm_L_result;
	wire  [63:0]   wire_Rshiftsmall_result;
	wire  wire_exp_nan_result;
	wire  wire_exp_zero_result;
	wire  wire_man_inf_result;
	wire  wire_man_nan_result;
	wire  [82:0]   wire_add1_result;
	wire  [62:0]   wire_add2_result;
	wire  [10:0]   wire_exp_biase_sub_result;
	wire  [25:0]   wire_sub1_result;
	wire  [10:0]   wire_sub2_result;
	wire  [6:0]   wire_sub3_result;
	wire  [54:0]   wire_sub4_result;
	wire  [10:0]   wire_sub5_result;
	wire  [10:0]   wire_sub6_result;
	wire  [82:0]   wire_range_reduction_almostlog;
	wire  [54:0]   wire_range_reduction_z;
	wire  [6:0]   wire_lzc_norm_E_q;
	wire  [5:0]   wire_lzoc_q;
	wire  [27:0]   wire_squarer_result;
	reg	[67:0]	absELog2_pipe_reg0;
	reg	[67:0]	absELog2_pipe_reg1;
	reg	[67:0]	absELog2_pipe_reg2;
	reg	[25:0]	absZ0_pipe_reg0;
	reg	[25:0]	absZ0_pipe_reg1;
	reg	[25:0]	absZ0_pipe_reg10;
	reg	[25:0]	absZ0_pipe_reg11;
	reg	[25:0]	absZ0_pipe_reg12;
	reg	[25:0]	absZ0_pipe_reg13;
	reg	[25:0]	absZ0_pipe_reg14;
	reg	[25:0]	absZ0_pipe_reg15;
	reg	[25:0]	absZ0_pipe_reg16;
	reg	[25:0]	absZ0_pipe_reg17;
	reg	[25:0]	absZ0_pipe_reg18;
	reg	[25:0]	absZ0_pipe_reg19;
	reg	[25:0]	absZ0_pipe_reg2;
	reg	[25:0]	absZ0_pipe_reg20;
	reg	[25:0]	absZ0_pipe_reg21;
	reg	[25:0]	absZ0_pipe_reg22;
	reg	[25:0]	absZ0_pipe_reg23;
	reg	[25:0]	absZ0_pipe_reg3;
	reg	[25:0]	absZ0_pipe_reg4;
	reg	[25:0]	absZ0_pipe_reg5;
	reg	[25:0]	absZ0_pipe_reg6;
	reg	[25:0]	absZ0_pipe_reg7;
	reg	[25:0]	absZ0_pipe_reg8;
	reg	[25:0]	absZ0_pipe_reg9;
	reg	[25:0]	absZ0s_pipe1_reg0;
	reg	[25:0]	absZ0s_pipe1_reg1;
	reg	[25:0]	absZ0s_pipe1_reg2;
	reg	[25:0]	absZ0s_pipe1_reg3;
	reg	[25:0]	absZ0s_reg0;
	reg	[82:0]	almostLog_pipe_reg0;
	reg	[82:0]	almostLog_pipe_reg1;
	reg	[82:0]	almostLog_pipe_reg2;
	reg	[0:0]	doRR_reg0;
	reg	[0:0]	doRR_reg1;
	reg	[10:0]	E0_pipe_reg0;
	reg	[10:0]	E0_pipe_reg1;
	reg	[10:0]	E0_pipe_reg10;
	reg	[10:0]	E0_pipe_reg11;
	reg	[10:0]	E0_pipe_reg12;
	reg	[10:0]	E0_pipe_reg13;
	reg	[10:0]	E0_pipe_reg14;
	reg	[10:0]	E0_pipe_reg15;
	reg	[10:0]	E0_pipe_reg16;
	reg	[10:0]	E0_pipe_reg17;
	reg	[10:0]	E0_pipe_reg18;
	reg	[10:0]	E0_pipe_reg19;
	reg	[10:0]	E0_pipe_reg2;
	reg	[10:0]	E0_pipe_reg20;
	reg	[10:0]	E0_pipe_reg21;
	reg	[10:0]	E0_pipe_reg22;
	reg	[10:0]	E0_pipe_reg23;
	reg	[10:0]	E0_pipe_reg3;
	reg	[10:0]	E0_pipe_reg4;
	reg	[10:0]	E0_pipe_reg5;
	reg	[10:0]	E0_pipe_reg6;
	reg	[10:0]	E0_pipe_reg7;
	reg	[10:0]	E0_pipe_reg8;
	reg	[10:0]	E0_pipe_reg9;
	reg	[5:0]	E_normal_pipe_reg0;
	reg	[0:0]	exp_is_ebiase_pipe_reg0;
	reg	[0:0]	exp_is_ebiase_pipe_reg1;
	reg	[0:0]	exp_is_ebiase_pipe_reg2;
	reg	[0:0]	input_is_infinity_pipe_reg0;
	reg	[0:0]	input_is_infinity_pipe_reg1;
	reg	[0:0]	input_is_infinity_pipe_reg10;
	reg	[0:0]	input_is_infinity_pipe_reg11;
	reg	[0:0]	input_is_infinity_pipe_reg12;
	reg	[0:0]	input_is_infinity_pipe_reg13;
	reg	[0:0]	input_is_infinity_pipe_reg14;
	reg	[0:0]	input_is_infinity_pipe_reg15;
	reg	[0:0]	input_is_infinity_pipe_reg16;
	reg	[0:0]	input_is_infinity_pipe_reg17;
	reg	[0:0]	input_is_infinity_pipe_reg18;
	reg	[0:0]	input_is_infinity_pipe_reg19;
	reg	[0:0]	input_is_infinity_pipe_reg2;
	reg	[0:0]	input_is_infinity_pipe_reg20;
	reg	[0:0]	input_is_infinity_pipe_reg21;
	reg	[0:0]	input_is_infinity_pipe_reg22;
	reg	[0:0]	input_is_infinity_pipe_reg23;
	reg	[0:0]	input_is_infinity_pipe_reg24;
	reg	[0:0]	input_is_infinity_pipe_reg25;
	reg	[0:0]	input_is_infinity_pipe_reg26;
	reg	[0:0]	input_is_infinity_pipe_reg27;
	reg	[0:0]	input_is_infinity_pipe_reg28;
	reg	[0:0]	input_is_infinity_pipe_reg29;
	reg	[0:0]	input_is_infinity_pipe_reg3;
	reg	[0:0]	input_is_infinity_pipe_reg30;
	reg	[0:0]	input_is_infinity_pipe_reg4;
	reg	[0:0]	input_is_infinity_pipe_reg5;
	reg	[0:0]	input_is_infinity_pipe_reg6;
	reg	[0:0]	input_is_infinity_pipe_reg7;
	reg	[0:0]	input_is_infinity_pipe_reg8;
	reg	[0:0]	input_is_infinity_pipe_reg9;
	reg	[0:0]	input_is_nan_pipe_reg0;
	reg	[0:0]	input_is_nan_pipe_reg1;
	reg	[0:0]	input_is_nan_pipe_reg10;
	reg	[0:0]	input_is_nan_pipe_reg11;
	reg	[0:0]	input_is_nan_pipe_reg12;
	reg	[0:0]	input_is_nan_pipe_reg13;
	reg	[0:0]	input_is_nan_pipe_reg14;
	reg	[0:0]	input_is_nan_pipe_reg15;
	reg	[0:0]	input_is_nan_pipe_reg16;
	reg	[0:0]	input_is_nan_pipe_reg17;
	reg	[0:0]	input_is_nan_pipe_reg18;
	reg	[0:0]	input_is_nan_pipe_reg19;
	reg	[0:0]	input_is_nan_pipe_reg2;
	reg	[0:0]	input_is_nan_pipe_reg20;
	reg	[0:0]	input_is_nan_pipe_reg21;
	reg	[0:0]	input_is_nan_pipe_reg22;
	reg	[0:0]	input_is_nan_pipe_reg23;
	reg	[0:0]	input_is_nan_pipe_reg24;
	reg	[0:0]	input_is_nan_pipe_reg25;
	reg	[0:0]	input_is_nan_pipe_reg26;
	reg	[0:0]	input_is_nan_pipe_reg27;
	reg	[0:0]	input_is_nan_pipe_reg28;
	reg	[0:0]	input_is_nan_pipe_reg29;
	reg	[0:0]	input_is_nan_pipe_reg3;
	reg	[0:0]	input_is_nan_pipe_reg30;
	reg	[0:0]	input_is_nan_pipe_reg4;
	reg	[0:0]	input_is_nan_pipe_reg5;
	reg	[0:0]	input_is_nan_pipe_reg6;
	reg	[0:0]	input_is_nan_pipe_reg7;
	reg	[0:0]	input_is_nan_pipe_reg8;
	reg	[0:0]	input_is_nan_pipe_reg9;
	reg	[0:0]	input_is_one_pipe_reg0;
	reg	[0:0]	input_is_one_pipe_reg1;
	reg	[0:0]	input_is_one_pipe_reg10;
	reg	[0:0]	input_is_one_pipe_reg11;
	reg	[0:0]	input_is_one_pipe_reg12;
	reg	[0:0]	input_is_one_pipe_reg13;
	reg	[0:0]	input_is_one_pipe_reg14;
	reg	[0:0]	input_is_one_pipe_reg15;
	reg	[0:0]	input_is_one_pipe_reg16;
	reg	[0:0]	input_is_one_pipe_reg17;
	reg	[0:0]	input_is_one_pipe_reg18;
	reg	[0:0]	input_is_one_pipe_reg19;
	reg	[0:0]	input_is_one_pipe_reg2;
	reg	[0:0]	input_is_one_pipe_reg20;
	reg	[0:0]	input_is_one_pipe_reg21;
	reg	[0:0]	input_is_one_pipe_reg22;
	reg	[0:0]	input_is_one_pipe_reg23;
	reg	[0:0]	input_is_one_pipe_reg24;
	reg	[0:0]	input_is_one_pipe_reg25;
	reg	[0:0]	input_is_one_pipe_reg26;
	reg	[0:0]	input_is_one_pipe_reg27;
	reg	[0:0]	input_is_one_pipe_reg28;
	reg	[0:0]	input_is_one_pipe_reg29;
	reg	[0:0]	input_is_one_pipe_reg3;
	reg	[0:0]	input_is_one_pipe_reg30;
	reg	[0:0]	input_is_one_pipe_reg4;
	reg	[0:0]	input_is_one_pipe_reg5;
	reg	[0:0]	input_is_one_pipe_reg6;
	reg	[0:0]	input_is_one_pipe_reg7;
	reg	[0:0]	input_is_one_pipe_reg8;
	reg	[0:0]	input_is_one_pipe_reg9;
	reg	[0:0]	input_is_zero_pipe_reg0;
	reg	[0:0]	input_is_zero_pipe_reg1;
	reg	[0:0]	input_is_zero_pipe_reg10;
	reg	[0:0]	input_is_zero_pipe_reg11;
	reg	[0:0]	input_is_zero_pipe_reg12;
	reg	[0:0]	input_is_zero_pipe_reg13;
	reg	[0:0]	input_is_zero_pipe_reg14;
	reg	[0:0]	input_is_zero_pipe_reg15;
	reg	[0:0]	input_is_zero_pipe_reg16;
	reg	[0:0]	input_is_zero_pipe_reg17;
	reg	[0:0]	input_is_zero_pipe_reg18;
	reg	[0:0]	input_is_zero_pipe_reg19;
	reg	[0:0]	input_is_zero_pipe_reg2;
	reg	[0:0]	input_is_zero_pipe_reg20;
	reg	[0:0]	input_is_zero_pipe_reg21;
	reg	[0:0]	input_is_zero_pipe_reg22;
	reg	[0:0]	input_is_zero_pipe_reg23;
	reg	[0:0]	input_is_zero_pipe_reg24;
	reg	[0:0]	input_is_zero_pipe_reg25;
	reg	[0:0]	input_is_zero_pipe_reg26;
	reg	[0:0]	input_is_zero_pipe_reg27;
	reg	[0:0]	input_is_zero_pipe_reg28;
	reg	[0:0]	input_is_zero_pipe_reg29;
	reg	[0:0]	input_is_zero_pipe_reg3;
	reg	[0:0]	input_is_zero_pipe_reg30;
	reg	[0:0]	input_is_zero_pipe_reg4;
	reg	[0:0]	input_is_zero_pipe_reg5;
	reg	[0:0]	input_is_zero_pipe_reg6;
	reg	[0:0]	input_is_zero_pipe_reg7;
	reg	[0:0]	input_is_zero_pipe_reg8;
	reg	[0:0]	input_is_zero_pipe_reg9;
	reg	[93:0]	Log_normal_normd_pipe_reg0;
	reg	[93:0]	Log_normal_reg0;
	reg	[56:0]	Log_small_normd_pipe_reg0;
	reg	[56:0]	Log_small_normd_pipe_reg1;
	reg	[6:0]	Lshiftval_reg0;
	reg	[6:0]	Lshiftval_reg1;
	reg	[6:0]	Lshiftval_reg2;
	reg	[6:0]	Lshiftval_reg3;
	reg	[5:0]	lzo_pipe1_reg0;
	reg	[5:0]	lzo_pipe1_reg1;
	reg	[5:0]	lzo_pipe1_reg10;
	reg	[5:0]	lzo_pipe1_reg11;
	reg	[5:0]	lzo_pipe1_reg12;
	reg	[5:0]	lzo_pipe1_reg13;
	reg	[5:0]	lzo_pipe1_reg14;
	reg	[5:0]	lzo_pipe1_reg15;
	reg	[5:0]	lzo_pipe1_reg16;
	reg	[5:0]	lzo_pipe1_reg17;
	reg	[5:0]	lzo_pipe1_reg18;
	reg	[5:0]	lzo_pipe1_reg19;
	reg	[5:0]	lzo_pipe1_reg2;
	reg	[5:0]	lzo_pipe1_reg20;
	reg	[5:0]	lzo_pipe1_reg21;
	reg	[5:0]	lzo_pipe1_reg22;
	reg	[5:0]	lzo_pipe1_reg23;
	reg	[5:0]	lzo_pipe1_reg3;
	reg	[5:0]	lzo_pipe1_reg4;
	reg	[5:0]	lzo_pipe1_reg5;
	reg	[5:0]	lzo_pipe1_reg6;
	reg	[5:0]	lzo_pipe1_reg7;
	reg	[5:0]	lzo_pipe1_reg8;
	reg	[5:0]	lzo_pipe1_reg9;
	reg	[5:0]	lzo_reg0;
	reg	[5:0]	lzo_reg1;
	reg	[5:0]	lzo_reg2;
	reg	[5:0]	lzo_reg3;
	reg	[5:0]	lzo_reg4;
	reg	[5:0]	lzo_reg5;
	reg	[5:0]	lzo_reg6;
	reg	[0:0]	sign_data_reg0;
	reg	[0:0]	sign_data_reg1;
	reg	[0:0]	sign_data_reg2;
	reg	[0:0]	small_flag_pipe_reg0;
	reg	[0:0]	small_flag_pipe_reg1;
	reg	[0:0]	small_flag_pipe_reg2;
	reg	[0:0]	small_flag_pipe_reg3;
	reg	[0:0]	small_flag_pipe_reg4;
	reg	[0:0]	small_flag_pipe_reg5;
	reg	[0:0]	small_flag_pipe_reg6;
	reg	[0:0]	small_flag_pipe_reg7;
	reg	[0:0]	small_flag_pipe_reg8;
	reg	[0:0]	sR_pipe1_reg0;
	reg	[0:0]	sR_pipe1_reg1;
	reg	[0:0]	sR_pipe1_reg10;
	reg	[0:0]	sR_pipe1_reg11;
	reg	[0:0]	sR_pipe1_reg12;
	reg	[0:0]	sR_pipe1_reg13;
	reg	[0:0]	sR_pipe1_reg14;
	reg	[0:0]	sR_pipe1_reg15;
	reg	[0:0]	sR_pipe1_reg16;
	reg	[0:0]	sR_pipe1_reg17;
	reg	[0:0]	sR_pipe1_reg18;
	reg	[0:0]	sR_pipe1_reg19;
	reg	[0:0]	sR_pipe1_reg2;
	reg	[0:0]	sR_pipe1_reg20;
	reg	[0:0]	sR_pipe1_reg21;
	reg	[0:0]	sR_pipe1_reg22;
	reg	[0:0]	sR_pipe1_reg23;
	reg	[0:0]	sR_pipe1_reg3;
	reg	[0:0]	sR_pipe1_reg4;
	reg	[0:0]	sR_pipe1_reg5;
	reg	[0:0]	sR_pipe1_reg6;
	reg	[0:0]	sR_pipe1_reg7;
	reg	[0:0]	sR_pipe1_reg8;
	reg	[0:0]	sR_pipe1_reg9;
	reg	[0:0]	sR_pipe2_reg0;
	reg	[0:0]	sR_pipe2_reg1;
	reg	[0:0]	sR_pipe2_reg2;
	reg	[0:0]	sR_pipe2_reg3;
	reg	[0:0]	sR_pipe2_reg4;
	reg	[0:0]	sR_pipe2_reg5;
	reg	[0:0]	sR_pipe3_reg0;
	reg	[0:0]	sR_pipe3_reg1;
	reg	[0:0]	sR_pipe3_reg2;
	reg	[0:0]	sR_pipe3_reg3;
	reg	[27:0]	Z2o2_pipe_reg0;
	reg	[27:0]	Z2o2_small_s_pipe_reg0;
	reg	[54:0]	Zfinal_reg0;
	reg	[54:0]	Zfinal_reg1;
	wire  [58:0]   wire_addsub1_result;
	wire  [93:0]   wire_addsub2_result;
	wire  [67:0]   wire_mult1_result;
	wire	[62:0]wire_mux_result0a_dataout;
	wire  [10:0]  absE;
	wire  [67:0]  absELog2;
	wire  [93:0]  absELog2_pad;
	wire  [67:0]  absELog2_pipe;
	wire  [25:0]  absZ0;
	wire  [25:0]  absZ0_pipe;
	wire  [25:0]  absZ0s;
	wire  [25:0]  absZ0s_pipe1;
	wire  [25:0]  absZ0s_pipe2;
	wire aclr;
	wire  [82:0]  almostLog;
	wire  [82:0]  almostLog_pipe;
	wire  [10:0]  data_exp_is_ebiase;
	wire  doRR;
	wire  doRR_pipe;
	wire  [10:0]  E0;
	wire  [10:0]  E0_is_zero;
	wire  [10:0]  E0_pipe;
	wire  [1:0]  E0_sub;
	wire  [10:0]  E0offset;
	wire  [5:0]  E_normal;
	wire  [5:0]  E_normal_pipe;
	wire  [10:0]  E_small;
	wire  [62:0]  EFR;
	wire  [10:0]  ER;
	wire  exp_all_one;
	wire  exp_all_zero;
	wire  [10:0]  exp_biase;
	wire  [10:0]  exp_data;
	wire  exp_is_ebiase;
	wire  exp_is_ebiase_pipe;
	wire  First_bit;
	wire  input_is_infinity;
	wire  input_is_infinity_pipe;
	wire  input_is_nan;
	wire  input_is_nan_pipe;
	wire  input_is_one;
	wire  input_is_one_pipe;
	wire  input_is_zero;
	wire  input_is_zero_pipe;
	wire  [54:0]  Log1p_normal;
	wire  [56:0]  Log2;
	wire  [56:0]  Log_g;
	wire  [93:0]  Log_normal;
	wire  [93:0]  Log_normal_normd;
	wire  [93:0]  Log_normal_normd_pipe;
	wire  [93:0]  Log_normal_pipe;
	wire  [58:0]  Log_small;
	wire  [56:0]  Log_small1;
	wire  [56:0]  Log_small2;
	wire  [56:0]  Log_small_normd;
	wire  [56:0]  Log_small_normd_pipe;
	wire  [82:0]  LogF_normal;
	wire  [93:0]  LogF_normal_pad;
	wire  [6:0]  Lshiftval;
	wire  [5:0]  lzo;
	wire  [5:0]  lzo_pipe1;
	wire  [5:0]  lzo_pipe2;
	wire  [53:0]  man_above_half;
	wire  man_all_zero;
	wire  [53:0]  man_below_half;
	wire  [51:0]  man_data;
	wire  man_not_zero;
	wire  [5:0]  pfinal_s;
	wire  round;
	wire  [6:0]  Rshiftval;
	wire  sign_data;
	wire  sign_data_pipe;
	wire  small_flag;
	wire  small_flag_pipe;
	wire  [26:0]  squarerIn;
	wire  [26:0]  squarerIn0;
	wire  [26:0]  squarerIn1;
	wire  sR;
	wire  sR_pipe1;
	wire  sR_pipe2;
	wire  sR_pipe3;
	wire  [3:0]  sticky;
	wire  [53:0]  Y0;
	wire  [27:0]  Z2o2;
	wire  [27:0]  Z2o2_pipe;
	wire  [58:0]  Z2o2_small;
	wire  [27:0]  Z2o2_small_s;
	wire  [27:0]  Z2o2_small_s_pipe;
	wire  [58:0]  Z_small;
	wire  [54:0]  Zfinal;
	wire  [54:0]  Zfinal_pipe;

	acl_fp_log_s5_double_altbarrel_shift_qud   Lshiftsmall
	( 
	.aclr(aclr),
	.clk_en(clk_en),
	.clock(clock),
	.data({absZ0, {38{1'b0}}}),
	.distance(Lshiftval[5:0]),
	.result(wire_Lshiftsmall_result));
	acl_fp_log_s5_double_altbarrel_shift_edb   lzc_norm_L
	( 
	.data({Log_normal_pipe, {34{1'b0}}}),
	.distance((~ wire_lzc_norm_E_q)),
	.result(wire_lzc_norm_L_result));
	acl_fp_log_s5_double_altbarrel_shift_d2e   Rshiftsmall
	( 
	.aclr(aclr),
	.clk_en(clk_en),
	.clock(clock),
	.data({Z2o2, {36{1'b0}}}),
	.distance(Rshiftval[5:0]),
	.result(wire_Rshiftsmall_result));
	acl_fp_log_s5_double_altfp_log_and_or_rab   exp_nan
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.data(exp_data),
	.result(wire_exp_nan_result));
	acl_fp_log_s5_double_altfp_log_and_or_98b   exp_zero
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.data(exp_data),
	.result(wire_exp_zero_result));
	acl_fp_log_s5_double_altfp_log_and_or_e8b   man_inf
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.data(man_data),
	.result(wire_man_inf_result));
	acl_fp_log_s5_double_altfp_log_and_or_e8b   man_nan
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.data(man_data),
	.result(wire_man_nan_result));
	acl_fp_log_s5_double_altfp_log_csa_r0e   add1
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa({{28{1'b0}}, Log1p_normal}),
	.datab(almostLog),
	.result(wire_add1_result));
	acl_fp_log_s5_double_altfp_log_csa_p0e   add2
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa({ER, Log_g[56:5]}),
	.datab({{62{1'b0}}, round}),
	.result(wire_add2_result));
	acl_fp_log_s5_double_altfp_log_csa_aoc   exp_biase_sub
	( 
	.dataa(exp_data),
	.datab(exp_biase),
	.result(wire_exp_biase_sub_result));
	acl_fp_log_s5_double_altfp_log_csa_i4b   sub1
	( 
	.dataa({26{1'b0}}),
	.datab(Y0[25:0]),
	.result(wire_sub1_result));
	acl_fp_log_s5_double_altfp_log_csa_aoc   sub2
	( 
	.dataa({11{1'b0}}),
	.datab(E0),
	.result(wire_sub2_result));
	acl_fp_log_s5_double_altfp_log_csa_vmc   sub3
	( 
	.dataa({1'b0, lzo}),
	.datab({1'b0, pfinal_s}),
	.result(wire_sub3_result));
	acl_fp_log_s5_double_altfp_log_csa_plf   sub4
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(Zfinal_pipe),
	.datab({{29{1'b0}}, Z2o2[27:2]}),
	.result(wire_sub4_result));
	acl_fp_log_s5_double_altfp_log_csa_ilf   sub5
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa({1'b0, {8{1'b1}}, E0_sub}),
	.datab({{5{1'b0}}, lzo_pipe2}),
	.result(wire_sub5_result));
	acl_fp_log_s5_double_altfp_log_csa_aoc   sub6
	( 
	.dataa(E0offset),
	.datab({{5{1'b0}}, (~ E_normal)}),
	.result(wire_sub6_result));
	acl_fp_log_s5_double_range_reduction_3sd   range_reduction
	( 
	.a0_in(man_data[51:47]),
	.aclr(aclr),
	.almostlog(wire_range_reduction_almostlog),
	.clk_en(clk_en),
	.clock(clock),
	.y0_in(Y0),
	.z(wire_range_reduction_z));
	acl_fp_log_s5_double_altpriority_encoder_gla   lzc_norm_E
	( 
	.aclr(aclr),
	.clk_en(clk_en),
	.clock(clock),
	.data({Log_normal, 34'b0000000000000000000000000000000001}),
	.q(wire_lzc_norm_E_q));
	acl_fp_log_s5_double_altpriority_encoder_018   lzoc
	( 
	.data({({52{First_bit}} ^ Y0[52:1]), 12'b000000000001}),
	.q(wire_lzoc_q));
	altsquare   squarer
	( 
	.aclr(aclr),
	.clock(clock),
	.data(squarerIn),
	.ena(clk_en),
	.result(wire_squarer_result));
	defparam
		squarer.data_width = 27,
		squarer.pipeline = 1,
		squarer.representation = "UNSIGNED",
		squarer.result_alignment = "MSB",
		squarer.result_width = 28,
		squarer.lpm_type = "altsquare";
	// synopsys translate_off
	initial
		absELog2_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absELog2_pipe_reg0 <= 68'b0;
		else if  (clk_en == 1'b1)   absELog2_pipe_reg0 <= absELog2_pipe;
	// synopsys translate_off
	initial
		absELog2_pipe_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absELog2_pipe_reg1 <= 68'b0;
		else if  (clk_en == 1'b1)   absELog2_pipe_reg1 <= absELog2_pipe_reg0;
	// synopsys translate_off
	initial
		absELog2_pipe_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absELog2_pipe_reg2 <= 68'b0;
		else if  (clk_en == 1'b1)   absELog2_pipe_reg2 <= absELog2_pipe_reg1;
	// synopsys translate_off
	initial
		absZ0_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg0 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg0 <= absZ0_pipe;
	// synopsys translate_off
	initial
		absZ0_pipe_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg1 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg1 <= absZ0_pipe_reg0;
	// synopsys translate_off
	initial
		absZ0_pipe_reg10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg10 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg10 <= absZ0_pipe_reg9;
	// synopsys translate_off
	initial
		absZ0_pipe_reg11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg11 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg11 <= absZ0_pipe_reg10;
	// synopsys translate_off
	initial
		absZ0_pipe_reg12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg12 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg12 <= absZ0_pipe_reg11;
	// synopsys translate_off
	initial
		absZ0_pipe_reg13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg13 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg13 <= absZ0_pipe_reg12;
	// synopsys translate_off
	initial
		absZ0_pipe_reg14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg14 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg14 <= absZ0_pipe_reg13;
	// synopsys translate_off
	initial
		absZ0_pipe_reg15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg15 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg15 <= absZ0_pipe_reg14;
	// synopsys translate_off
	initial
		absZ0_pipe_reg16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg16 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg16 <= absZ0_pipe_reg15;
	// synopsys translate_off
	initial
		absZ0_pipe_reg17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg17 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg17 <= absZ0_pipe_reg16;
	// synopsys translate_off
	initial
		absZ0_pipe_reg18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg18 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg18 <= absZ0_pipe_reg17;
	// synopsys translate_off
	initial
		absZ0_pipe_reg19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg19 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg19 <= absZ0_pipe_reg18;
	// synopsys translate_off
	initial
		absZ0_pipe_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg2 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg2 <= absZ0_pipe_reg1;
	// synopsys translate_off
	initial
		absZ0_pipe_reg20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg20 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg20 <= absZ0_pipe_reg19;
	// synopsys translate_off
	initial
		absZ0_pipe_reg21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg21 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg21 <= absZ0_pipe_reg20;
	// synopsys translate_off
	initial
		absZ0_pipe_reg22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg22 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg22 <= absZ0_pipe_reg21;
	// synopsys translate_off
	initial
		absZ0_pipe_reg23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg23 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg23 <= absZ0_pipe_reg22;
	// synopsys translate_off
	initial
		absZ0_pipe_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg3 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg3 <= absZ0_pipe_reg2;
	// synopsys translate_off
	initial
		absZ0_pipe_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg4 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg4 <= absZ0_pipe_reg3;
	// synopsys translate_off
	initial
		absZ0_pipe_reg5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg5 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg5 <= absZ0_pipe_reg4;
	// synopsys translate_off
	initial
		absZ0_pipe_reg6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg6 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg6 <= absZ0_pipe_reg5;
	// synopsys translate_off
	initial
		absZ0_pipe_reg7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg7 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg7 <= absZ0_pipe_reg6;
	// synopsys translate_off
	initial
		absZ0_pipe_reg8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg8 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg8 <= absZ0_pipe_reg7;
	// synopsys translate_off
	initial
		absZ0_pipe_reg9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0_pipe_reg9 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0_pipe_reg9 <= absZ0_pipe_reg8;
	// synopsys translate_off
	initial
		absZ0s_pipe1_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0s_pipe1_reg0 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0s_pipe1_reg0 <= absZ0s_pipe1;
	// synopsys translate_off
	initial
		absZ0s_pipe1_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0s_pipe1_reg1 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0s_pipe1_reg1 <= absZ0s_pipe1_reg0;
	// synopsys translate_off
	initial
		absZ0s_pipe1_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0s_pipe1_reg2 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0s_pipe1_reg2 <= absZ0s_pipe1_reg1;
	// synopsys translate_off
	initial
		absZ0s_pipe1_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0s_pipe1_reg3 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0s_pipe1_reg3 <= absZ0s_pipe1_reg2;
	// synopsys translate_off
	initial
		absZ0s_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) absZ0s_reg0 <= 26'b0;
		else if  (clk_en == 1'b1)   absZ0s_reg0 <= absZ0s;
	// synopsys translate_off
	initial
		almostLog_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) almostLog_pipe_reg0 <= 83'b0;
		else if  (clk_en == 1'b1)   almostLog_pipe_reg0 <= almostLog_pipe;
	// synopsys translate_off
	initial
		almostLog_pipe_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) almostLog_pipe_reg1 <= 83'b0;
		else if  (clk_en == 1'b1)   almostLog_pipe_reg1 <= almostLog_pipe_reg0;
	// synopsys translate_off
	initial
		almostLog_pipe_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) almostLog_pipe_reg2 <= 83'b0;
		else if  (clk_en == 1'b1)   almostLog_pipe_reg2 <= almostLog_pipe_reg1;
	// synopsys translate_off
	initial
		doRR_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) doRR_reg0 <= 1'b0;
		else if  (clk_en == 1'b1)   doRR_reg0 <= doRR;
	// synopsys translate_off
	initial
		doRR_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) doRR_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   doRR_reg1 <= doRR_reg0;
	// synopsys translate_off
	initial
		E0_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg0 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg0 <= E0_pipe;
	// synopsys translate_off
	initial
		E0_pipe_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg1 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg1 <= E0_pipe_reg0;
	// synopsys translate_off
	initial
		E0_pipe_reg10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg10 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg10 <= E0_pipe_reg9;
	// synopsys translate_off
	initial
		E0_pipe_reg11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg11 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg11 <= E0_pipe_reg10;
	// synopsys translate_off
	initial
		E0_pipe_reg12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg12 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg12 <= E0_pipe_reg11;
	// synopsys translate_off
	initial
		E0_pipe_reg13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg13 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg13 <= E0_pipe_reg12;
	// synopsys translate_off
	initial
		E0_pipe_reg14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg14 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg14 <= E0_pipe_reg13;
	// synopsys translate_off
	initial
		E0_pipe_reg15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg15 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg15 <= E0_pipe_reg14;
	// synopsys translate_off
	initial
		E0_pipe_reg16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg16 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg16 <= E0_pipe_reg15;
	// synopsys translate_off
	initial
		E0_pipe_reg17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg17 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg17 <= E0_pipe_reg16;
	// synopsys translate_off
	initial
		E0_pipe_reg18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg18 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg18 <= E0_pipe_reg17;
	// synopsys translate_off
	initial
		E0_pipe_reg19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg19 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg19 <= E0_pipe_reg18;
	// synopsys translate_off
	initial
		E0_pipe_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg2 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg2 <= E0_pipe_reg1;
	// synopsys translate_off
	initial
		E0_pipe_reg20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg20 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg20 <= E0_pipe_reg19;
	// synopsys translate_off
	initial
		E0_pipe_reg21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg21 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg21 <= E0_pipe_reg20;
	// synopsys translate_off
	initial
		E0_pipe_reg22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg22 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg22 <= E0_pipe_reg21;
	// synopsys translate_off
	initial
		E0_pipe_reg23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg23 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg23 <= E0_pipe_reg22;
	// synopsys translate_off
	initial
		E0_pipe_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg3 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg3 <= E0_pipe_reg2;
	// synopsys translate_off
	initial
		E0_pipe_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg4 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg4 <= E0_pipe_reg3;
	// synopsys translate_off
	initial
		E0_pipe_reg5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg5 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg5 <= E0_pipe_reg4;
	// synopsys translate_off
	initial
		E0_pipe_reg6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg6 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg6 <= E0_pipe_reg5;
	// synopsys translate_off
	initial
		E0_pipe_reg7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg7 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg7 <= E0_pipe_reg6;
	// synopsys translate_off
	initial
		E0_pipe_reg8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg8 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg8 <= E0_pipe_reg7;
	// synopsys translate_off
	initial
		E0_pipe_reg9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E0_pipe_reg9 <= 11'b0;
		else if  (clk_en == 1'b1)   E0_pipe_reg9 <= E0_pipe_reg8;
	// synopsys translate_off
	initial
		E_normal_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) E_normal_pipe_reg0 <= 6'b0;
		else if  (clk_en == 1'b1)   E_normal_pipe_reg0 <= E_normal_pipe;
	// synopsys translate_off
	initial
		exp_is_ebiase_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_is_ebiase_pipe_reg0 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_is_ebiase_pipe_reg0 <= exp_is_ebiase_pipe;
	// synopsys translate_off
	initial
		exp_is_ebiase_pipe_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_is_ebiase_pipe_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_is_ebiase_pipe_reg1 <= exp_is_ebiase_pipe_reg0;
	// synopsys translate_off
	initial
		exp_is_ebiase_pipe_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_is_ebiase_pipe_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_is_ebiase_pipe_reg2 <= exp_is_ebiase_pipe_reg1;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg0 <= input_is_infinity_pipe;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg1 <= input_is_infinity_pipe_reg0;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg10 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg10 <= input_is_infinity_pipe_reg9;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg11 <= input_is_infinity_pipe_reg10;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg12 <= input_is_infinity_pipe_reg11;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg13 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg13 <= input_is_infinity_pipe_reg12;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg14 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg14 <= input_is_infinity_pipe_reg13;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg15 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg15 <= input_is_infinity_pipe_reg14;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg16 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg16 <= input_is_infinity_pipe_reg15;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg17 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg17 <= input_is_infinity_pipe_reg16;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg18 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg18 <= input_is_infinity_pipe_reg17;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg19 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg19 <= input_is_infinity_pipe_reg18;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg2 <= input_is_infinity_pipe_reg1;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg20 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg20 <= input_is_infinity_pipe_reg19;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg21 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg21 <= input_is_infinity_pipe_reg20;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg22 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg22 <= input_is_infinity_pipe_reg21;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg23 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg23 <= input_is_infinity_pipe_reg22;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg24 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg24 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg24 <= input_is_infinity_pipe_reg23;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg25 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg25 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg25 <= input_is_infinity_pipe_reg24;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg26 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg26 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg26 <= input_is_infinity_pipe_reg25;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg27 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg27 <= input_is_infinity_pipe_reg26;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg28 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg28 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg28 <= input_is_infinity_pipe_reg27;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg29 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg29 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg29 <= input_is_infinity_pipe_reg28;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg3 <= input_is_infinity_pipe_reg2;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg30 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg30 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg30 <= input_is_infinity_pipe_reg29;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg4 <= input_is_infinity_pipe_reg3;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg5 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg5 <= input_is_infinity_pipe_reg4;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg6 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg6 <= input_is_infinity_pipe_reg5;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg7 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg7 <= input_is_infinity_pipe_reg6;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg8 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg8 <= input_is_infinity_pipe_reg7;
	// synopsys translate_off
	initial
		input_is_infinity_pipe_reg9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_pipe_reg9 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_pipe_reg9 <= input_is_infinity_pipe_reg8;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg0 <= input_is_nan_pipe;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg1 <= input_is_nan_pipe_reg0;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg10 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg10 <= input_is_nan_pipe_reg9;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg11 <= input_is_nan_pipe_reg10;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg12 <= input_is_nan_pipe_reg11;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg13 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg13 <= input_is_nan_pipe_reg12;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg14 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg14 <= input_is_nan_pipe_reg13;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg15 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg15 <= input_is_nan_pipe_reg14;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg16 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg16 <= input_is_nan_pipe_reg15;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg17 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg17 <= input_is_nan_pipe_reg16;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg18 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg18 <= input_is_nan_pipe_reg17;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg19 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg19 <= input_is_nan_pipe_reg18;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg2 <= input_is_nan_pipe_reg1;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg20 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg20 <= input_is_nan_pipe_reg19;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg21 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg21 <= input_is_nan_pipe_reg20;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg22 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg22 <= input_is_nan_pipe_reg21;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg23 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg23 <= input_is_nan_pipe_reg22;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg24 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg24 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg24 <= input_is_nan_pipe_reg23;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg25 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg25 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg25 <= input_is_nan_pipe_reg24;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg26 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg26 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg26 <= input_is_nan_pipe_reg25;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg27 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg27 <= input_is_nan_pipe_reg26;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg28 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg28 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg28 <= input_is_nan_pipe_reg27;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg29 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg29 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg29 <= input_is_nan_pipe_reg28;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg3 <= input_is_nan_pipe_reg2;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg30 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg30 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg30 <= input_is_nan_pipe_reg29;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg4 <= input_is_nan_pipe_reg3;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg5 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg5 <= input_is_nan_pipe_reg4;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg6 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg6 <= input_is_nan_pipe_reg5;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg7 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg7 <= input_is_nan_pipe_reg6;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg8 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg8 <= input_is_nan_pipe_reg7;
	// synopsys translate_off
	initial
		input_is_nan_pipe_reg9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_pipe_reg9 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_pipe_reg9 <= input_is_nan_pipe_reg8;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg0 <= input_is_one_pipe;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg1 <= input_is_one_pipe_reg0;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg10 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg10 <= input_is_one_pipe_reg9;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg11 <= input_is_one_pipe_reg10;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg12 <= input_is_one_pipe_reg11;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg13 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg13 <= input_is_one_pipe_reg12;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg14 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg14 <= input_is_one_pipe_reg13;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg15 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg15 <= input_is_one_pipe_reg14;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg16 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg16 <= input_is_one_pipe_reg15;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg17 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg17 <= input_is_one_pipe_reg16;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg18 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg18 <= input_is_one_pipe_reg17;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg19 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg19 <= input_is_one_pipe_reg18;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg2 <= input_is_one_pipe_reg1;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg20 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg20 <= input_is_one_pipe_reg19;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg21 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg21 <= input_is_one_pipe_reg20;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg22 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg22 <= input_is_one_pipe_reg21;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg23 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg23 <= input_is_one_pipe_reg22;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg24 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg24 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg24 <= input_is_one_pipe_reg23;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg25 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg25 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg25 <= input_is_one_pipe_reg24;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg26 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg26 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg26 <= input_is_one_pipe_reg25;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg27 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg27 <= input_is_one_pipe_reg26;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg28 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg28 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg28 <= input_is_one_pipe_reg27;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg29 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg29 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg29 <= input_is_one_pipe_reg28;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg3 <= input_is_one_pipe_reg2;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg30 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg30 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg30 <= input_is_one_pipe_reg29;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg4 <= input_is_one_pipe_reg3;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg5 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg5 <= input_is_one_pipe_reg4;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg6 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg6 <= input_is_one_pipe_reg5;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg7 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg7 <= input_is_one_pipe_reg6;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg8 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg8 <= input_is_one_pipe_reg7;
	// synopsys translate_off
	initial
		input_is_one_pipe_reg9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_one_pipe_reg9 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_one_pipe_reg9 <= input_is_one_pipe_reg8;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg0 <= input_is_zero_pipe;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg1 <= input_is_zero_pipe_reg0;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg10 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg10 <= input_is_zero_pipe_reg9;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg11 <= input_is_zero_pipe_reg10;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg12 <= input_is_zero_pipe_reg11;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg13 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg13 <= input_is_zero_pipe_reg12;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg14 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg14 <= input_is_zero_pipe_reg13;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg15 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg15 <= input_is_zero_pipe_reg14;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg16 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg16 <= input_is_zero_pipe_reg15;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg17 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg17 <= input_is_zero_pipe_reg16;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg18 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg18 <= input_is_zero_pipe_reg17;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg19 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg19 <= input_is_zero_pipe_reg18;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg2 <= input_is_zero_pipe_reg1;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg20 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg20 <= input_is_zero_pipe_reg19;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg21 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg21 <= input_is_zero_pipe_reg20;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg22 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg22 <= input_is_zero_pipe_reg21;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg23 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg23 <= input_is_zero_pipe_reg22;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg24 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg24 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg24 <= input_is_zero_pipe_reg23;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg25 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg25 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg25 <= input_is_zero_pipe_reg24;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg26 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg26 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg26 <= input_is_zero_pipe_reg25;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg27 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg27 <= input_is_zero_pipe_reg26;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg28 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg28 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg28 <= input_is_zero_pipe_reg27;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg29 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg29 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg29 <= input_is_zero_pipe_reg28;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg3 <= input_is_zero_pipe_reg2;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg30 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg30 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg30 <= input_is_zero_pipe_reg29;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg4 <= input_is_zero_pipe_reg3;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg5 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg5 <= input_is_zero_pipe_reg4;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg6 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg6 <= input_is_zero_pipe_reg5;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg7 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg7 <= input_is_zero_pipe_reg6;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg8 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg8 <= input_is_zero_pipe_reg7;
	// synopsys translate_off
	initial
		input_is_zero_pipe_reg9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_pipe_reg9 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_pipe_reg9 <= input_is_zero_pipe_reg8;
	// synopsys translate_off
	initial
		Log_normal_normd_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Log_normal_normd_pipe_reg0 <= 94'b0;
		else if  (clk_en == 1'b1)   Log_normal_normd_pipe_reg0 <= Log_normal_normd_pipe;
	// synopsys translate_off
	initial
		Log_normal_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Log_normal_reg0 <= 94'b0;
		else if  (clk_en == 1'b1)   Log_normal_reg0 <= Log_normal;
	// synopsys translate_off
	initial
		Log_small_normd_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Log_small_normd_pipe_reg0 <= 57'b0;
		else if  (clk_en == 1'b1)   Log_small_normd_pipe_reg0 <= Log_small_normd_pipe;
	// synopsys translate_off
	initial
		Log_small_normd_pipe_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Log_small_normd_pipe_reg1 <= 57'b0;
		else if  (clk_en == 1'b1)   Log_small_normd_pipe_reg1 <= Log_small_normd_pipe_reg0;
	// synopsys translate_off
	initial
		Lshiftval_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Lshiftval_reg0 <= 7'b0;
		else if  (clk_en == 1'b1)   Lshiftval_reg0 <= Lshiftval;
	// synopsys translate_off
	initial
		Lshiftval_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Lshiftval_reg1 <= 7'b0;
		else if  (clk_en == 1'b1)   Lshiftval_reg1 <= Lshiftval_reg0;
	// synopsys translate_off
	initial
		Lshiftval_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Lshiftval_reg2 <= 7'b0;
		else if  (clk_en == 1'b1)   Lshiftval_reg2 <= Lshiftval_reg1;
	// synopsys translate_off
	initial
		Lshiftval_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Lshiftval_reg3 <= 7'b0;
		else if  (clk_en == 1'b1)   Lshiftval_reg3 <= Lshiftval_reg2;
	// synopsys translate_off
	initial
		lzo_pipe1_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg0 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg0 <= lzo_pipe1;
	// synopsys translate_off
	initial
		lzo_pipe1_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg1 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg1 <= lzo_pipe1_reg0;
	// synopsys translate_off
	initial
		lzo_pipe1_reg10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg10 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg10 <= lzo_pipe1_reg9;
	// synopsys translate_off
	initial
		lzo_pipe1_reg11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg11 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg11 <= lzo_pipe1_reg10;
	// synopsys translate_off
	initial
		lzo_pipe1_reg12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg12 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg12 <= lzo_pipe1_reg11;
	// synopsys translate_off
	initial
		lzo_pipe1_reg13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg13 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg13 <= lzo_pipe1_reg12;
	// synopsys translate_off
	initial
		lzo_pipe1_reg14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg14 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg14 <= lzo_pipe1_reg13;
	// synopsys translate_off
	initial
		lzo_pipe1_reg15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg15 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg15 <= lzo_pipe1_reg14;
	// synopsys translate_off
	initial
		lzo_pipe1_reg16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg16 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg16 <= lzo_pipe1_reg15;
	// synopsys translate_off
	initial
		lzo_pipe1_reg17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg17 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg17 <= lzo_pipe1_reg16;
	// synopsys translate_off
	initial
		lzo_pipe1_reg18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg18 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg18 <= lzo_pipe1_reg17;
	// synopsys translate_off
	initial
		lzo_pipe1_reg19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg19 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg19 <= lzo_pipe1_reg18;
	// synopsys translate_off
	initial
		lzo_pipe1_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg2 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg2 <= lzo_pipe1_reg1;
	// synopsys translate_off
	initial
		lzo_pipe1_reg20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg20 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg20 <= lzo_pipe1_reg19;
	// synopsys translate_off
	initial
		lzo_pipe1_reg21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg21 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg21 <= lzo_pipe1_reg20;
	// synopsys translate_off
	initial
		lzo_pipe1_reg22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg22 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg22 <= lzo_pipe1_reg21;
	// synopsys translate_off
	initial
		lzo_pipe1_reg23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg23 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg23 <= lzo_pipe1_reg22;
	// synopsys translate_off
	initial
		lzo_pipe1_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg3 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg3 <= lzo_pipe1_reg2;
	// synopsys translate_off
	initial
		lzo_pipe1_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg4 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg4 <= lzo_pipe1_reg3;
	// synopsys translate_off
	initial
		lzo_pipe1_reg5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg5 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg5 <= lzo_pipe1_reg4;
	// synopsys translate_off
	initial
		lzo_pipe1_reg6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg6 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg6 <= lzo_pipe1_reg5;
	// synopsys translate_off
	initial
		lzo_pipe1_reg7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg7 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg7 <= lzo_pipe1_reg6;
	// synopsys translate_off
	initial
		lzo_pipe1_reg8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg8 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg8 <= lzo_pipe1_reg7;
	// synopsys translate_off
	initial
		lzo_pipe1_reg9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_pipe1_reg9 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_pipe1_reg9 <= lzo_pipe1_reg8;
	// synopsys translate_off
	initial
		lzo_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_reg0 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_reg0 <= lzo;
	// synopsys translate_off
	initial
		lzo_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_reg1 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_reg1 <= lzo_reg0;
	// synopsys translate_off
	initial
		lzo_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_reg2 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_reg2 <= lzo_reg1;
	// synopsys translate_off
	initial
		lzo_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_reg3 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_reg3 <= lzo_reg2;
	// synopsys translate_off
	initial
		lzo_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_reg4 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_reg4 <= lzo_reg3;
	// synopsys translate_off
	initial
		lzo_reg5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_reg5 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_reg5 <= lzo_reg4;
	// synopsys translate_off
	initial
		lzo_reg6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lzo_reg6 <= 6'b0;
		else if  (clk_en == 1'b1)   lzo_reg6 <= lzo_reg5;
	// synopsys translate_off
	initial
		sign_data_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_data_reg0 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_data_reg0 <= sign_data;
	// synopsys translate_off
	initial
		sign_data_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_data_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_data_reg1 <= sign_data_reg0;
	// synopsys translate_off
	initial
		sign_data_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_data_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_data_reg2 <= sign_data_reg1;
	// synopsys translate_off
	initial
		small_flag_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) small_flag_pipe_reg0 <= 1'b0;
		else if  (clk_en == 1'b1)   small_flag_pipe_reg0 <= small_flag_pipe;
	// synopsys translate_off
	initial
		small_flag_pipe_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) small_flag_pipe_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   small_flag_pipe_reg1 <= small_flag_pipe_reg0;
	// synopsys translate_off
	initial
		small_flag_pipe_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) small_flag_pipe_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   small_flag_pipe_reg2 <= small_flag_pipe_reg1;
	// synopsys translate_off
	initial
		small_flag_pipe_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) small_flag_pipe_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   small_flag_pipe_reg3 <= small_flag_pipe_reg2;
	// synopsys translate_off
	initial
		small_flag_pipe_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) small_flag_pipe_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   small_flag_pipe_reg4 <= small_flag_pipe_reg3;
	// synopsys translate_off
	initial
		small_flag_pipe_reg5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) small_flag_pipe_reg5 <= 1'b0;
		else if  (clk_en == 1'b1)   small_flag_pipe_reg5 <= small_flag_pipe_reg4;
	// synopsys translate_off
	initial
		small_flag_pipe_reg6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) small_flag_pipe_reg6 <= 1'b0;
		else if  (clk_en == 1'b1)   small_flag_pipe_reg6 <= small_flag_pipe_reg5;
	// synopsys translate_off
	initial
		small_flag_pipe_reg7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) small_flag_pipe_reg7 <= 1'b0;
		else if  (clk_en == 1'b1)   small_flag_pipe_reg7 <= small_flag_pipe_reg6;
	// synopsys translate_off
	initial
		small_flag_pipe_reg8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) small_flag_pipe_reg8 <= 1'b0;
		else if  (clk_en == 1'b1)   small_flag_pipe_reg8 <= small_flag_pipe_reg7;
	// synopsys translate_off
	initial
		sR_pipe1_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg0 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg0 <= sR_pipe1;
	// synopsys translate_off
	initial
		sR_pipe1_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg1 <= sR_pipe1_reg0;
	// synopsys translate_off
	initial
		sR_pipe1_reg10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg10 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg10 <= sR_pipe1_reg9;
	// synopsys translate_off
	initial
		sR_pipe1_reg11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg11 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg11 <= sR_pipe1_reg10;
	// synopsys translate_off
	initial
		sR_pipe1_reg12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg12 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg12 <= sR_pipe1_reg11;
	// synopsys translate_off
	initial
		sR_pipe1_reg13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg13 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg13 <= sR_pipe1_reg12;
	// synopsys translate_off
	initial
		sR_pipe1_reg14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg14 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg14 <= sR_pipe1_reg13;
	// synopsys translate_off
	initial
		sR_pipe1_reg15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg15 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg15 <= sR_pipe1_reg14;
	// synopsys translate_off
	initial
		sR_pipe1_reg16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg16 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg16 <= sR_pipe1_reg15;
	// synopsys translate_off
	initial
		sR_pipe1_reg17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg17 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg17 <= sR_pipe1_reg16;
	// synopsys translate_off
	initial
		sR_pipe1_reg18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg18 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg18 <= sR_pipe1_reg17;
	// synopsys translate_off
	initial
		sR_pipe1_reg19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg19 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg19 <= sR_pipe1_reg18;
	// synopsys translate_off
	initial
		sR_pipe1_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg2 <= sR_pipe1_reg1;
	// synopsys translate_off
	initial
		sR_pipe1_reg20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg20 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg20 <= sR_pipe1_reg19;
	// synopsys translate_off
	initial
		sR_pipe1_reg21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg21 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg21 <= sR_pipe1_reg20;
	// synopsys translate_off
	initial
		sR_pipe1_reg22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg22 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg22 <= sR_pipe1_reg21;
	// synopsys translate_off
	initial
		sR_pipe1_reg23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg23 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg23 <= sR_pipe1_reg22;
	// synopsys translate_off
	initial
		sR_pipe1_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg3 <= sR_pipe1_reg2;
	// synopsys translate_off
	initial
		sR_pipe1_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg4 <= sR_pipe1_reg3;
	// synopsys translate_off
	initial
		sR_pipe1_reg5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg5 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg5 <= sR_pipe1_reg4;
	// synopsys translate_off
	initial
		sR_pipe1_reg6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg6 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg6 <= sR_pipe1_reg5;
	// synopsys translate_off
	initial
		sR_pipe1_reg7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg7 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg7 <= sR_pipe1_reg6;
	// synopsys translate_off
	initial
		sR_pipe1_reg8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg8 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg8 <= sR_pipe1_reg7;
	// synopsys translate_off
	initial
		sR_pipe1_reg9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe1_reg9 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe1_reg9 <= sR_pipe1_reg8;
	// synopsys translate_off
	initial
		sR_pipe2_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe2_reg0 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe2_reg0 <= sR_pipe2;
	// synopsys translate_off
	initial
		sR_pipe2_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe2_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe2_reg1 <= sR_pipe2_reg0;
	// synopsys translate_off
	initial
		sR_pipe2_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe2_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe2_reg2 <= sR_pipe2_reg1;
	// synopsys translate_off
	initial
		sR_pipe2_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe2_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe2_reg3 <= sR_pipe2_reg2;
	// synopsys translate_off
	initial
		sR_pipe2_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe2_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe2_reg4 <= sR_pipe2_reg3;
	// synopsys translate_off
	initial
		sR_pipe2_reg5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe2_reg5 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe2_reg5 <= sR_pipe2_reg4;
	// synopsys translate_off
	initial
		sR_pipe3_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe3_reg0 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe3_reg0 <= sR_pipe3;
	// synopsys translate_off
	initial
		sR_pipe3_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe3_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe3_reg1 <= sR_pipe3_reg0;
	// synopsys translate_off
	initial
		sR_pipe3_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe3_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe3_reg2 <= sR_pipe3_reg1;
	// synopsys translate_off
	initial
		sR_pipe3_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sR_pipe3_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   sR_pipe3_reg3 <= sR_pipe3_reg2;
	// synopsys translate_off
	initial
		Z2o2_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Z2o2_pipe_reg0 <= 28'b0;
		else if  (clk_en == 1'b1)   Z2o2_pipe_reg0 <= Z2o2_pipe;
	// synopsys translate_off
	initial
		Z2o2_small_s_pipe_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Z2o2_small_s_pipe_reg0 <= 28'b0;
		else if  (clk_en == 1'b1)   Z2o2_small_s_pipe_reg0 <= Z2o2_small_s_pipe;
	// synopsys translate_off
	initial
		Zfinal_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Zfinal_reg0 <= 55'b0;
		else if  (clk_en == 1'b1)   Zfinal_reg0 <= Zfinal;
	// synopsys translate_off
	initial
		Zfinal_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Zfinal_reg1 <= 55'b0;
		else if  (clk_en == 1'b1)   Zfinal_reg1 <= Zfinal_reg0;
	lpm_add_sub   addsub1
	( 
	.add_sub(sR_pipe3),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(Z_small),
	.datab(Z2o2_small),
	.overflow(),
	.result(wire_addsub1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		addsub1.lpm_pipeline = 1,
		addsub1.lpm_representation = "UNSIGNED",
		addsub1.lpm_width = 59,
		addsub1.lpm_type = "lpm_add_sub";
	lpm_add_sub   addsub2
	( 
	.add_sub((~ sR_pipe3)),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(absELog2_pad),
	.datab(LogF_normal_pad),
	.overflow(),
	.result(wire_addsub2_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		addsub2.lpm_pipeline = 1,
		addsub2.lpm_representation = "UNSIGNED",
		addsub2.lpm_width = 94,
		addsub2.lpm_type = "lpm_add_sub";
	lpm_mult   mult1
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(absE),
	.datab(Log2),
	.result(wire_mult1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mult1.lpm_pipeline = 3,
		mult1.lpm_representation = "UNSIGNED",
		mult1.lpm_widtha = 11,
		mult1.lpm_widthb = 57,
		mult1.lpm_widthp = 68,
		mult1.lpm_type = "lpm_mult";
	assign		wire_mux_result0a_dataout = ((((input_is_zero | input_is_infinity) | input_is_nan) | input_is_one) === 1'b1) ? {{11{((~ input_is_one) | input_is_nan)}}, input_is_nan, {51{1'b0}}} : EFR;
	assign
		absE = (({11{(~ sR_pipe2)}} & E0) | ({11{sR_pipe2}} & wire_sub2_result)),
		absELog2 = absELog2_pipe_reg2,
		absELog2_pad = {absELog2, {26{1'b0}}},
		absELog2_pipe = wire_mult1_result,
		absZ0 = absZ0_pipe_reg23,
		absZ0_pipe = (({26{(~ sR_pipe1)}} & Y0[25:0]) | ({26{sR_pipe1}} & wire_sub1_result)),
		absZ0s = wire_Lshiftsmall_result[63:38],
		absZ0s_pipe1 = absZ0s_reg0,
		absZ0s_pipe2 = absZ0s_pipe1_reg3,
		aclr = 1'b0,
		almostLog = almostLog_pipe_reg2,
		almostLog_pipe = wire_range_reduction_almostlog,
		data_exp_is_ebiase = {((~ exp_data[10]) & data_exp_is_ebiase[9]), (exp_data[9] & data_exp_is_ebiase[8]), (exp_data[8] & data_exp_is_ebiase[7]), (exp_data[7] & data_exp_is_ebiase[6]), (exp_data[6] & data_exp_is_ebiase[5]), (exp_data[5] & data_exp_is_ebiase[4]), (exp_data[4] & data_exp_is_ebiase[3]), (exp_data[3] & data_exp_is_ebiase[2]), (exp_data[2] & data_exp_is_ebiase[1]), (exp_data[1] & data_exp_is_ebiase[0]), exp_data[0]},
		doRR = Lshiftval[6],
		doRR_pipe = doRR_reg1,
		E0 = E0_pipe_reg23,
		E0_is_zero = {((~ E0[10]) & E0_is_zero[9]), ((~ E0[9]) & E0_is_zero[8]), ((~ E0[8]) & E0_is_zero[7]), ((~ E0[7]) & E0_is_zero[6]), ((~ E0[6]) & E0_is_zero[5]), ((~ E0[5]) & E0_is_zero[4]), ((~ E0[4]) & E0_is_zero[3]), ((~ E0[3]) & E0_is_zero[2]), ((~ E0[2]) & E0_is_zero[1]), ((~ E0[1]) & E0_is_zero[0]), (~ E0[0])},
		E0_pipe = wire_exp_biase_sub_result,
		E0_sub = {(Log_small[58] | Log_small[57]), (Log_small[58] | (~ Log_small[57]))},
		E0offset = 11'b10000001001,
		E_normal = E_normal_pipe_reg0,
		E_normal_pipe = wire_lzc_norm_E_q[5:0],
		E_small = wire_sub5_result,
		EFR = wire_add2_result,
		ER = (({11{(~ small_flag)}} & wire_sub6_result) | ({11{small_flag}} & E_small)),
		exp_all_one = wire_exp_nan_result,
		exp_all_zero = wire_exp_zero_result,
		exp_biase = {10'b0111111111, (~ First_bit)},
		exp_data = data[62:52],
		exp_is_ebiase = exp_is_ebiase_pipe_reg2,
		exp_is_ebiase_pipe = data_exp_is_ebiase[10],
		First_bit = man_data[51],
		input_is_infinity = input_is_infinity_pipe_reg30,
		input_is_infinity_pipe = (exp_all_one & (~ man_all_zero)),
		input_is_nan = input_is_nan_pipe_reg30,
		input_is_nan_pipe = ((exp_all_one & man_not_zero) | sign_data_pipe),
		input_is_one = input_is_one_pipe_reg30,
		input_is_one_pipe = (exp_is_ebiase & (~ man_all_zero)),
		input_is_zero = input_is_zero_pipe_reg30,
		input_is_zero_pipe = (~ exp_all_zero),
		Log1p_normal = wire_sub4_result,
		Log2 = 57'b101100010111001000010111111101111101000111001111011110011,
		Log_g = (({57{(~ small_flag)}} & Log_normal_normd[92:36]) | ({57{small_flag}} & {Log_small_normd[55:0], 1'b0})),
		Log_normal = wire_addsub2_result,
		Log_normal_normd = Log_normal_normd_pipe_reg0,
		Log_normal_normd_pipe = wire_lzc_norm_L_result[127:34],
		Log_normal_pipe = Log_normal_reg0,
		Log_small = wire_addsub1_result,
		Log_small1 = (({57{(~ Log_small[57])}} & Log_small[56:0]) | ({57{Log_small[57]}} & Log_small[57:1])),
		Log_small2 = (({57{(~ Log_small[58])}} & Log_small1) | ({57{Log_small[58]}} & Log_small[58:2])),
		Log_small_normd = Log_small_normd_pipe_reg1,
		Log_small_normd_pipe = Log_small2,
		LogF_normal = wire_add1_result,
		LogF_normal_pad = {{11{LogF_normal[82]}}, LogF_normal},
		Lshiftval = wire_sub3_result,
		lzo = lzo_pipe1_reg23,
		lzo_pipe1 = (~ wire_lzoc_q),
		lzo_pipe2 = lzo_reg6,
		man_above_half = {1'b0, 1'b1, man_data},
		man_all_zero = wire_man_inf_result,
		man_below_half = {1'b1, man_data, 1'b0},
		man_data = data[51:0],
		man_not_zero = wire_man_nan_result,
		pfinal_s = 6'b011100,
		result = {(((sR | input_is_zero) | input_is_nan) & (~ input_is_one)), wire_mux_result0a_dataout},
		round = (Log_g[4] & (Log_g[5] | sticky[3])),
		Rshiftval = Lshiftval_reg3,
		sign_data = data[63],
		sign_data_pipe = sign_data_reg2,
		small_flag = small_flag_pipe_reg8,
		small_flag_pipe = ((~ doRR) & E0_is_zero[10]),
		squarerIn = (({27{(~ doRR_pipe)}} & squarerIn0) | ({27{doRR_pipe}} & squarerIn1)),
		squarerIn0 = {absZ0s_pipe1, 1'b0},
		squarerIn1 = Zfinal[54:28],
		sR = sR_pipe3_reg3,
		sR_pipe1 = (~ (data_exp_is_ebiase[10] | exp_data[10])),
		sR_pipe2 = sR_pipe1_reg23,
		sR_pipe3 = sR_pipe2_reg5,
		sticky = {(Log_g[3] | sticky[2]), (Log_g[2] | sticky[1]), (Log_g[1] | sticky[0]), Log_g[0]},
		Y0 = (({54{(~ First_bit)}} & man_below_half) | ({54{First_bit}} & man_above_half)),
		Z2o2 = Z2o2_pipe_reg0,
		Z2o2_pipe = wire_squarer_result,
		Z2o2_small = {{28{1'b0}}, Z2o2_small_s, {3{1'b0}}},
		Z2o2_small_s = Z2o2_small_s_pipe_reg0,
		Z2o2_small_s_pipe = wire_Rshiftsmall_result[63:36],
		Z_small = {absZ0s_pipe2, {33{1'b0}}},
		Zfinal = wire_range_reduction_z,
		Zfinal_pipe = Zfinal_reg1;
endmodule //acl_fp_log_s5_double_altfp_log_o3b
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module acl_fp_log_s5_double (
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

	acl_fp_log_s5_double_altfp_log_o3b	acl_fp_log_s5_double_altfp_log_o3b_component (
				.clk_en (enable),
				.clock (clock),
				.data (dataa),
				.result (sub_wire0));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix V"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "UNUSED"
// Retrieval info: CONSTANT: LPM_HINT STRING "UNUSED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altfp_log"
// Retrieval info: CONSTANT: PIPELINE NUMERIC "34"
// Retrieval info: CONSTANT: WIDTH_EXP NUMERIC "11"
// Retrieval info: CONSTANT: WIDTH_MAN NUMERIC "52"
// Retrieval info: USED_PORT: clk_en 0 0 0 0 INPUT NODEFVAL "clk_en"
// Retrieval info: CONNECT: @clk_en 0 0 0 0 clk_en 0 0 0 0
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: USED_PORT: data 0 0 64 0 INPUT NODEFVAL "data[63..0]"
// Retrieval info: CONNECT: @data 0 0 64 0 data 0 0 64 0
// Retrieval info: USED_PORT: result 0 0 64 0 OUTPUT NODEFVAL "result[63..0]"
// Retrieval info: CONNECT: result 0 0 64 0 @result 0 0 64 0
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_log_s5_double.v TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_log_s5_double.qip TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_log_s5_double.bsf TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_log_s5_double_inst.v TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_log_s5_double_bb.v TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_log_s5_double.inc TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_log_s5_double.cmp TRUE TRUE
// Retrieval info: LIB_FILE: lpm
