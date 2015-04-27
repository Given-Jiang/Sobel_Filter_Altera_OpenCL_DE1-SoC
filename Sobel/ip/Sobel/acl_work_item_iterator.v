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
    


// This module defines an iterator over work item space.

// Semantics:
//
//    - Items for the same workgroup are issued contiguously.
//      That is, items from different workgroups are never interleaved.
//
//    - Subject to the previous constraint, we make the lower 
//      order ids (e.g. local_id[0]) iterate faster than 
//      higher order (e.g. local_id[2])
//
//    - Id values start at zero and only increase.
//
//    - Behaviour is unspecified if "issue" is asserted more than
//      global_id[0] * global_id[1] * global_id[2] times between times
//      that "start" is asserted.

module acl_work_item_iterator #(parameter WIDTH=32) (
   input clock,
   input resetn,
   input start,         // Assert to restart the iterators
   input issue,         // Assert to issue another item, i.e. advance the counters
   // We assume these values are steady while "start" is not asserted.
   input [WIDTH-1:0] local_size[2:0],
   input [WIDTH-1:0] global_size[2:0],
   
   // inputs from id_iterator
   input [WIDTH-1:0] global_id_base[2:0],
   
   // The counter values we export.
   output reg [WIDTH-1:0] local_id[2:0],
   output reg [WIDTH-1:0] global_id[2:0],
   
   // output to id_iterator
   output last_in_group
);


// This is the invariant relationship between the various ids.
// Keep these around for debugging.
wire [WIDTH-1:0] global_total = global_id[0] + global_size[0] * ( global_id[1] + global_size[1] * global_id[2] );
wire [WIDTH-1:0] local_total = local_id[0] + local_size[0] * ( local_id[1] + local_size[1] * local_id[2] );



function [WIDTH-1:0] incr_lid ( input [WIDTH-1:0] old_lid, input to_incr, input last );
   if ( to_incr )
      if ( last )
         incr_lid = {WIDTH{1'b0}};
      else 
         incr_lid = old_lid + 2'b01;
   else 
      incr_lid = old_lid;
endfunction


//////////////////////////////////
// Handle local ids.
reg [WIDTH-1:0] max_local_id[2:0];
wire last_local_id[2:0];
assign last_local_id[0] = (local_id[0] == max_local_id[0] );
assign last_local_id[1] = (local_id[1] == max_local_id[1] );
assign last_local_id[2] = (local_id[2] == max_local_id[2] );

assign last_in_group = last_local_id[0] & last_local_id[1] & last_local_id[2];

wire bump_local_id[2:0];
assign bump_local_id[0] = (max_local_id[0] != 0);
assign bump_local_id[1] = (max_local_id[1] != 0) && last_local_id[0];
assign bump_local_id[2] = (max_local_id[2] != 0) && last_local_id[0] && last_local_id[1];

// Local id register updates.
always @(posedge clock or negedge resetn) begin
   if ( ~resetn ) begin
      local_id[0] <= {WIDTH{1'b0}};
      local_id[1] <= {WIDTH{1'b0}};
      local_id[2] <= {WIDTH{1'b0}};
      max_local_id[0] <= {WIDTH{1'b0}};
      max_local_id[1] <= {WIDTH{1'b0}};
      max_local_id[2] <= {WIDTH{1'b0}};		
   end else if ( start ) begin
      local_id[0] <= {WIDTH{1'b0}};
      local_id[1] <= {WIDTH{1'b0}};
      local_id[2] <= {WIDTH{1'b0}};
      max_local_id[0] <= local_size[0] - 2'b01;
      max_local_id[1] <= local_size[1] - 2'b01;
      max_local_id[2] <= local_size[2] - 2'b01;		
   end else // We presume that start and issue are mutually exclusive.
   begin
      if ( issue ) begin
         local_id[0] <= incr_lid (local_id[0], bump_local_id[0], last_local_id[0]);
         local_id[1] <= incr_lid (local_id[1], bump_local_id[1], last_local_id[1]);
         local_id[2] <= incr_lid (local_id[2], bump_local_id[2], last_local_id[2]);
      end
   end
end


  
  // goes high one cycle after last_in_group. stays high until
  // next cycle where 'issue' is high.
  reg just_seen_last_in_group;
  always @(posedge clock or negedge resetn) begin
    if ( ~resetn )
      just_seen_last_in_group <= 1'b1;
    else if ( start )
      just_seen_last_in_group <= 1'b1;
    else if (last_in_group & issue)
      just_seen_last_in_group <= 1'b1;
    else if (issue)
      just_seen_last_in_group <= 1'b0;
    else
      just_seen_last_in_group <= just_seen_last_in_group;
  end
      
//////////////////////////////////
// Handle global ids.

always @(posedge clock or negedge resetn) begin
   if ( ~resetn ) begin
      global_id[0] <= {WIDTH{1'b0}};
      global_id[1] <= {WIDTH{1'b0}};
      global_id[2] <= {WIDTH{1'b0}};
   end else if ( start ) begin
      global_id[0] <= {WIDTH{1'b0}};
      global_id[1] <= {WIDTH{1'b0}};
      global_id[2] <= {WIDTH{1'b0}};
   end else // We presume that start and issue are mutually exclusive.
   begin
      if ( issue ) begin
         if ( !last_in_group ) begin
            if ( just_seen_last_in_group ) begin
               // get new global_id starting point from dispatcher.
               // global_id_base will be one cycle late, so get it on the next cycle
               // after encountering last element in previous group.
               // id iterator will know to ignore the global id value on that cycle.
               global_id[0] <= global_id_base[0] + bump_local_id[0];
               global_id[1] <= global_id_base[1] + bump_local_id[1];
               global_id[2] <= global_id_base[2] + bump_local_id[2];
            end else begin
               if ( bump_local_id[0] ) global_id[0] <= (last_local_id[0] ? (global_id[0] - max_local_id[0]) : (global_id[0] + 2'b01));
               if ( bump_local_id[1] ) global_id[1] <= (last_local_id[1] ? (global_id[1] - max_local_id[1]) : (global_id[1] + 2'b01));
               if ( bump_local_id[2] ) global_id[2] <= (last_local_id[2] ? (global_id[2] - max_local_id[2]) : (global_id[2] + 2'b01));
            end
         end
      end
   end
end


endmodule

// vim:set filetype=verilog:
