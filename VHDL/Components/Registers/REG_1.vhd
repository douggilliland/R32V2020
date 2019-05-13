library ieee;
use ieee.std_logic_1164.all;

ENTITY REG_1 IS PORT(
    d   : IN STD_LOGIC;
    ld  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT STD_LOGIC -- output.
);
END REG_1;

ARCHITECTURE description OF REG_1 IS

BEGIN
    process(clk, clr)
    begin
        if clr = '1' then
            q <= '0';
        elsif rising_edge(clk) then
            if ld = '1' then
                q <= d;
            end if;
        end if;
    end process;
END description;