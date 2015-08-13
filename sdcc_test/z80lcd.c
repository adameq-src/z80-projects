#include "z80system.h"
#include "z80lcd.h"

void LCD_ShowBin(char byte)
{
	int i;

	for (i = 0x80; i > 0; i = i >> 1)
	{
		if(byte & i) {
			LCD_DispChar('1');
		} else {
			LCD_DispChar('0');
		}

		if(i == 0x10)
			LCD_DispChar(' ');
	}
}

void LCD_Init(void)
{
	PB_CONTROL = 0x0F;
	PB = 0x00;

	delay_ms(180);

	/* set to 4-bit operation */
	LCD_SendNibble(0x03);
	delay_ms(5);
	LCD_SendNibble(0x03);
	delay_ms(1);
	LCD_SendNibble(0x03);
	delay_ms(1);
	LCD_SendNibble(0x02);
	delay_ms(1);

	LCD_SendNibble(0x02);
	LCD_SendNibble(0x08);

	LCD_SendNibble(0x00);
	LCD_SendNibble(0x0C);

	LCD_SendNibble(0x00);
	LCD_SendNibble(0x01);

	LCD_SendNibble(0x00);
	LCD_SendNibble(0x06);
}

void LCD_DispString(char * string, int charCnt)
{
	int i;

	for (i = 0; i < charCnt; i++)
 	{	
		LCD_DispChar(string[i]);
	}
}

void LCD_DispChar(char data)
{
	int foo;

	foo = (data >> 4) & 0x0F;
	setb(foo, RS);
	LCD_SendNibble(foo);

	foo = data & 0xFF;
	setb(foo, RS);
	LCD_SendNibble(foo);
}

void LCD_SendNibble(char data)
{
	data &= 0x1F;

	setb(data, CLK);
	PB = data;
	delay_ms(1);

	clrb(data, CLK);
	PB = data;
	delay_ms(1);
}


void LCD_ClearScreen(void)
{
	LCD_SendNibble(0x00);
	LCD_SendNibble(0x01);
}
