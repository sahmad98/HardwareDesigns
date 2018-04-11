----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Saleem Ahmad
-- 
-- Create Date:    23:51:28 04/04/2018 
-- Design Name:  Pulse Time Counter
-- Module Name:    pulse_counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pulse_counter is
    Port ( pulse : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  completed : out STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end pulse_counter;

architecture Behavioral of pulse_counter is
	signal processing : STD_LOGIC := '1';
begin
	completed <= processing;
	
	pulse_counter : process (clk)
		variable counter : natural := 0;
		variable reg : natural := 0;
	begin
		if rising_edge(clk) then
			if rising_edge(pulse) then
				counter := 0;
				processing <= '0';
			end if;
			
			if pulse = '1' then
				counter := counter + 1;
			else
				reg := counter;
				processing <= '1';
			end if; 
		end if;
		output <= std_logic_vector(to_unsigned(reg, output'length));
	end process;

end Behavioral;

