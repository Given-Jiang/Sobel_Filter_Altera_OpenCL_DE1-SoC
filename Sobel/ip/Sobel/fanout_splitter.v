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
    


module fanout_splitter(clock, resetn, i_datain, i_datain_valid, o_datain_stall, o_dataout, i_dataout_stall, o_dataout_valid);

parameter DATA_WIDTH = 32;
parameter NUM_FANOUTS = 2;

 input clock, resetn;
 input [DATA_WIDTH-1:0] i_datain;
 input i_datain_valid;
 output o_datain_stall;
 output reg [DATA_WIDTH-1:0] o_dataout;
 input [NUM_FANOUTS-1:0] i_dataout_stall;
 output [NUM_FANOUTS-1:0] o_dataout_valid;
 
 wire [DATA_WIDTH-1:0] staging_out_data;
 wire staging_out_valid;
 wire staging_in_stall;
  
 acl_staging_reg stage1 (.clk(clock), .reset(~resetn), .i_data( i_datain ), .i_valid( i_datain_valid ),  .o_stall( o_datain_stall ), 
 								 .o_data( staging_out_data ), .o_valid( staging_out_valid ), .i_stall( staging_in_stall ) );
 defparam stage1.WIDTH = DATA_WIDTH;
 
 route_switch sw1 (.clock(clock), .resetn(resetn), .i_datain(staging_out_data), .i_datain_valid( staging_out_valid ), 
						 .o_datain_stall( staging_in_stall ), 
						 .o_dataout(o_dataout), .i_dataout_stall( i_dataout_stall ) , .o_dataout_valid( o_dataout_valid ) );
 defparam sw1.NUM_FANOUTS = NUM_FANOUTS;
 defparam sw1.DATA_WIDTH = DATA_WIDTH;

endmodule
