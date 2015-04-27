// Latency = 36 cycles
module fpc_ml_dp_log(
  input logic clock,
  input logic resetn,
  input logic enable,   // not used!!
  input logic [63:0] dataa,
  output logic [63:0] result
);
  dp_log #(
    .roundconvert(1),
    .doublespeed(1),
    .device(1),
    .synthesize(1)
  )
  inst(
    .sysclk(clock),
    .reset(~resetn),
    .enable(1'b1),
    .signin(dataa[63]),
    .exponentin(dataa[62:52]),
    .mantissain(dataa[51:0]),
    .signout(result[63]),
    .exponentout(result[62:52]),
    .mantissaout(result[51:0]),
    .nanout(),
    .overflowout(),
    .zeroout()
  );
endmodule
