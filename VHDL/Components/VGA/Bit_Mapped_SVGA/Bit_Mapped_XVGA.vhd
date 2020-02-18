-- XGA
-- 800x600

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Bit_Mapped_XVGA is
	port(
		n_reset		: in std_logic;
		Video_Clk	: in std_logic;
		CLK_50		: in std_logic;
		n_dispRamCS	: in std_logic;
		n_memWR		: in std_logic;
		cpuAddress	: in std_logic_vector(14 downto 0);
		cpuDataOut	: in std_logic_vector(7 downto 0);
		dataOut		: out std_logic_vector(7 downto 0);
		VoutVect		: out std_logic_vector(5 downto 0);
		hSync			: out	std_logic;
		vSync			: out	std_logic
		);
end Bit_Mapped_XVGA;

architecture struct of Bit_Mapped_XVGA is

	signal dispAddrB 			: std_logic_vector(10 downto 0);
	signal dispRamDataOutB 	: std_logic_vector(7 downto 0);
	signal charAddr 			: std_logic_vector(10 downto 0);
	signal charData 			: std_logic_vector(7 downto 0);
	signal video				: std_logic;
	signal hAct					: std_logic;
	signal displayCSA			: std_logic;
	signal displayCSB			: std_logic;
	signal displayCSC			: std_logic;

begin
		
	displayCSA <= not ((not n_dispRamCS) and (not cpuAddress(14)) and (not cpuAddress(13)));
	displayCSB <= not ((not n_dispRamCS) and (not cpuAddress(14)) and   	cpuAddress(13));
	displayCSC <= not ((not n_dispRamCS) and		  cpuAddress(14)) and (not cpuAddress(13)));
	
	dataOut <= 
	
	VoutVect <= video&video&video&video&video&video;
	
	Video_XVGA_Bit_Mapped : entity work.Video_XVGA_Bit_Mapped
	port map (
		charAddr 	=> charAddr,
		charData 	=> charData,
		dispAddr 	=> dispAddrB,
		dispData 	=> dispRamDataOut,
		clk		 	=> Video_Clk,
		video 		=> video,
		vsync 		=> vSync,
		hsync 		=> hSync,
		hAct 			=> hAct
	);	
	
	dispRamDataOut <= dispRamDataOutA when 

	DisplayRAMA: entity work.DisplayRam8KB
	port map
	(
		address_a 	=> cpuAddress(12 downto 0),
		address_b 	=> dispAddrB,
		clock_a		=> CLK_50,
		clock_b		=> Video_Clk,
		data_a 		=> cpuDataOut,
		data_b 		=> (others => '0'),
		wren_a 		=> not n_memWR and not n_dispRamCS and ,
		wren_b 		=> '0',
		q_a 			=> dataOut,
		q_b 			=> dispRamDataOutA
	);

end;
