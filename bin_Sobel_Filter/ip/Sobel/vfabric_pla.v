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
    


module vfabric_pla(clock, resetn, 
    i_dataa, i_dataa_valid, o_dataa_stall, i_datab, i_datab_valid, o_datab_stall,
    i_datac, i_datac_valid, o_datac_stall, i_datad, i_datad_valid, o_datad_stall,
    o_dataout, o_dataout_valid, i_stall, i_settings, i_start);

parameter DATA_WIDTH = 1;
parameter CONFIG_WIDTH = 20;
parameter FIFO_DEPTH = 64;
//if upper bits are 0, it means the corresponding data port is not used

 input clock, resetn;
 input [DATA_WIDTH-1:0] i_dataa;
 input [DATA_WIDTH-1:0] i_datab;
 input [DATA_WIDTH-1:0] i_datac;
 input [DATA_WIDTH-1:0] i_datad;
 input i_dataa_valid, i_datab_valid, i_datac_valid, i_datad_valid;
 output o_dataa_stall, o_datab_stall, o_datac_stall, o_datad_stall;
 output [DATA_WIDTH-1:0] o_dataout;
 output o_dataout_valid;
 input i_stall;
 input [CONFIG_WIDTH-1:0] i_settings;
 input i_start;

 wire [DATA_WIDTH-1:0] dataa;
 wire [DATA_WIDTH-1:0] datab;
 wire [DATA_WIDTH-1:0] datac;
 wire [DATA_WIDTH-1:0] datad;

 //wire [8*DATA_WIDTH-1:0] interim_data;
 wire [4*DATA_WIDTH-1:0] interim_data;
 wire fifo_a_valid_out;
 wire fifo_b_valid_out;
 wire fifo_c_valid_out;
 wire fifo_d_valid_out;
 
 wire is_fifo_a_valid;
 wire is_fifo_b_valid;
 wire is_fifo_c_valid;
 wire is_fifo_d_valid;
 wire is_stalled;
 
 reg [DATA_WIDTH-1:0] and1a;
 reg [DATA_WIDTH-1:0] and1b;
 reg [DATA_WIDTH-1:0] and2a;
 reg [DATA_WIDTH-1:0] and2b;
 
 vfabric_buffered_fifo fifo_a ( .clock(clock), .resetn(resetn), 
      .data_in(i_dataa), .data_out(dataa), .valid_in(i_dataa_valid),
      .valid_out( fifo_a_valid_out ), .stall_in(is_stalled), .stall_out(o_dataa_stall) );
 defparam fifo_a.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_a.DEPTH = FIFO_DEPTH;
 
 vfabric_buffered_fifo fifo_b ( .clock(clock), .resetn(resetn), 
      .data_in(i_datab), .data_out(datab), .valid_in(i_datab_valid),
      .valid_out( fifo_b_valid_out ), .stall_in(is_stalled), .stall_out(o_datab_stall) );
 defparam fifo_b.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_b.DEPTH = FIFO_DEPTH;
 
 vfabric_buffered_fifo fifo_c ( .clock(clock), .resetn(resetn), 
      .data_in(i_datac), .data_out(datac), .valid_in(i_datac_valid),
      .valid_out( fifo_c_valid_out ), .stall_in(is_stalled), .stall_out(o_datac_stall) );
 defparam fifo_c.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_c.DEPTH = FIFO_DEPTH;
 
 vfabric_buffered_fifo fifo_d ( .clock(clock), .resetn(resetn), 
      .data_in(i_datad), .data_out(datad), .valid_in(i_datad_valid),
      .valid_out( fifo_d_valid_out ), .stall_in(is_stalled), .stall_out(o_datad_stall) );
 defparam fifo_d.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_d.DEPTH = FIFO_DEPTH;
 
 assign is_fifo_a_valid = fifo_a_valid_out | ~i_settings[16]; 
 assign is_fifo_b_valid = fifo_b_valid_out | ~i_settings[17];
 assign is_fifo_c_valid = fifo_c_valid_out | ~i_settings[18];
 assign is_fifo_d_valid = fifo_d_valid_out | ~i_settings[19];
 
 assign is_stalled = ~(is_fifo_a_valid & is_fifo_b_valid & is_fifo_c_valid & is_fifo_d_valid & ~i_stall);

 genvar i;
 generate
 for(i = 0; i < DATA_WIDTH; i++)
 begin : pla_gen
    assign interim_data[4*(i+1)-1:4*i] = {datad[i], datac[i], datab[i], dataa[i]};
    assign o_dataout[i] = i_settings[interim_data[4*(i+1)-1:4*i]];
 end
 endgenerate

 //assign interim_data = {datad, datac, datab, dataa};
 //assign o_dataout = i_settings[interim_data];
 
// assign interim_data = {datad, datac, datab, dataa, !datad, !datac, !datab, !dataa};
 
// assign o_dataout = (interim_data[i_settings[11:9]] & interim_data[i_settings[8:6]] & interim_data[i_settings[5:3]] & interim_data[i_settings[2:0]])
// 						 + (interim_data[i_settings[23:21]] & interim_data[i_settings[20:18]] & interim_data[i_settings[17:15]] & interim_data[i_settings[14:12]]);

 assign o_dataout_valid = i_start & is_fifo_a_valid & is_fifo_b_valid & is_fifo_c_valid & is_fifo_d_valid;
 
endmodule
