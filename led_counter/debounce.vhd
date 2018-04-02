----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:28:13 04/01/2018 
-- Design Name: 
-- Module Name:    debounce - Behavioral 
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

entity debounce is
    Port ( input : in  STD_LOGIC;
			  clk : in STD_LOGIC;
           output : out  STD_LOGIC);
end debounce;

architecture Behavioral of debounce is
	component clockdiv Port ( clk : in STD_LOGIC;
									  out_clk : out  STD_LOGIC);
	end component;
	
	component stabiliser Port ( input : in  STD_LOGIC;
				  clk : in  STD_LOGIC;
				  output : out  STD_LOGIC);
	end component;
	
	signal output_clock : std_logic;
	signal temp_output : std_logic;
begin
	clk_divider : clockdiv PORT MAP (clk => clk, out_clk => output_clock);
	stabiliser_mod : stabiliser PORT MAP (input => input , clk => output_clock, output => temp_output);
	output <= temp_output;
end Behavioral;

