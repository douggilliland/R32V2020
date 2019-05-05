library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX_16x32 is port (
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
	 );
end MUX_16x32;
 
architecture sim of MUX_16x32 is
  
begin
 
mux : process (r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,sel) is
	begin
		case sel is	
			when x"0" =>
				z <= r0;
			when x"1" =>
				z <= r1;
			when x"2" =>
				z <= r2;
			when x"3" =>
				z <= r3;
			when x"4" =>
				z <= r4;
			when x"5" =>
				z <= r5;
			when x"6" =>
				z <= r6;
			when x"7" =>
				z <= r7;
			when x"8" =>
				z <= r8;
			when x"9" =>
				z <= r9;
			when x"A" =>
				z <= r10;
			when x"B" =>
				z <= r11;
			when x"C" =>
				z <= r12;
			when x"D" =>
				z <= r13;
			when x"E" =>
				z <= r14;
			when x"F" =>
				z <= r15;

		end case;
	end process mux;

end architecture;
