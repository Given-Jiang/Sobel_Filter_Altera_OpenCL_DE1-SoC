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
    


// This module provides profiling/performance monitoring hardware.
// Access to the module is through a memory mapped Avalon slave port.
// The monitoring hardware contains two sub-units:
//  1. acl_performance_counters: Contains a series of registers that record
//   run statistics, such as number of executed clock cycles, and
//   number of local memory stalls for each master.  The HAL can read these
//   slave registers and report to the user.
//  2. acl_log_buffer.  Maintains a log of cycle-by-cycle memory behaviour.
//   There is a global mem master (live_data_dump) that previously dumped
//   the buffer, but it is not currently used (and should be removed
//   at some point).  For now, data readback is through the slave port.
//
// Slave accesses are on 32-bit data.  HAL addresses are byte-wise,
//  so a 5-bit slave address becomes a 7-bit byte address
//  on the host side.
// To save address space, most accesses are indirect through the
//  slave.  i.e. writing a number to an access address
//  commands the hardware module to put data on the associated
//  readdata port, which is then connected to the same access
//  address during readback.  Accesses therefore require two
//  operations by the host: 1. Write module register address
//  to the slave location associated with the hardware module;
//  2. Read back from the same slave address, which will return
//  the hardware data/register value requested during step 1.
//
// Memory map of the Avalon slave:
// 0x00 - Status/control register
// 0x01 - Hardware module build number
// 0x02 - Performance register indirect access register
// 0x03 - Data logger start cycle
// 0x04 - Data logger end cycle - currently ignored
// 0x05 - Data logger indirect access register
// 0x06 - Local master number in which to trigger recording
//
// Status/control register bits:
// - 0 - set to 1 to enable monitoring
// - 1 - set to 1 to enable live data logging
// - 2 - is set by the log module if there is no data stored in the log buffer.
// - 4 - when set to 1, resets the monitoring infrastructure. It then proceeds to
//       clear itself after 1 clock cycle.
// - 5 - when set, live data logging will only start once the trigger FIFO's
//       depth signals is active
//
// To access the performance registers, write an address to 0x02 (0x08 host), and
//  then read back from the same 0x02 to get the data from the address requested.
//  Addresses 0-63 are the master input FIFO maximum depths
//  Addresses 128-255 are the master stall counters
//  Address 0x100 is the cycle counter
//  Address 0x101 is the number of cycle counter shifts (divisions by 2)
//    The shifts are intended to prevent overflow on long kernels, so are
//    zero for typical test runs.
//
// To use the data log, first set the start cycle by writing to
//  the appropriate slave address.  Then enable logging by setting bit 1
//  in the status register.  Logging will be trigerred when the kernel
//  is beyond the start cycle.  If you wish to also add a FIFO depth signal
//  activity to the trigger, set bit 5 in the status register,and also
//  write the desired local mem master number on which to trigger.
// After logging is complete (kernel finished), use writes to and reads
//  from address 0x05 (0x14 host) in the slave.  Write value 0xFFFFFFFF
//  to transfer the next item from the FIFO into the data buffer.  Then write
//  the word number, from 0..20, and read back to get the corresponding
//  32-bit word from the data buffer.  The buffer is currently
//  21*32 bits = 672 bits wide.
//
// The current data log format is:
// 1. 64 x 8-bit values with lmem master FIFO depths
// 2. 128 bits with waitrequest signal from all (up to 128) mem masters
// 3. 32 bit cycle counter

///////////////////////////////////////////////////////////////////////////////

module acl_perf_monitor(
			resetn, clock,
			
			kernel_start, kernel_finish,
			
			block_state,
			
			avs_perf_monitor_address,
			avs_perf_monitor_readdata,
			avs_perf_monitor_writedata,
			avs_perf_monitor_byteenable,
			avs_perf_monitor_write,
			avs_perf_monitor_read,
			avs_perf_monitor_readdatavalid,
			avs_perf_monitor_waitrequest,
			
         // TODO: Remove the global mem master if nobody wants to use it
			avm_live_data_dump_address,
			avm_live_data_dump_writedata,
			avm_live_data_dump_readdata,
			avm_live_data_dump_byteenable,
			avm_live_data_dump_burstcount,
			avm_live_data_dump_write,
			avm_live_data_dump_read,
			avm_live_data_dump_readdatavalid,
			avm_live_data_dump_waitrequest,
         avm_live_data_dump_writeack);
			
   localparam PERF_MON_BUILD_NUMBER = 32'd16;

	parameter BUFFER_SIZE_IN_256_BIT_WORDS = 512;

	input resetn, clock, kernel_start, kernel_finish;
			
	input [4:0] avs_perf_monitor_address;
	output reg [31:0] avs_perf_monitor_readdata;
	input [31:0] avs_perf_monitor_writedata;
	input [3:0] avs_perf_monitor_byteenable;
	input avs_perf_monitor_write;
	input avs_perf_monitor_read;
	output reg avs_perf_monitor_readdatavalid;
	output avs_perf_monitor_waitrequest;
	input [2047:0] block_state;
	
	output [31:0] avm_live_data_dump_address;
	output [255:0] avm_live_data_dump_writedata;
	input [255:0] avm_live_data_dump_readdata;
	output [31:0] avm_live_data_dump_byteenable;
	output [6:0] avm_live_data_dump_burstcount;
	output avm_live_data_dump_write;
	output avm_live_data_dump_read;
	input avm_live_data_dump_readdatavalid;
	input avm_live_data_dump_waitrequest;
	input avm_live_data_dump_writeack;


	// Create Avalon Slave to allow configuration of the performance monitoring unit
	// as well as reading of the performance counter values.
	reg [31:0] status_register;
	reg [31:0] log_address;
	reg [31:0] log_start;
	reg [31:0] trigger_FIFO_number;
	wire [31:0] perf_counters_readdata;
	wire [31:0] data_dump_readdata;
	wire [31:0] cycle_number;
	wire valid_data;
	wire log_empty, is_valid_log;
	wire restart = status_register[4];

	assign avs_perf_monitor_waitrequest = 1'b0;

   // Performance Counters
	acl_performance_counters performance_counters(
		.reset_n(resetn),
		.clock(clock),
		.restart(restart),
		.valid_data(valid_data),
		.log_start(log_start),
		.trigger_log_on_FIFO_depth_activity(status_register[5]),
		.cycle_number(cycle_number),
		.is_valid_log(is_valid_log),
		.basic_block_state(block_state),
		.address(avs_perf_monitor_address),
		.readdata(perf_counters_readdata),
		.writedata(avs_perf_monitor_writedata),
		.write(avs_perf_monitor_write & (avs_perf_monitor_byteenable == 4'hf)));	
	
   // Log Buffer
	acl_log_buffer log_buffer(
		.clock(clock),
		.reset_n(resetn),
		.restart(restart),
	
		.valid_data(valid_data & is_valid_log),
		.block_state({cycle_number, block_state[639:0]}), // 64 bytes (FIFO depth) + 128 bits (master stall bits) + 32-bit cycle number
		.log_address(log_address),
		.log_flush(status_register[3]),
		.log_enable(status_register[1]),
		.log_empty(log_empty),
		.address(avs_perf_monitor_address),
		.readdata(data_dump_readdata),
		.writedata(avs_perf_monitor_writedata),
		.write(avs_perf_monitor_write & (avs_perf_monitor_byteenable == 4'hf)),

		.avm_live_data_dump_address(avm_live_data_dump_address),
		.avm_live_data_dump_writedata(avm_live_data_dump_writedata),
		.avm_live_data_dump_readdata(avm_live_data_dump_readdata),
		.avm_live_data_dump_byteenable(avm_live_data_dump_byteenable),
		.avm_live_data_dump_burstcount(avm_live_data_dump_burstcount),
		.avm_live_data_dump_write(avm_live_data_dump_write),
		.avm_live_data_dump_read(avm_live_data_dump_read),
		.avm_live_data_dump_readdatavalid(avm_live_data_dump_readdatavalid),
		.avm_live_data_dump_waitrequest(avm_live_data_dump_waitrequest),	
		.avm_live_data_dump_writeack(avm_live_data_dump_writeack));	
		defparam log_buffer.DEPTH = BUFFER_SIZE_IN_256_BIT_WORDS;
		

   // Readdatavalid signal - delayed by an edge as required by Avalon
   always@(posedge clock or negedge resetn)
   begin
      if (~(resetn))
      begin
         avs_perf_monitor_readdatavalid <= 1'b0;
      end
      else
      begin
        avs_perf_monitor_readdatavalid  <= avs_perf_monitor_read;
      end
   end


   // Slave readback high level routing - either a local value, or connect
   //  to one of the hardware submodule outputs.
	always@(posedge clock)
	begin
         if (avs_perf_monitor_address == 5'h0)
            avs_perf_monitor_readdata <= status_register;
         else if (avs_perf_monitor_address == 5'h1)
            avs_perf_monitor_readdata <= PERF_MON_BUILD_NUMBER;
         else if (avs_perf_monitor_address == 5'h2)
            avs_perf_monitor_readdata <= perf_counters_readdata;
         else if (avs_perf_monitor_address == 5'h3)
            avs_perf_monitor_readdata <= log_start;
   //      else if (avs_perf_monitor_address == 5'h4)
   //         avs_perf_monitor_readdata <= log_end;
         else if (avs_perf_monitor_address == 5'h5)
            avs_perf_monitor_readdata <= data_dump_readdata;
         else if (avs_perf_monitor_address == 5'h6)
            avs_perf_monitor_readdata <= trigger_FIFO_number;
         else
            avs_perf_monitor_readdata <= 32'hF00F00FF;
	end
	
	// FSM that controls the behaviour of the performance monitoring unit.
	reg [1:0] present_state;
	reg [1:0] next_state;
	
	localparam 	s_IDLE = 2'd0,
					s_RUNNING = 2'd1,
					s_PAUSED = 2'd2;
	
	always@(*)
	begin
		case(present_state)
			s_IDLE: 
						if (status_register[0] == 1'b1) next_state <= s_PAUSED;
						else next_state <= s_IDLE;

			s_RUNNING:
						if (~status_register[0]) next_state <= s_IDLE;
						else if (kernel_finish) next_state <= s_PAUSED;
						else next_state <= s_RUNNING;

			s_PAUSED:
						if (~status_register[0]) next_state <= s_IDLE;
						else if (kernel_start) next_state <= s_RUNNING;
						else next_state <= s_PAUSED;
							
			default: next_state <= s_IDLE;
		endcase
	end
	
   // Writes to the top level performance monitor slave
	always@(posedge clock or negedge resetn)
	begin
		if (~resetn)
		begin
			status_register <= 32'd0;
			log_address <= 32'd0;
			log_start <= 32'd0;
			trigger_FIFO_number <= 32'd0;
			present_state <= s_IDLE;
		end
		else
		begin
			present_state <= next_state;
         status_register[2] <= log_empty;
         if ((avs_perf_monitor_address == 5'h00) && (avs_perf_monitor_write) && (avs_perf_monitor_byteenable == 4'hf))
            status_register <= avs_perf_monitor_writedata;
         else if ((avs_perf_monitor_address == 5'h3) && (avs_perf_monitor_write) && (avs_perf_monitor_byteenable == 4'hf))
            log_start <= avs_perf_monitor_writedata;
         else if ((avs_perf_monitor_address == 5'h6) && (avs_perf_monitor_write) && (avs_perf_monitor_byteenable == 4'hf))
            trigger_FIFO_number <= avs_perf_monitor_writedata;
         else
            begin
               status_register[4] <= 1'b0;
            end
		end
	end
	
	assign valid_data = (present_state == s_RUNNING);
endmodule


// Maintains specific stats on the kernel performance
module acl_performance_counters(
	reset_n, clock, restart, valid_data,
	basic_block_state,
	log_start,
   trigger_log_on_FIFO_depth_activity,
   trigger_FIFO_number,
	is_valid_log,
   cycle_number,
	address, readdata, writedata, write);
	
   localparam NUMBER_FIFO_DEPTH_REGS = 64;
   localparam NUMBER_STALL_COUNTERS = 128;

	input reset_n, clock, restart, valid_data;
	input [2047:0] basic_block_state;
	input [4:0] address;
	input [31:0] log_start;
   input trigger_log_on_FIFO_depth_activity;
   input [31:0] trigger_FIFO_number;
	output reg [31:0] readdata;
	output [31:0] cycle_number;
	output is_valid_log;
	input [31:0] writedata;
	input write;
	
	reg [31:0] FIFO_depth_max_regs [NUMBER_FIFO_DEPTH_REGS];
	reg [31:0] stall_counters [NUMBER_STALL_COUNTERS];
	reg [31:0] cycle_counter;
	reg [31:0] num_shifts;
	wire [7:0] internal_depth_wires [NUMBER_FIFO_DEPTH_REGS];
	reg internal_stall_regs [NUMBER_STALL_COUNTERS];
	
	
   // FIFO depth registers
	generate
		genvar index;
		
		for(index = 0; index < NUMBER_FIFO_DEPTH_REGS; index = index + 1)
		begin: fifo_depth_counter_logic
			assign internal_depth_wires[index] = basic_block_state[(index+1)*8 - 1: index*8];
			always@(posedge clock or negedge reset_n)
			begin
				if (~reset_n)
					FIFO_depth_max_regs[index] <= 32'd0;
				else 
				begin
					if (restart)
					begin
						FIFO_depth_max_regs[index] <= 32'd0;
					end
					else if (valid_data)
					begin
                  if (internal_depth_wires[index] > FIFO_depth_max_regs[index][7:0])
                     FIFO_depth_max_regs[index] <= {1'b0, internal_depth_wires[index]};
                  else
                     FIFO_depth_max_regs[index] <= FIFO_depth_max_regs[index];
					end
				end
			end
		end
	endgenerate

   // Stall counter registers
   generate
		genvar index_stalls;
		
		for(index_stalls = 0; index_stalls < NUMBER_STALL_COUNTERS; index_stalls = index_stalls + 1)
		begin: stall_counter_logic
         always@(posedge clock or negedge reset_n)
			begin
				if (~reset_n)
					internal_stall_regs[index_stalls] <= 1'b0;
				else 
				begin
					if (restart)
					begin
						internal_stall_regs[index_stalls] <= 1'b0;
					end
					else if (valid_data)
					begin
                     internal_stall_regs[index_stalls] <= basic_block_state[64*8 + index_stalls];
					end
				end
			end
			always@(posedge clock or negedge reset_n)
			begin
				if (~reset_n)
					stall_counters[index_stalls] <= 32'd0;
				else 
				begin
					if (restart)
					begin
						stall_counters[index_stalls] <= 32'd0;
					end
					else if (valid_data)
					begin
                  if (internal_stall_regs[index_stalls] == 1'b1 && ~(stall_counters[index_stalls][31]))
                     stall_counters[index_stalls] <= stall_counters[index_stalls] + 1'b1;
					end
				end
			end
		end
	endgenerate


   // Generate FIFO depth lsbit wires to simplify live logging start trigger
   wire [NUMBER_FIFO_DEPTH_REGS-1:0] fifo_lsbits;
   generate
		genvar fifo_index;
		
		for(fifo_index = 0; fifo_index < NUMBER_FIFO_DEPTH_REGS; fifo_index = fifo_index + 1)
		begin: grab_FIFO_depth_lsbits
			assign fifo_lsbits[fifo_index] = internal_depth_wires[fifo_index][0]; // lsbit of fifo depth signal
		end
	endgenerate

	//assign is_valid_log = ({1'b0, cycle_counter} >= {1'b0, log_start}) && ((|fifo_lsbits) || !trigger_log_on_FIFO_depth_activity);
	//assign is_valid_log = ({1'b0, cycle_counter} >= {1'b0, log_start}) && ((fifo_lsbits[trigger_FIFO_number[$clog2(NUMBER_FIFO_DEPTH_REGS)-1:0]]) || ~trigger_log_on_FIFO_depth_activity);
	assign is_valid_log = ({1'b0, cycle_counter} >= {1'b0, log_start}) && ((internal_depth_wires[trigger_FIFO_number[$clog2(NUMBER_FIFO_DEPTH_REGS)-1:0]][2]) || ~trigger_log_on_FIFO_depth_activity);

   assign cycle_number = cycle_counter;
	
   // Cycle counter
	always@(posedge clock or negedge reset_n)
	begin
		if (~reset_n)
		begin
			cycle_counter <= 32'd0;
			num_shifts <= 32'd0;
		end
		else 
		begin
			if (restart)
			begin
				cycle_counter <= 32'd0;
			end
			else if (valid_data)
			begin
				if (cycle_counter[31])
					cycle_counter <= {1'b0, cycle_counter[31:1]};
				else
					cycle_counter <= cycle_counter + 1'b1;
			end
			
			if (restart)
			begin
				num_shifts <= 32'd0;
			end
			else if (valid_data)
			begin
				if (cycle_counter[31])
					num_shifts <= num_shifts + 1'b1;
			end			
		end
	end
	
   // Performance counter writes through the top level perf monitor slave
	always@(*)
	begin
		if ((write) && (address == 5'h02))
      begin
         if (writedata == 32'h100)
            readdata <= cycle_counter;
         else if (writedata == 32'h101)
            readdata <= num_shifts;
         else if (writedata[31:6] == 26'h0)
            readdata <= FIFO_depth_max_regs[writedata[5:0]];
         else if (writedata[31:7] == 25'h01)
            readdata <= stall_counters[writedata[6:0]];
         else
            readdata <= 32'hABCDEFF0;
      end
	end
	
endmodule


module acl_log_buffer(
	clock, reset_n, restart,
	
	valid_data,
	block_state,
	log_address,
	log_flush,
	log_enable,
	log_empty,
   address, readdata, writedata, write,

	avm_live_data_dump_address,
	avm_live_data_dump_writedata,
	avm_live_data_dump_readdata,
	avm_live_data_dump_byteenable,
	avm_live_data_dump_burstcount,
	avm_live_data_dump_write,
	avm_live_data_dump_read,
	avm_live_data_dump_readdatavalid,
	avm_live_data_dump_waitrequest,
   avm_live_data_dump_writeack);

	localparam DATA_WIDTH = 672;  // 64 bytes (FIFO depth) + 128 bits (master stall bits) + 32 bits cycle number
   localparam NUM_WORDS_DWIDTH = DATA_WIDTH / 32;

	input clock, reset_n, restart, valid_data, log_flush, log_enable;
	output log_empty;
	input [4:0] address;
	output reg [31:0] readdata;
	input [31:0] writedata;
	input write;

	input [(DATA_WIDTH - 1):0] block_state;
	input [31:0] log_address;
	output reg [31:0] avm_live_data_dump_address;
	output [255:0] avm_live_data_dump_writedata;
	input [255:0] avm_live_data_dump_readdata;
	output [31:0] avm_live_data_dump_byteenable;
	output [6:0] avm_live_data_dump_burstcount;
	output avm_live_data_dump_write;
	output avm_live_data_dump_read;
	input avm_live_data_dump_readdatavalid;
	input avm_live_data_dump_waitrequest;
	input avm_live_data_dump_writeack;

	assign avm_live_data_dump_address = 32'h0;
	assign avm_live_data_dump_writedata = 256'h0;
	assign avm_live_data_dump_byteenable = 256'hffffffff;
	assign avm_live_data_dump_burstcount = 7'h0;
	assign avm_live_data_dump_write = 1'b0;
	assign avm_live_data_dump_read = 1'b0;

   reg data_logging_triggered;
	
	reg [2:0] present_state;
	reg [2:0] next_state;
	
	parameter DEPTH = 256;  // 256 is the default only, usually overridden when instantiated
	
	localparam NUM_BITS_DEPTH = $clog2(DEPTH);
	
	wire [NUM_BITS_DEPTH:0] fifo_usedw;
	reg [7:0] words_read;
   wire read_buffer_exhausted;
	wire fifo_valid_in;
	wire [DATA_WIDTH-1:0] fifo_data_out;
	wire buffer_full = fifo_usedw[NUM_BITS_DEPTH];
	wire reboot;
	
  
   wire [4:0] word_address;
   assign word_address = writedata[4:0];

   wire [31:0] individual_words [NUM_WORDS_DWIDTH];
   generate
		genvar word_index;
		
		for(word_index = 0; word_index < NUM_WORDS_DWIDTH; word_index = word_index + 1)
		begin: wordAssignment
			assign individual_words[word_index] = fifo_data_out[((word_index+1)*32 -1):word_index*32];
		end
	endgenerate


   always@(*)
	begin
		if ((write) && (address == 5'h05))
      begin
         if ((writedata[31:5] == 27'h0) && (word_address < NUM_WORDS_DWIDTH))
            readdata <= individual_words[word_address];
         else
            readdata <= 32'hFFFFFFFF;
      end
	end

   always@(posedge clock or negedge reset_n)
	begin
		if (~reset_n)
		begin
			data_logging_triggered <= 1'b0;
		end
		else 
		begin
			if (restart)
			begin
            data_logging_triggered <= 1'b0;
			end
			else
			begin
            // Trigger if past start cycle, and at least one of the FIFOs shows some life
            if (fifo_usedw[NUM_BITS_DEPTH])  // If FIFO full, stop logging
					data_logging_triggered <= 1'b0;
				else if (valid_data)
					data_logging_triggered <= 1'b1;
				else
					data_logging_triggered <= data_logging_triggered;
			end
		end
	end

   // FIFO to hold the cycle-by-cycle data.
	scfifo	dump_fifo (
				.clock (clock),
				.data (block_state),
				.rdreq ((write) && (address == 5'h05) && (writedata == 32'hFFFFFFFF)),
				.sclr (restart),
				.wrreq (data_logging_triggered && (~fifo_usedw[NUM_BITS_DEPTH]) && log_enable),
				.empty (log_empty),
				.full (fifo_usedw[NUM_BITS_DEPTH]),
				.q (fifo_data_out),
				.aclr (),
				.almost_empty (),
				.almost_full (),
				.usedw (fifo_usedw[NUM_BITS_DEPTH-1:0]));
	defparam
		dump_fifo.add_ram_output_register = "ON",
		dump_fifo.intended_device_family = "Stratix IV",
		dump_fifo.lpm_numwords = DEPTH,
		dump_fifo.lpm_showahead = "OFF",
		dump_fifo.lpm_type = "scfifo",
		dump_fifo.lpm_width = DATA_WIDTH,
		dump_fifo.lpm_widthu = NUM_BITS_DEPTH,
		dump_fifo.overflow_checking = "ON",
		dump_fifo.underflow_checking = "ON",
		dump_fifo.use_eab = "ON";

endmodule


			
