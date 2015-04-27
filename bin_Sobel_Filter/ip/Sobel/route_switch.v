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
    


module route_switch(clock, resetn, 
  i_datain, i_datain_valid, o_datain_stall, 
  o_dataout, i_dataout_stall, o_dataout_valid);

parameter DATA_WIDTH = 32;
parameter NUM_FANOUTS = 2;

 input clock, resetn;
 input [DATA_WIDTH-1:0] i_datain;
 input i_datain_valid;
 output o_datain_stall;
 output reg [DATA_WIDTH-1:0] o_dataout;
 input [NUM_FANOUTS-1:0] i_dataout_stall;
 output [NUM_FANOUTS-1:0] o_dataout_valid;
 
 wire [NUM_FANOUTS-1:0] is_fanout_stalled;
 reg [NUM_FANOUTS-1:0] is_fanout_valid;
 
 assign is_fanout_stalled = i_dataout_stall & is_fanout_valid;
 assign o_datain_stall = ( | is_fanout_stalled );
 assign o_dataout_valid = is_fanout_valid;
 
 always @ (negedge resetn or posedge clock)
 begin
 if (~resetn)
   begin
     is_fanout_valid <= {NUM_FANOUTS{1'b0}};
   end
 else
   begin
   	if (o_datain_stall)
   	begin
   	  is_fanout_valid <= i_dataout_stall & o_dataout_valid;
   	end
   	else 
   	begin
   	  is_fanout_valid <= {NUM_FANOUTS{i_datain_valid}};
   	end
   end
 end

 always @ (negedge resetn or posedge clock)
 begin	
 if (~resetn)
   begin
     o_dataout <= 0;
   end
 else
   begin
   	if (~o_datain_stall)
   	begin
   	  o_dataout = i_datain;
   	end
   end
 end
 
endmodule
