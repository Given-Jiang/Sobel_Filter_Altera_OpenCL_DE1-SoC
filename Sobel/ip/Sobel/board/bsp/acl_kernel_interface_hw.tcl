package require -exact qsys 13.1

# module properties
set_module_property NAME {kernel_interface}
set_module_property DISPLAY_NAME {OpenCL Kernel Interface}

# default module properties
set_module_property VERSION {1.0}
set_module_property GROUP {OpenCL BSP Components}
set_module_property DESCRIPTION {Connects the OpenCL host to the FPGA kernel}
set_module_property AUTHOR {author}

set_module_property COMPOSITION_CALLBACK compose
set_module_property opaque_address_map false

# +-----------------------------------
# | parameters
# | 
add_parameter NUM_GLOBAL_MEMS INTEGER 1
set_parameter_property NUM_GLOBAL_MEMS DEFAULT_VALUE 1
set_parameter_property NUM_GLOBAL_MEMS DISPLAY_NAME "Number of global memory systems"
set_parameter_property NUM_GLOBAL_MEMS AFFECTS_ELABORATION true
# | 
# +-----------------------------------

proc get_config_addr { i } {
  if { $i == 0 } {
    return [format 0x%03X 24 ]
  } else {
    return [format 0x%03X [ expr 256 + (($i -1) * 4) ] ]
  }
}

proc compose { } {
    set num_global_mems [ get_parameter_value NUM_GLOBAL_MEMS ]

    if { $num_global_mems > 6 } {
      send_message -error "Can't have more than 6 global memories"
    }

    # Instances and instance parameters
    # (disabled instances are intentionally culled)
    add_instance kernel_cra altera_avalon_mm_bridge 13.1
    set_instance_parameter_value kernel_cra {DATA_WIDTH} {64}
    set_instance_parameter_value kernel_cra {SYMBOL_WIDTH} {8}
    set_instance_parameter_value kernel_cra {ADDRESS_WIDTH} {30}
    set_instance_parameter_value kernel_cra {ADDRESS_UNITS} {SYMBOLS}
    set_instance_parameter_value kernel_cra {MAX_BURST_SIZE} {1}
    set_instance_parameter_value kernel_cra {MAX_PENDING_RESPONSES} {1}
    set_instance_parameter_value kernel_cra {LINEWRAPBURSTS} {0}
    set_instance_parameter_value kernel_cra {PIPELINE_COMMAND} {1}
    set_instance_parameter_value kernel_cra {PIPELINE_RESPONSE} {1}

    add_instance address_span_extender_0 altera_address_span_extender 1.2
    set_instance_parameter_value address_span_extender_0 {DATA_WIDTH} {64}
    set_instance_parameter_value address_span_extender_0 {MASTER_ADDRESS_WIDTH} {30}
    set_instance_parameter_value address_span_extender_0 {SLAVE_ADDRESS_WIDTH} {9}
    set_instance_parameter_value address_span_extender_0 {BURSTCOUNT_WIDTH} {1}
    set_instance_parameter_value address_span_extender_0 {SUB_WINDOW_COUNT} {1}
    set_instance_parameter_value address_span_extender_0 {MASTER_ADDRESS_DEF} {0}
    set_instance_parameter_value address_span_extender_0 {TERMINATE_SLAVE_PORT} {0}
    set_instance_parameter_value address_span_extender_0 {MAX_PENDING_READS} {1}

    add_instance sw_reset sw_reset 10.0
    set_instance_parameter_value sw_reset {WIDTH} {64}
    set_instance_parameter_value sw_reset {LOG2_RESET_CYCLES} {10}

    add_instance global_routing_reset global_routing_reset 10.0

    add_instance ctrl altera_avalon_mm_bridge 13.1
    set_instance_parameter_value ctrl {DATA_WIDTH} {32}
    set_instance_parameter_value ctrl {SYMBOL_WIDTH} {8}
    set_instance_parameter_value ctrl {ADDRESS_WIDTH} {14}
    set_instance_parameter_value ctrl {ADDRESS_UNITS} {SYMBOLS}
    set_instance_parameter_value ctrl {MAX_BURST_SIZE} {1}
    set_instance_parameter_value ctrl {MAX_PENDING_RESPONSES} {1}
    set_instance_parameter_value ctrl {LINEWRAPBURSTS} {0}
    set_instance_parameter_value ctrl {PIPELINE_COMMAND} {1}
    set_instance_parameter_value ctrl {PIPELINE_RESPONSE} {1}

    for { set i 0} { $i < $num_global_mems } {incr i} {
      add_instance mem_org_mode$i mem_org_mode 10.0
      set_instance_parameter_value mem_org_mode$i {WIDTH} {32}
    }

    add_instance clk_reset clock_source 13.1
    set_instance_parameter_value clk_reset {clockFrequency} {100000000.0}
    set_instance_parameter_value clk_reset {clockFrequencyKnown} {1}
    set_instance_parameter_value clk_reset {resetSynchronousEdges} {DEASSERT}

    add_instance irq_bridge_0 altera_irq_bridge 13.1
    set_instance_parameter_value irq_bridge_0 {IRQ_WIDTH} {1}
    set_instance_parameter_value irq_bridge_0 {IRQ_N} {0}

    add_instance sw_reset_in altera_reset_bridge 13.1
    set_instance_parameter_value sw_reset_in {ACTIVE_LOW_RESET} {0}
    set_instance_parameter_value sw_reset_in {SYNCHRONOUS_EDGES} {deassert}
    set_instance_parameter_value sw_reset_in {NUM_RESET_OUTPUTS} {1}

    add_instance version_id_0 version_id 10.0
    set_instance_parameter_value version_id_0 {WIDTH} {32}
    set_instance_parameter_value version_id_0 {VERSION_ID} {-1598029823}

    add_instance reset_controller_sw altera_reset_controller 13.1
    set_instance_parameter_value reset_controller_sw {NUM_RESET_INPUTS} {2}
    set_instance_parameter_value reset_controller_sw {OUTPUT_RESET_SYNC_EDGES} {deassert}
    set_instance_parameter_value reset_controller_sw {SYNC_DEPTH} {2}
    set_instance_parameter_value reset_controller_sw {RESET_REQUEST_PRESENT} {0}
    set_instance_parameter_value reset_controller_sw {RESET_REQ_WAIT_TIME} {1}
    set_instance_parameter_value reset_controller_sw {MIN_RST_ASSERTION_TIME} {3}
    set_instance_parameter_value reset_controller_sw {RESET_REQ_EARLY_DSRT_TIME} {1}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN0} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN1} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN2} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN3} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN4} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN5} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN6} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN7} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN8} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN9} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN10} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN11} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN12} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN13} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN14} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_IN15} {0}
    set_instance_parameter_value reset_controller_sw {USE_RESET_REQUEST_INPUT} {0}

    add_instance kernel_clk altera_clock_bridge 13.1
    set_instance_parameter_value kernel_clk {EXPLICIT_CLOCK_RATE} {0.0}
    set_instance_parameter_value kernel_clk {NUM_CLOCK_OUTPUTS} {1}

    add_instance reset_bridge_0 altera_reset_bridge 13.1
    set_instance_parameter_value reset_bridge_0 {ACTIVE_LOW_RESET} {1}
    set_instance_parameter_value reset_bridge_0 {SYNCHRONOUS_EDGES} {deassert}
    set_instance_parameter_value reset_bridge_0 {NUM_RESET_OUTPUTS} {1}

    add_instance reset_bridge_1 altera_reset_bridge 13.1
    set_instance_parameter_value reset_bridge_1 {ACTIVE_LOW_RESET} {1}
    set_instance_parameter_value reset_bridge_1 {SYNCHRONOUS_EDGES} {deassert}
    set_instance_parameter_value reset_bridge_1 {NUM_RESET_OUTPUTS} {1}

    add_instance sys_description_rom altera_avalon_onchip_memory2 13.1
    set_instance_parameter_value sys_description_rom {allowInSystemMemoryContentEditor} {0}
    set_instance_parameter_value sys_description_rom {blockType} {AUTO}
    set_instance_parameter_value sys_description_rom {dataWidth} {64}
    set_instance_parameter_value sys_description_rom {dualPort} {0}
    set_instance_parameter_value sys_description_rom {initMemContent} {1}
    set_instance_parameter_value sys_description_rom {initializationFileName} {sys_description}
    set_instance_parameter_value sys_description_rom {instanceID} {NONE}
    set_instance_parameter_value sys_description_rom {memorySize} {4096.0}
    set_instance_parameter_value sys_description_rom {readDuringWriteMode} {DONT_CARE}
    set_instance_parameter_value sys_description_rom {simAllowMRAMContentsFile} {0}
    set_instance_parameter_value sys_description_rom {simMemInitOnlyFilename} {0}
    set_instance_parameter_value sys_description_rom {singleClockOperation} {0}
    set_instance_parameter_value sys_description_rom {slave1Latency} {2}
    set_instance_parameter_value sys_description_rom {slave2Latency} {1}
    set_instance_parameter_value sys_description_rom {useNonDefaultInitFile} {1}
    set_instance_parameter_value sys_description_rom {useShallowMemBlocks} {0}
    set_instance_parameter_value sys_description_rom {writable} {0}
    set_instance_parameter_value sys_description_rom {ecc_enabled} {0}

    # connections and connection parameters
    add_connection address_span_extender_0.expanded_master kernel_cra.s0 avalon
    set_connection_parameter_value address_span_extender_0.expanded_master/kernel_cra.s0 arbitrationPriority {1}
    set_connection_parameter_value address_span_extender_0.expanded_master/kernel_cra.s0 baseAddress {0x0000}
    set_connection_parameter_value address_span_extender_0.expanded_master/kernel_cra.s0 defaultConnection {0}

    add_connection ctrl.m0 address_span_extender_0.windowed_slave avalon
    set_connection_parameter_value ctrl.m0/address_span_extender_0.windowed_slave arbitrationPriority {1}
    set_connection_parameter_value ctrl.m0/address_span_extender_0.windowed_slave baseAddress {0x1000}
    set_connection_parameter_value ctrl.m0/address_span_extender_0.windowed_slave defaultConnection {0}

    add_connection ctrl.m0 address_span_extender_0.cntl avalon
    set_connection_parameter_value ctrl.m0/address_span_extender_0.cntl arbitrationPriority {1}
    set_connection_parameter_value ctrl.m0/address_span_extender_0.cntl baseAddress {0x0020}
    set_connection_parameter_value ctrl.m0/address_span_extender_0.cntl defaultConnection {0}

    add_connection ctrl.m0 sys_description_rom.s1 avalon
    set_connection_parameter_value ctrl.m0/sys_description_rom.s1 arbitrationPriority {1}
    set_connection_parameter_value ctrl.m0/sys_description_rom.s1 baseAddress {0x2000}
    set_connection_parameter_value ctrl.m0/sys_description_rom.s1 defaultConnection {0}

    add_connection ctrl.m0 sw_reset.s avalon
    set_connection_parameter_value ctrl.m0/sw_reset.s arbitrationPriority {1}
    set_connection_parameter_value ctrl.m0/sw_reset.s baseAddress {0x0030}
    set_connection_parameter_value ctrl.m0/sw_reset.s defaultConnection {0}

    for { set i 0} { $i < $num_global_mems } {incr i} {
      add_connection clk_reset.clk mem_org_mode$i.clk clock

      add_connection clk_reset.clk_reset mem_org_mode$i.clk_reset reset


      add_connection ctrl.m0 mem_org_mode$i.s avalon
      set_connection_parameter_value ctrl.m0/mem_org_mode$i.s arbitrationPriority {1}
      set_connection_parameter_value ctrl.m0/mem_org_mode$i.s baseAddress [get_config_addr $i]
      set_connection_parameter_value ctrl.m0/mem_org_mode$i.s defaultConnection {0}
    }

    add_connection clk_reset.clk ctrl.clk clock

    add_connection clk_reset.clk sys_description_rom.clk1 clock

    add_connection clk_reset.clk sw_reset.clk clock

    add_connection clk_reset.clk_reset ctrl.reset reset

    add_connection clk_reset.clk_reset address_span_extender_0.reset reset

    add_connection clk_reset.clk_reset sys_description_rom.reset1 reset

    add_connection clk_reset.clk_reset sw_reset.clk_reset reset

    add_connection clk_reset.clk sw_reset_in.clk clock

    add_connection sw_reset_in.out_reset sw_reset.clk_reset reset

    add_connection clk_reset.clk version_id_0.clk clock

    add_connection clk_reset.clk address_span_extender_0.clock clock

    add_connection clk_reset.clk_reset version_id_0.clk_reset reset

    add_connection ctrl.m0 version_id_0.s avalon
    set_connection_parameter_value ctrl.m0/version_id_0.s arbitrationPriority {1}
    set_connection_parameter_value ctrl.m0/version_id_0.s baseAddress {0x0000}
    set_connection_parameter_value ctrl.m0/version_id_0.s defaultConnection {0}

    add_connection clk_reset.clk_reset reset_controller_sw.reset_in0 reset

    add_connection sw_reset.sw_reset reset_controller_sw.reset_in1 reset

    add_connection kernel_clk.out_clk kernel_cra.clk clock

    add_connection kernel_clk.out_clk irq_bridge_0.clk clock

    add_connection kernel_clk.out_clk reset_controller_sw.clk clock

    add_connection kernel_clk.out_clk reset_bridge_0.clk clock

    add_connection kernel_clk.out_clk global_routing_reset.clk clock

    add_connection clk_reset.clk reset_bridge_1.clk clock

    add_connection sw_reset.sw_reset reset_bridge_1.in_reset reset

    add_connection reset_controller_sw.reset_out global_routing_reset.reset reset

    add_connection global_routing_reset.global_reset reset_bridge_0.in_reset reset

    add_connection global_routing_reset.global_reset irq_bridge_0.clk_reset reset

    add_connection global_routing_reset.global_reset kernel_cra.reset reset

    # exported interfaces
    add_interface clk clock sink
    set_interface_property clk EXPORT_OF clk_reset.clk_in
    add_interface reset reset sink
    set_interface_property reset EXPORT_OF clk_reset.clk_in_reset
    add_interface ctrl avalon slave
    set_interface_property ctrl EXPORT_OF ctrl.s0
    add_interface kernel_clk clock sink
    set_interface_property kernel_clk EXPORT_OF kernel_clk.in_clk
    add_interface kernel_cra avalon master
    set_interface_property kernel_cra EXPORT_OF kernel_cra.m0
    add_interface sw_reset_in reset sink
    set_interface_property sw_reset_in EXPORT_OF sw_reset_in.in_reset
    add_interface kernel_reset reset source
    set_interface_property kernel_reset EXPORT_OF reset_bridge_0.out_reset
    add_interface sw_reset_export reset source
    set_interface_property sw_reset_export EXPORT_OF reset_bridge_1.out_reset
    for { set i 0} { $i < $num_global_mems } {incr i} {
      set suffix [get_config_addr $i]
      ## These will be useful if we can dynamically switch addressing in kernel
      ## interconnect. For now hide them.
      #add_interface acl_bsp_memorg_kernel$suffix conduit end
      #set_interface_property acl_bsp_memorg_kernel$suffix EXPORT_OF mem_org_mode$i.mem_organization_kernel
      add_interface acl_bsp_memorg_host$suffix conduit end
      set_interface_property acl_bsp_memorg_host$suffix EXPORT_OF mem_org_mode$i.mem_organization_host
    }
    add_interface kernel_irq_from_kernel interrupt receiver
    set_interface_property kernel_irq_from_kernel EXPORT_OF irq_bridge_0.receiver_irq
    add_interface kernel_irq_to_host interrupt sender
    set_interface_property kernel_irq_to_host EXPORT_OF irq_bridge_0.sender0_irq
}
