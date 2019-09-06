; P006-SDHC_Blk_Rd_Test - Read a block from the SDHC Card into Data RAM
;
; Testing on A-ESTF FPGA development card
;	http://land-boards.com/blwiki/index.php?title=A-ESTF_V2_EP4CE22_Board
; Not all FPGA cards have built-in SD Card sockets
; On other cards, should be able to wire up to IO pins (if there are any)
; Dumps SDHC Card to the ANSI VGA screen
;
; There are three types of SD cards
; SDSC - Standard Capacity SD cards (up to 2 GB)
; SDHC - High Capacity SD cards (>2GB up to 32 GB)
; SDXC - Extra Capacity SD cards (>32 GB) - not currently supported
;
; For SDHC, the read/write address parameter is the ordinal number of 512-byte block 
; the 9 low address bits are implicitly 0. 
; The 24 programmable address bits select the 512-byte block.
; This gives an address capacity of 2^24 * 512 = 8GByte.
; SDHC can be upto 32GByte but this design can only access the low 8GByte. 
; The SDLBA registers are used like this:
;  31 30 29 28.27 26 25 24.23 22 21 20.19 18 17 16.15 14 13 12.11 10 09 08.07 06 05 04.03 02 01 00
;   0  0  0  0  0  0  0  0+---------- SDLBA2 -----+------- SDLBA1 --------+------- SDLBA0 --------+
;
; There is a constant in the VHDL code which is automatically set when the card is initialized.
;	signal sdhc : std_logic := '0';
;	-- set to 0 for SDSC cards
;	-- set to non-0 for SDHC cards
;
; Original VHDL code was based on the Multicomp design by Grant Searle
; Adapted from design by Steven J. Merrifield, June 2008
;	https://pastebin.com/HW3ru1cC
; Read states are derived from the Apple II emulator by Stephen Edwards
;	https://github.com/MiSTer-devel/Apple-II_MiSTer
; Enhanced by Neal Crook to support SDHC cards
;	https://github.com/nealcrook/multicomp6809/tree/master/multicomp/Components/SDCARD
; SDHC can be upto 32GByte but this design can only access the low 8GByte
; Code for R32V2020 RISC CPU
;
; SD Card base address is x1000
; Register Addresses
;    0x1000    SDDATA        read/write data
;    0x1001    SDSTATUS      read
;    0x1001    SDCONTROL     write
;    0x1002    SDLBA0        write-only
;    0x1003    SDLBA1        write-only
;    0x1004    SDLBA2        write-only (only bits 6:0 are valid)
;
; To read a 512-byte block from the SDHC card:
; Wait until SDSTATUS=0x80 (ensures previous cmd has completed)
; Write SDLBA0, SDLBA1 SDLBA2 to select block index to read from
; Write 0 to SDCONTROL to issue read command
; Loop 512 times:
;     Wait until SDSTATUS=0xE0 (read byte ready, block busy)
;     Read byte from SDDATA
;
; To write a 512-byte block to the SDHC card:
; Wait until SDSTATUS=0x80 (ensures previous cmd has completed)
; Write SDLBA0, SDLBA1 SDLBA2 to select block index to write to
; Write 1 to SDCONTROL to issue write command
; Loop 512 times:
;     Wait until SDSTATUS=0xA0 (block busy)
;     Write byte to SDDATA
;
; Using additional DataRAM block for I/O buffer storage
; 	Block is 1KB - 256x32-bits
;	Allows for write buffer and 1 read buffer of 512bytes length
;	RAM starts at A12=1 (4KB and up) = 0x1000
;	Write buffer @ 0x1000-0x11ff
;	Read buffer @ 0x1200-0x13ff
;

prompt:	.string "(R32V2020) SDHC Data RAM Test Utility v0.0.1"
missingHandshake: .string "*** Run PuTTY and enable hardware handshake ***"
screenPtr:	.long 0x0000
screenBase:	.long 0x0
syntaxError:	.string "*** Bad number error (at a2h_Error) ***"
anyKeyToContinue:	.string "Hit any key to continue"
blockNumber:	.string "Block Address : 0x"

;
; Write the second block of the SD card with a fixed pattern of data
; Read an SD card block - one block at a time
; Prints the contents of the block to the ANSI screen
; Hit a key on the PS/2 keyboard to advance to the next block
; r9 = block number
;

main:
	lix		PAR,0x3000
	lix		r8,0x1
	spl		r8
	bsr		clearScreen_ANSI
	lix		r8,prompt.lower
	bsr		printString_ANSI
	bsr		newLine_ANSI
	lix		PAR,0x3000
	lix		r8,0x2
	spl		r8
	lix		r8,10					; give the SD card 10 mS
	bsr		delay_mS
	lix		PAR,0x3000
	lix		r8,0x3
	spl		r8
	bsr		fillTxBufferRAM
	lix		PAR,0x3000
	lix		r8,0x4
	spl		r8
	lix		r8,1					; write to the second block
	bsr		writeBufferRAMToSDHCCard
	lix		PAR,0x3000
	lix		r8,0x5
	spl		r8
	lix		r9,0					; start with block 0
readNextBlock:
	lix		r8,blockNumber.lower	; Block Number message
	bsr		printString_ANSI
	addi	r8,r9,0
	bsr		printLong_ANSI
	bsr		newLine_ANSI
	lix		PAR,0x3000
	lix		r12,0x6
	spl		r12
	bsr		readSDHCCardIntoRdBufferRAM
	lix		PAR,0x3000
	lix		r8,0x7
	spl		r8
	bsr		newLine_ANSI
	lix		r8,anyKeyToContinue.lower
	bsr		printString_ANSI
	bsr		getChar_PS2
	bsr		newLine_ANSI
	addi	r9,r9,1					; Go to next block address
	bra		readNextBlock
loopForever:
	bra		loopForever
	

;
; readSDHCCardIntoRdBufferRAM
;
; To read a 512-byte block from the SDHC card:
; Wait until SDSTATUS=0x80 (ensures previous cmd has completed)
; Write SDLBA0, SDLBA1 SDLBA2 to select block index to read from
; Write 0 to SDCONTROL to issue read command
; Loop 512 times:
;     Wait until SDSTATUS=0xE0 (read byte ready, block busy)
;     Read byte from SDDATA
; r8 = passes the block number
; The SDLBA registers for SDHC are used like this:
;  31 30 29 28.27 26 25 24.23 22 21 20.19 18 17 16.15 14 13 12.11 10 09 08.07 06 05 04.03 02 01 00
;   0  0  0  0  0  0  0  0+---------- SDLBA2 -----+------- SDLBA1 --------+------- SDLBA0 --------+
; r8 = passes the block number
;
;	Read buffer @ 0x1200-0x13ff
;

readSDHCCardIntoRdBufferRAM:
	push	r8
	push	r9
	push	r10
	push	PAR
	push	DAR
	lix		DAR,0x1200			; Start of the Read buffer in Data Memory
	lix		PAR,0x1001			; SDSTATUS
waitForSDStatusRdRdy:
	lpb		r9
	cmpi	r9,0x80
	bne		waitForSDStatusRdRdy
	lix		PAR,0x1002
	spbp	r8					; SDLBA0
	sr8		r8,r8
	spbp	r8					; SDLBA1
	sr8		r8,r8
	spb		r8					; SDLBA2
	lix		r8,0				; Write 0 to SDCONTROL to issue read command
	lix		PAR,0x1001			; SDCONTROL
	spb		r8
	lix		r9,512				; 512 characters to read
nextSDReadChar:
	lix		PAR,0x1001			; SDSTATUS
waitSDCharPresent:
	lpb		r8
	cmpi	r8,0xE0			; read byte ready
	bne		waitSDCharPresent
	lix		PAR,0x1000			; SDDATA - read data from SPI data buffer
	lpb		r8					; read byte from SD Card
	sdbp	r8					; Store byte into Data Memory
	subi	r9,r9,1
	bnz		nextSDReadChar
	pull	DAR
	pull	PAR
	pull	r10
	pull	r9
	pull	r8
	pull	PC

;
; fillTxBufferRAM - Fill the buffer RAM with a sort of ramp
;

fillTxBufferRAM:
	push	r8
	push	DAR
	lix		r8,512
	lix		DAR,0x1000			; Start of the Write buffer in Data Memory
moreTxBuffWr:
	sdbp	r8
	subi	r8,r8,1
	cmpi	r8,0
	bne		moreTxBuffWr
	pull	DAR
	pull	r8
	pull	PC
	
;
; writeBufferRAMToSDHCCard
;
; To write a 512-byte block to the SDHC card:
; Wait until SDSTATUS=0x80 (ensures previous cmd has completed)
; Write SDLBA0, SDLBA1 SDLBA2 to select block index to write to
; Write 1 to SDCONTROL to issue write command
; Loop 512 times:
;     Wait until SDSTATUS=0xA0 (block busy)
;     Write byte to SDDATA
; r8 = passes the block number
; r9 is the decrementing byte counter
;
;	Write buffer @ 0x1000-0x11ff
;

writeBufferRAMToSDHCCard:
	push	r8
	push	r9
	push	r10
	push	PAR
	push	DAR
	lix		PAR,0x1001			; SDSTATUS
	lix		DAR,0x1000			; Start of the Write buffer in Data Memory
waitForSDStatusWrRdy:
	lpb		r9
	cmpi	r9,0x80
	bne		waitForSDStatusWrRdy
	lix		PAR,0x1002
	spbp	r8					; SDLBA0
	sr8		r8,r8
	spbp	r8					; SDLBA1
	sr8		r8,r8
	spb		r8					; SDLBA2
	lix		PAR,0x1001			; SDCONTROL
	lix		r8,1				; Write 1 to SDCONTROL to issue write command
	spb		r8
	lix		r9,512				; 512 characters to write
nextSDWriteChar:
	lix		PAR,0x1001			; SDSTATUS address
waitSDCharPresentWr:
	lpb		r8
	cmpi	r8,0xA0				; 0xA0 flags that the previous transfer is complete
	bne		waitSDCharPresentWr
	lix		PAR,0x1000			; SDDATA address
	ldbp	r10					; Get data from the data buffer memory
	spb		r10					; Write out to SPI bus
	subi	r9,r9,1
	bnz		nextSDWriteChar
	pull	DAR
	pull	PAR
	pull	r10
	pull	r9
	pull	r8
	pull	PC
	
;
; getChar_PS2
; returns character received in r8
;

getChar_PS2:
	push	PAR
	lix		PAR,0x0801	; PS/2 Status
waitPS2RxStat:
	lpl		r8			; Read Status into r9
	andi 	r8,r8,1
	bez 	waitPS2RxStat
getCharFromPS2:
	lix 	PAR,0x0800
	lpl		r8
whilePS2RxStat:
	pull	PAR
	pull	PC

;
; waitCharPolled_PS2 - Check the polled character interface
; wait for a character
; return when a character is present
; returns character received in r8
;

waitCharPolled_PS2:
	push	PAR
	lix		PAR,0x0803	; PS/2 Status
waitPS2RxStatPolled:
	lpl		r8			; Read Status into r8
	andi 	r8,r8,0x1
	bez 	waitPS2RxStatPolled
getCharFromPS2Polled:
	lix 	PAR,0x0802
	lpl		r8
whilePS2RxStatPolled:
	pull	PAR
	pull	PC

;
; checkGetStat_PS2 - Checks the polling status
; Polled interface is active while the keyboard key is pressed
; returns 
;	-1 if there is no character, 
;	character if there is a character
;

checkGetStat_PS2:
	push	PAR
	lix		PAR,0x0803	; PS/2 Status
	lpl		r8			; Read Status into r8
	andi	r8,r8,0x1
	bez		charNotPresent
	lix		PAR,0x0802
	lpl		r8
	bra		gotCharIn
charNotPresent:
	add		r8,ZERO,MINUS1
gotCharIn:
	pull	PAR
	pull	PC

;
; putChar_UART - Put a character to the UART
; passed character in r8 is sent out the UART
;

putChar_UART:
	push	PAR
	push	r8
	lix		PAR,0x1800	; UART Status
waitUartTxStat:
	lpl		r8			; Read Status into r8
	andi 	r8,r8,0x2
	bnz 	uartRdy
; Remind user to enable HW handshake
; would be better to add a HW handshake timeout
; Since the USB is so much faster it is unlikely this path 
;	will be exercised. 
; For cards with RS-232 serial this would be a serious concern
; It's more likely that PuTTY needed to be run in HW handshake mode.
handshakeStuck:
	lix		r8,missingHandshake.lower
	bsr		printString_ANSI
	pull	r8
	bra		getOut
uartRdy:
	lix 	PAR,0x1801
	pull	r8
	spl		r8			; echo the character
getOut:
	pull	PAR
	pull	PC
	
;
; printString_ANSI - Print a screen to the current screen position
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printString_ANSI:
	push	r8					; save r8
	push	DAR
	addi	DAR,r8,0x0		; set the start of the string
nextCharANSI:
	ldbp	r8					; get the character01
	cmpi	r8,0x0				; Null terminated string
	beq		donePrANSIStr		; done if null
	bsr		putChar_ANSI	; write out the character
	bra		nextCharANSI
donePrANSIStr:
	pull	DAR					; restore DAR
	pull	r8					; restore r8
	pull	PC					; rts
	
;
; clearScreen_ANSI - Clear the screen routine
; ANSI Terminal has an escape sequence which clears the screen and homes cursor
; No passed value
; Uses r8 (saved during function)
; no return value
;

clearScreen_ANSI:
	push	r8				; save r8
	lix		r8,0x1b			; ESC
	bsr		putChar_ANSI
	lix		r8,0x5b			; [
	bsr		putChar_ANSI
	lix		r8,0x32			; 2
	bsr		putChar_ANSI
	lix		r8,0x4A			; J
	bsr		putChar_ANSI
	pull	r8
	pull	PC				; rts

;
; putChar_ANSI - Put a character to the screen
; r8 - Character to put to screen
; r8 - returns character that was sent to screen
;

putChar_ANSI:
	push	PAR
	push	r8
	lix		PAR,0x0		; ANSI Screen (UART-style) Status
waitScreenTxStat:
	lpl		r8			; Read Status into r9
	andi 	r8,r8,0x2
	bez 	waitScreenTxStat
	lix 	PAR,0x1		; ANSI Screen (UART-style) Data
	pull	r8
	spb		r8			; send character to the screen
	pull	PAR
	pull	PC
	
; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Routine uses r9

delay_mS:
	push	r8
	push	r9
	lix		PAR,0x3802		; address of the mSec counter
	lpl		r9				; read the peripheral counter into r9
	add		r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_mS:
	lpl		r9				; check the elapsed time counter
	cmp		r8,r9
	blt		loop_delay_mS
	pull	r9
	pull	r8
	pull	PC

; convLineBuff2DigASCIIToHex7Seg - Convert a two ASCII digit value into a hex byte
; Passed: r8 points to the start of the hex string
; Returned: r8 contains the hex value of the string
; Put the byte to the Seven Segment Display
;

convLineBuff2DigASCIIToHex7Seg:
	push	r9
	push	DAR
	push	PAR
	lix		r9,0
	add		DAR,r8,ZERO		; Address of lineBuff (passed into this routine)
	ldbp	r8
	bsr		asciiCharToHexNibble
	cmpi	r8,0xDEAD
	beq		badHexVal
	andi	r8,r8,0xf
	or		r9,r9,r8
	sl1		r9,r9
	sl1		r9,r9
	sl1		r9,r9
	sl1		r9,r9
	ldb		r8
	bsr		asciiCharToHexNibble
	cmpi	r8,0xDEAD
	beq		badHexVal
	andi	r8,r8,0xf
	or		r9,r9,r8
	lix		PAR,0x3000		; seven segment display
	spl		r9
	add		r8,r9,ZERO
	bra		valOKDone
badHexVal:
	lix		r8,syntaxError.lower
	bsr		newLine_ANSI_UART
	bsr		printString_ANSI_UART
	bsr		newLine_ANSI_UART
	lix		r8,0xDEAD
valOKDone:
	pull	PAR
	pull	DAR
	pull	r9
	pull	PC

;
; asciiCharToHexNibble - Convert a single ASCII hex character into a nibble
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

asciiCharToHexNibble:
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
	bsr		newLine_ANSI_UART
	bsr		printString_ANSI_UART
	bsr		newLine_ANSI_UART
	lix		r8,0xDEAD
doneConvA2H:
	pull	PC

;
; printLong_ANSI_UART
; r8 contains the long value to print
;

printLong_ANSI_UART:
	push	r8
	push	r9
	push	r8				; temporarily save r8
	lix		r8,0x30			; print 0x
	bsr		putChar_ANSI_UART
	lix		r8,0x78
	bsr		putChar_ANSI_UART
	pull	r8				; restore r8
	lix		r9,8			; loop counter
doNextprintLong_ANSI_UART:
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	bsr		printHexVal_ANSI_UART
	subi	r9,r9,1
	bnz		doNextprintLong_ANSI_UART
	pull	r9
	pull	r8
	pull	PC

;
; printLong_ANSI
; r8 contains the long value to print
;

printLong_ANSI:
	push	r8
	push	r9
	push	r8				; temporarily save r8
	lix		r8,0x30			; print 0x
	bsr		putChar_ANSI
	lix		r8,0x78
	bsr		putChar_ANSI
	pull	r8				; restore r8
	lix		r9,8			; loop counter
doNextprintLong_ANSI:
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	bsr		printHexVal_ANSI
	subi	r9,r9,1
	bnz		doNextprintLong_ANSI
	pull	r9
	pull	r8
	pull	PC

;
; printShort_ANSI_UART
; r8 contains the short value to print
;

printShort_ANSI_UART:
	push	r8
	push	r9
	push	r8				; temporarily save r8
	lix		r8,0x30			; print 0x
	bsr		putChar_ANSI_UART
	lix		r8,0x78
	bsr		putChar_ANSI_UART
	pull	r8				; restore r8
	lix		r9,4			; loop counter
	sl8		r8,r8
	sl8		r8,r8
doNextprintShort_ANSI_UART:
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	bsr		printHexVal_ANSI_UART
	subi	r9,r9,1
	bnz		doNextprintShort_ANSI_UART
	pull	r9
	pull	r8
	pull	PC

;
; printByte_ANSI_UART
; r8 contains the char value to print
;

printByte_ANSI_UART:
	push	r8
	push	r9
	push	r8				; temporarily save r8
	lix		r8,0x30			; print 0x
	bsr		putChar_ANSI_UART
	lix		r8,0x78
	bsr		putChar_ANSI_UART
	pull	r8				; restore r8
	lix		r9,2			; loop counter
	sl8		r8,r8
	sl8		r8,r8
	sl8		r8,r8
doNextprintByte_ANSI_UART:
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	bsr		printHexVal_ANSI_UART
	subi	r9,r9,1
	bnz		doNextprintByte_ANSI_UART
	pull	r9
	pull	r8
	pull	PC
	
;
; printByte_ANSI
; r8 contains the char value to print
;

printByte_ANSI:
	push	r8
	push	r9
	push	r8				; temporarily save r8
	pull	r8				; restore r8
	lix		r9,2			; loop counter
	sl8		r8,r8
	sl8		r8,r8
	sl8		r8,r8
doNextprintByte_ANSI:
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	bsr		printHexVal_ANSI
	subi	r9,r9,1
	bnz		doNextprintByte_ANSI
	pull	r9
	pull	r8
	pull	PC
	
; putChar_ANSI_UART
; write out a character to both 
;	the ANSI screen and the UART

putChar_ANSI_UART:
	bsr		putChar_ANSI
	bsr		putChar_UART
	pull	PC

;
; printHexVal_ANSI_UART
;

printHexVal_ANSI_UART:
	push	r8
	andi	r8,r8,0xf
	cmpi	r8,9
	blt		printHexLetter
	addi	r8,r8,0x30
	bsr		putChar_ANSI_UART
	bra		donePrintHexVal
printHexLetter:
	addi	r8,r8,0x37		; 'A' - 10
	bsr		putChar_ANSI_UART
donePrintHexVal:
	pull	r8
	pull	PC

;
; printHexVal_ANSI_UART
;

printHexVal_ANSI:
	push	r8
	andi	r8,r8,0xf
	cmpi	r8,9
	blt		printHexLetterANSI
	addi	r8,r8,0x30
	bsr		putChar_ANSI
	bra		donePrintHexValANSI
printHexLetterANSI:
	addi	r8,r8,0x37		; 'A' - 10
	bsr		putChar_ANSI
donePrintHexValANSI:
	pull	r8
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
	addi	DAR,r8,0			; set the start of the string
nextChar:
	ldbp	r8					; get the character01
	cmpi	r8,0x0				; Null terminated string
	beq		donePrStr			; done if null
	bsr		putChar_ANSI_UART	; write out the character
	bra		nextChar
donePrStr:
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
	bsr		printString_ANSI	; write out the character
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
	bsr		putChar_ANSI_UART	; Put the character to the screen
	lix		r8,0x0D				; Carriage Return
	bsr		putChar_ANSI_UART		; Echo character back to the UART
	pull	r8
	pull	PC

;
; newLine_ANSI - Print out a newLine_ANSI (CR-LF)
;

newLine_ANSI:
	push	r8
	lix		r8,0x0A				; Line Feed
	bsr		putChar_ANSI	; Put the character to the screen
	lix		r8,0x0D				; Carriage Return
	bsr		putChar_ANSI	; Echo character back to the UART
	pull	r8
	pull	PC

;
; clearScreen_ANSI_UART - Clear the screen routine
; ANSI Terminal has an escape sequence which clears the screen and homes cursor
;

clearScreen_ANSI_UART:
	push	r8				; save r8
	lix		r8,0x1b			; ESC
	bsr		putChar_ANSI_UART
	lix		r8,0x5b			; [
	bsr		putChar_ANSI_UART
	lix		r8,0x32			; 2
	bsr		putChar_ANSI_UART
	lix		r8,0x4A			; J
	bsr		putChar_ANSI_UART
	pull	r8
	pull	PC				; rts

	