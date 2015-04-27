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
    

`timescale 1ns / 1ps

module acl_ic_local_mem_router #(    
    parameter integer DATA_W = 256,
    parameter integer BURSTCOUNT_W = 6,
    parameter integer ADDRESS_W = 32,
    parameter integer BYTEENA_W = DATA_W / 8,

    parameter integer NUM_BANKS = 8
)
(
    input logic clock,
    input logic resetn,

    // Bank select (one-hot)
    input logic [NUM_BANKS-1:0] bank_select,

    // Master
    input logic m_arb_request,
    input logic m_arb_read,
    input logic m_arb_write,
    input logic [DATA_W-1:0] m_arb_writedata,
    input logic [BURSTCOUNT_W-1:0] m_arb_burstcount,
    input logic [ADDRESS_W-1:0] m_arb_address,
    input logic [BYTEENA_W-1:0] m_arb_byteenable,

    output logic m_arb_stall,

    output logic m_wrp_ack,

    output logic m_rrp_datavalid,
    output logic [DATA_W-1:0] m_rrp_data,

    // To each bank
    output logic b_arb_request [NUM_BANKS],
    output logic b_arb_read [NUM_BANKS],
    output logic b_arb_write [NUM_BANKS],
    output logic [DATA_W-1:0] b_arb_writedata [NUM_BANKS],
    output logic [BURSTCOUNT_W-1:0] b_arb_burstcount [NUM_BANKS],
    output logic [ADDRESS_W-$clog2(NUM_BANKS)-1:0] b_arb_address [NUM_BANKS],
    output logic [BYTEENA_W-1:0] b_arb_byteenable [NUM_BANKS],

    input logic b_arb_stall [NUM_BANKS],

    input logic b_wrp_ack [NUM_BANKS],

    input logic b_rrp_datavalid [NUM_BANKS],
    input logic [DATA_W-1:0] b_rrp_data [NUM_BANKS]
);
    integer i;

    always_comb
    begin
        m_arb_stall = 1'b0;
        m_wrp_ack = 1'b0;
        m_rrp_datavalid = 1'b0;
        m_rrp_data = '0;

        for( i = 0; i < NUM_BANKS; i = i + 1 )
        begin:b
            b_arb_request[i] = m_arb_request & bank_select[i];
            b_arb_read[i] = m_arb_read & bank_select[i];
            b_arb_write[i] = m_arb_write & bank_select[i];
            b_arb_writedata[i] = m_arb_writedata;
            b_arb_burstcount[i] = m_arb_burstcount;
            b_arb_address[i] = m_arb_address[ADDRESS_W-$clog2(NUM_BANKS)-1:0];
            b_arb_byteenable[i] = m_arb_byteenable;

            m_arb_stall |= b_arb_stall[i] & bank_select[i];

            m_wrp_ack |= b_wrp_ack[i];
            m_rrp_datavalid |= b_rrp_datavalid[i];
            m_rrp_data |= (b_rrp_datavalid[i] ? b_rrp_data[i] : '0);
        end
    end

    // Simulation-only assert - should eventually become hardware exception
    // Check that only one return path has active data.  Colliding rrps
    // will lead to incorrect data, and may mean that there is a mismatch in
    // arbitration latency.
    // synthesis_off
    always @(posedge clock)
    begin
        logic [NUM_BANKS-1:0] b_rrp_datavalid_packed;
        for(int bitnum = 0; bitnum < NUM_BANKS; bitnum++ )
        begin
            b_rrp_datavalid_packed[bitnum] = b_rrp_datavalid[bitnum];
        end

        #1 assert ($onehot0(b_rrp_datavalid_packed))
            else $fatal(0,"Local memory router: rrp collision.  Data corrupted");
    end
    // synthesis_on


endmodule

