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
    


module acl_printf_buffer_address_generator
(
// Standard global signals
input clock,
input resetn,
input enable,

// Upstream interface
output o_stall,
input i_valid,
input i_predicate,
input [31:0] i_globalid0,
input [31:0] i_increment,

// Downstream interface
input i_stall,
output reg o_valid,
output reg [31:0] o_result,

// Avalon interface
output avm_read,
output avm_write,
output [5:0] avm_burstcount,
output [31:0] avm_address,
output [255:0] avm_writedata,
output [31:0] avm_byteenable,
input avm_waitrequest,
input [255:0] avm_readdata,
input avm_readdatavalid,
input avm_writeack
);

reg busy; // sent a request, waiting for response

wire predicated_read;
wire down_stall;

// stalled from down-stream when output is valid and stall is high
assign down_stall = ( o_valid & i_stall ); 

/**************
* AVM Signals *
**************/

// send a interconnect request if not stalled down-stream, not busy, nor predicated 
assign avm_read = ( i_valid & ~down_stall & ~busy & ~i_predicate); 
assign avm_address = i_increment;

assign avm_write = 1'b0;
assign avm_writedata = 256'b0;
assign avm_byteenable = 32'b1;
assign avm_burstcount = 1;

/****************
* Other signals *
****************/

// act on predicated inputs (o_valid is high next cycle, result does not matter)
// if not stalled down-stream, not busy and predicate is high
assign predicated_read = ( i_valid & ~down_stall & ~busy & i_predicate ); 

/*******************
* Valid/Stall Logic *
********************/

 always @( posedge clock or negedge resetn ) begin

   if( ~resetn ) begin
     o_valid <= 1'b0;
     busy <= 1'b0;
     o_result <= 32'dx;
   end
   else begin

     // busy when read signal is sent, not-busy after readdatavalid is received
     busy <= (busy & ~avm_readdatavalid) | (~busy & avm_read & ~avm_waitrequest);

     // dont change the output, if I get stalled by down-stream
     if( ~down_stall )
     begin     
       // readdatavalid stays high only one cycle
       o_valid <= avm_readdatavalid | predicated_read;

       if( predicated_read ) begin
         o_result <= 32'b0; // assign 0 so I can see change when debugging
       end
       else begin
         o_result <= avm_readdata[31:0];
       end
     end
   end
end

// stall up-stream if I get stalled by down-stream, or by the IC, or just busy servicing a request
assign o_stall = ( down_stall | ( avm_read & avm_waitrequest ) | busy );

endmodule
