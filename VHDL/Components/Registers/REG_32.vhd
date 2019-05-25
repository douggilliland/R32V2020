library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY REG_32 IS PORT(
    clk : IN STD_LOGIC; -- clock.
    clr : IN STD_LOGIC; -- async. clear.
    d   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ld  : IN STD_LOGIC; -- load/enable.
    q   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- output
);
END REG_32;

ARCHITECTURE description OF REG_32 IS

BEGIN
    process(clk,clr,ld)
    begin
        if clr = '1' then
            q <= x"00000000";
        elsif rising_edge(clk) then
            if ld = '1' then
                q <= d;
            end if;
        end if;
    end process;
END description;
