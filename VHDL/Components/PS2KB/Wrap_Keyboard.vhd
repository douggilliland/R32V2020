--
-- Wrap_Keyboard - PS/2 keyboard wrapper
--	Keyboard data can be polled or read
--	The difference is the clearance of the status register
--
--	Address	Function
--	 x0800 	Latched Keyboard Data
--	 x0801 	Latched Keyboard Status
--	 x0802 	Polled Keyboard Data
--	 x0803 	Polled Keyboard Status
--
--	Status value
--		x00 = No data ready
--		x01 = Data ready
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY Wrap_Keyboard IS
	port (
		i_CLOCK_50					: IN  STD_LOGIC;  -- input clock
		i_n_reset					: IN  STD_LOGIC;  -- 
		i_kbCS						: IN  STD_LOGIC;  -- 
		i_peripheralAddress		: IN  STD_LOGIC_vector(31 downto 0) := x"00000000"; -- address
		i_rd_Kbd						: IN  STD_LOGIC;  -- Read strobe
		i_ps2_clk					: IN  STD_LOGIC;  -- PS/2 clock
		i_ps2_data					: IN  STD_LOGIC;  -- PS/2 data
		o_kbdDat						: OUT STD_LOGIC_vector(7 downto 0)
	);
end Wrap_Keyboard;

ARCHITECTURE logic OF Wrap_Keyboard IS

	-- Keyboard cotrols
	signal w_kbdStatus			:	std_logic_vector(7 downto 0);
	signal w_kbReadData			:	std_logic_vector(6 downto 0);
	signal q_kbReadData			:	std_logic_vector(7 downto 0);
	signal W_kbDataValid			:	std_logic;
	signal w_latKbDV1				:	std_logic;

	BEGIN

	o_kbdDat <= q_kbReadData 				when i_peripheralAddress(1 downto 0) = "00" else
					w_kbdStatus  				when i_peripheralAddress(1 downto 0) = "01" else
					'0'&w_kbReadData  		when i_peripheralAddress(1 downto 0) = "10" else
					"0000000"&W_kbDataValid	when i_peripheralAddress(1 downto 0) = "11" else
					x"00";

	-- PS/2 keyboard - ASCII output
	ps2Keyboard : entity work.ps2_keyboard_to_ascii
	port map (
		clk			=> i_CLOCK_50,
		ps2_clk		=> i_PS2_CLK,
		ps2_data		=> i_PS2_DATA,	
		ascii_code	=> w_kbReadData,
		ascii_new	=> W_kbDataValid
	);
	
	-- Latch up the keyboard data when data valid signal is present
	process (i_CLOCK_50, i_n_reset, W_kbDataValid, w_kbReadData, i_rd_Kbd)
	begin
		if i_n_reset = '0' then
			w_latKbDV1 <= '0';													-- delay data valid signal
			w_kbdStatus <= x"00";												-- clear status
		elsif rising_edge(i_CLOCK_50)  then
			w_latKbDV1 <= W_kbDataValid;										-- One clock delay on the data valid signal
			if ((W_kbDataValid = '1') and (w_latKbDV1 = '0')) then	-- Edge detect data valid
				w_kbdStatus <= x"01";											-- set at edge of dataValid
				q_kbReadData <= '0'&w_kbReadData;							-- pad 7 to 8 bits
			elsif ((i_rd_Kbd = '1') and (i_kbCS = '1')) then			-- Clear status on kbd read
				w_kbdStatus <= x"00";											-- clear data present status
			end if;
		end if;
	end process;

END logic;
