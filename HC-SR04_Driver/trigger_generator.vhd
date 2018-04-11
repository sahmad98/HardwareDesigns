----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Saleem Ahmad
-- 
-- Create Date:    21:32:45 04/04/2018 
-- Design Name:    HC-SR04 Trigger Generator
-- Module Name:    trigger_generator - Behavioral 
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

entity trigger_generator is
    Port ( enable  : in  STD_LOGIC;
			  clk     : in  STD_LOGIC;
           trigger : out STD_LOGIC );
end trigger_generator;

architecture Behavioral of trigger_generator is
	signal temp : std_logic := '0';
begin
	trigger <= temp;
	
	process (clk, enable)
		variable completed : boolean := true;
		variable counter : integer range 0 to 1050;
	begin
		if rising_edge(clk) then
			if enable = '1' then
				completed := false;
			end if;
			
			if not completed then
				if counter < 1050 then
					counter := counter + 1;
					temp <= '1';
				else
					counter := 0;
					completed := true;
					temp <= '0';
				end if;
			end if;
		end if;
	end process;
end Behavioral;

