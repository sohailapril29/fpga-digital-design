
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports {sel[0]}]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports {sel[1]}]
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports {sel[2]}]
set_property -dict { PACKAGE_PIN W17   IOSTANDARD LVCMOS33 } [get_ports a]
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports b]
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports cin]

## LEDs
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports y]
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports cout]