-- Element Test Bed

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Element_Test_Bed is
	port(
		FPGA_Clk		: in std_logic;
		n_Reset		: in std_logic;
--		rxd			: in std_logic;
--		txd			: out std_logic;
--		rts			: out std_logic;
--
--		VoutVect		: out std_logic_vector(17 downto 0); -- rrrrr,gggggg,bbbbb,hsync,vsync
--		
--		switch0		: in std_logic;
--		switch1		: in std_logic;
--		switch2		: in std_logic;
--
--		LED1			: out std_logic;
--		LED2			: out std_logic;
--		LED3			: out std_logic;
--		LED4			: out std_logic;
--
--		BUZZER		: out std_logic;
--
--		ps2Clk		: in std_logic;
--		ps2Data		: in std_logic;
		
--		regFileDataIn		: in  std_logic_vector(31 downto 0);
--		regFileDataOutA	: out std_logic_vector(31 downto 0);
--		regFileDataOutB	: out std_logic_vector(31 downto 0);
		wrRegFileStrobe	: in  std_logic;
		wrRegFileSel		: in  std_logic_vector(3 downto 0);
		rdRegFileSelA		: in  std_logic_vector(3 downto 0);
		rdRegFileSelB		: in  std_logic_vector(3 downto 0);
		
--		Anode_Activate : out std_logic_vector(3 downto 0);
		LED_out			: out std_logic_vector(6 downto 0)
	);
end Element_Test_Bed;

architecture struct of Element_Test_Bed is

	signal cpuClock			: std_logic;
	signal CLOCK_100			: std_ulogic;
	signal CLOCK_50			: std_ulogic;
	signal Video_Clk_25p6	: std_ulogic;
	signal regFileDataOutA	: std_logic_vector(31 downto 0);
	signal regFileDataOutB	: std_logic_vector(31 downto 0);
	signal regFileDataIn		: std_logic_vector(31 downto 0);
	signal ALUOut				: std_logic_vector(31 downto 0);
	signal Op_AND				: std_ulogic := '0';
	signal Op_XOR				: std_ulogic := '0';
	signal Op_OR				: std_ulogic := '0';
	signal Op_Add				: std_ulogic := '1';
	
begin

ALUOut <= regFileDataIn;

	-- ____________________________________________________________________________________
	-- Clocks
pll : work.VideoClk_SVGA_800x600 PORT MAP (
		inclk0	=> FPGA_Clk,
		c0	 		=> Video_Clk_25p6,	-- 25.6 MHz Video Clock
		c1			=> cpuClock,			-- 1 MHz CPU clock
		c2			=> CLOCK_50			-- Logic Clock
	);
	
regFile : work.RegisterFile port map (
		clk => FPGA_Clk,
		clear	=> not n_Reset,
		wrStrobe	=> wrRegFileStrobe,
		wrRegSel	=> wrRegFileSel,
		rdRegSelA => rdRegFileSelA,
		rdRegSelB => rdRegFileSelB,
		regDataIn => regFileDataIn,
		regDataOutA => regFileDataOutA,
		regDataOutB => regFileDataOutB
	);

alu : work.ALU port map (
		clk => FPGA_Clk,
		Op_AND => Op_AND,
		Op_XOR => Op_XOR,
		Op_OR  => Op_OR,
		Op_Add => Op_Add,
		regDataA => regFileDataOutA,
		regDataB => regFileDataOutB,
		ALUDataOut => regFileDataIn
	);

end;
