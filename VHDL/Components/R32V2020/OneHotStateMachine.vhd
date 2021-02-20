-----------------------------------------------------------------------
-- Master State Machine for the R32V2020 CPU
-- State Machine implements a 5-bit, 1 hot state machine
-- clr resets the state machine and holds it in clear
-- One-Hot-State bits are used as clock enables for the pipeline stages

library ieee;
use ieee.std_logic_1164.all;

ENTITY OneHotStateMachine IS PORT
(
    clk 		: IN STD_LOGIC := '0'; -- clock.
    clr 		: IN STD_LOGIC := '0'; -- async. clear.
	 hold		: IN STD_LOGIC := '0';
    state   : OUT STD_LOGIC_VECTOR(3 downto 0)  := "0000" -- output.
);
END OneHotStateMachine;

ARCHITECTURE rtl OF OneHotStateMachine IS

signal	Pre_Q	: STD_LOGIC_VECTOR (3 downto 0) := "0000";

BEGIN
	StateGen: process(clk, clr, Pre_Q, hold)
	begin
		if clr = '1' then 
			Pre_Q <= "0000";
			state <= "0000";
		elsif rising_edge(clk) and hold = '0' then
			if 	   Pre_Q = "0000" then Pre_Q <= "0001";
				elsif	Pre_Q = "0001" then Pre_Q <= "0010";
				elsif	Pre_Q = "0010" then Pre_Q <= "0100";
				elsif	Pre_Q = "0100" then Pre_Q <= "1000";
				elsif	Pre_Q = "1000" then Pre_Q <= "0001";
			end if;
			state <= Pre_Q;		-- state lags Pre_Q by one clock
		end if;
    end process;
END rtl;
