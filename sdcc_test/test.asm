;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Sat Mar 28 21:52:29 2015
;--------------------------------------------------------
	.module test
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _SIO_SendString
	.globl _SIO_SendChar
	.globl _SIO_Init
	.globl _LCD_ClearScreen
	.globl _LCD_DispString
	.globl _LCD_Init
	.globl _LCD_ShowBin
	.globl _delay_ms
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_PA	=	0x0000
_PA_CONTROL	=	0x0001
_PB	=	0x0002
_PB_CONTROL	=	0x0003
_SIO_A_DATA	=	0x0040
_SIO_A_CMD	=	0x0041
_SIO_B_DATA	=	0x0042
_SIO_B_CMD	=	0x0043
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;test.c:9: int main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;test.c:14: LCD_Init();
	call	_LCD_Init
;test.c:15: SIO_Init();
	call	_SIO_Init
;test.c:18: PA_CONTROL = 0x0F;
	ld	a,#0x0F
	out	(_PA_CONTROL),a
;test.c:20: while(1) {
00104$:
;test.c:21: LCD_ClearScreen();
	call	_LCD_ClearScreen
;test.c:22: LCD_DispString("mu he he            ", 20);
	ld	hl,#___str_0
	ld	bc,#0x0014
	push	bc
	push	hl
	call	_LCD_DispString
	pop	af
	pop	af
;test.c:24: SIO_SendString("Z80 Alive...\r\n", 14);
	ld	hl,#___str_1
	ld	bc,#0x000E
	push	bc
	push	hl
	call	_SIO_SendString
	pop	af
	pop	af
;test.c:25: x = SIO_A_CMD;
	in	a,(_SIO_A_CMD)
	ld	h,a
;test.c:26: LCD_ShowBin(x);		
	push	hl
	push	hl
	inc	sp
	call	_LCD_ShowBin
	inc	sp
	pop	hl
;test.c:28: if((x & 0x01) == 1) {
	ld	a,h
	and	a, #0x01
	dec	a
	jr	NZ,00102$
;test.c:30: SIO_SendString("Received character: ", 20);	
	ld	hl,#___str_2
	ld	bc,#0x0014
	push	bc
	push	hl
	call	_SIO_SendString
	pop	af
	pop	af
;test.c:31: SIO_SendChar(SIO_A_DATA);
	in	a,(_SIO_A_DATA)
	in	a,(_SIO_A_DATA)
	push	af
	inc	sp
	call	_SIO_SendChar
	inc	sp
;test.c:32: SIO_SendChar('\r');
	ld	a,#0x0D
	push	af
	inc	sp
	call	_SIO_SendChar
	inc	sp
;test.c:33: SIO_SendChar('\n');
	ld	a,#0x0A
	push	af
	inc	sp
	call	_SIO_SendChar
	inc	sp
00102$:
;test.c:37: PA = 0x55;
	ld	a,#0x55
	out	(_PA),a
;test.c:38: delay_ms(500);
	ld	hl,#0x01F4
	push	hl
	call	_delay_ms
	pop	af
;test.c:39: PA = 0xAA;
	ld	a,#0xAA
	out	(_PA),a
;test.c:40: delay_ms(500);
	ld	hl,#0x01F4
	push	hl
	call	_delay_ms
	pop	af
	jr	00104$
_main_end::
___str_0:
	.ascii "mu he he            "
	.db 0x00
___str_1:
	.ascii "Z80 Alive..."
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_2:
	.ascii "Received character: "
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
