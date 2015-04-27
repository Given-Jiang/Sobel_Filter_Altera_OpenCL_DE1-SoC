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
    


//
// This module provides profiler support for the interface between a kernel
// system and the global memory interfaces provided by the board.  It instruments
// the Avalon-MM interface at the root of the interconnect to memory. Some signals
// are passed through from the Avalon interface to the profiler counters
// inside the kernel, such as readdatavalid.  Other signals are generated within
// this IP such as a signal asserted at the start of each burst request.
//
// A different instance of this IP is created for each kernel and each memory interface
// used by that kernel.  We only aggregate data when the enable signal is asserted.
// This allows the external memory stats to be correlated with the execution of specific kernels.

// Read bursts do not need to be tracked in detail - they are fire and forget with each read
// request starting a new burst.  Write bursts do need to be tracked in more detail.
// We need to find the start of each burst so that the burst size can be accumulated.
//

module acl_profiler_external_memory
#(
  parameter BURSTCOUNT_WIDTH=6
)
(
  input clk,
  input resetn,

  // Input signals from boundary between the memory interconnect and memory interface
  input [BURSTCOUNT_WIDTH-1:0] burstcount_in,
  input readdatavalid_in,
  input write_in,
  input read_in,
  input waitrequest_in,

  // Outputs to profiling infrastructure:
  // First two signals are single bit increment enables
  output reg read_count_enable_out,
  output reg write_count_enable_out,
  // Other two signals cause accumulation of burstcount values, so each contain two signals:
  // 1. Single bit increment enable
  // 2. Multi-bit burst value to increment by
  output reg read_burst_count_enable_out,
  output reg [BURSTCOUNT_WIDTH-1:0] read_burst_count_value_out,
  output reg write_burst_count_enable_out,
  output reg [BURSTCOUNT_WIDTH-1:0] write_burst_count_value_out,

  // Replicate the the incement enables for the burst counter.  Simplifies implementation in system integrator.
  output reg read_burst_count_dup_enable_out,
  output reg write_burst_count_dup_enable_out
);

  logic new_read_request, new_write_request, new_request;
  logic write_burst_in_progress;
  logic [BURSTCOUNT_WIDTH-1:0] r_burst_counter;

  logic read_burst_count_en;
  logic write_burst_count_en;
  assign read_burst_count_enable_out = read_burst_count_en;
  assign read_burst_count_dup_enable_out = read_burst_count_en;
  assign write_burst_count_enable_out = write_burst_count_en;
  assign write_burst_count_dup_enable_out = write_burst_count_en;

  assign new_read_request = read_in && !waitrequest_in;
  assign new_write_request = write_in && !waitrequest_in && !write_burst_in_progress;
  assign new_request = new_read_request || new_write_request;

  assign write_burst_in_progress = (r_burst_counter > 1);

  always@(posedge clk or negedge resetn)
  begin
    if (!resetn)
      begin
        read_count_enable_out <= '0;
        write_count_enable_out <= '0;
        read_burst_count_en <= '0;
        write_burst_count_en <= '0;
        read_burst_count_value_out <= '0;
        write_burst_count_value_out <= '0;
      end
    else
      begin
        // "valid data on bus" signals to rd/wr word count signals in profile infrastructure
        read_count_enable_out <= readdatavalid_in;
        write_count_enable_out <= write_in && !waitrequest_in;

        // Burstcount accumulation signals to the profile infrastructure
        read_burst_count_en<= read_in && new_request;
        write_burst_count_en<= write_in && new_request;
        read_burst_count_value_out <= burstcount_in;
        write_burst_count_value_out <= burstcount_in;
      end
  end

  // Counter that tracks where we are in a write burst transfer.  Lets us
  // pick out burst boundaries.
  always@(posedge clk or negedge resetn)
  begin
  if (!resetn)
    begin
      r_burst_counter <= 1;
    end
  else
    begin
      if (new_write_request)
        begin
          r_burst_counter <= burstcount_in;
        end
      else
        begin
          if (write_in && !waitrequest_in)
            begin
              r_burst_counter <= r_burst_counter - 1;
            end
        end
    end
  end

endmodule

