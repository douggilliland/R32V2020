------------------------------------------------------------------
-- ALU
-- https://github.com/douggilliland/R32V2020/wiki/ALU

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity ALU is
	port (
		clk			: in std_logic;
		Op_AND		: in std_logic;
		Op_XOR		: in std_logic;
		Op_OR			: in std_logic;
		Op_Add		: in std_logic;
		regDataA		: in std_logic_vector(31 downto 0);
		regDataB		: in std_logic_vector(31 downto 0);
		ALUDataOut	: out std_logic_vector(31 downto 0)
	);
end ALU;

architecture struct of ALU is

begin

ALUDataOut <=  (regDataA and regDataB) when Op_AND = '1' else
					(regDataA or  regDataB) when Op_OR  = '1' else
					(regDataA xor regDataB) when Op_XOR = '1';

end struct;
