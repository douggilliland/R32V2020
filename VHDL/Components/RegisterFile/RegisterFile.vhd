library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity RegisterFile is
	port (
		clk			: in std_logic;
		clear			: in std_logic;
		wrStrobe		: in std_logic;
		wrRegSel		: in std_logic_vector(3 downto 0);
		rdRegSelA	: in std_logic_vector(3 downto 0);
		rdRegSelB	: in std_logic_vector(3 downto 0);
		regDataIn	: in std_logic_vector(31 downto 0);
		regDataOutA	: out std_logic_vector(31 downto 0);
		regDataOutB	: out std_logic_vector(31 downto 0)
	);
end RegisterFile;

architecture struct of RegisterFile is

	signal regR0			: std_logic_vector(31 downto 0);
	signal regR1			: std_logic_vector(31 downto 0);
	signal regR2			: std_logic_vector(31 downto 0);
	signal regR3			: std_logic_vector(31 downto 0);
	signal regR4			: std_logic_vector(31 downto 0);
	signal regR5			: std_logic_vector(31 downto 0);
	signal regR6			: std_logic_vector(31 downto 0);
	signal regR7			: std_logic_vector(31 downto 0);
	signal regR8			: std_logic_vector(31 downto 0);
	signal regR9			: std_logic_vector(31 downto 0);
	signal regR10			: std_logic_vector(31 downto 0);
	signal regR11			: std_logic_vector(31 downto 0);
	signal regR12			: std_logic_vector(31 downto 0);
	signal regR13			: std_logic_vector(31 downto 0);
	signal regR14			: std_logic_vector(31 downto 0);
	signal regR15			: std_logic_vector(31 downto 0);
	
	signal wrSelR0			: std_logic;
	signal wrSelR1			: std_logic;
	signal wrSelR2			: std_logic;
	signal wrSelR3			: std_logic;
	signal wrSelR4			: std_logic;
	signal wrSelR5			: std_logic;
	signal wrSelR6			: std_logic;
	signal wrSelR7			: std_logic;
	signal wrSelR8			: std_logic;
	signal wrSelR9			: std_logic;
	signal wrSelR10		: std_logic;
	signal wrSelR11		: std_logic;
	signal wrSelR12		: std_logic;
	signal wrSelR13		: std_logic;
	signal wrSelR14		: std_logic;
	signal wrSelR15		: std_logic;
	
begin

wrSelR0 <= '1' when ((wrRegSel = "0000") and (wrStrobe = '1')) else '0';
wrSelR1 <= '1' when ((wrRegSel = "0001") and (wrStrobe = '1')) else '0';
wrSelR2 <= '1' when ((wrRegSel = "0010") and (wrStrobe = '1')) else '0';
wrSelR3 <= '1' when ((wrRegSel = "0011") and (wrStrobe = '1')) else '0';
wrSelR4 <= '1' when ((wrRegSel = "0100") and (wrStrobe = '1')) else '0';
wrSelR5 <= '1' when ((wrRegSel = "0101") and (wrStrobe = '1')) else '0';
wrSelR6 <= '1' when ((wrRegSel = "0110") and (wrStrobe = '1')) else '0';
wrSelR7 <= '1' when ((wrRegSel = "0111") and (wrStrobe = '1')) else '0';
wrSelR8 <= '1' when ((wrRegSel = "1000") and (wrStrobe = '1')) else '0';
wrSelR9 <= '1' when ((wrRegSel = "1001") and (wrStrobe = '1')) else '0';
wrSelR10 <= '1' when ((wrRegSel = "1010") and (wrStrobe = '1')) else '0';
wrSelR11 <= '1' when ((wrRegSel = "1011") and (wrStrobe = '1')) else '0';
wrSelR12 <= '1' when ((wrRegSel = "1100") and (wrStrobe = '1')) else '0';
wrSelR13 <= '1' when ((wrRegSel = "1101") and (wrStrobe = '1')) else '0';
wrSelR14 <= '1' when ((wrRegSel = "1110") and (wrStrobe = '1')) else '0';
wrSelR15 <= '1' when ((wrRegSel = "1111") and (wrStrobe = '1')) else '0';

r0 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR0,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR0
);

r1 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR1,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR1
);

r2 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR2,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR2
);

r3 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR3,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR3
);

r4 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR4,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR4
);

r5 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR5,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR5
);

r6 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR6,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR6
);

r7 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR7,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR7
);

r8 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR8,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR8
);

r9 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR9,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR9
);

r10 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR10,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR10
);

r11 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR11,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR11
);

r12 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR12,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR12
);

r13 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR13,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR13
);

r14 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR14,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR14
);

r15 : work.REG_32 PORT MAP(
    d 	=> regDataIn,
    ld 	=> wrSelR15,
    clr 	=> clear,
    clk	=> clk,
    q		=> regR15
);

muxA : work.MUX_16x32 PORT MAP (
	r0 => regR0,
   r1 => regR1,
   r2 => regR2,
   r3 => regR3,
   r4 => regR4,
   r5 => regR5,
   r6 => regR6,
   r7 => regR7,
   r8 => regR8,
   r9 => regR9,
   r10 => regR10,
   r11 => regR11,
   r12 => regR12,
   r13 => regR13,
   r14 => regR14,
   r15 => regR15,
   sel => rdRegSelA,
   z => regDataOutA
);

muxB : work.MUX_16x32 PORT MAP (
	r0 => regR0,
   r1 => regR1,
   r2 => regR2,
   r3 => regR3,
   r4 => regR4,
   r5 => regR5,
   r6 => regR6,
   r7 => regR7,
   r8 => regR8,
   r9 => regR9,
   r10 => regR10,
   r11 => regR11,
   r12 => regR12,
   r13 => regR13,
   r14 => regR14,
   r15 => regR15,
   sel => rdRegSelB,
   z => regDataOutB
);

end;
