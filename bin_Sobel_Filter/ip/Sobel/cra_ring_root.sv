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
    


module cra_ring_root #(
  parameter integer ADDR_W = 32,
  parameter integer DATA_W = 32,
  parameter integer ID_W = 3
)
(
  // clock/reset
  input logic clk,
  input logic rst_n,

  // avalon-slave port
  input logic avs_read,
  input logic avs_write,
  input logic [ADDR_W+ID_W-1:0] avs_addr,
  input logic [DATA_W/8-1:0] avs_byteena,
  input logic [DATA_W-1:0] avs_writedata,
  output logic [DATA_W-1:0] avs_readdata,
  output logic avs_readdatavalid,
  output logic avs_waitrequest,

  // ring-in
  input logic ri_read,
  input logic ri_write,
  input logic [ADDR_W+ID_W-1:0] ri_addr,
  input logic [DATA_W-1:0] ri_data,
  input logic [DATA_W/8-1:0] ri_byteena,
  input logic ri_datavalid,
  output logic ri_waitrequest,
  
  // ring-out
  output logic ro_read,
  output logic ro_write,
  output logic [ADDR_W+ID_W-1:0] ro_addr,
  output logic [DATA_W-1:0] ro_data,
  output logic [DATA_W/8-1:0] ro_byteena,
  output logic ro_datavalid,
  input  logic ro_waitrequest
);

// case:199865 (scheduled for clean-up in case:200564): ISR concurrent to the
// main thread may issue a request immediately following a read.  The CRA ring
// is not latency balanced so this can lead to a conflict on the shared data
// bus.  Quick fix: each read blocks until the response is sent back.
logic pending;
always@(posedge clk or negedge rst_n) begin
  if(rst_n == 1'b0) begin
    pending <= 1'b0;
  end else begin
    pending <= pending ? (!ri_datavalid) : (avs_read && !avs_waitrequest);
  end
end

// The avalon slave connection
always@(posedge clk or negedge rst_n) begin
  if(rst_n == 1'b0) begin
    avs_readdatavalid <= 1'b0;
    avs_readdata <= 'x;
  end else begin
    avs_readdatavalid <= ri_datavalid;
    avs_readdata <= ri_data;
  end
end

// Backpressure should get swept away except in the profiler flow
assign avs_waitrequest = ro_waitrequest | pending;
assign ri_waitrequest = 1'b0;

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
    ro_read <= avs_read && !avs_waitrequest;
    ro_write <= avs_write && !avs_waitrequest;
    ro_addr <= avs_addr;
    ro_data <= avs_writedata;
    ro_byteena <= avs_byteena;
    ro_datavalid <= 1'b0;
  end
end
endmodule
