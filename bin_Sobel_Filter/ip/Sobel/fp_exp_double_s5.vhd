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

-- VHDL created from fp_exp_double_s5
-- VHDL created on Thu Apr 11 10:14:45 2013


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

entity fp_exp_double_s5 is
    port (
        a : in std_logic_vector(63 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(63 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_exp_double_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstBias_uid8_fpExpETest_q : std_logic_vector (10 downto 0);
    signal cstZeroWE_uid11_fpExpETest_q : std_logic_vector (10 downto 0);
    signal cstZeroWEP1_uid12_fpExpETest_q : std_logic_vector (11 downto 0);
    signal cstBiasPWE_uid13_fpExpETest_q : std_logic_vector (10 downto 0);
    signal cstBiasPWE_uid14_fpExpETest_q : std_logic_vector (6 downto 0);
    signal cstAllOWE_uid15_fpExpETest_q : std_logic_vector (10 downto 0);
    signal cstAllZWF_uid16_fpExpETest_q : std_logic_vector (51 downto 0);
    signal exc_R_uid30_fpExpETest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid30_fpExpETest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid30_fpExpETest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid30_fpExpETest_q_i : std_logic_vector(0 downto 0);
    signal exc_R_uid30_fpExpETest_q : std_logic_vector(0 downto 0);
    signal zY_uid60_fpExpETest_q : std_logic_vector (54 downto 0);
    signal expRPostBiasPreExc0_uid69_fpExpETest_a : std_logic_vector(15 downto 0);
    signal expRPostBiasPreExc0_uid69_fpExpETest_b : std_logic_vector(15 downto 0);
    signal expRPostBiasPreExc0_uid69_fpExpETest_o : std_logic_vector (15 downto 0);
    signal expRPostBiasPreExc0_uid69_fpExpETest_q : std_logic_vector (14 downto 0);
    signal oneFracRPostExc2_uid90_fpExpETest_q : std_logic_vector (51 downto 0);
    signal p8_uid109_constMult_q : std_logic_vector(61 downto 0);
    signal p6_uid111_constMult_q : std_logic_vector(49 downto 0);
    signal p4_uid113_constMult_q : std_logic_vector(37 downto 0);
    signal p2_uid115_constMult_q : std_logic_vector(25 downto 0);
    signal lev1_a0_uid118_constMult_a : std_logic_vector(63 downto 0);
    signal lev1_a0_uid118_constMult_b : std_logic_vector(63 downto 0);
    signal lev1_a0_uid118_constMult_o : std_logic_vector (63 downto 0);
    signal lev1_a0_uid118_constMult_q : std_logic_vector (62 downto 0);
    signal lev1_a2_uid120_constMult_a : std_logic_vector(38 downto 0);
    signal lev1_a2_uid120_constMult_b : std_logic_vector(38 downto 0);
    signal lev1_a2_uid120_constMult_o : std_logic_vector (38 downto 0);
    signal lev1_a2_uid120_constMult_q : std_logic_vector (38 downto 0);
    signal lev2_a0_uid122_constMult_a : std_logic_vector(64 downto 0);
    signal lev2_a0_uid122_constMult_b : std_logic_vector(64 downto 0);
    signal lev2_a0_uid122_constMult_o : std_logic_vector (64 downto 0);
    signal lev2_a0_uid122_constMult_q : std_logic_vector (63 downto 0);
    signal lev3_a0_uid124_constMult_a : std_logic_vector(65 downto 0);
    signal lev3_a0_uid124_constMult_b : std_logic_vector(65 downto 0);
    signal lev3_a0_uid124_constMult_o : std_logic_vector (65 downto 0);
    signal lev3_a0_uid124_constMult_q : std_logic_vector (64 downto 0);
    signal z_uid129_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (31 downto 0);
    signal z_uid133_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (63 downto 0);
    signal rightShiftStage0Idx3_uid137_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (68 downto 0);
    signal rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest_a : std_logic_vector(68 downto 0);
    signal rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector(68 downto 0);
    signal rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest_q_i : std_logic_vector(68 downto 0);
    signal rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector(68 downto 0);
    signal z_uid141_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (7 downto 0);
    signal rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_a : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_q_i : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector(7 downto 0);
    signal z_uid145_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (15 downto 0);
    signal rightShiftStage1Idx2Pad16_uid146_fxpInPostAlign_uid45_fpExpETest_a : std_logic_vector(15 downto 0);
    signal rightShiftStage1Idx2Pad16_uid146_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector(15 downto 0);
    signal rightShiftStage1Idx2Pad16_uid146_fxpInPostAlign_uid45_fpExpETest_q_i : std_logic_vector(15 downto 0);
    signal rightShiftStage1Idx2Pad16_uid146_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector(15 downto 0);
    signal z_uid149_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx3Pad24_uid150_fxpInPostAlign_uid45_fpExpETest_a : std_logic_vector(23 downto 0);
    signal rightShiftStage1Idx3Pad24_uid150_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector(23 downto 0);
    signal rightShiftStage1Idx3Pad24_uid150_fxpInPostAlign_uid45_fpExpETest_q_i : std_logic_vector(23 downto 0);
    signal rightShiftStage1Idx3Pad24_uid150_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector(23 downto 0);
    signal z_uid155_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (1 downto 0);
    signal rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_a : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_q_i : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector(1 downto 0);
    signal z_uid159_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (3 downto 0);
    signal rightShiftStage2Idx2Pad4_uid160_fxpInPostAlign_uid45_fpExpETest_a : std_logic_vector(3 downto 0);
    signal rightShiftStage2Idx2Pad4_uid160_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector(3 downto 0);
    signal rightShiftStage2Idx2Pad4_uid160_fxpInPostAlign_uid45_fpExpETest_q_i : std_logic_vector(3 downto 0);
    signal rightShiftStage2Idx2Pad4_uid160_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector(3 downto 0);
    signal z_uid163_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (5 downto 0);
    signal rightShiftStage2Idx3Pad6_uid164_fxpInPostAlign_uid45_fpExpETest_a : std_logic_vector(5 downto 0);
    signal rightShiftStage2Idx3Pad6_uid164_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector(5 downto 0);
    signal rightShiftStage2Idx3Pad6_uid164_fxpInPostAlign_uid45_fpExpETest_q_i : std_logic_vector(5 downto 0);
    signal rightShiftStage2Idx3Pad6_uid164_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector(5 downto 0);
    signal rightShiftStage3Idx1Pad1_uid170_fxpInPostAlign_uid45_fpExpETest_a : std_logic_vector(0 downto 0);
    signal rightShiftStage3Idx1Pad1_uid170_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector(0 downto 0);
    signal rightShiftStage3Idx1Pad1_uid170_fxpInPostAlign_uid45_fpExpETest_q_i : std_logic_vector(0 downto 0);
    signal rightShiftStage3Idx1Pad1_uid170_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector(0 downto 0);
    signal p2_uid179_constMult_q : std_logic_vector(76 downto 0);
    signal lev1_a0_uid182_constMult_a : std_logic_vector(78 downto 0);
    signal lev1_a0_uid182_constMult_b : std_logic_vector(78 downto 0);
    signal lev1_a0_uid182_constMult_o : std_logic_vector (78 downto 0);
    signal lev1_a0_uid182_constMult_q : std_logic_vector (77 downto 0);
    signal rightShiftStage0Idx3_uid195_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector (65 downto 0);
    signal rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest_a : std_logic_vector(65 downto 0);
    signal rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector(65 downto 0);
    signal rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest_q_i : std_logic_vector(65 downto 0);
    signal rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector(65 downto 0);
    signal rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_a : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_q_i : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad16_uid204_fxpInPostAlign_X_uid56_fpExpETest_a : std_logic_vector(15 downto 0);
    signal rightShiftStage1Idx2Pad16_uid204_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector(15 downto 0);
    signal rightShiftStage1Idx2Pad16_uid204_fxpInPostAlign_X_uid56_fpExpETest_q_i : std_logic_vector(15 downto 0);
    signal rightShiftStage1Idx2Pad16_uid204_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector(15 downto 0);
    signal rightShiftStage1Idx3Pad24_uid208_fxpInPostAlign_X_uid56_fpExpETest_a : std_logic_vector(23 downto 0);
    signal rightShiftStage1Idx3Pad24_uid208_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector(23 downto 0);
    signal rightShiftStage1Idx3Pad24_uid208_fxpInPostAlign_X_uid56_fpExpETest_q_i : std_logic_vector(23 downto 0);
    signal rightShiftStage1Idx3Pad24_uid208_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector(23 downto 0);
    signal rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_a : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_q_i : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad4_uid218_fxpInPostAlign_X_uid56_fpExpETest_a : std_logic_vector(3 downto 0);
    signal rightShiftStage2Idx2Pad4_uid218_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector(3 downto 0);
    signal rightShiftStage2Idx2Pad4_uid218_fxpInPostAlign_X_uid56_fpExpETest_q_i : std_logic_vector(3 downto 0);
    signal rightShiftStage2Idx2Pad4_uid218_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector(3 downto 0);
    signal rightShiftStage2Idx3Pad6_uid222_fxpInPostAlign_X_uid56_fpExpETest_a : std_logic_vector(5 downto 0);
    signal rightShiftStage2Idx3Pad6_uid222_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector(5 downto 0);
    signal rightShiftStage2Idx3Pad6_uid222_fxpInPostAlign_X_uid56_fpExpETest_q_i : std_logic_vector(5 downto 0);
    signal rightShiftStage2Idx3Pad6_uid222_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector(5 downto 0);
    signal rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_a : std_logic_vector(0 downto 0);
    signal rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector(0 downto 0);
    signal rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_q_i : std_logic_vector(0 downto 0);
    signal rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector(0 downto 0);
    signal memoryC0_uid234_exp10TabGen_q : std_logic_vector(39 downto 0);
    signal memoryC0_uid235_exp10TabGen_q : std_logic_vector(17 downto 0);
    signal memoryC1_uid237_exp10TabGen_q : std_logic_vector(39 downto 0);
    signal memoryC1_uid238_exp10TabGen_q : std_logic_vector(10 downto 0);
    signal memoryC2_uid240_exp10TabGen_q : std_logic_vector(39 downto 0);
    signal memoryC2_uid241_exp10TabGen_q : std_logic_vector(2 downto 0);
    signal memoryC3_uid243_exp10TabGen_q : std_logic_vector(34 downto 0);
    signal memoryC4_uid245_exp10TabGen_q : std_logic_vector(24 downto 0);
    signal memoryC5_uid247_exp10TabGen_q : std_logic_vector(15 downto 0);
    signal rndBit_uid263_exp10PolyEval_q : std_logic_vector (1 downto 0);
    signal rndBit_uid275_exp10PolyEval_q : std_logic_vector (2 downto 0);
    signal prodXY_uid280_pT1_uid250_exp10PolyEval_a : std_logic_vector (15 downto 0);
    signal prodXY_uid280_pT1_uid250_exp10PolyEval_b : std_logic_vector (15 downto 0);
    signal prodXY_uid280_pT1_uid250_exp10PolyEval_s1 : std_logic_vector (31 downto 0);
    signal prodXY_uid280_pT1_uid250_exp10PolyEval_pr : SIGNED (32 downto 0);
    signal prodXY_uid280_pT1_uid250_exp10PolyEval_q : std_logic_vector (31 downto 0);
    signal prodXY_uid283_pT2_uid256_exp10PolyEval_a : std_logic_vector (24 downto 0);
    signal prodXY_uid283_pT2_uid256_exp10PolyEval_b : std_logic_vector (26 downto 0);
    signal prodXY_uid283_pT2_uid256_exp10PolyEval_s1 : std_logic_vector (51 downto 0);
    signal prodXY_uid283_pT2_uid256_exp10PolyEval_pr : SIGNED (52 downto 0);
    signal prodXY_uid283_pT2_uid256_exp10PolyEval_q : std_logic_vector (51 downto 0);
    signal topProd_uid288_pT3_uid262_exp10PolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid288_pT3_uid262_exp10PolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid288_pT3_uid262_exp10PolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid288_pT3_uid262_exp10PolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid288_pT3_uid262_exp10PolyEval_q : std_logic_vector (53 downto 0);
    signal topProd_uid305_pT4_uid268_exp10PolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid305_pT4_uid268_exp10PolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid305_pT4_uid268_exp10PolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid305_pT4_uid268_exp10PolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid305_pT4_uid268_exp10PolyEval_q : std_logic_vector (53 downto 0);
    signal topProd_uid320_pT5_uid274_exp10PolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid320_pT5_uid274_exp10PolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid320_pT5_uid274_exp10PolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid320_pT5_uid274_exp10PolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid320_pT5_uid274_exp10PolyEval_q : std_logic_vector (53 downto 0);
    signal sm0_uid332_pT5_uid274_exp10PolyEval_a : std_logic_vector (2 downto 0);
    signal sm0_uid332_pT5_uid274_exp10PolyEval_b : std_logic_vector (2 downto 0);
    signal sm0_uid332_pT5_uid274_exp10PolyEval_s1 : std_logic_vector (5 downto 0);
    signal sm0_uid332_pT5_uid274_exp10PolyEval_pr : UNSIGNED (5 downto 0);
    attribute multstyle : string;
    attribute multstyle of sm0_uid332_pT5_uid274_exp10PolyEval_pr: signal is "logic";
    signal sm0_uid332_pT5_uid274_exp10PolyEval_q : std_logic_vector (5 downto 0);
    type multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_a_type is array(0 to 1) of UNSIGNED(17 downto 0);
    signal multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_a : multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_a_type;
    attribute preserve : boolean;
    attribute preserve of multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_a : signal is true;
    type multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_c_type is array(0 to 1) of SIGNED(17 downto 0);
    signal multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_c : multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_c_type;
    attribute preserve of multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_c : signal is true;
    type multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_l_type is array(0 to 1) of SIGNED(18 downto 0);
    signal multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_l : multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_l_type;
    type multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_p_type is array(0 to 1) of SIGNED(36 downto 0);
    signal multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_p : multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_p_type;
    type multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_w_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_w : multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_w_type;
    type multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_x_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_x : multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_x_type;
    type multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_y_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_y : multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_y_type;
    type multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_s_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_s : multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_s_type;
    signal multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_s0 : std_logic_vector(36 downto 0);
    signal multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_q : std_logic_vector (36 downto 0);
    type multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_a_type is array(0 to 1) of UNSIGNED(26 downto 0);
    signal multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_a : multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_a_type;
    attribute preserve of multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_a : signal is true;
    type multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_c_type is array(0 to 1) of SIGNED(26 downto 0);
    signal multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_c : multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_c_type;
    attribute preserve of multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_c : signal is true;
    type multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_l_type is array(0 to 1) of SIGNED(27 downto 0);
    signal multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_l : multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_l_type;
    type multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_p_type is array(0 to 1) of SIGNED(54 downto 0);
    signal multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_p : multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_p_type;
    type multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_w_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_w : multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_w_type;
    type multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_x_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_x : multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_x_type;
    type multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_y_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_y : multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_y_type;
    type multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_s_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_s : multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_s_type;
    signal multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_s0 : std_logic_vector(54 downto 0);
    signal multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_q : std_logic_vector (54 downto 0);
    type multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_a_type is array(0 to 1) of UNSIGNED(26 downto 0);
    signal multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_a : multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_a_type;
    attribute preserve of multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_a : signal is true;
    type multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_c_type is array(0 to 1) of SIGNED(26 downto 0);
    signal multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_c : multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_c_type;
    attribute preserve of multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_c : signal is true;
    type multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_l_type is array(0 to 1) of SIGNED(27 downto 0);
    signal multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_l : multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_l_type;
    type multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_p_type is array(0 to 1) of SIGNED(54 downto 0);
    signal multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_p : multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_p_type;
    type multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_w_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_w : multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_w_type;
    type multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_x_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_x : multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_x_type;
    type multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_y_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_y : multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_y_type;
    type multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_s_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_s : multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_s_type;
    signal multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_s0 : std_logic_vector(54 downto 0);
    signal multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_q : std_logic_vector (54 downto 0);
    signal reg_shiftValuePreSat_uid40_fpExpETest_0_to_shiftUdf_uid42_fpExpETest_0_q : std_logic_vector (11 downto 0);
    signal reg_xv8_uid108_constMult_0_to_p8_uid109_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv7_uid107_constMult_0_to_p7_uid110_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv6_uid106_constMult_0_to_p6_uid111_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv5_uid105_constMult_0_to_p5_uid112_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv4_uid104_constMult_0_to_p4_uid113_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv3_uid103_constMult_0_to_p3_uid114_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv2_uid102_constMult_0_to_p2_uid115_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv1_uid101_constMult_0_to_p1_uid116_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv0_uid100_constMult_0_to_p0_uid117_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_1_q : std_logic_vector (1 downto 0);
    signal reg_oFracXZwE_uid39_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_2_q : std_logic_vector (68 downto 0);
    signal reg_rightShiftStage0Idx1_uid132_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_3_q : std_logic_vector (68 downto 0);
    signal reg_rightShiftStage0Idx2_uid136_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_4_q : std_logic_vector (68 downto 0);
    signal reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_2_q : std_logic_vector (68 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_2_q : std_logic_vector (68 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_1_q : std_logic_vector (0 downto 0);
    signal reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q : std_logic_vector (13 downto 0);
    signal reg_fxpInPreAlign_uid51_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_2_q : std_logic_vector (65 downto 0);
    signal reg_rightShiftStage0Idx1_uid190_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_3_q : std_logic_vector (65 downto 0);
    signal reg_rightShiftStage0Idx2_uid194_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_4_q : std_logic_vector (65 downto 0);
    signal reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_2_q : std_logic_vector (65 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_2_q : std_logic_vector (65 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_1_q : std_logic_vector (0 downto 0);
    signal reg_xv2_uid178_constMult_0_to_p2_uid179_constMult_0_q : std_logic_vector (1 downto 0);
    signal reg_xv1_uid177_constMult_0_to_p1_uid180_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv0_uid176_constMult_0_to_p0_uid181_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_pad_fxpInPostAlignR_X_uid57_uid57_fpExpETest_0_to_yExt_uid57_fpExpETest_0_q : std_logic_vector (73 downto 0);
    signal reg_sR_uid184_constMult_0_to_yExt_uid57_fpExpETest_1_q : std_logic_vector (74 downto 0);
    signal reg_YExt75_uid59_fpExpETest_0_to_yRedPostMux_uid62_fpExpETest_1_q : std_logic_vector (0 downto 0);
    signal reg_yRed_uid61_fpExpETest_0_to_yRedPostMux_uid62_fpExpETest_2_q : std_logic_vector (54 downto 0);
    signal reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_q : std_logic_vector (6 downto 0);
    signal reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q : std_logic_vector (6 downto 0);
    signal reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_q : std_logic_vector (6 downto 0);
    signal reg_yT1_uid249_exp10PolyEval_0_to_prodXY_uid280_pT1_uid250_exp10PolyEval_0_q : std_logic_vector (15 downto 0);
    signal reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_q : std_logic_vector (24 downto 0);
    signal reg_s1_uid251_uid254_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_1_q : std_logic_vector (26 downto 0);
    signal reg_xTop18Bits_uid289_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_4_q : std_logic_vector (17 downto 0);
    signal reg_pad_yBottomBits_uid290_uid295_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_6_q : std_logic_vector (17 downto 0);
    signal reg_pad_xBottomBits_uid291_uid294_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_7_q : std_logic_vector (16 downto 0);
    signal reg_yTop18Bits_uid292_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_9_q : std_logic_vector (17 downto 0);
    signal reg_xTop27Bits_uid286_pT3_uid262_exp10PolyEval_0_to_topProd_uid288_pT3_uid262_exp10PolyEval_0_q : std_logic_vector (26 downto 0);
    signal reg_yTop27Bits_uid287_pT3_uid262_exp10PolyEval_0_to_topProd_uid288_pT3_uid262_exp10PolyEval_1_q : std_logic_vector (26 downto 0);
    signal reg_cIncludingRoundingBit_uid264_exp10PolyEval_0_to_ts3_uid265_exp10PolyEval_0_q : std_logic_vector (44 downto 0);
    signal reg_R_uid302_pT3_uid262_exp10PolyEval_0_to_ts3_uid265_exp10PolyEval_1_q : std_logic_vector (36 downto 0);
    signal reg_xTop27Bits_uid303_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_4_q : std_logic_vector (26 downto 0);
    signal reg_pad_yBottomBits_uid306_uid310_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_6_q : std_logic_vector (26 downto 0);
    signal reg_pad_xBottomBits_uid307_uid309_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_7_q : std_logic_vector (25 downto 0);
    signal reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_9_q : std_logic_vector (26 downto 0);
    signal reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_topProd_uid305_pT4_uid268_exp10PolyEval_1_q : std_logic_vector (26 downto 0);
    signal reg_cIncludingRoundingBit_uid270_exp10PolyEval_0_to_ts4_uid271_exp10PolyEval_0_q : std_logic_vector (52 downto 0);
    signal reg_R_uid317_pT4_uid268_exp10PolyEval_0_to_ts4_uid271_exp10PolyEval_1_q : std_logic_vector (45 downto 0);
    signal reg_pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_4_q : std_logic_vector (26 downto 0);
    signal reg_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_6_q : std_logic_vector (26 downto 0);
    signal reg_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_7_q : std_logic_vector (25 downto 0);
    signal reg_yTop27Bits_uid319_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_9_q : std_logic_vector (26 downto 0);
    signal reg_sSM0H_uid330_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_0_q : std_logic_vector (2 downto 0);
    signal reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q : std_logic_vector (2 downto 0);
    signal reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_q : std_logic_vector (26 downto 0);
    signal reg_cIncludingRoundingBit_uid276_exp10PolyEval_0_to_ts5_uid277_exp10PolyEval_0_q : std_logic_vector (60 downto 0);
    signal reg_R_uid338_pT5_uid274_exp10PolyEval_0_to_ts5_uid277_exp10PolyEval_1_q : std_logic_vector (54 downto 0);
    signal reg_peORExpInc_uid68_fpExpETest_0_to_expRPostBiasPreExc_uid70_fpExpETest_1_q : std_logic_vector (0 downto 0);
    signal reg_expRPostBiasPreExc_uid70_fpExpETest_0_to_expUdf_uid72_fpExpETest_1_q : std_logic_vector (15 downto 0);
    signal reg_expOvfInitial_uid41_fpExpETest_0_to_regXAndExpOverflowAndNeg_uid77_fpExpETest_2_q : std_logic_vector (0 downto 0);
    signal reg_concExc_uid88_fpExpETest_0_to_excREnc_uid89_fpExpETest_0_q : std_logic_vector (2 downto 0);
    signal ld_shiftUdf_uid42_fpExpETest_n_to_shiftVal_uid44_fpExpETest_b_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpExpETest_b_to_onesCmpFxpIn_uid49_fpExpETest_b_q : std_logic_vector (0 downto 0);
    signal ld_yRedPostMux_uid62_fpExpETest_q_to_yPPolyEval_uid65_fpExpETest_a_q : std_logic_vector (54 downto 0);
    signal ld_signX_uid7_fpExpETest_b_to_regXAndExpOverflowAndNeg_uid77_fpExpETest_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid24_fpExpETest_q_to_posInf_uid86_fpExpETest_a_q : std_logic_vector (0 downto 0);
    signal ld_fracR_uid71_fpExpETest_b_to_fracRPostExc_uid93_fpExpETest_d_q : std_logic_vector (51 downto 0);
    signal ld_expR_uid75_fpExpETest_b_to_expRPostExc_uid97_fpExpETest_d_q : std_logic_vector (10 downto 0);
    signal ld_reg_xv7_uid107_constMult_0_to_p7_uid110_constMult_0_q_to_p7_uid110_constMult_a_q : std_logic_vector (5 downto 0);
    signal ld_reg_xv6_uid106_constMult_0_to_p6_uid111_constMult_0_q_to_p6_uid111_constMult_a_q : std_logic_vector (5 downto 0);
    signal ld_reg_xv4_uid104_constMult_0_to_p4_uid113_constMult_0_q_to_p4_uid113_constMult_a_q : std_logic_vector (5 downto 0);
    signal ld_reg_xv3_uid103_constMult_0_to_p3_uid114_constMult_0_q_to_p3_uid114_constMult_a_q : std_logic_vector (5 downto 0);
    signal ld_reg_xv0_uid100_constMult_0_to_p0_uid117_constMult_0_q_to_p0_uid117_constMult_a_q : std_logic_vector (5 downto 0);
    signal ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage068dto8_uid143_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1_uid144_fxpInPostAlign_uid45_fpExpETest_a_q : std_logic_vector (60 downto 0);
    signal ld_RightShiftStage068dto16_uid147_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx2_uid148_fxpInPostAlign_uid45_fpExpETest_a_q : std_logic_vector (52 downto 0);
    signal ld_RightShiftStage068dto24_uid151_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx3_uid152_fxpInPostAlign_uid45_fpExpETest_a_q : std_logic_vector (44 downto 0);
    signal ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage168dto2_uid157_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1_uid158_fxpInPostAlign_uid45_fpExpETest_a_q : std_logic_vector (66 downto 0);
    signal ld_RightShiftStage168dto4_uid161_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx2_uid162_fxpInPostAlign_uid45_fpExpETest_a_q : std_logic_vector (64 downto 0);
    signal ld_RightShiftStage168dto6_uid165_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx3_uid166_fxpInPostAlign_uid45_fpExpETest_a_q : std_logic_vector (62 downto 0);
    signal ld_reg_rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_b_q : std_logic_vector (1 downto 0);
    signal ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage065dto8_uid201_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1_uid202_fxpInPostAlign_X_uid56_fpExpETest_a_q : std_logic_vector (57 downto 0);
    signal ld_RightShiftStage065dto16_uid205_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx2_uid206_fxpInPostAlign_X_uid56_fpExpETest_a_q : std_logic_vector (49 downto 0);
    signal ld_RightShiftStage065dto24_uid209_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx3_uid210_fxpInPostAlign_X_uid56_fpExpETest_a_q : std_logic_vector (41 downto 0);
    signal ld_reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_b_q : std_logic_vector (1 downto 0);
    signal ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage165dto2_uid215_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1_uid216_fxpInPostAlign_X_uid56_fpExpETest_a_q : std_logic_vector (63 downto 0);
    signal ld_RightShiftStage165dto4_uid219_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx2_uid220_fxpInPostAlign_X_uid56_fpExpETest_a_q : std_logic_vector (61 downto 0);
    signal ld_RightShiftStage165dto6_uid223_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx3_uid224_fxpInPostAlign_X_uid56_fpExpETest_a_q : std_logic_vector (59 downto 0);
    signal ld_rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_q_to_rightShiftStage3Idx1_uid230_fxpInPostAlign_X_uid56_fpExpETest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC4_uid245_exp10TabGen_0_q_to_memoryC4_uid245_exp10TabGen_a_q : std_logic_vector (6 downto 0);
    signal ld_yT4_uid267_exp10PolyEval_b_to_xTop27Bits_uid303_pT4_uid268_exp10PolyEval_a_q : std_logic_vector (42 downto 0);
    signal ld_yBottomBits_uid306_pT4_uid268_exp10PolyEval_b_to_spad_yBottomBits_uid306_uid308_pT4_uid268_exp10PolyEval_a_q : std_logic_vector (17 downto 0);
    signal ld_yBottomBits_uid321_pT5_uid274_exp10PolyEval_b_to_pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval_b_q : std_logic_vector (25 downto 0);
    signal ld_TtopProdConcSoftProd_uid333_pT5_uid274_exp10PolyEval_q_to_sumAHighB_uid336_pT5_uid274_exp10PolyEval_a_q : std_logic_vector (59 downto 0);
    signal ld_xv5_uid105_constMult_b_to_reg_xv5_uid105_constMult_0_to_p5_uid112_constMult_0_a_q : std_logic_vector (5 downto 0);
    signal ld_xv2_uid102_constMult_b_to_reg_xv2_uid102_constMult_0_to_p2_uid115_constMult_0_a_q : std_logic_vector (5 downto 0);
    signal ld_xv1_uid101_constMult_b_to_reg_xv1_uid101_constMult_0_to_p1_uid116_constMult_0_a_q : std_logic_vector (5 downto 0);
    signal ld_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_1_a_q : std_logic_vector (0 downto 0);
    signal ld_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_xv1_uid177_constMult_b_to_reg_xv1_uid177_constMult_0_to_p1_uid180_constMult_0_a_q : std_logic_vector (5 downto 0);
    signal ld_xv0_uid176_constMult_b_to_reg_xv0_uid176_constMult_0_to_p0_uid181_constMult_0_a_q : std_logic_vector (5 downto 0);
    signal ld_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_b_to_reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_topProd_uid305_pT4_uid268_exp10PolyEval_1_a_q : std_logic_vector (26 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_inputreg_q : std_logic_vector (6 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_reset0 : std_logic;
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_eq : std_logic;
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_sticky_ena_q : signal is true;
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_inputreg_q : std_logic_vector (52 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_reset0 : std_logic;
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_ia : std_logic_vector (52 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_iq : std_logic_vector (52 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_q : std_logic_vector (52 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_eq : std_logic;
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_sticky_ena_q : signal is true;
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_inputreg_q : std_logic_vector (13 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_reset0 : std_logic;
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_ia : std_logic_vector (13 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_iq : std_logic_vector (13 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_q : std_logic_vector (13 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_sticky_ena_q : signal is true;
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_reset0 : std_logic;
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_eq : std_logic;
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_sticky_ena_q : signal is true;
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_reset0 : std_logic;
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_eq : std_logic;
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_sticky_ena_q : signal is true;
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_reset0 : std_logic;
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_sticky_ena_q : signal is true;
    signal ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_reset0 : std_logic;
    signal ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_sticky_ena_q : signal is true;
    signal ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_reset0 : std_logic;
    signal ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_sticky_ena_q : signal is true;
    signal ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_reset0 : std_logic;
    signal ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_sticky_ena_q : signal is true;
    signal ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_reset0 : std_logic;
    signal ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_sticky_ena_q : signal is true;
    signal ld_fracR_uid71_fpExpETest_b_to_fracRPostExc_uid93_fpExpETest_d_inputreg_q : std_logic_vector (51 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_inputreg_q : std_logic_vector (6 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_reset0 : std_logic;
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_sticky_ena_q : signal is true;
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_reset0 : std_logic;
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_sticky_ena_q : signal is true;
    signal ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_reset0 : std_logic;
    signal ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_sticky_ena_q : signal is true;
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_reset0 : std_logic;
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_sticky_ena_q : signal is true;
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_inputreg_q : std_logic_vector (47 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_ia : std_logic_vector (47 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_iq : std_logic_vector (47 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_q : std_logic_vector (47 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_sticky_ena_q : signal is true;
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_ia : std_logic_vector (47 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_iq : std_logic_vector (47 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_q : std_logic_vector (47 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_sticky_ena_q : signal is true;
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_ia : std_logic_vector (25 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_iq : std_logic_vector (25 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_q : std_logic_vector (25 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_sticky_ena_q : signal is true;
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_inputreg_q : std_logic_vector (20 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_reset0 : std_logic;
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_ia : std_logic_vector (20 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_iq : std_logic_vector (20 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_q : std_logic_vector (20 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_eq : std_logic;
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_sticky_ena_q : signal is true;
    signal ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_reset0 : std_logic;
    signal ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_sticky_ena_q : signal is true;
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_inputreg_q : std_logic_vector (6 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_reset0 : std_logic;
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_sticky_ena_q : signal is true;
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_reset0 : std_logic;
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_eq : std_logic;
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_sticky_ena_q : signal is true;
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_inputreg_q : std_logic_vector (24 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_ia : std_logic_vector (24 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_iq : std_logic_vector (24 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_q : std_logic_vector (24 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_sticky_ena_q : signal is true;
    signal ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_inputreg_q : std_logic_vector (26 downto 0);
    signal ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_ia : std_logic_vector (26 downto 0);
    signal ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_iq : std_logic_vector (26 downto 0);
    signal ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_q : std_logic_vector (26 downto 0);
    signal ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_sticky_ena_q : signal is true;
    signal shiftUdf_uid42_fpExpETest_a : std_logic_vector(14 downto 0);
    signal shiftUdf_uid42_fpExpETest_b : std_logic_vector(14 downto 0);
    signal shiftUdf_uid42_fpExpETest_o : std_logic_vector (14 downto 0);
    signal shiftUdf_uid42_fpExpETest_cin : std_logic_vector (0 downto 0);
    signal shiftUdf_uid42_fpExpETest_n : std_logic_vector (0 downto 0);
    signal expUdf_uid72_fpExpETest_a : std_logic_vector(18 downto 0);
    signal expUdf_uid72_fpExpETest_b : std_logic_vector(18 downto 0);
    signal expUdf_uid72_fpExpETest_o : std_logic_vector (18 downto 0);
    signal expUdf_uid72_fpExpETest_cin : std_logic_vector (0 downto 0);
    signal expUdf_uid72_fpExpETest_n : std_logic_vector (0 downto 0);
    signal expOvf_uid74_fpExpETest_a : std_logic_vector(18 downto 0);
    signal expOvf_uid74_fpExpETest_b : std_logic_vector(18 downto 0);
    signal expOvf_uid74_fpExpETest_o : std_logic_vector (18 downto 0);
    signal expOvf_uid74_fpExpETest_cin : std_logic_vector (0 downto 0);
    signal expOvf_uid74_fpExpETest_n : std_logic_vector (0 downto 0);
    signal spad_yBottomBits_uid306_uid308_pT4_uid268_exp10PolyEval_q : std_logic_vector (18 downto 0);
    signal pad_yBottomBits_uid306_uid310_pT4_uid268_exp10PolyEval_q : std_logic_vector (26 downto 0);
    signal spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_q : std_logic_vector (26 downto 0);
    signal pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_q : std_logic_vector (25 downto 0);
    signal pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval_q : std_logic_vector (26 downto 0);
    signal oFracXZwE_uid48_fpExpETest_q : std_logic_vector (65 downto 0);
    signal InvExpOvfInitial_uid78_fpExpETest_a : std_logic_vector(0 downto 0);
    signal InvExpOvfInitial_uid78_fpExpETest_q : std_logic_vector(0 downto 0);
    signal InvSignX_uid81_fpExpETest_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid81_fpExpETest_q : std_logic_vector(0 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal expX_uid6_fpExpETest_in : std_logic_vector (62 downto 0);
    signal expX_uid6_fpExpETest_b : std_logic_vector (10 downto 0);
    signal signX_uid7_fpExpETest_in : std_logic_vector (63 downto 0);
    signal signX_uid7_fpExpETest_b : std_logic_vector (0 downto 0);
    signal frac_uid22_fpExpETest_in : std_logic_vector (51 downto 0);
    signal frac_uid22_fpExpETest_b : std_logic_vector (51 downto 0);
    signal expXIsZero_uid19_fpExpETest_a : std_logic_vector(10 downto 0);
    signal expXIsZero_uid19_fpExpETest_b : std_logic_vector(10 downto 0);
    signal expXIsZero_uid19_fpExpETest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid21_fpExpETest_a : std_logic_vector(10 downto 0);
    signal expXIsMax_uid21_fpExpETest_b : std_logic_vector(10 downto 0);
    signal expXIsMax_uid21_fpExpETest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid23_fpExpETest_a : std_logic_vector(51 downto 0);
    signal fracXIsZero_uid23_fpExpETest_b : std_logic_vector(51 downto 0);
    signal fracXIsZero_uid23_fpExpETest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid24_fpExpETest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid24_fpExpETest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid24_fpExpETest_q : std_logic_vector(0 downto 0);
    signal shiftValuePreSat_uid40_fpExpETest_a : std_logic_vector(11 downto 0);
    signal shiftValuePreSat_uid40_fpExpETest_b : std_logic_vector(11 downto 0);
    signal shiftValuePreSat_uid40_fpExpETest_o : std_logic_vector (11 downto 0);
    signal shiftValuePreSat_uid40_fpExpETest_q : std_logic_vector (11 downto 0);
    signal shiftVal_uid44_fpExpETest_s : std_logic_vector (0 downto 0);
    signal shiftVal_uid44_fpExpETest_q : std_logic_vector (6 downto 0);
    signal onesCmpFxpIn_uid49_fpExpETest_a : std_logic_vector(65 downto 0);
    signal onesCmpFxpIn_uid49_fpExpETest_b : std_logic_vector(65 downto 0);
    signal onesCmpFxpIn_uid49_fpExpETest_q : std_logic_vector(65 downto 0);
    signal fxpInExt_uid50_fpExpETest_a : std_logic_vector(67 downto 0);
    signal fxpInExt_uid50_fpExpETest_b : std_logic_vector(67 downto 0);
    signal fxpInExt_uid50_fpExpETest_o : std_logic_vector (67 downto 0);
    signal fxpInExt_uid50_fpExpETest_q : std_logic_vector (66 downto 0);
    signal yExt_uid57_fpExpETest_a : std_logic_vector(75 downto 0);
    signal yExt_uid57_fpExpETest_b : std_logic_vector(75 downto 0);
    signal yExt_uid57_fpExpETest_o : std_logic_vector (75 downto 0);
    signal yExt_uid57_fpExpETest_q : std_logic_vector (75 downto 0);
    signal yRedPostMux_uid62_fpExpETest_s : std_logic_vector (0 downto 0);
    signal yRedPostMux_uid62_fpExpETest_q : std_logic_vector (54 downto 0);
    signal expRPostBiasPreExc_uid70_fpExpETest_a : std_logic_vector(16 downto 0);
    signal expRPostBiasPreExc_uid70_fpExpETest_b : std_logic_vector(16 downto 0);
    signal expRPostBiasPreExc_uid70_fpExpETest_o : std_logic_vector (16 downto 0);
    signal expRPostBiasPreExc_uid70_fpExpETest_q : std_logic_vector (15 downto 0);
    signal negInf_uid76_fpExpETest_a : std_logic_vector(0 downto 0);
    signal negInf_uid76_fpExpETest_b : std_logic_vector(0 downto 0);
    signal negInf_uid76_fpExpETest_q : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndNeg_uid77_fpExpETest_a : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndNeg_uid77_fpExpETest_b : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndNeg_uid77_fpExpETest_c : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndNeg_uid77_fpExpETest_q : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid79_fpExpETest_a : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid79_fpExpETest_b : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid79_fpExpETest_c : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid79_fpExpETest_q : std_logic_vector(0 downto 0);
    signal excRZero_uid80_fpExpETest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid80_fpExpETest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid80_fpExpETest_c : std_logic_vector(0 downto 0);
    signal excRZero_uid80_fpExpETest_q : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid82_fpExpETest_a : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid82_fpExpETest_b : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid82_fpExpETest_c : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid82_fpExpETest_q : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid84_fpExpETest_a : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid84_fpExpETest_b : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid84_fpExpETest_c : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid84_fpExpETest_q : std_logic_vector(0 downto 0);
    signal posInf_uid86_fpExpETest_a : std_logic_vector(0 downto 0);
    signal posInf_uid86_fpExpETest_b : std_logic_vector(0 downto 0);
    signal posInf_uid86_fpExpETest_q : std_logic_vector(0 downto 0);
    signal excRInf_uid87_fpExpETest_a : std_logic_vector(0 downto 0);
    signal excRInf_uid87_fpExpETest_b : std_logic_vector(0 downto 0);
    signal excRInf_uid87_fpExpETest_c : std_logic_vector(0 downto 0);
    signal excRInf_uid87_fpExpETest_q : std_logic_vector(0 downto 0);
    signal excREnc_uid89_fpExpETest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid93_fpExpETest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid93_fpExpETest_q : std_logic_vector (51 downto 0);
    signal expRPostExc_uid97_fpExpETest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid97_fpExpETest_q : std_logic_vector (10 downto 0);
    signal p7_uid110_constMult_q : std_logic_vector(55 downto 0);
    signal p5_uid112_constMult_q : std_logic_vector(43 downto 0);
    signal p3_uid114_constMult_q : std_logic_vector(31 downto 0);
    signal p1_uid116_constMult_q : std_logic_vector(19 downto 0);
    signal p0_uid117_constMult_q : std_logic_vector(13 downto 0);
    signal lev1_a1_uid119_constMult_a : std_logic_vector(50 downto 0);
    signal lev1_a1_uid119_constMult_b : std_logic_vector(50 downto 0);
    signal lev1_a1_uid119_constMult_o : std_logic_vector (50 downto 0);
    signal lev1_a1_uid119_constMult_q : std_logic_vector (50 downto 0);
    signal lev1_a3_uid121_constMult_a : std_logic_vector(26 downto 0);
    signal lev1_a3_uid121_constMult_b : std_logic_vector(26 downto 0);
    signal lev1_a3_uid121_constMult_o : std_logic_vector (26 downto 0);
    signal lev1_a3_uid121_constMult_q : std_logic_vector (26 downto 0);
    signal lev2_a1_uid123_constMult_a : std_logic_vector(39 downto 0);
    signal lev2_a1_uid123_constMult_b : std_logic_vector(39 downto 0);
    signal lev2_a1_uid123_constMult_o : std_logic_vector (39 downto 0);
    signal lev2_a1_uid123_constMult_q : std_logic_vector (39 downto 0);
    signal lev4_a0_uid125_constMult_a : std_logic_vector(66 downto 0);
    signal lev4_a0_uid125_constMult_b : std_logic_vector(66 downto 0);
    signal lev4_a0_uid125_constMult_o : std_logic_vector (66 downto 0);
    signal lev4_a0_uid125_constMult_q : std_logic_vector (65 downto 0);
    signal rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (68 downto 0);
    signal p1_uid180_constMult_q : std_logic_vector(74 downto 0);
    signal p0_uid181_constMult_q : std_logic_vector(68 downto 0);
    signal lev2_a0_uid183_constMult_a : std_logic_vector(79 downto 0);
    signal lev2_a0_uid183_constMult_b : std_logic_vector(79 downto 0);
    signal lev2_a0_uid183_constMult_o : std_logic_vector (79 downto 0);
    signal lev2_a0_uid183_constMult_q : std_logic_vector (78 downto 0);
    signal rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector (65 downto 0);
    signal ts3_uid265_exp10PolyEval_a : std_logic_vector(45 downto 0);
    signal ts3_uid265_exp10PolyEval_b : std_logic_vector(45 downto 0);
    signal ts3_uid265_exp10PolyEval_o : std_logic_vector (45 downto 0);
    signal ts3_uid265_exp10PolyEval_q : std_logic_vector (45 downto 0);
    signal ts4_uid271_exp10PolyEval_a : std_logic_vector(53 downto 0);
    signal ts4_uid271_exp10PolyEval_b : std_logic_vector(53 downto 0);
    signal ts4_uid271_exp10PolyEval_o : std_logic_vector (53 downto 0);
    signal ts4_uid271_exp10PolyEval_q : std_logic_vector (53 downto 0);
    signal ts5_uid277_exp10PolyEval_a : std_logic_vector(61 downto 0);
    signal ts5_uid277_exp10PolyEval_b : std_logic_vector(61 downto 0);
    signal ts5_uid277_exp10PolyEval_o : std_logic_vector (61 downto 0);
    signal ts5_uid277_exp10PolyEval_q : std_logic_vector (61 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal rightShiftStage1Idx1_uid144_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (68 downto 0);
    signal rightShiftStage1Idx2_uid148_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (68 downto 0);
    signal rightShiftStage1Idx3_uid152_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (68 downto 0);
    signal rightShiftStage2Idx1_uid158_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (68 downto 0);
    signal rightShiftStage2Idx2_uid162_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (68 downto 0);
    signal rightShiftStage2Idx3_uid166_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (68 downto 0);
    signal rightShiftStage1Idx1_uid202_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector (65 downto 0);
    signal rightShiftStage1Idx2_uid206_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector (65 downto 0);
    signal rightShiftStage1Idx3_uid210_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector (65 downto 0);
    signal rightShiftStage2Idx1_uid216_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector (65 downto 0);
    signal rightShiftStage2Idx2_uid220_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector (65 downto 0);
    signal rightShiftStage2Idx3_uid224_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector (65 downto 0);
    signal os_uid236_exp10TabGen_q : std_logic_vector (57 downto 0);
    signal os_uid239_exp10TabGen_q : std_logic_vector (50 downto 0);
    signal os_uid242_exp10TabGen_q : std_logic_vector (42 downto 0);
    signal cIncludingRoundingBit_uid264_exp10PolyEval_q : std_logic_vector (44 downto 0);
    signal cIncludingRoundingBit_uid270_exp10PolyEval_q : std_logic_vector (52 downto 0);
    signal cIncludingRoundingBit_uid276_exp10PolyEval_q : std_logic_vector (60 downto 0);
    signal prodXYTruncFR_uid281_pT1_uid250_exp10PolyEval_in : std_logic_vector (31 downto 0);
    signal prodXYTruncFR_uid281_pT1_uid250_exp10PolyEval_b : std_logic_vector (16 downto 0);
    signal prodXYTruncFR_uid284_pT2_uid256_exp10PolyEval_in : std_logic_vector (51 downto 0);
    signal prodXYTruncFR_uid284_pT2_uid256_exp10PolyEval_b : std_logic_vector (27 downto 0);
    signal TtopProdConcSoftProd_uid333_pT5_uid274_exp10PolyEval_q : std_logic_vector (59 downto 0);
    signal multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_in : std_logic_vector (36 downto 0);
    signal multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_b : std_logic_vector (29 downto 0);
    signal multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_in : std_logic_vector (54 downto 0);
    signal multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_b : std_logic_vector (46 downto 0);
    signal multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_in : std_logic_vector (54 downto 0);
    signal multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_b : std_logic_vector (53 downto 0);
    signal rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (68 downto 0);
    signal rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (68 downto 0);
    signal rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector (65 downto 0);
    signal rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector (65 downto 0);
    signal yPPolyEval_uid65_fpExpETest_in : std_logic_vector (47 downto 0);
    signal yPPolyEval_uid65_fpExpETest_b : std_logic_vector (47 downto 0);
    signal xTop27Bits_uid303_pT4_uid268_exp10PolyEval_in : std_logic_vector (42 downto 0);
    signal xTop27Bits_uid303_pT4_uid268_exp10PolyEval_b : std_logic_vector (26 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmp_a : std_logic_vector(2 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmp_b : std_logic_vector(2 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmp_a : std_logic_vector(6 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmp_b : std_logic_vector(6 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmp_a : std_logic_vector(6 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmp_b : std_logic_vector(6 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_nor_q : std_logic_vector(0 downto 0);
    signal concExc_uid88_fpExpETest_q : std_logic_vector (2 downto 0);
    signal ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_nor_q : std_logic_vector(0 downto 0);
    signal yT3_uid261_exp10PolyEval_in : std_logic_vector (47 downto 0);
    signal yT3_uid261_exp10PolyEval_b : std_logic_vector (34 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal yT4_uid267_exp10PolyEval_in : std_logic_vector (47 downto 0);
    signal yT4_uid267_exp10PolyEval_b : std_logic_vector (42 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal oFracX_uid32_uid32_fpExpETest_q : std_logic_vector (52 downto 0);
    signal InvExpXIsZero_uid29_fpExpETest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid29_fpExpETest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid25_fpExpETest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid25_fpExpETest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid28_fpExpETest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid28_fpExpETest_q : std_logic_vector(0 downto 0);
    signal expOvfInitial_uid41_fpExpETest_in : std_logic_vector (11 downto 0);
    signal expOvfInitial_uid41_fpExpETest_b : std_logic_vector (0 downto 0);
    signal shiftValuePreSatRed_uid43_fpExpETest_in : std_logic_vector (6 downto 0);
    signal shiftValuePreSatRed_uid43_fpExpETest_b : std_logic_vector (6 downto 0);
    signal rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_in : std_logic_vector (6 downto 0);
    signal rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector (0 downto 0);
    signal fxpInPreAlign_uid51_fpExpETest_in : std_logic_vector (65 downto 0);
    signal fxpInPreAlign_uid51_fpExpETest_b : std_logic_vector (65 downto 0);
    signal YExt75_uid59_fpExpETest_in : std_logic_vector (75 downto 0);
    signal YExt75_uid59_fpExpETest_b : std_logic_vector (0 downto 0);
    signal yRed_uid61_fpExpETest_in : std_logic_vector (60 downto 0);
    signal yRed_uid61_fpExpETest_b : std_logic_vector (54 downto 0);
    signal addr_uid64_fpExpETest_in : std_logic_vector (54 downto 0);
    signal addr_uid64_fpExpETest_b : std_logic_vector (6 downto 0);
    signal expR_uid75_fpExpETest_in : std_logic_vector (10 downto 0);
    signal expR_uid75_fpExpETest_b : std_logic_vector (10 downto 0);
    signal RExpE_uid98_fpExpETest_q : std_logic_vector (63 downto 0);
    signal sR_uid126_constMult_in : std_logic_vector (61 downto 0);
    signal sR_uid126_constMult_b : std_logic_vector (57 downto 0);
    signal RightShiftStage068dto8_uid143_fxpInPostAlign_uid45_fpExpETest_in : std_logic_vector (68 downto 0);
    signal RightShiftStage068dto8_uid143_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector (60 downto 0);
    signal RightShiftStage068dto16_uid147_fxpInPostAlign_uid45_fpExpETest_in : std_logic_vector (68 downto 0);
    signal RightShiftStage068dto16_uid147_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector (52 downto 0);
    signal RightShiftStage068dto24_uid151_fxpInPostAlign_uid45_fpExpETest_in : std_logic_vector (68 downto 0);
    signal RightShiftStage068dto24_uid151_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector (44 downto 0);
    signal sR_uid184_constMult_in : std_logic_vector (76 downto 0);
    signal sR_uid184_constMult_b : std_logic_vector (74 downto 0);
    signal RightShiftStage065dto8_uid201_fxpInPostAlign_X_uid56_fpExpETest_in : std_logic_vector (65 downto 0);
    signal RightShiftStage065dto8_uid201_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector (57 downto 0);
    signal RightShiftStage065dto16_uid205_fxpInPostAlign_X_uid56_fpExpETest_in : std_logic_vector (65 downto 0);
    signal RightShiftStage065dto16_uid205_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector (49 downto 0);
    signal RightShiftStage065dto24_uid209_fxpInPostAlign_X_uid56_fpExpETest_in : std_logic_vector (65 downto 0);
    signal RightShiftStage065dto24_uid209_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector (41 downto 0);
    signal s3_uid266_exp10PolyEval_in : std_logic_vector (45 downto 0);
    signal s3_uid266_exp10PolyEval_b : std_logic_vector (44 downto 0);
    signal s4_uid272_exp10PolyEval_in : std_logic_vector (53 downto 0);
    signal s4_uid272_exp10PolyEval_b : std_logic_vector (52 downto 0);
    signal s5_uid278_exp10PolyEval_in : std_logic_vector (61 downto 0);
    signal s5_uid278_exp10PolyEval_b : std_logic_vector (60 downto 0);
    signal lowRangeB_uid251_exp10PolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid251_exp10PolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid252_exp10PolyEval_in : std_logic_vector (16 downto 0);
    signal highBBits_uid252_exp10PolyEval_b : std_logic_vector (15 downto 0);
    signal lowRangeB_uid257_exp10PolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid257_exp10PolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid258_exp10PolyEval_in : std_logic_vector (27 downto 0);
    signal highBBits_uid258_exp10PolyEval_b : std_logic_vector (26 downto 0);
    signal lowRangeB_uid298_pT3_uid262_exp10PolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid298_pT3_uid262_exp10PolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid299_pT3_uid262_exp10PolyEval_in : std_logic_vector (29 downto 0);
    signal highBBits_uid299_pT3_uid262_exp10PolyEval_b : std_logic_vector (28 downto 0);
    signal lowRangeB_uid313_pT4_uid268_exp10PolyEval_in : std_logic_vector (17 downto 0);
    signal lowRangeB_uid313_pT4_uid268_exp10PolyEval_b : std_logic_vector (17 downto 0);
    signal highBBits_uid314_pT4_uid268_exp10PolyEval_in : std_logic_vector (46 downto 0);
    signal highBBits_uid314_pT4_uid268_exp10PolyEval_b : std_logic_vector (28 downto 0);
    signal lowRangeB_uid334_pT5_uid274_exp10PolyEval_in : std_logic_vector (18 downto 0);
    signal lowRangeB_uid334_pT5_uid274_exp10PolyEval_b : std_logic_vector (18 downto 0);
    signal highBBits_uid335_pT5_uid274_exp10PolyEval_in : std_logic_vector (53 downto 0);
    signal highBBits_uid335_pT5_uid274_exp10PolyEval_b : std_logic_vector (34 downto 0);
    signal RightShiftStage168dto2_uid157_fxpInPostAlign_uid45_fpExpETest_in : std_logic_vector (68 downto 0);
    signal RightShiftStage168dto2_uid157_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector (66 downto 0);
    signal RightShiftStage168dto4_uid161_fxpInPostAlign_uid45_fpExpETest_in : std_logic_vector (68 downto 0);
    signal RightShiftStage168dto4_uid161_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector (64 downto 0);
    signal RightShiftStage168dto6_uid165_fxpInPostAlign_uid45_fpExpETest_in : std_logic_vector (68 downto 0);
    signal RightShiftStage168dto6_uid165_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector (62 downto 0);
    signal RightShiftStage268dto1_uid171_fxpInPostAlign_uid45_fpExpETest_in : std_logic_vector (68 downto 0);
    signal RightShiftStage268dto1_uid171_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector (67 downto 0);
    signal RightShiftStage165dto2_uid215_fxpInPostAlign_X_uid56_fpExpETest_in : std_logic_vector (65 downto 0);
    signal RightShiftStage165dto2_uid215_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector (63 downto 0);
    signal RightShiftStage165dto4_uid219_fxpInPostAlign_X_uid56_fpExpETest_in : std_logic_vector (65 downto 0);
    signal RightShiftStage165dto4_uid219_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector (61 downto 0);
    signal RightShiftStage165dto6_uid223_fxpInPostAlign_X_uid56_fpExpETest_in : std_logic_vector (65 downto 0);
    signal RightShiftStage165dto6_uid223_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector (59 downto 0);
    signal RightShiftStage265dto1_uid229_fxpInPostAlign_X_uid56_fpExpETest_in : std_logic_vector (65 downto 0);
    signal RightShiftStage265dto1_uid229_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector (64 downto 0);
    signal yT1_uid249_exp10PolyEval_in : std_logic_vector (47 downto 0);
    signal yT1_uid249_exp10PolyEval_b : std_logic_vector (15 downto 0);
    signal yT2_uid255_exp10PolyEval_in : std_logic_vector (47 downto 0);
    signal yT2_uid255_exp10PolyEval_b : std_logic_vector (24 downto 0);
    signal xTop27Bits_uid318_pT5_uid274_exp10PolyEval_in : std_logic_vector (47 downto 0);
    signal xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b : std_logic_vector (26 downto 0);
    signal xBottomBits_uid322_pT5_uid274_exp10PolyEval_in : std_logic_vector (20 downto 0);
    signal xBottomBits_uid322_pT5_uid274_exp10PolyEval_b : std_logic_vector (20 downto 0);
    signal xTop26Bits_uid323_pT5_uid274_exp10PolyEval_in : std_logic_vector (47 downto 0);
    signal xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b : std_logic_vector (25 downto 0);
    signal sSM0W_uid331_pT5_uid274_exp10PolyEval_in : std_logic_vector (20 downto 0);
    signal sSM0W_uid331_pT5_uid274_exp10PolyEval_b : std_logic_vector (2 downto 0);
    signal xTop27Bits_uid286_pT3_uid262_exp10PolyEval_in : std_logic_vector (34 downto 0);
    signal xTop27Bits_uid286_pT3_uid262_exp10PolyEval_b : std_logic_vector (26 downto 0);
    signal xTop18Bits_uid289_pT3_uid262_exp10PolyEval_in : std_logic_vector (34 downto 0);
    signal xTop18Bits_uid289_pT3_uid262_exp10PolyEval_b : std_logic_vector (17 downto 0);
    signal xBottomBits_uid291_pT3_uid262_exp10PolyEval_in : std_logic_vector (7 downto 0);
    signal xBottomBits_uid291_pT3_uid262_exp10PolyEval_b : std_logic_vector (7 downto 0);
    signal xBottomBits_uid307_pT4_uid268_exp10PolyEval_in : std_logic_vector (15 downto 0);
    signal xBottomBits_uid307_pT4_uid268_exp10PolyEval_b : std_logic_vector (15 downto 0);
    signal oFracX_uid33_fpExpETest_q : std_logic_vector (53 downto 0);
    signal exc_N_uid26_fpExpETest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid26_fpExpETest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid26_fpExpETest_q : std_logic_vector(0 downto 0);
    signal msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_in : std_logic_vector (65 downto 0);
    signal msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector (0 downto 0);
    signal X65dto32_uid189_fxpInPostAlign_X_uid56_fpExpETest_in : std_logic_vector (65 downto 0);
    signal X65dto32_uid189_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector (33 downto 0);
    signal X65dto64_uid193_fxpInPostAlign_X_uid56_fpExpETest_in : std_logic_vector (65 downto 0);
    signal X65dto64_uid193_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector (1 downto 0);
    signal oFracXZwE_uid39_fpExpETest_q : std_logic_vector (68 downto 0);
    signal yTop27Bits_uid304_pT4_uid268_exp10PolyEval_in : std_logic_vector (44 downto 0);
    signal yTop27Bits_uid304_pT4_uid268_exp10PolyEval_b : std_logic_vector (26 downto 0);
    signal yBottomBits_uid306_pT4_uid268_exp10PolyEval_in : std_logic_vector (17 downto 0);
    signal yBottomBits_uid306_pT4_uid268_exp10PolyEval_b : std_logic_vector (17 downto 0);
    signal yTop27Bits_uid319_pT5_uid274_exp10PolyEval_in : std_logic_vector (52 downto 0);
    signal yTop27Bits_uid319_pT5_uid274_exp10PolyEval_b : std_logic_vector (26 downto 0);
    signal yBottomBits_uid321_pT5_uid274_exp10PolyEval_in : std_logic_vector (25 downto 0);
    signal yBottomBits_uid321_pT5_uid274_exp10PolyEval_b : std_logic_vector (25 downto 0);
    signal sSM0H_uid330_pT5_uid274_exp10PolyEval_in : std_logic_vector (25 downto 0);
    signal sSM0H_uid330_pT5_uid274_exp10PolyEval_b : std_logic_vector (2 downto 0);
    signal peOR_uid67_fpExpETest_in : std_logic_vector (57 downto 0);
    signal peOR_uid67_fpExpETest_b : std_logic_vector (52 downto 0);
    signal peORExpInc_uid68_fpExpETest_in : std_logic_vector (58 downto 0);
    signal peORExpInc_uid68_fpExpETest_b : std_logic_vector (0 downto 0);
    signal sumAHighB_uid253_exp10PolyEval_a : std_logic_vector(25 downto 0);
    signal sumAHighB_uid253_exp10PolyEval_b : std_logic_vector(25 downto 0);
    signal sumAHighB_uid253_exp10PolyEval_o : std_logic_vector (25 downto 0);
    signal sumAHighB_uid253_exp10PolyEval_q : std_logic_vector (25 downto 0);
    signal sumAHighB_uid259_exp10PolyEval_a : std_logic_vector(35 downto 0);
    signal sumAHighB_uid259_exp10PolyEval_b : std_logic_vector(35 downto 0);
    signal sumAHighB_uid259_exp10PolyEval_o : std_logic_vector (35 downto 0);
    signal sumAHighB_uid259_exp10PolyEval_q : std_logic_vector (35 downto 0);
    signal sumAHighB_uid300_pT3_uid262_exp10PolyEval_a : std_logic_vector(54 downto 0);
    signal sumAHighB_uid300_pT3_uid262_exp10PolyEval_b : std_logic_vector(54 downto 0);
    signal sumAHighB_uid300_pT3_uid262_exp10PolyEval_o : std_logic_vector (54 downto 0);
    signal sumAHighB_uid300_pT3_uid262_exp10PolyEval_q : std_logic_vector (54 downto 0);
    signal sumAHighB_uid315_pT4_uid268_exp10PolyEval_a : std_logic_vector(54 downto 0);
    signal sumAHighB_uid315_pT4_uid268_exp10PolyEval_b : std_logic_vector(54 downto 0);
    signal sumAHighB_uid315_pT4_uid268_exp10PolyEval_o : std_logic_vector (54 downto 0);
    signal sumAHighB_uid315_pT4_uid268_exp10PolyEval_q : std_logic_vector (54 downto 0);
    signal sumAHighB_uid336_pT5_uid274_exp10PolyEval_a : std_logic_vector(60 downto 0);
    signal sumAHighB_uid336_pT5_uid274_exp10PolyEval_b : std_logic_vector(60 downto 0);
    signal sumAHighB_uid336_pT5_uid274_exp10PolyEval_o : std_logic_vector (60 downto 0);
    signal sumAHighB_uid336_pT5_uid274_exp10PolyEval_q : std_logic_vector (60 downto 0);
    signal rightShiftStage3Idx1_uid172_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (68 downto 0);
    signal rightShiftStage3Idx1_uid230_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector (65 downto 0);
    signal pad_xBottomBits_uid291_uid294_pT3_uid262_exp10PolyEval_q : std_logic_vector (16 downto 0);
    signal pad_xBottomBits_uid307_uid309_pT4_uid268_exp10PolyEval_q : std_logic_vector (25 downto 0);
    signal onesCmpFxpInX_uid34_fpExpETest_a : std_logic_vector(53 downto 0);
    signal onesCmpFxpInX_uid34_fpExpETest_b : std_logic_vector(53 downto 0);
    signal onesCmpFxpInX_uid34_fpExpETest_q : std_logic_vector(53 downto 0);
    signal InvExc_N_uid27_fpExpETest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid27_fpExpETest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0Idx1Pad32_uid188_fxpInPostAlign_X_uid56_fpExpETest_a : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx1Pad32_uid188_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx1Pad32_uid188_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx2Pad64_uid192_fxpInPostAlign_X_uid56_fpExpETest_a : std_logic_vector(63 downto 0);
    signal rightShiftStage0Idx2Pad64_uid192_fxpInPostAlign_X_uid56_fpExpETest_b : std_logic_vector(63 downto 0);
    signal rightShiftStage0Idx2Pad64_uid192_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector(63 downto 0);
    signal rightShiftStage0Idx1_uid190_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector (65 downto 0);
    signal rightShiftStage0Idx2_uid194_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector (65 downto 0);
    signal msbx_uid128_fxpInPostAlign_uid45_fpExpETest_in : std_logic_vector (68 downto 0);
    signal msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector (0 downto 0);
    signal X68dto32_uid131_fxpInPostAlign_uid45_fpExpETest_in : std_logic_vector (68 downto 0);
    signal X68dto32_uid131_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector (36 downto 0);
    signal X68dto64_uid135_fxpInPostAlign_uid45_fpExpETest_in : std_logic_vector (68 downto 0);
    signal X68dto64_uid135_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector (4 downto 0);
    signal fracR_uid71_fpExpETest_in : std_logic_vector (51 downto 0);
    signal fracR_uid71_fpExpETest_b : std_logic_vector (51 downto 0);
    signal s1_uid251_uid254_exp10PolyEval_q : std_logic_vector (26 downto 0);
    signal s2_uid257_uid260_exp10PolyEval_q : std_logic_vector (36 downto 0);
    signal add0_uid298_uid301_pT3_uid262_exp10PolyEval_q : std_logic_vector (55 downto 0);
    signal add0_uid313_uid316_pT4_uid268_exp10PolyEval_q : std_logic_vector (72 downto 0);
    signal add0_uid334_uid337_pT5_uid274_exp10PolyEval_q : std_logic_vector (79 downto 0);
    signal rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_s : std_logic_vector (0 downto 0);
    signal rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (68 downto 0);
    signal rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_s : std_logic_vector (0 downto 0);
    signal rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_q : std_logic_vector (65 downto 0);
    signal fxpInExtX_uid35_fpExpETest_a : std_logic_vector(55 downto 0);
    signal fxpInExtX_uid35_fpExpETest_b : std_logic_vector(55 downto 0);
    signal fxpInExtX_uid35_fpExpETest_o : std_logic_vector (55 downto 0);
    signal fxpInExtX_uid35_fpExpETest_q : std_logic_vector (54 downto 0);
    signal rightShiftStage0Idx1Pad32_uid130_fxpInPostAlign_uid45_fpExpETest_a : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx1Pad32_uid130_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx1Pad32_uid130_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx2Pad64_uid134_fxpInPostAlign_uid45_fpExpETest_a : std_logic_vector(63 downto 0);
    signal rightShiftStage0Idx2Pad64_uid134_fxpInPostAlign_uid45_fpExpETest_b : std_logic_vector(63 downto 0);
    signal rightShiftStage0Idx2Pad64_uid134_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector(63 downto 0);
    signal rightShiftStage0Idx1_uid132_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (68 downto 0);
    signal rightShiftStage0Idx2_uid136_fxpInPostAlign_uid45_fpExpETest_q : std_logic_vector (68 downto 0);
    signal yTop27Bits_uid287_pT3_uid262_exp10PolyEval_in : std_logic_vector (36 downto 0);
    signal yTop27Bits_uid287_pT3_uid262_exp10PolyEval_b : std_logic_vector (26 downto 0);
    signal yBottomBits_uid290_pT3_uid262_exp10PolyEval_in : std_logic_vector (9 downto 0);
    signal yBottomBits_uid290_pT3_uid262_exp10PolyEval_b : std_logic_vector (9 downto 0);
    signal yTop18Bits_uid292_pT3_uid262_exp10PolyEval_in : std_logic_vector (36 downto 0);
    signal yTop18Bits_uid292_pT3_uid262_exp10PolyEval_b : std_logic_vector (17 downto 0);
    signal R_uid302_pT3_uid262_exp10PolyEval_in : std_logic_vector (54 downto 0);
    signal R_uid302_pT3_uid262_exp10PolyEval_b : std_logic_vector (36 downto 0);
    signal R_uid317_pT4_uid268_exp10PolyEval_in : std_logic_vector (71 downto 0);
    signal R_uid317_pT4_uid268_exp10PolyEval_b : std_logic_vector (45 downto 0);
    signal R_uid338_pT5_uid274_exp10PolyEval_in : std_logic_vector (78 downto 0);
    signal R_uid338_pT5_uid274_exp10PolyEval_b : std_logic_vector (54 downto 0);
    signal ePreRnd_uid46_fpExpETest_in : std_logic_vector (68 downto 0);
    signal ePreRnd_uid46_fpExpETest_b : std_logic_vector (13 downto 0);
    signal pad_fxpInPostAlignR_X_uid57_uid57_fpExpETest_q : std_logic_vector (73 downto 0);
    signal fxpInPreAlign_uid36_fpExpETest_in : std_logic_vector (53 downto 0);
    signal fxpInPreAlign_uid36_fpExpETest_b : std_logic_vector (53 downto 0);
    signal spad_yBottomBits_uid290_uid293_pT3_uid262_exp10PolyEval_q : std_logic_vector (10 downto 0);
    signal xv0_uid176_constMult_in : std_logic_vector (5 downto 0);
    signal xv0_uid176_constMult_b : std_logic_vector (5 downto 0);
    signal xv1_uid177_constMult_in : std_logic_vector (11 downto 0);
    signal xv1_uid177_constMult_b : std_logic_vector (5 downto 0);
    signal xv2_uid178_constMult_in : std_logic_vector (13 downto 0);
    signal xv2_uid178_constMult_b : std_logic_vector (1 downto 0);
    signal xv0_uid100_constMult_in : std_logic_vector (5 downto 0);
    signal xv0_uid100_constMult_b : std_logic_vector (5 downto 0);
    signal xv1_uid101_constMult_in : std_logic_vector (11 downto 0);
    signal xv1_uid101_constMult_b : std_logic_vector (5 downto 0);
    signal xv2_uid102_constMult_in : std_logic_vector (17 downto 0);
    signal xv2_uid102_constMult_b : std_logic_vector (5 downto 0);
    signal xv3_uid103_constMult_in : std_logic_vector (23 downto 0);
    signal xv3_uid103_constMult_b : std_logic_vector (5 downto 0);
    signal xv4_uid104_constMult_in : std_logic_vector (29 downto 0);
    signal xv4_uid104_constMult_b : std_logic_vector (5 downto 0);
    signal xv5_uid105_constMult_in : std_logic_vector (35 downto 0);
    signal xv5_uid105_constMult_b : std_logic_vector (5 downto 0);
    signal xv6_uid106_constMult_in : std_logic_vector (41 downto 0);
    signal xv6_uid106_constMult_b : std_logic_vector (5 downto 0);
    signal xv7_uid107_constMult_in : std_logic_vector (47 downto 0);
    signal xv7_uid107_constMult_b : std_logic_vector (5 downto 0);
    signal xv8_uid108_constMult_in : std_logic_vector (53 downto 0);
    signal xv8_uid108_constMult_b : std_logic_vector (5 downto 0);
    signal pad_yBottomBits_uid290_uid295_pT3_uid262_exp10PolyEval_q : std_logic_vector (17 downto 0);
begin


	--GND(CONSTANT,0)
    GND_q <= "0";

	--cstAllOWE_uid15_fpExpETest(CONSTANT,14)
    cstAllOWE_uid15_fpExpETest_q <= "11111111111";

	--zY_uid60_fpExpETest(CONSTANT,59)
    zY_uid60_fpExpETest_q <= "0000000000000000000000000000000000000000000000000000000";

	--signX_uid7_fpExpETest(BITSELECT,6)@0
    signX_uid7_fpExpETest_in <= a;
    signX_uid7_fpExpETest_b <= signX_uid7_fpExpETest_in(63 downto 63);

	--frac_uid22_fpExpETest(BITSELECT,21)@0
    frac_uid22_fpExpETest_in <= a(51 downto 0);
    frac_uid22_fpExpETest_b <= frac_uid22_fpExpETest_in(51 downto 0);

	--oFracX_uid32_uid32_fpExpETest(BITJOIN,31)@0
    oFracX_uid32_uid32_fpExpETest_q <= VCC_q & frac_uid22_fpExpETest_b;

	--oFracX_uid33_fpExpETest(BITJOIN,32)@0
    oFracX_uid33_fpExpETest_q <= GND_q & oFracX_uid32_uid32_fpExpETest_q;

	--onesCmpFxpInX_uid34_fpExpETest(LOGICAL,33)@0
    onesCmpFxpInX_uid34_fpExpETest_a <= oFracX_uid33_fpExpETest_q;
    onesCmpFxpInX_uid34_fpExpETest_b <= STD_LOGIC_VECTOR((53 downto 1 => signX_uid7_fpExpETest_b(0)) & signX_uid7_fpExpETest_b);
    onesCmpFxpInX_uid34_fpExpETest_q <= onesCmpFxpInX_uid34_fpExpETest_a xor onesCmpFxpInX_uid34_fpExpETest_b;

	--fxpInExtX_uid35_fpExpETest(ADD,34)@0
    fxpInExtX_uid35_fpExpETest_a <= STD_LOGIC_VECTOR((55 downto 54 => onesCmpFxpInX_uid34_fpExpETest_q(53)) & onesCmpFxpInX_uid34_fpExpETest_q);
    fxpInExtX_uid35_fpExpETest_b <= STD_LOGIC_VECTOR('0' & "000000000000000000000000000000000000000000000000000000" & signX_uid7_fpExpETest_b);
            fxpInExtX_uid35_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(fxpInExtX_uid35_fpExpETest_a) + SIGNED(fxpInExtX_uid35_fpExpETest_b));
    fxpInExtX_uid35_fpExpETest_q <= fxpInExtX_uid35_fpExpETest_o(54 downto 0);


	--fxpInPreAlign_uid36_fpExpETest(BITSELECT,35)@0
    fxpInPreAlign_uid36_fpExpETest_in <= fxpInExtX_uid35_fpExpETest_q(53 downto 0);
    fxpInPreAlign_uid36_fpExpETest_b <= fxpInPreAlign_uid36_fpExpETest_in(53 downto 0);

	--xv0_uid100_constMult(BITSELECT,99)@0
    xv0_uid100_constMult_in <= fxpInPreAlign_uid36_fpExpETest_b(5 downto 0);
    xv0_uid100_constMult_b <= xv0_uid100_constMult_in(5 downto 0);

	--reg_xv0_uid100_constMult_0_to_p0_uid117_constMult_0(REG,350)@0
    reg_xv0_uid100_constMult_0_to_p0_uid117_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv0_uid100_constMult_0_to_p0_uid117_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv0_uid100_constMult_0_to_p0_uid117_constMult_0_q <= xv0_uid100_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xv0_uid100_constMult_0_to_p0_uid117_constMult_0_q_to_p0_uid117_constMult_a(DELAY,529)@1
    ld_reg_xv0_uid100_constMult_0_to_p0_uid117_constMult_0_q_to_p0_uid117_constMult_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 4 )
    PORT MAP ( xin => reg_xv0_uid100_constMult_0_to_p0_uid117_constMult_0_q, xout => ld_reg_xv0_uid100_constMult_0_to_p0_uid117_constMult_0_q_to_p0_uid117_constMult_a_q, ena => en(0), clk => clk, aclr => areset );

	--p0_uid117_constMult(LOOKUP,116)@5
    p0_uid117_constMult: PROCESS (ld_reg_xv0_uid100_constMult_0_to_p0_uid117_constMult_0_q_to_p0_uid117_constMult_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_xv0_uid100_constMult_0_to_p0_uid117_constMult_0_q_to_p0_uid117_constMult_a_q) IS
                WHEN "000000" =>  p0_uid117_constMult_q <= "00000000000000";
                WHEN "000001" =>  p0_uid117_constMult_q <= "00000010111001";
                WHEN "000010" =>  p0_uid117_constMult_q <= "00000101110001";
                WHEN "000011" =>  p0_uid117_constMult_q <= "00001000101010";
                WHEN "000100" =>  p0_uid117_constMult_q <= "00001011100011";
                WHEN "000101" =>  p0_uid117_constMult_q <= "00001110011011";
                WHEN "000110" =>  p0_uid117_constMult_q <= "00010001010100";
                WHEN "000111" =>  p0_uid117_constMult_q <= "00010100001101";
                WHEN "001000" =>  p0_uid117_constMult_q <= "00010111000101";
                WHEN "001001" =>  p0_uid117_constMult_q <= "00011001111110";
                WHEN "001010" =>  p0_uid117_constMult_q <= "00011100110111";
                WHEN "001011" =>  p0_uid117_constMult_q <= "00011111101111";
                WHEN "001100" =>  p0_uid117_constMult_q <= "00100010101000";
                WHEN "001101" =>  p0_uid117_constMult_q <= "00100101100001";
                WHEN "001110" =>  p0_uid117_constMult_q <= "00101000011001";
                WHEN "001111" =>  p0_uid117_constMult_q <= "00101011010010";
                WHEN "010000" =>  p0_uid117_constMult_q <= "00101110001011";
                WHEN "010001" =>  p0_uid117_constMult_q <= "00110001000011";
                WHEN "010010" =>  p0_uid117_constMult_q <= "00110011111100";
                WHEN "010011" =>  p0_uid117_constMult_q <= "00110110110101";
                WHEN "010100" =>  p0_uid117_constMult_q <= "00111001101101";
                WHEN "010101" =>  p0_uid117_constMult_q <= "00111100100110";
                WHEN "010110" =>  p0_uid117_constMult_q <= "00111111011111";
                WHEN "010111" =>  p0_uid117_constMult_q <= "01000010010111";
                WHEN "011000" =>  p0_uid117_constMult_q <= "01000101010000";
                WHEN "011001" =>  p0_uid117_constMult_q <= "01001000001001";
                WHEN "011010" =>  p0_uid117_constMult_q <= "01001011000001";
                WHEN "011011" =>  p0_uid117_constMult_q <= "01001101111010";
                WHEN "011100" =>  p0_uid117_constMult_q <= "01010000110011";
                WHEN "011101" =>  p0_uid117_constMult_q <= "01010011101011";
                WHEN "011110" =>  p0_uid117_constMult_q <= "01010110100100";
                WHEN "011111" =>  p0_uid117_constMult_q <= "01011001011101";
                WHEN "100000" =>  p0_uid117_constMult_q <= "01011100010101";
                WHEN "100001" =>  p0_uid117_constMult_q <= "01011111001110";
                WHEN "100010" =>  p0_uid117_constMult_q <= "01100010000111";
                WHEN "100011" =>  p0_uid117_constMult_q <= "01100100111111";
                WHEN "100100" =>  p0_uid117_constMult_q <= "01100111111000";
                WHEN "100101" =>  p0_uid117_constMult_q <= "01101010110001";
                WHEN "100110" =>  p0_uid117_constMult_q <= "01101101101001";
                WHEN "100111" =>  p0_uid117_constMult_q <= "01110000100010";
                WHEN "101000" =>  p0_uid117_constMult_q <= "01110011011011";
                WHEN "101001" =>  p0_uid117_constMult_q <= "01110110010011";
                WHEN "101010" =>  p0_uid117_constMult_q <= "01111001001100";
                WHEN "101011" =>  p0_uid117_constMult_q <= "01111100000101";
                WHEN "101100" =>  p0_uid117_constMult_q <= "01111110111101";
                WHEN "101101" =>  p0_uid117_constMult_q <= "10000001110110";
                WHEN "101110" =>  p0_uid117_constMult_q <= "10000100101111";
                WHEN "101111" =>  p0_uid117_constMult_q <= "10000111100111";
                WHEN "110000" =>  p0_uid117_constMult_q <= "10001010100000";
                WHEN "110001" =>  p0_uid117_constMult_q <= "10001101011001";
                WHEN "110010" =>  p0_uid117_constMult_q <= "10010000010001";
                WHEN "110011" =>  p0_uid117_constMult_q <= "10010011001010";
                WHEN "110100" =>  p0_uid117_constMult_q <= "10010110000011";
                WHEN "110101" =>  p0_uid117_constMult_q <= "10011000111011";
                WHEN "110110" =>  p0_uid117_constMult_q <= "10011011110100";
                WHEN "110111" =>  p0_uid117_constMult_q <= "10011110101101";
                WHEN "111000" =>  p0_uid117_constMult_q <= "10100001100101";
                WHEN "111001" =>  p0_uid117_constMult_q <= "10100100011110";
                WHEN "111010" =>  p0_uid117_constMult_q <= "10100111010111";
                WHEN "111011" =>  p0_uid117_constMult_q <= "10101010001111";
                WHEN "111100" =>  p0_uid117_constMult_q <= "10101101001000";
                WHEN "111101" =>  p0_uid117_constMult_q <= "10110000000001";
                WHEN "111110" =>  p0_uid117_constMult_q <= "10110010111001";
                WHEN "111111" =>  p0_uid117_constMult_q <= "10110101110010";
                WHEN OTHERS =>
                    p0_uid117_constMult_q <= "00000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv1_uid101_constMult(BITSELECT,100)@0
    xv1_uid101_constMult_in <= fxpInPreAlign_uid36_fpExpETest_b(11 downto 0);
    xv1_uid101_constMult_b <= xv1_uid101_constMult_in(11 downto 6);

	--ld_xv1_uid101_constMult_b_to_reg_xv1_uid101_constMult_0_to_p1_uid116_constMult_0_a(DELAY,803)@0
    ld_xv1_uid101_constMult_b_to_reg_xv1_uid101_constMult_0_to_p1_uid116_constMult_0_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 3 )
    PORT MAP ( xin => xv1_uid101_constMult_b, xout => ld_xv1_uid101_constMult_b_to_reg_xv1_uid101_constMult_0_to_p1_uid116_constMult_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_xv1_uid101_constMult_0_to_p1_uid116_constMult_0(REG,349)@3
    reg_xv1_uid101_constMult_0_to_p1_uid116_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv1_uid101_constMult_0_to_p1_uid116_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv1_uid101_constMult_0_to_p1_uid116_constMult_0_q <= ld_xv1_uid101_constMult_b_to_reg_xv1_uid101_constMult_0_to_p1_uid116_constMult_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--p1_uid116_constMult(LOOKUP,115)@4
    p1_uid116_constMult: PROCESS (reg_xv1_uid101_constMult_0_to_p1_uid116_constMult_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_xv1_uid101_constMult_0_to_p1_uid116_constMult_0_q) IS
                WHEN "000000" =>  p1_uid116_constMult_q <= "00000000000000000000";
                WHEN "000001" =>  p1_uid116_constMult_q <= "00000010111000101011";
                WHEN "000010" =>  p1_uid116_constMult_q <= "00000101110001010101";
                WHEN "000011" =>  p1_uid116_constMult_q <= "00001000101010000000";
                WHEN "000100" =>  p1_uid116_constMult_q <= "00001011100010101010";
                WHEN "000101" =>  p1_uid116_constMult_q <= "00001110011011010101";
                WHEN "000110" =>  p1_uid116_constMult_q <= "00010001010011111111";
                WHEN "000111" =>  p1_uid116_constMult_q <= "00010100001100101010";
                WHEN "001000" =>  p1_uid116_constMult_q <= "00010111000101010100";
                WHEN "001001" =>  p1_uid116_constMult_q <= "00011001111101111111";
                WHEN "001010" =>  p1_uid116_constMult_q <= "00011100110110101010";
                WHEN "001011" =>  p1_uid116_constMult_q <= "00011111101111010100";
                WHEN "001100" =>  p1_uid116_constMult_q <= "00100010100111111111";
                WHEN "001101" =>  p1_uid116_constMult_q <= "00100101100000101001";
                WHEN "001110" =>  p1_uid116_constMult_q <= "00101000011001010100";
                WHEN "001111" =>  p1_uid116_constMult_q <= "00101011010001111110";
                WHEN "010000" =>  p1_uid116_constMult_q <= "00101110001010101001";
                WHEN "010001" =>  p1_uid116_constMult_q <= "00110001000011010011";
                WHEN "010010" =>  p1_uid116_constMult_q <= "00110011111011111110";
                WHEN "010011" =>  p1_uid116_constMult_q <= "00110110110100101001";
                WHEN "010100" =>  p1_uid116_constMult_q <= "00111001101101010011";
                WHEN "010101" =>  p1_uid116_constMult_q <= "00111100100101111110";
                WHEN "010110" =>  p1_uid116_constMult_q <= "00111111011110101000";
                WHEN "010111" =>  p1_uid116_constMult_q <= "01000010010111010011";
                WHEN "011000" =>  p1_uid116_constMult_q <= "01000101001111111101";
                WHEN "011001" =>  p1_uid116_constMult_q <= "01001000001000101000";
                WHEN "011010" =>  p1_uid116_constMult_q <= "01001011000001010011";
                WHEN "011011" =>  p1_uid116_constMult_q <= "01001101111001111101";
                WHEN "011100" =>  p1_uid116_constMult_q <= "01010000110010101000";
                WHEN "011101" =>  p1_uid116_constMult_q <= "01010011101011010010";
                WHEN "011110" =>  p1_uid116_constMult_q <= "01010110100011111101";
                WHEN "011111" =>  p1_uid116_constMult_q <= "01011001011100100111";
                WHEN "100000" =>  p1_uid116_constMult_q <= "01011100010101010010";
                WHEN "100001" =>  p1_uid116_constMult_q <= "01011111001101111100";
                WHEN "100010" =>  p1_uid116_constMult_q <= "01100010000110100111";
                WHEN "100011" =>  p1_uid116_constMult_q <= "01100100111111010010";
                WHEN "100100" =>  p1_uid116_constMult_q <= "01100111110111111100";
                WHEN "100101" =>  p1_uid116_constMult_q <= "01101010110000100111";
                WHEN "100110" =>  p1_uid116_constMult_q <= "01101101101001010001";
                WHEN "100111" =>  p1_uid116_constMult_q <= "01110000100001111100";
                WHEN "101000" =>  p1_uid116_constMult_q <= "01110011011010100110";
                WHEN "101001" =>  p1_uid116_constMult_q <= "01110110010011010001";
                WHEN "101010" =>  p1_uid116_constMult_q <= "01111001001011111011";
                WHEN "101011" =>  p1_uid116_constMult_q <= "01111100000100100110";
                WHEN "101100" =>  p1_uid116_constMult_q <= "01111110111101010001";
                WHEN "101101" =>  p1_uid116_constMult_q <= "10000001110101111011";
                WHEN "101110" =>  p1_uid116_constMult_q <= "10000100101110100110";
                WHEN "101111" =>  p1_uid116_constMult_q <= "10000111100111010000";
                WHEN "110000" =>  p1_uid116_constMult_q <= "10001010011111111011";
                WHEN "110001" =>  p1_uid116_constMult_q <= "10001101011000100101";
                WHEN "110010" =>  p1_uid116_constMult_q <= "10010000010001010000";
                WHEN "110011" =>  p1_uid116_constMult_q <= "10010011001001111010";
                WHEN "110100" =>  p1_uid116_constMult_q <= "10010110000010100101";
                WHEN "110101" =>  p1_uid116_constMult_q <= "10011000111011010000";
                WHEN "110110" =>  p1_uid116_constMult_q <= "10011011110011111010";
                WHEN "110111" =>  p1_uid116_constMult_q <= "10011110101100100101";
                WHEN "111000" =>  p1_uid116_constMult_q <= "10100001100101001111";
                WHEN "111001" =>  p1_uid116_constMult_q <= "10100100011101111010";
                WHEN "111010" =>  p1_uid116_constMult_q <= "10100111010110100100";
                WHEN "111011" =>  p1_uid116_constMult_q <= "10101010001111001111";
                WHEN "111100" =>  p1_uid116_constMult_q <= "10101101000111111001";
                WHEN "111101" =>  p1_uid116_constMult_q <= "10110000000000100100";
                WHEN "111110" =>  p1_uid116_constMult_q <= "10110010111001001111";
                WHEN "111111" =>  p1_uid116_constMult_q <= "10110101110001111001";
                WHEN OTHERS =>
                    p1_uid116_constMult_q <= "00000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv2_uid102_constMult(BITSELECT,101)@0
    xv2_uid102_constMult_in <= fxpInPreAlign_uid36_fpExpETest_b(17 downto 0);
    xv2_uid102_constMult_b <= xv2_uid102_constMult_in(17 downto 12);

	--ld_xv2_uid102_constMult_b_to_reg_xv2_uid102_constMult_0_to_p2_uid115_constMult_0_a(DELAY,802)@0
    ld_xv2_uid102_constMult_b_to_reg_xv2_uid102_constMult_0_to_p2_uid115_constMult_0_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 2 )
    PORT MAP ( xin => xv2_uid102_constMult_b, xout => ld_xv2_uid102_constMult_b_to_reg_xv2_uid102_constMult_0_to_p2_uid115_constMult_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_xv2_uid102_constMult_0_to_p2_uid115_constMult_0(REG,348)@2
    reg_xv2_uid102_constMult_0_to_p2_uid115_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv2_uid102_constMult_0_to_p2_uid115_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv2_uid102_constMult_0_to_p2_uid115_constMult_0_q <= ld_xv2_uid102_constMult_b_to_reg_xv2_uid102_constMult_0_to_p2_uid115_constMult_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--p2_uid115_constMult(LOOKUP,114)@3
    p2_uid115_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p2_uid115_constMult_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_xv2_uid102_constMult_0_to_p2_uid115_constMult_0_q) IS
                WHEN "000000" =>  p2_uid115_constMult_q <= "00000000000000000000000000";
                WHEN "000001" =>  p2_uid115_constMult_q <= "00000010111000101010100100";
                WHEN "000010" =>  p2_uid115_constMult_q <= "00000101110001010101000111";
                WHEN "000011" =>  p2_uid115_constMult_q <= "00001000101001111111101011";
                WHEN "000100" =>  p2_uid115_constMult_q <= "00001011100010101010001111";
                WHEN "000101" =>  p2_uid115_constMult_q <= "00001110011011010100110010";
                WHEN "000110" =>  p2_uid115_constMult_q <= "00010001010011111111010110";
                WHEN "000111" =>  p2_uid115_constMult_q <= "00010100001100101001111010";
                WHEN "001000" =>  p2_uid115_constMult_q <= "00010111000101010100011110";
                WHEN "001001" =>  p2_uid115_constMult_q <= "00011001111101111111000001";
                WHEN "001010" =>  p2_uid115_constMult_q <= "00011100110110101001100101";
                WHEN "001011" =>  p2_uid115_constMult_q <= "00011111101111010100001001";
                WHEN "001100" =>  p2_uid115_constMult_q <= "00100010100111111110101100";
                WHEN "001101" =>  p2_uid115_constMult_q <= "00100101100000101001010000";
                WHEN "001110" =>  p2_uid115_constMult_q <= "00101000011001010011110100";
                WHEN "001111" =>  p2_uid115_constMult_q <= "00101011010001111110010111";
                WHEN "010000" =>  p2_uid115_constMult_q <= "00101110001010101000111011";
                WHEN "010001" =>  p2_uid115_constMult_q <= "00110001000011010011011111";
                WHEN "010010" =>  p2_uid115_constMult_q <= "00110011111011111110000011";
                WHEN "010011" =>  p2_uid115_constMult_q <= "00110110110100101000100110";
                WHEN "010100" =>  p2_uid115_constMult_q <= "00111001101101010011001010";
                WHEN "010101" =>  p2_uid115_constMult_q <= "00111100100101111101101110";
                WHEN "010110" =>  p2_uid115_constMult_q <= "00111111011110101000010001";
                WHEN "010111" =>  p2_uid115_constMult_q <= "01000010010111010010110101";
                WHEN "011000" =>  p2_uid115_constMult_q <= "01000101001111111101011001";
                WHEN "011001" =>  p2_uid115_constMult_q <= "01001000001000100111111100";
                WHEN "011010" =>  p2_uid115_constMult_q <= "01001011000001010010100000";
                WHEN "011011" =>  p2_uid115_constMult_q <= "01001101111001111101000100";
                WHEN "011100" =>  p2_uid115_constMult_q <= "01010000110010100111101000";
                WHEN "011101" =>  p2_uid115_constMult_q <= "01010011101011010010001011";
                WHEN "011110" =>  p2_uid115_constMult_q <= "01010110100011111100101111";
                WHEN "011111" =>  p2_uid115_constMult_q <= "01011001011100100111010011";
                WHEN "100000" =>  p2_uid115_constMult_q <= "01011100010101010001110110";
                WHEN "100001" =>  p2_uid115_constMult_q <= "01011111001101111100011010";
                WHEN "100010" =>  p2_uid115_constMult_q <= "01100010000110100110111110";
                WHEN "100011" =>  p2_uid115_constMult_q <= "01100100111111010001100001";
                WHEN "100100" =>  p2_uid115_constMult_q <= "01100111110111111100000101";
                WHEN "100101" =>  p2_uid115_constMult_q <= "01101010110000100110101001";
                WHEN "100110" =>  p2_uid115_constMult_q <= "01101101101001010001001101";
                WHEN "100111" =>  p2_uid115_constMult_q <= "01110000100001111011110000";
                WHEN "101000" =>  p2_uid115_constMult_q <= "01110011011010100110010100";
                WHEN "101001" =>  p2_uid115_constMult_q <= "01110110010011010000111000";
                WHEN "101010" =>  p2_uid115_constMult_q <= "01111001001011111011011011";
                WHEN "101011" =>  p2_uid115_constMult_q <= "01111100000100100101111111";
                WHEN "101100" =>  p2_uid115_constMult_q <= "01111110111101010000100011";
                WHEN "101101" =>  p2_uid115_constMult_q <= "10000001110101111011000110";
                WHEN "101110" =>  p2_uid115_constMult_q <= "10000100101110100101101010";
                WHEN "101111" =>  p2_uid115_constMult_q <= "10000111100111010000001110";
                WHEN "110000" =>  p2_uid115_constMult_q <= "10001010011111111010110001";
                WHEN "110001" =>  p2_uid115_constMult_q <= "10001101011000100101010101";
                WHEN "110010" =>  p2_uid115_constMult_q <= "10010000010001001111111001";
                WHEN "110011" =>  p2_uid115_constMult_q <= "10010011001001111010011101";
                WHEN "110100" =>  p2_uid115_constMult_q <= "10010110000010100101000000";
                WHEN "110101" =>  p2_uid115_constMult_q <= "10011000111011001111100100";
                WHEN "110110" =>  p2_uid115_constMult_q <= "10011011110011111010001000";
                WHEN "110111" =>  p2_uid115_constMult_q <= "10011110101100100100101011";
                WHEN "111000" =>  p2_uid115_constMult_q <= "10100001100101001111001111";
                WHEN "111001" =>  p2_uid115_constMult_q <= "10100100011101111001110011";
                WHEN "111010" =>  p2_uid115_constMult_q <= "10100111010110100100010110";
                WHEN "111011" =>  p2_uid115_constMult_q <= "10101010001111001110111010";
                WHEN "111100" =>  p2_uid115_constMult_q <= "10101101000111111001011110";
                WHEN "111101" =>  p2_uid115_constMult_q <= "10110000000000100100000010";
                WHEN "111110" =>  p2_uid115_constMult_q <= "10110010111001001110100101";
                WHEN "111111" =>  p2_uid115_constMult_q <= "10110101110001111001001001";
                WHEN OTHERS =>
                    p2_uid115_constMult_q <= "00000000000000000000000000";
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--lev1_a3_uid121_constMult(ADD,120)@4
    lev1_a3_uid121_constMult_a <= STD_LOGIC_VECTOR("0" & p2_uid115_constMult_q);
    lev1_a3_uid121_constMult_b <= STD_LOGIC_VECTOR("0000000" & p1_uid116_constMult_q);
            lev1_a3_uid121_constMult_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a3_uid121_constMult_a) + UNSIGNED(lev1_a3_uid121_constMult_b));
    lev1_a3_uid121_constMult_q <= lev1_a3_uid121_constMult_o(26 downto 0);


	--xv3_uid103_constMult(BITSELECT,102)@0
    xv3_uid103_constMult_in <= fxpInPreAlign_uid36_fpExpETest_b(23 downto 0);
    xv3_uid103_constMult_b <= xv3_uid103_constMult_in(23 downto 18);

	--reg_xv3_uid103_constMult_0_to_p3_uid114_constMult_0(REG,347)@0
    reg_xv3_uid103_constMult_0_to_p3_uid114_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv3_uid103_constMult_0_to_p3_uid114_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv3_uid103_constMult_0_to_p3_uid114_constMult_0_q <= xv3_uid103_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xv3_uid103_constMult_0_to_p3_uid114_constMult_0_q_to_p3_uid114_constMult_a(DELAY,526)@1
    ld_reg_xv3_uid103_constMult_0_to_p3_uid114_constMult_0_q_to_p3_uid114_constMult_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 2 )
    PORT MAP ( xin => reg_xv3_uid103_constMult_0_to_p3_uid114_constMult_0_q, xout => ld_reg_xv3_uid103_constMult_0_to_p3_uid114_constMult_0_q_to_p3_uid114_constMult_a_q, ena => en(0), clk => clk, aclr => areset );

	--p3_uid114_constMult(LOOKUP,113)@3
    p3_uid114_constMult: PROCESS (ld_reg_xv3_uid103_constMult_0_to_p3_uid114_constMult_0_q_to_p3_uid114_constMult_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_xv3_uid103_constMult_0_to_p3_uid114_constMult_0_q_to_p3_uid114_constMult_a_q) IS
                WHEN "000000" =>  p3_uid114_constMult_q <= "00000000000000000000000000000000";
                WHEN "000001" =>  p3_uid114_constMult_q <= "00000010111000101010100011101101";
                WHEN "000010" =>  p3_uid114_constMult_q <= "00000101110001010101000111011001";
                WHEN "000011" =>  p3_uid114_constMult_q <= "00001000101001111111101011000110";
                WHEN "000100" =>  p3_uid114_constMult_q <= "00001011100010101010001110110011";
                WHEN "000101" =>  p3_uid114_constMult_q <= "00001110011011010100110010011111";
                WHEN "000110" =>  p3_uid114_constMult_q <= "00010001010011111111010110001100";
                WHEN "000111" =>  p3_uid114_constMult_q <= "00010100001100101001111001111001";
                WHEN "001000" =>  p3_uid114_constMult_q <= "00010111000101010100011101100101";
                WHEN "001001" =>  p3_uid114_constMult_q <= "00011001111101111111000001010010";
                WHEN "001010" =>  p3_uid114_constMult_q <= "00011100110110101001100100111110";
                WHEN "001011" =>  p3_uid114_constMult_q <= "00011111101111010100001000101011";
                WHEN "001100" =>  p3_uid114_constMult_q <= "00100010100111111110101100011000";
                WHEN "001101" =>  p3_uid114_constMult_q <= "00100101100000101001010000000100";
                WHEN "001110" =>  p3_uid114_constMult_q <= "00101000011001010011110011110001";
                WHEN "001111" =>  p3_uid114_constMult_q <= "00101011010001111110010111011110";
                WHEN "010000" =>  p3_uid114_constMult_q <= "00101110001010101000111011001010";
                WHEN "010001" =>  p3_uid114_constMult_q <= "00110001000011010011011110110111";
                WHEN "010010" =>  p3_uid114_constMult_q <= "00110011111011111110000010100100";
                WHEN "010011" =>  p3_uid114_constMult_q <= "00110110110100101000100110010000";
                WHEN "010100" =>  p3_uid114_constMult_q <= "00111001101101010011001001111101";
                WHEN "010101" =>  p3_uid114_constMult_q <= "00111100100101111101101101101010";
                WHEN "010110" =>  p3_uid114_constMult_q <= "00111111011110101000010001010110";
                WHEN "010111" =>  p3_uid114_constMult_q <= "01000010010111010010110101000011";
                WHEN "011000" =>  p3_uid114_constMult_q <= "01000101001111111101011000110000";
                WHEN "011001" =>  p3_uid114_constMult_q <= "01001000001000100111111100011100";
                WHEN "011010" =>  p3_uid114_constMult_q <= "01001011000001010010100000001001";
                WHEN "011011" =>  p3_uid114_constMult_q <= "01001101111001111101000011110101";
                WHEN "011100" =>  p3_uid114_constMult_q <= "01010000110010100111100111100010";
                WHEN "011101" =>  p3_uid114_constMult_q <= "01010011101011010010001011001111";
                WHEN "011110" =>  p3_uid114_constMult_q <= "01010110100011111100101110111011";
                WHEN "011111" =>  p3_uid114_constMult_q <= "01011001011100100111010010101000";
                WHEN "100000" =>  p3_uid114_constMult_q <= "01011100010101010001110110010101";
                WHEN "100001" =>  p3_uid114_constMult_q <= "01011111001101111100011010000001";
                WHEN "100010" =>  p3_uid114_constMult_q <= "01100010000110100110111101101110";
                WHEN "100011" =>  p3_uid114_constMult_q <= "01100100111111010001100001011011";
                WHEN "100100" =>  p3_uid114_constMult_q <= "01100111110111111100000101000111";
                WHEN "100101" =>  p3_uid114_constMult_q <= "01101010110000100110101000110100";
                WHEN "100110" =>  p3_uid114_constMult_q <= "01101101101001010001001100100001";
                WHEN "100111" =>  p3_uid114_constMult_q <= "01110000100001111011110000001101";
                WHEN "101000" =>  p3_uid114_constMult_q <= "01110011011010100110010011111010";
                WHEN "101001" =>  p3_uid114_constMult_q <= "01110110010011010000110111100110";
                WHEN "101010" =>  p3_uid114_constMult_q <= "01111001001011111011011011010011";
                WHEN "101011" =>  p3_uid114_constMult_q <= "01111100000100100101111111000000";
                WHEN "101100" =>  p3_uid114_constMult_q <= "01111110111101010000100010101100";
                WHEN "101101" =>  p3_uid114_constMult_q <= "10000001110101111011000110011001";
                WHEN "101110" =>  p3_uid114_constMult_q <= "10000100101110100101101010000110";
                WHEN "101111" =>  p3_uid114_constMult_q <= "10000111100111010000001101110010";
                WHEN "110000" =>  p3_uid114_constMult_q <= "10001010011111111010110001011111";
                WHEN "110001" =>  p3_uid114_constMult_q <= "10001101011000100101010101001100";
                WHEN "110010" =>  p3_uid114_constMult_q <= "10010000010001001111111000111000";
                WHEN "110011" =>  p3_uid114_constMult_q <= "10010011001001111010011100100101";
                WHEN "110100" =>  p3_uid114_constMult_q <= "10010110000010100101000000010010";
                WHEN "110101" =>  p3_uid114_constMult_q <= "10011000111011001111100011111110";
                WHEN "110110" =>  p3_uid114_constMult_q <= "10011011110011111010000111101011";
                WHEN "110111" =>  p3_uid114_constMult_q <= "10011110101100100100101011011000";
                WHEN "111000" =>  p3_uid114_constMult_q <= "10100001100101001111001111000100";
                WHEN "111001" =>  p3_uid114_constMult_q <= "10100100011101111001110010110001";
                WHEN "111010" =>  p3_uid114_constMult_q <= "10100111010110100100010110011101";
                WHEN "111011" =>  p3_uid114_constMult_q <= "10101010001111001110111010001010";
                WHEN "111100" =>  p3_uid114_constMult_q <= "10101101000111111001011101110111";
                WHEN "111101" =>  p3_uid114_constMult_q <= "10110000000000100100000001100011";
                WHEN "111110" =>  p3_uid114_constMult_q <= "10110010111001001110100101010000";
                WHEN "111111" =>  p3_uid114_constMult_q <= "10110101110001111001001000111101";
                WHEN OTHERS =>
                    p3_uid114_constMult_q <= "00000000000000000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv4_uid104_constMult(BITSELECT,103)@0
    xv4_uid104_constMult_in <= fxpInPreAlign_uid36_fpExpETest_b(29 downto 0);
    xv4_uid104_constMult_b <= xv4_uid104_constMult_in(29 downto 24);

	--reg_xv4_uid104_constMult_0_to_p4_uid113_constMult_0(REG,346)@0
    reg_xv4_uid104_constMult_0_to_p4_uid113_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv4_uid104_constMult_0_to_p4_uid113_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv4_uid104_constMult_0_to_p4_uid113_constMult_0_q <= xv4_uid104_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xv4_uid104_constMult_0_to_p4_uid113_constMult_0_q_to_p4_uid113_constMult_a(DELAY,525)@1
    ld_reg_xv4_uid104_constMult_0_to_p4_uid113_constMult_0_q_to_p4_uid113_constMult_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => reg_xv4_uid104_constMult_0_to_p4_uid113_constMult_0_q, xout => ld_reg_xv4_uid104_constMult_0_to_p4_uid113_constMult_0_q_to_p4_uid113_constMult_a_q, ena => en(0), clk => clk, aclr => areset );

	--p4_uid113_constMult(LOOKUP,112)@2
    p4_uid113_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p4_uid113_constMult_q <= "00000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_xv4_uid104_constMult_0_to_p4_uid113_constMult_0_q_to_p4_uid113_constMult_a_q) IS
                WHEN "000000" =>  p4_uid113_constMult_q <= "00000000000000000000000000000000000000";
                WHEN "000001" =>  p4_uid113_constMult_q <= "00000010111000101010100011101100101001";
                WHEN "000010" =>  p4_uid113_constMult_q <= "00000101110001010101000111011001010011";
                WHEN "000011" =>  p4_uid113_constMult_q <= "00001000101001111111101011000101111100";
                WHEN "000100" =>  p4_uid113_constMult_q <= "00001011100010101010001110110010100101";
                WHEN "000101" =>  p4_uid113_constMult_q <= "00001110011011010100110010011111001111";
                WHEN "000110" =>  p4_uid113_constMult_q <= "00010001010011111111010110001011111000";
                WHEN "000111" =>  p4_uid113_constMult_q <= "00010100001100101001111001111000100010";
                WHEN "001000" =>  p4_uid113_constMult_q <= "00010111000101010100011101100101001011";
                WHEN "001001" =>  p4_uid113_constMult_q <= "00011001111101111111000001010001110100";
                WHEN "001010" =>  p4_uid113_constMult_q <= "00011100110110101001100100111110011110";
                WHEN "001011" =>  p4_uid113_constMult_q <= "00011111101111010100001000101011000111";
                WHEN "001100" =>  p4_uid113_constMult_q <= "00100010100111111110101100010111110000";
                WHEN "001101" =>  p4_uid113_constMult_q <= "00100101100000101001010000000100011010";
                WHEN "001110" =>  p4_uid113_constMult_q <= "00101000011001010011110011110001000011";
                WHEN "001111" =>  p4_uid113_constMult_q <= "00101011010001111110010111011101101100";
                WHEN "010000" =>  p4_uid113_constMult_q <= "00101110001010101000111011001010010110";
                WHEN "010001" =>  p4_uid113_constMult_q <= "00110001000011010011011110110110111111";
                WHEN "010010" =>  p4_uid113_constMult_q <= "00110011111011111110000010100011101000";
                WHEN "010011" =>  p4_uid113_constMult_q <= "00110110110100101000100110010000010010";
                WHEN "010100" =>  p4_uid113_constMult_q <= "00111001101101010011001001111100111011";
                WHEN "010101" =>  p4_uid113_constMult_q <= "00111100100101111101101101101001100101";
                WHEN "010110" =>  p4_uid113_constMult_q <= "00111111011110101000010001010110001110";
                WHEN "010111" =>  p4_uid113_constMult_q <= "01000010010111010010110101000010110111";
                WHEN "011000" =>  p4_uid113_constMult_q <= "01000101001111111101011000101111100001";
                WHEN "011001" =>  p4_uid113_constMult_q <= "01001000001000100111111100011100001010";
                WHEN "011010" =>  p4_uid113_constMult_q <= "01001011000001010010100000001000110011";
                WHEN "011011" =>  p4_uid113_constMult_q <= "01001101111001111101000011110101011101";
                WHEN "011100" =>  p4_uid113_constMult_q <= "01010000110010100111100111100010000110";
                WHEN "011101" =>  p4_uid113_constMult_q <= "01010011101011010010001011001110101111";
                WHEN "011110" =>  p4_uid113_constMult_q <= "01010110100011111100101110111011011001";
                WHEN "011111" =>  p4_uid113_constMult_q <= "01011001011100100111010010101000000010";
                WHEN "100000" =>  p4_uid113_constMult_q <= "01011100010101010001110110010100101100";
                WHEN "100001" =>  p4_uid113_constMult_q <= "01011111001101111100011010000001010101";
                WHEN "100010" =>  p4_uid113_constMult_q <= "01100010000110100110111101101101111110";
                WHEN "100011" =>  p4_uid113_constMult_q <= "01100100111111010001100001011010101000";
                WHEN "100100" =>  p4_uid113_constMult_q <= "01100111110111111100000101000111010001";
                WHEN "100101" =>  p4_uid113_constMult_q <= "01101010110000100110101000110011111010";
                WHEN "100110" =>  p4_uid113_constMult_q <= "01101101101001010001001100100000100100";
                WHEN "100111" =>  p4_uid113_constMult_q <= "01110000100001111011110000001101001101";
                WHEN "101000" =>  p4_uid113_constMult_q <= "01110011011010100110010011111001110110";
                WHEN "101001" =>  p4_uid113_constMult_q <= "01110110010011010000110111100110100000";
                WHEN "101010" =>  p4_uid113_constMult_q <= "01111001001011111011011011010011001001";
                WHEN "101011" =>  p4_uid113_constMult_q <= "01111100000100100101111110111111110010";
                WHEN "101100" =>  p4_uid113_constMult_q <= "01111110111101010000100010101100011100";
                WHEN "101101" =>  p4_uid113_constMult_q <= "10000001110101111011000110011001000101";
                WHEN "101110" =>  p4_uid113_constMult_q <= "10000100101110100101101010000101101111";
                WHEN "101111" =>  p4_uid113_constMult_q <= "10000111100111010000001101110010011000";
                WHEN "110000" =>  p4_uid113_constMult_q <= "10001010011111111010110001011111000001";
                WHEN "110001" =>  p4_uid113_constMult_q <= "10001101011000100101010101001011101011";
                WHEN "110010" =>  p4_uid113_constMult_q <= "10010000010001001111111000111000010100";
                WHEN "110011" =>  p4_uid113_constMult_q <= "10010011001001111010011100100100111101";
                WHEN "110100" =>  p4_uid113_constMult_q <= "10010110000010100101000000010001100111";
                WHEN "110101" =>  p4_uid113_constMult_q <= "10011000111011001111100011111110010000";
                WHEN "110110" =>  p4_uid113_constMult_q <= "10011011110011111010000111101010111001";
                WHEN "110111" =>  p4_uid113_constMult_q <= "10011110101100100100101011010111100011";
                WHEN "111000" =>  p4_uid113_constMult_q <= "10100001100101001111001111000100001100";
                WHEN "111001" =>  p4_uid113_constMult_q <= "10100100011101111001110010110000110110";
                WHEN "111010" =>  p4_uid113_constMult_q <= "10100111010110100100010110011101011111";
                WHEN "111011" =>  p4_uid113_constMult_q <= "10101010001111001110111010001010001000";
                WHEN "111100" =>  p4_uid113_constMult_q <= "10101101000111111001011101110110110010";
                WHEN "111101" =>  p4_uid113_constMult_q <= "10110000000000100100000001100011011011";
                WHEN "111110" =>  p4_uid113_constMult_q <= "10110010111001001110100101010000000100";
                WHEN "111111" =>  p4_uid113_constMult_q <= "10110101110001111001001000111100101110";
                WHEN OTHERS =>
                    p4_uid113_constMult_q <= "00000000000000000000000000000000000000";
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--lev1_a2_uid120_constMult(ADD,119)@3
    lev1_a2_uid120_constMult_a <= STD_LOGIC_VECTOR("0" & p4_uid113_constMult_q);
    lev1_a2_uid120_constMult_b <= STD_LOGIC_VECTOR("0000000" & p3_uid114_constMult_q);
    lev1_a2_uid120_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a2_uid120_constMult_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                lev1_a2_uid120_constMult_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a2_uid120_constMult_a) + UNSIGNED(lev1_a2_uid120_constMult_b));
            END IF;
        END IF;
    END PROCESS;
    lev1_a2_uid120_constMult_q <= lev1_a2_uid120_constMult_o(38 downto 0);


	--lev2_a1_uid123_constMult(ADD,122)@4
    lev2_a1_uid123_constMult_a <= STD_LOGIC_VECTOR("0" & lev1_a2_uid120_constMult_q);
    lev2_a1_uid123_constMult_b <= STD_LOGIC_VECTOR("0000000000000" & lev1_a3_uid121_constMult_q);
            lev2_a1_uid123_constMult_o <= STD_LOGIC_VECTOR(UNSIGNED(lev2_a1_uid123_constMult_a) + UNSIGNED(lev2_a1_uid123_constMult_b));
    lev2_a1_uid123_constMult_q <= lev2_a1_uid123_constMult_o(39 downto 0);


	--xv5_uid105_constMult(BITSELECT,104)@0
    xv5_uid105_constMult_in <= fxpInPreAlign_uid36_fpExpETest_b(35 downto 0);
    xv5_uid105_constMult_b <= xv5_uid105_constMult_in(35 downto 30);

	--ld_xv5_uid105_constMult_b_to_reg_xv5_uid105_constMult_0_to_p5_uid112_constMult_0_a(DELAY,799)@0
    ld_xv5_uid105_constMult_b_to_reg_xv5_uid105_constMult_0_to_p5_uid112_constMult_0_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 2 )
    PORT MAP ( xin => xv5_uid105_constMult_b, xout => ld_xv5_uid105_constMult_b_to_reg_xv5_uid105_constMult_0_to_p5_uid112_constMult_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_xv5_uid105_constMult_0_to_p5_uid112_constMult_0(REG,345)@2
    reg_xv5_uid105_constMult_0_to_p5_uid112_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv5_uid105_constMult_0_to_p5_uid112_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv5_uid105_constMult_0_to_p5_uid112_constMult_0_q <= ld_xv5_uid105_constMult_b_to_reg_xv5_uid105_constMult_0_to_p5_uid112_constMult_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--p5_uid112_constMult(LOOKUP,111)@3
    p5_uid112_constMult: PROCESS (reg_xv5_uid105_constMult_0_to_p5_uid112_constMult_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_xv5_uid105_constMult_0_to_p5_uid112_constMult_0_q) IS
                WHEN "000000" =>  p5_uid112_constMult_q <= "00000000000000000000000000000000000000000000";
                WHEN "000001" =>  p5_uid112_constMult_q <= "00000010111000101010100011101100101001010111";
                WHEN "000010" =>  p5_uid112_constMult_q <= "00000101110001010101000111011001010010101110";
                WHEN "000011" =>  p5_uid112_constMult_q <= "00001000101001111111101011000101111100000101";
                WHEN "000100" =>  p5_uid112_constMult_q <= "00001011100010101010001110110010100101011100";
                WHEN "000101" =>  p5_uid112_constMult_q <= "00001110011011010100110010011111001110110011";
                WHEN "000110" =>  p5_uid112_constMult_q <= "00010001010011111111010110001011111000001010";
                WHEN "000111" =>  p5_uid112_constMult_q <= "00010100001100101001111001111000100001100001";
                WHEN "001000" =>  p5_uid112_constMult_q <= "00010111000101010100011101100101001010111000";
                WHEN "001001" =>  p5_uid112_constMult_q <= "00011001111101111111000001010001110100001111";
                WHEN "001010" =>  p5_uid112_constMult_q <= "00011100110110101001100100111110011101100110";
                WHEN "001011" =>  p5_uid112_constMult_q <= "00011111101111010100001000101011000110111101";
                WHEN "001100" =>  p5_uid112_constMult_q <= "00100010100111111110101100010111110000010100";
                WHEN "001101" =>  p5_uid112_constMult_q <= "00100101100000101001010000000100011001101011";
                WHEN "001110" =>  p5_uid112_constMult_q <= "00101000011001010011110011110001000011000010";
                WHEN "001111" =>  p5_uid112_constMult_q <= "00101011010001111110010111011101101100011001";
                WHEN "010000" =>  p5_uid112_constMult_q <= "00101110001010101000111011001010010101110000";
                WHEN "010001" =>  p5_uid112_constMult_q <= "00110001000011010011011110110110111111000111";
                WHEN "010010" =>  p5_uid112_constMult_q <= "00110011111011111110000010100011101000011110";
                WHEN "010011" =>  p5_uid112_constMult_q <= "00110110110100101000100110010000010001110101";
                WHEN "010100" =>  p5_uid112_constMult_q <= "00111001101101010011001001111100111011001100";
                WHEN "010101" =>  p5_uid112_constMult_q <= "00111100100101111101101101101001100100100011";
                WHEN "010110" =>  p5_uid112_constMult_q <= "00111111011110101000010001010110001101111011";
                WHEN "010111" =>  p5_uid112_constMult_q <= "01000010010111010010110101000010110111010010";
                WHEN "011000" =>  p5_uid112_constMult_q <= "01000101001111111101011000101111100000101001";
                WHEN "011001" =>  p5_uid112_constMult_q <= "01001000001000100111111100011100001010000000";
                WHEN "011010" =>  p5_uid112_constMult_q <= "01001011000001010010100000001000110011010111";
                WHEN "011011" =>  p5_uid112_constMult_q <= "01001101111001111101000011110101011100101110";
                WHEN "011100" =>  p5_uid112_constMult_q <= "01010000110010100111100111100010000110000101";
                WHEN "011101" =>  p5_uid112_constMult_q <= "01010011101011010010001011001110101111011100";
                WHEN "011110" =>  p5_uid112_constMult_q <= "01010110100011111100101110111011011000110011";
                WHEN "011111" =>  p5_uid112_constMult_q <= "01011001011100100111010010101000000010001010";
                WHEN "100000" =>  p5_uid112_constMult_q <= "01011100010101010001110110010100101011100001";
                WHEN "100001" =>  p5_uid112_constMult_q <= "01011111001101111100011010000001010100111000";
                WHEN "100010" =>  p5_uid112_constMult_q <= "01100010000110100110111101101101111110001111";
                WHEN "100011" =>  p5_uid112_constMult_q <= "01100100111111010001100001011010100111100110";
                WHEN "100100" =>  p5_uid112_constMult_q <= "01100111110111111100000101000111010000111101";
                WHEN "100101" =>  p5_uid112_constMult_q <= "01101010110000100110101000110011111010010100";
                WHEN "100110" =>  p5_uid112_constMult_q <= "01101101101001010001001100100000100011101011";
                WHEN "100111" =>  p5_uid112_constMult_q <= "01110000100001111011110000001101001101000010";
                WHEN "101000" =>  p5_uid112_constMult_q <= "01110011011010100110010011111001110110011001";
                WHEN "101001" =>  p5_uid112_constMult_q <= "01110110010011010000110111100110011111110000";
                WHEN "101010" =>  p5_uid112_constMult_q <= "01111001001011111011011011010011001001000111";
                WHEN "101011" =>  p5_uid112_constMult_q <= "01111100000100100101111110111111110010011110";
                WHEN "101100" =>  p5_uid112_constMult_q <= "01111110111101010000100010101100011011110101";
                WHEN "101101" =>  p5_uid112_constMult_q <= "10000001110101111011000110011001000101001100";
                WHEN "101110" =>  p5_uid112_constMult_q <= "10000100101110100101101010000101101110100011";
                WHEN "101111" =>  p5_uid112_constMult_q <= "10000111100111010000001101110010010111111010";
                WHEN "110000" =>  p5_uid112_constMult_q <= "10001010011111111010110001011111000001010001";
                WHEN "110001" =>  p5_uid112_constMult_q <= "10001101011000100101010101001011101010101000";
                WHEN "110010" =>  p5_uid112_constMult_q <= "10010000010001001111111000111000010011111111";
                WHEN "110011" =>  p5_uid112_constMult_q <= "10010011001001111010011100100100111101010110";
                WHEN "110100" =>  p5_uid112_constMult_q <= "10010110000010100101000000010001100110101101";
                WHEN "110101" =>  p5_uid112_constMult_q <= "10011000111011001111100011111110010000000100";
                WHEN "110110" =>  p5_uid112_constMult_q <= "10011011110011111010000111101010111001011011";
                WHEN "110111" =>  p5_uid112_constMult_q <= "10011110101100100100101011010111100010110010";
                WHEN "111000" =>  p5_uid112_constMult_q <= "10100001100101001111001111000100001100001001";
                WHEN "111001" =>  p5_uid112_constMult_q <= "10100100011101111001110010110000110101100000";
                WHEN "111010" =>  p5_uid112_constMult_q <= "10100111010110100100010110011101011110110111";
                WHEN "111011" =>  p5_uid112_constMult_q <= "10101010001111001110111010001010001000001110";
                WHEN "111100" =>  p5_uid112_constMult_q <= "10101101000111111001011101110110110001100101";
                WHEN "111101" =>  p5_uid112_constMult_q <= "10110000000000100100000001100011011010111100";
                WHEN "111110" =>  p5_uid112_constMult_q <= "10110010111001001110100101010000000100010011";
                WHEN "111111" =>  p5_uid112_constMult_q <= "10110101110001111001001000111100101101101010";
                WHEN OTHERS =>
                    p5_uid112_constMult_q <= "00000000000000000000000000000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv6_uid106_constMult(BITSELECT,105)@0
    xv6_uid106_constMult_in <= fxpInPreAlign_uid36_fpExpETest_b(41 downto 0);
    xv6_uid106_constMult_b <= xv6_uid106_constMult_in(41 downto 36);

	--reg_xv6_uid106_constMult_0_to_p6_uid111_constMult_0(REG,344)@0
    reg_xv6_uid106_constMult_0_to_p6_uid111_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv6_uid106_constMult_0_to_p6_uid111_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv6_uid106_constMult_0_to_p6_uid111_constMult_0_q <= xv6_uid106_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xv6_uid106_constMult_0_to_p6_uid111_constMult_0_q_to_p6_uid111_constMult_a(DELAY,523)@1
    ld_reg_xv6_uid106_constMult_0_to_p6_uid111_constMult_0_q_to_p6_uid111_constMult_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => reg_xv6_uid106_constMult_0_to_p6_uid111_constMult_0_q, xout => ld_reg_xv6_uid106_constMult_0_to_p6_uid111_constMult_0_q_to_p6_uid111_constMult_a_q, ena => en(0), clk => clk, aclr => areset );

	--p6_uid111_constMult(LOOKUP,110)@2
    p6_uid111_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p6_uid111_constMult_q <= "00000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_xv6_uid106_constMult_0_to_p6_uid111_constMult_0_q_to_p6_uid111_constMult_a_q) IS
                WHEN "000000" =>  p6_uid111_constMult_q <= "00000000000000000000000000000000000000000000000000";
                WHEN "000001" =>  p6_uid111_constMult_q <= "00000010111000101010100011101100101001010111000001";
                WHEN "000010" =>  p6_uid111_constMult_q <= "00000101110001010101000111011001010010101110000011";
                WHEN "000011" =>  p6_uid111_constMult_q <= "00001000101001111111101011000101111100000101000100";
                WHEN "000100" =>  p6_uid111_constMult_q <= "00001011100010101010001110110010100101011100000110";
                WHEN "000101" =>  p6_uid111_constMult_q <= "00001110011011010100110010011111001110110011000111";
                WHEN "000110" =>  p6_uid111_constMult_q <= "00010001010011111111010110001011111000001010001001";
                WHEN "000111" =>  p6_uid111_constMult_q <= "00010100001100101001111001111000100001100001001010";
                WHEN "001000" =>  p6_uid111_constMult_q <= "00010111000101010100011101100101001010111000001100";
                WHEN "001001" =>  p6_uid111_constMult_q <= "00011001111101111111000001010001110100001111001101";
                WHEN "001010" =>  p6_uid111_constMult_q <= "00011100110110101001100100111110011101100110001111";
                WHEN "001011" =>  p6_uid111_constMult_q <= "00011111101111010100001000101011000110111101010000";
                WHEN "001100" =>  p6_uid111_constMult_q <= "00100010100111111110101100010111110000010100010010";
                WHEN "001101" =>  p6_uid111_constMult_q <= "00100101100000101001010000000100011001101011010011";
                WHEN "001110" =>  p6_uid111_constMult_q <= "00101000011001010011110011110001000011000010010101";
                WHEN "001111" =>  p6_uid111_constMult_q <= "00101011010001111110010111011101101100011001010110";
                WHEN "010000" =>  p6_uid111_constMult_q <= "00101110001010101000111011001010010101110000011000";
                WHEN "010001" =>  p6_uid111_constMult_q <= "00110001000011010011011110110110111111000111011001";
                WHEN "010010" =>  p6_uid111_constMult_q <= "00110011111011111110000010100011101000011110011011";
                WHEN "010011" =>  p6_uid111_constMult_q <= "00110110110100101000100110010000010001110101011100";
                WHEN "010100" =>  p6_uid111_constMult_q <= "00111001101101010011001001111100111011001100011110";
                WHEN "010101" =>  p6_uid111_constMult_q <= "00111100100101111101101101101001100100100011011111";
                WHEN "010110" =>  p6_uid111_constMult_q <= "00111111011110101000010001010110001101111010100001";
                WHEN "010111" =>  p6_uid111_constMult_q <= "01000010010111010010110101000010110111010001100010";
                WHEN "011000" =>  p6_uid111_constMult_q <= "01000101001111111101011000101111100000101000100100";
                WHEN "011001" =>  p6_uid111_constMult_q <= "01001000001000100111111100011100001001111111100101";
                WHEN "011010" =>  p6_uid111_constMult_q <= "01001011000001010010100000001000110011010110100111";
                WHEN "011011" =>  p6_uid111_constMult_q <= "01001101111001111101000011110101011100101101101000";
                WHEN "011100" =>  p6_uid111_constMult_q <= "01010000110010100111100111100010000110000100101010";
                WHEN "011101" =>  p6_uid111_constMult_q <= "01010011101011010010001011001110101111011011101011";
                WHEN "011110" =>  p6_uid111_constMult_q <= "01010110100011111100101110111011011000110010101101";
                WHEN "011111" =>  p6_uid111_constMult_q <= "01011001011100100111010010101000000010001001101110";
                WHEN "100000" =>  p6_uid111_constMult_q <= "01011100010101010001110110010100101011100000110000";
                WHEN "100001" =>  p6_uid111_constMult_q <= "01011111001101111100011010000001010100110111110001";
                WHEN "100010" =>  p6_uid111_constMult_q <= "01100010000110100110111101101101111110001110110011";
                WHEN "100011" =>  p6_uid111_constMult_q <= "01100100111111010001100001011010100111100101110100";
                WHEN "100100" =>  p6_uid111_constMult_q <= "01100111110111111100000101000111010000111100110110";
                WHEN "100101" =>  p6_uid111_constMult_q <= "01101010110000100110101000110011111010010011110111";
                WHEN "100110" =>  p6_uid111_constMult_q <= "01101101101001010001001100100000100011101010111001";
                WHEN "100111" =>  p6_uid111_constMult_q <= "01110000100001111011110000001101001101000001111010";
                WHEN "101000" =>  p6_uid111_constMult_q <= "01110011011010100110010011111001110110011000111100";
                WHEN "101001" =>  p6_uid111_constMult_q <= "01110110010011010000110111100110011111101111111101";
                WHEN "101010" =>  p6_uid111_constMult_q <= "01111001001011111011011011010011001001000110111111";
                WHEN "101011" =>  p6_uid111_constMult_q <= "01111100000100100101111110111111110010011110000000";
                WHEN "101100" =>  p6_uid111_constMult_q <= "01111110111101010000100010101100011011110101000010";
                WHEN "101101" =>  p6_uid111_constMult_q <= "10000001110101111011000110011001000101001100000011";
                WHEN "101110" =>  p6_uid111_constMult_q <= "10000100101110100101101010000101101110100011000101";
                WHEN "101111" =>  p6_uid111_constMult_q <= "10000111100111010000001101110010010111111010000110";
                WHEN "110000" =>  p6_uid111_constMult_q <= "10001010011111111010110001011111000001010001001000";
                WHEN "110001" =>  p6_uid111_constMult_q <= "10001101011000100101010101001011101010101000001001";
                WHEN "110010" =>  p6_uid111_constMult_q <= "10010000010001001111111000111000010011111111001011";
                WHEN "110011" =>  p6_uid111_constMult_q <= "10010011001001111010011100100100111101010110001100";
                WHEN "110100" =>  p6_uid111_constMult_q <= "10010110000010100101000000010001100110101101001110";
                WHEN "110101" =>  p6_uid111_constMult_q <= "10011000111011001111100011111110010000000100001111";
                WHEN "110110" =>  p6_uid111_constMult_q <= "10011011110011111010000111101010111001011011010001";
                WHEN "110111" =>  p6_uid111_constMult_q <= "10011110101100100100101011010111100010110010010010";
                WHEN "111000" =>  p6_uid111_constMult_q <= "10100001100101001111001111000100001100001001010100";
                WHEN "111001" =>  p6_uid111_constMult_q <= "10100100011101111001110010110000110101100000010101";
                WHEN "111010" =>  p6_uid111_constMult_q <= "10100111010110100100010110011101011110110111010111";
                WHEN "111011" =>  p6_uid111_constMult_q <= "10101010001111001110111010001010001000001110011000";
                WHEN "111100" =>  p6_uid111_constMult_q <= "10101101000111111001011101110110110001100101011010";
                WHEN "111101" =>  p6_uid111_constMult_q <= "10110000000000100100000001100011011010111100011011";
                WHEN "111110" =>  p6_uid111_constMult_q <= "10110010111001001110100101010000000100010011011101";
                WHEN "111111" =>  p6_uid111_constMult_q <= "10110101110001111001001000111100101101101010011110";
                WHEN OTHERS =>
                    p6_uid111_constMult_q <= "00000000000000000000000000000000000000000000000000";
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--lev1_a1_uid119_constMult(ADD,118)@3
    lev1_a1_uid119_constMult_a <= STD_LOGIC_VECTOR("0" & p6_uid111_constMult_q);
    lev1_a1_uid119_constMult_b <= STD_LOGIC_VECTOR("0000000" & p5_uid112_constMult_q);
            lev1_a1_uid119_constMult_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a1_uid119_constMult_a) + UNSIGNED(lev1_a1_uid119_constMult_b));
    lev1_a1_uid119_constMult_q <= lev1_a1_uid119_constMult_o(50 downto 0);


	--xv7_uid107_constMult(BITSELECT,106)@0
    xv7_uid107_constMult_in <= fxpInPreAlign_uid36_fpExpETest_b(47 downto 0);
    xv7_uid107_constMult_b <= xv7_uid107_constMult_in(47 downto 42);

	--reg_xv7_uid107_constMult_0_to_p7_uid110_constMult_0(REG,343)@0
    reg_xv7_uid107_constMult_0_to_p7_uid110_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv7_uid107_constMult_0_to_p7_uid110_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv7_uid107_constMult_0_to_p7_uid110_constMult_0_q <= xv7_uid107_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xv7_uid107_constMult_0_to_p7_uid110_constMult_0_q_to_p7_uid110_constMult_a(DELAY,522)@1
    ld_reg_xv7_uid107_constMult_0_to_p7_uid110_constMult_0_q_to_p7_uid110_constMult_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => reg_xv7_uid107_constMult_0_to_p7_uid110_constMult_0_q, xout => ld_reg_xv7_uid107_constMult_0_to_p7_uid110_constMult_0_q_to_p7_uid110_constMult_a_q, ena => en(0), clk => clk, aclr => areset );

	--p7_uid110_constMult(LOOKUP,109)@2
    p7_uid110_constMult: PROCESS (ld_reg_xv7_uid107_constMult_0_to_p7_uid110_constMult_0_q_to_p7_uid110_constMult_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_xv7_uid107_constMult_0_to_p7_uid110_constMult_0_q_to_p7_uid110_constMult_a_q) IS
                WHEN "000000" =>  p7_uid110_constMult_q <= "00000000000000000000000000000000000000000000000000000000";
                WHEN "000001" =>  p7_uid110_constMult_q <= "00000010111000101010100011101100101001010111000001100000";
                WHEN "000010" =>  p7_uid110_constMult_q <= "00000101110001010101000111011001010010101110000011000000";
                WHEN "000011" =>  p7_uid110_constMult_q <= "00001000101001111111101011000101111100000101000100011111";
                WHEN "000100" =>  p7_uid110_constMult_q <= "00001011100010101010001110110010100101011100000101111111";
                WHEN "000101" =>  p7_uid110_constMult_q <= "00001110011011010100110010011111001110110011000111011111";
                WHEN "000110" =>  p7_uid110_constMult_q <= "00010001010011111111010110001011111000001010001000111111";
                WHEN "000111" =>  p7_uid110_constMult_q <= "00010100001100101001111001111000100001100001001010011110";
                WHEN "001000" =>  p7_uid110_constMult_q <= "00010111000101010100011101100101001010111000001011111110";
                WHEN "001001" =>  p7_uid110_constMult_q <= "00011001111101111111000001010001110100001111001101011110";
                WHEN "001010" =>  p7_uid110_constMult_q <= "00011100110110101001100100111110011101100110001110111110";
                WHEN "001011" =>  p7_uid110_constMult_q <= "00011111101111010100001000101011000110111101010000011101";
                WHEN "001100" =>  p7_uid110_constMult_q <= "00100010100111111110101100010111110000010100010001111101";
                WHEN "001101" =>  p7_uid110_constMult_q <= "00100101100000101001010000000100011001101011010011011101";
                WHEN "001110" =>  p7_uid110_constMult_q <= "00101000011001010011110011110001000011000010010100111101";
                WHEN "001111" =>  p7_uid110_constMult_q <= "00101011010001111110010111011101101100011001010110011100";
                WHEN "010000" =>  p7_uid110_constMult_q <= "00101110001010101000111011001010010101110000010111111100";
                WHEN "010001" =>  p7_uid110_constMult_q <= "00110001000011010011011110110110111111000111011001011100";
                WHEN "010010" =>  p7_uid110_constMult_q <= "00110011111011111110000010100011101000011110011010111100";
                WHEN "010011" =>  p7_uid110_constMult_q <= "00110110110100101000100110010000010001110101011100011011";
                WHEN "010100" =>  p7_uid110_constMult_q <= "00111001101101010011001001111100111011001100011101111011";
                WHEN "010101" =>  p7_uid110_constMult_q <= "00111100100101111101101101101001100100100011011111011011";
                WHEN "010110" =>  p7_uid110_constMult_q <= "00111111011110101000010001010110001101111010100000111011";
                WHEN "010111" =>  p7_uid110_constMult_q <= "01000010010111010010110101000010110111010001100010011011";
                WHEN "011000" =>  p7_uid110_constMult_q <= "01000101001111111101011000101111100000101000100011111010";
                WHEN "011001" =>  p7_uid110_constMult_q <= "01001000001000100111111100011100001001111111100101011010";
                WHEN "011010" =>  p7_uid110_constMult_q <= "01001011000001010010100000001000110011010110100110111010";
                WHEN "011011" =>  p7_uid110_constMult_q <= "01001101111001111101000011110101011100101101101000011010";
                WHEN "011100" =>  p7_uid110_constMult_q <= "01010000110010100111100111100010000110000100101001111001";
                WHEN "011101" =>  p7_uid110_constMult_q <= "01010011101011010010001011001110101111011011101011011001";
                WHEN "011110" =>  p7_uid110_constMult_q <= "01010110100011111100101110111011011000110010101100111001";
                WHEN "011111" =>  p7_uid110_constMult_q <= "01011001011100100111010010101000000010001001101110011001";
                WHEN "100000" =>  p7_uid110_constMult_q <= "01011100010101010001110110010100101011100000101111111000";
                WHEN "100001" =>  p7_uid110_constMult_q <= "01011111001101111100011010000001010100110111110001011000";
                WHEN "100010" =>  p7_uid110_constMult_q <= "01100010000110100110111101101101111110001110110010111000";
                WHEN "100011" =>  p7_uid110_constMult_q <= "01100100111111010001100001011010100111100101110100011000";
                WHEN "100100" =>  p7_uid110_constMult_q <= "01100111110111111100000101000111010000111100110101110111";
                WHEN "100101" =>  p7_uid110_constMult_q <= "01101010110000100110101000110011111010010011110111010111";
                WHEN "100110" =>  p7_uid110_constMult_q <= "01101101101001010001001100100000100011101010111000110111";
                WHEN "100111" =>  p7_uid110_constMult_q <= "01110000100001111011110000001101001101000001111010010111";
                WHEN "101000" =>  p7_uid110_constMult_q <= "01110011011010100110010011111001110110011000111011110110";
                WHEN "101001" =>  p7_uid110_constMult_q <= "01110110010011010000110111100110011111101111111101010110";
                WHEN "101010" =>  p7_uid110_constMult_q <= "01111001001011111011011011010011001001000110111110110110";
                WHEN "101011" =>  p7_uid110_constMult_q <= "01111100000100100101111110111111110010011110000000010110";
                WHEN "101100" =>  p7_uid110_constMult_q <= "01111110111101010000100010101100011011110101000001110110";
                WHEN "101101" =>  p7_uid110_constMult_q <= "10000001110101111011000110011001000101001100000011010101";
                WHEN "101110" =>  p7_uid110_constMult_q <= "10000100101110100101101010000101101110100011000100110101";
                WHEN "101111" =>  p7_uid110_constMult_q <= "10000111100111010000001101110010010111111010000110010101";
                WHEN "110000" =>  p7_uid110_constMult_q <= "10001010011111111010110001011111000001010001000111110101";
                WHEN "110001" =>  p7_uid110_constMult_q <= "10001101011000100101010101001011101010101000001001010100";
                WHEN "110010" =>  p7_uid110_constMult_q <= "10010000010001001111111000111000010011111111001010110100";
                WHEN "110011" =>  p7_uid110_constMult_q <= "10010011001001111010011100100100111101010110001100010100";
                WHEN "110100" =>  p7_uid110_constMult_q <= "10010110000010100101000000010001100110101101001101110100";
                WHEN "110101" =>  p7_uid110_constMult_q <= "10011000111011001111100011111110010000000100001111010011";
                WHEN "110110" =>  p7_uid110_constMult_q <= "10011011110011111010000111101010111001011011010000110011";
                WHEN "110111" =>  p7_uid110_constMult_q <= "10011110101100100100101011010111100010110010010010010011";
                WHEN "111000" =>  p7_uid110_constMult_q <= "10100001100101001111001111000100001100001001010011110011";
                WHEN "111001" =>  p7_uid110_constMult_q <= "10100100011101111001110010110000110101100000010101010010";
                WHEN "111010" =>  p7_uid110_constMult_q <= "10100111010110100100010110011101011110110111010110110010";
                WHEN "111011" =>  p7_uid110_constMult_q <= "10101010001111001110111010001010001000001110011000010010";
                WHEN "111100" =>  p7_uid110_constMult_q <= "10101101000111111001011101110110110001100101011001110010";
                WHEN "111101" =>  p7_uid110_constMult_q <= "10110000000000100100000001100011011010111100011011010001";
                WHEN "111110" =>  p7_uid110_constMult_q <= "10110010111001001110100101010000000100010011011100110001";
                WHEN "111111" =>  p7_uid110_constMult_q <= "10110101110001111001001000111100101101101010011110010001";
                WHEN OTHERS =>
                    p7_uid110_constMult_q <= "00000000000000000000000000000000000000000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv8_uid108_constMult(BITSELECT,107)@0
    xv8_uid108_constMult_in <= fxpInPreAlign_uid36_fpExpETest_b;
    xv8_uid108_constMult_b <= xv8_uid108_constMult_in(53 downto 48);

	--reg_xv8_uid108_constMult_0_to_p8_uid109_constMult_0(REG,342)@0
    reg_xv8_uid108_constMult_0_to_p8_uid109_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv8_uid108_constMult_0_to_p8_uid109_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv8_uid108_constMult_0_to_p8_uid109_constMult_0_q <= xv8_uid108_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--p8_uid109_constMult(LOOKUP,108)@1
    p8_uid109_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p8_uid109_constMult_q <= "00000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_xv8_uid108_constMult_0_to_p8_uid109_constMult_0_q) IS
                WHEN "000000" =>  p8_uid109_constMult_q <= "00000000000000000000000000000000000000000000000000000000000000";
                WHEN "000001" =>  p8_uid109_constMult_q <= "00000010111000101010100011101100101001010111000001011111110001";
                WHEN "000010" =>  p8_uid109_constMult_q <= "00000101110001010101000111011001010010101110000010111111100010";
                WHEN "000011" =>  p8_uid109_constMult_q <= "00001000101001111111101011000101111100000101000100011111010010";
                WHEN "000100" =>  p8_uid109_constMult_q <= "00001011100010101010001110110010100101011100000101111111000011";
                WHEN "000101" =>  p8_uid109_constMult_q <= "00001110011011010100110010011111001110110011000111011110110100";
                WHEN "000110" =>  p8_uid109_constMult_q <= "00010001010011111111010110001011111000001010001000111110100100";
                WHEN "000111" =>  p8_uid109_constMult_q <= "00010100001100101001111001111000100001100001001010011110010101";
                WHEN "001000" =>  p8_uid109_constMult_q <= "00010111000101010100011101100101001010111000001011111110000110";
                WHEN "001001" =>  p8_uid109_constMult_q <= "00011001111101111111000001010001110100001111001101011101110111";
                WHEN "001010" =>  p8_uid109_constMult_q <= "00011100110110101001100100111110011101100110001110111101101000";
                WHEN "001011" =>  p8_uid109_constMult_q <= "00011111101111010100001000101011000110111101010000011101011000";
                WHEN "001100" =>  p8_uid109_constMult_q <= "00100010100111111110101100010111110000010100010001111101001001";
                WHEN "001101" =>  p8_uid109_constMult_q <= "00100101100000101001010000000100011001101011010011011100111010";
                WHEN "001110" =>  p8_uid109_constMult_q <= "00101000011001010011110011110001000011000010010100111100101010";
                WHEN "001111" =>  p8_uid109_constMult_q <= "00101011010001111110010111011101101100011001010110011100011011";
                WHEN "010000" =>  p8_uid109_constMult_q <= "00101110001010101000111011001010010101110000010111111100001100";
                WHEN "010001" =>  p8_uid109_constMult_q <= "00110001000011010011011110110110111111000111011001011011111101";
                WHEN "010010" =>  p8_uid109_constMult_q <= "00110011111011111110000010100011101000011110011010111011101110";
                WHEN "010011" =>  p8_uid109_constMult_q <= "00110110110100101000100110010000010001110101011100011011011110";
                WHEN "010100" =>  p8_uid109_constMult_q <= "00111001101101010011001001111100111011001100011101111011001111";
                WHEN "010101" =>  p8_uid109_constMult_q <= "00111100100101111101101101101001100100100011011111011011000000";
                WHEN "010110" =>  p8_uid109_constMult_q <= "00111111011110101000010001010110001101111010100000111010110000";
                WHEN "010111" =>  p8_uid109_constMult_q <= "01000010010111010010110101000010110111010001100010011010100001";
                WHEN "011000" =>  p8_uid109_constMult_q <= "01000101001111111101011000101111100000101000100011111010010010";
                WHEN "011001" =>  p8_uid109_constMult_q <= "01001000001000100111111100011100001001111111100101011010000011";
                WHEN "011010" =>  p8_uid109_constMult_q <= "01001011000001010010100000001000110011010110100110111001110100";
                WHEN "011011" =>  p8_uid109_constMult_q <= "01001101111001111101000011110101011100101101101000011001100100";
                WHEN "011100" =>  p8_uid109_constMult_q <= "01010000110010100111100111100010000110000100101001111001010101";
                WHEN "011101" =>  p8_uid109_constMult_q <= "01010011101011010010001011001110101111011011101011011001000110";
                WHEN "011110" =>  p8_uid109_constMult_q <= "01010110100011111100101110111011011000110010101100111000110110";
                WHEN "011111" =>  p8_uid109_constMult_q <= "01011001011100100111010010101000000010001001101110011000100111";
                WHEN "100000" =>  p8_uid109_constMult_q <= "10100011101010101110001001101011010100011111010000000111101000";
                WHEN "100001" =>  p8_uid109_constMult_q <= "10100110100011011000101101010111111101110110010001100111011001";
                WHEN "100010" =>  p8_uid109_constMult_q <= "10101001011100000011010001000100100111001101010011000111001010";
                WHEN "100011" =>  p8_uid109_constMult_q <= "10101100010100101101110100110001010000100100010100100110111010";
                WHEN "100100" =>  p8_uid109_constMult_q <= "10101111001101011000011000011101111001111011010110000110101011";
                WHEN "100101" =>  p8_uid109_constMult_q <= "10110010000110000010111100001010100011010010010111100110011100";
                WHEN "100110" =>  p8_uid109_constMult_q <= "10110100111110101101011111110111001100101001011001000110001100";
                WHEN "100111" =>  p8_uid109_constMult_q <= "10110111110111011000000011100011110110000000011010100101111101";
                WHEN "101000" =>  p8_uid109_constMult_q <= "10111010110000000010100111010000011111010111011100000101101110";
                WHEN "101001" =>  p8_uid109_constMult_q <= "10111101101000101101001010111101001000101110011101100101011111";
                WHEN "101010" =>  p8_uid109_constMult_q <= "11000000100001010111101110101001110010000101011111000101010000";
                WHEN "101011" =>  p8_uid109_constMult_q <= "11000011011010000010010010010110011011011100100000100101000000";
                WHEN "101100" =>  p8_uid109_constMult_q <= "11000110010010101100110110000011000100110011100010000100110001";
                WHEN "101101" =>  p8_uid109_constMult_q <= "11001001001011010111011001101111101110001010100011100100100010";
                WHEN "101110" =>  p8_uid109_constMult_q <= "11001100000100000001111101011100010111100001100101000100010010";
                WHEN "101111" =>  p8_uid109_constMult_q <= "11001110111100101100100001001001000000111000100110100100000011";
                WHEN "110000" =>  p8_uid109_constMult_q <= "11010001110101010111000100110101101010001111101000000011110100";
                WHEN "110001" =>  p8_uid109_constMult_q <= "11010100101110000001101000100010010011100110101001100011100101";
                WHEN "110010" =>  p8_uid109_constMult_q <= "11010111100110101100001100001110111100111101101011000011010110";
                WHEN "110011" =>  p8_uid109_constMult_q <= "11011010011111010110101111111011100110010100101100100011000110";
                WHEN "110100" =>  p8_uid109_constMult_q <= "11011101011000000001010011101000001111101011101110000010110111";
                WHEN "110101" =>  p8_uid109_constMult_q <= "11100000010000101011110111010100111001000010101111100010101000";
                WHEN "110110" =>  p8_uid109_constMult_q <= "11100011001001010110011011000001100010011001110001000010011000";
                WHEN "110111" =>  p8_uid109_constMult_q <= "11100110000010000000111110101110001011110000110010100010001001";
                WHEN "111000" =>  p8_uid109_constMult_q <= "11101000111010101011100010011010110101000111110100000001111010";
                WHEN "111001" =>  p8_uid109_constMult_q <= "11101011110011010110000110000111011110011110110101100001101011";
                WHEN "111010" =>  p8_uid109_constMult_q <= "11101110101100000000101001110100000111110101110111000001011100";
                WHEN "111011" =>  p8_uid109_constMult_q <= "11110001100100101011001101100000110001001100111000100001001100";
                WHEN "111100" =>  p8_uid109_constMult_q <= "11110100011101010101110001001101011010100011111010000000111101";
                WHEN "111101" =>  p8_uid109_constMult_q <= "11110111010110000000010100111010000011111010111011100000101110";
                WHEN "111110" =>  p8_uid109_constMult_q <= "11111010001110101010111000100110101101010001111101000000011110";
                WHEN "111111" =>  p8_uid109_constMult_q <= "11111101000111010101011100010011010110101000111110100000001111";
                WHEN OTHERS =>
                    p8_uid109_constMult_q <= "00000000000000000000000000000000000000000000000000000000000000";
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--lev1_a0_uid118_constMult(ADD,117)@2
    lev1_a0_uid118_constMult_a <= STD_LOGIC_VECTOR((63 downto 62 => p8_uid109_constMult_q(61)) & p8_uid109_constMult_q);
    lev1_a0_uid118_constMult_b <= STD_LOGIC_VECTOR('0' & "0000000" & p7_uid110_constMult_q);
    lev1_a0_uid118_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a0_uid118_constMult_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                lev1_a0_uid118_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0_uid118_constMult_a) + SIGNED(lev1_a0_uid118_constMult_b));
            END IF;
        END IF;
    END PROCESS;
    lev1_a0_uid118_constMult_q <= lev1_a0_uid118_constMult_o(62 downto 0);


	--lev2_a0_uid122_constMult(ADD,121)@3
    lev2_a0_uid122_constMult_a <= STD_LOGIC_VECTOR((64 downto 63 => lev1_a0_uid118_constMult_q(62)) & lev1_a0_uid118_constMult_q);
    lev2_a0_uid122_constMult_b <= STD_LOGIC_VECTOR('0' & "0000000000000" & lev1_a1_uid119_constMult_q);
    lev2_a0_uid122_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev2_a0_uid122_constMult_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                lev2_a0_uid122_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0_uid122_constMult_a) + SIGNED(lev2_a0_uid122_constMult_b));
            END IF;
        END IF;
    END PROCESS;
    lev2_a0_uid122_constMult_q <= lev2_a0_uid122_constMult_o(63 downto 0);


	--lev3_a0_uid124_constMult(ADD,123)@4
    lev3_a0_uid124_constMult_a <= STD_LOGIC_VECTOR((65 downto 64 => lev2_a0_uid122_constMult_q(63)) & lev2_a0_uid122_constMult_q);
    lev3_a0_uid124_constMult_b <= STD_LOGIC_VECTOR('0' & "0000000000000000000000000" & lev2_a1_uid123_constMult_q);
    lev3_a0_uid124_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev3_a0_uid124_constMult_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                lev3_a0_uid124_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev3_a0_uid124_constMult_a) + SIGNED(lev3_a0_uid124_constMult_b));
            END IF;
        END IF;
    END PROCESS;
    lev3_a0_uid124_constMult_q <= lev3_a0_uid124_constMult_o(64 downto 0);


	--lev4_a0_uid125_constMult(ADD,124)@5
    lev4_a0_uid125_constMult_a <= STD_LOGIC_VECTOR((66 downto 65 => lev3_a0_uid124_constMult_q(64)) & lev3_a0_uid124_constMult_q);
    lev4_a0_uid125_constMult_b <= STD_LOGIC_VECTOR('0' & "0000000000000000000000000000000000000000000000000000" & p0_uid117_constMult_q);
            lev4_a0_uid125_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev4_a0_uid125_constMult_a) + SIGNED(lev4_a0_uid125_constMult_b));
    lev4_a0_uid125_constMult_q <= lev4_a0_uid125_constMult_o(65 downto 0);


	--sR_uid126_constMult(BITSELECT,125)@5
    sR_uid126_constMult_in <= lev4_a0_uid125_constMult_q(61 downto 0);
    sR_uid126_constMult_b <= sR_uid126_constMult_in(61 downto 4);

	--oFracXZwE_uid39_fpExpETest(BITJOIN,38)@5
    oFracXZwE_uid39_fpExpETest_q <= sR_uid126_constMult_b & cstZeroWE_uid11_fpExpETest_q;

	--msbx_uid128_fxpInPostAlign_uid45_fpExpETest(BITSELECT,127)@5
    msbx_uid128_fxpInPostAlign_uid45_fpExpETest_in <= oFracXZwE_uid39_fpExpETest_q;
    msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b <= msbx_uid128_fxpInPostAlign_uid45_fpExpETest_in(68 downto 68);

	--ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_b(DELAY,581)@5
    ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b, xout => ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage3Idx1Pad1_uid170_fxpInPostAlign_uid45_fpExpETest(LOGICAL,169)@7
    rightShiftStage3Idx1Pad1_uid170_fxpInPostAlign_uid45_fpExpETest_a <= GND_q;
    rightShiftStage3Idx1Pad1_uid170_fxpInPostAlign_uid45_fpExpETest_b <= ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_b_q;
    rightShiftStage3Idx1Pad1_uid170_fxpInPostAlign_uid45_fpExpETest_q_i <= rightShiftStage3Idx1Pad1_uid170_fxpInPostAlign_uid45_fpExpETest_a or rightShiftStage3Idx1Pad1_uid170_fxpInPostAlign_uid45_fpExpETest_b;
    rightShiftStage3Idx1Pad1_uid170_fxpInPostAlign_uid45_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => rightShiftStage3Idx1Pad1_uid170_fxpInPostAlign_uid45_fpExpETest_q, xin => rightShiftStage3Idx1Pad1_uid170_fxpInPostAlign_uid45_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage268dto1_uid171_fxpInPostAlign_uid45_fpExpETest(BITSELECT,170)@8
    RightShiftStage268dto1_uid171_fxpInPostAlign_uid45_fpExpETest_in <= rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_q;
    RightShiftStage268dto1_uid171_fxpInPostAlign_uid45_fpExpETest_b <= RightShiftStage268dto1_uid171_fxpInPostAlign_uid45_fpExpETest_in(68 downto 1);

	--rightShiftStage3Idx1_uid172_fxpInPostAlign_uid45_fpExpETest(BITJOIN,171)@8
    rightShiftStage3Idx1_uid172_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage3Idx1Pad1_uid170_fxpInPostAlign_uid45_fpExpETest_q & RightShiftStage268dto1_uid171_fxpInPostAlign_uid45_fpExpETest_b;

	--z_uid163_fxpInPostAlign_uid45_fpExpETest(CONSTANT,162)
    z_uid163_fxpInPostAlign_uid45_fpExpETest_q <= "000000";

	--rightShiftStage2Idx3Pad6_uid164_fxpInPostAlign_uid45_fpExpETest(LOGICAL,163)@7
    rightShiftStage2Idx3Pad6_uid164_fxpInPostAlign_uid45_fpExpETest_a <= z_uid163_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage2Idx3Pad6_uid164_fxpInPostAlign_uid45_fpExpETest_b <= STD_LOGIC_VECTOR((5 downto 1 => ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_b_q(0)) & ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_b_q);
    rightShiftStage2Idx3Pad6_uid164_fxpInPostAlign_uid45_fpExpETest_q_i <= rightShiftStage2Idx3Pad6_uid164_fxpInPostAlign_uid45_fpExpETest_a or rightShiftStage2Idx3Pad6_uid164_fxpInPostAlign_uid45_fpExpETest_b;
    rightShiftStage2Idx3Pad6_uid164_fxpInPostAlign_uid45_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 6, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx3Pad6_uid164_fxpInPostAlign_uid45_fpExpETest_q, xin => rightShiftStage2Idx3Pad6_uid164_fxpInPostAlign_uid45_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_b(DELAY,563)@5
    ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b, xout => ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--z_uid149_fxpInPostAlign_uid45_fpExpETest(CONSTANT,148)
    z_uid149_fxpInPostAlign_uid45_fpExpETest_q <= "000000000000000000000000";

	--rightShiftStage1Idx3Pad24_uid150_fxpInPostAlign_uid45_fpExpETest(LOGICAL,149)@6
    rightShiftStage1Idx3Pad24_uid150_fxpInPostAlign_uid45_fpExpETest_a <= z_uid149_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage1Idx3Pad24_uid150_fxpInPostAlign_uid45_fpExpETest_b <= STD_LOGIC_VECTOR((23 downto 1 => ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_b_q(0)) & ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_b_q);
    rightShiftStage1Idx3Pad24_uid150_fxpInPostAlign_uid45_fpExpETest_q_i <= rightShiftStage1Idx3Pad24_uid150_fxpInPostAlign_uid45_fpExpETest_a or rightShiftStage1Idx3Pad24_uid150_fxpInPostAlign_uid45_fpExpETest_b;
    rightShiftStage1Idx3Pad24_uid150_fxpInPostAlign_uid45_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 24, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx3Pad24_uid150_fxpInPostAlign_uid45_fpExpETest_q, xin => rightShiftStage1Idx3Pad24_uid150_fxpInPostAlign_uid45_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--rightShiftStage0Idx3_uid137_fxpInPostAlign_uid45_fpExpETest(CONSTANT,136)
    rightShiftStage0Idx3_uid137_fxpInPostAlign_uid45_fpExpETest_q <= "000000000000000000000000000000000000000000000000000000000000000000000";

	--rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest(LOGICAL,137)@5
    rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest_a <= rightShiftStage0Idx3_uid137_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest_b <= STD_LOGIC_VECTOR((68 downto 1 => msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b(0)) & msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b);
    rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest_q_i <= rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest_a or rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest_b;
    rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 69, depth => 1)
    PORT MAP (xout => rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest_q, xin => rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--z_uid133_fxpInPostAlign_uid45_fpExpETest(CONSTANT,132)
    z_uid133_fxpInPostAlign_uid45_fpExpETest_q <= "0000000000000000000000000000000000000000000000000000000000000000";

	--rightShiftStage0Idx2Pad64_uid134_fxpInPostAlign_uid45_fpExpETest(LOGICAL,133)@5
    rightShiftStage0Idx2Pad64_uid134_fxpInPostAlign_uid45_fpExpETest_a <= z_uid133_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage0Idx2Pad64_uid134_fxpInPostAlign_uid45_fpExpETest_b <= STD_LOGIC_VECTOR((63 downto 1 => msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b(0)) & msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b);
    rightShiftStage0Idx2Pad64_uid134_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage0Idx2Pad64_uid134_fxpInPostAlign_uid45_fpExpETest_a or rightShiftStage0Idx2Pad64_uid134_fxpInPostAlign_uid45_fpExpETest_b;

	--X68dto64_uid135_fxpInPostAlign_uid45_fpExpETest(BITSELECT,134)@5
    X68dto64_uid135_fxpInPostAlign_uid45_fpExpETest_in <= oFracXZwE_uid39_fpExpETest_q;
    X68dto64_uid135_fxpInPostAlign_uid45_fpExpETest_b <= X68dto64_uid135_fxpInPostAlign_uid45_fpExpETest_in(68 downto 64);

	--rightShiftStage0Idx2_uid136_fxpInPostAlign_uid45_fpExpETest(BITJOIN,135)@5
    rightShiftStage0Idx2_uid136_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage0Idx2Pad64_uid134_fxpInPostAlign_uid45_fpExpETest_q & X68dto64_uid135_fxpInPostAlign_uid45_fpExpETest_b;

	--reg_rightShiftStage0Idx2_uid136_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_4(REG,354)@5
    reg_rightShiftStage0Idx2_uid136_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx2_uid136_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_4_q <= "000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx2_uid136_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_4_q <= rightShiftStage0Idx2_uid136_fxpInPostAlign_uid45_fpExpETest_q;
            END IF;
        END IF;
    END PROCESS;


	--z_uid129_fxpInPostAlign_uid45_fpExpETest(CONSTANT,128)
    z_uid129_fxpInPostAlign_uid45_fpExpETest_q <= "00000000000000000000000000000000";

	--rightShiftStage0Idx1Pad32_uid130_fxpInPostAlign_uid45_fpExpETest(LOGICAL,129)@5
    rightShiftStage0Idx1Pad32_uid130_fxpInPostAlign_uid45_fpExpETest_a <= z_uid129_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage0Idx1Pad32_uid130_fxpInPostAlign_uid45_fpExpETest_b <= STD_LOGIC_VECTOR((31 downto 1 => msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b(0)) & msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b);
    rightShiftStage0Idx1Pad32_uid130_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage0Idx1Pad32_uid130_fxpInPostAlign_uid45_fpExpETest_a or rightShiftStage0Idx1Pad32_uid130_fxpInPostAlign_uid45_fpExpETest_b;

	--X68dto32_uid131_fxpInPostAlign_uid45_fpExpETest(BITSELECT,130)@5
    X68dto32_uid131_fxpInPostAlign_uid45_fpExpETest_in <= oFracXZwE_uid39_fpExpETest_q;
    X68dto32_uid131_fxpInPostAlign_uid45_fpExpETest_b <= X68dto32_uid131_fxpInPostAlign_uid45_fpExpETest_in(68 downto 32);

	--rightShiftStage0Idx1_uid132_fxpInPostAlign_uid45_fpExpETest(BITJOIN,131)@5
    rightShiftStage0Idx1_uid132_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage0Idx1Pad32_uid130_fxpInPostAlign_uid45_fpExpETest_q & X68dto32_uid131_fxpInPostAlign_uid45_fpExpETest_b;

	--reg_rightShiftStage0Idx1_uid132_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_3(REG,353)@5
    reg_rightShiftStage0Idx1_uid132_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx1_uid132_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_3_q <= "000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx1_uid132_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_3_q <= rightShiftStage0Idx1_uid132_fxpInPostAlign_uid45_fpExpETest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_oFracXZwE_uid39_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_2(REG,352)@5
    reg_oFracXZwE_uid39_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracXZwE_uid39_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_2_q <= "000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracXZwE_uid39_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_2_q <= oFracXZwE_uid39_fpExpETest_q;
            END IF;
        END IF;
    END PROCESS;


	--cstBiasPWE_uid14_fpExpETest(CONSTANT,13)
    cstBiasPWE_uid14_fpExpETest_q <= "1000001";

	--ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable(LOGICAL,884)
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_a <= en;
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q <= not ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_a;

	--ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_nor(LOGICAL,885)
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_nor_b <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_sticky_ena_q;
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_nor_q <= not (ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_nor_a or ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_nor_b);

	--ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_mem_top(CONSTANT,881)
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_mem_top_q <= "010";

	--ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmp(LOGICAL,882)
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmp_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_mem_top_q;
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdmux_q);
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmp_q <= "1" when ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmp_a = ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmp_b else "0";

	--ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmpReg(REG,883)
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmpReg_q <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_sticky_ena(REG,886)
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_nor_q = "1") THEN
                ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_sticky_ena_q <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_enaAnd(LOGICAL,887)
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_enaAnd_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_sticky_ena_q;
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_enaAnd_b <= en;
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_enaAnd_q <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_enaAnd_a and ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_enaAnd_b;

	--expX_uid6_fpExpETest(BITSELECT,5)@0
    expX_uid6_fpExpETest_in <= a(62 downto 0);
    expX_uid6_fpExpETest_b <= expX_uid6_fpExpETest_in(62 downto 52);

	--cstBiasPWE_uid13_fpExpETest(CONSTANT,12)
    cstBiasPWE_uid13_fpExpETest_q <= "10000001010";

	--shiftValuePreSat_uid40_fpExpETest(SUB,39)@0
    shiftValuePreSat_uid40_fpExpETest_a <= STD_LOGIC_VECTOR("0" & cstBiasPWE_uid13_fpExpETest_q);
    shiftValuePreSat_uid40_fpExpETest_b <= STD_LOGIC_VECTOR("0" & expX_uid6_fpExpETest_b);
            shiftValuePreSat_uid40_fpExpETest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValuePreSat_uid40_fpExpETest_a) - UNSIGNED(shiftValuePreSat_uid40_fpExpETest_b));
    shiftValuePreSat_uid40_fpExpETest_q <= shiftValuePreSat_uid40_fpExpETest_o(11 downto 0);


	--shiftValuePreSatRed_uid43_fpExpETest(BITSELECT,42)@0
    shiftValuePreSatRed_uid43_fpExpETest_in <= shiftValuePreSat_uid40_fpExpETest_q(6 downto 0);
    shiftValuePreSatRed_uid43_fpExpETest_b <= shiftValuePreSatRed_uid43_fpExpETest_in(6 downto 0);

	--ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_inputreg(DELAY,875)
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => shiftValuePreSatRed_uid43_fpExpETest_b, xout => ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt(COUNTER,877)
    -- every=1, low=0, high=2, step=1, init=1
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_i = 1 THEN
                      ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_eq = '1') THEN
                        ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_i <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_i - 2;
                    ELSE
                        ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_i <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_i,2));


	--ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdreg(REG,878)
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdreg_q <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdmux(MUX,879)
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdmux_s <= en;
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdmux: PROCESS (ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdmux_s, ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdreg_q, ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_q)
    BEGIN
            CASE ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdmux_s IS
                  WHEN "0" => ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdmux_q <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdreg_q;
                  WHEN "1" => ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdmux_q <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem(DUALMEM,876)
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_ia <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_inputreg_q;
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_aa <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdreg_q;
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_ab <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_rdmux_q;
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 7,
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
        clocken1 => ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_iq,
        address_a => ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_aa,
        data_a => ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_ia
    );
    ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_reset0 <= areset;
        ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_q <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_iq(6 downto 0);

	--reg_shiftValuePreSat_uid40_fpExpETest_0_to_shiftUdf_uid42_fpExpETest_0(REG,341)@0
    reg_shiftValuePreSat_uid40_fpExpETest_0_to_shiftUdf_uid42_fpExpETest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_shiftValuePreSat_uid40_fpExpETest_0_to_shiftUdf_uid42_fpExpETest_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_shiftValuePreSat_uid40_fpExpETest_0_to_shiftUdf_uid42_fpExpETest_0_q <= shiftValuePreSat_uid40_fpExpETest_q;
            END IF;
        END IF;
    END PROCESS;


	--shiftUdf_uid42_fpExpETest(COMPARE,41)@1
    shiftUdf_uid42_fpExpETest_cin <= GND_q;
    shiftUdf_uid42_fpExpETest_a <= STD_LOGIC_VECTOR((13 downto 12 => reg_shiftValuePreSat_uid40_fpExpETest_0_to_shiftUdf_uid42_fpExpETest_0_q(11)) & reg_shiftValuePreSat_uid40_fpExpETest_0_to_shiftUdf_uid42_fpExpETest_0_q) & '0';
    shiftUdf_uid42_fpExpETest_b <= STD_LOGIC_VECTOR('0' & "000000" & cstBiasPWE_uid14_fpExpETest_q) & shiftUdf_uid42_fpExpETest_cin(0);
            shiftUdf_uid42_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(shiftUdf_uid42_fpExpETest_a) - SIGNED(shiftUdf_uid42_fpExpETest_b));
    shiftUdf_uid42_fpExpETest_n(0) <= not shiftUdf_uid42_fpExpETest_o(14);


	--ld_shiftUdf_uid42_fpExpETest_n_to_shiftVal_uid44_fpExpETest_b(DELAY,451)@1
    ld_shiftUdf_uid42_fpExpETest_n_to_shiftVal_uid44_fpExpETest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => shiftUdf_uid42_fpExpETest_n, xout => ld_shiftUdf_uid42_fpExpETest_n_to_shiftVal_uid44_fpExpETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--shiftVal_uid44_fpExpETest(MUX,43)@5
    shiftVal_uid44_fpExpETest_s <= ld_shiftUdf_uid42_fpExpETest_n_to_shiftVal_uid44_fpExpETest_b_q;
    shiftVal_uid44_fpExpETest: PROCESS (shiftVal_uid44_fpExpETest_s, en, ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_q, cstBiasPWE_uid14_fpExpETest_q)
    BEGIN
            CASE shiftVal_uid44_fpExpETest_s IS
                  WHEN "0" => shiftVal_uid44_fpExpETest_q <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_replace_mem_q;
                  WHEN "1" => shiftVal_uid44_fpExpETest_q <= cstBiasPWE_uid14_fpExpETest_q;
                  WHEN OTHERS => shiftVal_uid44_fpExpETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest(BITSELECT,138)@5
    rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_in <= shiftVal_uid44_fpExpETest_q;
    rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_b <= rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_in(6 downto 5);

	--reg_rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_1(REG,351)@5
    reg_rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_1_q <= rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest(MUX,139)@6
    rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_s <= reg_rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_1_q;
    rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest: PROCESS (rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_s, en, reg_oFracXZwE_uid39_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_2_q, reg_rightShiftStage0Idx1_uid132_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_3_q, reg_rightShiftStage0Idx2_uid136_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_4_q, rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest_q)
    BEGIN
            CASE rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_s IS
                  WHEN "00" => rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_q <= reg_oFracXZwE_uid39_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_2_q;
                  WHEN "01" => rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_q <= reg_rightShiftStage0Idx1_uid132_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_3_q;
                  WHEN "10" => rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_q <= reg_rightShiftStage0Idx2_uid136_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_4_q;
                  WHEN "11" => rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage0Idx3_uid138_fxpInPostAlign_uid45_fpExpETest_q;
                  WHEN OTHERS => rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage068dto24_uid151_fxpInPostAlign_uid45_fpExpETest(BITSELECT,150)@6
    RightShiftStage068dto24_uid151_fxpInPostAlign_uid45_fpExpETest_in <= rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_q;
    RightShiftStage068dto24_uid151_fxpInPostAlign_uid45_fpExpETest_b <= RightShiftStage068dto24_uid151_fxpInPostAlign_uid45_fpExpETest_in(68 downto 24);

	--ld_RightShiftStage068dto24_uid151_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx3_uid152_fxpInPostAlign_uid45_fpExpETest_a(DELAY,573)@6
    ld_RightShiftStage068dto24_uid151_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx3_uid152_fxpInPostAlign_uid45_fpExpETest_a : dspba_delay
    GENERIC MAP ( width => 45, depth => 1 )
    PORT MAP ( xin => RightShiftStage068dto24_uid151_fxpInPostAlign_uid45_fpExpETest_b, xout => ld_RightShiftStage068dto24_uid151_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx3_uid152_fxpInPostAlign_uid45_fpExpETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid152_fxpInPostAlign_uid45_fpExpETest(BITJOIN,151)@7
    rightShiftStage1Idx3_uid152_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage1Idx3Pad24_uid150_fxpInPostAlign_uid45_fpExpETest_q & ld_RightShiftStage068dto24_uid151_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx3_uid152_fxpInPostAlign_uid45_fpExpETest_a_q;

	--z_uid145_fxpInPostAlign_uid45_fpExpETest(CONSTANT,144)
    z_uid145_fxpInPostAlign_uid45_fpExpETest_q <= "0000000000000000";

	--rightShiftStage1Idx2Pad16_uid146_fxpInPostAlign_uid45_fpExpETest(LOGICAL,145)@6
    rightShiftStage1Idx2Pad16_uid146_fxpInPostAlign_uid45_fpExpETest_a <= z_uid145_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage1Idx2Pad16_uid146_fxpInPostAlign_uid45_fpExpETest_b <= STD_LOGIC_VECTOR((15 downto 1 => ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_b_q(0)) & ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_b_q);
    rightShiftStage1Idx2Pad16_uid146_fxpInPostAlign_uid45_fpExpETest_q_i <= rightShiftStage1Idx2Pad16_uid146_fxpInPostAlign_uid45_fpExpETest_a or rightShiftStage1Idx2Pad16_uid146_fxpInPostAlign_uid45_fpExpETest_b;
    rightShiftStage1Idx2Pad16_uid146_fxpInPostAlign_uid45_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 16, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx2Pad16_uid146_fxpInPostAlign_uid45_fpExpETest_q, xin => rightShiftStage1Idx2Pad16_uid146_fxpInPostAlign_uid45_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage068dto16_uid147_fxpInPostAlign_uid45_fpExpETest(BITSELECT,146)@6
    RightShiftStage068dto16_uid147_fxpInPostAlign_uid45_fpExpETest_in <= rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_q;
    RightShiftStage068dto16_uid147_fxpInPostAlign_uid45_fpExpETest_b <= RightShiftStage068dto16_uid147_fxpInPostAlign_uid45_fpExpETest_in(68 downto 16);

	--ld_RightShiftStage068dto16_uid147_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx2_uid148_fxpInPostAlign_uid45_fpExpETest_a(DELAY,569)@6
    ld_RightShiftStage068dto16_uid147_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx2_uid148_fxpInPostAlign_uid45_fpExpETest_a : dspba_delay
    GENERIC MAP ( width => 53, depth => 1 )
    PORT MAP ( xin => RightShiftStage068dto16_uid147_fxpInPostAlign_uid45_fpExpETest_b, xout => ld_RightShiftStage068dto16_uid147_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx2_uid148_fxpInPostAlign_uid45_fpExpETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid148_fxpInPostAlign_uid45_fpExpETest(BITJOIN,147)@7
    rightShiftStage1Idx2_uid148_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage1Idx2Pad16_uid146_fxpInPostAlign_uid45_fpExpETest_q & ld_RightShiftStage068dto16_uid147_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx2_uid148_fxpInPostAlign_uid45_fpExpETest_a_q;

	--z_uid141_fxpInPostAlign_uid45_fpExpETest(CONSTANT,140)
    z_uid141_fxpInPostAlign_uid45_fpExpETest_q <= "00000000";

	--rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest(LOGICAL,141)@6
    rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_a <= z_uid141_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_b <= STD_LOGIC_VECTOR((7 downto 1 => ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_b_q(0)) & ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_b_q);
    rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_q_i <= rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_a or rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_b;
    rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 8, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_q, xin => rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage068dto8_uid143_fxpInPostAlign_uid45_fpExpETest(BITSELECT,142)@6
    RightShiftStage068dto8_uid143_fxpInPostAlign_uid45_fpExpETest_in <= rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_q;
    RightShiftStage068dto8_uid143_fxpInPostAlign_uid45_fpExpETest_b <= RightShiftStage068dto8_uid143_fxpInPostAlign_uid45_fpExpETest_in(68 downto 8);

	--ld_RightShiftStage068dto8_uid143_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1_uid144_fxpInPostAlign_uid45_fpExpETest_a(DELAY,565)@6
    ld_RightShiftStage068dto8_uid143_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1_uid144_fxpInPostAlign_uid45_fpExpETest_a : dspba_delay
    GENERIC MAP ( width => 61, depth => 1 )
    PORT MAP ( xin => RightShiftStage068dto8_uid143_fxpInPostAlign_uid45_fpExpETest_b, xout => ld_RightShiftStage068dto8_uid143_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1_uid144_fxpInPostAlign_uid45_fpExpETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid144_fxpInPostAlign_uid45_fpExpETest(BITJOIN,143)@7
    rightShiftStage1Idx1_uid144_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage1Idx1Pad8_uid142_fxpInPostAlign_uid45_fpExpETest_q & ld_RightShiftStage068dto8_uid143_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage1Idx1_uid144_fxpInPostAlign_uid45_fpExpETest_a_q;

	--reg_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_2(REG,356)@6
    reg_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_2_q <= "000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_2_q <= rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest(BITSELECT,152)@5
    rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_in <= shiftVal_uid44_fpExpETest_q(4 downto 0);
    rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_b <= rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_in(4 downto 3);

	--ld_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_1_a(DELAY,809)@5
    ld_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_b, xout => ld_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_1(REG,355)@6
    reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_1_q <= ld_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest(MUX,153)@7
    rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_s <= reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_1_q;
    rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest: PROCESS (rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_s, en, reg_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_2_q, rightShiftStage1Idx1_uid144_fxpInPostAlign_uid45_fpExpETest_q, rightShiftStage1Idx2_uid148_fxpInPostAlign_uid45_fpExpETest_q, rightShiftStage1Idx3_uid152_fxpInPostAlign_uid45_fpExpETest_q)
    BEGIN
            CASE rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_s IS
                  WHEN "00" => rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_q <= reg_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_2_q;
                  WHEN "01" => rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage1Idx1_uid144_fxpInPostAlign_uid45_fpExpETest_q;
                  WHEN "10" => rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage1Idx2_uid148_fxpInPostAlign_uid45_fpExpETest_q;
                  WHEN "11" => rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage1Idx3_uid152_fxpInPostAlign_uid45_fpExpETest_q;
                  WHEN OTHERS => rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage168dto6_uid165_fxpInPostAlign_uid45_fpExpETest(BITSELECT,164)@7
    RightShiftStage168dto6_uid165_fxpInPostAlign_uid45_fpExpETest_in <= rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_q;
    RightShiftStage168dto6_uid165_fxpInPostAlign_uid45_fpExpETest_b <= RightShiftStage168dto6_uid165_fxpInPostAlign_uid45_fpExpETest_in(68 downto 6);

	--ld_RightShiftStage168dto6_uid165_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx3_uid166_fxpInPostAlign_uid45_fpExpETest_a(DELAY,591)@7
    ld_RightShiftStage168dto6_uid165_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx3_uid166_fxpInPostAlign_uid45_fpExpETest_a : dspba_delay
    GENERIC MAP ( width => 63, depth => 1 )
    PORT MAP ( xin => RightShiftStage168dto6_uid165_fxpInPostAlign_uid45_fpExpETest_b, xout => ld_RightShiftStage168dto6_uid165_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx3_uid166_fxpInPostAlign_uid45_fpExpETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx3_uid166_fxpInPostAlign_uid45_fpExpETest(BITJOIN,165)@8
    rightShiftStage2Idx3_uid166_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage2Idx3Pad6_uid164_fxpInPostAlign_uid45_fpExpETest_q & ld_RightShiftStage168dto6_uid165_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx3_uid166_fxpInPostAlign_uid45_fpExpETest_a_q;

	--z_uid159_fxpInPostAlign_uid45_fpExpETest(CONSTANT,158)
    z_uid159_fxpInPostAlign_uid45_fpExpETest_q <= "0000";

	--rightShiftStage2Idx2Pad4_uid160_fxpInPostAlign_uid45_fpExpETest(LOGICAL,159)@7
    rightShiftStage2Idx2Pad4_uid160_fxpInPostAlign_uid45_fpExpETest_a <= z_uid159_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage2Idx2Pad4_uid160_fxpInPostAlign_uid45_fpExpETest_b <= STD_LOGIC_VECTOR((3 downto 1 => ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_b_q(0)) & ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_b_q);
    rightShiftStage2Idx2Pad4_uid160_fxpInPostAlign_uid45_fpExpETest_q_i <= rightShiftStage2Idx2Pad4_uid160_fxpInPostAlign_uid45_fpExpETest_a or rightShiftStage2Idx2Pad4_uid160_fxpInPostAlign_uid45_fpExpETest_b;
    rightShiftStage2Idx2Pad4_uid160_fxpInPostAlign_uid45_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 4, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx2Pad4_uid160_fxpInPostAlign_uid45_fpExpETest_q, xin => rightShiftStage2Idx2Pad4_uid160_fxpInPostAlign_uid45_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage168dto4_uid161_fxpInPostAlign_uid45_fpExpETest(BITSELECT,160)@7
    RightShiftStage168dto4_uid161_fxpInPostAlign_uid45_fpExpETest_in <= rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_q;
    RightShiftStage168dto4_uid161_fxpInPostAlign_uid45_fpExpETest_b <= RightShiftStage168dto4_uid161_fxpInPostAlign_uid45_fpExpETest_in(68 downto 4);

	--ld_RightShiftStage168dto4_uid161_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx2_uid162_fxpInPostAlign_uid45_fpExpETest_a(DELAY,587)@7
    ld_RightShiftStage168dto4_uid161_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx2_uid162_fxpInPostAlign_uid45_fpExpETest_a : dspba_delay
    GENERIC MAP ( width => 65, depth => 1 )
    PORT MAP ( xin => RightShiftStage168dto4_uid161_fxpInPostAlign_uid45_fpExpETest_b, xout => ld_RightShiftStage168dto4_uid161_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx2_uid162_fxpInPostAlign_uid45_fpExpETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx2_uid162_fxpInPostAlign_uid45_fpExpETest(BITJOIN,161)@8
    rightShiftStage2Idx2_uid162_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage2Idx2Pad4_uid160_fxpInPostAlign_uid45_fpExpETest_q & ld_RightShiftStage168dto4_uid161_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx2_uid162_fxpInPostAlign_uid45_fpExpETest_a_q;

	--z_uid155_fxpInPostAlign_uid45_fpExpETest(CONSTANT,154)
    z_uid155_fxpInPostAlign_uid45_fpExpETest_q <= "00";

	--rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest(LOGICAL,155)@7
    rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_a <= z_uid155_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_b <= STD_LOGIC_VECTOR((1 downto 1 => ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_b_q(0)) & ld_msbx_uid128_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_b_q);
    rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_q_i <= rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_a or rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_b;
    rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 2, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_q, xin => rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage168dto2_uid157_fxpInPostAlign_uid45_fpExpETest(BITSELECT,156)@7
    RightShiftStage168dto2_uid157_fxpInPostAlign_uid45_fpExpETest_in <= rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_q;
    RightShiftStage168dto2_uid157_fxpInPostAlign_uid45_fpExpETest_b <= RightShiftStage168dto2_uid157_fxpInPostAlign_uid45_fpExpETest_in(68 downto 2);

	--ld_RightShiftStage168dto2_uid157_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1_uid158_fxpInPostAlign_uid45_fpExpETest_a(DELAY,583)@7
    ld_RightShiftStage168dto2_uid157_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1_uid158_fxpInPostAlign_uid45_fpExpETest_a : dspba_delay
    GENERIC MAP ( width => 67, depth => 1 )
    PORT MAP ( xin => RightShiftStage168dto2_uid157_fxpInPostAlign_uid45_fpExpETest_b, xout => ld_RightShiftStage168dto2_uid157_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1_uid158_fxpInPostAlign_uid45_fpExpETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx1_uid158_fxpInPostAlign_uid45_fpExpETest(BITJOIN,157)@8
    rightShiftStage2Idx1_uid158_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage2Idx1Pad2_uid156_fxpInPostAlign_uid45_fpExpETest_q & ld_RightShiftStage168dto2_uid157_fxpInPostAlign_uid45_fpExpETest_b_to_rightShiftStage2Idx1_uid158_fxpInPostAlign_uid45_fpExpETest_a_q;

	--reg_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_2(REG,358)@7
    reg_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_2_q <= "000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_2_q <= rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest(BITSELECT,166)@5
    rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_in <= shiftVal_uid44_fpExpETest_q(2 downto 0);
    rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_b <= rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_in(2 downto 1);

	--ld_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_1_a(DELAY,811)@5
    ld_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 2 )
    PORT MAP ( xin => rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_b, xout => ld_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_1(REG,357)@7
    reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_1_q <= ld_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest(MUX,167)@8
    rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_s <= reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_1_q;
    rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest: PROCESS (rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_s, en, reg_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_2_q, rightShiftStage2Idx1_uid158_fxpInPostAlign_uid45_fpExpETest_q, rightShiftStage2Idx2_uid162_fxpInPostAlign_uid45_fpExpETest_q, rightShiftStage2Idx3_uid166_fxpInPostAlign_uid45_fpExpETest_q)
    BEGIN
            CASE rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_s IS
                  WHEN "00" => rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_q <= reg_rightShiftStage1_uid154_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_2_q;
                  WHEN "01" => rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage2Idx1_uid158_fxpInPostAlign_uid45_fpExpETest_q;
                  WHEN "10" => rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage2Idx2_uid162_fxpInPostAlign_uid45_fpExpETest_q;
                  WHEN "11" => rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage2Idx3_uid166_fxpInPostAlign_uid45_fpExpETest_q;
                  WHEN OTHERS => rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest(BITSELECT,172)@5
    rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_in <= shiftVal_uid44_fpExpETest_q(0 downto 0);
    rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_b <= rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_in(0 downto 0);

	--ld_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_1_a(DELAY,813)@5
    ld_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_b, xout => ld_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_1(REG,359)@7
    reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_1_q <= ld_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest(MUX,173)@8
    rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_s <= reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_1_q;
    rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest: PROCESS (rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_s, en, rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_q, rightShiftStage3Idx1_uid172_fxpInPostAlign_uid45_fpExpETest_q)
    BEGIN
            CASE rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_s IS
                  WHEN "0" => rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage2_uid168_fxpInPostAlign_uid45_fpExpETest_q;
                  WHEN "1" => rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_q <= rightShiftStage3Idx1_uid172_fxpInPostAlign_uid45_fpExpETest_q;
                  WHEN OTHERS => rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ePreRnd_uid46_fpExpETest(BITSELECT,45)@8
    ePreRnd_uid46_fpExpETest_in <= rightShiftStage3_uid174_fxpInPostAlign_uid45_fpExpETest_q;
    ePreRnd_uid46_fpExpETest_b <= ePreRnd_uid46_fpExpETest_in(68 downto 55);

	--xv0_uid176_constMult(BITSELECT,175)@8
    xv0_uid176_constMult_in <= ePreRnd_uid46_fpExpETest_b(5 downto 0);
    xv0_uid176_constMult_b <= xv0_uid176_constMult_in(5 downto 0);

	--ld_xv0_uid176_constMult_b_to_reg_xv0_uid176_constMult_0_to_p0_uid181_constMult_0_a(DELAY,826)@8
    ld_xv0_uid176_constMult_b_to_reg_xv0_uid176_constMult_0_to_p0_uid181_constMult_0_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 2 )
    PORT MAP ( xin => xv0_uid176_constMult_b, xout => ld_xv0_uid176_constMult_b_to_reg_xv0_uid176_constMult_0_to_p0_uid181_constMult_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_xv0_uid176_constMult_0_to_p0_uid181_constMult_0(REG,372)@10
    reg_xv0_uid176_constMult_0_to_p0_uid181_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv0_uid176_constMult_0_to_p0_uid181_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv0_uid176_constMult_0_to_p0_uid181_constMult_0_q <= ld_xv0_uid176_constMult_b_to_reg_xv0_uid176_constMult_0_to_p0_uid181_constMult_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--p0_uid181_constMult(LOOKUP,180)@11
    p0_uid181_constMult: PROCESS (reg_xv0_uid176_constMult_0_to_p0_uid181_constMult_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_xv0_uid176_constMult_0_to_p0_uid181_constMult_0_q) IS
                WHEN "000000" =>  p0_uid181_constMult_q <= "000000000000000000000000000000000000000000000000000000000000000000000";
                WHEN "000001" =>  p0_uid181_constMult_q <= "000000101100010111001000010111111101111101000111001111011110011010110";
                WHEN "000010" =>  p0_uid181_constMult_q <= "000001011000101110010000101111111011111010001110011110111100110101100";
                WHEN "000011" =>  p0_uid181_constMult_q <= "000010000101000101011001000111111001110111010101101110011011010000010";
                WHEN "000100" =>  p0_uid181_constMult_q <= "000010110001011100100001011111110111110100011100111101111001101011000";
                WHEN "000101" =>  p0_uid181_constMult_q <= "000011011101110011101001110111110101110001100100001101011000000101110";
                WHEN "000110" =>  p0_uid181_constMult_q <= "000100001010001010110010001111110011101110101011011100110110100000100";
                WHEN "000111" =>  p0_uid181_constMult_q <= "000100110110100001111010100111110001101011110010101100010100111011010";
                WHEN "001000" =>  p0_uid181_constMult_q <= "000101100010111001000010111111101111101000111001111011110011010110000";
                WHEN "001001" =>  p0_uid181_constMult_q <= "000110001111010000001011010111101101100110000001001011010001110000110";
                WHEN "001010" =>  p0_uid181_constMult_q <= "000110111011100111010011101111101011100011001000011010110000001011100";
                WHEN "001011" =>  p0_uid181_constMult_q <= "000111100111111110011100000111101001100000001111101010001110100110010";
                WHEN "001100" =>  p0_uid181_constMult_q <= "001000010100010101100100011111100111011101010110111001101101000001000";
                WHEN "001101" =>  p0_uid181_constMult_q <= "001001000000101100101100110111100101011010011110001001001011011011110";
                WHEN "001110" =>  p0_uid181_constMult_q <= "001001101101000011110101001111100011010111100101011000101001110110100";
                WHEN "001111" =>  p0_uid181_constMult_q <= "001010011001011010111101100111100001010100101100101000001000010001010";
                WHEN "010000" =>  p0_uid181_constMult_q <= "001011000101110010000101111111011111010001110011110111100110101100000";
                WHEN "010001" =>  p0_uid181_constMult_q <= "001011110010001001001110010111011101001110111011000111000101000110110";
                WHEN "010010" =>  p0_uid181_constMult_q <= "001100011110100000010110101111011011001100000010010110100011100001100";
                WHEN "010011" =>  p0_uid181_constMult_q <= "001101001010110111011111000111011001001001001001100110000001111100010";
                WHEN "010100" =>  p0_uid181_constMult_q <= "001101110111001110100111011111010111000110010000110101100000010111000";
                WHEN "010101" =>  p0_uid181_constMult_q <= "001110100011100101101111110111010101000011011000000100111110110001110";
                WHEN "010110" =>  p0_uid181_constMult_q <= "001111001111111100111000001111010011000000011111010100011101001100100";
                WHEN "010111" =>  p0_uid181_constMult_q <= "001111111100010100000000100111010000111101100110100011111011100111010";
                WHEN "011000" =>  p0_uid181_constMult_q <= "010000101000101011001000111111001110111010101101110011011010000010000";
                WHEN "011001" =>  p0_uid181_constMult_q <= "010001010101000010010001010111001100110111110101000010111000011100110";
                WHEN "011010" =>  p0_uid181_constMult_q <= "010010000001011001011001101111001010110100111100010010010110110111100";
                WHEN "011011" =>  p0_uid181_constMult_q <= "010010101101110000100010000111001000110010000011100001110101010010010";
                WHEN "011100" =>  p0_uid181_constMult_q <= "010011011010000111101010011111000110101111001010110001010011101101000";
                WHEN "011101" =>  p0_uid181_constMult_q <= "010100000110011110110010110111000100101100010010000000110010000111110";
                WHEN "011110" =>  p0_uid181_constMult_q <= "010100110010110101111011001111000010101001011001010000010000100010100";
                WHEN "011111" =>  p0_uid181_constMult_q <= "010101011111001101000011100111000000100110100000011111101110111101010";
                WHEN "100000" =>  p0_uid181_constMult_q <= "010110001011100100001011111110111110100011100111101111001101011000000";
                WHEN "100001" =>  p0_uid181_constMult_q <= "010110110111111011010100010110111100100000101110111110101011110010110";
                WHEN "100010" =>  p0_uid181_constMult_q <= "010111100100010010011100101110111010011101110110001110001010001101100";
                WHEN "100011" =>  p0_uid181_constMult_q <= "011000010000101001100101000110111000011010111101011101101000101000010";
                WHEN "100100" =>  p0_uid181_constMult_q <= "011000111101000000101101011110110110011000000100101101000111000011000";
                WHEN "100101" =>  p0_uid181_constMult_q <= "011001101001010111110101110110110100010101001011111100100101011101110";
                WHEN "100110" =>  p0_uid181_constMult_q <= "011010010101101110111110001110110010010010010011001100000011111000100";
                WHEN "100111" =>  p0_uid181_constMult_q <= "011011000010000110000110100110110000001111011010011011100010010011010";
                WHEN "101000" =>  p0_uid181_constMult_q <= "011011101110011101001110111110101110001100100001101011000000101110000";
                WHEN "101001" =>  p0_uid181_constMult_q <= "011100011010110100010111010110101100001001101000111010011111001000110";
                WHEN "101010" =>  p0_uid181_constMult_q <= "011101000111001011011111101110101010000110110000001001111101100011100";
                WHEN "101011" =>  p0_uid181_constMult_q <= "011101110011100010101000000110101000000011110111011001011011111110010";
                WHEN "101100" =>  p0_uid181_constMult_q <= "011110011111111001110000011110100110000000111110101000111010011001000";
                WHEN "101101" =>  p0_uid181_constMult_q <= "011111001100010000111000110110100011111110000101111000011000110011110";
                WHEN "101110" =>  p0_uid181_constMult_q <= "011111111000101000000001001110100001111011001101000111110111001110100";
                WHEN "101111" =>  p0_uid181_constMult_q <= "100000100100111111001001100110011111111000010100010111010101101001010";
                WHEN "110000" =>  p0_uid181_constMult_q <= "100001010001010110010001111110011101110101011011100110110100000100000";
                WHEN "110001" =>  p0_uid181_constMult_q <= "100001111101101101011010010110011011110010100010110110010010011110110";
                WHEN "110010" =>  p0_uid181_constMult_q <= "100010101010000100100010101110011001101111101010000101110000111001100";
                WHEN "110011" =>  p0_uid181_constMult_q <= "100011010110011011101011000110010111101100110001010101001111010100010";
                WHEN "110100" =>  p0_uid181_constMult_q <= "100100000010110010110011011110010101101001111000100100101101101111000";
                WHEN "110101" =>  p0_uid181_constMult_q <= "100100101111001001111011110110010011100110111111110100001100001001110";
                WHEN "110110" =>  p0_uid181_constMult_q <= "100101011011100001000100001110010001100100000111000011101010100100100";
                WHEN "110111" =>  p0_uid181_constMult_q <= "100110000111111000001100100110001111100001001110010011001000111111010";
                WHEN "111000" =>  p0_uid181_constMult_q <= "100110110100001111010100111110001101011110010101100010100111011010000";
                WHEN "111001" =>  p0_uid181_constMult_q <= "100111100000100110011101010110001011011011011100110010000101110100110";
                WHEN "111010" =>  p0_uid181_constMult_q <= "101000001100111101100101101110001001011000100100000001100100001111100";
                WHEN "111011" =>  p0_uid181_constMult_q <= "101000111001010100101110000110000111010101101011010001000010101010010";
                WHEN "111100" =>  p0_uid181_constMult_q <= "101001100101101011110110011110000101010010110010100000100001000101000";
                WHEN "111101" =>  p0_uid181_constMult_q <= "101010010010000010111110110110000011001111111001101111111111011111110";
                WHEN "111110" =>  p0_uid181_constMult_q <= "101010111110011010000111001110000001001101000000111111011101111010100";
                WHEN "111111" =>  p0_uid181_constMult_q <= "101011101010110001001111100101111111001010001000001110111100010101010";
                WHEN OTHERS =>
                    p0_uid181_constMult_q <= "000000000000000000000000000000000000000000000000000000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv1_uid177_constMult(BITSELECT,176)@8
    xv1_uid177_constMult_in <= ePreRnd_uid46_fpExpETest_b(11 downto 0);
    xv1_uid177_constMult_b <= xv1_uid177_constMult_in(11 downto 6);

	--ld_xv1_uid177_constMult_b_to_reg_xv1_uid177_constMult_0_to_p1_uid180_constMult_0_a(DELAY,825)@8
    ld_xv1_uid177_constMult_b_to_reg_xv1_uid177_constMult_0_to_p1_uid180_constMult_0_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => xv1_uid177_constMult_b, xout => ld_xv1_uid177_constMult_b_to_reg_xv1_uid177_constMult_0_to_p1_uid180_constMult_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_xv1_uid177_constMult_0_to_p1_uid180_constMult_0(REG,371)@9
    reg_xv1_uid177_constMult_0_to_p1_uid180_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv1_uid177_constMult_0_to_p1_uid180_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv1_uid177_constMult_0_to_p1_uid180_constMult_0_q <= ld_xv1_uid177_constMult_b_to_reg_xv1_uid177_constMult_0_to_p1_uid180_constMult_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--p1_uid180_constMult(LOOKUP,179)@10
    p1_uid180_constMult: PROCESS (reg_xv1_uid177_constMult_0_to_p1_uid180_constMult_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_xv1_uid177_constMult_0_to_p1_uid180_constMult_0_q) IS
                WHEN "000000" =>  p1_uid180_constMult_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000";
                WHEN "000001" =>  p1_uid180_constMult_q <= "000000101100010111001000010111111101111101000111001111011110011010110000000";
                WHEN "000010" =>  p1_uid180_constMult_q <= "000001011000101110010000101111111011111010001110011110111100110101100000000";
                WHEN "000011" =>  p1_uid180_constMult_q <= "000010000101000101011001000111111001110111010101101110011011010000010000000";
                WHEN "000100" =>  p1_uid180_constMult_q <= "000010110001011100100001011111110111110100011100111101111001101011000000000";
                WHEN "000101" =>  p1_uid180_constMult_q <= "000011011101110011101001110111110101110001100100001101011000000101110000000";
                WHEN "000110" =>  p1_uid180_constMult_q <= "000100001010001010110010001111110011101110101011011100110110100000100000000";
                WHEN "000111" =>  p1_uid180_constMult_q <= "000100110110100001111010100111110001101011110010101100010100111011010000000";
                WHEN "001000" =>  p1_uid180_constMult_q <= "000101100010111001000010111111101111101000111001111011110011010110000000000";
                WHEN "001001" =>  p1_uid180_constMult_q <= "000110001111010000001011010111101101100110000001001011010001110000110000000";
                WHEN "001010" =>  p1_uid180_constMult_q <= "000110111011100111010011101111101011100011001000011010110000001011100000000";
                WHEN "001011" =>  p1_uid180_constMult_q <= "000111100111111110011100000111101001100000001111101010001110100110010000000";
                WHEN "001100" =>  p1_uid180_constMult_q <= "001000010100010101100100011111100111011101010110111001101101000001000000000";
                WHEN "001101" =>  p1_uid180_constMult_q <= "001001000000101100101100110111100101011010011110001001001011011011110000000";
                WHEN "001110" =>  p1_uid180_constMult_q <= "001001101101000011110101001111100011010111100101011000101001110110100000000";
                WHEN "001111" =>  p1_uid180_constMult_q <= "001010011001011010111101100111100001010100101100101000001000010001010000000";
                WHEN "010000" =>  p1_uid180_constMult_q <= "001011000101110010000101111111011111010001110011110111100110101100000000000";
                WHEN "010001" =>  p1_uid180_constMult_q <= "001011110010001001001110010111011101001110111011000111000101000110110000000";
                WHEN "010010" =>  p1_uid180_constMult_q <= "001100011110100000010110101111011011001100000010010110100011100001100000000";
                WHEN "010011" =>  p1_uid180_constMult_q <= "001101001010110111011111000111011001001001001001100110000001111100010000000";
                WHEN "010100" =>  p1_uid180_constMult_q <= "001101110111001110100111011111010111000110010000110101100000010111000000000";
                WHEN "010101" =>  p1_uid180_constMult_q <= "001110100011100101101111110111010101000011011000000100111110110001110000000";
                WHEN "010110" =>  p1_uid180_constMult_q <= "001111001111111100111000001111010011000000011111010100011101001100100000000";
                WHEN "010111" =>  p1_uid180_constMult_q <= "001111111100010100000000100111010000111101100110100011111011100111010000000";
                WHEN "011000" =>  p1_uid180_constMult_q <= "010000101000101011001000111111001110111010101101110011011010000010000000000";
                WHEN "011001" =>  p1_uid180_constMult_q <= "010001010101000010010001010111001100110111110101000010111000011100110000000";
                WHEN "011010" =>  p1_uid180_constMult_q <= "010010000001011001011001101111001010110100111100010010010110110111100000000";
                WHEN "011011" =>  p1_uid180_constMult_q <= "010010101101110000100010000111001000110010000011100001110101010010010000000";
                WHEN "011100" =>  p1_uid180_constMult_q <= "010011011010000111101010011111000110101111001010110001010011101101000000000";
                WHEN "011101" =>  p1_uid180_constMult_q <= "010100000110011110110010110111000100101100010010000000110010000111110000000";
                WHEN "011110" =>  p1_uid180_constMult_q <= "010100110010110101111011001111000010101001011001010000010000100010100000000";
                WHEN "011111" =>  p1_uid180_constMult_q <= "010101011111001101000011100111000000100110100000011111101110111101010000000";
                WHEN "100000" =>  p1_uid180_constMult_q <= "010110001011100100001011111110111110100011100111101111001101011000000000000";
                WHEN "100001" =>  p1_uid180_constMult_q <= "010110110111111011010100010110111100100000101110111110101011110010110000000";
                WHEN "100010" =>  p1_uid180_constMult_q <= "010111100100010010011100101110111010011101110110001110001010001101100000000";
                WHEN "100011" =>  p1_uid180_constMult_q <= "011000010000101001100101000110111000011010111101011101101000101000010000000";
                WHEN "100100" =>  p1_uid180_constMult_q <= "011000111101000000101101011110110110011000000100101101000111000011000000000";
                WHEN "100101" =>  p1_uid180_constMult_q <= "011001101001010111110101110110110100010101001011111100100101011101110000000";
                WHEN "100110" =>  p1_uid180_constMult_q <= "011010010101101110111110001110110010010010010011001100000011111000100000000";
                WHEN "100111" =>  p1_uid180_constMult_q <= "011011000010000110000110100110110000001111011010011011100010010011010000000";
                WHEN "101000" =>  p1_uid180_constMult_q <= "011011101110011101001110111110101110001100100001101011000000101110000000000";
                WHEN "101001" =>  p1_uid180_constMult_q <= "011100011010110100010111010110101100001001101000111010011111001000110000000";
                WHEN "101010" =>  p1_uid180_constMult_q <= "011101000111001011011111101110101010000110110000001001111101100011100000000";
                WHEN "101011" =>  p1_uid180_constMult_q <= "011101110011100010101000000110101000000011110111011001011011111110010000000";
                WHEN "101100" =>  p1_uid180_constMult_q <= "011110011111111001110000011110100110000000111110101000111010011001000000000";
                WHEN "101101" =>  p1_uid180_constMult_q <= "011111001100010000111000110110100011111110000101111000011000110011110000000";
                WHEN "101110" =>  p1_uid180_constMult_q <= "011111111000101000000001001110100001111011001101000111110111001110100000000";
                WHEN "101111" =>  p1_uid180_constMult_q <= "100000100100111111001001100110011111111000010100010111010101101001010000000";
                WHEN "110000" =>  p1_uid180_constMult_q <= "100001010001010110010001111110011101110101011011100110110100000100000000000";
                WHEN "110001" =>  p1_uid180_constMult_q <= "100001111101101101011010010110011011110010100010110110010010011110110000000";
                WHEN "110010" =>  p1_uid180_constMult_q <= "100010101010000100100010101110011001101111101010000101110000111001100000000";
                WHEN "110011" =>  p1_uid180_constMult_q <= "100011010110011011101011000110010111101100110001010101001111010100010000000";
                WHEN "110100" =>  p1_uid180_constMult_q <= "100100000010110010110011011110010101101001111000100100101101101111000000000";
                WHEN "110101" =>  p1_uid180_constMult_q <= "100100101111001001111011110110010011100110111111110100001100001001110000000";
                WHEN "110110" =>  p1_uid180_constMult_q <= "100101011011100001000100001110010001100100000111000011101010100100100000000";
                WHEN "110111" =>  p1_uid180_constMult_q <= "100110000111111000001100100110001111100001001110010011001000111111010000000";
                WHEN "111000" =>  p1_uid180_constMult_q <= "100110110100001111010100111110001101011110010101100010100111011010000000000";
                WHEN "111001" =>  p1_uid180_constMult_q <= "100111100000100110011101010110001011011011011100110010000101110100110000000";
                WHEN "111010" =>  p1_uid180_constMult_q <= "101000001100111101100101101110001001011000100100000001100100001111100000000";
                WHEN "111011" =>  p1_uid180_constMult_q <= "101000111001010100101110000110000111010101101011010001000010101010010000000";
                WHEN "111100" =>  p1_uid180_constMult_q <= "101001100101101011110110011110000101010010110010100000100001000101000000000";
                WHEN "111101" =>  p1_uid180_constMult_q <= "101010010010000010111110110110000011001111111001101111111111011111110000000";
                WHEN "111110" =>  p1_uid180_constMult_q <= "101010111110011010000111001110000001001101000000111111011101111010100000000";
                WHEN "111111" =>  p1_uid180_constMult_q <= "101011101010110001001111100101111111001010001000001110111100010101010000000";
                WHEN OTHERS =>
                    p1_uid180_constMult_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv2_uid178_constMult(BITSELECT,177)@8
    xv2_uid178_constMult_in <= ePreRnd_uid46_fpExpETest_b;
    xv2_uid178_constMult_b <= xv2_uid178_constMult_in(13 downto 12);

	--reg_xv2_uid178_constMult_0_to_p2_uid179_constMult_0(REG,370)@8
    reg_xv2_uid178_constMult_0_to_p2_uid179_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv2_uid178_constMult_0_to_p2_uid179_constMult_0_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv2_uid178_constMult_0_to_p2_uid179_constMult_0_q <= xv2_uid178_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--p2_uid179_constMult(LOOKUP,178)@9
    p2_uid179_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p2_uid179_constMult_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_xv2_uid178_constMult_0_to_p2_uid179_constMult_0_q) IS
                WHEN "00" =>  p2_uid179_constMult_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000";
                WHEN "01" =>  p2_uid179_constMult_q <= "00101100010111001000010111111101111101000111001111011110011010110000000000000";
                WHEN "10" =>  p2_uid179_constMult_q <= "10100111010001101111010000000100000101110001100001000011001010100000000000000";
                WHEN "11" =>  p2_uid179_constMult_q <= "11010011101000110111101000000010000010111000110000100001100101010000000000000";
                WHEN OTHERS =>
                    p2_uid179_constMult_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000";
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--lev1_a0_uid182_constMult(ADD,181)@10
    lev1_a0_uid182_constMult_a <= STD_LOGIC_VECTOR((78 downto 77 => p2_uid179_constMult_q(76)) & p2_uid179_constMult_q);
    lev1_a0_uid182_constMult_b <= STD_LOGIC_VECTOR('0' & "000" & p1_uid180_constMult_q);
    lev1_a0_uid182_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a0_uid182_constMult_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                lev1_a0_uid182_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0_uid182_constMult_a) + SIGNED(lev1_a0_uid182_constMult_b));
            END IF;
        END IF;
    END PROCESS;
    lev1_a0_uid182_constMult_q <= lev1_a0_uid182_constMult_o(77 downto 0);


	--lev2_a0_uid183_constMult(ADD,182)@11
    lev2_a0_uid183_constMult_a <= STD_LOGIC_VECTOR((79 downto 78 => lev1_a0_uid182_constMult_q(77)) & lev1_a0_uid182_constMult_q);
    lev2_a0_uid183_constMult_b <= STD_LOGIC_VECTOR('0' & "0000000000" & p0_uid181_constMult_q);
            lev2_a0_uid183_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0_uid183_constMult_a) + SIGNED(lev2_a0_uid183_constMult_b));
    lev2_a0_uid183_constMult_q <= lev2_a0_uid183_constMult_o(78 downto 0);


	--sR_uid184_constMult(BITSELECT,183)@11
    sR_uid184_constMult_in <= lev2_a0_uid183_constMult_q(76 downto 0);
    sR_uid184_constMult_b <= sR_uid184_constMult_in(76 downto 2);

	--reg_sR_uid184_constMult_0_to_yExt_uid57_fpExpETest_1(REG,374)@11
    reg_sR_uid184_constMult_0_to_yExt_uid57_fpExpETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sR_uid184_constMult_0_to_yExt_uid57_fpExpETest_1_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sR_uid184_constMult_0_to_yExt_uid57_fpExpETest_1_q <= sR_uid184_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_signX_uid7_fpExpETest_b_to_onesCmpFxpIn_uid49_fpExpETest_b(DELAY,456)@0
    ld_signX_uid7_fpExpETest_b_to_onesCmpFxpIn_uid49_fpExpETest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 8 )
    PORT MAP ( xin => signX_uid7_fpExpETest_b, xout => ld_signX_uid7_fpExpETest_b_to_onesCmpFxpIn_uid49_fpExpETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_nor(LOGICAL,898)
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_nor_b <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_sticky_ena_q;
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_nor_q <= not (ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_nor_a or ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_nor_b);

	--ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_mem_top(CONSTANT,894)
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_mem_top_q <= "0101";

	--ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmp(LOGICAL,895)
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmp_a <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_mem_top_q;
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdmux_q);
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmp_q <= "1" when ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmp_a = ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmp_b else "0";

	--ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmpReg(REG,896)
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmpReg_q <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_sticky_ena(REG,899)
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_nor_q = "1") THEN
                ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_sticky_ena_q <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_enaAnd(LOGICAL,900)
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_enaAnd_a <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_sticky_ena_q;
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_enaAnd_b <= en;
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_enaAnd_q <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_enaAnd_a and ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_enaAnd_b;

	--ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_inputreg(DELAY,888)
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 53, depth => 1 )
    PORT MAP ( xin => oFracX_uid32_uid32_fpExpETest_q, xout => ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt(COUNTER,890)
    -- every=1, low=0, high=5, step=1, init=1
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_i = 4 THEN
                      ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_eq = '1') THEN
                        ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_i <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_i - 5;
                    ELSE
                        ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_i <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_i,3));


	--ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdreg(REG,891)
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdreg_q <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdmux(MUX,892)
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdmux_s <= en;
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdmux: PROCESS (ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdmux_s, ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdreg_q, ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdmux_s IS
                  WHEN "0" => ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdmux_q <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdreg_q;
                  WHEN "1" => ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdmux_q <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem(DUALMEM,889)
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_ia <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_inputreg_q;
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_aa <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdreg_q;
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_ab <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdmux_q;
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 53,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 53,
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
        clocken1 => ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_iq,
        address_a => ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_aa,
        data_a => ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_ia
    );
    ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_reset0 <= areset;
        ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_q <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_iq(52 downto 0);

	--cstZeroWEP1_uid12_fpExpETest(CONSTANT,11)
    cstZeroWEP1_uid12_fpExpETest_q <= "000000000000";

	--oFracXZwE_uid48_fpExpETest(BITJOIN,47)@8
    oFracXZwE_uid48_fpExpETest_q <= GND_q & ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_mem_q & cstZeroWEP1_uid12_fpExpETest_q;

	--onesCmpFxpIn_uid49_fpExpETest(LOGICAL,48)@8
    onesCmpFxpIn_uid49_fpExpETest_a <= oFracXZwE_uid48_fpExpETest_q;
    onesCmpFxpIn_uid49_fpExpETest_b <= STD_LOGIC_VECTOR((65 downto 1 => ld_signX_uid7_fpExpETest_b_to_onesCmpFxpIn_uid49_fpExpETest_b_q(0)) & ld_signX_uid7_fpExpETest_b_to_onesCmpFxpIn_uid49_fpExpETest_b_q);
    onesCmpFxpIn_uid49_fpExpETest_q <= onesCmpFxpIn_uid49_fpExpETest_a xor onesCmpFxpIn_uid49_fpExpETest_b;

	--fxpInExt_uid50_fpExpETest(ADD,49)@8
    fxpInExt_uid50_fpExpETest_a <= STD_LOGIC_VECTOR((67 downto 66 => onesCmpFxpIn_uid49_fpExpETest_q(65)) & onesCmpFxpIn_uid49_fpExpETest_q);
    fxpInExt_uid50_fpExpETest_b <= STD_LOGIC_VECTOR('0' & "000000000000000000000000000000000000000000000000000000000000000000" & ld_signX_uid7_fpExpETest_b_to_onesCmpFxpIn_uid49_fpExpETest_b_q);
            fxpInExt_uid50_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(fxpInExt_uid50_fpExpETest_a) + SIGNED(fxpInExt_uid50_fpExpETest_b));
    fxpInExt_uid50_fpExpETest_q <= fxpInExt_uid50_fpExpETest_o(66 downto 0);


	--fxpInPreAlign_uid51_fpExpETest(BITSELECT,50)@8
    fxpInPreAlign_uid51_fpExpETest_in <= fxpInExt_uid50_fpExpETest_q(65 downto 0);
    fxpInPreAlign_uid51_fpExpETest_b <= fxpInPreAlign_uid51_fpExpETest_in(65 downto 0);

	--msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest(BITSELECT,185)@8
    msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_in <= fxpInPreAlign_uid51_fpExpETest_b;
    msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b <= msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_in(65 downto 65);

	--rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest(LOGICAL,227)@8
    rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_a <= GND_q;
    rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_b <= msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b;
    rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_q_i <= rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_a or rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_b;
    rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_q, xin => rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_q_to_rightShiftStage3Idx1_uid230_fxpInPostAlign_X_uid56_fpExpETest_b(DELAY,670)@9
    ld_rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_q_to_rightShiftStage3Idx1_uid230_fxpInPostAlign_X_uid56_fpExpETest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_q, xout => ld_rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_q_to_rightShiftStage3Idx1_uid230_fxpInPostAlign_X_uid56_fpExpETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--RightShiftStage265dto1_uid229_fxpInPostAlign_X_uid56_fpExpETest(BITSELECT,228)@11
    RightShiftStage265dto1_uid229_fxpInPostAlign_X_uid56_fpExpETest_in <= rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_q;
    RightShiftStage265dto1_uid229_fxpInPostAlign_X_uid56_fpExpETest_b <= RightShiftStage265dto1_uid229_fxpInPostAlign_X_uid56_fpExpETest_in(65 downto 1);

	--rightShiftStage3Idx1_uid230_fxpInPostAlign_X_uid56_fpExpETest(BITJOIN,229)@11
    rightShiftStage3Idx1_uid230_fxpInPostAlign_X_uid56_fpExpETest_q <= ld_rightShiftStage3Idx1Pad1_uid228_fxpInPostAlign_X_uid56_fpExpETest_q_to_rightShiftStage3Idx1_uid230_fxpInPostAlign_X_uid56_fpExpETest_b_q & RightShiftStage265dto1_uid229_fxpInPostAlign_X_uid56_fpExpETest_b;

	--ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_b(DELAY,650)@8
    ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b, xout => ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx3Pad6_uid222_fxpInPostAlign_X_uid56_fpExpETest(LOGICAL,221)@10
    rightShiftStage2Idx3Pad6_uid222_fxpInPostAlign_X_uid56_fpExpETest_a <= z_uid163_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage2Idx3Pad6_uid222_fxpInPostAlign_X_uid56_fpExpETest_b <= STD_LOGIC_VECTOR((5 downto 1 => ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_b_q(0)) & ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_b_q);
    rightShiftStage2Idx3Pad6_uid222_fxpInPostAlign_X_uid56_fpExpETest_q_i <= rightShiftStage2Idx3Pad6_uid222_fxpInPostAlign_X_uid56_fpExpETest_a or rightShiftStage2Idx3Pad6_uid222_fxpInPostAlign_X_uid56_fpExpETest_b;
    rightShiftStage2Idx3Pad6_uid222_fxpInPostAlign_X_uid56_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 6, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx3Pad6_uid222_fxpInPostAlign_X_uid56_fpExpETest_q, xin => rightShiftStage2Idx3Pad6_uid222_fxpInPostAlign_X_uid56_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_b(DELAY,633)@8
    ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b, xout => ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3Pad24_uid208_fxpInPostAlign_X_uid56_fpExpETest(LOGICAL,207)@9
    rightShiftStage1Idx3Pad24_uid208_fxpInPostAlign_X_uid56_fpExpETest_a <= z_uid149_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage1Idx3Pad24_uid208_fxpInPostAlign_X_uid56_fpExpETest_b <= STD_LOGIC_VECTOR((23 downto 1 => ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_b_q(0)) & ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_b_q);
    rightShiftStage1Idx3Pad24_uid208_fxpInPostAlign_X_uid56_fpExpETest_q_i <= rightShiftStage1Idx3Pad24_uid208_fxpInPostAlign_X_uid56_fpExpETest_a or rightShiftStage1Idx3Pad24_uid208_fxpInPostAlign_X_uid56_fpExpETest_b;
    rightShiftStage1Idx3Pad24_uid208_fxpInPostAlign_X_uid56_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 24, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx3Pad24_uid208_fxpInPostAlign_X_uid56_fpExpETest_q, xin => rightShiftStage1Idx3Pad24_uid208_fxpInPostAlign_X_uid56_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--rightShiftStage0Idx3_uid195_fxpInPostAlign_X_uid56_fpExpETest(CONSTANT,194)
    rightShiftStage0Idx3_uid195_fxpInPostAlign_X_uid56_fpExpETest_q <= "000000000000000000000000000000000000000000000000000000000000000000";

	--rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest(LOGICAL,195)@8
    rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest_a <= rightShiftStage0Idx3_uid195_fxpInPostAlign_X_uid56_fpExpETest_q;
    rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest_b <= STD_LOGIC_VECTOR((65 downto 1 => msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b(0)) & msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b);
    rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest_q_i <= rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest_a or rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest_b;
    rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 66, depth => 1)
    PORT MAP (xout => rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest_q, xin => rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--rightShiftStage0Idx2Pad64_uid192_fxpInPostAlign_X_uid56_fpExpETest(LOGICAL,191)@8
    rightShiftStage0Idx2Pad64_uid192_fxpInPostAlign_X_uid56_fpExpETest_a <= z_uid133_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage0Idx2Pad64_uid192_fxpInPostAlign_X_uid56_fpExpETest_b <= STD_LOGIC_VECTOR((63 downto 1 => msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b(0)) & msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b);
    rightShiftStage0Idx2Pad64_uid192_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage0Idx2Pad64_uid192_fxpInPostAlign_X_uid56_fpExpETest_a or rightShiftStage0Idx2Pad64_uid192_fxpInPostAlign_X_uid56_fpExpETest_b;

	--X65dto64_uid193_fxpInPostAlign_X_uid56_fpExpETest(BITSELECT,192)@8
    X65dto64_uid193_fxpInPostAlign_X_uid56_fpExpETest_in <= fxpInPreAlign_uid51_fpExpETest_b;
    X65dto64_uid193_fxpInPostAlign_X_uid56_fpExpETest_b <= X65dto64_uid193_fxpInPostAlign_X_uid56_fpExpETest_in(65 downto 64);

	--rightShiftStage0Idx2_uid194_fxpInPostAlign_X_uid56_fpExpETest(BITJOIN,193)@8
    rightShiftStage0Idx2_uid194_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage0Idx2Pad64_uid192_fxpInPostAlign_X_uid56_fpExpETest_q & X65dto64_uid193_fxpInPostAlign_X_uid56_fpExpETest_b;

	--reg_rightShiftStage0Idx2_uid194_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_4(REG,364)@8
    reg_rightShiftStage0Idx2_uid194_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx2_uid194_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_4_q <= "000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx2_uid194_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_4_q <= rightShiftStage0Idx2_uid194_fxpInPostAlign_X_uid56_fpExpETest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0Idx1Pad32_uid188_fxpInPostAlign_X_uid56_fpExpETest(LOGICAL,187)@8
    rightShiftStage0Idx1Pad32_uid188_fxpInPostAlign_X_uid56_fpExpETest_a <= z_uid129_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage0Idx1Pad32_uid188_fxpInPostAlign_X_uid56_fpExpETest_b <= STD_LOGIC_VECTOR((31 downto 1 => msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b(0)) & msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b);
    rightShiftStage0Idx1Pad32_uid188_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage0Idx1Pad32_uid188_fxpInPostAlign_X_uid56_fpExpETest_a or rightShiftStage0Idx1Pad32_uid188_fxpInPostAlign_X_uid56_fpExpETest_b;

	--X65dto32_uid189_fxpInPostAlign_X_uid56_fpExpETest(BITSELECT,188)@8
    X65dto32_uid189_fxpInPostAlign_X_uid56_fpExpETest_in <= fxpInPreAlign_uid51_fpExpETest_b;
    X65dto32_uid189_fxpInPostAlign_X_uid56_fpExpETest_b <= X65dto32_uid189_fxpInPostAlign_X_uid56_fpExpETest_in(65 downto 32);

	--rightShiftStage0Idx1_uid190_fxpInPostAlign_X_uid56_fpExpETest(BITJOIN,189)@8
    rightShiftStage0Idx1_uid190_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage0Idx1Pad32_uid188_fxpInPostAlign_X_uid56_fpExpETest_q & X65dto32_uid189_fxpInPostAlign_X_uid56_fpExpETest_b;

	--reg_rightShiftStage0Idx1_uid190_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_3(REG,363)@8
    reg_rightShiftStage0Idx1_uid190_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx1_uid190_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_3_q <= "000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx1_uid190_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_3_q <= rightShiftStage0Idx1_uid190_fxpInPostAlign_X_uid56_fpExpETest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_fxpInPreAlign_uid51_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_2(REG,362)@8
    reg_fxpInPreAlign_uid51_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpInPreAlign_uid51_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_2_q <= "000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpInPreAlign_uid51_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_2_q <= fxpInPreAlign_uid51_fpExpETest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_b(DELAY,628)@6
    ld_reg_rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 3 )
    PORT MAP ( xin => reg_rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid140_fxpInPostAlign_uid45_fpExpETest_1_q, xout => ld_reg_rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest(MUX,197)@9
    rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_s <= ld_reg_rightShiftStageSel6Dto5_uid139_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_b_q;
    rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest: PROCESS (rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_s, en, reg_fxpInPreAlign_uid51_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_2_q, reg_rightShiftStage0Idx1_uid190_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_3_q, reg_rightShiftStage0Idx2_uid194_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_4_q, rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest_q)
    BEGIN
            CASE rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_s IS
                  WHEN "00" => rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_q <= reg_fxpInPreAlign_uid51_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_2_q;
                  WHEN "01" => rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_q <= reg_rightShiftStage0Idx1_uid190_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_3_q;
                  WHEN "10" => rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_q <= reg_rightShiftStage0Idx2_uid194_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_4_q;
                  WHEN "11" => rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage0Idx3_uid196_fxpInPostAlign_X_uid56_fpExpETest_q;
                  WHEN OTHERS => rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage065dto24_uid209_fxpInPostAlign_X_uid56_fpExpETest(BITSELECT,208)@9
    RightShiftStage065dto24_uid209_fxpInPostAlign_X_uid56_fpExpETest_in <= rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_q;
    RightShiftStage065dto24_uid209_fxpInPostAlign_X_uid56_fpExpETest_b <= RightShiftStage065dto24_uid209_fxpInPostAlign_X_uid56_fpExpETest_in(65 downto 24);

	--ld_RightShiftStage065dto24_uid209_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx3_uid210_fxpInPostAlign_X_uid56_fpExpETest_a(DELAY,643)@9
    ld_RightShiftStage065dto24_uid209_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx3_uid210_fxpInPostAlign_X_uid56_fpExpETest_a : dspba_delay
    GENERIC MAP ( width => 42, depth => 1 )
    PORT MAP ( xin => RightShiftStage065dto24_uid209_fxpInPostAlign_X_uid56_fpExpETest_b, xout => ld_RightShiftStage065dto24_uid209_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx3_uid210_fxpInPostAlign_X_uid56_fpExpETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid210_fxpInPostAlign_X_uid56_fpExpETest(BITJOIN,209)@10
    rightShiftStage1Idx3_uid210_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage1Idx3Pad24_uid208_fxpInPostAlign_X_uid56_fpExpETest_q & ld_RightShiftStage065dto24_uid209_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx3_uid210_fxpInPostAlign_X_uid56_fpExpETest_a_q;

	--rightShiftStage1Idx2Pad16_uid204_fxpInPostAlign_X_uid56_fpExpETest(LOGICAL,203)@9
    rightShiftStage1Idx2Pad16_uid204_fxpInPostAlign_X_uid56_fpExpETest_a <= z_uid145_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage1Idx2Pad16_uid204_fxpInPostAlign_X_uid56_fpExpETest_b <= STD_LOGIC_VECTOR((15 downto 1 => ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_b_q(0)) & ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_b_q);
    rightShiftStage1Idx2Pad16_uid204_fxpInPostAlign_X_uid56_fpExpETest_q_i <= rightShiftStage1Idx2Pad16_uid204_fxpInPostAlign_X_uid56_fpExpETest_a or rightShiftStage1Idx2Pad16_uid204_fxpInPostAlign_X_uid56_fpExpETest_b;
    rightShiftStage1Idx2Pad16_uid204_fxpInPostAlign_X_uid56_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 16, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx2Pad16_uid204_fxpInPostAlign_X_uid56_fpExpETest_q, xin => rightShiftStage1Idx2Pad16_uid204_fxpInPostAlign_X_uid56_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage065dto16_uid205_fxpInPostAlign_X_uid56_fpExpETest(BITSELECT,204)@9
    RightShiftStage065dto16_uid205_fxpInPostAlign_X_uid56_fpExpETest_in <= rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_q;
    RightShiftStage065dto16_uid205_fxpInPostAlign_X_uid56_fpExpETest_b <= RightShiftStage065dto16_uid205_fxpInPostAlign_X_uid56_fpExpETest_in(65 downto 16);

	--ld_RightShiftStage065dto16_uid205_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx2_uid206_fxpInPostAlign_X_uid56_fpExpETest_a(DELAY,639)@9
    ld_RightShiftStage065dto16_uid205_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx2_uid206_fxpInPostAlign_X_uid56_fpExpETest_a : dspba_delay
    GENERIC MAP ( width => 50, depth => 1 )
    PORT MAP ( xin => RightShiftStage065dto16_uid205_fxpInPostAlign_X_uid56_fpExpETest_b, xout => ld_RightShiftStage065dto16_uid205_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx2_uid206_fxpInPostAlign_X_uid56_fpExpETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid206_fxpInPostAlign_X_uid56_fpExpETest(BITJOIN,205)@10
    rightShiftStage1Idx2_uid206_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage1Idx2Pad16_uid204_fxpInPostAlign_X_uid56_fpExpETest_q & ld_RightShiftStage065dto16_uid205_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx2_uid206_fxpInPostAlign_X_uid56_fpExpETest_a_q;

	--rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest(LOGICAL,199)@9
    rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_a <= z_uid141_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_b <= STD_LOGIC_VECTOR((7 downto 1 => ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_b_q(0)) & ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_b_q);
    rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_q_i <= rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_a or rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_b;
    rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 8, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_q, xin => rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage065dto8_uid201_fxpInPostAlign_X_uid56_fpExpETest(BITSELECT,200)@9
    RightShiftStage065dto8_uid201_fxpInPostAlign_X_uid56_fpExpETest_in <= rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_q;
    RightShiftStage065dto8_uid201_fxpInPostAlign_X_uid56_fpExpETest_b <= RightShiftStage065dto8_uid201_fxpInPostAlign_X_uid56_fpExpETest_in(65 downto 8);

	--ld_RightShiftStage065dto8_uid201_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1_uid202_fxpInPostAlign_X_uid56_fpExpETest_a(DELAY,635)@9
    ld_RightShiftStage065dto8_uid201_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1_uid202_fxpInPostAlign_X_uid56_fpExpETest_a : dspba_delay
    GENERIC MAP ( width => 58, depth => 1 )
    PORT MAP ( xin => RightShiftStage065dto8_uid201_fxpInPostAlign_X_uid56_fpExpETest_b, xout => ld_RightShiftStage065dto8_uid201_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1_uid202_fxpInPostAlign_X_uid56_fpExpETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid202_fxpInPostAlign_X_uid56_fpExpETest(BITJOIN,201)@10
    rightShiftStage1Idx1_uid202_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage1Idx1Pad8_uid200_fxpInPostAlign_X_uid56_fpExpETest_q & ld_RightShiftStage065dto8_uid201_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage1Idx1_uid202_fxpInPostAlign_X_uid56_fpExpETest_a_q;

	--reg_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_2(REG,366)@9
    reg_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_2_q <= "000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_2_q <= rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_1(REG,365)@5
    reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_1_q <= rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_b(DELAY,645)@6
    ld_reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 4 )
    PORT MAP ( xin => reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_1_q, xout => ld_reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest(MUX,211)@10
    rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_s <= ld_reg_rightShiftStageSel4Dto3_uid153_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_b_q;
    rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest: PROCESS (rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_s, en, reg_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_2_q, rightShiftStage1Idx1_uid202_fxpInPostAlign_X_uid56_fpExpETest_q, rightShiftStage1Idx2_uid206_fxpInPostAlign_X_uid56_fpExpETest_q, rightShiftStage1Idx3_uid210_fxpInPostAlign_X_uid56_fpExpETest_q)
    BEGIN
            CASE rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_s IS
                  WHEN "00" => rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_q <= reg_rightShiftStage0_uid198_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_2_q;
                  WHEN "01" => rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage1Idx1_uid202_fxpInPostAlign_X_uid56_fpExpETest_q;
                  WHEN "10" => rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage1Idx2_uid206_fxpInPostAlign_X_uid56_fpExpETest_q;
                  WHEN "11" => rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage1Idx3_uid210_fxpInPostAlign_X_uid56_fpExpETest_q;
                  WHEN OTHERS => rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage165dto6_uid223_fxpInPostAlign_X_uid56_fpExpETest(BITSELECT,222)@10
    RightShiftStage165dto6_uid223_fxpInPostAlign_X_uid56_fpExpETest_in <= rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_q;
    RightShiftStage165dto6_uid223_fxpInPostAlign_X_uid56_fpExpETest_b <= RightShiftStage165dto6_uid223_fxpInPostAlign_X_uid56_fpExpETest_in(65 downto 6);

	--ld_RightShiftStage165dto6_uid223_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx3_uid224_fxpInPostAlign_X_uid56_fpExpETest_a(DELAY,660)@10
    ld_RightShiftStage165dto6_uid223_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx3_uid224_fxpInPostAlign_X_uid56_fpExpETest_a : dspba_delay
    GENERIC MAP ( width => 60, depth => 1 )
    PORT MAP ( xin => RightShiftStage165dto6_uid223_fxpInPostAlign_X_uid56_fpExpETest_b, xout => ld_RightShiftStage165dto6_uid223_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx3_uid224_fxpInPostAlign_X_uid56_fpExpETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx3_uid224_fxpInPostAlign_X_uid56_fpExpETest(BITJOIN,223)@11
    rightShiftStage2Idx3_uid224_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage2Idx3Pad6_uid222_fxpInPostAlign_X_uid56_fpExpETest_q & ld_RightShiftStage165dto6_uid223_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx3_uid224_fxpInPostAlign_X_uid56_fpExpETest_a_q;

	--rightShiftStage2Idx2Pad4_uid218_fxpInPostAlign_X_uid56_fpExpETest(LOGICAL,217)@10
    rightShiftStage2Idx2Pad4_uid218_fxpInPostAlign_X_uid56_fpExpETest_a <= z_uid159_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage2Idx2Pad4_uid218_fxpInPostAlign_X_uid56_fpExpETest_b <= STD_LOGIC_VECTOR((3 downto 1 => ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_b_q(0)) & ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_b_q);
    rightShiftStage2Idx2Pad4_uid218_fxpInPostAlign_X_uid56_fpExpETest_q_i <= rightShiftStage2Idx2Pad4_uid218_fxpInPostAlign_X_uid56_fpExpETest_a or rightShiftStage2Idx2Pad4_uid218_fxpInPostAlign_X_uid56_fpExpETest_b;
    rightShiftStage2Idx2Pad4_uid218_fxpInPostAlign_X_uid56_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 4, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx2Pad4_uid218_fxpInPostAlign_X_uid56_fpExpETest_q, xin => rightShiftStage2Idx2Pad4_uid218_fxpInPostAlign_X_uid56_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage165dto4_uid219_fxpInPostAlign_X_uid56_fpExpETest(BITSELECT,218)@10
    RightShiftStage165dto4_uid219_fxpInPostAlign_X_uid56_fpExpETest_in <= rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_q;
    RightShiftStage165dto4_uid219_fxpInPostAlign_X_uid56_fpExpETest_b <= RightShiftStage165dto4_uid219_fxpInPostAlign_X_uid56_fpExpETest_in(65 downto 4);

	--ld_RightShiftStage165dto4_uid219_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx2_uid220_fxpInPostAlign_X_uid56_fpExpETest_a(DELAY,656)@10
    ld_RightShiftStage165dto4_uid219_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx2_uid220_fxpInPostAlign_X_uid56_fpExpETest_a : dspba_delay
    GENERIC MAP ( width => 62, depth => 1 )
    PORT MAP ( xin => RightShiftStage165dto4_uid219_fxpInPostAlign_X_uid56_fpExpETest_b, xout => ld_RightShiftStage165dto4_uid219_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx2_uid220_fxpInPostAlign_X_uid56_fpExpETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx2_uid220_fxpInPostAlign_X_uid56_fpExpETest(BITJOIN,219)@11
    rightShiftStage2Idx2_uid220_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage2Idx2Pad4_uid218_fxpInPostAlign_X_uid56_fpExpETest_q & ld_RightShiftStage165dto4_uid219_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx2_uid220_fxpInPostAlign_X_uid56_fpExpETest_a_q;

	--rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest(LOGICAL,213)@10
    rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_a <= z_uid155_fxpInPostAlign_uid45_fpExpETest_q;
    rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_b <= STD_LOGIC_VECTOR((1 downto 1 => ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_b_q(0)) & ld_msbx_uid186_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_b_q);
    rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_q_i <= rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_a or rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_b;
    rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 2, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_q, xin => rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage165dto2_uid215_fxpInPostAlign_X_uid56_fpExpETest(BITSELECT,214)@10
    RightShiftStage165dto2_uid215_fxpInPostAlign_X_uid56_fpExpETest_in <= rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_q;
    RightShiftStage165dto2_uid215_fxpInPostAlign_X_uid56_fpExpETest_b <= RightShiftStage165dto2_uid215_fxpInPostAlign_X_uid56_fpExpETest_in(65 downto 2);

	--ld_RightShiftStage165dto2_uid215_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1_uid216_fxpInPostAlign_X_uid56_fpExpETest_a(DELAY,652)@10
    ld_RightShiftStage165dto2_uid215_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1_uid216_fxpInPostAlign_X_uid56_fpExpETest_a : dspba_delay
    GENERIC MAP ( width => 64, depth => 1 )
    PORT MAP ( xin => RightShiftStage165dto2_uid215_fxpInPostAlign_X_uid56_fpExpETest_b, xout => ld_RightShiftStage165dto2_uid215_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1_uid216_fxpInPostAlign_X_uid56_fpExpETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx1_uid216_fxpInPostAlign_X_uid56_fpExpETest(BITJOIN,215)@11
    rightShiftStage2Idx1_uid216_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage2Idx1Pad2_uid214_fxpInPostAlign_X_uid56_fpExpETest_q & ld_RightShiftStage165dto2_uid215_fxpInPostAlign_X_uid56_fpExpETest_b_to_rightShiftStage2Idx1_uid216_fxpInPostAlign_X_uid56_fpExpETest_a_q;

	--reg_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_2(REG,368)@10
    reg_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_2_q <= "000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_2_q <= rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_1_a(DELAY,821)@5
    ld_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 5 )
    PORT MAP ( xin => rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_b, xout => ld_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_1(REG,367)@10
    reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_1_q <= ld_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_b_to_reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest(MUX,225)@11
    rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_s <= reg_rightShiftStageSel2Dto1_uid167_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_1_q;
    rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest: PROCESS (rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_s, en, reg_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_2_q, rightShiftStage2Idx1_uid216_fxpInPostAlign_X_uid56_fpExpETest_q, rightShiftStage2Idx2_uid220_fxpInPostAlign_X_uid56_fpExpETest_q, rightShiftStage2Idx3_uid224_fxpInPostAlign_X_uid56_fpExpETest_q)
    BEGIN
            CASE rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_s IS
                  WHEN "00" => rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_q <= reg_rightShiftStage1_uid212_fxpInPostAlign_X_uid56_fpExpETest_0_to_rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_2_q;
                  WHEN "01" => rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage2Idx1_uid216_fxpInPostAlign_X_uid56_fpExpETest_q;
                  WHEN "10" => rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage2Idx2_uid220_fxpInPostAlign_X_uid56_fpExpETest_q;
                  WHEN "11" => rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage2Idx3_uid224_fxpInPostAlign_X_uid56_fpExpETest_q;
                  WHEN OTHERS => rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_1(REG,369)@5
    reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_1_q <= rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_b(DELAY,671)@6
    ld_reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_1_q, xout => ld_reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest(MUX,231)@11
    rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_s <= ld_reg_rightShiftStageSel0Dto0_uid173_fxpInPostAlign_uid45_fpExpETest_0_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_1_q_to_rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_b_q;
    rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest: PROCESS (rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_s, en, rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_q, rightShiftStage3Idx1_uid230_fxpInPostAlign_X_uid56_fpExpETest_q)
    BEGIN
            CASE rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_s IS
                  WHEN "0" => rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage2_uid226_fxpInPostAlign_X_uid56_fpExpETest_q;
                  WHEN "1" => rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_q <= rightShiftStage3Idx1_uid230_fxpInPostAlign_X_uid56_fpExpETest_q;
                  WHEN OTHERS => rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--pad_fxpInPostAlignR_X_uid57_uid57_fpExpETest(BITJOIN,56)@11
    pad_fxpInPostAlignR_X_uid57_uid57_fpExpETest_q <= rightShiftStage3_uid232_fxpInPostAlign_X_uid56_fpExpETest_q & STD_LOGIC_VECTOR((7 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_fxpInPostAlignR_X_uid57_uid57_fpExpETest_0_to_yExt_uid57_fpExpETest_0(REG,373)@11
    reg_pad_fxpInPostAlignR_X_uid57_uid57_fpExpETest_0_to_yExt_uid57_fpExpETest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_fxpInPostAlignR_X_uid57_uid57_fpExpETest_0_to_yExt_uid57_fpExpETest_0_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_fxpInPostAlignR_X_uid57_uid57_fpExpETest_0_to_yExt_uid57_fpExpETest_0_q <= pad_fxpInPostAlignR_X_uid57_uid57_fpExpETest_q;
            END IF;
        END IF;
    END PROCESS;


	--yExt_uid57_fpExpETest(SUB,57)@12
    yExt_uid57_fpExpETest_a <= STD_LOGIC_VECTOR((75 downto 74 => reg_pad_fxpInPostAlignR_X_uid57_uid57_fpExpETest_0_to_yExt_uid57_fpExpETest_0_q(73)) & reg_pad_fxpInPostAlignR_X_uid57_uid57_fpExpETest_0_to_yExt_uid57_fpExpETest_0_q);
    yExt_uid57_fpExpETest_b <= STD_LOGIC_VECTOR((75 downto 75 => reg_sR_uid184_constMult_0_to_yExt_uid57_fpExpETest_1_q(74)) & reg_sR_uid184_constMult_0_to_yExt_uid57_fpExpETest_1_q);
            yExt_uid57_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(yExt_uid57_fpExpETest_a) - SIGNED(yExt_uid57_fpExpETest_b));
    yExt_uid57_fpExpETest_q <= yExt_uid57_fpExpETest_o(75 downto 0);


	--yRed_uid61_fpExpETest(BITSELECT,60)@12
    yRed_uid61_fpExpETest_in <= yExt_uid57_fpExpETest_q(60 downto 0);
    yRed_uid61_fpExpETest_b <= yRed_uid61_fpExpETest_in(60 downto 6);

	--reg_yRed_uid61_fpExpETest_0_to_yRedPostMux_uid62_fpExpETest_2(REG,376)@12
    reg_yRed_uid61_fpExpETest_0_to_yRedPostMux_uid62_fpExpETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yRed_uid61_fpExpETest_0_to_yRedPostMux_uid62_fpExpETest_2_q <= "0000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yRed_uid61_fpExpETest_0_to_yRedPostMux_uid62_fpExpETest_2_q <= yRed_uid61_fpExpETest_b;
            END IF;
        END IF;
    END PROCESS;


	--YExt75_uid59_fpExpETest(BITSELECT,58)@12
    YExt75_uid59_fpExpETest_in <= yExt_uid57_fpExpETest_q;
    YExt75_uid59_fpExpETest_b <= YExt75_uid59_fpExpETest_in(75 downto 75);

	--reg_YExt75_uid59_fpExpETest_0_to_yRedPostMux_uid62_fpExpETest_1(REG,375)@12
    reg_YExt75_uid59_fpExpETest_0_to_yRedPostMux_uid62_fpExpETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_YExt75_uid59_fpExpETest_0_to_yRedPostMux_uid62_fpExpETest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_YExt75_uid59_fpExpETest_0_to_yRedPostMux_uid62_fpExpETest_1_q <= YExt75_uid59_fpExpETest_b;
            END IF;
        END IF;
    END PROCESS;


	--yRedPostMux_uid62_fpExpETest(MUX,61)@13
    yRedPostMux_uid62_fpExpETest_s <= reg_YExt75_uid59_fpExpETest_0_to_yRedPostMux_uid62_fpExpETest_1_q;
    yRedPostMux_uid62_fpExpETest: PROCESS (yRedPostMux_uid62_fpExpETest_s, en, reg_yRed_uid61_fpExpETest_0_to_yRedPostMux_uid62_fpExpETest_2_q, zY_uid60_fpExpETest_q)
    BEGIN
            CASE yRedPostMux_uid62_fpExpETest_s IS
                  WHEN "0" => yRedPostMux_uid62_fpExpETest_q <= reg_yRed_uid61_fpExpETest_0_to_yRedPostMux_uid62_fpExpETest_2_q;
                  WHEN "1" => yRedPostMux_uid62_fpExpETest_q <= zY_uid60_fpExpETest_q;
                  WHEN OTHERS => yRedPostMux_uid62_fpExpETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--addr_uid64_fpExpETest(BITSELECT,63)@13
    addr_uid64_fpExpETest_in <= yRedPostMux_uid62_fpExpETest_q;
    addr_uid64_fpExpETest_b <= addr_uid64_fpExpETest_in(54 downto 48);

	--reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0(REG,378)@13
    reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q <= addr_uid64_fpExpETest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC5_uid247_exp10TabGen(LOOKUP,246)@14
    memoryC5_uid247_exp10TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC5_uid247_exp10TabGen_q <= "0010001001000001";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q) IS
                WHEN "0000000" =>  memoryC5_uid247_exp10TabGen_q <= "0010001001000001";
                WHEN "0000001" =>  memoryC5_uid247_exp10TabGen_q <= "0010001001001000";
                WHEN "0000010" =>  memoryC5_uid247_exp10TabGen_q <= "0010001010101001";
                WHEN "0000011" =>  memoryC5_uid247_exp10TabGen_q <= "0010001011011100";
                WHEN "0000100" =>  memoryC5_uid247_exp10TabGen_q <= "0010001101001010";
                WHEN "0000101" =>  memoryC5_uid247_exp10TabGen_q <= "0010001110011101";
                WHEN "0000110" =>  memoryC5_uid247_exp10TabGen_q <= "0010001111011110";
                WHEN "0000111" =>  memoryC5_uid247_exp10TabGen_q <= "0010010000100001";
                WHEN "0001000" =>  memoryC5_uid247_exp10TabGen_q <= "0010010001111001";
                WHEN "0001001" =>  memoryC5_uid247_exp10TabGen_q <= "0010010010110011";
                WHEN "0001010" =>  memoryC5_uid247_exp10TabGen_q <= "0010010100011101";
                WHEN "0001011" =>  memoryC5_uid247_exp10TabGen_q <= "0010010110010001";
                WHEN "0001100" =>  memoryC5_uid247_exp10TabGen_q <= "0010010110110101";
                WHEN "0001101" =>  memoryC5_uid247_exp10TabGen_q <= "0010010111001010";
                WHEN "0001110" =>  memoryC5_uid247_exp10TabGen_q <= "0010011000110010";
                WHEN "0001111" =>  memoryC5_uid247_exp10TabGen_q <= "0010011010111110";
                WHEN "0010000" =>  memoryC5_uid247_exp10TabGen_q <= "0010011010111110";
                WHEN "0010001" =>  memoryC5_uid247_exp10TabGen_q <= "0010011100001100";
                WHEN "0010010" =>  memoryC5_uid247_exp10TabGen_q <= "0010011110000010";
                WHEN "0010011" =>  memoryC5_uid247_exp10TabGen_q <= "0010011110101001";
                WHEN "0010100" =>  memoryC5_uid247_exp10TabGen_q <= "0010100001000000";
                WHEN "0010101" =>  memoryC5_uid247_exp10TabGen_q <= "0010100001011000";
                WHEN "0010110" =>  memoryC5_uid247_exp10TabGen_q <= "0010100011000011";
                WHEN "0010111" =>  memoryC5_uid247_exp10TabGen_q <= "0010100011110110";
                WHEN "0011000" =>  memoryC5_uid247_exp10TabGen_q <= "0010100101111001";
                WHEN "0011001" =>  memoryC5_uid247_exp10TabGen_q <= "0010100111010011";
                WHEN "0011010" =>  memoryC5_uid247_exp10TabGen_q <= "0010100111110111";
                WHEN "0011011" =>  memoryC5_uid247_exp10TabGen_q <= "0010101001011010";
                WHEN "0011100" =>  memoryC5_uid247_exp10TabGen_q <= "0010101011000110";
                WHEN "0011101" =>  memoryC5_uid247_exp10TabGen_q <= "0010101100100101";
                WHEN "0011110" =>  memoryC5_uid247_exp10TabGen_q <= "0010101110000010";
                WHEN "0011111" =>  memoryC5_uid247_exp10TabGen_q <= "0010101110001011";
                WHEN "0100000" =>  memoryC5_uid247_exp10TabGen_q <= "0010110000000101";
                WHEN "0100001" =>  memoryC5_uid247_exp10TabGen_q <= "0010110001011010";
                WHEN "0100010" =>  memoryC5_uid247_exp10TabGen_q <= "0010110010000000";
                WHEN "0100011" =>  memoryC5_uid247_exp10TabGen_q <= "0010110011110100";
                WHEN "0100100" =>  memoryC5_uid247_exp10TabGen_q <= "0010110101111111";
                WHEN "0100101" =>  memoryC5_uid247_exp10TabGen_q <= "0010110110001011";
                WHEN "0100110" =>  memoryC5_uid247_exp10TabGen_q <= "0010111000011100";
                WHEN "0100111" =>  memoryC5_uid247_exp10TabGen_q <= "0010111001101110";
                WHEN "0101000" =>  memoryC5_uid247_exp10TabGen_q <= "0010111010111100";
                WHEN "0101001" =>  memoryC5_uid247_exp10TabGen_q <= "0010111100100000";
                WHEN "0101010" =>  memoryC5_uid247_exp10TabGen_q <= "0010111111001011";
                WHEN "0101011" =>  memoryC5_uid247_exp10TabGen_q <= "0010111111101000";
                WHEN "0101100" =>  memoryC5_uid247_exp10TabGen_q <= "0011000001111110";
                WHEN "0101101" =>  memoryC5_uid247_exp10TabGen_q <= "0011000010101011";
                WHEN "0101110" =>  memoryC5_uid247_exp10TabGen_q <= "0011000011100011";
                WHEN "0101111" =>  memoryC5_uid247_exp10TabGen_q <= "0011000110001011";
                WHEN "0110000" =>  memoryC5_uid247_exp10TabGen_q <= "0011000111101010";
                WHEN "0110001" =>  memoryC5_uid247_exp10TabGen_q <= "0011001001011010";
                WHEN "0110010" =>  memoryC5_uid247_exp10TabGen_q <= "0011001010111110";
                WHEN "0110011" =>  memoryC5_uid247_exp10TabGen_q <= "0011001100101111";
                WHEN "0110100" =>  memoryC5_uid247_exp10TabGen_q <= "0011001101111011";
                WHEN "0110101" =>  memoryC5_uid247_exp10TabGen_q <= "0011001110111001";
                WHEN "0110110" =>  memoryC5_uid247_exp10TabGen_q <= "0011010001010100";
                WHEN "0110111" =>  memoryC5_uid247_exp10TabGen_q <= "0011010011001110";
                WHEN "0111000" =>  memoryC5_uid247_exp10TabGen_q <= "0011010100011010";
                WHEN "0111001" =>  memoryC5_uid247_exp10TabGen_q <= "0011010110001011";
                WHEN "0111010" =>  memoryC5_uid247_exp10TabGen_q <= "0011010111100000";
                WHEN "0111011" =>  memoryC5_uid247_exp10TabGen_q <= "0011011000111110";
                WHEN "0111100" =>  memoryC5_uid247_exp10TabGen_q <= "0011011010100100";
                WHEN "0111101" =>  memoryC5_uid247_exp10TabGen_q <= "0011011100101101";
                WHEN "0111110" =>  memoryC5_uid247_exp10TabGen_q <= "0011011110000100";
                WHEN "0111111" =>  memoryC5_uid247_exp10TabGen_q <= "0011100000111010";
                WHEN "1000000" =>  memoryC5_uid247_exp10TabGen_q <= "0011100010101001";
                WHEN "1000001" =>  memoryC5_uid247_exp10TabGen_q <= "0011100011011011";
                WHEN "1000010" =>  memoryC5_uid247_exp10TabGen_q <= "0011100100101101";
                WHEN "1000011" =>  memoryC5_uid247_exp10TabGen_q <= "0011100111101001";
                WHEN "1000100" =>  memoryC5_uid247_exp10TabGen_q <= "0011101001001000";
                WHEN "1000101" =>  memoryC5_uid247_exp10TabGen_q <= "0011101010110010";
                WHEN "1000110" =>  memoryC5_uid247_exp10TabGen_q <= "0011101101011011";
                WHEN "1000111" =>  memoryC5_uid247_exp10TabGen_q <= "0011101110010100";
                WHEN "1001000" =>  memoryC5_uid247_exp10TabGen_q <= "0011110000111010";
                WHEN "1001001" =>  memoryC5_uid247_exp10TabGen_q <= "0011110010100100";
                WHEN "1001010" =>  memoryC5_uid247_exp10TabGen_q <= "0011110100011110";
                WHEN "1001011" =>  memoryC5_uid247_exp10TabGen_q <= "0011110101101011";
                WHEN "1001100" =>  memoryC5_uid247_exp10TabGen_q <= "0011110111101011";
                WHEN "1001101" =>  memoryC5_uid247_exp10TabGen_q <= "0011111001110000";
                WHEN "1001110" =>  memoryC5_uid247_exp10TabGen_q <= "0011111100000010";
                WHEN "1001111" =>  memoryC5_uid247_exp10TabGen_q <= "0011111110001010";
                WHEN "1010000" =>  memoryC5_uid247_exp10TabGen_q <= "0011111111110011";
                WHEN "1010001" =>  memoryC5_uid247_exp10TabGen_q <= "0100000010000111";
                WHEN "1010010" =>  memoryC5_uid247_exp10TabGen_q <= "0100000011100011";
                WHEN "1010011" =>  memoryC5_uid247_exp10TabGen_q <= "0100000101110000";
                WHEN "1010100" =>  memoryC5_uid247_exp10TabGen_q <= "0100000111111001";
                WHEN "1010101" =>  memoryC5_uid247_exp10TabGen_q <= "0100001010101100";
                WHEN "1010110" =>  memoryC5_uid247_exp10TabGen_q <= "0100001100100110";
                WHEN "1010111" =>  memoryC5_uid247_exp10TabGen_q <= "0100001110000000";
                WHEN "1011000" =>  memoryC5_uid247_exp10TabGen_q <= "0100010000010100";
                WHEN "1011001" =>  memoryC5_uid247_exp10TabGen_q <= "0100010010100001";
                WHEN "1011010" =>  memoryC5_uid247_exp10TabGen_q <= "0100010101011001";
                WHEN "1011011" =>  memoryC5_uid247_exp10TabGen_q <= "0100011000000001";
                WHEN "1011100" =>  memoryC5_uid247_exp10TabGen_q <= "0100011000101011";
                WHEN "1011101" =>  memoryC5_uid247_exp10TabGen_q <= "0100011011000001";
                WHEN "1011110" =>  memoryC5_uid247_exp10TabGen_q <= "0100011110001011";
                WHEN "1011111" =>  memoryC5_uid247_exp10TabGen_q <= "0100100000010001";
                WHEN "1100000" =>  memoryC5_uid247_exp10TabGen_q <= "0100100010001001";
                WHEN "1100001" =>  memoryC5_uid247_exp10TabGen_q <= "0100100100101000";
                WHEN "1100010" =>  memoryC5_uid247_exp10TabGen_q <= "0100100111010100";
                WHEN "1100011" =>  memoryC5_uid247_exp10TabGen_q <= "0100101000111000";
                WHEN "1100100" =>  memoryC5_uid247_exp10TabGen_q <= "0100101011100001";
                WHEN "1100101" =>  memoryC5_uid247_exp10TabGen_q <= "0100101110010110";
                WHEN "1100110" =>  memoryC5_uid247_exp10TabGen_q <= "0100110000100110";
                WHEN "1100111" =>  memoryC5_uid247_exp10TabGen_q <= "0100110011000110";
                WHEN "1101000" =>  memoryC5_uid247_exp10TabGen_q <= "0100110100111001";
                WHEN "1101001" =>  memoryC5_uid247_exp10TabGen_q <= "0100110111010000";
                WHEN "1101010" =>  memoryC5_uid247_exp10TabGen_q <= "0100111010100101";
                WHEN "1101011" =>  memoryC5_uid247_exp10TabGen_q <= "0100111011110011";
                WHEN "1101100" =>  memoryC5_uid247_exp10TabGen_q <= "0100111110000101";
                WHEN "1101101" =>  memoryC5_uid247_exp10TabGen_q <= "0101000001001101";
                WHEN "1101110" =>  memoryC5_uid247_exp10TabGen_q <= "0101000100000110";
                WHEN "1101111" =>  memoryC5_uid247_exp10TabGen_q <= "0101000101110010";
                WHEN "1110000" =>  memoryC5_uid247_exp10TabGen_q <= "0101001000100011";
                WHEN "1110001" =>  memoryC5_uid247_exp10TabGen_q <= "0101001011000111";
                WHEN "1110010" =>  memoryC5_uid247_exp10TabGen_q <= "0101001101110100";
                WHEN "1110011" =>  memoryC5_uid247_exp10TabGen_q <= "0101010000111001";
                WHEN "1110100" =>  memoryC5_uid247_exp10TabGen_q <= "0101010010100101";
                WHEN "1110101" =>  memoryC5_uid247_exp10TabGen_q <= "0101010110001010";
                WHEN "1110110" =>  memoryC5_uid247_exp10TabGen_q <= "0101011000010010";
                WHEN "1110111" =>  memoryC5_uid247_exp10TabGen_q <= "0101011010111100";
                WHEN "1111000" =>  memoryC5_uid247_exp10TabGen_q <= "0101011110010101";
                WHEN "1111001" =>  memoryC5_uid247_exp10TabGen_q <= "0101011111111010";
                WHEN "1111010" =>  memoryC5_uid247_exp10TabGen_q <= "0101100011000011";
                WHEN "1111011" =>  memoryC5_uid247_exp10TabGen_q <= "0101100101011100";
                WHEN "1111100" =>  memoryC5_uid247_exp10TabGen_q <= "0101101000101110";
                WHEN "1111101" =>  memoryC5_uid247_exp10TabGen_q <= "0101101011100111";
                WHEN "1111110" =>  memoryC5_uid247_exp10TabGen_q <= "0101101111011111";
                WHEN "1111111" =>  memoryC5_uid247_exp10TabGen_q <= "0101110001010100";
                WHEN OTHERS =>
                    memoryC5_uid247_exp10TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--ld_yRedPostMux_uid62_fpExpETest_q_to_yPPolyEval_uid65_fpExpETest_a(DELAY,468)@13
    ld_yRedPostMux_uid62_fpExpETest_q_to_yPPolyEval_uid65_fpExpETest_a : dspba_delay
    GENERIC MAP ( width => 55, depth => 1 )
    PORT MAP ( xin => yRedPostMux_uid62_fpExpETest_q, xout => ld_yRedPostMux_uid62_fpExpETest_q_to_yPPolyEval_uid65_fpExpETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--yPPolyEval_uid65_fpExpETest(BITSELECT,64)@14
    yPPolyEval_uid65_fpExpETest_in <= ld_yRedPostMux_uid62_fpExpETest_q_to_yPPolyEval_uid65_fpExpETest_a_q(47 downto 0);
    yPPolyEval_uid65_fpExpETest_b <= yPPolyEval_uid65_fpExpETest_in(47 downto 0);

	--yT1_uid249_exp10PolyEval(BITSELECT,248)@14
    yT1_uid249_exp10PolyEval_in <= yPPolyEval_uid65_fpExpETest_b;
    yT1_uid249_exp10PolyEval_b <= yT1_uid249_exp10PolyEval_in(47 downto 32);

	--reg_yT1_uid249_exp10PolyEval_0_to_prodXY_uid280_pT1_uid250_exp10PolyEval_0(REG,384)@14
    reg_yT1_uid249_exp10PolyEval_0_to_prodXY_uid280_pT1_uid250_exp10PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid249_exp10PolyEval_0_to_prodXY_uid280_pT1_uid250_exp10PolyEval_0_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid249_exp10PolyEval_0_to_prodXY_uid280_pT1_uid250_exp10PolyEval_0_q <= yT1_uid249_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid280_pT1_uid250_exp10PolyEval(MULT,279)@15
    prodXY_uid280_pT1_uid250_exp10PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid280_pT1_uid250_exp10PolyEval_a),17)) * SIGNED(prodXY_uid280_pT1_uid250_exp10PolyEval_b);
    prodXY_uid280_pT1_uid250_exp10PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid280_pT1_uid250_exp10PolyEval_a <= (others => '0');
            prodXY_uid280_pT1_uid250_exp10PolyEval_b <= (others => '0');
            prodXY_uid280_pT1_uid250_exp10PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid280_pT1_uid250_exp10PolyEval_a <= reg_yT1_uid249_exp10PolyEval_0_to_prodXY_uid280_pT1_uid250_exp10PolyEval_0_q;
                prodXY_uid280_pT1_uid250_exp10PolyEval_b <= memoryC5_uid247_exp10TabGen_q;
                prodXY_uid280_pT1_uid250_exp10PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid280_pT1_uid250_exp10PolyEval_pr,32));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid280_pT1_uid250_exp10PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid280_pT1_uid250_exp10PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid280_pT1_uid250_exp10PolyEval_q <= prodXY_uid280_pT1_uid250_exp10PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid281_pT1_uid250_exp10PolyEval(BITSELECT,280)@18
    prodXYTruncFR_uid281_pT1_uid250_exp10PolyEval_in <= prodXY_uid280_pT1_uid250_exp10PolyEval_q;
    prodXYTruncFR_uid281_pT1_uid250_exp10PolyEval_b <= prodXYTruncFR_uid281_pT1_uid250_exp10PolyEval_in(31 downto 15);

	--highBBits_uid252_exp10PolyEval(BITSELECT,251)@18
    highBBits_uid252_exp10PolyEval_in <= prodXYTruncFR_uid281_pT1_uid250_exp10PolyEval_b;
    highBBits_uid252_exp10PolyEval_b <= highBBits_uid252_exp10PolyEval_in(16 downto 1);

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC4_uid245_exp10TabGen_0_q_to_memoryC4_uid245_exp10TabGen_a(DELAY,687)@14
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC4_uid245_exp10TabGen_0_q_to_memoryC4_uid245_exp10TabGen_a : dspba_delay
    GENERIC MAP ( width => 7, depth => 3 )
    PORT MAP ( xin => reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q, xout => ld_reg_addr_uid64_fpExpETest_0_to_memoryC4_uid245_exp10TabGen_0_q_to_memoryC4_uid245_exp10TabGen_a_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC4_uid245_exp10TabGen(LOOKUP,244)@17
    memoryC4_uid245_exp10TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC4_uid245_exp10TabGen_q <= "0010101010101010100110111";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_addr_uid64_fpExpETest_0_to_memoryC4_uid245_exp10TabGen_0_q_to_memoryC4_uid245_exp10TabGen_a_q) IS
                WHEN "0000000" =>  memoryC4_uid245_exp10TabGen_q <= "0010101010101010100110111";
                WHEN "0000001" =>  memoryC4_uid245_exp10TabGen_q <= "0010101100000000100101110";
                WHEN "0000010" =>  memoryC4_uid245_exp10TabGen_q <= "0010101101010110110010011";
                WHEN "0000011" =>  memoryC4_uid245_exp10TabGen_q <= "0010101110101101111001001";
                WHEN "0000100" =>  memoryC4_uid245_exp10TabGen_q <= "0010110000000101011001111";
                WHEN "0000101" =>  memoryC4_uid245_exp10TabGen_q <= "0010110001011101101101111";
                WHEN "0000110" =>  memoryC4_uid245_exp10TabGen_q <= "0010110010110110110100011";
                WHEN "0000111" =>  memoryC4_uid245_exp10TabGen_q <= "0010110100010000101001111";
                WHEN "0001000" =>  memoryC4_uid245_exp10TabGen_q <= "0010110101101011000011010";
                WHEN "0001001" =>  memoryC4_uid245_exp10TabGen_q <= "0010110111000110010011101";
                WHEN "0001010" =>  memoryC4_uid245_exp10TabGen_q <= "0010111000100010000011100";
                WHEN "0001011" =>  memoryC4_uid245_exp10TabGen_q <= "0010111001111110011110010";
                WHEN "0001100" =>  memoryC4_uid245_exp10TabGen_q <= "0010111011011100000001001";
                WHEN "0001101" =>  memoryC4_uid245_exp10TabGen_q <= "0010111100111010011010011";
                WHEN "0001110" =>  memoryC4_uid245_exp10TabGen_q <= "0010111110011001000101000";
                WHEN "0001111" =>  memoryC4_uid245_exp10TabGen_q <= "0010111111111000010100011";
                WHEN "0010000" =>  memoryC4_uid245_exp10TabGen_q <= "0011000001011001000010010";
                WHEN "0010001" =>  memoryC4_uid245_exp10TabGen_q <= "0011000010111010001000011";
                WHEN "0010010" =>  memoryC4_uid245_exp10TabGen_q <= "0011000100011011101101111";
                WHEN "0010011" =>  memoryC4_uid245_exp10TabGen_q <= "0011000101111110100011110";
                WHEN "0010100" =>  memoryC4_uid245_exp10TabGen_q <= "0011000111100001100011000";
                WHEN "0010101" =>  memoryC4_uid245_exp10TabGen_q <= "0011001001000101111111111";
                WHEN "0010110" =>  memoryC4_uid245_exp10TabGen_q <= "0011001010101010110100100";
                WHEN "0010111" =>  memoryC4_uid245_exp10TabGen_q <= "0011001100010000101101011";
                WHEN "0011000" =>  memoryC4_uid245_exp10TabGen_q <= "0011001101110110111101111";
                WHEN "0011001" =>  memoryC4_uid245_exp10TabGen_q <= "0011001111011110010000111";
                WHEN "0011010" =>  memoryC4_uid245_exp10TabGen_q <= "0011010001000110101010101";
                WHEN "0011011" =>  memoryC4_uid245_exp10TabGen_q <= "0011010010101111100100001";
                WHEN "0011100" =>  memoryC4_uid245_exp10TabGen_q <= "0011010100011001001101011";
                WHEN "0011101" =>  memoryC4_uid245_exp10TabGen_q <= "0011010110000011110001011";
                WHEN "0011110" =>  memoryC4_uid245_exp10TabGen_q <= "0011010111101111001100101";
                WHEN "0011111" =>  memoryC4_uid245_exp10TabGen_q <= "0011011001011011111000011";
                WHEN "0100000" =>  memoryC4_uid245_exp10TabGen_q <= "0011011011001000110101101";
                WHEN "0100001" =>  memoryC4_uid245_exp10TabGen_q <= "0011011100110110110111000";
                WHEN "0100010" =>  memoryC4_uid245_exp10TabGen_q <= "0011011110100101111111111";
                WHEN "0100011" =>  memoryC4_uid245_exp10TabGen_q <= "0011100000010101100111000";
                WHEN "0100100" =>  memoryC4_uid245_exp10TabGen_q <= "0011100010000101111100000";
                WHEN "0100101" =>  memoryC4_uid245_exp10TabGen_q <= "0011100011110111110110010";
                WHEN "0100110" =>  memoryC4_uid245_exp10TabGen_q <= "0011100101101001111011110";
                WHEN "0100111" =>  memoryC4_uid245_exp10TabGen_q <= "0011100111011101010011110";
                WHEN "0101000" =>  memoryC4_uid245_exp10TabGen_q <= "0011101001010001100010110";
                WHEN "0101001" =>  memoryC4_uid245_exp10TabGen_q <= "0011101011000110101000000";
                WHEN "0101010" =>  memoryC4_uid245_exp10TabGen_q <= "0011101100111100001111000";
                WHEN "0101011" =>  memoryC4_uid245_exp10TabGen_q <= "0011101110110011100001000";
                WHEN "0101100" =>  memoryC4_uid245_exp10TabGen_q <= "0011110000101011000101111";
                WHEN "0101101" =>  memoryC4_uid245_exp10TabGen_q <= "0011110010100100001011000";
                WHEN "0101110" =>  memoryC4_uid245_exp10TabGen_q <= "0011110100011110001001010";
                WHEN "0101111" =>  memoryC4_uid245_exp10TabGen_q <= "0011110110011000011111110";
                WHEN "0110000" =>  memoryC4_uid245_exp10TabGen_q <= "0011111000010100001101010";
                WHEN "0110001" =>  memoryC4_uid245_exp10TabGen_q <= "0011111010010000110001010";
                WHEN "0110010" =>  memoryC4_uid245_exp10TabGen_q <= "0011111100001110011011010";
                WHEN "0110011" =>  memoryC4_uid245_exp10TabGen_q <= "0011111110001100111101101";
                WHEN "0110100" =>  memoryC4_uid245_exp10TabGen_q <= "0100000000001100101011001";
                WHEN "0110101" =>  memoryC4_uid245_exp10TabGen_q <= "0100000010001101100001011";
                WHEN "0110110" =>  memoryC4_uid245_exp10TabGen_q <= "0100000100001110111000001";
                WHEN "0110111" =>  memoryC4_uid245_exp10TabGen_q <= "0100000110010001011001101";
                WHEN "0111000" =>  memoryC4_uid245_exp10TabGen_q <= "0100001000010101001110001";
                WHEN "0111001" =>  memoryC4_uid245_exp10TabGen_q <= "0100001010011001110101000";
                WHEN "0111010" =>  memoryC4_uid245_exp10TabGen_q <= "0100001100011111101101100";
                WHEN "0111011" =>  memoryC4_uid245_exp10TabGen_q <= "0100001110100110100010011";
                WHEN "0111100" =>  memoryC4_uid245_exp10TabGen_q <= "0100010000101110011010110";
                WHEN "0111101" =>  memoryC4_uid245_exp10TabGen_q <= "0100010010110111001010011";
                WHEN "0111110" =>  memoryC4_uid245_exp10TabGen_q <= "0100010101000001010010000";
                WHEN "0111111" =>  memoryC4_uid245_exp10TabGen_q <= "0100010111001011111100111";
                WHEN "1000000" =>  memoryC4_uid245_exp10TabGen_q <= "0100011001011000000110010";
                WHEN "1000001" =>  memoryC4_uid245_exp10TabGen_q <= "0100011011100101101010011";
                WHEN "1000010" =>  memoryC4_uid245_exp10TabGen_q <= "0100011101110100001011000";
                WHEN "1000011" =>  memoryC4_uid245_exp10TabGen_q <= "0100100000000011010000011";
                WHEN "1000100" =>  memoryC4_uid245_exp10TabGen_q <= "0100100010010011111101000";
                WHEN "1000101" =>  memoryC4_uid245_exp10TabGen_q <= "0100100100100101110001011";
                WHEN "1000110" =>  memoryC4_uid245_exp10TabGen_q <= "0100100110111000010110111";
                WHEN "1000111" =>  memoryC4_uid245_exp10TabGen_q <= "0100101001001100101100000";
                WHEN "1001000" =>  memoryC4_uid245_exp10TabGen_q <= "0100101011100001101000110";
                WHEN "1001001" =>  memoryC4_uid245_exp10TabGen_q <= "0100101101111000000100100";
                WHEN "1001010" =>  memoryC4_uid245_exp10TabGen_q <= "0100110000001111100110101";
                WHEN "1001011" =>  memoryC4_uid245_exp10TabGen_q <= "0100110010101000100001110";
                WHEN "1001100" =>  memoryC4_uid245_exp10TabGen_q <= "0100110101000010011011010";
                WHEN "1001101" =>  memoryC4_uid245_exp10TabGen_q <= "0100110111011101100001110";
                WHEN "1001110" =>  memoryC4_uid245_exp10TabGen_q <= "0100111001111001101111111";
                WHEN "1001111" =>  memoryC4_uid245_exp10TabGen_q <= "0100111100010111010001010";
                WHEN "1010000" =>  memoryC4_uid245_exp10TabGen_q <= "0100111110110110001011011";
                WHEN "1010001" =>  memoryC4_uid245_exp10TabGen_q <= "0101000001010110000111110";
                WHEN "1010010" =>  memoryC4_uid245_exp10TabGen_q <= "0101000011110111101000110";
                WHEN "1010011" =>  memoryC4_uid245_exp10TabGen_q <= "0101000110011010000111110";
                WHEN "1010100" =>  memoryC4_uid245_exp10TabGen_q <= "0101001000111101111101011";
                WHEN "1010101" =>  memoryC4_uid245_exp10TabGen_q <= "0101001011100010110100011";
                WHEN "1010110" =>  memoryC4_uid245_exp10TabGen_q <= "0101001110001001010100001";
                WHEN "1010111" =>  memoryC4_uid245_exp10TabGen_q <= "0101010000110001010011000";
                WHEN "1011000" =>  memoryC4_uid245_exp10TabGen_q <= "0101010011011010010000001";
                WHEN "1011001" =>  memoryC4_uid245_exp10TabGen_q <= "0101010110000100101000010";
                WHEN "1011010" =>  memoryC4_uid245_exp10TabGen_q <= "0101011000110000000100011";
                WHEN "1011011" =>  memoryC4_uid245_exp10TabGen_q <= "0101011011011100111110111";
                WHEN "1011100" =>  memoryC4_uid245_exp10TabGen_q <= "0101011110001011111000111";
                WHEN "1011101" =>  memoryC4_uid245_exp10TabGen_q <= "0101100000111011101001000";
                WHEN "1011110" =>  memoryC4_uid245_exp10TabGen_q <= "0101100011101100011101001";
                WHEN "1011111" =>  memoryC4_uid245_exp10TabGen_q <= "0101100110011111000100111";
                WHEN "1100000" =>  memoryC4_uid245_exp10TabGen_q <= "0101101001010011001001110";
                WHEN "1100001" =>  memoryC4_uid245_exp10TabGen_q <= "0101101100001000011001111";
                WHEN "1100010" =>  memoryC4_uid245_exp10TabGen_q <= "0101101110111111000101011";
                WHEN "1100011" =>  memoryC4_uid245_exp10TabGen_q <= "0101110001110111100010111";
                WHEN "1100100" =>  memoryC4_uid245_exp10TabGen_q <= "0101110100110001000110101";
                WHEN "1100101" =>  memoryC4_uid245_exp10TabGen_q <= "0101110111101100000011000";
                WHEN "1100110" =>  memoryC4_uid245_exp10TabGen_q <= "0101111010101000101010001";
                WHEN "1100111" =>  memoryC4_uid245_exp10TabGen_q <= "0101111101100110101011001";
                WHEN "1101000" =>  memoryC4_uid245_exp10TabGen_q <= "0110000000100110011100100";
                WHEN "1101001" =>  memoryC4_uid245_exp10TabGen_q <= "0110000011100111100001001";
                WHEN "1101010" =>  memoryC4_uid245_exp10TabGen_q <= "0110000110101001110010101";
                WHEN "1101011" =>  memoryC4_uid245_exp10TabGen_q <= "0110001001101110010010001";
                WHEN "1101100" =>  memoryC4_uid245_exp10TabGen_q <= "0110001100110011111111000";
                WHEN "1101101" =>  memoryC4_uid245_exp10TabGen_q <= "0110001111111010111100010";
                WHEN "1101110" =>  memoryC4_uid245_exp10TabGen_q <= "0110010011000011100101011";
                WHEN "1101111" =>  memoryC4_uid245_exp10TabGen_q <= "0110010110001110001010101";
                WHEN "1110000" =>  memoryC4_uid245_exp10TabGen_q <= "0110011001011010000010001";
                WHEN "1110001" =>  memoryC4_uid245_exp10TabGen_q <= "0110011100100111100001011";
                WHEN "1110010" =>  memoryC4_uid245_exp10TabGen_q <= "0110011111110110101000110";
                WHEN "1110011" =>  memoryC4_uid245_exp10TabGen_q <= "0110100011000111001100001";
                WHEN "1110100" =>  memoryC4_uid245_exp10TabGen_q <= "0110100110011001111010000";
                WHEN "1110101" =>  memoryC4_uid245_exp10TabGen_q <= "0110101001101101101000011";
                WHEN "1110110" =>  memoryC4_uid245_exp10TabGen_q <= "0110101101000011011111100";
                WHEN "1110111" =>  memoryC4_uid245_exp10TabGen_q <= "0110110000011010111001111";
                WHEN "1111000" =>  memoryC4_uid245_exp10TabGen_q <= "0110110011110011101100100";
                WHEN "1111001" =>  memoryC4_uid245_exp10TabGen_q <= "0110110111001110110110100";
                WHEN "1111010" =>  memoryC4_uid245_exp10TabGen_q <= "0110111010101011001101011";
                WHEN "1111011" =>  memoryC4_uid245_exp10TabGen_q <= "0110111110001001100010010";
                WHEN "1111100" =>  memoryC4_uid245_exp10TabGen_q <= "0111000001101001010101001";
                WHEN "1111101" =>  memoryC4_uid245_exp10TabGen_q <= "0111000101001011000010001";
                WHEN "1111110" =>  memoryC4_uid245_exp10TabGen_q <= "0111001000101110001001100";
                WHEN "1111111" =>  memoryC4_uid245_exp10TabGen_q <= "0111001100010011101111011";
                WHEN OTHERS =>
                    memoryC4_uid245_exp10TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid253_exp10PolyEval(ADD,252)@18
    sumAHighB_uid253_exp10PolyEval_a <= STD_LOGIC_VECTOR((25 downto 25 => memoryC4_uid245_exp10TabGen_q(24)) & memoryC4_uid245_exp10TabGen_q);
    sumAHighB_uid253_exp10PolyEval_b <= STD_LOGIC_VECTOR((25 downto 16 => highBBits_uid252_exp10PolyEval_b(15)) & highBBits_uid252_exp10PolyEval_b);
            sumAHighB_uid253_exp10PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid253_exp10PolyEval_a) + SIGNED(sumAHighB_uid253_exp10PolyEval_b));
    sumAHighB_uid253_exp10PolyEval_q <= sumAHighB_uid253_exp10PolyEval_o(25 downto 0);


	--lowRangeB_uid251_exp10PolyEval(BITSELECT,250)@18
    lowRangeB_uid251_exp10PolyEval_in <= prodXYTruncFR_uid281_pT1_uid250_exp10PolyEval_b(0 downto 0);
    lowRangeB_uid251_exp10PolyEval_b <= lowRangeB_uid251_exp10PolyEval_in(0 downto 0);

	--s1_uid251_uid254_exp10PolyEval(BITJOIN,253)@18
    s1_uid251_uid254_exp10PolyEval_q <= sumAHighB_uid253_exp10PolyEval_q & lowRangeB_uid251_exp10PolyEval_b;

	--reg_s1_uid251_uid254_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_1(REG,387)@18
    reg_s1_uid251_uid254_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid251_uid254_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid251_uid254_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_1_q <= s1_uid251_uid254_exp10PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_nor(LOGICAL,1157)
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_nor_b <= ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_sticky_ena_q;
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_nor_q <= not (ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_nor_a or ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_nor_b);

	--ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_cmpReg(REG,1155)
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_sticky_ena(REG,1158)
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_nor_q = "1") THEN
                ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_sticky_ena_q <= ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_enaAnd(LOGICAL,1159)
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_enaAnd_a <= ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_sticky_ena_q;
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_enaAnd_b <= en;
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_enaAnd_q <= ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_enaAnd_a and ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_enaAnd_b;

	--yT2_uid255_exp10PolyEval(BITSELECT,254)@14
    yT2_uid255_exp10PolyEval_in <= yPPolyEval_uid65_fpExpETest_b;
    yT2_uid255_exp10PolyEval_b <= yT2_uid255_exp10PolyEval_in(47 downto 23);

	--ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_inputreg(DELAY,1149)
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 25, depth => 1 )
    PORT MAP ( xin => yT2_uid255_exp10PolyEval_b, xout => ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdcnt(COUNTER,1151)
    -- every=1, low=0, high=1, step=1, init=1
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdcnt_i <= ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdcnt_i,1));


	--ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdreg(REG,1152)
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdreg_q <= ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdmux(MUX,1153)
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdmux_s <= en;
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdmux: PROCESS (ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdmux_s, ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdreg_q, ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdmux_q <= ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdreg_q;
                  WHEN "1" => ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdmux_q <= ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem(DUALMEM,1150)
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_ia <= ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_inputreg_q;
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_aa <= ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdreg_q;
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_ab <= ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_rdmux_q;
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 25,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 25,
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
        clocken1 => ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_iq,
        address_a => ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_aa,
        data_a => ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_ia
    );
    ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_reset0 <= areset;
        ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_q <= ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_iq(24 downto 0);

	--reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0(REG,386)@18
    reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_q <= ld_yT2_uid255_exp10PolyEval_b_to_reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid283_pT2_uid256_exp10PolyEval(MULT,282)@19
    prodXY_uid283_pT2_uid256_exp10PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid283_pT2_uid256_exp10PolyEval_a),26)) * SIGNED(prodXY_uid283_pT2_uid256_exp10PolyEval_b);
    prodXY_uid283_pT2_uid256_exp10PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid283_pT2_uid256_exp10PolyEval_a <= (others => '0');
            prodXY_uid283_pT2_uid256_exp10PolyEval_b <= (others => '0');
            prodXY_uid283_pT2_uid256_exp10PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid283_pT2_uid256_exp10PolyEval_a <= reg_yT2_uid255_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_0_q;
                prodXY_uid283_pT2_uid256_exp10PolyEval_b <= reg_s1_uid251_uid254_exp10PolyEval_0_to_prodXY_uid283_pT2_uid256_exp10PolyEval_1_q;
                prodXY_uid283_pT2_uid256_exp10PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid283_pT2_uid256_exp10PolyEval_pr,52));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid283_pT2_uid256_exp10PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid283_pT2_uid256_exp10PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid283_pT2_uid256_exp10PolyEval_q <= prodXY_uid283_pT2_uid256_exp10PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid284_pT2_uid256_exp10PolyEval(BITSELECT,283)@22
    prodXYTruncFR_uid284_pT2_uid256_exp10PolyEval_in <= prodXY_uid283_pT2_uid256_exp10PolyEval_q;
    prodXYTruncFR_uid284_pT2_uid256_exp10PolyEval_b <= prodXYTruncFR_uid284_pT2_uid256_exp10PolyEval_in(51 downto 24);

	--highBBits_uid258_exp10PolyEval(BITSELECT,257)@22
    highBBits_uid258_exp10PolyEval_in <= prodXYTruncFR_uid284_pT2_uid256_exp10PolyEval_b;
    highBBits_uid258_exp10PolyEval_b <= highBBits_uid258_exp10PolyEval_in(27 downto 1);

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_nor(LOGICAL,1055)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_nor_b <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_sticky_ena_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_nor_q <= not (ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_nor_a or ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_nor_b);

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_mem_top(CONSTANT,1051)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_mem_top_q <= "0100";

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmp(LOGICAL,1052)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmp_a <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_mem_top_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdmux_q);
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmp_q <= "1" when ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmp_a = ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmp_b else "0";

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmpReg(REG,1053)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmpReg_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_sticky_ena(REG,1056)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_nor_q = "1") THEN
                ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_sticky_ena_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_enaAnd(LOGICAL,1057)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_enaAnd_a <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_sticky_ena_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_enaAnd_b <= en;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_enaAnd_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_enaAnd_a and ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_enaAnd_b;

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_inputreg(DELAY,1006)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_inputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q, xout => ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt(COUNTER,1047)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_i = 3 THEN
                      ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_i <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_i <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_i,3));


	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdreg(REG,1048)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdreg_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdmux(MUX,1049)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdmux_s <= en;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdmux: PROCESS (ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdmux_s, ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdreg_q, ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdmux_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdmux_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem(DUALMEM,1046)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_ia <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_inputreg_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_aa <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdreg_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_ab <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_rdmux_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 7,
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
        clocken1 => ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_iq,
        address_a => ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_aa,
        data_a => ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_ia
    );
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_reset0 <= areset;
        ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_iq(6 downto 0);

	--memoryC3_uid243_exp10TabGen(LOOKUP,242)@21
    memoryC3_uid243_exp10TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC3_uid243_exp10TabGen_q <= "00101010101010101010101010101101111";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_addr_uid64_fpExpETest_0_to_memoryC3_uid243_exp10TabGen_0_q_to_memoryC3_uid243_exp10TabGen_a_replace_mem_q) IS
                WHEN "0000000" =>  memoryC3_uid243_exp10TabGen_q <= "00101010101010101010101010101101111";
                WHEN "0000001" =>  memoryC3_uid243_exp10TabGen_q <= "00101011000000000101010101101011011";
                WHEN "0000010" =>  memoryC3_uid243_exp10TabGen_q <= "00101011010101101010110001100001111";
                WHEN "0000011" =>  memoryC3_uid243_exp10TabGen_q <= "00101011101011011011000010011000001";
                WHEN "0000100" =>  memoryC3_uid243_exp10TabGen_q <= "00101100000001010110001110100011110";
                WHEN "0000101" =>  memoryC3_uid243_exp10TabGen_q <= "00101100010111011100011010111011100";
                WHEN "0000110" =>  memoryC3_uid243_exp10TabGen_q <= "00101100101101101101101100111110101";
                WHEN "0000111" =>  memoryC3_uid243_exp10TabGen_q <= "00101101000100001010001010010011010";
                WHEN "0001000" =>  memoryC3_uid243_exp10TabGen_q <= "00101101011010110001111001000001100";
                WHEN "0001001" =>  memoryC3_uid243_exp10TabGen_q <= "00101101110001100100111110001011000";
                WHEN "0001010" =>  memoryC3_uid243_exp10TabGen_q <= "00101110001000100011100000000110101";
                WHEN "0001011" =>  memoryC3_uid243_exp10TabGen_q <= "00101110011111101101100100010001111";
                WHEN "0001100" =>  memoryC3_uid243_exp10TabGen_q <= "00101110110111000011001111101001101";
                WHEN "0001101" =>  memoryC3_uid243_exp10TabGen_q <= "00101111001110100100101000011111000";
                WHEN "0001110" =>  memoryC3_uid243_exp10TabGen_q <= "00101111100110010001110101111100101";
                WHEN "0001111" =>  memoryC3_uid243_exp10TabGen_q <= "00101111111110001010111101010010000";
                WHEN "0010000" =>  memoryC3_uid243_exp10TabGen_q <= "00110000010110010000000010110000111";
                WHEN "0010001" =>  memoryC3_uid243_exp10TabGen_q <= "00110000101110100001001110011111001";
                WHEN "0010010" =>  memoryC3_uid243_exp10TabGen_q <= "00110001000110111110100110100000011";
                WHEN "0010011" =>  memoryC3_uid243_exp10TabGen_q <= "00110001011111101000001111001011001";
                WHEN "0010100" =>  memoryC3_uid243_exp10TabGen_q <= "00110001111000011110010001000100010";
                WHEN "0010101" =>  memoryC3_uid243_exp10TabGen_q <= "00110010010001100000101111101110000";
                WHEN "0010110" =>  memoryC3_uid243_exp10TabGen_q <= "00110010101010101111110011100001100";
                WHEN "0010111" =>  memoryC3_uid243_exp10TabGen_q <= "00110011000100001011100001100001111";
                WHEN "0011000" =>  memoryC3_uid243_exp10TabGen_q <= "00110011011101110100000001011100101";
                WHEN "0011001" =>  memoryC3_uid243_exp10TabGen_q <= "00110011110111101001011000010101000";
                WHEN "0011010" =>  memoryC3_uid243_exp10TabGen_q <= "00110100010001101011101100100010010";
                WHEN "0011011" =>  memoryC3_uid243_exp10TabGen_q <= "00110100101011111011000101110001111";
                WHEN "0011100" =>  memoryC3_uid243_exp10TabGen_q <= "00110101000110010111101010001110011";
                WHEN "0011101" =>  memoryC3_uid243_exp10TabGen_q <= "00110101100001000001100000000100001";
                WHEN "0011110" =>  memoryC3_uid243_exp10TabGen_q <= "00110101111011111000101110000101010";
                WHEN "0011111" =>  memoryC3_uid243_exp10TabGen_q <= "00110110010110111101011010010100110";
                WHEN "0100000" =>  memoryC3_uid243_exp10TabGen_q <= "00110110110010001111101101011010010";
                WHEN "0100001" =>  memoryC3_uid243_exp10TabGen_q <= "00110111001101101111101100101000101";
                WHEN "0100010" =>  memoryC3_uid243_exp10TabGen_q <= "00110111101001011101011110110010101";
                WHEN "0100011" =>  memoryC3_uid243_exp10TabGen_q <= "00111000000101011001001100000100111";
                WHEN "0100100" =>  memoryC3_uid243_exp10TabGen_q <= "00111000100001100010111011000111001";
                WHEN "0100101" =>  memoryC3_uid243_exp10TabGen_q <= "00111000111101111010110001000111010";
                WHEN "0100110" =>  memoryC3_uid243_exp10TabGen_q <= "00111001011010100000111000000010011";
                WHEN "0100111" =>  memoryC3_uid243_exp10TabGen_q <= "00111001110111010101010100101101100";
                WHEN "0101000" =>  memoryC3_uid243_exp10TabGen_q <= "00111010010100011000001111011100111";
                WHEN "0101001" =>  memoryC3_uid243_exp10TabGen_q <= "00111010110001101001101111010100011";
                WHEN "0101010" =>  memoryC3_uid243_exp10TabGen_q <= "00111011001111001001111100011010010";
                WHEN "0101011" =>  memoryC3_uid243_exp10TabGen_q <= "00111011101100111000111011110110001";
                WHEN "0101100" =>  memoryC3_uid243_exp10TabGen_q <= "00111100001010110110110111110001010";
                WHEN "0101101" =>  memoryC3_uid243_exp10TabGen_q <= "00111100101001000011110101010010101";
                WHEN "0101110" =>  memoryC3_uid243_exp10TabGen_q <= "00111101000111011111111101001100100";
                WHEN "0101111" =>  memoryC3_uid243_exp10TabGen_q <= "00111101100110001011011000000101100";
                WHEN "0110000" =>  memoryC3_uid243_exp10TabGen_q <= "00111110000101000110001011101110111";
                WHEN "0110001" =>  memoryC3_uid243_exp10TabGen_q <= "00111110100100010000100000111101010";
                WHEN "0110010" =>  memoryC3_uid243_exp10TabGen_q <= "00111111000011101010011110111011001";
                WHEN "0110011" =>  memoryC3_uid243_exp10TabGen_q <= "00111111100011010100001110000110011";
                WHEN "0110100" =>  memoryC3_uid243_exp10TabGen_q <= "01000000000011001101110101110010101";
                WHEN "0110101" =>  memoryC3_uid243_exp10TabGen_q <= "01000000100011010111011101111010000";
                WHEN "0110110" =>  memoryC3_uid243_exp10TabGen_q <= "01000001000011110001001111111000011";
                WHEN "0110111" =>  memoryC3_uid243_exp10TabGen_q <= "01000001100100011011010010100100000";
                WHEN "0111000" =>  memoryC3_uid243_exp10TabGen_q <= "01000010000101010101101101110001001";
                WHEN "0111001" =>  memoryC3_uid243_exp10TabGen_q <= "01000010100110100000101010111010001";
                WHEN "0111010" =>  memoryC3_uid243_exp10TabGen_q <= "01000011000111111100010001000011010";
                WHEN "0111011" =>  memoryC3_uid243_exp10TabGen_q <= "01000011101001101000101001100001011";
                WHEN "0111100" =>  memoryC3_uid243_exp10TabGen_q <= "01000100001011100101111100010101100";
                WHEN "0111101" =>  memoryC3_uid243_exp10TabGen_q <= "01000100101101110100010010011111111";
                WHEN "0111110" =>  memoryC3_uid243_exp10TabGen_q <= "01000101010000010011110011011101011";
                WHEN "0111111" =>  memoryC3_uid243_exp10TabGen_q <= "01000101110011000100101001100111101";
                WHEN "1000000" =>  memoryC3_uid243_exp10TabGen_q <= "01000110010110000110111011110001110";
                WHEN "1000001" =>  memoryC3_uid243_exp10TabGen_q <= "01000110111001011010110010110111001";
                WHEN "1000010" =>  memoryC3_uid243_exp10TabGen_q <= "01000111011101000000011000100111110";
                WHEN "1000011" =>  memoryC3_uid243_exp10TabGen_q <= "01001000000000110111110110101011010";
                WHEN "1000100" =>  memoryC3_uid243_exp10TabGen_q <= "01001000100101000001010100000000111";
                WHEN "1000101" =>  memoryC3_uid243_exp10TabGen_q <= "01001001001001011100111010100011101";
                WHEN "1000110" =>  memoryC3_uid243_exp10TabGen_q <= "01001001101110001010110100010011010";
                WHEN "1000111" =>  memoryC3_uid243_exp10TabGen_q <= "01001010010011001011001000011100000";
                WHEN "1001000" =>  memoryC3_uid243_exp10TabGen_q <= "01001010111000011110000010011000010";
                WHEN "1001001" =>  memoryC3_uid243_exp10TabGen_q <= "01001011011110000011101001110110000";
                WHEN "1001010" =>  memoryC3_uid243_exp10TabGen_q <= "01001100000011111100001000111111000";
                WHEN "1001011" =>  memoryC3_uid243_exp10TabGen_q <= "01001100101010000111101000110011011";
                WHEN "1001100" =>  memoryC3_uid243_exp10TabGen_q <= "01001101010000100110010011100000101";
                WHEN "1001101" =>  memoryC3_uid243_exp10TabGen_q <= "01001101110111011000010010010110010";
                WHEN "1001110" =>  memoryC3_uid243_exp10TabGen_q <= "01001110011110011101101111010011000";
                WHEN "1001111" =>  memoryC3_uid243_exp10TabGen_q <= "01001111000101110110110011101100000";
                WHEN "1010000" =>  memoryC3_uid243_exp10TabGen_q <= "01001111101101100011101001010010100";
                WHEN "1010001" =>  memoryC3_uid243_exp10TabGen_q <= "01010000010101100100011010101011011";
                WHEN "1010010" =>  memoryC3_uid243_exp10TabGen_q <= "01010000111101111001010000110011110";
                WHEN "1010011" =>  memoryC3_uid243_exp10TabGen_q <= "01010001100110100010010111000101101";
                WHEN "1010100" =>  memoryC3_uid243_exp10TabGen_q <= "01010010001111011111110110110000001";
                WHEN "1010101" =>  memoryC3_uid243_exp10TabGen_q <= "01010010111000110001111010111010000";
                WHEN "1010110" =>  memoryC3_uid243_exp10TabGen_q <= "01010011100010011000101100100001011";
                WHEN "1010111" =>  memoryC3_uid243_exp10TabGen_q <= "01010100001100010100010110011000000";
                WHEN "1011000" =>  memoryC3_uid243_exp10TabGen_q <= "01010100110110100101000100000100011";
                WHEN "1011001" =>  memoryC3_uid243_exp10TabGen_q <= "01010101100001001010111111000111101";
                WHEN "1011010" =>  memoryC3_uid243_exp10TabGen_q <= "01010110001100000110010011000111011";
                WHEN "1011011" =>  memoryC3_uid243_exp10TabGen_q <= "01010110110111010111001001110100000";
                WHEN "1011100" =>  memoryC3_uid243_exp10TabGen_q <= "01010111100010111101101101001011111";
                WHEN "1011101" =>  memoryC3_uid243_exp10TabGen_q <= "01011000001110111010001010001111101";
                WHEN "1011110" =>  memoryC3_uid243_exp10TabGen_q <= "01011000111011001100101011110000010";
                WHEN "1011111" =>  memoryC3_uid243_exp10TabGen_q <= "01011001100111110101011011001001100";
                WHEN "1100000" =>  memoryC3_uid243_exp10TabGen_q <= "01011010010100110100100100011100111";
                WHEN "1100001" =>  memoryC3_uid243_exp10TabGen_q <= "01011011000010001010010011100000000";
                WHEN "1100010" =>  memoryC3_uid243_exp10TabGen_q <= "01011011101111110110110010111100110";
                WHEN "1100011" =>  memoryC3_uid243_exp10TabGen_q <= "01011100011101111010001101110001000";
                WHEN "1100100" =>  memoryC3_uid243_exp10TabGen_q <= "01011101001100010100110000101110011";
                WHEN "1100101" =>  memoryC3_uid243_exp10TabGen_q <= "01011101111011000110100110111100011";
                WHEN "1100110" =>  memoryC3_uid243_exp10TabGen_q <= "01011110101010001111111011100011011";
                WHEN "1100111" =>  memoryC3_uid243_exp10TabGen_q <= "01011111011001110000111010111000000";
                WHEN "1101000" =>  memoryC3_uid243_exp10TabGen_q <= "01100000001001101001110000000101000";
                WHEN "1101001" =>  memoryC3_uid243_exp10TabGen_q <= "01100000111001111010101000001000101";
                WHEN "1101010" =>  memoryC3_uid243_exp10TabGen_q <= "01100001101010100011101111010001110";
                WHEN "1101011" =>  memoryC3_uid243_exp10TabGen_q <= "01100010011011100101001111110000101";
                WHEN "1101100" =>  memoryC3_uid243_exp10TabGen_q <= "01100011001100111111010111101111110";
                WHEN "1101101" =>  memoryC3_uid243_exp10TabGen_q <= "01100011111110110010010011100110010";
                WHEN "1101110" =>  memoryC3_uid243_exp10TabGen_q <= "01100100110000111110001110110101100";
                WHEN "1101111" =>  memoryC3_uid243_exp10TabGen_q <= "01100101100011100011010101101101001";
                WHEN "1110000" =>  memoryC3_uid243_exp10TabGen_q <= "01100110010110100001110101111100110";
                WHEN "1110001" =>  memoryC3_uid243_exp10TabGen_q <= "01100111001001111001111011111001101";
                WHEN "1110010" =>  memoryC3_uid243_exp10TabGen_q <= "01100111111101101011110100001100011";
                WHEN "1110011" =>  memoryC3_uid243_exp10TabGen_q <= "01101000110001110111101100011010111";
                WHEN "1110100" =>  memoryC3_uid243_exp10TabGen_q <= "01101001100110011101101111111111000";
                WHEN "1110101" =>  memoryC3_uid243_exp10TabGen_q <= "01101010011011011110001110011101010";
                WHEN "1110110" =>  memoryC3_uid243_exp10TabGen_q <= "01101011010000111001010010111011001";
                WHEN "1110111" =>  memoryC3_uid243_exp10TabGen_q <= "01101100000110101111001011110001101";
                WHEN "1111000" =>  memoryC3_uid243_exp10TabGen_q <= "01101100111101000000000111000100011";
                WHEN "1111001" =>  memoryC3_uid243_exp10TabGen_q <= "01101101110011101100010000001110111";
                WHEN "1111010" =>  memoryC3_uid243_exp10TabGen_q <= "01101110101010110011110111010100111";
                WHEN "1111011" =>  memoryC3_uid243_exp10TabGen_q <= "01101111100010010111001000101100111";
                WHEN "1111100" =>  memoryC3_uid243_exp10TabGen_q <= "01110000011010010110010011001011011";
                WHEN "1111101" =>  memoryC3_uid243_exp10TabGen_q <= "01110001010010110001100011111011011";
                WHEN "1111110" =>  memoryC3_uid243_exp10TabGen_q <= "01110010001011101001001010001001100";
                WHEN "1111111" =>  memoryC3_uid243_exp10TabGen_q <= "01110011000100111101010001111100100";
                WHEN OTHERS =>
                    memoryC3_uid243_exp10TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid259_exp10PolyEval(ADD,258)@22
    sumAHighB_uid259_exp10PolyEval_a <= STD_LOGIC_VECTOR((35 downto 35 => memoryC3_uid243_exp10TabGen_q(34)) & memoryC3_uid243_exp10TabGen_q);
    sumAHighB_uid259_exp10PolyEval_b <= STD_LOGIC_VECTOR((35 downto 27 => highBBits_uid258_exp10PolyEval_b(26)) & highBBits_uid258_exp10PolyEval_b);
            sumAHighB_uid259_exp10PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid259_exp10PolyEval_a) + SIGNED(sumAHighB_uid259_exp10PolyEval_b));
    sumAHighB_uid259_exp10PolyEval_q <= sumAHighB_uid259_exp10PolyEval_o(35 downto 0);


	--lowRangeB_uid257_exp10PolyEval(BITSELECT,256)@22
    lowRangeB_uid257_exp10PolyEval_in <= prodXYTruncFR_uid284_pT2_uid256_exp10PolyEval_b(0 downto 0);
    lowRangeB_uid257_exp10PolyEval_b <= lowRangeB_uid257_exp10PolyEval_in(0 downto 0);

	--s2_uid257_uid260_exp10PolyEval(BITJOIN,259)@22
    s2_uid257_uid260_exp10PolyEval_q <= sumAHighB_uid259_exp10PolyEval_q & lowRangeB_uid257_exp10PolyEval_b;

	--yTop18Bits_uid292_pT3_uid262_exp10PolyEval(BITSELECT,291)@22
    yTop18Bits_uid292_pT3_uid262_exp10PolyEval_in <= s2_uid257_uid260_exp10PolyEval_q;
    yTop18Bits_uid292_pT3_uid262_exp10PolyEval_b <= yTop18Bits_uid292_pT3_uid262_exp10PolyEval_in(36 downto 19);

	--reg_yTop18Bits_uid292_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_9(REG,392)@22
    reg_yTop18Bits_uid292_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop18Bits_uid292_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_9_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop18Bits_uid292_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_9_q <= yTop18Bits_uid292_pT3_uid262_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_nor(LOGICAL,1068)
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_nor_b <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_sticky_ena_q;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_nor_q <= not (ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_nor_a or ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_nor_b);

	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_sticky_ena(REG,1069)
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_nor_q = "1") THEN
                ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_sticky_ena_q <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_enaAnd(LOGICAL,1070)
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_enaAnd_a <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_sticky_ena_q;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_enaAnd_b <= en;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_enaAnd_q <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_enaAnd_a and ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_enaAnd_b;

	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_inputreg(DELAY,1058)
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 48, depth => 1 )
    PORT MAP ( xin => yPPolyEval_uid65_fpExpETest_b, xout => ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem(DUALMEM,1059)
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_ia <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_inputreg_q;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_aa <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdreg_q;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_ab <= ld_oFracX_uid32_uid32_fpExpETest_q_to_oFracXZwE_uid48_fpExpETest_b_replace_rdmux_q;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 48,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 48,
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
        clocken1 => ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_iq,
        address_a => ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_aa,
        data_a => ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_ia
    );
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_reset0 <= areset;
        ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_q <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_iq(47 downto 0);

	--yT3_uid261_exp10PolyEval(BITSELECT,260)@22
    yT3_uid261_exp10PolyEval_in <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_replace_mem_q;
    yT3_uid261_exp10PolyEval_b <= yT3_uid261_exp10PolyEval_in(47 downto 13);

	--xBottomBits_uid291_pT3_uid262_exp10PolyEval(BITSELECT,290)@22
    xBottomBits_uid291_pT3_uid262_exp10PolyEval_in <= yT3_uid261_exp10PolyEval_b(7 downto 0);
    xBottomBits_uid291_pT3_uid262_exp10PolyEval_b <= xBottomBits_uid291_pT3_uid262_exp10PolyEval_in(7 downto 0);

	--pad_xBottomBits_uid291_uid294_pT3_uid262_exp10PolyEval(BITJOIN,293)@22
    pad_xBottomBits_uid291_uid294_pT3_uid262_exp10PolyEval_q <= xBottomBits_uid291_pT3_uid262_exp10PolyEval_b & STD_LOGIC_VECTOR((8 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_xBottomBits_uid291_uid294_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_7(REG,391)@22
    reg_pad_xBottomBits_uid291_uid294_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_xBottomBits_uid291_uid294_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_7_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_xBottomBits_uid291_uid294_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_7_q <= pad_xBottomBits_uid291_uid294_pT3_uid262_exp10PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--yBottomBits_uid290_pT3_uid262_exp10PolyEval(BITSELECT,289)@22
    yBottomBits_uid290_pT3_uid262_exp10PolyEval_in <= s2_uid257_uid260_exp10PolyEval_q(9 downto 0);
    yBottomBits_uid290_pT3_uid262_exp10PolyEval_b <= yBottomBits_uid290_pT3_uid262_exp10PolyEval_in(9 downto 0);

	--spad_yBottomBits_uid290_uid293_pT3_uid262_exp10PolyEval(BITJOIN,292)@22
    spad_yBottomBits_uid290_uid293_pT3_uid262_exp10PolyEval_q <= GND_q & yBottomBits_uid290_pT3_uid262_exp10PolyEval_b;

	--pad_yBottomBits_uid290_uid295_pT3_uid262_exp10PolyEval(BITJOIN,294)@22
    pad_yBottomBits_uid290_uid295_pT3_uid262_exp10PolyEval_q <= spad_yBottomBits_uid290_uid293_pT3_uid262_exp10PolyEval_q & STD_LOGIC_VECTOR((6 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_yBottomBits_uid290_uid295_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_6(REG,390)@22
    reg_pad_yBottomBits_uid290_uid295_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_yBottomBits_uid290_uid295_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_6_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_yBottomBits_uid290_uid295_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_6_q <= pad_yBottomBits_uid290_uid295_pT3_uid262_exp10PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--xTop18Bits_uid289_pT3_uid262_exp10PolyEval(BITSELECT,288)@22
    xTop18Bits_uid289_pT3_uid262_exp10PolyEval_in <= yT3_uid261_exp10PolyEval_b;
    xTop18Bits_uid289_pT3_uid262_exp10PolyEval_b <= xTop18Bits_uid289_pT3_uid262_exp10PolyEval_in(34 downto 17);

	--reg_xTop18Bits_uid289_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_4(REG,389)@22
    reg_xTop18Bits_uid289_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop18Bits_uid289_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_4_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop18Bits_uid289_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_4_q <= xTop18Bits_uid289_pT3_uid262_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma(CHAINMULTADD,338)@23
    multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_a(0),19));
    multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_a(1),19));
    multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_p(0) <= multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_l(0) * multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_c(0);
    multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_p(1) <= multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_l(1) * multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_c(1);
    multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_w(0) <= RESIZE(multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_p(0),38) + RESIZE(multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_p(1),38);
    multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_x(0) <= multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_w(0);
    multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_y(0) <= multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_x(0);
    multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_a <= (others => (others => '0'));
            multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_c <= (others => (others => '0'));
            multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_a(0) <= RESIZE(UNSIGNED(reg_xTop18Bits_uid289_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_4_q),18);
            multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_a(1) <= RESIZE(UNSIGNED(reg_pad_xBottomBits_uid291_uid294_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_7_q),18);
            multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_c(0) <= RESIZE(SIGNED(reg_pad_yBottomBits_uid290_uid295_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_6_q),18);
            multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_c(1) <= RESIZE(SIGNED(reg_yTop18Bits_uid292_pT3_uid262_exp10PolyEval_0_to_multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_9_q),18);
            IF (en = "1") THEN
                multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_s(0) <= multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_delay : dspba_delay
    GENERIC MAP (width => 37, depth => 1)
    PORT MAP (xin => STD_LOGIC_VECTOR(multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_q, clk => clk, aclr => areset);

	--multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval(BITSELECT,296)@26
    multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_in <= multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_cma_q;
    multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_b <= multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_in(36 downto 7);

	--highBBits_uid299_pT3_uid262_exp10PolyEval(BITSELECT,298)@26
    highBBits_uid299_pT3_uid262_exp10PolyEval_in <= multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_b;
    highBBits_uid299_pT3_uid262_exp10PolyEval_b <= highBBits_uid299_pT3_uid262_exp10PolyEval_in(29 downto 1);

	--yTop27Bits_uid287_pT3_uid262_exp10PolyEval(BITSELECT,286)@22
    yTop27Bits_uid287_pT3_uid262_exp10PolyEval_in <= s2_uid257_uid260_exp10PolyEval_q;
    yTop27Bits_uid287_pT3_uid262_exp10PolyEval_b <= yTop27Bits_uid287_pT3_uid262_exp10PolyEval_in(36 downto 10);

	--reg_yTop27Bits_uid287_pT3_uid262_exp10PolyEval_0_to_topProd_uid288_pT3_uid262_exp10PolyEval_1(REG,394)@22
    reg_yTop27Bits_uid287_pT3_uid262_exp10PolyEval_0_to_topProd_uid288_pT3_uid262_exp10PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid287_pT3_uid262_exp10PolyEval_0_to_topProd_uid288_pT3_uid262_exp10PolyEval_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid287_pT3_uid262_exp10PolyEval_0_to_topProd_uid288_pT3_uid262_exp10PolyEval_1_q <= yTop27Bits_uid287_pT3_uid262_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--xTop27Bits_uid286_pT3_uid262_exp10PolyEval(BITSELECT,285)@22
    xTop27Bits_uid286_pT3_uid262_exp10PolyEval_in <= yT3_uid261_exp10PolyEval_b;
    xTop27Bits_uid286_pT3_uid262_exp10PolyEval_b <= xTop27Bits_uid286_pT3_uid262_exp10PolyEval_in(34 downto 8);

	--reg_xTop27Bits_uid286_pT3_uid262_exp10PolyEval_0_to_topProd_uid288_pT3_uid262_exp10PolyEval_0(REG,393)@22
    reg_xTop27Bits_uid286_pT3_uid262_exp10PolyEval_0_to_topProd_uid288_pT3_uid262_exp10PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid286_pT3_uid262_exp10PolyEval_0_to_topProd_uid288_pT3_uid262_exp10PolyEval_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop27Bits_uid286_pT3_uid262_exp10PolyEval_0_to_topProd_uid288_pT3_uid262_exp10PolyEval_0_q <= xTop27Bits_uid286_pT3_uid262_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--topProd_uid288_pT3_uid262_exp10PolyEval(MULT,287)@23
    topProd_uid288_pT3_uid262_exp10PolyEval_pr <= signed(resize(UNSIGNED(topProd_uid288_pT3_uid262_exp10PolyEval_a),28)) * SIGNED(topProd_uid288_pT3_uid262_exp10PolyEval_b);
    topProd_uid288_pT3_uid262_exp10PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid288_pT3_uid262_exp10PolyEval_a <= (others => '0');
            topProd_uid288_pT3_uid262_exp10PolyEval_b <= (others => '0');
            topProd_uid288_pT3_uid262_exp10PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid288_pT3_uid262_exp10PolyEval_a <= reg_xTop27Bits_uid286_pT3_uid262_exp10PolyEval_0_to_topProd_uid288_pT3_uid262_exp10PolyEval_0_q;
                topProd_uid288_pT3_uid262_exp10PolyEval_b <= reg_yTop27Bits_uid287_pT3_uid262_exp10PolyEval_0_to_topProd_uid288_pT3_uid262_exp10PolyEval_1_q;
                topProd_uid288_pT3_uid262_exp10PolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid288_pT3_uid262_exp10PolyEval_pr,54));
            END IF;
        END IF;
    END PROCESS;
    topProd_uid288_pT3_uid262_exp10PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid288_pT3_uid262_exp10PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid288_pT3_uid262_exp10PolyEval_q <= topProd_uid288_pT3_uid262_exp10PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--sumAHighB_uid300_pT3_uid262_exp10PolyEval(ADD,299)@26
    sumAHighB_uid300_pT3_uid262_exp10PolyEval_a <= STD_LOGIC_VECTOR((54 downto 54 => topProd_uid288_pT3_uid262_exp10PolyEval_q(53)) & topProd_uid288_pT3_uid262_exp10PolyEval_q);
    sumAHighB_uid300_pT3_uid262_exp10PolyEval_b <= STD_LOGIC_VECTOR((54 downto 29 => highBBits_uid299_pT3_uid262_exp10PolyEval_b(28)) & highBBits_uid299_pT3_uid262_exp10PolyEval_b);
            sumAHighB_uid300_pT3_uid262_exp10PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid300_pT3_uid262_exp10PolyEval_a) + SIGNED(sumAHighB_uid300_pT3_uid262_exp10PolyEval_b));
    sumAHighB_uid300_pT3_uid262_exp10PolyEval_q <= sumAHighB_uid300_pT3_uid262_exp10PolyEval_o(54 downto 0);


	--lowRangeB_uid298_pT3_uid262_exp10PolyEval(BITSELECT,297)@26
    lowRangeB_uid298_pT3_uid262_exp10PolyEval_in <= multSumOfTwo18_uid293_pT3_uid262_exp10PolyEval_b(0 downto 0);
    lowRangeB_uid298_pT3_uid262_exp10PolyEval_b <= lowRangeB_uid298_pT3_uid262_exp10PolyEval_in(0 downto 0);

	--add0_uid298_uid301_pT3_uid262_exp10PolyEval(BITJOIN,300)@26
    add0_uid298_uid301_pT3_uid262_exp10PolyEval_q <= sumAHighB_uid300_pT3_uid262_exp10PolyEval_q & lowRangeB_uid298_pT3_uid262_exp10PolyEval_b;

	--R_uid302_pT3_uid262_exp10PolyEval(BITSELECT,301)@26
    R_uid302_pT3_uid262_exp10PolyEval_in <= add0_uid298_uid301_pT3_uid262_exp10PolyEval_q(54 downto 0);
    R_uid302_pT3_uid262_exp10PolyEval_b <= R_uid302_pT3_uid262_exp10PolyEval_in(54 downto 18);

	--reg_R_uid302_pT3_uid262_exp10PolyEval_0_to_ts3_uid265_exp10PolyEval_1(REG,396)@26
    reg_R_uid302_pT3_uid262_exp10PolyEval_0_to_ts3_uid265_exp10PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid302_pT3_uid262_exp10PolyEval_0_to_ts3_uid265_exp10PolyEval_1_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_R_uid302_pT3_uid262_exp10PolyEval_0_to_ts3_uid265_exp10PolyEval_1_q <= R_uid302_pT3_uid262_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_nor(LOGICAL,1042)
    ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_nor_b <= ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_sticky_ena_q;
    ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_nor_q <= not (ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_nor_a or ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_nor_b);

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_mem_top(CONSTANT,1025)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_mem_top_q <= "01000";

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmp(LOGICAL,1026)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmp_a <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_mem_top_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdmux_q);
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmp_q <= "1" when ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmp_a = ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmp_b else "0";

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmpReg(REG,1027)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmpReg_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_sticky_ena(REG,1043)
    ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_nor_q = "1") THEN
                ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_sticky_ena_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_enaAnd(LOGICAL,1044)
    ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_enaAnd_a <= ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_sticky_ena_q;
    ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_enaAnd_b <= en;
    ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_enaAnd_q <= ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_enaAnd_a and ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_enaAnd_b;

	--memoryC2_uid241_exp10TabGen(LOOKUP,240)@14
    memoryC2_uid241_exp10TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC2_uid241_exp10TabGen_q <= "000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q) IS
                WHEN "0000000" =>  memoryC2_uid241_exp10TabGen_q <= "000";
                WHEN "0000001" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0000010" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0000011" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0000100" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0000101" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0000110" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0000111" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0001000" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0001001" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0001010" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0001011" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0001100" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0001101" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0001110" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0001111" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0010000" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0010001" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0010010" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0010011" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0010100" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0010101" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0010110" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0010111" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0011000" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0011001" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0011010" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0011011" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0011100" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0011101" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0011110" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0011111" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0100000" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0100001" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0100010" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0100011" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0100100" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0100101" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0100110" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0100111" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0101000" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0101001" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0101010" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0101011" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0101100" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0101101" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0101110" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0101111" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0110000" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0110001" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0110010" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0110011" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0110100" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0110101" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0110110" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0110111" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0111000" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0111001" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0111010" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0111011" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0111100" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0111101" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0111110" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "0111111" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1000000" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1000001" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1000010" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1000011" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1000100" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1000101" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1000110" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1000111" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1001000" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1001001" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1001010" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1001011" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1001100" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1001101" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1001110" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1001111" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1010000" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1010001" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1010010" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1010011" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1010100" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1010101" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1010110" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1010111" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1011000" =>  memoryC2_uid241_exp10TabGen_q <= "001";
                WHEN "1011001" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1011010" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1011011" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1011100" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1011101" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1011110" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1011111" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1100000" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1100001" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1100010" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1100011" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1100100" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1100101" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1100110" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1100111" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1101000" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1101001" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1101010" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1101011" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1101100" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1101101" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1101110" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1101111" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1110000" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1110001" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1110010" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1110011" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1110100" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1110101" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1110110" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1110111" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1111000" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1111001" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1111010" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1111011" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1111100" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1111101" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1111110" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN "1111111" =>  memoryC2_uid241_exp10TabGen_q <= "010";
                WHEN OTHERS =>
                    memoryC2_uid241_exp10TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_inputreg(DELAY,1032)
    ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => memoryC2_uid241_exp10TabGen_q, xout => ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt(COUNTER,1021)
    -- every=1, low=0, high=8, step=1, init=1
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_i = 7 THEN
                      ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_i <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_i - 8;
                    ELSE
                        ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_i <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_i,4));


	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdreg(REG,1022)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdreg_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdmux(MUX,1023)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdmux_s <= en;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdmux: PROCESS (ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdmux_s, ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdreg_q, ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdmux_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdmux_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem(DUALMEM,1033)
    ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_ia <= ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_inputreg_q;
    ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_aa <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdreg_q;
    ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_ab <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdmux_q;
    ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 3,
        widthad_b => 4,
        numwords_b => 9,
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
        clocken1 => ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_iq,
        address_a => ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_aa,
        data_a => ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_ia
    );
    ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_reset0 <= areset;
        ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_q <= ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_iq(2 downto 0);

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_nor(LOGICAL,1029)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_nor_b <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_sticky_ena_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_nor_q <= not (ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_nor_a or ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_nor_b);

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_sticky_ena(REG,1030)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_nor_q = "1") THEN
                ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_sticky_ena_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_enaAnd(LOGICAL,1031)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_enaAnd_a <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_sticky_ena_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_enaAnd_b <= en;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_enaAnd_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_enaAnd_a and ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_enaAnd_b;

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem(DUALMEM,1020)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_ia <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_inputreg_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_aa <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdreg_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_ab <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_rdmux_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 7,
        widthad_b => 4,
        numwords_b => 9,
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
        clocken1 => ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_iq,
        address_a => ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_aa,
        data_a => ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_ia
    );
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_reset0 <= areset;
        ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_iq(6 downto 0);

	--memoryC2_uid240_exp10TabGen(LOOKUP,239)@25
    memoryC2_uid240_exp10TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC2_uid240_exp10TabGen_q <= "1111111111111111111111111111111111111110";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_addr_uid64_fpExpETest_0_to_memoryC2_uid240_exp10TabGen_0_q_to_memoryC2_uid240_exp10TabGen_a_replace_mem_q) IS
                WHEN "0000000" =>  memoryC2_uid240_exp10TabGen_q <= "1111111111111111111111111111111111111110";
                WHEN "0000001" =>  memoryC2_uid240_exp10TabGen_q <= "0000001000000010000000010101011000111101";
                WHEN "0000010" =>  memoryC2_uid240_exp10TabGen_q <= "0000010000001000000010101011010101111110";
                WHEN "0000011" =>  memoryC2_uid240_exp10TabGen_q <= "0000011000010010001001000011011001110000";
                WHEN "0000100" =>  memoryC2_uid240_exp10TabGen_q <= "0000100000100000010101100000000100100100";
                WHEN "0000101" =>  memoryC2_uid240_exp10TabGen_q <= "0000101000110010101010000100111010011000";
                WHEN "0000110" =>  memoryC2_uid240_exp10TabGen_q <= "0000110001001001001000110110100000100101";
                WHEN "0000111" =>  memoryC2_uid240_exp10TabGen_q <= "0000111001100011110011111010011111000001";
                WHEN "0001000" =>  memoryC2_uid240_exp10TabGen_q <= "0001000010000010101101010111011111010100";
                WHEN "0001001" =>  memoryC2_uid240_exp10TabGen_q <= "0001001010100101110111010101010001000100";
                WHEN "0001010" =>  memoryC2_uid240_exp10TabGen_q <= "0001010011001101010011111100100101110011";
                WHEN "0001011" =>  memoryC2_uid240_exp10TabGen_q <= "0001011011111001000101010111010101000111";
                WHEN "0001100" =>  memoryC2_uid240_exp10TabGen_q <= "0001100100101001001101110000011100110000";
                WHEN "0001101" =>  memoryC2_uid240_exp10TabGen_q <= "0001101101011101101111010011111110010110";
                WHEN "0001110" =>  memoryC2_uid240_exp10TabGen_q <= "0001110110010110101100001110111111110111";
                WHEN "0001111" =>  memoryC2_uid240_exp10TabGen_q <= "0001111111010100000110101111110001111100";
                WHEN "0010000" =>  memoryC2_uid240_exp10TabGen_q <= "0010001000010110000001000101101110000011";
                WHEN "0010001" =>  memoryC2_uid240_exp10TabGen_q <= "0010010001011100011101100001001111011100";
                WHEN "0010010" =>  memoryC2_uid240_exp10TabGen_q <= "0010011010100111011110010011111100111011";
                WHEN "0010011" =>  memoryC2_uid240_exp10TabGen_q <= "0010100011110111000101110000101010010001";
                WHEN "0010100" =>  memoryC2_uid240_exp10TabGen_q <= "0010101101001011010110001011001100110101";
                WHEN "0010101" =>  memoryC2_uid240_exp10TabGen_q <= "0010110110100100010001111000101101100011";
                WHEN "0010110" =>  memoryC2_uid240_exp10TabGen_q <= "0011000000000001111011001111010111110010";
                WHEN "0010111" =>  memoryC2_uid240_exp10TabGen_q <= "0011001001100100010100100110100111111010";
                WHEN "0011000" =>  memoryC2_uid240_exp10TabGen_q <= "0011010011001011100000010111000010000011";
                WHEN "0011001" =>  memoryC2_uid240_exp10TabGen_q <= "0011011100110111100000111010011011101000";
                WHEN "0011010" =>  memoryC2_uid240_exp10TabGen_q <= "0011100110101000011000101011110100111100";
                WHEN "0011011" =>  memoryC2_uid240_exp10TabGen_q <= "0011110000011110001010000111011001111100";
                WHEN "0011100" =>  memoryC2_uid240_exp10TabGen_q <= "0011111010011000110111101010100111100101";
                WHEN "0011101" =>  memoryC2_uid240_exp10TabGen_q <= "0100000100011000100011110100001010001010";
                WHEN "0011110" =>  memoryC2_uid240_exp10TabGen_q <= "0100001110011101010001000011111100100101";
                WHEN "0011111" =>  memoryC2_uid240_exp10TabGen_q <= "0100011000100111000001111011001011001100";
                WHEN "0100000" =>  memoryC2_uid240_exp10TabGen_q <= "0100100010110101111000111100001111001111";
                WHEN "0100001" =>  memoryC2_uid240_exp10TabGen_q <= "0100101101001001111000101010111001001000";
                WHEN "0100010" =>  memoryC2_uid240_exp10TabGen_q <= "0100110111100011000011101100001000111111";
                WHEN "0100011" =>  memoryC2_uid240_exp10TabGen_q <= "0101000010000001011100100110001111011101";
                WHEN "0100100" =>  memoryC2_uid240_exp10TabGen_q <= "0101001100100101000110000000110011010000";
                WHEN "0100101" =>  memoryC2_uid240_exp10TabGen_q <= "0101010111001110000010100100110010001010";
                WHEN "0100110" =>  memoryC2_uid240_exp10TabGen_q <= "0101100001111100010100111100010110010011";
                WHEN "0100111" =>  memoryC2_uid240_exp10TabGen_q <= "0101101100101111111111110011001000100100";
                WHEN "0101000" =>  memoryC2_uid240_exp10TabGen_q <= "0101110111101001000101110110000001011000";
                WHEN "0101001" =>  memoryC2_uid240_exp10TabGen_q <= "0110000010100111101001110011010011000100";
                WHEN "0101010" =>  memoryC2_uid240_exp10TabGen_q <= "0110001101101011101110011010100101000110";
                WHEN "0101011" =>  memoryC2_uid240_exp10TabGen_q <= "0110011000110101010110011100111100100110";
                WHEN "0101100" =>  memoryC2_uid240_exp10TabGen_q <= "0110100100000100100100101100101110111111";
                WHEN "0101101" =>  memoryC2_uid240_exp10TabGen_q <= "0110101111011001011011111101110100000010";
                WHEN "0101110" =>  memoryC2_uid240_exp10TabGen_q <= "0110111010110011111111000101010111011100";
                WHEN "0101111" =>  memoryC2_uid240_exp10TabGen_q <= "0111000110010100010000111010000000011010";
                WHEN "0110000" =>  memoryC2_uid240_exp10TabGen_q <= "0111010001111010010100010011110110101100";
                WHEN "0110001" =>  memoryC2_uid240_exp10TabGen_q <= "0111011101100110001100001100011001001011";
                WHEN "0110010" =>  memoryC2_uid240_exp10TabGen_q <= "0111101001010111111011011110100111010001";
                WHEN "0110011" =>  memoryC2_uid240_exp10TabGen_q <= "0111110101001111100101000110111011011110";
                WHEN "0110100" =>  memoryC2_uid240_exp10TabGen_q <= "1000000001001101001100000011010001011000";
                WHEN "0110101" =>  memoryC2_uid240_exp10TabGen_q <= "1000001101010000110011010011000011001011";
                WHEN "0110110" =>  memoryC2_uid240_exp10TabGen_q <= "1000011001011010011101110111001000000101";
                WHEN "0110111" =>  memoryC2_uid240_exp10TabGen_q <= "1000100101101010001110110001111100111001";
                WHEN "0111000" =>  memoryC2_uid240_exp10TabGen_q <= "1000110010000000001001000111011110101101";
                WHEN "0111001" =>  memoryC2_uid240_exp10TabGen_q <= "1000111110011100001111111101001001110101";
                WHEN "0111010" =>  memoryC2_uid240_exp10TabGen_q <= "1001001010111110100110011010000010101010";
                WHEN "0111011" =>  memoryC2_uid240_exp10TabGen_q <= "1001010111100111001111100110101100101010";
                WHEN "0111100" =>  memoryC2_uid240_exp10TabGen_q <= "1001100100010110001110101101010011010010";
                WHEN "0111101" =>  memoryC2_uid240_exp10TabGen_q <= "1001110001001011100110111001100101010000";
                WHEN "0111110" =>  memoryC2_uid240_exp10TabGen_q <= "1001111110000111011011011000111010110011";
                WHEN "0111111" =>  memoryC2_uid240_exp10TabGen_q <= "1010001011001001101111011010001101110011";
                WHEN "1000000" =>  memoryC2_uid240_exp10TabGen_q <= "1010011000010010100110001110000110110000";
                WHEN "1000001" =>  memoryC2_uid240_exp10TabGen_q <= "1010100101100010000011000110110011000011";
                WHEN "1000010" =>  memoryC2_uid240_exp10TabGen_q <= "1010110010111000001001011000001000011101";
                WHEN "1000011" =>  memoryC2_uid240_exp10TabGen_q <= "1011000000010100111100010111100111011010";
                WHEN "1000100" =>  memoryC2_uid240_exp10TabGen_q <= "1011001101111000011111011100100000000010";
                WHEN "1000101" =>  memoryC2_uid240_exp10TabGen_q <= "1011011011100010110101111111101001110101";
                WHEN "1000110" =>  memoryC2_uid240_exp10TabGen_q <= "1011101001010100000011011011101000101011";
                WHEN "1000111" =>  memoryC2_uid240_exp10TabGen_q <= "1011110111001100001011001100110011100100";
                WHEN "1001000" =>  memoryC2_uid240_exp10TabGen_q <= "1100000101001011010000110001001000111011";
                WHEN "1001001" =>  memoryC2_uid240_exp10TabGen_q <= "1100010011010001010111101000011100110101";
                WHEN "1001010" =>  memoryC2_uid240_exp10TabGen_q <= "1100100001011110100011010100001111110100";
                WHEN "1001011" =>  memoryC2_uid240_exp10TabGen_q <= "1100101111110010110111010111110101100001";
                WHEN "1001100" =>  memoryC2_uid240_exp10TabGen_q <= "1100111110001110010111011000010010001101";
                WHEN "1001101" =>  memoryC2_uid240_exp10TabGen_q <= "1101001100110001000110111100011110011111";
                WHEN "1001110" =>  memoryC2_uid240_exp10TabGen_q <= "1101011011011011001001101101000101101011";
                WHEN "1001111" =>  memoryC2_uid240_exp10TabGen_q <= "1101101010001100100011010100101001011110";
                WHEN "1010000" =>  memoryC2_uid240_exp10TabGen_q <= "1101111001000101010111011111100000010111";
                WHEN "1010001" =>  memoryC2_uid240_exp10TabGen_q <= "1110001000000101101001111011110110011101";
                WHEN "1010010" =>  memoryC2_uid240_exp10TabGen_q <= "1110010111001101011110011001110010010001";
                WHEN "1010011" =>  memoryC2_uid240_exp10TabGen_q <= "1110100110011100111000101011001110100000";
                WHEN "1010100" =>  memoryC2_uid240_exp10TabGen_q <= "1110110101110011111100100100000011101110";
                WHEN "1010101" =>  memoryC2_uid240_exp10TabGen_q <= "1111000101010010101101111010000001001010";
                WHEN "1010110" =>  memoryC2_uid240_exp10TabGen_q <= "1111010100111001010000100100110101110101";
                WHEN "1010111" =>  memoryC2_uid240_exp10TabGen_q <= "1111100100100111101000011110001001101110";
                WHEN "1011000" =>  memoryC2_uid240_exp10TabGen_q <= "1111110100011101111001100001100000110101";
                WHEN "1011001" =>  memoryC2_uid240_exp10TabGen_q <= "0000000100011100000111101100100001100111";
                WHEN "1011010" =>  memoryC2_uid240_exp10TabGen_q <= "0000010100100010010110111110101101101101";
                WHEN "1011011" =>  memoryC2_uid240_exp10TabGen_q <= "0000100100110000101011011001101011000010";
                WHEN "1011100" =>  memoryC2_uid240_exp10TabGen_q <= "0000110101000111001001000000111111111100";
                WHEN "1011101" =>  memoryC2_uid240_exp10TabGen_q <= "0001000101100101110011111010010000100110";
                WHEN "1011110" =>  memoryC2_uid240_exp10TabGen_q <= "0001010110001100110000001101000111110111";
                WHEN "1011111" =>  memoryC2_uid240_exp10TabGen_q <= "0001100110111100000010000011011000000011";
                WHEN "1100000" =>  memoryC2_uid240_exp10TabGen_q <= "0001110111110011101101101000110011111110";
                WHEN "1100001" =>  memoryC2_uid240_exp10TabGen_q <= "0010001000110011110111001011010101100011";
                WHEN "1100010" =>  memoryC2_uid240_exp10TabGen_q <= "0010011001111100100010111011000000110011";
                WHEN "1100011" =>  memoryC2_uid240_exp10TabGen_q <= "0010101011001101110101001010000001001001";
                WHEN "1100100" =>  memoryC2_uid240_exp10TabGen_q <= "0010111100100111110010001100101001010000";
                WHEN "1100101" =>  memoryC2_uid240_exp10TabGen_q <= "0011001110001010011110011001011001001101";
                WHEN "1100110" =>  memoryC2_uid240_exp10TabGen_q <= "0011011111110101111110001000111101001011";
                WHEN "1100111" =>  memoryC2_uid240_exp10TabGen_q <= "0011110001101010010101110110001100010001";
                WHEN "1101000" =>  memoryC2_uid240_exp10TabGen_q <= "0100000011100111101001111110001101110100";
                WHEN "1101001" =>  memoryC2_uid240_exp10TabGen_q <= "0100010101101101111111000000010101000100";
                WHEN "1101010" =>  memoryC2_uid240_exp10TabGen_q <= "0100100111111101011001011110000111001011";
                WHEN "1101011" =>  memoryC2_uid240_exp10TabGen_q <= "0100111010010101111101111011011110000001";
                WHEN "1101100" =>  memoryC2_uid240_exp10TabGen_q <= "0101001100110111110000111110011111101100";
                WHEN "1101101" =>  memoryC2_uid240_exp10TabGen_q <= "0101011111100010110111001111101000111010";
                WHEN "1101110" =>  memoryC2_uid240_exp10TabGen_q <= "0101110010010111010101011001101101000111";
                WHEN "1101111" =>  memoryC2_uid240_exp10TabGen_q <= "0110000101010101010000001001110100001010";
                WHEN "1110000" =>  memoryC2_uid240_exp10TabGen_q <= "0110011000011100101100001111011011010100";
                WHEN "1110001" =>  memoryC2_uid240_exp10TabGen_q <= "0110101011101101101110011100011010000001";
                WHEN "1110010" =>  memoryC2_uid240_exp10TabGen_q <= "0110111111001000011011100101000001101011";
                WHEN "1110011" =>  memoryC2_uid240_exp10TabGen_q <= "0111010010101100111000011111111100000111";
                WHEN "1110100" =>  memoryC2_uid240_exp10TabGen_q <= "0111100110011011001010000110010011111010";
                WHEN "1110101" =>  memoryC2_uid240_exp10TabGen_q <= "0111111010010011010101010011101001001100";
                WHEN "1110110" =>  memoryC2_uid240_exp10TabGen_q <= "1000001110010101011111000110000010100010";
                WHEN "1110111" =>  memoryC2_uid240_exp10TabGen_q <= "1000100010100001101100011110000000111101";
                WHEN "1111000" =>  memoryC2_uid240_exp10TabGen_q <= "1000110110111000000010011110100110011111";
                WHEN "1111001" =>  memoryC2_uid240_exp10TabGen_q <= "1001001011011000100110001101011100110010";
                WHEN "1111010" =>  memoryC2_uid240_exp10TabGen_q <= "1001100000000011011100110010101000101011";
                WHEN "1111011" =>  memoryC2_uid240_exp10TabGen_q <= "1001110100111000101011011000111010010001";
                WHEN "1111100" =>  memoryC2_uid240_exp10TabGen_q <= "1010001001111000010111001101100011110110";
                WHEN "1111101" =>  memoryC2_uid240_exp10TabGen_q <= "1010011111000010100101100000100001111000";
                WHEN "1111110" =>  memoryC2_uid240_exp10TabGen_q <= "1010110100010111011011100100010110000001";
                WHEN "1111111" =>  memoryC2_uid240_exp10TabGen_q <= "1011001001110110111110101110010001100110";
                WHEN OTHERS =>
                    memoryC2_uid240_exp10TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--os_uid242_exp10TabGen(BITJOIN,241)@26
    os_uid242_exp10TabGen_q <= ld_memoryC2_uid241_exp10TabGen_q_to_os_uid242_exp10TabGen_b_replace_mem_q & memoryC2_uid240_exp10TabGen_q;

	--rndBit_uid263_exp10PolyEval(CONSTANT,262)
    rndBit_uid263_exp10PolyEval_q <= "01";

	--cIncludingRoundingBit_uid264_exp10PolyEval(BITJOIN,263)@26
    cIncludingRoundingBit_uid264_exp10PolyEval_q <= os_uid242_exp10TabGen_q & rndBit_uid263_exp10PolyEval_q;

	--reg_cIncludingRoundingBit_uid264_exp10PolyEval_0_to_ts3_uid265_exp10PolyEval_0(REG,395)@26
    reg_cIncludingRoundingBit_uid264_exp10PolyEval_0_to_ts3_uid265_exp10PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid264_exp10PolyEval_0_to_ts3_uid265_exp10PolyEval_0_q <= "000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cIncludingRoundingBit_uid264_exp10PolyEval_0_to_ts3_uid265_exp10PolyEval_0_q <= cIncludingRoundingBit_uid264_exp10PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ts3_uid265_exp10PolyEval(ADD,264)@27
    ts3_uid265_exp10PolyEval_a <= STD_LOGIC_VECTOR((45 downto 45 => reg_cIncludingRoundingBit_uid264_exp10PolyEval_0_to_ts3_uid265_exp10PolyEval_0_q(44)) & reg_cIncludingRoundingBit_uid264_exp10PolyEval_0_to_ts3_uid265_exp10PolyEval_0_q);
    ts3_uid265_exp10PolyEval_b <= STD_LOGIC_VECTOR((45 downto 37 => reg_R_uid302_pT3_uid262_exp10PolyEval_0_to_ts3_uid265_exp10PolyEval_1_q(36)) & reg_R_uid302_pT3_uid262_exp10PolyEval_0_to_ts3_uid265_exp10PolyEval_1_q);
            ts3_uid265_exp10PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts3_uid265_exp10PolyEval_a) + SIGNED(ts3_uid265_exp10PolyEval_b));
    ts3_uid265_exp10PolyEval_q <= ts3_uid265_exp10PolyEval_o(45 downto 0);


	--s3_uid266_exp10PolyEval(BITSELECT,265)@27
    s3_uid266_exp10PolyEval_in <= ts3_uid265_exp10PolyEval_q;
    s3_uid266_exp10PolyEval_b <= s3_uid266_exp10PolyEval_in(45 downto 1);

	--yTop27Bits_uid304_pT4_uid268_exp10PolyEval(BITSELECT,303)@27
    yTop27Bits_uid304_pT4_uid268_exp10PolyEval_in <= s3_uid266_exp10PolyEval_b;
    yTop27Bits_uid304_pT4_uid268_exp10PolyEval_b <= yTop27Bits_uid304_pT4_uid268_exp10PolyEval_in(44 downto 18);

	--reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_9(REG,400)@27
    reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_9_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_9_q <= yTop27Bits_uid304_pT4_uid268_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_nor(LOGICAL,1081)
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_nor_b <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_sticky_ena_q;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_nor_q <= not (ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_nor_a or ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_nor_b);

	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_mem_top(CONSTANT,1077)
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_mem_top_q <= "01010";

	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmp(LOGICAL,1078)
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmp_a <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_mem_top_q;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdmux_q);
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmp_q <= "1" when ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmp_a = ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmp_b else "0";

	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmpReg(REG,1079)
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmpReg_q <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_sticky_ena(REG,1082)
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_nor_q = "1") THEN
                ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_sticky_ena_q <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_enaAnd(LOGICAL,1083)
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_enaAnd_a <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_sticky_ena_q;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_enaAnd_b <= en;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_enaAnd_q <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_enaAnd_a and ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_enaAnd_b;

	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt(COUNTER,1073)
    -- every=1, low=0, high=10, step=1, init=1
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_i = 9 THEN
                      ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_i <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_i - 10;
                    ELSE
                        ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_i <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_i,4));


	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdreg(REG,1074)
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdreg_q <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdmux(MUX,1075)
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdmux_s <= en;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdmux: PROCESS (ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdmux_s, ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdreg_q, ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdmux_q <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdmux_q <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem(DUALMEM,1072)
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_ia <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT3_uid261_exp10PolyEval_a_inputreg_q;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_aa <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdreg_q;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_ab <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_rdmux_q;
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_iq,
        address_a => ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_aa,
        data_a => ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_ia
    );
    ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_reset0 <= areset;
        ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_q <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_iq(47 downto 0);

	--yT4_uid267_exp10PolyEval(BITSELECT,266)@27
    yT4_uid267_exp10PolyEval_in <= ld_yPPolyEval_uid65_fpExpETest_b_to_yT4_uid267_exp10PolyEval_a_replace_mem_q;
    yT4_uid267_exp10PolyEval_b <= yT4_uid267_exp10PolyEval_in(47 downto 5);

	--xBottomBits_uid307_pT4_uid268_exp10PolyEval(BITSELECT,306)@27
    xBottomBits_uid307_pT4_uid268_exp10PolyEval_in <= yT4_uid267_exp10PolyEval_b(15 downto 0);
    xBottomBits_uid307_pT4_uid268_exp10PolyEval_b <= xBottomBits_uid307_pT4_uid268_exp10PolyEval_in(15 downto 0);

	--pad_xBottomBits_uid307_uid309_pT4_uid268_exp10PolyEval(BITJOIN,308)@27
    pad_xBottomBits_uid307_uid309_pT4_uid268_exp10PolyEval_q <= xBottomBits_uid307_pT4_uid268_exp10PolyEval_b & STD_LOGIC_VECTOR((9 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_xBottomBits_uid307_uid309_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_7(REG,399)@27
    reg_pad_xBottomBits_uid307_uid309_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_xBottomBits_uid307_uid309_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_7_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_xBottomBits_uid307_uid309_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_7_q <= pad_xBottomBits_uid307_uid309_pT4_uid268_exp10PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--yBottomBits_uid306_pT4_uid268_exp10PolyEval(BITSELECT,305)@27
    yBottomBits_uid306_pT4_uid268_exp10PolyEval_in <= s3_uid266_exp10PolyEval_b(17 downto 0);
    yBottomBits_uid306_pT4_uid268_exp10PolyEval_b <= yBottomBits_uid306_pT4_uid268_exp10PolyEval_in(17 downto 0);

	--ld_yBottomBits_uid306_pT4_uid268_exp10PolyEval_b_to_spad_yBottomBits_uid306_uid308_pT4_uid268_exp10PolyEval_a(DELAY,748)@27
    ld_yBottomBits_uid306_pT4_uid268_exp10PolyEval_b_to_spad_yBottomBits_uid306_uid308_pT4_uid268_exp10PolyEval_a : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => yBottomBits_uid306_pT4_uid268_exp10PolyEval_b, xout => ld_yBottomBits_uid306_pT4_uid268_exp10PolyEval_b_to_spad_yBottomBits_uid306_uid308_pT4_uid268_exp10PolyEval_a_q, ena => en(0), clk => clk, aclr => areset );

	--spad_yBottomBits_uid306_uid308_pT4_uid268_exp10PolyEval(BITJOIN,307)@28
    spad_yBottomBits_uid306_uid308_pT4_uid268_exp10PolyEval_q <= GND_q & ld_yBottomBits_uid306_pT4_uid268_exp10PolyEval_b_to_spad_yBottomBits_uid306_uid308_pT4_uid268_exp10PolyEval_a_q;

	--pad_yBottomBits_uid306_uid310_pT4_uid268_exp10PolyEval(BITJOIN,309)@28
    pad_yBottomBits_uid306_uid310_pT4_uid268_exp10PolyEval_q <= spad_yBottomBits_uid306_uid308_pT4_uid268_exp10PolyEval_q & STD_LOGIC_VECTOR((7 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_yBottomBits_uid306_uid310_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_6(REG,398)@28
    reg_pad_yBottomBits_uid306_uid310_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_yBottomBits_uid306_uid310_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_6_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_yBottomBits_uid306_uid310_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_6_q <= pad_yBottomBits_uid306_uid310_pT4_uid268_exp10PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yT4_uid267_exp10PolyEval_b_to_xTop27Bits_uid303_pT4_uid268_exp10PolyEval_a(DELAY,742)@27
    ld_yT4_uid267_exp10PolyEval_b_to_xTop27Bits_uid303_pT4_uid268_exp10PolyEval_a : dspba_delay
    GENERIC MAP ( width => 43, depth => 1 )
    PORT MAP ( xin => yT4_uid267_exp10PolyEval_b, xout => ld_yT4_uid267_exp10PolyEval_b_to_xTop27Bits_uid303_pT4_uid268_exp10PolyEval_a_q, ena => en(0), clk => clk, aclr => areset );

	--xTop27Bits_uid303_pT4_uid268_exp10PolyEval(BITSELECT,302)@28
    xTop27Bits_uid303_pT4_uid268_exp10PolyEval_in <= ld_yT4_uid267_exp10PolyEval_b_to_xTop27Bits_uid303_pT4_uid268_exp10PolyEval_a_q;
    xTop27Bits_uid303_pT4_uid268_exp10PolyEval_b <= xTop27Bits_uid303_pT4_uid268_exp10PolyEval_in(42 downto 16);

	--reg_xTop27Bits_uid303_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_4(REG,397)@28
    reg_xTop27Bits_uid303_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid303_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_4_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop27Bits_uid303_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_4_q <= xTop27Bits_uid303_pT4_uid268_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma(CHAINMULTADD,339)@29
    multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_a(0),28));
    multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_a(1),28));
    multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_p(0) <= multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_l(0) * multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_c(0);
    multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_p(1) <= multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_l(1) * multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_c(1);
    multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_w(0) <= RESIZE(multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_p(0),56);
    multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_w(1) <= RESIZE(multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_p(1),56);
    multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_x(0) <= multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_w(0);
    multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_x(1) <= multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_w(1);
    multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_y(0) <= multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_s(1) + multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_x(0);
    multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_y(1) <= multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_x(1);
    multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_a <= (others => (others => '0'));
            multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_c <= (others => (others => '0'));
            multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_a(0) <= RESIZE(UNSIGNED(reg_xTop27Bits_uid303_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_4_q),27);
            multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_a(1) <= RESIZE(UNSIGNED(reg_pad_xBottomBits_uid307_uid309_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_7_q),27);
            multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_c(0) <= RESIZE(SIGNED(reg_pad_yBottomBits_uid306_uid310_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_6_q),27);
            multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_c(1) <= RESIZE(SIGNED(reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_9_q),27);
            IF (en = "1") THEN
                multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_s(0) <= multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_y(0);
                multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_s(1) <= multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_y(1);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_delay : dspba_delay
    GENERIC MAP (width => 55, depth => 1)
    PORT MAP (xin => STD_LOGIC_VECTOR(multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_s(0)(54 downto 0)), xout => multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_q, clk => clk, aclr => areset);

	--multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval(BITSELECT,311)@32
    multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_in <= multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_q;
    multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_b <= multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_in(54 downto 8);

	--highBBits_uid314_pT4_uid268_exp10PolyEval(BITSELECT,313)@32
    highBBits_uid314_pT4_uid268_exp10PolyEval_in <= multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_b;
    highBBits_uid314_pT4_uid268_exp10PolyEval_b <= highBBits_uid314_pT4_uid268_exp10PolyEval_in(46 downto 18);

	--ld_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_b_to_reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_topProd_uid305_pT4_uid268_exp10PolyEval_1_a(DELAY,856)@27
    ld_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_b_to_reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_topProd_uid305_pT4_uid268_exp10PolyEval_1_a : dspba_delay
    GENERIC MAP ( width => 27, depth => 1 )
    PORT MAP ( xin => yTop27Bits_uid304_pT4_uid268_exp10PolyEval_b, xout => ld_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_b_to_reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_topProd_uid305_pT4_uid268_exp10PolyEval_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_topProd_uid305_pT4_uid268_exp10PolyEval_1(REG,402)@28
    reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_topProd_uid305_pT4_uid268_exp10PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_topProd_uid305_pT4_uid268_exp10PolyEval_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_topProd_uid305_pT4_uid268_exp10PolyEval_1_q <= ld_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_b_to_reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_topProd_uid305_pT4_uid268_exp10PolyEval_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--topProd_uid305_pT4_uid268_exp10PolyEval(MULT,304)@29
    topProd_uid305_pT4_uid268_exp10PolyEval_pr <= signed(resize(UNSIGNED(topProd_uid305_pT4_uid268_exp10PolyEval_a),28)) * SIGNED(topProd_uid305_pT4_uid268_exp10PolyEval_b);
    topProd_uid305_pT4_uid268_exp10PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid305_pT4_uid268_exp10PolyEval_a <= (others => '0');
            topProd_uid305_pT4_uid268_exp10PolyEval_b <= (others => '0');
            topProd_uid305_pT4_uid268_exp10PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid305_pT4_uid268_exp10PolyEval_a <= reg_xTop27Bits_uid303_pT4_uid268_exp10PolyEval_0_to_multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_cma_4_q;
                topProd_uid305_pT4_uid268_exp10PolyEval_b <= reg_yTop27Bits_uid304_pT4_uid268_exp10PolyEval_0_to_topProd_uid305_pT4_uid268_exp10PolyEval_1_q;
                topProd_uid305_pT4_uid268_exp10PolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid305_pT4_uid268_exp10PolyEval_pr,54));
            END IF;
        END IF;
    END PROCESS;
    topProd_uid305_pT4_uid268_exp10PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid305_pT4_uid268_exp10PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid305_pT4_uid268_exp10PolyEval_q <= topProd_uid305_pT4_uid268_exp10PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--sumAHighB_uid315_pT4_uid268_exp10PolyEval(ADD,314)@32
    sumAHighB_uid315_pT4_uid268_exp10PolyEval_a <= STD_LOGIC_VECTOR((54 downto 54 => topProd_uid305_pT4_uid268_exp10PolyEval_q(53)) & topProd_uid305_pT4_uid268_exp10PolyEval_q);
    sumAHighB_uid315_pT4_uid268_exp10PolyEval_b <= STD_LOGIC_VECTOR((54 downto 29 => highBBits_uid314_pT4_uid268_exp10PolyEval_b(28)) & highBBits_uid314_pT4_uid268_exp10PolyEval_b);
            sumAHighB_uid315_pT4_uid268_exp10PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid315_pT4_uid268_exp10PolyEval_a) + SIGNED(sumAHighB_uid315_pT4_uid268_exp10PolyEval_b));
    sumAHighB_uid315_pT4_uid268_exp10PolyEval_q <= sumAHighB_uid315_pT4_uid268_exp10PolyEval_o(54 downto 0);


	--lowRangeB_uid313_pT4_uid268_exp10PolyEval(BITSELECT,312)@32
    lowRangeB_uid313_pT4_uid268_exp10PolyEval_in <= multSumOfTwo27_uid308_pT4_uid268_exp10PolyEval_b(17 downto 0);
    lowRangeB_uid313_pT4_uid268_exp10PolyEval_b <= lowRangeB_uid313_pT4_uid268_exp10PolyEval_in(17 downto 0);

	--add0_uid313_uid316_pT4_uid268_exp10PolyEval(BITJOIN,315)@32
    add0_uid313_uid316_pT4_uid268_exp10PolyEval_q <= sumAHighB_uid315_pT4_uid268_exp10PolyEval_q & lowRangeB_uid313_pT4_uid268_exp10PolyEval_b;

	--R_uid317_pT4_uid268_exp10PolyEval(BITSELECT,316)@32
    R_uid317_pT4_uid268_exp10PolyEval_in <= add0_uid313_uid316_pT4_uid268_exp10PolyEval_q(71 downto 0);
    R_uid317_pT4_uid268_exp10PolyEval_b <= R_uid317_pT4_uid268_exp10PolyEval_in(71 downto 26);

	--reg_R_uid317_pT4_uid268_exp10PolyEval_0_to_ts4_uid271_exp10PolyEval_1(REG,404)@32
    reg_R_uid317_pT4_uid268_exp10PolyEval_0_to_ts4_uid271_exp10PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid317_pT4_uid268_exp10PolyEval_0_to_ts4_uid271_exp10PolyEval_1_q <= "0000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_R_uid317_pT4_uid268_exp10PolyEval_0_to_ts4_uid271_exp10PolyEval_1_q <= R_uid317_pT4_uid268_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_nor(LOGICAL,1146)
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_nor_b <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_sticky_ena_q;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_nor_q <= not (ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_nor_a or ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_nor_b);

	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_mem_top(CONSTANT,1142)
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_mem_top_q <= "01110";

	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmp(LOGICAL,1143)
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmp_a <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_mem_top_q;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdmux_q);
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmp_q <= "1" when ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmp_a = ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmp_b else "0";

	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmpReg(REG,1144)
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmpReg_q <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_sticky_ena(REG,1147)
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_nor_q = "1") THEN
                ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_sticky_ena_q <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_enaAnd(LOGICAL,1148)
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_enaAnd_a <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_sticky_ena_q;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_enaAnd_b <= en;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_enaAnd_q <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_enaAnd_a and ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_enaAnd_b;

	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_inputreg(DELAY,1123)
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => addr_uid64_fpExpETest_b, xout => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt(COUNTER,1138)
    -- every=1, low=0, high=14, step=1, init=1
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_i = 13 THEN
                      ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_eq = '1') THEN
                        ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_i <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_i - 14;
                    ELSE
                        ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_i <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_i,4));


	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdreg(REG,1139)
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdreg_q <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdmux(MUX,1140)
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdmux_s <= en;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdmux: PROCESS (ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdmux_s, ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdreg_q, ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdmux_q <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdreg_q;
                  WHEN "1" => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdmux_q <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem(DUALMEM,1137)
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_ia <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_inputreg_q;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_aa <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdreg_q;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_ab <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_rdmux_q;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 4,
        numwords_a => 15,
        width_b => 7,
        widthad_b => 4,
        numwords_b => 15,
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
        clocken1 => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_iq,
        address_a => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_aa,
        data_a => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_ia
    );
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_reset0 <= areset;
        ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_q <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_iq(6 downto 0);

	--reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0(REG,379)@30
    reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_q <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid238_exp10TabGen(LOOKUP,237)@31
    memoryC1_uid238_exp10TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC1_uid238_exp10TabGen_q <= "00100000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_q) IS
                WHEN "0000000" =>  memoryC1_uid238_exp10TabGen_q <= "00100000000";
                WHEN "0000001" =>  memoryC1_uid238_exp10TabGen_q <= "00100000010";
                WHEN "0000010" =>  memoryC1_uid238_exp10TabGen_q <= "00100000100";
                WHEN "0000011" =>  memoryC1_uid238_exp10TabGen_q <= "00100000110";
                WHEN "0000100" =>  memoryC1_uid238_exp10TabGen_q <= "00100001000";
                WHEN "0000101" =>  memoryC1_uid238_exp10TabGen_q <= "00100001010";
                WHEN "0000110" =>  memoryC1_uid238_exp10TabGen_q <= "00100001100";
                WHEN "0000111" =>  memoryC1_uid238_exp10TabGen_q <= "00100001110";
                WHEN "0001000" =>  memoryC1_uid238_exp10TabGen_q <= "00100010000";
                WHEN "0001001" =>  memoryC1_uid238_exp10TabGen_q <= "00100010010";
                WHEN "0001010" =>  memoryC1_uid238_exp10TabGen_q <= "00100010100";
                WHEN "0001011" =>  memoryC1_uid238_exp10TabGen_q <= "00100010110";
                WHEN "0001100" =>  memoryC1_uid238_exp10TabGen_q <= "00100011001";
                WHEN "0001101" =>  memoryC1_uid238_exp10TabGen_q <= "00100011011";
                WHEN "0001110" =>  memoryC1_uid238_exp10TabGen_q <= "00100011101";
                WHEN "0001111" =>  memoryC1_uid238_exp10TabGen_q <= "00100011111";
                WHEN "0010000" =>  memoryC1_uid238_exp10TabGen_q <= "00100100010";
                WHEN "0010001" =>  memoryC1_uid238_exp10TabGen_q <= "00100100100";
                WHEN "0010010" =>  memoryC1_uid238_exp10TabGen_q <= "00100100110";
                WHEN "0010011" =>  memoryC1_uid238_exp10TabGen_q <= "00100101000";
                WHEN "0010100" =>  memoryC1_uid238_exp10TabGen_q <= "00100101011";
                WHEN "0010101" =>  memoryC1_uid238_exp10TabGen_q <= "00100101101";
                WHEN "0010110" =>  memoryC1_uid238_exp10TabGen_q <= "00100110000";
                WHEN "0010111" =>  memoryC1_uid238_exp10TabGen_q <= "00100110010";
                WHEN "0011000" =>  memoryC1_uid238_exp10TabGen_q <= "00100110100";
                WHEN "0011001" =>  memoryC1_uid238_exp10TabGen_q <= "00100110111";
                WHEN "0011010" =>  memoryC1_uid238_exp10TabGen_q <= "00100111001";
                WHEN "0011011" =>  memoryC1_uid238_exp10TabGen_q <= "00100111100";
                WHEN "0011100" =>  memoryC1_uid238_exp10TabGen_q <= "00100111110";
                WHEN "0011101" =>  memoryC1_uid238_exp10TabGen_q <= "00101000001";
                WHEN "0011110" =>  memoryC1_uid238_exp10TabGen_q <= "00101000011";
                WHEN "0011111" =>  memoryC1_uid238_exp10TabGen_q <= "00101000110";
                WHEN "0100000" =>  memoryC1_uid238_exp10TabGen_q <= "00101001000";
                WHEN "0100001" =>  memoryC1_uid238_exp10TabGen_q <= "00101001011";
                WHEN "0100010" =>  memoryC1_uid238_exp10TabGen_q <= "00101001101";
                WHEN "0100011" =>  memoryC1_uid238_exp10TabGen_q <= "00101010000";
                WHEN "0100100" =>  memoryC1_uid238_exp10TabGen_q <= "00101010011";
                WHEN "0100101" =>  memoryC1_uid238_exp10TabGen_q <= "00101010101";
                WHEN "0100110" =>  memoryC1_uid238_exp10TabGen_q <= "00101011000";
                WHEN "0100111" =>  memoryC1_uid238_exp10TabGen_q <= "00101011011";
                WHEN "0101000" =>  memoryC1_uid238_exp10TabGen_q <= "00101011101";
                WHEN "0101001" =>  memoryC1_uid238_exp10TabGen_q <= "00101100000";
                WHEN "0101010" =>  memoryC1_uid238_exp10TabGen_q <= "00101100011";
                WHEN "0101011" =>  memoryC1_uid238_exp10TabGen_q <= "00101100110";
                WHEN "0101100" =>  memoryC1_uid238_exp10TabGen_q <= "00101101001";
                WHEN "0101101" =>  memoryC1_uid238_exp10TabGen_q <= "00101101011";
                WHEN "0101110" =>  memoryC1_uid238_exp10TabGen_q <= "00101101110";
                WHEN "0101111" =>  memoryC1_uid238_exp10TabGen_q <= "00101110001";
                WHEN "0110000" =>  memoryC1_uid238_exp10TabGen_q <= "00101110100";
                WHEN "0110001" =>  memoryC1_uid238_exp10TabGen_q <= "00101110111";
                WHEN "0110010" =>  memoryC1_uid238_exp10TabGen_q <= "00101111010";
                WHEN "0110011" =>  memoryC1_uid238_exp10TabGen_q <= "00101111101";
                WHEN "0110100" =>  memoryC1_uid238_exp10TabGen_q <= "00110000000";
                WHEN "0110101" =>  memoryC1_uid238_exp10TabGen_q <= "00110000011";
                WHEN "0110110" =>  memoryC1_uid238_exp10TabGen_q <= "00110000110";
                WHEN "0110111" =>  memoryC1_uid238_exp10TabGen_q <= "00110001001";
                WHEN "0111000" =>  memoryC1_uid238_exp10TabGen_q <= "00110001100";
                WHEN "0111001" =>  memoryC1_uid238_exp10TabGen_q <= "00110001111";
                WHEN "0111010" =>  memoryC1_uid238_exp10TabGen_q <= "00110010010";
                WHEN "0111011" =>  memoryC1_uid238_exp10TabGen_q <= "00110010101";
                WHEN "0111100" =>  memoryC1_uid238_exp10TabGen_q <= "00110011001";
                WHEN "0111101" =>  memoryC1_uid238_exp10TabGen_q <= "00110011100";
                WHEN "0111110" =>  memoryC1_uid238_exp10TabGen_q <= "00110011111";
                WHEN "0111111" =>  memoryC1_uid238_exp10TabGen_q <= "00110100010";
                WHEN "1000000" =>  memoryC1_uid238_exp10TabGen_q <= "00110100110";
                WHEN "1000001" =>  memoryC1_uid238_exp10TabGen_q <= "00110101001";
                WHEN "1000010" =>  memoryC1_uid238_exp10TabGen_q <= "00110101100";
                WHEN "1000011" =>  memoryC1_uid238_exp10TabGen_q <= "00110110000";
                WHEN "1000100" =>  memoryC1_uid238_exp10TabGen_q <= "00110110011";
                WHEN "1000101" =>  memoryC1_uid238_exp10TabGen_q <= "00110110110";
                WHEN "1000110" =>  memoryC1_uid238_exp10TabGen_q <= "00110111010";
                WHEN "1000111" =>  memoryC1_uid238_exp10TabGen_q <= "00110111101";
                WHEN "1001000" =>  memoryC1_uid238_exp10TabGen_q <= "00111000001";
                WHEN "1001001" =>  memoryC1_uid238_exp10TabGen_q <= "00111000100";
                WHEN "1001010" =>  memoryC1_uid238_exp10TabGen_q <= "00111001000";
                WHEN "1001011" =>  memoryC1_uid238_exp10TabGen_q <= "00111001011";
                WHEN "1001100" =>  memoryC1_uid238_exp10TabGen_q <= "00111001111";
                WHEN "1001101" =>  memoryC1_uid238_exp10TabGen_q <= "00111010011";
                WHEN "1001110" =>  memoryC1_uid238_exp10TabGen_q <= "00111010110";
                WHEN "1001111" =>  memoryC1_uid238_exp10TabGen_q <= "00111011010";
                WHEN "1010000" =>  memoryC1_uid238_exp10TabGen_q <= "00111011110";
                WHEN "1010001" =>  memoryC1_uid238_exp10TabGen_q <= "00111100010";
                WHEN "1010010" =>  memoryC1_uid238_exp10TabGen_q <= "00111100101";
                WHEN "1010011" =>  memoryC1_uid238_exp10TabGen_q <= "00111101001";
                WHEN "1010100" =>  memoryC1_uid238_exp10TabGen_q <= "00111101101";
                WHEN "1010101" =>  memoryC1_uid238_exp10TabGen_q <= "00111110001";
                WHEN "1010110" =>  memoryC1_uid238_exp10TabGen_q <= "00111110101";
                WHEN "1010111" =>  memoryC1_uid238_exp10TabGen_q <= "00111111001";
                WHEN "1011000" =>  memoryC1_uid238_exp10TabGen_q <= "00111111101";
                WHEN "1011001" =>  memoryC1_uid238_exp10TabGen_q <= "01000000001";
                WHEN "1011010" =>  memoryC1_uid238_exp10TabGen_q <= "01000000101";
                WHEN "1011011" =>  memoryC1_uid238_exp10TabGen_q <= "01000001001";
                WHEN "1011100" =>  memoryC1_uid238_exp10TabGen_q <= "01000001101";
                WHEN "1011101" =>  memoryC1_uid238_exp10TabGen_q <= "01000010001";
                WHEN "1011110" =>  memoryC1_uid238_exp10TabGen_q <= "01000010101";
                WHEN "1011111" =>  memoryC1_uid238_exp10TabGen_q <= "01000011001";
                WHEN "1100000" =>  memoryC1_uid238_exp10TabGen_q <= "01000011101";
                WHEN "1100001" =>  memoryC1_uid238_exp10TabGen_q <= "01000100010";
                WHEN "1100010" =>  memoryC1_uid238_exp10TabGen_q <= "01000100110";
                WHEN "1100011" =>  memoryC1_uid238_exp10TabGen_q <= "01000101010";
                WHEN "1100100" =>  memoryC1_uid238_exp10TabGen_q <= "01000101111";
                WHEN "1100101" =>  memoryC1_uid238_exp10TabGen_q <= "01000110011";
                WHEN "1100110" =>  memoryC1_uid238_exp10TabGen_q <= "01000110111";
                WHEN "1100111" =>  memoryC1_uid238_exp10TabGen_q <= "01000111100";
                WHEN "1101000" =>  memoryC1_uid238_exp10TabGen_q <= "01001000000";
                WHEN "1101001" =>  memoryC1_uid238_exp10TabGen_q <= "01001000101";
                WHEN "1101010" =>  memoryC1_uid238_exp10TabGen_q <= "01001001001";
                WHEN "1101011" =>  memoryC1_uid238_exp10TabGen_q <= "01001001110";
                WHEN "1101100" =>  memoryC1_uid238_exp10TabGen_q <= "01001010011";
                WHEN "1101101" =>  memoryC1_uid238_exp10TabGen_q <= "01001010111";
                WHEN "1101110" =>  memoryC1_uid238_exp10TabGen_q <= "01001011100";
                WHEN "1101111" =>  memoryC1_uid238_exp10TabGen_q <= "01001100001";
                WHEN "1110000" =>  memoryC1_uid238_exp10TabGen_q <= "01001100110";
                WHEN "1110001" =>  memoryC1_uid238_exp10TabGen_q <= "01001101010";
                WHEN "1110010" =>  memoryC1_uid238_exp10TabGen_q <= "01001101111";
                WHEN "1110011" =>  memoryC1_uid238_exp10TabGen_q <= "01001110100";
                WHEN "1110100" =>  memoryC1_uid238_exp10TabGen_q <= "01001111001";
                WHEN "1110101" =>  memoryC1_uid238_exp10TabGen_q <= "01001111110";
                WHEN "1110110" =>  memoryC1_uid238_exp10TabGen_q <= "01010000011";
                WHEN "1110111" =>  memoryC1_uid238_exp10TabGen_q <= "01010001000";
                WHEN "1111000" =>  memoryC1_uid238_exp10TabGen_q <= "01010001101";
                WHEN "1111001" =>  memoryC1_uid238_exp10TabGen_q <= "01010010010";
                WHEN "1111010" =>  memoryC1_uid238_exp10TabGen_q <= "01010011000";
                WHEN "1111011" =>  memoryC1_uid238_exp10TabGen_q <= "01010011101";
                WHEN "1111100" =>  memoryC1_uid238_exp10TabGen_q <= "01010100010";
                WHEN "1111101" =>  memoryC1_uid238_exp10TabGen_q <= "01010100111";
                WHEN "1111110" =>  memoryC1_uid238_exp10TabGen_q <= "01010101101";
                WHEN "1111111" =>  memoryC1_uid238_exp10TabGen_q <= "01010110010";
                WHEN OTHERS =>
                    memoryC1_uid238_exp10TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid237_exp10TabGen(LOOKUP,236)@31
    memoryC1_uid237_exp10TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC1_uid237_exp10TabGen_q <= "0000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_addr_uid64_fpExpETest_0_to_memoryC1_uid237_exp10TabGen_0_q) IS
                WHEN "0000000" =>  memoryC1_uid237_exp10TabGen_q <= "0000000000000000000000000000000000000000";
                WHEN "0000001" =>  memoryC1_uid237_exp10TabGen_q <= "0000001000000001010101100000000000111010";
                WHEN "0000010" =>  memoryC1_uid237_exp10TabGen_q <= "0000100000001010101101010101110111011110";
                WHEN "0000011" =>  memoryC1_uid237_exp10TabGen_q <= "0001001000100100001101100100000100000110";
                WHEN "0000100" =>  memoryC1_uid237_exp10TabGen_q <= "0010000001010110000000010001001001111011";
                WHEN "0000101" =>  memoryC1_uid237_exp10TabGen_q <= "0011001010101000010011101001110000100000";
                WHEN "0000110" =>  memoryC1_uid237_exp10TabGen_q <= "0100100100100011011010000010100111101010";
                WHEN "0000111" =>  memoryC1_uid237_exp10TabGen_q <= "0110001111001111101001111010101100000101";
                WHEN "0001000" =>  memoryC1_uid237_exp10TabGen_q <= "1000001010110101011101111101001101001110";
                WHEN "0001001" =>  memoryC1_uid237_exp10TabGen_q <= "1010010111011101010101000011110011001011";
                WHEN "0001010" =>  memoryC1_uid237_exp10TabGen_q <= "1100110101001111110010011000100111010001";
                WHEN "0001011" =>  memoryC1_uid237_exp10TabGen_q <= "1111100100010101011101011000011100010001";
                WHEN "0001100" =>  memoryC1_uid237_exp10TabGen_q <= "0010100100110111000001110100111000010010";
                WHEN "0001101" =>  memoryC1_uid237_exp10TabGen_q <= "0101110110111101001111110110100000001001";
                WHEN "0001110" =>  memoryC1_uid237_exp10TabGen_q <= "1001011010110000111011111111000011100110";
                WHEN "0001111" =>  memoryC1_uid237_exp10TabGen_q <= "1101010000011010111111001011101001010000";
                WHEN "0010000" =>  memoryC1_uid237_exp10TabGen_q <= "0001011000000100010110110110111101011001";
                WHEN "0010001" =>  memoryC1_uid237_exp10TabGen_q <= "0101110001110110000100111011100010100010";
                WHEN "0010010" =>  memoryC1_uid237_exp10TabGen_q <= "1010011101111001001111110110000000011101";
                WHEN "0010011" =>  memoryC1_uid237_exp10TabGen_q <= "1111011100010111000010100111010101011010";
                WHEN "0010100" =>  memoryC1_uid237_exp10TabGen_q <= "0100101101011000101100110111001011010010";
                WHEN "0010101" =>  memoryC1_uid237_exp10TabGen_q <= "1010010001000111100010110110001000001100";
                WHEN "0010110" =>  memoryC1_uid237_exp10TabGen_q <= "0000000111101100111101100000000110110001";
                WHEN "0010111" =>  memoryC1_uid237_exp10TabGen_q <= "0110010001010010011010011110101001111111";
                WHEN "0011000" =>  memoryC1_uid237_exp10TabGen_q <= "1100101110000001011100001011010110001100";
                WHEN "0011001" =>  memoryC1_uid237_exp10TabGen_q <= "0011011110000011101001110010001000001011";
                WHEN "0011010" =>  memoryC1_uid237_exp10TabGen_q <= "1010100001100010101111010011110000010000";
                WHEN "0011011" =>  memoryC1_uid237_exp10TabGen_q <= "0001111000101000011101101000001101001011";
                WHEN "0011100" =>  memoryC1_uid237_exp10TabGen_q <= "1001100011011110101010100001000111100100";
                WHEN "0011101" =>  memoryC1_uid237_exp10TabGen_q <= "0001100010001111010000101100001111101101";
                WHEN "0011110" =>  memoryC1_uid237_exp10TabGen_q <= "1001110101000100001111110101111100011111";
                WHEN "0011111" =>  memoryC1_uid237_exp10TabGen_q <= "0010011100000111101100101011101010111111";
                WHEN "0100000" =>  memoryC1_uid237_exp10TabGen_q <= "1011010111100011110000111110100000011101";
                WHEN "0100001" =>  memoryC1_uid237_exp10TabGen_q <= "0100100111100010101011100101101011001010";
                WHEN "0100010" =>  memoryC1_uid237_exp10TabGen_q <= "1110001100001110110000100001000111011110";
                WHEN "0100011" =>  memoryC1_uid237_exp10TabGen_q <= "1000000101110010011000111100000100110111";
                WHEN "0100100" =>  memoryC1_uid237_exp10TabGen_q <= "0010010100011000000011001111101011010111";
                WHEN "0100101" =>  memoryC1_uid237_exp10TabGen_q <= "1100111000001010010011000101100010111111";
                WHEN "0100110" =>  memoryC1_uid237_exp10TabGen_q <= "0111110001010011110001011010011110110011";
                WHEN "0100111" =>  memoryC1_uid237_exp10TabGen_q <= "0010111111111111001100100001000011111001";
                WHEN "0101000" =>  memoryC1_uid237_exp10TabGen_q <= "1110100100010111011000000100010111111100";
                WHEN "0101001" =>  memoryC1_uid237_exp10TabGen_q <= "1010011110100111001101001010101100001001";
                WHEN "0101010" =>  memoryC1_uid237_exp10TabGen_q <= "0110101110111001101010011000001100101111";
                WHEN "0101011" =>  memoryC1_uid237_exp10TabGen_q <= "0011010101011001110011110001101111000101";
                WHEN "0101100" =>  memoryC1_uid237_exp10TabGen_q <= "0000010010010010110010111111100101001101";
                WHEN "0101101" =>  memoryC1_uid237_exp10TabGen_q <= "1101100101101111110111010000001101001010";
                WHEN "0101110" =>  memoryC1_uid237_exp10TabGen_q <= "1011001111111100010101011011000111100000";
                WHEN "0101111" =>  memoryC1_uid237_exp10TabGen_q <= "1001010001000011101000000011101011010001";
                WHEN "0110000" =>  memoryC1_uid237_exp10TabGen_q <= "0111101001010001001111011011111011111001";
                WHEN "0110001" =>  memoryC1_uid237_exp10TabGen_q <= "0110011000110000110001100111100011000100";
                WHEN "0110010" =>  memoryC1_uid237_exp10TabGen_q <= "0101011111101101111010011110101000100111";
                WHEN "0110011" =>  memoryC1_uid237_exp10TabGen_q <= "0100111110010100011011110000101110110000";
                WHEN "0110100" =>  memoryC1_uid237_exp10TabGen_q <= "0100110100110000001101000111101101011011";
                WHEN "0110101" =>  memoryC1_uid237_exp10TabGen_q <= "0101000011001101001100001010110000110011";
                WHEN "0110110" =>  memoryC1_uid237_exp10TabGen_q <= "0101101001110111011100100001011001001110";
                WHEN "0110111" =>  memoryC1_uid237_exp10TabGen_q <= "0110101000111011000111110110011010101000";
                WHEN "0111000" =>  memoryC1_uid237_exp10TabGen_q <= "1000000000100100011101111011000000000000";
                WHEN "0111001" =>  memoryC1_uid237_exp10TabGen_q <= "1001110000111111110100101001101111110010";
                WHEN "0111010" =>  memoryC1_uid237_exp10TabGen_q <= "1011111010011001101000001001101111101100";
                WHEN "0111011" =>  memoryC1_uid237_exp10TabGen_q <= "1110011100111110011010110001101101110011";
                WHEN "0111100" =>  memoryC1_uid237_exp10TabGen_q <= "0001011000111010110101001011000111010110";
                WHEN "0111101" =>  memoryC1_uid237_exp10TabGen_q <= "0100101110011011100110010101010100001010";
                WHEN "0111110" =>  memoryC1_uid237_exp10TabGen_q <= "1000011101101101100011101000110001001110";
                WHEN "0111111" =>  memoryC1_uid237_exp10TabGen_q <= "1100100110111101101000111010001111101111";
                WHEN "1000000" =>  memoryC1_uid237_exp10TabGen_q <= "0001001010011000111000011110000001110001";
                WHEN "1000001" =>  memoryC1_uid237_exp10TabGen_q <= "0110001000001100011011001011001100110100";
                WHEN "1000010" =>  memoryC1_uid237_exp10TabGen_q <= "1011100000100101100000011110111011011101";
                WHEN "1000011" =>  memoryC1_uid237_exp10TabGen_q <= "0001010011110001011110011111110001000001";
                WHEN "1000100" =>  memoryC1_uid237_exp10TabGen_q <= "0111100001111101110010000000111110011000";
                WHEN "1000101" =>  memoryC1_uid237_exp10TabGen_q <= "1110001011010111111110100101111010101100";
                WHEN "1000110" =>  memoryC1_uid237_exp10TabGen_q <= "0101010000001101101110100101011011101100";
                WHEN "1000111" =>  memoryC1_uid237_exp10TabGen_q <= "1100110000101100110011001101001111000101";
                WHEN "1001000" =>  memoryC1_uid237_exp10TabGen_q <= "0100101101000011000100100101011001001000";
                WHEN "1001001" =>  memoryC1_uid237_exp10TabGen_q <= "1101000101011110100001110011110000011001";
                WHEN "1001010" =>  memoryC1_uid237_exp10TabGen_q <= "0101111010001101010000111111011111001100";
                WHEN "1001011" =>  memoryC1_uid237_exp10TabGen_q <= "1111001011011101011111010100100100001011";
                WHEN "1001100" =>  memoryC1_uid237_exp10TabGen_q <= "1000111001011101100001000111010110000110";
                WHEN "1001101" =>  memoryC1_uid237_exp10TabGen_q <= "0011000100011011110001111000001000100101";
                WHEN "1001110" =>  memoryC1_uid237_exp10TabGen_q <= "1101101100100110110100010110110011010110";
                WHEN "1001111" =>  memoryC1_uid237_exp10TabGen_q <= "1000110010001101010010100110011010010111";
                WHEN "1010000" =>  memoryC1_uid237_exp10TabGen_q <= "0100010101011101111110000000111000111010";
                WHEN "1010001" =>  memoryC1_uid237_exp10TabGen_q <= "0000010110100111101111011010101101110110";
                WHEN "1010010" =>  memoryC1_uid237_exp10TabGen_q <= "1100110101111001100111000110101001001101";
                WHEN "1010011" =>  memoryC1_uid237_exp10TabGen_q <= "1001110011100010101100111001011101100011";
                WHEN "1010100" =>  memoryC1_uid237_exp10TabGen_q <= "0111001111110010010000001101110000010000";
                WHEN "1010101" =>  memoryC1_uid237_exp10TabGen_q <= "0101001010110111101000000111101111000000";
                WHEN "1010110" =>  memoryC1_uid237_exp10TabGen_q <= "0011100101000010010011011001000011111010";
                WHEN "1010111" =>  memoryC1_uid237_exp10TabGen_q <= "0010011110100001111000100100101110110000";
                WHEN "1011000" =>  memoryC1_uid237_exp10TabGen_q <= "0001110111100110000110000010111110001011";
                WHEN "1011001" =>  memoryC1_uid237_exp10TabGen_q <= "0001110000011110110010000101001010010000";
                WHEN "1011010" =>  memoryC1_uid237_exp10TabGen_q <= "0010001001011011111010111001110011101101";
                WHEN "1011011" =>  memoryC1_uid237_exp10TabGen_q <= "0011000010101101100110110000100001110010";
                WHEN "1011100" =>  memoryC1_uid237_exp10TabGen_q <= "0100011100100100000011111110000100111100";
                WHEN "1011101" =>  memoryC1_uid237_exp10TabGen_q <= "0110010111001111101001000000011010110011";
                WHEN "1011110" =>  memoryC1_uid237_exp10TabGen_q <= "1000110011000000110100100010110010101001";
                WHEN "1011111" =>  memoryC1_uid237_exp10TabGen_q <= "1011110000001000001101100001110100111001";
                WHEN "1100000" =>  memoryC1_uid237_exp10TabGen_q <= "1111001110110110100011001111101110011101";
                WHEN "1100001" =>  memoryC1_uid237_exp10TabGen_q <= "0011001111011100101101011000011011011101";
                WHEN "1100010" =>  memoryC1_uid237_exp10TabGen_q <= "0111110010001011101100000101110100110000";
                WHEN "1100011" =>  memoryC1_uid237_exp10TabGen_q <= "1100110111010100101000000100000000111000";
                WHEN "1100100" =>  memoryC1_uid237_exp10TabGen_q <= "0010011111001000110010100101100110001010";
                WHEN "1100101" =>  memoryC1_uid237_exp10TabGen_q <= "1000101001111001100101100111111110010101";
                WHEN "1100110" =>  memoryC1_uid237_exp10TabGen_q <= "1111010111111000100011110111101101010110";
                WHEN "1100111" =>  memoryC1_uid237_exp10TabGen_q <= "0110101001010111011000110100111010100000";
                WHEN "1101000" =>  memoryC1_uid237_exp10TabGen_q <= "1110011110100111111000110111101010100011";
                WHEN "1101001" =>  memoryC1_uid237_exp10TabGen_q <= "0110110111111100000001010100011101110011";
                WHEN "1101010" =>  memoryC1_uid237_exp10TabGen_q <= "1111110101100101111000100000101110100001";
                WHEN "1101011" =>  memoryC1_uid237_exp10TabGen_q <= "1001010111110111101101110111010010010010";
                WHEN "1101100" =>  memoryC1_uid237_exp10TabGen_q <= "0011011111000011111001111100111111011110";
                WHEN "1101101" =>  memoryC1_uid237_exp10TabGen_q <= "1110001011011100111110100101010001110110";
                WHEN "1101110" =>  memoryC1_uid237_exp10TabGen_q <= "1001011101010101100110110110110011001000";
                WHEN "1101111" =>  memoryC1_uid237_exp10TabGen_q <= "0101010101000000100111010000000110011111";
                WHEN "1110000" =>  memoryC1_uid237_exp10TabGen_q <= "0001110010110000111101101100010101100001";
                WHEN "1110001" =>  memoryC1_uid237_exp10TabGen_q <= "1110110110111001110001100111111111010101";
                WHEN "1110010" =>  memoryC1_uid237_exp10TabGen_q <= "1100100001101110010100000101101010011001";
                WHEN "1110011" =>  memoryC1_uid237_exp10TabGen_q <= "1010110011100001111111110010111001100100";
                WHEN "1110100" =>  memoryC1_uid237_exp10TabGen_q <= "1001101100101000011001001101000001001110";
                WHEN "1110101" =>  memoryC1_uid237_exp10TabGen_q <= "1001001101010101001110100110000010110100";
                WHEN "1110110" =>  memoryC1_uid237_exp10TabGen_q <= "1001010101111100011000001001100101100100";
                WHEN "1110111" =>  memoryC1_uid237_exp10TabGen_q <= "1010000110110001111000000001110110110011";
                WHEN "1111000" =>  memoryC1_uid237_exp10TabGen_q <= "1011100000001001111010011100101001101110";
                WHEN "1111001" =>  memoryC1_uid237_exp10TabGen_q <= "1101100010011000110101110000011001010011";
                WHEN "1111010" =>  memoryC1_uid237_exp10TabGen_q <= "0000001101110011001010100001010000011101";
                WHEN "1111011" =>  memoryC1_uid237_exp10TabGen_q <= "0011100010101101100011100110001111100011";
                WHEN "1111100" =>  memoryC1_uid237_exp10TabGen_q <= "0111100001011100110110001110011000110111";
                WHEN "1111101" =>  memoryC1_uid237_exp10TabGen_q <= "1100001010010110000010000101111100110011";
                WHEN "1111110" =>  memoryC1_uid237_exp10TabGen_q <= "0001011101101110010001011011101010111011";
                WHEN "1111111" =>  memoryC1_uid237_exp10TabGen_q <= "0111011011111010111001000110000010110110";
                WHEN OTHERS =>
                    memoryC1_uid237_exp10TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--os_uid239_exp10TabGen(BITJOIN,238)@32
    os_uid239_exp10TabGen_q <= memoryC1_uid238_exp10TabGen_q & memoryC1_uid237_exp10TabGen_q;

	--cIncludingRoundingBit_uid270_exp10PolyEval(BITJOIN,269)@32
    cIncludingRoundingBit_uid270_exp10PolyEval_q <= os_uid239_exp10TabGen_q & rndBit_uid263_exp10PolyEval_q;

	--reg_cIncludingRoundingBit_uid270_exp10PolyEval_0_to_ts4_uid271_exp10PolyEval_0(REG,403)@32
    reg_cIncludingRoundingBit_uid270_exp10PolyEval_0_to_ts4_uid271_exp10PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid270_exp10PolyEval_0_to_ts4_uid271_exp10PolyEval_0_q <= "00000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cIncludingRoundingBit_uid270_exp10PolyEval_0_to_ts4_uid271_exp10PolyEval_0_q <= cIncludingRoundingBit_uid270_exp10PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ts4_uid271_exp10PolyEval(ADD,270)@33
    ts4_uid271_exp10PolyEval_a <= STD_LOGIC_VECTOR((53 downto 53 => reg_cIncludingRoundingBit_uid270_exp10PolyEval_0_to_ts4_uid271_exp10PolyEval_0_q(52)) & reg_cIncludingRoundingBit_uid270_exp10PolyEval_0_to_ts4_uid271_exp10PolyEval_0_q);
    ts4_uid271_exp10PolyEval_b <= STD_LOGIC_VECTOR((53 downto 46 => reg_R_uid317_pT4_uid268_exp10PolyEval_0_to_ts4_uid271_exp10PolyEval_1_q(45)) & reg_R_uid317_pT4_uid268_exp10PolyEval_0_to_ts4_uid271_exp10PolyEval_1_q);
            ts4_uid271_exp10PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts4_uid271_exp10PolyEval_a) + SIGNED(ts4_uid271_exp10PolyEval_b));
    ts4_uid271_exp10PolyEval_q <= ts4_uid271_exp10PolyEval_o(53 downto 0);


	--s4_uid272_exp10PolyEval(BITSELECT,271)@33
    s4_uid272_exp10PolyEval_in <= ts4_uid271_exp10PolyEval_q;
    s4_uid272_exp10PolyEval_b <= s4_uid272_exp10PolyEval_in(53 downto 1);

	--yTop27Bits_uid319_pT5_uid274_exp10PolyEval(BITSELECT,318)@33
    yTop27Bits_uid319_pT5_uid274_exp10PolyEval_in <= s4_uid272_exp10PolyEval_b;
    yTop27Bits_uid319_pT5_uid274_exp10PolyEval_b <= yTop27Bits_uid319_pT5_uid274_exp10PolyEval_in(52 downto 26);

	--reg_yTop27Bits_uid319_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_9(REG,408)@33
    reg_yTop27Bits_uid319_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid319_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_9_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid319_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_9_q <= yTop27Bits_uid319_pT5_uid274_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_nor(LOGICAL,1107)
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_nor_b <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_sticky_ena_q;
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_nor_q <= not (ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_nor_a or ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_nor_b);

	--ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_mem_top(CONSTANT,1103)
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_mem_top_q <= "010000";

	--ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmp(LOGICAL,1104)
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmp_a <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_mem_top_q;
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdmux_q);
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmp_q <= "1" when ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmp_a = ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmp_b else "0";

	--ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmpReg(REG,1105)
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmpReg_q <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_sticky_ena(REG,1108)
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_nor_q = "1") THEN
                ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_sticky_ena_q <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_enaAnd(LOGICAL,1109)
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_enaAnd_a <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_sticky_ena_q;
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_enaAnd_b <= en;
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_enaAnd_q <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_enaAnd_a and ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_enaAnd_b;

	--xBottomBits_uid322_pT5_uid274_exp10PolyEval(BITSELECT,321)@14
    xBottomBits_uid322_pT5_uid274_exp10PolyEval_in <= yPPolyEval_uid65_fpExpETest_b(20 downto 0);
    xBottomBits_uid322_pT5_uid274_exp10PolyEval_b <= xBottomBits_uid322_pT5_uid274_exp10PolyEval_in(20 downto 0);

	--ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_inputreg(DELAY,1097)
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_inputreg : dspba_delay
    GENERIC MAP ( width => 21, depth => 1 )
    PORT MAP ( xin => xBottomBits_uid322_pT5_uid274_exp10PolyEval_b, xout => ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt(COUNTER,1099)
    -- every=1, low=0, high=16, step=1, init=1
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_i = 15 THEN
                      ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_eq = '1') THEN
                        ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_i <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_i - 16;
                    ELSE
                        ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_i <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_i,5));


	--ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdreg(REG,1100)
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdreg_q <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdmux(MUX,1101)
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdmux_s <= en;
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdmux: PROCESS (ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdmux_s, ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdreg_q, ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_q)
    BEGIN
            CASE ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdmux_s IS
                  WHEN "0" => ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdmux_q <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdreg_q;
                  WHEN "1" => ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdmux_q <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem(DUALMEM,1098)
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_ia <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_inputreg_q;
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_aa <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdreg_q;
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_ab <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdmux_q;
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 21,
        widthad_a => 5,
        numwords_a => 17,
        width_b => 21,
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
        clocken1 => ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_iq,
        address_a => ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_aa,
        data_a => ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_ia
    );
    ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_reset0 <= areset;
        ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_q <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_iq(20 downto 0);

	--pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval(BITJOIN,325)@33
    pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_q <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_mem_q & STD_LOGIC_VECTOR((4 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_7(REG,407)@33
    reg_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_7_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_7_q <= pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_nor(LOGICAL,1094)
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_nor_b <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_sticky_ena_q;
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_nor_q <= not (ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_nor_a or ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_nor_b);

	--ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_mem_top(CONSTANT,1090)
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_mem_top_q <= "010001";

	--ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmp(LOGICAL,1091)
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmp_a <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_mem_top_q;
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdmux_q);
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmp_q <= "1" when ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmp_a = ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmp_b else "0";

	--ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmpReg(REG,1092)
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmpReg_q <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_sticky_ena(REG,1095)
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_nor_q = "1") THEN
                ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_sticky_ena_q <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_enaAnd(LOGICAL,1096)
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_enaAnd_a <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_sticky_ena_q;
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_enaAnd_b <= en;
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_enaAnd_q <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_enaAnd_a and ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_enaAnd_b;

	--xTop26Bits_uid323_pT5_uid274_exp10PolyEval(BITSELECT,322)@14
    xTop26Bits_uid323_pT5_uid274_exp10PolyEval_in <= yPPolyEval_uid65_fpExpETest_b;
    xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b <= xTop26Bits_uid323_pT5_uid274_exp10PolyEval_in(47 downto 22);

	--ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_inputreg(DELAY,1084)
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b, xout => ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt(COUNTER,1086)
    -- every=1, low=0, high=17, step=1, init=1
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_i = 16 THEN
                      ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_i <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_i - 17;
                    ELSE
                        ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_i <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_i,5));


	--ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdreg(REG,1087)
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdreg_q <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdmux(MUX,1088)
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdmux_s <= en;
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdmux: PROCESS (ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdmux_s, ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdreg_q, ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdmux_q <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdmux_q <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem(DUALMEM,1085)
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_ia <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_inputreg_q;
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_aa <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdreg_q;
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_ab <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_rdmux_q;
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 26,
        widthad_a => 5,
        numwords_a => 18,
        width_b => 26,
        widthad_b => 5,
        numwords_b => 18,
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
        clocken1 => ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_iq,
        address_a => ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_aa,
        data_a => ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_ia
    );
    ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_reset0 <= areset;
        ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_q <= ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_iq(25 downto 0);

	--spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval(BITJOIN,324)@34
    spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_q <= GND_q & ld_xTop26Bits_uid323_pT5_uid274_exp10PolyEval_b_to_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_a_replace_mem_q;

	--reg_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_6(REG,406)@34
    reg_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_6_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_6_q <= spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--yBottomBits_uid321_pT5_uid274_exp10PolyEval(BITSELECT,320)@33
    yBottomBits_uid321_pT5_uid274_exp10PolyEval_in <= s4_uid272_exp10PolyEval_b(25 downto 0);
    yBottomBits_uid321_pT5_uid274_exp10PolyEval_b <= yBottomBits_uid321_pT5_uid274_exp10PolyEval_in(25 downto 0);

	--ld_yBottomBits_uid321_pT5_uid274_exp10PolyEval_b_to_pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval_b(DELAY,768)@33
    ld_yBottomBits_uid321_pT5_uid274_exp10PolyEval_b_to_pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval_b : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => yBottomBits_uid321_pT5_uid274_exp10PolyEval_b, xout => ld_yBottomBits_uid321_pT5_uid274_exp10PolyEval_b_to_pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval_b_q, ena => en(0), clk => clk, aclr => areset );

	--pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval(BITJOIN,326)@34
    pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval_q <= ld_yBottomBits_uid321_pT5_uid274_exp10PolyEval_b_to_pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval_b_q & GND_q;

	--reg_pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_4(REG,405)@34
    reg_pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_4_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_4_q <= pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma(CHAINMULTADD,340)@35
    multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_a(0),28));
    multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_a(1),28));
    multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_p(0) <= multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_l(0) * multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_c(0);
    multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_p(1) <= multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_l(1) * multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_c(1);
    multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_w(0) <= RESIZE(multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_p(0),56);
    multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_w(1) <= RESIZE(multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_p(1),56);
    multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_x(0) <= multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_w(0);
    multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_x(1) <= multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_w(1);
    multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_y(0) <= multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_s(1) + multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_x(0);
    multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_y(1) <= multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_x(1);
    multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_a <= (others => (others => '0'));
            multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_c <= (others => (others => '0'));
            multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_a(0) <= RESIZE(UNSIGNED(reg_pad_yBottomBits_uid321_uid327_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_4_q),27);
            multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_a(1) <= RESIZE(UNSIGNED(reg_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_7_q),27);
            multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_c(0) <= RESIZE(SIGNED(reg_spad_xTop26Bits_uid323_uid325_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_6_q),27);
            multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_c(1) <= RESIZE(SIGNED(reg_yTop27Bits_uid319_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_9_q),27);
            IF (en = "1") THEN
                multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_s(0) <= multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_y(0);
                multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_s(1) <= multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_y(1);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_delay : dspba_delay
    GENERIC MAP (width => 55, depth => 1)
    PORT MAP (xin => STD_LOGIC_VECTOR(multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_s(0)(54 downto 0)), xout => multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_q, clk => clk, aclr => areset);

	--multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval(BITSELECT,328)@38
    multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_in <= multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_q;
    multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_b <= multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_in(54 downto 1);

	--highBBits_uid335_pT5_uid274_exp10PolyEval(BITSELECT,334)@38
    highBBits_uid335_pT5_uid274_exp10PolyEval_in <= multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_b;
    highBBits_uid335_pT5_uid274_exp10PolyEval_b <= highBBits_uid335_pT5_uid274_exp10PolyEval_in(53 downto 19);

	--ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_nor(LOGICAL,1170)
    ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_nor_b <= ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_sticky_ena_q;
    ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_nor_q <= not (ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_nor_a or ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_nor_b);

	--ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_sticky_ena(REG,1171)
    ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_nor_q = "1") THEN
                ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_sticky_ena_q <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_enaAnd(LOGICAL,1172)
    ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_enaAnd_a <= ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_sticky_ena_q;
    ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_enaAnd_b <= en;
    ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_enaAnd_q <= ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_enaAnd_a and ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_enaAnd_b;

	--xTop27Bits_uid318_pT5_uid274_exp10PolyEval(BITSELECT,317)@14
    xTop27Bits_uid318_pT5_uid274_exp10PolyEval_in <= yPPolyEval_uid65_fpExpETest_b;
    xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b <= xTop27Bits_uid318_pT5_uid274_exp10PolyEval_in(47 downto 21);

	--ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_inputreg(DELAY,1160)
    ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 27, depth => 1 )
    PORT MAP ( xin => xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b, xout => ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem(DUALMEM,1161)
    ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_ia <= ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_inputreg_q;
    ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_aa <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdreg_q;
    ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_ab <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdmux_q;
    ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 27,
        widthad_a => 5,
        numwords_a => 17,
        width_b => 27,
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
        clocken1 => ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_iq,
        address_a => ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_aa,
        data_a => ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_ia
    );
    ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_reset0 <= areset;
        ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_q <= ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_iq(26 downto 0);

	--reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0(REG,411)@33
    reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_q <= ld_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_b_to_reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--topProd_uid320_pT5_uid274_exp10PolyEval(MULT,319)@34
    topProd_uid320_pT5_uid274_exp10PolyEval_pr <= signed(resize(UNSIGNED(topProd_uid320_pT5_uid274_exp10PolyEval_a),28)) * SIGNED(topProd_uid320_pT5_uid274_exp10PolyEval_b);
    topProd_uid320_pT5_uid274_exp10PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid320_pT5_uid274_exp10PolyEval_a <= (others => '0');
            topProd_uid320_pT5_uid274_exp10PolyEval_b <= (others => '0');
            topProd_uid320_pT5_uid274_exp10PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid320_pT5_uid274_exp10PolyEval_a <= reg_xTop27Bits_uid318_pT5_uid274_exp10PolyEval_0_to_topProd_uid320_pT5_uid274_exp10PolyEval_0_q;
                topProd_uid320_pT5_uid274_exp10PolyEval_b <= reg_yTop27Bits_uid319_pT5_uid274_exp10PolyEval_0_to_multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_cma_9_q;
                topProd_uid320_pT5_uid274_exp10PolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid320_pT5_uid274_exp10PolyEval_pr,54));
            END IF;
        END IF;
    END PROCESS;
    topProd_uid320_pT5_uid274_exp10PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid320_pT5_uid274_exp10PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid320_pT5_uid274_exp10PolyEval_q <= topProd_uid320_pT5_uid274_exp10PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_nor(LOGICAL,1120)
    ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_nor_b <= ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_sticky_ena_q;
    ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_nor_q <= not (ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_nor_a or ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_nor_b);

	--ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_sticky_ena(REG,1121)
    ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_nor_q = "1") THEN
                ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_sticky_ena_q <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_enaAnd(LOGICAL,1122)
    ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_enaAnd_a <= ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_sticky_ena_q;
    ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_enaAnd_b <= en;
    ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_enaAnd_q <= ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_enaAnd_a and ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_enaAnd_b;

	--sSM0W_uid331_pT5_uid274_exp10PolyEval(BITSELECT,330)@14
    sSM0W_uid331_pT5_uid274_exp10PolyEval_in <= yPPolyEval_uid65_fpExpETest_b(20 downto 0);
    sSM0W_uid331_pT5_uid274_exp10PolyEval_b <= sSM0W_uid331_pT5_uid274_exp10PolyEval_in(20 downto 18);

	--reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1(REG,410)@14
    reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q <= sSM0W_uid331_pT5_uid274_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_inputreg(DELAY,1110)
    ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q, xout => ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem(DUALMEM,1111)
    ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_ia <= ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_inputreg_q;
    ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_aa <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdreg_q;
    ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_ab <= ld_xBottomBits_uid322_pT5_uid274_exp10PolyEval_b_to_pad_xBottomBits_uid322_uid326_pT5_uid274_exp10PolyEval_b_replace_rdmux_q;
    ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 5,
        numwords_a => 17,
        width_b => 3,
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
        clocken1 => ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_iq,
        address_a => ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_aa,
        data_a => ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_ia
    );
    ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_reset0 <= areset;
        ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_q <= ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_iq(2 downto 0);

	--sSM0H_uid330_pT5_uid274_exp10PolyEval(BITSELECT,329)@33
    sSM0H_uid330_pT5_uid274_exp10PolyEval_in <= s4_uid272_exp10PolyEval_b(25 downto 0);
    sSM0H_uid330_pT5_uid274_exp10PolyEval_b <= sSM0H_uid330_pT5_uid274_exp10PolyEval_in(25 downto 23);

	--reg_sSM0H_uid330_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_0(REG,409)@33
    reg_sSM0H_uid330_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sSM0H_uid330_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sSM0H_uid330_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_0_q <= sSM0H_uid330_pT5_uid274_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--sm0_uid332_pT5_uid274_exp10PolyEval(MULT,331)@34
    sm0_uid332_pT5_uid274_exp10PolyEval_pr <= UNSIGNED(sm0_uid332_pT5_uid274_exp10PolyEval_a) * UNSIGNED(sm0_uid332_pT5_uid274_exp10PolyEval_b);
    sm0_uid332_pT5_uid274_exp10PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid332_pT5_uid274_exp10PolyEval_a <= (others => '0');
            sm0_uid332_pT5_uid274_exp10PolyEval_b <= (others => '0');
            sm0_uid332_pT5_uid274_exp10PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm0_uid332_pT5_uid274_exp10PolyEval_a <= reg_sSM0H_uid330_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_0_q;
                sm0_uid332_pT5_uid274_exp10PolyEval_b <= ld_reg_sSM0W_uid331_pT5_uid274_exp10PolyEval_0_to_sm0_uid332_pT5_uid274_exp10PolyEval_1_q_to_sm0_uid332_pT5_uid274_exp10PolyEval_b_replace_mem_q;
                sm0_uid332_pT5_uid274_exp10PolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid332_pT5_uid274_exp10PolyEval_pr);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid332_pT5_uid274_exp10PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid332_pT5_uid274_exp10PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm0_uid332_pT5_uid274_exp10PolyEval_q <= sm0_uid332_pT5_uid274_exp10PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--TtopProdConcSoftProd_uid333_pT5_uid274_exp10PolyEval(BITJOIN,332)@37
    TtopProdConcSoftProd_uid333_pT5_uid274_exp10PolyEval_q <= topProd_uid320_pT5_uid274_exp10PolyEval_q & sm0_uid332_pT5_uid274_exp10PolyEval_q;

	--ld_TtopProdConcSoftProd_uid333_pT5_uid274_exp10PolyEval_q_to_sumAHighB_uid336_pT5_uid274_exp10PolyEval_a(DELAY,778)@37
    ld_TtopProdConcSoftProd_uid333_pT5_uid274_exp10PolyEval_q_to_sumAHighB_uid336_pT5_uid274_exp10PolyEval_a : dspba_delay
    GENERIC MAP ( width => 60, depth => 1 )
    PORT MAP ( xin => TtopProdConcSoftProd_uid333_pT5_uid274_exp10PolyEval_q, xout => ld_TtopProdConcSoftProd_uid333_pT5_uid274_exp10PolyEval_q_to_sumAHighB_uid336_pT5_uid274_exp10PolyEval_a_q, ena => en(0), clk => clk, aclr => areset );

	--sumAHighB_uid336_pT5_uid274_exp10PolyEval(ADD,335)@38
    sumAHighB_uid336_pT5_uid274_exp10PolyEval_a <= STD_LOGIC_VECTOR((60 downto 60 => ld_TtopProdConcSoftProd_uid333_pT5_uid274_exp10PolyEval_q_to_sumAHighB_uid336_pT5_uid274_exp10PolyEval_a_q(59)) & ld_TtopProdConcSoftProd_uid333_pT5_uid274_exp10PolyEval_q_to_sumAHighB_uid336_pT5_uid274_exp10PolyEval_a_q);
    sumAHighB_uid336_pT5_uid274_exp10PolyEval_b <= STD_LOGIC_VECTOR((60 downto 35 => highBBits_uid335_pT5_uid274_exp10PolyEval_b(34)) & highBBits_uid335_pT5_uid274_exp10PolyEval_b);
            sumAHighB_uid336_pT5_uid274_exp10PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid336_pT5_uid274_exp10PolyEval_a) + SIGNED(sumAHighB_uid336_pT5_uid274_exp10PolyEval_b));
    sumAHighB_uid336_pT5_uid274_exp10PolyEval_q <= sumAHighB_uid336_pT5_uid274_exp10PolyEval_o(60 downto 0);


	--lowRangeB_uid334_pT5_uid274_exp10PolyEval(BITSELECT,333)@38
    lowRangeB_uid334_pT5_uid274_exp10PolyEval_in <= multSumOfTwo27_uid325_pT5_uid274_exp10PolyEval_b(18 downto 0);
    lowRangeB_uid334_pT5_uid274_exp10PolyEval_b <= lowRangeB_uid334_pT5_uid274_exp10PolyEval_in(18 downto 0);

	--add0_uid334_uid337_pT5_uid274_exp10PolyEval(BITJOIN,336)@38
    add0_uid334_uid337_pT5_uid274_exp10PolyEval_q <= sumAHighB_uid336_pT5_uid274_exp10PolyEval_q & lowRangeB_uid334_pT5_uid274_exp10PolyEval_b;

	--R_uid338_pT5_uid274_exp10PolyEval(BITSELECT,337)@38
    R_uid338_pT5_uid274_exp10PolyEval_in <= add0_uid334_uid337_pT5_uid274_exp10PolyEval_q(78 downto 0);
    R_uid338_pT5_uid274_exp10PolyEval_b <= R_uid338_pT5_uid274_exp10PolyEval_in(78 downto 24);

	--reg_R_uid338_pT5_uid274_exp10PolyEval_0_to_ts5_uid277_exp10PolyEval_1(REG,414)@38
    reg_R_uid338_pT5_uid274_exp10PolyEval_0_to_ts5_uid277_exp10PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid338_pT5_uid274_exp10PolyEval_0_to_ts5_uid277_exp10PolyEval_1_q <= "0000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_R_uid338_pT5_uid274_exp10PolyEval_0_to_ts5_uid277_exp10PolyEval_1_q <= R_uid338_pT5_uid274_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_nor(LOGICAL,1016)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_nor_b <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_sticky_ena_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_nor_q <= not (ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_nor_a or ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_nor_b);

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_mem_top(CONSTANT,1012)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_mem_top_q <= "010100";

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmp(LOGICAL,1013)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmp_a <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_mem_top_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdmux_q);
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmp_q <= "1" when ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmp_a = ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmp_b else "0";

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmpReg(REG,1014)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmpReg_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_sticky_ena(REG,1017)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_nor_q = "1") THEN
                ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_sticky_ena_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_enaAnd(LOGICAL,1018)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_enaAnd_a <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_sticky_ena_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_enaAnd_b <= en;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_enaAnd_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_enaAnd_a and ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_enaAnd_b;

	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt(COUNTER,1008)
    -- every=1, low=0, high=20, step=1, init=1
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_i = 19 THEN
                      ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_i <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_i - 20;
                    ELSE
                        ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_i <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_i,5));


	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdreg(REG,1009)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdreg_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdmux(MUX,1010)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdmux_s <= en;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdmux: PROCESS (ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdmux_s, ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdreg_q, ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdmux_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdmux_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem(DUALMEM,1007)
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_ia <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_inputreg_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_aa <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdreg_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_ab <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdmux_q;
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 5,
        numwords_a => 21,
        width_b => 7,
        widthad_b => 5,
        numwords_b => 21,
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
        clocken1 => ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_iq,
        address_a => ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_aa,
        data_a => ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_ia
    );
    ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_reset0 <= areset;
        ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_iq(6 downto 0);

	--memoryC0_uid235_exp10TabGen(LOOKUP,234)@37
    memoryC0_uid235_exp10TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC0_uid235_exp10TabGen_q <= "001000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_mem_q) IS
                WHEN "0000000" =>  memoryC0_uid235_exp10TabGen_q <= "001000000000000000";
                WHEN "0000001" =>  memoryC0_uid235_exp10TabGen_q <= "001000000100000001";
                WHEN "0000010" =>  memoryC0_uid235_exp10TabGen_q <= "001000001000000100";
                WHEN "0000011" =>  memoryC0_uid235_exp10TabGen_q <= "001000001100001001";
                WHEN "0000100" =>  memoryC0_uid235_exp10TabGen_q <= "001000010000010000";
                WHEN "0000101" =>  memoryC0_uid235_exp10TabGen_q <= "001000010100011001";
                WHEN "0000110" =>  memoryC0_uid235_exp10TabGen_q <= "001000011000100100";
                WHEN "0000111" =>  memoryC0_uid235_exp10TabGen_q <= "001000011100110001";
                WHEN "0001000" =>  memoryC0_uid235_exp10TabGen_q <= "001000100001000001";
                WHEN "0001001" =>  memoryC0_uid235_exp10TabGen_q <= "001000100101010010";
                WHEN "0001010" =>  memoryC0_uid235_exp10TabGen_q <= "001000101001100110";
                WHEN "0001011" =>  memoryC0_uid235_exp10TabGen_q <= "001000101101111100";
                WHEN "0001100" =>  memoryC0_uid235_exp10TabGen_q <= "001000110010010100";
                WHEN "0001101" =>  memoryC0_uid235_exp10TabGen_q <= "001000110110101110";
                WHEN "0001110" =>  memoryC0_uid235_exp10TabGen_q <= "001000111011001011";
                WHEN "0001111" =>  memoryC0_uid235_exp10TabGen_q <= "001000111111101010";
                WHEN "0010000" =>  memoryC0_uid235_exp10TabGen_q <= "001001000100001011";
                WHEN "0010001" =>  memoryC0_uid235_exp10TabGen_q <= "001001001000101110";
                WHEN "0010010" =>  memoryC0_uid235_exp10TabGen_q <= "001001001101010011";
                WHEN "0010011" =>  memoryC0_uid235_exp10TabGen_q <= "001001010001111011";
                WHEN "0010100" =>  memoryC0_uid235_exp10TabGen_q <= "001001010110100101";
                WHEN "0010101" =>  memoryC0_uid235_exp10TabGen_q <= "001001011011010010";
                WHEN "0010110" =>  memoryC0_uid235_exp10TabGen_q <= "001001100000000000";
                WHEN "0010111" =>  memoryC0_uid235_exp10TabGen_q <= "001001100100110010";
                WHEN "0011000" =>  memoryC0_uid235_exp10TabGen_q <= "001001101001100101";
                WHEN "0011001" =>  memoryC0_uid235_exp10TabGen_q <= "001001101110011011";
                WHEN "0011010" =>  memoryC0_uid235_exp10TabGen_q <= "001001110011010100";
                WHEN "0011011" =>  memoryC0_uid235_exp10TabGen_q <= "001001111000001111";
                WHEN "0011100" =>  memoryC0_uid235_exp10TabGen_q <= "001001111101001100";
                WHEN "0011101" =>  memoryC0_uid235_exp10TabGen_q <= "001010000010001100";
                WHEN "0011110" =>  memoryC0_uid235_exp10TabGen_q <= "001010000111001110";
                WHEN "0011111" =>  memoryC0_uid235_exp10TabGen_q <= "001010001100010011";
                WHEN "0100000" =>  memoryC0_uid235_exp10TabGen_q <= "001010010001011010";
                WHEN "0100001" =>  memoryC0_uid235_exp10TabGen_q <= "001010010110100100";
                WHEN "0100010" =>  memoryC0_uid235_exp10TabGen_q <= "001010011011110001";
                WHEN "0100011" =>  memoryC0_uid235_exp10TabGen_q <= "001010100001000000";
                WHEN "0100100" =>  memoryC0_uid235_exp10TabGen_q <= "001010100110010010";
                WHEN "0100101" =>  memoryC0_uid235_exp10TabGen_q <= "001010101011100111";
                WHEN "0100110" =>  memoryC0_uid235_exp10TabGen_q <= "001010110000111110";
                WHEN "0100111" =>  memoryC0_uid235_exp10TabGen_q <= "001010110110010111";
                WHEN "0101000" =>  memoryC0_uid235_exp10TabGen_q <= "001010111011110100";
                WHEN "0101001" =>  memoryC0_uid235_exp10TabGen_q <= "001011000001010011";
                WHEN "0101010" =>  memoryC0_uid235_exp10TabGen_q <= "001011000110110101";
                WHEN "0101011" =>  memoryC0_uid235_exp10TabGen_q <= "001011001100011010";
                WHEN "0101100" =>  memoryC0_uid235_exp10TabGen_q <= "001011010010000010";
                WHEN "0101101" =>  memoryC0_uid235_exp10TabGen_q <= "001011010111101100";
                WHEN "0101110" =>  memoryC0_uid235_exp10TabGen_q <= "001011011101011001";
                WHEN "0101111" =>  memoryC0_uid235_exp10TabGen_q <= "001011100011001010";
                WHEN "0110000" =>  memoryC0_uid235_exp10TabGen_q <= "001011101000111101";
                WHEN "0110001" =>  memoryC0_uid235_exp10TabGen_q <= "001011101110110011";
                WHEN "0110010" =>  memoryC0_uid235_exp10TabGen_q <= "001011110100101011";
                WHEN "0110011" =>  memoryC0_uid235_exp10TabGen_q <= "001011111010100111";
                WHEN "0110100" =>  memoryC0_uid235_exp10TabGen_q <= "001100000000100110";
                WHEN "0110101" =>  memoryC0_uid235_exp10TabGen_q <= "001100000110101000";
                WHEN "0110110" =>  memoryC0_uid235_exp10TabGen_q <= "001100001100101101";
                WHEN "0110111" =>  memoryC0_uid235_exp10TabGen_q <= "001100010010110101";
                WHEN "0111000" =>  memoryC0_uid235_exp10TabGen_q <= "001100011001000000";
                WHEN "0111001" =>  memoryC0_uid235_exp10TabGen_q <= "001100011111001110";
                WHEN "0111010" =>  memoryC0_uid235_exp10TabGen_q <= "001100100101011111";
                WHEN "0111011" =>  memoryC0_uid235_exp10TabGen_q <= "001100101011110011";
                WHEN "0111100" =>  memoryC0_uid235_exp10TabGen_q <= "001100110010001011";
                WHEN "0111101" =>  memoryC0_uid235_exp10TabGen_q <= "001100111000100101";
                WHEN "0111110" =>  memoryC0_uid235_exp10TabGen_q <= "001100111111000011";
                WHEN "0111111" =>  memoryC0_uid235_exp10TabGen_q <= "001101000101100100";
                WHEN "1000000" =>  memoryC0_uid235_exp10TabGen_q <= "001101001100001001";
                WHEN "1000001" =>  memoryC0_uid235_exp10TabGen_q <= "001101010010110001";
                WHEN "1000010" =>  memoryC0_uid235_exp10TabGen_q <= "001101011001011100";
                WHEN "1000011" =>  memoryC0_uid235_exp10TabGen_q <= "001101100000001010";
                WHEN "1000100" =>  memoryC0_uid235_exp10TabGen_q <= "001101100110111100";
                WHEN "1000101" =>  memoryC0_uid235_exp10TabGen_q <= "001101101101110001";
                WHEN "1000110" =>  memoryC0_uid235_exp10TabGen_q <= "001101110100101010";
                WHEN "1000111" =>  memoryC0_uid235_exp10TabGen_q <= "001101111011100110";
                WHEN "1001000" =>  memoryC0_uid235_exp10TabGen_q <= "001110000010100101";
                WHEN "1001001" =>  memoryC0_uid235_exp10TabGen_q <= "001110001001101000";
                WHEN "1001010" =>  memoryC0_uid235_exp10TabGen_q <= "001110010000101111";
                WHEN "1001011" =>  memoryC0_uid235_exp10TabGen_q <= "001110010111111001";
                WHEN "1001100" =>  memoryC0_uid235_exp10TabGen_q <= "001110011111000111";
                WHEN "1001101" =>  memoryC0_uid235_exp10TabGen_q <= "001110100110011000";
                WHEN "1001110" =>  memoryC0_uid235_exp10TabGen_q <= "001110101101101101";
                WHEN "1001111" =>  memoryC0_uid235_exp10TabGen_q <= "001110110101000110";
                WHEN "1010000" =>  memoryC0_uid235_exp10TabGen_q <= "001110111100100010";
                WHEN "1010001" =>  memoryC0_uid235_exp10TabGen_q <= "001111000100000010";
                WHEN "1010010" =>  memoryC0_uid235_exp10TabGen_q <= "001111001011100110";
                WHEN "1010011" =>  memoryC0_uid235_exp10TabGen_q <= "001111010011001110";
                WHEN "1010100" =>  memoryC0_uid235_exp10TabGen_q <= "001111011010111001";
                WHEN "1010101" =>  memoryC0_uid235_exp10TabGen_q <= "001111100010101001";
                WHEN "1010110" =>  memoryC0_uid235_exp10TabGen_q <= "001111101010011100";
                WHEN "1010111" =>  memoryC0_uid235_exp10TabGen_q <= "001111110010010011";
                WHEN "1011000" =>  memoryC0_uid235_exp10TabGen_q <= "001111111010001110";
                WHEN "1011001" =>  memoryC0_uid235_exp10TabGen_q <= "010000000010001110";
                WHEN "1011010" =>  memoryC0_uid235_exp10TabGen_q <= "010000001010010001";
                WHEN "1011011" =>  memoryC0_uid235_exp10TabGen_q <= "010000010010011000";
                WHEN "1011100" =>  memoryC0_uid235_exp10TabGen_q <= "010000011010100011";
                WHEN "1011101" =>  memoryC0_uid235_exp10TabGen_q <= "010000100010110010";
                WHEN "1011110" =>  memoryC0_uid235_exp10TabGen_q <= "010000101011000110";
                WHEN "1011111" =>  memoryC0_uid235_exp10TabGen_q <= "010000110011011110";
                WHEN "1100000" =>  memoryC0_uid235_exp10TabGen_q <= "010000111011111001";
                WHEN "1100001" =>  memoryC0_uid235_exp10TabGen_q <= "010001000100011001";
                WHEN "1100010" =>  memoryC0_uid235_exp10TabGen_q <= "010001001100111110";
                WHEN "1100011" =>  memoryC0_uid235_exp10TabGen_q <= "010001010101100110";
                WHEN "1100100" =>  memoryC0_uid235_exp10TabGen_q <= "010001011110010011";
                WHEN "1100101" =>  memoryC0_uid235_exp10TabGen_q <= "010001100111000101";
                WHEN "1100110" =>  memoryC0_uid235_exp10TabGen_q <= "010001101111111010";
                WHEN "1100111" =>  memoryC0_uid235_exp10TabGen_q <= "010001111000110101";
                WHEN "1101000" =>  memoryC0_uid235_exp10TabGen_q <= "010010000001110011";
                WHEN "1101001" =>  memoryC0_uid235_exp10TabGen_q <= "010010001010110110";
                WHEN "1101010" =>  memoryC0_uid235_exp10TabGen_q <= "010010010011111110";
                WHEN "1101011" =>  memoryC0_uid235_exp10TabGen_q <= "010010011101001010";
                WHEN "1101100" =>  memoryC0_uid235_exp10TabGen_q <= "010010100110011011";
                WHEN "1101101" =>  memoryC0_uid235_exp10TabGen_q <= "010010101111110001";
                WHEN "1101110" =>  memoryC0_uid235_exp10TabGen_q <= "010010111001001011";
                WHEN "1101111" =>  memoryC0_uid235_exp10TabGen_q <= "010011000010101010";
                WHEN "1110000" =>  memoryC0_uid235_exp10TabGen_q <= "010011001100001110";
                WHEN "1110001" =>  memoryC0_uid235_exp10TabGen_q <= "010011010101110110";
                WHEN "1110010" =>  memoryC0_uid235_exp10TabGen_q <= "010011011111100100";
                WHEN "1110011" =>  memoryC0_uid235_exp10TabGen_q <= "010011101001010110";
                WHEN "1110100" =>  memoryC0_uid235_exp10TabGen_q <= "010011110011001101";
                WHEN "1110101" =>  memoryC0_uid235_exp10TabGen_q <= "010011111101001001";
                WHEN "1110110" =>  memoryC0_uid235_exp10TabGen_q <= "010100000111001010";
                WHEN "1110111" =>  memoryC0_uid235_exp10TabGen_q <= "010100010001010000";
                WHEN "1111000" =>  memoryC0_uid235_exp10TabGen_q <= "010100011011011100";
                WHEN "1111001" =>  memoryC0_uid235_exp10TabGen_q <= "010100100101101100";
                WHEN "1111010" =>  memoryC0_uid235_exp10TabGen_q <= "010100110000000001";
                WHEN "1111011" =>  memoryC0_uid235_exp10TabGen_q <= "010100111010011100";
                WHEN "1111100" =>  memoryC0_uid235_exp10TabGen_q <= "010101000100111100";
                WHEN "1111101" =>  memoryC0_uid235_exp10TabGen_q <= "010101001111100001";
                WHEN "1111110" =>  memoryC0_uid235_exp10TabGen_q <= "010101011010001011";
                WHEN "1111111" =>  memoryC0_uid235_exp10TabGen_q <= "010101100100111011";
                WHEN OTHERS =>
                    memoryC0_uid235_exp10TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_nor(LOGICAL,1133)
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_nor_b <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_sticky_ena_q;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_nor_q <= not (ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_nor_a or ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_nor_b);

	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_sticky_ena(REG,1134)
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_nor_q = "1") THEN
                ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_sticky_ena_q <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_enaAnd(LOGICAL,1135)
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_enaAnd_a <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_sticky_ena_q;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_enaAnd_b <= en;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_enaAnd_q <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_enaAnd_a and ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_enaAnd_b;

	--ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem(DUALMEM,1124)
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_ia <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_inputreg_q;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_aa <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdreg_q;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_ab <= ld_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid235_exp10TabGen_0_q_to_memoryC0_uid235_exp10TabGen_a_replace_rdmux_q;
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 5,
        numwords_a => 21,
        width_b => 7,
        widthad_b => 5,
        numwords_b => 21,
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
        clocken1 => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_iq,
        address_a => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_aa,
        data_a => ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_ia
    );
    ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_reset0 <= areset;
        ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_q <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_iq(6 downto 0);

	--reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0(REG,377)@36
    reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_q <= ld_addr_uid64_fpExpETest_b_to_reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid234_exp10TabGen(LOOKUP,233)@37
    memoryC0_uid234_exp10TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC0_uid234_exp10TabGen_q <= "0000000000000000000000000000000000000100";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_addr_uid64_fpExpETest_0_to_memoryC0_uid234_exp10TabGen_0_q) IS
                WHEN "0000000" =>  memoryC0_uid234_exp10TabGen_q <= "0000000000000000000000000000000000000100";
                WHEN "0000001" =>  memoryC0_uid234_exp10TabGen_q <= "0000000010101011000000000010001000110010";
                WHEN "0000010" =>  memoryC0_uid234_exp10TabGen_q <= "0000010101011010101011101111000111001101";
                WHEN "0000011" =>  memoryC0_uid234_exp10TabGen_q <= "0001001000011011001000001000011011101101";
                WHEN "0000100" =>  memoryC0_uid234_exp10TabGen_q <= "0010101100000000100010010011111101101001";
                WHEN "0000101" =>  memoryC0_uid234_exp10TabGen_q <= "0101010000100111010011100000111110110000";
                WHEN "0000110" =>  memoryC0_uid234_exp10TabGen_q <= "1001000110110100000101001111010001100010";
                WHEN "0000111" =>  memoryC0_uid234_exp10TabGen_q <= "1110011111010011110101011000010011101101";
                WHEN "0001000" =>  memoryC0_uid234_exp10TabGen_q <= "0101101010111011111010011010011101110000";
                WHEN "0001001" =>  memoryC0_uid234_exp10TabGen_q <= "1110111010101010000111100110011000101011";
                WHEN "0001010" =>  memoryC0_uid234_exp10TabGen_q <= "1010011111100100110001001110011010110110";
                WHEN "0001011" =>  memoryC0_uid234_exp10TabGen_q <= "1000101010111010110000111000001101001101";
                WHEN "0001100" =>  memoryC0_uid234_exp10TabGen_q <= "1001101110000011101001110000011001101111";
                WHEN "0001101" =>  memoryC0_uid234_exp10TabGen_q <= "1101111010011111101101000000100100010110";
                WHEN "0001110" =>  memoryC0_uid234_exp10TabGen_q <= "0101100001110111111110000111001111001110";
                WHEN "0001111" =>  memoryC0_uid234_exp10TabGen_q <= "0000110101111110010111010010001011110111";
                WHEN "0010000" =>  memoryC0_uid234_exp10TabGen_q <= "0000001000101101101101111010111001101100";
                WHEN "0010001" =>  memoryC0_uid234_exp10TabGen_q <= "0011101100001001110111000101010011011100";
                WHEN "0010010" =>  memoryC0_uid234_exp10TabGen_q <= "1011110010011111101100000000101100100101";
                WHEN "0010011" =>  memoryC0_uid234_exp10TabGen_q <= "1000101110000101001110101010111111110000";
                WHEN "0010100" =>  memoryC0_uid234_exp10TabGen_q <= "1010110001011001101110010110001111001110";
                WHEN "0010101" =>  memoryC0_uid234_exp10TabGen_q <= "0010001111000101101100010000011000111110";
                WHEN "0010110" =>  memoryC0_uid234_exp10TabGen_q <= "1111011001111011000000001101011110111100";
                WHEN "0010111" =>  memoryC0_uid234_exp10TabGen_q <= "0010100100110100111101010100000101001100";
                WHEN "0011000" =>  memoryC0_uid234_exp10TabGen_q <= "1100000010111000010110101100000110101101";
                WHEN "0011001" =>  memoryC0_uid234_exp10TabGen_q <= "1100000111010011100100010000000010010110";
                WHEN "0011010" =>  memoryC0_uid234_exp10TabGen_q <= "0011000101011110100111100000100000110111";
                WHEN "0011011" =>  memoryC0_uid234_exp10TabGen_q <= "0001010000111011010000011010010101011000";
                WHEN "0011100" =>  memoryC0_uid234_exp10TabGen_q <= "0110111101010101000010001110111001100001";
                WHEN "0011101" =>  memoryC0_uid234_exp10TabGen_q <= "0100011110100001011000011111000110010100";
                WHEN "0011110" =>  memoryC0_uid234_exp10TabGen_q <= "1010001000011111101011111000101011001011";
                WHEN "0011111" =>  memoryC0_uid234_exp10TabGen_q <= "1000001111011001010111010110000100001011";
                WHEN "0100000" =>  memoryC0_uid234_exp10TabGen_q <= "1111000111100001111101000000110000110111";
                WHEN "0100001" =>  memoryC0_uid234_exp10TabGen_q <= "1111000101010111001011010110001100111110";
                WHEN "0100010" =>  memoryC0_uid234_exp10TabGen_q <= "1000011101100001000010001111001100000101";
                WHEN "0100011" =>  memoryC0_uid234_exp10TabGen_q <= "1011100100110001111000001001111001101100";
                WHEN "0100100" =>  memoryC0_uid234_exp10TabGen_q <= "1000110000000110011111010110011110111111";
                WHEN "0100101" =>  memoryC0_uid234_exp10TabGen_q <= "0000010100100110001011000110001111100010";
                WHEN "0100110" =>  memoryC0_uid234_exp10TabGen_q <= "0010100111100010110100111101011110000101";
                WHEN "0100111" =>  memoryC0_uid234_exp10TabGen_q <= "1111111110011001000010000111111011001111";
                WHEN "0101000" =>  memoryC0_uid234_exp10TabGen_q <= "1000101110110000001000101111111110101110";
                WHEN "0101001" =>  memoryC0_uid234_exp10TabGen_q <= "1101001110011010010101011000011101001000";
                WHEN "0101010" =>  memoryC0_uid234_exp10TabGen_q <= "1101110011010100110000011001001011000110";
                WHEN "0101011" =>  memoryC0_uid234_exp10TabGen_q <= "1010110011100111100011011110001111100111";
                WHEN "0101100" =>  memoryC0_uid234_exp10TabGen_q <= "0100100101100101111111001010000110011010";
                WHEN "0101101" =>  memoryC0_uid234_exp10TabGen_q <= "1011011111101110100000011010010100011000";
                WHEN "0101110" =>  memoryC0_uid234_exp10TabGen_q <= "1111111000101010110110001111001110110010";
                WHEN "0101111" =>  memoryC0_uid234_exp10TabGen_q <= "0010000111010000000111010110010111001101";
                WHEN "0110000" =>  memoryC0_uid234_exp10TabGen_q <= "0010100010011110110111110111101101010111";
                WHEN "0110001" =>  memoryC0_uid234_exp10TabGen_q <= "0001100001100011001111000101111000001011";
                WHEN "0110010" =>  memoryC0_uid234_exp10TabGen_q <= "1111011011110100111101010001000111110011";
                WHEN "0110011" =>  memoryC0_uid234_exp10TabGen_q <= "1100101000110111100001011101010001101111";
                WHEN "0110100" =>  memoryC0_uid234_exp10TabGen_q <= "1001100000011010001111011010101000110010";
                WHEN "0110101" =>  memoryC0_uid234_exp10TabGen_q <= "0110011010011000010101100001110010000100";
                WHEN "0110110" =>  memoryC0_uid234_exp10TabGen_q <= "0011101110111001000010110010011000101110";
                WHEN "0110111" =>  memoryC0_uid234_exp10TabGen_q <= "0001110110001111101100110101000001110111";
                WHEN "0111000" =>  memoryC0_uid234_exp10TabGen_q <= "0001001000111011110110000000000010000011";
                WHEN "0111001" =>  memoryC0_uid234_exp10TabGen_q <= "0001111111101001010011011111010101111111";
                WHEN "0111010" =>  memoryC0_uid234_exp10TabGen_q <= "0100110011010000010011011111100000000010";
                WHEN "0111011" =>  memoryC0_uid234_exp10TabGen_q <= "1001111100110101100011011011101011110001";
                WHEN "0111100" =>  memoryC0_uid234_exp10TabGen_q <= "0001110101101010010110001110111001100101";
                WHEN "0111101" =>  memoryC0_uid234_exp10TabGen_q <= "1100110111001100101010101000010011011101";
                WHEN "0111110" =>  memoryC0_uid234_exp10TabGen_q <= "1011011011000111010001100010101100110111";
                WHEN "0111111" =>  memoryC0_uid234_exp10TabGen_q <= "1101111011010001110100011111001111000001";
                WHEN "1000000" =>  memoryC0_uid234_exp10TabGen_q <= "0100110001110000111100000011010011100010";
                WHEN "1000001" =>  memoryC0_uid234_exp10TabGen_q <= "0000011000110110010110011001101110100101";
                WHEN "1000010" =>  memoryC0_uid234_exp10TabGen_q <= "0001001011000000111101110111001010100111";
                WHEN "1000011" =>  memoryC0_uid234_exp10TabGen_q <= "0111100010111100111111100001110111000101";
                WHEN "1000100" =>  memoryC0_uid234_exp10TabGen_q <= "0011111011100100000001111100101011111001";
                WHEN "1000101" =>  memoryC0_uid234_exp10TabGen_q <= "0110101111111101001011110101100011000111";
                WHEN "1000110" =>  memoryC0_uid234_exp10TabGen_q <= "0000011011011101001010110111001010110011";
                WHEN "1000111" =>  memoryC0_uid234_exp10TabGen_q <= "0001011001100110011010011110010000101001";
                WHEN "1001000" =>  memoryC0_uid234_exp10TabGen_q <= "1010000110001001001010110010001000110110";
                WHEN "1001001" =>  memoryC0_uid234_exp10TabGen_q <= "1010111101000011100111100000110010011010";
                WHEN "1001010" =>  memoryC0_uid234_exp10TabGen_q <= "0100011010100001111110111110011010001000";
                WHEN "1001011" =>  memoryC0_uid234_exp10TabGen_q <= "0110111010111110101001001000011110010111";
                WHEN "1001100" =>  memoryC0_uid234_exp10TabGen_q <= "0010111011000010001110101100010101001010";
                WHEN "1001101" =>  memoryC0_uid234_exp10TabGen_q <= "1000110111100011110000010001010110100101";
                WHEN "1001110" =>  memoryC0_uid234_exp10TabGen_q <= "1001001101101000101101100110101101000000";
                WHEN "1001111" =>  memoryC0_uid234_exp10TabGen_q <= "0100011010100101001100110100101101001110";
                WHEN "1010000" =>  memoryC0_uid234_exp10TabGen_q <= "1010111011111100000001110001111000000111";
                WHEN "1010001" =>  memoryC0_uid234_exp10TabGen_q <= "1101001111011110110101011011100111110000";
                WHEN "1010010" =>  memoryC0_uid234_exp10TabGen_q <= "1011110011001110001101010010101001110110";
                WHEN "1010011" =>  memoryC0_uid234_exp10TabGen_q <= "0111000101011001110010111011001001001100";
                WHEN "1010100" =>  memoryC0_uid234_exp10TabGen_q <= "1111100100100000011011100000101000010100";
                WHEN "1010101" =>  memoryC0_uid234_exp10TabGen_q <= "0101101111010000001111011101101110110110";
                WHEN "1010110" =>  memoryC0_uid234_exp10TabGen_q <= "1010000100100110110010000111101011110111";
                WHEN "1010111" =>  memoryC0_uid234_exp10TabGen_q <= "1101000011110001001001011101101110110011";
                WHEN "1011000" =>  memoryC0_uid234_exp10TabGen_q <= "1111001100001100000101111100011001001001";
                WHEN "1011001" =>  memoryC0_uid234_exp10TabGen_q <= "0000111101100100001010010100101010110000";
                WHEN "1011010" =>  memoryC0_uid234_exp10TabGen_q <= "0010110111110101110011100111001010101000";
                WHEN "1011011" =>  memoryC0_uid234_exp10TabGen_q <= "0101011011001101100001000011001110011011";
                WHEN "1011100" =>  memoryC0_uid234_exp10TabGen_q <= "1001001000000111111100001010000010010111";
                WHEN "1011101" =>  memoryC0_uid234_exp10TabGen_q <= "1110011111010010000000110101110011110001";
                WHEN "1011110" =>  memoryC0_uid234_exp10TabGen_q <= "0110000001101001000101100101000000010001";
                WHEN "1011111" =>  memoryC0_uid234_exp10TabGen_q <= "0000010000011011000011101001101011100110";
                WHEN "1100000" =>  memoryC0_uid234_exp10TabGen_q <= "1101101101000110011111011100111110000000";
                WHEN "1100001" =>  memoryC0_uid234_exp10TabGen_q <= "1110111001011010110000110110101101100101";
                WHEN "1100010" =>  memoryC0_uid234_exp10TabGen_q <= "0100010111011000001011101001010100011100";
                WHEN "1100011" =>  memoryC0_uid234_exp10TabGen_q <= "1110101001010000001000000001110101110001";
                WHEN "1100100" =>  memoryC0_uid234_exp10TabGen_q <= "1110010001100101001011001100010100000101";
                WHEN "1100101" =>  memoryC0_uid234_exp10TabGen_q <= "0011110011001011001111111100011010101110";
                WHEN "1100110" =>  memoryC0_uid234_exp10TabGen_q <= "1111110001000111101111011010011100101111";
                WHEN "1100111" =>  memoryC0_uid234_exp10TabGen_q <= "0010101110110001101001110100101011010100";
                WHEN "1101000" =>  memoryC0_uid234_exp10TabGen_q <= "1101001111110001101111010101000110000100";
                WHEN "1101001" =>  memoryC0_uid234_exp10TabGen_q <= "1111111000000010101000111011100111001100";
                WHEN "1101010" =>  memoryC0_uid234_exp10TabGen_q <= "1011001011110001000001011100101101111110";
                WHEN "1101011" =>  memoryC0_uid234_exp10TabGen_q <= "1111101111011011101110100100101001101011";
                WHEN "1101100" =>  memoryC0_uid234_exp10TabGen_q <= "1110000111110011111001111111000111000101";
                WHEN "1101101" =>  memoryC0_uid234_exp10TabGen_q <= "0110111001111101001010100011100011001011";
                WHEN "1101110" =>  memoryC0_uid234_exp10TabGen_q <= "1010101011001101101101100110000101000011";
                WHEN "1101111" =>  memoryC0_uid234_exp10TabGen_q <= "1010000001001110100000001101000001011001";
                WHEN "1110000" =>  memoryC0_uid234_exp10TabGen_q <= "0101100001111011011000101011001001111110";
                WHEN "1110001" =>  memoryC0_uid234_exp10TabGen_q <= "1101110011100011001111111110101011011010";
                WHEN "1110010" =>  memoryC0_uid234_exp10TabGen_q <= "0011011100101000001011010100111011101001";
                WHEN "1110011" =>  memoryC0_uid234_exp10TabGen_q <= "0111000011111111100101110010111011011000";
                WHEN "1110100" =>  memoryC0_uid234_exp10TabGen_q <= "1001010000110010011010000010101101001001";
                WHEN "1110101" =>  memoryC0_uid234_exp10TabGen_q <= "1010101010011101001100000101100100000010";
                WHEN "1110110" =>  memoryC0_uid234_exp10TabGen_q <= "1011111000110000010011001011001101000100";
                WHEN "1110111" =>  memoryC0_uid234_exp10TabGen_q <= "1101100011110000000011101101110101000101";
                WHEN "1111000" =>  memoryC0_uid234_exp10TabGen_q <= "0000010011110100111001010011001110000110";
                WHEN "1111001" =>  memoryC0_uid234_exp10TabGen_q <= "0100110001101011100000110010110110011110";
                WHEN "1111010" =>  memoryC0_uid234_exp10TabGen_q <= "1011100110010101000010100001000100001101";
                WHEN "1111011" =>  memoryC0_uid234_exp10TabGen_q <= "0101011011000111001100011111010111010111";
                WHEN "1111100" =>  memoryC0_uid234_exp10TabGen_q <= "0010111001101100011100110001110101101101";
                WHEN "1111101" =>  memoryC0_uid234_exp10TabGen_q <= "0100101100000100001011111001110010011111";
                WHEN "1111110" =>  memoryC0_uid234_exp10TabGen_q <= "1011011100100010110111010101100100101111";
                WHEN "1111111" =>  memoryC0_uid234_exp10TabGen_q <= "0111110101110010001100000101101110111100";
                WHEN OTHERS =>
                    memoryC0_uid234_exp10TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--os_uid236_exp10TabGen(BITJOIN,235)@38
    os_uid236_exp10TabGen_q <= memoryC0_uid235_exp10TabGen_q & memoryC0_uid234_exp10TabGen_q;

	--rndBit_uid275_exp10PolyEval(CONSTANT,274)
    rndBit_uid275_exp10PolyEval_q <= "001";

	--cIncludingRoundingBit_uid276_exp10PolyEval(BITJOIN,275)@38
    cIncludingRoundingBit_uid276_exp10PolyEval_q <= os_uid236_exp10TabGen_q & rndBit_uid275_exp10PolyEval_q;

	--reg_cIncludingRoundingBit_uid276_exp10PolyEval_0_to_ts5_uid277_exp10PolyEval_0(REG,413)@38
    reg_cIncludingRoundingBit_uid276_exp10PolyEval_0_to_ts5_uid277_exp10PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid276_exp10PolyEval_0_to_ts5_uid277_exp10PolyEval_0_q <= "0000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cIncludingRoundingBit_uid276_exp10PolyEval_0_to_ts5_uid277_exp10PolyEval_0_q <= cIncludingRoundingBit_uid276_exp10PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ts5_uid277_exp10PolyEval(ADD,276)@39
    ts5_uid277_exp10PolyEval_a <= STD_LOGIC_VECTOR((61 downto 61 => reg_cIncludingRoundingBit_uid276_exp10PolyEval_0_to_ts5_uid277_exp10PolyEval_0_q(60)) & reg_cIncludingRoundingBit_uid276_exp10PolyEval_0_to_ts5_uid277_exp10PolyEval_0_q);
    ts5_uid277_exp10PolyEval_b <= STD_LOGIC_VECTOR((61 downto 55 => reg_R_uid338_pT5_uid274_exp10PolyEval_0_to_ts5_uid277_exp10PolyEval_1_q(54)) & reg_R_uid338_pT5_uid274_exp10PolyEval_0_to_ts5_uid277_exp10PolyEval_1_q);
            ts5_uid277_exp10PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts5_uid277_exp10PolyEval_a) + SIGNED(ts5_uid277_exp10PolyEval_b));
    ts5_uid277_exp10PolyEval_q <= ts5_uid277_exp10PolyEval_o(61 downto 0);


	--s5_uid278_exp10PolyEval(BITSELECT,277)@39
    s5_uid278_exp10PolyEval_in <= ts5_uid277_exp10PolyEval_q;
    s5_uid278_exp10PolyEval_b <= s5_uid278_exp10PolyEval_in(61 downto 1);

	--peORExpInc_uid68_fpExpETest(BITSELECT,67)@39
    peORExpInc_uid68_fpExpETest_in <= s5_uid278_exp10PolyEval_b(58 downto 0);
    peORExpInc_uid68_fpExpETest_b <= peORExpInc_uid68_fpExpETest_in(58 downto 58);

	--reg_peORExpInc_uid68_fpExpETest_0_to_expRPostBiasPreExc_uid70_fpExpETest_1(REG,415)@39
    reg_peORExpInc_uid68_fpExpETest_0_to_expRPostBiasPreExc_uid70_fpExpETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_peORExpInc_uid68_fpExpETest_0_to_expRPostBiasPreExc_uid70_fpExpETest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_peORExpInc_uid68_fpExpETest_0_to_expRPostBiasPreExc_uid70_fpExpETest_1_q <= peORExpInc_uid68_fpExpETest_b;
            END IF;
        END IF;
    END PROCESS;


	--cstBias_uid8_fpExpETest(CONSTANT,7)
    cstBias_uid8_fpExpETest_q <= "01111111111";

	--ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_nor(LOGICAL,911)
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_nor_b <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_sticky_ena_q;
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_nor_q <= not (ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_nor_a or ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_nor_b);

	--ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_mem_top(CONSTANT,907)
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_mem_top_q <= "011011";

	--ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmp(LOGICAL,908)
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmp_a <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_mem_top_q;
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdmux_q);
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmp_q <= "1" when ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmp_a = ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmp_b else "0";

	--ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmpReg(REG,909)
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmpReg_q <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_sticky_ena(REG,912)
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_nor_q = "1") THEN
                ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_sticky_ena_q <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_enaAnd(LOGICAL,913)
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_enaAnd_a <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_sticky_ena_q;
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_enaAnd_b <= en;
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_enaAnd_q <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_enaAnd_a and ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_enaAnd_b;

	--reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0(REG,360)@8
    reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q <= "00000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q <= ePreRnd_uid46_fpExpETest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_inputreg(DELAY,901)
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 14, depth => 1 )
    PORT MAP ( xin => reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q, xout => ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt(COUNTER,903)
    -- every=1, low=0, high=27, step=1, init=1
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_i = 26 THEN
                      ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_i <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_i - 27;
                    ELSE
                        ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_i <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_i,5));


	--ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdreg(REG,904)
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdreg_q <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdmux(MUX,905)
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdmux_s <= en;
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdmux: PROCESS (ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdmux_s, ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdreg_q, ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdmux_q <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdmux_q <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem(DUALMEM,902)
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_ia <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_inputreg_q;
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_aa <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdreg_q;
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_ab <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_rdmux_q;
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 14,
        widthad_a => 5,
        numwords_a => 28,
        width_b => 14,
        widthad_b => 5,
        numwords_b => 28,
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
        clocken1 => ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_iq,
        address_a => ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_aa,
        data_a => ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_ia
    );
    ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_reset0 <= areset;
        ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_q <= ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_iq(13 downto 0);

	--expRPostBiasPreExc0_uid69_fpExpETest(ADD,68)@39
    expRPostBiasPreExc0_uid69_fpExpETest_a <= STD_LOGIC_VECTOR((15 downto 14 => ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_q(13)) & ld_reg_ePreRnd_uid46_fpExpETest_0_to_expRPostBiasPreExc0_uid69_fpExpETest_0_q_to_expRPostBiasPreExc0_uid69_fpExpETest_a_replace_mem_q);
    expRPostBiasPreExc0_uid69_fpExpETest_b <= STD_LOGIC_VECTOR('0' & "0000" & cstBias_uid8_fpExpETest_q);
    expRPostBiasPreExc0_uid69_fpExpETest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostBiasPreExc0_uid69_fpExpETest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expRPostBiasPreExc0_uid69_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(expRPostBiasPreExc0_uid69_fpExpETest_a) + SIGNED(expRPostBiasPreExc0_uid69_fpExpETest_b));
            END IF;
        END IF;
    END PROCESS;
    expRPostBiasPreExc0_uid69_fpExpETest_q <= expRPostBiasPreExc0_uid69_fpExpETest_o(14 downto 0);


	--expRPostBiasPreExc_uid70_fpExpETest(ADD,69)@40
    expRPostBiasPreExc_uid70_fpExpETest_a <= STD_LOGIC_VECTOR((16 downto 15 => expRPostBiasPreExc0_uid69_fpExpETest_q(14)) & expRPostBiasPreExc0_uid69_fpExpETest_q);
    expRPostBiasPreExc_uid70_fpExpETest_b <= STD_LOGIC_VECTOR('0' & "000000000000000" & reg_peORExpInc_uid68_fpExpETest_0_to_expRPostBiasPreExc_uid70_fpExpETest_1_q);
            expRPostBiasPreExc_uid70_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(expRPostBiasPreExc_uid70_fpExpETest_a) + SIGNED(expRPostBiasPreExc_uid70_fpExpETest_b));
    expRPostBiasPreExc_uid70_fpExpETest_q <= expRPostBiasPreExc_uid70_fpExpETest_o(15 downto 0);


	--expR_uid75_fpExpETest(BITSELECT,74)@40
    expR_uid75_fpExpETest_in <= expRPostBiasPreExc_uid70_fpExpETest_q(10 downto 0);
    expR_uid75_fpExpETest_b <= expR_uid75_fpExpETest_in(10 downto 0);

	--ld_expR_uid75_fpExpETest_b_to_expRPostExc_uid97_fpExpETest_d(DELAY,509)@40
    ld_expR_uid75_fpExpETest_b_to_expRPostExc_uid97_fpExpETest_d : dspba_delay
    GENERIC MAP ( width => 11, depth => 2 )
    PORT MAP ( xin => expR_uid75_fpExpETest_b, xout => ld_expR_uid75_fpExpETest_b_to_expRPostExc_uid97_fpExpETest_d_q, ena => en(0), clk => clk, aclr => areset );

	--cstZeroWE_uid11_fpExpETest(CONSTANT,10)
    cstZeroWE_uid11_fpExpETest_q <= "00000000000";

	--ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_nor(LOGICAL,1002)
    ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_nor_b <= ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_sticky_ena_q;
    ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_nor_q <= not (ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_nor_a or ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_nor_b);

	--ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_mem_top(CONSTANT,920)
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_mem_top_q <= "0100110";

	--ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmp(LOGICAL,921)
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmp_a <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_mem_top_q;
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdmux_q);
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmp_q <= "1" when ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmp_a = ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmp_b else "0";

	--ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmpReg(REG,922)
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmpReg_q <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_sticky_ena(REG,1003)
    ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_nor_q = "1") THEN
                ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_sticky_ena_q <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_enaAnd(LOGICAL,1004)
    ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_enaAnd_a <= ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_sticky_ena_q;
    ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_enaAnd_b <= en;
    ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_enaAnd_q <= ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_enaAnd_a and ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_enaAnd_b;

	--cstAllZWF_uid16_fpExpETest(CONSTANT,15)
    cstAllZWF_uid16_fpExpETest_q <= "0000000000000000000000000000000000000000000000000000";

	--fracXIsZero_uid23_fpExpETest(LOGICAL,22)@0
    fracXIsZero_uid23_fpExpETest_a <= frac_uid22_fpExpETest_b;
    fracXIsZero_uid23_fpExpETest_b <= cstAllZWF_uid16_fpExpETest_q;
    fracXIsZero_uid23_fpExpETest_q <= "1" when fracXIsZero_uid23_fpExpETest_a = fracXIsZero_uid23_fpExpETest_b else "0";

	--InvFracXIsZero_uid25_fpExpETest(LOGICAL,24)@0
    InvFracXIsZero_uid25_fpExpETest_a <= fracXIsZero_uid23_fpExpETest_q;
    InvFracXIsZero_uid25_fpExpETest_q <= not InvFracXIsZero_uid25_fpExpETest_a;

	--expXIsMax_uid21_fpExpETest(LOGICAL,20)@0
    expXIsMax_uid21_fpExpETest_a <= expX_uid6_fpExpETest_b;
    expXIsMax_uid21_fpExpETest_b <= cstAllOWE_uid15_fpExpETest_q;
    expXIsMax_uid21_fpExpETest_q <= "1" when expXIsMax_uid21_fpExpETest_a = expXIsMax_uid21_fpExpETest_b else "0";

	--exc_N_uid26_fpExpETest(LOGICAL,25)@0
    exc_N_uid26_fpExpETest_a <= expXIsMax_uid21_fpExpETest_q;
    exc_N_uid26_fpExpETest_b <= InvFracXIsZero_uid25_fpExpETest_q;
    exc_N_uid26_fpExpETest_q <= exc_N_uid26_fpExpETest_a and exc_N_uid26_fpExpETest_b;

	--ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_inputreg(DELAY,992)
    ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_N_uid26_fpExpETest_q, xout => ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt(COUNTER,916)
    -- every=1, low=0, high=38, step=1, init=1
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_i = 37 THEN
                      ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_eq = '1') THEN
                        ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_i <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_i - 38;
                    ELSE
                        ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_i <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_i,6));


	--ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdreg(REG,917)
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdreg_q <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdmux(MUX,918)
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdmux_s <= en;
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdmux: PROCESS (ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdmux_s, ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdreg_q, ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdmux_s IS
                  WHEN "0" => ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdmux_q <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdreg_q;
                  WHEN "1" => ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdmux_q <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem(DUALMEM,993)
    ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_ia <= ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_inputreg_q;
    ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_aa <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdreg_q;
    ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_ab <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdmux_q;
    ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 39,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 39,
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
        clocken1 => ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_iq,
        address_a => ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_aa,
        data_a => ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_ia
    );
    ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_reset0 <= areset;
        ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_q <= ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_iq(0 downto 0);

	--ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_nor(LOGICAL,989)
    ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_nor_b <= ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_sticky_ena_q;
    ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_nor_q <= not (ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_nor_a or ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_nor_b);

	--ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_mem_top(CONSTANT,933)
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_mem_top_q <= "0100101";

	--ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmp(LOGICAL,934)
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmp_a <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_mem_top_q;
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux_q);
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmp_q <= "1" when ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmp_a = ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmp_b else "0";

	--ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmpReg(REG,935)
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmpReg_q <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_sticky_ena(REG,990)
    ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_nor_q = "1") THEN
                ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_sticky_ena_q <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_enaAnd(LOGICAL,991)
    ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_enaAnd_a <= ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_sticky_ena_q;
    ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_enaAnd_b <= en;
    ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_enaAnd_q <= ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_enaAnd_a and ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_enaAnd_b;

	--ld_signX_uid7_fpExpETest_b_to_regXAndExpOverflowAndNeg_uid77_fpExpETest_c(DELAY,482)@0
    ld_signX_uid7_fpExpETest_b_to_regXAndExpOverflowAndNeg_uid77_fpExpETest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signX_uid7_fpExpETest_b, xout => ld_signX_uid7_fpExpETest_b_to_regXAndExpOverflowAndNeg_uid77_fpExpETest_c_q, ena => en(0), clk => clk, aclr => areset );

	--InvSignX_uid81_fpExpETest(LOGICAL,80)@1
    InvSignX_uid81_fpExpETest_a <= ld_signX_uid7_fpExpETest_b_to_regXAndExpOverflowAndNeg_uid77_fpExpETest_c_q;
    InvSignX_uid81_fpExpETest_q <= not InvSignX_uid81_fpExpETest_a;

	--expOvfInitial_uid41_fpExpETest(BITSELECT,40)@0
    expOvfInitial_uid41_fpExpETest_in <= shiftValuePreSat_uid40_fpExpETest_q;
    expOvfInitial_uid41_fpExpETest_b <= expOvfInitial_uid41_fpExpETest_in(11 downto 11);

	--reg_expOvfInitial_uid41_fpExpETest_0_to_regXAndExpOverflowAndNeg_uid77_fpExpETest_2(REG,417)@0
    reg_expOvfInitial_uid41_fpExpETest_0_to_regXAndExpOverflowAndNeg_uid77_fpExpETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expOvfInitial_uid41_fpExpETest_0_to_regXAndExpOverflowAndNeg_uid77_fpExpETest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expOvfInitial_uid41_fpExpETest_0_to_regXAndExpOverflowAndNeg_uid77_fpExpETest_2_q <= expOvfInitial_uid41_fpExpETest_b;
            END IF;
        END IF;
    END PROCESS;


	--InvExc_N_uid27_fpExpETest(LOGICAL,26)@0
    InvExc_N_uid27_fpExpETest_a <= exc_N_uid26_fpExpETest_q;
    InvExc_N_uid27_fpExpETest_q <= not InvExc_N_uid27_fpExpETest_a;

	--exc_I_uid24_fpExpETest(LOGICAL,23)@0
    exc_I_uid24_fpExpETest_a <= expXIsMax_uid21_fpExpETest_q;
    exc_I_uid24_fpExpETest_b <= fracXIsZero_uid23_fpExpETest_q;
    exc_I_uid24_fpExpETest_q <= exc_I_uid24_fpExpETest_a and exc_I_uid24_fpExpETest_b;

	--InvExc_I_uid28_fpExpETest(LOGICAL,27)@0
    InvExc_I_uid28_fpExpETest_a <= exc_I_uid24_fpExpETest_q;
    InvExc_I_uid28_fpExpETest_q <= not InvExc_I_uid28_fpExpETest_a;

	--expXIsZero_uid19_fpExpETest(LOGICAL,18)@0
    expXIsZero_uid19_fpExpETest_a <= expX_uid6_fpExpETest_b;
    expXIsZero_uid19_fpExpETest_b <= cstZeroWE_uid11_fpExpETest_q;
    expXIsZero_uid19_fpExpETest_q <= "1" when expXIsZero_uid19_fpExpETest_a = expXIsZero_uid19_fpExpETest_b else "0";

	--InvExpXIsZero_uid29_fpExpETest(LOGICAL,28)@0
    InvExpXIsZero_uid29_fpExpETest_a <= expXIsZero_uid19_fpExpETest_q;
    InvExpXIsZero_uid29_fpExpETest_q <= not InvExpXIsZero_uid29_fpExpETest_a;

	--exc_R_uid30_fpExpETest(LOGICAL,29)@0
    exc_R_uid30_fpExpETest_a <= InvExpXIsZero_uid29_fpExpETest_q;
    exc_R_uid30_fpExpETest_b <= InvExc_I_uid28_fpExpETest_q;
    exc_R_uid30_fpExpETest_c <= InvExc_N_uid27_fpExpETest_q;
    exc_R_uid30_fpExpETest_q_i <= exc_R_uid30_fpExpETest_a and exc_R_uid30_fpExpETest_b and exc_R_uid30_fpExpETest_c;
    exc_R_uid30_fpExpETest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => exc_R_uid30_fpExpETest_q, xin => exc_R_uid30_fpExpETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--regXAndExpOverflowAndPos_uid82_fpExpETest(LOGICAL,81)@1
    regXAndExpOverflowAndPos_uid82_fpExpETest_a <= exc_R_uid30_fpExpETest_q;
    regXAndExpOverflowAndPos_uid82_fpExpETest_b <= reg_expOvfInitial_uid41_fpExpETest_0_to_regXAndExpOverflowAndNeg_uid77_fpExpETest_2_q;
    regXAndExpOverflowAndPos_uid82_fpExpETest_c <= InvSignX_uid81_fpExpETest_q;
    regXAndExpOverflowAndPos_uid82_fpExpETest_q <= regXAndExpOverflowAndPos_uid82_fpExpETest_a and regXAndExpOverflowAndPos_uid82_fpExpETest_b and regXAndExpOverflowAndPos_uid82_fpExpETest_c;

	--ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_inputreg(DELAY,979)
    ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => regXAndExpOverflowAndPos_uid82_fpExpETest_q, xout => ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt(COUNTER,929)
    -- every=1, low=0, high=37, step=1, init=1
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_i = 36 THEN
                      ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_eq = '1') THEN
                        ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_i <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_i - 37;
                    ELSE
                        ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_i <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_i,6));


	--ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdreg(REG,930)
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdreg_q <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux(MUX,931)
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux_s <= en;
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux: PROCESS (ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux_s, ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdreg_q, ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux_s IS
                  WHEN "0" => ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux_q <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdreg_q;
                  WHEN "1" => ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux_q <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem(DUALMEM,980)
    ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_ia <= ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_inputreg_q;
    ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_aa <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdreg_q;
    ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_ab <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux_q;
    ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 38,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 38,
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
        clocken1 => ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_iq,
        address_a => ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_aa,
        data_a => ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_ia
    );
    ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_reset0 <= areset;
        ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_q <= ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_iq(0 downto 0);

	--ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_nor(LOGICAL,924)
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_nor_b <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_sticky_ena_q;
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_nor_q <= not (ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_nor_a or ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_nor_b);

	--ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_sticky_ena(REG,925)
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_nor_q = "1") THEN
                ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_sticky_ena_q <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_enaAnd(LOGICAL,926)
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_enaAnd_a <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_sticky_ena_q;
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_enaAnd_b <= en;
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_enaAnd_q <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_enaAnd_a and ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_enaAnd_b;

	--ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_inputreg(DELAY,914)
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expOvfInitial_uid41_fpExpETest_b, xout => ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem(DUALMEM,915)
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_ia <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_inputreg_q;
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_aa <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdreg_q;
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_ab <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdmux_q;
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 39,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 39,
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
        clocken1 => ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_iq,
        address_a => ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_aa,
        data_a => ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_ia
    );
    ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_reset0 <= areset;
        ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_q <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_iq(0 downto 0);

	--InvExpOvfInitial_uid78_fpExpETest(LOGICAL,77)@41
    InvExpOvfInitial_uid78_fpExpETest_a <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_mem_q;
    InvExpOvfInitial_uid78_fpExpETest_q <= not InvExpOvfInitial_uid78_fpExpETest_a;

	--reg_expRPostBiasPreExc_uid70_fpExpETest_0_to_expUdf_uid72_fpExpETest_1(REG,416)@40
    reg_expRPostBiasPreExc_uid70_fpExpETest_0_to_expUdf_uid72_fpExpETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPostBiasPreExc_uid70_fpExpETest_0_to_expUdf_uid72_fpExpETest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPostBiasPreExc_uid70_fpExpETest_0_to_expUdf_uid72_fpExpETest_1_q <= expRPostBiasPreExc_uid70_fpExpETest_q;
            END IF;
        END IF;
    END PROCESS;


	--expOvf_uid74_fpExpETest(COMPARE,73)@41
    expOvf_uid74_fpExpETest_cin <= GND_q;
    expOvf_uid74_fpExpETest_a <= STD_LOGIC_VECTOR((17 downto 16 => reg_expRPostBiasPreExc_uid70_fpExpETest_0_to_expUdf_uid72_fpExpETest_1_q(15)) & reg_expRPostBiasPreExc_uid70_fpExpETest_0_to_expUdf_uid72_fpExpETest_1_q) & '0';
    expOvf_uid74_fpExpETest_b <= STD_LOGIC_VECTOR('0' & "000000" & cstAllOWE_uid15_fpExpETest_q) & expOvf_uid74_fpExpETest_cin(0);
            expOvf_uid74_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid74_fpExpETest_a) - SIGNED(expOvf_uid74_fpExpETest_b));
    expOvf_uid74_fpExpETest_n(0) <= not expOvf_uid74_fpExpETest_o(18);


	--ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_nor(LOGICAL,937)
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_nor_b <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_sticky_ena_q;
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_nor_q <= not (ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_nor_a or ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_nor_b);

	--ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_sticky_ena(REG,938)
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_nor_q = "1") THEN
                ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_sticky_ena_q <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_enaAnd(LOGICAL,939)
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_enaAnd_a <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_sticky_ena_q;
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_enaAnd_b <= en;
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_enaAnd_q <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_enaAnd_a and ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_enaAnd_b;

	--ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_inputreg(DELAY,927)
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_R_uid30_fpExpETest_q, xout => ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem(DUALMEM,928)
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_ia <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_inputreg_q;
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_aa <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdreg_q;
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_ab <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux_q;
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 38,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 38,
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
        clocken1 => ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_iq,
        address_a => ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_aa,
        data_a => ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_ia
    );
    ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_reset0 <= areset;
        ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_q <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_iq(0 downto 0);

	--regInAndOvf_uid84_fpExpETest(LOGICAL,83)@41
    regInAndOvf_uid84_fpExpETest_a <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_q;
    regInAndOvf_uid84_fpExpETest_b <= expOvf_uid74_fpExpETest_n;
    regInAndOvf_uid84_fpExpETest_c <= InvExpOvfInitial_uid78_fpExpETest_q;
    regInAndOvf_uid84_fpExpETest_q <= regInAndOvf_uid84_fpExpETest_a and regInAndOvf_uid84_fpExpETest_b and regInAndOvf_uid84_fpExpETest_c;

	--ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_nor(LOGICAL,976)
    ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_nor_b <= ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_sticky_ena_q;
    ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_nor_q <= not (ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_nor_a or ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_nor_b);

	--ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_sticky_ena(REG,977)
    ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_nor_q = "1") THEN
                ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_sticky_ena_q <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_enaAnd(LOGICAL,978)
    ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_enaAnd_a <= ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_sticky_ena_q;
    ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_enaAnd_b <= en;
    ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_enaAnd_q <= ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_enaAnd_a and ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_enaAnd_b;

	--ld_exc_I_uid24_fpExpETest_q_to_posInf_uid86_fpExpETest_a(DELAY,497)@0
    ld_exc_I_uid24_fpExpETest_q_to_posInf_uid86_fpExpETest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_I_uid24_fpExpETest_q, xout => ld_exc_I_uid24_fpExpETest_q_to_posInf_uid86_fpExpETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--posInf_uid86_fpExpETest(LOGICAL,85)@1
    posInf_uid86_fpExpETest_a <= ld_exc_I_uid24_fpExpETest_q_to_posInf_uid86_fpExpETest_a_q;
    posInf_uid86_fpExpETest_b <= InvSignX_uid81_fpExpETest_q;
    posInf_uid86_fpExpETest_q <= posInf_uid86_fpExpETest_a and posInf_uid86_fpExpETest_b;

	--ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_inputreg(DELAY,966)
    ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => posInf_uid86_fpExpETest_q, xout => ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem(DUALMEM,967)
    ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_ia <= ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_inputreg_q;
    ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_aa <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdreg_q;
    ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_ab <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux_q;
    ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 38,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 38,
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
        clocken1 => ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_iq,
        address_a => ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_aa,
        data_a => ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_ia
    );
    ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_reset0 <= areset;
        ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_q <= ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_iq(0 downto 0);

	--excRInf_uid87_fpExpETest(LOGICAL,86)@41
    excRInf_uid87_fpExpETest_a <= ld_posInf_uid86_fpExpETest_q_to_excRInf_uid87_fpExpETest_a_replace_mem_q;
    excRInf_uid87_fpExpETest_b <= regInAndOvf_uid84_fpExpETest_q;
    excRInf_uid87_fpExpETest_c <= ld_regXAndExpOverflowAndPos_uid82_fpExpETest_q_to_excRInf_uid87_fpExpETest_c_replace_mem_q;
    excRInf_uid87_fpExpETest_q <= excRInf_uid87_fpExpETest_a or excRInf_uid87_fpExpETest_b or excRInf_uid87_fpExpETest_c;

	--ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_nor(LOGICAL,963)
    ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_nor_b <= ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_sticky_ena_q;
    ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_nor_q <= not (ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_nor_a or ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_nor_b);

	--ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_sticky_ena(REG,964)
    ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_nor_q = "1") THEN
                ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_sticky_ena_q <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_enaAnd(LOGICAL,965)
    ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_enaAnd_a <= ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_sticky_ena_q;
    ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_enaAnd_b <= en;
    ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_enaAnd_q <= ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_enaAnd_a and ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_enaAnd_b;

	--negInf_uid76_fpExpETest(LOGICAL,75)@0
    negInf_uid76_fpExpETest_a <= exc_I_uid24_fpExpETest_q;
    negInf_uid76_fpExpETest_b <= signX_uid7_fpExpETest_b;
    negInf_uid76_fpExpETest_q <= negInf_uid76_fpExpETest_a and negInf_uid76_fpExpETest_b;

	--ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_inputreg(DELAY,953)
    ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => negInf_uid76_fpExpETest_q, xout => ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem(DUALMEM,954)
    ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_ia <= ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_inputreg_q;
    ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_aa <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdreg_q;
    ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_ab <= ld_expOvfInitial_uid41_fpExpETest_b_to_InvExpOvfInitial_uid78_fpExpETest_a_replace_rdmux_q;
    ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 39,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 39,
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
        clocken1 => ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_iq,
        address_a => ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_aa,
        data_a => ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_ia
    );
    ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_reset0 <= areset;
        ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_q <= ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_iq(0 downto 0);

	--ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_nor(LOGICAL,950)
    ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_nor_a <= ld_shiftValuePreSatRed_uid43_fpExpETest_b_to_shiftVal_uid44_fpExpETest_c_notEnable_q;
    ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_nor_b <= ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_sticky_ena_q;
    ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_nor_q <= not (ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_nor_a or ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_nor_b);

	--ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_sticky_ena(REG,951)
    ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_nor_q = "1") THEN
                ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_sticky_ena_q <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_enaAnd(LOGICAL,952)
    ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_enaAnd_a <= ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_sticky_ena_q;
    ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_enaAnd_b <= en;
    ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_enaAnd_q <= ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_enaAnd_a and ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_enaAnd_b;

	--regXAndExpOverflowAndNeg_uid77_fpExpETest(LOGICAL,76)@1
    regXAndExpOverflowAndNeg_uid77_fpExpETest_a <= exc_R_uid30_fpExpETest_q;
    regXAndExpOverflowAndNeg_uid77_fpExpETest_b <= reg_expOvfInitial_uid41_fpExpETest_0_to_regXAndExpOverflowAndNeg_uid77_fpExpETest_2_q;
    regXAndExpOverflowAndNeg_uid77_fpExpETest_c <= ld_signX_uid7_fpExpETest_b_to_regXAndExpOverflowAndNeg_uid77_fpExpETest_c_q;
    regXAndExpOverflowAndNeg_uid77_fpExpETest_q <= regXAndExpOverflowAndNeg_uid77_fpExpETest_a and regXAndExpOverflowAndNeg_uid77_fpExpETest_b and regXAndExpOverflowAndNeg_uid77_fpExpETest_c;

	--ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_inputreg(DELAY,940)
    ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => regXAndExpOverflowAndNeg_uid77_fpExpETest_q, xout => ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem(DUALMEM,941)
    ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_ia <= ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_inputreg_q;
    ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_aa <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdreg_q;
    ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_ab <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_rdmux_q;
    ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 38,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 38,
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
        clocken1 => ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_iq,
        address_a => ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_aa,
        data_a => ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_ia
    );
    ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_reset0 <= areset;
        ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_q <= ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_iq(0 downto 0);

	--expUdf_uid72_fpExpETest(COMPARE,71)@41
    expUdf_uid72_fpExpETest_cin <= GND_q;
    expUdf_uid72_fpExpETest_a <= STD_LOGIC_VECTOR('0' & "0000000000000000" & GND_q) & '0';
    expUdf_uid72_fpExpETest_b <= STD_LOGIC_VECTOR((17 downto 16 => reg_expRPostBiasPreExc_uid70_fpExpETest_0_to_expUdf_uid72_fpExpETest_1_q(15)) & reg_expRPostBiasPreExc_uid70_fpExpETest_0_to_expUdf_uid72_fpExpETest_1_q) & expUdf_uid72_fpExpETest_cin(0);
            expUdf_uid72_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid72_fpExpETest_a) - SIGNED(expUdf_uid72_fpExpETest_b));
    expUdf_uid72_fpExpETest_n(0) <= not expUdf_uid72_fpExpETest_o(18);


	--regXAndUdf_uid79_fpExpETest(LOGICAL,78)@41
    regXAndUdf_uid79_fpExpETest_a <= ld_exc_R_uid30_fpExpETest_q_to_regXAndUdf_uid79_fpExpETest_a_replace_mem_q;
    regXAndUdf_uid79_fpExpETest_b <= expUdf_uid72_fpExpETest_n;
    regXAndUdf_uid79_fpExpETest_c <= InvExpOvfInitial_uid78_fpExpETest_q;
    regXAndUdf_uid79_fpExpETest_q <= regXAndUdf_uid79_fpExpETest_a and regXAndUdf_uid79_fpExpETest_b and regXAndUdf_uid79_fpExpETest_c;

	--excRZero_uid80_fpExpETest(LOGICAL,79)@41
    excRZero_uid80_fpExpETest_a <= regXAndUdf_uid79_fpExpETest_q;
    excRZero_uid80_fpExpETest_b <= ld_regXAndExpOverflowAndNeg_uid77_fpExpETest_q_to_excRZero_uid80_fpExpETest_b_replace_mem_q;
    excRZero_uid80_fpExpETest_c <= ld_negInf_uid76_fpExpETest_q_to_excRZero_uid80_fpExpETest_c_replace_mem_q;
    excRZero_uid80_fpExpETest_q <= excRZero_uid80_fpExpETest_a or excRZero_uid80_fpExpETest_b or excRZero_uid80_fpExpETest_c;

	--concExc_uid88_fpExpETest(BITJOIN,87)@41
    concExc_uid88_fpExpETest_q <= ld_exc_N_uid26_fpExpETest_q_to_concExc_uid88_fpExpETest_c_replace_mem_q & excRInf_uid87_fpExpETest_q & excRZero_uid80_fpExpETest_q;

	--reg_concExc_uid88_fpExpETest_0_to_excREnc_uid89_fpExpETest_0(REG,420)@41
    reg_concExc_uid88_fpExpETest_0_to_excREnc_uid89_fpExpETest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid88_fpExpETest_0_to_excREnc_uid89_fpExpETest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid88_fpExpETest_0_to_excREnc_uid89_fpExpETest_0_q <= concExc_uid88_fpExpETest_q;
            END IF;
        END IF;
    END PROCESS;


	--excREnc_uid89_fpExpETest(LOOKUP,88)@42
    excREnc_uid89_fpExpETest: PROCESS (reg_concExc_uid88_fpExpETest_0_to_excREnc_uid89_fpExpETest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_concExc_uid88_fpExpETest_0_to_excREnc_uid89_fpExpETest_0_q) IS
                WHEN "000" =>  excREnc_uid89_fpExpETest_q <= "01";
                WHEN "001" =>  excREnc_uid89_fpExpETest_q <= "00";
                WHEN "010" =>  excREnc_uid89_fpExpETest_q <= "10";
                WHEN "011" =>  excREnc_uid89_fpExpETest_q <= "00";
                WHEN "100" =>  excREnc_uid89_fpExpETest_q <= "11";
                WHEN "101" =>  excREnc_uid89_fpExpETest_q <= "00";
                WHEN "110" =>  excREnc_uid89_fpExpETest_q <= "00";
                WHEN "111" =>  excREnc_uid89_fpExpETest_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid89_fpExpETest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xIn(GPIN,3)@0

	--expRPostExc_uid97_fpExpETest(MUX,96)@42
    expRPostExc_uid97_fpExpETest_s <= excREnc_uid89_fpExpETest_q;
    expRPostExc_uid97_fpExpETest: PROCESS (expRPostExc_uid97_fpExpETest_s, en, cstZeroWE_uid11_fpExpETest_q, ld_expR_uid75_fpExpETest_b_to_expRPostExc_uid97_fpExpETest_d_q, cstAllOWE_uid15_fpExpETest_q, cstAllOWE_uid15_fpExpETest_q)
    BEGIN
            CASE expRPostExc_uid97_fpExpETest_s IS
                  WHEN "00" => expRPostExc_uid97_fpExpETest_q <= cstZeroWE_uid11_fpExpETest_q;
                  WHEN "01" => expRPostExc_uid97_fpExpETest_q <= ld_expR_uid75_fpExpETest_b_to_expRPostExc_uid97_fpExpETest_d_q;
                  WHEN "10" => expRPostExc_uid97_fpExpETest_q <= cstAllOWE_uid15_fpExpETest_q;
                  WHEN "11" => expRPostExc_uid97_fpExpETest_q <= cstAllOWE_uid15_fpExpETest_q;
                  WHEN OTHERS => expRPostExc_uid97_fpExpETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oneFracRPostExc2_uid90_fpExpETest(CONSTANT,89)
    oneFracRPostExc2_uid90_fpExpETest_q <= "0000000000000000000000000000000000000000000000000001";

	--peOR_uid67_fpExpETest(BITSELECT,66)@39
    peOR_uid67_fpExpETest_in <= s5_uid278_exp10PolyEval_b(57 downto 0);
    peOR_uid67_fpExpETest_b <= peOR_uid67_fpExpETest_in(57 downto 5);

	--fracR_uid71_fpExpETest(BITSELECT,70)@39
    fracR_uid71_fpExpETest_in <= peOR_uid67_fpExpETest_b(51 downto 0);
    fracR_uid71_fpExpETest_b <= fracR_uid71_fpExpETest_in(51 downto 0);

	--ld_fracR_uid71_fpExpETest_b_to_fracRPostExc_uid93_fpExpETest_d_inputreg(DELAY,1005)
    ld_fracR_uid71_fpExpETest_b_to_fracRPostExc_uid93_fpExpETest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1 )
    PORT MAP ( xin => fracR_uid71_fpExpETest_b, xout => ld_fracR_uid71_fpExpETest_b_to_fracRPostExc_uid93_fpExpETest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracR_uid71_fpExpETest_b_to_fracRPostExc_uid93_fpExpETest_d(DELAY,507)@39
    ld_fracR_uid71_fpExpETest_b_to_fracRPostExc_uid93_fpExpETest_d : dspba_delay
    GENERIC MAP ( width => 52, depth => 2 )
    PORT MAP ( xin => ld_fracR_uid71_fpExpETest_b_to_fracRPostExc_uid93_fpExpETest_d_inputreg_q, xout => ld_fracR_uid71_fpExpETest_b_to_fracRPostExc_uid93_fpExpETest_d_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid93_fpExpETest(MUX,92)@42
    fracRPostExc_uid93_fpExpETest_s <= excREnc_uid89_fpExpETest_q;
    fracRPostExc_uid93_fpExpETest: PROCESS (fracRPostExc_uid93_fpExpETest_s, en, cstAllZWF_uid16_fpExpETest_q, ld_fracR_uid71_fpExpETest_b_to_fracRPostExc_uid93_fpExpETest_d_q, cstAllZWF_uid16_fpExpETest_q, oneFracRPostExc2_uid90_fpExpETest_q)
    BEGIN
            CASE fracRPostExc_uid93_fpExpETest_s IS
                  WHEN "00" => fracRPostExc_uid93_fpExpETest_q <= cstAllZWF_uid16_fpExpETest_q;
                  WHEN "01" => fracRPostExc_uid93_fpExpETest_q <= ld_fracR_uid71_fpExpETest_b_to_fracRPostExc_uid93_fpExpETest_d_q;
                  WHEN "10" => fracRPostExc_uid93_fpExpETest_q <= cstAllZWF_uid16_fpExpETest_q;
                  WHEN "11" => fracRPostExc_uid93_fpExpETest_q <= oneFracRPostExc2_uid90_fpExpETest_q;
                  WHEN OTHERS => fracRPostExc_uid93_fpExpETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RExpE_uid98_fpExpETest(BITJOIN,97)@42
    RExpE_uid98_fpExpETest_q <= GND_q & expRPostExc_uid97_fpExpETest_q & fracRPostExc_uid93_fpExpETest_q;

	--xOut(GPOUT,4)@42
    q <= RExpE_uid98_fpExpETest_q;


end normal;
