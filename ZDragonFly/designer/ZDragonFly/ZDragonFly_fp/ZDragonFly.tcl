open_project -project {F:\MyTemporary\Github\PFSoC\ZDragonFly\designer\ZDragonFly\ZDragonFly_fp\ZDragonFly.pro}
enable_device -name {MPFS250T_ES} -enable 1
set_programming_file -name {MPFS250T_ES} -file {F:\MyTemporary\Github\PFSoC\ZDragonFly\designer\ZDragonFly\ZDragonFly.ppd}
set_programming_action -action {PROGRAM} -name {MPFS250T_ES} 
run_selected_actions
save_project
close_project
