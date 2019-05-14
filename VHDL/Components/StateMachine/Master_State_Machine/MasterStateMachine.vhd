-- Master State Machine for the R32V2020 CPU
-- State Machine implements a 6-bit, 1 hot state machine
-- States are 0>1>3>2>6>4

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
            if 		Pre_Q = "000" then Pre_Q <= "001";
			elsif	Pre_Q = "001" then Pre_Q <= "011";
			elsif	Pre_Q = "011" then Pre_Q <= "010";
			elsif	Pre_Q = "010" then Pre_Q <= "110";
			elsif	Pre_Q = "110" then Pre_Q <= "100";
			elsif	Pre_Q = "100" then Pre_Q <= "000";
            end if;
        end if;
    state(0) <= (not Pre_Q(2)) and (not Pre_Q(1)) and (not Pre_Q(0));
    state(1) <= (not Pre_Q(2)) and (not Pre_Q(1)) and (Pre_Q(0));
    state(2) <= (not Pre_Q(2)) and (Pre_Q(1)) and (Pre_Q(0));
    state(3) <= (not Pre_Q(2)) and (Pre_Q(1)) and (not Pre_Q(0));
    state(4) <= (Pre_Q(2)) and (Pre_Q(1)) and (not Pre_Q(0));
    state(5) <= (Pre_Q(2)) and (not Pre_Q(1)) and (not Pre_Q(0));
    end process;
        
END rtl;
