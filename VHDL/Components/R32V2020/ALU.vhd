------------------------------------------------------------------
-- ALU
-- https://github.com/douggilliland/R32V2020/wiki/ALU

library ieee;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.numeric_std.all;

library work;
use work.R32V2020_Pkg.all;

entity ALU is
	port (
		i_immedVal		: in std_logic_vector(15 downto 0) := x"0000";
		i_regDataA		: in std_logic_vector(31 downto 0) := x"00000000";
		i_regDataB		: in std_logic_vector(31 downto 0) := x"00000000";
		i_Op_ADD			: in std_logic := '0';
		i_Op_ADDI		: in std_logic := '0';
		i_Op_SUB			: in std_logic := '0';
		i_Op_SUBI		: in std_logic := '0';
		i_Op_MUL			: in std_logic := '0';
		i_Op_MULI		: in std_logic := '0';
		i_Op_AND			: in std_logic := '0';
		i_Op_ANDI		: in std_logic := '0';
		i_Op_XOR			: in std_logic := '0';
		i_Op_XORI		: in std_logic := '0';
		i_Op_OR			: in std_logic := '0';
		i_Op_ORI			: in std_logic := '0';
		i_Op_CMP			: in std_logic := '0';
		i_Op_CMPI		: in std_logic := '0';
		i_Op_SL1			: in std_logic := '0';
		i_Op_SL8			: in std_logic := '0';
		i_Op_SR1			: in std_logic := '0';
		i_Op_SR8			: in std_logic := '0';
		i_Op_ROL1		: in std_logic := '0';
		i_Op_ROR1		: in std_logic := '0';
		i_Op_ASR			: in std_logic := '0';
		i_Op_ENS			: in std_logic := '0';
 		o_ALUDataOut	: out std_logic_vector(31 downto 0);
		o_CondCodeBits	: out std_logic_vector(31 downto 0)
	);
end ALU;

architecture struct of ALU is

signal w_EqualToZero	: std_logic;
signal w_NotZero		: std_logic;
signal w_EqualToOne	: std_logic;
signal w_CarryClear	: std_logic;
signal w_CarrySet		: std_logic;
signal w_GreaterThan	: std_logic;
signal w_LessThan		: std_logic;
signal w_EqualCmp		: std_logic;
signal w_NotEqualCmp	: std_logic;

signal w_ALUResult	: std_logic_vector(32 downto 0);
signal multResult	: std_logic_vector(63 downto 0);
signal multResultLong : std_logic_vector(32 downto 0);

begin

o_ALUDataOut <= w_ALUResult(31 downto 0);
multResult <= 	i_regDataA * i_regDataB when i_Op_MUL = '1' else
					i_regDataA * (x"0000" & i_immedVal) when i_Op_MULI = '1';
multResultLong <= multResult(32 downto 0);

w_ALUResult <= ((i_regDataA(31)&i_regDataA) + (i_regDataB(31)&i_regDataB)) when i_Op_ADD = '1' else
					((i_regDataB(31)&i_regDataB) + i_immedVal) when i_Op_ADDI = '1' else
					((i_regDataA(31)&i_regDataA) - (i_regDataB(31)&i_regDataB)) when i_Op_SUB = '1' else
					((i_regDataB(31)&i_regDataB) - i_immedVal) when i_Op_SUBI = '1' else
					multResultLong when i_Op_MUL = '1' else		-- added multiply
					(('0'&i_regDataA) and i_regDataB) when i_Op_AND = '1' else
					(('0'&i_regDataB) and i_immedVal) when i_Op_ANDI = '1' else
					(('0'&i_regDataA) or  i_regDataB) when i_Op_OR  = '1' else
					(('0'&i_regDataB) or  i_immedVal) when i_Op_ORI  = '1' else
					(('0'&i_regDataA) xor i_regDataB) when i_Op_XOR = '1' else
					(('0'&i_regDataB) xor i_immedVal) when i_Op_XORI = '1' else
					(('0'&i_regDataA(30 downto 0)&'0')) when i_Op_SL1 = '1' else
					(('0'&i_regDataA(23 downto 0)&x"00")) when i_Op_SL8 = '1' else
					("00"&i_regDataA(31 downto 1)) when i_Op_SR1 = '1' else
					('0'&x"00"&i_regDataA(31 downto 8)) when i_Op_SR8 = '1' else
					('0'&i_regDataA(30 downto 0)&i_regDataA(31)) when i_Op_ROL1 = '1' else -- Needs to be rotate not shift
					('0'&i_regDataA(0)&i_regDataA(31 downto 1)) when i_Op_ROR1 = '1' else -- Needs to be rotate not shift
					('0'&i_regDataA(31)&i_regDataA(31 downto 1)) when i_Op_ASR = '1'else
					('0'&i_regDataA(7 downto 0)&i_regDataA(15 downto 8)&i_regDataA(23 downto 16)&i_regDataA(31 downto 24)) when i_Op_ENS = '1' else
					x"00000000"&'0';

w_EqualToZero	<= '1' when w_ALUResult = '0'&x"00000000" else '0';
w_NotZero		<= '1' when w_ALUResult /= '0'&x"00000000" else '0';
w_EqualToOne	<= '1' when w_ALUResult = '0'&x"00000001" else '0';
w_CarrySet		<= '1' when ((((i_Op_ADD = '1') or (i_Op_SUB = '1')) and (w_ALUResult(32) = '1')) or ((multResult(63 downto 32) /= "00000000") and (i_Op_MUL = '1'))) else '0';
w_CarryClear	<= '1' when (((i_Op_ADD = '1') and (w_ALUResult(32) = '0')) or ((multResult(63 downto 32)  = "00000000") and (i_Op_MUL = '1')))  else '0';
w_GreaterThan  <= '1' when ((i_regDataA            > i_regDataB) and i_Op_CMP  = '1') else 
						'1' when (((x"0000"&i_immedVal)  > i_regDataB) and i_Op_CMPI = '1') else '0';
w_LessThan  	<= '1' when ((i_regDataA            < i_regDataB) and i_Op_CMP  = '1') else 
						'1' when (((x"0000"&i_immedVal)  < i_regDataB) and i_Op_CMPI = '1') else '0';
w_EqualCmp    	<= '1' when ((i_regDataA 			   = i_regDataB) and i_Op_CMP  = '1') else 
						'1' when (((x"0000"&i_immedVal)  = i_regDataB) and i_Op_CMPI = '1') else '0';
w_NotEqualCmp  <= '1' when ((i_regDataA           /= i_regDataB) and i_Op_CMP  = '1') else 
						'1' when (((x"0000"&i_immedVal) /= i_regDataB) and i_Op_CMPI = '1') else '0';

o_CondCodeBits <= x"00000"&			-- bits 12-31
						"000" &				-- bits 9-11
						w_NotEqualCmp 	&	-- bit 8
						w_EqualCmp 		&	-- bit 7
						w_GreaterThan 	&	-- bit 6
						w_LessThan 		&	-- bit 5
						w_CarrySet 		&	-- bit 4
						w_CarryClear 	&	-- bit 3
						w_NotZero 		&	-- bit 2
						w_EqualToOne 	&	-- bit 1
						w_EqualToZero;		-- bit 0

end struct;
