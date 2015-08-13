;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Wed Jul 29 04:18:15 2015
;--------------------------------------------------------
	.module z80lcd
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _delay_ms
	.globl _LCD_ShowBin
	.globl _LCD_Init
	.globl _LCD_DispString
	.globl _LCD_DispChar
	.globl _LCD_SendNibble
	.globl _LCD_ClearScreen
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
;src\z80lcd.c:4: void LCD_ShowBin(char byte)
;	---------------------------------
; Function LCD_ShowBin
; ---------------------------------
_LCD_ShowBin_start::
_LCD_ShowBin:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src\z80lcd.c:8: for (i = 0x80; i > 0; i = i >> 1)
	ld	hl,#0x0080
	ex	(sp), hl
00107$:
;src\z80lcd.c:10: if(byte & i) {
	ld	h,4 (ix)
	ld	a,4 (ix)
	rla
	sbc	a, a
	ld	l,a
	ld	a,h
	and	a, -2 (ix)
	ld	h,a
	ld	a,l
	and	a, -1 (ix)
	or	a,h
	jr	Z,00102$
;src\z80lcd.c:11: LCD_DispChar('1');
	ld	a,#0x31
	push	af
	inc	sp
	call	_LCD_DispChar
	inc	sp
	jr	00103$
00102$:
;src\z80lcd.c:13: LCD_DispChar('0');
	ld	a,#0x30
	push	af
	inc	sp
	call	_LCD_DispChar
	inc	sp
00103$:
;src\z80lcd.c:16: if(i == 0x10)
	ld	a,-2 (ix)
	sub	a, #0x10
	jr	NZ,00108$
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00108$
;src\z80lcd.c:17: LCD_DispChar(' ');
	ld	a,#0x20
	push	af
	inc	sp
	call	_LCD_DispChar
	inc	sp
00108$:
;src\z80lcd.c:8: for (i = 0x80; i > 0; i = i >> 1)
	sra	-1 (ix)
	rr	-2 (ix)
	xor	a, a
	cp	a, -2 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00125$
	xor	a, #0x80
00125$:
	jp	M,00107$
	ld	sp, ix
	pop	ix
	ret
_LCD_ShowBin_end::
;src\z80lcd.c:21: void LCD_Init(void)
;	---------------------------------
; Function LCD_Init
; ---------------------------------
_LCD_Init_start::
_LCD_Init:
;src\z80lcd.c:23: PB_CONTROL = 0x0F;
	ld	a,#0x0F
	out	(_PB_CONTROL),a
;src\z80lcd.c:24: PB = 0x00;
	ld	a,#0x00
	out	(_PB),a
;src\z80lcd.c:26: delay_ms(180);
	ld	hl,#0x00B4
	push	hl
	call	_delay_ms
;src\z80lcd.c:29: LCD_SendNibble(0x03);
	ld	h,#0x03
	ex	(sp),hl
	inc	sp
	call	_LCD_SendNibble
	inc	sp
;src\z80lcd.c:30: delay_ms(5);
	ld	hl,#0x0005
	push	hl
	call	_delay_ms
;src\z80lcd.c:31: LCD_SendNibble(0x03);
	ld	h,#0x03
	ex	(sp),hl
	inc	sp
	call	_LCD_SendNibble
	inc	sp
;src\z80lcd.c:32: delay_ms(1);
	ld	hl,#0x0001
	push	hl
	call	_delay_ms
;src\z80lcd.c:33: LCD_SendNibble(0x03);
	ld	h,#0x03
	ex	(sp),hl
	inc	sp
	call	_LCD_SendNibble
	inc	sp
;src\z80lcd.c:34: delay_ms(1);
	ld	hl,#0x0001
	push	hl
	call	_delay_ms
;src\z80lcd.c:35: LCD_SendNibble(0x02);
	ld	h,#0x02
	ex	(sp),hl
	inc	sp
	call	_LCD_SendNibble
	inc	sp
;src\z80lcd.c:36: delay_ms(1);
	ld	hl,#0x0001
	push	hl
	call	_delay_ms
;src\z80lcd.c:38: LCD_SendNibble(0x02);
	ld	h,#0x02
	ex	(sp),hl
	inc	sp
	call	_LCD_SendNibble
	inc	sp
;src\z80lcd.c:39: LCD_SendNibble(0x08);
	ld	a,#0x08
	push	af
	inc	sp
	call	_LCD_SendNibble
	inc	sp
;src\z80lcd.c:41: LCD_SendNibble(0x00);
	xor	a, a
	push	af
	inc	sp
	call	_LCD_SendNibble
	inc	sp
;src\z80lcd.c:42: LCD_SendNibble(0x0C);
	ld	a,#0x0C
	push	af
	inc	sp
	call	_LCD_SendNibble
	inc	sp
;src\z80lcd.c:44: LCD_SendNibble(0x00);
	xor	a, a
	push	af
	inc	sp
	call	_LCD_SendNibble
	inc	sp
;src\z80lcd.c:45: LCD_SendNibble(0x01);
	ld	a,#0x01
	push	af
	inc	sp
	call	_LCD_SendNibble
	inc	sp
;src\z80lcd.c:47: LCD_SendNibble(0x00);
	xor	a, a
	push	af
	inc	sp
	call	_LCD_SendNibble
	inc	sp
;src\z80lcd.c:48: LCD_SendNibble(0x06);
	ld	a,#0x06
	push	af
	inc	sp
	call	_LCD_SendNibble
	inc	sp
	ret
_LCD_Init_end::
;src\z80lcd.c:51: void LCD_DispString(char * string, int charCnt)
;	---------------------------------
; Function LCD_DispString
; ---------------------------------
_LCD_DispString_start::
_LCD_DispString:
;src\z80lcd.c:55: for (i = 0; i < charCnt; i++)
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
;src\z80lcd.c:57: LCD_DispChar(string[i]);
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
	call	_LCD_DispChar
	inc	sp
	pop	de
;src\z80lcd.c:55: for (i = 0; i < charCnt; i++)
	inc	de
	jr	00103$
	ret
_LCD_DispString_end::
;src\z80lcd.c:61: void LCD_DispChar(char data)
;	---------------------------------
; Function LCD_DispChar
; ---------------------------------
_LCD_DispChar_start::
_LCD_DispChar:
;src\z80lcd.c:65: foo = (data >> 4) & 0x0F;
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	sra	a
	sra	a
	sra	a
	sra	a
	and	a, #0x0F
;src\z80lcd.c:66: setb(foo, RS);
	set	4, a
	ld	h,a
;src\z80lcd.c:67: LCD_SendNibble(foo);
	push	hl
	inc	sp
	call	_LCD_SendNibble
	inc	sp
;src\z80lcd.c:69: foo = data & 0xFF;
	ld	iy,#2
	add	iy,sp
;src\z80lcd.c:70: setb(foo, RS);
	ld	a, 0 (iy)
	set	4, a
	ld	h,a
;src\z80lcd.c:71: LCD_SendNibble(foo);
	push	hl
	inc	sp
	call	_LCD_SendNibble
	inc	sp
	ret
_LCD_DispChar_end::
;src\z80lcd.c:74: void LCD_SendNibble(char data)
;	---------------------------------
; Function LCD_SendNibble
; ---------------------------------
_LCD_SendNibble_start::
_LCD_SendNibble:
	push	ix
	ld	ix,#0
	add	ix,sp
;src\z80lcd.c:76: data &= 0x1F;
	ld	a,4 (ix)
	and	a, #0x1F
;src\z80lcd.c:78: setb(data, CLK);
	ld	4 (ix), a
	set	5, a
;src\z80lcd.c:79: PB = data;
	ld	4 (ix), a
	out	(_PB),a
;src\z80lcd.c:80: delay_ms(1);
	ld	hl,#0x0001
	push	hl
	call	_delay_ms
	pop	af
;src\z80lcd.c:82: clrb(data, CLK);
;src\z80lcd.c:83: PB = data;
	res	5, 4 (ix)
	ld	a, 4 (ix)
	out	(_PB),a
;src\z80lcd.c:84: delay_ms(1);
	ld	hl,#0x0001
	push	hl
	call	_delay_ms
	pop	af
	pop	ix
	ret
_LCD_SendNibble_end::
;src\z80lcd.c:88: void LCD_ClearScreen(void)
;	---------------------------------
; Function LCD_ClearScreen
; ---------------------------------
_LCD_ClearScreen_start::
_LCD_ClearScreen:
;src\z80lcd.c:90: LCD_SendNibble(0x00);
	xor	a, a
	push	af
	inc	sp
	call	_LCD_SendNibble
	inc	sp
;src\z80lcd.c:91: LCD_SendNibble(0x01);
	ld	a,#0x01
	push	af
	inc	sp
	call	_LCD_SendNibble
	inc	sp
	ret
_LCD_ClearScreen_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
