----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:03:40 04/03/2018 
-- Design Name: 
-- Module Name:    DisplayDigits - Behavioral 
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

entity DisplayDigits is
    Port ( clk : in  STD_LOGIC;
			  --count : in STD_LOGIC;
           leds : out  STD_LOGIC_VECTOR (7 downto 0));
end DisplayDigits;

architecture Behavioral of DisplayDigits is
	component seven_segment_driver
		 Port ( input_bcd : in  STD_LOGIC_VECTOR (3 downto 0);
				  output : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;

	signal digit : std_logic_vector(3 downto 0);
begin
	ssd : seven_segment_driver PORT MAP (input_bcd => digit, output => leds);

	delay : process(clk)
		variable counter : integer range 0 to 99999999 := 0;
		variable digit_value : integer range 0 to 10 := 0;
	begin
		if rising_edge(clk) then
			if counter < 99999999 then
				counter := counter + 1;
			else
				counter := 0;
				digit_value := digit_value + 1;
				if digit_value > 10 then
					digit_value := 0;
				end if;
			end if;
		end if;
		digit <= std_logic_vector(to_unsigned(digit_value, digit'length));
	end process;

end Behavioral;

