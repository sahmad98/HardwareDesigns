----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Saleem Ahmad
-- 
-- Create Date:    00:50:38 04/03/2018 
-- Design Name: 7 Segment Display Driver
-- Module Name:    seven_segment_driver - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seven_segment_driver is
    Port ( input_bcd : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end seven_segment_driver;

architecture Behavioral of seven_segment_driver is
begin
-- Ouput Format - HGFEDCBA
	process
		begin
		case input_bcd is				--HGFEDCBA
			when "0000" => output <= "11000000";
			when "0001" => output <= "11111001";
			when "0010" => output <= "10100100";
			when "0011" => output <= "10110000";
											--HGFEDCBA
			when "0100" => output <= "10011001";
			when "0101" => output <= "10010010";
			when "0110" => output <= "10000010";
											--HGFEDCBA
			when "0111" => output <= "11111000";
			when "1000" => output <= "10000000";
			when "1001" => output <= "10010000";
			-- For Dot
			when "1010" => output <= "01111111";
			when OTHERS => output <= "11111111";
		end case;
	end process;
end Behavioral;

