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
    


module vfabric_return(clock, resetn, 
    i_returnin, i_returnin_valid, o_returnin_stall, 
    i_dataa, i_dataa_valid, o_dataa_stall, 
    i_datab, i_datab_valid, o_datab_stall,
    i_datac, i_datac_valid, o_datac_stall, i_datad, i_datad_valid, o_datad_stall,
    o_kernel_done, i_start, i_counter_value, i_settings, i_counter_reset,
    o_counter_value, o_return_data,  o_return_valid);

parameter DATA_WIDTH = 1;
parameter RETURN_DATA_WIDTH = 32;
parameter CONFIG_WIDTH = 4;
parameter FIFO_DEPTH = 64;

  input clock, resetn;
  input [RETURN_DATA_WIDTH-1:0] i_returnin;
  input [DATA_WIDTH-1:0] i_dataa, i_datab, i_datac, i_datad;
  input i_dataa_valid, i_datab_valid, i_datac_valid, i_datad_valid, i_returnin_valid;
  output o_dataa_stall, o_datab_stall, o_datac_stall, o_datad_stall, o_returnin_stall;
  output [DATA_WIDTH-1:0] o_kernel_done;
  output reg [RETURN_DATA_WIDTH-1:0] o_return_data;
  output reg o_return_valid;
  
  input i_start;
  input [31:0] i_counter_value;
  input [CONFIG_WIDTH-1:0] i_settings;
  input i_counter_reset;
  
  output [31:0] o_counter_value;
 
  wire is_fifo_stalled; 
  wire is_returnin_valid, thread_finished;
  wire data_to_count, data_to_count_valid;
  wire [RETURN_DATA_WIDTH-1:0] returnin;

  reg [31:0] counter_val;

  wire fifo_a_valid, fifo_b_valid, fifo_c_valid, fifo_d_valid;
  wire is_fifo_a_valid, is_fifo_b_valid, is_fifo_c_valid, is_fifo_d_valid;

  vfabric_counter_fifo fifo_a( .clock(clock), .resetn(resetn), 
     .i_counter_reset(i_counter_reset), 
     .i_datain_valid(i_dataa_valid), .o_datain_stall(o_dataa_stall),
     .o_dataout_valid(fifo_a_valid), .i_dataout_stall(is_fifo_stalled));

  vfabric_counter_fifo fifo_b( .clock(clock), .resetn(resetn), 
     .i_counter_reset(i_counter_reset),
     .i_datain_valid(i_datab_valid), .o_datain_stall(o_datab_stall),
     .o_dataout_valid(fifo_b_valid), .i_dataout_stall(is_fifo_stalled));
 
  vfabric_counter_fifo fifo_c( .clock(clock), .resetn(resetn), 
     .i_counter_reset(i_counter_reset),
     .i_datain_valid(i_datac_valid), .o_datain_stall(o_datac_stall),
     .o_dataout_valid(fifo_c_valid), .i_dataout_stall(is_fifo_stalled));

  vfabric_counter_fifo fifo_d( .clock(clock), .resetn(resetn), 
     .i_counter_reset(i_counter_reset),
     .i_datain_valid(i_datad_valid), .o_datain_stall(o_datad_stall),
     .o_dataout_valid(fifo_d_valid), .i_dataout_stall(is_fifo_stalled));

  assign is_fifo_a_valid = fifo_a_valid | ~i_settings[0];
  assign is_fifo_b_valid = fifo_b_valid | ~i_settings[1];
  assign is_fifo_c_valid = fifo_c_valid | ~i_settings[2];
  assign is_fifo_d_valid = fifo_d_valid | ~i_settings[3];

  // this fifo buffers up the returnin data 
  vfabric_buffered_fifo fifo_ret ( .clock(clock), .resetn(resetn),
      .data_in(i_returnin), .data_out(returnin), .valid_in(i_returnin_valid),
      .valid_out( is_returnin_valid ), .stall_in(is_fifo_stalled), 
      .stall_out(o_returnin_stall) );
  defparam fifo_ret.DATA_WIDTH = RETURN_DATA_WIDTH;
  defparam fifo_ret.DEPTH = 2048;
  defparam fifo_ret.IMPLEMENTATION_MODE = "RAM";

  assign thread_finished = i_start & is_fifo_a_valid & 
       is_fifo_b_valid & is_fifo_c_valid & is_fifo_d_valid & is_returnin_valid;
  assign is_fifo_stalled = ~(is_fifo_a_valid & is_fifo_b_valid & is_fifo_c_valid 
                             & is_fifo_d_valid & is_returnin_valid);

  always@(posedge clock or negedge resetn)
  begin
   if(~resetn)
   begin
      counter_val <= {CONFIG_WIDTH{1'b0}}; 
   end
   else
   begin
        if (i_counter_reset)
                counter_val <= {CONFIG_WIDTH{1'b0}}; 
   	else if (thread_finished)
   		counter_val <= counter_val + 1;
   end
  end
  
  always@(posedge clock or negedge resetn)
  begin
   if(~resetn)
   begin
      o_return_data <= {RETURN_DATA_WIDTH{1'b0}};
      o_return_valid <= 1'b0;
   end
   else
   begin
      if (i_counter_reset)
      begin
        o_return_data <= {RETURN_DATA_WIDTH{1'b0}};
        o_return_valid <= 1'b0;
      end
      else
      begin
        o_return_data <= returnin;  
	o_return_valid <= thread_finished;
      end
   end
  end

  assign o_kernel_done = (i_start && !i_counter_reset && (counter_val == i_counter_value)) ? {DATA_WIDTH{1'b1}} : {DATA_WIDTH{1'b0}};
  assign o_counter_value = counter_val;
 
endmodule
