# Define the project directory and project name
set project_dir "../"
set project_name "video_timer_sim"

# Define the source files
set source "../video_timer.v"
set testbench "../sim/testbench.v"

# Define the top module
set top_module "video_timer_tb"
set source_module "Video_Timer"

# Create a simulation library
create_simlib -force

# Compile the Verilog file
vlog $source
vlog $testbench

#elaborate the design
elaborate $top_module

#open the waveform window
open_waveform

#add signals to the waveform


#run the simulation
run 1000 ns