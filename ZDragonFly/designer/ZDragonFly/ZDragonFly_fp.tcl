new_project \
         -name {ZDragonFly} \
         -location {F:\MyTemporary\Github\PFSoC\ZDragonFly\designer\ZDragonFly\ZDragonFly_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {MPFS250T_ES} \
         -name {MPFS250T_ES}
enable_device \
         -name {MPFS250T_ES} \
         -enable {TRUE}
save_project
close_project
