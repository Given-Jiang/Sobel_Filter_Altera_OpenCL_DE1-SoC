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
// Top level load/store unit
//
// Attributes of load/store units
//  Coalesced:  Accesses to neighbouring memory locations are grouped together
//              to improve efficiency and efficiently utilize memory bandwidth.
//  Hazard-Safe:The LSU is not susceptable to data hazards.
//  Ordered:    The LSU requires accesses to be in-order to properly coalesce.
//  Pipeline:   The LSU can handle multiple requests at a time without
//              stalling.  Improves throughput.
//
// Supports the following memory access patterns:
//  Simple    - STYLE="SIMPLE"
//              Coalesced: No, Ordered: N/A, Hazard-Safe: Yes, Pipelined, No
//              Simple un-pipelined memory access.  Low throughput.
//  Pipelined - STYLE="PIPELINED"
//              Coalesced: No, Ordered: N/A, Hazard-Safe: Yes, Pipelined: Yes
//              Requests are submitted as soon as they are received.
//              Pipelined access to memory so multiple requests can be 
//              in flight at a time.
//  Coalesced - STYLE="BASIC-COALESCED"
//   "basic"    Coalesced: Yes, Ordered: Yes, Hazard-Safe: Yes, Pipelined: Yes
//              Requests are submitted as soon as possible to memory, stalled
//              requests are coalesced with neighbouring requests if they
//              access the same page of memory.
//  Coalesced - STYLE="BURST-COALESCED"
//   "burst"    Coalesced: Yes, Ordered: Yes, Hazard-Safe: Yes, Pipelined: Yes
//              Requests are buffered until the biggest possible burst can
//              be made.
//  Streaming - STYLE="STREAMING"
//              Coalesced: Yes, Ordered: Yes, Hazard-Safe: No, Pipelined: ?
//              A FIFO is instantiated which burst reads large blocks from 
//              memory to keep the FIFO full of valid data.  This block can 
//              only be used if accesses are in-order, and addresses can be
//              simply calculated from (base_address + n * word_width).  The
//              block has no built-in hazard protection.
//  Atomic - STYLE="ATOMIC-PIPELINED"
//"pipelined"
//              Coalesced: No, Ordered: N/A, Hazard-Safe: Yes, Pipelined: Yes
//              Atomic: Yes
//              Requests are submitted as soon as they are received.
//              Pipelined access to memory so multiple requests can be 
//              in flight at a time.
//              Response is returned as soon as read is complete, 
//              write is issued subsequently by the atomic module at the end
//              of arbitration.

module lsu_top
(
    clock, clock2x, resetn, stream_base_addr, stream_size, stream_reset, i_atomic_op, o_stall, 
    i_valid, i_address, i_writedata, i_cmpdata, i_predicate, i_bitwiseor, i_stall, o_valid, o_readdata, avm_address, 
    avm_read, avm_readdata, avm_write, avm_writeack, avm_writedata, avm_byteenable, 
    avm_waitrequest, avm_readdatavalid, avm_burstcount,
    o_active,
    o_input_fifo_depth,
    o_writeack,
    i_byteenable,
    flush,

    // profile signals
    profile_bw, profile_bw_incr,
    profile_total_ivalid,
    profile_total_req,
    profile_i_stall_count,
    profile_o_stall_count,
    profile_avm_readwrite_count,
    profile_avm_burstcount_total, profile_avm_burstcount_total_incr,
    profile_req_cache_hit_count,
    profile_extra_unaligned_reqs,
    profile_avm_stall
);

/*************
* Parameters *
*************/
parameter STYLE="PIPELINED"; // The LSU style to use (see style list above)
parameter AWIDTH=32;         // Address width (32-bits for Avalon)
parameter ATOMIC_WIDTH=6;    // Width of operation operation indices
parameter WIDTH_BYTES=4;     // Width of the request (bytes)
parameter MWIDTH_BYTES=32;   // Width of the global memory bus (bytes)
parameter WRITEDATAWIDTH_BYTES=32;  // Width of the readdata/writedata signals, 
                                    // may be larger than MWIDTH_BYTES for atomics
parameter ALIGNMENT_BYTES=2; // Request address alignment (bytes)
parameter READ=1;            // Read or write?
parameter ATOMIC=0;          // Atomic?
parameter BURSTCOUNT_WIDTH=6;// Determines max burst size
// Why two latencies? E.g. A streaming unit prefetches data, its latency to
// the kernel is very low because data is for the most part ready and waiting.
// But the lsu needs to know how much data to buffer to hide the latency to
// memory, hence the memory side latency.
parameter KERNEL_SIDE_MEM_LATENCY=1;  // Effective Latency in cycles as seen by the kernel pipeline
parameter MEMORY_SIDE_MEM_LATENCY=1;  // Latency in cycles between LSU and memory
parameter USE_WRITE_ACK=0;   // Enable the write-acknowledge signal
parameter USECACHING=0;
parameter USE_BYTE_EN=0;
parameter CACHESIZE=1024;
parameter PROFILE_ADDR_TOGGLE=0;
parameter USEINPUTFIFO=1;        // FIXME specific to lsu_pipelined
parameter USEOUTPUTFIFO=1;       // FIXME specific to lsu_pipelined
parameter FORCE_NOP_SUPPORT=0;   // Stall free pipeline doesn't want the NOP fifo
parameter HIGH_FMAX=1;       // Enable optimizations for high Fmax

// Profiling
parameter ACL_PROFILE=0;      // Set to 1 to enable stall/valid profiling
parameter ACL_PROFILE_INCREMENT_WIDTH=32;

// Verilog readability and parsing only - no functional purpose
parameter ADDRSPACE=0;

// Local memory parameters
parameter ENABLE_BANKED_MEMORY=0;// Flag enables address permutation for banked local memory config
parameter ABITS_PER_LMEM_BANK=0; // Used when permuting lmem address bits to stride across banks
parameter NUMBER_BANKS=1;        // Number of memory banks - used in address permutation (1-disable)
parameter LMEM_ADDR_PERMUTATION_STYLE=0; // Type of address permutation (currently unused)
// The following localparams have if conditions, and the second is named
// "HACKED..." because address bit permutations are controlled by the
// ENABLE_BANKED_MEMORY parameter.  The issue is that this forms the select
// input of a MUX (if statement), and synthesis evaluates both inputs.
// When not using banked memory, the bit select ranges don't make sense on
// the input that isn't used, so we need to hack them in the non-banked case
// to get through ModelSim and Quartus.
localparam BANK_SELECT_BITS = (ENABLE_BANKED_MEMORY==1) ? $clog2(NUMBER_BANKS) : 1; // Bank select bits in address permutation
localparam HACKED_ABITS_PER_LMEM_BANK = (ENABLE_BANKED_MEMORY==1) ? ABITS_PER_LMEM_BANK : $clog2(MWIDTH_BYTES)+1;

// Parameter limitations:
//    AWIDTH: Only tested with 32-bit addresses
//    WIDTH_BYTES: Must be a power of two
//    MWIDTH_BYTES: Must be a power of 2 >= WIDTH_BYTES
//    ALIGNMENT_BYTES: Must be a power of 2 satisfying,
//                     WIDTH_BYTES <= ALIGNMENT_BYTES <= MWIDTH_BYTES
//
//    The width and alignment restrictions ensure we never try to read a word
//    that strides across two "pages" (MWIDTH sized words)

// TODO: Convert these back into localparams when the back-end supports it
parameter WIDTH=8*WIDTH_BYTES;                      // Width in bits
parameter MWIDTH=8*MWIDTH_BYTES;                    // Width in bits
parameter WRITEDATAWIDTH=8*WRITEDATAWIDTH_BYTES;              // Width in bits
localparam ALIGNMENT_ABITS=$clog2(ALIGNMENT_BYTES); // Address bits to ignore
localparam LSU_CAPACITY=256;   // Maximum number of 'in-flight' load/store operations

localparam WIDE_LSU = (WIDTH > MWIDTH); 
// Performance monitor signals
parameter INPUTFIFO_USEDW_MAXBITS=8;

// LSU unit properties
localparam ATOMIC_PIPELINED_LSU=(STYLE=="ATOMIC-PIPELINED");
localparam PIPELINED_LSU=( (STYLE=="PIPELINED") || (STYLE=="BASIC-COALESCED") || (STYLE=="BURST-COALESCED") || (STYLE=="BURST-NON-ALIGNED") );
localparam SUPPORTS_NOP= (STYLE=="STREAMING") || (STYLE=="SEMI-STREAMING") || (STYLE=="BURST-NON-ALIGNED") || (STYLE=="BURST-COALESCED") ||  (FORCE_NOP_SUPPORT==1);
localparam SUPPORTS_BURSTS=( (STYLE=="STREAMING") || (STYLE=="BURST-COALESCED") || (STYLE=="SEMI-STREAMING") || (STYLE=="BURST-NON-ALIGNED") );

/********
* Ports *
********/
// Standard global signals
input clock;
input clock2x;
input resetn;
input flush;

// Streaming interface signals
input [AWIDTH-1:0] stream_base_addr;
input [31:0] stream_size;
input stream_reset;

// Atomic interface
input [WIDTH-1:0] i_cmpdata; // only used by atomic_cmpxchg
input [ATOMIC_WIDTH-1:0] i_atomic_op;

// Upstream interface
output o_stall;
input i_valid;
input [AWIDTH-1:0] i_address;
input [WIDTH-1:0] i_writedata;
input i_predicate;
input [AWIDTH-1:0] i_bitwiseor;
input [WIDTH_BYTES-1:0] i_byteenable;

// Downstream interface
input i_stall;
output o_valid;
output [WIDTH-1:0] o_readdata;

// Avalon interface
output [AWIDTH-1:0] avm_address;
output avm_read;
input [WRITEDATAWIDTH-1:0] avm_readdata;
output avm_write;
input avm_writeack;
output o_writeack;
output [WRITEDATAWIDTH-1:0] avm_writedata;
output [WRITEDATAWIDTH_BYTES-1:0] avm_byteenable;
input avm_waitrequest;
input avm_readdatavalid;
output [BURSTCOUNT_WIDTH-1:0] avm_burstcount;

output reg o_active;

// For profiling/performance monitor
output [INPUTFIFO_USEDW_MAXBITS-1:0] o_input_fifo_depth;

// Profiler Signals
output logic profile_bw;
output logic [ACL_PROFILE_INCREMENT_WIDTH-1:0] profile_bw_incr;
output logic profile_total_ivalid;
output logic profile_total_req;
output logic profile_i_stall_count;
output logic profile_o_stall_count;
output logic profile_avm_readwrite_count;
output logic profile_avm_burstcount_total;
output logic [ACL_PROFILE_INCREMENT_WIDTH-1:0] profile_avm_burstcount_total_incr;
output logic profile_req_cache_hit_count;
output logic profile_extra_unaligned_reqs;
output logic profile_avm_stall;

// help timing; reduce the high fanout of global reset from iface
reg [1:0]     sync_rstn_MS /* synthesis syn_preserve = 1 */ ;
wire          sync_rstn;
assign sync_rstn = sync_rstn_MS[1];

always @(posedge clock or negedge resetn) begin
  if(!resetn) sync_rstn_MS <= 2'b00;
  else sync_rstn_MS <= {sync_rstn_MS[0], 1'b1};
end


generate
if(WIDE_LSU) begin
  //break transaction into multiple cycles
  lsu_wide_wrapper lsu_wide (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(sync_rstn),
	.flush(flush),
	.stream_base_addr(stream_base_addr),
	.stream_size(stream_size),
	.stream_reset(stream_reset),
	.o_stall(o_stall),
	.i_valid(i_valid),
	.i_address(i_address),
	.i_writedata(i_writedata),
	.i_cmpdata(i_cmpdata),
	.i_predicate(i_predicate),
	.i_bitwiseor(i_bitwiseor),
	.i_byteenable(i_byteenable),
	.i_stall(i_stall),
	.o_valid(o_valid),
	.o_readdata(o_readdata),
	.o_input_fifo_depth(o_input_fifo_depth),
	.o_writeack(o_writeack),
	.i_atomic_op(i_atomic_op),
	.o_active(o_active),
	.avm_address(avm_address),
	.avm_read(avm_read),
	.avm_readdata(avm_readdata),
	.avm_write(avm_write),
	.avm_writeack(avm_writeack),
	.avm_burstcount(avm_burstcount),
	.avm_writedata(avm_writedata),
	.avm_byteenable(avm_byteenable),
	.avm_waitrequest(avm_waitrequest),
	.avm_readdatavalid(avm_readdatavalid),
	.profile_req_cache_hit_count(profile_req_cache_hit_count),
	.profile_extra_unaligned_reqs(profile_extra_unaligned_reqs)
);

  defparam lsu_wide.STYLE = STYLE;
  defparam lsu_wide.AWIDTH = AWIDTH;
  defparam lsu_wide.ATOMIC_WIDTH = ATOMIC_WIDTH;
  defparam lsu_wide.WIDTH_BYTES = WIDTH_BYTES;
  defparam lsu_wide.MWIDTH_BYTES = MWIDTH_BYTES;
  defparam lsu_wide.WRITEDATAWIDTH_BYTES = WRITEDATAWIDTH_BYTES;
  defparam lsu_wide.ALIGNMENT_BYTES = ALIGNMENT_BYTES;
  defparam lsu_wide.READ = READ;
  defparam lsu_wide.ATOMIC = ATOMIC;
  defparam lsu_wide.BURSTCOUNT_WIDTH = BURSTCOUNT_WIDTH;
  defparam lsu_wide.KERNEL_SIDE_MEM_LATENCY = KERNEL_SIDE_MEM_LATENCY;
  defparam lsu_wide.MEMORY_SIDE_MEM_LATENCY = MEMORY_SIDE_MEM_LATENCY;
  defparam lsu_wide.USE_WRITE_ACK = USE_WRITE_ACK;
  defparam lsu_wide.USECACHING = USECACHING;
  defparam lsu_wide.USE_BYTE_EN = USE_BYTE_EN;
  defparam lsu_wide.CACHESIZE = CACHESIZE;
  defparam lsu_wide.PROFILE_ADDR_TOGGLE = PROFILE_ADDR_TOGGLE;
  defparam lsu_wide.USEINPUTFIFO = USEINPUTFIFO;
  defparam lsu_wide.USEOUTPUTFIFO = USEOUTPUTFIFO;
  defparam lsu_wide.FORCE_NOP_SUPPORT = FORCE_NOP_SUPPORT;
  defparam lsu_wide.HIGH_FMAX = HIGH_FMAX;
  defparam lsu_wide.ACL_PROFILE = ACL_PROFILE;
  defparam lsu_wide.ACL_PROFILE_INCREMENT_WIDTH = ACL_PROFILE_INCREMENT_WIDTH;
  defparam lsu_wide.ENABLE_BANKED_MEMORY = ENABLE_BANKED_MEMORY;
  defparam lsu_wide.ABITS_PER_LMEM_BANK = ABITS_PER_LMEM_BANK;
  defparam lsu_wide.NUMBER_BANKS = NUMBER_BANKS;
  defparam lsu_wide.WIDTH = WIDTH;
  defparam lsu_wide.MWIDTH = MWIDTH;  
  defparam lsu_wide.WRITEDATAWIDTH = WRITEDATAWIDTH;
  defparam lsu_wide.INPUTFIFO_USEDW_MAXBITS = INPUTFIFO_USEDW_MAXBITS;
  defparam lsu_wide.LMEM_ADDR_PERMUTATION_STYLE = LMEM_ADDR_PERMUTATION_STYLE;
  defparam lsu_wide.ADDRSPACE = ADDRSPACE;
  
  //the wrapped LSU doesnt interface directly with the avalon master, so profiling here is more accurate for avm signals
  //two signals generated directly by the LSU need to be passed in
  if(ACL_PROFILE==1)
  begin

   // keep track of write bursts
   reg [BURSTCOUNT_WIDTH-1:0] profile_remaining_writeburst_count;
   wire active_write_burst;
   assign active_write_burst = (profile_remaining_writeburst_count != {BURSTCOUNT_WIDTH{1'b0}});
   always@(posedge clock or negedge sync_rstn)
     if (!sync_rstn)
        profile_remaining_writeburst_count <= {BURSTCOUNT_WIDTH{1'b0}};
     else if(avm_write & ~avm_waitrequest & ~active_write_burst)
        // start of a new write burst
        profile_remaining_writeburst_count <= avm_burstcount - 1;
     else if(~avm_waitrequest & active_write_burst)
        // count down one burst
        profile_remaining_writeburst_count <= profile_remaining_writeburst_count - 1;      

     assign profile_bw = (READ==1) ? avm_readdatavalid : (avm_write & ~avm_waitrequest);
     assign profile_bw_incr = MWIDTH_BYTES;
     assign profile_total_ivalid = (i_valid & ~o_stall);
     assign profile_total_req = (i_valid & ~i_predicate & ~o_stall);
     assign profile_i_stall_count = (i_stall & o_valid);
     assign profile_o_stall_count = (o_stall & i_valid);
     assign profile_avm_readwrite_count = ((avm_read | avm_write) & ~avm_waitrequest & ~active_write_burst);
     assign profile_avm_burstcount_total = ((avm_read | avm_write) & ~avm_waitrequest & ~active_write_burst);
     assign profile_avm_burstcount_total_incr = avm_burstcount;
     assign profile_avm_stall = ((avm_read | avm_write) & avm_waitrequest);

  end
  else begin
     assign profile_bw = 1'b0;
     assign profile_bw_incr = {ACL_PROFILE_INCREMENT_WIDTH{1'b0}};
     assign profile_total_ivalid = 1'b0;
     assign profile_total_req = 1'b0;
     assign profile_i_stall_count = 1'b0;
     assign profile_o_stall_count = 1'b0;
     assign profile_avm_readwrite_count = 1'b0;
     assign profile_avm_burstcount_total = 1'b0;
     assign profile_avm_burstcount_total_incr = {ACL_PROFILE_INCREMENT_WIDTH{1'b0}};
     assign profile_avm_stall = 1'b0;
  end
    
  
  
end
else begin 

wire lsu_active;

// For handling dependents of this lsu
assign o_writeack = avm_writeack;

// If this is a banked local memory LSU, then permute address bits so that
// consective words in memory are in different banks.  Do this by
// taking the k lowest bits of the word-address and shifting them to the top
// of the aggregate local memory address width.  The number of bits k
// corresponds to the number of banks parameter.

localparam MWIDTH_BYTES_CLIP = (MWIDTH_BYTES==1) ? 2 : MWIDTH_BYTES; //to get around modelsim looking at addr[-1:0] if MWIDTH_BYTES==1
function [AWIDTH-1:0] permute_addr ( input [AWIDTH-1:0] addr);
  if (ENABLE_BANKED_MEMORY==1)
  begin
    if (MWIDTH_BYTES==1) begin
      permute_addr= {
        addr[(AWIDTH-1) : (HACKED_ABITS_PER_LMEM_BANK+BANK_SELECT_BITS)], // High order bits unchanged
        addr[($clog2(MWIDTH_BYTES)+BANK_SELECT_BITS-1) : $clog2(MWIDTH_BYTES)], // Bank select from lsbits
        addr[(HACKED_ABITS_PER_LMEM_BANK + BANK_SELECT_BITS-1) : ($clog2(MWIDTH_BYTES) + BANK_SELECT_BITS)]
        };
    end
    else begin
      permute_addr= {
        addr[(AWIDTH-1) : (HACKED_ABITS_PER_LMEM_BANK+BANK_SELECT_BITS)], // High order bits unchanged
        addr[($clog2(MWIDTH_BYTES)+BANK_SELECT_BITS-1) : $clog2(MWIDTH_BYTES)], // Bank select from lsbits
        addr[(HACKED_ABITS_PER_LMEM_BANK + BANK_SELECT_BITS-1) : ($clog2(MWIDTH_BYTES) + BANK_SELECT_BITS)],
        addr[($clog2(MWIDTH_BYTES_CLIP)-1) : 0]         // Byte address within a word
        };
    end
   end
   else
   begin
     permute_addr= addr;
   end
endfunction

wire [AWIDTH-1:0] avm_address_raw;
assign avm_address=permute_addr(avm_address_raw);

/***************
* Architecture *
***************/

// Tie off the unused read/write signals

// atomics dont have unused signals
if(ATOMIC==0) begin
  if(READ==1)
  begin
     assign avm_write = 1'b0;
     //assign avm_writedata = {MWIDTH{1'bx}};
     assign avm_writedata = {MWIDTH{1'b0}}; // make writedata 0 because it is used by atomics
  end
  else // WRITE
  begin
    assign avm_read = 1'b0;
  end
end
else begin //ATOMIC
  assign avm_write = 1'b0;
end








// Write acknowledge support: If WRITEACK is not to be supported, than assume
// that a write is fully completed as soon as it is accepted by the fabric.
// Otherwise, wait for the writeack signal to return.
wire lsu_writeack;  
if(USE_WRITE_ACK==1)
begin
   assign lsu_writeack = avm_writeack;
end
else
begin
   assign lsu_writeack = avm_write && !avm_waitrequest;
end


// NOP support: The least-significant address bit indicates if this is a NOP
// instruction (i.e. we do not wish a read/write to be performed).  
// Appropriately adjust the valid and stall inputs to the core LSU block to
// ensure NOP instructions are not executed and preserve their ordering with
// other threads.
wire lsu_i_valid;
wire lsu_o_valid;
wire lsu_i_stall;
wire lsu_o_stall;
wire [AWIDTH-1:0] address;
wire nop;


if(SUPPORTS_NOP)
begin
   // Module intrinsicly supports NOP operations, just pass them on through
   assign lsu_i_valid = i_valid;
   assign lsu_i_stall = i_stall;
   assign o_valid = lsu_o_valid;
   assign o_stall = lsu_o_stall;
   assign address = i_address | i_bitwiseor;
end
else if(PIPELINED_LSU || ATOMIC_PIPELINED_LSU)
begin
   // No built-in NOP support.  Pipelined LSUs without NOP support need us to 
   // build a fifo along side the core LSU to track NOP instructions
   wire nop_fifo_empty;
   wire nop_fifo_full;
   wire nop_next;

   assign nop = i_predicate;
   assign address = i_address | i_bitwiseor;

   // Store the NOP status flags along side the core LSU
   // Assume (TODO eliminate this assumption?) that KERNEL_SIDE_MEM_LATENCY is the max 
   // number of simultaneous requests in flight for the LSU. The NOP FIFO will
   // will be sized to KERNEL_SIDE_MEM_LATENCY+1 to prevent stalls when the LSU is
   // full.
   //
   // For smaller latency values, use registers to implement the FIFO.
   if(KERNEL_SIDE_MEM_LATENCY <= 64)
   begin
      acl_ll_fifo #(
         .WIDTH(1),
         .DEPTH(KERNEL_SIDE_MEM_LATENCY+1)
      ) nop_fifo (
         .clk(clock),
         .reset(~sync_rstn),
         .data_in(nop),
         .write(i_valid && !o_stall),
         .data_out(nop_next),
         .read(o_valid && !i_stall),
         .full(nop_fifo_full),
         .empty(nop_fifo_empty)
      );
   end
   else
   begin
      scfifo #(
         .add_ram_output_register( "OFF" ),
         .intended_device_family( "Stratix IV" ),
         .lpm_numwords( KERNEL_SIDE_MEM_LATENCY+1 ),
         .lpm_showahead( "ON" ),
         .lpm_type( "scfifo" ),
         .lpm_width( 1 ),
         .lpm_widthu( $clog2(KERNEL_SIDE_MEM_LATENCY+1) ),
         .overflow_checking( "OFF" ),
         .underflow_checking( "OFF" )
      ) nop_fifo (
         .clock(clock),
         .data(nop),
         .rdreq(o_valid && !i_stall),
         .wrreq(i_valid && !o_stall),
         .empty(nop_fifo_empty),
         .full(nop_fifo_full),
         .q(nop_next),
         .aclr(!sync_rstn),
         .almost_full(),
         .almost_empty(),
         .usedw(),
         .sclr()
      );
   end

   // Logic to prevent NOP instructions from entering the core
   assign lsu_i_valid = !nop && i_valid && !nop_fifo_full;
   assign lsu_i_stall = nop_fifo_empty || nop_next || i_stall;

   // Logic to generate the valid bit for NOP instructions that have bypassed
   // the LSU.  The instructions must be kept in order so they are consistant
   // with data propagating through pipelines outside of the LSU.
   assign o_valid = (lsu_o_valid || nop_next) && !nop_fifo_empty;
   assign o_stall = nop_fifo_full || lsu_o_stall;
end
else
begin
   // An unpipelined LSU will only have one active request at a time.  We just
   // need to track whether there is a pending request in the LSU core and
   // appropriately bypass the core with NOP requests while preserving the
   // thread ordering.  (A NOP passes straight through to the downstream 
   // block, unless there is a pending request in the block, in which case
   // we stall until the request is complete).
   reg pending;
   always@(posedge clock or negedge sync_rstn)
   begin
      if(sync_rstn == 1'b0)
         pending <= 1'b0;
      else
         pending <= pending ? ((lsu_i_valid && !lsu_o_stall) || !(lsu_o_valid && !lsu_i_stall)) :
                              ((lsu_i_valid && !lsu_o_stall) && !(lsu_o_valid && !lsu_i_stall));
   end

   assign nop = i_predicate;
   assign address = i_address | i_bitwiseor;

   assign lsu_i_valid = i_valid && !nop;
   assign lsu_i_stall = i_stall;
   assign o_valid = lsu_o_valid || (!pending && i_valid && nop);
   assign o_stall = lsu_o_stall || (pending && nop);
end


// Styles with no burst support require burstcount=1

if(!SUPPORTS_BURSTS)
begin
   assign avm_burstcount = 1;
end


// Profiling signals.
wire req_cache_hit_count;
wire extra_unaligned_reqs;

// initialize
if(READ==0 || STYLE!="BURST-NON-ALIGNED")
assign extra_unaligned_reqs = 1'b0;
if(READ==0 || (STYLE!="BURST-COALESCED" && STYLE!="BURST-NON-ALIGNED" && STYLE!="SEMI-STREAMING"))
assign req_cache_hit_count = 1'b0;

// Generate different architectures based on the STYLE parameter

////////////////
// Simple LSU //
////////////////
if(STYLE=="SIMPLE")
begin
    if(READ == 1)
    begin
        lsu_simple_read #(
            .AWIDTH(AWIDTH),
            .WIDTH_BYTES(WIDTH_BYTES),
            .MWIDTH_BYTES(MWIDTH_BYTES),
            .ALIGNMENT_ABITS(ALIGNMENT_ABITS),
            .HIGH_FMAX(HIGH_FMAX)
        ) simple_read (
            .clk(clock),
            .reset(!sync_rstn),
            .o_stall(lsu_o_stall),
            .i_valid(lsu_i_valid),
            .i_address(address),
            .i_stall(lsu_i_stall),
            .o_valid(lsu_o_valid),
            .o_active(lsu_active),
            .o_readdata(o_readdata),
            .avm_address(avm_address_raw),
            .avm_read(avm_read),
            .avm_readdata(avm_readdata),
            .avm_waitrequest(avm_waitrequest),
            .avm_byteenable(avm_byteenable),
            .avm_readdatavalid(avm_readdatavalid)
        );
    end
    else
    begin
        lsu_simple_write #(
            .AWIDTH(AWIDTH),
            .WIDTH_BYTES(WIDTH_BYTES),
            .MWIDTH_BYTES(MWIDTH_BYTES),
            .USE_BYTE_EN(USE_BYTE_EN),
            .ALIGNMENT_ABITS(ALIGNMENT_ABITS)
        ) simple_write (
            .clk(clock),
            .reset(!sync_rstn),
            .o_stall(lsu_o_stall),
            .i_valid(lsu_i_valid),
            .i_address(address),
            .i_writedata(i_writedata),
            .i_stall(lsu_i_stall),
            .o_valid(lsu_o_valid),
            .i_byteenable(i_byteenable),
            .o_active(lsu_active),
            .avm_address(avm_address_raw),
            .avm_write(avm_write),
            .avm_writeack(lsu_writeack),
            .avm_writedata(avm_writedata),
            .avm_byteenable(avm_byteenable),
            .avm_waitrequest(avm_waitrequest)
        );
    end
end

///////////////
// Pipelined //
///////////////
else if(STYLE=="PIPELINED")
begin
    wire sub_o_stall;
    if(USEINPUTFIFO == 0) begin : GEN_0
      assign lsu_o_stall = sub_o_stall & !i_predicate;
    end
    else begin : GEN_1
      assign lsu_o_stall = sub_o_stall;
    end 
    if(READ == 1)
    begin
        lsu_pipelined_read #(
            .KERNEL_SIDE_MEM_LATENCY(KERNEL_SIDE_MEM_LATENCY),
            .AWIDTH(AWIDTH),
            .WIDTH_BYTES(WIDTH_BYTES),
            .MWIDTH_BYTES(MWIDTH_BYTES),
            .ALIGNMENT_ABITS(ALIGNMENT_ABITS),
            .USEINPUTFIFO(USEINPUTFIFO),
            .USEOUTPUTFIFO(USEOUTPUTFIFO)
        ) pipelined_read (
            .clk(clock),
            .reset(!sync_rstn),
            .o_stall(sub_o_stall),
            .i_valid(lsu_i_valid),
            .i_address(address),
            .i_stall(lsu_i_stall),
            .o_valid(lsu_o_valid),
            .o_readdata(o_readdata),
            .o_input_fifo_depth(o_input_fifo_depth),
            .o_active(lsu_active),
            .avm_address(avm_address_raw),
            .avm_read(avm_read),
            .avm_readdata(avm_readdata),
            .avm_waitrequest(avm_waitrequest),
            .avm_byteenable(avm_byteenable),
            .avm_readdatavalid(avm_readdatavalid)
        );
    end
    else
    begin
        lsu_pipelined_write #(
            .KERNEL_SIDE_MEM_LATENCY(KERNEL_SIDE_MEM_LATENCY),
            .AWIDTH(AWIDTH),
            .WIDTH_BYTES(WIDTH_BYTES),
            .MWIDTH_BYTES(MWIDTH_BYTES),
            .USE_BYTE_EN(USE_BYTE_EN),
            .ALIGNMENT_ABITS(ALIGNMENT_ABITS),
            .USEINPUTFIFO(USEINPUTFIFO)
        ) pipelined_write (
            .clk(clock),
            .reset(!sync_rstn),
            .o_stall(sub_o_stall),
            .i_valid(lsu_i_valid),
            .i_address(address),
            .i_byteenable(i_byteenable),
            .i_writedata(i_writedata),
            .i_stall(lsu_i_stall),
            .o_valid(lsu_o_valid),
            .o_input_fifo_depth(o_input_fifo_depth),
            .o_active(lsu_active),
            .avm_address(avm_address_raw),
            .avm_write(avm_write),
            .avm_writeack(lsu_writeack),
            .avm_writedata(avm_writedata),
            .avm_byteenable(avm_byteenable),
            .avm_waitrequest(avm_waitrequest)
        );
    end
end

//////////////////////
// Atomic Pipelined //
//////////////////////
else if(STYLE=="ATOMIC-PIPELINED")
begin
    lsu_atomic_pipelined #(
           .KERNEL_SIDE_MEM_LATENCY(KERNEL_SIDE_MEM_LATENCY),
           .AWIDTH(AWIDTH),
           .WIDTH_BYTES(WIDTH_BYTES),
           .MWIDTH_BYTES(MWIDTH_BYTES),
           .WRITEDATAWIDTH_BYTES(WRITEDATAWIDTH_BYTES),
           .ALIGNMENT_ABITS(ALIGNMENT_ABITS),
           .USEINPUTFIFO(USEINPUTFIFO),
           .USEOUTPUTFIFO(USEOUTPUTFIFO),
           .ATOMIC_WIDTH(ATOMIC_WIDTH)
    ) atomic_pipelined (
           .clk(clock),
           .reset(!sync_rstn),
           .o_stall(lsu_o_stall),
           .i_valid(lsu_i_valid),
           .i_address(address),
           .i_stall(lsu_i_stall),
           .o_valid(lsu_o_valid),
           .o_readdata(o_readdata),
           .o_input_fifo_depth(o_input_fifo_depth),
           .o_active(lsu_active),
           .avm_address(avm_address_raw),
           .avm_read(avm_read),
           .avm_readdata(avm_readdata),
           .avm_waitrequest(avm_waitrequest),
           .avm_byteenable(avm_byteenable),
           .avm_readdatavalid(avm_readdatavalid),
           .i_atomic_op(i_atomic_op),
           .i_writedata(i_writedata),
           .i_cmpdata(i_cmpdata),
           .avm_writeack(lsu_writeack),
           .avm_writedata(avm_writedata)
    );
end

/////////////////////
// Basic Coalesced //
/////////////////////
else if(STYLE=="BASIC-COALESCED")
begin
    if(READ == 1)
    begin
        lsu_basic_coalesced_read #(
            .KERNEL_SIDE_MEM_LATENCY(KERNEL_SIDE_MEM_LATENCY),
            .AWIDTH(AWIDTH),
            .WIDTH_BYTES(WIDTH_BYTES),
            .MWIDTH_BYTES(MWIDTH_BYTES),
            .ALIGNMENT_ABITS(ALIGNMENT_ABITS)
        ) basic_coalesced_read (
            .clk(clock),
            .reset(!sync_rstn),
            .o_stall(lsu_o_stall),
            .i_valid(lsu_i_valid),
            .i_address(address),
            .i_stall(lsu_i_stall),
            .o_valid(lsu_o_valid),
            .o_readdata(o_readdata),
            .avm_address(avm_address_raw),
            .avm_read(avm_read),
            .avm_readdata(avm_readdata),
            .avm_waitrequest(avm_waitrequest),
            .avm_byteenable(avm_byteenable),
            .avm_readdatavalid(avm_readdatavalid)
        );
    end
    else
    begin
        lsu_basic_coalesced_write #(
            .KERNEL_SIDE_MEM_LATENCY(KERNEL_SIDE_MEM_LATENCY),
            .AWIDTH(AWIDTH),
            .WIDTH_BYTES(WIDTH_BYTES),
            .USE_BYTE_EN(USE_BYTE_EN),
            .MWIDTH_BYTES(MWIDTH_BYTES),
            .ALIGNMENT_ABITS(ALIGNMENT_ABITS)
        ) basic_coalesced_write (
            .clk(clock),
            .reset(!sync_rstn),
            .o_stall(lsu_o_stall),
            .i_valid(lsu_i_valid),
            .i_address(address),
            .i_writedata(i_writedata),
            .i_byteenable(i_byteenable),
            .i_stall(lsu_i_stall),
            .o_valid(lsu_o_valid),
            .o_active(lsu_active),
            .avm_address(avm_address_raw),
            .avm_write(avm_write),
            .avm_writeack(lsu_writeack),
            .avm_writedata(avm_writedata),
            .avm_byteenable(avm_byteenable),
            .avm_waitrequest(avm_waitrequest)
        );
    end
end

/////////////////////
// Burst Coalesced //
/////////////////////
else if(STYLE=="BURST-COALESCED")
begin
    if(READ == 1)
    begin
        lsu_bursting_read #(
            .KERNEL_SIDE_MEM_LATENCY(KERNEL_SIDE_MEM_LATENCY),
            .MEMORY_SIDE_MEM_LATENCY(MEMORY_SIDE_MEM_LATENCY),
            .AWIDTH(AWIDTH),
            .WIDTH_BYTES(WIDTH_BYTES),
            .MWIDTH_BYTES(MWIDTH_BYTES),
            .ALIGNMENT_ABITS(ALIGNMENT_ABITS),
            .BURSTCOUNT_WIDTH(BURSTCOUNT_WIDTH),
            .USECACHING(USECACHING),
            .HIGH_FMAX(HIGH_FMAX),
            .ACL_PROFILE(ACL_PROFILE),
            .CACHE_SIZE_N(CACHESIZE)
        ) bursting_read (
            .clk(clock),
            .clk2x(clock2x),
            .reset(!sync_rstn),
            .flush(flush),
            .i_nop(i_predicate),
            .o_stall(lsu_o_stall),
            .i_valid(lsu_i_valid),            
            .i_address(address),
            .i_stall(lsu_i_stall),
            .o_valid(lsu_o_valid),
            .o_readdata(o_readdata),
            .o_active(lsu_active),
            .avm_address(avm_address_raw),
            .avm_read(avm_read),
            .avm_readdata(avm_readdata),
            .avm_waitrequest(avm_waitrequest),
            .avm_byteenable(avm_byteenable),
            .avm_burstcount(avm_burstcount),
            .avm_readdatavalid(avm_readdatavalid),
            .req_cache_hit_count(req_cache_hit_count)
        );
    end
    else
    begin
        // Non-writeack stores are similar to streaming, where the pipeline
        // needs only few threads which just drop off data, and internally the
        // LSU must account for arbitration contention and other delays.
        lsu_bursting_write #(
            .KERNEL_SIDE_MEM_LATENCY(KERNEL_SIDE_MEM_LATENCY),
            .MEMORY_SIDE_MEM_LATENCY(MEMORY_SIDE_MEM_LATENCY),
            .AWIDTH(AWIDTH),
            .WIDTH_BYTES(WIDTH_BYTES),
            .MWIDTH_BYTES(MWIDTH_BYTES),
            .ALIGNMENT_ABITS(ALIGNMENT_ABITS),
            .BURSTCOUNT_WIDTH(BURSTCOUNT_WIDTH),
            .USE_WRITE_ACK(USE_WRITE_ACK),
            .USE_BYTE_EN(USE_BYTE_EN),
            .HIGH_FMAX(HIGH_FMAX)
        ) bursting_write (
            .clk(clock),
            .clk2x(clock2x),
            .reset(!sync_rstn),
            .o_stall(lsu_o_stall),
            .i_valid(lsu_i_valid),
            .i_nop(i_predicate),
            .i_address(address),
            .i_writedata(i_writedata),
            .i_stall(lsu_i_stall),
            .o_valid(lsu_o_valid),
            .o_active(lsu_active),
            .i_byteenable(i_byteenable),
            .avm_address(avm_address_raw),
            .avm_write(avm_write),
            .avm_writeack(lsu_writeack),
            .avm_writedata(avm_writedata),
            .avm_byteenable(avm_byteenable),
            .avm_burstcount(avm_burstcount),
            .avm_waitrequest(avm_waitrequest)
        );
    end
end



/////////////////////////////////
// Burst Coalesced Non Aligned //
/////////////////////////////////
else if(STYLE=="BURST-NON-ALIGNED")
begin
    if(READ == 1)
    begin
        lsu_bursting_read #(
            .KERNEL_SIDE_MEM_LATENCY(KERNEL_SIDE_MEM_LATENCY),
            .MEMORY_SIDE_MEM_LATENCY(MEMORY_SIDE_MEM_LATENCY),
            .AWIDTH(AWIDTH),
            .WIDTH_BYTES(WIDTH_BYTES),
            .MWIDTH_BYTES(MWIDTH_BYTES),
            .ALIGNMENT_ABITS(ALIGNMENT_ABITS),
            .BURSTCOUNT_WIDTH(BURSTCOUNT_WIDTH),
            .USECACHING(USECACHING),
            .CACHE_SIZE_N(CACHESIZE),
            .HIGH_FMAX(HIGH_FMAX),
            .ACL_PROFILE(ACL_PROFILE),
            .UNALIGNED(1)
        ) bursting_non_aligned_read (
            .clk(clock),
            .clk2x(clock2x),
            .reset(!sync_rstn),
            .flush(flush),
            .o_stall(lsu_o_stall),
            .i_valid(lsu_i_valid),
            .i_address(address),
            .i_nop(i_predicate),
            .i_stall(lsu_i_stall),
            .o_valid(lsu_o_valid),
            .o_readdata(o_readdata),
            .o_active(lsu_active),
            .avm_address(avm_address_raw),
            .avm_read(avm_read),
            .avm_readdata(avm_readdata),
            .avm_waitrequest(avm_waitrequest),
            .avm_byteenable(avm_byteenable),
            .avm_burstcount(avm_burstcount),
            .avm_readdatavalid(avm_readdatavalid),
            .extra_unaligned_reqs(extra_unaligned_reqs),
            .req_cache_hit_count(req_cache_hit_count)
        );
    end
    else
    begin
        lsu_non_aligned_write #(
            .KERNEL_SIDE_MEM_LATENCY(KERNEL_SIDE_MEM_LATENCY),
            .MEMORY_SIDE_MEM_LATENCY(MEMORY_SIDE_MEM_LATENCY),
            .AWIDTH(AWIDTH),
            .WIDTH_BYTES(WIDTH_BYTES),
            .MWIDTH_BYTES(MWIDTH_BYTES),
            .ALIGNMENT_ABITS(ALIGNMENT_ABITS),
            .BURSTCOUNT_WIDTH(BURSTCOUNT_WIDTH),
            .USE_WRITE_ACK(USE_WRITE_ACK),
            .USE_BYTE_EN(USE_BYTE_EN),
            .HIGH_FMAX(HIGH_FMAX)
        ) bursting_non_aligned_write (
            .clk(clock),
            .clk2x(clock2x),
            .reset(!sync_rstn),
            .o_stall(lsu_o_stall),
            .i_valid(lsu_i_valid),
            .i_address(address),
            .i_nop(i_predicate),
            .i_writedata(i_writedata),
            .i_stall(lsu_i_stall),
            .o_valid(lsu_o_valid),
            .o_active(lsu_active),
            .i_byteenable(i_byteenable),
            .avm_address(avm_address_raw),
            .avm_write(avm_write),
            .avm_writeack(lsu_writeack),
            .avm_writedata(avm_writedata),
            .avm_byteenable(avm_byteenable),
            .avm_burstcount(avm_burstcount),
            .avm_waitrequest(avm_waitrequest)
        );
    end
end
///////////////
// Streaming //
///////////////
else if(STYLE=="STREAMING")
begin
   if(READ==1)
   begin
      lsu_streaming_read #(
         .KERNEL_SIDE_MEM_LATENCY(KERNEL_SIDE_MEM_LATENCY),
         .MEMORY_SIDE_MEM_LATENCY(MEMORY_SIDE_MEM_LATENCY),
         .AWIDTH(AWIDTH),
         .WIDTH_BYTES(WIDTH_BYTES),
         .MWIDTH_BYTES(MWIDTH_BYTES),
         .ALIGNMENT_ABITS(ALIGNMENT_ABITS),
         .BURSTCOUNT_WIDTH(BURSTCOUNT_WIDTH)
      ) streaming_read (
         .clk(clock),
         .reset(!sync_rstn),
         .o_stall(lsu_o_stall),
         .i_valid(lsu_i_valid),
         .i_stall(lsu_i_stall),
         .o_valid(lsu_o_valid),
         .o_readdata(o_readdata),
         .o_active(lsu_active),
         .i_nop(i_predicate),
         .base_address(stream_base_addr),
         .size(stream_size),
         .avm_address(avm_address_raw),
         .avm_burstcount(avm_burstcount),
         .avm_read(avm_read),
         .avm_readdata(avm_readdata),
         .avm_waitrequest(avm_waitrequest),
         .avm_byteenable(avm_byteenable),
         .avm_readdatavalid(avm_readdatavalid)
      );
   end
   else
   begin
     lsu_streaming_write #(
         .KERNEL_SIDE_MEM_LATENCY(KERNEL_SIDE_MEM_LATENCY),
         .MEMORY_SIDE_MEM_LATENCY(MEMORY_SIDE_MEM_LATENCY),
         .AWIDTH(AWIDTH),
         .WIDTH_BYTES(WIDTH_BYTES),
         .MWIDTH_BYTES(MWIDTH_BYTES),
         .ALIGNMENT_ABITS(ALIGNMENT_ABITS),
         .BURSTCOUNT_WIDTH(BURSTCOUNT_WIDTH),
         .USE_BYTE_EN(USE_BYTE_EN)
     ) streaming_write (
         .clk(clock),
         .reset(!sync_rstn),
         .o_stall(lsu_o_stall),
         .i_valid(lsu_i_valid),
         .i_stall(lsu_i_stall),
         .o_valid(lsu_o_valid),
         .o_active(lsu_active),
         .i_byteenable(i_byteenable),
         .i_writedata(i_writedata),
         .i_nop(i_predicate),
         .base_address(stream_base_addr),
         .size(stream_size),
         .avm_address(avm_address_raw),
         .avm_burstcount(avm_burstcount),
         .avm_write(avm_write),
         .avm_writeack(lsu_writeack),
         .avm_writedata(avm_writedata),
         .avm_byteenable(avm_byteenable),
         .avm_waitrequest(avm_waitrequest)
     );
   end
end
////////////////////
// SEMI-Streaming //
////////////////////
else if(STYLE=="SEMI-STREAMING")
begin
   if(READ==1)
   begin
      lsu_read_cache #(
         .KERNEL_SIDE_MEM_LATENCY(KERNEL_SIDE_MEM_LATENCY),
         .AWIDTH(AWIDTH),
         .WIDTH_BYTES(WIDTH_BYTES),
         .MWIDTH_BYTES(MWIDTH_BYTES),
         .ALIGNMENT_ABITS(ALIGNMENT_ABITS),
         .BURSTCOUNT_WIDTH(BURSTCOUNT_WIDTH),
         .ACL_PROFILE(ACL_PROFILE),
         .REQUESTED_SIZE(CACHESIZE)
      ) read_cache (
         .clk(clock),
         .reset(!sync_rstn),
         .flush(flush),
         .o_stall(lsu_o_stall),
         .i_valid(lsu_i_valid),
         .i_address(address),
         .i_stall(lsu_i_stall),
         .o_valid(lsu_o_valid),
         .o_readdata(o_readdata),
         .o_active(lsu_active),
         .i_nop(i_predicate),
         .avm_address(avm_address_raw),
         .avm_burstcount(avm_burstcount),
         .avm_read(avm_read),
         .avm_readdata(avm_readdata),
         .avm_waitrequest(avm_waitrequest),
         .avm_byteenable(avm_byteenable),
         .avm_readdatavalid(avm_readdatavalid),
         .req_cache_hit_count(req_cache_hit_count)
      );
   end
end


always@(posedge clock or negedge sync_rstn)
   if (!sync_rstn)
      o_active <= 1'b0;
    else
      o_active <= lsu_active;

// Profile the valids and stalls of the LSU

if(ACL_PROFILE==1)
begin

   // keep track of write bursts
   reg [BURSTCOUNT_WIDTH-1:0] profile_remaining_writeburst_count;
   wire active_write_burst;
   assign active_write_burst = (profile_remaining_writeburst_count != {BURSTCOUNT_WIDTH{1'b0}});
   always@(posedge clock or negedge sync_rstn)
     if (!sync_rstn)
        profile_remaining_writeburst_count <= {BURSTCOUNT_WIDTH{1'b0}};
     else if(avm_write & ~avm_waitrequest & ~active_write_burst)
        // start of a new write burst
        profile_remaining_writeburst_count <= avm_burstcount - 1;
     else if(~avm_waitrequest & active_write_burst)
        // count down one burst
        profile_remaining_writeburst_count <= profile_remaining_writeburst_count - 1;      

   assign profile_bw = (READ==1) ? avm_readdatavalid : (avm_write & ~avm_waitrequest);
   assign profile_bw_incr = MWIDTH_BYTES;
   assign profile_total_ivalid = (i_valid & ~o_stall);
   assign profile_total_req = (i_valid & ~i_predicate & ~o_stall);
   assign profile_i_stall_count = (i_stall & o_valid);
   assign profile_o_stall_count = (o_stall & i_valid);
   assign profile_avm_readwrite_count = ((avm_read | avm_write) & ~avm_waitrequest & ~active_write_burst);
   assign profile_avm_burstcount_total = ((avm_read | avm_write) & ~avm_waitrequest & ~active_write_burst);
   assign profile_avm_burstcount_total_incr = avm_burstcount;
   assign profile_req_cache_hit_count = req_cache_hit_count;
   assign profile_extra_unaligned_reqs = extra_unaligned_reqs;
   assign profile_avm_stall = ((avm_read | avm_write) & avm_waitrequest);

end
else begin
   assign profile_bw = 1'b0;
   assign profile_bw_incr = {ACL_PROFILE_INCREMENT_WIDTH{1'b0}};
   assign profile_total_ivalid = 1'b0;
   assign profile_total_req = 1'b0;
   assign profile_i_stall_count = 1'b0;
   assign profile_o_stall_count = 1'b0;
   assign profile_avm_readwrite_count = 1'b0;
   assign profile_avm_burstcount_total = 1'b0;
   assign profile_avm_burstcount_total_incr = {ACL_PROFILE_INCREMENT_WIDTH{1'b0}};
   assign profile_req_cache_hit_count = 1'b0;
   assign profile_extra_unaligned_reqs = 1'b0;
   assign profile_avm_stall = 1'b0;
end

// synthesis translate_off
// Profiling data - for simulation only
reg  [31:0] bw_kernel;
reg  [31:0] bw_avalon;

// Measure Bandwidth on Avalon signals
always@(posedge clock or negedge sync_rstn)
begin
   if (!sync_rstn)
     bw_avalon <= 0;
   else 
     if (READ==1 && avm_readdatavalid)
       bw_avalon <= bw_avalon + MWIDTH_BYTES;
     else if (READ==0 && avm_write && ~avm_waitrequest)
       bw_avalon <= bw_avalon + MWIDTH_BYTES;
end

// Measure Bandwidth on kernel signals
always@(posedge clock or negedge sync_rstn)
begin
   if (!sync_rstn)
     bw_kernel <= 0;
   else if (i_valid && !o_stall && ~nop)
     bw_kernel <= bw_kernel + WIDTH_BYTES;
end
// synthesis translate_on


if(PROFILE_ADDR_TOGGLE==1 && STYLE!="SIMPLE")
begin
  localparam COUNTERWIDTH=12;
  // We currently assume AWIDTH is always 32, but we really need to set this to
  // a tight lower bound to avoid wasting area here.
  logic [COUNTERWIDTH-1:0] togglerate[AWIDTH-ALIGNMENT_ABITS+1];

  acl_toggle_detect 
    #(.WIDTH(AWIDTH-ALIGNMENT_ABITS), .COUNTERWIDTH(COUNTERWIDTH)) atd (
      .clk(clock),
      .resetn(sync_rstn),
      .valid(i_valid && ~o_stall && ~nop),
      .value({i_address >> ALIGNMENT_ABITS,{ALIGNMENT_ABITS{1'b0}}}),
      .count(togglerate));

  acl_debug_mem #(.WIDTH(COUNTERWIDTH), .SIZE(AWIDTH-ALIGNMENT_ABITS+1)) dbg_mem (
      .clk(clock),
      .resetn(sync_rstn),
      .write(i_valid && ~o_stall && ~nop),
      .data(togglerate));

end


end
endgenerate

endmodule



