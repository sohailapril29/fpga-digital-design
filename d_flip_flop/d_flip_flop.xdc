set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -name sys_clk -period 10.000 [get_ports clk]
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports rst_ext]
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports enable_ext]
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports d_ext]


set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports q]