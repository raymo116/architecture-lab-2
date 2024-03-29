# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/raymo116/counter/counter.cache/wt [current_project]
set_property parent.project_path C:/Users/raymo116/counter/counter.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/raymo116/counter/counter.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/raymo116/counter/counter.srcs/sources_1/new/halfsecv.v
  C:/Users/raymo116/counter/counter.srcs/sources_1/new/counter.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/raymo116/counter/counter.srcs/constrs_1/new/Baysys3_Master.xdc
set_property used_in_implementation false [get_files C:/Users/raymo116/counter/counter.srcs/constrs_1/new/Baysys3_Master.xdc]


synth_design -top counter -part xc7a35tcpg236-1


write_checkpoint -force -noxdef counter.dcp

catch { report_utilization -file counter_utilization_synth.rpt -pb counter_utilization_synth.pb }
