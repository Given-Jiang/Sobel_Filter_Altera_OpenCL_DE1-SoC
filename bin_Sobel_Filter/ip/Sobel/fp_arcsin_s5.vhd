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

-- VHDL created from fp_arcsin_s5
-- VHDL created on Thu Feb 28 17:19:44 2013


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

entity fp_arcsin_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_arcsin_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid9_fpArcsinXTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid10_fpArcsinXTest_q : std_logic_vector (22 downto 0);
    signal cstNaNWF_uid11_fpArcsinXTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid12_fpArcsinXTest_q : std_logic_vector (7 downto 0);
    signal cstBias_uid13_fpArcsinXTest_q : std_logic_vector (7 downto 0);
    signal cstBiasM1_uid14_fpArcsinXTest_q : std_logic_vector (7 downto 0);
    signal cstBiasM2_uid15_fpArcsinXTest_q : std_logic_vector (7 downto 0);
    signal biasMwShift_uid41_fpArcsinXTest_q : std_logic_vector (7 downto 0);
    signal arcsinXIsX_uid42_fpArcsinXTest_a : std_logic_vector(10 downto 0);
    signal arcsinXIsX_uid42_fpArcsinXTest_b : std_logic_vector(10 downto 0);
    signal arcsinXIsX_uid42_fpArcsinXTest_o : std_logic_vector (10 downto 0);
    signal arcsinXIsX_uid42_fpArcsinXTest_cin : std_logic_vector (0 downto 0);
    signal arcsinXIsX_uid42_fpArcsinXTest_n : std_logic_vector (0 downto 0);
    signal shiftBias_uid43_fpArcsinXTest_q : std_logic_vector (7 downto 0);
    signal cst01pWShift_uid45_fpArcsinXTest_q : std_logic_vector (12 downto 0);
    signal mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a : std_logic_vector (23 downto 0);
    signal mul2XArcsinXO2XRes_uid58_fpArcsinXTest_b : std_logic_vector (25 downto 0);
    signal mul2XArcsinXO2XRes_uid58_fpArcsinXTest_s1 : std_logic_vector (49 downto 0);
    signal mul2XArcsinXO2XRes_uid58_fpArcsinXTest_pr : UNSIGNED (49 downto 0);
    signal mul2XArcsinXO2XRes_uid58_fpArcsinXTest_q : std_logic_vector (49 downto 0);
    signal z2_uid84_fpArcsinXTest_q : std_logic_vector (1 downto 0);
    signal piO2_uid92_fpArcsinXTest_q : std_logic_vector (27 downto 0);
    signal fracRCalc_uid106_fpArcsinXTest_s : std_logic_vector (1 downto 0);
    signal fracRCalc_uid106_fpArcsinXTest_q : std_logic_vector (22 downto 0);
    signal expRCalc_uid108_fpArcsinXTest_s : std_logic_vector (1 downto 0);
    signal expRCalc_uid108_fpArcsinXTest_q : std_logic_vector (7 downto 0);
    signal outMuxSelEnc_uid112_fpArcsinXTest_q : std_logic_vector(1 downto 0);
    signal InvExcRNaN_uid115_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid115_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx1Pad4_uid120_fxpX_uid48_fpArcsinXTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage0Idx3Pad12_uid126_fxpX_uid48_fpArcsinXTest_q : std_logic_vector (11 downto 0);
    signal leftShiftStage1Idx3Pad3_uid137_fxpX_uid48_fpArcsinXTest_q : std_logic_vector (2 downto 0);
    signal zs_uid159_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (31 downto 0);
    signal zs_uid166_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (15 downto 0);
    signal maxCountVal_uid202_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (5 downto 0);
    signal vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest_s : std_logic_vector (0 downto 0);
    signal vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (5 downto 0);
    signal expXIsMax_uid217_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid217_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid217_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid225_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid225_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_s : std_logic_vector (0 downto 0);
    signal expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector (7 downto 0);
    signal negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0Idx3Pad24_uid269_alignSqrt_uid86_fpArcsinXTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx3Pad6_uid280_alignSqrt_uid86_fpArcsinXTest_q : std_logic_vector (5 downto 0);
    signal prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a : std_logic_vector (11 downto 0);
    signal prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_b : std_logic_vector (11 downto 0);
    signal prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_pr : SIGNED (24 downto 0);
    signal prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_q : std_logic_vector (23 downto 0);
    signal prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_a : std_logic_vector (17 downto 0);
    signal prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_b : std_logic_vector (20 downto 0);
    signal prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_pr : SIGNED (39 downto 0);
    signal prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_q : std_logic_vector (38 downto 0);
    signal prodXY_uid328_pT1_uid294_arcsinXPolyEval_a : std_logic_vector (12 downto 0);
    signal prodXY_uid328_pT1_uid294_arcsinXPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXY_uid328_pT1_uid294_arcsinXPolyEval_s1 : std_logic_vector (25 downto 0);
    signal prodXY_uid328_pT1_uid294_arcsinXPolyEval_pr : SIGNED (26 downto 0);
    signal prodXY_uid328_pT1_uid294_arcsinXPolyEval_q : std_logic_vector (25 downto 0);
    signal prodXY_uid331_pT2_uid300_arcsinXPolyEval_a : std_logic_vector (16 downto 0);
    signal prodXY_uid331_pT2_uid300_arcsinXPolyEval_b : std_logic_vector (24 downto 0);
    signal prodXY_uid331_pT2_uid300_arcsinXPolyEval_s1 : std_logic_vector (41 downto 0);
    signal prodXY_uid331_pT2_uid300_arcsinXPolyEval_pr : SIGNED (42 downto 0);
    signal prodXY_uid331_pT2_uid300_arcsinXPolyEval_q : std_logic_vector (41 downto 0);
    signal prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_a : std_logic_vector (11 downto 0);
    signal prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_pr : SIGNED (24 downto 0);
    signal prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_q : std_logic_vector (23 downto 0);
    signal prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a : std_logic_vector (15 downto 0);
    signal prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_b : std_logic_vector (22 downto 0);
    signal prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_pr : SIGNED (39 downto 0);
    signal prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_q : std_logic_vector (38 downto 0);
    signal memoryC0_uid143_arcsinXO2XTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid143_arcsinXO2XTabGen_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid143_arcsinXO2XTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid143_arcsinXO2XTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid143_arcsinXO2XTabGen_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid143_arcsinXO2XTabGen_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid144_arcsinXO2XTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid144_arcsinXO2XTabGen_lutmem_ia : std_logic_vector (18 downto 0);
    signal memoryC1_uid144_arcsinXO2XTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid144_arcsinXO2XTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid144_arcsinXO2XTabGen_lutmem_iq : std_logic_vector (18 downto 0);
    signal memoryC1_uid144_arcsinXO2XTabGen_lutmem_q : std_logic_vector (18 downto 0);
    signal memoryC2_uid145_arcsinXO2XTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid145_arcsinXO2XTabGen_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid145_arcsinXO2XTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid145_arcsinXO2XTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid145_arcsinXO2XTabGen_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid145_arcsinXO2XTabGen_lutmem_q : std_logic_vector (11 downto 0);
    signal memoryC0_uid290_arcsinXTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid290_arcsinXTabGen_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid290_arcsinXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid290_arcsinXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid290_arcsinXTabGen_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid290_arcsinXTabGen_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid291_arcsinXTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid291_arcsinXTabGen_lutmem_ia : std_logic_vector (22 downto 0);
    signal memoryC1_uid291_arcsinXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid291_arcsinXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid291_arcsinXTabGen_lutmem_iq : std_logic_vector (22 downto 0);
    signal memoryC1_uid291_arcsinXTabGen_lutmem_q : std_logic_vector (22 downto 0);
    signal memoryC2_uid292_arcsinXTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid292_arcsinXTabGen_lutmem_ia : std_logic_vector (12 downto 0);
    signal memoryC2_uid292_arcsinXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid292_arcsinXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid292_arcsinXTabGen_lutmem_iq : std_logic_vector (12 downto 0);
    signal memoryC2_uid292_arcsinXTabGen_lutmem_q : std_logic_vector (12 downto 0);
    signal memoryC0_uid312_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC0_uid312_sqrtTableGenerator_lutmem_ia : std_logic_vector (28 downto 0);
    signal memoryC0_uid312_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid312_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid312_sqrtTableGenerator_lutmem_iq : std_logic_vector (28 downto 0);
    signal memoryC0_uid312_sqrtTableGenerator_lutmem_q : std_logic_vector (28 downto 0);
    signal memoryC1_uid313_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC1_uid313_sqrtTableGenerator_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid313_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid313_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid313_sqrtTableGenerator_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid313_sqrtTableGenerator_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid314_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC2_uid314_sqrtTableGenerator_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid314_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid314_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid314_sqrtTableGenerator_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid314_sqrtTableGenerator_lutmem_q : std_logic_vector (11 downto 0);
    signal reg_excSelBits_uid111_fpArcsinXTest_0_to_outMuxSelEnc_uid112_fpArcsinXTest_0_q : std_logic_vector (2 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid140_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_2_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage1Idx1_uid133_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_3_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage1Idx2_uid136_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_4_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage1Idx3_uid139_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_5_q : std_logic_vector (36 downto 0);
    signal reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC2_uid145_arcsinXO2XTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid145_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_1_q : std_logic_vector (11 downto 0);
    signal reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_q : std_logic_vector (17 downto 0);
    signal reg_s1_uid148_uid151_arcsinXO2XPolyEval_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_1_q : std_logic_vector (20 downto 0);
    signal reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q : std_logic_vector (23 downto 0);
    signal reg_fxpArcSinXO2XRes_uid57_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_1_q : std_logic_vector (25 downto 0);
    signal reg_rVStage_uid160_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid161_fpLOut1_uid72_fpArcsinXTest_1_q : std_logic_vector (31 downto 0);
    signal reg_l_uid71_fpArcsinXTest_0_to_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_2_q : std_logic_vector (34 downto 0);
    signal reg_cStage_uid164_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_3_q : std_logic_vector (34 downto 0);
    signal reg_rVStage_uid167_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid168_fpLOut1_uid72_fpArcsinXTest_1_q : std_logic_vector (15 downto 0);
    signal reg_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_2_q : std_logic_vector (34 downto 0);
    signal reg_cStage_uid171_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_3_q : std_logic_vector (34 downto 0);
    signal reg_rVStage_uid181_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid182_fpLOut1_uid72_fpArcsinXTest_1_q : std_logic_vector (3 downto 0);
    signal reg_vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_2_q : std_logic_vector (34 downto 0);
    signal reg_cStage_uid185_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_3_q : std_logic_vector (34 downto 0);
    signal reg_vCount_uid175_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_3_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_0_to_vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_1_q : std_logic_vector (5 downto 0);
    signal reg_fpLOutFrac_uid74_fpArcsinXTest_0_to_fpL_uid76_fpArcsinXTest_0_q : std_logic_vector (22 downto 0);
    signal reg_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_0_to_fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_1_q : std_logic_vector (22 downto 0);
    signal reg_fracSelIn_uid248_sqrtFPL_uid78_fpArcsinXTest_0_to_fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_0_q : std_logic_vector (3 downto 0);
    signal reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC2_uid314_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid315_sqrtPolynomialEvaluator_0_to_prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid314_sqrtTableGenerator_lutmem_0_to_prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_1_q : std_logic_vector (11 downto 0);
    signal reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q : std_logic_vector (15 downto 0);
    signal reg_s1_uid317_uid320_sqrtPolynomialEvaluator_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_1_q : std_logic_vector (22 downto 0);
    signal reg_expX_uid208_sqrtFPL_uid78_fpArcsinXTest_0_to_expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_0_q : std_logic_vector (7 downto 0);
    signal reg_SqrtFPL30dto23_uid79_fpArcsinXTest_0_to_srVal_uid80_fpArcsinXTest_1_q : std_logic_vector (7 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid282_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_2_q : std_logic_vector (25 downto 0);
    signal reg_rightShiftStage1Idx1_uid275_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_3_q : std_logic_vector (25 downto 0);
    signal reg_rightShiftStage1Idx2_uid278_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_4_q : std_logic_vector (25 downto 0);
    signal reg_rightShiftStage1Idx3_uid281_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_5_q : std_logic_vector (25 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid287_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC2_uid292_arcsinXTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid293_arcsinXPolyEval_0_to_prodXY_uid328_pT1_uid294_arcsinXPolyEval_0_q : std_logic_vector (12 downto 0);
    signal reg_memoryC2_uid292_arcsinXTabGen_lutmem_0_to_prodXY_uid328_pT1_uid294_arcsinXPolyEval_1_q : std_logic_vector (12 downto 0);
    signal reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q : std_logic_vector (16 downto 0);
    signal reg_s1_uid295_uid298_arcsinXPolyEval_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_1_q : std_logic_vector (24 downto 0);
    signal reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_fxpArcsinX_uid91_fpArcsinXTest_0_to_path3Diff_uid93_fpArcsinXTest_1_q : std_logic_vector (27 downto 0);
    signal reg_expFracConc_uid99_uid99_fpArcsinXTest_0_to_expFracRPath2PostRnd_uid100_fpArcsinXTest_0_q : std_logic_vector (31 downto 0);
    signal reg_singX_uid8_fpArcsinXTest_0_to_signR_uid116_fpArcsinXTest_1_q : std_logic_vector (0 downto 0);
    signal ld_reg_fpLOutFrac_uid74_fpArcsinXTest_0_to_fpL_uid76_fpArcsinXTest_0_q_to_fpL_uid76_fpArcsinXTest_a_q : std_logic_vector (22 downto 0);
    signal ld_SqrtFPL22dto0_uid81_fpArcsinXTest_b_to_oSqrtFPLFrac_uid82_fpArcsinXTest_a_q : std_logic_vector (22 downto 0);
    signal ld_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q_to_mPPolyEval_uid89_fpArcsinXTest_a_q : std_logic_vector (25 downto 0);
    signal ld_vCount_uid168_fpLOut1_uid72_fpArcsinXTest_q_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid161_fpLOut1_uid72_fpArcsinXTest_q_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_f_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_q_to_vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest_c_q : std_logic_vector (5 downto 0);
    signal ld_expOddSelect_uid234_sqrtFPL_uid78_fpArcsinXTest_q_to_expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b_to_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_a_q : std_logic_vector (22 downto 0);
    signal ld_InvSignX_uid242_sqrtFPL_uid78_fpArcsinXTest_q_to_inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid210_sqrtFPL_uid78_fpArcsinXTest_b_to_minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_q_to_join_uid247_sqrtFPL_uid78_fpArcsinXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q_to_fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_b_q : std_logic_vector (1 downto 0);
    signal ld_negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC1_uid291_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid291_arcsinXTabGen_lutmem_a_q : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_q_to_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_reset0 : std_logic;
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_sticky_ena_q : signal is true;
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_reset0 : std_logic;
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_eq : std_logic;
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_sticky_ena_q : signal is true;
    signal ld_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q_to_mPPolyEval_uid89_fpArcsinXTest_a_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_reset0 : std_logic;
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_eq : std_logic;
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_sticky_ena_q : signal is true;
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_reset0 : std_logic;
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_eq : std_logic;
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_sticky_ena_q : signal is true;
    signal ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_reset0 : std_logic;
    signal ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_sticky_ena_q : signal is true;
    signal ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_reset0 : std_logic;
    signal ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_sticky_ena_q : signal is true;
    signal ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_reset0 : std_logic;
    signal ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_sticky_ena_q : signal is true;
    signal ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_reset0 : std_logic;
    signal ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_sticky_ena_q : signal is true;
    signal ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_reset0 : std_logic;
    signal ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_sticky_ena_q : signal is true;
    signal ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_reset0 : std_logic;
    signal ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_sticky_ena_q : signal is true;
    signal ld_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b_to_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_reset0 : std_logic;
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_eq : std_logic;
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_sticky_ena_q : signal is true;
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_ia : std_logic_vector (11 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_iq : std_logic_vector (11 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_q : std_logic_vector (11 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_sticky_ena_q : signal is true;
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_ia : std_logic_vector (16 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_iq : std_logic_vector (16 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_q : std_logic_vector (16 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_sticky_ena_q : signal is true;
    signal ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_reset0 : std_logic;
    signal ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_ia : std_logic_vector (15 downto 0);
    signal ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_iq : std_logic_vector (15 downto 0);
    signal ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_q : std_logic_vector (15 downto 0);
    signal ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_sticky_ena_q : signal is true;
    signal ld_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC1_uid291_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid291_arcsinXTabGen_lutmem_a_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_sticky_ena_q : signal is true;
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_inputreg_q : std_logic_vector (17 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_ia : std_logic_vector (17 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_iq : std_logic_vector (17 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_q : std_logic_vector (17 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_eq : std_logic;
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_sticky_ena_q : signal is true;
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_q_to_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_sticky_ena_q : signal is true;
    signal pad_o_uid16_uid69_fpArcsinXTest_q : std_logic_vector (35 downto 0);
    signal excSelBits_uid111_fpArcsinXTest_q : std_logic_vector (2 downto 0);
    signal vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_a : std_logic_vector(8 downto 0);
    signal vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector(8 downto 0);
    signal vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_o : std_logic_vector (8 downto 0);
    signal vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_cin : std_logic_vector (0 downto 0);
    signal vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_c : std_logic_vector (0 downto 0);
    signal expFracRPath2PostRnd_uid100_fpArcsinXTest_a : std_logic_vector(32 downto 0);
    signal expFracRPath2PostRnd_uid100_fpArcsinXTest_b : std_logic_vector(32 downto 0);
    signal expFracRPath2PostRnd_uid100_fpArcsinXTest_o : std_logic_vector (32 downto 0);
    signal expFracRPath2PostRnd_uid100_fpArcsinXTest_q : std_logic_vector (32 downto 0);
    signal oSqrtFPLFrac_uid82_fpArcsinXTest_q : std_logic_vector (23 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal expX_uid6_fpArcsinXTest_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpArcsinXTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid7_fpArcsinXTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid7_fpArcsinXTest_b : std_logic_vector (22 downto 0);
    signal singX_uid8_fpArcsinXTest_in : std_logic_vector (31 downto 0);
    signal singX_uid8_fpArcsinXTest_b : std_logic_vector (0 downto 0);
    signal expXIsZero_uid22_fpArcsinXTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid22_fpArcsinXTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid22_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid24_fpArcsinXTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid24_fpArcsinXTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid24_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid26_fpArcsinXTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid26_fpArcsinXTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid26_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid27_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid27_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid27_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal expGT0_uid35_fpArcsinXTest_a : std_logic_vector(10 downto 0);
    signal expGT0_uid35_fpArcsinXTest_b : std_logic_vector(10 downto 0);
    signal expGT0_uid35_fpArcsinXTest_o : std_logic_vector (10 downto 0);
    signal expGT0_uid35_fpArcsinXTest_cin : std_logic_vector (0 downto 0);
    signal expGT0_uid35_fpArcsinXTest_c : std_logic_vector (0 downto 0);
    signal expEQ0_uid36_fpArcsinXTest_a : std_logic_vector(7 downto 0);
    signal expEQ0_uid36_fpArcsinXTest_b : std_logic_vector(7 downto 0);
    signal expEQ0_uid36_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal shiftValue_uid44_fpArcsinXTest_a : std_logic_vector(8 downto 0);
    signal shiftValue_uid44_fpArcsinXTest_b : std_logic_vector(8 downto 0);
    signal shiftValue_uid44_fpArcsinXTest_o : std_logic_vector (8 downto 0);
    signal shiftValue_uid44_fpArcsinXTest_q : std_logic_vector (8 downto 0);
    signal expL_uid73_fpArcsinXTest_a : std_logic_vector(8 downto 0);
    signal expL_uid73_fpArcsinXTest_b : std_logic_vector(8 downto 0);
    signal expL_uid73_fpArcsinXTest_o : std_logic_vector (8 downto 0);
    signal expL_uid73_fpArcsinXTest_q : std_logic_vector (8 downto 0);
    signal srVal_uid80_fpArcsinXTest_a : std_logic_vector(8 downto 0);
    signal srVal_uid80_fpArcsinXTest_b : std_logic_vector(8 downto 0);
    signal srVal_uid80_fpArcsinXTest_o : std_logic_vector (8 downto 0);
    signal srVal_uid80_fpArcsinXTest_q : std_logic_vector (8 downto 0);
    signal path3Diff_uid93_fpArcsinXTest_a : std_logic_vector(28 downto 0);
    signal path3Diff_uid93_fpArcsinXTest_b : std_logic_vector(28 downto 0);
    signal path3Diff_uid93_fpArcsinXTest_o : std_logic_vector (28 downto 0);
    signal path3Diff_uid93_fpArcsinXTest_q : std_logic_vector (28 downto 0);
    signal fracOutMuxSelEnc_uid104_fpArcsinXTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid113_fpArcsinXTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid113_fpArcsinXTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid114_fpArcsinXTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid114_fpArcsinXTest_q : std_logic_vector (7 downto 0);
    signal signR_uid116_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal signR_uid116_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal signR_uid116_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_q : std_logic_vector (36 downto 0);
    signal vCount_uid161_fpLOut1_uid72_fpArcsinXTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid161_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid161_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid168_fpLOut1_uid72_fpArcsinXTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid168_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid168_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid182_fpLOut1_uid72_fpArcsinXTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid182_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid182_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (34 downto 0);
    signal fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid220_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid220_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid220_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(8 downto 0);
    signal expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector(8 downto 0);
    signal expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_o : std_logic_vector (8 downto 0);
    signal expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector (8 downto 0);
    signal expOddSig_uid231_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(8 downto 0);
    signal expOddSig_uid231_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector(8 downto 0);
    signal expOddSig_uid231_sqrtFPL_uid78_fpArcsinXTest_o : std_logic_vector (8 downto 0);
    signal expOddSig_uid231_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector (8 downto 0);
    signal inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal minInf_uid245_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal minInf_uid245_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal minInf_uid245_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(1 downto 0);
    signal expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector (7 downto 0);
    signal rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_q : std_logic_vector (25 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal normBitPath2_uid59_fpArcsinXTest_in : std_logic_vector (49 downto 0);
    signal normBitPath2_uid59_fpArcsinXTest_b : std_logic_vector (0 downto 0);
    signal fracRPath2High_uid60_fpArcsinXTest_in : std_logic_vector (48 downto 0);
    signal fracRPath2High_uid60_fpArcsinXTest_b : std_logic_vector (23 downto 0);
    signal fracRPath2Low_uid61_fpArcsinXTest_in : std_logic_vector (47 downto 0);
    signal fracRPath2Low_uid61_fpArcsinXTest_b : std_logic_vector (23 downto 0);
    signal oSqrtFPLFracZ2_uid85_fpArcsinXTest_q : std_logic_vector (25 downto 0);
    signal piO2OutRange_uid105_fpArcsinXTest_in : std_logic_vector (26 downto 0);
    signal piO2OutRange_uid105_fpArcsinXTest_b : std_logic_vector (22 downto 0);
    signal prodXYTruncFR_uid307_pT1_uid147_arcsinXO2XPolyEval_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid307_pT1_uid147_arcsinXO2XPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid310_pT2_uid153_arcsinXO2XPolyEval_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid310_pT2_uid153_arcsinXO2XPolyEval_b : std_logic_vector (21 downto 0);
    signal prodXYTruncFR_uid329_pT1_uid294_arcsinXPolyEval_in : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid329_pT1_uid294_arcsinXPolyEval_b : std_logic_vector (13 downto 0);
    signal prodXYTruncFR_uid332_pT2_uid300_arcsinXPolyEval_in : std_logic_vector (41 downto 0);
    signal prodXYTruncFR_uid332_pT2_uid300_arcsinXPolyEval_b : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid335_pT1_uid316_sqrtPolynomialEvaluator_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid335_pT1_uid316_sqrtPolynomialEvaluator_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid338_pT2_uid322_sqrtPolynomialEvaluator_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid338_pT2_uid322_sqrtPolynomialEvaluator_b : std_logic_vector (23 downto 0);
    signal mPPolyEval_uid89_fpArcsinXTest_in : std_logic_vector (17 downto 0);
    signal mPPolyEval_uid89_fpArcsinXTest_b : std_logic_vector (16 downto 0);
    signal FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_in : std_logic_vector (15 downto 0);
    signal FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector (15 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmp_a : std_logic_vector(5 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmp_b : std_logic_vector(5 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_nor_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_nor_q : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_nor_q : std_logic_vector(0 downto 0);
    signal R_uid117_fpArcsinXTest_q : std_logic_vector (31 downto 0);
    signal ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmp_a : std_logic_vector(2 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmp_b : std_logic_vector(2 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal fracRPath3_uid101_fpArcsinXTest_in : std_logic_vector (23 downto 0);
    signal fracRPath3_uid101_fpArcsinXTest_b : std_logic_vector (22 downto 0);
    signal expRPath3_uid102_fpArcsinXTest_in : std_logic_vector (31 downto 0);
    signal expRPath3_uid102_fpArcsinXTest_b : std_logic_vector (7 downto 0);
    signal oFracX_uid40_uid40_fpArcsinXTest_q : std_logic_vector (23 downto 0);
    signal InvExpXIsZero_uid32_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid32_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid28_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid28_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid31_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid31_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal exp0FracNotZero_uid38_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal exp0FracNotZero_uid38_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal exp0FracNotZero_uid38_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal fxpShifterBits_uid47_fpArcsinXTest_in : std_logic_vector (3 downto 0);
    signal fxpShifterBits_uid47_fpArcsinXTest_b : std_logic_vector (3 downto 0);
    signal expLRange_uid75_fpArcsinXTest_in : std_logic_vector (7 downto 0);
    signal expLRange_uid75_fpArcsinXTest_b : std_logic_vector (7 downto 0);
    signal srValRange_uid83_fpArcsinXTest_in : std_logic_vector (4 downto 0);
    signal srValRange_uid83_fpArcsinXTest_b : std_logic_vector (4 downto 0);
    signal normBitPath3Diff_uid94_fpArcsinXTest_in : std_logic_vector (27 downto 0);
    signal normBitPath3Diff_uid94_fpArcsinXTest_b : std_logic_vector (0 downto 0);
    signal path3DiffHigh_uid95_fpArcsinXTest_in : std_logic_vector (26 downto 0);
    signal path3DiffHigh_uid95_fpArcsinXTest_b : std_logic_vector (23 downto 0);
    signal path3DiffLow_uid96_fpArcsinXTest_in : std_logic_vector (25 downto 0);
    signal path3DiffLow_uid96_fpArcsinXTest_b : std_logic_vector (23 downto 0);
    signal arcsinIsMax_uid49_fpArcsinXTest_in : std_logic_vector (36 downto 0);
    signal arcsinIsMax_uid49_fpArcsinXTest_b : std_logic_vector (0 downto 0);
    signal y_uid50_fpArcsinXTest_in : std_logic_vector (35 downto 0);
    signal y_uid50_fpArcsinXTest_b : std_logic_vector (34 downto 0);
    signal rVStage_uid167_fpLOut1_uid72_fpArcsinXTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid167_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid170_fpLOut1_uid72_fpArcsinXTest_in : std_logic_vector (18 downto 0);
    signal vStage_uid170_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector (18 downto 0);
    signal rVStage_uid174_fpLOut1_uid72_fpArcsinXTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid174_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid177_fpLOut1_uid72_fpArcsinXTest_in : std_logic_vector (26 downto 0);
    signal vStage_uid177_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector (26 downto 0);
    signal rVStage_uid188_fpLOut1_uid72_fpArcsinXTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid188_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid191_fpLOut1_uid72_fpArcsinXTest_in : std_logic_vector (32 downto 0);
    signal vStage_uid191_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector (32 downto 0);
    signal InvFracXIsZero_uid221_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid221_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid224_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid224_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal expREven_uid229_sqrtFPL_uid78_fpArcsinXTest_in : std_logic_vector (8 downto 0);
    signal expREven_uid229_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector (7 downto 0);
    signal expROdd_uid232_sqrtFPL_uid78_fpArcsinXTest_in : std_logic_vector (8 downto 0);
    signal expROdd_uid232_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector (7 downto 0);
    signal RightShiftStage125dto1_uid284_alignSqrt_uid86_fpArcsinXTest_in : std_logic_vector (25 downto 0);
    signal RightShiftStage125dto1_uid284_alignSqrt_uid86_fpArcsinXTest_b : std_logic_vector (24 downto 0);
    signal fracRPath2Pre_uid62_fpArcsinXTest_s : std_logic_vector (0 downto 0);
    signal fracRPath2Pre_uid62_fpArcsinXTest_q : std_logic_vector (23 downto 0);
    signal add_normUpdate_uid63_fracRPath2PreUlp_uid63_uid63_uid64_fpArcsinXTest_q : std_logic_vector (24 downto 0);
    signal X25dto8_uid262_alignSqrt_uid86_fpArcsinXTest_in : std_logic_vector (25 downto 0);
    signal X25dto8_uid262_alignSqrt_uid86_fpArcsinXTest_b : std_logic_vector (17 downto 0);
    signal X25dto16_uid265_alignSqrt_uid86_fpArcsinXTest_in : std_logic_vector (25 downto 0);
    signal X25dto16_uid265_alignSqrt_uid86_fpArcsinXTest_b : std_logic_vector (9 downto 0);
    signal X25dto24_uid268_alignSqrt_uid86_fpArcsinXTest_in : std_logic_vector (25 downto 0);
    signal X25dto24_uid268_alignSqrt_uid86_fpArcsinXTest_b : std_logic_vector (1 downto 0);
    signal lowRangeB_uid148_arcsinXO2XPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid148_arcsinXO2XPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid149_arcsinXO2XPolyEval_in : std_logic_vector (12 downto 0);
    signal highBBits_uid149_arcsinXO2XPolyEval_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid154_arcsinXO2XPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid154_arcsinXO2XPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid155_arcsinXO2XPolyEval_in : std_logic_vector (21 downto 0);
    signal highBBits_uid155_arcsinXO2XPolyEval_b : std_logic_vector (19 downto 0);
    signal lowRangeB_uid295_arcsinXPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid295_arcsinXPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid296_arcsinXPolyEval_in : std_logic_vector (13 downto 0);
    signal highBBits_uid296_arcsinXPolyEval_b : std_logic_vector (12 downto 0);
    signal lowRangeB_uid301_arcsinXPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid301_arcsinXPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid302_arcsinXPolyEval_in : std_logic_vector (25 downto 0);
    signal highBBits_uid302_arcsinXPolyEval_b : std_logic_vector (23 downto 0);
    signal lowRangeB_uid317_sqrtPolynomialEvaluator_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid317_sqrtPolynomialEvaluator_b : std_logic_vector (0 downto 0);
    signal highBBits_uid318_sqrtPolynomialEvaluator_in : std_logic_vector (12 downto 0);
    signal highBBits_uid318_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid323_sqrtPolynomialEvaluator_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid323_sqrtPolynomialEvaluator_b : std_logic_vector (1 downto 0);
    signal highBBits_uid324_sqrtPolynomialEvaluator_in : std_logic_vector (23 downto 0);
    signal highBBits_uid324_sqrtPolynomialEvaluator_b : std_logic_vector (21 downto 0);
    signal yT1_uid293_arcsinXPolyEval_in : std_logic_vector (16 downto 0);
    signal yT1_uid293_arcsinXPolyEval_b : std_logic_vector (12 downto 0);
    signal yT1_uid315_sqrtPolynomialEvaluator_in : std_logic_vector (15 downto 0);
    signal yT1_uid315_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal oFracXExt_uid46_fpArcsinXTest_q : std_logic_vector (36 downto 0);
    signal exc_N_uid29_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid29_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid29_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal inputOutOfRange_uid39_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal inputOutOfRange_uid39_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal inputOutOfRange_uid39_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStageSel3Dto2_uid129_fxpX_uid48_fpArcsinXTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid129_fxpX_uid48_fpArcsinXTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid140_fxpX_uid48_fpArcsinXTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid140_fxpX_uid48_fpArcsinXTest_b : std_logic_vector (1 downto 0);
    signal fpL_uid76_fpArcsinXTest_q : std_logic_vector (31 downto 0);
    signal rightShiftStageSel4Dto3_uid271_alignSqrt_uid86_fpArcsinXTest_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid271_alignSqrt_uid86_fpArcsinXTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid282_alignSqrt_uid86_fpArcsinXTest_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid282_alignSqrt_uid86_fpArcsinXTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid287_alignSqrt_uid86_fpArcsinXTest_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid287_alignSqrt_uid86_fpArcsinXTest_b : std_logic_vector (0 downto 0);
    signal fracRPath3_uid97_fpArcsinXTest_s : std_logic_vector (0 downto 0);
    signal fracRPath3_uid97_fpArcsinXTest_q : std_logic_vector (23 downto 0);
    signal expRPath3_uid98_fpArcsinXTest_s : std_logic_vector (0 downto 0);
    signal expRPath3_uid98_fpArcsinXTest_q : std_logic_vector (7 downto 0);
    signal Y34_uid51_fpArcsinXTest_in : std_logic_vector (34 downto 0);
    signal Y34_uid51_fpArcsinXTest_b : std_logic_vector (0 downto 0);
    signal yAddr_uid54_fpArcsinXTest_in : std_logic_vector (34 downto 0);
    signal yAddr_uid54_fpArcsinXTest_b : std_logic_vector (7 downto 0);
    signal yPPolyEval_uid55_fpArcsinXTest_in : std_logic_vector (26 downto 0);
    signal yPPolyEval_uid55_fpArcsinXTest_b : std_logic_vector (17 downto 0);
    signal oMy_uid69_fpArcsinXTest_a : std_logic_vector(36 downto 0);
    signal oMy_uid69_fpArcsinXTest_b : std_logic_vector(36 downto 0);
    signal oMy_uid69_fpArcsinXTest_o : std_logic_vector (36 downto 0);
    signal oMy_uid69_fpArcsinXTest_q : std_logic_vector (36 downto 0);
    signal cStage_uid171_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid175_fpLOut1_uid72_fpArcsinXTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid175_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid175_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid178_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid189_fpLOut1_uid72_fpArcsinXTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid189_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid189_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid192_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (34 downto 0);
    signal exc_N_uid222_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid222_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid222_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1_uid286_alignSqrt_uid86_fpArcsinXTest_q : std_logic_vector (25 downto 0);
    signal expFracConc_uid65_uid65_fpArcsinXTest_q : std_logic_vector (31 downto 0);
    signal expFracRPath2PostRnd_uid66_fpArcsinXTest_a : std_logic_vector(32 downto 0);
    signal expFracRPath2PostRnd_uid66_fpArcsinXTest_b : std_logic_vector(32 downto 0);
    signal expFracRPath2PostRnd_uid66_fpArcsinXTest_o : std_logic_vector (32 downto 0);
    signal expFracRPath2PostRnd_uid66_fpArcsinXTest_q : std_logic_vector (32 downto 0);
    signal rightShiftStage0Idx1_uid264_alignSqrt_uid86_fpArcsinXTest_q : std_logic_vector (25 downto 0);
    signal rightShiftStage0Idx2_uid267_alignSqrt_uid86_fpArcsinXTest_q : std_logic_vector (25 downto 0);
    signal rightShiftStage0Idx3_uid270_alignSqrt_uid86_fpArcsinXTest_q : std_logic_vector (25 downto 0);
    signal sumAHighB_uid150_arcsinXO2XPolyEval_a : std_logic_vector(19 downto 0);
    signal sumAHighB_uid150_arcsinXO2XPolyEval_b : std_logic_vector(19 downto 0);
    signal sumAHighB_uid150_arcsinXO2XPolyEval_o : std_logic_vector (19 downto 0);
    signal sumAHighB_uid150_arcsinXO2XPolyEval_q : std_logic_vector (19 downto 0);
    signal sumAHighB_uid156_arcsinXO2XPolyEval_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid156_arcsinXO2XPolyEval_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid156_arcsinXO2XPolyEval_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid156_arcsinXO2XPolyEval_q : std_logic_vector (30 downto 0);
    signal sumAHighB_uid297_arcsinXPolyEval_a : std_logic_vector(23 downto 0);
    signal sumAHighB_uid297_arcsinXPolyEval_b : std_logic_vector(23 downto 0);
    signal sumAHighB_uid297_arcsinXPolyEval_o : std_logic_vector (23 downto 0);
    signal sumAHighB_uid297_arcsinXPolyEval_q : std_logic_vector (23 downto 0);
    signal sumAHighB_uid303_arcsinXPolyEval_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid303_arcsinXPolyEval_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid303_arcsinXPolyEval_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid303_arcsinXPolyEval_q : std_logic_vector (30 downto 0);
    signal sumAHighB_uid319_sqrtPolynomialEvaluator_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid319_sqrtPolynomialEvaluator_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid319_sqrtPolynomialEvaluator_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid319_sqrtPolynomialEvaluator_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid325_sqrtPolynomialEvaluator_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid325_sqrtPolynomialEvaluator_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid325_sqrtPolynomialEvaluator_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid325_sqrtPolynomialEvaluator_q : std_logic_vector (29 downto 0);
    signal X32dto0_uid121_fxpX_uid48_fpArcsinXTest_in : std_logic_vector (32 downto 0);
    signal X32dto0_uid121_fxpX_uid48_fpArcsinXTest_b : std_logic_vector (32 downto 0);
    signal X28dto0_uid124_fxpX_uid48_fpArcsinXTest_in : std_logic_vector (28 downto 0);
    signal X28dto0_uid124_fxpX_uid48_fpArcsinXTest_b : std_logic_vector (28 downto 0);
    signal X24dto0_uid127_fxpX_uid48_fpArcsinXTest_in : std_logic_vector (24 downto 0);
    signal X24dto0_uid127_fxpX_uid48_fpArcsinXTest_b : std_logic_vector (24 downto 0);
    signal InvExc_N_uid30_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid30_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal expX_uid208_sqrtFPL_uid78_fpArcsinXTest_in : std_logic_vector (30 downto 0);
    signal expX_uid208_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector (22 downto 0);
    signal signX_uid210_sqrtFPL_uid78_fpArcsinXTest_in : std_logic_vector (31 downto 0);
    signal signX_uid210_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector (0 downto 0);
    signal rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_q : std_logic_vector (25 downto 0);
    signal expFracConc_uid99_uid99_fpArcsinXTest_q : std_logic_vector (31 downto 0);
    signal path2_uid52_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal path2_uid52_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal yT1_uid146_arcsinXO2XPolyEval_in : std_logic_vector (17 downto 0);
    signal yT1_uid146_arcsinXO2XPolyEval_b : std_logic_vector (11 downto 0);
    signal l_uid71_fpArcsinXTest_in : std_logic_vector (34 downto 0);
    signal l_uid71_fpArcsinXTest_b : std_logic_vector (34 downto 0);
    signal vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (34 downto 0);
    signal vStagei_uid193_fpLOut1_uid72_fpArcsinXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid193_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (34 downto 0);
    signal InvExc_N_uid223_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid223_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_s : std_logic_vector (0 downto 0);
    signal rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q : std_logic_vector (25 downto 0);
    signal fracRPath2_uid67_fpArcsinXTest_in : std_logic_vector (23 downto 0);
    signal fracRPath2_uid67_fpArcsinXTest_b : std_logic_vector (22 downto 0);
    signal expRPath2_uid68_fpArcsinXTest_in : std_logic_vector (31 downto 0);
    signal expRPath2_uid68_fpArcsinXTest_b : std_logic_vector (7 downto 0);
    signal s1_uid148_uid151_arcsinXO2XPolyEval_q : std_logic_vector (20 downto 0);
    signal s2_uid154_uid157_arcsinXO2XPolyEval_q : std_logic_vector (32 downto 0);
    signal s1_uid295_uid298_arcsinXPolyEval_q : std_logic_vector (24 downto 0);
    signal s2_uid301_uid304_arcsinXPolyEval_q : std_logic_vector (32 downto 0);
    signal s1_uid317_uid320_sqrtPolynomialEvaluator_q : std_logic_vector (22 downto 0);
    signal s2_uid323_uid326_sqrtPolynomialEvaluator_q : std_logic_vector (31 downto 0);
    signal leftShiftStage0Idx1_uid122_fxpX_uid48_fpArcsinXTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0Idx2_uid125_fxpX_uid48_fpArcsinXTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0Idx3_uid128_fxpX_uid48_fpArcsinXTest_q : std_logic_vector (36 downto 0);
    signal exc_R_uid33_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid33_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid33_fpArcsinXTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid33_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal expX0_uid233_sqrtFPL_uid78_fpArcsinXTest_in : std_logic_vector (0 downto 0);
    signal expX0_uid233_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector (0 downto 0);
    signal fracXAddr_uid237_sqrtFPL_uid78_fpArcsinXTest_in : std_logic_vector (22 downto 0);
    signal fracXAddr_uid237_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector (6 downto 0);
    signal InvSignX_uid242_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid242_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal RightShiftStage025dto2_uid273_alignSqrt_uid86_fpArcsinXTest_in : std_logic_vector (25 downto 0);
    signal RightShiftStage025dto2_uid273_alignSqrt_uid86_fpArcsinXTest_b : std_logic_vector (23 downto 0);
    signal RightShiftStage025dto4_uid276_alignSqrt_uid86_fpArcsinXTest_in : std_logic_vector (25 downto 0);
    signal RightShiftStage025dto4_uid276_alignSqrt_uid86_fpArcsinXTest_b : std_logic_vector (21 downto 0);
    signal RightShiftStage025dto6_uid279_alignSqrt_uid86_fpArcsinXTest_in : std_logic_vector (25 downto 0);
    signal RightShiftStage025dto6_uid279_alignSqrt_uid86_fpArcsinXTest_b : std_logic_vector (19 downto 0);
    signal pathSelBits_uid103_fpArcsinXTest_q : std_logic_vector (2 downto 0);
    signal rVStage_uid160_fpLOut1_uid72_fpArcsinXTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid160_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid163_fpLOut1_uid72_fpArcsinXTest_in : std_logic_vector (2 downto 0);
    signal vStage_uid163_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector (2 downto 0);
    signal rVStage_uid181_fpLOut1_uid72_fpArcsinXTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid181_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid184_fpLOut1_uid72_fpArcsinXTest_in : std_logic_vector (30 downto 0);
    signal vStage_uid184_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector (30 downto 0);
    signal rVStage_uid195_fpLOut1_uid72_fpArcsinXTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid195_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector (0 downto 0);
    signal vStage_uid198_fpLOut1_uid72_fpArcsinXTest_in : std_logic_vector (33 downto 0);
    signal vStage_uid198_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector (33 downto 0);
    signal exc_R_uid226_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid226_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid226_sqrtFPL_uid78_fpArcsinXTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid226_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal mAddr_uid88_fpArcsinXTest_in : std_logic_vector (25 downto 0);
    signal mAddr_uid88_fpArcsinXTest_b : std_logic_vector (7 downto 0);
    signal fxpArcSinXO2XRes_uid57_fpArcsinXTest_in : std_logic_vector (30 downto 0);
    signal fxpArcSinXO2XRes_uid57_fpArcsinXTest_b : std_logic_vector (25 downto 0);
    signal fxpArcsinX_uid91_fpArcsinXTest_in : std_logic_vector (30 downto 0);
    signal fxpArcsinX_uid91_fpArcsinXTest_b : std_logic_vector (27 downto 0);
    signal fracR_uid241_sqrtFPL_uid78_fpArcsinXTest_in : std_logic_vector (28 downto 0);
    signal fracR_uid241_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector (22 downto 0);
    signal leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_q : std_logic_vector (36 downto 0);
    signal xRegInOutOfRange_uid109_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal xRegInOutOfRange_uid109_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal xRegInOutOfRange_uid109_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal expOddSelect_uid234_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal expOddSelect_uid234_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector (7 downto 0);
    signal rightShiftStage1Idx1_uid275_alignSqrt_uid86_fpArcsinXTest_q : std_logic_vector (25 downto 0);
    signal rightShiftStage1Idx2_uid278_alignSqrt_uid86_fpArcsinXTest_q : std_logic_vector (25 downto 0);
    signal rightShiftStage1Idx3_uid281_alignSqrt_uid86_fpArcsinXTest_q : std_logic_vector (25 downto 0);
    signal cStage_uid164_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (34 downto 0);
    signal cStage_uid185_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid196_fpLOut1_uid72_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid196_fpLOut1_uid72_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid196_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid199_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (34 downto 0);
    signal minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector (22 downto 0);
    signal LeftShiftStage035dto0_uid132_fxpX_uid48_fpArcsinXTest_in : std_logic_vector (35 downto 0);
    signal LeftShiftStage035dto0_uid132_fxpX_uid48_fpArcsinXTest_b : std_logic_vector (35 downto 0);
    signal LeftShiftStage034dto0_uid135_fxpX_uid48_fpArcsinXTest_in : std_logic_vector (34 downto 0);
    signal LeftShiftStage034dto0_uid135_fxpX_uid48_fpArcsinXTest_b : std_logic_vector (34 downto 0);
    signal LeftShiftStage033dto0_uid138_fxpX_uid48_fpArcsinXTest_in : std_logic_vector (33 downto 0);
    signal LeftShiftStage033dto0_uid138_fxpX_uid48_fpArcsinXTest_b : std_logic_vector (33 downto 0);
    signal excRNaN_uid110_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid110_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid110_fpArcsinXTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid110_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid200_fpLOut1_uid72_fpArcsinXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid200_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid201_fpLOut1_uid72_fpArcsinXTest_q : std_logic_vector (5 downto 0);
    signal excRNaN_uid246_sqrtFPL_uid78_fpArcsinXTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid246_sqrtFPL_uid78_fpArcsinXTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid246_sqrtFPL_uid78_fpArcsinXTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid246_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector(0 downto 0);
    signal RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector (31 downto 0);
    signal leftShiftStage1Idx1_uid133_fxpX_uid48_fpArcsinXTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage1Idx2_uid136_fxpX_uid48_fpArcsinXTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage1Idx3_uid139_fxpX_uid48_fpArcsinXTest_q : std_logic_vector (36 downto 0);
    signal fpLOutFrac_uid74_fpArcsinXTest_in : std_logic_vector (33 downto 0);
    signal fpLOutFrac_uid74_fpArcsinXTest_b : std_logic_vector (22 downto 0);
    signal join_uid247_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector (2 downto 0);
    signal SqrtFPL30dto23_uid79_fpArcsinXTest_in : std_logic_vector (30 downto 0);
    signal SqrtFPL30dto23_uid79_fpArcsinXTest_b : std_logic_vector (7 downto 0);
    signal SqrtFPL22dto0_uid81_fpArcsinXTest_in : std_logic_vector (22 downto 0);
    signal SqrtFPL22dto0_uid81_fpArcsinXTest_b : std_logic_vector (22 downto 0);
    signal fracSelIn_uid248_sqrtFPL_uid78_fpArcsinXTest_q : std_logic_vector (3 downto 0);
begin


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable(LOGICAL,805)
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_a <= en;
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q <= not ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_a;

	--ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_nor(LOGICAL,921)
    ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_nor_b <= ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_sticky_ena_q;
    ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_nor_q <= not (ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_nor_a or ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_nor_b);

	--ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_mem_top(CONSTANT,841)
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_mem_top_q <= "011110";

	--ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmp(LOGICAL,842)
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmp_a <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_mem_top_q;
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdmux_q);
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmp_q <= "1" when ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmp_a = ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmp_b else "0";

	--ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmpReg(REG,843)
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmpReg_q <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_sticky_ena(REG,922)
    ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_nor_q = "1") THEN
                ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_sticky_ena_q <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_enaAnd(LOGICAL,923)
    ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_enaAnd_a <= ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_sticky_ena_q;
    ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_enaAnd_b <= en;
    ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_enaAnd_q <= ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_enaAnd_a and ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_enaAnd_b;

	--cstAllZWF_uid10_fpArcsinXTest(CONSTANT,9)
    cstAllZWF_uid10_fpArcsinXTest_q <= "00000000000000000000000";

	--fracX_uid7_fpArcsinXTest(BITSELECT,6)@0
    fracX_uid7_fpArcsinXTest_in <= a(22 downto 0);
    fracX_uid7_fpArcsinXTest_b <= fracX_uid7_fpArcsinXTest_in(22 downto 0);

	--fracXIsZero_uid26_fpArcsinXTest(LOGICAL,25)@0
    fracXIsZero_uid26_fpArcsinXTest_a <= fracX_uid7_fpArcsinXTest_b;
    fracXIsZero_uid26_fpArcsinXTest_b <= cstAllZWF_uid10_fpArcsinXTest_q;
    fracXIsZero_uid26_fpArcsinXTest_q <= "1" when fracXIsZero_uid26_fpArcsinXTest_a = fracXIsZero_uid26_fpArcsinXTest_b else "0";

	--InvFracXIsZero_uid28_fpArcsinXTest(LOGICAL,27)@0
    InvFracXIsZero_uid28_fpArcsinXTest_a <= fracXIsZero_uid26_fpArcsinXTest_q;
    InvFracXIsZero_uid28_fpArcsinXTest_q <= not InvFracXIsZero_uid28_fpArcsinXTest_a;

	--cstBias_uid13_fpArcsinXTest(CONSTANT,12)
    cstBias_uid13_fpArcsinXTest_q <= "01111111";

	--expX_uid6_fpArcsinXTest(BITSELECT,5)@0
    expX_uid6_fpArcsinXTest_in <= a(30 downto 0);
    expX_uid6_fpArcsinXTest_b <= expX_uid6_fpArcsinXTest_in(30 downto 23);

	--expEQ0_uid36_fpArcsinXTest(LOGICAL,35)@0
    expEQ0_uid36_fpArcsinXTest_a <= expX_uid6_fpArcsinXTest_b;
    expEQ0_uid36_fpArcsinXTest_b <= cstBias_uid13_fpArcsinXTest_q;
    expEQ0_uid36_fpArcsinXTest_q <= "1" when expEQ0_uid36_fpArcsinXTest_a = expEQ0_uid36_fpArcsinXTest_b else "0";

	--exp0FracNotZero_uid38_fpArcsinXTest(LOGICAL,37)@0
    exp0FracNotZero_uid38_fpArcsinXTest_a <= expEQ0_uid36_fpArcsinXTest_q;
    exp0FracNotZero_uid38_fpArcsinXTest_b <= InvFracXIsZero_uid28_fpArcsinXTest_q;
    exp0FracNotZero_uid38_fpArcsinXTest_q <= exp0FracNotZero_uid38_fpArcsinXTest_a and exp0FracNotZero_uid38_fpArcsinXTest_b;

	--GND(CONSTANT,0)
    GND_q <= "0";

	--expGT0_uid35_fpArcsinXTest(COMPARE,34)@0
    expGT0_uid35_fpArcsinXTest_cin <= GND_q;
    expGT0_uid35_fpArcsinXTest_a <= STD_LOGIC_VECTOR("00" & cstBias_uid13_fpArcsinXTest_q) & '0';
    expGT0_uid35_fpArcsinXTest_b <= STD_LOGIC_VECTOR("00" & expX_uid6_fpArcsinXTest_b) & expGT0_uid35_fpArcsinXTest_cin(0);
            expGT0_uid35_fpArcsinXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expGT0_uid35_fpArcsinXTest_a) - UNSIGNED(expGT0_uid35_fpArcsinXTest_b));
    expGT0_uid35_fpArcsinXTest_c(0) <= expGT0_uid35_fpArcsinXTest_o(10);


	--inputOutOfRange_uid39_fpArcsinXTest(LOGICAL,38)@0
    inputOutOfRange_uid39_fpArcsinXTest_a <= expGT0_uid35_fpArcsinXTest_c;
    inputOutOfRange_uid39_fpArcsinXTest_b <= exp0FracNotZero_uid38_fpArcsinXTest_q;
    inputOutOfRange_uid39_fpArcsinXTest_q <= inputOutOfRange_uid39_fpArcsinXTest_a or inputOutOfRange_uid39_fpArcsinXTest_b;

	--InvExc_N_uid30_fpArcsinXTest(LOGICAL,29)@0
    InvExc_N_uid30_fpArcsinXTest_a <= exc_N_uid29_fpArcsinXTest_q;
    InvExc_N_uid30_fpArcsinXTest_q <= not InvExc_N_uid30_fpArcsinXTest_a;

	--InvExc_I_uid31_fpArcsinXTest(LOGICAL,30)@0
    InvExc_I_uid31_fpArcsinXTest_a <= exc_I_uid27_fpArcsinXTest_q;
    InvExc_I_uid31_fpArcsinXTest_q <= not InvExc_I_uid31_fpArcsinXTest_a;

	--cstAllZWE_uid12_fpArcsinXTest(CONSTANT,11)
    cstAllZWE_uid12_fpArcsinXTest_q <= "00000000";

	--expXIsZero_uid22_fpArcsinXTest(LOGICAL,21)@0
    expXIsZero_uid22_fpArcsinXTest_a <= expX_uid6_fpArcsinXTest_b;
    expXIsZero_uid22_fpArcsinXTest_b <= cstAllZWE_uid12_fpArcsinXTest_q;
    expXIsZero_uid22_fpArcsinXTest_q <= "1" when expXIsZero_uid22_fpArcsinXTest_a = expXIsZero_uid22_fpArcsinXTest_b else "0";

	--InvExpXIsZero_uid32_fpArcsinXTest(LOGICAL,31)@0
    InvExpXIsZero_uid32_fpArcsinXTest_a <= expXIsZero_uid22_fpArcsinXTest_q;
    InvExpXIsZero_uid32_fpArcsinXTest_q <= not InvExpXIsZero_uid32_fpArcsinXTest_a;

	--exc_R_uid33_fpArcsinXTest(LOGICAL,32)@0
    exc_R_uid33_fpArcsinXTest_a <= InvExpXIsZero_uid32_fpArcsinXTest_q;
    exc_R_uid33_fpArcsinXTest_b <= InvExc_I_uid31_fpArcsinXTest_q;
    exc_R_uid33_fpArcsinXTest_c <= InvExc_N_uid30_fpArcsinXTest_q;
    exc_R_uid33_fpArcsinXTest_q <= exc_R_uid33_fpArcsinXTest_a and exc_R_uid33_fpArcsinXTest_b and exc_R_uid33_fpArcsinXTest_c;

	--xRegInOutOfRange_uid109_fpArcsinXTest(LOGICAL,108)@0
    xRegInOutOfRange_uid109_fpArcsinXTest_a <= exc_R_uid33_fpArcsinXTest_q;
    xRegInOutOfRange_uid109_fpArcsinXTest_b <= inputOutOfRange_uid39_fpArcsinXTest_q;
    xRegInOutOfRange_uid109_fpArcsinXTest_q <= xRegInOutOfRange_uid109_fpArcsinXTest_a and xRegInOutOfRange_uid109_fpArcsinXTest_b;

	--cstAllOWE_uid9_fpArcsinXTest(CONSTANT,8)
    cstAllOWE_uid9_fpArcsinXTest_q <= "11111111";

	--expXIsMax_uid24_fpArcsinXTest(LOGICAL,23)@0
    expXIsMax_uid24_fpArcsinXTest_a <= expX_uid6_fpArcsinXTest_b;
    expXIsMax_uid24_fpArcsinXTest_b <= cstAllOWE_uid9_fpArcsinXTest_q;
    expXIsMax_uid24_fpArcsinXTest_q <= "1" when expXIsMax_uid24_fpArcsinXTest_a = expXIsMax_uid24_fpArcsinXTest_b else "0";

	--exc_I_uid27_fpArcsinXTest(LOGICAL,26)@0
    exc_I_uid27_fpArcsinXTest_a <= expXIsMax_uid24_fpArcsinXTest_q;
    exc_I_uid27_fpArcsinXTest_b <= fracXIsZero_uid26_fpArcsinXTest_q;
    exc_I_uid27_fpArcsinXTest_q <= exc_I_uid27_fpArcsinXTest_a and exc_I_uid27_fpArcsinXTest_b;

	--exc_N_uid29_fpArcsinXTest(LOGICAL,28)@0
    exc_N_uid29_fpArcsinXTest_a <= expXIsMax_uid24_fpArcsinXTest_q;
    exc_N_uid29_fpArcsinXTest_b <= InvFracXIsZero_uid28_fpArcsinXTest_q;
    exc_N_uid29_fpArcsinXTest_q <= exc_N_uid29_fpArcsinXTest_a and exc_N_uid29_fpArcsinXTest_b;

	--excRNaN_uid110_fpArcsinXTest(LOGICAL,109)@0
    excRNaN_uid110_fpArcsinXTest_a <= exc_N_uid29_fpArcsinXTest_q;
    excRNaN_uid110_fpArcsinXTest_b <= exc_I_uid27_fpArcsinXTest_q;
    excRNaN_uid110_fpArcsinXTest_c <= xRegInOutOfRange_uid109_fpArcsinXTest_q;
    excRNaN_uid110_fpArcsinXTest_q <= excRNaN_uid110_fpArcsinXTest_a or excRNaN_uid110_fpArcsinXTest_b or excRNaN_uid110_fpArcsinXTest_c;

	--InvExcRNaN_uid115_fpArcsinXTest(LOGICAL,114)@0
    InvExcRNaN_uid115_fpArcsinXTest_a <= excRNaN_uid110_fpArcsinXTest_q;
    InvExcRNaN_uid115_fpArcsinXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExcRNaN_uid115_fpArcsinXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExcRNaN_uid115_fpArcsinXTest_q <= not InvExcRNaN_uid115_fpArcsinXTest_a;
        END IF;
    END PROCESS;



	--singX_uid8_fpArcsinXTest(BITSELECT,7)@0
    singX_uid8_fpArcsinXTest_in <= a;
    singX_uid8_fpArcsinXTest_b <= singX_uid8_fpArcsinXTest_in(31 downto 31);

	--reg_singX_uid8_fpArcsinXTest_0_to_signR_uid116_fpArcsinXTest_1(REG,402)@0
    reg_singX_uid8_fpArcsinXTest_0_to_signR_uid116_fpArcsinXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_singX_uid8_fpArcsinXTest_0_to_signR_uid116_fpArcsinXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_singX_uid8_fpArcsinXTest_0_to_signR_uid116_fpArcsinXTest_1_q <= singX_uid8_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--signR_uid116_fpArcsinXTest(LOGICAL,115)@1
    signR_uid116_fpArcsinXTest_a <= reg_singX_uid8_fpArcsinXTest_0_to_signR_uid116_fpArcsinXTest_1_q;
    signR_uid116_fpArcsinXTest_b <= InvExcRNaN_uid115_fpArcsinXTest_q;
    signR_uid116_fpArcsinXTest_q <= signR_uid116_fpArcsinXTest_a and signR_uid116_fpArcsinXTest_b;

	--ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt(COUNTER,837)
    -- every=1, low=0, high=30, step=1, init=1
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_i = 29 THEN
                      ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_eq = '1') THEN
                        ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_i <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_i - 30;
                    ELSE
                        ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_i <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_i,5));


	--ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdreg(REG,838)
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdreg_q <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--xIn(GPIN,3)@0

	--ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdmux(MUX,839)
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdmux_s <= en;
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdmux: PROCESS (ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdmux_s, ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdreg_q, ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdmux_q <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdreg_q;
                  WHEN "1" => ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdmux_q <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem(DUALMEM,912)
    ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_reset0 <= areset;
    ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_ia <= signR_uid116_fpArcsinXTest_q;
    ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_aa <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdreg_q;
    ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_ab <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdmux_q;
    ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_dmem : altsyncram
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
        clocken1 => ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_iq,
        address_a => ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_aa,
        data_a => ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_ia
    );
        ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_q <= ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_iq(0 downto 0);

	--cstBiasM1_uid14_fpArcsinXTest(CONSTANT,13)
    cstBiasM1_uid14_fpArcsinXTest_q <= "01111110";

	--RightShiftStage125dto1_uid284_alignSqrt_uid86_fpArcsinXTest(BITSELECT,283)@19
    RightShiftStage125dto1_uid284_alignSqrt_uid86_fpArcsinXTest_in <= rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_q;
    RightShiftStage125dto1_uid284_alignSqrt_uid86_fpArcsinXTest_b <= RightShiftStage125dto1_uid284_alignSqrt_uid86_fpArcsinXTest_in(25 downto 1);

	--rightShiftStage2Idx1_uid286_alignSqrt_uid86_fpArcsinXTest(BITJOIN,285)@19
    rightShiftStage2Idx1_uid286_alignSqrt_uid86_fpArcsinXTest_q <= GND_q & RightShiftStage125dto1_uid284_alignSqrt_uid86_fpArcsinXTest_b;

	--rightShiftStage1Idx3Pad6_uid280_alignSqrt_uid86_fpArcsinXTest(CONSTANT,279)
    rightShiftStage1Idx3Pad6_uid280_alignSqrt_uid86_fpArcsinXTest_q <= "000000";

	--rightShiftStage0Idx3Pad24_uid269_alignSqrt_uid86_fpArcsinXTest(CONSTANT,268)
    rightShiftStage0Idx3Pad24_uid269_alignSqrt_uid86_fpArcsinXTest_q <= "000000000000000000000000";

	--X25dto24_uid268_alignSqrt_uid86_fpArcsinXTest(BITSELECT,267)@18
    X25dto24_uid268_alignSqrt_uid86_fpArcsinXTest_in <= oSqrtFPLFracZ2_uid85_fpArcsinXTest_q;
    X25dto24_uid268_alignSqrt_uid86_fpArcsinXTest_b <= X25dto24_uid268_alignSqrt_uid86_fpArcsinXTest_in(25 downto 24);

	--rightShiftStage0Idx3_uid270_alignSqrt_uid86_fpArcsinXTest(BITJOIN,269)@18
    rightShiftStage0Idx3_uid270_alignSqrt_uid86_fpArcsinXTest_q <= rightShiftStage0Idx3Pad24_uid269_alignSqrt_uid86_fpArcsinXTest_q & X25dto24_uid268_alignSqrt_uid86_fpArcsinXTest_b;

	--zs_uid166_fpLOut1_uid72_fpArcsinXTest(CONSTANT,165)
    zs_uid166_fpLOut1_uid72_fpArcsinXTest_q <= "0000000000000000";

	--X25dto16_uid265_alignSqrt_uid86_fpArcsinXTest(BITSELECT,264)@18
    X25dto16_uid265_alignSqrt_uid86_fpArcsinXTest_in <= oSqrtFPLFracZ2_uid85_fpArcsinXTest_q;
    X25dto16_uid265_alignSqrt_uid86_fpArcsinXTest_b <= X25dto16_uid265_alignSqrt_uid86_fpArcsinXTest_in(25 downto 16);

	--rightShiftStage0Idx2_uid267_alignSqrt_uid86_fpArcsinXTest(BITJOIN,266)@18
    rightShiftStage0Idx2_uid267_alignSqrt_uid86_fpArcsinXTest_q <= zs_uid166_fpLOut1_uid72_fpArcsinXTest_q & X25dto16_uid265_alignSqrt_uid86_fpArcsinXTest_b;

	--X25dto8_uid262_alignSqrt_uid86_fpArcsinXTest(BITSELECT,261)@18
    X25dto8_uid262_alignSqrt_uid86_fpArcsinXTest_in <= oSqrtFPLFracZ2_uid85_fpArcsinXTest_q;
    X25dto8_uid262_alignSqrt_uid86_fpArcsinXTest_b <= X25dto8_uid262_alignSqrt_uid86_fpArcsinXTest_in(25 downto 8);

	--rightShiftStage0Idx1_uid264_alignSqrt_uid86_fpArcsinXTest(BITJOIN,263)@18
    rightShiftStage0Idx1_uid264_alignSqrt_uid86_fpArcsinXTest_q <= cstAllZWE_uid12_fpArcsinXTest_q & X25dto8_uid262_alignSqrt_uid86_fpArcsinXTest_b;

	--maxCountVal_uid202_fpLOut1_uid72_fpArcsinXTest(CONSTANT,201)
    maxCountVal_uid202_fpLOut1_uid72_fpArcsinXTest_q <= "100011";

	--zs_uid159_fpLOut1_uid72_fpArcsinXTest(CONSTANT,158)
    zs_uid159_fpLOut1_uid72_fpArcsinXTest_q <= "00000000000000000000000000000000";

	--X24dto0_uid127_fxpX_uid48_fpArcsinXTest(BITSELECT,126)@0
    X24dto0_uid127_fxpX_uid48_fpArcsinXTest_in <= oFracXExt_uid46_fpArcsinXTest_q(24 downto 0);
    X24dto0_uid127_fxpX_uid48_fpArcsinXTest_b <= X24dto0_uid127_fxpX_uid48_fpArcsinXTest_in(24 downto 0);

	--leftShiftStage0Idx3Pad12_uid126_fxpX_uid48_fpArcsinXTest(CONSTANT,125)
    leftShiftStage0Idx3Pad12_uid126_fxpX_uid48_fpArcsinXTest_q <= "000000000000";

	--leftShiftStage0Idx3_uid128_fxpX_uid48_fpArcsinXTest(BITJOIN,127)@0
    leftShiftStage0Idx3_uid128_fxpX_uid48_fpArcsinXTest_q <= X24dto0_uid127_fxpX_uid48_fpArcsinXTest_b & leftShiftStage0Idx3Pad12_uid126_fxpX_uid48_fpArcsinXTest_q;

	--X28dto0_uid124_fxpX_uid48_fpArcsinXTest(BITSELECT,123)@0
    X28dto0_uid124_fxpX_uid48_fpArcsinXTest_in <= oFracXExt_uid46_fpArcsinXTest_q(28 downto 0);
    X28dto0_uid124_fxpX_uid48_fpArcsinXTest_b <= X28dto0_uid124_fxpX_uid48_fpArcsinXTest_in(28 downto 0);

	--leftShiftStage0Idx2_uid125_fxpX_uid48_fpArcsinXTest(BITJOIN,124)@0
    leftShiftStage0Idx2_uid125_fxpX_uid48_fpArcsinXTest_q <= X28dto0_uid124_fxpX_uid48_fpArcsinXTest_b & cstAllZWE_uid12_fpArcsinXTest_q;

	--X32dto0_uid121_fxpX_uid48_fpArcsinXTest(BITSELECT,120)@0
    X32dto0_uid121_fxpX_uid48_fpArcsinXTest_in <= oFracXExt_uid46_fpArcsinXTest_q(32 downto 0);
    X32dto0_uid121_fxpX_uid48_fpArcsinXTest_b <= X32dto0_uid121_fxpX_uid48_fpArcsinXTest_in(32 downto 0);

	--leftShiftStage0Idx1Pad4_uid120_fxpX_uid48_fpArcsinXTest(CONSTANT,119)
    leftShiftStage0Idx1Pad4_uid120_fxpX_uid48_fpArcsinXTest_q <= "0000";

	--leftShiftStage0Idx1_uid122_fxpX_uid48_fpArcsinXTest(BITJOIN,121)@0
    leftShiftStage0Idx1_uid122_fxpX_uid48_fpArcsinXTest_q <= X32dto0_uid121_fxpX_uid48_fpArcsinXTest_b & leftShiftStage0Idx1Pad4_uid120_fxpX_uid48_fpArcsinXTest_q;

	--cst01pWShift_uid45_fpArcsinXTest(CONSTANT,44)
    cst01pWShift_uid45_fpArcsinXTest_q <= "0000000000000";

	--oFracX_uid40_uid40_fpArcsinXTest(BITJOIN,39)@0
    oFracX_uid40_uid40_fpArcsinXTest_q <= VCC_q & fracX_uid7_fpArcsinXTest_b;

	--oFracXExt_uid46_fpArcsinXTest(BITJOIN,45)@0
    oFracXExt_uid46_fpArcsinXTest_q <= cst01pWShift_uid45_fpArcsinXTest_q & oFracX_uid40_uid40_fpArcsinXTest_q;

	--shiftBias_uid43_fpArcsinXTest(CONSTANT,42)
    shiftBias_uid43_fpArcsinXTest_q <= "01110010";

	--shiftValue_uid44_fpArcsinXTest(SUB,43)@0
    shiftValue_uid44_fpArcsinXTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpArcsinXTest_b);
    shiftValue_uid44_fpArcsinXTest_b <= STD_LOGIC_VECTOR("0" & shiftBias_uid43_fpArcsinXTest_q);
            shiftValue_uid44_fpArcsinXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValue_uid44_fpArcsinXTest_a) - UNSIGNED(shiftValue_uid44_fpArcsinXTest_b));
    shiftValue_uid44_fpArcsinXTest_q <= shiftValue_uid44_fpArcsinXTest_o(8 downto 0);


	--fxpShifterBits_uid47_fpArcsinXTest(BITSELECT,46)@0
    fxpShifterBits_uid47_fpArcsinXTest_in <= shiftValue_uid44_fpArcsinXTest_q(3 downto 0);
    fxpShifterBits_uid47_fpArcsinXTest_b <= fxpShifterBits_uid47_fpArcsinXTest_in(3 downto 0);

	--leftShiftStageSel3Dto2_uid129_fxpX_uid48_fpArcsinXTest(BITSELECT,128)@0
    leftShiftStageSel3Dto2_uid129_fxpX_uid48_fpArcsinXTest_in <= fxpShifterBits_uid47_fpArcsinXTest_b;
    leftShiftStageSel3Dto2_uid129_fxpX_uid48_fpArcsinXTest_b <= leftShiftStageSel3Dto2_uid129_fxpX_uid48_fpArcsinXTest_in(3 downto 2);

	--leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest(MUX,129)@0
    leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_s <= leftShiftStageSel3Dto2_uid129_fxpX_uid48_fpArcsinXTest_b;
    leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest: PROCESS (leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_s, en, oFracXExt_uid46_fpArcsinXTest_q, leftShiftStage0Idx1_uid122_fxpX_uid48_fpArcsinXTest_q, leftShiftStage0Idx2_uid125_fxpX_uid48_fpArcsinXTest_q, leftShiftStage0Idx3_uid128_fxpX_uid48_fpArcsinXTest_q)
    BEGIN
            CASE leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_s IS
                  WHEN "00" => leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_q <= oFracXExt_uid46_fpArcsinXTest_q;
                  WHEN "01" => leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_q <= leftShiftStage0Idx1_uid122_fxpX_uid48_fpArcsinXTest_q;
                  WHEN "10" => leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_q <= leftShiftStage0Idx2_uid125_fxpX_uid48_fpArcsinXTest_q;
                  WHEN "11" => leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_q <= leftShiftStage0Idx3_uid128_fxpX_uid48_fpArcsinXTest_q;
                  WHEN OTHERS => leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage033dto0_uid138_fxpX_uid48_fpArcsinXTest(BITSELECT,137)@0
    LeftShiftStage033dto0_uid138_fxpX_uid48_fpArcsinXTest_in <= leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_q(33 downto 0);
    LeftShiftStage033dto0_uid138_fxpX_uid48_fpArcsinXTest_b <= LeftShiftStage033dto0_uid138_fxpX_uid48_fpArcsinXTest_in(33 downto 0);

	--leftShiftStage1Idx3Pad3_uid137_fxpX_uid48_fpArcsinXTest(CONSTANT,136)
    leftShiftStage1Idx3Pad3_uid137_fxpX_uid48_fpArcsinXTest_q <= "000";

	--leftShiftStage1Idx3_uid139_fxpX_uid48_fpArcsinXTest(BITJOIN,138)@0
    leftShiftStage1Idx3_uid139_fxpX_uid48_fpArcsinXTest_q <= LeftShiftStage033dto0_uid138_fxpX_uid48_fpArcsinXTest_b & leftShiftStage1Idx3Pad3_uid137_fxpX_uid48_fpArcsinXTest_q;

	--reg_leftShiftStage1Idx3_uid139_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_5(REG,353)@0
    reg_leftShiftStage1Idx3_uid139_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid139_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_5_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid139_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_5_q <= leftShiftStage1Idx3_uid139_fxpX_uid48_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage034dto0_uid135_fxpX_uid48_fpArcsinXTest(BITSELECT,134)@0
    LeftShiftStage034dto0_uid135_fxpX_uid48_fpArcsinXTest_in <= leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_q(34 downto 0);
    LeftShiftStage034dto0_uid135_fxpX_uid48_fpArcsinXTest_b <= LeftShiftStage034dto0_uid135_fxpX_uid48_fpArcsinXTest_in(34 downto 0);

	--leftShiftStage1Idx2_uid136_fxpX_uid48_fpArcsinXTest(BITJOIN,135)@0
    leftShiftStage1Idx2_uid136_fxpX_uid48_fpArcsinXTest_q <= LeftShiftStage034dto0_uid135_fxpX_uid48_fpArcsinXTest_b & z2_uid84_fpArcsinXTest_q;

	--reg_leftShiftStage1Idx2_uid136_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_4(REG,352)@0
    reg_leftShiftStage1Idx2_uid136_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid136_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_4_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid136_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_4_q <= leftShiftStage1Idx2_uid136_fxpX_uid48_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage035dto0_uid132_fxpX_uid48_fpArcsinXTest(BITSELECT,131)@0
    LeftShiftStage035dto0_uid132_fxpX_uid48_fpArcsinXTest_in <= leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_q(35 downto 0);
    LeftShiftStage035dto0_uid132_fxpX_uid48_fpArcsinXTest_b <= LeftShiftStage035dto0_uid132_fxpX_uid48_fpArcsinXTest_in(35 downto 0);

	--leftShiftStage1Idx1_uid133_fxpX_uid48_fpArcsinXTest(BITJOIN,132)@0
    leftShiftStage1Idx1_uid133_fxpX_uid48_fpArcsinXTest_q <= LeftShiftStage035dto0_uid132_fxpX_uid48_fpArcsinXTest_b & GND_q;

	--reg_leftShiftStage1Idx1_uid133_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_3(REG,351)@0
    reg_leftShiftStage1Idx1_uid133_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid133_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_3_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid133_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_3_q <= leftShiftStage1Idx1_uid133_fxpX_uid48_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_2(REG,350)@0
    reg_leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_2_q <= leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid140_fxpX_uid48_fpArcsinXTest(BITSELECT,139)@0
    leftShiftStageSel1Dto0_uid140_fxpX_uid48_fpArcsinXTest_in <= fxpShifterBits_uid47_fpArcsinXTest_b(1 downto 0);
    leftShiftStageSel1Dto0_uid140_fxpX_uid48_fpArcsinXTest_b <= leftShiftStageSel1Dto0_uid140_fxpX_uid48_fpArcsinXTest_in(1 downto 0);

	--reg_leftShiftStageSel1Dto0_uid140_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_1(REG,349)@0
    reg_leftShiftStageSel1Dto0_uid140_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid140_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid140_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_1_q <= leftShiftStageSel1Dto0_uid140_fxpX_uid48_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest(MUX,140)@1
    leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_s <= reg_leftShiftStageSel1Dto0_uid140_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_1_q;
    leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest: PROCESS (leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_s, en, reg_leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_2_q, reg_leftShiftStage1Idx1_uid133_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_3_q, reg_leftShiftStage1Idx2_uid136_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_4_q, reg_leftShiftStage1Idx3_uid139_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_s IS
                  WHEN "00" => leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_q <= reg_leftShiftStage0_uid130_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_2_q;
                  WHEN "01" => leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_q <= reg_leftShiftStage1Idx1_uid133_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_3_q;
                  WHEN "10" => leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_q <= reg_leftShiftStage1Idx2_uid136_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_4_q;
                  WHEN "11" => leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_q <= reg_leftShiftStage1Idx3_uid139_fxpX_uid48_fpArcsinXTest_0_to_leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--y_uid50_fpArcsinXTest(BITSELECT,49)@1
    y_uid50_fpArcsinXTest_in <= leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_q(35 downto 0);
    y_uid50_fpArcsinXTest_b <= y_uid50_fpArcsinXTest_in(35 downto 1);

	--pad_o_uid16_uid69_fpArcsinXTest(BITJOIN,68)@1
    pad_o_uid16_uid69_fpArcsinXTest_q <= VCC_q & STD_LOGIC_VECTOR((34 downto 1 => GND_q(0)) & GND_q);

	--oMy_uid69_fpArcsinXTest(SUB,69)@1
    oMy_uid69_fpArcsinXTest_a <= STD_LOGIC_VECTOR("0" & pad_o_uid16_uid69_fpArcsinXTest_q);
    oMy_uid69_fpArcsinXTest_b <= STD_LOGIC_VECTOR("00" & y_uid50_fpArcsinXTest_b);
            oMy_uid69_fpArcsinXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMy_uid69_fpArcsinXTest_a) - UNSIGNED(oMy_uid69_fpArcsinXTest_b));
    oMy_uid69_fpArcsinXTest_q <= oMy_uid69_fpArcsinXTest_o(36 downto 0);


	--l_uid71_fpArcsinXTest(BITSELECT,70)@1
    l_uid71_fpArcsinXTest_in <= oMy_uid69_fpArcsinXTest_q(34 downto 0);
    l_uid71_fpArcsinXTest_b <= l_uid71_fpArcsinXTest_in(34 downto 0);

	--rVStage_uid160_fpLOut1_uid72_fpArcsinXTest(BITSELECT,159)@1
    rVStage_uid160_fpLOut1_uid72_fpArcsinXTest_in <= l_uid71_fpArcsinXTest_b;
    rVStage_uid160_fpLOut1_uid72_fpArcsinXTest_b <= rVStage_uid160_fpLOut1_uid72_fpArcsinXTest_in(34 downto 3);

	--reg_rVStage_uid160_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid161_fpLOut1_uid72_fpArcsinXTest_1(REG,363)@1
    reg_rVStage_uid160_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid161_fpLOut1_uid72_fpArcsinXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid160_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid161_fpLOut1_uid72_fpArcsinXTest_1_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid160_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid161_fpLOut1_uid72_fpArcsinXTest_1_q <= rVStage_uid160_fpLOut1_uid72_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid161_fpLOut1_uid72_fpArcsinXTest(LOGICAL,160)@2
    vCount_uid161_fpLOut1_uid72_fpArcsinXTest_a <= reg_rVStage_uid160_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid161_fpLOut1_uid72_fpArcsinXTest_1_q;
    vCount_uid161_fpLOut1_uid72_fpArcsinXTest_b <= zs_uid159_fpLOut1_uid72_fpArcsinXTest_q;
    vCount_uid161_fpLOut1_uid72_fpArcsinXTest_q <= "1" when vCount_uid161_fpLOut1_uid72_fpArcsinXTest_a = vCount_uid161_fpLOut1_uid72_fpArcsinXTest_b else "0";

	--ld_vCount_uid161_fpLOut1_uid72_fpArcsinXTest_q_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_f(DELAY,599)@2
    ld_vCount_uid161_fpLOut1_uid72_fpArcsinXTest_q_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid161_fpLOut1_uid72_fpArcsinXTest_q, xout => ld_vCount_uid161_fpLOut1_uid72_fpArcsinXTest_q_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid163_fpLOut1_uid72_fpArcsinXTest(BITSELECT,162)@1
    vStage_uid163_fpLOut1_uid72_fpArcsinXTest_in <= l_uid71_fpArcsinXTest_b(2 downto 0);
    vStage_uid163_fpLOut1_uid72_fpArcsinXTest_b <= vStage_uid163_fpLOut1_uid72_fpArcsinXTest_in(2 downto 0);

	--cStage_uid164_fpLOut1_uid72_fpArcsinXTest(BITJOIN,163)@1
    cStage_uid164_fpLOut1_uid72_fpArcsinXTest_q <= vStage_uid163_fpLOut1_uid72_fpArcsinXTest_b & zs_uid159_fpLOut1_uid72_fpArcsinXTest_q;

	--reg_cStage_uid164_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_3(REG,365)@1
    reg_cStage_uid164_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid164_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid164_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_3_q <= cStage_uid164_fpLOut1_uid72_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_l_uid71_fpArcsinXTest_0_to_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_2(REG,364)@1
    reg_l_uid71_fpArcsinXTest_0_to_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_l_uid71_fpArcsinXTest_0_to_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_l_uid71_fpArcsinXTest_0_to_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_2_q <= l_uid71_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid165_fpLOut1_uid72_fpArcsinXTest(MUX,164)@2
    vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_s <= vCount_uid161_fpLOut1_uid72_fpArcsinXTest_q;
    vStagei_uid165_fpLOut1_uid72_fpArcsinXTest: PROCESS (vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_s, en, reg_l_uid71_fpArcsinXTest_0_to_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_2_q, reg_cStage_uid164_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_3_q)
    BEGIN
            CASE vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_s IS
                  WHEN "0" => vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_q <= reg_l_uid71_fpArcsinXTest_0_to_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_2_q;
                  WHEN "1" => vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_q <= reg_cStage_uid164_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_3_q;
                  WHEN OTHERS => vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid167_fpLOut1_uid72_fpArcsinXTest(BITSELECT,166)@2
    rVStage_uid167_fpLOut1_uid72_fpArcsinXTest_in <= vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_q;
    rVStage_uid167_fpLOut1_uid72_fpArcsinXTest_b <= rVStage_uid167_fpLOut1_uid72_fpArcsinXTest_in(34 downto 19);

	--reg_rVStage_uid167_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid168_fpLOut1_uid72_fpArcsinXTest_1(REG,366)@2
    reg_rVStage_uid167_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid168_fpLOut1_uid72_fpArcsinXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid167_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid168_fpLOut1_uid72_fpArcsinXTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid167_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid168_fpLOut1_uid72_fpArcsinXTest_1_q <= rVStage_uid167_fpLOut1_uid72_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid168_fpLOut1_uid72_fpArcsinXTest(LOGICAL,167)@3
    vCount_uid168_fpLOut1_uid72_fpArcsinXTest_a <= reg_rVStage_uid167_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid168_fpLOut1_uid72_fpArcsinXTest_1_q;
    vCount_uid168_fpLOut1_uid72_fpArcsinXTest_b <= zs_uid166_fpLOut1_uid72_fpArcsinXTest_q;
    vCount_uid168_fpLOut1_uid72_fpArcsinXTest_q <= "1" when vCount_uid168_fpLOut1_uid72_fpArcsinXTest_a = vCount_uid168_fpLOut1_uid72_fpArcsinXTest_b else "0";

	--ld_vCount_uid168_fpLOut1_uid72_fpArcsinXTest_q_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_e(DELAY,598)@3
    ld_vCount_uid168_fpLOut1_uid72_fpArcsinXTest_q_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid168_fpLOut1_uid72_fpArcsinXTest_q, xout => ld_vCount_uid168_fpLOut1_uid72_fpArcsinXTest_q_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid170_fpLOut1_uid72_fpArcsinXTest(BITSELECT,169)@2
    vStage_uid170_fpLOut1_uid72_fpArcsinXTest_in <= vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_q(18 downto 0);
    vStage_uid170_fpLOut1_uid72_fpArcsinXTest_b <= vStage_uid170_fpLOut1_uid72_fpArcsinXTest_in(18 downto 0);

	--cStage_uid171_fpLOut1_uid72_fpArcsinXTest(BITJOIN,170)@2
    cStage_uid171_fpLOut1_uid72_fpArcsinXTest_q <= vStage_uid170_fpLOut1_uid72_fpArcsinXTest_b & zs_uid166_fpLOut1_uid72_fpArcsinXTest_q;

	--reg_cStage_uid171_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_3(REG,368)@2
    reg_cStage_uid171_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid171_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid171_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_3_q <= cStage_uid171_fpLOut1_uid72_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_2(REG,367)@2
    reg_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_2_q <= vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid172_fpLOut1_uid72_fpArcsinXTest(MUX,171)@3
    vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_s <= vCount_uid168_fpLOut1_uid72_fpArcsinXTest_q;
    vStagei_uid172_fpLOut1_uid72_fpArcsinXTest: PROCESS (vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_s, en, reg_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_2_q, reg_cStage_uid171_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_3_q)
    BEGIN
            CASE vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_s IS
                  WHEN "0" => vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_q <= reg_vStagei_uid165_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_2_q;
                  WHEN "1" => vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_q <= reg_cStage_uid171_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_3_q;
                  WHEN OTHERS => vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid174_fpLOut1_uid72_fpArcsinXTest(BITSELECT,173)@3
    rVStage_uid174_fpLOut1_uid72_fpArcsinXTest_in <= vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_q;
    rVStage_uid174_fpLOut1_uid72_fpArcsinXTest_b <= rVStage_uid174_fpLOut1_uid72_fpArcsinXTest_in(34 downto 27);

	--vCount_uid175_fpLOut1_uid72_fpArcsinXTest(LOGICAL,174)@3
    vCount_uid175_fpLOut1_uid72_fpArcsinXTest_a <= rVStage_uid174_fpLOut1_uid72_fpArcsinXTest_b;
    vCount_uid175_fpLOut1_uid72_fpArcsinXTest_b <= cstAllZWE_uid12_fpArcsinXTest_q;
    vCount_uid175_fpLOut1_uid72_fpArcsinXTest_q <= "1" when vCount_uid175_fpLOut1_uid72_fpArcsinXTest_a = vCount_uid175_fpLOut1_uid72_fpArcsinXTest_b else "0";

	--reg_vCount_uid175_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_3(REG,372)@3
    reg_vCount_uid175_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid175_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid175_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_3_q <= vCount_uid175_fpLOut1_uid72_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid177_fpLOut1_uid72_fpArcsinXTest(BITSELECT,176)@3
    vStage_uid177_fpLOut1_uid72_fpArcsinXTest_in <= vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_q(26 downto 0);
    vStage_uid177_fpLOut1_uid72_fpArcsinXTest_b <= vStage_uid177_fpLOut1_uid72_fpArcsinXTest_in(26 downto 0);

	--cStage_uid178_fpLOut1_uid72_fpArcsinXTest(BITJOIN,177)@3
    cStage_uid178_fpLOut1_uid72_fpArcsinXTest_q <= vStage_uid177_fpLOut1_uid72_fpArcsinXTest_b & cstAllZWE_uid12_fpArcsinXTest_q;

	--vStagei_uid179_fpLOut1_uid72_fpArcsinXTest(MUX,178)@3
    vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_s <= vCount_uid175_fpLOut1_uid72_fpArcsinXTest_q;
    vStagei_uid179_fpLOut1_uid72_fpArcsinXTest: PROCESS (vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_s, en, vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_q, cStage_uid178_fpLOut1_uid72_fpArcsinXTest_q)
    BEGIN
            CASE vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_s IS
                  WHEN "0" => vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_q <= vStagei_uid172_fpLOut1_uid72_fpArcsinXTest_q;
                  WHEN "1" => vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_q <= cStage_uid178_fpLOut1_uid72_fpArcsinXTest_q;
                  WHEN OTHERS => vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid181_fpLOut1_uid72_fpArcsinXTest(BITSELECT,180)@3
    rVStage_uid181_fpLOut1_uid72_fpArcsinXTest_in <= vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_q;
    rVStage_uid181_fpLOut1_uid72_fpArcsinXTest_b <= rVStage_uid181_fpLOut1_uid72_fpArcsinXTest_in(34 downto 31);

	--reg_rVStage_uid181_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid182_fpLOut1_uid72_fpArcsinXTest_1(REG,369)@3
    reg_rVStage_uid181_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid182_fpLOut1_uid72_fpArcsinXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid181_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid182_fpLOut1_uid72_fpArcsinXTest_1_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid181_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid182_fpLOut1_uid72_fpArcsinXTest_1_q <= rVStage_uid181_fpLOut1_uid72_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid182_fpLOut1_uid72_fpArcsinXTest(LOGICAL,181)@4
    vCount_uid182_fpLOut1_uid72_fpArcsinXTest_a <= reg_rVStage_uid181_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid182_fpLOut1_uid72_fpArcsinXTest_1_q;
    vCount_uid182_fpLOut1_uid72_fpArcsinXTest_b <= leftShiftStage0Idx1Pad4_uid120_fxpX_uid48_fpArcsinXTest_q;
    vCount_uid182_fpLOut1_uid72_fpArcsinXTest_q <= "1" when vCount_uid182_fpLOut1_uid72_fpArcsinXTest_a = vCount_uid182_fpLOut1_uid72_fpArcsinXTest_b else "0";

	--vStage_uid184_fpLOut1_uid72_fpArcsinXTest(BITSELECT,183)@3
    vStage_uid184_fpLOut1_uid72_fpArcsinXTest_in <= vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_q(30 downto 0);
    vStage_uid184_fpLOut1_uid72_fpArcsinXTest_b <= vStage_uid184_fpLOut1_uid72_fpArcsinXTest_in(30 downto 0);

	--cStage_uid185_fpLOut1_uid72_fpArcsinXTest(BITJOIN,184)@3
    cStage_uid185_fpLOut1_uid72_fpArcsinXTest_q <= vStage_uid184_fpLOut1_uid72_fpArcsinXTest_b & leftShiftStage0Idx1Pad4_uid120_fxpX_uid48_fpArcsinXTest_q;

	--reg_cStage_uid185_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_3(REG,371)@3
    reg_cStage_uid185_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid185_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid185_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_3_q <= cStage_uid185_fpLOut1_uid72_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_2(REG,370)@3
    reg_vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_2_q <= vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid186_fpLOut1_uid72_fpArcsinXTest(MUX,185)@4
    vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_s <= vCount_uid182_fpLOut1_uid72_fpArcsinXTest_q;
    vStagei_uid186_fpLOut1_uid72_fpArcsinXTest: PROCESS (vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_s, en, reg_vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_2_q, reg_cStage_uid185_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_3_q)
    BEGIN
            CASE vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_s IS
                  WHEN "0" => vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_q <= reg_vStagei_uid179_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_2_q;
                  WHEN "1" => vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_q <= reg_cStage_uid185_fpLOut1_uid72_fpArcsinXTest_0_to_vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_3_q;
                  WHEN OTHERS => vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid188_fpLOut1_uid72_fpArcsinXTest(BITSELECT,187)@4
    rVStage_uid188_fpLOut1_uid72_fpArcsinXTest_in <= vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_q;
    rVStage_uid188_fpLOut1_uid72_fpArcsinXTest_b <= rVStage_uid188_fpLOut1_uid72_fpArcsinXTest_in(34 downto 33);

	--vCount_uid189_fpLOut1_uid72_fpArcsinXTest(LOGICAL,188)@4
    vCount_uid189_fpLOut1_uid72_fpArcsinXTest_a <= rVStage_uid188_fpLOut1_uid72_fpArcsinXTest_b;
    vCount_uid189_fpLOut1_uid72_fpArcsinXTest_b <= z2_uid84_fpArcsinXTest_q;
    vCount_uid189_fpLOut1_uid72_fpArcsinXTest_q <= "1" when vCount_uid189_fpLOut1_uid72_fpArcsinXTest_a = vCount_uid189_fpLOut1_uid72_fpArcsinXTest_b else "0";

	--vStage_uid191_fpLOut1_uid72_fpArcsinXTest(BITSELECT,190)@4
    vStage_uid191_fpLOut1_uid72_fpArcsinXTest_in <= vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_q(32 downto 0);
    vStage_uid191_fpLOut1_uid72_fpArcsinXTest_b <= vStage_uid191_fpLOut1_uid72_fpArcsinXTest_in(32 downto 0);

	--cStage_uid192_fpLOut1_uid72_fpArcsinXTest(BITJOIN,191)@4
    cStage_uid192_fpLOut1_uid72_fpArcsinXTest_q <= vStage_uid191_fpLOut1_uid72_fpArcsinXTest_b & z2_uid84_fpArcsinXTest_q;

	--vStagei_uid193_fpLOut1_uid72_fpArcsinXTest(MUX,192)@4
    vStagei_uid193_fpLOut1_uid72_fpArcsinXTest_s <= vCount_uid189_fpLOut1_uid72_fpArcsinXTest_q;
    vStagei_uid193_fpLOut1_uid72_fpArcsinXTest: PROCESS (vStagei_uid193_fpLOut1_uid72_fpArcsinXTest_s, en, vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_q, cStage_uid192_fpLOut1_uid72_fpArcsinXTest_q)
    BEGIN
            CASE vStagei_uid193_fpLOut1_uid72_fpArcsinXTest_s IS
                  WHEN "0" => vStagei_uid193_fpLOut1_uid72_fpArcsinXTest_q <= vStagei_uid186_fpLOut1_uid72_fpArcsinXTest_q;
                  WHEN "1" => vStagei_uid193_fpLOut1_uid72_fpArcsinXTest_q <= cStage_uid192_fpLOut1_uid72_fpArcsinXTest_q;
                  WHEN OTHERS => vStagei_uid193_fpLOut1_uid72_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid195_fpLOut1_uid72_fpArcsinXTest(BITSELECT,194)@4
    rVStage_uid195_fpLOut1_uid72_fpArcsinXTest_in <= vStagei_uid193_fpLOut1_uid72_fpArcsinXTest_q;
    rVStage_uid195_fpLOut1_uid72_fpArcsinXTest_b <= rVStage_uid195_fpLOut1_uid72_fpArcsinXTest_in(34 downto 34);

	--vCount_uid196_fpLOut1_uid72_fpArcsinXTest(LOGICAL,195)@4
    vCount_uid196_fpLOut1_uid72_fpArcsinXTest_a <= rVStage_uid195_fpLOut1_uid72_fpArcsinXTest_b;
    vCount_uid196_fpLOut1_uid72_fpArcsinXTest_b <= GND_q;
    vCount_uid196_fpLOut1_uid72_fpArcsinXTest_q <= "1" when vCount_uid196_fpLOut1_uid72_fpArcsinXTest_a = vCount_uid196_fpLOut1_uid72_fpArcsinXTest_b else "0";

	--vCount_uid201_fpLOut1_uid72_fpArcsinXTest(BITJOIN,200)@4
    vCount_uid201_fpLOut1_uid72_fpArcsinXTest_q <= ld_vCount_uid161_fpLOut1_uid72_fpArcsinXTest_q_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_f_q & ld_vCount_uid168_fpLOut1_uid72_fpArcsinXTest_q_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_e_q & reg_vCount_uid175_fpLOut1_uid72_fpArcsinXTest_0_to_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_3_q & vCount_uid182_fpLOut1_uid72_fpArcsinXTest_q & vCount_uid189_fpLOut1_uid72_fpArcsinXTest_q & vCount_uid196_fpLOut1_uid72_fpArcsinXTest_q;

	--ld_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_q_to_vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest_c(DELAY,602)@4
    ld_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_q_to_vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest_c : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => vCount_uid201_fpLOut1_uid72_fpArcsinXTest_q, xout => ld_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_q_to_vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_0_to_vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_1(REG,373)@4
    reg_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_0_to_vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_0_to_vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_1_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_0_to_vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_1_q <= vCount_uid201_fpLOut1_uid72_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest(COMPARE,202)@5
    vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_cin <= GND_q;
    vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_a <= STD_LOGIC_VECTOR("00" & maxCountVal_uid202_fpLOut1_uid72_fpArcsinXTest_q) & '0';
    vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_b <= STD_LOGIC_VECTOR("00" & reg_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_0_to_vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_1_q) & vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_cin(0);
            vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_a) - UNSIGNED(vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_b));
    vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_c(0) <= vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_o(8);


	--vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest(MUX,204)@5
    vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest_s <= vCountBig_uid203_fpLOut1_uid72_fpArcsinXTest_c;
    vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest_s IS
                      WHEN "0" => vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest_q <= ld_vCount_uid201_fpLOut1_uid72_fpArcsinXTest_q_to_vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest_c_q;
                      WHEN "1" => vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest_q <= maxCountVal_uid202_fpLOut1_uid72_fpArcsinXTest_q;
                      WHEN OTHERS => vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--cstBiasM2_uid15_fpArcsinXTest(CONSTANT,14)
    cstBiasM2_uid15_fpArcsinXTest_q <= "01111101";

	--expL_uid73_fpArcsinXTest(SUB,72)@6
    expL_uid73_fpArcsinXTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM2_uid15_fpArcsinXTest_q);
    expL_uid73_fpArcsinXTest_b <= STD_LOGIC_VECTOR("000" & vCountFinal_uid205_fpLOut1_uid72_fpArcsinXTest_q);
            expL_uid73_fpArcsinXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expL_uid73_fpArcsinXTest_a) - UNSIGNED(expL_uid73_fpArcsinXTest_b));
    expL_uid73_fpArcsinXTest_q <= expL_uid73_fpArcsinXTest_o(8 downto 0);


	--expLRange_uid75_fpArcsinXTest(BITSELECT,74)@6
    expLRange_uid75_fpArcsinXTest_in <= expL_uid73_fpArcsinXTest_q(7 downto 0);
    expLRange_uid75_fpArcsinXTest_b <= expLRange_uid75_fpArcsinXTest_in(7 downto 0);

	--vStage_uid198_fpLOut1_uid72_fpArcsinXTest(BITSELECT,197)@4
    vStage_uid198_fpLOut1_uid72_fpArcsinXTest_in <= vStagei_uid193_fpLOut1_uid72_fpArcsinXTest_q(33 downto 0);
    vStage_uid198_fpLOut1_uid72_fpArcsinXTest_b <= vStage_uid198_fpLOut1_uid72_fpArcsinXTest_in(33 downto 0);

	--cStage_uid199_fpLOut1_uid72_fpArcsinXTest(BITJOIN,198)@4
    cStage_uid199_fpLOut1_uid72_fpArcsinXTest_q <= vStage_uid198_fpLOut1_uid72_fpArcsinXTest_b & GND_q;

	--vStagei_uid200_fpLOut1_uid72_fpArcsinXTest(MUX,199)@4
    vStagei_uid200_fpLOut1_uid72_fpArcsinXTest_s <= vCount_uid196_fpLOut1_uid72_fpArcsinXTest_q;
    vStagei_uid200_fpLOut1_uid72_fpArcsinXTest: PROCESS (vStagei_uid200_fpLOut1_uid72_fpArcsinXTest_s, en, vStagei_uid193_fpLOut1_uid72_fpArcsinXTest_q, cStage_uid199_fpLOut1_uid72_fpArcsinXTest_q)
    BEGIN
            CASE vStagei_uid200_fpLOut1_uid72_fpArcsinXTest_s IS
                  WHEN "0" => vStagei_uid200_fpLOut1_uid72_fpArcsinXTest_q <= vStagei_uid193_fpLOut1_uid72_fpArcsinXTest_q;
                  WHEN "1" => vStagei_uid200_fpLOut1_uid72_fpArcsinXTest_q <= cStage_uid199_fpLOut1_uid72_fpArcsinXTest_q;
                  WHEN OTHERS => vStagei_uid200_fpLOut1_uid72_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fpLOutFrac_uid74_fpArcsinXTest(BITSELECT,73)@4
    fpLOutFrac_uid74_fpArcsinXTest_in <= vStagei_uid200_fpLOut1_uid72_fpArcsinXTest_q(33 downto 0);
    fpLOutFrac_uid74_fpArcsinXTest_b <= fpLOutFrac_uid74_fpArcsinXTest_in(33 downto 11);

	--reg_fpLOutFrac_uid74_fpArcsinXTest_0_to_fpL_uid76_fpArcsinXTest_0(REG,374)@4
    reg_fpLOutFrac_uid74_fpArcsinXTest_0_to_fpL_uid76_fpArcsinXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fpLOutFrac_uid74_fpArcsinXTest_0_to_fpL_uid76_fpArcsinXTest_0_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fpLOutFrac_uid74_fpArcsinXTest_0_to_fpL_uid76_fpArcsinXTest_0_q <= fpLOutFrac_uid74_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fpLOutFrac_uid74_fpArcsinXTest_0_to_fpL_uid76_fpArcsinXTest_0_q_to_fpL_uid76_fpArcsinXTest_a(DELAY,460)@5
    ld_reg_fpLOutFrac_uid74_fpArcsinXTest_0_to_fpL_uid76_fpArcsinXTest_0_q_to_fpL_uid76_fpArcsinXTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => reg_fpLOutFrac_uid74_fpArcsinXTest_0_to_fpL_uid76_fpArcsinXTest_0_q, xout => ld_reg_fpLOutFrac_uid74_fpArcsinXTest_0_to_fpL_uid76_fpArcsinXTest_0_q_to_fpL_uid76_fpArcsinXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--fpL_uid76_fpArcsinXTest(BITJOIN,75)@6
    fpL_uid76_fpArcsinXTest_q <= GND_q & expLRange_uid75_fpArcsinXTest_b & ld_reg_fpLOutFrac_uid74_fpArcsinXTest_0_to_fpL_uid76_fpArcsinXTest_0_q_to_fpL_uid76_fpArcsinXTest_a_q;

	--signX_uid210_sqrtFPL_uid78_fpArcsinXTest(BITSELECT,209)@6
    signX_uid210_sqrtFPL_uid78_fpArcsinXTest_in <= fpL_uid76_fpArcsinXTest_q;
    signX_uid210_sqrtFPL_uid78_fpArcsinXTest_b <= signX_uid210_sqrtFPL_uid78_fpArcsinXTest_in(31 downto 31);

	--expX_uid208_sqrtFPL_uid78_fpArcsinXTest(BITSELECT,207)@6
    expX_uid208_sqrtFPL_uid78_fpArcsinXTest_in <= fpL_uid76_fpArcsinXTest_q(30 downto 0);
    expX_uid208_sqrtFPL_uid78_fpArcsinXTest_b <= expX_uid208_sqrtFPL_uid78_fpArcsinXTest_in(30 downto 23);

	--expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,214)@6
    expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_a <= expX_uid208_sqrtFPL_uid78_fpArcsinXTest_b;
    expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_b <= cstAllZWE_uid12_fpArcsinXTest_q;
    expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_q <= "1" when expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_a = expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_b else "0";

	--negZero_uid258_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,257)@6
    negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_a <= expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_q;
    negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_b <= signX_uid210_sqrtFPL_uid78_fpArcsinXTest_b;
    negZero_uid258_sqrtFPL_uid78_fpArcsinXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_q <= negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_a and negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_b;
        END IF;
    END PROCESS;



	--ld_negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_c(DELAY,658)@7
    ld_negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 10 )
    PORT MAP ( xin => negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_q, xout => ld_negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_nor(LOGICAL,935)
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_nor_b <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_sticky_ena_q;
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_nor_q <= not (ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_nor_a or ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_nor_b);

	--ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_mem_top(CONSTANT,931)
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_mem_top_q <= "0110";

	--ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmp(LOGICAL,932)
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmp_a <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_mem_top_q;
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdmux_q);
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmp_q <= "1" when ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmp_a = ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmp_b else "0";

	--ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmpReg(REG,933)
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmpReg_q <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_sticky_ena(REG,936)
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_nor_q = "1") THEN
                ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_sticky_ena_q <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_enaAnd(LOGICAL,937)
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_enaAnd_a <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_sticky_ena_q;
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_enaAnd_b <= en;
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_enaAnd_q <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_enaAnd_a and ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_enaAnd_b;

	--reg_expX_uid208_sqrtFPL_uid78_fpArcsinXTest_0_to_expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_0(REG,384)@6
    reg_expX_uid208_sqrtFPL_uid78_fpArcsinXTest_0_to_expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expX_uid208_sqrtFPL_uid78_fpArcsinXTest_0_to_expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expX_uid208_sqrtFPL_uid78_fpArcsinXTest_0_to_expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_0_q <= expX_uid208_sqrtFPL_uid78_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expOddSig_uid231_sqrtFPL_uid78_fpArcsinXTest(ADD,230)@7
    expOddSig_uid231_sqrtFPL_uid78_fpArcsinXTest_a <= STD_LOGIC_VECTOR("0" & reg_expX_uid208_sqrtFPL_uid78_fpArcsinXTest_0_to_expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_0_q);
    expOddSig_uid231_sqrtFPL_uid78_fpArcsinXTest_b <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid14_fpArcsinXTest_q);
            expOddSig_uid231_sqrtFPL_uid78_fpArcsinXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expOddSig_uid231_sqrtFPL_uid78_fpArcsinXTest_a) + UNSIGNED(expOddSig_uid231_sqrtFPL_uid78_fpArcsinXTest_b));
    expOddSig_uid231_sqrtFPL_uid78_fpArcsinXTest_q <= expOddSig_uid231_sqrtFPL_uid78_fpArcsinXTest_o(8 downto 0);


	--expROdd_uid232_sqrtFPL_uid78_fpArcsinXTest(BITSELECT,231)@7
    expROdd_uid232_sqrtFPL_uid78_fpArcsinXTest_in <= expOddSig_uid231_sqrtFPL_uid78_fpArcsinXTest_q;
    expROdd_uid232_sqrtFPL_uid78_fpArcsinXTest_b <= expROdd_uid232_sqrtFPL_uid78_fpArcsinXTest_in(8 downto 1);

	--expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest(ADD,227)@7
    expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_a <= STD_LOGIC_VECTOR("0" & reg_expX_uid208_sqrtFPL_uid78_fpArcsinXTest_0_to_expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_0_q);
    expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_b <= STD_LOGIC_VECTOR("0" & cstBias_uid13_fpArcsinXTest_q);
            expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_a) + UNSIGNED(expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_b));
    expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_q <= expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_o(8 downto 0);


	--expREven_uid229_sqrtFPL_uid78_fpArcsinXTest(BITSELECT,228)@7
    expREven_uid229_sqrtFPL_uid78_fpArcsinXTest_in <= expEvenSig_uid228_sqrtFPL_uid78_fpArcsinXTest_q;
    expREven_uid229_sqrtFPL_uid78_fpArcsinXTest_b <= expREven_uid229_sqrtFPL_uid78_fpArcsinXTest_in(8 downto 1);

	--expX0_uid233_sqrtFPL_uid78_fpArcsinXTest(BITSELECT,232)@6
    expX0_uid233_sqrtFPL_uid78_fpArcsinXTest_in <= expX_uid208_sqrtFPL_uid78_fpArcsinXTest_b(0 downto 0);
    expX0_uid233_sqrtFPL_uid78_fpArcsinXTest_b <= expX0_uid233_sqrtFPL_uid78_fpArcsinXTest_in(0 downto 0);

	--expOddSelect_uid234_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,233)@6
    expOddSelect_uid234_sqrtFPL_uid78_fpArcsinXTest_a <= expX0_uid233_sqrtFPL_uid78_fpArcsinXTest_b;
    expOddSelect_uid234_sqrtFPL_uid78_fpArcsinXTest_q <= not expOddSelect_uid234_sqrtFPL_uid78_fpArcsinXTest_a;

	--ld_expOddSelect_uid234_sqrtFPL_uid78_fpArcsinXTest_q_to_expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_b(DELAY,626)@6
    ld_expOddSelect_uid234_sqrtFPL_uid78_fpArcsinXTest_q_to_expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expOddSelect_uid234_sqrtFPL_uid78_fpArcsinXTest_q, xout => ld_expOddSelect_uid234_sqrtFPL_uid78_fpArcsinXTest_q_to_expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest(MUX,234)@7
    expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_s <= ld_expOddSelect_uid234_sqrtFPL_uid78_fpArcsinXTest_q_to_expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_b_q;
    expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_s IS
                      WHEN "0" => expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_q <= expREven_uid229_sqrtFPL_uid78_fpArcsinXTest_b;
                      WHEN "1" => expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_q <= expROdd_uid232_sqrtFPL_uid78_fpArcsinXTest_b;
                      WHEN OTHERS => expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_signX_uid210_sqrtFPL_uid78_fpArcsinXTest_b_to_minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_b(DELAY,638)@6
    ld_signX_uid210_sqrtFPL_uid78_fpArcsinXTest_b_to_minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signX_uid210_sqrtFPL_uid78_fpArcsinXTest_b, xout => ld_signX_uid210_sqrtFPL_uid78_fpArcsinXTest_b_to_minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid223_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,222)@7
    InvExc_N_uid223_sqrtFPL_uid78_fpArcsinXTest_a <= exc_N_uid222_sqrtFPL_uid78_fpArcsinXTest_q;
    InvExc_N_uid223_sqrtFPL_uid78_fpArcsinXTest_q <= not InvExc_N_uid223_sqrtFPL_uid78_fpArcsinXTest_a;

	--fracX_uid209_sqrtFPL_uid78_fpArcsinXTest(BITSELECT,208)@6
    fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_in <= fpL_uid76_fpArcsinXTest_q(22 downto 0);
    fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b <= fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_in(22 downto 0);

	--reg_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_0_to_fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_1(REG,375)@6
    reg_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_0_to_fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_0_to_fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_0_to_fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_1_q <= fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,218)@7
    fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_a <= reg_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_0_to_fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_1_q;
    fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_b <= cstAllZWF_uid10_fpArcsinXTest_q;
    fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_q <= "1" when fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_a = fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_b else "0";

	--expXIsMax_uid217_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,216)@6
    expXIsMax_uid217_sqrtFPL_uid78_fpArcsinXTest_a <= expX_uid208_sqrtFPL_uid78_fpArcsinXTest_b;
    expXIsMax_uid217_sqrtFPL_uid78_fpArcsinXTest_b <= cstAllOWE_uid9_fpArcsinXTest_q;
    expXIsMax_uid217_sqrtFPL_uid78_fpArcsinXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXIsMax_uid217_sqrtFPL_uid78_fpArcsinXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            IF (expXIsMax_uid217_sqrtFPL_uid78_fpArcsinXTest_a = expXIsMax_uid217_sqrtFPL_uid78_fpArcsinXTest_b) THEN
                expXIsMax_uid217_sqrtFPL_uid78_fpArcsinXTest_q <= "1";
            ELSE
                expXIsMax_uid217_sqrtFPL_uid78_fpArcsinXTest_q <= "0";
            END IF;
        END IF;
    END PROCESS;



	--exc_I_uid220_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,219)@7
    exc_I_uid220_sqrtFPL_uid78_fpArcsinXTest_a <= expXIsMax_uid217_sqrtFPL_uid78_fpArcsinXTest_q;
    exc_I_uid220_sqrtFPL_uid78_fpArcsinXTest_b <= fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_q;
    exc_I_uid220_sqrtFPL_uid78_fpArcsinXTest_q <= exc_I_uid220_sqrtFPL_uid78_fpArcsinXTest_a and exc_I_uid220_sqrtFPL_uid78_fpArcsinXTest_b;

	--InvExc_I_uid224_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,223)@7
    InvExc_I_uid224_sqrtFPL_uid78_fpArcsinXTest_a <= exc_I_uid220_sqrtFPL_uid78_fpArcsinXTest_q;
    InvExc_I_uid224_sqrtFPL_uid78_fpArcsinXTest_q <= not InvExc_I_uid224_sqrtFPL_uid78_fpArcsinXTest_a;

	--InvExpXIsZero_uid225_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,224)@6
    InvExpXIsZero_uid225_sqrtFPL_uid78_fpArcsinXTest_a <= expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_q;
    InvExpXIsZero_uid225_sqrtFPL_uid78_fpArcsinXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExpXIsZero_uid225_sqrtFPL_uid78_fpArcsinXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExpXIsZero_uid225_sqrtFPL_uid78_fpArcsinXTest_q <= not InvExpXIsZero_uid225_sqrtFPL_uid78_fpArcsinXTest_a;
        END IF;
    END PROCESS;



	--exc_R_uid226_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,225)@7
    exc_R_uid226_sqrtFPL_uid78_fpArcsinXTest_a <= InvExpXIsZero_uid225_sqrtFPL_uid78_fpArcsinXTest_q;
    exc_R_uid226_sqrtFPL_uid78_fpArcsinXTest_b <= InvExc_I_uid224_sqrtFPL_uid78_fpArcsinXTest_q;
    exc_R_uid226_sqrtFPL_uid78_fpArcsinXTest_c <= InvExc_N_uid223_sqrtFPL_uid78_fpArcsinXTest_q;
    exc_R_uid226_sqrtFPL_uid78_fpArcsinXTest_q <= exc_R_uid226_sqrtFPL_uid78_fpArcsinXTest_a and exc_R_uid226_sqrtFPL_uid78_fpArcsinXTest_b and exc_R_uid226_sqrtFPL_uid78_fpArcsinXTest_c;

	--minReg_uid244_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,243)@7
    minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_a <= exc_R_uid226_sqrtFPL_uid78_fpArcsinXTest_q;
    minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_b <= ld_signX_uid210_sqrtFPL_uid78_fpArcsinXTest_b_to_minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_b_q;
    minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_q <= minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_a and minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_b;

	--minInf_uid245_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,244)@7
    minInf_uid245_sqrtFPL_uid78_fpArcsinXTest_a <= exc_I_uid220_sqrtFPL_uid78_fpArcsinXTest_q;
    minInf_uid245_sqrtFPL_uid78_fpArcsinXTest_b <= ld_signX_uid210_sqrtFPL_uid78_fpArcsinXTest_b_to_minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_b_q;
    minInf_uid245_sqrtFPL_uid78_fpArcsinXTest_q <= minInf_uid245_sqrtFPL_uid78_fpArcsinXTest_a and minInf_uid245_sqrtFPL_uid78_fpArcsinXTest_b;

	--InvFracXIsZero_uid221_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,220)@7
    InvFracXIsZero_uid221_sqrtFPL_uid78_fpArcsinXTest_a <= fracXIsZero_uid219_sqrtFPL_uid78_fpArcsinXTest_q;
    InvFracXIsZero_uid221_sqrtFPL_uid78_fpArcsinXTest_q <= not InvFracXIsZero_uid221_sqrtFPL_uid78_fpArcsinXTest_a;

	--exc_N_uid222_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,221)@7
    exc_N_uid222_sqrtFPL_uid78_fpArcsinXTest_a <= expXIsMax_uid217_sqrtFPL_uid78_fpArcsinXTest_q;
    exc_N_uid222_sqrtFPL_uid78_fpArcsinXTest_b <= InvFracXIsZero_uid221_sqrtFPL_uid78_fpArcsinXTest_q;
    exc_N_uid222_sqrtFPL_uid78_fpArcsinXTest_q <= exc_N_uid222_sqrtFPL_uid78_fpArcsinXTest_a and exc_N_uid222_sqrtFPL_uid78_fpArcsinXTest_b;

	--excRNaN_uid246_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,245)@7
    excRNaN_uid246_sqrtFPL_uid78_fpArcsinXTest_a <= exc_N_uid222_sqrtFPL_uid78_fpArcsinXTest_q;
    excRNaN_uid246_sqrtFPL_uid78_fpArcsinXTest_b <= minInf_uid245_sqrtFPL_uid78_fpArcsinXTest_q;
    excRNaN_uid246_sqrtFPL_uid78_fpArcsinXTest_c <= minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_q;
    excRNaN_uid246_sqrtFPL_uid78_fpArcsinXTest_q <= excRNaN_uid246_sqrtFPL_uid78_fpArcsinXTest_a or excRNaN_uid246_sqrtFPL_uid78_fpArcsinXTest_b or excRNaN_uid246_sqrtFPL_uid78_fpArcsinXTest_c;

	--InvSignX_uid242_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,241)@6
    InvSignX_uid242_sqrtFPL_uid78_fpArcsinXTest_a <= signX_uid210_sqrtFPL_uid78_fpArcsinXTest_b;
    InvSignX_uid242_sqrtFPL_uid78_fpArcsinXTest_q <= not InvSignX_uid242_sqrtFPL_uid78_fpArcsinXTest_a;

	--ld_InvSignX_uid242_sqrtFPL_uid78_fpArcsinXTest_q_to_inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest_b(DELAY,636)@6
    ld_InvSignX_uid242_sqrtFPL_uid78_fpArcsinXTest_q_to_inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvSignX_uid242_sqrtFPL_uid78_fpArcsinXTest_q, xout => ld_InvSignX_uid242_sqrtFPL_uid78_fpArcsinXTest_q_to_inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest(LOGICAL,242)@7
    inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest_a <= exc_I_uid220_sqrtFPL_uid78_fpArcsinXTest_q;
    inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest_b <= ld_InvSignX_uid242_sqrtFPL_uid78_fpArcsinXTest_q_to_inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest_b_q;
    inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest_q <= inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest_a and inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest_b;

	--ld_expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_q_to_join_uid247_sqrtFPL_uid78_fpArcsinXTest_a(DELAY,644)@6
    ld_expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_q_to_join_uid247_sqrtFPL_uid78_fpArcsinXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_q, xout => ld_expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_q_to_join_uid247_sqrtFPL_uid78_fpArcsinXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--join_uid247_sqrtFPL_uid78_fpArcsinXTest(BITJOIN,246)@7
    join_uid247_sqrtFPL_uid78_fpArcsinXTest_q <= excRNaN_uid246_sqrtFPL_uid78_fpArcsinXTest_q & inInfAndNotNeg_uid243_sqrtFPL_uid78_fpArcsinXTest_q & ld_expXIsZero_uid215_sqrtFPL_uid78_fpArcsinXTest_q_to_join_uid247_sqrtFPL_uid78_fpArcsinXTest_a_q;

	--fracSelIn_uid248_sqrtFPL_uid78_fpArcsinXTest(BITJOIN,247)@7
    fracSelIn_uid248_sqrtFPL_uid78_fpArcsinXTest_q <= ld_signX_uid210_sqrtFPL_uid78_fpArcsinXTest_b_to_minReg_uid244_sqrtFPL_uid78_fpArcsinXTest_b_q & join_uid247_sqrtFPL_uid78_fpArcsinXTest_q;

	--reg_fracSelIn_uid248_sqrtFPL_uid78_fpArcsinXTest_0_to_fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_0(REG,376)@7
    reg_fracSelIn_uid248_sqrtFPL_uid78_fpArcsinXTest_0_to_fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracSelIn_uid248_sqrtFPL_uid78_fpArcsinXTest_0_to_fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_0_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracSelIn_uid248_sqrtFPL_uid78_fpArcsinXTest_0_to_fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_0_q <= fracSelIn_uid248_sqrtFPL_uid78_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest(LOOKUP,248)@8
    fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest: PROCESS (reg_fracSelIn_uid248_sqrtFPL_uid78_fpArcsinXTest_0_to_fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_fracSelIn_uid248_sqrtFPL_uid78_fpArcsinXTest_0_to_fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_0_q) IS
                WHEN "0000" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "01";
                WHEN "0001" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "00";
                WHEN "0010" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "10";
                WHEN "0011" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "00";
                WHEN "0100" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "11";
                WHEN "0101" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "00";
                WHEN "0110" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "10";
                WHEN "0111" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "00";
                WHEN "1000" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "11";
                WHEN "1001" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "00";
                WHEN "1010" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "11";
                WHEN "1011" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "11";
                WHEN "1100" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "11";
                WHEN "1101" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "11";
                WHEN "1110" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "11";
                WHEN "1111" =>  fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= "11";
                WHEN OTHERS =>
                    fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest(MUX,252)@8
    expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_s <= fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q;
    expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest: PROCESS (expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_s, en, cstAllZWE_uid12_fpArcsinXTest_q, expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_q, cstAllOWE_uid9_fpArcsinXTest_q, cstAllOWE_uid9_fpArcsinXTest_q)
    BEGIN
            CASE expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_s IS
                  WHEN "00" => expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q <= cstAllZWE_uid12_fpArcsinXTest_q;
                  WHEN "01" => expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q <= expRMux_uid235_sqrtFPL_uid78_fpArcsinXTest_q;
                  WHEN "10" => expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q <= cstAllOWE_uid9_fpArcsinXTest_q;
                  WHEN "11" => expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q <= cstAllOWE_uid9_fpArcsinXTest_q;
                  WHEN OTHERS => expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_inputreg(DELAY,925)
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q, xout => ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt(COUNTER,927)
    -- every=1, low=0, high=6, step=1, init=1
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_i = 5 THEN
                      ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_eq = '1') THEN
                        ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_i <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_i - 6;
                    ELSE
                        ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_i <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_i,3));


	--ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdreg(REG,928)
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdreg_q <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdmux(MUX,929)
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdmux_s <= en;
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdmux: PROCESS (ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdmux_s, ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdreg_q, ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdmux_q <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdmux_q <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem(DUALMEM,926)
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_reset0 <= areset;
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_ia <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_inputreg_q;
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_aa <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdreg_q;
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_ab <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_rdmux_q;
    ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_iq,
        address_a => ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_aa,
        data_a => ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_ia
    );
        ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_q <= ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_iq(7 downto 0);

	--cstNaNWF_uid11_fpArcsinXTest(CONSTANT,10)
    cstNaNWF_uid11_fpArcsinXTest_q <= "00000000000000000000001";

	--fracXAddr_uid237_sqrtFPL_uid78_fpArcsinXTest(BITSELECT,236)@6
    fracXAddr_uid237_sqrtFPL_uid78_fpArcsinXTest_in <= fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b;
    fracXAddr_uid237_sqrtFPL_uid78_fpArcsinXTest_b <= fracXAddr_uid237_sqrtFPL_uid78_fpArcsinXTest_in(22 downto 16);

	--addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest(BITJOIN,237)@6
    addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_q <= expOddSelect_uid234_sqrtFPL_uid78_fpArcsinXTest_q & fracXAddr_uid237_sqrtFPL_uid78_fpArcsinXTest_b;

	--reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC2_uid314_sqrtTableGenerator_lutmem_0(REG,377)@6
    reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC2_uid314_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC2_uid314_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC2_uid314_sqrtTableGenerator_lutmem_0_q <= addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid314_sqrtTableGenerator_lutmem(DUALMEM,347)@7
    memoryC2_uid314_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC2_uid314_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC2_uid314_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC2_uid314_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC2_uid314_sqrtTableGenerator_lutmem_0_q;
    memoryC2_uid314_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_arcsin_s5_memoryC2_uid314_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid314_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid314_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid314_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC2_uid314_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC2_uid314_sqrtTableGenerator_lutmem_ia
    );
        memoryC2_uid314_sqrtTableGenerator_lutmem_q <= memoryC2_uid314_sqrtTableGenerator_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid314_sqrtTableGenerator_lutmem_0_to_prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_1(REG,379)@9
    reg_memoryC2_uid314_sqrtTableGenerator_lutmem_0_to_prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid314_sqrtTableGenerator_lutmem_0_to_prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid314_sqrtTableGenerator_lutmem_0_to_prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_1_q <= memoryC2_uid314_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b_to_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_a_inputreg(DELAY,924)
    ld_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b_to_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b, xout => ld_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b_to_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b_to_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_a(DELAY,632)@6
    ld_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b_to_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => ld_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b_to_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_a_inputreg_q, xout => ld_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b_to_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest(BITSELECT,238)@9
    FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_in <= ld_fracX_uid209_sqrtFPL_uid78_fpArcsinXTest_b_to_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_a_q(15 downto 0);
    FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_b <= FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_in(15 downto 0);

	--yT1_uid315_sqrtPolynomialEvaluator(BITSELECT,314)@9
    yT1_uid315_sqrtPolynomialEvaluator_in <= FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_b;
    yT1_uid315_sqrtPolynomialEvaluator_b <= yT1_uid315_sqrtPolynomialEvaluator_in(15 downto 4);

	--reg_yT1_uid315_sqrtPolynomialEvaluator_0_to_prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_0(REG,378)@9
    reg_yT1_uid315_sqrtPolynomialEvaluator_0_to_prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid315_sqrtPolynomialEvaluator_0_to_prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid315_sqrtPolynomialEvaluator_0_to_prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_0_q <= yT1_uid315_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator(MULT,333)@10
    prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_a),13)) * SIGNED(prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_b);
    prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_a <= reg_yT1_uid315_sqrtPolynomialEvaluator_0_to_prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_0_q;
                prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_b <= reg_memoryC2_uid314_sqrtTableGenerator_lutmem_0_to_prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_1_q;
                prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_q <= prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid335_pT1_uid316_sqrtPolynomialEvaluator(BITSELECT,334)@13
    prodXYTruncFR_uid335_pT1_uid316_sqrtPolynomialEvaluator_in <= prodXY_uid334_pT1_uid316_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid335_pT1_uid316_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid335_pT1_uid316_sqrtPolynomialEvaluator_in(23 downto 11);

	--highBBits_uid318_sqrtPolynomialEvaluator(BITSELECT,317)@13
    highBBits_uid318_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid335_pT1_uid316_sqrtPolynomialEvaluator_b;
    highBBits_uid318_sqrtPolynomialEvaluator_b <= highBBits_uid318_sqrtPolynomialEvaluator_in(12 downto 1);

	--ld_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_q_to_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0_a_inputreg(DELAY,1013)
    ld_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_q_to_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_q, xout => ld_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_q_to_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_q_to_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0_a(DELAY,774)@6
    ld_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_q_to_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => ld_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_q_to_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0_a_inputreg_q, xout => ld_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_q_to_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0(REG,380)@10
    reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0_q <= ld_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_q_to_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid313_sqrtTableGenerator_lutmem(DUALMEM,346)@11
    memoryC1_uid313_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC1_uid313_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC1_uid313_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC1_uid313_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC1_uid313_sqrtTableGenerator_lutmem_0_q;
    memoryC1_uid313_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_arcsin_s5_memoryC1_uid313_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid313_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid313_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid313_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC1_uid313_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC1_uid313_sqrtTableGenerator_lutmem_ia
    );
        memoryC1_uid313_sqrtTableGenerator_lutmem_q <= memoryC1_uid313_sqrtTableGenerator_lutmem_iq(20 downto 0);

	--sumAHighB_uid319_sqrtPolynomialEvaluator(ADD,318)@13
    sumAHighB_uid319_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid313_sqrtTableGenerator_lutmem_q(20)) & memoryC1_uid313_sqrtTableGenerator_lutmem_q);
    sumAHighB_uid319_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid318_sqrtPolynomialEvaluator_b(11)) & highBBits_uid318_sqrtPolynomialEvaluator_b);
            sumAHighB_uid319_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid319_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid319_sqrtPolynomialEvaluator_b));
    sumAHighB_uid319_sqrtPolynomialEvaluator_q <= sumAHighB_uid319_sqrtPolynomialEvaluator_o(21 downto 0);


	--lowRangeB_uid317_sqrtPolynomialEvaluator(BITSELECT,316)@13
    lowRangeB_uid317_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid335_pT1_uid316_sqrtPolynomialEvaluator_b(0 downto 0);
    lowRangeB_uid317_sqrtPolynomialEvaluator_b <= lowRangeB_uid317_sqrtPolynomialEvaluator_in(0 downto 0);

	--s1_uid317_uid320_sqrtPolynomialEvaluator(BITJOIN,319)@13
    s1_uid317_uid320_sqrtPolynomialEvaluator_q <= sumAHighB_uid319_sqrtPolynomialEvaluator_q & lowRangeB_uid317_sqrtPolynomialEvaluator_b;

	--reg_s1_uid317_uid320_sqrtPolynomialEvaluator_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_1(REG,382)@13
    reg_s1_uid317_uid320_sqrtPolynomialEvaluator_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid317_uid320_sqrtPolynomialEvaluator_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid317_uid320_sqrtPolynomialEvaluator_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_1_q <= s1_uid317_uid320_sqrtPolynomialEvaluator_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_nor(LOGICAL,969)
    ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_nor_b <= ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_sticky_ena_q;
    ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_nor_q <= not (ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_nor_a or ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_nor_b);

	--ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_mem_top(CONSTANT,953)
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_mem_top_q <= "010";

	--ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmp(LOGICAL,954)
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmp_a <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_mem_top_q;
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdmux_q);
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmp_q <= "1" when ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmp_a = ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmp_b else "0";

	--ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmpReg(REG,955)
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmpReg_q <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_sticky_ena(REG,970)
    ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_nor_q = "1") THEN
                ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_sticky_ena_q <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_enaAnd(LOGICAL,971)
    ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_enaAnd_a <= ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_sticky_ena_q;
    ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_enaAnd_b <= en;
    ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_enaAnd_q <= ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_enaAnd_a and ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_enaAnd_b;

	--reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0(REG,381)@9
    reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q <= FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt(COUNTER,949)
    -- every=1, low=0, high=2, step=1, init=1
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_i = 1 THEN
                      ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_i <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_i - 2;
                    ELSE
                        ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_i <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_i,2));


	--ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdreg(REG,950)
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdreg_q <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdmux(MUX,951)
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdmux_s <= en;
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdmux: PROCESS (ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdmux_s, ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdreg_q, ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdmux_q <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdmux_q <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem(DUALMEM,960)
    ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_reset0 <= areset;
    ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_ia <= reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q;
    ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_aa <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdreg_q;
    ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_ab <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdmux_q;
    ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_iq,
        address_a => ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_aa,
        data_a => ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_ia
    );
        ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_q <= ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_iq(15 downto 0);

	--prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator(MULT,336)@14
    prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a),17)) * SIGNED(prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_b);
    prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a <= ld_reg_FracX15dto0_uid239_sqrtFPL_uid78_fpArcsinXTest_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_0_q_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_a_replace_mem_q;
                prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_b <= reg_s1_uid317_uid320_sqrtPolynomialEvaluator_0_to_prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_1_q;
                prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_q <= prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid338_pT2_uid322_sqrtPolynomialEvaluator(BITSELECT,337)@17
    prodXYTruncFR_uid338_pT2_uid322_sqrtPolynomialEvaluator_in <= prodXY_uid337_pT2_uid322_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid338_pT2_uid322_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid338_pT2_uid322_sqrtPolynomialEvaluator_in(38 downto 15);

	--highBBits_uid324_sqrtPolynomialEvaluator(BITSELECT,323)@17
    highBBits_uid324_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid338_pT2_uid322_sqrtPolynomialEvaluator_b;
    highBBits_uid324_sqrtPolynomialEvaluator_b <= highBBits_uid324_sqrtPolynomialEvaluator_in(23 downto 2);

	--ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_nor(LOGICAL,983)
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_nor_b <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_sticky_ena_q;
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_nor_q <= not (ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_nor_a or ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_nor_b);

	--ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_mem_top(CONSTANT,979)
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_mem_top_q <= "0101";

	--ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmp(LOGICAL,980)
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmp_a <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_mem_top_q;
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdmux_q);
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmp_q <= "1" when ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmp_a = ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmp_b else "0";

	--ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmpReg(REG,981)
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmpReg_q <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_sticky_ena(REG,984)
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_nor_q = "1") THEN
                ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_sticky_ena_q <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_enaAnd(LOGICAL,985)
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_enaAnd_a <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_sticky_ena_q;
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_enaAnd_b <= en;
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_enaAnd_q <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_enaAnd_a and ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_enaAnd_b;

	--ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt(COUNTER,975)
    -- every=1, low=0, high=5, step=1, init=1
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_i = 4 THEN
                      ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_i <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_i - 5;
                    ELSE
                        ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_i <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_i,3));


	--ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdreg(REG,976)
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdreg_q <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdmux(MUX,977)
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdmux_s <= en;
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdmux: PROCESS (ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdmux_s, ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdreg_q, ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdmux_q <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdmux_q <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem(DUALMEM,974)
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_reset0 <= areset;
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_ia <= reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC2_uid314_sqrtTableGenerator_lutmem_0_q;
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_aa <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdreg_q;
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_ab <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdmux_q;
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_iq,
        address_a => ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_aa,
        data_a => ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_ia
    );
        ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_q <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_iq(7 downto 0);

	--ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_outputreg(DELAY,973)
    ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_mem_q, xout => ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC0_uid312_sqrtTableGenerator_lutmem(DUALMEM,345)@15
    memoryC0_uid312_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC0_uid312_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC0_uid312_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC0_uid312_sqrtTableGenerator_lutmem_ab <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_outputreg_q;
    memoryC0_uid312_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_arcsin_s5_memoryC0_uid312_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid312_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid312_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid312_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC0_uid312_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC0_uid312_sqrtTableGenerator_lutmem_ia
    );
        memoryC0_uid312_sqrtTableGenerator_lutmem_q <= memoryC0_uid312_sqrtTableGenerator_lutmem_iq(28 downto 0);

	--sumAHighB_uid325_sqrtPolynomialEvaluator(ADD,324)@17
    sumAHighB_uid325_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((29 downto 29 => memoryC0_uid312_sqrtTableGenerator_lutmem_q(28)) & memoryC0_uid312_sqrtTableGenerator_lutmem_q);
    sumAHighB_uid325_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid324_sqrtPolynomialEvaluator_b(21)) & highBBits_uid324_sqrtPolynomialEvaluator_b);
            sumAHighB_uid325_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid325_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid325_sqrtPolynomialEvaluator_b));
    sumAHighB_uid325_sqrtPolynomialEvaluator_q <= sumAHighB_uid325_sqrtPolynomialEvaluator_o(29 downto 0);


	--lowRangeB_uid323_sqrtPolynomialEvaluator(BITSELECT,322)@17
    lowRangeB_uid323_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid338_pT2_uid322_sqrtPolynomialEvaluator_b(1 downto 0);
    lowRangeB_uid323_sqrtPolynomialEvaluator_b <= lowRangeB_uid323_sqrtPolynomialEvaluator_in(1 downto 0);

	--s2_uid323_uid326_sqrtPolynomialEvaluator(BITJOIN,325)@17
    s2_uid323_uid326_sqrtPolynomialEvaluator_q <= sumAHighB_uid325_sqrtPolynomialEvaluator_q & lowRangeB_uid323_sqrtPolynomialEvaluator_b;

	--fracR_uid241_sqrtFPL_uid78_fpArcsinXTest(BITSELECT,240)@17
    fracR_uid241_sqrtFPL_uid78_fpArcsinXTest_in <= s2_uid323_uid326_sqrtPolynomialEvaluator_q(28 downto 0);
    fracR_uid241_sqrtFPL_uid78_fpArcsinXTest_b <= fracR_uid241_sqrtFPL_uid78_fpArcsinXTest_in(28 downto 6);

	--ld_fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q_to_fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_b(DELAY,652)@8
    ld_fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q_to_fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 9 )
    PORT MAP ( xin => fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q, xout => ld_fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q_to_fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest(MUX,256)@17
    fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_s <= ld_fracSel_uid249_sqrtFPL_uid78_fpArcsinXTest_q_to_fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_b_q;
    fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest: PROCESS (fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_s, en, cstAllZWF_uid10_fpArcsinXTest_q, fracR_uid241_sqrtFPL_uid78_fpArcsinXTest_b, cstAllZWF_uid10_fpArcsinXTest_q, cstNaNWF_uid11_fpArcsinXTest_q)
    BEGIN
            CASE fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_s IS
                  WHEN "00" => fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_q <= cstAllZWF_uid10_fpArcsinXTest_q;
                  WHEN "01" => fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_q <= fracR_uid241_sqrtFPL_uid78_fpArcsinXTest_b;
                  WHEN "10" => fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_q <= cstAllZWF_uid10_fpArcsinXTest_q;
                  WHEN "11" => fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_q <= cstNaNWF_uid11_fpArcsinXTest_q;
                  WHEN OTHERS => fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest(BITJOIN,258)@17
    RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_q <= ld_negZero_uid258_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_c_q & ld_expRPostExc_uid253_sqrtFPL_uid78_fpArcsinXTest_q_to_RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_b_replace_mem_q & fracRPostExc_uid257_sqrtFPL_uid78_fpArcsinXTest_q;

	--SqrtFPL22dto0_uid81_fpArcsinXTest(BITSELECT,80)@17
    SqrtFPL22dto0_uid81_fpArcsinXTest_in <= RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_q(22 downto 0);
    SqrtFPL22dto0_uid81_fpArcsinXTest_b <= SqrtFPL22dto0_uid81_fpArcsinXTest_in(22 downto 0);

	--ld_SqrtFPL22dto0_uid81_fpArcsinXTest_b_to_oSqrtFPLFrac_uid82_fpArcsinXTest_a(DELAY,465)@17
    ld_SqrtFPL22dto0_uid81_fpArcsinXTest_b_to_oSqrtFPLFrac_uid82_fpArcsinXTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => SqrtFPL22dto0_uid81_fpArcsinXTest_b, xout => ld_SqrtFPL22dto0_uid81_fpArcsinXTest_b_to_oSqrtFPLFrac_uid82_fpArcsinXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--oSqrtFPLFrac_uid82_fpArcsinXTest(BITJOIN,81)@18
    oSqrtFPLFrac_uid82_fpArcsinXTest_q <= VCC_q & ld_SqrtFPL22dto0_uid81_fpArcsinXTest_b_to_oSqrtFPLFrac_uid82_fpArcsinXTest_a_q;

	--z2_uid84_fpArcsinXTest(CONSTANT,83)
    z2_uid84_fpArcsinXTest_q <= "00";

	--oSqrtFPLFracZ2_uid85_fpArcsinXTest(BITJOIN,84)@18
    oSqrtFPLFracZ2_uid85_fpArcsinXTest_q <= oSqrtFPLFrac_uid82_fpArcsinXTest_q & z2_uid84_fpArcsinXTest_q;

	--SqrtFPL30dto23_uid79_fpArcsinXTest(BITSELECT,78)@17
    SqrtFPL30dto23_uid79_fpArcsinXTest_in <= RSqrt_uid259_sqrtFPL_uid78_fpArcsinXTest_q(30 downto 0);
    SqrtFPL30dto23_uid79_fpArcsinXTest_b <= SqrtFPL30dto23_uid79_fpArcsinXTest_in(30 downto 23);

	--reg_SqrtFPL30dto23_uid79_fpArcsinXTest_0_to_srVal_uid80_fpArcsinXTest_1(REG,386)@17
    reg_SqrtFPL30dto23_uid79_fpArcsinXTest_0_to_srVal_uid80_fpArcsinXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_SqrtFPL30dto23_uid79_fpArcsinXTest_0_to_srVal_uid80_fpArcsinXTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_SqrtFPL30dto23_uid79_fpArcsinXTest_0_to_srVal_uid80_fpArcsinXTest_1_q <= SqrtFPL30dto23_uid79_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--srVal_uid80_fpArcsinXTest(SUB,79)@18
    srVal_uid80_fpArcsinXTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid14_fpArcsinXTest_q);
    srVal_uid80_fpArcsinXTest_b <= STD_LOGIC_VECTOR("0" & reg_SqrtFPL30dto23_uid79_fpArcsinXTest_0_to_srVal_uid80_fpArcsinXTest_1_q);
            srVal_uid80_fpArcsinXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(srVal_uid80_fpArcsinXTest_a) - UNSIGNED(srVal_uid80_fpArcsinXTest_b));
    srVal_uid80_fpArcsinXTest_q <= srVal_uid80_fpArcsinXTest_o(8 downto 0);


	--srValRange_uid83_fpArcsinXTest(BITSELECT,82)@18
    srValRange_uid83_fpArcsinXTest_in <= srVal_uid80_fpArcsinXTest_q(4 downto 0);
    srValRange_uid83_fpArcsinXTest_b <= srValRange_uid83_fpArcsinXTest_in(4 downto 0);

	--rightShiftStageSel4Dto3_uid271_alignSqrt_uid86_fpArcsinXTest(BITSELECT,270)@18
    rightShiftStageSel4Dto3_uid271_alignSqrt_uid86_fpArcsinXTest_in <= srValRange_uid83_fpArcsinXTest_b;
    rightShiftStageSel4Dto3_uid271_alignSqrt_uid86_fpArcsinXTest_b <= rightShiftStageSel4Dto3_uid271_alignSqrt_uid86_fpArcsinXTest_in(4 downto 3);

	--rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest(MUX,271)@18
    rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_s <= rightShiftStageSel4Dto3_uid271_alignSqrt_uid86_fpArcsinXTest_b;
    rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest: PROCESS (rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_s, en, oSqrtFPLFracZ2_uid85_fpArcsinXTest_q, rightShiftStage0Idx1_uid264_alignSqrt_uid86_fpArcsinXTest_q, rightShiftStage0Idx2_uid267_alignSqrt_uid86_fpArcsinXTest_q, rightShiftStage0Idx3_uid270_alignSqrt_uid86_fpArcsinXTest_q)
    BEGIN
            CASE rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_s IS
                  WHEN "00" => rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_q <= oSqrtFPLFracZ2_uid85_fpArcsinXTest_q;
                  WHEN "01" => rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_q <= rightShiftStage0Idx1_uid264_alignSqrt_uid86_fpArcsinXTest_q;
                  WHEN "10" => rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_q <= rightShiftStage0Idx2_uid267_alignSqrt_uid86_fpArcsinXTest_q;
                  WHEN "11" => rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_q <= rightShiftStage0Idx3_uid270_alignSqrt_uid86_fpArcsinXTest_q;
                  WHEN OTHERS => rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage025dto6_uid279_alignSqrt_uid86_fpArcsinXTest(BITSELECT,278)@18
    RightShiftStage025dto6_uid279_alignSqrt_uid86_fpArcsinXTest_in <= rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_q;
    RightShiftStage025dto6_uid279_alignSqrt_uid86_fpArcsinXTest_b <= RightShiftStage025dto6_uid279_alignSqrt_uid86_fpArcsinXTest_in(25 downto 6);

	--rightShiftStage1Idx3_uid281_alignSqrt_uid86_fpArcsinXTest(BITJOIN,280)@18
    rightShiftStage1Idx3_uid281_alignSqrt_uid86_fpArcsinXTest_q <= rightShiftStage1Idx3Pad6_uid280_alignSqrt_uid86_fpArcsinXTest_q & RightShiftStage025dto6_uid279_alignSqrt_uid86_fpArcsinXTest_b;

	--reg_rightShiftStage1Idx3_uid281_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_5(REG,391)@18
    reg_rightShiftStage1Idx3_uid281_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx3_uid281_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_5_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx3_uid281_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_5_q <= rightShiftStage1Idx3_uid281_alignSqrt_uid86_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--RightShiftStage025dto4_uid276_alignSqrt_uid86_fpArcsinXTest(BITSELECT,275)@18
    RightShiftStage025dto4_uid276_alignSqrt_uid86_fpArcsinXTest_in <= rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_q;
    RightShiftStage025dto4_uid276_alignSqrt_uid86_fpArcsinXTest_b <= RightShiftStage025dto4_uid276_alignSqrt_uid86_fpArcsinXTest_in(25 downto 4);

	--rightShiftStage1Idx2_uid278_alignSqrt_uid86_fpArcsinXTest(BITJOIN,277)@18
    rightShiftStage1Idx2_uid278_alignSqrt_uid86_fpArcsinXTest_q <= leftShiftStage0Idx1Pad4_uid120_fxpX_uid48_fpArcsinXTest_q & RightShiftStage025dto4_uid276_alignSqrt_uid86_fpArcsinXTest_b;

	--reg_rightShiftStage1Idx2_uid278_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_4(REG,390)@18
    reg_rightShiftStage1Idx2_uid278_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx2_uid278_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_4_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx2_uid278_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_4_q <= rightShiftStage1Idx2_uid278_alignSqrt_uid86_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--RightShiftStage025dto2_uid273_alignSqrt_uid86_fpArcsinXTest(BITSELECT,272)@18
    RightShiftStage025dto2_uid273_alignSqrt_uid86_fpArcsinXTest_in <= rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_q;
    RightShiftStage025dto2_uid273_alignSqrt_uid86_fpArcsinXTest_b <= RightShiftStage025dto2_uid273_alignSqrt_uid86_fpArcsinXTest_in(25 downto 2);

	--rightShiftStage1Idx1_uid275_alignSqrt_uid86_fpArcsinXTest(BITJOIN,274)@18
    rightShiftStage1Idx1_uid275_alignSqrt_uid86_fpArcsinXTest_q <= z2_uid84_fpArcsinXTest_q & RightShiftStage025dto2_uid273_alignSqrt_uid86_fpArcsinXTest_b;

	--reg_rightShiftStage1Idx1_uid275_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_3(REG,389)@18
    reg_rightShiftStage1Idx1_uid275_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1Idx1_uid275_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_3_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1Idx1_uid275_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_3_q <= rightShiftStage1Idx1_uid275_alignSqrt_uid86_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_2(REG,388)@18
    reg_rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_2_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_2_q <= rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid282_alignSqrt_uid86_fpArcsinXTest(BITSELECT,281)@18
    rightShiftStageSel2Dto1_uid282_alignSqrt_uid86_fpArcsinXTest_in <= srValRange_uid83_fpArcsinXTest_b(2 downto 0);
    rightShiftStageSel2Dto1_uid282_alignSqrt_uid86_fpArcsinXTest_b <= rightShiftStageSel2Dto1_uid282_alignSqrt_uid86_fpArcsinXTest_in(2 downto 1);

	--reg_rightShiftStageSel2Dto1_uid282_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_1(REG,387)@18
    reg_rightShiftStageSel2Dto1_uid282_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid282_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid282_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_1_q <= rightShiftStageSel2Dto1_uid282_alignSqrt_uid86_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest(MUX,282)@19
    rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_s <= reg_rightShiftStageSel2Dto1_uid282_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_1_q;
    rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest: PROCESS (rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_s, en, reg_rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_2_q, reg_rightShiftStage1Idx1_uid275_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_3_q, reg_rightShiftStage1Idx2_uid278_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_4_q, reg_rightShiftStage1Idx3_uid281_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_5_q)
    BEGIN
            CASE rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_s IS
                  WHEN "00" => rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_q <= reg_rightShiftStage0_uid272_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_2_q;
                  WHEN "01" => rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_q <= reg_rightShiftStage1Idx1_uid275_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_3_q;
                  WHEN "10" => rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_q <= reg_rightShiftStage1Idx2_uid278_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_4_q;
                  WHEN "11" => rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_q <= reg_rightShiftStage1Idx3_uid281_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_5_q;
                  WHEN OTHERS => rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid287_alignSqrt_uid86_fpArcsinXTest(BITSELECT,286)@18
    rightShiftStageSel0Dto0_uid287_alignSqrt_uid86_fpArcsinXTest_in <= srValRange_uid83_fpArcsinXTest_b(0 downto 0);
    rightShiftStageSel0Dto0_uid287_alignSqrt_uid86_fpArcsinXTest_b <= rightShiftStageSel0Dto0_uid287_alignSqrt_uid86_fpArcsinXTest_in(0 downto 0);

	--reg_rightShiftStageSel0Dto0_uid287_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_1(REG,392)@18
    reg_rightShiftStageSel0Dto0_uid287_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid287_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid287_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_1_q <= rightShiftStageSel0Dto0_uid287_alignSqrt_uid86_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest(MUX,287)@19
    rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_s <= reg_rightShiftStageSel0Dto0_uid287_alignSqrt_uid86_fpArcsinXTest_0_to_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_1_q;
    rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest: PROCESS (rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_s, en, rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_q, rightShiftStage2Idx1_uid286_alignSqrt_uid86_fpArcsinXTest_q)
    BEGIN
            CASE rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_s IS
                  WHEN "0" => rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q <= rightShiftStage1_uid283_alignSqrt_uid86_fpArcsinXTest_q;
                  WHEN "1" => rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q <= rightShiftStage2Idx1_uid286_alignSqrt_uid86_fpArcsinXTest_q;
                  WHEN OTHERS => rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--mAddr_uid88_fpArcsinXTest(BITSELECT,87)@19
    mAddr_uid88_fpArcsinXTest_in <= rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q;
    mAddr_uid88_fpArcsinXTest_b <= mAddr_uid88_fpArcsinXTest_in(25 downto 18);

	--reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC2_uid292_arcsinXTabGen_lutmem_0(REG,393)@19
    reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC2_uid292_arcsinXTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC2_uid292_arcsinXTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC2_uid292_arcsinXTabGen_lutmem_0_q <= mAddr_uid88_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid292_arcsinXTabGen_lutmem(DUALMEM,344)@20
    memoryC2_uid292_arcsinXTabGen_lutmem_reset0 <= areset;
    memoryC2_uid292_arcsinXTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid292_arcsinXTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid292_arcsinXTabGen_lutmem_ab <= reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC2_uid292_arcsinXTabGen_lutmem_0_q;
    memoryC2_uid292_arcsinXTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arcsin_s5_memoryC2_uid292_arcsinXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid292_arcsinXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid292_arcsinXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid292_arcsinXTabGen_lutmem_iq,
        address_a => memoryC2_uid292_arcsinXTabGen_lutmem_aa,
        data_a => memoryC2_uid292_arcsinXTabGen_lutmem_ia
    );
        memoryC2_uid292_arcsinXTabGen_lutmem_q <= memoryC2_uid292_arcsinXTabGen_lutmem_iq(12 downto 0);

	--reg_memoryC2_uid292_arcsinXTabGen_lutmem_0_to_prodXY_uid328_pT1_uid294_arcsinXPolyEval_1(REG,395)@22
    reg_memoryC2_uid292_arcsinXTabGen_lutmem_0_to_prodXY_uid328_pT1_uid294_arcsinXPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid292_arcsinXTabGen_lutmem_0_to_prodXY_uid328_pT1_uid294_arcsinXPolyEval_1_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid292_arcsinXTabGen_lutmem_0_to_prodXY_uid328_pT1_uid294_arcsinXPolyEval_1_q <= memoryC2_uid292_arcsinXTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q_to_mPPolyEval_uid89_fpArcsinXTest_a_inputreg(DELAY,822)
    ld_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q_to_mPPolyEval_uid89_fpArcsinXTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q, xout => ld_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q_to_mPPolyEval_uid89_fpArcsinXTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q_to_mPPolyEval_uid89_fpArcsinXTest_a(DELAY,469)@19
    ld_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q_to_mPPolyEval_uid89_fpArcsinXTest_a : dspba_delay
    GENERIC MAP ( width => 26, depth => 2 )
    PORT MAP ( xin => ld_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q_to_mPPolyEval_uid89_fpArcsinXTest_a_inputreg_q, xout => ld_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q_to_mPPolyEval_uid89_fpArcsinXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--mPPolyEval_uid89_fpArcsinXTest(BITSELECT,88)@22
    mPPolyEval_uid89_fpArcsinXTest_in <= ld_rightShiftStage2_uid288_alignSqrt_uid86_fpArcsinXTest_q_to_mPPolyEval_uid89_fpArcsinXTest_a_q(17 downto 0);
    mPPolyEval_uid89_fpArcsinXTest_b <= mPPolyEval_uid89_fpArcsinXTest_in(17 downto 1);

	--yT1_uid293_arcsinXPolyEval(BITSELECT,292)@22
    yT1_uid293_arcsinXPolyEval_in <= mPPolyEval_uid89_fpArcsinXTest_b;
    yT1_uid293_arcsinXPolyEval_b <= yT1_uid293_arcsinXPolyEval_in(16 downto 4);

	--reg_yT1_uid293_arcsinXPolyEval_0_to_prodXY_uid328_pT1_uid294_arcsinXPolyEval_0(REG,394)@22
    reg_yT1_uid293_arcsinXPolyEval_0_to_prodXY_uid328_pT1_uid294_arcsinXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid293_arcsinXPolyEval_0_to_prodXY_uid328_pT1_uid294_arcsinXPolyEval_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid293_arcsinXPolyEval_0_to_prodXY_uid328_pT1_uid294_arcsinXPolyEval_0_q <= yT1_uid293_arcsinXPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid328_pT1_uid294_arcsinXPolyEval(MULT,327)@23
    prodXY_uid328_pT1_uid294_arcsinXPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid328_pT1_uid294_arcsinXPolyEval_a),14)) * SIGNED(prodXY_uid328_pT1_uid294_arcsinXPolyEval_b);
    prodXY_uid328_pT1_uid294_arcsinXPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid328_pT1_uid294_arcsinXPolyEval_a <= (others => '0');
            prodXY_uid328_pT1_uid294_arcsinXPolyEval_b <= (others => '0');
            prodXY_uid328_pT1_uid294_arcsinXPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid328_pT1_uid294_arcsinXPolyEval_a <= reg_yT1_uid293_arcsinXPolyEval_0_to_prodXY_uid328_pT1_uid294_arcsinXPolyEval_0_q;
                prodXY_uid328_pT1_uid294_arcsinXPolyEval_b <= reg_memoryC2_uid292_arcsinXTabGen_lutmem_0_to_prodXY_uid328_pT1_uid294_arcsinXPolyEval_1_q;
                prodXY_uid328_pT1_uid294_arcsinXPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid328_pT1_uid294_arcsinXPolyEval_pr,26));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid328_pT1_uid294_arcsinXPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid328_pT1_uid294_arcsinXPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid328_pT1_uid294_arcsinXPolyEval_q <= prodXY_uid328_pT1_uid294_arcsinXPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid329_pT1_uid294_arcsinXPolyEval(BITSELECT,328)@26
    prodXYTruncFR_uid329_pT1_uid294_arcsinXPolyEval_in <= prodXY_uid328_pT1_uid294_arcsinXPolyEval_q;
    prodXYTruncFR_uid329_pT1_uid294_arcsinXPolyEval_b <= prodXYTruncFR_uid329_pT1_uid294_arcsinXPolyEval_in(25 downto 12);

	--highBBits_uid296_arcsinXPolyEval(BITSELECT,295)@26
    highBBits_uid296_arcsinXPolyEval_in <= prodXYTruncFR_uid329_pT1_uid294_arcsinXPolyEval_b;
    highBBits_uid296_arcsinXPolyEval_b <= highBBits_uid296_arcsinXPolyEval_in(13 downto 1);

	--ld_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC1_uid291_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid291_arcsinXTabGen_lutmem_a(DELAY,737)@20
    ld_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC1_uid291_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid291_arcsinXTabGen_lutmem_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC2_uid292_arcsinXTabGen_lutmem_0_q, xout => ld_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC1_uid291_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid291_arcsinXTabGen_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC1_uid291_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid291_arcsinXTabGen_lutmem_a_outputreg(DELAY,972)
    ld_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC1_uid291_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid291_arcsinXTabGen_lutmem_a_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC1_uid291_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid291_arcsinXTabGen_lutmem_a_q, xout => ld_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC1_uid291_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid291_arcsinXTabGen_lutmem_a_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid291_arcsinXTabGen_lutmem(DUALMEM,343)@24
    memoryC1_uid291_arcsinXTabGen_lutmem_reset0 <= areset;
    memoryC1_uid291_arcsinXTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid291_arcsinXTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid291_arcsinXTabGen_lutmem_ab <= ld_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC1_uid291_arcsinXTabGen_lutmem_0_q_to_memoryC1_uid291_arcsinXTabGen_lutmem_a_outputreg_q;
    memoryC1_uid291_arcsinXTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arcsin_s5_memoryC1_uid291_arcsinXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid291_arcsinXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid291_arcsinXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid291_arcsinXTabGen_lutmem_iq,
        address_a => memoryC1_uid291_arcsinXTabGen_lutmem_aa,
        data_a => memoryC1_uid291_arcsinXTabGen_lutmem_ia
    );
        memoryC1_uid291_arcsinXTabGen_lutmem_q <= memoryC1_uid291_arcsinXTabGen_lutmem_iq(22 downto 0);

	--sumAHighB_uid297_arcsinXPolyEval(ADD,296)@26
    sumAHighB_uid297_arcsinXPolyEval_a <= STD_LOGIC_VECTOR((23 downto 23 => memoryC1_uid291_arcsinXTabGen_lutmem_q(22)) & memoryC1_uid291_arcsinXTabGen_lutmem_q);
    sumAHighB_uid297_arcsinXPolyEval_b <= STD_LOGIC_VECTOR((23 downto 13 => highBBits_uid296_arcsinXPolyEval_b(12)) & highBBits_uid296_arcsinXPolyEval_b);
            sumAHighB_uid297_arcsinXPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid297_arcsinXPolyEval_a) + SIGNED(sumAHighB_uid297_arcsinXPolyEval_b));
    sumAHighB_uid297_arcsinXPolyEval_q <= sumAHighB_uid297_arcsinXPolyEval_o(23 downto 0);


	--lowRangeB_uid295_arcsinXPolyEval(BITSELECT,294)@26
    lowRangeB_uid295_arcsinXPolyEval_in <= prodXYTruncFR_uid329_pT1_uid294_arcsinXPolyEval_b(0 downto 0);
    lowRangeB_uid295_arcsinXPolyEval_b <= lowRangeB_uid295_arcsinXPolyEval_in(0 downto 0);

	--s1_uid295_uid298_arcsinXPolyEval(BITJOIN,297)@26
    s1_uid295_uid298_arcsinXPolyEval_q <= sumAHighB_uid297_arcsinXPolyEval_q & lowRangeB_uid295_arcsinXPolyEval_b;

	--reg_s1_uid295_uid298_arcsinXPolyEval_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_1(REG,398)@26
    reg_s1_uid295_uid298_arcsinXPolyEval_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid295_uid298_arcsinXPolyEval_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_1_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid295_uid298_arcsinXPolyEval_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_1_q <= s1_uid295_uid298_arcsinXPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_nor(LOGICAL,957)
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_nor_b <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_sticky_ena_q;
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_nor_q <= not (ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_nor_a or ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_nor_b);

	--ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_sticky_ena(REG,958)
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_nor_q = "1") THEN
                ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_sticky_ena_q <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_enaAnd(LOGICAL,959)
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_enaAnd_a <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_sticky_ena_q;
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_enaAnd_b <= en;
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_enaAnd_q <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_enaAnd_a and ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_enaAnd_b;

	--reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0(REG,397)@22
    reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q <= mPPolyEval_uid89_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem(DUALMEM,948)
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_reset0 <= areset;
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_ia <= reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q;
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_aa <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdreg_q;
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_ab <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_rdmux_q;
    ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_iq,
        address_a => ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_aa,
        data_a => ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_ia
    );
        ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_q <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_iq(16 downto 0);

	--prodXY_uid331_pT2_uid300_arcsinXPolyEval(MULT,330)@27
    prodXY_uid331_pT2_uid300_arcsinXPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid331_pT2_uid300_arcsinXPolyEval_a),18)) * SIGNED(prodXY_uid331_pT2_uid300_arcsinXPolyEval_b);
    prodXY_uid331_pT2_uid300_arcsinXPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid331_pT2_uid300_arcsinXPolyEval_a <= (others => '0');
            prodXY_uid331_pT2_uid300_arcsinXPolyEval_b <= (others => '0');
            prodXY_uid331_pT2_uid300_arcsinXPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid331_pT2_uid300_arcsinXPolyEval_a <= ld_reg_mPPolyEval_uid89_fpArcsinXTest_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_0_q_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_a_replace_mem_q;
                prodXY_uid331_pT2_uid300_arcsinXPolyEval_b <= reg_s1_uid295_uid298_arcsinXPolyEval_0_to_prodXY_uid331_pT2_uid300_arcsinXPolyEval_1_q;
                prodXY_uid331_pT2_uid300_arcsinXPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid331_pT2_uid300_arcsinXPolyEval_pr,42));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid331_pT2_uid300_arcsinXPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid331_pT2_uid300_arcsinXPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid331_pT2_uid300_arcsinXPolyEval_q <= prodXY_uid331_pT2_uid300_arcsinXPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid332_pT2_uid300_arcsinXPolyEval(BITSELECT,331)@30
    prodXYTruncFR_uid332_pT2_uid300_arcsinXPolyEval_in <= prodXY_uid331_pT2_uid300_arcsinXPolyEval_q;
    prodXYTruncFR_uid332_pT2_uid300_arcsinXPolyEval_b <= prodXYTruncFR_uid332_pT2_uid300_arcsinXPolyEval_in(41 downto 16);

	--highBBits_uid302_arcsinXPolyEval(BITSELECT,301)@30
    highBBits_uid302_arcsinXPolyEval_in <= prodXYTruncFR_uid332_pT2_uid300_arcsinXPolyEval_b;
    highBBits_uid302_arcsinXPolyEval_b <= highBBits_uid302_arcsinXPolyEval_in(25 downto 2);

	--ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_nor(LOGICAL,1024)
    ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_nor_b <= ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_sticky_ena_q;
    ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_nor_q <= not (ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_nor_a or ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_nor_b);

	--ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_sticky_ena(REG,1025)
    ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_nor_q = "1") THEN
                ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_sticky_ena_q <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_enaAnd(LOGICAL,1026)
    ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_enaAnd_a <= ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_sticky_ena_q;
    ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_enaAnd_b <= en;
    ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_enaAnd_q <= ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_enaAnd_a and ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_enaAnd_b;

	--ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_inputreg(DELAY,1014)
    ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => mAddr_uid88_fpArcsinXTest_b, xout => ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem(DUALMEM,1015)
    ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_reset0 <= areset;
    ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_ia <= ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_inputreg_q;
    ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_aa <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdreg_q;
    ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_ab <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdmux_q;
    ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_iq,
        address_a => ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_aa,
        data_a => ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_ia
    );
        ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_q <= ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0(REG,399)@27
    reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_q <= ld_mAddr_uid88_fpArcsinXTest_b_to_reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid290_arcsinXTabGen_lutmem(DUALMEM,342)@28
    memoryC0_uid290_arcsinXTabGen_lutmem_reset0 <= areset;
    memoryC0_uid290_arcsinXTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid290_arcsinXTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid290_arcsinXTabGen_lutmem_ab <= reg_mAddr_uid88_fpArcsinXTest_0_to_memoryC0_uid290_arcsinXTabGen_lutmem_0_q;
    memoryC0_uid290_arcsinXTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arcsin_s5_memoryC0_uid290_arcsinXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid290_arcsinXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid290_arcsinXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid290_arcsinXTabGen_lutmem_iq,
        address_a => memoryC0_uid290_arcsinXTabGen_lutmem_aa,
        data_a => memoryC0_uid290_arcsinXTabGen_lutmem_ia
    );
        memoryC0_uid290_arcsinXTabGen_lutmem_q <= memoryC0_uid290_arcsinXTabGen_lutmem_iq(29 downto 0);

	--sumAHighB_uid303_arcsinXPolyEval(ADD,302)@30
    sumAHighB_uid303_arcsinXPolyEval_a <= STD_LOGIC_VECTOR((30 downto 30 => memoryC0_uid290_arcsinXTabGen_lutmem_q(29)) & memoryC0_uid290_arcsinXTabGen_lutmem_q);
    sumAHighB_uid303_arcsinXPolyEval_b <= STD_LOGIC_VECTOR((30 downto 24 => highBBits_uid302_arcsinXPolyEval_b(23)) & highBBits_uid302_arcsinXPolyEval_b);
            sumAHighB_uid303_arcsinXPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid303_arcsinXPolyEval_a) + SIGNED(sumAHighB_uid303_arcsinXPolyEval_b));
    sumAHighB_uid303_arcsinXPolyEval_q <= sumAHighB_uid303_arcsinXPolyEval_o(30 downto 0);


	--lowRangeB_uid301_arcsinXPolyEval(BITSELECT,300)@30
    lowRangeB_uid301_arcsinXPolyEval_in <= prodXYTruncFR_uid332_pT2_uid300_arcsinXPolyEval_b(1 downto 0);
    lowRangeB_uid301_arcsinXPolyEval_b <= lowRangeB_uid301_arcsinXPolyEval_in(1 downto 0);

	--s2_uid301_uid304_arcsinXPolyEval(BITJOIN,303)@30
    s2_uid301_uid304_arcsinXPolyEval_q <= sumAHighB_uid303_arcsinXPolyEval_q & lowRangeB_uid301_arcsinXPolyEval_b;

	--fxpArcsinX_uid91_fpArcsinXTest(BITSELECT,90)@30
    fxpArcsinX_uid91_fpArcsinXTest_in <= s2_uid301_uid304_arcsinXPolyEval_q(30 downto 0);
    fxpArcsinX_uid91_fpArcsinXTest_b <= fxpArcsinX_uid91_fpArcsinXTest_in(30 downto 3);

	--reg_fxpArcsinX_uid91_fpArcsinXTest_0_to_path3Diff_uid93_fpArcsinXTest_1(REG,400)@30
    reg_fxpArcsinX_uid91_fpArcsinXTest_0_to_path3Diff_uid93_fpArcsinXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpArcsinX_uid91_fpArcsinXTest_0_to_path3Diff_uid93_fpArcsinXTest_1_q <= "0000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpArcsinX_uid91_fpArcsinXTest_0_to_path3Diff_uid93_fpArcsinXTest_1_q <= fxpArcsinX_uid91_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--piO2_uid92_fpArcsinXTest(CONSTANT,91)
    piO2_uid92_fpArcsinXTest_q <= "1100100100001111110110101010";

	--path3Diff_uid93_fpArcsinXTest(SUB,92)@31
    path3Diff_uid93_fpArcsinXTest_a <= STD_LOGIC_VECTOR("0" & piO2_uid92_fpArcsinXTest_q);
    path3Diff_uid93_fpArcsinXTest_b <= STD_LOGIC_VECTOR("0" & reg_fxpArcsinX_uid91_fpArcsinXTest_0_to_path3Diff_uid93_fpArcsinXTest_1_q);
            path3Diff_uid93_fpArcsinXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path3Diff_uid93_fpArcsinXTest_a) - UNSIGNED(path3Diff_uid93_fpArcsinXTest_b));
    path3Diff_uid93_fpArcsinXTest_q <= path3Diff_uid93_fpArcsinXTest_o(28 downto 0);


	--normBitPath3Diff_uid94_fpArcsinXTest(BITSELECT,93)@31
    normBitPath3Diff_uid94_fpArcsinXTest_in <= path3Diff_uid93_fpArcsinXTest_q(27 downto 0);
    normBitPath3Diff_uid94_fpArcsinXTest_b <= normBitPath3Diff_uid94_fpArcsinXTest_in(27 downto 27);

	--expRPath3_uid98_fpArcsinXTest(MUX,97)@31
    expRPath3_uid98_fpArcsinXTest_s <= normBitPath3Diff_uid94_fpArcsinXTest_b;
    expRPath3_uid98_fpArcsinXTest: PROCESS (expRPath3_uid98_fpArcsinXTest_s, en, cstBiasM1_uid14_fpArcsinXTest_q, cstBias_uid13_fpArcsinXTest_q)
    BEGIN
            CASE expRPath3_uid98_fpArcsinXTest_s IS
                  WHEN "0" => expRPath3_uid98_fpArcsinXTest_q <= cstBiasM1_uid14_fpArcsinXTest_q;
                  WHEN "1" => expRPath3_uid98_fpArcsinXTest_q <= cstBias_uid13_fpArcsinXTest_q;
                  WHEN OTHERS => expRPath3_uid98_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--path3DiffHigh_uid95_fpArcsinXTest(BITSELECT,94)@31
    path3DiffHigh_uid95_fpArcsinXTest_in <= path3Diff_uid93_fpArcsinXTest_q(26 downto 0);
    path3DiffHigh_uid95_fpArcsinXTest_b <= path3DiffHigh_uid95_fpArcsinXTest_in(26 downto 3);

	--path3DiffLow_uid96_fpArcsinXTest(BITSELECT,95)@31
    path3DiffLow_uid96_fpArcsinXTest_in <= path3Diff_uid93_fpArcsinXTest_q(25 downto 0);
    path3DiffLow_uid96_fpArcsinXTest_b <= path3DiffLow_uid96_fpArcsinXTest_in(25 downto 2);

	--fracRPath3_uid97_fpArcsinXTest(MUX,96)@31
    fracRPath3_uid97_fpArcsinXTest_s <= normBitPath3Diff_uid94_fpArcsinXTest_b;
    fracRPath3_uid97_fpArcsinXTest: PROCESS (fracRPath3_uid97_fpArcsinXTest_s, en, path3DiffLow_uid96_fpArcsinXTest_b, path3DiffHigh_uid95_fpArcsinXTest_b)
    BEGIN
            CASE fracRPath3_uid97_fpArcsinXTest_s IS
                  WHEN "0" => fracRPath3_uid97_fpArcsinXTest_q <= path3DiffLow_uid96_fpArcsinXTest_b;
                  WHEN "1" => fracRPath3_uid97_fpArcsinXTest_q <= path3DiffHigh_uid95_fpArcsinXTest_b;
                  WHEN OTHERS => fracRPath3_uid97_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracConc_uid99_uid99_fpArcsinXTest(BITJOIN,98)@31
    expFracConc_uid99_uid99_fpArcsinXTest_q <= expRPath3_uid98_fpArcsinXTest_q & fracRPath3_uid97_fpArcsinXTest_q;

	--reg_expFracConc_uid99_uid99_fpArcsinXTest_0_to_expFracRPath2PostRnd_uid100_fpArcsinXTest_0(REG,401)@31
    reg_expFracConc_uid99_uid99_fpArcsinXTest_0_to_expFracRPath2PostRnd_uid100_fpArcsinXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracConc_uid99_uid99_fpArcsinXTest_0_to_expFracRPath2PostRnd_uid100_fpArcsinXTest_0_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracConc_uid99_uid99_fpArcsinXTest_0_to_expFracRPath2PostRnd_uid100_fpArcsinXTest_0_q <= expFracConc_uid99_uid99_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracRPath2PostRnd_uid100_fpArcsinXTest(ADD,99)@32
    expFracRPath2PostRnd_uid100_fpArcsinXTest_a <= STD_LOGIC_VECTOR("0" & reg_expFracConc_uid99_uid99_fpArcsinXTest_0_to_expFracRPath2PostRnd_uid100_fpArcsinXTest_0_q);
    expFracRPath2PostRnd_uid100_fpArcsinXTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & VCC_q);
            expFracRPath2PostRnd_uid100_fpArcsinXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPath2PostRnd_uid100_fpArcsinXTest_a) + UNSIGNED(expFracRPath2PostRnd_uid100_fpArcsinXTest_b));
    expFracRPath2PostRnd_uid100_fpArcsinXTest_q <= expFracRPath2PostRnd_uid100_fpArcsinXTest_o(32 downto 0);


	--expRPath3_uid102_fpArcsinXTest(BITSELECT,101)@32
    expRPath3_uid102_fpArcsinXTest_in <= expFracRPath2PostRnd_uid100_fpArcsinXTest_q(31 downto 0);
    expRPath3_uid102_fpArcsinXTest_b <= expRPath3_uid102_fpArcsinXTest_in(31 downto 24);

	--ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_nor(LOGICAL,883)
    ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_nor_b <= ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_sticky_ena_q;
    ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_nor_q <= not (ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_nor_a or ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_nor_b);

	--ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_mem_top(CONSTANT,815)
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_mem_top_q <= "01101";

	--ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmp(LOGICAL,816)
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmp_a <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_mem_top_q;
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdmux_q);
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmp_q <= "1" when ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmp_a = ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmp_b else "0";

	--ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmpReg(REG,817)
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmpReg_q <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_sticky_ena(REG,884)
    ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_nor_q = "1") THEN
                ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_sticky_ena_q <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_enaAnd(LOGICAL,885)
    ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_enaAnd_a <= ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_sticky_ena_q;
    ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_enaAnd_b <= en;
    ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_enaAnd_q <= ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_enaAnd_a and ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_enaAnd_b;

	--yAddr_uid54_fpArcsinXTest(BITSELECT,53)@1
    yAddr_uid54_fpArcsinXTest_in <= y_uid50_fpArcsinXTest_b;
    yAddr_uid54_fpArcsinXTest_b <= yAddr_uid54_fpArcsinXTest_in(34 downto 27);

	--reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC2_uid145_arcsinXO2XTabGen_lutmem_0(REG,354)@1
    reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC2_uid145_arcsinXO2XTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC2_uid145_arcsinXO2XTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC2_uid145_arcsinXO2XTabGen_lutmem_0_q <= yAddr_uid54_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid145_arcsinXO2XTabGen_lutmem(DUALMEM,341)@2
    memoryC2_uid145_arcsinXO2XTabGen_lutmem_reset0 <= areset;
    memoryC2_uid145_arcsinXO2XTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid145_arcsinXO2XTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid145_arcsinXO2XTabGen_lutmem_ab <= reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC2_uid145_arcsinXO2XTabGen_lutmem_0_q;
    memoryC2_uid145_arcsinXO2XTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arcsin_s5_memoryC2_uid145_arcsinXO2XTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid145_arcsinXO2XTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid145_arcsinXO2XTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid145_arcsinXO2XTabGen_lutmem_iq,
        address_a => memoryC2_uid145_arcsinXO2XTabGen_lutmem_aa,
        data_a => memoryC2_uid145_arcsinXO2XTabGen_lutmem_ia
    );
        memoryC2_uid145_arcsinXO2XTabGen_lutmem_q <= memoryC2_uid145_arcsinXO2XTabGen_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid145_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_1(REG,356)@4
    reg_memoryC2_uid145_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid145_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid145_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_1_q <= memoryC2_uid145_arcsinXO2XTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_nor(LOGICAL,945)
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_nor_b <= ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_sticky_ena_q;
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_nor_q <= not (ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_nor_a or ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_nor_b);

	--ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_cmpReg(REG,943)
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_sticky_ena(REG,946)
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_nor_q = "1") THEN
                ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_sticky_ena_q <= ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_enaAnd(LOGICAL,947)
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_enaAnd_a <= ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_sticky_ena_q;
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_enaAnd_b <= en;
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_enaAnd_q <= ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_enaAnd_a and ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_enaAnd_b;

	--yPPolyEval_uid55_fpArcsinXTest(BITSELECT,54)@1
    yPPolyEval_uid55_fpArcsinXTest_in <= y_uid50_fpArcsinXTest_b(26 downto 0);
    yPPolyEval_uid55_fpArcsinXTest_b <= yPPolyEval_uid55_fpArcsinXTest_in(26 downto 9);

	--yT1_uid146_arcsinXO2XPolyEval(BITSELECT,145)@1
    yT1_uid146_arcsinXO2XPolyEval_in <= yPPolyEval_uid55_fpArcsinXTest_b;
    yT1_uid146_arcsinXO2XPolyEval_b <= yT1_uid146_arcsinXO2XPolyEval_in(17 downto 6);

	--reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0(REG,355)@1
    reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q <= yT1_uid146_arcsinXO2XPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdcnt(COUNTER,939)
    -- every=1, low=0, high=1, step=1, init=1
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdcnt_i <= ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdcnt_i,1));


	--ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdreg(REG,940)
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdreg_q <= ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdmux(MUX,941)
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdmux_s <= en;
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdmux: PROCESS (ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdmux_s, ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdreg_q, ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdmux_q <= ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdmux_q <= ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem(DUALMEM,938)
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_reset0 <= areset;
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_ia <= reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q;
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_aa <= ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdreg_q;
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_ab <= ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_rdmux_q;
    ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 12,
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
        clocken1 => ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_iq,
        address_a => ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_aa,
        data_a => ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_ia
    );
        ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_q <= ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_iq(11 downto 0);

	--prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval(MULT,305)@5
    prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a),13)) * SIGNED(prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_b);
    prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a <= (others => '0');
            prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_b <= (others => '0');
            prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a <= ld_reg_yT1_uid146_arcsinXO2XPolyEval_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_0_q_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_a_replace_mem_q;
                prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_b <= reg_memoryC2_uid145_arcsinXO2XTabGen_lutmem_0_to_prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_1_q;
                prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_q <= prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid307_pT1_uid147_arcsinXO2XPolyEval(BITSELECT,306)@8
    prodXYTruncFR_uid307_pT1_uid147_arcsinXO2XPolyEval_in <= prodXY_uid306_pT1_uid147_arcsinXO2XPolyEval_q;
    prodXYTruncFR_uid307_pT1_uid147_arcsinXO2XPolyEval_b <= prodXYTruncFR_uid307_pT1_uid147_arcsinXO2XPolyEval_in(23 downto 11);

	--highBBits_uid149_arcsinXO2XPolyEval(BITSELECT,148)@8
    highBBits_uid149_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid307_pT1_uid147_arcsinXO2XPolyEval_b;
    highBBits_uid149_arcsinXO2XPolyEval_b <= highBBits_uid149_arcsinXO2XPolyEval_in(12 downto 1);

	--ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_a_inputreg(DELAY,986)
    ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => yAddr_uid54_fpArcsinXTest_b, xout => ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_a(DELAY,751)@1
    ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_a_inputreg_q, xout => ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0(REG,357)@5
    reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_q <= ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid144_arcsinXO2XTabGen_lutmem(DUALMEM,340)@6
    memoryC1_uid144_arcsinXO2XTabGen_lutmem_reset0 <= areset;
    memoryC1_uid144_arcsinXO2XTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid144_arcsinXO2XTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid144_arcsinXO2XTabGen_lutmem_ab <= reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_q;
    memoryC1_uid144_arcsinXO2XTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arcsin_s5_memoryC1_uid144_arcsinXO2XTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid144_arcsinXO2XTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid144_arcsinXO2XTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid144_arcsinXO2XTabGen_lutmem_iq,
        address_a => memoryC1_uid144_arcsinXO2XTabGen_lutmem_aa,
        data_a => memoryC1_uid144_arcsinXO2XTabGen_lutmem_ia
    );
        memoryC1_uid144_arcsinXO2XTabGen_lutmem_q <= memoryC1_uid144_arcsinXO2XTabGen_lutmem_iq(18 downto 0);

	--sumAHighB_uid150_arcsinXO2XPolyEval(ADD,149)@8
    sumAHighB_uid150_arcsinXO2XPolyEval_a <= STD_LOGIC_VECTOR((19 downto 19 => memoryC1_uid144_arcsinXO2XTabGen_lutmem_q(18)) & memoryC1_uid144_arcsinXO2XTabGen_lutmem_q);
    sumAHighB_uid150_arcsinXO2XPolyEval_b <= STD_LOGIC_VECTOR((19 downto 12 => highBBits_uid149_arcsinXO2XPolyEval_b(11)) & highBBits_uid149_arcsinXO2XPolyEval_b);
            sumAHighB_uid150_arcsinXO2XPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid150_arcsinXO2XPolyEval_a) + SIGNED(sumAHighB_uid150_arcsinXO2XPolyEval_b));
    sumAHighB_uid150_arcsinXO2XPolyEval_q <= sumAHighB_uid150_arcsinXO2XPolyEval_o(19 downto 0);


	--lowRangeB_uid148_arcsinXO2XPolyEval(BITSELECT,147)@8
    lowRangeB_uid148_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid307_pT1_uid147_arcsinXO2XPolyEval_b(0 downto 0);
    lowRangeB_uid148_arcsinXO2XPolyEval_b <= lowRangeB_uid148_arcsinXO2XPolyEval_in(0 downto 0);

	--s1_uid148_uid151_arcsinXO2XPolyEval(BITJOIN,150)@8
    s1_uid148_uid151_arcsinXO2XPolyEval_q <= sumAHighB_uid150_arcsinXO2XPolyEval_q & lowRangeB_uid148_arcsinXO2XPolyEval_b;

	--reg_s1_uid148_uid151_arcsinXO2XPolyEval_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_1(REG,359)@8
    reg_s1_uid148_uid151_arcsinXO2XPolyEval_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid148_uid151_arcsinXO2XPolyEval_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_1_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid148_uid151_arcsinXO2XPolyEval_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_1_q <= s1_uid148_uid151_arcsinXO2XPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_nor(LOGICAL,997)
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_nor_b <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_sticky_ena_q;
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_nor_q <= not (ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_nor_a or ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_nor_b);

	--ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_mem_top(CONSTANT,993)
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_mem_top_q <= "0100";

	--ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmp(LOGICAL,994)
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmp_a <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_mem_top_q;
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdmux_q);
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmp_q <= "1" when ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmp_a = ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmp_b else "0";

	--ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmpReg(REG,995)
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmpReg_q <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_sticky_ena(REG,998)
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_nor_q = "1") THEN
                ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_sticky_ena_q <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_enaAnd(LOGICAL,999)
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_enaAnd_a <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_sticky_ena_q;
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_enaAnd_b <= en;
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_enaAnd_q <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_enaAnd_a and ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_enaAnd_b;

	--ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_inputreg(DELAY,987)
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => yPPolyEval_uid55_fpArcsinXTest_b, xout => ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt(COUNTER,989)
    -- every=1, low=0, high=4, step=1, init=1
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_i = 3 THEN
                      ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_eq = '1') THEN
                        ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_i <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_i <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_i,3));


	--ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdreg(REG,990)
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdreg_q <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdmux(MUX,991)
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdmux_s <= en;
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdmux: PROCESS (ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdmux_s, ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdreg_q, ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdmux_q <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdreg_q;
                  WHEN "1" => ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdmux_q <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem(DUALMEM,988)
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_reset0 <= areset;
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_ia <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_inputreg_q;
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_aa <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdreg_q;
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_ab <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_rdmux_q;
    ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 18,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 18,
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
        clocken1 => ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_iq,
        address_a => ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_aa,
        data_a => ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_ia
    );
        ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_q <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_iq(17 downto 0);

	--reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0(REG,358)@8
    reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_q <= ld_yPPolyEval_uid55_fpArcsinXTest_b_to_reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval(MULT,308)@9
    prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_a),19)) * SIGNED(prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_b);
    prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_a <= (others => '0');
            prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_b <= (others => '0');
            prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_a <= reg_yPPolyEval_uid55_fpArcsinXTest_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_0_q;
                prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_b <= reg_s1_uid148_uid151_arcsinXO2XPolyEval_0_to_prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_1_q;
                prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_q <= prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid310_pT2_uid153_arcsinXO2XPolyEval(BITSELECT,309)@12
    prodXYTruncFR_uid310_pT2_uid153_arcsinXO2XPolyEval_in <= prodXY_uid309_pT2_uid153_arcsinXO2XPolyEval_q;
    prodXYTruncFR_uid310_pT2_uid153_arcsinXO2XPolyEval_b <= prodXYTruncFR_uid310_pT2_uid153_arcsinXO2XPolyEval_in(38 downto 17);

	--highBBits_uid155_arcsinXO2XPolyEval(BITSELECT,154)@12
    highBBits_uid155_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid310_pT2_uid153_arcsinXO2XPolyEval_b;
    highBBits_uid155_arcsinXO2XPolyEval_b <= highBBits_uid155_arcsinXO2XPolyEval_in(21 downto 2);

	--ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_nor(LOGICAL,1010)
    ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_nor_b <= ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q;
    ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_nor_q <= not (ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_nor_a or ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_nor_b);

	--ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_sticky_ena(REG,1011)
    ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_nor_q = "1") THEN
                ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_enaAnd(LOGICAL,1012)
    ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_enaAnd_a <= ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_sticky_ena_q;
    ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_enaAnd_b <= en;
    ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_enaAnd_q <= ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_enaAnd_a and ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_enaAnd_b;

	--ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem(DUALMEM,1001)
    ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_reset0 <= areset;
    ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ia <= ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC1_uid144_arcsinXO2XTabGen_lutmem_0_a_inputreg_q;
    ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_aa <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdreg_q;
    ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ab <= ld_reg_addrTable_uid238_sqrtFPL_uid78_fpArcsinXTest_0_to_memoryC0_uid312_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid312_sqrtTableGenerator_lutmem_a_replace_rdmux_q;
    ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_iq,
        address_a => ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_aa,
        data_a => ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_ia
    );
        ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_q <= ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0(REG,360)@9
    reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_q <= ld_yAddr_uid54_fpArcsinXTest_b_to_reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid143_arcsinXO2XTabGen_lutmem(DUALMEM,339)@10
    memoryC0_uid143_arcsinXO2XTabGen_lutmem_reset0 <= areset;
    memoryC0_uid143_arcsinXO2XTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid143_arcsinXO2XTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid143_arcsinXO2XTabGen_lutmem_ab <= reg_yAddr_uid54_fpArcsinXTest_0_to_memoryC0_uid143_arcsinXO2XTabGen_lutmem_0_q;
    memoryC0_uid143_arcsinXO2XTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_arcsin_s5_memoryC0_uid143_arcsinXO2XTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid143_arcsinXO2XTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid143_arcsinXO2XTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid143_arcsinXO2XTabGen_lutmem_iq,
        address_a => memoryC0_uid143_arcsinXO2XTabGen_lutmem_aa,
        data_a => memoryC0_uid143_arcsinXO2XTabGen_lutmem_ia
    );
        memoryC0_uid143_arcsinXO2XTabGen_lutmem_q <= memoryC0_uid143_arcsinXO2XTabGen_lutmem_iq(29 downto 0);

	--sumAHighB_uid156_arcsinXO2XPolyEval(ADD,155)@12
    sumAHighB_uid156_arcsinXO2XPolyEval_a <= STD_LOGIC_VECTOR((30 downto 30 => memoryC0_uid143_arcsinXO2XTabGen_lutmem_q(29)) & memoryC0_uid143_arcsinXO2XTabGen_lutmem_q);
    sumAHighB_uid156_arcsinXO2XPolyEval_b <= STD_LOGIC_VECTOR((30 downto 20 => highBBits_uid155_arcsinXO2XPolyEval_b(19)) & highBBits_uid155_arcsinXO2XPolyEval_b);
            sumAHighB_uid156_arcsinXO2XPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid156_arcsinXO2XPolyEval_a) + SIGNED(sumAHighB_uid156_arcsinXO2XPolyEval_b));
    sumAHighB_uid156_arcsinXO2XPolyEval_q <= sumAHighB_uid156_arcsinXO2XPolyEval_o(30 downto 0);


	--lowRangeB_uid154_arcsinXO2XPolyEval(BITSELECT,153)@12
    lowRangeB_uid154_arcsinXO2XPolyEval_in <= prodXYTruncFR_uid310_pT2_uid153_arcsinXO2XPolyEval_b(1 downto 0);
    lowRangeB_uid154_arcsinXO2XPolyEval_b <= lowRangeB_uid154_arcsinXO2XPolyEval_in(1 downto 0);

	--s2_uid154_uid157_arcsinXO2XPolyEval(BITJOIN,156)@12
    s2_uid154_uid157_arcsinXO2XPolyEval_q <= sumAHighB_uid156_arcsinXO2XPolyEval_q & lowRangeB_uid154_arcsinXO2XPolyEval_b;

	--fxpArcSinXO2XRes_uid57_fpArcsinXTest(BITSELECT,56)@12
    fxpArcSinXO2XRes_uid57_fpArcsinXTest_in <= s2_uid154_uid157_arcsinXO2XPolyEval_q(30 downto 0);
    fxpArcSinXO2XRes_uid57_fpArcsinXTest_b <= fxpArcSinXO2XRes_uid57_fpArcsinXTest_in(30 downto 5);

	--reg_fxpArcSinXO2XRes_uid57_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_1(REG,362)@12
    reg_fxpArcSinXO2XRes_uid57_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpArcSinXO2XRes_uid57_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpArcSinXO2XRes_uid57_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_1_q <= fxpArcSinXO2XRes_uid57_fpArcsinXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_nor(LOGICAL,806)
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_nor_b <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_sticky_ena_q;
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_nor_q <= not (ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_nor_a or ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_nor_b);

	--ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_mem_top(CONSTANT,802)
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_mem_top_q <= "01010";

	--ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmp(LOGICAL,803)
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmp_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_mem_top_q;
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdmux_q);
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmp_q <= "1" when ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmp_a = ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmp_b else "0";

	--ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmpReg(REG,804)
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmpReg_q <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_sticky_ena(REG,807)
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_nor_q = "1") THEN
                ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_sticky_ena_q <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_enaAnd(LOGICAL,808)
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_enaAnd_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_sticky_ena_q;
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_enaAnd_b <= en;
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_enaAnd_q <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_enaAnd_a and ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_enaAnd_b;

	--reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0(REG,361)@0
    reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q <= oFracX_uid40_uid40_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt(COUNTER,798)
    -- every=1, low=0, high=10, step=1, init=1
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_i = 9 THEN
                      ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_i <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_i - 10;
                    ELSE
                        ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_i <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_i,4));


	--ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdreg(REG,799)
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdreg_q <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdmux(MUX,800)
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdmux_s <= en;
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdmux: PROCESS (ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdmux_s, ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdreg_q, ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdmux_q <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdmux_q <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem(DUALMEM,797)
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_reset0 <= areset;
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_ia <= reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q;
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_aa <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdreg_q;
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_ab <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_rdmux_q;
    ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_iq,
        address_a => ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_aa,
        data_a => ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_ia
    );
        ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_q <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_iq(23 downto 0);

	--mul2XArcsinXO2XRes_uid58_fpArcsinXTest(MULT,57)@13
    mul2XArcsinXO2XRes_uid58_fpArcsinXTest_pr <= UNSIGNED(mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a) * UNSIGNED(mul2XArcsinXO2XRes_uid58_fpArcsinXTest_b);
    mul2XArcsinXO2XRes_uid58_fpArcsinXTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a <= (others => '0');
            mul2XArcsinXO2XRes_uid58_fpArcsinXTest_b <= (others => '0');
            mul2XArcsinXO2XRes_uid58_fpArcsinXTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_replace_mem_q;
                mul2XArcsinXO2XRes_uid58_fpArcsinXTest_b <= reg_fxpArcSinXO2XRes_uid57_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_1_q;
                mul2XArcsinXO2XRes_uid58_fpArcsinXTest_s1 <= STD_LOGIC_VECTOR(mul2XArcsinXO2XRes_uid58_fpArcsinXTest_pr);
            END IF;
        END IF;
    END PROCESS;
    mul2XArcsinXO2XRes_uid58_fpArcsinXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2XArcsinXO2XRes_uid58_fpArcsinXTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mul2XArcsinXO2XRes_uid58_fpArcsinXTest_q <= mul2XArcsinXO2XRes_uid58_fpArcsinXTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normBitPath2_uid59_fpArcsinXTest(BITSELECT,58)@16
    normBitPath2_uid59_fpArcsinXTest_in <= mul2XArcsinXO2XRes_uid58_fpArcsinXTest_q;
    normBitPath2_uid59_fpArcsinXTest_b <= normBitPath2_uid59_fpArcsinXTest_in(49 downto 49);

	--add_normUpdate_uid63_fracRPath2PreUlp_uid63_uid63_uid64_fpArcsinXTest(BITJOIN,63)@16
    add_normUpdate_uid63_fracRPath2PreUlp_uid63_uid63_uid64_fpArcsinXTest_q <= normBitPath2_uid59_fpArcsinXTest_b & cstAllZWF_uid10_fpArcsinXTest_q & VCC_q;

	--ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_nor(LOGICAL,819)
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_nor_b <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_sticky_ena_q;
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_nor_q <= not (ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_nor_a or ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_nor_b);

	--ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_sticky_ena(REG,820)
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_nor_q = "1") THEN
                ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_sticky_ena_q <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_enaAnd(LOGICAL,821)
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_enaAnd_a <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_sticky_ena_q;
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_enaAnd_b <= en;
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_enaAnd_q <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_enaAnd_a and ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_enaAnd_b;

	--ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem(DUALMEM,810)
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_reset0 <= areset;
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_ia <= expX_uid6_fpArcsinXTest_b;
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_aa <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdreg_q;
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_ab <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdmux_q;
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_iq,
        address_a => ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_aa,
        data_a => ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_ia
    );
        ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_q <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_iq(7 downto 0);

	--ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_outputreg(DELAY,809)
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_mem_q, xout => ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPath2High_uid60_fpArcsinXTest(BITSELECT,59)@16
    fracRPath2High_uid60_fpArcsinXTest_in <= mul2XArcsinXO2XRes_uid58_fpArcsinXTest_q(48 downto 0);
    fracRPath2High_uid60_fpArcsinXTest_b <= fracRPath2High_uid60_fpArcsinXTest_in(48 downto 25);

	--fracRPath2Low_uid61_fpArcsinXTest(BITSELECT,60)@16
    fracRPath2Low_uid61_fpArcsinXTest_in <= mul2XArcsinXO2XRes_uid58_fpArcsinXTest_q(47 downto 0);
    fracRPath2Low_uid61_fpArcsinXTest_b <= fracRPath2Low_uid61_fpArcsinXTest_in(47 downto 24);

	--fracRPath2Pre_uid62_fpArcsinXTest(MUX,61)@16
    fracRPath2Pre_uid62_fpArcsinXTest_s <= normBitPath2_uid59_fpArcsinXTest_b;
    fracRPath2Pre_uid62_fpArcsinXTest: PROCESS (fracRPath2Pre_uid62_fpArcsinXTest_s, en, fracRPath2Low_uid61_fpArcsinXTest_b, fracRPath2High_uid60_fpArcsinXTest_b)
    BEGIN
            CASE fracRPath2Pre_uid62_fpArcsinXTest_s IS
                  WHEN "0" => fracRPath2Pre_uid62_fpArcsinXTest_q <= fracRPath2Low_uid61_fpArcsinXTest_b;
                  WHEN "1" => fracRPath2Pre_uid62_fpArcsinXTest_q <= fracRPath2High_uid60_fpArcsinXTest_b;
                  WHEN OTHERS => fracRPath2Pre_uid62_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracConc_uid65_uid65_fpArcsinXTest(BITJOIN,64)@16
    expFracConc_uid65_uid65_fpArcsinXTest_q <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_outputreg_q & fracRPath2Pre_uid62_fpArcsinXTest_q;

	--expFracRPath2PostRnd_uid66_fpArcsinXTest(ADD,65)@16
    expFracRPath2PostRnd_uid66_fpArcsinXTest_a <= STD_LOGIC_VECTOR("0" & expFracConc_uid65_uid65_fpArcsinXTest_q);
    expFracRPath2PostRnd_uid66_fpArcsinXTest_b <= STD_LOGIC_VECTOR("00000000" & add_normUpdate_uid63_fracRPath2PreUlp_uid63_uid63_uid64_fpArcsinXTest_q);
            expFracRPath2PostRnd_uid66_fpArcsinXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPath2PostRnd_uid66_fpArcsinXTest_a) + UNSIGNED(expFracRPath2PostRnd_uid66_fpArcsinXTest_b));
    expFracRPath2PostRnd_uid66_fpArcsinXTest_q <= expFracRPath2PostRnd_uid66_fpArcsinXTest_o(32 downto 0);


	--expRPath2_uid68_fpArcsinXTest(BITSELECT,67)@16
    expRPath2_uid68_fpArcsinXTest_in <= expFracRPath2PostRnd_uid66_fpArcsinXTest_q(31 downto 0);
    expRPath2_uid68_fpArcsinXTest_b <= expRPath2_uid68_fpArcsinXTest_in(31 downto 24);

	--ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_inputreg(DELAY,873)
    ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPath2_uid68_fpArcsinXTest_b, xout => ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt(COUNTER,811)
    -- every=1, low=0, high=13, step=1, init=1
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_i = 12 THEN
                      ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_eq = '1') THEN
                        ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_i <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_i - 13;
                    ELSE
                        ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_i <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_i,4));


	--ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdreg(REG,812)
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdreg_q <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdmux(MUX,813)
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdmux_s <= en;
    ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdmux: PROCESS (ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdmux_s, ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdreg_q, ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdmux_q <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdmux_q <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem(DUALMEM,874)
    ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_reset0 <= areset;
    ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_ia <= ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_inputreg_q;
    ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_aa <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdreg_q;
    ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_ab <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdmux_q;
    ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_iq,
        address_a => ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_aa,
        data_a => ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_ia
    );
        ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_q <= ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_iq(7 downto 0);

	--ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_nor(LOGICAL,870)
    ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_nor_b <= ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_sticky_ena_q;
    ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_nor_q <= not (ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_nor_a or ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_nor_b);

	--ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_sticky_ena(REG,871)
    ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_nor_q = "1") THEN
                ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_sticky_ena_q <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_enaAnd(LOGICAL,872)
    ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_enaAnd_a <= ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_sticky_ena_q;
    ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_enaAnd_b <= en;
    ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_enaAnd_q <= ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_enaAnd_a and ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_enaAnd_b;

	--ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem(DUALMEM,861)
    ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_reset0 <= areset;
    ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_ia <= expX_uid6_fpArcsinXTest_b;
    ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_aa <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdreg_q;
    ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_ab <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdmux_q;
    ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_iq,
        address_a => ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_aa,
        data_a => ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_ia
    );
        ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_q <= ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_iq(7 downto 0);

	--ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_nor(LOGICAL,833)
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_nor_b <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_sticky_ena_q;
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_nor_q <= not (ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_nor_a or ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_nor_b);

	--ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_mem_top(CONSTANT,829)
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_mem_top_q <= "011100";

	--ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmp(LOGICAL,830)
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmp_a <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_mem_top_q;
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdmux_q);
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmp_q <= "1" when ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmp_a = ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmp_b else "0";

	--ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmpReg(REG,831)
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmpReg_q <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_sticky_ena(REG,834)
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_nor_q = "1") THEN
                ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_sticky_ena_q <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_enaAnd(LOGICAL,835)
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_enaAnd_a <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_sticky_ena_q;
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_enaAnd_b <= en;
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_enaAnd_q <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_enaAnd_a and ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_enaAnd_b;

	--arcsinIsMax_uid49_fpArcsinXTest(BITSELECT,48)@1
    arcsinIsMax_uid49_fpArcsinXTest_in <= leftShiftStage1_uid141_fxpX_uid48_fpArcsinXTest_q;
    arcsinIsMax_uid49_fpArcsinXTest_b <= arcsinIsMax_uid49_fpArcsinXTest_in(36 downto 36);

	--biasMwShift_uid41_fpArcsinXTest(CONSTANT,40)
    biasMwShift_uid41_fpArcsinXTest_q <= "01110011";

	--arcsinXIsX_uid42_fpArcsinXTest(COMPARE,41)@0
    arcsinXIsX_uid42_fpArcsinXTest_cin <= GND_q;
    arcsinXIsX_uid42_fpArcsinXTest_a <= STD_LOGIC_VECTOR("00" & biasMwShift_uid41_fpArcsinXTest_q) & '0';
    arcsinXIsX_uid42_fpArcsinXTest_b <= STD_LOGIC_VECTOR("00" & expX_uid6_fpArcsinXTest_b) & arcsinXIsX_uid42_fpArcsinXTest_cin(0);
    arcsinXIsX_uid42_fpArcsinXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            arcsinXIsX_uid42_fpArcsinXTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                arcsinXIsX_uid42_fpArcsinXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(arcsinXIsX_uid42_fpArcsinXTest_a) - UNSIGNED(arcsinXIsX_uid42_fpArcsinXTest_b));
            END IF;
        END IF;
    END PROCESS;
    arcsinXIsX_uid42_fpArcsinXTest_n(0) <= not arcsinXIsX_uid42_fpArcsinXTest_o(10);


	--Y34_uid51_fpArcsinXTest(BITSELECT,50)@1
    Y34_uid51_fpArcsinXTest_in <= y_uid50_fpArcsinXTest_b;
    Y34_uid51_fpArcsinXTest_b <= Y34_uid51_fpArcsinXTest_in(34 downto 34);

	--path2_uid52_fpArcsinXTest(LOGICAL,51)@1
    path2_uid52_fpArcsinXTest_a <= Y34_uid51_fpArcsinXTest_b;
    path2_uid52_fpArcsinXTest_q <= not path2_uid52_fpArcsinXTest_a;

	--pathSelBits_uid103_fpArcsinXTest(BITJOIN,102)@1
    pathSelBits_uid103_fpArcsinXTest_q <= arcsinIsMax_uid49_fpArcsinXTest_b & arcsinXIsX_uid42_fpArcsinXTest_n & path2_uid52_fpArcsinXTest_q;

	--ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_inputreg(DELAY,823)
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => pathSelBits_uid103_fpArcsinXTest_q, xout => ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt(COUNTER,825)
    -- every=1, low=0, high=28, step=1, init=1
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_i = 27 THEN
                      ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_eq = '1') THEN
                        ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_i <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_i - 28;
                    ELSE
                        ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_i <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_i,5));


	--ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdreg(REG,826)
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdreg_q <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdmux(MUX,827)
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdmux_s <= en;
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdmux: PROCESS (ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdmux_s, ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdreg_q, ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdmux_q <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdreg_q;
                  WHEN "1" => ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdmux_q <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem(DUALMEM,824)
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_reset0 <= areset;
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_ia <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_inputreg_q;
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_aa <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdreg_q;
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_ab <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdmux_q;
    ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_iq,
        address_a => ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_aa,
        data_a => ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_ia
    );
        ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_q <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_iq(2 downto 0);

	--fracOutMuxSelEnc_uid104_fpArcsinXTest(LOOKUP,103)@32
    fracOutMuxSelEnc_uid104_fpArcsinXTest: PROCESS (ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_mem_q) IS
                WHEN "000" =>  fracOutMuxSelEnc_uid104_fpArcsinXTest_q <= "11";
                WHEN "001" =>  fracOutMuxSelEnc_uid104_fpArcsinXTest_q <= "10";
                WHEN "010" =>  fracOutMuxSelEnc_uid104_fpArcsinXTest_q <= "01";
                WHEN "011" =>  fracOutMuxSelEnc_uid104_fpArcsinXTest_q <= "01";
                WHEN "100" =>  fracOutMuxSelEnc_uid104_fpArcsinXTest_q <= "00";
                WHEN "101" =>  fracOutMuxSelEnc_uid104_fpArcsinXTest_q <= "00";
                WHEN "110" =>  fracOutMuxSelEnc_uid104_fpArcsinXTest_q <= "01";
                WHEN "111" =>  fracOutMuxSelEnc_uid104_fpArcsinXTest_q <= "01";
                WHEN OTHERS =>
                    fracOutMuxSelEnc_uid104_fpArcsinXTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRCalc_uid108_fpArcsinXTest(MUX,107)@32
    expRCalc_uid108_fpArcsinXTest_s <= fracOutMuxSelEnc_uid104_fpArcsinXTest_q;
    expRCalc_uid108_fpArcsinXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRCalc_uid108_fpArcsinXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRCalc_uid108_fpArcsinXTest_s IS
                      WHEN "00" => expRCalc_uid108_fpArcsinXTest_q <= cstBias_uid13_fpArcsinXTest_q;
                      WHEN "01" => expRCalc_uid108_fpArcsinXTest_q <= ld_expX_uid6_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_d_replace_mem_q;
                      WHEN "10" => expRCalc_uid108_fpArcsinXTest_q <= ld_expRPath2_uid68_fpArcsinXTest_b_to_expRCalc_uid108_fpArcsinXTest_e_replace_mem_q;
                      WHEN "11" => expRCalc_uid108_fpArcsinXTest_q <= expRPath3_uid102_fpArcsinXTest_b;
                      WHEN OTHERS => expRCalc_uid108_fpArcsinXTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_nor(LOGICAL,909)
    ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_nor_b <= ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_sticky_ena_q;
    ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_nor_q <= not (ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_nor_a or ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_nor_b);

	--ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_sticky_ena(REG,910)
    ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_nor_q = "1") THEN
                ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_sticky_ena_q <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_enaAnd(LOGICAL,911)
    ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_enaAnd_a <= ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_sticky_ena_q;
    ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_enaAnd_b <= en;
    ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_enaAnd_q <= ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_enaAnd_a and ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_enaAnd_b;

	--ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_inputreg(DELAY,899)
    ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => excRNaN_uid110_fpArcsinXTest_q, xout => ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem(DUALMEM,900)
    ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_reset0 <= areset;
    ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_ia <= ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_inputreg_q;
    ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_aa <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdreg_q;
    ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_ab <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdmux_q;
    ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_dmem : altsyncram
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
        clocken1 => ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_iq,
        address_a => ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_aa,
        data_a => ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_ia
    );
        ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_q <= ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_iq(0 downto 0);

	--ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_nor(LOGICAL,896)
    ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_nor_b <= ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_sticky_ena_q;
    ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_nor_q <= not (ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_nor_a or ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_nor_b);

	--ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_sticky_ena(REG,897)
    ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_nor_q = "1") THEN
                ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_sticky_ena_q <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_enaAnd(LOGICAL,898)
    ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_enaAnd_a <= ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_sticky_ena_q;
    ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_enaAnd_b <= en;
    ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_enaAnd_q <= ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_enaAnd_a and ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_enaAnd_b;

	--ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_inputreg(DELAY,886)
    ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid22_fpArcsinXTest_q, xout => ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem(DUALMEM,887)
    ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_reset0 <= areset;
    ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_ia <= ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_inputreg_q;
    ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_aa <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdreg_q;
    ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_ab <= ld_pathSelBits_uid103_fpArcsinXTest_q_to_fracOutMuxSelEnc_uid104_fpArcsinXTest_a_replace_rdmux_q;
    ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_iq,
        address_a => ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_aa,
        data_a => ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_ia
    );
        ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_q <= ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_iq(0 downto 0);

	--excSelBits_uid111_fpArcsinXTest(BITJOIN,110)@31
    excSelBits_uid111_fpArcsinXTest_q <= ld_excRNaN_uid110_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_c_replace_mem_q & GND_q & ld_expXIsZero_uid22_fpArcsinXTest_q_to_excSelBits_uid111_fpArcsinXTest_a_replace_mem_q;

	--reg_excSelBits_uid111_fpArcsinXTest_0_to_outMuxSelEnc_uid112_fpArcsinXTest_0(REG,348)@31
    reg_excSelBits_uid111_fpArcsinXTest_0_to_outMuxSelEnc_uid112_fpArcsinXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excSelBits_uid111_fpArcsinXTest_0_to_outMuxSelEnc_uid112_fpArcsinXTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excSelBits_uid111_fpArcsinXTest_0_to_outMuxSelEnc_uid112_fpArcsinXTest_0_q <= excSelBits_uid111_fpArcsinXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--outMuxSelEnc_uid112_fpArcsinXTest(LOOKUP,111)@32
    outMuxSelEnc_uid112_fpArcsinXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outMuxSelEnc_uid112_fpArcsinXTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            CASE (reg_excSelBits_uid111_fpArcsinXTest_0_to_outMuxSelEnc_uid112_fpArcsinXTest_0_q) IS
                WHEN "000" =>  outMuxSelEnc_uid112_fpArcsinXTest_q <= "01";
                WHEN "001" =>  outMuxSelEnc_uid112_fpArcsinXTest_q <= "00";
                WHEN "010" =>  outMuxSelEnc_uid112_fpArcsinXTest_q <= "10";
                WHEN "011" =>  outMuxSelEnc_uid112_fpArcsinXTest_q <= "01";
                WHEN "100" =>  outMuxSelEnc_uid112_fpArcsinXTest_q <= "11";
                WHEN "101" =>  outMuxSelEnc_uid112_fpArcsinXTest_q <= "01";
                WHEN "110" =>  outMuxSelEnc_uid112_fpArcsinXTest_q <= "01";
                WHEN "111" =>  outMuxSelEnc_uid112_fpArcsinXTest_q <= "01";
                WHEN OTHERS =>
                    outMuxSelEnc_uid112_fpArcsinXTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--expRPostExc_uid114_fpArcsinXTest(MUX,113)@33
    expRPostExc_uid114_fpArcsinXTest_s <= outMuxSelEnc_uid112_fpArcsinXTest_q;
    expRPostExc_uid114_fpArcsinXTest: PROCESS (expRPostExc_uid114_fpArcsinXTest_s, en, cstAllZWE_uid12_fpArcsinXTest_q, expRCalc_uid108_fpArcsinXTest_q, cstAllOWE_uid9_fpArcsinXTest_q, cstAllOWE_uid9_fpArcsinXTest_q)
    BEGIN
            CASE expRPostExc_uid114_fpArcsinXTest_s IS
                  WHEN "00" => expRPostExc_uid114_fpArcsinXTest_q <= cstAllZWE_uid12_fpArcsinXTest_q;
                  WHEN "01" => expRPostExc_uid114_fpArcsinXTest_q <= expRCalc_uid108_fpArcsinXTest_q;
                  WHEN "10" => expRPostExc_uid114_fpArcsinXTest_q <= cstAllOWE_uid9_fpArcsinXTest_q;
                  WHEN "11" => expRPostExc_uid114_fpArcsinXTest_q <= cstAllOWE_uid9_fpArcsinXTest_q;
                  WHEN OTHERS => expRPostExc_uid114_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRPath3_uid101_fpArcsinXTest(BITSELECT,100)@32
    fracRPath3_uid101_fpArcsinXTest_in <= expFracRPath2PostRnd_uid100_fpArcsinXTest_q(23 downto 0);
    fracRPath3_uid101_fpArcsinXTest_b <= fracRPath3_uid101_fpArcsinXTest_in(23 downto 1);

	--ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_nor(LOGICAL,858)
    ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_nor_b <= ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_sticky_ena_q;
    ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_nor_q <= not (ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_nor_a or ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_nor_b);

	--ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_sticky_ena(REG,859)
    ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_nor_q = "1") THEN
                ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_sticky_ena_q <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_enaAnd(LOGICAL,860)
    ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_enaAnd_a <= ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_sticky_ena_q;
    ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_enaAnd_b <= en;
    ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_enaAnd_q <= ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_enaAnd_a and ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_enaAnd_b;

	--fracRPath2_uid67_fpArcsinXTest(BITSELECT,66)@16
    fracRPath2_uid67_fpArcsinXTest_in <= expFracRPath2PostRnd_uid66_fpArcsinXTest_q(23 downto 0);
    fracRPath2_uid67_fpArcsinXTest_b <= fracRPath2_uid67_fpArcsinXTest_in(23 downto 1);

	--ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_inputreg(DELAY,848)
    ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracRPath2_uid67_fpArcsinXTest_b, xout => ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem(DUALMEM,849)
    ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_reset0 <= areset;
    ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_ia <= ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_inputreg_q;
    ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_aa <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdreg_q;
    ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_ab <= ld_expX_uid6_fpArcsinXTest_b_to_expFracConc_uid65_uid65_fpArcsinXTest_b_replace_rdmux_q;
    ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_dmem : altsyncram
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
        clocken1 => ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_iq,
        address_a => ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_aa,
        data_a => ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_ia
    );
        ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_q <= ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_iq(22 downto 0);

	--ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_nor(LOGICAL,845)
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_nor_a <= ld_reg_oFracX_uid40_uid40_fpArcsinXTest_0_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_0_q_to_mul2XArcsinXO2XRes_uid58_fpArcsinXTest_a_notEnable_q;
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_nor_b <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_sticky_ena_q;
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_nor_q <= not (ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_nor_a or ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_nor_b);

	--ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_sticky_ena(REG,846)
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_nor_q = "1") THEN
                ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_sticky_ena_q <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_enaAnd(LOGICAL,847)
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_enaAnd_a <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_sticky_ena_q;
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_enaAnd_b <= en;
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_enaAnd_q <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_enaAnd_a and ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_enaAnd_b;

	--ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem(DUALMEM,836)
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_reset0 <= areset;
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_ia <= fracX_uid7_fpArcsinXTest_b;
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_aa <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdreg_q;
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_ab <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_rdmux_q;
    ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_dmem : altsyncram
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
        clocken1 => ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_iq,
        address_a => ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_aa,
        data_a => ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_ia
    );
        ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_q <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_iq(22 downto 0);

	--piO2OutRange_uid105_fpArcsinXTest(BITSELECT,104)@32
    piO2OutRange_uid105_fpArcsinXTest_in <= piO2_uid92_fpArcsinXTest_q(26 downto 0);
    piO2OutRange_uid105_fpArcsinXTest_b <= piO2OutRange_uid105_fpArcsinXTest_in(26 downto 4);

	--fracRCalc_uid106_fpArcsinXTest(MUX,105)@32
    fracRCalc_uid106_fpArcsinXTest_s <= fracOutMuxSelEnc_uid104_fpArcsinXTest_q;
    fracRCalc_uid106_fpArcsinXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRCalc_uid106_fpArcsinXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE fracRCalc_uid106_fpArcsinXTest_s IS
                      WHEN "00" => fracRCalc_uid106_fpArcsinXTest_q <= piO2OutRange_uid105_fpArcsinXTest_b;
                      WHEN "01" => fracRCalc_uid106_fpArcsinXTest_q <= ld_fracX_uid7_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_d_replace_mem_q;
                      WHEN "10" => fracRCalc_uid106_fpArcsinXTest_q <= ld_fracRPath2_uid67_fpArcsinXTest_b_to_fracRCalc_uid106_fpArcsinXTest_e_replace_mem_q;
                      WHEN "11" => fracRCalc_uid106_fpArcsinXTest_q <= fracRPath3_uid101_fpArcsinXTest_b;
                      WHEN OTHERS => fracRCalc_uid106_fpArcsinXTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--fracRPostExc_uid113_fpArcsinXTest(MUX,112)@33
    fracRPostExc_uid113_fpArcsinXTest_s <= outMuxSelEnc_uid112_fpArcsinXTest_q;
    fracRPostExc_uid113_fpArcsinXTest: PROCESS (fracRPostExc_uid113_fpArcsinXTest_s, en, cstAllZWF_uid10_fpArcsinXTest_q, fracRCalc_uid106_fpArcsinXTest_q, cstAllZWF_uid10_fpArcsinXTest_q, cstNaNWF_uid11_fpArcsinXTest_q)
    BEGIN
            CASE fracRPostExc_uid113_fpArcsinXTest_s IS
                  WHEN "00" => fracRPostExc_uid113_fpArcsinXTest_q <= cstAllZWF_uid10_fpArcsinXTest_q;
                  WHEN "01" => fracRPostExc_uid113_fpArcsinXTest_q <= fracRCalc_uid106_fpArcsinXTest_q;
                  WHEN "10" => fracRPostExc_uid113_fpArcsinXTest_q <= cstAllZWF_uid10_fpArcsinXTest_q;
                  WHEN "11" => fracRPostExc_uid113_fpArcsinXTest_q <= cstNaNWF_uid11_fpArcsinXTest_q;
                  WHEN OTHERS => fracRPostExc_uid113_fpArcsinXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid117_fpArcsinXTest(BITJOIN,116)@33
    R_uid117_fpArcsinXTest_q <= ld_signR_uid116_fpArcsinXTest_q_to_R_uid117_fpArcsinXTest_c_replace_mem_q & expRPostExc_uid114_fpArcsinXTest_q & fracRPostExc_uid113_fpArcsinXTest_q;

	--xOut(GPOUT,4)@33
    q <= R_uid117_fpArcsinXTest_q;


end normal;
