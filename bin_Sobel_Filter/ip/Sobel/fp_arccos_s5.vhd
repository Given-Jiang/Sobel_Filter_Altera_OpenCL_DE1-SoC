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

-- VHDL created from fp_arccos_s5
-- VHDL created on Thu Feb 28 17:20:47 2013


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

entity fp_arccos_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_arccos_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid9_fpArccosXTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid10_fpArccosXTest_q : std_logic_vector (22 downto 0);
    signal cstNaNWF_uid11_fpArccosXTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid12_fpArccosXTest_q : std_logic_vector (7 downto 0);
    signal cstBias_uid13_fpArccosXTest_q : std_logic_vector (7 downto 0);
    signal cstBiasM1_uid14_fpArccosXTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMwFMwShift_uid15_fpArccosXTest_q : std_logic_vector (8 downto 0);
    signal cstBiasM2_uid16_fpArccosXTest_q : std_logic_vector (7 downto 0);
    signal cstBiasP1_uid17_fpArccosXTest_q : std_logic_vector (7 downto 0);
    signal shiftOutVal_uid45_fpArccosXTest_q : std_logic_vector (5 downto 0);
    signal cst01pWShift_uid48_fpArccosXTest_q : std_logic_vector (12 downto 0);
    signal pi_uid85_fpArccosXTest_q : std_logic_vector (27 downto 0);
    signal path1NegCaseFrac_uid91_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal path1NegCaseFrac_uid91_fpArccosXTest_q : std_logic_vector (22 downto 0);
    signal pi2_uid102_fpArccosXTest_q : std_logic_vector (26 downto 0);
    signal fracOutMuxSelEnc_uid118_fpArccosXTest_q : std_logic_vector(1 downto 0);
    signal rightShiftStage0Idx1Pad16_uid136_fxpX_uid50_fpArccosXTest_q : std_logic_vector (15 downto 0);
    signal rightShiftStage0Idx2Pad32_uid139_fxpX_uid50_fpArccosXTest_q : std_logic_vector (31 downto 0);
    signal rightShiftStage0Idx3_uid141_fxpX_uid50_fpArccosXTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx1Pad4_uid145_fxpX_uid50_fpArccosXTest_q : std_logic_vector (3 downto 0);
    signal rightShiftStage1Idx3Pad12_uid151_fxpX_uid50_fpArccosXTest_q : std_logic_vector (11 downto 0);
    signal rightShiftStage2Idx2Pad2_uid159_fxpX_uid50_fpArccosXTest_q : std_logic_vector (1 downto 0);
    signal rightShiftStage2Idx3Pad3_uid162_fxpX_uid50_fpArccosXTest_q : std_logic_vector (2 downto 0);
    signal maxCountVal_uid210_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (5 downto 0);
    signal vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (5 downto 0);
    signal expXIsMax_uid225_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid225_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid225_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid233_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid233_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector (7 downto 0);
    signal negZero_uid266_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal negZero_uid266_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal negZero_uid266_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0Idx3_uid276_alignSqrt_uid69_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx3Pad6_uid286_alignSqrt_uid69_fpArccosXTest_q : std_logic_vector (5 downto 0);
    signal expXIsMax_uid342_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid342_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid342_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid350_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid350_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal expSum_uid352_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(8 downto 0);
    signal expSum_uid352_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(8 downto 0);
    signal expSum_uid352_arcsinL_uid78_fpArccosXTest_o : std_logic_vector (8 downto 0);
    signal expSum_uid352_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (8 downto 0);
    signal biasInc_uid353_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (9 downto 0);
    signal expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(11 downto 0);
    signal expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(11 downto 0);
    signal expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_o : std_logic_vector (11 downto 0);
    signal expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (10 downto 0);
    signal prod_uid355_arcsinL_uid78_fpArccosXTest_a : std_logic_vector (23 downto 0);
    signal prod_uid355_arcsinL_uid78_fpArccosXTest_b : std_logic_vector (23 downto 0);
    signal prod_uid355_arcsinL_uid78_fpArccosXTest_s1 : std_logic_vector (47 downto 0);
    signal prod_uid355_arcsinL_uid78_fpArccosXTest_pr : UNSIGNED (47 downto 0);
    signal prod_uid355_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (47 downto 0);
    signal roundBitDetectionConstant_uid370_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (2 downto 0);
    signal signR_uid380_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal signR_uid380_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal signR_uid380_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid409_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid409_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_a : std_logic_vector (11 downto 0);
    signal prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_b : std_logic_vector (11 downto 0);
    signal prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_pr : SIGNED (24 downto 0);
    signal prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_q : std_logic_vector (23 downto 0);
    signal prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_a : std_logic_vector (14 downto 0);
    signal prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_b : std_logic_vector (20 downto 0);
    signal prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_s1 : std_logic_vector (35 downto 0);
    signal prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_pr : SIGNED (36 downto 0);
    signal prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_q : std_logic_vector (35 downto 0);
    signal prodXY_uid478_pT1_uid444_arccosXO2PolyEval_a : std_logic_vector (11 downto 0);
    signal prodXY_uid478_pT1_uid444_arccosXO2PolyEval_b : std_logic_vector (11 downto 0);
    signal prodXY_uid478_pT1_uid444_arccosXO2PolyEval_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid478_pT1_uid444_arccosXO2PolyEval_pr : SIGNED (24 downto 0);
    signal prodXY_uid478_pT1_uid444_arccosXO2PolyEval_q : std_logic_vector (23 downto 0);
    signal prodXY_uid481_pT2_uid450_arccosXO2PolyEval_a : std_logic_vector (14 downto 0);
    signal prodXY_uid481_pT2_uid450_arccosXO2PolyEval_b : std_logic_vector (23 downto 0);
    signal prodXY_uid481_pT2_uid450_arccosXO2PolyEval_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid481_pT2_uid450_arccosXO2PolyEval_pr : SIGNED (39 downto 0);
    signal prodXY_uid481_pT2_uid450_arccosXO2PolyEval_q : std_logic_vector (38 downto 0);
    signal prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_a : std_logic_vector (11 downto 0);
    signal prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_pr : SIGNED (24 downto 0);
    signal prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_q : std_logic_vector (23 downto 0);
    signal prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a : std_logic_vector (15 downto 0);
    signal prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_b : std_logic_vector (22 downto 0);
    signal prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_pr : SIGNED (39 downto 0);
    signal prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_q : std_logic_vector (38 downto 0);
    signal memoryC0_uid296_arcsinXO2XTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid296_arcsinXO2XTabGen_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid296_arcsinXO2XTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid296_arcsinXO2XTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid296_arcsinXO2XTabGen_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid296_arcsinXO2XTabGen_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid297_arcsinXO2XTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid297_arcsinXO2XTabGen_lutmem_ia : std_logic_vector (18 downto 0);
    signal memoryC1_uid297_arcsinXO2XTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid297_arcsinXO2XTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid297_arcsinXO2XTabGen_lutmem_iq : std_logic_vector (18 downto 0);
    signal memoryC1_uid297_arcsinXO2XTabGen_lutmem_q : std_logic_vector (18 downto 0);
    signal memoryC2_uid298_arcsinXO2XTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid298_arcsinXO2XTabGen_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid298_arcsinXO2XTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid298_arcsinXO2XTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid298_arcsinXO2XTabGen_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid298_arcsinXO2XTabGen_lutmem_q : std_logic_vector (11 downto 0);
    signal memoryC0_uid440_arccosXO2TabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid440_arccosXO2TabGen_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid440_arccosXO2TabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid440_arccosXO2TabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid440_arccosXO2TabGen_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid440_arccosXO2TabGen_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid441_arccosXO2TabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid441_arccosXO2TabGen_lutmem_ia : std_logic_vector (21 downto 0);
    signal memoryC1_uid441_arccosXO2TabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid441_arccosXO2TabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid441_arccosXO2TabGen_lutmem_iq : std_logic_vector (21 downto 0);
    signal memoryC1_uid441_arccosXO2TabGen_lutmem_q : std_logic_vector (21 downto 0);
    signal memoryC2_uid442_arccosXO2TabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid442_arccosXO2TabGen_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid442_arccosXO2TabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid442_arccosXO2TabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid442_arccosXO2TabGen_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid442_arccosXO2TabGen_lutmem_q : std_logic_vector (11 downto 0);
    signal memoryC0_uid456_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC0_uid456_sqrtTableGenerator_lutmem_ia : std_logic_vector (28 downto 0);
    signal memoryC0_uid456_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid456_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid456_sqrtTableGenerator_lutmem_iq : std_logic_vector (28 downto 0);
    signal memoryC0_uid456_sqrtTableGenerator_lutmem_q : std_logic_vector (28 downto 0);
    signal memoryC1_uid457_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC1_uid457_sqrtTableGenerator_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid457_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid457_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid457_sqrtTableGenerator_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid457_sqrtTableGenerator_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid458_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC2_uid458_sqrtTableGenerator_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid458_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid458_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid458_sqrtTableGenerator_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid458_sqrtTableGenerator_lutmem_q : std_logic_vector (11 downto 0);
    signal reg_excSelBits_uid128_fpArccosXTest_0_to_outMuxSelEnc_uid129_fpArccosXTest_0_q : std_logic_vector (2 downto 0);
    signal reg_rightShiftStageSel3Dto2_uid153_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_2_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStage1Idx1_uid146_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_3_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStage1Idx2_uid149_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_4_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStage1Idx3_uid152_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_5_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStageSel1Dto0_uid164_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_pad_o_uid18_uid54_fpArccosXTest_0_to_oMy_uid54_fpArccosXTest_0_q : std_logic_vector (35 downto 0);
    signal reg_y_uid52_fpArccosXTest_0_to_oMy_uid54_fpArccosXTest_1_q : std_logic_vector (34 downto 0);
    signal reg_rVStage_uid168_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid169_fpLOut1_uid57_fpArccosXTest_1_q : std_logic_vector (31 downto 0);
    signal reg_l_uid56_fpArccosXTest_0_to_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_2_q : std_logic_vector (34 downto 0);
    signal reg_cStage_uid172_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_3_q : std_logic_vector (34 downto 0);
    signal reg_rVStage_uid175_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid176_fpLOut1_uid57_fpArccosXTest_1_q : std_logic_vector (15 downto 0);
    signal reg_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid180_fpLOut1_uid57_fpArccosXTest_2_q : std_logic_vector (34 downto 0);
    signal reg_cStage_uid179_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid180_fpLOut1_uid57_fpArccosXTest_3_q : std_logic_vector (34 downto 0);
    signal reg_rVStage_uid189_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid190_fpLOut1_uid57_fpArccosXTest_1_q : std_logic_vector (3 downto 0);
    signal reg_vStagei_uid187_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid194_fpLOut1_uid57_fpArccosXTest_2_q : std_logic_vector (34 downto 0);
    signal reg_cStage_uid193_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid194_fpLOut1_uid57_fpArccosXTest_3_q : std_logic_vector (34 downto 0);
    signal reg_vCount_uid183_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_3_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid209_fpLOut1_uid57_fpArccosXTest_0_to_vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_1_q : std_logic_vector (5 downto 0);
    signal reg_fpLOutFrac_uid59_fpArccosXTest_0_to_fpL_uid61_fpArccosXTest_0_q : std_logic_vector (22 downto 0);
    signal reg_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_0_to_fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_1_q : std_logic_vector (22 downto 0);
    signal reg_fracSelIn_uid256_sqrtFPL_uid63_fpArccosXTest_0_to_fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_0_q : std_logic_vector (3 downto 0);
    signal reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC2_uid458_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid459_sqrtPolynomialEvaluator_0_to_prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid458_sqrtTableGenerator_lutmem_0_to_prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_1_q : std_logic_vector (11 downto 0);
    signal reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q : std_logic_vector (15 downto 0);
    signal reg_s1_uid461_uid464_sqrtPolynomialEvaluator_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_1_q : std_logic_vector (22 downto 0);
    signal reg_expX_uid216_sqrtFPL_uid63_fpArccosXTest_0_to_expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_0_q : std_logic_vector (7 downto 0);
    signal reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_1_q : std_logic_vector (7 downto 0);
    signal reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_2_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStage0Idx1_uid272_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_3_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStage0Idx2_uid275_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_4_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid288_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_2_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStage1Idx1_uid281_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_3_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStage1Idx2_uid284_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_4_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStage1Idx3_uid287_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_5_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid293_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_sAddr_uid71_fpArccosXTest_0_to_memoryC2_uid298_arcsinXO2XTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid299_arcsinXO2XPolyEval_0_to_prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid298_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_1_q : std_logic_vector (11 downto 0);
    signal reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_q : std_logic_vector (14 downto 0);
    signal reg_s1_uid301_uid304_arcsinXO2XPolyEval_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_1_q : std_logic_vector (20 downto 0);
    signal reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_2_q : std_logic_vector (0 downto 0);
    signal reg_fracY_uid318_arcsinL_uid78_fpArccosXTest_0_to_fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_1_q : std_logic_vector (22 downto 0);
    signal reg_SqrtFPL22dto0_uid64_fpArccosXTest_0_to_fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_1_q : std_logic_vector (22 downto 0);
    signal reg_exc_R_uid335_arcsinL_uid78_fpArccosXTest_0_to_excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_2_q : std_logic_vector (0 downto 0);
    signal reg_add_one_fracY_uid318_uid319_uid319_arcsinL_uid78_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_1_q : std_logic_vector (23 downto 0);
    signal reg_expY_uid313_arcsinL_uid78_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_1_q : std_logic_vector (7 downto 0);
    signal reg_expFracPreRound_uid373_arcsinL_uid78_fpArccosXTest_0_to_expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_0_q : std_logic_vector (34 downto 0);
    signal reg_roundBitAndNormalizationOp_uid375_arcsinL_uid78_fpArccosXTest_0_to_expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_1_q : std_logic_vector (25 downto 0);
    signal reg_expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_0_to_expUdf_uid381_arcsinL_uid78_fpArccosXTest_1_q : std_logic_vector (11 downto 0);
    signal reg_exc_I_uid329_arcsinL_uid78_fpArccosXTest_0_to_excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_2_q : std_logic_vector (0 downto 0);
    signal reg_concExc_uid398_arcsinL_uid78_fpArccosXTest_0_to_excREnc_uid399_arcsinL_uid78_fpArccosXTest_0_q : std_logic_vector (2 downto 0);
    signal reg_fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_0_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_3_q : std_logic_vector (22 downto 0);
    signal reg_expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_0_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_3_q : std_logic_vector (7 downto 0);
    signal reg_signX_uid314_arcsinL_uid78_fpArccosXTest_0_to_signR_uid380_arcsinL_uid78_fpArccosXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_rightShiftStageSel4Dto3_uid421_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_oFracArcsinL_uid80_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_2_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStage0Idx1_uid416_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_3_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStage0Idx2_uid419_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_4_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid432_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid437_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_pad_fxpArcsinL_uid85_uid86_fpArccosXTest_0_to_path1NegCase_uid86_fpArccosXTest_1_q : std_logic_vector (26 downto 0);
    signal reg_path1NegCaseN_uid88_fpArccosXTest_0_to_path1NegCaseExp_uid92_fpArccosXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_mAddr_uid98_fpArccosXTest_0_to_memoryC2_uid442_arccosXO2TabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid442_arccosXO2TabGen_lutmem_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_1_q : std_logic_vector (11 downto 0);
    signal reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_q : std_logic_vector (14 downto 0);
    signal reg_s1_uid445_uid448_arccosXO2PolyEval_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_1_q : std_logic_vector (23 downto 0);
    signal reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_pad_pi2_uid102_uid103_fpArccosXTest_0_to_path2Diff_uid103_fpArccosXTest_0_q : std_logic_vector (27 downto 0);
    signal reg_fxpArccosX_uid101_fpArccosXTest_0_to_path2Diff_uid103_fpArccosXTest_1_q : std_logic_vector (26 downto 0);
    signal reg_Path1ResFP22dto0_uid121_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_2_q : std_logic_vector (22 downto 0);
    signal reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_q : std_logic_vector (22 downto 0);
    signal reg_Path1ResFP30dto23_uid124_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_2_q : std_logic_vector (7 downto 0);
    signal reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q : std_logic_vector (7 downto 0);
    signal reg_outMuxSelEnc_uid129_fpArccosXTest_0_to_expRPostExc_uid131_fpArccosXTest_1_q : std_logic_vector (1 downto 0);
    signal ld_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q_to_sPPolyEval_uid72_fpArccosXTest_a_q : std_logic_vector (23 downto 0);
    signal ld_R_uid411_arcsinL_uid78_fpArccosXTest_q_to_path1ResFP_uid96_fpArccosXTest_c_q : std_logic_vector (31 downto 0);
    signal ld_path2PosCaseFPFraction_uid113_fpArccosXTest_b_to_path2PosCaseFP_uid114_fpArccosXTest_a_q : std_logic_vector (22 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path2ResFP_uid116_fpArccosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_pathSelBits_uid117_fpArccosXTest_c_q : std_logic_vector (0 downto 0);
    signal ld_outMuxSelEnc_uid129_fpArccosXTest_q_to_fracRPostExc_uid130_fpArccosXTest_b_q : std_logic_vector (1 downto 0);
    signal ld_vCount_uid176_fpLOut1_uid57_fpArccosXTest_q_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid169_fpLOut1_uid57_fpArccosXTest_q_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_f_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid209_fpLOut1_uid57_fpArccosXTest_q_to_vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest_c_q : std_logic_vector (5 downto 0);
    signal ld_expOddSelect_uid242_sqrtFPL_uid63_fpArccosXTest_q_to_expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b_to_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_a_q : std_logic_vector (22 downto 0);
    signal ld_InvSignX_uid250_sqrtFPL_uid63_fpArccosXTest_q_to_inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid218_sqrtFPL_uid63_fpArccosXTest_b_to_minReg_uid252_sqrtFPL_uid63_fpArccosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_q_to_join_uid255_sqrtFPL_uid63_fpArccosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q_to_fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_b_q : std_logic_vector (1 downto 0);
    signal ld_negZero_uid266_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_c_q : std_logic_vector (0 downto 0);
    signal ld_expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_q_to_exc_I_uid329_arcsinL_uid78_fpArccosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_q_to_exc_I_uid329_arcsinL_uid78_fpArccosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q_to_InvExpXIsZero_uid334_arcsinL_uid78_fpArccosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_InvExc_N_uid332_arcsinL_uid78_fpArccosXTest_q_to_exc_R_uid335_arcsinL_uid78_fpArccosXTest_c_q : std_logic_vector (0 downto 0);
    signal ld_expSum_uid352_arcsinL_uid78_fpArccosXTest_q_to_expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_a_q : std_logic_vector (8 downto 0);
    signal ld_reg_signX_uid314_arcsinL_uid78_fpArccosXTest_0_to_signR_uid380_arcsinL_uid78_fpArccosXTest_1_q_to_signR_uid380_arcsinL_uid78_fpArccosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_reg_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_1_q_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q_to_excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid335_arcsinL_uid78_fpArccosXTest_q_to_excZC3_uid387_arcsinL_uid78_fpArccosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid351_arcsinL_uid78_fpArccosXTest_q_to_excZC3_uid387_arcsinL_uid78_fpArccosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid329_arcsinL_uid78_fpArccosXTest_q_to_excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid331_arcsinL_uid78_fpArccosXTest_q_to_excRNaN_uid397_arcsinL_uid78_fpArccosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid397_arcsinL_uid78_fpArccosXTest_q_to_concExc_uid398_arcsinL_uid78_fpArccosXTest_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_0_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_3_q_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_d_q : std_logic_vector (22 downto 0);
    signal ld_reg_expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_0_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_3_q_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_d_q : std_logic_vector (7 downto 0);
    signal ld_signR_uid380_arcsinL_uid78_fpArccosXTest_q_to_signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_q_to_R_uid411_arcsinL_uid78_fpArccosXTest_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_0_q_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_a_q : std_logic_vector (7 downto 0);
    signal ld_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC1_uid441_arccosXO2TabGen_lutmem_0_q_to_memoryC1_uid441_arccosXO2TabGen_lutmem_a_q : std_logic_vector (7 downto 0);
    signal ld_fpLOutFrac_uid59_fpArccosXTest_b_to_reg_fpLOutFrac_uid59_fpArccosXTest_0_to_fpL_uid61_fpArccosXTest_0_a_q : std_logic_vector (22 downto 0);
    signal ld_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_q_to_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_yT1_uid443_arccosXO2PolyEval_b_to_reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0_a_q : std_logic_vector (11 downto 0);
    signal ld_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q_to_sPPolyEval_uid72_fpArccosXTest_a_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_reset0 : std_logic;
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_eq : std_logic;
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_sticky_ena_q : signal is true;
    signal ld_R_uid411_arcsinL_uid78_fpArccosXTest_q_to_path1ResFP_uid96_fpArccosXTest_c_inputreg_q : std_logic_vector (31 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_reset0 : std_logic;
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_eq : std_logic;
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_sticky_ena_q : signal is true;
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_reset0 : std_logic;
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_eq : std_logic;
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_sticky_ena_q : signal is true;
    signal ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_reset0 : std_logic;
    signal ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_sticky_ena_q : signal is true;
    signal ld_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b_to_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_reset0 : std_logic;
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_eq : std_logic;
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_sticky_ena_q : signal is true;
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_reset0 : std_logic;
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_sticky_ena_q : signal is true;
    signal ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_reset0 : std_logic;
    signal ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_sticky_ena_q : signal is true;
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_reset0 : std_logic;
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_ia : std_logic_vector (15 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_iq : std_logic_vector (15 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_q : std_logic_vector (15 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_sticky_ena_q : signal is true;
    signal ld_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_0_q_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_a_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC1_uid441_arccosXO2TabGen_lutmem_0_q_to_memoryC1_uid441_arccosXO2TabGen_lutmem_a_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_sticky_ena_q : signal is true;
    signal ld_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_q_to_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_inputreg_q : std_logic_vector (14 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_sticky_ena_q : signal is true;
    signal ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_yT1_uid443_arccosXO2PolyEval_b_to_reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0_a_inputreg_q : std_logic_vector (11 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_inputreg_q : std_logic_vector (14 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_eq : std_logic;
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_sticky_ena_q : signal is true;
    signal ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_reset0 : std_logic;
    signal ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_sticky_ena_q : signal is true;
    signal pad_o_uid18_uid54_fpArccosXTest_q : std_logic_vector (35 downto 0);
    signal pad_pi2_uid102_uid103_fpArccosXTest_q : std_logic_vector (27 downto 0);
    signal vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_a : std_logic_vector(8 downto 0);
    signal vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector(8 downto 0);
    signal vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_o : std_logic_vector (8 downto 0);
    signal vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_cin : std_logic_vector (0 downto 0);
    signal vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_c : std_logic_vector (0 downto 0);
    signal expUdf_uid381_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(14 downto 0);
    signal expUdf_uid381_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(14 downto 0);
    signal expUdf_uid381_arcsinL_uid78_fpArccosXTest_o : std_logic_vector (14 downto 0);
    signal expUdf_uid381_arcsinL_uid78_fpArccosXTest_cin : std_logic_vector (0 downto 0);
    signal expUdf_uid381_arcsinL_uid78_fpArccosXTest_n : std_logic_vector (0 downto 0);
    signal expOvf_uid383_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(14 downto 0);
    signal expOvf_uid383_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(14 downto 0);
    signal expOvf_uid383_arcsinL_uid78_fpArccosXTest_o : std_logic_vector (14 downto 0);
    signal expOvf_uid383_arcsinL_uid78_fpArccosXTest_cin : std_logic_vector (0 downto 0);
    signal expOvf_uid383_arcsinL_uid78_fpArccosXTest_n : std_logic_vector (0 downto 0);
    signal path2PosCaseFP_uid114_fpArccosXTest_q : std_logic_vector (31 downto 0);
    signal excSelBits_uid128_fpArccosXTest_q : std_logic_vector (2 downto 0);
    signal InvExpXIsZero_uid334_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid334_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal expX_uid6_fpArccosXTest_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid7_fpArccosXTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid7_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal singX_uid8_fpArccosXTest_in : std_logic_vector (31 downto 0);
    signal singX_uid8_fpArccosXTest_b : std_logic_vector (0 downto 0);
    signal expXIsZero_uid24_fpArccosXTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid24_fpArccosXTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid24_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid26_fpArccosXTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid26_fpArccosXTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid26_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid28_fpArccosXTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid28_fpArccosXTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid28_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid29_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid29_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid29_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal expGT0_uid36_fpArccosXTest_a : std_logic_vector(10 downto 0);
    signal expGT0_uid36_fpArccosXTest_b : std_logic_vector(10 downto 0);
    signal expGT0_uid36_fpArccosXTest_o : std_logic_vector (10 downto 0);
    signal expGT0_uid36_fpArccosXTest_cin : std_logic_vector (0 downto 0);
    signal expGT0_uid36_fpArccosXTest_c : std_logic_vector (0 downto 0);
    signal expEQ0_uid37_fpArccosXTest_a : std_logic_vector(7 downto 0);
    signal expEQ0_uid37_fpArccosXTest_b : std_logic_vector(7 downto 0);
    signal expEQ0_uid37_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid38_fpArccosXTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid38_fpArccosXTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid38_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal shiftValue_uid43_fpArccosXTest_a : std_logic_vector(11 downto 0);
    signal shiftValue_uid43_fpArccosXTest_b : std_logic_vector(11 downto 0);
    signal shiftValue_uid43_fpArccosXTest_o : std_logic_vector (11 downto 0);
    signal shiftValue_uid43_fpArccosXTest_cin : std_logic_vector (0 downto 0);
    signal shiftValue_uid43_fpArccosXTest_n : std_logic_vector (0 downto 0);
    signal shiftValuePre_uid44_fpArccosXTest_a : std_logic_vector(8 downto 0);
    signal shiftValuePre_uid44_fpArccosXTest_b : std_logic_vector(8 downto 0);
    signal shiftValuePre_uid44_fpArccosXTest_o : std_logic_vector (8 downto 0);
    signal shiftValuePre_uid44_fpArccosXTest_q : std_logic_vector (8 downto 0);
    signal oMy_uid54_fpArccosXTest_a : std_logic_vector(36 downto 0);
    signal oMy_uid54_fpArccosXTest_b : std_logic_vector(36 downto 0);
    signal oMy_uid54_fpArccosXTest_o : std_logic_vector (36 downto 0);
    signal oMy_uid54_fpArccosXTest_q : std_logic_vector (36 downto 0);
    signal expL_uid58_fpArccosXTest_a : std_logic_vector(8 downto 0);
    signal expL_uid58_fpArccosXTest_b : std_logic_vector(8 downto 0);
    signal expL_uid58_fpArccosXTest_o : std_logic_vector (8 downto 0);
    signal expL_uid58_fpArccosXTest_q : std_logic_vector (8 downto 0);
    signal srVal_uid67_fpArccosXTest_a : std_logic_vector(8 downto 0);
    signal srVal_uid67_fpArccosXTest_b : std_logic_vector(8 downto 0);
    signal srVal_uid67_fpArccosXTest_o : std_logic_vector (8 downto 0);
    signal srVal_uid67_fpArccosXTest_q : std_logic_vector (8 downto 0);
    signal path1NegCase_uid86_fpArccosXTest_a : std_logic_vector(28 downto 0);
    signal path1NegCase_uid86_fpArccosXTest_b : std_logic_vector(28 downto 0);
    signal path1NegCase_uid86_fpArccosXTest_o : std_logic_vector (28 downto 0);
    signal path1NegCase_uid86_fpArccosXTest_q : std_logic_vector (28 downto 0);
    signal path1NegCaseExp_uid92_fpArccosXTest_a : std_logic_vector(8 downto 0);
    signal path1NegCaseExp_uid92_fpArccosXTest_b : std_logic_vector(8 downto 0);
    signal path1NegCaseExp_uid92_fpArccosXTest_o : std_logic_vector (8 downto 0);
    signal path1NegCaseExp_uid92_fpArccosXTest_q : std_logic_vector (8 downto 0);
    signal path2Diff_uid103_fpArccosXTest_a : std_logic_vector(28 downto 0);
    signal path2Diff_uid103_fpArccosXTest_b : std_logic_vector(28 downto 0);
    signal path2Diff_uid103_fpArccosXTest_o : std_logic_vector (28 downto 0);
    signal path2Diff_uid103_fpArccosXTest_q : std_logic_vector (28 downto 0);
    signal expRCalc_uid125_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal expRCalc_uid125_fpArccosXTest_q : std_logic_vector (7 downto 0);
    signal outMuxSelEnc_uid129_fpArccosXTest_q : std_logic_vector(1 downto 0);
    signal expRPostExc_uid131_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid131_fpArccosXTest_q : std_logic_vector (7 downto 0);
    signal rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_q : std_logic_vector (36 downto 0);
    signal vCount_uid169_fpLOut1_uid57_fpArccosXTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid169_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid169_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid173_fpLOut1_uid57_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid173_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid176_fpLOut1_uid57_fpArccosXTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid176_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid176_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid180_fpLOut1_uid57_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid180_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid190_fpLOut1_uid57_fpArccosXTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid190_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid190_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid194_fpLOut1_uid57_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid194_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (34 downto 0);
    signal fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid228_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid228_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid228_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(8 downto 0);
    signal expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector(8 downto 0);
    signal expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_o : std_logic_vector (8 downto 0);
    signal expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector (8 downto 0);
    signal expOddSig_uid239_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(8 downto 0);
    signal expOddSig_uid239_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector(8 downto 0);
    signal expOddSig_uid239_sqrtFPL_uid63_fpArccosXTest_o : std_logic_vector (8 downto 0);
    signal expOddSig_uid239_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector (8 downto 0);
    signal inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal minInf_uid253_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal minInf_uid253_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal minInf_uid253_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(1 downto 0);
    signal expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector (7 downto 0);
    signal rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid329_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid329_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid329_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid345_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid345_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid345_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(36 downto 0);
    signal expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(36 downto 0);
    signal expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_o : std_logic_vector (36 downto 0);
    signal expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (35 downto 0);
    signal excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal excZC3_uid387_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal excZC3_uid387_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal excZC3_uid387_arcsinL_uid78_fpArccosXTest_c : std_logic_vector(0 downto 0);
    signal excZC3_uid387_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal excRZero_uid388_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid388_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid388_arcsinL_uid78_fpArccosXTest_c : std_logic_vector(0 downto 0);
    signal excRZero_uid388_arcsinL_uid78_fpArccosXTest_d : std_logic_vector(0 downto 0);
    signal excRZero_uid388_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid392_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid392_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid392_arcsinL_uid78_fpArccosXTest_c : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid392_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal excRInf_uid393_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal excRInf_uid393_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal excRInf_uid393_arcsinL_uid78_fpArccosXTest_c : std_logic_vector(0 downto 0);
    signal excRInf_uid393_arcsinL_uid78_fpArccosXTest_d : std_logic_vector(0 downto 0);
    signal excRInf_uid393_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid395_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid395_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid395_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid396_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid396_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid396_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal excREnc_uid399_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (7 downto 0);
    signal signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal piF_uid119_fpArccosXTest_in : std_logic_vector (26 downto 0);
    signal piF_uid119_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal fracRCalc_uid122_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal fracRCalc_uid122_fpArccosXTest_q : std_logic_vector (22 downto 0);
    signal normalizeBit_uid356_arcsinL_uid78_fpArccosXTest_in : std_logic_vector (47 downto 0);
    signal normalizeBit_uid356_arcsinL_uid78_fpArccosXTest_b : std_logic_vector (0 downto 0);
    signal fracRPostNormHigh_uid358_arcsinL_uid78_fpArccosXTest_in : std_logic_vector (46 downto 0);
    signal fracRPostNormHigh_uid358_arcsinL_uid78_fpArccosXTest_b : std_logic_vector (23 downto 0);
    signal fracRPostNormLow_uid359_arcsinL_uid78_fpArccosXTest_in : std_logic_vector (45 downto 0);
    signal fracRPostNormLow_uid359_arcsinL_uid78_fpArccosXTest_b : std_logic_vector (23 downto 0);
    signal stickyRange_uid361_arcsinL_uid78_fpArccosXTest_in : std_logic_vector (21 downto 0);
    signal stickyRange_uid361_arcsinL_uid78_fpArccosXTest_b : std_logic_vector (21 downto 0);
    signal Prod22_uid362_arcsinL_uid78_fpArccosXTest_in : std_logic_vector (22 downto 0);
    signal Prod22_uid362_arcsinL_uid78_fpArccosXTest_b : std_logic_vector (0 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmp_a : std_logic_vector(2 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmp_b : std_logic_vector(2 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmp_q : std_logic_vector(0 downto 0);
    signal prodXYTruncFR_uid473_pT1_uid300_arcsinXO2XPolyEval_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid473_pT1_uid300_arcsinXO2XPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid476_pT2_uid306_arcsinXO2XPolyEval_in : std_logic_vector (35 downto 0);
    signal prodXYTruncFR_uid476_pT2_uid306_arcsinXO2XPolyEval_b : std_logic_vector (21 downto 0);
    signal prodXYTruncFR_uid479_pT1_uid444_arccosXO2PolyEval_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid479_pT1_uid444_arccosXO2PolyEval_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid482_pT2_uid450_arccosXO2PolyEval_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid482_pT2_uid450_arccosXO2PolyEval_b : std_logic_vector (24 downto 0);
    signal prodXYTruncFR_uid485_pT1_uid460_sqrtPolynomialEvaluator_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid485_pT1_uid460_sqrtPolynomialEvaluator_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid488_pT2_uid466_sqrtPolynomialEvaluator_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid488_pT2_uid466_sqrtPolynomialEvaluator_b : std_logic_vector (23 downto 0);
    signal sPPolyEval_uid72_fpArccosXTest_in : std_logic_vector (15 downto 0);
    signal sPPolyEval_uid72_fpArccosXTest_b : std_logic_vector (14 downto 0);
    signal fracRPostExc_uid130_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid130_fpArccosXTest_q : std_logic_vector (22 downto 0);
    signal FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_in : std_logic_vector (15 downto 0);
    signal FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector (15 downto 0);
    signal concExc_uid398_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (2 downto 0);
    signal R_uid411_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (31 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmp_a : std_logic_vector(6 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmp_b : std_logic_vector(6 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmp_a : std_logic_vector(6 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmp_b : std_logic_vector(6 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmp_a : std_logic_vector(5 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmp_b : std_logic_vector(5 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_nor_q : std_logic_vector(0 downto 0);
    signal oFracX_uid42_uid42_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal InvExpXIsZero_uid34_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid34_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid30_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid30_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid33_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid33_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid39_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid39_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal fxpShifterBits_uid46_fpArccosXTest_in : std_logic_vector (5 downto 0);
    signal fxpShifterBits_uid46_fpArccosXTest_b : std_logic_vector (5 downto 0);
    signal l_uid56_fpArccosXTest_in : std_logic_vector (34 downto 0);
    signal l_uid56_fpArccosXTest_b : std_logic_vector (34 downto 0);
    signal expLRange_uid60_fpArccosXTest_in : std_logic_vector (7 downto 0);
    signal expLRange_uid60_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal srValRange_uid68_fpArccosXTest_in : std_logic_vector (4 downto 0);
    signal srValRange_uid68_fpArccosXTest_b : std_logic_vector (4 downto 0);
    signal path1NegCaseN_uid88_fpArccosXTest_in : std_logic_vector (27 downto 0);
    signal path1NegCaseN_uid88_fpArccosXTest_b : std_logic_vector (0 downto 0);
    signal path1NegCaseFracHigh_uid89_fpArccosXTest_in : std_logic_vector (26 downto 0);
    signal path1NegCaseFracHigh_uid89_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal path1NegCaseFracLow_uid90_fpArccosXTest_in : std_logic_vector (25 downto 0);
    signal path1NegCaseFracLow_uid90_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal path1NegCaseExpRange_uid93_fpArccosXTest_in : std_logic_vector (7 downto 0);
    signal path1NegCaseExpRange_uid93_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal normBit_uid105_fpArccosXTest_in : std_logic_vector (27 downto 0);
    signal normBit_uid105_fpArccosXTest_b : std_logic_vector (0 downto 0);
    signal path2NegCaseFPFrac_uid106_fpArccosXTest_in : std_logic_vector (26 downto 0);
    signal path2NegCaseFPFrac_uid106_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal path2NegCaseFPFrac_uid109_fpArccosXTest_in : std_logic_vector (25 downto 0);
    signal path2NegCaseFPFrac_uid109_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal sR_uid132_fpArccosXTest_q : std_logic_vector (31 downto 0);
    signal RightShiftStage136dto1_uid155_fxpX_uid50_fpArccosXTest_in : std_logic_vector (36 downto 0);
    signal RightShiftStage136dto1_uid155_fxpX_uid50_fpArccosXTest_b : std_logic_vector (35 downto 0);
    signal RightShiftStage136dto2_uid158_fxpX_uid50_fpArccosXTest_in : std_logic_vector (36 downto 0);
    signal RightShiftStage136dto2_uid158_fxpX_uid50_fpArccosXTest_b : std_logic_vector (34 downto 0);
    signal RightShiftStage136dto3_uid161_fxpX_uid50_fpArccosXTest_in : std_logic_vector (36 downto 0);
    signal RightShiftStage136dto3_uid161_fxpX_uid50_fpArccosXTest_b : std_logic_vector (33 downto 0);
    signal rVStage_uid175_fpLOut1_uid57_fpArccosXTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid175_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid178_fpLOut1_uid57_fpArccosXTest_in : std_logic_vector (18 downto 0);
    signal vStage_uid178_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector (18 downto 0);
    signal rVStage_uid182_fpLOut1_uid57_fpArccosXTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid182_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid185_fpLOut1_uid57_fpArccosXTest_in : std_logic_vector (26 downto 0);
    signal vStage_uid185_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector (26 downto 0);
    signal rVStage_uid196_fpLOut1_uid57_fpArccosXTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid196_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid199_fpLOut1_uid57_fpArccosXTest_in : std_logic_vector (32 downto 0);
    signal vStage_uid199_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector (32 downto 0);
    signal InvFracXIsZero_uid229_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid229_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid232_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid232_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal expREven_uid237_sqrtFPL_uid63_fpArccosXTest_in : std_logic_vector (8 downto 0);
    signal expREven_uid237_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal expROdd_uid240_sqrtFPL_uid63_fpArccosXTest_in : std_logic_vector (8 downto 0);
    signal expROdd_uid240_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal RightShiftStage123dto1_uid290_alignSqrt_uid69_fpArccosXTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage123dto1_uid290_alignSqrt_uid69_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal InvFracXIsZero_uid330_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid330_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid333_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid333_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid346_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid346_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid349_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid349_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_in : std_logic_vector (23 downto 0);
    signal fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_in : std_logic_vector (35 downto 0);
    signal expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_b : std_logic_vector (11 downto 0);
    signal RightShiftStage023dto2_uid423_alignArcsinL_uid84_fpArccosXTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage023dto2_uid423_alignArcsinL_uid84_fpArccosXTest_b : std_logic_vector (21 downto 0);
    signal RightShiftStage023dto4_uid426_alignArcsinL_uid84_fpArccosXTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage023dto4_uid426_alignArcsinL_uid84_fpArccosXTest_b : std_logic_vector (19 downto 0);
    signal RightShiftStage023dto6_uid429_alignArcsinL_uid84_fpArccosXTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage023dto6_uid429_alignArcsinL_uid84_fpArccosXTest_b : std_logic_vector (17 downto 0);
    signal fracRPostNorm_uid360_arcsinL_uid78_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal fracRPostNorm_uid360_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal extraStickyBit_uid363_arcsinL_uid78_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal extraStickyBit_uid363_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (0 downto 0);
    signal stickyExtendedRange_uid364_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (22 downto 0);
    signal lowRangeB_uid301_arcsinXO2XPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid301_arcsinXO2XPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid302_arcsinXO2XPolyEval_in : std_logic_vector (12 downto 0);
    signal highBBits_uid302_arcsinXO2XPolyEval_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid307_arcsinXO2XPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid307_arcsinXO2XPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid308_arcsinXO2XPolyEval_in : std_logic_vector (21 downto 0);
    signal highBBits_uid308_arcsinXO2XPolyEval_b : std_logic_vector (19 downto 0);
    signal lowRangeB_uid445_arccosXO2PolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid445_arccosXO2PolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid446_arccosXO2PolyEval_in : std_logic_vector (12 downto 0);
    signal highBBits_uid446_arccosXO2PolyEval_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid451_arccosXO2PolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid451_arccosXO2PolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid452_arccosXO2PolyEval_in : std_logic_vector (24 downto 0);
    signal highBBits_uid452_arccosXO2PolyEval_b : std_logic_vector (22 downto 0);
    signal lowRangeB_uid461_sqrtPolynomialEvaluator_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid461_sqrtPolynomialEvaluator_b : std_logic_vector (0 downto 0);
    signal highBBits_uid462_sqrtPolynomialEvaluator_in : std_logic_vector (12 downto 0);
    signal highBBits_uid462_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid467_sqrtPolynomialEvaluator_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid467_sqrtPolynomialEvaluator_b : std_logic_vector (1 downto 0);
    signal highBBits_uid468_sqrtPolynomialEvaluator_in : std_logic_vector (23 downto 0);
    signal highBBits_uid468_sqrtPolynomialEvaluator_b : std_logic_vector (21 downto 0);
    signal yT1_uid299_arcsinXO2XPolyEval_in : std_logic_vector (14 downto 0);
    signal yT1_uid299_arcsinXO2XPolyEval_b : std_logic_vector (11 downto 0);
    signal yT1_uid459_sqrtPolynomialEvaluator_in : std_logic_vector (15 downto 0);
    signal yT1_uid459_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal ArcsinL22dto0_uid79_fpArccosXTest_in : std_logic_vector (22 downto 0);
    signal ArcsinL22dto0_uid79_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal ArcsinL30dto23_uid81_fpArccosXTest_in : std_logic_vector (30 downto 0);
    signal ArcsinL30dto23_uid81_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal oFracXExt_uid49_fpArccosXTest_q : std_logic_vector (36 downto 0);
    signal exc_N_uid31_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid31_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid31_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal expXZFracNotZero_uid40_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal expXZFracNotZero_uid40_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal expXZFracNotZero_uid40_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal shiftValue_uid47_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal shiftValue_uid47_fpArccosXTest_q : std_logic_vector (5 downto 0);
    signal rVStage_uid168_fpLOut1_uid57_fpArccosXTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid168_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid171_fpLOut1_uid57_fpArccosXTest_in : std_logic_vector (2 downto 0);
    signal vStage_uid171_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector (2 downto 0);
    signal fpL_uid61_fpArccosXTest_q : std_logic_vector (31 downto 0);
    signal rightShiftStageSel4Dto3_uid277_alignSqrt_uid69_fpArccosXTest_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid277_alignSqrt_uid69_fpArccosXTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid288_alignSqrt_uid69_fpArccosXTest_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid288_alignSqrt_uid69_fpArccosXTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid293_alignSqrt_uid69_fpArccosXTest_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid293_alignSqrt_uid69_fpArccosXTest_b : std_logic_vector (0 downto 0);
    signal path1NegCaseUR_uid94_fpArccosXTest_q : std_logic_vector (31 downto 0);
    signal path2NegCaseFPL_uid107_fpArccosXTest_q : std_logic_vector (31 downto 0);
    signal path2NegCaseFPS_uid110_fpArccosXTest_q : std_logic_vector (31 downto 0);
    signal rightShiftStage2Idx1_uid157_fxpX_uid50_fpArccosXTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage2Idx2_uid160_fxpX_uid50_fpArccosXTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage2Idx3_uid163_fxpX_uid50_fpArccosXTest_q : std_logic_vector (36 downto 0);
    signal cStage_uid179_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid183_fpLOut1_uid57_fpArccosXTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid183_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid183_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid186_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid197_fpLOut1_uid57_fpArccosXTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid197_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid197_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid200_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (34 downto 0);
    signal exc_N_uid230_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid230_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid230_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1_uid292_alignSqrt_uid69_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal exc_N_uid331_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid331_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid331_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal exc_R_uid335_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid335_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid335_arcsinL_uid78_fpArccosXTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid335_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid347_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid347_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid347_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_in : std_logic_vector (7 downto 0);
    signal expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal rightShiftStage1Idx1_uid425_alignArcsinL_uid84_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx2_uid428_alignArcsinL_uid84_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx3_uid431_alignArcsinL_uid84_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal FracRPostNorm1dto0_uid368_arcsinL_uid78_fpArccosXTest_in : std_logic_vector (1 downto 0);
    signal FracRPostNorm1dto0_uid368_arcsinL_uid78_fpArccosXTest_b : std_logic_vector (1 downto 0);
    signal expFracPreRound_uid373_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (34 downto 0);
    signal stickyRangeComparator_uid366_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(22 downto 0);
    signal stickyRangeComparator_uid366_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(22 downto 0);
    signal stickyRangeComparator_uid366_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal sumAHighB_uid303_arcsinXO2XPolyEval_a : std_logic_vector(19 downto 0);
    signal sumAHighB_uid303_arcsinXO2XPolyEval_b : std_logic_vector(19 downto 0);
    signal sumAHighB_uid303_arcsinXO2XPolyEval_o : std_logic_vector (19 downto 0);
    signal sumAHighB_uid303_arcsinXO2XPolyEval_q : std_logic_vector (19 downto 0);
    signal sumAHighB_uid309_arcsinXO2XPolyEval_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid309_arcsinXO2XPolyEval_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid309_arcsinXO2XPolyEval_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid309_arcsinXO2XPolyEval_q : std_logic_vector (30 downto 0);
    signal sumAHighB_uid447_arccosXO2PolyEval_a : std_logic_vector(22 downto 0);
    signal sumAHighB_uid447_arccosXO2PolyEval_b : std_logic_vector(22 downto 0);
    signal sumAHighB_uid447_arccosXO2PolyEval_o : std_logic_vector (22 downto 0);
    signal sumAHighB_uid447_arccosXO2PolyEval_q : std_logic_vector (22 downto 0);
    signal sumAHighB_uid453_arccosXO2PolyEval_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid453_arccosXO2PolyEval_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid453_arccosXO2PolyEval_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid453_arccosXO2PolyEval_q : std_logic_vector (30 downto 0);
    signal sumAHighB_uid463_sqrtPolynomialEvaluator_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid463_sqrtPolynomialEvaluator_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid463_sqrtPolynomialEvaluator_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid463_sqrtPolynomialEvaluator_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid469_sqrtPolynomialEvaluator_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid469_sqrtPolynomialEvaluator_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid469_sqrtPolynomialEvaluator_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid469_sqrtPolynomialEvaluator_q : std_logic_vector (29 downto 0);
    signal oFracArcsinL_uid80_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal srValArcsinL_uid82_fpArccosXTest_a : std_logic_vector(8 downto 0);
    signal srValArcsinL_uid82_fpArccosXTest_b : std_logic_vector(8 downto 0);
    signal srValArcsinL_uid82_fpArccosXTest_o : std_logic_vector (8 downto 0);
    signal srValArcsinL_uid82_fpArccosXTest_q : std_logic_vector (8 downto 0);
    signal X36dto16_uid135_fxpX_uid50_fpArccosXTest_in : std_logic_vector (36 downto 0);
    signal X36dto16_uid135_fxpX_uid50_fpArccosXTest_b : std_logic_vector (20 downto 0);
    signal X36dto32_uid138_fxpX_uid50_fpArccosXTest_in : std_logic_vector (36 downto 0);
    signal X36dto32_uid138_fxpX_uid50_fpArccosXTest_b : std_logic_vector (4 downto 0);
    signal InvExc_N_uid32_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid32_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal inputOutOfRange_uid41_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal inputOutOfRange_uid41_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal inputOutOfRange_uid41_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStageSel5Dto4_uid142_fxpX_uid50_fpArccosXTest_in : std_logic_vector (5 downto 0);
    signal rightShiftStageSel5Dto4_uid142_fxpX_uid50_fpArccosXTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel3Dto2_uid153_fxpX_uid50_fpArccosXTest_in : std_logic_vector (3 downto 0);
    signal rightShiftStageSel3Dto2_uid153_fxpX_uid50_fpArccosXTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel1Dto0_uid164_fxpX_uid50_fpArccosXTest_in : std_logic_vector (1 downto 0);
    signal rightShiftStageSel1Dto0_uid164_fxpX_uid50_fpArccosXTest_b : std_logic_vector (1 downto 0);
    signal cStage_uid172_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (34 downto 0);
    signal expX_uid216_sqrtFPL_uid63_fpArccosXTest_in : std_logic_vector (30 downto 0);
    signal expX_uid216_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid217_sqrtFPL_uid63_fpArccosXTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal signX_uid218_sqrtFPL_uid63_fpArccosXTest_in : std_logic_vector (31 downto 0);
    signal signX_uid218_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector (0 downto 0);
    signal rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal path1ResFP_uid96_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal path1ResFP_uid96_fpArccosXTest_q : std_logic_vector (31 downto 0);
    signal path2NegCaseFP_uid112_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal path2NegCaseFP_uid112_fpArccosXTest_q : std_logic_vector (31 downto 0);
    signal rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_q : std_logic_vector (36 downto 0);
    signal vStagei_uid187_fpLOut1_uid57_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid187_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (34 downto 0);
    signal vStagei_uid201_fpLOut1_uid57_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid201_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (34 downto 0);
    signal InvExc_N_uid231_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid231_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal InvExc_N_uid332_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid332_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid348_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid348_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid397_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid397_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid397_arcsinL_uid78_fpArccosXTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid397_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal sticky_uid367_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal sticky_uid367_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal s1_uid301_uid304_arcsinXO2XPolyEval_q : std_logic_vector (20 downto 0);
    signal s2_uid307_uid310_arcsinXO2XPolyEval_q : std_logic_vector (32 downto 0);
    signal s1_uid445_uid448_arccosXO2PolyEval_q : std_logic_vector (23 downto 0);
    signal s2_uid451_uid454_arccosXO2PolyEval_q : std_logic_vector (32 downto 0);
    signal s1_uid461_uid464_sqrtPolynomialEvaluator_q : std_logic_vector (22 downto 0);
    signal s2_uid467_uid470_sqrtPolynomialEvaluator_q : std_logic_vector (31 downto 0);
    signal X23dto8_uid414_alignArcsinL_uid84_fpArccosXTest_in : std_logic_vector (23 downto 0);
    signal X23dto8_uid414_alignArcsinL_uid84_fpArccosXTest_b : std_logic_vector (15 downto 0);
    signal X23dto16_uid417_alignArcsinL_uid84_fpArccosXTest_in : std_logic_vector (23 downto 0);
    signal X23dto16_uid417_alignArcsinL_uid84_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal srValArcsinLRange_uid83_fpArccosXTest_in : std_logic_vector (4 downto 0);
    signal srValArcsinLRange_uid83_fpArccosXTest_b : std_logic_vector (4 downto 0);
    signal rightShiftStage0Idx1_uid137_fxpX_uid50_fpArccosXTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage0Idx2_uid140_fxpX_uid50_fpArccosXTest_q : std_logic_vector (36 downto 0);
    signal exc_R_uid35_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid35_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid35_fpArccosXTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid35_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal xRegAndOutOfRange_uid126_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal xRegAndOutOfRange_uid126_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal xRegAndOutOfRange_uid126_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_q : std_logic_vector (36 downto 0);
    signal expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal expX0_uid241_sqrtFPL_uid63_fpArccosXTest_in : std_logic_vector (0 downto 0);
    signal expX0_uid241_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector (0 downto 0);
    signal fracXAddr_uid245_sqrtFPL_uid63_fpArccosXTest_in : std_logic_vector (22 downto 0);
    signal fracXAddr_uid245_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector (6 downto 0);
    signal InvSignX_uid250_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid250_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal RightShiftStage023dto2_uid279_alignSqrt_uid69_fpArccosXTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage023dto2_uid279_alignSqrt_uid69_fpArccosXTest_b : std_logic_vector (21 downto 0);
    signal RightShiftStage023dto4_uid282_alignSqrt_uid69_fpArccosXTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage023dto4_uid282_alignSqrt_uid69_fpArccosXTest_b : std_logic_vector (19 downto 0);
    signal RightShiftStage023dto6_uid285_alignSqrt_uid69_fpArccosXTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage023dto6_uid285_alignSqrt_uid69_fpArccosXTest_b : std_logic_vector (17 downto 0);
    signal Path1ResFP22dto0_uid121_fpArccosXTest_in : std_logic_vector (22 downto 0);
    signal Path1ResFP22dto0_uid121_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal Path1ResFP30dto23_uid124_fpArccosXTest_in : std_logic_vector (30 downto 0);
    signal Path1ResFP30dto23_uid124_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal path2ResFP_uid116_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal path2ResFP_uid116_fpArccosXTest_q : std_logic_vector (31 downto 0);
    signal inputIsMax_uid51_fpArccosXTest_in : std_logic_vector (36 downto 0);
    signal inputIsMax_uid51_fpArccosXTest_b : std_logic_vector (0 downto 0);
    signal y_uid52_fpArccosXTest_in : std_logic_vector (35 downto 0);
    signal y_uid52_fpArccosXTest_b : std_logic_vector (34 downto 0);
    signal rVStage_uid189_fpLOut1_uid57_fpArccosXTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid189_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid192_fpLOut1_uid57_fpArccosXTest_in : std_logic_vector (30 downto 0);
    signal vStage_uid192_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector (30 downto 0);
    signal rVStage_uid203_fpLOut1_uid57_fpArccosXTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid203_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector (0 downto 0);
    signal vStage_uid206_fpLOut1_uid57_fpArccosXTest_in : std_logic_vector (33 downto 0);
    signal vStage_uid206_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector (33 downto 0);
    signal exc_R_uid234_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid234_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid234_sqrtFPL_uid63_fpArccosXTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid234_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal sAddr_uid71_fpArccosXTest_in : std_logic_vector (23 downto 0);
    signal sAddr_uid71_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal exc_R_uid351_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid351_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid351_arcsinL_uid78_fpArccosXTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid351_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal RightShiftStage123dto1_uid434_alignArcsinL_uid84_fpArccosXTest_in : std_logic_vector (23 downto 0);
    signal RightShiftStage123dto1_uid434_alignArcsinL_uid84_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal lrs_uid369_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (2 downto 0);
    signal fxpArcSinXO2XRes_uid74_fpArccosXTest_in : std_logic_vector (30 downto 0);
    signal fxpArcSinXO2XRes_uid74_fpArccosXTest_b : std_logic_vector (25 downto 0);
    signal fxpArccosX_uid101_fpArccosXTest_in : std_logic_vector (30 downto 0);
    signal fxpArccosX_uid101_fpArccosXTest_b : std_logic_vector (26 downto 0);
    signal fracR_uid249_sqrtFPL_uid63_fpArccosXTest_in : std_logic_vector (28 downto 0);
    signal fracR_uid249_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal rightShiftStage0Idx1_uid416_alignArcsinL_uid84_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage0Idx2_uid419_alignArcsinL_uid84_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStageSel4Dto3_uid421_alignArcsinL_uid84_fpArccosXTest_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid421_alignArcsinL_uid84_fpArccosXTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid432_alignArcsinL_uid84_fpArccosXTest_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid432_alignArcsinL_uid84_fpArccosXTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid437_alignArcsinL_uid84_fpArccosXTest_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid437_alignArcsinL_uid84_fpArccosXTest_b : std_logic_vector (0 downto 0);
    signal excRNaN_uid127_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid127_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid127_fpArccosXTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid127_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal RightShiftStage036dto4_uid144_fxpX_uid50_fpArccosXTest_in : std_logic_vector (36 downto 0);
    signal RightShiftStage036dto4_uid144_fxpX_uid50_fpArccosXTest_b : std_logic_vector (32 downto 0);
    signal RightShiftStage036dto8_uid147_fxpX_uid50_fpArccosXTest_in : std_logic_vector (36 downto 0);
    signal RightShiftStage036dto8_uid147_fxpX_uid50_fpArccosXTest_b : std_logic_vector (28 downto 0);
    signal RightShiftStage036dto12_uid150_fxpX_uid50_fpArccosXTest_in : std_logic_vector (36 downto 0);
    signal RightShiftStage036dto12_uid150_fxpX_uid50_fpArccosXTest_b : std_logic_vector (24 downto 0);
    signal expOddSelect_uid242_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal expOddSelect_uid242_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector (7 downto 0);
    signal rightShiftStage1Idx1_uid281_alignSqrt_uid69_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx2_uid284_alignSqrt_uid69_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx3_uid287_alignSqrt_uid69_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal Path2ResFP22dto0_uid120_fpArccosXTest_in : std_logic_vector (22 downto 0);
    signal Path2ResFP22dto0_uid120_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal Path2ResFP30dto23_uid123_fpArccosXTest_in : std_logic_vector (30 downto 0);
    signal Path2ResFP30dto23_uid123_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal firstPath_uid53_fpArccosXTest_in : std_logic_vector (34 downto 0);
    signal firstPath_uid53_fpArccosXTest_b : std_logic_vector (0 downto 0);
    signal mAddr_uid98_fpArccosXTest_in : std_logic_vector (34 downto 0);
    signal mAddr_uid98_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal mPPolyEval_uid99_fpArccosXTest_in : std_logic_vector (26 downto 0);
    signal mPPolyEval_uid99_fpArccosXTest_b : std_logic_vector (14 downto 0);
    signal cStage_uid193_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid204_fpLOut1_uid57_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid204_fpLOut1_uid57_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid204_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid207_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (34 downto 0);
    signal minReg_uid252_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal minReg_uid252_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal minReg_uid252_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1_uid436_alignArcsinL_uid84_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal roundBitDetectionPattern_uid371_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(2 downto 0);
    signal roundBitDetectionPattern_uid371_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(2 downto 0);
    signal roundBitDetectionPattern_uid371_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal fxpArcsinXO2XResWFRange_uid75_fpArccosXTest_in : std_logic_vector (24 downto 0);
    signal fxpArcsinXO2XResWFRange_uid75_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal path2PosCaseFPFraction_uid113_fpArccosXTest_in : std_logic_vector (25 downto 0);
    signal path2PosCaseFPFraction_uid113_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector (22 downto 0);
    signal rightShiftStage1Idx1_uid146_fxpX_uid50_fpArccosXTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx2_uid149_fxpX_uid50_fpArccosXTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx3_uid152_fxpX_uid50_fpArccosXTest_q : std_logic_vector (36 downto 0);
    signal pathSelBits_uid117_fpArccosXTest_q : std_logic_vector (2 downto 0);
    signal yT1_uid443_arccosXO2PolyEval_in : std_logic_vector (14 downto 0);
    signal yT1_uid443_arccosXO2PolyEval_b : std_logic_vector (11 downto 0);
    signal vStagei_uid208_fpLOut1_uid57_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid208_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid209_fpLOut1_uid57_fpArccosXTest_q : std_logic_vector (5 downto 0);
    signal excRNaN_uid254_sqrtFPL_uid63_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid254_sqrtFPL_uid63_fpArccosXTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid254_sqrtFPL_uid63_fpArccosXTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid254_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_s : std_logic_vector (0 downto 0);
    signal rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal roundBit_uid372_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(0 downto 0);
    signal roundBit_uid372_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal fpArcsinXO2XRes_uid76_fpArccosXTest_q : std_logic_vector (31 downto 0);
    signal RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector (31 downto 0);
    signal fpLOutFrac_uid59_fpArccosXTest_in : std_logic_vector (33 downto 0);
    signal fpLOutFrac_uid59_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal join_uid255_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector (2 downto 0);
    signal pad_fxpArcsinL_uid85_uid86_fpArccosXTest_q : std_logic_vector (26 downto 0);
    signal roundBitAndNormalizationOp_uid375_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (25 downto 0);
    signal expY_uid313_arcsinL_uid78_fpArccosXTest_in : std_logic_vector (30 downto 0);
    signal expY_uid313_arcsinL_uid78_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal signY_uid315_arcsinL_uid78_fpArccosXTest_in : std_logic_vector (31 downto 0);
    signal signY_uid315_arcsinL_uid78_fpArccosXTest_b : std_logic_vector (0 downto 0);
    signal fracY_uid318_arcsinL_uid78_fpArccosXTest_in : std_logic_vector (22 downto 0);
    signal fracY_uid318_arcsinL_uid78_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal SqrtFPL22dto0_uid64_fpArccosXTest_in : std_logic_vector (22 downto 0);
    signal SqrtFPL22dto0_uid64_fpArccosXTest_b : std_logic_vector (22 downto 0);
    signal SqrtFPL30dto23_uid66_fpArccosXTest_in : std_logic_vector (30 downto 0);
    signal SqrtFPL30dto23_uid66_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal signX_uid314_arcsinL_uid78_fpArccosXTest_in : std_logic_vector (31 downto 0);
    signal signX_uid314_arcsinL_uid78_fpArccosXTest_b : std_logic_vector (0 downto 0);
    signal fracSelIn_uid256_sqrtFPL_uid63_fpArccosXTest_q : std_logic_vector (3 downto 0);
    signal expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_q : std_logic_vector(0 downto 0);
    signal add_one_fracY_uid318_uid319_uid319_arcsinL_uid78_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal oSqrtFPLFrac_uid65_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal X23dto8_uid270_alignSqrt_uid69_fpArccosXTest_in : std_logic_vector (23 downto 0);
    signal X23dto8_uid270_alignSqrt_uid69_fpArccosXTest_b : std_logic_vector (15 downto 0);
    signal X23dto16_uid273_alignSqrt_uid69_fpArccosXTest_in : std_logic_vector (23 downto 0);
    signal X23dto16_uid273_alignSqrt_uid69_fpArccosXTest_b : std_logic_vector (7 downto 0);
    signal rightShiftStage0Idx1_uid272_alignSqrt_uid69_fpArccosXTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage0Idx2_uid275_alignSqrt_uid69_fpArccosXTest_q : std_logic_vector (23 downto 0);
begin


	--GND(CONSTANT,0)
    GND_q <= "0";

	--cstAllOWE_uid9_fpArccosXTest(CONSTANT,8)
    cstAllOWE_uid9_fpArccosXTest_q <= "11111111";

	--cstBiasP1_uid17_fpArccosXTest(CONSTANT,16)
    cstBiasP1_uid17_fpArccosXTest_q <= "10000000";

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable(LOGICAL,1194)
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_a <= en;
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q <= not ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_a;

	--ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_nor(LOGICAL,1222)
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_nor_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q;
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_nor_b <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_sticky_ena_q;
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_nor_q <= not (ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_nor_a or ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_nor_b);

	--ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_mem_top(CONSTANT,1218)
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_mem_top_q <= "011001";

	--ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmp(LOGICAL,1219)
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmp_a <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_mem_top_q;
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdmux_q);
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmp_q <= "1" when ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmp_a = ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmp_b else "0";

	--ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmpReg(REG,1220)
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmpReg_q <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_sticky_ena(REG,1223)
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_nor_q = "1") THEN
                ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_sticky_ena_q <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_enaAnd(LOGICAL,1224)
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_enaAnd_a <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_sticky_ena_q;
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_enaAnd_b <= en;
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_enaAnd_q <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_enaAnd_a and ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_enaAnd_b;

	--rightShiftStage2Idx3Pad3_uid162_fxpX_uid50_fpArccosXTest(CONSTANT,161)
    rightShiftStage2Idx3Pad3_uid162_fxpX_uid50_fpArccosXTest_q <= "000";

	--RightShiftStage136dto3_uid161_fxpX_uid50_fpArccosXTest(BITSELECT,160)@1
    RightShiftStage136dto3_uid161_fxpX_uid50_fpArccosXTest_in <= rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_q;
    RightShiftStage136dto3_uid161_fxpX_uid50_fpArccosXTest_b <= RightShiftStage136dto3_uid161_fxpX_uid50_fpArccosXTest_in(36 downto 3);

	--rightShiftStage2Idx3_uid163_fxpX_uid50_fpArccosXTest(BITJOIN,162)@1
    rightShiftStage2Idx3_uid163_fxpX_uid50_fpArccosXTest_q <= rightShiftStage2Idx3Pad3_uid162_fxpX_uid50_fpArccosXTest_q & RightShiftStage136dto3_uid161_fxpX_uid50_fpArccosXTest_b;

	--rightShiftStage2Idx2Pad2_uid159_fxpX_uid50_fpArccosXTest(CONSTANT,158)
    rightShiftStage2Idx2Pad2_uid159_fxpX_uid50_fpArccosXTest_q <= "00";

	--RightShiftStage136dto2_uid158_fxpX_uid50_fpArccosXTest(BITSELECT,157)@1
    RightShiftStage136dto2_uid158_fxpX_uid50_fpArccosXTest_in <= rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_q;
    RightShiftStage136dto2_uid158_fxpX_uid50_fpArccosXTest_b <= RightShiftStage136dto2_uid158_fxpX_uid50_fpArccosXTest_in(36 downto 2);

	--rightShiftStage2Idx2_uid160_fxpX_uid50_fpArccosXTest(BITJOIN,159)@1
    rightShiftStage2Idx2_uid160_fxpX_uid50_fpArccosXTest_q <= rightShiftStage2Idx2Pad2_uid159_fxpX_uid50_fpArccosXTest_q & RightShiftStage136dto2_uid158_fxpX_uid50_fpArccosXTest_b;

	--RightShiftStage136dto1_uid155_fxpX_uid50_fpArccosXTest(BITSELECT,154)@1
    RightShiftStage136dto1_uid155_fxpX_uid50_fpArccosXTest_in <= rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_q;
    RightShiftStage136dto1_uid155_fxpX_uid50_fpArccosXTest_b <= RightShiftStage136dto1_uid155_fxpX_uid50_fpArccosXTest_in(36 downto 1);

	--rightShiftStage2Idx1_uid157_fxpX_uid50_fpArccosXTest(BITJOIN,156)@1
    rightShiftStage2Idx1_uid157_fxpX_uid50_fpArccosXTest_q <= GND_q & RightShiftStage136dto1_uid155_fxpX_uid50_fpArccosXTest_b;

	--rightShiftStage1Idx3Pad12_uid151_fxpX_uid50_fpArccosXTest(CONSTANT,150)
    rightShiftStage1Idx3Pad12_uid151_fxpX_uid50_fpArccosXTest_q <= "000000000000";

	--rightShiftStage0Idx3_uid141_fxpX_uid50_fpArccosXTest(CONSTANT,140)
    rightShiftStage0Idx3_uid141_fxpX_uid50_fpArccosXTest_q <= "0000000000000000000000000000000000000";

	--rightShiftStage0Idx2Pad32_uid139_fxpX_uid50_fpArccosXTest(CONSTANT,138)
    rightShiftStage0Idx2Pad32_uid139_fxpX_uid50_fpArccosXTest_q <= "00000000000000000000000000000000";

	--X36dto32_uid138_fxpX_uid50_fpArccosXTest(BITSELECT,137)@0
    X36dto32_uid138_fxpX_uid50_fpArccosXTest_in <= oFracXExt_uid49_fpArccosXTest_q;
    X36dto32_uid138_fxpX_uid50_fpArccosXTest_b <= X36dto32_uid138_fxpX_uid50_fpArccosXTest_in(36 downto 32);

	--rightShiftStage0Idx2_uid140_fxpX_uid50_fpArccosXTest(BITJOIN,139)@0
    rightShiftStage0Idx2_uid140_fxpX_uid50_fpArccosXTest_q <= rightShiftStage0Idx2Pad32_uid139_fxpX_uid50_fpArccosXTest_q & X36dto32_uid138_fxpX_uid50_fpArccosXTest_b;

	--rightShiftStage0Idx1Pad16_uid136_fxpX_uid50_fpArccosXTest(CONSTANT,135)
    rightShiftStage0Idx1Pad16_uid136_fxpX_uid50_fpArccosXTest_q <= "0000000000000000";

	--X36dto16_uid135_fxpX_uid50_fpArccosXTest(BITSELECT,134)@0
    X36dto16_uid135_fxpX_uid50_fpArccosXTest_in <= oFracXExt_uid49_fpArccosXTest_q;
    X36dto16_uid135_fxpX_uid50_fpArccosXTest_b <= X36dto16_uid135_fxpX_uid50_fpArccosXTest_in(36 downto 16);

	--rightShiftStage0Idx1_uid137_fxpX_uid50_fpArccosXTest(BITJOIN,136)@0
    rightShiftStage0Idx1_uid137_fxpX_uid50_fpArccosXTest_q <= rightShiftStage0Idx1Pad16_uid136_fxpX_uid50_fpArccosXTest_q & X36dto16_uid135_fxpX_uid50_fpArccosXTest_b;

	--fracX_uid7_fpArccosXTest(BITSELECT,6)@0
    fracX_uid7_fpArccosXTest_in <= a(22 downto 0);
    fracX_uid7_fpArccosXTest_b <= fracX_uid7_fpArccosXTest_in(22 downto 0);

	--oFracX_uid42_uid42_fpArccosXTest(BITJOIN,41)@0
    oFracX_uid42_uid42_fpArccosXTest_q <= VCC_q & fracX_uid7_fpArccosXTest_b;

	--cst01pWShift_uid48_fpArccosXTest(CONSTANT,47)
    cst01pWShift_uid48_fpArccosXTest_q <= "0000000000000";

	--oFracXExt_uid49_fpArccosXTest(BITJOIN,48)@0
    oFracXExt_uid49_fpArccosXTest_q <= oFracX_uid42_uid42_fpArccosXTest_q & cst01pWShift_uid48_fpArccosXTest_q;

	--shiftOutVal_uid45_fpArccosXTest(CONSTANT,44)
    shiftOutVal_uid45_fpArccosXTest_q <= "100100";

	--expX_uid6_fpArccosXTest(BITSELECT,5)@0
    expX_uid6_fpArccosXTest_in <= a(30 downto 0);
    expX_uid6_fpArccosXTest_b <= expX_uid6_fpArccosXTest_in(30 downto 23);

	--cstBias_uid13_fpArccosXTest(CONSTANT,12)
    cstBias_uid13_fpArccosXTest_q <= "01111111";

	--shiftValuePre_uid44_fpArccosXTest(SUB,43)@0
    shiftValuePre_uid44_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & cstBias_uid13_fpArccosXTest_q);
    shiftValuePre_uid44_fpArccosXTest_b <= STD_LOGIC_VECTOR("0" & expX_uid6_fpArccosXTest_b);
            shiftValuePre_uid44_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValuePre_uid44_fpArccosXTest_a) - UNSIGNED(shiftValuePre_uid44_fpArccosXTest_b));
    shiftValuePre_uid44_fpArccosXTest_q <= shiftValuePre_uid44_fpArccosXTest_o(8 downto 0);


	--fxpShifterBits_uid46_fpArccosXTest(BITSELECT,45)@0
    fxpShifterBits_uid46_fpArccosXTest_in <= shiftValuePre_uid44_fpArccosXTest_q(5 downto 0);
    fxpShifterBits_uid46_fpArccosXTest_b <= fxpShifterBits_uid46_fpArccosXTest_in(5 downto 0);

	--cstBiasMwFMwShift_uid15_fpArccosXTest(CONSTANT,14)
    cstBiasMwFMwShift_uid15_fpArccosXTest_q <= "001011100";

	--shiftValue_uid43_fpArccosXTest(COMPARE,42)@0
    shiftValue_uid43_fpArccosXTest_cin <= GND_q;
    shiftValue_uid43_fpArccosXTest_a <= STD_LOGIC_VECTOR((10 downto 9 => cstBiasMwFMwShift_uid15_fpArccosXTest_q(8)) & cstBiasMwFMwShift_uid15_fpArccosXTest_q) & '0';
    shiftValue_uid43_fpArccosXTest_b <= STD_LOGIC_VECTOR('0' & "00" & expX_uid6_fpArccosXTest_b) & shiftValue_uid43_fpArccosXTest_cin(0);
            shiftValue_uid43_fpArccosXTest_o <= STD_LOGIC_VECTOR(SIGNED(shiftValue_uid43_fpArccosXTest_a) - SIGNED(shiftValue_uid43_fpArccosXTest_b));
    shiftValue_uid43_fpArccosXTest_n(0) <= not shiftValue_uid43_fpArccosXTest_o(11);


	--shiftValue_uid47_fpArccosXTest(MUX,46)@0
    shiftValue_uid47_fpArccosXTest_s <= shiftValue_uid43_fpArccosXTest_n;
    shiftValue_uid47_fpArccosXTest: PROCESS (shiftValue_uid47_fpArccosXTest_s, en, fxpShifterBits_uid46_fpArccosXTest_b, shiftOutVal_uid45_fpArccosXTest_q)
    BEGIN
            CASE shiftValue_uid47_fpArccosXTest_s IS
                  WHEN "0" => shiftValue_uid47_fpArccosXTest_q <= fxpShifterBits_uid46_fpArccosXTest_b;
                  WHEN "1" => shiftValue_uid47_fpArccosXTest_q <= shiftOutVal_uid45_fpArccosXTest_q;
                  WHEN OTHERS => shiftValue_uid47_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel5Dto4_uid142_fxpX_uid50_fpArccosXTest(BITSELECT,141)@0
    rightShiftStageSel5Dto4_uid142_fxpX_uid50_fpArccosXTest_in <= shiftValue_uid47_fpArccosXTest_q;
    rightShiftStageSel5Dto4_uid142_fxpX_uid50_fpArccosXTest_b <= rightShiftStageSel5Dto4_uid142_fxpX_uid50_fpArccosXTest_in(5 downto 4);

	--rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest(MUX,142)@0
    rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_s <= rightShiftStageSel5Dto4_uid142_fxpX_uid50_fpArccosXTest_b;
    rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest: PROCESS (rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_s, en, oFracXExt_uid49_fpArccosXTest_q, rightShiftStage0Idx1_uid137_fxpX_uid50_fpArccosXTest_q, rightShiftStage0Idx2_uid140_fxpX_uid50_fpArccosXTest_q, rightShiftStage0Idx3_uid141_fxpX_uid50_fpArccosXTest_q)
    BEGIN
            CASE rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_s IS
                  WHEN "00" => rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_q <= oFracXExt_uid49_fpArccosXTest_q;
                  WHEN "01" => rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_q <= rightShiftStage0Idx1_uid137_fxpX_uid50_fpArccosXTest_q;
                  WHEN "10" => rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_q <= rightShiftStage0Idx2_uid140_fxpX_uid50_fpArccosXTest_q;
                  WHEN "11" => rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_q <= rightShiftStage0Idx3_uid141_fxpX_uid50_fpArccosXTest_q;
                  WHEN OTHERS => rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage036dto12_uid150_fxpX_uid50_fpArccosXTest(BITSELECT,149)@0
    RightShiftStage036dto12_uid150_fxpX_uid50_fpArccosXTest_in <= rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_q;
    RightShiftStage036dto12_uid150_fxpX_uid50_fpArccosXTest_b <= RightShiftStage036dto12_uid150_fxpX_uid50_fpArccosXTest_in(36 downto 12);

	--rightShiftStage1Idx3_uid152_fxpX_uid50_fpArccosXTest(BITJOIN,151)@0
    rightShiftStage1Idx3_uid152_fxpX_uid50_fpArccosXTest_q <= rightShiftStage1Idx3Pad12_uid151_fxpX_uid50_fpArccosXTest_q & RightShiftStage036dto12_uid150_fxpX_uid50_fpArccosXTest_b;

	--reg_rightShiftStage1Idx3_uid152_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_5(REG,503)@0
    reg_rightShiftStage1Idx3_uid152_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx3_uid152_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_5_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx3_uid152_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_5_q <= rightShiftStage1Idx3_uid152_fxpX_uid50_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--RightShiftStage036dto8_uid147_fxpX_uid50_fpArccosXTest(BITSELECT,146)@0
    RightShiftStage036dto8_uid147_fxpX_uid50_fpArccosXTest_in <= rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_q;
    RightShiftStage036dto8_uid147_fxpX_uid50_fpArccosXTest_b <= RightShiftStage036dto8_uid147_fxpX_uid50_fpArccosXTest_in(36 downto 8);

	--rightShiftStage1Idx2_uid149_fxpX_uid50_fpArccosXTest(BITJOIN,148)@0
    rightShiftStage1Idx2_uid149_fxpX_uid50_fpArccosXTest_q <= cstAllZWE_uid12_fpArccosXTest_q & RightShiftStage036dto8_uid147_fxpX_uid50_fpArccosXTest_b;

	--reg_rightShiftStage1Idx2_uid149_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_4(REG,502)@0
    reg_rightShiftStage1Idx2_uid149_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx2_uid149_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_4_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx2_uid149_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_4_q <= rightShiftStage1Idx2_uid149_fxpX_uid50_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1Idx1Pad4_uid145_fxpX_uid50_fpArccosXTest(CONSTANT,144)
    rightShiftStage1Idx1Pad4_uid145_fxpX_uid50_fpArccosXTest_q <= "0000";

	--RightShiftStage036dto4_uid144_fxpX_uid50_fpArccosXTest(BITSELECT,143)@0
    RightShiftStage036dto4_uid144_fxpX_uid50_fpArccosXTest_in <= rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_q;
    RightShiftStage036dto4_uid144_fxpX_uid50_fpArccosXTest_b <= RightShiftStage036dto4_uid144_fxpX_uid50_fpArccosXTest_in(36 downto 4);

	--rightShiftStage1Idx1_uid146_fxpX_uid50_fpArccosXTest(BITJOIN,145)@0
    rightShiftStage1Idx1_uid146_fxpX_uid50_fpArccosXTest_q <= rightShiftStage1Idx1Pad4_uid145_fxpX_uid50_fpArccosXTest_q & RightShiftStage036dto4_uid144_fxpX_uid50_fpArccosXTest_b;

	--reg_rightShiftStage1Idx1_uid146_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_3(REG,501)@0
    reg_rightShiftStage1Idx1_uid146_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx1_uid146_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_3_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx1_uid146_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_3_q <= rightShiftStage1Idx1_uid146_fxpX_uid50_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_2(REG,500)@0
    reg_rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_2_q <= rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel3Dto2_uid153_fxpX_uid50_fpArccosXTest(BITSELECT,152)@0
    rightShiftStageSel3Dto2_uid153_fxpX_uid50_fpArccosXTest_in <= shiftValue_uid47_fpArccosXTest_q(3 downto 0);
    rightShiftStageSel3Dto2_uid153_fxpX_uid50_fpArccosXTest_b <= rightShiftStageSel3Dto2_uid153_fxpX_uid50_fpArccosXTest_in(3 downto 2);

	--reg_rightShiftStageSel3Dto2_uid153_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_1(REG,499)@0
    reg_rightShiftStageSel3Dto2_uid153_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel3Dto2_uid153_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel3Dto2_uid153_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_1_q <= rightShiftStageSel3Dto2_uid153_fxpX_uid50_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest(MUX,153)@1
    rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_s <= reg_rightShiftStageSel3Dto2_uid153_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_1_q;
    rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest: PROCESS (rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_s, en, reg_rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_2_q, reg_rightShiftStage1Idx1_uid146_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_3_q, reg_rightShiftStage1Idx2_uid149_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_4_q, reg_rightShiftStage1Idx3_uid152_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_5_q)
    BEGIN
            CASE rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_s IS
                  WHEN "00" => rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_q <= reg_rightShiftStage0_uid143_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_2_q;
                  WHEN "01" => rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_q <= reg_rightShiftStage1Idx1_uid146_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_3_q;
                  WHEN "10" => rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_q <= reg_rightShiftStage1Idx2_uid149_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_4_q;
                  WHEN "11" => rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_q <= reg_rightShiftStage1Idx3_uid152_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_5_q;
                  WHEN OTHERS => rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel1Dto0_uid164_fxpX_uid50_fpArccosXTest(BITSELECT,163)@0
    rightShiftStageSel1Dto0_uid164_fxpX_uid50_fpArccosXTest_in <= shiftValue_uid47_fpArccosXTest_q(1 downto 0);
    rightShiftStageSel1Dto0_uid164_fxpX_uid50_fpArccosXTest_b <= rightShiftStageSel1Dto0_uid164_fxpX_uid50_fpArccosXTest_in(1 downto 0);

	--reg_rightShiftStageSel1Dto0_uid164_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_1(REG,504)@0
    reg_rightShiftStageSel1Dto0_uid164_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel1Dto0_uid164_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel1Dto0_uid164_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_1_q <= rightShiftStageSel1Dto0_uid164_fxpX_uid50_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest(MUX,164)@1
    rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_s <= reg_rightShiftStageSel1Dto0_uid164_fxpX_uid50_fpArccosXTest_0_to_rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_1_q;
    rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest: PROCESS (rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_s, en, rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_q, rightShiftStage2Idx1_uid157_fxpX_uid50_fpArccosXTest_q, rightShiftStage2Idx2_uid160_fxpX_uid50_fpArccosXTest_q, rightShiftStage2Idx3_uid163_fxpX_uid50_fpArccosXTest_q)
    BEGIN
            CASE rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_s IS
                  WHEN "00" => rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_q <= rightShiftStage1_uid154_fxpX_uid50_fpArccosXTest_q;
                  WHEN "01" => rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_q <= rightShiftStage2Idx1_uid157_fxpX_uid50_fpArccosXTest_q;
                  WHEN "10" => rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_q <= rightShiftStage2Idx2_uid160_fxpX_uid50_fpArccosXTest_q;
                  WHEN "11" => rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_q <= rightShiftStage2Idx3_uid163_fxpX_uid50_fpArccosXTest_q;
                  WHEN OTHERS => rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--y_uid52_fpArccosXTest(BITSELECT,51)@1
    y_uid52_fpArccosXTest_in <= rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_q(35 downto 0);
    y_uid52_fpArccosXTest_b <= y_uid52_fpArccosXTest_in(35 downto 1);

	--mAddr_uid98_fpArccosXTest(BITSELECT,97)@1
    mAddr_uid98_fpArccosXTest_in <= y_uid52_fpArccosXTest_b;
    mAddr_uid98_fpArccosXTest_b <= mAddr_uid98_fpArccosXTest_in(34 downto 27);

	--reg_mAddr_uid98_fpArccosXTest_0_to_memoryC2_uid442_arccosXO2TabGen_lutmem_0(REG,578)@1
    reg_mAddr_uid98_fpArccosXTest_0_to_memoryC2_uid442_arccosXO2TabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mAddr_uid98_fpArccosXTest_0_to_memoryC2_uid442_arccosXO2TabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_mAddr_uid98_fpArccosXTest_0_to_memoryC2_uid442_arccosXO2TabGen_lutmem_0_q <= mAddr_uid98_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid442_arccosXO2TabGen_lutmem(DUALMEM,494)@2
    memoryC2_uid442_arccosXO2TabGen_lutmem_reset0 <= areset;
    memoryC2_uid442_arccosXO2TabGen_lutmem_ia <= (others => '0');
    memoryC2_uid442_arccosXO2TabGen_lutmem_aa <= (others => '0');
    memoryC2_uid442_arccosXO2TabGen_lutmem_ab <= reg_mAddr_uid98_fpArccosXTest_0_to_memoryC2_uid442_arccosXO2TabGen_lutmem_0_q;
    memoryC2_uid442_arccosXO2TabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arccos_s5_memoryC2_uid442_arccosXO2TabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid442_arccosXO2TabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid442_arccosXO2TabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid442_arccosXO2TabGen_lutmem_iq,
        address_a => memoryC2_uid442_arccosXO2TabGen_lutmem_aa,
        data_a => memoryC2_uid442_arccosXO2TabGen_lutmem_ia
    );
        memoryC2_uid442_arccosXO2TabGen_lutmem_q <= memoryC2_uid442_arccosXO2TabGen_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid442_arccosXO2TabGen_lutmem_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_1(REG,580)@4
    reg_memoryC2_uid442_arccosXO2TabGen_lutmem_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid442_arccosXO2TabGen_lutmem_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid442_arccosXO2TabGen_lutmem_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_1_q <= memoryC2_uid442_arccosXO2TabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--mPPolyEval_uid99_fpArccosXTest(BITSELECT,98)@1
    mPPolyEval_uid99_fpArccosXTest_in <= y_uid52_fpArccosXTest_b(26 downto 0);
    mPPolyEval_uid99_fpArccosXTest_b <= mPPolyEval_uid99_fpArccosXTest_in(26 downto 12);

	--yT1_uid443_arccosXO2PolyEval(BITSELECT,442)@1
    yT1_uid443_arccosXO2PolyEval_in <= mPPolyEval_uid99_fpArccosXTest_b;
    yT1_uid443_arccosXO2PolyEval_b <= yT1_uid443_arccosXO2PolyEval_in(14 downto 3);

	--ld_yT1_uid443_arccosXO2PolyEval_b_to_reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0_a_inputreg(DELAY,1328)
    ld_yT1_uid443_arccosXO2PolyEval_b_to_reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 12, depth => 1 )
    PORT MAP ( xin => yT1_uid443_arccosXO2PolyEval_b, xout => ld_yT1_uid443_arccosXO2PolyEval_b_to_reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yT1_uid443_arccosXO2PolyEval_b_to_reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0_a(DELAY,1172)@1
    ld_yT1_uid443_arccosXO2PolyEval_b_to_reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0_a : dspba_delay
    GENERIC MAP ( width => 12, depth => 2 )
    PORT MAP ( xin => ld_yT1_uid443_arccosXO2PolyEval_b_to_reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0_a_inputreg_q, xout => ld_yT1_uid443_arccosXO2PolyEval_b_to_reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0(REG,579)@4
    reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0_q <= ld_yT1_uid443_arccosXO2PolyEval_b_to_reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid478_pT1_uid444_arccosXO2PolyEval(MULT,477)@5
    prodXY_uid478_pT1_uid444_arccosXO2PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid478_pT1_uid444_arccosXO2PolyEval_a),13)) * SIGNED(prodXY_uid478_pT1_uid444_arccosXO2PolyEval_b);
    prodXY_uid478_pT1_uid444_arccosXO2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid478_pT1_uid444_arccosXO2PolyEval_a <= (others => '0');
            prodXY_uid478_pT1_uid444_arccosXO2PolyEval_b <= (others => '0');
            prodXY_uid478_pT1_uid444_arccosXO2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid478_pT1_uid444_arccosXO2PolyEval_a <= reg_yT1_uid443_arccosXO2PolyEval_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_0_q;
                prodXY_uid478_pT1_uid444_arccosXO2PolyEval_b <= reg_memoryC2_uid442_arccosXO2TabGen_lutmem_0_to_prodXY_uid478_pT1_uid444_arccosXO2PolyEval_1_q;
                prodXY_uid478_pT1_uid444_arccosXO2PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid478_pT1_uid444_arccosXO2PolyEval_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid478_pT1_uid444_arccosXO2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid478_pT1_uid444_arccosXO2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid478_pT1_uid444_arccosXO2PolyEval_q <= prodXY_uid478_pT1_uid444_arccosXO2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid479_pT1_uid444_arccosXO2PolyEval(BITSELECT,478)@8
    prodXYTruncFR_uid479_pT1_uid444_arccosXO2PolyEval_in <= prodXY_uid478_pT1_uid444_arccosXO2PolyEval_q;
    prodXYTruncFR_uid479_pT1_uid444_arccosXO2PolyEval_b <= prodXYTruncFR_uid479_pT1_uid444_arccosXO2PolyEval_in(23 downto 11);

	--highBBits_uid446_arccosXO2PolyEval(BITSELECT,445)@8
    highBBits_uid446_arccosXO2PolyEval_in <= prodXYTruncFR_uid479_pT1_uid444_arccosXO2PolyEval_b;
    highBBits_uid446_arccosXO2PolyEval_b <= highBBits_uid446_arccosXO2PolyEval_in(12 downto 1);

	--ld_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC1_uid441_arccosXO2TabGen_lutmem_0_q_to_memoryC1_uid441_arccosXO2TabGen_lutmem_a(DELAY,1086)@2
    ld_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC1_uid441_arccosXO2TabGen_lutmem_0_q_to_memoryC1_uid441_arccosXO2TabGen_lutmem_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => reg_mAddr_uid98_fpArccosXTest_0_to_memoryC2_uid442_arccosXO2TabGen_lutmem_0_q, xout => ld_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC1_uid441_arccosXO2TabGen_lutmem_0_q_to_memoryC1_uid441_arccosXO2TabGen_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC1_uid441_arccosXO2TabGen_lutmem_0_q_to_memoryC1_uid441_arccosXO2TabGen_lutmem_a_outputreg(DELAY,1289)
    ld_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC1_uid441_arccosXO2TabGen_lutmem_0_q_to_memoryC1_uid441_arccosXO2TabGen_lutmem_a_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC1_uid441_arccosXO2TabGen_lutmem_0_q_to_memoryC1_uid441_arccosXO2TabGen_lutmem_a_q, xout => ld_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC1_uid441_arccosXO2TabGen_lutmem_0_q_to_memoryC1_uid441_arccosXO2TabGen_lutmem_a_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid441_arccosXO2TabGen_lutmem(DUALMEM,493)@6
    memoryC1_uid441_arccosXO2TabGen_lutmem_reset0 <= areset;
    memoryC1_uid441_arccosXO2TabGen_lutmem_ia <= (others => '0');
    memoryC1_uid441_arccosXO2TabGen_lutmem_aa <= (others => '0');
    memoryC1_uid441_arccosXO2TabGen_lutmem_ab <= ld_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC1_uid441_arccosXO2TabGen_lutmem_0_q_to_memoryC1_uid441_arccosXO2TabGen_lutmem_a_outputreg_q;
    memoryC1_uid441_arccosXO2TabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arccos_s5_memoryC1_uid441_arccosXO2TabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid441_arccosXO2TabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid441_arccosXO2TabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid441_arccosXO2TabGen_lutmem_iq,
        address_a => memoryC1_uid441_arccosXO2TabGen_lutmem_aa,
        data_a => memoryC1_uid441_arccosXO2TabGen_lutmem_ia
    );
        memoryC1_uid441_arccosXO2TabGen_lutmem_q <= memoryC1_uid441_arccosXO2TabGen_lutmem_iq(21 downto 0);

	--sumAHighB_uid447_arccosXO2PolyEval(ADD,446)@8
    sumAHighB_uid447_arccosXO2PolyEval_a <= STD_LOGIC_VECTOR((22 downto 22 => memoryC1_uid441_arccosXO2TabGen_lutmem_q(21)) & memoryC1_uid441_arccosXO2TabGen_lutmem_q);
    sumAHighB_uid447_arccosXO2PolyEval_b <= STD_LOGIC_VECTOR((22 downto 12 => highBBits_uid446_arccosXO2PolyEval_b(11)) & highBBits_uid446_arccosXO2PolyEval_b);
            sumAHighB_uid447_arccosXO2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid447_arccosXO2PolyEval_a) + SIGNED(sumAHighB_uid447_arccosXO2PolyEval_b));
    sumAHighB_uid447_arccosXO2PolyEval_q <= sumAHighB_uid447_arccosXO2PolyEval_o(22 downto 0);


	--lowRangeB_uid445_arccosXO2PolyEval(BITSELECT,444)@8
    lowRangeB_uid445_arccosXO2PolyEval_in <= prodXYTruncFR_uid479_pT1_uid444_arccosXO2PolyEval_b(0 downto 0);
    lowRangeB_uid445_arccosXO2PolyEval_b <= lowRangeB_uid445_arccosXO2PolyEval_in(0 downto 0);

	--s1_uid445_uid448_arccosXO2PolyEval(BITJOIN,447)@8
    s1_uid445_uid448_arccosXO2PolyEval_q <= sumAHighB_uid447_arccosXO2PolyEval_q & lowRangeB_uid445_arccosXO2PolyEval_b;

	--reg_s1_uid445_uid448_arccosXO2PolyEval_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_1(REG,583)@8
    reg_s1_uid445_uid448_arccosXO2PolyEval_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid445_uid448_arccosXO2PolyEval_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_1_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid445_uid448_arccosXO2PolyEval_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_1_q <= s1_uid445_uid448_arccosXO2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_nor(LOGICAL,1339)
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_nor_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q;
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_nor_b <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_sticky_ena_q;
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_nor_q <= not (ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_nor_a or ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_nor_b);

	--ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_mem_top(CONSTANT,1335)
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_mem_top_q <= "0100";

	--ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmp(LOGICAL,1336)
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmp_a <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_mem_top_q;
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdmux_q);
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmp_q <= "1" when ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmp_a = ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmp_b else "0";

	--ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmpReg(REG,1337)
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmpReg_q <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_sticky_ena(REG,1340)
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_nor_q = "1") THEN
                ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_sticky_ena_q <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_enaAnd(LOGICAL,1341)
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_enaAnd_a <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_sticky_ena_q;
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_enaAnd_b <= en;
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_enaAnd_q <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_enaAnd_a and ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_enaAnd_b;

	--ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_inputreg(DELAY,1329)
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => mPPolyEval_uid99_fpArccosXTest_b, xout => ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt(COUNTER,1331)
    -- every=1, low=0, high=4, step=1, init=1
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_i = 3 THEN
                      ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_eq = '1') THEN
                        ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_i <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_i <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_i,3));


	--ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdreg(REG,1332)
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdreg_q <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdmux(MUX,1333)
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdmux_s <= en;
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdmux: PROCESS (ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdmux_s, ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdreg_q, ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdmux_q <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdreg_q;
                  WHEN "1" => ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdmux_q <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem(DUALMEM,1330)
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_reset0 <= areset;
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_ia <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_inputreg_q;
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_aa <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdreg_q;
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_ab <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_rdmux_q;
    ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 15,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 15,
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
        clocken1 => ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_iq,
        address_a => ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_aa,
        data_a => ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_ia
    );
        ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_q <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_iq(14 downto 0);

	--reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0(REG,582)@8
    reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_q <= "000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_q <= ld_mPPolyEval_uid99_fpArccosXTest_b_to_reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid481_pT2_uid450_arccosXO2PolyEval(MULT,480)@9
    prodXY_uid481_pT2_uid450_arccosXO2PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid481_pT2_uid450_arccosXO2PolyEval_a),16)) * SIGNED(prodXY_uid481_pT2_uid450_arccosXO2PolyEval_b);
    prodXY_uid481_pT2_uid450_arccosXO2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid481_pT2_uid450_arccosXO2PolyEval_a <= (others => '0');
            prodXY_uid481_pT2_uid450_arccosXO2PolyEval_b <= (others => '0');
            prodXY_uid481_pT2_uid450_arccosXO2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid481_pT2_uid450_arccosXO2PolyEval_a <= reg_mPPolyEval_uid99_fpArccosXTest_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_0_q;
                prodXY_uid481_pT2_uid450_arccosXO2PolyEval_b <= reg_s1_uid445_uid448_arccosXO2PolyEval_0_to_prodXY_uid481_pT2_uid450_arccosXO2PolyEval_1_q;
                prodXY_uid481_pT2_uid450_arccosXO2PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid481_pT2_uid450_arccosXO2PolyEval_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid481_pT2_uid450_arccosXO2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid481_pT2_uid450_arccosXO2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid481_pT2_uid450_arccosXO2PolyEval_q <= prodXY_uid481_pT2_uid450_arccosXO2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid482_pT2_uid450_arccosXO2PolyEval(BITSELECT,481)@12
    prodXYTruncFR_uid482_pT2_uid450_arccosXO2PolyEval_in <= prodXY_uid481_pT2_uid450_arccosXO2PolyEval_q;
    prodXYTruncFR_uid482_pT2_uid450_arccosXO2PolyEval_b <= prodXYTruncFR_uid482_pT2_uid450_arccosXO2PolyEval_in(38 downto 14);

	--highBBits_uid452_arccosXO2PolyEval(BITSELECT,451)@12
    highBBits_uid452_arccosXO2PolyEval_in <= prodXYTruncFR_uid482_pT2_uid450_arccosXO2PolyEval_b;
    highBBits_uid452_arccosXO2PolyEval_b <= highBBits_uid452_arccosXO2PolyEval_in(24 downto 2);

	--ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_nor(LOGICAL,1352)
    ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_nor_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q;
    ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_nor_b <= ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_sticky_ena_q;
    ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_nor_q <= not (ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_nor_a or ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_nor_b);

	--ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_mem_top(CONSTANT,1296)
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_mem_top_q <= "0101";

	--ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmp(LOGICAL,1297)
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmp_a <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_mem_top_q;
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdmux_q);
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmp_q <= "1" when ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmp_a = ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmp_b else "0";

	--ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmpReg(REG,1298)
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmpReg_q <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_sticky_ena(REG,1353)
    ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_nor_q = "1") THEN
                ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_sticky_ena_q <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_enaAnd(LOGICAL,1354)
    ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_enaAnd_a <= ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_sticky_ena_q;
    ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_enaAnd_b <= en;
    ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_enaAnd_q <= ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_enaAnd_a and ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_enaAnd_b;

	--ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_inputreg(DELAY,1342)
    ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => mAddr_uid98_fpArccosXTest_b, xout => ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt(COUNTER,1292)
    -- every=1, low=0, high=5, step=1, init=1
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_i = 4 THEN
                      ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_i <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_i - 5;
                    ELSE
                        ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_i <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_i,3));


	--ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdreg(REG,1293)
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdreg_q <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdmux(MUX,1294)
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdmux_s <= en;
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdmux: PROCESS (ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdmux_s, ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdreg_q, ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdmux_q <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdmux_q <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem(DUALMEM,1343)
    ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_reset0 <= areset;
    ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_ia <= ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_inputreg_q;
    ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_aa <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdreg_q;
    ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_ab <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdmux_q;
    ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_iq,
        address_a => ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_aa,
        data_a => ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_ia
    );
        ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_q <= ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0(REG,584)@9
    reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_q <= ld_mAddr_uid98_fpArccosXTest_b_to_reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid440_arccosXO2TabGen_lutmem(DUALMEM,492)@10
    memoryC0_uid440_arccosXO2TabGen_lutmem_reset0 <= areset;
    memoryC0_uid440_arccosXO2TabGen_lutmem_ia <= (others => '0');
    memoryC0_uid440_arccosXO2TabGen_lutmem_aa <= (others => '0');
    memoryC0_uid440_arccosXO2TabGen_lutmem_ab <= reg_mAddr_uid98_fpArccosXTest_0_to_memoryC0_uid440_arccosXO2TabGen_lutmem_0_q;
    memoryC0_uid440_arccosXO2TabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arccos_s5_memoryC0_uid440_arccosXO2TabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid440_arccosXO2TabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid440_arccosXO2TabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid440_arccosXO2TabGen_lutmem_iq,
        address_a => memoryC0_uid440_arccosXO2TabGen_lutmem_aa,
        data_a => memoryC0_uid440_arccosXO2TabGen_lutmem_ia
    );
        memoryC0_uid440_arccosXO2TabGen_lutmem_q <= memoryC0_uid440_arccosXO2TabGen_lutmem_iq(29 downto 0);

	--sumAHighB_uid453_arccosXO2PolyEval(ADD,452)@12
    sumAHighB_uid453_arccosXO2PolyEval_a <= STD_LOGIC_VECTOR((30 downto 30 => memoryC0_uid440_arccosXO2TabGen_lutmem_q(29)) & memoryC0_uid440_arccosXO2TabGen_lutmem_q);
    sumAHighB_uid453_arccosXO2PolyEval_b <= STD_LOGIC_VECTOR((30 downto 23 => highBBits_uid452_arccosXO2PolyEval_b(22)) & highBBits_uid452_arccosXO2PolyEval_b);
            sumAHighB_uid453_arccosXO2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid453_arccosXO2PolyEval_a) + SIGNED(sumAHighB_uid453_arccosXO2PolyEval_b));
    sumAHighB_uid453_arccosXO2PolyEval_q <= sumAHighB_uid453_arccosXO2PolyEval_o(30 downto 0);


	--lowRangeB_uid451_arccosXO2PolyEval(BITSELECT,450)@12
    lowRangeB_uid451_arccosXO2PolyEval_in <= prodXYTruncFR_uid482_pT2_uid450_arccosXO2PolyEval_b(1 downto 0);
    lowRangeB_uid451_arccosXO2PolyEval_b <= lowRangeB_uid451_arccosXO2PolyEval_in(1 downto 0);

	--s2_uid451_uid454_arccosXO2PolyEval(BITJOIN,453)@12
    s2_uid451_uid454_arccosXO2PolyEval_q <= sumAHighB_uid453_arccosXO2PolyEval_q & lowRangeB_uid451_arccosXO2PolyEval_b;

	--fxpArccosX_uid101_fpArccosXTest(BITSELECT,100)@12
    fxpArccosX_uid101_fpArccosXTest_in <= s2_uid451_uid454_arccosXO2PolyEval_q(30 downto 0);
    fxpArccosX_uid101_fpArccosXTest_b <= fxpArccosX_uid101_fpArccosXTest_in(30 downto 4);

	--reg_fxpArccosX_uid101_fpArccosXTest_0_to_path2Diff_uid103_fpArccosXTest_1(REG,586)@12
    reg_fxpArccosX_uid101_fpArccosXTest_0_to_path2Diff_uid103_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpArccosX_uid101_fpArccosXTest_0_to_path2Diff_uid103_fpArccosXTest_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpArccosX_uid101_fpArccosXTest_0_to_path2Diff_uid103_fpArccosXTest_1_q <= fxpArccosX_uid101_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--pi2_uid102_fpArccosXTest(CONSTANT,101)
    pi2_uid102_fpArccosXTest_q <= "110010010000111111011010101";

	--pad_pi2_uid102_uid103_fpArccosXTest(BITJOIN,102)@12
    pad_pi2_uid102_uid103_fpArccosXTest_q <= pi2_uid102_fpArccosXTest_q & GND_q;

	--reg_pad_pi2_uid102_uid103_fpArccosXTest_0_to_path2Diff_uid103_fpArccosXTest_0(REG,585)@12
    reg_pad_pi2_uid102_uid103_fpArccosXTest_0_to_path2Diff_uid103_fpArccosXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_pi2_uid102_uid103_fpArccosXTest_0_to_path2Diff_uid103_fpArccosXTest_0_q <= "0000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_pi2_uid102_uid103_fpArccosXTest_0_to_path2Diff_uid103_fpArccosXTest_0_q <= pad_pi2_uid102_uid103_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--path2Diff_uid103_fpArccosXTest(SUB,103)@13
    path2Diff_uid103_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & reg_pad_pi2_uid102_uid103_fpArccosXTest_0_to_path2Diff_uid103_fpArccosXTest_0_q);
    path2Diff_uid103_fpArccosXTest_b <= STD_LOGIC_VECTOR("00" & reg_fxpArccosX_uid101_fpArccosXTest_0_to_path2Diff_uid103_fpArccosXTest_1_q);
            path2Diff_uid103_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path2Diff_uid103_fpArccosXTest_a) - UNSIGNED(path2Diff_uid103_fpArccosXTest_b));
    path2Diff_uid103_fpArccosXTest_q <= path2Diff_uid103_fpArccosXTest_o(28 downto 0);


	--path2NegCaseFPFrac_uid106_fpArccosXTest(BITSELECT,105)@13
    path2NegCaseFPFrac_uid106_fpArccosXTest_in <= path2Diff_uid103_fpArccosXTest_q(26 downto 0);
    path2NegCaseFPFrac_uid106_fpArccosXTest_b <= path2NegCaseFPFrac_uid106_fpArccosXTest_in(26 downto 4);

	--path2NegCaseFPL_uid107_fpArccosXTest(BITJOIN,106)@13
    path2NegCaseFPL_uid107_fpArccosXTest_q <= GND_q & cstBiasP1_uid17_fpArccosXTest_q & path2NegCaseFPFrac_uid106_fpArccosXTest_b;

	--path2NegCaseFPFrac_uid109_fpArccosXTest(BITSELECT,108)@13
    path2NegCaseFPFrac_uid109_fpArccosXTest_in <= path2Diff_uid103_fpArccosXTest_q(25 downto 0);
    path2NegCaseFPFrac_uid109_fpArccosXTest_b <= path2NegCaseFPFrac_uid109_fpArccosXTest_in(25 downto 3);

	--path2NegCaseFPS_uid110_fpArccosXTest(BITJOIN,109)@13
    path2NegCaseFPS_uid110_fpArccosXTest_q <= GND_q & cstBias_uid13_fpArccosXTest_q & path2NegCaseFPFrac_uid109_fpArccosXTest_b;

	--normBit_uid105_fpArccosXTest(BITSELECT,104)@13
    normBit_uid105_fpArccosXTest_in <= path2Diff_uid103_fpArccosXTest_q(27 downto 0);
    normBit_uid105_fpArccosXTest_b <= normBit_uid105_fpArccosXTest_in(27 downto 27);

	--path2NegCaseFP_uid112_fpArccosXTest(MUX,111)@13
    path2NegCaseFP_uid112_fpArccosXTest_s <= normBit_uid105_fpArccosXTest_b;
    path2NegCaseFP_uid112_fpArccosXTest: PROCESS (path2NegCaseFP_uid112_fpArccosXTest_s, en, path2NegCaseFPS_uid110_fpArccosXTest_q, path2NegCaseFPL_uid107_fpArccosXTest_q)
    BEGIN
            CASE path2NegCaseFP_uid112_fpArccosXTest_s IS
                  WHEN "0" => path2NegCaseFP_uid112_fpArccosXTest_q <= path2NegCaseFPS_uid110_fpArccosXTest_q;
                  WHEN "1" => path2NegCaseFP_uid112_fpArccosXTest_q <= path2NegCaseFPL_uid107_fpArccosXTest_q;
                  WHEN OTHERS => path2NegCaseFP_uid112_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--path2PosCaseFPFraction_uid113_fpArccosXTest(BITSELECT,112)@12
    path2PosCaseFPFraction_uid113_fpArccosXTest_in <= fxpArccosX_uid101_fpArccosXTest_b(25 downto 0);
    path2PosCaseFPFraction_uid113_fpArccosXTest_b <= path2PosCaseFPFraction_uid113_fpArccosXTest_in(25 downto 3);

	--ld_path2PosCaseFPFraction_uid113_fpArccosXTest_b_to_path2PosCaseFP_uid114_fpArccosXTest_a(DELAY,680)@12
    ld_path2PosCaseFPFraction_uid113_fpArccosXTest_b_to_path2PosCaseFP_uid114_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => path2PosCaseFPFraction_uid113_fpArccosXTest_b, xout => ld_path2PosCaseFPFraction_uid113_fpArccosXTest_b_to_path2PosCaseFP_uid114_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--path2PosCaseFP_uid114_fpArccosXTest(BITJOIN,113)@13
    path2PosCaseFP_uid114_fpArccosXTest_q <= GND_q & cstBias_uid13_fpArccosXTest_q & ld_path2PosCaseFPFraction_uid113_fpArccosXTest_b_to_path2PosCaseFP_uid114_fpArccosXTest_a_q;

	--singX_uid8_fpArccosXTest(BITSELECT,7)@0
    singX_uid8_fpArccosXTest_in <= a;
    singX_uid8_fpArccosXTest_b <= singX_uid8_fpArccosXTest_in(31 downto 31);

	--ld_singX_uid8_fpArccosXTest_b_to_path2ResFP_uid116_fpArccosXTest_b(DELAY,681)@0
    ld_singX_uid8_fpArccosXTest_b_to_path2ResFP_uid116_fpArccosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => singX_uid8_fpArccosXTest_b, xout => ld_singX_uid8_fpArccosXTest_b_to_path2ResFP_uid116_fpArccosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--path2ResFP_uid116_fpArccosXTest(MUX,115)@13
    path2ResFP_uid116_fpArccosXTest_s <= ld_singX_uid8_fpArccosXTest_b_to_path2ResFP_uid116_fpArccosXTest_b_q;
    path2ResFP_uid116_fpArccosXTest: PROCESS (path2ResFP_uid116_fpArccosXTest_s, en, path2PosCaseFP_uid114_fpArccosXTest_q, path2NegCaseFP_uid112_fpArccosXTest_q)
    BEGIN
            CASE path2ResFP_uid116_fpArccosXTest_s IS
                  WHEN "0" => path2ResFP_uid116_fpArccosXTest_q <= path2PosCaseFP_uid114_fpArccosXTest_q;
                  WHEN "1" => path2ResFP_uid116_fpArccosXTest_q <= path2NegCaseFP_uid112_fpArccosXTest_q;
                  WHEN OTHERS => path2ResFP_uid116_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--Path2ResFP30dto23_uid123_fpArccosXTest(BITSELECT,122)@13
    Path2ResFP30dto23_uid123_fpArccosXTest_in <= path2ResFP_uid116_fpArccosXTest_q(30 downto 0);
    Path2ResFP30dto23_uid123_fpArccosXTest_b <= Path2ResFP30dto23_uid123_fpArccosXTest_in(30 downto 23);

	--reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3(REG,590)@13
    reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q <= Path2ResFP30dto23_uid123_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt(COUNTER,1214)
    -- every=1, low=0, high=25, step=1, init=1
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_i = 24 THEN
                      ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_eq = '1') THEN
                        ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_i <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_i - 25;
                    ELSE
                        ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_i <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_i,5));


	--ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdreg(REG,1215)
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdreg_q <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdmux(MUX,1216)
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdmux_s <= en;
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdmux: PROCESS (ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdmux_s, ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdreg_q, ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdmux_q <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdreg_q;
                  WHEN "1" => ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdmux_q <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem(DUALMEM,1213)
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_reset0 <= areset;
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_ia <= reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q;
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_aa <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdreg_q;
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_ab <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdmux_q;
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_iq,
        address_a => ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_aa,
        data_a => ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_ia
    );
        ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_q <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_iq(7 downto 0);

	--ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_outputreg(DELAY,1212)
    ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_mem_q, xout => ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--RightShiftStage123dto1_uid434_alignArcsinL_uid84_fpArccosXTest(BITSELECT,433)@39
    RightShiftStage123dto1_uid434_alignArcsinL_uid84_fpArccosXTest_in <= rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_q;
    RightShiftStage123dto1_uid434_alignArcsinL_uid84_fpArccosXTest_b <= RightShiftStage123dto1_uid434_alignArcsinL_uid84_fpArccosXTest_in(23 downto 1);

	--rightShiftStage2Idx1_uid436_alignArcsinL_uid84_fpArccosXTest(BITJOIN,435)@39
    rightShiftStage2Idx1_uid436_alignArcsinL_uid84_fpArccosXTest_q <= GND_q & RightShiftStage123dto1_uid434_alignArcsinL_uid84_fpArccosXTest_b;

	--rightShiftStage1Idx3Pad6_uid286_alignSqrt_uid69_fpArccosXTest(CONSTANT,285)
    rightShiftStage1Idx3Pad6_uid286_alignSqrt_uid69_fpArccosXTest_q <= "000000";

	--RightShiftStage023dto6_uid429_alignArcsinL_uid84_fpArccosXTest(BITSELECT,428)@39
    RightShiftStage023dto6_uid429_alignArcsinL_uid84_fpArccosXTest_in <= rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_q;
    RightShiftStage023dto6_uid429_alignArcsinL_uid84_fpArccosXTest_b <= RightShiftStage023dto6_uid429_alignArcsinL_uid84_fpArccosXTest_in(23 downto 6);

	--rightShiftStage1Idx3_uid431_alignArcsinL_uid84_fpArccosXTest(BITJOIN,430)@39
    rightShiftStage1Idx3_uid431_alignArcsinL_uid84_fpArccosXTest_q <= rightShiftStage1Idx3Pad6_uid286_alignSqrt_uid69_fpArccosXTest_q & RightShiftStage023dto6_uid429_alignArcsinL_uid84_fpArccosXTest_b;

	--RightShiftStage023dto4_uid426_alignArcsinL_uid84_fpArccosXTest(BITSELECT,425)@39
    RightShiftStage023dto4_uid426_alignArcsinL_uid84_fpArccosXTest_in <= rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_q;
    RightShiftStage023dto4_uid426_alignArcsinL_uid84_fpArccosXTest_b <= RightShiftStage023dto4_uid426_alignArcsinL_uid84_fpArccosXTest_in(23 downto 4);

	--rightShiftStage1Idx2_uid428_alignArcsinL_uid84_fpArccosXTest(BITJOIN,427)@39
    rightShiftStage1Idx2_uid428_alignArcsinL_uid84_fpArccosXTest_q <= rightShiftStage1Idx1Pad4_uid145_fxpX_uid50_fpArccosXTest_q & RightShiftStage023dto4_uid426_alignArcsinL_uid84_fpArccosXTest_b;

	--RightShiftStage023dto2_uid423_alignArcsinL_uid84_fpArccosXTest(BITSELECT,422)@39
    RightShiftStage023dto2_uid423_alignArcsinL_uid84_fpArccosXTest_in <= rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_q;
    RightShiftStage023dto2_uid423_alignArcsinL_uid84_fpArccosXTest_b <= RightShiftStage023dto2_uid423_alignArcsinL_uid84_fpArccosXTest_in(23 downto 2);

	--rightShiftStage1Idx1_uid425_alignArcsinL_uid84_fpArccosXTest(BITJOIN,424)@39
    rightShiftStage1Idx1_uid425_alignArcsinL_uid84_fpArccosXTest_q <= rightShiftStage2Idx2Pad2_uid159_fxpX_uid50_fpArccosXTest_q & RightShiftStage023dto2_uid423_alignArcsinL_uid84_fpArccosXTest_b;

	--rightShiftStage0Idx3_uid276_alignSqrt_uid69_fpArccosXTest(CONSTANT,275)
    rightShiftStage0Idx3_uid276_alignSqrt_uid69_fpArccosXTest_q <= "000000000000000000000000";

	--cstAllZWF_uid10_fpArccosXTest(CONSTANT,9)
    cstAllZWF_uid10_fpArccosXTest_q <= "00000000000000000000000";

	--maxCountVal_uid210_fpLOut1_uid57_fpArccosXTest(CONSTANT,209)
    maxCountVal_uid210_fpLOut1_uid57_fpArccosXTest_q <= "100011";

	--reg_y_uid52_fpArccosXTest_0_to_oMy_uid54_fpArccosXTest_1(REG,506)@1
    reg_y_uid52_fpArccosXTest_0_to_oMy_uid54_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_y_uid52_fpArccosXTest_0_to_oMy_uid54_fpArccosXTest_1_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_y_uid52_fpArccosXTest_0_to_oMy_uid54_fpArccosXTest_1_q <= y_uid52_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--pad_o_uid18_uid54_fpArccosXTest(BITJOIN,53)@1
    pad_o_uid18_uid54_fpArccosXTest_q <= VCC_q & STD_LOGIC_VECTOR((34 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_o_uid18_uid54_fpArccosXTest_0_to_oMy_uid54_fpArccosXTest_0(REG,505)@1
    reg_pad_o_uid18_uid54_fpArccosXTest_0_to_oMy_uid54_fpArccosXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_o_uid18_uid54_fpArccosXTest_0_to_oMy_uid54_fpArccosXTest_0_q <= "000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_o_uid18_uid54_fpArccosXTest_0_to_oMy_uid54_fpArccosXTest_0_q <= pad_o_uid18_uid54_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--oMy_uid54_fpArccosXTest(SUB,54)@2
    oMy_uid54_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & reg_pad_o_uid18_uid54_fpArccosXTest_0_to_oMy_uid54_fpArccosXTest_0_q);
    oMy_uid54_fpArccosXTest_b <= STD_LOGIC_VECTOR("00" & reg_y_uid52_fpArccosXTest_0_to_oMy_uid54_fpArccosXTest_1_q);
            oMy_uid54_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMy_uid54_fpArccosXTest_a) - UNSIGNED(oMy_uid54_fpArccosXTest_b));
    oMy_uid54_fpArccosXTest_q <= oMy_uid54_fpArccosXTest_o(36 downto 0);


	--l_uid56_fpArccosXTest(BITSELECT,55)@2
    l_uid56_fpArccosXTest_in <= oMy_uid54_fpArccosXTest_q(34 downto 0);
    l_uid56_fpArccosXTest_b <= l_uid56_fpArccosXTest_in(34 downto 0);

	--rVStage_uid168_fpLOut1_uid57_fpArccosXTest(BITSELECT,167)@2
    rVStage_uid168_fpLOut1_uid57_fpArccosXTest_in <= l_uid56_fpArccosXTest_b;
    rVStage_uid168_fpLOut1_uid57_fpArccosXTest_b <= rVStage_uid168_fpLOut1_uid57_fpArccosXTest_in(34 downto 3);

	--reg_rVStage_uid168_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid169_fpLOut1_uid57_fpArccosXTest_1(REG,507)@2
    reg_rVStage_uid168_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid169_fpLOut1_uid57_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid168_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid169_fpLOut1_uid57_fpArccosXTest_1_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid168_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid169_fpLOut1_uid57_fpArccosXTest_1_q <= rVStage_uid168_fpLOut1_uid57_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid169_fpLOut1_uid57_fpArccosXTest(LOGICAL,168)@3
    vCount_uid169_fpLOut1_uid57_fpArccosXTest_a <= reg_rVStage_uid168_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid169_fpLOut1_uid57_fpArccosXTest_1_q;
    vCount_uid169_fpLOut1_uid57_fpArccosXTest_b <= rightShiftStage0Idx2Pad32_uid139_fxpX_uid50_fpArccosXTest_q;
    vCount_uid169_fpLOut1_uid57_fpArccosXTest_q <= "1" when vCount_uid169_fpLOut1_uid57_fpArccosXTest_a = vCount_uid169_fpLOut1_uid57_fpArccosXTest_b else "0";

	--ld_vCount_uid169_fpLOut1_uid57_fpArccosXTest_q_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_f(DELAY,792)@3
    ld_vCount_uid169_fpLOut1_uid57_fpArccosXTest_q_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid169_fpLOut1_uid57_fpArccosXTest_q, xout => ld_vCount_uid169_fpLOut1_uid57_fpArccosXTest_q_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid171_fpLOut1_uid57_fpArccosXTest(BITSELECT,170)@2
    vStage_uid171_fpLOut1_uid57_fpArccosXTest_in <= l_uid56_fpArccosXTest_b(2 downto 0);
    vStage_uid171_fpLOut1_uid57_fpArccosXTest_b <= vStage_uid171_fpLOut1_uid57_fpArccosXTest_in(2 downto 0);

	--cStage_uid172_fpLOut1_uid57_fpArccosXTest(BITJOIN,171)@2
    cStage_uid172_fpLOut1_uid57_fpArccosXTest_q <= vStage_uid171_fpLOut1_uid57_fpArccosXTest_b & rightShiftStage0Idx2Pad32_uid139_fxpX_uid50_fpArccosXTest_q;

	--reg_cStage_uid172_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_3(REG,509)@2
    reg_cStage_uid172_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid172_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid172_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_3_q <= cStage_uid172_fpLOut1_uid57_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_l_uid56_fpArccosXTest_0_to_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_2(REG,508)@2
    reg_l_uid56_fpArccosXTest_0_to_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_l_uid56_fpArccosXTest_0_to_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_l_uid56_fpArccosXTest_0_to_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_2_q <= l_uid56_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid173_fpLOut1_uid57_fpArccosXTest(MUX,172)@3
    vStagei_uid173_fpLOut1_uid57_fpArccosXTest_s <= vCount_uid169_fpLOut1_uid57_fpArccosXTest_q;
    vStagei_uid173_fpLOut1_uid57_fpArccosXTest: PROCESS (vStagei_uid173_fpLOut1_uid57_fpArccosXTest_s, en, reg_l_uid56_fpArccosXTest_0_to_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_2_q, reg_cStage_uid172_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_3_q)
    BEGIN
            CASE vStagei_uid173_fpLOut1_uid57_fpArccosXTest_s IS
                  WHEN "0" => vStagei_uid173_fpLOut1_uid57_fpArccosXTest_q <= reg_l_uid56_fpArccosXTest_0_to_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_2_q;
                  WHEN "1" => vStagei_uid173_fpLOut1_uid57_fpArccosXTest_q <= reg_cStage_uid172_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_3_q;
                  WHEN OTHERS => vStagei_uid173_fpLOut1_uid57_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid175_fpLOut1_uid57_fpArccosXTest(BITSELECT,174)@3
    rVStage_uid175_fpLOut1_uid57_fpArccosXTest_in <= vStagei_uid173_fpLOut1_uid57_fpArccosXTest_q;
    rVStage_uid175_fpLOut1_uid57_fpArccosXTest_b <= rVStage_uid175_fpLOut1_uid57_fpArccosXTest_in(34 downto 19);

	--reg_rVStage_uid175_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid176_fpLOut1_uid57_fpArccosXTest_1(REG,510)@3
    reg_rVStage_uid175_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid176_fpLOut1_uid57_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid175_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid176_fpLOut1_uid57_fpArccosXTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid175_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid176_fpLOut1_uid57_fpArccosXTest_1_q <= rVStage_uid175_fpLOut1_uid57_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid176_fpLOut1_uid57_fpArccosXTest(LOGICAL,175)@4
    vCount_uid176_fpLOut1_uid57_fpArccosXTest_a <= reg_rVStage_uid175_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid176_fpLOut1_uid57_fpArccosXTest_1_q;
    vCount_uid176_fpLOut1_uid57_fpArccosXTest_b <= rightShiftStage0Idx1Pad16_uid136_fxpX_uid50_fpArccosXTest_q;
    vCount_uid176_fpLOut1_uid57_fpArccosXTest_q <= "1" when vCount_uid176_fpLOut1_uid57_fpArccosXTest_a = vCount_uid176_fpLOut1_uid57_fpArccosXTest_b else "0";

	--ld_vCount_uid176_fpLOut1_uid57_fpArccosXTest_q_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_e(DELAY,791)@4
    ld_vCount_uid176_fpLOut1_uid57_fpArccosXTest_q_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid176_fpLOut1_uid57_fpArccosXTest_q, xout => ld_vCount_uid176_fpLOut1_uid57_fpArccosXTest_q_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid178_fpLOut1_uid57_fpArccosXTest(BITSELECT,177)@3
    vStage_uid178_fpLOut1_uid57_fpArccosXTest_in <= vStagei_uid173_fpLOut1_uid57_fpArccosXTest_q(18 downto 0);
    vStage_uid178_fpLOut1_uid57_fpArccosXTest_b <= vStage_uid178_fpLOut1_uid57_fpArccosXTest_in(18 downto 0);

	--cStage_uid179_fpLOut1_uid57_fpArccosXTest(BITJOIN,178)@3
    cStage_uid179_fpLOut1_uid57_fpArccosXTest_q <= vStage_uid178_fpLOut1_uid57_fpArccosXTest_b & rightShiftStage0Idx1Pad16_uid136_fxpX_uid50_fpArccosXTest_q;

	--reg_cStage_uid179_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid180_fpLOut1_uid57_fpArccosXTest_3(REG,512)@3
    reg_cStage_uid179_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid180_fpLOut1_uid57_fpArccosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid179_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid180_fpLOut1_uid57_fpArccosXTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid179_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid180_fpLOut1_uid57_fpArccosXTest_3_q <= cStage_uid179_fpLOut1_uid57_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid180_fpLOut1_uid57_fpArccosXTest_2(REG,511)@3
    reg_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid180_fpLOut1_uid57_fpArccosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid180_fpLOut1_uid57_fpArccosXTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid180_fpLOut1_uid57_fpArccosXTest_2_q <= vStagei_uid173_fpLOut1_uid57_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid180_fpLOut1_uid57_fpArccosXTest(MUX,179)@4
    vStagei_uid180_fpLOut1_uid57_fpArccosXTest_s <= vCount_uid176_fpLOut1_uid57_fpArccosXTest_q;
    vStagei_uid180_fpLOut1_uid57_fpArccosXTest: PROCESS (vStagei_uid180_fpLOut1_uid57_fpArccosXTest_s, en, reg_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid180_fpLOut1_uid57_fpArccosXTest_2_q, reg_cStage_uid179_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid180_fpLOut1_uid57_fpArccosXTest_3_q)
    BEGIN
            CASE vStagei_uid180_fpLOut1_uid57_fpArccosXTest_s IS
                  WHEN "0" => vStagei_uid180_fpLOut1_uid57_fpArccosXTest_q <= reg_vStagei_uid173_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid180_fpLOut1_uid57_fpArccosXTest_2_q;
                  WHEN "1" => vStagei_uid180_fpLOut1_uid57_fpArccosXTest_q <= reg_cStage_uid179_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid180_fpLOut1_uid57_fpArccosXTest_3_q;
                  WHEN OTHERS => vStagei_uid180_fpLOut1_uid57_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid182_fpLOut1_uid57_fpArccosXTest(BITSELECT,181)@4
    rVStage_uid182_fpLOut1_uid57_fpArccosXTest_in <= vStagei_uid180_fpLOut1_uid57_fpArccosXTest_q;
    rVStage_uid182_fpLOut1_uid57_fpArccosXTest_b <= rVStage_uid182_fpLOut1_uid57_fpArccosXTest_in(34 downto 27);

	--vCount_uid183_fpLOut1_uid57_fpArccosXTest(LOGICAL,182)@4
    vCount_uid183_fpLOut1_uid57_fpArccosXTest_a <= rVStage_uid182_fpLOut1_uid57_fpArccosXTest_b;
    vCount_uid183_fpLOut1_uid57_fpArccosXTest_b <= cstAllZWE_uid12_fpArccosXTest_q;
    vCount_uid183_fpLOut1_uid57_fpArccosXTest_q <= "1" when vCount_uid183_fpLOut1_uid57_fpArccosXTest_a = vCount_uid183_fpLOut1_uid57_fpArccosXTest_b else "0";

	--reg_vCount_uid183_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_3(REG,516)@4
    reg_vCount_uid183_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid183_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid183_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_3_q <= vCount_uid183_fpLOut1_uid57_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid185_fpLOut1_uid57_fpArccosXTest(BITSELECT,184)@4
    vStage_uid185_fpLOut1_uid57_fpArccosXTest_in <= vStagei_uid180_fpLOut1_uid57_fpArccosXTest_q(26 downto 0);
    vStage_uid185_fpLOut1_uid57_fpArccosXTest_b <= vStage_uid185_fpLOut1_uid57_fpArccosXTest_in(26 downto 0);

	--cStage_uid186_fpLOut1_uid57_fpArccosXTest(BITJOIN,185)@4
    cStage_uid186_fpLOut1_uid57_fpArccosXTest_q <= vStage_uid185_fpLOut1_uid57_fpArccosXTest_b & cstAllZWE_uid12_fpArccosXTest_q;

	--vStagei_uid187_fpLOut1_uid57_fpArccosXTest(MUX,186)@4
    vStagei_uid187_fpLOut1_uid57_fpArccosXTest_s <= vCount_uid183_fpLOut1_uid57_fpArccosXTest_q;
    vStagei_uid187_fpLOut1_uid57_fpArccosXTest: PROCESS (vStagei_uid187_fpLOut1_uid57_fpArccosXTest_s, en, vStagei_uid180_fpLOut1_uid57_fpArccosXTest_q, cStage_uid186_fpLOut1_uid57_fpArccosXTest_q)
    BEGIN
            CASE vStagei_uid187_fpLOut1_uid57_fpArccosXTest_s IS
                  WHEN "0" => vStagei_uid187_fpLOut1_uid57_fpArccosXTest_q <= vStagei_uid180_fpLOut1_uid57_fpArccosXTest_q;
                  WHEN "1" => vStagei_uid187_fpLOut1_uid57_fpArccosXTest_q <= cStage_uid186_fpLOut1_uid57_fpArccosXTest_q;
                  WHEN OTHERS => vStagei_uid187_fpLOut1_uid57_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid189_fpLOut1_uid57_fpArccosXTest(BITSELECT,188)@4
    rVStage_uid189_fpLOut1_uid57_fpArccosXTest_in <= vStagei_uid187_fpLOut1_uid57_fpArccosXTest_q;
    rVStage_uid189_fpLOut1_uid57_fpArccosXTest_b <= rVStage_uid189_fpLOut1_uid57_fpArccosXTest_in(34 downto 31);

	--reg_rVStage_uid189_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid190_fpLOut1_uid57_fpArccosXTest_1(REG,513)@4
    reg_rVStage_uid189_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid190_fpLOut1_uid57_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid189_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid190_fpLOut1_uid57_fpArccosXTest_1_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid189_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid190_fpLOut1_uid57_fpArccosXTest_1_q <= rVStage_uid189_fpLOut1_uid57_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid190_fpLOut1_uid57_fpArccosXTest(LOGICAL,189)@5
    vCount_uid190_fpLOut1_uid57_fpArccosXTest_a <= reg_rVStage_uid189_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid190_fpLOut1_uid57_fpArccosXTest_1_q;
    vCount_uid190_fpLOut1_uid57_fpArccosXTest_b <= rightShiftStage1Idx1Pad4_uid145_fxpX_uid50_fpArccosXTest_q;
    vCount_uid190_fpLOut1_uid57_fpArccosXTest_q <= "1" when vCount_uid190_fpLOut1_uid57_fpArccosXTest_a = vCount_uid190_fpLOut1_uid57_fpArccosXTest_b else "0";

	--vStage_uid192_fpLOut1_uid57_fpArccosXTest(BITSELECT,191)@4
    vStage_uid192_fpLOut1_uid57_fpArccosXTest_in <= vStagei_uid187_fpLOut1_uid57_fpArccosXTest_q(30 downto 0);
    vStage_uid192_fpLOut1_uid57_fpArccosXTest_b <= vStage_uid192_fpLOut1_uid57_fpArccosXTest_in(30 downto 0);

	--cStage_uid193_fpLOut1_uid57_fpArccosXTest(BITJOIN,192)@4
    cStage_uid193_fpLOut1_uid57_fpArccosXTest_q <= vStage_uid192_fpLOut1_uid57_fpArccosXTest_b & rightShiftStage1Idx1Pad4_uid145_fxpX_uid50_fpArccosXTest_q;

	--reg_cStage_uid193_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid194_fpLOut1_uid57_fpArccosXTest_3(REG,515)@4
    reg_cStage_uid193_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid194_fpLOut1_uid57_fpArccosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid193_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid194_fpLOut1_uid57_fpArccosXTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid193_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid194_fpLOut1_uid57_fpArccosXTest_3_q <= cStage_uid193_fpLOut1_uid57_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_vStagei_uid187_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid194_fpLOut1_uid57_fpArccosXTest_2(REG,514)@4
    reg_vStagei_uid187_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid194_fpLOut1_uid57_fpArccosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStagei_uid187_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid194_fpLOut1_uid57_fpArccosXTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStagei_uid187_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid194_fpLOut1_uid57_fpArccosXTest_2_q <= vStagei_uid187_fpLOut1_uid57_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid194_fpLOut1_uid57_fpArccosXTest(MUX,193)@5
    vStagei_uid194_fpLOut1_uid57_fpArccosXTest_s <= vCount_uid190_fpLOut1_uid57_fpArccosXTest_q;
    vStagei_uid194_fpLOut1_uid57_fpArccosXTest: PROCESS (vStagei_uid194_fpLOut1_uid57_fpArccosXTest_s, en, reg_vStagei_uid187_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid194_fpLOut1_uid57_fpArccosXTest_2_q, reg_cStage_uid193_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid194_fpLOut1_uid57_fpArccosXTest_3_q)
    BEGIN
            CASE vStagei_uid194_fpLOut1_uid57_fpArccosXTest_s IS
                  WHEN "0" => vStagei_uid194_fpLOut1_uid57_fpArccosXTest_q <= reg_vStagei_uid187_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid194_fpLOut1_uid57_fpArccosXTest_2_q;
                  WHEN "1" => vStagei_uid194_fpLOut1_uid57_fpArccosXTest_q <= reg_cStage_uid193_fpLOut1_uid57_fpArccosXTest_0_to_vStagei_uid194_fpLOut1_uid57_fpArccosXTest_3_q;
                  WHEN OTHERS => vStagei_uid194_fpLOut1_uid57_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid196_fpLOut1_uid57_fpArccosXTest(BITSELECT,195)@5
    rVStage_uid196_fpLOut1_uid57_fpArccosXTest_in <= vStagei_uid194_fpLOut1_uid57_fpArccosXTest_q;
    rVStage_uid196_fpLOut1_uid57_fpArccosXTest_b <= rVStage_uid196_fpLOut1_uid57_fpArccosXTest_in(34 downto 33);

	--vCount_uid197_fpLOut1_uid57_fpArccosXTest(LOGICAL,196)@5
    vCount_uid197_fpLOut1_uid57_fpArccosXTest_a <= rVStage_uid196_fpLOut1_uid57_fpArccosXTest_b;
    vCount_uid197_fpLOut1_uid57_fpArccosXTest_b <= rightShiftStage2Idx2Pad2_uid159_fxpX_uid50_fpArccosXTest_q;
    vCount_uid197_fpLOut1_uid57_fpArccosXTest_q <= "1" when vCount_uid197_fpLOut1_uid57_fpArccosXTest_a = vCount_uid197_fpLOut1_uid57_fpArccosXTest_b else "0";

	--vStage_uid199_fpLOut1_uid57_fpArccosXTest(BITSELECT,198)@5
    vStage_uid199_fpLOut1_uid57_fpArccosXTest_in <= vStagei_uid194_fpLOut1_uid57_fpArccosXTest_q(32 downto 0);
    vStage_uid199_fpLOut1_uid57_fpArccosXTest_b <= vStage_uid199_fpLOut1_uid57_fpArccosXTest_in(32 downto 0);

	--cStage_uid200_fpLOut1_uid57_fpArccosXTest(BITJOIN,199)@5
    cStage_uid200_fpLOut1_uid57_fpArccosXTest_q <= vStage_uid199_fpLOut1_uid57_fpArccosXTest_b & rightShiftStage2Idx2Pad2_uid159_fxpX_uid50_fpArccosXTest_q;

	--vStagei_uid201_fpLOut1_uid57_fpArccosXTest(MUX,200)@5
    vStagei_uid201_fpLOut1_uid57_fpArccosXTest_s <= vCount_uid197_fpLOut1_uid57_fpArccosXTest_q;
    vStagei_uid201_fpLOut1_uid57_fpArccosXTest: PROCESS (vStagei_uid201_fpLOut1_uid57_fpArccosXTest_s, en, vStagei_uid194_fpLOut1_uid57_fpArccosXTest_q, cStage_uid200_fpLOut1_uid57_fpArccosXTest_q)
    BEGIN
            CASE vStagei_uid201_fpLOut1_uid57_fpArccosXTest_s IS
                  WHEN "0" => vStagei_uid201_fpLOut1_uid57_fpArccosXTest_q <= vStagei_uid194_fpLOut1_uid57_fpArccosXTest_q;
                  WHEN "1" => vStagei_uid201_fpLOut1_uid57_fpArccosXTest_q <= cStage_uid200_fpLOut1_uid57_fpArccosXTest_q;
                  WHEN OTHERS => vStagei_uid201_fpLOut1_uid57_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid203_fpLOut1_uid57_fpArccosXTest(BITSELECT,202)@5
    rVStage_uid203_fpLOut1_uid57_fpArccosXTest_in <= vStagei_uid201_fpLOut1_uid57_fpArccosXTest_q;
    rVStage_uid203_fpLOut1_uid57_fpArccosXTest_b <= rVStage_uid203_fpLOut1_uid57_fpArccosXTest_in(34 downto 34);

	--vCount_uid204_fpLOut1_uid57_fpArccosXTest(LOGICAL,203)@5
    vCount_uid204_fpLOut1_uid57_fpArccosXTest_a <= rVStage_uid203_fpLOut1_uid57_fpArccosXTest_b;
    vCount_uid204_fpLOut1_uid57_fpArccosXTest_b <= GND_q;
    vCount_uid204_fpLOut1_uid57_fpArccosXTest_q <= "1" when vCount_uid204_fpLOut1_uid57_fpArccosXTest_a = vCount_uid204_fpLOut1_uid57_fpArccosXTest_b else "0";

	--vCount_uid209_fpLOut1_uid57_fpArccosXTest(BITJOIN,208)@5
    vCount_uid209_fpLOut1_uid57_fpArccosXTest_q <= ld_vCount_uid169_fpLOut1_uid57_fpArccosXTest_q_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_f_q & ld_vCount_uid176_fpLOut1_uid57_fpArccosXTest_q_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_e_q & reg_vCount_uid183_fpLOut1_uid57_fpArccosXTest_0_to_vCount_uid209_fpLOut1_uid57_fpArccosXTest_3_q & vCount_uid190_fpLOut1_uid57_fpArccosXTest_q & vCount_uid197_fpLOut1_uid57_fpArccosXTest_q & vCount_uid204_fpLOut1_uid57_fpArccosXTest_q;

	--ld_vCount_uid209_fpLOut1_uid57_fpArccosXTest_q_to_vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest_c(DELAY,795)@5
    ld_vCount_uid209_fpLOut1_uid57_fpArccosXTest_q_to_vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest_c : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => vCount_uid209_fpLOut1_uid57_fpArccosXTest_q, xout => ld_vCount_uid209_fpLOut1_uid57_fpArccosXTest_q_to_vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid209_fpLOut1_uid57_fpArccosXTest_0_to_vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_1(REG,517)@5
    reg_vCount_uid209_fpLOut1_uid57_fpArccosXTest_0_to_vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid209_fpLOut1_uid57_fpArccosXTest_0_to_vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_1_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid209_fpLOut1_uid57_fpArccosXTest_0_to_vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_1_q <= vCount_uid209_fpLOut1_uid57_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vCountBig_uid211_fpLOut1_uid57_fpArccosXTest(COMPARE,210)@6
    vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_cin <= GND_q;
    vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_a <= STD_LOGIC_VECTOR("00" & maxCountVal_uid210_fpLOut1_uid57_fpArccosXTest_q) & '0';
    vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_b <= STD_LOGIC_VECTOR("00" & reg_vCount_uid209_fpLOut1_uid57_fpArccosXTest_0_to_vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_1_q) & vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_cin(0);
            vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_a) - UNSIGNED(vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_b));
    vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_c(0) <= vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_o(8);


	--vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest(MUX,212)@6
    vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest_s <= vCountBig_uid211_fpLOut1_uid57_fpArccosXTest_c;
    vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest_s IS
                      WHEN "0" => vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest_q <= ld_vCount_uid209_fpLOut1_uid57_fpArccosXTest_q_to_vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest_c_q;
                      WHEN "1" => vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest_q <= maxCountVal_uid210_fpLOut1_uid57_fpArccosXTest_q;
                      WHEN OTHERS => vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--cstBiasM2_uid16_fpArccosXTest(CONSTANT,15)
    cstBiasM2_uid16_fpArccosXTest_q <= "01111101";

	--expL_uid58_fpArccosXTest(SUB,57)@7
    expL_uid58_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM2_uid16_fpArccosXTest_q);
    expL_uid58_fpArccosXTest_b <= STD_LOGIC_VECTOR("000" & vCountFinal_uid213_fpLOut1_uid57_fpArccosXTest_q);
            expL_uid58_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expL_uid58_fpArccosXTest_a) - UNSIGNED(expL_uid58_fpArccosXTest_b));
    expL_uid58_fpArccosXTest_q <= expL_uid58_fpArccosXTest_o(8 downto 0);


	--expLRange_uid60_fpArccosXTest(BITSELECT,59)@7
    expLRange_uid60_fpArccosXTest_in <= expL_uid58_fpArccosXTest_q(7 downto 0);
    expLRange_uid60_fpArccosXTest_b <= expLRange_uid60_fpArccosXTest_in(7 downto 0);

	--vStage_uid206_fpLOut1_uid57_fpArccosXTest(BITSELECT,205)@5
    vStage_uid206_fpLOut1_uid57_fpArccosXTest_in <= vStagei_uid201_fpLOut1_uid57_fpArccosXTest_q(33 downto 0);
    vStage_uid206_fpLOut1_uid57_fpArccosXTest_b <= vStage_uid206_fpLOut1_uid57_fpArccosXTest_in(33 downto 0);

	--cStage_uid207_fpLOut1_uid57_fpArccosXTest(BITJOIN,206)@5
    cStage_uid207_fpLOut1_uid57_fpArccosXTest_q <= vStage_uid206_fpLOut1_uid57_fpArccosXTest_b & GND_q;

	--vStagei_uid208_fpLOut1_uid57_fpArccosXTest(MUX,207)@5
    vStagei_uid208_fpLOut1_uid57_fpArccosXTest_s <= vCount_uid204_fpLOut1_uid57_fpArccosXTest_q;
    vStagei_uid208_fpLOut1_uid57_fpArccosXTest: PROCESS (vStagei_uid208_fpLOut1_uid57_fpArccosXTest_s, en, vStagei_uid201_fpLOut1_uid57_fpArccosXTest_q, cStage_uid207_fpLOut1_uid57_fpArccosXTest_q)
    BEGIN
            CASE vStagei_uid208_fpLOut1_uid57_fpArccosXTest_s IS
                  WHEN "0" => vStagei_uid208_fpLOut1_uid57_fpArccosXTest_q <= vStagei_uid201_fpLOut1_uid57_fpArccosXTest_q;
                  WHEN "1" => vStagei_uid208_fpLOut1_uid57_fpArccosXTest_q <= cStage_uid207_fpLOut1_uid57_fpArccosXTest_q;
                  WHEN OTHERS => vStagei_uid208_fpLOut1_uid57_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fpLOutFrac_uid59_fpArccosXTest(BITSELECT,58)@5
    fpLOutFrac_uid59_fpArccosXTest_in <= vStagei_uid208_fpLOut1_uid57_fpArccosXTest_q(33 downto 0);
    fpLOutFrac_uid59_fpArccosXTest_b <= fpLOutFrac_uid59_fpArccosXTest_in(33 downto 11);

	--ld_fpLOutFrac_uid59_fpArccosXTest_b_to_reg_fpLOutFrac_uid59_fpArccosXTest_0_to_fpL_uid61_fpArccosXTest_0_a(DELAY,1111)@5
    ld_fpLOutFrac_uid59_fpArccosXTest_b_to_reg_fpLOutFrac_uid59_fpArccosXTest_0_to_fpL_uid61_fpArccosXTest_0_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fpLOutFrac_uid59_fpArccosXTest_b, xout => ld_fpLOutFrac_uid59_fpArccosXTest_b_to_reg_fpLOutFrac_uid59_fpArccosXTest_0_to_fpL_uid61_fpArccosXTest_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_fpLOutFrac_uid59_fpArccosXTest_0_to_fpL_uid61_fpArccosXTest_0(REG,518)@6
    reg_fpLOutFrac_uid59_fpArccosXTest_0_to_fpL_uid61_fpArccosXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fpLOutFrac_uid59_fpArccosXTest_0_to_fpL_uid61_fpArccosXTest_0_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fpLOutFrac_uid59_fpArccosXTest_0_to_fpL_uid61_fpArccosXTest_0_q <= ld_fpLOutFrac_uid59_fpArccosXTest_b_to_reg_fpLOutFrac_uid59_fpArccosXTest_0_to_fpL_uid61_fpArccosXTest_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--fpL_uid61_fpArccosXTest(BITJOIN,60)@7
    fpL_uid61_fpArccosXTest_q <= GND_q & expLRange_uid60_fpArccosXTest_b & reg_fpLOutFrac_uid59_fpArccosXTest_0_to_fpL_uid61_fpArccosXTest_0_q;

	--signX_uid218_sqrtFPL_uid63_fpArccosXTest(BITSELECT,217)@7
    signX_uid218_sqrtFPL_uid63_fpArccosXTest_in <= fpL_uid61_fpArccosXTest_q;
    signX_uid218_sqrtFPL_uid63_fpArccosXTest_b <= signX_uid218_sqrtFPL_uid63_fpArccosXTest_in(31 downto 31);

	--expX_uid216_sqrtFPL_uid63_fpArccosXTest(BITSELECT,215)@7
    expX_uid216_sqrtFPL_uid63_fpArccosXTest_in <= fpL_uid61_fpArccosXTest_q(30 downto 0);
    expX_uid216_sqrtFPL_uid63_fpArccosXTest_b <= expX_uid216_sqrtFPL_uid63_fpArccosXTest_in(30 downto 23);

	--expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest(LOGICAL,222)@7
    expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_a <= expX_uid216_sqrtFPL_uid63_fpArccosXTest_b;
    expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_b <= cstAllZWE_uid12_fpArccosXTest_q;
    expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_q <= "1" when expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_a = expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_b else "0";

	--negZero_uid266_sqrtFPL_uid63_fpArccosXTest(LOGICAL,265)@7
    negZero_uid266_sqrtFPL_uid63_fpArccosXTest_a <= expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_q;
    negZero_uid266_sqrtFPL_uid63_fpArccosXTest_b <= signX_uid218_sqrtFPL_uid63_fpArccosXTest_b;
    negZero_uid266_sqrtFPL_uid63_fpArccosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            negZero_uid266_sqrtFPL_uid63_fpArccosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            negZero_uid266_sqrtFPL_uid63_fpArccosXTest_q <= negZero_uid266_sqrtFPL_uid63_fpArccosXTest_a and negZero_uid266_sqrtFPL_uid63_fpArccosXTest_b;
        END IF;
    END PROCESS;



	--ld_negZero_uid266_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_c(DELAY,851)@8
    ld_negZero_uid266_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 10 )
    PORT MAP ( xin => negZero_uid266_sqrtFPL_uid63_fpArccosXTest_q, xout => ld_negZero_uid266_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_nor(LOGICAL,1249)
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_nor_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q;
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_nor_b <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_sticky_ena_q;
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_nor_q <= not (ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_nor_a or ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_nor_b);

	--ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_mem_top(CONSTANT,1245)
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_mem_top_q <= "0110";

	--ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmp(LOGICAL,1246)
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmp_a <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_mem_top_q;
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdmux_q);
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmp_q <= "1" when ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmp_a = ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmp_b else "0";

	--ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmpReg(REG,1247)
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmpReg_q <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_sticky_ena(REG,1250)
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_nor_q = "1") THEN
                ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_sticky_ena_q <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_enaAnd(LOGICAL,1251)
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_enaAnd_a <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_sticky_ena_q;
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_enaAnd_b <= en;
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_enaAnd_q <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_enaAnd_a and ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_enaAnd_b;

	--cstBiasM1_uid14_fpArccosXTest(CONSTANT,13)
    cstBiasM1_uid14_fpArccosXTest_q <= "01111110";

	--reg_expX_uid216_sqrtFPL_uid63_fpArccosXTest_0_to_expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_0(REG,528)@7
    reg_expX_uid216_sqrtFPL_uid63_fpArccosXTest_0_to_expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expX_uid216_sqrtFPL_uid63_fpArccosXTest_0_to_expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expX_uid216_sqrtFPL_uid63_fpArccosXTest_0_to_expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_0_q <= expX_uid216_sqrtFPL_uid63_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expOddSig_uid239_sqrtFPL_uid63_fpArccosXTest(ADD,238)@8
    expOddSig_uid239_sqrtFPL_uid63_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & reg_expX_uid216_sqrtFPL_uid63_fpArccosXTest_0_to_expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_0_q);
    expOddSig_uid239_sqrtFPL_uid63_fpArccosXTest_b <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid14_fpArccosXTest_q);
            expOddSig_uid239_sqrtFPL_uid63_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expOddSig_uid239_sqrtFPL_uid63_fpArccosXTest_a) + UNSIGNED(expOddSig_uid239_sqrtFPL_uid63_fpArccosXTest_b));
    expOddSig_uid239_sqrtFPL_uid63_fpArccosXTest_q <= expOddSig_uid239_sqrtFPL_uid63_fpArccosXTest_o(8 downto 0);


	--expROdd_uid240_sqrtFPL_uid63_fpArccosXTest(BITSELECT,239)@8
    expROdd_uid240_sqrtFPL_uid63_fpArccosXTest_in <= expOddSig_uid239_sqrtFPL_uid63_fpArccosXTest_q;
    expROdd_uid240_sqrtFPL_uid63_fpArccosXTest_b <= expROdd_uid240_sqrtFPL_uid63_fpArccosXTest_in(8 downto 1);

	--expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest(ADD,235)@8
    expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & reg_expX_uid216_sqrtFPL_uid63_fpArccosXTest_0_to_expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_0_q);
    expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_b <= STD_LOGIC_VECTOR("0" & cstBias_uid13_fpArccosXTest_q);
            expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_a) + UNSIGNED(expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_b));
    expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_q <= expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_o(8 downto 0);


	--expREven_uid237_sqrtFPL_uid63_fpArccosXTest(BITSELECT,236)@8
    expREven_uid237_sqrtFPL_uid63_fpArccosXTest_in <= expEvenSig_uid236_sqrtFPL_uid63_fpArccosXTest_q;
    expREven_uid237_sqrtFPL_uid63_fpArccosXTest_b <= expREven_uid237_sqrtFPL_uid63_fpArccosXTest_in(8 downto 1);

	--expX0_uid241_sqrtFPL_uid63_fpArccosXTest(BITSELECT,240)@7
    expX0_uid241_sqrtFPL_uid63_fpArccosXTest_in <= expX_uid216_sqrtFPL_uid63_fpArccosXTest_b(0 downto 0);
    expX0_uid241_sqrtFPL_uid63_fpArccosXTest_b <= expX0_uid241_sqrtFPL_uid63_fpArccosXTest_in(0 downto 0);

	--expOddSelect_uid242_sqrtFPL_uid63_fpArccosXTest(LOGICAL,241)@7
    expOddSelect_uid242_sqrtFPL_uid63_fpArccosXTest_a <= expX0_uid241_sqrtFPL_uid63_fpArccosXTest_b;
    expOddSelect_uid242_sqrtFPL_uid63_fpArccosXTest_q <= not expOddSelect_uid242_sqrtFPL_uid63_fpArccosXTest_a;

	--ld_expOddSelect_uid242_sqrtFPL_uid63_fpArccosXTest_q_to_expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_b(DELAY,819)@7
    ld_expOddSelect_uid242_sqrtFPL_uid63_fpArccosXTest_q_to_expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expOddSelect_uid242_sqrtFPL_uid63_fpArccosXTest_q, xout => ld_expOddSelect_uid242_sqrtFPL_uid63_fpArccosXTest_q_to_expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expRMux_uid243_sqrtFPL_uid63_fpArccosXTest(MUX,242)@8
    expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_s <= ld_expOddSelect_uid242_sqrtFPL_uid63_fpArccosXTest_q_to_expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_b_q;
    expRMux_uid243_sqrtFPL_uid63_fpArccosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_s IS
                      WHEN "0" => expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_q <= expREven_uid237_sqrtFPL_uid63_fpArccosXTest_b;
                      WHEN "1" => expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_q <= expROdd_uid240_sqrtFPL_uid63_fpArccosXTest_b;
                      WHEN OTHERS => expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_signX_uid218_sqrtFPL_uid63_fpArccosXTest_b_to_minReg_uid252_sqrtFPL_uid63_fpArccosXTest_b(DELAY,831)@7
    ld_signX_uid218_sqrtFPL_uid63_fpArccosXTest_b_to_minReg_uid252_sqrtFPL_uid63_fpArccosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signX_uid218_sqrtFPL_uid63_fpArccosXTest_b, xout => ld_signX_uid218_sqrtFPL_uid63_fpArccosXTest_b_to_minReg_uid252_sqrtFPL_uid63_fpArccosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid231_sqrtFPL_uid63_fpArccosXTest(LOGICAL,230)@8
    InvExc_N_uid231_sqrtFPL_uid63_fpArccosXTest_a <= exc_N_uid230_sqrtFPL_uid63_fpArccosXTest_q;
    InvExc_N_uid231_sqrtFPL_uid63_fpArccosXTest_q <= not InvExc_N_uid231_sqrtFPL_uid63_fpArccosXTest_a;

	--fracX_uid217_sqrtFPL_uid63_fpArccosXTest(BITSELECT,216)@7
    fracX_uid217_sqrtFPL_uid63_fpArccosXTest_in <= fpL_uid61_fpArccosXTest_q(22 downto 0);
    fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b <= fracX_uid217_sqrtFPL_uid63_fpArccosXTest_in(22 downto 0);

	--reg_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_0_to_fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_1(REG,519)@7
    reg_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_0_to_fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_0_to_fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_0_to_fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_1_q <= fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest(LOGICAL,226)@8
    fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_a <= reg_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_0_to_fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_1_q;
    fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_b <= cstAllZWF_uid10_fpArccosXTest_q;
    fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_q <= "1" when fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_a = fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_b else "0";

	--expXIsMax_uid225_sqrtFPL_uid63_fpArccosXTest(LOGICAL,224)@7
    expXIsMax_uid225_sqrtFPL_uid63_fpArccosXTest_a <= expX_uid216_sqrtFPL_uid63_fpArccosXTest_b;
    expXIsMax_uid225_sqrtFPL_uid63_fpArccosXTest_b <= cstAllOWE_uid9_fpArccosXTest_q;
    expXIsMax_uid225_sqrtFPL_uid63_fpArccosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXIsMax_uid225_sqrtFPL_uid63_fpArccosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            IF (expXIsMax_uid225_sqrtFPL_uid63_fpArccosXTest_a = expXIsMax_uid225_sqrtFPL_uid63_fpArccosXTest_b) THEN
                expXIsMax_uid225_sqrtFPL_uid63_fpArccosXTest_q <= "1";
            ELSE
                expXIsMax_uid225_sqrtFPL_uid63_fpArccosXTest_q <= "0";
            END IF;
        END IF;
    END PROCESS;



	--exc_I_uid228_sqrtFPL_uid63_fpArccosXTest(LOGICAL,227)@8
    exc_I_uid228_sqrtFPL_uid63_fpArccosXTest_a <= expXIsMax_uid225_sqrtFPL_uid63_fpArccosXTest_q;
    exc_I_uid228_sqrtFPL_uid63_fpArccosXTest_b <= fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_q;
    exc_I_uid228_sqrtFPL_uid63_fpArccosXTest_q <= exc_I_uid228_sqrtFPL_uid63_fpArccosXTest_a and exc_I_uid228_sqrtFPL_uid63_fpArccosXTest_b;

	--InvExc_I_uid232_sqrtFPL_uid63_fpArccosXTest(LOGICAL,231)@8
    InvExc_I_uid232_sqrtFPL_uid63_fpArccosXTest_a <= exc_I_uid228_sqrtFPL_uid63_fpArccosXTest_q;
    InvExc_I_uid232_sqrtFPL_uid63_fpArccosXTest_q <= not InvExc_I_uid232_sqrtFPL_uid63_fpArccosXTest_a;

	--InvExpXIsZero_uid233_sqrtFPL_uid63_fpArccosXTest(LOGICAL,232)@7
    InvExpXIsZero_uid233_sqrtFPL_uid63_fpArccosXTest_a <= expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_q;
    InvExpXIsZero_uid233_sqrtFPL_uid63_fpArccosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExpXIsZero_uid233_sqrtFPL_uid63_fpArccosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExpXIsZero_uid233_sqrtFPL_uid63_fpArccosXTest_q <= not InvExpXIsZero_uid233_sqrtFPL_uid63_fpArccosXTest_a;
        END IF;
    END PROCESS;



	--exc_R_uid234_sqrtFPL_uid63_fpArccosXTest(LOGICAL,233)@8
    exc_R_uid234_sqrtFPL_uid63_fpArccosXTest_a <= InvExpXIsZero_uid233_sqrtFPL_uid63_fpArccosXTest_q;
    exc_R_uid234_sqrtFPL_uid63_fpArccosXTest_b <= InvExc_I_uid232_sqrtFPL_uid63_fpArccosXTest_q;
    exc_R_uid234_sqrtFPL_uid63_fpArccosXTest_c <= InvExc_N_uid231_sqrtFPL_uid63_fpArccosXTest_q;
    exc_R_uid234_sqrtFPL_uid63_fpArccosXTest_q <= exc_R_uid234_sqrtFPL_uid63_fpArccosXTest_a and exc_R_uid234_sqrtFPL_uid63_fpArccosXTest_b and exc_R_uid234_sqrtFPL_uid63_fpArccosXTest_c;

	--minReg_uid252_sqrtFPL_uid63_fpArccosXTest(LOGICAL,251)@8
    minReg_uid252_sqrtFPL_uid63_fpArccosXTest_a <= exc_R_uid234_sqrtFPL_uid63_fpArccosXTest_q;
    minReg_uid252_sqrtFPL_uid63_fpArccosXTest_b <= ld_signX_uid218_sqrtFPL_uid63_fpArccosXTest_b_to_minReg_uid252_sqrtFPL_uid63_fpArccosXTest_b_q;
    minReg_uid252_sqrtFPL_uid63_fpArccosXTest_q <= minReg_uid252_sqrtFPL_uid63_fpArccosXTest_a and minReg_uid252_sqrtFPL_uid63_fpArccosXTest_b;

	--minInf_uid253_sqrtFPL_uid63_fpArccosXTest(LOGICAL,252)@8
    minInf_uid253_sqrtFPL_uid63_fpArccosXTest_a <= exc_I_uid228_sqrtFPL_uid63_fpArccosXTest_q;
    minInf_uid253_sqrtFPL_uid63_fpArccosXTest_b <= ld_signX_uid218_sqrtFPL_uid63_fpArccosXTest_b_to_minReg_uid252_sqrtFPL_uid63_fpArccosXTest_b_q;
    minInf_uid253_sqrtFPL_uid63_fpArccosXTest_q <= minInf_uid253_sqrtFPL_uid63_fpArccosXTest_a and minInf_uid253_sqrtFPL_uid63_fpArccosXTest_b;

	--InvFracXIsZero_uid229_sqrtFPL_uid63_fpArccosXTest(LOGICAL,228)@8
    InvFracXIsZero_uid229_sqrtFPL_uid63_fpArccosXTest_a <= fracXIsZero_uid227_sqrtFPL_uid63_fpArccosXTest_q;
    InvFracXIsZero_uid229_sqrtFPL_uid63_fpArccosXTest_q <= not InvFracXIsZero_uid229_sqrtFPL_uid63_fpArccosXTest_a;

	--exc_N_uid230_sqrtFPL_uid63_fpArccosXTest(LOGICAL,229)@8
    exc_N_uid230_sqrtFPL_uid63_fpArccosXTest_a <= expXIsMax_uid225_sqrtFPL_uid63_fpArccosXTest_q;
    exc_N_uid230_sqrtFPL_uid63_fpArccosXTest_b <= InvFracXIsZero_uid229_sqrtFPL_uid63_fpArccosXTest_q;
    exc_N_uid230_sqrtFPL_uid63_fpArccosXTest_q <= exc_N_uid230_sqrtFPL_uid63_fpArccosXTest_a and exc_N_uid230_sqrtFPL_uid63_fpArccosXTest_b;

	--excRNaN_uid254_sqrtFPL_uid63_fpArccosXTest(LOGICAL,253)@8
    excRNaN_uid254_sqrtFPL_uid63_fpArccosXTest_a <= exc_N_uid230_sqrtFPL_uid63_fpArccosXTest_q;
    excRNaN_uid254_sqrtFPL_uid63_fpArccosXTest_b <= minInf_uid253_sqrtFPL_uid63_fpArccosXTest_q;
    excRNaN_uid254_sqrtFPL_uid63_fpArccosXTest_c <= minReg_uid252_sqrtFPL_uid63_fpArccosXTest_q;
    excRNaN_uid254_sqrtFPL_uid63_fpArccosXTest_q <= excRNaN_uid254_sqrtFPL_uid63_fpArccosXTest_a or excRNaN_uid254_sqrtFPL_uid63_fpArccosXTest_b or excRNaN_uid254_sqrtFPL_uid63_fpArccosXTest_c;

	--InvSignX_uid250_sqrtFPL_uid63_fpArccosXTest(LOGICAL,249)@7
    InvSignX_uid250_sqrtFPL_uid63_fpArccosXTest_a <= signX_uid218_sqrtFPL_uid63_fpArccosXTest_b;
    InvSignX_uid250_sqrtFPL_uid63_fpArccosXTest_q <= not InvSignX_uid250_sqrtFPL_uid63_fpArccosXTest_a;

	--ld_InvSignX_uid250_sqrtFPL_uid63_fpArccosXTest_q_to_inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest_b(DELAY,829)@7
    ld_InvSignX_uid250_sqrtFPL_uid63_fpArccosXTest_q_to_inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvSignX_uid250_sqrtFPL_uid63_fpArccosXTest_q, xout => ld_InvSignX_uid250_sqrtFPL_uid63_fpArccosXTest_q_to_inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest(LOGICAL,250)@8
    inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest_a <= exc_I_uid228_sqrtFPL_uid63_fpArccosXTest_q;
    inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest_b <= ld_InvSignX_uid250_sqrtFPL_uid63_fpArccosXTest_q_to_inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest_b_q;
    inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest_q <= inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest_a and inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest_b;

	--ld_expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_q_to_join_uid255_sqrtFPL_uid63_fpArccosXTest_a(DELAY,837)@7
    ld_expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_q_to_join_uid255_sqrtFPL_uid63_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_q, xout => ld_expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_q_to_join_uid255_sqrtFPL_uid63_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--join_uid255_sqrtFPL_uid63_fpArccosXTest(BITJOIN,254)@8
    join_uid255_sqrtFPL_uid63_fpArccosXTest_q <= excRNaN_uid254_sqrtFPL_uid63_fpArccosXTest_q & inInfAndNotNeg_uid251_sqrtFPL_uid63_fpArccosXTest_q & ld_expXIsZero_uid223_sqrtFPL_uid63_fpArccosXTest_q_to_join_uid255_sqrtFPL_uid63_fpArccosXTest_a_q;

	--fracSelIn_uid256_sqrtFPL_uid63_fpArccosXTest(BITJOIN,255)@8
    fracSelIn_uid256_sqrtFPL_uid63_fpArccosXTest_q <= ld_signX_uid218_sqrtFPL_uid63_fpArccosXTest_b_to_minReg_uid252_sqrtFPL_uid63_fpArccosXTest_b_q & join_uid255_sqrtFPL_uid63_fpArccosXTest_q;

	--reg_fracSelIn_uid256_sqrtFPL_uid63_fpArccosXTest_0_to_fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_0(REG,520)@8
    reg_fracSelIn_uid256_sqrtFPL_uid63_fpArccosXTest_0_to_fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracSelIn_uid256_sqrtFPL_uid63_fpArccosXTest_0_to_fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_0_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracSelIn_uid256_sqrtFPL_uid63_fpArccosXTest_0_to_fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_0_q <= fracSelIn_uid256_sqrtFPL_uid63_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--fracSel_uid257_sqrtFPL_uid63_fpArccosXTest(LOOKUP,256)@9
    fracSel_uid257_sqrtFPL_uid63_fpArccosXTest: PROCESS (reg_fracSelIn_uid256_sqrtFPL_uid63_fpArccosXTest_0_to_fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_fracSelIn_uid256_sqrtFPL_uid63_fpArccosXTest_0_to_fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_0_q) IS
                WHEN "0000" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "01";
                WHEN "0001" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "00";
                WHEN "0010" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "10";
                WHEN "0011" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "00";
                WHEN "0100" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "11";
                WHEN "0101" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "00";
                WHEN "0110" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "10";
                WHEN "0111" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "00";
                WHEN "1000" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "11";
                WHEN "1001" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "00";
                WHEN "1010" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "11";
                WHEN "1011" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "11";
                WHEN "1100" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "11";
                WHEN "1101" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "11";
                WHEN "1110" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "11";
                WHEN "1111" =>  fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= "11";
                WHEN OTHERS =>
                    fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest(MUX,260)@9
    expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_s <= fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q;
    expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest: PROCESS (expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_s, en, cstAllZWE_uid12_fpArccosXTest_q, expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_q, cstAllOWE_uid9_fpArccosXTest_q, cstAllOWE_uid9_fpArccosXTest_q)
    BEGIN
            CASE expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_s IS
                  WHEN "00" => expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q <= cstAllZWE_uid12_fpArccosXTest_q;
                  WHEN "01" => expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q <= expRMux_uid243_sqrtFPL_uid63_fpArccosXTest_q;
                  WHEN "10" => expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q <= cstAllOWE_uid9_fpArccosXTest_q;
                  WHEN "11" => expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q <= cstAllOWE_uid9_fpArccosXTest_q;
                  WHEN OTHERS => expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_inputreg(DELAY,1239)
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q, xout => ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt(COUNTER,1241)
    -- every=1, low=0, high=6, step=1, init=1
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_i = 5 THEN
                      ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_eq = '1') THEN
                        ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_i <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_i - 6;
                    ELSE
                        ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_i <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_i,3));


	--ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdreg(REG,1242)
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdreg_q <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdmux(MUX,1243)
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdmux_s <= en;
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdmux: PROCESS (ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdmux_s, ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdreg_q, ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdmux_q <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdmux_q <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem(DUALMEM,1240)
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_reset0 <= areset;
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_ia <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_inputreg_q;
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_aa <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdreg_q;
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_ab <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_rdmux_q;
    ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_iq,
        address_a => ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_aa,
        data_a => ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_ia
    );
        ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_q <= ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_iq(7 downto 0);

	--cstNaNWF_uid11_fpArccosXTest(CONSTANT,10)
    cstNaNWF_uid11_fpArccosXTest_q <= "00000000000000000000001";

	--fracXAddr_uid245_sqrtFPL_uid63_fpArccosXTest(BITSELECT,244)@7
    fracXAddr_uid245_sqrtFPL_uid63_fpArccosXTest_in <= fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b;
    fracXAddr_uid245_sqrtFPL_uid63_fpArccosXTest_b <= fracXAddr_uid245_sqrtFPL_uid63_fpArccosXTest_in(22 downto 16);

	--addrTable_uid246_sqrtFPL_uid63_fpArccosXTest(BITJOIN,245)@7
    addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_q <= expOddSelect_uid242_sqrtFPL_uid63_fpArccosXTest_q & fracXAddr_uid245_sqrtFPL_uid63_fpArccosXTest_b;

	--reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC2_uid458_sqrtTableGenerator_lutmem_0(REG,521)@7
    reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC2_uid458_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC2_uid458_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC2_uid458_sqrtTableGenerator_lutmem_0_q <= addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid458_sqrtTableGenerator_lutmem(DUALMEM,497)@8
    memoryC2_uid458_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC2_uid458_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC2_uid458_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC2_uid458_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC2_uid458_sqrtTableGenerator_lutmem_0_q;
    memoryC2_uid458_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_arccos_s5_memoryC2_uid458_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid458_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid458_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid458_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC2_uid458_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC2_uid458_sqrtTableGenerator_lutmem_ia
    );
        memoryC2_uid458_sqrtTableGenerator_lutmem_q <= memoryC2_uid458_sqrtTableGenerator_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid458_sqrtTableGenerator_lutmem_0_to_prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_1(REG,523)@10
    reg_memoryC2_uid458_sqrtTableGenerator_lutmem_0_to_prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid458_sqrtTableGenerator_lutmem_0_to_prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid458_sqrtTableGenerator_lutmem_0_to_prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_1_q <= memoryC2_uid458_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b_to_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_a_inputreg(DELAY,1238)
    ld_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b_to_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b, xout => ld_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b_to_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b_to_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_a(DELAY,825)@7
    ld_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b_to_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => ld_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b_to_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_a_inputreg_q, xout => ld_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b_to_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest(BITSELECT,246)@10
    FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_in <= ld_fracX_uid217_sqrtFPL_uid63_fpArccosXTest_b_to_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_a_q(15 downto 0);
    FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_b <= FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_in(15 downto 0);

	--yT1_uid459_sqrtPolynomialEvaluator(BITSELECT,458)@10
    yT1_uid459_sqrtPolynomialEvaluator_in <= FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_b;
    yT1_uid459_sqrtPolynomialEvaluator_b <= yT1_uid459_sqrtPolynomialEvaluator_in(15 downto 4);

	--reg_yT1_uid459_sqrtPolynomialEvaluator_0_to_prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_0(REG,522)@10
    reg_yT1_uid459_sqrtPolynomialEvaluator_0_to_prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid459_sqrtPolynomialEvaluator_0_to_prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid459_sqrtPolynomialEvaluator_0_to_prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_0_q <= yT1_uid459_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator(MULT,483)@11
    prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_a),13)) * SIGNED(prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_b);
    prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_a <= reg_yT1_uid459_sqrtPolynomialEvaluator_0_to_prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_0_q;
                prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_b <= reg_memoryC2_uid458_sqrtTableGenerator_lutmem_0_to_prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_1_q;
                prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_q <= prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid485_pT1_uid460_sqrtPolynomialEvaluator(BITSELECT,484)@14
    prodXYTruncFR_uid485_pT1_uid460_sqrtPolynomialEvaluator_in <= prodXY_uid484_pT1_uid460_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid485_pT1_uid460_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid485_pT1_uid460_sqrtPolynomialEvaluator_in(23 downto 11);

	--highBBits_uid462_sqrtPolynomialEvaluator(BITSELECT,461)@14
    highBBits_uid462_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid485_pT1_uid460_sqrtPolynomialEvaluator_b;
    highBBits_uid462_sqrtPolynomialEvaluator_b <= highBBits_uid462_sqrtPolynomialEvaluator_in(12 downto 1);

	--ld_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_q_to_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0_a_inputreg(DELAY,1303)
    ld_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_q_to_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_q, xout => ld_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_q_to_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_q_to_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0_a(DELAY,1117)@7
    ld_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_q_to_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => ld_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_q_to_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0_a_inputreg_q, xout => ld_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_q_to_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0(REG,524)@11
    reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0_q <= ld_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_q_to_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid457_sqrtTableGenerator_lutmem(DUALMEM,496)@12
    memoryC1_uid457_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC1_uid457_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC1_uid457_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC1_uid457_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC1_uid457_sqrtTableGenerator_lutmem_0_q;
    memoryC1_uid457_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_arccos_s5_memoryC1_uid457_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid457_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid457_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid457_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC1_uid457_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC1_uid457_sqrtTableGenerator_lutmem_ia
    );
        memoryC1_uid457_sqrtTableGenerator_lutmem_q <= memoryC1_uid457_sqrtTableGenerator_lutmem_iq(20 downto 0);

	--sumAHighB_uid463_sqrtPolynomialEvaluator(ADD,462)@14
    sumAHighB_uid463_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid457_sqrtTableGenerator_lutmem_q(20)) & memoryC1_uid457_sqrtTableGenerator_lutmem_q);
    sumAHighB_uid463_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid462_sqrtPolynomialEvaluator_b(11)) & highBBits_uid462_sqrtPolynomialEvaluator_b);
            sumAHighB_uid463_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid463_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid463_sqrtPolynomialEvaluator_b));
    sumAHighB_uid463_sqrtPolynomialEvaluator_q <= sumAHighB_uid463_sqrtPolynomialEvaluator_o(21 downto 0);


	--lowRangeB_uid461_sqrtPolynomialEvaluator(BITSELECT,460)@14
    lowRangeB_uid461_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid485_pT1_uid460_sqrtPolynomialEvaluator_b(0 downto 0);
    lowRangeB_uid461_sqrtPolynomialEvaluator_b <= lowRangeB_uid461_sqrtPolynomialEvaluator_in(0 downto 0);

	--s1_uid461_uid464_sqrtPolynomialEvaluator(BITJOIN,463)@14
    s1_uid461_uid464_sqrtPolynomialEvaluator_q <= sumAHighB_uid463_sqrtPolynomialEvaluator_q & lowRangeB_uid461_sqrtPolynomialEvaluator_b;

	--reg_s1_uid461_uid464_sqrtPolynomialEvaluator_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_1(REG,526)@14
    reg_s1_uid461_uid464_sqrtPolynomialEvaluator_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid461_uid464_sqrtPolynomialEvaluator_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid461_uid464_sqrtPolynomialEvaluator_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_1_q <= s1_uid461_uid464_sqrtPolynomialEvaluator_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_nor(LOGICAL,1285)
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_nor_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q;
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_nor_b <= ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_sticky_ena_q;
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_nor_q <= not (ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_nor_a or ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_nor_b);

	--roundBitDetectionConstant_uid370_arcsinL_uid78_fpArccosXTest(CONSTANT,369)
    roundBitDetectionConstant_uid370_arcsinL_uid78_fpArccosXTest_q <= "010";

	--ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmp(LOGICAL,1282)
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmp_a <= roundBitDetectionConstant_uid370_arcsinL_uid78_fpArccosXTest_q;
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdmux_q);
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmp_q <= "1" when ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmp_a = ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmp_b else "0";

	--ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmpReg(REG,1283)
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmpReg_q <= ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_sticky_ena(REG,1286)
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_nor_q = "1") THEN
                ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_sticky_ena_q <= ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_enaAnd(LOGICAL,1287)
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_enaAnd_a <= ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_sticky_ena_q;
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_enaAnd_b <= en;
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_enaAnd_q <= ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_enaAnd_a and ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_enaAnd_b;

	--reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0(REG,525)@10
    reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q <= FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt(COUNTER,1277)
    -- every=1, low=0, high=2, step=1, init=1
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_i = 1 THEN
                      ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_i <= ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_i - 2;
                    ELSE
                        ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_i <= ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_i,2));


	--ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdreg(REG,1278)
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdreg_q <= ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdmux(MUX,1279)
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdmux_s <= en;
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdmux: PROCESS (ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdmux_s, ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdreg_q, ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdmux_q <= ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdmux_q <= ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem(DUALMEM,1276)
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_reset0 <= areset;
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_ia <= reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q;
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_aa <= ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdreg_q;
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_ab <= ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_rdmux_q;
    ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 16,
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
        clocken1 => ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_iq,
        address_a => ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_aa,
        data_a => ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_ia
    );
        ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_q <= ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_iq(15 downto 0);

	--prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator(MULT,486)@15
    prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a),17)) * SIGNED(prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_b);
    prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a <= ld_reg_FracX15dto0_uid247_sqrtFPL_uid63_fpArccosXTest_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_0_q_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_a_replace_mem_q;
                prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_b <= reg_s1_uid461_uid464_sqrtPolynomialEvaluator_0_to_prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_1_q;
                prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_q <= prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid488_pT2_uid466_sqrtPolynomialEvaluator(BITSELECT,487)@18
    prodXYTruncFR_uid488_pT2_uid466_sqrtPolynomialEvaluator_in <= prodXY_uid487_pT2_uid466_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid488_pT2_uid466_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid488_pT2_uid466_sqrtPolynomialEvaluator_in(38 downto 15);

	--highBBits_uid468_sqrtPolynomialEvaluator(BITSELECT,467)@18
    highBBits_uid468_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid488_pT2_uid466_sqrtPolynomialEvaluator_b;
    highBBits_uid468_sqrtPolynomialEvaluator_b <= highBBits_uid468_sqrtPolynomialEvaluator_in(23 downto 2);

	--ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_nor(LOGICAL,1300)
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_nor_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q;
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_nor_b <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_sticky_ena_q;
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_nor_q <= not (ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_nor_a or ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_nor_b);

	--ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_sticky_ena(REG,1301)
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_nor_q = "1") THEN
                ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_sticky_ena_q <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_enaAnd(LOGICAL,1302)
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_enaAnd_a <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_sticky_ena_q;
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_enaAnd_b <= en;
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_enaAnd_q <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_enaAnd_a and ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_enaAnd_b;

	--ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem(DUALMEM,1291)
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_reset0 <= areset;
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_ia <= reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC2_uid458_sqrtTableGenerator_lutmem_0_q;
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_aa <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdreg_q;
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_ab <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdmux_q;
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_iq,
        address_a => ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_aa,
        data_a => ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_ia
    );
        ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_q <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_iq(7 downto 0);

	--ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_outputreg(DELAY,1290)
    ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_mem_q, xout => ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC0_uid456_sqrtTableGenerator_lutmem(DUALMEM,495)@16
    memoryC0_uid456_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC0_uid456_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC0_uid456_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC0_uid456_sqrtTableGenerator_lutmem_ab <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_outputreg_q;
    memoryC0_uid456_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_arccos_s5_memoryC0_uid456_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid456_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid456_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid456_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC0_uid456_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC0_uid456_sqrtTableGenerator_lutmem_ia
    );
        memoryC0_uid456_sqrtTableGenerator_lutmem_q <= memoryC0_uid456_sqrtTableGenerator_lutmem_iq(28 downto 0);

	--sumAHighB_uid469_sqrtPolynomialEvaluator(ADD,468)@18
    sumAHighB_uid469_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((29 downto 29 => memoryC0_uid456_sqrtTableGenerator_lutmem_q(28)) & memoryC0_uid456_sqrtTableGenerator_lutmem_q);
    sumAHighB_uid469_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid468_sqrtPolynomialEvaluator_b(21)) & highBBits_uid468_sqrtPolynomialEvaluator_b);
            sumAHighB_uid469_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid469_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid469_sqrtPolynomialEvaluator_b));
    sumAHighB_uid469_sqrtPolynomialEvaluator_q <= sumAHighB_uid469_sqrtPolynomialEvaluator_o(29 downto 0);


	--lowRangeB_uid467_sqrtPolynomialEvaluator(BITSELECT,466)@18
    lowRangeB_uid467_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid488_pT2_uid466_sqrtPolynomialEvaluator_b(1 downto 0);
    lowRangeB_uid467_sqrtPolynomialEvaluator_b <= lowRangeB_uid467_sqrtPolynomialEvaluator_in(1 downto 0);

	--s2_uid467_uid470_sqrtPolynomialEvaluator(BITJOIN,469)@18
    s2_uid467_uid470_sqrtPolynomialEvaluator_q <= sumAHighB_uid469_sqrtPolynomialEvaluator_q & lowRangeB_uid467_sqrtPolynomialEvaluator_b;

	--fracR_uid249_sqrtFPL_uid63_fpArccosXTest(BITSELECT,248)@18
    fracR_uid249_sqrtFPL_uid63_fpArccosXTest_in <= s2_uid467_uid470_sqrtPolynomialEvaluator_q(28 downto 0);
    fracR_uid249_sqrtFPL_uid63_fpArccosXTest_b <= fracR_uid249_sqrtFPL_uid63_fpArccosXTest_in(28 downto 6);

	--ld_fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q_to_fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_b(DELAY,845)@9
    ld_fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q_to_fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 9 )
    PORT MAP ( xin => fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q, xout => ld_fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q_to_fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest(MUX,264)@18
    fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_s <= ld_fracSel_uid257_sqrtFPL_uid63_fpArccosXTest_q_to_fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_b_q;
    fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest: PROCESS (fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_s, en, cstAllZWF_uid10_fpArccosXTest_q, fracR_uid249_sqrtFPL_uid63_fpArccosXTest_b, cstAllZWF_uid10_fpArccosXTest_q, cstNaNWF_uid11_fpArccosXTest_q)
    BEGIN
            CASE fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_s IS
                  WHEN "00" => fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_q <= cstAllZWF_uid10_fpArccosXTest_q;
                  WHEN "01" => fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_q <= fracR_uid249_sqrtFPL_uid63_fpArccosXTest_b;
                  WHEN "10" => fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_q <= cstAllZWF_uid10_fpArccosXTest_q;
                  WHEN "11" => fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_q <= cstNaNWF_uid11_fpArccosXTest_q;
                  WHEN OTHERS => fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest(BITJOIN,266)@18
    RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_q <= ld_negZero_uid266_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_c_q & ld_expRPostExc_uid261_sqrtFPL_uid63_fpArccosXTest_q_to_RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_b_replace_mem_q & fracRPostExc_uid265_sqrtFPL_uid63_fpArccosXTest_q;

	--SqrtFPL22dto0_uid64_fpArccosXTest(BITSELECT,63)@18
    SqrtFPL22dto0_uid64_fpArccosXTest_in <= RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_q(22 downto 0);
    SqrtFPL22dto0_uid64_fpArccosXTest_b <= SqrtFPL22dto0_uid64_fpArccosXTest_in(22 downto 0);

	--reg_SqrtFPL22dto0_uid64_fpArccosXTest_0_to_fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_1(REG,552)@18
    reg_SqrtFPL22dto0_uid64_fpArccosXTest_0_to_fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_SqrtFPL22dto0_uid64_fpArccosXTest_0_to_fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_SqrtFPL22dto0_uid64_fpArccosXTest_0_to_fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_1_q <= SqrtFPL22dto0_uid64_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest(LOGICAL,327)@19
    fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_a <= reg_SqrtFPL22dto0_uid64_fpArccosXTest_0_to_fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_1_q;
    fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_b <= cstAllZWF_uid10_fpArccosXTest_q;
    fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_q <= "1" when fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_a = fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_b else "0";

	--ld_fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_q_to_exc_I_uid329_arcsinL_uid78_fpArccosXTest_b(DELAY,901)@19
    ld_fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_q_to_exc_I_uid329_arcsinL_uid78_fpArccosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_q, xout => ld_fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_q_to_exc_I_uid329_arcsinL_uid78_fpArccosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--SqrtFPL30dto23_uid66_fpArccosXTest(BITSELECT,65)@18
    SqrtFPL30dto23_uid66_fpArccosXTest_in <= RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_q(30 downto 0);
    SqrtFPL30dto23_uid66_fpArccosXTest_b <= SqrtFPL30dto23_uid66_fpArccosXTest_in(30 downto 23);

	--reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_1(REG,530)@18
    reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_1_q <= SqrtFPL30dto23_uid66_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expXIsMax_uid326_arcsinL_uid78_fpArccosXTest(LOGICAL,325)@19
    expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_a <= reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_1_q;
    expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_b <= cstAllOWE_uid9_fpArccosXTest_q;
    expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_q <= "1" when expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_a = expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_b else "0";

	--ld_expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_q_to_exc_I_uid329_arcsinL_uid78_fpArccosXTest_a(DELAY,900)@19
    ld_expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_q_to_exc_I_uid329_arcsinL_uid78_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_q, xout => ld_expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_q_to_exc_I_uid329_arcsinL_uid78_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--exc_I_uid329_arcsinL_uid78_fpArccosXTest(LOGICAL,328)@31
    exc_I_uid329_arcsinL_uid78_fpArccosXTest_a <= ld_expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_q_to_exc_I_uid329_arcsinL_uid78_fpArccosXTest_a_q;
    exc_I_uid329_arcsinL_uid78_fpArccosXTest_b <= ld_fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_q_to_exc_I_uid329_arcsinL_uid78_fpArccosXTest_b_q;
    exc_I_uid329_arcsinL_uid78_fpArccosXTest_q <= exc_I_uid329_arcsinL_uid78_fpArccosXTest_a and exc_I_uid329_arcsinL_uid78_fpArccosXTest_b;

	--reg_exc_I_uid329_arcsinL_uid78_fpArccosXTest_0_to_excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_2(REG,565)@31
    reg_exc_I_uid329_arcsinL_uid78_fpArccosXTest_0_to_excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_I_uid329_arcsinL_uid78_fpArccosXTest_0_to_excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_I_uid329_arcsinL_uid78_fpArccosXTest_0_to_excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_2_q <= exc_I_uid329_arcsinL_uid78_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--RightShiftStage123dto1_uid290_alignSqrt_uid69_fpArccosXTest(BITSELECT,289)@20
    RightShiftStage123dto1_uid290_alignSqrt_uid69_fpArccosXTest_in <= rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_q;
    RightShiftStage123dto1_uid290_alignSqrt_uid69_fpArccosXTest_b <= RightShiftStage123dto1_uid290_alignSqrt_uid69_fpArccosXTest_in(23 downto 1);

	--rightShiftStage2Idx1_uid292_alignSqrt_uid69_fpArccosXTest(BITJOIN,291)@20
    rightShiftStage2Idx1_uid292_alignSqrt_uid69_fpArccosXTest_q <= GND_q & RightShiftStage123dto1_uid290_alignSqrt_uid69_fpArccosXTest_b;

	--oSqrtFPLFrac_uid65_fpArccosXTest(BITJOIN,64)@18
    oSqrtFPLFrac_uid65_fpArccosXTest_q <= VCC_q & SqrtFPL22dto0_uid64_fpArccosXTest_b;

	--X23dto16_uid273_alignSqrt_uid69_fpArccosXTest(BITSELECT,272)@18
    X23dto16_uid273_alignSqrt_uid69_fpArccosXTest_in <= oSqrtFPLFrac_uid65_fpArccosXTest_q;
    X23dto16_uid273_alignSqrt_uid69_fpArccosXTest_b <= X23dto16_uid273_alignSqrt_uid69_fpArccosXTest_in(23 downto 16);

	--rightShiftStage0Idx2_uid275_alignSqrt_uid69_fpArccosXTest(BITJOIN,274)@18
    rightShiftStage0Idx2_uid275_alignSqrt_uid69_fpArccosXTest_q <= rightShiftStage0Idx1Pad16_uid136_fxpX_uid50_fpArccosXTest_q & X23dto16_uid273_alignSqrt_uid69_fpArccosXTest_b;

	--reg_rightShiftStage0Idx2_uid275_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_4(REG,534)@18
    reg_rightShiftStage0Idx2_uid275_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx2_uid275_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_4_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx2_uid275_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_4_q <= rightShiftStage0Idx2_uid275_alignSqrt_uid69_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--X23dto8_uid270_alignSqrt_uid69_fpArccosXTest(BITSELECT,269)@18
    X23dto8_uid270_alignSqrt_uid69_fpArccosXTest_in <= oSqrtFPLFrac_uid65_fpArccosXTest_q;
    X23dto8_uid270_alignSqrt_uid69_fpArccosXTest_b <= X23dto8_uid270_alignSqrt_uid69_fpArccosXTest_in(23 downto 8);

	--rightShiftStage0Idx1_uid272_alignSqrt_uid69_fpArccosXTest(BITJOIN,271)@18
    rightShiftStage0Idx1_uid272_alignSqrt_uid69_fpArccosXTest_q <= cstAllZWE_uid12_fpArccosXTest_q & X23dto8_uid270_alignSqrt_uid69_fpArccosXTest_b;

	--reg_rightShiftStage0Idx1_uid272_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_3(REG,533)@18
    reg_rightShiftStage0Idx1_uid272_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx1_uid272_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_3_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx1_uid272_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_3_q <= rightShiftStage0Idx1_uid272_alignSqrt_uid69_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_2(REG,532)@18
    reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_2_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_2_q <= oSqrtFPLFrac_uid65_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--srVal_uid67_fpArccosXTest(SUB,66)@19
    srVal_uid67_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid14_fpArccosXTest_q);
    srVal_uid67_fpArccosXTest_b <= STD_LOGIC_VECTOR("0" & reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_1_q);
            srVal_uid67_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(srVal_uid67_fpArccosXTest_a) - UNSIGNED(srVal_uid67_fpArccosXTest_b));
    srVal_uid67_fpArccosXTest_q <= srVal_uid67_fpArccosXTest_o(8 downto 0);


	--srValRange_uid68_fpArccosXTest(BITSELECT,67)@19
    srValRange_uid68_fpArccosXTest_in <= srVal_uid67_fpArccosXTest_q(4 downto 0);
    srValRange_uid68_fpArccosXTest_b <= srValRange_uid68_fpArccosXTest_in(4 downto 0);

	--rightShiftStageSel4Dto3_uid277_alignSqrt_uid69_fpArccosXTest(BITSELECT,276)@19
    rightShiftStageSel4Dto3_uid277_alignSqrt_uid69_fpArccosXTest_in <= srValRange_uid68_fpArccosXTest_b;
    rightShiftStageSel4Dto3_uid277_alignSqrt_uid69_fpArccosXTest_b <= rightShiftStageSel4Dto3_uid277_alignSqrt_uid69_fpArccosXTest_in(4 downto 3);

	--rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest(MUX,277)@19
    rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_s <= rightShiftStageSel4Dto3_uid277_alignSqrt_uid69_fpArccosXTest_b;
    rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest: PROCESS (rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_s, en, reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_2_q, reg_rightShiftStage0Idx1_uid272_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_3_q, reg_rightShiftStage0Idx2_uid275_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_4_q, rightShiftStage0Idx3_uid276_alignSqrt_uid69_fpArccosXTest_q)
    BEGIN
            CASE rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_s IS
                  WHEN "00" => rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_q <= reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_2_q;
                  WHEN "01" => rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_q <= reg_rightShiftStage0Idx1_uid272_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_3_q;
                  WHEN "10" => rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_q <= reg_rightShiftStage0Idx2_uid275_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_4_q;
                  WHEN "11" => rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_q <= rightShiftStage0Idx3_uid276_alignSqrt_uid69_fpArccosXTest_q;
                  WHEN OTHERS => rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage023dto6_uid285_alignSqrt_uid69_fpArccosXTest(BITSELECT,284)@19
    RightShiftStage023dto6_uid285_alignSqrt_uid69_fpArccosXTest_in <= rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_q;
    RightShiftStage023dto6_uid285_alignSqrt_uid69_fpArccosXTest_b <= RightShiftStage023dto6_uid285_alignSqrt_uid69_fpArccosXTest_in(23 downto 6);

	--rightShiftStage1Idx3_uid287_alignSqrt_uid69_fpArccosXTest(BITJOIN,286)@19
    rightShiftStage1Idx3_uid287_alignSqrt_uid69_fpArccosXTest_q <= rightShiftStage1Idx3Pad6_uid286_alignSqrt_uid69_fpArccosXTest_q & RightShiftStage023dto6_uid285_alignSqrt_uid69_fpArccosXTest_b;

	--reg_rightShiftStage1Idx3_uid287_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_5(REG,539)@19
    reg_rightShiftStage1Idx3_uid287_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx3_uid287_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_5_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx3_uid287_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_5_q <= rightShiftStage1Idx3_uid287_alignSqrt_uid69_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--RightShiftStage023dto4_uid282_alignSqrt_uid69_fpArccosXTest(BITSELECT,281)@19
    RightShiftStage023dto4_uid282_alignSqrt_uid69_fpArccosXTest_in <= rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_q;
    RightShiftStage023dto4_uid282_alignSqrt_uid69_fpArccosXTest_b <= RightShiftStage023dto4_uid282_alignSqrt_uid69_fpArccosXTest_in(23 downto 4);

	--rightShiftStage1Idx2_uid284_alignSqrt_uid69_fpArccosXTest(BITJOIN,283)@19
    rightShiftStage1Idx2_uid284_alignSqrt_uid69_fpArccosXTest_q <= rightShiftStage1Idx1Pad4_uid145_fxpX_uid50_fpArccosXTest_q & RightShiftStage023dto4_uid282_alignSqrt_uid69_fpArccosXTest_b;

	--reg_rightShiftStage1Idx2_uid284_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_4(REG,538)@19
    reg_rightShiftStage1Idx2_uid284_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx2_uid284_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_4_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx2_uid284_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_4_q <= rightShiftStage1Idx2_uid284_alignSqrt_uid69_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--RightShiftStage023dto2_uid279_alignSqrt_uid69_fpArccosXTest(BITSELECT,278)@19
    RightShiftStage023dto2_uid279_alignSqrt_uid69_fpArccosXTest_in <= rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_q;
    RightShiftStage023dto2_uid279_alignSqrt_uid69_fpArccosXTest_b <= RightShiftStage023dto2_uid279_alignSqrt_uid69_fpArccosXTest_in(23 downto 2);

	--rightShiftStage1Idx1_uid281_alignSqrt_uid69_fpArccosXTest(BITJOIN,280)@19
    rightShiftStage1Idx1_uid281_alignSqrt_uid69_fpArccosXTest_q <= rightShiftStage2Idx2Pad2_uid159_fxpX_uid50_fpArccosXTest_q & RightShiftStage023dto2_uid279_alignSqrt_uid69_fpArccosXTest_b;

	--reg_rightShiftStage1Idx1_uid281_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_3(REG,537)@19
    reg_rightShiftStage1Idx1_uid281_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx1_uid281_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_3_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx1_uid281_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_3_q <= rightShiftStage1Idx1_uid281_alignSqrt_uid69_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_2(REG,536)@19
    reg_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_2_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_2_q <= rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid288_alignSqrt_uid69_fpArccosXTest(BITSELECT,287)@19
    rightShiftStageSel2Dto1_uid288_alignSqrt_uid69_fpArccosXTest_in <= srValRange_uid68_fpArccosXTest_b(2 downto 0);
    rightShiftStageSel2Dto1_uid288_alignSqrt_uid69_fpArccosXTest_b <= rightShiftStageSel2Dto1_uid288_alignSqrt_uid69_fpArccosXTest_in(2 downto 1);

	--reg_rightShiftStageSel2Dto1_uid288_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_1(REG,535)@19
    reg_rightShiftStageSel2Dto1_uid288_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid288_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid288_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_1_q <= rightShiftStageSel2Dto1_uid288_alignSqrt_uid69_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest(MUX,288)@20
    rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_s <= reg_rightShiftStageSel2Dto1_uid288_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_1_q;
    rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest: PROCESS (rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_s, en, reg_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_2_q, reg_rightShiftStage1Idx1_uid281_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_3_q, reg_rightShiftStage1Idx2_uid284_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_4_q, reg_rightShiftStage1Idx3_uid287_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_5_q)
    BEGIN
            CASE rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_s IS
                  WHEN "00" => rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_q <= reg_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_2_q;
                  WHEN "01" => rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_q <= reg_rightShiftStage1Idx1_uid281_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_3_q;
                  WHEN "10" => rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_q <= reg_rightShiftStage1Idx2_uid284_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_4_q;
                  WHEN "11" => rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_q <= reg_rightShiftStage1Idx3_uid287_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_5_q;
                  WHEN OTHERS => rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid293_alignSqrt_uid69_fpArccosXTest(BITSELECT,292)@19
    rightShiftStageSel0Dto0_uid293_alignSqrt_uid69_fpArccosXTest_in <= srValRange_uid68_fpArccosXTest_b(0 downto 0);
    rightShiftStageSel0Dto0_uid293_alignSqrt_uid69_fpArccosXTest_b <= rightShiftStageSel0Dto0_uid293_alignSqrt_uid69_fpArccosXTest_in(0 downto 0);

	--reg_rightShiftStageSel0Dto0_uid293_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_1(REG,540)@19
    reg_rightShiftStageSel0Dto0_uid293_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid293_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid293_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_1_q <= rightShiftStageSel0Dto0_uid293_alignSqrt_uid69_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest(MUX,293)@20
    rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_s <= reg_rightShiftStageSel0Dto0_uid293_alignSqrt_uid69_fpArccosXTest_0_to_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_1_q;
    rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest: PROCESS (rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_s, en, rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_q, rightShiftStage2Idx1_uid292_alignSqrt_uid69_fpArccosXTest_q)
    BEGIN
            CASE rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_s IS
                  WHEN "0" => rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q <= rightShiftStage1_uid289_alignSqrt_uid69_fpArccosXTest_q;
                  WHEN "1" => rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q <= rightShiftStage2Idx1_uid292_alignSqrt_uid69_fpArccosXTest_q;
                  WHEN OTHERS => rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sAddr_uid71_fpArccosXTest(BITSELECT,70)@20
    sAddr_uid71_fpArccosXTest_in <= rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q;
    sAddr_uid71_fpArccosXTest_b <= sAddr_uid71_fpArccosXTest_in(23 downto 16);

	--reg_sAddr_uid71_fpArccosXTest_0_to_memoryC2_uid298_arcsinXO2XTabGen_lutmem_0(REG,541)@20
    reg_sAddr_uid71_fpArccosXTest_0_to_memoryC2_uid298_arcsinXO2XTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sAddr_uid71_fpArccosXTest_0_to_memoryC2_uid298_arcsinXO2XTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sAddr_uid71_fpArccosXTest_0_to_memoryC2_uid298_arcsinXO2XTabGen_lutmem_0_q <= sAddr_uid71_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid298_arcsinXO2XTabGen_lutmem(DUALMEM,491)@21
    memoryC2_uid298_arcsinXO2XTabGen_lutmem_reset0 <= areset;
    memoryC2_uid298_arcsinXO2XTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid298_arcsinXO2XTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid298_arcsinXO2XTabGen_lutmem_ab <= reg_sAddr_uid71_fpArccosXTest_0_to_memoryC2_uid298_arcsinXO2XTabGen_lutmem_0_q;
    memoryC2_uid298_arcsinXO2XTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arccos_s5_memoryC2_uid298_arcsinXO2XTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid298_arcsinXO2XTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid298_arcsinXO2XTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid298_arcsinXO2XTabGen_lutmem_iq,
        address_a => memoryC2_uid298_arcsinXO2XTabGen_lutmem_aa,
        data_a => memoryC2_uid298_arcsinXO2XTabGen_lutmem_ia
    );
        memoryC2_uid298_arcsinXO2XTabGen_lutmem_q <= memoryC2_uid298_arcsinXO2XTabGen_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid298_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_1(REG,543)@23
    reg_memoryC2_uid298_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid298_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid298_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_1_q <= memoryC2_uid298_arcsinXO2XTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q_to_sPPolyEval_uid72_fpArccosXTest_a_inputreg(DELAY,1185)
    ld_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q_to_sPPolyEval_uid72_fpArccosXTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q, xout => ld_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q_to_sPPolyEval_uid72_fpArccosXTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q_to_sPPolyEval_uid72_fpArccosXTest_a(DELAY,642)@20
    ld_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q_to_sPPolyEval_uid72_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => ld_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q_to_sPPolyEval_uid72_fpArccosXTest_a_inputreg_q, xout => ld_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q_to_sPPolyEval_uid72_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--sPPolyEval_uid72_fpArccosXTest(BITSELECT,71)@23
    sPPolyEval_uid72_fpArccosXTest_in <= ld_rightShiftStage2_uid294_alignSqrt_uid69_fpArccosXTest_q_to_sPPolyEval_uid72_fpArccosXTest_a_q(15 downto 0);
    sPPolyEval_uid72_fpArccosXTest_b <= sPPolyEval_uid72_fpArccosXTest_in(15 downto 1);

	--yT1_uid299_arcsinXO2XPolyEval(BITSELECT,298)@23
    yT1_uid299_arcsinXO2XPolyEval_in <= sPPolyEval_uid72_fpArccosXTest_b;
    yT1_uid299_arcsinXO2XPolyEval_b <= yT1_uid299_arcsinXO2XPolyEval_in(14 downto 3);

	--reg_yT1_uid299_arcsinXO2XPolyEval_0_to_prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_0(REG,542)@23
    reg_yT1_uid299_arcsinXO2XPolyEval_0_to_prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid299_arcsinXO2XPolyEval_0_to_prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid299_arcsinXO2XPolyEval_0_to_prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_0_q <= yT1_uid299_arcsinXO2XPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval(MULT,471)@24
    prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_a),13)) * SIGNED(prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_b);
    prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_a <= (others => '0');
            prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_b <= (others => '0');
            prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_a <= reg_yT1_uid299_arcsinXO2XPolyEval_0_to_prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_0_q;
                prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_b <= reg_memoryC2_uid298_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_1_q;
                prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_q <= prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid473_pT1_uid300_arcsinXO2XPolyEval(BITSELECT,472)@27
    prodXYTruncFR_uid473_pT1_uid300_arcsinXO2XPolyEval_in <= prodXY_uid472_pT1_uid300_arcsinXO2XPolyEval_q;
    prodXYTruncFR_uid473_pT1_uid300_arcsinXO2XPolyEval_b <= prodXYTruncFR_uid473_pT1_uid300_arcsinXO2XPolyEval_in(23 downto 11);

	--highBBits_uid302_arcsinXO2XPolyEval(BITSELECT,301)@27
    highBBits_uid302_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid473_pT1_uid300_arcsinXO2XPolyEval_b;
    highBBits_uid302_arcsinXO2XPolyEval_b <= highBBits_uid302_arcsinXO2XPolyEval_in(12 downto 1);

	--ld_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_0_q_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_a(DELAY,1083)@21
    ld_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_0_q_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => reg_sAddr_uid71_fpArccosXTest_0_to_memoryC2_uid298_arcsinXO2XTabGen_lutmem_0_q, xout => ld_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_0_q_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_0_q_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_a_outputreg(DELAY,1288)
    ld_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_0_q_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_a_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_0_q_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_a_q, xout => ld_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_0_q_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_a_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid297_arcsinXO2XTabGen_lutmem(DUALMEM,490)@25
    memoryC1_uid297_arcsinXO2XTabGen_lutmem_reset0 <= areset;
    memoryC1_uid297_arcsinXO2XTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid297_arcsinXO2XTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid297_arcsinXO2XTabGen_lutmem_ab <= ld_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_0_q_to_memoryC1_uid297_arcsinXO2XTabGen_lutmem_a_outputreg_q;
    memoryC1_uid297_arcsinXO2XTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arccos_s5_memoryC1_uid297_arcsinXO2XTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid297_arcsinXO2XTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid297_arcsinXO2XTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid297_arcsinXO2XTabGen_lutmem_iq,
        address_a => memoryC1_uid297_arcsinXO2XTabGen_lutmem_aa,
        data_a => memoryC1_uid297_arcsinXO2XTabGen_lutmem_ia
    );
        memoryC1_uid297_arcsinXO2XTabGen_lutmem_q <= memoryC1_uid297_arcsinXO2XTabGen_lutmem_iq(18 downto 0);

	--sumAHighB_uid303_arcsinXO2XPolyEval(ADD,302)@27
    sumAHighB_uid303_arcsinXO2XPolyEval_a <= STD_LOGIC_VECTOR((19 downto 19 => memoryC1_uid297_arcsinXO2XTabGen_lutmem_q(18)) & memoryC1_uid297_arcsinXO2XTabGen_lutmem_q);
    sumAHighB_uid303_arcsinXO2XPolyEval_b <= STD_LOGIC_VECTOR((19 downto 12 => highBBits_uid302_arcsinXO2XPolyEval_b(11)) & highBBits_uid302_arcsinXO2XPolyEval_b);
            sumAHighB_uid303_arcsinXO2XPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid303_arcsinXO2XPolyEval_a) + SIGNED(sumAHighB_uid303_arcsinXO2XPolyEval_b));
    sumAHighB_uid303_arcsinXO2XPolyEval_q <= sumAHighB_uid303_arcsinXO2XPolyEval_o(19 downto 0);


	--lowRangeB_uid301_arcsinXO2XPolyEval(BITSELECT,300)@27
    lowRangeB_uid301_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid473_pT1_uid300_arcsinXO2XPolyEval_b(0 downto 0);
    lowRangeB_uid301_arcsinXO2XPolyEval_b <= lowRangeB_uid301_arcsinXO2XPolyEval_in(0 downto 0);

	--s1_uid301_uid304_arcsinXO2XPolyEval(BITJOIN,303)@27
    s1_uid301_uid304_arcsinXO2XPolyEval_q <= sumAHighB_uid303_arcsinXO2XPolyEval_q & lowRangeB_uid301_arcsinXO2XPolyEval_b;

	--reg_s1_uid301_uid304_arcsinXO2XPolyEval_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_1(REG,546)@27
    reg_s1_uid301_uid304_arcsinXO2XPolyEval_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid301_uid304_arcsinXO2XPolyEval_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_1_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid301_uid304_arcsinXO2XPolyEval_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_1_q <= s1_uid301_uid304_arcsinXO2XPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_nor(LOGICAL,1312)
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_nor_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q;
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_nor_b <= ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_sticky_ena_q;
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_nor_q <= not (ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_nor_a or ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_nor_b);

	--ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_cmpReg(REG,1310)
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_sticky_ena(REG,1313)
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_nor_q = "1") THEN
                ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_sticky_ena_q <= ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_enaAnd(LOGICAL,1314)
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_enaAnd_a <= ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_sticky_ena_q;
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_enaAnd_b <= en;
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_enaAnd_q <= ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_enaAnd_a and ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_enaAnd_b;

	--ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_inputreg(DELAY,1304)
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => sPPolyEval_uid72_fpArccosXTest_b, xout => ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdcnt(COUNTER,1306)
    -- every=1, low=0, high=1, step=1, init=1
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdcnt_i <= ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdcnt_i,1));


	--ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdreg(REG,1307)
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdreg_q <= ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdmux(MUX,1308)
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdmux_s <= en;
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdmux: PROCESS (ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdmux_s, ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdreg_q, ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdmux_q <= ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdreg_q;
                  WHEN "1" => ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdmux_q <= ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem(DUALMEM,1305)
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_reset0 <= areset;
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_ia <= ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_inputreg_q;
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_aa <= ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdreg_q;
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_ab <= ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_rdmux_q;
    ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_iq,
        address_a => ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_aa,
        data_a => ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_ia
    );
        ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_q <= ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_iq(14 downto 0);

	--reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0(REG,545)@27
    reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_q <= "000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_q <= ld_sPPolyEval_uid72_fpArccosXTest_b_to_reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval(MULT,474)@28
    prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_a),16)) * SIGNED(prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_b);
    prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_a <= (others => '0');
            prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_b <= (others => '0');
            prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_a <= reg_sPPolyEval_uid72_fpArccosXTest_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_0_q;
                prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_b <= reg_s1_uid301_uid304_arcsinXO2XPolyEval_0_to_prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_1_q;
                prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_pr,36));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_q <= prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid476_pT2_uid306_arcsinXO2XPolyEval(BITSELECT,475)@31
    prodXYTruncFR_uid476_pT2_uid306_arcsinXO2XPolyEval_in <= prodXY_uid475_pT2_uid306_arcsinXO2XPolyEval_q;
    prodXYTruncFR_uid476_pT2_uid306_arcsinXO2XPolyEval_b <= prodXYTruncFR_uid476_pT2_uid306_arcsinXO2XPolyEval_in(35 downto 14);

	--highBBits_uid308_arcsinXO2XPolyEval(BITSELECT,307)@31
    highBBits_uid308_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid476_pT2_uid306_arcsinXO2XPolyEval_b;
    highBBits_uid308_arcsinXO2XPolyEval_b <= highBBits_uid308_arcsinXO2XPolyEval_in(21 downto 2);

	--ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_nor(LOGICAL,1325)
    ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_nor_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q;
    ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_nor_b <= ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q;
    ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_nor_q <= not (ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_nor_a or ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_nor_b);

	--ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_sticky_ena(REG,1326)
    ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_nor_q = "1") THEN
                ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_enaAnd(LOGICAL,1327)
    ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_enaAnd_a <= ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q;
    ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_enaAnd_b <= en;
    ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_enaAnd_q <= ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_enaAnd_a and ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_enaAnd_b;

	--ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_inputreg(DELAY,1315)
    ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => sAddr_uid71_fpArccosXTest_b, xout => ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem(DUALMEM,1316)
    ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_reset0 <= areset;
    ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ia <= ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_inputreg_q;
    ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_aa <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdreg_q;
    ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ab <= ld_reg_addrTable_uid246_sqrtFPL_uid63_fpArccosXTest_0_to_memoryC0_uid456_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid456_sqrtTableGenerator_lutmem_a_replace_rdmux_q;
    ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_iq,
        address_a => ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_aa,
        data_a => ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ia
    );
        ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_q <= ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0(REG,547)@28
    reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_q <= ld_sAddr_uid71_fpArccosXTest_b_to_reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid296_arcsinXO2XTabGen_lutmem(DUALMEM,489)@29
    memoryC0_uid296_arcsinXO2XTabGen_lutmem_reset0 <= areset;
    memoryC0_uid296_arcsinXO2XTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid296_arcsinXO2XTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid296_arcsinXO2XTabGen_lutmem_ab <= reg_sAddr_uid71_fpArccosXTest_0_to_memoryC0_uid296_arcsinXO2XTabGen_lutmem_0_q;
    memoryC0_uid296_arcsinXO2XTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arccos_s5_memoryC0_uid296_arcsinXO2XTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid296_arcsinXO2XTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid296_arcsinXO2XTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid296_arcsinXO2XTabGen_lutmem_iq,
        address_a => memoryC0_uid296_arcsinXO2XTabGen_lutmem_aa,
        data_a => memoryC0_uid296_arcsinXO2XTabGen_lutmem_ia
    );
        memoryC0_uid296_arcsinXO2XTabGen_lutmem_q <= memoryC0_uid296_arcsinXO2XTabGen_lutmem_iq(29 downto 0);

	--sumAHighB_uid309_arcsinXO2XPolyEval(ADD,308)@31
    sumAHighB_uid309_arcsinXO2XPolyEval_a <= STD_LOGIC_VECTOR((30 downto 30 => memoryC0_uid296_arcsinXO2XTabGen_lutmem_q(29)) & memoryC0_uid296_arcsinXO2XTabGen_lutmem_q);
    sumAHighB_uid309_arcsinXO2XPolyEval_b <= STD_LOGIC_VECTOR((30 downto 20 => highBBits_uid308_arcsinXO2XPolyEval_b(19)) & highBBits_uid308_arcsinXO2XPolyEval_b);
            sumAHighB_uid309_arcsinXO2XPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid309_arcsinXO2XPolyEval_a) + SIGNED(sumAHighB_uid309_arcsinXO2XPolyEval_b));
    sumAHighB_uid309_arcsinXO2XPolyEval_q <= sumAHighB_uid309_arcsinXO2XPolyEval_o(30 downto 0);


	--lowRangeB_uid307_arcsinXO2XPolyEval(BITSELECT,306)@31
    lowRangeB_uid307_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid476_pT2_uid306_arcsinXO2XPolyEval_b(1 downto 0);
    lowRangeB_uid307_arcsinXO2XPolyEval_b <= lowRangeB_uid307_arcsinXO2XPolyEval_in(1 downto 0);

	--s2_uid307_uid310_arcsinXO2XPolyEval(BITJOIN,309)@31
    s2_uid307_uid310_arcsinXO2XPolyEval_q <= sumAHighB_uid309_arcsinXO2XPolyEval_q & lowRangeB_uid307_arcsinXO2XPolyEval_b;

	--fxpArcSinXO2XRes_uid74_fpArccosXTest(BITSELECT,73)@31
    fxpArcSinXO2XRes_uid74_fpArccosXTest_in <= s2_uid307_uid310_arcsinXO2XPolyEval_q(30 downto 0);
    fxpArcSinXO2XRes_uid74_fpArccosXTest_b <= fxpArcSinXO2XRes_uid74_fpArccosXTest_in(30 downto 5);

	--fxpArcsinXO2XResWFRange_uid75_fpArccosXTest(BITSELECT,74)@31
    fxpArcsinXO2XResWFRange_uid75_fpArccosXTest_in <= fxpArcSinXO2XRes_uid74_fpArccosXTest_b(24 downto 0);
    fxpArcsinXO2XResWFRange_uid75_fpArccosXTest_b <= fxpArcsinXO2XResWFRange_uid75_fpArccosXTest_in(24 downto 2);

	--fpArcsinXO2XRes_uid76_fpArccosXTest(BITJOIN,75)@31
    fpArcsinXO2XRes_uid76_fpArccosXTest_q <= GND_q & cstBiasP1_uid17_fpArccosXTest_q & fxpArcsinXO2XResWFRange_uid75_fpArccosXTest_b;

	--expY_uid313_arcsinL_uid78_fpArccosXTest(BITSELECT,312)@31
    expY_uid313_arcsinL_uid78_fpArccosXTest_in <= fpArcsinXO2XRes_uid76_fpArccosXTest_q(30 downto 0);
    expY_uid313_arcsinL_uid78_fpArccosXTest_b <= expY_uid313_arcsinL_uid78_fpArccosXTest_in(30 downto 23);

	--expXIsZero_uid340_arcsinL_uid78_fpArccosXTest(LOGICAL,339)@31
    expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_a <= expY_uid313_arcsinL_uid78_fpArccosXTest_b;
    expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_b <= cstAllZWE_uid12_fpArccosXTest_q;
    expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_q <= "1" when expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_a = expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_b else "0";

	--reg_expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_2(REG,549)@31
    reg_expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_2_q <= expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest(LOGICAL,393)@32
    excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_a <= reg_expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_2_q;
    excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_b <= reg_exc_I_uid329_arcsinL_uid78_fpArccosXTest_0_to_excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_2_q;
    excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_q <= excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_a and excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_b;

	--fracY_uid318_arcsinL_uid78_fpArccosXTest(BITSELECT,317)@31
    fracY_uid318_arcsinL_uid78_fpArccosXTest_in <= fpArcsinXO2XRes_uid76_fpArccosXTest_q(22 downto 0);
    fracY_uid318_arcsinL_uid78_fpArccosXTest_b <= fracY_uid318_arcsinL_uid78_fpArccosXTest_in(22 downto 0);

	--reg_fracY_uid318_arcsinL_uid78_fpArccosXTest_0_to_fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_1(REG,550)@31
    reg_fracY_uid318_arcsinL_uid78_fpArccosXTest_0_to_fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracY_uid318_arcsinL_uid78_fpArccosXTest_0_to_fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracY_uid318_arcsinL_uid78_fpArccosXTest_0_to_fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_1_q <= fracY_uid318_arcsinL_uid78_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest(LOGICAL,343)@32
    fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_a <= reg_fracY_uid318_arcsinL_uid78_fpArccosXTest_0_to_fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_1_q;
    fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_b <= cstAllZWF_uid10_fpArccosXTest_q;
    fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_q <= "1" when fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_a = fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_b else "0";

	--expXIsMax_uid342_arcsinL_uid78_fpArccosXTest(LOGICAL,341)@31
    expXIsMax_uid342_arcsinL_uid78_fpArccosXTest_a <= expY_uid313_arcsinL_uid78_fpArccosXTest_b;
    expXIsMax_uid342_arcsinL_uid78_fpArccosXTest_b <= cstAllOWE_uid9_fpArccosXTest_q;
    expXIsMax_uid342_arcsinL_uid78_fpArccosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXIsMax_uid342_arcsinL_uid78_fpArccosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            IF (expXIsMax_uid342_arcsinL_uid78_fpArccosXTest_a = expXIsMax_uid342_arcsinL_uid78_fpArccosXTest_b) THEN
                expXIsMax_uid342_arcsinL_uid78_fpArccosXTest_q <= "1";
            ELSE
                expXIsMax_uid342_arcsinL_uid78_fpArccosXTest_q <= "0";
            END IF;
        END IF;
    END PROCESS;



	--exc_I_uid345_arcsinL_uid78_fpArccosXTest(LOGICAL,344)@32
    exc_I_uid345_arcsinL_uid78_fpArccosXTest_a <= expXIsMax_uid342_arcsinL_uid78_fpArccosXTest_q;
    exc_I_uid345_arcsinL_uid78_fpArccosXTest_b <= fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_q;
    exc_I_uid345_arcsinL_uid78_fpArccosXTest_q <= exc_I_uid345_arcsinL_uid78_fpArccosXTest_a and exc_I_uid345_arcsinL_uid78_fpArccosXTest_b;

	--expXIsZero_uid324_arcsinL_uid78_fpArccosXTest(LOGICAL,323)@19
    expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_a <= reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_1_q;
    expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_b <= cstAllZWE_uid12_fpArccosXTest_q;
    expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q <= "1" when expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_a = expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_b else "0";

	--ld_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q_to_excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_a(DELAY,964)@19
    ld_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q_to_excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q, xout => ld_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q_to_excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excXZAndExcYI_uid395_arcsinL_uid78_fpArccosXTest(LOGICAL,394)@32
    excXZAndExcYI_uid395_arcsinL_uid78_fpArccosXTest_a <= ld_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q_to_excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_a_q;
    excXZAndExcYI_uid395_arcsinL_uid78_fpArccosXTest_b <= exc_I_uid345_arcsinL_uid78_fpArccosXTest_q;
    excXZAndExcYI_uid395_arcsinL_uid78_fpArccosXTest_q <= excXZAndExcYI_uid395_arcsinL_uid78_fpArccosXTest_a and excXZAndExcYI_uid395_arcsinL_uid78_fpArccosXTest_b;

	--ZeroTimesInf_uid396_arcsinL_uid78_fpArccosXTest(LOGICAL,395)@32
    ZeroTimesInf_uid396_arcsinL_uid78_fpArccosXTest_a <= excXZAndExcYI_uid395_arcsinL_uid78_fpArccosXTest_q;
    ZeroTimesInf_uid396_arcsinL_uid78_fpArccosXTest_b <= excYZAndExcXI_uid394_arcsinL_uid78_fpArccosXTest_q;
    ZeroTimesInf_uid396_arcsinL_uid78_fpArccosXTest_q <= ZeroTimesInf_uid396_arcsinL_uid78_fpArccosXTest_a or ZeroTimesInf_uid396_arcsinL_uid78_fpArccosXTest_b;

	--InvFracXIsZero_uid346_arcsinL_uid78_fpArccosXTest(LOGICAL,345)@32
    InvFracXIsZero_uid346_arcsinL_uid78_fpArccosXTest_a <= fracXIsZero_uid344_arcsinL_uid78_fpArccosXTest_q;
    InvFracXIsZero_uid346_arcsinL_uid78_fpArccosXTest_q <= not InvFracXIsZero_uid346_arcsinL_uid78_fpArccosXTest_a;

	--exc_N_uid347_arcsinL_uid78_fpArccosXTest(LOGICAL,346)@32
    exc_N_uid347_arcsinL_uid78_fpArccosXTest_a <= expXIsMax_uid342_arcsinL_uid78_fpArccosXTest_q;
    exc_N_uid347_arcsinL_uid78_fpArccosXTest_b <= InvFracXIsZero_uid346_arcsinL_uid78_fpArccosXTest_q;
    exc_N_uid347_arcsinL_uid78_fpArccosXTest_q <= exc_N_uid347_arcsinL_uid78_fpArccosXTest_a and exc_N_uid347_arcsinL_uid78_fpArccosXTest_b;

	--InvFracXIsZero_uid330_arcsinL_uid78_fpArccosXTest(LOGICAL,329)@19
    InvFracXIsZero_uid330_arcsinL_uid78_fpArccosXTest_a <= fracXIsZero_uid328_arcsinL_uid78_fpArccosXTest_q;
    InvFracXIsZero_uid330_arcsinL_uid78_fpArccosXTest_q <= not InvFracXIsZero_uid330_arcsinL_uid78_fpArccosXTest_a;

	--exc_N_uid331_arcsinL_uid78_fpArccosXTest(LOGICAL,330)@19
    exc_N_uid331_arcsinL_uid78_fpArccosXTest_a <= expXIsMax_uid326_arcsinL_uid78_fpArccosXTest_q;
    exc_N_uid331_arcsinL_uid78_fpArccosXTest_b <= InvFracXIsZero_uid330_arcsinL_uid78_fpArccosXTest_q;
    exc_N_uid331_arcsinL_uid78_fpArccosXTest_q <= exc_N_uid331_arcsinL_uid78_fpArccosXTest_a and exc_N_uid331_arcsinL_uid78_fpArccosXTest_b;

	--ld_exc_N_uid331_arcsinL_uid78_fpArccosXTest_q_to_excRNaN_uid397_arcsinL_uid78_fpArccosXTest_a(DELAY,994)@19
    ld_exc_N_uid331_arcsinL_uid78_fpArccosXTest_q_to_excRNaN_uid397_arcsinL_uid78_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => exc_N_uid331_arcsinL_uid78_fpArccosXTest_q, xout => ld_exc_N_uid331_arcsinL_uid78_fpArccosXTest_q_to_excRNaN_uid397_arcsinL_uid78_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRNaN_uid397_arcsinL_uid78_fpArccosXTest(LOGICAL,396)@32
    excRNaN_uid397_arcsinL_uid78_fpArccosXTest_a <= ld_exc_N_uid331_arcsinL_uid78_fpArccosXTest_q_to_excRNaN_uid397_arcsinL_uid78_fpArccosXTest_a_q;
    excRNaN_uid397_arcsinL_uid78_fpArccosXTest_b <= exc_N_uid347_arcsinL_uid78_fpArccosXTest_q;
    excRNaN_uid397_arcsinL_uid78_fpArccosXTest_c <= ZeroTimesInf_uid396_arcsinL_uid78_fpArccosXTest_q;
    excRNaN_uid397_arcsinL_uid78_fpArccosXTest_q <= excRNaN_uid397_arcsinL_uid78_fpArccosXTest_a or excRNaN_uid397_arcsinL_uid78_fpArccosXTest_b or excRNaN_uid397_arcsinL_uid78_fpArccosXTest_c;

	--InvExcRNaN_uid409_arcsinL_uid78_fpArccosXTest(LOGICAL,408)@32
    InvExcRNaN_uid409_arcsinL_uid78_fpArccosXTest_a <= excRNaN_uid397_arcsinL_uid78_fpArccosXTest_q;
    InvExcRNaN_uid409_arcsinL_uid78_fpArccosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExcRNaN_uid409_arcsinL_uid78_fpArccosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExcRNaN_uid409_arcsinL_uid78_fpArccosXTest_q <= not InvExcRNaN_uid409_arcsinL_uid78_fpArccosXTest_a;
        END IF;
    END PROCESS;



	--signY_uid315_arcsinL_uid78_fpArccosXTest(BITSELECT,314)@31
    signY_uid315_arcsinL_uid78_fpArccosXTest_in <= fpArcsinXO2XRes_uid76_fpArccosXTest_q;
    signY_uid315_arcsinL_uid78_fpArccosXTest_b <= signY_uid315_arcsinL_uid78_fpArccosXTest_in(31 downto 31);

	--signX_uid314_arcsinL_uid78_fpArccosXTest(BITSELECT,313)@18
    signX_uid314_arcsinL_uid78_fpArccosXTest_in <= RSqrt_uid267_sqrtFPL_uid63_fpArccosXTest_q;
    signX_uid314_arcsinL_uid78_fpArccosXTest_b <= signX_uid314_arcsinL_uid78_fpArccosXTest_in(31 downto 31);

	--reg_signX_uid314_arcsinL_uid78_fpArccosXTest_0_to_signR_uid380_arcsinL_uid78_fpArccosXTest_1(REG,569)@18
    reg_signX_uid314_arcsinL_uid78_fpArccosXTest_0_to_signR_uid380_arcsinL_uid78_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_signX_uid314_arcsinL_uid78_fpArccosXTest_0_to_signR_uid380_arcsinL_uid78_fpArccosXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_signX_uid314_arcsinL_uid78_fpArccosXTest_0_to_signR_uid380_arcsinL_uid78_fpArccosXTest_1_q <= signX_uid314_arcsinL_uid78_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_signX_uid314_arcsinL_uid78_fpArccosXTest_0_to_signR_uid380_arcsinL_uid78_fpArccosXTest_1_q_to_signR_uid380_arcsinL_uid78_fpArccosXTest_a(DELAY,958)@19
    ld_reg_signX_uid314_arcsinL_uid78_fpArccosXTest_0_to_signR_uid380_arcsinL_uid78_fpArccosXTest_1_q_to_signR_uid380_arcsinL_uid78_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => reg_signX_uid314_arcsinL_uid78_fpArccosXTest_0_to_signR_uid380_arcsinL_uid78_fpArccosXTest_1_q, xout => ld_reg_signX_uid314_arcsinL_uid78_fpArccosXTest_0_to_signR_uid380_arcsinL_uid78_fpArccosXTest_1_q_to_signR_uid380_arcsinL_uid78_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signR_uid380_arcsinL_uid78_fpArccosXTest(LOGICAL,379)@31
    signR_uid380_arcsinL_uid78_fpArccosXTest_a <= ld_reg_signX_uid314_arcsinL_uid78_fpArccosXTest_0_to_signR_uid380_arcsinL_uid78_fpArccosXTest_1_q_to_signR_uid380_arcsinL_uid78_fpArccosXTest_a_q;
    signR_uid380_arcsinL_uid78_fpArccosXTest_b <= signY_uid315_arcsinL_uid78_fpArccosXTest_b;
    signR_uid380_arcsinL_uid78_fpArccosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signR_uid380_arcsinL_uid78_fpArccosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            signR_uid380_arcsinL_uid78_fpArccosXTest_q <= signR_uid380_arcsinL_uid78_fpArccosXTest_a xor signR_uid380_arcsinL_uid78_fpArccosXTest_b;
        END IF;
    END PROCESS;



	--ld_signR_uid380_arcsinL_uid78_fpArccosXTest_q_to_signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_a(DELAY,1006)@32
    ld_signR_uid380_arcsinL_uid78_fpArccosXTest_q_to_signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signR_uid380_arcsinL_uid78_fpArccosXTest_q, xout => ld_signR_uid380_arcsinL_uid78_fpArccosXTest_q_to_signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signRPostExc_uid410_arcsinL_uid78_fpArccosXTest(LOGICAL,409)@33
    signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_a <= ld_signR_uid380_arcsinL_uid78_fpArccosXTest_q_to_signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_a_q;
    signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_b <= InvExcRNaN_uid409_arcsinL_uid78_fpArccosXTest_q;
    signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_q <= signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_a and signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_b;

	--ld_signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_q_to_R_uid411_arcsinL_uid78_fpArccosXTest_c(DELAY,1010)@33
    ld_signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_q_to_R_uid411_arcsinL_uid78_fpArccosXTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_q, xout => ld_signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_q_to_R_uid411_arcsinL_uid78_fpArccosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--add_one_fracY_uid318_uid319_uid319_arcsinL_uid78_fpArccosXTest(BITJOIN,318)@31
    add_one_fracY_uid318_uid319_uid319_arcsinL_uid78_fpArccosXTest_q <= VCC_q & fracY_uid318_arcsinL_uid78_fpArccosXTest_b;

	--reg_add_one_fracY_uid318_uid319_uid319_arcsinL_uid78_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_1(REG,556)@31
    reg_add_one_fracY_uid318_uid319_uid319_arcsinL_uid78_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_add_one_fracY_uid318_uid319_uid319_arcsinL_uid78_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_1_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_add_one_fracY_uid318_uid319_uid319_arcsinL_uid78_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_1_q <= add_one_fracY_uid318_uid319_uid319_arcsinL_uid78_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_nor(LOGICAL,1273)
    ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_nor_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q;
    ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_nor_b <= ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_sticky_ena_q;
    ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_nor_q <= not (ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_nor_a or ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_nor_b);

	--ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_mem_top(CONSTANT,1257)
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_mem_top_q <= "01011";

	--ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmp(LOGICAL,1258)
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmp_a <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_mem_top_q;
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdmux_q);
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmp_q <= "1" when ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmp_a = ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmp_b else "0";

	--ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmpReg(REG,1259)
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmpReg_q <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_sticky_ena(REG,1274)
    ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_nor_q = "1") THEN
                ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_sticky_ena_q <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_enaAnd(LOGICAL,1275)
    ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_enaAnd_a <= ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_sticky_ena_q;
    ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_enaAnd_b <= en;
    ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_enaAnd_q <= ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_enaAnd_a and ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_enaAnd_b;

	--ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt(COUNTER,1253)
    -- every=1, low=0, high=11, step=1, init=1
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_i = 10 THEN
                      ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_i <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_i - 11;
                    ELSE
                        ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_i <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_i,4));


	--ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdreg(REG,1254)
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdreg_q <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdmux(MUX,1255)
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdmux_s <= en;
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdmux: PROCESS (ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdmux_s, ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdreg_q, ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdmux_q <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdmux_q <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem(DUALMEM,1264)
    ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_reset0 <= areset;
    ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_ia <= reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_rightShiftStage0_uid278_alignSqrt_uid69_fpArccosXTest_2_q;
    ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_aa <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdreg_q;
    ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_ab <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdmux_q;
    ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_iq,
        address_a => ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_aa,
        data_a => ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_ia
    );
        ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_q <= ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_iq(23 downto 0);

	--prod_uid355_arcsinL_uid78_fpArccosXTest(MULT,354)@32
    prod_uid355_arcsinL_uid78_fpArccosXTest_pr <= UNSIGNED(prod_uid355_arcsinL_uid78_fpArccosXTest_a) * UNSIGNED(prod_uid355_arcsinL_uid78_fpArccosXTest_b);
    prod_uid355_arcsinL_uid78_fpArccosXTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid355_arcsinL_uid78_fpArccosXTest_a <= (others => '0');
            prod_uid355_arcsinL_uid78_fpArccosXTest_b <= (others => '0');
            prod_uid355_arcsinL_uid78_fpArccosXTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid355_arcsinL_uid78_fpArccosXTest_a <= ld_reg_oSqrtFPLFrac_uid65_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_0_q_to_prod_uid355_arcsinL_uid78_fpArccosXTest_a_replace_mem_q;
                prod_uid355_arcsinL_uid78_fpArccosXTest_b <= reg_add_one_fracY_uid318_uid319_uid319_arcsinL_uid78_fpArccosXTest_0_to_prod_uid355_arcsinL_uid78_fpArccosXTest_1_q;
                prod_uid355_arcsinL_uid78_fpArccosXTest_s1 <= STD_LOGIC_VECTOR(prod_uid355_arcsinL_uid78_fpArccosXTest_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid355_arcsinL_uid78_fpArccosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid355_arcsinL_uid78_fpArccosXTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid355_arcsinL_uid78_fpArccosXTest_q <= prod_uid355_arcsinL_uid78_fpArccosXTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normalizeBit_uid356_arcsinL_uid78_fpArccosXTest(BITSELECT,355)@35
    normalizeBit_uid356_arcsinL_uid78_fpArccosXTest_in <= prod_uid355_arcsinL_uid78_fpArccosXTest_q;
    normalizeBit_uid356_arcsinL_uid78_fpArccosXTest_b <= normalizeBit_uid356_arcsinL_uid78_fpArccosXTest_in(47 downto 47);

	--fracRPostNormHigh_uid358_arcsinL_uid78_fpArccosXTest(BITSELECT,357)@35
    fracRPostNormHigh_uid358_arcsinL_uid78_fpArccosXTest_in <= prod_uid355_arcsinL_uid78_fpArccosXTest_q(46 downto 0);
    fracRPostNormHigh_uid358_arcsinL_uid78_fpArccosXTest_b <= fracRPostNormHigh_uid358_arcsinL_uid78_fpArccosXTest_in(46 downto 23);

	--fracRPostNormLow_uid359_arcsinL_uid78_fpArccosXTest(BITSELECT,358)@35
    fracRPostNormLow_uid359_arcsinL_uid78_fpArccosXTest_in <= prod_uid355_arcsinL_uid78_fpArccosXTest_q(45 downto 0);
    fracRPostNormLow_uid359_arcsinL_uid78_fpArccosXTest_b <= fracRPostNormLow_uid359_arcsinL_uid78_fpArccosXTest_in(45 downto 22);

	--fracRPostNorm_uid360_arcsinL_uid78_fpArccosXTest(MUX,359)@35
    fracRPostNorm_uid360_arcsinL_uid78_fpArccosXTest_s <= normalizeBit_uid356_arcsinL_uid78_fpArccosXTest_b;
    fracRPostNorm_uid360_arcsinL_uid78_fpArccosXTest: PROCESS (fracRPostNorm_uid360_arcsinL_uid78_fpArccosXTest_s, en, fracRPostNormLow_uid359_arcsinL_uid78_fpArccosXTest_b, fracRPostNormHigh_uid358_arcsinL_uid78_fpArccosXTest_b)
    BEGIN
            CASE fracRPostNorm_uid360_arcsinL_uid78_fpArccosXTest_s IS
                  WHEN "0" => fracRPostNorm_uid360_arcsinL_uid78_fpArccosXTest_q <= fracRPostNormLow_uid359_arcsinL_uid78_fpArccosXTest_b;
                  WHEN "1" => fracRPostNorm_uid360_arcsinL_uid78_fpArccosXTest_q <= fracRPostNormHigh_uid358_arcsinL_uid78_fpArccosXTest_b;
                  WHEN OTHERS => fracRPostNorm_uid360_arcsinL_uid78_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--FracRPostNorm1dto0_uid368_arcsinL_uid78_fpArccosXTest(BITSELECT,367)@35
    FracRPostNorm1dto0_uid368_arcsinL_uid78_fpArccosXTest_in <= fracRPostNorm_uid360_arcsinL_uid78_fpArccosXTest_q(1 downto 0);
    FracRPostNorm1dto0_uid368_arcsinL_uid78_fpArccosXTest_b <= FracRPostNorm1dto0_uid368_arcsinL_uid78_fpArccosXTest_in(1 downto 0);

	--Prod22_uid362_arcsinL_uid78_fpArccosXTest(BITSELECT,361)@35
    Prod22_uid362_arcsinL_uid78_fpArccosXTest_in <= prod_uid355_arcsinL_uid78_fpArccosXTest_q(22 downto 0);
    Prod22_uid362_arcsinL_uid78_fpArccosXTest_b <= Prod22_uid362_arcsinL_uid78_fpArccosXTest_in(22 downto 22);

	--extraStickyBit_uid363_arcsinL_uid78_fpArccosXTest(MUX,362)@35
    extraStickyBit_uid363_arcsinL_uid78_fpArccosXTest_s <= normalizeBit_uid356_arcsinL_uid78_fpArccosXTest_b;
    extraStickyBit_uid363_arcsinL_uid78_fpArccosXTest: PROCESS (extraStickyBit_uid363_arcsinL_uid78_fpArccosXTest_s, en, GND_q, Prod22_uid362_arcsinL_uid78_fpArccosXTest_b)
    BEGIN
            CASE extraStickyBit_uid363_arcsinL_uid78_fpArccosXTest_s IS
                  WHEN "0" => extraStickyBit_uid363_arcsinL_uid78_fpArccosXTest_q <= GND_q;
                  WHEN "1" => extraStickyBit_uid363_arcsinL_uid78_fpArccosXTest_q <= Prod22_uid362_arcsinL_uid78_fpArccosXTest_b;
                  WHEN OTHERS => extraStickyBit_uid363_arcsinL_uid78_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--stickyRange_uid361_arcsinL_uid78_fpArccosXTest(BITSELECT,360)@35
    stickyRange_uid361_arcsinL_uid78_fpArccosXTest_in <= prod_uid355_arcsinL_uid78_fpArccosXTest_q(21 downto 0);
    stickyRange_uid361_arcsinL_uid78_fpArccosXTest_b <= stickyRange_uid361_arcsinL_uid78_fpArccosXTest_in(21 downto 0);

	--stickyExtendedRange_uid364_arcsinL_uid78_fpArccosXTest(BITJOIN,363)@35
    stickyExtendedRange_uid364_arcsinL_uid78_fpArccosXTest_q <= extraStickyBit_uid363_arcsinL_uid78_fpArccosXTest_q & stickyRange_uid361_arcsinL_uid78_fpArccosXTest_b;

	--stickyRangeComparator_uid366_arcsinL_uid78_fpArccosXTest(LOGICAL,365)@35
    stickyRangeComparator_uid366_arcsinL_uid78_fpArccosXTest_a <= stickyExtendedRange_uid364_arcsinL_uid78_fpArccosXTest_q;
    stickyRangeComparator_uid366_arcsinL_uid78_fpArccosXTest_b <= cstAllZWF_uid10_fpArccosXTest_q;
    stickyRangeComparator_uid366_arcsinL_uid78_fpArccosXTest_q <= "1" when stickyRangeComparator_uid366_arcsinL_uid78_fpArccosXTest_a = stickyRangeComparator_uid366_arcsinL_uid78_fpArccosXTest_b else "0";

	--sticky_uid367_arcsinL_uid78_fpArccosXTest(LOGICAL,366)@35
    sticky_uid367_arcsinL_uid78_fpArccosXTest_a <= stickyRangeComparator_uid366_arcsinL_uid78_fpArccosXTest_q;
    sticky_uid367_arcsinL_uid78_fpArccosXTest_q <= not sticky_uid367_arcsinL_uid78_fpArccosXTest_a;

	--lrs_uid369_arcsinL_uid78_fpArccosXTest(BITJOIN,368)@35
    lrs_uid369_arcsinL_uid78_fpArccosXTest_q <= FracRPostNorm1dto0_uid368_arcsinL_uid78_fpArccosXTest_b & sticky_uid367_arcsinL_uid78_fpArccosXTest_q;

	--roundBitDetectionPattern_uid371_arcsinL_uid78_fpArccosXTest(LOGICAL,370)@35
    roundBitDetectionPattern_uid371_arcsinL_uid78_fpArccosXTest_a <= lrs_uid369_arcsinL_uid78_fpArccosXTest_q;
    roundBitDetectionPattern_uid371_arcsinL_uid78_fpArccosXTest_b <= roundBitDetectionConstant_uid370_arcsinL_uid78_fpArccosXTest_q;
    roundBitDetectionPattern_uid371_arcsinL_uid78_fpArccosXTest_q <= "1" when roundBitDetectionPattern_uid371_arcsinL_uid78_fpArccosXTest_a = roundBitDetectionPattern_uid371_arcsinL_uid78_fpArccosXTest_b else "0";

	--roundBit_uid372_arcsinL_uid78_fpArccosXTest(LOGICAL,371)@35
    roundBit_uid372_arcsinL_uid78_fpArccosXTest_a <= roundBitDetectionPattern_uid371_arcsinL_uid78_fpArccosXTest_q;
    roundBit_uid372_arcsinL_uid78_fpArccosXTest_q <= not roundBit_uid372_arcsinL_uid78_fpArccosXTest_a;

	--roundBitAndNormalizationOp_uid375_arcsinL_uid78_fpArccosXTest(BITJOIN,374)@35
    roundBitAndNormalizationOp_uid375_arcsinL_uid78_fpArccosXTest_q <= GND_q & normalizeBit_uid356_arcsinL_uid78_fpArccosXTest_b & cstAllZWF_uid10_fpArccosXTest_q & roundBit_uid372_arcsinL_uid78_fpArccosXTest_q;

	--reg_roundBitAndNormalizationOp_uid375_arcsinL_uid78_fpArccosXTest_0_to_expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_1(REG,560)@35
    reg_roundBitAndNormalizationOp_uid375_arcsinL_uid78_fpArccosXTest_0_to_expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_roundBitAndNormalizationOp_uid375_arcsinL_uid78_fpArccosXTest_0_to_expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_roundBitAndNormalizationOp_uid375_arcsinL_uid78_fpArccosXTest_0_to_expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_1_q <= roundBitAndNormalizationOp_uid375_arcsinL_uid78_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--biasInc_uid353_arcsinL_uid78_fpArccosXTest(CONSTANT,352)
    biasInc_uid353_arcsinL_uid78_fpArccosXTest_q <= "0001111111";

	--reg_expY_uid313_arcsinL_uid78_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_1(REG,558)@31
    reg_expY_uid313_arcsinL_uid78_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expY_uid313_arcsinL_uid78_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expY_uid313_arcsinL_uid78_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_1_q <= expY_uid313_arcsinL_uid78_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_nor(LOGICAL,1261)
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_nor_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q;
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_nor_b <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_sticky_ena_q;
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_nor_q <= not (ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_nor_a or ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_nor_b);

	--ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_sticky_ena(REG,1262)
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_nor_q = "1") THEN
                ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_sticky_ena_q <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_enaAnd(LOGICAL,1263)
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_enaAnd_a <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_sticky_ena_q;
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_enaAnd_b <= en;
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_enaAnd_q <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_enaAnd_a and ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_enaAnd_b;

	--ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem(DUALMEM,1252)
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_reset0 <= areset;
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_ia <= reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_1_q;
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_aa <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdreg_q;
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_ab <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_rdmux_q;
    ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_iq,
        address_a => ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_aa,
        data_a => ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_ia
    );
        ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_q <= ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_iq(7 downto 0);

	--expSum_uid352_arcsinL_uid78_fpArccosXTest(ADD,351)@32
    expSum_uid352_arcsinL_uid78_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & ld_reg_SqrtFPL30dto23_uid66_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_0_q_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_a_replace_mem_q);
    expSum_uid352_arcsinL_uid78_fpArccosXTest_b <= STD_LOGIC_VECTOR("0" & reg_expY_uid313_arcsinL_uid78_fpArccosXTest_0_to_expSum_uid352_arcsinL_uid78_fpArccosXTest_1_q);
    expSum_uid352_arcsinL_uid78_fpArccosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid352_arcsinL_uid78_fpArccosXTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expSum_uid352_arcsinL_uid78_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid352_arcsinL_uid78_fpArccosXTest_a) + UNSIGNED(expSum_uid352_arcsinL_uid78_fpArccosXTest_b));
            END IF;
        END IF;
    END PROCESS;
    expSum_uid352_arcsinL_uid78_fpArccosXTest_q <= expSum_uid352_arcsinL_uid78_fpArccosXTest_o(8 downto 0);


	--ld_expSum_uid352_arcsinL_uid78_fpArccosXTest_q_to_expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_a(DELAY,927)@33
    ld_expSum_uid352_arcsinL_uid78_fpArccosXTest_q_to_expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => expSum_uid352_arcsinL_uid78_fpArccosXTest_q, xout => ld_expSum_uid352_arcsinL_uid78_fpArccosXTest_q_to_expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--expSumMBias_uid354_arcsinL_uid78_fpArccosXTest(SUB,353)@34
    expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_a <= STD_LOGIC_VECTOR('0' & "00" & ld_expSum_uid352_arcsinL_uid78_fpArccosXTest_q_to_expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_a_q);
    expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_b <= STD_LOGIC_VECTOR((11 downto 10 => biasInc_uid353_arcsinL_uid78_fpArccosXTest_q(9)) & biasInc_uid353_arcsinL_uid78_fpArccosXTest_q);
    expSumMBias_uid354_arcsinL_uid78_fpArccosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_a) - SIGNED(expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_b));
            END IF;
        END IF;
    END PROCESS;
    expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_q <= expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_o(10 downto 0);


	--expFracPreRound_uid373_arcsinL_uid78_fpArccosXTest(BITJOIN,372)@35
    expFracPreRound_uid373_arcsinL_uid78_fpArccosXTest_q <= expSumMBias_uid354_arcsinL_uid78_fpArccosXTest_q & fracRPostNorm_uid360_arcsinL_uid78_fpArccosXTest_q;

	--reg_expFracPreRound_uid373_arcsinL_uid78_fpArccosXTest_0_to_expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_0(REG,559)@35
    reg_expFracPreRound_uid373_arcsinL_uid78_fpArccosXTest_0_to_expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracPreRound_uid373_arcsinL_uid78_fpArccosXTest_0_to_expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_0_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracPreRound_uid373_arcsinL_uid78_fpArccosXTest_0_to_expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_0_q <= expFracPreRound_uid373_arcsinL_uid78_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest(ADD,375)@36
    expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_a <= STD_LOGIC_VECTOR((36 downto 35 => reg_expFracPreRound_uid373_arcsinL_uid78_fpArccosXTest_0_to_expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_0_q(34)) & reg_expFracPreRound_uid373_arcsinL_uid78_fpArccosXTest_0_to_expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_0_q);
    expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_b <= STD_LOGIC_VECTOR('0' & "0000000000" & reg_roundBitAndNormalizationOp_uid375_arcsinL_uid78_fpArccosXTest_0_to_expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_1_q);
            expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_a) + SIGNED(expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_b));
    expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_q <= expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_o(35 downto 0);


	--expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest(BITSELECT,377)@36
    expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_in <= expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_q;
    expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_b <= expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_in(35 downto 24);

	--expRPreExc_uid379_arcsinL_uid78_fpArccosXTest(BITSELECT,378)@36
    expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_in <= expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_b(7 downto 0);
    expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_b <= expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_in(7 downto 0);

	--reg_expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_0_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_3(REG,568)@36
    reg_expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_0_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_0_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_0_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_3_q <= expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_0_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_3_q_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_d(DELAY,1004)@37
    ld_reg_expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_0_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_3_q_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_d : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => reg_expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_0_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_3_q, xout => ld_reg_expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_0_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_3_q_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excRNaN_uid397_arcsinL_uid78_fpArccosXTest_q_to_concExc_uid398_arcsinL_uid78_fpArccosXTest_c(DELAY,999)@32
    ld_excRNaN_uid397_arcsinL_uid78_fpArccosXTest_q_to_concExc_uid398_arcsinL_uid78_fpArccosXTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excRNaN_uid397_arcsinL_uid78_fpArccosXTest_q, xout => ld_excRNaN_uid397_arcsinL_uid78_fpArccosXTest_q_to_concExc_uid398_arcsinL_uid78_fpArccosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_0_to_expUdf_uid381_arcsinL_uid78_fpArccosXTest_1(REG,561)@36
    reg_expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_0_to_expUdf_uid381_arcsinL_uid78_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_0_to_expUdf_uid381_arcsinL_uid78_fpArccosXTest_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_0_to_expUdf_uid381_arcsinL_uid78_fpArccosXTest_1_q <= expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expOvf_uid383_arcsinL_uid78_fpArccosXTest(COMPARE,382)@37
    expOvf_uid383_arcsinL_uid78_fpArccosXTest_cin <= GND_q;
    expOvf_uid383_arcsinL_uid78_fpArccosXTest_a <= STD_LOGIC_VECTOR((13 downto 12 => reg_expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_0_to_expUdf_uid381_arcsinL_uid78_fpArccosXTest_1_q(11)) & reg_expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_0_to_expUdf_uid381_arcsinL_uid78_fpArccosXTest_1_q) & '0';
    expOvf_uid383_arcsinL_uid78_fpArccosXTest_b <= STD_LOGIC_VECTOR('0' & "00000" & cstAllOWE_uid9_fpArccosXTest_q) & expOvf_uid383_arcsinL_uid78_fpArccosXTest_cin(0);
            expOvf_uid383_arcsinL_uid78_fpArccosXTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid383_arcsinL_uid78_fpArccosXTest_a) - SIGNED(expOvf_uid383_arcsinL_uid78_fpArccosXTest_b));
    expOvf_uid383_arcsinL_uid78_fpArccosXTest_n(0) <= not expOvf_uid383_arcsinL_uid78_fpArccosXTest_o(14);


	--InvExc_N_uid348_arcsinL_uid78_fpArccosXTest(LOGICAL,347)@32
    InvExc_N_uid348_arcsinL_uid78_fpArccosXTest_a <= exc_N_uid347_arcsinL_uid78_fpArccosXTest_q;
    InvExc_N_uid348_arcsinL_uid78_fpArccosXTest_q <= not InvExc_N_uid348_arcsinL_uid78_fpArccosXTest_a;

	--InvExc_I_uid349_arcsinL_uid78_fpArccosXTest(LOGICAL,348)@32
    InvExc_I_uid349_arcsinL_uid78_fpArccosXTest_a <= exc_I_uid345_arcsinL_uid78_fpArccosXTest_q;
    InvExc_I_uid349_arcsinL_uid78_fpArccosXTest_q <= not InvExc_I_uid349_arcsinL_uid78_fpArccosXTest_a;

	--InvExpXIsZero_uid350_arcsinL_uid78_fpArccosXTest(LOGICAL,349)@31
    InvExpXIsZero_uid350_arcsinL_uid78_fpArccosXTest_a <= expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_q;
    InvExpXIsZero_uid350_arcsinL_uid78_fpArccosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExpXIsZero_uid350_arcsinL_uid78_fpArccosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExpXIsZero_uid350_arcsinL_uid78_fpArccosXTest_q <= not InvExpXIsZero_uid350_arcsinL_uid78_fpArccosXTest_a;
        END IF;
    END PROCESS;



	--exc_R_uid351_arcsinL_uid78_fpArccosXTest(LOGICAL,350)@32
    exc_R_uid351_arcsinL_uid78_fpArccosXTest_a <= InvExpXIsZero_uid350_arcsinL_uid78_fpArccosXTest_q;
    exc_R_uid351_arcsinL_uid78_fpArccosXTest_b <= InvExc_I_uid349_arcsinL_uid78_fpArccosXTest_q;
    exc_R_uid351_arcsinL_uid78_fpArccosXTest_c <= InvExc_N_uid348_arcsinL_uid78_fpArccosXTest_q;
    exc_R_uid351_arcsinL_uid78_fpArccosXTest_q <= exc_R_uid351_arcsinL_uid78_fpArccosXTest_a and exc_R_uid351_arcsinL_uid78_fpArccosXTest_b and exc_R_uid351_arcsinL_uid78_fpArccosXTest_c;

	--ld_exc_R_uid351_arcsinL_uid78_fpArccosXTest_q_to_excZC3_uid387_arcsinL_uid78_fpArccosXTest_b(DELAY,969)@32
    ld_exc_R_uid351_arcsinL_uid78_fpArccosXTest_q_to_excZC3_uid387_arcsinL_uid78_fpArccosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => exc_R_uid351_arcsinL_uid78_fpArccosXTest_q, xout => ld_exc_R_uid351_arcsinL_uid78_fpArccosXTest_q_to_excZC3_uid387_arcsinL_uid78_fpArccosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid332_arcsinL_uid78_fpArccosXTest(LOGICAL,331)@19
    InvExc_N_uid332_arcsinL_uid78_fpArccosXTest_a <= exc_N_uid331_arcsinL_uid78_fpArccosXTest_q;
    InvExc_N_uid332_arcsinL_uid78_fpArccosXTest_q <= not InvExc_N_uid332_arcsinL_uid78_fpArccosXTest_a;

	--ld_InvExc_N_uid332_arcsinL_uid78_fpArccosXTest_q_to_exc_R_uid335_arcsinL_uid78_fpArccosXTest_c(DELAY,910)@19
    ld_InvExc_N_uid332_arcsinL_uid78_fpArccosXTest_q_to_exc_R_uid335_arcsinL_uid78_fpArccosXTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => InvExc_N_uid332_arcsinL_uid78_fpArccosXTest_q, xout => ld_InvExc_N_uid332_arcsinL_uid78_fpArccosXTest_q_to_exc_R_uid335_arcsinL_uid78_fpArccosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_I_uid333_arcsinL_uid78_fpArccosXTest(LOGICAL,332)@31
    InvExc_I_uid333_arcsinL_uid78_fpArccosXTest_a <= exc_I_uid329_arcsinL_uid78_fpArccosXTest_q;
    InvExc_I_uid333_arcsinL_uid78_fpArccosXTest_q <= not InvExc_I_uid333_arcsinL_uid78_fpArccosXTest_a;

	--ld_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q_to_InvExpXIsZero_uid334_arcsinL_uid78_fpArccosXTest_a(DELAY,907)@19
    ld_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q_to_InvExpXIsZero_uid334_arcsinL_uid78_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q, xout => ld_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q_to_InvExpXIsZero_uid334_arcsinL_uid78_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvExpXIsZero_uid334_arcsinL_uid78_fpArccosXTest(LOGICAL,333)@31
    InvExpXIsZero_uid334_arcsinL_uid78_fpArccosXTest_a <= ld_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q_to_InvExpXIsZero_uid334_arcsinL_uid78_fpArccosXTest_a_q;
    InvExpXIsZero_uid334_arcsinL_uid78_fpArccosXTest_q <= not InvExpXIsZero_uid334_arcsinL_uid78_fpArccosXTest_a;

	--exc_R_uid335_arcsinL_uid78_fpArccosXTest(LOGICAL,334)@31
    exc_R_uid335_arcsinL_uid78_fpArccosXTest_a <= InvExpXIsZero_uid334_arcsinL_uid78_fpArccosXTest_q;
    exc_R_uid335_arcsinL_uid78_fpArccosXTest_b <= InvExc_I_uid333_arcsinL_uid78_fpArccosXTest_q;
    exc_R_uid335_arcsinL_uid78_fpArccosXTest_c <= ld_InvExc_N_uid332_arcsinL_uid78_fpArccosXTest_q_to_exc_R_uid335_arcsinL_uid78_fpArccosXTest_c_q;
    exc_R_uid335_arcsinL_uid78_fpArccosXTest_q <= exc_R_uid335_arcsinL_uid78_fpArccosXTest_a and exc_R_uid335_arcsinL_uid78_fpArccosXTest_b and exc_R_uid335_arcsinL_uid78_fpArccosXTest_c;

	--ld_exc_R_uid335_arcsinL_uid78_fpArccosXTest_q_to_excZC3_uid387_arcsinL_uid78_fpArccosXTest_a(DELAY,968)@31
    ld_exc_R_uid335_arcsinL_uid78_fpArccosXTest_q_to_excZC3_uid387_arcsinL_uid78_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => exc_R_uid335_arcsinL_uid78_fpArccosXTest_q, xout => ld_exc_R_uid335_arcsinL_uid78_fpArccosXTest_q_to_excZC3_uid387_arcsinL_uid78_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--ExcROvfAndInReg_uid392_arcsinL_uid78_fpArccosXTest(LOGICAL,391)@37
    ExcROvfAndInReg_uid392_arcsinL_uid78_fpArccosXTest_a <= ld_exc_R_uid335_arcsinL_uid78_fpArccosXTest_q_to_excZC3_uid387_arcsinL_uid78_fpArccosXTest_a_q;
    ExcROvfAndInReg_uid392_arcsinL_uid78_fpArccosXTest_b <= ld_exc_R_uid351_arcsinL_uid78_fpArccosXTest_q_to_excZC3_uid387_arcsinL_uid78_fpArccosXTest_b_q;
    ExcROvfAndInReg_uid392_arcsinL_uid78_fpArccosXTest_c <= expOvf_uid383_arcsinL_uid78_fpArccosXTest_n;
    ExcROvfAndInReg_uid392_arcsinL_uid78_fpArccosXTest_q <= ExcROvfAndInReg_uid392_arcsinL_uid78_fpArccosXTest_a and ExcROvfAndInReg_uid392_arcsinL_uid78_fpArccosXTest_b and ExcROvfAndInReg_uid392_arcsinL_uid78_fpArccosXTest_c;

	--ld_exc_I_uid329_arcsinL_uid78_fpArccosXTest_q_to_excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_a(DELAY,975)@31
    ld_exc_I_uid329_arcsinL_uid78_fpArccosXTest_q_to_excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_I_uid329_arcsinL_uid78_fpArccosXTest_q, xout => ld_exc_I_uid329_arcsinL_uid78_fpArccosXTest_q_to_excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest(LOGICAL,390)@32
    excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest_a <= exc_R_uid351_arcsinL_uid78_fpArccosXTest_q;
    excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest_b <= ld_exc_I_uid329_arcsinL_uid78_fpArccosXTest_q_to_excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_a_q;
    excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest_q <= excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest_a and excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest_b;

	--ld_excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_c(DELAY,986)@32
    ld_excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest_q, xout => ld_excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_exc_R_uid335_arcsinL_uid78_fpArccosXTest_0_to_excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_2(REG,554)@31
    reg_exc_R_uid335_arcsinL_uid78_fpArccosXTest_0_to_excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_R_uid335_arcsinL_uid78_fpArccosXTest_0_to_excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_R_uid335_arcsinL_uid78_fpArccosXTest_0_to_excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_2_q <= exc_R_uid335_arcsinL_uid78_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest(LOGICAL,389)@32
    excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest_a <= reg_exc_R_uid335_arcsinL_uid78_fpArccosXTest_0_to_excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_2_q;
    excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest_b <= exc_I_uid345_arcsinL_uid78_fpArccosXTest_q;
    excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest_q <= excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest_a and excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest_b;

	--ld_excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_b(DELAY,985)@32
    ld_excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest_q, xout => ld_excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest(LOGICAL,388)@32
    excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_a <= ld_exc_I_uid329_arcsinL_uid78_fpArccosXTest_q_to_excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_a_q;
    excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_b <= exc_I_uid345_arcsinL_uid78_fpArccosXTest_q;
    excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_q <= excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_a and excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_b;

	--ld_excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_a(DELAY,984)@32
    ld_excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_q, xout => ld_excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRInf_uid393_arcsinL_uid78_fpArccosXTest(LOGICAL,392)@37
    excRInf_uid393_arcsinL_uid78_fpArccosXTest_a <= ld_excXIAndExcYI_uid389_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_a_q;
    excRInf_uid393_arcsinL_uid78_fpArccosXTest_b <= ld_excXRAndExcYI_uid390_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_b_q;
    excRInf_uid393_arcsinL_uid78_fpArccosXTest_c <= ld_excYRAndExcXI_uid391_arcsinL_uid78_fpArccosXTest_q_to_excRInf_uid393_arcsinL_uid78_fpArccosXTest_c_q;
    excRInf_uid393_arcsinL_uid78_fpArccosXTest_d <= ExcROvfAndInReg_uid392_arcsinL_uid78_fpArccosXTest_q;
    excRInf_uid393_arcsinL_uid78_fpArccosXTest_q <= excRInf_uid393_arcsinL_uid78_fpArccosXTest_a or excRInf_uid393_arcsinL_uid78_fpArccosXTest_b or excRInf_uid393_arcsinL_uid78_fpArccosXTest_c or excRInf_uid393_arcsinL_uid78_fpArccosXTest_d;

	--expUdf_uid381_arcsinL_uid78_fpArccosXTest(COMPARE,380)@37
    expUdf_uid381_arcsinL_uid78_fpArccosXTest_cin <= GND_q;
    expUdf_uid381_arcsinL_uid78_fpArccosXTest_a <= STD_LOGIC_VECTOR('0' & "000000000000" & GND_q) & '0';
    expUdf_uid381_arcsinL_uid78_fpArccosXTest_b <= STD_LOGIC_VECTOR((13 downto 12 => reg_expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_0_to_expUdf_uid381_arcsinL_uid78_fpArccosXTest_1_q(11)) & reg_expRPreExcExt_uid378_arcsinL_uid78_fpArccosXTest_0_to_expUdf_uid381_arcsinL_uid78_fpArccosXTest_1_q) & expUdf_uid381_arcsinL_uid78_fpArccosXTest_cin(0);
            expUdf_uid381_arcsinL_uid78_fpArccosXTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid381_arcsinL_uid78_fpArccosXTest_a) - SIGNED(expUdf_uid381_arcsinL_uid78_fpArccosXTest_b));
    expUdf_uid381_arcsinL_uid78_fpArccosXTest_n(0) <= not expUdf_uid381_arcsinL_uid78_fpArccosXTest_o(14);


	--excZC3_uid387_arcsinL_uid78_fpArccosXTest(LOGICAL,386)@37
    excZC3_uid387_arcsinL_uid78_fpArccosXTest_a <= ld_exc_R_uid335_arcsinL_uid78_fpArccosXTest_q_to_excZC3_uid387_arcsinL_uid78_fpArccosXTest_a_q;
    excZC3_uid387_arcsinL_uid78_fpArccosXTest_b <= ld_exc_R_uid351_arcsinL_uid78_fpArccosXTest_q_to_excZC3_uid387_arcsinL_uid78_fpArccosXTest_b_q;
    excZC3_uid387_arcsinL_uid78_fpArccosXTest_c <= expUdf_uid381_arcsinL_uid78_fpArccosXTest_n;
    excZC3_uid387_arcsinL_uid78_fpArccosXTest_q <= excZC3_uid387_arcsinL_uid78_fpArccosXTest_a and excZC3_uid387_arcsinL_uid78_fpArccosXTest_b and excZC3_uid387_arcsinL_uid78_fpArccosXTest_c;

	--excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest(LOGICAL,385)@32
    excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_a <= reg_expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_2_q;
    excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_b <= reg_exc_R_uid335_arcsinL_uid78_fpArccosXTest_0_to_excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_2_q;
    excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_q <= excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_a and excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_b;

	--ld_excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_c(DELAY,973)@32
    ld_excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_q, xout => ld_excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest(LOGICAL,384)@32
    excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_a <= ld_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q_to_excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_a_q;
    excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_b <= exc_R_uid351_arcsinL_uid78_fpArccosXTest_q;
    excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_q <= excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_a and excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_b;

	--ld_excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_b(DELAY,972)@32
    ld_excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_q, xout => ld_excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_1(REG,548)@19
    reg_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_1_q <= expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_1_q_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_a(DELAY,962)@20
    ld_reg_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_1_q_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => reg_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_1_q, xout => ld_reg_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_1_q_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest(LOGICAL,383)@32
    excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_a <= ld_reg_expXIsZero_uid324_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_1_q_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_a_q;
    excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_b <= reg_expXIsZero_uid340_arcsinL_uid78_fpArccosXTest_0_to_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_2_q;
    excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_q <= excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_a and excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_b;

	--ld_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_a(DELAY,971)@32
    ld_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_q, xout => ld_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRZero_uid388_arcsinL_uid78_fpArccosXTest(LOGICAL,387)@37
    excRZero_uid388_arcsinL_uid78_fpArccosXTest_a <= ld_excXZAndExcYZ_uid384_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_a_q;
    excRZero_uid388_arcsinL_uid78_fpArccosXTest_b <= ld_excXZAndExcYR_uid385_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_b_q;
    excRZero_uid388_arcsinL_uid78_fpArccosXTest_c <= ld_excYZAndExcXR_uid386_arcsinL_uid78_fpArccosXTest_q_to_excRZero_uid388_arcsinL_uid78_fpArccosXTest_c_q;
    excRZero_uid388_arcsinL_uid78_fpArccosXTest_d <= excZC3_uid387_arcsinL_uid78_fpArccosXTest_q;
    excRZero_uid388_arcsinL_uid78_fpArccosXTest_q <= excRZero_uid388_arcsinL_uid78_fpArccosXTest_a or excRZero_uid388_arcsinL_uid78_fpArccosXTest_b or excRZero_uid388_arcsinL_uid78_fpArccosXTest_c or excRZero_uid388_arcsinL_uid78_fpArccosXTest_d;

	--concExc_uid398_arcsinL_uid78_fpArccosXTest(BITJOIN,397)@37
    concExc_uid398_arcsinL_uid78_fpArccosXTest_q <= ld_excRNaN_uid397_arcsinL_uid78_fpArccosXTest_q_to_concExc_uid398_arcsinL_uid78_fpArccosXTest_c_q & excRInf_uid393_arcsinL_uid78_fpArccosXTest_q & excRZero_uid388_arcsinL_uid78_fpArccosXTest_q;

	--reg_concExc_uid398_arcsinL_uid78_fpArccosXTest_0_to_excREnc_uid399_arcsinL_uid78_fpArccosXTest_0(REG,566)@37
    reg_concExc_uid398_arcsinL_uid78_fpArccosXTest_0_to_excREnc_uid399_arcsinL_uid78_fpArccosXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid398_arcsinL_uid78_fpArccosXTest_0_to_excREnc_uid399_arcsinL_uid78_fpArccosXTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid398_arcsinL_uid78_fpArccosXTest_0_to_excREnc_uid399_arcsinL_uid78_fpArccosXTest_0_q <= concExc_uid398_arcsinL_uid78_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excREnc_uid399_arcsinL_uid78_fpArccosXTest(LOOKUP,398)@38
    excREnc_uid399_arcsinL_uid78_fpArccosXTest: PROCESS (reg_concExc_uid398_arcsinL_uid78_fpArccosXTest_0_to_excREnc_uid399_arcsinL_uid78_fpArccosXTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_concExc_uid398_arcsinL_uid78_fpArccosXTest_0_to_excREnc_uid399_arcsinL_uid78_fpArccosXTest_0_q) IS
                WHEN "000" =>  excREnc_uid399_arcsinL_uid78_fpArccosXTest_q <= "01";
                WHEN "001" =>  excREnc_uid399_arcsinL_uid78_fpArccosXTest_q <= "00";
                WHEN "010" =>  excREnc_uid399_arcsinL_uid78_fpArccosXTest_q <= "10";
                WHEN "011" =>  excREnc_uid399_arcsinL_uid78_fpArccosXTest_q <= "00";
                WHEN "100" =>  excREnc_uid399_arcsinL_uid78_fpArccosXTest_q <= "11";
                WHEN "101" =>  excREnc_uid399_arcsinL_uid78_fpArccosXTest_q <= "00";
                WHEN "110" =>  excREnc_uid399_arcsinL_uid78_fpArccosXTest_q <= "00";
                WHEN "111" =>  excREnc_uid399_arcsinL_uid78_fpArccosXTest_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid399_arcsinL_uid78_fpArccosXTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid408_arcsinL_uid78_fpArccosXTest(MUX,407)@38
    expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_s <= excREnc_uid399_arcsinL_uid78_fpArccosXTest_q;
    expRPostExc_uid408_arcsinL_uid78_fpArccosXTest: PROCESS (expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_s, en, cstAllZWE_uid12_fpArccosXTest_q, ld_reg_expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_0_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_3_q_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_d_q, cstAllOWE_uid9_fpArccosXTest_q, cstAllOWE_uid9_fpArccosXTest_q)
    BEGIN
            CASE expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_s IS
                  WHEN "00" => expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_q <= cstAllZWE_uid12_fpArccosXTest_q;
                  WHEN "01" => expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_q <= ld_reg_expRPreExc_uid379_arcsinL_uid78_fpArccosXTest_0_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_3_q_to_expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_d_q;
                  WHEN "10" => expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_q <= cstAllOWE_uid9_fpArccosXTest_q;
                  WHEN "11" => expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_q <= cstAllOWE_uid9_fpArccosXTest_q;
                  WHEN OTHERS => expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest(BITSELECT,376)@36
    fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_in <= expFracRPostRounding_uid376_arcsinL_uid78_fpArccosXTest_q(23 downto 0);
    fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_b <= fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_in(23 downto 1);

	--reg_fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_0_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_3(REG,567)@36
    reg_fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_0_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_0_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_3_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_0_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_3_q <= fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_0_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_3_q_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_d(DELAY,1002)@37
    ld_reg_fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_0_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_3_q_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_d : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => reg_fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_0_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_3_q, xout => ld_reg_fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_0_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_3_q_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest(MUX,402)@38
    fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_s <= excREnc_uid399_arcsinL_uid78_fpArccosXTest_q;
    fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest: PROCESS (fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_s, en, cstAllZWF_uid10_fpArccosXTest_q, ld_reg_fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_0_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_3_q_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_d_q, cstAllZWF_uid10_fpArccosXTest_q, cstNaNWF_uid11_fpArccosXTest_q)
    BEGIN
            CASE fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_s IS
                  WHEN "00" => fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_q <= cstAllZWF_uid10_fpArccosXTest_q;
                  WHEN "01" => fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_q <= ld_reg_fracRPreExc_uid377_arcsinL_uid78_fpArccosXTest_0_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_3_q_to_fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_d_q;
                  WHEN "10" => fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_q <= cstAllZWF_uid10_fpArccosXTest_q;
                  WHEN "11" => fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_q <= cstNaNWF_uid11_fpArccosXTest_q;
                  WHEN OTHERS => fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid411_arcsinL_uid78_fpArccosXTest(BITJOIN,410)@38
    R_uid411_arcsinL_uid78_fpArccosXTest_q <= ld_signRPostExc_uid410_arcsinL_uid78_fpArccosXTest_q_to_R_uid411_arcsinL_uid78_fpArccosXTest_c_q & expRPostExc_uid408_arcsinL_uid78_fpArccosXTest_q & fracRPostExc_uid403_arcsinL_uid78_fpArccosXTest_q;

	--ArcsinL22dto0_uid79_fpArccosXTest(BITSELECT,78)@38
    ArcsinL22dto0_uid79_fpArccosXTest_in <= R_uid411_arcsinL_uid78_fpArccosXTest_q(22 downto 0);
    ArcsinL22dto0_uid79_fpArccosXTest_b <= ArcsinL22dto0_uid79_fpArccosXTest_in(22 downto 0);

	--oFracArcsinL_uid80_fpArccosXTest(BITJOIN,79)@38
    oFracArcsinL_uid80_fpArccosXTest_q <= VCC_q & ArcsinL22dto0_uid79_fpArccosXTest_b;

	--X23dto16_uid417_alignArcsinL_uid84_fpArccosXTest(BITSELECT,416)@38
    X23dto16_uid417_alignArcsinL_uid84_fpArccosXTest_in <= oFracArcsinL_uid80_fpArccosXTest_q;
    X23dto16_uid417_alignArcsinL_uid84_fpArccosXTest_b <= X23dto16_uid417_alignArcsinL_uid84_fpArccosXTest_in(23 downto 16);

	--rightShiftStage0Idx2_uid419_alignArcsinL_uid84_fpArccosXTest(BITJOIN,418)@38
    rightShiftStage0Idx2_uid419_alignArcsinL_uid84_fpArccosXTest_q <= rightShiftStage0Idx1Pad16_uid136_fxpX_uid50_fpArccosXTest_q & X23dto16_uid417_alignArcsinL_uid84_fpArccosXTest_b;

	--reg_rightShiftStage0Idx2_uid419_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_4(REG,573)@38
    reg_rightShiftStage0Idx2_uid419_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx2_uid419_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_4_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx2_uid419_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_4_q <= rightShiftStage0Idx2_uid419_alignArcsinL_uid84_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--X23dto8_uid414_alignArcsinL_uid84_fpArccosXTest(BITSELECT,413)@38
    X23dto8_uid414_alignArcsinL_uid84_fpArccosXTest_in <= oFracArcsinL_uid80_fpArccosXTest_q;
    X23dto8_uid414_alignArcsinL_uid84_fpArccosXTest_b <= X23dto8_uid414_alignArcsinL_uid84_fpArccosXTest_in(23 downto 8);

	--rightShiftStage0Idx1_uid416_alignArcsinL_uid84_fpArccosXTest(BITJOIN,415)@38
    rightShiftStage0Idx1_uid416_alignArcsinL_uid84_fpArccosXTest_q <= cstAllZWE_uid12_fpArccosXTest_q & X23dto8_uid414_alignArcsinL_uid84_fpArccosXTest_b;

	--reg_rightShiftStage0Idx1_uid416_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_3(REG,572)@38
    reg_rightShiftStage0Idx1_uid416_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx1_uid416_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_3_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx1_uid416_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_3_q <= rightShiftStage0Idx1_uid416_alignArcsinL_uid84_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_oFracArcsinL_uid80_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_2(REG,571)@38
    reg_oFracArcsinL_uid80_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracArcsinL_uid80_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_2_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracArcsinL_uid80_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_2_q <= oFracArcsinL_uid80_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ArcsinL30dto23_uid81_fpArccosXTest(BITSELECT,80)@38
    ArcsinL30dto23_uid81_fpArccosXTest_in <= R_uid411_arcsinL_uid78_fpArccosXTest_q(30 downto 0);
    ArcsinL30dto23_uid81_fpArccosXTest_b <= ArcsinL30dto23_uid81_fpArccosXTest_in(30 downto 23);

	--srValArcsinL_uid82_fpArccosXTest(SUB,81)@38
    srValArcsinL_uid82_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & cstBias_uid13_fpArccosXTest_q);
    srValArcsinL_uid82_fpArccosXTest_b <= STD_LOGIC_VECTOR("0" & ArcsinL30dto23_uid81_fpArccosXTest_b);
            srValArcsinL_uid82_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(srValArcsinL_uid82_fpArccosXTest_a) - UNSIGNED(srValArcsinL_uid82_fpArccosXTest_b));
    srValArcsinL_uid82_fpArccosXTest_q <= srValArcsinL_uid82_fpArccosXTest_o(8 downto 0);


	--srValArcsinLRange_uid83_fpArccosXTest(BITSELECT,82)@38
    srValArcsinLRange_uid83_fpArccosXTest_in <= srValArcsinL_uid82_fpArccosXTest_q(4 downto 0);
    srValArcsinLRange_uid83_fpArccosXTest_b <= srValArcsinLRange_uid83_fpArccosXTest_in(4 downto 0);

	--rightShiftStageSel4Dto3_uid421_alignArcsinL_uid84_fpArccosXTest(BITSELECT,420)@38
    rightShiftStageSel4Dto3_uid421_alignArcsinL_uid84_fpArccosXTest_in <= srValArcsinLRange_uid83_fpArccosXTest_b;
    rightShiftStageSel4Dto3_uid421_alignArcsinL_uid84_fpArccosXTest_b <= rightShiftStageSel4Dto3_uid421_alignArcsinL_uid84_fpArccosXTest_in(4 downto 3);

	--reg_rightShiftStageSel4Dto3_uid421_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_1(REG,570)@38
    reg_rightShiftStageSel4Dto3_uid421_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel4Dto3_uid421_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel4Dto3_uid421_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_1_q <= rightShiftStageSel4Dto3_uid421_alignArcsinL_uid84_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest(MUX,421)@39
    rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_s <= reg_rightShiftStageSel4Dto3_uid421_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_1_q;
    rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest: PROCESS (rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_s, en, reg_oFracArcsinL_uid80_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_2_q, reg_rightShiftStage0Idx1_uid416_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_3_q, reg_rightShiftStage0Idx2_uid419_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_4_q, rightShiftStage0Idx3_uid276_alignSqrt_uid69_fpArccosXTest_q)
    BEGIN
            CASE rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_s IS
                  WHEN "00" => rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_q <= reg_oFracArcsinL_uid80_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_2_q;
                  WHEN "01" => rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_q <= reg_rightShiftStage0Idx1_uid416_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_3_q;
                  WHEN "10" => rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_q <= reg_rightShiftStage0Idx2_uid419_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_4_q;
                  WHEN "11" => rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_q <= rightShiftStage0Idx3_uid276_alignSqrt_uid69_fpArccosXTest_q;
                  WHEN OTHERS => rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid432_alignArcsinL_uid84_fpArccosXTest(BITSELECT,431)@38
    rightShiftStageSel2Dto1_uid432_alignArcsinL_uid84_fpArccosXTest_in <= srValArcsinLRange_uid83_fpArccosXTest_b(2 downto 0);
    rightShiftStageSel2Dto1_uid432_alignArcsinL_uid84_fpArccosXTest_b <= rightShiftStageSel2Dto1_uid432_alignArcsinL_uid84_fpArccosXTest_in(2 downto 1);

	--reg_rightShiftStageSel2Dto1_uid432_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_1(REG,574)@38
    reg_rightShiftStageSel2Dto1_uid432_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid432_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid432_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_1_q <= rightShiftStageSel2Dto1_uid432_alignArcsinL_uid84_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest(MUX,432)@39
    rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_s <= reg_rightShiftStageSel2Dto1_uid432_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_1_q;
    rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest: PROCESS (rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_s, en, rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_q, rightShiftStage1Idx1_uid425_alignArcsinL_uid84_fpArccosXTest_q, rightShiftStage1Idx2_uid428_alignArcsinL_uid84_fpArccosXTest_q, rightShiftStage1Idx3_uid431_alignArcsinL_uid84_fpArccosXTest_q)
    BEGIN
            CASE rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_s IS
                  WHEN "00" => rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_q <= rightShiftStage0_uid422_alignArcsinL_uid84_fpArccosXTest_q;
                  WHEN "01" => rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_q <= rightShiftStage1Idx1_uid425_alignArcsinL_uid84_fpArccosXTest_q;
                  WHEN "10" => rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_q <= rightShiftStage1Idx2_uid428_alignArcsinL_uid84_fpArccosXTest_q;
                  WHEN "11" => rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_q <= rightShiftStage1Idx3_uid431_alignArcsinL_uid84_fpArccosXTest_q;
                  WHEN OTHERS => rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid437_alignArcsinL_uid84_fpArccosXTest(BITSELECT,436)@38
    rightShiftStageSel0Dto0_uid437_alignArcsinL_uid84_fpArccosXTest_in <= srValArcsinLRange_uid83_fpArccosXTest_b(0 downto 0);
    rightShiftStageSel0Dto0_uid437_alignArcsinL_uid84_fpArccosXTest_b <= rightShiftStageSel0Dto0_uid437_alignArcsinL_uid84_fpArccosXTest_in(0 downto 0);

	--reg_rightShiftStageSel0Dto0_uid437_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_1(REG,575)@38
    reg_rightShiftStageSel0Dto0_uid437_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid437_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid437_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_1_q <= rightShiftStageSel0Dto0_uid437_alignArcsinL_uid84_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest(MUX,437)@39
    rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_s <= reg_rightShiftStageSel0Dto0_uid437_alignArcsinL_uid84_fpArccosXTest_0_to_rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_1_q;
    rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest: PROCESS (rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_s, en, rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_q, rightShiftStage2Idx1_uid436_alignArcsinL_uid84_fpArccosXTest_q)
    BEGIN
            CASE rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_s IS
                  WHEN "0" => rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_q <= rightShiftStage1_uid433_alignArcsinL_uid84_fpArccosXTest_q;
                  WHEN "1" => rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_q <= rightShiftStage2Idx1_uid436_alignArcsinL_uid84_fpArccosXTest_q;
                  WHEN OTHERS => rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--pad_fxpArcsinL_uid85_uid86_fpArccosXTest(BITJOIN,85)@39
    pad_fxpArcsinL_uid85_uid86_fpArccosXTest_q <= rightShiftStage2_uid438_alignArcsinL_uid84_fpArccosXTest_q & STD_LOGIC_VECTOR((2 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_fxpArcsinL_uid85_uid86_fpArccosXTest_0_to_path1NegCase_uid86_fpArccosXTest_1(REG,576)@39
    reg_pad_fxpArcsinL_uid85_uid86_fpArccosXTest_0_to_path1NegCase_uid86_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_fxpArcsinL_uid85_uid86_fpArccosXTest_0_to_path1NegCase_uid86_fpArccosXTest_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_fxpArcsinL_uid85_uid86_fpArccosXTest_0_to_path1NegCase_uid86_fpArccosXTest_1_q <= pad_fxpArcsinL_uid85_uid86_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--pi_uid85_fpArccosXTest(CONSTANT,84)
    pi_uid85_fpArccosXTest_q <= "1100100100001111110110101010";

	--path1NegCase_uid86_fpArccosXTest(SUB,86)@40
    path1NegCase_uid86_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & pi_uid85_fpArccosXTest_q);
    path1NegCase_uid86_fpArccosXTest_b <= STD_LOGIC_VECTOR("00" & reg_pad_fxpArcsinL_uid85_uid86_fpArccosXTest_0_to_path1NegCase_uid86_fpArccosXTest_1_q);
            path1NegCase_uid86_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path1NegCase_uid86_fpArccosXTest_a) - UNSIGNED(path1NegCase_uid86_fpArccosXTest_b));
    path1NegCase_uid86_fpArccosXTest_q <= path1NegCase_uid86_fpArccosXTest_o(28 downto 0);


	--path1NegCaseN_uid88_fpArccosXTest(BITSELECT,87)@40
    path1NegCaseN_uid88_fpArccosXTest_in <= path1NegCase_uid86_fpArccosXTest_q(27 downto 0);
    path1NegCaseN_uid88_fpArccosXTest_b <= path1NegCaseN_uid88_fpArccosXTest_in(27 downto 27);

	--reg_path1NegCaseN_uid88_fpArccosXTest_0_to_path1NegCaseExp_uid92_fpArccosXTest_1(REG,577)@40
    reg_path1NegCaseN_uid88_fpArccosXTest_0_to_path1NegCaseExp_uid92_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_path1NegCaseN_uid88_fpArccosXTest_0_to_path1NegCaseExp_uid92_fpArccosXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_path1NegCaseN_uid88_fpArccosXTest_0_to_path1NegCaseExp_uid92_fpArccosXTest_1_q <= path1NegCaseN_uid88_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--path1NegCaseExp_uid92_fpArccosXTest(ADD,91)@41
    path1NegCaseExp_uid92_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & cstBias_uid13_fpArccosXTest_q);
    path1NegCaseExp_uid92_fpArccosXTest_b <= STD_LOGIC_VECTOR("00000000" & reg_path1NegCaseN_uid88_fpArccosXTest_0_to_path1NegCaseExp_uid92_fpArccosXTest_1_q);
            path1NegCaseExp_uid92_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path1NegCaseExp_uid92_fpArccosXTest_a) + UNSIGNED(path1NegCaseExp_uid92_fpArccosXTest_b));
    path1NegCaseExp_uid92_fpArccosXTest_q <= path1NegCaseExp_uid92_fpArccosXTest_o(8 downto 0);


	--path1NegCaseExpRange_uid93_fpArccosXTest(BITSELECT,92)@41
    path1NegCaseExpRange_uid93_fpArccosXTest_in <= path1NegCaseExp_uid92_fpArccosXTest_q(7 downto 0);
    path1NegCaseExpRange_uid93_fpArccosXTest_b <= path1NegCaseExpRange_uid93_fpArccosXTest_in(7 downto 0);

	--path1NegCaseFracHigh_uid89_fpArccosXTest(BITSELECT,88)@40
    path1NegCaseFracHigh_uid89_fpArccosXTest_in <= path1NegCase_uid86_fpArccosXTest_q(26 downto 0);
    path1NegCaseFracHigh_uid89_fpArccosXTest_b <= path1NegCaseFracHigh_uid89_fpArccosXTest_in(26 downto 4);

	--path1NegCaseFracLow_uid90_fpArccosXTest(BITSELECT,89)@40
    path1NegCaseFracLow_uid90_fpArccosXTest_in <= path1NegCase_uid86_fpArccosXTest_q(25 downto 0);
    path1NegCaseFracLow_uid90_fpArccosXTest_b <= path1NegCaseFracLow_uid90_fpArccosXTest_in(25 downto 3);

	--path1NegCaseFrac_uid91_fpArccosXTest(MUX,90)@40
    path1NegCaseFrac_uid91_fpArccosXTest_s <= path1NegCaseN_uid88_fpArccosXTest_b;
    path1NegCaseFrac_uid91_fpArccosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            path1NegCaseFrac_uid91_fpArccosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE path1NegCaseFrac_uid91_fpArccosXTest_s IS
                      WHEN "0" => path1NegCaseFrac_uid91_fpArccosXTest_q <= path1NegCaseFracLow_uid90_fpArccosXTest_b;
                      WHEN "1" => path1NegCaseFrac_uid91_fpArccosXTest_q <= path1NegCaseFracHigh_uid89_fpArccosXTest_b;
                      WHEN OTHERS => path1NegCaseFrac_uid91_fpArccosXTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--path1NegCaseUR_uid94_fpArccosXTest(BITJOIN,93)@41
    path1NegCaseUR_uid94_fpArccosXTest_q <= GND_q & path1NegCaseExpRange_uid93_fpArccosXTest_b & path1NegCaseFrac_uid91_fpArccosXTest_q;

	--ld_R_uid411_arcsinL_uid78_fpArccosXTest_q_to_path1ResFP_uid96_fpArccosXTest_c_inputreg(DELAY,1198)
    ld_R_uid411_arcsinL_uid78_fpArccosXTest_q_to_path1ResFP_uid96_fpArccosXTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => R_uid411_arcsinL_uid78_fpArccosXTest_q, xout => ld_R_uid411_arcsinL_uid78_fpArccosXTest_q_to_path1ResFP_uid96_fpArccosXTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_R_uid411_arcsinL_uid78_fpArccosXTest_q_to_path1ResFP_uid96_fpArccosXTest_c(DELAY,664)@38
    ld_R_uid411_arcsinL_uid78_fpArccosXTest_q_to_path1ResFP_uid96_fpArccosXTest_c : dspba_delay
    GENERIC MAP ( width => 32, depth => 2 )
    PORT MAP ( xin => ld_R_uid411_arcsinL_uid78_fpArccosXTest_q_to_path1ResFP_uid96_fpArccosXTest_c_inputreg_q, xout => ld_R_uid411_arcsinL_uid78_fpArccosXTest_q_to_path1ResFP_uid96_fpArccosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_nor(LOGICAL,1195)
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_nor_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q;
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_nor_b <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_sticky_ena_q;
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_nor_q <= not (ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_nor_a or ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_nor_b);

	--ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_mem_top(CONSTANT,1191)
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_mem_top_q <= "0100111";

	--ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmp(LOGICAL,1192)
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmp_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_mem_top_q;
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdmux_q);
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmp_q <= "1" when ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmp_a = ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmp_b else "0";

	--ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmpReg(REG,1193)
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmpReg_q <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_sticky_ena(REG,1196)
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_nor_q = "1") THEN
                ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_sticky_ena_q <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_enaAnd(LOGICAL,1197)
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_enaAnd_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_sticky_ena_q;
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_enaAnd_b <= en;
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_enaAnd_q <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_enaAnd_a and ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_enaAnd_b;

	--ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt(COUNTER,1187)
    -- every=1, low=0, high=39, step=1, init=1
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_i = 38 THEN
                      ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_eq = '1') THEN
                        ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_i <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_i - 39;
                    ELSE
                        ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_i <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_i,6));


	--ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdreg(REG,1188)
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdreg_q <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdmux(MUX,1189)
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdmux_s <= en;
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdmux: PROCESS (ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdmux_s, ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdreg_q, ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdmux_q <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdreg_q;
                  WHEN "1" => ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdmux_q <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem(DUALMEM,1186)
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_reset0 <= areset;
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_ia <= singX_uid8_fpArccosXTest_b;
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_aa <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdreg_q;
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_ab <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_rdmux_q;
    ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_iq,
        address_a => ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_aa,
        data_a => ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_ia
    );
        ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_q <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_iq(0 downto 0);

	--path1ResFP_uid96_fpArccosXTest(MUX,95)@41
    path1ResFP_uid96_fpArccosXTest_s <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_replace_mem_q;
    path1ResFP_uid96_fpArccosXTest: PROCESS (path1ResFP_uid96_fpArccosXTest_s, en, ld_R_uid411_arcsinL_uid78_fpArccosXTest_q_to_path1ResFP_uid96_fpArccosXTest_c_q, path1NegCaseUR_uid94_fpArccosXTest_q)
    BEGIN
            CASE path1ResFP_uid96_fpArccosXTest_s IS
                  WHEN "0" => path1ResFP_uid96_fpArccosXTest_q <= ld_R_uid411_arcsinL_uid78_fpArccosXTest_q_to_path1ResFP_uid96_fpArccosXTest_c_q;
                  WHEN "1" => path1ResFP_uid96_fpArccosXTest_q <= path1NegCaseUR_uid94_fpArccosXTest_q;
                  WHEN OTHERS => path1ResFP_uid96_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--Path1ResFP30dto23_uid124_fpArccosXTest(BITSELECT,123)@41
    Path1ResFP30dto23_uid124_fpArccosXTest_in <= path1ResFP_uid96_fpArccosXTest_q(30 downto 0);
    Path1ResFP30dto23_uid124_fpArccosXTest_b <= Path1ResFP30dto23_uid124_fpArccosXTest_in(30 downto 23);

	--reg_Path1ResFP30dto23_uid124_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_2(REG,589)@41
    reg_Path1ResFP30dto23_uid124_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_Path1ResFP30dto23_uid124_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_Path1ResFP30dto23_uid124_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_2_q <= Path1ResFP30dto23_uid124_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_nor(LOGICAL,1209)
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_nor_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q;
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_nor_b <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_sticky_ena_q;
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_nor_q <= not (ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_nor_a or ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_nor_b);

	--ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_mem_top(CONSTANT,1205)
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_mem_top_q <= "0100101";

	--ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmp(LOGICAL,1206)
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmp_a <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_mem_top_q;
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdmux_q);
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmp_q <= "1" when ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmp_a = ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmp_b else "0";

	--ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmpReg(REG,1207)
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmpReg_q <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_sticky_ena(REG,1210)
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_nor_q = "1") THEN
                ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_sticky_ena_q <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_enaAnd(LOGICAL,1211)
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_enaAnd_a <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_sticky_ena_q;
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_enaAnd_b <= en;
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_enaAnd_q <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_enaAnd_a and ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_enaAnd_b;

	--ld_singX_uid8_fpArccosXTest_b_to_pathSelBits_uid117_fpArccosXTest_c(DELAY,686)@0
    ld_singX_uid8_fpArccosXTest_b_to_pathSelBits_uid117_fpArccosXTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => singX_uid8_fpArccosXTest_b, xout => ld_singX_uid8_fpArccosXTest_b_to_pathSelBits_uid117_fpArccosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--inputIsMax_uid51_fpArccosXTest(BITSELECT,50)@1
    inputIsMax_uid51_fpArccosXTest_in <= rightShiftStage2_uid165_fxpX_uid50_fpArccosXTest_q;
    inputIsMax_uid51_fpArccosXTest_b <= inputIsMax_uid51_fpArccosXTest_in(36 downto 36);

	--firstPath_uid53_fpArccosXTest(BITSELECT,52)@1
    firstPath_uid53_fpArccosXTest_in <= y_uid52_fpArccosXTest_b;
    firstPath_uid53_fpArccosXTest_b <= firstPath_uid53_fpArccosXTest_in(34 downto 34);

	--pathSelBits_uid117_fpArccosXTest(BITJOIN,116)@1
    pathSelBits_uid117_fpArccosXTest_q <= ld_singX_uid8_fpArccosXTest_b_to_pathSelBits_uid117_fpArccosXTest_c_q & inputIsMax_uid51_fpArccosXTest_b & firstPath_uid53_fpArccosXTest_b;

	--ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_inputreg(DELAY,1199)
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => pathSelBits_uid117_fpArccosXTest_q, xout => ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt(COUNTER,1201)
    -- every=1, low=0, high=37, step=1, init=1
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_i = 36 THEN
                      ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_eq = '1') THEN
                        ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_i <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_i - 37;
                    ELSE
                        ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_i <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_i,6));


	--ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdreg(REG,1202)
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdreg_q <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdmux(MUX,1203)
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdmux_s <= en;
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdmux: PROCESS (ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdmux_s, ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdreg_q, ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdmux_q <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdreg_q;
                  WHEN "1" => ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdmux_q <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem(DUALMEM,1200)
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_reset0 <= areset;
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_ia <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_inputreg_q;
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_aa <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdreg_q;
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_ab <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdmux_q;
    ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_iq,
        address_a => ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_aa,
        data_a => ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_ia
    );
        ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_q <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_iq(2 downto 0);

	--fracOutMuxSelEnc_uid118_fpArccosXTest(LOOKUP,117)@41
    fracOutMuxSelEnc_uid118_fpArccosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracOutMuxSelEnc_uid118_fpArccosXTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            CASE (ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_mem_q) IS
                WHEN "000" =>  fracOutMuxSelEnc_uid118_fpArccosXTest_q <= "01";
                WHEN "001" =>  fracOutMuxSelEnc_uid118_fpArccosXTest_q <= "00";
                WHEN "010" =>  fracOutMuxSelEnc_uid118_fpArccosXTest_q <= "11";
                WHEN "011" =>  fracOutMuxSelEnc_uid118_fpArccosXTest_q <= "11";
                WHEN "100" =>  fracOutMuxSelEnc_uid118_fpArccosXTest_q <= "01";
                WHEN "101" =>  fracOutMuxSelEnc_uid118_fpArccosXTest_q <= "00";
                WHEN "110" =>  fracOutMuxSelEnc_uid118_fpArccosXTest_q <= "10";
                WHEN "111" =>  fracOutMuxSelEnc_uid118_fpArccosXTest_q <= "10";
                WHEN OTHERS =>
                    fracOutMuxSelEnc_uid118_fpArccosXTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--expRCalc_uid125_fpArccosXTest(MUX,124)@42
    expRCalc_uid125_fpArccosXTest_s <= fracOutMuxSelEnc_uid118_fpArccosXTest_q;
    expRCalc_uid125_fpArccosXTest: PROCESS (expRCalc_uid125_fpArccosXTest_s, en, reg_Path1ResFP30dto23_uid124_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_2_q, ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_outputreg_q, cstBiasP1_uid17_fpArccosXTest_q, cstAllZWE_uid12_fpArccosXTest_q)
    BEGIN
            CASE expRCalc_uid125_fpArccosXTest_s IS
                  WHEN "00" => expRCalc_uid125_fpArccosXTest_q <= reg_Path1ResFP30dto23_uid124_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_2_q;
                  WHEN "01" => expRCalc_uid125_fpArccosXTest_q <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_outputreg_q;
                  WHEN "10" => expRCalc_uid125_fpArccosXTest_q <= cstBiasP1_uid17_fpArccosXTest_q;
                  WHEN "11" => expRCalc_uid125_fpArccosXTest_q <= cstAllZWE_uid12_fpArccosXTest_q;
                  WHEN OTHERS => expRCalc_uid125_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--cstAllZWE_uid12_fpArccosXTest(CONSTANT,11)
    cstAllZWE_uid12_fpArccosXTest_q <= "00000000";

	--ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_nor(LOGICAL,1235)
    ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_nor_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q;
    ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_nor_b <= ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_sticky_ena_q;
    ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_nor_q <= not (ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_nor_a or ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_nor_b);

	--ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_sticky_ena(REG,1236)
    ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_nor_q = "1") THEN
                ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_sticky_ena_q <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_enaAnd(LOGICAL,1237)
    ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_enaAnd_a <= ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_sticky_ena_q;
    ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_enaAnd_b <= en;
    ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_enaAnd_q <= ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_enaAnd_a and ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_enaAnd_b;

	--fracXIsZero_uid38_fpArccosXTest(LOGICAL,37)@0
    fracXIsZero_uid38_fpArccosXTest_a <= fracX_uid7_fpArccosXTest_b;
    fracXIsZero_uid38_fpArccosXTest_b <= STD_LOGIC_VECTOR("0000000000000000000000" & GND_q);
    fracXIsZero_uid38_fpArccosXTest_q <= "1" when fracXIsZero_uid38_fpArccosXTest_a = fracXIsZero_uid38_fpArccosXTest_b else "0";

	--InvFracXIsZero_uid39_fpArccosXTest(LOGICAL,38)@0
    InvFracXIsZero_uid39_fpArccosXTest_a <= fracXIsZero_uid38_fpArccosXTest_q;
    InvFracXIsZero_uid39_fpArccosXTest_q <= not InvFracXIsZero_uid39_fpArccosXTest_a;

	--expEQ0_uid37_fpArccosXTest(LOGICAL,36)@0
    expEQ0_uid37_fpArccosXTest_a <= expX_uid6_fpArccosXTest_b;
    expEQ0_uid37_fpArccosXTest_b <= cstBias_uid13_fpArccosXTest_q;
    expEQ0_uid37_fpArccosXTest_q <= "1" when expEQ0_uid37_fpArccosXTest_a = expEQ0_uid37_fpArccosXTest_b else "0";

	--expXZFracNotZero_uid40_fpArccosXTest(LOGICAL,39)@0
    expXZFracNotZero_uid40_fpArccosXTest_a <= expEQ0_uid37_fpArccosXTest_q;
    expXZFracNotZero_uid40_fpArccosXTest_b <= InvFracXIsZero_uid39_fpArccosXTest_q;
    expXZFracNotZero_uid40_fpArccosXTest_q <= expXZFracNotZero_uid40_fpArccosXTest_a and expXZFracNotZero_uid40_fpArccosXTest_b;

	--expGT0_uid36_fpArccosXTest(COMPARE,35)@0
    expGT0_uid36_fpArccosXTest_cin <= GND_q;
    expGT0_uid36_fpArccosXTest_a <= STD_LOGIC_VECTOR("00" & cstBias_uid13_fpArccosXTest_q) & '0';
    expGT0_uid36_fpArccosXTest_b <= STD_LOGIC_VECTOR("00" & expX_uid6_fpArccosXTest_b) & expGT0_uid36_fpArccosXTest_cin(0);
            expGT0_uid36_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expGT0_uid36_fpArccosXTest_a) - UNSIGNED(expGT0_uid36_fpArccosXTest_b));
    expGT0_uid36_fpArccosXTest_c(0) <= expGT0_uid36_fpArccosXTest_o(10);


	--inputOutOfRange_uid41_fpArccosXTest(LOGICAL,40)@0
    inputOutOfRange_uid41_fpArccosXTest_a <= expGT0_uid36_fpArccosXTest_c;
    inputOutOfRange_uid41_fpArccosXTest_b <= expXZFracNotZero_uid40_fpArccosXTest_q;
    inputOutOfRange_uid41_fpArccosXTest_q <= inputOutOfRange_uid41_fpArccosXTest_a or inputOutOfRange_uid41_fpArccosXTest_b;

	--InvExc_N_uid32_fpArccosXTest(LOGICAL,31)@0
    InvExc_N_uid32_fpArccosXTest_a <= exc_N_uid31_fpArccosXTest_q;
    InvExc_N_uid32_fpArccosXTest_q <= not InvExc_N_uid32_fpArccosXTest_a;

	--InvExc_I_uid33_fpArccosXTest(LOGICAL,32)@0
    InvExc_I_uid33_fpArccosXTest_a <= exc_I_uid29_fpArccosXTest_q;
    InvExc_I_uid33_fpArccosXTest_q <= not InvExc_I_uid33_fpArccosXTest_a;

	--expXIsZero_uid24_fpArccosXTest(LOGICAL,23)@0
    expXIsZero_uid24_fpArccosXTest_a <= expX_uid6_fpArccosXTest_b;
    expXIsZero_uid24_fpArccosXTest_b <= cstAllZWE_uid12_fpArccosXTest_q;
    expXIsZero_uid24_fpArccosXTest_q <= "1" when expXIsZero_uid24_fpArccosXTest_a = expXIsZero_uid24_fpArccosXTest_b else "0";

	--InvExpXIsZero_uid34_fpArccosXTest(LOGICAL,33)@0
    InvExpXIsZero_uid34_fpArccosXTest_a <= expXIsZero_uid24_fpArccosXTest_q;
    InvExpXIsZero_uid34_fpArccosXTest_q <= not InvExpXIsZero_uid34_fpArccosXTest_a;

	--exc_R_uid35_fpArccosXTest(LOGICAL,34)@0
    exc_R_uid35_fpArccosXTest_a <= InvExpXIsZero_uid34_fpArccosXTest_q;
    exc_R_uid35_fpArccosXTest_b <= InvExc_I_uid33_fpArccosXTest_q;
    exc_R_uid35_fpArccosXTest_c <= InvExc_N_uid32_fpArccosXTest_q;
    exc_R_uid35_fpArccosXTest_q <= exc_R_uid35_fpArccosXTest_a and exc_R_uid35_fpArccosXTest_b and exc_R_uid35_fpArccosXTest_c;

	--xRegAndOutOfRange_uid126_fpArccosXTest(LOGICAL,125)@0
    xRegAndOutOfRange_uid126_fpArccosXTest_a <= exc_R_uid35_fpArccosXTest_q;
    xRegAndOutOfRange_uid126_fpArccosXTest_b <= inputOutOfRange_uid41_fpArccosXTest_q;
    xRegAndOutOfRange_uid126_fpArccosXTest_q <= xRegAndOutOfRange_uid126_fpArccosXTest_a and xRegAndOutOfRange_uid126_fpArccosXTest_b;

	--fracXIsZero_uid28_fpArccosXTest(LOGICAL,27)@0
    fracXIsZero_uid28_fpArccosXTest_a <= fracX_uid7_fpArccosXTest_b;
    fracXIsZero_uid28_fpArccosXTest_b <= cstAllZWF_uid10_fpArccosXTest_q;
    fracXIsZero_uid28_fpArccosXTest_q <= "1" when fracXIsZero_uid28_fpArccosXTest_a = fracXIsZero_uid28_fpArccosXTest_b else "0";

	--expXIsMax_uid26_fpArccosXTest(LOGICAL,25)@0
    expXIsMax_uid26_fpArccosXTest_a <= expX_uid6_fpArccosXTest_b;
    expXIsMax_uid26_fpArccosXTest_b <= cstAllOWE_uid9_fpArccosXTest_q;
    expXIsMax_uid26_fpArccosXTest_q <= "1" when expXIsMax_uid26_fpArccosXTest_a = expXIsMax_uid26_fpArccosXTest_b else "0";

	--exc_I_uid29_fpArccosXTest(LOGICAL,28)@0
    exc_I_uid29_fpArccosXTest_a <= expXIsMax_uid26_fpArccosXTest_q;
    exc_I_uid29_fpArccosXTest_b <= fracXIsZero_uid28_fpArccosXTest_q;
    exc_I_uid29_fpArccosXTest_q <= exc_I_uid29_fpArccosXTest_a and exc_I_uid29_fpArccosXTest_b;

	--InvFracXIsZero_uid30_fpArccosXTest(LOGICAL,29)@0
    InvFracXIsZero_uid30_fpArccosXTest_a <= fracXIsZero_uid28_fpArccosXTest_q;
    InvFracXIsZero_uid30_fpArccosXTest_q <= not InvFracXIsZero_uid30_fpArccosXTest_a;

	--exc_N_uid31_fpArccosXTest(LOGICAL,30)@0
    exc_N_uid31_fpArccosXTest_a <= expXIsMax_uid26_fpArccosXTest_q;
    exc_N_uid31_fpArccosXTest_b <= InvFracXIsZero_uid30_fpArccosXTest_q;
    exc_N_uid31_fpArccosXTest_q <= exc_N_uid31_fpArccosXTest_a and exc_N_uid31_fpArccosXTest_b;

	--excRNaN_uid127_fpArccosXTest(LOGICAL,126)@0
    excRNaN_uid127_fpArccosXTest_a <= exc_N_uid31_fpArccosXTest_q;
    excRNaN_uid127_fpArccosXTest_b <= exc_I_uid29_fpArccosXTest_q;
    excRNaN_uid127_fpArccosXTest_c <= xRegAndOutOfRange_uid126_fpArccosXTest_q;
    excRNaN_uid127_fpArccosXTest_q <= excRNaN_uid127_fpArccosXTest_a or excRNaN_uid127_fpArccosXTest_b or excRNaN_uid127_fpArccosXTest_c;

	--ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_inputreg(DELAY,1225)
    ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => excRNaN_uid127_fpArccosXTest_q, xout => ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem(DUALMEM,1226)
    ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_reset0 <= areset;
    ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_ia <= ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_inputreg_q;
    ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_aa <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdreg_q;
    ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_ab <= ld_pathSelBits_uid117_fpArccosXTest_q_to_fracOutMuxSelEnc_uid118_fpArccosXTest_a_replace_rdmux_q;
    ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_dmem : altsyncram
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
        clocken1 => ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_iq,
        address_a => ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_aa,
        data_a => ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_ia
    );
        ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_q <= ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_iq(0 downto 0);

	--excSelBits_uid128_fpArccosXTest(BITJOIN,127)@40
    excSelBits_uid128_fpArccosXTest_q <= ld_excRNaN_uid127_fpArccosXTest_q_to_excSelBits_uid128_fpArccosXTest_c_replace_mem_q & GND_q & GND_q;

	--reg_excSelBits_uid128_fpArccosXTest_0_to_outMuxSelEnc_uid129_fpArccosXTest_0(REG,498)@40
    reg_excSelBits_uid128_fpArccosXTest_0_to_outMuxSelEnc_uid129_fpArccosXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excSelBits_uid128_fpArccosXTest_0_to_outMuxSelEnc_uid129_fpArccosXTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excSelBits_uid128_fpArccosXTest_0_to_outMuxSelEnc_uid129_fpArccosXTest_0_q <= excSelBits_uid128_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--outMuxSelEnc_uid129_fpArccosXTest(LOOKUP,128)@41
    outMuxSelEnc_uid129_fpArccosXTest: PROCESS (reg_excSelBits_uid128_fpArccosXTest_0_to_outMuxSelEnc_uid129_fpArccosXTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_excSelBits_uid128_fpArccosXTest_0_to_outMuxSelEnc_uid129_fpArccosXTest_0_q) IS
                WHEN "000" =>  outMuxSelEnc_uid129_fpArccosXTest_q <= "01";
                WHEN "001" =>  outMuxSelEnc_uid129_fpArccosXTest_q <= "00";
                WHEN "010" =>  outMuxSelEnc_uid129_fpArccosXTest_q <= "10";
                WHEN "011" =>  outMuxSelEnc_uid129_fpArccosXTest_q <= "01";
                WHEN "100" =>  outMuxSelEnc_uid129_fpArccosXTest_q <= "11";
                WHEN "101" =>  outMuxSelEnc_uid129_fpArccosXTest_q <= "01";
                WHEN "110" =>  outMuxSelEnc_uid129_fpArccosXTest_q <= "01";
                WHEN "111" =>  outMuxSelEnc_uid129_fpArccosXTest_q <= "01";
                WHEN OTHERS =>
                    outMuxSelEnc_uid129_fpArccosXTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--reg_outMuxSelEnc_uid129_fpArccosXTest_0_to_expRPostExc_uid131_fpArccosXTest_1(REG,591)@41
    reg_outMuxSelEnc_uid129_fpArccosXTest_0_to_expRPostExc_uid131_fpArccosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_outMuxSelEnc_uid129_fpArccosXTest_0_to_expRPostExc_uid131_fpArccosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_outMuxSelEnc_uid129_fpArccosXTest_0_to_expRPostExc_uid131_fpArccosXTest_1_q <= outMuxSelEnc_uid129_fpArccosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--xIn(GPIN,3)@0

	--expRPostExc_uid131_fpArccosXTest(MUX,130)@42
    expRPostExc_uid131_fpArccosXTest_s <= reg_outMuxSelEnc_uid129_fpArccosXTest_0_to_expRPostExc_uid131_fpArccosXTest_1_q;
    expRPostExc_uid131_fpArccosXTest: PROCESS (expRPostExc_uid131_fpArccosXTest_s, en, cstAllZWE_uid12_fpArccosXTest_q, expRCalc_uid125_fpArccosXTest_q, cstAllOWE_uid9_fpArccosXTest_q, cstAllOWE_uid9_fpArccosXTest_q)
    BEGIN
            CASE expRPostExc_uid131_fpArccosXTest_s IS
                  WHEN "00" => expRPostExc_uid131_fpArccosXTest_q <= cstAllZWE_uid12_fpArccosXTest_q;
                  WHEN "01" => expRPostExc_uid131_fpArccosXTest_q <= expRCalc_uid125_fpArccosXTest_q;
                  WHEN "10" => expRPostExc_uid131_fpArccosXTest_q <= cstAllOWE_uid9_fpArccosXTest_q;
                  WHEN "11" => expRPostExc_uid131_fpArccosXTest_q <= cstAllOWE_uid9_fpArccosXTest_q;
                  WHEN OTHERS => expRPostExc_uid131_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--piF_uid119_fpArccosXTest(BITSELECT,118)@42
    piF_uid119_fpArccosXTest_in <= pi_uid85_fpArccosXTest_q(26 downto 0);
    piF_uid119_fpArccosXTest_b <= piF_uid119_fpArccosXTest_in(26 downto 4);

	--ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_nor(LOGICAL,1365)
    ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_nor_a <= ld_singX_uid8_fpArccosXTest_b_to_path1ResFP_uid96_fpArccosXTest_b_notEnable_q;
    ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_nor_b <= ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_sticky_ena_q;
    ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_nor_q <= not (ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_nor_a or ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_nor_b);

	--ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_sticky_ena(REG,1366)
    ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_nor_q = "1") THEN
                ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_sticky_ena_q <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_enaAnd(LOGICAL,1367)
    ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_enaAnd_a <= ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_sticky_ena_q;
    ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_enaAnd_b <= en;
    ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_enaAnd_q <= ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_enaAnd_a and ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_enaAnd_b;

	--Path2ResFP22dto0_uid120_fpArccosXTest(BITSELECT,119)@13
    Path2ResFP22dto0_uid120_fpArccosXTest_in <= path2ResFP_uid116_fpArccosXTest_q(22 downto 0);
    Path2ResFP22dto0_uid120_fpArccosXTest_b <= Path2ResFP22dto0_uid120_fpArccosXTest_in(22 downto 0);

	--ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_inputreg(DELAY,1355)
    ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => Path2ResFP22dto0_uid120_fpArccosXTest_b, xout => ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem(DUALMEM,1356)
    ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_reset0 <= areset;
    ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_ia <= ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_inputreg_q;
    ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_aa <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdreg_q;
    ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_ab <= ld_reg_Path2ResFP30dto23_uid123_fpArccosXTest_0_to_expRCalc_uid125_fpArccosXTest_3_q_to_expRCalc_uid125_fpArccosXTest_d_replace_rdmux_q;
    ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_iq,
        address_a => ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_aa,
        data_a => ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_ia
    );
        ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_q <= ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_iq(22 downto 0);

	--reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3(REG,588)@41
    reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_q <= ld_Path2ResFP22dto0_uid120_fpArccosXTest_b_to_reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--Path1ResFP22dto0_uid121_fpArccosXTest(BITSELECT,120)@41
    Path1ResFP22dto0_uid121_fpArccosXTest_in <= path1ResFP_uid96_fpArccosXTest_q(22 downto 0);
    Path1ResFP22dto0_uid121_fpArccosXTest_b <= Path1ResFP22dto0_uid121_fpArccosXTest_in(22 downto 0);

	--reg_Path1ResFP22dto0_uid121_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_2(REG,587)@41
    reg_Path1ResFP22dto0_uid121_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_Path1ResFP22dto0_uid121_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_2_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_Path1ResFP22dto0_uid121_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_2_q <= Path1ResFP22dto0_uid121_fpArccosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracRCalc_uid122_fpArccosXTest(MUX,121)@42
    fracRCalc_uid122_fpArccosXTest_s <= fracOutMuxSelEnc_uid118_fpArccosXTest_q;
    fracRCalc_uid122_fpArccosXTest: PROCESS (fracRCalc_uid122_fpArccosXTest_s, en, reg_Path1ResFP22dto0_uid121_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_2_q, reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_q, piF_uid119_fpArccosXTest_b, cstAllZWF_uid10_fpArccosXTest_q)
    BEGIN
            CASE fracRCalc_uid122_fpArccosXTest_s IS
                  WHEN "00" => fracRCalc_uid122_fpArccosXTest_q <= reg_Path1ResFP22dto0_uid121_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_2_q;
                  WHEN "01" => fracRCalc_uid122_fpArccosXTest_q <= reg_Path2ResFP22dto0_uid120_fpArccosXTest_0_to_fracRCalc_uid122_fpArccosXTest_3_q;
                  WHEN "10" => fracRCalc_uid122_fpArccosXTest_q <= piF_uid119_fpArccosXTest_b;
                  WHEN "11" => fracRCalc_uid122_fpArccosXTest_q <= cstAllZWF_uid10_fpArccosXTest_q;
                  WHEN OTHERS => fracRCalc_uid122_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_outMuxSelEnc_uid129_fpArccosXTest_q_to_fracRPostExc_uid130_fpArccosXTest_b(DELAY,706)@41
    ld_outMuxSelEnc_uid129_fpArccosXTest_q_to_fracRPostExc_uid130_fpArccosXTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => outMuxSelEnc_uid129_fpArccosXTest_q, xout => ld_outMuxSelEnc_uid129_fpArccosXTest_q_to_fracRPostExc_uid130_fpArccosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid130_fpArccosXTest(MUX,129)@42
    fracRPostExc_uid130_fpArccosXTest_s <= ld_outMuxSelEnc_uid129_fpArccosXTest_q_to_fracRPostExc_uid130_fpArccosXTest_b_q;
    fracRPostExc_uid130_fpArccosXTest: PROCESS (fracRPostExc_uid130_fpArccosXTest_s, en, cstAllZWF_uid10_fpArccosXTest_q, fracRCalc_uid122_fpArccosXTest_q, cstAllZWF_uid10_fpArccosXTest_q, cstNaNWF_uid11_fpArccosXTest_q)
    BEGIN
            CASE fracRPostExc_uid130_fpArccosXTest_s IS
                  WHEN "00" => fracRPostExc_uid130_fpArccosXTest_q <= cstAllZWF_uid10_fpArccosXTest_q;
                  WHEN "01" => fracRPostExc_uid130_fpArccosXTest_q <= fracRCalc_uid122_fpArccosXTest_q;
                  WHEN "10" => fracRPostExc_uid130_fpArccosXTest_q <= cstAllZWF_uid10_fpArccosXTest_q;
                  WHEN "11" => fracRPostExc_uid130_fpArccosXTest_q <= cstNaNWF_uid11_fpArccosXTest_q;
                  WHEN OTHERS => fracRPostExc_uid130_fpArccosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sR_uid132_fpArccosXTest(BITJOIN,131)@42
    sR_uid132_fpArccosXTest_q <= GND_q & expRPostExc_uid131_fpArccosXTest_q & fracRPostExc_uid130_fpArccosXTest_q;

	--xOut(GPOUT,4)@42
    q <= sR_uid132_fpArccosXTest_q;


end normal;
