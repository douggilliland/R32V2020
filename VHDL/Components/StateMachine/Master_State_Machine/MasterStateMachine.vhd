-- Master State Machine for the R32V2020 CPU
-- State Machine implements a 6-bit, 1 hot state machine
-- Uses a three-bit gray-code counter which is decoded for states
-- States are 0>1>3>7>5>4
-- clr resets the state machine and holds it in clear

library ieee;
use ieee.std_logic_1164.all;

ENTITY MasterStateMachine IS PORT
(
    clk 	: IN STD_LOGIC; -- clock.
    clr 	: IN STD_LOGIC; -- async. clear.
    state   : OUT STD_LOGIC_VECTOR(5 downto 0) -- output.
);
END MasterStateMachine;

ARCHITECTURE rtl OF MasterStateMachine IS

signal	Pre_Q	: STD_LOGIC_VECTOR (2 downto 0);

BEGIN
    StateGen: process(clk, clr, Pre_Q)
    begin
        if clr = '1' then
            Pre_Q <= "000";
			state <= "000001";
        elsif rising_edge(clk) then
            if 		Pre_Q = "000" then Pre_Q <= "001";	-- State(0) asserted next cycle
			elsif	Pre_Q = "001" then Pre_Q <= "011";	-- State(1) asserted next cycle
			elsif	Pre_Q = "011" then Pre_Q <= "111";	-- State(2) asserted next cycle
			elsif	Pre_Q = "111" then Pre_Q <= "101";	-- State(3) asserted next cycle
			elsif	Pre_Q = "101" then Pre_Q <= "100";	-- State(4) asserted next cycle
			elsif	Pre_Q = "100" then Pre_Q <= "000";	-- State(5) asserted next cycle
            end if;
        end if;
        if rising_edge(clk) then
			if clr = '1' then state <= "000000";
            elsif   Pre_Q = "000" then state <= "000001";	-- State(0) asserted next cycle
			elsif	Pre_Q = "001" then state <= "000010";	-- State(1) asserted next cycle
			elsif	Pre_Q = "011" then state <= "000100";	-- State(2) asserted next cycle
			elsif	Pre_Q = "111" then state <= "001000";	-- State(3) asserted next cycle
			elsif	Pre_Q = "101" then state <= "010000";	-- State(4) asserted next cycle
			elsif	Pre_Q = "100" then state <= "100000";	-- State(5) asserted next cycle
			end if;
        end if;
    end process;
END rtl;
