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
// Parameterized FIFO which assumes first ADDR_WIDTH bits of data_in is an
// index.  It stores each datum in its respective RAM address and outputs them
// sequentially from 0.
//
//===----------------------------------------------------------------------===//
module acl_fifo_reorder (
	clock,
	resetn,
	data_in,
	data_out,
	valid_in,
	valid_out,
	stall_in,
	stall_out,
  hw_group_exiting,
  num_exiting_workitems);

	parameter ADDR_WIDTH = 32;
	parameter DATA_WIDTH = 32;
	parameter DEPTH = 256;
	parameter MAX_SIMULTANEOUS_WORKGROUPS = 1;
  parameter WORKGROUP_SIZE_BITS = 32;

  localparam LOG2DEPTH=$clog2(DEPTH);
  localparam COUNTER_WIDTH=$clog2(DEPTH*MAX_SIMULTANEOUS_WORKGROUPS+1);
  localparam LOG2_MAX_SIMULTANEOUS_WORKGROUPS=$clog2(MAX_SIMULTANEOUS_WORKGROUPS);
  localparam WG_ID_BITS = LOG2_MAX_SIMULTANEOUS_WORKGROUPS > 0 ? LOG2_MAX_SIMULTANEOUS_WORKGROUPS : 1;
  localparam LLID_BITS = LOG2DEPTH > 0 : LOG2DEPTH : 1;

	input  clock;
	input  resetn;
	input  valid_in;
	output stall_out;
	input  [DATA_WIDTH-1:0] data_in;
	output valid_out;
	input  stall_in;
	output [DATA_WIDTH-1:0] data_out;
  input  [WG_ID_BITS-1:0] hw_group_exiting;
	input  [WORKGROUP_SIZE_BITS-1:0] num_exiting_workitems;

  reg  read;
	reg  valid_out;

  reg [COUNTER_WIDTH-1:0] count;
  reg [LOG2DEPTH+LOG2_MAX_SIMULTANEOUS_WORKGROUPS-1:0] address;

  wire item_entered;
  wire item_exited;

	wire [LOG2DEPTH+LOG2_MAX_SIMULTANEOUS_WORKGROUPS-1:0] addr_in;
	reg  [ADDR_WIDTH-1:0] addr_out;
	wire [DATA_WIDTH-ADDR_WIDTH-1:0] actual_data_in;
	wire [DATA_WIDTH-ADDR_WIDTH-1:0] _data_out;

generate
if(MAX_SIMULTANEOUS_WORKGROUPS>1)
  // High-bits are hardware work-group id.
  assign addr_in[LOG2DEPTH +: LOG2_MAX_SIMULTANEOUS_WORKGROUPS] = data_in[0 +: LOG2_MAX_SIMULTANEOUS_WORKGROUPS];

if(DEPTH > 1)
  // Low-bits are local linear id.
  assign addr_in[0 +: LOG2DEPTH] = data_in[32 +: LOG2DEPTH];
endgenerate

  assign actual_data_in=data_in[DATA_WIDTH-1:ADDR_WIDTH];

  assign item_entered = valid_in && ~stall_out;
  assign item_exited= valid_out && ~stall_in;

  always@(posedge clock or negedge resetn)
    if (!resetn)
      count<={COUNTER_WIDTH{1'b0}};
    else
    begin
      case ({item_entered,item_exited})
        2'b01:
          count<=count-1;
        2'b10:
          count<=count+1;
      endcase
    end

  assign stall_out = (count==DEPTH*MAX_SIMULTANEOUS_WORKGROUPS);

  // The stall logic needs to freeze this pipeline if its outputting data
  // but the kernel is not accepting (stall_in), but it should ignore stall_in
  // in each of the stages (read data out and read issue) if they do 
  // not respectively contain valid data.  The loop limiter logic seems to
  // only lower stall_in when valid_out is high, so we must push data through
  // even when stall_in is high to eventually assert valid_out.
  //
  // valid signal for stage 1: read
  // valid signal for stage 2: valid_out

  // ******************* Stage 1 read issue ***********************

  always@(posedge clock or negedge resetn)
    if (!resetn)
      address<=0;
    else if (~(|num_exiting_workitems))
      address<=(0|hw_group_exiting) << LOG2DEPTH;
    else if (read && !(stall_in && valid_out))
      if (num_exiting_workitems == 'd1)
        // This is a test if num_exiting_workitems == 1.
        address <= (0|hw_group_exiting) << LOG2DEPTH;
      else
        address <= address+'d1;

  always@(posedge clock or negedge resetn)
    if (!resetn)
      read<= 1'b0;
    else if (~(|num_exiting_workitems))
      read<= 1'b0;
    else if (!(stall_in && read && valid_out))
      read<= (|num_exiting_workitems);


  // ******************* Stage 1 read data valid ***********************

  altsyncram  altsyncram_component (
    .clock0 (clock),
    .wren_a (item_entered),
    .address_a (addr_in),
    .data_a (actual_data_in),
    .wren_b (),
    .address_b (address),
    .data_b (),
    .q_a (),
    .q_b (_data_out),
    .aclr0 (1'b0),
    .aclr1 (1'b0),
    .addressstall_a (1'b0),
    .addressstall_b (stall_in && valid_out),
    .byteena_a (1'b1),
    .byteena_b (1'b1),
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
    altsyncram_component.clock_enable_output_b = "BYPASS",
    altsyncram_component.intended_device_family = "Stratix IV",
    altsyncram_component.lpm_type = "altsyncram",
    //altsyncram_component.numwords_a = DEPTH*8/DATA_WIDTH,
    //altsyncram_component.numwords_b = DEPTH*8/DATA_WIDTH,
    altsyncram_component.operation_mode = "DUAL_PORT",
    altsyncram_component.outdata_aclr_b = "NONE",
    altsyncram_component.outdata_reg_b = "UNREGISTERED",
    altsyncram_component.power_up_uninitialized = "FALSE",
    altsyncram_component.read_during_write_mode_mixed_ports = "DONT_CARE",
    altsyncram_component.read_during_write_mode_port_a = "DONT_CARE",
    altsyncram_component.read_during_write_mode_port_b = "DONT_CARE",
    altsyncram_component.widthad_a = LOG2DEPTH+LOG2_MAX_SIMULTANEOUS_WORKGROUPS,
    altsyncram_component.widthad_b = LOG2DEPTH+LOG2_MAX_SIMULTANEOUS_WORKGROUPS,
    altsyncram_component.width_a = DATA_WIDTH-ADDR_WIDTH,
    altsyncram_component.width_b = DATA_WIDTH-ADDR_WIDTH,
    altsyncram_component.width_byteena_a = 1;

  assign data_out={_data_out[DATA_WIDTH-ADDR_WIDTH-1:0],addr_out};

  always@(posedge clock or negedge resetn)
    if (!resetn)
      addr_out<={ADDR_WIDTH{1'b0}};
    else if (!(stall_in && valid_out))
    begin
      // Reform {local_linear_id, hw_wg_id}
      if(LOG2_MAX_SIMULTANEOUS_WORKGROUPS > 0)
        addr_out[0 +: LOG2_MAX_SIMULTANEOUS_WORKGROUPS] <= address[LOG2DEPTH +: LOG2_MAX_SIMULTANEOUS_WORKGROUPS];
      else
        addr_out[0] <= 1'b0;

      if(LOG2DEPTH > 0)
        addr_out[32 +: LOG2DEPTH] <= address[0 +: LOG2DEPTH];
      else
        addr_out[32] <= 1'b0;
    end

  always@(posedge clock or negedge resetn)
    if (!resetn)
      valid_out<=1'b0;
    else if (~(|num_exiting_workitems))
      valid_out<=1'b0;
    else if (!(stall_in && valid_out))
      valid_out<=read; 

endmodule
