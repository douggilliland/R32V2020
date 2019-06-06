-- FlowControl controls whether or not branches are taken

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY FlowControl IS PORT(
	CCR				: IN STD_LOGIC_VECTOR(31 DOWNTO 0);	
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
END FlowControl;

ARCHITECTURE description OF FlowControl IS

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
		
		
END description;
