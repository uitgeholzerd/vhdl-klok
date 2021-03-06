----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:20:40 11/07/2014 
-- Design Name: 
-- Module Name:    func_select - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: The finite-state machine of the project.
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
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity func_select is
	port(
         clk, rst : IN  std_logic;																		-- Clock, reset signal
         btn_l, btn_r, btn_u, btn_d, btn_s : IN  std_logic;										-- Input buttons (left,right, up, down, middle)
         hh, mm, ss : IN  std_logic_vector(6 downto 0);											-- Hour, minute and second signal
			day, month, year : IN  std_logic_vector(6 downto 0);									-- Day, month, year signal
			up_hh, up_mm, rst_ss, down_hh, down_mm : OUT std_logic;								-- Increase/decrease hour, minute, reset seconds
			up_day, up_month, up_year, down_day, down_month, down_year : OUT std_logic;	-- Increase/decrease days, month, year
			alarm_hh, alarm_mm : IN  std_logic_vector(6 downto 0);								-- Alarm hour, minute
			up_alarm_hh, up_alarm_mm, down_alarm_hh, down_alarm_mm : OUT std_logic;			-- Increase/decrease alarm time
			mode_time, mode_date, mode_alarm, alarm_enabled, alarm_ring: OUT std_logic;	-- Current mode, alarm enabled and alarm ringing signals
			blink1, blink2: OUT std_logic;																-- Singals to make each number blink
         num1, num2 : OUT  std_logic_vector(6 downto 0)											-- 7segment signal for the display
        );
end func_select;

architecture Behavioral of func_select is
	type mode is (	disp_time_HHMM, disp_time_MMSS, set_time_HH, set_time_MM, reset_time_SS,
						disp_date_DDMM, disp_date_YYYY, set_date_DD, set_date_MM, set_date_YYYY,
						disp_alarm, set_alarm_hh, set_alarm_mm ); 
	signal currentmode, nextmode: mode;
	
	type alarm_mode is (enabled, disabled);
	signal currentalarm, nextalarm: alarm_mode;
begin
	state: process (clk, rst)
	begin
		if (rst = '1') then
			currentmode <= disp_time_HHMM;
			currentalarm <= disabled;
		elsif (rising_edge(clk)) then
			currentmode <= nextmode;
			currentalarm <= nextalarm;
		else null;
		end if;
	end process;
	
	change_mode: process (currentmode, btn_l, btn_r, currentalarm, btn_s)
	begin
		case currentalarm is
			when enabled =>
				if (btn_s = '1') then
					nextalarm <= disabled;
				else 
					nextalarm <= enabled;
				end if;
			when disabled =>
				if (btn_s = '1') then
					nextalarm <= enabled;
				else
					nextalarm <= disabled;
				end if;
		end case;
		case currentmode is
			when disp_time_HHMM =>
				if (btn_l = '1') then
					nextmode <= disp_time_MMSS;
				elsif (btn_r = '1') then
					nextmode <= set_time_HH;
				else
					nextmode <= disp_time_HHMM;
				end if;
			
			when disp_time_MMSS =>
				if (btn_l = '1') then
					nextmode <= disp_date_DDMM; 
				elsif (btn_r = '1') then
					nextmode <= set_time_MM;
				else
					nextmode <= disp_time_MMSS;
				end if;
				
			when disp_date_DDMM =>
				if (btn_l = '1') then
					nextmode <= disp_date_YYYY; 
				elsif (btn_r = '1') then
					nextmode <= set_date_YYYY;
				else
					nextmode <= disp_date_DDMM;
				end if;
			
			when disp_date_YYYY =>
				if (btn_l = '1') then
					nextmode <= disp_alarm; 
				elsif (btn_r = '1') then
					nextmode <= set_date_YYYY;
				else
					nextmode <= disp_date_YYYY;
				end if;
			
			when set_time_HH =>
				if (btn_l = '1') then
					nextmode <= disp_time_HHMM;
				elsif (btn_r = '1') then
					nextmode <= set_time_MM;
				else
					nextmode <= set_time_HH;
				end if;
			
			when set_time_MM =>
				if (btn_l = '1') then
					nextmode <= disp_time_HHMM;
				elsif (btn_r = '1') then
					nextmode <= reset_time_SS;
				else
					nextmode <= set_time_MM;
				end if;
			
			when reset_time_SS =>
				if (btn_l = '1') then
					nextmode <= disp_time_HHMM;
				elsif (btn_r = '1') then
					nextmode <= disp_time_HHMM;
				else
					nextmode <= reset_time_SS;
				end if;
		
			when set_date_DD =>
				if (btn_l = '1') then
					nextmode <= disp_date_DDMM;
				elsif (btn_r = '1') then
					nextmode <= disp_date_DDMM;
				else
					nextmode <= set_date_DD;
				end if;
				
			when set_date_MM =>
				if (btn_l = '1') then
					nextmode <= disp_date_DDMM;
				elsif (btn_r = '1') then
					nextmode <= set_date_DD;
				else
					nextmode <= set_date_MM;
				end if;
				
			when set_date_YYYY =>
				if (btn_l = '1') then
					nextmode <= disp_date_DDMM;
				elsif (btn_r = '1') then
					nextmode <= set_date_MM;
				else
					nextmode <= set_date_YYYY;
				end if;
		--alarm
			when disp_alarm =>
				if (btn_l = '1') then
					nextmode <= disp_time_HHMM;
				elsif (btn_r = '1') then
					nextmode <= set_alarm_hh;
				else
					nextmode <= disp_alarm;
				end if;		
			when set_alarm_hh =>
				if (btn_l = '1') then
					nextmode <= disp_alarm;
				elsif (btn_r = '1') then
					nextmode <= set_alarm_mm;
				else
					nextmode <= set_alarm_hh;
				end if;
			when set_alarm_mm =>
				if (btn_l = '1') then
					nextmode <= disp_alarm;
				elsif (btn_r = '1') then
					nextmode <= disp_alarm;
				else
					nextmode <= set_alarm_mm;
				end if;
		end case;
	end process;
	
	set_outputs: process (currentmode, currentalarm, btn_u, btn_d, hh, mm, ss, day, month, year, alarm_hh, alarm_mm)
	begin
		up_hh <= '0';
		down_hh <= '0';
		up_mm<= '0';
		down_mm <= '0';
		rst_ss <= '0';
		up_month<= '0';
		down_month <= '0';
		up_day<= '0';
		down_day <= '0';
		up_year<= '0';
		down_year <= '0';
		up_alarm_hh <= '0'; up_alarm_mm <= '0'; down_alarm_hh <= '0'; down_alarm_mm <= '0';
		mode_time <= '0'; 
		mode_date <= '0'; 
		mode_alarm <= '0'; 
		blink1 <= '0'; 
		blink2 <= '0';
		alarm_ring <= '0';

		-- Check if the alarm needs to be triggered
		case currentalarm is
			when enabled =>
				alarm_enabled <= '1';
				if (hh = alarm_hh and mm = alarm_mm) then
					alarm_ring <= '1';				
					end if;
			when disabled =>
				alarm_enabled <= '0';
		end case;
		
		case currentmode is
		-- Time modes
			when disp_time_HHMM =>
				num1 <= hh; num2 <= mm;
				mode_time <= '1';
				
			when disp_time_MMSS =>
				num1 <= mm; num2 <= ss;
				mode_time <= '1';
				
			when set_time_HH =>
				num1 <= hh; num2 <= mm;
				blink1 <= '1';
				mode_time <= '1';
				if (btn_u = '1') then
					up_hh <= '1';
				elsif (btn_d = '1') then
					down_hh <= '1';
				else
					up_hh <= '0';
					down_hh <= '0';
				end if;
				
			when set_time_MM =>
				num1 <= hh; num2 <= mm;
				blink2 <= '1';
				mode_time <= '1';
				if (btn_u = '1') then
					up_mm <= '1';
				elsif (btn_d = '1') then
					down_mm <= '1';
				else
					up_mm <= '0';
					down_mm <= '0';
				end if;

			when reset_time_SS =>
				num1 <= mm; num2 <= ss;
				blink2 <= '1';
				mode_time <= '1'; 
				if (btn_u = '1') then
					rst_ss <= '1';
				else
					rst_ss <= '0';
				end if;
				
		-- Date modes
			when disp_date_DDMM =>
				num1 <= day; num2 <= month;
				mode_date <= '1';
				
			when disp_date_YYYY =>
				num1 <= std_logic_vector(to_unsigned(20, num1'length)); num2 <= year;
				mode_date <= '1'; 
				
			when set_date_DD =>
				num1 <= day; num2 <= month;
				blink1 <= '1'; 
				mode_date <= '1';
				if (btn_u = '1') then
					up_day <= '1';
				elsif (btn_d = '1') then
					down_day <= '1';
				else
					up_day <= '0';
					down_day <= '0';
				end if;
				
			when set_date_MM =>
				num1 <= day; num2 <= month;
				blink2 <= '1';
				mode_date <= '1'; 
				if (btn_u = '1') then
					up_month <= '1';
				elsif (btn_d = '1') then
					down_month <= '1';
				else
					up_month <= '0';
					down_month <= '0';
				end if;
				
			when set_date_YYYY =>
				num1 <= std_logic_vector(to_unsigned(20, num1'length)); num2 <= year;
				blink1 <= '1'; blink2 <= '1';
				mode_date <= '1';
				if (btn_u = '1') then
					up_year <= '1';
				elsif (btn_d = '1') then
					down_year <= '1';
				else
					up_year <= '0';
					down_year <= '0';
				end if;
				
		-- Alarm modes
			when disp_alarm =>
				num1 <= alarm_hh; num2 <= alarm_mm;
				mode_alarm <= '1';
			when set_alarm_hh =>
				num1 <= alarm_hh; num2 <= alarm_mm;
				mode_alarm <= '1';
				blink1 <= '1'; 
				if (btn_u = '1') then
					up_alarm_hh <= '1';
				elsif (btn_d = '1') then
					down_alarm_hh <= '1';
				end if;
			when set_alarm_mm =>
				num1 <= alarm_hh; num2 <= alarm_mm;
				mode_alarm <= '1';
				blink2 <= '1'; 
			if (btn_u = '1') then
					up_alarm_mm <= '1';
				elsif (btn_d = '1') then
					down_alarm_mm <= '1';
				end if;
		end case;
	end process;
end Behavioral;

