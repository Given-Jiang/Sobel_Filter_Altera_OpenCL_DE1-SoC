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
    


// One-to-many fanout adaptor. Ensures that fanouts
// see the right number of valid_outs under all stall conditions.
module acl_multi_fanout_adaptor #(
    parameter integer DATA_WIDTH = 32,  // >=0
    parameter integer NUM_FANOUTS = 2   // >0
)
(
    input logic clock,
    input logic resetn,

    // Upstream interface
    input logic [DATA_WIDTH-1:0] data_in,   // not used if DATA_WIDTH=0
    input logic valid_in,
    output logic stall_out,

    // Downstream interface
    output logic [DATA_WIDTH-1:0] data_out,    // not used if DATA_WIDTH=0
    output logic [NUM_FANOUTS-1:0] valid_out,
    input logic [NUM_FANOUTS-1:0] stall_in
);
    genvar i;
    logic [NUM_FANOUTS-1:0] consumed, true_stall_in;

    // A downstream interface is truly stalled only if it has not already consumed
    // the valid data.
    assign true_stall_in = stall_in & ~consumed;

    // Stall upstream if any downstream is stalling.
    assign stall_out = |true_stall_in;

    generate
        if( DATA_WIDTH > 0 )
            // Data out is just data in. Only valid if valid_out[i] is asserted.
            assign data_out = data_in;
    endgenerate

    // Downstream output is valid if input is valid and the data has not
    // already been consumed.
    assign valid_out = {NUM_FANOUTS{valid_in}} & ~consumed;

    // Consumed: a downstream interface has consumed its data if at least one
    // downstream interface is stalling but not itself. The consumed state is
    // only reset once all downstream interfaces have consumed their data.
    //
    // In the case where no downstream is stalling, the consumed bits are not
    // used.
    generate
        for( i = 0; i < NUM_FANOUTS; i = i + 1 )
        begin:c
            always @( posedge clock or negedge resetn )
                if( !resetn )
                    consumed[i] <= 1'b0;
                else if( valid_in & (|true_stall_in) )
                begin
                    // Valid data and there's at least one downstream interface
                    // stalling. Check if this interface is stalled...
                    if( ~stall_in[i] )
                        consumed[i] <= 1'b1;
                end
                else
                    consumed[i] <= 1'b0;
        end
    endgenerate
endmodule

