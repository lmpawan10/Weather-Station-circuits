EESchema Schematic File Version 4
LIBS:Main_board-cache
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
L MCU_Microchip_ATmega:ATmega328-PU U2
U 1 1 60C1EC5C
P 5750 2100
F 0 "U2" H 5109 2146 50  0000 R CNN
F 1 "ATmega328-PU" H 5109 2055 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 5750 2100 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 5750 2100 50  0001 C CNN
	1    5750 2100
	1    0    0    -1  
$EndComp
Text Label 6350 2600 0    50   ~ 0
DigitalPin0(RX)
Text Label 6350 2700 0    50   ~ 0
DigitalPin1(TX)
Text Label 6350 2800 0    50   ~ 0
DigitalPin2
Text Label 6350 2900 0    50   ~ 0
DigitalPin3(PWM)
Text Label 6350 3000 0    50   ~ 0
DigitalPin4
Text Label 5750 3600 0    50   ~ 0
GND
Text Label 5750 600  2    50   ~ 0
VCC
Text Label 6350 1500 0    50   ~ 0
CRYSTAL1
Text Label 6350 1600 0    50   ~ 0
CRYSTAL2
Text Label 6350 3100 0    50   ~ 0
DigitalPin5(PWM)
Text Label 6350 3200 0    50   ~ 0
DigitalPin6(PWM)
Text Label 6350 3300 0    50   ~ 0
DigitalPin7
Text Label 6350 900  0    50   ~ 0
DigitalPin8
Text Label 6350 1000 0    50   ~ 0
DigitalPin9(PWM)
Text Label 6350 1100 0    50   ~ 0
DigitalPin10(PWM)
Text Label 6350 1200 0    50   ~ 0
DigitalPin11(PWM\MOSI)
Text Label 6350 1300 0    50   ~ 0
DigitalPin12(MISO)
Text Label 6350 1400 0    50   ~ 0
DigitalPin13(SCK)
Text Label 5150 900  2    50   ~ 0
AnalogReference
Text Label 6350 2400 0    50   ~ 0
RESET
Text Label 6350 2300 0    50   ~ 0
AnalogInput5(ADC5\SCL)
Text Label 6350 2200 0    50   ~ 0
AnalogInput4(ADC4\SDA)
Text Label 6350 2100 0    50   ~ 0
AnalogInput3(ADC3)
Text Label 6350 2000 0    50   ~ 0
AnalogInput2(ADC2)
Text Label 6350 1900 0    50   ~ 0
AnalogInput1(ADC1)
Text Label 6350 1800 0    50   ~ 0
AnalogInput0(ADC0)
Text Label 5850 600  0    50   ~ 0
VCC
Wire Bus Line
	4200 450  4200 1300
$Comp
L Device:R 10k3
U 1 1 60C1F7BD
P 8150 850
F 0 "10k3" H 8220 896 50  0000 L CNN
F 1 "R" H 8000 900 50  0000 L CNN
F 2 "modFiles:Resistor_small" V 8080 850 50  0001 C CNN
F 3 "~" H 8150 850 50  0001 C CNN
	1    8150 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1000 8150 1150
Wire Wire Line
	7900 1150 8150 1150
Wire Wire Line
	8550 1150 8600 1150
Wire Wire Line
	8600 1150 8600 1250
$Comp
L power:GND #PWR011
U 1 1 60C1F943
P 8600 1250
F 0 "#PWR011" H 8600 1000 50  0001 C CNN
F 1 "GND" H 8605 1077 50  0000 C CNN
F 2 "" H 8600 1250 50  0001 C CNN
F 3 "" H 8600 1250 50  0001 C CNN
	1    8600 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 60C1F969
P 5750 3600
F 0 "#PWR06" H 5750 3350 50  0001 C CNN
F 1 "GND" H 5755 3427 50  0000 C CNN
F 2 "" H 5750 3600 50  0001 C CNN
F 3 "" H 5750 3600 50  0001 C CNN
	1    5750 3600
	1    0    0    -1  
$EndComp
Text Label 7900 1150 2    50   ~ 0
RESET
Connection ~ 8150 1150
$Comp
L Switch:SW_Push SW1
U 1 1 60C1F879
P 8350 1150
F 0 "SW1" H 8500 1250 50  0000 C CNN
F 1 "SW_Push" H 8350 1344 50  0000 C CNN
F 2 "modFiles:Push_Button" H 8350 1350 50  0001 C CNN
F 3 "" H 8350 1350 50  0001 C CNN
	1    8350 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 700  8150 650 
Text Label 8150 650  0    50   ~ 0
VCC
Wire Bus Line
	8800 1550 8800 450 
Connection ~ 7650 1550
Wire Bus Line
	7650 1550 7650 450 
$Comp
L Device:Crystal 16Mhz1
U 1 1 60C1FC19
P 8250 1900
F 0 "16Mhz1" V 8250 1550 50  0000 L CNN
F 1 "Crystal" V 8550 1750 50  0000 L CNN
F 2 "modFiles:Crystal" H 8250 1900 50  0001 C CNN
F 3 "~" H 8250 1900 50  0001 C CNN
	1    8250 1900
	0    1    1    0   
$EndComp
$Comp
L Device:C C5
U 1 1 60C1FC69
P 8550 1750
F 0 "C5" V 8400 1750 50  0000 C CNN
F 1 "22pF" V 8500 1600 50  0000 C CNN
F 2 "modFiles:Capacitor_Disc_Small" H 8588 1600 50  0001 C CNN
F 3 "~" H 8550 1750 50  0001 C CNN
	1    8550 1750
	0    1    1    0   
$EndComp
$Comp
L Device:C C6
U 1 1 60C1FCB1
P 8550 2050
F 0 "C6" V 8700 2050 50  0000 C CNN
F 1 "22pF" V 8600 1900 50  0000 C CNN
F 2 "modFiles:Capacitor_Disc_Small" H 8588 1900 50  0001 C CNN
F 3 "~" H 8550 2050 50  0001 C CNN
	1    8550 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 1750 8400 1750
Wire Wire Line
	8250 2050 8400 2050
Wire Wire Line
	8250 1750 8050 1750
Connection ~ 8250 1750
Wire Wire Line
	8250 2050 8050 2050
Connection ~ 8250 2050
Text Label 8050 1750 2    50   ~ 0
CRYSTAL1
Text Label 8050 2050 2    50   ~ 0
CRYSTAL2
$Comp
L power:GND #PWR012
U 1 1 60C1FF6E
P 8700 1750
F 0 "#PWR012" H 8700 1500 50  0001 C CNN
F 1 "GND" H 8705 1577 50  0000 C CNN
F 2 "" H 8700 1750 50  0001 C CNN
F 3 "" H 8700 1750 50  0001 C CNN
	1    8700 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 60C1FF89
P 8700 2050
F 0 "#PWR013" H 8700 1800 50  0001 C CNN
F 1 "GND" H 8705 1877 50  0000 C CNN
F 2 "" H 8700 2050 50  0001 C CNN
F 3 "" H 8700 2050 50  0001 C CNN
	1    8700 2050
	1    0    0    -1  
$EndComp
Wire Bus Line
	8800 1550 8800 2300
Wire Bus Line
	8800 2300 7650 2300
Connection ~ 7650 2300
Wire Bus Line
	7650 2300 7650 1550
Text Label 7900 2800 0    50   ~ 0
VCC
Connection ~ 8800 2300
Connection ~ 8800 1550
Wire Bus Line
	7650 1550 8800 1550
Wire Wire Line
	3450 2600 3300 2600
$Comp
L Device:R 10k1
U 1 1 60C20B29
P 3650 2600
F 0 "10k1" V 3750 2650 50  0000 C CNN
F 1 "R" V 3534 2600 50  0000 C CNN
F 2 "modFiles:Resistor_small" V 3580 2600 50  0001 C CNN
F 3 "~" H 3650 2600 50  0001 C CNN
	1    3650 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 2600 3450 2600
Connection ~ 3450 2600
Wire Wire Line
	3800 2600 3900 2600
Text Label 3900 2600 0    50   ~ 0
VCC
$Comp
L power:GND #PWR03
U 1 1 60C20E65
P 4000 2800
F 0 "#PWR03" H 4000 2550 50  0001 C CNN
F 1 "GND" H 4005 2627 50  0000 C CNN
F 2 "" H 4000 2800 50  0001 C CNN
F 3 "" H 4000 2800 50  0001 C CNN
	1    4000 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2800 3550 2800
Wire Wire Line
	3550 2800 3550 2900
Wire Wire Line
	3450 2600 3450 2900
Wire Bus Line
	8800 4000 7650 4000
Connection ~ 7650 4000
$Comp
L Connector:Conn_01x04_Female J2
U 1 1 60C21B0C
P 3600 1100
F 0 "J2" V 3447 1248 50  0000 L CNN
F 1 "DHT22" V 3700 900 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3600 1100 50  0001 C CNN
F 3 "~" H 3600 1100 50  0001 C CNN
	1    3600 1100
	0    1    1    0   
$EndComp
Text Label 3700 900  0    50   ~ 0
VCC
Text Label 3400 900  2    50   ~ 0
GND
Wire Wire Line
	3600 900  3600 750 
NoConn ~ 3500 900 
Wire Bus Line
	3150 450  3150 1300
Wire Bus Line
	3150 1300 4200 1300
Connection ~ 4200 1300
$Comp
L Device:R 10k2
U 1 1 60C225A3
P 3750 750
F 0 "10k2" V 3543 750 50  0000 C CNN
F 1 "R" V 3634 750 50  0000 C CNN
F 2 "modFiles:Resistor_small" V 3680 750 50  0001 C CNN
F 3 "~" H 3750 750 50  0001 C CNN
	1    3750 750 
	0    1    1    0   
$EndComp
Text Label 3900 750  0    50   ~ 0
VCC
$Comp
L Device:C C1
U 1 1 60C2275A
P 3600 1500
F 0 "C1" V 3500 1600 50  0000 C CNN
F 1 "C" V 3439 1500 50  0000 C CNN
F 2 "modFiles:Capacitor_Disc_Small" H 3638 1350 50  0001 C CNN
F 3 "~" H 3600 1500 50  0001 C CNN
	1    3600 1500
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 60C2278E
P 3600 1700
F 0 "C2" V 3348 1700 50  0000 C CNN
F 1 "C" V 3439 1700 50  0000 C CNN
F 2 "modFiles:Capacitor_Disc_Small" H 3638 1550 50  0001 C CNN
F 3 "~" H 3600 1700 50  0001 C CNN
	1    3600 1700
	0    1    1    0   
$EndComp
$Comp
L Device:C C3
U 1 1 60C227D0
P 3600 1900
F 0 "C3" V 3348 1900 50  0000 C CNN
F 1 "C" V 3439 1900 50  0000 C CNN
F 2 "modFiles:Capacitor_Disc_Small" H 3638 1750 50  0001 C CNN
F 3 "~" H 3600 1900 50  0001 C CNN
	1    3600 1900
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 60C22804
P 3600 2100
F 0 "C4" V 3348 2100 50  0000 C CNN
F 1 "C" V 3439 2100 50  0000 C CNN
F 2 "modFiles:Capacitor_Disc_Small" H 3638 1950 50  0001 C CNN
F 3 "~" H 3600 2100 50  0001 C CNN
	1    3600 2100
	0    1    1    0   
$EndComp
Text Label 3450 1500 2    50   ~ 0
VCC
Text Label 3450 1700 2    50   ~ 0
VCC
Text Label 3450 1900 2    50   ~ 0
VCC
Text Label 3450 2100 2    50   ~ 0
VCC
Wire Wire Line
	3750 1500 3750 1700
Wire Wire Line
	3750 1700 3750 1900
Connection ~ 3750 1700
Wire Wire Line
	3750 1900 3750 2100
Connection ~ 3750 1900
Wire Wire Line
	3750 2100 3750 2200
Connection ~ 3750 2100
$Comp
L power:GND #PWR02
U 1 1 60C23CAF
P 3750 2200
F 0 "#PWR02" H 3750 1950 50  0001 C CNN
F 1 "GND" H 3900 2200 50  0000 C CNN
F 2 "" H 3750 2200 50  0001 C CNN
F 3 "" H 3750 2200 50  0001 C CNN
	1    3750 2200
	1    0    0    -1  
$EndComp
Connection ~ 3150 1300
$Comp
L power:GND #PWR04
U 1 1 60C4B085
P 4100 3600
F 0 "#PWR04" H 4100 3350 50  0001 C CNN
F 1 "GND" H 4105 3427 50  0000 C CNN
F 2 "" H 4100 3600 50  0001 C CNN
F 3 "" H 4100 3600 50  0001 C CNN
	1    4100 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3550 3950 3450
Connection ~ 4200 4000
$Comp
L Device:LED D2
U 1 1 60C4C9AC
P 8500 2900
F 0 "D2" H 8491 3116 50  0000 C CNN
F 1 "LED" H 8500 3000 50  0000 C CNN
F 2 "modFiles:LED_D3.0mm" H 8500 2900 50  0001 C CNN
F 3 "~" H 8500 2900 50  0001 C CNN
	1    8500 2900
	-1   0    0    1   
$EndComp
$Comp
L Device:R 330ohm2
U 1 1 60C4CA1F
P 8150 2800
F 0 "330ohm2" V 8050 2800 50  0000 C CNN
F 1 "R" V 8250 2800 50  0000 C CNN
F 2 "modFiles:Resistor_small" V 8080 2800 50  0001 C CNN
F 3 "~" H 8150 2800 50  0001 C CNN
	1    8150 2800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 60D1E414
P 8400 4500
F 0 "#PWR010" H 8400 4250 50  0001 C CNN
F 1 "GND" H 8405 4327 50  0000 C CNN
F 2 "" H 8400 4500 50  0001 C CNN
F 3 "" H 8400 4500 50  0001 C CNN
	1    8400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4500 8400 4350
Wire Wire Line
	8400 4350 8100 4350
Wire Wire Line
	8100 4350 8100 4450
Text Label 7900 3100 0    50   ~ 0
DigitalPin7
Connection ~ 7400 4000
Wire Bus Line
	7400 4000 7650 4000
Connection ~ 8800 4000
$Comp
L Connector:Conn_01x06_Female J4
U 1 1 60DC2704
P 6150 4800
F 0 "J4" V 5997 5048 50  0000 L CNN
F 1 "SD-Card Module" H 5450 5550 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 6150 4800 50  0001 C CNN
F 3 "~" H 6150 4800 50  0001 C CNN
	1    6150 4800
	-1   0    0    1   
$EndComp
Text Label 8000 4450 2    50   ~ 0
DigitalPin8
Text Label 7900 3200 0    50   ~ 0
AnalogInput0(ADC0)
Text Label 6350 4600 0    50   ~ 0
DigitalPin13(SCK)
Text Label 6350 4700 0    50   ~ 0
DigitalPin11(PWM\MOSI)
Text Label 6350 4800 0    50   ~ 0
DigitalPin12(MISO)
$Comp
L power:GND #PWR07
U 1 1 60DC4D92
P 6450 5100
F 0 "#PWR07" H 6450 4850 50  0001 C CNN
F 1 "GND" H 6455 4927 50  0000 C CNN
F 2 "" H 6450 5100 50  0001 C CNN
F 3 "" H 6450 5100 50  0001 C CNN
	1    6450 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 5100 6450 5000
Wire Wire Line
	6450 5000 6350 5000
Text Label 6350 4900 0    50   ~ 0
VCC
Text Label 3600 750  2    50   ~ 0
DigitalPin4
Wire Wire Line
	3950 3450 4100 3450
Wire Wire Line
	4100 3450 4100 3600
$Comp
L ESP8266-01_ESP-01:ESP8266-01_ESP-01 U1
U 1 1 60DC84DD
P 4600 4750
F 0 "U1" H 4600 5417 50  0000 C CNN
F 1 "ESP8266-01_ESP-01" H 4550 3900 50  0000 C CNN
F 2 "Esp:ESP-01" H 4600 4750 50  0001 L BNN
F 3 "" H 4600 4750 50  0001 L BNN
F 4 "AI-Thinkers vendor" H 4600 4750 50  0001 L BNN "MANUFACTURER"
	1    4600 4750
	1    0    0    -1  
$EndComp
Wire Bus Line
	4200 4000 5950 4000
Wire Bus Line
	8800 6000 7400 6000
Wire Bus Line
	3150 4000 3150 6000
Wire Bus Line
	5950 4000 5950 6000
Connection ~ 5950 4000
Wire Bus Line
	5950 4000 7400 4000
Connection ~ 5950 6000
Wire Bus Line
	5950 6000 3150 6000
Connection ~ 7400 6000
Wire Bus Line
	7400 6000 5950 6000
Wire Bus Line
	7400 4000 7400 4950
Wire Bus Line
	8800 4000 8800 4950
Wire Bus Line
	7400 4950 8800 4950
Connection ~ 7400 4950
Wire Bus Line
	7400 4950 7400 6000
Connection ~ 8800 4950
Wire Bus Line
	8800 4950 8800 6000
Text Label 5300 4750 0    50   ~ 0
DigitalPin1(TX)
$Comp
L power:GND #PWR05
U 1 1 60DCD889
P 5350 5150
F 0 "#PWR05" H 5350 4900 50  0001 C CNN
F 1 "GND" H 5355 4977 50  0000 C CNN
F 2 "" H 5350 5150 50  0001 C CNN
F 3 "" H 5350 5150 50  0001 C CNN
	1    5350 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 5050 5350 5050
Wire Wire Line
	5350 5050 5350 5150
$Comp
L Device:R 330ohm1
U 1 1 60DCE67C
P 8150 2900
F 0 "330ohm1" V 8050 2900 50  0000 C CNN
F 1 "R" V 8250 2900 50  0000 C CNN
F 2 "modFiles:Resistor_small" V 8080 2900 50  0001 C CNN
F 3 "~" H 8150 2900 50  0001 C CNN
	1    8150 2900
	0    1    1    0   
$EndComp
$Comp
L Device:LED D1
U 1 1 60DCE6DA
P 8500 2800
F 0 "D1" H 8500 2700 50  0000 C CNN
F 1 "LED" H 8500 2900 50  0000 C CNN
F 2 "modFiles:LED_D3.0mm" H 8500 2800 50  0001 C CNN
F 3 "~" H 8500 2800 50  0001 C CNN
	1    8500 2800
	-1   0    0    1   
$EndComp
Text Label 7900 3000 0    50   ~ 0
GND
Text Label 7900 2900 0    50   ~ 0
3.3V
Text Label 5300 4350 0    50   ~ 0
3.3V
Text Label 3900 4450 2    50   ~ 0
3.3V
$Comp
L Device:R 1k1
U 1 1 60DD17CE
P 3500 4750
F 0 "1k1" V 3600 4750 50  0000 C CNN
F 1 "R" V 3450 4900 50  0000 C CNN
F 2 "modFiles:Resistor_small" V 3430 4750 50  0001 C CNN
F 3 "~" H 3500 4750 50  0001 C CNN
	1    3500 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R 2.2k1
U 1 1 60DD18FE
P 3700 5000
F 0 "2.2k1" H 3850 5000 50  0000 C CNN
F 1 "R" V 3584 5000 50  0000 C CNN
F 2 "modFiles:Resistor_small" V 3630 5000 50  0001 C CNN
F 3 "~" H 3700 5000 50  0001 C CNN
	1    3700 5000
	-1   0    0    1   
$EndComp
Wire Wire Line
	3700 4850 3700 4750
Wire Wire Line
	3700 4750 3900 4750
Wire Wire Line
	3700 4750 3650 4750
Connection ~ 3700 4750
Wire Wire Line
	3350 4750 3350 4650
Text Label 3350 4650 0    50   ~ 0
DigitalPin0(RX)
$Comp
L power:GND #PWR01
U 1 1 60DD4EFE
P 3700 5250
F 0 "#PWR01" H 3700 5000 50  0001 C CNN
F 1 "GND" H 3705 5077 50  0000 C CNN
F 2 "" H 3700 5250 50  0001 C CNN
F 3 "" H 3700 5250 50  0001 C CNN
	1    3700 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 5250 3700 5200
Wire Wire Line
	3900 4950 3850 4950
Wire Wire Line
	3850 4950 3850 5200
Wire Wire Line
	3850 5200 3700 5200
Connection ~ 3700 5200
Wire Wire Line
	3700 5200 3700 5150
Wire Bus Line
	3150 1300 3150 2350
Wire Bus Line
	3150 2350 4200 2350
Wire Bus Line
	4200 1300 4200 2350
Connection ~ 3150 2350
Connection ~ 4200 2350
Wire Wire Line
	3300 2450 3300 2600
Wire Bus Line
	3150 2350 3150 3350
Wire Bus Line
	4200 2350 4200 3350
Connection ~ 4200 3350
Wire Bus Line
	4200 3350 4200 4000
Wire Bus Line
	3150 3350 4200 3350
Wire Bus Line
	3150 4000 4200 4000
Wire Bus Line
	3150 3350 3150 4000
Connection ~ 3150 3350
Connection ~ 3150 4000
NoConn ~ 3900 5050
NoConn ~ 3900 4350
Wire Bus Line
	7650 2300 7650 4000
Wire Bus Line
	8800 2300 8800 4000
$Comp
L Connector:Conn_01x05_Female J7
U 1 1 60DED5AD
P 7700 3000
F 0 "J7" H 7594 2575 50  0000 C CNN
F 1 "Conn_01x05_Female" H 7594 2666 50  0000 C CNN
F 2 "fiveconn:new_5_jst_bournier" H 7700 3000 50  0001 C CNN
F 3 "~" H 7700 3000 50  0001 C CNN
	1    7700 3000
	-1   0    0    1   
$EndComp
Wire Wire Line
	7900 2800 8000 2800
Wire Wire Line
	7900 2900 8000 2900
Wire Wire Line
	8300 2800 8350 2800
Wire Wire Line
	8300 2900 8350 2900
Wire Wire Line
	8650 2800 8650 2900
$Comp
L power:GND #PWR0101
U 1 1 60DF77E6
P 8750 2900
F 0 "#PWR0101" H 8750 2650 50  0001 C CNN
F 1 "GND" H 8755 2727 50  0000 C CNN
F 2 "" H 8750 2900 50  0001 C CNN
F 3 "" H 8750 2900 50  0001 C CNN
	1    8750 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2900 8750 2900
Connection ~ 8650 2900
Text Label 6350 4500 0    50   ~ 0
DigitalPin6(PWM)
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 60EBD8AE
P 3450 3100
F 0 "J1" V 3297 3248 50  0000 L CNN
F 1 "Wind Vane" V 3550 2900 50  0000 L CNN
F 2 "Connector_JST:JST_EH_B03B-EH-A_1x03_P2.50mm_Vertical" H 3450 3100 50  0001 C CNN
F 3 "~" H 3450 3100 50  0001 C CNN
	1    3450 3100
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Female J5
U 1 1 60EBDAF4
P 8000 4650
F 0 "J5" V 7847 4798 50  0000 L CNN
F 1 "Rain Gauge" V 8100 4450 50  0000 L CNN
F 2 "Connector_JST:JST_EH_B03B-EH-A_1x03_P2.50mm_Vertical" H 8000 4650 50  0001 C CNN
F 3 "~" H 8000 4650 50  0001 C CNN
	1    8000 4650
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Female J3
U 1 1 60EBDB70
P 3850 3750
F 0 "J3" V 3697 3898 50  0000 L CNN
F 1 "Anemometer" V 3950 3550 50  0000 L CNN
F 2 "Connector_JST:JST_EH_B03B-EH-A_1x03_P2.50mm_Vertical" H 3850 3750 50  0001 C CNN
F 3 "~" H 3850 3750 50  0001 C CNN
	1    3850 3750
	0    1    1    0   
$EndComp
Text Label 3300 2450 0    50   ~ 0
AnalogInput1(ADC1)
Text Label 3850 3550 2    50   ~ 0
DigitalPin3(PWM)
$Comp
L Connector:Conn_01x02_Female J6
U 1 1 60EC20B4
P 8200 5550
F 0 "J6" V 8047 5598 50  0000 L CNN
F 1 "Test pins" V 8250 5350 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8200 5550 50  0001 C CNN
F 3 "~" H 8200 5550 50  0001 C CNN
	1    8200 5550
	0    1    1    0   
$EndComp
Text Label 8100 5350 2    50   ~ 0
AnalogInput2(ADC2)
Text Label 8200 5350 0    50   ~ 0
AnalogInput3(ADC3)
$Comp
L Device:LED D3
U 1 1 60EC2943
P 8650 5350
F 0 "D3" V 8688 5233 50  0000 R CNN
F 1 "LED" V 8597 5233 50  0000 R CNN
F 2 "modFiles:LED_D3.0mm" H 8650 5350 50  0001 C CNN
F 3 "~" H 8650 5350 50  0001 C CNN
	1    8650 5350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 60EC2A58
P 8400 5150
F 0 "R1" V 8193 5150 50  0000 C CNN
F 1 "330" V 8284 5150 50  0000 C CNN
F 2 "modFiles:Resistor_small" V 8330 5150 50  0001 C CNN
F 3 "~" H 8400 5150 50  0001 C CNN
	1    8400 5150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 60EC2BDA
P 8650 5600
F 0 "#PWR0102" H 8650 5350 50  0001 C CNN
F 1 "GND" H 8655 5427 50  0000 C CNN
F 2 "" H 8650 5600 50  0001 C CNN
F 3 "" H 8650 5600 50  0001 C CNN
	1    8650 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 5350 8200 5150
Wire Wire Line
	8200 5150 8250 5150
Wire Wire Line
	8550 5150 8650 5150
Wire Wire Line
	8650 5150 8650 5200
Wire Wire Line
	8650 5500 8650 5600
$EndSCHEMATC
