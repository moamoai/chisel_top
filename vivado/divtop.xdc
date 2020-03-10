set_property PACKAGE_PIN L16 [get_ports clock]
set_property PACKAGE_PIN R18 [get_ports reset]
set_property PACKAGE_PIN D18 [get_ports {io_out[3]}]
set_property PACKAGE_PIN G14 [get_ports {io_out[2]}]
set_property PACKAGE_PIN M15 [get_ports {io_out[1]}]
set_property PACKAGE_PIN M14 [get_ports {io_out[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports {io_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_out[0]}]

create_clock -period 8.000 -name clock -waveform {0.000 4.000} [get_ports clock]

create_generated_clock -name clk_div2 -source [get_ports clock] -divide_by 2 [get_pins i_div2/r_clock_reg/Q]
