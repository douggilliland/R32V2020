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
    clk 	: IN STD_LOGIC; -- clock.
    clr 	: IN STD_LOGIC; -- async. clear.
    state   : OUT STD_LOGIC_VECTOR(5 downto 0) -- output.
);
END OneHotStateMachine;

ARCHITECTURE rtl OF OneHotStateMachine IS

signal	Pre_Q	: STD_LOGIC_VECTOR (5 downto 0);

BEGIN
    StateGen: process(clk, clr, Pre_Q)
    begin
        if clr = '1' then
            Pre_Q <= "000000";
			state <= "000000";
        elsif rising_edge(clk) then
            if 		Pre_Q = "000000" then Pre_Q <= "000001";	-- State(0) asserted next cycle
			elsif	Pre_Q = "000001" then Pre_Q <= "000010";	-- State(1) asserted next cycle
			elsif	Pre_Q = "000010" then Pre_Q <= "000100";	-- State(2) asserted next cycle
			elsif	Pre_Q = "000100" then Pre_Q <= "001000";	-- State(3) asserted next cycle
			elsif	Pre_Q = "001000" then Pre_Q <= "010000";	-- State(4) asserted next cycle
			elsif	Pre_Q = "010000" then Pre_Q <= "100000";	-- State(5) asserted next cycle
			elsif	Pre_Q = "100000" then Pre_Q <= "000001";	-- State(5) asserted next cycle
            end if;
			state <= Pre_Q;
        end if;
    end process;
END rtl;
