// (C) 1992-2012 Altera Corporation. All rights reserved.                         
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
    

module dotp_wrapper_tom_sv (
	clock,
	resetn,
	valid_in,
	stall_in,
  valid_out,
	stall_out,
  a0, a1, a2, a3,
  b0, b1, b2, b3,
  result
);

input clock;
input resetn;
input valid_in;
input stall_in;
output valid_out;
output stall_out;

input [511:0] a0;
input [511:0] a1;
input [511:0] a2;
input [511:0] a3;
input [511:0] b0;
input [511:0] b1;
input [511:0] b2;
input [511:0] b3;

output [31:0] result;

wire input_accepted;
wire output_accepted;

assign input_accepted = valid_in & ~stall_out;
assign output_accepted = valid_out & ~stall_in;

reg [7:0] occ_counter; 

wire [31:0] core_result;
wire core_valid;

assign stall_out = occ_counter[6];

   always @(posedge clock or negedge resetn)
   begin
    if (~(resetn))
    begin
       occ_counter <= 8'b0;
    end
    else 
    begin
       occ_counter <= occ_counter + input_accepted - output_accepted;
    end
  end

  acl_fp_dot_product_64 dot_product (
      .clock(clock),
      .resetn(resetn),
      .valid_in(input_accepted),
			.datain_a_00(a0[31:0]),
			.datain_a_01(a0[63:32]),
			.datain_a_02(a0[95:64]),
			.datain_a_03(a0[127:96]),
			.datain_a_04(a0[159:128]),
			.datain_a_05(a0[191:160]),
			.datain_a_06(a0[223:192]),
			.datain_a_07(a0[255:224]),
			.datain_a_08(a0[287:256]),
			.datain_a_09(a0[319:288]),
			.datain_a_10(a0[351:320]),
			.datain_a_11(a0[383:352]),
			.datain_a_12(a0[415:384]),
			.datain_a_13(a0[447:416]),
			.datain_a_14(a0[479:448]),
			.datain_a_15(a0[511:480]),
			.datain_a_16(a1[31:0]),
			.datain_a_17(a1[63:32]),
			.datain_a_18(a1[95:64]),
			.datain_a_19(a1[127:96]),
			.datain_a_20(a1[159:128]),
			.datain_a_21(a1[191:160]),
			.datain_a_22(a1[223:192]),
			.datain_a_23(a1[255:224]),
			.datain_a_24(a1[287:256]),
			.datain_a_25(a1[319:288]),
			.datain_a_26(a1[351:320]),
			.datain_a_27(a1[383:352]),
			.datain_a_28(a1[415:384]),
			.datain_a_29(a1[447:416]),
			.datain_a_30(a1[479:448]),
			.datain_a_31(a1[511:480]),
			.datain_a_32(a2[31:0]),
			.datain_a_33(a2[63:32]),
			.datain_a_34(a2[95:64]),
			.datain_a_35(a2[127:96]),
			.datain_a_36(a2[159:128]),
			.datain_a_37(a2[191:160]),
			.datain_a_38(a2[223:192]),
			.datain_a_39(a2[255:224]),
			.datain_a_40(a2[287:256]),
			.datain_a_41(a2[319:288]),
			.datain_a_42(a2[351:320]),
			.datain_a_43(a2[383:352]),
			.datain_a_44(a2[415:384]),
			.datain_a_45(a2[447:416]),
			.datain_a_46(a2[479:448]),
			.datain_a_47(a2[511:480]),
			.datain_a_48(a3[31:0]),
			.datain_a_49(a3[63:32]),
			.datain_a_50(a3[95:64]),
			.datain_a_51(a3[127:96]),
			.datain_a_52(a3[159:128]),
			.datain_a_53(a3[191:160]),
			.datain_a_54(a3[223:192]),
			.datain_a_55(a3[255:224]),
			.datain_a_56(a3[287:256]),
			.datain_a_57(a3[319:288]),
			.datain_a_58(a3[351:320]),
			.datain_a_59(a3[383:352]),
			.datain_a_60(a3[415:384]),
			.datain_a_61(a3[447:416]),
			.datain_a_62(a3[479:448]),
			.datain_a_63(a3[511:480]),

			.datain_b_00(b0[31:0]),
			.datain_b_01(b0[63:32]),
			.datain_b_02(b0[95:64]),
			.datain_b_03(b0[127:96]),
			.datain_b_04(b0[159:128]),
			.datain_b_05(b0[191:160]),
			.datain_b_06(b0[223:192]),
			.datain_b_07(b0[255:224]),
			.datain_b_08(b0[287:256]),
			.datain_b_09(b0[319:288]),
			.datain_b_10(b0[351:320]),
			.datain_b_11(b0[383:352]),
			.datain_b_12(b0[415:384]),
			.datain_b_13(b0[447:416]),
			.datain_b_14(b0[479:448]),
			.datain_b_15(b0[511:480]),
			.datain_b_16(b1[31:0]),
			.datain_b_17(b1[63:32]),
			.datain_b_18(b1[95:64]),
			.datain_b_19(b1[127:96]),
			.datain_b_20(b1[159:128]),
			.datain_b_21(b1[191:160]),
			.datain_b_22(b1[223:192]),
			.datain_b_23(b1[255:224]),
			.datain_b_24(b1[287:256]),
			.datain_b_25(b1[319:288]),
			.datain_b_26(b1[351:320]),
			.datain_b_27(b1[383:352]),
			.datain_b_28(b1[415:384]),
			.datain_b_29(b1[447:416]),
			.datain_b_30(b1[479:448]),
			.datain_b_31(b1[511:480]),
			.datain_b_32(b2[31:0]),
			.datain_b_33(b2[63:32]),
			.datain_b_34(b2[95:64]),
			.datain_b_35(b2[127:96]),
			.datain_b_36(b2[159:128]),
			.datain_b_37(b2[191:160]),
			.datain_b_38(b2[223:192]),
			.datain_b_39(b2[255:224]),
			.datain_b_40(b2[287:256]),
			.datain_b_41(b2[319:288]),
			.datain_b_42(b2[351:320]),
			.datain_b_43(b2[383:352]),
			.datain_b_44(b2[415:384]),
			.datain_b_45(b2[447:416]),
			.datain_b_46(b2[479:448]),
			.datain_b_47(b2[511:480]),
			.datain_b_48(b3[31:0]),
			.datain_b_49(b3[63:32]),
			.datain_b_50(b3[95:64]),
			.datain_b_51(b3[127:96]),
			.datain_b_52(b3[159:128]),
			.datain_b_53(b3[191:160]),
			.datain_b_54(b3[223:192]),
			.datain_b_55(b3[255:224]),
			.datain_b_56(b3[287:256]),
			.datain_b_57(b3[319:288]),
			.datain_b_58(b3[351:320]),
			.datain_b_59(b3[383:352]),
			.datain_b_60(b3[415:384]),
			.datain_b_61(b3[447:416]),
			.datain_b_62(b3[479:448]),
			.datain_b_63(b3[511:480]),

      .result(core_result),
		.enable(1'b1),
      .valid_out(core_valid));
  
  /*acl_fifo #(
    .DATA_WIDTH(32),
    .DEPTH(64)
  ) collection_fifo (
    .clock(clock),
    .resetn(resetn),
    .data_in( core_result ),
    .data_out( result ),
    .valid_in( core_valid ),
    .valid_out( valid_out ),
    .stall_in( stall_in ),
    .stall_out( )
  );*/
  assign result = core_result;
  assign valid_out = core_valid;
endmodule
