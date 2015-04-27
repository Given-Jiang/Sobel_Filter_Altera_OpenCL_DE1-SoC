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
    


module vfabric_udiv(clock, resetn, 
        i_dataa, i_dataa_valid, o_dataa_stall, 
        i_datab, i_datab_valid, o_datab_stall, 
        o_dataouta, o_dataouta_valid, i_dataouta_stall,
        o_dataoutb, o_dataoutb_valid, i_dataoutb_stall);

parameter DATA_WIDTH = 32;
parameter LATENCY = 32;
parameter FIFO_DEPTH = 64;

 input clock, resetn;
 input [DATA_WIDTH-1:0] i_dataa;
 input [DATA_WIDTH-1:0] i_datab;
 input i_dataa_valid, i_datab_valid;
 output o_dataa_stall, o_datab_stall;
 output [DATA_WIDTH-1:0] o_dataouta, o_dataoutb;
 output o_dataouta_valid, o_dataoutb_valid;
 input i_dataouta_stall, i_dataoutb_stall;

 reg [LATENCY-1:0] shift_reg_valid;
 
 wire [DATA_WIDTH-1:0] dataa;
 wire [DATA_WIDTH-1:0] datab;

 wire is_fifo_a_valid;
 wire is_fifo_b_valid;
 wire is_stalled;
 wire is_fifo_stalled;
 
 vfabric_buffered_fifo fifo_a ( .clock(clock), .resetn(resetn), 
      .data_in(i_dataa), .data_out(dataa), .valid_in(i_dataa_valid),
      .valid_out( is_fifo_a_valid ), .stall_in(is_fifo_stalled), .stall_out(o_dataa_stall) );
 defparam fifo_a.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_a.DEPTH = FIFO_DEPTH;
 
 vfabric_buffered_fifo fifo_b ( .clock(clock), .resetn(resetn), 
      .data_in(i_datab), .data_out(datab), .valid_in(i_datab_valid),
      .valid_out( is_fifo_b_valid ), .stall_in(is_fifo_stalled), .stall_out(o_datab_stall) );
 defparam fifo_b.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_b.DEPTH = FIFO_DEPTH;
 
 always @(posedge clock or negedge resetn)
 begin
  if (~resetn)
    begin
    shift_reg_valid <= {LATENCY{1'b0}};
  end
  else
  begin
    if(~is_stalled)
      shift_reg_valid <= { is_fifo_a_valid & is_fifo_b_valid, shift_reg_valid[LATENCY-1:1] };
  end
 end
 
 assign is_stalled = (shift_reg_valid[0] & (i_dataouta_stall | i_dataoutb_stall));
 assign is_fifo_stalled = (shift_reg_valid[0] & (i_dataouta_stall | i_dataoutb_stall)) | !(is_fifo_a_valid & is_fifo_b_valid);
 
 acl_int_div32u udiv_unit(
   .enable(~is_stalled), .clock(clock), .denom(datab), .numer(dataa), .quotient(o_dataouta),
   .remain(o_dataoutb));

 assign o_dataouta_valid = shift_reg_valid[0];
 assign o_dataoutb_valid = shift_reg_valid[0];
 
endmodule
