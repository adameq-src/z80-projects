#ifndef __Z80LCD_H__
#define __Z80LCD_H__

void LCD_ShowBin(char byte);

void LCD_Init(void);
void LCD_SendNibble(char data);
void LCD_DispChar(char data);
void LCD_DispString(char * string, int charCnt);
void LCD_ClearScreen(void);
/* novej pinout
                  ;PB0 - PB3 ... data
                  ;PB4 = (RS) i = 0/d = 1
                  ;PB5 = (CLK) E falling edge
                  ;PB6 = (RW) 0
                  ;PB7 = n/c
*/

#endif /* __Z80LCD_H__ */