--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:14:53 11/05/2014
-- Design Name:   
-- Module Name:   C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/VHDL/tb_display_select.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: display_select
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
 
ENTITY tb_display_select IS
END tb_display_select;
 
ARCHITECTURE behavior OF tb_display_select IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT display_select
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         a : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal a : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: display_select PORT MAP (
          clk => clk,
          rst => rst,
          a => a
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
		rst <= '1';
      -- hold rst state for 100 ns.
      wait for 20 ns;	
		rst <= '0';
      wait for clk_period*10;
		
      -- insert stimulus here 

      wait;
   end process;

END;
