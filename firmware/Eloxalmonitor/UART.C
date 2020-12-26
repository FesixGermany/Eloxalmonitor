#include "main.h"


void uinit( void )
{
  UBRR0L = bauddivider;						// Set baud rate
  UBRR0H = bauddivider >> 8;
  UCSR0A = 0;								// No U2X or MPCM
  UCSR0C = (1 << UCSZ01) | (1 << UCSZ00);	// 8N1
  UCSR0B = (1 << TXEN0);					// Enable TX
}


void uputchar( char c )
{
  while( (UCSR0A & 1<<UDRE0) == 0 );
  UDR0 = c;
}


void uputs( char *s )
{
  while( *s )
    uputchar( *s++ );
}


void uputsnl( char *s )
{
  uputs( s );
  // CRLF
  uputchar( 0x0D );
  uputchar( 0x0A );
}
