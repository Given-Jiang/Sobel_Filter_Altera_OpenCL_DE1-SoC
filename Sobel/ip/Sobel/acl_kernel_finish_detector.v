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
    


// This module generates the finish signal for the entire kernel.
// There are two main ports on this module:
//  1. From work-group dispatcher: to detect when a work-GROUP is issued
//     It is ASSUMED that the work-group dispatcher issues at most one work-group
//     per cycle.
//  2. From exit points of each kernel copy: to detect when a work-ITEM is completed.
module acl_kernel_finish_detector #(
  parameter integer NUM_COPIES = 1,     // >0
  parameter integer WG_SIZE_W = 1,      // >0
  parameter integer GLOBAL_ID_W = 32    // >0, number of bits for one global id dimension
)
(
  input logic clock,
  input logic resetn,

  input logic start,
  input logic [WG_SIZE_W-1:0] wg_size,

  // From work-group dispatcher. It is ASSUMED that
  // at most one work-group is dispatched per cycle.
  input logic [NUM_COPIES-1:0] wg_dispatch_valid_out,
  input logic [NUM_COPIES-1:0] wg_dispatch_stall_in,
  input logic dispatched_all_groups,

  // From copies of the kernel pipeline.
  input logic [NUM_COPIES-1:0] kernel_copy_valid_out,
  input logic [NUM_COPIES-1:0] kernel_copy_stall_in,

  input logic pending_writes,

  // The finish signal is a single-cycle pulse.
  output logic finish
);
  localparam NUM_GLOBAL_DIMS = 3;
  localparam MAX_NDRANGE_SIZE_W = NUM_GLOBAL_DIMS * GLOBAL_ID_W;

  // Count the total number of work-items in the entire ND-range. This count
  // is incremented as work-groups are issued.
  // This value is not final until dispatched_all_groups has been asserted.
  logic [MAX_NDRANGE_SIZE_W-1:0] ndrange_items;
  logic wg_dispatched;

  always @(posedge clock or negedge resetn)
  begin
    if( ~resetn )
      ndrange_items <= '0;
    else if( start )  // ASSUME start and wg_dispatched are mutually exclusive
      ndrange_items <= '0;
    else if( wg_dispatched )
      // This is where the one work-group per cycle assumption is used.
      ndrange_items <= ndrange_items + wg_size;
  end

  // Here we ASSUME that at most one work-group is dispatched per cycle.
  // This depends on the acl_work_group_dispatcher.
  assign wg_dispatched = |(wg_dispatch_valid_out & ~wg_dispatch_stall_in);

  // Count the number of work-items that have exited all kernel pipelines.
  logic [NUM_COPIES-1:0] kernel_copy_item_exit;
  logic [MAX_NDRANGE_SIZE_W-1:0] completed_items;
  logic [$clog2(NUM_COPIES+1)-1:0] completed_items_incr_comb, completed_items_incr;

  always @(posedge clock or negedge resetn)
  begin
    if( ~resetn )
    begin
      kernel_copy_item_exit <= '0;
      completed_items_incr <= '0;
    end
    else
    begin
      kernel_copy_item_exit <= kernel_copy_valid_out & ~kernel_copy_stall_in;
      completed_items_incr <= completed_items_incr_comb;
    end
  end

  // This is not the best representation, but hopefully synthesis will do something
  // intelligent here (e.g. use compressors?). Assuming that the number of
  // copies will never be that high to have to pipeline this addition.
  always @(*)
  begin
    completed_items_incr_comb = '0;
    for( integer i = 0; i < NUM_COPIES; ++i )
      completed_items_incr_comb = completed_items_incr_comb + kernel_copy_item_exit[i];
  end

  always @(posedge clock or negedge resetn)
  begin
    if( ~resetn )
      completed_items <= '0;
    else if( start )  // ASSUME that work-items do not complete on the same cycle as start
      completed_items <= '0;
    else
      completed_items <= completed_items + completed_items_incr;
  end

  // Determine if the ND-range has completed. This is true when
  // the ndrange_items counter is complete (i.e. dispatched_all_groups)
  // and the completed_items counter is equal to the ndrang_items counter.
  logic ndrange_done;

  always @(posedge clock or negedge resetn)
  begin
    if( ~resetn )
      ndrange_done <= 1'b0;
    else if( start )
      ndrange_done <= 1'b0;
    else
      // ASSUMING that dispatched_all_groups is asserted at least one cycle
      // after the last work-group is issued
      ndrange_done <= dispatched_all_groups & (ndrange_items == completed_items);
  end

  // The finish output needs to be a one-cycle pulse when the ndrange is completed
  // AND there are no pending writes.
  logic finish_asserted;

  always @(posedge clock or negedge resetn)
  begin
    if( ~resetn )
      finish <= 1'b0;
    else
      finish <= ~finish_asserted & ndrange_done & ~pending_writes;
  end

  always @(posedge clock or negedge resetn)
  begin
    if( ~resetn )
      finish_asserted <= 1'b0;
    else if( start )
      finish_asserted <= 1'b0;
    else if( finish )
      finish_asserted <= 1'b1;
  end

endmodule

