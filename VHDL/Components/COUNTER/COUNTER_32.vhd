library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY COUNT_32 IS PORT(
    clk 		: IN STD_LOGIC; -- clock
    clr 		: IN STD_LOGIC; -- async. clear.
    d   		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    enable	: IN STD_LOGIC; -- load/enable
    inc 		: IN STD_LOGIC; -- increment counter
    dec		: IN STD_LOGIC; -- decrement counter
    q   		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- output
);
END COUNT_32;

ARCHITECTURE description OF COUNT_32 IS

signal Pre_Q : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN
    process(clk, clr, inc, enable, dec)
    begin
        if clr = '1' then
            Pre_Q <= x"00000000";
        elsif rising_edge(clk) then
            if enable = '1' and inc = '0' and dec = '0' then	-- load
                Pre_Q <= d;
				elsif enable = '1' and inc = '1' then					-- increment
					Pre_Q <= Pre_Q + 1;
				elsif enable = '1' and dec = '1' then					-- decrement
					Pre_Q <= Pre_Q - 1;
            end if;
        end if;
    end process;
	 q <= Pre_Q;
END description;
