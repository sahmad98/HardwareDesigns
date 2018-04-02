----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:36:56 04/01/2018 
-- Design Name: 
-- Module Name:    stabiliser - Behavioral 
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

entity stabiliser is
    Port ( input : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           output : out  STD_LOGIC);
end stabiliser;

architecture Behavioral of stabiliser is
	signal result : std_logic;
begin
	process (clk)
		constant tester : std_logic_vector (7 downto 0) := X"FF"; 
		variable reg : std_logic_vector ( 7 downto 0) := X"00";
		variable condition : std_logic_vector (7 downto 0);
	begin
		if rising_edge(clk) then
			reg := reg(6 downto 0) & input;
			condition := tester and reg;
			if condition = X"FF" then
				result <= '1';
			elsif condition = X"00" then
				result <= '0';
			end if;
		end if;
		output <= result;
	end process;	
end Behavioral;

