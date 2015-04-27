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
    


module vfabric_gep(clock, resetn, 
    i_addressin, i_addressin_valid, o_addressin_stall,
    i_indexin, i_indexin_valid, o_indexin_stall,
    o_dataout, i_stall, o_dataout_valid,
    i_settings, i_offset_settings);
						
parameter ADDRESS_WIDTH = 32;
parameter INDEX_WIDTH = 32;
parameter CONFIG_WIDTH = 5;
parameter FIFO_DEPTH = 64;

  input clock, resetn;
  input [ADDRESS_WIDTH-1:0] i_addressin;
  input i_addressin_valid;
  output o_addressin_stall;
  input [INDEX_WIDTH-1:0] i_indexin;
  input i_indexin_valid;
  output o_indexin_stall; 
  output [ADDRESS_WIDTH-1:0] o_dataout;
  input i_stall;
  output o_dataout_valid;
  input [CONFIG_WIDTH-1:0] i_settings;
  input [ADDRESS_WIDTH-1:0] i_offset_settings;
  
  wire [ADDRESS_WIDTH-1:0] addressin_from_fifo;
  wire [ADDRESS_WIDTH-1:0] addressin;
  wire [INDEX_WIDTH-1:0] indexin_from_fifo;
  wire [INDEX_WIDTH-1:0] indexin;
  
  wire is_fifo_a_valid;
  wire is_fifo_b_valid;
  wire is_stalled;
  
  wire [CONFIG_WIDTH-2:0] index_shift_settings;
  wire is_index_connected;
  wire is_addressin_zero;

  assign index_shift_settings = i_settings[CONFIG_WIDTH-1:2];
  assign is_index_connected = i_settings[1];
  assign is_addressin_zero = i_settings[0];
  
  vfabric_buffered_fifo fifo_a ( .clock(clock), .resetn(resetn), 
      .data_in(i_addressin), .data_out(addressin_from_fifo), .valid_in(i_addressin_valid),
      .valid_out( is_fifo_a_valid ), .stall_in(is_stalled), .stall_out(o_addressin_stall) );
  defparam fifo_a.DATA_WIDTH = ADDRESS_WIDTH;
  defparam fifo_a.DEPTH = FIFO_DEPTH;
  
  vfabric_buffered_fifo fifo_b ( .clock(clock), .resetn(resetn), 
      .data_in(i_indexin), .data_out(indexin_from_fifo), .valid_in(i_indexin_valid),
      .valid_out( is_fifo_b_valid ), .stall_in(is_stalled), .stall_out(o_indexin_stall) );
  defparam fifo_b.DATA_WIDTH = INDEX_WIDTH;
  defparam fifo_b.DEPTH = FIFO_DEPTH;
  
  assign is_stalled = ~((is_addressin_zero | is_fifo_a_valid) &
			(is_fifo_b_valid | ~is_index_connected)  & ~i_stall);
  
  assign addressin = is_addressin_zero ? {ADDRESS_WIDTH{1'b0}} : addressin_from_fifo;
  assign indexin = is_index_connected ? indexin_from_fifo : {INDEX_WIDTH{1'b0}};
  
  assign o_dataout = addressin + (indexin << index_shift_settings) + i_offset_settings;
  
  assign o_dataout_valid = (is_addressin_zero | is_fifo_a_valid) & (is_fifo_b_valid | ~is_index_connected);
 
endmodule
