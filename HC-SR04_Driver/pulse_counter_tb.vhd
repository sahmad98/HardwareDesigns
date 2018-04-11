--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:01:34 04/05/2018
-- Design Name:   
-- Module Name:   /home/shubham_rai/HC-SR04_Driver/pulse_counter_tb.vhd
-- Project Name:  HC-SR04_Driver
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pulse_counter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY pulse_counter_tb IS
END pulse_counter_tb;
 
ARCHITECTURE behavior OF pulse_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pulse_counter
    PORT(
         pulse : IN  std_logic;
         clk : IN  std_logic;
			completed : out std_logic;
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal pulse : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
	signal completed : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pulse_counter PORT MAP (
          pulse => pulse,
          clk => clk,
			 completed => completed,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		pulse <= '1';
		wait for 10 us;
		pulse <= '0';
      wait;
   end process;

END;
