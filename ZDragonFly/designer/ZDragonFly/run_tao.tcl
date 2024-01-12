set_device -family {PolarFireSoC} -die {MPFS250T_ES} -speed {STD}
read_verilog -mode system_verilog {F:\MyTemporary\Github\PFSoC\ZDragonFly\component\work\PF_CCC_C0\PF_CCC_C0_0\pll_ext_feedback_mode_soft_logic.v}
read_verilog -mode system_verilog {F:\MyTemporary\Github\PFSoC\ZDragonFly\component\work\PF_CCC_C0\PF_CCC_C0_0\PF_CCC_C0_PF_CCC_C0_0_PF_CCC.v}
read_verilog -mode system_verilog {F:\MyTemporary\Github\PFSoC\ZDragonFly\component\work\PF_CCC_C0\PF_CCC_C0.v}
read_verilog -mode system_verilog {F:\MyTemporary\Github\PFSoC\ZDragonFly\component\work\PF_OSC_C0\PF_OSC_C0_0\PF_OSC_C0_PF_OSC_C0_0_PF_OSC.v}
read_verilog -mode system_verilog {F:\MyTemporary\Github\PFSoC\ZDragonFly\component\work\PF_OSC_C0\PF_OSC_C0.v}
read_verilog -mode system_verilog {F:\MyTemporary\Github\PFSoC\ZDragonFly\hdl\ZLED_Indicator.v}
read_verilog -mode system_verilog {F:\MyTemporary\Github\PFSoC\ZDragonFly\hdl\ZLED_Reactor.v}
read_verilog -mode system_verilog {F:\MyTemporary\Github\PFSoC\ZDragonFly\hdl\ZSwitch_Detector.v}
read_verilog -mode system_verilog {F:\MyTemporary\Github\PFSoC\ZDragonFly\component\work\ZSwitch_Module\ZSwitch_Module.v}
read_verilog -mode system_verilog {F:\MyTemporary\Github\PFSoC\ZDragonFly\component\work\ZDragonFly\ZDragonFly.v}
set_top_level {ZDragonFly}
map_netlist
check_constraints {F:\MyTemporary\Github\PFSoC\ZDragonFly\constraint\synthesis_sdc_errors.log}
write_fdc {F:\MyTemporary\Github\PFSoC\ZDragonFly\designer\ZDragonFly\synthesis.fdc}
