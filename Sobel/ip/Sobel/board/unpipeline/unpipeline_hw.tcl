# TCL File Generated by Component Editor 11.0
# Tue Jul 19 13:15:52 PDT 2011


# +-----------------------------------
# | 
# | unpipeline "ACL Pipelined MM Bridge" v1.0
# | Altera OpenCL 2011.07.19.13:15:52
# | Unpipeline a master
# | 
# | 
# |    ./unpipeline.v syn, sim
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 11.0
# | 
package require -exact sopc 10.0
# | 
# +-----------------------------------

# +-----------------------------------
# | module unpipeline
# | 
set_module_property DESCRIPTION "Make reads non-pipelined"
set_module_property NAME unpipeline
set_module_property VERSION 10.0
set_module_property GROUP "ACL Internal Components"
set_module_property AUTHOR "Altera OpenCL"
set_module_property DISPLAY_NAME "ACL Unpipeline"
set_module_property TOP_LEVEL_HDL_FILE unpipeline.v
set_module_property TOP_LEVEL_HDL_MODULE unpipeline
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
set_module_property ELABORATION_CALLBACK elaborate
set_module_property VALIDATION_CALLBACK validate
set_module_property ANALYZE_HDL false
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
add_file unpipeline.v {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_parameter WIDTH_D INTEGER 256
set_parameter_property WIDTH_D DEFAULT_VALUE 256
set_parameter_property WIDTH_D DISPLAY_NAME "Data Width"
set_parameter_property WIDTH_D UNITS "bits" 
set_parameter_property WIDTH_D AFFECTS_ELABORATION true
set_parameter_property WIDTH_D HDL_PARAMETER true
#set_parameter_property WIDTH_D SYSTEM_INFO {MAX_SLAVE_DATA_WIDTH m}

add_parameter M_WIDTH_A INTEGER 31
set_parameter_property M_WIDTH_A DEFAULT_VALUE 31
set_parameter_property M_WIDTH_A DISPLAY_NAME "Master Address Width (connect bank 1 to its slaves to set this)"
set_parameter_property M_WIDTH_A UNITS "bits"
set_parameter_property M_WIDTH_A AFFECTS_ELABORATION true
set_parameter_property M_WIDTH_A HDL_PARAMETER true
set_parameter_property M_WIDTH_A SYSTEM_INFO {ADDRESS_WIDTH m}

add_parameter S_WIDTH_A INTEGER 26
set_parameter_property S_WIDTH_A DEFAULT_VALUE 26
set_parameter_property S_WIDTH_A DISPLAY_NAME "Slave Address Width"
set_parameter_property S_WIDTH_A UNITS "bits"
set_parameter_property S_WIDTH_A AFFECTS_ELABORATION true
set_parameter_property S_WIDTH_A HDL_PARAMETER true
set_parameter_property S_WIDTH_A DERIVED true

add_parameter BURSTCOUNT_WIDTH INTEGER 1
set_parameter_property BURSTCOUNT_WIDTH DEFAULT_VALUE 1
set_parameter_property BURSTCOUNT_WIDTH DISPLAY_NAME "Burstcount Width"
set_parameter_property BURSTCOUNT_WIDTH UNITS ""
set_parameter_property BURSTCOUNT_WIDTH AFFECTS_ELABORATION true
set_parameter_property BURSTCOUNT_WIDTH HDL_PARAMETER true
set_parameter_property BURSTCOUNT_WIDTH DERIVED true

add_parameter BYTEENABLE_WIDTH INTEGER 29
set_parameter_property BYTEENABLE_WIDTH DEFAULT_VALUE 29
set_parameter_property BYTEENABLE_WIDTH DISPLAY_NAME "Byteenable Width"
set_parameter_property BYTEENABLE_WIDTH TYPE INTEGER
set_parameter_property BYTEENABLE_WIDTH UNITS None
set_parameter_property BYTEENABLE_WIDTH AFFECTS_GENERATION false
set_parameter_property BYTEENABLE_WIDTH HDL_PARAMETER true
set_parameter_property BYTEENABLE_WIDTH DERIVED true

add_parameter MAX_PENDING_READS INTEGER 64
set_parameter_property MAX_PENDING_READS DEFAULT_VALUE 64
set_parameter_property MAX_PENDING_READS DISPLAY_NAME "Maximum Pending Reads"
set_parameter_property MAX_PENDING_READS UNITS ""
set_parameter_property MAX_PENDING_READS AFFECTS_ELABORATION true
set_parameter_property MAX_PENDING_READS HDL_PARAMETER true
# | 
# +-----------------------------------

proc validate {} {
    set width_d [ get_parameter_value WIDTH_D ]
    set m_width_a [ get_parameter_value M_WIDTH_A ]

    set byteenable_width [ expr $width_d / 8 ]
    set s_width_a [ expr int ( $m_width_a - (ceil(log($width_d / 8)/log(2)))) ]

    set_parameter_value S_WIDTH_A $s_width_a
    set_parameter_value BYTEENABLE_WIDTH $byteenable_width
}

proc elaborate {} {
    set width_d [ get_parameter_value WIDTH_D ]
    set m_width_a [ get_parameter_value M_WIDTH_A ]
    set s_width_a [ get_parameter_value S_WIDTH_A ]
    set burstcount_width [ get_parameter_value BURSTCOUNT_WIDTH ]
    set byteenable_width [ get_parameter_value BYTEENABLE_WIDTH ]
    set max_pending_reads [ get_parameter_value MAX_PENDING_READS ]

    # +-----------------------------------
    # | connection point clk
    # | 
    add_interface clk clock end
    set_interface_property clk ENABLED true
    add_interface_port clk clk clk Input 1
    # | 
    # +-----------------------------------
    
    # +-----------------------------------
    # | connection point clk_reset
    # | 
    add_interface clk_reset reset end
    set_interface_property clk_reset associatedClock clk
    set_interface_property clk_reset synchronousEdges DEASSERT
    set_interface_property clk_reset ENABLED true
    add_interface_port clk_reset resetn reset_n Input 1
    # | 
    # +-----------------------------------

    # +-----------------------------------
    # | connection point s
    # | 
    add_interface s avalon end
    set_interface_property s addressAlignment DYNAMIC
    set_interface_property s addressUnits WORDS
    set_interface_property s associatedClock clk
    set_interface_property s associatedReset clk_reset
    set_interface_property s burstOnBurstBoundariesOnly false
    set_interface_property s explicitAddressSpan 0
    set_interface_property s holdTime 0
    set_interface_property s isMemoryDevice false
    set_interface_property s isNonVolatileStorage false
    set_interface_property s linewrapBursts false
    set_interface_property s maximumPendingReadTransactions $max_pending_reads
    set_interface_property s printableDevice false
    set_interface_property s readLatency 0
    set_interface_property s readWaitTime 0
    set_interface_property s setupTime 0
    set_interface_property s timingUnits Cycles
    set_interface_property s writeWaitTime 0
    set_interface_property s ENABLED true

    add_interface_port s slave_address address Input $s_width_a
    add_interface_port s slave_writedata writedata Input $width_d
    add_interface_port s slave_read read Input 1
    add_interface_port s slave_write write Input 1
    add_interface_port s slave_burstcount burstcount Input $burstcount_width
    add_interface_port s slave_byteenable byteenable Input $byteenable_width
    add_interface_port s slave_waitrequest waitrequest Output 1
    add_interface_port s slave_readdata readdata Output $width_d
    add_interface_port s slave_readdatavalid readdatavalid Output 1
    # | 
    # +-----------------------------------

    # +-----------------------------------
    # | connection point m
    # | 
    add_interface m avalon start
    set_interface_property m addressUnits SYMBOLS
    set_interface_property m associatedClock clk
    set_interface_property m associatedReset clk_reset
    set_interface_property m burstOnBurstBoundariesOnly false
    set_interface_property m doStreamReads false
    set_interface_property m doStreamWrites false
    set_interface_property m linewrapBursts false
    set_interface_property m readLatency 0
    set_interface_property m ENABLED true

    add_interface_port m master_address address Output $m_width_a
    add_interface_port m master_writedata writedata Output $width_d
    add_interface_port m master_read read Output 1
    add_interface_port m master_write write Output 1
    #add_interface_port m master_burstcount burstcount Output $burstcount_width
    add_interface_port m master_byteenable byteenable Output $byteenable_width
    add_interface_port m master_waitrequest waitrequest Input 1
    add_interface_port m master_readdata readdata Input $width_d
    #add_interface_port m master_readdatavalid readdatavalid Input 1
    # | 
    # +-----------------------------------

}
