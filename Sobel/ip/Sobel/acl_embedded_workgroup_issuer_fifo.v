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
    


module acl_embedded_workgroup_issuer_fifo #(
  parameter unsigned MAX_SIMULTANEOUS_WORKGROUPS = 2,    // >0
  parameter unsigned MAX_WORKGROUP_SIZE = 2147483648,    // >0

  parameter unsigned WG_SIZE_BITS = $clog2({1'b0, MAX_WORKGROUP_SIZE} + 1),
  parameter unsigned LLID_BITS = (MAX_WORKGROUP_SIZE > 1 ? $clog2(MAX_WORKGROUP_SIZE) : 1),
  parameter unsigned WG_ID_BITS = (MAX_SIMULTANEOUS_WORKGROUPS > 1 ? $clog2(MAX_SIMULTANEOUS_WORKGROUPS) : 1)
)
(
  input logic clock, 
  input logic resetn, 

  // Handshake for item entry into function.
  input logic valid_in, 
  output logic stall_out, 
  
  // Handshake with entry basic block
  output logic valid_entry, 
  input logic stall_entry,

  // Observe threads exiting the function .
  // This is asserted when items are ready to be retired from the workgroup.
  input logic valid_exit, 
  // This is asserted when downstream is not ready to retire an item from
  // the workgroup.
  input logic stall_exit, 
  
  // Need workgroup_size to know when one workgroup ends
  // and another begins.
  input logic [WG_SIZE_BITS - 1:0] workgroup_size, 

  // Linearized local id. In range of [0, workgroup_size - 1].
  output logic [LLID_BITS - 1:0] linear_local_id_out,

  // Hardware work-group id. In range of [0, MAX_SIMULTANEOUS_WORKGROUPS - 1].
  output logic [WG_ID_BITS - 1:0] hw_wg_id_out,

  // The hardware work-group id of the work-group that is exiting.
  input logic [WG_ID_BITS - 1:0] done_hw_wg_id_in,

  // Pass though global_id, local_id and group_id.
  input logic [31:0] global_id_in[2:0],
  input logic [31:0] local_id_in[2:0],
  input logic [31:0] group_id_in[2:0],
  output logic [31:0] global_id_out[2:0],
  output logic [31:0] local_id_out[2:0],
  output logic [31:0] group_id_out[2:0]
);
  // Entry: 1 cycle latency
  // Exit: 1 cycle latency
  acl_work_group_limiter #(
    .WG_LIMIT(MAX_SIMULTANEOUS_WORKGROUPS),
    .KERNEL_WG_LIMIT(MAX_SIMULTANEOUS_WORKGROUPS),
    .MAX_WG_SIZE(MAX_WORKGROUP_SIZE),
    .WG_FIFO_ORDER(1),
    .IMPL("kernel")   // this parameter is very important to get the right implementation
  )
  limiter(
    .clock(clock),
    .resetn(resetn),
    .wg_size(workgroup_size),

    .entry_valid_in(valid_in),
    .entry_k_wgid(),
    .entry_stall_out(stall_out),
    .entry_valid_out(valid_entry),
    .entry_l_wgid(hw_wg_id_out),
    .entry_stall_in(stall_entry),

    .exit_valid_in(valid_exit & ~stall_exit),
    .exit_l_wgid(done_hw_wg_id_in),
    .exit_stall_out(),
    .exit_valid_out(),
    .exit_stall_in(1'b0)
  );

  // Pass through ids (global, local, group).
  // Match the latency of the work-group limiter, which is one cycle.
  always @(posedge clock)
    if( ~stall_entry ) 
    begin
      global_id_out <= global_id_in;
      local_id_out <= local_id_in;
      group_id_out <= group_id_in;
    end

  // local id 3 generator
  always @(posedge clock or negedge resetn)
    if( ~resetn )
      linear_local_id_out <= '0;
    else if( valid_entry & ~stall_entry )
    begin
      if( linear_local_id_out == workgroup_size - 'd1 )
        linear_local_id_out <= '0;
      else
        linear_local_id_out <= linear_local_id_out + 'd1;
    end

endmodule
// vim:set filetype=verilog_systemverilog:

