--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:46:04 10/28/2014
-- Design Name:   
-- Module Name:   C:/Users/Girmi/Xilinx/vhdl-klok/tb_variable_counter.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: variable_counter
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
 
ENTITY tb_variable_counter IS
END tb_variable_counter;
 
ARCHITECTURE behavior OF tb_variable_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT variable_counter
    PORT(
         clk : IN  std_logic;
         cten : IN  std_logic;
         reset : IN  std_logic;
			increment : IN  std_logic;
         down : IN  std_logic;
         max : IN  std_logic_vector(4 downto 0);
         count : OUT  std_logic_vector(7 downto 0);
         carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal cten : std_logic := '0';
   signal reset : std_logic := '0';
   signal increment : std_logic := '0';
   signal down : std_logic := '0';
   signal max : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal count : std_logic_vector(7 downto 0) := (others => '0');
   signal carry : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: variable_counter PORT MAP (
          clk => clk,
          cten => cten,
          reset => reset,
			 increment => increment,
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
      wait for 10 ns;

		reset <= '1';
		wait for clk_period * 1;
		reset <= '0';
		
		--start counting to 30
		max <= std_logic_vector(to_unsigned(30, 5));
		down <= '0';
		cten <= '1';
		wait for clk_period * 29;
		assert ( count = std_logic_vector(to_unsigned(29, count'length)) ) report "Count not 29" severity error;
		wait for clk_period;
		assert ( count = std_logic_vector(to_unsigned(30, count'length)) ) report "Count not 30" severity error;
		wait for clk_period;
		assert ( count = std_logic_vector(to_unsigned(0, count'length)) ) report "Count not 0" severity error;
		
		reset <= '1';
		wait for clk_period * 1;
		reset <= '0';
		
		--start counting to 28
		max <= std_logic_vector(to_unsigned(28, 5));
		wait for clk_period * 28;
		assert ( count = std_logic_vector(to_unsigned(28, count'length)) ) report "Count not 28" severity error;
		wait for clk_period;
		assert ( count = std_logic_vector(to_unsigned(0, count'length)) ) report "Count not 0" severity error;
		
      wait;
   end process;

END;
