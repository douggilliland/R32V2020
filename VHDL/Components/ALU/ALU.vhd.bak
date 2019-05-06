------------------------------------------------------------------
-- ALU
-- https://github.com/douggilliland/R32V2020/wiki/ALU

library ieee;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.numeric_std.all;

entity ALU is
	port (
		Op_AND		: in std_logic;
		Op_XOR		: in std_logic;
		Op_OR			: in std_logic;
		Op_Add		: in std_logic;
		Op_LS1		: in std_logic;
		Op_RS1		: in std_logic;
		Op_LR1		: in std_logic;
		Op_RR1		: in std_logic;
		Op_RA1		: in std_logic;
		regDataA		: in std_logic_vector(31 downto 0);
		regDataB		: in std_logic_vector(31 downto 0);
		ALUDataOut	: out std_logic_vector(31 downto 0);
		CondCodeBits: out std_logic_vector(31 downto 0)
	);
end ALU;

architecture struct of ALU is

signal EqualToZero	: std_logic;
signal EqualToOne		: std_logic;
signal CarrySet		: std_logic;
signal CarryClear		: std_logic;
signal EqualCmp		: std_logic;
signal ALUResult		: std_logic_vector(31 downto 0);

begin

ALUDataOut <= ALUResult;

ALUResult <=  (regDataA and regDataB) when Op_AND = '1' else
					(regDataA or  regDataB) when Op_OR  = '1' else
					(regDataA xor regDataB) when Op_XOR = '1' else
					(regDataA(30 downto 0)&'0') when Op_LS1 = '1' else
					('0'&regDataA(31 downto 1)) when Op_RS1 = '1' else
					(regDataA(30 downto 0)&regDataA(31)) when Op_LR1 = '1' else -- Needs to be rotate not shift
					(regDataA(0)&regDataA(31 downto 1)) when Op_RR1 = '1' else -- Needs to be rotate not shift
					(regDataA(31)&regDataA(31 downto 1)) when Op_RA1 = '1';

EqualToZero	<= '1' when ALUResult = x"0" else '0';
EqualToOne	<= '1' when ALUResult = x"1" else '0';
CarrySet		<= '1' when ((Op_Add = '1') and (regDataA(31) = '1') and (regDataB(31) = '1')) else '0';
EqualCmp    <= '1' when (regDataA = regDataB) else '0';

CondCodeBits <= "000000000000000000000000000"&EqualCmp&CarryClear&CarrySet&EqualToOne&EqualToZero;

end struct;
