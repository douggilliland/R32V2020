-- CCRControl looks at the opcode and determines if the PC should be loaded or incremented

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY CCRControl IS PORT(
	Op_ADS			: IN std_logic;	-- Add and store in reg
	Op_MUL			: IN std_logic;	-- Multiply and store in reg
	Op_ORS			: IN std_logic;	-- Logical OR registers and store in reg
	Op_ARS			: IN std_logic;	-- Logical AND registers and store in reg
	Op_XRS			: IN std_logic;	-- Logical XOR registers and store in reg
	Op_LS1			: IN std_logic;	-- Logical Shift register Left by 1 and store in reg
	Op_LS8			: IN std_logic;	-- Logical Shift register Left by 8 and store in reg
	Op_RS1			: IN std_logic;	-- Logical Shift register Right by 1 and store in reg
	Op_RS8			: IN std_logic;	-- Logical Shift register Right by 8 and store in reg
	Op_LR1			: IN std_logic;	-- Logical Rotate register Left by 1 and store in reg
	Op_RR1			: IN std_logic;	-- Logical Rotate register Right by 1 and store in reg
	Op_RA1			: IN std_logic;	-- Arithmetic shift register Right by 1 and store in reg
	Op_CMP			: IN std_logic;	-- Compare two registers and set CCR bits accordingly
	o_save_CCR_bits: OUT STD_LOGIC	-- CCR bits are modified
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
		-- Opcodes that store the CCR bits
		o_save_CCR_bits <= Op_ADS or Op_MUL or Op_ORS or Op_ARS or Op_XRS or Op_LS1 or Op_LS8 or Op_RS1 or Op_RS8 or Op_LR1 or Op_RR1 or Op_RA1 or Op_CMP;
		
END description;
