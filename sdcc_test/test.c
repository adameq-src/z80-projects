#include "z80system.h"
#include "z80lcd.h"
#include "z80sio.h"





int main(void)
{
	int i = 0;
	char x = 0;

	LCD_Init();
	SIO_Init();

	/*set output mode 0*/
	PA_CONTROL = 0x0F;

	while(1) {
		LCD_ClearScreen();
		LCD_DispString("mu he he            ", 20);

		SIO_SendString("Z80 Alive...\r\n", 14);
		x = SIO_A_CMD;
		LCD_ShowBin(x);		

		if((x & 0x01) == 1) {
		//Received a character
			SIO_SendString("Received character: ", 20);	
			SIO_SendChar(SIO_A_DATA);
			SIO_SendChar('\r');
			SIO_SendChar('\n');
		}


		PA = 0x55;
		delay_ms(500);
		PA = 0xAA;
		delay_ms(500);
	}

}
