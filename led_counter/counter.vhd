----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:05:40 04/01/2018 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
    Port ( count : in  STD_LOGIC;
			  clk : in STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end counter;

architecture Behavioral of counter is
	component debounce is
		 Port ( input : in  STD_LOGIC;
				  clk : in STD_LOGIC;
				  output : out  STD_LOGIC);
	end component;
	
	signal temp_count : std_logic;

begin
	db : debounce PORT MAP(input => count, clk => clk, output => temp_count);
	process(temp_count)
		variable result : integer range 0 to 255 := 0;
	begin
		if rising_edge(temp_count) then
			result := result + 1;
		end if;
		led <= std_logic_vector(to_unsigned(result, led'length));
	end process;

end Behavioral;

