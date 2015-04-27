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
    



module acl_channel_fifo
#(
    // FIFO_DEPTH must be >=0
    parameter integer FIFO_DEPTH = 16,
    parameter integer DATA_W = 64,             // > 0
    parameter integer ADJUST_FOR_LATENCY = 0,
    parameter integer ACL_PROFILE=0,      // Set to 1 to enable profiling
    parameter integer FIFOSIZE_WIDTH=32,
    parameter integer ALMOST_FULL_VALUE=0
)
(
    input logic clock,
    input logic resetn,

    input logic                 avst_in_valid,
    input logic    [DATA_W-1:0] avst_in_data,
    output logic                avst_in_ready,
    output logic   [FIFOSIZE_WIDTH-1:0] profile_fifosize,

    input logic                 avst_out_ready,
    output logic   [DATA_W-1:0] avst_out_data,
    output logic                avst_out_valid,
    output logic                almost_full
);
    
    wire r_o_stall;
    wire r_o_valid;

    wire                avst_out_stall_wire;
    wire   [DATA_W-1:0] avst_out_data_wire;
    wire                avst_out_valid_wire;
    acl_staging_reg
    #(
	    .WIDTH(DATA_W)
    )
    asr( .clk( clock ), .reset( ~resetn ),
	    .i_data(  avst_out_data_wire ),
	    .i_valid( avst_out_valid_wire ),
	    .o_stall( avst_out_stall_wire ),
	    .i_stall( ~avst_out_ready ),
	    .o_data( avst_out_data ),
	    .o_valid( avst_out_valid )
	    );

    generate
    if (FIFO_DEPTH == 0)
    begin
        assign avst_out_data_wire = avst_in_data;
        assign avst_out_valid_wire = avst_in_valid;
        assign avst_in_ready = ~avst_out_stall_wire;
        assign almost_full = ~avst_in_ready;
    end
    else
    begin
        logic write;
        logic read;
        logic stall_out;
        logic valid_out;
        logic fifo_full;
        logic fifo_empty;

        assign write = avst_in_valid;
        assign read  = ~avst_out_stall_wire;

        assign avst_in_ready  = ~r_o_stall;

	// this code is dependent on the acl_data_fifo implementations,
	// and the latency of each data_fifo type.
	// Changing the fifo type improves performance, since it
	// balances the data fifo depth against the latency of the fifo.

        logic [DATA_W-1:0] dout;
        logic stall_in;

        // The adjusted depth is equal to the latency of the channel fifo and
        // the adjustment fifo. The adjustment is ll_reg (latency 1) and the
        // channel fifo is either ll_reg or sandwich (latency 5), hence the
        // values of 2 or 6 when it is used.
        localparam ADJUSTED_DEPTH = (ADJUST_FOR_LATENCY == 0) ? 0 : (FIFO_DEPTH == 1) ? 0 : (FIFO_DEPTH < 6) ? 2 : 6;
        localparam TYPE = (FIFO_DEPTH == 1) ? "zl_reg" : (FIFO_DEPTH <= 6 ? "ll_reg" : "sandwich");
        wire  [DATA_W-1:0] r_out_data;
        acl_data_fifo
        #(
            .DATA_WIDTH(DATA_W),
            .DEPTH(FIFO_DEPTH),
            .IMPL(TYPE),
            .ALLOW_FULL_WRITE(1),
            .ALMOST_FULL_VALUE(ALMOST_FULL_VALUE)
        )
        fifo
        (
            .clock     (clock),
            .resetn    (resetn), 
            .data_in   ( r_out_data ),
            .valid_in  ( r_o_valid ),
            .stall_out (stall_out),
            .data_out  (dout),
            .stall_in  (stall_in),
            .valid_out (valid_out),
            .empty     (fifo_empty),
            .full      (fifo_full),
            .almost_full(almost_full)
        );
        if (ADJUSTED_DEPTH > 0) begin
          logic latency_fifo_empty;
          logic latency_fifo_full;

          acl_data_fifo
          #(
            .DATA_WIDTH(DATA_W),
            .DEPTH(ADJUSTED_DEPTH),
            .IMPL("ll_reg"),
            .ALLOW_FULL_WRITE(1)
          )
          latency_adjusted_fifo
          (
            .clock     (clock),
            .resetn    (resetn),
            .data_in   (dout),
            .valid_in  (valid_out),
            .stall_out (stall_in),
            .data_out  (avst_out_data_wire),
            .stall_in  (~read),
            .valid_out (avst_out_valid_wire),
            .empty     (latency_fifo_empty),
            .full      (latency_fifo_full)
          );
        end else begin
          assign avst_out_data_wire = dout;
          assign stall_in = ~read;
          assign avst_out_valid_wire = valid_out;
        end

        assign r_out_data = avst_in_data;
        assign r_o_valid = write;
        assign r_o_stall = stall_out;
    end
    endgenerate

    // Profiler support - keep track of FIFO size
    generate
    if(ACL_PROFILE==1) begin
        wire inc_in;
        wire inc_out;
        reg [FIFOSIZE_WIDTH-1:0] fifosize;

        assign inc_in = ( avst_in_valid & avst_in_ready );
        assign inc_out= ( avst_out_valid & avst_out_ready );

        always@(posedge clock or negedge resetn)
        begin
            if ( !resetn ) begin
               fifosize <= { FIFOSIZE_WIDTH{1'b0} };
            end
            else begin
               if( inc_in & ~inc_out ) begin
                   fifosize <= fifosize + 1;
               end
               else if( ~inc_in & inc_out ) begin
                   fifosize <= fifosize - 1;
               end
            end
        end

        assign profile_fifosize = fifosize;
    end
    else begin
        assign profile_fifosize = { FIFOSIZE_WIDTH{1'b0} };
    end
    endgenerate

endmodule
