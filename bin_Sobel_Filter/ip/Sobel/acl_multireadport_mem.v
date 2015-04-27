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
    


// Memory with multiple read ports and one write (broadcast) port.

module acl_multireadport_mem
#(
  parameter LOG2DEPTH=10,
  parameter WIDTH=32, 
  parameter NUMPORTS=13,    // Number of ports desired
  parameter USE2XCLOCK=1, 
  parameter DEDICATED_BROADCAST_PORT=0
)
(
  input   clk,
  input   clk2x,
  input   resetn,

  // Broadcast interface
  input  [LOG2DEPTH-1:0]   broadcast_addr,
  input  [WIDTH-1:0]      broadcast_writedata,
  input                   broadcast_read,
  input                   broadcast_write,
  output                  broadcast_waitrequest,
  output                  broadcast_readdatavalid,
  output [WIDTH-1:0]      broadcast_readdata,

  // Read port interfaces
  input      [NUMPORTS*LOG2DEPTH-1:0]    rdport_addr,
  input      [NUMPORTS-1:0]             rdport_read,
  output reg [NUMPORTS-1:0]             rdport_waitrequest,
  output reg [NUMPORTS-1:0]             rdport_readdatavalid,
  output reg [NUMPORTS*WIDTH-1:0]       rdport_readdata
);

/******************
* LOCAL PARAMETERS
*******************/

  localparam DEPTH=2**LOG2DEPTH;

  localparam PORTSPERMEM = (USE2XCLOCK) ? 4 : 2;  //Dual-port + double-pumped block RAMs
  localparam KERNPORTSPERMEM=PORTSPERMEM-DEDICATED_BROADCAST_PORT;

  // Do ceiling manually: CEIL(NUMPORTS/KERNPORTSPERMEM)
  localparam NUMMEMORIES=(NUMPORTS/KERNPORTSPERMEM + 
    ((NUMPORTS%KERNPORTSPERMEM==0) ? 0 : 1));

/******************
* SIGNALS
*******************/

  // Ports interfaces - connect these to rdport_ interface
  reg  [NUMMEMORIES*PORTSPERMEM*LOG2DEPTH-1:0]    port_addr;
  reg  [NUMMEMORIES*PORTSPERMEM-1:0]             port_read;
  wire [NUMMEMORIES*PORTSPERMEM-1:0]             port_waitrequest;
  wire [NUMMEMORIES*PORTSPERMEM-1:0]             port_readdatavalid;
  wire [NUMMEMORIES*PORTSPERMEM*WIDTH-1:0]       port_readdata;

  reg  [NUMMEMORIES-1:0] done_write;

/******************
* ARCHITECTURE
*******************/

  // Connect kernel interfaces to ports.  Really these only exist to prevent
  // compile errors on trailing ports.  Eg. If you want only 1 port the code
  // will still instatiate a 4-port memory but the last 3 interfaces get
  // synthesized away
  integer k;
  integer j;
  always@*
  begin
    j=0;
    for (k=0; k<NUMPORTS; k=k+1)
    begin 
      port_addr[j*LOG2DEPTH +: LOG2DEPTH]=rdport_addr[k*LOG2DEPTH +: LOG2DEPTH];
      port_read[j]=rdport_read[k];
      rdport_waitrequest[k]=port_waitrequest[j];
      rdport_readdatavalid[k]=port_readdatavalid[j];
      rdport_readdata[k*WIDTH +: WIDTH]=port_readdata[j*WIDTH +: WIDTH];
      //If the 4th port is dedicated to the host, skip it
      j=(j%PORTSPERMEM==KERNPORTSPERMEM-1) ? j+1+DEDICATED_BROADCAST_PORT : j+1 ;
    end
  end


  // If the host and kernels share a port, sel arbitrates between them.
  // 1 selects the kernel, 0 selects the host
  // Note it will always take the kernel's request, so the host may starve
  reg  [NUMMEMORIES-1:0] sel;
  integer i;
  always@*
    for (i=0; i<NUMMEMORIES; i=i+1)
      sel[i]=(!DEDICATED_BROADCAST_PORT) & (port_read[i+PORTSPERMEM-1]);

  // Replicate number of memories to achieve desired number of ports
  genvar p;
  generate
  for (p=0; p<NUMMEMORIES*PORTSPERMEM; p=p+PORTSPERMEM)
  begin : mem_gen

    if ( USE2XCLOCK )
    begin
      memory_block2x  #(.LOG2DEPTH(LOG2DEPTH), .WIDTH(WIDTH)) mem(
        .clk(clk),
        .clk2x(clk2x),

        .addr_1(port_addr[p*LOG2DEPTH +: LOG2DEPTH]),
        .read_1(port_read[p]),
        .data_out_1(port_readdata[p*WIDTH +: WIDTH]),
        .valid_1(port_readdatavalid[p]),

        .addr_2(port_addr[(p+1)*LOG2DEPTH +: LOG2DEPTH]),
        .read_2(port_read[p+1]),
        .data_out_2(port_readdata[(p+1)*WIDTH +: WIDTH]),
        .valid_2(port_readdatavalid[p+1]),

        .addr_3(port_addr[(p+2)*LOG2DEPTH +: LOG2DEPTH]),
        .read_3(port_read[p+2]),
        .data_out_3(port_readdata[(p+2)*WIDTH +: WIDTH]),
        .valid_3(port_readdatavalid[p+2]),

        .addr_4((sel) ? port_addr[(p+3)*LOG2DEPTH +: LOG2DEPTH] : broadcast_addr),
        .data_4( broadcast_writedata),
        .read_4((sel) ? port_read[p+3] : broadcast_read),
        .write_4((sel) ?  1'b0 : broadcast_write),
        .data_out_4( port_readdata[(p+3)*WIDTH +: WIDTH]),
        .valid_4( port_readdatavalid[p+3])
        );

        //Connect host read signals to 4th port
        assign broadcast_readdata=port_readdata[3*WIDTH +: WIDTH];
        assign broadcast_readdatavalid=port_readdatavalid[3];
    end
    else
    begin
      memory_block  #(.LOG2DEPTH(LOG2DEPTH), .WIDTH(WIDTH)) mem(
        .clk(clk),
        .clk2x(clk2x),

        .addr_1(port_addr[p*LOG2DEPTH +: LOG2DEPTH]),
        .read_1(port_read[p]),
        .data_out_1(port_readdata[p*WIDTH +: WIDTH]),
        .valid_1(port_readdatavalid[p]),

        .addr_2((sel) ? port_addr[(p+1)*LOG2DEPTH +: LOG2DEPTH] : broadcast_addr),
        .data_2( broadcast_writedata),
        .read_2((sel) ? port_read[p+1] : broadcast_read),
        .write_2((sel) ?  1'b0 : broadcast_write),
        .data_out_2( port_readdata[(p+1)*WIDTH +: WIDTH]),
        .valid_2( port_readdatavalid[p+1])
        );

        //Connect host read signals to 4th port
        assign broadcast_readdata=port_readdata[1*WIDTH +: WIDTH];
        assign broadcast_readdatavalid=port_readdatavalid[1];
    end

    assign port_waitrequest[p +: PORTSPERMEM]={PORTSPERMEM{1'b0}};

  end
  endgenerate

  // If broadcast port is shared, track and make sure all memories have written
  always@(posedge clk or negedge resetn)
    if (!resetn)
      done_write<={NUMMEMORIES{1'b0}};
    else if (&done_write)
      done_write<={NUMMEMORIES{1'b0}};
    else
      done_write<=done_write | ~sel;

  // Stall the host and write it again until all memories have written.
  // FIXME: What about host read?
  assign broadcast_waitrequest=(!DEDICATED_BROADCAST_PORT) & |(done_write | ~sel);

endmodule


module memory_block
#(
  parameter LOG2DEPTH=14,
  parameter WIDTH=32
)
(
    input clk,
    input clk2x,
    input [WIDTH-1:0] data_1,
    input [WIDTH-1:0] data_2,
    input [LOG2DEPTH-1:0] addr_1,
    input [LOG2DEPTH-1:0] addr_2,
    input read_1,
    input read_2,
    input write_1,
    input write_2,
    output [WIDTH-1:0] data_out_1,
    output [WIDTH-1:0] data_out_2,
    output valid_1,
    output valid_2
    );

  localparam DEPTH=2**LOG2DEPTH;

  reg clk_90deg,sel2x;

  shiftreg readatavalid_1(.D(read_1), .clock(clk), .enable(1'b1), .Q(valid_1));
    defparam readatavalid_1.WIDTH = 1;
    defparam readatavalid_1.DEPTH = 2;

  shiftreg readatavalid_2(.D(read_2), .clock(clk), .enable(1'b1), .Q(valid_2));
    defparam readatavalid_2.WIDTH = 1;
    defparam readatavalid_2.DEPTH = 2;

  altsyncram  altsyncram_component (
    .clock0 (clk),
    .wren_a (write_1),
    .wren_b (write_2),
    .address_a (addr_1),
    .address_b (addr_2),
    .data_a (data_1),
    .data_b (data_2),
    .q_a (data_out_1),
    .q_b (data_out_2),
    .aclr0 (1'b0),
    .aclr1 (1'b0),
    .addressstall_a (1'b0),
    .addressstall_b (1'b0),
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
    altsyncram_component.clock_enable_output_a = "BYPASS",
    altsyncram_component.clock_enable_output_b = "BYPASS",
    altsyncram_component.address_reg_b = "CLOCK0",
    altsyncram_component.rdcontrol_reg_b = "CLOCK0",
    altsyncram_component.byteena_reg_b = "CLOCK0",
    altsyncram_component.indata_reg_b = "CLOCK0",
    altsyncram_component.intended_device_family = "Stratix III",
    altsyncram_component.lpm_type = "altsyncram",
    altsyncram_component.ram_block_type = "M9K",
    //altsyncram_component.numwords_a = DEPTH*8/WIDTH,
    //altsyncram_component.numwords_b = DEPTH*8/WIDTH,
    altsyncram_component.operation_mode = "BIDIR_DUAL_PORT",
    altsyncram_component.outdata_aclr_a = "NONE",
    altsyncram_component.outdata_aclr_b = "NONE",
    altsyncram_component.outdata_reg_a = "CLOCK0",
    altsyncram_component.outdata_reg_b = "CLOCK0",
    altsyncram_component.power_up_uninitialized = "FALSE",
    altsyncram_component.read_during_write_mode_mixed_ports = "OLD_DATA",
    altsyncram_component.read_during_write_mode_port_a = "DONT_CARE",
    altsyncram_component.read_during_write_mode_port_b = "DONT_CARE",
    altsyncram_component.widthad_a = LOG2DEPTH,
    altsyncram_component.widthad_b = LOG2DEPTH,
    altsyncram_component.width_a = WIDTH,
    altsyncram_component.width_b = WIDTH,
    altsyncram_component.width_byteena_a = 1,
    altsyncram_component.width_byteena_b = 1,
    altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK0";

endmodule

module memory_block2x
#(
  parameter LOG2DEPTH=14,
  parameter WIDTH=32
)
(
    input clk,
    input clk2x,
    input [WIDTH-1:0] data_1,
    input [WIDTH-1:0] data_2,
    input [WIDTH-1:0] data_3,
    input [WIDTH-1:0] data_4,
    input [LOG2DEPTH-1:0] addr_1,
    input [LOG2DEPTH-1:0] addr_2,
    input [LOG2DEPTH-1:0] addr_3,
    input [LOG2DEPTH-1:0] addr_4,
    input read_1,
    input read_2,
    input read_3,
    input read_4,
    input write_1,
    input write_2,
    input write_3,
    input write_4,
    output reg [WIDTH-1:0] data_out_1,
    output reg [WIDTH-1:0] data_out_2,
    output reg [WIDTH-1:0] data_out_3,
    output reg [WIDTH-1:0] data_out_4,
    output valid_1,
    output valid_2,
    output valid_3,
    output valid_4
    );

  localparam DEPTH=2**LOG2DEPTH;

  reg [WIDTH-1:0] data_1_reg /* synthesis dont_merge */;
  reg [WIDTH-1:0] data_2_reg /* synthesis dont_merge */;
  reg [WIDTH-1:0] data_3_reg /* synthesis dont_merge */;
  reg [WIDTH-1:0] data_4_reg /* synthesis dont_merge */;
  reg [LOG2DEPTH-1:0] addr_1_reg /* synthesis dont_merge */;
  reg [LOG2DEPTH-1:0] addr_2_reg /* synthesis dont_merge */;
  reg [LOG2DEPTH-1:0] addr_3_reg /* synthesis dont_merge */;
  reg [LOG2DEPTH-1:0] addr_4_reg /* synthesis dont_merge */;
  reg write_1_reg, write_2_reg /* synthesis maxfan=32 */;
  reg write_3_reg, write_4_reg /* sytnthesis maxfan=32 */;
  wire [WIDTH-1:0] data_out_a_unreg;
  wire [WIDTH-1:0] data_out_b_unreg;
  reg  [WIDTH-1:0] data_out_a_reg;
  reg  [WIDTH-1:0] data_out_b_reg;
  reg  [WIDTH-1:0] data_out_a_reg2;
  reg  [WIDTH-1:0] data_out_b_reg2;

  reg [WIDTH-1:0] data_1_reg2x;
  reg [WIDTH-1:0] data_2_reg2x;
  reg [WIDTH-1:0] data_3_reg2x;
  reg [WIDTH-1:0] data_4_reg2x;
  reg [LOG2DEPTH-1:0] addr_1_reg2x;
  reg [LOG2DEPTH-1:0] addr_2_reg2x;
  reg [LOG2DEPTH-1:0] addr_3_reg2x;
  reg [LOG2DEPTH-1:0] addr_4_reg2x;
  reg write_1_reg2x, write_2_reg2x;
  reg write_3_reg2x, write_4_reg2x;

  reg clk_90deg,sel2x /* synthesis maxfan=32 */;

  //Register before double pumping
  always@(posedge clk)
  begin
    addr_1_reg <= addr_1;
    addr_2_reg <= addr_2;
    addr_3_reg <= addr_3;
    addr_4_reg <= addr_4;
    data_1_reg <= data_1;
    data_2_reg <= data_2;
    data_3_reg <= data_3;
    data_4_reg <= data_4;
    write_1_reg <= write_1;
    write_2_reg <= write_2;
    write_3_reg <= write_3;
    write_4_reg <= write_4;
  end

  // Consider making only one port r/w and the rest read only
  always@(posedge clk2x)
  begin
    addr_1_reg2x <= (!sel2x) ? addr_1_reg : addr_3_reg2x;
    addr_2_reg2x <= (!sel2x) ? addr_2_reg : addr_4_reg2x;
    addr_3_reg2x <= addr_3_reg;
    addr_4_reg2x <= addr_4_reg;
    data_1_reg2x <= (!sel2x) ? data_1_reg : data_3_reg2x;
    data_2_reg2x <= (!sel2x) ? data_2_reg : data_4_reg2x;
    data_3_reg2x <= data_3_reg;
    data_4_reg2x <= data_4_reg;
    write_1_reg2x <= (!sel2x) ? write_1_reg : write_3_reg2x;
    write_2_reg2x <= (!sel2x) ? write_2_reg : write_4_reg2x;
    write_3_reg2x <= write_3_reg;
    write_4_reg2x <= write_4_reg;
  end

  shiftreg readatavalid_1(.D(read_1), .clock(clk), .enable(1'b1), .Q(valid_1));
    defparam readatavalid_1.WIDTH = 1;
    defparam readatavalid_1.DEPTH = 4;

  shiftreg readatavalid_2(.D(read_2), .clock(clk), .enable(1'b1), .Q(valid_2));
    defparam readatavalid_2.WIDTH = 1;
    defparam readatavalid_2.DEPTH = 4;

  shiftreg readatavalid_3(.D(read_3), .clock(clk), .enable(1'b1), .Q(valid_3));
    defparam readatavalid_3.WIDTH = 1;
    defparam readatavalid_3.DEPTH = 4;

  shiftreg readatavalid_4(.D(read_4), .clock(clk), .enable(1'b1), .Q(valid_4));
    defparam readatavalid_4.WIDTH = 1;
    defparam readatavalid_4.DEPTH = 4;

  //Convert clock to data signal 
  always@(negedge clk2x)
    clk_90deg<=clk;
  always@(posedge clk2x)
    sel2x<=clk_90deg;  //This should give you exactly sel2x=~clk

  altsyncram  altsyncram_component (
    .clock0 (clk2x),
    .wren_a (write_1_reg2x),
    .wren_b (write_2_reg2x),
    .address_a (addr_1_reg2x),
    .address_b (addr_2_reg2x),
    .data_a (data_1_reg2x),
    .data_b (data_2_reg2x),
    .q_a (data_out_a_unreg),
    .q_b (data_out_b_unreg),
    .aclr0 (1'b0),
    .aclr1 (1'b0),
    .addressstall_a (1'b0),
    .addressstall_b (1'b0),
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
    altsyncram_component.clock_enable_output_a = "BYPASS",
    altsyncram_component.clock_enable_output_b = "BYPASS",
    altsyncram_component.address_reg_b = "CLOCK0",
    altsyncram_component.rdcontrol_reg_b = "CLOCK0",
    altsyncram_component.byteena_reg_b = "CLOCK0",
    altsyncram_component.indata_reg_b = "CLOCK0",
    altsyncram_component.intended_device_family = "Stratix III",
    altsyncram_component.lpm_type = "altsyncram",
    altsyncram_component.ram_block_type = "M9K",
    //altsyncram_component.numwords_a = DEPTH*8/WIDTH,
    //altsyncram_component.numwords_b = DEPTH*8/WIDTH,
    altsyncram_component.operation_mode = "BIDIR_DUAL_PORT",
    altsyncram_component.outdata_aclr_a = "NONE",
    altsyncram_component.outdata_aclr_b = "NONE",
    altsyncram_component.outdata_reg_a = "CLOCK0",
    altsyncram_component.outdata_reg_b = "CLOCK0",
    altsyncram_component.power_up_uninitialized = "FALSE",
    altsyncram_component.read_during_write_mode_mixed_ports = "OLD_DATA",
    altsyncram_component.read_during_write_mode_port_a = "DONT_CARE",
    altsyncram_component.read_during_write_mode_port_b = "DONT_CARE",
    altsyncram_component.widthad_a = LOG2DEPTH,
    altsyncram_component.widthad_b = LOG2DEPTH,
    altsyncram_component.width_a = WIDTH,
    altsyncram_component.width_b = WIDTH,
    altsyncram_component.width_byteena_a = 1,
    altsyncram_component.width_byteena_b = 1,
    altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK0";

  always@(posedge clk2x)
  begin
    data_out_a_reg<=data_out_a_unreg;
    data_out_b_reg<=data_out_b_unreg;
    data_out_a_reg2<=data_out_a_reg;
    data_out_b_reg2<=data_out_b_reg;
  end

  always@(posedge clk)
  begin
    data_out_1 <= data_out_a_reg2;
    data_out_2 <= data_out_b_reg2;
    data_out_3 <= data_out_a_reg;
    data_out_4 <= data_out_b_reg;
  end

endmodule


/*********************************************************************************
 * Support components
 *********************************************************************************/

module shiftreg(D, clock, enable, Q);
	parameter WIDTH = 32;
	parameter DEPTH = 1;
	input [WIDTH-1:0] D;
	input clock, enable;
	output [WIDTH-1:0] Q;
	
	reg [WIDTH-1:0] local_ffs [0:DEPTH-1];
	
	genvar i;
	generate
		for(i = 0; i<=DEPTH-1; i = i+1) 
		begin : local_register
			always @(posedge clock)
				if (enable)
					if (i==0)
						local_ffs[0] <= D;
					else
						local_ffs[i] <= local_ffs[i-1];
		end
	endgenerate
	assign Q = local_ffs[DEPTH-1];
endmodule
