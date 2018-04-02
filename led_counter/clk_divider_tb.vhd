--------------------------------------------------------------------------------
-- Company:  
-- Engineer: Saleem Ahmad
--
-- Create Date:   22:53:11 04/01/2018
-- Design Name:   
-- Module Name:   /home/shubham_rai/fpga_counter/clk_divider_tb.vhd
-- Project Name:  fpga_counter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clockdiv
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
 
ENTITY clk_divider_tb IS
END clk_divider_tb;
 
ARCHITECTURE behavior OF clk_divider_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clockdiv
    PORT(
         clk : IN  std_logic;
         out_clk : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal out_clk : std_logic;

   -- Clock period definitions
   constant clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clockdiv PORT MAP (
          clk => clk,
          out_clk => out_clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
END;
