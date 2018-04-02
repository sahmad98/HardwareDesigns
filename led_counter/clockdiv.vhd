----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:29:28 04/01/2018 
-- Design Name: 
-- Module Name:    clockdiv - Behavioral 
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

entity clockdiv is
    Port ( clk : in STD_LOGIC;
           out_clk : out  STD_LOGIC);
end clockdiv;

architecture Behavioral of clockdiv is
	signal result : std_logic := '0';
begin
	process (clk, result)
		variable counter : integer range 0 to 8191 := 0;
	begin
		if rising_edge(clk) then
			if counter < 8191 then
				counter := counter + 1;
			else
				counter := 0;
				result <= not result;
			end if;
		end if;
	end process;
	
	out_clk <= result;
end Behavioral;

