library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX_16x32 is port
	r0 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r1 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r2 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r3 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r4 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r5 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r6 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r7 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r8 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r9 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r10 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r11 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r12 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r13 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r14 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    r15 : 	IN  STD_LOGIC_VECTOR(31 downto 0);
    sel : 	IN STD_LOGIC_VECTOR(3 downto 0);
    z : 	OUT STD_LOGIC_VECTOR(31 downto 0)
end MUX_16x32;
 
architecture sim of MUX_16x32 is
  
begin
 
mux : process (r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,sel) is
	begin
		case sel is	
			when "0000" =>
				z <= r0;
			when "0001" =>
				z <= r1;
			when "0010" =>
				z <= r2;
			when "0011" =>
				z <= r3;
			when "0100" =>
				z <= r4;
			when "0101" =>
				z <= r5;
			when "0110" =>
				z <= r6;
			when "0111" =>
				z <= r7;
			when "1000" =>
				z <= r8;
			when "1001" =>
				z <= r9;
			when "1010" =>
				z <= r10;
			when "1011" =>
				z <= r11;
			when "1100" =>
				z <= r12;
			when "1101" =>
				z <= r13;
			when "1110" =>
				z <= r14;
			when "1111" =>
				z <= r15;

		end case;
	end process mux;

end architecture;
