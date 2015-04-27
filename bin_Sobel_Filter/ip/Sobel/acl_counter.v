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
    


module acl_counter
(
    enable, clock, resetn,
    i_init,
    i_limit,
    i_increment,
    i_counter_reset,
    o_size,
    o_resultvalid,
    o_result,
    o_full,
    o_stall
);

/*************
* Parameters *
*************/

// default parameters if host does not specify them
parameter INIT=0;            // counter reset value
parameter LIMIT=65536;       // counter limit (this value should not be higher
                             // than the buffer size allocated by the host)

/********
* Ports *
********/

// Standard global signals
input logic clock;
input logic resetn;
input logic enable;
input logic [31:0] i_init;
input logic [31:0] i_limit;
input logic i_counter_reset; // reset signal from host

// operand and result
input logic [31:0] i_increment; 

output logic [31:0] o_size; 
output logic o_resultvalid;
output logic [31:0] o_result;

// raised high for one cycle to interrupt the host when the buffer is full
output logic o_full;
// stall signal, kept high until reset is received
output logic o_stall;

// register to store next buffer address
reg [31:0] counter;

assign o_size = counter;

always@(posedge clock or negedge resetn)
begin

   if ( !resetn ) begin
     o_resultvalid <= 1'b0;
     counter <= 32'b0;
     o_result <= 32'b0;
     o_full <=  1'b0;
     o_stall <= 1'b0;
   end
   else if( i_counter_reset ) begin
     // reset the signals
     // there is definitely a request waiting, we will not receive the request again
     // so, send the response
     o_resultvalid <= 1'b1;
     counter <= i_increment;
     o_result <= i_init;
     o_stall <= 1'b0;
   end
   else if( o_full ) begin
     // stall pipeline signal was raised in previous cycle
     // clear it so we dont stall again
     o_full <= 1'b0;
   end
   // stall until the internal full signal is cleared
   else if( ~o_stall ) begin

     if  (enable) begin
     
       // raise the full&stall signal only when there is a new request
       if( (counter != 32'b0) && (counter == i_limit) ) begin
         o_full <= 1'b1;
         o_stall <= 1'b1;
         o_resultvalid <= 1'b0;
       end
       else begin
         o_result <= i_init + counter;
         o_resultvalid <= 1'b1;
         counter <= counter + i_increment;
       end
     end
     else begin
       o_resultvalid <= 1'b0;
     end

   end

end

endmodule
