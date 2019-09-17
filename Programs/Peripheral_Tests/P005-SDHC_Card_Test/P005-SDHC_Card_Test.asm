; P005-SDHC_Card_Test - Test the SDHC Card interface
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

prompt:	.string "(R32V2020) SDHC Dump Utility v0.0.1"
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
	bsr		clearScreen_ANSI
	lix		r8,prompt.lower
	bsr		printString_ANSI
	bsr		newLine_ANSI
	lix		r8,10					; give the SD card 10 mS
	bsr		delay_mS
	lix		r8,512					; write to the second block
	bsr		writeBlock_SDHCCard
	lix		r9,0					; start with block 0
readNextBlock:
	lix		r8,blockNumber.lower	; Block Number message
	bsr		printString_ANSI
	addi	r8,r9,0					; print the current block number
	bsr		printLong_ANSI
	bsr		newLine_ANSI
	addi	r8,r9,0					; r9 holds block number, pass in r8
	bsr		readDumpBlock_SDHCCard
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
; readDumpBlock_SDHCCard
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

readDumpBlock_SDHCCard:
	push	r8
	push	r9
	push	r10
	push	r11
	push	PAR
	lix		PAR,0x1001			; SDSTATUS
waitForSDStatusRdRdy:
	lpl		r9
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
	lix		r11,24				; print newLine_ANSI every 24 values
	lix		r9,512				; 512 characters to read
nextSDReadChar:
	lix		PAR,0x1001			; SDSTATUS
waitSDCharPresent:
	lpb		r10
	cmpi	r10,0xE0
	bne		waitSDCharPresent
	lix		PAR,0x1000			; SDDATA
	lpb		r8
	bsr		printByte_ANSI		; char is in r8
	lix		r8,0x20
	bsr		putChar_ANSI ; space between characters
	subi	r11,r11,1
	bnz		skipNewLineSDBlockRd
	bsr		newLine_ANSI		; print newLine_ANSI every 24 values
	lix		r11,24
skipNewLineSDBlockRd:
	subi	r9,r9,1
	bnz		nextSDReadChar
	pull	PAR
	pull	r11
	pull	r10
	pull	r9
	pull	r8
	pull	PC
	
;
; writeBlock_SDHCCard
;
; To write a 512-byte block to the SDHC card:
; Wait until SDSTATUS=0x80 (ensures previous cmd has completed)
; Write SDLBA0, SDLBA1 SDLBA2 to select block index to write to
; Write 1 to SDCONTROL to issue write command
; Loop 512 times:
;     Wait until SDSTATUS=0xA0 (block busy)
;     Write byte to SDDATA
; r8 = passes the block number
;

writeBlock_SDHCCard:
	push	r8
	push	r9
	push	r10
	push	PAR
	lix		PAR,0x1001			; SDSTATUS
waitForSDStatusWrRdy:
	lpl		r9
	cmpi	r9,0x80
	bne		waitForSDStatusWrRdy
;	sr8		r8,r8				; Shift SD card block address right by 9 bits for SD cards
;	sr1		r8,r8
	lix		PAR,0x1002
	spbp	r8					; SDLBA0
	sr8		r8,r8
	spbp	r8					; SDLBA1
	sr8		r8,r8
	spb		r8					; SDLBA2
	lix		r9,1				; Write 0 to SDCONTROL to issue write command
	lix		PAR,0x1001			; SDCONTROL
	spb		r9
	lix		r9,512				; 512 characters to read
	lix		r11,24				; print newLine_ANSI every 24 values
nextSDWriteChar:
	lix		PAR,0x1001			; SDSTATUS
waitSDCharPresentWr:
	lpb		r10
	cmpi	r10,0xA0
	bne		waitSDCharPresentWr
	lix		PAR,0x1000			; SDDATA
	lix		r8,0xAA
	spb		r8
	subi	r9,r9,1
	bnz		nextSDWriteChar
	pull	PAR
	pull	r10
	pull	r9
	pull	r8
	pull	PC

#include <..\..\common\ps2.asm>
#include <..\..\common\uart.asm>
#include <..\..\common\ANSIScreen.asm>
#include <..\..\common\ANSI_UART_io.asm>
#include <..\..\common\timers.asm>
