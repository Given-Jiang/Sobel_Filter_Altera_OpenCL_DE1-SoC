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

-- VHDL created from fp_ln1p_double_s5
-- VHDL created on Tue Apr  9 11:21:08 2013


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

entity fp_ln1p_double_s5 is
    port (
        a : in std_logic_vector(63 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(63 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_ln1p_double_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllZWF_uid8_fpLogE1pxTest_q : std_logic_vector (51 downto 0);
    signal cstBias_uid9_fpLogE1pxTest_q : std_logic_vector (10 downto 0);
    signal cstBiasMO_uid10_fpLogE1pxTest_q : std_logic_vector (10 downto 0);
    signal cstBiasPWFP1_uid13_fpLogE1pxTest_q : std_logic_vector (10 downto 0);
    signal cstBiasMWFP1_uid14_fpLogE1pxTest_q : std_logic_vector (10 downto 0);
    signal cstAllOWE_uid15_fpLogE1pxTest_q : std_logic_vector (10 downto 0);
    signal cstAllZWE_uid17_fpLogE1pxTest_q : std_logic_vector (10 downto 0);
    signal padConst_uid36_fpLogE1pxTest_q : std_logic_vector (52 downto 0);
    signal maskIncrementTable_uid52_fpLogE1pxTest_q : std_logic_vector(52 downto 0);
    signal eUpdateOPOFracX_uid55_fpLogE1pxTest_a : std_logic_vector(11 downto 0);
    signal eUpdateOPOFracX_uid55_fpLogE1pxTest_b : std_logic_vector(11 downto 0);
    signal eUpdateOPOFracX_uid55_fpLogE1pxTest_o : std_logic_vector (11 downto 0);
    signal eUpdateOPOFracX_uid55_fpLogE1pxTest_q : std_logic_vector (11 downto 0);
    signal oPlusOFracXNorm_uid61_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal oPlusOFracXNorm_uid61_fpLogE1pxTest_q : std_logic_vector (52 downto 0);
    signal branEnc_uid77_fpLogE1pxTest_q : std_logic_vector(1 downto 0);
    signal expB_uid79_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal expB_uid79_fpLogE1pxTest_q : std_logic_vector (11 downto 0);
    signal branch3OrC_uid94_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal branch3OrC_uid94_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal branch3OrC_uid94_fpLogE1pxTest_q_i : std_logic_vector(0 downto 0);
    signal branch3OrC_uid94_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal o2_uid97_fpLogE1pxTest_q : std_logic_vector (1 downto 0);
    signal z2_uid100_fpLogE1pxTest_q : std_logic_vector (1 downto 0);
    signal wideZero_uid104_fpLogE1pxTest_q : std_logic_vector (66 downto 0);
    signal addTermOne_uid105_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal addTermOne_uid105_fpLogE1pxTest_q : std_logic_vector (66 downto 0);
    signal finalSumOneComp_uid112_fpLogE1pxTest_a : std_logic_vector(118 downto 0);
    signal finalSumOneComp_uid112_fpLogE1pxTest_b : std_logic_vector(118 downto 0);
    signal finalSumOneComp_uid112_fpLogE1pxTest_q_i : std_logic_vector(118 downto 0);
    signal finalSumOneComp_uid112_fpLogE1pxTest_q : std_logic_vector(118 downto 0);
    signal cstMSBFinalSumPBias_uid116_fpLogE1pxTest_q : std_logic_vector (11 downto 0);
    signal expRExt_uid121_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal expRExt_uid121_fpLogE1pxTest_q : std_logic_vector (12 downto 0);
    signal excRInf0_uid134_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal excRInf0_uid134_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal excRInf0_uid134_fpLogE1pxTest_q_i : std_logic_vector(0 downto 0);
    signal excRInf0_uid134_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal posInf_uid136_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal posInf_uid136_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal posInf_uid136_fpLogE1pxTest_q_i : std_logic_vector(0 downto 0);
    signal posInf_uid136_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal negInf_uid138_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal negInf_uid138_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal negInf_uid138_fpLogE1pxTest_q_i : std_logic_vector(0 downto 0);
    signal negInf_uid138_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal excRNaN0_uid139_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal excRNaN0_uid139_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal excRNaN0_uid139_fpLogE1pxTest_q_i : std_logic_vector(0 downto 0);
    signal excRNaN0_uid139_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal excREnc_uid144_fpLogE1pxTest_q : std_logic_vector(1 downto 0);
    signal oneFracRPostExc2_uid145_fpLogE1pxTest_q : std_logic_vector (51 downto 0);
    signal rightShiftStage0Idx1Pad16_uid157_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (15 downto 0);
    signal rightShiftStage0Idx2Pad32_uid160_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (31 downto 0);
    signal rightShiftStage0Idx3Pad48_uid163_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (47 downto 0);
    signal rightShiftStage1Idx1Pad4_uid168_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (3 downto 0);
    signal rightShiftStage1Idx2Pad8_uid171_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal rightShiftStage1Idx3Pad12_uid174_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (11 downto 0);
    signal rightShiftStage2Idx3Pad3_uid185_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (2 downto 0);
    signal mO_uid193_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (10 downto 0);
    signal vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q_i : std_logic_vector(0 downto 0);
    signal vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid218_leadingZeros_uid44_fpLogE1pxTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid218_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid218_leadingZeros_uid44_fpLogE1pxTest_q_i : std_logic_vector(0 downto 0);
    signal vCount_uid218_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal p1_uid264_constMult_q : std_logic_vector(68 downto 0);
    signal rndBit_uid314_natLogPolyEval_q : std_logic_vector (2 downto 0);
    signal zs_uid319_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (63 downto 0);
    signal mO_uid322_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal vCount_uid341_countZ_uid114_fpLogE1pxTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid341_countZ_uid114_fpLogE1pxTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid341_countZ_uid114_fpLogE1pxTest_q_i : std_logic_vector(0 downto 0);
    signal vCount_uid341_countZ_uid114_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid353_countZ_uid114_fpLogE1pxTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid353_countZ_uid114_fpLogE1pxTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid353_countZ_uid114_fpLogE1pxTest_q_i : std_logic_vector(0 downto 0);
    signal vCount_uid353_countZ_uid114_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx3Pad96_uid369_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (95 downto 0);
    signal leftShiftStage1Idx3Pad24_uid380_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (23 downto 0);
    signal leftShiftStage2Idx3Pad6_uid391_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (5 downto 0);
    signal prodXY_uid402_pT1_uid295_natLogPolyEval_a : std_logic_vector (16 downto 0);
    signal prodXY_uid402_pT1_uid295_natLogPolyEval_b : std_logic_vector (16 downto 0);
    signal prodXY_uid402_pT1_uid295_natLogPolyEval_s1 : std_logic_vector (33 downto 0);
    signal prodXY_uid402_pT1_uid295_natLogPolyEval_pr : SIGNED (34 downto 0);
    signal prodXY_uid402_pT1_uid295_natLogPolyEval_q : std_logic_vector (33 downto 0);
    signal topProd_uid407_pT2_uid301_natLogPolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid407_pT2_uid301_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid407_pT2_uid301_natLogPolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid407_pT2_uid301_natLogPolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid407_pT2_uid301_natLogPolyEval_q : std_logic_vector (53 downto 0);
    signal sm0_uid410_pT2_uid301_natLogPolyEval_a : std_logic_vector (2 downto 0);
    signal sm0_uid410_pT2_uid301_natLogPolyEval_b : std_logic_vector (3 downto 0);
    signal sm0_uid410_pT2_uid301_natLogPolyEval_s1 : std_logic_vector (6 downto 0);
    signal sm0_uid410_pT2_uid301_natLogPolyEval_pr : UNSIGNED (6 downto 0);
    attribute multstyle : string;
    attribute multstyle of sm0_uid410_pT2_uid301_natLogPolyEval_pr: signal is "logic";
    signal sm0_uid410_pT2_uid301_natLogPolyEval_q : std_logic_vector (6 downto 0);
    signal sm1_uid413_pT2_uid301_natLogPolyEval_a : std_logic_vector (5 downto 0);
    signal sm1_uid413_pT2_uid301_natLogPolyEval_b : std_logic_vector (0 downto 0);
    signal sm1_uid413_pT2_uid301_natLogPolyEval_s1 : std_logic_vector (6 downto 0);
    signal sm1_uid413_pT2_uid301_natLogPolyEval_pr : SIGNED (7 downto 0);
    attribute multstyle of sm1_uid413_pT2_uid301_natLogPolyEval_pr: signal is "logic";
    signal sm1_uid413_pT2_uid301_natLogPolyEval_q : std_logic_vector (6 downto 0);
    signal topProd_uid420_pT3_uid307_natLogPolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid420_pT3_uid307_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid420_pT3_uid307_natLogPolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid420_pT3_uid307_natLogPolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid420_pT3_uid307_natLogPolyEval_q : std_logic_vector (53 downto 0);
    signal topProd_uid437_pT4_uid313_natLogPolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid437_pT4_uid313_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid437_pT4_uid313_natLogPolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid437_pT4_uid313_natLogPolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid437_pT4_uid313_natLogPolyEval_q : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b0_a : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b0_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b0_s1 : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b0_pr : UNSIGNED (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b0_q : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b0_a : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b0_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b0_s1 : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b0_pr : SIGNED (54 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b0_q : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b1_a : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b1_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b1_s1 : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b1_pr : UNSIGNED (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b1_q : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b1_a : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b1_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b1_s1 : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b1_pr : SIGNED (54 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b1_q : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b2_a : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b2_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b2_s1 : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b2_pr : SIGNED (54 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a0_b2_q : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b2_a : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b2_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b2_s1 : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b2_pr : SIGNED (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a1_b2_q : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_result_add_0_0_a : std_logic_vector(84 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_result_add_0_0_b : std_logic_vector(84 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_result_add_0_0_o : std_logic_vector (84 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_result_add_0_0_q : std_logic_vector (83 downto 0);
    signal memoryC0_uid269_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid269_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC0_uid269_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC0_uid269_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC0_uid269_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC0_uid269_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC0_uid270_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid270_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC0_uid270_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC0_uid270_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC0_uid270_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC0_uid270_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC0_uid271_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid271_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC0_uid271_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC0_uid271_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC0_uid271_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC0_uid271_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC0_uid272_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid272_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC0_uid272_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC0_uid272_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC0_uid272_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC0_uid272_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC0_uid273_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid273_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC0_uid273_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC0_uid273_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC0_uid273_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC0_uid273_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC0_uid274_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid274_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC0_uid274_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC0_uid274_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC0_uid274_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC0_uid274_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC1_uid276_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid276_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC1_uid276_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC1_uid276_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC1_uid276_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC1_uid276_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC1_uid277_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid277_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC1_uid277_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC1_uid277_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC1_uid277_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC1_uid277_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC1_uid278_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid278_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC1_uid278_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC1_uid278_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC1_uid278_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC1_uid278_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC1_uid279_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid279_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC1_uid279_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC1_uid279_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC1_uid279_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC1_uid279_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC1_uid280_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid280_natLogTabGen_lutmem_ia : std_logic_vector (7 downto 0);
    signal memoryC1_uid280_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC1_uid280_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC1_uid280_natLogTabGen_lutmem_iq : std_logic_vector (7 downto 0);
    signal memoryC1_uid280_natLogTabGen_lutmem_q : std_logic_vector (7 downto 0);
    signal memoryC2_uid282_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid282_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC2_uid282_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC2_uid282_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC2_uid282_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC2_uid282_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC2_uid283_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid283_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC2_uid283_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC2_uid283_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC2_uid283_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC2_uid283_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC2_uid284_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid284_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC2_uid284_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC2_uid284_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC2_uid284_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC2_uid284_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC2_uid285_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid285_natLogTabGen_lutmem_ia : std_logic_vector (7 downto 0);
    signal memoryC2_uid285_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC2_uid285_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC2_uid285_natLogTabGen_lutmem_iq : std_logic_vector (7 downto 0);
    signal memoryC2_uid285_natLogTabGen_lutmem_q : std_logic_vector (7 downto 0);
    signal memoryC3_uid287_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC3_uid287_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC3_uid287_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC3_uid287_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC3_uid287_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC3_uid287_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC3_uid288_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC3_uid288_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC3_uid288_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC3_uid288_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC3_uid288_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC3_uid288_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC3_uid289_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC3_uid289_natLogTabGen_lutmem_ia : std_logic_vector (7 downto 0);
    signal memoryC3_uid289_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC3_uid289_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC3_uid289_natLogTabGen_lutmem_iq : std_logic_vector (7 downto 0);
    signal memoryC3_uid289_natLogTabGen_lutmem_q : std_logic_vector (7 downto 0);
    signal memoryC4_uid291_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC4_uid291_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC4_uid291_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC4_uid291_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC4_uid291_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC4_uid291_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC4_uid292_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC4_uid292_natLogTabGen_lutmem_ia : std_logic_vector (6 downto 0);
    signal memoryC4_uid292_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC4_uid292_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC4_uid292_natLogTabGen_lutmem_iq : std_logic_vector (6 downto 0);
    signal memoryC4_uid292_natLogTabGen_lutmem_q : std_logic_vector (6 downto 0);
    type multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_a_type is array(0 to 1) of UNSIGNED(17 downto 0);
    signal multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_a : multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_a_type;
    attribute preserve : boolean;
    attribute preserve of multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_a : signal is true;
    type multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_c_type is array(0 to 1) of SIGNED(17 downto 0);
    signal multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_c : multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_c_type;
    attribute preserve of multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_c : signal is true;
    type multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_l_type is array(0 to 1) of SIGNED(18 downto 0);
    signal multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_l : multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_l_type;
    type multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_p_type is array(0 to 1) of SIGNED(36 downto 0);
    signal multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_p : multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_p_type;
    type multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_w_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_w : multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_w_type;
    type multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_x_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_x : multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_x_type;
    type multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_y_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_y : multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_y_type;
    type multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_s_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_s : multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_s_type;
    signal multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_s0 : std_logic_vector(36 downto 0);
    signal multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_q : std_logic_vector (36 downto 0);
    type multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_a_type is array(0 to 1) of UNSIGNED(26 downto 0);
    signal multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_a : multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_a_type;
    attribute preserve of multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_a : signal is true;
    type multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_c_type is array(0 to 1) of SIGNED(26 downto 0);
    signal multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_c : multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_c_type;
    attribute preserve of multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_c : signal is true;
    type multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_l_type is array(0 to 1) of SIGNED(27 downto 0);
    signal multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_l : multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_l_type;
    type multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_p_type is array(0 to 1) of SIGNED(54 downto 0);
    signal multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_p : multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_p_type;
    type multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_w_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_w : multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_w_type;
    type multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_x_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_x : multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_x_type;
    type multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_y_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_y : multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_y_type;
    type multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_s_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_s : multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_s_type;
    signal multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_s0 : std_logic_vector(54 downto 0);
    signal multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_q : std_logic_vector (54 downto 0);
    signal reg_exc_N_uid26_fpLogE1pxTest_0_to_excRNaN_uid140_fpLogE1pxTest_1_q : std_logic_vector (0 downto 0);
    signal reg_expXIsZero_uid19_fpLogE1pxTest_0_to_concExc_uid143_fpLogE1pxTest_0_q : std_logic_vector (0 downto 0);
    signal reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q : std_logic_vector (3 downto 0);
    signal reg_addrMask_uid51_fpLogE1pxTest_0_to_maskIncrementTable_uid52_fpLogE1pxTest_0_q : std_logic_vector (5 downto 0);
    signal reg_oFracX_uid32_fpLogE1pxTest_0_to_oPlusOFracX_uid53_fpLogE1pxTest_0_q : std_logic_vector (52 downto 0);
    signal reg_msbUoPlusOFracX_uid54_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_1_q : std_logic_vector (0 downto 0);
    signal reg_join_uid58_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_2_q : std_logic_vector (52 downto 0);
    signal reg_oPlusOFracXNormHigh_uid59_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_3_q : std_logic_vector (52 downto 0);
    signal reg_rightShiftStageSel5Dto4_uid165_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_2_q : std_logic_vector (105 downto 0);
    signal reg_rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_2_q : std_logic_vector (105 downto 0);
    signal reg_pad_o_uid12_uid40_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_0_q : std_logic_vector (105 downto 0);
    signal reg_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_1_q : std_logic_vector (105 downto 0);
    signal reg_rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_1_q : std_logic_vector (31 downto 0);
    signal reg_cStage_uid195_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_3_q : std_logic_vector (31 downto 0);
    signal reg_rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_1_q : std_logic_vector (15 downto 0);
    signal reg_vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_3_q : std_logic_vector (15 downto 0);
    signal reg_rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_2_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_2_q : std_logic_vector (1 downto 0);
    signal reg_vStage_uid219_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_3_q : std_logic_vector (1 downto 0);
    signal reg_vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_2_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_4_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_5_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid248_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q : std_logic_vector (104 downto 0);
    signal reg_leftShiftStage1Idx1_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_3_q : std_logic_vector (104 downto 0);
    signal reg_leftShiftStage1Idx2_uid244_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_4_q : std_logic_vector (104 downto 0);
    signal reg_leftShiftStage1Idx3_uid247_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_5_q : std_logic_vector (104 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q : std_logic_vector (104 downto 0);
    signal reg_fracXz_uid82_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_2_q : std_logic_vector (52 downto 0);
    signal reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q : std_logic_vector (52 downto 0);
    signal reg_fracXBranch4Red_uid80_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_5_q : std_logic_vector (52 downto 0);
    signal reg_c_uid87_fpLogE1pxTest_0_to_addr_uid90_fpLogE1pxTest_1_q : std_logic_vector (0 downto 0);
    signal reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q : std_logic_vector (10 downto 0);
    signal reg_memoryC0_uid269_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_0_q : std_logic_vector (9 downto 0);
    signal reg_memoryC0_uid270_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_1_q : std_logic_vector (9 downto 0);
    signal reg_memoryC0_uid271_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_2_q : std_logic_vector (9 downto 0);
    signal reg_memoryC0_uid272_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_3_q : std_logic_vector (9 downto 0);
    signal reg_memoryC0_uid273_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_4_q : std_logic_vector (9 downto 0);
    signal reg_memoryC0_uid274_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_5_q : std_logic_vector (9 downto 0);
    signal reg_memoryC1_uid276_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_0_q : std_logic_vector (9 downto 0);
    signal reg_memoryC1_uid277_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_1_q : std_logic_vector (9 downto 0);
    signal reg_memoryC1_uid278_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_2_q : std_logic_vector (9 downto 0);
    signal reg_memoryC1_uid279_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_3_q : std_logic_vector (9 downto 0);
    signal reg_memoryC1_uid280_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_4_q : std_logic_vector (7 downto 0);
    signal reg_memoryC2_uid282_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_0_q : std_logic_vector (9 downto 0);
    signal reg_memoryC2_uid283_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_1_q : std_logic_vector (9 downto 0);
    signal reg_memoryC2_uid284_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_2_q : std_logic_vector (9 downto 0);
    signal reg_memoryC2_uid285_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_3_q : std_logic_vector (7 downto 0);
    signal reg_memoryC4_uid291_natLogTabGen_lutmem_0_to_os_uid293_natLogTabGen_0_q : std_logic_vector (9 downto 0);
    signal reg_memoryC4_uid292_natLogTabGen_lutmem_0_to_os_uid293_natLogTabGen_1_q : std_logic_vector (6 downto 0);
    signal reg_yT1_uid294_natLogPolyEval_0_to_prodXY_uid402_pT1_uid295_natLogPolyEval_0_q : std_logic_vector (16 downto 0);
    signal reg_os_uid293_natLogTabGen_0_to_prodXY_uid402_pT1_uid295_natLogPolyEval_1_q : std_logic_vector (16 downto 0);
    signal reg_memoryC3_uid287_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_0_q : std_logic_vector (9 downto 0);
    signal reg_memoryC3_uid288_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_1_q : std_logic_vector (9 downto 0);
    signal reg_memoryC3_uid289_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_2_q : std_logic_vector (7 downto 0);
    signal reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_q : std_logic_vector (26 downto 0);
    signal reg_yTop27Bits_uid406_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_1_q : std_logic_vector (26 downto 0);
    signal reg_sSM0H_uid408_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_0_q : std_logic_vector (2 downto 0);
    signal reg_sSM0W_uid409_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_1_q : std_logic_vector (3 downto 0);
    signal reg_sSM1H_uid411_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_0_q : std_logic_vector (5 downto 0);
    signal reg_sSM1W_uid412_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_1_q : std_logic_vector (0 downto 0);
    signal reg_cIncludingRoundingBit_uid303_natLogPolyEval_0_to_ts2_uid304_natLogPolyEval_0_q : std_logic_vector (39 downto 0);
    signal reg_R_uid417_pT2_uid301_natLogPolyEval_0_to_ts2_uid304_natLogPolyEval_1_q : std_logic_vector (29 downto 0);
    signal reg_xTop18Bits_uid421_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_4_q : std_logic_vector (17 downto 0);
    signal reg_pad_yBottomBits_uid422_uid427_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_6_q : std_logic_vector (17 downto 0);
    signal reg_pad_xBottomBits_uid423_uid426_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_7_q : std_logic_vector (16 downto 0);
    signal reg_yTop18Bits_uid424_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_9_q : std_logic_vector (17 downto 0);
    signal reg_xTop27Bits_uid418_pT3_uid307_natLogPolyEval_0_to_topProd_uid420_pT3_uid307_natLogPolyEval_0_q : std_logic_vector (26 downto 0);
    signal reg_yTop27Bits_uid419_pT3_uid307_natLogPolyEval_0_to_topProd_uid420_pT3_uid307_natLogPolyEval_1_q : std_logic_vector (26 downto 0);
    signal reg_cIncludingRoundingBit_uid309_natLogPolyEval_0_to_ts3_uid310_natLogPolyEval_0_q : std_logic_vector (49 downto 0);
    signal reg_R_uid434_pT3_uid307_natLogPolyEval_0_to_ts3_uid310_natLogPolyEval_1_q : std_logic_vector (40 downto 0);
    signal reg_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_4_q : std_logic_vector (26 downto 0);
    signal reg_pad_yBottomBits_uid438_uid442_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_6_q : std_logic_vector (26 downto 0);
    signal reg_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_7_q : std_logic_vector (25 downto 0);
    signal reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_9_q : std_logic_vector (26 downto 0);
    signal reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_topProd_uid437_pT4_uid313_natLogPolyEval_1_q : std_logic_vector (26 downto 0);
    signal reg_cIncludingRoundingBit_uid315_natLogPolyEval_0_to_ts4_uid316_natLogPolyEval_0_q : std_logic_vector (62 downto 0);
    signal reg_R_uid449_pT4_uid313_natLogPolyEval_0_to_ts4_uid316_natLogPolyEval_1_q : std_logic_vector (51 downto 0);
    signal reg_postPEMul_uid103_fpLogE1pxTest_a_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_postPEMul_uid103_fpLogE1pxTest_b_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_1_q : std_logic_vector (26 downto 0);
    signal reg_postPEMul_uid103_fpLogE1pxTest_a_1_0_to_postPEMul_uid103_fpLogE1pxTest_a1_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_postPEMul_uid103_fpLogE1pxTest_b_1_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b1_1_q : std_logic_vector (26 downto 0);
    signal reg_postPEMul_uid103_fpLogE1pxTest_align_0_0_to_postPEMul_uid103_fpLogE1pxTest_result_add_0_0_0_q : std_logic_vector (53 downto 0);
    signal reg_postPEMul_uid103_fpLogE1pxTest_b_2_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b2_1_q : std_logic_vector (26 downto 0);
    signal reg_postPEMul_uid103_fpLogE1pxTest_align_2_0_to_postPEMul_uid103_fpLogE1pxTest_result_add_0_1_0_q : std_logic_vector (108 downto 0);
    signal reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_q : std_logic_vector (10 downto 0);
    signal reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q : std_logic_vector (10 downto 0);
    signal reg_expBran3Pre_uid46_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_5_q : std_logic_vector (10 downto 0);
    signal reg_xv1_uid263_constMult_0_to_p1_uid264_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv0_uid262_constMult_0_to_p0_uid265_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_sR_uid267_constMult_0_to_addTermOne_uid105_fpLogE1pxTest_2_q : std_logic_vector (66 downto 0);
    signal reg_highBBits_uid107_fpLogE1pxTest_0_to_sumAHighB_uid108_fpLogE1pxTest_1_q : std_logic_vector (58 downto 0);
    signal reg_lowRangeB_uid106_fpLogE1pxTest_0_to_finalSum_uid106_uid109_fpLogE1pxTest_0_q : std_logic_vector (50 downto 0);
    signal reg_rVStage_uid320_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid321_countZ_uid114_fpLogE1pxTest_1_q : std_logic_vector (63 downto 0);
    signal reg_rVStage_uid328_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid329_countZ_uid114_fpLogE1pxTest_1_q : std_logic_vector (31 downto 0);
    signal reg_vStage_uid330_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid332_countZ_uid114_fpLogE1pxTest_3_q : std_logic_vector (31 downto 0);
    signal reg_rVStage_uid334_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid335_countZ_uid114_fpLogE1pxTest_1_q : std_logic_vector (15 downto 0);
    signal reg_vStage_uid336_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid338_countZ_uid114_fpLogE1pxTest_3_q : std_logic_vector (15 downto 0);
    signal reg_rVStage_uid340_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid344_countZ_uid114_fpLogE1pxTest_2_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid342_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid344_countZ_uid114_fpLogE1pxTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid352_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid356_countZ_uid114_fpLogE1pxTest_2_q : std_logic_vector (1 downto 0);
    signal reg_vStage_uid354_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid356_countZ_uid114_fpLogE1pxTest_3_q : std_logic_vector (1 downto 0);
    signal reg_vCount_uid347_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_2_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid335_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_4_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid329_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_5_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid321_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_6_q : std_logic_vector (0 downto 0);
    signal reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q : std_logic_vector (119 downto 0);
    signal reg_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_3_q : std_logic_vector (119 downto 0);
    signal reg_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_4_q : std_logic_vector (119 downto 0);
    signal reg_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_5_q : std_logic_vector (119 downto 0);
    signal reg_leftShiftStageSel4Dto3_uid383_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_2_q : std_logic_vector (119 downto 0);
    signal reg_leftShiftStage1Idx1_uid376_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_3_q : std_logic_vector (119 downto 0);
    signal reg_leftShiftStage1Idx2_uid379_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_4_q : std_logic_vector (119 downto 0);
    signal reg_leftShiftStage1Idx3_uid382_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_5_q : std_logic_vector (119 downto 0);
    signal reg_leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_2_q : std_logic_vector (119 downto 0);
    signal reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q : std_logic_vector (5 downto 0);
    signal reg_expRExt0_uid117_fpLogE1pxTest_0_to_expRExt1_uid119_fpLogE1pxTest_0_q : std_logic_vector (12 downto 0);
    signal reg_expFracConc_uid123_fpLogE1pxTest_0_to_expFracPostRnd_uid124_fpLogE1pxTest_0_q : std_logic_vector (65 downto 0);
    signal reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q : std_logic_vector (0 downto 0);
    signal reg_fracR0_uid125_fpLogE1pxTest_0_to_fracR_uid126_fpLogE1pxTest_2_q : std_logic_vector (51 downto 0);
    signal reg_expR_uid127_fpLogE1pxTest_0_to_expR_uid128_fpLogE1pxTest_2_q : std_logic_vector (10 downto 0);
    signal ld_xIn_a_to_frac_uid22_fpLogE1pxTest_a_q : std_logic_vector (63 downto 0);
    signal ld_expXIsMax_uid21_fpLogE1pxTest_q_to_exc_I_uid24_fpLogE1pxTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid19_fpLogE1pxTest_q_to_InvExpXIsZero_uid29_fpLogE1pxTest_a_q : std_logic_vector (0 downto 0);
    signal ld_branEnc_uid77_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_b_q : std_logic_vector (1 downto 0);
    signal ld_branch4_uid75_fpLogE1pxTest_q_to_c_uid87_fpLogE1pxTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsMo_uid86_fpLogE1pxTest_c_to_c_uid87_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_branch3OrC_uid94_fpLogE1pxTest_q_to_addTermOne_uid105_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_FullSumAB118_uid110_fpLogE1pxTest_b_to_finalSumAbs_uid113_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_expRExt0_uid117_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_c_q : std_logic_vector (12 downto 0);
    signal ld_xM1_uid131_fpLogE1pxTest_q_to_excRInf0_uid134_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_branch11_uid64_fpLogE1pxTest_q_to_posInf_uid136_fpLogE1pxTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpLogE1pxTest_b_to_negInf_uid138_fpLogE1pxTest_a_q : std_logic_vector (0 downto 0);
    signal ld_xLTM1_uid133_fpLogE1pxTest_c_to_excRNaN0_uid139_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpLogE1pxTest_b_to_signRFull_uid142_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage0105dto4_uid167_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_a_q : std_logic_vector (101 downto 0);
    signal ld_RightShiftStage0105dto8_uid170_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_a_q : std_logic_vector (97 downto 0);
    signal ld_RightShiftStage0105dto12_uid173_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_a_q : std_logic_vector (93 downto 0);
    signal ld_RightShiftStage1105dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest_a_q : std_logic_vector (104 downto 0);
    signal ld_RightShiftStage1105dto2_uid181_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx2_uid183_fracXRSExt_uid36_fpLogE1pxTest_a_q : std_logic_vector (103 downto 0);
    signal ld_RightShiftStage1105dto3_uid184_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx3_uid186_fracXRSExt_uid36_fpLogE1pxTest_a_q : std_logic_vector (102 downto 0);
    signal ld_reg_rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_1_q_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_b_q : std_logic_vector (1 downto 0);
    signal ld_vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_d_q : std_logic_vector (0 downto 0);
    signal ld_reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_4_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_e_q : std_logic_vector (0 downto 0);
    signal ld_reg_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_5_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_f_q : std_logic_vector (0 downto 0);
    signal ld_LeftShiftStage1103dto0_uid251_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid252_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q : std_logic_vector (103 downto 0);
    signal ld_LeftShiftStage1102dto0_uid254_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid255_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q : std_logic_vector (102 downto 0);
    signal ld_LeftShiftStage1101dto0_uid257_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid258_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q : std_logic_vector (101 downto 0);
    signal ld_reg_leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q : std_logic_vector (1 downto 0);
    signal ld_reg_xv0_uid262_constMult_0_to_p0_uid265_constMult_0_q_to_p0_uid265_constMult_a_q : std_logic_vector (5 downto 0);
    signal ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_cStage_uid324_countZ_uid114_fpLogE1pxTest_b_q : std_logic_vector (55 downto 0);
    signal ld_rVStage_uid320_countZ_uid114_fpLogE1pxTest_b_to_vStagei_uid326_countZ_uid114_fpLogE1pxTest_c_q : std_logic_vector (63 downto 0);
    signal ld_vCount_uid341_countZ_uid114_fpLogE1pxTest_q_to_r_uid360_countZ_uid114_fpLogE1pxTest_d_q : std_logic_vector (0 downto 0);
    signal ld_reg_vCount_uid321_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_6_q_to_r_uid360_countZ_uid114_fpLogE1pxTest_g_q : std_logic_vector (0 downto 0);
    signal ld_LeftShiftStage1117dto0_uid386_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid387_normVal_uid115_fpLogE1pxTest_b_q : std_logic_vector (117 downto 0);
    signal ld_LeftShiftStage1115dto0_uid389_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid390_normVal_uid115_fpLogE1pxTest_b_q : std_logic_vector (115 downto 0);
    signal ld_LeftShiftStage1113dto0_uid392_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid393_normVal_uid115_fpLogE1pxTest_b_q : std_logic_vector (113 downto 0);
    signal ld_reg_leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_1_q_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_b_q : std_logic_vector (1 downto 0);
    signal ld_leftShiftStageSel0Dto0_uid399_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_sSM1W_uid412_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_1_q_to_sm1_uid413_pT2_uid301_natLogPolyEval_b_q : std_logic_vector (0 downto 0);
    signal ld_yBottomBits_uid438_pT4_uid313_natLogPolyEval_b_to_spad_yBottomBits_uid438_uid440_pT4_uid313_natLogPolyEval_a_q : std_logic_vector (22 downto 0);
    signal ld_postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_q_to_postPEMul_uid103_fpLogE1pxTest_align_1_a_q : std_logic_vector (55 downto 0);
    signal ld_postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_q_to_postPEMul_uid103_fpLogE1pxTest_align_2_a_q : std_logic_vector (54 downto 0);
    signal ld_postPEMul_uid103_fpLogE1pxTest_a1_b2_q_to_postPEMul_uid103_fpLogE1pxTest_align_3_a_q : std_logic_vector (53 downto 0);
    signal ld_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_b_to_reg_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_sSM0W_uid409_pT2_uid301_natLogPolyEval_b_to_reg_sSM0W_uid409_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_1_a_q : std_logic_vector (3 downto 0);
    signal ld_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_b_to_reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_topProd_uid437_pT4_uid313_natLogPolyEval_1_a_q : std_logic_vector (26 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_a_q : std_logic_vector (10 downto 0);
    signal ld_vCount_uid335_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid335_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_4_a_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid329_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid329_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_5_a_q : std_logic_vector (0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_inputreg_q : std_logic_vector (106 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_reset0 : std_logic;
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_ia : std_logic_vector (106 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_iq : std_logic_vector (106 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_q : std_logic_vector (106 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_sticky_ena_q : signal is true;
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_inputreg_q : std_logic_vector (3 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_reset0 : std_logic;
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_ia : std_logic_vector (3 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_iq : std_logic_vector (3 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_q : std_logic_vector (3 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_sticky_ena_q : signal is true;
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_inputreg_q : std_logic_vector (11 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_reset0 : std_logic;
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_ia : std_logic_vector (11 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_iq : std_logic_vector (11 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_q : std_logic_vector (11 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_eq : std_logic;
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_sticky_ena_q : signal is true;
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_inputreg_q : std_logic_vector (51 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_reset0 : std_logic;
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_ia : std_logic_vector (51 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_iq : std_logic_vector (51 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_q : std_logic_vector (51 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_eq : std_logic;
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena_q : signal is true;
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_inputreg_q : std_logic_vector (52 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_reset0 : std_logic;
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_ia : std_logic_vector (52 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_iq : std_logic_vector (52 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_q : std_logic_vector (52 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena_q : signal is true;
    signal ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_inputreg_q : std_logic_vector (52 downto 0);
    signal ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_reset0 : std_logic;
    signal ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_ia : std_logic_vector (52 downto 0);
    signal ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_iq : std_logic_vector (52 downto 0);
    signal ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_q : std_logic_vector (52 downto 0);
    signal ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_sticky_ena_q : signal is true;
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_inputreg_q : std_logic_vector (11 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_reset0 : std_logic;
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_ia : std_logic_vector (11 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_iq : std_logic_vector (11 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_q : std_logic_vector (11 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_eq : std_logic;
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena_q : signal is true;
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_inputreg_q : std_logic_vector (52 downto 0);
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_reset0 : std_logic;
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_ia : std_logic_vector (52 downto 0);
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_iq : std_logic_vector (52 downto 0);
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_q : std_logic_vector (52 downto 0);
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_sticky_ena_q : signal is true;
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_reset0 : std_logic;
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_sticky_ena_q : signal is true;
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_reset0 : std_logic;
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_eq : std_logic;
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_sticky_ena_q : signal is true;
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_reset0 : std_logic;
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_ia : std_logic_vector (51 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_iq : std_logic_vector (51 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_q : std_logic_vector (51 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_inputreg_q : std_logic_vector (51 downto 0);
    signal ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_reset0 : std_logic;
    signal ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_ia : std_logic_vector (51 downto 0);
    signal ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_iq : std_logic_vector (51 downto 0);
    signal ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_q : std_logic_vector (51 downto 0);
    signal ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_sticky_ena_q : signal is true;
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_inputreg_q : std_logic_vector (5 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_reset0 : std_logic;
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_ia : std_logic_vector (5 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_iq : std_logic_vector (5 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_q : std_logic_vector (5 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_sticky_ena_q : signal is true;
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_inputreg_q : std_logic_vector (6 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_reset0 : std_logic;
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_eq : std_logic;
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena_q : signal is true;
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_reset0 : std_logic;
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_eq : std_logic;
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena_q : signal is true;
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_reset0 : std_logic;
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_ia : std_logic_vector (51 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_iq : std_logic_vector (51 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_q : std_logic_vector (51 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_inputreg_q : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_reset0 : std_logic;
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_ia : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_iq : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_q : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_eq : std_logic;
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena_q : signal is true;
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_reset0 : std_logic;
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_eq : std_logic;
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_sticky_ena_q : signal is true;
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_reset0 : std_logic;
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_eq : std_logic;
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena_q : signal is true;
    signal ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_inputreg_q : std_logic_vector (27 downto 0);
    signal ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_ia : std_logic_vector (27 downto 0);
    signal ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_iq : std_logic_vector (27 downto 0);
    signal ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_q : std_logic_vector (27 downto 0);
    signal ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_sticky_ena_q : signal is true;
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_inputreg_q : std_logic_vector (37 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_reset0 : std_logic;
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_ia : std_logic_vector (37 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_iq : std_logic_vector (37 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_q : std_logic_vector (37 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_eq : std_logic;
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_sticky_ena_q : signal is true;
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_inputreg_q : std_logic_vector (42 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_ia : std_logic_vector (42 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_iq : std_logic_vector (42 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_q : std_logic_vector (42 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_sticky_ena_q : signal is true;
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_inputreg_q : std_logic_vector (47 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_reset0 : std_logic;
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_ia : std_logic_vector (47 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_iq : std_logic_vector (47 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_q : std_logic_vector (47 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_eq : std_logic;
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_sticky_ena_q : signal is true;
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_inputreg_q : std_logic_vector (59 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_reset0 : std_logic;
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_ia : std_logic_vector (59 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_iq : std_logic_vector (59 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_q : std_logic_vector (59 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_eq : std_logic;
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_sticky_ena_q : signal is true;
    signal ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_inputreg_q : std_logic_vector (87 downto 0);
    signal ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0 : std_logic;
    signal ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia : std_logic_vector (87 downto 0);
    signal ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq : std_logic_vector (87 downto 0);
    signal ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_q : std_logic_vector (87 downto 0);
    signal ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q : signal is true;
    signal ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0 : std_logic;
    signal ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia : std_logic_vector (55 downto 0);
    signal ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq : std_logic_vector (55 downto 0);
    signal ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_q : std_logic_vector (55 downto 0);
    signal ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q : signal is true;
    signal ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0 : std_logic;
    signal ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q : signal is true;
    signal ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_inputreg_q : std_logic_vector (119 downto 0);
    signal ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_reset0 : std_logic;
    signal ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_ia : std_logic_vector (119 downto 0);
    signal ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_iq : std_logic_vector (119 downto 0);
    signal ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_q : std_logic_vector (119 downto 0);
    signal ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_sticky_ena_q : signal is true;
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_ia : std_logic_vector (42 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_iq : std_logic_vector (42 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_q : std_logic_vector (42 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_sticky_ena_q : signal is true;
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_inputreg_q : std_logic_vector (15 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_reset0 : std_logic;
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_ia : std_logic_vector (15 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_iq : std_logic_vector (15 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_q : std_logic_vector (15 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_eq : std_logic;
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_sticky_ena_q : signal is true;
    signal ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_inputreg_q : std_logic_vector (26 downto 0);
    signal ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_ia : std_logic_vector (26 downto 0);
    signal ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_iq : std_logic_vector (26 downto 0);
    signal ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_q : std_logic_vector (26 downto 0);
    signal ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_sticky_ena_q : signal is true;
    signal ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_reset0 : std_logic;
    signal ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_ia : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_iq : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_q : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_sticky_ena_q : signal is true;
    signal pad_o_uid12_uid40_fpLogE1pxTest_q : std_logic_vector (105 downto 0);
    signal fracXz_uid82_fpLogE1pxTest_q : std_logic_vector (52 downto 0);
    signal pad_sm0_uid410_uid414_pT2_uid301_natLogPolyEval_q : std_logic_vector (26 downto 0);
    signal pad_sm1_uid413_uid415_pT2_uid301_natLogPolyEval_q : std_logic_vector (26 downto 0);
    signal spad_yBottomBits_uid438_uid440_pT4_uid313_natLogPolyEval_q : std_logic_vector (23 downto 0);
    signal pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_q : std_logic_vector (25 downto 0);
    signal pad_yBottomBits_uid438_uid442_pT4_uid313_natLogPolyEval_q : std_logic_vector (26 downto 0);
    signal rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (105 downto 0);
    signal leftShiftStage2Idx1_uid252_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (104 downto 0);
    signal InvExpXIsZero_uid29_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid29_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal expFracPostRnd_uid124_fpLogE1pxTest_a : std_logic_vector(66 downto 0);
    signal expFracPostRnd_uid124_fpLogE1pxTest_b : std_logic_vector(66 downto 0);
    signal expFracPostRnd_uid124_fpLogE1pxTest_o : std_logic_vector (66 downto 0);
    signal expFracPostRnd_uid124_fpLogE1pxTest_q : std_logic_vector (66 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_a : std_logic_vector(56 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_b : std_logic_vector(56 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_o : std_logic_vector (56 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_q : std_logic_vector (55 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_a : std_logic_vector(54 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_b : std_logic_vector(54 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_o : std_logic_vector (54 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_q : std_logic_vector (54 downto 0);
    signal mO_uid130_fpLogE1pxTest_q : std_logic_vector (63 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal expX_uid6_fpLogE1pxTest_in : std_logic_vector (62 downto 0);
    signal expX_uid6_fpLogE1pxTest_b : std_logic_vector (10 downto 0);
    signal signX_uid7_fpLogE1pxTest_in : std_logic_vector (63 downto 0);
    signal signX_uid7_fpLogE1pxTest_b : std_logic_vector (0 downto 0);
    signal xM1_uid131_fpLogE1pxTest_a : std_logic_vector(63 downto 0);
    signal xM1_uid131_fpLogE1pxTest_b : std_logic_vector(63 downto 0);
    signal xM1_uid131_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal xLTM1_uid133_fpLogE1pxTest_a : std_logic_vector(66 downto 0);
    signal xLTM1_uid133_fpLogE1pxTest_b : std_logic_vector(66 downto 0);
    signal xLTM1_uid133_fpLogE1pxTest_o : std_logic_vector (66 downto 0);
    signal xLTM1_uid133_fpLogE1pxTest_cin : std_logic_vector (0 downto 0);
    signal xLTM1_uid133_fpLogE1pxTest_c : std_logic_vector (0 downto 0);
    signal expXIsZero_uid19_fpLogE1pxTest_a : std_logic_vector(10 downto 0);
    signal expXIsZero_uid19_fpLogE1pxTest_b : std_logic_vector(10 downto 0);
    signal expXIsZero_uid19_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid21_fpLogE1pxTest_a : std_logic_vector(10 downto 0);
    signal expXIsMax_uid21_fpLogE1pxTest_b : std_logic_vector(10 downto 0);
    signal expXIsMax_uid21_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal shifterAddrExt_uid34_fpLogE1pxTest_a : std_logic_vector(11 downto 0);
    signal shifterAddrExt_uid34_fpLogE1pxTest_b : std_logic_vector(11 downto 0);
    signal shifterAddrExt_uid34_fpLogE1pxTest_o : std_logic_vector (11 downto 0);
    signal shifterAddrExt_uid34_fpLogE1pxTest_q : std_logic_vector (11 downto 0);
    signal oMfracXRSExt_uid40_fpLogE1pxTest_a : std_logic_vector(106 downto 0);
    signal oMfracXRSExt_uid40_fpLogE1pxTest_b : std_logic_vector(106 downto 0);
    signal oMfracXRSExt_uid40_fpLogE1pxTest_o : std_logic_vector (106 downto 0);
    signal oMfracXRSExt_uid40_fpLogE1pxTest_q : std_logic_vector (106 downto 0);
    signal addrMaskExt_uid50_fpLogE1pxTest_a : std_logic_vector(11 downto 0);
    signal addrMaskExt_uid50_fpLogE1pxTest_b : std_logic_vector(11 downto 0);
    signal addrMaskExt_uid50_fpLogE1pxTest_o : std_logic_vector (11 downto 0);
    signal addrMaskExt_uid50_fpLogE1pxTest_q : std_logic_vector (11 downto 0);
    signal oPlusOFracX_uid53_fpLogE1pxTest_a : std_logic_vector(53 downto 0);
    signal oPlusOFracX_uid53_fpLogE1pxTest_b : std_logic_vector(53 downto 0);
    signal oPlusOFracX_uid53_fpLogE1pxTest_o : std_logic_vector (53 downto 0);
    signal oPlusOFracX_uid53_fpLogE1pxTest_q : std_logic_vector (53 downto 0);
    signal resIsX_uid62_fpLogE1pxTest_a : std_logic_vector(13 downto 0);
    signal resIsX_uid62_fpLogE1pxTest_b : std_logic_vector(13 downto 0);
    signal resIsX_uid62_fpLogE1pxTest_o : std_logic_vector (13 downto 0);
    signal resIsX_uid62_fpLogE1pxTest_cin : std_logic_vector (0 downto 0);
    signal resIsX_uid62_fpLogE1pxTest_c : std_logic_vector (0 downto 0);
    signal branch12_uid63_fpLogE1pxTest_a : std_logic_vector(13 downto 0);
    signal branch12_uid63_fpLogE1pxTest_b : std_logic_vector(13 downto 0);
    signal branch12_uid63_fpLogE1pxTest_o : std_logic_vector (13 downto 0);
    signal branch12_uid63_fpLogE1pxTest_cin : std_logic_vector (0 downto 0);
    signal branch12_uid63_fpLogE1pxTest_c : std_logic_vector (0 downto 0);
    signal branch12_uid63_fpLogE1pxTest_n : std_logic_vector (0 downto 0);
    signal branch22_uid66_fpLogE1pxTest_a : std_logic_vector(13 downto 0);
    signal branch22_uid66_fpLogE1pxTest_b : std_logic_vector(13 downto 0);
    signal branch22_uid66_fpLogE1pxTest_o : std_logic_vector (13 downto 0);
    signal branch22_uid66_fpLogE1pxTest_cin : std_logic_vector (0 downto 0);
    signal branch22_uid66_fpLogE1pxTest_c : std_logic_vector (0 downto 0);
    signal branch22_uid66_fpLogE1pxTest_n : std_logic_vector (0 downto 0);
    signal fracB_uid83_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal fracB_uid83_fpLogE1pxTest_q : std_logic_vector (52 downto 0);
    signal e_uid84_fpLogE1pxTest_a : std_logic_vector(12 downto 0);
    signal e_uid84_fpLogE1pxTest_b : std_logic_vector(12 downto 0);
    signal e_uid84_fpLogE1pxTest_o : std_logic_vector (12 downto 0);
    signal e_uid84_fpLogE1pxTest_q : std_logic_vector (12 downto 0);
    signal expXIsMo_uid86_fpLogE1pxTest_a : std_logic_vector(13 downto 0);
    signal expXIsMo_uid86_fpLogE1pxTest_b : std_logic_vector(13 downto 0);
    signal expXIsMo_uid86_fpLogE1pxTest_o : std_logic_vector (13 downto 0);
    signal expXIsMo_uid86_fpLogE1pxTest_cin : std_logic_vector (0 downto 0);
    signal expXIsMo_uid86_fpLogE1pxTest_c : std_logic_vector (0 downto 0);
    signal c_uid87_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal c_uid87_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal c_uid87_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal sumAHighB_uid108_fpLogE1pxTest_a : std_logic_vector(67 downto 0);
    signal sumAHighB_uid108_fpLogE1pxTest_b : std_logic_vector(67 downto 0);
    signal sumAHighB_uid108_fpLogE1pxTest_o : std_logic_vector (67 downto 0);
    signal sumAHighB_uid108_fpLogE1pxTest_q : std_logic_vector (67 downto 0);
    signal finalSumAbs_uid113_fpLogE1pxTest_a : std_logic_vector(119 downto 0);
    signal finalSumAbs_uid113_fpLogE1pxTest_b : std_logic_vector(119 downto 0);
    signal finalSumAbs_uid113_fpLogE1pxTest_o : std_logic_vector (119 downto 0);
    signal finalSumAbs_uid113_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
    signal branch4ExpCorrection_uid118_fpLogE1pxTest_a : std_logic_vector(6 downto 0);
    signal branch4ExpCorrection_uid118_fpLogE1pxTest_b : std_logic_vector(6 downto 0);
    signal branch4ExpCorrection_uid118_fpLogE1pxTest_o : std_logic_vector (6 downto 0);
    signal branch4ExpCorrection_uid118_fpLogE1pxTest_q : std_logic_vector (6 downto 0);
    signal expRExt1_uid119_fpLogE1pxTest_a : std_logic_vector(13 downto 0);
    signal expRExt1_uid119_fpLogE1pxTest_b : std_logic_vector(13 downto 0);
    signal expRExt1_uid119_fpLogE1pxTest_o : std_logic_vector (13 downto 0);
    signal expRExt1_uid119_fpLogE1pxTest_q : std_logic_vector (13 downto 0);
    signal fracR_uid126_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal fracR_uid126_fpLogE1pxTest_q : std_logic_vector (51 downto 0);
    signal expR_uid128_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal expR_uid128_fpLogE1pxTest_q : std_logic_vector (10 downto 0);
    signal excRInf0_uid137_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal excRInf0_uid137_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal excRInf0_uid137_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid140_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid140_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid140_fpLogE1pxTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid140_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExc_uid148_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid148_fpLogE1pxTest_q : std_logic_vector (51 downto 0);
    signal expRPostExc_uid152_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid152_fpLogE1pxTest_q : std_logic_vector (10 downto 0);
    signal vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (15 downto 0);
    signal vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (104 downto 0);
    signal p0_uid265_constMult_q : std_logic_vector(62 downto 0);
    signal lev1_a0_uid266_constMult_a : std_logic_vector(70 downto 0);
    signal lev1_a0_uid266_constMult_b : std_logic_vector(70 downto 0);
    signal lev1_a0_uid266_constMult_o : std_logic_vector (70 downto 0);
    signal lev1_a0_uid266_constMult_q : std_logic_vector (69 downto 0);
    signal ts2_uid304_natLogPolyEval_a : std_logic_vector(40 downto 0);
    signal ts2_uid304_natLogPolyEval_b : std_logic_vector(40 downto 0);
    signal ts2_uid304_natLogPolyEval_o : std_logic_vector (40 downto 0);
    signal ts2_uid304_natLogPolyEval_q : std_logic_vector (40 downto 0);
    signal ts3_uid310_natLogPolyEval_a : std_logic_vector(50 downto 0);
    signal ts3_uid310_natLogPolyEval_b : std_logic_vector(50 downto 0);
    signal ts3_uid310_natLogPolyEval_o : std_logic_vector (50 downto 0);
    signal ts3_uid310_natLogPolyEval_q : std_logic_vector (50 downto 0);
    signal ts4_uid316_natLogPolyEval_a : std_logic_vector(63 downto 0);
    signal ts4_uid316_natLogPolyEval_b : std_logic_vector(63 downto 0);
    signal ts4_uid316_natLogPolyEval_o : std_logic_vector (63 downto 0);
    signal ts4_uid316_natLogPolyEval_q : std_logic_vector (63 downto 0);
    signal vCount_uid321_countZ_uid114_fpLogE1pxTest_a : std_logic_vector(63 downto 0);
    signal vCount_uid321_countZ_uid114_fpLogE1pxTest_b : std_logic_vector(63 downto 0);
    signal vCount_uid321_countZ_uid114_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid329_countZ_uid114_fpLogE1pxTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid329_countZ_uid114_fpLogE1pxTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid329_countZ_uid114_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid332_countZ_uid114_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid332_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid335_countZ_uid114_fpLogE1pxTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid335_countZ_uid114_fpLogE1pxTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid335_countZ_uid114_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid338_countZ_uid114_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid338_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (15 downto 0);
    signal vStagei_uid344_countZ_uid114_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid344_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid356_countZ_uid114_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid356_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
    signal add0_uid414_pT2_uid301_natLogPolyEval_a : std_logic_vector (54 downto 0);
    signal add0_uid414_pT2_uid301_natLogPolyEval_b : std_logic_vector (54 downto 0);
    signal add0_uid414_pT2_uid301_natLogPolyEval_c : std_logic_vector (54 downto 0);
    signal add0_uid414_pT2_uid301_natLogPolyEval_o : std_logic_vector (54 downto 0);
    signal add0_uid414_pT2_uid301_natLogPolyEval_q : std_logic_vector (54 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal sEz_uid98_fpLogE1pxTest_q : std_logic_vector (53 downto 0);
    signal cIncludingRoundingBit_uid303_natLogPolyEval_q : std_logic_vector (39 downto 0);
    signal cIncludingRoundingBit_uid309_natLogPolyEval_q : std_logic_vector (49 downto 0);
    signal sEz_uid101_fpLogE1pxTest_q : std_logic_vector (53 downto 0);
    signal rightShiftStage2Idx2_uid183_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (105 downto 0);
    signal leftShiftStage2Idx2_uid255_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (104 downto 0);
    signal leftShiftStage2Idx1_uid387_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
    signal leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
    signal rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (105 downto 0);
    signal leftShiftStage2Idx2_uid390_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
    signal rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (105 downto 0);
    signal rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (105 downto 0);
    signal rightShiftStage2Idx3_uid186_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (105 downto 0);
    signal leftShiftStage2Idx3_uid258_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (104 downto 0);
    signal cIncludingRoundingBit_uid315_natLogPolyEval_q : std_logic_vector (62 downto 0);
    signal leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
    signal cStage_uid324_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (63 downto 0);
    signal leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
    signal leftShiftStage2Idx3_uid393_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
    signal prodXYTruncFR_uid403_pT1_uid295_natLogPolyEval_in : std_logic_vector (33 downto 0);
    signal prodXYTruncFR_uid403_pT1_uid295_natLogPolyEval_b : std_logic_vector (18 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_align_0_q_int : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_align_0_q : std_logic_vector (53 downto 0);
    signal multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_in : std_logic_vector (36 downto 0);
    signal multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_b : std_logic_vector (32 downto 0);
    signal multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_in : std_logic_vector (54 downto 0);
    signal multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_b : std_logic_vector (51 downto 0);
    signal concExc_uid143_fpLogE1pxTest_q : std_logic_vector (2 downto 0);
    signal rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (105 downto 0);
    signal rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (105 downto 0);
    signal leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (104 downto 0);
    signal os_uid275_natLogTabGen_q : std_logic_vector (59 downto 0);
    signal os_uid281_natLogTabGen_q : std_logic_vector (47 downto 0);
    signal os_uid286_natLogTabGen_q : std_logic_vector (37 downto 0);
    signal os_uid293_natLogTabGen_q : std_logic_vector (16 downto 0);
    signal os_uid290_natLogTabGen_q : std_logic_vector (27 downto 0);
    signal finalSum_uid106_uid109_fpLogE1pxTest_q : std_logic_vector (118 downto 0);
    signal leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
    signal frac_uid22_fpLogE1pxTest_in : std_logic_vector (51 downto 0);
    signal frac_uid22_fpLogE1pxTest_b : std_logic_vector (51 downto 0);
    signal vStagei_uid326_countZ_uid114_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid326_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (63 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_align_1_q_int : std_logic_vector (82 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_align_1_q : std_logic_vector (82 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_align_2_q_int : std_logic_vector (108 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_align_2_q : std_logic_vector (108 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_align_3_q_int : std_logic_vector (134 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_align_3_q : std_logic_vector (134 downto 0);
    signal redLO_uid47_fpLogE1pxTest_in : std_logic_vector (104 downto 0);
    signal redLO_uid47_fpLogE1pxTest_b : std_logic_vector (104 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmp_a : std_logic_vector(2 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmp_b : std_logic_vector(2 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_nor_q : std_logic_vector(0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_q : std_logic_vector(0 downto 0);
    signal zPPolyEval_uid91_fpLogE1pxTest_in : std_logic_vector (42 downto 0);
    signal zPPolyEval_uid91_fpLogE1pxTest_b : std_logic_vector (42 downto 0);
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_a : std_logic_vector(6 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_b : std_logic_vector(6 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_a : std_logic_vector(6 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_b : std_logic_vector(6 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmp_a : std_logic_vector(6 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmp_b : std_logic_vector(6 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmp_a : std_logic_vector(6 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmp_b : std_logic_vector(6 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmp_a : std_logic_vector(6 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmp_b : std_logic_vector(6 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_nor_q : std_logic_vector(0 downto 0);
    signal RLn_uid153_fpLogE1pxTest_q : std_logic_vector (63 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmp_a : std_logic_vector(6 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmp_b : std_logic_vector(6 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_nor_q : std_logic_vector(0 downto 0);
    signal yT3_uid306_natLogPolyEval_in : std_logic_vector (42 downto 0);
    signal yT3_uid306_natLogPolyEval_b : std_logic_vector (37 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmp_a : std_logic_vector(4 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmp_b : std_logic_vector(4 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_nor_q : std_logic_vector(0 downto 0);
    signal xTop27Bits_uid435_pT4_uid313_natLogPolyEval_in : std_logic_vector (42 downto 0);
    signal xTop27Bits_uid435_pT4_uid313_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmp_a : std_logic_vector(4 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmp_b : std_logic_vector(4 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_nor_q : std_logic_vector(0 downto 0);
    signal fracR0_uid125_fpLogE1pxTest_in : std_logic_vector (52 downto 0);
    signal fracR0_uid125_fpLogE1pxTest_b : std_logic_vector (51 downto 0);
    signal expR_uid127_fpLogE1pxTest_in : std_logic_vector (63 downto 0);
    signal expR_uid127_fpLogE1pxTest_b : std_logic_vector (10 downto 0);
    signal branch11_uid64_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal branch11_uid64_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal shifterAddr_uid35_fpLogE1pxTest_in : std_logic_vector (5 downto 0);
    signal shifterAddr_uid35_fpLogE1pxTest_b : std_logic_vector (5 downto 0);
    signal oMfracXRSLZCIn_uid43_fpLogE1pxTest_in : std_logic_vector (104 downto 0);
    signal oMfracXRSLZCIn_uid43_fpLogE1pxTest_b : std_logic_vector (52 downto 0);
    signal addrMask_uid51_fpLogE1pxTest_in : std_logic_vector (5 downto 0);
    signal addrMask_uid51_fpLogE1pxTest_b : std_logic_vector (5 downto 0);
    signal msbUoPlusOFracX_uid54_fpLogE1pxTest_in : std_logic_vector (53 downto 0);
    signal msbUoPlusOFracX_uid54_fpLogE1pxTest_b : std_logic_vector (0 downto 0);
    signal oPlusOFracXNormLow_uid57_fpLogE1pxTest_in : std_logic_vector (51 downto 0);
    signal oPlusOFracXNormLow_uid57_fpLogE1pxTest_b : std_logic_vector (51 downto 0);
    signal oPlusOFracXNormHigh_uid59_fpLogE1pxTest_in : std_logic_vector (52 downto 0);
    signal oPlusOFracXNormHigh_uid59_fpLogE1pxTest_b : std_logic_vector (52 downto 0);
    signal InvResIsX_uid72_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal InvResIsX_uid72_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal branch2_uid69_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal branch2_uid69_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal branch2_uid69_fpLogE1pxTest_c : std_logic_vector(0 downto 0);
    signal branch2_uid69_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal branch1_uid65_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal branch1_uid65_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal branch1_uid65_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal branch3_uid73_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal branch3_uid73_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal branch3_uid73_fpLogE1pxTest_c : std_logic_vector(0 downto 0);
    signal branch3_uid73_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal branch4_uid75_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal branch4_uid75_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal branch4_uid75_fpLogE1pxTest_c : std_logic_vector(0 downto 0);
    signal branch4_uid75_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal zAddrLow_uid89_fpLogE1pxTest_in : std_logic_vector (52 downto 0);
    signal zAddrLow_uid89_fpLogE1pxTest_b : std_logic_vector (9 downto 0);
    signal fracBRed_uid99_fpLogE1pxTest_in : std_logic_vector (52 downto 0);
    signal fracBRed_uid99_fpLogE1pxTest_b : std_logic_vector (51 downto 0);
    signal xv0_uid262_constMult_in : std_logic_vector (5 downto 0);
    signal xv0_uid262_constMult_b : std_logic_vector (5 downto 0);
    signal xv1_uid263_constMult_in : std_logic_vector (11 downto 0);
    signal xv1_uid263_constMult_b : std_logic_vector (5 downto 0);
    signal rVStage_uid320_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (119 downto 0);
    signal rVStage_uid320_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (63 downto 0);
    signal vStage_uid323_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (55 downto 0);
    signal vStage_uid323_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (55 downto 0);
    signal X87dto0_uid364_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (87 downto 0);
    signal X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (87 downto 0);
    signal X23dto0_uid370_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (23 downto 0);
    signal X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (23 downto 0);
    signal expRExt1Red_uid120_fpLogE1pxTest_in : std_logic_vector (12 downto 0);
    signal expRExt1Red_uid120_fpLogE1pxTest_b : std_logic_vector (12 downto 0);
    signal InvExcRNaN_uid141_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid141_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid213_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid213_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid223_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid223_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage1103dto0_uid251_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (103 downto 0);
    signal LeftShiftStage1103dto0_uid251_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (103 downto 0);
    signal LeftShiftStage1102dto0_uid254_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (102 downto 0);
    signal LeftShiftStage1102dto0_uid254_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (102 downto 0);
    signal LeftShiftStage1101dto0_uid257_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (101 downto 0);
    signal LeftShiftStage1101dto0_uid257_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (101 downto 0);
    signal sR_uid267_constMult_in : std_logic_vector (68 downto 0);
    signal sR_uid267_constMult_b : std_logic_vector (66 downto 0);
    signal s2_uid305_natLogPolyEval_in : std_logic_vector (40 downto 0);
    signal s2_uid305_natLogPolyEval_b : std_logic_vector (39 downto 0);
    signal s3_uid311_natLogPolyEval_in : std_logic_vector (50 downto 0);
    signal s3_uid311_natLogPolyEval_b : std_logic_vector (49 downto 0);
    signal s4_uid317_natLogPolyEval_in : std_logic_vector (63 downto 0);
    signal s4_uid317_natLogPolyEval_b : std_logic_vector (62 downto 0);
    signal rVStage_uid334_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid334_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid336_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid336_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid340_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid340_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid342_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid342_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid346_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid346_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid348_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid348_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid358_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid358_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage1117dto0_uid386_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (117 downto 0);
    signal LeftShiftStage1117dto0_uid386_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (117 downto 0);
    signal LeftShiftStage1115dto0_uid389_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (115 downto 0);
    signal LeftShiftStage1115dto0_uid389_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (115 downto 0);
    signal LeftShiftStage1113dto0_uid392_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (113 downto 0);
    signal LeftShiftStage1113dto0_uid392_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (113 downto 0);
    signal R_uid417_pT2_uid301_natLogPolyEval_in : std_logic_vector (53 downto 0);
    signal R_uid417_pT2_uid301_natLogPolyEval_b : std_logic_vector (29 downto 0);
    signal sEz_uid102_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal sEz_uid102_fpLogE1pxTest_q : std_logic_vector (53 downto 0);
    signal lowRangeB_uid296_natLogPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid296_natLogPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid297_natLogPolyEval_in : std_logic_vector (18 downto 0);
    signal highBBits_uid297_natLogPolyEval_b : std_logic_vector (17 downto 0);
    signal lowRangeB_uid430_pT3_uid307_natLogPolyEval_in : std_logic_vector (3 downto 0);
    signal lowRangeB_uid430_pT3_uid307_natLogPolyEval_b : std_logic_vector (3 downto 0);
    signal highBBits_uid431_pT3_uid307_natLogPolyEval_in : std_logic_vector (32 downto 0);
    signal highBBits_uid431_pT3_uid307_natLogPolyEval_b : std_logic_vector (28 downto 0);
    signal lowRangeB_uid445_pT4_uid313_natLogPolyEval_in : std_logic_vector (22 downto 0);
    signal lowRangeB_uid445_pT4_uid313_natLogPolyEval_b : std_logic_vector (22 downto 0);
    signal highBBits_uid446_pT4_uid313_natLogPolyEval_in : std_logic_vector (51 downto 0);
    signal highBBits_uid446_pT4_uid313_natLogPolyEval_b : std_logic_vector (28 downto 0);
    signal RightShiftStage1105dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (105 downto 0);
    signal RightShiftStage1105dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (104 downto 0);
    signal RightShiftStage1105dto2_uid181_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (105 downto 0);
    signal RightShiftStage1105dto2_uid181_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (103 downto 0);
    signal RightShiftStage1105dto3_uid184_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (105 downto 0);
    signal RightShiftStage1105dto3_uid184_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (102 downto 0);
    signal fracXRS_uid39_fpLogE1pxTest_in : std_logic_vector (105 downto 0);
    signal fracXRS_uid39_fpLogE1pxTest_b : std_logic_vector (53 downto 0);
    signal fracXBranch4_uid49_fpLogE1pxTest_in : std_logic_vector (104 downto 0);
    signal fracXBranch4_uid49_fpLogE1pxTest_b : std_logic_vector (53 downto 0);
    signal FullSumAB118_uid110_fpLogE1pxTest_in : std_logic_vector (118 downto 0);
    signal FullSumAB118_uid110_fpLogE1pxTest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage2118dto0_uid397_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (118 downto 0);
    signal LeftShiftStage2118dto0_uid397_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (118 downto 0);
    signal fracXIsZero_uid23_fpLogE1pxTest_a : std_logic_vector(51 downto 0);
    signal fracXIsZero_uid23_fpLogE1pxTest_b : std_logic_vector(51 downto 0);
    signal fracXIsZero_uid23_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal oFracX_uid32_fpLogE1pxTest_q : std_logic_vector (52 downto 0);
    signal rVStage_uid328_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (63 downto 0);
    signal rVStage_uid328_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid330_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (31 downto 0);
    signal vStage_uid330_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (31 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_result_add_0_1_a : std_logic_vector(135 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_result_add_0_1_b : std_logic_vector(135 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_result_add_0_1_o : std_logic_vector (135 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_result_add_0_1_q : std_logic_vector (135 downto 0);
    signal X88dto0_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (88 downto 0);
    signal X88dto0_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (88 downto 0);
    signal X72dto0_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (72 downto 0);
    signal X72dto0_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (72 downto 0);
    signal X56dto0_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (56 downto 0);
    signal X56dto0_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (56 downto 0);
    signal yT1_uid294_natLogPolyEval_in : std_logic_vector (42 downto 0);
    signal yT1_uid294_natLogPolyEval_b : std_logic_vector (16 downto 0);
    signal yT2_uid300_natLogPolyEval_in : std_logic_vector (42 downto 0);
    signal yT2_uid300_natLogPolyEval_b : std_logic_vector (27 downto 0);
    signal xBottomBits_uid439_pT4_uid313_natLogPolyEval_in : std_logic_vector (15 downto 0);
    signal xBottomBits_uid439_pT4_uid313_natLogPolyEval_b : std_logic_vector (15 downto 0);
    signal xTop27Bits_uid418_pT3_uid307_natLogPolyEval_in : std_logic_vector (37 downto 0);
    signal xTop27Bits_uid418_pT3_uid307_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal xTop18Bits_uid421_pT3_uid307_natLogPolyEval_in : std_logic_vector (37 downto 0);
    signal xTop18Bits_uid421_pT3_uid307_natLogPolyEval_b : std_logic_vector (17 downto 0);
    signal xBottomBits_uid423_pT3_uid307_natLogPolyEval_in : std_logic_vector (10 downto 0);
    signal xBottomBits_uid423_pT3_uid307_natLogPolyEval_b : std_logic_vector (10 downto 0);
    signal rightShiftStageSel5Dto4_uid165_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (5 downto 0);
    signal rightShiftStageSel5Dto4_uid165_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (3 downto 0);
    signal rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (1 downto 0);
    signal rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (52 downto 0);
    signal rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid194_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (20 downto 0);
    signal vStage_uid194_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (20 downto 0);
    signal join_uid58_fpLogE1pxTest_q : std_logic_vector (52 downto 0);
    signal concBranch_uid76_fpLogE1pxTest_q : std_logic_vector (3 downto 0);
    signal addr_uid90_fpLogE1pxTest_q : std_logic_vector (10 downto 0);
    signal signRFull_uid142_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal signRFull_uid142_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal signRFull_uid142_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid215_leadingZeros_uid44_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid215_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (3 downto 0);
    signal vCount_uid224_leadingZeros_uid44_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid224_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid224_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal yTop27Bits_uid419_pT3_uid307_natLogPolyEval_in : std_logic_vector (39 downto 0);
    signal yTop27Bits_uid419_pT3_uid307_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal yBottomBits_uid422_pT3_uid307_natLogPolyEval_in : std_logic_vector (12 downto 0);
    signal yBottomBits_uid422_pT3_uid307_natLogPolyEval_b : std_logic_vector (12 downto 0);
    signal yTop18Bits_uid424_pT3_uid307_natLogPolyEval_in : std_logic_vector (39 downto 0);
    signal yTop18Bits_uid424_pT3_uid307_natLogPolyEval_b : std_logic_vector (17 downto 0);
    signal yTop27Bits_uid436_pT4_uid313_natLogPolyEval_in : std_logic_vector (49 downto 0);
    signal yTop27Bits_uid436_pT4_uid313_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal yBottomBits_uid438_pT4_uid313_natLogPolyEval_in : std_logic_vector (22 downto 0);
    signal yBottomBits_uid438_pT4_uid313_natLogPolyEval_b : std_logic_vector (22 downto 0);
    signal peOR_uid93_fpLogE1pxTest_in : std_logic_vector (61 downto 0);
    signal peOR_uid93_fpLogE1pxTest_b : std_logic_vector (55 downto 0);
    signal vCount_uid347_countZ_uid114_fpLogE1pxTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid347_countZ_uid114_fpLogE1pxTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid347_countZ_uid114_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid350_countZ_uid114_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid350_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (3 downto 0);
    signal vCount_uid359_countZ_uid114_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid359_countZ_uid114_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid359_countZ_uid114_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a_0_in : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a_0_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a_1_in : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a_1_b : std_logic_vector (26 downto 0);
    signal sumAHighB_uid298_natLogPolyEval_a : std_logic_vector(28 downto 0);
    signal sumAHighB_uid298_natLogPolyEval_b : std_logic_vector(28 downto 0);
    signal sumAHighB_uid298_natLogPolyEval_o : std_logic_vector (28 downto 0);
    signal sumAHighB_uid298_natLogPolyEval_q : std_logic_vector (28 downto 0);
    signal sumAHighB_uid432_pT3_uid307_natLogPolyEval_a : std_logic_vector(54 downto 0);
    signal sumAHighB_uid432_pT3_uid307_natLogPolyEval_b : std_logic_vector(54 downto 0);
    signal sumAHighB_uid432_pT3_uid307_natLogPolyEval_o : std_logic_vector (54 downto 0);
    signal sumAHighB_uid432_pT3_uid307_natLogPolyEval_q : std_logic_vector (54 downto 0);
    signal sumAHighB_uid447_pT4_uid313_natLogPolyEval_a : std_logic_vector(54 downto 0);
    signal sumAHighB_uid447_pT4_uid313_natLogPolyEval_b : std_logic_vector(54 downto 0);
    signal sumAHighB_uid447_pT4_uid313_natLogPolyEval_o : std_logic_vector (54 downto 0);
    signal sumAHighB_uid447_pT4_uid313_natLogPolyEval_q : std_logic_vector (54 downto 0);
    signal fracXRSRange_uid81_fpLogE1pxTest_in : std_logic_vector (52 downto 0);
    signal fracXRSRange_uid81_fpLogE1pxTest_b : std_logic_vector (52 downto 0);
    signal fracXBranch4Red_uid80_fpLogE1pxTest_in : std_logic_vector (52 downto 0);
    signal fracXBranch4Red_uid80_fpLogE1pxTest_b : std_logic_vector (52 downto 0);
    signal leftShiftStage3Idx1_uid398_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
    signal exc_I_uid24_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid24_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid24_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid25_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid25_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal rightPaddedIn_uid37_fpLogE1pxTest_q : std_logic_vector (105 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_result_add_1_0_a : std_logic_vector(136 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_result_add_1_0_b : std_logic_vector(136 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_result_add_1_0_o : std_logic_vector (136 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_result_add_1_0_q : std_logic_vector (136 downto 0);
    signal leftShiftStage0Idx1_uid230_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (104 downto 0);
    signal leftShiftStage0Idx2_uid233_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (104 downto 0);
    signal leftShiftStage0Idx3_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (104 downto 0);
    signal xTop27Bits_uid405_pT2_uid301_natLogPolyEval_in : std_logic_vector (27 downto 0);
    signal xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal sSM0W_uid409_pT2_uid301_natLogPolyEval_in : std_logic_vector (27 downto 0);
    signal sSM0W_uid409_pT2_uid301_natLogPolyEval_b : std_logic_vector (3 downto 0);
    signal sSM1W_uid412_pT2_uid301_natLogPolyEval_in : std_logic_vector (0 downto 0);
    signal sSM1W_uid412_pT2_uid301_natLogPolyEval_b : std_logic_vector (0 downto 0);
    signal pad_xBottomBits_uid423_uid426_pT3_uid307_natLogPolyEval_q : std_logic_vector (16 downto 0);
    signal cStage_uid195_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (31 downto 0);
    signal rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid219_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid219_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal r_uid225_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (5 downto 0);
    signal spad_yBottomBits_uid422_uid425_pT3_uid307_natLogPolyEval_q : std_logic_vector (13 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_b_0_in : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_b_0_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_b_1_in : std_logic_vector (53 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_b_1_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_b_2_in : std_logic_vector (80 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_b_2_b : std_logic_vector (26 downto 0);
    signal rVStage_uid352_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid352_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid354_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid354_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal r_uid360_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (6 downto 0);
    signal s1_uid296_uid299_natLogPolyEval_q : std_logic_vector (29 downto 0);
    signal add0_uid430_uid433_pT3_uid307_natLogPolyEval_q : std_logic_vector (58 downto 0);
    signal add0_uid445_uid448_pT4_uid313_natLogPolyEval_q : std_logic_vector (77 downto 0);
    signal leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
    signal InvExc_I_uid28_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid28_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid26_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid26_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid26_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal X105dto16_uid156_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (105 downto 0);
    signal X105dto16_uid156_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (89 downto 0);
    signal X105dto32_uid159_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (105 downto 0);
    signal X105dto32_uid159_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (73 downto 0);
    signal X105dto48_uid162_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (105 downto 0);
    signal X105dto48_uid162_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (57 downto 0);
    signal lowRangeB_uid106_fpLogE1pxTest_in : std_logic_vector (50 downto 0);
    signal lowRangeB_uid106_fpLogE1pxTest_b : std_logic_vector (50 downto 0);
    signal highBBits_uid107_fpLogE1pxTest_in : std_logic_vector (109 downto 0);
    signal highBBits_uid107_fpLogE1pxTest_b : std_logic_vector (58 downto 0);
    signal expBran3PreExt_uid45_fpLogE1pxTest_a : std_logic_vector(11 downto 0);
    signal expBran3PreExt_uid45_fpLogE1pxTest_b : std_logic_vector(11 downto 0);
    signal expBran3PreExt_uid45_fpLogE1pxTest_o : std_logic_vector (11 downto 0);
    signal expBran3PreExt_uid45_fpLogE1pxTest_q : std_logic_vector (11 downto 0);
    signal leftShiftStageSel5Dto4_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (5 downto 0);
    signal leftShiftStageSel5Dto4_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel3Dto2_uid248_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid248_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal pad_yBottomBits_uid422_uid427_pT3_uid307_natLogPolyEval_q : std_logic_vector (17 downto 0);
    signal expRExt0_uid117_fpLogE1pxTest_a : std_logic_vector(12 downto 0);
    signal expRExt0_uid117_fpLogE1pxTest_b : std_logic_vector(12 downto 0);
    signal expRExt0_uid117_fpLogE1pxTest_o : std_logic_vector (12 downto 0);
    signal expRExt0_uid117_fpLogE1pxTest_q : std_logic_vector (12 downto 0);
    signal leftShiftStageSel6Dto5_uid372_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (6 downto 0);
    signal leftShiftStageSel6Dto5_uid372_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel4Dto3_uid383_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto3_uid383_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (2 downto 0);
    signal leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel0Dto0_uid399_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (0 downto 0);
    signal leftShiftStageSel0Dto0_uid399_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (0 downto 0);
    signal yTop27Bits_uid406_pT2_uid301_natLogPolyEval_in : std_logic_vector (29 downto 0);
    signal yTop27Bits_uid406_pT2_uid301_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal sSM0H_uid408_pT2_uid301_natLogPolyEval_in : std_logic_vector (2 downto 0);
    signal sSM0H_uid408_pT2_uid301_natLogPolyEval_b : std_logic_vector (2 downto 0);
    signal sSM1H_uid411_pT2_uid301_natLogPolyEval_in : std_logic_vector (29 downto 0);
    signal sSM1H_uid411_pT2_uid301_natLogPolyEval_b : std_logic_vector (5 downto 0);
    signal R_uid434_pT3_uid307_natLogPolyEval_in : std_logic_vector (57 downto 0);
    signal R_uid434_pT3_uid307_natLogPolyEval_b : std_logic_vector (40 downto 0);
    signal R_uid449_pT4_uid313_natLogPolyEval_in : std_logic_vector (76 downto 0);
    signal R_uid449_pT4_uid313_natLogPolyEval_b : std_logic_vector (51 downto 0);
    signal fracR_uid122_fpLogE1pxTest_in : std_logic_vector (118 downto 0);
    signal fracR_uid122_fpLogE1pxTest_b : std_logic_vector (52 downto 0);
    signal InvExc_N_uid27_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid27_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0Idx1_uid158_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (105 downto 0);
    signal rightShiftStage0Idx2_uid161_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (105 downto 0);
    signal rightShiftStage0Idx3_uid164_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (105 downto 0);
    signal expBran3Pre_uid46_fpLogE1pxTest_in : std_logic_vector (10 downto 0);
    signal expBran3Pre_uid46_fpLogE1pxTest_b : std_logic_vector (10 downto 0);
    signal leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (104 downto 0);
    signal leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
    signal expFracConc_uid123_fpLogE1pxTest_q : std_logic_vector (65 downto 0);
    signal exc_R_uid30_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid30_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid30_fpLogE1pxTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid30_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (105 downto 0);
    signal LeftShiftStage0100dto0_uid240_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (100 downto 0);
    signal LeftShiftStage0100dto0_uid240_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (100 downto 0);
    signal LeftShiftStage096dto0_uid243_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (96 downto 0);
    signal LeftShiftStage096dto0_uid243_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (96 downto 0);
    signal LeftShiftStage092dto0_uid246_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (92 downto 0);
    signal LeftShiftStage092dto0_uid246_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (92 downto 0);
    signal LeftShiftStage0111dto0_uid375_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (111 downto 0);
    signal LeftShiftStage0111dto0_uid375_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (111 downto 0);
    signal LeftShiftStage0103dto0_uid378_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (103 downto 0);
    signal LeftShiftStage0103dto0_uid378_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (103 downto 0);
    signal LeftShiftStage095dto0_uid381_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (95 downto 0);
    signal LeftShiftStage095dto0_uid381_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (95 downto 0);
    signal RightShiftStage0105dto4_uid167_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (105 downto 0);
    signal RightShiftStage0105dto4_uid167_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (101 downto 0);
    signal RightShiftStage0105dto8_uid170_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (105 downto 0);
    signal RightShiftStage0105dto8_uid170_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (97 downto 0);
    signal RightShiftStage0105dto12_uid173_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (105 downto 0);
    signal RightShiftStage0105dto12_uid173_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (93 downto 0);
    signal leftShiftStage1Idx1_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (104 downto 0);
    signal leftShiftStage1Idx2_uid244_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (104 downto 0);
    signal leftShiftStage1Idx3_uid247_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (104 downto 0);
    signal leftShiftStage1Idx1_uid376_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
    signal leftShiftStage1Idx2_uid379_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
    signal leftShiftStage1Idx3_uid382_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (119 downto 0);
begin


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable(LOGICAL,1343)
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_a <= en;
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q <= not ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_a;

	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor(LOGICAL,1572)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_b <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena_q;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_q <= not (ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_a or ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_b);

	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_mem_top(CONSTANT,1568)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_mem_top_q <= "0101111";

	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmp(LOGICAL,1569)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmp_a <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_mem_top_q;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdmux_q);
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmp_q <= "1" when ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmp_a = ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmp_b else "0";

	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmpReg(REG,1570)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmpReg_q <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena(REG,1573)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_q = "1") THEN
                ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena_q <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd(LOGICAL,1574)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_a <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena_q;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_b <= en;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_q <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_a and ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_b;

	--signX_uid7_fpLogE1pxTest(BITSELECT,6)@0
    signX_uid7_fpLogE1pxTest_in <= a;
    signX_uid7_fpLogE1pxTest_b <= signX_uid7_fpLogE1pxTest_in(63 downto 63);

	--ld_signX_uid7_fpLogE1pxTest_b_to_signRFull_uid142_fpLogE1pxTest_b(DELAY,800)@0
    ld_signX_uid7_fpLogE1pxTest_b_to_signRFull_uid142_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => signX_uid7_fpLogE1pxTest_b, xout => ld_signX_uid7_fpLogE1pxTest_b_to_signRFull_uid142_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--cstAllZWF_uid8_fpLogE1pxTest(CONSTANT,7)
    cstAllZWF_uid8_fpLogE1pxTest_q <= "0000000000000000000000000000000000000000000000000000";

	--ld_xIn_a_to_frac_uid22_fpLogE1pxTest_a(DELAY,658)@0
    ld_xIn_a_to_frac_uid22_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 64, depth => 1 )
    PORT MAP ( xin => a, xout => ld_xIn_a_to_frac_uid22_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--frac_uid22_fpLogE1pxTest(BITSELECT,21)@1
    frac_uid22_fpLogE1pxTest_in <= ld_xIn_a_to_frac_uid22_fpLogE1pxTest_a_q(51 downto 0);
    frac_uid22_fpLogE1pxTest_b <= frac_uid22_fpLogE1pxTest_in(51 downto 0);

	--fracXIsZero_uid23_fpLogE1pxTest(LOGICAL,22)@1
    fracXIsZero_uid23_fpLogE1pxTest_a <= frac_uid22_fpLogE1pxTest_b;
    fracXIsZero_uid23_fpLogE1pxTest_b <= cstAllZWF_uid8_fpLogE1pxTest_q;
    fracXIsZero_uid23_fpLogE1pxTest_q <= "1" when fracXIsZero_uid23_fpLogE1pxTest_a = fracXIsZero_uid23_fpLogE1pxTest_b else "0";

	--cstAllOWE_uid15_fpLogE1pxTest(CONSTANT,14)
    cstAllOWE_uid15_fpLogE1pxTest_q <= "11111111111";

	--expX_uid6_fpLogE1pxTest(BITSELECT,5)@0
    expX_uid6_fpLogE1pxTest_in <= a(62 downto 0);
    expX_uid6_fpLogE1pxTest_b <= expX_uid6_fpLogE1pxTest_in(62 downto 52);

	--expXIsMax_uid21_fpLogE1pxTest(LOGICAL,20)@0
    expXIsMax_uid21_fpLogE1pxTest_a <= expX_uid6_fpLogE1pxTest_b;
    expXIsMax_uid21_fpLogE1pxTest_b <= cstAllOWE_uid15_fpLogE1pxTest_q;
    expXIsMax_uid21_fpLogE1pxTest_q <= "1" when expXIsMax_uid21_fpLogE1pxTest_a = expXIsMax_uid21_fpLogE1pxTest_b else "0";

	--ld_expXIsMax_uid21_fpLogE1pxTest_q_to_exc_I_uid24_fpLogE1pxTest_a(DELAY,660)@0
    ld_expXIsMax_uid21_fpLogE1pxTest_q_to_exc_I_uid24_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsMax_uid21_fpLogE1pxTest_q, xout => ld_expXIsMax_uid21_fpLogE1pxTest_q_to_exc_I_uid24_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--exc_I_uid24_fpLogE1pxTest(LOGICAL,23)@1
    exc_I_uid24_fpLogE1pxTest_a <= ld_expXIsMax_uid21_fpLogE1pxTest_q_to_exc_I_uid24_fpLogE1pxTest_a_q;
    exc_I_uid24_fpLogE1pxTest_b <= fracXIsZero_uid23_fpLogE1pxTest_q;
    exc_I_uid24_fpLogE1pxTest_q <= exc_I_uid24_fpLogE1pxTest_a and exc_I_uid24_fpLogE1pxTest_b;

	--ld_signX_uid7_fpLogE1pxTest_b_to_negInf_uid138_fpLogE1pxTest_a(DELAY,791)@0
    ld_signX_uid7_fpLogE1pxTest_b_to_negInf_uid138_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signX_uid7_fpLogE1pxTest_b, xout => ld_signX_uid7_fpLogE1pxTest_b_to_negInf_uid138_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--negInf_uid138_fpLogE1pxTest(LOGICAL,137)@1
    negInf_uid138_fpLogE1pxTest_a <= ld_signX_uid7_fpLogE1pxTest_b_to_negInf_uid138_fpLogE1pxTest_a_q;
    negInf_uid138_fpLogE1pxTest_b <= exc_I_uid24_fpLogE1pxTest_q;
    negInf_uid138_fpLogE1pxTest_q_i <= negInf_uid138_fpLogE1pxTest_a and negInf_uid138_fpLogE1pxTest_b;
    negInf_uid138_fpLogE1pxTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => negInf_uid138_fpLogE1pxTest_q, xin => negInf_uid138_fpLogE1pxTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--GND(CONSTANT,0)
    GND_q <= "0";

	--cstBias_uid9_fpLogE1pxTest(CONSTANT,8)
    cstBias_uid9_fpLogE1pxTest_q <= "01111111111";

	--mO_uid130_fpLogE1pxTest(BITJOIN,129)@0
    mO_uid130_fpLogE1pxTest_q <= VCC_q & cstBias_uid9_fpLogE1pxTest_q & cstAllZWF_uid8_fpLogE1pxTest_q;

	--xLTM1_uid133_fpLogE1pxTest(COMPARE,132)@0
    xLTM1_uid133_fpLogE1pxTest_cin <= GND_q;
    xLTM1_uid133_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("00" & mO_uid130_fpLogE1pxTest_q) & '0';
    xLTM1_uid133_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00" & a) & xLTM1_uid133_fpLogE1pxTest_cin(0);
            xLTM1_uid133_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xLTM1_uid133_fpLogE1pxTest_a) - UNSIGNED(xLTM1_uid133_fpLogE1pxTest_b));
    xLTM1_uid133_fpLogE1pxTest_c(0) <= xLTM1_uid133_fpLogE1pxTest_o(66);


	--ld_xLTM1_uid133_fpLogE1pxTest_c_to_excRNaN0_uid139_fpLogE1pxTest_b(DELAY,794)@0
    ld_xLTM1_uid133_fpLogE1pxTest_c_to_excRNaN0_uid139_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xLTM1_uid133_fpLogE1pxTest_c, xout => ld_xLTM1_uid133_fpLogE1pxTest_c_to_excRNaN0_uid139_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--InvFracXIsZero_uid25_fpLogE1pxTest(LOGICAL,24)@1
    InvFracXIsZero_uid25_fpLogE1pxTest_a <= fracXIsZero_uid23_fpLogE1pxTest_q;
    InvFracXIsZero_uid25_fpLogE1pxTest_q <= not InvFracXIsZero_uid25_fpLogE1pxTest_a;

	--exc_N_uid26_fpLogE1pxTest(LOGICAL,25)@1
    exc_N_uid26_fpLogE1pxTest_a <= ld_expXIsMax_uid21_fpLogE1pxTest_q_to_exc_I_uid24_fpLogE1pxTest_a_q;
    exc_N_uid26_fpLogE1pxTest_b <= InvFracXIsZero_uid25_fpLogE1pxTest_q;
    exc_N_uid26_fpLogE1pxTest_q <= exc_N_uid26_fpLogE1pxTest_a and exc_N_uid26_fpLogE1pxTest_b;

	--InvExc_N_uid27_fpLogE1pxTest(LOGICAL,26)@1
    InvExc_N_uid27_fpLogE1pxTest_a <= exc_N_uid26_fpLogE1pxTest_q;
    InvExc_N_uid27_fpLogE1pxTest_q <= not InvExc_N_uid27_fpLogE1pxTest_a;

	--InvExc_I_uid28_fpLogE1pxTest(LOGICAL,27)@1
    InvExc_I_uid28_fpLogE1pxTest_a <= exc_I_uid24_fpLogE1pxTest_q;
    InvExc_I_uid28_fpLogE1pxTest_q <= not InvExc_I_uid28_fpLogE1pxTest_a;

	--cstAllZWE_uid17_fpLogE1pxTest(CONSTANT,16)
    cstAllZWE_uid17_fpLogE1pxTest_q <= "00000000000";

	--expXIsZero_uid19_fpLogE1pxTest(LOGICAL,18)@0
    expXIsZero_uid19_fpLogE1pxTest_a <= expX_uid6_fpLogE1pxTest_b;
    expXIsZero_uid19_fpLogE1pxTest_b <= cstAllZWE_uid17_fpLogE1pxTest_q;
    expXIsZero_uid19_fpLogE1pxTest_q <= "1" when expXIsZero_uid19_fpLogE1pxTest_a = expXIsZero_uid19_fpLogE1pxTest_b else "0";

	--ld_expXIsZero_uid19_fpLogE1pxTest_q_to_InvExpXIsZero_uid29_fpLogE1pxTest_a(DELAY,667)@0
    ld_expXIsZero_uid19_fpLogE1pxTest_q_to_InvExpXIsZero_uid29_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid19_fpLogE1pxTest_q, xout => ld_expXIsZero_uid19_fpLogE1pxTest_q_to_InvExpXIsZero_uid29_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvExpXIsZero_uid29_fpLogE1pxTest(LOGICAL,28)@1
    InvExpXIsZero_uid29_fpLogE1pxTest_a <= ld_expXIsZero_uid19_fpLogE1pxTest_q_to_InvExpXIsZero_uid29_fpLogE1pxTest_a_q;
    InvExpXIsZero_uid29_fpLogE1pxTest_q <= not InvExpXIsZero_uid29_fpLogE1pxTest_a;

	--exc_R_uid30_fpLogE1pxTest(LOGICAL,29)@1
    exc_R_uid30_fpLogE1pxTest_a <= InvExpXIsZero_uid29_fpLogE1pxTest_q;
    exc_R_uid30_fpLogE1pxTest_b <= InvExc_I_uid28_fpLogE1pxTest_q;
    exc_R_uid30_fpLogE1pxTest_c <= InvExc_N_uid27_fpLogE1pxTest_q;
    exc_R_uid30_fpLogE1pxTest_q <= exc_R_uid30_fpLogE1pxTest_a and exc_R_uid30_fpLogE1pxTest_b and exc_R_uid30_fpLogE1pxTest_c;

	--excRNaN0_uid139_fpLogE1pxTest(LOGICAL,138)@1
    excRNaN0_uid139_fpLogE1pxTest_a <= exc_R_uid30_fpLogE1pxTest_q;
    excRNaN0_uid139_fpLogE1pxTest_b <= ld_xLTM1_uid133_fpLogE1pxTest_c_to_excRNaN0_uid139_fpLogE1pxTest_b_q;
    excRNaN0_uid139_fpLogE1pxTest_q_i <= excRNaN0_uid139_fpLogE1pxTest_a and excRNaN0_uid139_fpLogE1pxTest_b;
    excRNaN0_uid139_fpLogE1pxTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => excRNaN0_uid139_fpLogE1pxTest_q, xin => excRNaN0_uid139_fpLogE1pxTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--reg_exc_N_uid26_fpLogE1pxTest_0_to_excRNaN_uid140_fpLogE1pxTest_1(REG,491)@1
    reg_exc_N_uid26_fpLogE1pxTest_0_to_excRNaN_uid140_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_N_uid26_fpLogE1pxTest_0_to_excRNaN_uid140_fpLogE1pxTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_N_uid26_fpLogE1pxTest_0_to_excRNaN_uid140_fpLogE1pxTest_1_q <= exc_N_uid26_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excRNaN_uid140_fpLogE1pxTest(LOGICAL,139)@2
    excRNaN_uid140_fpLogE1pxTest_a <= reg_exc_N_uid26_fpLogE1pxTest_0_to_excRNaN_uid140_fpLogE1pxTest_1_q;
    excRNaN_uid140_fpLogE1pxTest_b <= excRNaN0_uid139_fpLogE1pxTest_q;
    excRNaN_uid140_fpLogE1pxTest_c <= negInf_uid138_fpLogE1pxTest_q;
    excRNaN_uid140_fpLogE1pxTest_q <= excRNaN_uid140_fpLogE1pxTest_a or excRNaN_uid140_fpLogE1pxTest_b or excRNaN_uid140_fpLogE1pxTest_c;

	--InvExcRNaN_uid141_fpLogE1pxTest(LOGICAL,140)@2
    InvExcRNaN_uid141_fpLogE1pxTest_a <= excRNaN_uid140_fpLogE1pxTest_q;
    InvExcRNaN_uid141_fpLogE1pxTest_q <= not InvExcRNaN_uid141_fpLogE1pxTest_a;

	--signRFull_uid142_fpLogE1pxTest(LOGICAL,141)@2
    signRFull_uid142_fpLogE1pxTest_a <= InvExcRNaN_uid141_fpLogE1pxTest_q;
    signRFull_uid142_fpLogE1pxTest_b <= ld_signX_uid7_fpLogE1pxTest_b_to_signRFull_uid142_fpLogE1pxTest_b_q;
    signRFull_uid142_fpLogE1pxTest_q <= signRFull_uid142_fpLogE1pxTest_a and signRFull_uid142_fpLogE1pxTest_b;

	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_inputreg(DELAY,1562)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signRFull_uid142_fpLogE1pxTest_q, xout => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt(COUNTER,1564)
    -- every=1, low=0, high=47, step=1, init=1
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_i = 46 THEN
                      ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_eq = '1') THEN
                        ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_i <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_i - 47;
                    ELSE
                        ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_i <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_i,6));


	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdreg(REG,1565)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdreg_q <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--xIn(GPIN,3)@0

	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdmux(MUX,1566)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdmux_s <= en;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdmux: PROCESS (ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdmux_s, ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdreg_q, ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_q)
    BEGIN
            CASE ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdmux_s IS
                  WHEN "0" => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdmux_q <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdreg_q;
                  WHEN "1" => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdmux_q <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem(DUALMEM,1563)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_ia <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_inputreg_q;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_aa <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdreg_q;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_ab <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_rdmux_q;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 48,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 48,
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
        clocken1 => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_iq,
        address_a => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_aa,
        data_a => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_ia
    );
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_reset0 <= areset;
        ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_q <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_iq(0 downto 0);

	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor(LOGICAL,1546)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_b <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_q <= not (ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_a or ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_b);

	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_mem_top(CONSTANT,1542)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_mem_top_q <= "0110001";

	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmp(LOGICAL,1543)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmp_a <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_mem_top_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdmux_q);
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmp_q <= "1" when ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmp_a = ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmp_b else "0";

	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmpReg(REG,1544)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmpReg_q <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena(REG,1547)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_q = "1") THEN
                ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena_q <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd(LOGICAL,1548)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_a <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_b <= en;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_q <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_a and ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_b;

	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_inputreg(DELAY,1536)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1 )
    PORT MAP ( xin => expX_uid6_fpLogE1pxTest_b, xout => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt(COUNTER,1538)
    -- every=1, low=0, high=49, step=1, init=1
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_i = 48 THEN
                      ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_eq = '1') THEN
                        ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_i <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_i - 49;
                    ELSE
                        ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_i <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_i,6));


	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdreg(REG,1539)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdreg_q <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdmux(MUX,1540)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdmux_s <= en;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdmux: PROCESS (ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdmux_s, ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdreg_q, ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdmux_q <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdreg_q;
                  WHEN "1" => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdmux_q <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem(DUALMEM,1537)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_ia <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_inputreg_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_aa <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdreg_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_ab <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_rdmux_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 6,
        numwords_a => 50,
        width_b => 11,
        widthad_b => 6,
        numwords_b => 50,
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
        clocken1 => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_iq,
        address_a => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_aa,
        data_a => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_ia
    );
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_reset0 <= areset;
        ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_q <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_iq(10 downto 0);

	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor(LOGICAL,1509)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_b <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena_q;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_q <= not (ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_a or ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_b);

	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_mem_top(CONSTANT,1505)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_mem_top_q <= "0100011";

	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp(LOGICAL,1506)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_a <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_mem_top_q;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_q);
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_q <= "1" when ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_a = ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_b else "0";

	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmpReg(REG,1507)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmpReg_q <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena(REG,1510)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_q = "1") THEN
                ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena_q <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd(LOGICAL,1511)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_a <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena_q;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_b <= en;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_q <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_a and ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_b;

	--cstBiasMO_uid10_fpLogE1pxTest(CONSTANT,9)
    cstBiasMO_uid10_fpLogE1pxTest_q <= "01111111110";

	--expXIsMo_uid86_fpLogE1pxTest(COMPARE,85)@0
    expXIsMo_uid86_fpLogE1pxTest_cin <= GND_q;
    expXIsMo_uid86_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("00" & expX_uid6_fpLogE1pxTest_b) & '0';
    expXIsMo_uid86_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00" & cstBiasMO_uid10_fpLogE1pxTest_q) & expXIsMo_uid86_fpLogE1pxTest_cin(0);
            expXIsMo_uid86_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXIsMo_uid86_fpLogE1pxTest_a) - UNSIGNED(expXIsMo_uid86_fpLogE1pxTest_b));
    expXIsMo_uid86_fpLogE1pxTest_c(0) <= expXIsMo_uid86_fpLogE1pxTest_o(13);


	--ld_expXIsMo_uid86_fpLogE1pxTest_c_to_c_uid87_fpLogE1pxTest_b(DELAY,733)@0
    ld_expXIsMo_uid86_fpLogE1pxTest_c_to_c_uid87_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 10 )
    PORT MAP ( xin => expXIsMo_uid86_fpLogE1pxTest_c, xout => ld_expXIsMo_uid86_fpLogE1pxTest_c_to_c_uid87_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--cstBiasMWFP1_uid14_fpLogE1pxTest(CONSTANT,13)
    cstBiasMWFP1_uid14_fpLogE1pxTest_q <= "01111001010";

	--resIsX_uid62_fpLogE1pxTest(COMPARE,61)@0
    resIsX_uid62_fpLogE1pxTest_cin <= GND_q;
    resIsX_uid62_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("00" & expX_uid6_fpLogE1pxTest_b) & '0';
    resIsX_uid62_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00" & cstBiasMWFP1_uid14_fpLogE1pxTest_q) & resIsX_uid62_fpLogE1pxTest_cin(0);
            resIsX_uid62_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(resIsX_uid62_fpLogE1pxTest_a) - UNSIGNED(resIsX_uid62_fpLogE1pxTest_b));
    resIsX_uid62_fpLogE1pxTest_c(0) <= resIsX_uid62_fpLogE1pxTest_o(13);


	--InvResIsX_uid72_fpLogE1pxTest(LOGICAL,71)@0
    InvResIsX_uid72_fpLogE1pxTest_a <= resIsX_uid62_fpLogE1pxTest_c;
    InvResIsX_uid72_fpLogE1pxTest_q <= not InvResIsX_uid72_fpLogE1pxTest_a;

	--branch22_uid66_fpLogE1pxTest(COMPARE,65)@0
    branch22_uid66_fpLogE1pxTest_cin <= GND_q;
    branch22_uid66_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("00" & expX_uid6_fpLogE1pxTest_b) & '0';
    branch22_uid66_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00" & cstBias_uid9_fpLogE1pxTest_q) & branch22_uid66_fpLogE1pxTest_cin(0);
            branch22_uid66_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(branch22_uid66_fpLogE1pxTest_a) - UNSIGNED(branch22_uid66_fpLogE1pxTest_b));
    branch22_uid66_fpLogE1pxTest_c(0) <= branch22_uid66_fpLogE1pxTest_o(13);
    branch22_uid66_fpLogE1pxTest_n(0) <= not branch22_uid66_fpLogE1pxTest_o(13);


	--branch4_uid75_fpLogE1pxTest(LOGICAL,74)@0
    branch4_uid75_fpLogE1pxTest_a <= branch22_uid66_fpLogE1pxTest_c;
    branch4_uid75_fpLogE1pxTest_b <= InvResIsX_uid72_fpLogE1pxTest_q;
    branch4_uid75_fpLogE1pxTest_c <= signX_uid7_fpLogE1pxTest_b;
    branch4_uid75_fpLogE1pxTest_q <= branch4_uid75_fpLogE1pxTest_a and branch4_uid75_fpLogE1pxTest_b and branch4_uid75_fpLogE1pxTest_c;

	--ld_branch4_uid75_fpLogE1pxTest_q_to_c_uid87_fpLogE1pxTest_a(DELAY,732)@0
    ld_branch4_uid75_fpLogE1pxTest_q_to_c_uid87_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 10 )
    PORT MAP ( xin => branch4_uid75_fpLogE1pxTest_q, xout => ld_branch4_uid75_fpLogE1pxTest_q_to_c_uid87_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--c_uid87_fpLogE1pxTest(LOGICAL,86)@10
    c_uid87_fpLogE1pxTest_a <= ld_branch4_uid75_fpLogE1pxTest_q_to_c_uid87_fpLogE1pxTest_a_q;
    c_uid87_fpLogE1pxTest_b <= ld_expXIsMo_uid86_fpLogE1pxTest_c_to_c_uid87_fpLogE1pxTest_b_q;
    c_uid87_fpLogE1pxTest_q <= c_uid87_fpLogE1pxTest_a and c_uid87_fpLogE1pxTest_b;

	--reg_c_uid87_fpLogE1pxTest_0_to_addr_uid90_fpLogE1pxTest_1(REG,529)@10
    reg_c_uid87_fpLogE1pxTest_0_to_addr_uid90_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_c_uid87_fpLogE1pxTest_0_to_addr_uid90_fpLogE1pxTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_c_uid87_fpLogE1pxTest_0_to_addr_uid90_fpLogE1pxTest_1_q <= c_uid87_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_nor(LOGICAL,1496)
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_nor_b <= ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_sticky_ena_q;
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_nor_q <= not (ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_nor_a or ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_nor_b);

	--ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_mem_top(CONSTANT,1492)
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_mem_top_q <= "0111";

	--ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmp(LOGICAL,1493)
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmp_a <= ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_mem_top_q;
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdmux_q);
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmp_q <= "1" when ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmp_a = ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmp_b else "0";

	--ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmpReg(REG,1494)
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmpReg_q <= ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_sticky_ena(REG,1497)
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_nor_q = "1") THEN
                ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_sticky_ena_q <= ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_enaAnd(LOGICAL,1498)
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_enaAnd_a <= ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_sticky_ena_q;
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_enaAnd_b <= en;
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_enaAnd_q <= ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_enaAnd_a and ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_enaAnd_b;

	--shifterAddrExt_uid34_fpLogE1pxTest(SUB,33)@0
    shifterAddrExt_uid34_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & cstBias_uid9_fpLogE1pxTest_q);
    shifterAddrExt_uid34_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("0" & expX_uid6_fpLogE1pxTest_b);
            shifterAddrExt_uid34_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shifterAddrExt_uid34_fpLogE1pxTest_a) - UNSIGNED(shifterAddrExt_uid34_fpLogE1pxTest_b));
    shifterAddrExt_uid34_fpLogE1pxTest_q <= shifterAddrExt_uid34_fpLogE1pxTest_o(11 downto 0);


	--shifterAddr_uid35_fpLogE1pxTest(BITSELECT,34)@0
    shifterAddr_uid35_fpLogE1pxTest_in <= shifterAddrExt_uid34_fpLogE1pxTest_q(5 downto 0);
    shifterAddr_uid35_fpLogE1pxTest_b <= shifterAddr_uid35_fpLogE1pxTest_in(5 downto 0);

	--reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0(REG,645)@0
    reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q <= shifterAddr_uid35_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_inputreg(DELAY,1486)
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q, xout => ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdcnt(COUNTER,1488)
    -- every=1, low=0, high=7, step=1, init=1
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdcnt_i <= ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdcnt_i,3));


	--ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdreg(REG,1489)
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdreg_q <= ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdmux(MUX,1490)
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdmux_s <= en;
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdmux: PROCESS (ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdmux_s, ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdreg_q, ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdmux_q <= ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdmux_q <= ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem(DUALMEM,1487)
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_ia <= ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_inputreg_q;
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_aa <= ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdreg_q;
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_ab <= ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_rdmux_q;
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 6,
        widthad_b => 3,
        numwords_b => 8,
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
        clocken1 => ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_iq,
        address_a => ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_aa,
        data_a => ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_ia
    );
    ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_reset0 <= areset;
        ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_q <= ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_iq(5 downto 0);

	--branch4ExpCorrection_uid118_fpLogE1pxTest(SUB,117)@11
    branch4ExpCorrection_uid118_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & ld_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q_to_branch4ExpCorrection_uid118_fpLogE1pxTest_a_replace_mem_q);
    branch4ExpCorrection_uid118_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("000000" & reg_c_uid87_fpLogE1pxTest_0_to_addr_uid90_fpLogE1pxTest_1_q);
            branch4ExpCorrection_uid118_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(branch4ExpCorrection_uid118_fpLogE1pxTest_a) - UNSIGNED(branch4ExpCorrection_uid118_fpLogE1pxTest_b));
    branch4ExpCorrection_uid118_fpLogE1pxTest_q <= branch4ExpCorrection_uid118_fpLogE1pxTest_o(6 downto 0);


	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_inputreg(DELAY,1499)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => branch4ExpCorrection_uid118_fpLogE1pxTest_q, xout => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt(COUNTER,1501)
    -- every=1, low=0, high=35, step=1, init=1
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i = 34 THEN
                      ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_eq = '1') THEN
                        ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i - 35;
                    ELSE
                        ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i,6));


	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg(REG,1502)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg_q <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux(MUX,1503)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_s <= en;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux: PROCESS (ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_s, ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg_q, ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_q <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg_q;
                  WHEN "1" => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_q <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem(DUALMEM,1500)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_ia <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_inputreg_q;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_aa <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg_q;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_ab <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_q;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 6,
        numwords_a => 36,
        width_b => 7,
        widthad_b => 6,
        numwords_b => 36,
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
        clocken1 => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_iq,
        address_a => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_aa,
        data_a => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_ia
    );
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_reset0 <= areset;
        ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_q <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_iq(6 downto 0);

	--zs_uid319_countZ_uid114_fpLogE1pxTest(CONSTANT,318)
    zs_uid319_countZ_uid114_fpLogE1pxTest_q <= "0000000000000000000000000000000000000000000000000000000000000000";

	--ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_nor(LOGICAL,1433)
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_nor_b <= ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_sticky_ena_q;
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_nor_q <= not (ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_nor_a or ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_nor_b);

	--ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_cmpReg(REG,1342)
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_sticky_ena(REG,1434)
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_nor_q = "1") THEN
                ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_sticky_ena_q <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_enaAnd(LOGICAL,1435)
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_enaAnd_a <= ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_sticky_ena_q;
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_enaAnd_b <= en;
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_enaAnd_q <= ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_enaAnd_a and ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_enaAnd_b;

	--X56dto0_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,234)@8
    X56dto0_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= redLO_uid47_fpLogE1pxTest_b(56 downto 0);
    X56dto0_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= X56dto0_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_in(56 downto 0);

	--rightShiftStage0Idx3Pad48_uid163_fracXRSExt_uid36_fpLogE1pxTest(CONSTANT,162)
    rightShiftStage0Idx3Pad48_uid163_fracXRSExt_uid36_fpLogE1pxTest_q <= "000000000000000000000000000000000000000000000000";

	--leftShiftStage0Idx3_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,235)@8
    leftShiftStage0Idx3_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= X56dto0_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_b & rightShiftStage0Idx3Pad48_uid163_fracXRSExt_uid36_fpLogE1pxTest_q;

	--X72dto0_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,231)@8
    X72dto0_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= redLO_uid47_fpLogE1pxTest_b(72 downto 0);
    X72dto0_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= X72dto0_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_in(72 downto 0);

	--rightShiftStage0Idx2Pad32_uid160_fracXRSExt_uid36_fpLogE1pxTest(CONSTANT,159)
    rightShiftStage0Idx2Pad32_uid160_fracXRSExt_uid36_fpLogE1pxTest_q <= "00000000000000000000000000000000";

	--leftShiftStage0Idx2_uid233_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,232)@8
    leftShiftStage0Idx2_uid233_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= X72dto0_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_b & rightShiftStage0Idx2Pad32_uid160_fracXRSExt_uid36_fpLogE1pxTest_q;

	--X88dto0_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,228)@8
    X88dto0_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= redLO_uid47_fpLogE1pxTest_b(88 downto 0);
    X88dto0_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= X88dto0_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_in(88 downto 0);

	--rightShiftStage0Idx1Pad16_uid157_fracXRSExt_uid36_fpLogE1pxTest(CONSTANT,156)
    rightShiftStage0Idx1Pad16_uid157_fracXRSExt_uid36_fpLogE1pxTest_q <= "0000000000000000";

	--leftShiftStage0Idx1_uid230_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,229)@8
    leftShiftStage0Idx1_uid230_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= X88dto0_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_b & rightShiftStage0Idx1Pad16_uid157_fracXRSExt_uid36_fpLogE1pxTest_q;

	--ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_nor(LOGICAL,1344)
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_nor_b <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_sticky_ena_q;
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_nor_q <= not (ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_nor_a or ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_nor_b);

	--ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_sticky_ena(REG,1345)
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_nor_q = "1") THEN
                ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_sticky_ena_q <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_enaAnd(LOGICAL,1346)
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_enaAnd_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_sticky_ena_q;
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_enaAnd_b <= en;
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_enaAnd_q <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_enaAnd_a and ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_enaAnd_b;

	--X105dto48_uid162_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,161)@1
    X105dto48_uid162_fracXRSExt_uid36_fpLogE1pxTest_in <= rightPaddedIn_uid37_fpLogE1pxTest_q;
    X105dto48_uid162_fracXRSExt_uid36_fpLogE1pxTest_b <= X105dto48_uid162_fracXRSExt_uid36_fpLogE1pxTest_in(105 downto 48);

	--rightShiftStage0Idx3_uid164_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,163)@1
    rightShiftStage0Idx3_uid164_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage0Idx3Pad48_uid163_fracXRSExt_uid36_fpLogE1pxTest_q & X105dto48_uid162_fracXRSExt_uid36_fpLogE1pxTest_b;

	--X105dto32_uid159_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,158)@1
    X105dto32_uid159_fracXRSExt_uid36_fpLogE1pxTest_in <= rightPaddedIn_uid37_fpLogE1pxTest_q;
    X105dto32_uid159_fracXRSExt_uid36_fpLogE1pxTest_b <= X105dto32_uid159_fracXRSExt_uid36_fpLogE1pxTest_in(105 downto 32);

	--rightShiftStage0Idx2_uid161_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,160)@1
    rightShiftStage0Idx2_uid161_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage0Idx2Pad32_uid160_fracXRSExt_uid36_fpLogE1pxTest_q & X105dto32_uid159_fracXRSExt_uid36_fpLogE1pxTest_b;

	--X105dto16_uid156_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,155)@1
    X105dto16_uid156_fracXRSExt_uid36_fpLogE1pxTest_in <= rightPaddedIn_uid37_fpLogE1pxTest_q;
    X105dto16_uid156_fracXRSExt_uid36_fpLogE1pxTest_b <= X105dto16_uid156_fracXRSExt_uid36_fpLogE1pxTest_in(105 downto 16);

	--rightShiftStage0Idx1_uid158_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,157)@1
    rightShiftStage0Idx1_uid158_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage0Idx1Pad16_uid157_fracXRSExt_uid36_fpLogE1pxTest_q & X105dto16_uid156_fracXRSExt_uid36_fpLogE1pxTest_b;

	--oFracX_uid32_fpLogE1pxTest(BITJOIN,31)@1
    oFracX_uid32_fpLogE1pxTest_q <= VCC_q & frac_uid22_fpLogE1pxTest_b;

	--padConst_uid36_fpLogE1pxTest(CONSTANT,35)
    padConst_uid36_fpLogE1pxTest_q <= "00000000000000000000000000000000000000000000000000000";

	--rightPaddedIn_uid37_fpLogE1pxTest(BITJOIN,36)@1
    rightPaddedIn_uid37_fpLogE1pxTest_q <= oFracX_uid32_fpLogE1pxTest_q & padConst_uid36_fpLogE1pxTest_q;

	--rightShiftStageSel5Dto4_uid165_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,164)@0
    rightShiftStageSel5Dto4_uid165_fracXRSExt_uid36_fpLogE1pxTest_in <= shifterAddr_uid35_fpLogE1pxTest_b;
    rightShiftStageSel5Dto4_uid165_fracXRSExt_uid36_fpLogE1pxTest_b <= rightShiftStageSel5Dto4_uid165_fracXRSExt_uid36_fpLogE1pxTest_in(5 downto 4);

	--reg_rightShiftStageSel5Dto4_uid165_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_1(REG,499)@0
    reg_rightShiftStageSel5Dto4_uid165_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel5Dto4_uid165_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel5Dto4_uid165_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_1_q <= rightShiftStageSel5Dto4_uid165_fracXRSExt_uid36_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest(MUX,165)@1
    rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_s <= reg_rightShiftStageSel5Dto4_uid165_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_1_q;
    rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest: PROCESS (rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_s, en, rightPaddedIn_uid37_fpLogE1pxTest_q, rightShiftStage0Idx1_uid158_fracXRSExt_uid36_fpLogE1pxTest_q, rightShiftStage0Idx2_uid161_fracXRSExt_uid36_fpLogE1pxTest_q, rightShiftStage0Idx3_uid164_fracXRSExt_uid36_fpLogE1pxTest_q)
    BEGIN
            CASE rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_s IS
                  WHEN "00" => rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q <= rightPaddedIn_uid37_fpLogE1pxTest_q;
                  WHEN "01" => rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage0Idx1_uid158_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN "10" => rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage0Idx2_uid161_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN "11" => rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage0Idx3_uid164_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN OTHERS => rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage0105dto12_uid173_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,172)@1
    RightShiftStage0105dto12_uid173_fracXRSExt_uid36_fpLogE1pxTest_in <= rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q;
    RightShiftStage0105dto12_uid173_fracXRSExt_uid36_fpLogE1pxTest_b <= RightShiftStage0105dto12_uid173_fracXRSExt_uid36_fpLogE1pxTest_in(105 downto 12);

	--ld_RightShiftStage0105dto12_uid173_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_a(DELAY,829)@1
    ld_RightShiftStage0105dto12_uid173_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 94, depth => 1 )
    PORT MAP ( xin => RightShiftStage0105dto12_uid173_fracXRSExt_uid36_fpLogE1pxTest_b, xout => ld_RightShiftStage0105dto12_uid173_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,174)@2
    rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage1Idx3Pad12_uid174_fracXRSExt_uid36_fpLogE1pxTest_q & ld_RightShiftStage0105dto12_uid173_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_a_q;

	--rightShiftStage1Idx2Pad8_uid171_fracXRSExt_uid36_fpLogE1pxTest(CONSTANT,170)
    rightShiftStage1Idx2Pad8_uid171_fracXRSExt_uid36_fpLogE1pxTest_q <= "00000000";

	--RightShiftStage0105dto8_uid170_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,169)@1
    RightShiftStage0105dto8_uid170_fracXRSExt_uid36_fpLogE1pxTest_in <= rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q;
    RightShiftStage0105dto8_uid170_fracXRSExt_uid36_fpLogE1pxTest_b <= RightShiftStage0105dto8_uid170_fracXRSExt_uid36_fpLogE1pxTest_in(105 downto 8);

	--ld_RightShiftStage0105dto8_uid170_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_a(DELAY,827)@1
    ld_RightShiftStage0105dto8_uid170_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 98, depth => 1 )
    PORT MAP ( xin => RightShiftStage0105dto8_uid170_fracXRSExt_uid36_fpLogE1pxTest_b, xout => ld_RightShiftStage0105dto8_uid170_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,171)@2
    rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage1Idx2Pad8_uid171_fracXRSExt_uid36_fpLogE1pxTest_q & ld_RightShiftStage0105dto8_uid170_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_a_q;

	--rightShiftStage1Idx1Pad4_uid168_fracXRSExt_uid36_fpLogE1pxTest(CONSTANT,167)
    rightShiftStage1Idx1Pad4_uid168_fracXRSExt_uid36_fpLogE1pxTest_q <= "0000";

	--RightShiftStage0105dto4_uid167_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,166)@1
    RightShiftStage0105dto4_uid167_fracXRSExt_uid36_fpLogE1pxTest_in <= rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q;
    RightShiftStage0105dto4_uid167_fracXRSExt_uid36_fpLogE1pxTest_b <= RightShiftStage0105dto4_uid167_fracXRSExt_uid36_fpLogE1pxTest_in(105 downto 4);

	--ld_RightShiftStage0105dto4_uid167_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_a(DELAY,825)@1
    ld_RightShiftStage0105dto4_uid167_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 102, depth => 1 )
    PORT MAP ( xin => RightShiftStage0105dto4_uid167_fracXRSExt_uid36_fpLogE1pxTest_b, xout => ld_RightShiftStage0105dto4_uid167_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,168)@2
    rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage1Idx1Pad4_uid168_fracXRSExt_uid36_fpLogE1pxTest_q & ld_RightShiftStage0105dto4_uid167_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_a_q;

	--reg_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_2(REG,501)@1
    reg_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_2_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_2_q <= rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,175)@0
    rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_in <= shifterAddr_uid35_fpLogE1pxTest_b(3 downto 0);
    rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_b <= rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_in(3 downto 2);

	--ld_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_b_to_reg_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_a(DELAY,1183)@0
    ld_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_b_to_reg_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_b, xout => ld_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_b_to_reg_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1(REG,500)@1
    reg_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_q <= ld_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_b_to_reg_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest(MUX,176)@2
    rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_s <= reg_rightShiftStageSel3Dto2_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_q;
    rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest: PROCESS (rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_s, en, reg_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_2_q, rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_q, rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_q, rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_q)
    BEGIN
            CASE rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_s IS
                  WHEN "00" => rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q <= reg_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_2_q;
                  WHEN "01" => rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN "10" => rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN "11" => rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN OTHERS => rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage1105dto3_uid184_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,183)@2
    RightShiftStage1105dto3_uid184_fracXRSExt_uid36_fpLogE1pxTest_in <= rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q;
    RightShiftStage1105dto3_uid184_fracXRSExt_uid36_fpLogE1pxTest_b <= RightShiftStage1105dto3_uid184_fracXRSExt_uid36_fpLogE1pxTest_in(105 downto 3);

	--ld_RightShiftStage1105dto3_uid184_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx3_uid186_fracXRSExt_uid36_fpLogE1pxTest_a(DELAY,841)@2
    ld_RightShiftStage1105dto3_uid184_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx3_uid186_fracXRSExt_uid36_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 103, depth => 1 )
    PORT MAP ( xin => RightShiftStage1105dto3_uid184_fracXRSExt_uid36_fpLogE1pxTest_b, xout => ld_RightShiftStage1105dto3_uid184_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx3_uid186_fracXRSExt_uid36_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx3_uid186_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,185)@3
    rightShiftStage2Idx3_uid186_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage2Idx3Pad3_uid185_fracXRSExt_uid36_fpLogE1pxTest_q & ld_RightShiftStage1105dto3_uid184_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx3_uid186_fracXRSExt_uid36_fpLogE1pxTest_a_q;

	--z2_uid100_fpLogE1pxTest(CONSTANT,99)
    z2_uid100_fpLogE1pxTest_q <= "00";

	--RightShiftStage1105dto2_uid181_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,180)@2
    RightShiftStage1105dto2_uid181_fracXRSExt_uid36_fpLogE1pxTest_in <= rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q;
    RightShiftStage1105dto2_uid181_fracXRSExt_uid36_fpLogE1pxTest_b <= RightShiftStage1105dto2_uid181_fracXRSExt_uid36_fpLogE1pxTest_in(105 downto 2);

	--ld_RightShiftStage1105dto2_uid181_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx2_uid183_fracXRSExt_uid36_fpLogE1pxTest_a(DELAY,839)@2
    ld_RightShiftStage1105dto2_uid181_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx2_uid183_fracXRSExt_uid36_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 104, depth => 1 )
    PORT MAP ( xin => RightShiftStage1105dto2_uid181_fracXRSExt_uid36_fpLogE1pxTest_b, xout => ld_RightShiftStage1105dto2_uid181_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx2_uid183_fracXRSExt_uid36_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx2_uid183_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,182)@3
    rightShiftStage2Idx2_uid183_fracXRSExt_uid36_fpLogE1pxTest_q <= z2_uid100_fpLogE1pxTest_q & ld_RightShiftStage1105dto2_uid181_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx2_uid183_fracXRSExt_uid36_fpLogE1pxTest_a_q;

	--RightShiftStage1105dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,177)@2
    RightShiftStage1105dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_in <= rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q;
    RightShiftStage1105dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_b <= RightShiftStage1105dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_in(105 downto 1);

	--ld_RightShiftStage1105dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest_a(DELAY,837)@2
    ld_RightShiftStage1105dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 105, depth => 1 )
    PORT MAP ( xin => RightShiftStage1105dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_b, xout => ld_RightShiftStage1105dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,179)@3
    rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest_q <= GND_q & ld_RightShiftStage1105dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest_a_q;

	--reg_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_2(REG,503)@2
    reg_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_2_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_2_q <= rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,186)@0
    rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_in <= shifterAddr_uid35_fpLogE1pxTest_b(1 downto 0);
    rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_b <= rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_in(1 downto 0);

	--reg_rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_1(REG,502)@0
    reg_rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_1_q <= rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_1_q_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_b(DELAY,843)@1
    ld_reg_rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_1_q_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 2 )
    PORT MAP ( xin => reg_rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_1_q, xout => ld_reg_rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_1_q_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest(MUX,187)@3
    rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_s <= ld_reg_rightShiftStageSel1Dto0_uid187_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_1_q_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_b_q;
    rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest: PROCESS (rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_s, en, reg_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_2_q, rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest_q, rightShiftStage2Idx2_uid183_fracXRSExt_uid36_fpLogE1pxTest_q, rightShiftStage2Idx3_uid186_fracXRSExt_uid36_fpLogE1pxTest_q)
    BEGIN
            CASE rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_s IS
                  WHEN "00" => rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_q <= reg_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_2_q;
                  WHEN "01" => rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN "10" => rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage2Idx2_uid183_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN "11" => rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage2Idx3_uid186_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN OTHERS => rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--reg_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_1(REG,505)@3
    reg_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_1_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_1_q <= rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--pad_o_uid12_uid40_fpLogE1pxTest(BITJOIN,39)@3
    pad_o_uid12_uid40_fpLogE1pxTest_q <= VCC_q & STD_LOGIC_VECTOR((104 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_o_uid12_uid40_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_0(REG,504)@3
    reg_pad_o_uid12_uid40_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_o_uid12_uid40_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_0_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_o_uid12_uid40_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_0_q <= pad_o_uid12_uid40_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--oMfracXRSExt_uid40_fpLogE1pxTest(SUB,40)@4
    oMfracXRSExt_uid40_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & reg_pad_o_uid12_uid40_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_0_q);
    oMfracXRSExt_uid40_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("0" & reg_rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_1_q);
            oMfracXRSExt_uid40_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMfracXRSExt_uid40_fpLogE1pxTest_a) - UNSIGNED(oMfracXRSExt_uid40_fpLogE1pxTest_b));
    oMfracXRSExt_uid40_fpLogE1pxTest_q <= oMfracXRSExt_uid40_fpLogE1pxTest_o(106 downto 0);


	--ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_inputreg(DELAY,1336)
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 107, depth => 1 )
    PORT MAP ( xin => oMfracXRSExt_uid40_fpLogE1pxTest_q, xout => ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem(DUALMEM,1337)
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_ia <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_inputreg_q;
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_aa <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg_q;
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_ab <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_q;
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 107,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 107,
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
        clocken1 => ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_iq,
        address_a => ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_aa,
        data_a => ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_ia
    );
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_reset0 <= areset;
        ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_q <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_iq(106 downto 0);

	--redLO_uid47_fpLogE1pxTest(BITSELECT,46)@8
    redLO_uid47_fpLogE1pxTest_in <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_mem_q(104 downto 0);
    redLO_uid47_fpLogE1pxTest_b <= redLO_uid47_fpLogE1pxTest_in(104 downto 0);

	--oMfracXRSLZCIn_uid43_fpLogE1pxTest(BITSELECT,42)@4
    oMfracXRSLZCIn_uid43_fpLogE1pxTest_in <= oMfracXRSExt_uid40_fpLogE1pxTest_q(104 downto 0);
    oMfracXRSLZCIn_uid43_fpLogE1pxTest_b <= oMfracXRSLZCIn_uid43_fpLogE1pxTest_in(104 downto 52);

	--rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,190)@4
    rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest_in <= oMfracXRSLZCIn_uid43_fpLogE1pxTest_b;
    rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest_b <= rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest_in(52 downto 21);

	--reg_rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_1(REG,506)@4
    reg_rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_1_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_1_q <= rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid192_leadingZeros_uid44_fpLogE1pxTest(LOGICAL,191)@5
    vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_a <= reg_rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_1_q;
    vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_b <= rightShiftStage0Idx2Pad32_uid160_fracXRSExt_uid36_fpLogE1pxTest_q;
    vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_q <= "1" when vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_a = vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_b else "0";

	--reg_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_5(REG,518)@5
    reg_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_5_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_5_q <= vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_5_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_f(DELAY,886)@6
    ld_reg_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_5_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => reg_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_5_q, xout => ld_reg_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_5_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid194_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,193)@4
    vStage_uid194_leadingZeros_uid44_fpLogE1pxTest_in <= oMfracXRSLZCIn_uid43_fpLogE1pxTest_b(20 downto 0);
    vStage_uid194_leadingZeros_uid44_fpLogE1pxTest_b <= vStage_uid194_leadingZeros_uid44_fpLogE1pxTest_in(20 downto 0);

	--mO_uid193_leadingZeros_uid44_fpLogE1pxTest(CONSTANT,192)
    mO_uid193_leadingZeros_uid44_fpLogE1pxTest_q <= "11111111111";

	--cStage_uid195_leadingZeros_uid44_fpLogE1pxTest(BITJOIN,194)@4
    cStage_uid195_leadingZeros_uid44_fpLogE1pxTest_q <= vStage_uid194_leadingZeros_uid44_fpLogE1pxTest_b & mO_uid193_leadingZeros_uid44_fpLogE1pxTest_q;

	--reg_cStage_uid195_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_3(REG,508)@4
    reg_cStage_uid195_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid195_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_3_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid195_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_3_q <= cStage_uid195_leadingZeros_uid44_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest(MUX,196)@5
    vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_s <= vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_q;
    vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest: PROCESS (vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_s, en, reg_rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_1_q, reg_cStage_uid195_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_3_q)
    BEGIN
            CASE vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_q <= reg_rVStage_uid191_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_1_q;
                  WHEN "1" => vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_q <= reg_cStage_uid195_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_3_q;
                  WHEN OTHERS => vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,198)@5
    rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_q;
    rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_b <= rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_in(31 downto 16);

	--reg_rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_1(REG,509)@5
    reg_rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_1_q <= rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid200_leadingZeros_uid44_fpLogE1pxTest(LOGICAL,199)@6
    vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_a <= reg_rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_1_q;
    vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_b <= rightShiftStage0Idx1Pad16_uid157_fracXRSExt_uid36_fpLogE1pxTest_q;
    vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_q <= "1" when vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_a = vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_b else "0";

	--reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_4(REG,517)@6
    reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_4_q <= vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_4_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_e(DELAY,885)@7
    ld_reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_4_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_4_q, xout => ld_reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_4_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid201_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,200)@5
    vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_q(15 downto 0);
    vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_b <= vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_in(15 downto 0);

	--reg_vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_3(REG,511)@5
    reg_vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_3_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_3_q <= vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest(MUX,202)@6
    vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_s <= vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_q;
    vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest: PROCESS (vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_s, en, reg_rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_1_q, reg_vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_3_q)
    BEGIN
            CASE vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_q <= reg_rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_1_q;
                  WHEN "1" => vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_q <= reg_vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_3_q;
                  WHEN OTHERS => vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,204)@6
    rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_q;
    rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_b <= rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_in(15 downto 8);

	--vCount_uid206_leadingZeros_uid44_fpLogE1pxTest(LOGICAL,205)@6
    vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_a <= rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_b;
    vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_b <= rightShiftStage1Idx2Pad8_uid171_fracXRSExt_uid36_fpLogE1pxTest_q;
    vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q_i <= "1" when vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_a = vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_b else "0";
    vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q, xin => vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_d(DELAY,884)@7
    ld_vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q, xout => ld_vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid207_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,206)@6
    vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_q(7 downto 0);
    vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_b <= vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_in(7 downto 0);

	--reg_vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_3(REG,513)@6
    reg_vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_3_q <= vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_2(REG,512)@6
    reg_rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_2_q <= rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest(MUX,208)@7
    vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_s <= vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q;
    vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest: PROCESS (vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_s, en, reg_rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_2_q, reg_vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_3_q)
    BEGIN
            CASE vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_q <= reg_rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_2_q;
                  WHEN "1" => vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_q <= reg_vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_3_q;
                  WHEN OTHERS => vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,210)@7
    rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_q;
    rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest_b <= rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest_in(7 downto 4);

	--vCount_uid212_leadingZeros_uid44_fpLogE1pxTest(LOGICAL,211)@7
    vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_a <= rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest_b;
    vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_b <= rightShiftStage1Idx1Pad4_uid168_fracXRSExt_uid36_fpLogE1pxTest_q;
    vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_q <= "1" when vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_a = vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_b else "0";

	--reg_vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_2(REG,516)@7
    reg_vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_2_q <= vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid213_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,212)@7
    vStage_uid213_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_q(3 downto 0);
    vStage_uid213_leadingZeros_uid44_fpLogE1pxTest_b <= vStage_uid213_leadingZeros_uid44_fpLogE1pxTest_in(3 downto 0);

	--vStagei_uid215_leadingZeros_uid44_fpLogE1pxTest(MUX,214)@7
    vStagei_uid215_leadingZeros_uid44_fpLogE1pxTest_s <= vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_q;
    vStagei_uid215_leadingZeros_uid44_fpLogE1pxTest: PROCESS (vStagei_uid215_leadingZeros_uid44_fpLogE1pxTest_s, en, rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest_b, vStage_uid213_leadingZeros_uid44_fpLogE1pxTest_b)
    BEGIN
            CASE vStagei_uid215_leadingZeros_uid44_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid215_leadingZeros_uid44_fpLogE1pxTest_q <= rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest_b;
                  WHEN "1" => vStagei_uid215_leadingZeros_uid44_fpLogE1pxTest_q <= vStage_uid213_leadingZeros_uid44_fpLogE1pxTest_b;
                  WHEN OTHERS => vStagei_uid215_leadingZeros_uid44_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,216)@7
    rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid215_leadingZeros_uid44_fpLogE1pxTest_q;
    rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest_b <= rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest_in(3 downto 2);

	--vCount_uid218_leadingZeros_uid44_fpLogE1pxTest(LOGICAL,217)@7
    vCount_uid218_leadingZeros_uid44_fpLogE1pxTest_a <= rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest_b;
    vCount_uid218_leadingZeros_uid44_fpLogE1pxTest_b <= z2_uid100_fpLogE1pxTest_q;
    vCount_uid218_leadingZeros_uid44_fpLogE1pxTest_q_i <= "1" when vCount_uid218_leadingZeros_uid44_fpLogE1pxTest_a = vCount_uid218_leadingZeros_uid44_fpLogE1pxTest_b else "0";
    vCount_uid218_leadingZeros_uid44_fpLogE1pxTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => vCount_uid218_leadingZeros_uid44_fpLogE1pxTest_q, xin => vCount_uid218_leadingZeros_uid44_fpLogE1pxTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--vStage_uid219_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,218)@7
    vStage_uid219_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid215_leadingZeros_uid44_fpLogE1pxTest_q(1 downto 0);
    vStage_uid219_leadingZeros_uid44_fpLogE1pxTest_b <= vStage_uid219_leadingZeros_uid44_fpLogE1pxTest_in(1 downto 0);

	--reg_vStage_uid219_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_3(REG,515)@7
    reg_vStage_uid219_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid219_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_3_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid219_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_3_q <= vStage_uid219_leadingZeros_uid44_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_2(REG,514)@7
    reg_rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_2_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_2_q <= rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest(MUX,220)@8
    vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_s <= vCount_uid218_leadingZeros_uid44_fpLogE1pxTest_q;
    vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest: PROCESS (vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_s, en, reg_rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_2_q, reg_vStage_uid219_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_3_q)
    BEGIN
            CASE vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_q <= reg_rVStage_uid217_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_2_q;
                  WHEN "1" => vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_q <= reg_vStage_uid219_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_3_q;
                  WHEN OTHERS => vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid223_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,222)@8
    rVStage_uid223_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid221_leadingZeros_uid44_fpLogE1pxTest_q;
    rVStage_uid223_leadingZeros_uid44_fpLogE1pxTest_b <= rVStage_uid223_leadingZeros_uid44_fpLogE1pxTest_in(1 downto 1);

	--vCount_uid224_leadingZeros_uid44_fpLogE1pxTest(LOGICAL,223)@8
    vCount_uid224_leadingZeros_uid44_fpLogE1pxTest_a <= rVStage_uid223_leadingZeros_uid44_fpLogE1pxTest_b;
    vCount_uid224_leadingZeros_uid44_fpLogE1pxTest_b <= GND_q;
    vCount_uid224_leadingZeros_uid44_fpLogE1pxTest_q <= "1" when vCount_uid224_leadingZeros_uid44_fpLogE1pxTest_a = vCount_uid224_leadingZeros_uid44_fpLogE1pxTest_b else "0";

	--r_uid225_leadingZeros_uid44_fpLogE1pxTest(BITJOIN,224)@8
    r_uid225_leadingZeros_uid44_fpLogE1pxTest_q <= ld_reg_vCount_uid192_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_5_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_f_q & ld_reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_4_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_e_q & ld_vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_d_q & reg_vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid225_leadingZeros_uid44_fpLogE1pxTest_2_q & vCount_uid218_leadingZeros_uid44_fpLogE1pxTest_q & vCount_uid224_leadingZeros_uid44_fpLogE1pxTest_q;

	--leftShiftStageSel5Dto4_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,236)@8
    leftShiftStageSel5Dto4_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= r_uid225_leadingZeros_uid44_fpLogE1pxTest_q;
    leftShiftStageSel5Dto4_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= leftShiftStageSel5Dto4_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_in(5 downto 4);

	--leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest(MUX,237)@8
    leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_s <= leftShiftStageSel5Dto4_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_b;
    leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest: PROCESS (leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_s, en, redLO_uid47_fpLogE1pxTest_b, leftShiftStage0Idx1_uid230_fracXBranch4Ext_uid48_fpLogE1pxTest_q, leftShiftStage0Idx2_uid233_fracXBranch4Ext_uid48_fpLogE1pxTest_q, leftShiftStage0Idx3_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_q)
    BEGIN
            CASE leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_s IS
                  WHEN "00" => leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= redLO_uid47_fpLogE1pxTest_b;
                  WHEN "01" => leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= leftShiftStage0Idx1_uid230_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
                  WHEN "10" => leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= leftShiftStage0Idx2_uid233_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
                  WHEN "11" => leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= leftShiftStage0Idx3_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
                  WHEN OTHERS => leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage092dto0_uid246_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,245)@8
    LeftShiftStage092dto0_uid246_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_q(92 downto 0);
    LeftShiftStage092dto0_uid246_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= LeftShiftStage092dto0_uid246_fracXBranch4Ext_uid48_fpLogE1pxTest_in(92 downto 0);

	--rightShiftStage1Idx3Pad12_uid174_fracXRSExt_uid36_fpLogE1pxTest(CONSTANT,173)
    rightShiftStage1Idx3Pad12_uid174_fracXRSExt_uid36_fpLogE1pxTest_q <= "000000000000";

	--leftShiftStage1Idx3_uid247_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,246)@8
    leftShiftStage1Idx3_uid247_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= LeftShiftStage092dto0_uid246_fracXBranch4Ext_uid48_fpLogE1pxTest_b & rightShiftStage1Idx3Pad12_uid174_fracXRSExt_uid36_fpLogE1pxTest_q;

	--reg_leftShiftStage1Idx3_uid247_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_5(REG,523)@8
    reg_leftShiftStage1Idx3_uid247_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid247_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_5_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid247_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_5_q <= leftShiftStage1Idx3_uid247_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage096dto0_uid243_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,242)@8
    LeftShiftStage096dto0_uid243_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_q(96 downto 0);
    LeftShiftStage096dto0_uid243_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= LeftShiftStage096dto0_uid243_fracXBranch4Ext_uid48_fpLogE1pxTest_in(96 downto 0);

	--leftShiftStage1Idx2_uid244_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,243)@8
    leftShiftStage1Idx2_uid244_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= LeftShiftStage096dto0_uid243_fracXBranch4Ext_uid48_fpLogE1pxTest_b & rightShiftStage1Idx2Pad8_uid171_fracXRSExt_uid36_fpLogE1pxTest_q;

	--reg_leftShiftStage1Idx2_uid244_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_4(REG,522)@8
    reg_leftShiftStage1Idx2_uid244_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid244_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_4_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid244_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_4_q <= leftShiftStage1Idx2_uid244_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage0100dto0_uid240_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,239)@8
    LeftShiftStage0100dto0_uid240_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_q(100 downto 0);
    LeftShiftStage0100dto0_uid240_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= LeftShiftStage0100dto0_uid240_fracXBranch4Ext_uid48_fpLogE1pxTest_in(100 downto 0);

	--leftShiftStage1Idx1_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,240)@8
    leftShiftStage1Idx1_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= LeftShiftStage0100dto0_uid240_fracXBranch4Ext_uid48_fpLogE1pxTest_b & rightShiftStage1Idx1Pad4_uid168_fracXRSExt_uid36_fpLogE1pxTest_q;

	--reg_leftShiftStage1Idx1_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_3(REG,521)@8
    reg_leftShiftStage1Idx1_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_3_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_3_q <= leftShiftStage1Idx1_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_2(REG,520)@8
    reg_leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q <= leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel3Dto2_uid248_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,247)@8
    leftShiftStageSel3Dto2_uid248_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= r_uid225_leadingZeros_uid44_fpLogE1pxTest_q(3 downto 0);
    leftShiftStageSel3Dto2_uid248_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= leftShiftStageSel3Dto2_uid248_fracXBranch4Ext_uid48_fpLogE1pxTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid248_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_1(REG,519)@8
    reg_leftShiftStageSel3Dto2_uid248_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid248_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid248_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q <= leftShiftStageSel3Dto2_uid248_fracXBranch4Ext_uid48_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest(MUX,248)@9
    leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_s <= reg_leftShiftStageSel3Dto2_uid248_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q;
    leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest: PROCESS (leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_s, en, reg_leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q, reg_leftShiftStage1Idx1_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_3_q, reg_leftShiftStage1Idx2_uid244_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_4_q, reg_leftShiftStage1Idx3_uid247_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_s IS
                  WHEN "00" => leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= reg_leftShiftStage0_uid238_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q;
                  WHEN "01" => leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= reg_leftShiftStage1Idx1_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_3_q;
                  WHEN "10" => leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= reg_leftShiftStage1Idx2_uid244_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_4_q;
                  WHEN "11" => leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= reg_leftShiftStage1Idx3_uid247_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage1101dto0_uid257_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,256)@9
    LeftShiftStage1101dto0_uid257_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_q(101 downto 0);
    LeftShiftStage1101dto0_uid257_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= LeftShiftStage1101dto0_uid257_fracXBranch4Ext_uid48_fpLogE1pxTest_in(101 downto 0);

	--ld_LeftShiftStage1101dto0_uid257_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid258_fracXBranch4Ext_uid48_fpLogE1pxTest_b(DELAY,916)@9
    ld_LeftShiftStage1101dto0_uid257_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid258_fracXBranch4Ext_uid48_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 102, depth => 1 )
    PORT MAP ( xin => LeftShiftStage1101dto0_uid257_fracXBranch4Ext_uid48_fpLogE1pxTest_b, xout => ld_LeftShiftStage1101dto0_uid257_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid258_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx3Pad3_uid185_fracXRSExt_uid36_fpLogE1pxTest(CONSTANT,184)
    rightShiftStage2Idx3Pad3_uid185_fracXRSExt_uid36_fpLogE1pxTest_q <= "000";

	--leftShiftStage2Idx3_uid258_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,257)@10
    leftShiftStage2Idx3_uid258_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= ld_LeftShiftStage1101dto0_uid257_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid258_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q & rightShiftStage2Idx3Pad3_uid185_fracXRSExt_uid36_fpLogE1pxTest_q;

	--LeftShiftStage1102dto0_uid254_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,253)@9
    LeftShiftStage1102dto0_uid254_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_q(102 downto 0);
    LeftShiftStage1102dto0_uid254_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= LeftShiftStage1102dto0_uid254_fracXBranch4Ext_uid48_fpLogE1pxTest_in(102 downto 0);

	--ld_LeftShiftStage1102dto0_uid254_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid255_fracXBranch4Ext_uid48_fpLogE1pxTest_b(DELAY,914)@9
    ld_LeftShiftStage1102dto0_uid254_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid255_fracXBranch4Ext_uid48_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 103, depth => 1 )
    PORT MAP ( xin => LeftShiftStage1102dto0_uid254_fracXBranch4Ext_uid48_fpLogE1pxTest_b, xout => ld_LeftShiftStage1102dto0_uid254_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid255_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx2_uid255_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,254)@10
    leftShiftStage2Idx2_uid255_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= ld_LeftShiftStage1102dto0_uid254_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid255_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q & z2_uid100_fpLogE1pxTest_q;

	--LeftShiftStage1103dto0_uid251_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,250)@9
    LeftShiftStage1103dto0_uid251_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_q(103 downto 0);
    LeftShiftStage1103dto0_uid251_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= LeftShiftStage1103dto0_uid251_fracXBranch4Ext_uid48_fpLogE1pxTest_in(103 downto 0);

	--ld_LeftShiftStage1103dto0_uid251_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid252_fracXBranch4Ext_uid48_fpLogE1pxTest_b(DELAY,912)@9
    ld_LeftShiftStage1103dto0_uid251_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid252_fracXBranch4Ext_uid48_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 104, depth => 1 )
    PORT MAP ( xin => LeftShiftStage1103dto0_uid251_fracXBranch4Ext_uid48_fpLogE1pxTest_b, xout => ld_LeftShiftStage1103dto0_uid251_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid252_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx1_uid252_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,251)@10
    leftShiftStage2Idx1_uid252_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= ld_LeftShiftStage1103dto0_uid251_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid252_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q & GND_q;

	--reg_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_2(REG,525)@9
    reg_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q <= leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,258)@8
    leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= r_uid225_leadingZeros_uid44_fpLogE1pxTest_q(1 downto 0);
    leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_in(1 downto 0);

	--reg_leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_1(REG,524)@8
    reg_leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q <= leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_b(DELAY,918)@9
    ld_reg_leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q, xout => ld_reg_leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest(MUX,259)@10
    leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_s <= ld_reg_leftShiftStageSel1Dto0_uid259_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q;
    leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest: PROCESS (leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_s, en, reg_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q, leftShiftStage2Idx1_uid252_fracXBranch4Ext_uid48_fpLogE1pxTest_q, leftShiftStage2Idx2_uid255_fracXBranch4Ext_uid48_fpLogE1pxTest_q, leftShiftStage2Idx3_uid258_fracXBranch4Ext_uid48_fpLogE1pxTest_q)
    BEGIN
            CASE leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_s IS
                  WHEN "00" => leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= reg_leftShiftStage1_uid249_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q;
                  WHEN "01" => leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= leftShiftStage2Idx1_uid252_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
                  WHEN "10" => leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= leftShiftStage2Idx2_uid255_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
                  WHEN "11" => leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= leftShiftStage2Idx3_uid258_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
                  WHEN OTHERS => leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracXBranch4_uid49_fpLogE1pxTest(BITSELECT,48)@10
    fracXBranch4_uid49_fpLogE1pxTest_in <= leftShiftStage2_uid260_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
    fracXBranch4_uid49_fpLogE1pxTest_b <= fracXBranch4_uid49_fpLogE1pxTest_in(104 downto 51);

	--fracXBranch4Red_uid80_fpLogE1pxTest(BITSELECT,79)@10
    fracXBranch4Red_uid80_fpLogE1pxTest_in <= fracXBranch4_uid49_fpLogE1pxTest_b(52 downto 0);
    fracXBranch4Red_uid80_fpLogE1pxTest_b <= fracXBranch4Red_uid80_fpLogE1pxTest_in(52 downto 0);

	--reg_fracXBranch4Red_uid80_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_5(REG,528)@10
    reg_fracXBranch4Red_uid80_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracXBranch4Red_uid80_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_5_q <= "00000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracXBranch4Red_uid80_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_5_q <= fracXBranch4Red_uid80_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_nor(LOGICAL,1409)
    ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_nor_b <= ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_sticky_ena_q;
    ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_nor_q <= not (ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_nor_a or ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_nor_b);

	--ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_mem_top(CONSTANT,1353)
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_mem_top_q <= "0100";

	--ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmp(LOGICAL,1354)
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmp_a <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_mem_top_q;
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdmux_q);
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmp_q <= "1" when ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmp_a = ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmp_b else "0";

	--ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmpReg(REG,1355)
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmpReg_q <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_sticky_ena(REG,1410)
    ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_nor_q = "1") THEN
                ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_sticky_ena_q <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_enaAnd(LOGICAL,1411)
    ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_enaAnd_a <= ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_sticky_ena_q;
    ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_enaAnd_b <= en;
    ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_enaAnd_q <= ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_enaAnd_a and ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_enaAnd_b;

	--fracXRS_uid39_fpLogE1pxTest(BITSELECT,38)@3
    fracXRS_uid39_fpLogE1pxTest_in <= rightShiftStage2_uid188_fracXRSExt_uid36_fpLogE1pxTest_q;
    fracXRS_uid39_fpLogE1pxTest_b <= fracXRS_uid39_fpLogE1pxTest_in(105 downto 52);

	--fracXRSRange_uid81_fpLogE1pxTest(BITSELECT,80)@3
    fracXRSRange_uid81_fpLogE1pxTest_in <= fracXRS_uid39_fpLogE1pxTest_b(52 downto 0);
    fracXRSRange_uid81_fpLogE1pxTest_b <= fracXRSRange_uid81_fpLogE1pxTest_in(52 downto 0);

	--reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4(REG,527)@3
    reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q <= "00000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q <= fracXRSRange_uid81_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_inputreg(DELAY,1399)
    ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_inputreg : dspba_delay
    GENERIC MAP ( width => 53, depth => 1 )
    PORT MAP ( xin => reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q, xout => ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt(COUNTER,1349)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_i = 3 THEN
                      ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_i <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_i <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_i,3));


	--ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdreg(REG,1350)
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdreg_q <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdmux(MUX,1351)
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdmux_s <= en;
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdmux: PROCESS (ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdmux_s, ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdreg_q, ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdmux_q <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdmux_q <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem(DUALMEM,1400)
    ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_ia <= ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_inputreg_q;
    ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_aa <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdreg_q;
    ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_ab <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdmux_q;
    ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 53,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 53,
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
        clocken1 => ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_iq,
        address_a => ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_aa,
        data_a => ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_ia
    );
    ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_reset0 <= areset;
        ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_q <= ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_iq(52 downto 0);

	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor(LOGICAL,1396)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_b <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena_q;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_q <= not (ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_a or ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_b);

	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena(REG,1397)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_q = "1") THEN
                ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena_q <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd(LOGICAL,1398)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_a <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena_q;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_b <= en;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_q <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_a and ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_b;

	--addrMaskExt_uid50_fpLogE1pxTest(SUB,49)@0
    addrMaskExt_uid50_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpLogE1pxTest_b);
    addrMaskExt_uid50_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("0" & cstBias_uid9_fpLogE1pxTest_q);
            addrMaskExt_uid50_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(addrMaskExt_uid50_fpLogE1pxTest_a) - UNSIGNED(addrMaskExt_uid50_fpLogE1pxTest_b));
    addrMaskExt_uid50_fpLogE1pxTest_q <= addrMaskExt_uid50_fpLogE1pxTest_o(11 downto 0);


	--addrMask_uid51_fpLogE1pxTest(BITSELECT,50)@0
    addrMask_uid51_fpLogE1pxTest_in <= addrMaskExt_uid50_fpLogE1pxTest_q(5 downto 0);
    addrMask_uid51_fpLogE1pxTest_b <= addrMask_uid51_fpLogE1pxTest_in(5 downto 0);

	--reg_addrMask_uid51_fpLogE1pxTest_0_to_maskIncrementTable_uid52_fpLogE1pxTest_0(REG,494)@0
    reg_addrMask_uid51_fpLogE1pxTest_0_to_maskIncrementTable_uid52_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrMask_uid51_fpLogE1pxTest_0_to_maskIncrementTable_uid52_fpLogE1pxTest_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrMask_uid51_fpLogE1pxTest_0_to_maskIncrementTable_uid52_fpLogE1pxTest_0_q <= addrMask_uid51_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--maskIncrementTable_uid52_fpLogE1pxTest(LOOKUP,51)@1
    maskIncrementTable_uid52_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            maskIncrementTable_uid52_fpLogE1pxTest_q <= "10000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_addrMask_uid51_fpLogE1pxTest_0_to_maskIncrementTable_uid52_fpLogE1pxTest_0_q) IS
                WHEN "000000" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "10000000000000000000000000000000000000000000000000000";
                WHEN "000001" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "01000000000000000000000000000000000000000000000000000";
                WHEN "000010" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00100000000000000000000000000000000000000000000000000";
                WHEN "000011" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00010000000000000000000000000000000000000000000000000";
                WHEN "000100" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00001000000000000000000000000000000000000000000000000";
                WHEN "000101" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000100000000000000000000000000000000000000000000000";
                WHEN "000110" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000010000000000000000000000000000000000000000000000";
                WHEN "000111" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000001000000000000000000000000000000000000000000000";
                WHEN "001000" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000100000000000000000000000000000000000000000000";
                WHEN "001001" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000010000000000000000000000000000000000000000000";
                WHEN "001010" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000001000000000000000000000000000000000000000000";
                WHEN "001011" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000100000000000000000000000000000000000000000";
                WHEN "001100" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000010000000000000000000000000000000000000000";
                WHEN "001101" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000001000000000000000000000000000000000000000";
                WHEN "001110" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000100000000000000000000000000000000000000";
                WHEN "001111" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000010000000000000000000000000000000000000";
                WHEN "010000" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000001000000000000000000000000000000000000";
                WHEN "010001" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000100000000000000000000000000000000000";
                WHEN "010010" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000010000000000000000000000000000000000";
                WHEN "010011" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000001000000000000000000000000000000000";
                WHEN "010100" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000100000000000000000000000000000000";
                WHEN "010101" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000010000000000000000000000000000000";
                WHEN "010110" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000001000000000000000000000000000000";
                WHEN "010111" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000100000000000000000000000000000";
                WHEN "011000" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000010000000000000000000000000000";
                WHEN "011001" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000001000000000000000000000000000";
                WHEN "011010" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000100000000000000000000000000";
                WHEN "011011" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000010000000000000000000000000";
                WHEN "011100" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000001000000000000000000000000";
                WHEN "011101" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000100000000000000000000000";
                WHEN "011110" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000010000000000000000000000";
                WHEN "011111" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000001000000000000000000000";
                WHEN "100000" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000100000000000000000000";
                WHEN "100001" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000010000000000000000000";
                WHEN "100010" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000001000000000000000000";
                WHEN "100011" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000100000000000000000";
                WHEN "100100" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000010000000000000000";
                WHEN "100101" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000001000000000000000";
                WHEN "100110" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000100000000000000";
                WHEN "100111" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000010000000000000";
                WHEN "101000" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000001000000000000";
                WHEN "101001" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000000100000000000";
                WHEN "101010" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000000010000000000";
                WHEN "101011" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000000001000000000";
                WHEN "101100" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000000000100000000";
                WHEN "101101" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000000000010000000";
                WHEN "101110" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000000000001000000";
                WHEN "101111" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000000000000100000";
                WHEN "110000" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000000000000010000";
                WHEN "110001" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000000000000001000";
                WHEN "110010" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000000000000000100";
                WHEN "110011" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000000000000000010";
                WHEN "110100" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "00000000000000000000000000000000000000000000000000001";
                WHEN OTHERS =>
                    maskIncrementTable_uid52_fpLogE1pxTest_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--reg_oFracX_uid32_fpLogE1pxTest_0_to_oPlusOFracX_uid53_fpLogE1pxTest_0(REG,495)@1
    reg_oFracX_uid32_fpLogE1pxTest_0_to_oPlusOFracX_uid53_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracX_uid32_fpLogE1pxTest_0_to_oPlusOFracX_uid53_fpLogE1pxTest_0_q <= "00000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracX_uid32_fpLogE1pxTest_0_to_oPlusOFracX_uid53_fpLogE1pxTest_0_q <= oFracX_uid32_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--oPlusOFracX_uid53_fpLogE1pxTest(ADD,52)@2
    oPlusOFracX_uid53_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & reg_oFracX_uid32_fpLogE1pxTest_0_to_oPlusOFracX_uid53_fpLogE1pxTest_0_q);
    oPlusOFracX_uid53_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("0" & maskIncrementTable_uid52_fpLogE1pxTest_q);
            oPlusOFracX_uid53_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oPlusOFracX_uid53_fpLogE1pxTest_a) + UNSIGNED(oPlusOFracX_uid53_fpLogE1pxTest_b));
    oPlusOFracX_uid53_fpLogE1pxTest_q <= oPlusOFracX_uid53_fpLogE1pxTest_o(53 downto 0);


	--oPlusOFracXNormHigh_uid59_fpLogE1pxTest(BITSELECT,58)@2
    oPlusOFracXNormHigh_uid59_fpLogE1pxTest_in <= oPlusOFracX_uid53_fpLogE1pxTest_q(52 downto 0);
    oPlusOFracXNormHigh_uid59_fpLogE1pxTest_b <= oPlusOFracXNormHigh_uid59_fpLogE1pxTest_in(52 downto 0);

	--reg_oPlusOFracXNormHigh_uid59_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_3(REG,498)@2
    reg_oPlusOFracXNormHigh_uid59_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oPlusOFracXNormHigh_uid59_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_3_q <= "00000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oPlusOFracXNormHigh_uid59_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_3_q <= oPlusOFracXNormHigh_uid59_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--oPlusOFracXNormLow_uid57_fpLogE1pxTest(BITSELECT,56)@2
    oPlusOFracXNormLow_uid57_fpLogE1pxTest_in <= oPlusOFracX_uid53_fpLogE1pxTest_q(51 downto 0);
    oPlusOFracXNormLow_uid57_fpLogE1pxTest_b <= oPlusOFracXNormLow_uid57_fpLogE1pxTest_in(51 downto 0);

	--join_uid58_fpLogE1pxTest(BITJOIN,57)@2
    join_uid58_fpLogE1pxTest_q <= oPlusOFracXNormLow_uid57_fpLogE1pxTest_b & GND_q;

	--reg_join_uid58_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_2(REG,497)@2
    reg_join_uid58_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_join_uid58_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_2_q <= "00000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_join_uid58_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_2_q <= join_uid58_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--msbUoPlusOFracX_uid54_fpLogE1pxTest(BITSELECT,53)@2
    msbUoPlusOFracX_uid54_fpLogE1pxTest_in <= oPlusOFracX_uid53_fpLogE1pxTest_q;
    msbUoPlusOFracX_uid54_fpLogE1pxTest_b <= msbUoPlusOFracX_uid54_fpLogE1pxTest_in(53 downto 53);

	--reg_msbUoPlusOFracX_uid54_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_1(REG,496)@2
    reg_msbUoPlusOFracX_uid54_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_msbUoPlusOFracX_uid54_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_msbUoPlusOFracX_uid54_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_1_q <= msbUoPlusOFracX_uid54_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--oPlusOFracXNorm_uid61_fpLogE1pxTest(MUX,60)@3
    oPlusOFracXNorm_uid61_fpLogE1pxTest_s <= reg_msbUoPlusOFracX_uid54_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_1_q;
    oPlusOFracXNorm_uid61_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oPlusOFracXNorm_uid61_fpLogE1pxTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE oPlusOFracXNorm_uid61_fpLogE1pxTest_s IS
                      WHEN "0" => oPlusOFracXNorm_uid61_fpLogE1pxTest_q <= reg_join_uid58_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_2_q;
                      WHEN "1" => oPlusOFracXNorm_uid61_fpLogE1pxTest_q <= reg_oPlusOFracXNormHigh_uid59_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_3_q;
                      WHEN OTHERS => oPlusOFracXNorm_uid61_fpLogE1pxTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_inputreg(DELAY,1386)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 53, depth => 1 )
    PORT MAP ( xin => oPlusOFracXNorm_uid61_fpLogE1pxTest_q, xout => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem(DUALMEM,1387)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_ia <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_inputreg_q;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_aa <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdreg_q;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_ab <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdmux_q;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 53,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 53,
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
        clocken1 => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_iq,
        address_a => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_aa,
        data_a => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_ia
    );
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_reset0 <= areset;
        ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_q <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_iq(52 downto 0);

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor(LOGICAL,1383)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_b <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_q <= not (ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_a or ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_b);

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_mem_top(CONSTANT,1379)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_mem_top_q <= "0110";

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmp(LOGICAL,1380)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmp_a <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_mem_top_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdmux_q);
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmp_q <= "1" when ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmp_a = ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmp_b else "0";

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmpReg(REG,1381)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmpReg_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena(REG,1384)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_q = "1") THEN
                ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd(LOGICAL,1385)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_a <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_b <= en;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_a and ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_b;

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_inputreg(DELAY,1373)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1 )
    PORT MAP ( xin => frac_uid22_fpLogE1pxTest_b, xout => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt(COUNTER,1375)
    -- every=1, low=0, high=6, step=1, init=1
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_i = 5 THEN
                      ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_eq = '1') THEN
                        ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_i <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_i - 6;
                    ELSE
                        ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_i <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_i,3));


	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdreg(REG,1376)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdreg_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdmux(MUX,1377)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdmux_s <= en;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdmux: PROCESS (ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdmux_s, ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdreg_q, ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdmux_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdreg_q;
                  WHEN "1" => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdmux_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem(DUALMEM,1374)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_ia <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_inputreg_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_aa <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdreg_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_ab <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdmux_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 52,
        widthad_b => 3,
        numwords_b => 7,
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
        clocken1 => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_iq,
        address_a => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_aa,
        data_a => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_ia
    );
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_reset0 <= areset;
        ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_iq(51 downto 0);

	--fracXz_uid82_fpLogE1pxTest(BITJOIN,81)@10
    fracXz_uid82_fpLogE1pxTest_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_q & GND_q;

	--reg_fracXz_uid82_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_2(REG,526)@10
    reg_fracXz_uid82_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracXz_uid82_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_2_q <= "00000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracXz_uid82_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_2_q <= fracXz_uid82_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_nor(LOGICAL,1357)
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_nor_b <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_sticky_ena_q;
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_nor_q <= not (ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_nor_a or ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_nor_b);

	--ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_sticky_ena(REG,1358)
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_nor_q = "1") THEN
                ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_sticky_ena_q <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_enaAnd(LOGICAL,1359)
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_enaAnd_a <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_sticky_ena_q;
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_enaAnd_b <= en;
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_enaAnd_q <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_enaAnd_a and ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_enaAnd_b;

	--branch11_uid64_fpLogE1pxTest(LOGICAL,63)@0
    branch11_uid64_fpLogE1pxTest_a <= signX_uid7_fpLogE1pxTest_b;
    branch11_uid64_fpLogE1pxTest_q <= not branch11_uid64_fpLogE1pxTest_a;

	--branch3_uid73_fpLogE1pxTest(LOGICAL,72)@0
    branch3_uid73_fpLogE1pxTest_a <= branch22_uid66_fpLogE1pxTest_c;
    branch3_uid73_fpLogE1pxTest_b <= InvResIsX_uid72_fpLogE1pxTest_q;
    branch3_uid73_fpLogE1pxTest_c <= branch11_uid64_fpLogE1pxTest_q;
    branch3_uid73_fpLogE1pxTest_q <= branch3_uid73_fpLogE1pxTest_a and branch3_uid73_fpLogE1pxTest_b and branch3_uid73_fpLogE1pxTest_c;

	--cstBiasPWFP1_uid13_fpLogE1pxTest(CONSTANT,12)
    cstBiasPWFP1_uid13_fpLogE1pxTest_q <= "10000110100";

	--branch12_uid63_fpLogE1pxTest(COMPARE,62)@0
    branch12_uid63_fpLogE1pxTest_cin <= GND_q;
    branch12_uid63_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("00" & expX_uid6_fpLogE1pxTest_b) & '0';
    branch12_uid63_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00" & cstBiasPWFP1_uid13_fpLogE1pxTest_q) & branch12_uid63_fpLogE1pxTest_cin(0);
            branch12_uid63_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(branch12_uid63_fpLogE1pxTest_a) - UNSIGNED(branch12_uid63_fpLogE1pxTest_b));
    branch12_uid63_fpLogE1pxTest_c(0) <= branch12_uid63_fpLogE1pxTest_o(13);
    branch12_uid63_fpLogE1pxTest_n(0) <= not branch12_uid63_fpLogE1pxTest_o(13);


	--branch2_uid69_fpLogE1pxTest(LOGICAL,68)@0
    branch2_uid69_fpLogE1pxTest_a <= branch11_uid64_fpLogE1pxTest_q;
    branch2_uid69_fpLogE1pxTest_b <= branch12_uid63_fpLogE1pxTest_c;
    branch2_uid69_fpLogE1pxTest_c <= branch22_uid66_fpLogE1pxTest_n;
    branch2_uid69_fpLogE1pxTest_q <= branch2_uid69_fpLogE1pxTest_a and branch2_uid69_fpLogE1pxTest_b and branch2_uid69_fpLogE1pxTest_c;

	--branch1_uid65_fpLogE1pxTest(LOGICAL,64)@0
    branch1_uid65_fpLogE1pxTest_a <= branch11_uid64_fpLogE1pxTest_q;
    branch1_uid65_fpLogE1pxTest_b <= branch12_uid63_fpLogE1pxTest_n;
    branch1_uid65_fpLogE1pxTest_q <= branch1_uid65_fpLogE1pxTest_a and branch1_uid65_fpLogE1pxTest_b;

	--concBranch_uid76_fpLogE1pxTest(BITJOIN,75)@0
    concBranch_uid76_fpLogE1pxTest_q <= branch4_uid75_fpLogE1pxTest_q & branch3_uid73_fpLogE1pxTest_q & branch2_uid69_fpLogE1pxTest_q & branch1_uid65_fpLogE1pxTest_q;

	--reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0(REG,493)@0
    reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q <= concBranch_uid76_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_inputreg(DELAY,1347)
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 4, depth => 1 )
    PORT MAP ( xin => reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q, xout => ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem(DUALMEM,1348)
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_ia <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_inputreg_q;
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_aa <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdreg_q;
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_ab <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_rdmux_q;
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 4,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 4,
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
        clocken1 => ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_iq,
        address_a => ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_aa,
        data_a => ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_ia
    );
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_reset0 <= areset;
        ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_q <= ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_iq(3 downto 0);

	--branEnc_uid77_fpLogE1pxTest(LOOKUP,76)@8
    branEnc_uid77_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            branEnc_uid77_fpLogE1pxTest_q <= "00";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_replace_mem_q) IS
                WHEN "0000" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "0001" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "0010" =>  branEnc_uid77_fpLogE1pxTest_q <= "01";
                WHEN "0011" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "0100" =>  branEnc_uid77_fpLogE1pxTest_q <= "10";
                WHEN "0101" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "0110" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "0111" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "1000" =>  branEnc_uid77_fpLogE1pxTest_q <= "11";
                WHEN "1001" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "1010" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "1011" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "1100" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "1101" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "1110" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "1111" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN OTHERS =>
                    branEnc_uid77_fpLogE1pxTest_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--ld_branEnc_uid77_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_b(DELAY,725)@9
    ld_branEnc_uid77_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 2 )
    PORT MAP ( xin => branEnc_uid77_fpLogE1pxTest_q, xout => ld_branEnc_uid77_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracB_uid83_fpLogE1pxTest(MUX,82)@11
    fracB_uid83_fpLogE1pxTest_s <= ld_branEnc_uid77_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_b_q;
    fracB_uid83_fpLogE1pxTest: PROCESS (fracB_uid83_fpLogE1pxTest_s, en, reg_fracXz_uid82_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_2_q, ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_q, ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_q, reg_fracXBranch4Red_uid80_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_5_q)
    BEGIN
            CASE fracB_uid83_fpLogE1pxTest_s IS
                  WHEN "00" => fracB_uid83_fpLogE1pxTest_q <= reg_fracXz_uid82_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_2_q;
                  WHEN "01" => fracB_uid83_fpLogE1pxTest_q <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_q;
                  WHEN "10" => fracB_uid83_fpLogE1pxTest_q <= ld_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q_to_fracB_uid83_fpLogE1pxTest_e_replace_mem_q;
                  WHEN "11" => fracB_uid83_fpLogE1pxTest_q <= reg_fracXBranch4Red_uid80_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_5_q;
                  WHEN OTHERS => fracB_uid83_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_inputreg(DELAY,1425)
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 53, depth => 1 )
    PORT MAP ( xin => fracB_uid83_fpLogE1pxTest_q, xout => ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdcnt(COUNTER,1338)
    -- every=1, low=0, high=1, step=1, init=1
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdcnt_i <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdcnt_i,1));


	--ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg(REG,1339)
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg_q <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux(MUX,1340)
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_s <= en;
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux: PROCESS (ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_s, ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg_q, ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_q <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg_q;
                  WHEN "1" => ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_q <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem(DUALMEM,1426)
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_ia <= ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_inputreg_q;
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_aa <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg_q;
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_ab <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_q;
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 53,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 53,
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
        clocken1 => ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_iq,
        address_a => ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_aa,
        data_a => ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_ia
    );
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_reset0 <= areset;
        ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_q <= ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_iq(52 downto 0);

	--zPPolyEval_uid91_fpLogE1pxTest(BITSELECT,90)@15
    zPPolyEval_uid91_fpLogE1pxTest_in <= ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_replace_mem_q(42 downto 0);
    zPPolyEval_uid91_fpLogE1pxTest_b <= zPPolyEval_uid91_fpLogE1pxTest_in(42 downto 0);

	--yT2_uid300_natLogPolyEval(BITSELECT,299)@15
    yT2_uid300_natLogPolyEval_in <= zPPolyEval_uid91_fpLogE1pxTest_b;
    yT2_uid300_natLogPolyEval_b <= yT2_uid300_natLogPolyEval_in(42 downto 15);

	--sSM1W_uid412_pT2_uid301_natLogPolyEval(BITSELECT,411)@15
    sSM1W_uid412_pT2_uid301_natLogPolyEval_in <= yT2_uid300_natLogPolyEval_b(0 downto 0);
    sSM1W_uid412_pT2_uid301_natLogPolyEval_b <= sSM1W_uid412_pT2_uid301_natLogPolyEval_in(0 downto 0);

	--reg_sSM1W_uid412_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_1(REG,577)@15
    reg_sSM1W_uid412_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sSM1W_uid412_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sSM1W_uid412_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_1_q <= sSM1W_uid412_pT2_uid301_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_sSM1W_uid412_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_1_q_to_sm1_uid413_pT2_uid301_natLogPolyEval_b(DELAY,1072)@16
    ld_reg_sSM1W_uid412_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_1_q_to_sm1_uid413_pT2_uid301_natLogPolyEval_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => reg_sSM1W_uid412_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_1_q, xout => ld_reg_sSM1W_uid412_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_1_q_to_sm1_uid413_pT2_uid301_natLogPolyEval_b_q, ena => en(0), clk => clk, aclr => areset );

	--zAddrLow_uid89_fpLogE1pxTest(BITSELECT,88)@11
    zAddrLow_uid89_fpLogE1pxTest_in <= fracB_uid83_fpLogE1pxTest_q;
    zAddrLow_uid89_fpLogE1pxTest_b <= zAddrLow_uid89_fpLogE1pxTest_in(52 downto 43);

	--addr_uid90_fpLogE1pxTest(BITJOIN,89)@11
    addr_uid90_fpLogE1pxTest_q <= reg_c_uid87_fpLogE1pxTest_0_to_addr_uid90_fpLogE1pxTest_1_q & zAddrLow_uid89_fpLogE1pxTest_b;

	--reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0(REG,530)@11
    reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q <= "00000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q <= addr_uid90_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC4_uid292_natLogTabGen_lutmem(DUALMEM,488)@12
    memoryC4_uid292_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC4_uid292_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC4_uid292_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC4_uid292_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 7,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC4_uid292_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC4_uid292_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC4_uid292_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC4_uid292_natLogTabGen_lutmem_iq,
        address_a => memoryC4_uid292_natLogTabGen_lutmem_aa,
        data_a => memoryC4_uid292_natLogTabGen_lutmem_ia
    );
    memoryC4_uid292_natLogTabGen_lutmem_reset0 <= areset;
        memoryC4_uid292_natLogTabGen_lutmem_q <= memoryC4_uid292_natLogTabGen_lutmem_iq(6 downto 0);

	--reg_memoryC4_uid292_natLogTabGen_lutmem_0_to_os_uid293_natLogTabGen_1(REG,563)@14
    reg_memoryC4_uid292_natLogTabGen_lutmem_0_to_os_uid293_natLogTabGen_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC4_uid292_natLogTabGen_lutmem_0_to_os_uid293_natLogTabGen_1_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC4_uid292_natLogTabGen_lutmem_0_to_os_uid293_natLogTabGen_1_q <= memoryC4_uid292_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC4_uid291_natLogTabGen_lutmem(DUALMEM,487)@12
    memoryC4_uid291_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC4_uid291_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC4_uid291_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC4_uid291_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC4_uid291_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC4_uid291_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC4_uid291_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC4_uid291_natLogTabGen_lutmem_iq,
        address_a => memoryC4_uid291_natLogTabGen_lutmem_aa,
        data_a => memoryC4_uid291_natLogTabGen_lutmem_ia
    );
    memoryC4_uid291_natLogTabGen_lutmem_reset0 <= areset;
        memoryC4_uid291_natLogTabGen_lutmem_q <= memoryC4_uid291_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC4_uid291_natLogTabGen_lutmem_0_to_os_uid293_natLogTabGen_0(REG,562)@14
    reg_memoryC4_uid291_natLogTabGen_lutmem_0_to_os_uid293_natLogTabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC4_uid291_natLogTabGen_lutmem_0_to_os_uid293_natLogTabGen_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC4_uid291_natLogTabGen_lutmem_0_to_os_uid293_natLogTabGen_0_q <= memoryC4_uid291_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid293_natLogTabGen(BITJOIN,292)@15
    os_uid293_natLogTabGen_q <= reg_memoryC4_uid292_natLogTabGen_lutmem_0_to_os_uid293_natLogTabGen_1_q & reg_memoryC4_uid291_natLogTabGen_lutmem_0_to_os_uid293_natLogTabGen_0_q;

	--reg_os_uid293_natLogTabGen_0_to_prodXY_uid402_pT1_uid295_natLogPolyEval_1(REG,565)@15
    reg_os_uid293_natLogTabGen_0_to_prodXY_uid402_pT1_uid295_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_os_uid293_natLogTabGen_0_to_prodXY_uid402_pT1_uid295_natLogPolyEval_1_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_os_uid293_natLogTabGen_0_to_prodXY_uid402_pT1_uid295_natLogPolyEval_1_q <= os_uid293_natLogTabGen_q;
            END IF;
        END IF;
    END PROCESS;


	--yT1_uid294_natLogPolyEval(BITSELECT,293)@15
    yT1_uid294_natLogPolyEval_in <= zPPolyEval_uid91_fpLogE1pxTest_b;
    yT1_uid294_natLogPolyEval_b <= yT1_uid294_natLogPolyEval_in(42 downto 26);

	--reg_yT1_uid294_natLogPolyEval_0_to_prodXY_uid402_pT1_uid295_natLogPolyEval_0(REG,564)@15
    reg_yT1_uid294_natLogPolyEval_0_to_prodXY_uid402_pT1_uid295_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid294_natLogPolyEval_0_to_prodXY_uid402_pT1_uid295_natLogPolyEval_0_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid294_natLogPolyEval_0_to_prodXY_uid402_pT1_uid295_natLogPolyEval_0_q <= yT1_uid294_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid402_pT1_uid295_natLogPolyEval(MULT,401)@16
    prodXY_uid402_pT1_uid295_natLogPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid402_pT1_uid295_natLogPolyEval_a),18)) * SIGNED(prodXY_uid402_pT1_uid295_natLogPolyEval_b);
    prodXY_uid402_pT1_uid295_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid402_pT1_uid295_natLogPolyEval_a <= (others => '0');
            prodXY_uid402_pT1_uid295_natLogPolyEval_b <= (others => '0');
            prodXY_uid402_pT1_uid295_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid402_pT1_uid295_natLogPolyEval_a <= reg_yT1_uid294_natLogPolyEval_0_to_prodXY_uid402_pT1_uid295_natLogPolyEval_0_q;
                prodXY_uid402_pT1_uid295_natLogPolyEval_b <= reg_os_uid293_natLogTabGen_0_to_prodXY_uid402_pT1_uid295_natLogPolyEval_1_q;
                prodXY_uid402_pT1_uid295_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid402_pT1_uid295_natLogPolyEval_pr,34));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid402_pT1_uid295_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid402_pT1_uid295_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid402_pT1_uid295_natLogPolyEval_q <= prodXY_uid402_pT1_uid295_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid403_pT1_uid295_natLogPolyEval(BITSELECT,402)@19
    prodXYTruncFR_uid403_pT1_uid295_natLogPolyEval_in <= prodXY_uid402_pT1_uid295_natLogPolyEval_q;
    prodXYTruncFR_uid403_pT1_uid295_natLogPolyEval_b <= prodXYTruncFR_uid403_pT1_uid295_natLogPolyEval_in(33 downto 15);

	--highBBits_uid297_natLogPolyEval(BITSELECT,296)@19
    highBBits_uid297_natLogPolyEval_in <= prodXYTruncFR_uid403_pT1_uid295_natLogPolyEval_b;
    highBBits_uid297_natLogPolyEval_b <= highBBits_uid297_natLogPolyEval_in(18 downto 1);

	--ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_nor(LOGICAL,1583)
    ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_nor_b <= ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_sticky_ena_q;
    ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_nor_q <= not (ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_nor_a or ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_nor_b);

	--ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_sticky_ena(REG,1584)
    ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_nor_q = "1") THEN
                ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_sticky_ena_q <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_enaAnd(LOGICAL,1585)
    ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_enaAnd_a <= ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_sticky_ena_q;
    ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_enaAnd_b <= en;
    ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_enaAnd_q <= ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_enaAnd_a and ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_enaAnd_b;

	--memoryC3_uid289_natLogTabGen_lutmem(DUALMEM,486)@12
    memoryC3_uid289_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC3_uid289_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC3_uid289_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC3_uid289_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 8,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC3_uid289_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC3_uid289_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC3_uid289_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC3_uid289_natLogTabGen_lutmem_iq,
        address_a => memoryC3_uid289_natLogTabGen_lutmem_aa,
        data_a => memoryC3_uid289_natLogTabGen_lutmem_ia
    );
    memoryC3_uid289_natLogTabGen_lutmem_reset0 <= areset;
        memoryC3_uid289_natLogTabGen_lutmem_q <= memoryC3_uid289_natLogTabGen_lutmem_iq(7 downto 0);

	--reg_memoryC3_uid289_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_2(REG,571)@14
    reg_memoryC3_uid289_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC3_uid289_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC3_uid289_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_2_q <= memoryC3_uid289_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC3_uid288_natLogTabGen_lutmem(DUALMEM,485)@12
    memoryC3_uid288_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC3_uid288_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC3_uid288_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC3_uid288_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC3_uid288_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC3_uid288_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC3_uid288_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC3_uid288_natLogTabGen_lutmem_iq,
        address_a => memoryC3_uid288_natLogTabGen_lutmem_aa,
        data_a => memoryC3_uid288_natLogTabGen_lutmem_ia
    );
    memoryC3_uid288_natLogTabGen_lutmem_reset0 <= areset;
        memoryC3_uid288_natLogTabGen_lutmem_q <= memoryC3_uid288_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC3_uid288_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_1(REG,570)@14
    reg_memoryC3_uid288_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC3_uid288_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_1_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC3_uid288_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_1_q <= memoryC3_uid288_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC3_uid287_natLogTabGen_lutmem(DUALMEM,484)@12
    memoryC3_uid287_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC3_uid287_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC3_uid287_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC3_uid287_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC3_uid287_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC3_uid287_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC3_uid287_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC3_uid287_natLogTabGen_lutmem_iq,
        address_a => memoryC3_uid287_natLogTabGen_lutmem_aa,
        data_a => memoryC3_uid287_natLogTabGen_lutmem_ia
    );
    memoryC3_uid287_natLogTabGen_lutmem_reset0 <= areset;
        memoryC3_uid287_natLogTabGen_lutmem_q <= memoryC3_uid287_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC3_uid287_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_0(REG,569)@14
    reg_memoryC3_uid287_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC3_uid287_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC3_uid287_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_0_q <= memoryC3_uid287_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid290_natLogTabGen(BITJOIN,289)@15
    os_uid290_natLogTabGen_q <= reg_memoryC3_uid289_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_2_q & reg_memoryC3_uid288_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_1_q & reg_memoryC3_uid287_natLogTabGen_lutmem_0_to_os_uid290_natLogTabGen_0_q;

	--ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_inputreg(DELAY,1575)
    ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 28, depth => 1 )
    PORT MAP ( xin => os_uid290_natLogTabGen_q, xout => ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem(DUALMEM,1576)
    ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_ia <= ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_inputreg_q;
    ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_aa <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg_q;
    ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_ab <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_q;
    ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 28,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 28,
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
        clocken1 => ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_iq,
        address_a => ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_aa,
        data_a => ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_ia
    );
    ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_reset0 <= areset;
        ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_q <= ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_iq(27 downto 0);

	--sumAHighB_uid298_natLogPolyEval(ADD,297)@19
    sumAHighB_uid298_natLogPolyEval_a <= STD_LOGIC_VECTOR((28 downto 28 => ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_q(27)) & ld_os_uid290_natLogTabGen_q_to_sumAHighB_uid298_natLogPolyEval_a_replace_mem_q);
    sumAHighB_uid298_natLogPolyEval_b <= STD_LOGIC_VECTOR((28 downto 18 => highBBits_uid297_natLogPolyEval_b(17)) & highBBits_uid297_natLogPolyEval_b);
            sumAHighB_uid298_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid298_natLogPolyEval_a) + SIGNED(sumAHighB_uid298_natLogPolyEval_b));
    sumAHighB_uid298_natLogPolyEval_q <= sumAHighB_uid298_natLogPolyEval_o(28 downto 0);


	--lowRangeB_uid296_natLogPolyEval(BITSELECT,295)@19
    lowRangeB_uid296_natLogPolyEval_in <= prodXYTruncFR_uid403_pT1_uid295_natLogPolyEval_b(0 downto 0);
    lowRangeB_uid296_natLogPolyEval_b <= lowRangeB_uid296_natLogPolyEval_in(0 downto 0);

	--s1_uid296_uid299_natLogPolyEval(BITJOIN,298)@19
    s1_uid296_uid299_natLogPolyEval_q <= sumAHighB_uid298_natLogPolyEval_q & lowRangeB_uid296_natLogPolyEval_b;

	--sSM1H_uid411_pT2_uid301_natLogPolyEval(BITSELECT,410)@19
    sSM1H_uid411_pT2_uid301_natLogPolyEval_in <= s1_uid296_uid299_natLogPolyEval_q;
    sSM1H_uid411_pT2_uid301_natLogPolyEval_b <= sSM1H_uid411_pT2_uid301_natLogPolyEval_in(29 downto 24);

	--reg_sSM1H_uid411_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_0(REG,576)@19
    reg_sSM1H_uid411_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sSM1H_uid411_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sSM1H_uid411_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_0_q <= sSM1H_uid411_pT2_uid301_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--sm1_uid413_pT2_uid301_natLogPolyEval(MULT,412)@20
    sm1_uid413_pT2_uid301_natLogPolyEval_pr <= SIGNED(sm1_uid413_pT2_uid301_natLogPolyEval_a) * signed(resize(UNSIGNED(sm1_uid413_pT2_uid301_natLogPolyEval_b),2));
    sm1_uid413_pT2_uid301_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm1_uid413_pT2_uid301_natLogPolyEval_a <= (others => '0');
            sm1_uid413_pT2_uid301_natLogPolyEval_b <= (others => '0');
            sm1_uid413_pT2_uid301_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm1_uid413_pT2_uid301_natLogPolyEval_a <= reg_sSM1H_uid411_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_0_q;
                sm1_uid413_pT2_uid301_natLogPolyEval_b <= ld_reg_sSM1W_uid412_pT2_uid301_natLogPolyEval_0_to_sm1_uid413_pT2_uid301_natLogPolyEval_1_q_to_sm1_uid413_pT2_uid301_natLogPolyEval_b_q;
                sm1_uid413_pT2_uid301_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(resize(sm1_uid413_pT2_uid301_natLogPolyEval_pr,7));
            END IF;
        END IF;
    END PROCESS;
    sm1_uid413_pT2_uid301_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm1_uid413_pT2_uid301_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm1_uid413_pT2_uid301_natLogPolyEval_q <= sm1_uid413_pT2_uid301_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--pad_sm1_uid413_uid415_pT2_uid301_natLogPolyEval(BITJOIN,414)@23
    pad_sm1_uid413_uid415_pT2_uid301_natLogPolyEval_q <= sm1_uid413_pT2_uid301_natLogPolyEval_q & STD_LOGIC_VECTOR((19 downto 1 => GND_q(0)) & GND_q);

	--sSM0W_uid409_pT2_uid301_natLogPolyEval(BITSELECT,408)@15
    sSM0W_uid409_pT2_uid301_natLogPolyEval_in <= yT2_uid300_natLogPolyEval_b;
    sSM0W_uid409_pT2_uid301_natLogPolyEval_b <= sSM0W_uid409_pT2_uid301_natLogPolyEval_in(27 downto 24);

	--ld_sSM0W_uid409_pT2_uid301_natLogPolyEval_b_to_reg_sSM0W_uid409_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_1_a(DELAY,1258)@15
    ld_sSM0W_uid409_pT2_uid301_natLogPolyEval_b_to_reg_sSM0W_uid409_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_1_a : dspba_delay
    GENERIC MAP ( width => 4, depth => 4 )
    PORT MAP ( xin => sSM0W_uid409_pT2_uid301_natLogPolyEval_b, xout => ld_sSM0W_uid409_pT2_uid301_natLogPolyEval_b_to_reg_sSM0W_uid409_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_sSM0W_uid409_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_1(REG,575)@19
    reg_sSM0W_uid409_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sSM0W_uid409_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_1_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sSM0W_uid409_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_1_q <= ld_sSM0W_uid409_pT2_uid301_natLogPolyEval_b_to_reg_sSM0W_uid409_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--sSM0H_uid408_pT2_uid301_natLogPolyEval(BITSELECT,407)@19
    sSM0H_uid408_pT2_uid301_natLogPolyEval_in <= s1_uid296_uid299_natLogPolyEval_q(2 downto 0);
    sSM0H_uid408_pT2_uid301_natLogPolyEval_b <= sSM0H_uid408_pT2_uid301_natLogPolyEval_in(2 downto 0);

	--reg_sSM0H_uid408_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_0(REG,574)@19
    reg_sSM0H_uid408_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sSM0H_uid408_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sSM0H_uid408_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_0_q <= sSM0H_uid408_pT2_uid301_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--sm0_uid410_pT2_uid301_natLogPolyEval(MULT,409)@20
    sm0_uid410_pT2_uid301_natLogPolyEval_pr <= UNSIGNED(sm0_uid410_pT2_uid301_natLogPolyEval_a) * UNSIGNED(sm0_uid410_pT2_uid301_natLogPolyEval_b);
    sm0_uid410_pT2_uid301_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid410_pT2_uid301_natLogPolyEval_a <= (others => '0');
            sm0_uid410_pT2_uid301_natLogPolyEval_b <= (others => '0');
            sm0_uid410_pT2_uid301_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm0_uid410_pT2_uid301_natLogPolyEval_a <= reg_sSM0H_uid408_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_0_q;
                sm0_uid410_pT2_uid301_natLogPolyEval_b <= reg_sSM0W_uid409_pT2_uid301_natLogPolyEval_0_to_sm0_uid410_pT2_uid301_natLogPolyEval_1_q;
                sm0_uid410_pT2_uid301_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid410_pT2_uid301_natLogPolyEval_pr);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid410_pT2_uid301_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid410_pT2_uid301_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm0_uid410_pT2_uid301_natLogPolyEval_q <= sm0_uid410_pT2_uid301_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--pad_sm0_uid410_uid414_pT2_uid301_natLogPolyEval(BITJOIN,413)@23
    pad_sm0_uid410_uid414_pT2_uid301_natLogPolyEval_q <= sm0_uid410_pT2_uid301_natLogPolyEval_q & STD_LOGIC_VECTOR((19 downto 1 => GND_q(0)) & GND_q);

	--yTop27Bits_uid406_pT2_uid301_natLogPolyEval(BITSELECT,405)@19
    yTop27Bits_uid406_pT2_uid301_natLogPolyEval_in <= s1_uid296_uid299_natLogPolyEval_q;
    yTop27Bits_uid406_pT2_uid301_natLogPolyEval_b <= yTop27Bits_uid406_pT2_uid301_natLogPolyEval_in(29 downto 3);

	--reg_yTop27Bits_uid406_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_1(REG,573)@19
    reg_yTop27Bits_uid406_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid406_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid406_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_1_q <= yTop27Bits_uid406_pT2_uid301_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_nor(LOGICAL,1716)
    ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_nor_b <= ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_sticky_ena_q;
    ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_nor_q <= not (ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_nor_a or ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_nor_b);

	--ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_sticky_ena(REG,1717)
    ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_nor_q = "1") THEN
                ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_sticky_ena_q <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_enaAnd(LOGICAL,1718)
    ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_enaAnd_a <= ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_sticky_ena_q;
    ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_enaAnd_b <= en;
    ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_enaAnd_q <= ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_enaAnd_a and ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_enaAnd_b;

	--xTop27Bits_uid405_pT2_uid301_natLogPolyEval(BITSELECT,404)@15
    xTop27Bits_uid405_pT2_uid301_natLogPolyEval_in <= yT2_uid300_natLogPolyEval_b;
    xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b <= xTop27Bits_uid405_pT2_uid301_natLogPolyEval_in(27 downto 1);

	--ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_inputreg(DELAY,1708)
    ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 27, depth => 1 )
    PORT MAP ( xin => xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b, xout => ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem(DUALMEM,1709)
    ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_ia <= ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_inputreg_q;
    ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_aa <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg_q;
    ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_ab <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_q;
    ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 27,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 27,
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
        clocken1 => ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_iq,
        address_a => ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_aa,
        data_a => ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_ia
    );
    ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_reset0 <= areset;
        ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_q <= ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_iq(26 downto 0);

	--reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0(REG,572)@19
    reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_q <= ld_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_b_to_reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--topProd_uid407_pT2_uid301_natLogPolyEval(MULT,406)@20
    topProd_uid407_pT2_uid301_natLogPolyEval_pr <= signed(resize(UNSIGNED(topProd_uid407_pT2_uid301_natLogPolyEval_a),28)) * SIGNED(topProd_uid407_pT2_uid301_natLogPolyEval_b);
    topProd_uid407_pT2_uid301_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid407_pT2_uid301_natLogPolyEval_a <= (others => '0');
            topProd_uid407_pT2_uid301_natLogPolyEval_b <= (others => '0');
            topProd_uid407_pT2_uid301_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid407_pT2_uid301_natLogPolyEval_a <= reg_xTop27Bits_uid405_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_0_q;
                topProd_uid407_pT2_uid301_natLogPolyEval_b <= reg_yTop27Bits_uid406_pT2_uid301_natLogPolyEval_0_to_topProd_uid407_pT2_uid301_natLogPolyEval_1_q;
                topProd_uid407_pT2_uid301_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid407_pT2_uid301_natLogPolyEval_pr,54));
            END IF;
        END IF;
    END PROCESS;
    topProd_uid407_pT2_uid301_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid407_pT2_uid301_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid407_pT2_uid301_natLogPolyEval_q <= topProd_uid407_pT2_uid301_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--add0_uid414_pT2_uid301_natLogPolyEval(ADDSUB3,415)@23
    add0_uid414_pT2_uid301_natLogPolyEval_a <= STD_LOGIC_VECTOR((54 downto 54 => topProd_uid407_pT2_uid301_natLogPolyEval_q(53)) & topProd_uid407_pT2_uid301_natLogPolyEval_q);
    add0_uid414_pT2_uid301_natLogPolyEval_b <= STD_LOGIC_VECTOR('0' & "000000000000000000000000000" & pad_sm0_uid410_uid414_pT2_uid301_natLogPolyEval_q);
    add0_uid414_pT2_uid301_natLogPolyEval_c <= STD_LOGIC_VECTOR((54 downto 27 => pad_sm1_uid413_uid415_pT2_uid301_natLogPolyEval_q(26)) & pad_sm1_uid413_uid415_pT2_uid301_natLogPolyEval_q);
    add0_uid414_pT2_uid301_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(add0_uid414_pT2_uid301_natLogPolyEval_a) + SIGNED(add0_uid414_pT2_uid301_natLogPolyEval_b) + SIGNED(add0_uid414_pT2_uid301_natLogPolyEval_c));
    add0_uid414_pT2_uid301_natLogPolyEval_q <= add0_uid414_pT2_uid301_natLogPolyEval_o(54 downto 0);


	--R_uid417_pT2_uid301_natLogPolyEval(BITSELECT,416)@23
    R_uid417_pT2_uid301_natLogPolyEval_in <= add0_uid414_pT2_uid301_natLogPolyEval_q(53 downto 0);
    R_uid417_pT2_uid301_natLogPolyEval_b <= R_uid417_pT2_uid301_natLogPolyEval_in(53 downto 24);

	--reg_R_uid417_pT2_uid301_natLogPolyEval_0_to_ts2_uid304_natLogPolyEval_1(REG,579)@23
    reg_R_uid417_pT2_uid301_natLogPolyEval_0_to_ts2_uid304_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid417_pT2_uid301_natLogPolyEval_0_to_ts2_uid304_natLogPolyEval_1_q <= "000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_R_uid417_pT2_uid301_natLogPolyEval_0_to_ts2_uid304_natLogPolyEval_1_q <= R_uid417_pT2_uid301_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_nor(LOGICAL,1596)
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_nor_b <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_sticky_ena_q;
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_nor_q <= not (ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_nor_a or ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_nor_b);

	--ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_mem_top(CONSTANT,1592)
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_mem_top_q <= "0101";

	--ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmp(LOGICAL,1593)
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmp_a <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_mem_top_q;
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdmux_q);
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmp_q <= "1" when ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmp_a = ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmp_b else "0";

	--ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmpReg(REG,1594)
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmpReg_q <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_sticky_ena(REG,1597)
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_nor_q = "1") THEN
                ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_sticky_ena_q <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_enaAnd(LOGICAL,1598)
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_enaAnd_a <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_sticky_ena_q;
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_enaAnd_b <= en;
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_enaAnd_q <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_enaAnd_a and ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_enaAnd_b;

	--memoryC2_uid285_natLogTabGen_lutmem(DUALMEM,483)@12
    memoryC2_uid285_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid285_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid285_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC2_uid285_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 8,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC2_uid285_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid285_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid285_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid285_natLogTabGen_lutmem_iq,
        address_a => memoryC2_uid285_natLogTabGen_lutmem_aa,
        data_a => memoryC2_uid285_natLogTabGen_lutmem_ia
    );
    memoryC2_uid285_natLogTabGen_lutmem_reset0 <= areset;
        memoryC2_uid285_natLogTabGen_lutmem_q <= memoryC2_uid285_natLogTabGen_lutmem_iq(7 downto 0);

	--reg_memoryC2_uid285_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_3(REG,559)@14
    reg_memoryC2_uid285_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid285_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid285_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_3_q <= memoryC2_uid285_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid284_natLogTabGen_lutmem(DUALMEM,482)@12
    memoryC2_uid284_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid284_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid284_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC2_uid284_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC2_uid284_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid284_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid284_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid284_natLogTabGen_lutmem_iq,
        address_a => memoryC2_uid284_natLogTabGen_lutmem_aa,
        data_a => memoryC2_uid284_natLogTabGen_lutmem_ia
    );
    memoryC2_uid284_natLogTabGen_lutmem_reset0 <= areset;
        memoryC2_uid284_natLogTabGen_lutmem_q <= memoryC2_uid284_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC2_uid284_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_2(REG,558)@14
    reg_memoryC2_uid284_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid284_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_2_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid284_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_2_q <= memoryC2_uid284_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid283_natLogTabGen_lutmem(DUALMEM,481)@12
    memoryC2_uid283_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid283_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid283_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC2_uid283_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC2_uid283_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid283_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid283_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid283_natLogTabGen_lutmem_iq,
        address_a => memoryC2_uid283_natLogTabGen_lutmem_aa,
        data_a => memoryC2_uid283_natLogTabGen_lutmem_ia
    );
    memoryC2_uid283_natLogTabGen_lutmem_reset0 <= areset;
        memoryC2_uid283_natLogTabGen_lutmem_q <= memoryC2_uid283_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC2_uid283_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_1(REG,557)@14
    reg_memoryC2_uid283_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid283_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_1_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid283_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_1_q <= memoryC2_uid283_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid282_natLogTabGen_lutmem(DUALMEM,480)@12
    memoryC2_uid282_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid282_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid282_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC2_uid282_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC2_uid282_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid282_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid282_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid282_natLogTabGen_lutmem_iq,
        address_a => memoryC2_uid282_natLogTabGen_lutmem_aa,
        data_a => memoryC2_uid282_natLogTabGen_lutmem_ia
    );
    memoryC2_uid282_natLogTabGen_lutmem_reset0 <= areset;
        memoryC2_uid282_natLogTabGen_lutmem_q <= memoryC2_uid282_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC2_uid282_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_0(REG,556)@14
    reg_memoryC2_uid282_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid282_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid282_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_0_q <= memoryC2_uid282_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid286_natLogTabGen(BITJOIN,285)@15
    os_uid286_natLogTabGen_q <= reg_memoryC2_uid285_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_3_q & reg_memoryC2_uid284_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_2_q & reg_memoryC2_uid283_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_1_q & reg_memoryC2_uid282_natLogTabGen_lutmem_0_to_os_uid286_natLogTabGen_0_q;

	--ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_inputreg(DELAY,1586)
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_inputreg : dspba_delay
    GENERIC MAP ( width => 38, depth => 1 )
    PORT MAP ( xin => os_uid286_natLogTabGen_q, xout => ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt(COUNTER,1588)
    -- every=1, low=0, high=5, step=1, init=1
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_i = 4 THEN
                      ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_eq = '1') THEN
                        ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_i <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_i - 5;
                    ELSE
                        ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_i <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_i,3));


	--ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdreg(REG,1589)
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdreg_q <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdmux(MUX,1590)
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdmux_s <= en;
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdmux: PROCESS (ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdmux_s, ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdreg_q, ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_q)
    BEGIN
            CASE ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdmux_s IS
                  WHEN "0" => ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdmux_q <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdreg_q;
                  WHEN "1" => ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdmux_q <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem(DUALMEM,1587)
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_ia <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_inputreg_q;
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_aa <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdreg_q;
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_ab <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdmux_q;
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 38,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 38,
        widthad_b => 3,
        numwords_b => 6,
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
        clocken1 => ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_iq,
        address_a => ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_aa,
        data_a => ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_ia
    );
    ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_reset0 <= areset;
        ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_q <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_iq(37 downto 0);

	--o2_uid97_fpLogE1pxTest(CONSTANT,96)
    o2_uid97_fpLogE1pxTest_q <= "01";

	--cIncludingRoundingBit_uid303_natLogPolyEval(BITJOIN,302)@23
    cIncludingRoundingBit_uid303_natLogPolyEval_q <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_mem_q & o2_uid97_fpLogE1pxTest_q;

	--reg_cIncludingRoundingBit_uid303_natLogPolyEval_0_to_ts2_uid304_natLogPolyEval_0(REG,578)@23
    reg_cIncludingRoundingBit_uid303_natLogPolyEval_0_to_ts2_uid304_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid303_natLogPolyEval_0_to_ts2_uid304_natLogPolyEval_0_q <= "0000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cIncludingRoundingBit_uid303_natLogPolyEval_0_to_ts2_uid304_natLogPolyEval_0_q <= cIncludingRoundingBit_uid303_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ts2_uid304_natLogPolyEval(ADD,303)@24
    ts2_uid304_natLogPolyEval_a <= STD_LOGIC_VECTOR((40 downto 40 => reg_cIncludingRoundingBit_uid303_natLogPolyEval_0_to_ts2_uid304_natLogPolyEval_0_q(39)) & reg_cIncludingRoundingBit_uid303_natLogPolyEval_0_to_ts2_uid304_natLogPolyEval_0_q);
    ts2_uid304_natLogPolyEval_b <= STD_LOGIC_VECTOR((40 downto 30 => reg_R_uid417_pT2_uid301_natLogPolyEval_0_to_ts2_uid304_natLogPolyEval_1_q(29)) & reg_R_uid417_pT2_uid301_natLogPolyEval_0_to_ts2_uid304_natLogPolyEval_1_q);
            ts2_uid304_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid304_natLogPolyEval_a) + SIGNED(ts2_uid304_natLogPolyEval_b));
    ts2_uid304_natLogPolyEval_q <= ts2_uid304_natLogPolyEval_o(40 downto 0);


	--s2_uid305_natLogPolyEval(BITSELECT,304)@24
    s2_uid305_natLogPolyEval_in <= ts2_uid304_natLogPolyEval_q;
    s2_uid305_natLogPolyEval_b <= s2_uid305_natLogPolyEval_in(40 downto 1);

	--yTop18Bits_uid424_pT3_uid307_natLogPolyEval(BITSELECT,423)@24
    yTop18Bits_uid424_pT3_uid307_natLogPolyEval_in <= s2_uid305_natLogPolyEval_b;
    yTop18Bits_uid424_pT3_uid307_natLogPolyEval_b <= yTop18Bits_uid424_pT3_uid307_natLogPolyEval_in(39 downto 22);

	--reg_yTop18Bits_uid424_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_9(REG,583)@24
    reg_yTop18Bits_uid424_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop18Bits_uid424_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_9_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop18Bits_uid424_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_9_q <= yTop18Bits_uid424_pT3_uid307_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_nor(LOGICAL,1609)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_nor_b <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_sticky_ena_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_nor_q <= not (ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_nor_a or ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_nor_b);

	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_sticky_ena(REG,1610)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_nor_q = "1") THEN
                ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_sticky_ena_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_enaAnd(LOGICAL,1611)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_enaAnd_a <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_sticky_ena_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_enaAnd_b <= en;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_enaAnd_q <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_enaAnd_a and ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_enaAnd_b;

	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_inputreg(DELAY,1599)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 43, depth => 1 )
    PORT MAP ( xin => zPPolyEval_uid91_fpLogE1pxTest_b, xout => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem(DUALMEM,1600)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_ia <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_inputreg_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_aa <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdreg_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_ab <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_rdmux_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 43,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 43,
        widthad_b => 3,
        numwords_b => 7,
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
        clocken1 => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_iq,
        address_a => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_aa,
        data_a => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_ia
    );
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_reset0 <= areset;
        ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_q <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_iq(42 downto 0);

	--yT3_uid306_natLogPolyEval(BITSELECT,305)@24
    yT3_uid306_natLogPolyEval_in <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_replace_mem_q;
    yT3_uid306_natLogPolyEval_b <= yT3_uid306_natLogPolyEval_in(42 downto 5);

	--xBottomBits_uid423_pT3_uid307_natLogPolyEval(BITSELECT,422)@24
    xBottomBits_uid423_pT3_uid307_natLogPolyEval_in <= yT3_uid306_natLogPolyEval_b(10 downto 0);
    xBottomBits_uid423_pT3_uid307_natLogPolyEval_b <= xBottomBits_uid423_pT3_uid307_natLogPolyEval_in(10 downto 0);

	--pad_xBottomBits_uid423_uid426_pT3_uid307_natLogPolyEval(BITJOIN,425)@24
    pad_xBottomBits_uid423_uid426_pT3_uid307_natLogPolyEval_q <= xBottomBits_uid423_pT3_uid307_natLogPolyEval_b & STD_LOGIC_VECTOR((5 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_xBottomBits_uid423_uid426_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_7(REG,582)@24
    reg_pad_xBottomBits_uid423_uid426_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_xBottomBits_uid423_uid426_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_7_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_xBottomBits_uid423_uid426_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_7_q <= pad_xBottomBits_uid423_uid426_pT3_uid307_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--yBottomBits_uid422_pT3_uid307_natLogPolyEval(BITSELECT,421)@24
    yBottomBits_uid422_pT3_uid307_natLogPolyEval_in <= s2_uid305_natLogPolyEval_b(12 downto 0);
    yBottomBits_uid422_pT3_uid307_natLogPolyEval_b <= yBottomBits_uid422_pT3_uid307_natLogPolyEval_in(12 downto 0);

	--spad_yBottomBits_uid422_uid425_pT3_uid307_natLogPolyEval(BITJOIN,424)@24
    spad_yBottomBits_uid422_uid425_pT3_uid307_natLogPolyEval_q <= GND_q & yBottomBits_uid422_pT3_uid307_natLogPolyEval_b;

	--pad_yBottomBits_uid422_uid427_pT3_uid307_natLogPolyEval(BITJOIN,426)@24
    pad_yBottomBits_uid422_uid427_pT3_uid307_natLogPolyEval_q <= spad_yBottomBits_uid422_uid425_pT3_uid307_natLogPolyEval_q & STD_LOGIC_VECTOR((3 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_yBottomBits_uid422_uid427_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_6(REG,581)@24
    reg_pad_yBottomBits_uid422_uid427_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_yBottomBits_uid422_uid427_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_6_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_yBottomBits_uid422_uid427_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_6_q <= pad_yBottomBits_uid422_uid427_pT3_uid307_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--xTop18Bits_uid421_pT3_uid307_natLogPolyEval(BITSELECT,420)@24
    xTop18Bits_uid421_pT3_uid307_natLogPolyEval_in <= yT3_uid306_natLogPolyEval_b;
    xTop18Bits_uid421_pT3_uid307_natLogPolyEval_b <= xTop18Bits_uid421_pT3_uid307_natLogPolyEval_in(37 downto 20);

	--reg_xTop18Bits_uid421_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_4(REG,580)@24
    reg_xTop18Bits_uid421_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop18Bits_uid421_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_4_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop18Bits_uid421_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_4_q <= xTop18Bits_uid421_pT3_uid307_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma(CHAINMULTADD,489)@25
    multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_a(0),19));
    multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_a(1),19));
    multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_p(0) <= multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_l(0) * multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_c(0);
    multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_p(1) <= multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_l(1) * multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_c(1);
    multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_w(0) <= RESIZE(multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_p(0),38) + RESIZE(multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_p(1),38);
    multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_x(0) <= multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_w(0);
    multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_y(0) <= multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_x(0);
    multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_a <= (others => (others => '0'));
            multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_c <= (others => (others => '0'));
            multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_a(0) <= RESIZE(UNSIGNED(reg_xTop18Bits_uid421_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_4_q),18);
            multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_a(1) <= RESIZE(UNSIGNED(reg_pad_xBottomBits_uid423_uid426_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_7_q),18);
            multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_c(0) <= RESIZE(SIGNED(reg_pad_yBottomBits_uid422_uid427_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_6_q),18);
            multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_c(1) <= RESIZE(SIGNED(reg_yTop18Bits_uid424_pT3_uid307_natLogPolyEval_0_to_multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_9_q),18);
            IF (en = "1") THEN
                multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_s(0) <= multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_delay : dspba_delay
    GENERIC MAP (width => 37, depth => 1)
    PORT MAP (xin => STD_LOGIC_VECTOR(multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_q, clk => clk, aclr => areset);

	--multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval(BITSELECT,428)@28
    multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_in <= multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_cma_q;
    multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_b <= multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_in(36 downto 4);

	--highBBits_uid431_pT3_uid307_natLogPolyEval(BITSELECT,430)@28
    highBBits_uid431_pT3_uid307_natLogPolyEval_in <= multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_b;
    highBBits_uid431_pT3_uid307_natLogPolyEval_b <= highBBits_uid431_pT3_uid307_natLogPolyEval_in(32 downto 4);

	--yTop27Bits_uid419_pT3_uid307_natLogPolyEval(BITSELECT,418)@24
    yTop27Bits_uid419_pT3_uid307_natLogPolyEval_in <= s2_uid305_natLogPolyEval_b;
    yTop27Bits_uid419_pT3_uid307_natLogPolyEval_b <= yTop27Bits_uid419_pT3_uid307_natLogPolyEval_in(39 downto 13);

	--reg_yTop27Bits_uid419_pT3_uid307_natLogPolyEval_0_to_topProd_uid420_pT3_uid307_natLogPolyEval_1(REG,585)@24
    reg_yTop27Bits_uid419_pT3_uid307_natLogPolyEval_0_to_topProd_uid420_pT3_uid307_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid419_pT3_uid307_natLogPolyEval_0_to_topProd_uid420_pT3_uid307_natLogPolyEval_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid419_pT3_uid307_natLogPolyEval_0_to_topProd_uid420_pT3_uid307_natLogPolyEval_1_q <= yTop27Bits_uid419_pT3_uid307_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--xTop27Bits_uid418_pT3_uid307_natLogPolyEval(BITSELECT,417)@24
    xTop27Bits_uid418_pT3_uid307_natLogPolyEval_in <= yT3_uid306_natLogPolyEval_b;
    xTop27Bits_uid418_pT3_uid307_natLogPolyEval_b <= xTop27Bits_uid418_pT3_uid307_natLogPolyEval_in(37 downto 11);

	--reg_xTop27Bits_uid418_pT3_uid307_natLogPolyEval_0_to_topProd_uid420_pT3_uid307_natLogPolyEval_0(REG,584)@24
    reg_xTop27Bits_uid418_pT3_uid307_natLogPolyEval_0_to_topProd_uid420_pT3_uid307_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid418_pT3_uid307_natLogPolyEval_0_to_topProd_uid420_pT3_uid307_natLogPolyEval_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop27Bits_uid418_pT3_uid307_natLogPolyEval_0_to_topProd_uid420_pT3_uid307_natLogPolyEval_0_q <= xTop27Bits_uid418_pT3_uid307_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--topProd_uid420_pT3_uid307_natLogPolyEval(MULT,419)@25
    topProd_uid420_pT3_uid307_natLogPolyEval_pr <= signed(resize(UNSIGNED(topProd_uid420_pT3_uid307_natLogPolyEval_a),28)) * SIGNED(topProd_uid420_pT3_uid307_natLogPolyEval_b);
    topProd_uid420_pT3_uid307_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid420_pT3_uid307_natLogPolyEval_a <= (others => '0');
            topProd_uid420_pT3_uid307_natLogPolyEval_b <= (others => '0');
            topProd_uid420_pT3_uid307_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid420_pT3_uid307_natLogPolyEval_a <= reg_xTop27Bits_uid418_pT3_uid307_natLogPolyEval_0_to_topProd_uid420_pT3_uid307_natLogPolyEval_0_q;
                topProd_uid420_pT3_uid307_natLogPolyEval_b <= reg_yTop27Bits_uid419_pT3_uid307_natLogPolyEval_0_to_topProd_uid420_pT3_uid307_natLogPolyEval_1_q;
                topProd_uid420_pT3_uid307_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid420_pT3_uid307_natLogPolyEval_pr,54));
            END IF;
        END IF;
    END PROCESS;
    topProd_uid420_pT3_uid307_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid420_pT3_uid307_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid420_pT3_uid307_natLogPolyEval_q <= topProd_uid420_pT3_uid307_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--sumAHighB_uid432_pT3_uid307_natLogPolyEval(ADD,431)@28
    sumAHighB_uid432_pT3_uid307_natLogPolyEval_a <= STD_LOGIC_VECTOR((54 downto 54 => topProd_uid420_pT3_uid307_natLogPolyEval_q(53)) & topProd_uid420_pT3_uid307_natLogPolyEval_q);
    sumAHighB_uid432_pT3_uid307_natLogPolyEval_b <= STD_LOGIC_VECTOR((54 downto 29 => highBBits_uid431_pT3_uid307_natLogPolyEval_b(28)) & highBBits_uid431_pT3_uid307_natLogPolyEval_b);
            sumAHighB_uid432_pT3_uid307_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid432_pT3_uid307_natLogPolyEval_a) + SIGNED(sumAHighB_uid432_pT3_uid307_natLogPolyEval_b));
    sumAHighB_uid432_pT3_uid307_natLogPolyEval_q <= sumAHighB_uid432_pT3_uid307_natLogPolyEval_o(54 downto 0);


	--lowRangeB_uid430_pT3_uid307_natLogPolyEval(BITSELECT,429)@28
    lowRangeB_uid430_pT3_uid307_natLogPolyEval_in <= multSumOfTwo18_uid425_pT3_uid307_natLogPolyEval_b(3 downto 0);
    lowRangeB_uid430_pT3_uid307_natLogPolyEval_b <= lowRangeB_uid430_pT3_uid307_natLogPolyEval_in(3 downto 0);

	--add0_uid430_uid433_pT3_uid307_natLogPolyEval(BITJOIN,432)@28
    add0_uid430_uid433_pT3_uid307_natLogPolyEval_q <= sumAHighB_uid432_pT3_uid307_natLogPolyEval_q & lowRangeB_uid430_pT3_uid307_natLogPolyEval_b;

	--R_uid434_pT3_uid307_natLogPolyEval(BITSELECT,433)@28
    R_uid434_pT3_uid307_natLogPolyEval_in <= add0_uid430_uid433_pT3_uid307_natLogPolyEval_q(57 downto 0);
    R_uid434_pT3_uid307_natLogPolyEval_b <= R_uid434_pT3_uid307_natLogPolyEval_in(57 downto 17);

	--reg_R_uid434_pT3_uid307_natLogPolyEval_0_to_ts3_uid310_natLogPolyEval_1(REG,587)@28
    reg_R_uid434_pT3_uid307_natLogPolyEval_0_to_ts3_uid310_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid434_pT3_uid307_natLogPolyEval_0_to_ts3_uid310_natLogPolyEval_1_q <= "00000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_R_uid434_pT3_uid307_natLogPolyEval_0_to_ts3_uid310_natLogPolyEval_1_q <= R_uid434_pT3_uid307_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_nor(LOGICAL,1622)
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_nor_b <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_sticky_ena_q;
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_nor_q <= not (ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_nor_a or ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_nor_b);

	--ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_mem_top(CONSTANT,1618)
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_mem_top_q <= "01010";

	--ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmp(LOGICAL,1619)
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmp_a <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_mem_top_q;
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdmux_q);
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmp_q <= "1" when ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmp_a = ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmp_b else "0";

	--ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmpReg(REG,1620)
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmpReg_q <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_sticky_ena(REG,1623)
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_nor_q = "1") THEN
                ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_sticky_ena_q <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_enaAnd(LOGICAL,1624)
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_enaAnd_a <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_sticky_ena_q;
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_enaAnd_b <= en;
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_enaAnd_q <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_enaAnd_a and ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_enaAnd_b;

	--memoryC1_uid280_natLogTabGen_lutmem(DUALMEM,479)@12
    memoryC1_uid280_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid280_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid280_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC1_uid280_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 8,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC1_uid280_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid280_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid280_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid280_natLogTabGen_lutmem_iq,
        address_a => memoryC1_uid280_natLogTabGen_lutmem_aa,
        data_a => memoryC1_uid280_natLogTabGen_lutmem_ia
    );
    memoryC1_uid280_natLogTabGen_lutmem_reset0 <= areset;
        memoryC1_uid280_natLogTabGen_lutmem_q <= memoryC1_uid280_natLogTabGen_lutmem_iq(7 downto 0);

	--reg_memoryC1_uid280_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_4(REG,551)@14
    reg_memoryC1_uid280_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid280_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_4_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid280_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_4_q <= memoryC1_uid280_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid279_natLogTabGen_lutmem(DUALMEM,478)@12
    memoryC1_uid279_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid279_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid279_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC1_uid279_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC1_uid279_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid279_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid279_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid279_natLogTabGen_lutmem_iq,
        address_a => memoryC1_uid279_natLogTabGen_lutmem_aa,
        data_a => memoryC1_uid279_natLogTabGen_lutmem_ia
    );
    memoryC1_uid279_natLogTabGen_lutmem_reset0 <= areset;
        memoryC1_uid279_natLogTabGen_lutmem_q <= memoryC1_uid279_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC1_uid279_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_3(REG,550)@14
    reg_memoryC1_uid279_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid279_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_3_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid279_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_3_q <= memoryC1_uid279_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid278_natLogTabGen_lutmem(DUALMEM,477)@12
    memoryC1_uid278_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid278_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid278_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC1_uid278_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC1_uid278_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid278_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid278_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid278_natLogTabGen_lutmem_iq,
        address_a => memoryC1_uid278_natLogTabGen_lutmem_aa,
        data_a => memoryC1_uid278_natLogTabGen_lutmem_ia
    );
    memoryC1_uid278_natLogTabGen_lutmem_reset0 <= areset;
        memoryC1_uid278_natLogTabGen_lutmem_q <= memoryC1_uid278_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC1_uid278_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_2(REG,549)@14
    reg_memoryC1_uid278_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid278_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_2_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid278_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_2_q <= memoryC1_uid278_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid277_natLogTabGen_lutmem(DUALMEM,476)@12
    memoryC1_uid277_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid277_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid277_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC1_uid277_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC1_uid277_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid277_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid277_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid277_natLogTabGen_lutmem_iq,
        address_a => memoryC1_uid277_natLogTabGen_lutmem_aa,
        data_a => memoryC1_uid277_natLogTabGen_lutmem_ia
    );
    memoryC1_uid277_natLogTabGen_lutmem_reset0 <= areset;
        memoryC1_uid277_natLogTabGen_lutmem_q <= memoryC1_uid277_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC1_uid277_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_1(REG,548)@14
    reg_memoryC1_uid277_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid277_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_1_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid277_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_1_q <= memoryC1_uid277_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid276_natLogTabGen_lutmem(DUALMEM,475)@12
    memoryC1_uid276_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid276_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid276_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC1_uid276_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC1_uid276_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid276_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid276_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid276_natLogTabGen_lutmem_iq,
        address_a => memoryC1_uid276_natLogTabGen_lutmem_aa,
        data_a => memoryC1_uid276_natLogTabGen_lutmem_ia
    );
    memoryC1_uid276_natLogTabGen_lutmem_reset0 <= areset;
        memoryC1_uid276_natLogTabGen_lutmem_q <= memoryC1_uid276_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC1_uid276_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_0(REG,547)@14
    reg_memoryC1_uid276_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid276_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid276_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_0_q <= memoryC1_uid276_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid281_natLogTabGen(BITJOIN,280)@15
    os_uid281_natLogTabGen_q <= reg_memoryC1_uid280_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_4_q & reg_memoryC1_uid279_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_3_q & reg_memoryC1_uid278_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_2_q & reg_memoryC1_uid277_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_1_q & reg_memoryC1_uid276_natLogTabGen_lutmem_0_to_os_uid281_natLogTabGen_0_q;

	--ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_inputreg(DELAY,1612)
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_inputreg : dspba_delay
    GENERIC MAP ( width => 48, depth => 1 )
    PORT MAP ( xin => os_uid281_natLogTabGen_q, xout => ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt(COUNTER,1614)
    -- every=1, low=0, high=10, step=1, init=1
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_i = 9 THEN
                      ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_eq = '1') THEN
                        ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_i <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_i - 10;
                    ELSE
                        ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_i <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_i,4));


	--ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdreg(REG,1615)
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdreg_q <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdmux(MUX,1616)
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdmux_s <= en;
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdmux: PROCESS (ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdmux_s, ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdreg_q, ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_q)
    BEGIN
            CASE ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdmux_s IS
                  WHEN "0" => ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdmux_q <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdreg_q;
                  WHEN "1" => ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdmux_q <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem(DUALMEM,1613)
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_ia <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_inputreg_q;
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_aa <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdreg_q;
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_ab <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_rdmux_q;
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 48,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 48,
        widthad_b => 4,
        numwords_b => 11,
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
        clocken1 => ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_iq,
        address_a => ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_aa,
        data_a => ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_ia
    );
    ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_reset0 <= areset;
        ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_q <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_iq(47 downto 0);

	--cIncludingRoundingBit_uid309_natLogPolyEval(BITJOIN,308)@28
    cIncludingRoundingBit_uid309_natLogPolyEval_q <= ld_os_uid281_natLogTabGen_q_to_cIncludingRoundingBit_uid309_natLogPolyEval_b_replace_mem_q & o2_uid97_fpLogE1pxTest_q;

	--reg_cIncludingRoundingBit_uid309_natLogPolyEval_0_to_ts3_uid310_natLogPolyEval_0(REG,586)@28
    reg_cIncludingRoundingBit_uid309_natLogPolyEval_0_to_ts3_uid310_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid309_natLogPolyEval_0_to_ts3_uid310_natLogPolyEval_0_q <= "00000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cIncludingRoundingBit_uid309_natLogPolyEval_0_to_ts3_uid310_natLogPolyEval_0_q <= cIncludingRoundingBit_uid309_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ts3_uid310_natLogPolyEval(ADD,309)@29
    ts3_uid310_natLogPolyEval_a <= STD_LOGIC_VECTOR((50 downto 50 => reg_cIncludingRoundingBit_uid309_natLogPolyEval_0_to_ts3_uid310_natLogPolyEval_0_q(49)) & reg_cIncludingRoundingBit_uid309_natLogPolyEval_0_to_ts3_uid310_natLogPolyEval_0_q);
    ts3_uid310_natLogPolyEval_b <= STD_LOGIC_VECTOR((50 downto 41 => reg_R_uid434_pT3_uid307_natLogPolyEval_0_to_ts3_uid310_natLogPolyEval_1_q(40)) & reg_R_uid434_pT3_uid307_natLogPolyEval_0_to_ts3_uid310_natLogPolyEval_1_q);
            ts3_uid310_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts3_uid310_natLogPolyEval_a) + SIGNED(ts3_uid310_natLogPolyEval_b));
    ts3_uid310_natLogPolyEval_q <= ts3_uid310_natLogPolyEval_o(50 downto 0);


	--s3_uid311_natLogPolyEval(BITSELECT,310)@29
    s3_uid311_natLogPolyEval_in <= ts3_uid310_natLogPolyEval_q;
    s3_uid311_natLogPolyEval_b <= s3_uid311_natLogPolyEval_in(50 downto 1);

	--yTop27Bits_uid436_pT4_uid313_natLogPolyEval(BITSELECT,435)@29
    yTop27Bits_uid436_pT4_uid313_natLogPolyEval_in <= s3_uid311_natLogPolyEval_b;
    yTop27Bits_uid436_pT4_uid313_natLogPolyEval_b <= yTop27Bits_uid436_pT4_uid313_natLogPolyEval_in(49 downto 23);

	--reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_9(REG,591)@29
    reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_9_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_9_q <= yTop27Bits_uid436_pT4_uid313_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_nor(LOGICAL,1705)
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_nor_b <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_sticky_ena_q;
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_nor_q <= not (ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_nor_a or ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_nor_b);

	--ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_mem_top(CONSTANT,1701)
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_mem_top_q <= "01011";

	--ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmp(LOGICAL,1702)
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmp_a <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_mem_top_q;
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdmux_q);
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmp_q <= "1" when ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmp_a = ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmp_b else "0";

	--ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmpReg(REG,1703)
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmpReg_q <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_sticky_ena(REG,1706)
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_nor_q = "1") THEN
                ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_sticky_ena_q <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_enaAnd(LOGICAL,1707)
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_enaAnd_a <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_sticky_ena_q;
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_enaAnd_b <= en;
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_enaAnd_q <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_enaAnd_a and ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_enaAnd_b;

	--xBottomBits_uid439_pT4_uid313_natLogPolyEval(BITSELECT,438)@15
    xBottomBits_uid439_pT4_uid313_natLogPolyEval_in <= zPPolyEval_uid91_fpLogE1pxTest_b(15 downto 0);
    xBottomBits_uid439_pT4_uid313_natLogPolyEval_b <= xBottomBits_uid439_pT4_uid313_natLogPolyEval_in(15 downto 0);

	--ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_inputreg(DELAY,1695)
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xBottomBits_uid439_pT4_uid313_natLogPolyEval_b, xout => ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt(COUNTER,1697)
    -- every=1, low=0, high=11, step=1, init=1
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_i = 10 THEN
                      ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_eq = '1') THEN
                        ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_i <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_i - 11;
                    ELSE
                        ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_i <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_i,4));


	--ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdreg(REG,1698)
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdreg_q <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdmux(MUX,1699)
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdmux_s <= en;
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdmux: PROCESS (ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdmux_s, ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdreg_q, ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_q)
    BEGIN
            CASE ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdmux_s IS
                  WHEN "0" => ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdmux_q <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdreg_q;
                  WHEN "1" => ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdmux_q <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem(DUALMEM,1696)
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_ia <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_inputreg_q;
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_aa <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdreg_q;
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_ab <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_rdmux_q;
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 16,
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
        clocken1 => ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_iq,
        address_a => ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_aa,
        data_a => ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_ia
    );
    ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_reset0 <= areset;
        ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_q <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_iq(15 downto 0);

	--pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval(BITJOIN,440)@29
    pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_q <= ld_xBottomBits_uid439_pT4_uid313_natLogPolyEval_b_to_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_b_replace_mem_q & STD_LOGIC_VECTOR((9 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_7(REG,590)@29
    reg_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_7_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_7_q <= pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--yBottomBits_uid438_pT4_uid313_natLogPolyEval(BITSELECT,437)@29
    yBottomBits_uid438_pT4_uid313_natLogPolyEval_in <= s3_uid311_natLogPolyEval_b(22 downto 0);
    yBottomBits_uid438_pT4_uid313_natLogPolyEval_b <= yBottomBits_uid438_pT4_uid313_natLogPolyEval_in(22 downto 0);

	--ld_yBottomBits_uid438_pT4_uid313_natLogPolyEval_b_to_spad_yBottomBits_uid438_uid440_pT4_uid313_natLogPolyEval_a(DELAY,1104)@29
    ld_yBottomBits_uid438_pT4_uid313_natLogPolyEval_b_to_spad_yBottomBits_uid438_uid440_pT4_uid313_natLogPolyEval_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => yBottomBits_uid438_pT4_uid313_natLogPolyEval_b, xout => ld_yBottomBits_uid438_pT4_uid313_natLogPolyEval_b_to_spad_yBottomBits_uid438_uid440_pT4_uid313_natLogPolyEval_a_q, ena => en(0), clk => clk, aclr => areset );

	--spad_yBottomBits_uid438_uid440_pT4_uid313_natLogPolyEval(BITJOIN,439)@30
    spad_yBottomBits_uid438_uid440_pT4_uid313_natLogPolyEval_q <= GND_q & ld_yBottomBits_uid438_pT4_uid313_natLogPolyEval_b_to_spad_yBottomBits_uid438_uid440_pT4_uid313_natLogPolyEval_a_q;

	--pad_yBottomBits_uid438_uid442_pT4_uid313_natLogPolyEval(BITJOIN,441)@30
    pad_yBottomBits_uid438_uid442_pT4_uid313_natLogPolyEval_q <= spad_yBottomBits_uid438_uid440_pT4_uid313_natLogPolyEval_q & STD_LOGIC_VECTOR((2 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_yBottomBits_uid438_uid442_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_6(REG,589)@30
    reg_pad_yBottomBits_uid438_uid442_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_yBottomBits_uid438_uid442_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_6_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_yBottomBits_uid438_uid442_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_6_q <= pad_yBottomBits_uid438_uid442_pT4_uid313_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_nor(LOGICAL,1692)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_nor_b <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_sticky_ena_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_nor_q <= not (ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_nor_a or ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_nor_b);

	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_mem_top(CONSTANT,1688)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_mem_top_q <= "01100";

	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmp(LOGICAL,1689)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmp_a <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_mem_top_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdmux_q);
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmp_q <= "1" when ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmp_a = ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmp_b else "0";

	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmpReg(REG,1690)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmpReg_q <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_sticky_ena(REG,1693)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_nor_q = "1") THEN
                ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_sticky_ena_q <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_enaAnd(LOGICAL,1694)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_enaAnd_a <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_sticky_ena_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_enaAnd_b <= en;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_enaAnd_q <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_enaAnd_a and ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_enaAnd_b;

	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt(COUNTER,1684)
    -- every=1, low=0, high=12, step=1, init=1
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_i = 11 THEN
                      ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_i <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_i - 12;
                    ELSE
                        ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_i <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_i,4));


	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdreg(REG,1685)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdreg_q <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdmux(MUX,1686)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdmux_s <= en;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdmux: PROCESS (ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdmux_s, ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdreg_q, ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdmux_q <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdmux_q <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem(DUALMEM,1683)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_ia <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_yT3_uid306_natLogPolyEval_a_inputreg_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_aa <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdreg_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_ab <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_rdmux_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 43,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 43,
        widthad_b => 4,
        numwords_b => 13,
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
        clocken1 => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_iq,
        address_a => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_aa,
        data_a => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_ia
    );
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_reset0 <= areset;
        ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_q <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_iq(42 downto 0);

	--xTop27Bits_uid435_pT4_uid313_natLogPolyEval(BITSELECT,434)@30
    xTop27Bits_uid435_pT4_uid313_natLogPolyEval_in <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_a_replace_mem_q;
    xTop27Bits_uid435_pT4_uid313_natLogPolyEval_b <= xTop27Bits_uid435_pT4_uid313_natLogPolyEval_in(42 downto 16);

	--reg_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_4(REG,588)@30
    reg_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_4_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_4_q <= xTop27Bits_uid435_pT4_uid313_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma(CHAINMULTADD,490)@31
    multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_a(0),28));
    multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_a(1),28));
    multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_p(0) <= multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_l(0) * multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_c(0);
    multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_p(1) <= multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_l(1) * multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_c(1);
    multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_w(0) <= RESIZE(multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_p(0),56);
    multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_w(1) <= RESIZE(multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_p(1),56);
    multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_x(0) <= multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_w(0);
    multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_x(1) <= multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_w(1);
    multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_y(0) <= multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_s(1) + multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_x(0);
    multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_y(1) <= multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_x(1);
    multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_a <= (others => (others => '0'));
            multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_c <= (others => (others => '0'));
            multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_a(0) <= RESIZE(UNSIGNED(reg_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_4_q),27);
            multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_a(1) <= RESIZE(UNSIGNED(reg_pad_xBottomBits_uid439_uid441_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_7_q),27);
            multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_c(0) <= RESIZE(SIGNED(reg_pad_yBottomBits_uid438_uid442_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_6_q),27);
            multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_c(1) <= RESIZE(SIGNED(reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_9_q),27);
            IF (en = "1") THEN
                multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_s(0) <= multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_y(0);
                multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_s(1) <= multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_y(1);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_delay : dspba_delay
    GENERIC MAP (width => 55, depth => 1)
    PORT MAP (xin => STD_LOGIC_VECTOR(multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_s(0)(54 downto 0)), xout => multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_q, clk => clk, aclr => areset);

	--multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval(BITSELECT,443)@34
    multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_in <= multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_q;
    multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_b <= multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_in(54 downto 3);

	--highBBits_uid446_pT4_uid313_natLogPolyEval(BITSELECT,445)@34
    highBBits_uid446_pT4_uid313_natLogPolyEval_in <= multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_b;
    highBBits_uid446_pT4_uid313_natLogPolyEval_b <= highBBits_uid446_pT4_uid313_natLogPolyEval_in(51 downto 23);

	--ld_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_b_to_reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_topProd_uid437_pT4_uid313_natLogPolyEval_1_a(DELAY,1276)@29
    ld_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_b_to_reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_topProd_uid437_pT4_uid313_natLogPolyEval_1_a : dspba_delay
    GENERIC MAP ( width => 27, depth => 1 )
    PORT MAP ( xin => yTop27Bits_uid436_pT4_uid313_natLogPolyEval_b, xout => ld_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_b_to_reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_topProd_uid437_pT4_uid313_natLogPolyEval_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_topProd_uid437_pT4_uid313_natLogPolyEval_1(REG,593)@30
    reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_topProd_uid437_pT4_uid313_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_topProd_uid437_pT4_uid313_natLogPolyEval_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_topProd_uid437_pT4_uid313_natLogPolyEval_1_q <= ld_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_b_to_reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_topProd_uid437_pT4_uid313_natLogPolyEval_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--topProd_uid437_pT4_uid313_natLogPolyEval(MULT,436)@31
    topProd_uid437_pT4_uid313_natLogPolyEval_pr <= signed(resize(UNSIGNED(topProd_uid437_pT4_uid313_natLogPolyEval_a),28)) * SIGNED(topProd_uid437_pT4_uid313_natLogPolyEval_b);
    topProd_uid437_pT4_uid313_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid437_pT4_uid313_natLogPolyEval_a <= (others => '0');
            topProd_uid437_pT4_uid313_natLogPolyEval_b <= (others => '0');
            topProd_uid437_pT4_uid313_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid437_pT4_uid313_natLogPolyEval_a <= reg_xTop27Bits_uid435_pT4_uid313_natLogPolyEval_0_to_multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_cma_4_q;
                topProd_uid437_pT4_uid313_natLogPolyEval_b <= reg_yTop27Bits_uid436_pT4_uid313_natLogPolyEval_0_to_topProd_uid437_pT4_uid313_natLogPolyEval_1_q;
                topProd_uid437_pT4_uid313_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid437_pT4_uid313_natLogPolyEval_pr,54));
            END IF;
        END IF;
    END PROCESS;
    topProd_uid437_pT4_uid313_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid437_pT4_uid313_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid437_pT4_uid313_natLogPolyEval_q <= topProd_uid437_pT4_uid313_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--sumAHighB_uid447_pT4_uid313_natLogPolyEval(ADD,446)@34
    sumAHighB_uid447_pT4_uid313_natLogPolyEval_a <= STD_LOGIC_VECTOR((54 downto 54 => topProd_uid437_pT4_uid313_natLogPolyEval_q(53)) & topProd_uid437_pT4_uid313_natLogPolyEval_q);
    sumAHighB_uid447_pT4_uid313_natLogPolyEval_b <= STD_LOGIC_VECTOR((54 downto 29 => highBBits_uid446_pT4_uid313_natLogPolyEval_b(28)) & highBBits_uid446_pT4_uid313_natLogPolyEval_b);
            sumAHighB_uid447_pT4_uid313_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid447_pT4_uid313_natLogPolyEval_a) + SIGNED(sumAHighB_uid447_pT4_uid313_natLogPolyEval_b));
    sumAHighB_uid447_pT4_uid313_natLogPolyEval_q <= sumAHighB_uid447_pT4_uid313_natLogPolyEval_o(54 downto 0);


	--lowRangeB_uid445_pT4_uid313_natLogPolyEval(BITSELECT,444)@34
    lowRangeB_uid445_pT4_uid313_natLogPolyEval_in <= multSumOfTwo27_uid440_pT4_uid313_natLogPolyEval_b(22 downto 0);
    lowRangeB_uid445_pT4_uid313_natLogPolyEval_b <= lowRangeB_uid445_pT4_uid313_natLogPolyEval_in(22 downto 0);

	--add0_uid445_uid448_pT4_uid313_natLogPolyEval(BITJOIN,447)@34
    add0_uid445_uid448_pT4_uid313_natLogPolyEval_q <= sumAHighB_uid447_pT4_uid313_natLogPolyEval_q & lowRangeB_uid445_pT4_uid313_natLogPolyEval_b;

	--R_uid449_pT4_uid313_natLogPolyEval(BITSELECT,448)@34
    R_uid449_pT4_uid313_natLogPolyEval_in <= add0_uid445_uid448_pT4_uid313_natLogPolyEval_q(76 downto 0);
    R_uid449_pT4_uid313_natLogPolyEval_b <= R_uid449_pT4_uid313_natLogPolyEval_in(76 downto 25);

	--reg_R_uid449_pT4_uid313_natLogPolyEval_0_to_ts4_uid316_natLogPolyEval_1(REG,595)@34
    reg_R_uid449_pT4_uid313_natLogPolyEval_0_to_ts4_uid316_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid449_pT4_uid313_natLogPolyEval_0_to_ts4_uid316_natLogPolyEval_1_q <= "0000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_R_uid449_pT4_uid313_natLogPolyEval_0_to_ts4_uid316_natLogPolyEval_1_q <= R_uid449_pT4_uid313_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_nor(LOGICAL,1635)
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_nor_b <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_sticky_ena_q;
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_nor_q <= not (ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_nor_a or ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_nor_b);

	--ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_mem_top(CONSTANT,1631)
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_mem_top_q <= "010000";

	--ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmp(LOGICAL,1632)
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmp_a <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_mem_top_q;
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdmux_q);
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmp_q <= "1" when ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmp_a = ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmp_b else "0";

	--ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmpReg(REG,1633)
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmpReg_q <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_sticky_ena(REG,1636)
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_nor_q = "1") THEN
                ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_sticky_ena_q <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_enaAnd(LOGICAL,1637)
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_enaAnd_a <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_sticky_ena_q;
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_enaAnd_b <= en;
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_enaAnd_q <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_enaAnd_a and ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_enaAnd_b;

	--memoryC0_uid274_natLogTabGen_lutmem(DUALMEM,474)@12
    memoryC0_uid274_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid274_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid274_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC0_uid274_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC0_uid274_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid274_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid274_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid274_natLogTabGen_lutmem_iq,
        address_a => memoryC0_uid274_natLogTabGen_lutmem_aa,
        data_a => memoryC0_uid274_natLogTabGen_lutmem_ia
    );
    memoryC0_uid274_natLogTabGen_lutmem_reset0 <= areset;
        memoryC0_uid274_natLogTabGen_lutmem_q <= memoryC0_uid274_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC0_uid274_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_5(REG,541)@14
    reg_memoryC0_uid274_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid274_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_5_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid274_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_5_q <= memoryC0_uid274_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid273_natLogTabGen_lutmem(DUALMEM,473)@12
    memoryC0_uid273_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid273_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid273_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC0_uid273_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC0_uid273_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid273_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid273_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid273_natLogTabGen_lutmem_iq,
        address_a => memoryC0_uid273_natLogTabGen_lutmem_aa,
        data_a => memoryC0_uid273_natLogTabGen_lutmem_ia
    );
    memoryC0_uid273_natLogTabGen_lutmem_reset0 <= areset;
        memoryC0_uid273_natLogTabGen_lutmem_q <= memoryC0_uid273_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC0_uid273_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_4(REG,540)@14
    reg_memoryC0_uid273_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid273_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_4_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid273_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_4_q <= memoryC0_uid273_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid272_natLogTabGen_lutmem(DUALMEM,472)@12
    memoryC0_uid272_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid272_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid272_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC0_uid272_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC0_uid272_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid272_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid272_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid272_natLogTabGen_lutmem_iq,
        address_a => memoryC0_uid272_natLogTabGen_lutmem_aa,
        data_a => memoryC0_uid272_natLogTabGen_lutmem_ia
    );
    memoryC0_uid272_natLogTabGen_lutmem_reset0 <= areset;
        memoryC0_uid272_natLogTabGen_lutmem_q <= memoryC0_uid272_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC0_uid272_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_3(REG,539)@14
    reg_memoryC0_uid272_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid272_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_3_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid272_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_3_q <= memoryC0_uid272_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid271_natLogTabGen_lutmem(DUALMEM,471)@12
    memoryC0_uid271_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid271_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid271_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC0_uid271_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC0_uid271_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid271_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid271_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid271_natLogTabGen_lutmem_iq,
        address_a => memoryC0_uid271_natLogTabGen_lutmem_aa,
        data_a => memoryC0_uid271_natLogTabGen_lutmem_ia
    );
    memoryC0_uid271_natLogTabGen_lutmem_reset0 <= areset;
        memoryC0_uid271_natLogTabGen_lutmem_q <= memoryC0_uid271_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC0_uid271_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_2(REG,538)@14
    reg_memoryC0_uid271_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid271_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_2_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid271_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_2_q <= memoryC0_uid271_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid270_natLogTabGen_lutmem(DUALMEM,470)@12
    memoryC0_uid270_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid270_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid270_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC0_uid270_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC0_uid270_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid270_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid270_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid270_natLogTabGen_lutmem_iq,
        address_a => memoryC0_uid270_natLogTabGen_lutmem_aa,
        data_a => memoryC0_uid270_natLogTabGen_lutmem_ia
    );
    memoryC0_uid270_natLogTabGen_lutmem_reset0 <= areset;
        memoryC0_uid270_natLogTabGen_lutmem_q <= memoryC0_uid270_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC0_uid270_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_1(REG,537)@14
    reg_memoryC0_uid270_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid270_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_1_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid270_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_1_q <= memoryC0_uid270_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid269_natLogTabGen_lutmem(DUALMEM,469)@12
    memoryC0_uid269_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid269_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid269_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid269_natLogTabGen_lutmem_0_q;
    memoryC0_uid269_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln1p_double_s5_memoryC0_uid269_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid269_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid269_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid269_natLogTabGen_lutmem_iq,
        address_a => memoryC0_uid269_natLogTabGen_lutmem_aa,
        data_a => memoryC0_uid269_natLogTabGen_lutmem_ia
    );
    memoryC0_uid269_natLogTabGen_lutmem_reset0 <= areset;
        memoryC0_uid269_natLogTabGen_lutmem_q <= memoryC0_uid269_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC0_uid269_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_0(REG,536)@14
    reg_memoryC0_uid269_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid269_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid269_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_0_q <= memoryC0_uid269_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid275_natLogTabGen(BITJOIN,274)@15
    os_uid275_natLogTabGen_q <= reg_memoryC0_uid274_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_5_q & reg_memoryC0_uid273_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_4_q & reg_memoryC0_uid272_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_3_q & reg_memoryC0_uid271_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_2_q & reg_memoryC0_uid270_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_1_q & reg_memoryC0_uid269_natLogTabGen_lutmem_0_to_os_uid275_natLogTabGen_0_q;

	--ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_inputreg(DELAY,1625)
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_inputreg : dspba_delay
    GENERIC MAP ( width => 60, depth => 1 )
    PORT MAP ( xin => os_uid275_natLogTabGen_q, xout => ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt(COUNTER,1627)
    -- every=1, low=0, high=16, step=1, init=1
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_i = 15 THEN
                      ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_eq = '1') THEN
                        ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_i <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_i - 16;
                    ELSE
                        ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_i <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_i,5));


	--ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdreg(REG,1628)
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdreg_q <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdmux(MUX,1629)
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdmux_s <= en;
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdmux: PROCESS (ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdmux_s, ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdreg_q, ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_q)
    BEGIN
            CASE ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdmux_s IS
                  WHEN "0" => ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdmux_q <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdreg_q;
                  WHEN "1" => ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdmux_q <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem(DUALMEM,1626)
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_ia <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_inputreg_q;
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_aa <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdreg_q;
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_ab <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_rdmux_q;
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 60,
        widthad_a => 5,
        numwords_a => 17,
        width_b => 60,
        widthad_b => 5,
        numwords_b => 17,
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
        clocken1 => ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_iq,
        address_a => ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_aa,
        data_a => ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_ia
    );
    ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_reset0 <= areset;
        ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_q <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_iq(59 downto 0);

	--rndBit_uid314_natLogPolyEval(CONSTANT,313)
    rndBit_uid314_natLogPolyEval_q <= "001";

	--cIncludingRoundingBit_uid315_natLogPolyEval(BITJOIN,314)@34
    cIncludingRoundingBit_uid315_natLogPolyEval_q <= ld_os_uid275_natLogTabGen_q_to_cIncludingRoundingBit_uid315_natLogPolyEval_b_replace_mem_q & rndBit_uid314_natLogPolyEval_q;

	--reg_cIncludingRoundingBit_uid315_natLogPolyEval_0_to_ts4_uid316_natLogPolyEval_0(REG,594)@34
    reg_cIncludingRoundingBit_uid315_natLogPolyEval_0_to_ts4_uid316_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid315_natLogPolyEval_0_to_ts4_uid316_natLogPolyEval_0_q <= "000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cIncludingRoundingBit_uid315_natLogPolyEval_0_to_ts4_uid316_natLogPolyEval_0_q <= cIncludingRoundingBit_uid315_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ts4_uid316_natLogPolyEval(ADD,315)@35
    ts4_uid316_natLogPolyEval_a <= STD_LOGIC_VECTOR((63 downto 63 => reg_cIncludingRoundingBit_uid315_natLogPolyEval_0_to_ts4_uid316_natLogPolyEval_0_q(62)) & reg_cIncludingRoundingBit_uid315_natLogPolyEval_0_to_ts4_uid316_natLogPolyEval_0_q);
    ts4_uid316_natLogPolyEval_b <= STD_LOGIC_VECTOR((63 downto 52 => reg_R_uid449_pT4_uid313_natLogPolyEval_0_to_ts4_uid316_natLogPolyEval_1_q(51)) & reg_R_uid449_pT4_uid313_natLogPolyEval_0_to_ts4_uid316_natLogPolyEval_1_q);
            ts4_uid316_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts4_uid316_natLogPolyEval_a) + SIGNED(ts4_uid316_natLogPolyEval_b));
    ts4_uid316_natLogPolyEval_q <= ts4_uid316_natLogPolyEval_o(63 downto 0);


	--s4_uid317_natLogPolyEval(BITSELECT,316)@35
    s4_uid317_natLogPolyEval_in <= ts4_uid316_natLogPolyEval_q;
    s4_uid317_natLogPolyEval_b <= s4_uid317_natLogPolyEval_in(63 downto 1);

	--peOR_uid93_fpLogE1pxTest(BITSELECT,92)@35
    peOR_uid93_fpLogE1pxTest_in <= s4_uid317_natLogPolyEval_b(61 downto 0);
    peOR_uid93_fpLogE1pxTest_b <= peOR_uid93_fpLogE1pxTest_in(61 downto 6);

	--postPEMul_uid103_fpLogE1pxTest_b_2(BITSELECT,453)@35
    postPEMul_uid103_fpLogE1pxTest_b_2_in <= STD_LOGIC_VECTOR((80 downto 56 => peOR_uid93_fpLogE1pxTest_b(55)) & peOR_uid93_fpLogE1pxTest_b);
    postPEMul_uid103_fpLogE1pxTest_b_2_b <= postPEMul_uid103_fpLogE1pxTest_b_2_in(80 downto 54);

	--reg_postPEMul_uid103_fpLogE1pxTest_b_2_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b2_1(REG,606)@35
    reg_postPEMul_uid103_fpLogE1pxTest_b_2_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b2_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_postPEMul_uid103_fpLogE1pxTest_b_2_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b2_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_postPEMul_uid103_fpLogE1pxTest_b_2_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b2_1_q <= postPEMul_uid103_fpLogE1pxTest_b_2_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor(LOGICAL,1470)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_b <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_q <= not (ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_a or ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_b);

	--ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_mem_top(CONSTANT,1442)
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_mem_top_q <= "011111";

	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp(LOGICAL,1467)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_a <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_mem_top_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdcnt_q);
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_q <= "1" when ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_a = ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_b else "0";

	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmpReg(REG,1468)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmpReg_q <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena(REG,1471)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_q = "1") THEN
                ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena_q <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd(LOGICAL,1472)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_a <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_b <= en;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_q <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_a and ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_b;

	--ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdreg(REG,1439)
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdreg_q <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdcnt(COUNTER,1438)
    -- every=1, low=0, high=31, step=1, init=1
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdcnt_i <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdcnt_i,5));


	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem(DUALMEM,1463)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_ia <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_inputreg_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_aa <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdreg_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_ab <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdcnt_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 5,
        numwords_a => 32,
        width_b => 52,
        widthad_b => 5,
        numwords_b => 32,
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
        clocken1 => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_q(0),
        clocken0 => en(0),
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_iq,
        address_a => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_aa,
        data_a => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_ia
    );
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_reset0 <= areset;
        ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_q <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_iq(51 downto 0);

	--sEz_uid98_fpLogE1pxTest(BITJOIN,97)@35
    sEz_uid98_fpLogE1pxTest_q <= o2_uid97_fpLogE1pxTest_q & ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_q;

	--ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_nor(LOGICAL,1483)
    ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_nor_b <= ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_sticky_ena_q;
    ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_nor_q <= not (ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_nor_a or ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_nor_b);

	--ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_mem_top(CONSTANT,1455)
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_mem_top_q <= "010101";

	--ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmp(LOGICAL,1456)
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmp_a <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_mem_top_q;
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdmux_q);
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmp_q <= "1" when ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmp_a = ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmp_b else "0";

	--ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmpReg(REG,1457)
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmpReg_q <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_sticky_ena(REG,1484)
    ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_nor_q = "1") THEN
                ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_sticky_ena_q <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_enaAnd(LOGICAL,1485)
    ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_enaAnd_a <= ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_sticky_ena_q;
    ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_enaAnd_b <= en;
    ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_enaAnd_q <= ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_enaAnd_a and ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_enaAnd_b;

	--fracBRed_uid99_fpLogE1pxTest(BITSELECT,98)@11
    fracBRed_uid99_fpLogE1pxTest_in <= fracB_uid83_fpLogE1pxTest_q;
    fracBRed_uid99_fpLogE1pxTest_b <= fracBRed_uid99_fpLogE1pxTest_in(52 downto 1);

	--ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_inputreg(DELAY,1473)
    ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1 )
    PORT MAP ( xin => fracBRed_uid99_fpLogE1pxTest_b, xout => ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt(COUNTER,1451)
    -- every=1, low=0, high=21, step=1, init=1
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_i = 20 THEN
                      ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_eq = '1') THEN
                        ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_i <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_i - 21;
                    ELSE
                        ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_i <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_i,5));


	--ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdreg(REG,1452)
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdreg_q <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdmux(MUX,1453)
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdmux_s <= en;
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdmux: PROCESS (ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdmux_s, ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdreg_q, ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdmux_q <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdreg_q;
                  WHEN "1" => ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdmux_q <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem(DUALMEM,1474)
    ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_ia <= ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_inputreg_q;
    ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_aa <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdreg_q;
    ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_ab <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdmux_q;
    ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 52,
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
        clocken1 => ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_iq,
        address_a => ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_aa,
        data_a => ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_ia
    );
    ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_reset0 <= areset;
        ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_q <= ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_iq(51 downto 0);

	--sEz_uid101_fpLogE1pxTest(BITJOIN,100)@35
    sEz_uid101_fpLogE1pxTest_q <= z2_uid100_fpLogE1pxTest_q & ld_fracBRed_uid99_fpLogE1pxTest_b_to_sEz_uid101_fpLogE1pxTest_a_replace_mem_q;

	--ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_nor(LOGICAL,1459)
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_nor_b <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_sticky_ena_q;
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_nor_q <= not (ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_nor_a or ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_nor_b);

	--ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_sticky_ena(REG,1460)
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_nor_q = "1") THEN
                ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_sticky_ena_q <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_enaAnd(LOGICAL,1461)
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_enaAnd_a <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_sticky_ena_q;
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_enaAnd_b <= en;
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_enaAnd_q <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_enaAnd_a and ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_enaAnd_b;

	--ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_inputreg(DELAY,1449)
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => c_uid87_fpLogE1pxTest_q, xout => ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem(DUALMEM,1450)
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_ia <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_inputreg_q;
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_aa <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdreg_q;
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_ab <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_rdmux_q;
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_iq,
        address_a => ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_aa,
        data_a => ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_ia
    );
    ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_reset0 <= areset;
        ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_q <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_iq(0 downto 0);

	--ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_nor(LOGICAL,1446)
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_nor_b <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_sticky_ena_q;
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_nor_q <= not (ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_nor_a or ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_nor_b);

	--ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmp(LOGICAL,1443)
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmp_a <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_mem_top_q;
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdmux_q);
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmp_q <= "1" when ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmp_a = ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmp_b else "0";

	--ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmpReg(REG,1444)
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmpReg_q <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_sticky_ena(REG,1447)
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_nor_q = "1") THEN
                ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_sticky_ena_q <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_enaAnd(LOGICAL,1448)
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_enaAnd_a <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_sticky_ena_q;
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_enaAnd_b <= en;
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_enaAnd_q <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_enaAnd_a and ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_enaAnd_b;

	--ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_inputreg(DELAY,1436)
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => branch3_uid73_fpLogE1pxTest_q, xout => ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdmux(MUX,1440)
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdmux_s <= en;
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdmux: PROCESS (ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdmux_s, ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdreg_q, ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdmux_q <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdreg_q;
                  WHEN "1" => ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdmux_q <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem(DUALMEM,1437)
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_ia <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_inputreg_q;
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_aa <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdreg_q;
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_ab <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_rdmux_q;
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 32,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 32,
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
        clocken1 => ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_iq,
        address_a => ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_aa,
        data_a => ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_ia
    );
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_reset0 <= areset;
        ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_q <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_iq(0 downto 0);

	--branch3OrC_uid94_fpLogE1pxTest(LOGICAL,93)@34
    branch3OrC_uid94_fpLogE1pxTest_a <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_replace_mem_q;
    branch3OrC_uid94_fpLogE1pxTest_b <= ld_c_uid87_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_b_replace_mem_q;
    branch3OrC_uid94_fpLogE1pxTest_q_i <= branch3OrC_uid94_fpLogE1pxTest_a or branch3OrC_uid94_fpLogE1pxTest_b;
    branch3OrC_uid94_fpLogE1pxTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => branch3OrC_uid94_fpLogE1pxTest_q, xin => branch3OrC_uid94_fpLogE1pxTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--sEz_uid102_fpLogE1pxTest(MUX,101)@35
    sEz_uid102_fpLogE1pxTest_s <= branch3OrC_uid94_fpLogE1pxTest_q;
    sEz_uid102_fpLogE1pxTest: PROCESS (sEz_uid102_fpLogE1pxTest_s, en, sEz_uid101_fpLogE1pxTest_q, sEz_uid98_fpLogE1pxTest_q)
    BEGIN
            CASE sEz_uid102_fpLogE1pxTest_s IS
                  WHEN "0" => sEz_uid102_fpLogE1pxTest_q <= sEz_uid101_fpLogE1pxTest_q;
                  WHEN "1" => sEz_uid102_fpLogE1pxTest_q <= sEz_uid98_fpLogE1pxTest_q;
                  WHEN OTHERS => sEz_uid102_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--postPEMul_uid103_fpLogE1pxTest_a_1(BITSELECT,450)@35
    postPEMul_uid103_fpLogE1pxTest_a_1_in <= sEz_uid102_fpLogE1pxTest_q;
    postPEMul_uid103_fpLogE1pxTest_a_1_b <= postPEMul_uid103_fpLogE1pxTest_a_1_in(53 downto 27);

	--reg_postPEMul_uid103_fpLogE1pxTest_a_1_0_to_postPEMul_uid103_fpLogE1pxTest_a1_b0_0(REG,598)@35
    reg_postPEMul_uid103_fpLogE1pxTest_a_1_0_to_postPEMul_uid103_fpLogE1pxTest_a1_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_postPEMul_uid103_fpLogE1pxTest_a_1_0_to_postPEMul_uid103_fpLogE1pxTest_a1_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_postPEMul_uid103_fpLogE1pxTest_a_1_0_to_postPEMul_uid103_fpLogE1pxTest_a1_b0_0_q <= postPEMul_uid103_fpLogE1pxTest_a_1_b;
            END IF;
        END IF;
    END PROCESS;


	--postPEMul_uid103_fpLogE1pxTest_a1_b2(MULT,459)@36
    postPEMul_uid103_fpLogE1pxTest_a1_b2_pr <= SIGNED(postPEMul_uid103_fpLogE1pxTest_a1_b2_a) * SIGNED(postPEMul_uid103_fpLogE1pxTest_a1_b2_b);
    postPEMul_uid103_fpLogE1pxTest_a1_b2_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_a1_b2_a <= (others => '0');
            postPEMul_uid103_fpLogE1pxTest_a1_b2_b <= (others => '0');
            postPEMul_uid103_fpLogE1pxTest_a1_b2_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid103_fpLogE1pxTest_a1_b2_a <= reg_postPEMul_uid103_fpLogE1pxTest_a_1_0_to_postPEMul_uid103_fpLogE1pxTest_a1_b0_0_q;
                postPEMul_uid103_fpLogE1pxTest_a1_b2_b <= reg_postPEMul_uid103_fpLogE1pxTest_b_2_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b2_1_q;
                postPEMul_uid103_fpLogE1pxTest_a1_b2_s1 <= STD_LOGIC_VECTOR(postPEMul_uid103_fpLogE1pxTest_a1_b2_pr);
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid103_fpLogE1pxTest_a1_b2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_a1_b2_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid103_fpLogE1pxTest_a1_b2_q <= postPEMul_uid103_fpLogE1pxTest_a1_b2_s1;
            END IF;
        END IF;
    END PROCESS;

	--ld_postPEMul_uid103_fpLogE1pxTest_a1_b2_q_to_postPEMul_uid103_fpLogE1pxTest_align_3_a(DELAY,1139)@39
    ld_postPEMul_uid103_fpLogE1pxTest_a1_b2_q_to_postPEMul_uid103_fpLogE1pxTest_align_3_a : dspba_delay
    GENERIC MAP ( width => 54, depth => 2 )
    PORT MAP ( xin => postPEMul_uid103_fpLogE1pxTest_a1_b2_q, xout => ld_postPEMul_uid103_fpLogE1pxTest_a1_b2_q_to_postPEMul_uid103_fpLogE1pxTest_align_3_a_q, ena => en(0), clk => clk, aclr => areset );

	--postPEMul_uid103_fpLogE1pxTest_align_3(BITSHIFT,465)@41
    postPEMul_uid103_fpLogE1pxTest_align_3_q_int <= ld_postPEMul_uid103_fpLogE1pxTest_a1_b2_q_to_postPEMul_uid103_fpLogE1pxTest_align_3_a_q & "000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    postPEMul_uid103_fpLogE1pxTest_align_3_q <= postPEMul_uid103_fpLogE1pxTest_align_3_q_int(134 downto 0);

	--postPEMul_uid103_fpLogE1pxTest_a_0(BITSELECT,449)@35
    postPEMul_uid103_fpLogE1pxTest_a_0_in <= sEz_uid102_fpLogE1pxTest_q(26 downto 0);
    postPEMul_uid103_fpLogE1pxTest_a_0_b <= postPEMul_uid103_fpLogE1pxTest_a_0_in(26 downto 0);

	--reg_postPEMul_uid103_fpLogE1pxTest_a_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_0(REG,596)@35
    reg_postPEMul_uid103_fpLogE1pxTest_a_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_postPEMul_uid103_fpLogE1pxTest_a_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_postPEMul_uid103_fpLogE1pxTest_a_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_0_q <= postPEMul_uid103_fpLogE1pxTest_a_0_b;
            END IF;
        END IF;
    END PROCESS;


	--postPEMul_uid103_fpLogE1pxTest_a0_b2(MULT,458)@36
    postPEMul_uid103_fpLogE1pxTest_a0_b2_pr <= signed(resize(UNSIGNED(postPEMul_uid103_fpLogE1pxTest_a0_b2_a),28)) * SIGNED(postPEMul_uid103_fpLogE1pxTest_a0_b2_b);
    postPEMul_uid103_fpLogE1pxTest_a0_b2_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_a0_b2_a <= (others => '0');
            postPEMul_uid103_fpLogE1pxTest_a0_b2_b <= (others => '0');
            postPEMul_uid103_fpLogE1pxTest_a0_b2_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid103_fpLogE1pxTest_a0_b2_a <= reg_postPEMul_uid103_fpLogE1pxTest_a_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_0_q;
                postPEMul_uid103_fpLogE1pxTest_a0_b2_b <= reg_postPEMul_uid103_fpLogE1pxTest_b_2_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b2_1_q;
                postPEMul_uid103_fpLogE1pxTest_a0_b2_s1 <= STD_LOGIC_VECTOR(resize(postPEMul_uid103_fpLogE1pxTest_a0_b2_pr,54));
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid103_fpLogE1pxTest_a0_b2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_a0_b2_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid103_fpLogE1pxTest_a0_b2_q <= postPEMul_uid103_fpLogE1pxTest_a0_b2_s1;
            END IF;
        END IF;
    END PROCESS;

	--postPEMul_uid103_fpLogE1pxTest_b_1(BITSELECT,452)@35
    postPEMul_uid103_fpLogE1pxTest_b_1_in <= peOR_uid93_fpLogE1pxTest_b(53 downto 0);
    postPEMul_uid103_fpLogE1pxTest_b_1_b <= postPEMul_uid103_fpLogE1pxTest_b_1_in(53 downto 27);

	--reg_postPEMul_uid103_fpLogE1pxTest_b_1_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b1_1(REG,601)@35
    reg_postPEMul_uid103_fpLogE1pxTest_b_1_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_postPEMul_uid103_fpLogE1pxTest_b_1_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b1_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_postPEMul_uid103_fpLogE1pxTest_b_1_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b1_1_q <= postPEMul_uid103_fpLogE1pxTest_b_1_b;
            END IF;
        END IF;
    END PROCESS;


	--postPEMul_uid103_fpLogE1pxTest_a1_b1(MULT,457)@36
    postPEMul_uid103_fpLogE1pxTest_a1_b1_pr <= SIGNED(postPEMul_uid103_fpLogE1pxTest_a1_b1_a) * signed(resize(UNSIGNED(postPEMul_uid103_fpLogE1pxTest_a1_b1_b),28));
    postPEMul_uid103_fpLogE1pxTest_a1_b1_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_a1_b1_a <= (others => '0');
            postPEMul_uid103_fpLogE1pxTest_a1_b1_b <= (others => '0');
            postPEMul_uid103_fpLogE1pxTest_a1_b1_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid103_fpLogE1pxTest_a1_b1_a <= reg_postPEMul_uid103_fpLogE1pxTest_a_1_0_to_postPEMul_uid103_fpLogE1pxTest_a1_b0_0_q;
                postPEMul_uid103_fpLogE1pxTest_a1_b1_b <= reg_postPEMul_uid103_fpLogE1pxTest_b_1_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b1_1_q;
                postPEMul_uid103_fpLogE1pxTest_a1_b1_s1 <= STD_LOGIC_VECTOR(resize(postPEMul_uid103_fpLogE1pxTest_a1_b1_pr,54));
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid103_fpLogE1pxTest_a1_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_a1_b1_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid103_fpLogE1pxTest_a1_b1_q <= postPEMul_uid103_fpLogE1pxTest_a1_b1_s1;
            END IF;
        END IF;
    END PROCESS;

	--postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0(ADD,461)@39
    postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_a <= STD_LOGIC_VECTOR((54 downto 54 => postPEMul_uid103_fpLogE1pxTest_a1_b1_q(53)) & postPEMul_uid103_fpLogE1pxTest_a1_b1_q);
    postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_b <= STD_LOGIC_VECTOR((54 downto 54 => postPEMul_uid103_fpLogE1pxTest_a0_b2_q(53)) & postPEMul_uid103_fpLogE1pxTest_a0_b2_q);
            postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_a) + SIGNED(postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_b));
    postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_q <= postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_o(54 downto 0);


	--ld_postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_q_to_postPEMul_uid103_fpLogE1pxTest_align_2_a(DELAY,1138)@39
    ld_postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_q_to_postPEMul_uid103_fpLogE1pxTest_align_2_a : dspba_delay
    GENERIC MAP ( width => 55, depth => 1 )
    PORT MAP ( xin => postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_q, xout => ld_postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_q_to_postPEMul_uid103_fpLogE1pxTest_align_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--postPEMul_uid103_fpLogE1pxTest_align_2(BITSHIFT,464)@40
    postPEMul_uid103_fpLogE1pxTest_align_2_q_int <= ld_postPEMul_uid103_fpLogE1pxTest_addcol_2_add_0_0_q_to_postPEMul_uid103_fpLogE1pxTest_align_2_a_q & "000000000000000000000000000000000000000000000000000000";
    postPEMul_uid103_fpLogE1pxTest_align_2_q <= postPEMul_uid103_fpLogE1pxTest_align_2_q_int(108 downto 0);

	--reg_postPEMul_uid103_fpLogE1pxTest_align_2_0_to_postPEMul_uid103_fpLogE1pxTest_result_add_0_1_0(REG,609)@40
    reg_postPEMul_uid103_fpLogE1pxTest_align_2_0_to_postPEMul_uid103_fpLogE1pxTest_result_add_0_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_postPEMul_uid103_fpLogE1pxTest_align_2_0_to_postPEMul_uid103_fpLogE1pxTest_result_add_0_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_postPEMul_uid103_fpLogE1pxTest_align_2_0_to_postPEMul_uid103_fpLogE1pxTest_result_add_0_1_0_q <= postPEMul_uid103_fpLogE1pxTest_align_2_q;
            END IF;
        END IF;
    END PROCESS;


	--postPEMul_uid103_fpLogE1pxTest_result_add_0_1(ADD,467)@41
    postPEMul_uid103_fpLogE1pxTest_result_add_0_1_a <= STD_LOGIC_VECTOR((135 downto 109 => reg_postPEMul_uid103_fpLogE1pxTest_align_2_0_to_postPEMul_uid103_fpLogE1pxTest_result_add_0_1_0_q(108)) & reg_postPEMul_uid103_fpLogE1pxTest_align_2_0_to_postPEMul_uid103_fpLogE1pxTest_result_add_0_1_0_q);
    postPEMul_uid103_fpLogE1pxTest_result_add_0_1_b <= STD_LOGIC_VECTOR((135 downto 135 => postPEMul_uid103_fpLogE1pxTest_align_3_q(134)) & postPEMul_uid103_fpLogE1pxTest_align_3_q);
            postPEMul_uid103_fpLogE1pxTest_result_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(postPEMul_uid103_fpLogE1pxTest_result_add_0_1_a) + SIGNED(postPEMul_uid103_fpLogE1pxTest_result_add_0_1_b));
    postPEMul_uid103_fpLogE1pxTest_result_add_0_1_q <= postPEMul_uid103_fpLogE1pxTest_result_add_0_1_o(135 downto 0);


	--postPEMul_uid103_fpLogE1pxTest_a0_b1(MULT,456)@36
    postPEMul_uid103_fpLogE1pxTest_a0_b1_pr <= UNSIGNED(postPEMul_uid103_fpLogE1pxTest_a0_b1_a) * UNSIGNED(postPEMul_uid103_fpLogE1pxTest_a0_b1_b);
    postPEMul_uid103_fpLogE1pxTest_a0_b1_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_a0_b1_a <= (others => '0');
            postPEMul_uid103_fpLogE1pxTest_a0_b1_b <= (others => '0');
            postPEMul_uid103_fpLogE1pxTest_a0_b1_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid103_fpLogE1pxTest_a0_b1_a <= reg_postPEMul_uid103_fpLogE1pxTest_a_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_0_q;
                postPEMul_uid103_fpLogE1pxTest_a0_b1_b <= reg_postPEMul_uid103_fpLogE1pxTest_b_1_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b1_1_q;
                postPEMul_uid103_fpLogE1pxTest_a0_b1_s1 <= STD_LOGIC_VECTOR(postPEMul_uid103_fpLogE1pxTest_a0_b1_pr);
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid103_fpLogE1pxTest_a0_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_a0_b1_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid103_fpLogE1pxTest_a0_b1_q <= postPEMul_uid103_fpLogE1pxTest_a0_b1_s1;
            END IF;
        END IF;
    END PROCESS;

	--postPEMul_uid103_fpLogE1pxTest_b_0(BITSELECT,451)@35
    postPEMul_uid103_fpLogE1pxTest_b_0_in <= peOR_uid93_fpLogE1pxTest_b(26 downto 0);
    postPEMul_uid103_fpLogE1pxTest_b_0_b <= postPEMul_uid103_fpLogE1pxTest_b_0_in(26 downto 0);

	--reg_postPEMul_uid103_fpLogE1pxTest_b_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_1(REG,597)@35
    reg_postPEMul_uid103_fpLogE1pxTest_b_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_postPEMul_uid103_fpLogE1pxTest_b_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_postPEMul_uid103_fpLogE1pxTest_b_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_1_q <= postPEMul_uid103_fpLogE1pxTest_b_0_b;
            END IF;
        END IF;
    END PROCESS;


	--postPEMul_uid103_fpLogE1pxTest_a1_b0(MULT,455)@36
    postPEMul_uid103_fpLogE1pxTest_a1_b0_pr <= SIGNED(postPEMul_uid103_fpLogE1pxTest_a1_b0_a) * signed(resize(UNSIGNED(postPEMul_uid103_fpLogE1pxTest_a1_b0_b),28));
    postPEMul_uid103_fpLogE1pxTest_a1_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_a1_b0_a <= (others => '0');
            postPEMul_uid103_fpLogE1pxTest_a1_b0_b <= (others => '0');
            postPEMul_uid103_fpLogE1pxTest_a1_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid103_fpLogE1pxTest_a1_b0_a <= reg_postPEMul_uid103_fpLogE1pxTest_a_1_0_to_postPEMul_uid103_fpLogE1pxTest_a1_b0_0_q;
                postPEMul_uid103_fpLogE1pxTest_a1_b0_b <= reg_postPEMul_uid103_fpLogE1pxTest_b_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_1_q;
                postPEMul_uid103_fpLogE1pxTest_a1_b0_s1 <= STD_LOGIC_VECTOR(resize(postPEMul_uid103_fpLogE1pxTest_a1_b0_pr,54));
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid103_fpLogE1pxTest_a1_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_a1_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid103_fpLogE1pxTest_a1_b0_q <= postPEMul_uid103_fpLogE1pxTest_a1_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0(ADD,460)@39
    postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_a <= STD_LOGIC_VECTOR((56 downto 54 => postPEMul_uid103_fpLogE1pxTest_a1_b0_q(53)) & postPEMul_uid103_fpLogE1pxTest_a1_b0_q);
    postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_b <= STD_LOGIC_VECTOR('0' & "00" & postPEMul_uid103_fpLogE1pxTest_a0_b1_q);
            postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_a) + SIGNED(postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_b));
    postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_q <= postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_o(55 downto 0);


	--ld_postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_q_to_postPEMul_uid103_fpLogE1pxTest_align_1_a(DELAY,1137)@39
    ld_postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_q_to_postPEMul_uid103_fpLogE1pxTest_align_1_a : dspba_delay
    GENERIC MAP ( width => 56, depth => 1 )
    PORT MAP ( xin => postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_q, xout => ld_postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_q_to_postPEMul_uid103_fpLogE1pxTest_align_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--postPEMul_uid103_fpLogE1pxTest_align_1(BITSHIFT,463)@40
    postPEMul_uid103_fpLogE1pxTest_align_1_q_int <= ld_postPEMul_uid103_fpLogE1pxTest_addcol_1_add_0_0_q_to_postPEMul_uid103_fpLogE1pxTest_align_1_a_q & "000000000000000000000000000";
    postPEMul_uid103_fpLogE1pxTest_align_1_q <= postPEMul_uid103_fpLogE1pxTest_align_1_q_int(82 downto 0);

	--postPEMul_uid103_fpLogE1pxTest_a0_b0(MULT,454)@36
    postPEMul_uid103_fpLogE1pxTest_a0_b0_pr <= UNSIGNED(postPEMul_uid103_fpLogE1pxTest_a0_b0_a) * UNSIGNED(postPEMul_uid103_fpLogE1pxTest_a0_b0_b);
    postPEMul_uid103_fpLogE1pxTest_a0_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_a0_b0_a <= (others => '0');
            postPEMul_uid103_fpLogE1pxTest_a0_b0_b <= (others => '0');
            postPEMul_uid103_fpLogE1pxTest_a0_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid103_fpLogE1pxTest_a0_b0_a <= reg_postPEMul_uid103_fpLogE1pxTest_a_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_0_q;
                postPEMul_uid103_fpLogE1pxTest_a0_b0_b <= reg_postPEMul_uid103_fpLogE1pxTest_b_0_0_to_postPEMul_uid103_fpLogE1pxTest_a0_b0_1_q;
                postPEMul_uid103_fpLogE1pxTest_a0_b0_s1 <= STD_LOGIC_VECTOR(postPEMul_uid103_fpLogE1pxTest_a0_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid103_fpLogE1pxTest_a0_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_a0_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid103_fpLogE1pxTest_a0_b0_q <= postPEMul_uid103_fpLogE1pxTest_a0_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--postPEMul_uid103_fpLogE1pxTest_align_0(BITSHIFT,462)@39
    postPEMul_uid103_fpLogE1pxTest_align_0_q_int <= postPEMul_uid103_fpLogE1pxTest_a0_b0_q;
    postPEMul_uid103_fpLogE1pxTest_align_0_q <= postPEMul_uid103_fpLogE1pxTest_align_0_q_int(53 downto 0);

	--reg_postPEMul_uid103_fpLogE1pxTest_align_0_0_to_postPEMul_uid103_fpLogE1pxTest_result_add_0_0_0(REG,602)@39
    reg_postPEMul_uid103_fpLogE1pxTest_align_0_0_to_postPEMul_uid103_fpLogE1pxTest_result_add_0_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_postPEMul_uid103_fpLogE1pxTest_align_0_0_to_postPEMul_uid103_fpLogE1pxTest_result_add_0_0_0_q <= "000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_postPEMul_uid103_fpLogE1pxTest_align_0_0_to_postPEMul_uid103_fpLogE1pxTest_result_add_0_0_0_q <= postPEMul_uid103_fpLogE1pxTest_align_0_q;
            END IF;
        END IF;
    END PROCESS;


	--postPEMul_uid103_fpLogE1pxTest_result_add_0_0(ADD,466)@40
    postPEMul_uid103_fpLogE1pxTest_result_add_0_0_a <= STD_LOGIC_VECTOR('0' & "000000000000000000000000000000" & reg_postPEMul_uid103_fpLogE1pxTest_align_0_0_to_postPEMul_uid103_fpLogE1pxTest_result_add_0_0_0_q);
    postPEMul_uid103_fpLogE1pxTest_result_add_0_0_b <= STD_LOGIC_VECTOR((84 downto 83 => postPEMul_uid103_fpLogE1pxTest_align_1_q(82)) & postPEMul_uid103_fpLogE1pxTest_align_1_q);
    postPEMul_uid103_fpLogE1pxTest_result_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_result_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(postPEMul_uid103_fpLogE1pxTest_result_add_0_0_a) + SIGNED(postPEMul_uid103_fpLogE1pxTest_result_add_0_0_b));
        END IF;
    END PROCESS;
    postPEMul_uid103_fpLogE1pxTest_result_add_0_0_q <= postPEMul_uid103_fpLogE1pxTest_result_add_0_0_o(83 downto 0);


	--postPEMul_uid103_fpLogE1pxTest_result_add_1_0(ADD,468)@41
    postPEMul_uid103_fpLogE1pxTest_result_add_1_0_a <= STD_LOGIC_VECTOR((136 downto 84 => postPEMul_uid103_fpLogE1pxTest_result_add_0_0_q(83)) & postPEMul_uid103_fpLogE1pxTest_result_add_0_0_q);
    postPEMul_uid103_fpLogE1pxTest_result_add_1_0_b <= STD_LOGIC_VECTOR((136 downto 136 => postPEMul_uid103_fpLogE1pxTest_result_add_0_1_q(135)) & postPEMul_uid103_fpLogE1pxTest_result_add_0_1_q);
            postPEMul_uid103_fpLogE1pxTest_result_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(postPEMul_uid103_fpLogE1pxTest_result_add_1_0_a) + SIGNED(postPEMul_uid103_fpLogE1pxTest_result_add_1_0_b));
    postPEMul_uid103_fpLogE1pxTest_result_add_1_0_q <= postPEMul_uid103_fpLogE1pxTest_result_add_1_0_o(136 downto 0);


	--highBBits_uid107_fpLogE1pxTest(BITSELECT,106)@41
    highBBits_uid107_fpLogE1pxTest_in <= postPEMul_uid103_fpLogE1pxTest_result_add_1_0_q(109 downto 0);
    highBBits_uid107_fpLogE1pxTest_b <= highBBits_uid107_fpLogE1pxTest_in(109 downto 51);

	--reg_highBBits_uid107_fpLogE1pxTest_0_to_sumAHighB_uid108_fpLogE1pxTest_1(REG,617)@41
    reg_highBBits_uid107_fpLogE1pxTest_0_to_sumAHighB_uid108_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_highBBits_uid107_fpLogE1pxTest_0_to_sumAHighB_uid108_fpLogE1pxTest_1_q <= "00000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_highBBits_uid107_fpLogE1pxTest_0_to_sumAHighB_uid108_fpLogE1pxTest_1_q <= highBBits_uid107_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--wideZero_uid104_fpLogE1pxTest(CONSTANT,103)
    wideZero_uid104_fpLogE1pxTest_q <= "0000000000000000000000000000000000000000000000000000000000000000000";

	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor(LOGICAL,1422)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_b <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena_q;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_q <= not (ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_a or ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_b);

	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_mem_top(CONSTANT,1418)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_mem_top_q <= "011001";

	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp(LOGICAL,1419)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_a <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_mem_top_q;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_q);
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_q <= "1" when ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_a = ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_b else "0";

	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmpReg(REG,1420)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmpReg_q <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena(REG,1423)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_q = "1") THEN
                ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena_q <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd(LOGICAL,1424)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_a <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena_q;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_b <= en;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_q <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_a and ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_b;

	--expBran3PreExt_uid45_fpLogE1pxTest(SUB,44)@8
    expBran3PreExt_uid45_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & cstBiasMO_uid10_fpLogE1pxTest_q);
    expBran3PreExt_uid45_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("000000" & r_uid225_leadingZeros_uid44_fpLogE1pxTest_q);
            expBran3PreExt_uid45_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expBran3PreExt_uid45_fpLogE1pxTest_a) - UNSIGNED(expBran3PreExt_uid45_fpLogE1pxTest_b));
    expBran3PreExt_uid45_fpLogE1pxTest_q <= expBran3PreExt_uid45_fpLogE1pxTest_o(11 downto 0);


	--expBran3Pre_uid46_fpLogE1pxTest(BITSELECT,45)@8
    expBran3Pre_uid46_fpLogE1pxTest_in <= expBran3PreExt_uid45_fpLogE1pxTest_q(10 downto 0);
    expBran3Pre_uid46_fpLogE1pxTest_b <= expBran3Pre_uid46_fpLogE1pxTest_in(10 downto 0);

	--reg_expBran3Pre_uid46_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_5(REG,613)@8
    reg_expBran3Pre_uid46_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expBran3Pre_uid46_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_5_q <= "00000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expBran3Pre_uid46_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_5_q <= expBran3Pre_uid46_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_nor(LOGICAL,1370)
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_nor_b <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_sticky_ena_q;
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_nor_q <= not (ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_nor_a or ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_nor_b);

	--ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_mem_top(CONSTANT,1366)
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_mem_top_q <= "010";

	--ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmp(LOGICAL,1367)
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmp_a <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_mem_top_q;
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdmux_q);
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmp_q <= "1" when ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmp_a = ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmp_b else "0";

	--ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmpReg(REG,1368)
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmpReg_q <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_sticky_ena(REG,1371)
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_nor_q = "1") THEN
                ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_sticky_ena_q <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_enaAnd(LOGICAL,1372)
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_enaAnd_a <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_sticky_ena_q;
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_enaAnd_b <= en;
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_enaAnd_q <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_enaAnd_a and ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_enaAnd_b;

	--ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_a(DELAY,1293)@0
    ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_a : dspba_delay
    GENERIC MAP ( width => 11, depth => 2 )
    PORT MAP ( xin => expX_uid6_fpLogE1pxTest_b, xout => ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0(REG,610)@2
    reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_q <= "00000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_q <= ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--eUpdateOPOFracX_uid55_fpLogE1pxTest(ADD,54)@3
    eUpdateOPOFracX_uid55_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_q);
    eUpdateOPOFracX_uid55_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00000000000" & reg_msbUoPlusOFracX_uid54_fpLogE1pxTest_0_to_oPlusOFracXNorm_uid61_fpLogE1pxTest_1_q);
    eUpdateOPOFracX_uid55_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            eUpdateOPOFracX_uid55_fpLogE1pxTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                eUpdateOPOFracX_uid55_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(eUpdateOPOFracX_uid55_fpLogE1pxTest_a) + UNSIGNED(eUpdateOPOFracX_uid55_fpLogE1pxTest_b));
            END IF;
        END IF;
    END PROCESS;
    eUpdateOPOFracX_uid55_fpLogE1pxTest_q <= eUpdateOPOFracX_uid55_fpLogE1pxTest_o(11 downto 0);


	--ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_inputreg(DELAY,1360)
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 12, depth => 1 )
    PORT MAP ( xin => eUpdateOPOFracX_uid55_fpLogE1pxTest_q, xout => ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt(COUNTER,1362)
    -- every=1, low=0, high=2, step=1, init=1
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_i = 1 THEN
                      ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_eq = '1') THEN
                        ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_i <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_i - 2;
                    ELSE
                        ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_i <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_i,2));


	--ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdreg(REG,1363)
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdreg_q <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdmux(MUX,1364)
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdmux_s <= en;
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdmux: PROCESS (ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdmux_s, ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdreg_q, ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdmux_q <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdreg_q;
                  WHEN "1" => ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdmux_q <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem(DUALMEM,1361)
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_ia <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_inputreg_q;
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_aa <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdreg_q;
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_ab <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_rdmux_q;
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 12,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_iq,
        address_a => ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_aa,
        data_a => ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_ia
    );
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_reset0 <= areset;
        ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_q <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_iq(11 downto 0);

	--ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_nor(LOGICAL,1729)
    ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_nor_b <= ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_sticky_ena_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_nor_q <= not (ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_nor_a or ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_nor_b);

	--ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_sticky_ena(REG,1730)
    ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_nor_q = "1") THEN
                ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_sticky_ena_q <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_enaAnd(LOGICAL,1731)
    ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_enaAnd_a <= ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_sticky_ena_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_enaAnd_b <= en;
    ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_enaAnd_q <= ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_enaAnd_a and ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_enaAnd_b;

	--ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem(DUALMEM,1720)
    ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_ia <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_inputreg_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_aa <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdreg_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_ab <= ld_os_uid286_natLogTabGen_q_to_cIncludingRoundingBit_uid303_natLogPolyEval_b_replace_rdmux_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 11,
        widthad_b => 3,
        numwords_b => 6,
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
        clocken1 => ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_iq,
        address_a => ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_aa,
        data_a => ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_ia
    );
    ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_reset0 <= areset;
        ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_q <= ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_iq(10 downto 0);

	--reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2(REG,612)@8
    reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q <= "00000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q <= ld_expX_uid6_fpLogE1pxTest_b_to_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--expB_uid79_fpLogE1pxTest(MUX,78)@9
    expB_uid79_fpLogE1pxTest_s <= branEnc_uid77_fpLogE1pxTest_q;
    expB_uid79_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expB_uid79_fpLogE1pxTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expB_uid79_fpLogE1pxTest_s IS
                      WHEN "00" => expB_uid79_fpLogE1pxTest_q <= STD_LOGIC_VECTOR("0" & reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q);
                      WHEN "01" => expB_uid79_fpLogE1pxTest_q <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_replace_mem_q;
                      WHEN "10" => expB_uid79_fpLogE1pxTest_q <= STD_LOGIC_VECTOR("0" & cstBias_uid9_fpLogE1pxTest_q);
                      WHEN "11" => expB_uid79_fpLogE1pxTest_q <= STD_LOGIC_VECTOR("0" & reg_expBran3Pre_uid46_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_5_q);
                      WHEN OTHERS => expB_uid79_fpLogE1pxTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_inputreg(DELAY,1412)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 12, depth => 1 )
    PORT MAP ( xin => expB_uid79_fpLogE1pxTest_q, xout => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt(COUNTER,1414)
    -- every=1, low=0, high=25, step=1, init=1
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i = 24 THEN
                      ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_eq = '1') THEN
                        ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i - 25;
                    ELSE
                        ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i,5));


	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg(REG,1415)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg_q <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux(MUX,1416)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_s <= en;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux: PROCESS (ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_s, ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg_q, ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_q <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg_q;
                  WHEN "1" => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_q <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem(DUALMEM,1413)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_ia <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_inputreg_q;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_aa <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg_q;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_ab <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_q;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 5,
        numwords_a => 26,
        width_b => 12,
        widthad_b => 5,
        numwords_b => 26,
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
        clocken1 => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_iq,
        address_a => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_aa,
        data_a => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_ia
    );
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_reset0 <= areset;
        ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_q <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_iq(11 downto 0);

	--e_uid84_fpLogE1pxTest(SUB,83)@38
    e_uid84_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_q);
    e_uid84_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00" & cstBias_uid9_fpLogE1pxTest_q);
            e_uid84_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(e_uid84_fpLogE1pxTest_a) - UNSIGNED(e_uid84_fpLogE1pxTest_b));
    e_uid84_fpLogE1pxTest_q <= e_uid84_fpLogE1pxTest_o(12 downto 0);


	--xv0_uid262_constMult(BITSELECT,261)@38
    xv0_uid262_constMult_in <= e_uid84_fpLogE1pxTest_q(5 downto 0);
    xv0_uid262_constMult_b <= xv0_uid262_constMult_in(5 downto 0);

	--reg_xv0_uid262_constMult_0_to_p0_uid265_constMult_0(REG,615)@38
    reg_xv0_uid262_constMult_0_to_p0_uid265_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv0_uid262_constMult_0_to_p0_uid265_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv0_uid262_constMult_0_to_p0_uid265_constMult_0_q <= xv0_uid262_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xv0_uid262_constMult_0_to_p0_uid265_constMult_0_q_to_p0_uid265_constMult_a(DELAY,926)@39
    ld_reg_xv0_uid262_constMult_0_to_p0_uid265_constMult_0_q_to_p0_uid265_constMult_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => reg_xv0_uid262_constMult_0_to_p0_uid265_constMult_0_q, xout => ld_reg_xv0_uid262_constMult_0_to_p0_uid265_constMult_0_q_to_p0_uid265_constMult_a_q, ena => en(0), clk => clk, aclr => areset );

	--p0_uid265_constMult(LOOKUP,264)@40
    p0_uid265_constMult: PROCESS (ld_reg_xv0_uid262_constMult_0_to_p0_uid265_constMult_0_q_to_p0_uid265_constMult_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_xv0_uid262_constMult_0_to_p0_uid265_constMult_0_q_to_p0_uid265_constMult_a_q) IS
                WHEN "000000" =>  p0_uid265_constMult_q <= "000000000000000000000000000000000000000000000000000000000000000";
                WHEN "000001" =>  p0_uid265_constMult_q <= "000000101100010111001000010111111101111101000111001111011110000";
                WHEN "000010" =>  p0_uid265_constMult_q <= "000001011000101110010000101111111011111010001110011110111100000";
                WHEN "000011" =>  p0_uid265_constMult_q <= "000010000101000101011001000111111001110111010101101110011010000";
                WHEN "000100" =>  p0_uid265_constMult_q <= "000010110001011100100001011111110111110100011100111101111000000";
                WHEN "000101" =>  p0_uid265_constMult_q <= "000011011101110011101001110111110101110001100100001101010110000";
                WHEN "000110" =>  p0_uid265_constMult_q <= "000100001010001010110010001111110011101110101011011100110100000";
                WHEN "000111" =>  p0_uid265_constMult_q <= "000100110110100001111010100111110001101011110010101100010010000";
                WHEN "001000" =>  p0_uid265_constMult_q <= "000101100010111001000010111111101111101000111001111011110000000";
                WHEN "001001" =>  p0_uid265_constMult_q <= "000110001111010000001011010111101101100110000001001011001110000";
                WHEN "001010" =>  p0_uid265_constMult_q <= "000110111011100111010011101111101011100011001000011010101100000";
                WHEN "001011" =>  p0_uid265_constMult_q <= "000111100111111110011100000111101001100000001111101010001010000";
                WHEN "001100" =>  p0_uid265_constMult_q <= "001000010100010101100100011111100111011101010110111001101000000";
                WHEN "001101" =>  p0_uid265_constMult_q <= "001001000000101100101100110111100101011010011110001001000110000";
                WHEN "001110" =>  p0_uid265_constMult_q <= "001001101101000011110101001111100011010111100101011000100100000";
                WHEN "001111" =>  p0_uid265_constMult_q <= "001010011001011010111101100111100001010100101100101000000010000";
                WHEN "010000" =>  p0_uid265_constMult_q <= "001011000101110010000101111111011111010001110011110111100000000";
                WHEN "010001" =>  p0_uid265_constMult_q <= "001011110010001001001110010111011101001110111011000110111110000";
                WHEN "010010" =>  p0_uid265_constMult_q <= "001100011110100000010110101111011011001100000010010110011100000";
                WHEN "010011" =>  p0_uid265_constMult_q <= "001101001010110111011111000111011001001001001001100101111010000";
                WHEN "010100" =>  p0_uid265_constMult_q <= "001101110111001110100111011111010111000110010000110101011000000";
                WHEN "010101" =>  p0_uid265_constMult_q <= "001110100011100101101111110111010101000011011000000100110110000";
                WHEN "010110" =>  p0_uid265_constMult_q <= "001111001111111100111000001111010011000000011111010100010100000";
                WHEN "010111" =>  p0_uid265_constMult_q <= "001111111100010100000000100111010000111101100110100011110010000";
                WHEN "011000" =>  p0_uid265_constMult_q <= "010000101000101011001000111111001110111010101101110011010000000";
                WHEN "011001" =>  p0_uid265_constMult_q <= "010001010101000010010001010111001100110111110101000010101110000";
                WHEN "011010" =>  p0_uid265_constMult_q <= "010010000001011001011001101111001010110100111100010010001100000";
                WHEN "011011" =>  p0_uid265_constMult_q <= "010010101101110000100010000111001000110010000011100001101010000";
                WHEN "011100" =>  p0_uid265_constMult_q <= "010011011010000111101010011111000110101111001010110001001000000";
                WHEN "011101" =>  p0_uid265_constMult_q <= "010100000110011110110010110111000100101100010010000000100110000";
                WHEN "011110" =>  p0_uid265_constMult_q <= "010100110010110101111011001111000010101001011001010000000100000";
                WHEN "011111" =>  p0_uid265_constMult_q <= "010101011111001101000011100111000000100110100000011111100010000";
                WHEN "100000" =>  p0_uid265_constMult_q <= "010110001011100100001011111110111110100011100111101111000000000";
                WHEN "100001" =>  p0_uid265_constMult_q <= "010110110111111011010100010110111100100000101110111110011110000";
                WHEN "100010" =>  p0_uid265_constMult_q <= "010111100100010010011100101110111010011101110110001101111100000";
                WHEN "100011" =>  p0_uid265_constMult_q <= "011000010000101001100101000110111000011010111101011101011010000";
                WHEN "100100" =>  p0_uid265_constMult_q <= "011000111101000000101101011110110110011000000100101100111000000";
                WHEN "100101" =>  p0_uid265_constMult_q <= "011001101001010111110101110110110100010101001011111100010110000";
                WHEN "100110" =>  p0_uid265_constMult_q <= "011010010101101110111110001110110010010010010011001011110100000";
                WHEN "100111" =>  p0_uid265_constMult_q <= "011011000010000110000110100110110000001111011010011011010010000";
                WHEN "101000" =>  p0_uid265_constMult_q <= "011011101110011101001110111110101110001100100001101010110000000";
                WHEN "101001" =>  p0_uid265_constMult_q <= "011100011010110100010111010110101100001001101000111010001110000";
                WHEN "101010" =>  p0_uid265_constMult_q <= "011101000111001011011111101110101010000110110000001001101100000";
                WHEN "101011" =>  p0_uid265_constMult_q <= "011101110011100010101000000110101000000011110111011001001010000";
                WHEN "101100" =>  p0_uid265_constMult_q <= "011110011111111001110000011110100110000000111110101000101000000";
                WHEN "101101" =>  p0_uid265_constMult_q <= "011111001100010000111000110110100011111110000101111000000110000";
                WHEN "101110" =>  p0_uid265_constMult_q <= "011111111000101000000001001110100001111011001101000111100100000";
                WHEN "101111" =>  p0_uid265_constMult_q <= "100000100100111111001001100110011111111000010100010111000010000";
                WHEN "110000" =>  p0_uid265_constMult_q <= "100001010001010110010001111110011101110101011011100110100000000";
                WHEN "110001" =>  p0_uid265_constMult_q <= "100001111101101101011010010110011011110010100010110101111110000";
                WHEN "110010" =>  p0_uid265_constMult_q <= "100010101010000100100010101110011001101111101010000101011100000";
                WHEN "110011" =>  p0_uid265_constMult_q <= "100011010110011011101011000110010111101100110001010100111010000";
                WHEN "110100" =>  p0_uid265_constMult_q <= "100100000010110010110011011110010101101001111000100100011000000";
                WHEN "110101" =>  p0_uid265_constMult_q <= "100100101111001001111011110110010011100110111111110011110110000";
                WHEN "110110" =>  p0_uid265_constMult_q <= "100101011011100001000100001110010001100100000111000011010100000";
                WHEN "110111" =>  p0_uid265_constMult_q <= "100110000111111000001100100110001111100001001110010010110010000";
                WHEN "111000" =>  p0_uid265_constMult_q <= "100110110100001111010100111110001101011110010101100010010000000";
                WHEN "111001" =>  p0_uid265_constMult_q <= "100111100000100110011101010110001011011011011100110001101110000";
                WHEN "111010" =>  p0_uid265_constMult_q <= "101000001100111101100101101110001001011000100100000001001100000";
                WHEN "111011" =>  p0_uid265_constMult_q <= "101000111001010100101110000110000111010101101011010000101010000";
                WHEN "111100" =>  p0_uid265_constMult_q <= "101001100101101011110110011110000101010010110010100000001000000";
                WHEN "111101" =>  p0_uid265_constMult_q <= "101010010010000010111110110110000011001111111001101111100110000";
                WHEN "111110" =>  p0_uid265_constMult_q <= "101010111110011010000111001110000001001101000000111111000100000";
                WHEN "111111" =>  p0_uid265_constMult_q <= "101011101010110001001111100101111111001010001000001110100010000";
                WHEN OTHERS =>
                    p0_uid265_constMult_q <= "000000000000000000000000000000000000000000000000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv1_uid263_constMult(BITSELECT,262)@38
    xv1_uid263_constMult_in <= e_uid84_fpLogE1pxTest_q(11 downto 0);
    xv1_uid263_constMult_b <= xv1_uid263_constMult_in(11 downto 6);

	--reg_xv1_uid263_constMult_0_to_p1_uid264_constMult_0(REG,614)@38
    reg_xv1_uid263_constMult_0_to_p1_uid264_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv1_uid263_constMult_0_to_p1_uid264_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv1_uid263_constMult_0_to_p1_uid264_constMult_0_q <= xv1_uid263_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--p1_uid264_constMult(LOOKUP,263)@39
    p1_uid264_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p1_uid264_constMult_q <= "000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_xv1_uid263_constMult_0_to_p1_uid264_constMult_0_q) IS
                WHEN "000000" =>  p1_uid264_constMult_q <= "000000000000000000000000000000000000000000000000000000000000000000000";
                WHEN "000001" =>  p1_uid264_constMult_q <= "000000101100010111001000010111111101111101000111001111011110000000000";
                WHEN "000010" =>  p1_uid264_constMult_q <= "000001011000101110010000101111111011111010001110011110111100000000000";
                WHEN "000011" =>  p1_uid264_constMult_q <= "000010000101000101011001000111111001110111010101101110011010000000000";
                WHEN "000100" =>  p1_uid264_constMult_q <= "000010110001011100100001011111110111110100011100111101111000000000000";
                WHEN "000101" =>  p1_uid264_constMult_q <= "000011011101110011101001110111110101110001100100001101010110000000000";
                WHEN "000110" =>  p1_uid264_constMult_q <= "000100001010001010110010001111110011101110101011011100110100000000000";
                WHEN "000111" =>  p1_uid264_constMult_q <= "000100110110100001111010100111110001101011110010101100010010000000000";
                WHEN "001000" =>  p1_uid264_constMult_q <= "000101100010111001000010111111101111101000111001111011110000000000000";
                WHEN "001001" =>  p1_uid264_constMult_q <= "000110001111010000001011010111101101100110000001001011001110000000000";
                WHEN "001010" =>  p1_uid264_constMult_q <= "000110111011100111010011101111101011100011001000011010101100000000000";
                WHEN "001011" =>  p1_uid264_constMult_q <= "000111100111111110011100000111101001100000001111101010001010000000000";
                WHEN "001100" =>  p1_uid264_constMult_q <= "001000010100010101100100011111100111011101010110111001101000000000000";
                WHEN "001101" =>  p1_uid264_constMult_q <= "001001000000101100101100110111100101011010011110001001000110000000000";
                WHEN "001110" =>  p1_uid264_constMult_q <= "001001101101000011110101001111100011010111100101011000100100000000000";
                WHEN "001111" =>  p1_uid264_constMult_q <= "001010011001011010111101100111100001010100101100101000000010000000000";
                WHEN "010000" =>  p1_uid264_constMult_q <= "001011000101110010000101111111011111010001110011110111100000000000000";
                WHEN "010001" =>  p1_uid264_constMult_q <= "001011110010001001001110010111011101001110111011000110111110000000000";
                WHEN "010010" =>  p1_uid264_constMult_q <= "001100011110100000010110101111011011001100000010010110011100000000000";
                WHEN "010011" =>  p1_uid264_constMult_q <= "001101001010110111011111000111011001001001001001100101111010000000000";
                WHEN "010100" =>  p1_uid264_constMult_q <= "001101110111001110100111011111010111000110010000110101011000000000000";
                WHEN "010101" =>  p1_uid264_constMult_q <= "001110100011100101101111110111010101000011011000000100110110000000000";
                WHEN "010110" =>  p1_uid264_constMult_q <= "001111001111111100111000001111010011000000011111010100010100000000000";
                WHEN "010111" =>  p1_uid264_constMult_q <= "001111111100010100000000100111010000111101100110100011110010000000000";
                WHEN "011000" =>  p1_uid264_constMult_q <= "010000101000101011001000111111001110111010101101110011010000000000000";
                WHEN "011001" =>  p1_uid264_constMult_q <= "010001010101000010010001010111001100110111110101000010101110000000000";
                WHEN "011010" =>  p1_uid264_constMult_q <= "010010000001011001011001101111001010110100111100010010001100000000000";
                WHEN "011011" =>  p1_uid264_constMult_q <= "010010101101110000100010000111001000110010000011100001101010000000000";
                WHEN "011100" =>  p1_uid264_constMult_q <= "010011011010000111101010011111000110101111001010110001001000000000000";
                WHEN "011101" =>  p1_uid264_constMult_q <= "010100000110011110110010110111000100101100010010000000100110000000000";
                WHEN "011110" =>  p1_uid264_constMult_q <= "010100110010110101111011001111000010101001011001010000000100000000000";
                WHEN "011111" =>  p1_uid264_constMult_q <= "010101011111001101000011100111000000100110100000011111100010000000000";
                WHEN "100000" =>  p1_uid264_constMult_q <= "101001110100011011110100000001000001011100011000010001000000000000000";
                WHEN "100001" =>  p1_uid264_constMult_q <= "101010100000110010111100011000111111011001011111100000011110000000000";
                WHEN "100010" =>  p1_uid264_constMult_q <= "101011001101001010000100110000111101010110100110101111111100000000000";
                WHEN "100011" =>  p1_uid264_constMult_q <= "101011111001100001001101001000111011010011101101111111011010000000000";
                WHEN "100100" =>  p1_uid264_constMult_q <= "101100100101111000010101100000111001010000110101001110111000000000000";
                WHEN "100101" =>  p1_uid264_constMult_q <= "101101010010001111011101111000110111001101111100011110010110000000000";
                WHEN "100110" =>  p1_uid264_constMult_q <= "101101111110100110100110010000110101001011000011101101110100000000000";
                WHEN "100111" =>  p1_uid264_constMult_q <= "101110101010111101101110101000110011001000001010111101010010000000000";
                WHEN "101000" =>  p1_uid264_constMult_q <= "101111010111010100110111000000110001000101010010001100110000000000000";
                WHEN "101001" =>  p1_uid264_constMult_q <= "110000000011101011111111011000101111000010011001011100001110000000000";
                WHEN "101010" =>  p1_uid264_constMult_q <= "110000110000000011000111110000101100111111100000101011101100000000000";
                WHEN "101011" =>  p1_uid264_constMult_q <= "110001011100011010010000001000101010111100100111111011001010000000000";
                WHEN "101100" =>  p1_uid264_constMult_q <= "110010001000110001011000100000101000111001101111001010101000000000000";
                WHEN "101101" =>  p1_uid264_constMult_q <= "110010110101001000100000111000100110110110110110011010000110000000000";
                WHEN "101110" =>  p1_uid264_constMult_q <= "110011100001011111101001010000100100110011111101101001100100000000000";
                WHEN "101111" =>  p1_uid264_constMult_q <= "110100001101110110110001101000100010110001000100111001000010000000000";
                WHEN "110000" =>  p1_uid264_constMult_q <= "110100111010001101111010000000100000101110001100001000100000000000000";
                WHEN "110001" =>  p1_uid264_constMult_q <= "110101100110100101000010011000011110101011010011010111111110000000000";
                WHEN "110010" =>  p1_uid264_constMult_q <= "110110010010111100001010110000011100101000011010100111011100000000000";
                WHEN "110011" =>  p1_uid264_constMult_q <= "110110111111010011010011001000011010100101100001110110111010000000000";
                WHEN "110100" =>  p1_uid264_constMult_q <= "110111101011101010011011100000011000100010101001000110011000000000000";
                WHEN "110101" =>  p1_uid264_constMult_q <= "111000011000000001100011111000010110011111110000010101110110000000000";
                WHEN "110110" =>  p1_uid264_constMult_q <= "111001000100011000101100010000010100011100110111100101010100000000000";
                WHEN "110111" =>  p1_uid264_constMult_q <= "111001110000101111110100101000010010011001111110110100110010000000000";
                WHEN "111000" =>  p1_uid264_constMult_q <= "111010011101000110111101000000010000010111000110000100010000000000000";
                WHEN "111001" =>  p1_uid264_constMult_q <= "111011001001011110000101011000001110010100001101010011101110000000000";
                WHEN "111010" =>  p1_uid264_constMult_q <= "111011110101110101001101110000001100010001010100100011001100000000000";
                WHEN "111011" =>  p1_uid264_constMult_q <= "111100100010001100010110001000001010001110011011110010101010000000000";
                WHEN "111100" =>  p1_uid264_constMult_q <= "111101001110100011011110100000001000001011100011000010001000000000000";
                WHEN "111101" =>  p1_uid264_constMult_q <= "111101111010111010100110111000000110001000101010010001100110000000000";
                WHEN "111110" =>  p1_uid264_constMult_q <= "111110100111010001101111010000000100000101110001100001000100000000000";
                WHEN "111111" =>  p1_uid264_constMult_q <= "111111010011101000110111101000000010000010111000110000100010000000000";
                WHEN OTHERS =>
                    p1_uid264_constMult_q <= "000000000000000000000000000000000000000000000000000000000000000000000";
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--lev1_a0_uid266_constMult(ADD,265)@40
    lev1_a0_uid266_constMult_a <= STD_LOGIC_VECTOR((70 downto 69 => p1_uid264_constMult_q(68)) & p1_uid264_constMult_q);
    lev1_a0_uid266_constMult_b <= STD_LOGIC_VECTOR('0' & "0000000" & p0_uid265_constMult_q);
            lev1_a0_uid266_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0_uid266_constMult_a) + SIGNED(lev1_a0_uid266_constMult_b));
    lev1_a0_uid266_constMult_q <= lev1_a0_uid266_constMult_o(69 downto 0);


	--sR_uid267_constMult(BITSELECT,266)@40
    sR_uid267_constMult_in <= lev1_a0_uid266_constMult_q(68 downto 0);
    sR_uid267_constMult_b <= sR_uid267_constMult_in(68 downto 2);

	--reg_sR_uid267_constMult_0_to_addTermOne_uid105_fpLogE1pxTest_2(REG,616)@40
    reg_sR_uid267_constMult_0_to_addTermOne_uid105_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sR_uid267_constMult_0_to_addTermOne_uid105_fpLogE1pxTest_2_q <= "0000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sR_uid267_constMult_0_to_addTermOne_uid105_fpLogE1pxTest_2_q <= sR_uid267_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_branch3OrC_uid94_fpLogE1pxTest_q_to_addTermOne_uid105_fpLogE1pxTest_b(DELAY,747)@35
    ld_branch3OrC_uid94_fpLogE1pxTest_q_to_addTermOne_uid105_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => branch3OrC_uid94_fpLogE1pxTest_q, xout => ld_branch3OrC_uid94_fpLogE1pxTest_q_to_addTermOne_uid105_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--addTermOne_uid105_fpLogE1pxTest(MUX,104)@41
    addTermOne_uid105_fpLogE1pxTest_s <= ld_branch3OrC_uid94_fpLogE1pxTest_q_to_addTermOne_uid105_fpLogE1pxTest_b_q;
    addTermOne_uid105_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            addTermOne_uid105_fpLogE1pxTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE addTermOne_uid105_fpLogE1pxTest_s IS
                      WHEN "0" => addTermOne_uid105_fpLogE1pxTest_q <= reg_sR_uid267_constMult_0_to_addTermOne_uid105_fpLogE1pxTest_2_q;
                      WHEN "1" => addTermOne_uid105_fpLogE1pxTest_q <= wideZero_uid104_fpLogE1pxTest_q;
                      WHEN OTHERS => addTermOne_uid105_fpLogE1pxTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid108_fpLogE1pxTest(ADD,107)@42
    sumAHighB_uid108_fpLogE1pxTest_a <= STD_LOGIC_VECTOR((67 downto 67 => addTermOne_uid105_fpLogE1pxTest_q(66)) & addTermOne_uid105_fpLogE1pxTest_q);
    sumAHighB_uid108_fpLogE1pxTest_b <= STD_LOGIC_VECTOR((67 downto 59 => reg_highBBits_uid107_fpLogE1pxTest_0_to_sumAHighB_uid108_fpLogE1pxTest_1_q(58)) & reg_highBBits_uid107_fpLogE1pxTest_0_to_sumAHighB_uid108_fpLogE1pxTest_1_q);
            sumAHighB_uid108_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid108_fpLogE1pxTest_a) + SIGNED(sumAHighB_uid108_fpLogE1pxTest_b));
    sumAHighB_uid108_fpLogE1pxTest_q <= sumAHighB_uid108_fpLogE1pxTest_o(67 downto 0);


	--lowRangeB_uid106_fpLogE1pxTest(BITSELECT,105)@41
    lowRangeB_uid106_fpLogE1pxTest_in <= postPEMul_uid103_fpLogE1pxTest_result_add_1_0_q(50 downto 0);
    lowRangeB_uid106_fpLogE1pxTest_b <= lowRangeB_uid106_fpLogE1pxTest_in(50 downto 0);

	--reg_lowRangeB_uid106_fpLogE1pxTest_0_to_finalSum_uid106_uid109_fpLogE1pxTest_0(REG,618)@41
    reg_lowRangeB_uid106_fpLogE1pxTest_0_to_finalSum_uid106_uid109_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_lowRangeB_uid106_fpLogE1pxTest_0_to_finalSum_uid106_uid109_fpLogE1pxTest_0_q <= "000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_lowRangeB_uid106_fpLogE1pxTest_0_to_finalSum_uid106_uid109_fpLogE1pxTest_0_q <= lowRangeB_uid106_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--finalSum_uid106_uid109_fpLogE1pxTest(BITJOIN,108)@42
    finalSum_uid106_uid109_fpLogE1pxTest_q <= sumAHighB_uid108_fpLogE1pxTest_q & reg_lowRangeB_uid106_fpLogE1pxTest_0_to_finalSum_uid106_uid109_fpLogE1pxTest_0_q;

	--FullSumAB118_uid110_fpLogE1pxTest(BITSELECT,109)@42
    FullSumAB118_uid110_fpLogE1pxTest_in <= finalSum_uid106_uid109_fpLogE1pxTest_q;
    FullSumAB118_uid110_fpLogE1pxTest_b <= FullSumAB118_uid110_fpLogE1pxTest_in(118 downto 118);

	--ld_FullSumAB118_uid110_fpLogE1pxTest_b_to_finalSumAbs_uid113_fpLogE1pxTest_b(DELAY,759)@42
    ld_FullSumAB118_uid110_fpLogE1pxTest_b_to_finalSumAbs_uid113_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => FullSumAB118_uid110_fpLogE1pxTest_b, xout => ld_FullSumAB118_uid110_fpLogE1pxTest_b_to_finalSumAbs_uid113_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--finalSumOneComp_uid112_fpLogE1pxTest(LOGICAL,111)@42
    finalSumOneComp_uid112_fpLogE1pxTest_a <= finalSum_uid106_uid109_fpLogE1pxTest_q;
    finalSumOneComp_uid112_fpLogE1pxTest_b <= STD_LOGIC_VECTOR((118 downto 1 => FullSumAB118_uid110_fpLogE1pxTest_b(0)) & FullSumAB118_uid110_fpLogE1pxTest_b);
    finalSumOneComp_uid112_fpLogE1pxTest_q_i <= finalSumOneComp_uid112_fpLogE1pxTest_a xor finalSumOneComp_uid112_fpLogE1pxTest_b;
    finalSumOneComp_uid112_fpLogE1pxTest_delay : dspba_delay
    GENERIC MAP (width => 119, depth => 1)
    PORT MAP (xout => finalSumOneComp_uid112_fpLogE1pxTest_q, xin => finalSumOneComp_uid112_fpLogE1pxTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--finalSumAbs_uid113_fpLogE1pxTest(ADD,112)@43
    finalSumAbs_uid113_fpLogE1pxTest_a <= STD_LOGIC_VECTOR((119 downto 119 => finalSumOneComp_uid112_fpLogE1pxTest_q(118)) & finalSumOneComp_uid112_fpLogE1pxTest_q);
    finalSumAbs_uid113_fpLogE1pxTest_b <= STD_LOGIC_VECTOR((119 downto 1 => ld_FullSumAB118_uid110_fpLogE1pxTest_b_to_finalSumAbs_uid113_fpLogE1pxTest_b_q(0)) & ld_FullSumAB118_uid110_fpLogE1pxTest_b_to_finalSumAbs_uid113_fpLogE1pxTest_b_q);
            finalSumAbs_uid113_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(SIGNED(finalSumAbs_uid113_fpLogE1pxTest_a) + SIGNED(finalSumAbs_uid113_fpLogE1pxTest_b));
    finalSumAbs_uid113_fpLogE1pxTest_q <= finalSumAbs_uid113_fpLogE1pxTest_o(119 downto 0);


	--rVStage_uid320_countZ_uid114_fpLogE1pxTest(BITSELECT,319)@43
    rVStage_uid320_countZ_uid114_fpLogE1pxTest_in <= finalSumAbs_uid113_fpLogE1pxTest_q;
    rVStage_uid320_countZ_uid114_fpLogE1pxTest_b <= rVStage_uid320_countZ_uid114_fpLogE1pxTest_in(119 downto 56);

	--reg_rVStage_uid320_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid321_countZ_uid114_fpLogE1pxTest_1(REG,619)@43
    reg_rVStage_uid320_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid321_countZ_uid114_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid320_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid321_countZ_uid114_fpLogE1pxTest_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid320_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid321_countZ_uid114_fpLogE1pxTest_1_q <= rVStage_uid320_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid321_countZ_uid114_fpLogE1pxTest(LOGICAL,320)@44
    vCount_uid321_countZ_uid114_fpLogE1pxTest_a <= reg_rVStage_uid320_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid321_countZ_uid114_fpLogE1pxTest_1_q;
    vCount_uid321_countZ_uid114_fpLogE1pxTest_b <= zs_uid319_countZ_uid114_fpLogE1pxTest_q;
    vCount_uid321_countZ_uid114_fpLogE1pxTest_q <= "1" when vCount_uid321_countZ_uid114_fpLogE1pxTest_a = vCount_uid321_countZ_uid114_fpLogE1pxTest_b else "0";

	--reg_vCount_uid321_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_6(REG,633)@44
    reg_vCount_uid321_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid321_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_6_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid321_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_6_q <= vCount_uid321_countZ_uid114_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_vCount_uid321_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_6_q_to_r_uid360_countZ_uid114_fpLogE1pxTest_g(DELAY,1016)@45
    ld_reg_vCount_uid321_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_6_q_to_r_uid360_countZ_uid114_fpLogE1pxTest_g : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => reg_vCount_uid321_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_6_q, xout => ld_reg_vCount_uid321_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_6_q_to_r_uid360_countZ_uid114_fpLogE1pxTest_g_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid323_countZ_uid114_fpLogE1pxTest(BITSELECT,322)@43
    vStage_uid323_countZ_uid114_fpLogE1pxTest_in <= finalSumAbs_uid113_fpLogE1pxTest_q(55 downto 0);
    vStage_uid323_countZ_uid114_fpLogE1pxTest_b <= vStage_uid323_countZ_uid114_fpLogE1pxTest_in(55 downto 0);

	--ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_cStage_uid324_countZ_uid114_fpLogE1pxTest_b(DELAY,974)@43
    ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_cStage_uid324_countZ_uid114_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 56, depth => 1 )
    PORT MAP ( xin => vStage_uid323_countZ_uid114_fpLogE1pxTest_b, xout => ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_cStage_uid324_countZ_uid114_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--mO_uid322_countZ_uid114_fpLogE1pxTest(CONSTANT,321)
    mO_uid322_countZ_uid114_fpLogE1pxTest_q <= "11111111";

	--cStage_uid324_countZ_uid114_fpLogE1pxTest(BITJOIN,323)@44
    cStage_uid324_countZ_uid114_fpLogE1pxTest_q <= ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_cStage_uid324_countZ_uid114_fpLogE1pxTest_b_q & mO_uid322_countZ_uid114_fpLogE1pxTest_q;

	--ld_rVStage_uid320_countZ_uid114_fpLogE1pxTest_b_to_vStagei_uid326_countZ_uid114_fpLogE1pxTest_c(DELAY,976)@43
    ld_rVStage_uid320_countZ_uid114_fpLogE1pxTest_b_to_vStagei_uid326_countZ_uid114_fpLogE1pxTest_c : dspba_delay
    GENERIC MAP ( width => 64, depth => 1 )
    PORT MAP ( xin => rVStage_uid320_countZ_uid114_fpLogE1pxTest_b, xout => ld_rVStage_uid320_countZ_uid114_fpLogE1pxTest_b_to_vStagei_uid326_countZ_uid114_fpLogE1pxTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid326_countZ_uid114_fpLogE1pxTest(MUX,325)@44
    vStagei_uid326_countZ_uid114_fpLogE1pxTest_s <= vCount_uid321_countZ_uid114_fpLogE1pxTest_q;
    vStagei_uid326_countZ_uid114_fpLogE1pxTest: PROCESS (vStagei_uid326_countZ_uid114_fpLogE1pxTest_s, en, ld_rVStage_uid320_countZ_uid114_fpLogE1pxTest_b_to_vStagei_uid326_countZ_uid114_fpLogE1pxTest_c_q, cStage_uid324_countZ_uid114_fpLogE1pxTest_q)
    BEGIN
            CASE vStagei_uid326_countZ_uid114_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid326_countZ_uid114_fpLogE1pxTest_q <= ld_rVStage_uid320_countZ_uid114_fpLogE1pxTest_b_to_vStagei_uid326_countZ_uid114_fpLogE1pxTest_c_q;
                  WHEN "1" => vStagei_uid326_countZ_uid114_fpLogE1pxTest_q <= cStage_uid324_countZ_uid114_fpLogE1pxTest_q;
                  WHEN OTHERS => vStagei_uid326_countZ_uid114_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid328_countZ_uid114_fpLogE1pxTest(BITSELECT,327)@44
    rVStage_uid328_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid326_countZ_uid114_fpLogE1pxTest_q;
    rVStage_uid328_countZ_uid114_fpLogE1pxTest_b <= rVStage_uid328_countZ_uid114_fpLogE1pxTest_in(63 downto 32);

	--reg_rVStage_uid328_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid329_countZ_uid114_fpLogE1pxTest_1(REG,620)@44
    reg_rVStage_uid328_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid329_countZ_uid114_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid328_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid329_countZ_uid114_fpLogE1pxTest_1_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid328_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid329_countZ_uid114_fpLogE1pxTest_1_q <= rVStage_uid328_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid329_countZ_uid114_fpLogE1pxTest(LOGICAL,328)@45
    vCount_uid329_countZ_uid114_fpLogE1pxTest_a <= reg_rVStage_uid328_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid329_countZ_uid114_fpLogE1pxTest_1_q;
    vCount_uid329_countZ_uid114_fpLogE1pxTest_b <= rightShiftStage0Idx2Pad32_uid160_fracXRSExt_uid36_fpLogE1pxTest_q;
    vCount_uid329_countZ_uid114_fpLogE1pxTest_q <= "1" when vCount_uid329_countZ_uid114_fpLogE1pxTest_a = vCount_uid329_countZ_uid114_fpLogE1pxTest_b else "0";

	--ld_vCount_uid329_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid329_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_5_a(DELAY,1315)@45
    ld_vCount_uid329_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid329_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_5_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid329_countZ_uid114_fpLogE1pxTest_q, xout => ld_vCount_uid329_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid329_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_5_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid329_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_5(REG,632)@47
    reg_vCount_uid329_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid329_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_5_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid329_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_5_q <= ld_vCount_uid329_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid329_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_5_a_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid330_countZ_uid114_fpLogE1pxTest(BITSELECT,329)@44
    vStage_uid330_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid326_countZ_uid114_fpLogE1pxTest_q(31 downto 0);
    vStage_uid330_countZ_uid114_fpLogE1pxTest_b <= vStage_uid330_countZ_uid114_fpLogE1pxTest_in(31 downto 0);

	--reg_vStage_uid330_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid332_countZ_uid114_fpLogE1pxTest_3(REG,622)@44
    reg_vStage_uid330_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid332_countZ_uid114_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid330_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid332_countZ_uid114_fpLogE1pxTest_3_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid330_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid332_countZ_uid114_fpLogE1pxTest_3_q <= vStage_uid330_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid332_countZ_uid114_fpLogE1pxTest(MUX,331)@45
    vStagei_uid332_countZ_uid114_fpLogE1pxTest_s <= vCount_uid329_countZ_uid114_fpLogE1pxTest_q;
    vStagei_uid332_countZ_uid114_fpLogE1pxTest: PROCESS (vStagei_uid332_countZ_uid114_fpLogE1pxTest_s, en, reg_rVStage_uid328_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid329_countZ_uid114_fpLogE1pxTest_1_q, reg_vStage_uid330_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid332_countZ_uid114_fpLogE1pxTest_3_q)
    BEGIN
            CASE vStagei_uid332_countZ_uid114_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid332_countZ_uid114_fpLogE1pxTest_q <= reg_rVStage_uid328_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid329_countZ_uid114_fpLogE1pxTest_1_q;
                  WHEN "1" => vStagei_uid332_countZ_uid114_fpLogE1pxTest_q <= reg_vStage_uid330_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid332_countZ_uid114_fpLogE1pxTest_3_q;
                  WHEN OTHERS => vStagei_uid332_countZ_uid114_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid334_countZ_uid114_fpLogE1pxTest(BITSELECT,333)@45
    rVStage_uid334_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid332_countZ_uid114_fpLogE1pxTest_q;
    rVStage_uid334_countZ_uid114_fpLogE1pxTest_b <= rVStage_uid334_countZ_uid114_fpLogE1pxTest_in(31 downto 16);

	--reg_rVStage_uid334_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid335_countZ_uid114_fpLogE1pxTest_1(REG,623)@45
    reg_rVStage_uid334_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid335_countZ_uid114_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid334_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid335_countZ_uid114_fpLogE1pxTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid334_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid335_countZ_uid114_fpLogE1pxTest_1_q <= rVStage_uid334_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid335_countZ_uid114_fpLogE1pxTest(LOGICAL,334)@46
    vCount_uid335_countZ_uid114_fpLogE1pxTest_a <= reg_rVStage_uid334_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid335_countZ_uid114_fpLogE1pxTest_1_q;
    vCount_uid335_countZ_uid114_fpLogE1pxTest_b <= rightShiftStage0Idx1Pad16_uid157_fracXRSExt_uid36_fpLogE1pxTest_q;
    vCount_uid335_countZ_uid114_fpLogE1pxTest_q <= "1" when vCount_uid335_countZ_uid114_fpLogE1pxTest_a = vCount_uid335_countZ_uid114_fpLogE1pxTest_b else "0";

	--ld_vCount_uid335_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid335_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_4_a(DELAY,1314)@46
    ld_vCount_uid335_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid335_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_4_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid335_countZ_uid114_fpLogE1pxTest_q, xout => ld_vCount_uid335_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid335_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_4_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid335_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_4(REG,631)@47
    reg_vCount_uid335_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid335_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid335_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_4_q <= ld_vCount_uid335_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid335_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_4_a_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid336_countZ_uid114_fpLogE1pxTest(BITSELECT,335)@45
    vStage_uid336_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid332_countZ_uid114_fpLogE1pxTest_q(15 downto 0);
    vStage_uid336_countZ_uid114_fpLogE1pxTest_b <= vStage_uid336_countZ_uid114_fpLogE1pxTest_in(15 downto 0);

	--reg_vStage_uid336_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid338_countZ_uid114_fpLogE1pxTest_3(REG,625)@45
    reg_vStage_uid336_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid338_countZ_uid114_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid336_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid338_countZ_uid114_fpLogE1pxTest_3_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid336_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid338_countZ_uid114_fpLogE1pxTest_3_q <= vStage_uid336_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid338_countZ_uid114_fpLogE1pxTest(MUX,337)@46
    vStagei_uid338_countZ_uid114_fpLogE1pxTest_s <= vCount_uid335_countZ_uid114_fpLogE1pxTest_q;
    vStagei_uid338_countZ_uid114_fpLogE1pxTest: PROCESS (vStagei_uid338_countZ_uid114_fpLogE1pxTest_s, en, reg_rVStage_uid334_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid335_countZ_uid114_fpLogE1pxTest_1_q, reg_vStage_uid336_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid338_countZ_uid114_fpLogE1pxTest_3_q)
    BEGIN
            CASE vStagei_uid338_countZ_uid114_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid338_countZ_uid114_fpLogE1pxTest_q <= reg_rVStage_uid334_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid335_countZ_uid114_fpLogE1pxTest_1_q;
                  WHEN "1" => vStagei_uid338_countZ_uid114_fpLogE1pxTest_q <= reg_vStage_uid336_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid338_countZ_uid114_fpLogE1pxTest_3_q;
                  WHEN OTHERS => vStagei_uid338_countZ_uid114_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid340_countZ_uid114_fpLogE1pxTest(BITSELECT,339)@46
    rVStage_uid340_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid338_countZ_uid114_fpLogE1pxTest_q;
    rVStage_uid340_countZ_uid114_fpLogE1pxTest_b <= rVStage_uid340_countZ_uid114_fpLogE1pxTest_in(15 downto 8);

	--vCount_uid341_countZ_uid114_fpLogE1pxTest(LOGICAL,340)@46
    vCount_uid341_countZ_uid114_fpLogE1pxTest_a <= rVStage_uid340_countZ_uid114_fpLogE1pxTest_b;
    vCount_uid341_countZ_uid114_fpLogE1pxTest_b <= rightShiftStage1Idx2Pad8_uid171_fracXRSExt_uid36_fpLogE1pxTest_q;
    vCount_uid341_countZ_uid114_fpLogE1pxTest_q_i <= "1" when vCount_uid341_countZ_uid114_fpLogE1pxTest_a = vCount_uid341_countZ_uid114_fpLogE1pxTest_b else "0";
    vCount_uid341_countZ_uid114_fpLogE1pxTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => vCount_uid341_countZ_uid114_fpLogE1pxTest_q, xin => vCount_uid341_countZ_uid114_fpLogE1pxTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_vCount_uid341_countZ_uid114_fpLogE1pxTest_q_to_r_uid360_countZ_uid114_fpLogE1pxTest_d(DELAY,1013)@47
    ld_vCount_uid341_countZ_uid114_fpLogE1pxTest_q_to_r_uid360_countZ_uid114_fpLogE1pxTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid341_countZ_uid114_fpLogE1pxTest_q, xout => ld_vCount_uid341_countZ_uid114_fpLogE1pxTest_q_to_r_uid360_countZ_uid114_fpLogE1pxTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid342_countZ_uid114_fpLogE1pxTest(BITSELECT,341)@46
    vStage_uid342_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid338_countZ_uid114_fpLogE1pxTest_q(7 downto 0);
    vStage_uid342_countZ_uid114_fpLogE1pxTest_b <= vStage_uid342_countZ_uid114_fpLogE1pxTest_in(7 downto 0);

	--reg_vStage_uid342_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid344_countZ_uid114_fpLogE1pxTest_3(REG,627)@46
    reg_vStage_uid342_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid344_countZ_uid114_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid342_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid344_countZ_uid114_fpLogE1pxTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid342_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid344_countZ_uid114_fpLogE1pxTest_3_q <= vStage_uid342_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid340_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid344_countZ_uid114_fpLogE1pxTest_2(REG,626)@46
    reg_rVStage_uid340_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid344_countZ_uid114_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid340_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid344_countZ_uid114_fpLogE1pxTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid340_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid344_countZ_uid114_fpLogE1pxTest_2_q <= rVStage_uid340_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid344_countZ_uid114_fpLogE1pxTest(MUX,343)@47
    vStagei_uid344_countZ_uid114_fpLogE1pxTest_s <= vCount_uid341_countZ_uid114_fpLogE1pxTest_q;
    vStagei_uid344_countZ_uid114_fpLogE1pxTest: PROCESS (vStagei_uid344_countZ_uid114_fpLogE1pxTest_s, en, reg_rVStage_uid340_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid344_countZ_uid114_fpLogE1pxTest_2_q, reg_vStage_uid342_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid344_countZ_uid114_fpLogE1pxTest_3_q)
    BEGIN
            CASE vStagei_uid344_countZ_uid114_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid344_countZ_uid114_fpLogE1pxTest_q <= reg_rVStage_uid340_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid344_countZ_uid114_fpLogE1pxTest_2_q;
                  WHEN "1" => vStagei_uid344_countZ_uid114_fpLogE1pxTest_q <= reg_vStage_uid342_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid344_countZ_uid114_fpLogE1pxTest_3_q;
                  WHEN OTHERS => vStagei_uid344_countZ_uid114_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid346_countZ_uid114_fpLogE1pxTest(BITSELECT,345)@47
    rVStage_uid346_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid344_countZ_uid114_fpLogE1pxTest_q;
    rVStage_uid346_countZ_uid114_fpLogE1pxTest_b <= rVStage_uid346_countZ_uid114_fpLogE1pxTest_in(7 downto 4);

	--vCount_uid347_countZ_uid114_fpLogE1pxTest(LOGICAL,346)@47
    vCount_uid347_countZ_uid114_fpLogE1pxTest_a <= rVStage_uid346_countZ_uid114_fpLogE1pxTest_b;
    vCount_uid347_countZ_uid114_fpLogE1pxTest_b <= rightShiftStage1Idx1Pad4_uid168_fracXRSExt_uid36_fpLogE1pxTest_q;
    vCount_uid347_countZ_uid114_fpLogE1pxTest_q <= "1" when vCount_uid347_countZ_uid114_fpLogE1pxTest_a = vCount_uid347_countZ_uid114_fpLogE1pxTest_b else "0";

	--reg_vCount_uid347_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_2(REG,630)@47
    reg_vCount_uid347_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid347_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid347_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_2_q <= vCount_uid347_countZ_uid114_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid348_countZ_uid114_fpLogE1pxTest(BITSELECT,347)@47
    vStage_uid348_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid344_countZ_uid114_fpLogE1pxTest_q(3 downto 0);
    vStage_uid348_countZ_uid114_fpLogE1pxTest_b <= vStage_uid348_countZ_uid114_fpLogE1pxTest_in(3 downto 0);

	--vStagei_uid350_countZ_uid114_fpLogE1pxTest(MUX,349)@47
    vStagei_uid350_countZ_uid114_fpLogE1pxTest_s <= vCount_uid347_countZ_uid114_fpLogE1pxTest_q;
    vStagei_uid350_countZ_uid114_fpLogE1pxTest: PROCESS (vStagei_uid350_countZ_uid114_fpLogE1pxTest_s, en, rVStage_uid346_countZ_uid114_fpLogE1pxTest_b, vStage_uid348_countZ_uid114_fpLogE1pxTest_b)
    BEGIN
            CASE vStagei_uid350_countZ_uid114_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid350_countZ_uid114_fpLogE1pxTest_q <= rVStage_uid346_countZ_uid114_fpLogE1pxTest_b;
                  WHEN "1" => vStagei_uid350_countZ_uid114_fpLogE1pxTest_q <= vStage_uid348_countZ_uid114_fpLogE1pxTest_b;
                  WHEN OTHERS => vStagei_uid350_countZ_uid114_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid352_countZ_uid114_fpLogE1pxTest(BITSELECT,351)@47
    rVStage_uid352_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid350_countZ_uid114_fpLogE1pxTest_q;
    rVStage_uid352_countZ_uid114_fpLogE1pxTest_b <= rVStage_uid352_countZ_uid114_fpLogE1pxTest_in(3 downto 2);

	--vCount_uid353_countZ_uid114_fpLogE1pxTest(LOGICAL,352)@47
    vCount_uid353_countZ_uid114_fpLogE1pxTest_a <= rVStage_uid352_countZ_uid114_fpLogE1pxTest_b;
    vCount_uid353_countZ_uid114_fpLogE1pxTest_b <= z2_uid100_fpLogE1pxTest_q;
    vCount_uid353_countZ_uid114_fpLogE1pxTest_q_i <= "1" when vCount_uid353_countZ_uid114_fpLogE1pxTest_a = vCount_uid353_countZ_uid114_fpLogE1pxTest_b else "0";
    vCount_uid353_countZ_uid114_fpLogE1pxTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => vCount_uid353_countZ_uid114_fpLogE1pxTest_q, xin => vCount_uid353_countZ_uid114_fpLogE1pxTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--vStage_uid354_countZ_uid114_fpLogE1pxTest(BITSELECT,353)@47
    vStage_uid354_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid350_countZ_uid114_fpLogE1pxTest_q(1 downto 0);
    vStage_uid354_countZ_uid114_fpLogE1pxTest_b <= vStage_uid354_countZ_uid114_fpLogE1pxTest_in(1 downto 0);

	--reg_vStage_uid354_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid356_countZ_uid114_fpLogE1pxTest_3(REG,629)@47
    reg_vStage_uid354_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid356_countZ_uid114_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid354_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid356_countZ_uid114_fpLogE1pxTest_3_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid354_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid356_countZ_uid114_fpLogE1pxTest_3_q <= vStage_uid354_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid352_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid356_countZ_uid114_fpLogE1pxTest_2(REG,628)@47
    reg_rVStage_uid352_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid356_countZ_uid114_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid352_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid356_countZ_uid114_fpLogE1pxTest_2_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid352_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid356_countZ_uid114_fpLogE1pxTest_2_q <= rVStage_uid352_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid356_countZ_uid114_fpLogE1pxTest(MUX,355)@48
    vStagei_uid356_countZ_uid114_fpLogE1pxTest_s <= vCount_uid353_countZ_uid114_fpLogE1pxTest_q;
    vStagei_uid356_countZ_uid114_fpLogE1pxTest: PROCESS (vStagei_uid356_countZ_uid114_fpLogE1pxTest_s, en, reg_rVStage_uid352_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid356_countZ_uid114_fpLogE1pxTest_2_q, reg_vStage_uid354_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid356_countZ_uid114_fpLogE1pxTest_3_q)
    BEGIN
            CASE vStagei_uid356_countZ_uid114_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid356_countZ_uid114_fpLogE1pxTest_q <= reg_rVStage_uid352_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid356_countZ_uid114_fpLogE1pxTest_2_q;
                  WHEN "1" => vStagei_uid356_countZ_uid114_fpLogE1pxTest_q <= reg_vStage_uid354_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid356_countZ_uid114_fpLogE1pxTest_3_q;
                  WHEN OTHERS => vStagei_uid356_countZ_uid114_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid358_countZ_uid114_fpLogE1pxTest(BITSELECT,357)@48
    rVStage_uid358_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid356_countZ_uid114_fpLogE1pxTest_q;
    rVStage_uid358_countZ_uid114_fpLogE1pxTest_b <= rVStage_uid358_countZ_uid114_fpLogE1pxTest_in(1 downto 1);

	--vCount_uid359_countZ_uid114_fpLogE1pxTest(LOGICAL,358)@48
    vCount_uid359_countZ_uid114_fpLogE1pxTest_a <= rVStage_uid358_countZ_uid114_fpLogE1pxTest_b;
    vCount_uid359_countZ_uid114_fpLogE1pxTest_b <= GND_q;
    vCount_uid359_countZ_uid114_fpLogE1pxTest_q <= "1" when vCount_uid359_countZ_uid114_fpLogE1pxTest_a = vCount_uid359_countZ_uid114_fpLogE1pxTest_b else "0";

	--r_uid360_countZ_uid114_fpLogE1pxTest(BITJOIN,359)@48
    r_uid360_countZ_uid114_fpLogE1pxTest_q <= ld_reg_vCount_uid321_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_6_q_to_r_uid360_countZ_uid114_fpLogE1pxTest_g_q & reg_vCount_uid329_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_5_q & reg_vCount_uid335_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_4_q & ld_vCount_uid341_countZ_uid114_fpLogE1pxTest_q_to_r_uid360_countZ_uid114_fpLogE1pxTest_d_q & reg_vCount_uid347_countZ_uid114_fpLogE1pxTest_0_to_r_uid360_countZ_uid114_fpLogE1pxTest_2_q & vCount_uid353_countZ_uid114_fpLogE1pxTest_q & vCount_uid359_countZ_uid114_fpLogE1pxTest_q;

	--cstMSBFinalSumPBias_uid116_fpLogE1pxTest(CONSTANT,115)
    cstMSBFinalSumPBias_uid116_fpLogE1pxTest_q <= "010000001100";

	--expRExt0_uid117_fpLogE1pxTest(SUB,116)@48
    expRExt0_uid117_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & cstMSBFinalSumPBias_uid116_fpLogE1pxTest_q);
    expRExt0_uid117_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("000000" & r_uid360_countZ_uid114_fpLogE1pxTest_q);
            expRExt0_uid117_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRExt0_uid117_fpLogE1pxTest_a) - UNSIGNED(expRExt0_uid117_fpLogE1pxTest_b));
    expRExt0_uid117_fpLogE1pxTest_q <= expRExt0_uid117_fpLogE1pxTest_o(12 downto 0);


	--reg_expRExt0_uid117_fpLogE1pxTest_0_to_expRExt1_uid119_fpLogE1pxTest_0(REG,647)@48
    reg_expRExt0_uid117_fpLogE1pxTest_0_to_expRExt1_uid119_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRExt0_uid117_fpLogE1pxTest_0_to_expRExt1_uid119_fpLogE1pxTest_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRExt0_uid117_fpLogE1pxTest_0_to_expRExt1_uid119_fpLogE1pxTest_0_q <= expRExt0_uid117_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expRExt1_uid119_fpLogE1pxTest(SUB,118)@49
    expRExt1_uid119_fpLogE1pxTest_a <= STD_LOGIC_VECTOR((13 downto 13 => reg_expRExt0_uid117_fpLogE1pxTest_0_to_expRExt1_uid119_fpLogE1pxTest_0_q(12)) & reg_expRExt0_uid117_fpLogE1pxTest_0_to_expRExt1_uid119_fpLogE1pxTest_0_q);
    expRExt1_uid119_fpLogE1pxTest_b <= STD_LOGIC_VECTOR((13 downto 7 => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_q(6)) & ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_q);
            expRExt1_uid119_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(SIGNED(expRExt1_uid119_fpLogE1pxTest_a) - SIGNED(expRExt1_uid119_fpLogE1pxTest_b));
    expRExt1_uid119_fpLogE1pxTest_q <= expRExt1_uid119_fpLogE1pxTest_o(13 downto 0);


	--expRExt1Red_uid120_fpLogE1pxTest(BITSELECT,119)@49
    expRExt1Red_uid120_fpLogE1pxTest_in <= expRExt1_uid119_fpLogE1pxTest_q(12 downto 0);
    expRExt1Red_uid120_fpLogE1pxTest_b <= expRExt1Red_uid120_fpLogE1pxTest_in(12 downto 0);

	--ld_expRExt0_uid117_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_c(DELAY,767)@48
    ld_expRExt0_uid117_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_c : dspba_delay
    GENERIC MAP ( width => 13, depth => 1 )
    PORT MAP ( xin => expRExt0_uid117_fpLogE1pxTest_q, xout => ld_expRExt0_uid117_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b(DELAY,766)@35
    ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => branch3OrC_uid94_fpLogE1pxTest_q, xout => ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expRExt_uid121_fpLogE1pxTest(MUX,120)@49
    expRExt_uid121_fpLogE1pxTest_s <= ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b_q;
    expRExt_uid121_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRExt_uid121_fpLogE1pxTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRExt_uid121_fpLogE1pxTest_s IS
                      WHEN "0" => expRExt_uid121_fpLogE1pxTest_q <= ld_expRExt0_uid117_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_c_q;
                      WHEN "1" => expRExt_uid121_fpLogE1pxTest_q <= expRExt1Red_uid120_fpLogE1pxTest_b;
                      WHEN OTHERS => expRExt_uid121_fpLogE1pxTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage2118dto0_uid397_normVal_uid115_fpLogE1pxTest(BITSELECT,396)@50
    LeftShiftStage2118dto0_uid397_normVal_uid115_fpLogE1pxTest_in <= leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_q(118 downto 0);
    LeftShiftStage2118dto0_uid397_normVal_uid115_fpLogE1pxTest_b <= LeftShiftStage2118dto0_uid397_normVal_uid115_fpLogE1pxTest_in(118 downto 0);

	--leftShiftStage3Idx1_uid398_normVal_uid115_fpLogE1pxTest(BITJOIN,397)@50
    leftShiftStage3Idx1_uid398_normVal_uid115_fpLogE1pxTest_q <= LeftShiftStage2118dto0_uid397_normVal_uid115_fpLogE1pxTest_b & GND_q;

	--ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_nor(LOGICAL,1668)
    ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_nor_b <= ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q;
    ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_nor_q <= not (ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_nor_a or ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_nor_b);

	--ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_sticky_ena(REG,1669)
    ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_nor_q = "1") THEN
                ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_enaAnd(LOGICAL,1670)
    ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_enaAnd_a <= ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q;
    ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_enaAnd_b <= en;
    ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_enaAnd_q <= ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_enaAnd_a and ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_enaAnd_b;

	--X23dto0_uid370_normVal_uid115_fpLogE1pxTest(BITSELECT,369)@43
    X23dto0_uid370_normVal_uid115_fpLogE1pxTest_in <= finalSumAbs_uid113_fpLogE1pxTest_q(23 downto 0);
    X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b <= X23dto0_uid370_normVal_uid115_fpLogE1pxTest_in(23 downto 0);

	--ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_inputreg(DELAY,1660)
    ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b, xout => ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem(DUALMEM,1661)
    ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia <= ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_inputreg_q;
    ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg_q;
    ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_q;
    ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq,
        address_a => ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa,
        data_a => ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia
    );
    ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0 <= areset;
        ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_q <= ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq(23 downto 0);

	--leftShiftStage0Idx3Pad96_uid369_normVal_uid115_fpLogE1pxTest(CONSTANT,368)
    leftShiftStage0Idx3Pad96_uid369_normVal_uid115_fpLogE1pxTest_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

	--leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest(BITJOIN,370)@47
    leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_q <= ld_X23dto0_uid370_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_b_replace_mem_q & leftShiftStage0Idx3Pad96_uid369_normVal_uid115_fpLogE1pxTest_q;

	--reg_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_5(REG,637)@47
    reg_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_5_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_5_q <= leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_nor(LOGICAL,1657)
    ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_nor_b <= ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q;
    ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_nor_q <= not (ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_nor_a or ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_nor_b);

	--ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_sticky_ena(REG,1658)
    ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_nor_q = "1") THEN
                ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_enaAnd(LOGICAL,1659)
    ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_enaAnd_a <= ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q;
    ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_enaAnd_b <= en;
    ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_enaAnd_q <= ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_enaAnd_a and ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_enaAnd_b;

	--ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem(DUALMEM,1650)
    ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia <= ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_cStage_uid324_countZ_uid114_fpLogE1pxTest_b_q;
    ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg_q;
    ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_q;
    ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 56,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 56,
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
        clocken1 => ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq,
        address_a => ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa,
        data_a => ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia
    );
    ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0 <= areset;
        ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_q <= ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq(55 downto 0);

	--leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest(BITJOIN,367)@47
    leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_q <= ld_vStage_uid323_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_b_replace_mem_q & zs_uid319_countZ_uid114_fpLogE1pxTest_q;

	--reg_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_4(REG,636)@47
    reg_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_4_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_4_q <= leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_nor(LOGICAL,1646)
    ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_nor_b <= ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q;
    ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_nor_q <= not (ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_nor_a or ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_nor_b);

	--ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_sticky_ena(REG,1647)
    ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_nor_q = "1") THEN
                ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_enaAnd(LOGICAL,1648)
    ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_enaAnd_a <= ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q;
    ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_enaAnd_b <= en;
    ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_enaAnd_q <= ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_enaAnd_a and ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_enaAnd_b;

	--X87dto0_uid364_normVal_uid115_fpLogE1pxTest(BITSELECT,363)@43
    X87dto0_uid364_normVal_uid115_fpLogE1pxTest_in <= finalSumAbs_uid113_fpLogE1pxTest_q(87 downto 0);
    X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b <= X87dto0_uid364_normVal_uid115_fpLogE1pxTest_in(87 downto 0);

	--ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_inputreg(DELAY,1638)
    ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 88, depth => 1 )
    PORT MAP ( xin => X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b, xout => ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem(DUALMEM,1639)
    ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia <= ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_inputreg_q;
    ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg_q;
    ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_q;
    ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 88,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 88,
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
        clocken1 => ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq,
        address_a => ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa,
        data_a => ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia
    );
    ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0 <= areset;
        ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_q <= ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq(87 downto 0);

	--leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest(BITJOIN,364)@47
    leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_q <= ld_X87dto0_uid364_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_b_replace_mem_q & rightShiftStage0Idx2Pad32_uid160_fracXRSExt_uid36_fpLogE1pxTest_q;

	--reg_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_3(REG,635)@47
    reg_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_3_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_3_q <= leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_nor(LOGICAL,1679)
    ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_nor_b <= ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_sticky_ena_q;
    ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_nor_q <= not (ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_nor_a or ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_nor_b);

	--ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_sticky_ena(REG,1680)
    ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_nor_q = "1") THEN
                ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_sticky_ena_q <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_enaAnd(LOGICAL,1681)
    ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_enaAnd_a <= ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_sticky_ena_q;
    ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_enaAnd_b <= en;
    ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_enaAnd_q <= ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_enaAnd_a and ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_enaAnd_b;

	--reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2(REG,634)@43
    reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q <= finalSumAbs_uid113_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_inputreg(DELAY,1671)
    ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 120, depth => 1 )
    PORT MAP ( xin => reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q, xout => ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem(DUALMEM,1672)
    ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_ia <= ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_inputreg_q;
    ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_aa <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdreg_q;
    ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_ab <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_replace_rdmux_q;
    ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 120,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 120,
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
        clocken1 => ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_iq,
        address_a => ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_aa,
        data_a => ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_ia
    );
    ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_reset0 <= areset;
        ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_q <= ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_iq(119 downto 0);

	--leftShiftStageSel6Dto5_uid372_normVal_uid115_fpLogE1pxTest(BITSELECT,371)@48
    leftShiftStageSel6Dto5_uid372_normVal_uid115_fpLogE1pxTest_in <= r_uid360_countZ_uid114_fpLogE1pxTest_q;
    leftShiftStageSel6Dto5_uid372_normVal_uid115_fpLogE1pxTest_b <= leftShiftStageSel6Dto5_uid372_normVal_uid115_fpLogE1pxTest_in(6 downto 5);

	--leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest(MUX,372)@48
    leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_s <= leftShiftStageSel6Dto5_uid372_normVal_uid115_fpLogE1pxTest_b;
    leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest: PROCESS (leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_s, en, ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_q, reg_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_3_q, reg_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_4_q, reg_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_5_q)
    BEGIN
            CASE leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_s IS
                  WHEN "00" => leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_q <= ld_reg_finalSumAbs_uid113_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_2_q_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_c_replace_mem_q;
                  WHEN "01" => leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_q <= reg_leftShiftStage0Idx1_uid365_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_3_q;
                  WHEN "10" => leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_q <= reg_leftShiftStage0Idx2_uid368_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_4_q;
                  WHEN "11" => leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_q <= reg_leftShiftStage0Idx3_uid371_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_5_q;
                  WHEN OTHERS => leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage095dto0_uid381_normVal_uid115_fpLogE1pxTest(BITSELECT,380)@48
    LeftShiftStage095dto0_uid381_normVal_uid115_fpLogE1pxTest_in <= leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_q(95 downto 0);
    LeftShiftStage095dto0_uid381_normVal_uid115_fpLogE1pxTest_b <= LeftShiftStage095dto0_uid381_normVal_uid115_fpLogE1pxTest_in(95 downto 0);

	--leftShiftStage1Idx3Pad24_uid380_normVal_uid115_fpLogE1pxTest(CONSTANT,379)
    leftShiftStage1Idx3Pad24_uid380_normVal_uid115_fpLogE1pxTest_q <= "000000000000000000000000";

	--leftShiftStage1Idx3_uid382_normVal_uid115_fpLogE1pxTest(BITJOIN,381)@48
    leftShiftStage1Idx3_uid382_normVal_uid115_fpLogE1pxTest_q <= LeftShiftStage095dto0_uid381_normVal_uid115_fpLogE1pxTest_b & leftShiftStage1Idx3Pad24_uid380_normVal_uid115_fpLogE1pxTest_q;

	--reg_leftShiftStage1Idx3_uid382_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_5(REG,642)@48
    reg_leftShiftStage1Idx3_uid382_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid382_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_5_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid382_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_5_q <= leftShiftStage1Idx3_uid382_normVal_uid115_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage0103dto0_uid378_normVal_uid115_fpLogE1pxTest(BITSELECT,377)@48
    LeftShiftStage0103dto0_uid378_normVal_uid115_fpLogE1pxTest_in <= leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_q(103 downto 0);
    LeftShiftStage0103dto0_uid378_normVal_uid115_fpLogE1pxTest_b <= LeftShiftStage0103dto0_uid378_normVal_uid115_fpLogE1pxTest_in(103 downto 0);

	--leftShiftStage1Idx2_uid379_normVal_uid115_fpLogE1pxTest(BITJOIN,378)@48
    leftShiftStage1Idx2_uid379_normVal_uid115_fpLogE1pxTest_q <= LeftShiftStage0103dto0_uid378_normVal_uid115_fpLogE1pxTest_b & rightShiftStage0Idx1Pad16_uid157_fracXRSExt_uid36_fpLogE1pxTest_q;

	--reg_leftShiftStage1Idx2_uid379_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_4(REG,641)@48
    reg_leftShiftStage1Idx2_uid379_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid379_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_4_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid379_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_4_q <= leftShiftStage1Idx2_uid379_normVal_uid115_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage0111dto0_uid375_normVal_uid115_fpLogE1pxTest(BITSELECT,374)@48
    LeftShiftStage0111dto0_uid375_normVal_uid115_fpLogE1pxTest_in <= leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_q(111 downto 0);
    LeftShiftStage0111dto0_uid375_normVal_uid115_fpLogE1pxTest_b <= LeftShiftStage0111dto0_uid375_normVal_uid115_fpLogE1pxTest_in(111 downto 0);

	--leftShiftStage1Idx1_uid376_normVal_uid115_fpLogE1pxTest(BITJOIN,375)@48
    leftShiftStage1Idx1_uid376_normVal_uid115_fpLogE1pxTest_q <= LeftShiftStage0111dto0_uid375_normVal_uid115_fpLogE1pxTest_b & rightShiftStage1Idx2Pad8_uid171_fracXRSExt_uid36_fpLogE1pxTest_q;

	--reg_leftShiftStage1Idx1_uid376_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_3(REG,640)@48
    reg_leftShiftStage1Idx1_uid376_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid376_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_3_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid376_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_3_q <= leftShiftStage1Idx1_uid376_normVal_uid115_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_2(REG,639)@48
    reg_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_2_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_2_q <= leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel4Dto3_uid383_normVal_uid115_fpLogE1pxTest(BITSELECT,382)@48
    leftShiftStageSel4Dto3_uid383_normVal_uid115_fpLogE1pxTest_in <= r_uid360_countZ_uid114_fpLogE1pxTest_q(4 downto 0);
    leftShiftStageSel4Dto3_uid383_normVal_uid115_fpLogE1pxTest_b <= leftShiftStageSel4Dto3_uid383_normVal_uid115_fpLogE1pxTest_in(4 downto 3);

	--reg_leftShiftStageSel4Dto3_uid383_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_1(REG,638)@48
    reg_leftShiftStageSel4Dto3_uid383_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel4Dto3_uid383_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel4Dto3_uid383_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_1_q <= leftShiftStageSel4Dto3_uid383_normVal_uid115_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest(MUX,383)@49
    leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_s <= reg_leftShiftStageSel4Dto3_uid383_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_1_q;
    leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest: PROCESS (leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_s, en, reg_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_2_q, reg_leftShiftStage1Idx1_uid376_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_3_q, reg_leftShiftStage1Idx2_uid379_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_4_q, reg_leftShiftStage1Idx3_uid382_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_s IS
                  WHEN "00" => leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_q <= reg_leftShiftStage0_uid373_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_2_q;
                  WHEN "01" => leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_q <= reg_leftShiftStage1Idx1_uid376_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_3_q;
                  WHEN "10" => leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_q <= reg_leftShiftStage1Idx2_uid379_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_4_q;
                  WHEN "11" => leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_q <= reg_leftShiftStage1Idx3_uid382_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage1113dto0_uid392_normVal_uid115_fpLogE1pxTest(BITSELECT,391)@49
    LeftShiftStage1113dto0_uid392_normVal_uid115_fpLogE1pxTest_in <= leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_q(113 downto 0);
    LeftShiftStage1113dto0_uid392_normVal_uid115_fpLogE1pxTest_b <= LeftShiftStage1113dto0_uid392_normVal_uid115_fpLogE1pxTest_in(113 downto 0);

	--ld_LeftShiftStage1113dto0_uid392_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid393_normVal_uid115_fpLogE1pxTest_b(DELAY,1045)@49
    ld_LeftShiftStage1113dto0_uid392_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid393_normVal_uid115_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 114, depth => 1 )
    PORT MAP ( xin => LeftShiftStage1113dto0_uid392_normVal_uid115_fpLogE1pxTest_b, xout => ld_LeftShiftStage1113dto0_uid392_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid393_normVal_uid115_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx3Pad6_uid391_normVal_uid115_fpLogE1pxTest(CONSTANT,390)
    leftShiftStage2Idx3Pad6_uid391_normVal_uid115_fpLogE1pxTest_q <= "000000";

	--leftShiftStage2Idx3_uid393_normVal_uid115_fpLogE1pxTest(BITJOIN,392)@50
    leftShiftStage2Idx3_uid393_normVal_uid115_fpLogE1pxTest_q <= ld_LeftShiftStage1113dto0_uid392_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid393_normVal_uid115_fpLogE1pxTest_b_q & leftShiftStage2Idx3Pad6_uid391_normVal_uid115_fpLogE1pxTest_q;

	--LeftShiftStage1115dto0_uid389_normVal_uid115_fpLogE1pxTest(BITSELECT,388)@49
    LeftShiftStage1115dto0_uid389_normVal_uid115_fpLogE1pxTest_in <= leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_q(115 downto 0);
    LeftShiftStage1115dto0_uid389_normVal_uid115_fpLogE1pxTest_b <= LeftShiftStage1115dto0_uid389_normVal_uid115_fpLogE1pxTest_in(115 downto 0);

	--ld_LeftShiftStage1115dto0_uid389_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid390_normVal_uid115_fpLogE1pxTest_b(DELAY,1043)@49
    ld_LeftShiftStage1115dto0_uid389_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid390_normVal_uid115_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 116, depth => 1 )
    PORT MAP ( xin => LeftShiftStage1115dto0_uid389_normVal_uid115_fpLogE1pxTest_b, xout => ld_LeftShiftStage1115dto0_uid389_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid390_normVal_uid115_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx2_uid390_normVal_uid115_fpLogE1pxTest(BITJOIN,389)@50
    leftShiftStage2Idx2_uid390_normVal_uid115_fpLogE1pxTest_q <= ld_LeftShiftStage1115dto0_uid389_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid390_normVal_uid115_fpLogE1pxTest_b_q & rightShiftStage1Idx1Pad4_uid168_fracXRSExt_uid36_fpLogE1pxTest_q;

	--LeftShiftStage1117dto0_uid386_normVal_uid115_fpLogE1pxTest(BITSELECT,385)@49
    LeftShiftStage1117dto0_uid386_normVal_uid115_fpLogE1pxTest_in <= leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_q(117 downto 0);
    LeftShiftStage1117dto0_uid386_normVal_uid115_fpLogE1pxTest_b <= LeftShiftStage1117dto0_uid386_normVal_uid115_fpLogE1pxTest_in(117 downto 0);

	--ld_LeftShiftStage1117dto0_uid386_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid387_normVal_uid115_fpLogE1pxTest_b(DELAY,1041)@49
    ld_LeftShiftStage1117dto0_uid386_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid387_normVal_uid115_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 118, depth => 1 )
    PORT MAP ( xin => LeftShiftStage1117dto0_uid386_normVal_uid115_fpLogE1pxTest_b, xout => ld_LeftShiftStage1117dto0_uid386_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid387_normVal_uid115_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx1_uid387_normVal_uid115_fpLogE1pxTest(BITJOIN,386)@50
    leftShiftStage2Idx1_uid387_normVal_uid115_fpLogE1pxTest_q <= ld_LeftShiftStage1117dto0_uid386_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid387_normVal_uid115_fpLogE1pxTest_b_q & z2_uid100_fpLogE1pxTest_q;

	--reg_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_2(REG,644)@49
    reg_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_2_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_2_q <= leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest(BITSELECT,393)@48
    leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_in <= r_uid360_countZ_uid114_fpLogE1pxTest_q(2 downto 0);
    leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_b <= leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_in(2 downto 1);

	--reg_leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_1(REG,643)@48
    reg_leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_1_q <= leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_1_q_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_b(DELAY,1047)@49
    ld_reg_leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_1_q_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_1_q, xout => ld_reg_leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_1_q_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest(MUX,394)@50
    leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_s <= ld_reg_leftShiftStageSel2Dto1_uid394_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_1_q_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_b_q;
    leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest: PROCESS (leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_s, en, reg_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_2_q, leftShiftStage2Idx1_uid387_normVal_uid115_fpLogE1pxTest_q, leftShiftStage2Idx2_uid390_normVal_uid115_fpLogE1pxTest_q, leftShiftStage2Idx3_uid393_normVal_uid115_fpLogE1pxTest_q)
    BEGIN
            CASE leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_s IS
                  WHEN "00" => leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_q <= reg_leftShiftStage1_uid384_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_2_q;
                  WHEN "01" => leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_q <= leftShiftStage2Idx1_uid387_normVal_uid115_fpLogE1pxTest_q;
                  WHEN "10" => leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_q <= leftShiftStage2Idx2_uid390_normVal_uid115_fpLogE1pxTest_q;
                  WHEN "11" => leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_q <= leftShiftStage2Idx3_uid393_normVal_uid115_fpLogE1pxTest_q;
                  WHEN OTHERS => leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel0Dto0_uid399_normVal_uid115_fpLogE1pxTest(BITSELECT,398)@48
    leftShiftStageSel0Dto0_uid399_normVal_uid115_fpLogE1pxTest_in <= r_uid360_countZ_uid114_fpLogE1pxTest_q(0 downto 0);
    leftShiftStageSel0Dto0_uid399_normVal_uid115_fpLogE1pxTest_b <= leftShiftStageSel0Dto0_uid399_normVal_uid115_fpLogE1pxTest_in(0 downto 0);

	--ld_leftShiftStageSel0Dto0_uid399_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest_b(DELAY,1055)@48
    ld_leftShiftStageSel0Dto0_uid399_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => leftShiftStageSel0Dto0_uid399_normVal_uid115_fpLogE1pxTest_b, xout => ld_leftShiftStageSel0Dto0_uid399_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest(MUX,399)@50
    leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest_s <= ld_leftShiftStageSel0Dto0_uid399_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest_b_q;
    leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest: PROCESS (leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest_s, en, leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_q, leftShiftStage3Idx1_uid398_normVal_uid115_fpLogE1pxTest_q)
    BEGIN
            CASE leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest_s IS
                  WHEN "0" => leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest_q <= leftShiftStage2_uid395_normVal_uid115_fpLogE1pxTest_q;
                  WHEN "1" => leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest_q <= leftShiftStage3Idx1_uid398_normVal_uid115_fpLogE1pxTest_q;
                  WHEN OTHERS => leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracR_uid122_fpLogE1pxTest(BITSELECT,121)@50
    fracR_uid122_fpLogE1pxTest_in <= leftShiftStage3_uid400_normVal_uid115_fpLogE1pxTest_q(118 downto 0);
    fracR_uid122_fpLogE1pxTest_b <= fracR_uid122_fpLogE1pxTest_in(118 downto 66);

	--expFracConc_uid123_fpLogE1pxTest(BITJOIN,122)@50
    expFracConc_uid123_fpLogE1pxTest_q <= expRExt_uid121_fpLogE1pxTest_q & fracR_uid122_fpLogE1pxTest_b;

	--reg_expFracConc_uid123_fpLogE1pxTest_0_to_expFracPostRnd_uid124_fpLogE1pxTest_0(REG,648)@50
    reg_expFracConc_uid123_fpLogE1pxTest_0_to_expFracPostRnd_uid124_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracConc_uid123_fpLogE1pxTest_0_to_expFracPostRnd_uid124_fpLogE1pxTest_0_q <= "000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracConc_uid123_fpLogE1pxTest_0_to_expFracPostRnd_uid124_fpLogE1pxTest_0_q <= expFracConc_uid123_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracPostRnd_uid124_fpLogE1pxTest(ADD,123)@51
    expFracPostRnd_uid124_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & reg_expFracConc_uid123_fpLogE1pxTest_0_to_expFracPostRnd_uid124_fpLogE1pxTest_0_q);
    expFracPostRnd_uid124_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000000000000000000000000000000000000" & VCC_q);
            expFracPostRnd_uid124_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracPostRnd_uid124_fpLogE1pxTest_a) + UNSIGNED(expFracPostRnd_uid124_fpLogE1pxTest_b));
    expFracPostRnd_uid124_fpLogE1pxTest_q <= expFracPostRnd_uid124_fpLogE1pxTest_o(66 downto 0);


	--expR_uid127_fpLogE1pxTest(BITSELECT,126)@51
    expR_uid127_fpLogE1pxTest_in <= expFracPostRnd_uid124_fpLogE1pxTest_q(63 downto 0);
    expR_uid127_fpLogE1pxTest_b <= expR_uid127_fpLogE1pxTest_in(63 downto 53);

	--reg_expR_uid127_fpLogE1pxTest_0_to_expR_uid128_fpLogE1pxTest_2(REG,652)@51
    reg_expR_uid127_fpLogE1pxTest_0_to_expR_uid128_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expR_uid127_fpLogE1pxTest_0_to_expR_uid128_fpLogE1pxTest_2_q <= "00000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expR_uid127_fpLogE1pxTest_0_to_expR_uid128_fpLogE1pxTest_2_q <= expR_uid127_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_nor(LOGICAL,1522)
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_nor_b <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena_q;
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_nor_q <= not (ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_nor_a or ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_nor_b);

	--ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_mem_top(CONSTANT,1518)
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_mem_top_q <= "0110000";

	--ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmp(LOGICAL,1519)
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmp_a <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_mem_top_q;
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_q);
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmp_q <= "1" when ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmp_a = ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmp_b else "0";

	--ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmpReg(REG,1520)
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmpReg_q <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena(REG,1523)
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_nor_q = "1") THEN
                ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena_q <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_enaAnd(LOGICAL,1524)
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_a <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena_q;
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_b <= en;
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_q <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_a and ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_b;

	--reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1(REG,649)@0
    reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q <= resIsX_uid62_fpLogE1pxTest_c;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_inputreg(DELAY,1512)
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q, xout => ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt(COUNTER,1514)
    -- every=1, low=0, high=48, step=1, init=1
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i = 47 THEN
                      ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_eq = '1') THEN
                        ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i - 48;
                    ELSE
                        ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i,6));


	--ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg(REG,1515)
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg_q <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux(MUX,1516)
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_s <= en;
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux: PROCESS (ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_s, ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg_q, ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_q <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg_q;
                  WHEN "1" => ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_q <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem(DUALMEM,1513)
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_ia <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_inputreg_q;
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_aa <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg_q;
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_ab <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_q;
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 49,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 49,
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
        clocken1 => ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_iq,
        address_a => ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_aa,
        data_a => ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_ia
    );
    ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_reset0 <= areset;
        ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_q <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_iq(0 downto 0);

	--expR_uid128_fpLogE1pxTest(MUX,127)@52
    expR_uid128_fpLogE1pxTest_s <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_q;
    expR_uid128_fpLogE1pxTest: PROCESS (expR_uid128_fpLogE1pxTest_s, en, reg_expR_uid127_fpLogE1pxTest_0_to_expR_uid128_fpLogE1pxTest_2_q, ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_q)
    BEGIN
            CASE expR_uid128_fpLogE1pxTest_s IS
                  WHEN "0" => expR_uid128_fpLogE1pxTest_q <= reg_expR_uid127_fpLogE1pxTest_0_to_expR_uid128_fpLogE1pxTest_2_q;
                  WHEN "1" => expR_uid128_fpLogE1pxTest_q <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_q;
                  WHEN OTHERS => expR_uid128_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_nor(LOGICAL,1559)
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_nor_b <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_sticky_ena_q;
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_nor_q <= not (ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_nor_a or ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_nor_b);

	--ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_mem_top(CONSTANT,1555)
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_mem_top_q <= "0101110";

	--ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmp(LOGICAL,1556)
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmp_a <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_mem_top_q;
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdmux_q);
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmp_q <= "1" when ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmp_a = ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmp_b else "0";

	--ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmpReg(REG,1557)
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmpReg_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_sticky_ena(REG,1560)
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_nor_q = "1") THEN
                ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_sticky_ena_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_enaAnd(LOGICAL,1561)
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_enaAnd_a <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_sticky_ena_q;
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_enaAnd_b <= en;
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_enaAnd_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_enaAnd_a and ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_enaAnd_b;

	--xM1_uid131_fpLogE1pxTest(LOGICAL,130)@0
    xM1_uid131_fpLogE1pxTest_a <= a;
    xM1_uid131_fpLogE1pxTest_b <= mO_uid130_fpLogE1pxTest_q;
    xM1_uid131_fpLogE1pxTest_q <= "1" when xM1_uid131_fpLogE1pxTest_a = xM1_uid131_fpLogE1pxTest_b else "0";

	--ld_xM1_uid131_fpLogE1pxTest_q_to_excRInf0_uid134_fpLogE1pxTest_b(DELAY,786)@0
    ld_xM1_uid131_fpLogE1pxTest_q_to_excRInf0_uid134_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xM1_uid131_fpLogE1pxTest_q, xout => ld_xM1_uid131_fpLogE1pxTest_q_to_excRInf0_uid134_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--excRInf0_uid134_fpLogE1pxTest(LOGICAL,133)@1
    excRInf0_uid134_fpLogE1pxTest_a <= exc_R_uid30_fpLogE1pxTest_q;
    excRInf0_uid134_fpLogE1pxTest_b <= ld_xM1_uid131_fpLogE1pxTest_q_to_excRInf0_uid134_fpLogE1pxTest_b_q;
    excRInf0_uid134_fpLogE1pxTest_q_i <= excRInf0_uid134_fpLogE1pxTest_a and excRInf0_uid134_fpLogE1pxTest_b;
    excRInf0_uid134_fpLogE1pxTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => excRInf0_uid134_fpLogE1pxTest_q, xin => excRInf0_uid134_fpLogE1pxTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_branch11_uid64_fpLogE1pxTest_q_to_posInf_uid136_fpLogE1pxTest_a(DELAY,787)@0
    ld_branch11_uid64_fpLogE1pxTest_q_to_posInf_uid136_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => branch11_uid64_fpLogE1pxTest_q, xout => ld_branch11_uid64_fpLogE1pxTest_q_to_posInf_uid136_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--posInf_uid136_fpLogE1pxTest(LOGICAL,135)@1
    posInf_uid136_fpLogE1pxTest_a <= ld_branch11_uid64_fpLogE1pxTest_q_to_posInf_uid136_fpLogE1pxTest_a_q;
    posInf_uid136_fpLogE1pxTest_b <= exc_I_uid24_fpLogE1pxTest_q;
    posInf_uid136_fpLogE1pxTest_q_i <= posInf_uid136_fpLogE1pxTest_a and posInf_uid136_fpLogE1pxTest_b;
    posInf_uid136_fpLogE1pxTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => posInf_uid136_fpLogE1pxTest_q, xin => posInf_uid136_fpLogE1pxTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--excRInf0_uid137_fpLogE1pxTest(LOGICAL,136)@2
    excRInf0_uid137_fpLogE1pxTest_a <= posInf_uid136_fpLogE1pxTest_q;
    excRInf0_uid137_fpLogE1pxTest_b <= excRInf0_uid134_fpLogE1pxTest_q;
    excRInf0_uid137_fpLogE1pxTest_q <= excRInf0_uid137_fpLogE1pxTest_a or excRInf0_uid137_fpLogE1pxTest_b;

	--reg_expXIsZero_uid19_fpLogE1pxTest_0_to_concExc_uid143_fpLogE1pxTest_0(REG,492)@1
    reg_expXIsZero_uid19_fpLogE1pxTest_0_to_concExc_uid143_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXIsZero_uid19_fpLogE1pxTest_0_to_concExc_uid143_fpLogE1pxTest_0_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXIsZero_uid19_fpLogE1pxTest_0_to_concExc_uid143_fpLogE1pxTest_0_q <= ld_expXIsZero_uid19_fpLogE1pxTest_q_to_InvExpXIsZero_uid29_fpLogE1pxTest_a_q;
            END IF;
        END IF;
    END PROCESS;


	--concExc_uid143_fpLogE1pxTest(BITJOIN,142)@2
    concExc_uid143_fpLogE1pxTest_q <= excRNaN_uid140_fpLogE1pxTest_q & excRInf0_uid137_fpLogE1pxTest_q & reg_expXIsZero_uid19_fpLogE1pxTest_0_to_concExc_uid143_fpLogE1pxTest_0_q;

	--ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_inputreg(DELAY,1549)
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => concExc_uid143_fpLogE1pxTest_q, xout => ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt(COUNTER,1551)
    -- every=1, low=0, high=46, step=1, init=1
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_i = 45 THEN
                      ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_eq = '1') THEN
                        ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_i <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_i - 46;
                    ELSE
                        ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_i <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_i,6));


	--ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdreg(REG,1552)
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdreg_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdmux(MUX,1553)
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdmux_s <= en;
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdmux: PROCESS (ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdmux_s, ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdreg_q, ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdmux_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdreg_q;
                  WHEN "1" => ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdmux_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem(DUALMEM,1550)
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_ia <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_inputreg_q;
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_aa <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdreg_q;
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_ab <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_rdmux_q;
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 6,
        numwords_a => 47,
        width_b => 3,
        widthad_b => 6,
        numwords_b => 47,
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
        clocken1 => ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_iq,
        address_a => ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_aa,
        data_a => ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_ia
    );
    ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_reset0 <= areset;
        ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_iq(2 downto 0);

	--excREnc_uid144_fpLogE1pxTest(LOOKUP,143)@51
    excREnc_uid144_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid144_fpLogE1pxTest_q <= "01";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_concExc_uid143_fpLogE1pxTest_q_to_excREnc_uid144_fpLogE1pxTest_a_replace_mem_q) IS
                WHEN "000" =>  excREnc_uid144_fpLogE1pxTest_q <= "01";
                WHEN "001" =>  excREnc_uid144_fpLogE1pxTest_q <= "00";
                WHEN "010" =>  excREnc_uid144_fpLogE1pxTest_q <= "10";
                WHEN "011" =>  excREnc_uid144_fpLogE1pxTest_q <= "00";
                WHEN "100" =>  excREnc_uid144_fpLogE1pxTest_q <= "11";
                WHEN "101" =>  excREnc_uid144_fpLogE1pxTest_q <= "00";
                WHEN "110" =>  excREnc_uid144_fpLogE1pxTest_q <= "00";
                WHEN "111" =>  excREnc_uid144_fpLogE1pxTest_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid144_fpLogE1pxTest_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--expRPostExc_uid152_fpLogE1pxTest(MUX,151)@52
    expRPostExc_uid152_fpLogE1pxTest_s <= excREnc_uid144_fpLogE1pxTest_q;
    expRPostExc_uid152_fpLogE1pxTest: PROCESS (expRPostExc_uid152_fpLogE1pxTest_s, en, cstAllZWE_uid17_fpLogE1pxTest_q, expR_uid128_fpLogE1pxTest_q, cstAllOWE_uid15_fpLogE1pxTest_q, cstAllOWE_uid15_fpLogE1pxTest_q)
    BEGIN
            CASE expRPostExc_uid152_fpLogE1pxTest_s IS
                  WHEN "00" => expRPostExc_uid152_fpLogE1pxTest_q <= cstAllZWE_uid17_fpLogE1pxTest_q;
                  WHEN "01" => expRPostExc_uid152_fpLogE1pxTest_q <= expR_uid128_fpLogE1pxTest_q;
                  WHEN "10" => expRPostExc_uid152_fpLogE1pxTest_q <= cstAllOWE_uid15_fpLogE1pxTest_q;
                  WHEN "11" => expRPostExc_uid152_fpLogE1pxTest_q <= cstAllOWE_uid15_fpLogE1pxTest_q;
                  WHEN OTHERS => expRPostExc_uid152_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oneFracRPostExc2_uid145_fpLogE1pxTest(CONSTANT,144)
    oneFracRPostExc2_uid145_fpLogE1pxTest_q <= "0000000000000000000000000000000000000000000000000001";

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor(LOGICAL,1533)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_a <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_notEnable_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_b <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_q <= not (ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_a or ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_b);

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp(LOGICAL,1530)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_a <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_mem_top_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_q);
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_q <= "1" when ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_a = ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_b else "0";

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmpReg(REG,1531)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmpReg_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena(REG,1534)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_q = "1") THEN
                ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd(LOGICAL,1535)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_a <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_b <= en;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_a and ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_b;

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem(DUALMEM,1526)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_ia <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_inputreg_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_aa <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_ab <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 6,
        numwords_a => 49,
        width_b => 52,
        widthad_b => 6,
        numwords_b => 49,
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
        clocken1 => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_q(0),
        clocken0 => en(0),
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_iq,
        address_a => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_aa,
        data_a => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_ia
    );
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_reset0 <= areset;
        ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_iq(51 downto 0);

	--fracR0_uid125_fpLogE1pxTest(BITSELECT,124)@51
    fracR0_uid125_fpLogE1pxTest_in <= expFracPostRnd_uid124_fpLogE1pxTest_q(52 downto 0);
    fracR0_uid125_fpLogE1pxTest_b <= fracR0_uid125_fpLogE1pxTest_in(52 downto 1);

	--reg_fracR0_uid125_fpLogE1pxTest_0_to_fracR_uid126_fpLogE1pxTest_2(REG,650)@51
    reg_fracR0_uid125_fpLogE1pxTest_0_to_fracR_uid126_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracR0_uid125_fpLogE1pxTest_0_to_fracR_uid126_fpLogE1pxTest_2_q <= "0000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracR0_uid125_fpLogE1pxTest_0_to_fracR_uid126_fpLogE1pxTest_2_q <= fracR0_uid125_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracR_uid126_fpLogE1pxTest(MUX,125)@52
    fracR_uid126_fpLogE1pxTest_s <= ld_reg_resIsX_uid62_fpLogE1pxTest_1_to_fracR_uid126_fpLogE1pxTest_1_q_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_q;
    fracR_uid126_fpLogE1pxTest: PROCESS (fracR_uid126_fpLogE1pxTest_s, en, reg_fracR0_uid125_fpLogE1pxTest_0_to_fracR_uid126_fpLogE1pxTest_2_q, ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_q)
    BEGIN
            CASE fracR_uid126_fpLogE1pxTest_s IS
                  WHEN "0" => fracR_uid126_fpLogE1pxTest_q <= reg_fracR0_uid125_fpLogE1pxTest_0_to_fracR_uid126_fpLogE1pxTest_2_q;
                  WHEN "1" => fracR_uid126_fpLogE1pxTest_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_q;
                  WHEN OTHERS => fracR_uid126_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRPostExc_uid148_fpLogE1pxTest(MUX,147)@52
    fracRPostExc_uid148_fpLogE1pxTest_s <= excREnc_uid144_fpLogE1pxTest_q;
    fracRPostExc_uid148_fpLogE1pxTest: PROCESS (fracRPostExc_uid148_fpLogE1pxTest_s, en, cstAllZWF_uid8_fpLogE1pxTest_q, fracR_uid126_fpLogE1pxTest_q, cstAllZWF_uid8_fpLogE1pxTest_q, oneFracRPostExc2_uid145_fpLogE1pxTest_q)
    BEGIN
            CASE fracRPostExc_uid148_fpLogE1pxTest_s IS
                  WHEN "00" => fracRPostExc_uid148_fpLogE1pxTest_q <= cstAllZWF_uid8_fpLogE1pxTest_q;
                  WHEN "01" => fracRPostExc_uid148_fpLogE1pxTest_q <= fracR_uid126_fpLogE1pxTest_q;
                  WHEN "10" => fracRPostExc_uid148_fpLogE1pxTest_q <= cstAllZWF_uid8_fpLogE1pxTest_q;
                  WHEN "11" => fracRPostExc_uid148_fpLogE1pxTest_q <= oneFracRPostExc2_uid145_fpLogE1pxTest_q;
                  WHEN OTHERS => fracRPostExc_uid148_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RLn_uid153_fpLogE1pxTest(BITJOIN,152)@52
    RLn_uid153_fpLogE1pxTest_q <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_q & expRPostExc_uid152_fpLogE1pxTest_q & fracRPostExc_uid148_fpLogE1pxTest_q;

	--xOut(GPOUT,4)@52
    q <= RLn_uid153_fpLogE1pxTest_q;


end normal;
