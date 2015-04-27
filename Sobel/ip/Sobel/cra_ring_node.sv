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
    


module cra_ring_node #(
  parameter integer RING_ADDR_W = 32,
  parameter integer CRA_ADDR_W = 32,
  parameter integer DATA_W = 32,
  parameter integer ID_W = 3,
  parameter logic[ID_W-1:0] ID = 3'd0
)
(
  // clock/reset
  input logic clk,
  input logic rst_n,

  // avalon-master port
  output logic avm_read,
  output logic avm_write,
  output logic [CRA_ADDR_W-1:0] avm_addr,
  output logic [DATA_W/8-1:0] avm_byteena,
  output logic [DATA_W-1:0] avm_writedata,
  input logic [DATA_W-1:0] avm_readdata,
  input logic avm_readdatavalid,
  input logic avm_waitrequest,

  // ring-in
  input logic ri_read,
  input logic ri_write,
  input logic [RING_ADDR_W+ID_W-1:0] ri_addr,
  input logic [DATA_W-1:0] ri_data,
  input logic [DATA_W/8-1:0] ri_byteena,
  input logic ri_datavalid,
  output logic ri_waitrequest,
  
  // ring-out
  output logic ro_read,
  output logic ro_write,
  output logic [RING_ADDR_W+ID_W-1:0] ro_addr,
  output logic [DATA_W-1:0] ro_data,
  output logic [DATA_W/8-1:0] ro_byteena,
  output logic ro_datavalid,
  input  logic ro_waitrequest
);

// The avalon master connection
logic id_match;
generate if(ID_W == 0)
  assign id_match = 1'b1;
else
  assign id_match = (ri_addr[RING_ADDR_W+ID_W-1:RING_ADDR_W] == ID);
endgenerate
always@(posedge clk or negedge rst_n) begin
  if(rst_n == 1'b0) begin
    avm_read <= 1'b0;
    avm_write <= 1'b0;
    avm_addr <= 'x;
    avm_byteena <= 'x;
    avm_writedata <= 'x;
  end else begin
    avm_read <= ri_read && id_match;
    avm_write <= ri_write && id_match;
    avm_addr <= ri_addr[CRA_ADDR_W-1:0]; // Throw away upper address bits
    avm_byteena <= ri_byteena;
    avm_writedata <= ri_data;
  end
end

// Backpressure should get swept away except in the profiler flow
assign ri_waitrequest = ro_waitrequest | avm_waitrequest;

// The ring output
always@(posedge clk or negedge rst_n) begin
  if(rst_n == 1'b0) begin
    ro_read <= 1'b0;
    ro_write <= 1'b0;
    ro_datavalid <= 1'b0;
    ro_addr <= 'x;
    ro_data <= 'x;
    ro_byteena <= 'x;
  end else begin
    ro_read <= ri_read && !id_match;
    ro_write <= ri_write && !id_match;
    ro_addr <= ri_addr;
    ro_data <= avm_readdatavalid ? avm_readdata : ri_data;
    ro_byteena <= ri_byteena;
    ro_datavalid <= avm_readdatavalid | ri_datavalid;
  end
end
endmodule

