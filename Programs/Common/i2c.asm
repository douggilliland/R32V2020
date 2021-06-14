;--------------------------------------------------------------------
; i2c.asm

;
; write_I2C_Data_Address_Reg - Writes r8 to the data register
;

write_I2C_Data_Address_Reg:
	lix		PAR,0x5800	; I2C Address/register
	spl		r8			; Write r8 to the data register
	lix		PAR,0x5801	; Control register
loop_wrDA:				; hang around while busy
	lpl		r8
	andi	r8,r8,0x1	; busy bit is least significant bit
	be1		loop_wrDA
	pull	PC

;
; read_I2C_Data_Reg - Read I2C data into r8
;

read_I2C_Data_Reg:
	lix		PAR,0x5800	; I2C Data Address
	lix		r8,0x54
	spl		r8
	lix		PAR,0x5801	; Control register
loop_rdDA:				; hang around while busy
	lpl		r8
	and		r8,r8,r1	; busy bit is least significant bit
	be1		loop_rdDA
	lix		PAR,0x5800	; I2C Data Address
	lpl		r8
	pull	PC
	
;
; write_I2C_Ctrl_Reg
; Command Register (write):
;	bit 7-2	= Reserved
;	bit 1-0	= 
;		00: IDLE
;		01: START
;		10: nSTART
;		11: STOP
;

write_I2C_Ctrl_Reg:
	lix		PAR,0x5801	; I2C Control register
	spl		r8			; Write control register
	pull	PC

;
; i2c_ack - wait for transfer to complete
; Status Register (read):
;	bit 7-2	= Reserved
;	bit 1 	= ERROR 	(I2C transaction error)
;	bit 0 	= BUSY 	(I2C bus busy)
;

i2c_ack:
	push	PAR
	push	r8
	lix		PAR,0x5801	; Control register
i2c_ack_loop:
	lpl		r8
	andi	r8,r8,0x1	; busy bit is least significant bit
	be1		i2c_ack_loop
	pull	r8
	pull	PAR
	pull	PC
