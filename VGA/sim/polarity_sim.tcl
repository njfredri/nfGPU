#assume you are running from within the sim folder
set top_dir ..

# sim parameters
set top_module  tb_alu_serial_ff
set sources     "$top_dir/"
set incdirs     "$top_dir/lib  $top_dir/tb"
set constraints "$scripts_dir/all_constr.xdc"
set device      xczu7ev-ffvc1156-2-e          ;# ZCU-104
set jobs        10