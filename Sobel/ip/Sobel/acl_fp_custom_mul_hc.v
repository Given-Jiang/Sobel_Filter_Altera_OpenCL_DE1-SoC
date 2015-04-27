// // (C) 1992-2014 Altera Corporation. All rights reserved.                         
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
    


module acl_fp_custom_mul_hc(
    // this interface matches what hdlgen expects
	input logic clock, 
    input logic resetn,
	input logic valid_in, 
    input logic stall_in,
	output logic valid_out, 
    output logic stall_out,
	input logic [31:0] dataa,
	input logic [31:0] datab,
	output logic [31:0] result
);
    acl_fp_custom_mul_hc_core #(
        .HIGH_CAPACITY(1)
    )
    core(
        .clock(clock),
        .resetn(resetn),
        .valid_in(valid_in),
        .stall_in(stall_in),
        .valid_out(valid_out),
        .stall_out(stall_out),
        .dataa(dataa),
        .datab(datab),
        .result(result)
    );
endmodule

