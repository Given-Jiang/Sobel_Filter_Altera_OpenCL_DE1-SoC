// Quick negation of single-precision floating-point number


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
    



module acl_fp_negate
#(
  // Bit width of a single precision float
  parameter WIDTH=32
)
(
  input  [WIDTH-1:0] data,
  output [WIDTH-1:0] result
);

// Negating the most-significant bit
assign result = { ~data[WIDTH-1], data[WIDTH-2:0] };

endmodule
