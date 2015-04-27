// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module acl_fp_acospi_double_s5 (
	enable,
	clock,
	dataa,
	result);

	input	  enable;
	input	  clock;
	input	[63:0]  dataa;
	output	[63:0]  result;

	wire [63:0] sub_wire0;
	wire [63:0] result = sub_wire0[63:0];

  fp_acospi_double_s5 inst(
        .a(dataa),
        .en(enable),
        .q(sub_wire0),
        .clk(clock),
        .areset(1'b0)
        );

endmodule
