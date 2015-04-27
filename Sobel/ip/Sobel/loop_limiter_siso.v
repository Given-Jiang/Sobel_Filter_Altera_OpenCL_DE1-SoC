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
    


// This is a single-entry single exit loop limiter module.

module loop_limiter_siso
	(
		clock,
		resetn,
		valid_in,
		stall_out,
		valid_entry,
		stall_entry,
		valid_exit,
		stall_exit
	);

// Declare local parameters
parameter LIMIT_COUNTER_WIDTH = 16;
parameter MAX_VALUE = 2;
parameter VALUE_ONE = 1;
parameter MAX_VALUE_MIN_ONE = 1;

// Declare inputs and outputs
input clock;
input resetn;
input valid_in;
output stall_out;
output valid_entry;
input stall_entry;
input valid_exit;
input stall_exit;

// Specify state machine states.
parameter s_EMPTY = 2'b00;
parameter s_RUNNING = 2'b01;
parameter s_FULL = 2'b10;

// State and next_state variables
reg [1:0] present_state, next_state;

// Register to store the number of threads in a loop.
reg [LIMIT_COUNTER_WIDTH-1:0] limit_counter;

// The wires below are set to 1 when the counter should be
// incremented or decremented, as threads exit a loop.
wire increment_counter, decrement_counter;

assign increment_counter = ~(stall_entry) & valid_in;
assign decrement_counter = ~(stall_exit) & valid_exit;

// Simple state machine to keep track of how full the loop pipeline is.
always@(*)
begin
   case (present_state)
    s_EMPTY: if (increment_counter & ~decrement_counter)
                next_state <= s_RUNNING;
             else
                next_state <= s_EMPTY;
    s_RUNNING: if ((limit_counter == MAX_VALUE_MIN_ONE) & (increment_counter & ~decrement_counter))
                next_state <= s_FULL;
               else if ((limit_counter == VALUE_ONE) & (~increment_counter & decrement_counter))
                next_state <= s_EMPTY;
               else
                next_state <= s_RUNNING;
    s_FULL:  if (~increment_counter & decrement_counter)
                next_state <= s_RUNNING;
             else
                next_state <= s_FULL;
    default: next_state <= 2'bxx;
   endcase	 
end

// State assignment
always@(posedge clock or negedge resetn)
begin
  if (~resetn)
     present_state <= s_EMPTY;
  else
     present_state <= next_state;
end

// FSM outputs.
always@(posedge clock or negedge resetn)
begin
  if (~resetn)
     limit_counter <= {LIMIT_COUNTER_WIDTH{1'b0}};
  else
  begin
    if ((increment_counter & ~decrement_counter) & (present_state != s_FULL))
       limit_counter <= limit_counter + 1'b1;
    else if ((~increment_counter & decrement_counter) & (present_state != s_EMPTY))
       limit_counter <= limit_counter - 2'b01;
  end
end

assign valid_entry = (valid_in & (present_state == s_FULL));
assign stall_out = ((present_state == s_FULL) | stall_entry);

endmodule
