--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:06:14 04/01/2018
-- Design Name:   
-- Module Name:   /home/shubham_rai/fpga_counter/stabiliser_tb.vhd
-- Project Name:  fpga_counter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: stabiliser
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
 
ENTITY stabiliser_tb IS
END stabiliser_tb;
 
ARCHITECTURE behavior OF stabiliser_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT stabiliser
    PORT(
         input : IN  std_logic;
         clk : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: stabiliser PORT MAP (
          input => input,
          clk => clk,
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
      wait for 10 ns;	
		input <= '0';
		wait for 10 ns;
		input <= '1';
		wait for 5 ns;
		input <= '0';
		wait for 10 ns;	
		input <= '1';
		wait for 10 ns;
		input <= '0';
		wait for 5 ns;
		input <= '1';
		wait for 9 * clk_period;
		input <= '0';
		wait for 20 * clk_period;
		input <= '1';
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '1';
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '1';
      wait;
   end process;

END;
