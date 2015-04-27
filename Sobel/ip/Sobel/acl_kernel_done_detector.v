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
    


// Listens to signals from a kernel to detect when
// all required items are processed.
module acl_kernel_done_detector
#(
  parameter WIDTH = 32       // width of all the counters
)
(
  input clock,
  input resetn,
  input start,         // Assert to restart the iterators

  // listen to kernel's stall/valid signals
  input kernel_stall_out,
  input kernel_valid_in,
  input kernel_stall_in,
  input kernel_valid_out,
  
  // high when it looks like the kernel is done
  // only is true if all the groups were also dispatched
  output kernel_done
);

  // counter for number of items inside the kernel
  reg [WIDTH-1:0] items_not_done;
  
  // Valid_in to kernel will go low when the fifo inside the acl_id_iterator
  // becomes empty. This means there is no more groups to dispatch.
  assign all_items_sent = ~kernel_valid_in & ~kernel_stall_out;
  assign kernel_done = (items_not_done == {WIDTH{1'b0}});

  always @(posedge clock or negedge resetn)
  begin
    if ( ~resetn )
      items_not_done <= {WIDTH{1'b0}};
      
    else if ( start )
      items_not_done <= {WIDTH{1'b0}};
      
    else begin
        if (kernel_valid_in & ~kernel_stall_out & (~kernel_valid_out | kernel_stall_in))
          items_not_done <= (items_not_done + 2'b01);    
        else
        if (kernel_valid_out & ~kernel_stall_in & (~kernel_valid_in | kernel_stall_out))
            items_not_done <= (items_not_done - 2'b01);  
    end
  end
  
endmodule



// Produces finish signal when all kernel copies are done.
module acl_all_done_detector
#(
  parameter NUM_COPIES = 1       // number of kernel instance copies
)
(
  input clock,
  input resetn,
  input start,
  
  input dispatched_all_groups,
  input [NUM_COPIES-1:0] kernel_done,
  
  output reg finish
);

  // Need to know if sent at least one work item into any of the kernel
  // copies (some kernel copies can never be used if don't have enough
  // work-groups). Allow upto 5 cycles for the effect of the first item
  // to propagate to kernel_done signals.
  localparam MAX_CYCLE_COUNTER_VALUE = 5;
  reg [3:0] cycles_since_sent_first_item;
  wire sent_first_item = (cycles_since_sent_first_item == MAX_CYCLE_COUNTER_VALUE);

  // used to bring down 'finish' after it being high for one cycle.
  reg not_finished;

  always @(posedge clock or negedge resetn)
  begin
    if ( ~resetn )
      finish <= 1'b0;
    else if ( start )
      finish <= 1'b0;
    else
      finish <= not_finished & 
                dispatched_all_groups &
                sent_first_item &
                (kernel_done == {NUM_COPIES{1'b1}});
  end


  always @(posedge clock or negedge resetn)
  begin
    if ( ~resetn )
      not_finished <= 1'b1;
    else if ( start )
      not_finished <= 1'b1;
    else if ( finish )
      not_finished <= 1'b0;
    else
      not_finished <= not_finished;
  end


  // Assuming that if dispatched all groups, sent at least one
  // item into at least one kernel.
  always @(posedge clock or negedge resetn)
  begin
    if ( ~resetn )
      cycles_since_sent_first_item <= 0;
    else if ( start )
      cycles_since_sent_first_item <= 0;
    else if ( cycles_since_sent_first_item == MAX_CYCLE_COUNTER_VALUE )
      cycles_since_sent_first_item <= MAX_CYCLE_COUNTER_VALUE;
    else if ( dispatched_all_groups | (cycles_since_sent_first_item > 0) )
      cycles_since_sent_first_item <= cycles_since_sent_first_item + 1;
  end

endmodule
