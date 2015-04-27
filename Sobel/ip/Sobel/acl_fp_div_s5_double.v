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


//altfp_div CBX_AUTO_BLACKBOX="ALL" DENORMAL_SUPPORT="NO" DEVICE_FAMILY="Stratix V" OPTIMIZE="SPEED" PIPELINE=24 REDUCED_FUNCTIONALITY="NO" WIDTH_EXP=11 WIDTH_MAN=52 clk_en clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_div 2012:05:31:20:08:02:SJ cbx_altsyncram 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_abs 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_decode 2012:05:31:20:08:02:SJ cbx_lpm_divide 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_stratixiii 2012:05:31:20:08:02:SJ cbx_stratixv 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



//altfp_div_pst CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Stratix V" FILE_NAME="acl_fp_div_s5_double.v:a" PIPELINE=24 WIDTH_EXP=11 WIDTH_MAN=52 aclr clk_en clock dataa datab result
//VERSION_BEGIN 12.0 cbx_altbarrel_shift 2012:05:31:20:08:02:SJ cbx_altfp_div 2012:05:31:20:08:02:SJ cbx_altsyncram 2012:05:31:20:08:02:SJ cbx_cycloneii 2012:05:31:20:08:02:SJ cbx_lpm_abs 2012:05:31:20:08:02:SJ cbx_lpm_add_sub 2012:05:31:20:08:02:SJ cbx_lpm_compare 2012:05:31:20:08:02:SJ cbx_lpm_decode 2012:05:31:20:08:02:SJ cbx_lpm_divide 2012:05:31:20:08:02:SJ cbx_lpm_mult 2012:05:31:20:08:02:SJ cbx_lpm_mux 2012:05:31:20:08:02:SJ cbx_mgl 2012:05:31:20:10:16:SJ cbx_padd 2012:05:31:20:08:02:SJ cbx_stratix 2012:05:31:20:08:02:SJ cbx_stratixii 2012:05:31:20:08:02:SJ cbx_stratixiii 2012:05:31:20:08:02:SJ cbx_stratixv 2012:05:31:20:08:02:SJ cbx_util_mgl 2012:05:31:20:08:02:SJ  VERSION_END

//synthesis_resources = altsyncram 1 lpm_add_sub 8 lpm_compare 1 lpm_mult 9 mux21 141 reg 3551 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_div_s5_double_altfp_div_pst_luf
	( 
	aclr,
	clk_en,
	clock,
	dataa,
	datab,
	result) ;
	input   aclr;
	input   clk_en;
	input   clock;
	input   [63:0]  dataa;
	input   [63:0]  datab;
	output   [63:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clk_en;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [8:0]   wire_altsyncram3_q_a;
	reg	a_is_infinity_dffe_0;
	reg	a_is_infinity_dffe_1;
	reg	a_is_infinity_dffe_10;
	reg	a_is_infinity_dffe_11;
	reg	a_is_infinity_dffe_12;
	reg	a_is_infinity_dffe_13;
	reg	a_is_infinity_dffe_14;
	reg	a_is_infinity_dffe_15;
	reg	a_is_infinity_dffe_16;
	reg	a_is_infinity_dffe_17;
	reg	a_is_infinity_dffe_18;
	reg	a_is_infinity_dffe_19;
	reg	a_is_infinity_dffe_2;
	reg	a_is_infinity_dffe_20;
	reg	a_is_infinity_dffe_21;
	reg	a_is_infinity_dffe_22;
	reg	a_is_infinity_dffe_3;
	reg	a_is_infinity_dffe_4;
	reg	a_is_infinity_dffe_5;
	reg	a_is_infinity_dffe_6;
	reg	a_is_infinity_dffe_7;
	reg	a_is_infinity_dffe_8;
	reg	a_is_infinity_dffe_9;
	reg	a_zero_b_not_dffe_0;
	reg	a_zero_b_not_dffe_1;
	reg	a_zero_b_not_dffe_10;
	reg	a_zero_b_not_dffe_11;
	reg	a_zero_b_not_dffe_12;
	reg	a_zero_b_not_dffe_13;
	reg	a_zero_b_not_dffe_14;
	reg	a_zero_b_not_dffe_15;
	reg	a_zero_b_not_dffe_16;
	reg	a_zero_b_not_dffe_17;
	reg	a_zero_b_not_dffe_18;
	reg	a_zero_b_not_dffe_19;
	reg	a_zero_b_not_dffe_2;
	reg	a_zero_b_not_dffe_20;
	reg	a_zero_b_not_dffe_21;
	reg	a_zero_b_not_dffe_22;
	reg	a_zero_b_not_dffe_3;
	reg	a_zero_b_not_dffe_4;
	reg	a_zero_b_not_dffe_5;
	reg	a_zero_b_not_dffe_6;
	reg	a_zero_b_not_dffe_7;
	reg	a_zero_b_not_dffe_8;
	reg	a_zero_b_not_dffe_9;
	reg	[62:0]	b1_dffe_0;
	reg	[62:0]	b1_dffe_1;
	reg	[62:0]	b1_dffe_10;
	reg	[62:0]	b1_dffe_11;
	reg	[62:0]	b1_dffe_12;
	reg	[62:0]	b1_dffe_13;
	reg	[62:0]	b1_dffe_2;
	reg	[62:0]	b1_dffe_3;
	reg	[62:0]	b1_dffe_4;
	reg	[62:0]	b1_dffe_5;
	reg	[62:0]	b1_dffe_6;
	reg	[62:0]	b1_dffe_7;
	reg	[62:0]	b1_dffe_8;
	reg	[62:0]	b1_dffe_9;
	reg	b_is_infinity_dffe_0;
	reg	b_is_infinity_dffe_1;
	reg	b_is_infinity_dffe_10;
	reg	b_is_infinity_dffe_11;
	reg	b_is_infinity_dffe_12;
	reg	b_is_infinity_dffe_13;
	reg	b_is_infinity_dffe_14;
	reg	b_is_infinity_dffe_15;
	reg	b_is_infinity_dffe_16;
	reg	b_is_infinity_dffe_17;
	reg	b_is_infinity_dffe_18;
	reg	b_is_infinity_dffe_19;
	reg	b_is_infinity_dffe_2;
	reg	b_is_infinity_dffe_20;
	reg	b_is_infinity_dffe_21;
	reg	b_is_infinity_dffe_22;
	reg	b_is_infinity_dffe_3;
	reg	b_is_infinity_dffe_4;
	reg	b_is_infinity_dffe_5;
	reg	b_is_infinity_dffe_6;
	reg	b_is_infinity_dffe_7;
	reg	b_is_infinity_dffe_8;
	reg	b_is_infinity_dffe_9;
	reg	both_exp_zeros_dffe;
	reg	divbyzero_pipe_dffe_0;
	reg	divbyzero_pipe_dffe_1;
	reg	divbyzero_pipe_dffe_10;
	reg	divbyzero_pipe_dffe_11;
	reg	divbyzero_pipe_dffe_12;
	reg	divbyzero_pipe_dffe_13;
	reg	divbyzero_pipe_dffe_14;
	reg	divbyzero_pipe_dffe_15;
	reg	divbyzero_pipe_dffe_16;
	reg	divbyzero_pipe_dffe_17;
	reg	divbyzero_pipe_dffe_18;
	reg	divbyzero_pipe_dffe_19;
	reg	divbyzero_pipe_dffe_2;
	reg	divbyzero_pipe_dffe_20;
	reg	divbyzero_pipe_dffe_21;
	reg	divbyzero_pipe_dffe_22;
	reg	divbyzero_pipe_dffe_3;
	reg	divbyzero_pipe_dffe_4;
	reg	divbyzero_pipe_dffe_5;
	reg	divbyzero_pipe_dffe_6;
	reg	divbyzero_pipe_dffe_7;
	reg	divbyzero_pipe_dffe_8;
	reg	divbyzero_pipe_dffe_9;
	reg	[16:0]	e1_dffe_0;
	reg	[16:0]	e1_dffe_1;
	reg	[16:0]	e1_dffe_2;
	reg	[16:0]	e1_dffe_3;
	reg	[16:0]	e1_dffe_4;
	reg	[16:0]	e1_dffe_5;
	reg	[16:0]	e1_dffe_perf_0;
	reg	[16:0]	e1_dffe_perf_1;
	reg	[16:0]	e1_dffe_perf_10;
	reg	[16:0]	e1_dffe_perf_11;
	reg	[16:0]	e1_dffe_perf_2;
	reg	[16:0]	e1_dffe_perf_3;
	reg	[16:0]	e1_dffe_perf_4;
	reg	[16:0]	e1_dffe_perf_5;
	reg	[16:0]	e1_dffe_perf_6;
	reg	[16:0]	e1_dffe_perf_7;
	reg	[16:0]	e1_dffe_perf_8;
	reg	[16:0]	e1_dffe_perf_9;
	reg	[10:0]	exp_result_dffe_0;
	reg	[10:0]	exp_result_dffe_1;
	reg	[10:0]	exp_result_dffe_10;
	reg	[10:0]	exp_result_dffe_11;
	reg	[10:0]	exp_result_dffe_12;
	reg	[10:0]	exp_result_dffe_13;
	reg	[10:0]	exp_result_dffe_14;
	reg	[10:0]	exp_result_dffe_15;
	reg	[10:0]	exp_result_dffe_16;
	reg	[10:0]	exp_result_dffe_17;
	reg	[10:0]	exp_result_dffe_18;
	reg	[10:0]	exp_result_dffe_19;
	reg	[10:0]	exp_result_dffe_2;
	reg	[10:0]	exp_result_dffe_20;
	reg	[10:0]	exp_result_dffe_21;
	reg	[10:0]	exp_result_dffe_3;
	reg	[10:0]	exp_result_dffe_4;
	reg	[10:0]	exp_result_dffe_5;
	reg	[10:0]	exp_result_dffe_6;
	reg	[10:0]	exp_result_dffe_7;
	reg	[10:0]	exp_result_dffe_8;
	reg	[10:0]	exp_result_dffe_9;
	reg	frac_a_smaller_dffe1;
	reg	[51:0]	man_a_dffe1_dffe1;
	reg	[51:0]	man_b_dffe1_dffe1;
	reg	[51:0]	man_result_dffe;
	reg	nan_pipe_dffe_0;
	reg	nan_pipe_dffe_1;
	reg	nan_pipe_dffe_10;
	reg	nan_pipe_dffe_11;
	reg	nan_pipe_dffe_12;
	reg	nan_pipe_dffe_13;
	reg	nan_pipe_dffe_14;
	reg	nan_pipe_dffe_15;
	reg	nan_pipe_dffe_16;
	reg	nan_pipe_dffe_17;
	reg	nan_pipe_dffe_18;
	reg	nan_pipe_dffe_19;
	reg	nan_pipe_dffe_2;
	reg	nan_pipe_dffe_20;
	reg	nan_pipe_dffe_21;
	reg	nan_pipe_dffe_22;
	reg	nan_pipe_dffe_3;
	reg	nan_pipe_dffe_4;
	reg	nan_pipe_dffe_5;
	reg	nan_pipe_dffe_6;
	reg	nan_pipe_dffe_7;
	reg	nan_pipe_dffe_8;
	reg	nan_pipe_dffe_9;
	reg	over_under_dffe_0;
	reg	over_under_dffe_1;
	reg	over_under_dffe_10;
	reg	over_under_dffe_11;
	reg	over_under_dffe_12;
	reg	over_under_dffe_13;
	reg	over_under_dffe_14;
	reg	over_under_dffe_15;
	reg	over_under_dffe_16;
	reg	over_under_dffe_17;
	reg	over_under_dffe_18;
	reg	over_under_dffe_19;
	reg	over_under_dffe_2;
	reg	over_under_dffe_20;
	reg	over_under_dffe_3;
	reg	over_under_dffe_4;
	reg	over_under_dffe_5;
	reg	over_under_dffe_6;
	reg	over_under_dffe_7;
	reg	over_under_dffe_8;
	reg	over_under_dffe_9;
	reg	[33:0]	q_partial_perf_dffe_0;
	reg	[33:0]	q_partial_perf_dffe_1;
	reg	[33:0]	q_partial_perf_dffe_2;
	reg	[33:0]	q_partial_perf_dffe_3;
	reg	[16:0]	quotient_j_dffe;
	reg	[16:0]	quotient_k_dffe_0;
	reg	[30:0]	quotient_k_dffe_1;
	reg	[44:0]	quotient_k_dffe_2;
	reg	[16:0]	quotient_k_dffe_perf_0;
	reg	[16:0]	quotient_k_dffe_perf_1;
	reg	[44:0]	quotient_k_dffe_perf_10;
	reg	[44:0]	quotient_k_dffe_perf_11;
	reg	[16:0]	quotient_k_dffe_perf_2;
	reg	[16:0]	quotient_k_dffe_perf_3;
	reg	[30:0]	quotient_k_dffe_perf_4;
	reg	[30:0]	quotient_k_dffe_perf_5;
	reg	[30:0]	quotient_k_dffe_perf_6;
	reg	[30:0]	quotient_k_dffe_perf_7;
	reg	[44:0]	quotient_k_dffe_perf_8;
	reg	[44:0]	quotient_k_dffe_perf_9;
	reg	[78:0]	remainder_j_dffe_0;
	reg	[78:0]	remainder_j_dffe_1;
	reg	[78:0]	remainder_j_dffe_2;
	reg	[78:0]	remainder_j_dffe_3;
	reg	[78:0]	remainder_j_dffe_4;
	reg	[78:0]	remainder_j_dffe_5;
	reg	[78:0]	remainder_j_dffe_perf_0;
	reg	[78:0]	remainder_j_dffe_perf_1;
	reg	[78:0]	remainder_j_dffe_perf_2;
	reg	[78:0]	remainder_j_dffe_perf_3;
	reg	[78:0]	remainder_j_dffe_perf_4;
	reg	[78:0]	remainder_j_dffe_perf_5;
	reg	[78:0]	remainder_j_dffe_perf_6;
	reg	[78:0]	remainder_j_dffe_perf_7;
	reg	[78:0]	remainder_j_dffe_perf_8;
	reg	sign_pipe_dffe_0;
	reg	sign_pipe_dffe_1;
	reg	sign_pipe_dffe_10;
	reg	sign_pipe_dffe_11;
	reg	sign_pipe_dffe_12;
	reg	sign_pipe_dffe_13;
	reg	sign_pipe_dffe_14;
	reg	sign_pipe_dffe_15;
	reg	sign_pipe_dffe_16;
	reg	sign_pipe_dffe_17;
	reg	sign_pipe_dffe_18;
	reg	sign_pipe_dffe_19;
	reg	sign_pipe_dffe_2;
	reg	sign_pipe_dffe_20;
	reg	sign_pipe_dffe_21;
	reg	sign_pipe_dffe_22;
	reg	sign_pipe_dffe_23;
	reg	sign_pipe_dffe_3;
	reg	sign_pipe_dffe_4;
	reg	sign_pipe_dffe_5;
	reg	sign_pipe_dffe_6;
	reg	sign_pipe_dffe_7;
	reg	sign_pipe_dffe_8;
	reg	sign_pipe_dffe_9;
	wire  wire_bias_addition_overflow;
	wire  [11:0]   wire_bias_addition_result;
	wire  [11:0]   wire_exp_sub_result;
	wire  [30:0]   wire_quotient_accumulate_0_result;
	wire  [44:0]   wire_quotient_accumulate_1_result;
	wire  [58:0]   wire_quotient_process_result;
	wire  [78:0]   wire_remainder_sub_0_result;
	wire  [78:0]   wire_remainder_sub_1_result;
	wire  [78:0]   wire_remainder_sub_2_result;
	wire  wire_cmpr2_alb;
	wire  [63:0]   wire_a1_prod_result;
	wire  [62:0]   wire_b1_prod_result;
	wire  [33:0]   wire_q_partial_0_result;
	wire  [33:0]   wire_q_partial_1_result;
	wire  [33:0]   wire_q_partial_2_result;
	wire  [33:0]   wire_q_partial_3_result;
	wire  [79:0]   wire_remainder_mult_0_result;
	wire  [79:0]   wire_remainder_mult_1_result;
	wire  [79:0]   wire_remainder_mult_2_result;
	wire	[10:0]wire_exp_result_muxa_dataout;
	wire	[53:0]wire_man_a_adjusteda_dataout;
	wire	[51:0]wire_man_result_muxa_dataout;
	wire	[11:0]wire_select_bias_2a_dataout;
	wire	[11:0]wire_select_biasa_dataout;
	wire  a_is_infinity_w;
	wire  a_is_nan_w;
	wire  a_zero_b_not;
	wire  [188:0]  b1_dffe_w;
	wire  b_is_infinity_w;
	wire  b_is_nan_w;
	wire  bias_addition_overf_w;
	wire  [10:0]  bias_addition_w;
	wire  both_exp_zeros;
	wire  [8:0]  e0_dffe1_wo;
	wire  [8:0]  e0_w;
	wire  [118:0]  e1_w;
	wire  [10:0]  exp_a_all_one_w;
	wire  [10:0]  exp_a_not_zero_w;
	wire  [10:0]  exp_add_output_all_one;
	wire  [10:0]  exp_add_output_not_zero;
	wire  [10:0]  exp_b_all_one_w;
	wire  [10:0]  exp_b_not_zero_w;
	wire  [10:0]  exp_result_mux_out;
	wire  exp_result_mux_sel_w;
	wire  [10:0]  exp_result_w;
	wire  exp_sign_w;
	wire  [11:0]  exp_sub_a_w;
	wire  [11:0]  exp_sub_b_w;
	wire  [11:0]  exp_sub_w;
	wire  frac_a_smaller_dffe1_wi;
	wire  frac_a_smaller_dffe1_wo;
	wire  frac_a_smaller_w;
	wire  guard_bit;
	wire  [53:0]  man_a_adjusted_w;
	wire  [51:0]  man_a_dffe1_wi;
	wire  [51:0]  man_a_dffe1_wo;
	wire  [51:0]  man_a_not_zero_w;
	wire  [52:0]  man_b_adjusted_w;
	wire  [51:0]  man_b_dffe1_wi;
	wire  [51:0]  man_b_dffe1_wo;
	wire  [51:0]  man_b_not_zero_w;
	wire  [51:0]  man_result_dffe_wi;
	wire  [51:0]  man_result_dffe_wo;
	wire  man_result_mux_select;
	wire  [51:0]  man_result_w;
	wire  [51:0]  man_zeros_w;
	wire  [10:0]  overflow_ones_w;
	wire  overflow_underflow;
	wire  overflow_w;
	wire  [235:0]  quotient_accumulate_w;
	wire  quotient_process_cin_w;
	wire  [315:0]  remainder_j_w;
	wire  round_bit;
	wire  [11:0]  select_bias_out_2_w;
	wire  [11:0]  select_bias_out_w;
	wire  [3:0]  sticky_bits;
	wire  underflow_w;
	wire  [10:0]  underflow_zeros_w;
	wire  [11:0]  value_add_one_w;
	wire  [11:0]  value_normal_w;
	wire  [11:0]  value_zero_w;

	altsyncram   altsyncram3
	( 
	.address_a(datab[51:43]),
	.clock0(clock),
	.clocken0(clk_en),
	.eccstatus(),
	.q_a(wire_altsyncram3_q_a),
	.q_b()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr0(1'b0),
	.aclr1(1'b0),
	.address_b({1{1'b1}}),
	.addressstall_a(1'b0),
	.addressstall_b(1'b0),
	.byteena_a({1{1'b1}}),
	.byteena_b({1{1'b1}}),
	.clock1(1'b1),
	.clocken1(1'b1),
	.clocken2(1'b1),
	.clocken3(1'b1),
	.data_a({9{1'b1}}),
	.data_b({1{1'b1}}),
	.rden_a(1'b1),
	.rden_b(1'b1),
	.wren_a(1'b0),
	.wren_b(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		altsyncram3.init_file = "acl_fp_div_s5_double.hex",
		altsyncram3.operation_mode = "ROM",
		altsyncram3.width_a = 9,
		altsyncram3.widthad_a = 9,
		altsyncram3.intended_device_family = "Stratix V",
		altsyncram3.lpm_type = "altsyncram";
	// synopsys translate_off
	initial
		a_is_infinity_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_0 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_0 <= a_is_infinity_w;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_1 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_1 <= a_is_infinity_dffe_0;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_10 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_10 <= a_is_infinity_dffe_9;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_11 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_11 <= a_is_infinity_dffe_10;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_12 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_12 <= a_is_infinity_dffe_11;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_13 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_13 <= a_is_infinity_dffe_12;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_14 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_14 <= a_is_infinity_dffe_13;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_15 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_15 <= a_is_infinity_dffe_14;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_16 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_16 <= a_is_infinity_dffe_15;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_17 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_17 <= a_is_infinity_dffe_16;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_18 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_18 <= a_is_infinity_dffe_17;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_19 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_19 <= a_is_infinity_dffe_18;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_2 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_2 <= a_is_infinity_dffe_1;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_20 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_20 <= a_is_infinity_dffe_19;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_21 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_21 <= a_is_infinity_dffe_20;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_22 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_22 <= a_is_infinity_dffe_21;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_3 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_3 <= a_is_infinity_dffe_2;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_4 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_4 <= a_is_infinity_dffe_3;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_5 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_5 <= a_is_infinity_dffe_4;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_6 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_6 <= a_is_infinity_dffe_5;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_7 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_7 <= a_is_infinity_dffe_6;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_8 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_8 <= a_is_infinity_dffe_7;
	// synopsys translate_off
	initial
		a_is_infinity_dffe_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_is_infinity_dffe_9 <= 1'b0;
		else if  (clk_en == 1'b1)   a_is_infinity_dffe_9 <= a_is_infinity_dffe_8;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_0 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_0 <= a_zero_b_not;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_1 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_1 <= a_zero_b_not_dffe_0;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_10 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_10 <= a_zero_b_not_dffe_9;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_11 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_11 <= a_zero_b_not_dffe_10;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_12 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_12 <= a_zero_b_not_dffe_11;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_13 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_13 <= a_zero_b_not_dffe_12;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_14 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_14 <= a_zero_b_not_dffe_13;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_15 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_15 <= a_zero_b_not_dffe_14;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_16 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_16 <= a_zero_b_not_dffe_15;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_17 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_17 <= a_zero_b_not_dffe_16;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_18 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_18 <= a_zero_b_not_dffe_17;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_19 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_19 <= a_zero_b_not_dffe_18;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_2 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_2 <= a_zero_b_not_dffe_1;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_20 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_20 <= a_zero_b_not_dffe_19;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_21 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_21 <= a_zero_b_not_dffe_20;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_22 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_22 <= a_zero_b_not_dffe_21;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_3 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_3 <= a_zero_b_not_dffe_2;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_4 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_4 <= a_zero_b_not_dffe_3;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_5 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_5 <= a_zero_b_not_dffe_4;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_6 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_6 <= a_zero_b_not_dffe_5;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_7 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_7 <= a_zero_b_not_dffe_6;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_8 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_8 <= a_zero_b_not_dffe_7;
	// synopsys translate_off
	initial
		a_zero_b_not_dffe_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) a_zero_b_not_dffe_9 <= 1'b0;
		else if  (clk_en == 1'b1)   a_zero_b_not_dffe_9 <= a_zero_b_not_dffe_8;
	// synopsys translate_off
	initial
		b1_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b1_dffe_0 <= 63'b0;
		else if  (clk_en == 1'b1)   b1_dffe_0 <= wire_b1_prod_result;
	// synopsys translate_off
	initial
		b1_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b1_dffe_1 <= 63'b0;
		else if  (clk_en == 1'b1)   b1_dffe_1 <= b1_dffe_0;
	// synopsys translate_off
	initial
		b1_dffe_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b1_dffe_10 <= 63'b0;
		else if  (clk_en == 1'b1)   b1_dffe_10 <= b1_dffe_9;
	// synopsys translate_off
	initial
		b1_dffe_11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b1_dffe_11 <= 63'b0;
		else if  (clk_en == 1'b1)   b1_dffe_11 <= b1_dffe_10;
	// synopsys translate_off
	initial
		b1_dffe_12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b1_dffe_12 <= 63'b0;
		else if  (clk_en == 1'b1)   b1_dffe_12 <= b1_dffe_11;
	// synopsys translate_off
	initial
		b1_dffe_13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b1_dffe_13 <= 63'b0;
		else if  (clk_en == 1'b1)   b1_dffe_13 <= b1_dffe_12;
	// synopsys translate_off
	initial
		b1_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b1_dffe_2 <= 63'b0;
		else if  (clk_en == 1'b1)   b1_dffe_2 <= b1_dffe_1;
	// synopsys translate_off
	initial
		b1_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b1_dffe_3 <= 63'b0;
		else if  (clk_en == 1'b1)   b1_dffe_3 <= b1_dffe_2;
	// synopsys translate_off
	initial
		b1_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b1_dffe_4 <= 63'b0;
		else if  (clk_en == 1'b1)   b1_dffe_4 <= b1_dffe_3;
	// synopsys translate_off
	initial
		b1_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b1_dffe_5 <= 63'b0;
		else if  (clk_en == 1'b1)   b1_dffe_5 <= b1_dffe_4;
	// synopsys translate_off
	initial
		b1_dffe_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b1_dffe_6 <= 63'b0;
		else if  (clk_en == 1'b1)   b1_dffe_6 <= b1_dffe_5;
	// synopsys translate_off
	initial
		b1_dffe_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b1_dffe_7 <= 63'b0;
		else if  (clk_en == 1'b1)   b1_dffe_7 <= b1_dffe_6;
	// synopsys translate_off
	initial
		b1_dffe_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b1_dffe_8 <= 63'b0;
		else if  (clk_en == 1'b1)   b1_dffe_8 <= b1_dffe_7;
	// synopsys translate_off
	initial
		b1_dffe_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b1_dffe_9 <= 63'b0;
		else if  (clk_en == 1'b1)   b1_dffe_9 <= b1_dffe_8;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_0 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_0 <= b_is_infinity_w;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_1 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_1 <= b_is_infinity_dffe_0;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_10 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_10 <= b_is_infinity_dffe_9;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_11 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_11 <= b_is_infinity_dffe_10;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_12 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_12 <= b_is_infinity_dffe_11;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_13 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_13 <= b_is_infinity_dffe_12;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_14 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_14 <= b_is_infinity_dffe_13;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_15 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_15 <= b_is_infinity_dffe_14;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_16 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_16 <= b_is_infinity_dffe_15;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_17 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_17 <= b_is_infinity_dffe_16;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_18 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_18 <= b_is_infinity_dffe_17;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_19 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_19 <= b_is_infinity_dffe_18;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_2 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_2 <= b_is_infinity_dffe_1;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_20 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_20 <= b_is_infinity_dffe_19;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_21 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_21 <= b_is_infinity_dffe_20;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_22 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_22 <= b_is_infinity_dffe_21;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_3 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_3 <= b_is_infinity_dffe_2;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_4 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_4 <= b_is_infinity_dffe_3;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_5 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_5 <= b_is_infinity_dffe_4;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_6 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_6 <= b_is_infinity_dffe_5;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_7 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_7 <= b_is_infinity_dffe_6;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_8 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_8 <= b_is_infinity_dffe_7;
	// synopsys translate_off
	initial
		b_is_infinity_dffe_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_is_infinity_dffe_9 <= 1'b0;
		else if  (clk_en == 1'b1)   b_is_infinity_dffe_9 <= b_is_infinity_dffe_8;
	// synopsys translate_off
	initial
		both_exp_zeros_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) both_exp_zeros_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   both_exp_zeros_dffe <= ((~ exp_b_not_zero_w[10]) & (~ exp_a_not_zero_w[10]));
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_0 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_0 <= ((((~ exp_b_not_zero_w[10]) & (~ a_is_nan_w)) & exp_a_not_zero_w[10]) & (~ a_is_infinity_w));
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_1 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_1 <= divbyzero_pipe_dffe_0;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_10 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_10 <= divbyzero_pipe_dffe_9;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_11 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_11 <= divbyzero_pipe_dffe_10;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_12 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_12 <= divbyzero_pipe_dffe_11;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_13 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_13 <= divbyzero_pipe_dffe_12;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_14 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_14 <= divbyzero_pipe_dffe_13;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_15 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_15 <= divbyzero_pipe_dffe_14;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_16 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_16 <= divbyzero_pipe_dffe_15;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_17 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_17 <= divbyzero_pipe_dffe_16;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_18 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_18 <= divbyzero_pipe_dffe_17;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_19 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_19 <= divbyzero_pipe_dffe_18;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_2 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_2 <= divbyzero_pipe_dffe_1;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_20 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_20 <= divbyzero_pipe_dffe_19;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_21 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_21 <= divbyzero_pipe_dffe_20;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_22 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_22 <= divbyzero_pipe_dffe_21;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_3 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_3 <= divbyzero_pipe_dffe_2;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_4 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_4 <= divbyzero_pipe_dffe_3;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_5 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_5 <= divbyzero_pipe_dffe_4;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_6 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_6 <= divbyzero_pipe_dffe_5;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_7 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_7 <= divbyzero_pipe_dffe_6;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_8 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_8 <= divbyzero_pipe_dffe_7;
	// synopsys translate_off
	initial
		divbyzero_pipe_dffe_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divbyzero_pipe_dffe_9 <= 1'b0;
		else if  (clk_en == 1'b1)   divbyzero_pipe_dffe_9 <= divbyzero_pipe_dffe_8;
	// synopsys translate_off
	initial
		e1_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_0 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_0 <= e1_w[16:0];
	// synopsys translate_off
	initial
		e1_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_1 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_1 <= e1_w[33:17];
	// synopsys translate_off
	initial
		e1_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_2 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_2 <= e1_w[50:34];
	// synopsys translate_off
	initial
		e1_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_3 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_3 <= e1_w[67:51];
	// synopsys translate_off
	initial
		e1_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_4 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_4 <= e1_w[84:68];
	// synopsys translate_off
	initial
		e1_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_5 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_5 <= e1_w[101:85];
	// synopsys translate_off
	initial
		e1_dffe_perf_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_perf_0 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_perf_0 <= e1_dffe_0;
	// synopsys translate_off
	initial
		e1_dffe_perf_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_perf_1 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_perf_1 <= e1_dffe_perf_0;
	// synopsys translate_off
	initial
		e1_dffe_perf_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_perf_10 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_perf_10 <= e1_dffe_perf_9;
	// synopsys translate_off
	initial
		e1_dffe_perf_11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_perf_11 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_perf_11 <= e1_dffe_perf_10;
	// synopsys translate_off
	initial
		e1_dffe_perf_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_perf_2 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_perf_2 <= e1_dffe_perf_1;
	// synopsys translate_off
	initial
		e1_dffe_perf_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_perf_3 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_perf_3 <= e1_dffe_perf_2;
	// synopsys translate_off
	initial
		e1_dffe_perf_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_perf_4 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_perf_4 <= e1_dffe_2;
	// synopsys translate_off
	initial
		e1_dffe_perf_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_perf_5 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_perf_5 <= e1_dffe_perf_4;
	// synopsys translate_off
	initial
		e1_dffe_perf_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_perf_6 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_perf_6 <= e1_dffe_perf_5;
	// synopsys translate_off
	initial
		e1_dffe_perf_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_perf_7 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_perf_7 <= e1_dffe_perf_6;
	// synopsys translate_off
	initial
		e1_dffe_perf_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_perf_8 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_perf_8 <= e1_dffe_4;
	// synopsys translate_off
	initial
		e1_dffe_perf_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) e1_dffe_perf_9 <= 17'b0;
		else if  (clk_en == 1'b1)   e1_dffe_perf_9 <= e1_dffe_perf_8;
	// synopsys translate_off
	initial
		exp_result_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_0 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_0 <= exp_result_mux_out;
	// synopsys translate_off
	initial
		exp_result_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_1 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_1 <= exp_result_dffe_0;
	// synopsys translate_off
	initial
		exp_result_dffe_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_10 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_10 <= exp_result_dffe_9;
	// synopsys translate_off
	initial
		exp_result_dffe_11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_11 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_11 <= exp_result_dffe_10;
	// synopsys translate_off
	initial
		exp_result_dffe_12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_12 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_12 <= exp_result_dffe_11;
	// synopsys translate_off
	initial
		exp_result_dffe_13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_13 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_13 <= exp_result_dffe_12;
	// synopsys translate_off
	initial
		exp_result_dffe_14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_14 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_14 <= exp_result_dffe_13;
	// synopsys translate_off
	initial
		exp_result_dffe_15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_15 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_15 <= exp_result_dffe_14;
	// synopsys translate_off
	initial
		exp_result_dffe_16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_16 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_16 <= exp_result_dffe_15;
	// synopsys translate_off
	initial
		exp_result_dffe_17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_17 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_17 <= exp_result_dffe_16;
	// synopsys translate_off
	initial
		exp_result_dffe_18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_18 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_18 <= exp_result_dffe_17;
	// synopsys translate_off
	initial
		exp_result_dffe_19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_19 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_19 <= exp_result_dffe_18;
	// synopsys translate_off
	initial
		exp_result_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_2 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_2 <= exp_result_dffe_1;
	// synopsys translate_off
	initial
		exp_result_dffe_20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_20 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_20 <= exp_result_dffe_19;
	// synopsys translate_off
	initial
		exp_result_dffe_21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_21 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_21 <= exp_result_dffe_20;
	// synopsys translate_off
	initial
		exp_result_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_3 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_3 <= exp_result_dffe_2;
	// synopsys translate_off
	initial
		exp_result_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_4 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_4 <= exp_result_dffe_3;
	// synopsys translate_off
	initial
		exp_result_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_5 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_5 <= exp_result_dffe_4;
	// synopsys translate_off
	initial
		exp_result_dffe_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_6 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_6 <= exp_result_dffe_5;
	// synopsys translate_off
	initial
		exp_result_dffe_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_7 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_7 <= exp_result_dffe_6;
	// synopsys translate_off
	initial
		exp_result_dffe_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_8 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_8 <= exp_result_dffe_7;
	// synopsys translate_off
	initial
		exp_result_dffe_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_dffe_9 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_result_dffe_9 <= exp_result_dffe_8;
	// synopsys translate_off
	initial
		frac_a_smaller_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) frac_a_smaller_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   frac_a_smaller_dffe1 <= frac_a_smaller_dffe1_wi;
	// synopsys translate_off
	initial
		man_a_dffe1_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_a_dffe1_dffe1 <= 52'b0;
		else if  (clk_en == 1'b1)   man_a_dffe1_dffe1 <= man_a_dffe1_wi;
	// synopsys translate_off
	initial
		man_b_dffe1_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_b_dffe1_dffe1 <= 52'b0;
		else if  (clk_en == 1'b1)   man_b_dffe1_dffe1 <= man_b_dffe1_wi;
	// synopsys translate_off
	initial
		man_result_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_result_dffe <= 52'b0;
		else if  (clk_en == 1'b1)   man_result_dffe <= man_result_dffe_wi;
	// synopsys translate_off
	initial
		nan_pipe_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_0 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_0 <= (((a_is_nan_w | b_is_nan_w) | (a_is_infinity_w & b_is_infinity_w)) | ((~ exp_a_not_zero_w[10]) & (~ exp_b_not_zero_w[10])));
	// synopsys translate_off
	initial
		nan_pipe_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_1 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_1 <= nan_pipe_dffe_0;
	// synopsys translate_off
	initial
		nan_pipe_dffe_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_10 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_10 <= nan_pipe_dffe_9;
	// synopsys translate_off
	initial
		nan_pipe_dffe_11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_11 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_11 <= nan_pipe_dffe_10;
	// synopsys translate_off
	initial
		nan_pipe_dffe_12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_12 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_12 <= nan_pipe_dffe_11;
	// synopsys translate_off
	initial
		nan_pipe_dffe_13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_13 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_13 <= nan_pipe_dffe_12;
	// synopsys translate_off
	initial
		nan_pipe_dffe_14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_14 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_14 <= nan_pipe_dffe_13;
	// synopsys translate_off
	initial
		nan_pipe_dffe_15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_15 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_15 <= nan_pipe_dffe_14;
	// synopsys translate_off
	initial
		nan_pipe_dffe_16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_16 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_16 <= nan_pipe_dffe_15;
	// synopsys translate_off
	initial
		nan_pipe_dffe_17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_17 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_17 <= nan_pipe_dffe_16;
	// synopsys translate_off
	initial
		nan_pipe_dffe_18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_18 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_18 <= nan_pipe_dffe_17;
	// synopsys translate_off
	initial
		nan_pipe_dffe_19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_19 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_19 <= nan_pipe_dffe_18;
	// synopsys translate_off
	initial
		nan_pipe_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_2 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_2 <= nan_pipe_dffe_1;
	// synopsys translate_off
	initial
		nan_pipe_dffe_20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_20 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_20 <= nan_pipe_dffe_19;
	// synopsys translate_off
	initial
		nan_pipe_dffe_21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_21 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_21 <= nan_pipe_dffe_20;
	// synopsys translate_off
	initial
		nan_pipe_dffe_22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_22 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_22 <= nan_pipe_dffe_21;
	// synopsys translate_off
	initial
		nan_pipe_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_3 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_3 <= nan_pipe_dffe_2;
	// synopsys translate_off
	initial
		nan_pipe_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_4 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_4 <= nan_pipe_dffe_3;
	// synopsys translate_off
	initial
		nan_pipe_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_5 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_5 <= nan_pipe_dffe_4;
	// synopsys translate_off
	initial
		nan_pipe_dffe_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_6 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_6 <= nan_pipe_dffe_5;
	// synopsys translate_off
	initial
		nan_pipe_dffe_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_7 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_7 <= nan_pipe_dffe_6;
	// synopsys translate_off
	initial
		nan_pipe_dffe_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_8 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_8 <= nan_pipe_dffe_7;
	// synopsys translate_off
	initial
		nan_pipe_dffe_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_pipe_dffe_9 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_pipe_dffe_9 <= nan_pipe_dffe_8;
	// synopsys translate_off
	initial
		over_under_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_0 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_0 <= overflow_underflow;
	// synopsys translate_off
	initial
		over_under_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_1 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_1 <= over_under_dffe_0;
	// synopsys translate_off
	initial
		over_under_dffe_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_10 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_10 <= over_under_dffe_9;
	// synopsys translate_off
	initial
		over_under_dffe_11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_11 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_11 <= over_under_dffe_10;
	// synopsys translate_off
	initial
		over_under_dffe_12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_12 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_12 <= over_under_dffe_11;
	// synopsys translate_off
	initial
		over_under_dffe_13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_13 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_13 <= over_under_dffe_12;
	// synopsys translate_off
	initial
		over_under_dffe_14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_14 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_14 <= over_under_dffe_13;
	// synopsys translate_off
	initial
		over_under_dffe_15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_15 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_15 <= over_under_dffe_14;
	// synopsys translate_off
	initial
		over_under_dffe_16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_16 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_16 <= over_under_dffe_15;
	// synopsys translate_off
	initial
		over_under_dffe_17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_17 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_17 <= over_under_dffe_16;
	// synopsys translate_off
	initial
		over_under_dffe_18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_18 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_18 <= over_under_dffe_17;
	// synopsys translate_off
	initial
		over_under_dffe_19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_19 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_19 <= over_under_dffe_18;
	// synopsys translate_off
	initial
		over_under_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_2 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_2 <= over_under_dffe_1;
	// synopsys translate_off
	initial
		over_under_dffe_20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_20 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_20 <= over_under_dffe_19;
	// synopsys translate_off
	initial
		over_under_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_3 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_3 <= over_under_dffe_2;
	// synopsys translate_off
	initial
		over_under_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_4 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_4 <= over_under_dffe_3;
	// synopsys translate_off
	initial
		over_under_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_5 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_5 <= over_under_dffe_4;
	// synopsys translate_off
	initial
		over_under_dffe_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_6 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_6 <= over_under_dffe_5;
	// synopsys translate_off
	initial
		over_under_dffe_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_7 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_7 <= over_under_dffe_6;
	// synopsys translate_off
	initial
		over_under_dffe_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_8 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_8 <= over_under_dffe_7;
	// synopsys translate_off
	initial
		over_under_dffe_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) over_under_dffe_9 <= 1'b0;
		else if  (clk_en == 1'b1)   over_under_dffe_9 <= over_under_dffe_8;
	// synopsys translate_off
	initial
		q_partial_perf_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_partial_perf_dffe_0 <= 34'b0;
		else if  (clk_en == 1'b1)   q_partial_perf_dffe_0 <= wire_q_partial_0_result;
	// synopsys translate_off
	initial
		q_partial_perf_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_partial_perf_dffe_1 <= 34'b0;
		else if  (clk_en == 1'b1)   q_partial_perf_dffe_1 <= wire_q_partial_1_result;
	// synopsys translate_off
	initial
		q_partial_perf_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_partial_perf_dffe_2 <= 34'b0;
		else if  (clk_en == 1'b1)   q_partial_perf_dffe_2 <= wire_q_partial_2_result;
	// synopsys translate_off
	initial
		q_partial_perf_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_partial_perf_dffe_3 <= 34'b0;
		else if  (clk_en == 1'b1)   q_partial_perf_dffe_3 <= wire_q_partial_3_result;
	// synopsys translate_off
	initial
		quotient_j_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_j_dffe <= 17'b0;
		else if  (clk_en == 1'b1)   quotient_j_dffe <= q_partial_perf_dffe_0[32:16];
	// synopsys translate_off
	initial
		quotient_k_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_0 <= 17'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_0 <= quotient_k_dffe_perf_3;
	// synopsys translate_off
	initial
		quotient_k_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_1 <= 31'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_1 <= quotient_k_dffe_perf_7;
	// synopsys translate_off
	initial
		quotient_k_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_2 <= 45'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_2 <= quotient_k_dffe_perf_11;
	// synopsys translate_off
	initial
		quotient_k_dffe_perf_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_perf_0 <= 17'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_perf_0 <= quotient_accumulate_w[58:42];
	// synopsys translate_off
	initial
		quotient_k_dffe_perf_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_perf_1 <= 17'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_perf_1 <= quotient_k_dffe_perf_0;
	// synopsys translate_off
	initial
		quotient_k_dffe_perf_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_perf_10 <= 45'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_perf_10 <= quotient_k_dffe_perf_9;
	// synopsys translate_off
	initial
		quotient_k_dffe_perf_11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_perf_11 <= 45'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_perf_11 <= quotient_k_dffe_perf_10;
	// synopsys translate_off
	initial
		quotient_k_dffe_perf_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_perf_2 <= 17'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_perf_2 <= quotient_k_dffe_perf_1;
	// synopsys translate_off
	initial
		quotient_k_dffe_perf_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_perf_3 <= 17'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_perf_3 <= quotient_k_dffe_perf_2;
	// synopsys translate_off
	initial
		quotient_k_dffe_perf_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_perf_4 <= 31'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_perf_4 <= wire_quotient_accumulate_0_result;
	// synopsys translate_off
	initial
		quotient_k_dffe_perf_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_perf_5 <= 31'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_perf_5 <= quotient_k_dffe_perf_4;
	// synopsys translate_off
	initial
		quotient_k_dffe_perf_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_perf_6 <= 31'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_perf_6 <= quotient_k_dffe_perf_5;
	// synopsys translate_off
	initial
		quotient_k_dffe_perf_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_perf_7 <= 31'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_perf_7 <= quotient_k_dffe_perf_6;
	// synopsys translate_off
	initial
		quotient_k_dffe_perf_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_perf_8 <= 45'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_perf_8 <= wire_quotient_accumulate_1_result;
	// synopsys translate_off
	initial
		quotient_k_dffe_perf_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_k_dffe_perf_9 <= 45'b0;
		else if  (clk_en == 1'b1)   quotient_k_dffe_perf_9 <= quotient_k_dffe_perf_8;
	// synopsys translate_off
	initial
		remainder_j_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_0 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_0 <= remainder_j_w[78:0];
	// synopsys translate_off
	initial
		remainder_j_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_1 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_1 <= remainder_j_dffe_perf_2;
	// synopsys translate_off
	initial
		remainder_j_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_2 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_2 <= remainder_j_w[157:79];
	// synopsys translate_off
	initial
		remainder_j_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_3 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_3 <= remainder_j_dffe_perf_5;
	// synopsys translate_off
	initial
		remainder_j_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_4 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_4 <= remainder_j_w[236:158];
	// synopsys translate_off
	initial
		remainder_j_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_5 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_5 <= remainder_j_dffe_perf_8;
	// synopsys translate_off
	initial
		remainder_j_dffe_perf_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_perf_0 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_perf_0 <= remainder_j_dffe_0;
	// synopsys translate_off
	initial
		remainder_j_dffe_perf_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_perf_1 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_perf_1 <= remainder_j_dffe_perf_0;
	// synopsys translate_off
	initial
		remainder_j_dffe_perf_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_perf_2 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_perf_2 <= remainder_j_dffe_perf_1;
	// synopsys translate_off
	initial
		remainder_j_dffe_perf_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_perf_3 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_perf_3 <= remainder_j_dffe_2;
	// synopsys translate_off
	initial
		remainder_j_dffe_perf_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_perf_4 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_perf_4 <= remainder_j_dffe_perf_3;
	// synopsys translate_off
	initial
		remainder_j_dffe_perf_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_perf_5 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_perf_5 <= remainder_j_dffe_perf_4;
	// synopsys translate_off
	initial
		remainder_j_dffe_perf_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_perf_6 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_perf_6 <= remainder_j_dffe_4;
	// synopsys translate_off
	initial
		remainder_j_dffe_perf_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_perf_7 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_perf_7 <= remainder_j_dffe_perf_6;
	// synopsys translate_off
	initial
		remainder_j_dffe_perf_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_j_dffe_perf_8 <= 79'b0;
		else if  (clk_en == 1'b1)   remainder_j_dffe_perf_8 <= remainder_j_dffe_perf_7;
	// synopsys translate_off
	initial
		sign_pipe_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_0 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_0 <= (dataa[63] ^ datab[63]);
	// synopsys translate_off
	initial
		sign_pipe_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_1 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_1 <= sign_pipe_dffe_0;
	// synopsys translate_off
	initial
		sign_pipe_dffe_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_10 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_10 <= sign_pipe_dffe_9;
	// synopsys translate_off
	initial
		sign_pipe_dffe_11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_11 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_11 <= sign_pipe_dffe_10;
	// synopsys translate_off
	initial
		sign_pipe_dffe_12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_12 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_12 <= sign_pipe_dffe_11;
	// synopsys translate_off
	initial
		sign_pipe_dffe_13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_13 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_13 <= sign_pipe_dffe_12;
	// synopsys translate_off
	initial
		sign_pipe_dffe_14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_14 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_14 <= sign_pipe_dffe_13;
	// synopsys translate_off
	initial
		sign_pipe_dffe_15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_15 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_15 <= sign_pipe_dffe_14;
	// synopsys translate_off
	initial
		sign_pipe_dffe_16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_16 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_16 <= sign_pipe_dffe_15;
	// synopsys translate_off
	initial
		sign_pipe_dffe_17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_17 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_17 <= sign_pipe_dffe_16;
	// synopsys translate_off
	initial
		sign_pipe_dffe_18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_18 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_18 <= sign_pipe_dffe_17;
	// synopsys translate_off
	initial
		sign_pipe_dffe_19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_19 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_19 <= sign_pipe_dffe_18;
	// synopsys translate_off
	initial
		sign_pipe_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_2 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_2 <= sign_pipe_dffe_1;
	// synopsys translate_off
	initial
		sign_pipe_dffe_20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_20 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_20 <= sign_pipe_dffe_19;
	// synopsys translate_off
	initial
		sign_pipe_dffe_21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_21 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_21 <= sign_pipe_dffe_20;
	// synopsys translate_off
	initial
		sign_pipe_dffe_22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_22 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_22 <= sign_pipe_dffe_21;
	// synopsys translate_off
	initial
		sign_pipe_dffe_23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_23 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_23 <= sign_pipe_dffe_22;
	// synopsys translate_off
	initial
		sign_pipe_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_3 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_3 <= sign_pipe_dffe_2;
	// synopsys translate_off
	initial
		sign_pipe_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_4 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_4 <= sign_pipe_dffe_3;
	// synopsys translate_off
	initial
		sign_pipe_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_5 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_5 <= sign_pipe_dffe_4;
	// synopsys translate_off
	initial
		sign_pipe_dffe_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_6 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_6 <= sign_pipe_dffe_5;
	// synopsys translate_off
	initial
		sign_pipe_dffe_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_7 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_7 <= sign_pipe_dffe_6;
	// synopsys translate_off
	initial
		sign_pipe_dffe_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_8 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_8 <= sign_pipe_dffe_7;
	// synopsys translate_off
	initial
		sign_pipe_dffe_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe_dffe_9 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe_dffe_9 <= sign_pipe_dffe_8;
	lpm_add_sub   bias_addition
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(exp_sub_w),
	.datab(select_bias_out_2_w),
	.overflow(wire_bias_addition_overflow),
	.result(wire_bias_addition_result)
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
		bias_addition.lpm_direction = "ADD",
		bias_addition.lpm_pipeline = 1,
		bias_addition.lpm_representation = "SIGNED",
		bias_addition.lpm_width = 12,
		bias_addition.lpm_type = "lpm_add_sub";
	lpm_add_sub   exp_sub
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(exp_sub_a_w),
	.datab(exp_sub_b_w),
	.overflow(),
	.result(wire_exp_sub_result)
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
		exp_sub.lpm_direction = "SUB",
		exp_sub.lpm_pipeline = 1,
		exp_sub.lpm_representation = "SIGNED",
		exp_sub.lpm_width = 12,
		exp_sub.lpm_type = "lpm_add_sub";
	lpm_add_sub   quotient_accumulate_0
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa({quotient_accumulate_w[117:101], {14{1'b0}}}),
	.datab({{14{1'b0}}, q_partial_perf_dffe_1[32:16]}),
	.overflow(),
	.result(wire_quotient_accumulate_0_result)
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
		quotient_accumulate_0.lpm_direction = "ADD",
		quotient_accumulate_0.lpm_pipeline = 1,
		quotient_accumulate_0.lpm_representation = "UNSIGNED",
		quotient_accumulate_0.lpm_width = 31,
		quotient_accumulate_0.lpm_type = "lpm_add_sub";
	lpm_add_sub   quotient_accumulate_1
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa({quotient_accumulate_w[176:146], {14{1'b0}}}),
	.datab({{28{1'b0}}, q_partial_perf_dffe_2[32:16]}),
	.overflow(),
	.result(wire_quotient_accumulate_1_result)
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
		quotient_accumulate_1.lpm_direction = "ADD",
		quotient_accumulate_1.lpm_pipeline = 1,
		quotient_accumulate_1.lpm_representation = "UNSIGNED",
		quotient_accumulate_1.lpm_width = 45,
		quotient_accumulate_1.lpm_type = "lpm_add_sub";
	lpm_add_sub   quotient_process
	( 
	.cin(quotient_process_cin_w),
	.cout(),
	.dataa({quotient_accumulate_w[235:191], {14{1'b0}}}),
	.datab({{42{1'b0}}, q_partial_perf_dffe_3[32:21], {5{1'b1}}}),
	.overflow(),
	.result(wire_quotient_process_result)
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
		quotient_process.lpm_direction = "ADD",
		quotient_process.lpm_representation = "UNSIGNED",
		quotient_process.lpm_width = 59,
		quotient_process.lpm_type = "lpm_add_sub";
	lpm_add_sub   remainder_sub_0
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa({remainder_j_dffe_1[78:15], {15{1'b0}}}),
	.datab(wire_remainder_mult_0_result[78:0]),
	.overflow(),
	.result(wire_remainder_sub_0_result)
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
		remainder_sub_0.lpm_direction = "SUB",
		remainder_sub_0.lpm_pipeline = 1,
		remainder_sub_0.lpm_representation = "UNSIGNED",
		remainder_sub_0.lpm_width = 79,
		remainder_sub_0.lpm_type = "lpm_add_sub";
	lpm_add_sub   remainder_sub_1
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa({remainder_j_dffe_3[78:15], {15{1'b0}}}),
	.datab(wire_remainder_mult_1_result[78:0]),
	.overflow(),
	.result(wire_remainder_sub_1_result)
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
		remainder_sub_1.lpm_direction = "SUB",
		remainder_sub_1.lpm_pipeline = 1,
		remainder_sub_1.lpm_representation = "UNSIGNED",
		remainder_sub_1.lpm_width = 79,
		remainder_sub_1.lpm_type = "lpm_add_sub";
	lpm_add_sub   remainder_sub_2
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa({remainder_j_dffe_5[78:15], {15{1'b0}}}),
	.datab(wire_remainder_mult_2_result[78:0]),
	.overflow(),
	.result(wire_remainder_sub_2_result)
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
		remainder_sub_2.lpm_direction = "SUB",
		remainder_sub_2.lpm_pipeline = 1,
		remainder_sub_2.lpm_representation = "UNSIGNED",
		remainder_sub_2.lpm_width = 79,
		remainder_sub_2.lpm_type = "lpm_add_sub";
	lpm_compare   cmpr2
	( 
	.aeb(),
	.agb(),
	.ageb(),
	.alb(wire_cmpr2_alb),
	.aleb(),
	.aneb(),
	.dataa(dataa[51:0]),
	.datab(datab[51:0])
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
		cmpr2.lpm_representation = "UNSIGNED",
		cmpr2.lpm_width = 52,
		cmpr2.lpm_type = "lpm_compare";
	lpm_mult   a1_prod
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(man_a_adjusted_w),
	.datab({1'b1, e0_dffe1_wo}),
	.result(wire_a1_prod_result)
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
		a1_prod.lpm_pipeline = 2,
		a1_prod.lpm_representation = "UNSIGNED",
		a1_prod.lpm_widtha = 54,
		a1_prod.lpm_widthb = 10,
		a1_prod.lpm_widthp = 64,
		a1_prod.lpm_type = "lpm_mult",
		a1_prod.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mult   b1_prod
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(man_b_adjusted_w),
	.datab({1'b1, e0_dffe1_wo}),
	.result(wire_b1_prod_result)
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
		b1_prod.lpm_pipeline = 2,
		b1_prod.lpm_representation = "UNSIGNED",
		b1_prod.lpm_widtha = 53,
		b1_prod.lpm_widthb = 10,
		b1_prod.lpm_widthp = 63,
		b1_prod.lpm_type = "lpm_mult",
		b1_prod.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mult   q_partial_0
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(remainder_j_w[78:62]),
	.datab(e1_w[16:0]),
	.result(wire_q_partial_0_result)
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
		q_partial_0.lpm_pipeline = 1,
		q_partial_0.lpm_representation = "UNSIGNED",
		q_partial_0.lpm_widtha = 17,
		q_partial_0.lpm_widthb = 17,
		q_partial_0.lpm_widthp = 34,
		q_partial_0.lpm_type = "lpm_mult",
		q_partial_0.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mult   q_partial_1
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(remainder_j_w[157:141]),
	.datab(e1_w[50:34]),
	.result(wire_q_partial_1_result)
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
		q_partial_1.lpm_pipeline = 1,
		q_partial_1.lpm_representation = "UNSIGNED",
		q_partial_1.lpm_widtha = 17,
		q_partial_1.lpm_widthb = 17,
		q_partial_1.lpm_widthp = 34,
		q_partial_1.lpm_type = "lpm_mult",
		q_partial_1.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mult   q_partial_2
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(remainder_j_w[236:220]),
	.datab(e1_w[84:68]),
	.result(wire_q_partial_2_result)
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
		q_partial_2.lpm_pipeline = 1,
		q_partial_2.lpm_representation = "UNSIGNED",
		q_partial_2.lpm_widtha = 17,
		q_partial_2.lpm_widthb = 17,
		q_partial_2.lpm_widthp = 34,
		q_partial_2.lpm_type = "lpm_mult",
		q_partial_2.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mult   q_partial_3
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(remainder_j_w[315:299]),
	.datab(e1_w[118:102]),
	.result(wire_q_partial_3_result)
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
		q_partial_3.lpm_pipeline = 1,
		q_partial_3.lpm_representation = "UNSIGNED",
		q_partial_3.lpm_widtha = 17,
		q_partial_3.lpm_widthb = 17,
		q_partial_3.lpm_widthp = 34,
		q_partial_3.lpm_type = "lpm_mult",
		q_partial_3.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mult   remainder_mult_0
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(b1_dffe_w[62:0]),
	.datab(q_partial_perf_dffe_0[32:16]),
	.result(wire_remainder_mult_0_result)
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
		remainder_mult_0.lpm_pipeline = 3,
		remainder_mult_0.lpm_representation = "UNSIGNED",
		remainder_mult_0.lpm_widtha = 63,
		remainder_mult_0.lpm_widthb = 17,
		remainder_mult_0.lpm_widthp = 80,
		remainder_mult_0.lpm_type = "lpm_mult",
		remainder_mult_0.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mult   remainder_mult_1
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(b1_dffe_w[125:63]),
	.datab(q_partial_perf_dffe_1[32:16]),
	.result(wire_remainder_mult_1_result)
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
		remainder_mult_1.lpm_pipeline = 3,
		remainder_mult_1.lpm_representation = "UNSIGNED",
		remainder_mult_1.lpm_widtha = 63,
		remainder_mult_1.lpm_widthb = 17,
		remainder_mult_1.lpm_widthp = 80,
		remainder_mult_1.lpm_type = "lpm_mult",
		remainder_mult_1.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mult   remainder_mult_2
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(b1_dffe_w[188:126]),
	.datab(q_partial_perf_dffe_2[32:16]),
	.result(wire_remainder_mult_2_result)
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
		remainder_mult_2.lpm_pipeline = 3,
		remainder_mult_2.lpm_representation = "UNSIGNED",
		remainder_mult_2.lpm_widtha = 63,
		remainder_mult_2.lpm_widthb = 17,
		remainder_mult_2.lpm_widthp = 80,
		remainder_mult_2.lpm_type = "lpm_mult",
		remainder_mult_2.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	assign		wire_exp_result_muxa_dataout = (exp_result_mux_sel_w === 1'b1) ? underflow_zeros_w : exp_result_w;
	assign		wire_man_a_adjusteda_dataout = (frac_a_smaller_dffe1_wo === 1'b1) ? {1'b1, man_a_dffe1_wo, 1'b0} : {1'b0, 1'b1, man_a_dffe1_wo};
	assign		wire_man_result_muxa_dataout = (man_result_mux_select === 1'b1) ? {nan_pipe_dffe_22, man_zeros_w[50:0]} : wire_quotient_process_result[56:5];
	assign		wire_select_bias_2a_dataout = (both_exp_zeros === 1'b1) ? value_zero_w : select_bias_out_w;
	assign		wire_select_biasa_dataout = (frac_a_smaller_dffe1_wo === 1'b1) ? value_normal_w : value_add_one_w;
	assign
		a_is_infinity_w = (exp_a_all_one_w[10] & (~ man_a_not_zero_w[51])),
		a_is_nan_w = (exp_a_all_one_w[10] & man_a_not_zero_w[51]),
		a_zero_b_not = (exp_b_not_zero_w[10] & (~ exp_a_not_zero_w[10])),
		b1_dffe_w = {b1_dffe_13, b1_dffe_7, b1_dffe_1},
		b_is_infinity_w = (exp_b_all_one_w[10] & (~ man_b_not_zero_w[51])),
		b_is_nan_w = (exp_b_all_one_w[10] & man_b_not_zero_w[51]),
		bias_addition_overf_w = wire_bias_addition_overflow,
		bias_addition_w = wire_bias_addition_result[10:0],
		both_exp_zeros = both_exp_zeros_dffe,
		e0_dffe1_wo = e0_w,
		e0_w = wire_altsyncram3_q_a,
		e1_w = {e1_dffe_5, e1_dffe_perf_11, e1_dffe_3, e1_dffe_perf_7, e1_dffe_1, e1_dffe_perf_3, (~ wire_b1_prod_result[62:46])},
		exp_a_all_one_w = {(dataa[62] & exp_a_all_one_w[9]), (dataa[61] & exp_a_all_one_w[8]), (dataa[60] & exp_a_all_one_w[7]), (dataa[59] & exp_a_all_one_w[6]), (dataa[58] & exp_a_all_one_w[5]), (dataa[57] & exp_a_all_one_w[4]), (dataa[56] & exp_a_all_one_w[3]), (dataa[55] & exp_a_all_one_w[2]), (dataa[54] & exp_a_all_one_w[1]), (dataa[53] & exp_a_all_one_w[0]), dataa[52]},
		exp_a_not_zero_w = {(dataa[62] | exp_a_not_zero_w[9]), (dataa[61] | exp_a_not_zero_w[8]), (dataa[60] | exp_a_not_zero_w[7]), (dataa[59] | exp_a_not_zero_w[6]), (dataa[58] | exp_a_not_zero_w[5]), (dataa[57] | exp_a_not_zero_w[4]), (dataa[56] | exp_a_not_zero_w[3]), (dataa[55] | exp_a_not_zero_w[2]), (dataa[54] | exp_a_not_zero_w[1]), (dataa[53] | exp_a_not_zero_w[0]), dataa[52]},
		exp_add_output_all_one = {(bias_addition_w[10] & exp_add_output_all_one[9]), (bias_addition_w[9] & exp_add_output_all_one[8]), (bias_addition_w[8] & exp_add_output_all_one[7]), (bias_addition_w[7] & exp_add_output_all_one[6]), (bias_addition_w[6] & exp_add_output_all_one[5]), (bias_addition_w[5] & exp_add_output_all_one[4]), (bias_addition_w[4] & exp_add_output_all_one[3]), (bias_addition_w[3] & exp_add_output_all_one[2]), (bias_addition_w[2] & exp_add_output_all_one[1]), (bias_addition_w[1] & exp_add_output_all_one[0]), bias_addition_w[0]},
		exp_add_output_not_zero = {(bias_addition_w[10] | exp_add_output_not_zero[9]), (bias_addition_w[9] | exp_add_output_not_zero[8]), (bias_addition_w[8] | exp_add_output_not_zero[7]), (bias_addition_w[7] | exp_add_output_not_zero[6]), (bias_addition_w[6] | exp_add_output_not_zero[5]), (bias_addition_w[5] | exp_add_output_not_zero[4]), (bias_addition_w[4] | exp_add_output_not_zero[3]), (bias_addition_w[3] | exp_add_output_not_zero[2]), (bias_addition_w[2] | exp_add_output_not_zero[1]), (bias_addition_w[1] | exp_add_output_not_zero[0]), bias_addition_w[0]},
		exp_b_all_one_w = {(datab[62] & exp_b_all_one_w[9]), (datab[61] & exp_b_all_one_w[8]), (datab[60] & exp_b_all_one_w[7]), (datab[59] & exp_b_all_one_w[6]), (datab[58] & exp_b_all_one_w[5]), (datab[57] & exp_b_all_one_w[4]), (datab[56] & exp_b_all_one_w[3]), (datab[55] & exp_b_all_one_w[2]), (datab[54] & exp_b_all_one_w[1]), (datab[53] & exp_b_all_one_w[0]), datab[52]},
		exp_b_not_zero_w = {(datab[62] | exp_b_not_zero_w[9]), (datab[61] | exp_b_not_zero_w[8]), (datab[60] | exp_b_not_zero_w[7]), (datab[59] | exp_b_not_zero_w[6]), (datab[58] | exp_b_not_zero_w[5]), (datab[57] | exp_b_not_zero_w[4]), (datab[56] | exp_b_not_zero_w[3]), (datab[55] | exp_b_not_zero_w[2]), (datab[54] | exp_b_not_zero_w[1]), (datab[53] | exp_b_not_zero_w[0]), datab[52]},
		exp_result_mux_out = wire_exp_result_muxa_dataout,
		exp_result_mux_sel_w = ((((a_zero_b_not_dffe_1 | b_is_infinity_dffe_1) | ((~ bias_addition_overf_w) & exp_sign_w)) | (((~ exp_add_output_not_zero[10]) & (~ bias_addition_overf_w)) & (~ exp_sign_w))) & (~ nan_pipe_dffe_1)),
		exp_result_w = (({11{((~ bias_addition_overf_w) & (~ exp_sign_w))}} & bias_addition_w) | ({11{(((bias_addition_overf_w | divbyzero_pipe_dffe_1) | nan_pipe_dffe_1) | a_is_infinity_dffe_1)}} & overflow_ones_w)),
		exp_sign_w = wire_bias_addition_result[11],
		exp_sub_a_w = {1'b0, dataa[62:52]},
		exp_sub_b_w = {1'b0, datab[62:52]},
		exp_sub_w = wire_exp_sub_result,
		frac_a_smaller_dffe1_wi = frac_a_smaller_w,
		frac_a_smaller_dffe1_wo = frac_a_smaller_dffe1,
		frac_a_smaller_w = wire_cmpr2_alb,
		guard_bit = q_partial_perf_dffe_3[21],
		man_a_adjusted_w = wire_man_a_adjusteda_dataout,
		man_a_dffe1_wi = dataa[51:0],
		man_a_dffe1_wo = man_a_dffe1_dffe1,
		man_a_not_zero_w = {(dataa[51] | man_a_not_zero_w[50]), (dataa[50] | man_a_not_zero_w[49]), (dataa[49] | man_a_not_zero_w[48]), (dataa[48] | man_a_not_zero_w[47]), (dataa[47] | man_a_not_zero_w[46]), (dataa[46] | man_a_not_zero_w[45]), (dataa[45] | man_a_not_zero_w[44]), (dataa[44] | man_a_not_zero_w[43]), (dataa[43] | man_a_not_zero_w[42]), (dataa[42] | man_a_not_zero_w[41]), (dataa[41] | man_a_not_zero_w[40]), (dataa[40] | man_a_not_zero_w[39]), (dataa[39] | man_a_not_zero_w[38]), (dataa[38] | man_a_not_zero_w[37]), (dataa[37] | man_a_not_zero_w[36]), (dataa[36] | man_a_not_zero_w[35]), (dataa[35] | man_a_not_zero_w[34]), (dataa[34] | man_a_not_zero_w[33]), (dataa[33] | man_a_not_zero_w[32]), (dataa[32] | man_a_not_zero_w[31]), (dataa[31] | man_a_not_zero_w[30]), (dataa[30] | man_a_not_zero_w[29]), (dataa[29] | man_a_not_zero_w[28]), (dataa[28] | man_a_not_zero_w[27]), (dataa[27] | man_a_not_zero_w[26]), (dataa[26] | man_a_not_zero_w[25]), (dataa[25] | man_a_not_zero_w[24]), (dataa[24] | man_a_not_zero_w[23]), (dataa[23] | man_a_not_zero_w[22]), (dataa[22] | man_a_not_zero_w[21]), (dataa[21] | man_a_not_zero_w[20]), (dataa[20] | man_a_not_zero_w[19]), (dataa[19] | man_a_not_zero_w[18]), (dataa[18] | man_a_not_zero_w[17]), (dataa[17] | man_a_not_zero_w[16]), (dataa[16] | man_a_not_zero_w[15]), (dataa[15] | man_a_not_zero_w[14]), (dataa[14] | man_a_not_zero_w[13]), (dataa[13] | man_a_not_zero_w[12]), (dataa[12] | man_a_not_zero_w[11]), (dataa[11] | man_a_not_zero_w[10]), (dataa[10] | man_a_not_zero_w[9]), (dataa[9] | man_a_not_zero_w[8]), (dataa[8] | man_a_not_zero_w[7]), (dataa[7] | man_a_not_zero_w[6]), (dataa[6] | man_a_not_zero_w[5]), (dataa[5] | man_a_not_zero_w[4]), (dataa[4] | man_a_not_zero_w[3]), (dataa[3] | man_a_not_zero_w[2]), (dataa[2] | man_a_not_zero_w[1]), (dataa[1] | man_a_not_zero_w[0]), dataa[0]},
		man_b_adjusted_w = {1'b1, man_b_dffe1_wo},
		man_b_dffe1_wi = datab[51:0],
		man_b_dffe1_wo = man_b_dffe1_dffe1,
		man_b_not_zero_w = {(datab[51] | man_b_not_zero_w[50]), (datab[50] | man_b_not_zero_w[49]), (datab[49] | man_b_not_zero_w[48]), (datab[48] | man_b_not_zero_w[47]), (datab[47] | man_b_not_zero_w[46]), (datab[46] | man_b_not_zero_w[45]), (datab[45] | man_b_not_zero_w[44]), (datab[44] | man_b_not_zero_w[43]), (datab[43] | man_b_not_zero_w[42]), (datab[42] | man_b_not_zero_w[41]), (datab[41] | man_b_not_zero_w[40]), (datab[40] | man_b_not_zero_w[39]), (datab[39] | man_b_not_zero_w[38]), (datab[38] | man_b_not_zero_w[37]), (datab[37] | man_b_not_zero_w[36]), (datab[36] | man_b_not_zero_w[35]), (datab[35] | man_b_not_zero_w[34]), (datab[34] | man_b_not_zero_w[33]), (datab[33] | man_b_not_zero_w[32]), (datab[32] | man_b_not_zero_w[31]), (datab[31] | man_b_not_zero_w[30]), (datab[30] | man_b_not_zero_w[29]), (datab[29] | man_b_not_zero_w[28]), (datab[28] | man_b_not_zero_w[27]), (datab[27] | man_b_not_zero_w[26]), (datab[26] | man_b_not_zero_w[25]), (datab[25] | man_b_not_zero_w[24]), (datab[24] | man_b_not_zero_w[23]), (datab[23] | man_b_not_zero_w[22]), (datab[22] | man_b_not_zero_w[21]), (datab[21] | man_b_not_zero_w[20]), (datab[20] | man_b_not_zero_w[19]), (datab[19] | man_b_not_zero_w[18]), (datab[18] | man_b_not_zero_w[17]), (datab[17] | man_b_not_zero_w[16]), (datab[16] | man_b_not_zero_w[15]), (datab[15] | man_b_not_zero_w[14]), (datab[14] | man_b_not_zero_w[13]), (datab[13] | man_b_not_zero_w[12]), (datab[12] | man_b_not_zero_w[11]), (datab[11] | man_b_not_zero_w[10]), (datab[10] | man_b_not_zero_w[9]), (datab[9] | man_b_not_zero_w[8]), (datab[8] | man_b_not_zero_w[7]), (datab[7] | man_b_not_zero_w[6]), (datab[6] | man_b_not_zero_w[5]), (datab[5] | man_b_not_zero_w[4]), (datab[4] | man_b_not_zero_w[3]), (datab[3] | man_b_not_zero_w[2]), (datab[2] | man_b_not_zero_w[1]), (datab[1] | man_b_not_zero_w[0]), datab[0]},
		man_result_dffe_wi = man_result_w,
		man_result_dffe_wo = man_result_dffe,
		man_result_mux_select = (((((over_under_dffe_20 | a_zero_b_not_dffe_22) | nan_pipe_dffe_22) | b_is_infinity_dffe_22) | a_is_infinity_dffe_22) | divbyzero_pipe_dffe_22),
		man_result_w = wire_man_result_muxa_dataout,
		man_zeros_w = {52{1'b0}},
		overflow_ones_w = {11{1'b1}},
		overflow_underflow = (overflow_w | underflow_w),
		overflow_w = ((bias_addition_overf_w | ((exp_add_output_all_one[10] & (~ bias_addition_overf_w)) & (~ exp_sign_w))) & (((~ nan_pipe_dffe_1) & (~ a_is_infinity_dffe_1)) & (~ divbyzero_pipe_dffe_1))),
		quotient_accumulate_w = {quotient_k_dffe_2, {14{1'b0}}, quotient_k_dffe_1, {28{1'b0}}, quotient_k_dffe_0, {42{1'b0}}, quotient_j_dffe, {42{1'b0}}},
		quotient_process_cin_w = (round_bit & (guard_bit | sticky_bits[3])),
		remainder_j_w = {wire_remainder_sub_2_result[64:0], {14{1'b0}}, wire_remainder_sub_1_result[64:0], {14{1'b0}}, wire_remainder_sub_0_result[64:0], {14{1'b0}}, wire_a1_prod_result[63:0], {15{1'b0}}},
		result = {sign_pipe_dffe_23, exp_result_dffe_21, man_result_dffe_wo},
		round_bit = q_partial_perf_dffe_3[20],
		select_bias_out_2_w = wire_select_bias_2a_dataout,
		select_bias_out_w = wire_select_biasa_dataout,
		sticky_bits = {(q_partial_perf_dffe_3[19] | sticky_bits[2]), (q_partial_perf_dffe_3[18] | sticky_bits[1]), (q_partial_perf_dffe_3[17] | sticky_bits[0]), q_partial_perf_dffe_3[16]},
		underflow_w = ((((((~ bias_addition_overf_w) & exp_sign_w) | (((~ exp_add_output_not_zero[10]) & (~ bias_addition_overf_w)) & (~ exp_sign_w))) & (~ nan_pipe_dffe_1)) & (~ a_zero_b_not_dffe_1)) & (~ b_is_infinity_dffe_1)),
		underflow_zeros_w = {11{1'b0}},
		value_add_one_w = 12'b001111111111,
		value_normal_w = 12'b001111111110,
		value_zero_w = {12{1'b0}};
endmodule //acl_fp_div_s5_double_altfp_div_pst_luf

//synthesis_resources = altsyncram 1 lpm_add_sub 8 lpm_compare 1 lpm_mult 9 mux21 141 reg 3551 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  acl_fp_div_s5_double_altfp_div_6th
	( 
	clk_en,
	clock,
	dataa,
	datab,
	result) ;
	input   clk_en;
	input   clock;
	input   [63:0]  dataa;
	input   [63:0]  datab;
	output   [63:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   clk_en;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [63:0]   wire_altfp_div_pst1_result;
	wire aclr;

	acl_fp_div_s5_double_altfp_div_pst_luf   altfp_div_pst1
	( 
	.aclr(aclr),
	.clk_en(clk_en),
	.clock(clock),
	.dataa(dataa),
	.datab(datab),
	.result(wire_altfp_div_pst1_result));
	assign
		aclr = 1'b0,
		result = wire_altfp_div_pst1_result;
endmodule //acl_fp_div_s5_double_altfp_div_6th
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module acl_fp_div_s5_double (
	enable,
	clock,
	dataa,
	datab,
	result);

	input	  enable;
	input	  clock;
	input	[63:0]  dataa;
	input	[63:0]  datab;
	output	[63:0]  result;

	wire [63:0] sub_wire0;
	wire [63:0] result = sub_wire0[63:0];

	acl_fp_div_s5_double_altfp_div_6th	acl_fp_div_s5_double_altfp_div_6th_component (
				.clk_en (enable),
				.clock (clock),
				.datab (datab),
				.dataa (dataa),
				.result (sub_wire0));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix V"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: DENORMAL_SUPPORT STRING "NO"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix V"
// Retrieval info: CONSTANT: OPTIMIZE STRING "SPEED"
// Retrieval info: CONSTANT: PIPELINE NUMERIC "24"
// Retrieval info: CONSTANT: REDUCED_FUNCTIONALITY STRING "NO"
// Retrieval info: CONSTANT: WIDTH_EXP NUMERIC "11"
// Retrieval info: CONSTANT: WIDTH_MAN NUMERIC "52"
// Retrieval info: USED_PORT: clk_en 0 0 0 0 INPUT NODEFVAL "clk_en"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: USED_PORT: dataa 0 0 64 0 INPUT NODEFVAL "dataa[63..0]"
// Retrieval info: USED_PORT: datab 0 0 64 0 INPUT NODEFVAL "datab[63..0]"
// Retrieval info: USED_PORT: result 0 0 64 0 OUTPUT NODEFVAL "result[63..0]"
// Retrieval info: CONNECT: @clk_en 0 0 0 0 clk_en 0 0 0 0
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @dataa 0 0 64 0 dataa 0 0 64 0
// Retrieval info: CONNECT: @datab 0 0 64 0 datab 0 0 64 0
// Retrieval info: CONNECT: result 0 0 64 0 @result 0 0 64 0
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_div_s5_double.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_div_s5_double.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_div_s5_double.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_div_s5_double.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_div_s5_double_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL acl_fp_div_s5_double_bb.v TRUE
