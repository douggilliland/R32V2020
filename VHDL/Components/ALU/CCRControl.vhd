-- CCRControl looks at the opcode and determines if the PC should be loaded or incremented

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY CCRControl IS PORT(
	CCR				: IN STD_LOGIC_VECTOR(31 DOWNTO 0);	
	Op_NOP			: IN std_logic;	-- No Operation
	Op_HCF			: IN std_logic;	-- Halt and Catch Fire
	Op_RES			: IN std_logic;	-- Reset CPU
	-- Category = ALU
	Op_ADS			: IN std_logic;	-- Add and store in reg
	Op_MUL			: IN std_logic;	-- Multiply and store in reg
	Op_ORS			: IN std_logic;	-- Logical OR registers and store in reg
	Op_ARS			: IN std_logic;	-- Logical AND registers and store in reg
	Op_XRS			: IN std_logic;	-- Logical XOR registers and store in reg
	Op_LS1			: IN std_logic;	-- Logical Shift register Left by 1 and store in reg
	Op_RS1			: IN std_logic;	-- Logical Shift register Right by 1 and store in reg
	Op_LR1			: IN std_logic;	-- Logical Rotate register Left by 1 and store in reg
	Op_RR1			: IN std_logic;	-- Logical Rotate register Right by 1 and store in reg
	Op_RA1			: IN std_logic;	-- Arithmetic shift register Right by 1 and store in reg
	Op_ENS			: IN std_logic;	-- Swap Endian of register and store in reg
	Op_CMP			: IN std_logic;	-- Compare two registers and set CCR bits accordingly
	-- Category = Immediate values
	Op_LIL			: IN std_logic;	-- Load Immediate lower short
	Op_LIU			: IN std_logic;	-- Load Immediate upper short
	-- Category = Load/Store to/from Data Memory
	Op_LDB			: IN std_logic;	-- Load byte from data memory (read on d7..d0)
	Op_SDB			: IN std_logic;	-- Store byte to data memory (write on d7..d0)
	Op_LDS			: IN std_logic;	-- Load short from data memory (read on d15..d0)
	Op_SDS			: IN std_logic;	-- Store short to data memory (write on d15..d0)
	Op_LDL			: IN std_logic;	-- Load long from data memory (read on d31..d0)
	Op_SDL			: IN std_logic;	-- Store long to data memory (write on d31..d0)
	-- Category = Load/Store to/from Peripheral I/O space
	Op_LPB			: IN std_logic;	-- Load byte from peripheral interface (read on d7..d0)
	Op_SPB			: IN std_logic;	-- Store byte to peripheral interface (write on d7..d0)
	Op_LPS			: IN std_logic;	-- Load short from peripheral interface (read on d15..d0)
	Op_SPS			: IN std_logic;	-- Store short to peripheral interface (write on d15..d0)
	Op_LPL			: IN std_logic;	-- Load long from peripheral interface (read on d31..d0)
	Op_SPL			: IN std_logic;	-- Store long to peripheral interface (write on d31..d0)
	-- Category = Stack
	Op_PSS			: IN std_logic;	-- Stack push
	Op_PUS			: IN std_logic;	-- Stack pull
	Op_LSS			: IN std_logic;	-- Load from Stack space
	Op_SSS			: IN std_logic;	-- Store to Stack space
	-- Category = Flow Control
	Op_JSR 			: IN std_logic;	-- Jump Subroutine
	Op_RTS 			: IN std_logic;	-- Return Subroutine
	Op_BRA 			: IN std_logic;	-- Branch Always
	Op_BCS 			: IN std_logic;	-- Branch if ALU result has Carry Set
	Op_BCC 			: IN std_logic;	-- Branch if ALU result has Carry Clear
	Op_BEZ 			: IN std_logic;	-- Branch if ALU result is Equal to Zero
	Op_BE1 			: IN std_logic;	-- Branch if ALU result is Equal to One
	Op_BOV 			: IN std_logic;	-- Branch if ALU result is an Overflow
	Op_BEQ 			: IN std_logic;	-- Branch if ALU result is Equal
	
	o_save_CCR_bits: OUT STD_LOGIC;	-- CCR bits are modified
	o_TakeBranch	: OUT STD_LOGIC	-- Instruction results in a branch
);
END CCRControl;

ARCHITECTURE description OF CCRControl IS

BEGIN
		o_TakeBranch <= '1' when (
			Op_JSR = '1' or
			Op_RTS = '1' or
			Op_BRA = '1' or
			(Op_BEZ = '1' and CCR(0) = '1') or
			(Op_BE1 = '1' and CCR(1) = '1') or
			(Op_BCS = '1' and CCR(2) = '1') or
			(Op_BCC = '1' and CCR(3) = '1') or
--		(Op_BOV = '1' and CCR() = '1') or
			(Op_BEQ = '1' and CCR(4) = '1'))
		else '0';
		
		o_save_CCR_bits <= '1' when 
			Op_ADS = '1' or
			Op_MUL = '1' or
			Op_ORS = '1' or
			Op_ARS = '1' or
			Op_XRS = '1' or
			Op_LS1 = '1' or
			Op_RS1 = '1' or
			Op_LR1 = '1' or
			Op_RR1 = '1' or
			Op_RA1 = '1'
		else '0';
		
END description;
