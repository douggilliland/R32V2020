library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SSD1306 is
	port(
		PDO: out std_logic_vector(7 downto 0);
		MADDR: out std_logic_vector(9 downto 0);
		MemDI: in std_logic_vector(7 downto 0);
		Clk, Rst, Bsy: in std_logic;
		Trig, CD: out std_logic
	);
end SSD1306;

architecture Ar of SSD1306 is
constant AMNT_INSTRS: natural := 27;
type IAR is array (0 to AMNT_INSTRS-1) of std_logic_vector(7 downto 0);
signal Instrs: IAR := (x"A8", x"3F", x"D3", x"00", x"40", x"A1", x"DA", x"12", x"81", x"7F", x"20", x"00", x"21", x"00", x"7F", x"22", x"00", x"07", x"A6", x"DB", x"40", x"A4", x"D5", x"80", x"8D", x"14", x"AF");

type PStates is (Init, Draw);
type SStates is (BusyWaitA, BusyWaitB, Writing, Done);

signal SPISt: SStates := Done;
signal PSt: PStates := Init;
signal PInstr: unsigned(7 downto 0);
signal MemAddr: unsigned(9 downto 0);

begin
	process(Clk, Rst, Bsy)
	begin
		MADDR <= std_logic_vector(MemAddr);
		
		if(Rst = '0') then
			PSt <= Init;
			SPISt <= Done;
			PInstr <= (others => '0');
		elsif(rising_edge(Clk)) then
			if(PSt = Init) then
				CD <= '0';
				if(SPISt = Done) then
					PDO <= (Instrs(to_integer(PInstr)));
					Trig <= '1';
					SPISt <= BusyWaitA;
				elsif(SPISt = BusyWaitA) then
					if(Bsy = '1') then
						PInstr <= PInstr + 1;
						SPISt <= Writing;
						Trig <= '0';
					end if;
				else
					if(Bsy = '0') then
						SPISt <= Done;
						if(PInstr = AMNT_INSTRS) then
							PSt <= Draw;
							PInstr <= (others => '0');
							MemAddr(0) <= '1';
						end if;
					end if;
				end if;
			else --Draw
				CD <= '1';
				
				if(SPISt = Done) then
					PDO <= MemDI;
					Trig <= '1';
					SPISt <= BusyWaitA;
				elsif(SPISt = BusyWaitA) then
					if(Bsy = '1') then
						MemAddr <= MemAddr + 1;
						PInstr <= PInstr + 1;
						SPISt <= Writing;
						Trig <= '0';
					end if;
				else
					if(Bsy = '0') then SPISt <= Done; end if;
				end if;
			end if;
		end if;
	end process;
end Ar;
