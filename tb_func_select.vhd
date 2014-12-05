--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:56:05 11/09/2014
-- Design Name:   
-- Module Name:   C:/Users/seb/Google Drive/UA/S-Elektronica 1/digitale technieken/practicum/Klok/VHDL/tb_func_select.vhd
-- Project Name:  Klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: func_select
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
 
ENTITY tb_func_select IS
END tb_func_select;
 
ARCHITECTURE behavior OF tb_func_select IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT func_select
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         btn_l : IN  std_logic;
         btn_r : IN  std_logic;
         btn_u : IN  std_logic;
         btn_d : IN  std_logic;
         btn_s : IN  std_logic;
         hh : IN  std_logic_vector(6 downto 0);
         mm : IN  std_logic_vector(6 downto 0);
         ss : IN  std_logic_vector(6 downto 0);
         up_hh : OUT  std_logic;
         up_mm : OUT  std_logic;
         rst_ss : OUT  std_logic;
         down_hh : OUT  std_logic;
         down_mm : OUT  std_logic;
         day : IN  std_logic_vector(6 downto 0);
         month : IN  std_logic_vector(6 downto 0);
         year : IN  std_logic_vector(6 downto 0);
			up_day : OUT  std_logic;
         up_month : OUT  std_logic;
         up_year : OUT  std_logic;
         down_day : OUT  std_logic;
         down_month : OUT  std_logic;
         down_year : OUT  std_logic;
         alarm_hh : IN  std_logic_vector(6 downto 0);
         alarm_mm : IN  std_logic_vector(6 downto 0);
         up_alarm_hh : OUT  std_logic;
         up_alarm_mm : OUT  std_logic;
         down_alarm_hh : OUT  std_logic;
         down_alarm_mm : OUT  std_logic;
         mode_time : OUT  std_logic;
         mode_date : OUT  std_logic;
         mode_alarm : OUT  std_logic;
         alarm_enabled : OUT  std_logic;
			alarm_ring : OUT  std_logic;
         blink1 : OUT  std_logic;
         blink2 : OUT  std_logic;
         num1 : OUT  std_logic_vector(6 downto 0);
         num2 : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal btn_l : std_logic := '0';
   signal btn_r : std_logic := '0';
   signal btn_u : std_logic := '0';
   signal btn_d : std_logic := '0';
   signal btn_s : std_logic := '0';
   signal hh : std_logic_vector(6 downto 0) := (others => '0');
   signal mm : std_logic_vector(6 downto 0) := (others => '0');
   signal ss : std_logic_vector(6 downto 0) := (others => '0');
   signal day : std_logic_vector(6 downto 0) := (others => '0');
   signal month : std_logic_vector(6 downto 0) := (others => '0');
   signal year : std_logic_vector(6 downto 0) := (others => '0');
   signal alarm_hh : std_logic_vector(6 downto 0) := (others => '0');
   signal alarm_mm : std_logic_vector(6 downto 0) := (others => '0');

 	--Outputs
   signal up_hh : std_logic;
   signal up_mm : std_logic;
   signal rst_ss : std_logic;
   signal down_hh : std_logic;
   signal down_mm : std_logic;
   signal up_day : std_logic;
   signal up_month : std_logic;
   signal up_year : std_logic;
   signal down_day : std_logic;
   signal down_month : std_logic;
   signal down_year : std_logic;
   signal up_alarm_hh : std_logic;
   signal up_alarm_mm : std_logic;
   signal down_alarm_hh : std_logic;
   signal down_alarm_mm : std_logic;
   signal mode_time : std_logic;
   signal mode_date : std_logic;
   signal mode_alarm : std_logic;
   signal alarm_enabled : std_logic;
	signal alarm_ring : std_logic;
   signal blink1 : std_logic;
   signal blink2 : std_logic;
   signal num1 : std_logic_vector(6 downto 0);
   signal num2 : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: func_select 
		PORT MAP (
			clk => clk,
			rst => rst,
			btn_l => btn_l,
			btn_r => btn_r,
			btn_u => btn_u,
			btn_d => btn_d,
			btn_s => btn_s,
			hh => hh,
			mm => mm,
			ss => ss,
			up_hh => up_hh,
			up_mm => up_mm,
			rst_ss => rst_ss,
			down_hh => down_hh,
			down_mm => down_mm,
			day => day,
			month => month,
			year => year,
			up_day => up_day,
			up_month => up_month,
			up_year => up_year,
			down_day => down_day,
			down_month => down_month,
			down_year => down_year,
         alarm_hh => alarm_hh,
         alarm_mm => alarm_mm,
         up_alarm_hh => up_alarm_hh,
         up_alarm_mm => up_alarm_mm,
         down_alarm_hh => down_alarm_hh,
         down_alarm_mm => down_alarm_mm,
			mode_time => mode_time,
			mode_date => mode_date,
			mode_alarm => mode_alarm,
			alarm_enabled => alarm_enabled,
			alarm_ring => alarm_ring,
			blink1 => blink1,
			blink2 => blink2,
			num1 => num1,
			num2 => num2
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
		hh <= std_logic_vector(to_unsigned(23, 7));
		mm <= std_logic_vector(to_unsigned(59, 7));
		ss <= std_logic_vector(to_unsigned(12, 7));
		day <= std_logic_vector(to_unsigned(28, 7));
		month <= std_logic_vector(to_unsigned(12, 7));
		year <= std_logic_vector(to_unsigned(99, 7));
		alarm_hh <= std_logic_vector(to_unsigned(11, 7));
		alarm_mm <= std_logic_vector(to_unsigned(11, 7));
		
		rst <= '1';
      wait for 20 ns;	
		rst <= '0';
      wait for clk_period*2;
		
		btn_l <= '1';
		wait for clk_period*3;
		btn_l <= '0';
		wait for clk_period*2;
		btn_l <= '1';
		wait for clk_period*10;
		btn_l <= '0';
		wait for clk_period;
		btn_l <= '1';
		wait for clk_period;
		btn_l <= '0';
		wait for clk_period;
		
		btn_u <= '0';
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
		btn_r <= '1';
		wait for clk_period;
		btn_r <= '0';
		wait for clk_period;
		btn_r <= '1';
		wait for clk_period;
		btn_r <= '0';
		wait for clk_period;
		btn_r <= '1';
		wait for clk_period;
		btn_r <= '0';
		wait for clk_period;
		
		btn_s <= '1';
		wait for clk_period*2;
		btn_s <= '0';
		wait for clk_period*5;
		btn_s <= '1';
		wait for clk_period*10;
		btn_s <= '0';
		wait for clk_period;
		
		btn_r <= '1';
		wait for clk_period;
		btn_r <= '0';
		wait for clk_period;
		btn_u <= '1';
		wait for clk_period;
		btn_u <= '0';
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
		btn_u <= '1';
		wait for clk_period;
		btn_u <= '0';
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
		btn_u <= '1';
		wait for clk_period;
		btn_u <= '0';
		wait for clk_period;
		btn_u <= '1';
		wait for clk_period;
		btn_u <= '0';
		wait for clk_period;
		btn_d <= '1';
		wait for clk_period;
		btn_d <= '0';
		wait for clk_period;
		

      wait;
   end process;

END;
