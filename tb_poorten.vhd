--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:54:48 10/17/2014
-- Design Name:   
-- Module Name:   C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/tb_poorten.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: poorten
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
 
ENTITY tb_poorten IS
END tb_poorten;
 
ARCHITECTURE behavior OF tb_poorten IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT poorten
    PORT(
         inA : IN  std_logic;
         inB : IN  std_logic;
         outAND : OUT  std_logic;
         outOR : OUT  std_logic;
         outNOT : OUT  std_logic;
         outNAND : OUT  std_logic;
         outNOR : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal inA : std_logic := '0';
   signal inB : std_logic := '0';

 	--Outputs
   signal outAND : std_logic;
   signal outOR : std_logic;
   signal outNOT : std_logic;
   signal outNAND : std_logic;
   signal outNOR : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: poorten PORT MAP (
          inA => inA,
          inB => inB,
          outAND => outAND,
          outOR => outOR,
          outNOT => outNOT,
          outNAND => outNAND,
          outNOR => outNOR
        );

   -- Clock process definitions
 --  <clock>_process :process
 --  begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		inA <= '0'; inB <='0';
      wait for 100 ns;	
		inA <= '1'; inB <='0';
      wait for 100 ns;	
		inA <= '0'; inB <='1';
      wait for 100 ns;	
		inA <= '1'; inB <='1';
      wait for 100 ns;	
   end process;

END;
