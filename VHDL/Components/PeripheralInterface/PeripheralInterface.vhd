-- PeripheralInterface
-- Controls the peripherals

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity PeripheralInterface is
	port(
		n_reset						: in std_logic := '1';
		i_CLOCK_50					: in std_logic := '1';
		-- Peripheral Memory Mapped Space Address/Data/Control lines
		i_peripheralAddress		: in std_logic_vector(31 downto 0) := x"00000000";
		i_dataToPeripherals		: in std_logic_vector(31 downto 0) := x"00000000";
		o_dataFromPeripherals	: out std_logic_vector(31 downto 0) := x"00000000";
		i_peripheralRdStrobe		: in std_logic := '1';
		i_peripheralWrStrobe		: in std_logic := '1';
		-- Physical connections to/from the FPGA pins
		i_switch						: in std_logic_vector(2 downto 0) := "111";			-- Switches
		o_LED							: out std_logic_vector(3 downto 0) := "1111";		-- LEDs (mutually exclusive w 7 Seg LED)
		o_BUZZER						: out std_logic := '1';										-- Buzzer
		o_Anode_Activate 			: out std_logic_vector(3 downto 0) := "1111";		-- Seven Segment LED
		o_LED_out					: out std_logic_vector(6 downto 0) := "1111111";	-- Seven Segment LED
		i_rxd							: in std_logic := '1';										-- Serial receive (from UART)
		o_txd							: out std_logic := '1';										-- Serial transmit (to UART)
		o_rts							: out std_logic := '1';										-- Serial Hardware Handshake (to UART)
		o_VoutVect					: out std_logic_vector(17 downto 0);					-- VGA lines
		i_PS2_CLK					: in std_logic := '1';										-- PS/2 Clock
		i_PS2_DATA					: in std_logic := '1'										-- PS/2 Data
		);
	end PeripheralInterface;
	
architecture struct of PeripheralInterface is

	-- Peripheral Signals
	signal w_dispRamCS 			:	std_logic;
	signal w_kbDatCS 				:	std_logic;
	signal w_kbStatCS				:	std_logic;
	signal w_aciaCS 				:	std_logic;
	signal w_SwitchesCS			:	std_logic;
	signal w_LEDsCS				:	std_logic;
	signal w_7SEGCS				:	std_logic;
	
	signal w_serialClkCount		:	std_logic_vector(15 downto 0); 
	signal w_serialClkCount_d	: 	std_logic_vector(15 downto 0);
	signal w_serialClkEn			:	std_logic;
	signal w_serialClock			:	std_logic;
	signal w_kbdDataStatus		:	std_logic_vector(9 downto 0);
	signal w_aciaData				:	std_logic_vector(7 downto 0);
	signal w_kbReadData			:	std_logic_vector(7 downto 0);
	signal w_dispRamDataOutA	:	std_logic_vector(7 downto 0);
	signal w_kbDataValid			:	std_logic;
	signal w_kbError				:	std_logic;
	signal w_Video_Clk			: 	std_logic := '0';
	signal w_displayed_number	: 	std_logic_vector(15 downto 0); 
	signal w_LatData				:	std_logic_vector(7 downto 0);

	constant SVGA_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"0";
	constant KBDAT_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"1";
	constant KBST_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"2";
	constant ACIA_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"3";
	constant SWS_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"4";
	constant LEDS_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"5";
	constant SEGS7_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"6";


begin
	
	-- Peripheral Address decoder
	-- Currently only uses 16-bits of address
	w_dispRamCS 	<= '1' when i_peripheralAddress(15 downto 11) = SVGA_BASE	else '0';	-- x0000-x07FF (2KB)
	w_kbDatCS 		<= '1' when i_peripheralAddress(15 downto 11) = KBDAT_BASE	else '0';	-- x0800-x0FFF (2KB)
	w_kbStatCS 		<= '1' when i_peripheralAddress(15 downto 11) = KBST_BASE	else '0';	-- x1000-x17FF (2KB)
	w_aciaCS 		<= '1' when i_peripheralAddress(15 downto 11) = ACIA_BASE	else '0';	-- x1800-x1FFF (2KB)
	w_SwitchesCS	<= '1' when i_peripheralAddress(15 downto 11) = SWS_BASE		else '0';	-- x2000-x27FF (2KB)
	w_LEDsCS			<= '1' when i_peripheralAddress(15 downto 11) = LEDS_BASE	else '0';	-- x2800-x2FFF (2KB)
	w_7SEGCS			<= '1' when i_peripheralAddress(15 downto 11) = SEGS7_BASE	else '0';	-- x3000-x37FF (2KB)
	
	o_dataFromPeripherals <=
		x"000000"		&w_dispRamDataOutA 		when	w_dispRamCS 	= '1' else
		x"000000"		&w_kbReadData	 			when	w_kbDatCS		= '1' else
		x"00000"&"00"	&w_kbdDataStatus			when	w_kbStatCS		= '1' else 
		x"000000"		&w_aciaData 				when	w_aciaCS 		= '1' else
		x"0000000"&'0'	&i_switch 					when	w_SwitchesCS 	= '1' else
		x"FFFFFFFF";
	
	SevenSegDisplay : entity work.Loadable_7S4D_LED
    Port map ( 
		i_CLOCK_50Mhz 			=> i_CLOCK_50,
      i_reset					=> not n_reset,
		i_displayed_number	=> w_displayed_number,
      o_Anode_Activate		=> o_Anode_Activate,
      o_LED_out 				=> o_LED_out		-- Cathode patterns of 7-segment display
	);
	
	SevenSegmentDisplayLatch : ENTITY work.REG_16
	PORT MAP (
    clk 	=> i_CLOCK_50,
    d   	=> i_dataToPeripherals(15 downto 0),
    ld  	=> i_peripheralWrStrobe and w_7SEGCS,
    clr 	=> not n_reset,
    q		=> w_displayed_number
	);
	
	LedLatch	: ENTITY work.REG_8 
	PORT MAP (
    clk 	=> i_CLOCK_50,
    d 	=> i_dataToPeripherals(7 downto 0),
    ld 	=> i_peripheralWrStrobe and w_LEDsCS,
    clr  => not n_reset,
    q    => w_LatData
	);
	
	o_LED <= w_LatData(3 downto 0);
	o_BUZZER <= w_LatData(4);
	
	UART : entity work.bufferedUART
		port map(
			clk 		=> i_CLOCK_50,
			n_wr 		=> (not w_aciaCS) or (not i_peripheralWrStrobe),
			n_rd 		=> (not w_aciaCS) or (not i_peripheralRdStrobe),
			regSel 	=> i_peripheralAddress(0),
			dataIn 	=> i_dataToPeripherals(7 downto 0),
			dataOut 	=> w_aciaData,
			rxClkEn 	=> w_serialClkEn,
			txClkEn 	=> w_serialClkEn,
			rxd 		=> i_rxd,
			txd 		=> o_txd,
			n_cts 	=> '0',
			n_dcd 	=> '0',
			n_rts 	=> o_rts
		);

	clockGen : ENTITY work.VideoClk_SVGA_800x600
	PORT map (
		areset	=> not n_reset,
		inclk0	=> i_CLOCK_50,
		c0			=> w_Video_Clk
	);
	
	SVGA : entity work.Mem_Mapped_SVGA
		port map (
			n_reset		=> n_reset,
			Video_Clk	=> w_Video_Clk,
			CLK_50		=> i_CLOCK_50,
			n_dispRamCS	=> not w_dispRamCS,
			n_memWR		=> (not w_dispRamCS) or (not i_peripheralWrStrobe),
			cpuAddress	=> i_peripheralAddress(10 downto 0),
			cpuDataOut	=> i_dataToPeripherals(7 downto 0),
			dataOut		=> w_dispRamDataOutA,
			VoutVect		=> o_VoutVect
			);
	
	ps2Keyboard : entity work.ps2_intf
	port map (
		CLK		=> i_CLOCK_50,
		nRESET	=> n_reset,
		PS2_CLK	=> i_PS2_CLK,
		PS2_DATA	=> i_PS2_DATA,	
		DATA		=> w_kbReadData,
		VALID		=> w_kbDataValid,
		ERROR		=> w_kbError
	);
	
	process (i_CLOCK_50, w_kbReadData, W_kbDataValid, w_kbError)
	begin
		if rising_edge(i_CLOCK_50)  then
			if w_kbDataValid = '1' or w_kbError = '1' then
				w_kbdDataStatus <= "0000000" & w_kbError & w_kbDataValid & i_PS2_DATA;
			end if;
		end if;
	end process;

	-- ____________________________________________________________________________________
	-- Baud Rate Clock Signals
	-- Serial clock DDS
	-- 50MHz master input clock:
	-- f = (increment x 50,000,000) / 65,536 = 16X baud rate
	-- Baud Increment
	-- 115200 2416
	-- 38400 805
	-- 19200 403
	-- 9600 201
	-- 4800 101
	-- 2400 50
	-- 1200 25
	-- 600 13
	-- 300 6

	baud_div: process (w_serialClkCount_d, w_serialClkCount)
		begin
			w_serialClkCount_d <= w_serialClkCount + 6;		-- 300 baud
		end process;

	--Single clock wide baud rate enable
	baud_clk: process(i_CLOCK_50)
		begin
			if rising_edge(i_CLOCK_50) then
					w_serialClkCount <= w_serialClkCount_d;
				if w_serialClkCount(15) = '0' and w_serialClkCount_d(15) = '1' then
					w_serialClkEn <= '1';
				else
					w_serialClkEn <= '0';
				end if;
        end if;
    end process;
end;