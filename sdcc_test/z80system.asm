;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Sat Mar 28 21:52:28 2015
;--------------------------------------------------------
	.module z80system
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
;z80system.c:3: void delay_ms(int time) {
;	---------------------------------
; Function delay_ms
; ---------------------------------
_delay_ms_start::
_delay_ms:
;z80system.c:6: for (i = 0; i < time; i++)
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
;z80system.c:8: for(j = 0; j < 0x30; j++){};//1ms delay
	ld	bc,#0x0030
00105$:
	dec	bc
	ld	a,b
	or	a,c
	jr	NZ,00105$
;z80system.c:6: for (i = 0; i < time; i++)
	inc	de
	jr	00107$
	ret
_delay_ms_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
