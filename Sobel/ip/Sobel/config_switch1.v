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
    


module config_switch1(clock, clock2x, resetn,
  i_datain, i_datain_valid, o_datain_stall,
  o_dataout, o_dataout_valid, i_dataout_stall, 
  i_config_settings);

parameter DATA_WIDTH = 1;
parameter NUM_CONFIG_BITS = 59;
parameter NUM_FANINS = 20;
parameter NUM_FANOUTS = 20;
parameter CONFIG_SWITCH_ID = 1;
parameter NUM_CONNECTED_INPUTS = 20;
parameter IMPLEMENTATION_MODE = "RAM";

 input clock, clock2x, resetn;
 input [NUM_FANINS*DATA_WIDTH-1:0] i_datain;
 input [NUM_FANINS-1:0] i_datain_valid;
 output [NUM_FANINS-1:0] o_datain_stall;
 output [NUM_FANOUTS*DATA_WIDTH-1:0] o_dataout;
 output [NUM_FANOUTS-1:0] o_dataout_valid;
 input [NUM_FANOUTS-1:0] i_dataout_stall;
 input [NUM_CONFIG_BITS-1:0] i_config_settings;
 
// i_config_settings is currently a concatentation of 
// 1 bit (to specify that we are in config mode) and
// 58 bits (from what we wrote in from cra)
//    -  7 bits is the config switch ID
//    -  1 bit to specify this is fwd or bkwd
//    - 10 bits is for the wr_addr for the ram
//    - 20 bits data to write to upper ram
//    - 20 bits data to write to lower ram

wire to_config_me;
wire to_config_fwd_path, to_config_bkwd_path;

assign to_config_me = i_config_settings[NUM_CONFIG_BITS-1] & 
                  (i_config_settings[57:51] == CONFIG_SWITCH_ID );
assign to_config_fwd_path = to_config_me & ~i_config_settings[50];
assign to_config_bkwd_path = to_config_me & i_config_settings[50];

// double pump the data signal alongside the valid signal
wire [NUM_FANOUTS*DATA_WIDTH-1:0] lower_data_out, upper_data_out;
wire [NUM_FANOUTS-1:0] lower_valid_out, upper_valid_out;
  
  switch10x20_top lower_data ( .clock(clock), .clock2x(clock2x), .resetn(resetn), 
    .wren(to_config_fwd_path), .data(i_config_settings[19:0]),
    .wraddress(i_config_settings[49:40]),
    .rdaddress1(i_datain[9:0]),
    .rdaddress2(i_datain_valid[9:0]),
    .q1(lower_data_out[19:0]),
    .q2(lower_valid_out));
    defparam lower_data.IMPLEMENTATION_MODE = "MLAB";//IMPLEMENTATION_MODE;

generate
if (NUM_CONNECTED_INPUTS > 10)
begin
  switch10x20_top upper_data ( .clock(clock), .clock2x(clock2x), .resetn(resetn),
    .wren(to_config_fwd_path), .data(i_config_settings[39:20]),
    .wraddress(i_config_settings[49:40]),
    .rdaddress1(i_datain[19:10]),
    .rdaddress2(i_datain_valid[19:10]),          
    .q1(upper_data_out[19:0]), 
    .q2(upper_valid_out)); 
    defparam upper_data.IMPLEMENTATION_MODE = "MLAB"; //IMPLEMENTATION_MODE;
end
else
begin
  assign upper_data_out = {DATA_WIDTH*NUM_FANOUTS{1'b0}};
  assign upper_valid_out = {NUM_FANOUTS{1'b0}};
end
endgenerate

assign o_dataout = lower_data_out | upper_data_out;
assign o_dataout_valid = lower_valid_out | upper_valid_out;
      
wire [NUM_FANINS-1:0] temp_stalla, temp_stallb;

  // make the stall signal
  switch10x20 tstalla( .clock(clock), .wren(to_config_bkwd_path),
      .data(i_config_settings[19:0]),
      .wraddress(i_config_settings[49:40]),      
      .rdaddress(i_dataout_stall[9:0]),
      .q(temp_stalla));
    defparam tstalla.IMPLEMENTATION_MODE = "MLAB"; //IMPLEMENTATION_MODE;

  switch10x20 tstallb( .clock(clock), .wren(to_config_bkwd_path),
      .data(i_config_settings[39:20]),
      .wraddress(i_config_settings[49:40]),      
      .rdaddress(i_dataout_stall[19:10]),
      .q(temp_stallb));
    defparam tstallb.IMPLEMENTATION_MODE = "MLAB"; //IMPLEMENTATION_MODE;
 
  assign o_datain_stall = temp_stalla | temp_stallb;
  
endmodule


