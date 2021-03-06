--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:15:29 11/09/2014
-- Design Name:   
-- Module Name:   C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/VHDL/tb_bcd_conv.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: bcd_conv
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
 
ENTITY tb_binary_bcd_conv IS
END tb_binary_bcd_conv;
 
ARCHITECTURE behavior OF tb_binary_bcd_conv IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT binary_bcd_conv
    PORT(
         rst : IN  std_logic;
         number : IN  std_logic_vector(6 downto 0);
         tens : OUT  std_logic_vector(3 downto 0);
         ones : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal number : std_logic_vector(6 downto 0) := (others => '0');

 	--Outputs
   signal tens : std_logic_vector(3 downto 0);
   signal ones : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: binary_bcd_conv PORT MAP (
          rst => rst,
          number => number,
          tens => tens,
          ones => ones
        );


   -- Stimulus process
   stim_proc: process
   begin		
		
      -- hold reset state for 20 ns.
		rst <= '1';
      wait for 20 ns;	
		rst <= '0';
		loop
         number <= std_logic_vector(unsigned(number) + 1);
         wait for 10 ns;
      end loop;

      wait;
   end process;

END;
