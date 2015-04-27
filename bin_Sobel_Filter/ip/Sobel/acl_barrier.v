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
    



//===----------------------------------------------------------------------===//
//
// Barrier that handles multiple in-flight workgroups
//
// Partition Reorder fifo (actually just a RAM) into separate DEPTH sized
// spaces.  When all the live workitems for a group id has arrived, tell the
// fifo to start emitting workitems for that hw group.
//
// Assumptions about data_entry:
//  - data_entry[31:0]: hardware work-group id (in range [0, MAX_SIMULTANEOUS_WORKGROUPS-1])
//  - data_entry[63:32]: local linear id (in range [0, workgroup_size-1])
//===----------------------------------------------------------------------===//

module acl_barrier (
  clock,
  resetn,
  valid_entry,
  data_entry,
  stall_entry,
  valid_exit,
  data_exit,
  stall_exit,
  workgroup_size
);

parameter DATA_WIDTH=1024;
parameter DEPTH=256;                        // Does not have to be a power of 2
parameter MAX_SIMULTANEOUS_WORKGROUPS=2;    // Does not have to be a power of 2
parameter WORKGROUP_SIZE_BITS = 10;

localparam LOG2_MAX_SIMULTANEOUS_WORKGROUPS=$clog2(MAX_SIMULTANEOUS_WORKGROUPS);
localparam WG_ID_BITS = LOG2_MAX_SIMULTANEOUS_WORKGROUPS > 0 ? LOG2_MAX_SIMULTANEOUS_WORKGROUPS : 1;

input  clock;
input  resetn;
input  valid_entry;
input  [DATA_WIDTH-1:0] data_entry;
output stall_entry;
output valid_exit;
output [DATA_WIDTH-1:0] data_exit;
input  stall_exit;
input [WORKGROUP_SIZE_BITS-1:0] workgroup_size;


reg  [WORKGROUP_SIZE_BITS-1:0] num_current_workitems[MAX_SIMULTANEOUS_WORKGROUPS-1:0];
wire [WORKGROUP_SIZE_BITS-1:0] num_current_workitems_[MAX_SIMULTANEOUS_WORKGROUPS-1:0]; //Create a copy that is a "wire" so that Modelsim will log it automatically
reg  [WORKGROUP_SIZE_BITS-1:0] num_exiting_workitems;
wire valid_in;
wire valid_out;
wire stall_in;
wire stall_out;
wire [DATA_WIDTH-1:0] data_out;
wire [31:0] live_workitem_count_offset [MAX_SIMULTANEOUS_WORKGROUPS-1:0];

localparam s_IDLE=1'b0;  //not outputing a workgroup
localparam s_LOCKED=1'b1;
reg present_state;
reg next_state;
reg valid_exit_pre, stall_in_pre;

// Force group id widths to 1-bit if only 1 SIMULTANEOUS_WORKGROUP
wire [WG_ID_BITS-1:0] hw_group_entering;
reg  [WG_ID_BITS-1:0] hw_group_exiting;

generate
if (LOG2_MAX_SIMULTANEOUS_WORKGROUPS>0)
begin
  assign hw_group_entering = data_entry[WG_ID_BITS-1:0];

  always @(posedge clock or negedge resetn)
  begin
    if (~(resetn))
      hw_group_exiting <= '0;
    else if (next_state==s_IDLE)
    begin
      // MAX_SIMULTANEOUS_WORKGROUPS might not be a power of 2 - handle
      // wrap-around
      if (hw_group_exiting == MAX_SIMULTANEOUS_WORKGROUPS - 1)
        hw_group_exiting <= '0;
      else
        hw_group_exiting <= hw_group_exiting + 'd1;
    end
  end

  assign data_exit = data_out;
end
else
begin
  assign hw_group_entering=1'b0;
  always @(posedge clock) hw_group_exiting=1'b0;
  assign data_exit = data_out[DATA_WIDTH-1:0];
end
endgenerate

acl_fifo_reorder barrier_fifo_reorder (
  .clock(clock), 
  .resetn(resetn),
  .valid_in(valid_in),
  .stall_in(stall_in),
  .valid_out(valid_out),
  .stall_out(stall_out),
  .hw_group_exiting(hw_group_exiting),
  .num_exiting_workitems(num_exiting_workitems),
  .data_in(data_entry),
  .data_out(data_out)
);
defparam barrier_fifo_reorder.WORKGROUP_SIZE_BITS = WORKGROUP_SIZE_BITS;
defparam barrier_fifo_reorder.DEPTH = DEPTH ;
defparam barrier_fifo_reorder.DATA_WIDTH = DATA_WIDTH;
defparam barrier_fifo_reorder.ADDR_WIDTH = 64; // 64-bits used by hw_wg_id and local_linear_id
defparam barrier_fifo_reorder.MAX_SIMULTANEOUS_WORKGROUPS = MAX_SIMULTANEOUS_WORKGROUPS;

// Compute num_current_workitems for each HW group
generate
genvar i;
  for (i=0; i<MAX_SIMULTANEOUS_WORKGROUPS; i=i+1)
  begin : numcur_gen
    assign live_workitem_count_offset[i] = i*WORKGROUP_SIZE_BITS;
    always @(posedge clock or negedge resetn)
    begin
      if (~(resetn))
      begin
        num_current_workitems[i] <= {WORKGROUP_SIZE_BITS{1'b0}};
      end
      else 
      begin
        if (((valid_in && (~stall_out) && hw_group_entering==i) && ~(valid_out && ~stall_in && (hw_group_exiting==i))))
          num_current_workitems[i] <= (num_current_workitems[i] + 2'b01);
        else if (~((valid_in && (~stall_out) && hw_group_entering==i)) && (valid_out && ~stall_in && (hw_group_exiting==i)))
          num_current_workitems[i] <= (num_current_workitems[i] - 2'b01);
      end
    end

    //Modelsim by default ignores 2D reg's, so assign to an unconnected wire
    assign num_current_workitems_[i] = num_current_workitems[i];
  end
endgenerate

always @(posedge clock or negedge resetn)
begin
  if (~(resetn))
    present_state <= s_IDLE;
  else 
    present_state <= next_state;
end


always @(*)
begin
  case (present_state)
    s_IDLE:
      next_state = ((|num_current_workitems[hw_group_exiting]) & (num_current_workitems[hw_group_exiting] == workgroup_size)) ?
       s_LOCKED : s_IDLE;
    s_LOCKED:
      next_state = ((num_exiting_workitems == {{(WORKGROUP_SIZE_BITS-1){1'b0}},1'b1}) &&
                    valid_out && ~stall_in) ?
        s_IDLE : s_LOCKED;
  endcase
end

always @(posedge clock or negedge resetn)
begin
  if (~(resetn)) begin
    num_exiting_workitems <= {WORKGROUP_SIZE_BITS{1'b0}};
    valid_exit_pre <= 1'b0;
    stall_in_pre <= 1'b1;
  end
  else begin 
    case (present_state)
      s_IDLE:
        if (next_state==s_LOCKED) begin
          num_exiting_workitems <= num_current_workitems[hw_group_exiting];
          valid_exit_pre <= |num_current_workitems[hw_group_exiting]; // to help P&R
          stall_in_pre <= ~|num_current_workitems[hw_group_exiting];  // to help P&R
        end
        else begin
          num_exiting_workitems <= {WORKGROUP_SIZE_BITS{1'b0}};
          valid_exit_pre <= 1'b0;
          stall_in_pre <= 1'b1;
        end
      s_LOCKED:
        if (valid_out && ~stall_in) begin
          num_exiting_workitems <= (num_exiting_workitems - 2'b01);
          valid_exit_pre <= num_exiting_workitems != 1;
          stall_in_pre <= num_exiting_workitems == 1;
        end
    endcase
  end
end

assign valid_in = valid_entry;
assign stall_entry = 1'b0;  // If this ever stalls the program is broken
assign valid_exit = valid_out && valid_exit_pre;
assign stall_in = stall_exit | stall_in_pre;

endmodule
