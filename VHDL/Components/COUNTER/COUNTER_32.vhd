library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY COUNT_32 IS PORT(
    d   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ld  : IN STD_LOGIC; -- load/enable
    inc : IN STD_LOGIC; -- increment counter
    dec: IN STD_LOGIC; -- decrement counter
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock
    q   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- output
);
END COUNT_32;

ARCHITECTURE description OF COUNT_32 IS

signal Pre_Q : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN
    process(clk, clr, inc, ld)
    begin
        if clr = '1' then
            Pre_Q <= "00000000000000000000000000000000";
        elsif rising_edge(clk) then
            if ld = '1' then
                Pre_Q <= d;
				elsif inc = '1' then	
					Pre_Q <= Pre_Q + 1;
				elsif dec = '1' then
					Pre_Q <= Pre_Q - 1;
            end if;
        end if;
    end process;
	 q <= Pre_Q;
END description;
