#include "z80system.h"

void delay_ms(int time) {
	int i,j;

	for (i = 0; i < time; i++)
	{
		for(j = 0; j < 0x30; j++){};//1ms delay
	}

}