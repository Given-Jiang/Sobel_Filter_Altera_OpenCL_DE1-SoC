// Latency = 28 cycles
module dspba_sqrt_dp_sv(
  input logic clock,
  input logic [63:0] dataa,
  input logic enable,     // not used!!
  output logic [63:0] result
);
  SqrtDPStratixVf400 inst(
    .xIn_0(dataa),
    .xOut_0(result),
    .clk(clock)
  );
endmodule

