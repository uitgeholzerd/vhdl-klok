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
			  btn_r : in  STD_LOGIC;
           btn_l : in  STD_LOGIC;
           btn_s : in  STD_LOGIC;
           btn_u : in  STD_LOGIC;
           btn_d : in  STD_LOGIC;
           disp_an : out  STD_LOGIC_VECTOR (3 downto 0);
           disp_cat : out  STD_LOGIC_VECTOR (6 downto 0)
           );
end main;

architecture Behavioral of main is
	component clock_divider is
	generic (max 	: 	positive );	
		Port ( clk, ena : in  STD_LOGIC;
				div : out  STD_LOGIC
				);
	end component;
	component mod_time is
		Port ( clk, rst : in  STD_LOGIC;
           hours, mins, secs : out  STD_LOGIC_VECTOR (6 downto 0);
           carry : out  STD_LOGIC
				);
	end component;
	component mod_display is
	   Port ( clk, rst : in  STD_LOGIC;
           num1, num2: in  STD_LOGIC_VECTOR (6 downto 0);
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
	signal sig_div_disp, sig_div_time, sig_disp_clk, sig_time_clk, sig_r, sig_l, sig_s, sig_u, sig_d, sig_time_carry: std_logic;
	signal sig_sec, sig_min, sig_hrs, sig_cathode: std_logic_vector (6 downto 0);
	signal sig_anode: std_logic_vector (3 downto 0);
begin
	one <= '1';
	zero <= '0';
	sig_disp_clk <= sig_div_disp;
	sig_time_clk <= sig_div_time;
	FREQ_DISP: clock_divider
		generic map (max => 10)
		port map (clk => clk, div => sig_div_disp, ena => one);
	FREQ_TIME: clock_divider
		generic map (max => 10)
		port map (clk => sig_div_disp, div => sig_div_time, ena => one);
	DISPLAY: mod_display
		port map (clk => sig_disp_clk, rst => rst, num1 => sig_min, num2 => sig_sec, seg7 => disp_cat, anode => disp_an);
	DBNC_R: debouncer
		port map (clk => clk, input => btn_r, debounced => sig_r);
	DBNC_L: debouncer
		port map (clk => clk, input => btn_l, debounced => sig_l);
	DBNC_U: debouncer
		port map (clk => clk, input => btn_u, debounced => sig_u);
	DBNC_D: debouncer
		port map (clk => clk, input => btn_d, debounced => sig_d);
	DBNC_S: debouncer
		port map (clk => clk, input => btn_s, debounced => sig_s);
	MTIME: mod_time
		port map (clk => sig_time_clk, rst => rst, hours => sig_hrs, mins => sig_min, secs => sig_sec, carry => sig_time_carry);
	
end Behavioral;

