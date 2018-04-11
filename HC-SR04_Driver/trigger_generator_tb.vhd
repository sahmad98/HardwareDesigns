--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:40:25 04/04/2018
-- Design Name:   
-- Module Name:   /home/shubham_rai/HC-SR04_Driver/trigger_generator_tb.vhd
-- Project Name:  HC-SR04_Driver
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: trigger_generator
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
 
ENTITY trigger_generator_tb IS
END trigger_generator_tb;
 
ARCHITECTURE behavior OF trigger_generator_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT trigger_generator
    PORT(
         enable : IN  std_logic;
         clk : IN  std_logic;
         trigger : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal enable : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal trigger : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: trigger_generator PORT MAP (
          enable => enable,
          clk => clk,
          trigger => trigger
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
		enable <= '1';
		wait for 20 ns;
		enable <= '0';
		wait for 15 us;
		enable <= '1';
		wait for 20 ns;
		enable <= '0';
      wait;
   end process;

END;
