// Double pumped single precision floating point multiply
// Latency = 6 kernel clocks

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
    


// !!! WARNING !!!
// This core no longer works because the core is no longer fully high-capacity
// (and has a single staging register, which messes up things in the 2x clock
// domain). See acl_fp_custom_mul_hc.v and acl_fp_custom_mul_hc_core.v for 
// details.
// !!! WARNING !!!

module acl_fp_custom_mul_hc_dbl_pumped
#( parameter WIDTH = 32 )
(
    input logic clock,
    input logic clock2x,
    input logic resetn,
    input logic valid_in,
    input logic stall_in,
    output logic valid_out,
    output logic stall_out,
    input logic [WIDTH-1:0] a1,
    input logic [WIDTH-1:0] b1,
    input logic [WIDTH-1:0] a2,
    input logic [WIDTH-1:0] b2,
    output logic [WIDTH-1:0] y1,
    output logic [WIDTH-1:0] y2
    );
  localparam LATENCY = 6; // in "clock" cycles

  // Prevent sharing of these registers across different instances
  // (and even kernels!). The sharing may cause very long paths
  // across the chip, which limits fmax of clock2x.
  logic sel2x /* synthesis preserve */;

  // This is for simulation purposes. Matches physical behavior where
  // registers power up to zero.
  initial
  begin
    sel2x = 1'b0;
  end
  
  always@(posedge clock2x)
    sel2x <= ~sel2x;        // either the same as clock or ~clock

  // The block is high-capacity. Here are all of the
  // valid_in/out, stall_in/out signals for all "clock" cycles.
  //
  // Index 1 corresponds to the first cycle.
  typedef struct packed {
    logic valid_in, valid_out;
    logic stall_in, stall_out;
  } stage_flow_control;
  stage_flow_control s [1:LATENCY];

  genvar i;

  generate
    for( i = 1; i <= LATENCY; i = i + 1 )
    begin:stage
      // valid_in
      if( i == 1 )
        assign s[i].valid_in = valid_in;
      else
        assign s[i].valid_in = s[i-1].valid_out;

      // valid_out
      always @(posedge clock or negedge resetn)
        if( ~resetn )
          s[i].valid_out <= 1'b0;
        else if( ~s[i].stall_out )
          s[i].valid_out <= s[i].valid_in;

      // stall_in
      if( i == LATENCY )
        assign s[i].stall_in = stall_in;
      else
        assign s[i].stall_in = s[i+1].stall_out;

      // stall_out
      assign s[i].stall_out = s[i].valid_out & s[i].stall_in;
    end
  endgenerate

  assign valid_out = s[LATENCY].valid_out;
  assign stall_out = s[1].stall_out;

  // Register before double pumping
  logic [WIDTH-1:0] a1_reg;
  logic [WIDTH-1:0] b1_reg;
  logic [WIDTH-1:0] a2_reg;
  logic [WIDTH-1:0] b2_reg;

  always @(posedge clock)
    if( ~s[1].stall_out )
    begin
      a1_reg <= a1;
      a2_reg <= a2;
      b1_reg <= b1;
      b2_reg <= b2;
    end

  // Clock domain transfer
  logic [WIDTH-1:0] a1_reg_2x;
  logic [WIDTH-1:0] a2_reg_2x;
  logic [WIDTH-1:0] b1_reg_2x;
  logic [WIDTH-1:0] b2_reg_2x;

  logic valid_out_2x;

  always @(posedge clock2x)
    if( ~s[2].stall_out )
    begin
      a1_reg_2x <= a1_reg;
      a2_reg_2x <= a2_reg;
      b1_reg_2x <= b1_reg;
      b2_reg_2x <= b2_reg;
      valid_out_2x <= s[1].valid_out;
    end

  // The multipler. Takes six "clock2x" cycles to complete
  // (so takes 3 "clock" cycles to complete).
  logic [WIDTH-1:0] fp_mul_inp_a;
  logic [WIDTH-1:0] fp_mul_inp_b;
  logic [WIDTH-1:0] fp_mul_res;
  logic fp_mul_valid_out, fp_mul_stall_out;

  assign fp_mul_inp_a = (sel2x) ? a2_reg_2x : a1_reg_2x;
  assign fp_mul_inp_b = (sel2x) ? b2_reg_2x : b1_reg_2x;
    
  acl_fp_custom_mul_hc the_mul(
          .resetn(resetn),
          .clock(clock2x), 
          .valid_in(valid_out_2x),
          .stall_in(s[5].stall_out),
          .valid_out(fp_mul_valid_out),
          .stall_out(fp_mul_stall_out),
          .dataa(fp_mul_inp_a), 
          .datab(fp_mul_inp_b), 
          .result(fp_mul_res));

  // Track which set of inputs was selected in parallel with the 
  // multipler's pipeline. Track in the "clock2x" domain.
  //
  // There are six stages in this pipeline to correspond with the 
  // six stages in acl_fp_custom_mul_hc's pipeline.
  logic sel_21, sel_22, sel_31, sel_32, sel_41, sel_42;

  always @(posedge clock2x)
  begin
    if( ~s[2].stall_out )   // clock -> clock2x
    begin
      sel_21 <= sel2x;
      sel_22 <= sel_21;
    end

    if( ~s[3].stall_out )   // clock -> clock2x
    begin
      sel_31 <= sel_22;
      sel_32 <= sel_31;
    end

    if( ~s[4].stall_out )   // clock -> clock2x
    begin
      sel_41 <= sel_32;
      sel_42 <= sel_41;
    end
  end

  // Additional clock2x pipeline register to even things out
  // and separate the results from the two inputs in preparation
  // for the clock transfer back to the "clock" domain.
  logic [31:0] res1_5, res2_5;

  always @(posedge clock2x)
    if( ~s[5].stall_out )   // clock -> clock2x
    begin
      if( sel_42 )
      begin
        // This is the result from the 2nd set of inputs.
        res2_5 <= fp_mul_res;
      end
      else
      begin
        // This is the result from the 1st set of inputs.
        res1_5 <= fp_mul_res;
      end
    end

  // Output registers. Cross-clock path from clock2x -> clock.
  always @(posedge clock)
  begin
    if( ~s[6].stall_out )
    begin
      y1 <= res1_5;
      y2 <= res2_5;
    end
  end

endmodule


