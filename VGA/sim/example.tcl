# This script is supposed to be run under work/synth directory,
# Following relative paths reflects this fact.
set top_dir  ../..
set work_dir ..
set scripts_dir ../scripts

# synthesis parameters
set top_module  tb_alu_serial_ff
set sources     "$top_dir/lib/alu_serial_ff.v        \
                 $top_dir/tb/tb_alu_serial_ff_ivl.v"
set incdirs     "$top_dir/lib  $top_dir/tb"
set constraints "$scripts_dir/all_constr.xdc"
set device      xczu7ev-ffvc1156-2-e          ;# ZCU-104
set jobs        10


# Execution
set_param general.maxThreads  $jobs

read_verilog  $sources
read_xdc      $constraints
synth_design  -rtl  \
              -include_dirs $incdirs \
              -top $top_module  -part $device \
              -mode out_of_context

#in makefile to call it

#tb_boothR2_alu_xil: $(TOP_DIR)/lib/boothR2_serial_alu.v  $(TOP_DIR)/tb/tb_boothR2_alu_ivl.v  # <command>
	# @python3 ../scripts/simulate.py \
	# 	rtl_xsim modules='$(TOP_DIR)/lib/boothR2_serial_alu.v'  \
	# 					 tb='$(TOP_DIR)/tb/tb_boothR2_alu_ivl.v' \
	# 					 outname='tb_boothR2_alu_rtl' \
	# 					 top='tb_boothR2_alu' verbose=0 \
	# 					 log='xsim.log'
	# tail xsim.log