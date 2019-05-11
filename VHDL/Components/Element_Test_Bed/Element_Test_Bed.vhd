-- Element Test Bed

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Element_Test_Bed is
	port(
		FPGA_Clk		: in std_logic;
		n_Reset		: in std_logic;
--		rxd			: in std_logic;
--		txd			: out std_logic;
--		rts			: out std_logic;
--
--		VoutVect		: out std_logic_vector(17 downto 0); -- rrrrr,gggggg,bbbbb,hsync,vsync
--		
--		switch0		: in std_logic;
--		switch1		: in std_logic;
--		switch2		: in std_logic;
--
--		LED1			: out std_logic;
--		LED2			: out std_logic;
--		LED3			: out std_logic;
--		LED4			: out std_logic;
--
--		BUZZER		: out std_logic;
--
--		ps2Clk		: in std_logic;
--		ps2Data		: in std_logic;
		
--		regFileDataIn		: in  std_logic_vector(31 downto 0);
--		regFileDataOutA	: out std_logic_vector(31 downto 0);
--		regFileDataOutB	: out std_logic_vector(31 downto 0);
		wrRegFileStrobe	: in  std_logic;
		wrRegFileSel		: in  std_logic_vector(3 downto 0);
		rdRegFileSelA		: in  std_logic_vector(3 downto 0);
		rdRegFileSelB		: in  std_logic_vector(3 downto 0);
		InstrOpCode			: in std_logic_vector(7 downto 0);
		
--		Anode_Activate : out std_logic_vector(3 downto 0);
		LED_out			: out std_logic_vector(6 downto 0)
	);
end Element_Test_Bed;

architecture struct of Element_Test_Bed is

	signal regFileDataOutA	: std_logic_vector(31 downto 0);
	signal regFileDataOutB	: std_logic_vector(31 downto 0);
	signal regFileDataIn		: std_logic_vector(31 downto 0);
	signal ALUOut				: std_logic_vector(31 downto 0);
	signal Op_HCF				: std_ulogic := '0';
	signal Op_NOP				: std_ulogic := '0';
	signal Op_RES				: std_ulogic := '0';
	signal Op_ADS				: std_ulogic := '0';
	signal Op_MUL				: std_ulogic := '0';
	signal Op_CMP				: std_ulogic := '0';
	signal Op_ORS				: std_ulogic := '0';
	signal Op_ARS				: std_ulogic := '1';
	signal Op_XRS				: std_ulogic := '0';
	signal Op_LS1				: std_ulogic := '0';
	signal Op_RS1				: std_ulogic := '0';
	signal Op_LR1				: std_ulogic := '0';
	signal Op_RR1				: std_ulogic := '0';
	signal Op_RA1				: std_ulogic := '0';
	signal Op_ENS				: std_ulogic := '0';
		-- Category = Immediate values
	signal Op_LIL				: std_ulogic := '0';
	signal Op_LIU				: std_ulogic := '0';
		-- Category = Load/Store
	signal Op_LDB				: std_ulogic := '0';
	signal Op_SDB				: std_ulogic := '0';
	signal Op_LDS				: std_ulogic := '0';
	signal Op_SDS				: std_ulogic := '0';
	signal Op_LDL				: std_ulogic := '0';
	signal Op_SDL				: std_ulogic := '0';
		-- Category = Peripheral I/O
	signal Op_LPB				: std_ulogic := '0';
	signal Op_SPB				: std_ulogic := '0';
	signal Op_LPS				: std_ulogic := '0';
	signal Op_SPS				: std_ulogic := '0';
	signal Op_LPL				: std_ulogic := '0';
	signal Op_SPL				: std_ulogic := '0';
		-- Category = Flow Control
	signal Op_JSR				: std_ulogic := '0';
	signal Op_RTS				: std_ulogic := '0';
	signal Op_BRA				: std_ulogic := '0';
	signal Op_BCS				: std_ulogic := '0';
	signal Op_BCC				: std_ulogic := '0';
	signal Op_BOV				: std_ulogic := '0';
	signal Op_BEQ				: std_ulogic := '0';

	
begin

ALUOut <= regFileDataIn;

regFile : work.RegisterFile port map (
		clk => FPGA_Clk,
		clear	=> not n_Reset,
		wrStrobe	=> wrRegFileStrobe,
		wrRegSel	=> wrRegFileSel,
		rdRegSelA => rdRegFileSelA,
		rdRegSelB => rdRegFileSelB,
		regDataIn => regFileDataIn,
		regDataOutA => regFileDataOutA,
		regDataOutB => regFileDataOutB
	);

alu : work.ALU port map (
		Op_AND => Op_ADS,
		Op_XOR => Op_XRS,
		Op_OR  => Op_ORS,
		Op_Add => Op_ADS,
		Op_LS1 => Op_LS1,
		Op_RS1 => Op_RS1,
		Op_LR1 => Op_LR1,
		Op_RR1 => Op_RR1,
		Op_RA1 => Op_RA1,
		regDataA => regFileDataOutA,
		regDataB => regFileDataOutB,
		ALUDataOut => regFileDataIn
	);

decoder : work.OpCode_Decoder port map (
		InstrOpCode => InstrOpCode,
		Op_HCF => Op_HCF,
		Op_NOP => Op_NOP,
		Op_RES => Op_RES,
		Op_ADS => Op_ADS,
		Op_MUL => Op_MUL,
		Op_MAO => Op_CMP,
		Op_ORS => Op_ORS,
		Op_ARS => Op_ARS,
		Op_XRS => Op_XRS,
		Op_LS1 => Op_LS1,
		Op_RS1 => Op_RS1,
		Op_LR1 => Op_LR1,
		Op_RR1 => Op_RR1,
		Op_RA1 => Op_RA1,
		Op_ENS => Op_ENS,
		-- Category = Immediate values
		Op_LIL => Op_LIL,
		Op_LIU => Op_LIU,
		-- Category = Load/Store
		Op_LDB => Op_LDB,
		Op_SDB => Op_SDB,
		Op_LDS => Op_LDS,
		Op_SDS => Op_SDS,
		Op_LDL => Op_LDL,
		Op_SDL => Op_SDL,
		-- Category = Peripheral I/O
		Op_LPB => Op_LPB,
		Op_SPB => Op_SPB,
		Op_LPS => Op_LPS,
		Op_SPS => Op_SPS,
		Op_LPL => Op_LPL,
		Op_SPL => Op_SPL,
		-- Category = Flow Control
		Op_JSR => Op_JSR,
		Op_RTS => Op_RTS,
		Op_BRA => Op_BRA,
		Op_BCS => Op_BCS,
		Op_BCC => Op_BCC,
		Op_BOV => Op_BOV,
		Op_BEQ => Op_BEQ
	);

	
end;
