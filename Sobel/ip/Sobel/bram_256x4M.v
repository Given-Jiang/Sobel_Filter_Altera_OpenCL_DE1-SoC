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
    


// Manually created global mem, to avoid qsys hex generation bug
//   qsys will always generate a .hex file to initialize the
//   altsyncram - EVEN if you specify not to init the ram,
//   for big ram's, this causes qsys to hang

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module bram_256x4M (
                       // inputs:
                        address,
                        byteenable,
                        chipselect,
                        clk,
                        clken,
                        reset,
                        write,
                        writedata,

                       // outputs:
                        readdata
                     )
;
parameter DEPTH  = 4194304;
parameter NWORDS_A = 4194304;
parameter ADDR_WIDTH = 22; // this should be $clog( DEPTH ), but qsys dies;

  output  [255: 0] readdata;
  // ADDR_WIDTH
  input   [ 21: 0] address;
  input   [ 31: 0] byteenable;
  input            chipselect;
  input            clk;
  input            clken;
  input            reset;
  input            write;
  input   [255: 0] writedata;

  reg     [255: 0] readdata;
  wire    [255: 0] readdata_ram;
  wire             wren;
  always @(posedge clk)
    begin
      if (clken)
          readdata <= readdata_ram;
    end


  assign wren = chipselect & write;
  //s1, which is an e_avalon_slave
  //s2, which is an e_avalon_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  altsyncram the_altsyncram
    (
      .address_a (address),
      .byteena_a (byteenable),
      .clock0 (clk),
      .clocken0 (clken),
      .data_a (writedata),
      .q_a (readdata_ram),
      .wren_a (wren)
    );

  defparam the_altsyncram.byte_size = 8,
           the_altsyncram.init_file = "UNUSED",
           the_altsyncram.lpm_type = "altsyncram",
           the_altsyncram.maximum_depth = DEPTH,
           the_altsyncram.numwords_a = NWORDS_A,
           the_altsyncram.operation_mode = "SINGLE_PORT",
           the_altsyncram.outdata_reg_a = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.read_during_write_mode_mixed_ports = "DONT_CARE",
           the_altsyncram.width_a = 256,
           the_altsyncram.width_byteena_a = 32,
           the_altsyncram.widthad_a = ADDR_WIDTH;


//////////////// END SIMULATION-ONLY CONTENTS

endmodule

