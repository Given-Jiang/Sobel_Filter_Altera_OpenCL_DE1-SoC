// Latency = 71 cycles
module dspba_sin_dp_sv(
  input logic clock,
  input logic [63:0] dataa,
  input logic enable,     // not used!!
  output logic [63:0] result
);
  SinDPStratixVf400 inst(
    .xIn_0(dataa),
    .xOut_0(result),
    .clk(clock)
  );
endmodule

