-------------------------------------------------------------------[01.09.2013]
-- SPI Master
-- From: https://raw.githubusercontent.com/mvvproject/ReVerSE-U16/master/u16_zxpoly/rtl/spi/spi.vhd
-------------------------------------------------------------------------------
-- Engineer: 	MVV
-- Translated from Russian: DGG (using google translate)
--
-- 31.01.2011	First version
-- 31.08.2013	Completely rewritten. Independent work from system clock
-- 01.09.2013	Interface changes
-- 07.15.2019	Port to R32V2020 CPU

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity spi is
	port (
		RESET		: in std_logic;							-- 1 = controller reset
		CPU_CLK	: in std_logic;							-- System clock frequency
		SPI_CLK	: in std_logic;							-- SPI data transmission synchronization frequency
		A     	: in std_logic;							-- Address: 0 = data register; 1 = control register
		DI			: in std_logic_vector(7 downto 0);	-- 8-bit data bus, input
		DO			: out std_logic_vector(7 downto 0);	-- 8-bit data bus, output
		WR			: in std_logic;							-- 1 = enable write to data register or control register
		BUSY		: out std_logic;							-- 1 = busy transferring; 0 = free
		CS_n		: out std_logic;							-- Slave select output (chip select) - active low
		SCLK		: out std_logic;							-- Data sync output
		MOSI		: out std_logic;							-- Serial output
		MISO		: in std_logic								-- Serial data input
		);
end;

architecture rtl of spi is
	signal cnt			: std_logic_vector(2 downto 0) := "000";			-- Transmit / Receive Bit Count
	signal shift_reg	: std_logic_vector(7 downto 0) := "11111111";	-- Shift register
	signal cs			: std_logic := '1';
	signal buffer_reg	: std_logic_vector(7 downto 0) := "11111111";
	signal state		: std_logic := '0';
	signal start		: std_logic := '0';
	
begin
	-- Latch Control line (write from CPU to SPI control register)
	--	A = 1 - Write d0 value to Chip Select
	process (RESET, CPU_CLK, A, WR, DI)
	begin
		if (RESET = '1') then
			cs <= '1';
		elsif rising_edge(CPU_CLK) then
			if (WR = '1' and A = '0') then
				buffer_reg <= DI;
			elsif (WR = '1' and A = '1') then
				cs <= DI(0);
			end if;
		end if;
	end process;
	
	-- start
	process (RESET, CPU_CLK, A, WR, state)
	begin
		if (RESET = '1' or state = '1') then
			start <= '0';
		elsif rising_edge(CPU_CLK) then
			if (WR = '1' and A = '0') then
				start <= '1';
			end if;
		end if;
	end process;

	process (RESET, SPI_CLK, start, buffer_reg)
	begin
		if (RESET = '1') then
			state <= '0';
			cnt <= "000";
			shift_reg <= "11111111";
		elsif falling_edge(SPI_CLK) then
			case state is
				when '0' =>
					if (start = '1') then		
						shift_reg <= buffer_reg;	-- Load shift register from buffer register
						cnt <= "000";
						state <= '1';
					end if;
				when '1' =>
					if (cnt	= "111") then state <= '0'; end if;	-- Count 8 bits out
					shift_reg <= shift_reg(6 downto 0) & MISO;	-- Read (from SPI slave to CPU)
					cnt <= cnt + 1;
				when others => null;
			end case;
		end if;
	end process;
	
BUSY	<= state;
DO		<= shift_reg;
CS_n	<= cs;
MOSI	<= shift_reg(7);
SCLK	<= SPI_CLK when state = '1' else '0';

end rtl;
