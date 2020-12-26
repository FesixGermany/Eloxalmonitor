#ifndef _main_h_
#define _main_h_

#define F_CPU 16000000UL

#define CurrentCorrFactor	1.0		// Correction factor for calculated and measured value
#define ShuntValue			0.1		// Value of current shunt in Ohm
#define VoltageDivider		30.0	// Ratio of resistors of voltage divider
#define VoltageCorrFactor	1.013	// Correction factor to compensate calculated and measured value

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <util/delay.h>

#include "ADC.h"

#define	BAUD		9600
#define bauddivider (unsigned int)(1.0 * F_CPU / BAUD / 16 - 1.0)
#include "uart.h"

#define OneWirePin1	PB0
#define OneWirePin2	PB1
#define OneWireOut	PORTB
#define OneWireIn	PINB
#define OneWireDDR	DDRB
#include "OneWire.h"

#define CommandSkipROM			0xCC
#define CommandReadROM			0x33
#define CommandSearchRom		0xF0
#define CommandConvert			0x44
#define CommandReadScratchPad	0xBE

#endif
