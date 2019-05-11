library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY REG_32_CONSTANT IS PORT(
    d   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ld  : IN STD_LOGIC; 									-- load/enable.
    clr : IN STD_LOGIC; 									-- async. clear.
    clk : IN STD_LOGIC; 									-- clock.
    constVal   : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- Register load value
    q   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 			-- output
);
END REG_32_CONSTANT;

ARCHITECTURE description OF REG_32_CONSTANT IS

BEGIN
    process(clk, clr, constVal)
    begin
        if clr = '1' then
            q <= constVal;
        elsif rising_edge(clk) then
            if ld = '1' then
                q <= d;
            end if;
        end if;
    end process;
END description;
