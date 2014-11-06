--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:37:59 10/24/2014
-- Design Name:   
-- Module Name:   C:/Users/Girmi/workspace/VHDL/vhdl-klok/tb_clock_divider.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clock_divider
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
 
ENTITY tb_clock_divider IS
END tb_clock_divider;
 
ARCHITECTURE behavior OF tb_clock_divider IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clock_divider
	 GENERIC (
			max : positive
			);
    PORT(
         clk, ena : IN  std_logic;
         div : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk, ena : std_logic := '0';
   --signal ena : std_logic := '0';

 	--Outputs
   signal div : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
	
	-- parameters
	constant cnt_max : positive := 10;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clock_divider 
	GENERIC MAP (
			 max => positive(cnt_max)  
		  )
	PORT MAP (
          clk => clk,
          ena => ena,
          div => div
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clock_period/2;
		clk <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 100 ns;
		ena <= '1';
		assert ( div = '0' ) report "Clock out appeared before 10 cycles" severity error;
      wait for clock_period*5;
		assert ( div = '0' ) report "Clock out appeared before 10 cycles" severity error;
      wait for clock_period*5;
		assert ( div = '1' ) report "Clock out did not appear after 10 cycles" severity error;
      wait for clock_period;
		assert ( div = '0' ) report "Clock did not disappeared after 11 cycles" severity error;

      wait;
   end process;

END;
