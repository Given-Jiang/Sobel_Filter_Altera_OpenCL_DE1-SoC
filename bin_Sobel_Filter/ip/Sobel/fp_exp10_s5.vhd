----------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 13.1
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2013 Altera Corporation.  All rights reserved.    
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

-- VHDL created from fp_exp10_s5
-- VHDL created on Wed Apr 10 13:03:18 2013


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fp_exp10_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_exp10_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstBias_uid8_fpExp10Test_q : std_logic_vector (7 downto 0);
    signal cstZeroWE_uid11_fpExp10Test_q : std_logic_vector (7 downto 0);
    signal cstZeroWEP1_uid12_fpExp10Test_q : std_logic_vector (8 downto 0);
    signal cstBiasPWE_uid13_fpExp10Test_q : std_logic_vector (7 downto 0);
    signal cstBiasPWE_uid14_fpExp10Test_q : std_logic_vector (5 downto 0);
    signal cstAllOWE_uid15_fpExp10Test_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid16_fpExp10Test_q : std_logic_vector (22 downto 0);
    signal zY_uid60_fpExp10Test_q : std_logic_vector (25 downto 0);
    signal expRPostBiasPreExc0_uid69_fpExp10Test_a : std_logic_vector(13 downto 0);
    signal expRPostBiasPreExc0_uid69_fpExp10Test_b : std_logic_vector(13 downto 0);
    signal expRPostBiasPreExc0_uid69_fpExp10Test_o : std_logic_vector (13 downto 0);
    signal expRPostBiasPreExc0_uid69_fpExp10Test_q : std_logic_vector (12 downto 0);
    signal oneFracRPostExc2_uid90_fpExp10Test_q : std_logic_vector (22 downto 0);
    signal p4_uid105_constMult_q : std_logic_vector(31 downto 0);
    signal p2_uid107_constMult_q : std_logic_vector(24 downto 0);
    signal lev1_a0_uid110_constMult_a : std_logic_vector(33 downto 0);
    signal lev1_a0_uid110_constMult_b : std_logic_vector(33 downto 0);
    signal lev1_a0_uid110_constMult_o : std_logic_vector (33 downto 0);
    signal lev1_a0_uid110_constMult_q : std_logic_vector (32 downto 0);
    signal lev2_a0_uid112_constMult_a : std_logic_vector(34 downto 0);
    signal lev2_a0_uid112_constMult_b : std_logic_vector(34 downto 0);
    signal lev2_a0_uid112_constMult_o : std_logic_vector (34 downto 0);
    signal lev2_a0_uid112_constMult_q : std_logic_vector (33 downto 0);
    signal z_uid117_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (15 downto 0);
    signal z_uid121_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (31 downto 0);
    signal rightShiftStage0Idx3_uid125_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test_a : std_logic_vector(36 downto 0);
    signal rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector(36 downto 0);
    signal rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test_q_i : std_logic_vector(36 downto 0);
    signal rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector(36 downto 0);
    signal z_uid129_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_a : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_q_i : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx2Pad8_uid134_fxpInPostAlign_uid45_fpExp10Test_a : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid134_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid134_fxpInPostAlign_uid45_fpExp10Test_q_i : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid134_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector(7 downto 0);
    signal z_uid137_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid138_fxpInPostAlign_uid45_fpExp10Test_a : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid138_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid138_fxpInPostAlign_uid45_fpExp10Test_q_i : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid138_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector(11 downto 0);
    signal rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_q_i : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal z_uid147_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_a : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_q_i : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector(1 downto 0);
    signal z_uid151_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid152_fxpInPostAlign_uid45_fpExp10Test_a : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid152_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid152_fxpInPostAlign_uid45_fpExp10Test_q_i : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid152_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector(2 downto 0);
    signal p1_uid160_constMult_q : std_logic_vector(44 downto 0);
    signal rightShiftStage0Idx3_uid174_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test_a : std_logic_vector(33 downto 0);
    signal rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector(33 downto 0);
    signal rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test_q_i : std_logic_vector(33 downto 0);
    signal rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector(33 downto 0);
    signal rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_a : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_q_i : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx2Pad8_uid183_fxpInPostAlign_X_uid56_fpExp10Test_a : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid183_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid183_fxpInPostAlign_X_uid56_fpExp10Test_q_i : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid183_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx3Pad12_uid187_fxpInPostAlign_X_uid56_fpExp10Test_a : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid187_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid187_fxpInPostAlign_X_uid56_fpExp10Test_q_i : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid187_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector(11 downto 0);
    signal rightShiftStage2Idx1Pad1_uid193_fxpInPostAlign_X_uid56_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid193_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid193_fxpInPostAlign_X_uid56_fpExp10Test_q_i : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid193_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_a : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_q_i : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx3Pad3_uid201_fxpInPostAlign_X_uid56_fpExp10Test_a : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid201_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid201_fxpInPostAlign_X_uid56_fpExp10Test_q_i : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid201_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector(2 downto 0);
    signal prodXY_uid226_pT1_uid214_exp10PolyEval_a : std_logic_vector (12 downto 0);
    signal prodXY_uid226_pT1_uid214_exp10PolyEval_b : std_logic_vector (12 downto 0);
    signal prodXY_uid226_pT1_uid214_exp10PolyEval_s1 : std_logic_vector (25 downto 0);
    signal prodXY_uid226_pT1_uid214_exp10PolyEval_pr : SIGNED (26 downto 0);
    signal prodXY_uid226_pT1_uid214_exp10PolyEval_q : std_logic_vector (25 downto 0);
    signal prodXY_uid229_pT2_uid220_exp10PolyEval_a : std_logic_vector (17 downto 0);
    signal prodXY_uid229_pT2_uid220_exp10PolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid229_pT2_uid220_exp10PolyEval_s1 : std_logic_vector (40 downto 0);
    signal prodXY_uid229_pT2_uid220_exp10PolyEval_pr : SIGNED (41 downto 0);
    signal prodXY_uid229_pT2_uid220_exp10PolyEval_q : std_logic_vector (40 downto 0);
    signal memoryC0_uid207_exp10TabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid207_exp10TabGen_lutmem_ia : std_logic_vector (28 downto 0);
    signal memoryC0_uid207_exp10TabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid207_exp10TabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid207_exp10TabGen_lutmem_iq : std_logic_vector (28 downto 0);
    signal memoryC0_uid207_exp10TabGen_lutmem_q : std_logic_vector (28 downto 0);
    signal memoryC1_uid209_exp10TabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid209_exp10TabGen_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid209_exp10TabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid209_exp10TabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid209_exp10TabGen_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid209_exp10TabGen_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid211_exp10TabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid211_exp10TabGen_lutmem_ia : std_logic_vector (12 downto 0);
    signal memoryC2_uid211_exp10TabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid211_exp10TabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid211_exp10TabGen_lutmem_iq : std_logic_vector (12 downto 0);
    signal memoryC2_uid211_exp10TabGen_lutmem_q : std_logic_vector (12 downto 0);
    signal reg_shiftValuePreSat_uid40_fpExp10Test_0_to_shiftUdf_uid42_fpExp10Test_0_q : std_logic_vector (8 downto 0);
    signal reg_xv4_uid104_constMult_0_to_p4_uid105_constMult_0_q : std_logic_vector (0 downto 0);
    signal reg_xv3_uid103_constMult_0_to_p3_uid106_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv2_uid102_constMult_0_to_p2_uid107_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv1_uid101_constMult_0_to_p1_uid108_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv0_uid100_constMult_0_to_p0_uid109_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_rightShiftStageSel5Dto4_uid127_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_1_q : std_logic_vector (1 downto 0);
    signal reg_oFracXZwE_uid39_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_2_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStage0Idx1_uid120_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_3_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStage0Idx2_uid124_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_4_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_2_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_2_q : std_logic_vector (36 downto 0);
    signal reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_q : std_logic_vector (11 downto 0);
    signal reg_fxpInPreAlign_uid51_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_2_q : std_logic_vector (33 downto 0);
    signal reg_rightShiftStage0Idx1_uid169_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_3_q : std_logic_vector (33 downto 0);
    signal reg_rightShiftStage0Idx2_uid173_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_4_q : std_logic_vector (33 downto 0);
    signal reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_2_q : std_logic_vector (33 downto 0);
    signal reg_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_2_q : std_logic_vector (33 downto 0);
    signal reg_xv1_uid159_constMult_0_to_p1_uid160_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv0_uid158_constMult_0_to_p0_uid161_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_0_to_yExt_uid57_fpExp10Test_0_q : std_logic_vector (41 downto 0);
    signal reg_sR_uid163_constMult_0_to_yExt_uid57_fpExp10Test_1_q : std_logic_vector (42 downto 0);
    signal reg_YExt43_uid59_fpExp10Test_0_to_yRedPostMux_uid62_fpExp10Test_1_q : std_logic_vector (0 downto 0);
    signal reg_yRed_uid61_fpExp10Test_0_to_yRedPostMux_uid62_fpExp10Test_2_q : std_logic_vector (25 downto 0);
    signal reg_addr_uid64_fpExp10Test_0_to_memoryC2_uid211_exp10TabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid213_exp10PolyEval_0_to_prodXY_uid226_pT1_uid214_exp10PolyEval_0_q : std_logic_vector (12 downto 0);
    signal reg_memoryC2_uid211_exp10TabGen_lutmem_0_to_prodXY_uid226_pT1_uid214_exp10PolyEval_1_q : std_logic_vector (12 downto 0);
    signal reg_addr_uid64_fpExp10Test_0_to_memoryC1_uid209_exp10TabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC1_uid209_exp10TabGen_lutmem_0_to_sumAHighB_uid217_exp10PolyEval_0_q : std_logic_vector (20 downto 0);
    signal reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q : std_logic_vector (17 downto 0);
    signal reg_s1_uid215_uid218_exp10PolyEval_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_memoryC0_uid207_exp10TabGen_lutmem_0_to_sumAHighB_uid223_exp10PolyEval_0_q : std_logic_vector (28 downto 0);
    signal reg_peORExpInc_uid68_fpExp10Test_0_to_expRPostBiasPreExc_uid70_fpExp10Test_1_q : std_logic_vector (0 downto 0);
    signal reg_expRPostBiasPreExc_uid70_fpExp10Test_0_to_expUdf_uid72_fpExp10Test_1_q : std_logic_vector (13 downto 0);
    signal reg_concExc_uid88_fpExp10Test_0_to_excREnc_uid89_fpExp10Test_0_q : std_logic_vector (2 downto 0);
    signal ld_shiftUdf_uid42_fpExp10Test_n_to_shiftVal_uid44_fpExp10Test_b_q : std_logic_vector (0 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExp10Test_b_to_shiftVal_uid44_fpExp10Test_c_q : std_logic_vector (5 downto 0);
    signal ld_signX_uid7_fpExp10Test_b_to_onesCmpFxpIn_uid49_fpExp10Test_b_q : std_logic_vector (0 downto 0);
    signal ld_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_q_to_pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_b_q : std_logic_vector (33 downto 0);
    signal ld_yRedPostMux_uid62_fpExp10Test_q_to_yPPolyEval_uid65_fpExp10Test_a_q : std_logic_vector (25 downto 0);
    signal ld_fracR_uid71_fpExp10Test_b_to_fracRPostExc_uid93_fpExp10Test_d_q : std_logic_vector (22 downto 0);
    signal ld_expR_uid75_fpExp10Test_b_to_expRPostExc_uid97_fpExp10Test_d_q : std_logic_vector (7 downto 0);
    signal ld_reg_xv3_uid103_constMult_0_to_p3_uid106_constMult_0_q_to_p3_uid106_constMult_a_q : std_logic_vector (5 downto 0);
    signal ld_reg_xv2_uid102_constMult_0_to_p2_uid107_constMult_0_q_to_p2_uid107_constMult_a_q : std_logic_vector (5 downto 0);
    signal ld_reg_xv0_uid100_constMult_0_to_p0_uid109_constMult_0_q_to_p0_uid109_constMult_a_q : std_logic_vector (5 downto 0);
    signal ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage036dto4_uid131_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1_uid132_fxpInPostAlign_uid45_fpExp10Test_a_q : std_logic_vector (32 downto 0);
    signal ld_RightShiftStage036dto8_uid135_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx2_uid136_fxpInPostAlign_uid45_fpExp10Test_a_q : std_logic_vector (28 downto 0);
    signal ld_RightShiftStage036dto12_uid139_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx3_uid140_fxpInPostAlign_uid45_fpExp10Test_a_q : std_logic_vector (24 downto 0);
    signal ld_rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_q_to_rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test_b_q : std_logic_vector (0 downto 0);
    signal ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage136dto2_uid149_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx2_uid150_fxpInPostAlign_uid45_fpExp10Test_a_q : std_logic_vector (34 downto 0);
    signal ld_RightShiftStage136dto3_uid153_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx3_uid154_fxpInPostAlign_uid45_fpExp10Test_a_q : std_logic_vector (33 downto 0);
    signal ld_reg_rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_1_q_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_b_q : std_logic_vector (1 downto 0);
    signal ld_rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test_q_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_d_q : std_logic_vector (36 downto 0);
    signal ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage033dto4_uid180_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1_uid181_fxpInPostAlign_X_uid56_fpExp10Test_a_q : std_logic_vector (29 downto 0);
    signal ld_RightShiftStage033dto8_uid184_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx2_uid185_fxpInPostAlign_X_uid56_fpExp10Test_a_q : std_logic_vector (25 downto 0);
    signal ld_RightShiftStage033dto12_uid188_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx3_uid189_fxpInPostAlign_X_uid56_fpExp10Test_a_q : std_logic_vector (21 downto 0);
    signal ld_reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_1_q_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_b_q : std_logic_vector (1 downto 0);
    signal ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage133dto2_uid198_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx2_uid199_fxpInPostAlign_X_uid56_fpExp10Test_a_q : std_logic_vector (31 downto 0);
    signal ld_RightShiftStage133dto3_uid202_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx3_uid203_fxpInPostAlign_X_uid56_fpExp10Test_a_q : std_logic_vector (30 downto 0);
    signal ld_rightShiftStage2Idx1_uid195_fxpInPostAlign_X_uid56_fpExp10Test_q_to_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_d_q : std_logic_vector (33 downto 0);
    signal ld_xv1_uid101_constMult_b_to_reg_xv1_uid101_constMult_0_to_p1_uid108_constMult_0_a_q : std_logic_vector (5 downto 0);
    signal ld_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_b_to_reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_1_a_q : std_logic_vector (1 downto 0);
    signal ld_xv0_uid158_constMult_b_to_reg_xv0_uid158_constMult_0_to_p0_uid161_constMult_0_a_q : std_logic_vector (5 downto 0);
    signal ld_addr_uid64_fpExp10Test_b_to_reg_addr_uid64_fpExp10Test_0_to_memoryC1_uid209_exp10TabGen_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_reset0 : std_logic;
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_sticky_ena_q : signal is true;
    signal ld_yRedPostMux_uid62_fpExp10Test_q_to_yPPolyEval_uid65_fpExp10Test_a_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_reset0 : std_logic;
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_eq : std_logic;
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_sticky_ena_q : signal is true;
    signal ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_reset0 : std_logic;
    signal ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_sticky_ena_q : signal is true;
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_reset0 : std_logic;
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_sticky_ena_q : signal is true;
    signal ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_reset0 : std_logic;
    signal ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_sticky_ena_q : signal is true;
    signal ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_reset0 : std_logic;
    signal ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_sticky_ena_q : signal is true;
    signal ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_reset0 : std_logic;
    signal ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_sticky_ena_q : signal is true;
    signal ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_reset0 : std_logic;
    signal ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_sticky_ena_q : signal is true;
    signal ld_fracR_uid71_fpExp10Test_b_to_fracRPostExc_uid93_fpExp10Test_d_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_inputreg_q : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_ia : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_iq : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_q : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_sticky_ena_q : signal is true;
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_sticky_ena_q : signal is true;
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_inputreg_q : std_logic_vector (11 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_reset0 : std_logic;
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_ia : std_logic_vector (11 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_iq : std_logic_vector (11 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_q : std_logic_vector (11 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_eq : std_logic;
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_sticky_ena_q : signal is true;
    signal shiftUdf_uid42_fpExp10Test_a : std_logic_vector(11 downto 0);
    signal shiftUdf_uid42_fpExp10Test_b : std_logic_vector(11 downto 0);
    signal shiftUdf_uid42_fpExp10Test_o : std_logic_vector (11 downto 0);
    signal shiftUdf_uid42_fpExp10Test_cin : std_logic_vector (0 downto 0);
    signal shiftUdf_uid42_fpExp10Test_n : std_logic_vector (0 downto 0);
    signal pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_q : std_logic_vector (41 downto 0);
    signal expUdf_uid72_fpExp10Test_a : std_logic_vector(16 downto 0);
    signal expUdf_uid72_fpExp10Test_b : std_logic_vector(16 downto 0);
    signal expUdf_uid72_fpExp10Test_o : std_logic_vector (16 downto 0);
    signal expUdf_uid72_fpExp10Test_cin : std_logic_vector (0 downto 0);
    signal expUdf_uid72_fpExp10Test_n : std_logic_vector (0 downto 0);
    signal expOvf_uid74_fpExp10Test_a : std_logic_vector(16 downto 0);
    signal expOvf_uid74_fpExp10Test_b : std_logic_vector(16 downto 0);
    signal expOvf_uid74_fpExp10Test_o : std_logic_vector (16 downto 0);
    signal expOvf_uid74_fpExp10Test_cin : std_logic_vector (0 downto 0);
    signal expOvf_uid74_fpExp10Test_n : std_logic_vector (0 downto 0);
    signal oFracXZwE_uid48_fpExp10Test_q : std_logic_vector (33 downto 0);
    signal InvExpOvfInitial_uid78_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal InvExpOvfInitial_uid78_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal expX_uid6_fpExp10Test_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpExp10Test_b : std_logic_vector (7 downto 0);
    signal signX_uid7_fpExp10Test_in : std_logic_vector (31 downto 0);
    signal signX_uid7_fpExp10Test_b : std_logic_vector (0 downto 0);
    signal frac_uid22_fpExp10Test_in : std_logic_vector (22 downto 0);
    signal frac_uid22_fpExp10Test_b : std_logic_vector (22 downto 0);
    signal expXIsZero_uid19_fpExp10Test_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid19_fpExp10Test_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid19_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid21_fpExp10Test_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid21_fpExp10Test_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid21_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid23_fpExp10Test_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid23_fpExp10Test_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid23_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal exc_I_uid24_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal exc_I_uid24_fpExp10Test_b : std_logic_vector(0 downto 0);
    signal exc_I_uid24_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal shiftValuePreSat_uid40_fpExp10Test_a : std_logic_vector(8 downto 0);
    signal shiftValuePreSat_uid40_fpExp10Test_b : std_logic_vector(8 downto 0);
    signal shiftValuePreSat_uid40_fpExp10Test_o : std_logic_vector (8 downto 0);
    signal shiftValuePreSat_uid40_fpExp10Test_q : std_logic_vector (8 downto 0);
    signal shiftVal_uid44_fpExp10Test_s : std_logic_vector (0 downto 0);
    signal shiftVal_uid44_fpExp10Test_q : std_logic_vector (5 downto 0);
    signal onesCmpFxpIn_uid49_fpExp10Test_a : std_logic_vector(33 downto 0);
    signal onesCmpFxpIn_uid49_fpExp10Test_b : std_logic_vector(33 downto 0);
    signal onesCmpFxpIn_uid49_fpExp10Test_q : std_logic_vector(33 downto 0);
    signal fxpInExt_uid50_fpExp10Test_a : std_logic_vector(35 downto 0);
    signal fxpInExt_uid50_fpExp10Test_b : std_logic_vector(35 downto 0);
    signal fxpInExt_uid50_fpExp10Test_o : std_logic_vector (35 downto 0);
    signal fxpInExt_uid50_fpExp10Test_q : std_logic_vector (34 downto 0);
    signal yExt_uid57_fpExp10Test_a : std_logic_vector(43 downto 0);
    signal yExt_uid57_fpExp10Test_b : std_logic_vector(43 downto 0);
    signal yExt_uid57_fpExp10Test_o : std_logic_vector (43 downto 0);
    signal yExt_uid57_fpExp10Test_q : std_logic_vector (43 downto 0);
    signal yRedPostMux_uid62_fpExp10Test_s : std_logic_vector (0 downto 0);
    signal yRedPostMux_uid62_fpExp10Test_q : std_logic_vector (25 downto 0);
    signal expRPostBiasPreExc_uid70_fpExp10Test_a : std_logic_vector(14 downto 0);
    signal expRPostBiasPreExc_uid70_fpExp10Test_b : std_logic_vector(14 downto 0);
    signal expRPostBiasPreExc_uid70_fpExp10Test_o : std_logic_vector (14 downto 0);
    signal expRPostBiasPreExc_uid70_fpExp10Test_q : std_logic_vector (13 downto 0);
    signal negInf_uid76_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal negInf_uid76_fpExp10Test_b : std_logic_vector(0 downto 0);
    signal negInf_uid76_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid79_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid79_fpExp10Test_b : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid79_fpExp10Test_c : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid79_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal excRZero_uid80_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal excRZero_uid80_fpExp10Test_b : std_logic_vector(0 downto 0);
    signal excRZero_uid80_fpExp10Test_c : std_logic_vector(0 downto 0);
    signal excRZero_uid80_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid84_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid84_fpExp10Test_b : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid84_fpExp10Test_c : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid84_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal excRInf_uid87_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal excRInf_uid87_fpExp10Test_b : std_logic_vector(0 downto 0);
    signal excRInf_uid87_fpExp10Test_c : std_logic_vector(0 downto 0);
    signal excRInf_uid87_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal excREnc_uid89_fpExp10Test_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid93_fpExp10Test_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid93_fpExp10Test_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid97_fpExp10Test_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid97_fpExp10Test_q : std_logic_vector (7 downto 0);
    signal p3_uid106_constMult_q : std_logic_vector(30 downto 0);
    signal p1_uid108_constMult_q : std_logic_vector(18 downto 0);
    signal p0_uid109_constMult_q : std_logic_vector(12 downto 0);
    signal lev1_a1_uid111_constMult_a : std_logic_vector(25 downto 0);
    signal lev1_a1_uid111_constMult_b : std_logic_vector(25 downto 0);
    signal lev1_a1_uid111_constMult_o : std_logic_vector (25 downto 0);
    signal lev1_a1_uid111_constMult_q : std_logic_vector (25 downto 0);
    signal lev3_a0_uid113_constMult_a : std_logic_vector(35 downto 0);
    signal lev3_a0_uid113_constMult_b : std_logic_vector(35 downto 0);
    signal lev3_a0_uid113_constMult_o : std_logic_vector (35 downto 0);
    signal lev3_a0_uid113_constMult_q : std_logic_vector (34 downto 0);
    signal rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (36 downto 0);
    signal p0_uid161_constMult_q : std_logic_vector(38 downto 0);
    signal lev1_a0_uid162_constMult_a : std_logic_vector(46 downto 0);
    signal lev1_a0_uid162_constMult_b : std_logic_vector(46 downto 0);
    signal lev1_a0_uid162_constMult_o : std_logic_vector (46 downto 0);
    signal lev1_a0_uid162_constMult_q : std_logic_vector (45 downto 0);
    signal rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector (33 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal rightShiftStage1Idx1_uid132_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx2_uid136_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx3_uid140_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage2Idx2_uid150_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage2Idx3_uid154_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx1_uid181_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage1Idx2_uid185_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage1Idx3_uid189_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage2Idx2_uid199_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage2Idx3_uid203_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector (33 downto 0);
    signal prodXYTruncFR_uid227_pT1_uid214_exp10PolyEval_in : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid227_pT1_uid214_exp10PolyEval_b : std_logic_vector (13 downto 0);
    signal prodXYTruncFR_uid230_pT2_uid220_exp10PolyEval_in : std_logic_vector (40 downto 0);
    signal prodXYTruncFR_uid230_pT2_uid220_exp10PolyEval_b : std_logic_vector (23 downto 0);
    signal rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector (33 downto 0);
    signal yPPolyEval_uid65_fpExp10Test_in : std_logic_vector (17 downto 0);
    signal yPPolyEval_uid65_fpExp10Test_b : std_logic_vector (17 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_nor_q : std_logic_vector(0 downto 0);
    signal concExc_uid88_fpExp10Test_q : std_logic_vector (2 downto 0);
    signal ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_nor_q : std_logic_vector(0 downto 0);
    signal InvSignX_uid81_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid81_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal oFracX_uid32_uid32_fpExp10Test_q : std_logic_vector (23 downto 0);
    signal InvExpXIsZero_uid29_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid29_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid25_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid25_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid28_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid28_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal posInf_uid86_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal posInf_uid86_fpExp10Test_b : std_logic_vector(0 downto 0);
    signal posInf_uid86_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal expOvfInitial_uid41_fpExp10Test_in : std_logic_vector (8 downto 0);
    signal expOvfInitial_uid41_fpExp10Test_b : std_logic_vector (0 downto 0);
    signal shiftValuePreSatRed_uid43_fpExp10Test_in : std_logic_vector (5 downto 0);
    signal shiftValuePreSatRed_uid43_fpExp10Test_b : std_logic_vector (5 downto 0);
    signal rightShiftStageSel5Dto4_uid127_fxpInPostAlign_uid45_fpExp10Test_in : std_logic_vector (5 downto 0);
    signal rightShiftStageSel5Dto4_uid127_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_in : std_logic_vector (3 downto 0);
    signal rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_in : std_logic_vector (1 downto 0);
    signal rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector (1 downto 0);
    signal fxpInPreAlign_uid51_fpExp10Test_in : std_logic_vector (33 downto 0);
    signal fxpInPreAlign_uid51_fpExp10Test_b : std_logic_vector (33 downto 0);
    signal YExt43_uid59_fpExp10Test_in : std_logic_vector (43 downto 0);
    signal YExt43_uid59_fpExp10Test_b : std_logic_vector (0 downto 0);
    signal yRed_uid61_fpExp10Test_in : std_logic_vector (30 downto 0);
    signal yRed_uid61_fpExp10Test_b : std_logic_vector (25 downto 0);
    signal addr_uid64_fpExp10Test_in : std_logic_vector (25 downto 0);
    signal addr_uid64_fpExp10Test_b : std_logic_vector (7 downto 0);
    signal expR_uid75_fpExp10Test_in : std_logic_vector (7 downto 0);
    signal expR_uid75_fpExp10Test_b : std_logic_vector (7 downto 0);
    signal RExp10_uid98_fpExp10Test_q : std_logic_vector (31 downto 0);
    signal sR_uid114_constMult_in : std_logic_vector (31 downto 0);
    signal sR_uid114_constMult_b : std_logic_vector (28 downto 0);
    signal RightShiftStage036dto4_uid131_fxpInPostAlign_uid45_fpExp10Test_in : std_logic_vector (36 downto 0);
    signal RightShiftStage036dto4_uid131_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector (32 downto 0);
    signal RightShiftStage036dto8_uid135_fxpInPostAlign_uid45_fpExp10Test_in : std_logic_vector (36 downto 0);
    signal RightShiftStage036dto8_uid135_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector (28 downto 0);
    signal RightShiftStage036dto12_uid139_fxpInPostAlign_uid45_fpExp10Test_in : std_logic_vector (36 downto 0);
    signal RightShiftStage036dto12_uid139_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector (24 downto 0);
    signal sR_uid163_constMult_in : std_logic_vector (44 downto 0);
    signal sR_uid163_constMult_b : std_logic_vector (42 downto 0);
    signal RightShiftStage033dto4_uid180_fxpInPostAlign_X_uid56_fpExp10Test_in : std_logic_vector (33 downto 0);
    signal RightShiftStage033dto4_uid180_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector (29 downto 0);
    signal RightShiftStage033dto8_uid184_fxpInPostAlign_X_uid56_fpExp10Test_in : std_logic_vector (33 downto 0);
    signal RightShiftStage033dto8_uid184_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector (25 downto 0);
    signal RightShiftStage033dto12_uid188_fxpInPostAlign_X_uid56_fpExp10Test_in : std_logic_vector (33 downto 0);
    signal RightShiftStage033dto12_uid188_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector (21 downto 0);
    signal lowRangeB_uid215_exp10PolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid215_exp10PolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid216_exp10PolyEval_in : std_logic_vector (13 downto 0);
    signal highBBits_uid216_exp10PolyEval_b : std_logic_vector (12 downto 0);
    signal lowRangeB_uid221_exp10PolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid221_exp10PolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid222_exp10PolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid222_exp10PolyEval_b : std_logic_vector (21 downto 0);
    signal RightShiftStage136dto1_uid145_fxpInPostAlign_uid45_fpExp10Test_in : std_logic_vector (36 downto 0);
    signal RightShiftStage136dto1_uid145_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector (35 downto 0);
    signal RightShiftStage136dto2_uid149_fxpInPostAlign_uid45_fpExp10Test_in : std_logic_vector (36 downto 0);
    signal RightShiftStage136dto2_uid149_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector (34 downto 0);
    signal RightShiftStage136dto3_uid153_fxpInPostAlign_uid45_fpExp10Test_in : std_logic_vector (36 downto 0);
    signal RightShiftStage136dto3_uid153_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector (33 downto 0);
    signal ePreRnd_uid46_fpExp10Test_in : std_logic_vector (36 downto 0);
    signal ePreRnd_uid46_fpExp10Test_b : std_logic_vector (11 downto 0);
    signal RightShiftStage133dto1_uid194_fxpInPostAlign_X_uid56_fpExp10Test_in : std_logic_vector (33 downto 0);
    signal RightShiftStage133dto1_uid194_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector (32 downto 0);
    signal RightShiftStage133dto2_uid198_fxpInPostAlign_X_uid56_fpExp10Test_in : std_logic_vector (33 downto 0);
    signal RightShiftStage133dto2_uid198_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector (31 downto 0);
    signal RightShiftStage133dto3_uid202_fxpInPostAlign_X_uid56_fpExp10Test_in : std_logic_vector (33 downto 0);
    signal RightShiftStage133dto3_uid202_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector (30 downto 0);
    signal yT1_uid213_exp10PolyEval_in : std_logic_vector (17 downto 0);
    signal yT1_uid213_exp10PolyEval_b : std_logic_vector (12 downto 0);
    signal oFracX_uid33_fpExp10Test_q : std_logic_vector (24 downto 0);
    signal exc_N_uid26_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal exc_N_uid26_fpExp10Test_b : std_logic_vector(0 downto 0);
    signal exc_N_uid26_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_in : std_logic_vector (33 downto 0);
    signal msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector (0 downto 0);
    signal X33dto16_uid168_fxpInPostAlign_X_uid56_fpExp10Test_in : std_logic_vector (33 downto 0);
    signal X33dto16_uid168_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector (17 downto 0);
    signal X33dto32_uid172_fxpInPostAlign_X_uid56_fpExp10Test_in : std_logic_vector (33 downto 0);
    signal X33dto32_uid172_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector (1 downto 0);
    signal oFracXZwE_uid39_fpExp10Test_q : std_logic_vector (36 downto 0);
    signal sumAHighB_uid217_exp10PolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid217_exp10PolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid217_exp10PolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid217_exp10PolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid223_exp10PolyEval_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid223_exp10PolyEval_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid223_exp10PolyEval_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid223_exp10PolyEval_q : std_logic_vector (29 downto 0);
    signal rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (36 downto 0);
    signal xv0_uid158_constMult_in : std_logic_vector (5 downto 0);
    signal xv0_uid158_constMult_b : std_logic_vector (5 downto 0);
    signal xv1_uid159_constMult_in : std_logic_vector (11 downto 0);
    signal xv1_uid159_constMult_b : std_logic_vector (5 downto 0);
    signal rightShiftStage2Idx1_uid195_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector (33 downto 0);
    signal onesCmpFxpInX_uid34_fpExp10Test_a : std_logic_vector(24 downto 0);
    signal onesCmpFxpInX_uid34_fpExp10Test_b : std_logic_vector(24 downto 0);
    signal onesCmpFxpInX_uid34_fpExp10Test_q : std_logic_vector(24 downto 0);
    signal InvExc_N_uid27_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid27_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0Idx1Pad16_uid167_fxpInPostAlign_X_uid56_fpExp10Test_a : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx1Pad16_uid167_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx1Pad16_uid167_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx2Pad32_uid171_fxpInPostAlign_X_uid56_fpExp10Test_a : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx2Pad32_uid171_fxpInPostAlign_X_uid56_fpExp10Test_b : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx2Pad32_uid171_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx1_uid169_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage0Idx2_uid173_fxpInPostAlign_X_uid56_fpExp10Test_q : std_logic_vector (33 downto 0);
    signal msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_in : std_logic_vector (36 downto 0);
    signal msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector (0 downto 0);
    signal X36dto16_uid119_fxpInPostAlign_uid45_fpExp10Test_in : std_logic_vector (36 downto 0);
    signal X36dto16_uid119_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector (20 downto 0);
    signal X36dto32_uid123_fxpInPostAlign_uid45_fpExp10Test_in : std_logic_vector (36 downto 0);
    signal X36dto32_uid123_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector (4 downto 0);
    signal s1_uid215_uid218_exp10PolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid221_uid224_exp10PolyEval_q : std_logic_vector (31 downto 0);
    signal fxpInExtX_uid35_fpExp10Test_a : std_logic_vector(26 downto 0);
    signal fxpInExtX_uid35_fpExp10Test_b : std_logic_vector(26 downto 0);
    signal fxpInExtX_uid35_fpExp10Test_o : std_logic_vector (26 downto 0);
    signal fxpInExtX_uid35_fpExp10Test_q : std_logic_vector (25 downto 0);
    signal exc_R_uid30_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal exc_R_uid30_fpExp10Test_b : std_logic_vector(0 downto 0);
    signal exc_R_uid30_fpExp10Test_c : std_logic_vector(0 downto 0);
    signal exc_R_uid30_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0Idx1Pad16_uid118_fxpInPostAlign_uid45_fpExp10Test_a : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx1Pad16_uid118_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx1Pad16_uid118_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx2Pad32_uid122_fxpInPostAlign_uid45_fpExp10Test_a : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx2Pad32_uid122_fxpInPostAlign_uid45_fpExp10Test_b : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx2Pad32_uid122_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx1_uid120_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage0Idx2_uid124_fxpInPostAlign_uid45_fpExp10Test_q : std_logic_vector (36 downto 0);
    signal peOR_uid67_fpExp10Test_in : std_logic_vector (28 downto 0);
    signal peOR_uid67_fpExp10Test_b : std_logic_vector (23 downto 0);
    signal peORExpInc_uid68_fpExp10Test_in : std_logic_vector (29 downto 0);
    signal peORExpInc_uid68_fpExp10Test_b : std_logic_vector (0 downto 0);
    signal fxpInPreAlign_uid36_fpExp10Test_in : std_logic_vector (24 downto 0);
    signal fxpInPreAlign_uid36_fpExp10Test_b : std_logic_vector (24 downto 0);
    signal regXAndExpOverflowAndNeg_uid77_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndNeg_uid77_fpExp10Test_b : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndNeg_uid77_fpExp10Test_c : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndNeg_uid77_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid82_fpExp10Test_a : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid82_fpExp10Test_b : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid82_fpExp10Test_c : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid82_fpExp10Test_q : std_logic_vector(0 downto 0);
    signal fracR_uid71_fpExp10Test_in : std_logic_vector (22 downto 0);
    signal fracR_uid71_fpExp10Test_b : std_logic_vector (22 downto 0);
    signal xv0_uid100_constMult_in : std_logic_vector (5 downto 0);
    signal xv0_uid100_constMult_b : std_logic_vector (5 downto 0);
    signal xv1_uid101_constMult_in : std_logic_vector (11 downto 0);
    signal xv1_uid101_constMult_b : std_logic_vector (5 downto 0);
    signal xv2_uid102_constMult_in : std_logic_vector (17 downto 0);
    signal xv2_uid102_constMult_b : std_logic_vector (5 downto 0);
    signal xv3_uid103_constMult_in : std_logic_vector (23 downto 0);
    signal xv3_uid103_constMult_b : std_logic_vector (5 downto 0);
    signal xv4_uid104_constMult_in : std_logic_vector (24 downto 0);
    signal xv4_uid104_constMult_b : std_logic_vector (0 downto 0);
begin


	--GND(CONSTANT,0)
    GND_q <= "0";

	--cstAllOWE_uid15_fpExp10Test(CONSTANT,14)
    cstAllOWE_uid15_fpExp10Test_q <= "11111111";

	--zY_uid60_fpExp10Test(CONSTANT,59)
    zY_uid60_fpExp10Test_q <= "00000000000000000000000000";

	--signX_uid7_fpExp10Test(BITSELECT,6)@0
    signX_uid7_fpExp10Test_in <= a;
    signX_uid7_fpExp10Test_b <= signX_uid7_fpExp10Test_in(31 downto 31);

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--frac_uid22_fpExp10Test(BITSELECT,21)@0
    frac_uid22_fpExp10Test_in <= a(22 downto 0);
    frac_uid22_fpExp10Test_b <= frac_uid22_fpExp10Test_in(22 downto 0);

	--oFracX_uid32_uid32_fpExp10Test(BITJOIN,31)@0
    oFracX_uid32_uid32_fpExp10Test_q <= VCC_q & frac_uid22_fpExp10Test_b;

	--oFracX_uid33_fpExp10Test(BITJOIN,32)@0
    oFracX_uid33_fpExp10Test_q <= GND_q & oFracX_uid32_uid32_fpExp10Test_q;

	--onesCmpFxpInX_uid34_fpExp10Test(LOGICAL,33)@0
    onesCmpFxpInX_uid34_fpExp10Test_a <= oFracX_uid33_fpExp10Test_q;
    onesCmpFxpInX_uid34_fpExp10Test_b <= STD_LOGIC_VECTOR((24 downto 1 => signX_uid7_fpExp10Test_b(0)) & signX_uid7_fpExp10Test_b);
    onesCmpFxpInX_uid34_fpExp10Test_q <= onesCmpFxpInX_uid34_fpExp10Test_a xor onesCmpFxpInX_uid34_fpExp10Test_b;

	--fxpInExtX_uid35_fpExp10Test(ADD,34)@0
    fxpInExtX_uid35_fpExp10Test_a <= STD_LOGIC_VECTOR((26 downto 25 => onesCmpFxpInX_uid34_fpExp10Test_q(24)) & onesCmpFxpInX_uid34_fpExp10Test_q);
    fxpInExtX_uid35_fpExp10Test_b <= STD_LOGIC_VECTOR('0' & "0000000000000000000000000" & signX_uid7_fpExp10Test_b);
            fxpInExtX_uid35_fpExp10Test_o <= STD_LOGIC_VECTOR(SIGNED(fxpInExtX_uid35_fpExp10Test_a) + SIGNED(fxpInExtX_uid35_fpExp10Test_b));
    fxpInExtX_uid35_fpExp10Test_q <= fxpInExtX_uid35_fpExp10Test_o(25 downto 0);


	--fxpInPreAlign_uid36_fpExp10Test(BITSELECT,35)@0
    fxpInPreAlign_uid36_fpExp10Test_in <= fxpInExtX_uid35_fpExp10Test_q(24 downto 0);
    fxpInPreAlign_uid36_fpExp10Test_b <= fxpInPreAlign_uid36_fpExp10Test_in(24 downto 0);

	--xv0_uid100_constMult(BITSELECT,99)@0
    xv0_uid100_constMult_in <= fxpInPreAlign_uid36_fpExp10Test_b(5 downto 0);
    xv0_uid100_constMult_b <= xv0_uid100_constMult_in(5 downto 0);

	--reg_xv0_uid100_constMult_0_to_p0_uid109_constMult_0(REG,239)@0
    reg_xv0_uid100_constMult_0_to_p0_uid109_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv0_uid100_constMult_0_to_p0_uid109_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv0_uid100_constMult_0_to_p0_uid109_constMult_0_q <= xv0_uid100_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xv0_uid100_constMult_0_to_p0_uid109_constMult_0_q_to_p0_uid109_constMult_a(DELAY,376)@1
    ld_reg_xv0_uid100_constMult_0_to_p0_uid109_constMult_0_q_to_p0_uid109_constMult_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 3 )
    PORT MAP ( xin => reg_xv0_uid100_constMult_0_to_p0_uid109_constMult_0_q, xout => ld_reg_xv0_uid100_constMult_0_to_p0_uid109_constMult_0_q_to_p0_uid109_constMult_a_q, ena => en(0), clk => clk, aclr => areset );

	--p0_uid109_constMult(LOOKUP,108)@4
    p0_uid109_constMult: PROCESS (ld_reg_xv0_uid100_constMult_0_to_p0_uid109_constMult_0_q_to_p0_uid109_constMult_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_xv0_uid100_constMult_0_to_p0_uid109_constMult_0_q_to_p0_uid109_constMult_a_q) IS
                WHEN "000000" =>  p0_uid109_constMult_q <= "0000000000000";
                WHEN "000001" =>  p0_uid109_constMult_q <= "0000001101010";
                WHEN "000010" =>  p0_uid109_constMult_q <= "0000011010101";
                WHEN "000011" =>  p0_uid109_constMult_q <= "0000100111111";
                WHEN "000100" =>  p0_uid109_constMult_q <= "0000110101001";
                WHEN "000101" =>  p0_uid109_constMult_q <= "0001000010100";
                WHEN "000110" =>  p0_uid109_constMult_q <= "0001001111110";
                WHEN "000111" =>  p0_uid109_constMult_q <= "0001011101000";
                WHEN "001000" =>  p0_uid109_constMult_q <= "0001101010010";
                WHEN "001001" =>  p0_uid109_constMult_q <= "0001110111101";
                WHEN "001010" =>  p0_uid109_constMult_q <= "0010000100111";
                WHEN "001011" =>  p0_uid109_constMult_q <= "0010010010001";
                WHEN "001100" =>  p0_uid109_constMult_q <= "0010011111100";
                WHEN "001101" =>  p0_uid109_constMult_q <= "0010101100110";
                WHEN "001110" =>  p0_uid109_constMult_q <= "0010111010000";
                WHEN "001111" =>  p0_uid109_constMult_q <= "0011000111011";
                WHEN "010000" =>  p0_uid109_constMult_q <= "0011010100101";
                WHEN "010001" =>  p0_uid109_constMult_q <= "0011100001111";
                WHEN "010010" =>  p0_uid109_constMult_q <= "0011101111001";
                WHEN "010011" =>  p0_uid109_constMult_q <= "0011111100100";
                WHEN "010100" =>  p0_uid109_constMult_q <= "0100001001110";
                WHEN "010101" =>  p0_uid109_constMult_q <= "0100010111000";
                WHEN "010110" =>  p0_uid109_constMult_q <= "0100100100011";
                WHEN "010111" =>  p0_uid109_constMult_q <= "0100110001101";
                WHEN "011000" =>  p0_uid109_constMult_q <= "0100111110111";
                WHEN "011001" =>  p0_uid109_constMult_q <= "0101001100010";
                WHEN "011010" =>  p0_uid109_constMult_q <= "0101011001100";
                WHEN "011011" =>  p0_uid109_constMult_q <= "0101100110110";
                WHEN "011100" =>  p0_uid109_constMult_q <= "0101110100000";
                WHEN "011101" =>  p0_uid109_constMult_q <= "0110000001011";
                WHEN "011110" =>  p0_uid109_constMult_q <= "0110001110101";
                WHEN "011111" =>  p0_uid109_constMult_q <= "0110011011111";
                WHEN "100000" =>  p0_uid109_constMult_q <= "0110101001010";
                WHEN "100001" =>  p0_uid109_constMult_q <= "0110110110100";
                WHEN "100010" =>  p0_uid109_constMult_q <= "0111000011110";
                WHEN "100011" =>  p0_uid109_constMult_q <= "0111010001001";
                WHEN "100100" =>  p0_uid109_constMult_q <= "0111011110011";
                WHEN "100101" =>  p0_uid109_constMult_q <= "0111101011101";
                WHEN "100110" =>  p0_uid109_constMult_q <= "0111111000111";
                WHEN "100111" =>  p0_uid109_constMult_q <= "1000000110010";
                WHEN "101000" =>  p0_uid109_constMult_q <= "1000010011100";
                WHEN "101001" =>  p0_uid109_constMult_q <= "1000100000110";
                WHEN "101010" =>  p0_uid109_constMult_q <= "1000101110001";
                WHEN "101011" =>  p0_uid109_constMult_q <= "1000111011011";
                WHEN "101100" =>  p0_uid109_constMult_q <= "1001001000101";
                WHEN "101101" =>  p0_uid109_constMult_q <= "1001010110000";
                WHEN "101110" =>  p0_uid109_constMult_q <= "1001100011010";
                WHEN "101111" =>  p0_uid109_constMult_q <= "1001110000100";
                WHEN "110000" =>  p0_uid109_constMult_q <= "1001111101110";
                WHEN "110001" =>  p0_uid109_constMult_q <= "1010001011001";
                WHEN "110010" =>  p0_uid109_constMult_q <= "1010011000011";
                WHEN "110011" =>  p0_uid109_constMult_q <= "1010100101101";
                WHEN "110100" =>  p0_uid109_constMult_q <= "1010110011000";
                WHEN "110101" =>  p0_uid109_constMult_q <= "1011000000010";
                WHEN "110110" =>  p0_uid109_constMult_q <= "1011001101100";
                WHEN "110111" =>  p0_uid109_constMult_q <= "1011011010111";
                WHEN "111000" =>  p0_uid109_constMult_q <= "1011101000001";
                WHEN "111001" =>  p0_uid109_constMult_q <= "1011110101011";
                WHEN "111010" =>  p0_uid109_constMult_q <= "1100000010101";
                WHEN "111011" =>  p0_uid109_constMult_q <= "1100010000000";
                WHEN "111100" =>  p0_uid109_constMult_q <= "1100011101010";
                WHEN "111101" =>  p0_uid109_constMult_q <= "1100101010100";
                WHEN "111110" =>  p0_uid109_constMult_q <= "1100110111111";
                WHEN "111111" =>  p0_uid109_constMult_q <= "1101000101001";
                WHEN OTHERS =>
                    p0_uid109_constMult_q <= "0000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv1_uid101_constMult(BITSELECT,100)@0
    xv1_uid101_constMult_in <= fxpInPreAlign_uid36_fpExp10Test_b(11 downto 0);
    xv1_uid101_constMult_b <= xv1_uid101_constMult_in(11 downto 6);

	--ld_xv1_uid101_constMult_b_to_reg_xv1_uid101_constMult_0_to_p1_uid108_constMult_0_a(DELAY,520)@0
    ld_xv1_uid101_constMult_b_to_reg_xv1_uid101_constMult_0_to_p1_uid108_constMult_0_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 2 )
    PORT MAP ( xin => xv1_uid101_constMult_b, xout => ld_xv1_uid101_constMult_b_to_reg_xv1_uid101_constMult_0_to_p1_uid108_constMult_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_xv1_uid101_constMult_0_to_p1_uid108_constMult_0(REG,238)@2
    reg_xv1_uid101_constMult_0_to_p1_uid108_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv1_uid101_constMult_0_to_p1_uid108_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv1_uid101_constMult_0_to_p1_uid108_constMult_0_q <= ld_xv1_uid101_constMult_b_to_reg_xv1_uid101_constMult_0_to_p1_uid108_constMult_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--p1_uid108_constMult(LOOKUP,107)@3
    p1_uid108_constMult: PROCESS (reg_xv1_uid101_constMult_0_to_p1_uid108_constMult_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_xv1_uid101_constMult_0_to_p1_uid108_constMult_0_q) IS
                WHEN "000000" =>  p1_uid108_constMult_q <= "0000000000000000000";
                WHEN "000001" =>  p1_uid108_constMult_q <= "0000001101010010011";
                WHEN "000010" =>  p1_uid108_constMult_q <= "0000011010100100111";
                WHEN "000011" =>  p1_uid108_constMult_q <= "0000100111110111010";
                WHEN "000100" =>  p1_uid108_constMult_q <= "0000110101001001101";
                WHEN "000101" =>  p1_uid108_constMult_q <= "0001000010011100001";
                WHEN "000110" =>  p1_uid108_constMult_q <= "0001001111101110100";
                WHEN "000111" =>  p1_uid108_constMult_q <= "0001011101000000111";
                WHEN "001000" =>  p1_uid108_constMult_q <= "0001101010010011010";
                WHEN "001001" =>  p1_uid108_constMult_q <= "0001110111100101110";
                WHEN "001010" =>  p1_uid108_constMult_q <= "0010000100111000001";
                WHEN "001011" =>  p1_uid108_constMult_q <= "0010010010001010100";
                WHEN "001100" =>  p1_uid108_constMult_q <= "0010011111011101000";
                WHEN "001101" =>  p1_uid108_constMult_q <= "0010101100101111011";
                WHEN "001110" =>  p1_uid108_constMult_q <= "0010111010000001110";
                WHEN "001111" =>  p1_uid108_constMult_q <= "0011000111010100010";
                WHEN "010000" =>  p1_uid108_constMult_q <= "0011010100100110101";
                WHEN "010001" =>  p1_uid108_constMult_q <= "0011100001111001000";
                WHEN "010010" =>  p1_uid108_constMult_q <= "0011101111001011100";
                WHEN "010011" =>  p1_uid108_constMult_q <= "0011111100011101111";
                WHEN "010100" =>  p1_uid108_constMult_q <= "0100001001110000010";
                WHEN "010101" =>  p1_uid108_constMult_q <= "0100010111000010101";
                WHEN "010110" =>  p1_uid108_constMult_q <= "0100100100010101001";
                WHEN "010111" =>  p1_uid108_constMult_q <= "0100110001100111100";
                WHEN "011000" =>  p1_uid108_constMult_q <= "0100111110111001111";
                WHEN "011001" =>  p1_uid108_constMult_q <= "0101001100001100011";
                WHEN "011010" =>  p1_uid108_constMult_q <= "0101011001011110110";
                WHEN "011011" =>  p1_uid108_constMult_q <= "0101100110110001001";
                WHEN "011100" =>  p1_uid108_constMult_q <= "0101110100000011101";
                WHEN "011101" =>  p1_uid108_constMult_q <= "0110000001010110000";
                WHEN "011110" =>  p1_uid108_constMult_q <= "0110001110101000011";
                WHEN "011111" =>  p1_uid108_constMult_q <= "0110011011111010111";
                WHEN "100000" =>  p1_uid108_constMult_q <= "0110101001001101010";
                WHEN "100001" =>  p1_uid108_constMult_q <= "0110110110011111101";
                WHEN "100010" =>  p1_uid108_constMult_q <= "0111000011110010000";
                WHEN "100011" =>  p1_uid108_constMult_q <= "0111010001000100100";
                WHEN "100100" =>  p1_uid108_constMult_q <= "0111011110010110111";
                WHEN "100101" =>  p1_uid108_constMult_q <= "0111101011101001010";
                WHEN "100110" =>  p1_uid108_constMult_q <= "0111111000111011110";
                WHEN "100111" =>  p1_uid108_constMult_q <= "1000000110001110001";
                WHEN "101000" =>  p1_uid108_constMult_q <= "1000010011100000100";
                WHEN "101001" =>  p1_uid108_constMult_q <= "1000100000110011000";
                WHEN "101010" =>  p1_uid108_constMult_q <= "1000101110000101011";
                WHEN "101011" =>  p1_uid108_constMult_q <= "1000111011010111110";
                WHEN "101100" =>  p1_uid108_constMult_q <= "1001001000101010010";
                WHEN "101101" =>  p1_uid108_constMult_q <= "1001010101111100101";
                WHEN "101110" =>  p1_uid108_constMult_q <= "1001100011001111000";
                WHEN "101111" =>  p1_uid108_constMult_q <= "1001110000100001100";
                WHEN "110000" =>  p1_uid108_constMult_q <= "1001111101110011111";
                WHEN "110001" =>  p1_uid108_constMult_q <= "1010001011000110010";
                WHEN "110010" =>  p1_uid108_constMult_q <= "1010011000011000101";
                WHEN "110011" =>  p1_uid108_constMult_q <= "1010100101101011001";
                WHEN "110100" =>  p1_uid108_constMult_q <= "1010110010111101100";
                WHEN "110101" =>  p1_uid108_constMult_q <= "1011000000001111111";
                WHEN "110110" =>  p1_uid108_constMult_q <= "1011001101100010011";
                WHEN "110111" =>  p1_uid108_constMult_q <= "1011011010110100110";
                WHEN "111000" =>  p1_uid108_constMult_q <= "1011101000000111001";
                WHEN "111001" =>  p1_uid108_constMult_q <= "1011110101011001101";
                WHEN "111010" =>  p1_uid108_constMult_q <= "1100000010101100000";
                WHEN "111011" =>  p1_uid108_constMult_q <= "1100001111111110011";
                WHEN "111100" =>  p1_uid108_constMult_q <= "1100011101010000111";
                WHEN "111101" =>  p1_uid108_constMult_q <= "1100101010100011010";
                WHEN "111110" =>  p1_uid108_constMult_q <= "1100110111110101101";
                WHEN "111111" =>  p1_uid108_constMult_q <= "1101000101001000000";
                WHEN OTHERS =>
                    p1_uid108_constMult_q <= "0000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv2_uid102_constMult(BITSELECT,101)@0
    xv2_uid102_constMult_in <= fxpInPreAlign_uid36_fpExp10Test_b(17 downto 0);
    xv2_uid102_constMult_b <= xv2_uid102_constMult_in(17 downto 12);

	--reg_xv2_uid102_constMult_0_to_p2_uid107_constMult_0(REG,237)@0
    reg_xv2_uid102_constMult_0_to_p2_uid107_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv2_uid102_constMult_0_to_p2_uid107_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv2_uid102_constMult_0_to_p2_uid107_constMult_0_q <= xv2_uid102_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xv2_uid102_constMult_0_to_p2_uid107_constMult_0_q_to_p2_uid107_constMult_a(DELAY,374)@1
    ld_reg_xv2_uid102_constMult_0_to_p2_uid107_constMult_0_q_to_p2_uid107_constMult_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => reg_xv2_uid102_constMult_0_to_p2_uid107_constMult_0_q, xout => ld_reg_xv2_uid102_constMult_0_to_p2_uid107_constMult_0_q_to_p2_uid107_constMult_a_q, ena => en(0), clk => clk, aclr => areset );

	--p2_uid107_constMult(LOOKUP,106)@2
    p2_uid107_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p2_uid107_constMult_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_xv2_uid102_constMult_0_to_p2_uid107_constMult_0_q_to_p2_uid107_constMult_a_q) IS
                WHEN "000000" =>  p2_uid107_constMult_q <= "0000000000000000000000000";
                WHEN "000001" =>  p2_uid107_constMult_q <= "0000001101010010011010100";
                WHEN "000010" =>  p2_uid107_constMult_q <= "0000011010100100110101000";
                WHEN "000011" =>  p2_uid107_constMult_q <= "0000100111110111001111011";
                WHEN "000100" =>  p2_uid107_constMult_q <= "0000110101001001101001111";
                WHEN "000101" =>  p2_uid107_constMult_q <= "0001000010011100000100011";
                WHEN "000110" =>  p2_uid107_constMult_q <= "0001001111101110011110111";
                WHEN "000111" =>  p2_uid107_constMult_q <= "0001011101000000111001010";
                WHEN "001000" =>  p2_uid107_constMult_q <= "0001101010010011010011110";
                WHEN "001001" =>  p2_uid107_constMult_q <= "0001110111100101101110010";
                WHEN "001010" =>  p2_uid107_constMult_q <= "0010000100111000001000110";
                WHEN "001011" =>  p2_uid107_constMult_q <= "0010010010001010100011001";
                WHEN "001100" =>  p2_uid107_constMult_q <= "0010011111011100111101101";
                WHEN "001101" =>  p2_uid107_constMult_q <= "0010101100101111011000001";
                WHEN "001110" =>  p2_uid107_constMult_q <= "0010111010000001110010101";
                WHEN "001111" =>  p2_uid107_constMult_q <= "0011000111010100001101000";
                WHEN "010000" =>  p2_uid107_constMult_q <= "0011010100100110100111100";
                WHEN "010001" =>  p2_uid107_constMult_q <= "0011100001111001000010000";
                WHEN "010010" =>  p2_uid107_constMult_q <= "0011101111001011011100100";
                WHEN "010011" =>  p2_uid107_constMult_q <= "0011111100011101110110111";
                WHEN "010100" =>  p2_uid107_constMult_q <= "0100001001110000010001011";
                WHEN "010101" =>  p2_uid107_constMult_q <= "0100010111000010101011111";
                WHEN "010110" =>  p2_uid107_constMult_q <= "0100100100010101000110011";
                WHEN "010111" =>  p2_uid107_constMult_q <= "0100110001100111100000110";
                WHEN "011000" =>  p2_uid107_constMult_q <= "0100111110111001111011010";
                WHEN "011001" =>  p2_uid107_constMult_q <= "0101001100001100010101110";
                WHEN "011010" =>  p2_uid107_constMult_q <= "0101011001011110110000010";
                WHEN "011011" =>  p2_uid107_constMult_q <= "0101100110110001001010101";
                WHEN "011100" =>  p2_uid107_constMult_q <= "0101110100000011100101001";
                WHEN "011101" =>  p2_uid107_constMult_q <= "0110000001010101111111101";
                WHEN "011110" =>  p2_uid107_constMult_q <= "0110001110101000011010001";
                WHEN "011111" =>  p2_uid107_constMult_q <= "0110011011111010110100101";
                WHEN "100000" =>  p2_uid107_constMult_q <= "0110101001001101001111000";
                WHEN "100001" =>  p2_uid107_constMult_q <= "0110110110011111101001100";
                WHEN "100010" =>  p2_uid107_constMult_q <= "0111000011110010000100000";
                WHEN "100011" =>  p2_uid107_constMult_q <= "0111010001000100011110100";
                WHEN "100100" =>  p2_uid107_constMult_q <= "0111011110010110111000111";
                WHEN "100101" =>  p2_uid107_constMult_q <= "0111101011101001010011011";
                WHEN "100110" =>  p2_uid107_constMult_q <= "0111111000111011101101111";
                WHEN "100111" =>  p2_uid107_constMult_q <= "1000000110001110001000011";
                WHEN "101000" =>  p2_uid107_constMult_q <= "1000010011100000100010110";
                WHEN "101001" =>  p2_uid107_constMult_q <= "1000100000110010111101010";
                WHEN "101010" =>  p2_uid107_constMult_q <= "1000101110000101010111110";
                WHEN "101011" =>  p2_uid107_constMult_q <= "1000111011010111110010010";
                WHEN "101100" =>  p2_uid107_constMult_q <= "1001001000101010001100101";
                WHEN "101101" =>  p2_uid107_constMult_q <= "1001010101111100100111001";
                WHEN "101110" =>  p2_uid107_constMult_q <= "1001100011001111000001101";
                WHEN "101111" =>  p2_uid107_constMult_q <= "1001110000100001011100001";
                WHEN "110000" =>  p2_uid107_constMult_q <= "1001111101110011110110100";
                WHEN "110001" =>  p2_uid107_constMult_q <= "1010001011000110010001000";
                WHEN "110010" =>  p2_uid107_constMult_q <= "1010011000011000101011100";
                WHEN "110011" =>  p2_uid107_constMult_q <= "1010100101101011000110000";
                WHEN "110100" =>  p2_uid107_constMult_q <= "1010110010111101100000011";
                WHEN "110101" =>  p2_uid107_constMult_q <= "1011000000001111111010111";
                WHEN "110110" =>  p2_uid107_constMult_q <= "1011001101100010010101011";
                WHEN "110111" =>  p2_uid107_constMult_q <= "1011011010110100101111111";
                WHEN "111000" =>  p2_uid107_constMult_q <= "1011101000000111001010010";
                WHEN "111001" =>  p2_uid107_constMult_q <= "1011110101011001100100110";
                WHEN "111010" =>  p2_uid107_constMult_q <= "1100000010101011111111010";
                WHEN "111011" =>  p2_uid107_constMult_q <= "1100001111111110011001110";
                WHEN "111100" =>  p2_uid107_constMult_q <= "1100011101010000110100010";
                WHEN "111101" =>  p2_uid107_constMult_q <= "1100101010100011001110101";
                WHEN "111110" =>  p2_uid107_constMult_q <= "1100110111110101101001001";
                WHEN "111111" =>  p2_uid107_constMult_q <= "1101000101001000000011101";
                WHEN OTHERS =>
                    p2_uid107_constMult_q <= "0000000000000000000000000";
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--lev1_a1_uid111_constMult(ADD,110)@3
    lev1_a1_uid111_constMult_a <= STD_LOGIC_VECTOR("0" & p2_uid107_constMult_q);
    lev1_a1_uid111_constMult_b <= STD_LOGIC_VECTOR("0000000" & p1_uid108_constMult_q);
            lev1_a1_uid111_constMult_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a1_uid111_constMult_a) + UNSIGNED(lev1_a1_uid111_constMult_b));
    lev1_a1_uid111_constMult_q <= lev1_a1_uid111_constMult_o(25 downto 0);


	--xv3_uid103_constMult(BITSELECT,102)@0
    xv3_uid103_constMult_in <= fxpInPreAlign_uid36_fpExp10Test_b(23 downto 0);
    xv3_uid103_constMult_b <= xv3_uid103_constMult_in(23 downto 18);

	--reg_xv3_uid103_constMult_0_to_p3_uid106_constMult_0(REG,236)@0
    reg_xv3_uid103_constMult_0_to_p3_uid106_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv3_uid103_constMult_0_to_p3_uid106_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv3_uid103_constMult_0_to_p3_uid106_constMult_0_q <= xv3_uid103_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xv3_uid103_constMult_0_to_p3_uid106_constMult_0_q_to_p3_uid106_constMult_a(DELAY,373)@1
    ld_reg_xv3_uid103_constMult_0_to_p3_uid106_constMult_0_q_to_p3_uid106_constMult_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => reg_xv3_uid103_constMult_0_to_p3_uid106_constMult_0_q, xout => ld_reg_xv3_uid103_constMult_0_to_p3_uid106_constMult_0_q_to_p3_uid106_constMult_a_q, ena => en(0), clk => clk, aclr => areset );

	--p3_uid106_constMult(LOOKUP,105)@2
    p3_uid106_constMult: PROCESS (ld_reg_xv3_uid103_constMult_0_to_p3_uid106_constMult_0_q_to_p3_uid106_constMult_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_xv3_uid103_constMult_0_to_p3_uid106_constMult_0_q_to_p3_uid106_constMult_a_q) IS
                WHEN "000000" =>  p3_uid106_constMult_q <= "0000000000000000000000000000000";
                WHEN "000001" =>  p3_uid106_constMult_q <= "0000001101010010011010011110001";
                WHEN "000010" =>  p3_uid106_constMult_q <= "0000011010100100110100111100001";
                WHEN "000011" =>  p3_uid106_constMult_q <= "0000100111110111001111011010010";
                WHEN "000100" =>  p3_uid106_constMult_q <= "0000110101001001101001111000010";
                WHEN "000101" =>  p3_uid106_constMult_q <= "0001000010011100000100010110011";
                WHEN "000110" =>  p3_uid106_constMult_q <= "0001001111101110011110110100011";
                WHEN "000111" =>  p3_uid106_constMult_q <= "0001011101000000111001010010100";
                WHEN "001000" =>  p3_uid106_constMult_q <= "0001101010010011010011110000100";
                WHEN "001001" =>  p3_uid106_constMult_q <= "0001110111100101101110001110101";
                WHEN "001010" =>  p3_uid106_constMult_q <= "0010000100111000001000101100110";
                WHEN "001011" =>  p3_uid106_constMult_q <= "0010010010001010100011001010110";
                WHEN "001100" =>  p3_uid106_constMult_q <= "0010011111011100111101101000111";
                WHEN "001101" =>  p3_uid106_constMult_q <= "0010101100101111011000000110111";
                WHEN "001110" =>  p3_uid106_constMult_q <= "0010111010000001110010100101000";
                WHEN "001111" =>  p3_uid106_constMult_q <= "0011000111010100001101000011000";
                WHEN "010000" =>  p3_uid106_constMult_q <= "0011010100100110100111100001001";
                WHEN "010001" =>  p3_uid106_constMult_q <= "0011100001111001000001111111010";
                WHEN "010010" =>  p3_uid106_constMult_q <= "0011101111001011011100011101010";
                WHEN "010011" =>  p3_uid106_constMult_q <= "0011111100011101110110111011011";
                WHEN "010100" =>  p3_uid106_constMult_q <= "0100001001110000010001011001011";
                WHEN "010101" =>  p3_uid106_constMult_q <= "0100010111000010101011110111100";
                WHEN "010110" =>  p3_uid106_constMult_q <= "0100100100010101000110010101100";
                WHEN "010111" =>  p3_uid106_constMult_q <= "0100110001100111100000110011101";
                WHEN "011000" =>  p3_uid106_constMult_q <= "0100111110111001111011010001110";
                WHEN "011001" =>  p3_uid106_constMult_q <= "0101001100001100010101101111110";
                WHEN "011010" =>  p3_uid106_constMult_q <= "0101011001011110110000001101111";
                WHEN "011011" =>  p3_uid106_constMult_q <= "0101100110110001001010101011111";
                WHEN "011100" =>  p3_uid106_constMult_q <= "0101110100000011100101001010000";
                WHEN "011101" =>  p3_uid106_constMult_q <= "0110000001010101111111101000000";
                WHEN "011110" =>  p3_uid106_constMult_q <= "0110001110101000011010000110001";
                WHEN "011111" =>  p3_uid106_constMult_q <= "0110011011111010110100100100001";
                WHEN "100000" =>  p3_uid106_constMult_q <= "0110101001001101001111000010010";
                WHEN "100001" =>  p3_uid106_constMult_q <= "0110110110011111101001100000011";
                WHEN "100010" =>  p3_uid106_constMult_q <= "0111000011110010000011111110011";
                WHEN "100011" =>  p3_uid106_constMult_q <= "0111010001000100011110011100100";
                WHEN "100100" =>  p3_uid106_constMult_q <= "0111011110010110111000111010100";
                WHEN "100101" =>  p3_uid106_constMult_q <= "0111101011101001010011011000101";
                WHEN "100110" =>  p3_uid106_constMult_q <= "0111111000111011101101110110101";
                WHEN "100111" =>  p3_uid106_constMult_q <= "1000000110001110001000010100110";
                WHEN "101000" =>  p3_uid106_constMult_q <= "1000010011100000100010110010110";
                WHEN "101001" =>  p3_uid106_constMult_q <= "1000100000110010111101010000111";
                WHEN "101010" =>  p3_uid106_constMult_q <= "1000101110000101010111101111000";
                WHEN "101011" =>  p3_uid106_constMult_q <= "1000111011010111110010001101000";
                WHEN "101100" =>  p3_uid106_constMult_q <= "1001001000101010001100101011001";
                WHEN "101101" =>  p3_uid106_constMult_q <= "1001010101111100100111001001001";
                WHEN "101110" =>  p3_uid106_constMult_q <= "1001100011001111000001100111010";
                WHEN "101111" =>  p3_uid106_constMult_q <= "1001110000100001011100000101010";
                WHEN "110000" =>  p3_uid106_constMult_q <= "1001111101110011110110100011011";
                WHEN "110001" =>  p3_uid106_constMult_q <= "1010001011000110010001000001100";
                WHEN "110010" =>  p3_uid106_constMult_q <= "1010011000011000101011011111100";
                WHEN "110011" =>  p3_uid106_constMult_q <= "1010100101101011000101111101101";
                WHEN "110100" =>  p3_uid106_constMult_q <= "1010110010111101100000011011101";
                WHEN "110101" =>  p3_uid106_constMult_q <= "1011000000001111111010111001110";
                WHEN "110110" =>  p3_uid106_constMult_q <= "1011001101100010010101010111110";
                WHEN "110111" =>  p3_uid106_constMult_q <= "1011011010110100101111110101111";
                WHEN "111000" =>  p3_uid106_constMult_q <= "1011101000000111001010010100000";
                WHEN "111001" =>  p3_uid106_constMult_q <= "1011110101011001100100110010000";
                WHEN "111010" =>  p3_uid106_constMult_q <= "1100000010101011111111010000001";
                WHEN "111011" =>  p3_uid106_constMult_q <= "1100001111111110011001101110001";
                WHEN "111100" =>  p3_uid106_constMult_q <= "1100011101010000110100001100010";
                WHEN "111101" =>  p3_uid106_constMult_q <= "1100101010100011001110101010010";
                WHEN "111110" =>  p3_uid106_constMult_q <= "1100110111110101101001001000011";
                WHEN "111111" =>  p3_uid106_constMult_q <= "1101000101001000000011100110011";
                WHEN OTHERS =>
                    p3_uid106_constMult_q <= "0000000000000000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv4_uid104_constMult(BITSELECT,103)@0
    xv4_uid104_constMult_in <= fxpInPreAlign_uid36_fpExp10Test_b;
    xv4_uid104_constMult_b <= xv4_uid104_constMult_in(24 downto 24);

	--reg_xv4_uid104_constMult_0_to_p4_uid105_constMult_0(REG,235)@0
    reg_xv4_uid104_constMult_0_to_p4_uid105_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv4_uid104_constMult_0_to_p4_uid105_constMult_0_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv4_uid104_constMult_0_to_p4_uid105_constMult_0_q <= xv4_uid104_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--p4_uid105_constMult(LOOKUP,104)@1
    p4_uid105_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p4_uid105_constMult_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_xv4_uid104_constMult_0_to_p4_uid105_constMult_0_q) IS
                WHEN "0" =>  p4_uid105_constMult_q <= "00000000000000000000000000000000";
                WHEN "1" =>  p4_uid105_constMult_q <= "10010101101100101100001111011100";
                WHEN OTHERS =>
                    p4_uid105_constMult_q <= "00000000000000000000000000000000";
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--lev1_a0_uid110_constMult(ADD,109)@2
    lev1_a0_uid110_constMult_a <= STD_LOGIC_VECTOR((33 downto 32 => p4_uid105_constMult_q(31)) & p4_uid105_constMult_q);
    lev1_a0_uid110_constMult_b <= STD_LOGIC_VECTOR('0' & "00" & p3_uid106_constMult_q);
    lev1_a0_uid110_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a0_uid110_constMult_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                lev1_a0_uid110_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0_uid110_constMult_a) + SIGNED(lev1_a0_uid110_constMult_b));
            END IF;
        END IF;
    END PROCESS;
    lev1_a0_uid110_constMult_q <= lev1_a0_uid110_constMult_o(32 downto 0);


	--lev2_a0_uid112_constMult(ADD,111)@3
    lev2_a0_uid112_constMult_a <= STD_LOGIC_VECTOR((34 downto 33 => lev1_a0_uid110_constMult_q(32)) & lev1_a0_uid110_constMult_q);
    lev2_a0_uid112_constMult_b <= STD_LOGIC_VECTOR('0' & "00000000" & lev1_a1_uid111_constMult_q);
    lev2_a0_uid112_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev2_a0_uid112_constMult_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                lev2_a0_uid112_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0_uid112_constMult_a) + SIGNED(lev2_a0_uid112_constMult_b));
            END IF;
        END IF;
    END PROCESS;
    lev2_a0_uid112_constMult_q <= lev2_a0_uid112_constMult_o(33 downto 0);


	--lev3_a0_uid113_constMult(ADD,112)@4
    lev3_a0_uid113_constMult_a <= STD_LOGIC_VECTOR((35 downto 34 => lev2_a0_uid112_constMult_q(33)) & lev2_a0_uid112_constMult_q);
    lev3_a0_uid113_constMult_b <= STD_LOGIC_VECTOR('0' & "0000000000000000000000" & p0_uid109_constMult_q);
            lev3_a0_uid113_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev3_a0_uid113_constMult_a) + SIGNED(lev3_a0_uid113_constMult_b));
    lev3_a0_uid113_constMult_q <= lev3_a0_uid113_constMult_o(34 downto 0);


	--sR_uid114_constMult(BITSELECT,113)@4
    sR_uid114_constMult_in <= lev3_a0_uid113_constMult_q(31 downto 0);
    sR_uid114_constMult_b <= sR_uid114_constMult_in(31 downto 3);

	--oFracXZwE_uid39_fpExp10Test(BITJOIN,38)@4
    oFracXZwE_uid39_fpExp10Test_q <= sR_uid114_constMult_b & cstZeroWE_uid11_fpExp10Test_q;

	--msbx_uid116_fxpInPostAlign_uid45_fpExp10Test(BITSELECT,115)@4
    msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_in <= oFracXZwE_uid39_fpExp10Test_q;
    msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b <= msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_in(36 downto 36);

	--ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_b(DELAY,424)@4
    ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b, xout => ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--z_uid151_fxpInPostAlign_uid45_fpExp10Test(CONSTANT,150)
    z_uid151_fxpInPostAlign_uid45_fpExp10Test_q <= "000";

	--rightShiftStage2Idx3Pad3_uid152_fxpInPostAlign_uid45_fpExp10Test(LOGICAL,151)@6
    rightShiftStage2Idx3Pad3_uid152_fxpInPostAlign_uid45_fpExp10Test_a <= z_uid151_fxpInPostAlign_uid45_fpExp10Test_q;
    rightShiftStage2Idx3Pad3_uid152_fxpInPostAlign_uid45_fpExp10Test_b <= STD_LOGIC_VECTOR((2 downto 1 => ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_b_q(0)) & ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_b_q);
    rightShiftStage2Idx3Pad3_uid152_fxpInPostAlign_uid45_fpExp10Test_q_i <= rightShiftStage2Idx3Pad3_uid152_fxpInPostAlign_uid45_fpExp10Test_a or rightShiftStage2Idx3Pad3_uid152_fxpInPostAlign_uid45_fpExp10Test_b;
    rightShiftStage2Idx3Pad3_uid152_fxpInPostAlign_uid45_fpExp10Test_delay : dspba_delay
    GENERIC MAP (width => 3, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx3Pad3_uid152_fxpInPostAlign_uid45_fpExp10Test_q, xin => rightShiftStage2Idx3Pad3_uid152_fxpInPostAlign_uid45_fpExp10Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_b(DELAY,402)@4
    ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b, xout => ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--z_uid137_fxpInPostAlign_uid45_fpExp10Test(CONSTANT,136)
    z_uid137_fxpInPostAlign_uid45_fpExp10Test_q <= "000000000000";

	--rightShiftStage1Idx3Pad12_uid138_fxpInPostAlign_uid45_fpExp10Test(LOGICAL,137)@5
    rightShiftStage1Idx3Pad12_uid138_fxpInPostAlign_uid45_fpExp10Test_a <= z_uid137_fxpInPostAlign_uid45_fpExp10Test_q;
    rightShiftStage1Idx3Pad12_uid138_fxpInPostAlign_uid45_fpExp10Test_b <= STD_LOGIC_VECTOR((11 downto 1 => ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_b_q(0)) & ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_b_q);
    rightShiftStage1Idx3Pad12_uid138_fxpInPostAlign_uid45_fpExp10Test_q_i <= rightShiftStage1Idx3Pad12_uid138_fxpInPostAlign_uid45_fpExp10Test_a or rightShiftStage1Idx3Pad12_uid138_fxpInPostAlign_uid45_fpExp10Test_b;
    rightShiftStage1Idx3Pad12_uid138_fxpInPostAlign_uid45_fpExp10Test_delay : dspba_delay
    GENERIC MAP (width => 12, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx3Pad12_uid138_fxpInPostAlign_uid45_fpExp10Test_q, xin => rightShiftStage1Idx3Pad12_uid138_fxpInPostAlign_uid45_fpExp10Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--rightShiftStage0Idx3_uid125_fxpInPostAlign_uid45_fpExp10Test(CONSTANT,124)
    rightShiftStage0Idx3_uid125_fxpInPostAlign_uid45_fpExp10Test_q <= "0000000000000000000000000000000000000";

	--rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test(LOGICAL,125)@4
    rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test_a <= rightShiftStage0Idx3_uid125_fxpInPostAlign_uid45_fpExp10Test_q;
    rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test_b <= STD_LOGIC_VECTOR((36 downto 1 => msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b(0)) & msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b);
    rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test_q_i <= rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test_a or rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test_b;
    rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test_delay : dspba_delay
    GENERIC MAP (width => 37, depth => 1)
    PORT MAP (xout => rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test_q, xin => rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--z_uid121_fxpInPostAlign_uid45_fpExp10Test(CONSTANT,120)
    z_uid121_fxpInPostAlign_uid45_fpExp10Test_q <= "00000000000000000000000000000000";

	--rightShiftStage0Idx2Pad32_uid122_fxpInPostAlign_uid45_fpExp10Test(LOGICAL,121)@4
    rightShiftStage0Idx2Pad32_uid122_fxpInPostAlign_uid45_fpExp10Test_a <= z_uid121_fxpInPostAlign_uid45_fpExp10Test_q;
    rightShiftStage0Idx2Pad32_uid122_fxpInPostAlign_uid45_fpExp10Test_b <= STD_LOGIC_VECTOR((31 downto 1 => msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b(0)) & msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b);
    rightShiftStage0Idx2Pad32_uid122_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage0Idx2Pad32_uid122_fxpInPostAlign_uid45_fpExp10Test_a or rightShiftStage0Idx2Pad32_uid122_fxpInPostAlign_uid45_fpExp10Test_b;

	--X36dto32_uid123_fxpInPostAlign_uid45_fpExp10Test(BITSELECT,122)@4
    X36dto32_uid123_fxpInPostAlign_uid45_fpExp10Test_in <= oFracXZwE_uid39_fpExp10Test_q;
    X36dto32_uid123_fxpInPostAlign_uid45_fpExp10Test_b <= X36dto32_uid123_fxpInPostAlign_uid45_fpExp10Test_in(36 downto 32);

	--rightShiftStage0Idx2_uid124_fxpInPostAlign_uid45_fpExp10Test(BITJOIN,123)@4
    rightShiftStage0Idx2_uid124_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage0Idx2Pad32_uid122_fxpInPostAlign_uid45_fpExp10Test_q & X36dto32_uid123_fxpInPostAlign_uid45_fpExp10Test_b;

	--reg_rightShiftStage0Idx2_uid124_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_4(REG,243)@4
    reg_rightShiftStage0Idx2_uid124_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx2_uid124_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_4_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx2_uid124_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_4_q <= rightShiftStage0Idx2_uid124_fxpInPostAlign_uid45_fpExp10Test_q;
            END IF;
        END IF;
    END PROCESS;


	--z_uid117_fxpInPostAlign_uid45_fpExp10Test(CONSTANT,116)
    z_uid117_fxpInPostAlign_uid45_fpExp10Test_q <= "0000000000000000";

	--rightShiftStage0Idx1Pad16_uid118_fxpInPostAlign_uid45_fpExp10Test(LOGICAL,117)@4
    rightShiftStage0Idx1Pad16_uid118_fxpInPostAlign_uid45_fpExp10Test_a <= z_uid117_fxpInPostAlign_uid45_fpExp10Test_q;
    rightShiftStage0Idx1Pad16_uid118_fxpInPostAlign_uid45_fpExp10Test_b <= STD_LOGIC_VECTOR((15 downto 1 => msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b(0)) & msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b);
    rightShiftStage0Idx1Pad16_uid118_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage0Idx1Pad16_uid118_fxpInPostAlign_uid45_fpExp10Test_a or rightShiftStage0Idx1Pad16_uid118_fxpInPostAlign_uid45_fpExp10Test_b;

	--X36dto16_uid119_fxpInPostAlign_uid45_fpExp10Test(BITSELECT,118)@4
    X36dto16_uid119_fxpInPostAlign_uid45_fpExp10Test_in <= oFracXZwE_uid39_fpExp10Test_q;
    X36dto16_uid119_fxpInPostAlign_uid45_fpExp10Test_b <= X36dto16_uid119_fxpInPostAlign_uid45_fpExp10Test_in(36 downto 16);

	--rightShiftStage0Idx1_uid120_fxpInPostAlign_uid45_fpExp10Test(BITJOIN,119)@4
    rightShiftStage0Idx1_uid120_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage0Idx1Pad16_uid118_fxpInPostAlign_uid45_fpExp10Test_q & X36dto16_uid119_fxpInPostAlign_uid45_fpExp10Test_b;

	--reg_rightShiftStage0Idx1_uid120_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_3(REG,242)@4
    reg_rightShiftStage0Idx1_uid120_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx1_uid120_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_3_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx1_uid120_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_3_q <= rightShiftStage0Idx1_uid120_fxpInPostAlign_uid45_fpExp10Test_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_oFracXZwE_uid39_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_2(REG,241)@4
    reg_oFracXZwE_uid39_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracXZwE_uid39_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracXZwE_uid39_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_2_q <= oFracXZwE_uid39_fpExp10Test_q;
            END IF;
        END IF;
    END PROCESS;


	--cstBiasPWE_uid14_fpExp10Test(CONSTANT,13)
    cstBiasPWE_uid14_fpExp10Test_q <= "100001";

	--expX_uid6_fpExp10Test(BITSELECT,5)@0
    expX_uid6_fpExp10Test_in <= a(30 downto 0);
    expX_uid6_fpExp10Test_b <= expX_uid6_fpExp10Test_in(30 downto 23);

	--cstBiasPWE_uid13_fpExp10Test(CONSTANT,12)
    cstBiasPWE_uid13_fpExp10Test_q <= "10000111";

	--shiftValuePreSat_uid40_fpExp10Test(SUB,39)@0
    shiftValuePreSat_uid40_fpExp10Test_a <= STD_LOGIC_VECTOR("0" & cstBiasPWE_uid13_fpExp10Test_q);
    shiftValuePreSat_uid40_fpExp10Test_b <= STD_LOGIC_VECTOR("0" & expX_uid6_fpExp10Test_b);
            shiftValuePreSat_uid40_fpExp10Test_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValuePreSat_uid40_fpExp10Test_a) - UNSIGNED(shiftValuePreSat_uid40_fpExp10Test_b));
    shiftValuePreSat_uid40_fpExp10Test_q <= shiftValuePreSat_uid40_fpExp10Test_o(8 downto 0);


	--shiftValuePreSatRed_uid43_fpExp10Test(BITSELECT,42)@0
    shiftValuePreSatRed_uid43_fpExp10Test_in <= shiftValuePreSat_uid40_fpExp10Test_q(5 downto 0);
    shiftValuePreSatRed_uid43_fpExp10Test_b <= shiftValuePreSatRed_uid43_fpExp10Test_in(5 downto 0);

	--ld_shiftValuePreSatRed_uid43_fpExp10Test_b_to_shiftVal_uid44_fpExp10Test_c(DELAY,307)@0
    ld_shiftValuePreSatRed_uid43_fpExp10Test_b_to_shiftVal_uid44_fpExp10Test_c : dspba_delay
    GENERIC MAP ( width => 6, depth => 4 )
    PORT MAP ( xin => shiftValuePreSatRed_uid43_fpExp10Test_b, xout => ld_shiftValuePreSatRed_uid43_fpExp10Test_b_to_shiftVal_uid44_fpExp10Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_shiftValuePreSat_uid40_fpExp10Test_0_to_shiftUdf_uid42_fpExp10Test_0(REG,234)@0
    reg_shiftValuePreSat_uid40_fpExp10Test_0_to_shiftUdf_uid42_fpExp10Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_shiftValuePreSat_uid40_fpExp10Test_0_to_shiftUdf_uid42_fpExp10Test_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_shiftValuePreSat_uid40_fpExp10Test_0_to_shiftUdf_uid42_fpExp10Test_0_q <= shiftValuePreSat_uid40_fpExp10Test_q;
            END IF;
        END IF;
    END PROCESS;


	--shiftUdf_uid42_fpExp10Test(COMPARE,41)@1
    shiftUdf_uid42_fpExp10Test_cin <= GND_q;
    shiftUdf_uid42_fpExp10Test_a <= STD_LOGIC_VECTOR((10 downto 9 => reg_shiftValuePreSat_uid40_fpExp10Test_0_to_shiftUdf_uid42_fpExp10Test_0_q(8)) & reg_shiftValuePreSat_uid40_fpExp10Test_0_to_shiftUdf_uid42_fpExp10Test_0_q) & '0';
    shiftUdf_uid42_fpExp10Test_b <= STD_LOGIC_VECTOR('0' & "0000" & cstBiasPWE_uid14_fpExp10Test_q) & shiftUdf_uid42_fpExp10Test_cin(0);
            shiftUdf_uid42_fpExp10Test_o <= STD_LOGIC_VECTOR(SIGNED(shiftUdf_uid42_fpExp10Test_a) - SIGNED(shiftUdf_uid42_fpExp10Test_b));
    shiftUdf_uid42_fpExp10Test_n(0) <= not shiftUdf_uid42_fpExp10Test_o(11);


	--ld_shiftUdf_uid42_fpExp10Test_n_to_shiftVal_uid44_fpExp10Test_b(DELAY,306)@1
    ld_shiftUdf_uid42_fpExp10Test_n_to_shiftVal_uid44_fpExp10Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => shiftUdf_uid42_fpExp10Test_n, xout => ld_shiftUdf_uid42_fpExp10Test_n_to_shiftVal_uid44_fpExp10Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--shiftVal_uid44_fpExp10Test(MUX,43)@4
    shiftVal_uid44_fpExp10Test_s <= ld_shiftUdf_uid42_fpExp10Test_n_to_shiftVal_uid44_fpExp10Test_b_q;
    shiftVal_uid44_fpExp10Test: PROCESS (shiftVal_uid44_fpExp10Test_s, en, ld_shiftValuePreSatRed_uid43_fpExp10Test_b_to_shiftVal_uid44_fpExp10Test_c_q, cstBiasPWE_uid14_fpExp10Test_q)
    BEGIN
            CASE shiftVal_uid44_fpExp10Test_s IS
                  WHEN "0" => shiftVal_uid44_fpExp10Test_q <= ld_shiftValuePreSatRed_uid43_fpExp10Test_b_to_shiftVal_uid44_fpExp10Test_c_q;
                  WHEN "1" => shiftVal_uid44_fpExp10Test_q <= cstBiasPWE_uid14_fpExp10Test_q;
                  WHEN OTHERS => shiftVal_uid44_fpExp10Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel5Dto4_uid127_fxpInPostAlign_uid45_fpExp10Test(BITSELECT,126)@4
    rightShiftStageSel5Dto4_uid127_fxpInPostAlign_uid45_fpExp10Test_in <= shiftVal_uid44_fpExp10Test_q;
    rightShiftStageSel5Dto4_uid127_fxpInPostAlign_uid45_fpExp10Test_b <= rightShiftStageSel5Dto4_uid127_fxpInPostAlign_uid45_fpExp10Test_in(5 downto 4);

	--reg_rightShiftStageSel5Dto4_uid127_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_1(REG,240)@4
    reg_rightShiftStageSel5Dto4_uid127_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel5Dto4_uid127_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel5Dto4_uid127_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_1_q <= rightShiftStageSel5Dto4_uid127_fxpInPostAlign_uid45_fpExp10Test_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test(MUX,127)@5
    rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_s <= reg_rightShiftStageSel5Dto4_uid127_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_1_q;
    rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test: PROCESS (rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_s, en, reg_oFracXZwE_uid39_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_2_q, reg_rightShiftStage0Idx1_uid120_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_3_q, reg_rightShiftStage0Idx2_uid124_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_4_q, rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test_q)
    BEGIN
            CASE rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_s IS
                  WHEN "00" => rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_q <= reg_oFracXZwE_uid39_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_2_q;
                  WHEN "01" => rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_q <= reg_rightShiftStage0Idx1_uid120_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_3_q;
                  WHEN "10" => rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_q <= reg_rightShiftStage0Idx2_uid124_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_4_q;
                  WHEN "11" => rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage0Idx3_uid126_fxpInPostAlign_uid45_fpExp10Test_q;
                  WHEN OTHERS => rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage036dto12_uid139_fxpInPostAlign_uid45_fpExp10Test(BITSELECT,138)@5
    RightShiftStage036dto12_uid139_fxpInPostAlign_uid45_fpExp10Test_in <= rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_q;
    RightShiftStage036dto12_uid139_fxpInPostAlign_uid45_fpExp10Test_b <= RightShiftStage036dto12_uid139_fxpInPostAlign_uid45_fpExp10Test_in(36 downto 12);

	--ld_RightShiftStage036dto12_uid139_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx3_uid140_fxpInPostAlign_uid45_fpExp10Test_a(DELAY,412)@5
    ld_RightShiftStage036dto12_uid139_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx3_uid140_fxpInPostAlign_uid45_fpExp10Test_a : dspba_delay
    GENERIC MAP ( width => 25, depth => 1 )
    PORT MAP ( xin => RightShiftStage036dto12_uid139_fxpInPostAlign_uid45_fpExp10Test_b, xout => ld_RightShiftStage036dto12_uid139_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx3_uid140_fxpInPostAlign_uid45_fpExp10Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid140_fxpInPostAlign_uid45_fpExp10Test(BITJOIN,139)@6
    rightShiftStage1Idx3_uid140_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage1Idx3Pad12_uid138_fxpInPostAlign_uid45_fpExp10Test_q & ld_RightShiftStage036dto12_uid139_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx3_uid140_fxpInPostAlign_uid45_fpExp10Test_a_q;

	--rightShiftStage1Idx2Pad8_uid134_fxpInPostAlign_uid45_fpExp10Test(LOGICAL,133)@5
    rightShiftStage1Idx2Pad8_uid134_fxpInPostAlign_uid45_fpExp10Test_a <= cstZeroWE_uid11_fpExp10Test_q;
    rightShiftStage1Idx2Pad8_uid134_fxpInPostAlign_uid45_fpExp10Test_b <= STD_LOGIC_VECTOR((7 downto 1 => ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_b_q(0)) & ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_b_q);
    rightShiftStage1Idx2Pad8_uid134_fxpInPostAlign_uid45_fpExp10Test_q_i <= rightShiftStage1Idx2Pad8_uid134_fxpInPostAlign_uid45_fpExp10Test_a or rightShiftStage1Idx2Pad8_uid134_fxpInPostAlign_uid45_fpExp10Test_b;
    rightShiftStage1Idx2Pad8_uid134_fxpInPostAlign_uid45_fpExp10Test_delay : dspba_delay
    GENERIC MAP (width => 8, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx2Pad8_uid134_fxpInPostAlign_uid45_fpExp10Test_q, xin => rightShiftStage1Idx2Pad8_uid134_fxpInPostAlign_uid45_fpExp10Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage036dto8_uid135_fxpInPostAlign_uid45_fpExp10Test(BITSELECT,134)@5
    RightShiftStage036dto8_uid135_fxpInPostAlign_uid45_fpExp10Test_in <= rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_q;
    RightShiftStage036dto8_uid135_fxpInPostAlign_uid45_fpExp10Test_b <= RightShiftStage036dto8_uid135_fxpInPostAlign_uid45_fpExp10Test_in(36 downto 8);

	--ld_RightShiftStage036dto8_uid135_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx2_uid136_fxpInPostAlign_uid45_fpExp10Test_a(DELAY,408)@5
    ld_RightShiftStage036dto8_uid135_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx2_uid136_fxpInPostAlign_uid45_fpExp10Test_a : dspba_delay
    GENERIC MAP ( width => 29, depth => 1 )
    PORT MAP ( xin => RightShiftStage036dto8_uid135_fxpInPostAlign_uid45_fpExp10Test_b, xout => ld_RightShiftStage036dto8_uid135_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx2_uid136_fxpInPostAlign_uid45_fpExp10Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid136_fxpInPostAlign_uid45_fpExp10Test(BITJOIN,135)@6
    rightShiftStage1Idx2_uid136_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage1Idx2Pad8_uid134_fxpInPostAlign_uid45_fpExp10Test_q & ld_RightShiftStage036dto8_uid135_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx2_uid136_fxpInPostAlign_uid45_fpExp10Test_a_q;

	--z_uid129_fxpInPostAlign_uid45_fpExp10Test(CONSTANT,128)
    z_uid129_fxpInPostAlign_uid45_fpExp10Test_q <= "0000";

	--rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test(LOGICAL,129)@5
    rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_a <= z_uid129_fxpInPostAlign_uid45_fpExp10Test_q;
    rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_b <= STD_LOGIC_VECTOR((3 downto 1 => ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_b_q(0)) & ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_b_q);
    rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_q_i <= rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_a or rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_b;
    rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_delay : dspba_delay
    GENERIC MAP (width => 4, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_q, xin => rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage036dto4_uid131_fxpInPostAlign_uid45_fpExp10Test(BITSELECT,130)@5
    RightShiftStage036dto4_uid131_fxpInPostAlign_uid45_fpExp10Test_in <= rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_q;
    RightShiftStage036dto4_uid131_fxpInPostAlign_uid45_fpExp10Test_b <= RightShiftStage036dto4_uid131_fxpInPostAlign_uid45_fpExp10Test_in(36 downto 4);

	--ld_RightShiftStage036dto4_uid131_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1_uid132_fxpInPostAlign_uid45_fpExp10Test_a(DELAY,404)@5
    ld_RightShiftStage036dto4_uid131_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1_uid132_fxpInPostAlign_uid45_fpExp10Test_a : dspba_delay
    GENERIC MAP ( width => 33, depth => 1 )
    PORT MAP ( xin => RightShiftStage036dto4_uid131_fxpInPostAlign_uid45_fpExp10Test_b, xout => ld_RightShiftStage036dto4_uid131_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1_uid132_fxpInPostAlign_uid45_fpExp10Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid132_fxpInPostAlign_uid45_fpExp10Test(BITJOIN,131)@6
    rightShiftStage1Idx1_uid132_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage1Idx1Pad4_uid130_fxpInPostAlign_uid45_fpExp10Test_q & ld_RightShiftStage036dto4_uid131_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage1Idx1_uid132_fxpInPostAlign_uid45_fpExp10Test_a_q;

	--reg_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_2(REG,245)@5
    reg_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_2_q <= rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test(BITSELECT,140)@4
    rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_in <= shiftVal_uid44_fpExp10Test_q(3 downto 0);
    rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_b <= rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_in(3 downto 2);

	--ld_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_b_to_reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_1_a(DELAY,526)@4
    ld_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_b_to_reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_b, xout => ld_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_b_to_reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_1(REG,244)@5
    reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_1_q <= ld_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_b_to_reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test(MUX,141)@6
    rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_s <= reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_1_q;
    rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test: PROCESS (rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_s, en, reg_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_2_q, rightShiftStage1Idx1_uid132_fxpInPostAlign_uid45_fpExp10Test_q, rightShiftStage1Idx2_uid136_fxpInPostAlign_uid45_fpExp10Test_q, rightShiftStage1Idx3_uid140_fxpInPostAlign_uid45_fpExp10Test_q)
    BEGIN
            CASE rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_s IS
                  WHEN "00" => rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_q <= reg_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_2_q;
                  WHEN "01" => rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage1Idx1_uid132_fxpInPostAlign_uid45_fpExp10Test_q;
                  WHEN "10" => rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage1Idx2_uid136_fxpInPostAlign_uid45_fpExp10Test_q;
                  WHEN "11" => rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage1Idx3_uid140_fxpInPostAlign_uid45_fpExp10Test_q;
                  WHEN OTHERS => rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage136dto3_uid153_fxpInPostAlign_uid45_fpExp10Test(BITSELECT,152)@6
    RightShiftStage136dto3_uid153_fxpInPostAlign_uid45_fpExp10Test_in <= rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_q;
    RightShiftStage136dto3_uid153_fxpInPostAlign_uid45_fpExp10Test_b <= RightShiftStage136dto3_uid153_fxpInPostAlign_uid45_fpExp10Test_in(36 downto 3);

	--ld_RightShiftStage136dto3_uid153_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx3_uid154_fxpInPostAlign_uid45_fpExp10Test_a(DELAY,430)@6
    ld_RightShiftStage136dto3_uid153_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx3_uid154_fxpInPostAlign_uid45_fpExp10Test_a : dspba_delay
    GENERIC MAP ( width => 34, depth => 1 )
    PORT MAP ( xin => RightShiftStage136dto3_uid153_fxpInPostAlign_uid45_fpExp10Test_b, xout => ld_RightShiftStage136dto3_uid153_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx3_uid154_fxpInPostAlign_uid45_fpExp10Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx3_uid154_fxpInPostAlign_uid45_fpExp10Test(BITJOIN,153)@7
    rightShiftStage2Idx3_uid154_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage2Idx3Pad3_uid152_fxpInPostAlign_uid45_fpExp10Test_q & ld_RightShiftStage136dto3_uid153_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx3_uid154_fxpInPostAlign_uid45_fpExp10Test_a_q;

	--z_uid147_fxpInPostAlign_uid45_fpExp10Test(CONSTANT,146)
    z_uid147_fxpInPostAlign_uid45_fpExp10Test_q <= "00";

	--rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test(LOGICAL,147)@6
    rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_a <= z_uid147_fxpInPostAlign_uid45_fpExp10Test_q;
    rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_b <= STD_LOGIC_VECTOR((1 downto 1 => ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_b_q(0)) & ld_msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_b_q);
    rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_q_i <= rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_a or rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_b;
    rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_delay : dspba_delay
    GENERIC MAP (width => 2, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_q, xin => rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage136dto2_uid149_fxpInPostAlign_uid45_fpExp10Test(BITSELECT,148)@6
    RightShiftStage136dto2_uid149_fxpInPostAlign_uid45_fpExp10Test_in <= rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_q;
    RightShiftStage136dto2_uid149_fxpInPostAlign_uid45_fpExp10Test_b <= RightShiftStage136dto2_uid149_fxpInPostAlign_uid45_fpExp10Test_in(36 downto 2);

	--ld_RightShiftStage136dto2_uid149_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx2_uid150_fxpInPostAlign_uid45_fpExp10Test_a(DELAY,426)@6
    ld_RightShiftStage136dto2_uid149_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx2_uid150_fxpInPostAlign_uid45_fpExp10Test_a : dspba_delay
    GENERIC MAP ( width => 35, depth => 1 )
    PORT MAP ( xin => RightShiftStage136dto2_uid149_fxpInPostAlign_uid45_fpExp10Test_b, xout => ld_RightShiftStage136dto2_uid149_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx2_uid150_fxpInPostAlign_uid45_fpExp10Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx2_uid150_fxpInPostAlign_uid45_fpExp10Test(BITJOIN,149)@7
    rightShiftStage2Idx2_uid150_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage2Idx2Pad2_uid148_fxpInPostAlign_uid45_fpExp10Test_q & ld_RightShiftStage136dto2_uid149_fxpInPostAlign_uid45_fpExp10Test_b_to_rightShiftStage2Idx2_uid150_fxpInPostAlign_uid45_fpExp10Test_a_q;

	--rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test(LOGICAL,143)@4
    rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_a <= GND_q;
    rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_b <= msbx_uid116_fxpInPostAlign_uid45_fpExp10Test_b;
    rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_q_i <= rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_a or rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_b;
    rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_q, xin => rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_q_to_rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test_b(DELAY,423)@5
    ld_rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_q_to_rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_q, xout => ld_rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_q_to_rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--RightShiftStage136dto1_uid145_fxpInPostAlign_uid45_fpExp10Test(BITSELECT,144)@6
    RightShiftStage136dto1_uid145_fxpInPostAlign_uid45_fpExp10Test_in <= rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_q;
    RightShiftStage136dto1_uid145_fxpInPostAlign_uid45_fpExp10Test_b <= RightShiftStage136dto1_uid145_fxpInPostAlign_uid45_fpExp10Test_in(36 downto 1);

	--rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test(BITJOIN,145)@6
    rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test_q <= ld_rightShiftStage2Idx1Pad1_uid144_fxpInPostAlign_uid45_fpExp10Test_q_to_rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test_b_q & RightShiftStage136dto1_uid145_fxpInPostAlign_uid45_fpExp10Test_b;

	--ld_rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test_q_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_d(DELAY,435)@6
    ld_rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test_q_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_d : dspba_delay
    GENERIC MAP ( width => 37, depth => 1 )
    PORT MAP ( xin => rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test_q, xout => ld_rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test_q_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_d_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_2(REG,247)@6
    reg_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_2_q <= rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test(BITSELECT,154)@4
    rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_in <= shiftVal_uid44_fpExp10Test_q(1 downto 0);
    rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_b <= rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_in(1 downto 0);

	--reg_rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_1(REG,246)@4
    reg_rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_1_q <= rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_1_q_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_b(DELAY,433)@5
    ld_reg_rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_1_q_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 2 )
    PORT MAP ( xin => reg_rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_1_q, xout => ld_reg_rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_1_q_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test(MUX,155)@7
    rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_s <= ld_reg_rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_1_q_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_b_q;
    rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test: PROCESS (rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_s, en, reg_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_2_q, ld_rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test_q_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_d_q, rightShiftStage2Idx2_uid150_fxpInPostAlign_uid45_fpExp10Test_q, rightShiftStage2Idx3_uid154_fxpInPostAlign_uid45_fpExp10Test_q)
    BEGIN
            CASE rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_s IS
                  WHEN "00" => rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_q <= reg_rightShiftStage1_uid142_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_2_q;
                  WHEN "01" => rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_q <= ld_rightShiftStage2Idx1_uid146_fxpInPostAlign_uid45_fpExp10Test_q_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_d_q;
                  WHEN "10" => rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage2Idx2_uid150_fxpInPostAlign_uid45_fpExp10Test_q;
                  WHEN "11" => rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_q <= rightShiftStage2Idx3_uid154_fxpInPostAlign_uid45_fpExp10Test_q;
                  WHEN OTHERS => rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ePreRnd_uid46_fpExp10Test(BITSELECT,45)@7
    ePreRnd_uid46_fpExp10Test_in <= rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_q;
    ePreRnd_uid46_fpExp10Test_b <= ePreRnd_uid46_fpExp10Test_in(36 downto 25);

	--xv0_uid158_constMult(BITSELECT,157)@7
    xv0_uid158_constMult_in <= ePreRnd_uid46_fpExp10Test_b(5 downto 0);
    xv0_uid158_constMult_b <= xv0_uid158_constMult_in(5 downto 0);

	--ld_xv0_uid158_constMult_b_to_reg_xv0_uid158_constMult_0_to_p0_uid161_constMult_0_a(DELAY,540)@7
    ld_xv0_uid158_constMult_b_to_reg_xv0_uid158_constMult_0_to_p0_uid161_constMult_0_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => xv0_uid158_constMult_b, xout => ld_xv0_uid158_constMult_b_to_reg_xv0_uid158_constMult_0_to_p0_uid161_constMult_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_xv0_uid158_constMult_0_to_p0_uid161_constMult_0(REG,258)@8
    reg_xv0_uid158_constMult_0_to_p0_uid161_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv0_uid158_constMult_0_to_p0_uid161_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv0_uid158_constMult_0_to_p0_uid161_constMult_0_q <= ld_xv0_uid158_constMult_b_to_reg_xv0_uid158_constMult_0_to_p0_uid161_constMult_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--p0_uid161_constMult(LOOKUP,160)@9
    p0_uid161_constMult: PROCESS (reg_xv0_uid158_constMult_0_to_p0_uid161_constMult_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_xv0_uid158_constMult_0_to_p0_uid161_constMult_0_q) IS
                WHEN "000000" =>  p0_uid161_constMult_q <= "000000000000000000000000000000000000000";
                WHEN "000001" =>  p0_uid161_constMult_q <= "000000100110100010000010011010100001010";
                WHEN "000010" =>  p0_uid161_constMult_q <= "000001001101000100000100110101000010100";
                WHEN "000011" =>  p0_uid161_constMult_q <= "000001110011100110000111001111100011110";
                WHEN "000100" =>  p0_uid161_constMult_q <= "000010011010001000001001101010000101000";
                WHEN "000101" =>  p0_uid161_constMult_q <= "000011000000101010001100000100100110010";
                WHEN "000110" =>  p0_uid161_constMult_q <= "000011100111001100001110011111000111100";
                WHEN "000111" =>  p0_uid161_constMult_q <= "000100001101101110010000111001101000110";
                WHEN "001000" =>  p0_uid161_constMult_q <= "000100110100010000010011010100001010000";
                WHEN "001001" =>  p0_uid161_constMult_q <= "000101011010110010010101101110101011010";
                WHEN "001010" =>  p0_uid161_constMult_q <= "000110000001010100011000001001001100100";
                WHEN "001011" =>  p0_uid161_constMult_q <= "000110100111110110011010100011101101110";
                WHEN "001100" =>  p0_uid161_constMult_q <= "000111001110011000011100111110001111000";
                WHEN "001101" =>  p0_uid161_constMult_q <= "000111110100111010011111011000110000010";
                WHEN "001110" =>  p0_uid161_constMult_q <= "001000011011011100100001110011010001100";
                WHEN "001111" =>  p0_uid161_constMult_q <= "001001000001111110100100001101110010110";
                WHEN "010000" =>  p0_uid161_constMult_q <= "001001101000100000100110101000010100000";
                WHEN "010001" =>  p0_uid161_constMult_q <= "001010001111000010101001000010110101010";
                WHEN "010010" =>  p0_uid161_constMult_q <= "001010110101100100101011011101010110100";
                WHEN "010011" =>  p0_uid161_constMult_q <= "001011011100000110101101110111110111110";
                WHEN "010100" =>  p0_uid161_constMult_q <= "001100000010101000110000010010011001000";
                WHEN "010101" =>  p0_uid161_constMult_q <= "001100101001001010110010101100111010010";
                WHEN "010110" =>  p0_uid161_constMult_q <= "001101001111101100110101000111011011100";
                WHEN "010111" =>  p0_uid161_constMult_q <= "001101110110001110110111100001111100110";
                WHEN "011000" =>  p0_uid161_constMult_q <= "001110011100110000111001111100011110000";
                WHEN "011001" =>  p0_uid161_constMult_q <= "001111000011010010111100010110111111010";
                WHEN "011010" =>  p0_uid161_constMult_q <= "001111101001110100111110110001100000100";
                WHEN "011011" =>  p0_uid161_constMult_q <= "010000010000010111000001001100000001110";
                WHEN "011100" =>  p0_uid161_constMult_q <= "010000110110111001000011100110100011000";
                WHEN "011101" =>  p0_uid161_constMult_q <= "010001011101011011000110000001000100010";
                WHEN "011110" =>  p0_uid161_constMult_q <= "010010000011111101001000011011100101100";
                WHEN "011111" =>  p0_uid161_constMult_q <= "010010101010011111001010110110000110110";
                WHEN "100000" =>  p0_uid161_constMult_q <= "010011010001000001001101010000101000000";
                WHEN "100001" =>  p0_uid161_constMult_q <= "010011110111100011001111101011001001010";
                WHEN "100010" =>  p0_uid161_constMult_q <= "010100011110000101010010000101101010100";
                WHEN "100011" =>  p0_uid161_constMult_q <= "010101000100100111010100100000001011110";
                WHEN "100100" =>  p0_uid161_constMult_q <= "010101101011001001010110111010101101000";
                WHEN "100101" =>  p0_uid161_constMult_q <= "010110010001101011011001010101001110010";
                WHEN "100110" =>  p0_uid161_constMult_q <= "010110111000001101011011101111101111100";
                WHEN "100111" =>  p0_uid161_constMult_q <= "010111011110101111011110001010010000110";
                WHEN "101000" =>  p0_uid161_constMult_q <= "011000000101010001100000100100110010000";
                WHEN "101001" =>  p0_uid161_constMult_q <= "011000101011110011100010111111010011010";
                WHEN "101010" =>  p0_uid161_constMult_q <= "011001010010010101100101011001110100100";
                WHEN "101011" =>  p0_uid161_constMult_q <= "011001111000110111100111110100010101110";
                WHEN "101100" =>  p0_uid161_constMult_q <= "011010011111011001101010001110110111000";
                WHEN "101101" =>  p0_uid161_constMult_q <= "011011000101111011101100101001011000010";
                WHEN "101110" =>  p0_uid161_constMult_q <= "011011101100011101101111000011111001100";
                WHEN "101111" =>  p0_uid161_constMult_q <= "011100010010111111110001011110011010110";
                WHEN "110000" =>  p0_uid161_constMult_q <= "011100111001100001110011111000111100000";
                WHEN "110001" =>  p0_uid161_constMult_q <= "011101100000000011110110010011011101010";
                WHEN "110010" =>  p0_uid161_constMult_q <= "011110000110100101111000101101111110100";
                WHEN "110011" =>  p0_uid161_constMult_q <= "011110101101000111111011001000011111110";
                WHEN "110100" =>  p0_uid161_constMult_q <= "011111010011101001111101100011000001000";
                WHEN "110101" =>  p0_uid161_constMult_q <= "011111111010001011111111111101100010010";
                WHEN "110110" =>  p0_uid161_constMult_q <= "100000100000101110000010011000000011100";
                WHEN "110111" =>  p0_uid161_constMult_q <= "100001000111010000000100110010100100110";
                WHEN "111000" =>  p0_uid161_constMult_q <= "100001101101110010000111001101000110000";
                WHEN "111001" =>  p0_uid161_constMult_q <= "100010010100010100001001100111100111010";
                WHEN "111010" =>  p0_uid161_constMult_q <= "100010111010110110001100000010001000100";
                WHEN "111011" =>  p0_uid161_constMult_q <= "100011100001011000001110011100101001110";
                WHEN "111100" =>  p0_uid161_constMult_q <= "100100000111111010010000110111001011000";
                WHEN "111101" =>  p0_uid161_constMult_q <= "100100101110011100010011010001101100010";
                WHEN "111110" =>  p0_uid161_constMult_q <= "100101010100111110010101101100001101100";
                WHEN "111111" =>  p0_uid161_constMult_q <= "100101111011100000011000000110101110110";
                WHEN OTHERS =>
                    p0_uid161_constMult_q <= "000000000000000000000000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv1_uid159_constMult(BITSELECT,158)@7
    xv1_uid159_constMult_in <= ePreRnd_uid46_fpExp10Test_b;
    xv1_uid159_constMult_b <= xv1_uid159_constMult_in(11 downto 6);

	--reg_xv1_uid159_constMult_0_to_p1_uid160_constMult_0(REG,257)@7
    reg_xv1_uid159_constMult_0_to_p1_uid160_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv1_uid159_constMult_0_to_p1_uid160_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv1_uid159_constMult_0_to_p1_uid160_constMult_0_q <= xv1_uid159_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--p1_uid160_constMult(LOOKUP,159)@8
    p1_uid160_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p1_uid160_constMult_q <= "000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_xv1_uid159_constMult_0_to_p1_uid160_constMult_0_q) IS
                WHEN "000000" =>  p1_uid160_constMult_q <= "000000000000000000000000000000000000000000000";
                WHEN "000001" =>  p1_uid160_constMult_q <= "000000100110100010000010011010100001010000000";
                WHEN "000010" =>  p1_uid160_constMult_q <= "000001001101000100000100110101000010100000000";
                WHEN "000011" =>  p1_uid160_constMult_q <= "000001110011100110000111001111100011110000000";
                WHEN "000100" =>  p1_uid160_constMult_q <= "000010011010001000001001101010000101000000000";
                WHEN "000101" =>  p1_uid160_constMult_q <= "000011000000101010001100000100100110010000000";
                WHEN "000110" =>  p1_uid160_constMult_q <= "000011100111001100001110011111000111100000000";
                WHEN "000111" =>  p1_uid160_constMult_q <= "000100001101101110010000111001101000110000000";
                WHEN "001000" =>  p1_uid160_constMult_q <= "000100110100010000010011010100001010000000000";
                WHEN "001001" =>  p1_uid160_constMult_q <= "000101011010110010010101101110101011010000000";
                WHEN "001010" =>  p1_uid160_constMult_q <= "000110000001010100011000001001001100100000000";
                WHEN "001011" =>  p1_uid160_constMult_q <= "000110100111110110011010100011101101110000000";
                WHEN "001100" =>  p1_uid160_constMult_q <= "000111001110011000011100111110001111000000000";
                WHEN "001101" =>  p1_uid160_constMult_q <= "000111110100111010011111011000110000010000000";
                WHEN "001110" =>  p1_uid160_constMult_q <= "001000011011011100100001110011010001100000000";
                WHEN "001111" =>  p1_uid160_constMult_q <= "001001000001111110100100001101110010110000000";
                WHEN "010000" =>  p1_uid160_constMult_q <= "001001101000100000100110101000010100000000000";
                WHEN "010001" =>  p1_uid160_constMult_q <= "001010001111000010101001000010110101010000000";
                WHEN "010010" =>  p1_uid160_constMult_q <= "001010110101100100101011011101010110100000000";
                WHEN "010011" =>  p1_uid160_constMult_q <= "001011011100000110101101110111110111110000000";
                WHEN "010100" =>  p1_uid160_constMult_q <= "001100000010101000110000010010011001000000000";
                WHEN "010101" =>  p1_uid160_constMult_q <= "001100101001001010110010101100111010010000000";
                WHEN "010110" =>  p1_uid160_constMult_q <= "001101001111101100110101000111011011100000000";
                WHEN "010111" =>  p1_uid160_constMult_q <= "001101110110001110110111100001111100110000000";
                WHEN "011000" =>  p1_uid160_constMult_q <= "001110011100110000111001111100011110000000000";
                WHEN "011001" =>  p1_uid160_constMult_q <= "001111000011010010111100010110111111010000000";
                WHEN "011010" =>  p1_uid160_constMult_q <= "001111101001110100111110110001100000100000000";
                WHEN "011011" =>  p1_uid160_constMult_q <= "010000010000010111000001001100000001110000000";
                WHEN "011100" =>  p1_uid160_constMult_q <= "010000110110111001000011100110100011000000000";
                WHEN "011101" =>  p1_uid160_constMult_q <= "010001011101011011000110000001000100010000000";
                WHEN "011110" =>  p1_uid160_constMult_q <= "010010000011111101001000011011100101100000000";
                WHEN "011111" =>  p1_uid160_constMult_q <= "010010101010011111001010110110000110110000000";
                WHEN "100000" =>  p1_uid160_constMult_q <= "101100101110111110110010101111011000000000000";
                WHEN "100001" =>  p1_uid160_constMult_q <= "101101010101100000110101001001111001010000000";
                WHEN "100010" =>  p1_uid160_constMult_q <= "101101111100000010110111100100011010100000000";
                WHEN "100011" =>  p1_uid160_constMult_q <= "101110100010100100111001111110111011110000000";
                WHEN "100100" =>  p1_uid160_constMult_q <= "101111001001000110111100011001011101000000000";
                WHEN "100101" =>  p1_uid160_constMult_q <= "101111101111101000111110110011111110010000000";
                WHEN "100110" =>  p1_uid160_constMult_q <= "110000010110001011000001001110011111100000000";
                WHEN "100111" =>  p1_uid160_constMult_q <= "110000111100101101000011101001000000110000000";
                WHEN "101000" =>  p1_uid160_constMult_q <= "110001100011001111000110000011100010000000000";
                WHEN "101001" =>  p1_uid160_constMult_q <= "110010001001110001001000011110000011010000000";
                WHEN "101010" =>  p1_uid160_constMult_q <= "110010110000010011001010111000100100100000000";
                WHEN "101011" =>  p1_uid160_constMult_q <= "110011010110110101001101010011000101110000000";
                WHEN "101100" =>  p1_uid160_constMult_q <= "110011111101010111001111101101100111000000000";
                WHEN "101101" =>  p1_uid160_constMult_q <= "110100100011111001010010001000001000010000000";
                WHEN "101110" =>  p1_uid160_constMult_q <= "110101001010011011010100100010101001100000000";
                WHEN "101111" =>  p1_uid160_constMult_q <= "110101110000111101010110111101001010110000000";
                WHEN "110000" =>  p1_uid160_constMult_q <= "110110010111011111011001010111101100000000000";
                WHEN "110001" =>  p1_uid160_constMult_q <= "110110111110000001011011110010001101010000000";
                WHEN "110010" =>  p1_uid160_constMult_q <= "110111100100100011011110001100101110100000000";
                WHEN "110011" =>  p1_uid160_constMult_q <= "111000001011000101100000100111001111110000000";
                WHEN "110100" =>  p1_uid160_constMult_q <= "111000110001100111100011000001110001000000000";
                WHEN "110101" =>  p1_uid160_constMult_q <= "111001011000001001100101011100010010010000000";
                WHEN "110110" =>  p1_uid160_constMult_q <= "111001111110101011100111110110110011100000000";
                WHEN "110111" =>  p1_uid160_constMult_q <= "111010100101001101101010010001010100110000000";
                WHEN "111000" =>  p1_uid160_constMult_q <= "111011001011101111101100101011110110000000000";
                WHEN "111001" =>  p1_uid160_constMult_q <= "111011110010010001101111000110010111010000000";
                WHEN "111010" =>  p1_uid160_constMult_q <= "111100011000110011110001100000111000100000000";
                WHEN "111011" =>  p1_uid160_constMult_q <= "111100111111010101110011111011011001110000000";
                WHEN "111100" =>  p1_uid160_constMult_q <= "111101100101110111110110010101111011000000000";
                WHEN "111101" =>  p1_uid160_constMult_q <= "111110001100011001111000110000011100010000000";
                WHEN "111110" =>  p1_uid160_constMult_q <= "111110110010111011111011001010111101100000000";
                WHEN "111111" =>  p1_uid160_constMult_q <= "111111011001011101111101100101011110110000000";
                WHEN OTHERS =>
                    p1_uid160_constMult_q <= "000000000000000000000000000000000000000000000";
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--lev1_a0_uid162_constMult(ADD,161)@9
    lev1_a0_uid162_constMult_a <= STD_LOGIC_VECTOR((46 downto 45 => p1_uid160_constMult_q(44)) & p1_uid160_constMult_q);
    lev1_a0_uid162_constMult_b <= STD_LOGIC_VECTOR('0' & "0000000" & p0_uid161_constMult_q);
            lev1_a0_uid162_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0_uid162_constMult_a) + SIGNED(lev1_a0_uid162_constMult_b));
    lev1_a0_uid162_constMult_q <= lev1_a0_uid162_constMult_o(45 downto 0);


	--sR_uid163_constMult(BITSELECT,162)@9
    sR_uid163_constMult_in <= lev1_a0_uid162_constMult_q(44 downto 0);
    sR_uid163_constMult_b <= sR_uid163_constMult_in(44 downto 2);

	--reg_sR_uid163_constMult_0_to_yExt_uid57_fpExp10Test_1(REG,260)@9
    reg_sR_uid163_constMult_0_to_yExt_uid57_fpExp10Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sR_uid163_constMult_0_to_yExt_uid57_fpExp10Test_1_q <= "0000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sR_uid163_constMult_0_to_yExt_uid57_fpExp10Test_1_q <= sR_uid163_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_signX_uid7_fpExp10Test_b_to_onesCmpFxpIn_uid49_fpExp10Test_b(DELAY,311)@0
    ld_signX_uid7_fpExp10Test_b_to_onesCmpFxpIn_uid49_fpExp10Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => signX_uid7_fpExp10Test_b, xout => ld_signX_uid7_fpExp10Test_b_to_onesCmpFxpIn_uid49_fpExp10Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable(LOGICAL,565)
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_a <= en;
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_q <= not ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_a;

	--ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_nor(LOGICAL,566)
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_nor_a <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_q;
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_nor_b <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_sticky_ena_q;
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_nor_q <= not (ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_nor_a or ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_nor_b);

	--ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_cmpReg(REG,564)
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_sticky_ena(REG,567)
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_nor_q = "1") THEN
                ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_sticky_ena_q <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_enaAnd(LOGICAL,568)
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_enaAnd_a <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_sticky_ena_q;
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_enaAnd_b <= en;
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_enaAnd_q <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_enaAnd_a and ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_enaAnd_b;

	--ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_inputreg(DELAY,558)
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => oFracX_uid32_uid32_fpExp10Test_q, xout => ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdcnt(COUNTER,560)
    -- every=1, low=0, high=1, step=1, init=1
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdcnt_i <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdcnt_i,1));


	--ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdreg(REG,561)
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdreg_q <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdmux(MUX,562)
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdmux_s <= en;
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdmux: PROCESS (ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdmux_s, ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdreg_q, ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdcnt_q)
    BEGIN
            CASE ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdmux_s IS
                  WHEN "0" => ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdmux_q <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdreg_q;
                  WHEN "1" => ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdmux_q <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem(DUALMEM,559)
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_ia <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_inputreg_q;
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_aa <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdreg_q;
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_ab <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdmux_q;
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 24,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_iq,
        address_a => ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_aa,
        data_a => ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_ia
    );
    ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_reset0 <= areset;
        ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_q <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_iq(23 downto 0);

	--cstZeroWEP1_uid12_fpExp10Test(CONSTANT,11)
    cstZeroWEP1_uid12_fpExp10Test_q <= "000000000";

	--oFracXZwE_uid48_fpExp10Test(BITJOIN,47)@4
    oFracXZwE_uid48_fpExp10Test_q <= GND_q & ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_mem_q & cstZeroWEP1_uid12_fpExp10Test_q;

	--onesCmpFxpIn_uid49_fpExp10Test(LOGICAL,48)@4
    onesCmpFxpIn_uid49_fpExp10Test_a <= oFracXZwE_uid48_fpExp10Test_q;
    onesCmpFxpIn_uid49_fpExp10Test_b <= STD_LOGIC_VECTOR((33 downto 1 => ld_signX_uid7_fpExp10Test_b_to_onesCmpFxpIn_uid49_fpExp10Test_b_q(0)) & ld_signX_uid7_fpExp10Test_b_to_onesCmpFxpIn_uid49_fpExp10Test_b_q);
    onesCmpFxpIn_uid49_fpExp10Test_q <= onesCmpFxpIn_uid49_fpExp10Test_a xor onesCmpFxpIn_uid49_fpExp10Test_b;

	--fxpInExt_uid50_fpExp10Test(ADD,49)@4
    fxpInExt_uid50_fpExp10Test_a <= STD_LOGIC_VECTOR((35 downto 34 => onesCmpFxpIn_uid49_fpExp10Test_q(33)) & onesCmpFxpIn_uid49_fpExp10Test_q);
    fxpInExt_uid50_fpExp10Test_b <= STD_LOGIC_VECTOR('0' & "0000000000000000000000000000000000" & ld_signX_uid7_fpExp10Test_b_to_onesCmpFxpIn_uid49_fpExp10Test_b_q);
            fxpInExt_uid50_fpExp10Test_o <= STD_LOGIC_VECTOR(SIGNED(fxpInExt_uid50_fpExp10Test_a) + SIGNED(fxpInExt_uid50_fpExp10Test_b));
    fxpInExt_uid50_fpExp10Test_q <= fxpInExt_uid50_fpExp10Test_o(34 downto 0);


	--fxpInPreAlign_uid51_fpExp10Test(BITSELECT,50)@4
    fxpInPreAlign_uid51_fpExp10Test_in <= fxpInExt_uid50_fpExp10Test_q(33 downto 0);
    fxpInPreAlign_uid51_fpExp10Test_b <= fxpInPreAlign_uid51_fpExp10Test_in(33 downto 0);

	--msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test(BITSELECT,164)@4
    msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_in <= fxpInPreAlign_uid51_fpExp10Test_b;
    msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b <= msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_in(33 downto 33);

	--ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_b(DELAY,481)@4
    ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b, xout => ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx3Pad3_uid201_fxpInPostAlign_X_uid56_fpExp10Test(LOGICAL,200)@6
    rightShiftStage2Idx3Pad3_uid201_fxpInPostAlign_X_uid56_fpExp10Test_a <= z_uid151_fxpInPostAlign_uid45_fpExp10Test_q;
    rightShiftStage2Idx3Pad3_uid201_fxpInPostAlign_X_uid56_fpExp10Test_b <= STD_LOGIC_VECTOR((2 downto 1 => ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_b_q(0)) & ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_b_q);
    rightShiftStage2Idx3Pad3_uid201_fxpInPostAlign_X_uid56_fpExp10Test_q_i <= rightShiftStage2Idx3Pad3_uid201_fxpInPostAlign_X_uid56_fpExp10Test_a or rightShiftStage2Idx3Pad3_uid201_fxpInPostAlign_X_uid56_fpExp10Test_b;
    rightShiftStage2Idx3Pad3_uid201_fxpInPostAlign_X_uid56_fpExp10Test_delay : dspba_delay
    GENERIC MAP (width => 3, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx3Pad3_uid201_fxpInPostAlign_X_uid56_fpExp10Test_q, xin => rightShiftStage2Idx3Pad3_uid201_fxpInPostAlign_X_uid56_fpExp10Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_b(DELAY,460)@4
    ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b, xout => ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3Pad12_uid187_fxpInPostAlign_X_uid56_fpExp10Test(LOGICAL,186)@5
    rightShiftStage1Idx3Pad12_uid187_fxpInPostAlign_X_uid56_fpExp10Test_a <= z_uid137_fxpInPostAlign_uid45_fpExp10Test_q;
    rightShiftStage1Idx3Pad12_uid187_fxpInPostAlign_X_uid56_fpExp10Test_b <= STD_LOGIC_VECTOR((11 downto 1 => ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_b_q(0)) & ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_b_q);
    rightShiftStage1Idx3Pad12_uid187_fxpInPostAlign_X_uid56_fpExp10Test_q_i <= rightShiftStage1Idx3Pad12_uid187_fxpInPostAlign_X_uid56_fpExp10Test_a or rightShiftStage1Idx3Pad12_uid187_fxpInPostAlign_X_uid56_fpExp10Test_b;
    rightShiftStage1Idx3Pad12_uid187_fxpInPostAlign_X_uid56_fpExp10Test_delay : dspba_delay
    GENERIC MAP (width => 12, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx3Pad12_uid187_fxpInPostAlign_X_uid56_fpExp10Test_q, xin => rightShiftStage1Idx3Pad12_uid187_fxpInPostAlign_X_uid56_fpExp10Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--rightShiftStage0Idx3_uid174_fxpInPostAlign_X_uid56_fpExp10Test(CONSTANT,173)
    rightShiftStage0Idx3_uid174_fxpInPostAlign_X_uid56_fpExp10Test_q <= "0000000000000000000000000000000000";

	--rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test(LOGICAL,174)@4
    rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test_a <= rightShiftStage0Idx3_uid174_fxpInPostAlign_X_uid56_fpExp10Test_q;
    rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test_b <= STD_LOGIC_VECTOR((33 downto 1 => msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b(0)) & msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b);
    rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test_q_i <= rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test_a or rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test_b;
    rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test_delay : dspba_delay
    GENERIC MAP (width => 34, depth => 1)
    PORT MAP (xout => rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test_q, xin => rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--rightShiftStage0Idx2Pad32_uid171_fxpInPostAlign_X_uid56_fpExp10Test(LOGICAL,170)@4
    rightShiftStage0Idx2Pad32_uid171_fxpInPostAlign_X_uid56_fpExp10Test_a <= z_uid121_fxpInPostAlign_uid45_fpExp10Test_q;
    rightShiftStage0Idx2Pad32_uid171_fxpInPostAlign_X_uid56_fpExp10Test_b <= STD_LOGIC_VECTOR((31 downto 1 => msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b(0)) & msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b);
    rightShiftStage0Idx2Pad32_uid171_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage0Idx2Pad32_uid171_fxpInPostAlign_X_uid56_fpExp10Test_a or rightShiftStage0Idx2Pad32_uid171_fxpInPostAlign_X_uid56_fpExp10Test_b;

	--X33dto32_uid172_fxpInPostAlign_X_uid56_fpExp10Test(BITSELECT,171)@4
    X33dto32_uid172_fxpInPostAlign_X_uid56_fpExp10Test_in <= fxpInPreAlign_uid51_fpExp10Test_b;
    X33dto32_uid172_fxpInPostAlign_X_uid56_fpExp10Test_b <= X33dto32_uid172_fxpInPostAlign_X_uid56_fpExp10Test_in(33 downto 32);

	--rightShiftStage0Idx2_uid173_fxpInPostAlign_X_uid56_fpExp10Test(BITJOIN,172)@4
    rightShiftStage0Idx2_uid173_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage0Idx2Pad32_uid171_fxpInPostAlign_X_uid56_fpExp10Test_q & X33dto32_uid172_fxpInPostAlign_X_uid56_fpExp10Test_b;

	--reg_rightShiftStage0Idx2_uid173_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_4(REG,252)@4
    reg_rightShiftStage0Idx2_uid173_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx2_uid173_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_4_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx2_uid173_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_4_q <= rightShiftStage0Idx2_uid173_fxpInPostAlign_X_uid56_fpExp10Test_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0Idx1Pad16_uid167_fxpInPostAlign_X_uid56_fpExp10Test(LOGICAL,166)@4
    rightShiftStage0Idx1Pad16_uid167_fxpInPostAlign_X_uid56_fpExp10Test_a <= z_uid117_fxpInPostAlign_uid45_fpExp10Test_q;
    rightShiftStage0Idx1Pad16_uid167_fxpInPostAlign_X_uid56_fpExp10Test_b <= STD_LOGIC_VECTOR((15 downto 1 => msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b(0)) & msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b);
    rightShiftStage0Idx1Pad16_uid167_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage0Idx1Pad16_uid167_fxpInPostAlign_X_uid56_fpExp10Test_a or rightShiftStage0Idx1Pad16_uid167_fxpInPostAlign_X_uid56_fpExp10Test_b;

	--X33dto16_uid168_fxpInPostAlign_X_uid56_fpExp10Test(BITSELECT,167)@4
    X33dto16_uid168_fxpInPostAlign_X_uid56_fpExp10Test_in <= fxpInPreAlign_uid51_fpExp10Test_b;
    X33dto16_uid168_fxpInPostAlign_X_uid56_fpExp10Test_b <= X33dto16_uid168_fxpInPostAlign_X_uid56_fpExp10Test_in(33 downto 16);

	--rightShiftStage0Idx1_uid169_fxpInPostAlign_X_uid56_fpExp10Test(BITJOIN,168)@4
    rightShiftStage0Idx1_uid169_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage0Idx1Pad16_uid167_fxpInPostAlign_X_uid56_fpExp10Test_q & X33dto16_uid168_fxpInPostAlign_X_uid56_fpExp10Test_b;

	--reg_rightShiftStage0Idx1_uid169_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_3(REG,251)@4
    reg_rightShiftStage0Idx1_uid169_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx1_uid169_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_3_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx1_uid169_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_3_q <= rightShiftStage0Idx1_uid169_fxpInPostAlign_X_uid56_fpExp10Test_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_fxpInPreAlign_uid51_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_2(REG,250)@4
    reg_fxpInPreAlign_uid51_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpInPreAlign_uid51_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_2_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpInPreAlign_uid51_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_2_q <= fxpInPreAlign_uid51_fpExp10Test_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test(MUX,176)@5
    rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_s <= reg_rightShiftStageSel5Dto4_uid127_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage0_uid128_fxpInPostAlign_uid45_fpExp10Test_1_q;
    rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test: PROCESS (rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_s, en, reg_fxpInPreAlign_uid51_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_2_q, reg_rightShiftStage0Idx1_uid169_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_3_q, reg_rightShiftStage0Idx2_uid173_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_4_q, rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test_q)
    BEGIN
            CASE rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_s IS
                  WHEN "00" => rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_q <= reg_fxpInPreAlign_uid51_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_2_q;
                  WHEN "01" => rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_q <= reg_rightShiftStage0Idx1_uid169_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_3_q;
                  WHEN "10" => rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_q <= reg_rightShiftStage0Idx2_uid173_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_4_q;
                  WHEN "11" => rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage0Idx3_uid175_fxpInPostAlign_X_uid56_fpExp10Test_q;
                  WHEN OTHERS => rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage033dto12_uid188_fxpInPostAlign_X_uid56_fpExp10Test(BITSELECT,187)@5
    RightShiftStage033dto12_uid188_fxpInPostAlign_X_uid56_fpExp10Test_in <= rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_q;
    RightShiftStage033dto12_uid188_fxpInPostAlign_X_uid56_fpExp10Test_b <= RightShiftStage033dto12_uid188_fxpInPostAlign_X_uid56_fpExp10Test_in(33 downto 12);

	--ld_RightShiftStage033dto12_uid188_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx3_uid189_fxpInPostAlign_X_uid56_fpExp10Test_a(DELAY,470)@5
    ld_RightShiftStage033dto12_uid188_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx3_uid189_fxpInPostAlign_X_uid56_fpExp10Test_a : dspba_delay
    GENERIC MAP ( width => 22, depth => 1 )
    PORT MAP ( xin => RightShiftStage033dto12_uid188_fxpInPostAlign_X_uid56_fpExp10Test_b, xout => ld_RightShiftStage033dto12_uid188_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx3_uid189_fxpInPostAlign_X_uid56_fpExp10Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid189_fxpInPostAlign_X_uid56_fpExp10Test(BITJOIN,188)@6
    rightShiftStage1Idx3_uid189_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage1Idx3Pad12_uid187_fxpInPostAlign_X_uid56_fpExp10Test_q & ld_RightShiftStage033dto12_uid188_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx3_uid189_fxpInPostAlign_X_uid56_fpExp10Test_a_q;

	--rightShiftStage1Idx2Pad8_uid183_fxpInPostAlign_X_uid56_fpExp10Test(LOGICAL,182)@5
    rightShiftStage1Idx2Pad8_uid183_fxpInPostAlign_X_uid56_fpExp10Test_a <= cstZeroWE_uid11_fpExp10Test_q;
    rightShiftStage1Idx2Pad8_uid183_fxpInPostAlign_X_uid56_fpExp10Test_b <= STD_LOGIC_VECTOR((7 downto 1 => ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_b_q(0)) & ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_b_q);
    rightShiftStage1Idx2Pad8_uid183_fxpInPostAlign_X_uid56_fpExp10Test_q_i <= rightShiftStage1Idx2Pad8_uid183_fxpInPostAlign_X_uid56_fpExp10Test_a or rightShiftStage1Idx2Pad8_uid183_fxpInPostAlign_X_uid56_fpExp10Test_b;
    rightShiftStage1Idx2Pad8_uid183_fxpInPostAlign_X_uid56_fpExp10Test_delay : dspba_delay
    GENERIC MAP (width => 8, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx2Pad8_uid183_fxpInPostAlign_X_uid56_fpExp10Test_q, xin => rightShiftStage1Idx2Pad8_uid183_fxpInPostAlign_X_uid56_fpExp10Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage033dto8_uid184_fxpInPostAlign_X_uid56_fpExp10Test(BITSELECT,183)@5
    RightShiftStage033dto8_uid184_fxpInPostAlign_X_uid56_fpExp10Test_in <= rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_q;
    RightShiftStage033dto8_uid184_fxpInPostAlign_X_uid56_fpExp10Test_b <= RightShiftStage033dto8_uid184_fxpInPostAlign_X_uid56_fpExp10Test_in(33 downto 8);

	--ld_RightShiftStage033dto8_uid184_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx2_uid185_fxpInPostAlign_X_uid56_fpExp10Test_a(DELAY,466)@5
    ld_RightShiftStage033dto8_uid184_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx2_uid185_fxpInPostAlign_X_uid56_fpExp10Test_a : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => RightShiftStage033dto8_uid184_fxpInPostAlign_X_uid56_fpExp10Test_b, xout => ld_RightShiftStage033dto8_uid184_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx2_uid185_fxpInPostAlign_X_uid56_fpExp10Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid185_fxpInPostAlign_X_uid56_fpExp10Test(BITJOIN,184)@6
    rightShiftStage1Idx2_uid185_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage1Idx2Pad8_uid183_fxpInPostAlign_X_uid56_fpExp10Test_q & ld_RightShiftStage033dto8_uid184_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx2_uid185_fxpInPostAlign_X_uid56_fpExp10Test_a_q;

	--rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test(LOGICAL,178)@5
    rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_a <= z_uid129_fxpInPostAlign_uid45_fpExp10Test_q;
    rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_b <= STD_LOGIC_VECTOR((3 downto 1 => ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_b_q(0)) & ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_b_q);
    rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_q_i <= rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_a or rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_b;
    rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_delay : dspba_delay
    GENERIC MAP (width => 4, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_q, xin => rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage033dto4_uid180_fxpInPostAlign_X_uid56_fpExp10Test(BITSELECT,179)@5
    RightShiftStage033dto4_uid180_fxpInPostAlign_X_uid56_fpExp10Test_in <= rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_q;
    RightShiftStage033dto4_uid180_fxpInPostAlign_X_uid56_fpExp10Test_b <= RightShiftStage033dto4_uid180_fxpInPostAlign_X_uid56_fpExp10Test_in(33 downto 4);

	--ld_RightShiftStage033dto4_uid180_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1_uid181_fxpInPostAlign_X_uid56_fpExp10Test_a(DELAY,462)@5
    ld_RightShiftStage033dto4_uid180_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1_uid181_fxpInPostAlign_X_uid56_fpExp10Test_a : dspba_delay
    GENERIC MAP ( width => 30, depth => 1 )
    PORT MAP ( xin => RightShiftStage033dto4_uid180_fxpInPostAlign_X_uid56_fpExp10Test_b, xout => ld_RightShiftStage033dto4_uid180_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1_uid181_fxpInPostAlign_X_uid56_fpExp10Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid181_fxpInPostAlign_X_uid56_fpExp10Test(BITJOIN,180)@6
    rightShiftStage1Idx1_uid181_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_q & ld_RightShiftStage033dto4_uid180_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1_uid181_fxpInPostAlign_X_uid56_fpExp10Test_a_q;

	--reg_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_2(REG,254)@5
    reg_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_2_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_2_q <= rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_1(REG,253)@4
    reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_1_q <= rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_1_q_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_b(DELAY,472)@5
    ld_reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_1_q_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_1_q, xout => ld_reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_1_q_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test(MUX,190)@6
    rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_s <= ld_reg_rightShiftStageSel3Dto2_uid141_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_1_q_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_b_q;
    rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test: PROCESS (rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_s, en, reg_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_2_q, rightShiftStage1Idx1_uid181_fxpInPostAlign_X_uid56_fpExp10Test_q, rightShiftStage1Idx2_uid185_fxpInPostAlign_X_uid56_fpExp10Test_q, rightShiftStage1Idx3_uid189_fxpInPostAlign_X_uid56_fpExp10Test_q)
    BEGIN
            CASE rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_s IS
                  WHEN "00" => rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_q <= reg_rightShiftStage0_uid177_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_2_q;
                  WHEN "01" => rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage1Idx1_uid181_fxpInPostAlign_X_uid56_fpExp10Test_q;
                  WHEN "10" => rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage1Idx2_uid185_fxpInPostAlign_X_uid56_fpExp10Test_q;
                  WHEN "11" => rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage1Idx3_uid189_fxpInPostAlign_X_uid56_fpExp10Test_q;
                  WHEN OTHERS => rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage133dto3_uid202_fxpInPostAlign_X_uid56_fpExp10Test(BITSELECT,201)@6
    RightShiftStage133dto3_uid202_fxpInPostAlign_X_uid56_fpExp10Test_in <= rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_q;
    RightShiftStage133dto3_uid202_fxpInPostAlign_X_uid56_fpExp10Test_b <= RightShiftStage133dto3_uid202_fxpInPostAlign_X_uid56_fpExp10Test_in(33 downto 3);

	--ld_RightShiftStage133dto3_uid202_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx3_uid203_fxpInPostAlign_X_uid56_fpExp10Test_a(DELAY,487)@6
    ld_RightShiftStage133dto3_uid202_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx3_uid203_fxpInPostAlign_X_uid56_fpExp10Test_a : dspba_delay
    GENERIC MAP ( width => 31, depth => 1 )
    PORT MAP ( xin => RightShiftStage133dto3_uid202_fxpInPostAlign_X_uid56_fpExp10Test_b, xout => ld_RightShiftStage133dto3_uid202_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx3_uid203_fxpInPostAlign_X_uid56_fpExp10Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx3_uid203_fxpInPostAlign_X_uid56_fpExp10Test(BITJOIN,202)@7
    rightShiftStage2Idx3_uid203_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage2Idx3Pad3_uid201_fxpInPostAlign_X_uid56_fpExp10Test_q & ld_RightShiftStage133dto3_uid202_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx3_uid203_fxpInPostAlign_X_uid56_fpExp10Test_a_q;

	--rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test(LOGICAL,196)@6
    rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_a <= z_uid147_fxpInPostAlign_uid45_fpExp10Test_q;
    rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_b <= STD_LOGIC_VECTOR((1 downto 1 => ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_b_q(0)) & ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_b_q);
    rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_q_i <= rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_a or rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_b;
    rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_delay : dspba_delay
    GENERIC MAP (width => 2, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_q, xin => rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage133dto2_uid198_fxpInPostAlign_X_uid56_fpExp10Test(BITSELECT,197)@6
    RightShiftStage133dto2_uid198_fxpInPostAlign_X_uid56_fpExp10Test_in <= rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_q;
    RightShiftStage133dto2_uid198_fxpInPostAlign_X_uid56_fpExp10Test_b <= RightShiftStage133dto2_uid198_fxpInPostAlign_X_uid56_fpExp10Test_in(33 downto 2);

	--ld_RightShiftStage133dto2_uid198_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx2_uid199_fxpInPostAlign_X_uid56_fpExp10Test_a(DELAY,483)@6
    ld_RightShiftStage133dto2_uid198_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx2_uid199_fxpInPostAlign_X_uid56_fpExp10Test_a : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => RightShiftStage133dto2_uid198_fxpInPostAlign_X_uid56_fpExp10Test_b, xout => ld_RightShiftStage133dto2_uid198_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx2_uid199_fxpInPostAlign_X_uid56_fpExp10Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx2_uid199_fxpInPostAlign_X_uid56_fpExp10Test(BITJOIN,198)@7
    rightShiftStage2Idx2_uid199_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage2Idx2Pad2_uid197_fxpInPostAlign_X_uid56_fpExp10Test_q & ld_RightShiftStage133dto2_uid198_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage2Idx2_uid199_fxpInPostAlign_X_uid56_fpExp10Test_a_q;

	--rightShiftStage2Idx1Pad1_uid193_fxpInPostAlign_X_uid56_fpExp10Test(LOGICAL,192)@5
    rightShiftStage2Idx1Pad1_uid193_fxpInPostAlign_X_uid56_fpExp10Test_a <= GND_q;
    rightShiftStage2Idx1Pad1_uid193_fxpInPostAlign_X_uid56_fpExp10Test_b <= ld_msbx_uid165_fxpInPostAlign_X_uid56_fpExp10Test_b_to_rightShiftStage1Idx1Pad4_uid179_fxpInPostAlign_X_uid56_fpExp10Test_b_q;
    rightShiftStage2Idx1Pad1_uid193_fxpInPostAlign_X_uid56_fpExp10Test_q_i <= rightShiftStage2Idx1Pad1_uid193_fxpInPostAlign_X_uid56_fpExp10Test_a or rightShiftStage2Idx1Pad1_uid193_fxpInPostAlign_X_uid56_fpExp10Test_b;
    rightShiftStage2Idx1Pad1_uid193_fxpInPostAlign_X_uid56_fpExp10Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx1Pad1_uid193_fxpInPostAlign_X_uid56_fpExp10Test_q, xin => rightShiftStage2Idx1Pad1_uid193_fxpInPostAlign_X_uid56_fpExp10Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage133dto1_uid194_fxpInPostAlign_X_uid56_fpExp10Test(BITSELECT,193)@6
    RightShiftStage133dto1_uid194_fxpInPostAlign_X_uid56_fpExp10Test_in <= rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_q;
    RightShiftStage133dto1_uid194_fxpInPostAlign_X_uid56_fpExp10Test_b <= RightShiftStage133dto1_uid194_fxpInPostAlign_X_uid56_fpExp10Test_in(33 downto 1);

	--rightShiftStage2Idx1_uid195_fxpInPostAlign_X_uid56_fpExp10Test(BITJOIN,194)@6
    rightShiftStage2Idx1_uid195_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage2Idx1Pad1_uid193_fxpInPostAlign_X_uid56_fpExp10Test_q & RightShiftStage133dto1_uid194_fxpInPostAlign_X_uid56_fpExp10Test_b;

	--ld_rightShiftStage2Idx1_uid195_fxpInPostAlign_X_uid56_fpExp10Test_q_to_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_d(DELAY,491)@6
    ld_rightShiftStage2Idx1_uid195_fxpInPostAlign_X_uid56_fpExp10Test_q_to_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_d : dspba_delay
    GENERIC MAP ( width => 34, depth => 1 )
    PORT MAP ( xin => rightShiftStage2Idx1_uid195_fxpInPostAlign_X_uid56_fpExp10Test_q, xout => ld_rightShiftStage2Idx1_uid195_fxpInPostAlign_X_uid56_fpExp10Test_q_to_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_d_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_2(REG,256)@6
    reg_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_2_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_2_q <= rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test(MUX,204)@7
    rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_s <= ld_reg_rightShiftStageSel1Dto0_uid155_fxpInPostAlign_uid45_fpExp10Test_0_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_1_q_to_rightShiftStage2_uid156_fxpInPostAlign_uid45_fpExp10Test_b_q;
    rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test: PROCESS (rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_s, en, reg_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_2_q, ld_rightShiftStage2Idx1_uid195_fxpInPostAlign_X_uid56_fpExp10Test_q_to_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_d_q, rightShiftStage2Idx2_uid199_fxpInPostAlign_X_uid56_fpExp10Test_q, rightShiftStage2Idx3_uid203_fxpInPostAlign_X_uid56_fpExp10Test_q)
    BEGIN
            CASE rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_s IS
                  WHEN "00" => rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_q <= reg_rightShiftStage1_uid191_fxpInPostAlign_X_uid56_fpExp10Test_0_to_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_2_q;
                  WHEN "01" => rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_q <= ld_rightShiftStage2Idx1_uid195_fxpInPostAlign_X_uid56_fpExp10Test_q_to_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_d_q;
                  WHEN "10" => rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage2Idx2_uid199_fxpInPostAlign_X_uid56_fpExp10Test_q;
                  WHEN "11" => rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_q <= rightShiftStage2Idx3_uid203_fxpInPostAlign_X_uid56_fpExp10Test_q;
                  WHEN OTHERS => rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_q_to_pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_b(DELAY,315)@7
    ld_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_q_to_pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_b : dspba_delay
    GENERIC MAP ( width => 34, depth => 2 )
    PORT MAP ( xin => rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_q, xout => ld_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_q_to_pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test(BITJOIN,56)@9
    pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_q <= ld_rightShiftStage2_uid205_fxpInPostAlign_X_uid56_fpExp10Test_q_to_pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_b_q & STD_LOGIC_VECTOR((7 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_0_to_yExt_uid57_fpExp10Test_0(REG,259)@9
    reg_pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_0_to_yExt_uid57_fpExp10Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_0_to_yExt_uid57_fpExp10Test_0_q <= "000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_0_to_yExt_uid57_fpExp10Test_0_q <= pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_q;
            END IF;
        END IF;
    END PROCESS;


	--yExt_uid57_fpExp10Test(SUB,57)@10
    yExt_uid57_fpExp10Test_a <= STD_LOGIC_VECTOR((43 downto 42 => reg_pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_0_to_yExt_uid57_fpExp10Test_0_q(41)) & reg_pad_fxpInPostAlignR_X_uid57_uid57_fpExp10Test_0_to_yExt_uid57_fpExp10Test_0_q);
    yExt_uid57_fpExp10Test_b <= STD_LOGIC_VECTOR((43 downto 43 => reg_sR_uid163_constMult_0_to_yExt_uid57_fpExp10Test_1_q(42)) & reg_sR_uid163_constMult_0_to_yExt_uid57_fpExp10Test_1_q);
            yExt_uid57_fpExp10Test_o <= STD_LOGIC_VECTOR(SIGNED(yExt_uid57_fpExp10Test_a) - SIGNED(yExt_uid57_fpExp10Test_b));
    yExt_uid57_fpExp10Test_q <= yExt_uid57_fpExp10Test_o(43 downto 0);


	--yRed_uid61_fpExp10Test(BITSELECT,60)@10
    yRed_uid61_fpExp10Test_in <= yExt_uid57_fpExp10Test_q(30 downto 0);
    yRed_uid61_fpExp10Test_b <= yRed_uid61_fpExp10Test_in(30 downto 5);

	--reg_yRed_uid61_fpExp10Test_0_to_yRedPostMux_uid62_fpExp10Test_2(REG,262)@10
    reg_yRed_uid61_fpExp10Test_0_to_yRedPostMux_uid62_fpExp10Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yRed_uid61_fpExp10Test_0_to_yRedPostMux_uid62_fpExp10Test_2_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yRed_uid61_fpExp10Test_0_to_yRedPostMux_uid62_fpExp10Test_2_q <= yRed_uid61_fpExp10Test_b;
            END IF;
        END IF;
    END PROCESS;


	--YExt43_uid59_fpExp10Test(BITSELECT,58)@10
    YExt43_uid59_fpExp10Test_in <= yExt_uid57_fpExp10Test_q;
    YExt43_uid59_fpExp10Test_b <= YExt43_uid59_fpExp10Test_in(43 downto 43);

	--reg_YExt43_uid59_fpExp10Test_0_to_yRedPostMux_uid62_fpExp10Test_1(REG,261)@10
    reg_YExt43_uid59_fpExp10Test_0_to_yRedPostMux_uid62_fpExp10Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_YExt43_uid59_fpExp10Test_0_to_yRedPostMux_uid62_fpExp10Test_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_YExt43_uid59_fpExp10Test_0_to_yRedPostMux_uid62_fpExp10Test_1_q <= YExt43_uid59_fpExp10Test_b;
            END IF;
        END IF;
    END PROCESS;


	--yRedPostMux_uid62_fpExp10Test(MUX,61)@11
    yRedPostMux_uid62_fpExp10Test_s <= reg_YExt43_uid59_fpExp10Test_0_to_yRedPostMux_uid62_fpExp10Test_1_q;
    yRedPostMux_uid62_fpExp10Test: PROCESS (yRedPostMux_uid62_fpExp10Test_s, en, reg_yRed_uid61_fpExp10Test_0_to_yRedPostMux_uid62_fpExp10Test_2_q, zY_uid60_fpExp10Test_q)
    BEGIN
            CASE yRedPostMux_uid62_fpExp10Test_s IS
                  WHEN "0" => yRedPostMux_uid62_fpExp10Test_q <= reg_yRed_uid61_fpExp10Test_0_to_yRedPostMux_uid62_fpExp10Test_2_q;
                  WHEN "1" => yRedPostMux_uid62_fpExp10Test_q <= zY_uid60_fpExp10Test_q;
                  WHEN OTHERS => yRedPostMux_uid62_fpExp10Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--addr_uid64_fpExp10Test(BITSELECT,63)@11
    addr_uid64_fpExp10Test_in <= yRedPostMux_uid62_fpExp10Test_q;
    addr_uid64_fpExp10Test_b <= addr_uid64_fpExp10Test_in(25 downto 18);

	--reg_addr_uid64_fpExp10Test_0_to_memoryC2_uid211_exp10TabGen_lutmem_0(REG,263)@11
    reg_addr_uid64_fpExp10Test_0_to_memoryC2_uid211_exp10TabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid64_fpExp10Test_0_to_memoryC2_uid211_exp10TabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid64_fpExp10Test_0_to_memoryC2_uid211_exp10TabGen_lutmem_0_q <= addr_uid64_fpExp10Test_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid211_exp10TabGen_lutmem(DUALMEM,233)@12
    memoryC2_uid211_exp10TabGen_lutmem_ia <= (others => '0');
    memoryC2_uid211_exp10TabGen_lutmem_aa <= (others => '0');
    memoryC2_uid211_exp10TabGen_lutmem_ab <= reg_addr_uid64_fpExp10Test_0_to_memoryC2_uid211_exp10TabGen_lutmem_0_q;
    memoryC2_uid211_exp10TabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 13,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 13,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "fp_exp10_s5_memoryC2_uid211_exp10TabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid211_exp10TabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid211_exp10TabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid211_exp10TabGen_lutmem_iq,
        address_a => memoryC2_uid211_exp10TabGen_lutmem_aa,
        data_a => memoryC2_uid211_exp10TabGen_lutmem_ia
    );
    memoryC2_uid211_exp10TabGen_lutmem_reset0 <= areset;
        memoryC2_uid211_exp10TabGen_lutmem_q <= memoryC2_uid211_exp10TabGen_lutmem_iq(12 downto 0);

	--reg_memoryC2_uid211_exp10TabGen_lutmem_0_to_prodXY_uid226_pT1_uid214_exp10PolyEval_1(REG,265)@14
    reg_memoryC2_uid211_exp10TabGen_lutmem_0_to_prodXY_uid226_pT1_uid214_exp10PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid211_exp10TabGen_lutmem_0_to_prodXY_uid226_pT1_uid214_exp10PolyEval_1_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid211_exp10TabGen_lutmem_0_to_prodXY_uid226_pT1_uid214_exp10PolyEval_1_q <= memoryC2_uid211_exp10TabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yRedPostMux_uid62_fpExp10Test_q_to_yPPolyEval_uid65_fpExp10Test_a_inputreg(DELAY,569)
    ld_yRedPostMux_uid62_fpExp10Test_q_to_yPPolyEval_uid65_fpExp10Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => yRedPostMux_uid62_fpExp10Test_q, xout => ld_yRedPostMux_uid62_fpExp10Test_q_to_yPPolyEval_uid65_fpExp10Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yRedPostMux_uid62_fpExp10Test_q_to_yPPolyEval_uid65_fpExp10Test_a(DELAY,323)@11
    ld_yRedPostMux_uid62_fpExp10Test_q_to_yPPolyEval_uid65_fpExp10Test_a : dspba_delay
    GENERIC MAP ( width => 26, depth => 2 )
    PORT MAP ( xin => ld_yRedPostMux_uid62_fpExp10Test_q_to_yPPolyEval_uid65_fpExp10Test_a_inputreg_q, xout => ld_yRedPostMux_uid62_fpExp10Test_q_to_yPPolyEval_uid65_fpExp10Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--yPPolyEval_uid65_fpExp10Test(BITSELECT,64)@14
    yPPolyEval_uid65_fpExp10Test_in <= ld_yRedPostMux_uid62_fpExp10Test_q_to_yPPolyEval_uid65_fpExp10Test_a_q(17 downto 0);
    yPPolyEval_uid65_fpExp10Test_b <= yPPolyEval_uid65_fpExp10Test_in(17 downto 0);

	--yT1_uid213_exp10PolyEval(BITSELECT,212)@14
    yT1_uid213_exp10PolyEval_in <= yPPolyEval_uid65_fpExp10Test_b;
    yT1_uid213_exp10PolyEval_b <= yT1_uid213_exp10PolyEval_in(17 downto 5);

	--reg_yT1_uid213_exp10PolyEval_0_to_prodXY_uid226_pT1_uid214_exp10PolyEval_0(REG,264)@14
    reg_yT1_uid213_exp10PolyEval_0_to_prodXY_uid226_pT1_uid214_exp10PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid213_exp10PolyEval_0_to_prodXY_uid226_pT1_uid214_exp10PolyEval_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid213_exp10PolyEval_0_to_prodXY_uid226_pT1_uid214_exp10PolyEval_0_q <= yT1_uid213_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid226_pT1_uid214_exp10PolyEval(MULT,225)@15
    prodXY_uid226_pT1_uid214_exp10PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid226_pT1_uid214_exp10PolyEval_a),14)) * SIGNED(prodXY_uid226_pT1_uid214_exp10PolyEval_b);
    prodXY_uid226_pT1_uid214_exp10PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid226_pT1_uid214_exp10PolyEval_a <= (others => '0');
            prodXY_uid226_pT1_uid214_exp10PolyEval_b <= (others => '0');
            prodXY_uid226_pT1_uid214_exp10PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid226_pT1_uid214_exp10PolyEval_a <= reg_yT1_uid213_exp10PolyEval_0_to_prodXY_uid226_pT1_uid214_exp10PolyEval_0_q;
                prodXY_uid226_pT1_uid214_exp10PolyEval_b <= reg_memoryC2_uid211_exp10TabGen_lutmem_0_to_prodXY_uid226_pT1_uid214_exp10PolyEval_1_q;
                prodXY_uid226_pT1_uid214_exp10PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid226_pT1_uid214_exp10PolyEval_pr,26));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid226_pT1_uid214_exp10PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid226_pT1_uid214_exp10PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid226_pT1_uid214_exp10PolyEval_q <= prodXY_uid226_pT1_uid214_exp10PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid227_pT1_uid214_exp10PolyEval(BITSELECT,226)@18
    prodXYTruncFR_uid227_pT1_uid214_exp10PolyEval_in <= prodXY_uid226_pT1_uid214_exp10PolyEval_q;
    prodXYTruncFR_uid227_pT1_uid214_exp10PolyEval_b <= prodXYTruncFR_uid227_pT1_uid214_exp10PolyEval_in(25 downto 12);

	--highBBits_uid216_exp10PolyEval(BITSELECT,215)@18
    highBBits_uid216_exp10PolyEval_in <= prodXYTruncFR_uid227_pT1_uid214_exp10PolyEval_b;
    highBBits_uid216_exp10PolyEval_b <= highBBits_uid216_exp10PolyEval_in(13 downto 1);

	--ld_addr_uid64_fpExp10Test_b_to_reg_addr_uid64_fpExp10Test_0_to_memoryC1_uid209_exp10TabGen_lutmem_0_a(DELAY,548)@11
    ld_addr_uid64_fpExp10Test_b_to_reg_addr_uid64_fpExp10Test_0_to_memoryC1_uid209_exp10TabGen_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => addr_uid64_fpExp10Test_b, xout => ld_addr_uid64_fpExp10Test_b_to_reg_addr_uid64_fpExp10Test_0_to_memoryC1_uid209_exp10TabGen_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_addr_uid64_fpExp10Test_0_to_memoryC1_uid209_exp10TabGen_lutmem_0(REG,266)@14
    reg_addr_uid64_fpExp10Test_0_to_memoryC1_uid209_exp10TabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid64_fpExp10Test_0_to_memoryC1_uid209_exp10TabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid64_fpExp10Test_0_to_memoryC1_uid209_exp10TabGen_lutmem_0_q <= ld_addr_uid64_fpExp10Test_b_to_reg_addr_uid64_fpExp10Test_0_to_memoryC1_uid209_exp10TabGen_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid209_exp10TabGen_lutmem(DUALMEM,232)@15
    memoryC1_uid209_exp10TabGen_lutmem_ia <= (others => '0');
    memoryC1_uid209_exp10TabGen_lutmem_aa <= (others => '0');
    memoryC1_uid209_exp10TabGen_lutmem_ab <= reg_addr_uid64_fpExp10Test_0_to_memoryC1_uid209_exp10TabGen_lutmem_0_q;
    memoryC1_uid209_exp10TabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 21,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 21,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "fp_exp10_s5_memoryC1_uid209_exp10TabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid209_exp10TabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid209_exp10TabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid209_exp10TabGen_lutmem_iq,
        address_a => memoryC1_uid209_exp10TabGen_lutmem_aa,
        data_a => memoryC1_uid209_exp10TabGen_lutmem_ia
    );
    memoryC1_uid209_exp10TabGen_lutmem_reset0 <= areset;
        memoryC1_uid209_exp10TabGen_lutmem_q <= memoryC1_uid209_exp10TabGen_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid209_exp10TabGen_lutmem_0_to_sumAHighB_uid217_exp10PolyEval_0(REG,267)@17
    reg_memoryC1_uid209_exp10TabGen_lutmem_0_to_sumAHighB_uid217_exp10PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid209_exp10TabGen_lutmem_0_to_sumAHighB_uid217_exp10PolyEval_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid209_exp10TabGen_lutmem_0_to_sumAHighB_uid217_exp10PolyEval_0_q <= memoryC1_uid209_exp10TabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid217_exp10PolyEval(ADD,216)@18
    sumAHighB_uid217_exp10PolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid209_exp10TabGen_lutmem_0_to_sumAHighB_uid217_exp10PolyEval_0_q(20)) & reg_memoryC1_uid209_exp10TabGen_lutmem_0_to_sumAHighB_uid217_exp10PolyEval_0_q);
    sumAHighB_uid217_exp10PolyEval_b <= STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid216_exp10PolyEval_b(12)) & highBBits_uid216_exp10PolyEval_b);
            sumAHighB_uid217_exp10PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid217_exp10PolyEval_a) + SIGNED(sumAHighB_uid217_exp10PolyEval_b));
    sumAHighB_uid217_exp10PolyEval_q <= sumAHighB_uid217_exp10PolyEval_o(21 downto 0);


	--lowRangeB_uid215_exp10PolyEval(BITSELECT,214)@18
    lowRangeB_uid215_exp10PolyEval_in <= prodXYTruncFR_uid227_pT1_uid214_exp10PolyEval_b(0 downto 0);
    lowRangeB_uid215_exp10PolyEval_b <= lowRangeB_uid215_exp10PolyEval_in(0 downto 0);

	--s1_uid215_uid218_exp10PolyEval(BITJOIN,217)@18
    s1_uid215_uid218_exp10PolyEval_q <= sumAHighB_uid217_exp10PolyEval_q & lowRangeB_uid215_exp10PolyEval_b;

	--reg_s1_uid215_uid218_exp10PolyEval_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_1(REG,269)@18
    reg_s1_uid215_uid218_exp10PolyEval_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid215_uid218_exp10PolyEval_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid215_uid218_exp10PolyEval_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_1_q <= s1_uid215_uid218_exp10PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_nor(LOGICAL,670)
    ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_nor_a <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_q;
    ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_nor_b <= ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_nor_q <= not (ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_nor_a or ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_nor_b);

	--ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_sticky_ena(REG,671)
    ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_nor_q = "1") THEN
                ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_sticky_ena_q <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_enaAnd(LOGICAL,672)
    ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_enaAnd_a <= ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_enaAnd_b <= en;
    ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_enaAnd_q <= ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_enaAnd_a and ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_enaAnd_b;

	--reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0(REG,268)@14
    reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q <= yPPolyEval_uid65_fpExp10Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_inputreg(DELAY,662)
    ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q, xout => ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem(DUALMEM,663)
    ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_ia <= ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_inputreg_q;
    ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_aa <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdreg_q;
    ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_ab <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_replace_rdmux_q;
    ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 18,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 18,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_iq,
        address_a => ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_aa,
        data_a => ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_ia
    );
    ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_reset0 <= areset;
        ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_q <= ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_iq(17 downto 0);

	--prodXY_uid229_pT2_uid220_exp10PolyEval(MULT,228)@19
    prodXY_uid229_pT2_uid220_exp10PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid229_pT2_uid220_exp10PolyEval_a),19)) * SIGNED(prodXY_uid229_pT2_uid220_exp10PolyEval_b);
    prodXY_uid229_pT2_uid220_exp10PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid229_pT2_uid220_exp10PolyEval_a <= (others => '0');
            prodXY_uid229_pT2_uid220_exp10PolyEval_b <= (others => '0');
            prodXY_uid229_pT2_uid220_exp10PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid229_pT2_uid220_exp10PolyEval_a <= ld_reg_yPPolyEval_uid65_fpExp10Test_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_0_q_to_prodXY_uid229_pT2_uid220_exp10PolyEval_a_replace_mem_q;
                prodXY_uid229_pT2_uid220_exp10PolyEval_b <= reg_s1_uid215_uid218_exp10PolyEval_0_to_prodXY_uid229_pT2_uid220_exp10PolyEval_1_q;
                prodXY_uid229_pT2_uid220_exp10PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid229_pT2_uid220_exp10PolyEval_pr,41));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid229_pT2_uid220_exp10PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid229_pT2_uid220_exp10PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid229_pT2_uid220_exp10PolyEval_q <= prodXY_uid229_pT2_uid220_exp10PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid230_pT2_uid220_exp10PolyEval(BITSELECT,229)@22
    prodXYTruncFR_uid230_pT2_uid220_exp10PolyEval_in <= prodXY_uid229_pT2_uid220_exp10PolyEval_q;
    prodXYTruncFR_uid230_pT2_uid220_exp10PolyEval_b <= prodXYTruncFR_uid230_pT2_uid220_exp10PolyEval_in(40 downto 17);

	--highBBits_uid222_exp10PolyEval(BITSELECT,221)@22
    highBBits_uid222_exp10PolyEval_in <= prodXYTruncFR_uid230_pT2_uid220_exp10PolyEval_b;
    highBBits_uid222_exp10PolyEval_b <= highBBits_uid222_exp10PolyEval_in(23 downto 2);

	--ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_nor(LOGICAL,683)
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_nor_a <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_q;
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_nor_b <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_sticky_ena_q;
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_nor_q <= not (ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_nor_a or ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_nor_b);

	--ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_mem_top(CONSTANT,679)
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_mem_top_q <= "0100";

	--ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmp(LOGICAL,680)
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmp_a <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_mem_top_q;
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdmux_q);
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmp_q <= "1" when ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmp_a = ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmp_b else "0";

	--ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmpReg(REG,681)
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmpReg_q <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_sticky_ena(REG,684)
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_nor_q = "1") THEN
                ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_sticky_ena_q <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_enaAnd(LOGICAL,685)
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_enaAnd_a <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_sticky_ena_q;
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_enaAnd_b <= en;
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_enaAnd_q <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_enaAnd_a and ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_enaAnd_b;

	--ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_inputreg(DELAY,673)
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => reg_addr_uid64_fpExp10Test_0_to_memoryC2_uid211_exp10TabGen_lutmem_0_q, xout => ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt(COUNTER,675)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_i = 3 THEN
                      ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_i <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_i <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_i,3));


	--ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdreg(REG,676)
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdreg_q <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdmux(MUX,677)
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdmux_s <= en;
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdmux: PROCESS (ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdmux_s, ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdreg_q, ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdmux_q <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdmux_q <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem(DUALMEM,674)
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_ia <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_inputreg_q;
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_aa <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdreg_q;
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_ab <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_rdmux_q;
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 8,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_iq,
        address_a => ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_aa,
        data_a => ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_ia
    );
    ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_reset0 <= areset;
        ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_q <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_iq(7 downto 0);

	--memoryC0_uid207_exp10TabGen_lutmem(DUALMEM,231)@19
    memoryC0_uid207_exp10TabGen_lutmem_ia <= (others => '0');
    memoryC0_uid207_exp10TabGen_lutmem_aa <= (others => '0');
    memoryC0_uid207_exp10TabGen_lutmem_ab <= ld_reg_addr_uid64_fpExp10Test_0_to_memoryC0_uid207_exp10TabGen_lutmem_0_q_to_memoryC0_uid207_exp10TabGen_lutmem_a_replace_mem_q;
    memoryC0_uid207_exp10TabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 29,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 29,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "fp_exp10_s5_memoryC0_uid207_exp10TabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid207_exp10TabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid207_exp10TabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid207_exp10TabGen_lutmem_iq,
        address_a => memoryC0_uid207_exp10TabGen_lutmem_aa,
        data_a => memoryC0_uid207_exp10TabGen_lutmem_ia
    );
    memoryC0_uid207_exp10TabGen_lutmem_reset0 <= areset;
        memoryC0_uid207_exp10TabGen_lutmem_q <= memoryC0_uid207_exp10TabGen_lutmem_iq(28 downto 0);

	--reg_memoryC0_uid207_exp10TabGen_lutmem_0_to_sumAHighB_uid223_exp10PolyEval_0(REG,271)@21
    reg_memoryC0_uid207_exp10TabGen_lutmem_0_to_sumAHighB_uid223_exp10PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid207_exp10TabGen_lutmem_0_to_sumAHighB_uid223_exp10PolyEval_0_q <= "00000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid207_exp10TabGen_lutmem_0_to_sumAHighB_uid223_exp10PolyEval_0_q <= memoryC0_uid207_exp10TabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid223_exp10PolyEval(ADD,222)@22
    sumAHighB_uid223_exp10PolyEval_a <= STD_LOGIC_VECTOR((29 downto 29 => reg_memoryC0_uid207_exp10TabGen_lutmem_0_to_sumAHighB_uid223_exp10PolyEval_0_q(28)) & reg_memoryC0_uid207_exp10TabGen_lutmem_0_to_sumAHighB_uid223_exp10PolyEval_0_q);
    sumAHighB_uid223_exp10PolyEval_b <= STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid222_exp10PolyEval_b(21)) & highBBits_uid222_exp10PolyEval_b);
            sumAHighB_uid223_exp10PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid223_exp10PolyEval_a) + SIGNED(sumAHighB_uid223_exp10PolyEval_b));
    sumAHighB_uid223_exp10PolyEval_q <= sumAHighB_uid223_exp10PolyEval_o(29 downto 0);


	--lowRangeB_uid221_exp10PolyEval(BITSELECT,220)@22
    lowRangeB_uid221_exp10PolyEval_in <= prodXYTruncFR_uid230_pT2_uid220_exp10PolyEval_b(1 downto 0);
    lowRangeB_uid221_exp10PolyEval_b <= lowRangeB_uid221_exp10PolyEval_in(1 downto 0);

	--s2_uid221_uid224_exp10PolyEval(BITJOIN,223)@22
    s2_uid221_uid224_exp10PolyEval_q <= sumAHighB_uid223_exp10PolyEval_q & lowRangeB_uid221_exp10PolyEval_b;

	--peORExpInc_uid68_fpExp10Test(BITSELECT,67)@22
    peORExpInc_uid68_fpExp10Test_in <= s2_uid221_uid224_exp10PolyEval_q(29 downto 0);
    peORExpInc_uid68_fpExp10Test_b <= peORExpInc_uid68_fpExp10Test_in(29 downto 29);

	--reg_peORExpInc_uid68_fpExp10Test_0_to_expRPostBiasPreExc_uid70_fpExp10Test_1(REG,272)@22
    reg_peORExpInc_uid68_fpExp10Test_0_to_expRPostBiasPreExc_uid70_fpExp10Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_peORExpInc_uid68_fpExp10Test_0_to_expRPostBiasPreExc_uid70_fpExp10Test_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_peORExpInc_uid68_fpExp10Test_0_to_expRPostBiasPreExc_uid70_fpExp10Test_1_q <= peORExpInc_uid68_fpExp10Test_b;
            END IF;
        END IF;
    END PROCESS;


	--cstBias_uid8_fpExp10Test(CONSTANT,7)
    cstBias_uid8_fpExp10Test_q <= "01111111";

	--ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_nor(LOGICAL,696)
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_nor_a <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_q;
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_nor_b <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_sticky_ena_q;
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_nor_q <= not (ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_nor_a or ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_nor_b);

	--ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_mem_top(CONSTANT,692)
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_mem_top_q <= "01011";

	--ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmp(LOGICAL,693)
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmp_a <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_mem_top_q;
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdmux_q);
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmp_q <= "1" when ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmp_a = ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmp_b else "0";

	--ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmpReg(REG,694)
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmpReg_q <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_sticky_ena(REG,697)
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_nor_q = "1") THEN
                ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_sticky_ena_q <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_enaAnd(LOGICAL,698)
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_enaAnd_a <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_sticky_ena_q;
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_enaAnd_b <= en;
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_enaAnd_q <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_enaAnd_a and ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_enaAnd_b;

	--ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_inputreg(DELAY,686)
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 12, depth => 1 )
    PORT MAP ( xin => ePreRnd_uid46_fpExp10Test_b, xout => ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt(COUNTER,688)
    -- every=1, low=0, high=11, step=1, init=1
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_i = 10 THEN
                      ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_eq = '1') THEN
                        ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_i <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_i - 11;
                    ELSE
                        ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_i <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_i,4));


	--ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdreg(REG,689)
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdreg_q <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdmux(MUX,690)
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdmux_s <= en;
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdmux: PROCESS (ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdmux_s, ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdreg_q, ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdmux_q <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdreg_q;
                  WHEN "1" => ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdmux_q <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem(DUALMEM,687)
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_ia <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_inputreg_q;
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_aa <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdreg_q;
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_ab <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_rdmux_q;
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 12,
        widthad_b => 4,
        numwords_b => 12,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_iq,
        address_a => ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_aa,
        data_a => ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_ia
    );
    ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_reset0 <= areset;
        ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_q <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_iq(11 downto 0);

	--reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0(REG,248)@21
    reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_q <= ld_ePreRnd_uid46_fpExp10Test_b_to_reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--expRPostBiasPreExc0_uid69_fpExp10Test(ADD,68)@22
    expRPostBiasPreExc0_uid69_fpExp10Test_a <= STD_LOGIC_VECTOR((13 downto 12 => reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_q(11)) & reg_ePreRnd_uid46_fpExp10Test_0_to_expRPostBiasPreExc0_uid69_fpExp10Test_0_q);
    expRPostBiasPreExc0_uid69_fpExp10Test_b <= STD_LOGIC_VECTOR('0' & "00000" & cstBias_uid8_fpExp10Test_q);
    expRPostBiasPreExc0_uid69_fpExp10Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostBiasPreExc0_uid69_fpExp10Test_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expRPostBiasPreExc0_uid69_fpExp10Test_o <= STD_LOGIC_VECTOR(SIGNED(expRPostBiasPreExc0_uid69_fpExp10Test_a) + SIGNED(expRPostBiasPreExc0_uid69_fpExp10Test_b));
            END IF;
        END IF;
    END PROCESS;
    expRPostBiasPreExc0_uid69_fpExp10Test_q <= expRPostBiasPreExc0_uid69_fpExp10Test_o(12 downto 0);


	--expRPostBiasPreExc_uid70_fpExp10Test(ADD,69)@23
    expRPostBiasPreExc_uid70_fpExp10Test_a <= STD_LOGIC_VECTOR((14 downto 13 => expRPostBiasPreExc0_uid69_fpExp10Test_q(12)) & expRPostBiasPreExc0_uid69_fpExp10Test_q);
    expRPostBiasPreExc_uid70_fpExp10Test_b <= STD_LOGIC_VECTOR('0' & "0000000000000" & reg_peORExpInc_uid68_fpExp10Test_0_to_expRPostBiasPreExc_uid70_fpExp10Test_1_q);
            expRPostBiasPreExc_uid70_fpExp10Test_o <= STD_LOGIC_VECTOR(SIGNED(expRPostBiasPreExc_uid70_fpExp10Test_a) + SIGNED(expRPostBiasPreExc_uid70_fpExp10Test_b));
    expRPostBiasPreExc_uid70_fpExp10Test_q <= expRPostBiasPreExc_uid70_fpExp10Test_o(13 downto 0);


	--expR_uid75_fpExp10Test(BITSELECT,74)@23
    expR_uid75_fpExp10Test_in <= expRPostBiasPreExc_uid70_fpExp10Test_q(7 downto 0);
    expR_uid75_fpExp10Test_b <= expR_uid75_fpExp10Test_in(7 downto 0);

	--ld_expR_uid75_fpExp10Test_b_to_expRPostExc_uid97_fpExp10Test_d(DELAY,364)@23
    ld_expR_uid75_fpExp10Test_b_to_expRPostExc_uid97_fpExp10Test_d : dspba_delay
    GENERIC MAP ( width => 8, depth => 2 )
    PORT MAP ( xin => expR_uid75_fpExp10Test_b, xout => ld_expR_uid75_fpExp10Test_b_to_expRPostExc_uid97_fpExp10Test_d_q, ena => en(0), clk => clk, aclr => areset );

	--cstZeroWE_uid11_fpExp10Test(CONSTANT,10)
    cstZeroWE_uid11_fpExp10Test_q <= "00000000";

	--ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_nor(LOGICAL,658)
    ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_nor_a <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_q;
    ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_nor_b <= ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_sticky_ena_q;
    ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_nor_q <= not (ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_nor_a or ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_nor_b);

	--ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_mem_top(CONSTANT,576)
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_mem_top_q <= "010101";

	--ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmp(LOGICAL,577)
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmp_a <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_mem_top_q;
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_q);
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmp_q <= "1" when ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmp_a = ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmp_b else "0";

	--ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmpReg(REG,578)
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmpReg_q <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_sticky_ena(REG,659)
    ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_nor_q = "1") THEN
                ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_sticky_ena_q <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_enaAnd(LOGICAL,660)
    ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_enaAnd_a <= ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_sticky_ena_q;
    ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_enaAnd_b <= en;
    ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_enaAnd_q <= ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_enaAnd_a and ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_enaAnd_b;

	--cstAllZWF_uid16_fpExp10Test(CONSTANT,15)
    cstAllZWF_uid16_fpExp10Test_q <= "00000000000000000000000";

	--fracXIsZero_uid23_fpExp10Test(LOGICAL,22)@0
    fracXIsZero_uid23_fpExp10Test_a <= frac_uid22_fpExp10Test_b;
    fracXIsZero_uid23_fpExp10Test_b <= cstAllZWF_uid16_fpExp10Test_q;
    fracXIsZero_uid23_fpExp10Test_q <= "1" when fracXIsZero_uid23_fpExp10Test_a = fracXIsZero_uid23_fpExp10Test_b else "0";

	--InvFracXIsZero_uid25_fpExp10Test(LOGICAL,24)@0
    InvFracXIsZero_uid25_fpExp10Test_a <= fracXIsZero_uid23_fpExp10Test_q;
    InvFracXIsZero_uid25_fpExp10Test_q <= not InvFracXIsZero_uid25_fpExp10Test_a;

	--expXIsMax_uid21_fpExp10Test(LOGICAL,20)@0
    expXIsMax_uid21_fpExp10Test_a <= expX_uid6_fpExp10Test_b;
    expXIsMax_uid21_fpExp10Test_b <= cstAllOWE_uid15_fpExp10Test_q;
    expXIsMax_uid21_fpExp10Test_q <= "1" when expXIsMax_uid21_fpExp10Test_a = expXIsMax_uid21_fpExp10Test_b else "0";

	--exc_N_uid26_fpExp10Test(LOGICAL,25)@0
    exc_N_uid26_fpExp10Test_a <= expXIsMax_uid21_fpExp10Test_q;
    exc_N_uid26_fpExp10Test_b <= InvFracXIsZero_uid25_fpExp10Test_q;
    exc_N_uid26_fpExp10Test_q <= exc_N_uid26_fpExp10Test_a and exc_N_uid26_fpExp10Test_b;

	--ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_inputreg(DELAY,648)
    ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_N_uid26_fpExp10Test_q, xout => ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt(COUNTER,572)
    -- every=1, low=0, high=21, step=1, init=1
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_i = 20 THEN
                      ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_eq = '1') THEN
                        ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_i <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_i - 21;
                    ELSE
                        ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_i <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_i,5));


	--ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdreg(REG,573)
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdreg_q <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux(MUX,574)
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_s <= en;
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux: PROCESS (ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_s, ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdreg_q, ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_s IS
                  WHEN "0" => ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_q <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdreg_q;
                  WHEN "1" => ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_q <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem(DUALMEM,649)
    ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_ia <= ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_inputreg_q;
    ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_aa <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdreg_q;
    ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_ab <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_q;
    ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 22,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_iq,
        address_a => ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_aa,
        data_a => ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_ia
    );
    ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_reset0 <= areset;
        ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_q <= ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_iq(0 downto 0);

	--ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_nor(LOGICAL,645)
    ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_nor_a <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_q;
    ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_nor_b <= ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_sticky_ena_q;
    ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_nor_q <= not (ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_nor_a or ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_nor_b);

	--ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_sticky_ena(REG,646)
    ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_nor_q = "1") THEN
                ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_sticky_ena_q <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_enaAnd(LOGICAL,647)
    ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_enaAnd_a <= ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_sticky_ena_q;
    ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_enaAnd_b <= en;
    ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_enaAnd_q <= ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_enaAnd_a and ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_enaAnd_b;

	--InvSignX_uid81_fpExp10Test(LOGICAL,80)@0
    InvSignX_uid81_fpExp10Test_a <= signX_uid7_fpExp10Test_b;
    InvSignX_uid81_fpExp10Test_q <= not InvSignX_uid81_fpExp10Test_a;

	--expOvfInitial_uid41_fpExp10Test(BITSELECT,40)@0
    expOvfInitial_uid41_fpExp10Test_in <= shiftValuePreSat_uid40_fpExp10Test_q;
    expOvfInitial_uid41_fpExp10Test_b <= expOvfInitial_uid41_fpExp10Test_in(8 downto 8);

	--InvExc_N_uid27_fpExp10Test(LOGICAL,26)@0
    InvExc_N_uid27_fpExp10Test_a <= exc_N_uid26_fpExp10Test_q;
    InvExc_N_uid27_fpExp10Test_q <= not InvExc_N_uid27_fpExp10Test_a;

	--exc_I_uid24_fpExp10Test(LOGICAL,23)@0
    exc_I_uid24_fpExp10Test_a <= expXIsMax_uid21_fpExp10Test_q;
    exc_I_uid24_fpExp10Test_b <= fracXIsZero_uid23_fpExp10Test_q;
    exc_I_uid24_fpExp10Test_q <= exc_I_uid24_fpExp10Test_a and exc_I_uid24_fpExp10Test_b;

	--InvExc_I_uid28_fpExp10Test(LOGICAL,27)@0
    InvExc_I_uid28_fpExp10Test_a <= exc_I_uid24_fpExp10Test_q;
    InvExc_I_uid28_fpExp10Test_q <= not InvExc_I_uid28_fpExp10Test_a;

	--expXIsZero_uid19_fpExp10Test(LOGICAL,18)@0
    expXIsZero_uid19_fpExp10Test_a <= expX_uid6_fpExp10Test_b;
    expXIsZero_uid19_fpExp10Test_b <= cstZeroWE_uid11_fpExp10Test_q;
    expXIsZero_uid19_fpExp10Test_q <= "1" when expXIsZero_uid19_fpExp10Test_a = expXIsZero_uid19_fpExp10Test_b else "0";

	--InvExpXIsZero_uid29_fpExp10Test(LOGICAL,28)@0
    InvExpXIsZero_uid29_fpExp10Test_a <= expXIsZero_uid19_fpExp10Test_q;
    InvExpXIsZero_uid29_fpExp10Test_q <= not InvExpXIsZero_uid29_fpExp10Test_a;

	--exc_R_uid30_fpExp10Test(LOGICAL,29)@0
    exc_R_uid30_fpExp10Test_a <= InvExpXIsZero_uid29_fpExp10Test_q;
    exc_R_uid30_fpExp10Test_b <= InvExc_I_uid28_fpExp10Test_q;
    exc_R_uid30_fpExp10Test_c <= InvExc_N_uid27_fpExp10Test_q;
    exc_R_uid30_fpExp10Test_q <= exc_R_uid30_fpExp10Test_a and exc_R_uid30_fpExp10Test_b and exc_R_uid30_fpExp10Test_c;

	--regXAndExpOverflowAndPos_uid82_fpExp10Test(LOGICAL,81)@0
    regXAndExpOverflowAndPos_uid82_fpExp10Test_a <= exc_R_uid30_fpExp10Test_q;
    regXAndExpOverflowAndPos_uid82_fpExp10Test_b <= expOvfInitial_uid41_fpExp10Test_b;
    regXAndExpOverflowAndPos_uid82_fpExp10Test_c <= InvSignX_uid81_fpExp10Test_q;
    regXAndExpOverflowAndPos_uid82_fpExp10Test_q <= regXAndExpOverflowAndPos_uid82_fpExp10Test_a and regXAndExpOverflowAndPos_uid82_fpExp10Test_b and regXAndExpOverflowAndPos_uid82_fpExp10Test_c;

	--ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_inputreg(DELAY,635)
    ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => regXAndExpOverflowAndPos_uid82_fpExp10Test_q, xout => ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem(DUALMEM,636)
    ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_ia <= ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_inputreg_q;
    ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_aa <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdreg_q;
    ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_ab <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_q;
    ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 22,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_iq,
        address_a => ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_aa,
        data_a => ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_ia
    );
    ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_reset0 <= areset;
        ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_q <= ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_iq(0 downto 0);

	--ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_nor(LOGICAL,580)
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_nor_a <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_q;
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_nor_b <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_sticky_ena_q;
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_nor_q <= not (ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_nor_a or ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_nor_b);

	--ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_sticky_ena(REG,581)
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_nor_q = "1") THEN
                ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_sticky_ena_q <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_enaAnd(LOGICAL,582)
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_enaAnd_a <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_sticky_ena_q;
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_enaAnd_b <= en;
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_enaAnd_q <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_enaAnd_a and ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_enaAnd_b;

	--ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_inputreg(DELAY,570)
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expOvfInitial_uid41_fpExp10Test_b, xout => ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem(DUALMEM,571)
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_ia <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_inputreg_q;
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_aa <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdreg_q;
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_ab <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_q;
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 22,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_iq,
        address_a => ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_aa,
        data_a => ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_ia
    );
    ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_reset0 <= areset;
        ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_q <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_iq(0 downto 0);

	--InvExpOvfInitial_uid78_fpExp10Test(LOGICAL,77)@24
    InvExpOvfInitial_uid78_fpExp10Test_a <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_mem_q;
    InvExpOvfInitial_uid78_fpExp10Test_q <= not InvExpOvfInitial_uid78_fpExp10Test_a;

	--reg_expRPostBiasPreExc_uid70_fpExp10Test_0_to_expUdf_uid72_fpExp10Test_1(REG,273)@23
    reg_expRPostBiasPreExc_uid70_fpExp10Test_0_to_expUdf_uid72_fpExp10Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPostBiasPreExc_uid70_fpExp10Test_0_to_expUdf_uid72_fpExp10Test_1_q <= "00000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPostBiasPreExc_uid70_fpExp10Test_0_to_expUdf_uid72_fpExp10Test_1_q <= expRPostBiasPreExc_uid70_fpExp10Test_q;
            END IF;
        END IF;
    END PROCESS;


	--expOvf_uid74_fpExp10Test(COMPARE,73)@24
    expOvf_uid74_fpExp10Test_cin <= GND_q;
    expOvf_uid74_fpExp10Test_a <= STD_LOGIC_VECTOR((15 downto 14 => reg_expRPostBiasPreExc_uid70_fpExp10Test_0_to_expUdf_uid72_fpExp10Test_1_q(13)) & reg_expRPostBiasPreExc_uid70_fpExp10Test_0_to_expUdf_uid72_fpExp10Test_1_q) & '0';
    expOvf_uid74_fpExp10Test_b <= STD_LOGIC_VECTOR('0' & "0000000" & cstAllOWE_uid15_fpExp10Test_q) & expOvf_uid74_fpExp10Test_cin(0);
            expOvf_uid74_fpExp10Test_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid74_fpExp10Test_a) - SIGNED(expOvf_uid74_fpExp10Test_b));
    expOvf_uid74_fpExp10Test_n(0) <= not expOvf_uid74_fpExp10Test_o(16);


	--ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_nor(LOGICAL,593)
    ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_nor_a <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_q;
    ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_nor_b <= ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_sticky_ena_q;
    ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_nor_q <= not (ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_nor_a or ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_nor_b);

	--ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_sticky_ena(REG,594)
    ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_nor_q = "1") THEN
                ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_sticky_ena_q <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_enaAnd(LOGICAL,595)
    ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_enaAnd_a <= ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_sticky_ena_q;
    ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_enaAnd_b <= en;
    ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_enaAnd_q <= ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_enaAnd_a and ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_enaAnd_b;

	--ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_inputreg(DELAY,583)
    ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_R_uid30_fpExp10Test_q, xout => ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem(DUALMEM,584)
    ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_ia <= ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_inputreg_q;
    ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_aa <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdreg_q;
    ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_ab <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_q;
    ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 22,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_iq,
        address_a => ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_aa,
        data_a => ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_ia
    );
    ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_reset0 <= areset;
        ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_q <= ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_iq(0 downto 0);

	--regInAndOvf_uid84_fpExp10Test(LOGICAL,83)@24
    regInAndOvf_uid84_fpExp10Test_a <= ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_q;
    regInAndOvf_uid84_fpExp10Test_b <= expOvf_uid74_fpExp10Test_n;
    regInAndOvf_uid84_fpExp10Test_c <= InvExpOvfInitial_uid78_fpExp10Test_q;
    regInAndOvf_uid84_fpExp10Test_q <= regInAndOvf_uid84_fpExp10Test_a and regInAndOvf_uid84_fpExp10Test_b and regInAndOvf_uid84_fpExp10Test_c;

	--ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_nor(LOGICAL,632)
    ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_nor_a <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_q;
    ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_nor_b <= ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_sticky_ena_q;
    ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_nor_q <= not (ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_nor_a or ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_nor_b);

	--ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_sticky_ena(REG,633)
    ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_nor_q = "1") THEN
                ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_sticky_ena_q <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_enaAnd(LOGICAL,634)
    ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_enaAnd_a <= ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_sticky_ena_q;
    ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_enaAnd_b <= en;
    ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_enaAnd_q <= ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_enaAnd_a and ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_enaAnd_b;

	--posInf_uid86_fpExp10Test(LOGICAL,85)@0
    posInf_uid86_fpExp10Test_a <= exc_I_uid24_fpExp10Test_q;
    posInf_uid86_fpExp10Test_b <= InvSignX_uid81_fpExp10Test_q;
    posInf_uid86_fpExp10Test_q <= posInf_uid86_fpExp10Test_a and posInf_uid86_fpExp10Test_b;

	--ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_inputreg(DELAY,622)
    ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => posInf_uid86_fpExp10Test_q, xout => ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem(DUALMEM,623)
    ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_ia <= ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_inputreg_q;
    ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_aa <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdreg_q;
    ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_ab <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_q;
    ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 22,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_iq,
        address_a => ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_aa,
        data_a => ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_ia
    );
    ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_reset0 <= areset;
        ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_q <= ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_iq(0 downto 0);

	--excRInf_uid87_fpExp10Test(LOGICAL,86)@24
    excRInf_uid87_fpExp10Test_a <= ld_posInf_uid86_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_a_replace_mem_q;
    excRInf_uid87_fpExp10Test_b <= regInAndOvf_uid84_fpExp10Test_q;
    excRInf_uid87_fpExp10Test_c <= ld_regXAndExpOverflowAndPos_uid82_fpExp10Test_q_to_excRInf_uid87_fpExp10Test_c_replace_mem_q;
    excRInf_uid87_fpExp10Test_q <= excRInf_uid87_fpExp10Test_a or excRInf_uid87_fpExp10Test_b or excRInf_uid87_fpExp10Test_c;

	--ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_nor(LOGICAL,619)
    ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_nor_a <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_q;
    ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_nor_b <= ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_sticky_ena_q;
    ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_nor_q <= not (ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_nor_a or ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_nor_b);

	--ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_sticky_ena(REG,620)
    ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_nor_q = "1") THEN
                ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_sticky_ena_q <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_enaAnd(LOGICAL,621)
    ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_enaAnd_a <= ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_sticky_ena_q;
    ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_enaAnd_b <= en;
    ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_enaAnd_q <= ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_enaAnd_a and ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_enaAnd_b;

	--negInf_uid76_fpExp10Test(LOGICAL,75)@0
    negInf_uid76_fpExp10Test_a <= exc_I_uid24_fpExp10Test_q;
    negInf_uid76_fpExp10Test_b <= signX_uid7_fpExp10Test_b;
    negInf_uid76_fpExp10Test_q <= negInf_uid76_fpExp10Test_a and negInf_uid76_fpExp10Test_b;

	--ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_inputreg(DELAY,609)
    ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => negInf_uid76_fpExp10Test_q, xout => ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem(DUALMEM,610)
    ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_ia <= ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_inputreg_q;
    ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_aa <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdreg_q;
    ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_ab <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_q;
    ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 22,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_iq,
        address_a => ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_aa,
        data_a => ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_ia
    );
    ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_reset0 <= areset;
        ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_q <= ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_iq(0 downto 0);

	--ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_nor(LOGICAL,606)
    ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_nor_a <= ld_oFracX_uid32_uid32_fpExp10Test_q_to_oFracXZwE_uid48_fpExp10Test_b_notEnable_q;
    ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_nor_b <= ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_sticky_ena_q;
    ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_nor_q <= not (ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_nor_a or ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_nor_b);

	--ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_sticky_ena(REG,607)
    ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_nor_q = "1") THEN
                ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_sticky_ena_q <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_enaAnd(LOGICAL,608)
    ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_enaAnd_a <= ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_sticky_ena_q;
    ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_enaAnd_b <= en;
    ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_enaAnd_q <= ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_enaAnd_a and ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_enaAnd_b;

	--regXAndExpOverflowAndNeg_uid77_fpExp10Test(LOGICAL,76)@0
    regXAndExpOverflowAndNeg_uid77_fpExp10Test_a <= exc_R_uid30_fpExp10Test_q;
    regXAndExpOverflowAndNeg_uid77_fpExp10Test_b <= expOvfInitial_uid41_fpExp10Test_b;
    regXAndExpOverflowAndNeg_uid77_fpExp10Test_c <= signX_uid7_fpExp10Test_b;
    regXAndExpOverflowAndNeg_uid77_fpExp10Test_q <= regXAndExpOverflowAndNeg_uid77_fpExp10Test_a and regXAndExpOverflowAndNeg_uid77_fpExp10Test_b and regXAndExpOverflowAndNeg_uid77_fpExp10Test_c;

	--ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_inputreg(DELAY,596)
    ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => regXAndExpOverflowAndNeg_uid77_fpExp10Test_q, xout => ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem(DUALMEM,597)
    ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_ia <= ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_inputreg_q;
    ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_aa <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdreg_q;
    ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_ab <= ld_expOvfInitial_uid41_fpExp10Test_b_to_InvExpOvfInitial_uid78_fpExp10Test_a_replace_rdmux_q;
    ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 22,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_iq,
        address_a => ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_aa,
        data_a => ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_ia
    );
    ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_reset0 <= areset;
        ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_q <= ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_iq(0 downto 0);

	--expUdf_uid72_fpExp10Test(COMPARE,71)@24
    expUdf_uid72_fpExp10Test_cin <= GND_q;
    expUdf_uid72_fpExp10Test_a <= STD_LOGIC_VECTOR('0' & "00000000000000" & GND_q) & '0';
    expUdf_uid72_fpExp10Test_b <= STD_LOGIC_VECTOR((15 downto 14 => reg_expRPostBiasPreExc_uid70_fpExp10Test_0_to_expUdf_uid72_fpExp10Test_1_q(13)) & reg_expRPostBiasPreExc_uid70_fpExp10Test_0_to_expUdf_uid72_fpExp10Test_1_q) & expUdf_uid72_fpExp10Test_cin(0);
            expUdf_uid72_fpExp10Test_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid72_fpExp10Test_a) - SIGNED(expUdf_uid72_fpExp10Test_b));
    expUdf_uid72_fpExp10Test_n(0) <= not expUdf_uid72_fpExp10Test_o(16);


	--regXAndUdf_uid79_fpExp10Test(LOGICAL,78)@24
    regXAndUdf_uid79_fpExp10Test_a <= ld_exc_R_uid30_fpExp10Test_q_to_regXAndUdf_uid79_fpExp10Test_a_replace_mem_q;
    regXAndUdf_uid79_fpExp10Test_b <= expUdf_uid72_fpExp10Test_n;
    regXAndUdf_uid79_fpExp10Test_c <= InvExpOvfInitial_uid78_fpExp10Test_q;
    regXAndUdf_uid79_fpExp10Test_q <= regXAndUdf_uid79_fpExp10Test_a and regXAndUdf_uid79_fpExp10Test_b and regXAndUdf_uid79_fpExp10Test_c;

	--excRZero_uid80_fpExp10Test(LOGICAL,79)@24
    excRZero_uid80_fpExp10Test_a <= regXAndUdf_uid79_fpExp10Test_q;
    excRZero_uid80_fpExp10Test_b <= ld_regXAndExpOverflowAndNeg_uid77_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_b_replace_mem_q;
    excRZero_uid80_fpExp10Test_c <= ld_negInf_uid76_fpExp10Test_q_to_excRZero_uid80_fpExp10Test_c_replace_mem_q;
    excRZero_uid80_fpExp10Test_q <= excRZero_uid80_fpExp10Test_a or excRZero_uid80_fpExp10Test_b or excRZero_uid80_fpExp10Test_c;

	--concExc_uid88_fpExp10Test(BITJOIN,87)@24
    concExc_uid88_fpExp10Test_q <= ld_exc_N_uid26_fpExp10Test_q_to_concExc_uid88_fpExp10Test_c_replace_mem_q & excRInf_uid87_fpExp10Test_q & excRZero_uid80_fpExp10Test_q;

	--reg_concExc_uid88_fpExp10Test_0_to_excREnc_uid89_fpExp10Test_0(REG,275)@24
    reg_concExc_uid88_fpExp10Test_0_to_excREnc_uid89_fpExp10Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid88_fpExp10Test_0_to_excREnc_uid89_fpExp10Test_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid88_fpExp10Test_0_to_excREnc_uid89_fpExp10Test_0_q <= concExc_uid88_fpExp10Test_q;
            END IF;
        END IF;
    END PROCESS;


	--excREnc_uid89_fpExp10Test(LOOKUP,88)@25
    excREnc_uid89_fpExp10Test: PROCESS (reg_concExc_uid88_fpExp10Test_0_to_excREnc_uid89_fpExp10Test_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_concExc_uid88_fpExp10Test_0_to_excREnc_uid89_fpExp10Test_0_q) IS
                WHEN "000" =>  excREnc_uid89_fpExp10Test_q <= "01";
                WHEN "001" =>  excREnc_uid89_fpExp10Test_q <= "00";
                WHEN "010" =>  excREnc_uid89_fpExp10Test_q <= "10";
                WHEN "011" =>  excREnc_uid89_fpExp10Test_q <= "00";
                WHEN "100" =>  excREnc_uid89_fpExp10Test_q <= "11";
                WHEN "101" =>  excREnc_uid89_fpExp10Test_q <= "00";
                WHEN "110" =>  excREnc_uid89_fpExp10Test_q <= "00";
                WHEN "111" =>  excREnc_uid89_fpExp10Test_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid89_fpExp10Test_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xIn(GPIN,3)@0

	--expRPostExc_uid97_fpExp10Test(MUX,96)@25
    expRPostExc_uid97_fpExp10Test_s <= excREnc_uid89_fpExp10Test_q;
    expRPostExc_uid97_fpExp10Test: PROCESS (expRPostExc_uid97_fpExp10Test_s, en, cstZeroWE_uid11_fpExp10Test_q, ld_expR_uid75_fpExp10Test_b_to_expRPostExc_uid97_fpExp10Test_d_q, cstAllOWE_uid15_fpExp10Test_q, cstAllOWE_uid15_fpExp10Test_q)
    BEGIN
            CASE expRPostExc_uid97_fpExp10Test_s IS
                  WHEN "00" => expRPostExc_uid97_fpExp10Test_q <= cstZeroWE_uid11_fpExp10Test_q;
                  WHEN "01" => expRPostExc_uid97_fpExp10Test_q <= ld_expR_uid75_fpExp10Test_b_to_expRPostExc_uid97_fpExp10Test_d_q;
                  WHEN "10" => expRPostExc_uid97_fpExp10Test_q <= cstAllOWE_uid15_fpExp10Test_q;
                  WHEN "11" => expRPostExc_uid97_fpExp10Test_q <= cstAllOWE_uid15_fpExp10Test_q;
                  WHEN OTHERS => expRPostExc_uid97_fpExp10Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oneFracRPostExc2_uid90_fpExp10Test(CONSTANT,89)
    oneFracRPostExc2_uid90_fpExp10Test_q <= "00000000000000000000001";

	--peOR_uid67_fpExp10Test(BITSELECT,66)@22
    peOR_uid67_fpExp10Test_in <= s2_uid221_uid224_exp10PolyEval_q(28 downto 0);
    peOR_uid67_fpExp10Test_b <= peOR_uid67_fpExp10Test_in(28 downto 5);

	--fracR_uid71_fpExp10Test(BITSELECT,70)@22
    fracR_uid71_fpExp10Test_in <= peOR_uid67_fpExp10Test_b(22 downto 0);
    fracR_uid71_fpExp10Test_b <= fracR_uid71_fpExp10Test_in(22 downto 0);

	--ld_fracR_uid71_fpExp10Test_b_to_fracRPostExc_uid93_fpExp10Test_d_inputreg(DELAY,661)
    ld_fracR_uid71_fpExp10Test_b_to_fracRPostExc_uid93_fpExp10Test_d_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracR_uid71_fpExp10Test_b, xout => ld_fracR_uid71_fpExp10Test_b_to_fracRPostExc_uid93_fpExp10Test_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracR_uid71_fpExp10Test_b_to_fracRPostExc_uid93_fpExp10Test_d(DELAY,362)@22
    ld_fracR_uid71_fpExp10Test_b_to_fracRPostExc_uid93_fpExp10Test_d : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => ld_fracR_uid71_fpExp10Test_b_to_fracRPostExc_uid93_fpExp10Test_d_inputreg_q, xout => ld_fracR_uid71_fpExp10Test_b_to_fracRPostExc_uid93_fpExp10Test_d_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid93_fpExp10Test(MUX,92)@25
    fracRPostExc_uid93_fpExp10Test_s <= excREnc_uid89_fpExp10Test_q;
    fracRPostExc_uid93_fpExp10Test: PROCESS (fracRPostExc_uid93_fpExp10Test_s, en, cstAllZWF_uid16_fpExp10Test_q, ld_fracR_uid71_fpExp10Test_b_to_fracRPostExc_uid93_fpExp10Test_d_q, cstAllZWF_uid16_fpExp10Test_q, oneFracRPostExc2_uid90_fpExp10Test_q)
    BEGIN
            CASE fracRPostExc_uid93_fpExp10Test_s IS
                  WHEN "00" => fracRPostExc_uid93_fpExp10Test_q <= cstAllZWF_uid16_fpExp10Test_q;
                  WHEN "01" => fracRPostExc_uid93_fpExp10Test_q <= ld_fracR_uid71_fpExp10Test_b_to_fracRPostExc_uid93_fpExp10Test_d_q;
                  WHEN "10" => fracRPostExc_uid93_fpExp10Test_q <= cstAllZWF_uid16_fpExp10Test_q;
                  WHEN "11" => fracRPostExc_uid93_fpExp10Test_q <= oneFracRPostExc2_uid90_fpExp10Test_q;
                  WHEN OTHERS => fracRPostExc_uid93_fpExp10Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RExp10_uid98_fpExp10Test(BITJOIN,97)@25
    RExp10_uid98_fpExp10Test_q <= GND_q & expRPostExc_uid97_fpExp10Test_q & fracRPostExc_uid93_fpExp10Test_q;

	--xOut(GPOUT,4)@25
    q <= RExp10_uid98_fpExp10Test_q;


end normal;
