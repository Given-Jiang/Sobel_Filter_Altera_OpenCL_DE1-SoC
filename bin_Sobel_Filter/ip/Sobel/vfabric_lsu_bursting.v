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
    


module vfabric_lsu_read(clock, resetn,
    i_addressin, i_addressin_valid, o_addressin_stall, 
    i_controlin, i_controlin_valid, o_controlin_stall,
    i_predicatein, i_predicatein_valid, o_predicatein_stall,
    i_bitwiseorin, i_bitwiseorin_valid, o_bitwiseorin_stall,
    avm_waitrequest, avm_address, avm_read, avm_readdata, 
    avm_byteenable, avm_readdatavalid, avm_burstcount, 
    o_dataout, o_dataout_valid, i_dataout_stall,

    // profile signals
    profile_bw, profile_bw_incr,
    profile_total_ivalid,
    profile_total_req,
    profile_i_stall_count,
    profile_o_stall_count,
    profile_avm_readwrite_count,
    profile_avm_burstcount_total, profile_avm_burstcount_total_incr,
    profile_req_cache_hit_count,
    profile_extra_unaligned_reqs,
    profile_avm_stall
);
parameter LSU_STYLE = "BURST-NON-ALIGNED";
parameter AWIDTH = 32;
parameter WIDTH_BYTES = 4;
parameter DATA_WIDTH = 32;
parameter MWIDTH = 256;
parameter MWIDTH_BYTES = 32;
parameter BYTEENABLE_WIDTH = 32;
parameter BURSTCOUNT_WIDTH = 6;
parameter ALIGNMENT_BYTES = 1;
parameter ISSTRATIXV = 0;
parameter FIFO_DEPTH = 64;
parameter USEINPUTFIFO = 0;
parameter ENABLE_BANKED_MEMORY = 0;
parameter NUMBER_BANKS = 1;
parameter ABITS_PER_LMEM_BANK = 0;
parameter ACL_PROFILE = 0;

localparam KERNEL_SIDE_LATENCY = (LSU_STYLE=="PIPELINED") ? 31 : 160;
localparam MEMORY_SIDE_LATENCY = (LSU_STYLE=="BURST-NON-ALIGNED") ? 108 : ((LSU_STYLE=="BURST-COALESCED") ? 67 : 0);

  input clock, resetn;
  input [AWIDTH-1:0] i_addressin, i_bitwiseorin;
  input i_controlin, i_predicatein;
  input i_addressin_valid, i_controlin_valid, i_predicatein_valid, i_bitwiseorin_valid;
  output o_addressin_stall, o_controlin_stall, o_predicatein_stall, o_bitwiseorin_stall;
  
  input avm_waitrequest;
  output [AWIDTH-1:0] avm_address;
  output avm_read;
  input avm_readdatavalid;
  input [MWIDTH-1:0] avm_readdata;
  output [BYTEENABLE_WIDTH-1:0] avm_byteenable;
  output [BURSTCOUNT_WIDTH-1:0] avm_burstcount;
  
  output [8*WIDTH_BYTES-1:0] o_dataout;
  input i_dataout_stall;
  output o_dataout_valid;

 // Profiler Signals
 output logic profile_bw;
 output logic [31:0] profile_bw_incr;
 output logic profile_total_ivalid;
 output logic profile_total_req;
 output logic profile_i_stall_count;
 output logic profile_o_stall_count;
 output logic profile_avm_readwrite_count;
 output logic profile_avm_burstcount_total;
 output logic [31:0] profile_avm_burstcount_total_incr;
 output logic profile_req_cache_hit_count;
 output logic profile_extra_unaligned_reqs;
 output logic profile_avm_stall;
 
  wire [AWIDTH-1:0] addressin, bitwiseorin;
  wire [DATA_WIDTH-1:0] datain;
  wire controlin, predicatein;
  
  wire fifo_a_valid_out;
  wire fifo_b_valid_out;
  wire fifo_c_valid_out;
  wire fifo_p_valid_out;
  
  wire are_fifos_valid;
  wire are_fifos_stalled;
  wire is_lsu_stalled;
  
  vfabric_buffered_fifo fifo_a ( .clock(clock), .resetn(resetn), 
        .data_in(i_addressin), .data_out(addressin), .valid_in(i_addressin_valid),
        .valid_out( fifo_a_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_addressin_stall) );
  defparam fifo_a.DATA_WIDTH = AWIDTH;
  defparam fifo_a.DEPTH = FIFO_DEPTH;

  vfabric_buffered_fifo fifo_b ( .clock(clock), .resetn(resetn), 
        .data_in(i_bitwiseorin), .data_out(bitwiseorin), .valid_in(i_bitwiseorin_valid),
        .valid_out( fifo_b_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_bitwiseorin_stall) );
  defparam fifo_b.DATA_WIDTH = AWIDTH;
  defparam fifo_b.DEPTH = FIFO_DEPTH;
  
  vfabric_buffered_fifo fifo_c ( .clock(clock), .resetn(resetn), 
        .data_in(i_controlin), .data_out(controlin), .valid_in(i_controlin_valid),
        .valid_out( fifo_c_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_controlin_stall) );
  defparam fifo_c.DATA_WIDTH = 1;
  defparam fifo_c.DEPTH = FIFO_DEPTH;

  vfabric_buffered_fifo fifo_p ( .clock(clock), .resetn(resetn), 
        .data_in(i_predicatein), .data_out(predicatein), .valid_in(i_predicatein_valid),
        .valid_out( fifo_p_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_predicatein_stall) );
  defparam fifo_p.DATA_WIDTH = 1;
  defparam fifo_p.DEPTH = FIFO_DEPTH;

    
  assign are_fifos_valid = fifo_a_valid_out & fifo_b_valid_out & fifo_c_valid_out & fifo_p_valid_out;
  assign are_fifos_stalled = ~(fifo_a_valid_out & fifo_b_valid_out & fifo_c_valid_out 
                               & fifo_p_valid_out & ~is_lsu_stalled);
  
  lsu_top lsu_read (.clock(clock), .resetn(resetn),
    .i_address(addressin),
    .i_predicate(predicatein),
    .i_bitwiseor(bitwiseorin),
    .i_valid(are_fifos_valid), .o_stall(is_lsu_stalled),
    .o_valid(o_dataout_valid), 
    .i_stall(i_dataout_stall),
    .o_readdata(o_dataout),
    .avm_read(avm_read),
    .avm_readdata(avm_readdata),
    .avm_readdatavalid(avm_readdatavalid),
    .avm_byteenable(avm_byteenable),
    .avm_waitrequest(avm_waitrequest),
    .avm_address(avm_address),
    .avm_burstcount(avm_burstcount),
    // profile signals
    .profile_bw(profile_bw), 
    .profile_bw_incr(profile_bw_incr),
    .profile_total_ivalid(profile_total_ivalid),
    .profile_total_req(profile_total_req),
    .profile_i_stall_count(profile_i_stall_count),
    .profile_o_stall_count(profile_o_stall_count),
    .profile_avm_readwrite_count(profile_avm_readwrite_count),
    .profile_avm_burstcount_total(profile_avm_burstcount_total),
    .profile_avm_burstcount_total_incr(profile_avm_burstcount_total_incr),
    .profile_req_cache_hit_count(profile_req_cache_hit_count),
    .profile_extra_unaligned_reqs(profile_extra_unaligned_reqs),
    .profile_avm_stall(profile_avm_stall));
  defparam lsu_read.STYLE = LSU_STYLE;
  defparam lsu_read.AWIDTH = AWIDTH;
  defparam lsu_read.WIDTH_BYTES=WIDTH_BYTES;
  defparam lsu_read.MWIDTH = MWIDTH;
  defparam lsu_read.MWIDTH_BYTES = MWIDTH_BYTES;
  defparam lsu_read.WRITEDATAWIDTH_BYTES = MWIDTH_BYTES;
  defparam lsu_read.BURSTCOUNT_WIDTH = BURSTCOUNT_WIDTH;
  defparam lsu_read.ALIGNMENT_BYTES = ALIGNMENT_BYTES;
  defparam lsu_read.USEINPUTFIFO = USEINPUTFIFO;
  defparam lsu_read.KERNEL_SIDE_MEM_LATENCY = KERNEL_SIDE_LATENCY;
  defparam lsu_read.MEMORY_SIDE_MEM_LATENCY = MEMORY_SIDE_LATENCY;
  defparam lsu_read.READ = 1;
  defparam lsu_read.ENABLE_BANKED_MEMORY = ENABLE_BANKED_MEMORY;
  defparam lsu_read.NUMBER_BANKS = NUMBER_BANKS;
  defparam lsu_read.ABITS_PER_LMEM_BANK = ABITS_PER_LMEM_BANK;
  defparam lsu_read.ACL_PROFILE = ACL_PROFILE;
 
endmodule

module vfabric_lsu_write(clock, resetn,
    i_addressin, i_addressin_valid, o_addressin_stall, 
    i_datain, i_datain_valid, o_datain_stall,
    i_controlin, i_controlin_valid, o_controlin_stall,
    i_predicatein, i_predicatein_valid, o_predicatein_stall,
    i_bitwiseorin, i_bitwiseorin_valid, o_bitwiseorin_stall,
    avm_waitrequest,
    avm_address, avm_write, 
    avm_writeack, avm_writedata, avm_byteenable, 
    avm_burstcount, o_dataout_valid, i_dataout_stall,

    // profile signals
    profile_bw, profile_bw_incr,
    profile_total_ivalid,
    profile_total_req,
    profile_i_stall_count,
    profile_o_stall_count,
    profile_avm_readwrite_count,
    profile_avm_burstcount_total, profile_avm_burstcount_total_incr,
    profile_req_cache_hit_count,
    profile_extra_unaligned_reqs,
    profile_avm_stall);

parameter LSU_STYLE = "BURST-COALESCED";
parameter AWIDTH = 32;
parameter WIDTH_BYTES = 4;
parameter DATA_WIDTH = 32;
parameter MWIDTH = 256;
parameter MWIDTH_BYTES = 32;
parameter BYTEENABLE_WIDTH = 32;
parameter BURSTCOUNT_WIDTH = 6;
parameter ALIGNMENT_BYTES = 1;
parameter ISSTRATIXV = 0;
parameter FIFO_DEPTH = 64;
parameter USEINPUTFIFO = 0;
parameter ENABLE_BANKED_MEMORY = 0;
parameter NUMBER_BANKS = 1;
parameter ABITS_PER_LMEM_BANK = 0;
parameter ACL_PROFILE = 0;

localparam KERNEL_SIDE_LATENCY = (LSU_STYLE=="PIPELINED") ? 31 : ((LSU_STYLE=="BURST-COALESCED") ? 4 : 160);
localparam MEMORY_SIDE_LATENCY = (LSU_STYLE=="BURST-NON-ALIGNED") ? 40 : 0;

  input clock, resetn;
  input [AWIDTH-1:0] i_addressin;
  input [AWIDTH-1:0] i_bitwiseorin;
  input [DATA_WIDTH-1:0] i_datain;
  input i_controlin;
  input i_predicatein;
  input i_addressin_valid, i_datain_valid, i_controlin_valid;
  output o_addressin_stall, o_datain_stall, o_controlin_stall;
  input i_bitwiseorin_valid, i_predicatein_valid;
  output o_bitwiseorin_stall, o_predicatein_stall;
  
  input avm_waitrequest;
  output [AWIDTH-1:0] avm_address;
  output avm_write;
  input avm_writeack;
  output [MWIDTH-1:0] avm_writedata;
  output [BYTEENABLE_WIDTH-1:0] avm_byteenable;
  output [BURSTCOUNT_WIDTH-1:0] avm_burstcount;
  
  input i_dataout_stall;
  output o_dataout_valid;
  
  // Profiler Signals
  output logic profile_bw;
  output logic [31:0] profile_bw_incr;
  output logic profile_total_ivalid;
  output logic profile_total_req;
  output logic profile_i_stall_count;
  output logic profile_o_stall_count;
  output logic profile_avm_readwrite_count;
  output logic profile_avm_burstcount_total;
  output logic [31:0] profile_avm_burstcount_total_incr;
  output logic profile_req_cache_hit_count;
  output logic profile_extra_unaligned_reqs;
  output logic profile_avm_stall;
 
  wire [AWIDTH-1:0] addressin;
  wire [AWIDTH-1:0] bitwiseorin;
  wire [DATA_WIDTH-1:0] datain;
  wire controlin;
  wire predicatein;
  
  wire fifo_a_valid_out;
  wire fifo_b_valid_out;
  wire fifo_c_valid_out;
  wire fifo_or_valid_out;
  wire fifo_p_valid_out;
  
  wire are_fifos_valid;
  wire are_fifos_stalled;
  wire is_lsu_stalled;
  
  vfabric_buffered_fifo fifo_a ( .clock(clock), .resetn(resetn), 
        .data_in(i_addressin), .data_out(addressin), .valid_in(i_addressin_valid),
        .valid_out( fifo_a_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_addressin_stall) );
  defparam fifo_a.DATA_WIDTH = AWIDTH;
  defparam fifo_a.DEPTH = FIFO_DEPTH;
  
  vfabric_buffered_fifo fifo_b ( .clock(clock), .resetn(resetn), 
        .data_in(i_datain), .data_out(datain), .valid_in(i_datain_valid),
        .valid_out( fifo_b_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_datain_stall) );
  defparam fifo_b.DATA_WIDTH = DATA_WIDTH;
  defparam fifo_b.DEPTH = FIFO_DEPTH;
  
  vfabric_buffered_fifo fifo_c ( .clock(clock), .resetn(resetn), 
        .data_in(i_controlin), .data_out(controlin), .valid_in(i_controlin_valid),
        .valid_out( fifo_c_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_controlin_stall) );
  defparam fifo_c.DATA_WIDTH = 1;
  defparam fifo_c.DEPTH = FIFO_DEPTH;
  
  vfabric_buffered_fifo fifo_or ( .clock(clock), .resetn(resetn), 
        .data_in(i_bitwiseorin), .data_out(bitwiseorin), .valid_in(i_bitwiseorin_valid),
        .valid_out( fifo_or_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_bitwiseorin_stall) );
  defparam fifo_or.DATA_WIDTH = AWIDTH;
  defparam fifo_or.DEPTH = FIFO_DEPTH;  
  
  vfabric_buffered_fifo fifo_p ( .clock(clock), .resetn(resetn), 
        .data_in(i_predicatein), .data_out(predicatein), .valid_in(i_predicatein_valid),
        .valid_out( fifo_p_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_predicatein_stall) );
  defparam fifo_p.DATA_WIDTH = 1;
  defparam fifo_p.DEPTH = FIFO_DEPTH;
  
  assign are_fifos_valid = fifo_a_valid_out & fifo_b_valid_out & fifo_c_valid_out 
                           & fifo_or_valid_out & fifo_p_valid_out;
  assign are_fifos_stalled = ~(fifo_a_valid_out & fifo_b_valid_out & fifo_c_valid_out 
                               & fifo_or_valid_out & fifo_p_valid_out & ~is_lsu_stalled);
  
  lsu_top lsu_write (.clock(clock), .resetn(resetn),
    .i_address(addressin),
    .i_writedata(datain),
    .i_predicate(predicatein),
    .i_bitwiseor(bitwiseorin),
    .i_valid(are_fifos_valid), .o_stall(is_lsu_stalled),				
    .o_valid(o_dataout_valid), 
    .i_stall(i_dataout_stall),
    .avm_write(avm_write),
    .avm_writeack(avm_writeack),
    .avm_writedata(avm_writedata),
    .avm_byteenable(avm_byteenable),
    .avm_waitrequest(avm_waitrequest),
    .avm_address(avm_address),
    .avm_burstcount(avm_burstcount),
    // profile signals
    .profile_bw(profile_bw), 
    .profile_bw_incr(profile_bw_incr),
    .profile_total_ivalid(profile_total_ivalid),
    .profile_total_req(profile_total_req),
    .profile_i_stall_count(profile_i_stall_count),
    .profile_o_stall_count(profile_o_stall_count),
    .profile_avm_readwrite_count(profile_avm_readwrite_count),
    .profile_avm_burstcount_total(profile_avm_burstcount_total),
    .profile_avm_burstcount_total_incr(profile_avm_burstcount_total_incr),
    .profile_req_cache_hit_count(profile_req_cache_hit_count),
    .profile_extra_unaligned_reqs(profile_extra_unaligned_reqs),
    .profile_avm_stall(profile_avm_stall));
  defparam lsu_write.STYLE = LSU_STYLE;
  defparam lsu_write.AWIDTH = AWIDTH;
  defparam lsu_write.WIDTH_BYTES=WIDTH_BYTES;
  defparam lsu_write.MWIDTH = MWIDTH;
  defparam lsu_write.MWIDTH_BYTES = MWIDTH_BYTES;
  defparam lsu_write.WRITEDATAWIDTH_BYTES = MWIDTH_BYTES;
  defparam lsu_write.BURSTCOUNT_WIDTH = BURSTCOUNT_WIDTH;
  defparam lsu_write.ALIGNMENT_BYTES = ALIGNMENT_BYTES;
  defparam lsu_write.USE_WRITE_ACK = 1;
  defparam lsu_write.READ = 0;
  defparam lsu_write.USEINPUTFIFO = USEINPUTFIFO;
  defparam lsu_write.KERNEL_SIDE_MEM_LATENCY = KERNEL_SIDE_LATENCY;
  defparam lsu_write.MEMORY_SIDE_MEM_LATENCY = MEMORY_SIDE_LATENCY;
  defparam lsu_write.ENABLE_BANKED_MEMORY = ENABLE_BANKED_MEMORY;
  defparam lsu_write.NUMBER_BANKS = NUMBER_BANKS;
  defparam lsu_write.ABITS_PER_LMEM_BANK = ABITS_PER_LMEM_BANK;
  defparam lsu_write.ACL_PROFILE = ACL_PROFILE;
 
endmodule
