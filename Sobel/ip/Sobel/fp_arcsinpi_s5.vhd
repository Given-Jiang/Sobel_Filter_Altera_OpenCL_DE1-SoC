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

-- VHDL created from fp_arcsinpi_s5
-- VHDL created on Thu Feb 28 17:21:04 2013


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

entity fp_arcsinpi_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_arcsinpi_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstBiasM2_uid6_fpArcsinPiTest_q : std_logic_vector (7 downto 0);
    signal ooPi_uid9_fpArcsinPiTest_q : std_logic_vector (23 downto 0);
    signal cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (22 downto 0);
    signal cstNaNWF_uid20_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (7 downto 0);
    signal cstBias_uid22_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (7 downto 0);
    signal cstBiasM1_uid23_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (7 downto 0);
    signal biasMwShift_uid50_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (7 downto 0);
    signal arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(10 downto 0);
    signal arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(10 downto 0);
    signal arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_o : std_logic_vector (10 downto 0);
    signal arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_cin : std_logic_vector (0 downto 0);
    signal arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_n : std_logic_vector (0 downto 0);
    signal shiftBias_uid52_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (7 downto 0);
    signal cst01pWShift_uid54_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (12 downto 0);
    signal mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_a : std_logic_vector (23 downto 0);
    signal mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (25 downto 0);
    signal mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_s1 : std_logic_vector (49 downto 0);
    signal mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_pr : UNSIGNED (49 downto 0);
    signal mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (49 downto 0);
    signal z2_uid93_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (1 downto 0);
    signal piO2_uid101_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (27 downto 0);
    signal fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (1 downto 0);
    signal fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (22 downto 0);
    signal expRCalc_uid117_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (1 downto 0);
    signal expRCalc_uid117_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (7 downto 0);
    signal outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(1 downto 0);
    signal InvExcRNaN_uid124_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid124_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(8 downto 0);
    signal expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(8 downto 0);
    signal expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_o : std_logic_vector (8 downto 0);
    signal expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (8 downto 0);
    signal biasInc_uid169_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (9 downto 0);
    signal expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(11 downto 0);
    signal expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(11 downto 0);
    signal expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_o : std_logic_vector (11 downto 0);
    signal expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (10 downto 0);
    signal prod_uid171_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector (23 downto 0);
    signal prod_uid171_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (23 downto 0);
    signal prod_uid171_rAsinPi_uid13_fpArcsinPiTest_s1 : std_logic_vector (47 downto 0);
    signal prod_uid171_rAsinPi_uid13_fpArcsinPiTest_pr : UNSIGNED (47 downto 0);
    signal prod_uid171_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (47 downto 0);
    signal roundBitDetectionConstant_uid186_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (2 downto 0);
    signal ZeroTimesInf_uid212_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid212_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid212_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx1Pad4_uid230_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage0Idx3Pad12_uid236_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (11 downto 0);
    signal leftShiftStage1Idx3Pad3_uid247_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (2 downto 0);
    signal zs_uid269_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (31 downto 0);
    signal zs_uid276_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (15 downto 0);
    signal maxCountVal_uid312_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (5 downto 0);
    signal vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (0 downto 0);
    signal vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (5 downto 0);
    signal expXIsMax_uid327_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid327_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid327_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid335_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid335_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (0 downto 0);
    signal expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (7 downto 0);
    signal negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0Idx3Pad24_uid379_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx3Pad6_uid390_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (5 downto 0);
    signal prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_a : std_logic_vector (11 downto 0);
    signal prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_b : std_logic_vector (11 downto 0);
    signal prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_pr : SIGNED (24 downto 0);
    signal prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_q : std_logic_vector (23 downto 0);
    signal prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a : std_logic_vector (17 downto 0);
    signal prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_b : std_logic_vector (20 downto 0);
    signal prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_pr : SIGNED (39 downto 0);
    signal prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_q : std_logic_vector (38 downto 0);
    signal prodXY_uid438_pT1_uid404_arcsinXPolyEval_a : std_logic_vector (12 downto 0);
    signal prodXY_uid438_pT1_uid404_arcsinXPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXY_uid438_pT1_uid404_arcsinXPolyEval_s1 : std_logic_vector (25 downto 0);
    signal prodXY_uid438_pT1_uid404_arcsinXPolyEval_pr : SIGNED (26 downto 0);
    signal prodXY_uid438_pT1_uid404_arcsinXPolyEval_q : std_logic_vector (25 downto 0);
    signal prodXY_uid441_pT2_uid410_arcsinXPolyEval_a : std_logic_vector (16 downto 0);
    signal prodXY_uid441_pT2_uid410_arcsinXPolyEval_b : std_logic_vector (24 downto 0);
    signal prodXY_uid441_pT2_uid410_arcsinXPolyEval_s1 : std_logic_vector (41 downto 0);
    signal prodXY_uid441_pT2_uid410_arcsinXPolyEval_pr : SIGNED (42 downto 0);
    signal prodXY_uid441_pT2_uid410_arcsinXPolyEval_q : std_logic_vector (41 downto 0);
    signal prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_a : std_logic_vector (11 downto 0);
    signal prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_pr : SIGNED (24 downto 0);
    signal prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_q : std_logic_vector (23 downto 0);
    signal prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_a : std_logic_vector (15 downto 0);
    signal prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_b : std_logic_vector (22 downto 0);
    signal prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_pr : SIGNED (39 downto 0);
    signal prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_q : std_logic_vector (38 downto 0);
    signal memoryC0_uid253_arcsinXO2XTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid253_arcsinXO2XTabGen_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid253_arcsinXO2XTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid253_arcsinXO2XTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid253_arcsinXO2XTabGen_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid253_arcsinXO2XTabGen_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid254_arcsinXO2XTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid254_arcsinXO2XTabGen_lutmem_ia : std_logic_vector (18 downto 0);
    signal memoryC1_uid254_arcsinXO2XTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid254_arcsinXO2XTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid254_arcsinXO2XTabGen_lutmem_iq : std_logic_vector (18 downto 0);
    signal memoryC1_uid254_arcsinXO2XTabGen_lutmem_q : std_logic_vector (18 downto 0);
    signal memoryC2_uid255_arcsinXO2XTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid255_arcsinXO2XTabGen_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid255_arcsinXO2XTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid255_arcsinXO2XTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid255_arcsinXO2XTabGen_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid255_arcsinXO2XTabGen_lutmem_q : std_logic_vector (11 downto 0);
    signal memoryC0_uid400_arcsinXTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid400_arcsinXTabGen_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid400_arcsinXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid400_arcsinXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid400_arcsinXTabGen_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid400_arcsinXTabGen_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid401_arcsinXTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid401_arcsinXTabGen_lutmem_ia : std_logic_vector (22 downto 0);
    signal memoryC1_uid401_arcsinXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid401_arcsinXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid401_arcsinXTabGen_lutmem_iq : std_logic_vector (22 downto 0);
    signal memoryC1_uid401_arcsinXTabGen_lutmem_q : std_logic_vector (22 downto 0);
    signal memoryC2_uid402_arcsinXTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid402_arcsinXTabGen_lutmem_ia : std_logic_vector (12 downto 0);
    signal memoryC2_uid402_arcsinXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid402_arcsinXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid402_arcsinXTabGen_lutmem_iq : std_logic_vector (12 downto 0);
    signal memoryC2_uid402_arcsinXTabGen_lutmem_q : std_logic_vector (12 downto 0);
    signal memoryC0_uid422_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC0_uid422_sqrtTableGenerator_lutmem_ia : std_logic_vector (28 downto 0);
    signal memoryC0_uid422_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid422_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid422_sqrtTableGenerator_lutmem_iq : std_logic_vector (28 downto 0);
    signal memoryC0_uid422_sqrtTableGenerator_lutmem_q : std_logic_vector (28 downto 0);
    signal memoryC1_uid423_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC1_uid423_sqrtTableGenerator_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid423_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid423_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid423_sqrtTableGenerator_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid423_sqrtTableGenerator_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid424_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC2_uid424_sqrtTableGenerator_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid424_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid424_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid424_sqrtTableGenerator_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid424_sqrtTableGenerator_lutmem_q : std_logic_vector (11 downto 0);
    signal reg_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_0_to_outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_0_q : std_logic_vector (2 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid250_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_2_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage1Idx1_uid243_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_3_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage1Idx2_uid246_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_4_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage1Idx3_uid249_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_5_q : std_logic_vector (36 downto 0);
    signal reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid255_arcsinXO2XTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid255_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_1_q : std_logic_vector (11 downto 0);
    signal reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q : std_logic_vector (17 downto 0);
    signal reg_s1_uid258_uid261_arcsinXO2XPolyEval_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_1_q : std_logic_vector (20 downto 0);
    signal reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_q : std_logic_vector (23 downto 0);
    signal reg_fxpArcSinXO2XRes_uid66_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_1_q : std_logic_vector (25 downto 0);
    signal reg_rVStage_uid270_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q : std_logic_vector (31 downto 0);
    signal reg_l_uid80_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q : std_logic_vector (34 downto 0);
    signal reg_cStage_uid274_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q : std_logic_vector (34 downto 0);
    signal reg_rVStage_uid277_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q : std_logic_vector (15 downto 0);
    signal reg_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q : std_logic_vector (34 downto 0);
    signal reg_cStage_uid281_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q : std_logic_vector (34 downto 0);
    signal reg_rVStage_uid291_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q : std_logic_vector (3 downto 0);
    signal reg_vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q : std_logic_vector (34 downto 0);
    signal reg_cStage_uid295_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q : std_logic_vector (34 downto 0);
    signal reg_vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q : std_logic_vector (5 downto 0);
    signal reg_fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_0_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_0_q : std_logic_vector (22 downto 0);
    signal reg_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_1_q : std_logic_vector (22 downto 0);
    signal reg_fracSelIn_uid358_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_q : std_logic_vector (3 downto 0);
    signal reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid424_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid425_sqrtPolynomialEvaluator_0_to_prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid424_sqrtTableGenerator_lutmem_0_to_prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_1_q : std_logic_vector (11 downto 0);
    signal reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_q : std_logic_vector (15 downto 0);
    signal reg_s1_uid427_uid430_sqrtPolynomialEvaluator_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_1_q : std_logic_vector (22 downto 0);
    signal reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_q : std_logic_vector (7 downto 0);
    signal reg_SqrtFPL30dto23_uid88_asinX_uid8_fpArcsinPiTest_0_to_srVal_uid89_asinX_uid8_fpArcsinPiTest_1_q : std_logic_vector (7 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid392_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_2_q : std_logic_vector (25 downto 0);
    signal reg_rightShiftStage1Idx1_uid385_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_3_q : std_logic_vector (25 downto 0);
    signal reg_rightShiftStage1Idx2_uid388_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_4_q : std_logic_vector (25 downto 0);
    signal reg_rightShiftStage1Idx3_uid391_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_5_q : std_logic_vector (25 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid397_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid402_arcsinXTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid403_arcsinXPolyEval_0_to_prodXY_uid438_pT1_uid404_arcsinXPolyEval_0_q : std_logic_vector (12 downto 0);
    signal reg_memoryC2_uid402_arcsinXTabGen_lutmem_0_to_prodXY_uid438_pT1_uid404_arcsinXPolyEval_1_q : std_logic_vector (12 downto 0);
    signal reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q : std_logic_vector (16 downto 0);
    signal reg_s1_uid405_uid408_arcsinXPolyEval_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_1_q : std_logic_vector (24 downto 0);
    signal reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_fxpArcsinX_uid100_asinX_uid8_fpArcsinPiTest_0_to_path3Diff_uid102_asinX_uid8_fpArcsinPiTest_1_q : std_logic_vector (27 downto 0);
    signal reg_expFracConc_uid108_uid108_asinX_uid8_fpArcsinPiTest_0_to_expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_0_q : std_logic_vector (31 downto 0);
    signal reg_singX_uid17_asinX_uid8_fpArcsinPiTest_0_to_signR_uid125_asinX_uid8_fpArcsinPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_expFracPreRound_uid189_rAsinPi_uid13_fpArcsinPiTest_0_to_expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_0_q : std_logic_vector (34 downto 0);
    signal reg_roundBitAndNormalizationOp_uid191_rAsinPi_uid13_fpArcsinPiTest_0_to_expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_1_q : std_logic_vector (25 downto 0);
    signal reg_expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_0_to_expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_1_q : std_logic_vector (11 downto 0);
    signal reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_0_to_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_0_to_excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_0_q : std_logic_vector (2 downto 0);
    signal reg_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_0_to_fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_3_q : std_logic_vector (22 downto 0);
    signal reg_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_0_to_expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_3_q : std_logic_vector (7 downto 0);
    signal ld_reg_fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_0_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_0_q_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_a_q : std_logic_vector (22 downto 0);
    signal ld_SqrtFPL22dto0_uid90_asinX_uid8_fpArcsinPiTest_b_to_oSqrtFPLFrac_uid91_asinX_uid8_fpArcsinPiTest_a_q : std_logic_vector (22 downto 0);
    signal ld_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q_to_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_a_q : std_logic_vector (25 downto 0);
    signal ld_expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_q_to_expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_a_q : std_logic_vector (8 downto 0);
    signal ld_reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_1_q_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_q_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_q_to_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_q_to_concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid196_rAsinPi_uid13_fpArcsinPiTest_q_to_signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_q_to_R_uid227_rAsinPi_uid13_fpArcsinPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_f_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_c_q : std_logic_vector (5 downto 0);
    signal ld_expOddSelect_uid344_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_q : std_logic_vector (22 downto 0);
    signal ld_signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_join_uid357_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_q : std_logic_vector (1 downto 0);
    signal ld_negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid401_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid401_arcsinXTabGen_lutmem_a_q : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid423_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid423_sqrtTableGenerator_lutmem_a_q : std_logic_vector (7 downto 0);
    signal ld_yT1_uid256_arcsinXO2XPolyEval_b_to_reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0_a_q : std_logic_vector (11 downto 0);
    signal ld_yAddr_uid63_asinX_uid8_fpArcsinPiTest_b_to_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_q_to_reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_1_a_q : std_logic_vector (0 downto 0);
    signal ld_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_b_to_reg_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_0_to_fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_3_a_q : std_logic_vector (22 downto 0);
    signal ld_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_b_to_reg_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_0_to_expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_3_a_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_sticky_ena_q : signal is true;
    signal ld_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q_to_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_a_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_eq : std_logic;
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_sticky_ena_q : signal is true;
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_reset0 : std_logic;
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_eq : std_logic;
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_sticky_ena_q : signal is true;
    signal ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_reset0 : std_logic;
    signal ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_sticky_ena_q : signal is true;
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_reset0 : std_logic;
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_sticky_ena_q : signal is true;
    signal ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_reset0 : std_logic;
    signal ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_sticky_ena_q : signal is true;
    signal ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_sticky_ena_q : signal is true;
    signal ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_reset0 : std_logic;
    signal ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_sticky_ena_q : signal is true;
    signal ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_reset0 : std_logic;
    signal ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_sticky_ena_q : signal is true;
    signal ld_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_sticky_ena_q : signal is true;
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_ia : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_iq : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_q : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_sticky_ena_q : signal is true;
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_ia : std_logic_vector (16 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_iq : std_logic_vector (16 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_q : std_logic_vector (16 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_sticky_ena_q : signal is true;
    signal ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_sticky_ena_q : signal is true;
    signal ld_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid401_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid401_arcsinXTabGen_lutmem_a_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid423_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid423_sqrtTableGenerator_lutmem_a_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_yT1_uid256_arcsinXO2XPolyEval_b_to_reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0_a_inputreg_q : std_logic_vector (11 downto 0);
    signal ld_yAddr_uid63_asinX_uid8_fpArcsinPiTest_b_to_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_reset0 : std_logic;
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_eq : std_logic;
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_sticky_ena_q : signal is true;
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_inputreg_q : std_logic_vector (15 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_reset0 : std_logic;
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_ia : std_logic_vector (15 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_iq : std_logic_vector (15 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_q : std_logic_vector (15 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_sticky_ena_q : signal is true;
    signal ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_sticky_ena_q : signal is true;
    signal pad_o_uid25_uid78_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (35 downto 0);
    signal excSelBits_uid120_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (2 downto 0);
    signal expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(14 downto 0);
    signal expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(14 downto 0);
    signal expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_o : std_logic_vector (14 downto 0);
    signal expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_cin : std_logic_vector (0 downto 0);
    signal expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_n : std_logic_vector (0 downto 0);
    signal expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(14 downto 0);
    signal expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(14 downto 0);
    signal expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_o : std_logic_vector (14 downto 0);
    signal expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_cin : std_logic_vector (0 downto 0);
    signal expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_n : std_logic_vector (0 downto 0);
    signal vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(8 downto 0);
    signal vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(8 downto 0);
    signal vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_o : std_logic_vector (8 downto 0);
    signal vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_cin : std_logic_vector (0 downto 0);
    signal vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_c : std_logic_vector (0 downto 0);
    signal expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(32 downto 0);
    signal expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(32 downto 0);
    signal expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_o : std_logic_vector (32 downto 0);
    signal expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (32 downto 0);
    signal InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal oSqrtFPLFrac_uid91_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (23 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal expX_uid15_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (30 downto 0);
    signal expX_uid15_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid16_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid16_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (22 downto 0);
    signal singX_uid17_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (31 downto 0);
    signal singX_uid17_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (0 downto 0);
    signal expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid33_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid33_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid33_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid35_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid35_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid35_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid36_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid36_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid36_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal expGT0_uid44_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(10 downto 0);
    signal expGT0_uid44_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(10 downto 0);
    signal expGT0_uid44_asinX_uid8_fpArcsinPiTest_o : std_logic_vector (10 downto 0);
    signal expGT0_uid44_asinX_uid8_fpArcsinPiTest_cin : std_logic_vector (0 downto 0);
    signal expGT0_uid44_asinX_uid8_fpArcsinPiTest_c : std_logic_vector (0 downto 0);
    signal expEQ0_uid45_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(7 downto 0);
    signal expEQ0_uid45_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(7 downto 0);
    signal expEQ0_uid45_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal shiftValue_uid53_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(8 downto 0);
    signal shiftValue_uid53_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(8 downto 0);
    signal shiftValue_uid53_asinX_uid8_fpArcsinPiTest_o : std_logic_vector (8 downto 0);
    signal shiftValue_uid53_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (8 downto 0);
    signal expL_uid82_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(8 downto 0);
    signal expL_uid82_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(8 downto 0);
    signal expL_uid82_asinX_uid8_fpArcsinPiTest_o : std_logic_vector (8 downto 0);
    signal expL_uid82_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (8 downto 0);
    signal srVal_uid89_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(8 downto 0);
    signal srVal_uid89_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(8 downto 0);
    signal srVal_uid89_asinX_uid8_fpArcsinPiTest_o : std_logic_vector (8 downto 0);
    signal srVal_uid89_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (8 downto 0);
    signal path3Diff_uid102_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(28 downto 0);
    signal path3Diff_uid102_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(28 downto 0);
    signal path3Diff_uid102_asinX_uid8_fpArcsinPiTest_o : std_logic_vector (28 downto 0);
    signal path3Diff_uid102_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (28 downto 0);
    signal fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid122_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid122_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid123_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid123_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (7 downto 0);
    signal signR_uid125_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal signR_uid125_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal signR_uid125_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(36 downto 0);
    signal expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(36 downto 0);
    signal expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_o : std_logic_vector (36 downto 0);
    signal expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (35 downto 0);
    signal excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_c : std_logic_vector(0 downto 0);
    signal excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_c : std_logic_vector(0 downto 0);
    signal excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_d : std_logic_vector(0 downto 0);
    signal excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_c : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_c : std_logic_vector(0 downto 0);
    signal excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_d : std_logic_vector(0 downto 0);
    signal excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (7 downto 0);
    signal leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (36 downto 0);
    signal vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (34 downto 0);
    signal fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid330_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid330_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid330_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(8 downto 0);
    signal expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(8 downto 0);
    signal expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_o : std_logic_vector (8 downto 0);
    signal expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (8 downto 0);
    signal expOddSig_uid341_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(8 downto 0);
    signal expOddSig_uid341_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(8 downto 0);
    signal expOddSig_uid341_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_o : std_logic_vector (8 downto 0);
    signal expOddSig_uid341_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (8 downto 0);
    signal inInfAndNotNeg_uid353_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid353_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid353_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal minInf_uid355_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal minInf_uid355_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal minInf_uid355_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(1 downto 0);
    signal expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (7 downto 0);
    signal rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (25 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal fracOOPi_uid10_fpArcsinPiTest_in : std_logic_vector (22 downto 0);
    signal fracOOPi_uid10_fpArcsinPiTest_b : std_logic_vector (22 downto 0);
    signal normBitPath2_uid68_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (49 downto 0);
    signal normBitPath2_uid68_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (0 downto 0);
    signal fracRPath2High_uid69_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (48 downto 0);
    signal fracRPath2High_uid69_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (23 downto 0);
    signal fracRPath2Low_uid70_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (47 downto 0);
    signal fracRPath2Low_uid70_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (23 downto 0);
    signal oSqrtFPLFracZ2_uid94_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (25 downto 0);
    signal piO2OutRange_uid114_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (26 downto 0);
    signal piO2OutRange_uid114_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (22 downto 0);
    signal normalizeBit_uid172_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (47 downto 0);
    signal normalizeBit_uid172_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (0 downto 0);
    signal fracRPostNormHigh_uid174_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (46 downto 0);
    signal fracRPostNormHigh_uid174_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (23 downto 0);
    signal fracRPostNormLow_uid175_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (45 downto 0);
    signal fracRPostNormLow_uid175_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (23 downto 0);
    signal stickyRange_uid177_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (21 downto 0);
    signal stickyRange_uid177_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (21 downto 0);
    signal Prod22_uid178_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (22 downto 0);
    signal Prod22_uid178_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (0 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmp_a : std_logic_vector(2 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmp_b : std_logic_vector(2 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal prodXYTruncFR_uid417_pT1_uid257_arcsinXO2XPolyEval_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid417_pT1_uid257_arcsinXO2XPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid420_pT2_uid263_arcsinXO2XPolyEval_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid420_pT2_uid263_arcsinXO2XPolyEval_b : std_logic_vector (21 downto 0);
    signal prodXYTruncFR_uid439_pT1_uid404_arcsinXPolyEval_in : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid439_pT1_uid404_arcsinXPolyEval_b : std_logic_vector (13 downto 0);
    signal prodXYTruncFR_uid442_pT2_uid410_arcsinXPolyEval_in : std_logic_vector (41 downto 0);
    signal prodXYTruncFR_uid442_pT2_uid410_arcsinXPolyEval_b : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid445_pT1_uid426_sqrtPolynomialEvaluator_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid445_pT1_uid426_sqrtPolynomialEvaluator_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid448_pT2_uid432_sqrtPolynomialEvaluator_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid448_pT2_uid432_sqrtPolynomialEvaluator_b : std_logic_vector (23 downto 0);
    signal mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (17 downto 0);
    signal mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (16 downto 0);
    signal concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (2 downto 0);
    signal R_uid227_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (31 downto 0);
    signal FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (15 downto 0);
    signal FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (15 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmp_a : std_logic_vector(5 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmp_b : std_logic_vector(5 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_nor_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_nor_q : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_nor_q : std_logic_vector(0 downto 0);
    signal R_uid126_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (31 downto 0);
    signal ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal fracRPath3_uid110_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (23 downto 0);
    signal fracRPath3_uid110_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (22 downto 0);
    signal expRPath3_uid111_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (31 downto 0);
    signal expRPath3_uid111_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (7 downto 0);
    signal oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (23 downto 0);
    signal InvExpXIsZero_uid41_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid41_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid37_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid37_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid40_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid40_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal exp0FracNotZero_uid47_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal exp0FracNotZero_uid47_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal exp0FracNotZero_uid47_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal fxpShifterBits_uid56_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (3 downto 0);
    signal fxpShifterBits_uid56_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (3 downto 0);
    signal expLRange_uid84_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (7 downto 0);
    signal expLRange_uid84_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (7 downto 0);
    signal srValRange_uid92_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (4 downto 0);
    signal srValRange_uid92_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (4 downto 0);
    signal normBitPath3Diff_uid103_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (27 downto 0);
    signal normBitPath3Diff_uid103_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (0 downto 0);
    signal path3DiffHigh_uid104_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (26 downto 0);
    signal path3DiffHigh_uid104_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (23 downto 0);
    signal path3DiffLow_uid105_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (25 downto 0);
    signal path3DiffLow_uid105_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (23 downto 0);
    signal fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (23 downto 0);
    signal fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (22 downto 0);
    signal expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (35 downto 0);
    signal expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (11 downto 0);
    signal InvExcRNaN_uid225_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid225_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal arcsinIsMax_uid58_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (36 downto 0);
    signal arcsinIsMax_uid58_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (0 downto 0);
    signal y_uid59_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (35 downto 0);
    signal y_uid59_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (34 downto 0);
    signal rVStage_uid277_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid277_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid280_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (18 downto 0);
    signal vStage_uid280_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (18 downto 0);
    signal rVStage_uid284_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid284_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid287_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (26 downto 0);
    signal vStage_uid287_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (26 downto 0);
    signal rVStage_uid298_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid298_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid301_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (32 downto 0);
    signal vStage_uid301_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (32 downto 0);
    signal InvFracXIsZero_uid331_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid331_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid334_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid334_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal expREven_uid339_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (8 downto 0);
    signal expREven_uid339_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (7 downto 0);
    signal expROdd_uid342_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (8 downto 0);
    signal expROdd_uid342_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (7 downto 0);
    signal RightShiftStage125dto1_uid394_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (25 downto 0);
    signal RightShiftStage125dto1_uid394_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (24 downto 0);
    signal fpOOPi_uid11_fpArcsinPiTest_q : std_logic_vector (31 downto 0);
    signal fracRPath2Pre_uid71_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPath2Pre_uid71_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (23 downto 0);
    signal add_normUpdate_uid72_fracRPath2PreUlp_uid72_uid72_uid73_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (24 downto 0);
    signal X25dto8_uid372_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (25 downto 0);
    signal X25dto8_uid372_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (17 downto 0);
    signal X25dto16_uid375_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (25 downto 0);
    signal X25dto16_uid375_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (9 downto 0);
    signal X25dto24_uid378_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (25 downto 0);
    signal X25dto24_uid378_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (1 downto 0);
    signal fracRPostNorm_uid176_rAsinPi_uid13_fpArcsinPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPostNorm_uid176_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (23 downto 0);
    signal extraStickyBit_uid179_rAsinPi_uid13_fpArcsinPiTest_s : std_logic_vector (0 downto 0);
    signal extraStickyBit_uid179_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (0 downto 0);
    signal stickyExtendedRange_uid180_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (22 downto 0);
    signal lowRangeB_uid258_arcsinXO2XPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid258_arcsinXO2XPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid259_arcsinXO2XPolyEval_in : std_logic_vector (12 downto 0);
    signal highBBits_uid259_arcsinXO2XPolyEval_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid264_arcsinXO2XPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid264_arcsinXO2XPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid265_arcsinXO2XPolyEval_in : std_logic_vector (21 downto 0);
    signal highBBits_uid265_arcsinXO2XPolyEval_b : std_logic_vector (19 downto 0);
    signal lowRangeB_uid405_arcsinXPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid405_arcsinXPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid406_arcsinXPolyEval_in : std_logic_vector (13 downto 0);
    signal highBBits_uid406_arcsinXPolyEval_b : std_logic_vector (12 downto 0);
    signal lowRangeB_uid411_arcsinXPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid411_arcsinXPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid412_arcsinXPolyEval_in : std_logic_vector (25 downto 0);
    signal highBBits_uid412_arcsinXPolyEval_b : std_logic_vector (23 downto 0);
    signal lowRangeB_uid427_sqrtPolynomialEvaluator_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid427_sqrtPolynomialEvaluator_b : std_logic_vector (0 downto 0);
    signal highBBits_uid428_sqrtPolynomialEvaluator_in : std_logic_vector (12 downto 0);
    signal highBBits_uid428_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid433_sqrtPolynomialEvaluator_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid433_sqrtPolynomialEvaluator_b : std_logic_vector (1 downto 0);
    signal highBBits_uid434_sqrtPolynomialEvaluator_in : std_logic_vector (23 downto 0);
    signal highBBits_uid434_sqrtPolynomialEvaluator_b : std_logic_vector (21 downto 0);
    signal yT1_uid403_arcsinXPolyEval_in : std_logic_vector (16 downto 0);
    signal yT1_uid403_arcsinXPolyEval_b : std_logic_vector (12 downto 0);
    signal yT1_uid425_sqrtPolynomialEvaluator_in : std_logic_vector (15 downto 0);
    signal yT1_uid425_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal expX_uid128_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (30 downto 0);
    signal expX_uid128_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (7 downto 0);
    signal signX_uid130_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (31 downto 0);
    signal signX_uid130_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (0 downto 0);
    signal fracX_uid132_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid132_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (22 downto 0);
    signal oFracXExt_uid55_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (36 downto 0);
    signal exc_N_uid38_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid38_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid38_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal inputOutOfRange_uid48_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal inputOutOfRange_uid48_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal inputOutOfRange_uid48_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStageSel3Dto2_uid239_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid239_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid250_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid250_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (1 downto 0);
    signal fpL_uid85_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (31 downto 0);
    signal rightShiftStageSel4Dto3_uid381_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid381_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid392_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid392_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid397_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid397_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (0 downto 0);
    signal fracRPath3_uid106_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPath3_uid106_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (23 downto 0);
    signal expRPath3_uid107_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (0 downto 0);
    signal expRPath3_uid107_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (7 downto 0);
    signal expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (7 downto 0);
    signal expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (7 downto 0);
    signal signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal Y34_uid60_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (34 downto 0);
    signal Y34_uid60_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (0 downto 0);
    signal yAddr_uid63_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (34 downto 0);
    signal yAddr_uid63_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (7 downto 0);
    signal yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (26 downto 0);
    signal yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (17 downto 0);
    signal oMy_uid78_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(36 downto 0);
    signal oMy_uid78_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(36 downto 0);
    signal oMy_uid78_asinX_uid8_fpArcsinPiTest_o : std_logic_vector (36 downto 0);
    signal oMy_uid78_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (36 downto 0);
    signal cStage_uid281_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid288_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid299_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid299_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid299_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid302_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (34 downto 0);
    signal exc_N_uid332_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid332_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid332_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1_uid396_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (25 downto 0);
    signal expY_uid129_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (30 downto 0);
    signal expY_uid129_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (7 downto 0);
    signal signY_uid131_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (31 downto 0);
    signal signY_uid131_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (0 downto 0);
    signal fracY_uid134_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (22 downto 0);
    signal fracY_uid134_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (22 downto 0);
    signal expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (31 downto 0);
    signal expFracRPath2PostRnd_uid75_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(32 downto 0);
    signal expFracRPath2PostRnd_uid75_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(32 downto 0);
    signal expFracRPath2PostRnd_uid75_asinX_uid8_fpArcsinPiTest_o : std_logic_vector (32 downto 0);
    signal expFracRPath2PostRnd_uid75_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (32 downto 0);
    signal rightShiftStage0Idx1_uid374_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (25 downto 0);
    signal rightShiftStage0Idx2_uid377_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (25 downto 0);
    signal rightShiftStage0Idx3_uid380_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (25 downto 0);
    signal FracRPostNorm1dto0_uid184_rAsinPi_uid13_fpArcsinPiTest_in : std_logic_vector (1 downto 0);
    signal FracRPostNorm1dto0_uid184_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector (1 downto 0);
    signal expFracPreRound_uid189_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (34 downto 0);
    signal stickyRangeComparator_uid182_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(22 downto 0);
    signal stickyRangeComparator_uid182_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(22 downto 0);
    signal stickyRangeComparator_uid182_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal sumAHighB_uid260_arcsinXO2XPolyEval_a : std_logic_vector(19 downto 0);
    signal sumAHighB_uid260_arcsinXO2XPolyEval_b : std_logic_vector(19 downto 0);
    signal sumAHighB_uid260_arcsinXO2XPolyEval_o : std_logic_vector (19 downto 0);
    signal sumAHighB_uid260_arcsinXO2XPolyEval_q : std_logic_vector (19 downto 0);
    signal sumAHighB_uid266_arcsinXO2XPolyEval_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid266_arcsinXO2XPolyEval_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid266_arcsinXO2XPolyEval_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid266_arcsinXO2XPolyEval_q : std_logic_vector (30 downto 0);
    signal sumAHighB_uid407_arcsinXPolyEval_a : std_logic_vector(23 downto 0);
    signal sumAHighB_uid407_arcsinXPolyEval_b : std_logic_vector(23 downto 0);
    signal sumAHighB_uid407_arcsinXPolyEval_o : std_logic_vector (23 downto 0);
    signal sumAHighB_uid407_arcsinXPolyEval_q : std_logic_vector (23 downto 0);
    signal sumAHighB_uid413_arcsinXPolyEval_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid413_arcsinXPolyEval_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid413_arcsinXPolyEval_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid413_arcsinXPolyEval_q : std_logic_vector (30 downto 0);
    signal sumAHighB_uid429_sqrtPolynomialEvaluator_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid429_sqrtPolynomialEvaluator_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid429_sqrtPolynomialEvaluator_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid429_sqrtPolynomialEvaluator_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid435_sqrtPolynomialEvaluator_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid435_sqrtPolynomialEvaluator_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid435_sqrtPolynomialEvaluator_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid435_sqrtPolynomialEvaluator_q : std_logic_vector (29 downto 0);
    signal expXIsZero_uid140_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid140_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid140_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid142_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid142_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid142_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal signR_uid196_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal signR_uid196_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal signR_uid196_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal add_one_fracX_uid132_uid133_uid133_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (23 downto 0);
    signal fracXIsZero_uid144_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid144_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid144_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal X32dto0_uid231_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (32 downto 0);
    signal X32dto0_uid231_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (32 downto 0);
    signal X28dto0_uid234_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (28 downto 0);
    signal X28dto0_uid234_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (28 downto 0);
    signal X24dto0_uid237_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (24 downto 0);
    signal X24dto0_uid237_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (24 downto 0);
    signal InvExc_N_uid39_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid39_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (30 downto 0);
    signal expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (22 downto 0);
    signal signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (31 downto 0);
    signal signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (0 downto 0);
    signal rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (25 downto 0);
    signal expFracConc_uid108_uid108_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (31 downto 0);
    signal path2_uid61_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal path2_uid61_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal yT1_uid256_arcsinXO2XPolyEval_in : std_logic_vector (17 downto 0);
    signal yT1_uid256_arcsinXO2XPolyEval_b : std_logic_vector (11 downto 0);
    signal l_uid80_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (34 downto 0);
    signal l_uid80_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (34 downto 0);
    signal vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (34 downto 0);
    signal vStagei_uid303_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid303_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (34 downto 0);
    signal InvExc_N_uid333_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid333_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (0 downto 0);
    signal rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (25 downto 0);
    signal expXIsZero_uid156_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid156_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid156_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid158_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid158_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid158_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal add_one_fracY_uid134_uid135_uid135_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (23 downto 0);
    signal fracXIsZero_uid160_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid160_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid160_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (23 downto 0);
    signal fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (22 downto 0);
    signal expRPath2_uid77_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (31 downto 0);
    signal expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (7 downto 0);
    signal sticky_uid183_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal sticky_uid183_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal s1_uid258_uid261_arcsinXO2XPolyEval_q : std_logic_vector (20 downto 0);
    signal s2_uid264_uid267_arcsinXO2XPolyEval_q : std_logic_vector (32 downto 0);
    signal s1_uid405_uid408_arcsinXPolyEval_q : std_logic_vector (24 downto 0);
    signal s2_uid411_uid414_arcsinXPolyEval_q : std_logic_vector (32 downto 0);
    signal s1_uid427_uid430_sqrtPolynomialEvaluator_q : std_logic_vector (22 downto 0);
    signal s2_uid433_uid436_sqrtPolynomialEvaluator_q : std_logic_vector (31 downto 0);
    signal InvExpXIsZero_uid150_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid150_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid145_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid145_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid145_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid146_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid146_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx1_uid232_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0Idx2_uid235_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0Idx3_uid238_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (36 downto 0);
    signal exc_R_uid42_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid42_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid42_asinX_uid8_fpArcsinPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid42_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal expX0_uid343_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (0 downto 0);
    signal expX0_uid343_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (0 downto 0);
    signal fracXAddr_uid347_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (22 downto 0);
    signal fracXAddr_uid347_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (6 downto 0);
    signal RightShiftStage025dto2_uid383_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (25 downto 0);
    signal RightShiftStage025dto2_uid383_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (23 downto 0);
    signal RightShiftStage025dto4_uid386_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (25 downto 0);
    signal RightShiftStage025dto4_uid386_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (21 downto 0);
    signal RightShiftStage025dto6_uid389_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (25 downto 0);
    signal RightShiftStage025dto6_uid389_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (19 downto 0);
    signal pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (2 downto 0);
    signal rVStage_uid270_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid270_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid273_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (2 downto 0);
    signal vStage_uid273_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (2 downto 0);
    signal rVStage_uid291_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid291_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid294_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (30 downto 0);
    signal vStage_uid294_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (30 downto 0);
    signal rVStage_uid305_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid305_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (0 downto 0);
    signal vStage_uid308_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (33 downto 0);
    signal vStage_uid308_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (33 downto 0);
    signal exc_R_uid336_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid336_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid336_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid336_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal mAddr_uid97_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (25 downto 0);
    signal mAddr_uid97_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (7 downto 0);
    signal InvExpXIsZero_uid166_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid166_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid210_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid210_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid210_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid161_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid161_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid161_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid162_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid162_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal lrs_uid185_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (2 downto 0);
    signal fxpArcSinXO2XRes_uid66_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (30 downto 0);
    signal fxpArcSinXO2XRes_uid66_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (25 downto 0);
    signal fxpArcsinX_uid100_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (30 downto 0);
    signal fxpArcsinX_uid100_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (27 downto 0);
    signal fracR_uid351_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (28 downto 0);
    signal fracR_uid351_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (22 downto 0);
    signal InvExc_I_uid149_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid149_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (36 downto 0);
    signal xRegInOutOfRange_uid118_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal xRegInOutOfRange_uid118_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal xRegInOutOfRange_uid118_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal expOddSelect_uid344_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal expOddSelect_uid344_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (7 downto 0);
    signal rightShiftStage1Idx1_uid385_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (25 downto 0);
    signal rightShiftStage1Idx2_uid388_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (25 downto 0);
    signal rightShiftStage1Idx3_uid391_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (25 downto 0);
    signal cStage_uid274_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (34 downto 0);
    signal cStage_uid295_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid306_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid306_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid306_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid309_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (34 downto 0);
    signal minReg_uid354_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal minReg_uid354_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal minReg_uid354_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid165_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid165_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid211_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid211_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid211_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal roundBitDetectionPattern_uid187_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(2 downto 0);
    signal roundBitDetectionPattern_uid187_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(2 downto 0);
    signal roundBitDetectionPattern_uid187_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (22 downto 0);
    signal InvExc_N_uid148_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid148_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal LeftShiftStage035dto0_uid242_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (35 downto 0);
    signal LeftShiftStage035dto0_uid242_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (35 downto 0);
    signal LeftShiftStage034dto0_uid245_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (34 downto 0);
    signal LeftShiftStage034dto0_uid245_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (34 downto 0);
    signal LeftShiftStage033dto0_uid248_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (33 downto 0);
    signal LeftShiftStage033dto0_uid248_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (33 downto 0);
    signal excRNaN_uid119_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid119_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid119_asinX_uid8_fpArcsinPiTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid310_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid310_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (5 downto 0);
    signal excRNaN_uid356_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid356_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid356_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid356_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid164_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid164_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal roundBit_uid188_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal roundBit_uid188_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (31 downto 0);
    signal exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage1Idx1_uid243_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage1Idx2_uid246_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage1Idx3_uid249_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (36 downto 0);
    signal fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (33 downto 0);
    signal fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (22 downto 0);
    signal join_uid357_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (2 downto 0);
    signal exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal roundBitAndNormalizationOp_uid191_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector (25 downto 0);
    signal SqrtFPL30dto23_uid88_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (30 downto 0);
    signal SqrtFPL30dto23_uid88_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (7 downto 0);
    signal SqrtFPL22dto0_uid90_asinX_uid8_fpArcsinPiTest_in : std_logic_vector (22 downto 0);
    signal SqrtFPL22dto0_uid90_asinX_uid8_fpArcsinPiTest_b : std_logic_vector (22 downto 0);
    signal excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal fracSelIn_uid358_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q : std_logic_vector (3 downto 0);
    signal excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest_a : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest_b : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest_q : std_logic_vector(0 downto 0);
begin


	--xIn(GPIN,3)@0

	--cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest(CONSTANT,18)
    cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q <= "00000000000000000000000";

	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable(LOGICAL,1059)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_a <= en;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q <= not ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_a;

	--ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_nor(LOGICAL,1162)
    ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_nor_b <= ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_sticky_ena_q;
    ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_nor_q <= not (ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_nor_a or ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_nor_b);

	--ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_mem_top(CONSTANT,1082)
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_mem_top_q <= "011110";

	--ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmp(LOGICAL,1083)
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmp_a <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_mem_top_q;
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdmux_q);
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmp_q <= "1" when ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmp_a = ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmp_b else "0";

	--ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmpReg(REG,1084)
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmpReg_q <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_sticky_ena(REG,1163)
    ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_nor_q = "1") THEN
                ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_sticky_ena_q <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_enaAnd(LOGICAL,1164)
    ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_enaAnd_a <= ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_sticky_ena_q;
    ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_enaAnd_b <= en;
    ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_enaAnd_q <= ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_enaAnd_a and ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_enaAnd_b;

	--fracX_uid16_asinX_uid8_fpArcsinPiTest(BITSELECT,15)@0
    fracX_uid16_asinX_uid8_fpArcsinPiTest_in <= a(22 downto 0);
    fracX_uid16_asinX_uid8_fpArcsinPiTest_b <= fracX_uid16_asinX_uid8_fpArcsinPiTest_in(22 downto 0);

	--fracXIsZero_uid35_asinX_uid8_fpArcsinPiTest(LOGICAL,34)@0
    fracXIsZero_uid35_asinX_uid8_fpArcsinPiTest_a <= fracX_uid16_asinX_uid8_fpArcsinPiTest_b;
    fracXIsZero_uid35_asinX_uid8_fpArcsinPiTest_b <= cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q;
    fracXIsZero_uid35_asinX_uid8_fpArcsinPiTest_q <= "1" when fracXIsZero_uid35_asinX_uid8_fpArcsinPiTest_a = fracXIsZero_uid35_asinX_uid8_fpArcsinPiTest_b else "0";

	--InvFracXIsZero_uid37_asinX_uid8_fpArcsinPiTest(LOGICAL,36)@0
    InvFracXIsZero_uid37_asinX_uid8_fpArcsinPiTest_a <= fracXIsZero_uid35_asinX_uid8_fpArcsinPiTest_q;
    InvFracXIsZero_uid37_asinX_uid8_fpArcsinPiTest_q <= not InvFracXIsZero_uid37_asinX_uid8_fpArcsinPiTest_a;

	--cstBias_uid22_asinX_uid8_fpArcsinPiTest(CONSTANT,21)
    cstBias_uid22_asinX_uid8_fpArcsinPiTest_q <= "01111111";

	--expX_uid15_asinX_uid8_fpArcsinPiTest(BITSELECT,14)@0
    expX_uid15_asinX_uid8_fpArcsinPiTest_in <= a(30 downto 0);
    expX_uid15_asinX_uid8_fpArcsinPiTest_b <= expX_uid15_asinX_uid8_fpArcsinPiTest_in(30 downto 23);

	--expEQ0_uid45_asinX_uid8_fpArcsinPiTest(LOGICAL,44)@0
    expEQ0_uid45_asinX_uid8_fpArcsinPiTest_a <= expX_uid15_asinX_uid8_fpArcsinPiTest_b;
    expEQ0_uid45_asinX_uid8_fpArcsinPiTest_b <= cstBias_uid22_asinX_uid8_fpArcsinPiTest_q;
    expEQ0_uid45_asinX_uid8_fpArcsinPiTest_q <= "1" when expEQ0_uid45_asinX_uid8_fpArcsinPiTest_a = expEQ0_uid45_asinX_uid8_fpArcsinPiTest_b else "0";

	--exp0FracNotZero_uid47_asinX_uid8_fpArcsinPiTest(LOGICAL,46)@0
    exp0FracNotZero_uid47_asinX_uid8_fpArcsinPiTest_a <= expEQ0_uid45_asinX_uid8_fpArcsinPiTest_q;
    exp0FracNotZero_uid47_asinX_uid8_fpArcsinPiTest_b <= InvFracXIsZero_uid37_asinX_uid8_fpArcsinPiTest_q;
    exp0FracNotZero_uid47_asinX_uid8_fpArcsinPiTest_q <= exp0FracNotZero_uid47_asinX_uid8_fpArcsinPiTest_a and exp0FracNotZero_uid47_asinX_uid8_fpArcsinPiTest_b;

	--GND(CONSTANT,0)
    GND_q <= "0";

	--expGT0_uid44_asinX_uid8_fpArcsinPiTest(COMPARE,43)@0
    expGT0_uid44_asinX_uid8_fpArcsinPiTest_cin <= GND_q;
    expGT0_uid44_asinX_uid8_fpArcsinPiTest_a <= STD_LOGIC_VECTOR("00" & cstBias_uid22_asinX_uid8_fpArcsinPiTest_q) & '0';
    expGT0_uid44_asinX_uid8_fpArcsinPiTest_b <= STD_LOGIC_VECTOR("00" & expX_uid15_asinX_uid8_fpArcsinPiTest_b) & expGT0_uid44_asinX_uid8_fpArcsinPiTest_cin(0);
            expGT0_uid44_asinX_uid8_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expGT0_uid44_asinX_uid8_fpArcsinPiTest_a) - UNSIGNED(expGT0_uid44_asinX_uid8_fpArcsinPiTest_b));
    expGT0_uid44_asinX_uid8_fpArcsinPiTest_c(0) <= expGT0_uid44_asinX_uid8_fpArcsinPiTest_o(10);


	--inputOutOfRange_uid48_asinX_uid8_fpArcsinPiTest(LOGICAL,47)@0
    inputOutOfRange_uid48_asinX_uid8_fpArcsinPiTest_a <= expGT0_uid44_asinX_uid8_fpArcsinPiTest_c;
    inputOutOfRange_uid48_asinX_uid8_fpArcsinPiTest_b <= exp0FracNotZero_uid47_asinX_uid8_fpArcsinPiTest_q;
    inputOutOfRange_uid48_asinX_uid8_fpArcsinPiTest_q <= inputOutOfRange_uid48_asinX_uid8_fpArcsinPiTest_a or inputOutOfRange_uid48_asinX_uid8_fpArcsinPiTest_b;

	--InvExc_N_uid39_asinX_uid8_fpArcsinPiTest(LOGICAL,38)@0
    InvExc_N_uid39_asinX_uid8_fpArcsinPiTest_a <= exc_N_uid38_asinX_uid8_fpArcsinPiTest_q;
    InvExc_N_uid39_asinX_uid8_fpArcsinPiTest_q <= not InvExc_N_uid39_asinX_uid8_fpArcsinPiTest_a;

	--InvExc_I_uid40_asinX_uid8_fpArcsinPiTest(LOGICAL,39)@0
    InvExc_I_uid40_asinX_uid8_fpArcsinPiTest_a <= exc_I_uid36_asinX_uid8_fpArcsinPiTest_q;
    InvExc_I_uid40_asinX_uid8_fpArcsinPiTest_q <= not InvExc_I_uid40_asinX_uid8_fpArcsinPiTest_a;

	--cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest(CONSTANT,20)
    cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q <= "00000000";

	--expXIsZero_uid31_asinX_uid8_fpArcsinPiTest(LOGICAL,30)@0
    expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_a <= expX_uid15_asinX_uid8_fpArcsinPiTest_b;
    expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_b <= cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q;
    expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q <= "1" when expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_a = expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_b else "0";

	--InvExpXIsZero_uid41_asinX_uid8_fpArcsinPiTest(LOGICAL,40)@0
    InvExpXIsZero_uid41_asinX_uid8_fpArcsinPiTest_a <= expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q;
    InvExpXIsZero_uid41_asinX_uid8_fpArcsinPiTest_q <= not InvExpXIsZero_uid41_asinX_uid8_fpArcsinPiTest_a;

	--exc_R_uid42_asinX_uid8_fpArcsinPiTest(LOGICAL,41)@0
    exc_R_uid42_asinX_uid8_fpArcsinPiTest_a <= InvExpXIsZero_uid41_asinX_uid8_fpArcsinPiTest_q;
    exc_R_uid42_asinX_uid8_fpArcsinPiTest_b <= InvExc_I_uid40_asinX_uid8_fpArcsinPiTest_q;
    exc_R_uid42_asinX_uid8_fpArcsinPiTest_c <= InvExc_N_uid39_asinX_uid8_fpArcsinPiTest_q;
    exc_R_uid42_asinX_uid8_fpArcsinPiTest_q <= exc_R_uid42_asinX_uid8_fpArcsinPiTest_a and exc_R_uid42_asinX_uid8_fpArcsinPiTest_b and exc_R_uid42_asinX_uid8_fpArcsinPiTest_c;

	--xRegInOutOfRange_uid118_asinX_uid8_fpArcsinPiTest(LOGICAL,117)@0
    xRegInOutOfRange_uid118_asinX_uid8_fpArcsinPiTest_a <= exc_R_uid42_asinX_uid8_fpArcsinPiTest_q;
    xRegInOutOfRange_uid118_asinX_uid8_fpArcsinPiTest_b <= inputOutOfRange_uid48_asinX_uid8_fpArcsinPiTest_q;
    xRegInOutOfRange_uid118_asinX_uid8_fpArcsinPiTest_q <= xRegInOutOfRange_uid118_asinX_uid8_fpArcsinPiTest_a and xRegInOutOfRange_uid118_asinX_uid8_fpArcsinPiTest_b;

	--cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest(CONSTANT,17)
    cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q <= "11111111";

	--expXIsMax_uid33_asinX_uid8_fpArcsinPiTest(LOGICAL,32)@0
    expXIsMax_uid33_asinX_uid8_fpArcsinPiTest_a <= expX_uid15_asinX_uid8_fpArcsinPiTest_b;
    expXIsMax_uid33_asinX_uid8_fpArcsinPiTest_b <= cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q;
    expXIsMax_uid33_asinX_uid8_fpArcsinPiTest_q <= "1" when expXIsMax_uid33_asinX_uid8_fpArcsinPiTest_a = expXIsMax_uid33_asinX_uid8_fpArcsinPiTest_b else "0";

	--exc_I_uid36_asinX_uid8_fpArcsinPiTest(LOGICAL,35)@0
    exc_I_uid36_asinX_uid8_fpArcsinPiTest_a <= expXIsMax_uid33_asinX_uid8_fpArcsinPiTest_q;
    exc_I_uid36_asinX_uid8_fpArcsinPiTest_b <= fracXIsZero_uid35_asinX_uid8_fpArcsinPiTest_q;
    exc_I_uid36_asinX_uid8_fpArcsinPiTest_q <= exc_I_uid36_asinX_uid8_fpArcsinPiTest_a and exc_I_uid36_asinX_uid8_fpArcsinPiTest_b;

	--exc_N_uid38_asinX_uid8_fpArcsinPiTest(LOGICAL,37)@0
    exc_N_uid38_asinX_uid8_fpArcsinPiTest_a <= expXIsMax_uid33_asinX_uid8_fpArcsinPiTest_q;
    exc_N_uid38_asinX_uid8_fpArcsinPiTest_b <= InvFracXIsZero_uid37_asinX_uid8_fpArcsinPiTest_q;
    exc_N_uid38_asinX_uid8_fpArcsinPiTest_q <= exc_N_uid38_asinX_uid8_fpArcsinPiTest_a and exc_N_uid38_asinX_uid8_fpArcsinPiTest_b;

	--excRNaN_uid119_asinX_uid8_fpArcsinPiTest(LOGICAL,118)@0
    excRNaN_uid119_asinX_uid8_fpArcsinPiTest_a <= exc_N_uid38_asinX_uid8_fpArcsinPiTest_q;
    excRNaN_uid119_asinX_uid8_fpArcsinPiTest_b <= exc_I_uid36_asinX_uid8_fpArcsinPiTest_q;
    excRNaN_uid119_asinX_uid8_fpArcsinPiTest_c <= xRegInOutOfRange_uid118_asinX_uid8_fpArcsinPiTest_q;
    excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q <= excRNaN_uid119_asinX_uid8_fpArcsinPiTest_a or excRNaN_uid119_asinX_uid8_fpArcsinPiTest_b or excRNaN_uid119_asinX_uid8_fpArcsinPiTest_c;

	--InvExcRNaN_uid124_asinX_uid8_fpArcsinPiTest(LOGICAL,123)@0
    InvExcRNaN_uid124_asinX_uid8_fpArcsinPiTest_a <= excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q;
    InvExcRNaN_uid124_asinX_uid8_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExcRNaN_uid124_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExcRNaN_uid124_asinX_uid8_fpArcsinPiTest_q <= not InvExcRNaN_uid124_asinX_uid8_fpArcsinPiTest_a;
        END IF;
    END PROCESS;



	--singX_uid17_asinX_uid8_fpArcsinPiTest(BITSELECT,16)@0
    singX_uid17_asinX_uid8_fpArcsinPiTest_in <= a;
    singX_uid17_asinX_uid8_fpArcsinPiTest_b <= singX_uid17_asinX_uid8_fpArcsinPiTest_in(31 downto 31);

	--reg_singX_uid17_asinX_uid8_fpArcsinPiTest_0_to_signR_uid125_asinX_uid8_fpArcsinPiTest_1(REG,512)@0
    reg_singX_uid17_asinX_uid8_fpArcsinPiTest_0_to_signR_uid125_asinX_uid8_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_singX_uid17_asinX_uid8_fpArcsinPiTest_0_to_signR_uid125_asinX_uid8_fpArcsinPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_singX_uid17_asinX_uid8_fpArcsinPiTest_0_to_signR_uid125_asinX_uid8_fpArcsinPiTest_1_q <= singX_uid17_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--signR_uid125_asinX_uid8_fpArcsinPiTest(LOGICAL,124)@1
    signR_uid125_asinX_uid8_fpArcsinPiTest_a <= reg_singX_uid17_asinX_uid8_fpArcsinPiTest_0_to_signR_uid125_asinX_uid8_fpArcsinPiTest_1_q;
    signR_uid125_asinX_uid8_fpArcsinPiTest_b <= InvExcRNaN_uid124_asinX_uid8_fpArcsinPiTest_q;
    signR_uid125_asinX_uid8_fpArcsinPiTest_q <= signR_uid125_asinX_uid8_fpArcsinPiTest_a and signR_uid125_asinX_uid8_fpArcsinPiTest_b;

	--ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt(COUNTER,1078)
    -- every=1, low=0, high=30, step=1, init=1
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_i = 29 THEN
                      ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_eq = '1') THEN
                        ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_i <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_i - 30;
                    ELSE
                        ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_i <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_i,5));


	--ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdreg(REG,1079)
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdreg_q <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdmux(MUX,1080)
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdmux_s <= en;
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdmux: PROCESS (ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdmux_s, ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdreg_q, ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdmux_q <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdreg_q;
                  WHEN "1" => ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdmux_q <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem(DUALMEM,1153)
    ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_reset0 <= areset;
    ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_ia <= signR_uid125_asinX_uid8_fpArcsinPiTest_q;
    ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_aa <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdreg_q;
    ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_ab <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdmux_q;
    ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 31,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 31,
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
        clocken1 => ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_iq,
        address_a => ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_aa,
        data_a => ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_ia
    );
        ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_q <= ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_iq(0 downto 0);

	--cstBiasM1_uid23_asinX_uid8_fpArcsinPiTest(CONSTANT,22)
    cstBiasM1_uid23_asinX_uid8_fpArcsinPiTest_q <= "01111110";

	--RightShiftStage125dto1_uid394_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITSELECT,393)@19
    RightShiftStage125dto1_uid394_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in <= rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q;
    RightShiftStage125dto1_uid394_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b <= RightShiftStage125dto1_uid394_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in(25 downto 1);

	--rightShiftStage2Idx1_uid396_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITJOIN,395)@19
    rightShiftStage2Idx1_uid396_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= GND_q & RightShiftStage125dto1_uid394_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b;

	--rightShiftStage1Idx3Pad6_uid390_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(CONSTANT,389)
    rightShiftStage1Idx3Pad6_uid390_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= "000000";

	--rightShiftStage0Idx3Pad24_uid379_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(CONSTANT,378)
    rightShiftStage0Idx3Pad24_uid379_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= "000000000000000000000000";

	--X25dto24_uid378_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITSELECT,377)@18
    X25dto24_uid378_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in <= oSqrtFPLFracZ2_uid94_asinX_uid8_fpArcsinPiTest_q;
    X25dto24_uid378_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b <= X25dto24_uid378_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in(25 downto 24);

	--rightShiftStage0Idx3_uid380_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITJOIN,379)@18
    rightShiftStage0Idx3_uid380_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= rightShiftStage0Idx3Pad24_uid379_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q & X25dto24_uid378_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b;

	--zs_uid276_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(CONSTANT,275)
    zs_uid276_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= "0000000000000000";

	--X25dto16_uid375_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITSELECT,374)@18
    X25dto16_uid375_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in <= oSqrtFPLFracZ2_uid94_asinX_uid8_fpArcsinPiTest_q;
    X25dto16_uid375_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b <= X25dto16_uid375_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in(25 downto 16);

	--rightShiftStage0Idx2_uid377_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITJOIN,376)@18
    rightShiftStage0Idx2_uid377_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= zs_uid276_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q & X25dto16_uid375_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b;

	--X25dto8_uid372_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITSELECT,371)@18
    X25dto8_uid372_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in <= oSqrtFPLFracZ2_uid94_asinX_uid8_fpArcsinPiTest_q;
    X25dto8_uid372_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b <= X25dto8_uid372_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in(25 downto 8);

	--rightShiftStage0Idx1_uid374_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITJOIN,373)@18
    rightShiftStage0Idx1_uid374_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q & X25dto8_uid372_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b;

	--maxCountVal_uid312_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(CONSTANT,311)
    maxCountVal_uid312_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= "100011";

	--zs_uid269_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(CONSTANT,268)
    zs_uid269_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= "00000000000000000000000000000000";

	--X24dto0_uid237_fxpX_uid57_asinX_uid8_fpArcsinPiTest(BITSELECT,236)@0
    X24dto0_uid237_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in <= oFracXExt_uid55_asinX_uid8_fpArcsinPiTest_q(24 downto 0);
    X24dto0_uid237_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b <= X24dto0_uid237_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in(24 downto 0);

	--leftShiftStage0Idx3Pad12_uid236_fxpX_uid57_asinX_uid8_fpArcsinPiTest(CONSTANT,235)
    leftShiftStage0Idx3Pad12_uid236_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= "000000000000";

	--leftShiftStage0Idx3_uid238_fxpX_uid57_asinX_uid8_fpArcsinPiTest(BITJOIN,237)@0
    leftShiftStage0Idx3_uid238_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= X24dto0_uid237_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b & leftShiftStage0Idx3Pad12_uid236_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q;

	--X28dto0_uid234_fxpX_uid57_asinX_uid8_fpArcsinPiTest(BITSELECT,233)@0
    X28dto0_uid234_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in <= oFracXExt_uid55_asinX_uid8_fpArcsinPiTest_q(28 downto 0);
    X28dto0_uid234_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b <= X28dto0_uid234_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in(28 downto 0);

	--leftShiftStage0Idx2_uid235_fxpX_uid57_asinX_uid8_fpArcsinPiTest(BITJOIN,234)@0
    leftShiftStage0Idx2_uid235_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= X28dto0_uid234_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b & cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q;

	--X32dto0_uid231_fxpX_uid57_asinX_uid8_fpArcsinPiTest(BITSELECT,230)@0
    X32dto0_uid231_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in <= oFracXExt_uid55_asinX_uid8_fpArcsinPiTest_q(32 downto 0);
    X32dto0_uid231_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b <= X32dto0_uid231_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in(32 downto 0);

	--leftShiftStage0Idx1Pad4_uid230_fxpX_uid57_asinX_uid8_fpArcsinPiTest(CONSTANT,229)
    leftShiftStage0Idx1Pad4_uid230_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= "0000";

	--leftShiftStage0Idx1_uid232_fxpX_uid57_asinX_uid8_fpArcsinPiTest(BITJOIN,231)@0
    leftShiftStage0Idx1_uid232_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= X32dto0_uid231_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b & leftShiftStage0Idx1Pad4_uid230_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q;

	--cst01pWShift_uid54_asinX_uid8_fpArcsinPiTest(CONSTANT,53)
    cst01pWShift_uid54_asinX_uid8_fpArcsinPiTest_q <= "0000000000000";

	--oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest(BITJOIN,48)@0
    oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q <= VCC_q & fracX_uid16_asinX_uid8_fpArcsinPiTest_b;

	--oFracXExt_uid55_asinX_uid8_fpArcsinPiTest(BITJOIN,54)@0
    oFracXExt_uid55_asinX_uid8_fpArcsinPiTest_q <= cst01pWShift_uid54_asinX_uid8_fpArcsinPiTest_q & oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q;

	--shiftBias_uid52_asinX_uid8_fpArcsinPiTest(CONSTANT,51)
    shiftBias_uid52_asinX_uid8_fpArcsinPiTest_q <= "01110010";

	--shiftValue_uid53_asinX_uid8_fpArcsinPiTest(SUB,52)@0
    shiftValue_uid53_asinX_uid8_fpArcsinPiTest_a <= STD_LOGIC_VECTOR("0" & expX_uid15_asinX_uid8_fpArcsinPiTest_b);
    shiftValue_uid53_asinX_uid8_fpArcsinPiTest_b <= STD_LOGIC_VECTOR("0" & shiftBias_uid52_asinX_uid8_fpArcsinPiTest_q);
            shiftValue_uid53_asinX_uid8_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValue_uid53_asinX_uid8_fpArcsinPiTest_a) - UNSIGNED(shiftValue_uid53_asinX_uid8_fpArcsinPiTest_b));
    shiftValue_uid53_asinX_uid8_fpArcsinPiTest_q <= shiftValue_uid53_asinX_uid8_fpArcsinPiTest_o(8 downto 0);


	--fxpShifterBits_uid56_asinX_uid8_fpArcsinPiTest(BITSELECT,55)@0
    fxpShifterBits_uid56_asinX_uid8_fpArcsinPiTest_in <= shiftValue_uid53_asinX_uid8_fpArcsinPiTest_q(3 downto 0);
    fxpShifterBits_uid56_asinX_uid8_fpArcsinPiTest_b <= fxpShifterBits_uid56_asinX_uid8_fpArcsinPiTest_in(3 downto 0);

	--leftShiftStageSel3Dto2_uid239_fxpX_uid57_asinX_uid8_fpArcsinPiTest(BITSELECT,238)@0
    leftShiftStageSel3Dto2_uid239_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in <= fxpShifterBits_uid56_asinX_uid8_fpArcsinPiTest_b;
    leftShiftStageSel3Dto2_uid239_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b <= leftShiftStageSel3Dto2_uid239_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in(3 downto 2);

	--leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest(MUX,239)@0
    leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_s <= leftShiftStageSel3Dto2_uid239_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b;
    leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest: PROCESS (leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_s, en, oFracXExt_uid55_asinX_uid8_fpArcsinPiTest_q, leftShiftStage0Idx1_uid232_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q, leftShiftStage0Idx2_uid235_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q, leftShiftStage0Idx3_uid238_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= oFracXExt_uid55_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "01" => leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= leftShiftStage0Idx1_uid232_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "10" => leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= leftShiftStage0Idx2_uid235_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "11" => leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= leftShiftStage0Idx3_uid238_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage033dto0_uid248_fxpX_uid57_asinX_uid8_fpArcsinPiTest(BITSELECT,247)@0
    LeftShiftStage033dto0_uid248_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in <= leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q(33 downto 0);
    LeftShiftStage033dto0_uid248_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b <= LeftShiftStage033dto0_uid248_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in(33 downto 0);

	--leftShiftStage1Idx3Pad3_uid247_fxpX_uid57_asinX_uid8_fpArcsinPiTest(CONSTANT,246)
    leftShiftStage1Idx3Pad3_uid247_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= "000";

	--leftShiftStage1Idx3_uid249_fxpX_uid57_asinX_uid8_fpArcsinPiTest(BITJOIN,248)@0
    leftShiftStage1Idx3_uid249_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= LeftShiftStage033dto0_uid248_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b & leftShiftStage1Idx3Pad3_uid247_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q;

	--reg_leftShiftStage1Idx3_uid249_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_5(REG,463)@0
    reg_leftShiftStage1Idx3_uid249_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid249_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_5_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid249_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_5_q <= leftShiftStage1Idx3_uid249_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage034dto0_uid245_fxpX_uid57_asinX_uid8_fpArcsinPiTest(BITSELECT,244)@0
    LeftShiftStage034dto0_uid245_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in <= leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q(34 downto 0);
    LeftShiftStage034dto0_uid245_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b <= LeftShiftStage034dto0_uid245_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in(34 downto 0);

	--leftShiftStage1Idx2_uid246_fxpX_uid57_asinX_uid8_fpArcsinPiTest(BITJOIN,245)@0
    leftShiftStage1Idx2_uid246_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= LeftShiftStage034dto0_uid245_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b & z2_uid93_asinX_uid8_fpArcsinPiTest_q;

	--reg_leftShiftStage1Idx2_uid246_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_4(REG,462)@0
    reg_leftShiftStage1Idx2_uid246_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid246_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_4_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid246_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_4_q <= leftShiftStage1Idx2_uid246_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage035dto0_uid242_fxpX_uid57_asinX_uid8_fpArcsinPiTest(BITSELECT,241)@0
    LeftShiftStage035dto0_uid242_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in <= leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q(35 downto 0);
    LeftShiftStage035dto0_uid242_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b <= LeftShiftStage035dto0_uid242_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in(35 downto 0);

	--leftShiftStage1Idx1_uid243_fxpX_uid57_asinX_uid8_fpArcsinPiTest(BITJOIN,242)@0
    leftShiftStage1Idx1_uid243_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= LeftShiftStage035dto0_uid242_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b & GND_q;

	--reg_leftShiftStage1Idx1_uid243_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_3(REG,461)@0
    reg_leftShiftStage1Idx1_uid243_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid243_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_3_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid243_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_3_q <= leftShiftStage1Idx1_uid243_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_2(REG,460)@0
    reg_leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_2_q <= leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid250_fxpX_uid57_asinX_uid8_fpArcsinPiTest(BITSELECT,249)@0
    leftShiftStageSel1Dto0_uid250_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in <= fxpShifterBits_uid56_asinX_uid8_fpArcsinPiTest_b(1 downto 0);
    leftShiftStageSel1Dto0_uid250_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b <= leftShiftStageSel1Dto0_uid250_fxpX_uid57_asinX_uid8_fpArcsinPiTest_in(1 downto 0);

	--reg_leftShiftStageSel1Dto0_uid250_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_1(REG,459)@0
    reg_leftShiftStageSel1Dto0_uid250_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid250_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid250_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_1_q <= leftShiftStageSel1Dto0_uid250_fxpX_uid57_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest(MUX,250)@1
    leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_s <= reg_leftShiftStageSel1Dto0_uid250_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_1_q;
    leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest: PROCESS (leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_s, en, reg_leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_2_q, reg_leftShiftStage1Idx1_uid243_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_3_q, reg_leftShiftStage1Idx2_uid246_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_4_q, reg_leftShiftStage1Idx3_uid249_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= reg_leftShiftStage0_uid240_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= reg_leftShiftStage1Idx1_uid243_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_3_q;
                  WHEN "10" => leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= reg_leftShiftStage1Idx2_uid246_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_4_q;
                  WHEN "11" => leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= reg_leftShiftStage1Idx3_uid249_fxpX_uid57_asinX_uid8_fpArcsinPiTest_0_to_leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--y_uid59_asinX_uid8_fpArcsinPiTest(BITSELECT,58)@1
    y_uid59_asinX_uid8_fpArcsinPiTest_in <= leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q(35 downto 0);
    y_uid59_asinX_uid8_fpArcsinPiTest_b <= y_uid59_asinX_uid8_fpArcsinPiTest_in(35 downto 1);

	--pad_o_uid25_uid78_asinX_uid8_fpArcsinPiTest(BITJOIN,77)@1
    pad_o_uid25_uid78_asinX_uid8_fpArcsinPiTest_q <= VCC_q & STD_LOGIC_VECTOR((34 downto 1 => GND_q(0)) & GND_q);

	--oMy_uid78_asinX_uid8_fpArcsinPiTest(SUB,78)@1
    oMy_uid78_asinX_uid8_fpArcsinPiTest_a <= STD_LOGIC_VECTOR("0" & pad_o_uid25_uid78_asinX_uid8_fpArcsinPiTest_q);
    oMy_uid78_asinX_uid8_fpArcsinPiTest_b <= STD_LOGIC_VECTOR("00" & y_uid59_asinX_uid8_fpArcsinPiTest_b);
            oMy_uid78_asinX_uid8_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMy_uid78_asinX_uid8_fpArcsinPiTest_a) - UNSIGNED(oMy_uid78_asinX_uid8_fpArcsinPiTest_b));
    oMy_uid78_asinX_uid8_fpArcsinPiTest_q <= oMy_uid78_asinX_uid8_fpArcsinPiTest_o(36 downto 0);


	--l_uid80_asinX_uid8_fpArcsinPiTest(BITSELECT,79)@1
    l_uid80_asinX_uid8_fpArcsinPiTest_in <= oMy_uid78_asinX_uid8_fpArcsinPiTest_q(34 downto 0);
    l_uid80_asinX_uid8_fpArcsinPiTest_b <= l_uid80_asinX_uid8_fpArcsinPiTest_in(34 downto 0);

	--rVStage_uid270_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITSELECT,269)@1
    rVStage_uid270_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in <= l_uid80_asinX_uid8_fpArcsinPiTest_b;
    rVStage_uid270_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= rVStage_uid270_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in(34 downto 3);

	--reg_rVStage_uid270_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1(REG,473)@1
    reg_rVStage_uid270_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid270_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid270_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q <= rVStage_uid270_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(LOGICAL,270)@2
    vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a <= reg_rVStage_uid270_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q;
    vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= zs_uid269_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
    vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= "1" when vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a = vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b else "0";

	--ld_vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_f(DELAY,842)@2
    ld_vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q, xout => ld_vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid273_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITSELECT,272)@1
    vStage_uid273_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in <= l_uid80_asinX_uid8_fpArcsinPiTest_b(2 downto 0);
    vStage_uid273_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= vStage_uid273_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in(2 downto 0);

	--cStage_uid274_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITJOIN,273)@1
    cStage_uid274_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= vStage_uid273_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b & zs_uid269_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;

	--reg_cStage_uid274_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3(REG,475)@1
    reg_cStage_uid274_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid274_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid274_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q <= cStage_uid274_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_l_uid80_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2(REG,474)@1
    reg_l_uid80_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_l_uid80_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_l_uid80_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q <= l_uid80_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(MUX,274)@2
    vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s <= vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
    vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest: PROCESS (vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s, en, reg_l_uid80_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q, reg_cStage_uid274_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q)
    BEGIN
            CASE vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "0" => vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= reg_l_uid80_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q;
                  WHEN "1" => vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= reg_cStage_uid274_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q;
                  WHEN OTHERS => vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid277_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITSELECT,276)@2
    rVStage_uid277_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in <= vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
    rVStage_uid277_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= rVStage_uid277_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in(34 downto 19);

	--reg_rVStage_uid277_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1(REG,476)@2
    reg_rVStage_uid277_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid277_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid277_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q <= rVStage_uid277_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(LOGICAL,277)@3
    vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a <= reg_rVStage_uid277_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q;
    vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= zs_uid276_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
    vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= "1" when vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a = vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b else "0";

	--ld_vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_e(DELAY,841)@3
    ld_vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q, xout => ld_vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid280_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITSELECT,279)@2
    vStage_uid280_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in <= vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q(18 downto 0);
    vStage_uid280_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= vStage_uid280_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in(18 downto 0);

	--cStage_uid281_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITJOIN,280)@2
    cStage_uid281_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= vStage_uid280_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b & zs_uid276_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;

	--reg_cStage_uid281_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3(REG,478)@2
    reg_cStage_uid281_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid281_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid281_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q <= cStage_uid281_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2(REG,477)@2
    reg_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q <= vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(MUX,281)@3
    vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s <= vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
    vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest: PROCESS (vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s, en, reg_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q, reg_cStage_uid281_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q)
    BEGIN
            CASE vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "0" => vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= reg_vStagei_uid275_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q;
                  WHEN "1" => vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= reg_cStage_uid281_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q;
                  WHEN OTHERS => vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid284_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITSELECT,283)@3
    rVStage_uid284_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in <= vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
    rVStage_uid284_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= rVStage_uid284_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in(34 downto 27);

	--vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(LOGICAL,284)@3
    vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a <= rVStage_uid284_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b;
    vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q;
    vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= "1" when vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a = vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b else "0";

	--reg_vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3(REG,482)@3
    reg_vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q <= vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid287_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITSELECT,286)@3
    vStage_uid287_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in <= vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q(26 downto 0);
    vStage_uid287_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= vStage_uid287_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in(26 downto 0);

	--cStage_uid288_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITJOIN,287)@3
    cStage_uid288_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= vStage_uid287_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b & cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q;

	--vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(MUX,288)@3
    vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s <= vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
    vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest: PROCESS (vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s, en, vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q, cStage_uid288_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q)
    BEGIN
            CASE vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "0" => vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= vStagei_uid282_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "1" => vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= cStage_uid288_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
                  WHEN OTHERS => vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid291_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITSELECT,290)@3
    rVStage_uid291_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in <= vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
    rVStage_uid291_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= rVStage_uid291_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in(34 downto 31);

	--reg_rVStage_uid291_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1(REG,479)@3
    reg_rVStage_uid291_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid291_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid291_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q <= rVStage_uid291_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(LOGICAL,291)@4
    vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a <= reg_rVStage_uid291_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q;
    vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= leftShiftStage0Idx1Pad4_uid230_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q;
    vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= "1" when vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a = vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b else "0";

	--vStage_uid294_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITSELECT,293)@3
    vStage_uid294_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in <= vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q(30 downto 0);
    vStage_uid294_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= vStage_uid294_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in(30 downto 0);

	--cStage_uid295_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITJOIN,294)@3
    cStage_uid295_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= vStage_uid294_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b & leftShiftStage0Idx1Pad4_uid230_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q;

	--reg_cStage_uid295_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3(REG,481)@3
    reg_cStage_uid295_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid295_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid295_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q <= cStage_uid295_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2(REG,480)@3
    reg_vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q <= vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(MUX,295)@4
    vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s <= vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
    vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest: PROCESS (vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s, en, reg_vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q, reg_cStage_uid295_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q)
    BEGIN
            CASE vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "0" => vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= reg_vStagei_uid289_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_2_q;
                  WHEN "1" => vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= reg_cStage_uid295_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q;
                  WHEN OTHERS => vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid298_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITSELECT,297)@4
    rVStage_uid298_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in <= vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
    rVStage_uid298_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= rVStage_uid298_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in(34 downto 33);

	--vCount_uid299_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(LOGICAL,298)@4
    vCount_uid299_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a <= rVStage_uid298_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b;
    vCount_uid299_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= z2_uid93_asinX_uid8_fpArcsinPiTest_q;
    vCount_uid299_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= "1" when vCount_uid299_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a = vCount_uid299_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b else "0";

	--vStage_uid301_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITSELECT,300)@4
    vStage_uid301_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in <= vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q(32 downto 0);
    vStage_uid301_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= vStage_uid301_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in(32 downto 0);

	--cStage_uid302_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITJOIN,301)@4
    cStage_uid302_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= vStage_uid301_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b & z2_uid93_asinX_uid8_fpArcsinPiTest_q;

	--vStagei_uid303_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(MUX,302)@4
    vStagei_uid303_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s <= vCount_uid299_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
    vStagei_uid303_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest: PROCESS (vStagei_uid303_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s, en, vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q, cStage_uid302_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q)
    BEGIN
            CASE vStagei_uid303_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "0" => vStagei_uid303_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= vStagei_uid296_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "1" => vStagei_uid303_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= cStage_uid302_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
                  WHEN OTHERS => vStagei_uid303_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid305_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITSELECT,304)@4
    rVStage_uid305_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in <= vStagei_uid303_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
    rVStage_uid305_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= rVStage_uid305_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in(34 downto 34);

	--vCount_uid306_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(LOGICAL,305)@4
    vCount_uid306_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a <= rVStage_uid305_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b;
    vCount_uid306_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= GND_q;
    vCount_uid306_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= "1" when vCount_uid306_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a = vCount_uid306_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b else "0";

	--vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITJOIN,310)@4
    vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= ld_vCount_uid271_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_f_q & ld_vCount_uid278_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_e_q & reg_vCount_uid285_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_3_q & vCount_uid292_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q & vCount_uid299_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q & vCount_uid306_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;

	--ld_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_c(DELAY,845)@4
    ld_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_c : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q, xout => ld_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1(REG,483)@4
    reg_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q <= vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(COMPARE,312)@5
    vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_cin <= GND_q;
    vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a <= STD_LOGIC_VECTOR("00" & maxCountVal_uid312_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q) & '0';
    vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= STD_LOGIC_VECTOR("00" & reg_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_0_to_vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_1_q) & vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_cin(0);
            vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_a) - UNSIGNED(vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b));
    vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_c(0) <= vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_o(8);


	--vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(MUX,314)@5
    vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s <= vCountBig_uid313_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_c;
    vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s IS
                      WHEN "0" => vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= ld_vCount_uid311_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q_to_vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_c_q;
                      WHEN "1" => vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= maxCountVal_uid312_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
                      WHEN OTHERS => vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--cstBiasM2_uid6_fpArcsinPiTest(CONSTANT,5)
    cstBiasM2_uid6_fpArcsinPiTest_q <= "01111101";

	--expL_uid82_asinX_uid8_fpArcsinPiTest(SUB,81)@6
    expL_uid82_asinX_uid8_fpArcsinPiTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM2_uid6_fpArcsinPiTest_q);
    expL_uid82_asinX_uid8_fpArcsinPiTest_b <= STD_LOGIC_VECTOR("000" & vCountFinal_uid315_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q);
            expL_uid82_asinX_uid8_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expL_uid82_asinX_uid8_fpArcsinPiTest_a) - UNSIGNED(expL_uid82_asinX_uid8_fpArcsinPiTest_b));
    expL_uid82_asinX_uid8_fpArcsinPiTest_q <= expL_uid82_asinX_uid8_fpArcsinPiTest_o(8 downto 0);


	--expLRange_uid84_asinX_uid8_fpArcsinPiTest(BITSELECT,83)@6
    expLRange_uid84_asinX_uid8_fpArcsinPiTest_in <= expL_uid82_asinX_uid8_fpArcsinPiTest_q(7 downto 0);
    expLRange_uid84_asinX_uid8_fpArcsinPiTest_b <= expLRange_uid84_asinX_uid8_fpArcsinPiTest_in(7 downto 0);

	--vStage_uid308_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITSELECT,307)@4
    vStage_uid308_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in <= vStagei_uid303_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q(33 downto 0);
    vStage_uid308_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b <= vStage_uid308_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_in(33 downto 0);

	--cStage_uid309_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(BITJOIN,308)@4
    cStage_uid309_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= vStage_uid308_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_b & GND_q;

	--vStagei_uid310_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest(MUX,309)@4
    vStagei_uid310_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s <= vCount_uid306_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
    vStagei_uid310_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest: PROCESS (vStagei_uid310_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s, en, vStagei_uid303_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q, cStage_uid309_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q)
    BEGIN
            CASE vStagei_uid310_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "0" => vStagei_uid310_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= vStagei_uid303_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "1" => vStagei_uid310_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= cStage_uid309_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q;
                  WHEN OTHERS => vStagei_uid310_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest(BITSELECT,82)@4
    fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_in <= vStagei_uid310_fpLOut1_uid81_asinX_uid8_fpArcsinPiTest_q(33 downto 0);
    fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_b <= fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_in(33 downto 11);

	--reg_fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_0_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_0(REG,484)@4
    reg_fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_0_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_0_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_0_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_0_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_0_q <= fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_0_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_0_q_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_a(DELAY,581)@5
    ld_reg_fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_0_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_0_q_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => reg_fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_0_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_0_q, xout => ld_reg_fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_0_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_0_q_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--fpL_uid85_asinX_uid8_fpArcsinPiTest(BITJOIN,84)@6
    fpL_uid85_asinX_uid8_fpArcsinPiTest_q <= GND_q & expLRange_uid84_asinX_uid8_fpArcsinPiTest_b & ld_reg_fpLOutFrac_uid83_asinX_uid8_fpArcsinPiTest_0_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_0_q_to_fpL_uid85_asinX_uid8_fpArcsinPiTest_a_q;

	--signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(BITSELECT,319)@6
    signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in <= fpL_uid85_asinX_uid8_fpArcsinPiTest_q;
    signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in(31 downto 31);

	--expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(BITSELECT,317)@6
    expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in <= fpL_uid85_asinX_uid8_fpArcsinPiTest_q(30 downto 0);
    expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in(30 downto 23);

	--expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,324)@6
    expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;
    expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q;
    expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "1" when expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a = expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b else "0";

	--negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,367)@6
    negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;
    negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a and negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;
        END IF;
    END PROCESS;



	--ld_negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_c(DELAY,901)@7
    ld_negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 10 )
    PORT MAP ( xin => negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q, xout => ld_negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_nor(LOGICAL,1176)
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_nor_b <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_sticky_ena_q;
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_nor_q <= not (ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_nor_a or ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_nor_b);

	--ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_mem_top(CONSTANT,1172)
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_mem_top_q <= "0110";

	--ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmp(LOGICAL,1173)
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmp_a <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_mem_top_q;
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_q);
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmp_q <= "1" when ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmp_a = ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmp_b else "0";

	--ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmpReg(REG,1174)
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmpReg_q <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_sticky_ena(REG,1177)
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_nor_q = "1") THEN
                ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_sticky_ena_q <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_enaAnd(LOGICAL,1178)
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_enaAnd_a <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_sticky_ena_q;
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_enaAnd_b <= en;
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_enaAnd_q <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_enaAnd_a and ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_enaAnd_b;

	--reg_expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0(REG,494)@6
    reg_expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_q <= expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expOddSig_uid341_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(ADD,340)@7
    expOddSig_uid341_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= STD_LOGIC_VECTOR("0" & reg_expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_q);
    expOddSig_uid341_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid23_asinX_uid8_fpArcsinPiTest_q);
            expOddSig_uid341_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expOddSig_uid341_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a) + UNSIGNED(expOddSig_uid341_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b));
    expOddSig_uid341_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= expOddSig_uid341_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_o(8 downto 0);


	--expROdd_uid342_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(BITSELECT,341)@7
    expROdd_uid342_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in <= expOddSig_uid341_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    expROdd_uid342_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= expROdd_uid342_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in(8 downto 1);

	--expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(ADD,337)@7
    expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= STD_LOGIC_VECTOR("0" & reg_expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_q);
    expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= STD_LOGIC_VECTOR("0" & cstBias_uid22_asinX_uid8_fpArcsinPiTest_q);
            expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a) + UNSIGNED(expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b));
    expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_o(8 downto 0);


	--expREven_uid339_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(BITSELECT,338)@7
    expREven_uid339_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in <= expEvenSig_uid338_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    expREven_uid339_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= expREven_uid339_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in(8 downto 1);

	--expX0_uid343_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(BITSELECT,342)@6
    expX0_uid343_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in <= expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b(0 downto 0);
    expX0_uid343_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= expX0_uid343_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in(0 downto 0);

	--expOddSelect_uid344_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,343)@6
    expOddSelect_uid344_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= expX0_uid343_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;
    expOddSelect_uid344_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= not expOddSelect_uid344_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a;

	--ld_expOddSelect_uid344_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b(DELAY,869)@6
    ld_expOddSelect_uid344_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expOddSelect_uid344_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q, xout => ld_expOddSelect_uid344_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(MUX,344)@7
    expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_s <= ld_expOddSelect_uid344_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_q;
    expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_s IS
                      WHEN "0" => expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= expREven_uid339_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;
                      WHEN "1" => expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= expROdd_uid342_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;
                      WHEN OTHERS => expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a(DELAY,877)@6
    ld_signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b, xout => ld_signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid333_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,332)@7
    InvExc_N_uid333_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= exc_N_uid332_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    InvExc_N_uid333_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= not InvExc_N_uid333_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a;

	--fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(BITSELECT,318)@6
    fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in <= fpL_uid85_asinX_uid8_fpArcsinPiTest_q(22 downto 0);
    fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in(22 downto 0);

	--reg_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_1(REG,485)@6
    reg_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_1_q <= fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,328)@7
    fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= reg_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_1_q;
    fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q;
    fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "1" when fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a = fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b else "0";

	--expXIsMax_uid327_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,326)@6
    expXIsMax_uid327_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= expX_uid318_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;
    expXIsMax_uid327_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q;
    expXIsMax_uid327_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXIsMax_uid327_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            IF (expXIsMax_uid327_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a = expXIsMax_uid327_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b) THEN
                expXIsMax_uid327_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "1";
            ELSE
                expXIsMax_uid327_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "0";
            END IF;
        END IF;
    END PROCESS;



	--exc_I_uid330_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,329)@7
    exc_I_uid330_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= expXIsMax_uid327_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    exc_I_uid330_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    exc_I_uid330_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= exc_I_uid330_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a and exc_I_uid330_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;

	--InvExc_I_uid334_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,333)@7
    InvExc_I_uid334_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= exc_I_uid330_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    InvExc_I_uid334_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= not InvExc_I_uid334_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a;

	--InvExpXIsZero_uid335_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,334)@6
    InvExpXIsZero_uid335_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    InvExpXIsZero_uid335_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExpXIsZero_uid335_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExpXIsZero_uid335_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= not InvExpXIsZero_uid335_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a;
        END IF;
    END PROCESS;



	--exc_R_uid336_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,335)@7
    exc_R_uid336_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= InvExpXIsZero_uid335_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    exc_R_uid336_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= InvExc_I_uid334_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    exc_R_uid336_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_c <= InvExc_N_uid333_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    exc_R_uid336_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= exc_R_uid336_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a and exc_R_uid336_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b and exc_R_uid336_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_c;

	--minReg_uid354_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,353)@7
    minReg_uid354_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= exc_R_uid336_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    minReg_uid354_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= ld_signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_q;
    minReg_uid354_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= minReg_uid354_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a and minReg_uid354_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;

	--minInf_uid355_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,354)@7
    minInf_uid355_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= exc_I_uid330_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    minInf_uid355_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= ld_signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_q;
    minInf_uid355_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= minInf_uid355_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a and minInf_uid355_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;

	--InvFracXIsZero_uid331_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,330)@7
    InvFracXIsZero_uid331_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= fracXIsZero_uid329_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    InvFracXIsZero_uid331_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= not InvFracXIsZero_uid331_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a;

	--exc_N_uid332_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,331)@7
    exc_N_uid332_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= expXIsMax_uid327_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    exc_N_uid332_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= InvFracXIsZero_uid331_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    exc_N_uid332_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= exc_N_uid332_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a and exc_N_uid332_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;

	--excRNaN_uid356_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,355)@7
    excRNaN_uid356_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= exc_N_uid332_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    excRNaN_uid356_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= minInf_uid355_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    excRNaN_uid356_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_c <= minReg_uid354_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    excRNaN_uid356_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= excRNaN_uid356_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a or excRNaN_uid356_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b or excRNaN_uid356_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_c;

	--InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,351)@7
    InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= ld_signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_q;
    InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= not InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a;

	--inInfAndNotNeg_uid353_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOGICAL,352)@7
    inInfAndNotNeg_uid353_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a <= exc_I_uid330_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    inInfAndNotNeg_uid353_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    inInfAndNotNeg_uid353_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= inInfAndNotNeg_uid353_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a and inInfAndNotNeg_uid353_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;

	--ld_expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_join_uid357_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a(DELAY,887)@6
    ld_expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_join_uid357_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q, xout => ld_expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_join_uid357_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--join_uid357_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(BITJOIN,356)@7
    join_uid357_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= excRNaN_uid356_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q & inInfAndNotNeg_uid353_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q & ld_expXIsZero_uid325_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_join_uid357_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_q;

	--fracSelIn_uid358_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(BITJOIN,357)@7
    fracSelIn_uid358_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= ld_signX_uid320_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_InvSignX_uid352_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_q & join_uid357_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;

	--reg_fracSelIn_uid358_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0(REG,486)@7
    reg_fracSelIn_uid358_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracSelIn_uid358_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracSelIn_uid358_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_q <= fracSelIn_uid358_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(LOOKUP,358)@8
    fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest: PROCESS (reg_fracSelIn_uid358_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_fracSelIn_uid358_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_q) IS
                WHEN "0000" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "01";
                WHEN "0001" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "00";
                WHEN "0010" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "10";
                WHEN "0011" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "00";
                WHEN "0100" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "11";
                WHEN "0101" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "00";
                WHEN "0110" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "10";
                WHEN "0111" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "00";
                WHEN "1000" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "11";
                WHEN "1001" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "00";
                WHEN "1010" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "11";
                WHEN "1011" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "11";
                WHEN "1100" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "11";
                WHEN "1101" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "11";
                WHEN "1110" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "11";
                WHEN "1111" =>  fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= "11";
                WHEN OTHERS =>
                    fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(MUX,362)@8
    expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_s <= fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
    expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest: PROCESS (expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_s, en, cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q, expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q, cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q, cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q)
    BEGIN
            CASE expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "00" => expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "01" => expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= expRMux_uid345_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "10" => expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "11" => expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q;
                  WHEN OTHERS => expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_inputreg(DELAY,1166)
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q, xout => ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt(COUNTER,1168)
    -- every=1, low=0, high=6, step=1, init=1
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i = 5 THEN
                      ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_eq = '1') THEN
                        ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i - 6;
                    ELSE
                        ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i,3));


	--ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdreg(REG,1169)
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdreg_q <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdmux(MUX,1170)
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_s <= en;
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdmux: PROCESS (ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_s, ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdreg_q, ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_q <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_q <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem(DUALMEM,1167)
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_reset0 <= areset;
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_ia <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_inputreg_q;
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_aa <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdreg_q;
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_ab <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_q;
    ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 8,
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
        clocken1 => ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_iq,
        address_a => ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_aa,
        data_a => ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_ia
    );
        ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_q <= ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_iq(7 downto 0);

	--cstNaNWF_uid20_asinX_uid8_fpArcsinPiTest(CONSTANT,19)
    cstNaNWF_uid20_asinX_uid8_fpArcsinPiTest_q <= "00000000000000000000001";

	--fracXAddr_uid347_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(BITSELECT,346)@6
    fracXAddr_uid347_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in <= fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;
    fracXAddr_uid347_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= fracXAddr_uid347_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in(22 downto 16);

	--addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(BITJOIN,347)@6
    addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= expOddSelect_uid344_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q & fracXAddr_uid347_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;

	--reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid424_sqrtTableGenerator_lutmem_0(REG,487)@6
    reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid424_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid424_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid424_sqrtTableGenerator_lutmem_0_q <= addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid424_sqrtTableGenerator_lutmem(DUALMEM,457)@7
    memoryC2_uid424_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC2_uid424_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC2_uid424_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC2_uid424_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid424_sqrtTableGenerator_lutmem_0_q;
    memoryC2_uid424_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
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
        init_file => "fp_arcsinpi_s5_memoryC2_uid424_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid424_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid424_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid424_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC2_uid424_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC2_uid424_sqrtTableGenerator_lutmem_ia
    );
        memoryC2_uid424_sqrtTableGenerator_lutmem_q <= memoryC2_uid424_sqrtTableGenerator_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid424_sqrtTableGenerator_lutmem_0_to_prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_1(REG,489)@9
    reg_memoryC2_uid424_sqrtTableGenerator_lutmem_0_to_prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid424_sqrtTableGenerator_lutmem_0_to_prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid424_sqrtTableGenerator_lutmem_0_to_prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_1_q <= memoryC2_uid424_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_inputreg(DELAY,1165)
    ld_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b, xout => ld_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a(DELAY,875)@6
    ld_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => ld_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_inputreg_q, xout => ld_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(BITSELECT,348)@9
    FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in <= ld_fracX_uid319_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_a_q(15 downto 0);
    FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in(15 downto 0);

	--yT1_uid425_sqrtPolynomialEvaluator(BITSELECT,424)@9
    yT1_uid425_sqrtPolynomialEvaluator_in <= FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;
    yT1_uid425_sqrtPolynomialEvaluator_b <= yT1_uid425_sqrtPolynomialEvaluator_in(15 downto 4);

	--reg_yT1_uid425_sqrtPolynomialEvaluator_0_to_prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_0(REG,488)@9
    reg_yT1_uid425_sqrtPolynomialEvaluator_0_to_prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid425_sqrtPolynomialEvaluator_0_to_prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid425_sqrtPolynomialEvaluator_0_to_prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_0_q <= yT1_uid425_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator(MULT,443)@10
    prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_a),13)) * SIGNED(prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_b);
    prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_a <= reg_yT1_uid425_sqrtPolynomialEvaluator_0_to_prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_0_q;
                prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_b <= reg_memoryC2_uid424_sqrtTableGenerator_lutmem_0_to_prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_1_q;
                prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_q <= prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid445_pT1_uid426_sqrtPolynomialEvaluator(BITSELECT,444)@13
    prodXYTruncFR_uid445_pT1_uid426_sqrtPolynomialEvaluator_in <= prodXY_uid444_pT1_uid426_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid445_pT1_uid426_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid445_pT1_uid426_sqrtPolynomialEvaluator_in(23 downto 11);

	--highBBits_uid428_sqrtPolynomialEvaluator(BITSELECT,427)@13
    highBBits_uid428_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid445_pT1_uid426_sqrtPolynomialEvaluator_b;
    highBBits_uid428_sqrtPolynomialEvaluator_b <= highBBits_uid428_sqrtPolynomialEvaluator_in(12 downto 1);

	--ld_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid423_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid423_sqrtTableGenerator_lutmem_a(DELAY,983)@7
    ld_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid423_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid423_sqrtTableGenerator_lutmem_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid424_sqrtTableGenerator_lutmem_0_q, xout => ld_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid423_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid423_sqrtTableGenerator_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid423_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid423_sqrtTableGenerator_lutmem_a_outputreg(DELAY,1217)
    ld_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid423_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid423_sqrtTableGenerator_lutmem_a_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid423_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid423_sqrtTableGenerator_lutmem_a_q, xout => ld_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid423_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid423_sqrtTableGenerator_lutmem_a_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid423_sqrtTableGenerator_lutmem(DUALMEM,456)@11
    memoryC1_uid423_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC1_uid423_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC1_uid423_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC1_uid423_sqrtTableGenerator_lutmem_ab <= ld_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid423_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid423_sqrtTableGenerator_lutmem_a_outputreg_q;
    memoryC1_uid423_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_arcsinpi_s5_memoryC1_uid423_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid423_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid423_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid423_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC1_uid423_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC1_uid423_sqrtTableGenerator_lutmem_ia
    );
        memoryC1_uid423_sqrtTableGenerator_lutmem_q <= memoryC1_uid423_sqrtTableGenerator_lutmem_iq(20 downto 0);

	--sumAHighB_uid429_sqrtPolynomialEvaluator(ADD,428)@13
    sumAHighB_uid429_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid423_sqrtTableGenerator_lutmem_q(20)) & memoryC1_uid423_sqrtTableGenerator_lutmem_q);
    sumAHighB_uid429_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid428_sqrtPolynomialEvaluator_b(11)) & highBBits_uid428_sqrtPolynomialEvaluator_b);
            sumAHighB_uid429_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid429_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid429_sqrtPolynomialEvaluator_b));
    sumAHighB_uid429_sqrtPolynomialEvaluator_q <= sumAHighB_uid429_sqrtPolynomialEvaluator_o(21 downto 0);


	--lowRangeB_uid427_sqrtPolynomialEvaluator(BITSELECT,426)@13
    lowRangeB_uid427_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid445_pT1_uid426_sqrtPolynomialEvaluator_b(0 downto 0);
    lowRangeB_uid427_sqrtPolynomialEvaluator_b <= lowRangeB_uid427_sqrtPolynomialEvaluator_in(0 downto 0);

	--s1_uid427_uid430_sqrtPolynomialEvaluator(BITJOIN,429)@13
    s1_uid427_uid430_sqrtPolynomialEvaluator_q <= sumAHighB_uid429_sqrtPolynomialEvaluator_q & lowRangeB_uid427_sqrtPolynomialEvaluator_b;

	--reg_s1_uid427_uid430_sqrtPolynomialEvaluator_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_1(REG,492)@13
    reg_s1_uid427_uid430_sqrtPolynomialEvaluator_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid427_uid430_sqrtPolynomialEvaluator_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid427_uid430_sqrtPolynomialEvaluator_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_1_q <= s1_uid427_uid430_sqrtPolynomialEvaluator_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_nor(LOGICAL,1240)
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_nor_b <= ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_sticky_ena_q;
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_nor_q <= not (ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_nor_a or ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_nor_b);

	--ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_cmpReg(REG,1238)
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_sticky_ena(REG,1241)
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_nor_q = "1") THEN
                ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_sticky_ena_q <= ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_enaAnd(LOGICAL,1242)
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_enaAnd_a <= ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_sticky_ena_q;
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_enaAnd_b <= en;
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_enaAnd_q <= ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_enaAnd_a and ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_enaAnd_b;

	--ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_inputreg(DELAY,1232)
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b, xout => ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdcnt(COUNTER,1234)
    -- every=1, low=0, high=1, step=1, init=1
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i <= ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i,1));


	--ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdreg(REG,1235)
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdreg_q <= ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdmux(MUX,1236)
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdmux_s <= en;
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdmux: PROCESS (ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdmux_s, ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdreg_q, ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdmux_q <= ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdreg_q;
                  WHEN "1" => ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdmux_q <= ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem(DUALMEM,1233)
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_reset0 <= areset;
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_ia <= ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_inputreg_q;
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_aa <= ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdreg_q;
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_ab <= ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_rdmux_q;
    ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
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
        clocken1 => ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_iq,
        address_a => ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_aa,
        data_a => ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_ia
    );
        ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_q <= ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_iq(15 downto 0);

	--reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0(REG,491)@13
    reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_q <= ld_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_to_reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator(MULT,446)@14
    prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_a),17)) * SIGNED(prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_b);
    prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_a <= reg_FracX15dto0_uid349_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_0_q;
                prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_b <= reg_s1_uid427_uid430_sqrtPolynomialEvaluator_0_to_prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_1_q;
                prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_q <= prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid448_pT2_uid432_sqrtPolynomialEvaluator(BITSELECT,447)@17
    prodXYTruncFR_uid448_pT2_uid432_sqrtPolynomialEvaluator_in <= prodXY_uid447_pT2_uid432_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid448_pT2_uid432_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid448_pT2_uid432_sqrtPolynomialEvaluator_in(38 downto 15);

	--highBBits_uid434_sqrtPolynomialEvaluator(BITSELECT,433)@17
    highBBits_uid434_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid448_pT2_uid432_sqrtPolynomialEvaluator_b;
    highBBits_uid434_sqrtPolynomialEvaluator_b <= highBBits_uid434_sqrtPolynomialEvaluator_in(23 downto 2);

	--ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_nor(LOGICAL,1253)
    ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_nor_b <= ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_nor_q <= not (ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_nor_a or ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_nor_b);

	--ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_mem_top(CONSTANT,1184)
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_mem_top_q <= "0101";

	--ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmp(LOGICAL,1185)
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmp_a <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_mem_top_q;
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux_q);
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmp_q <= "1" when ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmp_a = ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmp_b else "0";

	--ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmpReg(REG,1186)
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmpReg_q <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_sticky_ena(REG,1254)
    ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_nor_q = "1") THEN
                ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_sticky_ena_q <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_enaAnd(LOGICAL,1255)
    ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_enaAnd_a <= ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_enaAnd_b <= en;
    ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_enaAnd_q <= ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_enaAnd_a and ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_enaAnd_b;

	--ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_inputreg(DELAY,1243)
    ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q, xout => ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt(COUNTER,1180)
    -- every=1, low=0, high=5, step=1, init=1
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_i = 4 THEN
                      ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_i <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_i - 5;
                    ELSE
                        ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_i <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_i,3));


	--ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdreg(REG,1181)
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdreg_q <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux(MUX,1182)
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux_s <= en;
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux: PROCESS (ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux_s, ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdreg_q, ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux_q <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux_q <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem(DUALMEM,1244)
    ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0 <= areset;
    ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_ia <= ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_inputreg_q;
    ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_aa <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdreg_q;
    ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_ab <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux_q;
    ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 8,
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
        clocken1 => ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_iq,
        address_a => ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_aa,
        data_a => ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_ia
    );
        ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_q <= ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0(REG,493)@14
    reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_q <= ld_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid422_sqrtTableGenerator_lutmem(DUALMEM,455)@15
    memoryC0_uid422_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC0_uid422_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC0_uid422_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC0_uid422_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid348_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid422_sqrtTableGenerator_lutmem_0_q;
    memoryC0_uid422_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_arcsinpi_s5_memoryC0_uid422_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid422_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid422_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid422_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC0_uid422_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC0_uid422_sqrtTableGenerator_lutmem_ia
    );
        memoryC0_uid422_sqrtTableGenerator_lutmem_q <= memoryC0_uid422_sqrtTableGenerator_lutmem_iq(28 downto 0);

	--sumAHighB_uid435_sqrtPolynomialEvaluator(ADD,434)@17
    sumAHighB_uid435_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((29 downto 29 => memoryC0_uid422_sqrtTableGenerator_lutmem_q(28)) & memoryC0_uid422_sqrtTableGenerator_lutmem_q);
    sumAHighB_uid435_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid434_sqrtPolynomialEvaluator_b(21)) & highBBits_uid434_sqrtPolynomialEvaluator_b);
            sumAHighB_uid435_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid435_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid435_sqrtPolynomialEvaluator_b));
    sumAHighB_uid435_sqrtPolynomialEvaluator_q <= sumAHighB_uid435_sqrtPolynomialEvaluator_o(29 downto 0);


	--lowRangeB_uid433_sqrtPolynomialEvaluator(BITSELECT,432)@17
    lowRangeB_uid433_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid448_pT2_uid432_sqrtPolynomialEvaluator_b(1 downto 0);
    lowRangeB_uid433_sqrtPolynomialEvaluator_b <= lowRangeB_uid433_sqrtPolynomialEvaluator_in(1 downto 0);

	--s2_uid433_uid436_sqrtPolynomialEvaluator(BITJOIN,435)@17
    s2_uid433_uid436_sqrtPolynomialEvaluator_q <= sumAHighB_uid435_sqrtPolynomialEvaluator_q & lowRangeB_uid433_sqrtPolynomialEvaluator_b;

	--fracR_uid351_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(BITSELECT,350)@17
    fracR_uid351_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in <= s2_uid433_uid436_sqrtPolynomialEvaluator_q(28 downto 0);
    fracR_uid351_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b <= fracR_uid351_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_in(28 downto 6);

	--ld_fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b(DELAY,895)@8
    ld_fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 9 )
    PORT MAP ( xin => fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q, xout => ld_fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(MUX,366)@17
    fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_s <= ld_fracSel_uid359_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_q;
    fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest: PROCESS (fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_s, en, cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q, fracR_uid351_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b, cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q, cstNaNWF_uid20_asinX_uid8_fpArcsinPiTest_q)
    BEGIN
            CASE fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "00" => fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "01" => fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= fracR_uid351_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b;
                  WHEN "10" => fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "11" => fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= cstNaNWF_uid20_asinX_uid8_fpArcsinPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest(BITJOIN,368)@17
    RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q <= ld_negZero_uid368_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_c_q & ld_expRPostExc_uid363_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q_to_RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_b_replace_mem_q & fracRPostExc_uid367_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q;

	--SqrtFPL22dto0_uid90_asinX_uid8_fpArcsinPiTest(BITSELECT,89)@17
    SqrtFPL22dto0_uid90_asinX_uid8_fpArcsinPiTest_in <= RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q(22 downto 0);
    SqrtFPL22dto0_uid90_asinX_uid8_fpArcsinPiTest_b <= SqrtFPL22dto0_uid90_asinX_uid8_fpArcsinPiTest_in(22 downto 0);

	--ld_SqrtFPL22dto0_uid90_asinX_uid8_fpArcsinPiTest_b_to_oSqrtFPLFrac_uid91_asinX_uid8_fpArcsinPiTest_a(DELAY,586)@17
    ld_SqrtFPL22dto0_uid90_asinX_uid8_fpArcsinPiTest_b_to_oSqrtFPLFrac_uid91_asinX_uid8_fpArcsinPiTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => SqrtFPL22dto0_uid90_asinX_uid8_fpArcsinPiTest_b, xout => ld_SqrtFPL22dto0_uid90_asinX_uid8_fpArcsinPiTest_b_to_oSqrtFPLFrac_uid91_asinX_uid8_fpArcsinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--oSqrtFPLFrac_uid91_asinX_uid8_fpArcsinPiTest(BITJOIN,90)@18
    oSqrtFPLFrac_uid91_asinX_uid8_fpArcsinPiTest_q <= VCC_q & ld_SqrtFPL22dto0_uid90_asinX_uid8_fpArcsinPiTest_b_to_oSqrtFPLFrac_uid91_asinX_uid8_fpArcsinPiTest_a_q;

	--z2_uid93_asinX_uid8_fpArcsinPiTest(CONSTANT,92)
    z2_uid93_asinX_uid8_fpArcsinPiTest_q <= "00";

	--oSqrtFPLFracZ2_uid94_asinX_uid8_fpArcsinPiTest(BITJOIN,93)@18
    oSqrtFPLFracZ2_uid94_asinX_uid8_fpArcsinPiTest_q <= oSqrtFPLFrac_uid91_asinX_uid8_fpArcsinPiTest_q & z2_uid93_asinX_uid8_fpArcsinPiTest_q;

	--SqrtFPL30dto23_uid88_asinX_uid8_fpArcsinPiTest(BITSELECT,87)@17
    SqrtFPL30dto23_uid88_asinX_uid8_fpArcsinPiTest_in <= RSqrt_uid369_sqrtFPL_uid87_asinX_uid8_fpArcsinPiTest_q(30 downto 0);
    SqrtFPL30dto23_uid88_asinX_uid8_fpArcsinPiTest_b <= SqrtFPL30dto23_uid88_asinX_uid8_fpArcsinPiTest_in(30 downto 23);

	--reg_SqrtFPL30dto23_uid88_asinX_uid8_fpArcsinPiTest_0_to_srVal_uid89_asinX_uid8_fpArcsinPiTest_1(REG,496)@17
    reg_SqrtFPL30dto23_uid88_asinX_uid8_fpArcsinPiTest_0_to_srVal_uid89_asinX_uid8_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_SqrtFPL30dto23_uid88_asinX_uid8_fpArcsinPiTest_0_to_srVal_uid89_asinX_uid8_fpArcsinPiTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_SqrtFPL30dto23_uid88_asinX_uid8_fpArcsinPiTest_0_to_srVal_uid89_asinX_uid8_fpArcsinPiTest_1_q <= SqrtFPL30dto23_uid88_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--srVal_uid89_asinX_uid8_fpArcsinPiTest(SUB,88)@18
    srVal_uid89_asinX_uid8_fpArcsinPiTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid23_asinX_uid8_fpArcsinPiTest_q);
    srVal_uid89_asinX_uid8_fpArcsinPiTest_b <= STD_LOGIC_VECTOR("0" & reg_SqrtFPL30dto23_uid88_asinX_uid8_fpArcsinPiTest_0_to_srVal_uid89_asinX_uid8_fpArcsinPiTest_1_q);
            srVal_uid89_asinX_uid8_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(srVal_uid89_asinX_uid8_fpArcsinPiTest_a) - UNSIGNED(srVal_uid89_asinX_uid8_fpArcsinPiTest_b));
    srVal_uid89_asinX_uid8_fpArcsinPiTest_q <= srVal_uid89_asinX_uid8_fpArcsinPiTest_o(8 downto 0);


	--srValRange_uid92_asinX_uid8_fpArcsinPiTest(BITSELECT,91)@18
    srValRange_uid92_asinX_uid8_fpArcsinPiTest_in <= srVal_uid89_asinX_uid8_fpArcsinPiTest_q(4 downto 0);
    srValRange_uid92_asinX_uid8_fpArcsinPiTest_b <= srValRange_uid92_asinX_uid8_fpArcsinPiTest_in(4 downto 0);

	--rightShiftStageSel4Dto3_uid381_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITSELECT,380)@18
    rightShiftStageSel4Dto3_uid381_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in <= srValRange_uid92_asinX_uid8_fpArcsinPiTest_b;
    rightShiftStageSel4Dto3_uid381_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b <= rightShiftStageSel4Dto3_uid381_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in(4 downto 3);

	--rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(MUX,381)@18
    rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_s <= rightShiftStageSel4Dto3_uid381_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b;
    rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest: PROCESS (rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_s, en, oSqrtFPLFracZ2_uid94_asinX_uid8_fpArcsinPiTest_q, rightShiftStage0Idx1_uid374_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q, rightShiftStage0Idx2_uid377_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q, rightShiftStage0Idx3_uid380_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q)
    BEGIN
            CASE rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "00" => rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= oSqrtFPLFracZ2_uid94_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "01" => rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= rightShiftStage0Idx1_uid374_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "10" => rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= rightShiftStage0Idx2_uid377_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "11" => rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= rightShiftStage0Idx3_uid380_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q;
                  WHEN OTHERS => rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage025dto6_uid389_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITSELECT,388)@18
    RightShiftStage025dto6_uid389_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in <= rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q;
    RightShiftStage025dto6_uid389_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b <= RightShiftStage025dto6_uid389_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in(25 downto 6);

	--rightShiftStage1Idx3_uid391_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITJOIN,390)@18
    rightShiftStage1Idx3_uid391_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= rightShiftStage1Idx3Pad6_uid390_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q & RightShiftStage025dto6_uid389_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b;

	--reg_rightShiftStage1Idx3_uid391_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_5(REG,501)@18
    reg_rightShiftStage1Idx3_uid391_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx3_uid391_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_5_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx3_uid391_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_5_q <= rightShiftStage1Idx3_uid391_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--RightShiftStage025dto4_uid386_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITSELECT,385)@18
    RightShiftStage025dto4_uid386_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in <= rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q;
    RightShiftStage025dto4_uid386_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b <= RightShiftStage025dto4_uid386_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in(25 downto 4);

	--rightShiftStage1Idx2_uid388_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITJOIN,387)@18
    rightShiftStage1Idx2_uid388_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= leftShiftStage0Idx1Pad4_uid230_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q & RightShiftStage025dto4_uid386_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b;

	--reg_rightShiftStage1Idx2_uid388_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_4(REG,500)@18
    reg_rightShiftStage1Idx2_uid388_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx2_uid388_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_4_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx2_uid388_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_4_q <= rightShiftStage1Idx2_uid388_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--RightShiftStage025dto2_uid383_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITSELECT,382)@18
    RightShiftStage025dto2_uid383_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in <= rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q;
    RightShiftStage025dto2_uid383_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b <= RightShiftStage025dto2_uid383_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in(25 downto 2);

	--rightShiftStage1Idx1_uid385_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITJOIN,384)@18
    rightShiftStage1Idx1_uid385_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= z2_uid93_asinX_uid8_fpArcsinPiTest_q & RightShiftStage025dto2_uid383_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b;

	--reg_rightShiftStage1Idx1_uid385_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_3(REG,499)@18
    reg_rightShiftStage1Idx1_uid385_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx1_uid385_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_3_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx1_uid385_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_3_q <= rightShiftStage1Idx1_uid385_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_2(REG,498)@18
    reg_rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_2_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_2_q <= rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid392_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITSELECT,391)@18
    rightShiftStageSel2Dto1_uid392_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in <= srValRange_uid92_asinX_uid8_fpArcsinPiTest_b(2 downto 0);
    rightShiftStageSel2Dto1_uid392_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b <= rightShiftStageSel2Dto1_uid392_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in(2 downto 1);

	--reg_rightShiftStageSel2Dto1_uid392_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_1(REG,497)@18
    reg_rightShiftStageSel2Dto1_uid392_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid392_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid392_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_1_q <= rightShiftStageSel2Dto1_uid392_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(MUX,392)@19
    rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_s <= reg_rightShiftStageSel2Dto1_uid392_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_1_q;
    rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest: PROCESS (rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_s, en, reg_rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_2_q, reg_rightShiftStage1Idx1_uid385_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_3_q, reg_rightShiftStage1Idx2_uid388_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_4_q, reg_rightShiftStage1Idx3_uid391_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_5_q)
    BEGIN
            CASE rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "00" => rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= reg_rightShiftStage0_uid382_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_2_q;
                  WHEN "01" => rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= reg_rightShiftStage1Idx1_uid385_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_3_q;
                  WHEN "10" => rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= reg_rightShiftStage1Idx2_uid388_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_4_q;
                  WHEN "11" => rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= reg_rightShiftStage1Idx3_uid391_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_5_q;
                  WHEN OTHERS => rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid397_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(BITSELECT,396)@18
    rightShiftStageSel0Dto0_uid397_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in <= srValRange_uid92_asinX_uid8_fpArcsinPiTest_b(0 downto 0);
    rightShiftStageSel0Dto0_uid397_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b <= rightShiftStageSel0Dto0_uid397_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_in(0 downto 0);

	--reg_rightShiftStageSel0Dto0_uid397_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_1(REG,502)@18
    reg_rightShiftStageSel0Dto0_uid397_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid397_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid397_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_1_q <= rightShiftStageSel0Dto0_uid397_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest(MUX,397)@19
    rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_s <= reg_rightShiftStageSel0Dto0_uid397_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_0_to_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_1_q;
    rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest: PROCESS (rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_s, en, rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q, rightShiftStage2Idx1_uid396_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q)
    BEGIN
            CASE rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "0" => rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= rightShiftStage1_uid393_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "1" => rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= rightShiftStage2Idx1_uid396_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q;
                  WHEN OTHERS => rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--mAddr_uid97_asinX_uid8_fpArcsinPiTest(BITSELECT,96)@19
    mAddr_uid97_asinX_uid8_fpArcsinPiTest_in <= rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q;
    mAddr_uid97_asinX_uid8_fpArcsinPiTest_b <= mAddr_uid97_asinX_uid8_fpArcsinPiTest_in(25 downto 18);

	--reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid402_arcsinXTabGen_lutmem_0(REG,503)@19
    reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid402_arcsinXTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid402_arcsinXTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid402_arcsinXTabGen_lutmem_0_q <= mAddr_uid97_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid402_arcsinXTabGen_lutmem(DUALMEM,454)@20
    memoryC2_uid402_arcsinXTabGen_lutmem_reset0 <= areset;
    memoryC2_uid402_arcsinXTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid402_arcsinXTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid402_arcsinXTabGen_lutmem_ab <= reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid402_arcsinXTabGen_lutmem_0_q;
    memoryC2_uid402_arcsinXTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arcsinpi_s5_memoryC2_uid402_arcsinXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid402_arcsinXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid402_arcsinXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid402_arcsinXTabGen_lutmem_iq,
        address_a => memoryC2_uid402_arcsinXTabGen_lutmem_aa,
        data_a => memoryC2_uid402_arcsinXTabGen_lutmem_ia
    );
        memoryC2_uid402_arcsinXTabGen_lutmem_q <= memoryC2_uid402_arcsinXTabGen_lutmem_iq(12 downto 0);

	--reg_memoryC2_uid402_arcsinXTabGen_lutmem_0_to_prodXY_uid438_pT1_uid404_arcsinXPolyEval_1(REG,505)@22
    reg_memoryC2_uid402_arcsinXTabGen_lutmem_0_to_prodXY_uid438_pT1_uid404_arcsinXPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid402_arcsinXTabGen_lutmem_0_to_prodXY_uid438_pT1_uid404_arcsinXPolyEval_1_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid402_arcsinXTabGen_lutmem_0_to_prodXY_uid438_pT1_uid404_arcsinXPolyEval_1_q <= memoryC2_uid402_arcsinXTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q_to_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_a_inputreg(DELAY,1063)
    ld_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q_to_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q, xout => ld_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q_to_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q_to_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_a(DELAY,590)@19
    ld_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q_to_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_a : dspba_delay
    GENERIC MAP ( width => 26, depth => 2 )
    PORT MAP ( xin => ld_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q_to_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_a_inputreg_q, xout => ld_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q_to_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest(BITSELECT,97)@22
    mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_in <= ld_rightShiftStage2_uid398_alignSqrt_uid95_asinX_uid8_fpArcsinPiTest_q_to_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_a_q(17 downto 0);
    mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_b <= mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_in(17 downto 1);

	--yT1_uid403_arcsinXPolyEval(BITSELECT,402)@22
    yT1_uid403_arcsinXPolyEval_in <= mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_b;
    yT1_uid403_arcsinXPolyEval_b <= yT1_uid403_arcsinXPolyEval_in(16 downto 4);

	--reg_yT1_uid403_arcsinXPolyEval_0_to_prodXY_uid438_pT1_uid404_arcsinXPolyEval_0(REG,504)@22
    reg_yT1_uid403_arcsinXPolyEval_0_to_prodXY_uid438_pT1_uid404_arcsinXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid403_arcsinXPolyEval_0_to_prodXY_uid438_pT1_uid404_arcsinXPolyEval_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid403_arcsinXPolyEval_0_to_prodXY_uid438_pT1_uid404_arcsinXPolyEval_0_q <= yT1_uid403_arcsinXPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid438_pT1_uid404_arcsinXPolyEval(MULT,437)@23
    prodXY_uid438_pT1_uid404_arcsinXPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid438_pT1_uid404_arcsinXPolyEval_a),14)) * SIGNED(prodXY_uid438_pT1_uid404_arcsinXPolyEval_b);
    prodXY_uid438_pT1_uid404_arcsinXPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid438_pT1_uid404_arcsinXPolyEval_a <= (others => '0');
            prodXY_uid438_pT1_uid404_arcsinXPolyEval_b <= (others => '0');
            prodXY_uid438_pT1_uid404_arcsinXPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid438_pT1_uid404_arcsinXPolyEval_a <= reg_yT1_uid403_arcsinXPolyEval_0_to_prodXY_uid438_pT1_uid404_arcsinXPolyEval_0_q;
                prodXY_uid438_pT1_uid404_arcsinXPolyEval_b <= reg_memoryC2_uid402_arcsinXTabGen_lutmem_0_to_prodXY_uid438_pT1_uid404_arcsinXPolyEval_1_q;
                prodXY_uid438_pT1_uid404_arcsinXPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid438_pT1_uid404_arcsinXPolyEval_pr,26));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid438_pT1_uid404_arcsinXPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid438_pT1_uid404_arcsinXPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid438_pT1_uid404_arcsinXPolyEval_q <= prodXY_uid438_pT1_uid404_arcsinXPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid439_pT1_uid404_arcsinXPolyEval(BITSELECT,438)@26
    prodXYTruncFR_uid439_pT1_uid404_arcsinXPolyEval_in <= prodXY_uid438_pT1_uid404_arcsinXPolyEval_q;
    prodXYTruncFR_uid439_pT1_uid404_arcsinXPolyEval_b <= prodXYTruncFR_uid439_pT1_uid404_arcsinXPolyEval_in(25 downto 12);

	--highBBits_uid406_arcsinXPolyEval(BITSELECT,405)@26
    highBBits_uid406_arcsinXPolyEval_in <= prodXYTruncFR_uid439_pT1_uid404_arcsinXPolyEval_b;
    highBBits_uid406_arcsinXPolyEval_b <= highBBits_uid406_arcsinXPolyEval_in(13 downto 1);

	--ld_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid401_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid401_arcsinXTabGen_lutmem_a(DELAY,980)@20
    ld_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid401_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid401_arcsinXTabGen_lutmem_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid402_arcsinXTabGen_lutmem_0_q, xout => ld_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid401_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid401_arcsinXTabGen_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid401_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid401_arcsinXTabGen_lutmem_a_outputreg(DELAY,1216)
    ld_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid401_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid401_arcsinXTabGen_lutmem_a_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid401_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid401_arcsinXTabGen_lutmem_a_q, xout => ld_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid401_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid401_arcsinXTabGen_lutmem_a_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid401_arcsinXTabGen_lutmem(DUALMEM,453)@24
    memoryC1_uid401_arcsinXTabGen_lutmem_reset0 <= areset;
    memoryC1_uid401_arcsinXTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid401_arcsinXTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid401_arcsinXTabGen_lutmem_ab <= ld_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid401_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid401_arcsinXTabGen_lutmem_a_outputreg_q;
    memoryC1_uid401_arcsinXTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 23,
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
        init_file => "fp_arcsinpi_s5_memoryC1_uid401_arcsinXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid401_arcsinXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid401_arcsinXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid401_arcsinXTabGen_lutmem_iq,
        address_a => memoryC1_uid401_arcsinXTabGen_lutmem_aa,
        data_a => memoryC1_uid401_arcsinXTabGen_lutmem_ia
    );
        memoryC1_uid401_arcsinXTabGen_lutmem_q <= memoryC1_uid401_arcsinXTabGen_lutmem_iq(22 downto 0);

	--sumAHighB_uid407_arcsinXPolyEval(ADD,406)@26
    sumAHighB_uid407_arcsinXPolyEval_a <= STD_LOGIC_VECTOR((23 downto 23 => memoryC1_uid401_arcsinXTabGen_lutmem_q(22)) & memoryC1_uid401_arcsinXTabGen_lutmem_q);
    sumAHighB_uid407_arcsinXPolyEval_b <= STD_LOGIC_VECTOR((23 downto 13 => highBBits_uid406_arcsinXPolyEval_b(12)) & highBBits_uid406_arcsinXPolyEval_b);
            sumAHighB_uid407_arcsinXPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid407_arcsinXPolyEval_a) + SIGNED(sumAHighB_uid407_arcsinXPolyEval_b));
    sumAHighB_uid407_arcsinXPolyEval_q <= sumAHighB_uid407_arcsinXPolyEval_o(23 downto 0);


	--lowRangeB_uid405_arcsinXPolyEval(BITSELECT,404)@26
    lowRangeB_uid405_arcsinXPolyEval_in <= prodXYTruncFR_uid439_pT1_uid404_arcsinXPolyEval_b(0 downto 0);
    lowRangeB_uid405_arcsinXPolyEval_b <= lowRangeB_uid405_arcsinXPolyEval_in(0 downto 0);

	--s1_uid405_uid408_arcsinXPolyEval(BITJOIN,407)@26
    s1_uid405_uid408_arcsinXPolyEval_q <= sumAHighB_uid407_arcsinXPolyEval_q & lowRangeB_uid405_arcsinXPolyEval_b;

	--reg_s1_uid405_uid408_arcsinXPolyEval_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_1(REG,508)@26
    reg_s1_uid405_uid408_arcsinXPolyEval_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid405_uid408_arcsinXPolyEval_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_1_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid405_uid408_arcsinXPolyEval_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_1_q <= s1_uid405_uid408_arcsinXPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_nor(LOGICAL,1200)
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_nor_b <= ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_sticky_ena_q;
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_nor_q <= not (ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_nor_a or ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_nor_b);

	--roundBitDetectionConstant_uid186_rAsinPi_uid13_fpArcsinPiTest(CONSTANT,185)
    roundBitDetectionConstant_uid186_rAsinPi_uid13_fpArcsinPiTest_q <= "010";

	--ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmp(LOGICAL,1197)
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmp_a <= roundBitDetectionConstant_uid186_rAsinPi_uid13_fpArcsinPiTest_q;
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdmux_q);
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmp_q <= "1" when ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmp_a = ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmp_b else "0";

	--ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmpReg(REG,1198)
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmpReg_q <= ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_sticky_ena(REG,1201)
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_nor_q = "1") THEN
                ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_sticky_ena_q <= ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_enaAnd(LOGICAL,1202)
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_enaAnd_a <= ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_sticky_ena_q;
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_enaAnd_b <= en;
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_enaAnd_q <= ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_enaAnd_a and ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_enaAnd_b;

	--reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0(REG,507)@22
    reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q <= mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt(COUNTER,1192)
    -- every=1, low=0, high=2, step=1, init=1
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_i = 1 THEN
                      ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_i <= ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_i - 2;
                    ELSE
                        ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_i <= ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_i,2));


	--ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdreg(REG,1193)
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdreg_q <= ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdmux(MUX,1194)
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdmux_s <= en;
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdmux: PROCESS (ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdmux_s, ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdreg_q, ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdmux_q <= ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdmux_q <= ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem(DUALMEM,1191)
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_reset0 <= areset;
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_ia <= reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q;
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_aa <= ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdreg_q;
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_ab <= ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_rdmux_q;
    ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 17,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 17,
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
        clocken1 => ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_iq,
        address_a => ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_aa,
        data_a => ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_ia
    );
        ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_q <= ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_iq(16 downto 0);

	--prodXY_uid441_pT2_uid410_arcsinXPolyEval(MULT,440)@27
    prodXY_uid441_pT2_uid410_arcsinXPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid441_pT2_uid410_arcsinXPolyEval_a),18)) * SIGNED(prodXY_uid441_pT2_uid410_arcsinXPolyEval_b);
    prodXY_uid441_pT2_uid410_arcsinXPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid441_pT2_uid410_arcsinXPolyEval_a <= (others => '0');
            prodXY_uid441_pT2_uid410_arcsinXPolyEval_b <= (others => '0');
            prodXY_uid441_pT2_uid410_arcsinXPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid441_pT2_uid410_arcsinXPolyEval_a <= ld_reg_mPPolyEval_uid98_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_0_q_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_a_replace_mem_q;
                prodXY_uid441_pT2_uid410_arcsinXPolyEval_b <= reg_s1_uid405_uid408_arcsinXPolyEval_0_to_prodXY_uid441_pT2_uid410_arcsinXPolyEval_1_q;
                prodXY_uid441_pT2_uid410_arcsinXPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid441_pT2_uid410_arcsinXPolyEval_pr,42));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid441_pT2_uid410_arcsinXPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid441_pT2_uid410_arcsinXPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid441_pT2_uid410_arcsinXPolyEval_q <= prodXY_uid441_pT2_uid410_arcsinXPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid442_pT2_uid410_arcsinXPolyEval(BITSELECT,441)@30
    prodXYTruncFR_uid442_pT2_uid410_arcsinXPolyEval_in <= prodXY_uid441_pT2_uid410_arcsinXPolyEval_q;
    prodXYTruncFR_uid442_pT2_uid410_arcsinXPolyEval_b <= prodXYTruncFR_uid442_pT2_uid410_arcsinXPolyEval_in(41 downto 16);

	--highBBits_uid412_arcsinXPolyEval(BITSELECT,411)@30
    highBBits_uid412_arcsinXPolyEval_in <= prodXYTruncFR_uid442_pT2_uid410_arcsinXPolyEval_b;
    highBBits_uid412_arcsinXPolyEval_b <= highBBits_uid412_arcsinXPolyEval_in(25 downto 2);

	--ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_nor(LOGICAL,1266)
    ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_nor_b <= ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_sticky_ena_q;
    ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_nor_q <= not (ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_nor_a or ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_nor_b);

	--ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_sticky_ena(REG,1267)
    ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_nor_q = "1") THEN
                ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_sticky_ena_q <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_enaAnd(LOGICAL,1268)
    ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_enaAnd_a <= ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_sticky_ena_q;
    ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_enaAnd_b <= en;
    ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_enaAnd_q <= ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_enaAnd_a and ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_enaAnd_b;

	--ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_inputreg(DELAY,1256)
    ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => mAddr_uid97_asinX_uid8_fpArcsinPiTest_b, xout => ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem(DUALMEM,1257)
    ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_reset0 <= areset;
    ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_ia <= ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_inputreg_q;
    ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_aa <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdreg_q;
    ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_ab <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux_q;
    ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 8,
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
        clocken1 => ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_iq,
        address_a => ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_aa,
        data_a => ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_ia
    );
        ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_q <= ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0(REG,509)@27
    reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_q <= ld_mAddr_uid97_asinX_uid8_fpArcsinPiTest_b_to_reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid400_arcsinXTabGen_lutmem(DUALMEM,452)@28
    memoryC0_uid400_arcsinXTabGen_lutmem_reset0 <= areset;
    memoryC0_uid400_arcsinXTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid400_arcsinXTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid400_arcsinXTabGen_lutmem_ab <= reg_mAddr_uid97_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid400_arcsinXTabGen_lutmem_0_q;
    memoryC0_uid400_arcsinXTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 30,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 30,
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
        init_file => "fp_arcsinpi_s5_memoryC0_uid400_arcsinXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid400_arcsinXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid400_arcsinXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid400_arcsinXTabGen_lutmem_iq,
        address_a => memoryC0_uid400_arcsinXTabGen_lutmem_aa,
        data_a => memoryC0_uid400_arcsinXTabGen_lutmem_ia
    );
        memoryC0_uid400_arcsinXTabGen_lutmem_q <= memoryC0_uid400_arcsinXTabGen_lutmem_iq(29 downto 0);

	--sumAHighB_uid413_arcsinXPolyEval(ADD,412)@30
    sumAHighB_uid413_arcsinXPolyEval_a <= STD_LOGIC_VECTOR((30 downto 30 => memoryC0_uid400_arcsinXTabGen_lutmem_q(29)) & memoryC0_uid400_arcsinXTabGen_lutmem_q);
    sumAHighB_uid413_arcsinXPolyEval_b <= STD_LOGIC_VECTOR((30 downto 24 => highBBits_uid412_arcsinXPolyEval_b(23)) & highBBits_uid412_arcsinXPolyEval_b);
            sumAHighB_uid413_arcsinXPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid413_arcsinXPolyEval_a) + SIGNED(sumAHighB_uid413_arcsinXPolyEval_b));
    sumAHighB_uid413_arcsinXPolyEval_q <= sumAHighB_uid413_arcsinXPolyEval_o(30 downto 0);


	--lowRangeB_uid411_arcsinXPolyEval(BITSELECT,410)@30
    lowRangeB_uid411_arcsinXPolyEval_in <= prodXYTruncFR_uid442_pT2_uid410_arcsinXPolyEval_b(1 downto 0);
    lowRangeB_uid411_arcsinXPolyEval_b <= lowRangeB_uid411_arcsinXPolyEval_in(1 downto 0);

	--s2_uid411_uid414_arcsinXPolyEval(BITJOIN,413)@30
    s2_uid411_uid414_arcsinXPolyEval_q <= sumAHighB_uid413_arcsinXPolyEval_q & lowRangeB_uid411_arcsinXPolyEval_b;

	--fxpArcsinX_uid100_asinX_uid8_fpArcsinPiTest(BITSELECT,99)@30
    fxpArcsinX_uid100_asinX_uid8_fpArcsinPiTest_in <= s2_uid411_uid414_arcsinXPolyEval_q(30 downto 0);
    fxpArcsinX_uid100_asinX_uid8_fpArcsinPiTest_b <= fxpArcsinX_uid100_asinX_uid8_fpArcsinPiTest_in(30 downto 3);

	--reg_fxpArcsinX_uid100_asinX_uid8_fpArcsinPiTest_0_to_path3Diff_uid102_asinX_uid8_fpArcsinPiTest_1(REG,510)@30
    reg_fxpArcsinX_uid100_asinX_uid8_fpArcsinPiTest_0_to_path3Diff_uid102_asinX_uid8_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpArcsinX_uid100_asinX_uid8_fpArcsinPiTest_0_to_path3Diff_uid102_asinX_uid8_fpArcsinPiTest_1_q <= "0000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpArcsinX_uid100_asinX_uid8_fpArcsinPiTest_0_to_path3Diff_uid102_asinX_uid8_fpArcsinPiTest_1_q <= fxpArcsinX_uid100_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--piO2_uid101_asinX_uid8_fpArcsinPiTest(CONSTANT,100)
    piO2_uid101_asinX_uid8_fpArcsinPiTest_q <= "1100100100001111110110101010";

	--path3Diff_uid102_asinX_uid8_fpArcsinPiTest(SUB,101)@31
    path3Diff_uid102_asinX_uid8_fpArcsinPiTest_a <= STD_LOGIC_VECTOR("0" & piO2_uid101_asinX_uid8_fpArcsinPiTest_q);
    path3Diff_uid102_asinX_uid8_fpArcsinPiTest_b <= STD_LOGIC_VECTOR("0" & reg_fxpArcsinX_uid100_asinX_uid8_fpArcsinPiTest_0_to_path3Diff_uid102_asinX_uid8_fpArcsinPiTest_1_q);
            path3Diff_uid102_asinX_uid8_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path3Diff_uid102_asinX_uid8_fpArcsinPiTest_a) - UNSIGNED(path3Diff_uid102_asinX_uid8_fpArcsinPiTest_b));
    path3Diff_uid102_asinX_uid8_fpArcsinPiTest_q <= path3Diff_uid102_asinX_uid8_fpArcsinPiTest_o(28 downto 0);


	--normBitPath3Diff_uid103_asinX_uid8_fpArcsinPiTest(BITSELECT,102)@31
    normBitPath3Diff_uid103_asinX_uid8_fpArcsinPiTest_in <= path3Diff_uid102_asinX_uid8_fpArcsinPiTest_q(27 downto 0);
    normBitPath3Diff_uid103_asinX_uid8_fpArcsinPiTest_b <= normBitPath3Diff_uid103_asinX_uid8_fpArcsinPiTest_in(27 downto 27);

	--expRPath3_uid107_asinX_uid8_fpArcsinPiTest(MUX,106)@31
    expRPath3_uid107_asinX_uid8_fpArcsinPiTest_s <= normBitPath3Diff_uid103_asinX_uid8_fpArcsinPiTest_b;
    expRPath3_uid107_asinX_uid8_fpArcsinPiTest: PROCESS (expRPath3_uid107_asinX_uid8_fpArcsinPiTest_s, en, cstBiasM1_uid23_asinX_uid8_fpArcsinPiTest_q, cstBias_uid22_asinX_uid8_fpArcsinPiTest_q)
    BEGIN
            CASE expRPath3_uid107_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "0" => expRPath3_uid107_asinX_uid8_fpArcsinPiTest_q <= cstBiasM1_uid23_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "1" => expRPath3_uid107_asinX_uid8_fpArcsinPiTest_q <= cstBias_uid22_asinX_uid8_fpArcsinPiTest_q;
                  WHEN OTHERS => expRPath3_uid107_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--path3DiffHigh_uid104_asinX_uid8_fpArcsinPiTest(BITSELECT,103)@31
    path3DiffHigh_uid104_asinX_uid8_fpArcsinPiTest_in <= path3Diff_uid102_asinX_uid8_fpArcsinPiTest_q(26 downto 0);
    path3DiffHigh_uid104_asinX_uid8_fpArcsinPiTest_b <= path3DiffHigh_uid104_asinX_uid8_fpArcsinPiTest_in(26 downto 3);

	--path3DiffLow_uid105_asinX_uid8_fpArcsinPiTest(BITSELECT,104)@31
    path3DiffLow_uid105_asinX_uid8_fpArcsinPiTest_in <= path3Diff_uid102_asinX_uid8_fpArcsinPiTest_q(25 downto 0);
    path3DiffLow_uid105_asinX_uid8_fpArcsinPiTest_b <= path3DiffLow_uid105_asinX_uid8_fpArcsinPiTest_in(25 downto 2);

	--fracRPath3_uid106_asinX_uid8_fpArcsinPiTest(MUX,105)@31
    fracRPath3_uid106_asinX_uid8_fpArcsinPiTest_s <= normBitPath3Diff_uid103_asinX_uid8_fpArcsinPiTest_b;
    fracRPath3_uid106_asinX_uid8_fpArcsinPiTest: PROCESS (fracRPath3_uid106_asinX_uid8_fpArcsinPiTest_s, en, path3DiffLow_uid105_asinX_uid8_fpArcsinPiTest_b, path3DiffHigh_uid104_asinX_uid8_fpArcsinPiTest_b)
    BEGIN
            CASE fracRPath3_uid106_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "0" => fracRPath3_uid106_asinX_uid8_fpArcsinPiTest_q <= path3DiffLow_uid105_asinX_uid8_fpArcsinPiTest_b;
                  WHEN "1" => fracRPath3_uid106_asinX_uid8_fpArcsinPiTest_q <= path3DiffHigh_uid104_asinX_uid8_fpArcsinPiTest_b;
                  WHEN OTHERS => fracRPath3_uid106_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracConc_uid108_uid108_asinX_uid8_fpArcsinPiTest(BITJOIN,107)@31
    expFracConc_uid108_uid108_asinX_uid8_fpArcsinPiTest_q <= expRPath3_uid107_asinX_uid8_fpArcsinPiTest_q & fracRPath3_uid106_asinX_uid8_fpArcsinPiTest_q;

	--reg_expFracConc_uid108_uid108_asinX_uid8_fpArcsinPiTest_0_to_expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_0(REG,511)@31
    reg_expFracConc_uid108_uid108_asinX_uid8_fpArcsinPiTest_0_to_expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracConc_uid108_uid108_asinX_uid8_fpArcsinPiTest_0_to_expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_0_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracConc_uid108_uid108_asinX_uid8_fpArcsinPiTest_0_to_expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_0_q <= expFracConc_uid108_uid108_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest(ADD,108)@32
    expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_a <= STD_LOGIC_VECTOR("0" & reg_expFracConc_uid108_uid108_asinX_uid8_fpArcsinPiTest_0_to_expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_0_q);
    expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & VCC_q);
            expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_a) + UNSIGNED(expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_b));
    expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_q <= expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_o(32 downto 0);


	--expRPath3_uid111_asinX_uid8_fpArcsinPiTest(BITSELECT,110)@32
    expRPath3_uid111_asinX_uid8_fpArcsinPiTest_in <= expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_q(31 downto 0);
    expRPath3_uid111_asinX_uid8_fpArcsinPiTest_b <= expRPath3_uid111_asinX_uid8_fpArcsinPiTest_in(31 downto 24);

	--ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_nor(LOGICAL,1124)
    ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_nor_b <= ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_sticky_ena_q;
    ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_nor_q <= not (ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_nor_a or ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_nor_b);

	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_mem_top(CONSTANT,1056)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_mem_top_q <= "01101";

	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmp(LOGICAL,1057)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmp_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_mem_top_q;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_q);
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmp_q <= "1" when ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmp_a = ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmp_b else "0";

	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmpReg(REG,1058)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmpReg_q <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_sticky_ena(REG,1125)
    ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_nor_q = "1") THEN
                ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_sticky_ena_q <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_enaAnd(LOGICAL,1126)
    ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_enaAnd_a <= ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_sticky_ena_q;
    ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_enaAnd_b <= en;
    ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_enaAnd_q <= ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_enaAnd_a and ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_enaAnd_b;

	--yAddr_uid63_asinX_uid8_fpArcsinPiTest(BITSELECT,62)@1
    yAddr_uid63_asinX_uid8_fpArcsinPiTest_in <= y_uid59_asinX_uid8_fpArcsinPiTest_b;
    yAddr_uid63_asinX_uid8_fpArcsinPiTest_b <= yAddr_uid63_asinX_uid8_fpArcsinPiTest_in(34 downto 27);

	--reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid255_arcsinXO2XTabGen_lutmem_0(REG,464)@1
    reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid255_arcsinXO2XTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid255_arcsinXO2XTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid255_arcsinXO2XTabGen_lutmem_0_q <= yAddr_uid63_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid255_arcsinXO2XTabGen_lutmem(DUALMEM,451)@2
    memoryC2_uid255_arcsinXO2XTabGen_lutmem_reset0 <= areset;
    memoryC2_uid255_arcsinXO2XTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid255_arcsinXO2XTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid255_arcsinXO2XTabGen_lutmem_ab <= reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid255_arcsinXO2XTabGen_lutmem_0_q;
    memoryC2_uid255_arcsinXO2XTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
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
        init_file => "fp_arcsinpi_s5_memoryC2_uid255_arcsinXO2XTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid255_arcsinXO2XTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid255_arcsinXO2XTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid255_arcsinXO2XTabGen_lutmem_iq,
        address_a => memoryC2_uid255_arcsinXO2XTabGen_lutmem_aa,
        data_a => memoryC2_uid255_arcsinXO2XTabGen_lutmem_ia
    );
        memoryC2_uid255_arcsinXO2XTabGen_lutmem_q <= memoryC2_uid255_arcsinXO2XTabGen_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid255_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_1(REG,466)@4
    reg_memoryC2_uid255_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid255_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid255_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_1_q <= memoryC2_uid255_arcsinXO2XTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest(BITSELECT,63)@1
    yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_in <= y_uid59_asinX_uid8_fpArcsinPiTest_b(26 downto 0);
    yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_b <= yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_in(26 downto 9);

	--yT1_uid256_arcsinXO2XPolyEval(BITSELECT,255)@1
    yT1_uid256_arcsinXO2XPolyEval_in <= yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_b;
    yT1_uid256_arcsinXO2XPolyEval_b <= yT1_uid256_arcsinXO2XPolyEval_in(17 downto 6);

	--ld_yT1_uid256_arcsinXO2XPolyEval_b_to_reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0_a_inputreg(DELAY,1218)
    ld_yT1_uid256_arcsinXO2XPolyEval_b_to_reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 12, depth => 1 )
    PORT MAP ( xin => yT1_uid256_arcsinXO2XPolyEval_b, xout => ld_yT1_uid256_arcsinXO2XPolyEval_b_to_reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yT1_uid256_arcsinXO2XPolyEval_b_to_reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0_a(DELAY,992)@1
    ld_yT1_uid256_arcsinXO2XPolyEval_b_to_reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0_a : dspba_delay
    GENERIC MAP ( width => 12, depth => 2 )
    PORT MAP ( xin => ld_yT1_uid256_arcsinXO2XPolyEval_b_to_reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0_a_inputreg_q, xout => ld_yT1_uid256_arcsinXO2XPolyEval_b_to_reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0(REG,465)@4
    reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0_q <= ld_yT1_uid256_arcsinXO2XPolyEval_b_to_reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval(MULT,415)@5
    prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_a),13)) * SIGNED(prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_b);
    prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_a <= (others => '0');
            prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_b <= (others => '0');
            prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_a <= reg_yT1_uid256_arcsinXO2XPolyEval_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_0_q;
                prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_b <= reg_memoryC2_uid255_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_1_q;
                prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_q <= prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid417_pT1_uid257_arcsinXO2XPolyEval(BITSELECT,416)@8
    prodXYTruncFR_uid417_pT1_uid257_arcsinXO2XPolyEval_in <= prodXY_uid416_pT1_uid257_arcsinXO2XPolyEval_q;
    prodXYTruncFR_uid417_pT1_uid257_arcsinXO2XPolyEval_b <= prodXYTruncFR_uid417_pT1_uid257_arcsinXO2XPolyEval_in(23 downto 11);

	--highBBits_uid259_arcsinXO2XPolyEval(BITSELECT,258)@8
    highBBits_uid259_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid417_pT1_uid257_arcsinXO2XPolyEval_b;
    highBBits_uid259_arcsinXO2XPolyEval_b <= highBBits_uid259_arcsinXO2XPolyEval_in(12 downto 1);

	--ld_yAddr_uid63_asinX_uid8_fpArcsinPiTest_b_to_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0_a_inputreg(DELAY,1219)
    ld_yAddr_uid63_asinX_uid8_fpArcsinPiTest_b_to_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => yAddr_uid63_asinX_uid8_fpArcsinPiTest_b, xout => ld_yAddr_uid63_asinX_uid8_fpArcsinPiTest_b_to_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yAddr_uid63_asinX_uid8_fpArcsinPiTest_b_to_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0_a(DELAY,994)@1
    ld_yAddr_uid63_asinX_uid8_fpArcsinPiTest_b_to_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => ld_yAddr_uid63_asinX_uid8_fpArcsinPiTest_b_to_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0_a_inputreg_q, xout => ld_yAddr_uid63_asinX_uid8_fpArcsinPiTest_b_to_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0(REG,467)@5
    reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0_q <= ld_yAddr_uid63_asinX_uid8_fpArcsinPiTest_b_to_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid254_arcsinXO2XTabGen_lutmem(DUALMEM,450)@6
    memoryC1_uid254_arcsinXO2XTabGen_lutmem_reset0 <= areset;
    memoryC1_uid254_arcsinXO2XTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid254_arcsinXO2XTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid254_arcsinXO2XTabGen_lutmem_ab <= reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC1_uid254_arcsinXO2XTabGen_lutmem_0_q;
    memoryC1_uid254_arcsinXO2XTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 19,
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
        init_file => "fp_arcsinpi_s5_memoryC1_uid254_arcsinXO2XTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid254_arcsinXO2XTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid254_arcsinXO2XTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid254_arcsinXO2XTabGen_lutmem_iq,
        address_a => memoryC1_uid254_arcsinXO2XTabGen_lutmem_aa,
        data_a => memoryC1_uid254_arcsinXO2XTabGen_lutmem_ia
    );
        memoryC1_uid254_arcsinXO2XTabGen_lutmem_q <= memoryC1_uid254_arcsinXO2XTabGen_lutmem_iq(18 downto 0);

	--sumAHighB_uid260_arcsinXO2XPolyEval(ADD,259)@8
    sumAHighB_uid260_arcsinXO2XPolyEval_a <= STD_LOGIC_VECTOR((19 downto 19 => memoryC1_uid254_arcsinXO2XTabGen_lutmem_q(18)) & memoryC1_uid254_arcsinXO2XTabGen_lutmem_q);
    sumAHighB_uid260_arcsinXO2XPolyEval_b <= STD_LOGIC_VECTOR((19 downto 12 => highBBits_uid259_arcsinXO2XPolyEval_b(11)) & highBBits_uid259_arcsinXO2XPolyEval_b);
            sumAHighB_uid260_arcsinXO2XPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid260_arcsinXO2XPolyEval_a) + SIGNED(sumAHighB_uid260_arcsinXO2XPolyEval_b));
    sumAHighB_uid260_arcsinXO2XPolyEval_q <= sumAHighB_uid260_arcsinXO2XPolyEval_o(19 downto 0);


	--lowRangeB_uid258_arcsinXO2XPolyEval(BITSELECT,257)@8
    lowRangeB_uid258_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid417_pT1_uid257_arcsinXO2XPolyEval_b(0 downto 0);
    lowRangeB_uid258_arcsinXO2XPolyEval_b <= lowRangeB_uid258_arcsinXO2XPolyEval_in(0 downto 0);

	--s1_uid258_uid261_arcsinXO2XPolyEval(BITJOIN,260)@8
    s1_uid258_uid261_arcsinXO2XPolyEval_q <= sumAHighB_uid260_arcsinXO2XPolyEval_q & lowRangeB_uid258_arcsinXO2XPolyEval_b;

	--reg_s1_uid258_uid261_arcsinXO2XPolyEval_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_1(REG,469)@8
    reg_s1_uid258_uid261_arcsinXO2XPolyEval_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid258_uid261_arcsinXO2XPolyEval_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_1_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid258_uid261_arcsinXO2XPolyEval_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_1_q <= s1_uid258_uid261_arcsinXO2XPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_nor(LOGICAL,1188)
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_nor_b <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_nor_q <= not (ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_nor_a or ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_nor_b);

	--ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_sticky_ena(REG,1189)
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_nor_q = "1") THEN
                ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_sticky_ena_q <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_enaAnd(LOGICAL,1190)
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_enaAnd_a <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_enaAnd_b <= en;
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_enaAnd_q <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_enaAnd_a and ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_enaAnd_b;

	--reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0(REG,468)@1
    reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q <= yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem(DUALMEM,1179)
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_reset0 <= areset;
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_ia <= reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q;
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_aa <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdreg_q;
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_ab <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux_q;
    ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 18,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 18,
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
        clocken1 => ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_iq,
        address_a => ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_aa,
        data_a => ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_ia
    );
        ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_q <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_iq(17 downto 0);

	--prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval(MULT,418)@9
    prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a),19)) * SIGNED(prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_b);
    prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a <= (others => '0');
            prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_b <= (others => '0');
            prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_mem_q;
                prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_b <= reg_s1_uid258_uid261_arcsinXO2XPolyEval_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_1_q;
                prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_q <= prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid420_pT2_uid263_arcsinXO2XPolyEval(BITSELECT,419)@12
    prodXYTruncFR_uid420_pT2_uid263_arcsinXO2XPolyEval_in <= prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_q;
    prodXYTruncFR_uid420_pT2_uid263_arcsinXO2XPolyEval_b <= prodXYTruncFR_uid420_pT2_uid263_arcsinXO2XPolyEval_in(38 downto 17);

	--highBBits_uid265_arcsinXO2XPolyEval(BITSELECT,264)@12
    highBBits_uid265_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid420_pT2_uid263_arcsinXO2XPolyEval_b;
    highBBits_uid265_arcsinXO2XPolyEval_b <= highBBits_uid265_arcsinXO2XPolyEval_in(21 downto 2);

	--ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_nor(LOGICAL,1213)
    ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_nor_b <= ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_sticky_ena_q;
    ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_nor_q <= not (ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_nor_a or ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_nor_b);

	--ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_sticky_ena(REG,1214)
    ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_nor_q = "1") THEN
                ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_sticky_ena_q <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_enaAnd(LOGICAL,1215)
    ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_enaAnd_a <= ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_sticky_ena_q;
    ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_enaAnd_b <= en;
    ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_enaAnd_q <= ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_enaAnd_a and ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_enaAnd_b;

	--ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem(DUALMEM,1204)
    ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_reset0 <= areset;
    ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_ia <= reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC2_uid255_arcsinXO2XTabGen_lutmem_0_q;
    ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_aa <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdreg_q;
    ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_ab <= ld_reg_yPPolyEval_uid64_asinX_uid8_fpArcsinPiTest_0_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_0_q_to_prodXY_uid419_pT2_uid263_arcsinXO2XPolyEval_a_replace_rdmux_q;
    ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 8,
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
        clocken1 => ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_iq,
        address_a => ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_aa,
        data_a => ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_ia
    );
        ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_q <= ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_iq(7 downto 0);

	--ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_outputreg(DELAY,1203)
    ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_replace_mem_q, xout => ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC0_uid253_arcsinXO2XTabGen_lutmem(DUALMEM,449)@10
    memoryC0_uid253_arcsinXO2XTabGen_lutmem_reset0 <= areset;
    memoryC0_uid253_arcsinXO2XTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid253_arcsinXO2XTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid253_arcsinXO2XTabGen_lutmem_ab <= ld_reg_yAddr_uid63_asinX_uid8_fpArcsinPiTest_0_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_0_q_to_memoryC0_uid253_arcsinXO2XTabGen_lutmem_a_outputreg_q;
    memoryC0_uid253_arcsinXO2XTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 30,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 30,
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
        init_file => "fp_arcsinpi_s5_memoryC0_uid253_arcsinXO2XTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid253_arcsinXO2XTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid253_arcsinXO2XTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid253_arcsinXO2XTabGen_lutmem_iq,
        address_a => memoryC0_uid253_arcsinXO2XTabGen_lutmem_aa,
        data_a => memoryC0_uid253_arcsinXO2XTabGen_lutmem_ia
    );
        memoryC0_uid253_arcsinXO2XTabGen_lutmem_q <= memoryC0_uid253_arcsinXO2XTabGen_lutmem_iq(29 downto 0);

	--sumAHighB_uid266_arcsinXO2XPolyEval(ADD,265)@12
    sumAHighB_uid266_arcsinXO2XPolyEval_a <= STD_LOGIC_VECTOR((30 downto 30 => memoryC0_uid253_arcsinXO2XTabGen_lutmem_q(29)) & memoryC0_uid253_arcsinXO2XTabGen_lutmem_q);
    sumAHighB_uid266_arcsinXO2XPolyEval_b <= STD_LOGIC_VECTOR((30 downto 20 => highBBits_uid265_arcsinXO2XPolyEval_b(19)) & highBBits_uid265_arcsinXO2XPolyEval_b);
            sumAHighB_uid266_arcsinXO2XPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid266_arcsinXO2XPolyEval_a) + SIGNED(sumAHighB_uid266_arcsinXO2XPolyEval_b));
    sumAHighB_uid266_arcsinXO2XPolyEval_q <= sumAHighB_uid266_arcsinXO2XPolyEval_o(30 downto 0);


	--lowRangeB_uid264_arcsinXO2XPolyEval(BITSELECT,263)@12
    lowRangeB_uid264_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid420_pT2_uid263_arcsinXO2XPolyEval_b(1 downto 0);
    lowRangeB_uid264_arcsinXO2XPolyEval_b <= lowRangeB_uid264_arcsinXO2XPolyEval_in(1 downto 0);

	--s2_uid264_uid267_arcsinXO2XPolyEval(BITJOIN,266)@12
    s2_uid264_uid267_arcsinXO2XPolyEval_q <= sumAHighB_uid266_arcsinXO2XPolyEval_q & lowRangeB_uid264_arcsinXO2XPolyEval_b;

	--fxpArcSinXO2XRes_uid66_asinX_uid8_fpArcsinPiTest(BITSELECT,65)@12
    fxpArcSinXO2XRes_uid66_asinX_uid8_fpArcsinPiTest_in <= s2_uid264_uid267_arcsinXO2XPolyEval_q(30 downto 0);
    fxpArcSinXO2XRes_uid66_asinX_uid8_fpArcsinPiTest_b <= fxpArcSinXO2XRes_uid66_asinX_uid8_fpArcsinPiTest_in(30 downto 5);

	--reg_fxpArcSinXO2XRes_uid66_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_1(REG,472)@12
    reg_fxpArcSinXO2XRes_uid66_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpArcSinXO2XRes_uid66_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpArcSinXO2XRes_uid66_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_1_q <= fxpArcSinXO2XRes_uid66_asinX_uid8_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_nor(LOGICAL,1229)
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_nor_b <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_sticky_ena_q;
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_nor_q <= not (ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_nor_a or ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_nor_b);

	--ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_mem_top(CONSTANT,1225)
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_mem_top_q <= "01010";

	--ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmp(LOGICAL,1226)
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmp_a <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_mem_top_q;
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdmux_q);
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmp_q <= "1" when ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmp_a = ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmp_b else "0";

	--ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmpReg(REG,1227)
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmpReg_q <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_sticky_ena(REG,1230)
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_nor_q = "1") THEN
                ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_sticky_ena_q <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_enaAnd(LOGICAL,1231)
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_enaAnd_a <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_sticky_ena_q;
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_enaAnd_b <= en;
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_enaAnd_q <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_enaAnd_a and ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_enaAnd_b;

	--ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt(COUNTER,1221)
    -- every=1, low=0, high=10, step=1, init=1
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_i = 9 THEN
                      ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_eq = '1') THEN
                        ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_i <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_i - 10;
                    ELSE
                        ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_i <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_i,4));


	--ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdreg(REG,1222)
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdreg_q <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdmux(MUX,1223)
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdmux_s <= en;
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdmux: PROCESS (ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdmux_s, ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdreg_q, ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdmux_q <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdreg_q;
                  WHEN "1" => ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdmux_q <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem(DUALMEM,1220)
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_reset0 <= areset;
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_ia <= oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q;
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_aa <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdreg_q;
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_ab <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_rdmux_q;
    ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 24,
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
        clocken1 => ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_iq,
        address_a => ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_aa,
        data_a => ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_ia
    );
        ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_q <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_iq(23 downto 0);

	--reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0(REG,471)@12
    reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_q <= ld_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_q_to_reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest(MULT,66)@13
    mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_pr <= UNSIGNED(mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_a) * UNSIGNED(mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_b);
    mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_a <= (others => '0');
            mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_b <= (others => '0');
            mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_a <= reg_oFracX_uid49_uid49_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_0_q;
                mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_b <= reg_fxpArcSinXO2XRes_uid66_asinX_uid8_fpArcsinPiTest_0_to_mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_1_q;
                mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_s1 <= STD_LOGIC_VECTOR(mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_pr);
            END IF;
        END IF;
    END PROCESS;
    mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_q <= mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normBitPath2_uid68_asinX_uid8_fpArcsinPiTest(BITSELECT,67)@16
    normBitPath2_uid68_asinX_uid8_fpArcsinPiTest_in <= mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_q;
    normBitPath2_uid68_asinX_uid8_fpArcsinPiTest_b <= normBitPath2_uid68_asinX_uid8_fpArcsinPiTest_in(49 downto 49);

	--add_normUpdate_uid72_fracRPath2PreUlp_uid72_uid72_uid73_asinX_uid8_fpArcsinPiTest(BITJOIN,72)@16
    add_normUpdate_uid72_fracRPath2PreUlp_uid72_uid72_uid73_asinX_uid8_fpArcsinPiTest_q <= normBitPath2_uid68_asinX_uid8_fpArcsinPiTest_b & cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q & VCC_q;

	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_nor(LOGICAL,1060)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_nor_b <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_sticky_ena_q;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_nor_q <= not (ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_nor_a or ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_nor_b);

	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_sticky_ena(REG,1061)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_nor_q = "1") THEN
                ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_sticky_ena_q <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_enaAnd(LOGICAL,1062)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_enaAnd_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_sticky_ena_q;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_enaAnd_b <= en;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_enaAnd_q <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_enaAnd_a and ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_enaAnd_b;

	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem(DUALMEM,1051)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_reset0 <= areset;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_ia <= expX_uid15_asinX_uid8_fpArcsinPiTest_b;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_aa <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdreg_q;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_ab <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_q;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 14,
        width_b => 8,
        widthad_b => 4,
        numwords_b => 14,
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
        clocken1 => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_iq,
        address_a => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_aa,
        data_a => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_ia
    );
        ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_q <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_iq(7 downto 0);

	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_outputreg(DELAY,1050)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_mem_q, xout => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPath2High_uid69_asinX_uid8_fpArcsinPiTest(BITSELECT,68)@16
    fracRPath2High_uid69_asinX_uid8_fpArcsinPiTest_in <= mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_q(48 downto 0);
    fracRPath2High_uid69_asinX_uid8_fpArcsinPiTest_b <= fracRPath2High_uid69_asinX_uid8_fpArcsinPiTest_in(48 downto 25);

	--fracRPath2Low_uid70_asinX_uid8_fpArcsinPiTest(BITSELECT,69)@16
    fracRPath2Low_uid70_asinX_uid8_fpArcsinPiTest_in <= mul2XArcsinXO2XRes_uid67_asinX_uid8_fpArcsinPiTest_q(47 downto 0);
    fracRPath2Low_uid70_asinX_uid8_fpArcsinPiTest_b <= fracRPath2Low_uid70_asinX_uid8_fpArcsinPiTest_in(47 downto 24);

	--fracRPath2Pre_uid71_asinX_uid8_fpArcsinPiTest(MUX,70)@16
    fracRPath2Pre_uid71_asinX_uid8_fpArcsinPiTest_s <= normBitPath2_uid68_asinX_uid8_fpArcsinPiTest_b;
    fracRPath2Pre_uid71_asinX_uid8_fpArcsinPiTest: PROCESS (fracRPath2Pre_uid71_asinX_uid8_fpArcsinPiTest_s, en, fracRPath2Low_uid70_asinX_uid8_fpArcsinPiTest_b, fracRPath2High_uid69_asinX_uid8_fpArcsinPiTest_b)
    BEGIN
            CASE fracRPath2Pre_uid71_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "0" => fracRPath2Pre_uid71_asinX_uid8_fpArcsinPiTest_q <= fracRPath2Low_uid70_asinX_uid8_fpArcsinPiTest_b;
                  WHEN "1" => fracRPath2Pre_uid71_asinX_uid8_fpArcsinPiTest_q <= fracRPath2High_uid69_asinX_uid8_fpArcsinPiTest_b;
                  WHEN OTHERS => fracRPath2Pre_uid71_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest(BITJOIN,73)@16
    expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_q <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_outputreg_q & fracRPath2Pre_uid71_asinX_uid8_fpArcsinPiTest_q;

	--expFracRPath2PostRnd_uid75_asinX_uid8_fpArcsinPiTest(ADD,74)@16
    expFracRPath2PostRnd_uid75_asinX_uid8_fpArcsinPiTest_a <= STD_LOGIC_VECTOR("0" & expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_q);
    expFracRPath2PostRnd_uid75_asinX_uid8_fpArcsinPiTest_b <= STD_LOGIC_VECTOR("00000000" & add_normUpdate_uid72_fracRPath2PreUlp_uid72_uid72_uid73_asinX_uid8_fpArcsinPiTest_q);
            expFracRPath2PostRnd_uid75_asinX_uid8_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPath2PostRnd_uid75_asinX_uid8_fpArcsinPiTest_a) + UNSIGNED(expFracRPath2PostRnd_uid75_asinX_uid8_fpArcsinPiTest_b));
    expFracRPath2PostRnd_uid75_asinX_uid8_fpArcsinPiTest_q <= expFracRPath2PostRnd_uid75_asinX_uid8_fpArcsinPiTest_o(32 downto 0);


	--expRPath2_uid77_asinX_uid8_fpArcsinPiTest(BITSELECT,76)@16
    expRPath2_uid77_asinX_uid8_fpArcsinPiTest_in <= expFracRPath2PostRnd_uid75_asinX_uid8_fpArcsinPiTest_q(31 downto 0);
    expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b <= expRPath2_uid77_asinX_uid8_fpArcsinPiTest_in(31 downto 24);

	--ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_inputreg(DELAY,1114)
    ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b, xout => ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt(COUNTER,1052)
    -- every=1, low=0, high=13, step=1, init=1
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i = 12 THEN
                      ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_eq = '1') THEN
                        ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i - 13;
                    ELSE
                        ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_i,4));


	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdreg(REG,1053)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdreg_q <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdmux(MUX,1054)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_s <= en;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdmux: PROCESS (ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_s, ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdreg_q, ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_q <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_q <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem(DUALMEM,1115)
    ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_reset0 <= areset;
    ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_ia <= ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_inputreg_q;
    ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_aa <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdreg_q;
    ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_ab <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_q;
    ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 14,
        width_b => 8,
        widthad_b => 4,
        numwords_b => 14,
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
        clocken1 => ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_iq,
        address_a => ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_aa,
        data_a => ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_ia
    );
        ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_q <= ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_iq(7 downto 0);

	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_nor(LOGICAL,1111)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_nor_b <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_sticky_ena_q;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_nor_q <= not (ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_nor_a or ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_nor_b);

	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_sticky_ena(REG,1112)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_nor_q = "1") THEN
                ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_sticky_ena_q <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_enaAnd(LOGICAL,1113)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_enaAnd_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_sticky_ena_q;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_enaAnd_b <= en;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_enaAnd_q <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_enaAnd_a and ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_enaAnd_b;

	--ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem(DUALMEM,1102)
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_reset0 <= areset;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_ia <= expX_uid15_asinX_uid8_fpArcsinPiTest_b;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_aa <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdreg_q;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_ab <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdmux_q;
    ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 31,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 31,
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
        clocken1 => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_iq,
        address_a => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_aa,
        data_a => ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_ia
    );
        ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_q <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_iq(7 downto 0);

	--ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_nor(LOGICAL,1074)
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_nor_b <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_sticky_ena_q;
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_nor_q <= not (ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_nor_a or ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_nor_b);

	--ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_mem_top(CONSTANT,1070)
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_mem_top_q <= "011100";

	--ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmp(LOGICAL,1071)
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmp_a <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_mem_top_q;
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdmux_q);
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmp_q <= "1" when ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmp_a = ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmp_b else "0";

	--ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmpReg(REG,1072)
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmpReg_q <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_sticky_ena(REG,1075)
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_nor_q = "1") THEN
                ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_sticky_ena_q <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_enaAnd(LOGICAL,1076)
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_enaAnd_a <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_sticky_ena_q;
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_enaAnd_b <= en;
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_enaAnd_q <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_enaAnd_a and ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_enaAnd_b;

	--arcsinIsMax_uid58_asinX_uid8_fpArcsinPiTest(BITSELECT,57)@1
    arcsinIsMax_uid58_asinX_uid8_fpArcsinPiTest_in <= leftShiftStage1_uid251_fxpX_uid57_asinX_uid8_fpArcsinPiTest_q;
    arcsinIsMax_uid58_asinX_uid8_fpArcsinPiTest_b <= arcsinIsMax_uid58_asinX_uid8_fpArcsinPiTest_in(36 downto 36);

	--biasMwShift_uid50_asinX_uid8_fpArcsinPiTest(CONSTANT,49)
    biasMwShift_uid50_asinX_uid8_fpArcsinPiTest_q <= "01110011";

	--arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest(COMPARE,50)@0
    arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_cin <= GND_q;
    arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_a <= STD_LOGIC_VECTOR("00" & biasMwShift_uid50_asinX_uid8_fpArcsinPiTest_q) & '0';
    arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_b <= STD_LOGIC_VECTOR("00" & expX_uid15_asinX_uid8_fpArcsinPiTest_b) & arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_cin(0);
    arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_a) - UNSIGNED(arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_n(0) <= not arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_o(10);


	--Y34_uid60_asinX_uid8_fpArcsinPiTest(BITSELECT,59)@1
    Y34_uid60_asinX_uid8_fpArcsinPiTest_in <= y_uid59_asinX_uid8_fpArcsinPiTest_b;
    Y34_uid60_asinX_uid8_fpArcsinPiTest_b <= Y34_uid60_asinX_uid8_fpArcsinPiTest_in(34 downto 34);

	--path2_uid61_asinX_uid8_fpArcsinPiTest(LOGICAL,60)@1
    path2_uid61_asinX_uid8_fpArcsinPiTest_a <= Y34_uid60_asinX_uid8_fpArcsinPiTest_b;
    path2_uid61_asinX_uid8_fpArcsinPiTest_q <= not path2_uid61_asinX_uid8_fpArcsinPiTest_a;

	--pathSelBits_uid112_asinX_uid8_fpArcsinPiTest(BITJOIN,111)@1
    pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q <= arcsinIsMax_uid58_asinX_uid8_fpArcsinPiTest_b & arcsinXIsX_uid51_asinX_uid8_fpArcsinPiTest_n & path2_uid61_asinX_uid8_fpArcsinPiTest_q;

	--ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_inputreg(DELAY,1064)
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q, xout => ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt(COUNTER,1066)
    -- every=1, low=0, high=28, step=1, init=1
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_i = 27 THEN
                      ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_eq = '1') THEN
                        ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_i <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_i - 28;
                    ELSE
                        ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_i <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_i,5));


	--ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdreg(REG,1067)
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdreg_q <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdmux(MUX,1068)
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdmux_s <= en;
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdmux: PROCESS (ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdmux_s, ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdreg_q, ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdmux_q <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdmux_q <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem(DUALMEM,1065)
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_reset0 <= areset;
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_ia <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_inputreg_q;
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_aa <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdreg_q;
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_ab <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdmux_q;
    ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 5,
        numwords_a => 29,
        width_b => 3,
        widthad_b => 5,
        numwords_b => 29,
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
        clocken1 => ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_iq,
        address_a => ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_aa,
        data_a => ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_ia
    );
        ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_q <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_iq(2 downto 0);

	--fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest(LOOKUP,112)@32
    fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest: PROCESS (ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_mem_q) IS
                WHEN "000" =>  fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_q <= "11";
                WHEN "001" =>  fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_q <= "10";
                WHEN "010" =>  fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_q <= "01";
                WHEN "011" =>  fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_q <= "01";
                WHEN "100" =>  fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_q <= "00";
                WHEN "101" =>  fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_q <= "00";
                WHEN "110" =>  fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_q <= "01";
                WHEN "111" =>  fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_q <= "01";
                WHEN OTHERS =>
                    fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRCalc_uid117_asinX_uid8_fpArcsinPiTest(MUX,116)@32
    expRCalc_uid117_asinX_uid8_fpArcsinPiTest_s <= fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_q;
    expRCalc_uid117_asinX_uid8_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRCalc_uid117_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRCalc_uid117_asinX_uid8_fpArcsinPiTest_s IS
                      WHEN "00" => expRCalc_uid117_asinX_uid8_fpArcsinPiTest_q <= cstBias_uid22_asinX_uid8_fpArcsinPiTest_q;
                      WHEN "01" => expRCalc_uid117_asinX_uid8_fpArcsinPiTest_q <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_d_replace_mem_q;
                      WHEN "10" => expRCalc_uid117_asinX_uid8_fpArcsinPiTest_q <= ld_expRPath2_uid77_asinX_uid8_fpArcsinPiTest_b_to_expRCalc_uid117_asinX_uid8_fpArcsinPiTest_e_replace_mem_q;
                      WHEN "11" => expRCalc_uid117_asinX_uid8_fpArcsinPiTest_q <= expRPath3_uid111_asinX_uid8_fpArcsinPiTest_b;
                      WHEN OTHERS => expRCalc_uid117_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_nor(LOGICAL,1150)
    ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_nor_b <= ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_sticky_ena_q;
    ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_nor_q <= not (ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_nor_a or ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_nor_b);

	--ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_sticky_ena(REG,1151)
    ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_nor_q = "1") THEN
                ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_sticky_ena_q <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_enaAnd(LOGICAL,1152)
    ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_enaAnd_a <= ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_sticky_ena_q;
    ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_enaAnd_b <= en;
    ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_enaAnd_q <= ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_enaAnd_a and ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_enaAnd_b;

	--ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_inputreg(DELAY,1140)
    ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q, xout => ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem(DUALMEM,1141)
    ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_reset0 <= areset;
    ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_ia <= ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_inputreg_q;
    ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_aa <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdreg_q;
    ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_ab <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdmux_q;
    ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 29,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 29,
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
        clocken1 => ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_iq,
        address_a => ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_aa,
        data_a => ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_ia
    );
        ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_q <= ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_iq(0 downto 0);

	--ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_nor(LOGICAL,1137)
    ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_nor_b <= ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_sticky_ena_q;
    ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_nor_q <= not (ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_nor_a or ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_nor_b);

	--ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_sticky_ena(REG,1138)
    ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_nor_q = "1") THEN
                ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_sticky_ena_q <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_enaAnd(LOGICAL,1139)
    ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_enaAnd_a <= ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_sticky_ena_q;
    ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_enaAnd_b <= en;
    ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_enaAnd_q <= ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_enaAnd_a and ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_enaAnd_b;

	--ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_inputreg(DELAY,1127)
    ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q, xout => ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem(DUALMEM,1128)
    ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_reset0 <= areset;
    ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_ia <= ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_inputreg_q;
    ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_aa <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdreg_q;
    ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_ab <= ld_pathSelBits_uid112_asinX_uid8_fpArcsinPiTest_q_to_fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_a_replace_rdmux_q;
    ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 29,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 29,
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
        clocken1 => ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_iq,
        address_a => ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_aa,
        data_a => ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_ia
    );
        ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_q <= ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_iq(0 downto 0);

	--excSelBits_uid120_asinX_uid8_fpArcsinPiTest(BITJOIN,119)@31
    excSelBits_uid120_asinX_uid8_fpArcsinPiTest_q <= ld_excRNaN_uid119_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_c_replace_mem_q & GND_q & ld_expXIsZero_uid31_asinX_uid8_fpArcsinPiTest_q_to_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_a_replace_mem_q;

	--reg_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_0_to_outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_0(REG,458)@31
    reg_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_0_to_outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_0_to_outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_0_to_outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_0_q <= excSelBits_uid120_asinX_uid8_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest(LOOKUP,120)@32
    outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            CASE (reg_excSelBits_uid120_asinX_uid8_fpArcsinPiTest_0_to_outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_0_q) IS
                WHEN "000" =>  outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_q <= "01";
                WHEN "001" =>  outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_q <= "00";
                WHEN "010" =>  outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_q <= "10";
                WHEN "011" =>  outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_q <= "01";
                WHEN "100" =>  outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_q <= "11";
                WHEN "101" =>  outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_q <= "01";
                WHEN "110" =>  outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_q <= "01";
                WHEN "111" =>  outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_q <= "01";
                WHEN OTHERS =>
                    outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--expRPostExc_uid123_asinX_uid8_fpArcsinPiTest(MUX,122)@33
    expRPostExc_uid123_asinX_uid8_fpArcsinPiTest_s <= outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_q;
    expRPostExc_uid123_asinX_uid8_fpArcsinPiTest: PROCESS (expRPostExc_uid123_asinX_uid8_fpArcsinPiTest_s, en, cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q, expRCalc_uid117_asinX_uid8_fpArcsinPiTest_q, cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q, cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q)
    BEGIN
            CASE expRPostExc_uid123_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "00" => expRPostExc_uid123_asinX_uid8_fpArcsinPiTest_q <= cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "01" => expRPostExc_uid123_asinX_uid8_fpArcsinPiTest_q <= expRCalc_uid117_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "10" => expRPostExc_uid123_asinX_uid8_fpArcsinPiTest_q <= cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "11" => expRPostExc_uid123_asinX_uid8_fpArcsinPiTest_q <= cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q;
                  WHEN OTHERS => expRPostExc_uid123_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRPath3_uid110_asinX_uid8_fpArcsinPiTest(BITSELECT,109)@32
    fracRPath3_uid110_asinX_uid8_fpArcsinPiTest_in <= expFracRPath2PostRnd_uid109_asinX_uid8_fpArcsinPiTest_q(23 downto 0);
    fracRPath3_uid110_asinX_uid8_fpArcsinPiTest_b <= fracRPath3_uid110_asinX_uid8_fpArcsinPiTest_in(23 downto 1);

	--ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_nor(LOGICAL,1099)
    ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_nor_b <= ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_sticky_ena_q;
    ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_nor_q <= not (ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_nor_a or ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_nor_b);

	--ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_sticky_ena(REG,1100)
    ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_nor_q = "1") THEN
                ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_sticky_ena_q <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_enaAnd(LOGICAL,1101)
    ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_enaAnd_a <= ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_sticky_ena_q;
    ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_enaAnd_b <= en;
    ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_enaAnd_q <= ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_enaAnd_a and ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_enaAnd_b;

	--fracRPath2_uid76_asinX_uid8_fpArcsinPiTest(BITSELECT,75)@16
    fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_in <= expFracRPath2PostRnd_uid75_asinX_uid8_fpArcsinPiTest_q(23 downto 0);
    fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b <= fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_in(23 downto 1);

	--ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_inputreg(DELAY,1089)
    ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b, xout => ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem(DUALMEM,1090)
    ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_reset0 <= areset;
    ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_ia <= ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_inputreg_q;
    ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_aa <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdreg_q;
    ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_ab <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_replace_rdmux_q;
    ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 4,
        numwords_a => 14,
        width_b => 23,
        widthad_b => 4,
        numwords_b => 14,
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
        clocken1 => ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_iq,
        address_a => ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_aa,
        data_a => ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_ia
    );
        ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_q <= ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_iq(22 downto 0);

	--ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_nor(LOGICAL,1086)
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_nor_a <= ld_expX_uid15_asinX_uid8_fpArcsinPiTest_b_to_expFracConc_uid74_uid74_asinX_uid8_fpArcsinPiTest_b_notEnable_q;
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_nor_b <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_sticky_ena_q;
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_nor_q <= not (ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_nor_a or ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_nor_b);

	--ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_sticky_ena(REG,1087)
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_nor_q = "1") THEN
                ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_sticky_ena_q <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_enaAnd(LOGICAL,1088)
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_enaAnd_a <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_sticky_ena_q;
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_enaAnd_b <= en;
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_enaAnd_q <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_enaAnd_a and ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_enaAnd_b;

	--ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem(DUALMEM,1077)
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_reset0 <= areset;
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_ia <= fracX_uid16_asinX_uid8_fpArcsinPiTest_b;
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_aa <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdreg_q;
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_ab <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_rdmux_q;
    ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 5,
        numwords_a => 31,
        width_b => 23,
        widthad_b => 5,
        numwords_b => 31,
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
        clocken1 => ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_iq,
        address_a => ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_aa,
        data_a => ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_ia
    );
        ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_q <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_iq(22 downto 0);

	--piO2OutRange_uid114_asinX_uid8_fpArcsinPiTest(BITSELECT,113)@32
    piO2OutRange_uid114_asinX_uid8_fpArcsinPiTest_in <= piO2_uid101_asinX_uid8_fpArcsinPiTest_q(26 downto 0);
    piO2OutRange_uid114_asinX_uid8_fpArcsinPiTest_b <= piO2OutRange_uid114_asinX_uid8_fpArcsinPiTest_in(26 downto 4);

	--fracRCalc_uid115_asinX_uid8_fpArcsinPiTest(MUX,114)@32
    fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_s <= fracOutMuxSelEnc_uid113_asinX_uid8_fpArcsinPiTest_q;
    fracRCalc_uid115_asinX_uid8_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_s IS
                      WHEN "00" => fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_q <= piO2OutRange_uid114_asinX_uid8_fpArcsinPiTest_b;
                      WHEN "01" => fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_q <= ld_fracX_uid16_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_d_replace_mem_q;
                      WHEN "10" => fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_q <= ld_fracRPath2_uid76_asinX_uid8_fpArcsinPiTest_b_to_fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_e_replace_mem_q;
                      WHEN "11" => fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_q <= fracRPath3_uid110_asinX_uid8_fpArcsinPiTest_b;
                      WHEN OTHERS => fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--fracRPostExc_uid122_asinX_uid8_fpArcsinPiTest(MUX,121)@33
    fracRPostExc_uid122_asinX_uid8_fpArcsinPiTest_s <= outMuxSelEnc_uid121_asinX_uid8_fpArcsinPiTest_q;
    fracRPostExc_uid122_asinX_uid8_fpArcsinPiTest: PROCESS (fracRPostExc_uid122_asinX_uid8_fpArcsinPiTest_s, en, cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q, fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_q, cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q, cstNaNWF_uid20_asinX_uid8_fpArcsinPiTest_q)
    BEGIN
            CASE fracRPostExc_uid122_asinX_uid8_fpArcsinPiTest_s IS
                  WHEN "00" => fracRPostExc_uid122_asinX_uid8_fpArcsinPiTest_q <= cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "01" => fracRPostExc_uid122_asinX_uid8_fpArcsinPiTest_q <= fracRCalc_uid115_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "10" => fracRPostExc_uid122_asinX_uid8_fpArcsinPiTest_q <= cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "11" => fracRPostExc_uid122_asinX_uid8_fpArcsinPiTest_q <= cstNaNWF_uid20_asinX_uid8_fpArcsinPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid122_asinX_uid8_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid126_asinX_uid8_fpArcsinPiTest(BITJOIN,125)@33
    R_uid126_asinX_uid8_fpArcsinPiTest_q <= ld_signR_uid125_asinX_uid8_fpArcsinPiTest_q_to_R_uid126_asinX_uid8_fpArcsinPiTest_c_replace_mem_q & expRPostExc_uid123_asinX_uid8_fpArcsinPiTest_q & fracRPostExc_uid122_asinX_uid8_fpArcsinPiTest_q;

	--fracX_uid132_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,131)@33
    fracX_uid132_rAsinPi_uid13_fpArcsinPiTest_in <= R_uid126_asinX_uid8_fpArcsinPiTest_q(22 downto 0);
    fracX_uid132_rAsinPi_uid13_fpArcsinPiTest_b <= fracX_uid132_rAsinPi_uid13_fpArcsinPiTest_in(22 downto 0);

	--fracXIsZero_uid144_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,143)@33
    fracXIsZero_uid144_rAsinPi_uid13_fpArcsinPiTest_a <= fracX_uid132_rAsinPi_uid13_fpArcsinPiTest_b;
    fracXIsZero_uid144_rAsinPi_uid13_fpArcsinPiTest_b <= cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q;
    fracXIsZero_uid144_rAsinPi_uid13_fpArcsinPiTest_q <= "1" when fracXIsZero_uid144_rAsinPi_uid13_fpArcsinPiTest_a = fracXIsZero_uid144_rAsinPi_uid13_fpArcsinPiTest_b else "0";

	--expX_uid128_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,127)@33
    expX_uid128_rAsinPi_uid13_fpArcsinPiTest_in <= R_uid126_asinX_uid8_fpArcsinPiTest_q(30 downto 0);
    expX_uid128_rAsinPi_uid13_fpArcsinPiTest_b <= expX_uid128_rAsinPi_uid13_fpArcsinPiTest_in(30 downto 23);

	--expXIsMax_uid142_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,141)@33
    expXIsMax_uid142_rAsinPi_uid13_fpArcsinPiTest_a <= expX_uid128_rAsinPi_uid13_fpArcsinPiTest_b;
    expXIsMax_uid142_rAsinPi_uid13_fpArcsinPiTest_b <= cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q;
    expXIsMax_uid142_rAsinPi_uid13_fpArcsinPiTest_q <= "1" when expXIsMax_uid142_rAsinPi_uid13_fpArcsinPiTest_a = expXIsMax_uid142_rAsinPi_uid13_fpArcsinPiTest_b else "0";

	--exc_I_uid145_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,144)@33
    exc_I_uid145_rAsinPi_uid13_fpArcsinPiTest_a <= expXIsMax_uid142_rAsinPi_uid13_fpArcsinPiTest_q;
    exc_I_uid145_rAsinPi_uid13_fpArcsinPiTest_b <= fracXIsZero_uid144_rAsinPi_uid13_fpArcsinPiTest_q;
    exc_I_uid145_rAsinPi_uid13_fpArcsinPiTest_q <= exc_I_uid145_rAsinPi_uid13_fpArcsinPiTest_a and exc_I_uid145_rAsinPi_uid13_fpArcsinPiTest_b;

	--ooPi_uid9_fpArcsinPiTest(CONSTANT,8)
    ooPi_uid9_fpArcsinPiTest_q <= "101000101111100110000011";

	--fracOOPi_uid10_fpArcsinPiTest(BITSELECT,9)@33
    fracOOPi_uid10_fpArcsinPiTest_in <= ooPi_uid9_fpArcsinPiTest_q(22 downto 0);
    fracOOPi_uid10_fpArcsinPiTest_b <= fracOOPi_uid10_fpArcsinPiTest_in(22 downto 0);

	--fpOOPi_uid11_fpArcsinPiTest(BITJOIN,10)@33
    fpOOPi_uid11_fpArcsinPiTest_q <= GND_q & cstBiasM2_uid6_fpArcsinPiTest_q & fracOOPi_uid10_fpArcsinPiTest_b;

	--expY_uid129_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,128)@33
    expY_uid129_rAsinPi_uid13_fpArcsinPiTest_in <= fpOOPi_uid11_fpArcsinPiTest_q(30 downto 0);
    expY_uid129_rAsinPi_uid13_fpArcsinPiTest_b <= expY_uid129_rAsinPi_uid13_fpArcsinPiTest_in(30 downto 23);

	--expXIsZero_uid156_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,155)@33
    expXIsZero_uid156_rAsinPi_uid13_fpArcsinPiTest_a <= expY_uid129_rAsinPi_uid13_fpArcsinPiTest_b;
    expXIsZero_uid156_rAsinPi_uid13_fpArcsinPiTest_b <= cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q;
    expXIsZero_uid156_rAsinPi_uid13_fpArcsinPiTest_q <= "1" when expXIsZero_uid156_rAsinPi_uid13_fpArcsinPiTest_a = expXIsZero_uid156_rAsinPi_uid13_fpArcsinPiTest_b else "0";

	--excYZAndExcXI_uid210_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,209)@33
    excYZAndExcXI_uid210_rAsinPi_uid13_fpArcsinPiTest_a <= expXIsZero_uid156_rAsinPi_uid13_fpArcsinPiTest_q;
    excYZAndExcXI_uid210_rAsinPi_uid13_fpArcsinPiTest_b <= exc_I_uid145_rAsinPi_uid13_fpArcsinPiTest_q;
    excYZAndExcXI_uid210_rAsinPi_uid13_fpArcsinPiTest_q <= excYZAndExcXI_uid210_rAsinPi_uid13_fpArcsinPiTest_a and excYZAndExcXI_uid210_rAsinPi_uid13_fpArcsinPiTest_b;

	--fracY_uid134_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,133)@33
    fracY_uid134_rAsinPi_uid13_fpArcsinPiTest_in <= fpOOPi_uid11_fpArcsinPiTest_q(22 downto 0);
    fracY_uid134_rAsinPi_uid13_fpArcsinPiTest_b <= fracY_uid134_rAsinPi_uid13_fpArcsinPiTest_in(22 downto 0);

	--fracXIsZero_uid160_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,159)@33
    fracXIsZero_uid160_rAsinPi_uid13_fpArcsinPiTest_a <= fracY_uid134_rAsinPi_uid13_fpArcsinPiTest_b;
    fracXIsZero_uid160_rAsinPi_uid13_fpArcsinPiTest_b <= cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q;
    fracXIsZero_uid160_rAsinPi_uid13_fpArcsinPiTest_q <= "1" when fracXIsZero_uid160_rAsinPi_uid13_fpArcsinPiTest_a = fracXIsZero_uid160_rAsinPi_uid13_fpArcsinPiTest_b else "0";

	--expXIsMax_uid158_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,157)@33
    expXIsMax_uid158_rAsinPi_uid13_fpArcsinPiTest_a <= expY_uid129_rAsinPi_uid13_fpArcsinPiTest_b;
    expXIsMax_uid158_rAsinPi_uid13_fpArcsinPiTest_b <= cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q;
    expXIsMax_uid158_rAsinPi_uid13_fpArcsinPiTest_q <= "1" when expXIsMax_uid158_rAsinPi_uid13_fpArcsinPiTest_a = expXIsMax_uid158_rAsinPi_uid13_fpArcsinPiTest_b else "0";

	--exc_I_uid161_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,160)@33
    exc_I_uid161_rAsinPi_uid13_fpArcsinPiTest_a <= expXIsMax_uid158_rAsinPi_uid13_fpArcsinPiTest_q;
    exc_I_uid161_rAsinPi_uid13_fpArcsinPiTest_b <= fracXIsZero_uid160_rAsinPi_uid13_fpArcsinPiTest_q;
    exc_I_uid161_rAsinPi_uid13_fpArcsinPiTest_q <= exc_I_uid161_rAsinPi_uid13_fpArcsinPiTest_a and exc_I_uid161_rAsinPi_uid13_fpArcsinPiTest_b;

	--expXIsZero_uid140_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,139)@33
    expXIsZero_uid140_rAsinPi_uid13_fpArcsinPiTest_a <= expX_uid128_rAsinPi_uid13_fpArcsinPiTest_b;
    expXIsZero_uid140_rAsinPi_uid13_fpArcsinPiTest_b <= cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q;
    expXIsZero_uid140_rAsinPi_uid13_fpArcsinPiTest_q <= "1" when expXIsZero_uid140_rAsinPi_uid13_fpArcsinPiTest_a = expXIsZero_uid140_rAsinPi_uid13_fpArcsinPiTest_b else "0";

	--excXZAndExcYI_uid211_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,210)@33
    excXZAndExcYI_uid211_rAsinPi_uid13_fpArcsinPiTest_a <= expXIsZero_uid140_rAsinPi_uid13_fpArcsinPiTest_q;
    excXZAndExcYI_uid211_rAsinPi_uid13_fpArcsinPiTest_b <= exc_I_uid161_rAsinPi_uid13_fpArcsinPiTest_q;
    excXZAndExcYI_uid211_rAsinPi_uid13_fpArcsinPiTest_q <= excXZAndExcYI_uid211_rAsinPi_uid13_fpArcsinPiTest_a and excXZAndExcYI_uid211_rAsinPi_uid13_fpArcsinPiTest_b;

	--ZeroTimesInf_uid212_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,211)@33
    ZeroTimesInf_uid212_rAsinPi_uid13_fpArcsinPiTest_a <= excXZAndExcYI_uid211_rAsinPi_uid13_fpArcsinPiTest_q;
    ZeroTimesInf_uid212_rAsinPi_uid13_fpArcsinPiTest_b <= excYZAndExcXI_uid210_rAsinPi_uid13_fpArcsinPiTest_q;
    ZeroTimesInf_uid212_rAsinPi_uid13_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ZeroTimesInf_uid212_rAsinPi_uid13_fpArcsinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            ZeroTimesInf_uid212_rAsinPi_uid13_fpArcsinPiTest_q <= ZeroTimesInf_uid212_rAsinPi_uid13_fpArcsinPiTest_a or ZeroTimesInf_uid212_rAsinPi_uid13_fpArcsinPiTest_b;
        END IF;
    END PROCESS;



	--InvFracXIsZero_uid162_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,161)@33
    InvFracXIsZero_uid162_rAsinPi_uid13_fpArcsinPiTest_a <= fracXIsZero_uid160_rAsinPi_uid13_fpArcsinPiTest_q;
    InvFracXIsZero_uid162_rAsinPi_uid13_fpArcsinPiTest_q <= not InvFracXIsZero_uid162_rAsinPi_uid13_fpArcsinPiTest_a;

	--exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,162)@33
    exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_a <= expXIsMax_uid158_rAsinPi_uid13_fpArcsinPiTest_q;
    exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_b <= InvFracXIsZero_uid162_rAsinPi_uid13_fpArcsinPiTest_q;
    exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_q <= exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_a and exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_b;

	--ld_exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_q_to_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_b(DELAY,742)@33
    ld_exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_q_to_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_q, xout => ld_exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_q_to_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--InvFracXIsZero_uid146_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,145)@33
    InvFracXIsZero_uid146_rAsinPi_uid13_fpArcsinPiTest_a <= fracXIsZero_uid144_rAsinPi_uid13_fpArcsinPiTest_q;
    InvFracXIsZero_uid146_rAsinPi_uid13_fpArcsinPiTest_q <= not InvFracXIsZero_uid146_rAsinPi_uid13_fpArcsinPiTest_a;

	--exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,146)@33
    exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_a <= expXIsMax_uid142_rAsinPi_uid13_fpArcsinPiTest_q;
    exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_b <= InvFracXIsZero_uid146_rAsinPi_uid13_fpArcsinPiTest_q;
    exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_q <= exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_a and exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_b;

	--reg_exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_0_to_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_1(REG,519)@33
    reg_exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_0_to_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_0_to_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_0_to_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_1_q <= exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,212)@34
    excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_a <= reg_exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_0_to_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_1_q;
    excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_b <= ld_exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_q_to_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_b_q;
    excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_c <= ZeroTimesInf_uid212_rAsinPi_uid13_fpArcsinPiTest_q;
    excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_q <= excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_a or excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_b or excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_c;

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--InvExcRNaN_uid225_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,224)@34
    InvExcRNaN_uid225_rAsinPi_uid13_fpArcsinPiTest_a <= excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_q;
    InvExcRNaN_uid225_rAsinPi_uid13_fpArcsinPiTest_q <= not InvExcRNaN_uid225_rAsinPi_uid13_fpArcsinPiTest_a;

	--signY_uid131_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,130)@33
    signY_uid131_rAsinPi_uid13_fpArcsinPiTest_in <= fpOOPi_uid11_fpArcsinPiTest_q;
    signY_uid131_rAsinPi_uid13_fpArcsinPiTest_b <= signY_uid131_rAsinPi_uid13_fpArcsinPiTest_in(31 downto 31);

	--signX_uid130_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,129)@33
    signX_uid130_rAsinPi_uid13_fpArcsinPiTest_in <= R_uid126_asinX_uid8_fpArcsinPiTest_q;
    signX_uid130_rAsinPi_uid13_fpArcsinPiTest_b <= signX_uid130_rAsinPi_uid13_fpArcsinPiTest_in(31 downto 31);

	--signR_uid196_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,195)@33
    signR_uid196_rAsinPi_uid13_fpArcsinPiTest_a <= signX_uid130_rAsinPi_uid13_fpArcsinPiTest_b;
    signR_uid196_rAsinPi_uid13_fpArcsinPiTest_b <= signY_uid131_rAsinPi_uid13_fpArcsinPiTest_b;
    signR_uid196_rAsinPi_uid13_fpArcsinPiTest_q <= signR_uid196_rAsinPi_uid13_fpArcsinPiTest_a xor signR_uid196_rAsinPi_uid13_fpArcsinPiTest_b;

	--ld_signR_uid196_rAsinPi_uid13_fpArcsinPiTest_q_to_signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_a(DELAY,753)@33
    ld_signR_uid196_rAsinPi_uid13_fpArcsinPiTest_q_to_signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signR_uid196_rAsinPi_uid13_fpArcsinPiTest_q, xout => ld_signR_uid196_rAsinPi_uid13_fpArcsinPiTest_q_to_signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,225)@34
    signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_a <= ld_signR_uid196_rAsinPi_uid13_fpArcsinPiTest_q_to_signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_a_q;
    signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_b <= InvExcRNaN_uid225_rAsinPi_uid13_fpArcsinPiTest_q;
    signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_q <= signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_a and signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_b;

	--ld_signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_q_to_R_uid227_rAsinPi_uid13_fpArcsinPiTest_c(DELAY,757)@34
    ld_signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_q_to_R_uid227_rAsinPi_uid13_fpArcsinPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_q, xout => ld_signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_q_to_R_uid227_rAsinPi_uid13_fpArcsinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--add_one_fracY_uid134_uid135_uid135_rAsinPi_uid13_fpArcsinPiTest(BITJOIN,134)@33
    add_one_fracY_uid134_uid135_uid135_rAsinPi_uid13_fpArcsinPiTest_q <= VCC_q & fracY_uid134_rAsinPi_uid13_fpArcsinPiTest_b;

	--add_one_fracX_uid132_uid133_uid133_rAsinPi_uid13_fpArcsinPiTest(BITJOIN,132)@33
    add_one_fracX_uid132_uid133_uid133_rAsinPi_uid13_fpArcsinPiTest_q <= VCC_q & fracX_uid132_rAsinPi_uid13_fpArcsinPiTest_b;

	--prod_uid171_rAsinPi_uid13_fpArcsinPiTest(MULT,170)@33
    prod_uid171_rAsinPi_uid13_fpArcsinPiTest_pr <= UNSIGNED(prod_uid171_rAsinPi_uid13_fpArcsinPiTest_a) * UNSIGNED(prod_uid171_rAsinPi_uid13_fpArcsinPiTest_b);
    prod_uid171_rAsinPi_uid13_fpArcsinPiTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid171_rAsinPi_uid13_fpArcsinPiTest_a <= (others => '0');
            prod_uid171_rAsinPi_uid13_fpArcsinPiTest_b <= (others => '0');
            prod_uid171_rAsinPi_uid13_fpArcsinPiTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid171_rAsinPi_uid13_fpArcsinPiTest_a <= add_one_fracX_uid132_uid133_uid133_rAsinPi_uid13_fpArcsinPiTest_q;
                prod_uid171_rAsinPi_uid13_fpArcsinPiTest_b <= add_one_fracY_uid134_uid135_uid135_rAsinPi_uid13_fpArcsinPiTest_q;
                prod_uid171_rAsinPi_uid13_fpArcsinPiTest_s1 <= STD_LOGIC_VECTOR(prod_uid171_rAsinPi_uid13_fpArcsinPiTest_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid171_rAsinPi_uid13_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid171_rAsinPi_uid13_fpArcsinPiTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid171_rAsinPi_uid13_fpArcsinPiTest_q <= prod_uid171_rAsinPi_uid13_fpArcsinPiTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normalizeBit_uid172_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,171)@36
    normalizeBit_uid172_rAsinPi_uid13_fpArcsinPiTest_in <= prod_uid171_rAsinPi_uid13_fpArcsinPiTest_q;
    normalizeBit_uid172_rAsinPi_uid13_fpArcsinPiTest_b <= normalizeBit_uid172_rAsinPi_uid13_fpArcsinPiTest_in(47 downto 47);

	--fracRPostNormHigh_uid174_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,173)@36
    fracRPostNormHigh_uid174_rAsinPi_uid13_fpArcsinPiTest_in <= prod_uid171_rAsinPi_uid13_fpArcsinPiTest_q(46 downto 0);
    fracRPostNormHigh_uid174_rAsinPi_uid13_fpArcsinPiTest_b <= fracRPostNormHigh_uid174_rAsinPi_uid13_fpArcsinPiTest_in(46 downto 23);

	--fracRPostNormLow_uid175_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,174)@36
    fracRPostNormLow_uid175_rAsinPi_uid13_fpArcsinPiTest_in <= prod_uid171_rAsinPi_uid13_fpArcsinPiTest_q(45 downto 0);
    fracRPostNormLow_uid175_rAsinPi_uid13_fpArcsinPiTest_b <= fracRPostNormLow_uid175_rAsinPi_uid13_fpArcsinPiTest_in(45 downto 22);

	--fracRPostNorm_uid176_rAsinPi_uid13_fpArcsinPiTest(MUX,175)@36
    fracRPostNorm_uid176_rAsinPi_uid13_fpArcsinPiTest_s <= normalizeBit_uid172_rAsinPi_uid13_fpArcsinPiTest_b;
    fracRPostNorm_uid176_rAsinPi_uid13_fpArcsinPiTest: PROCESS (fracRPostNorm_uid176_rAsinPi_uid13_fpArcsinPiTest_s, en, fracRPostNormLow_uid175_rAsinPi_uid13_fpArcsinPiTest_b, fracRPostNormHigh_uid174_rAsinPi_uid13_fpArcsinPiTest_b)
    BEGIN
            CASE fracRPostNorm_uid176_rAsinPi_uid13_fpArcsinPiTest_s IS
                  WHEN "0" => fracRPostNorm_uid176_rAsinPi_uid13_fpArcsinPiTest_q <= fracRPostNormLow_uid175_rAsinPi_uid13_fpArcsinPiTest_b;
                  WHEN "1" => fracRPostNorm_uid176_rAsinPi_uid13_fpArcsinPiTest_q <= fracRPostNormHigh_uid174_rAsinPi_uid13_fpArcsinPiTest_b;
                  WHEN OTHERS => fracRPostNorm_uid176_rAsinPi_uid13_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--FracRPostNorm1dto0_uid184_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,183)@36
    FracRPostNorm1dto0_uid184_rAsinPi_uid13_fpArcsinPiTest_in <= fracRPostNorm_uid176_rAsinPi_uid13_fpArcsinPiTest_q(1 downto 0);
    FracRPostNorm1dto0_uid184_rAsinPi_uid13_fpArcsinPiTest_b <= FracRPostNorm1dto0_uid184_rAsinPi_uid13_fpArcsinPiTest_in(1 downto 0);

	--Prod22_uid178_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,177)@36
    Prod22_uid178_rAsinPi_uid13_fpArcsinPiTest_in <= prod_uid171_rAsinPi_uid13_fpArcsinPiTest_q(22 downto 0);
    Prod22_uid178_rAsinPi_uid13_fpArcsinPiTest_b <= Prod22_uid178_rAsinPi_uid13_fpArcsinPiTest_in(22 downto 22);

	--extraStickyBit_uid179_rAsinPi_uid13_fpArcsinPiTest(MUX,178)@36
    extraStickyBit_uid179_rAsinPi_uid13_fpArcsinPiTest_s <= normalizeBit_uid172_rAsinPi_uid13_fpArcsinPiTest_b;
    extraStickyBit_uid179_rAsinPi_uid13_fpArcsinPiTest: PROCESS (extraStickyBit_uid179_rAsinPi_uid13_fpArcsinPiTest_s, en, GND_q, Prod22_uid178_rAsinPi_uid13_fpArcsinPiTest_b)
    BEGIN
            CASE extraStickyBit_uid179_rAsinPi_uid13_fpArcsinPiTest_s IS
                  WHEN "0" => extraStickyBit_uid179_rAsinPi_uid13_fpArcsinPiTest_q <= GND_q;
                  WHEN "1" => extraStickyBit_uid179_rAsinPi_uid13_fpArcsinPiTest_q <= Prod22_uid178_rAsinPi_uid13_fpArcsinPiTest_b;
                  WHEN OTHERS => extraStickyBit_uid179_rAsinPi_uid13_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--stickyRange_uid177_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,176)@36
    stickyRange_uid177_rAsinPi_uid13_fpArcsinPiTest_in <= prod_uid171_rAsinPi_uid13_fpArcsinPiTest_q(21 downto 0);
    stickyRange_uid177_rAsinPi_uid13_fpArcsinPiTest_b <= stickyRange_uid177_rAsinPi_uid13_fpArcsinPiTest_in(21 downto 0);

	--stickyExtendedRange_uid180_rAsinPi_uid13_fpArcsinPiTest(BITJOIN,179)@36
    stickyExtendedRange_uid180_rAsinPi_uid13_fpArcsinPiTest_q <= extraStickyBit_uid179_rAsinPi_uid13_fpArcsinPiTest_q & stickyRange_uid177_rAsinPi_uid13_fpArcsinPiTest_b;

	--stickyRangeComparator_uid182_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,181)@36
    stickyRangeComparator_uid182_rAsinPi_uid13_fpArcsinPiTest_a <= stickyExtendedRange_uid180_rAsinPi_uid13_fpArcsinPiTest_q;
    stickyRangeComparator_uid182_rAsinPi_uid13_fpArcsinPiTest_b <= cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q;
    stickyRangeComparator_uid182_rAsinPi_uid13_fpArcsinPiTest_q <= "1" when stickyRangeComparator_uid182_rAsinPi_uid13_fpArcsinPiTest_a = stickyRangeComparator_uid182_rAsinPi_uid13_fpArcsinPiTest_b else "0";

	--sticky_uid183_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,182)@36
    sticky_uid183_rAsinPi_uid13_fpArcsinPiTest_a <= stickyRangeComparator_uid182_rAsinPi_uid13_fpArcsinPiTest_q;
    sticky_uid183_rAsinPi_uid13_fpArcsinPiTest_q <= not sticky_uid183_rAsinPi_uid13_fpArcsinPiTest_a;

	--lrs_uid185_rAsinPi_uid13_fpArcsinPiTest(BITJOIN,184)@36
    lrs_uid185_rAsinPi_uid13_fpArcsinPiTest_q <= FracRPostNorm1dto0_uid184_rAsinPi_uid13_fpArcsinPiTest_b & sticky_uid183_rAsinPi_uid13_fpArcsinPiTest_q;

	--roundBitDetectionPattern_uid187_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,186)@36
    roundBitDetectionPattern_uid187_rAsinPi_uid13_fpArcsinPiTest_a <= lrs_uid185_rAsinPi_uid13_fpArcsinPiTest_q;
    roundBitDetectionPattern_uid187_rAsinPi_uid13_fpArcsinPiTest_b <= roundBitDetectionConstant_uid186_rAsinPi_uid13_fpArcsinPiTest_q;
    roundBitDetectionPattern_uid187_rAsinPi_uid13_fpArcsinPiTest_q <= "1" when roundBitDetectionPattern_uid187_rAsinPi_uid13_fpArcsinPiTest_a = roundBitDetectionPattern_uid187_rAsinPi_uid13_fpArcsinPiTest_b else "0";

	--roundBit_uid188_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,187)@36
    roundBit_uid188_rAsinPi_uid13_fpArcsinPiTest_a <= roundBitDetectionPattern_uid187_rAsinPi_uid13_fpArcsinPiTest_q;
    roundBit_uid188_rAsinPi_uid13_fpArcsinPiTest_q <= not roundBit_uid188_rAsinPi_uid13_fpArcsinPiTest_a;

	--roundBitAndNormalizationOp_uid191_rAsinPi_uid13_fpArcsinPiTest(BITJOIN,190)@36
    roundBitAndNormalizationOp_uid191_rAsinPi_uid13_fpArcsinPiTest_q <= GND_q & normalizeBit_uid172_rAsinPi_uid13_fpArcsinPiTest_b & cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q & roundBit_uid188_rAsinPi_uid13_fpArcsinPiTest_q;

	--reg_roundBitAndNormalizationOp_uid191_rAsinPi_uid13_fpArcsinPiTest_0_to_expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_1(REG,514)@36
    reg_roundBitAndNormalizationOp_uid191_rAsinPi_uid13_fpArcsinPiTest_0_to_expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_roundBitAndNormalizationOp_uid191_rAsinPi_uid13_fpArcsinPiTest_0_to_expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_roundBitAndNormalizationOp_uid191_rAsinPi_uid13_fpArcsinPiTest_0_to_expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_1_q <= roundBitAndNormalizationOp_uid191_rAsinPi_uid13_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--biasInc_uid169_rAsinPi_uid13_fpArcsinPiTest(CONSTANT,168)
    biasInc_uid169_rAsinPi_uid13_fpArcsinPiTest_q <= "0001111111";

	--expSum_uid168_rAsinPi_uid13_fpArcsinPiTest(ADD,167)@33
    expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_a <= STD_LOGIC_VECTOR("0" & expX_uid128_rAsinPi_uid13_fpArcsinPiTest_b);
    expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_b <= STD_LOGIC_VECTOR("0" & expY_uid129_rAsinPi_uid13_fpArcsinPiTest_b);
    expSum_uid168_rAsinPi_uid13_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_a) + UNSIGNED(expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_q <= expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_o(8 downto 0);


	--ld_expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_q_to_expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_a(DELAY,674)@34
    ld_expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_q_to_expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_a : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_q, xout => ld_expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_q_to_expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest(SUB,169)@35
    expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_a <= STD_LOGIC_VECTOR('0' & "00" & ld_expSum_uid168_rAsinPi_uid13_fpArcsinPiTest_q_to_expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_a_q);
    expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_b <= STD_LOGIC_VECTOR((11 downto 10 => biasInc_uid169_rAsinPi_uid13_fpArcsinPiTest_q(9)) & biasInc_uid169_rAsinPi_uid13_fpArcsinPiTest_q);
    expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_a) - SIGNED(expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_q <= expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_o(10 downto 0);


	--expFracPreRound_uid189_rAsinPi_uid13_fpArcsinPiTest(BITJOIN,188)@36
    expFracPreRound_uid189_rAsinPi_uid13_fpArcsinPiTest_q <= expSumMBias_uid170_rAsinPi_uid13_fpArcsinPiTest_q & fracRPostNorm_uid176_rAsinPi_uid13_fpArcsinPiTest_q;

	--reg_expFracPreRound_uid189_rAsinPi_uid13_fpArcsinPiTest_0_to_expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_0(REG,513)@36
    reg_expFracPreRound_uid189_rAsinPi_uid13_fpArcsinPiTest_0_to_expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracPreRound_uid189_rAsinPi_uid13_fpArcsinPiTest_0_to_expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_0_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracPreRound_uid189_rAsinPi_uid13_fpArcsinPiTest_0_to_expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_0_q <= expFracPreRound_uid189_rAsinPi_uid13_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest(ADD,191)@37
    expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_a <= STD_LOGIC_VECTOR((36 downto 35 => reg_expFracPreRound_uid189_rAsinPi_uid13_fpArcsinPiTest_0_to_expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_0_q(34)) & reg_expFracPreRound_uid189_rAsinPi_uid13_fpArcsinPiTest_0_to_expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_0_q);
    expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_b <= STD_LOGIC_VECTOR('0' & "0000000000" & reg_roundBitAndNormalizationOp_uid191_rAsinPi_uid13_fpArcsinPiTest_0_to_expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_1_q);
            expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_a) + SIGNED(expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_b));
    expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_q <= expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_o(35 downto 0);


	--expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,193)@37
    expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_in <= expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_q;
    expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_b <= expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_in(35 downto 24);

	--expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,194)@37
    expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_in <= expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_b(7 downto 0);
    expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_b <= expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_in(7 downto 0);

	--ld_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_b_to_reg_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_0_to_expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_3_a(DELAY,1049)@37
    ld_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_b_to_reg_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_0_to_expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_3_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_b, xout => ld_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_b_to_reg_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_0_to_expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_3_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_0_to_expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_3(REG,522)@38
    reg_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_0_to_expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_0_to_expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_0_to_expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_3_q <= ld_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_b_to_reg_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_0_to_expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_3_a_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_q_to_concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_c(DELAY,746)@34
    ld_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_q_to_concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_q, xout => ld_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_q_to_concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_0_to_expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_1(REG,515)@37
    reg_expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_0_to_expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_0_to_expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_0_to_expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_1_q <= expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest(COMPARE,198)@38
    expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_cin <= GND_q;
    expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_a <= STD_LOGIC_VECTOR((13 downto 12 => reg_expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_0_to_expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_1_q(11)) & reg_expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_0_to_expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_1_q) & '0';
    expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_b <= STD_LOGIC_VECTOR('0' & "00000" & cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q) & expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_cin(0);
            expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_a) - SIGNED(expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_b));
    expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_n(0) <= not expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_o(14);


	--InvExc_N_uid164_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,163)@33
    InvExc_N_uid164_rAsinPi_uid13_fpArcsinPiTest_a <= exc_N_uid163_rAsinPi_uid13_fpArcsinPiTest_q;
    InvExc_N_uid164_rAsinPi_uid13_fpArcsinPiTest_q <= not InvExc_N_uid164_rAsinPi_uid13_fpArcsinPiTest_a;

	--InvExc_I_uid165_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,164)@33
    InvExc_I_uid165_rAsinPi_uid13_fpArcsinPiTest_a <= exc_I_uid161_rAsinPi_uid13_fpArcsinPiTest_q;
    InvExc_I_uid165_rAsinPi_uid13_fpArcsinPiTest_q <= not InvExc_I_uid165_rAsinPi_uid13_fpArcsinPiTest_a;

	--InvExpXIsZero_uid166_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,165)@33
    InvExpXIsZero_uid166_rAsinPi_uid13_fpArcsinPiTest_a <= expXIsZero_uid156_rAsinPi_uid13_fpArcsinPiTest_q;
    InvExpXIsZero_uid166_rAsinPi_uid13_fpArcsinPiTest_q <= not InvExpXIsZero_uid166_rAsinPi_uid13_fpArcsinPiTest_a;

	--exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,166)@33
    exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_a <= InvExpXIsZero_uid166_rAsinPi_uid13_fpArcsinPiTest_q;
    exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_b <= InvExc_I_uid165_rAsinPi_uid13_fpArcsinPiTest_q;
    exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_c <= InvExc_N_uid164_rAsinPi_uid13_fpArcsinPiTest_q;
    exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_q <= exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_a and exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_b and exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_c;

	--ld_exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_q_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_b(DELAY,716)@33
    ld_exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_q_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_q, xout => ld_exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_q_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid148_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,147)@33
    InvExc_N_uid148_rAsinPi_uid13_fpArcsinPiTest_a <= exc_N_uid147_rAsinPi_uid13_fpArcsinPiTest_q;
    InvExc_N_uid148_rAsinPi_uid13_fpArcsinPiTest_q <= not InvExc_N_uid148_rAsinPi_uid13_fpArcsinPiTest_a;

	--InvExc_I_uid149_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,148)@33
    InvExc_I_uid149_rAsinPi_uid13_fpArcsinPiTest_a <= exc_I_uid145_rAsinPi_uid13_fpArcsinPiTest_q;
    InvExc_I_uid149_rAsinPi_uid13_fpArcsinPiTest_q <= not InvExc_I_uid149_rAsinPi_uid13_fpArcsinPiTest_a;

	--InvExpXIsZero_uid150_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,149)@33
    InvExpXIsZero_uid150_rAsinPi_uid13_fpArcsinPiTest_a <= expXIsZero_uid140_rAsinPi_uid13_fpArcsinPiTest_q;
    InvExpXIsZero_uid150_rAsinPi_uid13_fpArcsinPiTest_q <= not InvExpXIsZero_uid150_rAsinPi_uid13_fpArcsinPiTest_a;

	--exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,150)@33
    exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_a <= InvExpXIsZero_uid150_rAsinPi_uid13_fpArcsinPiTest_q;
    exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_b <= InvExc_I_uid149_rAsinPi_uid13_fpArcsinPiTest_q;
    exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_c <= InvExc_N_uid148_rAsinPi_uid13_fpArcsinPiTest_q;
    exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_q <= exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_a and exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_b and exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_c;

	--ld_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_q_to_reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_1_a(DELAY,1045)@33
    ld_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_q_to_reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_q, xout => ld_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_q_to_reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_1(REG,518)@37
    reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_1_q <= ld_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_q_to_reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,207)@38
    ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_a <= reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_1_q;
    ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_b <= ld_exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_q_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_b_q;
    ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_c <= expOvf_uid199_rAsinPi_uid13_fpArcsinPiTest_n;
    ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_q <= ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_a and ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_b and ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_c;

	--excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,206)@33
    excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest_a <= exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_q;
    excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest_b <= exc_I_uid145_rAsinPi_uid13_fpArcsinPiTest_q;
    excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest_q <= excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest_a and excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest_b;

	--ld_excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_c(DELAY,733)@33
    ld_excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest_q, xout => ld_excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,205)@33
    excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest_a <= exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_q;
    excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest_b <= exc_I_uid161_rAsinPi_uid13_fpArcsinPiTest_q;
    excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest_q <= excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest_a and excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest_b;

	--ld_excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_b(DELAY,732)@33
    ld_excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest_q, xout => ld_excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,204)@33
    excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest_a <= exc_I_uid145_rAsinPi_uid13_fpArcsinPiTest_q;
    excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest_b <= exc_I_uid161_rAsinPi_uid13_fpArcsinPiTest_q;
    excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest_q <= excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest_a and excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest_b;

	--ld_excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_a(DELAY,731)@33
    ld_excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest_q, xout => ld_excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,208)@38
    excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_a <= ld_excXIAndExcYI_uid205_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_a_q;
    excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_b <= ld_excXRAndExcYI_uid206_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_b_q;
    excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_c <= ld_excYRAndExcXI_uid207_rAsinPi_uid13_fpArcsinPiTest_q_to_excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_c_q;
    excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_d <= ExcROvfAndInReg_uid208_rAsinPi_uid13_fpArcsinPiTest_q;
    excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_q <= excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_a or excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_b or excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_c or excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_d;

	--expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest(COMPARE,196)@38
    expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_cin <= GND_q;
    expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_a <= STD_LOGIC_VECTOR('0' & "000000000000" & GND_q) & '0';
    expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_b <= STD_LOGIC_VECTOR((13 downto 12 => reg_expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_0_to_expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_1_q(11)) & reg_expRPreExcExt_uid194_rAsinPi_uid13_fpArcsinPiTest_0_to_expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_1_q) & expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_cin(0);
            expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_a) - SIGNED(expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_b));
    expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_n(0) <= not expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_o(14);


	--reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_1(REG,516)@33
    reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_1_q <= exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_1_q_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_a(DELAY,715)@34
    ld_reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_1_q_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_1_q, xout => ld_reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_1_q_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,202)@38
    excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_a <= ld_reg_exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_0_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_1_q_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_a_q;
    excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_b <= ld_exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_q_to_excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_b_q;
    excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_c <= expUdf_uid197_rAsinPi_uid13_fpArcsinPiTest_n;
    excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_q <= excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_a and excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_b and excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_c;

	--excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,201)@33
    excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest_a <= expXIsZero_uid156_rAsinPi_uid13_fpArcsinPiTest_q;
    excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest_b <= exc_R_uid151_rAsinPi_uid13_fpArcsinPiTest_q;
    excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest_q <= excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest_a and excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest_b;

	--ld_excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_c(DELAY,720)@33
    ld_excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest_q, xout => ld_excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,200)@33
    excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest_a <= expXIsZero_uid140_rAsinPi_uid13_fpArcsinPiTest_q;
    excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest_b <= exc_R_uid167_rAsinPi_uid13_fpArcsinPiTest_q;
    excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest_q <= excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest_a and excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest_b;

	--ld_excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_b(DELAY,719)@33
    ld_excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest_q, xout => ld_excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,199)@33
    excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest_a <= expXIsZero_uid140_rAsinPi_uid13_fpArcsinPiTest_q;
    excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest_b <= expXIsZero_uid156_rAsinPi_uid13_fpArcsinPiTest_q;
    excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest_q <= excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest_a and excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest_b;

	--ld_excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_a(DELAY,718)@33
    ld_excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest_q, xout => ld_excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest(LOGICAL,203)@38
    excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_a <= ld_excXZAndExcYZ_uid200_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_a_q;
    excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_b <= ld_excXZAndExcYR_uid201_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_b_q;
    excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_c <= ld_excYZAndExcXR_uid202_rAsinPi_uid13_fpArcsinPiTest_q_to_excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_c_q;
    excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_d <= excZC3_uid203_rAsinPi_uid13_fpArcsinPiTest_q;
    excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_q <= excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_a or excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_b or excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_c or excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_d;

	--concExc_uid214_rAsinPi_uid13_fpArcsinPiTest(BITJOIN,213)@38
    concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_q <= ld_excRNaN_uid213_rAsinPi_uid13_fpArcsinPiTest_q_to_concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_c_q & excRInf_uid209_rAsinPi_uid13_fpArcsinPiTest_q & excRZero_uid204_rAsinPi_uid13_fpArcsinPiTest_q;

	--reg_concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_0_to_excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_0(REG,520)@38
    reg_concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_0_to_excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_0_to_excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_0_to_excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_0_q <= concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest(LOOKUP,214)@39
    excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest: PROCESS (reg_concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_0_to_excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_concExc_uid214_rAsinPi_uid13_fpArcsinPiTest_0_to_excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_0_q) IS
                WHEN "000" =>  excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_q <= "01";
                WHEN "001" =>  excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_q <= "00";
                WHEN "010" =>  excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_q <= "10";
                WHEN "011" =>  excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_q <= "00";
                WHEN "100" =>  excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_q <= "11";
                WHEN "101" =>  excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_q <= "00";
                WHEN "110" =>  excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_q <= "00";
                WHEN "111" =>  excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest(MUX,223)@39
    expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_s <= excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_q;
    expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest: PROCESS (expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_s, en, cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q, reg_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_0_to_expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_3_q, cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q, cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q)
    BEGIN
            CASE expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_s IS
                  WHEN "00" => expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_q <= cstAllZWE_uid21_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "01" => expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_q <= reg_expRPreExc_uid195_rAsinPi_uid13_fpArcsinPiTest_0_to_expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_3_q;
                  WHEN "10" => expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_q <= cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "11" => expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_q <= cstAllOWE_uid18_asinX_uid8_fpArcsinPiTest_q;
                  WHEN OTHERS => expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest(BITSELECT,192)@37
    fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_in <= expFracRPostRounding_uid192_rAsinPi_uid13_fpArcsinPiTest_q(23 downto 0);
    fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_b <= fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_in(23 downto 1);

	--ld_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_b_to_reg_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_0_to_fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_3_a(DELAY,1048)@37
    ld_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_b_to_reg_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_0_to_fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_3_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_b, xout => ld_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_b_to_reg_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_0_to_fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_3_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_0_to_fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_3(REG,521)@38
    reg_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_0_to_fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_0_to_fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_3_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_0_to_fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_3_q <= ld_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_b_to_reg_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_0_to_fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_3_a_q;
            END IF;
        END IF;
    END PROCESS;


	--fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest(MUX,218)@39
    fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_s <= excREnc_uid215_rAsinPi_uid13_fpArcsinPiTest_q;
    fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest: PROCESS (fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_s, en, cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q, reg_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_0_to_fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_3_q, cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q, cstNaNWF_uid20_asinX_uid8_fpArcsinPiTest_q)
    BEGIN
            CASE fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_s IS
                  WHEN "00" => fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_q <= cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "01" => fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_q <= reg_fracRPreExc_uid193_rAsinPi_uid13_fpArcsinPiTest_0_to_fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_3_q;
                  WHEN "10" => fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_q <= cstAllZWF_uid19_asinX_uid8_fpArcsinPiTest_q;
                  WHEN "11" => fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_q <= cstNaNWF_uid20_asinX_uid8_fpArcsinPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid227_rAsinPi_uid13_fpArcsinPiTest(BITJOIN,226)@39
    R_uid227_rAsinPi_uid13_fpArcsinPiTest_q <= ld_signRPostExc_uid226_rAsinPi_uid13_fpArcsinPiTest_q_to_R_uid227_rAsinPi_uid13_fpArcsinPiTest_c_q & expRPostExc_uid224_rAsinPi_uid13_fpArcsinPiTest_q & fracRPostExc_uid219_rAsinPi_uid13_fpArcsinPiTest_q;

	--xOut(GPOUT,4)@39
    q <= R_uid227_rAsinPi_uid13_fpArcsinPiTest_q;


end normal;
