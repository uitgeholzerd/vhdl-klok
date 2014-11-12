--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:53:56 10/31/2014
-- Design Name:   
-- Module Name:   C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/VHDL/tb_time.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: time
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
 
ENTITY tb_mod_time IS
END tb_mod_time;
 
ARCHITECTURE behavior OF tb_mod_time IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mod_time
    PORT(
         clk, rst, cten : IN  std_logic;
			incr_hour : in STD_LOGIC;
			incr_min : in STD_LOGIC;
			reset_sec : in STD_LOGIC;
			down : in STD_LOGIC;
         hours : OUT  std_logic_vector(6 downto 0);
         mins : OUT  std_logic_vector(6 downto 0);
         secs : OUT  std_logic_vector(6 downto 0);
         carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal cten : std_logic := '0';
   signal rst : std_logic := '0';
	signal incr_hour : std_logic := '0';
	signal incr_min : std_logic := '0';
	signal reset_sec : std_logic := '0';
	signal down : std_logic := '0';

 	--Outputs
   signal hours : std_logic_vector(6 downto 0);
   signal mins : std_logic_vector(6 downto 0);
   signal secs : std_logic_vector(6 downto 0);
   signal carry : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mod_time PORT MAP (
          clk => clk,
			 cten => cten,
          rst => rst,
			 incr_hour => incr_hour,
			 incr_min => incr_min,
			 reset_sec => reset_sec,
			 down => down,
          hours => hours,
          mins => mins,
          secs => secs,
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
	
   cten_process :process
   begin
		cten <= '0';
		wait for clk_period*10;
		cten <= '1';
		wait for clk_period;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 10 ns.
		rst <= '1';
      wait for 10 ns;	
		rst <= '0';
      wait for clk_period*10;

      -- Test manual counting
		incr_min <= '1';
      wait for clk_period*3;
		incr_min <= '0';
		incr_hour <= '1';
      wait for clk_period*3;
		incr_hour <= '0';
		
      wait for clk_period;
		down <= '1';
		
		incr_min <= '1';
      wait for clk_period*2;
		incr_min <= '0';
		incr_hour <= '1';
      wait for clk_period*2;
		incr_hour <= '0';
		
		down <= '0';

      wait;
   end process;

END;
