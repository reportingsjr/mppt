EESchema Schematic File Version 5
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
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
Comment5 ""
Comment6 ""
Comment7 ""
Comment8 ""
Comment9 ""
$EndDescr
Text Notes 2130 2850 0    50   ~ 0
Solar Panel Input
Text Notes 5580 2850 0    50   ~ 0
Buck Converter
Text Notes 8360 3380 0    50   ~ 0
Battery Output
Text Notes 10150 5980 0    50   ~ 0
5V from SMPS/battery
Text Notes 3910 6010 0    50   ~ 0
Microcontroller
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5DAA0A41
P 1740 3270
F 0 "J1" H 1632 2945 50  0000 C CNN
F 1 "Solar Input" H 1632 3036 50  0000 C CNN
F 2 "Connector_JST:JST_PH_S2B-PH-K_1x02_P2.00mm_Horizontal" H 1740 3270 50  0001 C CNN
F 3 "~" H 1740 3270 50  0001 C CNN
	1    1740 3270
	-1   0    0    1   
$EndComp
$Comp
L Device:L_Small L1
U 1 1 5DAA7EB5
P 5920 3170
F 0 "L1" V 6105 3170 50  0000 C CNN
F 1 "47uH" V 6014 3170 50  0000 C CNN
F 2 "Inductor_SMD:L_Taiyo-Yuden_NR-10050_HandSoldering" H 5920 3170 50  0001 C CNN
F 3 "~" H 5920 3170 50  0001 C CNN
F 4 "NR10050T470M" V 5920 3170 50  0001 C CNN "P/N"
	1    5920 3170
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP1_Small C3
U 1 1 5DAAF6E3
P 6290 3600
F 0 "C3" H 6381 3646 50  0000 L CNN
F 1 "270uF,16V" H 6381 3555 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x6.9" H 6290 3600 50  0001 C CNN
F 3 "~" H 6290 3600 50  0001 C CNN
F 4 "16SVPF270M" H 6290 3600 50  0001 C CNN "P/N"
	1    6290 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5090 3170 5480 3170
Wire Wire Line
	5480 3440 5480 3170
Connection ~ 5480 3170
Wire Wire Line
	5480 3170 5820 3170
Wire Wire Line
	6020 3170 6290 3170
Wire Wire Line
	6290 3500 6290 3170
Connection ~ 6290 3170
$Comp
L power:GND #PWR0101
U 1 1 5DAB1E24
P 7180 4180
F 0 "#PWR0101" H 7180 3930 50  0001 C CNN
F 1 "GND" H 7185 4007 50  0000 C CNN
F 2 "" H 7180 4180 50  0001 C CNN
F 3 "" H 7180 4180 50  0001 C CNN
	1    7180 4180
	1    0    0    -1  
$EndComp
Wire Wire Line
	7180 4180 7180 4080
Wire Wire Line
	5480 4080 5480 3840
Wire Wire Line
	6290 3700 6290 4080
Connection ~ 6290 4080
Wire Wire Line
	6290 4080 5480 4080
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 5DAB8553
P 9480 3170
F 0 "J3" H 9372 2845 50  0000 C CNN
F 1 "Battery" H 9372 2936 50  0000 C CNN
F 2 "Connector_JST:JST_PH_S2B-PH-K_1x02_P2.00mm_Horizontal" H 9480 3170 50  0001 C CNN
F 3 "~" H 9480 3170 50  0001 C CNN
	1    9480 3170
	1    0    0    -1  
$EndComp
Wire Wire Line
	1940 3270 2140 3270
$Comp
L power:GND #PWR0102
U 1 1 5DAA1D3F
P 2140 3400
F 0 "#PWR0102" H 2140 3150 50  0001 C CNN
F 1 "GND" H 2145 3227 50  0000 C CNN
F 2 "" H 2140 3400 50  0001 C CNN
F 3 "" H 2140 3400 50  0001 C CNN
	1    2140 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5DAB0B9F
P 6860 3630
F 0 "C4" H 6952 3676 50  0000 L CNN
F 1 "10uF,16V" H 6952 3585 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6860 3630 50  0001 C CNN
F 3 "~" H 6860 3630 50  0001 C CNN
F 4 "EMK212ABJ106MG-T" H 6860 3630 50  0001 C CNN "P/N"
	1    6860 3630
	1    0    0    -1  
$EndComp
Wire Wire Line
	6290 4080 6860 4080
Wire Wire Line
	6290 3170 6860 3170
Wire Wire Line
	6860 3730 6860 4080
Connection ~ 6860 4080
Wire Wire Line
	6860 4080 7180 4080
Wire Wire Line
	6860 3530 6860 3170
Wire Wire Line
	10260 7210 10120 7210
Wire Wire Line
	10260 6510 10160 6510
Wire Wire Line
	10260 6610 10160 6610
Wire Wire Line
	10160 6610 10160 6510
Wire Wire Line
	10260 6810 10100 6810
Wire Wire Line
	10100 6810 10100 6650
Wire Wire Line
	10100 6650 9800 6650
Connection ~ 9800 6650
Wire Wire Line
	9800 6910 9800 6880
$Comp
L power:GND #PWR0103
U 1 1 5DAD26D6
P 11960 6940
F 0 "#PWR0103" H 11830 6980 50  0001 L CNN
F 1 "GND" H 11960 6807 50  0000 C CNN
F 2 "" H 11960 6940 50  0001 C CNN
F 3 "" H 11960 6940 50  0001 C CNN
	1    11960 6940
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5DAD26D7
P 10710 7740
F 0 "#PWR0104" H 10580 7780 50  0001 L CNN
F 1 "GND" H 10710 7607 50  0000 C CNN
F 2 "" H 10710 7740 50  0001 C CNN
F 3 "" H 10710 7740 50  0001 C CNN
	1    10710 7740
	1    0    0    -1  
$EndComp
Connection ~ 10160 6510
Wire Wire Line
	11480 6510 11780 6510
Wire Wire Line
	11480 6910 11480 6830
Wire Wire Line
	11960 6880 12190 6880
Wire Wire Line
	10560 7680 10660 7680
Wire Wire Line
	10660 7680 10710 7680
Wire Wire Line
	10760 7680 10860 7680
Wire Wire Line
	10710 7680 10760 7680
$Comp
L power:GND #PWR0105
U 1 1 5DAD26DD
P 9860 7080
F 0 "#PWR0105" H 9730 7120 50  0001 L CNN
F 1 "GND" H 9860 6947 50  0000 C CNN
F 2 "" H 9860 7080 50  0001 C CNN
F 3 "" H 9860 7080 50  0001 C CNN
	1    9860 7080
	1    0    0    -1  
$EndComp
Wire Wire Line
	11060 6510 11220 6510
Wire Wire Line
	11060 6610 11220 6610
Wire Wire Line
	11220 6510 11220 6610
Connection ~ 11220 6510
Wire Wire Line
	11220 6710 11060 6710
Connection ~ 11220 6610
Wire Wire Line
	11480 6630 11480 6510
Connection ~ 11480 6510
Wire Wire Line
	11480 6960 11480 6910
Wire Wire Line
	11480 7160 11480 7220
Wire Wire Line
	11060 6910 11480 6910
Connection ~ 11480 6910
Wire Wire Line
	11780 6610 11780 6510
Connection ~ 11780 6510
Wire Wire Line
	11780 6810 11780 6880
Wire Wire Line
	10460 7610 10460 7680
Wire Wire Line
	10460 7680 10560 7680
Wire Wire Line
	10860 7680 10860 7610
Wire Wire Line
	10560 7610 10560 7680
Connection ~ 10560 7680
Wire Wire Line
	10660 7610 10660 7680
Connection ~ 10660 7680
Wire Wire Line
	10760 7610 10760 7680
Connection ~ 10760 7680
Wire Wire Line
	10710 7740 10710 7680
Connection ~ 10710 7680
Wire Wire Line
	11780 6880 11960 6880
Wire Wire Line
	12190 6880 12190 6810
Wire Wire Line
	11960 6940 11960 6880
Connection ~ 11960 6880
$Comp
L Device:R_Small R8
U 1 1 5DAD26E1
P 11480 6730
F 0 "R8" H 11350 6760 50  0000 L CNN
F 1 "1.87M" H 11210 6680 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 11480 6730 50  0001 C CNN
F 3 "" H 11480 6730 50  0001 C CNN
F 4 "RC0603FR-071M87L" H 11480 6730 60  0001 C CNN "part number"
	1    11480 6730
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R9
U 1 1 5DAD26E2
P 11480 7060
F 0 "R9" H 11539 7106 50  0000 L CNN
F 1 "200k" H 11539 7015 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 11480 7060 50  0001 C CNN
F 3 "" H 11480 7060 50  0001 C CNN
	1    11480 7060
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5DAD26E3
P 11780 6710
F 0 "C8" H 11872 6756 50  0000 L CNN
F 1 "10uF" H 11872 6665 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11780 6710 50  0001 C CNN
F 3 "" H 11780 6710 50  0001 C CNN
F 4 "EMK212ABJ106MG-T" H 11780 6710 50  0001 C CNN "P/N"
	1    11780 6710
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5DAD26E4
P 11480 7220
F 0 "#PWR0106" H 11350 7260 50  0001 L CNN
F 1 "GND" H 11480 7087 50  0000 C CNN
F 2 "" H 11480 7220 50  0001 C CNN
F 3 "" H 11480 7220 50  0001 C CNN
	1    11480 7220
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Small L2
U 1 1 5DAD26E6
P 9970 6510
F 0 "L2" V 10155 6510 50  0000 C CNN
F 1 "10uH" V 10064 6510 50  0000 C CNN
F 2 "Inductors:Inductor_Taiyo-Yuden_NR-80xx_HandSoldering" H 9970 6510 50  0001 C CNN
F 3 "" H 9970 6510 50  0001 C CNN
F 4 "NR8040T100M" V 9970 6510 60  0001 C CNN "part number"
	1    9970 6510
	0    -1   -1   0   
$EndComp
Text Label 10120 7210 2    40   ~ 0
Vout
Wire Wire Line
	10160 6510 10070 6510
Wire Wire Line
	9800 6650 9800 6680
Wire Wire Line
	9800 6910 10260 6910
Wire Wire Line
	11220 6510 11480 6510
Wire Wire Line
	11220 6610 11220 6710
$Comp
L Device:R_Small R7
U 1 1 5DAD26E7
P 9800 6780
F 0 "R7" H 9859 6826 50  0000 L CNN
F 1 "200k" H 9859 6735 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9800 6780 50  0001 C CNN
F 3 "" H 9800 6780 50  0001 C CNN
	1    9800 6780
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Switching:TPS61090 U4
U 1 1 5DADB615
P 10660 7010
F 0 "U4" H 10660 7735 50  0000 C CNN
F 1 "TPS61090" H 10660 7644 50  0000 C CNN
F 2 "Package_DFN_QFN:Texas_S-PVQFN-N16_EP2.7x2.7mm_ThermalVias" H 9710 5960 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps61090.pdf" H 10810 5860 50  0001 L CNN
	1    10660 7010
	1    0    0    -1  
$EndComp
NoConn ~ 11060 7010
Wire Wire Line
	10260 7010 9860 7010
Wire Wire Line
	9860 7010 9860 7080
Connection ~ 9800 6510
Wire Wire Line
	9800 6510 9870 6510
Wire Wire Line
	9800 6510 9800 6650
Wire Wire Line
	9550 6870 9550 6810
$Comp
L power:GND #PWR0107
U 1 1 5DAD26D8
P 9550 6870
F 0 "#PWR0107" H 9420 6910 50  0001 L CNN
F 1 "GND" H 9550 6737 50  0000 C CNN
F 2 "" H 9550 6870 50  0001 C CNN
F 3 "" H 9550 6870 50  0001 C CNN
	1    9550 6870
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5DAD26E5
P 9550 6710
F 0 "C6" H 9459 6756 50  0000 R CNN
F 1 "0.1uF" H 9459 6665 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9550 6710 50  0001 C CNN
F 3 "" H 9550 6710 50  0001 C CNN
	1    9550 6710
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 6510 9800 6510
Wire Wire Line
	9550 6610 9550 6510
Wire Wire Line
	9550 6510 9240 6510
Connection ~ 9550 6510
$Comp
L Device:CP1_Small C9
U 1 1 5DAE5977
P 12190 6710
F 0 "C9" H 12281 6756 50  0000 L CNN
F 1 "270uF,16V" H 12281 6665 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x6.9" H 12190 6710 50  0001 C CNN
F 3 "~" H 12190 6710 50  0001 C CNN
F 4 "16SVPF270M" H 12190 6710 50  0001 C CNN "P/N"
	1    12190 6710
	1    0    0    -1  
$EndComp
Text Label 9200 3170 2    50   ~ 0
VBat
Text Label 9240 6510 2    50   ~ 0
VBat
$Comp
L MCU_Microchip_SAMD:ATSAMD21G18A-AUT U2
U 1 1 5DAEA52E
P 5030 7910
F 0 "U2" H 5030 5921 50  0000 C CNN
F 1 "ATSAMD21G18A-AUT" H 5030 5830 50  0000 C CNN
F 2 "Package_QFP:TQFP-48_7x7mm_P0.5mm" H 4080 6160 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/SAMD21-Family-DataSheet-DS40001882D.pdf" H 5030 8910 50  0001 C CNN
	1    5030 7910
	1    0    0    -1  
$EndComp
$Comp
L Analog_ADC:INA233 U1
U 1 1 5DAF74FD
P 4210 2200
F 0 "U1" H 3910 2730 50  0000 C CNN
F 1 "INA233" H 3990 2660 50  0000 C CNN
F 2 "Package_SO:VSSOP-10_3x3mm_P0.5mm" H 5010 1750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/ina233.pdf" H 4560 2100 50  0001 C CNN
	1    4210 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5DAFB215
P 4210 2760
F 0 "#PWR0108" H 4210 2510 50  0001 C CNN
F 1 "GND" H 4215 2587 50  0000 C CNN
F 2 "" H 4210 2760 50  0001 C CNN
F 3 "" H 4210 2760 50  0001 C CNN
	1    4210 2760
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5DAFBDB2
P 4840 1930
F 0 "#PWR0109" H 4840 1680 50  0001 C CNN
F 1 "GND" H 4845 1757 50  0000 C CNN
F 2 "" H 4840 1930 50  0001 C CNN
F 3 "" H 4840 1930 50  0001 C CNN
	1    4840 1930
	1    0    0    -1  
$EndComp
Wire Wire Line
	4610 1900 4680 1900
Wire Wire Line
	4680 2000 4680 1900
Connection ~ 4680 1900
Wire Wire Line
	4680 1900 4840 1900
Wire Wire Line
	4840 1900 4840 1930
Text Notes 4530 1790 0    39   ~ 0
Address 1000000
$Comp
L Device:R_Small R1
U 1 1 5DAFEC07
P 3480 3170
F 0 "R1" V 3284 3170 50  0000 C CNN
F 1 "0.01" V 3375 3170 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3480 3170 50  0001 C CNN
F 3 "~" H 3480 3170 50  0001 C CNN
F 4 "RL0603FR-070R01L" V 3480 3170 50  0001 C CNN "P/N"
	1    3480 3170
	0    1    1    0   
$EndComp
Wire Wire Line
	4210 1700 4210 1640
Text Label 4210 1640 0    50   ~ 0
3.3V
Text Label 2820 1940 0    50   ~ 0
3.3V
Wire Wire Line
	3810 2300 3720 2300
Wire Wire Line
	3250 2300 3250 2460
Connection ~ 3250 3170
Wire Wire Line
	3250 3170 3380 3170
Wire Wire Line
	3580 3170 3720 3170
Wire Wire Line
	3720 2400 3720 2460
Wire Wire Line
	3720 2400 3810 2400
Wire Wire Line
	3810 1900 3720 1900
Wire Wire Line
	3720 1900 3720 2300
Wire Wire Line
	2820 2210 2820 2250
$Comp
L power:GND #PWR0110
U 1 1 5DAFB867
P 2820 2250
F 0 "#PWR0110" H 2820 2000 50  0001 C CNN
F 1 "GND" H 2825 2077 50  0000 C CNN
F 2 "" H 2820 2250 50  0001 C CNN
F 3 "" H 2820 2250 50  0001 C CNN
	1    2820 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5DAFA4F8
P 2820 2110
F 0 "C1" H 2912 2156 50  0000 L CNN
F 1 "0.1uF" H 2912 2065 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2820 2110 50  0001 C CNN
F 3 "~" H 2820 2110 50  0001 C CNN
	1    2820 2110
	1    0    0    -1  
$EndComp
Wire Wire Line
	2820 2010 2820 1940
Wire Wire Line
	4210 2760 4210 2700
Wire Wire Line
	3720 3170 4690 3170
Connection ~ 3720 3170
Wire Wire Line
	9280 3270 9110 3270
Wire Wire Line
	9060 1700 9060 1640
$Comp
L Analog_ADC:INA233 U3
U 1 1 5DB0D624
P 9060 2200
F 0 "U3" H 8760 2730 50  0000 C CNN
F 1 "INA233" H 8840 2660 50  0000 C CNN
F 2 "Package_SO:VSSOP-10_3x3mm_P0.5mm" H 9860 1750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/ina233.pdf" H 9410 2100 50  0001 C CNN
	1    9060 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8660 2300 8570 2300
Wire Wire Line
	8570 1900 8570 2300
Wire Wire Line
	8570 2400 8660 2400
Wire Wire Line
	10410 2020 10410 1950
$Comp
L power:GND #PWR0111
U 1 1 5DB0D636
P 9060 2760
F 0 "#PWR0111" H 9060 2510 50  0001 C CNN
F 1 "GND" H 9065 2587 50  0000 C CNN
F 2 "" H 9060 2760 50  0001 C CNN
F 3 "" H 9060 2760 50  0001 C CNN
	1    9060 2760
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 3170 8230 3170
$Comp
L Device:C_Small C7
U 1 1 5DB0D647
P 10410 2120
F 0 "C7" H 10502 2166 50  0000 L CNN
F 1 "0.1uF" H 10502 2075 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 10410 2120 50  0001 C CNN
F 3 "~" H 10410 2120 50  0001 C CNN
	1    10410 2120
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 2300 8100 2460
Wire Wire Line
	8570 2400 8570 2460
$Comp
L power:GND #PWR0112
U 1 1 5DB0D657
P 10410 2260
F 0 "#PWR0112" H 10410 2010 50  0001 C CNN
F 1 "GND" H 10415 2087 50  0000 C CNN
F 2 "" H 10410 2260 50  0001 C CNN
F 3 "" H 10410 2260 50  0001 C CNN
	1    10410 2260
	1    0    0    -1  
$EndComp
Wire Wire Line
	9060 2760 9060 2700
Wire Wire Line
	8660 1900 8570 1900
Text Label 10410 1950 0    50   ~ 0
3.3V
Text Notes 9450 1880 0    39   ~ 0
Address 1000001
Wire Wire Line
	10410 2220 10410 2260
Text Label 9060 1640 0    50   ~ 0
3.3V
$Comp
L Device:R_Small R5
U 1 1 5DB0D67D
P 8330 3170
F 0 "R5" V 8134 3170 50  0000 C CNN
F 1 "0.01" V 8225 3170 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8330 3170 50  0001 C CNN
F 3 "~" H 8330 3170 50  0001 C CNN
F 4 "RL0603FR-070R01L" V 8330 3170 50  0001 C CNN "P/N"
	1    8330 3170
	0    1    1    0   
$EndComp
Wire Wire Line
	8430 3170 8570 3170
Wire Wire Line
	8570 3170 9280 3170
Connection ~ 8570 3170
NoConn ~ 9460 2500
NoConn ~ 4610 2500
$Comp
L Device:R_Small R6
U 1 1 5DB1849D
P 8340 2300
F 0 "R6" V 8144 2300 50  0000 C CNN
F 1 "2" V 8235 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8340 2300 50  0001 C CNN
F 3 "~" H 8340 2300 50  0001 C CNN
	1    8340 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5DB18AA8
P 3490 2300
F 0 "R2" V 3294 2300 50  0000 C CNN
F 1 "2" V 3385 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3490 2300 50  0001 C CNN
F 3 "~" H 3490 2300 50  0001 C CNN
	1    3490 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	3720 2300 3590 2300
Connection ~ 3720 2300
Wire Wire Line
	3390 2300 3250 2300
Wire Wire Line
	8240 2300 8100 2300
Wire Wire Line
	8440 2300 8570 2300
Connection ~ 8570 2300
$Comp
L Device:C_Small C5
U 1 1 5DB19F93
P 8350 2460
F 0 "C5" V 8487 2460 50  0000 C CNN
F 1 "0.1uF" V 8578 2460 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8350 2460 50  0001 C CNN
F 3 "~" H 8350 2460 50  0001 C CNN
	1    8350 2460
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5DB1BA26
P 3490 2460
F 0 "C2" V 3627 2460 50  0000 C CNN
F 1 "0.1uF" V 3718 2460 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3490 2460 50  0001 C CNN
F 3 "~" H 3490 2460 50  0001 C CNN
	1    3490 2460
	0    1    1    0   
$EndComp
Wire Wire Line
	3390 2460 3250 2460
Connection ~ 3250 2460
Wire Wire Line
	3250 2460 3250 3170
Wire Wire Line
	3590 2460 3720 2460
Connection ~ 3720 2460
Wire Wire Line
	3720 2460 3720 3170
Wire Wire Line
	8250 2460 8100 2460
Connection ~ 8100 2460
Wire Wire Line
	8100 2460 8100 3170
Wire Wire Line
	8450 2460 8570 2460
Connection ~ 8570 2460
Wire Wire Line
	8570 2460 8570 3170
Wire Wire Line
	4610 2000 4680 2000
Text Label 9540 2000 0    39   ~ 0
3.3V
Wire Wire Line
	9460 2000 9540 2000
$Comp
L power:GND #PWR0113
U 1 1 5DB0D666
P 9790 1950
F 0 "#PWR0113" H 9790 1700 50  0001 C CNN
F 1 "GND" H 9795 1777 50  0000 C CNN
F 2 "" H 9790 1950 50  0001 C CNN
F 3 "" H 9790 1950 50  0001 C CNN
	1    9790 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9460 1900 9790 1900
Wire Wire Line
	9790 1900 9790 1950
$Comp
L Device:R_Small R3
U 1 1 5DB3BF47
P 5170 1980
F 0 "R3" H 5229 2026 50  0000 L CNN
F 1 "4.7k" H 5229 1935 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5170 1980 50  0001 C CNN
F 3 "~" H 5170 1980 50  0001 C CNN
	1    5170 1980
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5DB3CF9E
P 5520 1970
F 0 "R4" H 5579 2016 50  0000 L CNN
F 1 "4.7k" H 5579 1925 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5520 1970 50  0001 C CNN
F 3 "~" H 5520 1970 50  0001 C CNN
	1    5520 1970
	1    0    0    -1  
$EndComp
Wire Wire Line
	4610 2200 5170 2200
Wire Wire Line
	5170 2200 5170 2080
Wire Wire Line
	5170 2200 5280 2200
Connection ~ 5170 2200
Text Label 5280 2200 0    39   ~ 0
SDA
Text Label 9560 2200 0    39   ~ 0
SDA
Text Label 9560 2300 0    39   ~ 0
SCL
Wire Wire Line
	9460 2200 9560 2200
Wire Wire Line
	9460 2300 9560 2300
Wire Wire Line
	4610 2300 5520 2300
Wire Wire Line
	5520 2300 5520 2070
Wire Wire Line
	5520 2300 5630 2300
Connection ~ 5520 2300
Text Label 5630 2300 0    39   ~ 0
SCL
Wire Wire Line
	5170 1880 5170 1820
Wire Wire Line
	5170 1820 5350 1820
Wire Wire Line
	5520 1820 5520 1870
Wire Wire Line
	5350 1820 5350 1750
Connection ~ 5350 1820
Wire Wire Line
	5350 1820 5520 1820
Text Label 5350 1750 0    39   ~ 0
3.3V
Text Notes 3740 1360 0    39   ~ 0
Solar Panel Current/Voltage Monitor
Text Notes 8700 1360 0    39   ~ 0
Battery Voltage/Current Monitor
$Comp
L power:GND #PWR0114
U 1 1 5DABBDB2
P 9110 3360
F 0 "#PWR0114" H 9110 3110 50  0001 C CNN
F 1 "GND" H 9115 3187 50  0000 C CNN
F 2 "" H 9110 3360 50  0001 C CNN
F 3 "" H 9110 3360 50  0001 C CNN
	1    9110 3360
	1    0    0    -1  
$EndComp
Wire Wire Line
	9110 3270 9110 3360
Wire Wire Line
	2140 3270 2140 3400
Wire Wire Line
	1940 3170 3250 3170
Wire Wire Line
	8100 3170 6860 3170
Connection ~ 8100 3170
Connection ~ 6860 3170
$Comp
L Device:Q_NMOS_GSD Q1
U 1 1 5DACA21B
P 4890 3270
F 0 "Q1" V 5233 3270 50  0000 C CNN
F 1 "Q_NMOS_GSD" V 5142 3270 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5090 3370 50  0001 C CNN
F 3 "~" H 4890 3270 50  0001 C CNN
F 4 "BSS806NE" V 4890 3270 50  0001 C CNN "P/N"
	1    4890 3270
	0    -1   -1   0   
$EndComp
$Comp
L Device:Q_NMOS_GSD Q2
U 1 1 5DAD0544
P 5380 3640
F 0 "Q2" H 5586 3686 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5586 3595 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5580 3740 50  0001 C CNN
F 3 "~" H 5380 3640 50  0001 C CNN
F 4 "BSS806NE" V 5380 3640 50  0001 C CNN "P/N"
	1    5380 3640
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_ARM_JTAG_SWD_10 J2
U 1 1 5DAD25E6
P 2200 6890
F 0 "J2" H 1757 6936 50  0000 R CNN
F 1 "Conn_ARM_JTAG_SWD_10" H 1757 6845 50  0000 R CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical_SMD" H 2200 6890 50  0001 C CNN
F 3 "http://infocenter.arm.com/help/topic/com.arm.doc.ddi0314h/DDI0314H_coresight_components_trm.pdf" V 1850 5640 50  0001 C CNN
	1    2200 6890
	1    0    0    -1  
$EndComp
Wire Wire Line
	14240 6870 14240 6800
Wire Wire Line
	12930 6990 12930 7050
$Comp
L Regulator_Linear:LT3080xST U5
U 1 1 5DAE1C89
P 13450 6510
F 0 "U5" H 13450 6777 50  0000 C CNN
F 1 "LT3080xST" H 13450 6686 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223" H 13450 6210 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/3080fc.pdf" H 11730 7280 50  0001 C CNN
	1    13450 6510
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 5DAE9057
P 14240 6700
F 0 "C10" H 14332 6746 50  0000 L CNN
F 1 "10uF" H 14332 6655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14240 6700 50  0001 C CNN
F 3 "" H 14240 6700 50  0001 C CNN
F 4 "EMK212ABJ106MG-T" H 14240 6700 50  0001 C CNN "P/N"
	1    14240 6700
	1    0    0    -1  
$EndComp
Connection ~ 13990 6510
$Comp
L power:GND #PWR0115
U 1 1 5DAEA2C0
P 12930 7050
F 0 "#PWR0115" H 12800 7090 50  0001 L CNN
F 1 "GND" H 12930 6917 50  0000 C CNN
F 2 "" H 12930 7050 50  0001 C CNN
F 3 "" H 12930 7050 50  0001 C CNN
	1    12930 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5DAEAF31
P 14240 6870
F 0 "#PWR0116" H 14110 6910 50  0001 L CNN
F 1 "GND" H 14240 6737 50  0000 C CNN
F 2 "" H 14240 6870 50  0001 C CNN
F 3 "" H 14240 6870 50  0001 C CNN
	1    14240 6870
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R10
U 1 1 5DAE873B
P 12930 6890
F 0 "R10" H 12989 6936 50  0000 L CNN
F 1 "330k" H 12989 6845 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 12930 6890 50  0001 C CNN
F 3 "" H 12930 6890 50  0001 C CNN
	1    12930 6890
	1    0    0    -1  
$EndComp
Connection ~ 14240 6510
Wire Wire Line
	13850 6510 13990 6510
Wire Wire Line
	13050 6610 12930 6610
Text Label 14500 6510 0    50   ~ 0
3.3V
Wire Wire Line
	14240 6510 14500 6510
Wire Wire Line
	12190 6510 13050 6510
Wire Wire Line
	12930 6610 12930 6790
Wire Wire Line
	13990 6610 13990 6510
Wire Wire Line
	13990 6510 14240 6510
Wire Wire Line
	13850 6610 13990 6610
Wire Wire Line
	14240 6600 14240 6510
Text Label 12410 6510 0    50   ~ 0
5V
Connection ~ 12190 6510
Wire Wire Line
	12190 6610 12190 6510
Wire Wire Line
	11780 6510 12190 6510
Text Notes 12460 5970 0    50   ~ 0
~~20mA max on 3.3V rail for the micro, INA233s, and status LEDs.\n??mA for FET gate driver and curiosity board/LCD
$EndSCHEMATC
