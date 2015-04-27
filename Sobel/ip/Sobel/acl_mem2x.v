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
    


module acl_mem2x
#(
  parameter DEPTH_WORDS=1,
  parameter WIDTH=32,
  parameter RDW_MODE="DONT_CARE",
  parameter RAM_OPERATION_MODE = "BIDIR_DUAL_PORT",     // altsyncram's OPERATION_MODE parameter
  parameter RAM_BLOCK_TYPE = "AUTO"                     // altsyncram's RAM_BLOCK_TYPE parameter
)
(
    input clk,
    input clk2x,
    input resetn,
    input [WIDTH-1:0] avs_port1_writedata,
    input [WIDTH-1:0] avs_port2_writedata,
    input [WIDTH-1:0] avs_port3_writedata,
    input [WIDTH-1:0] avs_port4_writedata,
    input [WIDTH/8-1:0] avs_port1_byteenable,
    input [WIDTH/8-1:0] avs_port2_byteenable,
    input [WIDTH/8-1:0] avs_port3_byteenable,
    input [WIDTH/8-1:0] avs_port4_byteenable,
    input [$clog2(DEPTH_WORDS)-1:0] avs_port1_address,
    input [$clog2(DEPTH_WORDS)-1:0] avs_port2_address,
    input [$clog2(DEPTH_WORDS)-1:0] avs_port3_address,
    input [$clog2(DEPTH_WORDS)-1:0] avs_port4_address,
    input avs_port1_read,
    input avs_port2_read,
    input avs_port3_read,
    input avs_port4_read,
    input avs_port1_write,
    input avs_port2_write,
    input avs_port3_write,
    input avs_port4_write,
    output reg [WIDTH-1:0] avs_port1_readdata,
    output reg [WIDTH-1:0] avs_port2_readdata,
    output reg [WIDTH-1:0] avs_port3_readdata,
    output reg [WIDTH-1:0] avs_port4_readdata,
    output avs_port1_readdatavalid,
    output avs_port2_readdatavalid,
    output avs_port3_readdatavalid,
    output avs_port4_readdatavalid,
    output avs_port1_waitrequest,
    output avs_port2_waitrequest,
    output avs_port3_waitrequest,
    output avs_port4_waitrequest
    );

  localparam LOG2DEPTH = $clog2( DEPTH_WORDS );

  assign avs_port1_waitrequest=1'b0;
  assign avs_port2_waitrequest=1'b0;
  assign avs_port3_waitrequest=1'b0;
  assign avs_port4_waitrequest=1'b0;

  wire [WIDTH-1:0] data_out_a_unreg;
  wire [WIDTH-1:0] data_out_b_unreg;
  reg  [WIDTH-1:0] data_out_a_reg;
  reg  [WIDTH-1:0] data_out_b_reg;
  reg  [WIDTH-1:0] data_out_a_reg2;
  reg  [WIDTH-1:0] data_out_b_reg2;

  _acl_mem2x_shiftreg readatavalid_1(.D(avs_port1_read), .clock(clk), .resetn(resetn), .enable(1'b1), .Q(avs_port1_readdatavalid));
    defparam readatavalid_1.WIDTH = 1;
    defparam readatavalid_1.DEPTH = 4;

  _acl_mem2x_shiftreg readatavalid_2(.D(avs_port2_read), .clock(clk), .resetn(resetn), .enable(1'b1), .Q(avs_port2_readdatavalid));
    defparam readatavalid_2.WIDTH = 1;
    defparam readatavalid_2.DEPTH = 4;

  _acl_mem2x_shiftreg readatavalid_3(.D(avs_port3_read), .clock(clk), .resetn(resetn), .enable(1'b1), .Q(avs_port3_readdatavalid));
    defparam readatavalid_3.WIDTH = 1;
    defparam readatavalid_3.DEPTH = 4;

  _acl_mem2x_shiftreg readatavalid_4(.D(avs_port4_read), .clock(clk), .resetn(resetn), .enable(1'b1), .Q(avs_port4_readdatavalid));
    defparam readatavalid_4.WIDTH = 1;
    defparam readatavalid_4.DEPTH = 4;


localparam PREFERRED_WIDTH=128;
localparam NUM_RAMS=((WIDTH+PREFERRED_WIDTH-1)/PREFERRED_WIDTH);
genvar n;
generate
   for(n=0; n<NUM_RAMS; n++)
   begin : block_n
   
   localparam MY_WIDTH=( (n==NUM_RAMS-1) ? (WIDTH-(NUM_RAMS-1)*PREFERRED_WIDTH) : PREFERRED_WIDTH );

   reg [LOG2DEPTH-1:0] addr_1_reg2x /* synthesis dont_merge */;
   reg [LOG2DEPTH-1:0] addr_2_reg2x /* synthesis dont_merge */;
   reg write_1_reg2x /* synthesis dont_merge */;
   reg write_2_reg2x /* synthesis dont_merge */;

   reg [LOG2DEPTH-1:0] addr_1_reg /* synthesis dont_merge */;
   reg [LOG2DEPTH-1:0] addr_2_reg /* synthesis dont_merge */;
   reg [LOG2DEPTH-1:0] addr_3_reg /* synthesis dont_merge */;
   reg [LOG2DEPTH-1:0] addr_4_reg /* synthesis dont_merge */;
   reg write_1_reg, write_2_reg /* synthesis dont_merge */;
   reg write_3_reg, write_4_reg /* synthesis dont_merge */;

   reg [MY_WIDTH-1:0] data_1_reg2x /* synthesis dont_merge */;
   reg [MY_WIDTH-1:0] data_2_reg2x /* synthesis dont_merge */;
   reg [MY_WIDTH/8-1:0] byteen_1_reg2x /* synthesis dont_merge */;
   reg [MY_WIDTH/8-1:0] byteen_2_reg2x /* synthesis dont_merge */;

   reg [MY_WIDTH-1:0] data_1_reg /* synthesis dont_merge */;
   reg [MY_WIDTH-1:0] data_2_reg /* synthesis dont_merge */;
   reg [MY_WIDTH-1:0] data_3_reg /* synthesis dont_merge */;
   reg [MY_WIDTH-1:0] data_4_reg /* synthesis dont_merge */;
   reg [MY_WIDTH/8-1:0] byteen_1_reg /* synthesis dont_merge */;
   reg [MY_WIDTH/8-1:0] byteen_2_reg /* synthesis dont_merge */;
   reg [MY_WIDTH/8-1:0] byteen_3_reg /* synthesis dont_merge */;
   reg [MY_WIDTH/8-1:0] byteen_4_reg /* synthesis dont_merge */;

   reg clk_90deg, sel2x /* synthesis dont_merge */;

   //Convert clock to data signal 
   always@(negedge clk2x)
    clk_90deg<=clk;
   always@(posedge clk2x)
    sel2x<=clk_90deg;  //This should give you exactly sel2x=~clk

   always@(posedge clk2x)
   begin
    addr_1_reg2x <= (!sel2x) ? addr_2_reg : addr_1_reg;
    addr_2_reg2x <= (!sel2x) ? addr_4_reg : addr_3_reg;
    write_1_reg2x <= (!sel2x) ? write_2_reg : write_1_reg;
    write_2_reg2x <= (!sel2x) ? write_4_reg : write_3_reg;
   end

   always@(posedge clk)
   begin
    addr_1_reg <= avs_port1_address;
    addr_2_reg <= avs_port2_address;
    addr_3_reg <= avs_port3_address;
    addr_4_reg <= avs_port4_address;
    write_1_reg <= avs_port1_write;
    write_2_reg <= avs_port2_write;
    write_3_reg <= avs_port3_write;
    write_4_reg <= avs_port4_write;
   end


   //Register before double pumping
   always@(posedge clk)
   begin
    data_1_reg <= avs_port1_writedata[n*PREFERRED_WIDTH +: MY_WIDTH];
    data_2_reg <= avs_port2_writedata[n*PREFERRED_WIDTH +: MY_WIDTH];
    data_3_reg <= avs_port3_writedata[n*PREFERRED_WIDTH +: MY_WIDTH];
    data_4_reg <= avs_port4_writedata[n*PREFERRED_WIDTH +: MY_WIDTH];
    byteen_1_reg <= avs_port1_byteenable[n*(PREFERRED_WIDTH/8) +: (MY_WIDTH/8)];
    byteen_2_reg <= avs_port2_byteenable[n*(PREFERRED_WIDTH/8) +: (MY_WIDTH/8)];
    byteen_3_reg <= avs_port3_byteenable[n*(PREFERRED_WIDTH/8) +: (MY_WIDTH/8)];
    byteen_4_reg <= avs_port4_byteenable[n*(PREFERRED_WIDTH/8) +: (MY_WIDTH/8)];
   end

   // Consider making only one port r/w and the rest read only
   always@(posedge clk2x)
   begin
    data_1_reg2x <= (!sel2x) ? data_2_reg : data_1_reg;
    data_2_reg2x <= (!sel2x) ? data_4_reg : data_3_reg;
    byteen_1_reg2x <= (!sel2x) ? byteen_2_reg : byteen_1_reg;
    byteen_2_reg2x <= (!sel2x) ? byteen_4_reg : byteen_3_reg;
   end

   altsyncram altsyncram_component (
    .clock0 (clk2x),
    .wren_a (write_1_reg2x),
    .wren_b (write_2_reg2x),
    .address_a (addr_1_reg2x),
    .address_b (addr_2_reg2x),
    .data_a (data_1_reg2x),
    .data_b (data_2_reg2x),
    .q_a (data_out_a_unreg[n*PREFERRED_WIDTH +: MY_WIDTH]),
    .q_b (data_out_b_unreg[n*PREFERRED_WIDTH +: MY_WIDTH]),
    .aclr0 (1'b0),
    .aclr1 (1'b0),
    .addressstall_a (1'b0),
    .addressstall_b (1'b0),
    .byteena_a (byteen_1_reg2x),
    .byteena_b (byteen_2_reg2x),
    .clock1 (1'b1),
    .clocken0 (1'b1),
    .clocken1 (1'b1),
    .clocken2 (1'b1),
    .clocken3 (1'b1),
    .eccstatus (),
    .rden_a (1'b1),
    .rden_b (1'b1));
  defparam
  altsyncram_component.address_reg_b = "CLOCK0",
    altsyncram_component.clock_enable_input_a = "BYPASS",
    altsyncram_component.clock_enable_input_b = "BYPASS",
    altsyncram_component.clock_enable_output_a = "BYPASS",
    altsyncram_component.clock_enable_output_b = "BYPASS",
    altsyncram_component.address_reg_b = "CLOCK0",
    altsyncram_component.rdcontrol_reg_b = "CLOCK0",
    altsyncram_component.byteena_reg_b = "CLOCK0",
    altsyncram_component.indata_reg_b = "CLOCK0",
    altsyncram_component.intended_device_family = "Stratix IV",
    altsyncram_component.lpm_type = "altsyncram",
    altsyncram_component.numwords_a = DEPTH_WORDS,
    altsyncram_component.numwords_b = DEPTH_WORDS,
    altsyncram_component.operation_mode = RAM_OPERATION_MODE,
    altsyncram_component.outdata_aclr_a = "NONE",
    altsyncram_component.outdata_aclr_b = "NONE",
    altsyncram_component.outdata_reg_a = "CLOCK0",
    altsyncram_component.outdata_reg_b = "CLOCK0",
    altsyncram_component.power_up_uninitialized = "FALSE",
    altsyncram_component.read_during_write_mode_mixed_ports = RDW_MODE,
    altsyncram_component.read_during_write_mode_port_a = "DONT_CARE",
    altsyncram_component.read_during_write_mode_port_b = "DONT_CARE",
    altsyncram_component.widthad_a = LOG2DEPTH,
    altsyncram_component.widthad_b = LOG2DEPTH,
    altsyncram_component.width_a = MY_WIDTH,
    altsyncram_component.width_b = MY_WIDTH,
    altsyncram_component.width_byteena_a = MY_WIDTH/8,
    altsyncram_component.width_byteena_b = MY_WIDTH/8,
    altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK0",
    altsyncram_component.ram_block_type = RAM_BLOCK_TYPE;
  end
endgenerate

  always@(posedge clk2x)
  begin
    data_out_a_reg<=data_out_a_unreg;
    data_out_b_reg<=data_out_b_unreg;
    data_out_a_reg2<=data_out_a_reg;
    data_out_b_reg2<=data_out_b_reg;
  end

  always@(posedge clk)
  begin
    avs_port1_readdata <= data_out_a_reg;
    avs_port2_readdata <= data_out_a_reg2;
    avs_port3_readdata <= data_out_b_reg;
    avs_port4_readdata <= data_out_b_reg2;
  end

endmodule


/*********************************************************************************
 * Support components
 *********************************************************************************/

module _acl_mem2x_shiftreg(D, clock, resetn, enable, Q);
	parameter WIDTH = 32;
	parameter DEPTH = 1;
	input [WIDTH-1:0] D;
	input clock, resetn, enable;
	output [WIDTH-1:0] Q;
	
	reg [DEPTH-1:0][WIDTH-1:0] local_ffs /* synthesis preserve */;

  always @(posedge clock or negedge resetn)
    if (!resetn)
      local_ffs <= '0;
    else if (enable)
      local_ffs <= {local_ffs[DEPTH-2:0], D};
	assign Q = local_ffs[DEPTH-1];
endmodule

