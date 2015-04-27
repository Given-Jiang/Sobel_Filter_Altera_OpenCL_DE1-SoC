// Double pumped single precision floating point add/sub
// Latency = 9 kernel clocks
//

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
    


module acl_fp_add_sub_dbl_pumped
#(
  // Bit width of a single precision float
  parameter WIDTH=32
)
(
    input clock,
    input clock2x,
    input enable,
    input add_sub,
    input [WIDTH-1:0] a1,
    input [WIDTH-1:0] b1,
    input [WIDTH-1:0] a2,
    input [WIDTH-1:0] b2,
    output reg [WIDTH-1:0] y1,
    output reg [WIDTH-1:0] y2
    );

  reg [WIDTH-1:0] a1_reg;
  reg [WIDTH-1:0] b1_reg;
  reg [WIDTH-1:0] a2_reg;
  reg [WIDTH-1:0] b2_reg;
  reg add_sub_reg;
  
  // Prevent sharing of these registers across different instances
  // (and even kernels!). The sharing may cause very long paths
  // across the chip, which limits fmax of clock2x.
  reg clk_90deg, sel2x /* synthesis preserve */;

  reg [WIDTH-1:0] fp_add_sub_inp_a;
  reg [WIDTH-1:0] fp_add_sub_inp_b;
  reg fp_add_sub_inp_add_sub;
  wire [WIDTH-1:0] fp_add_sub_res;
  reg [WIDTH-1:0] fp_add_sub_res_reg;
  reg [WIDTH-1:0] fp_add_sub_res_del1_2x_cycle;

  //Register before double pumping
  always@(posedge clock)
  begin
    if (enable) a1_reg <= a1;
    if (enable) a2_reg <= a2;
    if (enable) b1_reg <= b1;
    if (enable) b2_reg <= b2;
    if (enable) add_sub_reg <= add_sub;
  end


  generate
    if (WIDTH == 32)
      acl_fp_add_sub_fast the_sub(
          .add_sub(fp_add_sub_inp_add_sub), 
          .clk_en(enable), 
          .clock(clock2x), 
          .dataa(fp_add_sub_inp_a), 
          .datab(fp_add_sub_inp_b), 
          .result(fp_add_sub_res));
    else // WIDTH == 64
      acl_fp_add_sub_fast_double the_sub(
          .add_sub(fp_add_sub_inp_add_sub), 
          .enable(enable), 
          .clock(clock2x), 
          .dataa(fp_add_sub_inp_a), 
          .datab(fp_add_sub_inp_b), 
          .result(fp_add_sub_res));    
  endgenerate

  //For testing purposes
  //always@(posedge clk2x)
  //begin
  //   fp_sub_res1 <= fp_sub_inp_a + fp_sub_inp_b;
  //   fp_sub_res <= fp_sub_res1;
  //end

  always@(posedge clock2x)
  begin
    if (enable) fp_add_sub_res_del1_2x_cycle <= fp_add_sub_res_reg;
    if (enable) fp_add_sub_inp_a <= (!sel2x) ? a1_reg : a2_reg;
    if (enable) fp_add_sub_inp_b <= (!sel2x) ? b1_reg : b2_reg;
    if (enable) fp_add_sub_inp_add_sub <= add_sub_reg;
    if (enable) fp_add_sub_res_reg <= fp_add_sub_res;
  end

  always@(posedge clock)
  begin
     if (enable) y1 <= fp_add_sub_res_del1_2x_cycle;
     if (enable) y2 <= fp_add_sub_res_reg;
  end    

  //Convert clock to data signal 
  always@(negedge clock2x)
    clk_90deg<=clock;
  always@(posedge clock2x)
    sel2x<=clk_90deg;  //This should give you exactly sel2x=~clock

endmodule


