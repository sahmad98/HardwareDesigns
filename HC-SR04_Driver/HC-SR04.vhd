----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Salem Ahmad
-- 
-- Create Date:    00:30:44 04/04/2018 
-- Design Name: 
-- Module Name:    HC-SR04 - Behavioral 
-- Project Name: HC-SR04 Ultrasonic Distance Measurement Diver
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

entity HCSR04 is
    Port ( clk : in STD_LOGIC;
			  trigger : in  STD_LOGIC;
           echo_sensor  : in  STD_LOGIC;
			  trigger_sensor : out STD_LOGIC;
			  completed : out STD_LOGIC;
           distance : out  STD_LOGIC_VECTOR (31 downto 0));
end HCSR04;

architecture Behavioral of HCSR04 is
	signal wire_completed : STD_LOGIC := '0';
	signal distance_data : STD_LOGIC_VECTOR (31 downto 0) := B"00000000";
	
	component trigger_generator
		 Port ( enable  : in  STD_LOGIC;
				  clk     : in  STD_LOGIC;
				  trigger : out STD_LOGIC );
	end component;
begin
	
	completed <= wire_completed;
	
	trig : trigger_generator PORT MAP (enable => trigger, clk => clk, trigger => trigger_sensor);
	
	echo_process : process (clk, echo_sensor)
		variable counter : integer range 0 to 100000000;
	begin
		if rising_edge(clk) then
			if rising_edge (echo_sensor) then
				counter := 0;
			elsif echo_sensor = '1' then
				counter := counter + 1;
			else
				wire_completed <= '1';
			end if;
		end if;
	end process;

end Behavioral;

