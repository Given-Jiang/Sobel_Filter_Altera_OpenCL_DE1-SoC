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
    


module vfabric_counter#(parameter WIDTH=32) (
   input clock,
   input resetn,
   input i_start,
   input i_counter_reset,

   input [WIDTH-1:0] i_local_size[2:0],
   input [WIDTH-1:0] i_global_size[2:0],
   input [WIDTH-1:0] i_group_size[2:0],
   
   // The counter values we export.
   output reg [WIDTH-1:0] local_id[2:0],
   output reg [WIDTH-1:0] global_id[2:0],
   output reg [WIDTH-1:0] group_id[2:0],
   output reg [WIDTH-1:0] scalar_local_id,
   output reg [WIDTH-1:0] scalar_group_id,
   output o_dataout_valid,
   input i_dataout_stall
);


// This is the invariant relationship between the various ids.
// Keep these around for debugging.
wire [WIDTH-1:0] global_total = global_id[0] + i_global_size[0] * ( global_id[1] + i_global_size[1] * global_id[2] );
wire [WIDTH-1:0] local_total = local_id[0] + i_local_size[0] * ( local_id[1] + i_local_size[1] * local_id[2] );

// The issue signal starts the counter going, and will stop if stalled, or
// we've reached the maximum global size
wire issue;
reg done_counting;
assign issue = i_start & ~i_dataout_stall & ~done_counting;

assign o_dataout_valid = i_start && !i_counter_reset & ~done_counting;

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

wire last_in_group;
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
      scalar_local_id <= {WIDTH{1'b0}};
      max_local_id[0] <= {WIDTH{1'b0}};
      max_local_id[1] <= {WIDTH{1'b0}};
      max_local_id[2] <= {WIDTH{1'b0}};		
   end else if ( i_counter_reset ) begin
      local_id[0] <= {WIDTH{1'b0}};
      local_id[1] <= {WIDTH{1'b0}};
      local_id[2] <= {WIDTH{1'b0}};
      scalar_local_id <= {WIDTH{1'b0}};
      max_local_id[0] <= i_local_size[0] - 2'b01;
      max_local_id[1] <= i_local_size[1] - 2'b01;
      max_local_id[2] <= i_local_size[2] - 2'b01;		
   end else
   begin
      if ( issue ) begin
         local_id[0] <= incr_lid (local_id[0], bump_local_id[0], last_local_id[0]);
         local_id[1] <= incr_lid (local_id[1], bump_local_id[1], last_local_id[1]);
         local_id[2] <= incr_lid (local_id[2], bump_local_id[2], last_local_id[2]);
         scalar_local_id <=  (last_in_group) ? {WIDTH{1'b0}} : scalar_local_id + 2'b01;
      end
   end
end
      
//////////////////////////////////
// Handle global ids.
wire last_global_id[2:0];
assign last_global_id[0] = (global_id[0] == (i_global_size[0] - 2'b01) );
assign last_global_id[1] = (global_id[1] == (i_global_size[1] - 2'b01) );
assign last_global_id[2] = (global_id[2] == (i_global_size[2] - 2'b01) );

always @(posedge clock or negedge resetn) begin
  if ( ~resetn ) begin
    done_counting = 1'b0;
  end else if ( i_counter_reset ) begin
    done_counting = 1'b0;
  end else begin
    done_counting = i_start & ~i_dataout_stall & last_global_id[0] & last_global_id[1] & last_global_id[2] ? 1'b1 : done_counting;
  end
end

always @(posedge clock or negedge resetn) begin
   if ( ~resetn ) begin
      global_id[0] <= {WIDTH{1'b0}};
      global_id[1] <= {WIDTH{1'b0}};
      global_id[2] <= {WIDTH{1'b0}};
   end else if ( i_counter_reset ) begin
      global_id[0] <= {WIDTH{1'b0}};
      global_id[1] <= {WIDTH{1'b0}};
      global_id[2] <= {WIDTH{1'b0}};
   end else 
   begin
      if ( issue ) begin
        if (last_in_group) begin
          global_id[0] <= last_global_id[0] ? {WIDTH{1'b0}} : 
                                                  (global_id[0] + 2'b01);
          global_id[1] <= (last_global_id[0] & last_global_id[1]) ? {WIDTH{1'b0}} : 
                                                  (last_global_id[0] ? (global_id[1] + 2'b01) : (global_id[1] - max_local_id[1]));
          global_id[2] <= (last_global_id[0] & last_global_id[1] & last_global_id[2]) ? {WIDTH{1'b0}} : 
                                                  (last_global_id[0] & last_global_id[1]) ? (global_id[2] + 2'b01) : 
                                                  (global_id[2] - max_local_id[2]);
        end else begin
          if ( bump_local_id[0] ) global_id[0] <= last_local_id[0] ? (global_id[0] - max_local_id[0]) : (global_id[0] + 2'b01);
          if ( bump_local_id[1] ) global_id[1] <= last_local_id[1] ? (global_id[1] - max_local_id[1]) : (global_id[1] + 2'b01);
          if ( bump_local_id[2] ) global_id[2] <= last_local_id[2] ? (global_id[2] - max_local_id[2]) : (global_id[2] + 2'b01);
        end
      end 
   end
end

//////////////////////////////////
// Handle group ids.
wire last_group_id[2:0];
assign last_group_id[0] = (group_id[0] == (i_group_size[0] - 2'b01) );
assign last_group_id[1] = (group_id[1] == (i_group_size[1] - 2'b01) );
assign last_group_id[2] = (group_id[2] == (i_group_size[2] - 2'b01) );

wire bump_group_id[2:0];
assign bump_group_id[0] = ((i_group_size[0] - 2'b01) != 0);
assign bump_group_id[1] = ((i_group_size[1] - 2'b01) != 0) && last_group_id[0];
assign bump_group_id[2] = ((i_group_size[2] - 2'b01) != 0) && last_group_id[0] && last_group_id[1];

always @(posedge clock or negedge resetn) begin
   if ( ~resetn ) begin
      group_id[0] <= {WIDTH{1'b0}};
      group_id[1] <= {WIDTH{1'b0}};
      group_id[2] <= {WIDTH{1'b0}};
      scalar_group_id <= {WIDTH{1'b0}};
   end else if ( i_counter_reset ) begin
      group_id[0] <= {WIDTH{1'b0}};
      group_id[1] <= {WIDTH{1'b0}};
      group_id[2] <= {WIDTH{1'b0}};
      scalar_group_id <= {WIDTH{1'b0}};
   end else // We presume that i_counter_reset and issue are mutually exclusive.
   begin
      if ( issue ) begin
         if ( last_in_group ) begin
           group_id[0] <= incr_lid (group_id[0], bump_group_id[0], last_group_id[0]);
           group_id[1] <= incr_lid (group_id[1], bump_group_id[1], last_group_id[1]);
           group_id[2] <= incr_lid (group_id[2], bump_group_id[2], last_group_id[2]);
           scalar_group_id <= scalar_group_id + 1;
         end
      end
   end
end

//assign scalar_group_id = group_id[0] + i_group_size[0] * ( group_id[1] + i_group_size[1] * group_id[2] );

wire [WIDTH-1:0] global_id_out[2:0];
wire [WIDTH-1:0] local_id_out[2:0];
wire [WIDTH-1:0] group_id_out[2:0];
wire [WIDTH-1:0] max_local_id_out[2:0];

assign global_id_out = global_id;
assign local_id_out = local_id;
assign group_id_out = group_id;
assign max_local_id_out = max_local_id;

endmodule

