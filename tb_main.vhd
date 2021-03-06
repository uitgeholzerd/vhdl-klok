--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:54:42 11/09/2014
-- Design Name:   
-- Module Name:   C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/VHDL/tb_main.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
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
 
ENTITY tb_main IS
END tb_main;
 
ARCHITECTURE behavior OF tb_main IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         btn_u : IN  std_logic;
         btn_d : IN  std_logic;
         btn_l : IN  std_logic;
         btn_r : IN  std_logic;
         btn_s : IN  std_logic;
         led_time : OUT  std_logic;
         led_date : OUT  std_logic;
         led_alarm : OUT  std_logic;
         led_alarm_on : OUT  std_logic;
			led_alarm_ring : OUT  std_logic;
         disp_an : OUT  std_logic_vector(3 downto 0);
         disp_cat : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal btn_u : std_logic := '0';
   signal btn_d : std_logic := '0';
   signal btn_l : std_logic := '0';
   signal btn_r : std_logic := '0';
   signal btn_s : std_logic := '0';

 	--Outputs
   signal led_time : std_logic;
   signal led_date : std_logic;
   signal led_alarm : std_logic;
   signal led_alarm_on : std_logic;
	signal led_alarm_ring : std_logic;
   signal disp_an : std_logic_vector(3 downto 0);
   signal disp_cat : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          clk => clk,
          rst => rst,
          btn_u => btn_u,
          btn_d => btn_d,
          btn_l => btn_l,
          btn_r => btn_r,
          btn_s => btn_s,
          led_time => led_time,
          led_date => led_date,
          led_alarm => led_alarm,
          led_alarm_on => led_alarm_on,
			 led_alarm_ring => led_alarm_ring,
          disp_an => disp_an,
          disp_cat => disp_cat
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
      wait for 20 ns;	
		rst <= '0';
      wait for clk_period*2;
		
		
		btn_l <= '1';
		wait for clk_period;
		btn_l <= '0';
		wait for clk_period;		
		
		btn_l <= '1';
		wait for clk_period;
		btn_l <= '0';
		wait for clk_period;		
		
		btn_u <= '1';
		wait for clk_period;
		btn_u <= '0';
		wait for clk_period;		
		
		btn_d <= '1';
		wait for clk_period;
		btn_d <= '0';
		wait for clk_period;		
		
		btn_r <= '1';
		wait for clk_period;
		btn_r <= '0';
		wait for clk_period;		
		
		btn_s <= '1';
		wait for clk_period;
		btn_s <= '0';
		wait for clk_period;		
		
		btn_l <= '1';
		wait for clk_period;
		btn_l <= '0';
		wait for clk_period;		
		
		btn_l <= '1';
		wait for clk_period*3;
		btn_l <= '0';
		wait for clk_period*2;
		btn_l <= '1';
		wait for clk_period*10;
		btn_l <= '0';
		wait for clk_period*3;
		btn_l <= '1';
		wait for clk_period*3;
		btn_l <= '0';
		wait for clk_period*3;
		
		btn_u <= '0';
		wait for clk_period*3;
		btn_u <= '1';
		wait for clk_period*3;
		btn_u <= '0';
		wait for clk_period*3;
		btn_d <= '1';
		wait for clk_period*3;
		btn_d <= '0';
		wait for clk_period*3;
		
		btn_r <= '1';
		wait for clk_period*30;
		btn_r <= '0';
		wait for clk_period*30;
		btn_r <= '1';
		wait for clk_period*30;
		btn_r <= '0';
		wait for clk_period*30;
		btn_r <= '1';
		wait for clk_period*30;
		btn_r <= '0';
		wait for clk_period*30;
		btn_r <= '1';
		wait for clk_period*30;
		btn_r <= '0';
		wait for clk_period*30;
		
		btn_s <= '1';
		wait for clk_period*3;
		btn_s <= '0';
		wait for clk_period*5;
		btn_s <= '1';
		wait for clk_period*10;
		btn_s <= '0';
		wait for clk_period*3;
		
		btn_r <= '1';
		wait for clk_period*30;
		btn_r <= '0';
		wait for clk_period*30;
		btn_u <= '1';
		wait for clk_period*30;
		btn_u <= '0';
		wait for clk_period*3;
		btn_u <= '1';
		wait for clk_period*3;
		btn_u <= '0';
		wait for clk_period*3;
		btn_d <= '1';
		wait for clk_period*3;
		btn_d <= '0';
		wait for clk_period*30;

		btn_r <= '1';
		wait for clk_period*3;
		btn_r <= '0';
		wait for clk_period*3;
		btn_u <= '1';
		wait for clk_period*3;
		btn_u <= '0';
		wait for clk_period*3;
		btn_u <= '1';
		wait for clk_period*3;
		btn_u <= '0';
		wait for clk_period*3;
		btn_d <= '1';
		wait for clk_period*3;
		btn_d <= '0';
		wait for clk_period*3;
		btn_r <= '1';
		wait for clk_period*3;
		btn_r <= '0';
		wait for clk_period*3;
		btn_u <= '1';
		wait for clk_period*3;
		btn_u <= '0';
		wait for clk_period*3;
		btn_u <= '1';
		wait for clk_period*3;
		btn_u <= '0';
		wait for clk_period*3;
		btn_d <= '1';
		wait for clk_period*3;
		btn_d <= '0';
		wait for clk_period*3;
		
		-- Test increase + decrease hours/minutes
		btn_r <= '1';				-- Go to mode set_time_hh
		wait for clk_period*3;	
		btn_r <= '0';
		wait for clk_period*3;
		btn_r <= '1';				
		wait for clk_period*3;	
		btn_r <= '0';
		
		btn_u <= '1';				-- Increase hours
		wait for clk_period*3;	
		btn_u <= '0';
		wait for clk_period*3;
		btn_u <= '1';				
		wait for clk_period*3;	
		btn_u <= '0';
		
		btn_d <= '1';				-- Decrease hours
		wait for clk_period*3;	
		btn_d <= '0';
		
		btn_r <= '1';				-- Go to mode set_time_mm
		wait for clk_period*3;	
		btn_r <= '0';
		
		btn_u <= '1';				-- Increase minutes
		wait for clk_period*3;	
		btn_u <= '0';		
		
		btn_d <= '1';				-- Decrease minutes
		wait for clk_period*3;	
		btn_d <= '0';
		wait for clk_period*3;
		btn_d <= '1';				
		wait for clk_period*3;	
		btn_d <= '0';
		
      wait;
   end process;

END;
