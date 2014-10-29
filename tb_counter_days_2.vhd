--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:11:37 10/29/2014
-- Design Name:   
-- Module Name:   C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/VHDL/tb_counter_days_2.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter_days
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
USE ieee.numeric_std.ALL;
 
ENTITY tb_counter_days_2 IS
END tb_counter_days_2;
 
ARCHITECTURE behavior OF tb_counter_days_2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_days
    PORT(
         clk : IN  std_logic;
         cten : IN  std_logic;
         rst : IN  std_logic;
         down : IN  std_logic;
         max : IN  std_logic_vector(4 downto 0);
         count : OUT  std_logic_vector(4 downto 0);
         carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal cten : std_logic := '0';
   signal rst : std_logic := '0';
   signal down : std_logic := '0';
   signal max : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal count : std_logic_vector(4 downto 0);
   signal carry : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_days PORT MAP (
          clk => clk,
          cten => cten,
          rst => rst,
          down => down,
          max => max,
          count => count,
          carry => carry
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
       -- hold reset state for 20 ns.
		max <= std_logic_vector(to_unsigned(30, 5));
		rst <= '1';
      wait for 20 ns;	
		assert ( count = std_logic_vector(to_unsigned(1, 5)) ) report "counter not 1 after initial reset" severity error;
		
		--test counting
		rst <= '0';
		cten <= '1';
		wait for clk_period*5;
		assert ( count =  std_logic_vector(to_unsigned(5, 5)) ) report "count test failed" severity error;
		
		
		-- 30 day month
		rst <= '0';
		cten <= '1';
		max <= std_logic_vector(to_unsigned(30, 5));
      wait for clk_period*31;
		assert ( count =  std_logic_vector(to_unsigned(6, 5)) ) report "30 day month test failed" severity error;
		
		-- 28 day month
		max <= std_logic_vector(to_unsigned(28, 5));
      wait for clk_period*29;
		assert ( count =  std_logic_vector(to_unsigned(7, 5)) ) report "28 day month test failed" severity error;
			
		-- 31 day month
		max <= std_logic_vector(to_unsigned(31, 5));
      wait for clk_period*32;
		assert ( count =  std_logic_vector(to_unsigned(8, 5)) ) report "31 day month test failed" severity error;

      wait;
   end process;

END;
