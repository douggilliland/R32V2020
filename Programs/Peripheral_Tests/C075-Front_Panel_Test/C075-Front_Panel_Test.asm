; 
; Uses Front Panel card
;	http://land-boards.com/blwiki/index.php?title=Front_Panel_For_8_Bit_Computers
; Controller for a Front Panel
; 32 LEDs, 32 pushbuttons
;		16 - Address LEDS/pushbuttons
;		8  - Data LEDS/pushbuttons
;		8  - Status LEDs
;		8  - Control pusbuttons
;	Card has a 4x MCP23017 I/O Expander ICs
;	PORTA = 8xPushbuttons
;	PORTB = 8xLEDs
;

prompt:			.string "Front Panel Test "
; Not using the following data values but included for future use
; i2c_addr_wr:	.long 0x48
; i2c_addr_rd:	.long 0x49
; i2c_reg_addr:	.long 0x00
; i2c_wr_val:		.long 0x00

;
; main
; Read I2C and write it back out
;

main:
	; bsr		clearScreen			; Not required for this example
	; lix		r8,prompt.lower
	; bsr		printString
; Code to initialize I2CIO8 card then read/write loop
	bsr		init_Regs_FrontPanel_01	; initialize the MCP23017 on the I2CIO8
; loopMain:
	; bsr		readI2CDat_MCP23017	; read headers
	; sr1		r8,r8				; shift header data down to LEDs
	; sr1		r8,r8
	; sr1		r8,r8
	; sr1		r8,r8
	; xor		r8,r8,MINUS1		; invert headers
	; bsr		wrI2CAdrDat_MCP23017	; write to LEDs
	; lix		r8,10
	; bsr		delay_mS
	; bra		loopMain
loopForever:
	bra		loopForever
	
;
; init_Regs_FrontPanel_01 - Set IO Dir
;
;	wrReg_MCP23017(chipAddr,MCP23017_IODIRA_REGADR,MCP23017_IODIR_ALL_INS);     // IO: Port A is switches = inputs
;	wrReg_MCP23017(chipAddr,MCP23017_IODIRB_REGADR,MCP23017_IODIR_ALL_OUTS);    // IO: Port B is LEDs = outputs
;	wrReg_MCP23017(chipAddr,MCP23017_IPOLA_REGADR,MCP23017_IPOL_INVERT);        // IP: Invert input pins on Port A
;	wrReg_MCP23017(chipAddr,MCP23017_GPINTENA_REGADR,MCP23017_GPINTEN_ENABLE);  // GPINT: Enable interrupts for switches
;	wrReg_MCP23017(chipAddr,MCP23017_GPINTENB_REGADR,MCP23017_GPINTEN_DISABLE); // GPINT: Disable interrupts for LED outputs
;	wrReg_MCP23017(chipAddr,MCP23017_DEFVALA_REGADR,MCP23017_DEFVALA_DEFVAL);   // Default value for pin (interrupt)
;	wrReg_MCP23017(chipAddr,MCP23017_INTCONA_REGADR,MCP23017_INTCON_PREVPIN);    // Int for change from default value
;	wrReg_MCP23017(chipAddr,MCP23017_IOCONA_REGADR,MCP23017_IOCON_DEFVAL);      
;	wrReg_MCP23017(chipAddr,MCP23017_IOCONB_REGADR,MCP23017_IOCON_DEFVAL);      // Int for change from previous pin
;	wrReg_MCP23017(chipAddr,MCP23017_GPPUA_REGADR,MCP23017_GPPU_ENABLE);        // Pull-up to switches
;	readRegister_MCP23017(chipAddr,MCP23017_INTCAPA_REGADR);                            // Clears interrupt
;
; #define MCP23017_IODIRA_REGADR   0x00
; #define MCP23017_IODIRB_REGADR   0x01
; #define MCP23017_IPOLA_REGADR    0x02
; #define MCP23017_IPOLB_REGADR    0x03
; #define MCP23017_GPINTENA_REGADR 0x04
; #define MCP23017_GPINTENB_REGADR 0x05
; #define MCP23017_DEFVALA_REGADR  0x06
; #define MCP23017_DEFVALB_REGADR  0x07
; #define MCP23017_INTCONA_REGADR  0x08
; #define MCP23017_INTCONB_REGADR  0x09
; #define MCP23017_IOCONA_REGADR   0x0a
; #define MCP23017_IOCONB_REGADR   0x0b
; #define MCP23017_GPPUA_REGADR    0x0c
; #define MCP23017_GPPUB_REGADR    0x0d
; #define MCP23017_INTFA_REGADR    0x0e
; #define MCP23017_INTFB_REGADR    0x0f
; #define MCP23017_INTCAPA_REGADR  0x10
; #define MCP23017_INTCAPB_REGADR  0x11
; #define MCP23017_GPIOA_REGADR    0x12
; #define MCP23017_GPIOB_REGADR    0x13
; #define MCP23017_OLATA_REGADR    0x14
; #define MCP23017_OLATB_REGADR    0x15
; #define MCP23017_IODIR_DEFVAL    0xff       // Initially set all channels to inputs
; #define MCP23017_IODIR_ALL_INS   0xff
; #define MCP23017_IODIR_ALL_OUTS  0x00

; #define MCP23017_IPOL_INVERT     0xFF       // Input polarity = invert jumpers
; #define MCP23017_GPINTEN_DISABLE 0x00       // Disable GPIO for interrupt on change
; #define MCP23017_GPINTEN_ENABLE  0xFF       // Enable GPIO for interrupt on change
; #define MCP23017_DEFVALA_DEFVAL  0x00       // Default vales of interrupt state
; #define MCP23017_INTCON_DEFVAL   0xFF       // Int for different from default value
; #define MCP23017_INTCON_PREVPIN  0x00       // Int for change from previous pin
; #define MCP23017_IOCON_DEFVAL    0x04       // Disable sequential,  active-low
; #define MCP23017_GPPU_DISABLE    0x00       // Disable pull-ups
; #define MCP23017_GPPU_ENABLE     0xFF       // Enable pull-ups

; #define MCP23017_0  0x24    // Base address of the first MCP23017 (status/control bits)
; #define MCP23017_1  0x25    // Base address of the second MCP23017 (address bus a8-a15)
; #define MCP23017_2  0x26    // Base address of the third MCP23017 (address bus a0-a7)
; #define MCP23017_3  0x27    // Base address of the fourth MCP23017 (data bus d0-d7)

;
; init_Regs_FrontPanel_01 - Initialize the Front Panel MCP23017 Registers
;
init_Regs_FrontPanel_01:
	push	r8
	push	r9
	push	r10
	push	r11
	; Init MCP32017 #1 registers
	; wrReg_MCP23017(chipAddr,MCP23017_IODIRA_REGADR,MCP23017_IODIR_ALL_INS)
	lix		r9,0x48		; I2C write command at slave address = 0x24
	lix		r10,0x00	; MCP23017_IODIRA_REGADR
	lix		r11,0xFF	; MCP23017_IODIR_ALL_INS
	bsr		wrReg_MCP23017
	; wrReg_MCP23017(chipAddr,MCP23017_IODIRB_REGADR,MCP23017_IODIR_ALL_OUTS)
;	lix		r9,0x48		; I2C write command at slave address = 0x24
	lix		r10,0x01	; MCP23017_IODIRB_REGADR
	lix		r11,0x00	; MCP23017_IODIR_ALL_OUTS
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_IPOLA_REGADR,MCP23017_IPOL_INVERT);        // IP: Invert input pins on Port A
;	lix		r9,0x48		; I2C write command at slave address = 0x24
	lix		r10,0x02	; MCP23017_IPOLA_REGADR
	lix		r11,0xFF	; MCP23017_IPOL_INVERT
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_GPINTENA_REGADR,MCP23017_GPINTEN_ENABLE);  // GPINT: Enable interrupts for switches
;	lix		r9,0x48		; I2C write command at slave address = 0x24
	lix		r10,0x04	; MCP23017_GPINTENA_REGADR
	lix		r11,0xFF	; MCP23017_GPINTEN_ENABLE
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_GPINTENB_REGADR,MCP23017_GPINTEN_DISABLE); // GPINT: Disable interrupts for LED outputs
;	lix		r9,0x48		; I2C write command at slave address = 0x24
	lix		r10,0x05	; MCP23017_GPINTENB_REGADR
	lix		r11,0x00	; MCP23017_GPINTEN_DISABLE
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_DEFVALA_REGADR,MCP23017_DEFVALA_DEFVAL);   // Default value for pin (interrupt)
;	lix		r9,0x48		; I2C write command at slave address = 0x24
	lix		r10,0x06	; MCP23017_DEFVALA_REGADR
	lix		r11,0x00	; MCP23017_DEFVALA_DEFVAL
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_INTCONA_REGADR,MCP23017_INTCON_PREVPIN);    // Int for change from default value
;	lix		r9,0x48		; I2C write command at slave address = 0x24
	lix		r10,0x08	; MCP23017_INTCONA_REGADR
	lix		r11,0x00	; MCP23017_INTCON_PREVPIN
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_IOCONA_REGADR,MCP23017_IOCON_DEFVAL);      
;	lix		r9,0x48		; I2C write command at slave address = 0x24
	lix		r10,0x0a	; MCP23017_IOCONA_REGADR
	lix		r11,0x04	; MCP23017_IOCON_DEFVAL
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_IOCONB_REGADR,MCP23017_IOCON_DEFVAL);      // Int for change from previous pin
;	lix		r9,0x48		; I2C write command at slave address = 0x24
	lix		r10,0x0b	; MCP23017_IOCONB_REGADR
	lix		r11,0x04	; MCP23017_IOCON_DEFVAL
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_GPPUA_REGADR,MCP23017_GPPU_ENABLE);        // Pull-up to switches
;	lix		r9,0x48		; I2C write command at slave address = 0x24
	lix		r10,0x0c	; MCP23017_GPPUA_REGADR
	lix		r11,0xFF	; MCP23017_GPPU_ENABLE
	bsr		wrReg_MCP23017

	; Init MCP32017 #2 registers
	; wrReg_MCP23017(chipAddr,MCP23017_IODIRA_REGADR,MCP23017_IODIR_ALL_INS)
	lix		r9,0x4A		; I2C write command at slave address = 0x25
	lix		r10,0x00	; MCP23017_IODIRA_REGADR
	lix		r11,0xFF	; MCP23017_IODIR_ALL_INS
	bsr		wrReg_MCP23017
	; wrReg_MCP23017(chipAddr,MCP23017_IODIRB_REGADR,MCP23017_IODIR_ALL_OUTS)
;	lix		r9,0x48		; I2C write command at slave address = 0x25
	lix		r10,0x01	; MCP23017_IODIRB_REGADR
	lix		r11,0x00	; MCP23017_IODIR_ALL_OUTS
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_IPOLA_REGADR,MCP23017_IPOL_INVERT);        // IP: Invert input pins on Port A
;	lix		r9,0x48		; I2C write command at slave address = 0x25
	lix		r10,0x02	; MCP23017_IPOLA_REGADR
	lix		r11,0xFF	; MCP23017_IPOL_INVERT
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_GPINTENA_REGADR,MCP23017_GPINTEN_ENABLE);  // GPINT: Enable interrupts for switches
;	lix		r9,0x48		; I2C write command at slave address = 0x25
	lix		r10,0x04	; MCP23017_GPINTENA_REGADR
	lix		r11,0xFF	; MCP23017_GPINTEN_ENABLE
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_GPINTENB_REGADR,MCP23017_GPINTEN_DISABLE); // GPINT: Disable interrupts for LED outputs
;	lix		r9,0x48		; I2C write command at slave address = 0x25
	lix		r10,0x05	; MCP23017_GPINTENB_REGADR
	lix		r11,0x00	; MCP23017_GPINTEN_DISABLE
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_DEFVALA_REGADR,MCP23017_DEFVALA_DEFVAL);   // Default value for pin (interrupt)
;	lix		r9,0x48		; I2C write command at slave address = 0x25
	lix		r10,0x06	; MCP23017_DEFVALA_REGADR
	lix		r11,0x00	; MCP23017_DEFVALA_DEFVAL
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_INTCONA_REGADR,MCP23017_INTCON_PREVPIN);    // Int for change from default value
;	lix		r9,0x48		; I2C write command at slave address = 0x25
	lix		r10,0x08	; MCP23017_INTCONA_REGADR
	lix		r11,0x00	; MCP23017_INTCON_PREVPIN
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_IOCONA_REGADR,MCP23017_IOCON_DEFVAL);      
;	lix		r9,0x48		; I2C write command at slave address = 0x25
	lix		r10,0x0a	; MCP23017_IOCONA_REGADR
	lix		r11,0x04	; MCP23017_IOCON_DEFVAL
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_IOCONB_REGADR,MCP23017_IOCON_DEFVAL);      // Int for change from previous pin
;	lix		r9,0x48		; I2C write command at slave address = 0x25
	lix		r10,0x0b	; MCP23017_IOCONB_REGADR
	lix		r11,0x04	; MCP23017_IOCON_DEFVAL
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_GPPUA_REGADR,MCP23017_GPPU_ENABLE);        // Pull-up to switches
;	lix		r9,0x48		; I2C write command at slave address = 0x25
	lix		r10,0x0c	; MCP23017_GPPUA_REGADR
	lix		r11,0xFF	; MCP23017_GPPU_ENABLE
	bsr		wrReg_MCP23017

	; Init MCP32017 #3 registers
	; wrReg_MCP23017(chipAddr,MCP23017_IODIRA_REGADR,MCP23017_IODIR_ALL_INS)
	lix		r9,0x4C		; I2C write command at slave address = 0x26
	lix		r10,0x00	; MCP23017_IODIRA_REGADR
	lix		r11,0xFF	; MCP23017_IODIR_ALL_INS
	bsr		wrReg_MCP23017
	; wrReg_MCP23017(chipAddr,MCP23017_IODIRB_REGADR,MCP23017_IODIR_ALL_OUTS)
;	lix		r9,0x48		; I2C write command at slave address = 0x26
	lix		r10,0x01	; MCP23017_IODIRB_REGADR
	lix		r11,0x00	; MCP23017_IODIR_ALL_OUTS
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_IPOLA_REGADR,MCP23017_IPOL_INVERT);        // IP: Invert input pins on Port A
;	lix		r9,0x48		; I2C write command at slave address = 0x26
	lix		r10,0x02	; MCP23017_IPOLA_REGADR
	lix		r11,0xFF	; MCP23017_IPOL_INVERT
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_GPINTENA_REGADR,MCP23017_GPINTEN_ENABLE);  // GPINT: Enable interrupts for switches
;	lix		r9,0x48		; I2C write command at slave address = 0x26
	lix		r10,0x04	; MCP23017_GPINTENA_REGADR
	lix		r11,0xFF	; MCP23017_GPINTEN_ENABLE
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_GPINTENB_REGADR,MCP23017_GPINTEN_DISABLE); // GPINT: Disable interrupts for LED outputs
;	lix		r9,0x48		; I2C write command at slave address = 0x26
	lix		r10,0x05	; MCP23017_GPINTENB_REGADR
	lix		r11,0x00	; MCP23017_GPINTEN_DISABLE
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_DEFVALA_REGADR,MCP23017_DEFVALA_DEFVAL);   // Default value for pin (interrupt)
;	lix		r9,0x48		; I2C write command at slave address = 0x26
	lix		r10,0x06	; MCP23017_DEFVALA_REGADR
	lix		r11,0x00	; MCP23017_DEFVALA_DEFVAL
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_INTCONA_REGADR,MCP23017_INTCON_PREVPIN);    // Int for change from default value
;	lix		r9,0x48		; I2C write command at slave address = 0x26
	lix		r10,0x08	; MCP23017_INTCONA_REGADR
	lix		r11,0x00	; MCP23017_INTCON_PREVPIN
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_IOCONA_REGADR,MCP23017_IOCON_DEFVAL);      
;	lix		r9,0x48		; I2C write command at slave address = 0x26
	lix		r10,0x0a	; MCP23017_IOCONA_REGADR
	lix		r11,0x04	; MCP23017_IOCON_DEFVAL
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_IOCONB_REGADR,MCP23017_IOCON_DEFVAL);      // Int for change from previous pin
;	lix		r9,0x48		; I2C write command at slave address = 0x26
	lix		r10,0x0b	; MCP23017_IOCONB_REGADR
	lix		r11,0x04	; MCP23017_IOCON_DEFVAL
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_GPPUA_REGADR,MCP23017_GPPU_ENABLE);        // Pull-up to switches
;	lix		r9,0x48		; I2C write command at slave address = 0x26
	lix		r10,0x0c	; MCP23017_GPPUA_REGADR
	lix		r11,0xFF	; MCP23017_GPPU_ENABLE
	bsr		wrReg_MCP23017

	; Init MCP32017 #4 registers
	; wrReg_MCP23017(chipAddr,MCP23017_IODIRA_REGADR,MCP23017_IODIR_ALL_INS)
	lix		r9,0x4E		; I2C write command at slave address = 0x27
	lix		r10,0x00	; MCP23017_IODIRA_REGADR
	lix		r11,0xFF	; MCP23017_IODIR_ALL_INS
	bsr		wrReg_MCP23017
	; wrReg_MCP23017(chipAddr,MCP23017_IODIRB_REGADR,MCP23017_IODIR_ALL_OUTS)
;	lix		r9,0x48		; I2C write command at slave address = 0x27
	lix		r10,0x01	; MCP23017_IODIRB_REGADR
	lix		r11,0x00	; MCP23017_IODIR_ALL_OUTS
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_IPOLA_REGADR,MCP23017_IPOL_INVERT);        // IP: Invert input pins on Port A
;	lix		r9,0x48		; I2C write command at slave address = 0x27
	lix		r10,0x02	; MCP23017_IPOLA_REGADR
	lix		r11,0xFF	; MCP23017_IPOL_INVERT
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_GPINTENA_REGADR,MCP23017_GPINTEN_ENABLE);  // GPINT: Enable interrupts for switches
;	lix		r9,0x48		; I2C write command at slave address = 0x27
	lix		r10,0x04	; MCP23017_GPINTENA_REGADR
	lix		r11,0xFF	; MCP23017_GPINTEN_ENABLE
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_GPINTENB_REGADR,MCP23017_GPINTEN_DISABLE); // GPINT: Disable interrupts for LED outputs
;	lix		r9,0x48		; I2C write command at slave address = 0x27
	lix		r10,0x05	; MCP23017_GPINTENB_REGADR
	lix		r11,0x00	; MCP23017_GPINTEN_DISABLE
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_DEFVALA_REGADR,MCP23017_DEFVALA_DEFVAL);   // Default value for pin (interrupt)
;	lix		r9,0x48		; I2C write command at slave address = 0x27
	lix		r10,0x06	; MCP23017_DEFVALA_REGADR
	lix		r11,0x00	; MCP23017_DEFVALA_DEFVAL
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_INTCONA_REGADR,MCP23017_INTCON_PREVPIN);    // Int for change from default value
;	lix		r9,0x48		; I2C write command at slave address = 
	lix		r10,0x08	; MCP23017_INTCONA_REGADR
	lix		r11,0x00	; MCP23017_INTCON_PREVPIN
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_IOCONA_REGADR,MCP23017_IOCON_DEFVAL);      
;	lix		r9,0x48		; I2C write command at slave address = 0x27
	lix		r10,0x0a	; MCP23017_IOCONA_REGADR
	lix		r11,0x04	; MCP23017_IOCON_DEFVAL
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_IOCONB_REGADR,MCP23017_IOCON_DEFVAL);      // Int for change from previous pin
;	lix		r9,0x48		; I2C write command at slave address = 0x27
	lix		r10,0x0b	; MCP23017_IOCONB_REGADR
	lix		r11,0x04	; MCP23017_IOCON_DEFVAL
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_GPPUA_REGADR,MCP23017_GPPU_ENABLE);        // Pull-up to switches
;	lix		r9,0x48		; I2C write command at slave address = 0x27
	lix		r10,0x0c	; MCP23017_GPPUA_REGADR
	lix		r11,0xFF	; MCP23017_GPPU_ENABLE
	bsr		wrReg_MCP23017

	;	wrReg_MCP23017(chipAddr,MCP23017_OLATB_REGADR,defaultVal);        // Pull-up to switches
	lix		r9,0x48		; I2C write command at slave address = 0x24
	lix		r10,0x15	; MCP23017_OLATB_REGADR
	lix		r11,0x00	; defaultVal
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_OLATB_REGADR,defaultVal);        // Pull-up to switches
	lix		r9,0x4A		; I2C write command at slave address = 0x24
	lix		r10,0x15	; MCP23017_OLATB_REGADR
	lix		r11,0x00	; defaultVal
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_OLATB_REGADR,defaultVal);        // Pull-up to switches
	lix		r9,0x4C		; I2C write command at slave address = 0x24
	lix		r10,0x15	; MCP23017_OLATB_REGADR
	lix		r11,0x00	; defaultVal
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_OLATB_REGADR,defaultVal);        // Pull-up to switches
	lix		r9,0x4E		; I2C write command at slave address = 0x24
	lix		r10,0x15	; MCP23017_OLATB_REGADR
	lix		r11,0x00	; defaultVal
	bsr		wrReg_MCP23017
	
	lix		r8,1000
	bsr		delay_mS
looper:
	lix		PAR,0x3802		; address of the mSec counter
	lpl		r11				; read the counter peripheral into r11

	;	wrReg_MCP23017(chipAddr,MCP23017_OLATB_REGADR,defaultVal);        // Pull-up to switches
	lix		r9,0x48		; I2C write command at slave address = 0x24
	lix		r10,0x15	; MCP23017_OLATB_REGADR
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_OLATB_REGADR,defaultVal);        // Pull-up to switches
	lix		r9,0x4A		; I2C write command at slave address = 0x25
	lix		r10,0x15	; MCP23017_OLATB_REGADR
	sr8		r11,r11
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_OLATB_REGADR,defaultVal);        // Pull-up to switches
	lix		r9,0x4C		; I2C write command at slave address = 0x26
	lix		r10,0x15	; MCP23017_OLATB_REGADR
	sr8		r11,r11
	bsr		wrReg_MCP23017
	;	wrReg_MCP23017(chipAddr,MCP23017_GPPUA_REGADR,defaultVal);        // Pull-up to switches
	lix		r9,0x4E		; I2C write command at slave address = 0x27
	lix		r10,0x15	; MCP23017_OLATB_REGADR
	sr8		r11,r11
	bsr		wrReg_MCP23017
	bra		looper
	pull	r11
	pull	r10
	pull	r9
	pull	r8
	pull	PC

;
; wrReg_MCP23017(chipAddr,regAddr,regVal)
; r8 = Control values
; Pass values
; r9 = chipAddr
; r10 = regAddr
; r11 = regVal
;

wrReg_MCP23017:
	push	r8
	lix		r8,0x01		; I2C_Ctrl = START
	bsr		write_I2C_Ctrl_Reg
	add		r8,r9,r0	; I2C write command at slave address = 0x24
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x00		; I2C_Ctrl = IDLE
	bsr		write_I2C_Ctrl_Reg
	lix		r8,0x05		; MCP23017 IOCON
	add		r8,r10,r0	; Register number
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x03		; I2C_Ctrl = STOP
	bsr		write_I2C_Ctrl_Reg	
	add		r8,r11,r0	; Register value
	bsr		write_I2C_Data_Address_Reg
	pull	r8
	pull	PC

;
; wrI2CAdrDat_MCP23017 - Write address to the I2C bus
; Address 0x5800 -> DATA (write/read) or SLAVE ADDRESS (write)  
; Address 0x5801 -> Command/Status Register (write/read)
; r8 is the value to write
;

wrI2CAdrDat_MCP23017:
	push	r8
	lix		r8,0x01		; I2C_Ctrl = START
	bsr		write_I2C_Ctrl_Reg
	lix		r8,0x40		; I2C write command at slave address = 0x20
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x00		; I2C_Ctrl = IDLE
	bsr		write_I2C_Ctrl_Reg	
	lix		r8,0x0A		; MCP23017 OLAT
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x03		; I2C_Ctrl = STOP
	bsr		write_I2C_Ctrl_Reg	
	pull	r8			; Data to write is in r8
	bsr		write_I2C_Data_Address_Reg
	pull	PC
	
;
; readI2CDat_MCP23017 - Read data from the I2C bus
; Address 0x5800 -> DATA (write/read) or SLAVE ADDRESS (write)  
; Address 0x5801 -> Command/Status Register (write/read)
; r8 is the value to write
;

readI2CDat_MCP23017:
	; write the GPIO address register
	lix		r8,0x01		; I2C_Ctrl = START
	bsr		write_I2C_Ctrl_Reg
	lix		r8,0x40		; I2C write command at slave address = 0x20
	bsr		write_I2C_Data_Address_Reg
	lix		r8,0x03		; I2C_Ctrl = STOP
	bsr		write_I2C_Ctrl_Reg	
	lix		r8,0x09		; MCP23017 - GPIO register address
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
;	lix		r8,20
;	bsr		delay_uS
	pull	PAR
	pull	PC

;
; read_I2C_Data_Reg - Read I2C data into r8
;

read_I2C_Data_Reg:
	push	PAR
	lix		PAR,0x5800	; I2C Data Address
	lix		r8,0x54		; not sure why this is here
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
	lix		PAR,0x5801	; Control register
i2c_ack_loop:
	lpl		r8
	and		r8,r8,r1	; busy bit is least significant bit
	be1		i2c_ack_loop
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
	push	DAR
	add		DAR,r8,ZERO		; set the start of the string
nextChar:
	ldb		r8				; get the character
	cmp		r8,ZERO			; Null terminated string
	beq		donePrStr		; done if null
	bsr		putCharToANSIScreen	; write out the character
	add		DAR,DAR,r1		; Point to next character
	bra		nextChar
donePrStr:
	pull	DAR				; restore DAR
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
