------------------------------------------------------------------
-- OpCode_Decoder
-- https://github.com/douggilliland/R32V2020/wiki/Instruction-Decoder

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity OpCode_Cat_Decoder is
	port (
		clk				: in std_logic;
		InstrOpCodeCat	: in std_logic_vector(2 downto 0);
		System_OpCode	: out std_logic;
		ALU_OpCode		: out std_logic;
		Immed_OpCode	: out std_logic;
		LdSt_OpCode		: out std_logic;
		Perip_OpCode	: out std_logic;
		FlowCtl_OpCode	: out std_logic
	);
end OpCode_Cat_Decoder;

architecture struct of OpCode_Cat_Decoder is

begin

System_OpCode 	<= '1' when InstrOpCodeCat = "000" else '0';
ALU_OpCode 		<= '1' when InstrOpCodeCat = "001" else '0';
Immed_OpCode	<= '1' when InstrOpCodeCat = "010" else '0';
LdSt_OpCode		<= '1' when InstrOpCodeCat = "011" else '0';
Perip_OpCode	<= '1' when InstrOpCodeCat = "100" else '0';
FlowCtl_OpCode	<= '1' when InstrOpCodeCat = "101" else '0';

end struct;
