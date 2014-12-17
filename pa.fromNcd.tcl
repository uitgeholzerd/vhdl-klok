
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name Klok -dir "C:/Users/Girmi/Xilinx/vhdl-klok/planAhead_run_2" -part xc6slx16csg324-3
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "C:/Users/Girmi/Xilinx/vhdl-klok/main.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Girmi/Xilinx/vhdl-klok} }
set_property target_constrs_file "main.ucf" [current_fileset -constrset]
add_files [list {main.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "C:/Users/Girmi/Xilinx/vhdl-klok/main.ncd"
if {[catch {read_twx -name results_1 -file "C:/Users/Girmi/Xilinx/vhdl-klok/main.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"C:/Users/Girmi/Xilinx/vhdl-klok/main.twx\": $eInfo"
}
