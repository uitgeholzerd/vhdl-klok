----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:25:50 11/06/2014 
-- Design Name: 
-- Module Name:    main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( clk, rst : in  STD_LOGIC;
			  btn_u, btn_d, btn_l, btn_r, btn_s : in  STD_LOGIC;
			  led_time, led_date, led_alarm, led_alarm_on: out std_logic;
           disp_an : out  STD_LOGIC_VECTOR (3 downto 0);
           disp_cat : out  STD_LOGIC_VECTOR (6 downto 0)
           );
end main;

architecture Behavioral of main is
	component func_select is
	--TODO: btn_x needs to be a pulse
	port(
         clk, rst : IN  std_logic;
         btn_l, btn_r, btn_u, btn_d, btn_s : IN  std_logic;
         hh, mm, ss : IN  std_logic_vector(6 downto 0);
			up_hh, up_mm, rst_ss, down_hh, down_mm : OUT std_logic;
			--day, month, year : IN  std_logic_vector(6 downto 0);
			--up_day, up_month, up_year, down_day, down_month, down_year : OUT std_logic;
			--alarm_hh, alarm_mm : IN  std_logic_vector(6 downto 0);
			--up_alarm_hh, up_alarm_mm, down_alarm_hh, down_alarm_mm : OUT std_logic;
			mode_time, mode_date, mode_alarm, alarm_enabled: out std_logic;
			blink1, blink2: out std_logic;
         num1, num2 : OUT  std_logic_vector(6 downto 0)
        );
	end component;

	component clock_divider is
	generic (max 	: 	positive );	
		Port ( clk, ena : in  STD_LOGIC;
				div : out  STD_LOGIC
				);
	end component;
	
	component mod_time is
		--TODO: add up/down ports
		Port ( clk, rst : in  STD_LOGIC;
           hours, mins, secs : out  STD_LOGIC_VECTOR (6 downto 0);
           carry : out  STD_LOGIC
				);
	end component;
	
	component mod_display is
	-- TODO: add blink inputs
	-- TODO: incorrect cathode output
	   Port ( clk, rst, refresh : in  STD_LOGIC;
           num1, num2: in  STD_LOGIC_VECTOR (6 downto 0);
			  blink1, blink2: in STD_LOGIC;
			  seg7: out  STD_LOGIC_VECTOR (6 downto 0);
			  anode : out STD_LOGIC_VECTOR (3 downto 0)
				);
	end component;
	
	component debouncer is
		Port(	clk, input : in  STD_LOGIC; 
			debounced : out  STD_LOGIC
				); 
	end component;
	
	signal one, zero : std_logic;
	signal sig_div_disp, sig_div_time, sig_disp_clk, sig_time_clk: std_logic;
	signal sig_r, sig_l, sig_s, sig_u, sig_d: std_logic;
	signal sig_btn_r, sig_btn_l, sig_btn_s, sig_btn_u, sig_btn_d: std_logic;
	signal sig_sec, sig_min, sig_hrs, sig_cathode: std_logic_vector (6 downto 0);
	signal sig_ss, sig_mm, sig_hh: std_logic_vector (6 downto 0);
	signal sig_num1, sig_num2, sig_disp_num1, sig_disp_num2: std_logic_vector (6 downto 0);
	signal sig_anode: std_logic_vector (3 downto 0);
	signal sig_alarm_enabled, sig_time_carry: std_logic;
	signal sig_blink1, sig_blink2, sig_disp_blink1, sig_disp_blink2: std_logic;
	signal sig_up_hh, sig_up_mm, sig_rst_ss, sig_down_hh, sig_down_mm: std_logic;

begin
	one <= '1';
	zero <= '0';
	sig_disp_clk <= sig_div_disp; sig_time_clk <= sig_div_time;
	led_alarm_on <= sig_alarm_enabled;
	sig_u <= sig_btn_u; sig_d <= sig_btn_d; sig_l <= sig_btn_l; sig_r <= sig_btn_r; sig_s <= sig_btn_s;
	sig_disp_blink1 <= sig_blink1; sig_disp_blink2 <= sig_blink2;
	sig_disp_num1 <= sig_num1; sig_disp_num2 <= sig_num2;
	sig_ss <= sig_sec; sig_mm <=sig_min; sig_hh <= sig_hrs;
	
	FUNC: func_select
		port map(
			clk => clk, rst => rst,
         btn_l => sig_l, btn_r => sig_r, btn_u => sig_u, btn_d => sig_d, btn_s => sig_s,
         hh => sig_hh, mm => sig_mm, ss => sig_ss,
			up_hh => sig_up_hh, up_mm => sig_up_mm, rst_ss => sig_rst_ss, down_hh => sig_down_hh, down_mm => sig_down_mm,
			--day, month, year,
			--up_day, up_month, up_year, down_day, down_month, down_year,
			--alarm_hh, alarm_mm,
			--up_alarm_hh, up_alarm_mm, down_alarm_hh, down_alarm_mm,
			mode_time => led_time, mode_date => led_date, mode_alarm => led_alarm, alarm_enabled => sig_alarm_enabled,
			blink1 => sig_blink1, blink2 => sig_blink2,
         num1 => sig_num1 , num2 => sig_num2
         );
	
	FREQ_DISP: clock_divider
		generic map (max => 10)
		port map (clk => clk, div => sig_div_disp, ena => one);
	FREQ_TIME: clock_divider
		generic map (max => 2)
		port map (clk => sig_div_disp, div => sig_div_time, ena => one);
	
	DISPLAY: mod_display
		port map (
			clk => clk, rst => rst, refresh => sig_disp_clk, 
			num1 => sig_disp_num1, num2 => sig_disp_num2, 
			blink1 => sig_disp_blink1, blink2 => sig_disp_blink2, 
			seg7 => disp_cat, anode => disp_an
			);
	
	DBNC_R: debouncer
		port map (clk => clk, input => btn_r, debounced => sig_btn_r);
	DBNC_L: debouncer
		port map (clk => clk, input => btn_l, debounced => sig_btn_l);
	DBNC_U: debouncer
		port map (clk => clk, input => btn_u, debounced => sig_btn_u);
	DBNC_D: debouncer
		port map (clk => clk, input => btn_d, debounced => sig_btn_d);
	DBNC_S: debouncer
		port map (clk => clk, input => btn_s, debounced => sig_btn_s);
	
	MTIME: mod_time
		port map (
			clk => sig_time_clk, rst => rst, 
			hours => sig_hrs, mins => sig_min, secs => sig_sec, 
			carry => sig_time_carry
			);
	
end Behavioral;

