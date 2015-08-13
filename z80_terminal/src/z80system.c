#include "z80system.h"

void delay_ms(int time) {
	int i,j;

	for (i = 0; i < time; i++)
	{
		for(j = 0; j < 0x30; j++){};//1ms delay
	}

}

void charToHexStr(unsigned char cc, char *str)
{
	unsigned char c = cc;

    static unsigned char x;
    x=c>>4;
    *str=x+(x>9?('A'-10):'0');
    x=c&0x0f;
    str[1]=x+(x>9?('A'-10):'0');
    str[2]=0;
}

void writeByteToMemory(unsigned int address, unsigned char data)
{
	unsigned char *p = (unsigned char *) (address);	
	*p = data;
}

void writeBufferToMemory(unsigned int startAddress, unsigned char *data, unsigned int byteCount)
{
	unsigned int i;
	unsigned char *p = (unsigned char *) (startAddress);

	for(i = 0; i < byteCount; i++) {
		*(p + i) = data[i];
	}
}

unsigned char readByteFromMemory(unsigned int address)
{
	unsigned char *p = (unsigned char *) (address);

	return *p;
}