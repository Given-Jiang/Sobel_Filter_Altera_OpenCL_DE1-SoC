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
    


module acl_mem1x
#(
  parameter DEPTH_WORDS=1,
  parameter WIDTH=32,
  parameter MEM_LATENCY=3,   // ONLY two values are allowed: 1 and 3
  parameter RDW_MODE="DONT_CARE",
  parameter RAM_OPERATION_MODE = "BIDIR_DUAL_PORT",     // altsyncram's OPERATION_MODE parameter
  parameter RAM_BLOCK_TYPE = "AUTO"                     // altsyncram's RAM_BLOCK_TYPE parameter
)
(
    input wire clk,
    input wire resetn,
    input wire [WIDTH-1:0] avs_port1_writedata,
    input wire [WIDTH-1:0] avs_port2_writedata,
    input wire [WIDTH/8-1:0] avs_port1_byteenable,
    input wire [WIDTH/8-1:0] avs_port2_byteenable,
    input wire [$clog2(DEPTH_WORDS)-1:0] avs_port1_address,
    input wire [$clog2(DEPTH_WORDS)-1:0] avs_port2_address,
    input wire avs_port1_read,
    input wire avs_port2_read,
    input wire avs_port1_write,
    input wire avs_port2_write,
    output logic [WIDTH-1:0] avs_port1_readdata,
    output logic [WIDTH-1:0] avs_port2_readdata,
    output logic avs_port1_readdatavalid,
    output logic avs_port2_readdatavalid,
    output logic avs_port1_waitrequest,
    output logic avs_port2_waitrequest
    );
  
  localparam LOG2DEPTH = $clog2( DEPTH_WORDS );
  localparam LOW_LATENCY = MEM_LATENCY < 3 ? 1 : 0;
  assign avs_port1_waitrequest=1'b0;
  assign avs_port2_waitrequest=1'b0;

generate
if (LOW_LATENCY) 
begin
   always @(posedge clk or negedge resetn)
   begin
      if (!resetn)
      begin
         avs_port1_readdatavalid <= '0;
         avs_port2_readdatavalid <= '0;
      end
      else
      begin
         avs_port1_readdatavalid <= avs_port1_read;
         avs_port2_readdatavalid <= avs_port2_read;
      end
   end
end
else
begin
  _acl_mem1x_shiftreg readatavalid_1(.D(avs_port1_read), .clock(clk), .resetn(resetn), .enable(1'b1), .Q(avs_port1_readdatavalid));
    defparam readatavalid_1.WIDTH = 1;
    defparam readatavalid_1.DEPTH = 3;

  _acl_mem1x_shiftreg readatavalid_2(.D(avs_port2_read), .clock(clk), .resetn(resetn), .enable(1'b1), .Q(avs_port2_readdatavalid));
    defparam readatavalid_2.WIDTH = 1;
    defparam readatavalid_2.DEPTH = 3;
end
endgenerate

localparam PREFERRED_WIDTH=128;
localparam NUM_RAMS=((WIDTH+PREFERRED_WIDTH-1)/PREFERRED_WIDTH);
genvar n;
generate
   for(n=0; n<NUM_RAMS; n++)
   begin : block_n
   
   localparam MY_WIDTH=( (n==NUM_RAMS-1) ? (WIDTH-(NUM_RAMS-1)*PREFERRED_WIDTH) : PREFERRED_WIDTH );

   reg [MY_WIDTH-1:0]   r_port1_writedata;
   reg [MY_WIDTH-1:0]   r_port2_writedata;
   reg [MY_WIDTH/8-1:0] r_port1_byteenable;
   reg [MY_WIDTH/8-1:0] r_port2_byteenable; 
   reg [LOG2DEPTH-1:0]  r_port1_address;
   reg [LOG2DEPTH-1:0]  r_port2_address;
   reg                  r_port1_write;
   reg                  r_port2_write;
   wire [MY_WIDTH-1:0]  port1_readdata;
   wire [MY_WIDTH-1:0]  port2_readdata;

if (LOW_LATENCY) 
begin
   assign r_port1_writedata = avs_port1_writedata[n*PREFERRED_WIDTH +: MY_WIDTH];
   assign r_port2_writedata = avs_port2_writedata[n*PREFERRED_WIDTH +: MY_WIDTH];
   assign r_port1_byteenable = avs_port1_byteenable[n*PREFERRED_WIDTH/8 +: MY_WIDTH/8];
   assign r_port2_byteenable = avs_port2_byteenable[n*PREFERRED_WIDTH/8 +: MY_WIDTH/8];
   assign r_port1_address = avs_port1_address;
   assign r_port2_address = avs_port2_address;
   assign r_port1_write = avs_port1_write;
   assign r_port2_write = avs_port2_write;
end
else
begin
   always @(posedge clk or negedge resetn)
   begin
      if (!resetn)
      begin
         r_port1_writedata <= 'x;
         r_port2_writedata <= 'x;
         r_port1_byteenable <= 'x;
         r_port2_byteenable <= 'x;
         r_port1_address <= 'x;
         r_port2_address <= 'x;
         r_port1_write <= 1'b0;
         r_port2_write <= 1'b0; 
      end
      else
      begin
         r_port1_writedata <= avs_port1_writedata[n*PREFERRED_WIDTH +: MY_WIDTH]; 
         r_port2_writedata <= avs_port2_writedata[n*PREFERRED_WIDTH +: MY_WIDTH];
         r_port1_byteenable <= avs_port1_byteenable[n*PREFERRED_WIDTH/8 +: MY_WIDTH/8];
         r_port2_byteenable <= avs_port2_byteenable[n*PREFERRED_WIDTH/8 +: MY_WIDTH/8];
         r_port1_address <= avs_port1_address;
         r_port2_address <= avs_port2_address;
         r_port1_write <= avs_port1_write; 
         r_port2_write <= avs_port2_write; 
      end
   end
end

   assign avs_port1_readdata[n*PREFERRED_WIDTH +: MY_WIDTH] = port1_readdata;
   assign avs_port2_readdata[n*PREFERRED_WIDTH +: MY_WIDTH] = port2_readdata;

   altsyncram  altsyncram_component (
    .clock0 (clk),
    .wren_a (r_port1_write),
    .wren_b (r_port2_write),
    .address_a (r_port1_address),
    .address_b (r_port2_address),
    .data_a (r_port1_writedata),
    .data_b (r_port2_writedata),
    .q_a (port1_readdata),
    .q_b (port2_readdata),
    .aclr0 (1'b0),
    .aclr1 (1'b0),
    .addressstall_a (1'b0),
    .addressstall_b (1'b0),
    .byteena_a (r_port1_byteenable),
    .byteena_b (r_port2_byteenable),
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
    altsyncram_component.outdata_reg_a = LOW_LATENCY ? "UNREGISTERED" : "CLOCK0",
    altsyncram_component.outdata_reg_b = LOW_LATENCY ? "UNREGISTERED" : "CLOCK0",
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

endmodule


/*********************************************************************************
 * Support components
 *********************************************************************************/

module _acl_mem1x_shiftreg(D, clock, resetn, enable, Q);
	parameter WIDTH = 32;
	parameter DEPTH = 1;
	input logic [WIDTH-1:0] D;
	input logic clock, resetn, enable;
	output logic [WIDTH-1:0] Q;
	
	reg [DEPTH-1:0][WIDTH-1:0] local_ffs /* synthesis preserve */;

  always @(posedge clock or negedge resetn)
    if (!resetn)
      local_ffs <= '0;
    else if (enable)
      local_ffs <= {local_ffs[DEPTH-2:0], D};
	assign Q = local_ffs[DEPTH-1];
endmodule

