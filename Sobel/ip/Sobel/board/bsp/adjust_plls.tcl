
# Required packages
package require ::quartus::project
package require ::quartus::report
package require ::quartus::flow
load_package advanced_pll_legality


set k_clk_name "*kernel_pll*0]*divclk"
set k_clk2x_name "*kernel_pll*1]*divclk"
#set k_clk_name "kernel_clk"
#set k_clk2x_name "kernel_clk2x"
set k_clk_pin *kernel_pll*0\]*vco?ph\[0\]
set k_clk2x_pin *kernel_pll*\[1\]*vco?ph\[0\]
set k_fmax -1
set ref_fmax -1.0
set frac_carryout -1.0
set fpga_part "Unknown"
set pll_configuration "Unknown"

set max_pll_rom_bytes 1024

# Utility functions

# Return values: [retval panel_id row_index]
#   panel_id and row_index are only valid if the query is successful
# retval: 
#    0: success
#   -1: not found
#   -2: panel not found (could be report not loaded)
#   -3: no rows found in panel
#   -4: multiple matches found
proc find_report_panel_row { panel_name col_index string_op string_pattern } {
    if {[catch {get_report_panel_id $panel_name} panel_id] || $panel_id == -1} {
        return -2;
    }

    if {[catch {get_number_of_rows -id $panel_id} num_rows] || $num_rows == -1} {
        return -3;
    }

    # Search for row match.
    set found 0
    set row_index -1;

    for {set r 1} {$r < $num_rows} {incr r} {
        if {[catch {get_report_panel_data -id $panel_id -row $r -col $col_index} value] == 0} {
            if {[string $string_op $string_pattern $value]} {
                if {$found == 0} {
                    # If multiple rows match, return the first
                    set row_index $r
                }
                incr found
            }

        }
    }

    if {$found > 1} {return [list -4 $panel_id $row_index]}
    if {$row_index == -1} {return -1}

    return [list 0 $panel_id $row_index]
}


# get_fmax_from_report: Determines the fmax for the given clock. The fmax value returned
# will meet all timing requirements (setup, hold, recovery, removal, minimum pulse width)
# across all corners.  The return value is a 2-element list consisting of the
# fmax and clk name
proc get_fmax_from_report { clkname required } {
    # Find the clock period.
    set result [find_report_panel_row "TimeQuest Timing Analyzer||Clocks" 0 match $clkname]
    set retval [lindex $result 0]

    if {$retval == -1} { 
        if {$required == 1} {
           error "Error: Could not find clock: $clkname" 
        } else {
           post_message -type warning "Could not find clock: $clkname.  Clock is not required assuming 10 GHz and proceeding."
           return [list 10000 $clkname]
        }
    } elseif {$retval < 0} { 
        error "Error: Failed search for clock $clkname (error $retval)"
    }

    # Update clock name to full clock name ($clkname as passed in may contain wildcards).
    set panel_id [lindex $result 1]
    set row_index [lindex $result 2]
    set clkname [get_report_panel_data -id $panel_id -row $row_index -col 0]
    set clk_period [get_report_panel_data -id $panel_id -row $row_index -col 2]

    post_message "Clock $clkname"
    post_message "  Period: $clk_period"

    # Determine the most negative slack across all relevant timing metrics (setup, recovery, minimum pulse width)
    # and across all timing corners. Hold and removal metrics are not taken into account
    # because their slack values are independent on the clock period (for kernel clocks at least).
    #
    # Paths that involve both a posedge and negedge of the kernel clocks are not handled properly (slack
    # adjustment needs to be doubled).
    set timing_metrics [list "Setup" "Recovery" "Minimum Pulse Width"]
    set timing_metric_colindex [list 1 3 5 ]
    set timing_metric_required [list 1 0 0]
    set wc_slack $clk_period
    set has_slack 0
    set fmax_from_summary 5000.0

    # Find the "Fmax Summary" numbers reported in Quartus.  This may not
    # account for clock transfers but it does account for pos-to-neg edge same
    # clock transfers.  Whatever we calculate should be less than this.
    set fmax_panel_name "TimeQuest Timing Analyzer||* Model||* Model Fmax Summary"
    foreach panel_name [get_report_panel_names] {
      if {[string match $fmax_panel_name $panel_name] == 1} {
        set result [find_report_panel_row $panel_name 2 equal $clkname]
        set retval [lindex $result 0]
        if {$retval == 0} {
          set restricted_fmax_field [get_report_panel_data -id [lindex $result 1] -row [lindex $result 2] -col 1]
          regexp {([0-9\.]+)} $restricted_fmax_field restricted_fmax 
          if {$restricted_fmax < $fmax_from_summary} {
            set fmax_from_summary $restricted_fmax
          }
        }
      }
    }
    post_message "  Restricted Fmax from STA: $fmax_from_summary"

    # Find the worst case slack across all corners and metrics
    foreach metric $timing_metrics metric_required $timing_metric_required col_ndx $timing_metric_colindex {
      set panel_name "TimeQuest Timing Analyzer||Multicorner Timing Analysis Summary"
      set panel_id [get_report_panel_id $panel_name] 
      set result [find_report_panel_row $panel_name 0 equal " $clkname"]
      set retval [lindex $result 0]

      if {$retval == -1} { 
        if {$required == 1 && $metric_required == 1} {
          error "Error: Could not find clock: $clkname" 
        }
      } elseif {$retval < 0 && $retval != -4 } { 
        error "Error: Failed search for clock $clkname (error $retval)"
      }

      if {$retval == 0 || $retval == -4} {
        set slack [get_report_panel_data -id [lindex $result 1] -row [lindex $result 2] -col $col_ndx ]

        post_message "    $metric slack: $slack"
        set has_slack 1

        # Keep track of the most negative slack.
        if {$slack < $wc_slack} {
          set wc_slack $slack
          set wc_metric $metric
          }
      }
    }

    if {$has_slack == 1} {
        # Adjust the clock period to meet the worst-case slack requirement.
        set clk_period [expr $clk_period - $wc_slack]
        post_message "  Adjusted period: $clk_period ([format %+0.3f [expr -$wc_slack]], $wc_metric)"

        # Compute fmax from clock period. Clock period is in nanoseconds and the
        # fmax number should be in MHz.
        set fmax [expr 1000 / $clk_period]

        if {$fmax_from_summary < $fmax} {
            post_message "  Restricted Fmax from STA is lower than $fmax, using it instead."
            set fmax $fmax_from_summary
        }

        # Truncate to two decimal places. Truncate (not round to nearest) to avoid the
        # very small chance of going over the clock period when doing the computation.
        set fmax [expr floor($fmax * 100) / 100]
        post_message "  Fmax: $fmax"
    } else {
        post_message -type warning "No slack found for clock $clkname - assuming 10 GHz."
        set fmax 10000
    }

    return [list $fmax $clkname]
}

################################################################################
# Stratix V Pll functions - provided by Jimmy Kuo
################################################################################

proc my_set_rbc_check { rule_name reference_list } {
	global pll_configuration
	set result [get_advanced_pll_legality_legal_values -flow_type POST_FITTER -configuration_name $pll_configuration -rule_name $rule_name -param_args $reference_list]
	return $result
	#set result [get_advanced_pll_legality_info -configuration_name STRATIXV_PLL_CONFIG -rule_name $rule_name -option RULE_DEPENDENCIES]
}

proc get_advanced_pll_legality_solved_legal_pll_values {device_part ref_clk rbc_outclk_freq channel_spacing pll_type rule_name} {
	set result_out [list]
	set return_array [list]

	set pll_auto_reset "off"
	set pll_bandwidth_preset "auto"
	set pll_channel_spacing "0 kHz"
	set pll_compensation_mode "direct"
	set param_list [list]
	# Part
	lappend param_list $device_part
	# REFERENCE_CLOCK_FREQUENCY
	lappend param_list "$ref_clk MHz"
	# VCO_FREQUENCY 
	lappend param_list "$rbc_outclk_freq MHz"
	# PLL_DSM_OUT_SEL
	lappend param_list "false" 
	# PLL_AUTO_RESET
	lappend param_list $pll_auto_reset 
	# PLL_BANDWIDTH_PRESET
	lappend param_list $pll_bandwidth_preset  
	# PLL_CHANNEL_SPACING
	lappend param_list $pll_channel_spacing  
	# PLL_COMPENSATION_MODE
	lappend param_list $pll_compensation_mode  
	# PLL_FEEDBACK_CLOCK_SIGNAL
	lappend param_list "Global Clock"  


  	#output clock frequency rules
	set result_out [my_set_rbc_check $rule_name $param_list]
	#strip off {{ and }} from RBC
	regsub {([\{]+)} $result_out {} result_out
	regsub {([\}]+)} $result_out {} result_out
	#split each refclk freq returned
	set return_array [split $result_out |]

	return $return_array
}

# Return list of vco,m,n,k,r,cp if successful, otherwise return empty list
proc solve_pll_for_vco {output_clock_frequency} {
  global ref_fmax
  global fpga_part
  global frac_carryout
  set pll_type "fPLL"
  set pll_channel_spacing "0 kHz"
  
  post_message "Solving post-div vco $output_clock_frequency MHz from reference clock $ref_fmax MHz"

  set parameter_name_list [list FRACTIONAL_PLL_PLL_M_CNT_BYPASS_EN FRACTIONAL_PLL_PLL_M_CNT_HI_DIV FRACTIONAL_PLL_PLL_M_CNT_LO_DIV FRACTIONAL_PLL_PLL_N_CNT_BYPASS_EN FRACTIONAL_PLL_PLL_N_CNT_HI_DIV FRACTIONAL_PLL_PLL_N_CNT_LO_DIV FRACTIONAL_PLL_FRACTIONAL_CARRY_OUT FRACTIONAL_PLL_PLL_FRACTIONAL_DIVISION FRACTIONAL_PLL_PLL_FRACTIONAL_VALUE_READY FRACTIONAL_PLL_PLL_CP_COMP FRACTIONAL_PLL_PLL_CP_CURRENT FRACTIONAL_PLL_PLL_BWCTRL FRACTIONAL_PLL_PLL_VCO_DIV]

	set parameter_value_list [list]
  foreach rule_name $parameter_name_list {
    set info [get_advanced_pll_legality_solved_legal_pll_values $fpga_part $ref_fmax $output_clock_frequency $pll_channel_spacing $pll_type $rule_name]
    if { [string length $info ] == 0 } {
      # If PLL setting can't be found return empty list
      return [list]
    }
    lappend parameter_value_list $info
  }

  set m_bypass [lindex $parameter_value_list 0]
  set m_hi [lindex $parameter_value_list 1]
  set m_lo [lindex $parameter_value_list 2]
  set n_bypass [lindex $parameter_value_list 3]
  set n_hi [lindex $parameter_value_list 4]
  set n_lo [lindex $parameter_value_list 5]
  set frac_carryout_pll [lindex [lindex $parameter_value_list 6] 0]
  set frac_numerator [lindex $parameter_value_list 7]
  set cp [lindex $parameter_value_list 10]
  set r [lindex $parameter_value_list 11]
  set div [lindex $parameter_value_list 12]

  if { $m_bypass == "TRUE" } {
    set m "1"
  } else {
    set m [expr $m_hi + $m_lo]
  }

  if { $n_bypass == "TRUE" } {
    set n "1"
  } else {
    set n [expr $n_hi + $n_lo]
  }

  set k [ expr $frac_numerator * 2.0**$frac_carryout / 2.0**$frac_carryout_pll ]
  set k [ expr int ($k) ]

  set vco [ expr ($m + $k / 2.0**$frac_carryout)/$n * $ref_fmax ]

  # vco m n k r cp
  return [ concat $vco $m $n $k $r $cp $div]
}


# Return achieved fmax,m,n,k,c0,c1,r,cp
proc compute_pll_settings { fmax } {
  global fpga_part
  global pll_configuration
  set pll_settings [list]
  post_message "Computing pll settings for $fmax"

  
  # True VCO bandwidth is limited.  Find the post-div vco range for vco_div of
  # 1 and 2 corresponding to max and min respectively.
  set fvco_min [lindex [split [get_advanced_pll_legality_legal_values -flow_type POST_FITTER -configuration_name $pll_configuration -rule_name FRACTIONAL_PLL_FVCO_DEVICE_RANGE -param_args [list $fpga_part 2]] \{.\}] 1 ]
  set fvco_max [lindex [split [get_advanced_pll_legality_legal_values -flow_type POST_FITTER -configuration_name $pll_configuration -rule_name FRACTIONAL_PLL_FVCO_DEVICE_RANGE -param_args [list $fpga_part 1]] \{.\} ] 4]

  if { $fvco_min >= $fvco_max || $fvco_min < 5 || $fvco_min > 5000 || $fvco_max < 100 || $fvco_max > 10000 } {
    error "Found invalid fvco range: $fvco_min to $fvco_max"
  }

  while 1 {

    set c_min [expr int( ceil ( $fvco_min / $fmax / 2 ) ) * 2]
    set c_max [expr int( floor ( $fvco_max / $fmax ) ) ]
    for {set c0 $c_min} {$c0 <= $c_max} {set c0 [expr $c0 + 2] } {
      set params [ solve_pll_for_vco [expr $c0 * $fmax ] ]
      if { [llength $params] > 0 } {
        post_message "Solved VCO for C $c0: $params (vco m n k r cp div)"
        lappend pll_settings [expr [lindex $params 0] / $c0 ] 
        lappend pll_settings [lindex $params 1 ]
        lappend pll_settings [lindex $params 2 ]
        lappend pll_settings [lindex $params 3 ]
        lappend pll_settings [expr int ( $c0 ) ]
        lappend pll_settings [expr int ( $c0 / 2) ]
        lappend pll_settings [lindex $params 4 ]
        lappend pll_settings [lindex $params 5 ]
        lappend pll_settings [lindex $params 6 ]
        return $pll_settings 
      }
    }

    # Reduce fmax and try again.
    set fmax [expr int ($fmax * 100)/100.0 - 0.01 ]
    if { $fmax < 1 } break
  }

  error "No legal pll setting found!"
}

# Returns [k_fmax fmax1 k_clk_name fmax2 k_clk2x_name]
proc get_kernel_clks_and_fmax { k_clk_name k_clk2x_name } {
    set result [list]
    # Read in the achieved fmax
    post_message "Calculating maximum fmax..."
    set x [ get_fmax_from_report $k_clk_name 1 ]
    set fmax1 [ lindex $x 0 ]
    set k_clk_name [ lindex $x 1 ]
    set x [ get_fmax_from_report $k_clk2x_name 0 ]
    set fmax2 [ lindex $x 0 ]
    set k_clk2x_name [ lindex $x 1 ]

    # The maximum is determined by both the kernel-clock and the double-pumped clock
    set k_fmax $fmax1
    if { [expr 2 * $fmax1] > $fmax2 } {
       set k_fmax [expr $fmax2 / 2.0]
    }
    return [list $k_fmax $fmax1 $k_clk_name $fmax2 $k_clk2x_name]
}

# Returns list:  freq_per_kernel system_name, kernel_names, 
proc parse_bcxml { } {

  set freq_per_kernel 0
  set system_name ""
  set kernel_names [list]

  set bcxml_files [glob -nocomplain *.bc.xml]

  if {[llength $bcxml_files] == 0} {
    return [list $freq_per_kernel $system_name $kernel_names]
  } elseif {[llength $bcxml_files] > 1} {
    post_message -type warning "More than one bc.xml detected. Picking the first one."
  }
  set bcxml_file [lindex $bcxml_files 0]

  set bcxml [open $bcxml_file r]
  while { [gets $bcxml line] >= 0 } {
    if { [ string match "*<FREQ_PER_KERNEL *" $line ] } {
      regexp {FREQ_PER_KERNEL enabled=\"([01]+)\"} $line res freq_per_kernel
      post_message "Frequency-set-per-kernel parameter set to $freq_per_kernel"
    }
    if { [ string match "*<KERNEL *" $line ] } {
      regexp {KERNEL name=\"([A-Za-z_0-9]+)\" filename=\"([A-Za-z_0-9]+).v\"} $line res k_name f_name
      post_message "Found kernel $k_name"
      lappend kernel_names $k_name

      if {[string length $system_name] == 0} {
        set system_name $f_name
      } elseif { $system_name != $f_name } {
        error "Error: We assume there's only one file name which matches the system name";
      }
    }
  }
  close $bcxml
  return [list $freq_per_kernel $system_name $kernel_names]
}

#Return list of lists - pll settings per kernel
proc get_freq_each_kernel { mif project_name system_name kernel_names ref_fmax k_clk_name k_clk2x_name} {
  set result [list]

  if { [llength $kernel_names] < 2} {
    return $result
  }

  set pllkern [open "pllkern.dat" w]
  for {set i 0} {$i < [llength $kernel_names] } {incr i} {

    # Modify .sdc so that sta uses new clock speeds
    set sdc_clean_file "$project_name\_guaranteed_timing.sdc"
    set sdc [open $sdc_clean_file w]
    # Set false paths on all kernels except i-th
    for {set j 0} {$j < [llength $kernel_names] } {incr j} {
      if { $i == $j } {
        continue
      }
      puts $sdc "set_false_path -from * -to system:system_inst|$system_name\_system:[string tolower $system_name]\_system|[lindex $kernel_names $j]\_top_wrapper:[lindex $kernel_names $j]|*"
      puts $sdc "set_false_path -from system:system_inst|$system_name\_system:[string tolower $system_name]\_system|[lindex $kernel_names $j]\_top_wrapper:[lindex $kernel_names $j]|* -to *"
    }
    close $sdc

    unload_report
    if {[catch {execute_module -tool sta} res]} {
      post_message "Error! $res"
    }
    load_report $project_name

    set k_fmax [get_kernel_clks_and_fmax $k_clk_name $k_clk2x_name]
    set k_fmax [lindex $k_fmax 0]
    set pll_settings [compute_pll_settings $k_fmax]
    puts $pllkern "[lindex $kernel_names $i] $pll_settings"
    post_message "Kernel [lindex $kernel_names $i] pll settings:  $pll_settings"
    lappend result $pll_settings
  }

  close $pllkern

  unload_report

  # Nuke sdc
  set sdc [open $sdc_clean_file w]
  close $sdc

  return $result
}

################################################################################
# Modify PLL atom
################################################################################



########################## Helper Functions ############################

proc get_family_name {} {
	set family_assmt [get_global_assignment -name FAMILY]

	#remove spaces and dashes from name to make sure its normalized
	return [string tolower [string map -nocase {" " "" "-" ""} $family_assmt]]
}

proc get_all_pll_nodes { } {
	set node_list ""
	foreach_in_collection node [get_atom_nodes -type PLL] {
		lappend node_list $node
	}
	foreach_in_collection node [get_atom_nodes -type FRACTIONAL_PLL] {
		lappend node_list $node
	}
	return $node_list
}

# 'node_name' can be actual name of node 
#    or location of node with format "@<location>" like "@FRACTIONALPLL_X98_Y109_N0"
proc get_node_by_node_name { node_name } {
	set first_char [string index $node_name 0]
	
	if {$first_char == "@"} {
		set requested_location [string range $node_name 1 end]
		foreach node [get_all_pll_nodes] {
			set location [get_atom_node_info -key LOCATION -node $node]
			if {[string equal -nocase $location $requested_location]} {
				return $node
			}
		}
		post_message "Error: Couldn't find node with location '$requested_location'"
		print_usage
		exit 1
	} else {
		return [get_atom_node_by_name -name $node_name]
	}
}

proc get_node_list { node_name_list } {

	set node_list ""

	if {$node_name_list == ""} {
		# process all pll nodes
		set node_list [get_all_pll_nodes]
	} else {
		foreach node_name $node_name_list {
			if {$node_name == ""} {
				# process all pll nodes
				set node_list [get_all_pll_nodes]
				break
			} else {
				lappend node_list [get_node_by_node_name $node_name]
			}			
		}
	}

	return $node_list
}

# Takes an integer divisor and converts it to a 4-part list:
# [ bypass_en hi_div lo_div odd_duty_en ] 
proc plldivint2bits { int } {
  if { $int < 1 } {
    post_message -type error "Invalid PLL divisor: $int";
  } elseif { $int == 1 } {
    return [ list 1 256 256 0 ]
  } else {
    if { [expr $int % 2 ] == 1} {
      return [ list 0 [expr $int / 2 + 1] [expr $int / 2 ] 1]
    } else {
      return [ list 0 [expr $int / 2 ] [expr $int / 2 ] 0 ]
    }
  }
  return [list]
}

proc dump_node { node param_list } {

  set name [ get_atom_node_info -key NAME -node $node ]
  #post_message [get_legal_info_keys -type all -node $node]

  set params [list]
  foreach p $param_list {
    set keyname [string toupper $p]
    lappend params "$p: [ get_atom_node_info -key $keyname -node $node ]"
  }
  post_message " Parameters for node: $name" -submsgs $params

}

proc write_node { node param_list value_list } {

  post_message " Found node: [ get_atom_node_info -key NAME -node $node ]"

  foreach p $param_list v $value_list {
    set keyname [string toupper $p]
    post_message "  Setting $keyname to $v "
    set_atom_node_info -key $keyname -node $node $v
  }
}


proc write_pll_atoms { top m n k c0 c1 r cp div } {

  post_message "Overwriting kernel_pll atoms with: $m $n $k $c0 $c1 $r $cp $div"

  set fpll_search_string "*kernel_pll*"
  # This string will be replaced with the counter names
  set fpll_replace_string {[A-z0-9_]+:fpll_0\|fpll}

  set fpll_name ""
  set c0_name ""
  set c1_name ""

  set fpll_param_list [list \
    bool_pll_m_cnt_bypass_en int_pll_m_cnt_hi_div int_pll_m_cnt_lo_div bool_pll_m_cnt_odd_div_duty_en \
    bool_pll_n_cnt_bypass_en int_pll_n_cnt_hi_div int_pll_n_cnt_lo_div bool_pll_n_cnt_odd_div_duty_en \
    int_pll_bwctrl int_pll_cp_current \
    int_pll_vco_div uint_pll_fractional_division \
    ]


  set counter_param_list [list \
    bool_dprio0_cnt_bypass_en int_dprio0_cnt_hi_div int_dprio0_cnt_lo_div bool_dprio0_cnt_odd_div_even_duty_en ]
  if { [ get_family_name ] != "cyclonev" } {
    lappend counter_param_list bool_dprio1_cnt_bypass_en int_dprio1_cnt_hi_div int_dprio1_cnt_lo_div bool_dprio1_cnt_odd_div_even_duty_en
  }

  read_atom_netlist

  foreach node [get_node_list "" ]  {
    set node_name [ get_atom_node_info -key NAME -node $node]
    if { [ string match $fpll_search_string $node_name ] == 1} {
      post_message "Found kernel_pll: $node_name"
      set fpll_name $node_name
      break
    }
  }
  if {$fpll_name == ""} {
    post_message -type error "Can't find kernel_pll atom, is the acl_kernel_clk module instantiated in the system?"
    return
  }

  # Derive output counter node names from fpll node name and check that they exist
  if { [regsub $fpll_replace_string  $fpll_name "counter\[0\].output_counter" c0_name ] != 1 } {
    post_message -type error "Failed to derive kernel_pll counter 0 node from pll: $fpll_name"
    return
  }
  post_message "Derived C0 : $c0_name"
  post_message "Verifying C0 exists, node_id = [get_atom_node_by_name -name $c0_name]"

  if { [regsub $fpll_replace_string  $fpll_name "counter\[1\].output_counter" c1_name ] != 1 } {
    post_message -type error "Failed to derive kernel_pll counter 1 node from pll: $fpll_name"
    return
  }
  post_message "Derived C1: $c1_name"
  post_message "Verifying C1 exists, node_id = [get_atom_node_by_name -name $c1_name]"


  set kpll [ get_node_list $fpll_name ] 

  #post_message "Initial PLL configuration"
  #dump_node $kpll $fpll_param_list

  write_node $kpll $fpll_param_list [concat [plldivint2bits $m] [plldivint2bits $n] [ list $r $cp $div $k ]]

  set kc0 [ get_node_list $c0_name ] 
  set kc1 [ get_node_list $c1_name ] 

  if { [ get_family_name ] == "cyclonev" } {
    write_node $kc0 $counter_param_list [plldivint2bits $c0]
    write_node $kc1 $counter_param_list [plldivint2bits $c1]
  } else {
    write_node $kc0 $counter_param_list [concat [plldivint2bits $c0] [plldivint2bits $c0] ]
    write_node $kc1 $counter_param_list [concat [plldivint2bits $c1] [plldivint2bits $c1] ]
  }

  dump_node $kpll $fpll_param_list
  dump_node $kc0 $counter_param_list
  dump_node $kc1 $counter_param_list

  write_atom_netlist -pdb -file db/
  unload_atom_netlist
  # Force sta timing netlist to be rebuilt
  file delete [glob -nocomplain db/${top}.sta_cmp.*.tdb]
}

##############################################################################
##############################       MAIN        #############################
##############################################################################

set project_name ""

if { ! [is_project_open] } {

  # Dynamically determine the project name by finding the qpf in the directory.
  set qpf_files [glob -nocomplain *.qpf]

  if {[llength $qpf_files] == 0} {
    error "No QPF detected"
  } elseif {[llength $qpf_files] > 1} {
    post_message -type warning "More than one QPF detected. Picking the first one."
  }

  set qpf_file [lindex $qpf_files 0]
  set qpf_name [string range $qpf_file 0 [expr [string first . $qpf_file] - 1]]
  project_open $qpf_name -current_revision
}

set project_name [get_current_revision]
post_message "Revision name: $project_name"

set sdc_clean_file "$project_name\_guaranteed_timing.sdc"
set k_clk_name_full   $k_clk_name
set k_clk2x_name_full $k_clk2x_name

load_report $project_name

# Process arguments.
set fmax1 unknown
set fmax2 unknown
set do_update_mif 1
set do_asm 1
set do_sta 1
set do_plltest 0

for {set i 0} {$i < $argc} {incr i} {
   set v [lindex $argv $i]

   if {[string compare $v "-fmax"] == 0 && $i < [expr $argc - 1]} {
      set k_fmax [lindex $argv [expr $i + 1]]
      post_message "Forcing kernel frequency to $k_fmax"
   } elseif {[string compare $v "-skipmif"] == 0} {
      set do_update_mif 0
   } elseif {[string compare $v "-skipasm"] == 0} {
      set do_asm 0
   } elseif {[string compare $v "-skipsta"] == 0} {
      set do_sta 0
   } elseif {[string compare $v "-testpll"] == 0} {
      set do_sta 0
      set do_asm 0
      set do_update_mif 0
      set do_plltest 1
      set k_fmax 100.0
   }
}

if {$k_fmax == -1} {
    set x [get_kernel_clks_and_fmax $k_clk_name $k_clk2x_name]
    set k_fmax       [ lindex $x 0 ]
    set fmax1        [ lindex $x 1 ]
    set k_clk_name_full   [ lindex $x 2 ]
    set fmax2        [ lindex $x 3 ]
    set k_clk2x_name_full [ lindex $x 4 ]
}

post_message "Kernel Fmax determined to be $k_fmax\n";

set fpga_part [get_global_assignment -name DEVICE]
if { [ get_family_name ] == "cyclonev" } {
  set pll_configuration CYCLONEV_PLL_CONFIG
} elseif { [ get_family_name ] == "arriav" } {
  set pll_configuration ARRIAV_PLL_CONFIG
} else {
  set pll_configuration STRATIXV_PLL_CONFIG
}

# Parse some of the PLL settings out of the file
set pll_file [glob -nocomplain "system/synthesis/submodules/*_kernel_pll.v"]
if {[llength $pll_file] == 0} {
  post_message -type error "Failed to find kernel_pll.v.  This script assumes you are using the Kernel Clock Generator\n";
  exit 1
} elseif {[llength $pll_file] > 1} {
  post_message -type error "Found too many kernel_pll.v files.  Please delete your Qsys generated files and regenerate.\n";
  exit 1
}
set file [open $pll_file r]
while {[gets $file line] >= 0} {
  if {[regexp "reference_clock_frequency" $line]} {
    regexp {([0-9]*\.?[0-9]+)} $line ref_fmax 
  } elseif {[regexp "pll_fractional_cout" $line]} {
    regexp {([0-9]+)} $line frac_carryout 
  }
}
close $file

if { $ref_fmax < 1.0 || $ref_fmax > 2000.0} {
  error "Reference clock is out of bounds: $ref_fmax"
} else {
  post_message "Kernel PLL reference clock is: $ref_fmax MHz"
}

if {$do_plltest == 1} {
  # Open gluplot (from fresh terminal since ARC kills environment) and do:
  # plot "plltest.dat"
  set fachieved [open "plltest_achieved.dat" w]
  set fsettings [open "plltest_settings.dat" w]

  #post_message "Output fmax m n k c0 c1"
  for {set k_fmax 1.0} {$k_fmax <= 325.0} {set k_fmax [expr $k_fmax + 1.0 ]} {
    set pll_settings [compute_pll_settings $k_fmax]
    #post_message "Output $k_fmax $pll_settings"
    puts $fachieved "$k_fmax \t [lindex $pll_settings 0]"
    puts $fsettings "[expr int ([lindex $pll_settings 0] * 1000.0 + 0.5) ] [lrange $pll_settings 1 [llength $pll_settings]]"
  }

  close $fachieved
  close $fsettings
  post_message "DONE PLL settings Test"
  exit
}

load_package atoms

set pll_settings [compute_pll_settings $k_fmax]
post_message "Computed PLL settings: fmax m n k c0 c1 r cp div"
post_message "Computed PLL values: $pll_settings"
set k_achieved [lindex $pll_settings 0]
set m [lindex $pll_settings 1]
set n [lindex $pll_settings 2]
set k [lindex $pll_settings 3]
set c0 [lindex $pll_settings 4]
set c1 [lindex $pll_settings 5]
set r [lindex $pll_settings 6]
set cp [lindex $pll_settings 7]
set div [lindex $pll_settings 8]
post_message "finfpd [expr $ref_fmax / $n]"
set fvco [expr $ref_fmax * ($m + $k / 16777216.0) / $n]
post_message "post-div fvco $fvco"
post_message "true fvco [expr $fvco * $div]"
post_message "kernel_fmax [expr $fvco / $c0 ] "
post_message "kernel2x_fmax [expr $fvco / $c1 ] "

# A little report
set outfile   [open "acl_quartus_report.txt" w]
set aluts_l   [regsub "," [get_fitter_resource_usage -alut] "" ]
if {[catch {set aluts_m [regsub "," [get_fitter_resource_usage -resource "Memory ALUT usage"] "" ]} result]} {
  set aluts_m 0
}
if { ! [string is integer $aluts_m] } {
  set aluts_m 0
}
set aluts     [expr $aluts_l + $aluts_m]
set registers [get_fitter_resource_usage -reg]
# Broken in 12.1 FB:80106 set logicutil [get_fitter_resource_usage -utilization]
set logicutil [get_fitter_resource_usage -resource "Logic utilization (ALMs needed / total ALMs on device)"]
regexp {([0-9,]+) / ([0-9,]+)} $logicutil dum alms total_alms
set pct_logutil [ expr int (100.0 * [regsub "," $alms ""] / [regsub "," $total_alms ""]) ]
set io_pin    [get_fitter_resource_usage -io_pin]
set dsp       [get_fitter_resource_usage -resource "*DSP*"]
set mem_bit   [get_fitter_resource_usage -mem_bit]
set m9k       [get_fitter_resource_usage -resource "M?0K*"]
puts $outfile "ALUTs: $aluts"
puts $outfile "Registers: $registers"
puts $outfile "Logic utilization: $logicutil ( $pct_logutil % )"
puts $outfile "I/O pins: $io_pin"
puts $outfile "DSP blocks: $dsp"
puts $outfile "Memory bits: $mem_bit"
puts $outfile "RAM blocks: $m9k"
puts $outfile "Actual clock freq: $k_achieved"
puts $outfile "Kernel fmax: $k_fmax"
puts $outfile "1x clock fmax: $fmax1"
puts $outfile "2x clock fmax: $fmax2"

# Highest non-global fanout signal
set result [find_report_panel_row "Fitter||Resource Section||Fitter Resource Usage Summary" 0 equal "Highest non-global fan-out"]
if {[lindex $result 0] < 0} {error "Error: Could not find highest non-global fan-out (error $retval)"}
set high_fanout_signal_fanout_count [get_report_panel_data -id [lindex $result 1] -row [lindex $result 2] -col 1]

puts $outfile "Highest non-global fanout: $high_fanout_signal_fanout_count"

close $outfile
# End little report

unload_report

# Parse the bc.xml file for option to do per-kernel pll reconfig
set x [parse_bcxml]
set freq_per_kernel [lindex $x 0]
set system_name [lindex $x 1]
set kernel_names [split [lindex $x 2] " "]

post_message "Found [llength $kernel_names] kernels"

# Load pll_rom with parameters
set mif_file "pll_rom.mif"
set mif [open $mif_file w]
set pll_rom_depth [expr int ($max_pll_rom_bytes / 4 ) ]
puts $mif "DEPTH=$pll_rom_depth;"
puts $mif "WIDTH=32;"
puts $mif "ADDRESS_RADIX=DEC;"
puts $mif "DATA_RADIX=DEC;"
puts $mif "CONTENT BEGIN"
puts $mif "0 : [expr int ($k_achieved * 1000)];"
puts $mif "1 : $m;"
puts $mif "2 : $n;"
puts $mif "3 : $k;"
puts $mif "4 : $c0;"
puts $mif "5 : $c1;"
puts $mif "6 : $r;"
puts $mif "7 : $cp;"
puts $mif "8 : $div;"

set k_pll_settings ""
if {$freq_per_kernel == 1} {
  set k_pll_settings [get_freq_each_kernel $mif $project_name $system_name $kernel_names $ref_fmax $k_clk_name $k_clk2x_name]
}

set addr [llength $pll_settings]
for {set i 0} {$i < [llength $k_pll_settings] } {incr i} {
  set ith_pll_settings [split [lindex $k_pll_settings $i] " "]
  post_message "$ith_pll_settings"
  for {set j 0} {$j < [llength $ith_pll_settings] } {incr j} {
    if { $j == 0 } {
      puts $mif "$addr : [expr int(1000 * [lindex $ith_pll_settings $j])];"
    } else {
      puts $mif "$addr : [lindex $ith_pll_settings $j];"
    }
    incr addr
    if { $addr >= $pll_rom_depth } {
      error "PLL ROM size exceeded - too many kernels"
    }
  }
}

# Zero out rest of mif
puts $mif "\[$addr\.\.[expr $pll_rom_depth - 1 ]\] : 0 ;"

puts $mif "END;"
close $mif
qexec "mif2hex $mif_file pll_rom.hex"

write_pll_atoms $project_name $m $n $k $c0 $c1 $r $cp $div

if {$do_update_mif} {
    if {[catch {execute_module -tool cdb -args "-update_mif"} result]} {
      post_message -type error "Error! $result"
      exit 2
    }
} else {
    post_message "Skipping update MIF as requested"
}

if {$do_asm} {
    if {[catch {execute_module -tool asm} result]} {
      post_message -type error "Error! $result"
      exit 2
    }
} else {
    post_message "Skipping ASM as requested"
}

set_global_assignment -name SDC_FILE $sdc_clean_file -tag aocl_guaranteed_timing

if {$do_sta} {

    # Preserve original sta report
    file copy -force $project_name.sta.rpt $project_name.sta-orig.rpt

    # Modify .sdc so that sta uses new clock speeds
    set sdc [open $sdc_clean_file w]
    puts $sdc "set kernel_fmax $k_achieved"
    puts $sdc "if { \$::TimeQuestInfo(nameofexecutable) == \"quartus_sta\" } {"
    puts $sdc "  post_message -type warning \"Executing OpenCL guaranteed timing flow - this timing report assumes the kernel PLL will be reconfigured to run at \$kernel_fmax MHz.\""

    puts $sdc "  if { \[ get_collection_size \[get_clocks $k_clk_name_full\] \] != 1 } {"
    puts $sdc "    post_message -type error \"Unable to find OpenCL kernel clock $k_clk_name_full.  Make sure this is called after derive_pll_clocks\""
    puts $sdc "  }"
    puts $sdc "  set kclk \[get_clocks {$k_clk_name_full}\]"

    puts $sdc "  set has_2x_clk 1"
    puts $sdc "  if { \[ get_collection_size \[get_clocks {$k_clk2x_name_full}\] \] == 0 } {"
    puts $sdc "    set has_2x_clk 0"
    puts $sdc "  }"
    puts $sdc "  set kclk2x \[get_clocks {$k_clk2x_name_full}\]"

    puts $sdc "  set refclk \[get_clock_info -master_clock \$kclk \]"
    puts $sdc "  post_message -type info \"Found refclk for kernel clk: \$refclk\""

    puts $sdc "  set srcpin \[get_clock_info -master_clock_pin \$kclk \]"
    puts $sdc "  post_message -type info \"Found source for kernel clk: \$srcpin\""

    puts $sdc "  set period \[get_clock_info -period \$kclk \]"
    puts $sdc "  post_message -type info \"kernel clk has period: \$period\""

    puts $sdc "  set multby \[get_clock_info -multiply_by \$kclk \] "
    puts $sdc "  set divby \[get_clock_info -divide_by \$kclk \] "
    puts $sdc "  post_message -type info \"kernel clk has multby: \$multby and divby: \$divby\""

    # Do pll adjust
    puts $sdc "  set multby \[ expr \$multby * \[ expr int( \$period * 1000 )\] \]"
    puts $sdc "  set divby \[ expr \$divby * \[ expr int( ceil( 1000 / \$kernel_fmax * 1000 ))\] \]"
    puts $sdc "  post_message -type info \"Using adjusted multby: \$multby and divby: \$divby\""

    puts $sdc "  remove_clock {$k_clk_name_full}"
    puts $sdc "  create_generated_clock -name {$k_clk_name_full} -source \[ get_node_info -name \[ get_nodes \{$k_clk_pin\} \] \] -multiply_by \$multby -divide_by \$divby -master_clock \$refclk \[get_pins $k_clk_name_full\]"

    puts $sdc "  if { \$has_2x_clk } {"
    puts $sdc "    remove_clock {$k_clk2x_name_full}"
    puts $sdc "    create_generated_clock -name {$k_clk2x_name_full} -source \[get_node_info -name \[ get_nodes \{$k_clk2x_pin\} \] \] -multiply_by \[ expr \$multby * 2\] -divide_by \$divby -master_clock \$refclk \[get_pins {$k_clk2x_name_full}\]"
    puts $sdc "  }"

    puts $sdc "  post_message -type info \"Re-created kernel clock with period \[ get_clock_info -period $k_clk_name_full \]\""

    puts $sdc "}"

    close $sdc

    if {[catch {execute_module -tool sta -args "--report_script=$::env(ALTERAOCLSDKROOT)/ip/board/bsp/failing_clocks.tcl"} result]} {
      post_message -type error "Error! $result"
      exit 2
    } 

} else {
    post_message "Skipping STA as requested"
}

