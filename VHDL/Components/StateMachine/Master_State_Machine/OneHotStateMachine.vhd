-- Master State Machine for the R32V2020 CPU
-- State Machine implements a 6-bit, 1 hot state machine
-- Uses a three-bit gray-code counter which is decoded for states
-- States are 0>1>3>7>5>4
-- clr resets the state machine and holds it in clear
-- One-Hot-State bits are used as clock enables for the pipeline stages

library ieee;
use ieee.std_logic_1164.all;

ENTITY OneHotStateMachine IS PORT
(
    clk 	: IN STD_LOGIC := '0'; -- clock.
    clr 	: IN STD_LOGIC := '0'; -- async. clear.
	 hold	: IN STD_LOGIC := '0';
    state   : OUT STD_LOGIC_VECTOR(5 downto 0)  := "000000" -- output.
);
END OneHotStateMachine;

ARCHITECTURE rtl OF OneHotStateMachine IS

signal	Pre_Q	: STD_LOGIC_VECTOR (5 downto 0) := "000000";

BEGIN
	StateGen: process(clk, clr, Pre_Q, hold)
	begin
		if clr = '1' then 
			Pre_Q <= "000000";
			state <= "000000";
		elsif rising_edge(clk) and hold = '0' then
			if 	   Pre_Q = "000000" then Pre_Q <= "000001";
				elsif	Pre_Q = "000001" then Pre_Q <= "000010";
				elsif	Pre_Q = "000010" then Pre_Q <= "000100";
				elsif	Pre_Q = "000100" then Pre_Q <= "001000";
				elsif	Pre_Q = "001000" then Pre_Q <= "010000";
				elsif	Pre_Q = "010000" then Pre_Q <= "100000";
				elsif	Pre_Q = "100000" then Pre_Q <= "000001";
			end if;
			state <= Pre_Q;		-- state lags Pre_Q by one clock
		end if;
    end process;
END rtl;
