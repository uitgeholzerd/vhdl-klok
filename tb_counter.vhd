--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:12:54 10/19/2014
-- Design Name:   
-- Module Name:   C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/tb_counter.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter
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
 
ENTITY tb_counter IS
END tb_counter;
 
ARCHITECTURE behavior OF tb_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
	 -- add generic variable here!
	 GENERIC ( max : positive);
    PORT(
         clk : IN  std_logic;
         cten : IN  std_logic;
         rst : IN  std_logic;
         down : IN  std_logic;
			-- change type to integer
         count : OUT integer range max-1 downto 0
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal cten : std_logic := '0';
   signal rst : std_logic := '0';
   signal down : std_logic := '0';

 	--Outputs
   signal count : integer ;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
	-- parameters
	constant cnt_max : positive := 20;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter 
	-- add generic map here to set max for counter
		GENERIC MAP (
			 max => positive(cnt_max)  
		  )		
		  PORT MAP (
          clk => clk,
          cten => cten,
          rst => rst,
          down => down,
          count => count
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
      -- hold reset state for 20 ns.
		rst <= '1';
      wait for 20 ns;	
		assert ( count = 0 ) report "counter not 0 after initial reset" severity error;
		
		-- count up 5 times
		rst <= '0';
		cten <= '1';
      wait for clk_period*5;
		assert ( count = 5 ) report "counter not 5 after 5 clocks" severity error;
		
		--test if ct_en=0 disables counting
		cten <= '0';
		wait for clk_period*5;
		assert ( count = 5 ) report "counter counted while cten=0" severity error;
		
		--count up till cnt_max, should reset to 0 now
		cten <= '1';
		wait for clk_period*(cnt_max -5);
		assert ( count = 0 ) report "counter not 0 after reaching max" severity error;
		
		--count up 5 times and down 5 times
		wait for clk_period*5;
		down <= '1';
		wait for clk_period*5;
		assert ( count = 0 ) report "counter not 0 after 5 up and 5 down from 0" severity error;
		
		--count down to max and 5 more
		wait for clk_period*(cnt_max + 5) ;
		assert ( count = cnt_max-5 ) report "counting down 5 from max failed" severity error;
		
		--reset to 0 
		rst <= '1';
		wait for clk_period;
		assert ( count = 0 ) report "counter not 0 after reset" severity error;
		
		--start counting up again
		rst <= '0';
		down <= '0';
		
      wait;
   end process;

END;
