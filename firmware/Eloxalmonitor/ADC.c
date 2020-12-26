#include "main.h"

void ADC_init(void)
{
	uint16_t result;
	
	ADMUX |= (1 << REFS1) | (1 << REFS0);					// 1.1V internal reference
	
	ADCSRA = (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);	// 128 ADC clock prescaler
	ADCSRA |= (1 << ADEN);									// ADC enable
	
	//Dummy-Readout
	ADCSRA |= (1 << ADSC);									// ADC single conversion
	while (ADCSRA & (1 << ADSC)) {}							// Wait until conversion is finished
	
	result = ADCW;											// Read register of result and do nothing with it
}
 
uint16_t ADC_Read(uint8_t channel)
{
	ADMUX = (ADMUX & ~(0x1F)) | (channel & 0x1F);			// Select ADC channel without interfering with other bits in register
	ADCSRA |= (1 << ADSC);									// ADC single conversion
	while (ADCSRA & (1 << ADSC)) {}							// Wait until conversion is finished
	
	return ADCW;											// Return value
}