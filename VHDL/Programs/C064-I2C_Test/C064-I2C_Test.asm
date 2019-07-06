prompt:			.string "R32V2020> "
i2c_addr_wr:	.byte 0x40
i2c_addr_rd:	.byte 0x41
i2c_reg_addr:	.byte 0x00
i2c_wr_val:		.byte 0x00

;
; main
; Read UART character and put it to the ANSI VGA Display
;

main:
	bsr		clearScreen
	lix		r8,prompt.lower
	bsr		printString
	bsr		initDir_I2CIO8
loopMain:
	lix		r8,0x05
	bsr		writeI2CAddrOrData
	lix		r8,500
	bsr		delay_mS
	lix		r8,0x0A
	bsr		writeI2CAddrOrData
	lix		r8,500
	bsr		delay_mS
	bra		loopMain
	
loopForever:
	bra		loopForever
	
;
; initDir_I2CIO8 - Set IO Dir
;

initDir_I2CIO8:
	; Write 0x22 to IOCON register (not sequential operations)
	lix		r8,0x01		; START
	bsr		write_I2C_Ctrl_Reg
	lix		r8,0x40
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x05		; IO control register
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x22		; Disable sequential operation
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x03		; STOP
	bsr		write_I2C_Ctrl_Reg
	; wait between writes
	;lix		r8,2		; wait 2 mSec
	;bsr		delay_mS
	; Write 0xf0 to IODIR register - d0-d3 = Outputs
	lix		r8,0x01		; START
	bsr		write_I2C_Ctrl_Reg
	lix		r8,0x40
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x00		; direction control register
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0xF0		; Inputs and outputs
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x03		; STOP
	bsr		write_I2C_Ctrl_Reg
	pull	PC

; writeI2CAddrOrData - Write address to the I2C bus
; Address 0x5800 -> DATA (write/read) or SLAVE ADDRESS (write)  
; Address 0x5801 -> Command/Status Register (write/read)
; r8 is the value to write

writeI2CAddrOrData:
	push	r8
	lix		r8,0xFD		; START
	bsr		write_I2C_Ctrl_Reg
	lix		r8,0x40
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x09		; GPIO register address
	bsr		write_I2C_Data_Address_Reg
	pull	r8
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0xFF		; STOP
	bsr		write_I2C_Ctrl_Reg
	pull	PC
	
;
; write_I2C_Data_Address_Reg
;

write_I2C_Data_Address_Reg:
	lix		PAR,0x5800	; I2C Address/Data register
	spl		r8			; Write control register
	bsr		i2c_ack
	pull	PC

;
; write_I2C_Ctrl_Reg
;

write_I2C_Ctrl_Reg:
	lix		PAR,0x5801	; I2C Control register
	spl		r8			; Write control register
	pull	PC
;
; i2c_ack - wait for transfer to complete
;

i2c_ack:
	lix		PAR,0x5801	; Control register
	lpl		r8
	and		r8,r8,r1	; busy bit is least significant bit
	be1		i2c_ack
	pull	PC
	
; readI2CData - Read I2C data into r8

readI2CData:
	push	PAR
	lix		PAR,0x5800	; I2C Address
	lpl		r8
	pull	PAR
	pull	PC
	
; readI2CStatus - Read I2C status into r8
; Command/Status Register (write/read)
; Command/Status Register (read):
;	bit 7-2	= Reserved
;	bit 1 	= ERROR 	(I2C transaction error)
;	bit 0 	= BUSY 	(I2C bus busy)

readI2CStatus:
	push	PAR
	lix		PAR,0x5801	; I2C Command Status Address
	lpl		r8
	pull	PAR
	pull	PC
	
; writeI2CCommand - write data from r8 to the I2C command register
; Command/Status Register (write):
; 	bit 7-2	= Reserved
;	bit 1-0	= 00: IDLE; 01: START; 10: nSTART; 11: STOP

writeI2CCommand:
	push	PAR
	lix		PAR,0x5801	; I2C Command Status Address
	spl		r8
	pull	PAR
	pull	PC
	
	
readUartStatus:
	bsr		waitGetCharFromUART
putCharToANSIScreenAndUART:
	bsr		putCharToANSIScreen	; put the character to the screen
	bsr		putCharToUART
	bra		readUartStatus



;
; waitGetCharFromUART
; returns character received in r8
; function is blocking until a character is received from the UART
;

waitGetCharFromUART:
	push	PAR
	lix		PAR,0x1800	; UART Status
waitUartRxStat:
	lpl		r8			; Read Status into r8
	and 	r8,r8,ONE
	bez 	waitUartRxStat
	lix 	PAR,0x1801
	lpl		r8
	pull	PAR
	pull	PC

;
; putCharToUART - Put a character to the UART
; passed character in r8 is sent out the UART
;

putCharToUART:
	push	r9
	push	PAR
	push	r10
	lix		r10,0x2
	lix		PAR,0x1800	; UART Status
waitUartTxStat:
	lpl		r9			; Read Status into r9
	and 	r9,r9,r10
	bez 	waitUartTxStat
	lix 	PAR,0x1801
	spl		r8			; echo the character
	pull	r10
	pull	PAR
	pull	r9
	pull	PC
	
;
; printString - Print a screen to the current screen position
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printString:
	push	r8				; save r8
	push	r9				; save r9
	push	DAR
	add		DAR,r8,ZERO		; set the start of the string
nextLong:
	ldl		r8				; get the string
	ens		r8,r8			; swap the endian
	lix		r9,0xff			; mask for null termination check
	and		r9,r9,r8
	bez		donePrStr
	bsr		putCharToANSIScreen	; write out the character
	sr8		r8,r8
	lix		r9,0xff			; mask for null termination check
	and		r9,r9,r8
	bez		donePrStr
	bsr		putCharToANSIScreen	; write out the character
	sr8		r8,r8
	lix		r9,0xff			; mask for null termination check
	and		r9,r9,r8
	bez		donePrStr
	bsr		putCharToANSIScreen	; write out the character
	sr8		r8,r8
	lix		r9,0xff			; mask for null termination check
	and		r9,r9,r8
	bez		donePrStr
	bsr		putCharToANSIScreen	; write out the character
lastOfLong:
	add		DAR,DAR,ONE
	bra		nextLong
donePrStr:
	pull	DAR				; restore DAR
	pull	r9				; restore r9
	pull	r8				; restore r8
	pull	PC				; rts
	
;
; clearScreen - Clear the screen routine
; ANSI Terminal has an escape sequence which clears the screen and homes cursor
;

clearScreen:
	push	r8				; save r8
	lix		r8,0x1b			; ESC
	bsr		putCharToANSIScreen
	lix		r8,0x5b			; [
	bsr		putCharToANSIScreen
	lix		r8,0x32			; 2
	bsr		putCharToANSIScreen
	lix		r8,0x4A			; J
	bsr		putCharToANSIScreen
	pull	r8
	pull	PC				; rts

;
; putCharToANSIScreen - Put a character to the screen
; Character to put to screen is in r8
; Return address (-1) is on the stack - need to increment before return
;

putCharToANSIScreen:
	push	r9
	push	PAR
	push	r10
	lix		r10,0x2		; TxReady bit
	lix		PAR,0x0		; UART Status
waitScreenTxStat:
	lpl		r9			; Read Status into r9
	and 	r9,r9,r10
	bez 	waitScreenTxStat
	lix 	PAR,0x1
	spl		r8			; echo the character
	pull	r10
	pull	PAR
	pull	r9
	pull	PC
	
;
; makeBuzz - Make the buzzer buzz
;

makeBuzz:
	push	r8
	lix		r8,0			; first note is 0
	bsr 	setNote
	bsr		enableBuzzer
	lix		r8,250			; count for 1 Sec
	bsr		delay_mS		; call delay_ms
	bsr		disableBuzzer
	pull	r8
	pull	PC

;
; setNote - Set the note
; pass note in r8
;

setNote:
	push	r8
	push	PAR
	lix		PAR,0x4000
	spl		r8
	pull	PAR
	pull	r8
	pull	PC

;
; enableBuzzer
;

enableBuzzer:
	push	r9
	push	r8
	push	PAR
	lix		r9,0x0010		; Buzzer Enable line
	lix		PAR,0x2800
	lpl		r8
	or		r8,r8,r9
	spl		r8
	pull	PAR
	pull	r8
	pull	r9
	pull	PC

;
; disableBuzzer
;

disableBuzzer:
	push	r9
	push	r8
	push	PAR
	lix		r9,0xffef		; Buzzer Disable line
	lix		PAR,0x2800
	lpl		r8
	and		r8,r8,r9
	spl		r8
	pull	PAR
	pull	r8
	pull	r9
	pull	PC
	
; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Routine uses r9

delay_mS:
	push	r9
	lix		PAR,0x3802		; address of the mSec counter
	lpl		r9				; read the peripheral counter into r9
	add		r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_mS:
	lpl		r9				; check the elapsed time counter
	cmp		r8,r9
	blt		loop_delay_mS
	pull	r9
	pull	PC
