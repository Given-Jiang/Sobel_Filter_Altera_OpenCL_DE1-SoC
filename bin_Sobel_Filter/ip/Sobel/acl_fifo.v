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
    


//===----------------------------------------------------------------------===//
//
// Parameterized FIFO with input and output registers and ACL pipeline
// protocol ports.
//
//===----------------------------------------------------------------------===//
module acl_fifo (
	clock,
	resetn,
	data_in,
	data_out,
	valid_in,
	valid_out,
	stall_in,
	stall_out,
	usedw,
	empty,
	full,
	almost_full);

	function integer my_local_log;
	input [31:0] value;
		for (my_local_log=0; value>0; my_local_log=my_local_log+1)
			value = value>>1;
	endfunction		
	
	parameter DATA_WIDTH = 32;
	parameter DEPTH = 256;
	parameter NUM_BITS_USED_WORDS = DEPTH == 1 ? 1 : my_local_log(DEPTH-1);
	parameter ALMOST_FULL_VALUE = 0;

	input clock, stall_in, valid_in, resetn;
	output stall_out, valid_out;
	input [DATA_WIDTH-1:0] data_in;
	output [DATA_WIDTH-1:0] data_out;
	output [NUM_BITS_USED_WORDS-1:0] usedw;
  output empty, full, almost_full;

  // add a register stage prior to the acl_fifo.
  //reg [DATA_WIDTH-1:0] data_input /* synthesis preserve */;
  //reg valid_input /* synthesis preserve */;
  //always@(posedge clock or negedge resetn)
  //begin
  //  if (~resetn)
  //  begin
  //    data_input <= {DATA_WIDTH{1'bx}};
  //    valid_input <= 1'b0;
  //  end
  //  else if (~valid_input | ~full)
  //  begin
  //    valid_input <= valid_in;
  //    data_input <= data_in;
  //  end
  //end
  
	scfifo	scfifo_component (
				.clock (clock),
				.data (data_in),
				.rdreq ((~stall_in) & (~empty)),
				.sclr (),
				.wrreq (valid_in & (~full)),
				.empty (empty),
				.full (full),
				.q (data_out),
				.aclr (~resetn),
				.almost_empty (),
				.almost_full (almost_full),
				.usedw (usedw));
	defparam
		scfifo_component.add_ram_output_register = "ON",
		scfifo_component.intended_device_family = "Stratix IV",
		scfifo_component.lpm_numwords = DEPTH,
		scfifo_component.lpm_showahead = "ON",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = DATA_WIDTH,
		scfifo_component.lpm_widthu = NUM_BITS_USED_WORDS,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON",
		scfifo_component.almost_full_value = ALMOST_FULL_VALUE;

	assign stall_out = full;
	assign valid_out = ~empty;
	
endmodule
