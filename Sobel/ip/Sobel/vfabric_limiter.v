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
    


module vfabric_limiter(clock, resetn, 
    i_datain, i_datain_valid, o_datain_stall, 
    i_return_data, i_return_valid, i_counter_reset, i_limiter_settings);
parameter DATA_WIDTH = 32;
parameter COUNTER_WIDTH = 16;
parameter MAX_NUM_LOCAL_MEM = 8;
parameter ENABLE_PROFILING = 0;

localparam NUM_LOCAL_MEM_BITS = $clog2(MAX_NUM_LOCAL_MEM);

  input clock, resetn;
  input [DATA_WIDTH-1:0] i_datain, i_return_data;
  input i_datain_valid, i_return_valid, i_counter_reset;
  output o_datain_stall;
  input [DATA_WIDTH-1:0] i_limiter_settings; 

  // control settings
  wire [COUNTER_WIDTH-1:0] limiter_capacity;
  wire check_lmem_counter;

  assign limiter_capacity = i_limiter_settings[COUNTER_WIDTH-1:0];
  assign check_lmem_counter = i_limiter_settings[COUNTER_WIDTH];
  
  // capacity counter implementation
  reg [COUNTER_WIDTH-1:0] capacity_counter; 
  wire cap_incr, cap_decr, reached_limiter_capacity;
  assign cap_incr = i_datain_valid & ~o_datain_stall;
  assign cap_decr = i_return_valid; 
  assign reached_limiter_capacity = (capacity_counter >= limiter_capacity);
  
  always@(posedge clock or negedge resetn)
  begin
    if(~resetn)
    begin
      capacity_counter <= {COUNTER_WIDTH{1'b0}};
    end
    else if (i_counter_reset)
    begin
      capacity_counter <= {COUNTER_WIDTH{1'b0}};
    end
    else
    begin
      capacity_counter <= capacity_counter + cap_incr - cap_decr;
    end
  end

  // implementing the individual local mem counters

  reg [MAX_NUM_LOCAL_MEM-1:0][COUNTER_WIDTH-1:0] lmem_counter;
  wire [MAX_NUM_LOCAL_MEM-1:0] lincr, ldecr, lmem_is_occupied;
  wire [NUM_LOCAL_MEM_BITS-1:0] lmem_to_incr, lmem_to_decr;
  reg [NUM_LOCAL_MEM_BITS-1:0] last_lmem_to_incr;

  // Currently the most significant bits are used as lmem group id  
  assign lmem_to_incr = i_datain[DATA_WIDTH-1:DATA_WIDTH-NUM_LOCAL_MEM_BITS];
  assign lmem_to_decr = i_return_data[DATA_WIDTH-1:DATA_WIDTH-NUM_LOCAL_MEM_BITS];

  assign lincr = (i_datain_valid & ~o_datain_stall) ? ({{MAX_NUM_LOCAL_MEM-1{1'b0}}, 1'b1} << lmem_to_incr) : {MAX_NUM_LOCAL_MEM{1'b0}};
  assign ldecr = i_return_valid ? ({{MAX_NUM_LOCAL_MEM-1{1'b0}}, 1'b1} << lmem_to_decr) : {MAX_NUM_LOCAL_MEM{1'b0}};

  always@(posedge clock or negedge resetn)
  begin
    if(~resetn)
    begin
      integer j;
      for (j=0; j< MAX_NUM_LOCAL_MEM; j=j+1)
      begin
        lmem_counter[j] <= {COUNTER_WIDTH{1'b0}};
      end
    end
    else if (i_counter_reset)
    begin
      integer j;
      for (j=0; j< MAX_NUM_LOCAL_MEM; j=j+1)
      begin
        lmem_counter[j] <= {COUNTER_WIDTH{1'b0}};
      end
    end
    else
    begin
      integer j;
      for (j=0; j< MAX_NUM_LOCAL_MEM; j=j+1)
      begin
        lmem_counter[j] <= lmem_counter[j] + {1'b0, lincr[j]} - {1'b0, ldecr[j]};
      end
    end
  end

  genvar n;
  generate
    for(n=0; n<MAX_NUM_LOCAL_MEM; n=n+1)
    begin : rlimit 
      assign lmem_is_occupied[n] = (lmem_counter[n] > {COUNTER_WIDTH{1'b0}});
    end
  endgenerate

  // keep track of the last group id that was issued, so we can test to make sure
  // that the lmem for the new wg is free
  always@(posedge clock or negedge resetn)
  begin
    if (~resetn) begin
      last_lmem_to_incr <= {NUM_LOCAL_MEM_BITS{1'b0}};
    end
    else if (i_counter_reset) begin
      last_lmem_to_incr <= {NUM_LOCAL_MEM_BITS{1'b0}};
    end
    else begin
      last_lmem_to_incr <= (i_datain_valid & ~o_datain_stall) ? lmem_to_incr : last_lmem_to_incr;
    end
  end

  // stall back when we have either reached the capacity, or if we are issueing a 
  // a new workgroup, its local memory is free to be used
  assign o_datain_stall = (check_lmem_counter & (lmem_to_incr != last_lmem_to_incr)) ? (lmem_is_occupied[lmem_to_incr] | reached_limiter_capacity) : reached_limiter_capacity;

generate 
if (ENABLE_PROFILING)
begin
  wire [127:0] pslimiter_probe;
  profile_sink #(.SINK_ID(64),.PROBE_WIDTH(128)) ps1 ( .probe( pslimiter_probe ));
  assign pslimiter_probe[31:0] = limiter_capacity;
  assign pslimiter_probe[63:32] = capacity_counter;
  assign pslimiter_probe[64] = cap_incr;
  assign pslimiter_probe[65] = cap_decr;
  assign pslimiter_probe[66] = reached_limiter_capacity;
  assign pslimiter_probe[67] = i_counter_reset;
  assign pslimiter_probe[68] = i_datain_valid;
  assign pslimiter_probe[69] = i_return_valid;
  assign pslimiter_probe[70] = o_datain_stall;
end
endgenerate

endmodule
