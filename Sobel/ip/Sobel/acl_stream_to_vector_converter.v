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
    


///////////////////////////////////////////////////////////////////////////////////////////////////
//
// This module facilitates a transition between two clock domains. We assume that the input
// is provided in the clock2x domain serially and is to be provided as a double-data element in
// the clock domain.
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module acl_stream_to_vector_converter(
			clock, clock2x, resetn,
			dataa, y1, y2,
			valid_in, valid_out, stall_in, stall_out);
	parameter WIDTH = 32;
	
  input clock, clock2x, resetn, valid_in, stall_in;
	input [WIDTH-1:0] dataa;
  output [WIDTH-1:0] y1;
  output [WIDTH-1:0] y2;
	output valid_out;
	output stall_out;

  // Add staging register at the input.
  reg [WIDTH-1:0] dataa_sr /* synthesis preserve */;
  reg sr_in_valid;
  wire stall_sr;  
  
  always@(posedge clock2x or negedge resetn)
  begin
    if(~resetn)
    begin
      sr_in_valid <= 1'b0;
      dataa_sr <= {WIDTH{1'bx}};
    end
    else
    begin
      if (~stall_sr)
        sr_in_valid <= 1'b0;
      else if (~sr_in_valid)
        sr_in_valid <= valid_in;

      if (~sr_in_valid)
        dataa_sr <= dataa;
    end
  end
  assign stall_out = sr_in_valid;
  
  // Prevent sharing of these registers across different instances
  // (and even kernels!). The sharing may cause very long paths
  // across the chip, which limits fmax of clock2x.	 
  reg sel, sel_ref /* synthesis preserve */;
  initial
  begin
    sel = 1'b0;
	  sel_ref = 1'b0;
  end
  always@(posedge clock2x)
  begin
	  sel <= ~sel;
  end
  
  // Register the data in the 'clock2x' domain.
  reg [WIDTH-1:0] in_a2 /* synthesis preserve */;
  reg [WIDTH-1:0] in_a1 /* synthesis preserve */;
  reg valid_a2, valid_a1 /* synthesis preserve */;
  wire stall_shift;
  
  always@(posedge clock2x or negedge resetn)
  begin
    if (~resetn)
	  begin
		  valid_a2 <= 1'b0;
		  valid_a1 <= 1'b0;
		  in_a1 <= {WIDTH{1'bx}};
		  in_a2 <= {WIDTH{1'bx}};
	  end
	  else
	  begin
	    if (~valid_a2)
		  begin
		    valid_a2 <= sr_in_valid | valid_in;
		    in_a2 <= sr_in_valid ? dataa_sr : dataa;
		    valid_a1 <= 1'b0;
		  end
		  else if ((~valid_a1) & (sr_in_valid | valid_in))
		  begin
		    valid_a2 <= 1'b1;
		    in_a2 <= sr_in_valid ? dataa_sr : dataa;		  
		    valid_a1 <= valid_a2;
		    in_a1 <= in_a2;		  		  
		  end
      else if (valid_a1 & valid_a2 & ~stall_shift)
      begin
		    valid_a2 <= sr_in_valid | valid_in;
		    in_a2 <= sr_in_valid ? dataa_sr : dataa;
		    valid_a1 <= 1'b0;
      end
	  end
  end

  assign stall_sr = valid_a1 & stall_shift;
  
  reg [WIDTH-1:0] y2_r /* synthesis preserve */;
  reg [WIDTH-1:0] y1_r /* synthesis preserve */;
  reg valid_crossing /* synthesis preserve */;
  wire stall_last;
  wire w = (sel_ref == sel); // = 1 when just prior to positive edge of 'clock'
  
  always@(posedge clock or negedge resetn)
  begin
    if(~resetn)
	  begin
	    sel_ref <= 1'b0;
		  valid_crossing <= 1'b0;
		  y1_r <= {WIDTH{1'bx}};
		  y2_r <= {WIDTH{1'bx}};
	  end
	  else
	  begin
		  if (~valid_crossing | ~stall_last)
		  begin
		    y1_r <= in_a1;
		    y2_r <= in_a2;
		    valid_crossing <= valid_a1;
		  end
	    sel_ref <= sel;
	  end
  end
  
  assign stall_shift = ~w | valid_crossing & stall_last;
  
  // Staging register
  reg valid_out_sr;
  reg [WIDTH-1:0] y1_sr /* synthesis preserve */;
  reg [WIDTH-1:0] y2_sr /* synthesis preserve */;
  assign stall_last = valid_out_sr;
  always@(posedge clock or negedge resetn)
  begin
    if(~resetn)
    begin
      valid_out_sr <= 1'b0;
      y1_sr <= {WIDTH{1'bx}};
      y2_sr <= {WIDTH{1'bx}};      
    end
    else
    begin
      if (~stall_in)
        valid_out_sr <= 1'b0;
      else if (~valid_out_sr)
        valid_out_sr <= valid_crossing;
      
      if (~valid_out_sr)
      begin
        y1_sr <= y1_r;
        y2_sr <= y2_r;
      end      
    end
  end
  
  assign y1 = valid_out_sr ? y1_sr : y1_r;
  assign y2 = valid_out_sr ? y2_sr : y2_r;
  assign valid_out = valid_out_sr | valid_crossing;
	
endmodule
