--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.49d
--  \   \         Application: netgen
--  /   /         Filename: bcd_7seg_timesim.vhd
-- /___/   /\     Timestamp: Tue Oct 28 15:22:38 2014
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 3 -pcf bcd_7seg.pcf -rpw 100 -tpw 0 -ar Structure -tm bcd_7seg -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim bcd_7seg.ncd bcd_7seg_timesim.vhd 
-- Device	: 6slx16csg324-3 (PRODUCTION 1.23 2012-12-04)
-- Input file	: bcd_7seg.ncd
-- Output file	: C:\Users\seb\Google Drive\UA\S-Elektronica 1\digitale technieken\practicum\Klok\netgen\par\bcd_7seg_timesim.vhd
-- # of Entities	: 1
-- Design Name	: bcd_7seg
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

entity bcd_7seg is
  port (
    clk : in STD_LOGIC := 'X'; 
    bcd : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
    segment7 : out STD_LOGIC_VECTOR ( 6 downto 0 ) 
  );
end bcd_7seg;

architecture Structure of bcd_7seg is
  signal Mram_bcd_3_PWR_5_o_wide_mux_0_OUT1 : STD_LOGIC; 
  signal bcd_1_IBUF_0 : STD_LOGIC; 
  signal bcd_0_IBUF_0 : STD_LOGIC; 
  signal bcd_2_IBUF_0 : STD_LOGIC; 
  signal bcd_3_IBUF_0 : STD_LOGIC; 
  signal Mram_bcd_3_PWR_5_o_wide_mux_0_OUT6_0 : STD_LOGIC; 
  signal Mram_bcd_3_PWR_5_o_wide_mux_0_OUT : STD_LOGIC; 
  signal Mram_bcd_3_PWR_5_o_wide_mux_0_OUT4_0 : STD_LOGIC; 
  signal Mram_bcd_3_PWR_5_o_wide_mux_0_OUT5 : STD_LOGIC; 
  signal Mram_bcd_3_PWR_5_o_wide_mux_0_OUT3_0 : STD_LOGIC; 
  signal clk_BUFGP_IBUFG_0 : STD_LOGIC; 
  signal segment7_0_102 : STD_LOGIC; 
  signal segment7_1_103 : STD_LOGIC; 
  signal segment7_2_104 : STD_LOGIC; 
  signal segment7_3_105 : STD_LOGIC; 
  signal segment7_4_106 : STD_LOGIC; 
  signal segment7_5_107 : STD_LOGIC; 
  signal segment7_6_108 : STD_LOGIC; 
  signal clk_BUFGP : STD_LOGIC; 
  signal Mram_bcd_3_PWR_5_o_wide_mux_0_OUT2 : STD_LOGIC; 
  signal clk_BUFGP_IBUFG_1 : STD_LOGIC; 
  signal bcd_0_IBUF_4 : STD_LOGIC; 
  signal bcd_1_IBUF_7 : STD_LOGIC; 
  signal bcd_2_IBUF_10 : STD_LOGIC; 
  signal bcd_3_IBUF_13 : STD_LOGIC; 
  signal Mram_bcd_3_PWR_5_o_wide_mux_0_OUT6 : STD_LOGIC; 
  signal Mram_bcd_3_PWR_5_o_wide_mux_0_OUT4 : STD_LOGIC; 
  signal Mram_bcd_3_PWR_5_o_wide_mux_0_OUT3 : STD_LOGIC; 
  signal NlwBufferSignal_segment7_0_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_segment7_1_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_segment7_2_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_segment7_3_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_segment7_4_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_segment7_5_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_segment7_6_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_segment7_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_segment7_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_segment7_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_segment7_1_IN : STD_LOGIC; 
  signal NlwBufferSignal_segment7_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_segment7_2_IN : STD_LOGIC; 
  signal NlwBufferSignal_segment7_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_segment7_3_IN : STD_LOGIC; 
  signal NlwBufferSignal_segment7_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_segment7_4_IN : STD_LOGIC; 
  signal NlwBufferSignal_segment7_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_segment7_5_IN : STD_LOGIC; 
  signal NlwBufferSignal_segment7_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_segment7_6_IN : STD_LOGIC; 
  signal NlwBufferSignal_clk_BUFGP_BUFG_IN : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
begin
  clk_BUFGP_IBUFG : X_BUF
    generic map(
      LOC => "PAD216",
      PATHPULSE => 202 ps
    )
    port map (
      O => clk_BUFGP_IBUFG_1,
      I => clk
    );
  ProtoComp3_IMUX : X_BUF
    generic map(
      LOC => "PAD216",
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP_IBUFG_1,
      O => clk_BUFGP_IBUFG_0
    );
  bcd_0_IBUF : X_BUF
    generic map(
      LOC => "PAD157",
      PATHPULSE => 202 ps
    )
    port map (
      O => bcd_0_IBUF_4,
      I => bcd(0)
    );
  ProtoComp3_IMUX_1 : X_BUF
    generic map(
      LOC => "PAD157",
      PATHPULSE => 202 ps
    )
    port map (
      I => bcd_0_IBUF_4,
      O => bcd_0_IBUF_0
    );
  bcd_1_IBUF : X_BUF
    generic map(
      LOC => "PAD158",
      PATHPULSE => 202 ps
    )
    port map (
      O => bcd_1_IBUF_7,
      I => bcd(1)
    );
  ProtoComp3_IMUX_2 : X_BUF
    generic map(
      LOC => "PAD158",
      PATHPULSE => 202 ps
    )
    port map (
      I => bcd_1_IBUF_7,
      O => bcd_1_IBUF_0
    );
  bcd_2_IBUF : X_BUF
    generic map(
      LOC => "PAD159",
      PATHPULSE => 202 ps
    )
    port map (
      O => bcd_2_IBUF_10,
      I => bcd(2)
    );
  ProtoComp3_IMUX_3 : X_BUF
    generic map(
      LOC => "PAD159",
      PATHPULSE => 202 ps
    )
    port map (
      I => bcd_2_IBUF_10,
      O => bcd_2_IBUF_0
    );
  bcd_3_IBUF : X_BUF
    generic map(
      LOC => "PAD160",
      PATHPULSE => 202 ps
    )
    port map (
      O => bcd_3_IBUF_13,
      I => bcd(3)
    );
  ProtoComp3_IMUX_4 : X_BUF
    generic map(
      LOC => "PAD160",
      PATHPULSE => 202 ps
    )
    port map (
      I => bcd_3_IBUF_13,
      O => bcd_3_IBUF_0
    );
  segment7_0_OBUF : X_OBUF
    generic map(
      LOC => "PAD161"
    )
    port map (
      I => NlwBufferSignal_segment7_0_OBUF_I,
      O => segment7(0)
    );
  segment7_1_OBUF : X_OBUF
    generic map(
      LOC => "PAD162"
    )
    port map (
      I => NlwBufferSignal_segment7_1_OBUF_I,
      O => segment7(1)
    );
  segment7_2_OBUF : X_OBUF
    generic map(
      LOC => "PAD163"
    )
    port map (
      I => NlwBufferSignal_segment7_2_OBUF_I,
      O => segment7(2)
    );
  segment7_3_OBUF : X_OBUF
    generic map(
      LOC => "PAD164"
    )
    port map (
      I => NlwBufferSignal_segment7_3_OBUF_I,
      O => segment7(3)
    );
  segment7_4_OBUF : X_OBUF
    generic map(
      LOC => "PAD167"
    )
    port map (
      I => NlwBufferSignal_segment7_4_OBUF_I,
      O => segment7(4)
    );
  segment7_5_OBUF : X_OBUF
    generic map(
      LOC => "PAD168"
    )
    port map (
      I => NlwBufferSignal_segment7_5_OBUF_I,
      O => segment7(5)
    );
  segment7_6_OBUF : X_OBUF
    generic map(
      LOC => "PAD169"
    )
    port map (
      I => NlwBufferSignal_segment7_6_OBUF_I,
      O => segment7(6)
    );
  segment7_0 : X_SFF
    generic map(
      LOC => "OLOGIC_X7Y1",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_segment7_0_CLK,
      I => NlwBufferSignal_segment7_0_IN,
      O => segment7_0_102,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => GND
    );
  segment7_1 : X_SFF
    generic map(
      LOC => "OLOGIC_X7Y0",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_segment7_1_CLK,
      I => NlwBufferSignal_segment7_1_IN,
      O => segment7_1_103,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => GND
    );
  segment7_2 : X_SFF
    generic map(
      LOC => "OLOGIC_X7Y3",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_segment7_2_CLK,
      I => NlwBufferSignal_segment7_2_IN,
      O => segment7_2_104,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => GND
    );
  segment7_3 : X_SFF
    generic map(
      LOC => "OLOGIC_X7Y2",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_segment7_3_CLK,
      I => NlwBufferSignal_segment7_3_IN,
      O => segment7_3_105,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => GND
    );
  segment7_4 : X_SFF
    generic map(
      LOC => "OLOGIC_X6Y3",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_segment7_4_CLK,
      I => NlwBufferSignal_segment7_4_IN,
      O => segment7_4_106,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => GND
    );
  segment7_5 : X_SFF
    generic map(
      LOC => "OLOGIC_X6Y2",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_segment7_5_CLK,
      I => NlwBufferSignal_segment7_5_IN,
      O => segment7_5_107,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => GND
    );
  segment7_6 : X_SFF
    generic map(
      LOC => "OLOGIC_X5Y1",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_segment7_6_CLK,
      I => NlwBufferSignal_segment7_6_IN,
      O => segment7_6_108,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => GND
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
  Mram_bcd_3_PWR_5_o_wide_mux_0_OUT1_Mram_bcd_3_PWR_5_o_wide_mux_0_OUT1_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT6,
      O => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT6_0
    );
  Mram_bcd_3_PWR_5_o_wide_mux_0_OUT111 : X_LUT6
    generic map(
      LOC => "SLICE_X13Y0",
      INIT => X"FCCFFC0CFCCFFC0C"
    )
    port map (
      ADR0 => '1',
      ADR1 => bcd_1_IBUF_0,
      ADR4 => bcd_0_IBUF_0,
      ADR2 => bcd_2_IBUF_0,
      ADR3 => bcd_3_IBUF_0,
      ADR5 => '1',
      O => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT1
    );
  Mram_bcd_3_PWR_5_o_wide_mux_0_OUT61 : X_LUT5
    generic map(
      LOC => "SLICE_X13Y0",
      INIT => X"FC03FC30"
    )
    port map (
      ADR0 => '1',
      ADR1 => bcd_1_IBUF_0,
      ADR4 => bcd_0_IBUF_0,
      ADR2 => bcd_2_IBUF_0,
      ADR3 => bcd_3_IBUF_0,
      O => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT6
    );
  Mram_bcd_3_PWR_5_o_wide_mux_0_OUT_Mram_bcd_3_PWR_5_o_wide_mux_0_OUT_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT4,
      O => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT4_0
    );
  Mram_bcd_3_PWR_5_o_wide_mux_0_OUT_Mram_bcd_3_PWR_5_o_wide_mux_0_OUT_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT3,
      O => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT3_0
    );
  Mram_bcd_3_PWR_5_o_wide_mux_0_OUT11 : X_LUT6
    generic map(
      LOC => "SLICE_X13Y1",
      INIT => X"FAF0A5A5FAF0A5A5"
    )
    port map (
      ADR1 => '1',
      ADR4 => bcd_2_IBUF_0,
      ADR0 => bcd_1_IBUF_0,
      ADR3 => bcd_0_IBUF_0,
      ADR2 => bcd_3_IBUF_0,
      ADR5 => '1',
      O => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT
    );
  Mram_bcd_3_PWR_5_o_wide_mux_0_OUT41 : X_LUT5
    generic map(
      LOC => "SLICE_X13Y1",
      INIT => X"F0F0A0AA"
    )
    port map (
      ADR1 => '1',
      ADR4 => bcd_2_IBUF_0,
      ADR0 => bcd_1_IBUF_0,
      ADR3 => bcd_0_IBUF_0,
      ADR2 => bcd_3_IBUF_0,
      O => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT4
    );
  Mram_bcd_3_PWR_5_o_wide_mux_0_OUT21 : X_LUT6
    generic map(
      LOC => "SLICE_X13Y1",
      INIT => X"FFFFFAFAF5F5F0F0"
    )
    port map (
      ADR3 => '1',
      ADR1 => '1',
      ADR2 => bcd_0_IBUF_0,
      ADR0 => bcd_1_IBUF_0,
      ADR4 => bcd_2_IBUF_0,
      ADR5 => bcd_3_IBUF_0,
      O => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT2
    );
  Mram_bcd_3_PWR_5_o_wide_mux_0_OUT51 : X_LUT6
    generic map(
      LOC => "SLICE_X13Y1",
      INIT => X"FFCC4488FFCC4488"
    )
    port map (
      ADR2 => '1',
      ADR1 => bcd_2_IBUF_0,
      ADR4 => bcd_3_IBUF_0,
      ADR3 => bcd_1_IBUF_0,
      ADR0 => bcd_0_IBUF_0,
      ADR5 => '1',
      O => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT5
    );
  Mram_bcd_3_PWR_5_o_wide_mux_0_OUT31 : X_LUT5
    generic map(
      LOC => "SLICE_X13Y1",
      INIT => X"FFCC8866"
    )
    port map (
      ADR2 => '1',
      ADR1 => bcd_2_IBUF_0,
      ADR4 => bcd_3_IBUF_0,
      ADR3 => bcd_1_IBUF_0,
      ADR0 => bcd_0_IBUF_0,
      O => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT3
    );
  NlwBufferBlock_segment7_0_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => segment7_0_102,
      O => NlwBufferSignal_segment7_0_OBUF_I
    );
  NlwBufferBlock_segment7_1_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => segment7_1_103,
      O => NlwBufferSignal_segment7_1_OBUF_I
    );
  NlwBufferBlock_segment7_2_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => segment7_2_104,
      O => NlwBufferSignal_segment7_2_OBUF_I
    );
  NlwBufferBlock_segment7_3_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => segment7_3_105,
      O => NlwBufferSignal_segment7_3_OBUF_I
    );
  NlwBufferBlock_segment7_4_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => segment7_4_106,
      O => NlwBufferSignal_segment7_4_OBUF_I
    );
  NlwBufferBlock_segment7_5_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => segment7_5_107,
      O => NlwBufferSignal_segment7_5_OBUF_I
    );
  NlwBufferBlock_segment7_6_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => segment7_6_108,
      O => NlwBufferSignal_segment7_6_OBUF_I
    );
  NlwBufferBlock_segment7_0_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_segment7_0_CLK
    );
  NlwBufferBlock_segment7_0_IN : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT,
      O => NlwBufferSignal_segment7_0_IN
    );
  NlwBufferBlock_segment7_1_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_segment7_1_CLK
    );
  NlwBufferBlock_segment7_1_IN : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT1,
      O => NlwBufferSignal_segment7_1_IN
    );
  NlwBufferBlock_segment7_2_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_segment7_2_CLK
    );
  NlwBufferBlock_segment7_2_IN : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT2,
      O => NlwBufferSignal_segment7_2_IN
    );
  NlwBufferBlock_segment7_3_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_segment7_3_CLK
    );
  NlwBufferBlock_segment7_3_IN : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT3_0,
      O => NlwBufferSignal_segment7_3_IN
    );
  NlwBufferBlock_segment7_4_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_segment7_4_CLK
    );
  NlwBufferBlock_segment7_4_IN : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT4_0,
      O => NlwBufferSignal_segment7_4_IN
    );
  NlwBufferBlock_segment7_5_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_segment7_5_CLK
    );
  NlwBufferBlock_segment7_5_IN : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT5,
      O => NlwBufferSignal_segment7_5_IN
    );
  NlwBufferBlock_segment7_6_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_segment7_6_CLK
    );
  NlwBufferBlock_segment7_6_IN : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => Mram_bcd_3_PWR_5_o_wide_mux_0_OUT6_0,
      O => NlwBufferSignal_segment7_6_IN
    );
  NlwBufferBlock_clk_BUFGP_BUFG_IN : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => clk_BUFGP_IBUFG_0,
      O => NlwBufferSignal_clk_BUFGP_BUFG_IN
    );
  NlwBlock_bcd_7seg_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlock_bcd_7seg_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

