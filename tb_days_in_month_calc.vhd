--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:56:17 10/27/2014
-- Design Name:   
-- Module Name:   C:/Users/Girmi/workspace/VHDL/vhdl-klok/tb_days_in_month_calc.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: days_in_month_calc
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
 
ENTITY tb_days_in_month_calc IS
END tb_days_in_month_calc;
 
ARCHITECTURE behavior OF tb_days_in_month_calc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT days_in_month_calc
    PORT(
         clk : IN  std_logic;
         year : IN std_logic_vector(11 downto 0) ;
         month : IN  std_logic_vector(3 downto 0);
         days_in_month : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal year : std_logic_vector(11 downto 0) := (others => '0');
   signal month :std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal days_in_month : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: days_in_month_calc PORT MAP (
          clk => clk,
          year => year,
          month => month,
          days_in_month => days_in_month
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
		
		year <= "011111011100";	-- 2012
		month <= "0001";	-- 01
		wait for clk_period;
		assert ( days_in_month = "11111" ) report "01/2012 geen 31 dagen" severity error;
		
		year <= "011111011100"; -- 2012
		month <= "0100"; -- 04
		wait for clk_period;
		assert ( days_in_month = "11110" ) report "04/2012 geen 30 dagen" severity error;
		
		year <= "011111011100"; -- 2012
		month <= "0010"; -- 02
		wait for clk_period;
		assert ( days_in_month = "11101" ) report "02/2012 geen 29 dagen" severity error;
		 
		year <= "011111011011"; -- 2011
		month <= "0010"; -- 02
		wait for clk_period;
		assert ( days_in_month = "11100" ) report "02/2011 geen 28 dagen" severity error;

      wait;
   end process;

END;
