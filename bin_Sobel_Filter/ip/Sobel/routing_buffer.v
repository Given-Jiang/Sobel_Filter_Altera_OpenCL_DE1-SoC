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
    


module routing_buffer(clock, resetn, 
  i_datain, i_datain_valid, o_datain_stall, 
  o_dataout, i_dataout_stall, o_dataout_valid);

parameter DATA_WIDTH = 32;
parameter INSERT_REGISTER = 0;

 input clock, resetn;
 input [DATA_WIDTH-1:0] i_datain;
 input i_datain_valid;
 output reg o_datain_stall;
 output reg [DATA_WIDTH-1:0] o_dataout;
 input i_dataout_stall;
 output reg o_dataout_valid;
 
generate
if (INSERT_REGISTER)
begin
  always @ (negedge resetn or posedge clock)
  begin
    if (~resetn)
    begin
      o_datain_stall <= 1'b0;
      o_dataout_valid <= 1'b0;
      o_dataout <= 'x;
    end
    else
    begin
      o_datain_stall <= i_dataout_stall;
      o_dataout_valid <= i_datain_valid;
      o_dataout <= i_datain;
    end
  end
end
else
begin //non-registered version
  always @ (*)
  begin
    o_datain_stall <= i_dataout_stall;
    o_dataout_valid <= i_datain_valid;
    o_dataout <= i_datain;
  end
end
endgenerate

endmodule
