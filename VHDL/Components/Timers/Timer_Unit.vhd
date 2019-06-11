-- Timer/Counter Unit
-- Contains three counters
--		System clock counter (when 50 MHz clock, counts are in 20 nS increments)
--		microsecond counter (accuracy is +/- 1 uS)
--		millisecond counter (accuracy is +/- 1 mSec)

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Timer_Unit is
	port(
		n_reset						: in std_logic := '1';
		i_CLOCK_50					: in std_logic := '1';
		i_OneHotState				: in std_logic_vector := "000000";
		-- Peripheral Memory Mapped Space Address/Data/Control lines
		i_peripheralAddress		: in std_logic_vector(31 downto 0) := x"00000000";
		i_dataToTimers				: in std_logic_vector(31 downto 0) := x"00000000";
		o_dataFromTimers			: out std_logic_vector(31 downto 0) := x"00000000";
 		i_peripheralWrStrobe		: in std_logic := '1'
		);
	end Timer_Unit;

	architecture struct of Timer_Unit is

	--attribute syn_keep: boolean;
	-- Peripheral Signals
	signal w_ElapsedTimeCount	:	std_logic_vector(31 downto 0);
	signal q_MicrosecondScaler	: 	std_logic_vector(5 downto 0);
	signal q_MicrosecondCounter	: 	std_logic_vector(31 downto 0);
	signal q_MillisecondScaler	: 	std_logic_vector(10 downto 0);
	signal q_MillisecondCounter	: 	std_logic_vector(31 downto 0);

begin
	o_dataFromTimers <= 
	w_ElapsedTimeCount when i_peripheralAddress(2 downto 0) = "000" else
	q_MicrosecondCounter when i_peripheralAddress(2 downto 0) = "001" else
	q_MillisecondCounter when i_peripheralAddress(2 downto 0) = "010" else
	x"00000000";

	-- Elapsed Time Counter
	ETC : entity work.COUNT_32
    Port map (
    clk 		=> i_CLOCK_50,
    clr 		=> not n_reset,
    d   		=> x"00000000",
    enable	=> '1',
    inc 		=> '1',
    dec		=> '0',
    q   		=> w_ElapsedTimeCount
	 );
	 
	process (i_CLOCK_50)
	begin
		if (n_reset='0') then
			q_MicrosecondScaler 	<= (others => '0');
			q_MicrosecondCounter 	<= (others => '0');
			q_MillisecondScaler	<= (others => '0');
			q_MillisecondCounter 	<= (others => '0');
		elsif(rising_edge(i_CLOCK_50)) then
			if (q_MicrosecondScaler < 40) then
				q_MicrosecondScaler <= q_MicrosecondScaler + 1;
			else	-- Microsecond terminal count
				q_MicrosecondScaler <= (others => '0');
				q_MicrosecondCounter <= q_MicrosecondCounter + 1;
				if (q_MillisecondScaler < 1000) then	-- millisecond scaler
					q_MillisecondScaler <= q_MillisecondScaler + 1;
				else
					q_MillisecondScaler <= (others => '0');
					q_MillisecondCounter <= q_MillisecondCounter + 1;
				end if;
			end if;
			
		end if;
	end process;
	
end struct;
