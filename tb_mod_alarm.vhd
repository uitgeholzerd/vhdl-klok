--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:18:45 12/02/2014
-- Design Name:   
-- Module Name:   C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/VHDL/tb_mod_alarm.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mod_alarm
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
 
ENTITY tb_mod_alarm IS
END tb_mod_alarm;
 
ARCHITECTURE behavior OF tb_mod_alarm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mod_alarm
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         hh : OUT  std_logic_vector(6 downto 0);
         mm : OUT  std_logic_vector(6 downto 0);
         incr_hh : IN  std_logic;
         incr_mm : IN  std_logic;
         down : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal incr_hh : std_logic := '0';
   signal incr_mm : std_logic := '0';
   signal down : std_logic := '0';

 	--Outputs
   signal hh : std_logic_vector(6 downto 0);
   signal mm : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mod_alarm PORT MAP (
          clk => clk,
          rst => rst,
          hh => hh,
          mm => mm,
          incr_hh => incr_hh,
          incr_mm => incr_mm,
          down => down
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
		rst <= '1' ;
      wait for 100 ns;	
		rst <= '0' ;
      wait for clk_period*5;
		
		incr_hh <= '1';
		wait for clk_period;
		incr_hh <= '0';
		wait for clk_period;
		incr_hh <= '1';
		wait for clk_period;
		incr_hh <= '0';
		wait for clk_period;
		incr_mm <= '1';
		wait for clk_period;
		incr_mm <= '0';
		wait for clk_period;
		incr_mm <= '1';
		wait for clk_period;
		incr_mm <= '0';
		wait for clk_period;
		incr_mm <= '1';
		wait for clk_period;
		incr_mm <= '0';
		wait for clk_period;
		
		down <= '1';
		
		incr_hh <= '1';
		wait for clk_period;
		incr_hh <= '0';
		wait for clk_period;
		incr_hh <= '1';
		wait for clk_period;
		incr_hh <= '0';
		wait for clk_period;
		incr_mm <= '1';
		wait for clk_period;
		incr_mm <= '0';
		wait for clk_period;
		incr_mm <= '1';
		wait for clk_period;
		incr_mm <= '0';
		wait for clk_period;
		incr_mm <= '1';
		wait for clk_period;
		incr_mm <= '0';
		wait for clk_period;
		
		down <= '0';
      -- insert stimulus here 
		
      wait;
   end process;

END;
