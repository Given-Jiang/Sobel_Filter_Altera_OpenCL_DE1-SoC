# Launch command: quartus_stp -t <thisfilename.tcl>
#
# Outputs a .csv file with the contents of the debug memories

package require ::quartus::insystem_memory_edit
package require ::quartus::jtag

############################## functions #########################

# Read in .jdi file and isolate lsu name from for a given instance id
proc get_lsu_name { instance_id } {

  set jdi_files [glob -nocomplain *.jdi]
  if {[llength $jdi_files] == 0} {
    error "Error: No .jdi file found. Compile design and run this script from the project directory."
  }
  set jdi_name [lindex $jdi_files 0]
  set jdi [open $jdi_name r]
  while { [gets $jdi line] >= 0 } {
    if { [ string match "*node hpath* instance_id=\"$instance_id\" * node_id=\"3\"*" $line ] } {
      close $jdi
      regexp {lsu_local_([A-Za-z_0-9]+)\|} $line res lsu
      regexp {_function:([A-Za-z_0-9]+)_function_inst([0-9]+)\|} $line res kernel kernelinst
      return "$kernel$kernelinst\_$lsu"
    }
  }
  close $jdi
  error "Detected editable memory with id $instance_id, but does not exist in .jdi"
}

proc bitstring2int {bits} {
  set res 0
  set len [string length $bits]
  for {set w 0} { $w < $len } { incr w } {
    if { [string index $bits $w ] == 1 } {
      set base [expr round(pow( 2,[expr $len-1-$w]))]
      incr res $base
    }
  }
  return $res
}

############################## main() #########################

set found_hw 0
foreach hardware_name [get_hardware_names] {
  if { [string match "USB-Blaster*" $hardware_name] } {
    set usbblaster $hardware_name
    set found_hw 1
  }
}
if { $found_hw == 0 } {
  error "No USB-Blaster hardware found"
}

puts "Searching for devices on hardware: $usbblaster"

foreach d [ get_device_names -hardware_name $usbblaster ] {
  puts "Found device: $d"
  if { [ string match "@1*" $d ] } {
    set device_name $d
  }
}

begin_memory_edit -hardware_name $usbblaster -device_name $device_name

set csv [open "acldebugmem.csv" w]

foreach i [get_editable_mem_instances -hardware_name $usbblaster -device_name $device_name] {
  set instance_id [lindex $i 0]
  set depth [lindex $i 1]
  set width [lindex $i 2]
  set lsu_name [get_lsu_name $instance_id]

  set mem_contents [read_content_from_memory -instance_index $instance_id -start_address 0 -word_count $depth]

  if { [ string length $mem_contents ] != [ expr $depth * $width ] } {
    error "Array size does not match for $lsu_name, expected $width x $depth"
  }

  puts "Found: $lsu_name,$instance_id,$depth,$width,[lindex $i 3],[lindex $i 4],[lindex $i 5]"

  puts -nonewline $csv "$lsu_name"
  for {set d $depth} { $d >= 1 } { incr d -1 } {
    puts -nonewline $csv ",[bitstring2int [string range $mem_contents [expr $d*$width-$width] [expr $d*$width-1] ] ]"
  }
  puts $csv ""
}

close $csv

end_memory_edit 
