--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:54:05 11/06/2014
-- Design Name:   
-- Module Name:   C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/VHDL/tb_mod_display.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mod_display
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
 
ENTITY tb_mod_display IS
END tb_mod_display;
 
ARCHITECTURE behavior OF tb_mod_display IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mod_display
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         num1 : IN  std_logic_vector(6 downto 0);
         num2 : IN  std_logic_vector(6 downto 0);
         seg7 : OUT  std_logic_vector(6 downto 0);
         anode : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal num1 : std_logic_vector(6 downto 0) := (others => '0');
   signal num2 : std_logic_vector(6 downto 0) := (others => '0');

 	--Outputs
   signal seg7 : std_logic_vector(6 downto 0);
   signal anode : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mod_display PORT MAP (
          clk => clk,
          rst => rst,
          num1 => num1,
          num2 => num2,
          seg7 => seg7,
          anode => anode
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
      -- hold reset state for 100 ns.
      wait for 20 ns;	
		rst <= '0';
		num1 <= std_logic_vector(to_unsigned(23, 7));
		num2 <= std_logic_vector(to_unsigned(59, 7));
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
