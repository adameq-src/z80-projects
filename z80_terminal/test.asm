;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Sat Mar 28 22:16:58 2015
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
	.globl _charToHexStr
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
;src\test.c:9: int main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
	push	af
;src\test.c:15: LCD_Init();
	call	_LCD_Init
;src\test.c:16: SIO_Init();
	call	_SIO_Init
;src\test.c:19: PA_CONTROL = 0x0F;
	ld	a,#0x0F
	out	(_PA_CONTROL),a
;src\test.c:21: while(1) {
00104$:
;src\test.c:22: LCD_ClearScreen();
	call	_LCD_ClearScreen
;src\test.c:23: LCD_DispString("mu he he            ", 20);
	ld	hl,#___str_0
	ld	bc,#0x0014
	push	bc
	push	hl
	call	_LCD_DispString
	pop	af
	pop	af
;src\test.c:25: SIO_SendString("Z80 Alive...\r\n", 14);
	ld	hl,#___str_1
	ld	bc,#0x000E
	push	bc
	push	hl
	call	_SIO_SendString
	pop	af
	pop	af
;src\test.c:26: x = SIO_A_CMD;
	in	a,(_SIO_A_CMD)
	ld	h,a
;src\test.c:27: LCD_ShowBin(x);		
	push	hl
	push	hl
	inc	sp
	call	_LCD_ShowBin
	inc	sp
	pop	hl
;src\test.c:29: if((x & 0x01) == 1) {
	ld	a,h
	and	a, #0x01
	dec	a
	jr	NZ,00102$
;src\test.c:31: SIO_SendString("Received character: ", 20);	
	ld	hl,#___str_2
	ld	bc,#0x0014
	push	bc
	push	hl
	call	_SIO_SendString
	pop	af
	pop	af
;src\test.c:32: SIO_SendChar(SIO_A_DATA);
	in	a,(_SIO_A_DATA)
	in	a,(_SIO_A_DATA)
	push	af
	inc	sp
	call	_SIO_SendChar
	inc	sp
;src\test.c:34: SIO_SendChar(' ');
	ld	a,#0x20
	push	af
	inc	sp
	call	_SIO_SendChar
	inc	sp
;src\test.c:35: charToHexStr(SIO_A_DATA, buf);
	ld	hl,#0x0000
	add	hl,sp
	ld	e,l
	ld	d,h
	push	de
	push	hl
	in	a,(_SIO_A_DATA)
	in	a,(_SIO_A_DATA)
	push	af
	inc	sp
	call	_charToHexStr
	pop	af
	inc	sp
	pop	de
;src\test.c:36: SIO_SendString(buf, 2);
	ld	hl,#0x0002
	push	hl
	push	de
	call	_SIO_SendString
	pop	af
;src\test.c:38: SIO_SendChar('\r');
	ld	h,#0x0D
	ex	(sp),hl
	inc	sp
	call	_SIO_SendChar
	inc	sp
;src\test.c:39: SIO_SendChar('\n');
	ld	a,#0x0A
	push	af
	inc	sp
	call	_SIO_SendChar
	inc	sp
00102$:
;src\test.c:43: PA = 0x55;
	ld	a,#0x55
	out	(_PA),a
;src\test.c:44: delay_ms(500);
	ld	hl,#0x01F4
	push	hl
	call	_delay_ms
	pop	af
;src\test.c:45: PA = 0xAA;
	ld	a,#0xAA
	out	(_PA),a
;src\test.c:46: delay_ms(500);
	ld	hl,#0x01F4
	push	hl
	call	_delay_ms
	pop	af
	jp	00104$
	pop	af
	ret
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
