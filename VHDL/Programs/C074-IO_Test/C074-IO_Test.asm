;
; C074-IO_Test - Read a line from the UART serial input
; Echo line to the serial port and to the screen
; Parse the line
;

prompt:			.string "R32V2020> "
; lineBuff is 80 characters long
lineBuff:		.string "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
syntaxError:	.string "Syntax error"
runningString:	.string "Running..."
hitAnyKey:		.string "Hit any key to exit..."
menuItem_01:	.string "01-Ring LED Test      "
menuItem_02:	.string "02-7 Segment LED Test "
menuItem_03:	.string "03-Pushbutton Test    "
menuItem_04:	.string "04-DIP Switch Test    "
menuItem_05:	.string "05-ANSI Screen Test   "
menuItem_06:	.string "06-Serial Port Test   "
menuItem_07:	.string "07-MCP23008 I2C Test  "
menuItem_08:	.string "08-MCP4231 SPI Test   "
menuItem_09:	.string "09-PS/2 Keyboard Test "
menuItem_10:	.string "10-Buzzer Test        "
menuItem_11:	.string "11-TBD Test        "

;
; Read a line from the UART and parse the line
;

main:
	bsr		clearScreen
	bsr		printMenu
	bsr		getLine
	bsr		parseLine
	bra		main

;
; printMenu - Print the menu
;

printMenu:
	push	r8
	lix		r8,menuItem_01.lower
	bsr		printString
	lix		r8,menuItem_02.lower
	bsr		printString
	lix		r8,menuItem_03.lower
	bsr		printLine
	lix		r8,menuItem_04.lower
	bsr		printString
	lix		r8,menuItem_05.lower
	bsr		printString
	lix		r8,menuItem_06.lower
	bsr		printLine
	lix		r8,menuItem_07.lower
	bsr		printString
	lix		r8,menuItem_08.lower
	bsr		printString
	lix		r8,menuItem_09.lower
	bsr		printLine
	lix		r8,menuItem_10.lower
	bsr		printLine
	lix		r8,prompt.lower
	bsr		printString
	pull	r8
	pull	PC

;
; getLine - Reads the UART and fills a buffer with the characters received
; r8 received character - Character received from the UART
; r9 is constant - ENTER key on keyboard
; r10 is the input buffer length
; r11 is the BACK key on keyboard
; r12 used to test the backspace doesn't go past the start of the buffer
; DAR points to lineBuff current character position
;

getLine:
	push	r8
	push	r9
	push	r10
	push	r11
	push	r12
	push	DAR
	lix		DAR,lineBuff.lower	; DAR pointer = start of line buffer
	lix		r11,0x7F			; BACK key - rubout
	lix		r10,79				; number of chars in the line buffer
	lix		r9,0x0D				; ENTER key - ends the line
loopReadLine:
	bsr		waitGetCharFromUART	; Get a character from the UART
	bsr		putCharToANSIScreen	; Put the character to the screen
	bsr		putCharToUART		; Echo character back to the UART
	cmp		r8,r9				; check if received char was end of line
	beq		gotEOL
	cmp		r8,r11
	beq		gotBackspace
	sdb		r8
	add		DAR,DAR,ONE			; increment to next long in buffer
	add		r10,r10,MINUS1
	bnz		loopReadLine		; Next char would overflow
	; tbd add code for line too long	
gotEOL:
	lix		r8,0x0A				; Echo line feed after CR
	bsr		putCharToANSIScreen	; Put the character to the screen
	bsr		putCharToUART		; Echo character back to the UART
	sdb		r0					; null at end of line read
	bra		doneHandlingLine
gotBackspace:
	add		DAR,DAR,MINUS1
	lix		r12,lineBuff.lower	; r12 pointer = start of line buffer
	cmp		r12,DAR
	bgt		loopReadLine
	add		DAR,r12,r0
	bra		loopReadLine
doneHandlingLine:
	pull	DAR
	pull	r12
	pull	r11
	pull	r10
	pull	r9
	pull	r8
	pull	PC

;
; parseLine - 
; line is in lineBuff
;

parseLine:
	push	r8
	push	r9
	push	DAR
	lix		r8,lineBuff.lower
	bsr		hexToSevenSeg
; Check to see if the command is 0x01
	lix		r9,0x01
	cmp		r8,r9
	bne		skipTo2
	bsr		testRoutine1
	bra		doneTests
; Check to see if the command is 0x02
skipTo2:
	lix		r9,0x02
	cmp		r8,r9
	bne		skipTo3
	bsr		testRoutine2
	bra		doneTests
; Check to see if the command is 0x03
skipTo3:
	lix		r9,0x03
	cmp		r8,r9
	bne		skipTo4
	bsr		testRoutine3
	bra		doneTests
; Check to see if the command is 0x04
skipTo4:
	lix		r9,0x04
	cmp		r8,r9
	bne		skipTo5
	bsr		testRoutine4
	bra		doneTests
; Check to see if the command is 0x05
skipTo5:
	lix		r9,0x05
	cmp		r8,r9
	bne		skipTo6
	bsr		testRoutine5
	bra		doneTests
; Check to see if the command is 0x06
skipTo6:
	lix		r9,0x06
	cmp		r8,r9
	bne		skipTo7
	bsr		testRoutine6
	bra		doneTests
; Check to see if the command is 0x07
skipTo7:
	lix		r9,0x07
	cmp		r8,r9
	bne		skipTo8
	bsr		testRoutine7
	bra		doneTests
; Check to see if the command is 0x08
skipTo8:
	lix		r9,0x08
	cmp		r8,r9
	bne		skipTo9
	bsr		testRoutine8
	bra		doneTests
; Check to see if the command is 0x09
skipTo9:
	lix		r9,0x09
	cmp		r8,r9
	bne		skipTo10
	bsr		testRoutine9
	bra		doneTests
; Check to see if the command is 0x10
skipTo10:
	lix		r9,0x10
	cmp		r8,r9
	bne		skipTo11
	bsr		testRoutine10
	bra		doneTests
;
skipTo11:
	push	r8
	lix		r8,syntaxError.lower
	bsr		printString
	pull	r8
doneTests:
	lix		r8,2000
	bsr		delay_mS
	pull	DAR
	pull	r9
	pull	r8
	pull	PC
	
;
; Test Ring LEDs
;

testRoutine1:
	push	r8
	push	r9
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_01.lower
	bsr		printLine
	lix		r9,0x1000			; ring has been circled
reload:
	lix		r8,1
loopLEDRing:
	bsr		putValueToRingLEDs	; put the switches to the 7 Segment LED
	push	r8
	lix		r8,250				; wait for 1 second
	bsr		delay_mS
	pull	r8
	sl1		r8,r8
	cmp		r8,r9
	bne		loopLEDRing
	;bra		reload
	lix		r8,0
	bsr		putValueToRingLEDs	; put the switches to the 7 Segment LED
	pull	r9
	pull	r8
	pull	PC
	
; putValueToRingLEDs
; passed r8 - value to send to the ring LEDs

putValueToRingLEDs:
	push	PAR
	push	r8
	lix		PAR,0x4800		; Ring LED address
	spl		r8				; Write out LED bits
	pull	r8
	pull	PAR
	pull	PC

;
; Seven Segment Display Test
;

testRoutine2:
	push	r8
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_02.lower
	bsr		printLine
	liu		r8,0x1234
	lil		r8,0x5678
	bsr		wr7Seg8Dig
	lix		r8,2000
	bsr		delay_mS
	liu		r8,0xABCD
	lil		r8,0xEF12
	bsr		wr7Seg8Dig
	lix		r8,2000
	bsr		delay_mS
	lix		r8,0x0
	bsr		wr7Seg8Dig
	pull	r8
	pull	PC
	
; wr7Seg8Dig
; passed r8 - value to send to the 7 seg display

wr7Seg8Dig:
	push	PAR
	push	r8
	lix		PAR,0x3000		; Seven Segment LED lines
	spl		r8				; Write out LED bits
	pull	r8
	pull	PAR
	pull	PC
	
;
; Pushbutton Test
;

testRoutine3:
	push	r8
	push	r9
	push	r10
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_03.lower
	bsr		printLine
	lix		r10,0x0
loopSwRead:
	bsr		readSws		; returns switches and pushbuttons in r8
	lix		r9,0x7
	and		r8,r8,r9
	lix		r9,0x30
	add		r8,r8,r9
	cmp		r8,r10
	beq		loopSwRead
	add		r10,r8,r0
	bsr		putCharToANSIScreen
	bsr		newLine
	lix		r8,250
	bsr		delay_mS
	bra		loopSwRead
	pull	r10
	pull	r9
	pull	r8
	pull	PC
	
;
; readSws
; switches value returned in r8
; switches are high when pressed
; Switches d0-d2 are the pushbutton switches (inverted)
; 	Pushbutton switches are debounced
; Switches d3-10 are the DIP switches (not inverted)
;

readSws:
	push	PAR
	push	r9
	lix		r9,0x7
	lix		PAR,0x2000	; Switches address
	lpl		r8			; Read switches into r9
	xor		r8,r8,r9
	pull	r9
	pull	PAR
	pull	PC
	
;
; DIP Switch Test
;

testRoutine4:
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_04.lower
	bsr		printLine
	lix		r10,0x0
loopSwRead2:
	bsr		readSws		; returns switches and pushbuttons in r8
	sr1		r8,r8
	sr1		r8,r8
	sr1		r8,r8
	sr1		r8,r8
	lix		r9,0xff
	and		r8,r8,r9
	cmp		r8,r10
	beq		loopSwRead2
	add		r10,r8,r0
	bsr		wr7Seg8Dig
;	bsr		newLine
	lix		r8,250
	bsr		delay_mS
	bra		loopSwRead2
	pull	PC
	
;
; ANSI Screen Test
;

testRoutine5:
	push	r8
	push	r9
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_05.lower
	bsr		printLine
	lix		r9,0xff		; end with backspace
	lix		r8,0x20			; start with a space
anotherCharT5:
	bsr		putCharToANSIScreen
	add		r8,r8,ONE
	cmp		r8,r9
	bne		anotherCharT5
	pull	r9
	pull	r8
	pull	PC
	
;
; Serial Port Test
;

testRoutine6:
	push	r8
	push	r9
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_06.lower
	bsr		printLine
	lix		r9,0x7f			; end with backspace
	lix		r8,0x20			; start with a space
anotherCharT6:
	bsr		putCharToUART
	add		r8,r8,ONE
	cmp		r8,r9
	bne		anotherCharT6
	pull	r9
	pull	r8
	pull	PC
	
;
; MCP23008 I2C Test
;

testRoutine7:
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_07.lower
	bsr		printLine
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
	pull	PC
	
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
; MCP4231 SPI Test
;

testRoutine8:
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_08.lower
	bsr		printLine
; Write ramp output to SPI-POTX2
; x6000-x67FF (2KB)	- SPI Address Range
; x6000 - d0-d7 = Write value
; x6001 - d0 = Write Chip Select line
; x6002 - d0 = Busy flag
	lix		r9,0x80				; loop terminal count
reloadr8:
	lix		r8,0x00				; sent out low voltage from pot
loopForever:
	bsr		writeSPI0
	add		r8,r8,r1
	cmp		r8,r9
	bne		loopForever
	bra		reloadr8
	pull	PC
	
;
; writeSPI0 - Write to the first SPI pot
; r8 contains the data to write out
; 16-bit command Fig 7-1 in the data sheet
;

writeSPI0:
	push	r8
	lix		r8,0x00			; start chip select
	lix		PAR,0x6001		; Chip Select Address
	spl		r8				; Turn on Chip Select
	lix		r8,0x00			; register select - REG0
	lix		PAR,0x6000		; Data address
	spl		r8				; Store data to the SPI bus
	bsr		waitSPITxRdy	; Wait for Tx Ready
	pull	r8				; data to write
	push	r8
	lix		PAR,0x6000		; data address
	spl		r8				; Store data to the SPI bus
	bsr		waitSPITxRdy	; Wait for Tx Ready
	lix		r8,0x01			; end chip select
	lix		PAR,0x6001		; Chip select address
	spl		r8				; Turn off chip select
	pull	r8
	pull	PC				; return	

;
; waitSPITxRdy - wait for SPI transfer to be complete
; Don't write until the busy cycles high then low
; R32V2020 is much faster than the SPI interface
; Need to wait for the busy to get set and the cleared again
;

waitSPITxRdy:
	push	r8			; save r8 since it's used by calling function(s)
	lix		PAR,0x6002	; SPI busy bit address
loopSPIRdy:				; wait until busy gets set
	lpl		r8			; load the busy bit
	cmp		r8,r0		; 0 = not yet set
	beq		loopSPIRdy	; wait until busy is set
loopSPIRdy2:			; wait while busy is set
	lpl		r8			; load the busy bit
	cmp		r8,r1		; 1 = busy is set
	beq		loopSPIRdy2	; still busy
	pull	r8			; restore r8
	pull	PC			; return

;
; PS/2 Keyboard Test
; 0x0D
;

testRoutine9:
	push	r8
	push	r9
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_09.lower
	bsr		printLine
	lix		r9,0x0D
loopForeverT9:
	bsr		getPS2Char
	bsr		putCharToANSIScreen
	cmp		r8,r9
	bne		loopForeverT9
	pull	r9
	pull	r8
	pull	PC

;
; Buzzer Test
;

testRoutine10:
	push	r8
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_10.lower
	bsr		printLine
	bsr		enableBuzzer
	lix		r8,0x100
	bsr		delay_mS
	bsr		disableBuzzer
	pull	r8
	pull	PC
	
;
; TBD Test
;

testRoutine11:
	push	r8
	push	r9
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_11.lower
	bsr		printLine
	;
	pull	r9
	pull	r8
	pull	PC
	
;
; hexToSevenSeg - Convert a two ASCII digit value into a hex byte
; Passed: r8 points to the start of the hex string
; Returned: r8 contains the hex value of the string
; Put the byte to the Seven Segment Display
;

hexToSevenSeg:
	push	r9
	push	DAR
	push	PAR
	lix		r9,0
	add		DAR,r8,ZERO		; Address of lineBuff (passed into this routine)
	ldb		r8
	bsr		asciiToHex
	or		r9,r9,r8
	sl1		r9,r9
	sl1		r9,r9
	sl1		r9,r9
	sl1		r9,r9
	add		DAR,DAR,ONE
	ldb		r8
	bsr		asciiToHex
	or		r9,r9,r8
	lix		PAR,0x3000		; seven segment display
	spl		r9
	add		r8,r9,ZERO
	pull	PAR
	pull	DAR
	pull	r9
	pull	PC

;
; asciiToHex - Convert a single ASCII hex character into a nibble
; Make conversion case insensitive
; Character to convert is passed in r8
; Result is returned in r8
;	'0' = 0x30
;	'9' = 0x39
;	'A' = 0x41
;	'F' = 0x46
;	'a' = 0x61
;	'f' = 0x66
;

asciiToHex:
	push	r9
	lix		r9,0x66		; check if letter is > 'f'
	cmp		r9,r8
	bgt		a2h_Error
	lix		r9,0x30		; check if letter is < '0'
	cmp		r9,r8	
	blt		a2h_Error
	lix		r9,0x3A		; check if letter is between '0' and '9' inclusively
	cmp		r9,r8
	blt		gotDigit
	lix		r9,0x41		; check if letter is between '9' and 'A' exclusively
	cmp		r9,r8
	blt		a2h_Error
	lix		r9,0x47		; check if letter is between 'A' and F' inclusively
	cmp		r9,r8
	blt		gotUpperLetter
	lix		r9,0x61		; check if between 'F' and 'a' exclusively
	cmp		r9,r8
	blt		a2h_Error
; Lower case letter
	lix		r9,0x57
	xor		r9,r9,MINUS1
	add		r9,r9,ONE
	add		r8,r8,r9
	lix		r9,0x0F
	and		r8,r8,r9
	bra		doneConvA2H
gotDigit:
	lix		r9,0x30
	xor		r9,r9,MINUS1
	add		r9,r9,ONE
	add		r8,r8,r9
	lix		r9,0x0F
	and		r8,r8,r9
	bra		doneConvA2H
gotUpperLetter:
	lix		r9,0x37
	xor		r9,r9,MINUS1
	add		r9,r9,ONE
	add		r8,r8,r9
	lix		r9,0x0F
	and		r8,r8,r9
	bra		doneConvA2H
a2h_Error:
	lix		r8,syntaxError.lower
	bsr		printString
	lix		r8,0xDEAD
doneConvA2H:
	pull	r9
	pull	PC

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
	push	r8					; save r8
	push	DAR
	add		DAR,r8,ZERO			; set the start of the string
nextChar:
	ldb		r8					; get the character
	cmp		r8,ZERO				; Null terminated string
	beq		donePrStr			; done if null
	bsr		putCharToANSIScreen	; write out the character
	add		DAR,DAR,r1			; Point to next character
	bra		nextChar
donePrStr:
	pull	DAR					; restore DAR
	pull	r8					; restore r8
	pull	PC					; rts
	
;
; printLine - Print a screen to the current screen position with CRLF at the end
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printLine:
	push	r8					; save r8
	push	DAR
	add		DAR,r8,ZERO			; set the start of the string
nextChar2:
	ldb		r8					; get the character
	cmp		r8,ZERO				; Null terminated string
	beq		donePrStr2			; done if null
	bsr		putCharToANSIScreen	; write out the character
	add		DAR,DAR,r1			; Point to next character
	bra		nextChar2
donePrStr2:
	bsr		newLine
	pull	DAR					; restore DAR
	pull	r8					; restore r8
	pull	PC					; rts
	
;
; newLine - Print out a newline (CR-LF)
;

newLine:
	push	r8
	lix		r8,0x0A				; Line Feed
	bsr		putCharToANSIScreen	; Put the character to the screen
	lix		r8,0x0D				; Carriage Return
	bsr		putCharToANSIScreen	; Put the character to the screen
	bsr		putCharToUART		; Echo character back to the UART
	pull	r8
	pull	PC

;
; clearScreen - Clear the screen routine
; ANSI Terminal has an escape sequence which clears the screen and homes cursor
;

clearScreen:
	push	r8				; save r8
	lix		r8,0x1b			; ESC
	bsr		putCharToANSIScreen
	bsr		putCharToUART
	lix		r8,0x5b			; [
	bsr		putCharToANSIScreen
	bsr		putCharToUART
	lix		r8,0x32			; 2
	bsr		putCharToANSIScreen
	bsr		putCharToUART
	lix		r8,0x4A			; J
	bsr		putCharToANSIScreen
	bsr		putCharToUART
	pull	r8
	pull	PC				; rts

;
; putCharToANSIScreen - Put a character to the screen
; Character to put to screen is in r8
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

;
; getPS2Char
; returns character received in r8
;

getPS2Char:
	push	r9
	push	PAR
	lix	PAR,0x1000	; PS/2 Status
waitPS2RxStat:
	lpl	r9			; Read Status into r9
	and r9,r9,r1
	bez waitPS2RxStat
getCharFromPS2:
	lix PAR,0x0800
	lpl	r8
	lix	PAR,0x1000	; PS/2 Status
whilePS2RxStat:
	pull	PAR
	pull	r9
	pull	PC

