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
         clk, rst : IN  std_logic;
         btn_l, btn_r, btn_u, btn_d, btn_s : IN  std_logic;
         hh, mm, ss : IN  std_logic_vector(6 downto 0);
			day, month, year : IN  std_logic_vector(6 downto 0);
			up_hh, up_mm, rst_ss, down_hh, down_mm : OUT std_logic;
			up_day, up_month, up_year, down_day, down_month, down_year : OUT std_logic;
			--alarm_hh, alarm_mm : IN  std_logic_vector(6 downto 0);
			--up_alarm_hh, up_alarm_mm, down_alarm_hh, down_alarm_mm : OUT std_logic;
			mode_time, mode_date, mode_alarm, alarm_enabled: OUT std_logic;
			blink1, blink2: OUT std_logic;
         num1, num2 : OUT  std_logic_vector(6 downto 0)
        );
end func_select;

architecture Behavioral of func_select is
	type mode is (	disp_time_HHMM, disp_time_MMSS, set_time_HH, set_time_MM, reset_time_SS,
						disp_date_DDMM, set_date_DD, set_date_MM, set_date_YYYY
						); -- disp_alarm, set_alarm
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
	
	change_alarm: process (currentalarm, btn_s)
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
	
		
	end process;
	
	change_mode: process (currentmode, btn_l, btn_r)
	begin
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
				nextmode <= disp_time_HHMM; 
			elsif (btn_r = '1') then
				nextmode <= set_date_DD;
			else
				nextmode <= disp_date_DDMM;
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
					nextmode <= set_time_HH;
				else
					nextmode <= reset_time_SS;
				end if;
				
			when set_date_DD =>
				if (btn_l = '1') then
					nextmode <= disp_date_DDMM;
				elsif (btn_r = '1') then
					nextmode <= set_date_MM;
				else
					nextmode <= set_date_DD;
				end if;
				
			when set_date_MM =>
				if (btn_l = '1') then
					nextmode <= disp_date_DDMM;
				elsif (btn_r = '1') then
					nextmode <= set_date_YYYY;
				else
					nextmode <= set_date_MM;
				end if;
				
			when set_date_YYYY =>
				if (btn_l = '1') then
					nextmode <= disp_date_DDMM;
				elsif (btn_r = '1') then
					nextmode <= set_date_DD;
				else
					nextmode <= set_date_YYYY;
				end if;

		end case;
	end process;
	
	set_outputs: process (currentmode, currentalarm, btn_u, btn_d, hh, mm, ss, day, month, year)
	begin
		up_hh <= '0';
		down_hh <= '0';
		up_mm<= '0';
		down_mm <= '0';
		rst_ss <= '0';
		case currentalarm is
			when enabled =>
				alarm_enabled <= '1';
			when disabled =>
				alarm_enabled <= '0';
		end case;
		case currentmode is
		-- Time modes
			when disp_time_HHMM =>
				num1 <= hh; num2 <= mm;
				blink1 <= '0'; blink2 <= '0';
				mode_time <= '1'; mode_date <= '0'; mode_alarm <= '0'; 
				
			when disp_time_MMSS =>
				num1 <= mm; num2 <= ss;
				blink1 <= '0'; blink2 <= '0';
				mode_time <= '1'; mode_date <= '0'; mode_alarm <= '0'; 
				
			when set_time_HH =>
				num1 <= hh; num2 <= mm;
				blink1 <= '1'; blink2 <= '0';
				mode_time <= '1'; mode_date <= '0'; mode_alarm <= '0'; 
				if (btn_u = '1') then
					up_hh <= '1';
				elsif (btn_d = '1') then
					down_hh <= '1';
				end if;
				
			when set_time_MM =>
				num1 <= hh; num2 <= mm;
				blink1 <= '0'; blink2 <= '1';
				mode_time <= '1'; mode_date <= '0'; mode_alarm <= '0'; 
				if (btn_u = '1') then
					up_mm <= '1';
				elsif (btn_d = '1') then
					down_mm <= '1';
				end if;

			when reset_time_SS =>
				num1 <= mm; num2 <= ss;
				blink1 <= '0'; blink2 <= '1';
				mode_time <= '1'; mode_date <= '0'; mode_alarm <= '0'; 
				if (btn_u = '1') then
					rst_ss <= '1';
				end if;
				
		-- Date modes
			when disp_date_DDMM =>
				num1 <= day; num2 <= month;
				blink1 <= '0'; blink2 <= '0';
				mode_time <= '0'; mode_date <= '1'; mode_alarm <= '0';
				
			when set_date_DD =>
				num1 <= day; num2 <= month;
				blink1 <= '1'; blink2 <= '0';
				mode_time <= '0'; mode_date <= '1'; mode_alarm <= '0';
				if (btn_u = '1') then
					up_day <= '1';
				elsif (btn_d = '1') then
					down_day <= '1';
				end if;
				
			when set_date_MM =>
				num1 <= day; num2 <= month;
				blink1 <= '0'; blink2 <= '1';
				mode_time <= '0'; mode_date <= '1'; mode_alarm <= '0';
				if (btn_u = '1') then
					up_month <= '1';
				elsif (btn_d = '1') then
					down_month <= '1';
				end if;
				
			when set_date_YYYY =>
				num1 <= std_logic_vector(to_unsigned(20, num1'length)); num2 <= year;
				blink1 <= '0'; blink2 <= '1';
				mode_time <= '0'; mode_date <= '1'; mode_alarm <= '0';
				if (btn_u = '1') then
					up_year <= '1';
				elsif (btn_d = '1') then
					down_year <= '1';
				end if;
				
		end case;
	end process;
end Behavioral;

