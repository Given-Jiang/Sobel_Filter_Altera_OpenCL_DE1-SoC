package require -exact sopc 10.0
set_module_property NAME Sobel_system
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property GROUP Accelerators
set_module_property DISPLAY_NAME Sobel_system
set_module_property TOP_LEVEL_HDL_FILE Sobel_system.v
set_module_property TOP_LEVEL_HDL_MODULE Sobel_system
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL FALSE

add_interface clock_reset clock end
set_interface_property clock_reset ENABLED true
add_interface_port clock_reset clock clk Input 1
add_interface_port clock_reset resetn reset_n Input 1
add_interface clock_reset2x clock end
set_interface_property clock_reset2x ENABLED true
add_interface_port clock_reset2x clock2x clk Input 1

### SLAVE interface avs_sobel_cra
add_interface avs_sobel_cra avalon end
set_interface_property avs_sobel_cra addressAlignment DYNAMIC
set_interface_property avs_sobel_cra burstOnBurstBoundariesOnly false
set_interface_property avs_sobel_cra explicitAddressSpan 0
set_interface_property avs_sobel_cra holdTime 0
set_interface_property avs_sobel_cra isMemoryDevice false
set_interface_property avs_sobel_cra isNonVolatileStorage false
set_interface_property avs_sobel_cra linewrapBursts false
set_interface_property avs_sobel_cra maximumPendingReadTransactions 1
set_interface_property avs_sobel_cra printableDevice false
set_interface_property avs_sobel_cra readLatency 0
set_interface_property avs_sobel_cra readWaitTime 1
set_interface_property avs_sobel_cra setupTime 0
set_interface_property avs_sobel_cra timingUnits Cycles
set_interface_property avs_sobel_cra writeWaitTime 0
set_interface_property avs_sobel_cra ASSOCIATED_CLOCK clock_reset
set_interface_property avs_sobel_cra ENABLED true
add_interface_port avs_sobel_cra avs_sobel_cra_read read Input 1
add_interface_port avs_sobel_cra avs_sobel_cra_write write Input 1
add_interface_port avs_sobel_cra avs_sobel_cra_address address Input 4
add_interface_port avs_sobel_cra avs_sobel_cra_writedata writedata Input 64
add_interface_port avs_sobel_cra avs_sobel_cra_byteenable byteenable Input 8
add_interface_port avs_sobel_cra avs_sobel_cra_waitrequest waitrequest Output 1
add_interface_port avs_sobel_cra avs_sobel_cra_readdata readdata Output 64
add_interface_port avs_sobel_cra avs_sobel_cra_readdatavalid readdatavalid Output 1

### IRQ interface kernel_irq
add_interface kernel_irq interrupt end
set_interface_property kernel_irq associatedClock clock_reset
set_interface_property kernel_irq ASSOCIATED_CLOCK clock_reset
set_interface_property kernel_irq ENABLED true
add_interface_port kernel_irq kernel_irq irq Output 1

### MASTER interface avm_memgmem0_port_0_0_rw with base address 0
add_interface avm_memgmem0_port_0_0_rw avalon start
set_interface_property avm_memgmem0_port_0_0_rw associatedClock clock_reset
set_interface_property avm_memgmem0_port_0_0_rw burstOnBurstBoundariesOnly false
set_interface_property avm_memgmem0_port_0_0_rw doStreamReads false
set_interface_property avm_memgmem0_port_0_0_rw doStreamWrites false
set_interface_property avm_memgmem0_port_0_0_rw linewrapBursts false
set_interface_property avm_memgmem0_port_0_0_rw ASSOCIATED_CLOCK clock_reset
set_interface_property avm_memgmem0_port_0_0_rw ENABLED true
add_interface_port avm_memgmem0_port_0_0_rw avm_memgmem0_port_0_0_rw_address address Output 30
add_interface_port avm_memgmem0_port_0_0_rw avm_memgmem0_port_0_0_rw_read read Output 1
add_interface_port avm_memgmem0_port_0_0_rw avm_memgmem0_port_0_0_rw_write write Output 1
add_interface_port avm_memgmem0_port_0_0_rw avm_memgmem0_port_0_0_rw_burstcount burstcount Output 5
add_interface_port avm_memgmem0_port_0_0_rw avm_memgmem0_port_0_0_rw_writedata writedata Output 256
add_interface_port avm_memgmem0_port_0_0_rw avm_memgmem0_port_0_0_rw_byteenable byteenable Output 32
add_interface_port avm_memgmem0_port_0_0_rw avm_memgmem0_port_0_0_rw_readdata readdata Input 256
add_interface_port avm_memgmem0_port_0_0_rw avm_memgmem0_port_0_0_rw_waitrequest waitrequest Input 1
add_interface_port avm_memgmem0_port_0_0_rw avm_memgmem0_port_0_0_rw_readdatavalid readdatavalid Input 1


add_file Sobel.v {SYNTHESIS SIMULATION}
add_file acl_address_to_bankaddress.v {SYNTHESIS SIMULATION}
add_file acl_arb2.v {SYNTHESIS SIMULATION}
add_file acl_arb_intf.v {SYNTHESIS SIMULATION}
add_file acl_atomics_arb_stall.v {SYNTHESIS SIMULATION}
add_file acl_atomics_nostall.v {SYNTHESIS SIMULATION}
add_file acl_avm_to_ic.v {SYNTHESIS SIMULATION}
add_file acl_data_fifo.v {SYNTHESIS SIMULATION}
add_file acl_debug_mem.v {SYNTHESIS SIMULATION}
add_file acl_fifo.v {SYNTHESIS SIMULATION}
add_file acl_ic_intf.v {SYNTHESIS SIMULATION}
add_file acl_ic_master_endpoint.v {SYNTHESIS SIMULATION}
add_file acl_ic_mem_router.v {SYNTHESIS SIMULATION}
add_file acl_ic_rrp_reg.v {SYNTHESIS SIMULATION}
add_file acl_ic_slave_endpoint.v {SYNTHESIS SIMULATION}
add_file acl_ic_slave_rrp.v {SYNTHESIS SIMULATION}
add_file acl_ic_slave_wrp.v {SYNTHESIS SIMULATION}
add_file acl_ic_to_avm.v {SYNTHESIS SIMULATION}
add_file acl_ic_wrp_reg.v {SYNTHESIS SIMULATION}
add_file acl_id_iterator.v {SYNTHESIS SIMULATION}
add_file acl_int_mult32s_s5.v {SYNTHESIS SIMULATION}
add_file acl_kernel_finish_detector.v {SYNTHESIS SIMULATION}
add_file acl_ll_fifo.v {SYNTHESIS SIMULATION}
add_file acl_ll_ram_fifo.v {SYNTHESIS SIMULATION}
add_file acl_loop_limiter.v {SYNTHESIS SIMULATION}
add_file acl_multi_fanout_adaptor.v {SYNTHESIS SIMULATION}
add_file acl_pipeline.v {SYNTHESIS SIMULATION}
add_file acl_pop.v {SYNTHESIS SIMULATION}
add_file acl_push.v {SYNTHESIS SIMULATION}
add_file acl_staging_reg.v {SYNTHESIS SIMULATION}
add_file acl_toggle_detect.v {SYNTHESIS SIMULATION}
add_file acl_token_fifo_counter.v {SYNTHESIS SIMULATION}
add_file acl_valid_fifo_counter.v {SYNTHESIS SIMULATION}
add_file acl_work_group_dispatcher.v {SYNTHESIS SIMULATION}
add_file acl_work_group_limiter.v {SYNTHESIS SIMULATION}
add_file acl_work_item_iterator.v {SYNTHESIS SIMULATION}
add_file lsu_atomic.v {SYNTHESIS SIMULATION}
add_file lsu_basic_coalescer.v {SYNTHESIS SIMULATION}
add_file lsu_burst_master.v {SYNTHESIS SIMULATION}
add_file lsu_bursting_load_stores.v {SYNTHESIS SIMULATION}
add_file lsu_non_aligned_write.v {SYNTHESIS SIMULATION}
add_file lsu_pipelined.v {SYNTHESIS SIMULATION}
add_file lsu_prefetch_block.v {SYNTHESIS SIMULATION}
add_file lsu_read_cache.v {SYNTHESIS SIMULATION}
add_file lsu_simple.v {SYNTHESIS SIMULATION}
add_file lsu_streaming.v {SYNTHESIS SIMULATION}
add_file lsu_top.v {SYNTHESIS SIMULATION}
add_file lsu_wide_wrapper.v {SYNTHESIS SIMULATION}
add_file sv_mult27.v {SYNTHESIS SIMULATION}
