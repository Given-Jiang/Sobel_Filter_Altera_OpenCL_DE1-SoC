module acl_direction_splitter #
(
    parameter WIDTH_D = 256,
    parameter S_WIDTH_A = 26,
    parameter NUM_BANKS = 2,
    parameter M_WIDTH_A = S_WIDTH_A+$clog2(WIDTH_D/8), 
    parameter BURSTCOUNT_WIDTH = 6,
    parameter BYTEENABLE_WIDTH = WIDTH_D,
    parameter MAX_PENDING_READS = 64
)
(
    input clk,
    input resetn,

    // Slave port
    input [S_WIDTH_A-1:0] slave_address,  // Word address
    input [WIDTH_D-1:0] slave_writedata,
    input slave_read,
    input slave_write,
    input [BURSTCOUNT_WIDTH-1:0] slave_burstcount,
    input [BYTEENABLE_WIDTH-1:0] slave_byteenable,
    output slave_waitrequest,
    output [WIDTH_D-1:0] slave_readdata,
    output slave_readdatavalid,

    output [M_WIDTH_A-1:0] r_address,  // Byte address
    output r_read,
    output [BURSTCOUNT_WIDTH-1:0] r_burstcount,
    input r_waitrequest,
    input [WIDTH_D-1:0] r_readdata,
    input r_readdatavalid,

    output [M_WIDTH_A-1:0] w_address,  // Byte address
    output [WIDTH_D-1:0] w_writedata,
    output w_write,
    output [BURSTCOUNT_WIDTH-1:0] w_burstcount,
    output [BYTEENABLE_WIDTH-1:0] w_byteenable,
    input w_waitrequest
);

assign r_read = slave_read;
assign r_burstcount = slave_burstcount;
assign r_address = {slave_address,{$clog2(WIDTH_D/8){1'b0}}}; //byteaddr

assign w_write = slave_write;
assign w_writedata = slave_writedata;
assign w_burstcount = slave_burstcount;
assign w_address = {slave_address,{$clog2(WIDTH_D/8){1'b0}}}; //byteaddr
assign w_byteenable = slave_byteenable;

assign slave_waitrequest = (slave_read & r_waitrequest) | (slave_write & w_waitrequest);
assign slave_readdata = r_readdata;
assign slave_readdatavalid = r_readdatavalid;

endmodule
