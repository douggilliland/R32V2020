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
menuItem_11:	.string "11-Timers Test        "
menuItem_12:	.string "12-TBD Test           "

;
; Read a line from the UART and parse the line
;

main:
	bsr		clearANSIScreenAndUART
	bsr		printMenu
	bsr		readToLineBuffer
	bsr		parseLine
	bra		main

;
; printMenu - Print the menu
;

printMenu:
	push	r8
	bsr		newLine_ANSI_UART
	lix		r8,menuItem_01.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_02.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_03.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,menuItem_04.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_05.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_06.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,menuItem_07.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_08.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_09.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,menuItem_10.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_11.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,prompt.lower
	bsr		printString_ANSI_UART
	pull	r8
	pull	PC

;
; readToLineBuffer - Reads the UART and fills a buffer with the characters received
; r8 received character - Character received from the UART
; r9 is the input buffer length
; r10 used to test the backspace doesn't go past the start of the buffer
; DAR points to lineBuff current character position
;

readToLineBuffer:
	push	r8
	push	r9
	push	r10
	push	DAR
	lix		DAR,lineBuff.lower	; DAR pointer = start of line buffer
	lix		r9,79				; number of chars in the line buffer
loopReadLine:
	bsr		waitReadPS2_UART		; Get a character from the UART
	bsr		writeANSI_UART		; Echo character back to the UART
	cmpi	r8,0x0D				; check if received char was end of line
	beq		gotEOL
	cmpi	r8,0x7F
	beq		gotBackspace
	sdbp	r8
	add		r9,r9,MINUS1
	bnz		loopReadLine		; Next char would overflow
	; tbd add code for line too long	
gotEOL:
	lix		r8,0x0A				; Echo line feed after CR
	bsr		writeANSI_UART	; Put the character to the screen
	bsr		putCharToUART		; Echo character back to the UART
	sdb		r0					; null at end of line read
	bra		doneHandlingLine
gotBackspace:
	add		DAR,DAR,MINUS1
	lix		r10,lineBuff.lower	; r10 pointer = start of line buffer
	cmp		r10,DAR
	bgt		loopReadLine
	addi	DAR,r10,0
	bra		loopReadLine
doneHandlingLine:
	pull	DAR
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
	lix		r8,lineBuff.lower
	bsr		hexToSevenSeg
; Check to see if the command is 0x01
	cmpi	r8,0x01
	bne		skipTo2
	bsr		testRingLEDs
	bra		doneTests
; Check to see if the command is 0x02
skipTo2:
	cmpi	r8,0x02
	bne		skipTo3
	bsr		test7Segs
	bra		doneTests
; Check to see if the command is 0x03
skipTo3:
	cmpi	r8,0x03
	bne		skipTo4
	bsr		testPushbuttons
	bra		doneTests
; Check to see if the command is 0x04
skipTo4:
	cmpi	r8,0x04
	bne		skipTo5
	bsr		testDIPSwitches
	bra		doneTests
; Check to see if the command is 0x05
skipTo5:
	cmpi	r8,0x05
	bne		skipTo6
	bsr		testANSIScreen
	bra		doneTests
; Check to see if the command is 0x06
skipTo6:
	cmpi	r8,0x06
	bne		skipTo7
	bsr		testSerialPort
	bra		doneTests
; Check to see if the command is 0x07
skipTo7:
	cmpi	r8,0x07
	bne		skipTo8
	bsr		testMCP23008
	bra		doneTests
; Check to see if the command is 0x08
skipTo8:
	cmpi	r8,0x08
	bne		skipTo9
	bsr		testMCP4231
	bra		doneTests
; Check to see if the command is 0x09
skipTo9:
	cmpi	r8,0x09
	bne		skipTo10
	bsr		testPS2Keyboard
	bra		doneTests
; Check to see if the command is 0x10
skipTo10:
	cmpi	r8,0x10
	bne		skipTo11
	bsr		testBuzzer
	bra		doneTests
;
skipTo11:
	cmpi	r8,0x11
	bne		skipTo12
	bsr		testTBD
	bra		doneTests

skipTo12:
	push	r8
	lix		r8,syntaxError.lower
	bsr		printString_ANSI_UART
	pull	r8
doneTests:
	lix		r8,2000
	bsr		delay_mS
	pull	r8
	pull	PC
	
;
; Test Ring LEDs
;

testRingLEDs:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_01.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printString_ANSI_UART
reload:
	lix		r8,1
loopLEDRing:
	bsr		putValueToRingLEDs	; put the switches to the 7 Segment LED
	push	r8
	lix		r8,250				; wait for 1 second
	bsr		delay_mS
	pull	r8
	sl1		r8,r8
	cmpi	r8,0x1000
	bne		loopLEDRing
	lix		r8,0
	bsr		putValueToRingLEDs	; put the switches to the 7 Segment LED
	bsr		checkForCharAndDiscard
	cmpi	r8,0
	beq		reload
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

test7Segs:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_02.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printString_ANSI_UART
rerun7Segs:
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
	bsr		checkForCharAndDiscard
	cmpi	r8,0
	beq		rerun7Segs
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
; r8 used for temporary variables
; r9 stores the previous button value
;

testPushbuttons:
	push	r8
	push	r9
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_03.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r9,0x0
loopSwRead:
	bsr		checkForCharAndDiscard
	cmpi	r8,1
	beq		doneWithSwitches
	bsr		readSws		; returns switches and pushbuttons in r8
	andi	r8,r8,0x7	; just the pushbuttons
	addi	r8,r8,0x30
	cmp		r8,r9
	beq		loopSwRead
	addi	r9,r8,0
	bsr		writeANSI_UART
	bsr		newLine_ANSI_UART
	lix		r8,250
	bsr		delay_mS
	bra		loopSwRead
doneWithSwitches:
	pull	r9
	pull	r8
	pull	PC
	
;
; readSws
; switches value returned in r8
; switches are high when pressed
; Switches d0-d2 are the pushbutton switches (inverted in FPGA hardware)
; 	Pushbutton switches are debounced
; Switches d3-10 are the DIP switches (not inverted)
;

readSws:
	push	PAR
	lix		PAR,0x2000	; Switches address
	lpl		r8			; Read switches into r9
	andi	r8,r8,0xfff	; just the switches
	pull	PAR
	pull	PC
	
;
; DIP Switch Test
;

testDIPSwitches:
	push	r8
	push	r9
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_04.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r9,0x0
	lix		r8,0x0
	bsr		wr7Seg8Dig
loopSwRead2:
	bsr		checkForCharAndDiscard
	cmpi	r8,1
	beq		doneWithDIPSwitches
	bsr		readSws		; returns switches and pushbuttons in r8
	sr1		r8,r8
	sr1		r8,r8
	sr1		r8,r8
	sr1		r8,r8
	andi	r8,r8,0xff
	cmp		r8,r9
	beq		loopSwRead2
	addi	r9,r8,0
	bsr		wr7Seg8Dig
	lix		r8,250
	bsr		delay_mS
	bra		loopSwRead2
doneWithDIPSwitches:
	pull	r9
	pull	r8
	pull	PC
	
;
; printANSICode - Send the ANSI Escape Sequence
; r8 - points to the string
; This routine supplies the ESC
;

printANSICode:
	push	r8
	push	r8
	lix		r8,0x1b			; ESC
	bsr		putCharToANSIScreen
	pull	r8
	bsr		printString_ANSI
	pull	r8
	pull	PC

;
; ANSI Screen Test
;

redString:		.string "Red "
greenString:	.string "Green "
blueString:		.string "Blue "
cyanString:		.string "Cyan "
magentaString:	.string "Magenta "
yellowString:	.string "Yellow "
blackString:	.string "Black "
grayString:		.string "Gray "
onString:		.string "on "
brightString:	.string "Bright "

testANSIScreen:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_05.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,0x20			; start with a space
anotherCharT5:
	bsr		putCharToANSIScreen
	addi	r8,r8,1
	cmpi	r8,0xFF
	bne		anotherCharT5
	bsr		newLine_ANSI
; Test screen character colors
; Light characters
defaultColors:	.string "[0;1m"
	lix		r8,defaultColors.lower
	bsr		printANSICode
redChars:	.string	"[31;22m"
	lix		r8,redChars.lower
	bsr		printANSICode
	lix		r8,redString.lower
	bsr		printString_ANSI
grnChars:	.string	"[32m"
	lix		r8,grnChars.lower
	bsr		printANSICode
	lix		r8,greenString.lower
	bsr		printString_ANSI
bluChars:	.string	"[34m"
	lix		r8,bluChars.lower
	bsr		printANSICode
	lix		r8,blueString.lower
	bsr		printString_ANSI
cyanChars:	.string	"[36m"
	lix		r8,cyanChars.lower
	bsr		printANSICode
	lix		r8,cyanString.lower
	bsr		printString_ANSI
magChars:	.string	"[35m"
	lix		r8,magChars.lower
	bsr		printANSICode
	lix		r8,magentaString.lower
	bsr		printString_ANSI
yelChars:	.string	"[33m"
	lix		r8,yelChars.lower
	bsr		printANSICode
	lix		r8,yellowString.lower
	bsr		printString_ANSI
	bsr		newLine_ANSI
	lix		r8,defaultColors.lower
	bsr		printANSICode
; Bright characters
redChars2:	.string	"[31;1m"
	lix		r8,redChars2.lower
	bsr		printANSICode
	lix		r8,redString.lower
	bsr		printString_ANSI
	lix		r8,grnChars.lower
	bsr		printANSICode
	lix		r8,greenString.lower
	bsr		printString_ANSI
	lix		r8,bluChars.lower
	bsr		printANSICode
	lix		r8,blueString.lower
	bsr		printString_ANSI
	lix		r8,cyanChars.lower
	bsr		printANSICode
	lix		r8,cyanString.lower
	bsr		printString_ANSI
	lix		r8,magChars.lower
	bsr		printANSICode
	lix		r8,magentaString.lower
	bsr		printString_ANSI
	lix		r8,yelChars.lower
	bsr		printANSICode
	lix		r8,yellowString.lower
	bsr		printString_ANSI
	bsr		newLine_ANSI
	lix		r8,defaultColors.lower
	bsr		printANSICode
; Red on Black
redOnBlackANSI:	.string	"[27;40;31m"
	lix		r8,redOnBlackANSI.lower
	bsr		printANSICode
	lix		r8,redString.lower
	bsr		printString_ANSI
	lix		r8,onString.lower
	bsr		printString_ANSI
	lix		r8,grayString.lower
	bsr		printString_ANSI
; Bright Yellow on Green
brtYelOnGrn:	.string "[93;42m"
	lix		r8,brtYelOnGrn.lower
	bsr		printANSICode
	lix		r8,brightString.lower
	bsr		printString_ANSI
	lix		r8,yellowString.lower
	bsr		printString_ANSI
	lix		r8,onString.lower
	bsr		printString_ANSI
	lix		r8,greenString.lower
	bsr		printString_ANSI
; Reset to default colors
	lix		r8,defaultColors.lower
	bsr		printANSICode
	bsr		newLine_ANSI
; Hit any key to continue
	bsr		newLine_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printLinebuffer_ANSI_UART
keepCheckCharIn:
	bsr		checkForCharAndDiscard
	cmpi	r8,0
	beq		keepCheckCharIn
	pull	r8
	pull	PC
	
;
; Serial Port Test
;

testSerialPort:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_06.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,0x20			; start with a space
anotherCharT6:
	bsr		putCharToUART
	addi	r8,r8,1
	cmpi	r8,0x7f
	bne		anotherCharT6
	pull	r8
	pull	PC
	
;
; MCP23008 I2C Test
;

testMCP23008:
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_07.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printLinebuffer_ANSI_UART
; Code to initialize I2CIO8 card
	bsr		init_Regs_I2CIO8	; initialize the MCP23008 on the I2CIO8
restartLoop:
	lix		r8,0x08
loopMain:
	bsr		wrI2CAdrDat_MCP23008	; write to LEDs
	bsr		delayFromJumpers
	sr1		r8,r8					; shift LED bit right by 1
	cmpi	r8,0
	bne		loopMain
	bsr		checkForCharAndDiscard
	cmpi	r8,0
	beq		restartLoop				; restart the shifting
	pull	PC
	
;
; delayFromJumpers - Set delay based on header value
; returns: nothing (restores registers at return)
;

delayFromJumpers:
	push	r8
 	bsr		readI2CDat_MCP23008		; read headers into r8
	xor		r8,r8,MINUS1			; invert headers
	andi	r8,r8,0xF0				; keep 8 bits
	sl1		r8,r8
	sl1		r8,r8
	sl1		r8,r8
	bsr		delay_mS
	pull	r8
	pull	PC

;
; printLong
; r8 contains the long value to print
;

printLong:
	push	r8
	push	r9
	push	r10
	push	r8				; temporarily save r8
	lix		r8,0x30
	bsr		writeANSI_UART
	lix		r8,0x78
	bsr		writeANSI_UART
	pull	r8				; restore r8
	lix		r9,8			; loop counter
doNextPrintLong:
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	bsr		printHexVal
	subi	r9,r9,1
	bnz		doNextPrintLong
	pull	r10
	pull	r9
	pull	r8
	pull	PC

;
; printHexVal
;

printHexVal:
	push	r8
	andi	r8,r8,0xf
	cmpi	r8,9
	blt		printHexLetter
	addi	r8,r8,0x30
	bsr		writeANSI_UART
	bra		donePrintHexVal
printHexLetter:
	addi	r8,r8,0x37		; 'A' - 10
	bsr		writeANSI_UART
donePrintHexVal:
	pull	r8
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
	andi	r8,r8,0x1	; busy bit is least significant bit
	be1		i2c_ack_loop
	pull	r8
	pull	PAR
	pull	PC

;
; MCP4231 SPI Test
; Write ramp output to SPI-POTX2
; x6000-x67FF (2KB)	- SPI Address Range
; x6000 - d0-d7 = Write value
; x6001 - d0 = Write Chip Select line
; x6002 - d0 = Busy flag
;

testMCP4231:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_08.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printLinebuffer_ANSI_UART
reloadr8:
	lix		r8,0x00				; sent out low voltage from pot
loopForever:
	bsr		writeSPI0
	addi	r8,r8,0x1
	cmpi	r8,0x80
	bne		loopForever
	bsr		checkForCharAndDiscard
	cmpi	r8,0
	beq		reloadr8
	pull	r8
	pull	PC
	
;
; writeSPI0 - Write to the first SPI pot
; r8 contains the data to write out
; 16-bit command Fig 7-1 in the MCP4231 data sheet
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
	cmpi	r8,0		; 0 = not yet set
	beq		loopSPIRdy	; wait until busy is set
loopSPIRdy2:			; wait while busy is set
	lpl		r8			; load the busy bit
	cmpi	r8,1		; 1 = busy is set
	beq		loopSPIRdy2	; still busy
	pull	r8			; restore r8
	pull	PC			; return

;
; PS/2 Keyboard Test
; 0x0D
;

testPS2Keyboard:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_09.lower
	bsr		printLinebuffer_ANSI_UART
loopForeverT9:
	bsr		getPS2Char
	bsr		writeANSI_UART
	cmpi	r8,0x0D
	bne		loopForeverT9
	pull	r8
	pull	PC

;
; Buzzer Test
;

testBuzzer:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_10.lower
	bsr		printLinebuffer_ANSI_UART
	bsr		enableBuzzer
	lix		r8,0x100
	bsr		delay_mS
	bsr		disableBuzzer
	pull	r8
	pull	PC
	
;
; Timers Test
; 	Address	Timer
; 	X3800	Elapsed Time Counter
;	X3801	MicroSeconds Counter
;	X3802	Milliseconds Counter
;	X3803	CPU Instruction Counter
;

testTBD:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_11.lower
	bsr		printLinebuffer_ANSI_UART
	bsr		testTimers
	pull	r8
	pull	PC
	
; 
; testTimers
; 

testTimers:
	push	r8
	push	r9
	push	PAR
	; First test the CPU Instruction Counter
	lix		PAR,0x3803		; CPU Instruction Counter
	lpl		r9				; Get the counter value
	nop
	nop
	nop
	nop
	nop
	lpl		r8
	sub		r9,r9,r8
	cmpi	r9,0x06
	beq		CPUCycleTimerDone
	lix		PAR,0x3000
	liu		r8,0xDEAD
	lil		r8,0x0001
	spl		r8
	bra		timerTestsDone
CPUCycleTimerDone:
	lix		PAR,0x3803		; CPU Instruction Counter
	lpl		r9				; Get the counter value
	nop
	nop
	nop
	nop
	nop
	lpl		r8
	sub		r9,r9,r8
	cmpi	r9,06
	beq		millisecondTimerDone
	lix		PAR,0x3000
	liu		r8,0xDEAD
	lil		r8,0x0002
	spl		r8
	bra		timerTestsDone
millisecondTimerDone:

timerTestsDone:
	pull	PAR
	pull	r9
	pull	r8
	pull	PC


;
; TBD Test
;

testRingLEDs2:
	push	r8
	push	r9
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_12.lower
	bsr		printLinebuffer_ANSI_UART
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
	ldbp	r8
	bsr		asciiToHex
	andi	r8,r8,0xf
	or		r9,r9,r8
	sl1		r9,r9
	sl1		r9,r9
	sl1		r9,r9
	sl1		r9,r9
	ldb		r8
	bsr		asciiToHex
	andi	r8,r8,0xf
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
;	'0' = 0x30
;	'9' = 0x39
;	'A' = 0x41
;	'F' = 0x46
;	'a' = 0x61
;	'f' = 0x66
; Result is returned in r8
;	0x0-0xf - Legal Values
;	'DEAD' - Not hex character
;

asciiToHex:
	cmpi	r8,0x66			; past 'f'
	blt		a2h_Error
	cmpi	r8,0x30			; below '0'
	bgt		a2h_Error
	cmpi	r8,0x3A			; '0' - '9'
	bgt		gotDigit
	cmpi	r8,0x41			; ':' - '@'
	bgt		a2h_Error
	cmpi	r8,0x47			; 'A' - 'F'
	blt		gotUpperLetter
	cmpi	r8,0x61			; 'G' - 'tick'
	blt		a2h_Error
; Lower case letter
	subi	r8,r8,0x57
	bra		doneConvA2H
; number 0-9
gotDigit:
	subi	r8,r8,0x30
	bra		doneConvA2H
; A-F
gotUpperLetter:
	subi	r8,r8,0x37
	bra		doneConvA2H
a2h_Error:
	lix		r8,syntaxError.lower
	bsr		printString_ANSI_UART
	lix		r8,0xDEAD
doneConvA2H:
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
	andi 	r8,r8,0x1
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
	lix		PAR,0x1800	; UART Status
waitUartTxStat:
	lpl		r9			; Read Status into r9
	andi	r9,r9,0x2
	bez 	waitUartTxStat
	lix 	PAR,0x1801
	spl		r8			; echo the character
	pull	PAR
	pull	r9
	pull	PC
	
;
; printString_ANSI_UART - Print a screen to the current screen position
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printString_ANSI_UART:
	push	r8					; save r8
	push	DAR
	add		DAR,r8,ZERO			; set the start of the string
nextChar:
	ldbp	r8					; get the character01
	cmpi	r8,0x0				; Null terminated string
	beq		donePrStr			; done if null
	bsr		writeANSI_UART	; write out the character
	bra		nextChar
donePrStr:
	pull	DAR					; restore DAR
	pull	r8					; restore r8
	pull	PC					; rts
	
;
; printString_ANSI - Print a screen to the current screen position
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printString_ANSI:
	push	r8					; save r8
	push	DAR
	add		DAR,r8,ZERO			; set the start of the string
nextCharANSI:
	ldbp	r8					; get the character01
	cmpi	r8,0x0				; Null terminated string
	beq		donePrANSIStr		; done if null
	bsr		putCharToANSIScreen	; write out the character
	bra		nextCharANSI
donePrANSIStr:
	pull	DAR					; restore DAR
	pull	r8					; restore r8
	pull	PC					; rts
	
;
; printLinebuffer_ANSI_UART - Print a screen to the current screen position with CRLF at the end
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printLinebuffer_ANSI_UART:
	push	r8					; save r8
	push	DAR
	addi	DAR,r8,0x0			; set the start of the string
nextChar2:
	ldbp	r8					; get the character
	cmpi	r8,0x0				; Null terminated string
	beq		donePrStr2			; done if null
	bsr		writeANSI_UART	; write out the character
	bra		nextChar2
donePrStr2:
	bsr		newLine_ANSI_UART
	pull	DAR					; restore DAR
	pull	r8					; restore r8
	pull	PC					; rts
	
;
; newLine_ANSI_UART - Print out a newLine_ANSI_UART (CR-LF)
;

newLine_ANSI_UART:
	push	r8
	lix		r8,0x0A				; Line Feed
	bsr		writeANSI_UART	; Put the character to the screen
	lix		r8,0x0D				; Carriage Return
	bsr		writeANSI_UART		; Echo character back to the UART
	pull	r8
	pull	PC

;
; newLine_ANSI - Print out a newLine_ANSI (CR-LF)
;

newLine_ANSI:
	push	r8
	lix		r8,0x0A				; Line Feed
	bsr		putCharToANSIScreen	; Put the character to the screen
	lix		r8,0x0D				; Carriage Return
	bsr		putCharToANSIScreen	; Echo character back to the UART
	pull	r8
	pull	PC

;
; clearANSIScreenAndUART - Clear the screen routine
; ANSI Terminal has an escape sequence which clears the screen and homes cursor
;

clearANSIScreenAndUART:
	push	r8				; save r8
	lix		r8,0x1b			; ESC
	bsr		writeANSI_UART
	lix		r8,0x5b			; [
	bsr		writeANSI_UART
	lix		r8,0x32			; 2
	bsr		writeANSI_UART
	lix		r8,0x4A			; J
	bsr		writeANSI_UART
	pull	r8
	pull	PC				; rts

;
; putCharToANSIScreen - Put a character to the screen
; Character to put to screen is in r8
;

putCharToANSIScreen:
	push	r9
	push	PAR
	lix		PAR,0x0		; UART Status
waitScreenTxStat:
	lpl		r9			; Read Status into r9
	andi	r9,r9,0x2
	bez 	waitScreenTxStat
	lix 	PAR,0x1
	spl		r8			; echo the character
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
; returns note
;

setNote:
	push	PAR
	lix		PAR,0x4000
	spl		r8
	pull	PAR
	pull	PC

;
; enableBuzzer
;

enableBuzzer:
	push	r8
	push	PAR
	lix		PAR,0x2800
	lpl		r8
	ori		r8,r8,0x10
	spl		r8
	pull	PAR
	pull	r8
	pull	PC

;
; disableBuzzer
;

disableBuzzer:
	push	r8
	push	PAR
	lix		r9,0xffef		; Buzzer Disable line
	lix		PAR,0x2800
	lpl		r8
	andi	r8,r8,0xffef
	spl		r8
	pull	PAR
	pull	r8
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
	lix		PAR,0x1000	; PS/2 Status
waitPS2RxStat:
	lpl		r9			; Read Status into r9
	andi	r9,r9,0x1
	bez 	waitPS2RxStat
getCharFromPS2:
	lix 	PAR,0x0800
	lpl		r8
	lix		PAR,0x1000	; PS/2 Status
whilePS2RxStat:
	pull	PAR
	pull	r9
	pull	PC

; waitReadPS2_UART
; wait for character from either 
;	the PS/2 keyboard and UART serial
; r8 = read character

waitReadPS2_UART:
	push	PAR
checkCharFromPS2:
	lix		PAR,0x1000	; PS/2 Status
	lpl		r8			; Read Status
	andi	r8,r8,0x1	; =1 when char received
	bez 	checkUARTStat
	lix 	PAR,0x0800	; PS/2 Data
	lpl		r8
	bra		gotPS2Char
checkUARTStat:
	lix		PAR,0x1800	; UART Status
	lpl		r8			; Read Status
	andi 	r8,r8,0x1	; =1 when char received
	bez 	checkCharFromPS2
	lix 	PAR,0x1801	; UART Data
	lpl		r8
gotPS2Char:
	pull	PAR
	pull	PC
	
; checkForCharAndDiscard - Check for a character in UART or PS/2
; Discard the character received
; return whether char was present (1) or no char was present (0)

checkForCharAndDiscard:
	push	PAR
	lix		PAR,0x1000	; PS/2 Status
	lpl		r8			; Read Status
	andi	r8,r8,0x1	; =1 when char received
	bez 	checkUARTStat2
	lix 	PAR,0x0800	; PS/2 Data
	lpl		r8			; throw away char
	lix		r8,0x1
	bra		gotChar
checkUARTStat2:
	lix		PAR,0x1800	; UART Status
	lpl		r8			; Read Status
	andi 	r8,r8,0x1	; =1 when char received
	bez 	noCharReceived
	lix 	PAR,0x1801	; UART Data
	lpl		r8
	lix		r8,1
	bra		gotChar
noCharReceived:
	lix		r8,0
gotChar:
	pull	PAR
	pull	PC

; writeANSI_UART
; write out a character to both 
;	the ANSI screen and the UART

writeANSI_UART:
	bsr		putCharToANSIScreen
	bsr		putCharToUART
	pull	PC
