#include "z80system.h"
#include "z80sio.h"

void SIO_Init(void)
{
//------------------- WR0 ----------------------------------
	/* ;write into WR0: error reset, select WR0 */
	SIO_A_CMD = 0x30;

	/* ;write into WR0: channel reset */
	SIO_A_CMD = 0x18;

//------------------- WR4 ----------------------------------

	/* ;write into WR0: select WR4 */
	SIO_A_CMD = 0x04;

	/* ;44h write into WR4: clkx16,1 stop bit, no parity */
	SIO_A_CMD = 0x44;


//------------------- WR5 ----------------------------------
	/* ;write into WR0: select WR5 */
	SIO_A_CMD = 0x05;

	/* ;DTR active, TX 8bit, BREAK off, TX on, RTS inactive */
	SIO_A_CMD = 0xE8;


//------------------- WR1 ----------------------------------
	/* ;write into WR0: select WR1 */
	SIO_A_CMD = 0x01;

	/* ;no interrupt in CH B, special RX condition affects vect */
	SIO_A_CMD = 0x00;//0x04;

//------------------- WR2 ----------------------------------
	/* ;write into WR0: select WR2 */
	SIO_A_CMD = 0x02;

	/* ;write into WR2: cmd line int vect (see int vec table) bits D3,D2,D1 are changed according to RX condition */
	SIO_A_CMD = 0x00;


//------------------- WR3 ----------------------------------
	/* ;write into WR0: select WR3 */
	SIO_A_CMD = 0x03;	

	/* ;RX 8bit, auto enable off, RX on */
	SIO_A_CMD = 0xC1;
}


void SIO_SendChar(char ch)
{
	char status = 0;

	SIO_A_DATA = ch;
	
	while((status & 0x01) == 0)
	{
		SIO_A_CMD = 0x01; //select RR1
		status = SIO_A_CMD;
	}
}


void SIO_SendString(char * string, int charCnt)
{
	int i;

	for (i = 0; i < charCnt; i++)
 	{	
		SIO_SendChar(string[i]);
	}
}


unsigned char SIO_GetChar(void)
{
	char status = 0;

	while((status & 0x01) == 0)
	{
		SIO_A_CMD = 0x00; //select RR0
		status = SIO_A_CMD;
	}

	status = SIO_A_DATA;

	return status;
}

void SIO_DumpMemory(unsigned int startAddress, unsigned int byteCount)
{
	int i;
	//char buf[2];

/*

- vytvorit programmer s RealTermem
- udelat FW fo FLASH, kterej bude umet nahravat veci do RAM a skakat do nich
*/
	unsigned char *mem = (unsigned char *) (startAddress);
	
	for(i = 0; i < byteCount; i++) {
		if(((i % 8) == 0) && (i > 1)) {
			SIO_SendString("\r\n", 2);
		}

		//charToHexStr((unsigned char) (*(mem + i)), buf);
		//SIO_SendString(buf, 2);
		SIO_SendChar(*(mem + i));
		SIO_SendChar(' ');
	}

	SIO_SendString("\r\n", 2);
}

/*
void SIO_WriteMemory(unsigned int startAddress, unsigned char *data, unsigned int byteCount)
{
	unsigned int i;
	unsigned char *p = (unsigned char *) (startAddress);

	for(i = 0; i < byteCount; i++) {
		*(p + i) = data[i];
	}
}

void SIO_ReadMemory(unsigned int startAddress, unsigned int byteCount)
{
	unsigned int i;
	unsigned char *p = (unsigned char *) (startAddress);

	for(i = 0; i < byteCount; i++) {
		SIO_SendChar(*(p + i));
	}
}
*/
