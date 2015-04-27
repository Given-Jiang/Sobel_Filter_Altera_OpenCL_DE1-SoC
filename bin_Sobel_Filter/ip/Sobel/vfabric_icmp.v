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
    


module vfabric_icmp(clock, resetn, 
  i_dataa, i_dataa_valid, o_dataa_stall, 
  i_datab, i_datab_valid, o_datab_stall, 
  o_dataout, o_dataout_valid, i_stall, i_settings);

parameter DATA_WIDTH = 32;
parameter MODE_WIDTH = 4;
parameter FIFO_DEPTH = 64;

 input clock, resetn;
 input [DATA_WIDTH-1:0] i_dataa;
 input [DATA_WIDTH-1:0] i_datab;
 input i_dataa_valid, i_datab_valid;
 output o_dataa_stall, o_datab_stall;
 output reg o_dataout;
 output o_dataout_valid;
 input i_stall;
 input [MODE_WIDTH-1:0] i_settings;

 wire [DATA_WIDTH-1:0] dataa;
 wire [DATA_WIDTH-1:0] datab;
 
 wire signed [DATA_WIDTH-1:0] sdataa;
 wire signed [DATA_WIDTH-1:0] sdatab;

 wire is_fifo_a_valid;
 wire is_fifo_b_valid;
 wire is_stalled;
 
 vfabric_buffered_fifo fifo_a ( .clock(clock), .resetn(resetn), 
      .data_in(i_dataa), .data_out(dataa), .valid_in(i_dataa_valid),
      .valid_out( is_fifo_a_valid ), .stall_in(is_stalled), .stall_out(o_dataa_stall) );
 defparam fifo_a.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_a.DEPTH = FIFO_DEPTH;
 
 vfabric_buffered_fifo fifo_b ( .clock(clock), .resetn(resetn), 
      .data_in(i_datab), .data_out(datab), .valid_in(i_datab_valid),
      .valid_out( is_fifo_b_valid ), .stall_in(is_stalled), .stall_out(o_datab_stall) );
 defparam fifo_b.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_b.DEPTH = FIFO_DEPTH;
 
 assign is_stalled = ~(is_fifo_a_valid & is_fifo_b_valid & ~i_stall);

 assign sdataa = dataa;
 assign sdatab = datab;
 
 always @(*)
 begin
   case (i_settings)
     5'h0:   // EQ
     begin
       o_dataout <= (dataa == datab) ? 1'b1 : 1'b0;
     end
     
     5'h1:   // NE
     begin
       o_dataout <= (dataa != datab) ? 1'b1 : 1'b0;
     end
     
     5'h2:   // UGT
     begin
       o_dataout <= (dataa > datab) ? 1'b1 : 1'b0;
     end
     
     5'h3:   // UGE
     begin
       o_dataout <= (dataa >= datab) ? 1'b1 : 1'b0;
     end

     5'h4:   // ULT
     begin
       o_dataout <= (dataa < datab) ? 1'b1 : 1'b0;
     end
     
     5'h5:   // ULE
     begin
       o_dataout <= (dataa <= datab) ? 1'b1 : 1'b0;
     end

     5'h6:   // SGT
     begin
       o_dataout <= (sdataa > sdatab) ? 1'b1 : 1'b0;
     end

     5'h7:   // SGE
     begin
       o_dataout <= (sdataa >= sdatab) ? 1'b1 : 1'b0;
     end
     
     5'h8:   // SLT
     begin
       o_dataout <= (sdataa < sdatab) ? 1'b1 : 1'b0;
     end

     5'h9:   // SLE
     begin
       o_dataout <= (sdataa <= sdatab) ? 1'b1 : 1'b0;
     end
     
     default:
     begin
       o_dataout <= 1'b0;
     end   
   endcase   
 end
 
 assign o_dataout_valid = is_fifo_a_valid & is_fifo_b_valid;
 
endmodule
