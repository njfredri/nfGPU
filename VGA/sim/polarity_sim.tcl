#assume you are running from within the sim folder
puts "Current Directory: [pwd]"
set top_dir .

puts "top_dir: $top_dir"

create_project -force -part xczu7ev-ffvc1156-2-e  polarity_changer_tb polarity_changer_tb

# sim parameters
set top_module  polarity_changer_tb
set sources     "$top_dir/../polarity_changer.v"
set tb     "$top_dir/../tb/polarity_changer_tb.v"
# set constraints "$scripts_dir/all_constr.xdc"
set device      xczu7ev-ffvc1156-2-e          ;# ZCU-104
set jobs        10

set_param general.maxThreads  $jobs

read_verilog  $sources
read_verilog  $tb

set_property top polarity_changer_tb [get_fileset sim_1]

launch_simulation
run all


#!/usr/bin/env -S vivado -mode batch -source

# create_project -force -part xczu7ev-ffvc1156-2-e  polarity_changer_tb polarity_changer_tb

# add_files -fileset sources_1 {  \
#         ../polarity_changer.v   \
#         ../tb/polarity_changer_tb.v     \
# }
# set_property file_type {Verilog} [get_files *.v]

# # Update the compile order for the fileset
# update_compile_order -fileset sources_1

# # Set the top module for simulation
# set_property top thing_tb [get_fileset sim_1]

# launch_simulation
# run all
