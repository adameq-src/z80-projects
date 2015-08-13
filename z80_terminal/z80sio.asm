;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Wed Jul 29 04:18:15 2015
;--------------------------------------------------------
	.module z80sio
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SIO_Init
	.globl _SIO_SendChar
	.globl _SIO_SendString
	.globl _SIO_GetChar
	.globl _SIO_DumpMemory
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
_PIO1_8255_PA	=	0x0060
_PIO1_8255_PB	=	0x0061
_PIO1_8255_PC	=	0x0062
_PIO1_8255_CONTROL	=	0x0063
_PIO2_8255_PA	=	0x0080
_PIO2_8255_PB	=	0x0081
_PIO2_8255_PC	=	0x0082
_PIO2_8255_CONTROL	=	0x0083
_PIO3_8255_PA	=	0x00a0
_PIO3_8255_PB	=	0x00a1
_PIO3_8255_PC	=	0x00a2
_PIO3_8255_CONTROL	=	0x00a3
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
;src\z80sio.c:4: void SIO_Init(void)
;	---------------------------------
; Function SIO_Init
; ---------------------------------
_SIO_Init_start::
_SIO_Init:
;src\z80sio.c:8: SIO_A_CMD = 0x30;
	ld	a,#0x30
	out	(_SIO_A_CMD),a
;src\z80sio.c:11: SIO_A_CMD = 0x18;
	ld	a,#0x18
	out	(_SIO_A_CMD),a
;src\z80sio.c:16: SIO_A_CMD = 0x04;
	ld	a,#0x04
	out	(_SIO_A_CMD),a
;src\z80sio.c:19: SIO_A_CMD = 0x44;
	ld	a,#0x44
	out	(_SIO_A_CMD),a
;src\z80sio.c:24: SIO_A_CMD = 0x05;
	ld	a,#0x05
	out	(_SIO_A_CMD),a
;src\z80sio.c:27: SIO_A_CMD = 0xE8;
	ld	a,#0xE8
	out	(_SIO_A_CMD),a
;src\z80sio.c:32: SIO_A_CMD = 0x01;
	ld	a,#0x01
	out	(_SIO_A_CMD),a
;src\z80sio.c:35: SIO_A_CMD = 0x00;//0x04;
	ld	a,#0x00
	out	(_SIO_A_CMD),a
;src\z80sio.c:39: SIO_A_CMD = 0x02;
	ld	a,#0x02
	out	(_SIO_A_CMD),a
;src\z80sio.c:42: SIO_A_CMD = 0x00;
	ld	a,#0x00
	out	(_SIO_A_CMD),a
;src\z80sio.c:47: SIO_A_CMD = 0x03;	
	ld	a,#0x03
	out	(_SIO_A_CMD),a
;src\z80sio.c:50: SIO_A_CMD = 0xC1;
	ld	a,#0xC1
	out	(_SIO_A_CMD),a
	ret
_SIO_Init_end::
;src\z80sio.c:54: void SIO_SendChar(char ch)
;	---------------------------------
; Function SIO_SendChar
; ---------------------------------
_SIO_SendChar_start::
_SIO_SendChar:
;src\z80sio.c:56: char status = 0;
	ld	d,#0x00
;src\z80sio.c:58: SIO_A_DATA = ch;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	out	(_SIO_A_DATA),a
;src\z80sio.c:60: while((status & 0x01) == 0)
00101$:
	ld	a,d
	rrca
	ret	C
;src\z80sio.c:62: SIO_A_CMD = 0x01; //select RR1
	ld	a,#0x01
	out	(_SIO_A_CMD),a
;src\z80sio.c:63: status = SIO_A_CMD;
	in	a,(_SIO_A_CMD)
	ld	d,a
	jr	00101$
	ret
_SIO_SendChar_end::
;src\z80sio.c:68: void SIO_SendString(char * string, int charCnt)
;	---------------------------------
; Function SIO_SendString
; ---------------------------------
_SIO_SendString_start::
_SIO_SendString:
;src\z80sio.c:72: for (i = 0; i < charCnt; i++)
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
;src\z80sio.c:74: SIO_SendChar(string[i]);
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
;src\z80sio.c:72: for (i = 0; i < charCnt; i++)
	inc	de
	jr	00103$
	ret
_SIO_SendString_end::
;src\z80sio.c:79: unsigned char SIO_GetChar(void)
;	---------------------------------
; Function SIO_GetChar
; ---------------------------------
_SIO_GetChar_start::
_SIO_GetChar:
;src\z80sio.c:81: char status = 0;
	ld	a,#0x00
;src\z80sio.c:83: while((status & 0x01) == 0)
00101$:
	rrca
	jr	C,00103$
;src\z80sio.c:85: SIO_A_CMD = 0x00; //select RR0
	ld	a,#0x00
	out	(_SIO_A_CMD),a
;src\z80sio.c:86: status = SIO_A_CMD;
	in	a,(_SIO_A_CMD)
	jr	00101$
00103$:
;src\z80sio.c:89: status = SIO_A_DATA;
	in	a,(_SIO_A_DATA)
;src\z80sio.c:91: return status;
	ld	l,a
	ret
_SIO_GetChar_end::
;src\z80sio.c:94: void SIO_DumpMemory(unsigned int startAddress, unsigned int byteCount)
;	---------------------------------
; Function SIO_DumpMemory
; ---------------------------------
_SIO_DumpMemory_start::
_SIO_DumpMemory:
	push	ix
	ld	ix,#0
	add	ix,sp
;src\z80sio.c:104: unsigned char *mem = (unsigned char *) (startAddress);
	ld	e,4 (ix)
	ld	d,5 (ix)
;src\z80sio.c:106: for(i = 0; i < byteCount; i++) {
	ld	bc,#0x0000
00106$:
	ld	h,c
	ld	l,b
	ld	a,h
	sub	a, 6 (ix)
	ld	a,l
	sbc	a, 7 (ix)
	jr	NC,00104$
;src\z80sio.c:107: if(((i % 8) == 0) && (i > 1)) {
	push	bc
	push	de
	ld	hl,#0x0008
	push	hl
	push	bc
	call	__modsint_rrx_s
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a,h
	or	a,l
	jr	NZ,00102$
	ld	a,#0x01
	cp	a, c
	ld	a,#0x00
	sbc	a, b
	jp	PO, 00127$
	xor	a, #0x80
00127$:
	jp	P,00102$
;src\z80sio.c:108: SIO_SendString("\r\n", 2);
	push	bc
	push	de
	ld	hl,#0x0002
	push	hl
	ld	hl,#___str_0
	push	hl
	call	_SIO_SendString
	pop	af
	pop	af
	pop	de
	pop	bc
00102$:
;src\z80sio.c:113: SIO_SendChar(*(mem + i));
	ld	l, e
	ld	h, d
	add	hl,bc
	ld	a,(hl)
	push	bc
	push	de
	push	af
	inc	sp
	call	_SIO_SendChar
	inc	sp
	ld	a,#0x20
	push	af
	inc	sp
	call	_SIO_SendChar
	inc	sp
	pop	de
	pop	bc
;src\z80sio.c:106: for(i = 0; i < byteCount; i++) {
	inc	bc
	jr	00106$
00104$:
;src\z80sio.c:117: SIO_SendString("\r\n", 2);
	ld	hl,#___str_0
	ld	bc,#0x0002
	push	bc
	push	hl
	call	_SIO_SendString
	pop	af
	pop	af
	pop	ix
	ret
_SIO_DumpMemory_end::
___str_0:
	.db 0x0D
	.db 0x0A
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
