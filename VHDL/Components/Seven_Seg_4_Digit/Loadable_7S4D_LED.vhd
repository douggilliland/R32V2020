---------------------------------------------------------------------------------------------
-- Taken from fpga4student.com
-- https://www.fpga4student.com/2017/09/vhdl-code-for-seven-segment-display.html
-- VHDL code for seven-segment display
---------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
entity Loadable_7S4D_LED is
    Port ( clock_50Mhz : in STD_LOGIC;
           reset : in STD_LOGIC; -- reset
			  displayed_number : in STD_LOGIC_VECTOR (15 downto 0);
           Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0);-- 4 Anode signals
           LED_out : out STD_LOGIC_VECTOR (6 downto 0));-- Cathode patterns of 7-segment display
end Loadable_7S4D_LED;

architecture Behavioral of Loadable_7S4D_LED is
signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
signal refresh_counter: STD_LOGIC_VECTOR (19 downto 0);
-- creating 10.5ms refresh period
signal LED_activating_counter: std_logic_vector(1 downto 0);
-- the other 2-bit for creating 4 LED-activating signals
-- count         0    ->  1  ->  2  ->  3
-- activates    LED1    LED2   LED3   LED4
-- and repeat
begin
-- VHDL code for BCD to 7-segment decoder
-- Cathode patterns of the 7-segment LED display 
process(LED_BCD)
begin
    case LED_BCD is
    when x"0" => LED_out <= "1111110"; -- "0" - bit order is a thru g
    when x"1" => LED_out <= "0110000"; -- "1" 
    when x"2" => LED_out <= "1101101"; -- "2" 
    when x"3" => LED_out <= "1111001"; -- "3" 
    when x"4" => LED_out <= "0110011"; -- "4" 
    when x"5" => LED_out <= "1011011"; -- "5" 
    when x"6" => LED_out <= "1011111"; -- "6" 
    when x"7" => LED_out <= "1110000"; -- "7" 
    when x"8" => LED_out <= "1111111"; -- "8"     
    when x"9" => LED_out <= "1111011"; -- "9" 
    when x"A" => LED_out <= "1111101"; -- a
    when x"B" => LED_out <= "0011111"; -- b
    when x"C" => LED_out <= "1001110"; -- C
    when x"D" => LED_out <= "0111101"; -- d
    when x"E" => LED_out <= "1001111"; -- E
    when x"F" => LED_out <= "1000111"; -- F
    end case;
end process;
-- 7-segment display controller
-- generate refresh period of 10.5ms
process(clock_50Mhz,reset)
begin 
    if(reset='1') then
        refresh_counter <= (others => '0');
    elsif(rising_edge(clock_50Mhz)) then
        refresh_counter <= refresh_counter + 1;
    end if;
end process;
 LED_activating_counter <= refresh_counter(19 downto 18);
-- 4-to-1 MUX to generate anode activating signals for 4 LEDs 
process(LED_activating_counter)
begin
    case LED_activating_counter is
    when "00" =>
        Anode_Activate <= "0111"; 
        -- activate LED1 and Deactivate LED2, LED3, LED4
        LED_BCD <= displayed_number(15 downto 12);
        -- the first hex digit of the 16-bit number
    when "01" =>
        Anode_Activate <= "1011"; 
        -- activate LED2 and Deactivate LED1, LED3, LED4
        LED_BCD <= displayed_number(11 downto 8);
        -- the second hex digit of the 16-bit number
    when "10" =>
        Anode_Activate <= "1101"; 
        -- activate LED3 and Deactivate LED2, LED1, LED4
        LED_BCD <= displayed_number(7 downto 4);
        -- the third hex digit of the 16-bit number
    when "11" =>
        Anode_Activate <= "1110"; 
        -- activate LED4 and Deactivate LED2, LED3, LED1
        LED_BCD <= displayed_number(3 downto 0);
        -- the fourth hex digit of the 16-bit number    
    end case;
end process;

end Behavioral;