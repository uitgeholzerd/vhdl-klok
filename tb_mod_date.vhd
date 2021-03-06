--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:49:04 11/16/2014
-- Design Name:   
-- Module Name:   C:/Users/Girmi/Xilinx/vhdl-klok/tb_mod_date.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mod_date
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
 
ENTITY tb_mod_date IS
END tb_mod_date;
 
ARCHITECTURE behavior OF tb_mod_date IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mod_date
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         cten : IN  std_logic;
         incr_day : IN  std_logic;
         incr_month : IN  std_logic;
         incr_year : IN  std_logic;
         down : IN  std_logic;
         day : OUT  std_logic_vector(6 downto 0);
         month : OUT  std_logic_vector(6 downto 0);
         year : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal cten : std_logic := '0';
   signal incr_day : std_logic := '0';
   signal incr_month : std_logic := '0';
   signal incr_year : std_logic := '0';
   signal down : std_logic := '0';

 	--Outputs
   signal day : std_logic_vector(6 downto 0);
   signal month : std_logic_vector(6 downto 0);
   signal year : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mod_date PORT MAP (
          clk => clk,
          rst => rst,
          cten => cten,
          incr_day => incr_day,
          incr_month => incr_month,
          incr_year => incr_year,
          down => down,
          day => day,
          month => month,
          year => year
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
      -- hold reset state.
		rst <= '1';
      wait for clk_period;	
		rst <= '0';
		
		cten <= '1';
      wait for clk_period*100;
		cten <= '0';
		assert ( day = "0001010" and month = "0000100" and year = "0000000" ) report "Niet juist geteld" severity error;	
		
		-- Increase day/month/year
		rst <= '1';
      wait for clk_period;	
		rst <= '0';
		
		incr_day <= '1';
      wait for clk_period*3;
		incr_day <= '0';
		assert ( day = "0000100" ) report "Geen 3 dagen bijgeteld" severity error;	
			
			
		incr_month <= '1';
      wait for clk_period*3;
		incr_month <= '0';
		assert ( month = "0000100" ) report "Geen 3 maanden bijgeteld" severity error;
		
		incr_year <= '1';
      wait for clk_period*3;
		incr_year <= '0';
		assert ( year = "0000011" ) report "Geen 3 jaren bijgeteld" severity error;
		
		-- Decrease day/month/year
		down <= '1';
		
		incr_day <= '1';
      wait for clk_period*2;
		incr_day <= '0';
		assert ( day = "0000010" ) report "Geen 2 dagen afgeteld" severity error;
			
		incr_month <= '1';
      wait for clk_period*2;
		incr_month <= '0';
		assert ( month = "0000010" ) report "Geen 2 maanden afgeteld" severity error;
		
		incr_year <= '1';
      wait for clk_period*2;
		incr_year <= '0';
		assert ( year = "0000001" ) report "Geen 2 jaren afgeteld" severity error;
		
		down <= '0';
		
		rst <= '1';
      wait for clk_period;	
		rst <= '0';
		
		--Test non- leap year
		incr_year <= '1';
      wait for clk_period*1;
		incr_year <= '0';
		
		incr_month <= '1';
      wait for clk_period*1;
		incr_month <= '0';
		
		cten <= '1';
      wait for clk_period*28;
		cten <= '0';
      wait for clk_period*1;
		assert ( day = "0000001" and month = "0000011" and year = "0000001" ) report "Niet juist geteld 2" severity error;	
		
		
      wait;
   end process;

END;
