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
    Port ( clk, rst, refresh: in STD_LOGIC;
           num1, num2 : in  STD_LOGIC_VECTOR (6 downto 0);
			  blink1, blink2, blink_freq: in STD_LOGIC;
			  seg7 : out  STD_LOGIC_VECTOR (6 downto 0);
			  anode : out STD_LOGIC_VECTOR (3 downto 0)
	 );
    END COMPONENT;
    

   --Inputs
   signal clk, rst, refresh : std_logic := '0';
   signal blink1, blink2, blink_freq : std_logic := '0';
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
			 refresh => refresh,
			 
          num1 => num1,
          num2 => num2,
			 blink1 => blink1,
          blink2 => blink2,
          blink_freq => blink_freq,
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
	blink_process :process
   begin
		blink_freq <= '0';
		wait for clk_period*50;
		blink_freq <= '1';
		wait for clk_period;
   end process;
	refresh_process :process
   begin
		refresh <= '0';
		wait for clk_period*5;
		refresh <= '1';
		wait for clk_period;
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
		wait for clk_period * 1000;
		blink1 <= '1';
		wait for clk_period * 1000;
		blink1 <= '0';
		blink2 <= '1';
		wait for clk_period * 1000;
		blink2 <= '0';
		
      wait;
   end process;

END;
