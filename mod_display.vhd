----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:05:45 11/05/2014 
-- Design Name: 
-- Module Name:    top_klok - Behavioral 
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

entity mod_display is
    Port ( clk, rst, refresh: in STD_LOGIC;
           num1, num2 : in  STD_LOGIC_VECTOR (6 downto 0);
			  blink1, blink2: in STD_LOGIC;
			  seg7 : out  STD_LOGIC_VECTOR (6 downto 0);
			  anode : out STD_LOGIC_VECTOR (3 downto 0)
	 );
end mod_display;

architecture Behavioral of mod_display is
	component bcd_conv is
		Port ( 
			clk, rst : in std_logic;
			number   : in  std_logic_vector (6 downto 0);
			tens     : out std_logic_vector (3 downto 0);
			ones     : out std_logic_vector (3 downto 0)
		);
	end component;
	component bcd_7seg is
		port (
			clk, rst : in std_logic;
			bcd : in std_logic_vector(3 downto 0);  --BCD input
			segment7 : out std_logic_vector(6 downto 0)  -- 7 bit decoded output.
		);
	end component;
	
	signal sig_num: std_logic_vector (6 downto 0);
	signal sig_tens, sig_ones, sig_bcd, sig_anode: std_logic_vector (3 downto 0);
begin
	CONV: bcd_conv
		port map (clk => clk, rst => rst, number => sig_num, tens => sig_tens, ones => sig_ones);
	SEGM: bcd_7seg
		port map (clk => clk, rst => rst, bcd => sig_bcd, segment7 => seg7);
	process (clk, rst) 
		variable cnt:integer range 4 downto 0;
	begin
		if(rst='1') then
				anode<="1111";
				cnt:=0;
		elsif (rising_edge(clk)) then

		-- TODO: add blinking
				if (refresh = '1' ) then
					if(cnt=4) then 
						cnt:=0;
					end if;
					cnt:=cnt+1;
					case cnt is
						when 0 =>
							sig_num <= num1;
							sig_bcd <= sig_tens;
						when 1 =>
							sig_num <= num1;
							sig_bcd <= sig_ones;
						when 2 =>
							sig_num <= num2;
							sig_bcd <= sig_tens;
						when 3 =>
							sig_num <= num2;
							sig_bcd <= sig_ones;
						when others =>
							sig_num <= num1;
							sig_bcd <= sig_tens;
					end case;	
					anode<="1111";
					anode(cnt)<='0';
				end if;
			--anode <= sig_anode;
		end if;
	end process;
end Behavioral;

