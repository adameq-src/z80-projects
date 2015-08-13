#ifndef __Z80SYSTEM_H__
#define __Z80SYSTEM_H__
/*
DEVICE    START   END     SIZE  
-------------------------------------
PIO       0x00    0x1F    0x20 (32B)
RTL8019   0x20    0x3F    0x20 (32B)
SIO	      0x40    0x5F    0x20 (32B)
8255      0x60    0x7F    0x20 (32B)
DEV5      0x80    0x9F    0x20 (32B)
DEV6      0xA0    0xBF    0x20 (32B)
DEV7      0xC0    0xDF    0x20 (32B)
DEV8      0xE0    0xFF    0x20 (32B)
*/
__sfr __at 0x00 PA;
__sfr __at 0x01 PA_CONTROL;
__sfr __at 0x02 PB;
__sfr __at 0x03 PB_CONTROL;

__sfr __at 0x40 SIO_A_DATA;
__sfr __at 0x41 SIO_A_CMD;
__sfr __at 0x42 SIO_B_DATA;
__sfr __at 0x43 SIO_B_CMD;

__sfr __at 0x60 PIO1_8255_PA;
__sfr __at 0x61 PIO1_8255_PB;
__sfr __at 0x62 PIO1_8255_PC;
__sfr __at 0x63 PIO1_8255_CONTROL;

__sfr __at 0x80 PIO2_8255_PA;
__sfr __at 0x81 PIO2_8255_PB;
__sfr __at 0x82 PIO2_8255_PC;
__sfr __at 0x83 PIO2_8255_CONTROL;

__sfr __at 0xA0 PIO3_8255_PA;
__sfr __at 0xA1 PIO3_8255_PB;
__sfr __at 0xA2 PIO3_8255_PC;
__sfr __at 0xA3 PIO3_8255_CONTROL;

/* LCD control bits */
#define	RS	4
#define	CLK	5
#define	RW	6


#define setb(PX, n)		(PX |= (1 << n))
#define clrb(PX, n)		(PX &= ~(1 << n))


void delay_ms(int time);
void charToHexStr(unsigned char c, char *str);
void writeByteToMemory(	unsigned int address, unsigned char data);
unsigned char readByteFromMemory(unsigned int address);
void writeBufferToMemory(unsigned int startAddress, unsigned char *data, unsigned int byteCount);

#endif /* __Z80SYSTEM_H__ */