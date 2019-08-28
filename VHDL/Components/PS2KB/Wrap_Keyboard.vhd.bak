LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY Wrap_Keyboard IS
port (
		clk							: IN  STD_LOGIC;  --input clock
		i_peripheralAddress		: IN  STD_LOGIC_vector(1 downto 0); -- address
		ps2_clk						: IN  STD_LOGIC;  --
		ps2_data						: IN  STD_LOGIC;  --
		i_kbdDat						: OUT STD_LOGIC_vector(7 downto 0));
end Wrap_Keyboard;

ARCHITECTURE logic OF Wrap_Keyboard IS
--  SIGNAL flipflops   : STD_LOGIC_VECTOR(1 DOWNTO 0); --input flip flops

BEGIN

	-- PS/2 keyboard - ASCII output
	ps2Keyboard : entity work.ps2_keyboard_to_ascii
	port map (
		clk			=> i_CLOCK_50,
		ps2_clk		=> i_PS2_CLK,
		ps2_data		=> i_PS2_DATA,	
		ascii_code	=> w_kbReadData,
		ascii_new	=> w_kbDataValid
	);
	
	-- Latch up the keyboard data when data valid signal is present

	process (i_CLOCK_50, n_reset, W_kbDataValid, w_kbReadData, w_kbDatCS, i_peripheralRdStrobe)
	begin
		if n_reset = '0' then
			w_latKbDV1 <= '0';
			w_kbdStatus <= x"00";
		elsif rising_edge(i_CLOCK_50)  then
			w_latKbDV1 <= W_kbDataValid;
			if W_kbDataValid = '1' and w_latKbDV1 = '0' then
				w_kbdStatus <= x"01";			-- set at edge of dataValid
				q_kbReadData <= '0' & w_kbReadData;
			elsif ((w_kbDatCS = '1') and (i_peripheralRdStrobe = '1')) then
				w_kbdStatus <= x"00";
			end if;
		end if;
	end process;

END logic;
