--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.49d
--  \   \         Application: netgen
--  /   /         Filename: counter_int_synthesis.vhd
-- /___/   /\     Timestamp: Mon Oct 20 01:32:55 2014
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm counter_int -w -dir netgen/synthesis -ofmt vhdl -sim counter_int.ngc counter_int_synthesis.vhd 
-- Device	: xc6slx16-3-csg324
-- Input file	: counter_int.ngc
-- Output file	: C:\Users\seb\Google Drive\UA\S-Elektronica 1\digitale technieken\practicum\Klok\netgen\synthesis\counter_int_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: counter_int
-- Xilinx	: C:\Xilinx\14.4\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity counter_int is
  port (
    clk : in STD_LOGIC := 'X'; 
    cten : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    down : in STD_LOGIC := 'X'; 
    ld : in STD_LOGIC := 'X'; 
    data : in STD_LOGIC_VECTOR ( 5 downto 0 ); 
    count : out STD_LOGIC_VECTOR ( 5 downto 0 ) 
  );
end counter_int;

architecture Structure of counter_int is
  signal data_5_IBUF_0 : STD_LOGIC; 
  signal data_4_IBUF_1 : STD_LOGIC; 
  signal data_3_IBUF_2 : STD_LOGIC; 
  signal data_2_IBUF_3 : STD_LOGIC; 
  signal data_1_IBUF_4 : STD_LOGIC; 
  signal data_0_IBUF_5 : STD_LOGIC; 
  signal clk_BUFGP_6 : STD_LOGIC; 
  signal cten_IBUF_7 : STD_LOGIC; 
  signal rst_IBUF_8 : STD_LOGIC; 
  signal down_IBUF_9 : STD_LOGIC; 
  signal ld_IBUF_10 : STD_LOGIC; 
  signal cntr_count_v_5_data_5_mux_9_OUT_2_Q : STD_LOGIC; 
  signal Q_n0042_inv1 : STD_LOGIC; 
  signal Reset_OR_DriverANDClockEnable_19 : STD_LOGIC; 
  signal N01 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal cntr_count_v_5_data_5_mux_9_OUT_4_1_22 : STD_LOGIC; 
  signal cntr_count_v_5_data_5_mux_9_OUT_3_1_23 : STD_LOGIC; 
  signal cntr_count_v_5_data_5_mux_9_OUT_2_1_24 : STD_LOGIC; 
  signal cntr_count_v_5_data_5_mux_9_OUT_2_2_25 : STD_LOGIC; 
  signal cntr_count_v_0_glue_rst_43 : STD_LOGIC; 
  signal cntr_count_v_1_glue_ce_44 : STD_LOGIC; 
  signal cntr_count_v_1_glue_rst_45 : STD_LOGIC; 
  signal cntr_count_v_3_glue_rst_46 : STD_LOGIC; 
  signal cntr_count_v_4_glue_rst_47 : STD_LOGIC; 
  signal cntr_count_v_5_glue_rst_48 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N7 : STD_LOGIC; 
  signal cntr_count_v_2_rstpot_52 : STD_LOGIC; 
  signal cntr_count_v : STD_LOGIC_VECTOR ( 5 downto 0 ); 
begin
  Q_n0042_inv11 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => ld_IBUF_10,
      I1 => cten_IBUF_7,
      O => Q_n0042_inv1
    );
  Reset_OR_DriverANDClockEnable_SW0 : LUT5
    generic map(
      INIT => X"02000000"
    )
    port map (
      I0 => cten_IBUF_7,
      I1 => down_IBUF_9,
      I2 => ld_IBUF_10,
      I3 => cntr_count_v(4),
      I4 => cntr_count_v(3),
      O => N01
    );
  Reset_OR_DriverANDClockEnable : LUT6
    generic map(
      INIT => X"EEEAEAEAAAAAAAAA"
    )
    port map (
      I0 => rst_IBUF_8,
      I1 => cntr_count_v(5),
      I2 => cntr_count_v(2),
      I3 => cntr_count_v(1),
      I4 => cntr_count_v(0),
      I5 => N01,
      O => Reset_OR_DriverANDClockEnable_19
    );
  cntr_count_v_5_data_5_mux_9_OUT_5_SW0 : LUT6
    generic map(
      INIT => X"4000000000000002"
    )
    port map (
      I0 => down_IBUF_9,
      I1 => cntr_count_v(4),
      I2 => cntr_count_v(3),
      I3 => cntr_count_v(2),
      I4 => cntr_count_v(1),
      I5 => cntr_count_v(0),
      O => N2
    );
  cntr_count_v_5_data_5_mux_9_OUT_4_1 : LUT6
    generic map(
      INIT => X"9CCCCCCCCCCCCCC6"
    )
    port map (
      I0 => down_IBUF_9,
      I1 => cntr_count_v(4),
      I2 => cntr_count_v(3),
      I3 => cntr_count_v(2),
      I4 => cntr_count_v(1),
      I5 => cntr_count_v(0),
      O => cntr_count_v_5_data_5_mux_9_OUT_4_1_22
    );
  cntr_count_v_5_data_5_mux_9_OUT_3_1 : LUT5
    generic map(
      INIT => X"AAA96AAA"
    )
    port map (
      I0 => cntr_count_v(3),
      I1 => cntr_count_v(2),
      I2 => cntr_count_v(0),
      I3 => cntr_count_v(1),
      I4 => down_IBUF_9,
      O => cntr_count_v_5_data_5_mux_9_OUT_3_1_23
    );
  cntr_count_v_5_data_5_mux_9_OUT_2_1 : LUT6
    generic map(
      INIT => X"FF00FF00FF0000FE"
    )
    port map (
      I0 => cntr_count_v(5),
      I1 => cntr_count_v(4),
      I2 => cntr_count_v(3),
      I3 => cntr_count_v(2),
      I4 => cntr_count_v(1),
      I5 => cntr_count_v(0),
      O => cntr_count_v_5_data_5_mux_9_OUT_2_1_24
    );
  cntr_count_v_5_data_5_mux_9_OUT_2_2 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => cntr_count_v(2),
      I1 => cntr_count_v(1),
      I2 => cntr_count_v(0),
      O => cntr_count_v_5_data_5_mux_9_OUT_2_2_25
    );
  cntr_count_v_5_data_5_mux_9_OUT_2_3 : LUT5
    generic map(
      INIT => X"AFACA3A0"
    )
    port map (
      I0 => data_2_IBUF_3,
      I1 => down_IBUF_9,
      I2 => ld_IBUF_10,
      I3 => cntr_count_v_5_data_5_mux_9_OUT_2_2_25,
      I4 => cntr_count_v_5_data_5_mux_9_OUT_2_1_24,
      O => cntr_count_v_5_data_5_mux_9_OUT_2_Q
    );
  data_5_IBUF : IBUF
    port map (
      I => data(5),
      O => data_5_IBUF_0
    );
  data_4_IBUF : IBUF
    port map (
      I => data(4),
      O => data_4_IBUF_1
    );
  data_3_IBUF : IBUF
    port map (
      I => data(3),
      O => data_3_IBUF_2
    );
  data_2_IBUF : IBUF
    port map (
      I => data(2),
      O => data_2_IBUF_3
    );
  data_1_IBUF : IBUF
    port map (
      I => data(1),
      O => data_1_IBUF_4
    );
  data_0_IBUF : IBUF
    port map (
      I => data(0),
      O => data_0_IBUF_5
    );
  cten_IBUF : IBUF
    port map (
      I => cten,
      O => cten_IBUF_7
    );
  rst_IBUF : IBUF
    port map (
      I => rst,
      O => rst_IBUF_8
    );
  down_IBUF : IBUF
    port map (
      I => down,
      O => down_IBUF_9
    );
  ld_IBUF : IBUF
    port map (
      I => ld,
      O => ld_IBUF_10
    );
  count_5_OBUF : OBUF
    port map (
      I => cntr_count_v(5),
      O => count(5)
    );
  count_4_OBUF : OBUF
    port map (
      I => cntr_count_v(4),
      O => count(4)
    );
  count_3_OBUF : OBUF
    port map (
      I => cntr_count_v(3),
      O => count(3)
    );
  count_2_OBUF : OBUF
    port map (
      I => cntr_count_v(2),
      O => count(2)
    );
  count_1_OBUF : OBUF
    port map (
      I => cntr_count_v(1),
      O => count(1)
    );
  count_0_OBUF : OBUF
    port map (
      I => cntr_count_v(0),
      O => count(0)
    );
  cntr_count_v_0 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_6,
      D => cntr_count_v_0_glue_rst_43,
      Q => cntr_count_v(0)
    );
  cntr_count_v_1 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_6,
      D => cntr_count_v_1_glue_rst_45,
      Q => cntr_count_v(1)
    );
  cntr_count_v_3 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_6,
      D => cntr_count_v_3_glue_rst_46,
      Q => cntr_count_v(3)
    );
  cntr_count_v_4 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_6,
      D => cntr_count_v_4_glue_rst_47,
      Q => cntr_count_v(4)
    );
  cntr_count_v_5 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_6,
      D => cntr_count_v_5_glue_rst_48,
      Q => cntr_count_v(5)
    );
  cntr_count_v_5_glue_rst : LUT6
    generic map(
      INIT => X"00000000A3ACAFA0"
    )
    port map (
      I0 => data_5_IBUF_0,
      I1 => cten_IBUF_7,
      I2 => ld_IBUF_10,
      I3 => cntr_count_v(5),
      I4 => N2,
      I5 => Reset_OR_DriverANDClockEnable_19,
      O => cntr_count_v_5_glue_rst_48
    );
  cntr_count_v_3_glue_rst : LUT6
    generic map(
      INIT => X"00000000AFACA3A0"
    )
    port map (
      I0 => data_3_IBUF_2,
      I1 => cten_IBUF_7,
      I2 => ld_IBUF_10,
      I3 => cntr_count_v(3),
      I4 => cntr_count_v_5_data_5_mux_9_OUT_3_1_23,
      I5 => Reset_OR_DriverANDClockEnable_19,
      O => cntr_count_v_3_glue_rst_46
    );
  cntr_count_v_4_glue_rst : LUT6
    generic map(
      INIT => X"00000000AFACA3A0"
    )
    port map (
      I0 => data_4_IBUF_1,
      I1 => cten_IBUF_7,
      I2 => ld_IBUF_10,
      I3 => cntr_count_v(4),
      I4 => cntr_count_v_5_data_5_mux_9_OUT_4_1_22,
      I5 => Reset_OR_DriverANDClockEnable_19,
      O => cntr_count_v_4_glue_rst_47
    );
  Reset_OR_DriverANDClockEnable_SW1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cntr_count_v(1),
      I1 => cntr_count_v(0),
      O => N4
    );
  cntr_count_v_1_glue_rst : LUT6
    generic map(
      INIT => X"1155155500000000"
    )
    port map (
      I0 => rst_IBUF_8,
      I1 => cntr_count_v(5),
      I2 => cntr_count_v(2),
      I3 => N01,
      I4 => N4,
      I5 => cntr_count_v_1_glue_ce_44,
      O => cntr_count_v_1_glue_rst_45
    );
  cntr_count_v_0_glue_rst : LUT6
    generic map(
      INIT => X"002000005777FFFF"
    )
    port map (
      I0 => cntr_count_v(5),
      I1 => cntr_count_v(2),
      I2 => cntr_count_v(1),
      I3 => N7,
      I4 => N01,
      I5 => N6,
      O => cntr_count_v_0_glue_rst_43
    );
  cntr_count_v_1_glue_ce : LUT6
    generic map(
      INIT => X"CCAFCC50CC5FCCA0"
    )
    port map (
      I0 => down_IBUF_9,
      I1 => data_1_IBUF_4,
      I2 => cten_IBUF_7,
      I3 => ld_IBUF_10,
      I4 => cntr_count_v(1),
      I5 => cntr_count_v(0),
      O => cntr_count_v_1_glue_ce_44
    );
  Reset_OR_DriverANDClockEnable_SW2 : LUT5
    generic map(
      INIT => X"DDFCDDCF"
    )
    port map (
      I0 => data_0_IBUF_5,
      I1 => rst_IBUF_8,
      I2 => cten_IBUF_7,
      I3 => ld_IBUF_10,
      I4 => cntr_count_v(0),
      O => N6
    );
  Reset_OR_DriverANDClockEnable_SW3 : LUT5
    generic map(
      INIT => X"FFFFFF1B"
    )
    port map (
      I0 => ld_IBUF_10,
      I1 => cten_IBUF_7,
      I2 => data_0_IBUF_5,
      I3 => rst_IBUF_8,
      I4 => cntr_count_v(0),
      O => N7
    );
  cntr_count_v_2_rstpot : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => Reset_OR_DriverANDClockEnable_19,
      I1 => Q_n0042_inv1,
      I2 => cntr_count_v_5_data_5_mux_9_OUT_2_Q,
      I3 => cntr_count_v(2),
      O => cntr_count_v_2_rstpot_52
    );
  cntr_count_v_2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_6,
      D => cntr_count_v_2_rstpot_52,
      Q => cntr_count_v(2)
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_6
    );

end Structure;

