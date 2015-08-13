#ifndef __Z80SYSTEM_H__
#define __Z80SYSTEM_H__

__sfr __at 0x00 PA;
__sfr __at 0x01 PA_CONTROL;
__sfr __at 0x02 PB;
__sfr __at 0x03 PB_CONTROL;

__sfr __at 0x40 SIO_A_DATA;
__sfr __at 0x41 SIO_A_CMD;
__sfr __at 0x42 SIO_B_DATA;
__sfr __at 0x43 SIO_B_CMD;

/* LCD control bits */
#define	RS	4
#define	CLK	5
#define	RW	6


#define setb(PX, n)		(PX |= (1 << n))
#define clrb(PX, n)		(PX &= ~(1 << n))


void delay_ms(int time);

#endif /* __Z80SYSTEM_H__ */