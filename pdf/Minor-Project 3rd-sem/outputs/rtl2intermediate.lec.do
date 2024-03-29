vpx set dofile abort exit
vpx set screen display -noprogress
tclmode

# Generated by Genus(TM) Synthesis Solution 17.21-s010_1, revision 1.257c
# Generated on: Sat Dec 30 13:20:25 IST 2023 (Sat Dec 30 07:50:25 GMT 2023)

tcl_set_command_name_echo on

set_log_file logs/rtl2intermediate.lec.log -replace

usage -auto -elapse

set_verification_information rtl_fv_map_db

read_implementation_information fv/aes_cipher_top -revised fv_map

set_parallel_option -threads 4 -license "xl lp gxl lpgxl eco ecogxl" -norelease_license

set env(RC_VERSION)     "17.21-s010_1"
set env(CDN_SYNTH_ROOT) "/home/install/GENUS172/tools.lnx86"
set CDN_SYNTH_ROOT      "/home/install/GENUS172/tools.lnx86"
set env(CW_DIR) "/home/install/GENUS172/tools.lnx86/lib/chipware"
set CW_DIR      "/home/install/GENUS172/tools.lnx86/lib/chipware"

set_lowpower_option -native_1801
set_lowpower_option -native_1801

set_lowpower_option -native_1801
set_lowpower_option -revised_analysis_style  post_synthesis

# default is to error out when module definitions are missing
set_undefined_cell black_box -noascend -both

add_search_path . -library -both
read_library -liberty -both -lp  /home/vlsi1/pdTraining/synthesis/../technology/45/lib/max/MEM2_4096X32_slow.lib /home/vlsi1/pdTraining/synthesis/../technology/45/lib/max/MEM2_2048X32_slow.lib /home/vlsi1/pdTraining/synthesis/../technology/45/lib/max/pdkIO.lib /home/vlsi1/pdTraining/synthesis/../technology/45/lib/max/MEM2_512X32_slow.lib /home/vlsi1/pdTraining/synthesis/../technology/45/lib/max/MEM2_136X32_slow.lib /home/vlsi1/pdTraining/synthesis/../technology/45/lib/max/MEM2_128X16_slow.lib /home/vlsi1/pdTraining/synthesis/../technology/45/lib/max/MEM2_1024X32_slow.lib /home/vlsi1/pdTraining/synthesis/../technology/45/lib/max/MEM1_4096X32_slow.lib /home/vlsi1/pdTraining/synthesis/../technology/45/lib/max/MEM1_256X32_slow.lib /home/vlsi1/pdTraining/synthesis/../technology/45/lib/max/MEM1_1024X32_slow.lib /home/vlsi1/pdTraining/synthesis/../technology/45/lib/max/slow.lib /home/vlsi1/pdTraining/synthesis/../technology/45/lib/max/MEM2_128X32_slow.lib

set_undriven_signal Z -golden
set_naming_style rc -golden
set_naming_rule "%s\[%d\]" -instance_array -golden
set_naming_rule "%s_reg" -register -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -instance -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -variable -golden

set_hdl_options -VERILOG_INCLUDE_DIR "incdir:sep:src:cwd"

add_search_path . -design -golden
read_design -enumconstraint  -define SYNTHESIS  -merge bbox -golden -lastmod -noelab -systemverilog ../riscvCoreSyntaCore1/ips/design/aes_cipher_top/verilog/aes_cipher_top.v ../riscvCoreSyntaCore1/ips/design/aes_cipher_top/verilog/aes_key_expand_128.v ../riscvCoreSyntaCore1/ips/design/aes_cipher_top/verilog/aes_rcon.v ../riscvCoreSyntaCore1/ips/design/aes_cipher_top/verilog/aes_sbox.v
elaborate_design -golden -root {aes_cipher_top} -rootonly 

read_design -verilog95   -revised -lastmod -noelab fv/aes_cipher_top/fv_map.v.gz
elaborate_design -revised -root {aes_cipher_top}

uniquify -all -nolib -golden

read_power_intent -insert_isolation  -1801 -golden ../scripts/genus/block.upf

read_power_intent  -1801 -revised fv/aes_cipher_top/fv_map.upf

report_design_data
report_black_box

set_flatten_model -seq_constant
set_flatten_model -seq_constant_x_to 0
set_flatten_model -nodff_to_dlat_zero
set_flatten_model -nodff_to_dlat_feedback
set_flatten_model -hier_seq_merge

#add_name_alias fv/aes_cipher_top/fv_map.singlebit.original_name.alias.json.gz -revised
#set_mapping_method -alias -revised
#add_renaming_rule r1alias _reg((\\\[%w\\\])*(/U\\\$%d)*)$ @1 -type dff -both

set_analyze_option -auto

write_hier_compare_dofile hier_tmp2.lec.do -noexact_pin_match -constraint -usage -replace -balanced_extraction -input_output_pin_equivalence -prepend_string " analyze_datapath -module -verbose ; analyze_datapath  -verbose; "
run_hier_compare hier_tmp2.lec.do -dynamic_hierarchy

report_verification -hier -verbose
set_system_mode lec
puts "No of diff points    = [get_compare_points -NONequivalent -count]"
if {[get_compare_points -NONequivalent -count] > 0} {
    puts "------------------------------------"
    puts "ERROR: Different Key Points detected"
    puts "------------------------------------"
}

write_verification_information
report_verification_information

tclmode
puts "No of compare points = [get_compare_points -count]"
puts "No of diff points    = [get_compare_points -NONequivalent -count]"
puts "No of abort points   = [get_compare_points -abort -count]"
puts "No of unknown points = [get_compare_points -unknown -count]"
if {[get_compare_points -count] == 0} {
    puts "---------------------------------"
    puts "ERROR: No compare points detected"
    puts "---------------------------------"
}
if {[get_compare_points -NONequivalent -count] > 0} {
    puts "------------------------------------"
    puts "ERROR: Different Key Points detected"
    puts "------------------------------------"
}
if {[get_compare_points -abort -count] > 0} {
    puts "-----------------------------"
    puts "ERROR: Abort Points detected "
    puts "-----------------------------"
}
if {[get_compare_points -unknown -count] > 0} {
    puts "----------------------------------"
    puts "ERROR: Unknown Key Points detected"
    puts "----------------------------------"
}
vpxmode
exit -f
