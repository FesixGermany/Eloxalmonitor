#ifndef ONEWIRE_H_
#define ONEWIRE_H_

uint8_t OneWireReset(uint8_t onewirepin);
uint8_t MultiOneWireReset(uint8_t OWP1, uint8_t OWP2);
void OneWireSendCommand(uint8_t command, uint8_t onewirepin);
void MultiOneWireSendCommand(uint8_t command, uint8_t OWP1, uint8_t OWP2);
uint8_t OneWireReadCommand(uint8_t onewirepin);
uint8_t MultiReadBit(uint8_t OWP1, uint8_t OWP2);

#endif