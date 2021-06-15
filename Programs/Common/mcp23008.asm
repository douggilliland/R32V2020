;--------------------------------------------------------------------
; mcp23008.asm

;
; init_Regs_I2CIO8 - Set IO Dir
;

init_Regs_I2CIO8:
	push	r8
	; Write 0x22 to IOCON register (not sequential operations)
	; I2C_Ctrl = START
	lix		r8,0x01
	bsr		write_I2C_Ctrl_Reg
	; I2C write command at slave address = 0x20
	lix		r8,0x40
	bsr		write_I2C_Data_Address_Reg
	; I2C_Ctrl = IDLE
	lix		r8,0x00
	bsr		write_I2C_Ctrl_Reg
	; MCP23008 IOCON
	lix		r8,0x05
	bsr		write_I2C_Data_Address_Reg
	; I2C_Ctrl = STOP
	lix		r8,0x03		
	bsr		write_I2C_Ctrl_Reg	
	; SEQOP = Disabled, INTPOL = Active-high
	lix		r8,0x22
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
	; I2C_Ctrl = START
	lix		r8,0x01
	bsr		write_I2C_Ctrl_Reg
	; I2C write command at slave address = 0x20
	lix		r8,0x40
	bsr		write_I2C_Data_Address_Reg
	; I2C_Ctrl = IDLE
	lix		r8,0x00
	bsr		write_I2C_Ctrl_Reg
	; MCP23008 OLAT
	lix		r8,0x0A
	bsr		write_I2C_Data_Address_Reg
	; I2C_Ctrl = STOP
	lix		r8,0x03
	bsr		write_I2C_Ctrl_Reg	
	; Data to write is in r8
	pull	r8
	bsr		write_I2C_Data_Address_Reg
	pull	PC
	
;
; readI2CDat_MCP23008 - Read data from the I2C bus
; Address 0x5800 -> DATA (write/read) or SLAVE ADDRESS (write)  
; Address 0x5801 -> Command/Status Register (write/read)
; r8 is the value to write
;

readI2CDat_MCP23008:
	; I2C_Ctrl = START
	lix		r8,0x01
	bsr		write_I2C_Ctrl_Reg
	; WRITE I2C SLAVE ADDRESS
	lix		r8,0x40
	bsr		write_I2C_Data_Address_Reg
	; I2C_Ctrl = STOP
	lix		r8,0x03
	bsr		write_I2C_Ctrl_Reg	
	; WRITE MCP REGISTER NUMBER TO I2C DATA REG (9 = GPIO)
	lix		r8,0x09		
	bsr		write_I2C_Data_Address_Reg
	; I2C_Ctrl = START
	lix		r8,0x01
	bsr		write_I2C_Ctrl_Reg
	; I2C read command at slave address = 0x20
	lix		r8,0x41
	bsr		write_I2C_Data_Address_Reg
	; I2C_Ctrl = IDLE
	lix		r8,0x00		
	bsr		write_I2C_Ctrl_Reg	
	; Read the GPIO line value
	bsr		read_I2C_Data_Reg
	push	r8
	; I2C_Ctrl = STOP
	lix		r8,0x03
	bsr		write_I2C_Ctrl_Reg	
	pull	r8
	pull	PC
	
