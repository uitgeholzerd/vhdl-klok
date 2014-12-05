--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:17:05 10/23/2014
-- Design Name:   
-- Module Name:   C:/Users/Girmi/workspace/VHDL/vhdl-klok/tb_debouncer.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: debouncer
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
 
ENTITY tb_debouncer IS
END tb_debouncer;
 
ARCHITECTURE behavior OF tb_debouncer IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT debouncer
    PORT(
         clk, ena : IN  std_logic;
         input : IN  std_logic;
         debounced : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal input : std_logic := '0';
	signal ena : std_logic := '0';
 	--Outputs
   signal debounced : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: debouncer PORT MAP (
          clk => clk,
			 ena => ena,
          input => input,
          debounced => debounced
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	ena_process :process
   begin
		ena <= '0';
		wait for clk_period*5;
		ena <= '1';
		wait for clk_period;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 20 ns;
      input <= '1';
      wait for clk_period;
      input <= '0';
      wait for clk_period;
      input <= '1';
      wait for clk_period*2;
		assert ( debounced = '0' ) report "Signal not debounced correctly, is not 0 (start)" severity error;
      input <= '0';
      wait for clk_period;
      input <= '1';
      wait for clk_period*19;
		assert ( debounced = '1' ) report "Signal not debounced correctly, is not 1" severity error;
      wait for clk_period;
		assert ( debounced = '0' ) report "Edge trigger not working, is not 0" severity error;
		wait for clk_period*10;
	   input <= '0';
		input <= '1';
      wait for clk_period*2;
      input <= '0';
      wait for clk_period*5;
		assert ( debounced = '0' ) report "Signal not debounced correctly, is not 0 (end)" severity error;
      wait;
   end process;

END;
