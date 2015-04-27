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
// is provided in the clock domain in parallel (1 data set) and is to be serialized into two
// subsequent transactions in the clock2x domain.
//
// Note that this operation consumes 4 clock2x cycles. Thus a mirror operation will have to do the
// same, or the data will become desynchronized.
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module acl_vector_to_stream_converter_single(
			clock, clock2x, resetn, start,
			a1, a2, dataa,
			valid_in, valid_out, stall_in, stall_out);
	parameter WIDTH = 32;
	
  input clock, clock2x, resetn, valid_in, stall_in, start;
	input [WIDTH-1:0] a1;
  input [WIDTH-1:0] a2;
  output [WIDTH-1:0] dataa;
	output valid_out;
	output stall_out;

  // Put a staging register on inputs
  reg [WIDTH-1:0] a1_sr /* synthesis preserve */;
  reg [WIDTH-1:0] a2_sr /* synthesis preserve */;
  reg sr_in_valid /* synthesis preserve */;
  wire stall_sr;
  assign stall_out = sr_in_valid;
  reg start_reg /* synthesis preserve */;
  
  always@(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      sr_in_valid <= 1'b0;
      start_reg <= 1'b0;
      a1_sr <= {WIDTH{1'bx}};
      a2_sr <= {WIDTH{1'bx}};
    end
    else
    begin
      start_reg <= start;
      if (~stall_sr | start)
        sr_in_valid <= 1'b0;
      else if (~sr_in_valid)
        sr_in_valid <= valid_in;

      if (~sr_in_valid)
      begin
        a1_sr <= a1;
        a2_sr <= a2;
      end
    end
  end
  
  // Prevent sharing of these registers across different instances
  // (and even kernels!). The sharing may cause very long paths
  // across the chip, which limits fmax of clock2x.	 
	reg sel2x, sel_ref /* synthesis preserve */;
	initial
	begin
		sel2x = 1'b0;
		sel_ref = 1'b0;
	end

  always@(posedge clock2x)
  begin
    sel2x <= ~sel2x;	
  end
  
	// Register the data in the 'clock' domain.
	reg [WIDTH-1:0] a1_reg /* synthesis preserve */;
  reg [WIDTH-1:0] a2_reg /* synthesis preserve */;
  reg valid_reg /* synthesis preserve */;
  wire stall_reg;
  
  assign stall_sr = valid_reg & stall_reg;
  
  always@(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      sel_ref <= 1'b0;
      valid_reg <= 1'b0;
      a1_reg <= {WIDTH{1'bx}};
      a2_reg <= {WIDTH{1'bx}};
    end
    else 
    begin
      sel_ref <= sel2x;
      if (start)
        valid_reg <= 1'b0;
      else if (~valid_reg | ~stall_reg)
        valid_reg <= valid_in | sr_in_valid;
        
      if (~valid_reg | ~stall_reg)
      begin
        a1_reg <= sr_in_valid ? a1_sr : a1;
        a2_reg <= sr_in_valid ? a2_sr : a2;
      end
    end
  end
  
  // Clock 2X domain
	reg [WIDTH-1:0] shift_reg_a1 /* synthesis preserve */;
  reg [WIDTH-1:0] shift_reg_a2 /* synthesis preserve */;
  reg read_data /* synthesis preserve */;
  reg valid_a1, valid_a2 /* synthesis preserve */;
  reg start_reg_2x /* synthesis preserve */;
  wire stall_shift;
  assign stall_reg = ~read_data;
  wire w;
  assign w = (sel_ref == sel2x);
  always@(posedge clock2x or negedge resetn)  
  begin
    if (~resetn)
    begin
      start_reg_2x <= 1'b0;
      valid_a1 <= 1'b0;
      valid_a2 <= 1'b0;
      read_data <= 1'b0;
      shift_reg_a1 <= {WIDTH{1'bx}};
      shift_reg_a2 <= {WIDTH{1'bx}};
    end
    else
    begin
     start_reg_2x <= start_reg;
	   // There are two cases: when we have a clock cycle right after the positive
		 // edge of clock and right after negative edge of clock. Treat them separately.
	   if (~w)
		 begin
		   // This is right after positive edge of 'clock'.
       if (~valid_a1)
       begin
         // Load only in the cycle after the data is provided to the input registers
         valid_a1 <= valid_reg & ~start_reg_2x;
         valid_a2 <= valid_reg & ~start_reg_2x;
         shift_reg_a1 <= a1_reg;
         shift_reg_a2 <= a2_reg;
			   // Now signal the 1X clock domain that you read its data.
         read_data <= valid_reg;
       end
		   else if (~stall_shift)
		   begin
		     // If data was already present in the shift register, then shift it over.
			   // However, if we are about to shift out the last element, the we may as well load data from
			   // 1X clock domain.
			   if (~valid_a2)
         begin
           // The shift-register is about to become empty. So we can just shift
				   // in new data if it is available.
           valid_a1 <= valid_reg & ~start_reg_2x;
           valid_a2 <= valid_reg & ~start_reg_2x;
           shift_reg_a1 <= a1_reg;
           shift_reg_a2 <= a2_reg;
				   read_data <= valid_reg;
         end
         else
         begin
			     // Otherwise, just shift the data over.
           valid_a1 <= valid_a2 & ~start_reg_2x;
           valid_a2 <= 1'b0;
           shift_reg_a1 <= shift_reg_a2;
           shift_reg_a2 <= {WIDTH{1'b0}};
           read_data <= 1'b0;
         end			 
		   end
       else
         read_data <= 1'b0;
		 end
		 else
		 begin
		   // This is right after negative edge of the clock.
		   // Now if at all possible, shift the data over by one position.
       if (~stall_shift)
       begin
		     // Otherwise, just shift the data over.
         valid_a1 <= valid_a2 & ~start_reg_2x;
         valid_a2 <= 1'b0;
         shift_reg_a1 <= shift_reg_a2;
         shift_reg_a2 <= {WIDTH{1'b0}};
       end
       else
       begin
         valid_a1 <= valid_a1 & ~start_reg_2x;
         valid_a2 <= valid_a2 & ~start_reg_2x;
       end
     end
    end
  end
  
  // Adding a staging register at the output.
  //reg [WIDTH-1:0] dataa_sr /* synthesis preserve */;
  //reg sr_valid /* synthesis preserve */;  
  //always@(posedge clock2x or negedge resetn)
  //begin
  //  if (~resetn)
  //  begin
  //    sr_valid <= 1'b0;
  //    dataa_sr <= {WIDTH{1'bx}};
  //  end
  //  else
  //  begin
  //    if (~stall_in | start_reg_2x)
  //      sr_valid <= 1'b0;
  //    else if (~sr_valid)
  //      sr_valid <= valid_a1;
  //
  //    if (~sr_valid)
  //      dataa_sr <= shift_reg_a1;
  //  end
  //end
  //assign stall_shift = sr_valid;
  //assign valid_out = sr_valid | valid_a1;
  //assign dataa = sr_valid ? dataa_sr : shift_reg_a1;
  assign dataa = shift_reg_a1;
  assign stall_shift = stall_in;
  assign valid_out = valid_a1;
endmodule
