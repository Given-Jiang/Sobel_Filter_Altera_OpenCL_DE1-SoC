// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module acl_fp_atan2_double_s5 (
	enable,
	clock,
	dataa,
	datab,
	result);

	input	  enable;
	input	  clock;
	input	[63:0]  dataa;
	input	[63:0]  datab;
	output	[63:0]  result;

	wire [63:0] sub_wire0;
	wire [63:0] result = sub_wire0[63:0];

	fp_atan2_double_s5	inst (
				.en (enable),
        .areset(1'b0),
				.clk(clock),
				.a(dataa),
				.b(datab),
				.q(sub_wire0));

endmodule
