-- PeripheralInterface-V002
-- Controls the peripherals
-- Uses the ANSI terminal version of the display
-- Supports a superset of peripheral interfaces
-- Not all of the peripheral interfaces are used by the FPGA cards due to I/O pin limitations

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;
library work;
use work.R32V2020_Pkg.all;

entity PeripheralInterface is
	port(
		n_reset						: in std_logic := '1';
		i_CLOCK_50					: in std_logic := '1';
		i_OneHotState				: in std_logic_vector(3 downto 0) := "0000";
		-- Peripheral Memory Mapped Space Address/Data/Control lines
		i_peripheralAddress		: in std_logic_vector(31 downto 0) := x"00000000";
		i_dataToPeripherals		: in std_logic_vector(31 downto 0) := x"00000000";
		o_dataFromPeripherals	: out std_logic_vector(31 downto 0) := x"00000000";
		i_peripheralRdStrobe		: in std_logic := '1';
 		i_peripheralWrStrobe		: in std_logic := '1';
		-- Physical connections to/from the FPGA pins
		i_switch						: in std_logic_vector(2 downto 0) := "111";			-- Switches
		i_DIP_switch				: in std_logic_vector(7 downto 0) := x"00";			-- DIP Switches
		o_LED							: out std_logic_vector(3 downto 0) := x"1";			-- LEDs (mutually exclusive w 7 Seg LED)
		o_BUZZER						: out std_logic := '1';										-- Buzzer
		o_Anode_Activate 			: out std_logic_vector(7 downto 0) := x"11";			-- Seven Segment LED
		o_LED7Seg_out				: out std_logic_vector(7 downto 0) := x"11";			-- Seven Segment LED
		o_LEDRing_out				: buffer std_logic_vector(11 downto 0) := x"000";	-- LED Ring
		o_LatchIO					: out std_logic_vector(7 downto 0) := x"11";			-- Output Latch
		-- Serial port
		i_rxd							: in std_logic := '1';								-- Serial receive (from UART)
		o_txd							: out std_logic;										-- Serial transmit (to UART)
		o_rts							: out std_logic;										-- Serial Hardware Handshake (to UART)
		i_cts							: in std_logic := '0';								-- Serial Hardware Handshake (from UART)
		-- Video
		o_VideoOut					: out std_logic_vector(5 downto 0);				-- VGA lines rr,gg,bb
		o_hSync						: out std_logic := '1';
		o_vSync						: out std_logic := '1';
		o_hActive					: out std_logic := '0';
		-- External I2C connections
		io_I2C_SCL					: inout std_logic := '1';
		io_I2C_SDA					: inout std_logic := '1';
		io_I2C_INT					: in std_logic := '1';
		-- EEPROM I2C connections
		io_EEP_I2C_SCL				: inout std_logic := '1';
		io_EEP_I2C_SDA				: inout std_logic := '1';
		-- SPI connections
		spi_sclk						: out std_logic := '1';
      spi_csN						: out std_logic;
      spi_mosi						: out std_logic := '1';
      spi_miso						: in std_logic := '1';
		-- Music generator
		o_Note						: out std_logic := '0';
		-- PS/2 keyboard
		i_PS2_CLK					: in std_logic := '1';										-- PS/2 Clock
		i_PS2_DATA					: in std_logic := '1'										-- PS/2 Data
		);
	end PeripheralInterface;
	
architecture struct of PeripheralInterface is

	attribute syn_keep: boolean;
	-- Peripheral Chip Selects
	signal ANSI_DisplayCS 		:	std_logic := '0';
	signal w_kbDatCS 				:	std_logic := '0';
	signal w_kbStatCS				:	std_logic := '0';
	signal w_aciaCS 				:	std_logic := '0';
	signal w_SwitchesCS			:	std_logic := '0';
	signal w_LEDsCS				:	std_logic := '0';
	signal w_7SEGCS				:	std_logic := '0';
	signal w_TimersCS				:	std_logic := '0';
	signal w_NoteCS				:	std_logic := '0';
	signal w_LEDRingCS			:	std_logic := '0';
	signal w_LatchIOCS			:	std_logic := '0';
	signal w_I2CCS					:	std_logic := '0';
	signal w_SPICS					:	std_logic := '0';
	signal w_EEPI2CCS				:	std_logic := '0';
	-- Serial Port controls
	signal w_serialClkCount		:	std_logic_vector(15 downto 0); 
	signal w_serialClkCount_d	: 	std_logic_vector(15 downto 0);
	signal w_serialClkEn			:	std_logic;
	signal w_serialClock			:	std_logic;
	-- Keyboard cotrols
	signal w_kbdStatus			:	std_logic_vector(31 downto 0);
	signal w_kbReadData			:	std_logic_vector(6 downto 0);
	signal q_kbReadData			:	std_logic_vector(31 downto 0);
	signal w_kbDataValid			:	std_logic;
	signal w_latKbDV1				:	std_logic := '0';
	-- Serial Port
	signal w_aciaData				:	std_logic_vector(7 downto 0);
	-- Display
	signal w_ANSI_DispRamDataOutA	:	std_logic_vector(7 downto 0);
	-- Timers
	signal o_dataFromTimers		:	std_logic_vector(31 downto 0);
	-- Parallel I/O Ports
	signal w_LatData				:	std_logic_vector(7 downto 0);
	-- SPI data ports
	signal o_spiData				:	std_logic_vector(7 downto 0);
	-- Seven Segment Displays
	signal w_displayed_number	: 	std_logic_vector(31 downto 0); 
	-- Ring LEDs
	signal w_LEDRing_out			: 	std_logic_vector(11 downto 0);
	-- Pushbutton switches
	signal w_Switch				: std_logic_vector(2 downto 0) := "000";
	-- I2C Clocking (external and EEPROM)
	signal w_4x_I2C_Count		:	std_logic_vector(6 downto 0); 
	signal i2c_4X_CLK				:	std_logic := '0';
	-- External I2C
	signal o_i2cData				:	std_logic_vector(7 downto 0);
	-- EEPROM I2C
	signal o_EEPi2cData			:	std_logic_vector(7 downto 0);
	-- External SPI
	signal w_SPI_Clk_Count		:	std_logic_vector(5 downto 0); 
	signal w_SPI_Clk			: 	std_logic := '0';
	signal w_spi_busy				: 	std_logic := '0';
	-- Music/Tone generator
	signal w_BUZZER				: 	std_logic := '0';

	-- Address decoder addresses
	-- Provides for up to 32 "chip selects"
	-- Address bits 15 down to 11
	-- Some interfaces use lower address bits to select data/control-status
	constant ANSI_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"0";
	constant KBDAT_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"1";
	constant KBST_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"2";
	constant ACIA_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"3";
	constant SWS_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"4";
	constant LEDS_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"5";
	constant SEGS7_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"6";
	constant TIMERS_BASE : std_Logic_Vector(4 downto 0) := '0'&x"7";
	constant NOTE_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"8";
	constant LEDRNG_BASE	: std_Logic_Vector(4 downto 0) := '0'&x"9";
	constant LATIO_BASE	: std_Logic_Vector(4 downto 0) := '0'&x"A";
	constant I2CIO_BASE	: std_Logic_Vector(4 downto 0) := '0'&x"B";
	constant SPIIO_BASE	: std_Logic_Vector(4 downto 0) := '0'&x"C";
	constant EEPIO_BASE	: std_Logic_Vector(4 downto 0) := '0'&x"D";

begin

	-- Peripheral Address decoder
	-- Currently only uses 16-bits of address
	ANSI_DisplayCS <= '1' when i_peripheralAddress(15 downto 11) = ANSI_BASE	else '0';	-- x0000-x07FF (2KB) - Display RAM
	w_kbDatCS 		<= '1' when i_peripheralAddress(15 downto 11) = KBDAT_BASE	else '0';	-- x0800-x0FFF (2KB)	- Keyboard Data
	w_kbStatCS 		<= '1' when i_peripheralAddress(15 downto 11) = KBST_BASE	else '0';	-- x1000-x17FF (2KB)	- Keyboard Status
	w_aciaCS 		<= '1' when i_peripheralAddress(15 downto 11) = ACIA_BASE	else '0';	-- x1800-x1FFF (2KB)	- UART
	w_SwitchesCS	<= '1' when i_peripheralAddress(15 downto 11) = SWS_BASE		else '0';	-- x2000-x27FF (2KB)	- Pushbutton Switches
	w_LEDsCS			<= '1' when i_peripheralAddress(15 downto 11) = LEDS_BASE	else '0';	-- x2800-x2FFF (2KB)	- Individual LEDs
	w_7SEGCS			<= '1' when i_peripheralAddress(15 downto 11) = SEGS7_BASE	else '0';	-- x3000-x37FF (2KB)	- Seven Segment Display
	w_TimersCS		<= '1' when i_peripheralAddress(15 downto 11) = TIMERS_BASE	else '0';	-- x3800-x3FFF (2KB)	- Timers
	w_NoteCS			<= '1' when i_peripheralAddress(15 downto 11) = NOTE_BASE	else '0';	-- x4000-x47FF (2KB)	- Music/Note
	w_LEDRingCS		<= '1' when i_peripheralAddress(15 downto 11) = LEDRNG_BASE	else '0';	-- x4800-x4FFF (2KB)	- LED Ring
	w_LatchIOCS		<= '1' when i_peripheralAddress(15 downto 11) = LATIO_BASE	else '0';	-- x5000-x57FF (2KB)	- I/O Latch
	w_I2CCS			<= '1' when i_peripheralAddress(15 downto 11) = I2CIO_BASE	else '0';	-- x5800-x5FFF (2KB)	- External I2C Address
	w_SPICS			<= '1' when i_peripheralAddress(15 downto 11) = SPIIO_BASE	else '0';	-- x6000-x67FF (2KB)	- SPI Address
	w_EEPI2CCS		<= '1' when i_peripheralAddress(15 downto 11) = EEPIO_BASE	else '0';	-- x6800-x6FFF (2KB)	- EEPROM I2C Address
	
	o_dataFromPeripherals <=
		x"000000"		& w_ANSI_DispRamDataOutA 	when	ANSI_DisplayCS = '1' else
		q_kbReadData	 									when	w_kbDatCS		= '1' else
		w_kbdStatus											when	w_kbStatCS		= '1' else 
		x"000000"		& w_aciaData 					when	w_aciaCS 		= '1' else
		x"00000"	& (not i_DIP_switch) & '0' & w_switch 	when	w_SwitchesCS 	= '1' else
		x"000000"		& w_LatData						when	w_LEDsCS 		= '1' else
		o_dataFromTimers									when	w_TimersCS		= '1' else
		x"000000"		& o_i2cData			 			when	w_I2CCS 			= '1' else
		x"000000"		& o_EEPi2cData		 			when	w_EEPI2CCS		= '1' else
		x"000000"		& o_spiData						when	(w_SPICS = '1' and i_peripheralAddress(1) = '0') else
		x"0000000"&"000" & w_spi_busy					when	(w_SPICS = '1' and i_peripheralAddress(1) = '1') else
		x"FFFFFFFF";

	-- SPIbus Clock
	-- 50 MHz divided by 6 is 50/6 = 8.33 MHz
	-- 50/50 duty cycle (3 clocks high/3 clocks low)
	-- Could use PLL to get a symmetric 10 MHz clock - might be less deterministic
    process(i_CLOCK_50,w_SPI_Clk_Count, n_reset)
    begin
		if rising_edge(i_CLOCK_50) then
			if ((w_SPI_Clk_Count = 5) or (n_reset = '0')) then
				w_SPI_Clk_Count <= "000000";
			else
				w_SPI_Clk_Count <= w_SPI_Clk_Count + 1;
				w_SPI_Clk <= '0';
			end if;
			if ((w_SPI_Clk_Count <= 2) or (n_reset = '0')) then
				w_SPI_Clk <= '0';				-- 1 MHz clock edge
			else
				w_SPI_Clk <= '1';
			end if;
		end if;
    end process;	
	
	-- SPIbus Master interface
	spiMaster : entity work.spi
	port map (
		RESET		=> not n_reset,
		CPU_CLK	=> i_CLOCK_50,					-- 50 MHz Clock
		SPI_CLK	=> w_SPI_Clk,					-- SPI data transmission synchronization clock
		-- CPU interface lines
		A			=> i_peripheralAddress(0),					-- Address: 0 = data register; 1 = control register
		DI			=> i_dataToPeripherals(7 downto 0),		-- 8-bit data bus, input
		WR			=> w_SPICS and i_peripheralWrStrobe,	-- 1 = enable write to data register or control register
		DO			=> o_spiData,				-- 8-bit data bus, output
		-- SPI External lines
		SCLK		=> spi_sclk,					-- Data sync clock output
		CS_n		=> spi_csN,						-- Slave select output (chip select)
		MOSI		=> spi_mosi,					-- Serial output
		MISO		=> spi_miso,					-- Serial data input
		-- SPI status line
		BUSY		=> w_spi_busy				-- 1 = busy transferring; 0 = free
    );
	
	-- I2C clock
	--	I2C clock enable signal
	-- Enable signal is one clock wide pulse of the 50 MHz clock
	-- Enable signal is 4x the I2C clock rate (1600 KHz)
	-- 50 MHz / 32 = 1.56 MHz
	-- 4xclock yeilds 390 KHz I2C clock rate (close enough to 400 KHz)
    process(i_CLOCK_50)
    begin
		if rising_edge(i_CLOCK_50) then
			if w_4x_I2C_Count = 31 then
				w_4x_I2C_Count <= "0000000";
				i2c_4X_CLK <= '1';
			else
				w_4x_I2C_Count <= w_4x_I2C_Count + 1;
				i2c_4X_CLK <= '0';
			end if;
		end if;
    end process;
	
	-- External I2c Interface
	i2cIF	: entity work.i2c
	port map (
		i_RESET			=> not n_reset,								-- Reset pushbutton switch
		CPU_CLK			=> i_CLOCK_50,									-- 50 MHz
		i_ENA				=> i2c_4X_CLK,									-- One CPU clock wide every 400 Khz
		i_ADRSEL			=> i_peripheralAddress(0),					-- Command/Data address select line
		i_DATA_IN		=> i_dataToPeripherals(7 downto 0),		-- Data to I2C interface
		o_DATA_OUT		=> o_i2cData,									-- Data from I2C interface
		i_WR				=> w_I2CCS and i_peripheralWrStrobe,	-- Write strobe
		io_I2C_SCL		=> io_I2C_SCL,									-- Clock to external I2C interface
		io_I2C_SDA		=> io_I2C_SDA									-- Data to/from external I2C interface
	);
	
	-- EEPROM I2c Interface
	eepi2cIF	: entity work.i2c
	port map (
		i_RESET			=> not n_reset,								-- Reset pushbutton switch
		CPU_CLK			=> i_CLOCK_50,									-- 50 MHz
		i_ENA				=> i2c_4X_CLK,									-- One CPU clock wide every 400 Khz
		i_ADRSEL			=> i_peripheralAddress(0),					-- Command/Data address select line
		i_DATA_IN		=> i_dataToPeripherals(7 downto 0),		-- Data to I2C interface
		o_DATA_OUT		=> o_EEPi2cData,								-- Data from I2C interface
		i_WR				=> w_EEPI2CCS and i_peripheralWrStrobe, -- Write strobe
		io_I2C_SCL		=> io_EEP_I2C_SCL,							-- Clock to external I2C interface
		io_I2C_SDA		=> io_EEP_I2C_SDA								-- Data to/from external I2C interface
	);

	-- ANSI Video Display 80x25
	-- Command set from Multicomp project
	SVGA : entity work.ANSIDisplayVGA
		port map (
			n_reset			=> n_reset,
			clk				=> i_CLOCK_50,
			n_wr				=> not (ANSI_DisplayCS and i_peripheralWrStrobe),
			n_rd				=> not (ANSI_DisplayCS and i_peripheralRdStrobe),
			regSel			=> i_peripheralAddress(0),
			dataIn			=> i_dataToPeripherals(7 downto 0),
			dataOut			=> w_ANSI_DispRamDataOutA,
			videoR0			=> o_VideoOut(5),
			videoR1			=> o_VideoOut(4),
			videoG0			=> o_VideoOut(3),
			videoG1			=> o_VideoOut(2),
			videoB0			=> o_VideoOut(1),
			videoB1			=> o_VideoOut(0),
			hSync  			=> o_hSync,
			vSync  			=> o_vSync,
			o_hActive		=> o_hActive
			);
	
	-- Timers unit
	-- CPU ticks (1 clock per RISC instruction)
	-- mSec clock
	-- uSec clock
	-- Elapsed time clock (50 MHz clocks)
	timers : entity work.Timer_Unit
	port map (
		n_reset						=> n_reset,
		i_CLOCK_50					=> i_CLOCK_50,
		i_OneHotState				=> i_OneHotState,
 		i_peripheralWrStrobe		=> w_TimersCS and i_peripheralWrStrobe,
		i_peripheralAddress		=> i_peripheralAddress,
		i_dataToTimers				=> i_dataToPeripherals,
		o_dataFromTimers			=> o_dataFromTimers
		);
	
	-- Latch the note value (sound generator)
	NoteLatch	: ENTITY work.SoundGen
	PORT MAP (
    clk 		=> i_CLOCK_50,
    d 		=> i_dataToPeripherals(7 downto 0),
    ld 		=> w_NoteCS and i_peripheralWrStrobe,
    clr  	=> not n_reset,
    o_Note	=> o_Note
	);
	
	-- Seven Segment Display
	-- Can be used with boards that have 4 or 8 Seven Segment Displays
	-- 4 Displays would use lower 16-bits
	SevenSegDisplay : entity work.Loadable_7S8D_LED
    Port map ( 
		i_CLOCK_50Mhz 			=> i_CLOCK_50,
      i_reset					=> not n_reset,
		i_displayed_number	=> w_displayed_number,
      o_Anode_Activate		=> o_Anode_Activate,
      o_LED7Seg_out			=> o_LED7Seg_out		-- Cathode patterns of 7-segment display
	);
	
	-- Latch seven segment display value
	-- 32-bits
	-- Can be used with boards that have 4 or 8 Seven Segment Displays
	-- 4 Displays would use lower 16-bits
	SevenSegmentDisplayLatch : ENTITY work.REG_32
	PORT MAP (
    clk 	=> i_CLOCK_50,
    d   	=> i_dataToPeripherals,
    ld  	=> w_7SEGCS and i_peripheralWrStrobe,
    clr 	=> not n_reset,
    q		=> w_displayed_number
	);
	
	-- General Purpose I/O lines
	-- Used on some cards to control LEDs
	-- Connected to speaker/buzzer enable on some cards
	LedBuzzerLatch	: ENTITY work.REG_8
	PORT MAP (
    clk 	=> i_CLOCK_50,
    d 	=> i_dataToPeripherals(7 downto 0),
    ld 	=> w_LEDsCS and i_peripheralWrStrobe,
    clr  => not n_reset,
    q    => w_LatData
	);
	
	-- General purpose I/O latch
	IOLatch	: ENTITY work.REG_8
	PORT MAP (
    clk 	=> i_CLOCK_50,
    d 	=> i_dataToPeripherals(7 downto 0),
    ld 	=> w_LatchIOCS and i_peripheralWrStrobe,
    clr  => not n_reset,
    q    => o_LatchIO
	);
	
	-- Ring LED
	-- Some of the cards have LEDs in a ring (4 sides with 4 LEDs per side, for example)
	o_LEDRing_out <= not w_LEDRing_out;
	LedRing	: ENTITY work.REG_16
	PORT MAP (
    clk 					=> i_CLOCK_50,
    d 					=> i_dataToPeripherals(15 downto 0),
    ld 					=> w_LEDRingCS and i_peripheralWrStrobe,
    clr  				=> not n_reset,
    q(11 downto 0)	=> w_LEDRing_out
	);
	
	-- Output LEDs (if the card has them
	o_LED <= w_LatData(3 downto 0);
	-- Buzzer enable - comes up with the buzzer off
	o_BUZZER <= not w_LatData(4);
	
	-- PS/2 keyboard - ASCII output
	ps2Keyboard : entity work.ps2_keyboard_to_ascii
	port map (
		clk			=> i_CLOCK_50,
		ps2_clk		=> i_PS2_CLK,
		ps2_data		=> i_PS2_DATA,	
		ascii_code	=> w_kbReadData,
		ascii_new	=> w_kbDataValid
	);
	
	-- Latch up the keyboard data when data valid signal is present

	process (i_CLOCK_50, n_reset, W_kbDataValid, w_kbReadData, w_kbDatCS, i_peripheralRdStrobe)
	begin
		if n_reset = '0' then
			w_latKbDV1 <= '0';
			w_kbdStatus <= x"00000000";
		elsif rising_edge(i_CLOCK_50)  then
			w_latKbDV1 <= W_kbDataValid;
			if W_kbDataValid = '1' and w_latKbDV1 = '0' then
				w_kbdStatus <= x"00000001";			-- set at edge of dataValid
				q_kbReadData <= x"000000" & '0' & w_kbReadData;
			elsif ((w_kbDatCS = '1') and (i_peripheralRdStrobe = '1')) then
				w_kbdStatus <= x"00000000";
			end if;
		end if;
	end process;

	-- Switch debouncers
	DebounceSwitch1	: entity work.Debouncer
	port map (
		i_CLOCK_50	=> i_CLOCK_50,
		i_PinIn		=> i_switch(0),
		o_PinOut		=> w_Switch(0)
	);
	
	DebounceSwitch2	: entity work.Debouncer
	port map (
		i_CLOCK_50	=> i_CLOCK_50,
		i_PinIn		=> i_switch(1),
		o_PinOut		=> w_Switch(1)
	);
	
	DebounceSwitch3	: entity work.Debouncer
	port map (
		i_CLOCK_50	=> i_CLOCK_50,
		i_PinIn		=> i_switch(2),
		o_PinOut		=> w_Switch(2)
	);

	-- 6850 ACIA (UART)
	-- Runs up to 115,200 baud
	UART : entity work.bufferedUART
		port map(
			clk 		=> i_CLOCK_50,
			n_wr 		=> not (w_aciaCS and i_peripheralWrStrobe),
			n_rd 		=> not (w_aciaCS and i_peripheralRdStrobe),
			regSel 	=> i_peripheralAddress(0),
			dataIn 	=> i_dataToPeripherals(7 downto 0),
			dataOut 	=> w_aciaData,
			rxClkEn 	=> w_serialClkEn,
			txClkEn 	=> w_serialClkEn,
			rxd 		=> i_rxd,
			txd 		=> o_txd,
			n_cts 	=> i_cts,
			n_dcd 	=> '0',
			n_rts 	=> o_rts
		);

	-- ____________________________________________________________________________________
	-- Serial Port Baud Rate Clock Signals
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
			w_serialClkCount_d <= w_serialClkCount + 2416;		-- 115,200 baud
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
