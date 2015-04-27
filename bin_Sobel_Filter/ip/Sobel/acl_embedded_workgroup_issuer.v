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
    


module acl_embedded_workgroup_issuer #(
  parameter unsigned MAX_SIMULTANEOUS_WORKGROUPS = 2,    // >0
  parameter unsigned MAX_WORKGROUP_SIZE = 2147483648,    // >0
  parameter string WORKGROUP_EXIT_ORDER = "fifo",        // fifo|noninterleaved|unknown

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
generate
if( WORKGROUP_EXIT_ORDER == "fifo" )
begin
  acl_embedded_workgroup_issuer_fifo #(
    .MAX_SIMULTANEOUS_WORKGROUPS(MAX_SIMULTANEOUS_WORKGROUPS),
    .MAX_WORKGROUP_SIZE(MAX_WORKGROUP_SIZE)
  )
  issuer(.*);
end
else if( WORKGROUP_EXIT_ORDER == "noninterleaved" || WORKGROUP_EXIT_ORDER == "unknown" )
begin
  acl_embedded_workgroup_issuer_complex #(
    .MAX_SIMULTANEOUS_WORKGROUPS(MAX_SIMULTANEOUS_WORKGROUPS),
    .MAX_WORKGROUP_SIZE(MAX_WORKGROUP_SIZE)
  )
  issuer(.*);
end
else
begin
    // synthesis translate off
    initial
      $fatal("%m: unsupported configuration (WORKGROUP_EXIT_ORDER=%s)", WORKGROUP_EXIT_ORDER);
    // synthesis translate on
end
endgenerate

endmodule

