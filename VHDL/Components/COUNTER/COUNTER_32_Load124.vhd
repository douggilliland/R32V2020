library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY COUNT_32_Load124 IS PORT(
    clk 		: IN STD_LOGIC; -- clock
    clr 		: IN STD_LOGIC; -- async. clear.
    d   		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    enable	: IN STD_LOGIC; -- load/enable
	 count1	: IN STD_LOGIC; -- 
	 count2	: IN STD_LOGIC; -- 
	 count4	: IN STD_LOGIC; -- 
    q   		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- output
);
END COUNT_32_Load124;

ARCHITECTURE description OF COUNT_32_Load124 IS

signal Pre_Q : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN
    process(clk, clr, count1, count2, count4, enable)
    begin
        if clr = '1' then
            Pre_Q <= x"00000000";
        elsif rising_edge(clk) then
            if enable = '1' and count1 = '0' and count2 = '0' and count4 = '0' then	-- load
                Pre_Q <= d;
				elsif enable = '1' and count1 = '1' then	-- increment by 1
					Pre_Q <= Pre_Q + 1;
				elsif enable = '1' and count2 = '1' then	-- increment by 2
					Pre_Q <= Pre_Q + 2;
				elsif enable = '1' and count4 = '1' then	-- increment by 4
					Pre_Q <= Pre_Q + 4;
            end if;
        end if;
    end process;
	 q <= Pre_Q;
END description;
