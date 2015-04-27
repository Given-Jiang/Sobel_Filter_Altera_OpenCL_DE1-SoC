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
//
//
//===----------------------------------------------------------------------===//

module acl_stall_monitor #(NODES=32) (
	input  clock,
	input  resetn,
	input  [NODES-1:0] valid,
	input  [NODES-1:0] stall_in,
	input  [NODES-1:0] stall_out,
  output [32*NODES-1:0] stall_count
);

reg  [31:0] stall_count_mem[NODES-1:0];

generate
genvar i;
  for (i=0; i<NODES; i=i+1)
  begin : node_gen
    always @(posedge clock or negedge resetn)
    begin
      if (~(resetn))
      begin
        stall_count_mem[i] <= 32'h0;
      end
      else 
      begin
        if ( valid[i] && stall_out[i] && !stall_in[i])
          stall_count_mem[i] <= stall_count_mem[i] + 2'h01;
      end
    end

    assign stall_count[i] = stall_count_mem[i];
  end
endgenerate


endmodule
