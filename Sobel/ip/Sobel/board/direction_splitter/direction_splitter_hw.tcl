
package require -exact qsys 13.0

# +-----------------------------------
# | module acl_direction_splitter
# | 
set_module_property DESCRIPTION "Splits read/write masters into one read and one write "
set_module_property NAME acl_direction_splitter
set_module_property VERSION 13.0
set_module_property GROUP "ACL Internal Components"
set_module_property AUTHOR "Altera OpenCL"
set_module_property DISPLAY_NAME "ACL Direction Splitter"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
set_module_property ELABORATION_CALLBACK elaborate
set_module_property ANALYZE_HDL false
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL acl_direction_splitter
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file direction_splitter.sv SYSTEM_VERILOG PATH direction_splitter.sv TOP_LEVEL_FILE

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL acl_direction_splitter
add_fileset_file direction_splitter.sv SYSTEM_VERILOG PATH direction_splitter.sv TOP_LEVEL_FILE
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

add_parameter SYMBOL_WIDTH INTEGER 8
set_parameter_property SYMBOL_WIDTH DEFAULT_VALUE 8
set_parameter_property SYMBOL_WIDTH DISPLAY_NAME "Symbol Width"
set_parameter_property SYMBOL_WIDTH UNITS "bits" 
set_parameter_property SYMBOL_WIDTH AFFECTS_ELABORATION true

add_parameter WIDTH_A INTEGER 31
set_parameter_property WIDTH_A DEFAULT_VALUE 31
set_parameter_property WIDTH_A DISPLAY_NAME "Master Address Width (byte-address)"
set_parameter_property WIDTH_A UNITS "bits"
set_parameter_property WIDTH_A AFFECTS_ELABORATION true

add_parameter S_WIDTH_A INTEGER 31
set_parameter_property S_WIDTH_A AFFECTS_ELABORATION true
set_parameter_property S_WIDTH_A HDL_PARAMETER true
set_parameter_property S_WIDTH_A DERIVED true

add_parameter BURSTCOUNT_WIDTH INTEGER 6
set_parameter_property BURSTCOUNT_WIDTH DEFAULT_VALUE 6
set_parameter_property BURSTCOUNT_WIDTH DISPLAY_NAME "Burstcount Width"
set_parameter_property BURSTCOUNT_WIDTH UNITS ""
set_parameter_property BURSTCOUNT_WIDTH AFFECTS_ELABORATION true
set_parameter_property BURSTCOUNT_WIDTH HDL_PARAMETER true

add_parameter BYTEENABLE_WIDTH INTEGER 64
set_parameter_property BYTEENABLE_WIDTH DEFAULT_VALUE 64
set_parameter_property BYTEENABLE_WIDTH DISPLAY_NAME "Byteenable Width"
set_parameter_property BYTEENABLE_WIDTH TYPE INTEGER
set_parameter_property BYTEENABLE_WIDTH UNITS None
set_parameter_property BYTEENABLE_WIDTH AFFECTS_GENERATION false
set_parameter_property BYTEENABLE_WIDTH HDL_PARAMETER true

add_parameter MAX_PENDING_READS INTEGER 64
set_parameter_property MAX_PENDING_READS DEFAULT_VALUE 64
set_parameter_property MAX_PENDING_READS DISPLAY_NAME "Maximum Pending Reads"
set_parameter_property MAX_PENDING_READS UNITS ""
set_parameter_property MAX_PENDING_READS AFFECTS_ELABORATION true
set_parameter_property MAX_PENDING_READS HDL_PARAMETER true
# | 
# +-----------------------------------


proc elaborate {} {
    set width_d [ get_parameter_value WIDTH_D ]
    set symbol_width [ get_parameter_value SYMBOL_WIDTH ]
    set width_a [ get_parameter_value WIDTH_A ]
    set s_width_a [ expr int ( $width_a - (ceil(log($width_d / 8)/log(2))) ) ]
    set_parameter_value S_WIDTH_A $s_width_a
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
    set_interface_property s burstOnBurstBoundariesOnly true
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
    # | connection point r
    # | 
    add_interface r avalon start
    set_interface_property r addressUnits SYMBOLS
    set_interface_property r associatedClock clk
    set_interface_property r associatedReset clk_reset
    set_interface_property r burstOnBurstBoundariesOnly false
    set_interface_property r linewrapBursts false
    set_interface_property r readLatency 0
    set_interface_property r ENABLED true
    set_interface_property r bitsPerSymbol $symbol_width
    add_interface_port r r_address address Output $width_a
    add_interface_port r r_read read Output 1
    add_interface_port r r_burstcount burstcount Output $burstcount_width
    add_interface_port r r_waitrequest waitrequest Input 1
    add_interface_port r r_readdata readdata Input $width_d
    add_interface_port r r_readdatavalid readdatavalid Input 1
    # | 
    # +-----------------------------------

    # +-----------------------------------
    # | connection point w
    # | 
    add_interface w avalon start
    set_interface_property w addressUnits SYMBOLS
    set_interface_property w associatedClock clk
    set_interface_property w associatedReset clk_reset
    set_interface_property w burstOnBurstBoundariesOnly false
    set_interface_property w doStreamReads false
    set_interface_property w doStreamWrites false
    set_interface_property w linewrapBursts false
    set_interface_property w bitsPerSymbol $symbol_width
    set_interface_property w ENABLED true
    add_interface_port w w_address address Output $width_a
    add_interface_port w w_writedata writedata Output $width_d
    add_interface_port w w_write write Output 1
    add_interface_port w w_burstcount burstcount Output $burstcount_width
    add_interface_port w w_byteenable byteenable Output $byteenable_width
    add_interface_port w w_waitrequest waitrequest Input 1
    # | 
    # +-----------------------------------

}

