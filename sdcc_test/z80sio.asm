;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Sat Mar 28 21:52:28 2015
;--------------------------------------------------------
	.module z80sio
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SIO_Init
	.globl _SIO_SendChar
	.globl _SIO_SendString
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
;z80sio.c:4: void SIO_Init(void)
;	---------------------------------
; Function SIO_Init
; ---------------------------------
_SIO_Init_start::
_SIO_Init:
;z80sio.c:8: SIO_A_CMD = 0x30;
	ld	a,#0x30
	out	(_SIO_A_CMD),a
;z80sio.c:11: SIO_A_CMD = 0x18;
	ld	a,#0x18
	out	(_SIO_A_CMD),a
;z80sio.c:16: SIO_A_CMD = 0x04;
	ld	a,#0x04
	out	(_SIO_A_CMD),a
;z80sio.c:19: SIO_A_CMD = 0x44;
	ld	a,#0x44
	out	(_SIO_A_CMD),a
;z80sio.c:24: SIO_A_CMD = 0x05;
	ld	a,#0x05
	out	(_SIO_A_CMD),a
;z80sio.c:27: SIO_A_CMD = 0xE8;
	ld	a,#0xE8
	out	(_SIO_A_CMD),a
;z80sio.c:32: SIO_A_CMD = 0x01;
	ld	a,#0x01
	out	(_SIO_A_CMD),a
;z80sio.c:35: SIO_A_CMD = 0x00;//0x04;
	ld	a,#0x00
	out	(_SIO_A_CMD),a
;z80sio.c:39: SIO_A_CMD = 0x02;
	ld	a,#0x02
	out	(_SIO_A_CMD),a
;z80sio.c:42: SIO_A_CMD = 0x00;
	ld	a,#0x00
	out	(_SIO_A_CMD),a
;z80sio.c:47: SIO_A_CMD = 0x03;	
	ld	a,#0x03
	out	(_SIO_A_CMD),a
;z80sio.c:50: SIO_A_CMD = 0xC1;
	ld	a,#0xC1
	out	(_SIO_A_CMD),a
	ret
_SIO_Init_end::
;z80sio.c:54: void SIO_SendChar(char ch)
;	---------------------------------
; Function SIO_SendChar
; ---------------------------------
_SIO_SendChar_start::
_SIO_SendChar:
;z80sio.c:56: char status = 0;
	ld	d,#0x00
;z80sio.c:58: SIO_A_DATA = ch;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	out	(_SIO_A_DATA),a
;z80sio.c:60: while((status & 0x01) == 0)
00101$:
	ld	a,d
	rrca
	ret	C
;z80sio.c:62: SIO_A_CMD = 0x01; //select RR1
	ld	a,#0x01
	out	(_SIO_A_CMD),a
;z80sio.c:63: status = SIO_A_CMD;
	in	a,(_SIO_A_CMD)
	ld	d,a
	jr	00101$
	ret
_SIO_SendChar_end::
;z80sio.c:68: void SIO_SendString(char * string, int charCnt)
;	---------------------------------
; Function SIO_SendString
; ---------------------------------
_SIO_SendString_start::
_SIO_SendString:
;z80sio.c:72: for (i = 0; i < charCnt; i++)
	ld	de,#0x0000
00103$:
	ld	hl,#4
	add	hl,sp
	ld	a,e
	sub	a, (hl)
	ld	a,d
	inc	hl
	sbc	a, (hl)
	jp	PO, 00116$
	xor	a, #0x80
00116$:
	ret	P
;z80sio.c:74: SIO_SendChar(string[i]);
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl,de
	ld	h,(hl)
	push	de
	push	hl
	inc	sp
	call	_SIO_SendChar
	inc	sp
	pop	de
;z80sio.c:72: for (i = 0; i < charCnt; i++)
	inc	de
	jr	00103$
	ret
_SIO_SendString_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
