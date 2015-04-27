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

-- VHDL created from fp_arccospi_s5
-- VHDL created on Thu Feb 28 17:21:22 2013


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

entity fp_arccospi_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_arccospi_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstBiasM2_uid6_fpArccosPiTest_q : std_logic_vector (7 downto 0);
    signal ooPi_uid9_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q : std_logic_vector (22 downto 0);
    signal cstNaNWF_uid20_acosX_uid8_fpArccosPiTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q : std_logic_vector (7 downto 0);
    signal cstBias_uid22_acosX_uid8_fpArccosPiTest_q : std_logic_vector (7 downto 0);
    signal cstBiasM1_uid23_acosX_uid8_fpArccosPiTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMwFMwShift_uid24_acosX_uid8_fpArccosPiTest_q : std_logic_vector (8 downto 0);
    signal cstBiasP1_uid26_acosX_uid8_fpArccosPiTest_q : std_logic_vector (7 downto 0);
    signal shiftOutVal_uid54_acosX_uid8_fpArccosPiTest_q : std_logic_vector (5 downto 0);
    signal cst01pWShift_uid57_acosX_uid8_fpArccosPiTest_q : std_logic_vector (12 downto 0);
    signal pi_uid94_acosX_uid8_fpArccosPiTest_q : std_logic_vector (27 downto 0);
    signal path1NegCaseFrac_uid100_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal path1NegCaseFrac_uid100_acosX_uid8_fpArccosPiTest_q : std_logic_vector (22 downto 0);
    signal pi2_uid111_acosX_uid8_fpArccosPiTest_q : std_logic_vector (26 downto 0);
    signal fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_q : std_logic_vector(1 downto 0);
    signal InvExc_N_uid163_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid163_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid164_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid164_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid165_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid165_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expSum_uid183_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(8 downto 0);
    signal expSum_uid183_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(8 downto 0);
    signal expSum_uid183_rAcosPi_uid13_fpArccosPiTest_o : std_logic_vector (8 downto 0);
    signal expSum_uid183_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (8 downto 0);
    signal biasInc_uid184_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (9 downto 0);
    signal expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(11 downto 0);
    signal expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(11 downto 0);
    signal expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_o : std_logic_vector (11 downto 0);
    signal expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (10 downto 0);
    signal prod_uid186_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector (23 downto 0);
    signal prod_uid186_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (23 downto 0);
    signal prod_uid186_rAcosPi_uid13_fpArccosPiTest_s1 : std_logic_vector (47 downto 0);
    signal prod_uid186_rAcosPi_uid13_fpArccosPiTest_pr : UNSIGNED (47 downto 0);
    signal prod_uid186_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (47 downto 0);
    signal roundBitDetectionConstant_uid201_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (2 downto 0);
    signal excXZAndExcYI_uid226_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid226_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid226_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0Idx1Pad16_uid246_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (15 downto 0);
    signal rightShiftStage0Idx2Pad32_uid249_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal rightShiftStage0Idx3_uid251_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx1Pad4_uid255_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (3 downto 0);
    signal rightShiftStage1Idx3Pad12_uid261_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (11 downto 0);
    signal rightShiftStage2Idx2Pad2_uid269_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (1 downto 0);
    signal rightShiftStage2Idx3Pad3_uid272_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (2 downto 0);
    signal maxCountVal_uid320_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (5 downto 0);
    signal vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (5 downto 0);
    signal expXIsMax_uid335_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid335_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid335_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid343_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid343_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector (7 downto 0);
    signal negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0Idx3_uid386_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx3Pad6_uid396_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q : std_logic_vector (5 downto 0);
    signal expXIsMax_uid452_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid452_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid452_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid460_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid460_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(8 downto 0);
    signal expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(8 downto 0);
    signal expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o : std_logic_vector (8 downto 0);
    signal expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (8 downto 0);
    signal expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(11 downto 0);
    signal expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(11 downto 0);
    signal expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o : std_logic_vector (11 downto 0);
    signal expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (10 downto 0);
    signal prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector (23 downto 0);
    signal prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector (23 downto 0);
    signal prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s1 : std_logic_vector (47 downto 0);
    signal prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_pr : UNSIGNED (47 downto 0);
    signal prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (47 downto 0);
    signal signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid519_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid519_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_a : std_logic_vector (11 downto 0);
    signal prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_b : std_logic_vector (11 downto 0);
    signal prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_pr : SIGNED (24 downto 0);
    signal prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_q : std_logic_vector (23 downto 0);
    signal prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_a : std_logic_vector (14 downto 0);
    signal prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_b : std_logic_vector (20 downto 0);
    signal prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_s1 : std_logic_vector (35 downto 0);
    signal prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_pr : SIGNED (36 downto 0);
    signal prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_q : std_logic_vector (35 downto 0);
    signal prodXY_uid588_pT1_uid554_arccosXO2PolyEval_a : std_logic_vector (11 downto 0);
    signal prodXY_uid588_pT1_uid554_arccosXO2PolyEval_b : std_logic_vector (11 downto 0);
    signal prodXY_uid588_pT1_uid554_arccosXO2PolyEval_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid588_pT1_uid554_arccosXO2PolyEval_pr : SIGNED (24 downto 0);
    signal prodXY_uid588_pT1_uid554_arccosXO2PolyEval_q : std_logic_vector (23 downto 0);
    signal prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a : std_logic_vector (14 downto 0);
    signal prodXY_uid591_pT2_uid560_arccosXO2PolyEval_b : std_logic_vector (23 downto 0);
    signal prodXY_uid591_pT2_uid560_arccosXO2PolyEval_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid591_pT2_uid560_arccosXO2PolyEval_pr : SIGNED (39 downto 0);
    signal prodXY_uid591_pT2_uid560_arccosXO2PolyEval_q : std_logic_vector (38 downto 0);
    signal prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_a : std_logic_vector (11 downto 0);
    signal prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_pr : SIGNED (24 downto 0);
    signal prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_q : std_logic_vector (23 downto 0);
    signal prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_a : std_logic_vector (15 downto 0);
    signal prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_b : std_logic_vector (22 downto 0);
    signal prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_pr : SIGNED (39 downto 0);
    signal prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_q : std_logic_vector (38 downto 0);
    signal memoryC0_uid406_arcsinXO2XTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid406_arcsinXO2XTabGen_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid406_arcsinXO2XTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid406_arcsinXO2XTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid406_arcsinXO2XTabGen_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid406_arcsinXO2XTabGen_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid407_arcsinXO2XTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid407_arcsinXO2XTabGen_lutmem_ia : std_logic_vector (18 downto 0);
    signal memoryC1_uid407_arcsinXO2XTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid407_arcsinXO2XTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid407_arcsinXO2XTabGen_lutmem_iq : std_logic_vector (18 downto 0);
    signal memoryC1_uid407_arcsinXO2XTabGen_lutmem_q : std_logic_vector (18 downto 0);
    signal memoryC2_uid408_arcsinXO2XTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid408_arcsinXO2XTabGen_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid408_arcsinXO2XTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid408_arcsinXO2XTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid408_arcsinXO2XTabGen_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid408_arcsinXO2XTabGen_lutmem_q : std_logic_vector (11 downto 0);
    signal memoryC0_uid550_arccosXO2TabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid550_arccosXO2TabGen_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid550_arccosXO2TabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid550_arccosXO2TabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid550_arccosXO2TabGen_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid550_arccosXO2TabGen_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid551_arccosXO2TabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid551_arccosXO2TabGen_lutmem_ia : std_logic_vector (21 downto 0);
    signal memoryC1_uid551_arccosXO2TabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid551_arccosXO2TabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid551_arccosXO2TabGen_lutmem_iq : std_logic_vector (21 downto 0);
    signal memoryC1_uid551_arccosXO2TabGen_lutmem_q : std_logic_vector (21 downto 0);
    signal memoryC2_uid552_arccosXO2TabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid552_arccosXO2TabGen_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid552_arccosXO2TabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid552_arccosXO2TabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid552_arccosXO2TabGen_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid552_arccosXO2TabGen_lutmem_q : std_logic_vector (11 downto 0);
    signal memoryC0_uid566_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC0_uid566_sqrtTableGenerator_lutmem_ia : std_logic_vector (28 downto 0);
    signal memoryC0_uid566_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid566_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid566_sqrtTableGenerator_lutmem_iq : std_logic_vector (28 downto 0);
    signal memoryC0_uid566_sqrtTableGenerator_lutmem_q : std_logic_vector (28 downto 0);
    signal memoryC1_uid567_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC1_uid567_sqrtTableGenerator_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid567_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid567_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid567_sqrtTableGenerator_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid567_sqrtTableGenerator_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid568_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC2_uid568_sqrtTableGenerator_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid568_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid568_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid568_sqrtTableGenerator_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid568_sqrtTableGenerator_lutmem_q : std_logic_vector (11 downto 0);
    signal reg_excSelBits_uid137_acosX_uid8_fpArccosPiTest_0_to_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_0_q : std_logic_vector (2 downto 0);
    signal reg_rightShiftStageSel3Dto2_uid263_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_2_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStage1Idx1_uid256_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_3_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStage1Idx2_uid259_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_4_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStage1Idx3_uid262_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_5_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStageSel1Dto0_uid274_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_pad_o_uid27_uid63_acosX_uid8_fpArccosPiTest_0_to_oMy_uid63_acosX_uid8_fpArccosPiTest_0_q : std_logic_vector (35 downto 0);
    signal reg_y_uid61_acosX_uid8_fpArccosPiTest_0_to_oMy_uid63_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (34 downto 0);
    signal reg_rVStage_uid278_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (31 downto 0);
    signal reg_l_uid65_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q : std_logic_vector (34 downto 0);
    signal reg_cStage_uid282_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q : std_logic_vector (34 downto 0);
    signal reg_rVStage_uid285_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (15 downto 0);
    signal reg_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q : std_logic_vector (34 downto 0);
    signal reg_cStage_uid289_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q : std_logic_vector (34 downto 0);
    signal reg_rVStage_uid299_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (3 downto 0);
    signal reg_vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q : std_logic_vector (34 downto 0);
    signal reg_cStage_uid303_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q : std_logic_vector (34 downto 0);
    signal reg_vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (5 downto 0);
    signal reg_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_0_to_fpL_uid70_acosX_uid8_fpArccosPiTest_0_q : std_logic_vector (22 downto 0);
    signal reg_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (22 downto 0);
    signal reg_fracSelIn_uid366_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_q : std_logic_vector (3 downto 0);
    signal reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid568_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid569_sqrtPolynomialEvaluator_0_to_prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid568_sqrtTableGenerator_lutmem_0_to_prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_1_q : std_logic_vector (11 downto 0);
    signal reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_q : std_logic_vector (15 downto 0);
    signal reg_s1_uid571_uid574_sqrtPolynomialEvaluator_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_1_q : std_logic_vector (22 downto 0);
    signal reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_q : std_logic_vector (7 downto 0);
    signal reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (7 downto 0);
    signal reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStage0Idx1_uid382_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_3_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStage0Idx2_uid385_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_4_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid398_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStage1Idx1_uid391_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_3_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStage1Idx2_uid394_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_4_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStage1Idx3_uid397_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_5_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid403_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid408_arcsinXO2XTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid409_arcsinXO2XPolyEval_0_to_prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid408_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_1_q : std_logic_vector (11 downto 0);
    signal reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_q : std_logic_vector (14 downto 0);
    signal reg_s1_uid411_uid414_arcsinXO2XPolyEval_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_1_q : std_logic_vector (20 downto 0);
    signal reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_fracY_uid428_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (22 downto 0);
    signal reg_SqrtFPL22dto0_uid73_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (22 downto 0);
    signal reg_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_add_one_fracY_uid428_uid429_uid429_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (23 downto 0);
    signal reg_expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (7 downto 0);
    signal reg_expFracPreRound_uid483_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q : std_logic_vector (34 downto 0);
    signal reg_roundBitAndNormalizationOp_uid485_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (25 downto 0);
    signal reg_expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (11 downto 0);
    signal reg_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q : std_logic_vector (2 downto 0);
    signal reg_fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q : std_logic_vector (22 downto 0);
    signal reg_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q : std_logic_vector (7 downto 0);
    signal reg_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_rightShiftStageSel4Dto3_uid531_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_oFracArcsinL_uid89_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_2_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStage0Idx1_uid526_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_3_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStage0Idx2_uid529_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_4_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid542_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid547_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_pad_fxpArcsinL_uid94_uid95_acosX_uid8_fpArccosPiTest_0_to_path1NegCase_uid95_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (26 downto 0);
    signal reg_path1NegCaseN_uid97_acosX_uid8_fpArccosPiTest_0_to_path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid552_arccosXO2TabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid552_arccosXO2TabGen_lutmem_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_1_q : std_logic_vector (11 downto 0);
    signal reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q : std_logic_vector (14 downto 0);
    signal reg_s1_uid555_uid558_arccosXO2PolyEval_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_1_q : std_logic_vector (23 downto 0);
    signal reg_pad_pi2_uid111_uid112_acosX_uid8_fpArccosPiTest_0_to_path2Diff_uid112_acosX_uid8_fpArccosPiTest_0_q : std_logic_vector (27 downto 0);
    signal reg_fxpArccosX_uid110_acosX_uid8_fpArccosPiTest_0_to_path2Diff_uid112_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (26 downto 0);
    signal reg_Path1ResFP22dto0_uid130_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_2_q : std_logic_vector (22 downto 0);
    signal reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_q : std_logic_vector (22 downto 0);
    signal reg_Path1ResFP30dto23_uid133_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_2_q : std_logic_vector (7 downto 0);
    signal reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_q : std_logic_vector (7 downto 0);
    signal reg_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid140_acosX_uid8_fpArccosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_add_one_fracX_uid147_uid148_uid148_rAcosPi_uid13_fpArccosPiTest_0_to_prod_uid186_rAcosPi_uid13_fpArccosPiTest_0_q : std_logic_vector (23 downto 0);
    signal reg_expFracPreRound_uid204_rAcosPi_uid13_fpArccosPiTest_0_to_expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_0_q : std_logic_vector (34 downto 0);
    signal reg_roundBitAndNormalizationOp_uid206_rAcosPi_uid13_fpArccosPiTest_0_to_expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_1_q : std_logic_vector (25 downto 0);
    signal reg_expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_0_to_expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_1_q : std_logic_vector (11 downto 0);
    signal reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_0_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_concExc_uid229_rAcosPi_uid13_fpArccosPiTest_0_to_excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_0_q : std_logic_vector (2 downto 0);
    signal reg_fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_0_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_3_q : std_logic_vector (22 downto 0);
    signal reg_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_0_to_expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_3_q : std_logic_vector (7 downto 0);
    signal ld_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q_to_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (23 downto 0);
    signal ld_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_c_q : std_logic_vector (31 downto 0);
    signal ld_path2PosCaseFPFraction_uid122_acosX_uid8_fpArccosPiTest_b_to_path2PosCaseFP_uid123_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (22 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path2ResFP_uid125_acosX_uid8_fpArccosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q_to_fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_b_q : std_logic_vector (1 downto 0);
    signal ld_expX_uid143_rAcosPi_uid13_fpArccosPiTest_b_to_expSum_uid183_rAcosPi_uid13_fpArccosPiTest_a_q : std_logic_vector (7 downto 0);
    signal ld_expSum_uid183_rAcosPi_uid13_fpArccosPiTest_q_to_expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_a_q : std_logic_vector (8 downto 0);
    signal ld_signX_uid145_rAcosPi_uid13_fpArccosPiTest_b_to_signR_uid211_rAcosPi_uid13_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_q_to_excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_q_to_excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_q_to_excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_2_q_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_1_q_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_q_to_concExc_uid229_rAcosPi_uid13_fpArccosPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_0_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_3_q_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_d_q : std_logic_vector (22 downto 0);
    signal ld_signR_uid211_rAcosPi_uid13_fpArccosPiTest_q_to_signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_q_to_R_uid242_rAcosPi_uid13_fpArccosPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_f_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_c_q : std_logic_vector (5 downto 0);
    signal ld_expOddSelect_uid352_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (22 downto 0);
    signal ld_InvSignX_uid360_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_join_uid365_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_q : std_logic_vector (1 downto 0);
    signal ld_negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_InvExc_N_uid442_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_InvExpXIsZero_uid444_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (8 downto 0);
    signal ld_reg_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_d_q : std_logic_vector (22 downto 0);
    signal ld_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid567_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid567_sqrtTableGenerator_lutmem_a_q : std_logic_vector (7 downto 0);
    signal ld_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_b_to_reg_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_0_to_fpL_uid70_acosX_uid8_fpArccosPiTest_0_a_q : std_logic_vector (22 downto 0);
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_to_reg_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_a_q : std_logic_vector (7 downto 0);
    signal ld_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_to_reg_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_a_q : std_logic_vector (0 downto 0);
    signal ld_yT1_uid553_arccosXO2PolyEval_b_to_reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0_a_q : std_logic_vector (11 downto 0);
    signal ld_mAddr_uid107_acosX_uid8_fpArccosPiTest_b_to_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_q_to_reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_2_a_q : std_logic_vector (0 downto 0);
    signal ld_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_b_to_reg_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_0_to_expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_3_a_q : std_logic_vector (7 downto 0);
    signal ld_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q_to_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_a_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_sticky_ena_q : signal is true;
    signal ld_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_c_inputreg_q : std_logic_vector (31 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_eq : std_logic;
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_sticky_ena_q : signal is true;
    signal ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_reset0 : std_logic;
    signal ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_sticky_ena_q : signal is true;
    signal ld_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_sticky_ena_q : signal is true;
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena_q : signal is true;
    signal ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena_q : signal is true;
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_sticky_ena_q : signal is true;
    signal ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_sticky_ena_q : signal is true;
    signal ld_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid567_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid567_sqrtTableGenerator_lutmem_a_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_inputreg_q : std_logic_vector (15 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_reset0 : std_logic;
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_ia : std_logic_vector (15 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_iq : std_logic_vector (15 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_q : std_logic_vector (15 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_sticky_ena_q : signal is true;
    signal ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_inputreg_q : std_logic_vector (14 downto 0);
    signal ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_sticky_ena_q : signal is true;
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_yT1_uid553_arccosXO2PolyEval_b_to_reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0_a_inputreg_q : std_logic_vector (11 downto 0);
    signal ld_mAddr_uid107_acosX_uid8_fpArccosPiTest_b_to_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_reset0 : std_logic;
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_eq : std_logic;
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_sticky_ena_q : signal is true;
    signal ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_reset0 : std_logic;
    signal ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_sticky_ena_q : signal is true;
    signal pad_o_uid27_uid63_acosX_uid8_fpArccosPiTest_q : std_logic_vector (35 downto 0);
    signal pad_pi2_uid111_uid112_acosX_uid8_fpArccosPiTest_q : std_logic_vector (27 downto 0);
    signal expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(14 downto 0);
    signal expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(14 downto 0);
    signal expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_o : std_logic_vector (14 downto 0);
    signal expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_cin : std_logic_vector (0 downto 0);
    signal expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_n : std_logic_vector (0 downto 0);
    signal expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(14 downto 0);
    signal expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(14 downto 0);
    signal expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_o : std_logic_vector (14 downto 0);
    signal expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_cin : std_logic_vector (0 downto 0);
    signal expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_n : std_logic_vector (0 downto 0);
    signal vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a : std_logic_vector(8 downto 0);
    signal vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector(8 downto 0);
    signal vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_o : std_logic_vector (8 downto 0);
    signal vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_cin : std_logic_vector (0 downto 0);
    signal vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_c : std_logic_vector (0 downto 0);
    signal expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(14 downto 0);
    signal expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(14 downto 0);
    signal expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o : std_logic_vector (14 downto 0);
    signal expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_cin : std_logic_vector (0 downto 0);
    signal expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_n : std_logic_vector (0 downto 0);
    signal expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(14 downto 0);
    signal expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(14 downto 0);
    signal expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o : std_logic_vector (14 downto 0);
    signal expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_cin : std_logic_vector (0 downto 0);
    signal expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_n : std_logic_vector (0 downto 0);
    signal path2PosCaseFP_uid123_acosX_uid8_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal excSelBits_uid137_acosX_uid8_fpArccosPiTest_q : std_logic_vector (2 downto 0);
    signal InvExc_N_uid442_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid442_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal expX_uid15_acosX_uid8_fpArccosPiTest_in : std_logic_vector (30 downto 0);
    signal expX_uid15_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid16_acosX_uid8_fpArccosPiTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid16_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal singX_uid17_acosX_uid8_fpArccosPiTest_in : std_logic_vector (31 downto 0);
    signal singX_uid17_acosX_uid8_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal expXIsZero_uid33_acosX_uid8_fpArccosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid33_acosX_uid8_fpArccosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid33_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid35_acosX_uid8_fpArccosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid35_acosX_uid8_fpArccosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid35_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid37_acosX_uid8_fpArccosPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid37_acosX_uid8_fpArccosPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid37_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid38_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid38_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid38_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expGT0_uid45_acosX_uid8_fpArccosPiTest_a : std_logic_vector(10 downto 0);
    signal expGT0_uid45_acosX_uid8_fpArccosPiTest_b : std_logic_vector(10 downto 0);
    signal expGT0_uid45_acosX_uid8_fpArccosPiTest_o : std_logic_vector (10 downto 0);
    signal expGT0_uid45_acosX_uid8_fpArccosPiTest_cin : std_logic_vector (0 downto 0);
    signal expGT0_uid45_acosX_uid8_fpArccosPiTest_c : std_logic_vector (0 downto 0);
    signal expEQ0_uid46_acosX_uid8_fpArccosPiTest_a : std_logic_vector(7 downto 0);
    signal expEQ0_uid46_acosX_uid8_fpArccosPiTest_b : std_logic_vector(7 downto 0);
    signal expEQ0_uid46_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid47_acosX_uid8_fpArccosPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid47_acosX_uid8_fpArccosPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid47_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal shiftValue_uid52_acosX_uid8_fpArccosPiTest_a : std_logic_vector(11 downto 0);
    signal shiftValue_uid52_acosX_uid8_fpArccosPiTest_b : std_logic_vector(11 downto 0);
    signal shiftValue_uid52_acosX_uid8_fpArccosPiTest_o : std_logic_vector (11 downto 0);
    signal shiftValue_uid52_acosX_uid8_fpArccosPiTest_cin : std_logic_vector (0 downto 0);
    signal shiftValue_uid52_acosX_uid8_fpArccosPiTest_n : std_logic_vector (0 downto 0);
    signal shiftValuePre_uid53_acosX_uid8_fpArccosPiTest_a : std_logic_vector(8 downto 0);
    signal shiftValuePre_uid53_acosX_uid8_fpArccosPiTest_b : std_logic_vector(8 downto 0);
    signal shiftValuePre_uid53_acosX_uid8_fpArccosPiTest_o : std_logic_vector (8 downto 0);
    signal shiftValuePre_uid53_acosX_uid8_fpArccosPiTest_q : std_logic_vector (8 downto 0);
    signal oMy_uid63_acosX_uid8_fpArccosPiTest_a : std_logic_vector(36 downto 0);
    signal oMy_uid63_acosX_uid8_fpArccosPiTest_b : std_logic_vector(36 downto 0);
    signal oMy_uid63_acosX_uid8_fpArccosPiTest_o : std_logic_vector (36 downto 0);
    signal oMy_uid63_acosX_uid8_fpArccosPiTest_q : std_logic_vector (36 downto 0);
    signal expL_uid67_acosX_uid8_fpArccosPiTest_a : std_logic_vector(8 downto 0);
    signal expL_uid67_acosX_uid8_fpArccosPiTest_b : std_logic_vector(8 downto 0);
    signal expL_uid67_acosX_uid8_fpArccosPiTest_o : std_logic_vector (8 downto 0);
    signal expL_uid67_acosX_uid8_fpArccosPiTest_q : std_logic_vector (8 downto 0);
    signal srVal_uid76_acosX_uid8_fpArccosPiTest_a : std_logic_vector(8 downto 0);
    signal srVal_uid76_acosX_uid8_fpArccosPiTest_b : std_logic_vector(8 downto 0);
    signal srVal_uid76_acosX_uid8_fpArccosPiTest_o : std_logic_vector (8 downto 0);
    signal srVal_uid76_acosX_uid8_fpArccosPiTest_q : std_logic_vector (8 downto 0);
    signal path1NegCase_uid95_acosX_uid8_fpArccosPiTest_a : std_logic_vector(28 downto 0);
    signal path1NegCase_uid95_acosX_uid8_fpArccosPiTest_b : std_logic_vector(28 downto 0);
    signal path1NegCase_uid95_acosX_uid8_fpArccosPiTest_o : std_logic_vector (28 downto 0);
    signal path1NegCase_uid95_acosX_uid8_fpArccosPiTest_q : std_logic_vector (28 downto 0);
    signal path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_a : std_logic_vector(8 downto 0);
    signal path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_b : std_logic_vector(8 downto 0);
    signal path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_o : std_logic_vector (8 downto 0);
    signal path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_q : std_logic_vector (8 downto 0);
    signal path2Diff_uid112_acosX_uid8_fpArccosPiTest_a : std_logic_vector(28 downto 0);
    signal path2Diff_uid112_acosX_uid8_fpArccosPiTest_b : std_logic_vector(28 downto 0);
    signal path2Diff_uid112_acosX_uid8_fpArccosPiTest_o : std_logic_vector (28 downto 0);
    signal path2Diff_uid112_acosX_uid8_fpArccosPiTest_q : std_logic_vector (28 downto 0);
    signal expRCalc_uid134_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal expRCalc_uid134_acosX_uid8_fpArccosPiTest_q : std_logic_vector (7 downto 0);
    signal outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q : std_logic_vector(1 downto 0);
    signal expRPostExc_uid140_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid140_acosX_uid8_fpArccosPiTest_q : std_logic_vector (7 downto 0);
    signal exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(36 downto 0);
    signal expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(36 downto 0);
    signal expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_o : std_logic_vector (36 downto 0);
    signal expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (35 downto 0);
    signal excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_d : std_logic_vector(0 downto 0);
    signal excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid223_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid223_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid223_rAcosPi_uid13_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid223_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_d : std_logic_vector(0 downto 0);
    signal excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid227_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid227_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid227_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (7 downto 0);
    signal rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (36 downto 0);
    signal vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (34 downto 0);
    signal fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid338_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid338_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid338_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(8 downto 0);
    signal expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector(8 downto 0);
    signal expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_o : std_logic_vector (8 downto 0);
    signal expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector (8 downto 0);
    signal expOddSig_uid349_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(8 downto 0);
    signal expOddSig_uid349_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector(8 downto 0);
    signal expOddSig_uid349_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_o : std_logic_vector (8 downto 0);
    signal expOddSig_uid349_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector (8 downto 0);
    signal inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal minInf_uid363_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal minInf_uid363_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal minInf_uid363_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(1 downto 0);
    signal expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector (7 downto 0);
    signal rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid455_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid455_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid455_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(36 downto 0);
    signal expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(36 downto 0);
    signal expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o : std_logic_vector (36 downto 0);
    signal expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (35 downto 0);
    signal excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_d : std_logic_vector(0 downto 0);
    signal excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid502_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid502_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid502_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid502_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_d : std_logic_vector(0 downto 0);
    signal excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid505_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid505_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid505_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid506_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid506_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid506_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (7 downto 0);
    signal signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal fracOOPi_uid10_fpArccosPiTest_in : std_logic_vector (22 downto 0);
    signal fracOOPi_uid10_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal piF_uid128_acosX_uid8_fpArccosPiTest_in : std_logic_vector (26 downto 0);
    signal piF_uid128_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal fracRCalc_uid131_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal fracRCalc_uid131_acosX_uid8_fpArccosPiTest_q : std_logic_vector (22 downto 0);
    signal normalizeBit_uid187_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (47 downto 0);
    signal normalizeBit_uid187_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal fracRPostNormHigh_uid189_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (46 downto 0);
    signal fracRPostNormHigh_uid189_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (23 downto 0);
    signal fracRPostNormLow_uid190_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (45 downto 0);
    signal fracRPostNormLow_uid190_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (23 downto 0);
    signal stickyRange_uid192_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (21 downto 0);
    signal stickyRange_uid192_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (21 downto 0);
    signal Prod22_uid193_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (22 downto 0);
    signal Prod22_uid193_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal normalizeBit_uid466_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in : std_logic_vector (47 downto 0);
    signal normalizeBit_uid466_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal fracRPostNormHigh_uid468_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in : std_logic_vector (46 downto 0);
    signal fracRPostNormHigh_uid468_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector (23 downto 0);
    signal fracRPostNormLow_uid469_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in : std_logic_vector (45 downto 0);
    signal fracRPostNormLow_uid469_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector (23 downto 0);
    signal stickyRange_uid471_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in : std_logic_vector (21 downto 0);
    signal stickyRange_uid471_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector (21 downto 0);
    signal Prod22_uid472_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in : std_logic_vector (22 downto 0);
    signal Prod22_uid472_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal prodXYTruncFR_uid583_pT1_uid410_arcsinXO2XPolyEval_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid583_pT1_uid410_arcsinXO2XPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid586_pT2_uid416_arcsinXO2XPolyEval_in : std_logic_vector (35 downto 0);
    signal prodXYTruncFR_uid586_pT2_uid416_arcsinXO2XPolyEval_b : std_logic_vector (21 downto 0);
    signal prodXYTruncFR_uid589_pT1_uid554_arccosXO2PolyEval_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid589_pT1_uid554_arccosXO2PolyEval_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid592_pT2_uid560_arccosXO2PolyEval_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid592_pT2_uid560_arccosXO2PolyEval_b : std_logic_vector (24 downto 0);
    signal prodXYTruncFR_uid595_pT1_uid570_sqrtPolynomialEvaluator_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid595_pT1_uid570_sqrtPolynomialEvaluator_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid598_pT2_uid576_sqrtPolynomialEvaluator_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid598_pT2_uid576_sqrtPolynomialEvaluator_b : std_logic_vector (23 downto 0);
    signal sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_in : std_logic_vector (15 downto 0);
    signal sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b : std_logic_vector (14 downto 0);
    signal fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_q : std_logic_vector (22 downto 0);
    signal concExc_uid229_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (2 downto 0);
    signal R_uid242_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in : std_logic_vector (15 downto 0);
    signal FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector (15 downto 0);
    signal concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (2 downto 0);
    signal R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmp_a : std_logic_vector(6 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmp_b : std_logic_vector(6 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmp_a : std_logic_vector(6 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmp_b : std_logic_vector(6 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_nor_q : std_logic_vector(0 downto 0);
    signal oFracX_uid51_uid51_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal InvExpXIsZero_uid43_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid43_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid39_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid39_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid42_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid42_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid48_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid48_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal fxpShifterBits_uid55_acosX_uid8_fpArccosPiTest_in : std_logic_vector (5 downto 0);
    signal fxpShifterBits_uid55_acosX_uid8_fpArccosPiTest_b : std_logic_vector (5 downto 0);
    signal l_uid65_acosX_uid8_fpArccosPiTest_in : std_logic_vector (34 downto 0);
    signal l_uid65_acosX_uid8_fpArccosPiTest_b : std_logic_vector (34 downto 0);
    signal expLRange_uid69_acosX_uid8_fpArccosPiTest_in : std_logic_vector (7 downto 0);
    signal expLRange_uid69_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal srValRange_uid77_acosX_uid8_fpArccosPiTest_in : std_logic_vector (4 downto 0);
    signal srValRange_uid77_acosX_uid8_fpArccosPiTest_b : std_logic_vector (4 downto 0);
    signal path1NegCaseN_uid97_acosX_uid8_fpArccosPiTest_in : std_logic_vector (27 downto 0);
    signal path1NegCaseN_uid97_acosX_uid8_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal path1NegCaseFracHigh_uid98_acosX_uid8_fpArccosPiTest_in : std_logic_vector (26 downto 0);
    signal path1NegCaseFracHigh_uid98_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal path1NegCaseFracLow_uid99_acosX_uid8_fpArccosPiTest_in : std_logic_vector (25 downto 0);
    signal path1NegCaseFracLow_uid99_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal path1NegCaseExpRange_uid102_acosX_uid8_fpArccosPiTest_in : std_logic_vector (7 downto 0);
    signal path1NegCaseExpRange_uid102_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal normBit_uid114_acosX_uid8_fpArccosPiTest_in : std_logic_vector (27 downto 0);
    signal normBit_uid114_acosX_uid8_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal path2NegCaseFPFrac_uid115_acosX_uid8_fpArccosPiTest_in : std_logic_vector (26 downto 0);
    signal path2NegCaseFPFrac_uid115_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal path2NegCaseFPFrac_uid118_acosX_uid8_fpArccosPiTest_in : std_logic_vector (25 downto 0);
    signal path2NegCaseFPFrac_uid118_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal sR_uid141_acosX_uid8_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (35 downto 0);
    signal expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (11 downto 0);
    signal InvExcRNaN_uid240_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid240_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal RightShiftStage136dto1_uid265_fxpX_uid59_acosX_uid8_fpArccosPiTest_in : std_logic_vector (36 downto 0);
    signal RightShiftStage136dto1_uid265_fxpX_uid59_acosX_uid8_fpArccosPiTest_b : std_logic_vector (35 downto 0);
    signal RightShiftStage136dto2_uid268_fxpX_uid59_acosX_uid8_fpArccosPiTest_in : std_logic_vector (36 downto 0);
    signal RightShiftStage136dto2_uid268_fxpX_uid59_acosX_uid8_fpArccosPiTest_b : std_logic_vector (34 downto 0);
    signal RightShiftStage136dto3_uid271_fxpX_uid59_acosX_uid8_fpArccosPiTest_in : std_logic_vector (36 downto 0);
    signal RightShiftStage136dto3_uid271_fxpX_uid59_acosX_uid8_fpArccosPiTest_b : std_logic_vector (33 downto 0);
    signal rVStage_uid285_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid285_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid288_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in : std_logic_vector (18 downto 0);
    signal vStage_uid288_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector (18 downto 0);
    signal rVStage_uid292_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid292_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid295_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in : std_logic_vector (26 downto 0);
    signal vStage_uid295_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector (26 downto 0);
    signal rVStage_uid306_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid306_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid309_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in : std_logic_vector (32 downto 0);
    signal vStage_uid309_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector (32 downto 0);
    signal InvFracXIsZero_uid339_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid339_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid342_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid342_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expREven_uid347_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in : std_logic_vector (8 downto 0);
    signal expREven_uid347_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal expROdd_uid350_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in : std_logic_vector (8 downto 0);
    signal expROdd_uid350_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal RightShiftStage123dto1_uid400_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage123dto1_uid400_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal InvExpXIsZero_uid444_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid444_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid440_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid440_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid443_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid443_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid456_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid456_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid459_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid459_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in : std_logic_vector (35 downto 0);
    signal expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector (11 downto 0);
    signal RightShiftStage023dto2_uid533_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage023dto2_uid533_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b : std_logic_vector (21 downto 0);
    signal RightShiftStage023dto4_uid536_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage023dto4_uid536_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b : std_logic_vector (19 downto 0);
    signal RightShiftStage023dto6_uid539_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage023dto6_uid539_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b : std_logic_vector (17 downto 0);
    signal fpOOPi_uid11_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal fracRPostNorm_uid191_rAcosPi_uid13_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPostNorm_uid191_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal extraStickyBit_uid194_rAcosPi_uid13_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal extraStickyBit_uid194_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (0 downto 0);
    signal stickyExtendedRange_uid195_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (22 downto 0);
    signal fracRPostNorm_uid470_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPostNorm_uid470_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal extraStickyBit_uid473_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal extraStickyBit_uid473_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (0 downto 0);
    signal stickyExtendedRange_uid474_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (22 downto 0);
    signal lowRangeB_uid411_arcsinXO2XPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid411_arcsinXO2XPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid412_arcsinXO2XPolyEval_in : std_logic_vector (12 downto 0);
    signal highBBits_uid412_arcsinXO2XPolyEval_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid417_arcsinXO2XPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid417_arcsinXO2XPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid418_arcsinXO2XPolyEval_in : std_logic_vector (21 downto 0);
    signal highBBits_uid418_arcsinXO2XPolyEval_b : std_logic_vector (19 downto 0);
    signal lowRangeB_uid555_arccosXO2PolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid555_arccosXO2PolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid556_arccosXO2PolyEval_in : std_logic_vector (12 downto 0);
    signal highBBits_uid556_arccosXO2PolyEval_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid561_arccosXO2PolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid561_arccosXO2PolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid562_arccosXO2PolyEval_in : std_logic_vector (24 downto 0);
    signal highBBits_uid562_arccosXO2PolyEval_b : std_logic_vector (22 downto 0);
    signal lowRangeB_uid571_sqrtPolynomialEvaluator_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid571_sqrtPolynomialEvaluator_b : std_logic_vector (0 downto 0);
    signal highBBits_uid572_sqrtPolynomialEvaluator_in : std_logic_vector (12 downto 0);
    signal highBBits_uid572_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid577_sqrtPolynomialEvaluator_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid577_sqrtPolynomialEvaluator_b : std_logic_vector (1 downto 0);
    signal highBBits_uid578_sqrtPolynomialEvaluator_in : std_logic_vector (23 downto 0);
    signal highBBits_uid578_sqrtPolynomialEvaluator_b : std_logic_vector (21 downto 0);
    signal yT1_uid409_arcsinXO2XPolyEval_in : std_logic_vector (14 downto 0);
    signal yT1_uid409_arcsinXO2XPolyEval_b : std_logic_vector (11 downto 0);
    signal yT1_uid569_sqrtPolynomialEvaluator_in : std_logic_vector (15 downto 0);
    signal yT1_uid569_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal ArcsinL22dto0_uid88_acosX_uid8_fpArccosPiTest_in : std_logic_vector (22 downto 0);
    signal ArcsinL22dto0_uid88_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal ArcsinL30dto23_uid90_acosX_uid8_fpArccosPiTest_in : std_logic_vector (30 downto 0);
    signal ArcsinL30dto23_uid90_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal oFracXExt_uid58_acosX_uid8_fpArccosPiTest_q : std_logic_vector (36 downto 0);
    signal exc_N_uid40_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid40_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid40_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expXZFracNotZero_uid49_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal expXZFracNotZero_uid49_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal expXZFracNotZero_uid49_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal shiftValue_uid56_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal shiftValue_uid56_acosX_uid8_fpArccosPiTest_q : std_logic_vector (5 downto 0);
    signal rVStage_uid278_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid278_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid281_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in : std_logic_vector (2 downto 0);
    signal vStage_uid281_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector (2 downto 0);
    signal fpL_uid70_acosX_uid8_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal rightShiftStageSel4Dto3_uid387_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid387_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid398_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid398_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid403_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid403_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal path1NegCaseUR_uid103_acosX_uid8_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal path2NegCaseFPL_uid116_acosX_uid8_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal path2NegCaseFPS_uid119_acosX_uid8_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal expX_uid143_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (30 downto 0);
    signal expX_uid143_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal signX_uid145_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (31 downto 0);
    signal signX_uid145_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal fracX_uid147_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid147_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (7 downto 0);
    signal expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal rightShiftStage2Idx1_uid267_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage2Idx2_uid270_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage2Idx3_uid273_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (36 downto 0);
    signal cStage_uid289_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid296_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid307_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid307_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid307_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid310_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (34 downto 0);
    signal exc_N_uid340_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid340_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid340_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1_uid402_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid457_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid457_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid457_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in : std_logic_vector (7 downto 0);
    signal expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal rightShiftStage1Idx1_uid535_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx2_uid538_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx3_uid541_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal expY_uid144_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (30 downto 0);
    signal expY_uid144_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal signY_uid146_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (31 downto 0);
    signal signY_uid146_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal fracY_uid149_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (22 downto 0);
    signal fracY_uid149_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal FracRPostNorm1dto0_uid199_rAcosPi_uid13_fpArccosPiTest_in : std_logic_vector (1 downto 0);
    signal FracRPostNorm1dto0_uid199_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector (1 downto 0);
    signal expFracPreRound_uid204_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (34 downto 0);
    signal stickyRangeComparator_uid197_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(22 downto 0);
    signal stickyRangeComparator_uid197_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(22 downto 0);
    signal stickyRangeComparator_uid197_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal FracRPostNorm1dto0_uid478_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in : std_logic_vector (1 downto 0);
    signal FracRPostNorm1dto0_uid478_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector (1 downto 0);
    signal expFracPreRound_uid483_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (34 downto 0);
    signal stickyRangeComparator_uid476_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(22 downto 0);
    signal stickyRangeComparator_uid476_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(22 downto 0);
    signal stickyRangeComparator_uid476_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal sumAHighB_uid413_arcsinXO2XPolyEval_a : std_logic_vector(19 downto 0);
    signal sumAHighB_uid413_arcsinXO2XPolyEval_b : std_logic_vector(19 downto 0);
    signal sumAHighB_uid413_arcsinXO2XPolyEval_o : std_logic_vector (19 downto 0);
    signal sumAHighB_uid413_arcsinXO2XPolyEval_q : std_logic_vector (19 downto 0);
    signal sumAHighB_uid419_arcsinXO2XPolyEval_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid419_arcsinXO2XPolyEval_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid419_arcsinXO2XPolyEval_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid419_arcsinXO2XPolyEval_q : std_logic_vector (30 downto 0);
    signal sumAHighB_uid557_arccosXO2PolyEval_a : std_logic_vector(22 downto 0);
    signal sumAHighB_uid557_arccosXO2PolyEval_b : std_logic_vector(22 downto 0);
    signal sumAHighB_uid557_arccosXO2PolyEval_o : std_logic_vector (22 downto 0);
    signal sumAHighB_uid557_arccosXO2PolyEval_q : std_logic_vector (22 downto 0);
    signal sumAHighB_uid563_arccosXO2PolyEval_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid563_arccosXO2PolyEval_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid563_arccosXO2PolyEval_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid563_arccosXO2PolyEval_q : std_logic_vector (30 downto 0);
    signal sumAHighB_uid573_sqrtPolynomialEvaluator_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid573_sqrtPolynomialEvaluator_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid573_sqrtPolynomialEvaluator_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid573_sqrtPolynomialEvaluator_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid579_sqrtPolynomialEvaluator_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid579_sqrtPolynomialEvaluator_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid579_sqrtPolynomialEvaluator_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid579_sqrtPolynomialEvaluator_q : std_logic_vector (29 downto 0);
    signal oFracArcsinL_uid89_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal srValArcsinL_uid91_acosX_uid8_fpArccosPiTest_a : std_logic_vector(8 downto 0);
    signal srValArcsinL_uid91_acosX_uid8_fpArccosPiTest_b : std_logic_vector(8 downto 0);
    signal srValArcsinL_uid91_acosX_uid8_fpArccosPiTest_o : std_logic_vector (8 downto 0);
    signal srValArcsinL_uid91_acosX_uid8_fpArccosPiTest_q : std_logic_vector (8 downto 0);
    signal X36dto16_uid245_fxpX_uid59_acosX_uid8_fpArccosPiTest_in : std_logic_vector (36 downto 0);
    signal X36dto16_uid245_fxpX_uid59_acosX_uid8_fpArccosPiTest_b : std_logic_vector (20 downto 0);
    signal X36dto32_uid248_fxpX_uid59_acosX_uid8_fpArccosPiTest_in : std_logic_vector (36 downto 0);
    signal X36dto32_uid248_fxpX_uid59_acosX_uid8_fpArccosPiTest_b : std_logic_vector (4 downto 0);
    signal InvExc_N_uid41_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid41_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal inputOutOfRange_uid50_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal inputOutOfRange_uid50_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal inputOutOfRange_uid50_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStageSel5Dto4_uid252_fxpX_uid59_acosX_uid8_fpArccosPiTest_in : std_logic_vector (5 downto 0);
    signal rightShiftStageSel5Dto4_uid252_fxpX_uid59_acosX_uid8_fpArccosPiTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel3Dto2_uid263_fxpX_uid59_acosX_uid8_fpArccosPiTest_in : std_logic_vector (3 downto 0);
    signal rightShiftStageSel3Dto2_uid263_fxpX_uid59_acosX_uid8_fpArccosPiTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel1Dto0_uid274_fxpX_uid59_acosX_uid8_fpArccosPiTest_in : std_logic_vector (1 downto 0);
    signal rightShiftStageSel1Dto0_uid274_fxpX_uid59_acosX_uid8_fpArccosPiTest_b : std_logic_vector (1 downto 0);
    signal cStage_uid282_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (34 downto 0);
    signal expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in : std_logic_vector (30 downto 0);
    signal expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in : std_logic_vector (31 downto 0);
    signal signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal path1ResFP_uid105_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal path1ResFP_uid105_acosX_uid8_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal path2NegCaseFP_uid121_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal path2NegCaseFP_uid121_acosX_uid8_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid157_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid157_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid157_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal add_one_fracX_uid147_uid148_uid148_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal fracXIsZero_uid159_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid159_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid159_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (36 downto 0);
    signal vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (34 downto 0);
    signal vStagei_uid311_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid311_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (34 downto 0);
    signal InvExc_N_uid341_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid341_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal InvExc_N_uid458_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid458_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid173_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid173_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid173_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal signR_uid211_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal signR_uid211_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal signR_uid211_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal add_one_fracY_uid149_uid150_uid150_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal fracXIsZero_uid175_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid175_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid175_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal sticky_uid198_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal sticky_uid198_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal sticky_uid477_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal sticky_uid477_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal s1_uid411_uid414_arcsinXO2XPolyEval_q : std_logic_vector (20 downto 0);
    signal s2_uid417_uid420_arcsinXO2XPolyEval_q : std_logic_vector (32 downto 0);
    signal s1_uid555_uid558_arccosXO2PolyEval_q : std_logic_vector (23 downto 0);
    signal s2_uid561_uid564_arccosXO2PolyEval_q : std_logic_vector (32 downto 0);
    signal s1_uid571_uid574_sqrtPolynomialEvaluator_q : std_logic_vector (22 downto 0);
    signal s2_uid577_uid580_sqrtPolynomialEvaluator_q : std_logic_vector (31 downto 0);
    signal X23dto8_uid524_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal X23dto8_uid524_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b : std_logic_vector (15 downto 0);
    signal X23dto16_uid527_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal X23dto16_uid527_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal srValArcsinLRange_uid92_acosX_uid8_fpArccosPiTest_in : std_logic_vector (4 downto 0);
    signal srValArcsinLRange_uid92_acosX_uid8_fpArccosPiTest_b : std_logic_vector (4 downto 0);
    signal rightShiftStage0Idx1_uid247_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage0Idx2_uid250_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (36 downto 0);
    signal exc_R_uid44_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid44_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid44_acosX_uid8_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid44_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal xRegAndOutOfRange_uid135_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal xRegAndOutOfRange_uid135_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal xRegAndOutOfRange_uid135_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (36 downto 0);
    signal expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expX0_uid351_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in : std_logic_vector (0 downto 0);
    signal expX0_uid351_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal fracXAddr_uid355_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in : std_logic_vector (22 downto 0);
    signal fracXAddr_uid355_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector (6 downto 0);
    signal InvSignX_uid360_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid360_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal RightShiftStage023dto2_uid389_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage023dto2_uid389_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b : std_logic_vector (21 downto 0);
    signal RightShiftStage023dto4_uid392_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage023dto4_uid392_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b : std_logic_vector (19 downto 0);
    signal RightShiftStage023dto6_uid395_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage023dto6_uid395_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b : std_logic_vector (17 downto 0);
    signal Path1ResFP22dto0_uid130_acosX_uid8_fpArccosPiTest_in : std_logic_vector (22 downto 0);
    signal Path1ResFP22dto0_uid130_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal Path1ResFP30dto23_uid133_acosX_uid8_fpArccosPiTest_in : std_logic_vector (30 downto 0);
    signal Path1ResFP30dto23_uid133_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal path2ResFP_uid125_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal path2ResFP_uid125_acosX_uid8_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid161_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid161_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal inputIsMax_uid60_acosX_uid8_fpArccosPiTest_in : std_logic_vector (36 downto 0);
    signal inputIsMax_uid60_acosX_uid8_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal y_uid61_acosX_uid8_fpArccosPiTest_in : std_logic_vector (35 downto 0);
    signal y_uid61_acosX_uid8_fpArccosPiTest_b : std_logic_vector (34 downto 0);
    signal rVStage_uid299_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid299_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid302_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in : std_logic_vector (30 downto 0);
    signal vStage_uid302_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector (30 downto 0);
    signal rVStage_uid313_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid313_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal vStage_uid316_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in : std_logic_vector (33 downto 0);
    signal vStage_uid316_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector (33 downto 0);
    signal exc_R_uid344_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid344_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid344_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid344_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal sAddr_uid80_acosX_uid8_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal sAddr_uid80_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal RightShiftStage123dto1_uid544_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage123dto1_uid544_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal InvExpXIsZero_uid181_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid181_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid176_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid176_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid176_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid177_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid177_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal lrs_uid200_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (2 downto 0);
    signal lrs_uid479_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (2 downto 0);
    signal fxpArcSinXO2XRes_uid83_acosX_uid8_fpArccosPiTest_in : std_logic_vector (30 downto 0);
    signal fxpArcSinXO2XRes_uid83_acosX_uid8_fpArccosPiTest_b : std_logic_vector (25 downto 0);
    signal fxpArccosX_uid110_acosX_uid8_fpArccosPiTest_in : std_logic_vector (30 downto 0);
    signal fxpArccosX_uid110_acosX_uid8_fpArccosPiTest_b : std_logic_vector (26 downto 0);
    signal fracR_uid359_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in : std_logic_vector (28 downto 0);
    signal fracR_uid359_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal rightShiftStage0Idx1_uid526_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage0Idx2_uid529_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStageSel4Dto3_uid531_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid531_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid542_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid542_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid547_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid547_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal excRNaN_uid136_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid136_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid136_acosX_uid8_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid136_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal RightShiftStage036dto4_uid254_fxpX_uid59_acosX_uid8_fpArccosPiTest_in : std_logic_vector (36 downto 0);
    signal RightShiftStage036dto4_uid254_fxpX_uid59_acosX_uid8_fpArccosPiTest_b : std_logic_vector (32 downto 0);
    signal RightShiftStage036dto8_uid257_fxpX_uid59_acosX_uid8_fpArccosPiTest_in : std_logic_vector (36 downto 0);
    signal RightShiftStage036dto8_uid257_fxpX_uid59_acosX_uid8_fpArccosPiTest_b : std_logic_vector (28 downto 0);
    signal RightShiftStage036dto12_uid260_fxpX_uid59_acosX_uid8_fpArccosPiTest_in : std_logic_vector (36 downto 0);
    signal RightShiftStage036dto12_uid260_fxpX_uid59_acosX_uid8_fpArccosPiTest_b : std_logic_vector (24 downto 0);
    signal expOddSelect_uid352_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal expOddSelect_uid352_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector (7 downto 0);
    signal rightShiftStage1Idx1_uid391_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx2_uid394_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx3_uid397_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_in : std_logic_vector (22 downto 0);
    signal Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_in : std_logic_vector (30 downto 0);
    signal Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal firstPath_uid62_acosX_uid8_fpArccosPiTest_in : std_logic_vector (34 downto 0);
    signal firstPath_uid62_acosX_uid8_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal mAddr_uid107_acosX_uid8_fpArccosPiTest_in : std_logic_vector (34 downto 0);
    signal mAddr_uid107_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_in : std_logic_vector (26 downto 0);
    signal mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_b : std_logic_vector (14 downto 0);
    signal cStage_uid303_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid314_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid314_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid314_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid317_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (34 downto 0);
    signal minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1_uid546_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal InvExc_I_uid180_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid180_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal roundBitDetectionPattern_uid202_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(2 downto 0);
    signal roundBitDetectionPattern_uid202_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(2 downto 0);
    signal roundBitDetectionPattern_uid202_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal roundBitDetectionPattern_uid481_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(2 downto 0);
    signal roundBitDetectionPattern_uid481_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(2 downto 0);
    signal roundBitDetectionPattern_uid481_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal fxpArcsinXO2XResWFRange_uid84_acosX_uid8_fpArccosPiTest_in : std_logic_vector (24 downto 0);
    signal fxpArcsinXO2XResWFRange_uid84_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal path2PosCaseFPFraction_uid122_acosX_uid8_fpArccosPiTest_in : std_logic_vector (25 downto 0);
    signal path2PosCaseFPFraction_uid122_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector (22 downto 0);
    signal rightShiftStage1Idx1_uid256_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx2_uid259_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx3_uid262_fxpX_uid59_acosX_uid8_fpArccosPiTest_q : std_logic_vector (36 downto 0);
    signal pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q : std_logic_vector (2 downto 0);
    signal yT1_uid553_arccosXO2PolyEval_in : std_logic_vector (14 downto 0);
    signal yT1_uid553_arccosXO2PolyEval_b : std_logic_vector (11 downto 0);
    signal vStagei_uid318_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid318_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q : std_logic_vector (5 downto 0);
    signal excRNaN_uid364_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid364_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid364_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid364_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_s : std_logic_vector (0 downto 0);
    signal rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal InvExc_N_uid179_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid179_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal roundBit_uid203_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal roundBit_uid203_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal roundBit_uid482_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal roundBit_uid482_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal fpArcsinXO2XRes_uid85_acosX_uid8_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector (31 downto 0);
    signal fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_in : std_logic_vector (33 downto 0);
    signal fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal join_uid365_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector (2 downto 0);
    signal pad_fxpArcsinL_uid94_uid95_acosX_uid8_fpArccosPiTest_q : std_logic_vector (26 downto 0);
    signal exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal roundBitAndNormalizationOp_uid206_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector (25 downto 0);
    signal roundBitAndNormalizationOp_uid485_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (25 downto 0);
    signal expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in : std_logic_vector (30 downto 0);
    signal expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal signY_uid425_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in : std_logic_vector (31 downto 0);
    signal signY_uid425_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal fracY_uid428_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in : std_logic_vector (22 downto 0);
    signal fracY_uid428_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal SqrtFPL22dto0_uid73_acosX_uid8_fpArccosPiTest_in : std_logic_vector (22 downto 0);
    signal SqrtFPL22dto0_uid73_acosX_uid8_fpArccosPiTest_b : std_logic_vector (22 downto 0);
    signal SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_in : std_logic_vector (30 downto 0);
    signal SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in : std_logic_vector (31 downto 0);
    signal signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector (0 downto 0);
    signal fracSelIn_uid366_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q : std_logic_vector (3 downto 0);
    signal excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector(0 downto 0);
    signal add_one_fracY_uid428_uid429_uid429_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal X23dto8_uid380_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal X23dto8_uid380_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b : std_logic_vector (15 downto 0);
    signal X23dto16_uid383_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in : std_logic_vector (23 downto 0);
    signal X23dto16_uid383_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b : std_logic_vector (7 downto 0);
    signal rightShiftStage0Idx1_uid382_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage0Idx2_uid385_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q : std_logic_vector (23 downto 0);
begin


	--xIn(GPIN,3)@0

	--cstAllZWF_uid19_acosX_uid8_fpArccosPiTest(CONSTANT,18)
    cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q <= "00000000000000000000000";

	--GND(CONSTANT,0)
    GND_q <= "0";

	--cstAllOWE_uid18_acosX_uid8_fpArccosPiTest(CONSTANT,17)
    cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q <= "11111111";

	--cstBiasP1_uid26_acosX_uid8_fpArccosPiTest(CONSTANT,25)
    cstBiasP1_uid26_acosX_uid8_fpArccosPiTest_q <= "10000000";

	--ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable(LOGICAL,1457)
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_a <= en;
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q <= not ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_a;

	--ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_nor(LOGICAL,1626)
    ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_nor_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q;
    ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_nor_b <= ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_sticky_ena_q;
    ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_nor_q <= not (ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_nor_a or ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_nor_b);

	--ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_mem_top(CONSTANT,1609)
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_mem_top_q <= "011001";

	--ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmp(LOGICAL,1610)
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmp_a <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_mem_top_q;
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdmux_q);
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmp_q <= "1" when ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmp_a = ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmp_b else "0";

	--ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmpReg(REG,1611)
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmpReg_q <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_sticky_ena(REG,1627)
    ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_nor_q = "1") THEN
                ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_sticky_ena_q <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_enaAnd(LOGICAL,1628)
    ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_enaAnd_a <= ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_sticky_ena_q;
    ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_enaAnd_b <= en;
    ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_enaAnd_q <= ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_enaAnd_a and ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_enaAnd_b;

	--rightShiftStage2Idx3Pad3_uid272_fxpX_uid59_acosX_uid8_fpArccosPiTest(CONSTANT,271)
    rightShiftStage2Idx3Pad3_uid272_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= "000";

	--RightShiftStage136dto3_uid271_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITSELECT,270)@1
    RightShiftStage136dto3_uid271_fxpX_uid59_acosX_uid8_fpArccosPiTest_in <= rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
    RightShiftStage136dto3_uid271_fxpX_uid59_acosX_uid8_fpArccosPiTest_b <= RightShiftStage136dto3_uid271_fxpX_uid59_acosX_uid8_fpArccosPiTest_in(36 downto 3);

	--rightShiftStage2Idx3_uid273_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITJOIN,272)@1
    rightShiftStage2Idx3_uid273_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= rightShiftStage2Idx3Pad3_uid272_fxpX_uid59_acosX_uid8_fpArccosPiTest_q & RightShiftStage136dto3_uid271_fxpX_uid59_acosX_uid8_fpArccosPiTest_b;

	--rightShiftStage2Idx2Pad2_uid269_fxpX_uid59_acosX_uid8_fpArccosPiTest(CONSTANT,268)
    rightShiftStage2Idx2Pad2_uid269_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= "00";

	--RightShiftStage136dto2_uid268_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITSELECT,267)@1
    RightShiftStage136dto2_uid268_fxpX_uid59_acosX_uid8_fpArccosPiTest_in <= rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
    RightShiftStage136dto2_uid268_fxpX_uid59_acosX_uid8_fpArccosPiTest_b <= RightShiftStage136dto2_uid268_fxpX_uid59_acosX_uid8_fpArccosPiTest_in(36 downto 2);

	--rightShiftStage2Idx2_uid270_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITJOIN,269)@1
    rightShiftStage2Idx2_uid270_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= rightShiftStage2Idx2Pad2_uid269_fxpX_uid59_acosX_uid8_fpArccosPiTest_q & RightShiftStage136dto2_uid268_fxpX_uid59_acosX_uid8_fpArccosPiTest_b;

	--RightShiftStage136dto1_uid265_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITSELECT,264)@1
    RightShiftStage136dto1_uid265_fxpX_uid59_acosX_uid8_fpArccosPiTest_in <= rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
    RightShiftStage136dto1_uid265_fxpX_uid59_acosX_uid8_fpArccosPiTest_b <= RightShiftStage136dto1_uid265_fxpX_uid59_acosX_uid8_fpArccosPiTest_in(36 downto 1);

	--rightShiftStage2Idx1_uid267_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITJOIN,266)@1
    rightShiftStage2Idx1_uid267_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= GND_q & RightShiftStage136dto1_uid265_fxpX_uid59_acosX_uid8_fpArccosPiTest_b;

	--rightShiftStage1Idx3Pad12_uid261_fxpX_uid59_acosX_uid8_fpArccosPiTest(CONSTANT,260)
    rightShiftStage1Idx3Pad12_uid261_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= "000000000000";

	--rightShiftStage0Idx3_uid251_fxpX_uid59_acosX_uid8_fpArccosPiTest(CONSTANT,250)
    rightShiftStage0Idx3_uid251_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= "0000000000000000000000000000000000000";

	--rightShiftStage0Idx2Pad32_uid249_fxpX_uid59_acosX_uid8_fpArccosPiTest(CONSTANT,248)
    rightShiftStage0Idx2Pad32_uid249_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= "00000000000000000000000000000000";

	--X36dto32_uid248_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITSELECT,247)@0
    X36dto32_uid248_fxpX_uid59_acosX_uid8_fpArccosPiTest_in <= oFracXExt_uid58_acosX_uid8_fpArccosPiTest_q;
    X36dto32_uid248_fxpX_uid59_acosX_uid8_fpArccosPiTest_b <= X36dto32_uid248_fxpX_uid59_acosX_uid8_fpArccosPiTest_in(36 downto 32);

	--rightShiftStage0Idx2_uid250_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITJOIN,249)@0
    rightShiftStage0Idx2_uid250_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= rightShiftStage0Idx2Pad32_uid249_fxpX_uid59_acosX_uid8_fpArccosPiTest_q & X36dto32_uid248_fxpX_uid59_acosX_uid8_fpArccosPiTest_b;

	--rightShiftStage0Idx1Pad16_uid246_fxpX_uid59_acosX_uid8_fpArccosPiTest(CONSTANT,245)
    rightShiftStage0Idx1Pad16_uid246_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= "0000000000000000";

	--X36dto16_uid245_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITSELECT,244)@0
    X36dto16_uid245_fxpX_uid59_acosX_uid8_fpArccosPiTest_in <= oFracXExt_uid58_acosX_uid8_fpArccosPiTest_q;
    X36dto16_uid245_fxpX_uid59_acosX_uid8_fpArccosPiTest_b <= X36dto16_uid245_fxpX_uid59_acosX_uid8_fpArccosPiTest_in(36 downto 16);

	--rightShiftStage0Idx1_uid247_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITJOIN,246)@0
    rightShiftStage0Idx1_uid247_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= rightShiftStage0Idx1Pad16_uid246_fxpX_uid59_acosX_uid8_fpArccosPiTest_q & X36dto16_uid245_fxpX_uid59_acosX_uid8_fpArccosPiTest_b;

	--fracX_uid16_acosX_uid8_fpArccosPiTest(BITSELECT,15)@0
    fracX_uid16_acosX_uid8_fpArccosPiTest_in <= a(22 downto 0);
    fracX_uid16_acosX_uid8_fpArccosPiTest_b <= fracX_uid16_acosX_uid8_fpArccosPiTest_in(22 downto 0);

	--oFracX_uid51_uid51_acosX_uid8_fpArccosPiTest(BITJOIN,50)@0
    oFracX_uid51_uid51_acosX_uid8_fpArccosPiTest_q <= VCC_q & fracX_uid16_acosX_uid8_fpArccosPiTest_b;

	--cst01pWShift_uid57_acosX_uid8_fpArccosPiTest(CONSTANT,56)
    cst01pWShift_uid57_acosX_uid8_fpArccosPiTest_q <= "0000000000000";

	--oFracXExt_uid58_acosX_uid8_fpArccosPiTest(BITJOIN,57)@0
    oFracXExt_uid58_acosX_uid8_fpArccosPiTest_q <= oFracX_uid51_uid51_acosX_uid8_fpArccosPiTest_q & cst01pWShift_uid57_acosX_uid8_fpArccosPiTest_q;

	--shiftOutVal_uid54_acosX_uid8_fpArccosPiTest(CONSTANT,53)
    shiftOutVal_uid54_acosX_uid8_fpArccosPiTest_q <= "100100";

	--expX_uid15_acosX_uid8_fpArccosPiTest(BITSELECT,14)@0
    expX_uid15_acosX_uid8_fpArccosPiTest_in <= a(30 downto 0);
    expX_uid15_acosX_uid8_fpArccosPiTest_b <= expX_uid15_acosX_uid8_fpArccosPiTest_in(30 downto 23);

	--cstBias_uid22_acosX_uid8_fpArccosPiTest(CONSTANT,21)
    cstBias_uid22_acosX_uid8_fpArccosPiTest_q <= "01111111";

	--shiftValuePre_uid53_acosX_uid8_fpArccosPiTest(SUB,52)@0
    shiftValuePre_uid53_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR("0" & cstBias_uid22_acosX_uid8_fpArccosPiTest_q);
    shiftValuePre_uid53_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR("0" & expX_uid15_acosX_uid8_fpArccosPiTest_b);
            shiftValuePre_uid53_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValuePre_uid53_acosX_uid8_fpArccosPiTest_a) - UNSIGNED(shiftValuePre_uid53_acosX_uid8_fpArccosPiTest_b));
    shiftValuePre_uid53_acosX_uid8_fpArccosPiTest_q <= shiftValuePre_uid53_acosX_uid8_fpArccosPiTest_o(8 downto 0);


	--fxpShifterBits_uid55_acosX_uid8_fpArccosPiTest(BITSELECT,54)@0
    fxpShifterBits_uid55_acosX_uid8_fpArccosPiTest_in <= shiftValuePre_uid53_acosX_uid8_fpArccosPiTest_q(5 downto 0);
    fxpShifterBits_uid55_acosX_uid8_fpArccosPiTest_b <= fxpShifterBits_uid55_acosX_uid8_fpArccosPiTest_in(5 downto 0);

	--cstBiasMwFMwShift_uid24_acosX_uid8_fpArccosPiTest(CONSTANT,23)
    cstBiasMwFMwShift_uid24_acosX_uid8_fpArccosPiTest_q <= "001011100";

	--shiftValue_uid52_acosX_uid8_fpArccosPiTest(COMPARE,51)@0
    shiftValue_uid52_acosX_uid8_fpArccosPiTest_cin <= GND_q;
    shiftValue_uid52_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR((10 downto 9 => cstBiasMwFMwShift_uid24_acosX_uid8_fpArccosPiTest_q(8)) & cstBiasMwFMwShift_uid24_acosX_uid8_fpArccosPiTest_q) & '0';
    shiftValue_uid52_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR('0' & "00" & expX_uid15_acosX_uid8_fpArccosPiTest_b) & shiftValue_uid52_acosX_uid8_fpArccosPiTest_cin(0);
            shiftValue_uid52_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(SIGNED(shiftValue_uid52_acosX_uid8_fpArccosPiTest_a) - SIGNED(shiftValue_uid52_acosX_uid8_fpArccosPiTest_b));
    shiftValue_uid52_acosX_uid8_fpArccosPiTest_n(0) <= not shiftValue_uid52_acosX_uid8_fpArccosPiTest_o(11);


	--shiftValue_uid56_acosX_uid8_fpArccosPiTest(MUX,55)@0
    shiftValue_uid56_acosX_uid8_fpArccosPiTest_s <= shiftValue_uid52_acosX_uid8_fpArccosPiTest_n;
    shiftValue_uid56_acosX_uid8_fpArccosPiTest: PROCESS (shiftValue_uid56_acosX_uid8_fpArccosPiTest_s, en, fxpShifterBits_uid55_acosX_uid8_fpArccosPiTest_b, shiftOutVal_uid54_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE shiftValue_uid56_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "0" => shiftValue_uid56_acosX_uid8_fpArccosPiTest_q <= fxpShifterBits_uid55_acosX_uid8_fpArccosPiTest_b;
                  WHEN "1" => shiftValue_uid56_acosX_uid8_fpArccosPiTest_q <= shiftOutVal_uid54_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => shiftValue_uid56_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel5Dto4_uid252_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITSELECT,251)@0
    rightShiftStageSel5Dto4_uid252_fxpX_uid59_acosX_uid8_fpArccosPiTest_in <= shiftValue_uid56_acosX_uid8_fpArccosPiTest_q;
    rightShiftStageSel5Dto4_uid252_fxpX_uid59_acosX_uid8_fpArccosPiTest_b <= rightShiftStageSel5Dto4_uid252_fxpX_uid59_acosX_uid8_fpArccosPiTest_in(5 downto 4);

	--rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest(MUX,252)@0
    rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_s <= rightShiftStageSel5Dto4_uid252_fxpX_uid59_acosX_uid8_fpArccosPiTest_b;
    rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest: PROCESS (rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_s, en, oFracXExt_uid58_acosX_uid8_fpArccosPiTest_q, rightShiftStage0Idx1_uid247_fxpX_uid59_acosX_uid8_fpArccosPiTest_q, rightShiftStage0Idx2_uid250_fxpX_uid59_acosX_uid8_fpArccosPiTest_q, rightShiftStage0Idx3_uid251_fxpX_uid59_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= oFracXExt_uid58_acosX_uid8_fpArccosPiTest_q;
                  WHEN "01" => rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= rightShiftStage0Idx1_uid247_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
                  WHEN "10" => rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= rightShiftStage0Idx2_uid250_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
                  WHEN "11" => rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= rightShiftStage0Idx3_uid251_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage036dto12_uid260_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITSELECT,259)@0
    RightShiftStage036dto12_uid260_fxpX_uid59_acosX_uid8_fpArccosPiTest_in <= rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
    RightShiftStage036dto12_uid260_fxpX_uid59_acosX_uid8_fpArccosPiTest_b <= RightShiftStage036dto12_uid260_fxpX_uid59_acosX_uid8_fpArccosPiTest_in(36 downto 12);

	--rightShiftStage1Idx3_uid262_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITJOIN,261)@0
    rightShiftStage1Idx3_uid262_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= rightShiftStage1Idx3Pad12_uid261_fxpX_uid59_acosX_uid8_fpArccosPiTest_q & RightShiftStage036dto12_uid260_fxpX_uid59_acosX_uid8_fpArccosPiTest_b;

	--reg_rightShiftStage1Idx3_uid262_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_5(REG,613)@0
    reg_rightShiftStage1Idx3_uid262_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx3_uid262_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_5_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx3_uid262_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_5_q <= rightShiftStage1Idx3_uid262_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--RightShiftStage036dto8_uid257_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITSELECT,256)@0
    RightShiftStage036dto8_uid257_fxpX_uid59_acosX_uid8_fpArccosPiTest_in <= rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
    RightShiftStage036dto8_uid257_fxpX_uid59_acosX_uid8_fpArccosPiTest_b <= RightShiftStage036dto8_uid257_fxpX_uid59_acosX_uid8_fpArccosPiTest_in(36 downto 8);

	--rightShiftStage1Idx2_uid259_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITJOIN,258)@0
    rightShiftStage1Idx2_uid259_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q & RightShiftStage036dto8_uid257_fxpX_uid59_acosX_uid8_fpArccosPiTest_b;

	--reg_rightShiftStage1Idx2_uid259_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_4(REG,612)@0
    reg_rightShiftStage1Idx2_uid259_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx2_uid259_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_4_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx2_uid259_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_4_q <= rightShiftStage1Idx2_uid259_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1Idx1Pad4_uid255_fxpX_uid59_acosX_uid8_fpArccosPiTest(CONSTANT,254)
    rightShiftStage1Idx1Pad4_uid255_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= "0000";

	--RightShiftStage036dto4_uid254_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITSELECT,253)@0
    RightShiftStage036dto4_uid254_fxpX_uid59_acosX_uid8_fpArccosPiTest_in <= rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
    RightShiftStage036dto4_uid254_fxpX_uid59_acosX_uid8_fpArccosPiTest_b <= RightShiftStage036dto4_uid254_fxpX_uid59_acosX_uid8_fpArccosPiTest_in(36 downto 4);

	--rightShiftStage1Idx1_uid256_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITJOIN,255)@0
    rightShiftStage1Idx1_uid256_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= rightShiftStage1Idx1Pad4_uid255_fxpX_uid59_acosX_uid8_fpArccosPiTest_q & RightShiftStage036dto4_uid254_fxpX_uid59_acosX_uid8_fpArccosPiTest_b;

	--reg_rightShiftStage1Idx1_uid256_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_3(REG,611)@0
    reg_rightShiftStage1Idx1_uid256_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx1_uid256_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_3_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx1_uid256_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_3_q <= rightShiftStage1Idx1_uid256_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_2(REG,610)@0
    reg_rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_2_q <= rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel3Dto2_uid263_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITSELECT,262)@0
    rightShiftStageSel3Dto2_uid263_fxpX_uid59_acosX_uid8_fpArccosPiTest_in <= shiftValue_uid56_acosX_uid8_fpArccosPiTest_q(3 downto 0);
    rightShiftStageSel3Dto2_uid263_fxpX_uid59_acosX_uid8_fpArccosPiTest_b <= rightShiftStageSel3Dto2_uid263_fxpX_uid59_acosX_uid8_fpArccosPiTest_in(3 downto 2);

	--reg_rightShiftStageSel3Dto2_uid263_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_1(REG,609)@0
    reg_rightShiftStageSel3Dto2_uid263_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel3Dto2_uid263_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel3Dto2_uid263_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_1_q <= rightShiftStageSel3Dto2_uid263_fxpX_uid59_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest(MUX,263)@1
    rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_s <= reg_rightShiftStageSel3Dto2_uid263_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_1_q;
    rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest: PROCESS (rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_s, en, reg_rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_2_q, reg_rightShiftStage1Idx1_uid256_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_3_q, reg_rightShiftStage1Idx2_uid259_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_4_q, reg_rightShiftStage1Idx3_uid262_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_5_q)
    BEGIN
            CASE rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= reg_rightShiftStage0_uid253_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_2_q;
                  WHEN "01" => rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= reg_rightShiftStage1Idx1_uid256_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_3_q;
                  WHEN "10" => rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= reg_rightShiftStage1Idx2_uid259_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_4_q;
                  WHEN "11" => rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= reg_rightShiftStage1Idx3_uid262_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_5_q;
                  WHEN OTHERS => rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel1Dto0_uid274_fxpX_uid59_acosX_uid8_fpArccosPiTest(BITSELECT,273)@0
    rightShiftStageSel1Dto0_uid274_fxpX_uid59_acosX_uid8_fpArccosPiTest_in <= shiftValue_uid56_acosX_uid8_fpArccosPiTest_q(1 downto 0);
    rightShiftStageSel1Dto0_uid274_fxpX_uid59_acosX_uid8_fpArccosPiTest_b <= rightShiftStageSel1Dto0_uid274_fxpX_uid59_acosX_uid8_fpArccosPiTest_in(1 downto 0);

	--reg_rightShiftStageSel1Dto0_uid274_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_1(REG,614)@0
    reg_rightShiftStageSel1Dto0_uid274_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel1Dto0_uid274_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel1Dto0_uid274_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_1_q <= rightShiftStageSel1Dto0_uid274_fxpX_uid59_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest(MUX,274)@1
    rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_s <= reg_rightShiftStageSel1Dto0_uid274_fxpX_uid59_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_1_q;
    rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest: PROCESS (rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_s, en, rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_q, rightShiftStage2Idx1_uid267_fxpX_uid59_acosX_uid8_fpArccosPiTest_q, rightShiftStage2Idx2_uid270_fxpX_uid59_acosX_uid8_fpArccosPiTest_q, rightShiftStage2Idx3_uid273_fxpX_uid59_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= rightShiftStage1_uid264_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
                  WHEN "01" => rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= rightShiftStage2Idx1_uid267_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
                  WHEN "10" => rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= rightShiftStage2Idx2_uid270_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
                  WHEN "11" => rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= rightShiftStage2Idx3_uid273_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--y_uid61_acosX_uid8_fpArccosPiTest(BITSELECT,60)@1
    y_uid61_acosX_uid8_fpArccosPiTest_in <= rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_q(35 downto 0);
    y_uid61_acosX_uid8_fpArccosPiTest_b <= y_uid61_acosX_uid8_fpArccosPiTest_in(35 downto 1);

	--mAddr_uid107_acosX_uid8_fpArccosPiTest(BITSELECT,106)@1
    mAddr_uid107_acosX_uid8_fpArccosPiTest_in <= y_uid61_acosX_uid8_fpArccosPiTest_b;
    mAddr_uid107_acosX_uid8_fpArccosPiTest_b <= mAddr_uid107_acosX_uid8_fpArccosPiTest_in(34 downto 27);

	--reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid552_arccosXO2TabGen_lutmem_0(REG,688)@1
    reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid552_arccosXO2TabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid552_arccosXO2TabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid552_arccosXO2TabGen_lutmem_0_q <= mAddr_uid107_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid552_arccosXO2TabGen_lutmem(DUALMEM,604)@2
    memoryC2_uid552_arccosXO2TabGen_lutmem_reset0 <= areset;
    memoryC2_uid552_arccosXO2TabGen_lutmem_ia <= (others => '0');
    memoryC2_uid552_arccosXO2TabGen_lutmem_aa <= (others => '0');
    memoryC2_uid552_arccosXO2TabGen_lutmem_ab <= reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid552_arccosXO2TabGen_lutmem_0_q;
    memoryC2_uid552_arccosXO2TabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arccospi_s5_memoryC2_uid552_arccosXO2TabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid552_arccosXO2TabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid552_arccosXO2TabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid552_arccosXO2TabGen_lutmem_iq,
        address_a => memoryC2_uid552_arccosXO2TabGen_lutmem_aa,
        data_a => memoryC2_uid552_arccosXO2TabGen_lutmem_ia
    );
        memoryC2_uid552_arccosXO2TabGen_lutmem_q <= memoryC2_uid552_arccosXO2TabGen_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid552_arccosXO2TabGen_lutmem_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_1(REG,690)@4
    reg_memoryC2_uid552_arccosXO2TabGen_lutmem_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid552_arccosXO2TabGen_lutmem_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid552_arccosXO2TabGen_lutmem_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_1_q <= memoryC2_uid552_arccosXO2TabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--mPPolyEval_uid108_acosX_uid8_fpArccosPiTest(BITSELECT,107)@1
    mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_in <= y_uid61_acosX_uid8_fpArccosPiTest_b(26 downto 0);
    mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_b <= mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_in(26 downto 12);

	--yT1_uid553_arccosXO2PolyEval(BITSELECT,552)@1
    yT1_uid553_arccosXO2PolyEval_in <= mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_b;
    yT1_uid553_arccosXO2PolyEval_b <= yT1_uid553_arccosXO2PolyEval_in(14 downto 3);

	--ld_yT1_uid553_arccosXO2PolyEval_b_to_reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0_a_inputreg(DELAY,1601)
    ld_yT1_uid553_arccosXO2PolyEval_b_to_reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 12, depth => 1 )
    PORT MAP ( xin => yT1_uid553_arccosXO2PolyEval_b, xout => ld_yT1_uid553_arccosXO2PolyEval_b_to_reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yT1_uid553_arccosXO2PolyEval_b_to_reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0_a(DELAY,1420)@1
    ld_yT1_uid553_arccosXO2PolyEval_b_to_reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0_a : dspba_delay
    GENERIC MAP ( width => 12, depth => 2 )
    PORT MAP ( xin => ld_yT1_uid553_arccosXO2PolyEval_b_to_reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0_a_inputreg_q, xout => ld_yT1_uid553_arccosXO2PolyEval_b_to_reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0(REG,689)@4
    reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0_q <= ld_yT1_uid553_arccosXO2PolyEval_b_to_reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid588_pT1_uid554_arccosXO2PolyEval(MULT,587)@5
    prodXY_uid588_pT1_uid554_arccosXO2PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid588_pT1_uid554_arccosXO2PolyEval_a),13)) * SIGNED(prodXY_uid588_pT1_uid554_arccosXO2PolyEval_b);
    prodXY_uid588_pT1_uid554_arccosXO2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid588_pT1_uid554_arccosXO2PolyEval_a <= (others => '0');
            prodXY_uid588_pT1_uid554_arccosXO2PolyEval_b <= (others => '0');
            prodXY_uid588_pT1_uid554_arccosXO2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid588_pT1_uid554_arccosXO2PolyEval_a <= reg_yT1_uid553_arccosXO2PolyEval_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_0_q;
                prodXY_uid588_pT1_uid554_arccosXO2PolyEval_b <= reg_memoryC2_uid552_arccosXO2TabGen_lutmem_0_to_prodXY_uid588_pT1_uid554_arccosXO2PolyEval_1_q;
                prodXY_uid588_pT1_uid554_arccosXO2PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid588_pT1_uid554_arccosXO2PolyEval_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid588_pT1_uid554_arccosXO2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid588_pT1_uid554_arccosXO2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid588_pT1_uid554_arccosXO2PolyEval_q <= prodXY_uid588_pT1_uid554_arccosXO2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid589_pT1_uid554_arccosXO2PolyEval(BITSELECT,588)@8
    prodXYTruncFR_uid589_pT1_uid554_arccosXO2PolyEval_in <= prodXY_uid588_pT1_uid554_arccosXO2PolyEval_q;
    prodXYTruncFR_uid589_pT1_uid554_arccosXO2PolyEval_b <= prodXYTruncFR_uid589_pT1_uid554_arccosXO2PolyEval_in(23 downto 11);

	--highBBits_uid556_arccosXO2PolyEval(BITSELECT,555)@8
    highBBits_uid556_arccosXO2PolyEval_in <= prodXYTruncFR_uid589_pT1_uid554_arccosXO2PolyEval_b;
    highBBits_uid556_arccosXO2PolyEval_b <= highBBits_uid556_arccosXO2PolyEval_in(12 downto 1);

	--ld_mAddr_uid107_acosX_uid8_fpArccosPiTest_b_to_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0_a_inputreg(DELAY,1602)
    ld_mAddr_uid107_acosX_uid8_fpArccosPiTest_b_to_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => mAddr_uid107_acosX_uid8_fpArccosPiTest_b, xout => ld_mAddr_uid107_acosX_uid8_fpArccosPiTest_b_to_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_mAddr_uid107_acosX_uid8_fpArccosPiTest_b_to_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0_a(DELAY,1422)@1
    ld_mAddr_uid107_acosX_uid8_fpArccosPiTest_b_to_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => ld_mAddr_uid107_acosX_uid8_fpArccosPiTest_b_to_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0_a_inputreg_q, xout => ld_mAddr_uid107_acosX_uid8_fpArccosPiTest_b_to_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0(REG,691)@5
    reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0_q <= ld_mAddr_uid107_acosX_uid8_fpArccosPiTest_b_to_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid551_arccosXO2TabGen_lutmem(DUALMEM,603)@6
    memoryC1_uid551_arccosXO2TabGen_lutmem_reset0 <= areset;
    memoryC1_uid551_arccosXO2TabGen_lutmem_ia <= (others => '0');
    memoryC1_uid551_arccosXO2TabGen_lutmem_aa <= (others => '0');
    memoryC1_uid551_arccosXO2TabGen_lutmem_ab <= reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid551_arccosXO2TabGen_lutmem_0_q;
    memoryC1_uid551_arccosXO2TabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 22,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 22,
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
        init_file => "fp_arccospi_s5_memoryC1_uid551_arccosXO2TabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid551_arccosXO2TabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid551_arccosXO2TabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid551_arccosXO2TabGen_lutmem_iq,
        address_a => memoryC1_uid551_arccosXO2TabGen_lutmem_aa,
        data_a => memoryC1_uid551_arccosXO2TabGen_lutmem_ia
    );
        memoryC1_uid551_arccosXO2TabGen_lutmem_q <= memoryC1_uid551_arccosXO2TabGen_lutmem_iq(21 downto 0);

	--sumAHighB_uid557_arccosXO2PolyEval(ADD,556)@8
    sumAHighB_uid557_arccosXO2PolyEval_a <= STD_LOGIC_VECTOR((22 downto 22 => memoryC1_uid551_arccosXO2TabGen_lutmem_q(21)) & memoryC1_uid551_arccosXO2TabGen_lutmem_q);
    sumAHighB_uid557_arccosXO2PolyEval_b <= STD_LOGIC_VECTOR((22 downto 12 => highBBits_uid556_arccosXO2PolyEval_b(11)) & highBBits_uid556_arccosXO2PolyEval_b);
            sumAHighB_uid557_arccosXO2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid557_arccosXO2PolyEval_a) + SIGNED(sumAHighB_uid557_arccosXO2PolyEval_b));
    sumAHighB_uid557_arccosXO2PolyEval_q <= sumAHighB_uid557_arccosXO2PolyEval_o(22 downto 0);


	--lowRangeB_uid555_arccosXO2PolyEval(BITSELECT,554)@8
    lowRangeB_uid555_arccosXO2PolyEval_in <= prodXYTruncFR_uid589_pT1_uid554_arccosXO2PolyEval_b(0 downto 0);
    lowRangeB_uid555_arccosXO2PolyEval_b <= lowRangeB_uid555_arccosXO2PolyEval_in(0 downto 0);

	--s1_uid555_uid558_arccosXO2PolyEval(BITJOIN,557)@8
    s1_uid555_uid558_arccosXO2PolyEval_q <= sumAHighB_uid557_arccosXO2PolyEval_q & lowRangeB_uid555_arccosXO2PolyEval_b;

	--reg_s1_uid555_uid558_arccosXO2PolyEval_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_1(REG,693)@8
    reg_s1_uid555_uid558_arccosXO2PolyEval_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid555_uid558_arccosXO2PolyEval_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_1_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid555_uid558_arccosXO2PolyEval_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_1_q <= s1_uid555_uid558_arccosXO2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_nor(LOGICAL,1535)
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_nor_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q;
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_nor_b <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_sticky_ena_q;
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_nor_q <= not (ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_nor_a or ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_nor_b);

	--ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_mem_top(CONSTANT,1531)
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_mem_top_q <= "0101";

	--ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmp(LOGICAL,1532)
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmp_a <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_mem_top_q;
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux_q);
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmp_q <= "1" when ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmp_a = ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmp_b else "0";

	--ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmpReg(REG,1533)
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmpReg_q <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_sticky_ena(REG,1536)
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_nor_q = "1") THEN
                ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_sticky_ena_q <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_enaAnd(LOGICAL,1537)
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_enaAnd_a <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_sticky_ena_q;
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_enaAnd_b <= en;
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_enaAnd_q <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_enaAnd_a and ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_enaAnd_b;

	--reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0(REG,692)@1
    reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q <= "000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q <= mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt(COUNTER,1527)
    -- every=1, low=0, high=5, step=1, init=1
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_i = 4 THEN
                      ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_i <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_i - 5;
                    ELSE
                        ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_i <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_i,3));


	--ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdreg(REG,1528)
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdreg_q <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux(MUX,1529)
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux_s <= en;
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux: PROCESS (ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux_s, ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdreg_q, ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux_q <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux_q <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem(DUALMEM,1526)
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_reset0 <= areset;
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_ia <= reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q;
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_aa <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdreg_q;
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_ab <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux_q;
    ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 15,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 15,
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
        clocken1 => ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_iq,
        address_a => ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_aa,
        data_a => ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_ia
    );
        ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_q <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_iq(14 downto 0);

	--prodXY_uid591_pT2_uid560_arccosXO2PolyEval(MULT,590)@9
    prodXY_uid591_pT2_uid560_arccosXO2PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a),16)) * SIGNED(prodXY_uid591_pT2_uid560_arccosXO2PolyEval_b);
    prodXY_uid591_pT2_uid560_arccosXO2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a <= (others => '0');
            prodXY_uid591_pT2_uid560_arccosXO2PolyEval_b <= (others => '0');
            prodXY_uid591_pT2_uid560_arccosXO2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_mem_q;
                prodXY_uid591_pT2_uid560_arccosXO2PolyEval_b <= reg_s1_uid555_uid558_arccosXO2PolyEval_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_1_q;
                prodXY_uid591_pT2_uid560_arccosXO2PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid591_pT2_uid560_arccosXO2PolyEval_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid591_pT2_uid560_arccosXO2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid591_pT2_uid560_arccosXO2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid591_pT2_uid560_arccosXO2PolyEval_q <= prodXY_uid591_pT2_uid560_arccosXO2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid592_pT2_uid560_arccosXO2PolyEval(BITSELECT,591)@12
    prodXYTruncFR_uid592_pT2_uid560_arccosXO2PolyEval_in <= prodXY_uid591_pT2_uid560_arccosXO2PolyEval_q;
    prodXYTruncFR_uid592_pT2_uid560_arccosXO2PolyEval_b <= prodXYTruncFR_uid592_pT2_uid560_arccosXO2PolyEval_in(38 downto 14);

	--highBBits_uid562_arccosXO2PolyEval(BITSELECT,561)@12
    highBBits_uid562_arccosXO2PolyEval_in <= prodXYTruncFR_uid592_pT2_uid560_arccosXO2PolyEval_b;
    highBBits_uid562_arccosXO2PolyEval_b <= highBBits_uid562_arccosXO2PolyEval_in(24 downto 2);

	--ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_nor(LOGICAL,1548)
    ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_nor_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q;
    ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_nor_b <= ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_sticky_ena_q;
    ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_nor_q <= not (ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_nor_a or ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_nor_b);

	--ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_sticky_ena(REG,1549)
    ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_nor_q = "1") THEN
                ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_sticky_ena_q <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_enaAnd(LOGICAL,1550)
    ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_enaAnd_a <= ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_sticky_ena_q;
    ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_enaAnd_b <= en;
    ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_enaAnd_q <= ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_enaAnd_a and ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_enaAnd_b;

	--ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem(DUALMEM,1539)
    ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_reset0 <= areset;
    ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_ia <= reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid552_arccosXO2TabGen_lutmem_0_q;
    ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_aa <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdreg_q;
    ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_ab <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux_q;
    ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_iq,
        address_a => ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_aa,
        data_a => ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_ia
    );
        ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_q <= ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_iq(7 downto 0);

	--ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_outputreg(DELAY,1538)
    ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_replace_mem_q, xout => ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC0_uid550_arccosXO2TabGen_lutmem(DUALMEM,602)@10
    memoryC0_uid550_arccosXO2TabGen_lutmem_reset0 <= areset;
    memoryC0_uid550_arccosXO2TabGen_lutmem_ia <= (others => '0');
    memoryC0_uid550_arccosXO2TabGen_lutmem_aa <= (others => '0');
    memoryC0_uid550_arccosXO2TabGen_lutmem_ab <= ld_reg_mAddr_uid107_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid550_arccosXO2TabGen_lutmem_0_q_to_memoryC0_uid550_arccosXO2TabGen_lutmem_a_outputreg_q;
    memoryC0_uid550_arccosXO2TabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arccospi_s5_memoryC0_uid550_arccosXO2TabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid550_arccosXO2TabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid550_arccosXO2TabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid550_arccosXO2TabGen_lutmem_iq,
        address_a => memoryC0_uid550_arccosXO2TabGen_lutmem_aa,
        data_a => memoryC0_uid550_arccosXO2TabGen_lutmem_ia
    );
        memoryC0_uid550_arccosXO2TabGen_lutmem_q <= memoryC0_uid550_arccosXO2TabGen_lutmem_iq(29 downto 0);

	--sumAHighB_uid563_arccosXO2PolyEval(ADD,562)@12
    sumAHighB_uid563_arccosXO2PolyEval_a <= STD_LOGIC_VECTOR((30 downto 30 => memoryC0_uid550_arccosXO2TabGen_lutmem_q(29)) & memoryC0_uid550_arccosXO2TabGen_lutmem_q);
    sumAHighB_uid563_arccosXO2PolyEval_b <= STD_LOGIC_VECTOR((30 downto 23 => highBBits_uid562_arccosXO2PolyEval_b(22)) & highBBits_uid562_arccosXO2PolyEval_b);
            sumAHighB_uid563_arccosXO2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid563_arccosXO2PolyEval_a) + SIGNED(sumAHighB_uid563_arccosXO2PolyEval_b));
    sumAHighB_uid563_arccosXO2PolyEval_q <= sumAHighB_uid563_arccosXO2PolyEval_o(30 downto 0);


	--lowRangeB_uid561_arccosXO2PolyEval(BITSELECT,560)@12
    lowRangeB_uid561_arccosXO2PolyEval_in <= prodXYTruncFR_uid592_pT2_uid560_arccosXO2PolyEval_b(1 downto 0);
    lowRangeB_uid561_arccosXO2PolyEval_b <= lowRangeB_uid561_arccosXO2PolyEval_in(1 downto 0);

	--s2_uid561_uid564_arccosXO2PolyEval(BITJOIN,563)@12
    s2_uid561_uid564_arccosXO2PolyEval_q <= sumAHighB_uid563_arccosXO2PolyEval_q & lowRangeB_uid561_arccosXO2PolyEval_b;

	--fxpArccosX_uid110_acosX_uid8_fpArccosPiTest(BITSELECT,109)@12
    fxpArccosX_uid110_acosX_uid8_fpArccosPiTest_in <= s2_uid561_uid564_arccosXO2PolyEval_q(30 downto 0);
    fxpArccosX_uid110_acosX_uid8_fpArccosPiTest_b <= fxpArccosX_uid110_acosX_uid8_fpArccosPiTest_in(30 downto 4);

	--reg_fxpArccosX_uid110_acosX_uid8_fpArccosPiTest_0_to_path2Diff_uid112_acosX_uid8_fpArccosPiTest_1(REG,696)@12
    reg_fxpArccosX_uid110_acosX_uid8_fpArccosPiTest_0_to_path2Diff_uid112_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpArccosX_uid110_acosX_uid8_fpArccosPiTest_0_to_path2Diff_uid112_acosX_uid8_fpArccosPiTest_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpArccosX_uid110_acosX_uid8_fpArccosPiTest_0_to_path2Diff_uid112_acosX_uid8_fpArccosPiTest_1_q <= fxpArccosX_uid110_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--pi2_uid111_acosX_uid8_fpArccosPiTest(CONSTANT,110)
    pi2_uid111_acosX_uid8_fpArccosPiTest_q <= "110010010000111111011010101";

	--pad_pi2_uid111_uid112_acosX_uid8_fpArccosPiTest(BITJOIN,111)@12
    pad_pi2_uid111_uid112_acosX_uid8_fpArccosPiTest_q <= pi2_uid111_acosX_uid8_fpArccosPiTest_q & GND_q;

	--reg_pad_pi2_uid111_uid112_acosX_uid8_fpArccosPiTest_0_to_path2Diff_uid112_acosX_uid8_fpArccosPiTest_0(REG,695)@12
    reg_pad_pi2_uid111_uid112_acosX_uid8_fpArccosPiTest_0_to_path2Diff_uid112_acosX_uid8_fpArccosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_pi2_uid111_uid112_acosX_uid8_fpArccosPiTest_0_to_path2Diff_uid112_acosX_uid8_fpArccosPiTest_0_q <= "0000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_pi2_uid111_uid112_acosX_uid8_fpArccosPiTest_0_to_path2Diff_uid112_acosX_uid8_fpArccosPiTest_0_q <= pad_pi2_uid111_uid112_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--path2Diff_uid112_acosX_uid8_fpArccosPiTest(SUB,112)@13
    path2Diff_uid112_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR("0" & reg_pad_pi2_uid111_uid112_acosX_uid8_fpArccosPiTest_0_to_path2Diff_uid112_acosX_uid8_fpArccosPiTest_0_q);
    path2Diff_uid112_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR("00" & reg_fxpArccosX_uid110_acosX_uid8_fpArccosPiTest_0_to_path2Diff_uid112_acosX_uid8_fpArccosPiTest_1_q);
            path2Diff_uid112_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path2Diff_uid112_acosX_uid8_fpArccosPiTest_a) - UNSIGNED(path2Diff_uid112_acosX_uid8_fpArccosPiTest_b));
    path2Diff_uid112_acosX_uid8_fpArccosPiTest_q <= path2Diff_uid112_acosX_uid8_fpArccosPiTest_o(28 downto 0);


	--path2NegCaseFPFrac_uid115_acosX_uid8_fpArccosPiTest(BITSELECT,114)@13
    path2NegCaseFPFrac_uid115_acosX_uid8_fpArccosPiTest_in <= path2Diff_uid112_acosX_uid8_fpArccosPiTest_q(26 downto 0);
    path2NegCaseFPFrac_uid115_acosX_uid8_fpArccosPiTest_b <= path2NegCaseFPFrac_uid115_acosX_uid8_fpArccosPiTest_in(26 downto 4);

	--path2NegCaseFPL_uid116_acosX_uid8_fpArccosPiTest(BITJOIN,115)@13
    path2NegCaseFPL_uid116_acosX_uid8_fpArccosPiTest_q <= GND_q & cstBiasP1_uid26_acosX_uid8_fpArccosPiTest_q & path2NegCaseFPFrac_uid115_acosX_uid8_fpArccosPiTest_b;

	--path2NegCaseFPFrac_uid118_acosX_uid8_fpArccosPiTest(BITSELECT,117)@13
    path2NegCaseFPFrac_uid118_acosX_uid8_fpArccosPiTest_in <= path2Diff_uid112_acosX_uid8_fpArccosPiTest_q(25 downto 0);
    path2NegCaseFPFrac_uid118_acosX_uid8_fpArccosPiTest_b <= path2NegCaseFPFrac_uid118_acosX_uid8_fpArccosPiTest_in(25 downto 3);

	--path2NegCaseFPS_uid119_acosX_uid8_fpArccosPiTest(BITJOIN,118)@13
    path2NegCaseFPS_uid119_acosX_uid8_fpArccosPiTest_q <= GND_q & cstBias_uid22_acosX_uid8_fpArccosPiTest_q & path2NegCaseFPFrac_uid118_acosX_uid8_fpArccosPiTest_b;

	--normBit_uid114_acosX_uid8_fpArccosPiTest(BITSELECT,113)@13
    normBit_uid114_acosX_uid8_fpArccosPiTest_in <= path2Diff_uid112_acosX_uid8_fpArccosPiTest_q(27 downto 0);
    normBit_uid114_acosX_uid8_fpArccosPiTest_b <= normBit_uid114_acosX_uid8_fpArccosPiTest_in(27 downto 27);

	--path2NegCaseFP_uid121_acosX_uid8_fpArccosPiTest(MUX,120)@13
    path2NegCaseFP_uid121_acosX_uid8_fpArccosPiTest_s <= normBit_uid114_acosX_uid8_fpArccosPiTest_b;
    path2NegCaseFP_uid121_acosX_uid8_fpArccosPiTest: PROCESS (path2NegCaseFP_uid121_acosX_uid8_fpArccosPiTest_s, en, path2NegCaseFPS_uid119_acosX_uid8_fpArccosPiTest_q, path2NegCaseFPL_uid116_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE path2NegCaseFP_uid121_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "0" => path2NegCaseFP_uid121_acosX_uid8_fpArccosPiTest_q <= path2NegCaseFPS_uid119_acosX_uid8_fpArccosPiTest_q;
                  WHEN "1" => path2NegCaseFP_uid121_acosX_uid8_fpArccosPiTest_q <= path2NegCaseFPL_uid116_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => path2NegCaseFP_uid121_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--path2PosCaseFPFraction_uid122_acosX_uid8_fpArccosPiTest(BITSELECT,121)@12
    path2PosCaseFPFraction_uid122_acosX_uid8_fpArccosPiTest_in <= fxpArccosX_uid110_acosX_uid8_fpArccosPiTest_b(25 downto 0);
    path2PosCaseFPFraction_uid122_acosX_uid8_fpArccosPiTest_b <= path2PosCaseFPFraction_uid122_acosX_uid8_fpArccosPiTest_in(25 downto 3);

	--ld_path2PosCaseFPFraction_uid122_acosX_uid8_fpArccosPiTest_b_to_path2PosCaseFP_uid123_acosX_uid8_fpArccosPiTest_a(DELAY,806)@12
    ld_path2PosCaseFPFraction_uid122_acosX_uid8_fpArccosPiTest_b_to_path2PosCaseFP_uid123_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => path2PosCaseFPFraction_uid122_acosX_uid8_fpArccosPiTest_b, xout => ld_path2PosCaseFPFraction_uid122_acosX_uid8_fpArccosPiTest_b_to_path2PosCaseFP_uid123_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--path2PosCaseFP_uid123_acosX_uid8_fpArccosPiTest(BITJOIN,122)@13
    path2PosCaseFP_uid123_acosX_uid8_fpArccosPiTest_q <= GND_q & cstBias_uid22_acosX_uid8_fpArccosPiTest_q & ld_path2PosCaseFPFraction_uid122_acosX_uid8_fpArccosPiTest_b_to_path2PosCaseFP_uid123_acosX_uid8_fpArccosPiTest_a_q;

	--singX_uid17_acosX_uid8_fpArccosPiTest(BITSELECT,16)@0
    singX_uid17_acosX_uid8_fpArccosPiTest_in <= a;
    singX_uid17_acosX_uid8_fpArccosPiTest_b <= singX_uid17_acosX_uid8_fpArccosPiTest_in(31 downto 31);

	--ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path2ResFP_uid125_acosX_uid8_fpArccosPiTest_b(DELAY,807)@0
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path2ResFP_uid125_acosX_uid8_fpArccosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => singX_uid17_acosX_uid8_fpArccosPiTest_b, xout => ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path2ResFP_uid125_acosX_uid8_fpArccosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--path2ResFP_uid125_acosX_uid8_fpArccosPiTest(MUX,124)@13
    path2ResFP_uid125_acosX_uid8_fpArccosPiTest_s <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path2ResFP_uid125_acosX_uid8_fpArccosPiTest_b_q;
    path2ResFP_uid125_acosX_uid8_fpArccosPiTest: PROCESS (path2ResFP_uid125_acosX_uid8_fpArccosPiTest_s, en, path2PosCaseFP_uid123_acosX_uid8_fpArccosPiTest_q, path2NegCaseFP_uid121_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE path2ResFP_uid125_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "0" => path2ResFP_uid125_acosX_uid8_fpArccosPiTest_q <= path2PosCaseFP_uid123_acosX_uid8_fpArccosPiTest_q;
                  WHEN "1" => path2ResFP_uid125_acosX_uid8_fpArccosPiTest_q <= path2NegCaseFP_uid121_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => path2ResFP_uid125_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest(BITSELECT,131)@13
    Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_in <= path2ResFP_uid125_acosX_uid8_fpArccosPiTest_q(30 downto 0);
    Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b <= Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_in(30 downto 23);

	--ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_inputreg(DELAY,1616)
    ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b, xout => ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt(COUNTER,1605)
    -- every=1, low=0, high=25, step=1, init=1
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_i = 24 THEN
                      ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_eq = '1') THEN
                        ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_i <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_i - 25;
                    ELSE
                        ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_i <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_i,5));


	--ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdreg(REG,1606)
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdreg_q <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdmux(MUX,1607)
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdmux_s <= en;
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdmux: PROCESS (ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdmux_s, ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdreg_q, ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_q)
    BEGIN
            CASE ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdmux_s IS
                  WHEN "0" => ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdmux_q <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdreg_q;
                  WHEN "1" => ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdmux_q <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem(DUALMEM,1617)
    ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_reset0 <= areset;
    ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_ia <= ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_inputreg_q;
    ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_aa <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdreg_q;
    ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_ab <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdmux_q;
    ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 26,
        width_b => 8,
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
        clocken1 => ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_iq,
        address_a => ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_aa,
        data_a => ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_ia
    );
        ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_q <= ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_iq(7 downto 0);

	--reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3(REG,700)@41
    reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_q <= ld_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--RightShiftStage123dto1_uid544_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITSELECT,543)@39
    RightShiftStage123dto1_uid544_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in <= rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q;
    RightShiftStage123dto1_uid544_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b <= RightShiftStage123dto1_uid544_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in(23 downto 1);

	--rightShiftStage2Idx1_uid546_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITJOIN,545)@39
    rightShiftStage2Idx1_uid546_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= GND_q & RightShiftStage123dto1_uid544_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b;

	--rightShiftStage1Idx3Pad6_uid396_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(CONSTANT,395)
    rightShiftStage1Idx3Pad6_uid396_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= "000000";

	--RightShiftStage023dto6_uid539_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITSELECT,538)@39
    RightShiftStage023dto6_uid539_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in <= rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q;
    RightShiftStage023dto6_uid539_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b <= RightShiftStage023dto6_uid539_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in(23 downto 6);

	--rightShiftStage1Idx3_uid541_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITJOIN,540)@39
    rightShiftStage1Idx3_uid541_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= rightShiftStage1Idx3Pad6_uid396_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q & RightShiftStage023dto6_uid539_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b;

	--RightShiftStage023dto4_uid536_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITSELECT,535)@39
    RightShiftStage023dto4_uid536_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in <= rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q;
    RightShiftStage023dto4_uid536_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b <= RightShiftStage023dto4_uid536_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in(23 downto 4);

	--rightShiftStage1Idx2_uid538_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITJOIN,537)@39
    rightShiftStage1Idx2_uid538_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= rightShiftStage1Idx1Pad4_uid255_fxpX_uid59_acosX_uid8_fpArccosPiTest_q & RightShiftStage023dto4_uid536_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b;

	--RightShiftStage023dto2_uid533_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITSELECT,532)@39
    RightShiftStage023dto2_uid533_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in <= rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q;
    RightShiftStage023dto2_uid533_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b <= RightShiftStage023dto2_uid533_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in(23 downto 2);

	--rightShiftStage1Idx1_uid535_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITJOIN,534)@39
    rightShiftStage1Idx1_uid535_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= rightShiftStage2Idx2Pad2_uid269_fxpX_uid59_acosX_uid8_fpArccosPiTest_q & RightShiftStage023dto2_uid533_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b;

	--rightShiftStage0Idx3_uid386_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(CONSTANT,385)
    rightShiftStage0Idx3_uid386_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= "000000000000000000000000";

	--maxCountVal_uid320_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(CONSTANT,319)
    maxCountVal_uid320_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= "100011";

	--reg_y_uid61_acosX_uid8_fpArccosPiTest_0_to_oMy_uid63_acosX_uid8_fpArccosPiTest_1(REG,616)@1
    reg_y_uid61_acosX_uid8_fpArccosPiTest_0_to_oMy_uid63_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_y_uid61_acosX_uid8_fpArccosPiTest_0_to_oMy_uid63_acosX_uid8_fpArccosPiTest_1_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_y_uid61_acosX_uid8_fpArccosPiTest_0_to_oMy_uid63_acosX_uid8_fpArccosPiTest_1_q <= y_uid61_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--pad_o_uid27_uid63_acosX_uid8_fpArccosPiTest(BITJOIN,62)@1
    pad_o_uid27_uid63_acosX_uid8_fpArccosPiTest_q <= VCC_q & STD_LOGIC_VECTOR((34 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_o_uid27_uid63_acosX_uid8_fpArccosPiTest_0_to_oMy_uid63_acosX_uid8_fpArccosPiTest_0(REG,615)@1
    reg_pad_o_uid27_uid63_acosX_uid8_fpArccosPiTest_0_to_oMy_uid63_acosX_uid8_fpArccosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_o_uid27_uid63_acosX_uid8_fpArccosPiTest_0_to_oMy_uid63_acosX_uid8_fpArccosPiTest_0_q <= "000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_o_uid27_uid63_acosX_uid8_fpArccosPiTest_0_to_oMy_uid63_acosX_uid8_fpArccosPiTest_0_q <= pad_o_uid27_uid63_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--oMy_uid63_acosX_uid8_fpArccosPiTest(SUB,63)@2
    oMy_uid63_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR("0" & reg_pad_o_uid27_uid63_acosX_uid8_fpArccosPiTest_0_to_oMy_uid63_acosX_uid8_fpArccosPiTest_0_q);
    oMy_uid63_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR("00" & reg_y_uid61_acosX_uid8_fpArccosPiTest_0_to_oMy_uid63_acosX_uid8_fpArccosPiTest_1_q);
            oMy_uid63_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMy_uid63_acosX_uid8_fpArccosPiTest_a) - UNSIGNED(oMy_uid63_acosX_uid8_fpArccosPiTest_b));
    oMy_uid63_acosX_uid8_fpArccosPiTest_q <= oMy_uid63_acosX_uid8_fpArccosPiTest_o(36 downto 0);


	--l_uid65_acosX_uid8_fpArccosPiTest(BITSELECT,64)@2
    l_uid65_acosX_uid8_fpArccosPiTest_in <= oMy_uid63_acosX_uid8_fpArccosPiTest_q(34 downto 0);
    l_uid65_acosX_uid8_fpArccosPiTest_b <= l_uid65_acosX_uid8_fpArccosPiTest_in(34 downto 0);

	--rVStage_uid278_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITSELECT,277)@2
    rVStage_uid278_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in <= l_uid65_acosX_uid8_fpArccosPiTest_b;
    rVStage_uid278_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= rVStage_uid278_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in(34 downto 3);

	--reg_rVStage_uid278_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1(REG,617)@2
    reg_rVStage_uid278_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid278_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid278_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q <= rVStage_uid278_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(LOGICAL,278)@3
    vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a <= reg_rVStage_uid278_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q;
    vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= rightShiftStage0Idx2Pad32_uid249_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
    vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= "1" when vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a = vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b else "0";

	--ld_vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_f(DELAY,1040)@3
    ld_vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q, xout => ld_vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid281_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITSELECT,280)@2
    vStage_uid281_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in <= l_uid65_acosX_uid8_fpArccosPiTest_b(2 downto 0);
    vStage_uid281_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= vStage_uid281_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in(2 downto 0);

	--cStage_uid282_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITJOIN,281)@2
    cStage_uid282_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= vStage_uid281_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b & rightShiftStage0Idx2Pad32_uid249_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;

	--reg_cStage_uid282_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3(REG,619)@2
    reg_cStage_uid282_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid282_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid282_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q <= cStage_uid282_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_l_uid65_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2(REG,618)@2
    reg_l_uid65_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_l_uid65_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_l_uid65_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q <= l_uid65_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(MUX,282)@3
    vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s <= vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
    vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest: PROCESS (vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s, en, reg_l_uid65_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q, reg_cStage_uid282_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q)
    BEGIN
            CASE vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "0" => vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= reg_l_uid65_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q;
                  WHEN "1" => vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= reg_cStage_uid282_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q;
                  WHEN OTHERS => vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid285_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITSELECT,284)@3
    rVStage_uid285_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in <= vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
    rVStage_uid285_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= rVStage_uid285_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in(34 downto 19);

	--reg_rVStage_uid285_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1(REG,620)@3
    reg_rVStage_uid285_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid285_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid285_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q <= rVStage_uid285_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(LOGICAL,285)@4
    vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a <= reg_rVStage_uid285_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q;
    vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= rightShiftStage0Idx1Pad16_uid246_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
    vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= "1" when vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a = vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b else "0";

	--ld_vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_e(DELAY,1039)@4
    ld_vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q, xout => ld_vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid288_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITSELECT,287)@3
    vStage_uid288_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in <= vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q(18 downto 0);
    vStage_uid288_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= vStage_uid288_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in(18 downto 0);

	--cStage_uid289_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITJOIN,288)@3
    cStage_uid289_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= vStage_uid288_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b & rightShiftStage0Idx1Pad16_uid246_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;

	--reg_cStage_uid289_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3(REG,622)@3
    reg_cStage_uid289_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid289_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid289_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q <= cStage_uid289_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2(REG,621)@3
    reg_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q <= vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(MUX,289)@4
    vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s <= vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
    vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest: PROCESS (vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s, en, reg_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q, reg_cStage_uid289_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q)
    BEGIN
            CASE vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "0" => vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= reg_vStagei_uid283_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q;
                  WHEN "1" => vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= reg_cStage_uid289_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q;
                  WHEN OTHERS => vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid292_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITSELECT,291)@4
    rVStage_uid292_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in <= vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
    rVStage_uid292_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= rVStage_uid292_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in(34 downto 27);

	--vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(LOGICAL,292)@4
    vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a <= rVStage_uid292_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b;
    vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q;
    vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= "1" when vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a = vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b else "0";

	--reg_vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3(REG,626)@4
    reg_vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q <= vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid295_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITSELECT,294)@4
    vStage_uid295_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in <= vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q(26 downto 0);
    vStage_uid295_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= vStage_uid295_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in(26 downto 0);

	--cStage_uid296_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITJOIN,295)@4
    cStage_uid296_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= vStage_uid295_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b & cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q;

	--vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(MUX,296)@4
    vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s <= vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
    vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest: PROCESS (vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s, en, vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q, cStage_uid296_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "0" => vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= vStagei_uid290_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
                  WHEN "1" => vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= cStage_uid296_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid299_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITSELECT,298)@4
    rVStage_uid299_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in <= vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
    rVStage_uid299_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= rVStage_uid299_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in(34 downto 31);

	--reg_rVStage_uid299_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1(REG,623)@4
    reg_rVStage_uid299_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid299_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid299_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q <= rVStage_uid299_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(LOGICAL,299)@5
    vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a <= reg_rVStage_uid299_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q;
    vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= rightShiftStage1Idx1Pad4_uid255_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
    vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= "1" when vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a = vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b else "0";

	--vStage_uid302_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITSELECT,301)@4
    vStage_uid302_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in <= vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q(30 downto 0);
    vStage_uid302_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= vStage_uid302_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in(30 downto 0);

	--cStage_uid303_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITJOIN,302)@4
    cStage_uid303_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= vStage_uid302_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b & rightShiftStage1Idx1Pad4_uid255_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;

	--reg_cStage_uid303_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3(REG,625)@4
    reg_cStage_uid303_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid303_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid303_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q <= cStage_uid303_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2(REG,624)@4
    reg_vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q <= vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(MUX,303)@5
    vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s <= vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
    vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest: PROCESS (vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s, en, reg_vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q, reg_cStage_uid303_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q)
    BEGIN
            CASE vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "0" => vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= reg_vStagei_uid297_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_2_q;
                  WHEN "1" => vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= reg_cStage_uid303_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q;
                  WHEN OTHERS => vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid306_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITSELECT,305)@5
    rVStage_uid306_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in <= vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
    rVStage_uid306_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= rVStage_uid306_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in(34 downto 33);

	--vCount_uid307_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(LOGICAL,306)@5
    vCount_uid307_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a <= rVStage_uid306_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b;
    vCount_uid307_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= rightShiftStage2Idx2Pad2_uid269_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
    vCount_uid307_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= "1" when vCount_uid307_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a = vCount_uid307_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b else "0";

	--vStage_uid309_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITSELECT,308)@5
    vStage_uid309_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in <= vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q(32 downto 0);
    vStage_uid309_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= vStage_uid309_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in(32 downto 0);

	--cStage_uid310_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITJOIN,309)@5
    cStage_uid310_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= vStage_uid309_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b & rightShiftStage2Idx2Pad2_uid269_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;

	--vStagei_uid311_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(MUX,310)@5
    vStagei_uid311_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s <= vCount_uid307_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
    vStagei_uid311_fpLOut1_uid66_acosX_uid8_fpArccosPiTest: PROCESS (vStagei_uid311_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s, en, vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q, cStage_uid310_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE vStagei_uid311_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "0" => vStagei_uid311_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= vStagei_uid304_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
                  WHEN "1" => vStagei_uid311_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= cStage_uid310_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => vStagei_uid311_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid313_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITSELECT,312)@5
    rVStage_uid313_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in <= vStagei_uid311_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
    rVStage_uid313_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= rVStage_uid313_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in(34 downto 34);

	--vCount_uid314_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(LOGICAL,313)@5
    vCount_uid314_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a <= rVStage_uid313_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b;
    vCount_uid314_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= GND_q;
    vCount_uid314_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= "1" when vCount_uid314_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a = vCount_uid314_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b else "0";

	--vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITJOIN,318)@5
    vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= ld_vCount_uid279_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_f_q & ld_vCount_uid286_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_e_q & reg_vCount_uid293_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_3_q & vCount_uid300_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q & vCount_uid307_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q & vCount_uid314_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;

	--ld_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_c(DELAY,1043)@5
    ld_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_c : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q, xout => ld_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1(REG,627)@5
    reg_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q <= vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(COMPARE,320)@6
    vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_cin <= GND_q;
    vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR("00" & maxCountVal_uid320_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q) & '0';
    vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR("00" & reg_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_0_to_vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_1_q) & vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_cin(0);
            vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_a) - UNSIGNED(vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b));
    vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_c(0) <= vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_o(8);


	--vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(MUX,322)@6
    vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s <= vCountBig_uid321_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_c;
    vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s IS
                      WHEN "0" => vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= ld_vCount_uid319_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q_to_vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_c_q;
                      WHEN "1" => vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= maxCountVal_uid320_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
                      WHEN OTHERS => vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--cstBiasM2_uid6_fpArccosPiTest(CONSTANT,5)
    cstBiasM2_uid6_fpArccosPiTest_q <= "01111101";

	--expL_uid67_acosX_uid8_fpArccosPiTest(SUB,66)@7
    expL_uid67_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM2_uid6_fpArccosPiTest_q);
    expL_uid67_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR("000" & vCountFinal_uid323_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q);
            expL_uid67_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expL_uid67_acosX_uid8_fpArccosPiTest_a) - UNSIGNED(expL_uid67_acosX_uid8_fpArccosPiTest_b));
    expL_uid67_acosX_uid8_fpArccosPiTest_q <= expL_uid67_acosX_uid8_fpArccosPiTest_o(8 downto 0);


	--expLRange_uid69_acosX_uid8_fpArccosPiTest(BITSELECT,68)@7
    expLRange_uid69_acosX_uid8_fpArccosPiTest_in <= expL_uid67_acosX_uid8_fpArccosPiTest_q(7 downto 0);
    expLRange_uid69_acosX_uid8_fpArccosPiTest_b <= expLRange_uid69_acosX_uid8_fpArccosPiTest_in(7 downto 0);

	--vStage_uid316_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITSELECT,315)@5
    vStage_uid316_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in <= vStagei_uid311_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q(33 downto 0);
    vStage_uid316_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b <= vStage_uid316_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_in(33 downto 0);

	--cStage_uid317_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(BITJOIN,316)@5
    cStage_uid317_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= vStage_uid316_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_b & GND_q;

	--vStagei_uid318_fpLOut1_uid66_acosX_uid8_fpArccosPiTest(MUX,317)@5
    vStagei_uid318_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s <= vCount_uid314_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
    vStagei_uid318_fpLOut1_uid66_acosX_uid8_fpArccosPiTest: PROCESS (vStagei_uid318_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s, en, vStagei_uid311_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q, cStage_uid317_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE vStagei_uid318_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "0" => vStagei_uid318_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= vStagei_uid311_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
                  WHEN "1" => vStagei_uid318_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= cStage_uid317_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => vStagei_uid318_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest(BITSELECT,67)@5
    fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_in <= vStagei_uid318_fpLOut1_uid66_acosX_uid8_fpArccosPiTest_q(33 downto 0);
    fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_b <= fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_in(33 downto 11);

	--ld_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_b_to_reg_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_0_to_fpL_uid70_acosX_uid8_fpArccosPiTest_0_a(DELAY,1359)@5
    ld_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_b_to_reg_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_0_to_fpL_uid70_acosX_uid8_fpArccosPiTest_0_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_b, xout => ld_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_b_to_reg_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_0_to_fpL_uid70_acosX_uid8_fpArccosPiTest_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_0_to_fpL_uid70_acosX_uid8_fpArccosPiTest_0(REG,628)@6
    reg_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_0_to_fpL_uid70_acosX_uid8_fpArccosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_0_to_fpL_uid70_acosX_uid8_fpArccosPiTest_0_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_0_to_fpL_uid70_acosX_uid8_fpArccosPiTest_0_q <= ld_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_b_to_reg_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_0_to_fpL_uid70_acosX_uid8_fpArccosPiTest_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--fpL_uid70_acosX_uid8_fpArccosPiTest(BITJOIN,69)@7
    fpL_uid70_acosX_uid8_fpArccosPiTest_q <= GND_q & expLRange_uid69_acosX_uid8_fpArccosPiTest_b & reg_fpLOutFrac_uid68_acosX_uid8_fpArccosPiTest_0_to_fpL_uid70_acosX_uid8_fpArccosPiTest_0_q;

	--signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(BITSELECT,327)@7
    signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in <= fpL_uid70_acosX_uid8_fpArccosPiTest_q;
    signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in(31 downto 31);

	--expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(BITSELECT,325)@7
    expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in <= fpL_uid70_acosX_uid8_fpArccosPiTest_q(30 downto 0);
    expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in(30 downto 23);

	--expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,332)@7
    expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;
    expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q;
    expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "1" when expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a = expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b else "0";

	--negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,375)@7
    negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;
    negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a and negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;
        END IF;
    END PROCESS;



	--ld_negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_c(DELAY,1099)@8
    ld_negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 10 )
    PORT MAP ( xin => negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q, xout => ld_negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_nor(LOGICAL,1499)
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_nor_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q;
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_nor_b <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_sticky_ena_q;
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_nor_q <= not (ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_nor_a or ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_nor_b);

	--ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_mem_top(CONSTANT,1495)
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_mem_top_q <= "0110";

	--ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmp(LOGICAL,1496)
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmp_a <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_mem_top_q;
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdmux_q);
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmp_q <= "1" when ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmp_a = ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmp_b else "0";

	--ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmpReg(REG,1497)
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmpReg_q <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_sticky_ena(REG,1500)
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_nor_q = "1") THEN
                ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_sticky_ena_q <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_enaAnd(LOGICAL,1501)
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_enaAnd_a <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_sticky_ena_q;
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_enaAnd_b <= en;
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_enaAnd_q <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_enaAnd_a and ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_enaAnd_b;

	--cstBiasM1_uid23_acosX_uid8_fpArccosPiTest(CONSTANT,22)
    cstBiasM1_uid23_acosX_uid8_fpArccosPiTest_q <= "01111110";

	--reg_expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0(REG,638)@7
    reg_expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_q <= expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expOddSig_uid349_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(ADD,348)@8
    expOddSig_uid349_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR("0" & reg_expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_q);
    expOddSig_uid349_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid23_acosX_uid8_fpArccosPiTest_q);
            expOddSig_uid349_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expOddSig_uid349_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a) + UNSIGNED(expOddSig_uid349_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b));
    expOddSig_uid349_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= expOddSig_uid349_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_o(8 downto 0);


	--expROdd_uid350_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(BITSELECT,349)@8
    expROdd_uid350_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in <= expOddSig_uid349_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    expROdd_uid350_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= expROdd_uid350_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in(8 downto 1);

	--expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(ADD,345)@8
    expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR("0" & reg_expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_q);
    expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR("0" & cstBias_uid22_acosX_uid8_fpArccosPiTest_q);
            expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a) + UNSIGNED(expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b));
    expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_o(8 downto 0);


	--expREven_uid347_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(BITSELECT,346)@8
    expREven_uid347_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in <= expEvenSig_uid346_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    expREven_uid347_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= expREven_uid347_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in(8 downto 1);

	--expX0_uid351_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(BITSELECT,350)@7
    expX0_uid351_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in <= expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b(0 downto 0);
    expX0_uid351_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= expX0_uid351_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in(0 downto 0);

	--expOddSelect_uid352_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,351)@7
    expOddSelect_uid352_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= expX0_uid351_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;
    expOddSelect_uid352_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= not expOddSelect_uid352_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a;

	--ld_expOddSelect_uid352_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b(DELAY,1067)@7
    ld_expOddSelect_uid352_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expOddSelect_uid352_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q, xout => ld_expOddSelect_uid352_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(MUX,352)@8
    expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_s <= ld_expOddSelect_uid352_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_q;
    expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_s IS
                      WHEN "0" => expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= expREven_uid347_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;
                      WHEN "1" => expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= expROdd_uid350_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;
                      WHEN OTHERS => expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b(DELAY,1079)@7
    ld_signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b, xout => ld_signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid341_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,340)@8
    InvExc_N_uid341_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= exc_N_uid340_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    InvExc_N_uid341_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= not InvExc_N_uid341_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a;

	--fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(BITSELECT,326)@7
    fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in <= fpL_uid70_acosX_uid8_fpArccosPiTest_q(22 downto 0);
    fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in(22 downto 0);

	--reg_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_1(REG,629)@7
    reg_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_1_q <= fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,336)@8
    fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= reg_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_1_q;
    fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
    fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "1" when fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a = fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b else "0";

	--expXIsMax_uid335_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,334)@7
    expXIsMax_uid335_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= expX_uid326_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;
    expXIsMax_uid335_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q;
    expXIsMax_uid335_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXIsMax_uid335_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            IF (expXIsMax_uid335_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a = expXIsMax_uid335_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b) THEN
                expXIsMax_uid335_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "1";
            ELSE
                expXIsMax_uid335_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "0";
            END IF;
        END IF;
    END PROCESS;



	--exc_I_uid338_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,337)@8
    exc_I_uid338_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= expXIsMax_uid335_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    exc_I_uid338_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    exc_I_uid338_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= exc_I_uid338_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a and exc_I_uid338_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;

	--InvExc_I_uid342_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,341)@8
    InvExc_I_uid342_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= exc_I_uid338_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    InvExc_I_uid342_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= not InvExc_I_uid342_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a;

	--InvExpXIsZero_uid343_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,342)@7
    InvExpXIsZero_uid343_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    InvExpXIsZero_uid343_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExpXIsZero_uid343_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExpXIsZero_uid343_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= not InvExpXIsZero_uid343_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a;
        END IF;
    END PROCESS;



	--exc_R_uid344_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,343)@8
    exc_R_uid344_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= InvExpXIsZero_uid343_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    exc_R_uid344_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= InvExc_I_uid342_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    exc_R_uid344_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_c <= InvExc_N_uid341_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    exc_R_uid344_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= exc_R_uid344_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a and exc_R_uid344_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b and exc_R_uid344_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_c;

	--minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,361)@8
    minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= exc_R_uid344_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= ld_signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_q;
    minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a and minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;

	--minInf_uid363_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,362)@8
    minInf_uid363_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= exc_I_uid338_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    minInf_uid363_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= ld_signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_q;
    minInf_uid363_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= minInf_uid363_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a and minInf_uid363_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;

	--InvFracXIsZero_uid339_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,338)@8
    InvFracXIsZero_uid339_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= fracXIsZero_uid337_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    InvFracXIsZero_uid339_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= not InvFracXIsZero_uid339_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a;

	--exc_N_uid340_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,339)@8
    exc_N_uid340_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= expXIsMax_uid335_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    exc_N_uid340_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= InvFracXIsZero_uid339_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    exc_N_uid340_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= exc_N_uid340_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a and exc_N_uid340_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;

	--excRNaN_uid364_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,363)@8
    excRNaN_uid364_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= exc_N_uid340_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    excRNaN_uid364_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= minInf_uid363_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    excRNaN_uid364_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_c <= minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    excRNaN_uid364_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= excRNaN_uid364_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a or excRNaN_uid364_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b or excRNaN_uid364_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_c;

	--InvSignX_uid360_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,359)@7
    InvSignX_uid360_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;
    InvSignX_uid360_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= not InvSignX_uid360_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a;

	--ld_InvSignX_uid360_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b(DELAY,1077)@7
    ld_InvSignX_uid360_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvSignX_uid360_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q, xout => ld_InvSignX_uid360_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOGICAL,360)@8
    inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a <= exc_I_uid338_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= ld_InvSignX_uid360_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_q;
    inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a and inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;

	--ld_expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_join_uid365_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a(DELAY,1085)@7
    ld_expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_join_uid365_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q, xout => ld_expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_join_uid365_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--join_uid365_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(BITJOIN,364)@8
    join_uid365_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= excRNaN_uid364_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q & inInfAndNotNeg_uid361_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q & ld_expXIsZero_uid333_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_join_uid365_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a_q;

	--fracSelIn_uid366_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(BITJOIN,365)@8
    fracSelIn_uid366_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= ld_signX_uid328_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_minReg_uid362_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_q & join_uid365_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;

	--reg_fracSelIn_uid366_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0(REG,630)@8
    reg_fracSelIn_uid366_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracSelIn_uid366_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracSelIn_uid366_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_q <= fracSelIn_uid366_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(LOOKUP,366)@9
    fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest: PROCESS (reg_fracSelIn_uid366_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_fracSelIn_uid366_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_q) IS
                WHEN "0000" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "01";
                WHEN "0001" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "00";
                WHEN "0010" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "10";
                WHEN "0011" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "00";
                WHEN "0100" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "11";
                WHEN "0101" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "00";
                WHEN "0110" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "10";
                WHEN "0111" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "00";
                WHEN "1000" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "11";
                WHEN "1001" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "00";
                WHEN "1010" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "11";
                WHEN "1011" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "11";
                WHEN "1100" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "11";
                WHEN "1101" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "11";
                WHEN "1110" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "11";
                WHEN "1111" =>  fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= "11";
                WHEN OTHERS =>
                    fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(MUX,370)@9
    expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_s <= fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest: PROCESS (expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_s, en, cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q, expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q, cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q, cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q;
                  WHEN "01" => expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= expRMux_uid353_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
                  WHEN "10" => expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q;
                  WHEN "11" => expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_inputreg(DELAY,1489)
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q, xout => ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt(COUNTER,1491)
    -- every=1, low=0, high=6, step=1, init=1
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i = 5 THEN
                      ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_eq = '1') THEN
                        ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i - 6;
                    ELSE
                        ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i,3));


	--ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdreg(REG,1492)
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdreg_q <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdmux(MUX,1493)
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdmux_s <= en;
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdmux: PROCESS (ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdmux_s, ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdreg_q, ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdmux_q <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdmux_q <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem(DUALMEM,1490)
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_reset0 <= areset;
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_ia <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_inputreg_q;
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_aa <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdreg_q;
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_ab <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_rdmux_q;
    ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_iq,
        address_a => ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_aa,
        data_a => ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_ia
    );
        ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_q <= ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_iq(7 downto 0);

	--cstNaNWF_uid20_acosX_uid8_fpArccosPiTest(CONSTANT,19)
    cstNaNWF_uid20_acosX_uid8_fpArccosPiTest_q <= "00000000000000000000001";

	--fracXAddr_uid355_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(BITSELECT,354)@7
    fracXAddr_uid355_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in <= fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;
    fracXAddr_uid355_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= fracXAddr_uid355_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in(22 downto 16);

	--addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(BITJOIN,355)@7
    addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= expOddSelect_uid352_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q & fracXAddr_uid355_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;

	--reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid568_sqrtTableGenerator_lutmem_0(REG,631)@7
    reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid568_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid568_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid568_sqrtTableGenerator_lutmem_0_q <= addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid568_sqrtTableGenerator_lutmem(DUALMEM,607)@8
    memoryC2_uid568_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC2_uid568_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC2_uid568_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC2_uid568_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid568_sqrtTableGenerator_lutmem_0_q;
    memoryC2_uid568_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_arccospi_s5_memoryC2_uid568_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid568_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid568_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid568_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC2_uid568_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC2_uid568_sqrtTableGenerator_lutmem_ia
    );
        memoryC2_uid568_sqrtTableGenerator_lutmem_q <= memoryC2_uid568_sqrtTableGenerator_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid568_sqrtTableGenerator_lutmem_0_to_prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_1(REG,633)@10
    reg_memoryC2_uid568_sqrtTableGenerator_lutmem_0_to_prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid568_sqrtTableGenerator_lutmem_0_to_prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid568_sqrtTableGenerator_lutmem_0_to_prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_1_q <= memoryC2_uid568_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a_inputreg(DELAY,1488)
    ld_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b, xout => ld_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a(DELAY,1073)@7
    ld_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => ld_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a_inputreg_q, xout => ld_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(BITSELECT,356)@10
    FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in <= ld_fracX_uid327_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_a_q(15 downto 0);
    FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in(15 downto 0);

	--yT1_uid569_sqrtPolynomialEvaluator(BITSELECT,568)@10
    yT1_uid569_sqrtPolynomialEvaluator_in <= FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;
    yT1_uid569_sqrtPolynomialEvaluator_b <= yT1_uid569_sqrtPolynomialEvaluator_in(15 downto 4);

	--reg_yT1_uid569_sqrtPolynomialEvaluator_0_to_prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_0(REG,632)@10
    reg_yT1_uid569_sqrtPolynomialEvaluator_0_to_prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid569_sqrtPolynomialEvaluator_0_to_prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid569_sqrtPolynomialEvaluator_0_to_prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_0_q <= yT1_uid569_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator(MULT,593)@11
    prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_a),13)) * SIGNED(prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_b);
    prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_a <= reg_yT1_uid569_sqrtPolynomialEvaluator_0_to_prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_0_q;
                prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_b <= reg_memoryC2_uid568_sqrtTableGenerator_lutmem_0_to_prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_1_q;
                prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_q <= prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid595_pT1_uid570_sqrtPolynomialEvaluator(BITSELECT,594)@14
    prodXYTruncFR_uid595_pT1_uid570_sqrtPolynomialEvaluator_in <= prodXY_uid594_pT1_uid570_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid595_pT1_uid570_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid595_pT1_uid570_sqrtPolynomialEvaluator_in(23 downto 11);

	--highBBits_uid572_sqrtPolynomialEvaluator(BITSELECT,571)@14
    highBBits_uid572_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid595_pT1_uid570_sqrtPolynomialEvaluator_b;
    highBBits_uid572_sqrtPolynomialEvaluator_b <= highBBits_uid572_sqrtPolynomialEvaluator_in(12 downto 1);

	--ld_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid567_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid567_sqrtTableGenerator_lutmem_a(DELAY,1337)@8
    ld_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid567_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid567_sqrtTableGenerator_lutmem_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid568_sqrtTableGenerator_lutmem_0_q, xout => ld_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid567_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid567_sqrtTableGenerator_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid567_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid567_sqrtTableGenerator_lutmem_a_outputreg(DELAY,1551)
    ld_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid567_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid567_sqrtTableGenerator_lutmem_a_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid567_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid567_sqrtTableGenerator_lutmem_a_q, xout => ld_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid567_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid567_sqrtTableGenerator_lutmem_a_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid567_sqrtTableGenerator_lutmem(DUALMEM,606)@12
    memoryC1_uid567_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC1_uid567_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC1_uid567_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC1_uid567_sqrtTableGenerator_lutmem_ab <= ld_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid567_sqrtTableGenerator_lutmem_0_q_to_memoryC1_uid567_sqrtTableGenerator_lutmem_a_outputreg_q;
    memoryC1_uid567_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_arccospi_s5_memoryC1_uid567_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid567_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid567_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid567_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC1_uid567_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC1_uid567_sqrtTableGenerator_lutmem_ia
    );
        memoryC1_uid567_sqrtTableGenerator_lutmem_q <= memoryC1_uid567_sqrtTableGenerator_lutmem_iq(20 downto 0);

	--sumAHighB_uid573_sqrtPolynomialEvaluator(ADD,572)@14
    sumAHighB_uid573_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid567_sqrtTableGenerator_lutmem_q(20)) & memoryC1_uid567_sqrtTableGenerator_lutmem_q);
    sumAHighB_uid573_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid572_sqrtPolynomialEvaluator_b(11)) & highBBits_uid572_sqrtPolynomialEvaluator_b);
            sumAHighB_uid573_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid573_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid573_sqrtPolynomialEvaluator_b));
    sumAHighB_uid573_sqrtPolynomialEvaluator_q <= sumAHighB_uid573_sqrtPolynomialEvaluator_o(21 downto 0);


	--lowRangeB_uid571_sqrtPolynomialEvaluator(BITSELECT,570)@14
    lowRangeB_uid571_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid595_pT1_uid570_sqrtPolynomialEvaluator_b(0 downto 0);
    lowRangeB_uid571_sqrtPolynomialEvaluator_b <= lowRangeB_uid571_sqrtPolynomialEvaluator_in(0 downto 0);

	--s1_uid571_uid574_sqrtPolynomialEvaluator(BITJOIN,573)@14
    s1_uid571_uid574_sqrtPolynomialEvaluator_q <= sumAHighB_uid573_sqrtPolynomialEvaluator_q & lowRangeB_uid571_sqrtPolynomialEvaluator_b;

	--reg_s1_uid571_uid574_sqrtPolynomialEvaluator_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_1(REG,636)@14
    reg_s1_uid571_uid574_sqrtPolynomialEvaluator_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid571_uid574_sqrtPolynomialEvaluator_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid571_uid574_sqrtPolynomialEvaluator_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_1_q <= s1_uid571_uid574_sqrtPolynomialEvaluator_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_nor(LOGICAL,1560)
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_nor_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q;
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_nor_b <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_sticky_ena_q;
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_nor_q <= not (ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_nor_a or ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_nor_b);

	--ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_cmpReg(REG,1558)
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_sticky_ena(REG,1561)
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_nor_q = "1") THEN
                ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_sticky_ena_q <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_enaAnd(LOGICAL,1562)
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_enaAnd_a <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_sticky_ena_q;
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_enaAnd_b <= en;
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_enaAnd_q <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_enaAnd_a and ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_enaAnd_b;

	--ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_inputreg(DELAY,1552)
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b, xout => ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdcnt(COUNTER,1554)
    -- every=1, low=0, high=1, step=1, init=1
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i,1));


	--ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdreg(REG,1555)
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdreg_q <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdmux(MUX,1556)
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdmux_s <= en;
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdmux: PROCESS (ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdmux_s, ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdreg_q, ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdmux_q <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdreg_q;
                  WHEN "1" => ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdmux_q <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem(DUALMEM,1553)
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_reset0 <= areset;
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_ia <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_inputreg_q;
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_aa <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdreg_q;
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_ab <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdmux_q;
    ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_iq,
        address_a => ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_aa,
        data_a => ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_ia
    );
        ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_q <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_iq(15 downto 0);

	--reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0(REG,635)@14
    reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_q <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator(MULT,596)@15
    prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_a),17)) * SIGNED(prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_b);
    prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_a <= reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_q;
                prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_b <= reg_s1_uid571_uid574_sqrtPolynomialEvaluator_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_1_q;
                prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_q <= prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid598_pT2_uid576_sqrtPolynomialEvaluator(BITSELECT,597)@18
    prodXYTruncFR_uid598_pT2_uid576_sqrtPolynomialEvaluator_in <= prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid598_pT2_uid576_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid598_pT2_uid576_sqrtPolynomialEvaluator_in(38 downto 15);

	--highBBits_uid578_sqrtPolynomialEvaluator(BITSELECT,577)@18
    highBBits_uid578_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid598_pT2_uid576_sqrtPolynomialEvaluator_b;
    highBBits_uid578_sqrtPolynomialEvaluator_b <= highBBits_uid578_sqrtPolynomialEvaluator_in(23 downto 2);

	--ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_nor(LOGICAL,1573)
    ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_nor_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q;
    ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_nor_b <= ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_nor_q <= not (ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_nor_a or ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_nor_b);

	--ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_sticky_ena(REG,1574)
    ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_nor_q = "1") THEN
                ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_sticky_ena_q <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_enaAnd(LOGICAL,1575)
    ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_enaAnd_a <= ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_enaAnd_b <= en;
    ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_enaAnd_q <= ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_enaAnd_a and ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_enaAnd_b;

	--ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_inputreg(DELAY,1563)
    ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q, xout => ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem(DUALMEM,1564)
    ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0 <= areset;
    ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_ia <= ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_inputreg_q;
    ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_aa <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdreg_q;
    ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_ab <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux_q;
    ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_iq,
        address_a => ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_aa,
        data_a => ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_ia
    );
        ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_q <= ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0(REG,637)@15
    reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_q <= ld_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid566_sqrtTableGenerator_lutmem(DUALMEM,605)@16
    memoryC0_uid566_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC0_uid566_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC0_uid566_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC0_uid566_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid356_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid566_sqrtTableGenerator_lutmem_0_q;
    memoryC0_uid566_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_arccospi_s5_memoryC0_uid566_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid566_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid566_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid566_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC0_uid566_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC0_uid566_sqrtTableGenerator_lutmem_ia
    );
        memoryC0_uid566_sqrtTableGenerator_lutmem_q <= memoryC0_uid566_sqrtTableGenerator_lutmem_iq(28 downto 0);

	--sumAHighB_uid579_sqrtPolynomialEvaluator(ADD,578)@18
    sumAHighB_uid579_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((29 downto 29 => memoryC0_uid566_sqrtTableGenerator_lutmem_q(28)) & memoryC0_uid566_sqrtTableGenerator_lutmem_q);
    sumAHighB_uid579_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid578_sqrtPolynomialEvaluator_b(21)) & highBBits_uid578_sqrtPolynomialEvaluator_b);
            sumAHighB_uid579_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid579_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid579_sqrtPolynomialEvaluator_b));
    sumAHighB_uid579_sqrtPolynomialEvaluator_q <= sumAHighB_uid579_sqrtPolynomialEvaluator_o(29 downto 0);


	--lowRangeB_uid577_sqrtPolynomialEvaluator(BITSELECT,576)@18
    lowRangeB_uid577_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid598_pT2_uid576_sqrtPolynomialEvaluator_b(1 downto 0);
    lowRangeB_uid577_sqrtPolynomialEvaluator_b <= lowRangeB_uid577_sqrtPolynomialEvaluator_in(1 downto 0);

	--s2_uid577_uid580_sqrtPolynomialEvaluator(BITJOIN,579)@18
    s2_uid577_uid580_sqrtPolynomialEvaluator_q <= sumAHighB_uid579_sqrtPolynomialEvaluator_q & lowRangeB_uid577_sqrtPolynomialEvaluator_b;

	--fracR_uid359_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(BITSELECT,358)@18
    fracR_uid359_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in <= s2_uid577_uid580_sqrtPolynomialEvaluator_q(28 downto 0);
    fracR_uid359_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b <= fracR_uid359_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_in(28 downto 6);

	--ld_fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b(DELAY,1093)@9
    ld_fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 9 )
    PORT MAP ( xin => fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q, xout => ld_fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(MUX,374)@18
    fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_s <= ld_fracSel_uid367_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_q;
    fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest: PROCESS (fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_s, en, cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q, fracR_uid359_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b, cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q, cstNaNWF_uid20_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
                  WHEN "01" => fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= fracR_uid359_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b;
                  WHEN "10" => fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
                  WHEN "11" => fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= cstNaNWF_uid20_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest(BITJOIN,376)@18
    RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q <= ld_negZero_uid376_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_c_q & ld_expRPostExc_uid371_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q_to_RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_replace_mem_q & fracRPostExc_uid375_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;

	--SqrtFPL22dto0_uid73_acosX_uid8_fpArccosPiTest(BITSELECT,72)@18
    SqrtFPL22dto0_uid73_acosX_uid8_fpArccosPiTest_in <= RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q(22 downto 0);
    SqrtFPL22dto0_uid73_acosX_uid8_fpArccosPiTest_b <= SqrtFPL22dto0_uid73_acosX_uid8_fpArccosPiTest_in(22 downto 0);

	--reg_SqrtFPL22dto0_uid73_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1(REG,662)@18
    reg_SqrtFPL22dto0_uid73_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_SqrtFPL22dto0_uid73_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_SqrtFPL22dto0_uid73_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= SqrtFPL22dto0_uid73_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,437)@19
    fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= reg_SqrtFPL22dto0_uid73_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q;
    fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
    fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "1" when fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a = fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b else "0";

	--ld_fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b(DELAY,1149)@19
    ld_fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest(BITSELECT,74)@18
    SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_in <= RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q(30 downto 0);
    SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_b <= SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_in(30 downto 23);

	--reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1(REG,640)@18
    reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,435)@19
    expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q;
    expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q;
    expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "1" when expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a = expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b else "0";

	--ld_expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a(DELAY,1148)@19
    ld_expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,438)@31
    exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= ld_expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q;
    exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= ld_fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_q;
    exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--reg_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2(REG,675)@31
    reg_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q <= exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--RightShiftStage123dto1_uid400_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITSELECT,399)@20
    RightShiftStage123dto1_uid400_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in <= rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
    RightShiftStage123dto1_uid400_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b <= RightShiftStage123dto1_uid400_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in(23 downto 1);

	--rightShiftStage2Idx1_uid402_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITJOIN,401)@20
    rightShiftStage2Idx1_uid402_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= GND_q & RightShiftStage123dto1_uid400_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b;

	--oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest(BITJOIN,73)@18
    oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_q <= VCC_q & SqrtFPL22dto0_uid73_acosX_uid8_fpArccosPiTest_b;

	--X23dto16_uid383_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITSELECT,382)@18
    X23dto16_uid383_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in <= oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_q;
    X23dto16_uid383_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b <= X23dto16_uid383_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in(23 downto 16);

	--rightShiftStage0Idx2_uid385_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITJOIN,384)@18
    rightShiftStage0Idx2_uid385_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= rightShiftStage0Idx1Pad16_uid246_fxpX_uid59_acosX_uid8_fpArccosPiTest_q & X23dto16_uid383_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b;

	--reg_rightShiftStage0Idx2_uid385_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_4(REG,644)@18
    reg_rightShiftStage0Idx2_uid385_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx2_uid385_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_4_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx2_uid385_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_4_q <= rightShiftStage0Idx2_uid385_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--X23dto8_uid380_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITSELECT,379)@18
    X23dto8_uid380_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in <= oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_q;
    X23dto8_uid380_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b <= X23dto8_uid380_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in(23 downto 8);

	--rightShiftStage0Idx1_uid382_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITJOIN,381)@18
    rightShiftStage0Idx1_uid382_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q & X23dto8_uid380_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b;

	--reg_rightShiftStage0Idx1_uid382_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_3(REG,643)@18
    reg_rightShiftStage0Idx1_uid382_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx1_uid382_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_3_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx1_uid382_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_3_q <= rightShiftStage0Idx1_uid382_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2(REG,642)@18
    reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2_q <= oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--srVal_uid76_acosX_uid8_fpArccosPiTest(SUB,75)@19
    srVal_uid76_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid23_acosX_uid8_fpArccosPiTest_q);
    srVal_uid76_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR("0" & reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q);
            srVal_uid76_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(srVal_uid76_acosX_uid8_fpArccosPiTest_a) - UNSIGNED(srVal_uid76_acosX_uid8_fpArccosPiTest_b));
    srVal_uid76_acosX_uid8_fpArccosPiTest_q <= srVal_uid76_acosX_uid8_fpArccosPiTest_o(8 downto 0);


	--srValRange_uid77_acosX_uid8_fpArccosPiTest(BITSELECT,76)@19
    srValRange_uid77_acosX_uid8_fpArccosPiTest_in <= srVal_uid76_acosX_uid8_fpArccosPiTest_q(4 downto 0);
    srValRange_uid77_acosX_uid8_fpArccosPiTest_b <= srValRange_uid77_acosX_uid8_fpArccosPiTest_in(4 downto 0);

	--rightShiftStageSel4Dto3_uid387_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITSELECT,386)@19
    rightShiftStageSel4Dto3_uid387_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in <= srValRange_uid77_acosX_uid8_fpArccosPiTest_b;
    rightShiftStageSel4Dto3_uid387_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b <= rightShiftStageSel4Dto3_uid387_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in(4 downto 3);

	--rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(MUX,387)@19
    rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_s <= rightShiftStageSel4Dto3_uid387_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b;
    rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest: PROCESS (rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_s, en, reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2_q, reg_rightShiftStage0Idx1_uid382_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_3_q, reg_rightShiftStage0Idx2_uid385_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_4_q, rightShiftStage0Idx3_uid386_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2_q;
                  WHEN "01" => rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= reg_rightShiftStage0Idx1_uid382_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_3_q;
                  WHEN "10" => rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= reg_rightShiftStage0Idx2_uid385_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_4_q;
                  WHEN "11" => rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= rightShiftStage0Idx3_uid386_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage023dto6_uid395_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITSELECT,394)@19
    RightShiftStage023dto6_uid395_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in <= rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
    RightShiftStage023dto6_uid395_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b <= RightShiftStage023dto6_uid395_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in(23 downto 6);

	--rightShiftStage1Idx3_uid397_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITJOIN,396)@19
    rightShiftStage1Idx3_uid397_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= rightShiftStage1Idx3Pad6_uid396_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q & RightShiftStage023dto6_uid395_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b;

	--reg_rightShiftStage1Idx3_uid397_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_5(REG,649)@19
    reg_rightShiftStage1Idx3_uid397_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx3_uid397_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_5_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx3_uid397_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_5_q <= rightShiftStage1Idx3_uid397_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--RightShiftStage023dto4_uid392_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITSELECT,391)@19
    RightShiftStage023dto4_uid392_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in <= rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
    RightShiftStage023dto4_uid392_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b <= RightShiftStage023dto4_uid392_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in(23 downto 4);

	--rightShiftStage1Idx2_uid394_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITJOIN,393)@19
    rightShiftStage1Idx2_uid394_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= rightShiftStage1Idx1Pad4_uid255_fxpX_uid59_acosX_uid8_fpArccosPiTest_q & RightShiftStage023dto4_uid392_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b;

	--reg_rightShiftStage1Idx2_uid394_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_4(REG,648)@19
    reg_rightShiftStage1Idx2_uid394_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx2_uid394_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_4_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx2_uid394_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_4_q <= rightShiftStage1Idx2_uid394_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--RightShiftStage023dto2_uid389_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITSELECT,388)@19
    RightShiftStage023dto2_uid389_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in <= rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
    RightShiftStage023dto2_uid389_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b <= RightShiftStage023dto2_uid389_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in(23 downto 2);

	--rightShiftStage1Idx1_uid391_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITJOIN,390)@19
    rightShiftStage1Idx1_uid391_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= rightShiftStage2Idx2Pad2_uid269_fxpX_uid59_acosX_uid8_fpArccosPiTest_q & RightShiftStage023dto2_uid389_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b;

	--reg_rightShiftStage1Idx1_uid391_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_3(REG,647)@19
    reg_rightShiftStage1Idx1_uid391_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx1_uid391_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_3_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx1_uid391_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_3_q <= rightShiftStage1Idx1_uid391_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2(REG,646)@19
    reg_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2_q <= rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid398_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITSELECT,397)@19
    rightShiftStageSel2Dto1_uid398_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in <= srValRange_uid77_acosX_uid8_fpArccosPiTest_b(2 downto 0);
    rightShiftStageSel2Dto1_uid398_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b <= rightShiftStageSel2Dto1_uid398_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in(2 downto 1);

	--reg_rightShiftStageSel2Dto1_uid398_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_1(REG,645)@19
    reg_rightShiftStageSel2Dto1_uid398_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid398_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid398_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_1_q <= rightShiftStageSel2Dto1_uid398_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(MUX,398)@20
    rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_s <= reg_rightShiftStageSel2Dto1_uid398_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_1_q;
    rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest: PROCESS (rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_s, en, reg_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2_q, reg_rightShiftStage1Idx1_uid391_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_3_q, reg_rightShiftStage1Idx2_uid394_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_4_q, reg_rightShiftStage1Idx3_uid397_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_5_q)
    BEGIN
            CASE rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= reg_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2_q;
                  WHEN "01" => rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= reg_rightShiftStage1Idx1_uid391_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_3_q;
                  WHEN "10" => rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= reg_rightShiftStage1Idx2_uid394_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_4_q;
                  WHEN "11" => rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= reg_rightShiftStage1Idx3_uid397_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_5_q;
                  WHEN OTHERS => rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid403_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(BITSELECT,402)@19
    rightShiftStageSel0Dto0_uid403_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in <= srValRange_uid77_acosX_uid8_fpArccosPiTest_b(0 downto 0);
    rightShiftStageSel0Dto0_uid403_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b <= rightShiftStageSel0Dto0_uid403_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_in(0 downto 0);

	--reg_rightShiftStageSel0Dto0_uid403_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_1(REG,650)@19
    reg_rightShiftStageSel0Dto0_uid403_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid403_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid403_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_1_q <= rightShiftStageSel0Dto0_uid403_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest(MUX,403)@20
    rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_s <= reg_rightShiftStageSel0Dto0_uid403_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_1_q;
    rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest: PROCESS (rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_s, en, rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q, rightShiftStage2Idx1_uid402_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "0" => rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= rightShiftStage1_uid399_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
                  WHEN "1" => rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= rightShiftStage2Idx1_uid402_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sAddr_uid80_acosX_uid8_fpArccosPiTest(BITSELECT,79)@20
    sAddr_uid80_acosX_uid8_fpArccosPiTest_in <= rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
    sAddr_uid80_acosX_uid8_fpArccosPiTest_b <= sAddr_uid80_acosX_uid8_fpArccosPiTest_in(23 downto 16);

	--reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid408_arcsinXO2XTabGen_lutmem_0(REG,651)@20
    reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid408_arcsinXO2XTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid408_arcsinXO2XTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid408_arcsinXO2XTabGen_lutmem_0_q <= sAddr_uid80_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid408_arcsinXO2XTabGen_lutmem(DUALMEM,601)@21
    memoryC2_uid408_arcsinXO2XTabGen_lutmem_reset0 <= areset;
    memoryC2_uid408_arcsinXO2XTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid408_arcsinXO2XTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid408_arcsinXO2XTabGen_lutmem_ab <= reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC2_uid408_arcsinXO2XTabGen_lutmem_0_q;
    memoryC2_uid408_arcsinXO2XTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arccospi_s5_memoryC2_uid408_arcsinXO2XTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid408_arcsinXO2XTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid408_arcsinXO2XTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid408_arcsinXO2XTabGen_lutmem_iq,
        address_a => memoryC2_uid408_arcsinXO2XTabGen_lutmem_aa,
        data_a => memoryC2_uid408_arcsinXO2XTabGen_lutmem_ia
    );
        memoryC2_uid408_arcsinXO2XTabGen_lutmem_q <= memoryC2_uid408_arcsinXO2XTabGen_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid408_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_1(REG,653)@23
    reg_memoryC2_uid408_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid408_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid408_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_1_q <= memoryC2_uid408_arcsinXO2XTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q_to_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_a_inputreg(DELAY,1448)
    ld_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q_to_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q, xout => ld_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q_to_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q_to_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_a(DELAY,768)@20
    ld_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q_to_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => ld_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q_to_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_a_inputreg_q, xout => ld_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q_to_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--sPPolyEval_uid81_acosX_uid8_fpArccosPiTest(BITSELECT,80)@23
    sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_in <= ld_rightShiftStage2_uid404_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q_to_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_a_q(15 downto 0);
    sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b <= sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_in(15 downto 1);

	--yT1_uid409_arcsinXO2XPolyEval(BITSELECT,408)@23
    yT1_uid409_arcsinXO2XPolyEval_in <= sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b;
    yT1_uid409_arcsinXO2XPolyEval_b <= yT1_uid409_arcsinXO2XPolyEval_in(14 downto 3);

	--reg_yT1_uid409_arcsinXO2XPolyEval_0_to_prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_0(REG,652)@23
    reg_yT1_uid409_arcsinXO2XPolyEval_0_to_prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid409_arcsinXO2XPolyEval_0_to_prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid409_arcsinXO2XPolyEval_0_to_prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_0_q <= yT1_uid409_arcsinXO2XPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval(MULT,581)@24
    prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_a),13)) * SIGNED(prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_b);
    prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_a <= (others => '0');
            prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_b <= (others => '0');
            prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_a <= reg_yT1_uid409_arcsinXO2XPolyEval_0_to_prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_0_q;
                prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_b <= reg_memoryC2_uid408_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_1_q;
                prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_q <= prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid583_pT1_uid410_arcsinXO2XPolyEval(BITSELECT,582)@27
    prodXYTruncFR_uid583_pT1_uid410_arcsinXO2XPolyEval_in <= prodXY_uid582_pT1_uid410_arcsinXO2XPolyEval_q;
    prodXYTruncFR_uid583_pT1_uid410_arcsinXO2XPolyEval_b <= prodXYTruncFR_uid583_pT1_uid410_arcsinXO2XPolyEval_in(23 downto 11);

	--highBBits_uid412_arcsinXO2XPolyEval(BITSELECT,411)@27
    highBBits_uid412_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid583_pT1_uid410_arcsinXO2XPolyEval_b;
    highBBits_uid412_arcsinXO2XPolyEval_b <= highBBits_uid412_arcsinXO2XPolyEval_in(12 downto 1);

	--ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_a_inputreg(DELAY,1576)
    ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => sAddr_uid80_acosX_uid8_fpArccosPiTest_b, xout => ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_a(DELAY,1385)@20
    ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_a_inputreg_q, xout => ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0(REG,654)@24
    reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_q <= ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid407_arcsinXO2XTabGen_lutmem(DUALMEM,600)@25
    memoryC1_uid407_arcsinXO2XTabGen_lutmem_reset0 <= areset;
    memoryC1_uid407_arcsinXO2XTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid407_arcsinXO2XTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid407_arcsinXO2XTabGen_lutmem_ab <= reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_q;
    memoryC1_uid407_arcsinXO2XTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arccospi_s5_memoryC1_uid407_arcsinXO2XTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid407_arcsinXO2XTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid407_arcsinXO2XTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid407_arcsinXO2XTabGen_lutmem_iq,
        address_a => memoryC1_uid407_arcsinXO2XTabGen_lutmem_aa,
        data_a => memoryC1_uid407_arcsinXO2XTabGen_lutmem_ia
    );
        memoryC1_uid407_arcsinXO2XTabGen_lutmem_q <= memoryC1_uid407_arcsinXO2XTabGen_lutmem_iq(18 downto 0);

	--sumAHighB_uid413_arcsinXO2XPolyEval(ADD,412)@27
    sumAHighB_uid413_arcsinXO2XPolyEval_a <= STD_LOGIC_VECTOR((19 downto 19 => memoryC1_uid407_arcsinXO2XTabGen_lutmem_q(18)) & memoryC1_uid407_arcsinXO2XTabGen_lutmem_q);
    sumAHighB_uid413_arcsinXO2XPolyEval_b <= STD_LOGIC_VECTOR((19 downto 12 => highBBits_uid412_arcsinXO2XPolyEval_b(11)) & highBBits_uid412_arcsinXO2XPolyEval_b);
            sumAHighB_uid413_arcsinXO2XPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid413_arcsinXO2XPolyEval_a) + SIGNED(sumAHighB_uid413_arcsinXO2XPolyEval_b));
    sumAHighB_uid413_arcsinXO2XPolyEval_q <= sumAHighB_uid413_arcsinXO2XPolyEval_o(19 downto 0);


	--lowRangeB_uid411_arcsinXO2XPolyEval(BITSELECT,410)@27
    lowRangeB_uid411_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid583_pT1_uid410_arcsinXO2XPolyEval_b(0 downto 0);
    lowRangeB_uid411_arcsinXO2XPolyEval_b <= lowRangeB_uid411_arcsinXO2XPolyEval_in(0 downto 0);

	--s1_uid411_uid414_arcsinXO2XPolyEval(BITJOIN,413)@27
    s1_uid411_uid414_arcsinXO2XPolyEval_q <= sumAHighB_uid413_arcsinXO2XPolyEval_q & lowRangeB_uid411_arcsinXO2XPolyEval_b;

	--reg_s1_uid411_uid414_arcsinXO2XPolyEval_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_1(REG,656)@27
    reg_s1_uid411_uid414_arcsinXO2XPolyEval_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid411_uid414_arcsinXO2XPolyEval_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_1_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid411_uid414_arcsinXO2XPolyEval_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_1_q <= s1_uid411_uid414_arcsinXO2XPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_nor(LOGICAL,1585)
    ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_nor_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q;
    ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_nor_b <= ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_sticky_ena_q;
    ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_nor_q <= not (ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_nor_a or ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_nor_b);

	--ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_sticky_ena(REG,1586)
    ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_nor_q = "1") THEN
                ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_sticky_ena_q <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_enaAnd(LOGICAL,1587)
    ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_enaAnd_a <= ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_sticky_ena_q;
    ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_enaAnd_b <= en;
    ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_enaAnd_q <= ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_enaAnd_a and ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_enaAnd_b;

	--ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_inputreg(DELAY,1577)
    ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b, xout => ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem(DUALMEM,1578)
    ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_reset0 <= areset;
    ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_ia <= ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_inputreg_q;
    ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_aa <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdreg_q;
    ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_ab <= ld_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_b_to_reg_FracX15dto0_uid357_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid597_pT2_uid576_sqrtPolynomialEvaluator_0_a_replace_rdmux_q;
    ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 15,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 15,
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
        clocken1 => ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_iq,
        address_a => ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_aa,
        data_a => ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_ia
    );
        ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_q <= ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_iq(14 downto 0);

	--reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0(REG,655)@27
    reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_q <= "000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_q <= ld_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_b_to_reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval(MULT,584)@28
    prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_a),16)) * SIGNED(prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_b);
    prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_a <= (others => '0');
            prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_b <= (others => '0');
            prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_a <= reg_sPPolyEval_uid81_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_0_q;
                prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_b <= reg_s1_uid411_uid414_arcsinXO2XPolyEval_0_to_prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_1_q;
                prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_pr,36));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_q <= prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid586_pT2_uid416_arcsinXO2XPolyEval(BITSELECT,585)@31
    prodXYTruncFR_uid586_pT2_uid416_arcsinXO2XPolyEval_in <= prodXY_uid585_pT2_uid416_arcsinXO2XPolyEval_q;
    prodXYTruncFR_uid586_pT2_uid416_arcsinXO2XPolyEval_b <= prodXYTruncFR_uid586_pT2_uid416_arcsinXO2XPolyEval_in(35 downto 14);

	--highBBits_uid418_arcsinXO2XPolyEval(BITSELECT,417)@31
    highBBits_uid418_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid586_pT2_uid416_arcsinXO2XPolyEval_b;
    highBBits_uid418_arcsinXO2XPolyEval_b <= highBBits_uid418_arcsinXO2XPolyEval_in(21 downto 2);

	--ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_nor(LOGICAL,1598)
    ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_nor_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q;
    ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_nor_b <= ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q;
    ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_nor_q <= not (ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_nor_a or ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_nor_b);

	--ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_sticky_ena(REG,1599)
    ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_nor_q = "1") THEN
                ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_enaAnd(LOGICAL,1600)
    ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_enaAnd_a <= ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q;
    ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_enaAnd_b <= en;
    ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_enaAnd_q <= ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_enaAnd_a and ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_enaAnd_b;

	--ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem(DUALMEM,1589)
    ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_reset0 <= areset;
    ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ia <= ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC1_uid407_arcsinXO2XTabGen_lutmem_0_a_inputreg_q;
    ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_aa <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdreg_q;
    ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ab <= ld_reg_mPPolyEval_uid108_acosX_uid8_fpArccosPiTest_0_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_0_q_to_prodXY_uid591_pT2_uid560_arccosXO2PolyEval_a_replace_rdmux_q;
    ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_iq,
        address_a => ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_aa,
        data_a => ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ia
    );
        ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_q <= ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0(REG,657)@28
    reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_q <= ld_sAddr_uid80_acosX_uid8_fpArccosPiTest_b_to_reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid406_arcsinXO2XTabGen_lutmem(DUALMEM,599)@29
    memoryC0_uid406_arcsinXO2XTabGen_lutmem_reset0 <= areset;
    memoryC0_uid406_arcsinXO2XTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid406_arcsinXO2XTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid406_arcsinXO2XTabGen_lutmem_ab <= reg_sAddr_uid80_acosX_uid8_fpArccosPiTest_0_to_memoryC0_uid406_arcsinXO2XTabGen_lutmem_0_q;
    memoryC0_uid406_arcsinXO2XTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arccospi_s5_memoryC0_uid406_arcsinXO2XTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid406_arcsinXO2XTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid406_arcsinXO2XTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid406_arcsinXO2XTabGen_lutmem_iq,
        address_a => memoryC0_uid406_arcsinXO2XTabGen_lutmem_aa,
        data_a => memoryC0_uid406_arcsinXO2XTabGen_lutmem_ia
    );
        memoryC0_uid406_arcsinXO2XTabGen_lutmem_q <= memoryC0_uid406_arcsinXO2XTabGen_lutmem_iq(29 downto 0);

	--sumAHighB_uid419_arcsinXO2XPolyEval(ADD,418)@31
    sumAHighB_uid419_arcsinXO2XPolyEval_a <= STD_LOGIC_VECTOR((30 downto 30 => memoryC0_uid406_arcsinXO2XTabGen_lutmem_q(29)) & memoryC0_uid406_arcsinXO2XTabGen_lutmem_q);
    sumAHighB_uid419_arcsinXO2XPolyEval_b <= STD_LOGIC_VECTOR((30 downto 20 => highBBits_uid418_arcsinXO2XPolyEval_b(19)) & highBBits_uid418_arcsinXO2XPolyEval_b);
            sumAHighB_uid419_arcsinXO2XPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid419_arcsinXO2XPolyEval_a) + SIGNED(sumAHighB_uid419_arcsinXO2XPolyEval_b));
    sumAHighB_uid419_arcsinXO2XPolyEval_q <= sumAHighB_uid419_arcsinXO2XPolyEval_o(30 downto 0);


	--lowRangeB_uid417_arcsinXO2XPolyEval(BITSELECT,416)@31
    lowRangeB_uid417_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid586_pT2_uid416_arcsinXO2XPolyEval_b(1 downto 0);
    lowRangeB_uid417_arcsinXO2XPolyEval_b <= lowRangeB_uid417_arcsinXO2XPolyEval_in(1 downto 0);

	--s2_uid417_uid420_arcsinXO2XPolyEval(BITJOIN,419)@31
    s2_uid417_uid420_arcsinXO2XPolyEval_q <= sumAHighB_uid419_arcsinXO2XPolyEval_q & lowRangeB_uid417_arcsinXO2XPolyEval_b;

	--fxpArcSinXO2XRes_uid83_acosX_uid8_fpArccosPiTest(BITSELECT,82)@31
    fxpArcSinXO2XRes_uid83_acosX_uid8_fpArccosPiTest_in <= s2_uid417_uid420_arcsinXO2XPolyEval_q(30 downto 0);
    fxpArcSinXO2XRes_uid83_acosX_uid8_fpArccosPiTest_b <= fxpArcSinXO2XRes_uid83_acosX_uid8_fpArccosPiTest_in(30 downto 5);

	--fxpArcsinXO2XResWFRange_uid84_acosX_uid8_fpArccosPiTest(BITSELECT,83)@31
    fxpArcsinXO2XResWFRange_uid84_acosX_uid8_fpArccosPiTest_in <= fxpArcSinXO2XRes_uid83_acosX_uid8_fpArccosPiTest_b(24 downto 0);
    fxpArcsinXO2XResWFRange_uid84_acosX_uid8_fpArccosPiTest_b <= fxpArcsinXO2XResWFRange_uid84_acosX_uid8_fpArccosPiTest_in(24 downto 2);

	--fpArcsinXO2XRes_uid85_acosX_uid8_fpArccosPiTest(BITJOIN,84)@31
    fpArcsinXO2XRes_uid85_acosX_uid8_fpArccosPiTest_q <= GND_q & cstBiasP1_uid26_acosX_uid8_fpArccosPiTest_q & fxpArcsinXO2XResWFRange_uid84_acosX_uid8_fpArccosPiTest_b;

	--expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITSELECT,422)@31
    expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in <= fpArcsinXO2XRes_uid85_acosX_uid8_fpArccosPiTest_q(30 downto 0);
    expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in(30 downto 23);

	--expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,449)@31
    expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;
    expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q;
    expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "1" when expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a = expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b else "0";

	--reg_expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2(REG,659)@31
    reg_expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q <= expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,503)@32
    excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= reg_expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q;
    excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= reg_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q;
    excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--fracY_uid428_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITSELECT,427)@31
    fracY_uid428_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in <= fpArcsinXO2XRes_uid85_acosX_uid8_fpArccosPiTest_q(22 downto 0);
    fracY_uid428_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= fracY_uid428_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in(22 downto 0);

	--reg_fracY_uid428_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1(REG,660)@31
    reg_fracY_uid428_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracY_uid428_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracY_uid428_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= fracY_uid428_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,453)@32
    fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= reg_fracY_uid428_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q;
    fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
    fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "1" when fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a = fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b else "0";

	--expXIsMax_uid452_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,451)@31
    expXIsMax_uid452_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;
    expXIsMax_uid452_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q;
    expXIsMax_uid452_arcsinL_uid87_acosX_uid8_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXIsMax_uid452_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            IF (expXIsMax_uid452_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a = expXIsMax_uid452_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b) THEN
                expXIsMax_uid452_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "1";
            ELSE
                expXIsMax_uid452_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "0";
            END IF;
        END IF;
    END PROCESS;



	--exc_I_uid455_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,454)@32
    exc_I_uid455_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= expXIsMax_uid452_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    exc_I_uid455_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    exc_I_uid455_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= exc_I_uid455_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and exc_I_uid455_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,433)@19
    expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q;
    expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q;
    expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "1" when expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a = expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b else "0";

	--ld_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a(DELAY,1212)@19
    ld_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excXZAndExcYI_uid505_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,504)@32
    excXZAndExcYI_uid505_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= ld_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q;
    excXZAndExcYI_uid505_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= exc_I_uid455_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    excXZAndExcYI_uid505_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= excXZAndExcYI_uid505_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and excXZAndExcYI_uid505_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--ZeroTimesInf_uid506_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,505)@32
    ZeroTimesInf_uid506_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= excXZAndExcYI_uid505_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    ZeroTimesInf_uid506_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= excYZAndExcXI_uid504_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    ZeroTimesInf_uid506_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= ZeroTimesInf_uid506_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a or ZeroTimesInf_uid506_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--InvFracXIsZero_uid456_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,455)@32
    InvFracXIsZero_uid456_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= fracXIsZero_uid454_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    InvFracXIsZero_uid456_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= not InvFracXIsZero_uid456_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a;

	--exc_N_uid457_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,456)@32
    exc_N_uid457_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= expXIsMax_uid452_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    exc_N_uid457_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= InvFracXIsZero_uid456_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    exc_N_uid457_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= exc_N_uid457_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and exc_N_uid457_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--InvFracXIsZero_uid440_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,439)@19
    InvFracXIsZero_uid440_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= fracXIsZero_uid438_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    InvFracXIsZero_uid440_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= not InvFracXIsZero_uid440_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a;

	--exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,440)@19
    exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= expXIsMax_uid436_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= InvFracXIsZero_uid440_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--ld_exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a(DELAY,1242)@19
    ld_exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,506)@32
    excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= ld_exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q;
    excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= exc_N_uid457_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c <= ZeroTimesInf_uid506_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a or excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b or excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c;

	--InvExcRNaN_uid519_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,518)@32
    InvExcRNaN_uid519_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    InvExcRNaN_uid519_arcsinL_uid87_acosX_uid8_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExcRNaN_uid519_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExcRNaN_uid519_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= not InvExcRNaN_uid519_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a;
        END IF;
    END PROCESS;



	--signY_uid425_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITSELECT,424)@31
    signY_uid425_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in <= fpArcsinXO2XRes_uid85_acosX_uid8_fpArccosPiTest_q;
    signY_uid425_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= signY_uid425_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in(31 downto 31);

	--signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITSELECT,423)@18
    signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in <= RSqrt_uid377_sqrtFPL_uid72_acosX_uid8_fpArccosPiTest_q;
    signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in(31 downto 31);

	--ld_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_to_reg_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_a(DELAY,1410)@18
    ld_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_to_reg_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b, xout => ld_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_to_reg_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1(REG,679)@30
    reg_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= ld_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_to_reg_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,489)@31
    signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= reg_signX_uid424_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q;
    signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= signY_uid425_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;
    signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a xor signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;
        END IF;
    END PROCESS;



	--ld_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a(DELAY,1254)@32
    ld_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,519)@33
    signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= ld_signR_uid490_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q;
    signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= InvExcRNaN_uid519_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--ld_signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c(DELAY,1258)@33
    ld_signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--add_one_fracY_uid428_uid429_uid429_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITJOIN,428)@31
    add_one_fracY_uid428_uid429_uid429_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= VCC_q & fracY_uid428_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--reg_add_one_fracY_uid428_uid429_uid429_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1(REG,666)@31
    reg_add_one_fracY_uid428_uid429_uid429_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_add_one_fracY_uid428_uid429_uid429_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_add_one_fracY_uid428_uid429_uid429_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= add_one_fracY_uid428_uid429_uid429_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor(LOGICAL,1523)
    ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q;
    ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_b <= ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena_q;
    ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_q <= not (ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_a or ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_b);

	--ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_mem_top(CONSTANT,1507)
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_mem_top_q <= "01011";

	--ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmp(LOGICAL,1508)
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmp_a <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_mem_top_q;
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdmux_q);
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmp_q <= "1" when ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmp_a = ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmp_b else "0";

	--ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmpReg(REG,1509)
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmpReg_q <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena(REG,1524)
    ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_q = "1") THEN
                ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena_q <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd(LOGICAL,1525)
    ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_a <= ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena_q;
    ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_b <= en;
    ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_q <= ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_a and ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_b;

	--ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt(COUNTER,1503)
    -- every=1, low=0, high=11, step=1, init=1
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i = 10 THEN
                      ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i - 11;
                    ELSE
                        ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i,4));


	--ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdreg(REG,1504)
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdreg_q <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdmux(MUX,1505)
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdmux_s <= en;
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdmux: PROCESS (ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdmux_s, ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdreg_q, ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdmux_q <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdmux_q <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem(DUALMEM,1514)
    ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_reset0 <= areset;
    ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_ia <= reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid388_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_2_q;
    ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_aa <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdreg_q;
    ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_ab <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdmux_q;
    ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 24,
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
        clocken1 => ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_iq,
        address_a => ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_aa,
        data_a => ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_ia
    );
        ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_q <= ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_iq(23 downto 0);

	--prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest(MULT,464)@32
    prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_pr <= UNSIGNED(prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a) * UNSIGNED(prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b);
    prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= (others => '0');
            prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= (others => '0');
            prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= ld_reg_oSqrtFPLFrac_uid74_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_q;
                prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= reg_add_one_fracY_uid428_uid429_uid429_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q;
                prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s1 <= STD_LOGIC_VECTOR(prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normalizeBit_uid466_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITSELECT,465)@35
    normalizeBit_uid466_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in <= prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    normalizeBit_uid466_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= normalizeBit_uid466_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in(47 downto 47);

	--roundBitDetectionConstant_uid201_rAcosPi_uid13_fpArccosPiTest(CONSTANT,200)
    roundBitDetectionConstant_uid201_rAcosPi_uid13_fpArccosPiTest_q <= "010";

	--fracRPostNormHigh_uid468_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITSELECT,467)@35
    fracRPostNormHigh_uid468_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in <= prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q(46 downto 0);
    fracRPostNormHigh_uid468_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= fracRPostNormHigh_uid468_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in(46 downto 23);

	--fracRPostNormLow_uid469_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITSELECT,468)@35
    fracRPostNormLow_uid469_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in <= prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q(45 downto 0);
    fracRPostNormLow_uid469_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= fracRPostNormLow_uid469_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in(45 downto 22);

	--fracRPostNorm_uid470_arcsinL_uid87_acosX_uid8_fpArccosPiTest(MUX,469)@35
    fracRPostNorm_uid470_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s <= normalizeBit_uid466_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;
    fracRPostNorm_uid470_arcsinL_uid87_acosX_uid8_fpArccosPiTest: PROCESS (fracRPostNorm_uid470_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s, en, fracRPostNormLow_uid469_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b, fracRPostNormHigh_uid468_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b)
    BEGIN
            CASE fracRPostNorm_uid470_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "0" => fracRPostNorm_uid470_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= fracRPostNormLow_uid469_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;
                  WHEN "1" => fracRPostNorm_uid470_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= fracRPostNormHigh_uid468_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;
                  WHEN OTHERS => fracRPostNorm_uid470_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--FracRPostNorm1dto0_uid478_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITSELECT,477)@35
    FracRPostNorm1dto0_uid478_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in <= fracRPostNorm_uid470_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q(1 downto 0);
    FracRPostNorm1dto0_uid478_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= FracRPostNorm1dto0_uid478_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in(1 downto 0);

	--Prod22_uid472_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITSELECT,471)@35
    Prod22_uid472_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in <= prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q(22 downto 0);
    Prod22_uid472_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= Prod22_uid472_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in(22 downto 22);

	--extraStickyBit_uid473_arcsinL_uid87_acosX_uid8_fpArccosPiTest(MUX,472)@35
    extraStickyBit_uid473_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s <= normalizeBit_uid466_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;
    extraStickyBit_uid473_arcsinL_uid87_acosX_uid8_fpArccosPiTest: PROCESS (extraStickyBit_uid473_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s, en, GND_q, Prod22_uid472_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b)
    BEGIN
            CASE extraStickyBit_uid473_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "0" => extraStickyBit_uid473_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= GND_q;
                  WHEN "1" => extraStickyBit_uid473_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= Prod22_uid472_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;
                  WHEN OTHERS => extraStickyBit_uid473_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--stickyRange_uid471_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITSELECT,470)@35
    stickyRange_uid471_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in <= prod_uid465_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q(21 downto 0);
    stickyRange_uid471_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= stickyRange_uid471_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in(21 downto 0);

	--stickyExtendedRange_uid474_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITJOIN,473)@35
    stickyExtendedRange_uid474_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= extraStickyBit_uid473_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q & stickyRange_uid471_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--stickyRangeComparator_uid476_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,475)@35
    stickyRangeComparator_uid476_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= stickyExtendedRange_uid474_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    stickyRangeComparator_uid476_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
    stickyRangeComparator_uid476_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "1" when stickyRangeComparator_uid476_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a = stickyRangeComparator_uid476_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b else "0";

	--sticky_uid477_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,476)@35
    sticky_uid477_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= stickyRangeComparator_uid476_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    sticky_uid477_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= not sticky_uid477_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a;

	--lrs_uid479_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITJOIN,478)@35
    lrs_uid479_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= FracRPostNorm1dto0_uid478_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b & sticky_uid477_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;

	--roundBitDetectionPattern_uid481_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,480)@35
    roundBitDetectionPattern_uid481_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= lrs_uid479_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    roundBitDetectionPattern_uid481_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= roundBitDetectionConstant_uid201_rAcosPi_uid13_fpArccosPiTest_q;
    roundBitDetectionPattern_uid481_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "1" when roundBitDetectionPattern_uid481_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a = roundBitDetectionPattern_uid481_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b else "0";

	--roundBit_uid482_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,481)@35
    roundBit_uid482_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= roundBitDetectionPattern_uid481_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    roundBit_uid482_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= not roundBit_uid482_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a;

	--roundBitAndNormalizationOp_uid485_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITJOIN,484)@35
    roundBitAndNormalizationOp_uid485_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= GND_q & normalizeBit_uid466_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b & cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q & roundBit_uid482_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;

	--reg_roundBitAndNormalizationOp_uid485_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1(REG,670)@35
    reg_roundBitAndNormalizationOp_uid485_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_roundBitAndNormalizationOp_uid485_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_roundBitAndNormalizationOp_uid485_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= roundBitAndNormalizationOp_uid485_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--biasInc_uid184_rAcosPi_uid13_fpArccosPiTest(CONSTANT,183)
    biasInc_uid184_rAcosPi_uid13_fpArccosPiTest_q <= "0001111111";

	--reg_expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1(REG,668)@31
    reg_expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor(LOGICAL,1511)
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q;
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_b <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena_q;
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_q <= not (ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_a or ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_b);

	--ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena(REG,1512)
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_nor_q = "1") THEN
                ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena_q <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd(LOGICAL,1513)
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_a <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_sticky_ena_q;
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_b <= en;
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_q <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_a and ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_b;

	--ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem(DUALMEM,1502)
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_reset0 <= areset;
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_ia <= reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q;
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_aa <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdreg_q;
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_ab <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_rdmux_q;
    ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 8,
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
        clocken1 => ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_iq,
        address_a => ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_aa,
        data_a => ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_ia
    );
        ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_q <= ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_iq(7 downto 0);

	--expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest(ADD,461)@32
    expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR("0" & ld_reg_SqrtFPL30dto23_uid75_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_replace_mem_q);
    expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR("0" & reg_expY_uid423_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q);
    expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a) + UNSIGNED(expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o(8 downto 0);


	--ld_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a(DELAY,1175)@33
    ld_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest(SUB,463)@34
    expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR('0' & "00" & ld_expSum_uid462_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q);
    expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR((11 downto 10 => biasInc_uid184_rAcosPi_uid13_fpArccosPiTest_q(9)) & biasInc_uid184_rAcosPi_uid13_fpArccosPiTest_q);
    expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a) - SIGNED(expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o(10 downto 0);


	--expFracPreRound_uid483_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITJOIN,482)@35
    expFracPreRound_uid483_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= expSumMBias_uid464_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q & fracRPostNorm_uid470_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;

	--reg_expFracPreRound_uid483_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0(REG,669)@35
    reg_expFracPreRound_uid483_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracPreRound_uid483_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracPreRound_uid483_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q <= expFracPreRound_uid483_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest(ADD,485)@36
    expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR((36 downto 35 => reg_expFracPreRound_uid483_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q(34)) & reg_expFracPreRound_uid483_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q);
    expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR('0' & "0000000000" & reg_roundBitAndNormalizationOp_uid485_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q);
            expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a) + SIGNED(expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b));
    expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o(35 downto 0);


	--expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITSELECT,487)@36
    expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in <= expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in(35 downto 24);

	--expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITSELECT,488)@36
    expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in <= expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b(7 downto 0);
    expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in(7 downto 0);

	--ld_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_to_reg_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_a(DELAY,1409)@36
    ld_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_to_reg_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b, xout => ld_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_to_reg_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3(REG,678)@37
    reg_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q <= ld_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_to_reg_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_a_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c(DELAY,1247)@32
    ld_excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1(REG,671)@36
    reg_expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest(COMPARE,492)@37
    expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_cin <= GND_q;
    expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR((13 downto 12 => reg_expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q(11)) & reg_expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q) & '0';
    expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR('0' & "00000" & cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q) & expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_cin(0);
            expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a) - SIGNED(expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b));
    expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_n(0) <= not expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o(14);


	--InvExc_N_uid458_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,457)@32
    InvExc_N_uid458_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= exc_N_uid457_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    InvExc_N_uid458_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= not InvExc_N_uid458_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a;

	--InvExc_I_uid459_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,458)@32
    InvExc_I_uid459_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= exc_I_uid455_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    InvExc_I_uid459_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= not InvExc_I_uid459_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a;

	--InvExpXIsZero_uid460_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,459)@31
    InvExpXIsZero_uid460_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    InvExpXIsZero_uid460_arcsinL_uid87_acosX_uid8_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExpXIsZero_uid460_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExpXIsZero_uid460_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= not InvExpXIsZero_uid460_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a;
        END IF;
    END PROCESS;



	--exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,460)@32
    exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= InvExpXIsZero_uid460_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= InvExc_I_uid459_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c <= InvExc_N_uid458_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b and exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c;

	--ld_exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b(DELAY,1217)@32
    ld_exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_InvExc_N_uid442_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a(DELAY,1153)@19
    ld_exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_InvExc_N_uid442_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_InvExc_N_uid442_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid442_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,441)@31
    InvExc_N_uid442_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= ld_exc_N_uid441_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_InvExc_N_uid442_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q;
    InvExc_N_uid442_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= not InvExc_N_uid442_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a;

	--InvExc_I_uid443_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,442)@31
    InvExc_I_uid443_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    InvExc_I_uid443_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= not InvExc_I_uid443_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a;

	--InvExpXIsZero_uid444_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,443)@19
    InvExpXIsZero_uid444_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    InvExpXIsZero_uid444_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= not InvExpXIsZero_uid444_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a;

	--ld_InvExpXIsZero_uid444_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a(DELAY,1156)@19
    ld_InvExpXIsZero_uid444_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => InvExpXIsZero_uid444_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_InvExpXIsZero_uid444_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,444)@31
    exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= ld_InvExpXIsZero_uid444_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q;
    exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= InvExc_I_uid443_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c <= InvExc_N_uid442_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b and exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c;

	--ld_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a(DELAY,1216)@31
    ld_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--ExcROvfAndInReg_uid502_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,501)@37
    ExcROvfAndInReg_uid502_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= ld_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q;
    ExcROvfAndInReg_uid502_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= ld_exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_q;
    ExcROvfAndInReg_uid502_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c <= expOvf_uid493_arcsinL_uid87_acosX_uid8_fpArccosPiTest_n;
    ExcROvfAndInReg_uid502_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= ExcROvfAndInReg_uid502_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and ExcROvfAndInReg_uid502_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b and ExcROvfAndInReg_uid502_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c;

	--ld_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a(DELAY,1223)@31
    ld_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,500)@32
    excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= ld_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q;
    excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--ld_excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c(DELAY,1234)@32
    ld_excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2(REG,664)@31
    reg_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q <= exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,499)@32
    excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= reg_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q;
    excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= exc_I_uid455_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--ld_excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b(DELAY,1233)@32
    ld_excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,498)@32
    excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= ld_exc_I_uid439_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q;
    excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= exc_I_uid455_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--ld_excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a(DELAY,1232)@32
    ld_excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,502)@37
    excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= ld_excXIAndExcYI_uid499_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q;
    excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= ld_excXRAndExcYI_uid500_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_q;
    excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c <= ld_excYRAndExcXI_uid501_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c_q;
    excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_d <= ExcROvfAndInReg_uid502_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a or excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b or excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c or excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_d;

	--expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest(COMPARE,490)@37
    expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_cin <= GND_q;
    expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR('0' & "000000000000" & GND_q) & '0';
    expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR((13 downto 12 => reg_expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q(11)) & reg_expRPreExcExt_uid488_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q) & expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_cin(0);
            expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a) - SIGNED(expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b));
    expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_n(0) <= not expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_o(14);


	--excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,496)@37
    excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= ld_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q;
    excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= ld_exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_q;
    excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c <= expUdf_uid491_arcsinL_uid87_acosX_uid8_fpArccosPiTest_n;
    excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b and excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c;

	--excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,495)@32
    excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= reg_expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q;
    excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= reg_exc_R_uid445_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q;
    excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--ld_excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c(DELAY,1221)@32
    ld_excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,494)@32
    excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= ld_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q;
    excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= exc_R_uid461_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--ld_excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b(DELAY,1220)@32
    ld_excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1(REG,658)@19
    reg_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q <= expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a(DELAY,1210)@20
    ld_reg_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => reg_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q, xout => ld_reg_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,493)@32
    excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= ld_reg_expXIsZero_uid434_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_1_q_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q;
    excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= reg_expXIsZero_uid450_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_2_q;
    excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a and excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;

	--ld_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a(DELAY,1219)@32
    ld_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOGICAL,497)@37
    excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a <= ld_excXZAndExcYZ_uid494_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a_q;
    excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= ld_excXZAndExcYR_uid495_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b_q;
    excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c <= ld_excYZAndExcXR_uid496_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c_q;
    excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_d <= excZC3_uid497_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_a or excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b or excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c or excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_d;

	--concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITJOIN,507)@37
    concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= ld_excRNaN_uid507_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c_q & excRInf_uid503_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q & excRZero_uid498_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;

	--reg_concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0(REG,676)@37
    reg_concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q <= concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest(LOOKUP,508)@38
    excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest: PROCESS (reg_concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_concExc_uid508_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_q) IS
                WHEN "000" =>  excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "01";
                WHEN "001" =>  excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "00";
                WHEN "010" =>  excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "10";
                WHEN "011" =>  excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "00";
                WHEN "100" =>  excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "11";
                WHEN "101" =>  excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "00";
                WHEN "110" =>  excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "00";
                WHEN "111" =>  excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest(MUX,517)@38
    expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s <= excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest: PROCESS (expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s, en, cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q, reg_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q, cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q, cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q;
                  WHEN "01" => expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= reg_expRPreExc_uid489_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q;
                  WHEN "10" => expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q;
                  WHEN "11" => expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITSELECT,486)@36
    fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in <= expFracRPostRounding_uid486_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q(23 downto 0);
    fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b <= fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_in(23 downto 1);

	--reg_fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3(REG,677)@36
    reg_fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q <= fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_d(DELAY,1250)@37
    ld_reg_fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_d : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => reg_fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q, xout => ld_reg_fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest(MUX,512)@38
    fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s <= excREnc_uid509_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;
    fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest: PROCESS (fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s, en, cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q, ld_reg_fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_d_q, cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q, cstNaNWF_uid20_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
                  WHEN "01" => fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= ld_reg_fracRPreExc_uid487_arcsinL_uid87_acosX_uid8_fpArccosPiTest_0_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_3_q_to_fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_d_q;
                  WHEN "10" => fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
                  WHEN "11" => fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= cstNaNWF_uid20_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest(BITJOIN,520)@38
    R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q <= ld_signRPostExc_uid520_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_c_q & expRPostExc_uid518_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q & fracRPostExc_uid513_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q;

	--ArcsinL22dto0_uid88_acosX_uid8_fpArccosPiTest(BITSELECT,87)@38
    ArcsinL22dto0_uid88_acosX_uid8_fpArccosPiTest_in <= R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q(22 downto 0);
    ArcsinL22dto0_uid88_acosX_uid8_fpArccosPiTest_b <= ArcsinL22dto0_uid88_acosX_uid8_fpArccosPiTest_in(22 downto 0);

	--oFracArcsinL_uid89_acosX_uid8_fpArccosPiTest(BITJOIN,88)@38
    oFracArcsinL_uid89_acosX_uid8_fpArccosPiTest_q <= VCC_q & ArcsinL22dto0_uid88_acosX_uid8_fpArccosPiTest_b;

	--X23dto16_uid527_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITSELECT,526)@38
    X23dto16_uid527_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in <= oFracArcsinL_uid89_acosX_uid8_fpArccosPiTest_q;
    X23dto16_uid527_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b <= X23dto16_uid527_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in(23 downto 16);

	--rightShiftStage0Idx2_uid529_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITJOIN,528)@38
    rightShiftStage0Idx2_uid529_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= rightShiftStage0Idx1Pad16_uid246_fxpX_uid59_acosX_uid8_fpArccosPiTest_q & X23dto16_uid527_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b;

	--reg_rightShiftStage0Idx2_uid529_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_4(REG,683)@38
    reg_rightShiftStage0Idx2_uid529_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx2_uid529_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_4_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx2_uid529_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_4_q <= rightShiftStage0Idx2_uid529_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--X23dto8_uid524_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITSELECT,523)@38
    X23dto8_uid524_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in <= oFracArcsinL_uid89_acosX_uid8_fpArccosPiTest_q;
    X23dto8_uid524_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b <= X23dto8_uid524_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in(23 downto 8);

	--rightShiftStage0Idx1_uid526_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITJOIN,525)@38
    rightShiftStage0Idx1_uid526_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q & X23dto8_uid524_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b;

	--reg_rightShiftStage0Idx1_uid526_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_3(REG,682)@38
    reg_rightShiftStage0Idx1_uid526_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx1_uid526_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_3_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx1_uid526_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_3_q <= rightShiftStage0Idx1_uid526_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_oFracArcsinL_uid89_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_2(REG,681)@38
    reg_oFracArcsinL_uid89_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracArcsinL_uid89_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_2_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracArcsinL_uid89_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_2_q <= oFracArcsinL_uid89_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ArcsinL30dto23_uid90_acosX_uid8_fpArccosPiTest(BITSELECT,89)@38
    ArcsinL30dto23_uid90_acosX_uid8_fpArccosPiTest_in <= R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q(30 downto 0);
    ArcsinL30dto23_uid90_acosX_uid8_fpArccosPiTest_b <= ArcsinL30dto23_uid90_acosX_uid8_fpArccosPiTest_in(30 downto 23);

	--srValArcsinL_uid91_acosX_uid8_fpArccosPiTest(SUB,90)@38
    srValArcsinL_uid91_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR("0" & cstBias_uid22_acosX_uid8_fpArccosPiTest_q);
    srValArcsinL_uid91_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR("0" & ArcsinL30dto23_uid90_acosX_uid8_fpArccosPiTest_b);
            srValArcsinL_uid91_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(srValArcsinL_uid91_acosX_uid8_fpArccosPiTest_a) - UNSIGNED(srValArcsinL_uid91_acosX_uid8_fpArccosPiTest_b));
    srValArcsinL_uid91_acosX_uid8_fpArccosPiTest_q <= srValArcsinL_uid91_acosX_uid8_fpArccosPiTest_o(8 downto 0);


	--srValArcsinLRange_uid92_acosX_uid8_fpArccosPiTest(BITSELECT,91)@38
    srValArcsinLRange_uid92_acosX_uid8_fpArccosPiTest_in <= srValArcsinL_uid91_acosX_uid8_fpArccosPiTest_q(4 downto 0);
    srValArcsinLRange_uid92_acosX_uid8_fpArccosPiTest_b <= srValArcsinLRange_uid92_acosX_uid8_fpArccosPiTest_in(4 downto 0);

	--rightShiftStageSel4Dto3_uid531_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITSELECT,530)@38
    rightShiftStageSel4Dto3_uid531_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in <= srValArcsinLRange_uid92_acosX_uid8_fpArccosPiTest_b;
    rightShiftStageSel4Dto3_uid531_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b <= rightShiftStageSel4Dto3_uid531_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in(4 downto 3);

	--reg_rightShiftStageSel4Dto3_uid531_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1(REG,680)@38
    reg_rightShiftStageSel4Dto3_uid531_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel4Dto3_uid531_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel4Dto3_uid531_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1_q <= rightShiftStageSel4Dto3_uid531_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(MUX,531)@39
    rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_s <= reg_rightShiftStageSel4Dto3_uid531_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1_q;
    rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest: PROCESS (rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_s, en, reg_oFracArcsinL_uid89_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_2_q, reg_rightShiftStage0Idx1_uid526_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_3_q, reg_rightShiftStage0Idx2_uid529_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_4_q, rightShiftStage0Idx3_uid386_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= reg_oFracArcsinL_uid89_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_2_q;
                  WHEN "01" => rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= reg_rightShiftStage0Idx1_uid526_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_3_q;
                  WHEN "10" => rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= reg_rightShiftStage0Idx2_uid529_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_4_q;
                  WHEN "11" => rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= rightShiftStage0Idx3_uid386_alignSqrt_uid78_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid542_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITSELECT,541)@38
    rightShiftStageSel2Dto1_uid542_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in <= srValArcsinLRange_uid92_acosX_uid8_fpArccosPiTest_b(2 downto 0);
    rightShiftStageSel2Dto1_uid542_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b <= rightShiftStageSel2Dto1_uid542_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in(2 downto 1);

	--reg_rightShiftStageSel2Dto1_uid542_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1(REG,684)@38
    reg_rightShiftStageSel2Dto1_uid542_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid542_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid542_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1_q <= rightShiftStageSel2Dto1_uid542_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(MUX,542)@39
    rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_s <= reg_rightShiftStageSel2Dto1_uid542_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1_q;
    rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest: PROCESS (rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_s, en, rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q, rightShiftStage1Idx1_uid535_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q, rightShiftStage1Idx2_uid538_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q, rightShiftStage1Idx3_uid541_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= rightShiftStage0_uid532_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q;
                  WHEN "01" => rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= rightShiftStage1Idx1_uid535_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q;
                  WHEN "10" => rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= rightShiftStage1Idx2_uid538_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q;
                  WHEN "11" => rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= rightShiftStage1Idx3_uid541_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid547_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(BITSELECT,546)@38
    rightShiftStageSel0Dto0_uid547_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in <= srValArcsinLRange_uid92_acosX_uid8_fpArccosPiTest_b(0 downto 0);
    rightShiftStageSel0Dto0_uid547_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b <= rightShiftStageSel0Dto0_uid547_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_in(0 downto 0);

	--reg_rightShiftStageSel0Dto0_uid547_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1(REG,685)@38
    reg_rightShiftStageSel0Dto0_uid547_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid547_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid547_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1_q <= rightShiftStageSel0Dto0_uid547_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest(MUX,547)@39
    rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_s <= reg_rightShiftStageSel0Dto0_uid547_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_0_to_rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_1_q;
    rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest: PROCESS (rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_s, en, rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q, rightShiftStage2Idx1_uid546_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "0" => rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= rightShiftStage1_uid543_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q;
                  WHEN "1" => rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= rightShiftStage2Idx1_uid546_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--pad_fxpArcsinL_uid94_uid95_acosX_uid8_fpArccosPiTest(BITJOIN,94)@39
    pad_fxpArcsinL_uid94_uid95_acosX_uid8_fpArccosPiTest_q <= rightShiftStage2_uid548_alignArcsinL_uid93_acosX_uid8_fpArccosPiTest_q & STD_LOGIC_VECTOR((2 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_fxpArcsinL_uid94_uid95_acosX_uid8_fpArccosPiTest_0_to_path1NegCase_uid95_acosX_uid8_fpArccosPiTest_1(REG,686)@39
    reg_pad_fxpArcsinL_uid94_uid95_acosX_uid8_fpArccosPiTest_0_to_path1NegCase_uid95_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_fxpArcsinL_uid94_uid95_acosX_uid8_fpArccosPiTest_0_to_path1NegCase_uid95_acosX_uid8_fpArccosPiTest_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_fxpArcsinL_uid94_uid95_acosX_uid8_fpArccosPiTest_0_to_path1NegCase_uid95_acosX_uid8_fpArccosPiTest_1_q <= pad_fxpArcsinL_uid94_uid95_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--pi_uid94_acosX_uid8_fpArccosPiTest(CONSTANT,93)
    pi_uid94_acosX_uid8_fpArccosPiTest_q <= "1100100100001111110110101010";

	--path1NegCase_uid95_acosX_uid8_fpArccosPiTest(SUB,95)@40
    path1NegCase_uid95_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR("0" & pi_uid94_acosX_uid8_fpArccosPiTest_q);
    path1NegCase_uid95_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR("00" & reg_pad_fxpArcsinL_uid94_uid95_acosX_uid8_fpArccosPiTest_0_to_path1NegCase_uid95_acosX_uid8_fpArccosPiTest_1_q);
            path1NegCase_uid95_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path1NegCase_uid95_acosX_uid8_fpArccosPiTest_a) - UNSIGNED(path1NegCase_uid95_acosX_uid8_fpArccosPiTest_b));
    path1NegCase_uid95_acosX_uid8_fpArccosPiTest_q <= path1NegCase_uid95_acosX_uid8_fpArccosPiTest_o(28 downto 0);


	--path1NegCaseN_uid97_acosX_uid8_fpArccosPiTest(BITSELECT,96)@40
    path1NegCaseN_uid97_acosX_uid8_fpArccosPiTest_in <= path1NegCase_uid95_acosX_uid8_fpArccosPiTest_q(27 downto 0);
    path1NegCaseN_uid97_acosX_uid8_fpArccosPiTest_b <= path1NegCaseN_uid97_acosX_uid8_fpArccosPiTest_in(27 downto 27);

	--reg_path1NegCaseN_uid97_acosX_uid8_fpArccosPiTest_0_to_path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_1(REG,687)@40
    reg_path1NegCaseN_uid97_acosX_uid8_fpArccosPiTest_0_to_path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_path1NegCaseN_uid97_acosX_uid8_fpArccosPiTest_0_to_path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_path1NegCaseN_uid97_acosX_uid8_fpArccosPiTest_0_to_path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_1_q <= path1NegCaseN_uid97_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest(ADD,100)@41
    path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR("0" & cstBias_uid22_acosX_uid8_fpArccosPiTest_q);
    path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR("00000000" & reg_path1NegCaseN_uid97_acosX_uid8_fpArccosPiTest_0_to_path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_1_q);
            path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_a) + UNSIGNED(path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_b));
    path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_q <= path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_o(8 downto 0);


	--path1NegCaseExpRange_uid102_acosX_uid8_fpArccosPiTest(BITSELECT,101)@41
    path1NegCaseExpRange_uid102_acosX_uid8_fpArccosPiTest_in <= path1NegCaseExp_uid101_acosX_uid8_fpArccosPiTest_q(7 downto 0);
    path1NegCaseExpRange_uid102_acosX_uid8_fpArccosPiTest_b <= path1NegCaseExpRange_uid102_acosX_uid8_fpArccosPiTest_in(7 downto 0);

	--path1NegCaseFracHigh_uid98_acosX_uid8_fpArccosPiTest(BITSELECT,97)@40
    path1NegCaseFracHigh_uid98_acosX_uid8_fpArccosPiTest_in <= path1NegCase_uid95_acosX_uid8_fpArccosPiTest_q(26 downto 0);
    path1NegCaseFracHigh_uid98_acosX_uid8_fpArccosPiTest_b <= path1NegCaseFracHigh_uid98_acosX_uid8_fpArccosPiTest_in(26 downto 4);

	--path1NegCaseFracLow_uid99_acosX_uid8_fpArccosPiTest(BITSELECT,98)@40
    path1NegCaseFracLow_uid99_acosX_uid8_fpArccosPiTest_in <= path1NegCase_uid95_acosX_uid8_fpArccosPiTest_q(25 downto 0);
    path1NegCaseFracLow_uid99_acosX_uid8_fpArccosPiTest_b <= path1NegCaseFracLow_uid99_acosX_uid8_fpArccosPiTest_in(25 downto 3);

	--path1NegCaseFrac_uid100_acosX_uid8_fpArccosPiTest(MUX,99)@40
    path1NegCaseFrac_uid100_acosX_uid8_fpArccosPiTest_s <= path1NegCaseN_uid97_acosX_uid8_fpArccosPiTest_b;
    path1NegCaseFrac_uid100_acosX_uid8_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            path1NegCaseFrac_uid100_acosX_uid8_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE path1NegCaseFrac_uid100_acosX_uid8_fpArccosPiTest_s IS
                      WHEN "0" => path1NegCaseFrac_uid100_acosX_uid8_fpArccosPiTest_q <= path1NegCaseFracLow_uid99_acosX_uid8_fpArccosPiTest_b;
                      WHEN "1" => path1NegCaseFrac_uid100_acosX_uid8_fpArccosPiTest_q <= path1NegCaseFracHigh_uid98_acosX_uid8_fpArccosPiTest_b;
                      WHEN OTHERS => path1NegCaseFrac_uid100_acosX_uid8_fpArccosPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--path1NegCaseUR_uid103_acosX_uid8_fpArccosPiTest(BITJOIN,102)@41
    path1NegCaseUR_uid103_acosX_uid8_fpArccosPiTest_q <= GND_q & path1NegCaseExpRange_uid102_acosX_uid8_fpArccosPiTest_b & path1NegCaseFrac_uid100_acosX_uid8_fpArccosPiTest_q;

	--ld_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_c_inputreg(DELAY,1461)
    ld_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q, xout => ld_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_c(DELAY,790)@38
    ld_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_c : dspba_delay
    GENERIC MAP ( width => 32, depth => 2 )
    PORT MAP ( xin => ld_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_c_inputreg_q, xout => ld_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_nor(LOGICAL,1458)
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_nor_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q;
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_nor_b <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_sticky_ena_q;
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_nor_q <= not (ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_nor_a or ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_nor_b);

	--ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_mem_top(CONSTANT,1454)
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_mem_top_q <= "0100111";

	--ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmp(LOGICAL,1455)
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmp_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_mem_top_q;
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdmux_q);
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmp_q <= "1" when ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmp_a = ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmp_b else "0";

	--ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmpReg(REG,1456)
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmpReg_q <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_sticky_ena(REG,1459)
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_nor_q = "1") THEN
                ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_sticky_ena_q <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_enaAnd(LOGICAL,1460)
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_enaAnd_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_sticky_ena_q;
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_enaAnd_b <= en;
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_enaAnd_q <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_enaAnd_a and ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_enaAnd_b;

	--ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt(COUNTER,1450)
    -- every=1, low=0, high=39, step=1, init=1
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i = 38 THEN
                      ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_eq = '1') THEN
                        ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i - 39;
                    ELSE
                        ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_i,6));


	--ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdreg(REG,1451)
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdreg_q <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdmux(MUX,1452)
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdmux_s <= en;
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdmux: PROCESS (ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdmux_s, ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdreg_q, ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdmux_q <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdmux_q <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem(DUALMEM,1449)
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_reset0 <= areset;
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_ia <= singX_uid17_acosX_uid8_fpArccosPiTest_b;
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_aa <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdreg_q;
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_ab <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_rdmux_q;
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 40,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 40,
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
        clocken1 => ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_iq,
        address_a => ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_aa,
        data_a => ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_ia
    );
        ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_q <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_iq(0 downto 0);

	--path1ResFP_uid105_acosX_uid8_fpArccosPiTest(MUX,104)@41
    path1ResFP_uid105_acosX_uid8_fpArccosPiTest_s <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_replace_mem_q;
    path1ResFP_uid105_acosX_uid8_fpArccosPiTest: PROCESS (path1ResFP_uid105_acosX_uid8_fpArccosPiTest_s, en, ld_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_c_q, path1NegCaseUR_uid103_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE path1ResFP_uid105_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "0" => path1ResFP_uid105_acosX_uid8_fpArccosPiTest_q <= ld_R_uid521_arcsinL_uid87_acosX_uid8_fpArccosPiTest_q_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_c_q;
                  WHEN "1" => path1ResFP_uid105_acosX_uid8_fpArccosPiTest_q <= path1NegCaseUR_uid103_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => path1ResFP_uid105_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--Path1ResFP30dto23_uid133_acosX_uid8_fpArccosPiTest(BITSELECT,132)@41
    Path1ResFP30dto23_uid133_acosX_uid8_fpArccosPiTest_in <= path1ResFP_uid105_acosX_uid8_fpArccosPiTest_q(30 downto 0);
    Path1ResFP30dto23_uid133_acosX_uid8_fpArccosPiTest_b <= Path1ResFP30dto23_uid133_acosX_uid8_fpArccosPiTest_in(30 downto 23);

	--reg_Path1ResFP30dto23_uid133_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_2(REG,699)@41
    reg_Path1ResFP30dto23_uid133_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_Path1ResFP30dto23_uid133_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_Path1ResFP30dto23_uid133_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_2_q <= Path1ResFP30dto23_uid133_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_nor(LOGICAL,1472)
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_nor_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q;
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_nor_b <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_sticky_ena_q;
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_nor_q <= not (ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_nor_a or ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_nor_b);

	--ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_mem_top(CONSTANT,1468)
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_mem_top_q <= "0100101";

	--ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmp(LOGICAL,1469)
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmp_a <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_mem_top_q;
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdmux_q);
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmp_q <= "1" when ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmp_a = ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmp_b else "0";

	--ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmpReg(REG,1470)
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmpReg_q <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_sticky_ena(REG,1473)
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_nor_q = "1") THEN
                ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_sticky_ena_q <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_enaAnd(LOGICAL,1474)
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_enaAnd_a <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_sticky_ena_q;
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_enaAnd_b <= en;
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_enaAnd_q <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_enaAnd_a and ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_enaAnd_b;

	--ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_c(DELAY,812)@0
    ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => singX_uid17_acosX_uid8_fpArccosPiTest_b, xout => ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--inputIsMax_uid60_acosX_uid8_fpArccosPiTest(BITSELECT,59)@1
    inputIsMax_uid60_acosX_uid8_fpArccosPiTest_in <= rightShiftStage2_uid275_fxpX_uid59_acosX_uid8_fpArccosPiTest_q;
    inputIsMax_uid60_acosX_uid8_fpArccosPiTest_b <= inputIsMax_uid60_acosX_uid8_fpArccosPiTest_in(36 downto 36);

	--firstPath_uid62_acosX_uid8_fpArccosPiTest(BITSELECT,61)@1
    firstPath_uid62_acosX_uid8_fpArccosPiTest_in <= y_uid61_acosX_uid8_fpArccosPiTest_b;
    firstPath_uid62_acosX_uid8_fpArccosPiTest_b <= firstPath_uid62_acosX_uid8_fpArccosPiTest_in(34 downto 34);

	--pathSelBits_uid126_acosX_uid8_fpArccosPiTest(BITJOIN,125)@1
    pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_c_q & inputIsMax_uid60_acosX_uid8_fpArccosPiTest_b & firstPath_uid62_acosX_uid8_fpArccosPiTest_b;

	--ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_inputreg(DELAY,1462)
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q, xout => ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt(COUNTER,1464)
    -- every=1, low=0, high=37, step=1, init=1
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i = 36 THEN
                      ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_eq = '1') THEN
                        ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i - 37;
                    ELSE
                        ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_i,6));


	--ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdreg(REG,1465)
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdreg_q <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdmux(MUX,1466)
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdmux_s <= en;
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdmux: PROCESS (ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdmux_s, ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdreg_q, ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdmux_q <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdmux_q <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem(DUALMEM,1463)
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_reset0 <= areset;
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_ia <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_inputreg_q;
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_aa <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdreg_q;
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_ab <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdmux_q;
    ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 6,
        numwords_a => 38,
        width_b => 3,
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
        clocken1 => ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_iq,
        address_a => ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_aa,
        data_a => ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_ia
    );
        ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_q <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_iq(2 downto 0);

	--fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest(LOOKUP,126)@41
    fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            CASE (ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_mem_q) IS
                WHEN "000" =>  fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_q <= "01";
                WHEN "001" =>  fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_q <= "00";
                WHEN "010" =>  fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_q <= "11";
                WHEN "011" =>  fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_q <= "11";
                WHEN "100" =>  fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_q <= "01";
                WHEN "101" =>  fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_q <= "00";
                WHEN "110" =>  fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_q <= "10";
                WHEN "111" =>  fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_q <= "10";
                WHEN OTHERS =>
                    fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--expRCalc_uid134_acosX_uid8_fpArccosPiTest(MUX,133)@42
    expRCalc_uid134_acosX_uid8_fpArccosPiTest_s <= fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_q;
    expRCalc_uid134_acosX_uid8_fpArccosPiTest: PROCESS (expRCalc_uid134_acosX_uid8_fpArccosPiTest_s, en, reg_Path1ResFP30dto23_uid133_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_2_q, reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_q, cstBiasP1_uid26_acosX_uid8_fpArccosPiTest_q, cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE expRCalc_uid134_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => expRCalc_uid134_acosX_uid8_fpArccosPiTest_q <= reg_Path1ResFP30dto23_uid133_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_2_q;
                  WHEN "01" => expRCalc_uid134_acosX_uid8_fpArccosPiTest_q <= reg_Path2ResFP30dto23_uid132_acosX_uid8_fpArccosPiTest_0_to_expRCalc_uid134_acosX_uid8_fpArccosPiTest_3_q;
                  WHEN "10" => expRCalc_uid134_acosX_uid8_fpArccosPiTest_q <= cstBiasP1_uid26_acosX_uid8_fpArccosPiTest_q;
                  WHEN "11" => expRCalc_uid134_acosX_uid8_fpArccosPiTest_q <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => expRCalc_uid134_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--cstAllZWE_uid21_acosX_uid8_fpArccosPiTest(CONSTANT,20)
    cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q <= "00000000";

	--ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_nor(LOGICAL,1485)
    ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_nor_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q;
    ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_nor_b <= ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_sticky_ena_q;
    ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_nor_q <= not (ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_nor_a or ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_nor_b);

	--ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_sticky_ena(REG,1486)
    ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_nor_q = "1") THEN
                ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_sticky_ena_q <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_enaAnd(LOGICAL,1487)
    ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_enaAnd_a <= ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_sticky_ena_q;
    ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_enaAnd_b <= en;
    ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_enaAnd_q <= ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_enaAnd_a and ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_enaAnd_b;

	--fracXIsZero_uid47_acosX_uid8_fpArccosPiTest(LOGICAL,46)@0
    fracXIsZero_uid47_acosX_uid8_fpArccosPiTest_a <= fracX_uid16_acosX_uid8_fpArccosPiTest_b;
    fracXIsZero_uid47_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR("0000000000000000000000" & GND_q);
    fracXIsZero_uid47_acosX_uid8_fpArccosPiTest_q <= "1" when fracXIsZero_uid47_acosX_uid8_fpArccosPiTest_a = fracXIsZero_uid47_acosX_uid8_fpArccosPiTest_b else "0";

	--InvFracXIsZero_uid48_acosX_uid8_fpArccosPiTest(LOGICAL,47)@0
    InvFracXIsZero_uid48_acosX_uid8_fpArccosPiTest_a <= fracXIsZero_uid47_acosX_uid8_fpArccosPiTest_q;
    InvFracXIsZero_uid48_acosX_uid8_fpArccosPiTest_q <= not InvFracXIsZero_uid48_acosX_uid8_fpArccosPiTest_a;

	--expEQ0_uid46_acosX_uid8_fpArccosPiTest(LOGICAL,45)@0
    expEQ0_uid46_acosX_uid8_fpArccosPiTest_a <= expX_uid15_acosX_uid8_fpArccosPiTest_b;
    expEQ0_uid46_acosX_uid8_fpArccosPiTest_b <= cstBias_uid22_acosX_uid8_fpArccosPiTest_q;
    expEQ0_uid46_acosX_uid8_fpArccosPiTest_q <= "1" when expEQ0_uid46_acosX_uid8_fpArccosPiTest_a = expEQ0_uid46_acosX_uid8_fpArccosPiTest_b else "0";

	--expXZFracNotZero_uid49_acosX_uid8_fpArccosPiTest(LOGICAL,48)@0
    expXZFracNotZero_uid49_acosX_uid8_fpArccosPiTest_a <= expEQ0_uid46_acosX_uid8_fpArccosPiTest_q;
    expXZFracNotZero_uid49_acosX_uid8_fpArccosPiTest_b <= InvFracXIsZero_uid48_acosX_uid8_fpArccosPiTest_q;
    expXZFracNotZero_uid49_acosX_uid8_fpArccosPiTest_q <= expXZFracNotZero_uid49_acosX_uid8_fpArccosPiTest_a and expXZFracNotZero_uid49_acosX_uid8_fpArccosPiTest_b;

	--expGT0_uid45_acosX_uid8_fpArccosPiTest(COMPARE,44)@0
    expGT0_uid45_acosX_uid8_fpArccosPiTest_cin <= GND_q;
    expGT0_uid45_acosX_uid8_fpArccosPiTest_a <= STD_LOGIC_VECTOR("00" & cstBias_uid22_acosX_uid8_fpArccosPiTest_q) & '0';
    expGT0_uid45_acosX_uid8_fpArccosPiTest_b <= STD_LOGIC_VECTOR("00" & expX_uid15_acosX_uid8_fpArccosPiTest_b) & expGT0_uid45_acosX_uid8_fpArccosPiTest_cin(0);
            expGT0_uid45_acosX_uid8_fpArccosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expGT0_uid45_acosX_uid8_fpArccosPiTest_a) - UNSIGNED(expGT0_uid45_acosX_uid8_fpArccosPiTest_b));
    expGT0_uid45_acosX_uid8_fpArccosPiTest_c(0) <= expGT0_uid45_acosX_uid8_fpArccosPiTest_o(10);


	--inputOutOfRange_uid50_acosX_uid8_fpArccosPiTest(LOGICAL,49)@0
    inputOutOfRange_uid50_acosX_uid8_fpArccosPiTest_a <= expGT0_uid45_acosX_uid8_fpArccosPiTest_c;
    inputOutOfRange_uid50_acosX_uid8_fpArccosPiTest_b <= expXZFracNotZero_uid49_acosX_uid8_fpArccosPiTest_q;
    inputOutOfRange_uid50_acosX_uid8_fpArccosPiTest_q <= inputOutOfRange_uid50_acosX_uid8_fpArccosPiTest_a or inputOutOfRange_uid50_acosX_uid8_fpArccosPiTest_b;

	--InvExc_N_uid41_acosX_uid8_fpArccosPiTest(LOGICAL,40)@0
    InvExc_N_uid41_acosX_uid8_fpArccosPiTest_a <= exc_N_uid40_acosX_uid8_fpArccosPiTest_q;
    InvExc_N_uid41_acosX_uid8_fpArccosPiTest_q <= not InvExc_N_uid41_acosX_uid8_fpArccosPiTest_a;

	--InvExc_I_uid42_acosX_uid8_fpArccosPiTest(LOGICAL,41)@0
    InvExc_I_uid42_acosX_uid8_fpArccosPiTest_a <= exc_I_uid38_acosX_uid8_fpArccosPiTest_q;
    InvExc_I_uid42_acosX_uid8_fpArccosPiTest_q <= not InvExc_I_uid42_acosX_uid8_fpArccosPiTest_a;

	--expXIsZero_uid33_acosX_uid8_fpArccosPiTest(LOGICAL,32)@0
    expXIsZero_uid33_acosX_uid8_fpArccosPiTest_a <= expX_uid15_acosX_uid8_fpArccosPiTest_b;
    expXIsZero_uid33_acosX_uid8_fpArccosPiTest_b <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q;
    expXIsZero_uid33_acosX_uid8_fpArccosPiTest_q <= "1" when expXIsZero_uid33_acosX_uid8_fpArccosPiTest_a = expXIsZero_uid33_acosX_uid8_fpArccosPiTest_b else "0";

	--InvExpXIsZero_uid43_acosX_uid8_fpArccosPiTest(LOGICAL,42)@0
    InvExpXIsZero_uid43_acosX_uid8_fpArccosPiTest_a <= expXIsZero_uid33_acosX_uid8_fpArccosPiTest_q;
    InvExpXIsZero_uid43_acosX_uid8_fpArccosPiTest_q <= not InvExpXIsZero_uid43_acosX_uid8_fpArccosPiTest_a;

	--exc_R_uid44_acosX_uid8_fpArccosPiTest(LOGICAL,43)@0
    exc_R_uid44_acosX_uid8_fpArccosPiTest_a <= InvExpXIsZero_uid43_acosX_uid8_fpArccosPiTest_q;
    exc_R_uid44_acosX_uid8_fpArccosPiTest_b <= InvExc_I_uid42_acosX_uid8_fpArccosPiTest_q;
    exc_R_uid44_acosX_uid8_fpArccosPiTest_c <= InvExc_N_uid41_acosX_uid8_fpArccosPiTest_q;
    exc_R_uid44_acosX_uid8_fpArccosPiTest_q <= exc_R_uid44_acosX_uid8_fpArccosPiTest_a and exc_R_uid44_acosX_uid8_fpArccosPiTest_b and exc_R_uid44_acosX_uid8_fpArccosPiTest_c;

	--xRegAndOutOfRange_uid135_acosX_uid8_fpArccosPiTest(LOGICAL,134)@0
    xRegAndOutOfRange_uid135_acosX_uid8_fpArccosPiTest_a <= exc_R_uid44_acosX_uid8_fpArccosPiTest_q;
    xRegAndOutOfRange_uid135_acosX_uid8_fpArccosPiTest_b <= inputOutOfRange_uid50_acosX_uid8_fpArccosPiTest_q;
    xRegAndOutOfRange_uid135_acosX_uid8_fpArccosPiTest_q <= xRegAndOutOfRange_uid135_acosX_uid8_fpArccosPiTest_a and xRegAndOutOfRange_uid135_acosX_uid8_fpArccosPiTest_b;

	--fracXIsZero_uid37_acosX_uid8_fpArccosPiTest(LOGICAL,36)@0
    fracXIsZero_uid37_acosX_uid8_fpArccosPiTest_a <= fracX_uid16_acosX_uid8_fpArccosPiTest_b;
    fracXIsZero_uid37_acosX_uid8_fpArccosPiTest_b <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
    fracXIsZero_uid37_acosX_uid8_fpArccosPiTest_q <= "1" when fracXIsZero_uid37_acosX_uid8_fpArccosPiTest_a = fracXIsZero_uid37_acosX_uid8_fpArccosPiTest_b else "0";

	--expXIsMax_uid35_acosX_uid8_fpArccosPiTest(LOGICAL,34)@0
    expXIsMax_uid35_acosX_uid8_fpArccosPiTest_a <= expX_uid15_acosX_uid8_fpArccosPiTest_b;
    expXIsMax_uid35_acosX_uid8_fpArccosPiTest_b <= cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q;
    expXIsMax_uid35_acosX_uid8_fpArccosPiTest_q <= "1" when expXIsMax_uid35_acosX_uid8_fpArccosPiTest_a = expXIsMax_uid35_acosX_uid8_fpArccosPiTest_b else "0";

	--exc_I_uid38_acosX_uid8_fpArccosPiTest(LOGICAL,37)@0
    exc_I_uid38_acosX_uid8_fpArccosPiTest_a <= expXIsMax_uid35_acosX_uid8_fpArccosPiTest_q;
    exc_I_uid38_acosX_uid8_fpArccosPiTest_b <= fracXIsZero_uid37_acosX_uid8_fpArccosPiTest_q;
    exc_I_uid38_acosX_uid8_fpArccosPiTest_q <= exc_I_uid38_acosX_uid8_fpArccosPiTest_a and exc_I_uid38_acosX_uid8_fpArccosPiTest_b;

	--InvFracXIsZero_uid39_acosX_uid8_fpArccosPiTest(LOGICAL,38)@0
    InvFracXIsZero_uid39_acosX_uid8_fpArccosPiTest_a <= fracXIsZero_uid37_acosX_uid8_fpArccosPiTest_q;
    InvFracXIsZero_uid39_acosX_uid8_fpArccosPiTest_q <= not InvFracXIsZero_uid39_acosX_uid8_fpArccosPiTest_a;

	--exc_N_uid40_acosX_uid8_fpArccosPiTest(LOGICAL,39)@0
    exc_N_uid40_acosX_uid8_fpArccosPiTest_a <= expXIsMax_uid35_acosX_uid8_fpArccosPiTest_q;
    exc_N_uid40_acosX_uid8_fpArccosPiTest_b <= InvFracXIsZero_uid39_acosX_uid8_fpArccosPiTest_q;
    exc_N_uid40_acosX_uid8_fpArccosPiTest_q <= exc_N_uid40_acosX_uid8_fpArccosPiTest_a and exc_N_uid40_acosX_uid8_fpArccosPiTest_b;

	--excRNaN_uid136_acosX_uid8_fpArccosPiTest(LOGICAL,135)@0
    excRNaN_uid136_acosX_uid8_fpArccosPiTest_a <= exc_N_uid40_acosX_uid8_fpArccosPiTest_q;
    excRNaN_uid136_acosX_uid8_fpArccosPiTest_b <= exc_I_uid38_acosX_uid8_fpArccosPiTest_q;
    excRNaN_uid136_acosX_uid8_fpArccosPiTest_c <= xRegAndOutOfRange_uid135_acosX_uid8_fpArccosPiTest_q;
    excRNaN_uid136_acosX_uid8_fpArccosPiTest_q <= excRNaN_uid136_acosX_uid8_fpArccosPiTest_a or excRNaN_uid136_acosX_uid8_fpArccosPiTest_b or excRNaN_uid136_acosX_uid8_fpArccosPiTest_c;

	--ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_inputreg(DELAY,1475)
    ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => excRNaN_uid136_acosX_uid8_fpArccosPiTest_q, xout => ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem(DUALMEM,1476)
    ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_reset0 <= areset;
    ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_ia <= ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_inputreg_q;
    ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_aa <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdreg_q;
    ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_ab <= ld_pathSelBits_uid126_acosX_uid8_fpArccosPiTest_q_to_fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_a_replace_rdmux_q;
    ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_dmem : altsyncram
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
        clocken1 => ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_iq,
        address_a => ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_aa,
        data_a => ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_ia
    );
        ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_q <= ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_iq(0 downto 0);

	--excSelBits_uid137_acosX_uid8_fpArccosPiTest(BITJOIN,136)@40
    excSelBits_uid137_acosX_uid8_fpArccosPiTest_q <= ld_excRNaN_uid136_acosX_uid8_fpArccosPiTest_q_to_excSelBits_uid137_acosX_uid8_fpArccosPiTest_c_replace_mem_q & GND_q & GND_q;

	--reg_excSelBits_uid137_acosX_uid8_fpArccosPiTest_0_to_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_0(REG,608)@40
    reg_excSelBits_uid137_acosX_uid8_fpArccosPiTest_0_to_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excSelBits_uid137_acosX_uid8_fpArccosPiTest_0_to_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excSelBits_uid137_acosX_uid8_fpArccosPiTest_0_to_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_0_q <= excSelBits_uid137_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest(LOOKUP,137)@41
    outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest: PROCESS (reg_excSelBits_uid137_acosX_uid8_fpArccosPiTest_0_to_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_excSelBits_uid137_acosX_uid8_fpArccosPiTest_0_to_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_0_q) IS
                WHEN "000" =>  outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q <= "01";
                WHEN "001" =>  outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q <= "00";
                WHEN "010" =>  outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q <= "10";
                WHEN "011" =>  outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q <= "01";
                WHEN "100" =>  outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q <= "11";
                WHEN "101" =>  outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q <= "01";
                WHEN "110" =>  outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q <= "01";
                WHEN "111" =>  outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q <= "01";
                WHEN OTHERS =>
                    outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--reg_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid140_acosX_uid8_fpArccosPiTest_1(REG,701)@41
    reg_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid140_acosX_uid8_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid140_acosX_uid8_fpArccosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid140_acosX_uid8_fpArccosPiTest_1_q <= outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expRPostExc_uid140_acosX_uid8_fpArccosPiTest(MUX,139)@42
    expRPostExc_uid140_acosX_uid8_fpArccosPiTest_s <= reg_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_0_to_expRPostExc_uid140_acosX_uid8_fpArccosPiTest_1_q;
    expRPostExc_uid140_acosX_uid8_fpArccosPiTest: PROCESS (expRPostExc_uid140_acosX_uid8_fpArccosPiTest_s, en, cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q, expRCalc_uid134_acosX_uid8_fpArccosPiTest_q, cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q, cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE expRPostExc_uid140_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => expRPostExc_uid140_acosX_uid8_fpArccosPiTest_q <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q;
                  WHEN "01" => expRPostExc_uid140_acosX_uid8_fpArccosPiTest_q <= expRCalc_uid134_acosX_uid8_fpArccosPiTest_q;
                  WHEN "10" => expRPostExc_uid140_acosX_uid8_fpArccosPiTest_q <= cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q;
                  WHEN "11" => expRPostExc_uid140_acosX_uid8_fpArccosPiTest_q <= cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => expRPostExc_uid140_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--piF_uid128_acosX_uid8_fpArccosPiTest(BITSELECT,127)@42
    piF_uid128_acosX_uid8_fpArccosPiTest_in <= pi_uid94_acosX_uid8_fpArccosPiTest_q(26 downto 0);
    piF_uid128_acosX_uid8_fpArccosPiTest_b <= piF_uid128_acosX_uid8_fpArccosPiTest_in(26 downto 4);

	--ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_nor(LOGICAL,1613)
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_nor_a <= ld_singX_uid17_acosX_uid8_fpArccosPiTest_b_to_path1ResFP_uid105_acosX_uid8_fpArccosPiTest_b_notEnable_q;
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_nor_b <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_sticky_ena_q;
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_nor_q <= not (ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_nor_a or ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_nor_b);

	--ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_sticky_ena(REG,1614)
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_nor_q = "1") THEN
                ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_sticky_ena_q <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_enaAnd(LOGICAL,1615)
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_enaAnd_a <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_sticky_ena_q;
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_enaAnd_b <= en;
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_enaAnd_q <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_enaAnd_a and ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_enaAnd_b;

	--Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest(BITSELECT,128)@13
    Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_in <= path2ResFP_uid125_acosX_uid8_fpArccosPiTest_q(22 downto 0);
    Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b <= Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_in(22 downto 0);

	--ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_inputreg(DELAY,1603)
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b, xout => ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem(DUALMEM,1604)
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_reset0 <= areset;
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_ia <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_inputreg_q;
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_aa <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdreg_q;
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_ab <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_rdmux_q;
    ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 5,
        numwords_a => 26,
        width_b => 23,
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
        clocken1 => ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_iq,
        address_a => ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_aa,
        data_a => ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_ia
    );
        ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_q <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_iq(22 downto 0);

	--reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3(REG,698)@41
    reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_q <= ld_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_b_to_reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--Path1ResFP22dto0_uid130_acosX_uid8_fpArccosPiTest(BITSELECT,129)@41
    Path1ResFP22dto0_uid130_acosX_uid8_fpArccosPiTest_in <= path1ResFP_uid105_acosX_uid8_fpArccosPiTest_q(22 downto 0);
    Path1ResFP22dto0_uid130_acosX_uid8_fpArccosPiTest_b <= Path1ResFP22dto0_uid130_acosX_uid8_fpArccosPiTest_in(22 downto 0);

	--reg_Path1ResFP22dto0_uid130_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_2(REG,697)@41
    reg_Path1ResFP22dto0_uid130_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_Path1ResFP22dto0_uid130_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_2_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_Path1ResFP22dto0_uid130_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_2_q <= Path1ResFP22dto0_uid130_acosX_uid8_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracRCalc_uid131_acosX_uid8_fpArccosPiTest(MUX,130)@42
    fracRCalc_uid131_acosX_uid8_fpArccosPiTest_s <= fracOutMuxSelEnc_uid127_acosX_uid8_fpArccosPiTest_q;
    fracRCalc_uid131_acosX_uid8_fpArccosPiTest: PROCESS (fracRCalc_uid131_acosX_uid8_fpArccosPiTest_s, en, reg_Path1ResFP22dto0_uid130_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_2_q, reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_q, piF_uid128_acosX_uid8_fpArccosPiTest_b, cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE fracRCalc_uid131_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => fracRCalc_uid131_acosX_uid8_fpArccosPiTest_q <= reg_Path1ResFP22dto0_uid130_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_2_q;
                  WHEN "01" => fracRCalc_uid131_acosX_uid8_fpArccosPiTest_q <= reg_Path2ResFP22dto0_uid129_acosX_uid8_fpArccosPiTest_0_to_fracRCalc_uid131_acosX_uid8_fpArccosPiTest_3_q;
                  WHEN "10" => fracRCalc_uid131_acosX_uid8_fpArccosPiTest_q <= piF_uid128_acosX_uid8_fpArccosPiTest_b;
                  WHEN "11" => fracRCalc_uid131_acosX_uid8_fpArccosPiTest_q <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => fracRCalc_uid131_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q_to_fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_b(DELAY,832)@41
    ld_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q_to_fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q, xout => ld_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q_to_fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid139_acosX_uid8_fpArccosPiTest(MUX,138)@42
    fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_s <= ld_outMuxSelEnc_uid138_acosX_uid8_fpArccosPiTest_q_to_fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_b_q;
    fracRPostExc_uid139_acosX_uid8_fpArccosPiTest: PROCESS (fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_s, en, cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q, fracRCalc_uid131_acosX_uid8_fpArccosPiTest_q, cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q, cstNaNWF_uid20_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_s IS
                  WHEN "00" => fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_q <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
                  WHEN "01" => fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_q <= fracRCalc_uid131_acosX_uid8_fpArccosPiTest_q;
                  WHEN "10" => fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_q <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
                  WHEN "11" => fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_q <= cstNaNWF_uid20_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sR_uid141_acosX_uid8_fpArccosPiTest(BITJOIN,140)@42
    sR_uid141_acosX_uid8_fpArccosPiTest_q <= GND_q & expRPostExc_uid140_acosX_uid8_fpArccosPiTest_q & fracRPostExc_uid139_acosX_uid8_fpArccosPiTest_q;

	--fracX_uid147_rAcosPi_uid13_fpArccosPiTest(BITSELECT,146)@42
    fracX_uid147_rAcosPi_uid13_fpArccosPiTest_in <= sR_uid141_acosX_uid8_fpArccosPiTest_q(22 downto 0);
    fracX_uid147_rAcosPi_uid13_fpArccosPiTest_b <= fracX_uid147_rAcosPi_uid13_fpArccosPiTest_in(22 downto 0);

	--fracXIsZero_uid159_rAcosPi_uid13_fpArccosPiTest(LOGICAL,158)@42
    fracXIsZero_uid159_rAcosPi_uid13_fpArccosPiTest_a <= fracX_uid147_rAcosPi_uid13_fpArccosPiTest_b;
    fracXIsZero_uid159_rAcosPi_uid13_fpArccosPiTest_b <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
    fracXIsZero_uid159_rAcosPi_uid13_fpArccosPiTest_q <= "1" when fracXIsZero_uid159_rAcosPi_uid13_fpArccosPiTest_a = fracXIsZero_uid159_rAcosPi_uid13_fpArccosPiTest_b else "0";

	--expX_uid143_rAcosPi_uid13_fpArccosPiTest(BITSELECT,142)@42
    expX_uid143_rAcosPi_uid13_fpArccosPiTest_in <= sR_uid141_acosX_uid8_fpArccosPiTest_q(30 downto 0);
    expX_uid143_rAcosPi_uid13_fpArccosPiTest_b <= expX_uid143_rAcosPi_uid13_fpArccosPiTest_in(30 downto 23);

	--expXIsMax_uid157_rAcosPi_uid13_fpArccosPiTest(LOGICAL,156)@42
    expXIsMax_uid157_rAcosPi_uid13_fpArccosPiTest_a <= expX_uid143_rAcosPi_uid13_fpArccosPiTest_b;
    expXIsMax_uid157_rAcosPi_uid13_fpArccosPiTest_b <= cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q;
    expXIsMax_uid157_rAcosPi_uid13_fpArccosPiTest_q <= "1" when expXIsMax_uid157_rAcosPi_uid13_fpArccosPiTest_a = expXIsMax_uid157_rAcosPi_uid13_fpArccosPiTest_b else "0";

	--exc_I_uid160_rAcosPi_uid13_fpArccosPiTest(LOGICAL,159)@42
    exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_a <= expXIsMax_uid157_rAcosPi_uid13_fpArccosPiTest_q;
    exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_b <= fracXIsZero_uid159_rAcosPi_uid13_fpArccosPiTest_q;
    exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_q <= exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_a and exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_b;

	--ld_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_q_to_reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_2_a(DELAY,1442)@42
    ld_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_q_to_reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_2_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_q, xout => ld_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_q_to_reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_2(REG,711)@43
    reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_2_q <= ld_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_q_to_reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_2_a_q;
            END IF;
        END IF;
    END PROCESS;


	--ooPi_uid9_fpArccosPiTest(CONSTANT,8)
    ooPi_uid9_fpArccosPiTest_q <= "101000101111100110000011";

	--fracOOPi_uid10_fpArccosPiTest(BITSELECT,9)@43
    fracOOPi_uid10_fpArccosPiTest_in <= ooPi_uid9_fpArccosPiTest_q(22 downto 0);
    fracOOPi_uid10_fpArccosPiTest_b <= fracOOPi_uid10_fpArccosPiTest_in(22 downto 0);

	--fpOOPi_uid11_fpArccosPiTest(BITJOIN,10)@43
    fpOOPi_uid11_fpArccosPiTest_q <= GND_q & cstBiasM2_uid6_fpArccosPiTest_q & fracOOPi_uid10_fpArccosPiTest_b;

	--expY_uid144_rAcosPi_uid13_fpArccosPiTest(BITSELECT,143)@43
    expY_uid144_rAcosPi_uid13_fpArccosPiTest_in <= fpOOPi_uid11_fpArccosPiTest_q(30 downto 0);
    expY_uid144_rAcosPi_uid13_fpArccosPiTest_b <= expY_uid144_rAcosPi_uid13_fpArccosPiTest_in(30 downto 23);

	--expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest(LOGICAL,170)@43
    expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_a <= expY_uid144_rAcosPi_uid13_fpArccosPiTest_b;
    expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_b <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q;
    expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_q <= "1" when expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_a = expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_b else "0";

	--reg_expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_1(REG,710)@43
    reg_expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_1_q <= expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest(LOGICAL,224)@44
    excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_a <= reg_expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_1_q;
    excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_b <= reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_2_q;
    excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_q <= excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_a and excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_b;

	--fracY_uid149_rAcosPi_uid13_fpArccosPiTest(BITSELECT,148)@43
    fracY_uid149_rAcosPi_uid13_fpArccosPiTest_in <= fpOOPi_uid11_fpArccosPiTest_q(22 downto 0);
    fracY_uid149_rAcosPi_uid13_fpArccosPiTest_b <= fracY_uid149_rAcosPi_uid13_fpArccosPiTest_in(22 downto 0);

	--fracXIsZero_uid175_rAcosPi_uid13_fpArccosPiTest(LOGICAL,174)@43
    fracXIsZero_uid175_rAcosPi_uid13_fpArccosPiTest_a <= fracY_uid149_rAcosPi_uid13_fpArccosPiTest_b;
    fracXIsZero_uid175_rAcosPi_uid13_fpArccosPiTest_b <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
    fracXIsZero_uid175_rAcosPi_uid13_fpArccosPiTest_q <= "1" when fracXIsZero_uid175_rAcosPi_uid13_fpArccosPiTest_a = fracXIsZero_uid175_rAcosPi_uid13_fpArccosPiTest_b else "0";

	--expXIsMax_uid173_rAcosPi_uid13_fpArccosPiTest(LOGICAL,172)@43
    expXIsMax_uid173_rAcosPi_uid13_fpArccosPiTest_a <= expY_uid144_rAcosPi_uid13_fpArccosPiTest_b;
    expXIsMax_uid173_rAcosPi_uid13_fpArccosPiTest_b <= cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q;
    expXIsMax_uid173_rAcosPi_uid13_fpArccosPiTest_q <= "1" when expXIsMax_uid173_rAcosPi_uid13_fpArccosPiTest_a = expXIsMax_uid173_rAcosPi_uid13_fpArccosPiTest_b else "0";

	--exc_I_uid176_rAcosPi_uid13_fpArccosPiTest(LOGICAL,175)@43
    exc_I_uid176_rAcosPi_uid13_fpArccosPiTest_a <= expXIsMax_uid173_rAcosPi_uid13_fpArccosPiTest_q;
    exc_I_uid176_rAcosPi_uid13_fpArccosPiTest_b <= fracXIsZero_uid175_rAcosPi_uid13_fpArccosPiTest_q;
    exc_I_uid176_rAcosPi_uid13_fpArccosPiTest_q <= exc_I_uid176_rAcosPi_uid13_fpArccosPiTest_a and exc_I_uid176_rAcosPi_uid13_fpArccosPiTest_b;

	--expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest(LOGICAL,154)@42
    expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_a <= expX_uid143_rAcosPi_uid13_fpArccosPiTest_b;
    expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_b <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q;
    expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_q <= "1" when expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_a = expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_b else "0";

	--ld_expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_q_to_excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_a(DELAY,911)@42
    ld_expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_q_to_excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_q, xout => ld_expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_q_to_excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excXZAndExcYI_uid226_rAcosPi_uid13_fpArccosPiTest(LOGICAL,225)@43
    excXZAndExcYI_uid226_rAcosPi_uid13_fpArccosPiTest_a <= ld_expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_q_to_excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_a_q;
    excXZAndExcYI_uid226_rAcosPi_uid13_fpArccosPiTest_b <= exc_I_uid176_rAcosPi_uid13_fpArccosPiTest_q;
    excXZAndExcYI_uid226_rAcosPi_uid13_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excXZAndExcYI_uid226_rAcosPi_uid13_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            excXZAndExcYI_uid226_rAcosPi_uid13_fpArccosPiTest_q <= excXZAndExcYI_uid226_rAcosPi_uid13_fpArccosPiTest_a and excXZAndExcYI_uid226_rAcosPi_uid13_fpArccosPiTest_b;
        END IF;
    END PROCESS;



	--ZeroTimesInf_uid227_rAcosPi_uid13_fpArccosPiTest(LOGICAL,226)@44
    ZeroTimesInf_uid227_rAcosPi_uid13_fpArccosPiTest_a <= excXZAndExcYI_uid226_rAcosPi_uid13_fpArccosPiTest_q;
    ZeroTimesInf_uid227_rAcosPi_uid13_fpArccosPiTest_b <= excYZAndExcXI_uid225_rAcosPi_uid13_fpArccosPiTest_q;
    ZeroTimesInf_uid227_rAcosPi_uid13_fpArccosPiTest_q <= ZeroTimesInf_uid227_rAcosPi_uid13_fpArccosPiTest_a or ZeroTimesInf_uid227_rAcosPi_uid13_fpArccosPiTest_b;

	--InvFracXIsZero_uid177_rAcosPi_uid13_fpArccosPiTest(LOGICAL,176)@43
    InvFracXIsZero_uid177_rAcosPi_uid13_fpArccosPiTest_a <= fracXIsZero_uid175_rAcosPi_uid13_fpArccosPiTest_q;
    InvFracXIsZero_uid177_rAcosPi_uid13_fpArccosPiTest_q <= not InvFracXIsZero_uid177_rAcosPi_uid13_fpArccosPiTest_a;

	--exc_N_uid178_rAcosPi_uid13_fpArccosPiTest(LOGICAL,177)@43
    exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_a <= expXIsMax_uid173_rAcosPi_uid13_fpArccosPiTest_q;
    exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_b <= InvFracXIsZero_uid177_rAcosPi_uid13_fpArccosPiTest_q;
    exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_q <= exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_a and exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_b;

	--reg_exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_2(REG,713)@43
    reg_exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_2_q <= exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--InvFracXIsZero_uid161_rAcosPi_uid13_fpArccosPiTest(LOGICAL,160)@42
    InvFracXIsZero_uid161_rAcosPi_uid13_fpArccosPiTest_a <= fracXIsZero_uid159_rAcosPi_uid13_fpArccosPiTest_q;
    InvFracXIsZero_uid161_rAcosPi_uid13_fpArccosPiTest_q <= not InvFracXIsZero_uid161_rAcosPi_uid13_fpArccosPiTest_a;

	--exc_N_uid162_rAcosPi_uid13_fpArccosPiTest(LOGICAL,161)@42
    exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_a <= expXIsMax_uid157_rAcosPi_uid13_fpArccosPiTest_q;
    exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_b <= InvFracXIsZero_uid161_rAcosPi_uid13_fpArccosPiTest_q;
    exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_q <= exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_a and exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_b;

	--reg_exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_1(REG,712)@42
    reg_exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_1_q <= exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_1_q_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_a(DELAY,943)@43
    ld_reg_exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_1_q_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_1_q, xout => ld_reg_exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_1_q_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest(LOGICAL,227)@44
    excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_a <= ld_reg_exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_1_q_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_a_q;
    excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_b <= reg_exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_0_to_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_2_q;
    excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_c <= ZeroTimesInf_uid227_rAcosPi_uid13_fpArccosPiTest_q;
    excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_q <= excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_a or excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_b or excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_c;

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--InvExcRNaN_uid240_rAcosPi_uid13_fpArccosPiTest(LOGICAL,239)@44
    InvExcRNaN_uid240_rAcosPi_uid13_fpArccosPiTest_a <= excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_q;
    InvExcRNaN_uid240_rAcosPi_uid13_fpArccosPiTest_q <= not InvExcRNaN_uid240_rAcosPi_uid13_fpArccosPiTest_a;

	--signY_uid146_rAcosPi_uid13_fpArccosPiTest(BITSELECT,145)@43
    signY_uid146_rAcosPi_uid13_fpArccosPiTest_in <= fpOOPi_uid11_fpArccosPiTest_q;
    signY_uid146_rAcosPi_uid13_fpArccosPiTest_b <= signY_uid146_rAcosPi_uid13_fpArccosPiTest_in(31 downto 31);

	--signX_uid145_rAcosPi_uid13_fpArccosPiTest(BITSELECT,144)@42
    signX_uid145_rAcosPi_uid13_fpArccosPiTest_in <= sR_uid141_acosX_uid8_fpArccosPiTest_q;
    signX_uid145_rAcosPi_uid13_fpArccosPiTest_b <= signX_uid145_rAcosPi_uid13_fpArccosPiTest_in(31 downto 31);

	--ld_signX_uid145_rAcosPi_uid13_fpArccosPiTest_b_to_signR_uid211_rAcosPi_uid13_fpArccosPiTest_a(DELAY,907)@42
    ld_signX_uid145_rAcosPi_uid13_fpArccosPiTest_b_to_signR_uid211_rAcosPi_uid13_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signX_uid145_rAcosPi_uid13_fpArccosPiTest_b, xout => ld_signX_uid145_rAcosPi_uid13_fpArccosPiTest_b_to_signR_uid211_rAcosPi_uid13_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signR_uid211_rAcosPi_uid13_fpArccosPiTest(LOGICAL,210)@43
    signR_uid211_rAcosPi_uid13_fpArccosPiTest_a <= ld_signX_uid145_rAcosPi_uid13_fpArccosPiTest_b_to_signR_uid211_rAcosPi_uid13_fpArccosPiTest_a_q;
    signR_uid211_rAcosPi_uid13_fpArccosPiTest_b <= signY_uid146_rAcosPi_uid13_fpArccosPiTest_b;
    signR_uid211_rAcosPi_uid13_fpArccosPiTest_q <= signR_uid211_rAcosPi_uid13_fpArccosPiTest_a xor signR_uid211_rAcosPi_uid13_fpArccosPiTest_b;

	--ld_signR_uid211_rAcosPi_uid13_fpArccosPiTest_q_to_signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_a(DELAY,955)@43
    ld_signR_uid211_rAcosPi_uid13_fpArccosPiTest_q_to_signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signR_uid211_rAcosPi_uid13_fpArccosPiTest_q, xout => ld_signR_uid211_rAcosPi_uid13_fpArccosPiTest_q_to_signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest(LOGICAL,240)@44
    signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_a <= ld_signR_uid211_rAcosPi_uid13_fpArccosPiTest_q_to_signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_a_q;
    signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_b <= InvExcRNaN_uid240_rAcosPi_uid13_fpArccosPiTest_q;
    signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_q <= signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_a and signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_b;
        END IF;
    END PROCESS;



	--ld_signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_q_to_R_uid242_rAcosPi_uid13_fpArccosPiTest_c(DELAY,959)@45
    ld_signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_q_to_R_uid242_rAcosPi_uid13_fpArccosPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_q, xout => ld_signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_q_to_R_uid242_rAcosPi_uid13_fpArccosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--add_one_fracY_uid149_uid150_uid150_rAcosPi_uid13_fpArccosPiTest(BITJOIN,149)@43
    add_one_fracY_uid149_uid150_uid150_rAcosPi_uid13_fpArccosPiTest_q <= VCC_q & fracY_uid149_rAcosPi_uid13_fpArccosPiTest_b;

	--add_one_fracX_uid147_uid148_uid148_rAcosPi_uid13_fpArccosPiTest(BITJOIN,147)@42
    add_one_fracX_uid147_uid148_uid148_rAcosPi_uid13_fpArccosPiTest_q <= VCC_q & fracX_uid147_rAcosPi_uid13_fpArccosPiTest_b;

	--reg_add_one_fracX_uid147_uid148_uid148_rAcosPi_uid13_fpArccosPiTest_0_to_prod_uid186_rAcosPi_uid13_fpArccosPiTest_0(REG,702)@42
    reg_add_one_fracX_uid147_uid148_uid148_rAcosPi_uid13_fpArccosPiTest_0_to_prod_uid186_rAcosPi_uid13_fpArccosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_add_one_fracX_uid147_uid148_uid148_rAcosPi_uid13_fpArccosPiTest_0_to_prod_uid186_rAcosPi_uid13_fpArccosPiTest_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_add_one_fracX_uid147_uid148_uid148_rAcosPi_uid13_fpArccosPiTest_0_to_prod_uid186_rAcosPi_uid13_fpArccosPiTest_0_q <= add_one_fracX_uid147_uid148_uid148_rAcosPi_uid13_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--prod_uid186_rAcosPi_uid13_fpArccosPiTest(MULT,185)@43
    prod_uid186_rAcosPi_uid13_fpArccosPiTest_pr <= UNSIGNED(prod_uid186_rAcosPi_uid13_fpArccosPiTest_a) * UNSIGNED(prod_uid186_rAcosPi_uid13_fpArccosPiTest_b);
    prod_uid186_rAcosPi_uid13_fpArccosPiTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid186_rAcosPi_uid13_fpArccosPiTest_a <= (others => '0');
            prod_uid186_rAcosPi_uid13_fpArccosPiTest_b <= (others => '0');
            prod_uid186_rAcosPi_uid13_fpArccosPiTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid186_rAcosPi_uid13_fpArccosPiTest_a <= reg_add_one_fracX_uid147_uid148_uid148_rAcosPi_uid13_fpArccosPiTest_0_to_prod_uid186_rAcosPi_uid13_fpArccosPiTest_0_q;
                prod_uid186_rAcosPi_uid13_fpArccosPiTest_b <= add_one_fracY_uid149_uid150_uid150_rAcosPi_uid13_fpArccosPiTest_q;
                prod_uid186_rAcosPi_uid13_fpArccosPiTest_s1 <= STD_LOGIC_VECTOR(prod_uid186_rAcosPi_uid13_fpArccosPiTest_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid186_rAcosPi_uid13_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid186_rAcosPi_uid13_fpArccosPiTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid186_rAcosPi_uid13_fpArccosPiTest_q <= prod_uid186_rAcosPi_uid13_fpArccosPiTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normalizeBit_uid187_rAcosPi_uid13_fpArccosPiTest(BITSELECT,186)@46
    normalizeBit_uid187_rAcosPi_uid13_fpArccosPiTest_in <= prod_uid186_rAcosPi_uid13_fpArccosPiTest_q;
    normalizeBit_uid187_rAcosPi_uid13_fpArccosPiTest_b <= normalizeBit_uid187_rAcosPi_uid13_fpArccosPiTest_in(47 downto 47);

	--fracRPostNormHigh_uid189_rAcosPi_uid13_fpArccosPiTest(BITSELECT,188)@46
    fracRPostNormHigh_uid189_rAcosPi_uid13_fpArccosPiTest_in <= prod_uid186_rAcosPi_uid13_fpArccosPiTest_q(46 downto 0);
    fracRPostNormHigh_uid189_rAcosPi_uid13_fpArccosPiTest_b <= fracRPostNormHigh_uid189_rAcosPi_uid13_fpArccosPiTest_in(46 downto 23);

	--fracRPostNormLow_uid190_rAcosPi_uid13_fpArccosPiTest(BITSELECT,189)@46
    fracRPostNormLow_uid190_rAcosPi_uid13_fpArccosPiTest_in <= prod_uid186_rAcosPi_uid13_fpArccosPiTest_q(45 downto 0);
    fracRPostNormLow_uid190_rAcosPi_uid13_fpArccosPiTest_b <= fracRPostNormLow_uid190_rAcosPi_uid13_fpArccosPiTest_in(45 downto 22);

	--fracRPostNorm_uid191_rAcosPi_uid13_fpArccosPiTest(MUX,190)@46
    fracRPostNorm_uid191_rAcosPi_uid13_fpArccosPiTest_s <= normalizeBit_uid187_rAcosPi_uid13_fpArccosPiTest_b;
    fracRPostNorm_uid191_rAcosPi_uid13_fpArccosPiTest: PROCESS (fracRPostNorm_uid191_rAcosPi_uid13_fpArccosPiTest_s, en, fracRPostNormLow_uid190_rAcosPi_uid13_fpArccosPiTest_b, fracRPostNormHigh_uid189_rAcosPi_uid13_fpArccosPiTest_b)
    BEGIN
            CASE fracRPostNorm_uid191_rAcosPi_uid13_fpArccosPiTest_s IS
                  WHEN "0" => fracRPostNorm_uid191_rAcosPi_uid13_fpArccosPiTest_q <= fracRPostNormLow_uid190_rAcosPi_uid13_fpArccosPiTest_b;
                  WHEN "1" => fracRPostNorm_uid191_rAcosPi_uid13_fpArccosPiTest_q <= fracRPostNormHigh_uid189_rAcosPi_uid13_fpArccosPiTest_b;
                  WHEN OTHERS => fracRPostNorm_uid191_rAcosPi_uid13_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--FracRPostNorm1dto0_uid199_rAcosPi_uid13_fpArccosPiTest(BITSELECT,198)@46
    FracRPostNorm1dto0_uid199_rAcosPi_uid13_fpArccosPiTest_in <= fracRPostNorm_uid191_rAcosPi_uid13_fpArccosPiTest_q(1 downto 0);
    FracRPostNorm1dto0_uid199_rAcosPi_uid13_fpArccosPiTest_b <= FracRPostNorm1dto0_uid199_rAcosPi_uid13_fpArccosPiTest_in(1 downto 0);

	--Prod22_uid193_rAcosPi_uid13_fpArccosPiTest(BITSELECT,192)@46
    Prod22_uid193_rAcosPi_uid13_fpArccosPiTest_in <= prod_uid186_rAcosPi_uid13_fpArccosPiTest_q(22 downto 0);
    Prod22_uid193_rAcosPi_uid13_fpArccosPiTest_b <= Prod22_uid193_rAcosPi_uid13_fpArccosPiTest_in(22 downto 22);

	--extraStickyBit_uid194_rAcosPi_uid13_fpArccosPiTest(MUX,193)@46
    extraStickyBit_uid194_rAcosPi_uid13_fpArccosPiTest_s <= normalizeBit_uid187_rAcosPi_uid13_fpArccosPiTest_b;
    extraStickyBit_uid194_rAcosPi_uid13_fpArccosPiTest: PROCESS (extraStickyBit_uid194_rAcosPi_uid13_fpArccosPiTest_s, en, GND_q, Prod22_uid193_rAcosPi_uid13_fpArccosPiTest_b)
    BEGIN
            CASE extraStickyBit_uid194_rAcosPi_uid13_fpArccosPiTest_s IS
                  WHEN "0" => extraStickyBit_uid194_rAcosPi_uid13_fpArccosPiTest_q <= GND_q;
                  WHEN "1" => extraStickyBit_uid194_rAcosPi_uid13_fpArccosPiTest_q <= Prod22_uid193_rAcosPi_uid13_fpArccosPiTest_b;
                  WHEN OTHERS => extraStickyBit_uid194_rAcosPi_uid13_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--stickyRange_uid192_rAcosPi_uid13_fpArccosPiTest(BITSELECT,191)@46
    stickyRange_uid192_rAcosPi_uid13_fpArccosPiTest_in <= prod_uid186_rAcosPi_uid13_fpArccosPiTest_q(21 downto 0);
    stickyRange_uid192_rAcosPi_uid13_fpArccosPiTest_b <= stickyRange_uid192_rAcosPi_uid13_fpArccosPiTest_in(21 downto 0);

	--stickyExtendedRange_uid195_rAcosPi_uid13_fpArccosPiTest(BITJOIN,194)@46
    stickyExtendedRange_uid195_rAcosPi_uid13_fpArccosPiTest_q <= extraStickyBit_uid194_rAcosPi_uid13_fpArccosPiTest_q & stickyRange_uid192_rAcosPi_uid13_fpArccosPiTest_b;

	--stickyRangeComparator_uid197_rAcosPi_uid13_fpArccosPiTest(LOGICAL,196)@46
    stickyRangeComparator_uid197_rAcosPi_uid13_fpArccosPiTest_a <= stickyExtendedRange_uid195_rAcosPi_uid13_fpArccosPiTest_q;
    stickyRangeComparator_uid197_rAcosPi_uid13_fpArccosPiTest_b <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
    stickyRangeComparator_uid197_rAcosPi_uid13_fpArccosPiTest_q <= "1" when stickyRangeComparator_uid197_rAcosPi_uid13_fpArccosPiTest_a = stickyRangeComparator_uid197_rAcosPi_uid13_fpArccosPiTest_b else "0";

	--sticky_uid198_rAcosPi_uid13_fpArccosPiTest(LOGICAL,197)@46
    sticky_uid198_rAcosPi_uid13_fpArccosPiTest_a <= stickyRangeComparator_uid197_rAcosPi_uid13_fpArccosPiTest_q;
    sticky_uid198_rAcosPi_uid13_fpArccosPiTest_q <= not sticky_uid198_rAcosPi_uid13_fpArccosPiTest_a;

	--lrs_uid200_rAcosPi_uid13_fpArccosPiTest(BITJOIN,199)@46
    lrs_uid200_rAcosPi_uid13_fpArccosPiTest_q <= FracRPostNorm1dto0_uid199_rAcosPi_uid13_fpArccosPiTest_b & sticky_uid198_rAcosPi_uid13_fpArccosPiTest_q;

	--roundBitDetectionPattern_uid202_rAcosPi_uid13_fpArccosPiTest(LOGICAL,201)@46
    roundBitDetectionPattern_uid202_rAcosPi_uid13_fpArccosPiTest_a <= lrs_uid200_rAcosPi_uid13_fpArccosPiTest_q;
    roundBitDetectionPattern_uid202_rAcosPi_uid13_fpArccosPiTest_b <= roundBitDetectionConstant_uid201_rAcosPi_uid13_fpArccosPiTest_q;
    roundBitDetectionPattern_uid202_rAcosPi_uid13_fpArccosPiTest_q <= "1" when roundBitDetectionPattern_uid202_rAcosPi_uid13_fpArccosPiTest_a = roundBitDetectionPattern_uid202_rAcosPi_uid13_fpArccosPiTest_b else "0";

	--roundBit_uid203_rAcosPi_uid13_fpArccosPiTest(LOGICAL,202)@46
    roundBit_uid203_rAcosPi_uid13_fpArccosPiTest_a <= roundBitDetectionPattern_uid202_rAcosPi_uid13_fpArccosPiTest_q;
    roundBit_uid203_rAcosPi_uid13_fpArccosPiTest_q <= not roundBit_uid203_rAcosPi_uid13_fpArccosPiTest_a;

	--roundBitAndNormalizationOp_uid206_rAcosPi_uid13_fpArccosPiTest(BITJOIN,205)@46
    roundBitAndNormalizationOp_uid206_rAcosPi_uid13_fpArccosPiTest_q <= GND_q & normalizeBit_uid187_rAcosPi_uid13_fpArccosPiTest_b & cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q & roundBit_uid203_rAcosPi_uid13_fpArccosPiTest_q;

	--reg_roundBitAndNormalizationOp_uid206_rAcosPi_uid13_fpArccosPiTest_0_to_expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_1(REG,704)@46
    reg_roundBitAndNormalizationOp_uid206_rAcosPi_uid13_fpArccosPiTest_0_to_expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_roundBitAndNormalizationOp_uid206_rAcosPi_uid13_fpArccosPiTest_0_to_expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_roundBitAndNormalizationOp_uid206_rAcosPi_uid13_fpArccosPiTest_0_to_expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_1_q <= roundBitAndNormalizationOp_uid206_rAcosPi_uid13_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid143_rAcosPi_uid13_fpArccosPiTest_b_to_expSum_uid183_rAcosPi_uid13_fpArccosPiTest_a(DELAY,874)@42
    ld_expX_uid143_rAcosPi_uid13_fpArccosPiTest_b_to_expSum_uid183_rAcosPi_uid13_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expX_uid143_rAcosPi_uid13_fpArccosPiTest_b, xout => ld_expX_uid143_rAcosPi_uid13_fpArccosPiTest_b_to_expSum_uid183_rAcosPi_uid13_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--expSum_uid183_rAcosPi_uid13_fpArccosPiTest(ADD,182)@43
    expSum_uid183_rAcosPi_uid13_fpArccosPiTest_a <= STD_LOGIC_VECTOR("0" & ld_expX_uid143_rAcosPi_uid13_fpArccosPiTest_b_to_expSum_uid183_rAcosPi_uid13_fpArccosPiTest_a_q);
    expSum_uid183_rAcosPi_uid13_fpArccosPiTest_b <= STD_LOGIC_VECTOR("0" & expY_uid144_rAcosPi_uid13_fpArccosPiTest_b);
    expSum_uid183_rAcosPi_uid13_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid183_rAcosPi_uid13_fpArccosPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expSum_uid183_rAcosPi_uid13_fpArccosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid183_rAcosPi_uid13_fpArccosPiTest_a) + UNSIGNED(expSum_uid183_rAcosPi_uid13_fpArccosPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    expSum_uid183_rAcosPi_uid13_fpArccosPiTest_q <= expSum_uid183_rAcosPi_uid13_fpArccosPiTest_o(8 downto 0);


	--ld_expSum_uid183_rAcosPi_uid13_fpArccosPiTest_q_to_expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_a(DELAY,876)@44
    ld_expSum_uid183_rAcosPi_uid13_fpArccosPiTest_q_to_expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => expSum_uid183_rAcosPi_uid13_fpArccosPiTest_q, xout => ld_expSum_uid183_rAcosPi_uid13_fpArccosPiTest_q_to_expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest(SUB,184)@45
    expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_a <= STD_LOGIC_VECTOR('0' & "00" & ld_expSum_uid183_rAcosPi_uid13_fpArccosPiTest_q_to_expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_a_q);
    expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_b <= STD_LOGIC_VECTOR((11 downto 10 => biasInc_uid184_rAcosPi_uid13_fpArccosPiTest_q(9)) & biasInc_uid184_rAcosPi_uid13_fpArccosPiTest_q);
    expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_a) - SIGNED(expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_q <= expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_o(10 downto 0);


	--expFracPreRound_uid204_rAcosPi_uid13_fpArccosPiTest(BITJOIN,203)@46
    expFracPreRound_uid204_rAcosPi_uid13_fpArccosPiTest_q <= expSumMBias_uid185_rAcosPi_uid13_fpArccosPiTest_q & fracRPostNorm_uid191_rAcosPi_uid13_fpArccosPiTest_q;

	--reg_expFracPreRound_uid204_rAcosPi_uid13_fpArccosPiTest_0_to_expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_0(REG,703)@46
    reg_expFracPreRound_uid204_rAcosPi_uid13_fpArccosPiTest_0_to_expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracPreRound_uid204_rAcosPi_uid13_fpArccosPiTest_0_to_expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_0_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracPreRound_uid204_rAcosPi_uid13_fpArccosPiTest_0_to_expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_0_q <= expFracPreRound_uid204_rAcosPi_uid13_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest(ADD,206)@47
    expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_a <= STD_LOGIC_VECTOR((36 downto 35 => reg_expFracPreRound_uid204_rAcosPi_uid13_fpArccosPiTest_0_to_expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_0_q(34)) & reg_expFracPreRound_uid204_rAcosPi_uid13_fpArccosPiTest_0_to_expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_0_q);
    expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_b <= STD_LOGIC_VECTOR('0' & "0000000000" & reg_roundBitAndNormalizationOp_uid206_rAcosPi_uid13_fpArccosPiTest_0_to_expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_1_q);
            expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_a) + SIGNED(expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_b));
    expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_q <= expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_o(35 downto 0);


	--expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest(BITSELECT,208)@47
    expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_in <= expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_q;
    expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_b <= expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_in(35 downto 24);

	--expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest(BITSELECT,209)@47
    expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_in <= expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_b(7 downto 0);
    expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_b <= expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_in(7 downto 0);

	--ld_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_b_to_reg_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_0_to_expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_3_a(DELAY,1447)@47
    ld_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_b_to_reg_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_0_to_expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_3_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_b, xout => ld_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_b_to_reg_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_0_to_expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_3_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_0_to_expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_3(REG,716)@48
    reg_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_0_to_expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_0_to_expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_0_to_expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_3_q <= ld_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_b_to_reg_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_0_to_expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_3_a_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_q_to_concExc_uid229_rAcosPi_uid13_fpArccosPiTest_c(DELAY,948)@44
    ld_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_q_to_concExc_uid229_rAcosPi_uid13_fpArccosPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_q, xout => ld_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_q_to_concExc_uid229_rAcosPi_uid13_fpArccosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_0_to_expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_1(REG,705)@47
    reg_expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_0_to_expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_0_to_expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_0_to_expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_1_q <= expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expOvf_uid214_rAcosPi_uid13_fpArccosPiTest(COMPARE,213)@48
    expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_cin <= GND_q;
    expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_a <= STD_LOGIC_VECTOR((13 downto 12 => reg_expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_0_to_expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_1_q(11)) & reg_expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_0_to_expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_1_q) & '0';
    expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_b <= STD_LOGIC_VECTOR('0' & "00000" & cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q) & expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_cin(0);
            expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_a) - SIGNED(expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_b));
    expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_n(0) <= not expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_o(14);


	--InvExc_N_uid179_rAcosPi_uid13_fpArccosPiTest(LOGICAL,178)@43
    InvExc_N_uid179_rAcosPi_uid13_fpArccosPiTest_a <= exc_N_uid178_rAcosPi_uid13_fpArccosPiTest_q;
    InvExc_N_uid179_rAcosPi_uid13_fpArccosPiTest_q <= not InvExc_N_uid179_rAcosPi_uid13_fpArccosPiTest_a;

	--InvExc_I_uid180_rAcosPi_uid13_fpArccosPiTest(LOGICAL,179)@43
    InvExc_I_uid180_rAcosPi_uid13_fpArccosPiTest_a <= exc_I_uid176_rAcosPi_uid13_fpArccosPiTest_q;
    InvExc_I_uid180_rAcosPi_uid13_fpArccosPiTest_q <= not InvExc_I_uid180_rAcosPi_uid13_fpArccosPiTest_a;

	--InvExpXIsZero_uid181_rAcosPi_uid13_fpArccosPiTest(LOGICAL,180)@43
    InvExpXIsZero_uid181_rAcosPi_uid13_fpArccosPiTest_a <= expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_q;
    InvExpXIsZero_uid181_rAcosPi_uid13_fpArccosPiTest_q <= not InvExpXIsZero_uid181_rAcosPi_uid13_fpArccosPiTest_a;

	--exc_R_uid182_rAcosPi_uid13_fpArccosPiTest(LOGICAL,181)@43
    exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_a <= InvExpXIsZero_uid181_rAcosPi_uid13_fpArccosPiTest_q;
    exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_b <= InvExc_I_uid180_rAcosPi_uid13_fpArccosPiTest_q;
    exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_c <= InvExc_N_uid179_rAcosPi_uid13_fpArccosPiTest_q;
    exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_q <= exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_a and exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_b and exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_c;

	--ld_exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_q_to_excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_b(DELAY,918)@43
    ld_exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_q_to_excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_q, xout => ld_exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_q_to_excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid163_rAcosPi_uid13_fpArccosPiTest(LOGICAL,162)@42
    InvExc_N_uid163_rAcosPi_uid13_fpArccosPiTest_a <= exc_N_uid162_rAcosPi_uid13_fpArccosPiTest_q;
    InvExc_N_uid163_rAcosPi_uid13_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExc_N_uid163_rAcosPi_uid13_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExc_N_uid163_rAcosPi_uid13_fpArccosPiTest_q <= not InvExc_N_uid163_rAcosPi_uid13_fpArccosPiTest_a;
        END IF;
    END PROCESS;



	--InvExc_I_uid164_rAcosPi_uid13_fpArccosPiTest(LOGICAL,163)@42
    InvExc_I_uid164_rAcosPi_uid13_fpArccosPiTest_a <= exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_q;
    InvExc_I_uid164_rAcosPi_uid13_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExc_I_uid164_rAcosPi_uid13_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExc_I_uid164_rAcosPi_uid13_fpArccosPiTest_q <= not InvExc_I_uid164_rAcosPi_uid13_fpArccosPiTest_a;
        END IF;
    END PROCESS;



	--InvExpXIsZero_uid165_rAcosPi_uid13_fpArccosPiTest(LOGICAL,164)@42
    InvExpXIsZero_uid165_rAcosPi_uid13_fpArccosPiTest_a <= expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_q;
    InvExpXIsZero_uid165_rAcosPi_uid13_fpArccosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExpXIsZero_uid165_rAcosPi_uid13_fpArccosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExpXIsZero_uid165_rAcosPi_uid13_fpArccosPiTest_q <= not InvExpXIsZero_uid165_rAcosPi_uid13_fpArccosPiTest_a;
        END IF;
    END PROCESS;



	--exc_R_uid166_rAcosPi_uid13_fpArccosPiTest(LOGICAL,165)@43
    exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_a <= InvExpXIsZero_uid165_rAcosPi_uid13_fpArccosPiTest_q;
    exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_b <= InvExc_I_uid164_rAcosPi_uid13_fpArccosPiTest_q;
    exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_c <= InvExc_N_uid163_rAcosPi_uid13_fpArccosPiTest_q;
    exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_q <= exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_a and exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_b and exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_c;

	--ld_exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_q_to_excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_a(DELAY,917)@43
    ld_exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_q_to_excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_q, xout => ld_exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_q_to_excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--ExcROvfAndInReg_uid223_rAcosPi_uid13_fpArccosPiTest(LOGICAL,222)@48
    ExcROvfAndInReg_uid223_rAcosPi_uid13_fpArccosPiTest_a <= ld_exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_q_to_excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_a_q;
    ExcROvfAndInReg_uid223_rAcosPi_uid13_fpArccosPiTest_b <= ld_exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_q_to_excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_b_q;
    ExcROvfAndInReg_uid223_rAcosPi_uid13_fpArccosPiTest_c <= expOvf_uid214_rAcosPi_uid13_fpArccosPiTest_n;
    ExcROvfAndInReg_uid223_rAcosPi_uid13_fpArccosPiTest_q <= ExcROvfAndInReg_uid223_rAcosPi_uid13_fpArccosPiTest_a and ExcROvfAndInReg_uid223_rAcosPi_uid13_fpArccosPiTest_b and ExcROvfAndInReg_uid223_rAcosPi_uid13_fpArccosPiTest_c;

	--reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_1(REG,706)@42
    reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_1_q <= exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_2_q_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_b(DELAY,929)@43
    ld_reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_2_q_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_1_q, xout => ld_reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_2_q_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--reg_exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_0_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_1(REG,707)@43
    reg_exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_0_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_0_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_0_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_1_q <= exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest(LOGICAL,221)@44
    excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_a <= reg_exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_0_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_1_q;
    excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_b <= ld_reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_2_q_to_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_b_q;
    excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_q <= excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_a and excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_b;

	--ld_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_c(DELAY,935)@44
    ld_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_q, xout => ld_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest(LOGICAL,220)@43
    excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest_a <= exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_q;
    excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest_b <= exc_I_uid176_rAcosPi_uid13_fpArccosPiTest_q;
    excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest_q <= excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest_a and excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest_b;

	--ld_excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_b(DELAY,934)@43
    ld_excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest_q, xout => ld_excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest(LOGICAL,219)@43
    excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_a <= reg_exc_I_uid160_rAcosPi_uid13_fpArccosPiTest_0_to_excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_1_q;
    excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_b <= exc_I_uid176_rAcosPi_uid13_fpArccosPiTest_q;
    excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_q <= excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_a and excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_b;

	--ld_excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_a(DELAY,933)@43
    ld_excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_q, xout => ld_excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRInf_uid224_rAcosPi_uid13_fpArccosPiTest(LOGICAL,223)@48
    excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_a <= ld_excXIAndExcYI_uid220_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_a_q;
    excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_b <= ld_excXRAndExcYI_uid221_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_b_q;
    excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_c <= ld_excYRAndExcXI_uid222_rAcosPi_uid13_fpArccosPiTest_q_to_excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_c_q;
    excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_d <= ExcROvfAndInReg_uid223_rAcosPi_uid13_fpArccosPiTest_q;
    excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_q <= excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_a or excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_b or excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_c or excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_d;

	--expUdf_uid212_rAcosPi_uid13_fpArccosPiTest(COMPARE,211)@48
    expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_cin <= GND_q;
    expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_a <= STD_LOGIC_VECTOR('0' & "000000000000" & GND_q) & '0';
    expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_b <= STD_LOGIC_VECTOR((13 downto 12 => reg_expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_0_to_expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_1_q(11)) & reg_expRPreExcExt_uid209_rAcosPi_uid13_fpArccosPiTest_0_to_expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_1_q) & expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_cin(0);
            expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_a) - SIGNED(expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_b));
    expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_n(0) <= not expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_o(14);


	--excZC3_uid218_rAcosPi_uid13_fpArccosPiTest(LOGICAL,217)@48
    excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_a <= ld_exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_q_to_excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_a_q;
    excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_b <= ld_exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_q_to_excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_b_q;
    excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_c <= expUdf_uid212_rAcosPi_uid13_fpArccosPiTest_n;
    excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_q <= excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_a and excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_b and excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_c;

	--excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest(LOGICAL,216)@43
    excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest_a <= expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_q;
    excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest_b <= exc_R_uid166_rAcosPi_uid13_fpArccosPiTest_q;
    excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest_q <= excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest_a and excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest_b;

	--ld_excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_c(DELAY,922)@43
    ld_excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest_q, xout => ld_excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest(LOGICAL,215)@43
    excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest_a <= ld_expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_q_to_excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_a_q;
    excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest_b <= exc_R_uid182_rAcosPi_uid13_fpArccosPiTest_q;
    excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest_q <= excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest_a and excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest_b;

	--ld_excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_b(DELAY,921)@43
    ld_excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest_q, xout => ld_excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest(LOGICAL,214)@43
    excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_a <= ld_expXIsZero_uid155_rAcosPi_uid13_fpArccosPiTest_q_to_excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_a_q;
    excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_b <= expXIsZero_uid171_rAcosPi_uid13_fpArccosPiTest_q;
    excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_q <= excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_a and excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_b;

	--ld_excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_a(DELAY,920)@43
    ld_excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_q, xout => ld_excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRZero_uid219_rAcosPi_uid13_fpArccosPiTest(LOGICAL,218)@48
    excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_a <= ld_excXZAndExcYZ_uid215_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_a_q;
    excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_b <= ld_excXZAndExcYR_uid216_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_b_q;
    excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_c <= ld_excYZAndExcXR_uid217_rAcosPi_uid13_fpArccosPiTest_q_to_excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_c_q;
    excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_d <= excZC3_uid218_rAcosPi_uid13_fpArccosPiTest_q;
    excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_q <= excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_a or excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_b or excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_c or excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_d;

	--concExc_uid229_rAcosPi_uid13_fpArccosPiTest(BITJOIN,228)@48
    concExc_uid229_rAcosPi_uid13_fpArccosPiTest_q <= ld_excRNaN_uid228_rAcosPi_uid13_fpArccosPiTest_q_to_concExc_uid229_rAcosPi_uid13_fpArccosPiTest_c_q & excRInf_uid224_rAcosPi_uid13_fpArccosPiTest_q & excRZero_uid219_rAcosPi_uid13_fpArccosPiTest_q;

	--reg_concExc_uid229_rAcosPi_uid13_fpArccosPiTest_0_to_excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_0(REG,714)@48
    reg_concExc_uid229_rAcosPi_uid13_fpArccosPiTest_0_to_excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid229_rAcosPi_uid13_fpArccosPiTest_0_to_excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid229_rAcosPi_uid13_fpArccosPiTest_0_to_excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_0_q <= concExc_uid229_rAcosPi_uid13_fpArccosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excREnc_uid230_rAcosPi_uid13_fpArccosPiTest(LOOKUP,229)@49
    excREnc_uid230_rAcosPi_uid13_fpArccosPiTest: PROCESS (reg_concExc_uid229_rAcosPi_uid13_fpArccosPiTest_0_to_excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_concExc_uid229_rAcosPi_uid13_fpArccosPiTest_0_to_excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_0_q) IS
                WHEN "000" =>  excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_q <= "01";
                WHEN "001" =>  excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_q <= "00";
                WHEN "010" =>  excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_q <= "10";
                WHEN "011" =>  excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_q <= "00";
                WHEN "100" =>  excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_q <= "11";
                WHEN "101" =>  excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_q <= "00";
                WHEN "110" =>  excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_q <= "00";
                WHEN "111" =>  excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest(MUX,238)@49
    expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_s <= excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_q;
    expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest: PROCESS (expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_s, en, cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q, reg_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_0_to_expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_3_q, cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q, cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_s IS
                  WHEN "00" => expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_q <= cstAllZWE_uid21_acosX_uid8_fpArccosPiTest_q;
                  WHEN "01" => expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_q <= reg_expRPreExc_uid210_rAcosPi_uid13_fpArccosPiTest_0_to_expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_3_q;
                  WHEN "10" => expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_q <= cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q;
                  WHEN "11" => expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_q <= cstAllOWE_uid18_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest(BITSELECT,207)@47
    fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_in <= expFracRPostRounding_uid207_rAcosPi_uid13_fpArccosPiTest_q(23 downto 0);
    fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_b <= fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_in(23 downto 1);

	--reg_fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_0_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_3(REG,715)@47
    reg_fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_0_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_0_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_3_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_0_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_3_q <= fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_0_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_3_q_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_d(DELAY,951)@48
    ld_reg_fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_0_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_3_q_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_d : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => reg_fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_0_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_3_q, xout => ld_reg_fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_0_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_3_q_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest(MUX,233)@49
    fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_s <= excREnc_uid230_rAcosPi_uid13_fpArccosPiTest_q;
    fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest: PROCESS (fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_s, en, cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q, ld_reg_fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_0_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_3_q_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_d_q, cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q, cstNaNWF_uid20_acosX_uid8_fpArccosPiTest_q)
    BEGIN
            CASE fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_s IS
                  WHEN "00" => fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_q <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
                  WHEN "01" => fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_q <= ld_reg_fracRPreExc_uid208_rAcosPi_uid13_fpArccosPiTest_0_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_3_q_to_fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_d_q;
                  WHEN "10" => fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_q <= cstAllZWF_uid19_acosX_uid8_fpArccosPiTest_q;
                  WHEN "11" => fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_q <= cstNaNWF_uid20_acosX_uid8_fpArccosPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid242_rAcosPi_uid13_fpArccosPiTest(BITJOIN,241)@49
    R_uid242_rAcosPi_uid13_fpArccosPiTest_q <= ld_signRPostExc_uid241_rAcosPi_uid13_fpArccosPiTest_q_to_R_uid242_rAcosPi_uid13_fpArccosPiTest_c_q & expRPostExc_uid239_rAcosPi_uid13_fpArccosPiTest_q & fracRPostExc_uid234_rAcosPi_uid13_fpArccosPiTest_q;

	--xOut(GPOUT,4)@49
    q <= R_uid242_rAcosPi_uid13_fpArccosPiTest_q;


end normal;
