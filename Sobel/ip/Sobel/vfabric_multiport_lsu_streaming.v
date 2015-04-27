module vfabric_multiport_lsu_streaming_read(clock, resetn, base_address, size,
								 	i_datain_valid, o_datain_stall,
								 	avm_readdata, avm_readdatavalid, avm_waitrequest,
								 	avm_address, avm_read, avm_write, 
								 	avm_writeack, avm_writedata, avm_byteenable, 
								 	avm_burstcount, 
									o_dataouta, o_dataouta_valid, i_dataouta_stall,
									o_dataoutb, o_dataoutb_valid, i_dataoutb_stall,
									o_dataoutc, o_dataoutc_valid, i_dataoutc_stall,
									o_dataoutd, o_dataoutd_valid, i_dataoutd_stall);
parameter LSU_AWIDTH = 32;
parameter WIDTH_BYTES = 16;
parameter DATAOUT_WIDTH = 32;

 input clock, resetn;
 input [LSU_AWIDTH-1:0] base_address;
 input [DATAOUT_WIDTH-1:0] size;
 input i_datain_valid;
 output o_datain_stall;
 input [255:0] avm_readdata;
 input avm_readdatavalid;
 input avm_waitrequest;
 output [31:0] avm_address;
 output avm_read;
 output avm_write;
 input avm_writeack;
 output [255:0] avm_writedata;
 output [31:0] avm_byteenable;
 output [5:0] avm_burstcount;
 
 output [DATAOUT_WIDTH-1:0] o_dataouta;
 output [DATAOUT_WIDTH-1:0] o_dataoutb;
 output [DATAOUT_WIDTH-1:0] o_dataoutc;
 output [DATAOUT_WIDTH-1:0] o_dataoutd;
 
 input i_dataouta_stall, i_dataoutb_stall, i_dataoutc_stall, i_dataoutd_stall;
 output o_dataouta_valid, o_dataoutb_valid, o_dataoutc_valid, o_dataoutd_valid;

 wire [8*WIDTH_BYTES-1:0] lsu_dataout;
 wire lsu_dataout_valid;
 wire lsu_dataout_stall;
 wire [8*WIDTH_BYTES-1:0] mega_dataout;
 
 lsu_streaming_read lsu0 (.clk(clock), .resetn(resetn),
				.i_nop( 1'b0 ), .base_address(base_address), .size(size),
				.i_valid(i_datain_valid), .o_stall(o_datain_stall),
				.o_readdata(lsu_dataout), .o_valid(lsu_dataout_valid), 
				.i_stall(lsu_dataout_stall),
				.avm_read(avm_read),
				.avm_readdata(avm_readdata),
				.avm_readdatavalid(avm_readdatavalid),
				.avm_byteenable(avm_byteenable),
				.avm_waitrequest(avm_waitrequest),
				.avm_address(avm_address),
				.avm_burstcount(avm_burstcount) );
 defparam lsu0.AWIDTH = LSU_AWIDTH;
 defparam lsu0.WIDTH_BYTES=WIDTH_BYTES;
 
 fanout_splitter mega_splitter(.clock(clock), .resetn(resetn), .i_datain(lsu_dataout), .i_datain_valid(lsu_dataout_valid), 
 										 .o_datain_stall(lsu_dataout_stall), .o_dataout(mega_dataout), 
 										 .i_dataout_stall({i_dataoutd_stall, i_dataoutc_stall, i_dataoutb_stall, i_dataouta_stall}), 
 										 .o_dataout_valid({o_dataoutd_valid, o_dataoutc_valid, o_dataoutb_valid, o_dataouta_valid})); 
 defparam mega_splitter.DATA_WIDTH = DATAOUT_WIDTH*WIDTH_BYTES/4;
 defparam mega_splitter.NUM_FANOUTS = WIDTH_BYTES/4;
 
 assign o_dataouta[DATAOUT_WIDTH-1:0] = mega_dataout[DATAOUT_WIDTH-1:0];
 assign o_dataoutb[DATAOUT_WIDTH-1:0] = mega_dataout[2*DATAOUT_WIDTH-1:DATAOUT_WIDTH];
 assign o_dataoutc[DATAOUT_WIDTH-1:0] = mega_dataout[3*DATAOUT_WIDTH-1:2*DATAOUT_WIDTH];
 assign o_dataoutd[DATAOUT_WIDTH-1:0] = mega_dataout[4*DATAOUT_WIDTH-1:3*DATAOUT_WIDTH];

endmodule


module vfabric_multiport_lsu_streaming_write(clock, resetn, base_address, size,
									i_dataa, i_dataa_valid, o_dataa_stall, i_datab, i_datab_valid, o_datab_stall,
							 		i_datac, i_datac_valid, o_datac_stall, i_datad, i_datad_valid, o_datad_stall,
								 	avm_readdata, avm_readdatavalid, avm_waitrequest,
								 	avm_address, avm_read, avm_write, 
								 	avm_writeack, avm_writedata, avm_byteenable, 
								 	avm_burstcount, o_dataout_valid, i_dataout_stall);
parameter LSU_AWIDTH = 32;
parameter WIDTH_BYTES = 16;
parameter DATA_WIDTH = 32;
parameter LSU_DATA_WIDTH = 128;

 input clock, resetn;
 input [LSU_AWIDTH-1:0] base_address;
 input [DATA_WIDTH-1:0] size;
 input [DATA_WIDTH-1:0] i_dataa;
 input [DATA_WIDTH-1:0] i_datab;
 input [DATA_WIDTH-1:0] i_datac;
 input [DATA_WIDTH-1:0] i_datad;
 input i_dataa_valid, i_datab_valid, i_datac_valid, i_datad_valid;
 output o_dataa_stall, o_datab_stall, o_datac_stall, o_datad_stall;
 
 input [255:0] avm_readdata;
 input avm_readdatavalid;
 input avm_waitrequest;
 output [31:0] avm_address;
 output avm_read;
 output avm_write;
 input avm_writeack;
 output [255:0] avm_writedata;
 output [31:0] avm_byteenable;
 output [5:0] avm_burstcount;
 
 input i_dataout_stall;
 output o_dataout_valid;

 wire [DATA_WIDTH-1:0] dataa;
 wire [DATA_WIDTH-1:0] datab;
 wire [DATA_WIDTH-1:0] datac;
 wire [DATA_WIDTH-1:0] datad;
 wire fifo_a_valid_out;
 wire fifo_b_valid_out;
 wire fifo_c_valid_out;
 wire fifo_d_valid_out;
 wire are_fifos_valid;
 wire are_fifos_stalled;
 wire is_lsu_stalled;
 
 vfabric_buffered_fifo fifo_a ( .clock(clock), .resetn(resetn), .data_in(i_dataa), .data_out(dataa), .valid_in(i_dataa_valid),
						 .valid_out( fifo_a_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_dataa_stall) );
 defparam fifo_a.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_a.DEPTH = 16;
 
 vfabric_buffered_fifo fifo_b ( .clock(clock), .resetn(resetn), .data_in(i_datab), .data_out(datab), .valid_in(i_datab_valid),
						 .valid_out( fifo_b_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_datab_stall) );
 defparam fifo_b.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_b.DEPTH = 16;
 
 vfabric_buffered_fifo fifo_c ( .clock(clock), .resetn(resetn), .data_in(i_datac), .data_out(datac), .valid_in(i_datac_valid),
						 .valid_out( fifo_c_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_datac_stall) );
 defparam fifo_c.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_c.DEPTH = 16;
 
 vfabric_buffered_fifo fifo_d ( .clock(clock), .resetn(resetn), .data_in(i_datad), .data_out(datad), .valid_in(i_datad_valid),
						 .valid_out( fifo_d_valid_out ), .stall_in(are_fifos_stalled), .stall_out(o_datad_stall) );
 defparam fifo_d.DATA_WIDTH = DATA_WIDTH;
 defparam fifo_d.DEPTH = 16;
 
 assign are_fifos_valid = fifo_a_valid_out & fifo_b_valid_out & fifo_c_valid_out & fifo_d_valid_out;
 assign are_fifos_stalled = ~(fifo_a_valid_out & fifo_b_valid_out & fifo_c_valid_out & fifo_d_valid_out & ~is_lsu_stalled);
 
 lsu_streaming_write lsu0 (.clk(clock), .resetn(resetn),
				.i_nop( 1'b0 ), .base_address(base_address), .size(size),
				.i_writedata({datad, datac, datab, dataa}),
				.i_valid(are_fifos_valid), .o_stall(is_lsu_stalled),				
				.o_valid(o_dataout_valid), 
				.i_stall(i_dataout_stall),
				.avm_write(avm_write),
				.avm_writeack(avm_writeack),
				.avm_writedata(avm_writedata),
				.avm_byteenable(avm_byteenable),
				.avm_waitrequest(avm_waitrequest),
				.avm_address(avm_address),
				.avm_burstcount(avm_burstcount));
 defparam lsu0.AWIDTH = LSU_AWIDTH;
 defparam lsu0.WIDTH_BYTES=WIDTH_BYTES;
 
endmodule
