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
    


// Normalization module
//
// This module accepts input in an internal 28-bit mantissa, 9-bit exponent and 1-bit sign and
// converts it to an IEEE 754 single-precision FP. This is done via rounding and shifting of the input data.
// Options for normalization are available:
// - FLUSH_DENORMS = 1 will set any denormalized number (exp=0) to be equal to 0 (sign can be positive or negative depending on input)
// - HIGH_CAPACITY = 1 will use stall/valid logic to allow bubble crushing. Otherwise, a common enable signal will be generated.
// - HIGH_LATENCY = 1 will produce a core that is designed to run at approximately 500MHz (alone). It uses 6 clock cycles. When HIGH_LATENCY is
//                    set to 0 then the core will use only 4 clock cycles and run at approximately 350-400 MHz.
// - ROUNDING_MODE:
//   0 - round to nearest. Default.
//
// NOTES: In a HIGH_CAPACITY = 0 mode, stall_in, valid_in, valid_out and stall_out are replaced by a single enable signal. It is assume that
// the valid bits are generated kept track of outside of this core.

module acl_fp_custom_normalize(
		clock, resetn,
		mantissa, exponent, sign,
		// Used in HIGH_CAPACITY = 1 mode
		stall_in, valid_in, stall_out, valid_out,
		// Used in HIGH_CAPACITY = 0 mode
		enable, result);
		
		parameter HIGH_CAPACITY = 1;
		parameter FLUSH_DENORMS = 0;
		parameter HIGH_LATENCY = 1;
		parameter ROUNDING_MODE = 0;
		
		input clock, resetn;
		input stall_in, valid_in;
		output stall_out, valid_out;
		input enable;
		
		// Data in
		input [27:0] mantissa;
		input [8:0] exponent; // Exponent with MSB set to 1 is an exception. It is infinity if LSB = 0, a NaN otherwise.
		input sign;
		
		// Data output
		output [31:0] result;
		
		wire [26:0] mantissa_out;
		wire [8:0] exponent_out;
		wire sign_out, valid_norm_out, stall_norm_in;
		
		acl_fp_custom_reduced_normalize normalization(
			.clock(clock),
			.resetn(resetn),
			.mantissa(mantissa),
			.exponent(exponent),
			.sign(sign),
			// Used in HIGH_CAPACITY = 1 mode
			.stall_in(stall_norm_in),
			.valid_in(valid_in),
			.stall_out(stall_out),
			.valid_out(valid_norm_out),
			// Used in HIGH_CAPACITY = 0 mode
			.enable(enable),
			.mantissa_out(mantissa_out),
			.exponent_out(exponent_out),
			.sign_out(sign_out));	
		defparam normalization.HIGH_CAPACITY = HIGH_CAPACITY;
		defparam normalization.FLUSH_DENORMS = FLUSH_DENORMS;
		defparam normalization.HIGH_LATENCY = HIGH_LATENCY;			
		

		wire [26:0] mantissa_round_out;
		wire [8:0] exponent_round_out;
		wire sign_round_out,valid_round_out, stall_norm_out;
		
		acl_fp_custom_round_post rounding(
			.clock(clock),
			.resetn(resetn),
			.mantissa(mantissa_out),
			.exponent(exponent_out),
			.sign(sign_out),
			.mantissa_out(mantissa_round_out),
			.exponent_out(exponent_round_out),
			.sign_out(sign_round_out),
			.valid_in(valid_norm_out),
			.valid_out(valid_out),
			.stall_in(stall_in),
			.stall_out(stall_norm_in),
			.enable(enable));			
		defparam rounding.HIGH_CAPACITY = HIGH_CAPACITY;
		defparam rounding.FLUSH_DENORMS = FLUSH_DENORMS;
		defparam rounding.HIGH_LATENCY = HIGH_LATENCY;			
		defparam rounding.ROUNDING_MODE = ROUNDING_MODE;
		
		assign result = {sign_round_out, exponent_round_out[7:0], mantissa_round_out[25:3] };
endmodule
