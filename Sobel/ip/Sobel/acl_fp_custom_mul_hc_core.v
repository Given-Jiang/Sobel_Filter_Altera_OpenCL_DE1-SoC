// // (C) 1992-2014 Altera Corporation. All rights reserved.                         
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
    


// Single-precision floating-point multiply core.
//
// Higher latency: 6 cycles
// Intended for high fmax operation.
//
// !!! BEWARE !!!
// WHEN IN HIGH-CAPACITY MODE:
//   This core has less capacity than latency because two of the 
//   pipeline stages share the same enable signal. This is
//   because the multiplier block has three pipeline stages,
//   but only two clock enables, thus one of the stages has to use
//   the same clock enable as another.
//
//   To compensate, there is a staging register at the output
//   to provide one additional capacity slot.
// !!! BEWARE !!!
//
// Supports two "stall" modes based on the HIGH_CAPACITY parameter:
//  1. HIGH_CAPACITY=0: single enable for all stages
//  2. HIGH_CAPACITY=1: each stage is independently controlled
module acl_fp_custom_mul_hc_core #(
  parameter integer HIGH_CAPACITY = 1   // 0|1
)
(
	input logic clock, 
  input logic resetn,

  // only used if HIGH_CAPACITY == 1
	input logic valid_in, 
  input logic stall_in,
	output logic valid_out, 
  output logic stall_out,

  // only used if HIGH_CAPACITY == 0
  input logic enable,

	input logic [31:0] dataa,
	input logic [31:0] datab,
	output logic [31:0] result
);
  struct packed
  {
    logic sign_a, sign_b;
    logic [7:0] exponent_a, exponent_b;
    logic [22:0] mantissa_a, mantissa_b;
  } s0;

  assign {s0.sign_a, s0.exponent_a, s0.mantissa_a} = dataa;
  assign {s0.sign_b, s0.exponent_b, s0.mantissa_b} = datab;

	// Stage 1: Register inputs.
  typedef struct packed
  {
    logic valid;
    logic sign_a, sign_b;
    logic [7:0] exponent_a, exponent_b;
    logic mantissa_a_0s, mantissa_b_0s;
    logic [10:0] top_mantissa_a, top_mantissa_b;
  } stage1_regs;

  stage1_regs s1 /* synthesis preserve */;

	logic stall_in_1, stall_out_1;
	logic valid_in_1, valid_out_1;

  assign valid_in_1 = valid_in;
  assign valid_out_1 = s1.valid;
  assign stall_out_1 = HIGH_CAPACITY ? (valid_out_1 & stall_in_1) : ~enable;
  assign stall_out = stall_out_1;

	always @(posedge clock or negedge resetn)
	begin
		if (~resetn)
		begin
      s1 <= 'x;
      s1.valid <= 1'b0;
		end
		else if (~stall_out_1)
		begin
			s1.valid <= valid_in_1;

			s1.sign_a <= s0.sign_a;
			s1.exponent_a <= s0.exponent_a;
			s1.sign_b <= s0.sign_b;
			s1.exponent_b <= s0.exponent_b;

      // Use unregistered mantissa input because the mantissa
      // is registered directly in the multiplier.
      //
      // If this becomes critical, split the "equal to zero" check
      // into multiple chunks.
      s1.mantissa_a_0s <= (s0.mantissa_a[11:0] == '0);
      s1.mantissa_b_0s <= (s0.mantissa_b[11:0] == '0);
      s1.top_mantissa_a <= s0.mantissa_a[22:12];
      s1.top_mantissa_b <= s0.mantissa_b[22:12];
		end
	end

  // Stage 2
  // NOTE: Stage 2 is NOT a high-capacity stage. It is enabled
  // by stall_out_3. This is to match the multiplier, which uses
  // the same enable signal for stage 2 and stage 3. See the
  // comments on the multiplier for why.
  typedef struct packed
  {
    logic valid;
    logic sign;
    logic [8:0] exponent;   // 0 - 508 (254+254); double-bias not removed
    logic exponent_a_0s, exponent_b_0s;
    logic exponent_a_1s, exponent_b_1s;
    logic mantissa_a_0s, mantissa_b_0s;
  } stage2_regs;

  stage2_regs s2 /* synthesis preserve */;

	logic stall_in_2, stall_out_2, stall_out_3;
	logic valid_in_2, valid_out_2;

  assign valid_in_2 = valid_out_1;
  assign valid_out_2 = s2.valid;
  //assign stall_out_2 = HIGH_CAPACITY ? (valid_out_2 & stall_in_2) : ~enable;
  assign stall_out_2 = HIGH_CAPACITY ? stall_out_3 : ~enable;
  assign stall_in_1 = stall_out_2;

  always @(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      s2 <= 'x;
      s2.valid <= 1'b0;
    end
    else if (~stall_out_2)
    begin
      s2.valid <= valid_in_2;

      s2.sign <= s1.sign_a ^ s1.sign_b;
      s2.exponent <= {1'b0, s1.exponent_a} + {1'b0, s1.exponent_b};

      s2.exponent_a_0s <= (s1.exponent_a == '0);
      s2.exponent_b_0s <= (s1.exponent_b == '0);
      s2.exponent_a_1s <= (s1.exponent_a == '1);
      s2.exponent_b_1s <= (s1.exponent_b == '1);
      s2.mantissa_a_0s <= s1.mantissa_a_0s & (s1.top_mantissa_a == '0);
      s2.mantissa_b_0s <= s1.mantissa_b_0s & (s1.top_mantissa_b == '0);
    end
  end

  // Stage 3.
  typedef struct packed
  {
    logic valid;
    logic sign;
    logic [7:0] exponent;   // double bias removed
    logic exponent_ge_254;  // final flag (takes into account inf and zero)
    logic exponent_gt_254;  // final flag (takes into account inf and zero)
    logic exponent_ge_0;  // final flag (takes into account inf and zero)
    logic exponent_gt_0;  // final flag (takes into account inf and zero)
    logic nan;
  } stage3_regs;

  struct packed
  {
    logic [47:0] mantissa;  // m47m46.m45m44...
  } s3mult;

  stage3_regs s3 /* synthesis preserve */;

	logic stall_in_3;   // stall_out_3 is declared in stage 2
	logic valid_in_3, valid_out_3;

  assign valid_in_3 = valid_out_2;
  assign valid_out_3 = s3.valid;
  assign stall_out_3 = HIGH_CAPACITY ? (valid_out_3 & stall_in_3) : ~enable;
  assign stall_in_2 = stall_out_3;

  // Special numbers.
  logic a_is_inf_3, b_is_inf_3;
  logic a_is_nan_3, b_is_nan_3;
  logic a_is_zero_3, b_is_zero_3;

  assign a_is_inf_3 = (s2.exponent_a_1s & s2.mantissa_a_0s);
  assign b_is_inf_3 = (s2.exponent_b_1s & s2.mantissa_b_0s);
  assign a_is_nan_3 = (s2.exponent_a_1s & ~s2.mantissa_a_0s);
  assign b_is_nan_3 = (s2.exponent_b_1s & ~s2.mantissa_b_0s);
  assign a_is_zero_3 = (s2.exponent_a_0s & s2.mantissa_a_0s);
  assign b_is_zero_3 = (s2.exponent_b_0s & s2.mantissa_b_0s);

  logic inf_times_zero_3, inf_times_non_zero_3;
  assign inf_times_zero_3 = (a_is_inf_3 & b_is_zero_3) | (b_is_inf_3 & a_is_zero_3);
  assign inf_times_non_zero_3 = (a_is_inf_3 & ~b_is_zero_3) | (b_is_inf_3 & ~a_is_zero_3);

  logic one_input_is_denorm_3;
  assign one_input_is_denorm_3 = s2.exponent_a_0s | s2.exponent_b_0s;

  logic one_input_is_nan_3;
  assign one_input_is_nan_3 = a_is_nan_3 | b_is_nan_3;

  always @(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      s3 <= 'x;
      s3.valid <= 1'b0;
    end
    else if (~stall_out_3)
    begin
      s3.valid <= valid_in_3;

      s3.sign <= s2.sign;

      // Remove double bias from exponent sum.
      s3.exponent <= s2.exponent - 9'd127;

      // Update exponent flags to account for guaranteed overflow (inf)
      // or guaranteed underflow (zero).
      if( inf_times_non_zero_3 )
      begin
        // Result is infinity. Set flags to trigger overflow check
        // later.
        s3.exponent_ge_254 <= 1'b1;
        s3.exponent_gt_254 <= 1'b1;
        s3.exponent_ge_0 <= 1'b1;
        s3.exponent_gt_0 <= 1'b1;
      end
      else if( one_input_is_denorm_3 )
      begin
        // Result is zero.
        // TODO Denormalized numbers are rounded to zero. If any operand
        // is zero, then the multiplication result is zero. Enforce this
        // by setting the exponent to zero which will trigger the
        // underflow check later.
        s3.exponent_ge_254 <= 1'b0;
        s3.exponent_gt_254 <= 1'b0;
        s3.exponent_ge_0 <= 1'b0;
        s3.exponent_gt_0 <= 1'b0;
      end
      else
      begin
        s3.exponent_ge_254 <= (s2.exponent >= (9'd254 + 9'd127));
        s3.exponent_gt_254 <= (s2.exponent >  (9'd254 + 9'd127));
        s3.exponent_ge_0 <= (s2.exponent >= (9'd0 + 9'd127));
        s3.exponent_gt_0 <= (s2.exponent >  (9'd0 + 9'd127));
      end

      // Detect NaN.
      if( one_input_is_nan_3 | inf_times_zero_3 )
        s3.nan <= 1'b1;
      else
        s3.nan <= 1'b0;
    end
  end

  // Mantissa multiplier. Inputs and outputs are registered in 
  // the multiplier itself.
  // Input is registered at stage 1. Output is registered at stage 3.
  // Stage 2 is registered in the MAC's first-adder register.
  //
  // The mantissa inputs are assumed to be for normalized numbers. 
  // Multiplication involving denormalized numbers will be treated
  // as a multiplication by zero (handled by the exponent flags).
  logic [23:0] man_mult_dataa, man_mult_datab;

  assign man_mult_dataa = {1'b1, s0.mantissa_a};
  assign man_mult_datab = {1'b1, s0.mantissa_b};

  acl_fp_custom_mul_hc_core_mult man_mult(
    .clock(clock),
    .resetn(1'b1),  // don't need to reset
    .input_enable(~stall_out_1),
    //.pipe_enable(~stall_out_2),
    .output_enable(~stall_out_3),
    .dataa(man_mult_dataa),
    .datab(man_mult_datab),
    .result(s3mult.mantissa)
  );

  // Stage 4.
  typedef struct packed
  {
    logic valid;
    logic sign;
    logic [7:0] exponent;     // double bias removed
    logic exponent_ge_254;    // final flag (takes into account inf and zero)
    logic exponent_gt_254;    // final flag (takes into account inf and zero)
    logic exponent_ge_0;    // final flag (takes into account inf and zero)
    logic exponent_gt_0;    // final flag (takes into account inf and zero)
    logic nan;
    logic [24:0] mantissa;    // truncated mantissa; m24m23.m22m21...
    logic [1:0] round_amount;   // rounding amount
    logic [1:0] round;      // flags indicating if rounding should be done
  } stage4_regs;

  stage4_regs s4 /* synthesis preserve */;

	logic stall_in_4, stall_out_4;
	logic valid_in_4, valid_out_4;

  assign valid_in_4 = valid_out_3;
  assign valid_out_4 = s4.valid;
  assign stall_out_4 = HIGH_CAPACITY ? (valid_out_4 & stall_in_4) : ~enable;
  assign stall_in_3 = stall_out_4;

  always @(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      s4 <= 'x;
      s4.valid <= 1'b0;
    end
    else if (~stall_out_4)
    begin
      s4.valid <= valid_in_4;

      s4.sign <= s3.sign;
      s4.exponent <= s3.exponent;
      s4.exponent_ge_254 <= s3.exponent_ge_254;
      s4.exponent_gt_254 <= s3.exponent_gt_254;
      s4.exponent_ge_0 <= s3.exponent_ge_0;
      s4.exponent_gt_0 <= s3.exponent_gt_0;
      s4.nan <= s3.nan;

      // Truncate mantissa to bits necessary to form the final mantissa
      // (taking into account potential rounding as well).
      s4.mantissa <= s3mult.mantissa[47 -: 25];

      // Determine the amount that needs to be added to the mantissa to
      // perform round-to-nearest-even rounding.
      //
      // First, there are two ways to round the mantissa because the
      // current mantissa has two bits to the left of the decimal point.
      // If the MSB=1, then the mantissa will have to be shifted by
      // one to the right to normalize. Note that a mantissa that has
      // MSB=0 can end up with MSB=1 after rounding is applied. In any
      // case, regardless if MSB=0 or MSB=1, determining if rounding
      // should occur uses the same methodology but slightly different
      // set of bits determining on the MSB.
      //  
      // For simplicity, consider the case where MSB=1. To check if
      // rounding needs to be applied, break the mantissa into:
      //  {A[23:0], B[x:0]}
      // where A represents the final mantissa (23-bits + MSB for
      // implied 1) and B represents the rest of the lower bits of the
      // mantissa.
      //
      // Round-to-nearest-even says round (add 1 to A) if:
      //  1) B > "0.5", OR
      //  2) B = "0.5" AND A[0]=1 (i.e. A is odd)
      //   can be converted into B >= "0.5" AND A[0]=1
      // B="0.5" is B[x]=1 and B[x-1:0]=0 and likewise,
      // B>"0.5" is B[x]=1 and B[x-1:0]!=0.
      //
      // Rounding is controlled by the "round" field, which indicates
      // rounding if any bit is set. The goal of having multiple bits
      // is to have each round bit depend on only a subset of the bits
      // that need to be considered.
      //  round[0]: dependent on B[15:0] and B[x]
      //  round[1]: dependent on the rest and B[x]
      s4.round <= '0;

      if( s3mult.mantissa[47] )
      begin
        // form: 1m46.m45m44...m24|m23...m0

        // If rounding needs to occur, add 1 to m24, which is the 2nd
        // LSB of the 25-bit truncated mantissa. Note that adding
        // 1 will not cause the mantissa to overflow (even though
        // MSB=1) because the mantissa 1m46...m24 cannot be all 1s
        // (it's not mathematically possible to get a multiplication
        // result that large from the inputs).
        //
        // Alternatively, add 1 to m23! If rounding needs to happen,
        // m23=1 and so adding 1 effectively adds 1 to m24 as well.
        // Also, m23 is not part of the final mantissa in this
        // scenario so it doesn't matter if that bit becomes
        // "incorrect". This simplifies the logic for round_amount
        // (see other places where round_amount is set).
        s4.round_amount <= 2'd1;

        if( s3mult.mantissa[23] )   // B>=0.5
        begin
          // Scenario 2 (B>=0.5 and A[0]=1)
          if( s3mult.mantissa[24] )
            s4.round[1] <= 1'b1;

          // Partial scenario 1 (upper bits)
          if( |s3mult.mantissa[22:16] )
            s4.round[1] <= 1'b1;

          // Partial scenario 1 (lower bits)
          if( |s3mult.mantissa[15:0] )
            s4.round[0] <= 1'b1;
        end
      end
      else
      begin
        // form: 01.m45m44...m23|m22...m0

        if( s3.exponent_ge_0 & ~s3.exponent_gt_0 )  // exponent=0
        begin
          // As it is, the current result will become a denormalized number (or possibly inf or zero as
          // those checks are done in the same cycle - these cases are handled by the
          // exponent flags update in this cycle and take priority later over
          // any rounding determined here).
          //
          // Rounding may push result into the normalized range
          // though. If the rounding does not push the
          // number into the normalized range, the exponent flags
          // will force the value to zero.
          //
          // For the purposes of determining if rounding should
          // occur, consider the number in its denormal form
          // is: 0.1m45m44...m24|m23...m0 (x 2^(1-127))

          // If rounding needs to occur, add 1 to m24, which is the 2nd
          // LSB of the 25-bit truncated mantissa.
          //
          // Alternatively, add 1 to m23! If rounding needs to happen,
          // m23=1 and so adding 1 effectively adds 1 to m24 as well.
          // Also, m23 is not part of the final mantissa in this
          // scenario so it doesn't matter if that bit becomes
          // "incorrect". This simplifies the logic for round_amount
          // (see other places where round_amount is set).
          s4.round_amount <= 2'd1;

          if( s3mult.mantissa[23] )   // B>=0.5
          begin
            // Scenario 2 (B>=0.5 and A[0]=1)
            if( s3mult.mantissa[24] )
              s4.round[1] <= 1'b1;

            // Partial scenario 1 (upper bits)
            if( |s3mult.mantissa[22:16] )
              s4.round[1] <= 1'b1;

            // Partial scenario 1 (lower bits)
            if( |s3mult.mantissa[15:0] )
              s4.round[0] <= 1'b1;
          end
        end
        else
        begin
          // form: 01.m45m44...m23|m22...m0

          // If rounding needs to occur, add 1 to m23, which is the LSB
          // of the 25-bit truncated mantissa.
          s4.round_amount <= 2'd1;

          if( s3mult.mantissa[22] )   // B>=0.5
          begin
            // Scenario 2 (B>=0.5 and A[0]=1)
            if( s3mult.mantissa[23] )
              s4.round[1] <= 1'b1;

            // Partial scenario 1 (upper bits)
            if( |s3mult.mantissa[21:16] )
              s4.round[1] <= 1'b1;

            // Partial scenario 1 (lower bits)
            if( |s3mult.mantissa[15:0] )
              s4.round[0] <= 1'b1;
          end
        end
      end
    end
  end

  // Stage 5.
  typedef struct packed
  {
    logic valid;
    logic sign;
    logic [7:0] exponent;   // double bias removed
    logic exponent_ge_254;  // final flag (takes into account inf and zero)
    logic exponent_gt_254;  // final flag (takes into account inf and zero)
    logic exponent_ge_0;  // final flag (takes into account inf and zero)
    logic exponent_gt_0;  // final flag (takes into account inf and zero)
    logic nan;
    logic [24:0] mantissa;  // rounded mantissa; m24m23.m22m21...
  } stage5_regs;

  stage5_regs s5 /* synthesis preserve */;

	logic stall_in_5, stall_out_5;
	logic valid_in_5, valid_out_5;

  assign valid_in_5 = valid_out_4;
  assign valid_out_5 = s5.valid;
  assign stall_out_5 = HIGH_CAPACITY ? (valid_out_5 & stall_in_5) : ~enable;
  assign stall_in_4 = stall_out_5;

  always @(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      s5 <= 'x;
      s5.valid <= 1'b0;
    end
    else if (~stall_out_5)
    begin
      s5.valid <= valid_in_5;

      s5.sign <= s4.sign;
      s5.exponent <= s4.exponent;
      s5.exponent_ge_254 <= s4.exponent_ge_254;
      s5.exponent_gt_254 <= s4.exponent_gt_254;
      s5.exponent_ge_0 <= s4.exponent_ge_0;
      s5.exponent_gt_0 <= s4.exponent_gt_0;
      s5.nan <= s4.nan;

      // Perform rounding on mantissa.
      s5.mantissa <= s4.mantissa + (|s4.round ? s4.round_amount : '0);
    end
  end

  // Stage 6.
  typedef struct packed
  {
    logic valid;
    logic sign;
    logic [7:0] exponent;
    logic [24:0] mantissa;  // m23.m22m21...
  } stage6_regs;

  stage6_regs s6 /* synthesis preserve */;

	logic stall_in_6, stall_out_6;
	logic valid_in_6, valid_out_6;

  assign valid_in_6 = valid_out_5;
  assign valid_out_6 = s6.valid;
  assign stall_out_6 = HIGH_CAPACITY ? (valid_out_6 & stall_in_6) : ~enable;
  assign stall_in_5 = stall_out_6;

  always @(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      s6 <= 'x;
      s6.valid <= 1'b0;
    end
    else if (~stall_out_6)
    begin
      s6.valid <= valid_in_6;

      s6.sign <= s5.sign;

      if( s5.nan )
      begin
        // QNaN
        s6.exponent <= '1;
        s6.mantissa <= '1;
      end
      else
      begin
        // Handle all remaining cases of underflow and overflow here.

        if( s5.mantissa[24] )
        begin
          // form: 1m23.m22m21...
          // shift right by one bit to get: 1.m23m22m21...
          // and add one to exponent
          if( s5.exponent_ge_254 )
          begin
            // Overflow to infinity.
            s6.exponent <= '1;
            s6.mantissa <= '0;
          end
          else if( s5.exponent_ge_0 )
          begin
            // Normal number.
            s6.exponent <= s5.exponent + 8'd1;
            s6.mantissa <= s5.mantissa[24:1];
          end

          if( ~s5.exponent_ge_0 )
          begin
            // Underflow to zero (TODO no denormals)
            s6.exponent <= '0;
            s6.mantissa <= '0;
          end
        end
        else
        begin
          // form: 01.m22m21...
          if( s5.exponent_gt_254 )
          begin
            // Overflow to infinity.
            s6.exponent <= '1;
            s6.mantissa <= '0;
          end
          else if( s5.exponent_gt_0 )
          begin
            // Normal number.
            s6.exponent <= s5.exponent;
            s6.mantissa <= s5.mantissa[23:0];
          end

          if( ~s5.exponent_gt_0 )
          begin
            // Underflow to zero (TODO no denormals)
            s6.exponent <= '0;
            s6.mantissa <= '0;
          end
        end
      end
    end
  end

  // Output.
  generate
  if( HIGH_CAPACITY )
  begin
    // Add a staging register to compensate for the one missing 
    // capacity slot.
    acl_staging_reg #(
      .WIDTH(32)
    )
    output_sr(
      .clk(clock),
      .reset(~resetn),
      .i_valid(s6.valid),
      .i_data({s6.sign, s6.exponent, s6.mantissa[22:0]}),
      .o_stall(stall_in_6),
      .o_valid(valid_out),
      .o_data(result),
      .i_stall(stall_in)
    );
  end
  else
  begin
    assign valid_out = s6.valid;
    assign result = {s6.sign, s6.exponent, s6.mantissa[22:0]};
    assign stall_in_6 = stall_in;
  end
  endgenerate
endmodule

module acl_fp_custom_mul_hc_core_mult(
  input logic clock,
  input logic resetn,
  input logic input_enable,
  // The enable for the pipeline stage (first-adder) is the same
  // as the output stage. It is this way because if we want to pack
  // two 36x36 DSP blocks into the same physical SIV DSP block,
  // there are only four clk/clkena pairs available and so each
  // 36x36 DSP can only use two unique clk/clkena pairs.
  //input logic pipe_enable,
  input logic output_enable,
  input logic [23:0] dataa,
  input logic [23:0] datab,
  output logic [47:0] result
);
  // Multiplier configuration:
  //  36x36 mode
  //  input, pipeline and output registers
  logic [35:0] mult_a_result, mult_b_result, mult_c_result, mult_d_result;
  logic [71:0] mac_result;

  logic [35:0] dataa_ext, datab_ext;
  assign dataa_ext = {dataa, 12'd0};  // inputs are placed starting from MSB
  assign datab_ext = {datab, 12'd0};  // inputs are placed starting from MSB
  
  assign result = mac_result[71 -: 48];

  // MAC blocks
  // MAC mults are configured with an input register
  // MAC out is configured with first-adder reigster and output register

  stratixiv_mac_mult #(
    .dataa_width(18),
    .datab_width(18),
    .dataa_clock("0"),
    .datab_clock("0"),
    .dataa_clear("0"),
    .datab_clear("0"),
    .signa_internally_grounded("false"),
    .signb_internally_grounded("false")
  ) 
  mac_mult_a(
    .signa(1'b0),
    .signb(1'b0),
    .dataa(dataa_ext[35:18]),
    .datab(datab_ext[35:18]),
    .dataout(mult_a_result),
    .clk({3'b000, clock}),
    .ena({3'b000, input_enable}),
    .aclr({3'b000, ~resetn})
  );

  stratixiv_mac_mult #(
    .dataa_width(18),
    .datab_width(18),
    .dataa_clock("0"),
    .datab_clock("0"),
    .dataa_clear("0"),
    .datab_clear("0"),
    .signa_internally_grounded("true"),
    .signb_internally_grounded("false")
  )
  mac_mult_b(
    .signa(1'b0),
    .signb(1'b0),
    .dataa(dataa_ext[17:0]),
    .datab(datab_ext[35:18]),
    .dataout(mult_b_result),
    .clk({3'b000, clock}),
    .ena({3'b000, input_enable}),
    .aclr({3'b000, ~resetn})
  );

  stratixiv_mac_mult #(
    .dataa_width(18),
    .datab_width(18),
    .dataa_clock("0"),
    .datab_clock("0"),
    .dataa_clear("0"),
    .datab_clear("0"),
    .signa_internally_grounded("false"),
    .signb_internally_grounded("true")
  )
  mac_mult_c(
    .signa(1'b0),
    .signb(1'b0),
    .dataa(dataa_ext[35:18]),
    .datab(datab_ext[17:0]),
    .dataout(mult_c_result),
    .clk({3'b000, clock}),
    .ena({3'b000, input_enable}),
    .aclr({3'b000, ~resetn})
  );

  stratixiv_mac_mult #(
    .dataa_width(18),
    .datab_width(18),
    .dataa_clock("0"),
    .datab_clock("0"),
    .dataa_clear("0"),
    .datab_clear("0"),
    .signa_internally_grounded("true"),
    .signb_internally_grounded("true")
  )
  mac_mult_d(
    .signa(1'b0),
    .signb(1'b0),
    .dataa(dataa_ext[17:0]),
    .datab(datab_ext[17:0]),
    .dataout(mult_d_result),
    .clk({3'b000, clock}),
    .ena({3'b000, input_enable}),
    .aclr({3'b000, ~resetn})
  );

  stratixiv_mac_out #(
    .dataa_width(36),
    .datab_width(36),
    .datac_width(36),
    .datad_width(36),
    .first_adder0_clock("0"),
    .first_adder1_clock("0"),
    .first_adder0_clear("0"),
    .first_adder1_clear("0"),
    .output_clock("0"),
    .output_clear("0"),
    .operation_mode("36_bit_multiply")
  )
  mac_out(
    .signa(1'b0),
    .signb(1'b0),
    .dataa(mult_a_result),
    .datab(mult_b_result),
    .datac(mult_c_result),
    .datad(mult_d_result),
    .dataout(mac_result),
    .clk({3'b000, clock}),
    .ena({3'b000, output_enable}),
    .aclr({3'b000, ~resetn})
  );

endmodule

