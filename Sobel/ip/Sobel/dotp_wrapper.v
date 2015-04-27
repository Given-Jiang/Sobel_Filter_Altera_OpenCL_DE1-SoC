// (C) 1992-2012 Altera Corporation. All rights reserved.                         
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
    

module dotp_wrapper (
	clock,
	resetn,
	valid_in,
	stall_in,
        valid_out,
	stall_out,
        a0, a1, a2, a3,
        b0, b1, b2, b3,
        result
);

input clock;
input resetn;
input valid_in;
input stall_in;
output valid_out;
output stall_out;

input [511:0] a0;
input [511:0] a1;
input [511:0] a2;
input [511:0] a3;
input [511:0] b0;
input [511:0] b1;
input [511:0] b2;
input [511:0] b3;

output [31:0] result;

wire input_accepted;
wire output_accepted;

assign input_accepted = valid_in & ~stall_out;
assign output_accepted = valid_out & ~stall_in;

reg [7:0] occ_counter; 

wire [31:0] core_result;
wire core_valid;

assign stall_out = occ_counter[6];

   always @(posedge clock or negedge resetn)
   begin
    if (~(resetn))
    begin
       occ_counter <= 8'b0;
    end
    else 
    begin
       occ_counter <= occ_counter + input_accepted - output_accepted;
    end
  end

  dotp_core dot_product (
      .clock(clock),
      .resetn(resetn),
      .valid_in(input_accepted),
      .a0(a0), .a1(a1), .a2(a2), .a3(a3),
      .b0(b0), .b1(b1), .b2(b2), .b3(b3),
      .result(core_result),
      .valid_out(core_valid));
 
  acl_fifo #(
    .DATA_WIDTH(32),
    .DEPTH(64)
  ) collection_fifo (
    .clock(clock),
    .resetn(resetn),
    .data_in( core_result ),
    .data_out( result ),
    .valid_in( core_valid ),
    .valid_out( valid_out ),
    .stall_in( stall_in ),
    .stall_out( )
  );
endmodule
