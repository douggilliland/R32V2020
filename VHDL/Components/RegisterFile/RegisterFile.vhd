------------------------------------------------------------------
-- Register file
-- https://github.com/douggilliland/R32V2020/wiki/Register-File
-- 16 Registers
-- 32-bits wide
-- r0 - Always 0x0
-- r1 - Always 0x1
-- r2 - Always 0xffffffff
-- r3 - Condition Code Register
-- r4 - Stack Address Pointer
-- r5 - Peripheral Address Pointer
-- r6 - Data Address Pointer
-- r7 - Instruction Counter
-- r8-r15 - General Purpose Registers 

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity RegisterFile is
	port (
		i_clk							: in std_logic;
		i_clear						: in std_logic;
		i_enable						: in std_logic;	-- single clock wide load control
		i_TakeBranch				: in std_logic;
		i_wrRegSel					: in std_logic_vector(3 downto 0);
		i_rdRegSelA					: in std_logic_vector(3 downto 0);
		i_rdRegSelB					: in std_logic_vector(3 downto 0);
		i_regDataIn					: in std_logic_vector(31 downto 0);
		i_CCR							: in std_logic_vector(31 downto 0);
		o_regDataOutA				: out std_logic_vector(31 downto 0);
		o_regDataOutB				: out std_logic_vector(31 downto 0);
		o_StackRamAddress			: buffer std_logic_vector(31 downto 0);
		o_PeripheralAddress		: buffer std_logic_vector(31 downto 0);
		o_DataRamAddress			: buffer std_logic_vector(31 downto 0);
		o_InstructionRomAddress	: buffer std_logic_vector(31 downto 0);
		i_save_CCR_bits			: in std_logic;
		o_CCR							: buffer std_logic_vector(31 downto 0)
	);
end RegisterFile;

architecture struct of RegisterFile is

	signal regR0			: std_logic_vector(31 downto 0);
	signal regR1			: std_logic_vector(31 downto 0);
	signal regR2			: std_logic_vector(31 downto 0);
	--signal o_CCR				: std_logic_vector(31 downto 0);
	signal regR8			: std_logic_vector(31 downto 0);
	signal regR9			: std_logic_vector(31 downto 0);
	signal regR10			: std_logic_vector(31 downto 0);
	signal regR11			: std_logic_vector(31 downto 0);
	signal regR12			: std_logic_vector(31 downto 0);
	signal regR13			: std_logic_vector(31 downto 0);
	signal regR14			: std_logic_vector(31 downto 0);
	signal regR15			: std_logic_vector(31 downto 0);
	
	--signal wrSelR3			: std_logic;
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

--wrSelR3 <= '1' when (i_wrRegSel = "0011") else '0';
wrSelR4 <= '1' when (i_wrRegSel = "0100") else '0';
wrSelR5 <= '1' when (i_wrRegSel = "0101") else '0';
wrSelR6 <= '1' when (i_wrRegSel = "0110") else '0';
wrSelR7 <= '1' when (i_wrRegSel = "0111") else '0';
wrSelR8 <= '1' when (i_wrRegSel = "1000") else '0';
wrSelR9 <= '1' when (i_wrRegSel = "1001") else '0';
wrSelR10 <= '1' when (i_wrRegSel = "1010") else '0';
wrSelR11 <= '1' when (i_wrRegSel = "1011") else '0';
wrSelR12 <= '1' when (i_wrRegSel = "1100") else '0';
wrSelR13 <= '1' when (i_wrRegSel = "1101") else '0';
wrSelR14 <= '1' when (i_wrRegSel = "1110") else '0';
wrSelR15 <= '1' when (i_wrRegSel = "1111") else '0';

-- r0=zero
zeroReg : work.REG_32_CONSTANT PORT MAP(
    d 	=> i_regDataIn,
    ld 	=> '0',
    clr 	=> i_clear,
    clk	=> i_clk,
	 constVal => x"00000000",
    q		=> regR0
);

-- r1=1
oneReg : work.REG_32_CONSTANT PORT MAP(
    d 	=> i_regDataIn,
    ld 	=> '0',
    clr 	=> i_clear,
    clk	=> i_clk,
	 constVal => x"00000001",
    q		=> regR1
);

-- r2=-1
minusOneReg : work.REG_32_CONSTANT PORT MAP(
    d 	=> i_regDataIn,
    ld 	=> '0',
    clr 	=> i_clear,
    clk	=> i_clk,
	 constVal => x"FFFFFFFF",
    q		=> regR2
);

-- r3 = Condition Code Register
conditionCodeRegister : work.REG_32 PORT MAP(
    d 	=> i_CCR,
    ld 	=> i_enable and i_save_CCR_bits,
    clr 	=> i_clear,
    clk	=> i_clk,
    q		=> o_CCR
);

-- r4 = Stack RAM Address
stackAddress : work.COUNT_32 PORT MAP(
    clk		=> i_clk,
    clr 		=> i_clear,
    d 		=> i_regDataIn,
    enable	=> wrSelR4,
    inc		=> '0',
    dec		=> '0',
    q			=> o_StackRamAddress
);

-- r5 = Peripheral Address
peripheralAddress : work.COUNT_32 PORT MAP(
    clk		=> i_clk,
    clr 		=> i_clear,
    d 		=> i_regDataIn,
    enable	=> wrSelR5,
    inc 		=> '0',
    dec 		=> '0',
    q			=> o_PeripheralAddress
);

-- r6 = Data RAM Address
dataRamAddress : work.COUNT_32 PORT MAP(
    d 	=> i_regDataIn,
    enable 	=> wrSelR6,
    clr 	=> i_clear,
    clk	=> i_clk,
    inc => '0',
    dec => '0',
    q		=> o_DataRamAddress
);

-- r7 = Program Counter (Instruction RAM Address)
-- wrSelR7 - when the destination register is r7
-- 
programCounter : work.COUNT_32 PORT MAP(
    clk		=> i_clk,
    clr 		=> i_clear,
    d 		=> i_regDataIn,
    enable 	=> i_enable,
    inc 		=> (not i_TakeBranch) and (not wrSelR7),
    dec 		=> '0',
    q			=> o_InstructionRomAddress
);

-- r8-r15 = General Purpose Registers
r8 : work.REG_32 PORT MAP(
    clk	=> i_clk,
    clr	=> i_clear,
    d 	=> i_regDataIn,
    ld 	=> wrSelR8 and i_enable,
    q		=> regR8
);

r9 : work.REG_32 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn,
    ld 	=> wrSelR9 and i_enable,
    q		=> regR9
);

r10 : work.REG_32 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn,
    ld 	=> wrSelR10 and i_enable,
    q		=> regR10
);

r11 : work.REG_32 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn,
    ld 	=> wrSelR11 and i_enable,
    q		=> regR11
);

r12 : work.REG_32 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn,
    ld 	=> wrSelR12 and i_enable,
    q		=> regR12
);

r13 : work.REG_32 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn,
    ld 	=> wrSelR13 and i_enable,
    q		=> regR13
);

r14 : work.REG_32 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn,
    ld 	=> wrSelR14 and i_enable,
    q		=> regR14
);

r15 : work.REG_32 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn,
    ld 	=> wrSelR15 and i_enable,
    q		=> regR15
);

muxA : work.MUX_16x32 PORT MAP (
	r0 => regR0,
   r1 => regR1,
   r2 => regR2,
   r3 => o_CCR,
   r4 => o_StackRamAddress,
   r5 => o_PeripheralAddress,
   r6 => o_DataRamAddress,
   r7 => o_InstructionRomAddress,
   r8 => regR8,
   r9 => regR9,
   r10 => regR10,
   r11 => regR11,
   r12 => regR12,
   r13 => regR13,
   r14 => regR14,
   r15 => regR15,
   sel => i_rdRegSelA,
   z => o_regDataOutA
);

muxB : work.MUX_16x32 PORT MAP (
	r0 => regR0,
   r1 => regR1,
   r2 => regR2,
   r3 => o_CCR,
   r4 => o_StackRamAddress,
   r5 => o_PeripheralAddress,
   r6 => o_DataRamAddress,
   r7 => o_InstructionRomAddress,
   r8 => regR8,
   r9 => regR9,
   r10 => regR10,
   r11 => regR11,
   r12 => regR12,
   r13 => regR13,
   r14 => regR14,
   r15 => regR15,
   sel => i_rdRegSelB,
   z => o_regDataOutB
);

end;
