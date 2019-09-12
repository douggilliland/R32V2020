-- Wrap_Data_Ram.vhd
-- Wrapper for the Data RAM 
-- Provides chip Selects and data routing for byte, short, long read/writes

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

library work;
use work.R32V2020_Pkg.all;

ENTITY Wrap_Data_Ram IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR;
		clock			: IN STD_LOGIC  := '1';
		dataIn		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		i_loadData  : IN STD_LOGIC  := '0';
		i_storeData : IN STD_LOGIC  := '0';
		i_longData  : IN STD_LOGIC  := '0';
		i_shortData : IN STD_LOGIC  := '0';
		i_ByteData  : IN STD_LOGIC  := '0';
		rden			: IN STD_LOGIC  := '0';
		wren			: IN STD_LOGIC := '0';
		dataOut		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END Wrap_Data_Ram;


ARCHITECTURE SYN OF Wrap_Data_Ram IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL uuByteWrEn	: STD_LOGIC := '0';
	SIGNAL umByteWrEn	: STD_LOGIC := '0';
	SIGNAL lmByteWrEn	: STD_LOGIC := '0';
	SIGNAL llByteWrEn	: STD_LOGIC := '0';
	SIGNAL uuWrDataByte	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL umWrDataByte	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL lmWrDataByte	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL llWrDataByte	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL dataOutFromRAM	: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dataOutFromRAM2	: STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

	-- Data out from the RAM gets routed to the proper lanes
	dataOut(31 downto 16) <= dataOutFromRAM(31 downto 16)  when ((address(12) = '0') and (i_loadData = '1') and (i_longData  = '1')) else
									 dataOutFromRAM2(31 downto 16) when ((address(12) = '1') and (i_loadData = '1') and (i_longData  = '1')) else
									 x"0000";
	dataOut(15 downto 8)  <= dataOutFromRAM(15 downto 8)   when ((address(12) = '0') and (i_loadData = '1') and (i_longData  = '1')) 								else
									 dataOutFromRAM(31 downto 24)  when ((address(12) = '0') and (i_loadData = '1') and (i_shortData = '1') and (address(1) = '0'))	else
									 dataOutFromRAM(15 downto 8)   when ((address(12) = '0') and (i_loadData = '1') and (i_shortData = '1') and (address(1) = '1'))	else
									 dataOutFromRAM2(15 downto 8)  when ((address(12) = '1') and (i_loadData = '1') and (i_longData  = '1'))									else
									 dataOutFromRAM2(31 downto 24) when ((address(12) = '1') and (i_loadData = '1') and (i_shortData = '1') and (address(1) = '0'))	else
									 dataOutFromRAM2(15 downto 8)  when ((address(12) = '1') and (i_loadData = '1') and (i_shortData = '1') and (address(1) = '1'))	else
									 x"00";
	dataOut(7 downto 0)   <= 
									 dataOutFromRAM(7 downto 0)   when  ((address(12) = '0') and (i_loadData = '1') and (i_longData = '1')) else
									 dataOutFromRAM(15 downto 8)  when  ((address(12) = '0') and (i_loadData = '1') and (i_shortData = '1') and (address(1) = '0')) else
									 dataOutFromRAM(31 downto 24) when  ((address(12) = '0') and (i_loadData = '1') and (i_byteData = '1')  and (address(1) = '0') and (address(0) = '0')) else
									 dataOutFromRAM(23 downto 16) when  ((address(12) = '0') and (i_loadData = '1') and (i_byteData = '1')  and (address(1) = '0') and (address(0) = '1')) else
									 dataOutFromRAM(15 downto 8)  when  ((address(12) = '0') and (i_loadData = '1') and (i_byteData = '1')  and (address(1) = '1') and (address(0) = '0')) else
									 dataOutFromRAM(7 downto 0)   when  ((address(12) = '0') and (i_loadData = '1') and (i_byteData = '1')  and (address(1) = '1') and (address(0) = '1')) else
									 dataOutFromRAM2(7 downto 0)   when ((address(12) = '1') and (i_loadData = '1') and (i_longData = '1')) else
									 dataOutFromRAM2(15 downto 8)  when ((address(12) = '1') and (i_loadData = '1') and (i_shortData = '1') and (address(1) = '0')) else
									 dataOutFromRAM2(31 downto 24) when ((address(12) = '1') and (i_loadData = '1') and (i_byteData = '1')  and (address(1) = '0') and (address(0) = '0')) else
									 dataOutFromRAM2(23 downto 16) when ((address(12) = '1') and (i_loadData = '1') and (i_byteData = '1')  and (address(1) = '0') and (address(0) = '1')) else
									 dataOutFromRAM2(15 downto 8)  when ((address(12) = '1') and (i_loadData = '1') and (i_byteData = '1')  and (address(1) = '1') and (address(0) = '0')) else
									 dataOutFromRAM2(7 downto 0)   when ((address(12) = '1') and (i_loadData = '1') and (i_byteData = '1')  and (address(1) = '1') and (address(0) = '1')) else
									 x"00";

	-- Write enables for the byte lanes
	uuByteWrEn <= ((i_storeData and i_longData)                       or
						(i_storeData and i_shortData and (not address(1))) or
						(i_storeData and i_ByteData and (not address(1)) and (not address(0))));
	umByteWrEn <= ((i_storeData and i_longData)                       or
						(i_storeData and i_shortData and (not address(1))) or
						(i_storeData and i_ByteData and (not address(1) and address(0))));
	lmByteWrEn <= ((i_storeData and i_longData)                       or
						(i_storeData and i_shortData and address(1))       or
						(i_storeData and i_ByteData and address(1) and (not address(0))));
	llByteWrEn <= ((i_storeData and i_longData)                       or
						(i_storeData and i_shortData and address(1))       or
						(i_storeData and i_ByteData and address(1) and address(0)));

	-- Selector/Mux for the data into the RAM	
	uuWrDataByte <= 	dataIn(31 downto 24) when i_longData = '1' else
							dataIn(15 downto 8) when ((i_shortData = '1') and (address(1) = '0')) else
							dataIn(7 downto 0) when ((i_byteData = '1') and (address(1 downto 0) = "00")) else
							x"00";
	umWrDataByte <= 	dataIn(23 downto 16) when i_longData = '1' else
							dataIn(7 downto 0) when ((i_shortData = '1') and (address(1) = '0')) else
							dataIn(7 downto 0) when ((i_byteData = '1') and (address(1 downto 0) = "01")) else
							x"00";
	lmWrDataByte <= 	dataIn(15 downto 8) when (i_longData = '1') else
							dataIn(15 downto 8) when ((i_shortData = '1') and (address(1) = '1')) else
							dataIn(7 downto 0) when ((i_byteData = '1') and (address(1 downto 0) = "10")) else
							x"00";
	llWrDataByte <= dataIn(7 downto 0);
	
	Data_RAM_1 : entity work.BlockRam_Data
	PORT MAP (
		address 		=> address(11 downto 2),
		clock 		=> clock,
		data 			=> uuWrDataByte&umWrDataByte&lmWrDataByte&llWrDataByte,
		byteena		=> uuByteWrEn&umByteWrEn&lmByteWrEn&llByteWrEn,
		rden			=> rden and (not address(12)),
		wren 			=> wren and (not address(12)),
		q 				=> dataOutFromRAM
	);
	
--	Data_RAM_2 : entity work.BlockRam_Data2
--	PORT MAP (
--		address 		=> address(9 downto 2),
--		clock 		=> clock,
--		data 			=> uuWrDataByte&umWrDataByte&lmWrDataByte&llWrDataByte,
--		byteena		=> uuByteWrEn&umByteWrEn&lmByteWrEn&llByteWrEn,
--		rden			=> rden and address(12),
--		wren 			=> wren and address(12),
--		q 				=> dataOutFromRAM2
--	);
		
end;
