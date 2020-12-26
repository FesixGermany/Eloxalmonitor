EESchema Schematic File Version 4
LIBS:Eloxalmonitor-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R1
U 1 1 5FC03F53
P 1450 1200
F 0 "R1" H 1520 1246 50  0000 L CNN
F 1 "30k" H 1520 1155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1380 1200 50  0001 C CNN
F 3 "~" H 1450 1200 50  0001 C CNN
	1    1450 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5FC040E1
P 1450 1600
F 0 "R2" H 1520 1646 50  0000 L CNN
F 1 "1k" H 1520 1555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1380 1600 50  0001 C CNN
F 3 "~" H 1450 1600 50  0001 C CNN
	1    1450 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5FC041DD
P 2200 1850
F 0 "R3" V 2407 1850 50  0000 C CNN
F 1 "0R1" V 2316 1850 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 2130 1850 50  0001 C CNN
F 3 "~" H 2200 1850 50  0001 C CNN
	1    2200 1850
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Zener D1
U 1 1 5FC04244
P 1800 1600
F 0 "D1" H 1800 1816 50  0000 C CNN
F 1 "D_Zener" H 1800 1725 50  0000 C CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 1800 1600 50  0001 C CNN
F 3 "~" H 1800 1600 50  0001 C CNN
	1    1800 1600
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D2
U 1 1 5FC043A2
P 2750 2450
F 0 "D2" H 2750 2666 50  0000 C CNN
F 1 "D_Zener" H 2750 2575 50  0000 C CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 2750 2450 50  0001 C CNN
F 3 "~" H 2750 2450 50  0001 C CNN
	1    2750 2450
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 5FC043E5
P 2400 2450
F 0 "C1" H 2515 2496 50  0000 L CNN
F 1 "1u" H 2515 2405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2438 2300 50  0001 C CNN
F 3 "~" H 2400 2450 50  0001 C CNN
	1    2400 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5FC04574
P 2400 2050
F 0 "R4" H 2470 2096 50  0000 L CNN
F 1 "1k" H 2470 2005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2330 2050 50  0001 C CNN
F 3 "~" H 2400 2050 50  0001 C CNN
	1    2400 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5FC0B8F3
P 2750 2650
F 0 "#PWR04" H 2750 2400 50  0001 C CNN
F 1 "GND" H 2755 2477 50  0000 C CNN
F 2 "" H 2750 2650 50  0001 C CNN
F 3 "" H 2750 2650 50  0001 C CNN
	1    2750 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5FC0D6D2
P 1450 1900
F 0 "#PWR02" H 1450 1650 50  0001 C CNN
F 1 "GND" H 1455 1727 50  0000 C CNN
F 2 "" H 1450 1900 50  0001 C CNN
F 3 "" H 1450 1900 50  0001 C CNN
	1    1450 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1450 1450 1400
Wire Wire Line
	1450 1400 1800 1400
Wire Wire Line
	1800 1400 1800 1450
Wire Wire Line
	1450 1350 1450 1400
Connection ~ 1450 1400
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 5FC0F1D3
P 2450 4050
F 0 "J5" H 2556 4328 50  0000 C CNN
F 1 "Conn_01x03_Male" H 2556 4237 50  0000 C CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 2450 4050 50  0001 C CNN
F 3 "~" H 2450 4050 50  0001 C CNN
	1    2450 4050
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J6
U 1 1 5FC0F257
P 3750 4050
F 0 "J6" H 3856 4328 50  0000 C CNN
F 1 "Conn_01x03_Male" H 3856 4237 50  0000 C CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 3750 4050 50  0001 C CNN
F 3 "~" H 3750 4050 50  0001 C CNN
	1    3750 4050
	-1   0    0    1   
$EndComp
Wire Wire Line
	2050 1850 1800 1850
Wire Wire Line
	1800 1850 1800 1750
Wire Wire Line
	1800 1850 1450 1850
Wire Wire Line
	1450 1850 1450 1750
Connection ~ 1800 1850
Wire Wire Line
	1450 1850 1450 1900
Connection ~ 1450 1850
Wire Wire Line
	2350 1850 2400 1850
Wire Wire Line
	2400 1850 2400 1900
Wire Wire Line
	2400 2200 2400 2250
Wire Wire Line
	2400 2600 2400 2650
Wire Wire Line
	2400 2250 2750 2250
Wire Wire Line
	2750 2250 2750 2300
Connection ~ 2400 2250
Wire Wire Line
	2400 2250 2400 2300
$Comp
L power:GND #PWR03
U 1 1 5FC13421
P 2400 2650
F 0 "#PWR03" H 2400 2400 50  0001 C CNN
F 1 "GND" H 2405 2477 50  0000 C CNN
F 2 "" H 2400 2650 50  0001 C CNN
F 3 "" H 2400 2650 50  0001 C CNN
	1    2400 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2600 2750 2650
Wire Wire Line
	2750 2250 3000 2250
Connection ~ 2750 2250
Wire Wire Line
	1800 1400 2050 1400
Connection ~ 1800 1400
Wire Wire Line
	2400 1850 2650 1850
Connection ~ 2400 1850
Wire Wire Line
	1200 1000 1450 1000
Wire Wire Line
	1450 1000 1450 1050
Wire Wire Line
	1450 1000 2650 1000
Connection ~ 1450 1000
Wire Wire Line
	1450 1850 1200 1850
$Comp
L Connector:Conn_01x01_Male J1
U 1 1 5FC16495
P 1000 1000
F 0 "J1" H 1106 1178 50  0000 C CNN
F 1 "Conn_01x01_Male" H 1106 1087 50  0000 C CNN
F 2 "Connector_Wire:SolderWirePad_1x01_SMD_5x10mm" H 1000 1000 50  0001 C CNN
F 3 "~" H 1000 1000 50  0001 C CNN
	1    1000 1000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 5FC1653D
P 1000 1850
F 0 "J3" H 1106 2028 50  0000 C CNN
F 1 "Conn_01x01_Male" H 1106 1937 50  0000 C CNN
F 2 "Connector_Wire:SolderWirePad_1x01_SMD_5x10mm" H 1000 1850 50  0001 C CNN
F 3 "~" H 1000 1850 50  0001 C CNN
	1    1000 1850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J2
U 1 1 5FC165C3
P 2850 1000
F 0 "J2" H 2877 1026 50  0000 L CNN
F 1 "Conn_01x01_Female" H 2877 935 50  0000 L CNN
F 2 "Connector_Wire:SolderWirePad_1x01_SMD_5x10mm" H 2850 1000 50  0001 C CNN
F 3 "~" H 2850 1000 50  0001 C CNN
	1    2850 1000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J4
U 1 1 5FC1663B
P 2850 1850
F 0 "J4" H 2877 1876 50  0000 L CNN
F 1 "Conn_01x01_Female" H 2877 1785 50  0000 L CNN
F 2 "Connector_Wire:SolderWirePad_1x01_SMD_5x10mm" H 2850 1850 50  0001 C CNN
F 3 "~" H 2850 1850 50  0001 C CNN
	1    2850 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5FC1726B
P 1800 3850
F 0 "R5" H 1870 3896 50  0000 L CNN
F 1 "4k7" H 1870 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1730 3850 50  0001 C CNN
F 3 "~" H 1800 3850 50  0001 C CNN
	1    1800 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5FC17365
P 3100 3850
F 0 "R6" H 3170 3896 50  0000 L CNN
F 1 "4k7" H 3170 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3030 3850 50  0001 C CNN
F 3 "~" H 3100 3850 50  0001 C CNN
	1    3100 3850
	1    0    0    -1  
$EndComp
Text Label 2050 1400 0    50   ~ 0
U_meas
Text Label 3000 2250 0    50   ~ 0
I_meas
Text Label 5800 2250 0    50   ~ 0
U_meas
Text Label 5800 2150 0    50   ~ 0
I_meas
Wire Wire Line
	5800 2250 5700 2250
Wire Wire Line
	5800 2150 5700 2150
$Comp
L power:GND #PWR08
U 1 1 5FCB719D
P 2200 4200
F 0 "#PWR08" H 2200 3950 50  0001 C CNN
F 1 "GND" H 2205 4027 50  0000 C CNN
F 2 "" H 2200 4200 50  0001 C CNN
F 3 "" H 2200 4200 50  0001 C CNN
	1    2200 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5FCB71FF
P 3500 4200
F 0 "#PWR09" H 3500 3950 50  0001 C CNN
F 1 "GND" H 3505 4027 50  0000 C CNN
F 2 "" H 3500 4200 50  0001 C CNN
F 3 "" H 3500 4200 50  0001 C CNN
	1    3500 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5FCB726F
P 2200 3550
F 0 "#PWR06" H 2200 3400 50  0001 C CNN
F 1 "+5V" H 2215 3723 50  0000 C CNN
F 2 "" H 2200 3550 50  0001 C CNN
F 3 "" H 2200 3550 50  0001 C CNN
	1    2200 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5FCB72D1
P 3500 3600
F 0 "#PWR07" H 3500 3450 50  0001 C CNN
F 1 "+5V" H 3515 3773 50  0000 C CNN
F 2 "" H 3500 3600 50  0001 C CNN
F 3 "" H 3500 3600 50  0001 C CNN
	1    3500 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 3950 2200 3950
Wire Wire Line
	2200 3950 2200 3650
Wire Wire Line
	1800 3700 1800 3650
Wire Wire Line
	1800 3650 2200 3650
Connection ~ 2200 3650
Wire Wire Line
	2200 3650 2200 3550
Wire Wire Line
	2250 4150 2200 4150
Wire Wire Line
	2200 4150 2200 4200
Wire Wire Line
	2250 4050 1800 4050
Wire Wire Line
	1800 4050 1800 4000
Wire Wire Line
	1800 4050 1700 4050
Connection ~ 1800 4050
Wire Wire Line
	3100 3700 3100 3650
Wire Wire Line
	3100 3650 3500 3650
Wire Wire Line
	3500 3650 3500 3600
Wire Wire Line
	3500 3650 3500 3950
Wire Wire Line
	3500 3950 3550 3950
Connection ~ 3500 3650
Wire Wire Line
	3550 4050 3100 4050
Wire Wire Line
	3100 4050 3100 4000
Wire Wire Line
	3100 4050 3000 4050
Connection ~ 3100 4050
Wire Wire Line
	3550 4150 3500 4150
Wire Wire Line
	3500 4150 3500 4200
Text Label 4600 2350 2    50   ~ 0
Temp1
Text Label 4600 2450 2    50   ~ 0
Temp2
Text Label 1700 4050 2    50   ~ 0
Temp1
Text Label 3000 4050 2    50   ~ 0
Temp2
Wire Wire Line
	4700 2350 4600 2350
Wire Wire Line
	4700 2450 4600 2450
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5FC4EAE2
P 5200 2150
F 0 "A1" H 5200 1064 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 5200 973 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5350 1200 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 5200 1150 50  0001 C CNN
	1    5200 2150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5FC4FA88
P 5400 1100
F 0 "#PWR01" H 5400 950 50  0001 C CNN
F 1 "+5V" H 5415 1273 50  0000 C CNN
F 2 "" H 5400 1100 50  0001 C CNN
F 3 "" H 5400 1100 50  0001 C CNN
	1    5400 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5FC4FAE1
P 5200 3400
F 0 "#PWR05" H 5200 3150 50  0001 C CNN
F 1 "GND" H 5205 3227 50  0000 C CNN
F 2 "" H 5200 3400 50  0001 C CNN
F 3 "" H 5200 3400 50  0001 C CNN
	1    5200 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3150 5200 3400
Wire Wire Line
	5400 1100 5400 1150
Text Notes 2150 4600 0    50   ~ 0
Connectors for DS18B20
Text Notes 1450 2500 0    50   ~ 0
Lowpass neccessary?
Text Notes 6050 1900 0    50   ~ 0
Arduino not soldered on directly but connected\nvia 0.1 inch (2.54mm) single in line sockets
Text Notes 600  750  0    50   ~ 0
4mm plugs soldered onto\nPCB, fits my power supply
Text Notes 2300 850  0    50   ~ 0
4mm jacks (or brass tube inner dia)
$EndSCHEMATC
