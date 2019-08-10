-- CCRControl looks at the opcode and determines if the PC should be loaded or incremented

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

library work;
use work.R32V2020_Pkg.all;

ENTITY CCRControl IS PORT(
	Op_ADD			: IN std_logic;	-- Add and store in reg
	Op_SUB			: IN std_logic;	-- Subtract and store in reg
	Op_MUL			: IN std_logic;	-- Multiply and store in reg
	Op_OR				: IN std_logic;	-- Logical OR registers and store in reg
	Op_AND			: IN std_logic;	-- Logical AND registers and store in reg
	Op_XOR			: IN std_logic;	-- Logical XOR registers and store in reg
	Op_SL1			: IN std_logic;	-- Logical Shift register Left by 1 and store in reg
	Op_SL8			: IN std_logic;	-- Logical Shift register Left by 8 and store in reg
	Op_SR1			: IN std_logic;	-- Logical Shift register Right by 1 and store in reg
	Op_SR8			: IN std_logic;	-- Logical Shift register Right by 8 and store in reg
	Op_ROL1			: IN std_logic;	-- Logical Rotate register Left by 1 and store in reg
	Op_ROR1			: IN std_logic;	-- Logical Rotate register Right by 1 and store in reg
	Op_ASR			: IN std_logic;	-- Arithmetic shift register Right by 1 and store in reg
	Op_CMP			: IN std_logic;	-- Compare two registers and set CCR bits accordingly
	o_save_CCR_bits: OUT STD_LOGIC	-- CCR bits are modified
);
END CCRControl;

ARCHITECTURE description OF CCRControl IS

BEGIN
		-- Opcodes that store the CCR bits
		o_save_CCR_bits <= Op_ADD or Op_SUB or Op_MUL or Op_OR or Op_AND or Op_XOR 
		or Op_SL1 or Op_SL8 or Op_SR1 or Op_SR8 or Op_ROL1 or Op_ROR1 or Op_ASR 
		or Op_CMP;
		
END description;
