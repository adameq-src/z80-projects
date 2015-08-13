#ifndef __Z80SIO_H__
#define __Z80SIO_H__

#define 	SIO_PTR_R0	0x00
#define 	SIO_PTR_R1	0x01
#define 	SIO_PTR_R2	0x02
#define 	SIO_PTR_R3	0x03
#define 	SIO_PTR_R4	0x04
#define 	SIO_PTR_R5	0x05
#define 	SIO_PTR_R6	0x06
#define 	SIO_PTR_R7	0x07


#define 	SIO_CMD_NULL				0x00
#define 	SIO_CMD_ABORT				0x08
#define 	SIO_CMD_RESET_INTERRUPTS	0x10
#define 	SIO_CMD_CHANNEL_RESET		0x18
#define 	SIO_CMD_ENABLE_INT_NEXT_Ax	0x20
#define 	SIO_CMD_RESET_PENDING_INT	0x28
#define 	SIO_CMD_RESET_ERROR			0x30
#define 	SIO_CMD_RETURN_FROM_INT		0x38

#define 	SIO_CODE_NULL				0x00
#define 	SIO_CODE_RESET_CRC_CH		0x40
#define 	SIO_CODE_RESET_CRC_G		0x80
#define 	SIO_CODE_RESET_TX_UNDERRUN	0xC0


void SIO_Init(void);
void SIO_SendChar(char ch);
void SIO_SendString(char * string, int charCnt);
/*

*/
#endif /* __Z80SIO_H__ */
