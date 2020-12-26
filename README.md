# Eloxalmonitor  

This project started some years back when I started anodizing some aluminium at home.  
The temperature of the bath is very critical, when it gets too high the developed oxide pores start to destroy themselfes.  
That's why I wanted to read at least the temperature, voltage and current would be nice to know too.  

My friend Sven Mueller (who sadly passed away in 2018 just shy of 24 years old) wrote parts of the code, mainly the functions for onewire communication and decoding of the temperature back in 2017.  
I forgot about the project but now got into it again and finished it as good as I could by myself.  


## Circuit  

The brain is an Arduino Nano clone, convenient to use for serial communication with UART to USB converter on board.  
The main PCB plugs directly into my lab power supply, voltage gets read via voltage divider up to 30V DC, current is read via a 0R1 shunt resistor.  
Temperature of two basins can be read with two DS18B20 sensors who can be bought with cable attached and stainless steel cap.  


## Firmware 

The firmware for the ATmega 328P controller on the Nano is written in ATMEL Studio, not in Arduino IDE, therefore the controller was programmed with the .hex file which was compiled from ATMEL Studio via a AVR ISP programmer.
As far as I know it is possible to send the compiled .hex to an Arduino over USB with the bootloader installed and the program avrdude but didn't try that.  
**Important to note:** If compiling code yourself it is neccessary to add **libprintf_flt** to linker libraries and **use vprintf** library is set!


## Python GUI  

Script draws four graphs in realtime and stores them in a CSV file.  

Tested with/dependencies:  
python 2.7  
pyserial 3.5  
matplotlib 2.2.5  
numpy 1.16.0  

This is the first script I wrote in python, took some time to figure out how, I'm sure there are better ways but it works for me.  
