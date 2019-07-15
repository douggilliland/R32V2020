; Read the jumpers and use jumper value for a delay
; Write bouncing LED pattern
;
; Uses I2CIO-8 card
;	http://land-boards.com/blwiki/index.php?title=I2CIO-8
;	Card has an MCP23008 I/O Expander IC
;	d0-d3 = LEDs
;	d4-d7 = Headers
; 

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
; Code to initialize I2CIO8 card
	bsr		init_Regs_I2CIO8	; initialize the MCP23008 on the I2CIO8
restartLoop:
	lix		r8,0x08
loopMain:
	bsr		wrI2CAdrDat_MCP23008	; write to LEDs
	bsr		delayFromJumpers
	sr1		r8,r8					; shift LED bit right by 1
	cmp		r8,r0
	bne		loopMain
	bra		restartLoop				; restart the shifting
	
;
; delayFromJumpers - Set delay based on header value
; returns: nothing (restores registers at return)
;

delayFromJumpers:
	push	r9
	push	r8
 	bsr		readI2CDat_MCP23008		; read headers into r8
	xor		r8,r8,MINUS1			; invert headers
	lix		r9,0xF0
	and		r8,r8,r9				; keep 8 bits
	sl1		r8,r8
	sl1		r8,r8
	sl1		r8,r8
	bsr		delay_mS
	pull	r8
	pull	r9
	pull	PC

;
; init_Regs_I2CIO8 - Set IO Dir
;

init_Regs_I2CIO8:
	push	r8
	; Write 0x22 to IOCON register (not sequential operations)
	lix		r8,0x01		; I2C_Ctrl = START
	bsr		write_I2C_Ctrl_Reg
	lix		r8,0x40		; I2C write command at slave address = 0x20
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x00		; I2C_Ctrl = IDLE
	bsr		write_I2C_Ctrl_Reg
	lix		r8,0x05		; MCP23008 IOCON
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x03		; I2C_Ctrl = STOP
	bsr		write_I2C_Ctrl_Reg	
	lix		r8,0x22		; SEQOP = Disabled, INTPOL = Active-high
	bsr		write_I2C_Data_Address_Reg
	; Write 0xF0 to Direction Control register
	lix		r8,0x01		; I2C_Ctrl = START
	bsr		write_I2C_Ctrl_Reg
	lix		r8,0x40		; I2C write command at slave address = 0x20
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x00		; I2C_Ctrl = IDLE
	bsr		write_I2C_Ctrl_Reg
	lix		r8,0x00		; MCP23008 IODIR
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x03		; I2C_Ctrl = STOP
	bsr		write_I2C_Ctrl_Reg
	lix		r8,0xF0		; Input and output bits
	bsr		write_I2C_Data_Address_Reg
	pull	r8
	pull	PC

;
; wrI2CAdrDat_MCP23008 - Write address to the I2C bus
; Address 0x5800 -> DATA (write/read) or SLAVE ADDRESS (write)  
; Address 0x5801 -> Command/Status Register (write/read)
; r8 is the value to write
;

wrI2CAdrDat_MCP23008:
	push	r8
	lix		r8,0x01		; I2C_Ctrl = START
	bsr		write_I2C_Ctrl_Reg
	lix		r8,0x40		; I2C write command at slave address = 0x20
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x00		; I2C_Ctrl = IDLE
	bsr		write_I2C_Ctrl_Reg	
	lix		r8,0x0A		; MCP23008 OLAT
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x03		; I2C_Ctrl = STOP
	bsr		write_I2C_Ctrl_Reg	
	pull	r8			; Data to write is in r8
	bsr		write_I2C_Data_Address_Reg
	pull	PC
	
;
; readI2CDat_MCP23008 - Read data from the I2C bus
; Address 0x5800 -> DATA (write/read) or SLAVE ADDRESS (write)  
; Address 0x5801 -> Command/Status Register (write/read)
; r8 is the value to write
;

readI2CDat_MCP23008:
	; write the GPIO address register
	lix		r8,0x01		; I2C_Ctrl = START
	bsr		write_I2C_Ctrl_Reg
	lix		r8,0x40		; I2C write command at slave address = 0x20
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x03		; I2C_Ctrl = STOP
	bsr		write_I2C_Ctrl_Reg	
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
	lix		PAR,0x5800	; I2C Address/register
	spl		r8			; Write control register
	bsr		i2c_ack
	pull	PAR
	pull	PC

;
; read_I2C_Data_Reg - Read I2C data into r8
;

read_I2C_Data_Reg:
	push	PAR
	lix		PAR,0x5800	; I2C Data Address
	lix		r8,0x54
	spl		r8
	bsr		i2c_ack
	lix		PAR,0x5800	; I2C Data Address
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
	lix		PAR,0x5801	; I2C Control register
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
	lix		PAR,0x5801	; Control register
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

;	
; delay_uS - delay for the number of uSecs
; pass mSec delay in r8
; Uses routine uses r9 (saved and restored)
;

delay_uS:
	push	r9
	push	PAR
	lix		PAR,0x3801		; address of the uSec counter
	lpl		r9				; read the peripheral counter into r9
	add		r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_uS:
	lpl		r9				; check the elapsed time counter
	cmp		r8,r9
	blt		loop_delay_uS
	pull	PAR
	pull	r9
	pull	PC
