; I2C EEPROM Read/Write Test
; The A4-CE6 and A4-CE10 cards have an on-board 4Kbit EEPROM
; This EEPROM is connnected via I2C bus connections
; First byte is the Device Address
; The Device Address control word is 0x50 and 0x52 for writes
;	d7..d4 = 0xa (AT24Cxx part address bits - 0x50 shifted left by 1)
;	d3..d2 = 0x0 - hard to the EEPROM address pins to be 0's
;	d1 = Page (upper address bit of memory location)
;	d0 = Read/Write control (R=1,W=0)
; Second byte is the Word Address (8-bits)
; Next bytes(s) are different for read/writes
; For writes, the third byte is the data to write to the location
; For reads, the first 2 bytes establish the address and 
; the third byte does a new start sequence (previous did not end with stop)
; and then does a read.

prompt:			.string "R32V2020> "
; Not using the following data values but included for future use
i2c_addr_wr:	.byte 0x40
i2c_addr_rd:	.byte 0x41
i2c_reg_addr:	.byte 0x00
i2c_wr_val:		.byte 0x00

;
; main
; Read I2C and write it back out
;

main:
	bsr		clearScreen			; Not required for this example
	lix		r8,prompt.lower		; r8 contains the pointer to the the prompt 
	bsr		printString			; Print the prompt to the screen
	lix		r8,0x08
loopMain:
	lix		r8,0x55				; data value to write
	lix		r9,0x0				; address to write
	bsr		writeI2CEEPROM
	lix		r8,0x0				; address to read	
	bsr		readI2CEEPROM
	
stallHere:
	bra		stallHere				; restart the shifting
	
;
; writeI2CEEPROM - Write to the EEPROM on the I2C bus
; Address 0x6800 -> DATA (write/read) or SLAVE ADDRESS (write)  
; Address 0x6801 -> Command/Status Register (write/read)
; r8 is the value to write
; r9 is the EEPROM address location to write
;

writeI2CEEPROM:
	push	r10
	push	r8
	lix		r8,0x01		; I2C_Ctrl = START
	bsr		write_I2C_Ctrl_Reg
	sr8		r10,r9		; get the page address bit
	and		r10,r10,ONE
	sl1		r10			; page bit in the right place
	lix		r8,0xA0		; I2C write command at slave address = 0x50
	or		r8,r8,r10	; OR in the address bit
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x00		; I2C_Ctrl = IDLE
	bsr		write_I2C_Ctrl_Reg	
	lix		r10,0x00FF	; mask address off page address bit
	and		r8,r10,r9	; Word Address
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x03		; I2C_Ctrl = STOP
	bsr		write_I2C_Ctrl_Reg	
	pull	r8			; Data to write is in r8
	bsr		write_I2C_Data_Address_Reg
; wait for 5 mSecs for write to complete (spec is 5 mS max)
	push	r8
	lix		r8,6		; Extra mS to cover the timer resolution
	bsr		delay_mS
	pull	r8
	pull	r10
	pull	PC
	
;
; readI2CEEPROM - Read data from the EEPROM on the I2C bus
; Address 0x6800 -> DATA (write/read) or SLAVE ADDRESS (write)  
; Address 0x6801 -> Command/Status Register (write/read)
; r9 is the EEPROM address location to write
; r8 is the value that was read
;

readI2CEEPROM:
	; write the GPIO address register
	lix		r8,0x01		; I2C_Ctrl = START
	bsr		write_I2C_Ctrl_Reg
	sr8		r10,r9		; get the page address bit
	and		r10,r10,ONE
	sl1		r10			; page bit in the right place
	lix		r8,0xA0		; I2C write command at slave address = 0x50
	or		r8,r8,r10	; OR in the address bit
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x09		; MCP23008 - GPIO register address
	bsr		write_I2C_Data_Address_Reg
	; Read the GPIO line value
	lix		r8,0x01		; I2C_Ctrl = START
	bsr		write_I2C_Ctrl_Reg
	lix		r8,0x41		; I2C read command at slave address = 0x20
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x00		; I2C_Ctrl = IDLE
	bsr		write_I2C_Ctrl_Reg	
	bsr		read_I2C_Data_Reg
	push	r8
	lix		r8,0x03		; I2C_Ctrl = STOP
	bsr		write_I2C_Ctrl_Reg	
	pull	r8
	pull	PC
	
;
; write_I2C_Data_Address_Reg
;

write_I2C_Data_Address_Reg:
	push	PAR
	lix		PAR,0x6800	; I2C Address/register
	spl		r8			; Write control register
	bsr		i2c_ack
	pull	PAR
	pull	PC

;
; read_I2C_Data_Reg - Read I2C data into r8
;

read_I2C_Data_Reg:
	push	PAR
	lix		PAR,0x6800	; I2C Data Address
	lix		r8,0x54
	spl		r8
	bsr		i2c_ack
	lix		PAR,0x6800	; I2C Data Address
	lpl		r8
	pull	PAR
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
	push	PAR
	lix		PAR,0x6801	; I2C Control register
	spl		r8			; Write control register
	pull	PAR
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
	lix		PAR,0x6801	; Control register
i2c_ack_loop:
	lpl		r8
	and		r8,r8,r1	; busy bit is least significant bit
	be1		i2c_ack_loop
	pull	r8
	pull	PAR
	pull	PC

;
; readUartStatus
;
	
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
	push	r10
	push	PAR
	lix		r10,0x2		; TxReady bit
	lix		PAR,0x0		; UART Status
waitScreenTxStat:
	lpl		r9			; Read Status into r9
	and 	r9,r9,r10
	bez 	waitScreenTxStat
	lix 	PAR,0x1
	spl		r8			; echo the character
	pull	PAR
	pull	r10
	pull	r9
	pull	PC
	
; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Routine uses r9

delay_mS:
	push	r9
	push	PAR
	lix		PAR,0x3802		; address of the mSec counter
	lpl		r9				; read the peripheral counter into r9
	add		r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_mS:
	lpl		r9				; check the elapsed time counter
	cmp		r8,r9
	blt		loop_delay_mS
	pull	PAR
	pull	r9
	pull	PC

