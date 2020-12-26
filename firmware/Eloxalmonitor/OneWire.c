/*
 * OneWire.c
 *
 * Created: 26.02.2017 01:47:19
 * Author: sven.mueller
 */ 

#include "main.h"

// Reset for single OneWire line
uint8_t OneWireReset(uint8_t onewirepin)
{
	uint8_t err = 1;
	OneWireOut &= ~(1 << onewirepin);					// Set port to low
	OneWireDDR |= (1 << onewirepin);					// Define port as output
	_delay_us(480);										// Minimum 480탎 low
	cli();												// Deactivate interrupts
	OneWireDDR &= ~(1 << onewirepin);					// Define port as input
	_delay_us(70);										// Wait 70us
	err = OneWireIn & (1 << onewirepin);				// Read bus, should be low if okay
	sei();												// Activate interrupts
	_delay_us(420);										// 480탎 reset time high - 70탎 presence detect high
	if((OneWireIn & (1 << onewirepin)) == 0)			// Bus shorted to ground if still low 
		err = 1;
	return err;
}

// Simultaneous reset on more than one pin (scalable to more pins)
uint8_t MultiOneWireReset(uint8_t OWP1, uint8_t OWP2)
{
	uint8_t err = 0xFF;
	OneWireOut &= ~((1 << OWP1) | (1 << OWP2));			// Set ports to low
	OneWireDDR |= ((1 << OWP1) | (1 << OWP2));			// Define ports as outputs
	_delay_us(480);										// Minimum 480탎 low
	cli();												// Deactivate interrupts
	OneWireDDR &= ~((1 << OWP1) | (1 << OWP2));			// Define ports as input
	_delay_us(70);										// Wait 70us
	err = OneWireIn & ((1 << OWP1) | (1 << OWP2));		// Read bus, should be low if okay
	sei();												// Activate interrupts
	_delay_us(420);										// 480탎 reset time high - 70탎 presence detect high
	if((OneWireIn & (1 << OWP1)) == 0)					// Bus shorted to ground if still low
		err |= (OneWireIn & (1 << OWP1));
	if((OneWireIn & (1 << OWP2)) == 0)					// Bus shorted to ground if still low
		err |= (OneWireIn & (1 << OWP2));
	return err;
}

// Sends an 8 bit command 
void OneWireSendCommand(uint8_t command, uint8_t onewirepin)
{
	// Loop to send 8 bits
	for (int i = 1; i <= 8; i++)
	{
		cli();											// Deactivate interrupts
		OneWireDDR |= (1 << onewirepin);				// Port as output -> low is 0
		_delay_us(5);									// Wait 5us
		if ((command & 1))								// If bit is 1
			OneWireDDR &= ~(1 << onewirepin);			// Port as input -> high is 1
		_delay_us(70);									// Wait 70us
		OneWireDDR &= ~(1 << onewirepin);				// Port as input -> high is 1
		sei();											// Activate interrupts
		command >>= 1;									// Shift bits to right for next bit to send
	}
}

// Sends an 8 bit command to more than one pin (scalable to more pins)
void MultiOneWireSendCommand(uint8_t command, uint8_t OWP1, uint8_t OWP2)
{
	// Loop to send 8 bits
	for (int i = 1; i <= 8; i++)
	{
		cli();											// Deactivate interrupts
		OneWireDDR |= ((1 << OWP1) | (1 << OWP2));		// Ports as outputs -> low is 0
		_delay_us(5);									// Wait 5us
		if ((command & 1))								// If bit is 1
		OneWireDDR &= ~((1 << OWP1) | (1 << OWP2));		// Ports as inputs -> high is 1
		_delay_us(70);									// Wait 70us
		OneWireDDR &= ~((1 << OWP1) | (1 << OWP2));		// Ports as inputs -> high is 1
		sei();											// Activate interrupts
		command >>= 1;									// Shift bits to right for next bit to send
	}
}

// Reads 8 bits from single line
uint8_t OneWireReadCommand(uint8_t onewirepin)
{
	uint8_t value = 0xFF;
	bool recived_zero = false;
	
	// Loop to read 8 bits
	for (int i = 1; i <= 8; i++)
	{
		cli();											// Deactivate interrupts
		OneWireDDR |= (1 << onewirepin);				// Port as output -> low to initiate reading one bit
		_delay_us(5);									// Wait 5us
		OneWireDDR &= ~(1 << onewirepin);				// Port as input
		_delay_us(10);									// Wait 10us
		if((OneWireIn & (1<<onewirepin)) == 0)			// If pin still low then read as 0
			recived_zero = true;
		_delay_us(45);									// Wait 45us
		sei();											// Activate interrupts
		value >>= 1;									// Shift bits to right, LSB first
		if(!recived_zero)								// If bit read is 1 set 8th bit as 1
			value |= 0x80;
		else											// If bit read as 0 do nothing
			recived_zero = false;
	}
	return value;
}

// Reads a single bit from multiple pins simultaneously (scalable to more pins)
uint8_t MultiReadBit(uint8_t OWP1, uint8_t OWP2)
{
	uint8_t bits = 0xFF;
	cli();												// Deactivate interrupts
	OneWireDDR |= ((1 << OWP1) | (1 << OWP2));			// Port as output -> low to initiate reading one bit
	_delay_us(5);										// Wait 5us
	OneWireDDR &= ~((1 << OWP1) | (1 << OWP2));			// Port as input
	_delay_us(10);										// Wait 10us 
	if((OneWireIn & (1 << OWP1)) == 0)					// If pin still low then read as 0
		bits &= ~(1 << OWP1);							// Set bit at corresponding place as 0
	if((OneWireIn & (1 << OWP2)) == 0)					// If pin still low then read as 0
		bits &= ~(1 << OWP2);							// Set bit at corresponding place as 0
	_delay_us(45);										// Wait 45us
	sei();												// Activate interrupts
	
	return bits;										// Return received bits
}