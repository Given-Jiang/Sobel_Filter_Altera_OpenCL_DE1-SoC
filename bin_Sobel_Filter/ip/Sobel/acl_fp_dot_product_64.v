module acl_fp_dot_product_64(clock, resetn, enable, valid_in, valid_out,
			datain_a_00,
			datain_a_01,
			datain_a_02,
			datain_a_03,
			datain_a_04,
			datain_a_05,
			datain_a_06,
			datain_a_07,
			datain_a_08,
			datain_a_09,
			datain_a_10,
			datain_a_11,
			datain_a_12,
			datain_a_13,
			datain_a_14,
			datain_a_15,
			datain_a_16,
			datain_a_17,
			datain_a_18,
			datain_a_19,
			datain_a_20,
			datain_a_21,
			datain_a_22,
			datain_a_23,
			datain_a_24,
			datain_a_25,
			datain_a_26,
			datain_a_27,
			datain_a_28,
			datain_a_29,
			datain_a_30,
			datain_a_31,
			datain_a_32,
			datain_a_33,
			datain_a_34,
			datain_a_35,
			datain_a_36,
			datain_a_37,
			datain_a_38,
			datain_a_39,
			datain_a_40,
			datain_a_41,
			datain_a_42,
			datain_a_43,
			datain_a_44,
			datain_a_45,
			datain_a_46,
			datain_a_47,
			datain_a_48,
			datain_a_49,
			datain_a_50,
			datain_a_51,
			datain_a_52,
			datain_a_53,
			datain_a_54,
			datain_a_55,
			datain_a_56,
			datain_a_57,
			datain_a_58,
			datain_a_59,
			datain_a_60,
			datain_a_61,
			datain_a_62,
			datain_a_63,

			datain_b_00,
			datain_b_01,
			datain_b_02,
			datain_b_03,
			datain_b_04,
			datain_b_05,
			datain_b_06,
			datain_b_07,
			datain_b_08,
			datain_b_09,
			datain_b_10,
			datain_b_11,
			datain_b_12,
			datain_b_13,
			datain_b_14,
			datain_b_15,
			datain_b_16,
			datain_b_17,
			datain_b_18,
			datain_b_19,
			datain_b_20,
			datain_b_21,
			datain_b_22,
			datain_b_23,
			datain_b_24,
			datain_b_25,
			datain_b_26,
			datain_b_27,
			datain_b_28,
			datain_b_29,
			datain_b_30,
			datain_b_31,
			datain_b_32,
			datain_b_33,
			datain_b_34,
			datain_b_35,
			datain_b_36,
			datain_b_37,
			datain_b_38,
			datain_b_39,
			datain_b_40,
			datain_b_41,
			datain_b_42,
			datain_b_43,
			datain_b_44,
			datain_b_45,
			datain_b_46,
			datain_b_47,
			datain_b_48,
			datain_b_49,
			datain_b_50,
			datain_b_51,
			datain_b_52,
			datain_b_53,
			datain_b_54,
			datain_b_55,
			datain_b_56,
			datain_b_57,
			datain_b_58,
			datain_b_59,
			datain_b_60,
			datain_b_61,
			datain_b_62,
			datain_b_63,
			result
			);

    input clock, resetn, enable, valid_in;
	 output valid_out;
	 input [31:0] datain_a_00,
			datain_a_01,
			datain_a_02,
			datain_a_03,
			datain_a_04,
			datain_a_05,
			datain_a_06,
			datain_a_07,
			datain_a_08,
			datain_a_09,
			datain_a_10,
			datain_a_11,
			datain_a_12,
			datain_a_13,
			datain_a_14,
			datain_a_15,
			datain_a_16,
			datain_a_17,
			datain_a_18,
			datain_a_19,
			datain_a_20,
			datain_a_21,
			datain_a_22,
			datain_a_23,
			datain_a_24,
			datain_a_25,
			datain_a_26,
			datain_a_27,
			datain_a_28,
			datain_a_29,
			datain_a_30,
			datain_a_31,
			datain_a_32,
			datain_a_33,
			datain_a_34,
			datain_a_35,
			datain_a_36,
			datain_a_37,
			datain_a_38,
			datain_a_39,
			datain_a_40,
			datain_a_41,
			datain_a_42,
			datain_a_43,
			datain_a_44,
			datain_a_45,
			datain_a_46,
			datain_a_47,
			datain_a_48,
			datain_a_49,
			datain_a_50,
			datain_a_51,
			datain_a_52,
			datain_a_53,
			datain_a_54,
			datain_a_55,
			datain_a_56,
			datain_a_57,
			datain_a_58,
			datain_a_59,
			datain_a_60,
			datain_a_61,
			datain_a_62,
			datain_a_63,
			datain_b_00,
			datain_b_01,
			datain_b_02,
			datain_b_03,
			datain_b_04,
			datain_b_05,
			datain_b_06,
			datain_b_07,
			datain_b_08,
			datain_b_09,
			datain_b_10,
			datain_b_11,
			datain_b_12,
			datain_b_13,
			datain_b_14,
			datain_b_15,
			datain_b_16,
			datain_b_17,
			datain_b_18,
			datain_b_19,
			datain_b_20,
			datain_b_21,
			datain_b_22,
			datain_b_23,
			datain_b_24,
			datain_b_25,
			datain_b_26,
			datain_b_27,
			datain_b_28,
			datain_b_29,
			datain_b_30,
			datain_b_31,
			datain_b_32,
			datain_b_33,
			datain_b_34,
			datain_b_35,
			datain_b_36,
			datain_b_37,
			datain_b_38,
			datain_b_39,
			datain_b_40,
			datain_b_41,
			datain_b_42,
			datain_b_43,
			datain_b_44,
			datain_b_45,
			datain_b_46,
			datain_b_47,
			datain_b_48,
			datain_b_49,
			datain_b_50,
			datain_b_51,
			datain_b_52,
			datain_b_53,
			datain_b_54,
			datain_b_55,
			datain_b_56,
			datain_b_57,
			datain_b_58,
			datain_b_59,
			datain_b_60,
			datain_b_61,
			datain_b_62,
			datain_b_63;
	 output [31:0] result;
	 
	 wire [31:0] inputs_a[0:63];
	 wire [31:0] inputs_b[0:63];
	
 assign inputs_a[0] = datain_a_00;
 assign inputs_a[1] = datain_a_01;
 assign inputs_a[2] = datain_a_02;
 assign inputs_a[3] = datain_a_03; 
 assign inputs_a[4] = datain_a_04;
 assign inputs_a[5] = datain_a_05;
 assign inputs_a[6] = datain_a_06;
 assign inputs_a[7] = datain_a_07; 
 assign inputs_a[8] = datain_a_08;
 assign inputs_a[9] = datain_a_09;
 assign inputs_a[10] = datain_a_10;
 assign inputs_a[11] = datain_a_11;
 assign inputs_a[12] = datain_a_12;
 assign inputs_a[13] = datain_a_13; 
 assign inputs_a[14] = datain_a_14;
 assign inputs_a[15] = datain_a_15;
 assign inputs_a[16] = datain_a_16;
 assign inputs_a[17] = datain_a_17; 
 assign inputs_a[18] = datain_a_18;
 assign inputs_a[19] = datain_a_19;
 assign inputs_a[20] = datain_a_20;
 assign inputs_a[21] = datain_a_21;
 assign inputs_a[22] = datain_a_22;
 assign inputs_a[23] = datain_a_23; 
 assign inputs_a[24] = datain_a_24;
 assign inputs_a[25] = datain_a_25;
 assign inputs_a[26] = datain_a_26;
 assign inputs_a[27] = datain_a_27; 
 assign inputs_a[28] = datain_a_28;
 assign inputs_a[29] = datain_a_29;
 assign inputs_a[30] = datain_a_30;
 assign inputs_a[31] = datain_a_31;
 assign inputs_a[32] = datain_a_32;
 assign inputs_a[33] = datain_a_33; 
 assign inputs_a[34] = datain_a_34;
 assign inputs_a[35] = datain_a_35;
 assign inputs_a[36] = datain_a_36;
 assign inputs_a[37] = datain_a_37; 
 assign inputs_a[38] = datain_a_38;
 assign inputs_a[39] = datain_a_39;
 assign inputs_a[40] = datain_a_40;
 assign inputs_a[41] = datain_a_41;
 assign inputs_a[42] = datain_a_42;
 assign inputs_a[43] = datain_a_43; 
 assign inputs_a[44] = datain_a_44;
 assign inputs_a[45] = datain_a_45;
 assign inputs_a[46] = datain_a_46;
 assign inputs_a[47] = datain_a_47; 
 assign inputs_a[48] = datain_a_48;
 assign inputs_a[49] = datain_a_49;
 assign inputs_a[50] = datain_a_50;
 assign inputs_a[51] = datain_a_51;
 assign inputs_a[52] = datain_a_52;
 assign inputs_a[53] = datain_a_53; 
 assign inputs_a[54] = datain_a_54;
 assign inputs_a[55] = datain_a_55;
 assign inputs_a[56] = datain_a_56;
 assign inputs_a[57] = datain_a_57; 
 assign inputs_a[58] = datain_a_58;
 assign inputs_a[59] = datain_a_59;
 assign inputs_a[60] = datain_a_60;
 assign inputs_a[61] = datain_a_61;
 assign inputs_a[62] = datain_a_62;
 assign inputs_a[63] = datain_a_63; 

 assign inputs_b[0] = datain_b_00;
 assign inputs_b[1] = datain_b_01;
 assign inputs_b[2] = datain_b_02;
 assign inputs_b[3] = datain_b_03; 
 assign inputs_b[4] = datain_b_04;
 assign inputs_b[5] = datain_b_05;
 assign inputs_b[6] = datain_b_06;
 assign inputs_b[7] = datain_b_07; 
 assign inputs_b[8] = datain_b_08;
 assign inputs_b[9] = datain_b_09;
 assign inputs_b[10] = datain_b_10;
 assign inputs_b[11] = datain_b_11;
 assign inputs_b[12] = datain_b_12;
 assign inputs_b[13] = datain_b_13; 
 assign inputs_b[14] = datain_b_14;
 assign inputs_b[15] = datain_b_15;
 assign inputs_b[16] = datain_b_16;
 assign inputs_b[17] = datain_b_17; 
 assign inputs_b[18] = datain_b_18;
 assign inputs_b[19] = datain_b_19;
 assign inputs_b[20] = datain_b_20;
 assign inputs_b[21] = datain_b_21;
 assign inputs_b[22] = datain_b_22;
 assign inputs_b[23] = datain_b_23; 
 assign inputs_b[24] = datain_b_24;
 assign inputs_b[25] = datain_b_25;
 assign inputs_b[26] = datain_b_26;
 assign inputs_b[27] = datain_b_27; 
 assign inputs_b[28] = datain_b_28;
 assign inputs_b[29] = datain_b_29;
 assign inputs_b[30] = datain_b_30;
 assign inputs_b[31] = datain_b_31;
 assign inputs_b[32] = datain_b_32;
 assign inputs_b[33] = datain_b_33; 
 assign inputs_b[34] = datain_b_34;
 assign inputs_b[35] = datain_b_35;
 assign inputs_b[36] = datain_b_36;
 assign inputs_b[37] = datain_b_37; 
 assign inputs_b[38] = datain_b_38;
 assign inputs_b[39] = datain_b_39;
 assign inputs_b[40] = datain_b_40;
 assign inputs_b[41] = datain_b_41;
 assign inputs_b[42] = datain_b_42;
 assign inputs_b[43] = datain_b_43; 
 assign inputs_b[44] = datain_b_44;
 assign inputs_b[45] = datain_b_45;
 assign inputs_b[46] = datain_b_46;
 assign inputs_b[47] = datain_b_47; 
 assign inputs_b[48] = datain_b_48;
 assign inputs_b[49] = datain_b_49;
 assign inputs_b[50] = datain_b_50;
 assign inputs_b[51] = datain_b_51;
 assign inputs_b[52] = datain_b_52;
 assign inputs_b[53] = datain_b_53; 
 assign inputs_b[54] = datain_b_54;
 assign inputs_b[55] = datain_b_55;
 assign inputs_b[56] = datain_b_56;
 assign inputs_b[57] = datain_b_57; 
 assign inputs_b[58] = datain_b_58;
 assign inputs_b[59] = datain_b_59;
 assign inputs_b[60] = datain_b_60;
 assign inputs_b[61] = datain_b_61;
 assign inputs_b[62] = datain_b_62;
 assign inputs_b[63] = datain_b_63; 
 
	 wire [36:0] mult_result [0:63];
	 wire [63:0] mult_valid_out;
	 wire [63:0] mult_stall_out;
	 
	 wire [37:0] add_result_1 [0:31];
	 wire [31:0] add_valid_out_1;
	 wire [31:0] add_stall_out_1;		 

	 wire [37:0] add_result_2 [0:15];
	 wire [15:0] add_valid_out_2;
	 wire [15:0] add_stall_out_2;		 

	 wire [37:0] add_result_3 [0:7];
	 wire [7:0] add_valid_out_3;
	 wire [7:0] add_stall_out_3;		 

	 wire [37:0] add_result_4 [0:3];
	 wire [3:0] add_valid_out_4;
	 wire [3:0] add_stall_out_4;		 

	 wire [37:0] add_result_5 [0:1];
	 wire [1:0] add_valid_out_5;
	 wire [1:0] add_stall_out_5;		 

	 wire [37:0] add_result_6;
	 wire add_valid_out_6;
	 wire [0:0] add_stall_out_6;		 
	 
	 // stage 0
	 genvar i;
	 generate
		for(i=0; i < 64; i = i + 1)
		begin: mult_stage
		   acl_fp_custom_mul_wrapper m0(
				.clock(clock),
				.resetn(resetn),
				.dataa(inputs_a[i]),
				.datab(inputs_b[i]),
				.result(mult_result[i]),
				.valid_in((i==0) ? valid_in : 1'b0),
				.valid_out(mult_valid_out[i]),
				.enable(enable));
		end
	 endgenerate
	 	 
	 // stage 1
	 generate
		for(i=0; i < 32; i = i + 1)
		begin: add_stage_1
		   acl_fp_custom_add_wrapper a1(
				.clock(clock),
				.resetn(resetn),
				.dataa(mult_result[2*i]),
				.datab(mult_result[2*i+1]),
				.result(add_result_1[i]),
				.valid_in((i==0) ? mult_valid_out[2*i] : 1'b0),
				.valid_out(add_valid_out_1[i]),
				.enable(enable));
		end
	 endgenerate
	
	 // stage 2
	 generate
		for(i=0; i < 16; i = i + 1)
		begin: add_stage_2
		   acl_fp_custom_dynamic_align a2(
				.clock(clock),
				.resetn(resetn),
				.dataa(add_result_1[2*i]),
				.datab(add_result_1[2*i+1]),
				.result(add_result_2[i]),
				.valid_in((i==0) ? add_valid_out_1[2*i] : 1'b0),
				.valid_out(add_valid_out_2[i]),
				.enable(enable));
		end
	 endgenerate
	
	 // stage 3
	 generate
		for(i=0; i < 8; i = i + 1)
		begin: add_stage_3
		   acl_fp_custom_dynamic_align a3(
				.clock(clock),
				.resetn(resetn),
				.dataa(add_result_2[2*i]),
				.datab(add_result_2[2*i+1]),
				.result(add_result_3[i]),
				.valid_in((i==0) ? add_valid_out_2[2*i] :1'b0),
				.valid_out(add_valid_out_3[i]),
				.enable(enable));
		end
	 endgenerate

	 // stage 4
	 generate
		for(i=0; i < 4; i = i + 1)
		begin: add_stage_4
		   acl_fp_custom_dynamic_align a4(
				.clock(clock),
				.resetn(resetn),
				.dataa(add_result_3[2*i]),
				.datab(add_result_3[2*i+1]),
				.result(add_result_4[i]),
				.valid_in((i==0) ? add_valid_out_3[2*i] : 1'b0),
				.valid_out(add_valid_out_4[i]),
				.enable(enable));
		end
	 endgenerate

	 // stage 5
	 generate
		for(i=0; i < 2; i = i + 1)
		begin: add_stage_5
		   acl_fp_custom_dynamic_align a5(
				.clock(clock),
				.resetn(resetn),
				.dataa(add_result_4[2*i]),
				.datab(add_result_4[2*i+1]),
				.result(add_result_5[i]),
				.valid_in((i==0) ? add_valid_out_4[2*i] : 1'b0),
				.valid_out(add_valid_out_5[i]),
				.enable(enable));
		end
	 endgenerate

	 wire add_conv_stall_out;
    acl_fp_custom_dynamic_align a6(
				.clock(clock),
				.resetn(resetn),
				.dataa(add_result_5[0]),
				.datab(add_result_5[1]),
				.result(add_result_6),
				.valid_in(add_valid_out_5[0]),
				.valid_out(add_valid_out_6),
				.enable(enable));
	
   wire 	[26:0] norm_man;
   wire 	[8:0] norm_exp;
   wire 	norm_sign;
	wire norm_valid;
	acl_fp_custom_reduced_normalize norm(
	  .clock(clock),
	  .resetn(resetn),
     .mantissa(add_result_6[27:0]), .exponent(add_result_6[36:28]), .sign(add_result_6[37]),
     .valid_in(add_valid_out_6), .valid_out(norm_valid),
     .enable(enable),  
     .mantissa_out(norm_man), .exponent_out(norm_exp), .sign_out(norm_sign));
     defparam norm.HIGH_CAPACITY = 0;
     defparam norm.FLUSH_DENORMS = 0;
     defparam norm.HIGH_LATENCY = 1;
     defparam norm.REMOVE_STICKY = 1;
     defparam norm.FINITE_MATH_ONLY = 1;
				
	acl_fp_convert_to_ieee cie(
	         .clock(clock),
				.resetn(resetn),
				.mantissa(norm_man),
				.exponent(norm_exp),
				.sign(norm_sign),
				.result(result),
				.valid_in(norm_valid),
				.valid_out(valid_out),
				.enable(enable));	
		defparam cie.FINITE_MATH_ONLY = 1;
		
	 
endmodule
