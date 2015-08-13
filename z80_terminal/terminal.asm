;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Wed Jul 29 04:18:16 2015
;--------------------------------------------------------
	.module terminal
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _SIO_DumpMemory
	.globl _SIO_SendString
	.globl _SIO_GetChar
	.globl _SIO_SendChar
	.globl _SIO_Init
	.globl _LCD_ClearScreen
	.globl _LCD_DispString
	.globl _LCD_Init
	.globl _LCD_ShowBin
	.globl _writeBufferToMemory
	.globl _readByteFromMemory
	.globl _writeByteToMemory
	.globl _charToHexStr
	.globl _delay_ms
	.globl _getUserInputData
	.globl _getUserInputAddress
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
;src\terminal.c:9: int main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
	push	ix
	push	af
;src\terminal.c:18: LCD_Init();
	call	_LCD_Init
;src\terminal.c:19: SIO_Init();
	call	_SIO_Init
;src\terminal.c:22: PA_CONTROL = 0x0F;
	ld	a,#0x0F
	out	(_PA_CONTROL),a
;src\terminal.c:25: PIO1_8255_CONTROL = 0x80;
	ld	a,#0x80
	out	(_PIO1_8255_CONTROL),a
;src\terminal.c:26: PIO2_8255_CONTROL = 0x80;
	ld	a,#0x80
	out	(_PIO2_8255_CONTROL),a
;src\terminal.c:27: PIO3_8255_CONTROL = 0x80;
	ld	a,#0x80
	out	(_PIO3_8255_CONTROL),a
;src\terminal.c:29: while(1) {
	ld	bc,#0x0000
00127$:
;src\terminal.c:30: LCD_ClearScreen();
	push	bc
	call	_LCD_ClearScreen
	pop	bc
;src\terminal.c:31: LCD_DispString("mu he he            ", 20);
	ld	hl,#___str_0
	push	bc
	ld	de,#0x0014
	push	de
	push	hl
	call	_LCD_DispString
	pop	af
	pop	af
	pop	bc
;src\terminal.c:33: SIO_SendString("Z80 Alive...\r\n", 14);
	ld	hl,#___str_1
	push	bc
	ld	de,#0x000E
	push	de
	push	hl
	call	_SIO_SendString
	pop	af
	pop	af
	pop	bc
;src\terminal.c:34: x = SIO_A_CMD;
	in	a,(_SIO_A_CMD)
	ld	h,a
;src\terminal.c:35: LCD_ShowBin(x);		
	push	hl
	push	bc
	push	hl
	inc	sp
	call	_LCD_ShowBin
	inc	sp
	pop	bc
	pop	hl
;src\terminal.c:37: if((x & SIO_DATA_READY) == 1) {
	ld	a,h
	and	a, #0x01
	dec	a
	jp	NZ,00109$
;src\terminal.c:39: recv = SIO_A_DATA;
	in	a,(_SIO_A_DATA)
	ld	d,a
;src\terminal.c:40: SIO_SendString("Received character: ", 20);	
	push	bc
	push	de
	ld	hl,#0x0014
	push	hl
	ld	hl,#___str_2
	push	hl
	call	_SIO_SendString
	pop	af
	pop	af
	pop	de
	push	de
	push	de
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
;src\terminal.c:44: charToHexStr(recv, buf);
	ld	hl,#0x0000
	add	hl,sp
	push	hl
	pop	iy
	push	hl
	push	bc
	push	de
	push	iy
	push	de
	inc	sp
	call	_charToHexStr
	pop	af
	inc	sp
	pop	de
	pop	bc
	pop	iy
	push	bc
	push	de
	ld	hl,#0x0002
	push	hl
	push	iy
	call	_SIO_SendString
	pop	af
	ld	h,#0x0D
	ex	(sp),hl
	inc	sp
	call	_SIO_SendChar
	inc	sp
	ld	a,#0x0A
	push	af
	inc	sp
	call	_SIO_SendChar
	inc	sp
	pop	de
	pop	bc
;src\terminal.c:50: switch(recv) {
	ld	a,d
	cp	a,#0x44
	jr	Z,00101$
	cp	a,#0x61
	jr	Z,00103$
	cp	a,#0x71
	jr	Z,00102$
	cp	a,#0x72
	jr	Z,00105$
	sub	a, #0x77
	jr	Z,00104$
	jr	00106$
;src\terminal.c:51: case 'D':
00101$:
;src\terminal.c:52: writeBufferToMemory(0x4064, "JOU", 3);
	ld	hl,#___str_3+0
	push	bc
	ld	de,#0x0003
	push	de
	push	hl
	ld	hl,#0x4064
	push	hl
	call	_writeBufferToMemory
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	ld	hl,#0x0080
	push	hl
	ld	hl,#0x4000
	push	hl
	call	_SIO_DumpMemory
	pop	af
	pop	af
	pop	bc
;src\terminal.c:54: break;
	jr	00109$
;src\terminal.c:56: case 'q':
00102$:
;src\terminal.c:57: PIO3_8255_PB = 0xFF;
	ld	a,#0xFF
	out	(_PIO3_8255_PB),a
;src\terminal.c:58: PIO2_8255_PB = 0x00;
	ld	a,#0x00
	out	(_PIO2_8255_PB),a
;src\terminal.c:59: break;
	jr	00109$
;src\terminal.c:61: case 'a':
00103$:
;src\terminal.c:62: PIO3_8255_PB = 0x00;
	ld	a,#0x00
	out	(_PIO3_8255_PB),a
;src\terminal.c:63: PIO2_8255_PB = 0xFF;
	ld	a,#0xFF
	out	(_PIO2_8255_PB),a
;src\terminal.c:64: break;
	jr	00109$
;src\terminal.c:66: case 'w':
00104$:
;src\terminal.c:67: addr = getUserInputAddress();
	push	bc
	call	_getUserInputAddress
	pop	bc
;src\terminal.c:68: data = getUserInputData();
	push	hl
	push	bc
	call	_getUserInputData
	ld	e,l
	pop	bc
	pop	hl
;src\terminal.c:69: writeByteToMemory(addr, data);
	push	bc
	ld	a,e
	push	af
	inc	sp
	push	hl
	call	_writeByteToMemory
	pop	af
	inc	sp
	pop	bc
;src\terminal.c:70: break;
	jr	00109$
;src\terminal.c:72: case 'r':
00105$:
;src\terminal.c:73: addr = getUserInputAddress();
	push	bc
	call	_getUserInputAddress
	push	hl
	call	_readByteFromMemory
	pop	af
	ld	h,l
	push	hl
	inc	sp
	call	_SIO_SendChar
	inc	sp
	pop	bc
;src\terminal.c:76: break;
	jr	00109$
;src\terminal.c:78: default:
00106$:
;src\terminal.c:79: SIO_SendString("WTF?\r\n", 6);
	ld	hl,#___str_4+0
	push	bc
	ld	de,#0x0006
	push	de
	push	hl
	call	_SIO_SendString
	pop	af
	pop	af
	pop	bc
;src\terminal.c:81: }
00109$:
;src\terminal.c:86: PA = 0x55;
	ld	a,#0x55
	out	(_PA),a
;src\terminal.c:88: delay_ms(500);
	push	bc
	ld	hl,#0x01F4
	push	hl
	call	_delay_ms
	pop	af
	pop	bc
;src\terminal.c:89: PA = 0xAA;
	ld	a,#0xAA
	out	(_PA),a
;src\terminal.c:91: delay_ms(500);
	push	bc
	ld	hl,#0x01F4
	push	hl
	call	_delay_ms
	pop	af
	pop	bc
;src\terminal.c:94: if(i%17 == 0) {
	push	bc
	ld	hl,#0x0011
	push	hl
	push	bc
	call	__modsint_rrx_s
	pop	af
	pop	af
	pop	bc
	ld	a,h
	or	a,l
	jr	NZ,00116$
;src\terminal.c:95: PIO1_8255_PB = 0x08;
	ld	a,#0x08
	out	(_PIO1_8255_PB),a
	jr	00117$
00116$:
;src\terminal.c:96: } else if(i%13 == 0) {
	push	bc
	ld	hl,#0x000D
	push	hl
	push	bc
	call	__modsint_rrx_s
	pop	af
	pop	af
	pop	bc
	ld	a,h
	or	a,l
	jr	NZ,00113$
;src\terminal.c:97: PIO2_8255_PB = 0x08;
	ld	a,#0x08
	out	(_PIO2_8255_PB),a
	jr	00117$
00113$:
;src\terminal.c:98: } else if(i%11 == 0) {
	push	bc
	ld	hl,#0x000B
	push	hl
	push	bc
	call	__modsint_rrx_s
	pop	af
	pop	af
	pop	bc
	ld	a,h
	or	a,l
	jr	NZ,00117$
;src\terminal.c:99: PIO3_8255_PB = 0x08;
	ld	a,#0x08
	out	(_PIO3_8255_PB),a
00117$:
;src\terminal.c:102: delay_ms(50);
	push	bc
	ld	hl,#0x0032
	push	hl
	call	_delay_ms
	pop	af
	pop	bc
;src\terminal.c:104: if(i%23 == 0) {
	push	bc
	ld	hl,#0x0017
	push	hl
	push	bc
	call	__modsint_rrx_s
	pop	af
	pop	af
	pop	bc
	ld	a,h
;src\terminal.c:105: PIO1_8255_PB = 0x00;
	or	a,l
	jr	NZ,00124$
	out	(_PIO1_8255_PB),a
	jr	00125$
00124$:
;src\terminal.c:106: } else if(i%29 == 0) {
	push	bc
	ld	hl,#0x001D
	push	hl
	push	bc
	call	__modsint_rrx_s
	pop	af
	pop	af
	pop	bc
	ld	a,h
;src\terminal.c:107: PIO2_8255_PB = 0x00;
	or	a,l
	jr	NZ,00121$
	out	(_PIO2_8255_PB),a
	jr	00125$
00121$:
;src\terminal.c:108: } else if(i%31 == 0) {
	push	bc
	ld	hl,#0x001F
	push	hl
	push	bc
	call	__modsint_rrx_s
	pop	af
	pop	af
	pop	bc
	ld	a,h
;src\terminal.c:109: PIO3_8255_PB = 0x00;
	or	a,l
	jr	NZ,00125$
	out	(_PIO3_8255_PB),a
00125$:
;src\terminal.c:112: i++;
	inc	bc
	jp	00127$
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
___str_3:
	.ascii "JOU"
	.db 0x00
___str_4:
	.ascii "WTF?"
	.db 0x0D
	.db 0x0A
	.db 0x00
;src\terminal.c:119: unsigned char getUserInputData(void)
;	---------------------------------
; Function getUserInputData
; ---------------------------------
_getUserInputData_start::
_getUserInputData:
;src\terminal.c:124: do {
00101$:
;src\terminal.c:125: SIO_SendString("\r\nEnter data:", 13);
	ld	hl,#___str_5
	ld	bc,#0x000D
	push	bc
	push	hl
	call	_SIO_SendString
	pop	af
	pop	af
;src\terminal.c:126: data = SIO_GetChar();
	call	_SIO_GetChar
;src\terminal.c:127: SIO_SendString("\r\nIs the data \"", 15);
	ld	de,#___str_6
	push	hl
	ld	bc,#0x000F
	push	bc
	push	de
	call	_SIO_SendString
	pop	af
	pop	af
	pop	hl
;src\terminal.c:128: SIO_SendChar(data);
	push	hl
	ld	a,l
	push	af
	inc	sp
	call	_SIO_SendChar
	inc	sp
	pop	hl
;src\terminal.c:129: SIO_SendString("\" correct? [y/n]", 16);
	ld	de,#___str_7
	push	hl
	ld	bc,#0x0010
	push	bc
	push	de
	call	_SIO_SendString
	pop	af
	pop	af
	call	_SIO_GetChar
	ld	a,l
	pop	hl
;src\terminal.c:131: } while(isCorrect != 'y');
	sub	a, #0x79
	jr	NZ,00101$
;src\terminal.c:133: SIO_SendString("\r\n", 2);
	ld	de,#___str_8+0
	push	hl
	ld	bc,#0x0002
	push	bc
	push	de
	call	_SIO_SendString
	pop	af
	pop	af
	pop	hl
;src\terminal.c:135: return data;
	ret
_getUserInputData_end::
___str_5:
	.db 0x0D
	.db 0x0A
	.ascii "Enter data:"
	.db 0x00
___str_6:
	.db 0x0D
	.db 0x0A
	.ascii "Is the data "
	.db 0x22
	.db 0x00
___str_7:
	.db 0x22
	.ascii " correct? [y/n]"
	.db 0x00
___str_8:
	.db 0x0D
	.db 0x0A
	.db 0x00
;src\terminal.c:138: unsigned int getUserInputAddress(void)
;	---------------------------------
; Function getUserInputAddress
; ---------------------------------
_getUserInputAddress_start::
_getUserInputAddress:
;src\terminal.c:144: do {
00101$:
;src\terminal.c:145: SIO_SendString("\r\nEnter address [low, high]:", 28);
	ld	hl,#___str_9
	ld	bc,#0x001C
	push	bc
	push	hl
	call	_SIO_SendString
	pop	af
	pop	af
;src\terminal.c:146: addrl = SIO_GetChar();
	call	_SIO_GetChar
	ld	e,l
;src\terminal.c:147: addrh = SIO_GetChar();
	push	de
	call	_SIO_GetChar
	pop	de
	ld	d,l
;src\terminal.c:149: SIO_SendString("\r\nIs the address \"", 18);
	ld	hl,#___str_10
	push	de
	ld	bc,#0x0012
	push	bc
	push	hl
	call	_SIO_SendString
	pop	af
	pop	af
	pop	de
;src\terminal.c:150: SIO_SendChar(addrh);
	push	de
	push	de
	inc	sp
	call	_SIO_SendChar
	inc	sp
	pop	de
;src\terminal.c:151: SIO_SendChar(addrl);
	push	de
	ld	a,e
	push	af
	inc	sp
	call	_SIO_SendChar
	inc	sp
	pop	de
;src\terminal.c:152: SIO_SendString("\" correct? [y/n]", 16);		
	ld	hl,#___str_11
	push	de
	ld	bc,#0x0010
	push	bc
	push	hl
	call	_SIO_SendString
	pop	af
	pop	af
	call	_SIO_GetChar
	ld	a,l
	pop	de
;src\terminal.c:154: } while(isCorrect != 'y');
	sub	a, #0x79
	jr	NZ,00101$
;src\terminal.c:156: SIO_SendString("\r\n", 2);
	ld	hl,#___str_12
	push	de
	ld	bc,#0x0002
	push	bc
	push	hl
	call	_SIO_SendString
	pop	af
	pop	af
	pop	de
;src\terminal.c:158: return (unsigned int) (((unsigned int) addrh << 8) | addrl);
	ld	h, d
	ld	a, #0x00
	ld	d, #0x00
	or	a, e
	ld	l,a
	ld	a,h
	or	a, d
	ld	h,a
	ret
_getUserInputAddress_end::
___str_9:
	.db 0x0D
	.db 0x0A
	.ascii "Enter address [low, high]:"
	.db 0x00
___str_10:
	.db 0x0D
	.db 0x0A
	.ascii "Is the address "
	.db 0x22
	.db 0x00
___str_11:
	.db 0x22
	.ascii " correct? [y/n]"
	.db 0x00
___str_12:
	.db 0x0D
	.db 0x0A
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
