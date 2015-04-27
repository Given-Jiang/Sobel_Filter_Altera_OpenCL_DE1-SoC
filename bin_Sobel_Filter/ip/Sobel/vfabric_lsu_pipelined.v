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
    


module vfabric_lsu_pipelined_read(clock, resetn,
    i_addressin, i_addressin_valid, o_addressin_stall, 
    i_controlin, i_controlin_valid, o_controlin_stall,
    avm_waitrequest, avm_address, avm_read, avm_readdata, 
    avm_byteenable, avm_readdatavalid, avm_burstcount, 
    o_dataout, o_dataout_valid, i_dataout_stall);
parameter AWIDTH = 32;
parameter WIDTH_BYTES = 4;
parameter DATA_WIDTH = 32;
parameter FIFO_DEPTH = 64;

  input clock, resetn;
  input [AWIDTH-1:0] i_addressin;
  input i_controlin;
  input i_addressin_valid, i_controlin_valid;
  output o_addressin_stall, o_controlin_stall;
  
  input avm_waitrequest;
  output [31:0] avm_address;
  output avm_read;
  input avm_readdatavalid;
  input [255:0] avm_readdata;
  output [31:0] avm_byteenable;
  output [5:0] avm_burstcount;
  output [31:0] o_dataout;
  input i_dataout_stall;
  output o_dataout_valid;
  
  wire [AWIDTH-1:0] addressin;
  wire controlin;
  
  wire fifo_a_valid_out;
  wire fifo_c_valid_out;
  
  wire are_fifos_valid;
  wire are_fifos_stalled;
  wire is_lsu_stalled;
  
  vfabric_buffered_fifo fifo_a ( .clock(clock), .resetn(resetn), .data_in(i_addressin), .data_out(addressin), .valid_in(i_addressin_valid),
    .valid_out( fifo_a_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_addressin_stall) );
  defparam fifo_a.DATA_WIDTH = AWIDTH;
  defparam fifo_a.DEPTH = FIFO_DEPTH;
  
  vfabric_buffered_fifo fifo_c ( .clock(clock), .resetn(resetn), .data_in(i_controlin), .data_out(controlin), .valid_in(i_controlin_valid),
    .valid_out( fifo_c_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_controlin_stall) );
  defparam fifo_c.DATA_WIDTH = 1;
  defparam fifo_c.DEPTH = FIFO_DEPTH;

  
  assign are_fifos_valid = fifo_a_valid_out & fifo_c_valid_out;
  assign are_fifos_stalled = ~(fifo_a_valid_out & fifo_c_valid_out & ~is_lsu_stalled);
  
  lsu_pipelined_read lsu0 (.clk(clock), .reset(~resetn),
    .i_address(addressin),
    .i_valid(are_fifos_valid), .o_stall(is_lsu_stalled),
    .o_readdata(o_dataout),
    .o_valid(o_dataout_valid), 
    .i_stall(i_dataout_stall),
    .i_burstcount(),  //unconnected because we're not using burst mode
    .avm_read(avm_read),
    .avm_readdata(avm_readdata),
    .avm_readdatavalid(avm_readdatavalid),
    .avm_byteenable(avm_byteenable),
    .avm_waitrequest(avm_waitrequest),
    .avm_address(avm_address),
    .avm_burstcount(avm_burstcount));
  defparam lsu0.AWIDTH = AWIDTH;
  defparam lsu0.WIDTH_BYTES=WIDTH_BYTES;
  defparam lsu0.USEINPUTFIFO = 0;
  defparam lsu0.USEBURST = 0;
 
endmodule

module vfabric_lsu_pipelined_write(clock, resetn,
    i_addressin, i_addressin_valid, o_addressin_stall, 
    i_datain, i_datain_valid, o_datain_stall,
    i_controlin, i_controlin_valid, o_controlin_stall,
    avm_waitrequest,
    avm_address, avm_write, 
    avm_writeack, avm_writedata, avm_byteenable, 
    o_dataout_valid, i_dataout_stall);
parameter AWIDTH = 32;
parameter WIDTH_BYTES = 4;
parameter DATA_WIDTH = 32;
parameter FIFO_DEPTH = 64;

  input clock, resetn;
  input [AWIDTH-1:0] i_addressin;
  input [DATA_WIDTH-1:0] i_datain;
  input i_controlin;
  input i_addressin_valid, i_datain_valid, i_controlin_valid;
  output o_addressin_stall, o_datain_stall, o_controlin_stall;
  
  input avm_waitrequest;
  output [31:0] avm_address;
  output avm_write;
  input avm_writeack;
  output [255:0] avm_writedata;
  output [31:0] avm_byteenable;
  
  input i_dataout_stall;
  output o_dataout_valid;
  
  wire [AWIDTH-1:0] addressin;
  wire [DATA_WIDTH-1:0] datain;
  wire controlin;
  
  wire fifo_a_valid_out;
  wire fifo_b_valid_out;
  wire fifo_c_valid_out;
  
  wire are_fifos_valid;
  wire are_fifos_stalled;
  wire is_lsu_stalled;
  
  vfabric_buffered_fifo fifo_a ( .clock(clock), .resetn(resetn), .data_in(i_addressin), .data_out(addressin), .valid_in(i_addressin_valid),
    .valid_out( fifo_a_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_addressin_stall) );
  defparam fifo_a.DATA_WIDTH = AWIDTH;
  defparam fifo_a.DEPTH = FIFO_DEPTH;
  
  vfabric_buffered_fifo fifo_b ( .clock(clock), .resetn(resetn), .data_in(i_datain), .data_out(datain), .valid_in(i_datain_valid),
    .valid_out( fifo_b_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_datain_stall) );
  defparam fifo_b.DATA_WIDTH = DATA_WIDTH;
  defparam fifo_b.DEPTH = FIFO_DEPTH;
  
  vfabric_buffered_fifo fifo_c ( .clock(clock), .resetn(resetn), .data_in(i_controlin), .data_out(controlin), .valid_in(i_controlin_valid),
    .valid_out( fifo_c_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_controlin_stall) );
  defparam fifo_c.DATA_WIDTH = 1;
  defparam fifo_c.DEPTH = FIFO_DEPTH;
  
  assign are_fifos_valid = fifo_a_valid_out & fifo_b_valid_out & fifo_c_valid_out;
  assign are_fifos_stalled = ~(fifo_a_valid_out & fifo_b_valid_out 
                                & fifo_c_valid_out & ~is_lsu_stalled);
  
  lsu_pipelined_write lsu0 (.clk(clock), .reset(~resetn),
    .i_address(addressin),
    .i_writedata(datain),
    .i_valid(are_fifos_valid), .o_stall(is_lsu_stalled),				
    .o_valid(o_dataout_valid), 
    .i_stall(i_dataout_stall),
    .avm_write(avm_write),
    .avm_writeack(avm_writeack),
    .avm_writedata(avm_writedata),
    .avm_byteenable(avm_byteenable),
    .avm_waitrequest(avm_waitrequest),
    .avm_address(avm_address));
  defparam lsu0.AWIDTH = AWIDTH;
  defparam lsu0.WIDTH_BYTES=WIDTH_BYTES;
  defparam lsu0.USEINPUTFIFO = 0;
 
endmodule
