// Double pumped single precision floating point add
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
    


module acl_fp_custom_add_dbl_pumped
#( parameter WIDTH = 32 )
(
    input clock,
    input clock2x,
    input enable,
    input resetn,
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
  
  // Prevent sharing of these registers across different instances
  // (and even kernels!). The sharing may cause very long paths
  // across the chip, which limits fmax of clock2x.
  reg sel2x /* synthesis preserve */;

  wire [WIDTH-1:0] fp_add_sub_inp_a;
  wire [WIDTH-1:0] fp_add_sub_inp_b;
  wire [WIDTH-1:0] fp_add_sub_res;

  initial
  begin
     sel2x = 1'b0;
  end
  
  always@(posedge clock2x)
    if (enable)
		   sel2x<=~sel2x;  

  //Register before double pumping
  reg selector, selector_2x;
  always@(posedge clock or negedge resetn)
  begin
	 if (~resetn)
	 begin
		a1_reg <= {WIDTH{1'b0}};
		a2_reg <= {WIDTH{1'b0}};
		b1_reg <= {WIDTH{1'b0}};
		b2_reg <= {WIDTH{1'b0}};
    selector <= 1'b0;	 
	 end
	 else if (enable) 
	 begin
		a1_reg <= a1;
		a2_reg <= a2;
		b1_reg <= b1;
		b2_reg <= b2;
    selector <= sel2x;
	 end
  end

  reg [WIDTH-1:0] a1_reg_2x;
  reg [WIDTH-1:0] a2_reg_2x;
  reg [WIDTH-1:0] b1_reg_2x;
  reg [WIDTH-1:0] b2_reg_2x;
  
  // Clock domain transfer
  always@(posedge clock2x)
  if (enable) 
	  begin
		  a1_reg_2x <= a1_reg;
		  a2_reg_2x <= a2_reg;
		  b1_reg_2x <= b1_reg;
		  b2_reg_2x <= b2_reg;
      selector_2x <= selector;
	  end
  
  assign fp_add_sub_inp_a = (sel2x) ? a2_reg_2x : a1_reg_2x;
  assign fp_add_sub_inp_b = (sel2x) ? b2_reg_2x : b1_reg_2x;
    
  acl_fp_custom_add the_add(
          .resetn(resetn),
          .enable(enable), 
          .clock(clock2x), 
          .dataa(fp_add_sub_inp_a), 
          .datab(fp_add_sub_inp_b), 
          .result(fp_add_sub_res));

  //For testing purposes
  //always@(posedge clk2x)
  //begin
  //   fp_sub_res1 <= fp_sub_inp_a + fp_sub_inp_b;
  //   fp_sub_res <= fp_sub_res1;
  //end
  reg [WIDTH-1:0] res1;
  reg [WIDTH-1:0] res2;
  reg [WIDTH-1:0] temp;

  always@(posedge clock2x)
  begin
    if (enable)
    begin
       if (~sel2x == selector_2x)
       begin
          res1 <= (~selector_2x) ? temp : fp_add_sub_res;
          res2 <= (~selector_2x) ? fp_add_sub_res : temp;
       end
		   temp <= fp_add_sub_res;
    end
  end

  always@(posedge clock or negedge resetn)
  begin
   if (~resetn)
   begin
      y1 <= {WIDTH{1'b0}};
      y2 <= {WIDTH{1'b0}};
   end
   else if (enable)
	 begin
		  y1 <= res1;
		  y2 <= res2;
	 end
  end    

endmodule


