-- Debouncer

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Debouncer is
	port(
		i_CLOCK_50					: in std_logic := '1';
		i_PinIn						: in std_logic := '1';
		o_PinOut						: out std_logic := '1'
	);

end Debouncer;

architecture struct of Debouncer is
	
	signal dig_counter	: std_logic_vector (19 downto 0) := (others => '0');
	signal pulse200ms		: std_logic;
	
	signal dly1		: std_logic;
	signal dly2		: std_logic;
	signal dly3		: std_logic;
	signal dly4		: std_logic;

begin

	----------------------------------------------------------------------------
	-- 200 mS counter
	-- 2^18 = 256,000, 50M/250K = 200 mS ticks
	-- Used for prescaling pushbuttons
	-- pulse200ms = single 20 nS clock pulse every 200 mSecs
	----------------------------------------------------------------------------
	process (i_CLOCK_50) begin
		if rising_edge(i_CLOCK_50) then
			dig_counter <= dig_counter+1;
			if dig_counter(17 downto 0) = 0 then
				pulse200ms <= '1';
			else
				pulse200ms <= '0';
			end if;
		end if;
	end process;

	process(i_CLOCK_50, pulse200ms)
	begin
		if(rising_edge(i_CLOCK_50)) then
			if pulse200ms = '1' then
				dly1 <= not i_PinIn;
			end if;
		end if;
	end process;
	
	process(i_CLOCK_50, pulse200ms)
	begin
		if(rising_edge(i_CLOCK_50)) then
			if pulse200ms = '1' then
				dly2 <= dly1;
			end if;
		end if;
	end process;

	process(i_CLOCK_50)
	begin
		if(rising_edge(i_CLOCK_50)) then
		dly3 <= dly2;
		end if;
	end process;

	process(i_CLOCK_50)
	begin
		if(rising_edge(i_CLOCK_50)) then
			dly4 <= dly3;
		end if;
	end process;

	process(i_CLOCK_50)
	begin
		if(rising_edge(i_CLOCK_50)) then
			o_PinOut <= not(dly4 and (not dly3));
		end if;
	end process;

end;
