/////////////////////////////////////////////////////////////////
// MODULE Sobel_system
/////////////////////////////////////////////////////////////////
module Sobel_system
(
   input logic clock,
   input logic clock2x,
   input logic resetn,
   // AVS avs_sobel_cra
   input logic avs_sobel_cra_read,
   input logic avs_sobel_cra_write,
   input logic [3:0] avs_sobel_cra_address,
   input logic [63:0] avs_sobel_cra_writedata,
   input logic [7:0] avs_sobel_cra_byteenable,
   output logic avs_sobel_cra_waitrequest,
   output logic [63:0] avs_sobel_cra_readdata,
   output logic avs_sobel_cra_readdatavalid,
   output logic kernel_irq,
   // AVM avm_memgmem0_port_0_0_rw
   output logic avm_memgmem0_port_0_0_rw_read,
   output logic avm_memgmem0_port_0_0_rw_write,
   output logic [4:0] avm_memgmem0_port_0_0_rw_burstcount,
   output logic [29:0] avm_memgmem0_port_0_0_rw_address,
   output logic [255:0] avm_memgmem0_port_0_0_rw_writedata,
   output logic [31:0] avm_memgmem0_port_0_0_rw_byteenable,
   input logic avm_memgmem0_port_0_0_rw_waitrequest,
   input logic [255:0] avm_memgmem0_port_0_0_rw_readdata,
   input logic avm_memgmem0_port_0_0_rw_readdatavalid,
   input logic avm_memgmem0_port_0_0_rw_writeack
);
   genvar i;
   logic kernel_irqs;
   logic gmem0_global_avm_read [2];
   logic gmem0_global_avm_write [2];
   logic [4:0] gmem0_global_avm_burstcount [2];
   logic [29:0] gmem0_global_avm_address [2];
   logic [255:0] gmem0_global_avm_writedata [2];
   logic [31:0] gmem0_global_avm_byteenable [2];
   logic gmem0_global_avm_waitrequest [2];
   logic [255:0] gmem0_global_avm_readdata [2];
   logic gmem0_global_avm_readdatavalid [2];
   logic gmem0_global_avm_writeack [2];

   // INST sobel of sobel_top_wrapper
   sobel_top_wrapper sobel
   (
      .clock(clock),
      .clock2x(clock2x),
      .resetn(resetn),
      .cra_irq(kernel_irqs),
      // AVS avs_cra
      .avs_cra_read(avs_sobel_cra_read),
      .avs_cra_write(avs_sobel_cra_write),
      .avs_cra_address(avs_sobel_cra_address),
      .avs_cra_writedata(avs_sobel_cra_writedata),
      .avs_cra_byteenable(avs_sobel_cra_byteenable),
      .avs_cra_waitrequest(avs_sobel_cra_waitrequest),
      .avs_cra_readdata(avs_sobel_cra_readdata),
      .avs_cra_readdatavalid(avs_sobel_cra_readdatavalid),
      // AVM avm_local_bb1_ld__inst0
      .avm_local_bb1_ld__inst0_read(gmem0_global_avm_read[0]),
      .avm_local_bb1_ld__inst0_write(gmem0_global_avm_write[0]),
      .avm_local_bb1_ld__inst0_burstcount(gmem0_global_avm_burstcount[0]),
      .avm_local_bb1_ld__inst0_address(gmem0_global_avm_address[0]),
      .avm_local_bb1_ld__inst0_writedata(gmem0_global_avm_writedata[0]),
      .avm_local_bb1_ld__inst0_byteenable(gmem0_global_avm_byteenable[0]),
      .avm_local_bb1_ld__inst0_waitrequest(gmem0_global_avm_waitrequest[0]),
      .avm_local_bb1_ld__inst0_readdata(gmem0_global_avm_readdata[0]),
      .avm_local_bb1_ld__inst0_readdatavalid(gmem0_global_avm_readdatavalid[0]),
      .avm_local_bb1_ld__inst0_writeack(gmem0_global_avm_writeack[0]),
      // AVM avm_local_bb1_st_add43_lobit_inst0
      .avm_local_bb1_st_add43_lobit_inst0_read(gmem0_global_avm_read[1]),
      .avm_local_bb1_st_add43_lobit_inst0_write(gmem0_global_avm_write[1]),
      .avm_local_bb1_st_add43_lobit_inst0_burstcount(gmem0_global_avm_burstcount[1]),
      .avm_local_bb1_st_add43_lobit_inst0_address(gmem0_global_avm_address[1]),
      .avm_local_bb1_st_add43_lobit_inst0_writedata(gmem0_global_avm_writedata[1]),
      .avm_local_bb1_st_add43_lobit_inst0_byteenable(gmem0_global_avm_byteenable[1]),
      .avm_local_bb1_st_add43_lobit_inst0_waitrequest(gmem0_global_avm_waitrequest[1]),
      .avm_local_bb1_st_add43_lobit_inst0_readdata(gmem0_global_avm_readdata[1]),
      .avm_local_bb1_st_add43_lobit_inst0_readdatavalid(gmem0_global_avm_readdatavalid[1]),
      .avm_local_bb1_st_add43_lobit_inst0_writeack(gmem0_global_avm_writeack[1])
   );

   assign kernel_irq = |kernel_irqs;
   generate
   begin:gmem0_
      logic gmem0_icm_in_arb_request [2];
      logic gmem0_icm_in_arb_read [2];
      logic gmem0_icm_in_arb_write [2];
      logic [4:0] gmem0_icm_in_arb_burstcount [2];
      logic [24:0] gmem0_icm_in_arb_address [2];
      logic [255:0] gmem0_icm_in_arb_writedata [2];
      logic [31:0] gmem0_icm_in_arb_byteenable [2];
      logic gmem0_icm_in_arb_stall [2];
      logic gmem0_icm_in_wrp_ack [2];
      logic gmem0_icm_in_rrp_datavalid [2];
      logic [255:0] gmem0_icm_in_rrp_data [2];
      logic gmem0_icm_preroute_arb_request [2];
      logic gmem0_icm_preroute_arb_read [2];
      logic gmem0_icm_preroute_arb_write [2];
      logic [4:0] gmem0_icm_preroute_arb_burstcount [2];
      logic [24:0] gmem0_icm_preroute_arb_address [2];
      logic [255:0] gmem0_icm_preroute_arb_writedata [2];
      logic [31:0] gmem0_icm_preroute_arb_byteenable [2];
      logic gmem0_icm_preroute_arb_stall [2];
      logic gmem0_icm_preroute_wrp_ack [2];
      logic gmem0_icm_preroute_rrp_datavalid [2];
      logic [255:0] gmem0_icm_preroute_rrp_data [2];
      logic icm_groupgmem0_router_0_arb_request [1];
      logic icm_groupgmem0_router_0_arb_read [1];
      logic icm_groupgmem0_router_0_arb_write [1];
      logic [4:0] icm_groupgmem0_router_0_arb_burstcount [1];
      logic [24:0] icm_groupgmem0_router_0_arb_address [1];
      logic [255:0] icm_groupgmem0_router_0_arb_writedata [1];
      logic [31:0] icm_groupgmem0_router_0_arb_byteenable [1];
      logic icm_groupgmem0_router_0_arb_stall [1];
      logic icm_groupgmem0_router_0_wrp_ack [1];
      logic icm_groupgmem0_router_0_rrp_datavalid [1];
      logic [255:0] icm_groupgmem0_router_0_rrp_data [1];
      logic icm_groupgmem0_router_1_arb_request [1];
      logic icm_groupgmem0_router_1_arb_read [1];
      logic icm_groupgmem0_router_1_arb_write [1];
      logic [4:0] icm_groupgmem0_router_1_arb_burstcount [1];
      logic [24:0] icm_groupgmem0_router_1_arb_address [1];
      logic [255:0] icm_groupgmem0_router_1_arb_writedata [1];
      logic [31:0] icm_groupgmem0_router_1_arb_byteenable [1];
      logic icm_groupgmem0_router_1_arb_stall [1];
      logic icm_groupgmem0_router_1_wrp_ack [1];
      logic icm_groupgmem0_router_1_rrp_datavalid [1];
      logic [255:0] icm_groupgmem0_router_1_rrp_data [1];
      logic icm_out_0_rw_arb_request [1];
      logic icm_out_0_rw_arb_read [1];
      logic icm_out_0_rw_arb_write [1];
      logic [4:0] icm_out_0_rw_arb_burstcount [1];
      logic [24:0] icm_out_0_rw_arb_address [1];
      logic [255:0] icm_out_0_rw_arb_writedata [1];
      logic [31:0] icm_out_0_rw_arb_byteenable [1];
      logic icm_out_0_rw_arb_id [1];
      logic icm_out_0_rw_arb_stall [1];
      logic icm_out_0_rw_wrp_ack [1];
      logic icm_out_0_rw_rrp_datavalid [1];
      logic [255:0] icm_out_0_rw_rrp_data [1];
      logic icm_routedgmem0_port_0_0_rw_arb_request [2];
      logic icm_routedgmem0_port_0_0_rw_arb_read [2];
      logic icm_routedgmem0_port_0_0_rw_arb_write [2];
      logic [4:0] icm_routedgmem0_port_0_0_rw_arb_burstcount [2];
      logic [24:0] icm_routedgmem0_port_0_0_rw_arb_address [2];
      logic [255:0] icm_routedgmem0_port_0_0_rw_arb_writedata [2];
      logic [31:0] icm_routedgmem0_port_0_0_rw_arb_byteenable [2];
      logic icm_routedgmem0_port_0_0_rw_arb_stall [2];
      logic icm_routedgmem0_port_0_0_rw_wrp_ack [2];
      logic icm_routedgmem0_port_0_0_rw_rrp_datavalid [2];
      logic [255:0] icm_routedgmem0_port_0_0_rw_rrp_data [2];

      for( i = 0; i < 2; i = i + 1 )
      begin:t
         // INST gmem0_avm_to_ic of acl_avm_to_ic
         acl_avm_to_ic
         #(
            .DATA_W(256),
            .WRITEDATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(30),
            .BYTEENA_W(32)
         )
         gmem0_avm_to_ic
         (
            // AVM avm
            .avm_read(gmem0_global_avm_read[i]),
            .avm_write(gmem0_global_avm_write[i]),
            .avm_burstcount(gmem0_global_avm_burstcount[i]),
            .avm_address(gmem0_global_avm_address[i]),
            .avm_writedata(gmem0_global_avm_writedata[i]),
            .avm_byteenable(gmem0_global_avm_byteenable[i]),
            .avm_waitrequest(gmem0_global_avm_waitrequest[i]),
            .avm_readdata(gmem0_global_avm_readdata[i]),
            .avm_readdatavalid(gmem0_global_avm_readdatavalid[i]),
            .avm_writeack(gmem0_global_avm_writeack[i]),
            // ICM ic
            .ic_arb_request(gmem0_icm_in_arb_request[i]),
            .ic_arb_read(gmem0_icm_in_arb_read[i]),
            .ic_arb_write(gmem0_icm_in_arb_write[i]),
            .ic_arb_burstcount(gmem0_icm_in_arb_burstcount[i]),
            .ic_arb_address(gmem0_icm_in_arb_address[i]),
            .ic_arb_writedata(gmem0_icm_in_arb_writedata[i]),
            .ic_arb_byteenable(gmem0_icm_in_arb_byteenable[i]),
            .ic_arb_stall(gmem0_icm_in_arb_stall[i]),
            .ic_wrp_ack(gmem0_icm_in_wrp_ack[i]),
            .ic_rrp_datavalid(gmem0_icm_in_rrp_datavalid[i]),
            .ic_rrp_data(gmem0_icm_in_rrp_data[i])
         );

      end

      assign icm_groupgmem0_router_0_arb_request[0] = gmem0_icm_in_arb_request[1];
      assign icm_groupgmem0_router_0_arb_read[0] = gmem0_icm_in_arb_read[1];
      assign icm_groupgmem0_router_0_arb_write[0] = gmem0_icm_in_arb_write[1];
      assign icm_groupgmem0_router_0_arb_burstcount[0] = gmem0_icm_in_arb_burstcount[1];
      assign icm_groupgmem0_router_0_arb_address[0] = gmem0_icm_in_arb_address[1];
      assign icm_groupgmem0_router_0_arb_writedata[0] = gmem0_icm_in_arb_writedata[1];
      assign icm_groupgmem0_router_0_arb_byteenable[0] = gmem0_icm_in_arb_byteenable[1];
      assign gmem0_icm_in_arb_stall[1] = icm_groupgmem0_router_0_arb_stall[0];
      assign gmem0_icm_in_wrp_ack[1] = icm_groupgmem0_router_0_wrp_ack[0];
      assign gmem0_icm_in_rrp_datavalid[1] = icm_groupgmem0_router_0_rrp_datavalid[0];
      assign gmem0_icm_in_rrp_data[1] = icm_groupgmem0_router_0_rrp_data[0];
      // INST global_ic_preroutegmem0_router_0 of interconnect_0
      interconnect_0 global_ic_preroutegmem0_router_0
      (
         .clock(clock),
         .resetn(resetn),
         // ICM m
         .m_arb_request(icm_groupgmem0_router_0_arb_request),
         .m_arb_read(icm_groupgmem0_router_0_arb_read),
         .m_arb_write(icm_groupgmem0_router_0_arb_write),
         .m_arb_burstcount(icm_groupgmem0_router_0_arb_burstcount),
         .m_arb_address(icm_groupgmem0_router_0_arb_address),
         .m_arb_writedata(icm_groupgmem0_router_0_arb_writedata),
         .m_arb_byteenable(icm_groupgmem0_router_0_arb_byteenable),
         .m_arb_stall(icm_groupgmem0_router_0_arb_stall),
         .m_wrp_ack(icm_groupgmem0_router_0_wrp_ack),
         .m_rrp_datavalid(icm_groupgmem0_router_0_rrp_datavalid),
         .m_rrp_data(icm_groupgmem0_router_0_rrp_data),
         // ICM mout
         .mout_arb_request(gmem0_icm_preroute_arb_request[0]),
         .mout_arb_read(gmem0_icm_preroute_arb_read[0]),
         .mout_arb_write(gmem0_icm_preroute_arb_write[0]),
         .mout_arb_burstcount(gmem0_icm_preroute_arb_burstcount[0]),
         .mout_arb_address(gmem0_icm_preroute_arb_address[0]),
         .mout_arb_writedata(gmem0_icm_preroute_arb_writedata[0]),
         .mout_arb_byteenable(gmem0_icm_preroute_arb_byteenable[0]),
         .mout_arb_id(),
         .mout_arb_stall(gmem0_icm_preroute_arb_stall[0]),
         .mout_wrp_ack(gmem0_icm_preroute_wrp_ack[0]),
         .mout_rrp_datavalid(gmem0_icm_preroute_rrp_datavalid[0]),
         .mout_rrp_data(gmem0_icm_preroute_rrp_data[0])
      );

      assign icm_groupgmem0_router_1_arb_request[0] = gmem0_icm_in_arb_request[0];
      assign icm_groupgmem0_router_1_arb_read[0] = gmem0_icm_in_arb_read[0];
      assign icm_groupgmem0_router_1_arb_write[0] = gmem0_icm_in_arb_write[0];
      assign icm_groupgmem0_router_1_arb_burstcount[0] = gmem0_icm_in_arb_burstcount[0];
      assign icm_groupgmem0_router_1_arb_address[0] = gmem0_icm_in_arb_address[0];
      assign icm_groupgmem0_router_1_arb_writedata[0] = gmem0_icm_in_arb_writedata[0];
      assign icm_groupgmem0_router_1_arb_byteenable[0] = gmem0_icm_in_arb_byteenable[0];
      assign gmem0_icm_in_arb_stall[0] = icm_groupgmem0_router_1_arb_stall[0];
      assign gmem0_icm_in_wrp_ack[0] = icm_groupgmem0_router_1_wrp_ack[0];
      assign gmem0_icm_in_rrp_datavalid[0] = icm_groupgmem0_router_1_rrp_datavalid[0];
      assign gmem0_icm_in_rrp_data[0] = icm_groupgmem0_router_1_rrp_data[0];
      // INST global_ic_preroutegmem0_router_1 of interconnect_1
      interconnect_1 global_ic_preroutegmem0_router_1
      (
         .clock(clock),
         .resetn(resetn),
         // ICM m
         .m_arb_request(icm_groupgmem0_router_1_arb_request),
         .m_arb_read(icm_groupgmem0_router_1_arb_read),
         .m_arb_write(icm_groupgmem0_router_1_arb_write),
         .m_arb_burstcount(icm_groupgmem0_router_1_arb_burstcount),
         .m_arb_address(icm_groupgmem0_router_1_arb_address),
         .m_arb_writedata(icm_groupgmem0_router_1_arb_writedata),
         .m_arb_byteenable(icm_groupgmem0_router_1_arb_byteenable),
         .m_arb_stall(icm_groupgmem0_router_1_arb_stall),
         .m_wrp_ack(icm_groupgmem0_router_1_wrp_ack),
         .m_rrp_datavalid(icm_groupgmem0_router_1_rrp_datavalid),
         .m_rrp_data(icm_groupgmem0_router_1_rrp_data),
         // ICM mout
         .mout_arb_request(gmem0_icm_preroute_arb_request[1]),
         .mout_arb_read(gmem0_icm_preroute_arb_read[1]),
         .mout_arb_write(gmem0_icm_preroute_arb_write[1]),
         .mout_arb_burstcount(gmem0_icm_preroute_arb_burstcount[1]),
         .mout_arb_address(gmem0_icm_preroute_arb_address[1]),
         .mout_arb_writedata(gmem0_icm_preroute_arb_writedata[1]),
         .mout_arb_byteenable(gmem0_icm_preroute_arb_byteenable[1]),
         .mout_arb_id(),
         .mout_arb_stall(gmem0_icm_preroute_arb_stall[1]),
         .mout_wrp_ack(gmem0_icm_preroute_wrp_ack[1]),
         .mout_rrp_datavalid(gmem0_icm_preroute_rrp_datavalid[1]),
         .mout_rrp_data(gmem0_icm_preroute_rrp_data[1])
      );

      for( i = 0; i < 2; i = i + 1 )
      begin:router
         logic b_arb_request [1];
         logic b_arb_read [1];
         logic b_arb_write [1];
         logic [4:0] b_arb_burstcount [1];
         logic [24:0] b_arb_address [1];
         logic [255:0] b_arb_writedata [1];
         logic [31:0] b_arb_byteenable [1];
         logic b_arb_stall [1];
         logic b_wrp_ack [1];
         logic b_rrp_datavalid [1];
         logic [255:0] b_rrp_data [1];
         logic bank_select;

         // INST router of acl_ic_mem_router
         acl_ic_mem_router
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .NUM_BANKS(1)
         )
         router
         (
            .clock(clock),
            .resetn(resetn),
            .bank_select(bank_select),
            // ICM m
            .m_arb_request(gmem0_icm_preroute_arb_request[i]),
            .m_arb_read(gmem0_icm_preroute_arb_read[i]),
            .m_arb_write(gmem0_icm_preroute_arb_write[i]),
            .m_arb_burstcount(gmem0_icm_preroute_arb_burstcount[i]),
            .m_arb_address(gmem0_icm_preroute_arb_address[i]),
            .m_arb_writedata(gmem0_icm_preroute_arb_writedata[i]),
            .m_arb_byteenable(gmem0_icm_preroute_arb_byteenable[i]),
            .m_arb_stall(gmem0_icm_preroute_arb_stall[i]),
            .m_wrp_ack(gmem0_icm_preroute_wrp_ack[i]),
            .m_rrp_datavalid(gmem0_icm_preroute_rrp_datavalid[i]),
            .m_rrp_data(gmem0_icm_preroute_rrp_data[i]),
            // ICM b
            .b_arb_request(b_arb_request),
            .b_arb_read(b_arb_read),
            .b_arb_write(b_arb_write),
            .b_arb_burstcount(b_arb_burstcount),
            .b_arb_address(b_arb_address),
            .b_arb_writedata(b_arb_writedata),
            .b_arb_byteenable(b_arb_byteenable),
            .b_arb_stall(b_arb_stall),
            .b_wrp_ack(b_wrp_ack),
            .b_rrp_datavalid(b_rrp_datavalid),
            .b_rrp_data(b_rrp_data)
         );

         assign bank_select = 1'b1;
      end

      // INST global_icgmem0_port_0_0_rw of interconnect_2
      interconnect_2 global_icgmem0_port_0_0_rw
      (
         .clock(clock),
         .resetn(resetn),
         // ICM m
         .m_arb_request(icm_routedgmem0_port_0_0_rw_arb_request),
         .m_arb_read(icm_routedgmem0_port_0_0_rw_arb_read),
         .m_arb_write(icm_routedgmem0_port_0_0_rw_arb_write),
         .m_arb_burstcount(icm_routedgmem0_port_0_0_rw_arb_burstcount),
         .m_arb_address(icm_routedgmem0_port_0_0_rw_arb_address),
         .m_arb_writedata(icm_routedgmem0_port_0_0_rw_arb_writedata),
         .m_arb_byteenable(icm_routedgmem0_port_0_0_rw_arb_byteenable),
         .m_arb_stall(icm_routedgmem0_port_0_0_rw_arb_stall),
         .m_wrp_ack(icm_routedgmem0_port_0_0_rw_wrp_ack),
         .m_rrp_datavalid(icm_routedgmem0_port_0_0_rw_rrp_datavalid),
         .m_rrp_data(icm_routedgmem0_port_0_0_rw_rrp_data),
         // ICM mout
         .mout_arb_request(icm_out_0_rw_arb_request[0]),
         .mout_arb_read(icm_out_0_rw_arb_read[0]),
         .mout_arb_write(icm_out_0_rw_arb_write[0]),
         .mout_arb_burstcount(icm_out_0_rw_arb_burstcount[0]),
         .mout_arb_address(icm_out_0_rw_arb_address[0]),
         .mout_arb_writedata(icm_out_0_rw_arb_writedata[0]),
         .mout_arb_byteenable(icm_out_0_rw_arb_byteenable[0]),
         .mout_arb_id(icm_out_0_rw_arb_id[0]),
         .mout_arb_stall(icm_out_0_rw_arb_stall[0]),
         .mout_wrp_ack(icm_out_0_rw_wrp_ack[0]),
         .mout_rrp_datavalid(icm_out_0_rw_rrp_datavalid[0]),
         .mout_rrp_data(icm_out_0_rw_rrp_data[0])
      );

      for( i = 0; i < 2; i = i + 1 )
      begin:mgmem0_port_0_0_rw
         assign icm_routedgmem0_port_0_0_rw_arb_request[i] = router[i].b_arb_request[0];
         assign icm_routedgmem0_port_0_0_rw_arb_read[i] = router[i].b_arb_read[0];
         assign icm_routedgmem0_port_0_0_rw_arb_write[i] = router[i].b_arb_write[0];
         assign icm_routedgmem0_port_0_0_rw_arb_burstcount[i] = router[i].b_arb_burstcount[0];
         assign icm_routedgmem0_port_0_0_rw_arb_address[i] = router[i].b_arb_address[0];
         assign icm_routedgmem0_port_0_0_rw_arb_writedata[i] = router[i].b_arb_writedata[0];
         assign icm_routedgmem0_port_0_0_rw_arb_byteenable[i] = router[i].b_arb_byteenable[0];
         assign router[i].b_arb_stall[0] = icm_routedgmem0_port_0_0_rw_arb_stall[i];
         assign router[i].b_wrp_ack[0] = icm_routedgmem0_port_0_0_rw_wrp_ack[i];
         assign router[i].b_rrp_datavalid[0] = icm_routedgmem0_port_0_0_rw_rrp_datavalid[i];
         assign router[i].b_rrp_data[0] = icm_routedgmem0_port_0_0_rw_rrp_data[i];
      end

      // INST global_out_ic_to_avmgmem0_port_0_0_rw of acl_ic_to_avm
      acl_ic_to_avm
      #(
         .DATA_W(256),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(30),
         .BYTEENA_W(32),
         .ID_W(1)
      )
      global_out_ic_to_avmgmem0_port_0_0_rw
      (
         // ICM ic
         .ic_arb_request(icm_out_0_rw_arb_request[0]),
         .ic_arb_read(icm_out_0_rw_arb_read[0]),
         .ic_arb_write(icm_out_0_rw_arb_write[0]),
         .ic_arb_burstcount(icm_out_0_rw_arb_burstcount[0]),
         .ic_arb_address(icm_out_0_rw_arb_address[0]),
         .ic_arb_writedata(icm_out_0_rw_arb_writedata[0]),
         .ic_arb_byteenable(icm_out_0_rw_arb_byteenable[0]),
         .ic_arb_id(icm_out_0_rw_arb_id[0]),
         .ic_arb_stall(icm_out_0_rw_arb_stall[0]),
         .ic_wrp_ack(icm_out_0_rw_wrp_ack[0]),
         .ic_rrp_datavalid(icm_out_0_rw_rrp_datavalid[0]),
         .ic_rrp_data(icm_out_0_rw_rrp_data[0]),
         // AVM avm
         .avm_read(avm_memgmem0_port_0_0_rw_read),
         .avm_write(avm_memgmem0_port_0_0_rw_write),
         .avm_burstcount(avm_memgmem0_port_0_0_rw_burstcount),
         .avm_address(avm_memgmem0_port_0_0_rw_address),
         .avm_writedata(avm_memgmem0_port_0_0_rw_writedata),
         .avm_byteenable(avm_memgmem0_port_0_0_rw_byteenable),
         .avm_waitrequest(avm_memgmem0_port_0_0_rw_waitrequest),
         .avm_readdata(avm_memgmem0_port_0_0_rw_readdata),
         .avm_readdatavalid(avm_memgmem0_port_0_0_rw_readdatavalid),
         .avm_writeack(avm_memgmem0_port_0_0_rw_writeack)
      );

   end
   endgenerate

endmodule

/////////////////////////////////////////////////////////////////
// MODULE sobel_top_wrapper
/////////////////////////////////////////////////////////////////
module sobel_top_wrapper
(
   input logic clock,
   input logic clock2x,
   input logic resetn,
   output logic cra_irq,
   // AVS avs_cra
   input logic avs_cra_read,
   input logic avs_cra_write,
   input logic [3:0] avs_cra_address,
   input logic [63:0] avs_cra_writedata,
   input logic [7:0] avs_cra_byteenable,
   output logic avs_cra_waitrequest,
   output logic [63:0] avs_cra_readdata,
   output logic avs_cra_readdatavalid,
   // AVM avm_local_bb1_ld__inst0
   output logic avm_local_bb1_ld__inst0_read,
   output logic avm_local_bb1_ld__inst0_write,
   output logic [4:0] avm_local_bb1_ld__inst0_burstcount,
   output logic [29:0] avm_local_bb1_ld__inst0_address,
   output logic [255:0] avm_local_bb1_ld__inst0_writedata,
   output logic [31:0] avm_local_bb1_ld__inst0_byteenable,
   input logic avm_local_bb1_ld__inst0_waitrequest,
   input logic [255:0] avm_local_bb1_ld__inst0_readdata,
   input logic avm_local_bb1_ld__inst0_readdatavalid,
   input logic avm_local_bb1_ld__inst0_writeack,
   // AVM avm_local_bb1_st_add43_lobit_inst0
   output logic avm_local_bb1_st_add43_lobit_inst0_read,
   output logic avm_local_bb1_st_add43_lobit_inst0_write,
   output logic [4:0] avm_local_bb1_st_add43_lobit_inst0_burstcount,
   output logic [29:0] avm_local_bb1_st_add43_lobit_inst0_address,
   output logic [255:0] avm_local_bb1_st_add43_lobit_inst0_writedata,
   output logic [31:0] avm_local_bb1_st_add43_lobit_inst0_byteenable,
   input logic avm_local_bb1_st_add43_lobit_inst0_waitrequest,
   input logic [255:0] avm_local_bb1_st_add43_lobit_inst0_readdata,
   input logic avm_local_bb1_st_add43_lobit_inst0_readdatavalid,
   input logic avm_local_bb1_st_add43_lobit_inst0_writeack
);
   logic lmem_invalid_single_bit;

   // INST kernel of sobel_function_wrapper
   sobel_function_wrapper kernel
   (
      .local_router_hang(lmem_invalid_single_bit),
      .clock(clock),
      .clock2x(clock2x),
      .resetn(resetn),
      .cra_irq(cra_irq),
      // AVS avs_cra
      .avs_cra_read(avs_cra_read),
      .avs_cra_write(avs_cra_write),
      .avs_cra_address(avs_cra_address),
      .avs_cra_writedata(avs_cra_writedata),
      .avs_cra_byteenable(avs_cra_byteenable),
      .avs_cra_waitrequest(avs_cra_waitrequest),
      .avs_cra_readdata(avs_cra_readdata),
      .avs_cra_readdatavalid(avs_cra_readdatavalid),
      // AVM avm_local_bb1_ld__inst0
      .avm_local_bb1_ld__inst0_read(avm_local_bb1_ld__inst0_read),
      .avm_local_bb1_ld__inst0_write(avm_local_bb1_ld__inst0_write),
      .avm_local_bb1_ld__inst0_burstcount(avm_local_bb1_ld__inst0_burstcount),
      .avm_local_bb1_ld__inst0_address(avm_local_bb1_ld__inst0_address),
      .avm_local_bb1_ld__inst0_writedata(avm_local_bb1_ld__inst0_writedata),
      .avm_local_bb1_ld__inst0_byteenable(avm_local_bb1_ld__inst0_byteenable),
      .avm_local_bb1_ld__inst0_waitrequest(avm_local_bb1_ld__inst0_waitrequest),
      .avm_local_bb1_ld__inst0_readdata(avm_local_bb1_ld__inst0_readdata),
      .avm_local_bb1_ld__inst0_readdatavalid(avm_local_bb1_ld__inst0_readdatavalid),
      .avm_local_bb1_ld__inst0_writeack(avm_local_bb1_ld__inst0_writeack),
      // AVM avm_local_bb1_st_add43_lobit_inst0
      .avm_local_bb1_st_add43_lobit_inst0_read(avm_local_bb1_st_add43_lobit_inst0_read),
      .avm_local_bb1_st_add43_lobit_inst0_write(avm_local_bb1_st_add43_lobit_inst0_write),
      .avm_local_bb1_st_add43_lobit_inst0_burstcount(avm_local_bb1_st_add43_lobit_inst0_burstcount),
      .avm_local_bb1_st_add43_lobit_inst0_address(avm_local_bb1_st_add43_lobit_inst0_address),
      .avm_local_bb1_st_add43_lobit_inst0_writedata(avm_local_bb1_st_add43_lobit_inst0_writedata),
      .avm_local_bb1_st_add43_lobit_inst0_byteenable(avm_local_bb1_st_add43_lobit_inst0_byteenable),
      .avm_local_bb1_st_add43_lobit_inst0_waitrequest(avm_local_bb1_st_add43_lobit_inst0_waitrequest),
      .avm_local_bb1_st_add43_lobit_inst0_readdata(avm_local_bb1_st_add43_lobit_inst0_readdata),
      .avm_local_bb1_st_add43_lobit_inst0_readdatavalid(avm_local_bb1_st_add43_lobit_inst0_readdatavalid),
      .avm_local_bb1_st_add43_lobit_inst0_writeack(avm_local_bb1_st_add43_lobit_inst0_writeack)
   );

   assign lmem_invalid_single_bit = 'b0;
endmodule

/////////////////////////////////////////////////////////////////
// MODULE interconnect_0
/////////////////////////////////////////////////////////////////
module interconnect_0
(
   input logic clock,
   input logic resetn,
   // ICM m
   input logic m_arb_request [1],
   input logic m_arb_read [1],
   input logic m_arb_write [1],
   input logic [4:0] m_arb_burstcount [1],
   input logic [24:0] m_arb_address [1],
   input logic [255:0] m_arb_writedata [1],
   input logic [31:0] m_arb_byteenable [1],
   output logic m_arb_stall [1],
   output logic m_wrp_ack [1],
   output logic m_rrp_datavalid [1],
   output logic [255:0] m_rrp_data [1],
   // ICM mout
   output logic mout_arb_request,
   output logic mout_arb_read,
   output logic mout_arb_write,
   output logic [4:0] mout_arb_burstcount,
   output logic [24:0] mout_arb_address,
   output logic [255:0] mout_arb_writedata,
   output logic [31:0] mout_arb_byteenable,
   output logic mout_arb_id,
   input logic mout_arb_stall,
   input logic mout_wrp_ack,
   input logic mout_rrp_datavalid,
   input logic [255:0] mout_rrp_data
);
   genvar i;
   generate
      for( i = 0; i < 1; i = i + 1 )
      begin:m
         logic id;
         acl_ic_master_intf
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1)
         ) m_intf();
         acl_arb_intf
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1)
         ) arb_intf();
         acl_ic_wrp_intf
         #(
            .ID_W(1)
         ) wrp_intf();
         acl_ic_rrp_intf
         #(
            .DATA_W(256),
            .ID_W(1)
         ) rrp_intf();

         assign id = i;
         // INST m_endp of acl_ic_master_endpoint
         acl_ic_master_endpoint
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1),
            .TOTAL_NUM_MASTERS(1),
            .ID(i)
         )
         m_endp
         (
            .clock(clock),
            .resetn(resetn),
            .m_intf(m_intf),
            .arb_intf(arb_intf),
            .wrp_intf(wrp_intf),
            .rrp_intf(rrp_intf)
         );

         assign m_intf.arb.req.request = m_arb_request[i];
         assign m_intf.arb.req.read = m_arb_read[i];
         assign m_intf.arb.req.write = m_arb_write[i];
         assign m_intf.arb.req.burstcount = m_arb_burstcount[i];
         assign m_intf.arb.req.address = m_arb_address[i];
         assign m_intf.arb.req.writedata = m_arb_writedata[i];
         assign m_intf.arb.req.byteenable = m_arb_byteenable[i];
         assign m_arb_stall[i] = m_intf.arb.stall;
         assign m_wrp_ack[i] = m_intf.wrp.ack;
         assign m_rrp_datavalid[i] = m_intf.rrp.datavalid;
         assign m_rrp_data[i] = m_intf.rrp.data;
         assign m_intf.arb.req.id = id;
      end

   endgenerate

   generate
   begin:s
      acl_arb_intf
      #(
         .DATA_W(256),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(32),
         .ID_W(1)
      ) in_arb_intf();
      acl_arb_intf
      #(
         .DATA_W(256),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(32),
         .ID_W(1)
      ) out_arb_intf();
      acl_ic_wrp_intf
      #(
         .ID_W(1)
      ) wrp_intf();
      acl_ic_rrp_intf
      #(
         .DATA_W(256),
         .ID_W(1)
      ) rrp_intf();

      // INST s_endp of acl_ic_slave_endpoint
      acl_ic_slave_endpoint
      #(
         .DATA_W(256),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(32),
         .ID_W(1),
         .NUM_MASTERS(1),
         .PIPELINE_RETURN_PATHS(1),
         .WRP_FIFO_DEPTH(64),
         .RRP_FIFO_DEPTH(64),
         .RRP_USE_LL_FIFO(1),
         .SLAVE_FIXED_LATENCY(0),
         .SEPARATE_READ_WRITE_STALLS(0)
      )
      s_endp
      (
         .clock(clock),
         .resetn(resetn),
         .m_intf(in_arb_intf),
         .s_intf(out_arb_intf),
         .s_readdatavalid(mout_rrp_datavalid),
         .s_readdata(mout_rrp_data),
         .s_writeack(mout_wrp_ack),
         .wrp_intf(wrp_intf),
         .rrp_intf(rrp_intf)
      );

   end
   endgenerate

   generate
   begin:wrp
      assign m[0].wrp_intf.ack = s.wrp_intf.ack;
      assign m[0].wrp_intf.id = s.wrp_intf.id;
   end
   endgenerate

   generate
   begin:rrp
   end
   endgenerate

   assign mout_arb_request = s.out_arb_intf.req.request;
   assign mout_arb_read = s.out_arb_intf.req.read;
   assign mout_arb_write = s.out_arb_intf.req.write;
   assign mout_arb_burstcount = s.out_arb_intf.req.burstcount;
   assign mout_arb_address = s.out_arb_intf.req.address;
   assign mout_arb_writedata = s.out_arb_intf.req.writedata;
   assign mout_arb_byteenable = s.out_arb_intf.req.byteenable;
   assign mout_arb_id = s.out_arb_intf.req.id;
   assign s.out_arb_intf.stall = mout_arb_stall;
   assign s.in_arb_intf.req = m[0].arb_intf.req;
   assign m[0].arb_intf.stall = s.in_arb_intf.stall;
endmodule

/////////////////////////////////////////////////////////////////
// MODULE interconnect_1
/////////////////////////////////////////////////////////////////
module interconnect_1
(
   input logic clock,
   input logic resetn,
   // ICM m
   input logic m_arb_request [1],
   input logic m_arb_read [1],
   input logic m_arb_write [1],
   input logic [4:0] m_arb_burstcount [1],
   input logic [24:0] m_arb_address [1],
   input logic [255:0] m_arb_writedata [1],
   input logic [31:0] m_arb_byteenable [1],
   output logic m_arb_stall [1],
   output logic m_wrp_ack [1],
   output logic m_rrp_datavalid [1],
   output logic [255:0] m_rrp_data [1],
   // ICM mout
   output logic mout_arb_request,
   output logic mout_arb_read,
   output logic mout_arb_write,
   output logic [4:0] mout_arb_burstcount,
   output logic [24:0] mout_arb_address,
   output logic [255:0] mout_arb_writedata,
   output logic [31:0] mout_arb_byteenable,
   output logic mout_arb_id,
   input logic mout_arb_stall,
   input logic mout_wrp_ack,
   input logic mout_rrp_datavalid,
   input logic [255:0] mout_rrp_data
);
   genvar i;
   generate
      for( i = 0; i < 1; i = i + 1 )
      begin:m
         logic id;
         acl_ic_master_intf
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1)
         ) m_intf();
         acl_arb_intf
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1)
         ) arb_intf();
         acl_ic_wrp_intf
         #(
            .ID_W(1)
         ) wrp_intf();
         acl_ic_rrp_intf
         #(
            .DATA_W(256),
            .ID_W(1)
         ) rrp_intf();

         assign id = i;
         // INST m_endp of acl_ic_master_endpoint
         acl_ic_master_endpoint
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1),
            .TOTAL_NUM_MASTERS(1),
            .ID(i)
         )
         m_endp
         (
            .clock(clock),
            .resetn(resetn),
            .m_intf(m_intf),
            .arb_intf(arb_intf),
            .wrp_intf(wrp_intf),
            .rrp_intf(rrp_intf)
         );

         assign m_intf.arb.req.request = m_arb_request[i];
         assign m_intf.arb.req.read = m_arb_read[i];
         assign m_intf.arb.req.write = m_arb_write[i];
         assign m_intf.arb.req.burstcount = m_arb_burstcount[i];
         assign m_intf.arb.req.address = m_arb_address[i];
         assign m_intf.arb.req.writedata = m_arb_writedata[i];
         assign m_intf.arb.req.byteenable = m_arb_byteenable[i];
         assign m_arb_stall[i] = m_intf.arb.stall;
         assign m_wrp_ack[i] = m_intf.wrp.ack;
         assign m_rrp_datavalid[i] = m_intf.rrp.datavalid;
         assign m_rrp_data[i] = m_intf.rrp.data;
         assign m_intf.arb.req.id = id;
      end

   endgenerate

   generate
   begin:s
      acl_arb_intf
      #(
         .DATA_W(256),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(32),
         .ID_W(1)
      ) in_arb_intf();
      acl_arb_intf
      #(
         .DATA_W(256),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(32),
         .ID_W(1)
      ) out_arb_intf();
      acl_ic_wrp_intf
      #(
         .ID_W(1)
      ) wrp_intf();
      acl_ic_rrp_intf
      #(
         .DATA_W(256),
         .ID_W(1)
      ) rrp_intf();

      // INST s_endp of acl_ic_slave_endpoint
      acl_ic_slave_endpoint
      #(
         .DATA_W(256),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(32),
         .ID_W(1),
         .NUM_MASTERS(1),
         .PIPELINE_RETURN_PATHS(1),
         .WRP_FIFO_DEPTH(64),
         .RRP_FIFO_DEPTH(64),
         .RRP_USE_LL_FIFO(1),
         .SLAVE_FIXED_LATENCY(0),
         .SEPARATE_READ_WRITE_STALLS(0)
      )
      s_endp
      (
         .clock(clock),
         .resetn(resetn),
         .m_intf(in_arb_intf),
         .s_intf(out_arb_intf),
         .s_readdatavalid(mout_rrp_datavalid),
         .s_readdata(mout_rrp_data),
         .s_writeack(mout_wrp_ack),
         .wrp_intf(wrp_intf),
         .rrp_intf(rrp_intf)
      );

   end
   endgenerate

   generate
   begin:wrp
   end
   endgenerate

   generate
   begin:rrp
      assign m[0].rrp_intf.datavalid = s.rrp_intf.datavalid;
      assign m[0].rrp_intf.data = s.rrp_intf.data;
      assign m[0].rrp_intf.id = s.rrp_intf.id;
   end
   endgenerate

   assign mout_arb_request = s.out_arb_intf.req.request;
   assign mout_arb_read = s.out_arb_intf.req.read;
   assign mout_arb_write = s.out_arb_intf.req.write;
   assign mout_arb_burstcount = s.out_arb_intf.req.burstcount;
   assign mout_arb_address = s.out_arb_intf.req.address;
   assign mout_arb_writedata = s.out_arb_intf.req.writedata;
   assign mout_arb_byteenable = s.out_arb_intf.req.byteenable;
   assign mout_arb_id = s.out_arb_intf.req.id;
   assign s.out_arb_intf.stall = mout_arb_stall;
   assign s.in_arb_intf.req = m[0].arb_intf.req;
   assign m[0].arb_intf.stall = s.in_arb_intf.stall;
endmodule

/////////////////////////////////////////////////////////////////
// MODULE interconnect_2
/////////////////////////////////////////////////////////////////
module interconnect_2
(
   input logic clock,
   input logic resetn,
   // ICM m
   input logic m_arb_request [2],
   input logic m_arb_read [2],
   input logic m_arb_write [2],
   input logic [4:0] m_arb_burstcount [2],
   input logic [24:0] m_arb_address [2],
   input logic [255:0] m_arb_writedata [2],
   input logic [31:0] m_arb_byteenable [2],
   output logic m_arb_stall [2],
   output logic m_wrp_ack [2],
   output logic m_rrp_datavalid [2],
   output logic [255:0] m_rrp_data [2],
   // ICM mout
   output logic mout_arb_request,
   output logic mout_arb_read,
   output logic mout_arb_write,
   output logic [4:0] mout_arb_burstcount,
   output logic [24:0] mout_arb_address,
   output logic [255:0] mout_arb_writedata,
   output logic [31:0] mout_arb_byteenable,
   output logic mout_arb_id,
   input logic mout_arb_stall,
   input logic mout_wrp_ack,
   input logic mout_rrp_datavalid,
   input logic [255:0] mout_rrp_data
);
   genvar i;
   generate
      for( i = 0; i < 2; i = i + 1 )
      begin:m
         logic id;
         acl_ic_master_intf
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1)
         ) m_intf();
         acl_arb_intf
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1)
         ) arb_intf();
         acl_ic_wrp_intf
         #(
            .ID_W(1)
         ) wrp_intf();
         acl_ic_rrp_intf
         #(
            .DATA_W(256),
            .ID_W(1)
         ) rrp_intf();

         assign id = i;
         // INST m_endp of acl_ic_master_endpoint
         acl_ic_master_endpoint
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1),
            .TOTAL_NUM_MASTERS(2),
            .ID(i)
         )
         m_endp
         (
            .clock(clock),
            .resetn(resetn),
            .m_intf(m_intf),
            .arb_intf(arb_intf),
            .wrp_intf(wrp_intf),
            .rrp_intf(rrp_intf)
         );

         assign m_intf.arb.req.request = m_arb_request[i];
         assign m_intf.arb.req.read = m_arb_read[i];
         assign m_intf.arb.req.write = m_arb_write[i];
         assign m_intf.arb.req.burstcount = m_arb_burstcount[i];
         assign m_intf.arb.req.address = m_arb_address[i];
         assign m_intf.arb.req.writedata = m_arb_writedata[i];
         assign m_intf.arb.req.byteenable = m_arb_byteenable[i];
         assign m_arb_stall[i] = m_intf.arb.stall;
         assign m_wrp_ack[i] = m_intf.wrp.ack;
         assign m_rrp_datavalid[i] = m_intf.rrp.datavalid;
         assign m_rrp_data[i] = m_intf.rrp.data;
         assign m_intf.arb.req.id = id;
      end

   endgenerate

   generate
   begin:s
      acl_arb_intf
      #(
         .DATA_W(256),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(32),
         .ID_W(1)
      ) in_arb_intf();
      acl_arb_intf
      #(
         .DATA_W(256),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(32),
         .ID_W(1)
      ) out_arb_intf();
      acl_ic_wrp_intf
      #(
         .ID_W(1)
      ) wrp_intf();
      acl_ic_rrp_intf
      #(
         .DATA_W(256),
         .ID_W(1)
      ) rrp_intf();

      // INST s_endp of acl_ic_slave_endpoint
      acl_ic_slave_endpoint
      #(
         .DATA_W(256),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(32),
         .ID_W(1),
         .NUM_MASTERS(2),
         .PIPELINE_RETURN_PATHS(1),
         .WRP_FIFO_DEPTH(0),
         .RRP_FIFO_DEPTH(64),
         .RRP_USE_LL_FIFO(1),
         .SLAVE_FIXED_LATENCY(0),
         .SEPARATE_READ_WRITE_STALLS(0)
      )
      s_endp
      (
         .clock(clock),
         .resetn(resetn),
         .m_intf(in_arb_intf),
         .s_intf(out_arb_intf),
         .s_readdatavalid(mout_rrp_datavalid),
         .s_readdata(mout_rrp_data),
         .s_writeack(mout_wrp_ack),
         .wrp_intf(wrp_intf),
         .rrp_intf(rrp_intf)
      );

   end
   endgenerate

   generate
   begin:wrp
      assign m[0].wrp_intf.ack = s.wrp_intf.ack;
      assign m[0].wrp_intf.id = s.wrp_intf.id;
      assign m[1].wrp_intf.ack = s.wrp_intf.ack;
      assign m[1].wrp_intf.id = s.wrp_intf.id;
   end
   endgenerate

   generate
   begin:rrp
      assign m[0].rrp_intf.datavalid = s.rrp_intf.datavalid;
      assign m[0].rrp_intf.data = s.rrp_intf.data;
      assign m[0].rrp_intf.id = s.rrp_intf.id;
      assign m[1].rrp_intf.datavalid = s.rrp_intf.datavalid;
      assign m[1].rrp_intf.data = s.rrp_intf.data;
      assign m[1].rrp_intf.id = s.rrp_intf.id;
   end
   endgenerate

   generate
      for( i = 0; i < 1; i = i + 1 )
      begin:a
         acl_arb_intf
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1)
         ) m0_intf();
         acl_arb_intf
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1)
         ) m1_intf();
         acl_arb_intf
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1)
         ) mout_intf();

         // INST a of acl_arb2
         acl_arb2
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1),
            .PIPELINE("none"),
            .KEEP_LAST_GRANT(1),
            .NO_STALL_NETWORK(0)
         )
         a
         (
            .clock(clock),
            .resetn(resetn),
            .m0_intf(m0_intf),
            .m1_intf(m1_intf),
            .mout_intf(mout_intf)
         );

      end

   endgenerate

   assign mout_arb_request = s.out_arb_intf.req.request;
   assign mout_arb_read = s.out_arb_intf.req.read;
   assign mout_arb_write = s.out_arb_intf.req.write;
   assign mout_arb_burstcount = s.out_arb_intf.req.burstcount;
   assign mout_arb_address = s.out_arb_intf.req.address;
   assign mout_arb_writedata = s.out_arb_intf.req.writedata;
   assign mout_arb_byteenable = s.out_arb_intf.req.byteenable;
   assign mout_arb_id = s.out_arb_intf.req.id;
   assign s.out_arb_intf.stall = mout_arb_stall;
   assign s.in_arb_intf.req = a[0].mout_intf.req;
   assign a[0].mout_intf.stall = s.in_arb_intf.stall;
   assign a[0].m0_intf.req = m[0].arb_intf.req;
   assign m[0].arb_intf.stall = a[0].m0_intf.stall;
   assign a[0].m1_intf.req = m[1].arb_intf.req;
   assign m[1].arb_intf.stall = a[0].m1_intf.stall;
endmodule

