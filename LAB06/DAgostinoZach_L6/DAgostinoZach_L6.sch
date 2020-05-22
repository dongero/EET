EESchema Schematic File Version 4
EELAYER 30 0
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
L 74xx:74LS595 U1
U 1 1 5EC7374A
P 3575 4075
F 0 "U1" H 3825 4700 50  0000 C CNN
F 1 "74LS595" H 3775 4625 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 3575 4075 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls595" H 3575 4075 50  0001 C CNN
	1    3575 4075
	1    0    0    -1  
$EndComp
$Comp
L Driver_Motor:L293 U2
U 1 1 5EC745E4
P 6700 4275
F 0 "U2" H 7000 5325 50  0000 C CNN
F 1 "L293" H 7025 5250 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 6950 3525 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/l293.pdf" H 6400 4975 50  0001 C CNN
	1    6700 4275
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C4
U 1 1 5EC771F3
P 6175 2750
F 0 "C4" H 6225 2825 50  0000 L CNN
F 1 "100uF" H 6250 2700 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 6175 2750 50  0001 C CNN
F 3 "~" H 6175 2750 50  0001 C CNN
	1    6175 2750
	1    0    0    -1  
$EndComp
NoConn ~ 3975 4375
NoConn ~ 3975 4275
NoConn ~ 3975 4175
NoConn ~ 3975 4075
$Comp
L power:GND #PWR0101
U 1 1 5EC78020
P 3175 4775
F 0 "#PWR0101" H 3175 4525 50  0001 C CNN
F 1 "GND" H 3180 4602 50  0000 C CNN
F 2 "" H 3175 4775 50  0001 C CNN
F 3 "" H 3175 4775 50  0001 C CNN
	1    3175 4775
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 3875 3175 3875
Text Label 2250 3875 0    50   ~ 0
SRCLK
Text Label 2250 3975 0    50   ~ 0
RCLK
Text Label 2250 4075 0    50   ~ 0
GND
Text Label 2250 4175 0    50   ~ 0
SER
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 5EC7A9CD
P 2050 3975
F 0 "J1" H 1950 4050 50  0000 C CNN
F 1 "Data" H 2150 3675 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 2050 3975 50  0001 C CNN
F 3 "~" H 2050 3975 50  0001 C CNN
	1    2050 3975
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 4175 2550 4175
Wire Wire Line
	2550 4175 2550 3675
Wire Wire Line
	2550 3675 3175 3675
Wire Wire Line
	2250 3975 2825 3975
Wire Wire Line
	2250 4075 2750 4075
$Comp
L power:+5V #PWR0102
U 1 1 5EC80007
P 3275 3000
F 0 "#PWR0102" H 3275 2850 50  0001 C CNN
F 1 "+5V" H 3290 3173 50  0000 C CNN
F 2 "" H 3275 3000 50  0001 C CNN
F 3 "" H 3275 3000 50  0001 C CNN
	1    3275 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5EC816A0
P 3275 3175
F 0 "C1" H 3366 3129 50  0000 L CNN
F 1 "0.1uF" H 3366 3220 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3275 3175 50  0001 C CNN
F 3 "~" H 3275 3175 50  0001 C CNN
	1    3275 3175
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5EC832F4
P 3275 3325
F 0 "#PWR0103" H 3275 3075 50  0001 C CNN
F 1 "GND" H 3125 3250 50  0000 C CNN
F 2 "" H 3275 3325 50  0001 C CNN
F 3 "" H 3275 3325 50  0001 C CNN
	1    3275 3325
	1    0    0    -1  
$EndComp
NoConn ~ 3975 4575
Wire Wire Line
	3975 3675 4650 3675
Wire Wire Line
	4675 5225 4525 5225
Wire Wire Line
	4525 3775 3975 3775
Wire Wire Line
	3975 3875 4400 3875
Wire Wire Line
	4400 3875 4400 5325
Wire Wire Line
	4400 5325 4675 5325
Wire Wire Line
	3975 3975 4275 3975
Wire Wire Line
	4275 3975 4275 5425
Wire Wire Line
	4275 5425 4675 5425
Wire Wire Line
	4675 5125 4650 5125
Wire Wire Line
	4650 5125 4650 3675
Wire Wire Line
	4650 3675 6200 3675
Connection ~ 4650 3675
Wire Wire Line
	4400 3875 6200 3875
Connection ~ 4400 3875
Wire Wire Line
	4525 5225 4525 3775
Connection ~ 4525 3775
$Comp
L power:+5V #PWR0104
U 1 1 5EC8CFAB
P 5975 2450
F 0 "#PWR0104" H 5975 2300 50  0001 C CNN
F 1 "+5V" H 5990 2623 50  0000 C CNN
F 2 "" H 5975 2450 50  0001 C CNN
F 3 "" H 5975 2450 50  0001 C CNN
	1    5975 2450
	1    0    0    -1  
$EndComp
Connection ~ 4275 3975
$Comp
L power:GND #PWR0105
U 1 1 5EC8EB24
P 6700 5325
F 0 "#PWR0105" H 6700 5075 50  0001 C CNN
F 1 "GND" H 6705 5152 50  0000 C CNN
F 2 "" H 6700 5325 50  0001 C CNN
F 3 "" H 6700 5325 50  0001 C CNN
	1    6700 5325
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 5075 6500 5200
Wire Wire Line
	6500 5200 6600 5200
Wire Wire Line
	6900 5200 6900 5075
Wire Wire Line
	6800 5075 6800 5200
Connection ~ 6800 5200
Wire Wire Line
	6800 5200 6900 5200
Wire Wire Line
	6600 5075 6600 5200
Connection ~ 6600 5200
Wire Wire Line
	6600 5200 6700 5200
Wire Wire Line
	6700 5200 6700 5325
Connection ~ 6700 5200
Wire Wire Line
	6700 5200 6800 5200
$Comp
L Device:C_Small C2
U 1 1 5EC91C17
P 5975 2750
F 0 "C2" H 5850 2850 50  0000 L CNN
F 1 "0.1uF" H 5750 2675 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5975 2750 50  0001 C CNN
F 3 "~" H 5975 2750 50  0001 C CNN
	1    5975 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5ECA16FA
P 6075 2950
F 0 "#PWR0106" H 6075 2700 50  0001 C CNN
F 1 "GND" H 6080 2777 50  0000 C CNN
F 2 "" H 6075 2950 50  0001 C CNN
F 3 "" H 6075 2950 50  0001 C CNN
	1    6075 2950
	1    0    0    -1  
$EndComp
$Comp
L power:Vdrive #PWR0107
U 1 1 5ECA4222
P 7450 2425
F 0 "#PWR0107" H 7250 2275 50  0001 C CNN
F 1 "Vdrive" H 7467 2598 50  0000 C CNN
F 2 "" H 7450 2425 50  0001 C CNN
F 3 "" H 7450 2425 50  0001 C CNN
	1    7450 2425
	1    0    0    -1  
$EndComp
Text Label 5050 3675 0    50   ~ 0
QA
Text Label 5050 3775 0    50   ~ 0
QB
Text Label 5050 3875 0    50   ~ 0
QC
Text Label 5050 3975 0    50   ~ 0
QD
Wire Wire Line
	5550 4475 5550 3775
Wire Wire Line
	5550 4475 6200 4475
Wire Wire Line
	4525 3775 5550 3775
Wire Wire Line
	5400 3975 5400 4275
Wire Wire Line
	5400 4275 6200 4275
Wire Wire Line
	4275 3975 5400 3975
Wire Wire Line
	5975 2850 6075 2850
Wire Wire Line
	6075 2850 6075 2950
Wire Wire Line
	6175 2850 6075 2850
Connection ~ 6075 2850
Wire Wire Line
	5975 2650 5975 2525
Wire Wire Line
	5975 2525 6175 2525
Wire Wire Line
	6175 2650 6175 2525
Connection ~ 6175 2525
Wire Wire Line
	6175 2525 6600 2525
$Comp
L Device:CP1_Small C8
U 1 1 5ECB4622
P 7450 2750
F 0 "C8" H 7500 2825 50  0000 L CNN
F 1 "100uF" H 7525 2700 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 7450 2750 50  0001 C CNN
F 3 "~" H 7450 2750 50  0001 C CNN
	1    7450 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5ECB4628
P 7250 2750
F 0 "C6" H 7125 2850 50  0000 L CNN
F 1 "0.1uF" H 7025 2675 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7250 2750 50  0001 C CNN
F 3 "~" H 7250 2750 50  0001 C CNN
	1    7250 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5ECB462E
P 7350 2950
F 0 "#PWR0108" H 7350 2700 50  0001 C CNN
F 1 "GND" H 7355 2777 50  0000 C CNN
F 2 "" H 7350 2950 50  0001 C CNN
F 3 "" H 7350 2950 50  0001 C CNN
	1    7350 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2850 7350 2850
Wire Wire Line
	7350 2850 7350 2950
Wire Wire Line
	7450 2850 7350 2850
Connection ~ 7350 2850
Wire Wire Line
	7250 2650 7250 2525
Wire Wire Line
	7450 2650 7450 2525
Wire Wire Line
	6800 2525 6800 3275
Wire Wire Line
	6800 2525 7250 2525
Wire Wire Line
	7450 2525 7250 2525
Connection ~ 7250 2525
$Comp
L Connector:Conn_01x04_Male J5
U 1 1 5ECB9668
P 9525 3775
F 0 "J5" H 9425 3850 50  0000 C CNN
F 1 "Out" H 9425 3725 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 9525 3775 50  0001 C CNN
F 3 "~" H 9525 3775 50  0001 C CNN
	1    9525 3775
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7200 3875 7475 3875
Wire Wire Line
	7475 3875 7475 3775
Wire Wire Line
	7200 4275 7625 4275
Wire Wire Line
	7625 4275 7625 3875
Wire Wire Line
	7775 3975 7775 4475
Wire Wire Line
	7775 4475 7200 4475
$Comp
L Device:C_Small C3
U 1 1 5ECC0C58
P 7775 4750
F 0 "C3" H 7650 4850 50  0000 L CNN
F 1 "0.1uF" V 7825 4800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7775 4750 50  0001 C CNN
F 3 "~" H 7775 4750 50  0001 C CNN
	1    7775 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3675 8600 3675
Wire Wire Line
	7475 3775 8325 3775
Wire Wire Line
	7625 3875 8050 3875
$Comp
L Device:C_Small C5
U 1 1 5ECC919D
P 8050 4750
F 0 "C5" H 7925 4850 50  0000 L CNN
F 1 "0.1uF" V 8100 4800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8050 4750 50  0001 C CNN
F 3 "~" H 8050 4750 50  0001 C CNN
	1    8050 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5ECC9642
P 8325 4750
F 0 "C7" H 8200 4850 50  0000 L CNN
F 1 "0.1uF" V 8375 4800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8325 4750 50  0001 C CNN
F 3 "~" H 8325 4750 50  0001 C CNN
	1    8325 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 5ECC98A6
P 8600 4750
F 0 "C9" H 8475 4850 50  0000 L CNN
F 1 "0.1uF" V 8650 4800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8600 4750 50  0001 C CNN
F 3 "~" H 8600 4750 50  0001 C CNN
	1    8600 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7775 4650 7775 4475
Connection ~ 7775 4475
Wire Wire Line
	8050 4650 8050 3875
Connection ~ 8050 3875
Wire Wire Line
	8325 4650 8325 3775
Connection ~ 8325 3775
Wire Wire Line
	8600 4650 8600 3675
Connection ~ 8600 3675
$Comp
L power:GND #PWR0109
U 1 1 5ECD416B
P 8175 5050
F 0 "#PWR0109" H 8175 4800 50  0001 C CNN
F 1 "GND" H 8180 4877 50  0000 C CNN
F 2 "" H 8175 5050 50  0001 C CNN
F 3 "" H 8175 5050 50  0001 C CNN
	1    8175 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7775 4850 8050 4850
Connection ~ 8050 4850
Connection ~ 8325 4850
Wire Wire Line
	8325 4850 8600 4850
Wire Wire Line
	8175 5050 8175 4850
Wire Wire Line
	8050 4850 8175 4850
Connection ~ 8175 4850
Wire Wire Line
	8175 4850 8325 4850
Text Label 8775 3675 0    50   ~ 0
X1-2
Text Label 8775 3775 0    50   ~ 0
X1-1
Text Label 8775 3875 0    50   ~ 0
X1-4
Text Label 8775 3975 0    50   ~ 0
X1-3
Wire Wire Line
	8600 3675 9325 3675
Wire Wire Line
	8325 3775 9325 3775
Wire Wire Line
	8050 3875 9325 3875
Wire Wire Line
	7775 3975 9325 3975
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5ECE27DB
P 3825 1825
F 0 "J2" H 3750 1775 50  0000 C CNN
F 1 "+5V IN" H 3675 1650 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3825 1825 50  0001 C CNN
F 3 "~" H 3825 1825 50  0001 C CNN
	1    3825 1825
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5ECE3258
P 3825 2300
F 0 "J3" H 3750 2250 50  0000 C CNN
F 1 "+V Motor" H 3675 2125 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3825 2300 50  0001 C CNN
F 3 "~" H 3825 2300 50  0001 C CNN
	1    3825 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5ECE3580
P 4100 2450
F 0 "#PWR0110" H 4100 2200 50  0001 C CNN
F 1 "GND" H 4105 2277 50  0000 C CNN
F 2 "" H 4100 2450 50  0001 C CNN
F 3 "" H 4100 2450 50  0001 C CNN
	1    4100 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2450 4100 2400
Wire Wire Line
	4100 2400 4025 2400
$Comp
L power:GND #PWR0111
U 1 1 5ECE5C2E
P 4100 2000
F 0 "#PWR0111" H 4100 1750 50  0001 C CNN
F 1 "GND" H 4105 1827 50  0000 C CNN
F 2 "" H 4100 2000 50  0001 C CNN
F 3 "" H 4100 2000 50  0001 C CNN
	1    4100 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2000 4100 1925
Wire Wire Line
	4100 1925 4025 1925
$Comp
L power:+5V #PWR0112
U 1 1 5ECE8372
P 4100 1750
F 0 "#PWR0112" H 4100 1600 50  0001 C CNN
F 1 "+5V" H 4115 1923 50  0000 C CNN
F 2 "" H 4100 1750 50  0001 C CNN
F 3 "" H 4100 1750 50  0001 C CNN
	1    4100 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1750 4100 1825
Wire Wire Line
	4100 1825 4025 1825
$Comp
L power:Vdrive #PWR0113
U 1 1 5ECEAD2A
P 4350 2275
F 0 "#PWR0113" H 4150 2125 50  0001 C CNN
F 1 "Vdrive" H 4367 2448 50  0000 C CNN
F 2 "" H 4350 2275 50  0001 C CNN
F 3 "" H 4350 2275 50  0001 C CNN
	1    4350 2275
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 2275 4350 2300
Wire Wire Line
	4350 2300 4025 2300
Wire Wire Line
	6600 2525 6600 3275
$Comp
L power:+5V #PWR0114
U 1 1 5ED0AA15
P 6200 4675
F 0 "#PWR0114" H 6200 4525 50  0001 C CNN
F 1 "+5V" V 6215 4848 50  0000 C CNN
F 2 "" H 6200 4675 50  0001 C CNN
F 3 "" H 6200 4675 50  0001 C CNN
	1    6200 4675
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0115
U 1 1 5ED0B1F8
P 6200 4075
F 0 "#PWR0115" H 6200 3925 50  0001 C CNN
F 1 "+5V" V 6215 4248 50  0000 C CNN
F 2 "" H 6200 4075 50  0001 C CNN
F 3 "" H 6200 4075 50  0001 C CNN
	1    6200 4075
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5975 2450 5975 2525
Connection ~ 5975 2525
Wire Wire Line
	7450 2425 7450 2525
Connection ~ 7450 2525
$Comp
L power:+5V #PWR0116
U 1 1 5ED108C4
P 3175 3975
F 0 "#PWR0116" H 3175 3825 50  0001 C CNN
F 1 "+5V" V 3190 4148 50  0000 C CNN
F 2 "" H 3175 3975 50  0001 C CNN
F 3 "" H 3175 3975 50  0001 C CNN
	1    3175 3975
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2825 3975 2825 4175
Wire Wire Line
	2825 4175 3175 4175
Wire Wire Line
	3175 4275 3175 4775
Connection ~ 3175 4775
Wire Wire Line
	3175 4775 3575 4775
Wire Wire Line
	3175 4275 2750 4275
Wire Wire Line
	2750 4075 2750 4275
Connection ~ 3175 4275
Wire Wire Line
	3275 3000 3275 3075
Wire Wire Line
	3275 3075 3575 3075
Wire Wire Line
	3575 3075 3575 3475
Connection ~ 3275 3075
Wire Wire Line
	3275 3275 3275 3325
$Comp
L Connector:Conn_01x04_Male J4
U 1 1 5EC860E0
P 4875 5225
F 0 "J4" H 4775 5300 50  0000 C CNN
F 1 "Dbug" H 4725 5125 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4875 5225 50  0001 C CNN
F 3 "~" H 4875 5225 50  0001 C CNN
	1    4875 5225
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
