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
    


module vfabric_fcmp(clock, resetn, 
  i_dataa, i_dataa_valid, o_dataa_stall, 
  i_datab, i_datab_valid, o_datab_stall, 
  o_dataout, o_dataout_valid, i_stall,
	i_settings);

parameter DATA_WIDTH = 32;
parameter LATENCY = 3;
parameter MODE_WIDTH = 4;
parameter FIFO_DEPTH = 64;

 input clock, resetn;
 input [DATA_WIDTH-1:0] i_dataa;
 input [DATA_WIDTH-1:0] i_datab;
 input i_dataa_valid, i_datab_valid;
 output o_dataa_stall, o_datab_stall;
 output o_dataout;
 output o_dataout_valid;
 input i_stall;
 input [MODE_WIDTH-1:0] i_settings;

 reg [LATENCY-1:0] shift_reg_valid;
 
 wire [DATA_WIDTH-1:0] dataa;
 wire [DATA_WIDTH-1:0] datab;

 wire is_fifo_a_valid;
 wire is_fifo_b_valid;
 wire is_stalled;
 wire is_fifo_stalled;
 wire aeb, agb, ageb, alb, aleb, aneb, unordered;
 
 vfabric_buffered_fifo fifo_a ( .clock(clock), .resetn(resetn), 
      .data_in(i_dataa), .data_out(dataa), .valid_in(i_dataa_valid),
      .valid_out( is_fifo_a_valid ), .stall_in(is_fifo_stalled), .stall_out(o_dataa_stall) );
 defparam fifo_a.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_a.DEPTH = FIFO_DEPTH;
 
 vfabric_buffered_fifo fifo_b ( .clock(clock), .resetn(resetn), 
      .data_in(i_datab), .data_out(datab), .valid_in(i_datab_valid),
      .valid_out( is_fifo_b_valid ), .stall_in(is_fifo_stalled), .stall_out(o_datab_stall) );
 defparam fifo_b.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_b.DEPTH = FIFO_DEPTH;
 
 always @(posedge clock or negedge resetn)
 begin
  if (~resetn)
    begin
    shift_reg_valid <= {LATENCY{1'b0}};
  end
  else
  begin
    if(~is_stalled)
      shift_reg_valid <= { is_fifo_a_valid & is_fifo_b_valid, shift_reg_valid[LATENCY-1:1] };
  end
 end
 
 assign is_stalled = (shift_reg_valid[0] & i_stall);
 assign is_fifo_stalled = (shift_reg_valid[0] & i_stall) | !(is_fifo_a_valid & is_fifo_b_valid);

 acl_fp_cmp_altfp_compare_6me fcmp_unit(.clock(clock), .clk_en(~is_stalled),
      .dataa(dataa), .datab(datab),
      .aeb(aeb), .agb(agb), .ageb(ageb),
      .alb(alb), .aleb(aleb), .aneb(aneb),
      .unordered(unordered));

 // need to figure out what the output value should be, depending on the i_settings
 always @(*)
 begin
   case (i_settings)
     4'h0:   // FCMP_FALSE
     begin
       o_dataout <= 1'b0;
     end
     
     4'h1:   // FCMP_OEQ	- True if ordered and equal
     begin
       o_dataout <= (~unordered && aeb);
     end
     
     4'h2:   // FCMP_OGT
     begin
       o_dataout <= (~unordered && agb);
     end
     
     4'h3:   // FCMP_OGE
     begin
       o_dataout <= (~unordered && ageb);
     end

     4'h4:   // FCMP_OLT
     begin
       o_dataout <= (~unordered && alb);
     end
     
     4'h5:   // FCMP_OLE
     begin
       o_dataout <= (~unordered && aleb);
     end

     4'h6:   // FCMP_ONE
     begin
       o_dataout <= (~unordered && aneb);
     end

     4'h7:   // FCMP_ORD - True if ordered (no nans)
     begin
       o_dataout <= (~unordered);
     end
     
     4'h8:   // FCMP_UNO - True if unordered: isnan(X) | isnan(Y)
     begin
       o_dataout <= unordered;
     end

     4'h9:   // FCMP_UEQ - True if unordered or equal
     begin
       o_dataout <= (unordered || aeb);
     end
     
     4'hA:   // FCMP_UGT
     begin
       o_dataout <= (unordered || agb);
     end
     
     4'hB:   // FCMP_UGE
     begin
       o_dataout <= (unordered || ageb);
     end
     
     4'hC:   // FCMP_ULT
     begin
       o_dataout <= (unordered || alb);
     end
     
     4'hD:   // FCMP_ULE
     begin
       o_dataout <= (unordered || aleb);
     end
     
     4'hE:   // FCMP_UNE
     begin
       o_dataout <= (unordered || aneb);
     end
     
     4'hF:   // FCMP_TRUE
     begin
       o_dataout <= 1'b1;
     end
     
     default:
     begin
       o_dataout <= 1'b0;
     end   
   endcase   
 end
 	
 assign o_dataout_valid = shift_reg_valid[0];
 
endmodule
