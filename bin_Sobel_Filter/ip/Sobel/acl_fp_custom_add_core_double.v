// (C) 1992-2012 Altera Corporation. All rights reserved.                         
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
    


module acl_fp_custom_add_core_double(clock, resetn, dataa, datab, result, valid_in, valid_out, stall_in, stall_out, enable);
	input clock, resetn;
	input valid_in, stall_in;
	output valid_out, stall_out;
	input enable;
	input [63:0] dataa;
	input [63:0] datab;
	output [63:0] result;
	
	parameter HIGH_CAPACITY = 1;
	parameter FLUSH_DENORMS = 0;
	parameter HIGH_LATENCY = 0;
	parameter ROUNDING_MODE = 0;
  parameter FINITE_MATH_ONLY = 0;  
  parameter REMOVE_STICKY = 0;   
	
	// Total Latency = 10-14.
	wire [55:0] input_a_mantissa;
	wire [55:0] input_b_mantissa;
	wire input_a_sign, input_b_sign;
	wire [11:0] input_a_exponent;
	wire [11:0] input_b_exponent;
	wire [55:0] left_mantissa;
	wire [55:0] right_mantissa;
	wire left_sign, right_sign, align_valid_out;
	wire [11:0] align_exponent;
	wire stall_align;
	wire conversion_valid, alignment_stall;
	
	// Latency 1, two modules in parallel
   acl_fp_convert_to_internal_double left(
				.clock(clock),
				.resetn(resetn),
				.data(dataa),
				.mantissa(input_a_mantissa),
				.exponent(input_a_exponent),
				.sign(input_a_sign),
				.valid_in(valid_in),
				.valid_out(conversion_valid),
				.stall_in(alignment_stall),
				.stall_out(stall_out),
				.enable(enable));
		defparam left.HIGH_CAPACITY = HIGH_CAPACITY;
		defparam left.FLUSH_DENORMS = FLUSH_DENORMS;
    defparam left.FINITE_MATH_ONLY = FINITE_MATH_ONLY;    
		
   acl_fp_convert_to_internal_double right(
				.clock(clock),
				.resetn(resetn),
				.data(datab),
				.mantissa(input_b_mantissa),
				.exponent(input_b_exponent),
				.sign(input_b_sign),
				.valid_in(valid_in),
				.valid_out(),
				.stall_in(alignment_stall),
				.stall_out(),
				.enable(enable));
		defparam right.HIGH_CAPACITY = HIGH_CAPACITY;
		defparam right.FLUSH_DENORMS = FLUSH_DENORMS;		
    defparam right.FINITE_MATH_ONLY = FINITE_MATH_ONLY;
	
	 // Latency 3-5.
   acl_fp_custom_align_double alignment(
					.clock(clock),
					.resetn(resetn),
					.input_a_mantissa(input_a_mantissa),
					.input_a_exponent(input_a_exponent),
					.input_a_sign(input_a_sign),
					.input_b_mantissa(input_b_mantissa),
					.input_b_exponent(input_b_exponent),
					.input_b_sign(input_b_sign),
					.left_mantissa(left_mantissa),
					.left_exponent(align_exponent),
					.left_sign(left_sign),
					.right_mantissa(right_mantissa),
					.right_exponent(),
					.right_sign(right_sign),
					.valid_in(conversion_valid),
					.valid_out(align_valid_out),
					.stall_in(stall_align),
					.stall_out(alignment_stall),
					.enable(enable));
		defparam alignment.HIGH_CAPACITY = HIGH_CAPACITY;
		defparam alignment.FLUSH_DENORMS = FLUSH_DENORMS;
		defparam alignment.HIGH_LATENCY = HIGH_LATENCY;
		defparam alignment.ROUNDING_MODE = ROUNDING_MODE;
    defparam alignment.FINITE_MATH_ONLY = FINITE_MATH_ONLY;
    defparam alignment.REMOVE_STICKY = REMOVE_STICKY;    	

	// Latency 1
	wire [56:0] resulting_mantissa;
	wire [11:0] resulting_exponent;
	wire resulting_sign;
	wire valid_sum, stall_op;
	
	acl_fp_custom_add_op_double operation(
		.clock(clock),
		.resetn(resetn),
		.left_mantissa(left_mantissa),
		.right_mantissa(right_mantissa),
		.left_sign(left_sign),
		.right_sign(right_sign),
		.common_exponent(align_exponent),
		.resulting_mantissa(resulting_mantissa),
		.resulting_exponent(resulting_exponent),
		.resulting_sign(resulting_sign),
		.valid_in(align_valid_out),
		.valid_out(valid_sum),
		.stall_in(stall_op),
		.stall_out(stall_align),
		.enable(enable));
	defparam operation.HIGH_CAPACITY = HIGH_CAPACITY;		

	wire [56:0] new_mantissa;
	wire [11:0] new_exponent;
	wire new_sign, new_valid, stall_from_norm;
	
	generate
	if (HIGH_CAPACITY==1)
	begin
		// Staging register.
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [56:0] mantissa_str;
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [11:0] exponent_str;
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg sign_str;
		(* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg staging_valid;
		
		always@(posedge clock or negedge resetn)
		begin
			if (~resetn)
			begin
				staging_valid <= 1'b0;
				mantissa_str <= 57'dx;
				exponent_str <= 12'dx;
				sign_str <= 1'bx;			
			end
			else
			begin
				if (~stall_from_norm)
					staging_valid <= 1'b0;
				else if (~staging_valid)
					staging_valid <= valid_sum;
			
				if (~staging_valid)
				begin
					mantissa_str <= resulting_mantissa;
					exponent_str <= resulting_exponent;
					sign_str <= resulting_sign;
				end      
			end	
		end
		
		assign new_mantissa = staging_valid ? mantissa_str : resulting_mantissa;
		assign new_exponent = staging_valid ? exponent_str : resulting_exponent;
		assign new_sign = staging_valid ? sign_str : resulting_sign;
		assign new_valid = valid_sum | staging_valid;
		assign stall_op = staging_valid;
	end
	else
	begin
		assign new_mantissa = resulting_mantissa;
		assign new_exponent = resulting_exponent;
		assign new_sign = resulting_sign;
		assign new_valid = valid_sum;
		assign stall_op = stall_from_norm;	
	end
	endgenerate
	
   // Latency = 4-5 cycles;
	wire [55:0] norm_mantissa;
	wire [11:0] norm_exponent;
	wire norm_sign, norm_valid, stall_norm;
	
	acl_fp_custom_reduced_normalize_double normalization(
				.clock(clock),
				.resetn(resetn),
				.mantissa(new_mantissa),
				.exponent(new_exponent),
				.sign(new_sign),
				.stall_in(stall_norm),
				.valid_in(new_valid),
				.stall_out(stall_from_norm),
				.valid_out(norm_valid),
				// Used in HIGH_CAPACITY = 0 mode
				.enable(enable),
				.mantissa_out(norm_mantissa),
				.exponent_out(norm_exponent),
				.sign_out(norm_sign)
				);	
		defparam normalization.HIGH_CAPACITY = HIGH_CAPACITY;
		defparam normalization.FLUSH_DENORMS = FLUSH_DENORMS;
		defparam normalization.HIGH_LATENCY = HIGH_LATENCY;
    defparam normalization.REMOVE_STICKY = REMOVE_STICKY;
    defparam normalization.FINITE_MATH_ONLY = FINITE_MATH_ONLY;    
		
	// Latency 1-2
	wire [55:0] rounded_mantissa;
	wire [11:0] rounded_exponent;
	wire rounded_sign, round_valid, stall_round;	
	acl_fp_custom_round_post_double round(
			.clock(clock),
			.resetn(resetn),
			.mantissa(norm_mantissa),
			.exponent(norm_exponent),
			.sign(norm_sign),
			.mantissa_out(rounded_mantissa),
			.exponent_out(rounded_exponent),
			.sign_out(rounded_sign),
			.valid_in(norm_valid),
			.valid_out(round_valid),
			.stall_in(stall_round),
			.stall_out(stall_norm),
			.enable(enable));
		defparam round.HIGH_CAPACITY = HIGH_CAPACITY;
		defparam round.FLUSH_DENORMS = FLUSH_DENORMS;
		defparam round.HIGH_LATENCY = HIGH_LATENCY;			
		defparam round.ROUNDING_MODE = ROUNDING_MODE;	
		defparam round.REMOVE_STICKY = REMOVE_STICKY;
		defparam round.FINITE_MATH_ONLY = FINITE_MATH_ONLY;
    		
   // Latency 0
	acl_fp_convert_to_ieee_double toieee(
		.clock(clock),
		.resetn(resetn),
		.mantissa(rounded_mantissa),
		.exponent(rounded_exponent),
		.sign(rounded_sign),
		.result(result),
		.valid_in(round_valid),
		.valid_out(valid_out),
		.stall_in(stall_in),
		.stall_out(stall_round),
		.enable(enable));
		defparam toieee.FINITE_MATH_ONLY = FINITE_MATH_ONLY;
		
endmodule
