----------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 12.1
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2012 Altera Corporation.  All rights reserved.    
-- Your use of  Altera  Corporation's design tools,  logic functions and other 
-- software and tools,  and its AMPP  partner logic functions, and  any output 
-- files  any of the  foregoing  device programming or simulation files),  and 
-- any associated  documentation or information are expressly subject  to  the 
-- terms and conditions  of the Altera Program License Subscription Agreement, 
-- Altera  MegaCore  Function  License  Agreement, or other applicable license 
-- agreement,  including,  without limitation,  that your use  is for the sole 
-- purpose of  programming  logic  devices  manufactured by Altera and sold by 
-- Altera or its authorized  distributors.  Please  refer  to  the  applicable 
-- agreement for further details.
----------------------------------------------------------------------------- 

-- VHDL created from dotProduct64_dut_prim
-- VHDL created on Fri Oct 19 16:38:38 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.hcc_package.all;
use work.math_package.all;
use work.fpc_library_package.all;
use work.dspba_library_package.all;
USE work.dotProduct64_safe_path.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from d:/SJ/nightly/12.1/173/w64/p4/ip/aion/src/mip_common/hw_model.cpp:1240
entity dotProduct64_dut_prim is
    port (
        valid_s : in std_logic_vector(0 downto 0);
        channel_s : in std_logic_vector(7 downto 0);
        datain_a_00 : in std_logic_vector(31 downto 0);
        datain_a_01 : in std_logic_vector(31 downto 0);
        datain_a_02 : in std_logic_vector(31 downto 0);
        datain_a_03 : in std_logic_vector(31 downto 0);
        datain_a_04 : in std_logic_vector(31 downto 0);
        datain_a_05 : in std_logic_vector(31 downto 0);
        datain_a_06 : in std_logic_vector(31 downto 0);
        datain_a_07 : in std_logic_vector(31 downto 0);
        datain_a_08 : in std_logic_vector(31 downto 0);
        datain_a_09 : in std_logic_vector(31 downto 0);
        datain_a_10 : in std_logic_vector(31 downto 0);
        datain_a_11 : in std_logic_vector(31 downto 0);
        datain_a_12 : in std_logic_vector(31 downto 0);
        datain_a_13 : in std_logic_vector(31 downto 0);
        datain_a_14 : in std_logic_vector(31 downto 0);
        datain_a_15 : in std_logic_vector(31 downto 0);
        datain_a_16 : in std_logic_vector(31 downto 0);
        datain_a_17 : in std_logic_vector(31 downto 0);
        datain_a_18 : in std_logic_vector(31 downto 0);
        datain_a_19 : in std_logic_vector(31 downto 0);
        datain_a_20 : in std_logic_vector(31 downto 0);
        datain_a_21 : in std_logic_vector(31 downto 0);
        datain_a_22 : in std_logic_vector(31 downto 0);
        datain_a_23 : in std_logic_vector(31 downto 0);
        datain_a_24 : in std_logic_vector(31 downto 0);
        datain_a_25 : in std_logic_vector(31 downto 0);
        datain_a_26 : in std_logic_vector(31 downto 0);
        datain_a_27 : in std_logic_vector(31 downto 0);
        datain_a_28 : in std_logic_vector(31 downto 0);
        datain_a_29 : in std_logic_vector(31 downto 0);
        datain_a_30 : in std_logic_vector(31 downto 0);
        datain_a_31 : in std_logic_vector(31 downto 0);
        datain_a_32 : in std_logic_vector(31 downto 0);
        datain_a_33 : in std_logic_vector(31 downto 0);
        datain_a_34 : in std_logic_vector(31 downto 0);
        datain_a_35 : in std_logic_vector(31 downto 0);
        datain_a_36 : in std_logic_vector(31 downto 0);
        datain_a_37 : in std_logic_vector(31 downto 0);
        datain_a_38 : in std_logic_vector(31 downto 0);
        datain_a_39 : in std_logic_vector(31 downto 0);
        datain_a_40 : in std_logic_vector(31 downto 0);
        datain_a_41 : in std_logic_vector(31 downto 0);
        datain_a_42 : in std_logic_vector(31 downto 0);
        datain_a_43 : in std_logic_vector(31 downto 0);
        datain_a_44 : in std_logic_vector(31 downto 0);
        datain_a_45 : in std_logic_vector(31 downto 0);
        datain_a_46 : in std_logic_vector(31 downto 0);
        datain_a_47 : in std_logic_vector(31 downto 0);
        datain_a_48 : in std_logic_vector(31 downto 0);
        datain_a_49 : in std_logic_vector(31 downto 0);
        datain_a_50 : in std_logic_vector(31 downto 0);
        datain_a_51 : in std_logic_vector(31 downto 0);
        datain_a_52 : in std_logic_vector(31 downto 0);
        datain_a_53 : in std_logic_vector(31 downto 0);
        datain_a_54 : in std_logic_vector(31 downto 0);
        datain_a_55 : in std_logic_vector(31 downto 0);
        datain_a_56 : in std_logic_vector(31 downto 0);
        datain_a_57 : in std_logic_vector(31 downto 0);
        datain_a_58 : in std_logic_vector(31 downto 0);
        datain_a_59 : in std_logic_vector(31 downto 0);
        datain_a_60 : in std_logic_vector(31 downto 0);
        datain_a_61 : in std_logic_vector(31 downto 0);
        datain_a_62 : in std_logic_vector(31 downto 0);
        datain_a_63 : in std_logic_vector(31 downto 0);
        datain_b_00 : in std_logic_vector(31 downto 0);
        datain_b_01 : in std_logic_vector(31 downto 0);
        datain_b_02 : in std_logic_vector(31 downto 0);
        datain_b_03 : in std_logic_vector(31 downto 0);
        datain_b_04 : in std_logic_vector(31 downto 0);
        datain_b_05 : in std_logic_vector(31 downto 0);
        datain_b_06 : in std_logic_vector(31 downto 0);
        datain_b_07 : in std_logic_vector(31 downto 0);
        datain_b_08 : in std_logic_vector(31 downto 0);
        datain_b_09 : in std_logic_vector(31 downto 0);
        datain_b_10 : in std_logic_vector(31 downto 0);
        datain_b_11 : in std_logic_vector(31 downto 0);
        datain_b_12 : in std_logic_vector(31 downto 0);
        datain_b_13 : in std_logic_vector(31 downto 0);
        datain_b_14 : in std_logic_vector(31 downto 0);
        datain_b_15 : in std_logic_vector(31 downto 0);
        datain_b_16 : in std_logic_vector(31 downto 0);
        datain_b_17 : in std_logic_vector(31 downto 0);
        datain_b_18 : in std_logic_vector(31 downto 0);
        datain_b_19 : in std_logic_vector(31 downto 0);
        datain_b_20 : in std_logic_vector(31 downto 0);
        datain_b_21 : in std_logic_vector(31 downto 0);
        datain_b_22 : in std_logic_vector(31 downto 0);
        datain_b_23 : in std_logic_vector(31 downto 0);
        datain_b_24 : in std_logic_vector(31 downto 0);
        datain_b_25 : in std_logic_vector(31 downto 0);
        datain_b_26 : in std_logic_vector(31 downto 0);
        datain_b_27 : in std_logic_vector(31 downto 0);
        datain_b_28 : in std_logic_vector(31 downto 0);
        datain_b_29 : in std_logic_vector(31 downto 0);
        datain_b_30 : in std_logic_vector(31 downto 0);
        datain_b_31 : in std_logic_vector(31 downto 0);
        datain_b_32 : in std_logic_vector(31 downto 0);
        datain_b_33 : in std_logic_vector(31 downto 0);
        datain_b_34 : in std_logic_vector(31 downto 0);
        datain_b_35 : in std_logic_vector(31 downto 0);
        datain_b_36 : in std_logic_vector(31 downto 0);
        datain_b_37 : in std_logic_vector(31 downto 0);
        datain_b_38 : in std_logic_vector(31 downto 0);
        datain_b_39 : in std_logic_vector(31 downto 0);
        datain_b_40 : in std_logic_vector(31 downto 0);
        datain_b_41 : in std_logic_vector(31 downto 0);
        datain_b_42 : in std_logic_vector(31 downto 0);
        datain_b_43 : in std_logic_vector(31 downto 0);
        datain_b_44 : in std_logic_vector(31 downto 0);
        datain_b_45 : in std_logic_vector(31 downto 0);
        datain_b_46 : in std_logic_vector(31 downto 0);
        datain_b_47 : in std_logic_vector(31 downto 0);
        datain_b_48 : in std_logic_vector(31 downto 0);
        datain_b_49 : in std_logic_vector(31 downto 0);
        datain_b_50 : in std_logic_vector(31 downto 0);
        datain_b_51 : in std_logic_vector(31 downto 0);
        datain_b_52 : in std_logic_vector(31 downto 0);
        datain_b_53 : in std_logic_vector(31 downto 0);
        datain_b_54 : in std_logic_vector(31 downto 0);
        datain_b_55 : in std_logic_vector(31 downto 0);
        datain_b_56 : in std_logic_vector(31 downto 0);
        datain_b_57 : in std_logic_vector(31 downto 0);
        datain_b_58 : in std_logic_vector(31 downto 0);
        datain_b_59 : in std_logic_vector(31 downto 0);
        datain_b_60 : in std_logic_vector(31 downto 0);
        datain_b_61 : in std_logic_vector(31 downto 0);
        datain_b_62 : in std_logic_vector(31 downto 0);
        datain_b_63 : in std_logic_vector(31 downto 0);
        vout_s : out std_logic_vector(0 downto 0);
        cout_s : out std_logic_vector(7 downto 0);
        dout_s : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        h_areset : in std_logic
        );
end;

architecture normal of dotProduct64_dut_prim is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal VCC_q : std_logic_vector (0 downto 0);
    signal Mult_0_f_reset : std_logic;
    signal Mult_0_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_0_f_a_real : REAL;
    signal Mult_0_f_b_real : REAL;
    signal Mult_0_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_1_f_reset : std_logic;
    signal Mult_1_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_1_f_a_real : REAL;
    signal Mult_1_f_b_real : REAL;
    signal Mult_1_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_2_f_reset : std_logic;
    signal Mult_2_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_2_f_a_real : REAL;
    signal Mult_2_f_b_real : REAL;
    signal Mult_2_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_3_f_reset : std_logic;
    signal Mult_3_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_3_f_a_real : REAL;
    signal Mult_3_f_b_real : REAL;
    signal Mult_3_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_4_f_reset : std_logic;
    signal Mult_4_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_4_f_a_real : REAL;
    signal Mult_4_f_b_real : REAL;
    signal Mult_4_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_5_f_reset : std_logic;
    signal Mult_5_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_5_f_a_real : REAL;
    signal Mult_5_f_b_real : REAL;
    signal Mult_5_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_6_f_reset : std_logic;
    signal Mult_6_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_6_f_a_real : REAL;
    signal Mult_6_f_b_real : REAL;
    signal Mult_6_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_7_f_reset : std_logic;
    signal Mult_7_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_7_f_a_real : REAL;
    signal Mult_7_f_b_real : REAL;
    signal Mult_7_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_8_f_reset : std_logic;
    signal Mult_8_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_8_f_a_real : REAL;
    signal Mult_8_f_b_real : REAL;
    signal Mult_8_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_9_f_reset : std_logic;
    signal Mult_9_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_9_f_a_real : REAL;
    signal Mult_9_f_b_real : REAL;
    signal Mult_9_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_10_f_reset : std_logic;
    signal Mult_10_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_10_f_a_real : REAL;
    signal Mult_10_f_b_real : REAL;
    signal Mult_10_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_11_f_reset : std_logic;
    signal Mult_11_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_11_f_a_real : REAL;
    signal Mult_11_f_b_real : REAL;
    signal Mult_11_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_12_f_reset : std_logic;
    signal Mult_12_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_12_f_a_real : REAL;
    signal Mult_12_f_b_real : REAL;
    signal Mult_12_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_13_f_reset : std_logic;
    signal Mult_13_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_13_f_a_real : REAL;
    signal Mult_13_f_b_real : REAL;
    signal Mult_13_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_14_f_reset : std_logic;
    signal Mult_14_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_14_f_a_real : REAL;
    signal Mult_14_f_b_real : REAL;
    signal Mult_14_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_15_f_reset : std_logic;
    signal Mult_15_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_15_f_a_real : REAL;
    signal Mult_15_f_b_real : REAL;
    signal Mult_15_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_16_f_reset : std_logic;
    signal Mult_16_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_16_f_a_real : REAL;
    signal Mult_16_f_b_real : REAL;
    signal Mult_16_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_17_f_reset : std_logic;
    signal Mult_17_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_17_f_a_real : REAL;
    signal Mult_17_f_b_real : REAL;
    signal Mult_17_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_18_f_reset : std_logic;
    signal Mult_18_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_18_f_a_real : REAL;
    signal Mult_18_f_b_real : REAL;
    signal Mult_18_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_19_f_reset : std_logic;
    signal Mult_19_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_19_f_a_real : REAL;
    signal Mult_19_f_b_real : REAL;
    signal Mult_19_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_20_f_reset : std_logic;
    signal Mult_20_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_20_f_a_real : REAL;
    signal Mult_20_f_b_real : REAL;
    signal Mult_20_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_21_f_reset : std_logic;
    signal Mult_21_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_21_f_a_real : REAL;
    signal Mult_21_f_b_real : REAL;
    signal Mult_21_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_22_f_reset : std_logic;
    signal Mult_22_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_22_f_a_real : REAL;
    signal Mult_22_f_b_real : REAL;
    signal Mult_22_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_23_f_reset : std_logic;
    signal Mult_23_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_23_f_a_real : REAL;
    signal Mult_23_f_b_real : REAL;
    signal Mult_23_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_24_f_reset : std_logic;
    signal Mult_24_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_24_f_a_real : REAL;
    signal Mult_24_f_b_real : REAL;
    signal Mult_24_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_25_f_reset : std_logic;
    signal Mult_25_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_25_f_a_real : REAL;
    signal Mult_25_f_b_real : REAL;
    signal Mult_25_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_26_f_reset : std_logic;
    signal Mult_26_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_26_f_a_real : REAL;
    signal Mult_26_f_b_real : REAL;
    signal Mult_26_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_27_f_reset : std_logic;
    signal Mult_27_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_27_f_a_real : REAL;
    signal Mult_27_f_b_real : REAL;
    signal Mult_27_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_28_f_reset : std_logic;
    signal Mult_28_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_28_f_a_real : REAL;
    signal Mult_28_f_b_real : REAL;
    signal Mult_28_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_29_f_reset : std_logic;
    signal Mult_29_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_29_f_a_real : REAL;
    signal Mult_29_f_b_real : REAL;
    signal Mult_29_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_30_f_reset : std_logic;
    signal Mult_30_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_30_f_a_real : REAL;
    signal Mult_30_f_b_real : REAL;
    signal Mult_30_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_31_f_reset : std_logic;
    signal Mult_31_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_31_f_a_real : REAL;
    signal Mult_31_f_b_real : REAL;
    signal Mult_31_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_32_f_reset : std_logic;
    signal Mult_32_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_32_f_a_real : REAL;
    signal Mult_32_f_b_real : REAL;
    signal Mult_32_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_33_f_reset : std_logic;
    signal Mult_33_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_33_f_a_real : REAL;
    signal Mult_33_f_b_real : REAL;
    signal Mult_33_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_34_f_reset : std_logic;
    signal Mult_34_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_34_f_a_real : REAL;
    signal Mult_34_f_b_real : REAL;
    signal Mult_34_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_35_f_reset : std_logic;
    signal Mult_35_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_35_f_a_real : REAL;
    signal Mult_35_f_b_real : REAL;
    signal Mult_35_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_36_f_reset : std_logic;
    signal Mult_36_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_36_f_a_real : REAL;
    signal Mult_36_f_b_real : REAL;
    signal Mult_36_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_37_f_reset : std_logic;
    signal Mult_37_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_37_f_a_real : REAL;
    signal Mult_37_f_b_real : REAL;
    signal Mult_37_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_38_f_reset : std_logic;
    signal Mult_38_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_38_f_a_real : REAL;
    signal Mult_38_f_b_real : REAL;
    signal Mult_38_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_39_f_reset : std_logic;
    signal Mult_39_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_39_f_a_real : REAL;
    signal Mult_39_f_b_real : REAL;
    signal Mult_39_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_40_f_reset : std_logic;
    signal Mult_40_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_40_f_a_real : REAL;
    signal Mult_40_f_b_real : REAL;
    signal Mult_40_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_41_f_reset : std_logic;
    signal Mult_41_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_41_f_a_real : REAL;
    signal Mult_41_f_b_real : REAL;
    signal Mult_41_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_42_f_reset : std_logic;
    signal Mult_42_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_42_f_a_real : REAL;
    signal Mult_42_f_b_real : REAL;
    signal Mult_42_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_43_f_reset : std_logic;
    signal Mult_43_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_43_f_a_real : REAL;
    signal Mult_43_f_b_real : REAL;
    signal Mult_43_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_44_f_reset : std_logic;
    signal Mult_44_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_44_f_a_real : REAL;
    signal Mult_44_f_b_real : REAL;
    signal Mult_44_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_45_f_reset : std_logic;
    signal Mult_45_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_45_f_a_real : REAL;
    signal Mult_45_f_b_real : REAL;
    signal Mult_45_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_46_f_reset : std_logic;
    signal Mult_46_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_46_f_a_real : REAL;
    signal Mult_46_f_b_real : REAL;
    signal Mult_46_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_47_f_reset : std_logic;
    signal Mult_47_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_47_f_a_real : REAL;
    signal Mult_47_f_b_real : REAL;
    signal Mult_47_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_48_f_reset : std_logic;
    signal Mult_48_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_48_f_a_real : REAL;
    signal Mult_48_f_b_real : REAL;
    signal Mult_48_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_49_f_reset : std_logic;
    signal Mult_49_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_49_f_a_real : REAL;
    signal Mult_49_f_b_real : REAL;
    signal Mult_49_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_50_f_reset : std_logic;
    signal Mult_50_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_50_f_a_real : REAL;
    signal Mult_50_f_b_real : REAL;
    signal Mult_50_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_51_f_reset : std_logic;
    signal Mult_51_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_51_f_a_real : REAL;
    signal Mult_51_f_b_real : REAL;
    signal Mult_51_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_52_f_reset : std_logic;
    signal Mult_52_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_52_f_a_real : REAL;
    signal Mult_52_f_b_real : REAL;
    signal Mult_52_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_53_f_reset : std_logic;
    signal Mult_53_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_53_f_a_real : REAL;
    signal Mult_53_f_b_real : REAL;
    signal Mult_53_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_54_f_reset : std_logic;
    signal Mult_54_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_54_f_a_real : REAL;
    signal Mult_54_f_b_real : REAL;
    signal Mult_54_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_55_f_reset : std_logic;
    signal Mult_55_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_55_f_a_real : REAL;
    signal Mult_55_f_b_real : REAL;
    signal Mult_55_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_56_f_reset : std_logic;
    signal Mult_56_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_56_f_a_real : REAL;
    signal Mult_56_f_b_real : REAL;
    signal Mult_56_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_57_f_reset : std_logic;
    signal Mult_57_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_57_f_a_real : REAL;
    signal Mult_57_f_b_real : REAL;
    signal Mult_57_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_58_f_reset : std_logic;
    signal Mult_58_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_58_f_a_real : REAL;
    signal Mult_58_f_b_real : REAL;
    signal Mult_58_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_59_f_reset : std_logic;
    signal Mult_59_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_59_f_a_real : REAL;
    signal Mult_59_f_b_real : REAL;
    signal Mult_59_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_60_f_reset : std_logic;
    signal Mult_60_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_60_f_a_real : REAL;
    signal Mult_60_f_b_real : REAL;
    signal Mult_60_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_61_f_reset : std_logic;
    signal Mult_61_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_61_f_a_real : REAL;
    signal Mult_61_f_b_real : REAL;
    signal Mult_61_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_62_f_reset : std_logic;
    signal Mult_62_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_62_f_a_real : REAL;
    signal Mult_62_f_b_real : REAL;
    signal Mult_62_f_q_real : REAL;
    -- synopsys translate on
    signal Mult_63_f_reset : std_logic;
    signal Mult_63_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal Mult_63_f_a_real : REAL;
    signal Mult_63_f_b_real : REAL;
    signal Mult_63_f_q_real : REAL;
    -- synopsys translate on
    signal ChannelOut_2_cast_reset : std_logic;
    signal ChannelOut_2_cast_a : std_logic_vector (44 downto 0);
    signal ChannelOut_2_cast_q : std_logic_vector (31 downto 0);
    -- synopsys translate off
    signal ChannelOut_2_cast_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_0_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_0_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_0_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_0_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_0_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_0_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_0_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_0_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_1_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_1_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_1_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_1_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_1_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_1_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_1_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_1_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_2_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_2_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_2_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_2_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_2_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_2_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_2_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_2_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_3_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_3_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_3_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_3_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_3_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_3_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_3_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_3_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_4_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_4_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_4_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_4_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_4_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_4_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_4_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_4_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_5_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_5_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_5_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_5_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_5_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_5_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_5_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_5_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_6_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_6_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_6_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_6_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_6_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_6_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_6_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_6_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_7_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_7_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_7_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_7_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_7_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_7_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_7_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_7_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_8_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_8_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_8_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_8_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_8_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_8_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_8_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_8_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_9_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_9_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_9_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_9_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_9_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_9_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_9_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_9_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_10_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_10_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_10_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_10_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_10_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_10_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_10_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_10_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_11_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_11_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_11_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_11_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_11_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_11_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_11_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_11_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_12_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_12_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_12_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_12_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_12_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_12_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_12_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_12_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_13_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_13_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_13_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_13_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_13_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_13_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_13_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_13_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_14_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_14_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_14_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_14_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_14_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_14_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_14_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_14_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_15_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_15_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_15_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_15_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_15_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_15_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_15_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_15_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_16_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_16_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_16_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_16_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_16_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_16_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_16_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_16_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_17_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_17_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_17_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_17_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_17_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_17_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_17_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_17_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_18_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_18_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_18_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_18_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_18_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_18_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_18_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_18_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_19_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_19_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_19_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_19_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_19_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_19_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_19_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_19_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_20_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_20_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_20_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_20_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_20_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_20_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_20_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_20_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_21_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_21_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_21_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_21_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_21_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_21_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_21_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_21_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_22_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_22_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_22_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_22_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_22_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_22_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_22_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_22_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_23_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_23_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_23_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_23_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_23_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_23_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_23_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_23_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_24_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_24_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_24_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_24_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_24_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_24_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_24_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_24_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_25_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_25_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_25_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_25_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_25_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_25_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_25_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_25_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_26_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_26_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_26_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_26_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_26_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_26_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_26_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_26_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_27_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_27_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_27_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_27_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_27_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_27_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_27_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_27_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_28_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_28_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_28_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_28_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_28_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_28_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_28_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_28_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_29_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_29_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_29_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_29_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_29_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_29_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_29_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_29_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_30_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_30_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_30_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_30_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_30_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_30_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_30_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_30_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_31_f_reset : std_logic;
    signal SumOfElements_0_0_add_0_31_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_31_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_0_31_f_a_real : REAL;
    signal SumOfElements_0_0_add_0_31_f_b_real : REAL;
    signal SumOfElements_0_0_add_0_31_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_0_31_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_0_31_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_0_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_0_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_0_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_0_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_0_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_0_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_0_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_0_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_1_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_1_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_1_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_1_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_1_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_1_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_1_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_1_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_2_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_2_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_2_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_2_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_2_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_2_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_2_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_2_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_3_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_3_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_3_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_3_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_3_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_3_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_3_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_3_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_4_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_4_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_4_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_4_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_4_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_4_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_4_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_4_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_5_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_5_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_5_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_5_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_5_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_5_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_5_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_5_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_6_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_6_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_6_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_6_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_6_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_6_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_6_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_6_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_7_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_7_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_7_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_7_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_7_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_7_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_7_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_7_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_8_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_8_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_8_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_8_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_8_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_8_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_8_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_8_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_9_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_9_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_9_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_9_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_9_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_9_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_9_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_9_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_10_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_10_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_10_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_10_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_10_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_10_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_10_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_10_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_11_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_11_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_11_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_11_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_11_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_11_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_11_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_11_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_12_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_12_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_12_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_12_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_12_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_12_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_12_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_12_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_13_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_13_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_13_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_13_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_13_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_13_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_13_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_13_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_14_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_14_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_14_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_14_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_14_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_14_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_14_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_14_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_15_f_reset : std_logic;
    signal SumOfElements_0_0_add_1_15_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_15_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_1_15_f_a_real : REAL;
    signal SumOfElements_0_0_add_1_15_f_b_real : REAL;
    signal SumOfElements_0_0_add_1_15_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_1_15_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_1_15_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_0_f_reset : std_logic;
    signal SumOfElements_0_0_add_2_0_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_0_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_2_0_f_a_real : REAL;
    signal SumOfElements_0_0_add_2_0_f_b_real : REAL;
    signal SumOfElements_0_0_add_2_0_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_2_0_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_0_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_1_f_reset : std_logic;
    signal SumOfElements_0_0_add_2_1_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_1_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_2_1_f_a_real : REAL;
    signal SumOfElements_0_0_add_2_1_f_b_real : REAL;
    signal SumOfElements_0_0_add_2_1_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_2_1_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_1_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_2_f_reset : std_logic;
    signal SumOfElements_0_0_add_2_2_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_2_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_2_2_f_a_real : REAL;
    signal SumOfElements_0_0_add_2_2_f_b_real : REAL;
    signal SumOfElements_0_0_add_2_2_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_2_2_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_2_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_3_f_reset : std_logic;
    signal SumOfElements_0_0_add_2_3_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_3_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_2_3_f_a_real : REAL;
    signal SumOfElements_0_0_add_2_3_f_b_real : REAL;
    signal SumOfElements_0_0_add_2_3_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_2_3_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_3_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_4_f_reset : std_logic;
    signal SumOfElements_0_0_add_2_4_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_4_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_2_4_f_a_real : REAL;
    signal SumOfElements_0_0_add_2_4_f_b_real : REAL;
    signal SumOfElements_0_0_add_2_4_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_2_4_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_4_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_5_f_reset : std_logic;
    signal SumOfElements_0_0_add_2_5_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_5_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_2_5_f_a_real : REAL;
    signal SumOfElements_0_0_add_2_5_f_b_real : REAL;
    signal SumOfElements_0_0_add_2_5_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_2_5_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_5_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_6_f_reset : std_logic;
    signal SumOfElements_0_0_add_2_6_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_6_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_2_6_f_a_real : REAL;
    signal SumOfElements_0_0_add_2_6_f_b_real : REAL;
    signal SumOfElements_0_0_add_2_6_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_2_6_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_6_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_7_f_reset : std_logic;
    signal SumOfElements_0_0_add_2_7_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_7_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_2_7_f_a_real : REAL;
    signal SumOfElements_0_0_add_2_7_f_b_real : REAL;
    signal SumOfElements_0_0_add_2_7_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_2_7_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_2_7_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_3_0_f_reset : std_logic;
    signal SumOfElements_0_0_add_3_0_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_3_0_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_3_0_f_a_real : REAL;
    signal SumOfElements_0_0_add_3_0_f_b_real : REAL;
    signal SumOfElements_0_0_add_3_0_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_3_0_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_3_0_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_3_1_f_reset : std_logic;
    signal SumOfElements_0_0_add_3_1_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_3_1_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_3_1_f_a_real : REAL;
    signal SumOfElements_0_0_add_3_1_f_b_real : REAL;
    signal SumOfElements_0_0_add_3_1_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_3_1_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_3_1_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_3_2_f_reset : std_logic;
    signal SumOfElements_0_0_add_3_2_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_3_2_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_3_2_f_a_real : REAL;
    signal SumOfElements_0_0_add_3_2_f_b_real : REAL;
    signal SumOfElements_0_0_add_3_2_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_3_2_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_3_2_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_3_3_f_reset : std_logic;
    signal SumOfElements_0_0_add_3_3_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_3_3_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_3_3_f_a_real : REAL;
    signal SumOfElements_0_0_add_3_3_f_b_real : REAL;
    signal SumOfElements_0_0_add_3_3_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_3_3_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_3_3_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_4_0_f_reset : std_logic;
    signal SumOfElements_0_0_add_4_0_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_4_0_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_4_0_f_a_real : REAL;
    signal SumOfElements_0_0_add_4_0_f_b_real : REAL;
    signal SumOfElements_0_0_add_4_0_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_4_0_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_4_0_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_4_1_f_reset : std_logic;
    signal SumOfElements_0_0_add_4_1_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_4_1_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_4_1_f_a_real : REAL;
    signal SumOfElements_0_0_add_4_1_f_b_real : REAL;
    signal SumOfElements_0_0_add_4_1_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_4_1_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_4_1_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_5_0_f_reset : std_logic;
    signal SumOfElements_0_0_add_5_0_f_add_sub : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_5_0_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_5_0_f_a_real : REAL;
    signal SumOfElements_0_0_add_5_0_f_b_real : REAL;
    signal SumOfElements_0_0_add_5_0_f_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_5_0_f_p : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_5_0_f_n : std_logic_vector (0 downto 0);
    signal SumOfElements_0_0_add_3_1_f_0_norm_SumOfElements_0_0_add_4_0_f_1_reset : std_logic;
    signal SumOfElements_0_0_add_3_1_f_0_norm_SumOfElements_0_0_add_4_0_f_1_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_3_1_f_0_norm_SumOfElements_0_0_add_4_0_f_1_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_3_0_f_0_norm_SumOfElements_0_0_add_4_0_f_0_reset : std_logic;
    signal SumOfElements_0_0_add_3_0_f_0_norm_SumOfElements_0_0_add_4_0_f_0_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_3_0_f_0_norm_SumOfElements_0_0_add_4_0_f_0_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_3_3_f_0_norm_SumOfElements_0_0_add_4_1_f_1_reset : std_logic;
    signal SumOfElements_0_0_add_3_3_f_0_norm_SumOfElements_0_0_add_4_1_f_1_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_3_3_f_0_norm_SumOfElements_0_0_add_4_1_f_1_q_real : REAL;
    -- synopsys translate on
    signal SumOfElements_0_0_add_3_2_f_0_norm_SumOfElements_0_0_add_4_1_f_0_reset : std_logic;
    signal SumOfElements_0_0_add_3_2_f_0_norm_SumOfElements_0_0_add_4_1_f_0_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal SumOfElements_0_0_add_3_2_f_0_norm_SumOfElements_0_0_add_4_1_f_0_q_real : REAL;
    -- synopsys translate on
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_reset0 : std_logic;
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_ir : std_logic_vector (0 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_eq : std_logic;
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_reset0 : std_logic;
    signal ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_ir : std_logic_vector (7 downto 0);
    signal ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmp_a : std_logic_vector(6 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmp_b : std_logic_vector(6 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmp_q : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_nor_a : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_nor_b : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_valid_s_to_ChannelOut_vout_s_nor_q : std_logic_vector(0 downto 0);
begin


	--GND(CONSTANT,0)

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ChannelIn(PORTIN,2)@0

	--Mult_63_f(FLOATMULT,265)@0
    Mult_63_f_reset <= areset;
    Mult_63_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_63_f_reset,
    		dataa	 => datain_a_63,
    		datab	 => datain_b_63,
    		result	 => Mult_63_f_q
    	);
    -- synopsys translate off
    Mult_63_f_a_real <= sIEEE_2_real(datain_a_63);
    Mult_63_f_b_real <= sIEEE_2_real(datain_b_63);
    Mult_63_f_q_real <= sInternalSM_2_real(Mult_63_f_q);
    -- synopsys translate on

	--Mult_62_f(FLOATMULT,264)@0
    Mult_62_f_reset <= areset;
    Mult_62_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_62_f_reset,
    		dataa	 => datain_a_62,
    		datab	 => datain_b_62,
    		result	 => Mult_62_f_q
    	);
    -- synopsys translate off
    Mult_62_f_a_real <= sIEEE_2_real(datain_a_62);
    Mult_62_f_b_real <= sIEEE_2_real(datain_b_62);
    Mult_62_f_q_real <= sInternalSM_2_real(Mult_62_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_31_f(FLOATADDSUB,330)@3
    SumOfElements_0_0_add_0_31_f_reset <= areset;
    SumOfElements_0_0_add_0_31_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_31_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_31_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_31_f_reset,
    	dataa	 => Mult_62_f_q,
    	datab	 => Mult_63_f_q,
    	result	 => SumOfElements_0_0_add_0_31_f_q
   	);
    SumOfElements_0_0_add_0_31_f_p <= not SumOfElements_0_0_add_0_31_f_q(41 downto 41);
    SumOfElements_0_0_add_0_31_f_n <= SumOfElements_0_0_add_0_31_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_31_f_a_real <= sInternalSM_2_real(Mult_62_f_q);
    SumOfElements_0_0_add_0_31_f_b_real <= sInternalSM_2_real(Mult_63_f_q);
    SumOfElements_0_0_add_0_31_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_31_f_q);
    -- synopsys translate on

	--Mult_61_f(FLOATMULT,263)@0
    Mult_61_f_reset <= areset;
    Mult_61_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_61_f_reset,
    		dataa	 => datain_a_61,
    		datab	 => datain_b_61,
    		result	 => Mult_61_f_q
    	);
    -- synopsys translate off
    Mult_61_f_a_real <= sIEEE_2_real(datain_a_61);
    Mult_61_f_b_real <= sIEEE_2_real(datain_b_61);
    Mult_61_f_q_real <= sInternalSM_2_real(Mult_61_f_q);
    -- synopsys translate on

	--Mult_60_f(FLOATMULT,262)@0
    Mult_60_f_reset <= areset;
    Mult_60_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_60_f_reset,
    		dataa	 => datain_a_60,
    		datab	 => datain_b_60,
    		result	 => Mult_60_f_q
    	);
    -- synopsys translate off
    Mult_60_f_a_real <= sIEEE_2_real(datain_a_60);
    Mult_60_f_b_real <= sIEEE_2_real(datain_b_60);
    Mult_60_f_q_real <= sInternalSM_2_real(Mult_60_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_30_f(FLOATADDSUB,328)@3
    SumOfElements_0_0_add_0_30_f_reset <= areset;
    SumOfElements_0_0_add_0_30_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_30_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_30_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_30_f_reset,
    	dataa	 => Mult_60_f_q,
    	datab	 => Mult_61_f_q,
    	result	 => SumOfElements_0_0_add_0_30_f_q
   	);
    SumOfElements_0_0_add_0_30_f_p <= not SumOfElements_0_0_add_0_30_f_q(41 downto 41);
    SumOfElements_0_0_add_0_30_f_n <= SumOfElements_0_0_add_0_30_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_30_f_a_real <= sInternalSM_2_real(Mult_60_f_q);
    SumOfElements_0_0_add_0_30_f_b_real <= sInternalSM_2_real(Mult_61_f_q);
    SumOfElements_0_0_add_0_30_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_30_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_15_f(FLOATADDSUB,362)@8
    SumOfElements_0_0_add_1_15_f_reset <= areset;
    SumOfElements_0_0_add_1_15_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_15_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_15_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_15_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_30_f_q,
    	datab	 => SumOfElements_0_0_add_0_31_f_q,
    	result	 => SumOfElements_0_0_add_1_15_f_q
   	);
    SumOfElements_0_0_add_1_15_f_p <= not SumOfElements_0_0_add_1_15_f_q(41 downto 41);
    SumOfElements_0_0_add_1_15_f_n <= SumOfElements_0_0_add_1_15_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_15_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_30_f_q);
    SumOfElements_0_0_add_1_15_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_31_f_q);
    SumOfElements_0_0_add_1_15_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_15_f_q);
    -- synopsys translate on

	--Mult_59_f(FLOATMULT,261)@0
    Mult_59_f_reset <= areset;
    Mult_59_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_59_f_reset,
    		dataa	 => datain_a_59,
    		datab	 => datain_b_59,
    		result	 => Mult_59_f_q
    	);
    -- synopsys translate off
    Mult_59_f_a_real <= sIEEE_2_real(datain_a_59);
    Mult_59_f_b_real <= sIEEE_2_real(datain_b_59);
    Mult_59_f_q_real <= sInternalSM_2_real(Mult_59_f_q);
    -- synopsys translate on

	--Mult_58_f(FLOATMULT,260)@0
    Mult_58_f_reset <= areset;
    Mult_58_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_58_f_reset,
    		dataa	 => datain_a_58,
    		datab	 => datain_b_58,
    		result	 => Mult_58_f_q
    	);
    -- synopsys translate off
    Mult_58_f_a_real <= sIEEE_2_real(datain_a_58);
    Mult_58_f_b_real <= sIEEE_2_real(datain_b_58);
    Mult_58_f_q_real <= sInternalSM_2_real(Mult_58_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_29_f(FLOATADDSUB,326)@3
    SumOfElements_0_0_add_0_29_f_reset <= areset;
    SumOfElements_0_0_add_0_29_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_29_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_29_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_29_f_reset,
    	dataa	 => Mult_58_f_q,
    	datab	 => Mult_59_f_q,
    	result	 => SumOfElements_0_0_add_0_29_f_q
   	);
    SumOfElements_0_0_add_0_29_f_p <= not SumOfElements_0_0_add_0_29_f_q(41 downto 41);
    SumOfElements_0_0_add_0_29_f_n <= SumOfElements_0_0_add_0_29_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_29_f_a_real <= sInternalSM_2_real(Mult_58_f_q);
    SumOfElements_0_0_add_0_29_f_b_real <= sInternalSM_2_real(Mult_59_f_q);
    SumOfElements_0_0_add_0_29_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_29_f_q);
    -- synopsys translate on

	--Mult_57_f(FLOATMULT,259)@0
    Mult_57_f_reset <= areset;
    Mult_57_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_57_f_reset,
    		dataa	 => datain_a_57,
    		datab	 => datain_b_57,
    		result	 => Mult_57_f_q
    	);
    -- synopsys translate off
    Mult_57_f_a_real <= sIEEE_2_real(datain_a_57);
    Mult_57_f_b_real <= sIEEE_2_real(datain_b_57);
    Mult_57_f_q_real <= sInternalSM_2_real(Mult_57_f_q);
    -- synopsys translate on

	--Mult_56_f(FLOATMULT,258)@0
    Mult_56_f_reset <= areset;
    Mult_56_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_56_f_reset,
    		dataa	 => datain_a_56,
    		datab	 => datain_b_56,
    		result	 => Mult_56_f_q
    	);
    -- synopsys translate off
    Mult_56_f_a_real <= sIEEE_2_real(datain_a_56);
    Mult_56_f_b_real <= sIEEE_2_real(datain_b_56);
    Mult_56_f_q_real <= sInternalSM_2_real(Mult_56_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_28_f(FLOATADDSUB,324)@3
    SumOfElements_0_0_add_0_28_f_reset <= areset;
    SumOfElements_0_0_add_0_28_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_28_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_28_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_28_f_reset,
    	dataa	 => Mult_56_f_q,
    	datab	 => Mult_57_f_q,
    	result	 => SumOfElements_0_0_add_0_28_f_q
   	);
    SumOfElements_0_0_add_0_28_f_p <= not SumOfElements_0_0_add_0_28_f_q(41 downto 41);
    SumOfElements_0_0_add_0_28_f_n <= SumOfElements_0_0_add_0_28_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_28_f_a_real <= sInternalSM_2_real(Mult_56_f_q);
    SumOfElements_0_0_add_0_28_f_b_real <= sInternalSM_2_real(Mult_57_f_q);
    SumOfElements_0_0_add_0_28_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_28_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_14_f(FLOATADDSUB,360)@8
    SumOfElements_0_0_add_1_14_f_reset <= areset;
    SumOfElements_0_0_add_1_14_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_14_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_14_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_14_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_28_f_q,
    	datab	 => SumOfElements_0_0_add_0_29_f_q,
    	result	 => SumOfElements_0_0_add_1_14_f_q
   	);
    SumOfElements_0_0_add_1_14_f_p <= not SumOfElements_0_0_add_1_14_f_q(41 downto 41);
    SumOfElements_0_0_add_1_14_f_n <= SumOfElements_0_0_add_1_14_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_14_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_28_f_q);
    SumOfElements_0_0_add_1_14_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_29_f_q);
    SumOfElements_0_0_add_1_14_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_14_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_2_7_f(FLOATADDSUB,378)@13
    SumOfElements_0_0_add_2_7_f_reset <= areset;
    SumOfElements_0_0_add_2_7_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_2_7_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_2_7_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_2_7_f_reset,
    	dataa	 => SumOfElements_0_0_add_1_14_f_q,
    	datab	 => SumOfElements_0_0_add_1_15_f_q,
    	result	 => SumOfElements_0_0_add_2_7_f_q
   	);
    SumOfElements_0_0_add_2_7_f_p <= not SumOfElements_0_0_add_2_7_f_q(41 downto 41);
    SumOfElements_0_0_add_2_7_f_n <= SumOfElements_0_0_add_2_7_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_2_7_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_1_14_f_q);
    SumOfElements_0_0_add_2_7_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_1_15_f_q);
    SumOfElements_0_0_add_2_7_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_2_7_f_q);
    -- synopsys translate on

	--Mult_55_f(FLOATMULT,257)@0
    Mult_55_f_reset <= areset;
    Mult_55_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_55_f_reset,
    		dataa	 => datain_a_55,
    		datab	 => datain_b_55,
    		result	 => Mult_55_f_q
    	);
    -- synopsys translate off
    Mult_55_f_a_real <= sIEEE_2_real(datain_a_55);
    Mult_55_f_b_real <= sIEEE_2_real(datain_b_55);
    Mult_55_f_q_real <= sInternalSM_2_real(Mult_55_f_q);
    -- synopsys translate on

	--Mult_54_f(FLOATMULT,256)@0
    Mult_54_f_reset <= areset;
    Mult_54_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_54_f_reset,
    		dataa	 => datain_a_54,
    		datab	 => datain_b_54,
    		result	 => Mult_54_f_q
    	);
    -- synopsys translate off
    Mult_54_f_a_real <= sIEEE_2_real(datain_a_54);
    Mult_54_f_b_real <= sIEEE_2_real(datain_b_54);
    Mult_54_f_q_real <= sInternalSM_2_real(Mult_54_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_27_f(FLOATADDSUB,322)@3
    SumOfElements_0_0_add_0_27_f_reset <= areset;
    SumOfElements_0_0_add_0_27_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_27_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_27_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_27_f_reset,
    	dataa	 => Mult_54_f_q,
    	datab	 => Mult_55_f_q,
    	result	 => SumOfElements_0_0_add_0_27_f_q
   	);
    SumOfElements_0_0_add_0_27_f_p <= not SumOfElements_0_0_add_0_27_f_q(41 downto 41);
    SumOfElements_0_0_add_0_27_f_n <= SumOfElements_0_0_add_0_27_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_27_f_a_real <= sInternalSM_2_real(Mult_54_f_q);
    SumOfElements_0_0_add_0_27_f_b_real <= sInternalSM_2_real(Mult_55_f_q);
    SumOfElements_0_0_add_0_27_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_27_f_q);
    -- synopsys translate on

	--Mult_53_f(FLOATMULT,255)@0
    Mult_53_f_reset <= areset;
    Mult_53_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_53_f_reset,
    		dataa	 => datain_a_53,
    		datab	 => datain_b_53,
    		result	 => Mult_53_f_q
    	);
    -- synopsys translate off
    Mult_53_f_a_real <= sIEEE_2_real(datain_a_53);
    Mult_53_f_b_real <= sIEEE_2_real(datain_b_53);
    Mult_53_f_q_real <= sInternalSM_2_real(Mult_53_f_q);
    -- synopsys translate on

	--Mult_52_f(FLOATMULT,254)@0
    Mult_52_f_reset <= areset;
    Mult_52_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_52_f_reset,
    		dataa	 => datain_a_52,
    		datab	 => datain_b_52,
    		result	 => Mult_52_f_q
    	);
    -- synopsys translate off
    Mult_52_f_a_real <= sIEEE_2_real(datain_a_52);
    Mult_52_f_b_real <= sIEEE_2_real(datain_b_52);
    Mult_52_f_q_real <= sInternalSM_2_real(Mult_52_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_26_f(FLOATADDSUB,320)@3
    SumOfElements_0_0_add_0_26_f_reset <= areset;
    SumOfElements_0_0_add_0_26_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_26_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_26_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_26_f_reset,
    	dataa	 => Mult_52_f_q,
    	datab	 => Mult_53_f_q,
    	result	 => SumOfElements_0_0_add_0_26_f_q
   	);
    SumOfElements_0_0_add_0_26_f_p <= not SumOfElements_0_0_add_0_26_f_q(41 downto 41);
    SumOfElements_0_0_add_0_26_f_n <= SumOfElements_0_0_add_0_26_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_26_f_a_real <= sInternalSM_2_real(Mult_52_f_q);
    SumOfElements_0_0_add_0_26_f_b_real <= sInternalSM_2_real(Mult_53_f_q);
    SumOfElements_0_0_add_0_26_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_26_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_13_f(FLOATADDSUB,358)@8
    SumOfElements_0_0_add_1_13_f_reset <= areset;
    SumOfElements_0_0_add_1_13_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_13_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_13_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_13_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_26_f_q,
    	datab	 => SumOfElements_0_0_add_0_27_f_q,
    	result	 => SumOfElements_0_0_add_1_13_f_q
   	);
    SumOfElements_0_0_add_1_13_f_p <= not SumOfElements_0_0_add_1_13_f_q(41 downto 41);
    SumOfElements_0_0_add_1_13_f_n <= SumOfElements_0_0_add_1_13_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_13_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_26_f_q);
    SumOfElements_0_0_add_1_13_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_27_f_q);
    SumOfElements_0_0_add_1_13_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_13_f_q);
    -- synopsys translate on

	--Mult_51_f(FLOATMULT,253)@0
    Mult_51_f_reset <= areset;
    Mult_51_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_51_f_reset,
    		dataa	 => datain_a_51,
    		datab	 => datain_b_51,
    		result	 => Mult_51_f_q
    	);
    -- synopsys translate off
    Mult_51_f_a_real <= sIEEE_2_real(datain_a_51);
    Mult_51_f_b_real <= sIEEE_2_real(datain_b_51);
    Mult_51_f_q_real <= sInternalSM_2_real(Mult_51_f_q);
    -- synopsys translate on

	--Mult_50_f(FLOATMULT,252)@0
    Mult_50_f_reset <= areset;
    Mult_50_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_50_f_reset,
    		dataa	 => datain_a_50,
    		datab	 => datain_b_50,
    		result	 => Mult_50_f_q
    	);
    -- synopsys translate off
    Mult_50_f_a_real <= sIEEE_2_real(datain_a_50);
    Mult_50_f_b_real <= sIEEE_2_real(datain_b_50);
    Mult_50_f_q_real <= sInternalSM_2_real(Mult_50_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_25_f(FLOATADDSUB,318)@3
    SumOfElements_0_0_add_0_25_f_reset <= areset;
    SumOfElements_0_0_add_0_25_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_25_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_25_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_25_f_reset,
    	dataa	 => Mult_50_f_q,
    	datab	 => Mult_51_f_q,
    	result	 => SumOfElements_0_0_add_0_25_f_q
   	);
    SumOfElements_0_0_add_0_25_f_p <= not SumOfElements_0_0_add_0_25_f_q(41 downto 41);
    SumOfElements_0_0_add_0_25_f_n <= SumOfElements_0_0_add_0_25_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_25_f_a_real <= sInternalSM_2_real(Mult_50_f_q);
    SumOfElements_0_0_add_0_25_f_b_real <= sInternalSM_2_real(Mult_51_f_q);
    SumOfElements_0_0_add_0_25_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_25_f_q);
    -- synopsys translate on

	--Mult_49_f(FLOATMULT,251)@0
    Mult_49_f_reset <= areset;
    Mult_49_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_49_f_reset,
    		dataa	 => datain_a_49,
    		datab	 => datain_b_49,
    		result	 => Mult_49_f_q
    	);
    -- synopsys translate off
    Mult_49_f_a_real <= sIEEE_2_real(datain_a_49);
    Mult_49_f_b_real <= sIEEE_2_real(datain_b_49);
    Mult_49_f_q_real <= sInternalSM_2_real(Mult_49_f_q);
    -- synopsys translate on

	--Mult_48_f(FLOATMULT,250)@0
    Mult_48_f_reset <= areset;
    Mult_48_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_48_f_reset,
    		dataa	 => datain_a_48,
    		datab	 => datain_b_48,
    		result	 => Mult_48_f_q
    	);
    -- synopsys translate off
    Mult_48_f_a_real <= sIEEE_2_real(datain_a_48);
    Mult_48_f_b_real <= sIEEE_2_real(datain_b_48);
    Mult_48_f_q_real <= sInternalSM_2_real(Mult_48_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_24_f(FLOATADDSUB,316)@3
    SumOfElements_0_0_add_0_24_f_reset <= areset;
    SumOfElements_0_0_add_0_24_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_24_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_24_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_24_f_reset,
    	dataa	 => Mult_48_f_q,
    	datab	 => Mult_49_f_q,
    	result	 => SumOfElements_0_0_add_0_24_f_q
   	);
    SumOfElements_0_0_add_0_24_f_p <= not SumOfElements_0_0_add_0_24_f_q(41 downto 41);
    SumOfElements_0_0_add_0_24_f_n <= SumOfElements_0_0_add_0_24_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_24_f_a_real <= sInternalSM_2_real(Mult_48_f_q);
    SumOfElements_0_0_add_0_24_f_b_real <= sInternalSM_2_real(Mult_49_f_q);
    SumOfElements_0_0_add_0_24_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_24_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_12_f(FLOATADDSUB,356)@8
    SumOfElements_0_0_add_1_12_f_reset <= areset;
    SumOfElements_0_0_add_1_12_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_12_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_12_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_12_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_24_f_q,
    	datab	 => SumOfElements_0_0_add_0_25_f_q,
    	result	 => SumOfElements_0_0_add_1_12_f_q
   	);
    SumOfElements_0_0_add_1_12_f_p <= not SumOfElements_0_0_add_1_12_f_q(41 downto 41);
    SumOfElements_0_0_add_1_12_f_n <= SumOfElements_0_0_add_1_12_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_12_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_24_f_q);
    SumOfElements_0_0_add_1_12_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_25_f_q);
    SumOfElements_0_0_add_1_12_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_12_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_2_6_f(FLOATADDSUB,376)@13
    SumOfElements_0_0_add_2_6_f_reset <= areset;
    SumOfElements_0_0_add_2_6_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_2_6_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_2_6_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_2_6_f_reset,
    	dataa	 => SumOfElements_0_0_add_1_12_f_q,
    	datab	 => SumOfElements_0_0_add_1_13_f_q,
    	result	 => SumOfElements_0_0_add_2_6_f_q
   	);
    SumOfElements_0_0_add_2_6_f_p <= not SumOfElements_0_0_add_2_6_f_q(41 downto 41);
    SumOfElements_0_0_add_2_6_f_n <= SumOfElements_0_0_add_2_6_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_2_6_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_1_12_f_q);
    SumOfElements_0_0_add_2_6_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_1_13_f_q);
    SumOfElements_0_0_add_2_6_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_2_6_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_3_3_f(FLOATADDSUB,386)@18
    SumOfElements_0_0_add_3_3_f_reset <= areset;
    SumOfElements_0_0_add_3_3_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_3_3_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_3_3_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_3_3_f_reset,
    	dataa	 => SumOfElements_0_0_add_2_6_f_q,
    	datab	 => SumOfElements_0_0_add_2_7_f_q,
    	result	 => SumOfElements_0_0_add_3_3_f_q
   	);
    SumOfElements_0_0_add_3_3_f_p <= not SumOfElements_0_0_add_3_3_f_q(41 downto 41);
    SumOfElements_0_0_add_3_3_f_n <= SumOfElements_0_0_add_3_3_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_3_3_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_2_6_f_q);
    SumOfElements_0_0_add_3_3_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_2_7_f_q);
    SumOfElements_0_0_add_3_3_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_3_3_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_3_3_f_0_norm_SumOfElements_0_0_add_4_1_f_1((null),395)@23
    SumOfElements_0_0_add_3_3_f_0_norm_SumOfElements_0_0_add_4_1_f_1_reset <= areset;
    SumOfElements_0_0_add_3_3_f_0_norm_SumOfElements_0_0_add_4_1_f_1_inst : fp_norm_sInternal_2_sInternal
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => SumOfElements_0_0_add_3_3_f_0_norm_SumOfElements_0_0_add_4_1_f_1_reset,
    		dataa	 => SumOfElements_0_0_add_3_3_f_q,
    		result	 => SumOfElements_0_0_add_3_3_f_0_norm_SumOfElements_0_0_add_4_1_f_1_q
    	);
    -- synopsys translate off
    SumOfElements_0_0_add_3_3_f_0_norm_SumOfElements_0_0_add_4_1_f_1_q_real <= sInternal_2_real(SumOfElements_0_0_add_3_3_f_0_norm_SumOfElements_0_0_add_4_1_f_1_q);
    -- synopsys translate on

	--Mult_47_f(FLOATMULT,249)@0
    Mult_47_f_reset <= areset;
    Mult_47_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_47_f_reset,
    		dataa	 => datain_a_47,
    		datab	 => datain_b_47,
    		result	 => Mult_47_f_q
    	);
    -- synopsys translate off
    Mult_47_f_a_real <= sIEEE_2_real(datain_a_47);
    Mult_47_f_b_real <= sIEEE_2_real(datain_b_47);
    Mult_47_f_q_real <= sInternalSM_2_real(Mult_47_f_q);
    -- synopsys translate on

	--Mult_46_f(FLOATMULT,248)@0
    Mult_46_f_reset <= areset;
    Mult_46_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_46_f_reset,
    		dataa	 => datain_a_46,
    		datab	 => datain_b_46,
    		result	 => Mult_46_f_q
    	);
    -- synopsys translate off
    Mult_46_f_a_real <= sIEEE_2_real(datain_a_46);
    Mult_46_f_b_real <= sIEEE_2_real(datain_b_46);
    Mult_46_f_q_real <= sInternalSM_2_real(Mult_46_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_23_f(FLOATADDSUB,314)@3
    SumOfElements_0_0_add_0_23_f_reset <= areset;
    SumOfElements_0_0_add_0_23_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_23_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_23_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_23_f_reset,
    	dataa	 => Mult_46_f_q,
    	datab	 => Mult_47_f_q,
    	result	 => SumOfElements_0_0_add_0_23_f_q
   	);
    SumOfElements_0_0_add_0_23_f_p <= not SumOfElements_0_0_add_0_23_f_q(41 downto 41);
    SumOfElements_0_0_add_0_23_f_n <= SumOfElements_0_0_add_0_23_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_23_f_a_real <= sInternalSM_2_real(Mult_46_f_q);
    SumOfElements_0_0_add_0_23_f_b_real <= sInternalSM_2_real(Mult_47_f_q);
    SumOfElements_0_0_add_0_23_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_23_f_q);
    -- synopsys translate on

	--Mult_45_f(FLOATMULT,247)@0
    Mult_45_f_reset <= areset;
    Mult_45_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_45_f_reset,
    		dataa	 => datain_a_45,
    		datab	 => datain_b_45,
    		result	 => Mult_45_f_q
    	);
    -- synopsys translate off
    Mult_45_f_a_real <= sIEEE_2_real(datain_a_45);
    Mult_45_f_b_real <= sIEEE_2_real(datain_b_45);
    Mult_45_f_q_real <= sInternalSM_2_real(Mult_45_f_q);
    -- synopsys translate on

	--Mult_44_f(FLOATMULT,246)@0
    Mult_44_f_reset <= areset;
    Mult_44_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_44_f_reset,
    		dataa	 => datain_a_44,
    		datab	 => datain_b_44,
    		result	 => Mult_44_f_q
    	);
    -- synopsys translate off
    Mult_44_f_a_real <= sIEEE_2_real(datain_a_44);
    Mult_44_f_b_real <= sIEEE_2_real(datain_b_44);
    Mult_44_f_q_real <= sInternalSM_2_real(Mult_44_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_22_f(FLOATADDSUB,312)@3
    SumOfElements_0_0_add_0_22_f_reset <= areset;
    SumOfElements_0_0_add_0_22_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_22_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_22_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_22_f_reset,
    	dataa	 => Mult_44_f_q,
    	datab	 => Mult_45_f_q,
    	result	 => SumOfElements_0_0_add_0_22_f_q
   	);
    SumOfElements_0_0_add_0_22_f_p <= not SumOfElements_0_0_add_0_22_f_q(41 downto 41);
    SumOfElements_0_0_add_0_22_f_n <= SumOfElements_0_0_add_0_22_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_22_f_a_real <= sInternalSM_2_real(Mult_44_f_q);
    SumOfElements_0_0_add_0_22_f_b_real <= sInternalSM_2_real(Mult_45_f_q);
    SumOfElements_0_0_add_0_22_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_22_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_11_f(FLOATADDSUB,354)@8
    SumOfElements_0_0_add_1_11_f_reset <= areset;
    SumOfElements_0_0_add_1_11_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_11_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_11_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_11_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_22_f_q,
    	datab	 => SumOfElements_0_0_add_0_23_f_q,
    	result	 => SumOfElements_0_0_add_1_11_f_q
   	);
    SumOfElements_0_0_add_1_11_f_p <= not SumOfElements_0_0_add_1_11_f_q(41 downto 41);
    SumOfElements_0_0_add_1_11_f_n <= SumOfElements_0_0_add_1_11_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_11_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_22_f_q);
    SumOfElements_0_0_add_1_11_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_23_f_q);
    SumOfElements_0_0_add_1_11_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_11_f_q);
    -- synopsys translate on

	--Mult_43_f(FLOATMULT,245)@0
    Mult_43_f_reset <= areset;
    Mult_43_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_43_f_reset,
    		dataa	 => datain_a_43,
    		datab	 => datain_b_43,
    		result	 => Mult_43_f_q
    	);
    -- synopsys translate off
    Mult_43_f_a_real <= sIEEE_2_real(datain_a_43);
    Mult_43_f_b_real <= sIEEE_2_real(datain_b_43);
    Mult_43_f_q_real <= sInternalSM_2_real(Mult_43_f_q);
    -- synopsys translate on

	--Mult_42_f(FLOATMULT,244)@0
    Mult_42_f_reset <= areset;
    Mult_42_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_42_f_reset,
    		dataa	 => datain_a_42,
    		datab	 => datain_b_42,
    		result	 => Mult_42_f_q
    	);
    -- synopsys translate off
    Mult_42_f_a_real <= sIEEE_2_real(datain_a_42);
    Mult_42_f_b_real <= sIEEE_2_real(datain_b_42);
    Mult_42_f_q_real <= sInternalSM_2_real(Mult_42_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_21_f(FLOATADDSUB,310)@3
    SumOfElements_0_0_add_0_21_f_reset <= areset;
    SumOfElements_0_0_add_0_21_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_21_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_21_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_21_f_reset,
    	dataa	 => Mult_42_f_q,
    	datab	 => Mult_43_f_q,
    	result	 => SumOfElements_0_0_add_0_21_f_q
   	);
    SumOfElements_0_0_add_0_21_f_p <= not SumOfElements_0_0_add_0_21_f_q(41 downto 41);
    SumOfElements_0_0_add_0_21_f_n <= SumOfElements_0_0_add_0_21_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_21_f_a_real <= sInternalSM_2_real(Mult_42_f_q);
    SumOfElements_0_0_add_0_21_f_b_real <= sInternalSM_2_real(Mult_43_f_q);
    SumOfElements_0_0_add_0_21_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_21_f_q);
    -- synopsys translate on

	--Mult_41_f(FLOATMULT,243)@0
    Mult_41_f_reset <= areset;
    Mult_41_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_41_f_reset,
    		dataa	 => datain_a_41,
    		datab	 => datain_b_41,
    		result	 => Mult_41_f_q
    	);
    -- synopsys translate off
    Mult_41_f_a_real <= sIEEE_2_real(datain_a_41);
    Mult_41_f_b_real <= sIEEE_2_real(datain_b_41);
    Mult_41_f_q_real <= sInternalSM_2_real(Mult_41_f_q);
    -- synopsys translate on

	--Mult_40_f(FLOATMULT,242)@0
    Mult_40_f_reset <= areset;
    Mult_40_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_40_f_reset,
    		dataa	 => datain_a_40,
    		datab	 => datain_b_40,
    		result	 => Mult_40_f_q
    	);
    -- synopsys translate off
    Mult_40_f_a_real <= sIEEE_2_real(datain_a_40);
    Mult_40_f_b_real <= sIEEE_2_real(datain_b_40);
    Mult_40_f_q_real <= sInternalSM_2_real(Mult_40_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_20_f(FLOATADDSUB,308)@3
    SumOfElements_0_0_add_0_20_f_reset <= areset;
    SumOfElements_0_0_add_0_20_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_20_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_20_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_20_f_reset,
    	dataa	 => Mult_40_f_q,
    	datab	 => Mult_41_f_q,
    	result	 => SumOfElements_0_0_add_0_20_f_q
   	);
    SumOfElements_0_0_add_0_20_f_p <= not SumOfElements_0_0_add_0_20_f_q(41 downto 41);
    SumOfElements_0_0_add_0_20_f_n <= SumOfElements_0_0_add_0_20_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_20_f_a_real <= sInternalSM_2_real(Mult_40_f_q);
    SumOfElements_0_0_add_0_20_f_b_real <= sInternalSM_2_real(Mult_41_f_q);
    SumOfElements_0_0_add_0_20_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_20_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_10_f(FLOATADDSUB,352)@8
    SumOfElements_0_0_add_1_10_f_reset <= areset;
    SumOfElements_0_0_add_1_10_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_10_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_10_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_10_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_20_f_q,
    	datab	 => SumOfElements_0_0_add_0_21_f_q,
    	result	 => SumOfElements_0_0_add_1_10_f_q
   	);
    SumOfElements_0_0_add_1_10_f_p <= not SumOfElements_0_0_add_1_10_f_q(41 downto 41);
    SumOfElements_0_0_add_1_10_f_n <= SumOfElements_0_0_add_1_10_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_10_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_20_f_q);
    SumOfElements_0_0_add_1_10_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_21_f_q);
    SumOfElements_0_0_add_1_10_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_10_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_2_5_f(FLOATADDSUB,374)@13
    SumOfElements_0_0_add_2_5_f_reset <= areset;
    SumOfElements_0_0_add_2_5_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_2_5_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_2_5_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_2_5_f_reset,
    	dataa	 => SumOfElements_0_0_add_1_10_f_q,
    	datab	 => SumOfElements_0_0_add_1_11_f_q,
    	result	 => SumOfElements_0_0_add_2_5_f_q
   	);
    SumOfElements_0_0_add_2_5_f_p <= not SumOfElements_0_0_add_2_5_f_q(41 downto 41);
    SumOfElements_0_0_add_2_5_f_n <= SumOfElements_0_0_add_2_5_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_2_5_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_1_10_f_q);
    SumOfElements_0_0_add_2_5_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_1_11_f_q);
    SumOfElements_0_0_add_2_5_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_2_5_f_q);
    -- synopsys translate on

	--Mult_39_f(FLOATMULT,241)@0
    Mult_39_f_reset <= areset;
    Mult_39_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_39_f_reset,
    		dataa	 => datain_a_39,
    		datab	 => datain_b_39,
    		result	 => Mult_39_f_q
    	);
    -- synopsys translate off
    Mult_39_f_a_real <= sIEEE_2_real(datain_a_39);
    Mult_39_f_b_real <= sIEEE_2_real(datain_b_39);
    Mult_39_f_q_real <= sInternalSM_2_real(Mult_39_f_q);
    -- synopsys translate on

	--Mult_38_f(FLOATMULT,240)@0
    Mult_38_f_reset <= areset;
    Mult_38_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_38_f_reset,
    		dataa	 => datain_a_38,
    		datab	 => datain_b_38,
    		result	 => Mult_38_f_q
    	);
    -- synopsys translate off
    Mult_38_f_a_real <= sIEEE_2_real(datain_a_38);
    Mult_38_f_b_real <= sIEEE_2_real(datain_b_38);
    Mult_38_f_q_real <= sInternalSM_2_real(Mult_38_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_19_f(FLOATADDSUB,306)@3
    SumOfElements_0_0_add_0_19_f_reset <= areset;
    SumOfElements_0_0_add_0_19_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_19_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_19_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_19_f_reset,
    	dataa	 => Mult_38_f_q,
    	datab	 => Mult_39_f_q,
    	result	 => SumOfElements_0_0_add_0_19_f_q
   	);
    SumOfElements_0_0_add_0_19_f_p <= not SumOfElements_0_0_add_0_19_f_q(41 downto 41);
    SumOfElements_0_0_add_0_19_f_n <= SumOfElements_0_0_add_0_19_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_19_f_a_real <= sInternalSM_2_real(Mult_38_f_q);
    SumOfElements_0_0_add_0_19_f_b_real <= sInternalSM_2_real(Mult_39_f_q);
    SumOfElements_0_0_add_0_19_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_19_f_q);
    -- synopsys translate on

	--Mult_37_f(FLOATMULT,239)@0
    Mult_37_f_reset <= areset;
    Mult_37_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_37_f_reset,
    		dataa	 => datain_a_37,
    		datab	 => datain_b_37,
    		result	 => Mult_37_f_q
    	);
    -- synopsys translate off
    Mult_37_f_a_real <= sIEEE_2_real(datain_a_37);
    Mult_37_f_b_real <= sIEEE_2_real(datain_b_37);
    Mult_37_f_q_real <= sInternalSM_2_real(Mult_37_f_q);
    -- synopsys translate on

	--Mult_36_f(FLOATMULT,238)@0
    Mult_36_f_reset <= areset;
    Mult_36_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_36_f_reset,
    		dataa	 => datain_a_36,
    		datab	 => datain_b_36,
    		result	 => Mult_36_f_q
    	);
    -- synopsys translate off
    Mult_36_f_a_real <= sIEEE_2_real(datain_a_36);
    Mult_36_f_b_real <= sIEEE_2_real(datain_b_36);
    Mult_36_f_q_real <= sInternalSM_2_real(Mult_36_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_18_f(FLOATADDSUB,304)@3
    SumOfElements_0_0_add_0_18_f_reset <= areset;
    SumOfElements_0_0_add_0_18_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_18_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_18_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_18_f_reset,
    	dataa	 => Mult_36_f_q,
    	datab	 => Mult_37_f_q,
    	result	 => SumOfElements_0_0_add_0_18_f_q
   	);
    SumOfElements_0_0_add_0_18_f_p <= not SumOfElements_0_0_add_0_18_f_q(41 downto 41);
    SumOfElements_0_0_add_0_18_f_n <= SumOfElements_0_0_add_0_18_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_18_f_a_real <= sInternalSM_2_real(Mult_36_f_q);
    SumOfElements_0_0_add_0_18_f_b_real <= sInternalSM_2_real(Mult_37_f_q);
    SumOfElements_0_0_add_0_18_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_18_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_9_f(FLOATADDSUB,350)@8
    SumOfElements_0_0_add_1_9_f_reset <= areset;
    SumOfElements_0_0_add_1_9_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_9_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_9_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_9_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_18_f_q,
    	datab	 => SumOfElements_0_0_add_0_19_f_q,
    	result	 => SumOfElements_0_0_add_1_9_f_q
   	);
    SumOfElements_0_0_add_1_9_f_p <= not SumOfElements_0_0_add_1_9_f_q(41 downto 41);
    SumOfElements_0_0_add_1_9_f_n <= SumOfElements_0_0_add_1_9_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_9_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_18_f_q);
    SumOfElements_0_0_add_1_9_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_19_f_q);
    SumOfElements_0_0_add_1_9_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_9_f_q);
    -- synopsys translate on

	--Mult_35_f(FLOATMULT,237)@0
    Mult_35_f_reset <= areset;
    Mult_35_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_35_f_reset,
    		dataa	 => datain_a_35,
    		datab	 => datain_b_35,
    		result	 => Mult_35_f_q
    	);
    -- synopsys translate off
    Mult_35_f_a_real <= sIEEE_2_real(datain_a_35);
    Mult_35_f_b_real <= sIEEE_2_real(datain_b_35);
    Mult_35_f_q_real <= sInternalSM_2_real(Mult_35_f_q);
    -- synopsys translate on

	--Mult_34_f(FLOATMULT,236)@0
    Mult_34_f_reset <= areset;
    Mult_34_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_34_f_reset,
    		dataa	 => datain_a_34,
    		datab	 => datain_b_34,
    		result	 => Mult_34_f_q
    	);
    -- synopsys translate off
    Mult_34_f_a_real <= sIEEE_2_real(datain_a_34);
    Mult_34_f_b_real <= sIEEE_2_real(datain_b_34);
    Mult_34_f_q_real <= sInternalSM_2_real(Mult_34_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_17_f(FLOATADDSUB,302)@3
    SumOfElements_0_0_add_0_17_f_reset <= areset;
    SumOfElements_0_0_add_0_17_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_17_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_17_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_17_f_reset,
    	dataa	 => Mult_34_f_q,
    	datab	 => Mult_35_f_q,
    	result	 => SumOfElements_0_0_add_0_17_f_q
   	);
    SumOfElements_0_0_add_0_17_f_p <= not SumOfElements_0_0_add_0_17_f_q(41 downto 41);
    SumOfElements_0_0_add_0_17_f_n <= SumOfElements_0_0_add_0_17_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_17_f_a_real <= sInternalSM_2_real(Mult_34_f_q);
    SumOfElements_0_0_add_0_17_f_b_real <= sInternalSM_2_real(Mult_35_f_q);
    SumOfElements_0_0_add_0_17_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_17_f_q);
    -- synopsys translate on

	--Mult_33_f(FLOATMULT,235)@0
    Mult_33_f_reset <= areset;
    Mult_33_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_33_f_reset,
    		dataa	 => datain_a_33,
    		datab	 => datain_b_33,
    		result	 => Mult_33_f_q
    	);
    -- synopsys translate off
    Mult_33_f_a_real <= sIEEE_2_real(datain_a_33);
    Mult_33_f_b_real <= sIEEE_2_real(datain_b_33);
    Mult_33_f_q_real <= sInternalSM_2_real(Mult_33_f_q);
    -- synopsys translate on

	--Mult_32_f(FLOATMULT,234)@0
    Mult_32_f_reset <= areset;
    Mult_32_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_32_f_reset,
    		dataa	 => datain_a_32,
    		datab	 => datain_b_32,
    		result	 => Mult_32_f_q
    	);
    -- synopsys translate off
    Mult_32_f_a_real <= sIEEE_2_real(datain_a_32);
    Mult_32_f_b_real <= sIEEE_2_real(datain_b_32);
    Mult_32_f_q_real <= sInternalSM_2_real(Mult_32_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_16_f(FLOATADDSUB,300)@3
    SumOfElements_0_0_add_0_16_f_reset <= areset;
    SumOfElements_0_0_add_0_16_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_16_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_16_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_16_f_reset,
    	dataa	 => Mult_32_f_q,
    	datab	 => Mult_33_f_q,
    	result	 => SumOfElements_0_0_add_0_16_f_q
   	);
    SumOfElements_0_0_add_0_16_f_p <= not SumOfElements_0_0_add_0_16_f_q(41 downto 41);
    SumOfElements_0_0_add_0_16_f_n <= SumOfElements_0_0_add_0_16_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_16_f_a_real <= sInternalSM_2_real(Mult_32_f_q);
    SumOfElements_0_0_add_0_16_f_b_real <= sInternalSM_2_real(Mult_33_f_q);
    SumOfElements_0_0_add_0_16_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_16_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_8_f(FLOATADDSUB,348)@8
    SumOfElements_0_0_add_1_8_f_reset <= areset;
    SumOfElements_0_0_add_1_8_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_8_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_8_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_8_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_16_f_q,
    	datab	 => SumOfElements_0_0_add_0_17_f_q,
    	result	 => SumOfElements_0_0_add_1_8_f_q
   	);
    SumOfElements_0_0_add_1_8_f_p <= not SumOfElements_0_0_add_1_8_f_q(41 downto 41);
    SumOfElements_0_0_add_1_8_f_n <= SumOfElements_0_0_add_1_8_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_8_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_16_f_q);
    SumOfElements_0_0_add_1_8_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_17_f_q);
    SumOfElements_0_0_add_1_8_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_8_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_2_4_f(FLOATADDSUB,372)@13
    SumOfElements_0_0_add_2_4_f_reset <= areset;
    SumOfElements_0_0_add_2_4_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_2_4_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_2_4_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_2_4_f_reset,
    	dataa	 => SumOfElements_0_0_add_1_8_f_q,
    	datab	 => SumOfElements_0_0_add_1_9_f_q,
    	result	 => SumOfElements_0_0_add_2_4_f_q
   	);
    SumOfElements_0_0_add_2_4_f_p <= not SumOfElements_0_0_add_2_4_f_q(41 downto 41);
    SumOfElements_0_0_add_2_4_f_n <= SumOfElements_0_0_add_2_4_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_2_4_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_1_8_f_q);
    SumOfElements_0_0_add_2_4_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_1_9_f_q);
    SumOfElements_0_0_add_2_4_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_2_4_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_3_2_f(FLOATADDSUB,384)@18
    SumOfElements_0_0_add_3_2_f_reset <= areset;
    SumOfElements_0_0_add_3_2_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_3_2_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_3_2_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_3_2_f_reset,
    	dataa	 => SumOfElements_0_0_add_2_4_f_q,
    	datab	 => SumOfElements_0_0_add_2_5_f_q,
    	result	 => SumOfElements_0_0_add_3_2_f_q
   	);
    SumOfElements_0_0_add_3_2_f_p <= not SumOfElements_0_0_add_3_2_f_q(41 downto 41);
    SumOfElements_0_0_add_3_2_f_n <= SumOfElements_0_0_add_3_2_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_3_2_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_2_4_f_q);
    SumOfElements_0_0_add_3_2_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_2_5_f_q);
    SumOfElements_0_0_add_3_2_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_3_2_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_3_2_f_0_norm_SumOfElements_0_0_add_4_1_f_0((null),396)@23
    SumOfElements_0_0_add_3_2_f_0_norm_SumOfElements_0_0_add_4_1_f_0_reset <= areset;
    SumOfElements_0_0_add_3_2_f_0_norm_SumOfElements_0_0_add_4_1_f_0_inst : fp_norm_sInternal_2_sInternal
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => SumOfElements_0_0_add_3_2_f_0_norm_SumOfElements_0_0_add_4_1_f_0_reset,
    		dataa	 => SumOfElements_0_0_add_3_2_f_q,
    		result	 => SumOfElements_0_0_add_3_2_f_0_norm_SumOfElements_0_0_add_4_1_f_0_q
    	);
    -- synopsys translate off
    SumOfElements_0_0_add_3_2_f_0_norm_SumOfElements_0_0_add_4_1_f_0_q_real <= sInternal_2_real(SumOfElements_0_0_add_3_2_f_0_norm_SumOfElements_0_0_add_4_1_f_0_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_4_1_f(FLOATADDSUB,390)@28
    SumOfElements_0_0_add_4_1_f_reset <= areset;
    SumOfElements_0_0_add_4_1_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_4_1_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_4_1_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_4_1_f_reset,
    	dataa	 => SumOfElements_0_0_add_3_2_f_0_norm_SumOfElements_0_0_add_4_1_f_0_q,
    	datab	 => SumOfElements_0_0_add_3_3_f_0_norm_SumOfElements_0_0_add_4_1_f_1_q,
    	result	 => SumOfElements_0_0_add_4_1_f_q
   	);
    SumOfElements_0_0_add_4_1_f_p <= not SumOfElements_0_0_add_4_1_f_q(41 downto 41);
    SumOfElements_0_0_add_4_1_f_n <= SumOfElements_0_0_add_4_1_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_4_1_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_3_2_f_0_norm_SumOfElements_0_0_add_4_1_f_0_q);
    SumOfElements_0_0_add_4_1_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_3_3_f_0_norm_SumOfElements_0_0_add_4_1_f_1_q);
    SumOfElements_0_0_add_4_1_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_4_1_f_q);
    -- synopsys translate on

	--Mult_31_f(FLOATMULT,233)@0
    Mult_31_f_reset <= areset;
    Mult_31_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_31_f_reset,
    		dataa	 => datain_a_31,
    		datab	 => datain_b_31,
    		result	 => Mult_31_f_q
    	);
    -- synopsys translate off
    Mult_31_f_a_real <= sIEEE_2_real(datain_a_31);
    Mult_31_f_b_real <= sIEEE_2_real(datain_b_31);
    Mult_31_f_q_real <= sInternalSM_2_real(Mult_31_f_q);
    -- synopsys translate on

	--Mult_30_f(FLOATMULT,232)@0
    Mult_30_f_reset <= areset;
    Mult_30_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_30_f_reset,
    		dataa	 => datain_a_30,
    		datab	 => datain_b_30,
    		result	 => Mult_30_f_q
    	);
    -- synopsys translate off
    Mult_30_f_a_real <= sIEEE_2_real(datain_a_30);
    Mult_30_f_b_real <= sIEEE_2_real(datain_b_30);
    Mult_30_f_q_real <= sInternalSM_2_real(Mult_30_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_15_f(FLOATADDSUB,298)@3
    SumOfElements_0_0_add_0_15_f_reset <= areset;
    SumOfElements_0_0_add_0_15_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_15_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_15_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_15_f_reset,
    	dataa	 => Mult_30_f_q,
    	datab	 => Mult_31_f_q,
    	result	 => SumOfElements_0_0_add_0_15_f_q
   	);
    SumOfElements_0_0_add_0_15_f_p <= not SumOfElements_0_0_add_0_15_f_q(41 downto 41);
    SumOfElements_0_0_add_0_15_f_n <= SumOfElements_0_0_add_0_15_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_15_f_a_real <= sInternalSM_2_real(Mult_30_f_q);
    SumOfElements_0_0_add_0_15_f_b_real <= sInternalSM_2_real(Mult_31_f_q);
    SumOfElements_0_0_add_0_15_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_15_f_q);
    -- synopsys translate on

	--Mult_29_f(FLOATMULT,231)@0
    Mult_29_f_reset <= areset;
    Mult_29_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_29_f_reset,
    		dataa	 => datain_a_29,
    		datab	 => datain_b_29,
    		result	 => Mult_29_f_q
    	);
    -- synopsys translate off
    Mult_29_f_a_real <= sIEEE_2_real(datain_a_29);
    Mult_29_f_b_real <= sIEEE_2_real(datain_b_29);
    Mult_29_f_q_real <= sInternalSM_2_real(Mult_29_f_q);
    -- synopsys translate on

	--Mult_28_f(FLOATMULT,230)@0
    Mult_28_f_reset <= areset;
    Mult_28_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_28_f_reset,
    		dataa	 => datain_a_28,
    		datab	 => datain_b_28,
    		result	 => Mult_28_f_q
    	);
    -- synopsys translate off
    Mult_28_f_a_real <= sIEEE_2_real(datain_a_28);
    Mult_28_f_b_real <= sIEEE_2_real(datain_b_28);
    Mult_28_f_q_real <= sInternalSM_2_real(Mult_28_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_14_f(FLOATADDSUB,296)@3
    SumOfElements_0_0_add_0_14_f_reset <= areset;
    SumOfElements_0_0_add_0_14_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_14_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_14_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_14_f_reset,
    	dataa	 => Mult_28_f_q,
    	datab	 => Mult_29_f_q,
    	result	 => SumOfElements_0_0_add_0_14_f_q
   	);
    SumOfElements_0_0_add_0_14_f_p <= not SumOfElements_0_0_add_0_14_f_q(41 downto 41);
    SumOfElements_0_0_add_0_14_f_n <= SumOfElements_0_0_add_0_14_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_14_f_a_real <= sInternalSM_2_real(Mult_28_f_q);
    SumOfElements_0_0_add_0_14_f_b_real <= sInternalSM_2_real(Mult_29_f_q);
    SumOfElements_0_0_add_0_14_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_14_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_7_f(FLOATADDSUB,346)@8
    SumOfElements_0_0_add_1_7_f_reset <= areset;
    SumOfElements_0_0_add_1_7_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_7_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_7_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_7_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_14_f_q,
    	datab	 => SumOfElements_0_0_add_0_15_f_q,
    	result	 => SumOfElements_0_0_add_1_7_f_q
   	);
    SumOfElements_0_0_add_1_7_f_p <= not SumOfElements_0_0_add_1_7_f_q(41 downto 41);
    SumOfElements_0_0_add_1_7_f_n <= SumOfElements_0_0_add_1_7_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_7_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_14_f_q);
    SumOfElements_0_0_add_1_7_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_15_f_q);
    SumOfElements_0_0_add_1_7_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_7_f_q);
    -- synopsys translate on

	--Mult_27_f(FLOATMULT,229)@0
    Mult_27_f_reset <= areset;
    Mult_27_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_27_f_reset,
    		dataa	 => datain_a_27,
    		datab	 => datain_b_27,
    		result	 => Mult_27_f_q
    	);
    -- synopsys translate off
    Mult_27_f_a_real <= sIEEE_2_real(datain_a_27);
    Mult_27_f_b_real <= sIEEE_2_real(datain_b_27);
    Mult_27_f_q_real <= sInternalSM_2_real(Mult_27_f_q);
    -- synopsys translate on

	--Mult_26_f(FLOATMULT,228)@0
    Mult_26_f_reset <= areset;
    Mult_26_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_26_f_reset,
    		dataa	 => datain_a_26,
    		datab	 => datain_b_26,
    		result	 => Mult_26_f_q
    	);
    -- synopsys translate off
    Mult_26_f_a_real <= sIEEE_2_real(datain_a_26);
    Mult_26_f_b_real <= sIEEE_2_real(datain_b_26);
    Mult_26_f_q_real <= sInternalSM_2_real(Mult_26_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_13_f(FLOATADDSUB,294)@3
    SumOfElements_0_0_add_0_13_f_reset <= areset;
    SumOfElements_0_0_add_0_13_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_13_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_13_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_13_f_reset,
    	dataa	 => Mult_26_f_q,
    	datab	 => Mult_27_f_q,
    	result	 => SumOfElements_0_0_add_0_13_f_q
   	);
    SumOfElements_0_0_add_0_13_f_p <= not SumOfElements_0_0_add_0_13_f_q(41 downto 41);
    SumOfElements_0_0_add_0_13_f_n <= SumOfElements_0_0_add_0_13_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_13_f_a_real <= sInternalSM_2_real(Mult_26_f_q);
    SumOfElements_0_0_add_0_13_f_b_real <= sInternalSM_2_real(Mult_27_f_q);
    SumOfElements_0_0_add_0_13_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_13_f_q);
    -- synopsys translate on

	--Mult_25_f(FLOATMULT,227)@0
    Mult_25_f_reset <= areset;
    Mult_25_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_25_f_reset,
    		dataa	 => datain_a_25,
    		datab	 => datain_b_25,
    		result	 => Mult_25_f_q
    	);
    -- synopsys translate off
    Mult_25_f_a_real <= sIEEE_2_real(datain_a_25);
    Mult_25_f_b_real <= sIEEE_2_real(datain_b_25);
    Mult_25_f_q_real <= sInternalSM_2_real(Mult_25_f_q);
    -- synopsys translate on

	--Mult_24_f(FLOATMULT,226)@0
    Mult_24_f_reset <= areset;
    Mult_24_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_24_f_reset,
    		dataa	 => datain_a_24,
    		datab	 => datain_b_24,
    		result	 => Mult_24_f_q
    	);
    -- synopsys translate off
    Mult_24_f_a_real <= sIEEE_2_real(datain_a_24);
    Mult_24_f_b_real <= sIEEE_2_real(datain_b_24);
    Mult_24_f_q_real <= sInternalSM_2_real(Mult_24_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_12_f(FLOATADDSUB,292)@3
    SumOfElements_0_0_add_0_12_f_reset <= areset;
    SumOfElements_0_0_add_0_12_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_12_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_12_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_12_f_reset,
    	dataa	 => Mult_24_f_q,
    	datab	 => Mult_25_f_q,
    	result	 => SumOfElements_0_0_add_0_12_f_q
   	);
    SumOfElements_0_0_add_0_12_f_p <= not SumOfElements_0_0_add_0_12_f_q(41 downto 41);
    SumOfElements_0_0_add_0_12_f_n <= SumOfElements_0_0_add_0_12_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_12_f_a_real <= sInternalSM_2_real(Mult_24_f_q);
    SumOfElements_0_0_add_0_12_f_b_real <= sInternalSM_2_real(Mult_25_f_q);
    SumOfElements_0_0_add_0_12_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_12_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_6_f(FLOATADDSUB,344)@8
    SumOfElements_0_0_add_1_6_f_reset <= areset;
    SumOfElements_0_0_add_1_6_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_6_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_6_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_6_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_12_f_q,
    	datab	 => SumOfElements_0_0_add_0_13_f_q,
    	result	 => SumOfElements_0_0_add_1_6_f_q
   	);
    SumOfElements_0_0_add_1_6_f_p <= not SumOfElements_0_0_add_1_6_f_q(41 downto 41);
    SumOfElements_0_0_add_1_6_f_n <= SumOfElements_0_0_add_1_6_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_6_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_12_f_q);
    SumOfElements_0_0_add_1_6_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_13_f_q);
    SumOfElements_0_0_add_1_6_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_6_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_2_3_f(FLOATADDSUB,370)@13
    SumOfElements_0_0_add_2_3_f_reset <= areset;
    SumOfElements_0_0_add_2_3_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_2_3_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_2_3_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_2_3_f_reset,
    	dataa	 => SumOfElements_0_0_add_1_6_f_q,
    	datab	 => SumOfElements_0_0_add_1_7_f_q,
    	result	 => SumOfElements_0_0_add_2_3_f_q
   	);
    SumOfElements_0_0_add_2_3_f_p <= not SumOfElements_0_0_add_2_3_f_q(41 downto 41);
    SumOfElements_0_0_add_2_3_f_n <= SumOfElements_0_0_add_2_3_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_2_3_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_1_6_f_q);
    SumOfElements_0_0_add_2_3_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_1_7_f_q);
    SumOfElements_0_0_add_2_3_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_2_3_f_q);
    -- synopsys translate on

	--Mult_23_f(FLOATMULT,225)@0
    Mult_23_f_reset <= areset;
    Mult_23_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_23_f_reset,
    		dataa	 => datain_a_23,
    		datab	 => datain_b_23,
    		result	 => Mult_23_f_q
    	);
    -- synopsys translate off
    Mult_23_f_a_real <= sIEEE_2_real(datain_a_23);
    Mult_23_f_b_real <= sIEEE_2_real(datain_b_23);
    Mult_23_f_q_real <= sInternalSM_2_real(Mult_23_f_q);
    -- synopsys translate on

	--Mult_22_f(FLOATMULT,224)@0
    Mult_22_f_reset <= areset;
    Mult_22_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_22_f_reset,
    		dataa	 => datain_a_22,
    		datab	 => datain_b_22,
    		result	 => Mult_22_f_q
    	);
    -- synopsys translate off
    Mult_22_f_a_real <= sIEEE_2_real(datain_a_22);
    Mult_22_f_b_real <= sIEEE_2_real(datain_b_22);
    Mult_22_f_q_real <= sInternalSM_2_real(Mult_22_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_11_f(FLOATADDSUB,290)@3
    SumOfElements_0_0_add_0_11_f_reset <= areset;
    SumOfElements_0_0_add_0_11_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_11_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_11_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_11_f_reset,
    	dataa	 => Mult_22_f_q,
    	datab	 => Mult_23_f_q,
    	result	 => SumOfElements_0_0_add_0_11_f_q
   	);
    SumOfElements_0_0_add_0_11_f_p <= not SumOfElements_0_0_add_0_11_f_q(41 downto 41);
    SumOfElements_0_0_add_0_11_f_n <= SumOfElements_0_0_add_0_11_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_11_f_a_real <= sInternalSM_2_real(Mult_22_f_q);
    SumOfElements_0_0_add_0_11_f_b_real <= sInternalSM_2_real(Mult_23_f_q);
    SumOfElements_0_0_add_0_11_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_11_f_q);
    -- synopsys translate on

	--Mult_21_f(FLOATMULT,223)@0
    Mult_21_f_reset <= areset;
    Mult_21_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_21_f_reset,
    		dataa	 => datain_a_21,
    		datab	 => datain_b_21,
    		result	 => Mult_21_f_q
    	);
    -- synopsys translate off
    Mult_21_f_a_real <= sIEEE_2_real(datain_a_21);
    Mult_21_f_b_real <= sIEEE_2_real(datain_b_21);
    Mult_21_f_q_real <= sInternalSM_2_real(Mult_21_f_q);
    -- synopsys translate on

	--Mult_20_f(FLOATMULT,222)@0
    Mult_20_f_reset <= areset;
    Mult_20_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_20_f_reset,
    		dataa	 => datain_a_20,
    		datab	 => datain_b_20,
    		result	 => Mult_20_f_q
    	);
    -- synopsys translate off
    Mult_20_f_a_real <= sIEEE_2_real(datain_a_20);
    Mult_20_f_b_real <= sIEEE_2_real(datain_b_20);
    Mult_20_f_q_real <= sInternalSM_2_real(Mult_20_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_10_f(FLOATADDSUB,288)@3
    SumOfElements_0_0_add_0_10_f_reset <= areset;
    SumOfElements_0_0_add_0_10_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_10_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_10_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_10_f_reset,
    	dataa	 => Mult_20_f_q,
    	datab	 => Mult_21_f_q,
    	result	 => SumOfElements_0_0_add_0_10_f_q
   	);
    SumOfElements_0_0_add_0_10_f_p <= not SumOfElements_0_0_add_0_10_f_q(41 downto 41);
    SumOfElements_0_0_add_0_10_f_n <= SumOfElements_0_0_add_0_10_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_10_f_a_real <= sInternalSM_2_real(Mult_20_f_q);
    SumOfElements_0_0_add_0_10_f_b_real <= sInternalSM_2_real(Mult_21_f_q);
    SumOfElements_0_0_add_0_10_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_10_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_5_f(FLOATADDSUB,342)@8
    SumOfElements_0_0_add_1_5_f_reset <= areset;
    SumOfElements_0_0_add_1_5_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_5_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_5_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_5_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_10_f_q,
    	datab	 => SumOfElements_0_0_add_0_11_f_q,
    	result	 => SumOfElements_0_0_add_1_5_f_q
   	);
    SumOfElements_0_0_add_1_5_f_p <= not SumOfElements_0_0_add_1_5_f_q(41 downto 41);
    SumOfElements_0_0_add_1_5_f_n <= SumOfElements_0_0_add_1_5_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_5_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_10_f_q);
    SumOfElements_0_0_add_1_5_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_11_f_q);
    SumOfElements_0_0_add_1_5_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_5_f_q);
    -- synopsys translate on

	--Mult_19_f(FLOATMULT,221)@0
    Mult_19_f_reset <= areset;
    Mult_19_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_19_f_reset,
    		dataa	 => datain_a_19,
    		datab	 => datain_b_19,
    		result	 => Mult_19_f_q
    	);
    -- synopsys translate off
    Mult_19_f_a_real <= sIEEE_2_real(datain_a_19);
    Mult_19_f_b_real <= sIEEE_2_real(datain_b_19);
    Mult_19_f_q_real <= sInternalSM_2_real(Mult_19_f_q);
    -- synopsys translate on

	--Mult_18_f(FLOATMULT,220)@0
    Mult_18_f_reset <= areset;
    Mult_18_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_18_f_reset,
    		dataa	 => datain_a_18,
    		datab	 => datain_b_18,
    		result	 => Mult_18_f_q
    	);
    -- synopsys translate off
    Mult_18_f_a_real <= sIEEE_2_real(datain_a_18);
    Mult_18_f_b_real <= sIEEE_2_real(datain_b_18);
    Mult_18_f_q_real <= sInternalSM_2_real(Mult_18_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_9_f(FLOATADDSUB,286)@3
    SumOfElements_0_0_add_0_9_f_reset <= areset;
    SumOfElements_0_0_add_0_9_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_9_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_9_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_9_f_reset,
    	dataa	 => Mult_18_f_q,
    	datab	 => Mult_19_f_q,
    	result	 => SumOfElements_0_0_add_0_9_f_q
   	);
    SumOfElements_0_0_add_0_9_f_p <= not SumOfElements_0_0_add_0_9_f_q(41 downto 41);
    SumOfElements_0_0_add_0_9_f_n <= SumOfElements_0_0_add_0_9_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_9_f_a_real <= sInternalSM_2_real(Mult_18_f_q);
    SumOfElements_0_0_add_0_9_f_b_real <= sInternalSM_2_real(Mult_19_f_q);
    SumOfElements_0_0_add_0_9_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_9_f_q);
    -- synopsys translate on

	--Mult_17_f(FLOATMULT,219)@0
    Mult_17_f_reset <= areset;
    Mult_17_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_17_f_reset,
    		dataa	 => datain_a_17,
    		datab	 => datain_b_17,
    		result	 => Mult_17_f_q
    	);
    -- synopsys translate off
    Mult_17_f_a_real <= sIEEE_2_real(datain_a_17);
    Mult_17_f_b_real <= sIEEE_2_real(datain_b_17);
    Mult_17_f_q_real <= sInternalSM_2_real(Mult_17_f_q);
    -- synopsys translate on

	--Mult_16_f(FLOATMULT,218)@0
    Mult_16_f_reset <= areset;
    Mult_16_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_16_f_reset,
    		dataa	 => datain_a_16,
    		datab	 => datain_b_16,
    		result	 => Mult_16_f_q
    	);
    -- synopsys translate off
    Mult_16_f_a_real <= sIEEE_2_real(datain_a_16);
    Mult_16_f_b_real <= sIEEE_2_real(datain_b_16);
    Mult_16_f_q_real <= sInternalSM_2_real(Mult_16_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_8_f(FLOATADDSUB,284)@3
    SumOfElements_0_0_add_0_8_f_reset <= areset;
    SumOfElements_0_0_add_0_8_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_8_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_8_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_8_f_reset,
    	dataa	 => Mult_16_f_q,
    	datab	 => Mult_17_f_q,
    	result	 => SumOfElements_0_0_add_0_8_f_q
   	);
    SumOfElements_0_0_add_0_8_f_p <= not SumOfElements_0_0_add_0_8_f_q(41 downto 41);
    SumOfElements_0_0_add_0_8_f_n <= SumOfElements_0_0_add_0_8_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_8_f_a_real <= sInternalSM_2_real(Mult_16_f_q);
    SumOfElements_0_0_add_0_8_f_b_real <= sInternalSM_2_real(Mult_17_f_q);
    SumOfElements_0_0_add_0_8_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_8_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_4_f(FLOATADDSUB,340)@8
    SumOfElements_0_0_add_1_4_f_reset <= areset;
    SumOfElements_0_0_add_1_4_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_4_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_4_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_4_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_8_f_q,
    	datab	 => SumOfElements_0_0_add_0_9_f_q,
    	result	 => SumOfElements_0_0_add_1_4_f_q
   	);
    SumOfElements_0_0_add_1_4_f_p <= not SumOfElements_0_0_add_1_4_f_q(41 downto 41);
    SumOfElements_0_0_add_1_4_f_n <= SumOfElements_0_0_add_1_4_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_4_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_8_f_q);
    SumOfElements_0_0_add_1_4_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_9_f_q);
    SumOfElements_0_0_add_1_4_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_4_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_2_2_f(FLOATADDSUB,368)@13
    SumOfElements_0_0_add_2_2_f_reset <= areset;
    SumOfElements_0_0_add_2_2_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_2_2_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_2_2_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_2_2_f_reset,
    	dataa	 => SumOfElements_0_0_add_1_4_f_q,
    	datab	 => SumOfElements_0_0_add_1_5_f_q,
    	result	 => SumOfElements_0_0_add_2_2_f_q
   	);
    SumOfElements_0_0_add_2_2_f_p <= not SumOfElements_0_0_add_2_2_f_q(41 downto 41);
    SumOfElements_0_0_add_2_2_f_n <= SumOfElements_0_0_add_2_2_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_2_2_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_1_4_f_q);
    SumOfElements_0_0_add_2_2_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_1_5_f_q);
    SumOfElements_0_0_add_2_2_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_2_2_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_3_1_f(FLOATADDSUB,382)@18
    SumOfElements_0_0_add_3_1_f_reset <= areset;
    SumOfElements_0_0_add_3_1_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_3_1_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_3_1_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_3_1_f_reset,
    	dataa	 => SumOfElements_0_0_add_2_2_f_q,
    	datab	 => SumOfElements_0_0_add_2_3_f_q,
    	result	 => SumOfElements_0_0_add_3_1_f_q
   	);
    SumOfElements_0_0_add_3_1_f_p <= not SumOfElements_0_0_add_3_1_f_q(41 downto 41);
    SumOfElements_0_0_add_3_1_f_n <= SumOfElements_0_0_add_3_1_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_3_1_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_2_2_f_q);
    SumOfElements_0_0_add_3_1_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_2_3_f_q);
    SumOfElements_0_0_add_3_1_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_3_1_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_3_1_f_0_norm_SumOfElements_0_0_add_4_0_f_1((null),393)@23
    SumOfElements_0_0_add_3_1_f_0_norm_SumOfElements_0_0_add_4_0_f_1_reset <= areset;
    SumOfElements_0_0_add_3_1_f_0_norm_SumOfElements_0_0_add_4_0_f_1_inst : fp_norm_sInternal_2_sInternal
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => SumOfElements_0_0_add_3_1_f_0_norm_SumOfElements_0_0_add_4_0_f_1_reset,
    		dataa	 => SumOfElements_0_0_add_3_1_f_q,
    		result	 => SumOfElements_0_0_add_3_1_f_0_norm_SumOfElements_0_0_add_4_0_f_1_q
    	);
    -- synopsys translate off
    SumOfElements_0_0_add_3_1_f_0_norm_SumOfElements_0_0_add_4_0_f_1_q_real <= sInternal_2_real(SumOfElements_0_0_add_3_1_f_0_norm_SumOfElements_0_0_add_4_0_f_1_q);
    -- synopsys translate on

	--Mult_15_f(FLOATMULT,217)@0
    Mult_15_f_reset <= areset;
    Mult_15_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_15_f_reset,
    		dataa	 => datain_a_15,
    		datab	 => datain_b_15,
    		result	 => Mult_15_f_q
    	);
    -- synopsys translate off
    Mult_15_f_a_real <= sIEEE_2_real(datain_a_15);
    Mult_15_f_b_real <= sIEEE_2_real(datain_b_15);
    Mult_15_f_q_real <= sInternalSM_2_real(Mult_15_f_q);
    -- synopsys translate on

	--Mult_14_f(FLOATMULT,216)@0
    Mult_14_f_reset <= areset;
    Mult_14_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_14_f_reset,
    		dataa	 => datain_a_14,
    		datab	 => datain_b_14,
    		result	 => Mult_14_f_q
    	);
    -- synopsys translate off
    Mult_14_f_a_real <= sIEEE_2_real(datain_a_14);
    Mult_14_f_b_real <= sIEEE_2_real(datain_b_14);
    Mult_14_f_q_real <= sInternalSM_2_real(Mult_14_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_7_f(FLOATADDSUB,282)@3
    SumOfElements_0_0_add_0_7_f_reset <= areset;
    SumOfElements_0_0_add_0_7_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_7_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_7_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_7_f_reset,
    	dataa	 => Mult_14_f_q,
    	datab	 => Mult_15_f_q,
    	result	 => SumOfElements_0_0_add_0_7_f_q
   	);
    SumOfElements_0_0_add_0_7_f_p <= not SumOfElements_0_0_add_0_7_f_q(41 downto 41);
    SumOfElements_0_0_add_0_7_f_n <= SumOfElements_0_0_add_0_7_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_7_f_a_real <= sInternalSM_2_real(Mult_14_f_q);
    SumOfElements_0_0_add_0_7_f_b_real <= sInternalSM_2_real(Mult_15_f_q);
    SumOfElements_0_0_add_0_7_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_7_f_q);
    -- synopsys translate on

	--Mult_13_f(FLOATMULT,215)@0
    Mult_13_f_reset <= areset;
    Mult_13_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_13_f_reset,
    		dataa	 => datain_a_13,
    		datab	 => datain_b_13,
    		result	 => Mult_13_f_q
    	);
    -- synopsys translate off
    Mult_13_f_a_real <= sIEEE_2_real(datain_a_13);
    Mult_13_f_b_real <= sIEEE_2_real(datain_b_13);
    Mult_13_f_q_real <= sInternalSM_2_real(Mult_13_f_q);
    -- synopsys translate on

	--Mult_12_f(FLOATMULT,214)@0
    Mult_12_f_reset <= areset;
    Mult_12_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_12_f_reset,
    		dataa	 => datain_a_12,
    		datab	 => datain_b_12,
    		result	 => Mult_12_f_q
    	);
    -- synopsys translate off
    Mult_12_f_a_real <= sIEEE_2_real(datain_a_12);
    Mult_12_f_b_real <= sIEEE_2_real(datain_b_12);
    Mult_12_f_q_real <= sInternalSM_2_real(Mult_12_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_6_f(FLOATADDSUB,280)@3
    SumOfElements_0_0_add_0_6_f_reset <= areset;
    SumOfElements_0_0_add_0_6_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_6_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_6_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_6_f_reset,
    	dataa	 => Mult_12_f_q,
    	datab	 => Mult_13_f_q,
    	result	 => SumOfElements_0_0_add_0_6_f_q
   	);
    SumOfElements_0_0_add_0_6_f_p <= not SumOfElements_0_0_add_0_6_f_q(41 downto 41);
    SumOfElements_0_0_add_0_6_f_n <= SumOfElements_0_0_add_0_6_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_6_f_a_real <= sInternalSM_2_real(Mult_12_f_q);
    SumOfElements_0_0_add_0_6_f_b_real <= sInternalSM_2_real(Mult_13_f_q);
    SumOfElements_0_0_add_0_6_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_6_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_3_f(FLOATADDSUB,338)@8
    SumOfElements_0_0_add_1_3_f_reset <= areset;
    SumOfElements_0_0_add_1_3_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_3_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_3_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_3_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_6_f_q,
    	datab	 => SumOfElements_0_0_add_0_7_f_q,
    	result	 => SumOfElements_0_0_add_1_3_f_q
   	);
    SumOfElements_0_0_add_1_3_f_p <= not SumOfElements_0_0_add_1_3_f_q(41 downto 41);
    SumOfElements_0_0_add_1_3_f_n <= SumOfElements_0_0_add_1_3_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_3_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_6_f_q);
    SumOfElements_0_0_add_1_3_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_7_f_q);
    SumOfElements_0_0_add_1_3_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_3_f_q);
    -- synopsys translate on

	--Mult_11_f(FLOATMULT,213)@0
    Mult_11_f_reset <= areset;
    Mult_11_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_11_f_reset,
    		dataa	 => datain_a_11,
    		datab	 => datain_b_11,
    		result	 => Mult_11_f_q
    	);
    -- synopsys translate off
    Mult_11_f_a_real <= sIEEE_2_real(datain_a_11);
    Mult_11_f_b_real <= sIEEE_2_real(datain_b_11);
    Mult_11_f_q_real <= sInternalSM_2_real(Mult_11_f_q);
    -- synopsys translate on

	--Mult_10_f(FLOATMULT,212)@0
    Mult_10_f_reset <= areset;
    Mult_10_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_10_f_reset,
    		dataa	 => datain_a_10,
    		datab	 => datain_b_10,
    		result	 => Mult_10_f_q
    	);
    -- synopsys translate off
    Mult_10_f_a_real <= sIEEE_2_real(datain_a_10);
    Mult_10_f_b_real <= sIEEE_2_real(datain_b_10);
    Mult_10_f_q_real <= sInternalSM_2_real(Mult_10_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_5_f(FLOATADDSUB,278)@3
    SumOfElements_0_0_add_0_5_f_reset <= areset;
    SumOfElements_0_0_add_0_5_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_5_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_5_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_5_f_reset,
    	dataa	 => Mult_10_f_q,
    	datab	 => Mult_11_f_q,
    	result	 => SumOfElements_0_0_add_0_5_f_q
   	);
    SumOfElements_0_0_add_0_5_f_p <= not SumOfElements_0_0_add_0_5_f_q(41 downto 41);
    SumOfElements_0_0_add_0_5_f_n <= SumOfElements_0_0_add_0_5_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_5_f_a_real <= sInternalSM_2_real(Mult_10_f_q);
    SumOfElements_0_0_add_0_5_f_b_real <= sInternalSM_2_real(Mult_11_f_q);
    SumOfElements_0_0_add_0_5_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_5_f_q);
    -- synopsys translate on

	--Mult_9_f(FLOATMULT,211)@0
    Mult_9_f_reset <= areset;
    Mult_9_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_9_f_reset,
    		dataa	 => datain_a_09,
    		datab	 => datain_b_09,
    		result	 => Mult_9_f_q
    	);
    -- synopsys translate off
    Mult_9_f_a_real <= sIEEE_2_real(datain_a_09);
    Mult_9_f_b_real <= sIEEE_2_real(datain_b_09);
    Mult_9_f_q_real <= sInternalSM_2_real(Mult_9_f_q);
    -- synopsys translate on

	--Mult_8_f(FLOATMULT,210)@0
    Mult_8_f_reset <= areset;
    Mult_8_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_8_f_reset,
    		dataa	 => datain_a_08,
    		datab	 => datain_b_08,
    		result	 => Mult_8_f_q
    	);
    -- synopsys translate off
    Mult_8_f_a_real <= sIEEE_2_real(datain_a_08);
    Mult_8_f_b_real <= sIEEE_2_real(datain_b_08);
    Mult_8_f_q_real <= sInternalSM_2_real(Mult_8_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_4_f(FLOATADDSUB,276)@3
    SumOfElements_0_0_add_0_4_f_reset <= areset;
    SumOfElements_0_0_add_0_4_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_4_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_4_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_4_f_reset,
    	dataa	 => Mult_8_f_q,
    	datab	 => Mult_9_f_q,
    	result	 => SumOfElements_0_0_add_0_4_f_q
   	);
    SumOfElements_0_0_add_0_4_f_p <= not SumOfElements_0_0_add_0_4_f_q(41 downto 41);
    SumOfElements_0_0_add_0_4_f_n <= SumOfElements_0_0_add_0_4_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_4_f_a_real <= sInternalSM_2_real(Mult_8_f_q);
    SumOfElements_0_0_add_0_4_f_b_real <= sInternalSM_2_real(Mult_9_f_q);
    SumOfElements_0_0_add_0_4_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_4_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_2_f(FLOATADDSUB,336)@8
    SumOfElements_0_0_add_1_2_f_reset <= areset;
    SumOfElements_0_0_add_1_2_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_2_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_2_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_2_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_4_f_q,
    	datab	 => SumOfElements_0_0_add_0_5_f_q,
    	result	 => SumOfElements_0_0_add_1_2_f_q
   	);
    SumOfElements_0_0_add_1_2_f_p <= not SumOfElements_0_0_add_1_2_f_q(41 downto 41);
    SumOfElements_0_0_add_1_2_f_n <= SumOfElements_0_0_add_1_2_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_2_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_4_f_q);
    SumOfElements_0_0_add_1_2_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_5_f_q);
    SumOfElements_0_0_add_1_2_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_2_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_2_1_f(FLOATADDSUB,366)@13
    SumOfElements_0_0_add_2_1_f_reset <= areset;
    SumOfElements_0_0_add_2_1_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_2_1_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_2_1_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_2_1_f_reset,
    	dataa	 => SumOfElements_0_0_add_1_2_f_q,
    	datab	 => SumOfElements_0_0_add_1_3_f_q,
    	result	 => SumOfElements_0_0_add_2_1_f_q
   	);
    SumOfElements_0_0_add_2_1_f_p <= not SumOfElements_0_0_add_2_1_f_q(41 downto 41);
    SumOfElements_0_0_add_2_1_f_n <= SumOfElements_0_0_add_2_1_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_2_1_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_1_2_f_q);
    SumOfElements_0_0_add_2_1_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_1_3_f_q);
    SumOfElements_0_0_add_2_1_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_2_1_f_q);
    -- synopsys translate on

	--Mult_7_f(FLOATMULT,209)@0
    Mult_7_f_reset <= areset;
    Mult_7_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_7_f_reset,
    		dataa	 => datain_a_07,
    		datab	 => datain_b_07,
    		result	 => Mult_7_f_q
    	);
    -- synopsys translate off
    Mult_7_f_a_real <= sIEEE_2_real(datain_a_07);
    Mult_7_f_b_real <= sIEEE_2_real(datain_b_07);
    Mult_7_f_q_real <= sInternalSM_2_real(Mult_7_f_q);
    -- synopsys translate on

	--Mult_6_f(FLOATMULT,208)@0
    Mult_6_f_reset <= areset;
    Mult_6_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_6_f_reset,
    		dataa	 => datain_a_06,
    		datab	 => datain_b_06,
    		result	 => Mult_6_f_q
    	);
    -- synopsys translate off
    Mult_6_f_a_real <= sIEEE_2_real(datain_a_06);
    Mult_6_f_b_real <= sIEEE_2_real(datain_b_06);
    Mult_6_f_q_real <= sInternalSM_2_real(Mult_6_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_3_f(FLOATADDSUB,274)@3
    SumOfElements_0_0_add_0_3_f_reset <= areset;
    SumOfElements_0_0_add_0_3_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_3_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_3_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_3_f_reset,
    	dataa	 => Mult_6_f_q,
    	datab	 => Mult_7_f_q,
    	result	 => SumOfElements_0_0_add_0_3_f_q
   	);
    SumOfElements_0_0_add_0_3_f_p <= not SumOfElements_0_0_add_0_3_f_q(41 downto 41);
    SumOfElements_0_0_add_0_3_f_n <= SumOfElements_0_0_add_0_3_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_3_f_a_real <= sInternalSM_2_real(Mult_6_f_q);
    SumOfElements_0_0_add_0_3_f_b_real <= sInternalSM_2_real(Mult_7_f_q);
    SumOfElements_0_0_add_0_3_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_3_f_q);
    -- synopsys translate on

	--Mult_5_f(FLOATMULT,207)@0
    Mult_5_f_reset <= areset;
    Mult_5_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_5_f_reset,
    		dataa	 => datain_a_05,
    		datab	 => datain_b_05,
    		result	 => Mult_5_f_q
    	);
    -- synopsys translate off
    Mult_5_f_a_real <= sIEEE_2_real(datain_a_05);
    Mult_5_f_b_real <= sIEEE_2_real(datain_b_05);
    Mult_5_f_q_real <= sInternalSM_2_real(Mult_5_f_q);
    -- synopsys translate on

	--Mult_4_f(FLOATMULT,206)@0
    Mult_4_f_reset <= areset;
    Mult_4_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_4_f_reset,
    		dataa	 => datain_a_04,
    		datab	 => datain_b_04,
    		result	 => Mult_4_f_q
    	);
    -- synopsys translate off
    Mult_4_f_a_real <= sIEEE_2_real(datain_a_04);
    Mult_4_f_b_real <= sIEEE_2_real(datain_b_04);
    Mult_4_f_q_real <= sInternalSM_2_real(Mult_4_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_2_f(FLOATADDSUB,272)@3
    SumOfElements_0_0_add_0_2_f_reset <= areset;
    SumOfElements_0_0_add_0_2_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_2_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_2_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_2_f_reset,
    	dataa	 => Mult_4_f_q,
    	datab	 => Mult_5_f_q,
    	result	 => SumOfElements_0_0_add_0_2_f_q
   	);
    SumOfElements_0_0_add_0_2_f_p <= not SumOfElements_0_0_add_0_2_f_q(41 downto 41);
    SumOfElements_0_0_add_0_2_f_n <= SumOfElements_0_0_add_0_2_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_2_f_a_real <= sInternalSM_2_real(Mult_4_f_q);
    SumOfElements_0_0_add_0_2_f_b_real <= sInternalSM_2_real(Mult_5_f_q);
    SumOfElements_0_0_add_0_2_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_2_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_1_f(FLOATADDSUB,334)@8
    SumOfElements_0_0_add_1_1_f_reset <= areset;
    SumOfElements_0_0_add_1_1_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_1_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_1_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_1_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_2_f_q,
    	datab	 => SumOfElements_0_0_add_0_3_f_q,
    	result	 => SumOfElements_0_0_add_1_1_f_q
   	);
    SumOfElements_0_0_add_1_1_f_p <= not SumOfElements_0_0_add_1_1_f_q(41 downto 41);
    SumOfElements_0_0_add_1_1_f_n <= SumOfElements_0_0_add_1_1_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_1_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_2_f_q);
    SumOfElements_0_0_add_1_1_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_3_f_q);
    SumOfElements_0_0_add_1_1_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_1_f_q);
    -- synopsys translate on

	--Mult_3_f(FLOATMULT,205)@0
    Mult_3_f_reset <= areset;
    Mult_3_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_3_f_reset,
    		dataa	 => datain_a_03,
    		datab	 => datain_b_03,
    		result	 => Mult_3_f_q
    	);
    -- synopsys translate off
    Mult_3_f_a_real <= sIEEE_2_real(datain_a_03);
    Mult_3_f_b_real <= sIEEE_2_real(datain_b_03);
    Mult_3_f_q_real <= sInternalSM_2_real(Mult_3_f_q);
    -- synopsys translate on

	--Mult_2_f(FLOATMULT,204)@0
    Mult_2_f_reset <= areset;
    Mult_2_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_2_f_reset,
    		dataa	 => datain_a_02,
    		datab	 => datain_b_02,
    		result	 => Mult_2_f_q
    	);
    -- synopsys translate off
    Mult_2_f_a_real <= sIEEE_2_real(datain_a_02);
    Mult_2_f_b_real <= sIEEE_2_real(datain_b_02);
    Mult_2_f_q_real <= sInternalSM_2_real(Mult_2_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_1_f(FLOATADDSUB,270)@3
    SumOfElements_0_0_add_0_1_f_reset <= areset;
    SumOfElements_0_0_add_0_1_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_1_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_1_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_1_f_reset,
    	dataa	 => Mult_2_f_q,
    	datab	 => Mult_3_f_q,
    	result	 => SumOfElements_0_0_add_0_1_f_q
   	);
    SumOfElements_0_0_add_0_1_f_p <= not SumOfElements_0_0_add_0_1_f_q(41 downto 41);
    SumOfElements_0_0_add_0_1_f_n <= SumOfElements_0_0_add_0_1_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_1_f_a_real <= sInternalSM_2_real(Mult_2_f_q);
    SumOfElements_0_0_add_0_1_f_b_real <= sInternalSM_2_real(Mult_3_f_q);
    SumOfElements_0_0_add_0_1_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_1_f_q);
    -- synopsys translate on

	--Mult_1_f(FLOATMULT,203)@0
    Mult_1_f_reset <= areset;
    Mult_1_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_1_f_reset,
    		dataa	 => datain_a_01,
    		datab	 => datain_b_01,
    		result	 => Mult_1_f_q
    	);
    -- synopsys translate off
    Mult_1_f_a_real <= sIEEE_2_real(datain_a_01);
    Mult_1_f_b_real <= sIEEE_2_real(datain_b_01);
    Mult_1_f_q_real <= sInternalSM_2_real(Mult_1_f_q);
    -- synopsys translate on

	--Mult_0_f(FLOATMULT,202)@0
    Mult_0_f_reset <= areset;
    Mult_0_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix V", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => Mult_0_f_reset,
    		dataa	 => datain_a_00,
    		datab	 => datain_b_00,
    		result	 => Mult_0_f_q
    	);
    -- synopsys translate off
    Mult_0_f_a_real <= sIEEE_2_real(datain_a_00);
    Mult_0_f_b_real <= sIEEE_2_real(datain_b_00);
    Mult_0_f_q_real <= sInternalSM_2_real(Mult_0_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_0_0_f(FLOATADDSUB,268)@3
    SumOfElements_0_0_add_0_0_f_reset <= areset;
    SumOfElements_0_0_add_0_0_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_0_0_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_0_0_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_0_0_f_reset,
    	dataa	 => Mult_0_f_q,
    	datab	 => Mult_1_f_q,
    	result	 => SumOfElements_0_0_add_0_0_f_q
   	);
    SumOfElements_0_0_add_0_0_f_p <= not SumOfElements_0_0_add_0_0_f_q(41 downto 41);
    SumOfElements_0_0_add_0_0_f_n <= SumOfElements_0_0_add_0_0_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_0_0_f_a_real <= sInternalSM_2_real(Mult_0_f_q);
    SumOfElements_0_0_add_0_0_f_b_real <= sInternalSM_2_real(Mult_1_f_q);
    SumOfElements_0_0_add_0_0_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_0_0_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_1_0_f(FLOATADDSUB,332)@8
    SumOfElements_0_0_add_1_0_f_reset <= areset;
    SumOfElements_0_0_add_1_0_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_1_0_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_1_0_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_1_0_f_reset,
    	dataa	 => SumOfElements_0_0_add_0_0_f_q,
    	datab	 => SumOfElements_0_0_add_0_1_f_q,
    	result	 => SumOfElements_0_0_add_1_0_f_q
   	);
    SumOfElements_0_0_add_1_0_f_p <= not SumOfElements_0_0_add_1_0_f_q(41 downto 41);
    SumOfElements_0_0_add_1_0_f_n <= SumOfElements_0_0_add_1_0_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_1_0_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_0_0_f_q);
    SumOfElements_0_0_add_1_0_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_0_1_f_q);
    SumOfElements_0_0_add_1_0_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_1_0_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_2_0_f(FLOATADDSUB,364)@13
    SumOfElements_0_0_add_2_0_f_reset <= areset;
    SumOfElements_0_0_add_2_0_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_2_0_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_2_0_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_2_0_f_reset,
    	dataa	 => SumOfElements_0_0_add_1_0_f_q,
    	datab	 => SumOfElements_0_0_add_1_1_f_q,
    	result	 => SumOfElements_0_0_add_2_0_f_q
   	);
    SumOfElements_0_0_add_2_0_f_p <= not SumOfElements_0_0_add_2_0_f_q(41 downto 41);
    SumOfElements_0_0_add_2_0_f_n <= SumOfElements_0_0_add_2_0_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_2_0_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_1_0_f_q);
    SumOfElements_0_0_add_2_0_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_1_1_f_q);
    SumOfElements_0_0_add_2_0_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_2_0_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_3_0_f(FLOATADDSUB,380)@18
    SumOfElements_0_0_add_3_0_f_reset <= areset;
    SumOfElements_0_0_add_3_0_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_3_0_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_3_0_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_3_0_f_reset,
    	dataa	 => SumOfElements_0_0_add_2_0_f_q,
    	datab	 => SumOfElements_0_0_add_2_1_f_q,
    	result	 => SumOfElements_0_0_add_3_0_f_q
   	);
    SumOfElements_0_0_add_3_0_f_p <= not SumOfElements_0_0_add_3_0_f_q(41 downto 41);
    SumOfElements_0_0_add_3_0_f_n <= SumOfElements_0_0_add_3_0_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_3_0_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_2_0_f_q);
    SumOfElements_0_0_add_3_0_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_2_1_f_q);
    SumOfElements_0_0_add_3_0_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_3_0_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_3_0_f_0_norm_SumOfElements_0_0_add_4_0_f_0((null),394)@23
    SumOfElements_0_0_add_3_0_f_0_norm_SumOfElements_0_0_add_4_0_f_0_reset <= areset;
    SumOfElements_0_0_add_3_0_f_0_norm_SumOfElements_0_0_add_4_0_f_0_inst : fp_norm_sInternal_2_sInternal
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => SumOfElements_0_0_add_3_0_f_0_norm_SumOfElements_0_0_add_4_0_f_0_reset,
    		dataa	 => SumOfElements_0_0_add_3_0_f_q,
    		result	 => SumOfElements_0_0_add_3_0_f_0_norm_SumOfElements_0_0_add_4_0_f_0_q
    	);
    -- synopsys translate off
    SumOfElements_0_0_add_3_0_f_0_norm_SumOfElements_0_0_add_4_0_f_0_q_real <= sInternal_2_real(SumOfElements_0_0_add_3_0_f_0_norm_SumOfElements_0_0_add_4_0_f_0_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_4_0_f(FLOATADDSUB,388)@28
    SumOfElements_0_0_add_4_0_f_reset <= areset;
    SumOfElements_0_0_add_4_0_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_4_0_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_4_0_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_4_0_f_reset,
    	dataa	 => SumOfElements_0_0_add_3_0_f_0_norm_SumOfElements_0_0_add_4_0_f_0_q,
    	datab	 => SumOfElements_0_0_add_3_1_f_0_norm_SumOfElements_0_0_add_4_0_f_1_q,
    	result	 => SumOfElements_0_0_add_4_0_f_q
   	);
    SumOfElements_0_0_add_4_0_f_p <= not SumOfElements_0_0_add_4_0_f_q(41 downto 41);
    SumOfElements_0_0_add_4_0_f_n <= SumOfElements_0_0_add_4_0_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_4_0_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_3_0_f_0_norm_SumOfElements_0_0_add_4_0_f_0_q);
    SumOfElements_0_0_add_4_0_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_3_1_f_0_norm_SumOfElements_0_0_add_4_0_f_1_q);
    SumOfElements_0_0_add_4_0_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_4_0_f_q);
    -- synopsys translate on

	--SumOfElements_0_0_add_5_0_f(FLOATADDSUB,392)@33
    SumOfElements_0_0_add_5_0_f_reset <= areset;
    SumOfElements_0_0_add_5_0_f_add_sub	 <= not VCC_q;
    SumOfElements_0_0_add_5_0_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => SumOfElements_0_0_add_5_0_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => SumOfElements_0_0_add_5_0_f_reset,
    	dataa	 => SumOfElements_0_0_add_4_0_f_q,
    	datab	 => SumOfElements_0_0_add_4_1_f_q,
    	result	 => SumOfElements_0_0_add_5_0_f_q
   	);
    SumOfElements_0_0_add_5_0_f_p <= not SumOfElements_0_0_add_5_0_f_q(41 downto 41);
    SumOfElements_0_0_add_5_0_f_n <= SumOfElements_0_0_add_5_0_f_q(41 downto 41);
    -- synopsys translate off
    SumOfElements_0_0_add_5_0_f_a_real <= sInternal_2_real(SumOfElements_0_0_add_4_0_f_q);
    SumOfElements_0_0_add_5_0_f_b_real <= sInternal_2_real(SumOfElements_0_0_add_4_1_f_q);
    SumOfElements_0_0_add_5_0_f_q_real <= sInternal_2_real(SumOfElements_0_0_add_5_0_f_q);
    -- synopsys translate on

	--ChannelOut_2_cast(FLOATCAST,266)@38
    ChannelOut_2_cast_reset <= areset;
    ChannelOut_2_cast_a <= SumOfElements_0_0_add_5_0_f_q;
    ChannelOut_2_cast_inst : cast_sInternal_2_sIEEE
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => ChannelOut_2_cast_reset,
    		dataa	 => ChannelOut_2_cast_a,
    		result	 => ChannelOut_2_cast_q
    	);
    -- synopsys translate off
    ChannelOut_2_cast_q_real <= sIEEE_2_real(ChannelOut_2_cast_q);
    -- synopsys translate on

	--ld_ChannelIn_valid_s_to_ChannelOut_vout_s_notEnable(LOGICAL,667)
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_notEnable_a <= VCC_q;
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_notEnable_q <= not ld_ChannelIn_valid_s_to_ChannelOut_vout_s_notEnable_a;

	--ld_ChannelIn_valid_s_to_ChannelOut_vout_s_nor(LOGICAL,668)
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_nor_a <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_notEnable_q;
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_nor_b <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_sticky_ena_q;
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_nor_q <= not (ld_ChannelIn_valid_s_to_ChannelOut_vout_s_nor_a or ld_ChannelIn_valid_s_to_ChannelOut_vout_s_nor_b);

	--ld_ChannelIn_valid_s_to_ChannelOut_vout_s_mem_top(CONSTANT,664)
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_mem_top_q <= "0101011";

	--ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmp(LOGICAL,665)
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmp_a <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_mem_top_q;
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmp_b <= STD_LOGIC_VECTOR("0" & ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdmux_q);
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmp_q <= "1" when ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmp_a = ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmp_b else "0";

	--ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmpReg(REG,666)
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmpReg_q <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmp_q;
        END IF;
    END PROCESS;


	--ld_ChannelIn_valid_s_to_ChannelOut_vout_s_sticky_ena(REG,669)
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_ChannelIn_valid_s_to_ChannelOut_vout_s_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_ChannelIn_valid_s_to_ChannelOut_vout_s_nor_q = "1") THEN
                ld_ChannelIn_valid_s_to_ChannelOut_vout_s_sticky_ena_q <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_ChannelIn_valid_s_to_ChannelOut_vout_s_enaAnd(LOGICAL,670)
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_enaAnd_a <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_sticky_ena_q;
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_enaAnd_b <= VCC_q;
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_enaAnd_q <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_enaAnd_a and ld_ChannelIn_valid_s_to_ChannelOut_vout_s_enaAnd_b;

	--ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt(COUNTER,660)
    -- every=1, low=0, high=43, step=1, init=1
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_i = 42 THEN
                  ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_eq <= '1';
                ELSE
                  ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_eq = '1') THEN
                    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_i <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_i - 43;
                ELSE
                    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_i <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_i,6));


	--ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdreg(REG,661)
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdreg_q <= "000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdreg_q <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdmux(MUX,662)
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdmux_s <= VCC_q;
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdmux: PROCESS (ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdmux_s, ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdreg_q, ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_q)
    BEGIN
            CASE ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdmux_s IS
                  WHEN "0" => ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdmux_q <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdreg_q;
                  WHEN "1" => ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdmux_q <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdcnt_q;
                  WHEN OTHERS => ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem(DUALMEM,671)
    ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_reset0 <= areset;
    ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_ia <= channel_s;
    ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_aa <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdreg_q;
    ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_ab <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdmux_q;
    ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 6,
        numwords_a => 44,
        width_b => 8,
        widthad_b => 6,
        numwords_b => 44,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_ChannelIn_valid_s_to_ChannelOut_vout_s_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_iq,
        address_a => ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_aa,
        data_a => ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_ia
    );
        ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_q <= ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_iq(7 downto 0);

	--ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem(DUALMEM,659)
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_reset0 <= areset;
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_ia <= valid_s;
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_aa <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdreg_q;
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_ab <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_rdmux_q;
    ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 44,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 44,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_ChannelIn_valid_s_to_ChannelOut_vout_s_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_iq,
        address_a => ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_aa,
        data_a => ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_ia
    );
        ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_q <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_iq(0 downto 0);

	--ChannelOut(PORTOUT,3)@45
    vout_s <= ld_ChannelIn_valid_s_to_ChannelOut_vout_s_replace_mem_q;
    cout_s <= ld_ChannelIn_channel_s_to_ChannelOut_cout_s_replace_mem_q;
    dout_s <= ChannelOut_2_cast_q;


end normal;
