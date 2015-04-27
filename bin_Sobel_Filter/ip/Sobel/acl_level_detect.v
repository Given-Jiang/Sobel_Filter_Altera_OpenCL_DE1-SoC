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
    


/********
* This module captures the relative frequency with which each bit in 'value'
* is high. 
*
* The counters that track the rates automatically get divided by 2 once any of
* their values comes close to overflowing.  Hence the rates are relative, and
* comparable only within a single module instance.
*
* The last counter (count[WIDTH]) is a saturating counter storing the number
* of times a scaledown was performed.  If you assume the relative rates don't
* change between scaledowns, this can be used to approximate absolute rates
* (which can be compared against rates from another instance).
*****************/

module acl_level_detect
#(
  parameter WIDTH=13,          // Width of input signal in bits
  parameter COUNTERWIDTH=10    // in bits, MUST be greater than 3
)
(
  input  logic clk,
  input  logic resetn,

  input  logic                    valid,
  input  logic [WIDTH-1:0]        value,
  output logic [COUNTERWIDTH-1:0] count[WIDTH+1]
);

  /******************
  * LOCAL PARAMETERS
  *******************/

  /******************
  * SIGNALS
  *******************/
  logic [WIDTH-1:0] last_value;
  logic scaledown;

  /******************
  * ARCHITECTURE
  *******************/

  always@(posedge clk or negedge resetn)
    if (!resetn)
      last_value <= {WIDTH{1'b0}};
    else if (valid)
      last_value <= value;
    else
      last_value <= {WIDTH{1'b0}};

  // Create one counter for each bit in value.  Increment the respective
  // counter if that bit is high.
  genvar i;
  generate
    for (i = 0; i < WIDTH; i = i + 1)
    begin:counters
      always@(posedge clk or negedge resetn)
        if (!resetn)
          count[i] <= {COUNTERWIDTH{1'b0}};
        else if (last_value[i] && scaledown)
          count[i] <= (count[i] + 2'b1) >> 1;
        else if (last_value[i])
          count[i] <= count[i] + 2'b1;
        else if (scaledown)
          count[i] <= count[i] >> 1;
    end
  endgenerate

  // Count total number of times scaled down - saturating counter
  // This can be used to approximate absolute rates
  always@(posedge clk or negedge resetn)
    if (!resetn)
      count[WIDTH] <= 1'b0;
    else if (scaledown && count[WIDTH]!={COUNTERWIDTH{1'b1}})
      count[WIDTH] <= count[WIDTH] + 2'b1;

  // If any counter value's top 3 bits are 1s, scale down all counter values
  integer j;
  always@(posedge clk or negedge resetn)
    if (!resetn)
      scaledown <= 1'b0;
    else if (scaledown)
      scaledown <= 1'b0;
    else
      for (j = 0; j < WIDTH; j = j + 1)
        if (&count[j][COUNTERWIDTH-1:COUNTERWIDTH-3])
          scaledown <= 1'b1;


endmodule
