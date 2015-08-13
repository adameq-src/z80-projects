#include "z80system.h"
#include "z80lcd.h"
#include "z80sio.h"

unsigned char getUserInputData(void);
unsigned int getUserInputAddress(void);


int main(void)
{
	int i = 0;
	char x = 0;
	char buf[2], recv;

	unsigned char data;
	unsigned int addr;

	LCD_Init();
	SIO_Init();

	/*set output mode 0*/
	PA_CONTROL = 0x0F;

	/* set 8255 all outputs */
	PIO1_8255_CONTROL = 0x80;
	PIO2_8255_CONTROL = 0x80;
	PIO3_8255_CONTROL = 0x80;

	while(1) {
		LCD_ClearScreen();
		LCD_DispString("mu he he            ", 20);

		SIO_SendString("Z80 Alive...\r\n", 14);
		x = SIO_A_CMD;
		LCD_ShowBin(x);		

		if((x & SIO_DATA_READY) == 1) {
		//Received a character
			recv = SIO_A_DATA;
			SIO_SendString("Received character: ", 20);	
			SIO_SendChar(recv);

			SIO_SendChar(' ');
			charToHexStr(recv, buf);
			SIO_SendString(buf, 2);

			SIO_SendChar('\r');
			SIO_SendChar('\n');

			switch(recv) {
				case 'D':
					writeBufferToMemory(0x4064, "JOU", 3);
					SIO_DumpMemory(0x4000, 128);
					break;

				case 'q':
					PIO3_8255_PB = 0xFF;
					PIO2_8255_PB = 0x00;
					break;

				case 'a':
					PIO3_8255_PB = 0x00;
					PIO2_8255_PB = 0xFF;
					break;

				case 'w':
					addr = getUserInputAddress();
					data = getUserInputData();
					writeByteToMemory(addr, data);
					break;

				case 'r':
					addr = getUserInputAddress();
					data = readByteFromMemory(addr);
					SIO_SendChar(data);
					break;

				default:
					SIO_SendString("WTF?\r\n", 6);
					break;
			}

		}


		PA = 0x55;
		//PIO1_8255_PB = 0x55;
		delay_ms(500);
		PA = 0xAA;
		//PIO1_8255_PB = 0xAA;
		delay_ms(500);

		
		if(i%17 == 0) {
			PIO1_8255_PB = 0x08;
		} else if(i%13 == 0) {
			PIO2_8255_PB = 0x08;
		} else if(i%11 == 0) {
			PIO3_8255_PB = 0x08;
		}

		delay_ms(50);

		if(i%23 == 0) {
			PIO1_8255_PB = 0x00;
		} else if(i%29 == 0) {
			PIO2_8255_PB = 0x00;
		} else if(i%31 == 0) {
			PIO3_8255_PB = 0x00;
		}

		i++;

	}

}


unsigned char getUserInputData(void)
{
	unsigned char isCorrect = 0;
	unsigned char data;

	do {
		SIO_SendString("\r\nEnter data:", 13);
		data = SIO_GetChar();
		SIO_SendString("\r\nIs the data \"", 15);
		SIO_SendChar(data);
		SIO_SendString("\" correct? [y/n]", 16);
		isCorrect = SIO_GetChar();
	} while(isCorrect != 'y');

	SIO_SendString("\r\n", 2);

	return data;
}

unsigned int getUserInputAddress(void)
{
	unsigned char isCorrect = 0;
	unsigned char addrl, addrh;
	//unsigned int address;	

	do {
		SIO_SendString("\r\nEnter address [low, high]:", 28);
		addrl = SIO_GetChar();
		addrh = SIO_GetChar();

		SIO_SendString("\r\nIs the address \"", 18);
		SIO_SendChar(addrh);
		SIO_SendChar(addrl);
		SIO_SendString("\" correct? [y/n]", 16);		
		isCorrect = SIO_GetChar();
	} while(isCorrect != 'y');

	SIO_SendString("\r\n", 2);

	return (unsigned int) (((unsigned int) addrh << 8) | addrl);
}