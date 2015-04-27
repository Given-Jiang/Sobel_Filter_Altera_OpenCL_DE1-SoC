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
    


// Generates global and local ids for given set of group ids.
// Need one of these for each kernel instance.

module acl_id_iterator
#(
  parameter WIDTH = 32    // width of all the counters
)

(
  input clock,
  input resetn,
  input start,
  
  // handshaking with work group dispatcher
  input valid_in,
  output stall_out,
  
  // handshaking with kernel instance
  input stall_in,
  output valid_out,
  
  // comes from group dispatcher
  input [WIDTH-1:0] group_id_in[2:0],
  input [WIDTH-1:0] global_id_base_in[2:0],
  
  // kernel parameters from the higher level
  input [WIDTH-1:0] local_size[2:0],
  input [WIDTH-1:0] global_size[2:0],
  
  // actual outputs
  output [WIDTH-1:0] local_id[2:0],
  output [WIDTH-1:0] global_id[2:0],
  output [WIDTH-1:0] group_id[2:0]
);

  // Storing group id vector and global id offsets vector.
  // Global id offsets help work item iterators calculate global
  // ids without using multipliers.
  localparam FIFO_WIDTH = 2 * 3 * WIDTH;
  localparam FIFO_DEPTH = 4;
  
  
  wire last_in_group;
  wire issue = valid_out & !stall_in;
  
  reg just_seen_last_in_group;
  wire [WIDTH-1:0] global_id_from_iter[2:0];
  reg [WIDTH-1:0] global_id_base[2:0];
  
  // takes one cycle for the work iterm iterator to register
  // global_id_base. During that cycle, just use global_id_base
  // directly.
  wire use_base = just_seen_last_in_group;
  assign global_id[0] = use_base ? global_id_base[0] : global_id_from_iter[0];
  assign global_id[1] = use_base ? global_id_base[1] : global_id_from_iter[1];
  assign global_id[2] = use_base ? global_id_base[2] : global_id_from_iter[2];
  
  // Group ids (and global id offsets) are stored in a fifo.
  acl_fifo #(
    .DATA_WIDTH(FIFO_WIDTH),
    .DEPTH(FIFO_DEPTH)
  ) group_id_fifo (
    .clock(clock),
    .resetn(resetn),
    .data_in ( {group_id_in[2], group_id_in[1], group_id_in[0], 
                global_id_base_in[2], global_id_base_in[1], global_id_base_in[0]} ),
    .data_out( {group_id[2], group_id[1], group_id[0], 
                global_id_base[2], global_id_base[1], global_id_base[0]} ),
    .valid_in(valid_in),
    .stall_out(stall_out),
    .valid_out(valid_out),
    .stall_in(!last_in_group | !issue)
  );
    
  
  acl_work_item_iterator #(
    .WIDTH(WIDTH)
  ) work_item_iterator (
    .clock(clock),
    .resetn(resetn),
    .start(start),
    .issue(issue),
    
    .local_size(local_size),
    .global_size(global_size),
    .global_id_base(global_id_base),
    
    .local_id(local_id),
    .global_id(global_id_from_iter),
    .last_in_group(last_in_group)
  );
  
  // goes high one cycle after last_in_group. stays high until
  // next cycle where 'issue' is high.
  always @(posedge clock or negedge resetn) begin
    if ( ~resetn )
      just_seen_last_in_group <= 1'b1;
    else if ( start )
      just_seen_last_in_group <= 1'b1;
    else if (last_in_group & issue)
      just_seen_last_in_group <= 1'b1;
    else if (issue)
      just_seen_last_in_group <= 1'b0;
    else
      just_seen_last_in_group <= just_seen_last_in_group;
  end
  
endmodule
