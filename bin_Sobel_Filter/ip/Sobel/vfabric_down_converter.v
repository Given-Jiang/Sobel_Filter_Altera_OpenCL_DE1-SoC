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
    


module vfabric_down_converter(clock, resetn, i_start,
  i_datain, i_datain_valid, o_datain_stall, 
  o_dataout, i_dataout_stall, o_dataout_valid);

parameter DATAIN_WIDTH = 32;
parameter DATAOUT_WIDTH = 8;

 input clock, resetn, i_start;
 input [DATAIN_WIDTH-1:0] i_datain;
 input i_datain_valid;
 output o_datain_stall;
 output [DATAOUT_WIDTH-1:0] o_dataout;
 input i_dataout_stall;
 output o_dataout_valid;
 
// Specify state machine states.
parameter s_IDLE = 3'b100;
parameter s_SEND_B1 = 3'b000;
parameter s_SEND_B2 = 3'b001;
parameter s_SEND_B3 = 3'b010;
parameter s_SEND_B4 = 3'b011;

// State and next_state variables
reg [2:0] present_state, next_state;

reg [DATAIN_WIDTH-1:0] data_to_send;
wire latch_new_data;

// Simple state machine to output 1 byte per cycle
always@(*)
begin
   case (present_state)
    s_IDLE: if (i_datain_valid)
                next_state <= s_SEND_B1;
             else
                next_state <= s_IDLE;
                
    s_SEND_B1: if (!i_dataout_stall)
                 next_state <= s_SEND_B2; 
               else 
                 next_state <= s_SEND_B1; 
    s_SEND_B2: if (!i_dataout_stall)
                 next_state <= s_SEND_B3; 
               else 
                 next_state <= s_SEND_B2; 
    s_SEND_B3: if (!i_dataout_stall)
                 next_state <= s_SEND_B4; 
               else 
                 next_state <= s_SEND_B3; 
              
    s_SEND_B4: if (!i_dataout_stall)
                 next_state <= i_datain_valid ? s_SEND_B1 : s_IDLE;
               else 
                 next_state <= s_SEND_B4;
    
    default: next_state <= 3'bxxx;
   endcase	 
end

// Simple state machine to output 1 byte per cycle
always@(posedge clock or negedge resetn)
begin
  if (~resetn)
    data_to_send <= {DATAIN_WIDTH{1'b0}};
  else
    data_to_send <= (latch_new_data & i_datain_valid) ? 
                        i_datain : data_to_send;
end 

// State assignment
always@(posedge clock or negedge resetn)
begin
  if (~resetn)
     present_state <= s_IDLE;
  else
     present_state <= (i_start) ? next_state : s_IDLE;
end

  //assign o_dataout = (present_state == s_SEND_B1) ? data_to_send[DATAOUT_WIDTH-1:0] : 
  //                   ((present_state == s_SEND_B2) ? data_to_send[2*DATAOUT_WIDTH-1:DATAOUT_WIDTH] : 
  //                   ((present_state == s_SEND_B3) ? data_to_send[3*DATAOUT_WIDTH-1:2*DATAOUT_WIDTH] : 
  //                                                   data_to_send[4*DATAOUT_WIDTH-1:3*DATAOUT_WIDTH] ));
  assign o_dataout = data_to_send[present_state[1:0]*DATAOUT_WIDTH +: DATAOUT_WIDTH];
  //assign o_dataout_valid = (present_state != s_IDLE);
  assign o_dataout_valid = ~present_state[2] & i_start;
    
  //we latch data in the idle state, or if we're in the send_b4 state, 
  //  and downstream is not stalling back
  assign latch_new_data = (present_state == s_IDLE) || 
                          ((present_state == s_SEND_B4) & ~i_dataout_stall);

  // we want to lower the stall to the inputs when we want to latch new data
  assign o_datain_stall = (i_start) ? ~latch_new_data : 1'b0;
 
 
endmodule
