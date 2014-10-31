
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name Klok -dir "C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/VHDL/planAhead_run_2" -part xc6slx16csg324-3
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/VHDL/bcd_7seg.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/VHDL} }
set_property target_constrs_file "bcd_7seg.ucf" [current_fileset -constrset]
add_files [list {bcd_7seg.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/VHDL/bcd_7seg.xdl"
if {[catch {read_twx -name results_1 -file "C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/VHDL/bcd_7seg.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/VHDL/bcd_7seg.twx\": $eInfo"
}
