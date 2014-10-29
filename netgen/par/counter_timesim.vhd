--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.49d
--  \   \         Application: netgen
--  /   /         Filename: counter_timesim.vhd
-- /___/   /\     Timestamp: Tue Oct 28 14:54:50 2014
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 3 -pcf counter.pcf -rpw 100 -tpw 0 -ar Structure -tm counter -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim counter.ncd counter_timesim.vhd 
-- Device	: 6slx16csg324-3 (PRODUCTION 1.23 2012-12-04)
-- Input file	: counter.ncd
-- Output file	: C:\Users\seb\Google Drive\UA\S-Elektronica 1\digitale technieken\practicum\Klok\netgen\par\counter_timesim.vhd
-- # of Entities	: 1
-- Design Name	: counter
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
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity counter is
  port (
    clk : in STD_LOGIC := 'X'; 
    cten : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    down : in STD_LOGIC := 'X'; 
    ld : in STD_LOGIC := 'X'; 
    data : in STD_LOGIC_VECTOR ( 5 downto 0 ); 
    count : out STD_LOGIC_VECTOR ( 5 downto 0 ) 
  );
end counter;

architecture Structure of counter is
  signal cntr_count_v_5_data_5_mux_9_OUT_3_1_181 : STD_LOGIC; 
  signal down_IBUF_0 : STD_LOGIC; 
  signal N4_0 : STD_LOGIC; 
  signal N01 : STD_LOGIC; 
  signal clk_BUFGP : STD_LOGIC; 
  signal data_0_IBUF_0 : STD_LOGIC; 
  signal rst_IBUF_0 : STD_LOGIC; 
  signal cten_IBUF_0 : STD_LOGIC; 
  signal ld_IBUF_0 : STD_LOGIC; 
  signal data_1_IBUF_0 : STD_LOGIC; 
  signal clk_BUFGP_IBUFG_0 : STD_LOGIC; 
  signal data_2_IBUF_0 : STD_LOGIC; 
  signal data_3_IBUF_0 : STD_LOGIC; 
  signal data_4_IBUF_0 : STD_LOGIC; 
  signal data_5_IBUF_0 : STD_LOGIC; 
  signal Reset_OR_DriverANDClockEnable_203 : STD_LOGIC; 
  signal cntr_count_v_5_data_5_mux_9_OUT_4_1_204 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal cntr_count_v_5_data_5_mux_9_OUT_2_1_206 : STD_LOGIC; 
  signal cntr_count_v_5_data_5_mux_9_OUT_2_2_207 : STD_LOGIC; 
  signal N7 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal cntr_count_v_1_glue_ce_210 : STD_LOGIC; 
  signal cntr_count_v_5_data_5_mux_9_OUT_2_Q : STD_LOGIC; 
  signal data_0_IBUF_1 : STD_LOGIC; 
  signal data_1_IBUF_4 : STD_LOGIC; 
  signal clk_BUFGP_IBUFG_7 : STD_LOGIC; 
  signal ld_IBUF_10 : STD_LOGIC; 
  signal data_2_IBUF_13 : STD_LOGIC; 
  signal data_3_IBUF_16 : STD_LOGIC; 
  signal data_4_IBUF_19 : STD_LOGIC; 
  signal data_5_IBUF_22 : STD_LOGIC; 
  signal cten_IBUF_37 : STD_LOGIC; 
  signal down_IBUF_40 : STD_LOGIC; 
  signal rst_IBUF_43 : STD_LOGIC; 
  signal cntr_count_v_1_glue_rst_76 : STD_LOGIC; 
  signal N7_pack_10 : STD_LOGIC; 
  signal cntr_count_v_0_glue_rst_53 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal cntr_count_v_5_glue_rst_101 : STD_LOGIC; 
  signal cntr_count_v_2_rstpot_140 : STD_LOGIC; 
  signal cntr_count_v_3_glue_rst_126 : STD_LOGIC; 
  signal cntr_count_v_4_glue_rst_117 : STD_LOGIC; 
  signal NlwBufferSignal_count_0_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_count_1_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_count_2_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_count_3_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_count_4_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_count_5_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_clk_BUFGP_BUFG_IN : STD_LOGIC; 
  signal NlwBufferSignal_cntr_count_v_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_cntr_count_v_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_cntr_count_v_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_cntr_count_v_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_cntr_count_v_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_cntr_count_v_2_CLK : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal cntr_count_v : STD_LOGIC_VECTOR ( 5 downto 0 ); 
begin
  data_0_IBUF : X_BUF
    generic map(
      LOC => "PAD169",
      PATHPULSE => 202 ps
    )
    port map (
      O => data_0_IBUF_1,
      I => data(0)
    );
  ProtoComp2_IMUX : X_BUF
    generic map(
      LOC => "PAD169",
      PATHPULSE => 202 ps
    )
    port map (
      I => data_0_IBUF_1,
      O => data_0_IBUF_0
    );
  data_1_IBUF : X_BUF
    generic map(
      LOC => "PAD171",
      PATHPULSE => 202 ps
    )
    port map (
      O => data_1_IBUF_4,
      I => data(1)
    );
  ProtoComp2_IMUX_1 : X_BUF
    generic map(
      LOC => "PAD171",
      PATHPULSE => 202 ps
    )
    port map (
      I => data_1_IBUF_4,
      O => data_1_IBUF_0
    );
  clk_BUFGP_IBUFG : X_BUF
    generic map(
      LOC => "PAD216",
      PATHPULSE => 202 ps
    )
    port map (
      O => clk_BUFGP_IBUFG_7,
      I => clk
    );
  ProtoComp2_IMUX_2 : X_BUF
    generic map(
      LOC => "PAD216",
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP_IBUFG_7,
      O => clk_BUFGP_IBUFG_0
    );
  ld_IBUF : X_BUF
    generic map(
      LOC => "PAD170",
      PATHPULSE => 202 ps
    )
    port map (
      O => ld_IBUF_10,
      I => ld
    );
  ProtoComp2_IMUX_3 : X_BUF
    generic map(
      LOC => "PAD170",
      PATHPULSE => 202 ps
    )
    port map (
      I => ld_IBUF_10,
      O => ld_IBUF_0
    );
  data_2_IBUF : X_BUF
    generic map(
      LOC => "PAD167",
      PATHPULSE => 202 ps
    )
    port map (
      O => data_2_IBUF_13,
      I => data(2)
    );
  ProtoComp2_IMUX_4 : X_BUF
    generic map(
      LOC => "PAD167",
      PATHPULSE => 202 ps
    )
    port map (
      I => data_2_IBUF_13,
      O => data_2_IBUF_0
    );
  data_3_IBUF : X_BUF
    generic map(
      LOC => "PAD168",
      PATHPULSE => 202 ps
    )
    port map (
      O => data_3_IBUF_16,
      I => data(3)
    );
  ProtoComp2_IMUX_5 : X_BUF
    generic map(
      LOC => "PAD168",
      PATHPULSE => 202 ps
    )
    port map (
      I => data_3_IBUF_16,
      O => data_3_IBUF_0
    );
  data_4_IBUF : X_BUF
    generic map(
      LOC => "PAD175",
      PATHPULSE => 202 ps
    )
    port map (
      O => data_4_IBUF_19,
      I => data(4)
    );
  ProtoComp2_IMUX_6 : X_BUF
    generic map(
      LOC => "PAD175",
      PATHPULSE => 202 ps
    )
    port map (
      I => data_4_IBUF_19,
      O => data_4_IBUF_0
    );
  data_5_IBUF : X_BUF
    generic map(
      LOC => "PAD176",
      PATHPULSE => 202 ps
    )
    port map (
      O => data_5_IBUF_22,
      I => data(5)
    );
  ProtoComp2_IMUX_7 : X_BUF
    generic map(
      LOC => "PAD176",
      PATHPULSE => 202 ps
    )
    port map (
      I => data_5_IBUF_22,
      O => data_5_IBUF_0
    );
  count_0_OBUF : X_OBUF
    generic map(
      LOC => "PAD157"
    )
    port map (
      I => NlwBufferSignal_count_0_OBUF_I,
      O => count(0)
    );
  count_1_OBUF : X_OBUF
    generic map(
      LOC => "PAD158"
    )
    port map (
      I => NlwBufferSignal_count_1_OBUF_I,
      O => count(1)
    );
  count_2_OBUF : X_OBUF
    generic map(
      LOC => "PAD159"
    )
    port map (
      I => NlwBufferSignal_count_2_OBUF_I,
      O => count(2)
    );
  count_3_OBUF : X_OBUF
    generic map(
      LOC => "PAD160"
    )
    port map (
      I => NlwBufferSignal_count_3_OBUF_I,
      O => count(3)
    );
  count_4_OBUF : X_OBUF
    generic map(
      LOC => "PAD161"
    )
    port map (
      I => NlwBufferSignal_count_4_OBUF_I,
      O => count(4)
    );
  count_5_OBUF : X_OBUF
    generic map(
      LOC => "PAD162"
    )
    port map (
      I => NlwBufferSignal_count_5_OBUF_I,
      O => count(5)
    );
  cten_IBUF : X_BUF
    generic map(
      LOC => "PAD163",
      PATHPULSE => 202 ps
    )
    port map (
      O => cten_IBUF_37,
      I => cten
    );
  ProtoComp2_IMUX_8 : X_BUF
    generic map(
      LOC => "PAD163",
      PATHPULSE => 202 ps
    )
    port map (
      I => cten_IBUF_37,
      O => cten_IBUF_0
    );
  down_IBUF : X_BUF
    generic map(
      LOC => "PAD164",
      PATHPULSE => 202 ps
    )
    port map (
      O => down_IBUF_40,
      I => down
    );
  ProtoComp2_IMUX_9 : X_BUF
    generic map(
      LOC => "PAD164",
      PATHPULSE => 202 ps
    )
    port map (
      I => down_IBUF_40,
      O => down_IBUF_0
    );
  rst_IBUF : X_BUF
    generic map(
      LOC => "PAD172",
      PATHPULSE => 202 ps
    )
    port map (
      O => rst_IBUF_43,
      I => rst
    );
  ProtoComp2_IMUX_10 : X_BUF
    generic map(
      LOC => "PAD172",
      PATHPULSE => 202 ps
    )
    port map (
      I => rst_IBUF_43,
      O => rst_IBUF_0
    );
  clk_BUFGP_BUFG : X_CKBUF
    generic map(
      LOC => "BUFGMUX_X3Y13",
      PATHPULSE => 202 ps
    )
    port map (
      I => NlwBufferSignal_clk_BUFGP_BUFG_IN,
      O => clk_BUFGP
    );
  cntr_count_v_1_cntr_count_v_1_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => N7_pack_10,
      O => N7
    );
  cntr_count_v_1 : X_FF
    generic map(
      LOC => "SLICE_X8Y4",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_cntr_count_v_1_CLK,
      I => cntr_count_v_1_glue_rst_76,
      O => cntr_count_v(1),
      SET => GND,
      RST => GND
    );
  cntr_count_v_1_glue_rst : X_LUT6
    generic map(
      LOC => "SLICE_X8Y4",
      INIT => X"1113000033330000"
    )
    port map (
      ADR1 => rst_IBUF_0,
      ADR0 => cntr_count_v(5),
      ADR3 => cntr_count_v(2),
      ADR5 => N01,
      ADR2 => N4_0,
      ADR4 => cntr_count_v_1_glue_ce_210,
      O => cntr_count_v_1_glue_rst_76
    );
  cntr_count_v_1_glue_ce : X_LUT6
    generic map(
      LOC => "SLICE_X8Y4",
      INIT => X"FFFF0000C66CC66C"
    )
    port map (
      ADR3 => down_IBUF_0,
      ADR4 => data_1_IBUF_0,
      ADR0 => cten_IBUF_0,
      ADR5 => ld_IBUF_0,
      ADR1 => cntr_count_v(1),
      ADR2 => cntr_count_v(0),
      O => cntr_count_v_1_glue_ce_210
    );
  Reset_OR_DriverANDClockEnable_SW2 : X_LUT6
    generic map(
      LOC => "SLICE_X8Y4",
      INIT => X"F4FEF1FBF4FEF1FB"
    )
    port map (
      ADR3 => data_0_IBUF_0,
      ADR2 => rst_IBUF_0,
      ADR4 => cten_IBUF_0,
      ADR0 => ld_IBUF_0,
      ADR1 => cntr_count_v(0),
      ADR5 => '1',
      O => N6
    );
  Reset_OR_DriverANDClockEnable_SW3 : X_LUT5
    generic map(
      LOC => "SLICE_X8Y4",
      INIT => X"FCFEFDFF"
    )
    port map (
      ADR3 => data_0_IBUF_0,
      ADR2 => rst_IBUF_0,
      ADR4 => cten_IBUF_0,
      ADR0 => ld_IBUF_0,
      ADR1 => cntr_count_v(0),
      O => N7_pack_10
    );
  cntr_count_v_0 : X_FF
    generic map(
      LOC => "SLICE_X8Y4",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_cntr_count_v_0_CLK,
      I => cntr_count_v_0_glue_rst_53,
      O => cntr_count_v(0),
      SET => GND,
      RST => GND
    );
  cntr_count_v_0_glue_rst : X_LUT6
    generic map(
      LOC => "SLICE_X8Y4",
      INIT => X"000040001FFF5FFF"
    )
    port map (
      ADR2 => cntr_count_v(5),
      ADR0 => cntr_count_v(2),
      ADR1 => cntr_count_v(1),
      ADR4 => N7,
      ADR3 => N01,
      ADR5 => N6,
      O => cntr_count_v_0_glue_rst_53
    );
  cntr_count_v_5_data_5_mux_9_OUT_3_1_cntr_count_v_5_data_5_mux_9_OUT_3_1_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => N4,
      O => N4_0
    );
  cntr_count_v_5_data_5_mux_9_OUT_3_1 : X_LUT6
    generic map(
      LOC => "SLICE_X9Y4",
      INIT => X"D2F0F0B4D2F0F0B4"
    )
    port map (
      ADR2 => cntr_count_v(3),
      ADR4 => cntr_count_v(2),
      ADR0 => cntr_count_v(0),
      ADR3 => cntr_count_v(1),
      ADR1 => down_IBUF_0,
      ADR5 => '1',
      O => cntr_count_v_5_data_5_mux_9_OUT_3_1_181
    );
  Reset_OR_DriverANDClockEnable_SW1 : X_LUT5
    generic map(
      LOC => "SLICE_X9Y4",
      INIT => X"AA00AA00"
    )
    port map (
      ADR2 => '1',
      ADR1 => '1',
      ADR0 => cntr_count_v(0),
      ADR3 => cntr_count_v(1),
      ADR4 => '1',
      O => N4
    );
  Reset_OR_DriverANDClockEnable_SW0 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y4",
      INIT => X"000C000000000000"
    )
    port map (
      ADR0 => '1',
      ADR5 => cten_IBUF_0,
      ADR3 => down_IBUF_0,
      ADR2 => ld_IBUF_0,
      ADR1 => cntr_count_v(4),
      ADR4 => cntr_count_v(3),
      O => N01
    );
  cntr_count_v_5_data_5_mux_9_OUT_2_1 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y4",
      INIT => X"AAAA9999AAAA9998"
    )
    port map (
      ADR2 => cntr_count_v(5),
      ADR3 => cntr_count_v(4),
      ADR5 => cntr_count_v(3),
      ADR0 => cntr_count_v(2),
      ADR4 => cntr_count_v(1),
      ADR1 => cntr_count_v(0),
      O => cntr_count_v_5_data_5_mux_9_OUT_2_1_206
    );
  Reset_OR_DriverANDClockEnable : X_LUT6
    generic map(
      LOC => "SLICE_X10Y4",
      INIT => X"F8F8F8F8F8F0F0F0"
    )
    port map (
      ADR2 => rst_IBUF_0,
      ADR1 => cntr_count_v(5),
      ADR5 => cntr_count_v(2),
      ADR3 => cntr_count_v(1),
      ADR4 => cntr_count_v(0),
      ADR0 => N01,
      O => Reset_OR_DriverANDClockEnable_203
    );
  cntr_count_v_5 : X_FF
    generic map(
      LOC => "SLICE_X10Y4",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_cntr_count_v_5_CLK,
      I => cntr_count_v_5_glue_rst_101,
      O => cntr_count_v(5),
      SET => GND,
      RST => GND
    );
  cntr_count_v_5_glue_rst : X_LUT6
    generic map(
      LOC => "SLICE_X10Y4",
      INIT => X"0000A3AF0000ACA0"
    )
    port map (
      ADR0 => data_5_IBUF_0,
      ADR3 => cten_IBUF_0,
      ADR2 => ld_IBUF_0,
      ADR5 => cntr_count_v(5),
      ADR1 => N2,
      ADR4 => Reset_OR_DriverANDClockEnable_203,
      O => cntr_count_v_5_glue_rst_101
    );
  cntr_count_v_4 : X_FF
    generic map(
      LOC => "SLICE_X11Y4",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_cntr_count_v_4_CLK,
      I => cntr_count_v_4_glue_rst_117,
      O => cntr_count_v(4),
      SET => GND,
      RST => GND
    );
  cntr_count_v_4_glue_rst : X_LUT6
    generic map(
      LOC => "SLICE_X11Y4",
      INIT => X"00F500B100E400A0"
    )
    port map (
      ADR2 => data_4_IBUF_0,
      ADR1 => cten_IBUF_0,
      ADR0 => ld_IBUF_0,
      ADR5 => cntr_count_v(4),
      ADR4 => cntr_count_v_5_data_5_mux_9_OUT_4_1_204,
      ADR3 => Reset_OR_DriverANDClockEnable_203,
      O => cntr_count_v_4_glue_rst_117
    );
  cntr_count_v_3 : X_FF
    generic map(
      LOC => "SLICE_X11Y4",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_cntr_count_v_3_CLK,
      I => cntr_count_v_3_glue_rst_126,
      O => cntr_count_v(3),
      SET => GND,
      RST => GND
    );
  cntr_count_v_3_glue_rst : X_LUT6
    generic map(
      LOC => "SLICE_X11Y4",
      INIT => X"00000000E2F3E2C0"
    )
    port map (
      ADR2 => data_3_IBUF_0,
      ADR3 => cten_IBUF_0,
      ADR1 => ld_IBUF_0,
      ADR4 => cntr_count_v(3),
      ADR0 => cntr_count_v_5_data_5_mux_9_OUT_3_1_181,
      ADR5 => Reset_OR_DriverANDClockEnable_203,
      O => cntr_count_v_3_glue_rst_126
    );
  cntr_count_v_5_data_5_mux_9_OUT_2_3 : X_LUT6
    generic map(
      LOC => "SLICE_X11Y4",
      INIT => X"FF0FFA0AF505F000"
    )
    port map (
      ADR1 => '1',
      ADR3 => data_2_IBUF_0,
      ADR0 => down_IBUF_0,
      ADR2 => ld_IBUF_0,
      ADR4 => cntr_count_v_5_data_5_mux_9_OUT_2_2_207,
      ADR5 => cntr_count_v_5_data_5_mux_9_OUT_2_1_206,
      O => cntr_count_v_5_data_5_mux_9_OUT_2_Q
    );
  cntr_count_v_2 : X_FF
    generic map(
      LOC => "SLICE_X11Y4",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_cntr_count_v_2_CLK,
      I => cntr_count_v_2_rstpot_140,
      O => cntr_count_v(2),
      RST => GND,
      SET => GND
    );
  cntr_count_v_2_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X11Y4",
      INIT => X"5555001155440000"
    )
    port map (
      ADR2 => '1',
      ADR0 => Reset_OR_DriverANDClockEnable_203,
      ADR4 => cntr_count_v_5_data_5_mux_9_OUT_2_Q,
      ADR5 => cntr_count_v(2),
      ADR3 => ld_IBUF_0,
      ADR1 => cten_IBUF_0,
      O => cntr_count_v_2_rstpot_140
    );
  cntr_count_v_5_data_5_mux_9_OUT_5_SW0 : X_LUT6
    generic map(
      LOC => "SLICE_X12Y4",
      INIT => X"0000000180000000"
    )
    port map (
      ADR5 => down_IBUF_0,
      ADR3 => cntr_count_v(4),
      ADR2 => cntr_count_v(3),
      ADR4 => cntr_count_v(2),
      ADR0 => cntr_count_v(1),
      ADR1 => cntr_count_v(0),
      O => N2
    );
  cntr_count_v_5_data_5_mux_9_OUT_2_2 : X_LUT6
    generic map(
      LOC => "SLICE_X13Y4",
      INIT => X"0F0FF0F0FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => '1',
      ADR4 => cntr_count_v(2),
      ADR2 => cntr_count_v(1),
      ADR5 => cntr_count_v(0),
      O => cntr_count_v_5_data_5_mux_9_OUT_2_2_207
    );
  cntr_count_v_5_data_5_mux_9_OUT_4_1 : X_LUT6
    generic map(
      LOC => "SLICE_X13Y4",
      INIT => X"DF20FF00FF00FB04"
    )
    port map (
      ADR1 => down_IBUF_0,
      ADR3 => cntr_count_v(4),
      ADR0 => cntr_count_v(3),
      ADR4 => cntr_count_v(2),
      ADR2 => cntr_count_v(1),
      ADR5 => cntr_count_v(0),
      O => cntr_count_v_5_data_5_mux_9_OUT_4_1_204
    );
  NlwBufferBlock_count_0_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => cntr_count_v(0),
      O => NlwBufferSignal_count_0_OBUF_I
    );
  NlwBufferBlock_count_1_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => cntr_count_v(1),
      O => NlwBufferSignal_count_1_OBUF_I
    );
  NlwBufferBlock_count_2_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => cntr_count_v(2),
      O => NlwBufferSignal_count_2_OBUF_I
    );
  NlwBufferBlock_count_3_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => cntr_count_v(3),
      O => NlwBufferSignal_count_3_OBUF_I
    );
  NlwBufferBlock_count_4_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => cntr_count_v(4),
      O => NlwBufferSignal_count_4_OBUF_I
    );
  NlwBufferBlock_count_5_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => cntr_count_v(5),
      O => NlwBufferSignal_count_5_OBUF_I
    );
  NlwBufferBlock_clk_BUFGP_BUFG_IN : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP_IBUFG_0,
      O => NlwBufferSignal_clk_BUFGP_BUFG_IN
    );
  NlwBufferBlock_cntr_count_v_1_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_cntr_count_v_1_CLK
    );
  NlwBufferBlock_cntr_count_v_0_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_cntr_count_v_0_CLK
    );
  NlwBufferBlock_cntr_count_v_5_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_cntr_count_v_5_CLK
    );
  NlwBufferBlock_cntr_count_v_4_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_cntr_count_v_4_CLK
    );
  NlwBufferBlock_cntr_count_v_3_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_cntr_count_v_3_CLK
    );
  NlwBufferBlock_cntr_count_v_2_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_cntr_count_v_2_CLK
    );
  NlwBlock_counter_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlock_counter_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

