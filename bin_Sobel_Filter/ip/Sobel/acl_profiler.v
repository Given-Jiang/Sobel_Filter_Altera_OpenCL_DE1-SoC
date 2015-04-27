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
    


//
// This module records profiling information. It is connected to the desired
// pipeline ports that are needed to be profiled. 
// cntl_in signal determines when a profiling register is updated.
// incr_in signal determines the increment value for each counter.
// NUM_COUNTERS of profiling registers are instantiated. When the profile_shift
// signal is high, profiling registers are shifted out 1-bit at a time.
//

module acl_profiler
(
  clock,
  resetn,
  enable,

  profile_shift, 
  incr_cntl,
  incr_val,
  daisy_out
);

parameter COUNTER_WIDTH=64;
parameter INCREMENT_WIDTH=32;
parameter NUM_COUNTERS=4;
parameter TOTAL_INCREMENT_WIDTH=INCREMENT_WIDTH * NUM_COUNTERS;

input clock;
input resetn;
input enable;

input profile_shift;
input [NUM_COUNTERS-1:0] incr_cntl;
input [TOTAL_INCREMENT_WIDTH-1:0] incr_val;
output daisy_out;

// if there are NUM_COUNTER counters, there are NUM_COUNTER-1 connections between them
wire [NUM_COUNTERS-2:0] shift_wire;
wire [31:0] data_out [0:NUM_COUNTERS-1];// for debugging, always 32-bit for ease of modelsim

genvar n;
generate
   for(n=0; n<NUM_COUNTERS; n++)
   begin : counter_n
   if(n == 0)
      acl_profile_counter #(
         .COUNTER_WIDTH( COUNTER_WIDTH ),
         .INCREMENT_WIDTH( INCREMENT_WIDTH )
      ) counter (
         .clock( clock ),
         .resetn( resetn ),
         .enable( enable ),
         .shift( profile_shift ),
         .incr_cntl( incr_cntl[n] ),
         .shift_in( shift_wire[n] ),
         .incr_val( incr_val[ ((n+1)*INCREMENT_WIDTH-1) : (n*INCREMENT_WIDTH) ] ),
         .data_out( data_out[ n ] ),
         .shift_out( daisy_out )
      );
   else if(n == NUM_COUNTERS-1)
      acl_profile_counter #(
         .COUNTER_WIDTH( COUNTER_WIDTH ),
         .INCREMENT_WIDTH( INCREMENT_WIDTH )
      ) counter (
         .clock( clock ),
         .resetn( resetn ),
         .enable( enable ),
         .shift( profile_shift ),
         .incr_cntl( incr_cntl[n] ),
         .shift_in( 1'b0 ),
         .incr_val( incr_val[ ((n+1)*INCREMENT_WIDTH-1) : (n*INCREMENT_WIDTH) ] ),
         .data_out( data_out[ n ] ),
         .shift_out( shift_wire[n-1] )
      );
   else
      acl_profile_counter #(
         .COUNTER_WIDTH( COUNTER_WIDTH ),
         .INCREMENT_WIDTH( INCREMENT_WIDTH )
      ) counter (
         .clock( clock ),
         .resetn( resetn ),
         .enable( enable ),
         .shift( profile_shift ),
         .incr_cntl( incr_cntl[n] ),
         .shift_in( shift_wire[n] ),
         .incr_val( incr_val[ ((n+1)*INCREMENT_WIDTH-1) : (n*INCREMENT_WIDTH) ] ),
         .data_out( data_out[ n ] ),
         .shift_out( shift_wire[n-1] )
      );
   end
endgenerate

endmodule

module acl_profile_counter
(
  clock,
  resetn,
  enable,

  shift,
  incr_cntl,
  shift_in,
  incr_val,
  data_out,
  shift_out
);

parameter COUNTER_WIDTH=64;
parameter INCREMENT_WIDTH=32;

input clock;
input resetn;
input enable;

input shift;
input incr_cntl;
input shift_in;
input [INCREMENT_WIDTH-1:0] incr_val;

output [31:0] data_out;// for debugging, always 32-bit for ease of modelsim
output shift_out;

reg [COUNTER_WIDTH-1:0] counter;

always@(posedge clock or negedge resetn)
begin
  if( !resetn )
    counter <= { COUNTER_WIDTH{1'b0} };
  else if(shift) // shift by one bit
    counter <= { counter[COUNTER_WIDTH-2:0], shift_in };
  else if(enable && incr_cntl) // increment counter
    counter <= counter + incr_val;
end

assign data_out = counter;
assign shift_out = counter[COUNTER_WIDTH-1:COUNTER_WIDTH-1];

endmodule
