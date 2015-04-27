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
    


// Terminate local memory bank router ports that aren't connected to memory.
// Aside from tying return signals to zero, also provides a flag to indicate
// whether an unexpected access was attempted on this bank.  This flag should
// be checked someday by an exception monitor.

// There is currently no visibility into this module - intended for simulation
// until new performance monitor complete.

module acl_ic_local_mem_router_terminator #(    
    parameter integer DATA_W = 256
)
(
    input logic clock,
    input logic resetn,

    // To each bank
    input logic b_arb_request,
    input logic b_arb_read,
    input logic b_arb_write,

    output logic b_arb_stall,
    output logic b_wrp_ack,
    output logic b_rrp_datavalid,
    output logic [DATA_W-1:0] b_rrp_data,

    output logic b_invalid_access
);

reg saw_unexpected_access;
reg first_unexpected_was_read;

assign b_arb_stall = 1'b0;
assign b_wrp_ack = 1'b0;
assign b_rrp_datavalid = 1'b0;
assign b_rrp_data = '0;

assign b_invalid_access = saw_unexpected_access;

always@(posedge clock or negedge resetn)
   begin
      if (~resetn)
      begin
         saw_unexpected_access <= 1'b0;
         first_unexpected_was_read <= 1'b0;
      end
      else
      begin
      if (b_arb_request && ~saw_unexpected_access)
         begin
            saw_unexpected_access <= 1'b1;
            first_unexpected_was_read <= b_arb_read;

            // Simulation-only failure message
            // synthesis_off
            $fatal(0,"Local memory router: accessed bank that isn't connected.  Hardware will hang.");
            // synthesis_on
         end
      end
   end

endmodule

