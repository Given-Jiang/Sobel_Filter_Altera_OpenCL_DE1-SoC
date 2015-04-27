module global_routing
(
   input s,
   input clk,
   output g
);

GLOBAL cal_clk_gbuf (.in(s), .out(g));

endmodule
