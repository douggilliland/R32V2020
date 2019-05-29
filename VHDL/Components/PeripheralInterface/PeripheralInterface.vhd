-- PeripheralInterface
-- Controls the peripherals

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity PeripheralInterface is
	port(
		n_reset					: in std_logic;
		CLOCK_50					: in std_logic;
		Video_Clk				: in std_logic;
		i_switch					: in std_logic_vector(2 downto 0);
		o_LED						: out std_logic(3 downto 0);
		o_BUZZER					: out std_logic;
		peripheralAddress		: in std_logic_vector(31 downto 0);
		dataToPeripherals		: in std_logic_vector(31 downto 0);
		dataFromPeripherals	: out std_logic_vector(31 downto 0);
		peripheralRdStrobe	: in std_logic;
		peripheralWrStrobe	: in std_logic;
		rxd						: in std_logic;	-- Serial receive
		txd						: out std_logic;	-- Serial transmit
		rts						: out std_logic;	
		VoutVect					: out std_logic_vector(17 downto 0);
		PS2_CLK					: in std_logic;	-- PS/2 Clock
		PS2_DATA					: in std_logic		-- PS/2 Data
		);
	end PeripheralInterface;
	
architecture struct of PeripheralInterface is

	-- Peripheral Signals
	signal n_dispRamCS 			:	std_logic;
	signal n_kbCS 					:	std_logic;
	signal n_aciaCS 				:	std_logic;
	signal n_aciaCS 				:	std_logic;
	signal n_SwitchesCS			:	std_logic;
	signal n_LEDsCS				:	std_logic;
--	signal dataFromPeripheral	: 	std_logic_vector(31 downto 0);
	signal serialClkCount		: std_logic_vector(15 downto 0); 
	signal serialClkCount_d    : std_logic_vector(15 downto 0);
	signal serialClkEn			: std_logic;
	signal serialClock			: std_logic;
	signal kbdDataStatus			: std_logic_vector(9 downto 0);
	signal aciaData				: std_logic_vector(7 downto 0);
	signal kbReadData				: std_logic_vector(7 downto 0);
	signal dispRamDataOutA		: std_logic_vector(7 downto 0);
	signal kbDataValid			: std_logic;
	signal kbError					: std_logic;

	constant SVGA_BASE 	: std_Logic_Vector(4 downto 0) := "00000";
	constant KBD_BASE 	: std_Logic_Vector(4 downto 0) := "00001";
	constant ACIA_BASE 	: std_Logic_Vector(4 downto 0) := "00010";
	constant SWS_BASE 	: std_Logic_Vector(4 downto 0) := "00011";
	constant LEDS_BASE 	: std_Logic_Vector(4 downto 0) := "00100";


begin
	
	-- Peripheral Address decoder
	n_dispRamCS 	<= '0' when peripheralAddress(15 downto 11) = SVGA_BASE	else '1';	-- x0000-x07FF (2KB)
	n_kbCS 			<= '0' when peripheralAddress(15 downto 11) = KBD_BASE	else '1';	-- x0800-x0FFF (2KB)
	n_aciaCS 		<= '0' when peripheralAddress(15 downto 11) = ACIA_BASE	else '1';	-- x1000-x17FF (2KB)
	n_SwitchesCS	<= '0' when peripheralAddress(15 downto 11) = SWS_BASE	else '1';	-- x1800-x1FFF (2KB)
	n_LEDsCS			<= '0' when peripheralAddress(15 downto 11) = LEDS_BASE	else '1';	-- x2000-x27FF (2KB)

	dataFromPeripherals <=
		x"000000"		&dispRamDataOutA 		when n_dispRamCS = '0' else
		x"00000"&"00"	&kbdDataStatus			when peripheralAddress(0) = '1' and n_kbCS='0' else 
		x"000000"		&kbReadData 			when peripheralAddress(0) = '0' and n_kbCS='0' else
		x"000000"		&aciaData 				when n_aciaCS = '0' else
		x"FFFFFFFF";
	
	UART : entity work.bufferedUART
		port map(
			clk 		=> CLOCK_50,
			n_wr 		=> n_aciaCS or (not peripheralWrStrobe),
			n_rd 		=> n_aciaCS or (not peripheralRdStrobe),
			regSel 	=> peripheralAddress(0),
			dataIn 	=> dataToPeripherals(7 downto 0),
			dataOut 	=> aciaData,
			rxClkEn 	=> serialClkEn,
			txClkEn 	=> serialClkEn,
			rxd 		=> rxd,
			txd 		=> txd,
			n_cts 	=> '0',
			n_dcd 	=> '0',
			n_rts 	=> rts
		);

	SVGA : entity work.Mem_Mapped_SVGA
		port map (
			n_reset		=> n_reset,
			Video_Clk	=> Video_Clk,
			CLK_50		=> CLOCK_50,
			n_dispRamCS	=> n_dispRamCS,
			n_memWR		=> n_dispRamCS or n_dispRamCS or (not peripheralWrStrobe),
			cpuAddress	=> peripheralAddress(10 downto 0),
			cpuDataOut	=> dataToPeripherals(7 downto 0),
			dataOut		=> dispRamDataOutA,
			VoutVect		=> VoutVect
			);
	
	ps2Keyboard : entity work.ps2_intf
	port map (
		CLK		=> CLOCK_50,
		nRESET	=> n_reset,
		PS2_CLK	=> PS2_CLK,
		PS2_DATA	=> PS2_DATA,	
		DATA		=> kbReadData,
		VALID		=> kbDataValid,
		ERROR		=> kbError
	);
	
	process (CLOCK_50, kbReadData, kbDataValid, kbError)
	begin
		if rising_edge(CLOCK_50)  then
			if kbDataValid = '1' or kbError = '1' then
				kbdDataStatus <= "0000000" & kbError & kbDataValid & PS2_DATA;
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

	baud_div: process (serialClkCount_d, serialClkCount)
		begin
			serialClkCount_d <= serialClkCount + 6;		-- 300 baud
		end process;

	--Single clock wide baud rate enable
	baud_clk: process(CLOCK_50)
		begin
			if rising_edge(CLOCK_50) then
					serialClkCount <= serialClkCount_d;
				if serialClkCount(15) = '0' and serialClkCount_d(15) = '1' then
					serialClkEn <= '1';
				else
					serialClkEn <= '0';
				end if;
        end if;
    end process;
end;