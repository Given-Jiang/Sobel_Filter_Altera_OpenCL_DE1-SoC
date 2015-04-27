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
    


module vfabric_select(clock, resetn, 
  i_dataa, i_dataa_valid, o_dataa_stall, 
  i_datab, i_datab_valid, o_datab_stall, 
  i_controla, i_controla_valid, o_controla_stall,
  i_controlb, i_controlb_valid, o_controlb_stall,
  i_datasel, i_datasel_valid, o_datasel_stall, 
  o_dataout, o_dataout_valid, i_stall,
  i_settings);

parameter DATA_WIDTH = 32;
parameter FIFO_DEPTH = 64;
parameter CONFIG_WIDTH = 7;

 input clock, resetn;
 input [DATA_WIDTH-1:0] i_dataa;
 input [DATA_WIDTH-1:0] i_datab;
 input i_controla, i_controlb;
 input i_datasel;
 
 input i_dataa_valid, i_datab_valid, i_controla_valid, i_controlb_valid, i_datasel_valid;
 output o_dataa_stall, o_datab_stall, o_controla_stall, o_controlb_stall, o_datasel_stall;
 output [DATA_WIDTH-1:0] o_dataout;
 output o_dataout_valid;
 input i_stall;
 input [CONFIG_WIDTH-1:0] i_settings;
      //bit 0: if controla is connected (default = 0)
      //bit 1: if controla is conditional (default = 0)
      //bit 2: the condition of controla (default = 0)
      //bit 3: if controlb is connected (default = 0)
      //bit 4: if controlb is conditional (default = 0)
      //bit 5: the condition of controlb (default = 0)
      //bit 6: 1 if this is a phi

 wire [DATA_WIDTH-1:0] raw_dataa, dataa;
 wire [DATA_WIDTH-1:0] raw_datab, datab;
 wire raw_controla, raw_controlb;
 wire is_raw_controla_valid, is_raw_controlb_valid;
 wire datasel;
 wire is_a_phi;
  
 wire is_fifo_a_valid, is_raw_dataa_valid;
 wire is_fifo_b_valid, is_raw_datab_valid;
 wire is_fifo_sel_valid;
 wire is_fifo_a_stalled, is_fifo_b_stalled;
 wire is_fifo_sel_stalled;
 
 wire is_raw_porta_stalled, is_raw_portb_stalled;
 wire porta_data_valid, portb_data_valid;
 
 wire fifo_a_stall, fifo_b_stall;
 wire controla_stall, controlb_stall;
 
 wire is_phi_sel_stalled;
 wire is_phi_a_stalled, is_phi_b_stalled;
 wire is_select_stalled;
 
 wire is_phi_output_valid;
 wire is_select_output_valid;
 
 assign is_a_phi = i_settings[6];

 // 3 FIFOs per input of the PHI:  Port A
generate
if (DATA_WIDTH == 1)
begin
  vfabric_buffered_fifo fifo_raw_dataa ( .clock(clock), .resetn(resetn), 
      .data_in(i_dataa), .data_out(raw_dataa), .valid_in(i_dataa_valid),
      .valid_out( is_raw_dataa_valid ), .stall_in(is_raw_porta_stalled), .stall_out(o_dataa_stall) );
  defparam fifo_raw_dataa.DATA_WIDTH = DATA_WIDTH;
  defparam fifo_raw_dataa.DEPTH = 512; //FIFO_DEPTH;
  defparam fifo_raw_dataa.IMPLEMENTATION_MODE = "MLAB";
end
else
begin
  vfabric_buffered_fifo fifo_raw_dataa ( .clock(clock), .resetn(resetn), 
      .data_in(i_dataa), .data_out(raw_dataa), .valid_in(i_dataa_valid),
      .valid_out( is_raw_dataa_valid ), .stall_in(is_raw_porta_stalled), .stall_out(o_dataa_stall) );
  defparam fifo_raw_dataa.DATA_WIDTH = DATA_WIDTH;
  defparam fifo_raw_dataa.DEPTH = 512; //FIFO_DEPTH;
  defparam fifo_raw_dataa.IMPLEMENTATION_MODE = "RAM";
end
endgenerate
 
 vfabric_buffered_fifo fifo_controla ( .clock(clock), .resetn(resetn), 
      .data_in( (is_a_phi) ? i_controla : 1'b1 ), .data_out(raw_controla), 
      .valid_in( (is_a_phi) ? i_controla_valid : i_dataa_valid ),
      .valid_out( is_raw_controla_valid ), 
      .stall_in(is_raw_porta_stalled), .stall_out(controla_stall ) );
 defparam fifo_controla.DATA_WIDTH = 1;
 defparam fifo_controla.DEPTH = 512;//FIFO_DEPTH;
 
 assign is_raw_porta_stalled = ~(is_raw_dataa_valid & is_raw_controla_valid & ~fifo_a_stall);
 
 assign porta_data_valid = is_raw_dataa_valid & is_raw_controla_valid &
                           i_settings[0] & (~i_settings[1] | (raw_controla == i_settings[2])); 

 acl_mlab_fifo fifo_a ( .clock(clock), .resetn(resetn),
      .data_in(raw_dataa), .data_out(dataa), .valid_in(porta_data_valid),
      .valid_out( is_fifo_a_valid ), .stall_in(is_fifo_a_stalled), .stall_out(fifo_a_stall));
 defparam fifo_a.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_a.DEPTH = FIFO_DEPTH;
 
 // 3 FIFOs per input of the PHI:  Port B
generate
if (DATA_WIDTH == 1)
begin
  vfabric_buffered_fifo fifo_raw_datab ( .clock(clock), .resetn(resetn), 
      .data_in(i_datab), .data_out(raw_datab), .valid_in(i_datab_valid),
      .valid_out( is_raw_datab_valid ), .stall_in(is_raw_portb_stalled), .stall_out(o_datab_stall) );
  defparam fifo_raw_datab.DATA_WIDTH = DATA_WIDTH;
  defparam fifo_raw_datab.DEPTH = 512; //FIFO_DEPTH;
  defparam fifo_raw_datab.IMPLEMENTATION_MODE = "MLAB";
end
else 
begin
  vfabric_buffered_fifo fifo_raw_datab ( .clock(clock), .resetn(resetn), 
      .data_in(i_datab), .data_out(raw_datab), .valid_in(i_datab_valid),
      .valid_out( is_raw_datab_valid ), .stall_in(is_raw_portb_stalled), .stall_out(o_datab_stall) );
  defparam fifo_raw_datab.DATA_WIDTH = DATA_WIDTH;
  defparam fifo_raw_datab.DEPTH = 512; //FIFO_DEPTH;
  defparam fifo_raw_datab.IMPLEMENTATION_MODE = "RAM";
end
endgenerate

 vfabric_buffered_fifo fifo_controlb ( .clock(clock), .resetn(resetn), 
      .data_in( (is_a_phi) ? i_controlb : 1'b1 ), .data_out(raw_controlb), 
      .valid_in( (is_a_phi) ? i_controlb_valid : i_datab_valid ),
      .valid_out( is_raw_controlb_valid ), 
      .stall_in(is_raw_portb_stalled), .stall_out(controlb_stall) );
 defparam fifo_controlb.DATA_WIDTH = 1;
 defparam fifo_controlb.DEPTH = 512; //FIFO_DEPTH;

 assign is_raw_portb_stalled = ~(is_raw_datab_valid & is_raw_controlb_valid & ~fifo_b_stall);
 
 assign portb_data_valid = is_raw_datab_valid & is_raw_controlb_valid &
                           i_settings[3] & (~i_settings[4] | (raw_controlb == i_settings[5])); 
 
 acl_mlab_fifo fifo_b ( .clock(clock), .resetn(resetn),
      .data_in(raw_datab), .data_out(datab), .valid_in(portb_data_valid),
      .valid_out( is_fifo_b_valid ), .stall_in(is_fifo_b_stalled), .stall_out(fifo_b_stall));
 defparam fifo_b.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_b.DEPTH = FIFO_DEPTH;
  
 assign o_controla_stall = (is_a_phi) ? controla_stall : 1'b0;
 assign o_controlb_stall = (is_a_phi) ? controlb_stall : 1'b0;

 vfabric_buffered_fifo fifo_sel ( .clock(clock), .resetn(resetn), 
      .data_in(i_datasel), .data_out(datasel), .valid_in(i_datasel_valid),
      .valid_out( is_fifo_sel_valid ), .stall_in(is_fifo_sel_stalled), .stall_out(o_datasel_stall) );
 defparam fifo_sel.DATA_WIDTH = 1;
 defparam fifo_sel.DEPTH = 512; //FIFO_DEPTH;

 // this is the signal where they all drain at the same rate
 assign is_select_stalled = ~(is_fifo_a_valid & is_fifo_b_valid & is_fifo_sel_valid & ~i_stall);
 
 assign is_phi_a_stalled = ~(is_fifo_a_valid & ~datasel & is_fifo_sel_valid & ~i_stall);
 assign is_phi_b_stalled = ~(is_fifo_b_valid & datasel & is_fifo_sel_valid & ~i_stall);
 
 assign is_phi_sel_stalled = is_fifo_sel_valid & 
                         (( ~datasel & is_phi_a_stalled) | (datasel & is_phi_b_stalled));
  
 assign is_fifo_a_stalled = is_a_phi ? is_phi_a_stalled : is_select_stalled;
 assign is_fifo_b_stalled = is_a_phi ? is_phi_b_stalled : is_select_stalled;
 assign is_fifo_sel_stalled = is_a_phi ? is_phi_sel_stalled : is_select_stalled;

 wire [DATA_WIDTH-1:0] select_dataout, phi_dataout;
 
 assign select_dataout = datasel ? dataa : datab;
 assign phi_dataout = datasel ? datab : dataa;
 assign o_dataout = is_a_phi ? phi_dataout : select_dataout;

 assign is_select_output_valid = is_fifo_a_valid & is_fifo_b_valid & is_fifo_sel_valid;
 assign is_phi_output_valid = is_fifo_sel_valid & ((is_fifo_a_valid & ~datasel) | (is_fifo_b_valid & datasel));
 
 assign o_dataout_valid = is_a_phi ? is_phi_output_valid : is_select_output_valid;
 
endmodule
