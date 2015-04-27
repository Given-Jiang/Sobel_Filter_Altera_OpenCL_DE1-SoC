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

-- VHDL created from dotProduct64_dut
-- VHDL created on Fri Oct 19 16:38:38 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;
USE work.dotProduct64_safe_path.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from d:/SJ/nightly/12.1/173/w64/p4/ip/aion/src/mip_common/hw_model.cpp:1240
entity dotProduct64_dut is
    port (
        c_s : in std_logic_vector(7 downto 0);
        cout_s : out std_logic_vector(7 downto 0);
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
        dout_s : out std_logic_vector(31 downto 0);
        v_s : in std_logic_vector(0 downto 0);
        vout_s : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        h_areset : in std_logic
        );
end;

architecture normal of dotProduct64_dut is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

-- dotProduct64_dut_prim component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  valid_s <= v_s, width=1, real=0
--  channel_s <= c_s, width=8, real=0
--  datain_a_00 <= datain_a_00, width=32, real=1
--  datain_a_01 <= datain_a_01, width=32, real=1
--  datain_a_02 <= datain_a_02, width=32, real=1
--  datain_a_03 <= datain_a_03, width=32, real=1
--  datain_a_04 <= datain_a_04, width=32, real=1
--  datain_a_05 <= datain_a_05, width=32, real=1
--  datain_a_06 <= datain_a_06, width=32, real=1
--  datain_a_07 <= datain_a_07, width=32, real=1
--  datain_a_08 <= datain_a_08, width=32, real=1
--  datain_a_09 <= datain_a_09, width=32, real=1
--  datain_a_10 <= datain_a_10, width=32, real=1
--  datain_a_11 <= datain_a_11, width=32, real=1
--  datain_a_12 <= datain_a_12, width=32, real=1
--  datain_a_13 <= datain_a_13, width=32, real=1
--  datain_a_14 <= datain_a_14, width=32, real=1
--  datain_a_15 <= datain_a_15, width=32, real=1
--  datain_a_16 <= datain_a_16, width=32, real=1
--  datain_a_17 <= datain_a_17, width=32, real=1
--  datain_a_18 <= datain_a_18, width=32, real=1
--  datain_a_19 <= datain_a_19, width=32, real=1
--  datain_a_20 <= datain_a_20, width=32, real=1
--  datain_a_21 <= datain_a_21, width=32, real=1
--  datain_a_22 <= datain_a_22, width=32, real=1
--  datain_a_23 <= datain_a_23, width=32, real=1
--  datain_a_24 <= datain_a_24, width=32, real=1
--  datain_a_25 <= datain_a_25, width=32, real=1
--  datain_a_26 <= datain_a_26, width=32, real=1
--  datain_a_27 <= datain_a_27, width=32, real=1
--  datain_a_28 <= datain_a_28, width=32, real=1
--  datain_a_29 <= datain_a_29, width=32, real=1
--  datain_a_30 <= datain_a_30, width=32, real=1
--  datain_a_31 <= datain_a_31, width=32, real=1
--  datain_a_32 <= datain_a_32, width=32, real=1
--  datain_a_33 <= datain_a_33, width=32, real=1
--  datain_a_34 <= datain_a_34, width=32, real=1
--  datain_a_35 <= datain_a_35, width=32, real=1
--  datain_a_36 <= datain_a_36, width=32, real=1
--  datain_a_37 <= datain_a_37, width=32, real=1
--  datain_a_38 <= datain_a_38, width=32, real=1
--  datain_a_39 <= datain_a_39, width=32, real=1
--  datain_a_40 <= datain_a_40, width=32, real=1
--  datain_a_41 <= datain_a_41, width=32, real=1
--  datain_a_42 <= datain_a_42, width=32, real=1
--  datain_a_43 <= datain_a_43, width=32, real=1
--  datain_a_44 <= datain_a_44, width=32, real=1
--  datain_a_45 <= datain_a_45, width=32, real=1
--  datain_a_46 <= datain_a_46, width=32, real=1
--  datain_a_47 <= datain_a_47, width=32, real=1
--  datain_a_48 <= datain_a_48, width=32, real=1
--  datain_a_49 <= datain_a_49, width=32, real=1
--  datain_a_50 <= datain_a_50, width=32, real=1
--  datain_a_51 <= datain_a_51, width=32, real=1
--  datain_a_52 <= datain_a_52, width=32, real=1
--  datain_a_53 <= datain_a_53, width=32, real=1
--  datain_a_54 <= datain_a_54, width=32, real=1
--  datain_a_55 <= datain_a_55, width=32, real=1
--  datain_a_56 <= datain_a_56, width=32, real=1
--  datain_a_57 <= datain_a_57, width=32, real=1
--  datain_a_58 <= datain_a_58, width=32, real=1
--  datain_a_59 <= datain_a_59, width=32, real=1
--  datain_a_60 <= datain_a_60, width=32, real=1
--  datain_a_61 <= datain_a_61, width=32, real=1
--  datain_a_62 <= datain_a_62, width=32, real=1
--  datain_a_63 <= datain_a_63, width=32, real=1
--  datain_b_00 <= datain_b_00, width=32, real=1
--  datain_b_01 <= datain_b_01, width=32, real=1
--  datain_b_02 <= datain_b_02, width=32, real=1
--  datain_b_03 <= datain_b_03, width=32, real=1
--  datain_b_04 <= datain_b_04, width=32, real=1
--  datain_b_05 <= datain_b_05, width=32, real=1
--  datain_b_06 <= datain_b_06, width=32, real=1
--  datain_b_07 <= datain_b_07, width=32, real=1
--  datain_b_08 <= datain_b_08, width=32, real=1
--  datain_b_09 <= datain_b_09, width=32, real=1
--  datain_b_10 <= datain_b_10, width=32, real=1
--  datain_b_11 <= datain_b_11, width=32, real=1
--  datain_b_12 <= datain_b_12, width=32, real=1
--  datain_b_13 <= datain_b_13, width=32, real=1
--  datain_b_14 <= datain_b_14, width=32, real=1
--  datain_b_15 <= datain_b_15, width=32, real=1
--  datain_b_16 <= datain_b_16, width=32, real=1
--  datain_b_17 <= datain_b_17, width=32, real=1
--  datain_b_18 <= datain_b_18, width=32, real=1
--  datain_b_19 <= datain_b_19, width=32, real=1
--  datain_b_20 <= datain_b_20, width=32, real=1
--  datain_b_21 <= datain_b_21, width=32, real=1
--  datain_b_22 <= datain_b_22, width=32, real=1
--  datain_b_23 <= datain_b_23, width=32, real=1
--  datain_b_24 <= datain_b_24, width=32, real=1
--  datain_b_25 <= datain_b_25, width=32, real=1
--  datain_b_26 <= datain_b_26, width=32, real=1
--  datain_b_27 <= datain_b_27, width=32, real=1
--  datain_b_28 <= datain_b_28, width=32, real=1
--  datain_b_29 <= datain_b_29, width=32, real=1
--  datain_b_30 <= datain_b_30, width=32, real=1
--  datain_b_31 <= datain_b_31, width=32, real=1
--  datain_b_32 <= datain_b_32, width=32, real=1
--  datain_b_33 <= datain_b_33, width=32, real=1
--  datain_b_34 <= datain_b_34, width=32, real=1
--  datain_b_35 <= datain_b_35, width=32, real=1
--  datain_b_36 <= datain_b_36, width=32, real=1
--  datain_b_37 <= datain_b_37, width=32, real=1
--  datain_b_38 <= datain_b_38, width=32, real=1
--  datain_b_39 <= datain_b_39, width=32, real=1
--  datain_b_40 <= datain_b_40, width=32, real=1
--  datain_b_41 <= datain_b_41, width=32, real=1
--  datain_b_42 <= datain_b_42, width=32, real=1
--  datain_b_43 <= datain_b_43, width=32, real=1
--  datain_b_44 <= datain_b_44, width=32, real=1
--  datain_b_45 <= datain_b_45, width=32, real=1
--  datain_b_46 <= datain_b_46, width=32, real=1
--  datain_b_47 <= datain_b_47, width=32, real=1
--  datain_b_48 <= datain_b_48, width=32, real=1
--  datain_b_49 <= datain_b_49, width=32, real=1
--  datain_b_50 <= datain_b_50, width=32, real=1
--  datain_b_51 <= datain_b_51, width=32, real=1
--  datain_b_52 <= datain_b_52, width=32, real=1
--  datain_b_53 <= datain_b_53, width=32, real=1
--  datain_b_54 <= datain_b_54, width=32, real=1
--  datain_b_55 <= datain_b_55, width=32, real=1
--  datain_b_56 <= datain_b_56, width=32, real=1
--  datain_b_57 <= datain_b_57, width=32, real=1
--  datain_b_58 <= datain_b_58, width=32, real=1
--  datain_b_59 <= datain_b_59, width=32, real=1
--  datain_b_60 <= datain_b_60, width=32, real=1
--  datain_b_61 <= datain_b_61, width=32, real=1
--  datain_b_62 <= datain_b_62, width=32, real=1
--  datain_b_63 <= datain_b_63, width=32, real=1
-- outputs
--  N/C
--  N/C
--  vout_s => dotProduct64_dut_prim_vout_s, width=1, real=0
--  cout_s => dotProduct64_dut_prim_cout_s, width=8, real=0
--  dout_s => dotProduct64_dut_prim_dout_s, width=32, real=1
    component dotProduct64_dut_prim is
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
    end component;


    signal dotProduct64_dut_prim_valid_s : std_logic_vector (0 downto 0);
    signal dotProduct64_dut_prim_channel_s : std_logic_vector (7 downto 0);
    signal dotProduct64_dut_prim_datain_a_00 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_01 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_02 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_03 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_04 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_05 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_06 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_07 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_08 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_09 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_10 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_11 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_12 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_13 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_14 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_15 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_16 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_17 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_18 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_19 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_20 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_21 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_22 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_23 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_24 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_25 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_26 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_27 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_28 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_29 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_30 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_31 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_32 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_33 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_34 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_35 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_36 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_37 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_38 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_39 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_40 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_41 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_42 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_43 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_44 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_45 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_46 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_47 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_48 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_49 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_50 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_51 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_52 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_53 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_54 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_55 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_56 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_57 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_58 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_59 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_60 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_61 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_62 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_a_63 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_00 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_01 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_02 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_03 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_04 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_05 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_06 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_07 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_08 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_09 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_10 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_11 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_12 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_13 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_14 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_15 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_16 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_17 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_18 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_19 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_20 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_21 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_22 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_23 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_24 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_25 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_26 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_27 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_28 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_29 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_30 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_31 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_32 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_33 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_34 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_35 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_36 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_37 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_38 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_39 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_40 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_41 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_42 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_43 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_44 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_45 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_46 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_47 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_48 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_49 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_50 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_51 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_52 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_53 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_54 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_55 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_56 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_57 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_58 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_59 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_60 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_61 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_62 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_datain_b_63 : std_logic_vector (31 downto 0);
    signal dotProduct64_dut_prim_vout_s : std_logic_vector (0 downto 0);
    signal dotProduct64_dut_prim_cout_s : std_logic_vector (7 downto 0);
    signal dotProduct64_dut_prim_dout_s : std_logic_vector (31 downto 0);
begin


	--GND(CONSTANT,0)

	--VCC(CONSTANT,1)

	--u63_datain_b_auto(GPIN,131)

	--u62_datain_b_auto(GPIN,130)

	--u61_datain_b_auto(GPIN,129)

	--u60_datain_b_auto(GPIN,128)

	--u59_datain_b_auto(GPIN,127)

	--u58_datain_b_auto(GPIN,126)

	--u57_datain_b_auto(GPIN,125)

	--u56_datain_b_auto(GPIN,124)

	--u55_datain_b_auto(GPIN,123)

	--u54_datain_b_auto(GPIN,122)

	--u53_datain_b_auto(GPIN,121)

	--u52_datain_b_auto(GPIN,120)

	--u51_datain_b_auto(GPIN,119)

	--u50_datain_b_auto(GPIN,118)

	--u49_datain_b_auto(GPIN,117)

	--u48_datain_b_auto(GPIN,116)

	--u47_datain_b_auto(GPIN,115)

	--u46_datain_b_auto(GPIN,114)

	--u45_datain_b_auto(GPIN,113)

	--u44_datain_b_auto(GPIN,112)

	--u43_datain_b_auto(GPIN,111)

	--u42_datain_b_auto(GPIN,110)

	--u41_datain_b_auto(GPIN,109)

	--u40_datain_b_auto(GPIN,108)

	--u39_datain_b_auto(GPIN,107)

	--u38_datain_b_auto(GPIN,106)

	--u37_datain_b_auto(GPIN,105)

	--u36_datain_b_auto(GPIN,104)

	--u35_datain_b_auto(GPIN,103)

	--u34_datain_b_auto(GPIN,102)

	--u33_datain_b_auto(GPIN,101)

	--u32_datain_b_auto(GPIN,100)

	--u31_datain_b_auto(GPIN,99)

	--u30_datain_b_auto(GPIN,98)

	--u29_datain_b_auto(GPIN,97)

	--u28_datain_b_auto(GPIN,96)

	--u27_datain_b_auto(GPIN,95)

	--u26_datain_b_auto(GPIN,94)

	--u25_datain_b_auto(GPIN,93)

	--u24_datain_b_auto(GPIN,92)

	--u23_datain_b_auto(GPIN,91)

	--u22_datain_b_auto(GPIN,90)

	--u21_datain_b_auto(GPIN,89)

	--u20_datain_b_auto(GPIN,88)

	--u19_datain_b_auto(GPIN,87)

	--u18_datain_b_auto(GPIN,86)

	--u17_datain_b_auto(GPIN,85)

	--u16_datain_b_auto(GPIN,84)

	--u15_datain_b_auto(GPIN,83)

	--u14_datain_b_auto(GPIN,82)

	--u13_datain_b_auto(GPIN,81)

	--u12_datain_b_auto(GPIN,80)

	--u11_datain_b_auto(GPIN,79)

	--u10_datain_b_auto(GPIN,78)

	--u9_datain_b_auto(GPIN,77)

	--u8_datain_b_auto(GPIN,76)

	--u7_datain_b_auto(GPIN,75)

	--u6_datain_b_auto(GPIN,74)

	--u5_datain_b_auto(GPIN,73)

	--u4_datain_b_auto(GPIN,72)

	--u3_datain_b_auto(GPIN,71)

	--u2_datain_b_auto(GPIN,70)

	--u1_datain_b_auto(GPIN,69)

	--u0_datain_b_auto(GPIN,68)

	--u63_datain_a_auto(GPIN,67)

	--u62_datain_a_auto(GPIN,66)

	--u61_datain_a_auto(GPIN,65)

	--u60_datain_a_auto(GPIN,64)

	--u59_datain_a_auto(GPIN,63)

	--u58_datain_a_auto(GPIN,62)

	--u57_datain_a_auto(GPIN,61)

	--u56_datain_a_auto(GPIN,60)

	--u55_datain_a_auto(GPIN,59)

	--u54_datain_a_auto(GPIN,58)

	--u53_datain_a_auto(GPIN,57)

	--u52_datain_a_auto(GPIN,56)

	--u51_datain_a_auto(GPIN,55)

	--u50_datain_a_auto(GPIN,54)

	--u49_datain_a_auto(GPIN,53)

	--u48_datain_a_auto(GPIN,52)

	--u47_datain_a_auto(GPIN,51)

	--u46_datain_a_auto(GPIN,50)

	--u45_datain_a_auto(GPIN,49)

	--u44_datain_a_auto(GPIN,48)

	--u43_datain_a_auto(GPIN,47)

	--u42_datain_a_auto(GPIN,46)

	--u41_datain_a_auto(GPIN,45)

	--u40_datain_a_auto(GPIN,44)

	--u39_datain_a_auto(GPIN,43)

	--u38_datain_a_auto(GPIN,42)

	--u37_datain_a_auto(GPIN,41)

	--u36_datain_a_auto(GPIN,40)

	--u35_datain_a_auto(GPIN,39)

	--u34_datain_a_auto(GPIN,38)

	--u33_datain_a_auto(GPIN,37)

	--u32_datain_a_auto(GPIN,36)

	--u31_datain_a_auto(GPIN,35)

	--u30_datain_a_auto(GPIN,34)

	--u29_datain_a_auto(GPIN,33)

	--u28_datain_a_auto(GPIN,32)

	--u27_datain_a_auto(GPIN,31)

	--u26_datain_a_auto(GPIN,30)

	--u25_datain_a_auto(GPIN,29)

	--u24_datain_a_auto(GPIN,28)

	--u23_datain_a_auto(GPIN,27)

	--u22_datain_a_auto(GPIN,26)

	--u21_datain_a_auto(GPIN,25)

	--u20_datain_a_auto(GPIN,24)

	--u19_datain_a_auto(GPIN,23)

	--u18_datain_a_auto(GPIN,22)

	--u17_datain_a_auto(GPIN,21)

	--u16_datain_a_auto(GPIN,20)

	--u15_datain_a_auto(GPIN,19)

	--u14_datain_a_auto(GPIN,18)

	--u13_datain_a_auto(GPIN,17)

	--u12_datain_a_auto(GPIN,16)

	--u11_datain_a_auto(GPIN,15)

	--u10_datain_a_auto(GPIN,14)

	--u9_datain_a_auto(GPIN,13)

	--u8_datain_a_auto(GPIN,12)

	--u7_datain_a_auto(GPIN,11)

	--u6_datain_a_auto(GPIN,10)

	--u5_datain_a_auto(GPIN,9)

	--u4_datain_a_auto(GPIN,8)

	--u3_datain_a_auto(GPIN,7)

	--u2_datain_a_auto(GPIN,6)

	--u1_datain_a_auto(GPIN,5)

	--u0_datain_a_auto(GPIN,4)

	--c_auto(GPIN,2)

	--v_auto(GPIN,134)

	--dotProduct64_dut_prim(BLACKBOX,133)
        dotProduct64_dut_prim_valid_s <= v_s;
        dotProduct64_dut_prim_channel_s <= c_s;
        dotProduct64_dut_prim_datain_a_00 <= datain_a_00;
        dotProduct64_dut_prim_datain_a_01 <= datain_a_01;
        dotProduct64_dut_prim_datain_a_02 <= datain_a_02;
        dotProduct64_dut_prim_datain_a_03 <= datain_a_03;
        dotProduct64_dut_prim_datain_a_04 <= datain_a_04;
        dotProduct64_dut_prim_datain_a_05 <= datain_a_05;
        dotProduct64_dut_prim_datain_a_06 <= datain_a_06;
        dotProduct64_dut_prim_datain_a_07 <= datain_a_07;
        dotProduct64_dut_prim_datain_a_08 <= datain_a_08;
        dotProduct64_dut_prim_datain_a_09 <= datain_a_09;
        dotProduct64_dut_prim_datain_a_10 <= datain_a_10;
        dotProduct64_dut_prim_datain_a_11 <= datain_a_11;
        dotProduct64_dut_prim_datain_a_12 <= datain_a_12;
        dotProduct64_dut_prim_datain_a_13 <= datain_a_13;
        dotProduct64_dut_prim_datain_a_14 <= datain_a_14;
        dotProduct64_dut_prim_datain_a_15 <= datain_a_15;
        dotProduct64_dut_prim_datain_a_16 <= datain_a_16;
        dotProduct64_dut_prim_datain_a_17 <= datain_a_17;
        dotProduct64_dut_prim_datain_a_18 <= datain_a_18;
        dotProduct64_dut_prim_datain_a_19 <= datain_a_19;
        dotProduct64_dut_prim_datain_a_20 <= datain_a_20;
        dotProduct64_dut_prim_datain_a_21 <= datain_a_21;
        dotProduct64_dut_prim_datain_a_22 <= datain_a_22;
        dotProduct64_dut_prim_datain_a_23 <= datain_a_23;
        dotProduct64_dut_prim_datain_a_24 <= datain_a_24;
        dotProduct64_dut_prim_datain_a_25 <= datain_a_25;
        dotProduct64_dut_prim_datain_a_26 <= datain_a_26;
        dotProduct64_dut_prim_datain_a_27 <= datain_a_27;
        dotProduct64_dut_prim_datain_a_28 <= datain_a_28;
        dotProduct64_dut_prim_datain_a_29 <= datain_a_29;
        dotProduct64_dut_prim_datain_a_30 <= datain_a_30;
        dotProduct64_dut_prim_datain_a_31 <= datain_a_31;
        dotProduct64_dut_prim_datain_a_32 <= datain_a_32;
        dotProduct64_dut_prim_datain_a_33 <= datain_a_33;
        dotProduct64_dut_prim_datain_a_34 <= datain_a_34;
        dotProduct64_dut_prim_datain_a_35 <= datain_a_35;
        dotProduct64_dut_prim_datain_a_36 <= datain_a_36;
        dotProduct64_dut_prim_datain_a_37 <= datain_a_37;
        dotProduct64_dut_prim_datain_a_38 <= datain_a_38;
        dotProduct64_dut_prim_datain_a_39 <= datain_a_39;
        dotProduct64_dut_prim_datain_a_40 <= datain_a_40;
        dotProduct64_dut_prim_datain_a_41 <= datain_a_41;
        dotProduct64_dut_prim_datain_a_42 <= datain_a_42;
        dotProduct64_dut_prim_datain_a_43 <= datain_a_43;
        dotProduct64_dut_prim_datain_a_44 <= datain_a_44;
        dotProduct64_dut_prim_datain_a_45 <= datain_a_45;
        dotProduct64_dut_prim_datain_a_46 <= datain_a_46;
        dotProduct64_dut_prim_datain_a_47 <= datain_a_47;
        dotProduct64_dut_prim_datain_a_48 <= datain_a_48;
        dotProduct64_dut_prim_datain_a_49 <= datain_a_49;
        dotProduct64_dut_prim_datain_a_50 <= datain_a_50;
        dotProduct64_dut_prim_datain_a_51 <= datain_a_51;
        dotProduct64_dut_prim_datain_a_52 <= datain_a_52;
        dotProduct64_dut_prim_datain_a_53 <= datain_a_53;
        dotProduct64_dut_prim_datain_a_54 <= datain_a_54;
        dotProduct64_dut_prim_datain_a_55 <= datain_a_55;
        dotProduct64_dut_prim_datain_a_56 <= datain_a_56;
        dotProduct64_dut_prim_datain_a_57 <= datain_a_57;
        dotProduct64_dut_prim_datain_a_58 <= datain_a_58;
        dotProduct64_dut_prim_datain_a_59 <= datain_a_59;
        dotProduct64_dut_prim_datain_a_60 <= datain_a_60;
        dotProduct64_dut_prim_datain_a_61 <= datain_a_61;
        dotProduct64_dut_prim_datain_a_62 <= datain_a_62;
        dotProduct64_dut_prim_datain_a_63 <= datain_a_63;
        dotProduct64_dut_prim_datain_b_00 <= datain_b_00;
        dotProduct64_dut_prim_datain_b_01 <= datain_b_01;
        dotProduct64_dut_prim_datain_b_02 <= datain_b_02;
        dotProduct64_dut_prim_datain_b_03 <= datain_b_03;
        dotProduct64_dut_prim_datain_b_04 <= datain_b_04;
        dotProduct64_dut_prim_datain_b_05 <= datain_b_05;
        dotProduct64_dut_prim_datain_b_06 <= datain_b_06;
        dotProduct64_dut_prim_datain_b_07 <= datain_b_07;
        dotProduct64_dut_prim_datain_b_08 <= datain_b_08;
        dotProduct64_dut_prim_datain_b_09 <= datain_b_09;
        dotProduct64_dut_prim_datain_b_10 <= datain_b_10;
        dotProduct64_dut_prim_datain_b_11 <= datain_b_11;
        dotProduct64_dut_prim_datain_b_12 <= datain_b_12;
        dotProduct64_dut_prim_datain_b_13 <= datain_b_13;
        dotProduct64_dut_prim_datain_b_14 <= datain_b_14;
        dotProduct64_dut_prim_datain_b_15 <= datain_b_15;
        dotProduct64_dut_prim_datain_b_16 <= datain_b_16;
        dotProduct64_dut_prim_datain_b_17 <= datain_b_17;
        dotProduct64_dut_prim_datain_b_18 <= datain_b_18;
        dotProduct64_dut_prim_datain_b_19 <= datain_b_19;
        dotProduct64_dut_prim_datain_b_20 <= datain_b_20;
        dotProduct64_dut_prim_datain_b_21 <= datain_b_21;
        dotProduct64_dut_prim_datain_b_22 <= datain_b_22;
        dotProduct64_dut_prim_datain_b_23 <= datain_b_23;
        dotProduct64_dut_prim_datain_b_24 <= datain_b_24;
        dotProduct64_dut_prim_datain_b_25 <= datain_b_25;
        dotProduct64_dut_prim_datain_b_26 <= datain_b_26;
        dotProduct64_dut_prim_datain_b_27 <= datain_b_27;
        dotProduct64_dut_prim_datain_b_28 <= datain_b_28;
        dotProduct64_dut_prim_datain_b_29 <= datain_b_29;
        dotProduct64_dut_prim_datain_b_30 <= datain_b_30;
        dotProduct64_dut_prim_datain_b_31 <= datain_b_31;
        dotProduct64_dut_prim_datain_b_32 <= datain_b_32;
        dotProduct64_dut_prim_datain_b_33 <= datain_b_33;
        dotProduct64_dut_prim_datain_b_34 <= datain_b_34;
        dotProduct64_dut_prim_datain_b_35 <= datain_b_35;
        dotProduct64_dut_prim_datain_b_36 <= datain_b_36;
        dotProduct64_dut_prim_datain_b_37 <= datain_b_37;
        dotProduct64_dut_prim_datain_b_38 <= datain_b_38;
        dotProduct64_dut_prim_datain_b_39 <= datain_b_39;
        dotProduct64_dut_prim_datain_b_40 <= datain_b_40;
        dotProduct64_dut_prim_datain_b_41 <= datain_b_41;
        dotProduct64_dut_prim_datain_b_42 <= datain_b_42;
        dotProduct64_dut_prim_datain_b_43 <= datain_b_43;
        dotProduct64_dut_prim_datain_b_44 <= datain_b_44;
        dotProduct64_dut_prim_datain_b_45 <= datain_b_45;
        dotProduct64_dut_prim_datain_b_46 <= datain_b_46;
        dotProduct64_dut_prim_datain_b_47 <= datain_b_47;
        dotProduct64_dut_prim_datain_b_48 <= datain_b_48;
        dotProduct64_dut_prim_datain_b_49 <= datain_b_49;
        dotProduct64_dut_prim_datain_b_50 <= datain_b_50;
        dotProduct64_dut_prim_datain_b_51 <= datain_b_51;
        dotProduct64_dut_prim_datain_b_52 <= datain_b_52;
        dotProduct64_dut_prim_datain_b_53 <= datain_b_53;
        dotProduct64_dut_prim_datain_b_54 <= datain_b_54;
        dotProduct64_dut_prim_datain_b_55 <= datain_b_55;
        dotProduct64_dut_prim_datain_b_56 <= datain_b_56;
        dotProduct64_dut_prim_datain_b_57 <= datain_b_57;
        dotProduct64_dut_prim_datain_b_58 <= datain_b_58;
        dotProduct64_dut_prim_datain_b_59 <= datain_b_59;
        dotProduct64_dut_prim_datain_b_60 <= datain_b_60;
        dotProduct64_dut_prim_datain_b_61 <= datain_b_61;
        dotProduct64_dut_prim_datain_b_62 <= datain_b_62;
        dotProduct64_dut_prim_datain_b_63 <= datain_b_63;
    thedotProduct64_dut_prim : dotProduct64_dut_prim port map (
        valid_s => dotProduct64_dut_prim_valid_s,
        channel_s => dotProduct64_dut_prim_channel_s,
        datain_a_00 => dotProduct64_dut_prim_datain_a_00,
        datain_a_01 => dotProduct64_dut_prim_datain_a_01,
        datain_a_02 => dotProduct64_dut_prim_datain_a_02,
        datain_a_03 => dotProduct64_dut_prim_datain_a_03,
        datain_a_04 => dotProduct64_dut_prim_datain_a_04,
        datain_a_05 => dotProduct64_dut_prim_datain_a_05,
        datain_a_06 => dotProduct64_dut_prim_datain_a_06,
        datain_a_07 => dotProduct64_dut_prim_datain_a_07,
        datain_a_08 => dotProduct64_dut_prim_datain_a_08,
        datain_a_09 => dotProduct64_dut_prim_datain_a_09,
        datain_a_10 => dotProduct64_dut_prim_datain_a_10,
        datain_a_11 => dotProduct64_dut_prim_datain_a_11,
        datain_a_12 => dotProduct64_dut_prim_datain_a_12,
        datain_a_13 => dotProduct64_dut_prim_datain_a_13,
        datain_a_14 => dotProduct64_dut_prim_datain_a_14,
        datain_a_15 => dotProduct64_dut_prim_datain_a_15,
        datain_a_16 => dotProduct64_dut_prim_datain_a_16,
        datain_a_17 => dotProduct64_dut_prim_datain_a_17,
        datain_a_18 => dotProduct64_dut_prim_datain_a_18,
        datain_a_19 => dotProduct64_dut_prim_datain_a_19,
        datain_a_20 => dotProduct64_dut_prim_datain_a_20,
        datain_a_21 => dotProduct64_dut_prim_datain_a_21,
        datain_a_22 => dotProduct64_dut_prim_datain_a_22,
        datain_a_23 => dotProduct64_dut_prim_datain_a_23,
        datain_a_24 => dotProduct64_dut_prim_datain_a_24,
        datain_a_25 => dotProduct64_dut_prim_datain_a_25,
        datain_a_26 => dotProduct64_dut_prim_datain_a_26,
        datain_a_27 => dotProduct64_dut_prim_datain_a_27,
        datain_a_28 => dotProduct64_dut_prim_datain_a_28,
        datain_a_29 => dotProduct64_dut_prim_datain_a_29,
        datain_a_30 => dotProduct64_dut_prim_datain_a_30,
        datain_a_31 => dotProduct64_dut_prim_datain_a_31,
        datain_a_32 => dotProduct64_dut_prim_datain_a_32,
        datain_a_33 => dotProduct64_dut_prim_datain_a_33,
        datain_a_34 => dotProduct64_dut_prim_datain_a_34,
        datain_a_35 => dotProduct64_dut_prim_datain_a_35,
        datain_a_36 => dotProduct64_dut_prim_datain_a_36,
        datain_a_37 => dotProduct64_dut_prim_datain_a_37,
        datain_a_38 => dotProduct64_dut_prim_datain_a_38,
        datain_a_39 => dotProduct64_dut_prim_datain_a_39,
        datain_a_40 => dotProduct64_dut_prim_datain_a_40,
        datain_a_41 => dotProduct64_dut_prim_datain_a_41,
        datain_a_42 => dotProduct64_dut_prim_datain_a_42,
        datain_a_43 => dotProduct64_dut_prim_datain_a_43,
        datain_a_44 => dotProduct64_dut_prim_datain_a_44,
        datain_a_45 => dotProduct64_dut_prim_datain_a_45,
        datain_a_46 => dotProduct64_dut_prim_datain_a_46,
        datain_a_47 => dotProduct64_dut_prim_datain_a_47,
        datain_a_48 => dotProduct64_dut_prim_datain_a_48,
        datain_a_49 => dotProduct64_dut_prim_datain_a_49,
        datain_a_50 => dotProduct64_dut_prim_datain_a_50,
        datain_a_51 => dotProduct64_dut_prim_datain_a_51,
        datain_a_52 => dotProduct64_dut_prim_datain_a_52,
        datain_a_53 => dotProduct64_dut_prim_datain_a_53,
        datain_a_54 => dotProduct64_dut_prim_datain_a_54,
        datain_a_55 => dotProduct64_dut_prim_datain_a_55,
        datain_a_56 => dotProduct64_dut_prim_datain_a_56,
        datain_a_57 => dotProduct64_dut_prim_datain_a_57,
        datain_a_58 => dotProduct64_dut_prim_datain_a_58,
        datain_a_59 => dotProduct64_dut_prim_datain_a_59,
        datain_a_60 => dotProduct64_dut_prim_datain_a_60,
        datain_a_61 => dotProduct64_dut_prim_datain_a_61,
        datain_a_62 => dotProduct64_dut_prim_datain_a_62,
        datain_a_63 => dotProduct64_dut_prim_datain_a_63,
        datain_b_00 => dotProduct64_dut_prim_datain_b_00,
        datain_b_01 => dotProduct64_dut_prim_datain_b_01,
        datain_b_02 => dotProduct64_dut_prim_datain_b_02,
        datain_b_03 => dotProduct64_dut_prim_datain_b_03,
        datain_b_04 => dotProduct64_dut_prim_datain_b_04,
        datain_b_05 => dotProduct64_dut_prim_datain_b_05,
        datain_b_06 => dotProduct64_dut_prim_datain_b_06,
        datain_b_07 => dotProduct64_dut_prim_datain_b_07,
        datain_b_08 => dotProduct64_dut_prim_datain_b_08,
        datain_b_09 => dotProduct64_dut_prim_datain_b_09,
        datain_b_10 => dotProduct64_dut_prim_datain_b_10,
        datain_b_11 => dotProduct64_dut_prim_datain_b_11,
        datain_b_12 => dotProduct64_dut_prim_datain_b_12,
        datain_b_13 => dotProduct64_dut_prim_datain_b_13,
        datain_b_14 => dotProduct64_dut_prim_datain_b_14,
        datain_b_15 => dotProduct64_dut_prim_datain_b_15,
        datain_b_16 => dotProduct64_dut_prim_datain_b_16,
        datain_b_17 => dotProduct64_dut_prim_datain_b_17,
        datain_b_18 => dotProduct64_dut_prim_datain_b_18,
        datain_b_19 => dotProduct64_dut_prim_datain_b_19,
        datain_b_20 => dotProduct64_dut_prim_datain_b_20,
        datain_b_21 => dotProduct64_dut_prim_datain_b_21,
        datain_b_22 => dotProduct64_dut_prim_datain_b_22,
        datain_b_23 => dotProduct64_dut_prim_datain_b_23,
        datain_b_24 => dotProduct64_dut_prim_datain_b_24,
        datain_b_25 => dotProduct64_dut_prim_datain_b_25,
        datain_b_26 => dotProduct64_dut_prim_datain_b_26,
        datain_b_27 => dotProduct64_dut_prim_datain_b_27,
        datain_b_28 => dotProduct64_dut_prim_datain_b_28,
        datain_b_29 => dotProduct64_dut_prim_datain_b_29,
        datain_b_30 => dotProduct64_dut_prim_datain_b_30,
        datain_b_31 => dotProduct64_dut_prim_datain_b_31,
        datain_b_32 => dotProduct64_dut_prim_datain_b_32,
        datain_b_33 => dotProduct64_dut_prim_datain_b_33,
        datain_b_34 => dotProduct64_dut_prim_datain_b_34,
        datain_b_35 => dotProduct64_dut_prim_datain_b_35,
        datain_b_36 => dotProduct64_dut_prim_datain_b_36,
        datain_b_37 => dotProduct64_dut_prim_datain_b_37,
        datain_b_38 => dotProduct64_dut_prim_datain_b_38,
        datain_b_39 => dotProduct64_dut_prim_datain_b_39,
        datain_b_40 => dotProduct64_dut_prim_datain_b_40,
        datain_b_41 => dotProduct64_dut_prim_datain_b_41,
        datain_b_42 => dotProduct64_dut_prim_datain_b_42,
        datain_b_43 => dotProduct64_dut_prim_datain_b_43,
        datain_b_44 => dotProduct64_dut_prim_datain_b_44,
        datain_b_45 => dotProduct64_dut_prim_datain_b_45,
        datain_b_46 => dotProduct64_dut_prim_datain_b_46,
        datain_b_47 => dotProduct64_dut_prim_datain_b_47,
        datain_b_48 => dotProduct64_dut_prim_datain_b_48,
        datain_b_49 => dotProduct64_dut_prim_datain_b_49,
        datain_b_50 => dotProduct64_dut_prim_datain_b_50,
        datain_b_51 => dotProduct64_dut_prim_datain_b_51,
        datain_b_52 => dotProduct64_dut_prim_datain_b_52,
        datain_b_53 => dotProduct64_dut_prim_datain_b_53,
        datain_b_54 => dotProduct64_dut_prim_datain_b_54,
        datain_b_55 => dotProduct64_dut_prim_datain_b_55,
        datain_b_56 => dotProduct64_dut_prim_datain_b_56,
        datain_b_57 => dotProduct64_dut_prim_datain_b_57,
        datain_b_58 => dotProduct64_dut_prim_datain_b_58,
        datain_b_59 => dotProduct64_dut_prim_datain_b_59,
        datain_b_60 => dotProduct64_dut_prim_datain_b_60,
        datain_b_61 => dotProduct64_dut_prim_datain_b_61,
        datain_b_62 => dotProduct64_dut_prim_datain_b_62,
        datain_b_63 => dotProduct64_dut_prim_datain_b_63,
        vout_s => dotProduct64_dut_prim_vout_s,
        cout_s => dotProduct64_dut_prim_cout_s,
        dout_s => dotProduct64_dut_prim_dout_s,
        clk => clk,
        areset => areset,
        h_areset => h_areset
        );

	--cout_auto(GPOUT,3)
    cout_s <= dotProduct64_dut_prim_cout_s;


	--dout_auto(GPOUT,132)
    dout_s <= dotProduct64_dut_prim_dout_s;


	--vout_auto(GPOUT,135)
    vout_s <= dotProduct64_dut_prim_vout_s;


end normal;
