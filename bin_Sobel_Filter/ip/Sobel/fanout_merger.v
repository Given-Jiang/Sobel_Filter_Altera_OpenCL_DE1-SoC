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
    


module fanout_merger(clock, resetn, 
  i_datain, i_datain_valid, o_datain_stall, 
  o_dataout, i_dataout_stall, o_dataout_valid,
  i_settings, i_start);

parameter DATA_WIDTH = 32;
parameter NUM_FANINS = 4;
parameter NUM_CONFIG_BITS = 3;
parameter IN_SIMPLE_MODE = 0;

 input clock, resetn;
 input [NUM_FANINS*DATA_WIDTH-1:0] i_datain;
 input [NUM_FANINS-1:0] i_datain_valid;
 output [NUM_FANINS-1:0] o_datain_stall;
 output [DATA_WIDTH-1:0] o_dataout;
 input i_dataout_stall;
 output  o_dataout_valid;
 input [NUM_CONFIG_BITS-1:0] i_settings;
 input i_start;

reg [DATA_WIDTH-1:0] inter;
 
generate
  if ( IN_SIMPLE_MODE == 1) // just implement giant OR gate
  begin

    always @(*)
    begin
     integer i,j;
     for (i=0; i < DATA_WIDTH; i =i+1)
     begin
        inter[i] = 1'b0;
        for (j=0; j < NUM_FANINS; j = j+1)
        begin
           inter[i] = inter[i] | i_datain[j*DATA_WIDTH+i];
        end
     end
    end
     assign o_dataout = inter;
     assign o_dataout_valid = |i_datain_valid;  
     assign o_datain_stall = {NUM_FANINS{i_dataout_stall}};
  end
  else
  begin
    //assign o_dataout = !(i_settings[0] & i_start) ? {DATA_WIDTH{1'b0}} : i_datain[DATA_WIDTH*i_settings[NUM_CONFIG_BITS-1:1] +: DATA_WIDTH];

    assign o_dataout = i_datain[DATA_WIDTH*i_settings[NUM_CONFIG_BITS-1:1] +: DATA_WIDTH];

    assign o_dataout_valid = !(i_settings[0] & i_start) ? 1'b0 : i_datain_valid[i_settings[NUM_CONFIG_BITS-1:1]];
  
    assign o_datain_stall = !(i_settings[0] & i_start) ? {NUM_FANINS{1'b0}} : {{NUM_FANINS{1'b0}}, i_dataout_stall} << i_settings[NUM_CONFIG_BITS-1:1];
  end
endgenerate

endmodule
