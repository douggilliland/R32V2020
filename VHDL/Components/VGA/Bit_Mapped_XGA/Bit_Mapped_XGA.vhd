-- XGA
-- 1024x768

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Bit_Mapped_XGA is
	port(
		n_reset		: in std_logic;
		-- CPU side
		CLK_50		: in std_logic;
		n_dispRamCS	: in std_logic;
		n_memWR		: in std_logic;
		cpuAddress	: in std_logic_vector(14 downto 0);
		cpuDataOut	: in std_logic_vector(7 downto 0);
		--Video side
		Video_Clk	: in std_logic;
		dataOut		: out std_logic_vector(7 downto 0);
		VoutVect		: out std_logic_vector(5 downto 0);
		hSync			: out	std_logic;
		vSync			: out	std_logic
		);
end Bit_Mapped_XGA;

architecture struct of Bit_Mapped_XGA is

	signal dispAddrB 			: std_logic_vector(14 downto 0);
	signal dispRamDataOutB 	: std_logic_vector(7 downto 0);
	signal charAddr 			: std_logic_vector(14 downto 0);
	signal charData 			: std_logic_vector(7 downto 0);
	signal dispRamDataOutA	: std_logic_vector(7 downto 0);
	signal video				: std_logic;
	signal hAct					: std_logic;
	signal displayCSA			: std_logic;
	signal displayCSB			: std_logic;
	signal displayCSC			: std_logic;

begin
		
	displayCSA <= not ((not n_dispRamCS) and (not cpuAddress(14)) and (not cpuAddress(13)));
	displayCSB <= not ((not n_dispRamCS) and (not cpuAddress(14)) and   	  cpuAddress(13));
	displayCSC <= not ((not n_dispRamCS) and		 cpuAddress(14)  and (not cpuAddress(13)));
	
	dataOut <= dispRamDataOut;
	
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

	charData <= dispRamDataOutA;
	
	DisplayRAMA: entity work.DisplayRam8KB
	port map
	(
		-- CPU
		clock_a		=> CLK_50,
		wren_a 		=> not n_memWR and ((not n_dispRamCS) and (not cpuAddress(14)) and (not cpuAddress(13))),
		address_a 	=> cpuAddress(12 downto 0),
		data_a 		=> cpuDataOut,
		q_a 			=> dataOutA,
		-- Video
		clock_b		=> Video_Clk,
		wren_b 		=> '0',
		address_b 	=> dispAddrB(12 DOWNTO 0),
		data_b 		=> (others => '0'),
		q_b 			=> dispRamDataOutA
	);

	DisplayRAMA: entity work.DisplayRam8KB
	port map
	(
		-- CPU
		clock_a		=> CLK_50,
		wren_a 		=> not n_memWR and ((not n_dispRamCS) and (not cpuAddress(14)) and (cpuAddress(13))),
		address_a 	=> cpuAddress(12 downto 0),
		data_a 		=> cpuDataOut,
		q_a 			=> dataOutB,
		-- Video
		address_b 	=> dispAddrB(12 DOWNTO 0),
		clock_b		=> Video_Clk,
		data_b 		=> (others => '0'),
		wren_b 		=> '0',
		q_b 			=> dispRamDataOutB
	);

	DisplayRAMA: entity work.DisplayRam8KB
	port map
	(
		-- CPU
		clock_a		=> CLK_50,
		wren_a 		=> not n_memWR and ((not n_dispRamCS) and cpuAddress(14) and (not cpuAddress(13))),
		address_a 	=> cpuAddress(12 downto 0),
		data_a 		=> cpuDataOut,
		q_a 			=> dataOutC,
		-- Video
		clock_b		=> Video_Clk,
		address_b 	=> dispAddrB(12 DOWNTO 0),
		data_b 		=> (others => '0'),
		wren_b 		=> '0',
		q_b 			=> dispRamDataOutC
	);

end;
