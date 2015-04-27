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
    


module vfabric_branch_select(clock, resetn, 
    i_dataa, i_dataa_valid, o_dataa_stall, 
    i_datab, i_datab_valid, o_datab_stall, 
    o_dataout, i_dataout_stall, o_dataout_valid,
    i_counter_value,
    i_settings);
parameter DATA_WIDTH = 1;
parameter CONFIG_WIDTH= 7;
parameter FIFO_DEPTH = 64;
parameter WORKGROUP_SIZE_BITS = 10;

  input clock, resetn;
  input [DATA_WIDTH-1:0] i_dataa;
  input [DATA_WIDTH-1:0] i_datab;
  input i_dataa_valid, i_datab_valid;
  output o_dataa_stall, o_datab_stall;
  output [DATA_WIDTH-1:0] o_dataout;
  output o_dataout_valid;
  input i_dataout_stall;
  input [31:0] i_counter_value;
  input [CONFIG_WIDTH-1:0] i_settings; 
    //bit 0: if branch_a is connected (default = 0)
    //bit 1: if branch_a is conditional (default = 0)
    //bit 2: the condition of branch_a (default = 0)
    //bit 3: if branch_b is connected (default = 0)
    //bit 4: if branch_b is conditional (default = 0)
    //bit 5: the condition of branch_b (default = 0)
    //bit 6: ignore the i_counter_value input (default = 0)
 
  wire [DATA_WIDTH-1:0] data_a, data_b;
  
  wire fifo_a_valid, fifo_b_valid;
  wire is_branch_a_valid, is_branch_b_valid;
  wire is_branch_a_stalled, is_branch_b_stalled;

  // need to check the settings bits to see whether this branch signal is valid
  assign is_branch_a_valid = i_settings[0] & (~i_settings[1] | (i_dataa[0] == i_settings[2])) & i_dataa_valid;
  assign is_branch_b_valid = i_settings[3] & (~i_settings[4] | (i_datab[0] == i_settings[5])) & i_datab_valid;
    
  vfabric_buffered_fifo fifo_branch_a ( .clock(clock), .resetn(resetn), 
      .data_in(i_dataa), .data_out(data_a), .valid_in(is_branch_a_valid),
      .valid_out( fifo_a_valid ), .stall_in(is_branch_a_stalled), .stall_out(o_dataa_stall) );
  defparam fifo_branch_a.DATA_WIDTH = DATA_WIDTH;
  defparam fifo_branch_a.DEPTH = FIFO_DEPTH;
  
  vfabric_buffered_fifo fifo_branch_b ( .clock(clock), .resetn(resetn), 
      .data_in(i_datab), .data_out(data_b), .valid_in(is_branch_b_valid),
      .valid_out( fifo_b_valid ), .stall_in(is_branch_b_stalled), .stall_out(o_datab_stall) );
  defparam fifo_branch_b.DATA_WIDTH = DATA_WIDTH;
  defparam fifo_branch_b.DEPTH = FIFO_DEPTH;
  
  // need to implement a counter to select entire workgroups at a time from either branch
  reg [WORKGROUP_SIZE_BITS-1:0] thread_count;
  
  reg choose_a;
  reg choose_b;

  assign branch_selected = choose_b ? 1'b1 : (choose_a ? 1'b0 : ((fifo_b_valid) ? 1'b1 : 1'b0));
  assign is_branch_sel_valid = (~branch_selected & fifo_a_valid) | (branch_selected & fifo_b_valid);

  always @(posedge clock or negedge resetn)
  begin
  	if (~(resetn))
  	begin
  		thread_count <= {WORKGROUP_SIZE_BITS{1'b0}};
  		choose_a <= 1'b0;
  		choose_b <= 1'b0;
  	end
  	else
  	begin
  		if (is_branch_sel_valid && !i_dataout_stall) 
  		begin
  			if (i_settings[6] || (thread_count == (i_counter_value[9:0] - 2'b01)))
  			begin 
  				thread_count <= {WORKGROUP_SIZE_BITS{1'b0}};
  				choose_a <= 1'b0; 
  				choose_b <= 1'b0;
  			end
  			else
  			begin
  				thread_count <= thread_count + 1'b1;
  				choose_a <= ~branch_selected;
  				choose_b <=  branch_selected;
  			end
  		end
  	end
  end  
  
  assign o_dataout = branch_selected;
  assign o_dataout_valid = is_branch_sel_valid;

  assign is_branch_a_stalled = ~(fifo_a_valid & ~branch_selected & ~i_dataout_stall);
  assign is_branch_b_stalled = ~(fifo_b_valid & branch_selected & ~i_dataout_stall);
  
endmodule
