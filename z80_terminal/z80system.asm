;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Wed Jul 29 04:18:14 2015
;--------------------------------------------------------
	.module z80system
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _delay_ms
	.globl _charToHexStr
	.globl _writeByteToMemory
	.globl _writeBufferToMemory
	.globl _readByteFromMemory
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
_charToHexStr_x_1_11:
	.ds 1
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
;src\z80system.c:3: void delay_ms(int time) {
;	---------------------------------
; Function delay_ms
; ---------------------------------
_delay_ms_start::
_delay_ms:
;src\z80system.c:6: for (i = 0; i < time; i++)
	ld	de,#0x0000
00107$:
	ld	hl,#2
	add	hl,sp
	ld	a,e
	sub	a, (hl)
	ld	a,d
	inc	hl
	sbc	a, (hl)
	jp	PO, 00129$
	xor	a, #0x80
00129$:
	ret	P
;src\z80system.c:8: for(j = 0; j < 0x30; j++){};//1ms delay
	ld	bc,#0x0030
00105$:
	dec	bc
	ld	a,b
	or	a,c
	jr	NZ,00105$
;src\z80system.c:6: for (i = 0; i < time; i++)
	inc	de
	jr	00107$
	ret
_delay_ms_end::
;src\z80system.c:13: void charToHexStr(unsigned char cc, char *str)
;	---------------------------------
; Function charToHexStr
; ---------------------------------
_charToHexStr_start::
_charToHexStr:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src\z80system.c:15: unsigned char c = cc;
	ld	d,4 (ix)
;src\z80system.c:18: x=c>>4;
	ld	a,d
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_charToHexStr_x_1_11 + 0),a
;src\z80system.c:19: *str=x+(x>9?('A'-10):'0');
	ld	c,5 (ix)
	ld	b,6 (ix)
	ld	a,#0x09
	ld	iy,#_charToHexStr_x_1_11
	sub	a, 0 (iy)
	jr	NC,00103$
	ld	e,#0x37
	jr	00104$
00103$:
	ld	e,#0x30
00104$:
	ld	a,(#_charToHexStr_x_1_11 + 0)
	add	a, e
	ld	(bc),a
;src\z80system.c:20: x=c&0x0f;
	ld	a,d
	and	a, #0x0F
	ld	(#_charToHexStr_x_1_11 + 0),a
;src\z80system.c:21: str[1]=x+(x>9?('A'-10):'0');
	ld	e, c
	ld	d, b
	inc	de
	ld	a,#0x09
	ld	iy,#_charToHexStr_x_1_11
	sub	a, 0 (iy)
	jr	NC,00105$
	ld	-1 (ix),#0x37
	jr	00106$
00105$:
	ld	-1 (ix),#0x30
00106$:
	ld	a,(#_charToHexStr_x_1_11 + 0)
	add	a, -1 (ix)
	ld	(de),a
;src\z80system.c:22: str[2]=0;
	ld	l,c
	ld	h,b
	inc	hl
	inc	hl
	ld	(hl),#0x00
	inc	sp
	pop	ix
	ret
_charToHexStr_end::
;src\z80system.c:25: void writeByteToMemory(unsigned int address, unsigned char data)
;	---------------------------------
; Function writeByteToMemory
; ---------------------------------
_writeByteToMemory_start::
_writeByteToMemory:
;src\z80system.c:27: unsigned char *p = (unsigned char *) (address);	
	pop	bc
	pop	hl
	push	hl
	push	bc
;src\z80system.c:28: *p = data;
	ld	iy,#4
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	ret
_writeByteToMemory_end::
;src\z80system.c:31: void writeBufferToMemory(unsigned int startAddress, unsigned char *data, unsigned int byteCount)
;	---------------------------------
; Function writeBufferToMemory
; ---------------------------------
_writeBufferToMemory_start::
_writeBufferToMemory:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src\z80system.c:34: unsigned char *p = (unsigned char *) (startAddress);
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	a,5 (ix)
	ld	-1 (ix),a
;src\z80system.c:36: for(i = 0; i < byteCount; i++) {
	ld	de,#0x0000
00103$:
	ld	a,e
	sub	a, 8 (ix)
	ld	a,d
	sbc	a, 9 (ix)
	jr	NC,00105$
;src\z80system.c:37: *(p + i) = data[i];
	ld	a,-2 (ix)
	add	a, e
	ld	c,a
	ld	a,-1 (ix)
	adc	a, d
	ld	b,a
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src\z80system.c:36: for(i = 0; i < byteCount; i++) {
	inc	de
	jr	00103$
00105$:
	ld	sp, ix
	pop	ix
	ret
_writeBufferToMemory_end::
;src\z80system.c:41: unsigned char readByteFromMemory(unsigned int address)
;	---------------------------------
; Function readByteFromMemory
; ---------------------------------
_readByteFromMemory_start::
_readByteFromMemory:
;src\z80system.c:43: unsigned char *p = (unsigned char *) (address);
	pop	bc
	pop	hl
	push	hl
	push	bc
;src\z80system.c:45: return *p;
	ld	l,(hl)
	ret
_readByteFromMemory_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
