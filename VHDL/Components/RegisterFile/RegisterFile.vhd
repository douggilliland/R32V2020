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
		i_OP_LIL						: in std_logic := '0';
		i_OP_LIU						: in std_logic := '0';
		i_OP_LIX						: in std_logic := '0';
		i_BranchAddress			: in std_logic_vector(31 downto 0);
		i_wrRegFile					: in std_logic := '0';
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
	signal regR8			: std_logic_vector(31 downto 0);
	signal regR9			: std_logic_vector(31 downto 0);
	signal regR10			: std_logic_vector(31 downto 0);
	signal regR11			: std_logic_vector(31 downto 0);
	signal regR12			: std_logic_vector(31 downto 0);
	signal regR13			: std_logic_vector(31 downto 0);
	signal regR14			: std_logic_vector(31 downto 0);
	signal regR15			: std_logic_vector(31 downto 0);
	signal w_nextPC		: std_logic_vector(31 downto 0);
	
	signal wrSelR4			: std_logic;
	signal wrSelR5			: std_logic;
	signal wrSelR6			: std_logic;
	signal wrSelR7			: std_logic;
	signal wrSelR8Upper	: std_logic;
	signal wrSelR8Lower	: std_logic;
	signal wrSelR9Upper	: std_logic;
	signal wrSelR9Lower	: std_logic;
	signal wrSelR10Upper	: std_logic;
	signal wrSelR10Lower	: std_logic;
	signal wrSelR11Upper	: std_logic;
	signal wrSelR11Lower	: std_logic;
	signal wrSelR12Upper	: std_logic;
	signal wrSelR12Lower	: std_logic;
	signal wrSelR13Upper	: std_logic;
	signal wrSelR13Lower	: std_logic;
	signal wrSelR14Upper	: std_logic;
	signal wrSelR14Lower	: std_logic;
	signal wrSelR15Upper	: std_logic;
	signal wrSelR15Lower	: std_logic;

begin

wrSelR4 			<= '1' when (i_wrRegSel = x"4") else '0';
wrSelR5 			<= '1' when (i_wrRegSel = x"5") else '0';
wrSelR6 			<= '1' when (i_wrRegSel = x"6") else '0';
wrSelR7 			<= '1' when (i_wrRegSel = x"7") else '0';
wrSelR8Upper 	<= '1' when ((i_wrRegSel = x"8") and (i_OP_LIL = '0')) else '0';
wrSelR8Lower	<= '1' when ((i_wrRegSel = x"8") and (i_OP_LIU = '0')) else '0';
wrSelR9Upper	<= '1' when ((i_wrRegSel = x"9") and (i_OP_LIL = '0')) else '0';
wrSelR9Lower	<= '1' when ((i_wrRegSel = x"9") and (i_OP_LIU = '0')) else '0';
wrSelR10Upper	<= '1' when ((i_wrRegSel = x"A") and (i_OP_LIL = '0')) else '0';
wrSelR10Lower	<= '1' when ((i_wrRegSel = x"A") and (i_OP_LIU = '0')) else '0';
wrSelR11Upper	<= '1' when ((i_wrRegSel = x"B") and (i_OP_LIL = '0')) else '0';
wrSelR11Lower	<= '1' when ((i_wrRegSel = x"B") and (i_OP_LIU = '0')) else '0';
wrSelR12Upper	<= '1' when ((i_wrRegSel = x"C") and (i_OP_LIL = '0')) else '0';
wrSelR12Lower	<= '1' when ((i_wrRegSel = x"C") and (i_OP_LIU = '0')) else '0';
wrSelR13Upper	<= '1' when ((i_wrRegSel = x"D") and (i_OP_LIL = '0')) else '0';
wrSelR13Lower	<= '1' when ((i_wrRegSel = x"D") and (i_OP_LIU = '0')) else '0';
wrSelR14Upper	<= '1' when ((i_wrRegSel = x"E") and (i_OP_LIL = '0')) else '0';
wrSelR14Lower	<= '1' when ((i_wrRegSel = x"E") and (i_OP_LIU = '0')) else '0';
wrSelR15Upper	<= '1' when ((i_wrRegSel = x"F") and (i_OP_LIL = '0')) else '0';
wrSelR15Lower	<= '1' when ((i_wrRegSel = x"F") and (i_OP_LIU = '0')) else '0';

-- Register File Registers
regR0 <= x"00000000";		-- r0 = zero
regR1 <= x"00000001";		-- r1 = 1
regR2 <= x"FFFFFFFF";		-- r2 = -1

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
    enable	=> wrSelR4 and i_wrRegFile and i_enable,
    inc		=> '0',
    dec		=> '0',
    q			=> o_StackRamAddress
);

-- r5 = Peripheral Address
peripheralAddress : work.COUNT_32 PORT MAP(
	clk		=> i_clk,
	clr 		=> i_clear,
	d 		=> i_regDataIn,
	enable	=> wrSelR5 and i_wrRegFile and i_enable,
	inc 		=> '0',
	dec 		=> '0',
	q			=> o_PeripheralAddress
);

-- r6 = Data RAM Address
dataRamAddress : work.COUNT_32 PORT MAP(
	clk		=> i_clk,
	clr 		=> i_clear,
	d 		=> i_regDataIn,
	enable 	=> wrSelR6 and i_wrRegFile and i_enable,
	inc 		=> '0',
	dec 		=> '0',
	q			=> o_DataRamAddress
);

-- r7 = Program Counter (Instruction RAM Address)
-- wrSelR7 - when the destination register is r7

w_nextPC <= i_BranchAddress 	when i_TakeBranch = '1' else			
				i_regDataIn 		when i_TakeBranch = '0';
-- 
programCounter : work.COUNT_32 PORT MAP(
    clk		=> i_clk,
    clr 		=> i_clear,
    d 		=> w_nextPC,
    enable 	=> i_enable,
    inc 		=> (not i_TakeBranch) and (not wrSelR7),
    dec 		=> '0',
    q			=> o_InstructionRomAddress
);

-- r8-r15 = General Purpose Registers
r8Upper : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr	=> i_clear,
    d 	=> i_regDataIn(31 downto 16),
    ld 	=> wrSelR8Upper and i_wrRegFile and i_enable,
    q		=> regR8(31 downto 16)
);

r8Lower : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr	=> i_clear,
    d 	=> i_regDataIn(15 downto 0),
    ld 	=> wrSelR8Lower and i_wrRegFile and i_enable,
    q		=> regR8(15 downto 0)
);

r9Upper : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn(31 downto 16),
    ld 	=> wrSelR9Upper and i_wrRegFile and i_enable,
    q		=> regR9(31 downto 16)
);

r9Lower : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn(15 downto 0),
    ld 	=> wrSelR9Lower and i_wrRegFile and i_enable,
    q		=> regR9(15 downto 0)
);

r10Upper : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn(31 downto 16),
    ld 	=> wrSelR10Upper and i_wrRegFile and i_enable,
    q		=> regR10(31 downto 16)
);

r10Lower : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn(15 downto 0),
    ld 	=> wrSelR10Lower and i_wrRegFile and i_enable,
    q		=> regR10(15 downto 0)
);

r11Upper : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn(31 downto 16),
    ld 	=> wrSelR11Upper and i_wrRegFile and i_enable,
    q		=> regR11(31 downto 16)
);

r11Lower : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn(15 downto 0),
    ld 	=> wrSelR11Lower and i_wrRegFile and i_enable,
    q		=> regR11(15 downto 0)
);

r12Upper : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn(31 downto 16),
    ld 	=> wrSelR12Upper and i_wrRegFile and i_enable,
    q		=> regR12(31 downto 16)
);

r12Lower : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn(15 downto 0),
    ld 	=> wrSelR12Lower and i_wrRegFile and i_enable,
    q		=> regR12(15 downto 0)
);

r13Upper : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn(31 downto 16),
    ld 	=> wrSelR13Upper and i_wrRegFile and i_enable,
    q		=> regR13(31 downto 16)
);

r13Lower : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn(15 downto 0),
    ld 	=> wrSelR13Lower and i_wrRegFile and i_enable,
    q		=> regR13(15 downto 0)
);

r14Upper : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn(31 downto 16),
    ld 	=> wrSelR14Upper and i_wrRegFile and i_enable,
    q		=> regR14(31 downto 16)
);

r14Lower : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn(15 downto 0),
    ld 	=> wrSelR14Lower and i_wrRegFile and i_enable,
    q		=> regR14(15 downto 0)
);

r15Upper : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn(31 downto 16),
    ld 	=> wrSelR15Upper and i_wrRegFile and i_enable,
    q		=> regR15(31 downto 16)
);

r15Lower : work.REG_16 PORT MAP(
    clk	=> i_clk,
    clr 	=> i_clear,
    d 	=> i_regDataIn(15 downto 0),
    ld 	=> wrSelR15Lower and i_wrRegFile and i_enable,
    q		=> regR15(15 downto 0)
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
