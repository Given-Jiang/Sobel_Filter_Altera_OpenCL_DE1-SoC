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
    


module vfabric_up_converter(clock, resetn, i_start,
  i_datain, i_datain_valid, o_datain_stall, 
  o_dataout, i_dataout_stall, o_dataout_valid);

parameter DATAIN_WIDTH = 8;
parameter DATAOUT_WIDTH = 32;

 input clock, resetn, i_start;
 input [DATAIN_WIDTH-1:0] i_datain;
 input i_datain_valid;
 output o_datain_stall;
 output [DATAOUT_WIDTH-1:0] o_dataout;
 input i_dataout_stall;
 output o_dataout_valid;
 
// Specify state machine states.
parameter s_IDLE = 2'b00;
parameter s_RECEIVED_B1 = 2'b01;
parameter s_RECEIVED_B2 = 2'b10;
parameter s_RECEIVED_B3 = 2'b11;

// State and next_state variables
reg [1:0] present_state, next_state;

reg [DATAOUT_WIDTH-1:0] data_received;

// Simple state machine to store 1 byte per cycle, for 4 cycles, 
// then output it downstream
always@(*)
begin
   case (present_state)
    s_IDLE: if (i_datain_valid)
                next_state <= s_RECEIVED_B1;
             else
                next_state <= s_IDLE;
                
    s_RECEIVED_B1: if (i_datain_valid)
                 next_state <= s_RECEIVED_B2; 
               else 
                 next_state <= s_RECEIVED_B1; 
    s_RECEIVED_B2: if (i_datain_valid)
                 next_state <= s_RECEIVED_B3; 
               else 
                 next_state <= s_RECEIVED_B2; 
    s_RECEIVED_B3: if (i_datain_valid)
                 next_state <= s_IDLE; 
               else 
                 next_state <= s_RECEIVED_B3; 
              
    default: next_state <= 3'bxxx;
   endcase	 
end

// Simple state machine to save 1 byte per cycle
always@(posedge clock or negedge resetn)
begin
  if (~resetn)
    data_received <= {DATAOUT_WIDTH{1'b0}};
  else
  begin
    if ((present_state == s_IDLE) & i_datain_valid)
      data_received <= {data_received[4*DATAIN_WIDTH-1:DATAIN_WIDTH], i_datain};
    else if ((present_state == s_RECEIVED_B1) & i_datain_valid)
      data_received <= {data_received[4*DATAIN_WIDTH-1:2*DATAIN_WIDTH], i_datain, data_received[DATAIN_WIDTH-1:0] };
    else if ((present_state == s_RECEIVED_B2) & i_datain_valid)
      data_received <= {data_received[4*DATAIN_WIDTH-1:3*DATAIN_WIDTH], i_datain, data_received[2*DATAIN_WIDTH-1:0] };
    else if ((present_state == s_RECEIVED_B3) & i_datain_valid)
      data_received <= {i_datain, data_received[3*DATAIN_WIDTH-1:0] };
    else
      data_received <= data_received;
  end
end 

always@(posedge clock or negedge resetn)
begin
  if (~resetn)
    o_dataout_valid <= 1'b0;
  else
  begin
    o_dataout_valid <= (present_state == s_RECEIVED_B3) & i_datain_valid;
  end
end

// State assignment
always@(posedge clock or negedge resetn)
begin
  if (~resetn)
     present_state <= s_IDLE;
  else
     present_state <= (i_start) ? next_state : s_IDLE;
end

  assign o_dataout = data_received;
  assign o_datain_stall = (i_start) ? i_dataout_stall : 1'b0;
endmodule
