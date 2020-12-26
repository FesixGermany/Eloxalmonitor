/*
 * Project Eloxalmonitor
 *
 * Author: Fesix and Sven Mueller (RIP 2018 my dear friend)
 * Uses: ATmega 328P (Arduino Nano clone for convenience of board ready to use)
 *
 * Important: Only works if libprintf_flt is added to linker libraries and use vprintf library is set
 * 
 * Measures temperatures with DS18B20 onewire sensors, voltage and current for anodizing bath
 * Data gets sent over UART for further use (GUI, store as CSV, etc.)
 */ 

#include "main.h"

// Function for simultaneous conversion of temperature values, this takes some time
void MultiConvertT(uint8_t OWP1, uint8_t OWP2)
{
	uint8_t error = MultiOneWireReset(OWP1, OWP2);
	// Start conversion and wait until both lines read high (conversion finished)
	if((error & ((1 << OWP1) | (1 << OWP2))) == 0)
	{
		MultiOneWireSendCommand(CommandSkipROM, OWP1, OWP2);
		MultiOneWireSendCommand(CommandConvert, OWP1, OWP2);
		while((MultiReadBit(OWP1, OWP2) & ((1 << OWP1) | (1 << OWP2))) == 0)
			_delay_us(1);
	}
	// Start conversion only on line where reset was okay and wait until line reads high (conversion finished)
	else if (((error & (1 << OWP1)) == 0) && ((error & (1 << OWP2)) == 1))
	{
		OneWireSendCommand(CommandSkipROM, OWP1);
		OneWireSendCommand(CommandConvert, OWP1);
		while(!OneWireReadCommand(OWP1))
			_delay_us(1);
	}
	// Start conversion only on line where reset was okay and wait until line reads high (conversion finished)
	else if (((error & (1 << OWP2)) == 0) && ((error & (1 << OWP1)) == 1))
	{
		OneWireSendCommand(CommandSkipROM, OWP2);
		OneWireSendCommand(CommandConvert, OWP2);
		while(!OneWireReadCommand(OWP2))
			_delay_us(1);
	}
}

// Function for reading temperature data from one sensor and converting it into float
float ReadConvertDS18B20(uint8_t onewirepin)
{
	float value = 0.0;
	
	// Read scratchpad and format value
	if(!OneWireReset(onewirepin))									// If reset ok
	{
		uint16_t temp = 0;
		OneWireSendCommand(CommandSkipROM, onewirepin);				// Send SkipROM command
		OneWireSendCommand(CommandReadScratchPad, onewirepin);		// Send ReadScratchPad command
		temp = OneWireReadCommand(onewirepin);						// Read first byte
		temp |= OneWireReadCommand(onewirepin) << 8;				// Read second byte and put in from of first
		if((temp & 0xF800) > 0)										// If value is negative
		{
			temp = (~temp) + 1.0;									// Generate two's complement
			value = temp >> 4;										// Shift four bits to get rid of decimal places
			value += ((temp & 0x000F) * (1.0 / 16.0));				// Use bitmask for decimal places only, multiply by (1/16), because 8 Bit resolution
			value = value * -1.0;									// Multiplay by -1
		}
		else{
			value = temp >> 4;										// Shift four bits to get rid of decimal places
			value += ((temp & 0x000F) * (1.0 / 16.0));				// Use bitmask for decimal places only, multiply by (1/16), because 8 Bit resolution
		}
	}
	else
		value = 999.9;												// Return some crazy value as error message if reset was not okay
	
	return value;
}

uint8_t timer = 0;

int main(void)
{
	// Config Timer1 for 1s
	TCCR1B |= (1 << WGM12);						// CTC mode
	TCCR1B |= (1 << CS12) | (1 << CS10);		// Prescaler 1024
	OCR1A = 15624;								// Top value
	TIMSK1 |= (1 << OCIE1A);					// Timer1 A interrupt enable
	
	ADC_init();
	uinit();
	sei();
	
	// Main program loop
	while(1)
    {
		_delay_us(1);
		if(timer == 1)
		{
			char voltage[5];
			char current[5];
		
			// Read ADCs and do some calculation for voltage divider, compensate voltage drop across shunt
			float currentf = ADC_Read(0) * (0.001074 / ShuntValue) * CurrentCorrFactor;
			float voltagef = (((ADC_Read(1) * 0.001074) + (ADC_Read(1) * 0.001074 * VoltageDivider)) * VoltageCorrFactor) - (currentf * ShuntValue);

			char temp1[6];
			char temp2[6];
		
			// Start simultaneous conversion  of temperature, this takes some time
			MultiConvertT(OneWirePin1, OneWirePin2);
			// Read from sensors and convert into float
			float temp1f = ReadConvertDS18B20(OneWirePin1);
			float temp2f = ReadConvertDS18B20(OneWirePin2);
		
			// Convert float values for x amount of decimal places
			// Only works if libprintf_flt is added to linker libraries and use vprintf library is set
			sprintf(temp1, "%.1f", temp1f);	
			sprintf(temp2, "%.1f", temp2f);
			sprintf(current, "%.2f", currentf);
			sprintf(voltage, "%.1f", voltagef);
		
			// Send values over UART separated by semicolon
			uputs(temp1);
			uputs(";");
			uputs(temp2);
			uputs(";");
			uputs(voltage);
			uputs(";");
			uputsnl(current);
		
			timer = 0;
		}
    }
	return 1;
}

ISR (TIMER1_COMPA_vect)
{
	timer = 1;
}