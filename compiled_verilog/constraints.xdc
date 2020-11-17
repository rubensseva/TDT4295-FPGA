## This file is a general .xdc for the Arty A7-35 Rev. D
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clock }];                  #IO_L12P_T1_MRCC_35 Sch=gclk[100]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clock }];
set_property -dict {PACKAGE_PIN D9  IOSTANDARD LVCMOS33} [get_ports { reset }];

## ChipKit SPI
#set_property -dict { PACKAGE_PIN G1    IOSTANDARD LVCMOS33 } [get_ports { ck_miso }];                #IO_L17N_T2_35 Sch=ck_miso
set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { io_SPISignals_MOSI }];      #IO_L17P_T2_35 Sch=ck_mosi
set_property -dict { PACKAGE_PIN F1    IOSTANDARD LVCMOS33 } [get_ports { io_SPISignals_SCLK }];      #IO_L18P_T2_35 Sch=ck_sck
set_property -dict { PACKAGE_PIN C1    IOSTANDARD LVCMOS33 } [get_ports { io_SPISignals_SS }];        #IO_L16N_T2_35 Sch=ck_ss

## LEDs
set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; #IO_L24N_T3_35 Sch=led[4]
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; #IO_25_35 Sch=led[5]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { led[2] }]; #IO_L24P_T3_A01_D17_14 Sch=led[6]
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { led[3] }]; #IO_L24N_T3_A00_D16_14 Sch=led[7]

## RGB LEDs
set_property -dict {PACKAGE_PIN G6  IOSTANDARD LVCMOS33} [get_ports {led_r[0]}];
set_property -dict {PACKAGE_PIN F6  IOSTANDARD LVCMOS33} [get_ports {led_g[0]}];
set_property -dict {PACKAGE_PIN E1  IOSTANDARD LVCMOS33} [get_ports {led_b[0]}];
set_property -dict {PACKAGE_PIN G3  IOSTANDARD LVCMOS33} [get_ports {led_r[1]}];
set_property -dict {PACKAGE_PIN J4  IOSTANDARD LVCMOS33} [get_ports {led_g[1]}];
set_property -dict {PACKAGE_PIN G4  IOSTANDARD LVCMOS33} [get_ports {led_b[1]}];
set_property -dict {PACKAGE_PIN J3  IOSTANDARD LVCMOS33} [get_ports {led_r[2]}];
set_property -dict {PACKAGE_PIN J2  IOSTANDARD LVCMOS33} [get_ports {led_g[2]}];
set_property -dict {PACKAGE_PIN H4  IOSTANDARD LVCMOS33} [get_ports {led_b[2]}];
set_property -dict {PACKAGE_PIN K1  IOSTANDARD LVCMOS33} [get_ports {led_r[3]}];
set_property -dict {PACKAGE_PIN H6  IOSTANDARD LVCMOS33} [get_ports {led_g[3]}];
set_property -dict {PACKAGE_PIN K2  IOSTANDARD LVCMOS33} [get_ports {led_b[3]}];

## Pmod Header JA
#set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { ja[0] }]; #IO_0_15 Sch=ja[1]
#set_property -dict { PACKAGE_PIN B11   IOSTANDARD LVCMOS33 } [get_ports { ja[1] }]; #IO_L4P_T0_15 Sch=ja[2]
#set_property -dict { PACKAGE_PIN A11   IOSTANDARD LVCMOS33 } [get_ports { ja[2] }]; #IO_L4N_T0_15 Sch=ja[3]
#set_property -dict { PACKAGE_PIN D12   IOSTANDARD LVCMOS33 } [get_ports { ja[3] }]; #IO_L6P_T0_15 Sch=ja[4]
#set_property -dict { PACKAGE_PIN D13   IOSTANDARD LVCMOS33 } [get_ports { ja[4] }]; #IO_L6N_T0_VREF_15 Sch=ja[7]
#set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { ja[5] }]; #IO_L10P_T1_AD11P_15 Sch=ja[8]
#set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { ja[6] }]; #IO_L10N_T1_AD11N_15 Sch=ja[9]
#set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { ja[7] }]; #IO_25_15 Sch=ja[10]

## Ignore Unconstrained Pins
set_property BITSTREAM.General.UnconstrainedPins {Allow} [current_design]