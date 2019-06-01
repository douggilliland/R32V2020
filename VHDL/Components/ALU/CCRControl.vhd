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
	Op_BRA 			: IN std_logic;	-- Branch Always
	Op_BEZ 			: IN std_logic;	-- Branch if ALU result is Equal to Zero
	Op_BE1 			: IN std_logic;	-- Branch if ALU result is Equal to One
	Op_BNZ 			: IN std_logic;	-- Branch if ALU result is not zero
	Op_BCC 			: IN std_logic;	-- Branch if ALU result has Carry Clear
	Op_BCS 			: IN std_logic;	-- Branch if ALU result has Carry Set
	Op_BLT 			: IN std_logic;	-- Branch if ALU result is Less Than
	Op_BGT 			: IN std_logic;	-- Branch if ALU result is Greater Than
	Op_BEQ 			: IN std_logic;	-- Branch if ALU result is Equal
	Op_BNE 			: IN std_logic;	-- Branch if ALU result is Equal
	o_save_CCR_bits: OUT STD_LOGIC;	-- CCR bits are modified
	o_TakeBranch	: OUT STD_LOGIC	-- Instruction results in a branch
);
END CCRControl;

ARCHITECTURE description OF CCRControl IS

constant CCR_BEZ : integer := 0;
constant CCR_BE1 : integer := 1;
constant CCR_BNZ : integer := 2;
constant CCR_BCC : integer := 3;
constant CCR_BCS : integer := 4;
constant CCR_BLT : integer := 5;
constant CCR_BGT : integer := 6;
constant CCR_BEQ : integer := 7;
constant CCR_BNE : integer := 8;

BEGIN
		o_TakeBranch <= (Op_BRA or
			(Op_BEZ and CCR(CCR_BEZ)) or
			(Op_BE1 and CCR(CCR_BE1)) or
			(Op_BNZ and CCR(CCR_BNZ)) or
			(Op_BCC and CCR(CCR_BCC)) or
			(Op_BCS and CCR(CCR_BCS)) or
			(Op_BLT and CCR(CCR_BLT)) or
			(Op_BGT and CCR(CCR_BGT)) or
			(Op_BEQ and CCR(CCR_BEQ)) or
			(Op_BNE and CCR(CCR_BNE)));
		
		-- Opcodes that store the CCR bits
		o_save_CCR_bits <= Op_ADS or Op_MUL or Op_ORS or Op_ARS or Op_XRS or Op_LS1 or Op_RS1 or Op_LR1 or Op_RR1 or Op_RA1 or Op_CMP;
		
END description;
