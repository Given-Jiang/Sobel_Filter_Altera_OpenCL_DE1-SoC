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
    


///////////
// This is a wrapper around the vfabric_counter block, which
// makes it into a nice form to get hooked up in our virtual
// fabric
module vfabric_multiport_counter(
   clock, resetn, i_start, i_counter_reset,
   i_global_size, i_local_size, i_group_size, i_limiter_settings, 
   i_return_data, i_return_valid,

   o_global_id_2, o_global_id_2_valid, i_global_id_2_stall,
   o_global_id_1, o_global_id_1_valid, i_global_id_1_stall,
   o_global_id_0, o_global_id_0_valid, i_global_id_0_stall,

   o_local_id_2, o_local_id_2_valid, i_local_id_2_stall,
   o_local_id_1, o_local_id_1_valid, i_local_id_1_stall,
   o_local_id_0, o_local_id_0_valid, i_local_id_0_stall,
   o_local_id_3, o_local_id_3_valid, i_local_id_3_stall,

   o_group_id_2, o_group_id_2_valid, i_group_id_2_stall,
   o_group_id_1, o_group_id_1_valid, i_group_id_1_stall,
   o_group_id_0, o_group_id_0_valid, i_group_id_0_stall,
   
   o_scalar_group_id, o_scalar_group_id_valid, i_scalar_group_id_stall
);
parameter DATA_WIDTH=32;

input clock;
input resetn;
input i_start;
input i_counter_reset, i_return_valid;
input [DATA_WIDTH-1:0] i_return_data;
input [3*DATA_WIDTH-1:0] i_global_size;
input [3*DATA_WIDTH-1:0] i_local_size;
input [3*DATA_WIDTH-1:0] i_group_size;
input [DATA_WIDTH-1:0] i_limiter_settings;

output [DATA_WIDTH-1:0] o_global_id_2, o_global_id_1, o_global_id_0;
output o_global_id_2_valid, o_global_id_1_valid, o_global_id_0_valid;
input i_global_id_2_stall, i_global_id_1_stall, i_global_id_0_stall;

output [DATA_WIDTH-1:0] o_local_id_2, o_local_id_1, o_local_id_0, o_local_id_3;
output o_local_id_2_valid, o_local_id_1_valid, o_local_id_0_valid, o_local_id_3_valid;
input i_local_id_2_stall, i_local_id_1_stall, i_local_id_0_stall, i_local_id_3_stall;

output [DATA_WIDTH-1:0] o_group_id_2, o_group_id_1, o_group_id_0;
output o_group_id_2_valid, o_group_id_1_valid, o_group_id_0_valid;
input i_group_id_2_stall, i_group_id_1_stall, i_group_id_0_stall;

output [DATA_WIDTH-1:0] o_scalar_group_id;
output o_scalar_group_id_valid;
input i_scalar_group_id_stall;

  wire [DATA_WIDTH-1:0] my_global_size[2:0];
  wire [DATA_WIDTH-1:0] my_local_size[2:0];
  wire [DATA_WIDTH-1:0] my_group_size[2:0];

  wire [DATA_WIDTH-1:0] my_global_id[2:0];
  wire [DATA_WIDTH-1:0] my_local_id[2:0];
  wire [DATA_WIDTH-1:0] my_group_id[2:0];
  wire [DATA_WIDTH-1:0] my_scalar_local_id;
  wire [DATA_WIDTH-1:0] my_scalar_group_id;
  wire [DATA_WIDTH-1:0] my_local_id_3;
  wire counter_valid;
  wire counter_stall;
  
  assign my_global_size[2] = i_global_size[3*DATA_WIDTH-1:2*DATA_WIDTH];
  assign my_global_size[1] = i_global_size[2*DATA_WIDTH-1:DATA_WIDTH];
  assign my_global_size[0] = i_global_size[DATA_WIDTH-1:0];
  assign my_local_size[2] = i_local_size[3*DATA_WIDTH-1:2*DATA_WIDTH];
  assign my_local_size[1] = i_local_size[2*DATA_WIDTH-1:DATA_WIDTH];
  assign my_local_size[0] = i_local_size[DATA_WIDTH-1:0];
  assign my_group_size[2] = i_group_size[3*DATA_WIDTH-1:2*DATA_WIDTH];
  assign my_group_size[1] = i_group_size[2*DATA_WIDTH-1:DATA_WIDTH];
  assign my_group_size[0] = i_group_size[DATA_WIDTH-1:0];
  assign my_local_id_3 = {my_scalar_group_id[2:0], my_scalar_local_id[28:0]};

  vfabric_counter counter_0(
    .clock(clock),
    .resetn(resetn),
    .i_start(i_start),
    .i_counter_reset(i_counter_reset),
    .i_local_size(my_local_size),
    .i_global_size(my_global_size),
    .i_group_size(my_group_size),
    
    // The counter values to output to fabric (if needed)
    .local_id(my_local_id),
    .global_id(my_global_id),
    .group_id(my_group_id),
    .scalar_local_id(my_scalar_local_id),
    .scalar_group_id(my_scalar_group_id),
    .o_dataout_valid(counter_valid),
    .i_dataout_stall(counter_stall)
  );
  defparam counter_0.WIDTH = DATA_WIDTH;
 
  wire [DATA_WIDTH-1:0] limiter_data;
  wire limiter_valid, limiter_stall; 

  wire [12*DATA_WIDTH-1:0] mega_counter;
  wire [12*DATA_WIDTH-1:0] mega_dataout;
  assign mega_counter = {my_local_id_3, my_local_id_3, 
                       my_global_id[2], my_global_id[1], my_global_id[0], 
                       my_local_id[2], my_local_id[1], my_local_id[0], 
                       my_group_id[2], my_group_id[1], my_group_id[0],
                       my_scalar_group_id};
  
  fanout_splitter mega_splitter(.clock(clock), .resetn(resetn), 
      .i_datain(mega_counter), .i_datain_valid(counter_valid), 
      .o_datain_stall(counter_stall), .o_dataout(mega_dataout), 
      .i_dataout_stall({i_local_id_3_stall, limiter_stall, 
                        i_global_id_2_stall, i_global_id_1_stall, i_global_id_0_stall,
                        i_local_id_2_stall, i_local_id_1_stall, i_local_id_0_stall,
                        i_group_id_2_stall, i_group_id_1_stall, i_group_id_0_stall, 
                        i_scalar_group_id_stall}),
      .o_dataout_valid({o_local_id_3_valid, limiter_valid, 
                        o_global_id_2_valid, o_global_id_1_valid, o_global_id_0_valid,
                        o_local_id_2_valid, o_local_id_1_valid, o_local_id_0_valid, 
                        o_group_id_2_valid, o_group_id_1_valid, o_group_id_0_valid,
                        o_scalar_group_id_valid})); 
  defparam mega_splitter.DATA_WIDTH = 12*DATA_WIDTH;
  defparam mega_splitter.NUM_FANOUTS = 12;
  
  assign o_scalar_group_id = mega_dataout[DATA_WIDTH-1:0];
  assign o_group_id_0 = mega_dataout[2*DATA_WIDTH-1:DATA_WIDTH];
  assign o_group_id_1 = mega_dataout[3*DATA_WIDTH-1:2*DATA_WIDTH];
  assign o_group_id_2 = mega_dataout[4*DATA_WIDTH-1:3*DATA_WIDTH];
  assign o_local_id_0 = mega_dataout[5*DATA_WIDTH-1:4*DATA_WIDTH];
  assign o_local_id_1 = mega_dataout[6*DATA_WIDTH-1:5*DATA_WIDTH];
  assign o_local_id_2 = mega_dataout[7*DATA_WIDTH-1:6*DATA_WIDTH];
  assign o_global_id_0 = mega_dataout[8*DATA_WIDTH-1:7*DATA_WIDTH];
  assign o_global_id_1 = mega_dataout[9*DATA_WIDTH-1:8*DATA_WIDTH];
  assign o_global_id_2 = mega_dataout[10*DATA_WIDTH-1:9*DATA_WIDTH];  
  assign limiter_data = mega_dataout[11*DATA_WIDTH-1:10*DATA_WIDTH];
  assign o_local_id_3 = mega_dataout[12*DATA_WIDTH-1:11*DATA_WIDTH];

  vfabric_limiter limiter0(.clock(clock), .resetn(resetn),
    .i_datain(limiter_data), .i_datain_valid(limiter_valid), 
    .o_datain_stall(limiter_stall), 
    .i_return_data(i_return_data), .i_return_valid(i_return_valid), 
    .i_counter_reset(i_counter_reset), .i_limiter_settings(i_limiter_settings));
  defparam limiter0.DATA_WIDTH = DATA_WIDTH;

endmodule

