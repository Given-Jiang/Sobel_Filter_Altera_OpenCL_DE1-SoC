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

-- VHDL created from fp_expm1_s5
-- VHDL created on Wed Apr 17 13:39:27 2013


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

entity fp_expm1_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_expm1_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstBias_uid8_fpExpEM1Test_q : std_logic_vector (7 downto 0);
    signal cstZeroWE_uid11_fpExpEM1Test_q : std_logic_vector (7 downto 0);
    signal cstZeroWEP1_uid12_fpExpEM1Test_q : std_logic_vector (8 downto 0);
    signal cstBiasPWE_uid13_fpExpEM1Test_q : std_logic_vector (7 downto 0);
    signal cstBiasM1_uid14_fpExpEM1Test_q : std_logic_vector (7 downto 0);
    signal cstBiasP1_uid15_fpExpEM1Test_q : std_logic_vector (7 downto 0);
    signal cstBiasPWE_uid16_fpExpEM1Test_q : std_logic_vector (5 downto 0);
    signal cstAllOWE_uid17_fpExpEM1Test_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid18_fpExpEM1Test_q : std_logic_vector (22 downto 0);
    signal cstFPLogZpf_uid35_fpExpEM1Test_q : std_logic_vector (31 downto 0);
    signal onesCmpFxpInX_uid42_fpExpEM1Test_a : std_logic_vector(24 downto 0);
    signal onesCmpFxpInX_uid42_fpExpEM1Test_b : std_logic_vector(24 downto 0);
    signal onesCmpFxpInX_uid42_fpExpEM1Test_q_i : std_logic_vector(24 downto 0);
    signal onesCmpFxpInX_uid42_fpExpEM1Test_q : std_logic_vector(24 downto 0);
    signal onesCmpFxpIn_uid57_fpExpEM1Test_a : std_logic_vector(33 downto 0);
    signal onesCmpFxpIn_uid57_fpExpEM1Test_b : std_logic_vector(33 downto 0);
    signal onesCmpFxpIn_uid57_fpExpEM1Test_q_i : std_logic_vector(33 downto 0);
    signal onesCmpFxpIn_uid57_fpExpEM1Test_q : std_logic_vector(33 downto 0);
    signal zY_uid68_fpExpEM1Test_q : std_logic_vector (25 downto 0);
    signal expRPostBiasPreExc0_uid77_fpExpEM1Test_a : std_logic_vector(12 downto 0);
    signal expRPostBiasPreExc0_uid77_fpExpEM1Test_b : std_logic_vector(12 downto 0);
    signal expRPostBiasPreExc0_uid77_fpExpEM1Test_o : std_logic_vector (12 downto 0);
    signal expRPostBiasPreExc0_uid77_fpExpEM1Test_q : std_logic_vector (11 downto 0);
    signal expUnderflow_uid83_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal expUnderflow_uid83_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal expUnderflow_uid83_fpExpEM1Test_c : std_logic_vector(0 downto 0);
    signal expUnderflow_uid83_fpExpEM1Test_q_i : std_logic_vector(0 downto 0);
    signal expUnderflow_uid83_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal expUndeflowCondition_uid85_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal expUndeflowCondition_uid85_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal expUndeflowCondition_uid85_fpExpEM1Test_q_i : std_logic_vector(0 downto 0);
    signal expUndeflowCondition_uid85_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal cstTabWidth_uid90_fpExpEM1Test_q : std_logic_vector (4 downto 0);
    signal addrDecTable_uid93_fpExpEM1Test_s : std_logic_vector (0 downto 0);
    signal addrDecTable_uid93_fpExpEM1Test_q : std_logic_vector (4 downto 0);
    signal normFracRPosPost_uid105_fpExpEM1Test_s : std_logic_vector (0 downto 0);
    signal normFracRPosPost_uid105_fpExpEM1Test_q : std_logic_vector (22 downto 0);
    signal invUdfBitSubPos_uid106_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal invUdfBitSubPos_uid106_fpExpEM1Test_q_i : std_logic_vector(0 downto 0);
    signal invUdfBitSubPos_uid106_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal negBranchFrac_uid123_fpExpEM1Test_s : std_logic_vector (0 downto 0);
    signal negBranchFrac_uid123_fpExpEM1Test_q : std_logic_vector (22 downto 0);
    signal negBranchExp_uid124_fpExpEM1Test_s : std_logic_vector (0 downto 0);
    signal negBranchExp_uid124_fpExpEM1Test_q : std_logic_vector (7 downto 0);
    signal prod2_uid132_fpExpEM1Test_a : std_logic_vector (23 downto 0);
    signal prod2_uid132_fpExpEM1Test_b : std_logic_vector (25 downto 0);
    signal prod2_uid132_fpExpEM1Test_s1 : std_logic_vector (49 downto 0);
    signal prod2_uid132_fpExpEM1Test_pr : UNSIGNED (49 downto 0);
    signal prod2_uid132_fpExpEM1Test_q : std_logic_vector (49 downto 0);
    signal branchSelEnc_uid152_fpExpEM1Test_q : std_logic_vector(1 downto 0);
    signal oneFracRPostExc2_uid164_fpExpEM1Test_q : std_logic_vector (22 downto 0);
    signal p4_uid179_constMult_q : std_logic_vector(31 downto 0);
    signal p2_uid181_constMult_q : std_logic_vector(24 downto 0);
    signal lev1_a0_uid184_constMult_a : std_logic_vector(33 downto 0);
    signal lev1_a0_uid184_constMult_b : std_logic_vector(33 downto 0);
    signal lev1_a0_uid184_constMult_o : std_logic_vector (33 downto 0);
    signal lev1_a0_uid184_constMult_q : std_logic_vector (32 downto 0);
    signal lev2_a0_uid186_constMult_a : std_logic_vector(34 downto 0);
    signal lev2_a0_uid186_constMult_b : std_logic_vector(34 downto 0);
    signal lev2_a0_uid186_constMult_o : std_logic_vector (34 downto 0);
    signal lev2_a0_uid186_constMult_q : std_logic_vector (33 downto 0);
    signal z_uid191_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (15 downto 0);
    signal z_uid195_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (31 downto 0);
    signal rightShiftStage0Idx3_uid199_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test_a : std_logic_vector(36 downto 0);
    signal rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector(36 downto 0);
    signal rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test_q_i : std_logic_vector(36 downto 0);
    signal rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector(36 downto 0);
    signal z_uid203_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_a : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_q_i : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx2Pad8_uid208_fxpInPostAlign_uid53_fpExpEM1Test_a : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid208_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid208_fxpInPostAlign_uid53_fpExpEM1Test_q_i : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid208_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector(7 downto 0);
    signal z_uid211_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid212_fxpInPostAlign_uid53_fpExpEM1Test_a : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid212_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid212_fxpInPostAlign_uid53_fpExpEM1Test_q_i : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid212_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector(11 downto 0);
    signal rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_q_i : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal z_uid221_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_a : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_q_i : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector(1 downto 0);
    signal z_uid225_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid226_fxpInPostAlign_uid53_fpExpEM1Test_a : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid226_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid226_fxpInPostAlign_uid53_fpExpEM1Test_q_i : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid226_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector(2 downto 0);
    signal p1_uid234_constMult_q : std_logic_vector(44 downto 0);
    signal rightShiftStage0Idx3_uid248_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test_a : std_logic_vector(33 downto 0);
    signal rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector(33 downto 0);
    signal rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i : std_logic_vector(33 downto 0);
    signal rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector(33 downto 0);
    signal rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_a : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx2Pad8_uid257_fxpInPostAlign_X_uid64_fpExpEM1Test_a : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid257_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid257_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid257_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx3Pad12_uid261_fxpInPostAlign_X_uid64_fpExpEM1Test_a : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid261_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid261_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid261_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector(11 downto 0);
    signal rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_a : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx3Pad3_uid275_fxpInPostAlign_X_uid64_fpExpEM1Test_a : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid275_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid275_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid275_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector(2 downto 0);
    signal memoryC0_uid281_exp10TabGen_q : std_logic_vector(28 downto 0);
    signal memoryC1_uid283_exp10TabGen_q : std_logic_vector(21 downto 0);
    signal memoryC2_uid285_exp10TabGen_q : std_logic_vector(13 downto 0);
    signal rightShiftStage0Idx3Pad24_uid308_shiftedFracForNegBranch_uid117_fpExpEM1Test_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx3Pad6_uid319_shiftedFracForNegBranch_uid117_fpExpEM1Test_q : std_logic_vector (5 downto 0);
    signal rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_s : std_logic_vector (0 downto 0);
    signal rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal prodXY_uid348_pT1_uid288_exp10PolyEval_a : std_logic_vector (13 downto 0);
    signal prodXY_uid348_pT1_uid288_exp10PolyEval_b : std_logic_vector (13 downto 0);
    signal prodXY_uid348_pT1_uid288_exp10PolyEval_s1 : std_logic_vector (27 downto 0);
    signal prodXY_uid348_pT1_uid288_exp10PolyEval_pr : SIGNED (28 downto 0);
    signal prodXY_uid348_pT1_uid288_exp10PolyEval_q : std_logic_vector (27 downto 0);
    signal prodXY_uid351_pT2_uid294_exp10PolyEval_a : std_logic_vector (18 downto 0);
    signal prodXY_uid351_pT2_uid294_exp10PolyEval_b : std_logic_vector (23 downto 0);
    signal prodXY_uid351_pT2_uid294_exp10PolyEval_s1 : std_logic_vector (42 downto 0);
    signal prodXY_uid351_pT2_uid294_exp10PolyEval_pr : SIGNED (43 downto 0);
    signal prodXY_uid351_pT2_uid294_exp10PolyEval_q : std_logic_vector (42 downto 0);
    signal prodXY_uid354_pT1_uid336_expm1PE2PolyEval_a : std_logic_vector (11 downto 0);
    signal prodXY_uid354_pT1_uid336_expm1PE2PolyEval_b : std_logic_vector (11 downto 0);
    signal prodXY_uid354_pT1_uid336_expm1PE2PolyEval_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid354_pT1_uid336_expm1PE2PolyEval_pr : SIGNED (24 downto 0);
    signal prodXY_uid354_pT1_uid336_expm1PE2PolyEval_q : std_logic_vector (23 downto 0);
    signal prodXY_uid357_pT2_uid342_expm1PE2PolyEval_a : std_logic_vector (16 downto 0);
    signal prodXY_uid357_pT2_uid342_expm1PE2PolyEval_b : std_logic_vector (21 downto 0);
    signal prodXY_uid357_pT2_uid342_expm1PE2PolyEval_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid357_pT2_uid342_expm1PE2PolyEval_pr : SIGNED (39 downto 0);
    signal prodXY_uid357_pT2_uid342_expm1PE2PolyEval_q : std_logic_vector (38 downto 0);
    signal memoryC0_uid329_expm1PE2TabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid329_expm1PE2TabGen_lutmem_ia : std_logic_vector (28 downto 0);
    signal memoryC0_uid329_expm1PE2TabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid329_expm1PE2TabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid329_expm1PE2TabGen_lutmem_iq : std_logic_vector (28 downto 0);
    signal memoryC0_uid329_expm1PE2TabGen_lutmem_q : std_logic_vector (28 downto 0);
    signal memoryC1_uid331_expm1PE2TabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid331_expm1PE2TabGen_lutmem_ia : std_logic_vector (19 downto 0);
    signal memoryC1_uid331_expm1PE2TabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid331_expm1PE2TabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid331_expm1PE2TabGen_lutmem_iq : std_logic_vector (19 downto 0);
    signal memoryC1_uid331_expm1PE2TabGen_lutmem_q : std_logic_vector (19 downto 0);
    signal memoryC2_uid333_expm1PE2TabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid333_expm1PE2TabGen_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid333_expm1PE2TabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid333_expm1PE2TabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid333_expm1PE2TabGen_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid333_expm1PE2TabGen_lutmem_q : std_logic_vector (11 downto 0);
    signal reg_shiftValuePreSat_uid48_fpExpEM1Test_0_to_shiftUdf_uid50_fpExpEM1Test_0_q : std_logic_vector (8 downto 0);
    signal reg_oneSComplementOption_uid40_fpExpEM1Test_0_to_fxpInExtX_uid43_fpExpEM1Test_1_q : std_logic_vector (0 downto 0);
    signal reg_xv4_uid178_constMult_0_to_p4_uid179_constMult_0_q : std_logic_vector (0 downto 0);
    signal reg_xv3_uid177_constMult_0_to_p3_uid180_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv2_uid176_constMult_0_to_p2_uid181_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv1_uid175_constMult_0_to_p1_uid182_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv0_uid174_constMult_0_to_p0_uid183_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_1_q : std_logic_vector (1 downto 0);
    signal reg_oFracXZwE_uid47_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_2_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStage0Idx1_uid194_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_3_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStage0Idx2_uid198_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_4_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_2_q : std_logic_vector (36 downto 0);
    signal reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_2_q : std_logic_vector (36 downto 0);
    signal reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q : std_logic_vector (10 downto 0);
    signal reg_oneSComplementOption_uid40_fpExpEM1Test_0_to_fxpInExt_uid58_fpExpEM1Test_1_q : std_logic_vector (0 downto 0);
    signal reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q : std_logic_vector (1 downto 0);
    signal reg_fxpInPreAlign_uid59_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q : std_logic_vector (33 downto 0);
    signal reg_rightShiftStage0Idx1_uid243_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_3_q : std_logic_vector (33 downto 0);
    signal reg_rightShiftStage0Idx2_uid247_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_4_q : std_logic_vector (33 downto 0);
    signal reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q : std_logic_vector (33 downto 0);
    signal reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q : std_logic_vector (33 downto 0);
    signal reg_xv1_uid233_constMult_0_to_p1_uid234_constMult_0_q : std_logic_vector (4 downto 0);
    signal reg_xv0_uid232_constMult_0_to_p0_uid235_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_pad_fxpInPostAlignR_X_uid65_uid65_fpExpEM1Test_0_to_yExt_uid65_fpExpEM1Test_0_q : std_logic_vector (41 downto 0);
    signal reg_sR_uid237_constMult_0_to_yExt_uid65_fpExpEM1Test_1_q : std_logic_vector (42 downto 0);
    signal reg_YExt43_uid67_fpExpEM1Test_0_to_yRedPostMux_uid70_fpExpEM1Test_1_q : std_logic_vector (0 downto 0);
    signal reg_yRed_uid69_fpExpEM1Test_0_to_yRedPostMux_uid70_fpExpEM1Test_2_q : std_logic_vector (25 downto 0);
    signal reg_addr_uid72_fpExpEM1Test_0_to_memoryC2_uid285_exp10TabGen_0_q : std_logic_vector (6 downto 0);
    signal reg_yT1_uid287_exp10PolyEval_0_to_prodXY_uid348_pT1_uid288_exp10PolyEval_0_q : std_logic_vector (13 downto 0);
    signal reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_q : std_logic_vector (18 downto 0);
    signal reg_s1_uid289_uid292_exp10PolyEval_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_1_q : std_logic_vector (23 downto 0);
    signal reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_q : std_logic_vector (6 downto 0);
    signal reg_peORExpInc_uid76_fpExpEM1Test_0_to_expRPostBiasPreExc_uid78_fpExpEM1Test_1_q : std_logic_vector (0 downto 0);
    signal reg_expRPostBiasPreExc_uid78_fpExpEM1Test_0_to_expOvf_uid82_fpExpEM1Test_0_q : std_logic_vector (12 downto 0);
    signal reg_concExc_uid162_fpExpEM1Test_0_to_excREnc_uid163_fpExpEM1Test_0_q : std_logic_vector (2 downto 0);
    signal reg_exc_R_uid32_fpExpEM1Test_0_to_regInAndUndeflowExp_uid84_fpExpEM1Test_2_q : std_logic_vector (0 downto 0);
    signal reg_expR_uid87_fpExpEM1Test_0_to_expR_uid88_fpExpEM1Test_2_q : std_logic_vector (7 downto 0);
    signal reg_concBranch_uid151_fpExpEM1Test_0_to_branchSelEnc_uid152_fpExpEM1Test_0_q : std_logic_vector (2 downto 0);
    signal reg_tableAddrPosExt_uid89_fpExpEM1Test_0_to_expSatValue_uid91_fpExpEM1Test_0_q : std_logic_vector (8 downto 0);
    signal reg_zOFracRExp_uid97_fpExpEM1Test_0_to_sumAHighB_uid100_fpExpEM1Test_0_q : std_logic_vector (24 downto 0);
    signal reg_highBBits_uid99_fpExpEM1Test_0_to_sumAHighB_uid100_fpExpEM1Test_1_q : std_logic_vector (23 downto 0);
    signal reg_shiftAddrPreSaturate_uid110_fpExpEM1Test_0_to_negShiftValueSaturate0_uid112_fpExpEM1Test_0_q : std_logic_vector (8 downto 0);
    signal reg_rightShiftStageSel4Dto3_uid310_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_q : std_logic_vector (1 downto 0);
    signal reg_oFracEXZ_uid109_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_2_q : std_logic_vector (24 downto 0);
    signal reg_rightShiftStage0Idx1_uid303_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_3_q : std_logic_vector (24 downto 0);
    signal reg_rightShiftStage0Idx2_uid306_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_4_q : std_logic_vector (24 downto 0);
    signal reg_rightShiftStage0Idx3_uid309_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_5_q : std_logic_vector (24 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_2_q : std_logic_vector (24 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_q : std_logic_vector (0 downto 0);
    signal reg_pad_o_uid9_uid118_fpExpEM1Test_0_to_negBranchFracNotNorm_uid118_fpExpEM1Test_0_q : std_logic_vector (24 downto 0);
    signal reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC2_uid333_expm1PE2TabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid335_expm1PE2PolyEval_0_to_prodXY_uid354_pT1_uid336_expm1PE2PolyEval_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid333_expm1PE2TabGen_lutmem_0_to_prodXY_uid354_pT1_uid336_expm1PE2PolyEval_1_q : std_logic_vector (11 downto 0);
    signal reg_memoryC1_uid331_expm1PE2TabGen_lutmem_0_to_sumAHighB_uid339_expm1PE2PolyEval_0_q : std_logic_vector (19 downto 0);
    signal reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_q : std_logic_vector (16 downto 0);
    signal reg_s1_uid337_uid340_expm1PE2PolyEval_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_1_q : std_logic_vector (21 downto 0);
    signal reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC0_uid329_expm1PE2TabGen_lutmem_0_to_sumAHighB_uid345_expm1PE2PolyEval_0_q : std_logic_vector (28 downto 0);
    signal reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_q : std_logic_vector (23 downto 0);
    signal reg_pe2OR_uid131_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_1_q : std_logic_vector (25 downto 0);
    signal reg_expR_uid88_fpExpEM1Test_0_to_expRPosPost_uid107_fpExpEM1Test_0_q : std_logic_vector (7 downto 0);
    signal reg_expRPosPostRange_uid108_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_2_q : std_logic_vector (7 downto 0);
    signal reg_expBranchClosePos_uid139_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_4_q : std_logic_vector (7 downto 0);
    signal reg_expBranchCloseNeg_uid142_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_5_q : std_logic_vector (7 downto 0);
    signal ld_expXIsMax_uid23_fpExpEM1Test_q_to_exc_N_uid28_fpExpEM1Test_a_q : std_logic_vector (0 downto 0);
    signal ld_InvFracXIsZero_uid27_fpExpEM1Test_q_to_exc_N_uid28_fpExpEM1Test_b_q : std_logic_vector (0 downto 0);
    signal ld_InvExpXIsZero_uid31_fpExpEM1Test_q_to_exc_R_uid32_fpExpEM1Test_a_q : std_logic_vector (0 downto 0);
    signal ld_InvExc_I_uid30_fpExpEM1Test_q_to_exc_R_uid32_fpExpEM1Test_b_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpExpEM1Test_b_to_shiftValuePreSat_uid48_fpExpEM1Test_b_q : std_logic_vector (7 downto 0);
    signal ld_shiftValuePreSatRed_uid51_fpExpEM1Test_b_to_shiftVal_uid52_fpExpEM1Test_c_q : std_logic_vector (5 downto 0);
    signal ld_oneSComplementOption_uid40_fpExpEM1Test_q_to_onesCmpFxpIn_uid57_fpExpEM1Test_b_q : std_logic_vector (0 downto 0);
    signal ld_yRedPostMux_uid70_fpExpEM1Test_q_to_yPPolyEval_uid73_fpExpEM1Test_a_q : std_logic_vector (25 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_expUnderflow_uid83_fpExpEM1Test_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_exc_R_uid32_fpExpEM1Test_0_to_regInAndUndeflowExp_uid84_fpExpEM1Test_2_q_to_regInAndUndeflowExp_uid84_fpExpEM1Test_b_q : std_logic_vector (0 downto 0);
    signal ld_expUnderflow_uid83_fpExpEM1Test_q_to_expUndeflowCondition_uid85_fpExpEM1Test_b_q : std_logic_vector (0 downto 0);
    signal ld_tableAddrPos_uid92_fpExpEM1Test_b_to_addrDecTable_uid93_fpExpEM1Test_c_q : std_logic_vector (4 downto 0);
    signal ld_fracR_uid79_fpExpEM1Test_b_to_zOFracRExp_uid97_fpExpEM1Test_a_q : std_logic_vector (22 downto 0);
    signal ld_lowRangeB_uid98_fpExpEM1Test_b_to_zoFracRPosPostSub_uid98_uid101_fpExpEM1Test_a_q : std_logic_vector (0 downto 0);
    signal ld_reg_expR_uid88_fpExpEM1Test_0_to_expRPosPost_uid107_fpExpEM1Test_0_q_to_expRPosPost_uid107_fpExpEM1Test_a_q : std_logic_vector (7 downto 0);
    signal ld_shiftAddrPreSaturateShort_uid115_fpExpEM1Test_b_to_negShiftValAddr_uid116_fpExpEM1Test_c_q : std_logic_vector (4 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_addrPE2FusedClose_uid128_fpExpEM1Test_b_q : std_logic_vector (0 downto 0);
    signal ld_yBranchClose_uid125_fpExpEM1Test_b_to_yPPolyEval2_uid129_fpExpEM1Test_a_q : std_logic_vector (23 downto 0);
    signal ld_InvSignX_uid144_fpExpEM1Test_q_to_posFarBranch_uid145_fpExpEM1Test_a_q : std_logic_vector (0 downto 0);
    signal ld_posCloseBranch0_uid148_fpExpEM1Test_n_to_posCloseBranch_uid150_fpExpEM1Test_b_q : std_logic_vector (0 downto 0);
    signal ld_posCloseBranch_uid150_fpExpEM1Test_q_to_concBranch_uid151_fpExpEM1Test_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_expBranchCloseNeg_uid142_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_5_q_to_expPostBranchSel_uid153_fpExpEM1Test_f_q : std_logic_vector (7 downto 0);
    signal ld_normFracRPosPost_uid105_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_c_q : std_logic_vector (22 downto 0);
    signal ld_expOvfInitial_uid49_fpExpEM1Test_b_to_InvExpOvfInitial_uid157_fpExpEM1Test_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid32_fpExpEM1Test_q_to_regInAndOvf_uid158_fpExpEM1Test_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid26_fpExpEM1Test_q_to_posInf_uid160_fpExpEM1Test_a_q : std_logic_vector (0 downto 0);
    signal ld_posInf_uid160_fpExpEM1Test_q_to_excRInf_uid161_fpExpEM1Test_a_q : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid156_fpExpEM1Test_q_to_excRInf_uid161_fpExpEM1Test_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid28_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_concExc_uid162_fpExpEM1Test_0_to_excREnc_uid163_fpExpEM1Test_0_q_to_excREnc_uid163_fpExpEM1Test_a_q : std_logic_vector (2 downto 0);
    signal ld_reg_xv3_uid177_constMult_0_to_p3_uid180_constMult_0_q_to_p3_uid180_constMult_a_q : std_logic_vector (5 downto 0);
    signal ld_reg_xv1_uid175_constMult_0_to_p1_uid182_constMult_0_q_to_p1_uid182_constMult_a_q : std_logic_vector (5 downto 0);
    signal ld_reg_xv0_uid174_constMult_0_to_p0_uid183_constMult_0_q_to_p0_uid183_constMult_a_q : std_logic_vector (5 downto 0);
    signal ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage036dto4_uid205_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid206_fxpInPostAlign_uid53_fpExpEM1Test_a_q : std_logic_vector (32 downto 0);
    signal ld_RightShiftStage036dto8_uid209_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid210_fxpInPostAlign_uid53_fpExpEM1Test_a_q : std_logic_vector (28 downto 0);
    signal ld_RightShiftStage036dto12_uid213_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid214_fxpInPostAlign_uid53_fpExpEM1Test_a_q : std_logic_vector (24 downto 0);
    signal ld_rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_q_to_rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test_b_q : std_logic_vector (0 downto 0);
    signal ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage136dto2_uid223_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx2_uid224_fxpInPostAlign_uid53_fpExpEM1Test_a_q : std_logic_vector (34 downto 0);
    signal ld_RightShiftStage136dto3_uid227_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx3_uid228_fxpInPostAlign_uid53_fpExpEM1Test_a_q : std_logic_vector (33 downto 0);
    signal ld_reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_1_q_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_b_q : std_logic_vector (1 downto 0);
    signal ld_rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test_q_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_d_q : std_logic_vector (36 downto 0);
    signal ld_reg_xv0_uid232_constMult_0_to_p0_uid235_constMult_0_q_to_p0_uid235_constMult_a_q : std_logic_vector (5 downto 0);
    signal ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage033dto4_uid254_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid255_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q : std_logic_vector (29 downto 0);
    signal ld_RightShiftStage033dto8_uid258_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid259_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q : std_logic_vector (25 downto 0);
    signal ld_RightShiftStage033dto12_uid262_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid263_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q : std_logic_vector (21 downto 0);
    signal ld_reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q : std_logic_vector (1 downto 0);
    signal ld_rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_q_to_rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q : std_logic_vector (0 downto 0);
    signal ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage133dto2_uid272_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx2_uid273_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q : std_logic_vector (31 downto 0);
    signal ld_RightShiftStage133dto3_uid276_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx3_uid277_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q : std_logic_vector (30 downto 0);
    signal ld_rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test_q_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_d_q : std_logic_vector (33 downto 0);
    signal ld_reg_addr_uid72_fpExpEM1Test_0_to_memoryC1_uid283_exp10TabGen_0_q_to_memoryC1_uid283_exp10TabGen_a_q : std_logic_vector (6 downto 0);
    signal ld_RightShiftStage024dto2_uid312_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid314_shiftedFracForNegBranch_uid117_fpExpEM1Test_a_q : std_logic_vector (22 downto 0);
    signal ld_RightShiftStage024dto4_uid315_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid317_shiftedFracForNegBranch_uid117_fpExpEM1Test_a_q : std_logic_vector (20 downto 0);
    signal ld_RightShiftStage024dto6_uid318_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid320_shiftedFracForNegBranch_uid117_fpExpEM1Test_a_q : std_logic_vector (18 downto 0);
    signal ld_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC1_uid331_expm1PE2TabGen_lutmem_0_q_to_memoryC1_uid331_expm1PE2TabGen_lutmem_a_q : std_logic_vector (7 downto 0);
    signal ld_xv2_uid176_constMult_b_to_reg_xv2_uid176_constMult_0_to_p2_uid181_constMult_0_a_q : std_logic_vector (5 downto 0);
    signal ld_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_1_a_q : std_logic_vector (1 downto 0);
    signal ld_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_1_a_q : std_logic_vector (1 downto 0);
    signal ld_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_1_a_q : std_logic_vector (1 downto 0);
    signal ld_expR_uid87_fpExpEM1Test_b_to_reg_expR_uid87_fpExpEM1Test_0_to_expR_uid88_fpExpEM1Test_2_a_q : std_logic_vector (7 downto 0);
    signal ld_concBranch_uid151_fpExpEM1Test_q_to_reg_concBranch_uid151_fpExpEM1Test_0_to_branchSelEnc_uid152_fpExpEM1Test_0_a_q : std_logic_vector (2 downto 0);
    signal ld_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_reg_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_a_q : std_logic_vector (1 downto 0);
    signal ld_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_reg_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_a_q : std_logic_vector (0 downto 0);
    signal ld_expBranchClosePos_uid139_fpExpEM1Test_b_to_reg_expBranchClosePos_uid139_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_4_a_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpExpEM1Test_b_to_shiftValuePreSat_uid48_fpExpEM1Test_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_reset0 : std_logic;
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_sticky_ena_q : signal is true;
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_inputreg_q : std_logic_vector (10 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_reset0 : std_logic;
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_ia : std_logic_vector (10 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_iq : std_logic_vector (10 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_q : std_logic_vector (10 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_sticky_ena_q : signal is true;
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_reset0 : std_logic;
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_sticky_ena_q : signal is true;
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_reset0 : std_logic;
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_eq : std_logic;
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_sticky_ena_q : signal is true;
    signal ld_yBranchClose_uid125_fpExpEM1Test_b_to_yPPolyEval2_uid129_fpExpEM1Test_a_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_reset0 : std_logic;
    signal ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_sticky_ena_q : signal is true;
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_reset0 : std_logic;
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_eq : std_logic;
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_sticky_ena_q : signal is true;
    signal ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_reset0 : std_logic;
    signal ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_sticky_ena_q : signal is true;
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_reset0 : std_logic;
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_eq : std_logic;
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_sticky_ena_q : signal is true;
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_reset0 : std_logic;
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_eq : std_logic;
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_sticky_ena_q : signal is true;
    signal ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_inputreg_q : std_logic_vector (18 downto 0);
    signal ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_ia : std_logic_vector (18 downto 0);
    signal ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_iq : std_logic_vector (18 downto 0);
    signal ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_q : std_logic_vector (18 downto 0);
    signal ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_sticky_ena_q : signal is true;
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_inputreg_q : std_logic_vector (6 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_reset0 : std_logic;
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_eq : std_logic;
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_sticky_ena_q : signal is true;
    signal ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_inputreg_q : std_logic_vector (16 downto 0);
    signal ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_ia : std_logic_vector (16 downto 0);
    signal ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_iq : std_logic_vector (16 downto 0);
    signal ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_q : std_logic_vector (16 downto 0);
    signal ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_sticky_ena_q : signal is true;
    signal ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_reset0 : std_logic;
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_eq : std_logic;
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_sticky_ena_q : signal is true;
    signal shiftUdf_uid50_fpExpEM1Test_a : std_logic_vector(11 downto 0);
    signal shiftUdf_uid50_fpExpEM1Test_b : std_logic_vector(11 downto 0);
    signal shiftUdf_uid50_fpExpEM1Test_o : std_logic_vector (11 downto 0);
    signal shiftUdf_uid50_fpExpEM1Test_cin : std_logic_vector (0 downto 0);
    signal shiftUdf_uid50_fpExpEM1Test_n : std_logic_vector (0 downto 0);
    signal expUdf_uid80_fpExpEM1Test_a : std_logic_vector(15 downto 0);
    signal expUdf_uid80_fpExpEM1Test_b : std_logic_vector(15 downto 0);
    signal expUdf_uid80_fpExpEM1Test_o : std_logic_vector (15 downto 0);
    signal expUdf_uid80_fpExpEM1Test_cin : std_logic_vector (0 downto 0);
    signal expUdf_uid80_fpExpEM1Test_n : std_logic_vector (0 downto 0);
    signal expOvf_uid82_fpExpEM1Test_a : std_logic_vector(15 downto 0);
    signal expOvf_uid82_fpExpEM1Test_b : std_logic_vector(15 downto 0);
    signal expOvf_uid82_fpExpEM1Test_o : std_logic_vector (15 downto 0);
    signal expOvf_uid82_fpExpEM1Test_cin : std_logic_vector (0 downto 0);
    signal expOvf_uid82_fpExpEM1Test_n : std_logic_vector (0 downto 0);
    signal expSatValue_uid91_fpExpEM1Test_a : std_logic_vector(11 downto 0);
    signal expSatValue_uid91_fpExpEM1Test_b : std_logic_vector(11 downto 0);
    signal expSatValue_uid91_fpExpEM1Test_o : std_logic_vector (11 downto 0);
    signal expSatValue_uid91_fpExpEM1Test_cin : std_logic_vector (0 downto 0);
    signal expSatValue_uid91_fpExpEM1Test_n : std_logic_vector (0 downto 0);
    signal negShiftValueSaturate0_uid112_fpExpEM1Test_a : std_logic_vector(11 downto 0);
    signal negShiftValueSaturate0_uid112_fpExpEM1Test_b : std_logic_vector(11 downto 0);
    signal negShiftValueSaturate0_uid112_fpExpEM1Test_o : std_logic_vector (11 downto 0);
    signal negShiftValueSaturate0_uid112_fpExpEM1Test_cin : std_logic_vector (0 downto 0);
    signal negShiftValueSaturate0_uid112_fpExpEM1Test_n : std_logic_vector (0 downto 0);
    signal pad_o_uid9_uid118_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal oFracXZwE_uid56_fpExpEM1Test_q : std_logic_vector (33 downto 0);
    signal zOFracRExp_uid97_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal InvSignX_uid144_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid144_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal InvExpOvfInitial_uid157_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal InvExpOvfInitial_uid157_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal expX_uid6_fpExpEM1Test_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpExpEM1Test_b : std_logic_vector (7 downto 0);
    signal signX_uid7_fpExpEM1Test_in : std_logic_vector (31 downto 0);
    signal signX_uid7_fpExpEM1Test_b : std_logic_vector (0 downto 0);
    signal frac_uid24_fpExpEM1Test_in : std_logic_vector (22 downto 0);
    signal frac_uid24_fpExpEM1Test_b : std_logic_vector (22 downto 0);
    signal expXIsZero_uid21_fpExpEM1Test_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid21_fpExpEM1Test_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid21_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid23_fpExpEM1Test_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid23_fpExpEM1Test_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid23_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid25_fpExpEM1Test_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid25_fpExpEM1Test_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid25_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal exc_I_uid26_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal exc_I_uid26_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal exc_I_uid26_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal exc_N_uid28_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal exc_N_uid28_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal exc_N_uid28_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal fxpInExtX_uid43_fpExpEM1Test_a : std_logic_vector(26 downto 0);
    signal fxpInExtX_uid43_fpExpEM1Test_b : std_logic_vector(26 downto 0);
    signal fxpInExtX_uid43_fpExpEM1Test_o : std_logic_vector (26 downto 0);
    signal fxpInExtX_uid43_fpExpEM1Test_q : std_logic_vector (25 downto 0);
    signal shiftValuePreSat_uid48_fpExpEM1Test_a : std_logic_vector(8 downto 0);
    signal shiftValuePreSat_uid48_fpExpEM1Test_b : std_logic_vector(8 downto 0);
    signal shiftValuePreSat_uid48_fpExpEM1Test_o : std_logic_vector (8 downto 0);
    signal shiftValuePreSat_uid48_fpExpEM1Test_q : std_logic_vector (8 downto 0);
    signal shiftVal_uid52_fpExpEM1Test_s : std_logic_vector (0 downto 0);
    signal shiftVal_uid52_fpExpEM1Test_q : std_logic_vector (5 downto 0);
    signal fxpInExt_uid58_fpExpEM1Test_a : std_logic_vector(35 downto 0);
    signal fxpInExt_uid58_fpExpEM1Test_b : std_logic_vector(35 downto 0);
    signal fxpInExt_uid58_fpExpEM1Test_o : std_logic_vector (35 downto 0);
    signal fxpInExt_uid58_fpExpEM1Test_q : std_logic_vector (34 downto 0);
    signal yExt_uid65_fpExpEM1Test_a : std_logic_vector(43 downto 0);
    signal yExt_uid65_fpExpEM1Test_b : std_logic_vector(43 downto 0);
    signal yExt_uid65_fpExpEM1Test_o : std_logic_vector (43 downto 0);
    signal yExt_uid65_fpExpEM1Test_q : std_logic_vector (43 downto 0);
    signal yRedPostMux_uid70_fpExpEM1Test_s : std_logic_vector (0 downto 0);
    signal yRedPostMux_uid70_fpExpEM1Test_q : std_logic_vector (25 downto 0);
    signal expRPostBiasPreExc_uid78_fpExpEM1Test_a : std_logic_vector(13 downto 0);
    signal expRPostBiasPreExc_uid78_fpExpEM1Test_b : std_logic_vector(13 downto 0);
    signal expRPostBiasPreExc_uid78_fpExpEM1Test_o : std_logic_vector (13 downto 0);
    signal expRPostBiasPreExc_uid78_fpExpEM1Test_q : std_logic_vector (12 downto 0);
    signal regInAndUndeflowExp_uid84_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal regInAndUndeflowExp_uid84_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal regInAndUndeflowExp_uid84_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal expR_uid88_fpExpEM1Test_s : std_logic_vector (0 downto 0);
    signal expR_uid88_fpExpEM1Test_q : std_logic_vector (7 downto 0);
    signal tableAddrPosExt_uid89_fpExpEM1Test_a : std_logic_vector(8 downto 0);
    signal tableAddrPosExt_uid89_fpExpEM1Test_b : std_logic_vector(8 downto 0);
    signal tableAddrPosExt_uid89_fpExpEM1Test_o : std_logic_vector (8 downto 0);
    signal tableAddrPosExt_uid89_fpExpEM1Test_q : std_logic_vector (8 downto 0);
    signal subDecrementMask_uid94_fpExpEM1Test_q : std_logic_vector(19 downto 0);
    signal subDecrementMask_uid95_fpExpEM1Test_q : std_logic_vector(4 downto 0);
    signal sumAHighB_uid100_fpExpEM1Test_a : std_logic_vector(25 downto 0);
    signal sumAHighB_uid100_fpExpEM1Test_b : std_logic_vector(25 downto 0);
    signal sumAHighB_uid100_fpExpEM1Test_o : std_logic_vector (25 downto 0);
    signal sumAHighB_uid100_fpExpEM1Test_q : std_logic_vector (25 downto 0);
    signal expRPosPost_uid107_fpExpEM1Test_a : std_logic_vector(8 downto 0);
    signal expRPosPost_uid107_fpExpEM1Test_b : std_logic_vector(8 downto 0);
    signal expRPosPost_uid107_fpExpEM1Test_o : std_logic_vector (8 downto 0);
    signal expRPosPost_uid107_fpExpEM1Test_q : std_logic_vector (8 downto 0);
    signal shiftAddrPreSaturate_uid110_fpExpEM1Test_a : std_logic_vector(8 downto 0);
    signal shiftAddrPreSaturate_uid110_fpExpEM1Test_b : std_logic_vector(8 downto 0);
    signal shiftAddrPreSaturate_uid110_fpExpEM1Test_o : std_logic_vector (8 downto 0);
    signal shiftAddrPreSaturate_uid110_fpExpEM1Test_q : std_logic_vector (8 downto 0);
    signal negInf_uid113_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal negInf_uid113_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal negInf_uid113_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal negShiftValueSaturate_uid114_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal negShiftValueSaturate_uid114_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal negShiftValueSaturate_uid114_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal negShiftValAddr_uid116_fpExpEM1Test_s : std_logic_vector (0 downto 0);
    signal negShiftValAddr_uid116_fpExpEM1Test_q : std_logic_vector (4 downto 0);
    signal negBranchFracNotNorm_uid118_fpExpEM1Test_a : std_logic_vector(25 downto 0);
    signal negBranchFracNotNorm_uid118_fpExpEM1Test_b : std_logic_vector(25 downto 0);
    signal negBranchFracNotNorm_uid118_fpExpEM1Test_o : std_logic_vector (25 downto 0);
    signal negBranchFracNotNorm_uid118_fpExpEM1Test_q : std_logic_vector (25 downto 0);
    signal posFarBranch0_uid143_fpExpEM1Test_a : std_logic_vector(10 downto 0);
    signal posFarBranch0_uid143_fpExpEM1Test_b : std_logic_vector(10 downto 0);
    signal posFarBranch0_uid143_fpExpEM1Test_o : std_logic_vector (10 downto 0);
    signal posFarBranch0_uid143_fpExpEM1Test_cin : std_logic_vector (0 downto 0);
    signal posFarBranch0_uid143_fpExpEM1Test_n : std_logic_vector (0 downto 0);
    signal posFarBranch_uid145_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal posFarBranch_uid145_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal posFarBranch_uid145_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal negFarBranch0_uid146_fpExpEM1Test_a : std_logic_vector(10 downto 0);
    signal negFarBranch0_uid146_fpExpEM1Test_b : std_logic_vector(10 downto 0);
    signal negFarBranch0_uid146_fpExpEM1Test_o : std_logic_vector (10 downto 0);
    signal negFarBranch0_uid146_fpExpEM1Test_cin : std_logic_vector (0 downto 0);
    signal negFarBranch0_uid146_fpExpEM1Test_n : std_logic_vector (0 downto 0);
    signal negFarBranch_uid147_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal negFarBranch_uid147_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal negFarBranch_uid147_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal posCloseBranch0_uid148_fpExpEM1Test_a : std_logic_vector(10 downto 0);
    signal posCloseBranch0_uid148_fpExpEM1Test_b : std_logic_vector(10 downto 0);
    signal posCloseBranch0_uid148_fpExpEM1Test_o : std_logic_vector (10 downto 0);
    signal posCloseBranch0_uid148_fpExpEM1Test_cin : std_logic_vector (0 downto 0);
    signal posCloseBranch0_uid148_fpExpEM1Test_n : std_logic_vector (0 downto 0);
    signal posCloseBranch_uid150_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal posCloseBranch_uid150_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal posCloseBranch_uid150_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal expPostBranchSel_uid153_fpExpEM1Test_s : std_logic_vector (1 downto 0);
    signal expPostBranchSel_uid153_fpExpEM1Test_q : std_logic_vector (7 downto 0);
    signal fracPostBranchSel_uid154_fpExpEM1Test_s : std_logic_vector (1 downto 0);
    signal fracPostBranchSel_uid154_fpExpEM1Test_q : std_logic_vector (22 downto 0);
    signal regInAndOvf_uid158_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid158_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid158_fpExpEM1Test_c : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid158_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal posInf_uid160_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal posInf_uid160_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal posInf_uid160_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal excRInf_uid161_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal excRInf_uid161_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal excRInf_uid161_fpExpEM1Test_c : std_logic_vector(0 downto 0);
    signal excRInf_uid161_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal excREnc_uid163_fpExpEM1Test_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid167_fpExpEM1Test_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid167_fpExpEM1Test_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid171_fpExpEM1Test_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid171_fpExpEM1Test_q : std_logic_vector (7 downto 0);
    signal p3_uid180_constMult_q : std_logic_vector(30 downto 0);
    signal p1_uid182_constMult_q : std_logic_vector(18 downto 0);
    signal p0_uid183_constMult_q : std_logic_vector(12 downto 0);
    signal lev1_a1_uid185_constMult_a : std_logic_vector(25 downto 0);
    signal lev1_a1_uid185_constMult_b : std_logic_vector(25 downto 0);
    signal lev1_a1_uid185_constMult_o : std_logic_vector (25 downto 0);
    signal lev1_a1_uid185_constMult_q : std_logic_vector (25 downto 0);
    signal lev3_a0_uid187_constMult_a : std_logic_vector(35 downto 0);
    signal lev3_a0_uid187_constMult_b : std_logic_vector(35 downto 0);
    signal lev3_a0_uid187_constMult_o : std_logic_vector (35 downto 0);
    signal lev3_a0_uid187_constMult_q : std_logic_vector (34 downto 0);
    signal rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (36 downto 0);
    signal p0_uid235_constMult_q : std_logic_vector(39 downto 0);
    signal lev1_a0_uid236_constMult_a : std_logic_vector(46 downto 0);
    signal lev1_a0_uid236_constMult_b : std_logic_vector(46 downto 0);
    signal lev1_a0_uid236_constMult_o : std_logic_vector (46 downto 0);
    signal lev1_a0_uid236_constMult_q : std_logic_vector (45 downto 0);
    signal rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal expFracCstLogZ5_uid37_fpExpEM1Test_in : std_logic_vector (30 downto 0);
    signal expFracCstLogZ5_uid37_fpExpEM1Test_b : std_logic_vector (30 downto 0);
    signal normBit2_uid133_fpExpEM1Test_in : std_logic_vector (48 downto 0);
    signal normBit2_uid133_fpExpEM1Test_b : std_logic_vector (0 downto 0);
    signal fracBranchClosePosHigh_uid135_fpExpEM1Test_in : std_logic_vector (47 downto 0);
    signal fracBranchClosePosHigh_uid135_fpExpEM1Test_b : std_logic_vector (22 downto 0);
    signal fracBranchClosePosLow_uid136_fpExpEM1Test_in : std_logic_vector (46 downto 0);
    signal fracBranchClosePosLow_uid136_fpExpEM1Test_b : std_logic_vector (22 downto 0);
    signal rightShiftStage1Idx2_uid317_shiftedFracForNegBranch_uid117_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal rightShiftStage1Idx1_uid206_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx2_uid210_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx3_uid214_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx1_uid314_shiftedFracForNegBranch_uid117_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal rightShiftStage2Idx2_uid224_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage2Idx3_uid228_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx1_uid255_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage1Idx2_uid259_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage1Idx3_uid263_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage2Idx2_uid273_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage2Idx3_uid277_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage1Idx3_uid320_shiftedFracForNegBranch_uid117_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal prodXYTruncFR_uid349_pT1_uid288_exp10PolyEval_in : std_logic_vector (27 downto 0);
    signal prodXYTruncFR_uid349_pT1_uid288_exp10PolyEval_b : std_logic_vector (14 downto 0);
    signal prodXYTruncFR_uid352_pT2_uid294_exp10PolyEval_in : std_logic_vector (42 downto 0);
    signal prodXYTruncFR_uid352_pT2_uid294_exp10PolyEval_b : std_logic_vector (24 downto 0);
    signal prodXYTruncFR_uid355_pT1_uid336_expm1PE2PolyEval_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid355_pT1_uid336_expm1PE2PolyEval_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid358_pT2_uid342_expm1PE2PolyEval_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid358_pT2_uid342_expm1PE2PolyEval_b : std_logic_vector (22 downto 0);
    signal rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal yPPolyEval_uid73_fpExpEM1Test_in : std_logic_vector (18 downto 0);
    signal yPPolyEval_uid73_fpExpEM1Test_b : std_logic_vector (18 downto 0);
    signal zoFracRPosPostSub_uid98_uid101_fpExpEM1Test_q : std_logic_vector (26 downto 0);
    signal yPPolyEval2_uid129_fpExpEM1Test_in : std_logic_vector (16 downto 0);
    signal yPPolyEval2_uid129_fpExpEM1Test_b : std_logic_vector (16 downto 0);
    signal concBranch_uid151_fpExpEM1Test_q : std_logic_vector (2 downto 0);
    signal concExc_uid162_fpExpEM1Test_q : std_logic_vector (2 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmp_a : std_logic_vector(2 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmp_b : std_logic_vector(2 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_nor_q : std_logic_vector(0 downto 0);
    signal fracR_uid79_fpExpEM1Test_in : std_logic_vector (22 downto 0);
    signal fracR_uid79_fpExpEM1Test_b : std_logic_vector (22 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_nor_q : std_logic_vector(0 downto 0);
    signal expBranchClosePosExt_uid138_fpExpEM1Test_a : std_logic_vector(8 downto 0);
    signal expBranchClosePosExt_uid138_fpExpEM1Test_b : std_logic_vector(8 downto 0);
    signal expBranchClosePosExt_uid138_fpExpEM1Test_o : std_logic_vector (8 downto 0);
    signal expBranchClosePosExt_uid138_fpExpEM1Test_q : std_logic_vector (8 downto 0);
    signal ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_nor_q : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_nor_q : std_logic_vector(0 downto 0);
    signal RExpE_uid172_fpExpEM1Test_q : std_logic_vector (31 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmp_a : std_logic_vector(5 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmp_b : std_logic_vector(5 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_nor_q : std_logic_vector(0 downto 0);
    signal expFracX_uid36_fpExpEM1Test_q : std_logic_vector (30 downto 0);
    signal oFracX_uid34_uid34_fpExpEM1Test_q : std_logic_vector (23 downto 0);
    signal InvExpXIsZero_uid31_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid31_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid27_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid27_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid30_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid30_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid29_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid29_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal fxpInPreAlign_uid44_fpExpEM1Test_in : std_logic_vector (24 downto 0);
    signal fxpInPreAlign_uid44_fpExpEM1Test_b : std_logic_vector (24 downto 0);
    signal expOvfInitial_uid49_fpExpEM1Test_in : std_logic_vector (8 downto 0);
    signal expOvfInitial_uid49_fpExpEM1Test_b : std_logic_vector (0 downto 0);
    signal shiftValuePreSatRed_uid51_fpExpEM1Test_in : std_logic_vector (5 downto 0);
    signal shiftValuePreSatRed_uid51_fpExpEM1Test_b : std_logic_vector (5 downto 0);
    signal rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_in : std_logic_vector (5 downto 0);
    signal rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_in : std_logic_vector (3 downto 0);
    signal rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_in : std_logic_vector (1 downto 0);
    signal rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector (1 downto 0);
    signal fxpInPreAlign_uid59_fpExpEM1Test_in : std_logic_vector (33 downto 0);
    signal fxpInPreAlign_uid59_fpExpEM1Test_b : std_logic_vector (33 downto 0);
    signal YExt43_uid67_fpExpEM1Test_in : std_logic_vector (43 downto 0);
    signal YExt43_uid67_fpExpEM1Test_b : std_logic_vector (0 downto 0);
    signal yRed_uid69_fpExpEM1Test_in : std_logic_vector (31 downto 0);
    signal yRed_uid69_fpExpEM1Test_b : std_logic_vector (25 downto 0);
    signal addr_uid72_fpExpEM1Test_in : std_logic_vector (25 downto 0);
    signal addr_uid72_fpExpEM1Test_b : std_logic_vector (6 downto 0);
    signal expR_uid87_fpExpEM1Test_in : std_logic_vector (7 downto 0);
    signal expR_uid87_fpExpEM1Test_b : std_logic_vector (7 downto 0);
    signal tableAddrPos_uid92_fpExpEM1Test_in : std_logic_vector (4 downto 0);
    signal tableAddrPos_uid92_fpExpEM1Test_b : std_logic_vector (4 downto 0);
    signal os_uid96_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal expRPosPostRange_uid108_fpExpEM1Test_in : std_logic_vector (7 downto 0);
    signal expRPosPostRange_uid108_fpExpEM1Test_b : std_logic_vector (7 downto 0);
    signal shiftAddrPreSaturateShort_uid115_fpExpEM1Test_in : std_logic_vector (4 downto 0);
    signal shiftAddrPreSaturateShort_uid115_fpExpEM1Test_b : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid310_shiftedFracForNegBranch_uid117_fpExpEM1Test_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid310_shiftedFracForNegBranch_uid117_fpExpEM1Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_b : std_logic_vector (0 downto 0);
    signal expNegBranchIsZero_uid120_fpExpEM1Test_in : std_logic_vector (24 downto 0);
    signal expNegBranchIsZero_uid120_fpExpEM1Test_b : std_logic_vector (0 downto 0);
    signal negBranchFracNotNormHigh_uid121_fpExpEM1Test_in : std_logic_vector (23 downto 0);
    signal negBranchFracNotNormHigh_uid121_fpExpEM1Test_b : std_logic_vector (22 downto 0);
    signal negBranchFracNotNormLow_uid122_fpExpEM1Test_in : std_logic_vector (22 downto 0);
    signal negBranchFracNotNormLow_uid122_fpExpEM1Test_b : std_logic_vector (22 downto 0);
    signal sR_uid188_constMult_in : std_logic_vector (31 downto 0);
    signal sR_uid188_constMult_b : std_logic_vector (28 downto 0);
    signal RightShiftStage036dto4_uid205_fxpInPostAlign_uid53_fpExpEM1Test_in : std_logic_vector (36 downto 0);
    signal RightShiftStage036dto4_uid205_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector (32 downto 0);
    signal RightShiftStage036dto8_uid209_fxpInPostAlign_uid53_fpExpEM1Test_in : std_logic_vector (36 downto 0);
    signal RightShiftStage036dto8_uid209_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector (28 downto 0);
    signal RightShiftStage036dto12_uid213_fxpInPostAlign_uid53_fpExpEM1Test_in : std_logic_vector (36 downto 0);
    signal RightShiftStage036dto12_uid213_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector (24 downto 0);
    signal sR_uid237_constMult_in : std_logic_vector (44 downto 0);
    signal sR_uid237_constMult_b : std_logic_vector (42 downto 0);
    signal RightShiftStage033dto4_uid254_fxpInPostAlign_X_uid64_fpExpEM1Test_in : std_logic_vector (33 downto 0);
    signal RightShiftStage033dto4_uid254_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector (29 downto 0);
    signal RightShiftStage033dto8_uid258_fxpInPostAlign_X_uid64_fpExpEM1Test_in : std_logic_vector (33 downto 0);
    signal RightShiftStage033dto8_uid258_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector (25 downto 0);
    signal RightShiftStage033dto12_uid262_fxpInPostAlign_X_uid64_fpExpEM1Test_in : std_logic_vector (33 downto 0);
    signal RightShiftStage033dto12_uid262_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector (21 downto 0);
    signal RightShiftStage024dto2_uid312_shiftedFracForNegBranch_uid117_fpExpEM1Test_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto2_uid312_shiftedFracForNegBranch_uid117_fpExpEM1Test_b : std_logic_vector (22 downto 0);
    signal RightShiftStage024dto4_uid315_shiftedFracForNegBranch_uid117_fpExpEM1Test_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto4_uid315_shiftedFracForNegBranch_uid117_fpExpEM1Test_b : std_logic_vector (20 downto 0);
    signal RightShiftStage024dto6_uid318_shiftedFracForNegBranch_uid117_fpExpEM1Test_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto6_uid318_shiftedFracForNegBranch_uid117_fpExpEM1Test_b : std_logic_vector (18 downto 0);
    signal inCloseBranch_uid38_fpExpEM1Test_a : std_logic_vector(33 downto 0);
    signal inCloseBranch_uid38_fpExpEM1Test_b : std_logic_vector(33 downto 0);
    signal inCloseBranch_uid38_fpExpEM1Test_o : std_logic_vector (33 downto 0);
    signal inCloseBranch_uid38_fpExpEM1Test_cin : std_logic_vector (0 downto 0);
    signal inCloseBranch_uid38_fpExpEM1Test_n : std_logic_vector (0 downto 0);
    signal fracBranchClosePos_uid137_fpExpEM1Test_s : std_logic_vector (0 downto 0);
    signal fracBranchClosePos_uid137_fpExpEM1Test_q : std_logic_vector (22 downto 0);
    signal InvNormBit2_uid140_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal InvNormBit2_uid140_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal lowRangeB_uid289_exp10PolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid289_exp10PolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid290_exp10PolyEval_in : std_logic_vector (14 downto 0);
    signal highBBits_uid290_exp10PolyEval_b : std_logic_vector (13 downto 0);
    signal lowRangeB_uid295_exp10PolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid295_exp10PolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid296_exp10PolyEval_in : std_logic_vector (24 downto 0);
    signal highBBits_uid296_exp10PolyEval_b : std_logic_vector (22 downto 0);
    signal lowRangeB_uid337_expm1PE2PolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid337_expm1PE2PolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid338_expm1PE2PolyEval_in : std_logic_vector (12 downto 0);
    signal highBBits_uid338_expm1PE2PolyEval_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid343_expm1PE2PolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid343_expm1PE2PolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid344_expm1PE2PolyEval_in : std_logic_vector (22 downto 0);
    signal highBBits_uid344_expm1PE2PolyEval_b : std_logic_vector (20 downto 0);
    signal RightShiftStage136dto1_uid219_fxpInPostAlign_uid53_fpExpEM1Test_in : std_logic_vector (36 downto 0);
    signal RightShiftStage136dto1_uid219_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector (35 downto 0);
    signal RightShiftStage136dto2_uid223_fxpInPostAlign_uid53_fpExpEM1Test_in : std_logic_vector (36 downto 0);
    signal RightShiftStage136dto2_uid223_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector (34 downto 0);
    signal RightShiftStage136dto3_uid227_fxpInPostAlign_uid53_fpExpEM1Test_in : std_logic_vector (36 downto 0);
    signal RightShiftStage136dto3_uid227_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector (33 downto 0);
    signal ePreRnd_uid54_fpExpEM1Test_in : std_logic_vector (36 downto 0);
    signal ePreRnd_uid54_fpExpEM1Test_b : std_logic_vector (10 downto 0);
    signal RightShiftStage133dto1_uid268_fxpInPostAlign_X_uid64_fpExpEM1Test_in : std_logic_vector (33 downto 0);
    signal RightShiftStage133dto1_uid268_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector (32 downto 0);
    signal RightShiftStage133dto2_uid272_fxpInPostAlign_X_uid64_fpExpEM1Test_in : std_logic_vector (33 downto 0);
    signal RightShiftStage133dto2_uid272_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector (31 downto 0);
    signal RightShiftStage133dto3_uid276_fxpInPostAlign_X_uid64_fpExpEM1Test_in : std_logic_vector (33 downto 0);
    signal RightShiftStage133dto3_uid276_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector (30 downto 0);
    signal pad_fxpInPostAlignR_X_uid65_uid65_fpExpEM1Test_q : std_logic_vector (41 downto 0);
    signal yBranchClose_uid125_fpExpEM1Test_in : std_logic_vector (23 downto 0);
    signal yBranchClose_uid125_fpExpEM1Test_b : std_logic_vector (23 downto 0);
    signal RightShiftStage124dto1_uid323_shiftedFracForNegBranch_uid117_fpExpEM1Test_in : std_logic_vector (24 downto 0);
    signal RightShiftStage124dto1_uid323_shiftedFracForNegBranch_uid117_fpExpEM1Test_b : std_logic_vector (23 downto 0);
    signal yT1_uid287_exp10PolyEval_in : std_logic_vector (18 downto 0);
    signal yT1_uid287_exp10PolyEval_b : std_logic_vector (13 downto 0);
    signal udfBitSubPos_uid102_fpExpEM1Test_in : std_logic_vector (24 downto 0);
    signal udfBitSubPos_uid102_fpExpEM1Test_b : std_logic_vector (0 downto 0);
    signal udfBitSubPosHigh_uid103_fpExpEM1Test_in : std_logic_vector (23 downto 0);
    signal udfBitSubPosHigh_uid103_fpExpEM1Test_b : std_logic_vector (22 downto 0);
    signal udfBitSubPosLow_uid104_fpExpEM1Test_in : std_logic_vector (22 downto 0);
    signal udfBitSubPosLow_uid104_fpExpEM1Test_b : std_logic_vector (22 downto 0);
    signal yT1_uid335_expm1PE2PolyEval_in : std_logic_vector (16 downto 0);
    signal yT1_uid335_expm1PE2PolyEval_b : std_logic_vector (11 downto 0);
    signal oFracEXZ_uid109_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal expBranchClosePos_uid139_fpExpEM1Test_in : std_logic_vector (7 downto 0);
    signal expBranchClosePos_uid139_fpExpEM1Test_b : std_logic_vector (7 downto 0);
    signal oFracX_uid41_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal exc_R_uid32_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal exc_R_uid32_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal exc_R_uid32_fpExpEM1Test_c : std_logic_vector(0 downto 0);
    signal exc_R_uid32_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal xv0_uid174_constMult_in : std_logic_vector (5 downto 0);
    signal xv0_uid174_constMult_b : std_logic_vector (5 downto 0);
    signal xv1_uid175_constMult_in : std_logic_vector (11 downto 0);
    signal xv1_uid175_constMult_b : std_logic_vector (5 downto 0);
    signal xv2_uid176_constMult_in : std_logic_vector (17 downto 0);
    signal xv2_uid176_constMult_b : std_logic_vector (5 downto 0);
    signal xv3_uid177_constMult_in : std_logic_vector (23 downto 0);
    signal xv3_uid177_constMult_b : std_logic_vector (5 downto 0);
    signal xv4_uid178_constMult_in : std_logic_vector (24 downto 0);
    signal xv4_uid178_constMult_b : std_logic_vector (0 downto 0);
    signal regXAndExpOverflowAndPos_uid156_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid156_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid156_fpExpEM1Test_c : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid156_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_in : std_logic_vector (33 downto 0);
    signal msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector (0 downto 0);
    signal X33dto16_uid242_fxpInPostAlign_X_uid64_fpExpEM1Test_in : std_logic_vector (33 downto 0);
    signal X33dto16_uid242_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector (17 downto 0);
    signal X33dto32_uid246_fxpInPostAlign_X_uid64_fpExpEM1Test_in : std_logic_vector (33 downto 0);
    signal X33dto32_uid246_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector (1 downto 0);
    signal lowRangeB_uid98_fpExpEM1Test_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid98_fpExpEM1Test_b : std_logic_vector (0 downto 0);
    signal highBBits_uid99_fpExpEM1Test_in : std_logic_vector (24 downto 0);
    signal highBBits_uid99_fpExpEM1Test_b : std_logic_vector (23 downto 0);
    signal oFracXZwE_uid47_fpExpEM1Test_q : std_logic_vector (36 downto 0);
    signal InvInCloseBranch_uid39_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal InvInCloseBranch_uid39_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal expBranchCloseNegExt_uid141_fpExpEM1Test_a : std_logic_vector(8 downto 0);
    signal expBranchCloseNegExt_uid141_fpExpEM1Test_b : std_logic_vector(8 downto 0);
    signal expBranchCloseNegExt_uid141_fpExpEM1Test_o : std_logic_vector (8 downto 0);
    signal expBranchCloseNegExt_uid141_fpExpEM1Test_q : std_logic_vector (8 downto 0);
    signal sumAHighB_uid291_exp10PolyEval_a : std_logic_vector(22 downto 0);
    signal sumAHighB_uid291_exp10PolyEval_b : std_logic_vector(22 downto 0);
    signal sumAHighB_uid291_exp10PolyEval_o : std_logic_vector (22 downto 0);
    signal sumAHighB_uid291_exp10PolyEval_q : std_logic_vector (22 downto 0);
    signal sumAHighB_uid297_exp10PolyEval_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid297_exp10PolyEval_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid297_exp10PolyEval_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid297_exp10PolyEval_q : std_logic_vector (29 downto 0);
    signal sumAHighB_uid339_expm1PE2PolyEval_a : std_logic_vector(20 downto 0);
    signal sumAHighB_uid339_expm1PE2PolyEval_b : std_logic_vector(20 downto 0);
    signal sumAHighB_uid339_expm1PE2PolyEval_o : std_logic_vector (20 downto 0);
    signal sumAHighB_uid339_expm1PE2PolyEval_q : std_logic_vector (20 downto 0);
    signal sumAHighB_uid345_expm1PE2PolyEval_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid345_expm1PE2PolyEval_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid345_expm1PE2PolyEval_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid345_expm1PE2PolyEval_q : std_logic_vector (29 downto 0);
    signal rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (36 downto 0);
    signal xv0_uid232_constMult_in : std_logic_vector (5 downto 0);
    signal xv0_uid232_constMult_b : std_logic_vector (5 downto 0);
    signal xv1_uid233_constMult_in : std_logic_vector (10 downto 0);
    signal xv1_uid233_constMult_b : std_logic_vector (4 downto 0);
    signal rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector (33 downto 0);
    signal addrPE2_uid127_fpExpEM1Test_in : std_logic_vector (23 downto 0);
    signal addrPE2_uid127_fpExpEM1Test_b : std_logic_vector (6 downto 0);
    signal rightShiftStage2Idx1_uid325_shiftedFracForNegBranch_uid117_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal X24dto8_uid301_shiftedFracForNegBranch_uid117_fpExpEM1Test_in : std_logic_vector (24 downto 0);
    signal X24dto8_uid301_shiftedFracForNegBranch_uid117_fpExpEM1Test_b : std_logic_vector (16 downto 0);
    signal X24dto16_uid304_shiftedFracForNegBranch_uid117_fpExpEM1Test_in : std_logic_vector (24 downto 0);
    signal X24dto16_uid304_shiftedFracForNegBranch_uid117_fpExpEM1Test_b : std_logic_vector (8 downto 0);
    signal X24dto24_uid307_shiftedFracForNegBranch_uid117_fpExpEM1Test_in : std_logic_vector (24 downto 0);
    signal X24dto24_uid307_shiftedFracForNegBranch_uid117_fpExpEM1Test_b : std_logic_vector (0 downto 0);
    signal rightShiftStage0Idx1Pad16_uid241_fxpInPostAlign_X_uid64_fpExpEM1Test_a : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx1Pad16_uid241_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx1Pad16_uid241_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx2Pad32_uid245_fxpInPostAlign_X_uid64_fpExpEM1Test_a : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx2Pad32_uid245_fxpInPostAlign_X_uid64_fpExpEM1Test_b : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx2Pad32_uid245_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx1_uid243_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector (33 downto 0);
    signal rightShiftStage0Idx2_uid247_fxpInPostAlign_X_uid64_fpExpEM1Test_q : std_logic_vector (33 downto 0);
    signal msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_in : std_logic_vector (36 downto 0);
    signal msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector (0 downto 0);
    signal X36dto16_uid193_fxpInPostAlign_uid53_fpExpEM1Test_in : std_logic_vector (36 downto 0);
    signal X36dto16_uid193_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector (20 downto 0);
    signal X36dto32_uid197_fxpInPostAlign_uid53_fpExpEM1Test_in : std_logic_vector (36 downto 0);
    signal X36dto32_uid197_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector (4 downto 0);
    signal oneSComplementOption_uid40_fpExpEM1Test_a : std_logic_vector(0 downto 0);
    signal oneSComplementOption_uid40_fpExpEM1Test_b : std_logic_vector(0 downto 0);
    signal oneSComplementOption_uid40_fpExpEM1Test_q : std_logic_vector(0 downto 0);
    signal expBranchCloseNeg_uid142_fpExpEM1Test_in : std_logic_vector (7 downto 0);
    signal expBranchCloseNeg_uid142_fpExpEM1Test_b : std_logic_vector (7 downto 0);
    signal s1_uid289_uid292_exp10PolyEval_q : std_logic_vector (23 downto 0);
    signal s2_uid295_uid298_exp10PolyEval_q : std_logic_vector (31 downto 0);
    signal s1_uid337_uid340_expm1PE2PolyEval_q : std_logic_vector (21 downto 0);
    signal s2_uid343_uid346_expm1PE2PolyEval_q : std_logic_vector (31 downto 0);
    signal addrPE2FusedClose_uid128_fpExpEM1Test_q : std_logic_vector (7 downto 0);
    signal rightShiftStage0Idx1_uid303_shiftedFracForNegBranch_uid117_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal rightShiftStage0Idx2_uid306_shiftedFracForNegBranch_uid117_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal rightShiftStage0Idx3_uid309_shiftedFracForNegBranch_uid117_fpExpEM1Test_q : std_logic_vector (24 downto 0);
    signal rightShiftStage0Idx1Pad16_uid192_fxpInPostAlign_uid53_fpExpEM1Test_a : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx1Pad16_uid192_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx1Pad16_uid192_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx2Pad32_uid196_fxpInPostAlign_uid53_fpExpEM1Test_a : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx2Pad32_uid196_fxpInPostAlign_uid53_fpExpEM1Test_b : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx2Pad32_uid196_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx1_uid194_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage0Idx2_uid198_fxpInPostAlign_uid53_fpExpEM1Test_q : std_logic_vector (36 downto 0);
    signal peOR_uid75_fpExpEM1Test_in : std_logic_vector (28 downto 0);
    signal peOR_uid75_fpExpEM1Test_b : std_logic_vector (23 downto 0);
    signal peORExpInc_uid76_fpExpEM1Test_in : std_logic_vector (29 downto 0);
    signal peORExpInc_uid76_fpExpEM1Test_b : std_logic_vector (0 downto 0);
    signal pe2OR_uid131_fpExpEM1Test_in : std_logic_vector (29 downto 0);
    signal pe2OR_uid131_fpExpEM1Test_b : std_logic_vector (25 downto 0);
begin


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable(LOGICAL,903)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_a <= en;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q <= not ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_a;

	--ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_nor(LOGICAL,1005)
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_nor_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q;
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_nor_b <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_sticky_ena_q;
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_nor_q <= not (ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_nor_a or ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_nor_b);

	--ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_mem_top(CONSTANT,1001)
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_mem_top_q <= "011010";

	--ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmp(LOGICAL,1002)
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmp_a <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_mem_top_q;
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdmux_q);
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmp_q <= "1" when ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmp_a = ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmp_b else "0";

	--ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmpReg(REG,1003)
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmpReg_q <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_sticky_ena(REG,1006)
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_nor_q = "1") THEN
                ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_sticky_ena_q <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_enaAnd(LOGICAL,1007)
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_enaAnd_a <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_sticky_ena_q;
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_enaAnd_b <= en;
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_enaAnd_q <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_enaAnd_a and ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_enaAnd_b;

	--signX_uid7_fpExpEM1Test(BITSELECT,6)@0
    signX_uid7_fpExpEM1Test_in <= a;
    signX_uid7_fpExpEM1Test_b <= signX_uid7_fpExpEM1Test_in(31 downto 31);

	--ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_inputreg(DELAY,958)
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signX_uid7_fpExpEM1Test_b, xout => ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt(COUNTER,997)
    -- every=1, low=0, high=26, step=1, init=1
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_i = 25 THEN
                      ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_eq = '1') THEN
                        ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_i <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_i - 26;
                    ELSE
                        ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_i <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_i,5));


	--ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdreg(REG,998)
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdreg_q <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--xIn(GPIN,3)@0

	--ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdmux(MUX,999)
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdmux_s <= en;
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdmux: PROCESS (ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdmux_s, ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdreg_q, ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_q)
    BEGIN
            CASE ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdmux_s IS
                  WHEN "0" => ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdmux_q <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdreg_q;
                  WHEN "1" => ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdmux_q <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem(DUALMEM,996)
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_ia <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_inputreg_q;
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_aa <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdreg_q;
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_ab <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_rdmux_q;
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 27,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 27,
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
        clocken1 => ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_iq,
        address_a => ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_aa,
        data_a => ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_ia
    );
    ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_reset0 <= areset;
        ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_q <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_iq(0 downto 0);

	--cstAllOWE_uid17_fpExpEM1Test(CONSTANT,16)
    cstAllOWE_uid17_fpExpEM1Test_q <= "11111111";

	--ld_signX_uid7_fpExpEM1Test_b_to_addrPE2FusedClose_uid128_fpExpEM1Test_b(DELAY,555)@0
    ld_signX_uid7_fpExpEM1Test_b_to_addrPE2FusedClose_uid128_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 10 )
    PORT MAP ( xin => signX_uid7_fpExpEM1Test_b, xout => ld_signX_uid7_fpExpEM1Test_b_to_addrPE2FusedClose_uid128_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--GND(CONSTANT,0)
    GND_q <= "0";

	--expX_uid6_fpExpEM1Test(BITSELECT,5)@0
    expX_uid6_fpExpEM1Test_in <= a(30 downto 0);
    expX_uid6_fpExpEM1Test_b <= expX_uid6_fpExpEM1Test_in(30 downto 23);

	--frac_uid24_fpExpEM1Test(BITSELECT,23)@0
    frac_uid24_fpExpEM1Test_in <= a(22 downto 0);
    frac_uid24_fpExpEM1Test_b <= frac_uid24_fpExpEM1Test_in(22 downto 0);

	--expFracX_uid36_fpExpEM1Test(BITJOIN,35)@0
    expFracX_uid36_fpExpEM1Test_q <= expX_uid6_fpExpEM1Test_b & frac_uid24_fpExpEM1Test_b;

	--cstFPLogZpf_uid35_fpExpEM1Test(CONSTANT,34)
    cstFPLogZpf_uid35_fpExpEM1Test_q <= "00111111001100010111001000011000";

	--expFracCstLogZ5_uid37_fpExpEM1Test(BITSELECT,36)@0
    expFracCstLogZ5_uid37_fpExpEM1Test_in <= cstFPLogZpf_uid35_fpExpEM1Test_q(30 downto 0);
    expFracCstLogZ5_uid37_fpExpEM1Test_b <= expFracCstLogZ5_uid37_fpExpEM1Test_in(30 downto 0);

	--inCloseBranch_uid38_fpExpEM1Test(COMPARE,37)@0
    inCloseBranch_uid38_fpExpEM1Test_cin <= GND_q;
    inCloseBranch_uid38_fpExpEM1Test_a <= STD_LOGIC_VECTOR("00" & expFracCstLogZ5_uid37_fpExpEM1Test_b) & '0';
    inCloseBranch_uid38_fpExpEM1Test_b <= STD_LOGIC_VECTOR("00" & expFracX_uid36_fpExpEM1Test_q) & inCloseBranch_uid38_fpExpEM1Test_cin(0);
            inCloseBranch_uid38_fpExpEM1Test_o <= STD_LOGIC_VECTOR(UNSIGNED(inCloseBranch_uid38_fpExpEM1Test_a) - UNSIGNED(inCloseBranch_uid38_fpExpEM1Test_b));
    inCloseBranch_uid38_fpExpEM1Test_n(0) <= not inCloseBranch_uid38_fpExpEM1Test_o(33);


	--InvInCloseBranch_uid39_fpExpEM1Test(LOGICAL,38)@0
    InvInCloseBranch_uid39_fpExpEM1Test_a <= inCloseBranch_uid38_fpExpEM1Test_n;
    InvInCloseBranch_uid39_fpExpEM1Test_q <= not InvInCloseBranch_uid39_fpExpEM1Test_a;

	--oneSComplementOption_uid40_fpExpEM1Test(LOGICAL,39)@0
    oneSComplementOption_uid40_fpExpEM1Test_a <= signX_uid7_fpExpEM1Test_b;
    oneSComplementOption_uid40_fpExpEM1Test_b <= InvInCloseBranch_uid39_fpExpEM1Test_q;
    oneSComplementOption_uid40_fpExpEM1Test_q <= oneSComplementOption_uid40_fpExpEM1Test_a and oneSComplementOption_uid40_fpExpEM1Test_b;

	--ld_oneSComplementOption_uid40_fpExpEM1Test_q_to_onesCmpFxpIn_uid57_fpExpEM1Test_b(DELAY,476)@0
    ld_oneSComplementOption_uid40_fpExpEM1Test_q_to_onesCmpFxpIn_uid57_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => oneSComplementOption_uid40_fpExpEM1Test_q, xout => ld_oneSComplementOption_uid40_fpExpEM1Test_q_to_onesCmpFxpIn_uid57_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--reg_oneSComplementOption_uid40_fpExpEM1Test_0_to_fxpInExt_uid58_fpExpEM1Test_1(REG,378)@6
    reg_oneSComplementOption_uid40_fpExpEM1Test_0_to_fxpInExt_uid58_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oneSComplementOption_uid40_fpExpEM1Test_0_to_fxpInExt_uid58_fpExpEM1Test_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oneSComplementOption_uid40_fpExpEM1Test_0_to_fxpInExt_uid58_fpExpEM1Test_1_q <= ld_oneSComplementOption_uid40_fpExpEM1Test_q_to_onesCmpFxpIn_uid57_fpExpEM1Test_b_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_nor(LOGICAL,904)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_nor_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_nor_b <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_sticky_ena_q;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_nor_q <= not (ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_nor_a or ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_nor_b);

	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_mem_top(CONSTANT,900)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_mem_top_q <= "011";

	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmp(LOGICAL,901)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmp_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_mem_top_q;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdmux_q);
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmp_q <= "1" when ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmp_a = ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmp_b else "0";

	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmpReg(REG,902)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmpReg_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_sticky_ena(REG,905)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_nor_q = "1") THEN
                ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_sticky_ena_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_enaAnd(LOGICAL,906)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_enaAnd_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_sticky_ena_q;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_enaAnd_b <= en;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_enaAnd_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_enaAnd_a and ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_enaAnd_b;

	--oFracX_uid34_uid34_fpExpEM1Test(BITJOIN,33)@0
    oFracX_uid34_uid34_fpExpEM1Test_q <= VCC_q & frac_uid24_fpExpEM1Test_b;

	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_inputreg(DELAY,894)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => oFracX_uid34_uid34_fpExpEM1Test_q, xout => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdcnt(COUNTER,896)
    -- every=1, low=0, high=3, step=1, init=1
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdcnt_i <= TO_UNSIGNED(1,2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdcnt_i <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdcnt_i,2));


	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdreg(REG,897)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdreg_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdmux(MUX,898)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdmux_s <= en;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdmux: PROCESS (ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdmux_s, ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdreg_q, ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdcnt_q)
    BEGIN
            CASE ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdmux_s IS
                  WHEN "0" => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdmux_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdreg_q;
                  WHEN "1" => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdmux_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem(DUALMEM,895)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_ia <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_inputreg_q;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_aa <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdreg_q;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_ab <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_rdmux_q;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 24,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_iq,
        address_a => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_aa,
        data_a => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_ia
    );
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_reset0 <= areset;
        ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_iq(23 downto 0);

	--cstZeroWEP1_uid12_fpExpEM1Test(CONSTANT,11)
    cstZeroWEP1_uid12_fpExpEM1Test_q <= "000000000";

	--oFracXZwE_uid56_fpExpEM1Test(BITJOIN,55)@6
    oFracXZwE_uid56_fpExpEM1Test_q <= GND_q & ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_replace_mem_q & cstZeroWEP1_uid12_fpExpEM1Test_q;

	--onesCmpFxpIn_uid57_fpExpEM1Test(LOGICAL,56)@6
    onesCmpFxpIn_uid57_fpExpEM1Test_a <= oFracXZwE_uid56_fpExpEM1Test_q;
    onesCmpFxpIn_uid57_fpExpEM1Test_b <= STD_LOGIC_VECTOR((33 downto 1 => ld_oneSComplementOption_uid40_fpExpEM1Test_q_to_onesCmpFxpIn_uid57_fpExpEM1Test_b_q(0)) & ld_oneSComplementOption_uid40_fpExpEM1Test_q_to_onesCmpFxpIn_uid57_fpExpEM1Test_b_q);
    onesCmpFxpIn_uid57_fpExpEM1Test_q_i <= onesCmpFxpIn_uid57_fpExpEM1Test_a xor onesCmpFxpIn_uid57_fpExpEM1Test_b;
    onesCmpFxpIn_uid57_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 34, depth => 1)
    PORT MAP (xout => onesCmpFxpIn_uid57_fpExpEM1Test_q, xin => onesCmpFxpIn_uid57_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--fxpInExt_uid58_fpExpEM1Test(ADD,57)@7
    fxpInExt_uid58_fpExpEM1Test_a <= STD_LOGIC_VECTOR((35 downto 34 => onesCmpFxpIn_uid57_fpExpEM1Test_q(33)) & onesCmpFxpIn_uid57_fpExpEM1Test_q);
    fxpInExt_uid58_fpExpEM1Test_b <= STD_LOGIC_VECTOR('0' & "0000000000000000000000000000000000" & reg_oneSComplementOption_uid40_fpExpEM1Test_0_to_fxpInExt_uid58_fpExpEM1Test_1_q);
            fxpInExt_uid58_fpExpEM1Test_o <= STD_LOGIC_VECTOR(SIGNED(fxpInExt_uid58_fpExpEM1Test_a) + SIGNED(fxpInExt_uid58_fpExpEM1Test_b));
    fxpInExt_uid58_fpExpEM1Test_q <= fxpInExt_uid58_fpExpEM1Test_o(34 downto 0);


	--fxpInPreAlign_uid59_fpExpEM1Test(BITSELECT,58)@7
    fxpInPreAlign_uid59_fpExpEM1Test_in <= fxpInExt_uid58_fpExpEM1Test_q(33 downto 0);
    fxpInPreAlign_uid59_fpExpEM1Test_b <= fxpInPreAlign_uid59_fpExpEM1Test_in(33 downto 0);

	--msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test(BITSELECT,238)@7
    msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_in <= fxpInPreAlign_uid59_fpExpEM1Test_b;
    msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_in(33 downto 33);

	--ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_b(DELAY,734)@7
    ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b, xout => ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--z_uid225_fxpInPostAlign_uid53_fpExpEM1Test(CONSTANT,224)
    z_uid225_fxpInPostAlign_uid53_fpExpEM1Test_q <= "000";

	--rightShiftStage2Idx3Pad3_uid275_fxpInPostAlign_X_uid64_fpExpEM1Test(LOGICAL,274)@9
    rightShiftStage2Idx3Pad3_uid275_fxpInPostAlign_X_uid64_fpExpEM1Test_a <= z_uid225_fxpInPostAlign_uid53_fpExpEM1Test_q;
    rightShiftStage2Idx3Pad3_uid275_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= STD_LOGIC_VECTOR((2 downto 1 => ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q(0)) & ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q);
    rightShiftStage2Idx3Pad3_uid275_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i <= rightShiftStage2Idx3Pad3_uid275_fxpInPostAlign_X_uid64_fpExpEM1Test_a or rightShiftStage2Idx3Pad3_uid275_fxpInPostAlign_X_uid64_fpExpEM1Test_b;
    rightShiftStage2Idx3Pad3_uid275_fxpInPostAlign_X_uid64_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 3, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx3Pad3_uid275_fxpInPostAlign_X_uid64_fpExpEM1Test_q, xin => rightShiftStage2Idx3Pad3_uid275_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_b(DELAY,713)@7
    ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b, xout => ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--z_uid211_fxpInPostAlign_uid53_fpExpEM1Test(CONSTANT,210)
    z_uid211_fxpInPostAlign_uid53_fpExpEM1Test_q <= "000000000000";

	--rightShiftStage1Idx3Pad12_uid261_fxpInPostAlign_X_uid64_fpExpEM1Test(LOGICAL,260)@8
    rightShiftStage1Idx3Pad12_uid261_fxpInPostAlign_X_uid64_fpExpEM1Test_a <= z_uid211_fxpInPostAlign_uid53_fpExpEM1Test_q;
    rightShiftStage1Idx3Pad12_uid261_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= STD_LOGIC_VECTOR((11 downto 1 => ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q(0)) & ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q);
    rightShiftStage1Idx3Pad12_uid261_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i <= rightShiftStage1Idx3Pad12_uid261_fxpInPostAlign_X_uid64_fpExpEM1Test_a or rightShiftStage1Idx3Pad12_uid261_fxpInPostAlign_X_uid64_fpExpEM1Test_b;
    rightShiftStage1Idx3Pad12_uid261_fxpInPostAlign_X_uid64_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 12, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx3Pad12_uid261_fxpInPostAlign_X_uid64_fpExpEM1Test_q, xin => rightShiftStage1Idx3Pad12_uid261_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--rightShiftStage0Idx3_uid248_fxpInPostAlign_X_uid64_fpExpEM1Test(CONSTANT,247)
    rightShiftStage0Idx3_uid248_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= "0000000000000000000000000000000000";

	--rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test(LOGICAL,248)@7
    rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test_a <= rightShiftStage0Idx3_uid248_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
    rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= STD_LOGIC_VECTOR((33 downto 1 => msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b(0)) & msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b);
    rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i <= rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test_a or rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test_b;
    rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 34, depth => 1)
    PORT MAP (xout => rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test_q, xin => rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--z_uid195_fxpInPostAlign_uid53_fpExpEM1Test(CONSTANT,194)
    z_uid195_fxpInPostAlign_uid53_fpExpEM1Test_q <= "00000000000000000000000000000000";

	--rightShiftStage0Idx2Pad32_uid245_fxpInPostAlign_X_uid64_fpExpEM1Test(LOGICAL,244)@7
    rightShiftStage0Idx2Pad32_uid245_fxpInPostAlign_X_uid64_fpExpEM1Test_a <= z_uid195_fxpInPostAlign_uid53_fpExpEM1Test_q;
    rightShiftStage0Idx2Pad32_uid245_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= STD_LOGIC_VECTOR((31 downto 1 => msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b(0)) & msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b);
    rightShiftStage0Idx2Pad32_uid245_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage0Idx2Pad32_uid245_fxpInPostAlign_X_uid64_fpExpEM1Test_a or rightShiftStage0Idx2Pad32_uid245_fxpInPostAlign_X_uid64_fpExpEM1Test_b;

	--X33dto32_uid246_fxpInPostAlign_X_uid64_fpExpEM1Test(BITSELECT,245)@7
    X33dto32_uid246_fxpInPostAlign_X_uid64_fpExpEM1Test_in <= fxpInPreAlign_uid59_fpExpEM1Test_b;
    X33dto32_uid246_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= X33dto32_uid246_fxpInPostAlign_X_uid64_fpExpEM1Test_in(33 downto 32);

	--rightShiftStage0Idx2_uid247_fxpInPostAlign_X_uid64_fpExpEM1Test(BITJOIN,246)@7
    rightShiftStage0Idx2_uid247_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage0Idx2Pad32_uid245_fxpInPostAlign_X_uid64_fpExpEM1Test_q & X33dto32_uid246_fxpInPostAlign_X_uid64_fpExpEM1Test_b;

	--reg_rightShiftStage0Idx2_uid247_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_4(REG,382)@7
    reg_rightShiftStage0Idx2_uid247_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx2_uid247_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_4_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx2_uid247_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_4_q <= rightShiftStage0Idx2_uid247_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--z_uid191_fxpInPostAlign_uid53_fpExpEM1Test(CONSTANT,190)
    z_uid191_fxpInPostAlign_uid53_fpExpEM1Test_q <= "0000000000000000";

	--rightShiftStage0Idx1Pad16_uid241_fxpInPostAlign_X_uid64_fpExpEM1Test(LOGICAL,240)@7
    rightShiftStage0Idx1Pad16_uid241_fxpInPostAlign_X_uid64_fpExpEM1Test_a <= z_uid191_fxpInPostAlign_uid53_fpExpEM1Test_q;
    rightShiftStage0Idx1Pad16_uid241_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= STD_LOGIC_VECTOR((15 downto 1 => msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b(0)) & msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b);
    rightShiftStage0Idx1Pad16_uid241_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage0Idx1Pad16_uid241_fxpInPostAlign_X_uid64_fpExpEM1Test_a or rightShiftStage0Idx1Pad16_uid241_fxpInPostAlign_X_uid64_fpExpEM1Test_b;

	--X33dto16_uid242_fxpInPostAlign_X_uid64_fpExpEM1Test(BITSELECT,241)@7
    X33dto16_uid242_fxpInPostAlign_X_uid64_fpExpEM1Test_in <= fxpInPreAlign_uid59_fpExpEM1Test_b;
    X33dto16_uid242_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= X33dto16_uid242_fxpInPostAlign_X_uid64_fpExpEM1Test_in(33 downto 16);

	--rightShiftStage0Idx1_uid243_fxpInPostAlign_X_uid64_fpExpEM1Test(BITJOIN,242)@7
    rightShiftStage0Idx1_uid243_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage0Idx1Pad16_uid241_fxpInPostAlign_X_uid64_fpExpEM1Test_q & X33dto16_uid242_fxpInPostAlign_X_uid64_fpExpEM1Test_b;

	--reg_rightShiftStage0Idx1_uid243_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_3(REG,381)@7
    reg_rightShiftStage0Idx1_uid243_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx1_uid243_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_3_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx1_uid243_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_3_q <= rightShiftStage0Idx1_uid243_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_fxpInPreAlign_uid59_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_2(REG,380)@7
    reg_fxpInPreAlign_uid59_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpInPreAlign_uid59_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpInPreAlign_uid59_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q <= fxpInPreAlign_uid59_fpExpEM1Test_b;
            END IF;
        END IF;
    END PROCESS;


	--cstBiasPWE_uid16_fpExpEM1Test(CONSTANT,15)
    cstBiasPWE_uid16_fpExpEM1Test_q <= "100001";

	--ld_expX_uid6_fpExpEM1Test_b_to_shiftValuePreSat_uid48_fpExpEM1Test_b_inputreg(DELAY,893)
    ld_expX_uid6_fpExpEM1Test_b_to_shiftValuePreSat_uid48_fpExpEM1Test_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expX_uid6_fpExpEM1Test_b, xout => ld_expX_uid6_fpExpEM1Test_b_to_shiftValuePreSat_uid48_fpExpEM1Test_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expX_uid6_fpExpEM1Test_b_to_shiftValuePreSat_uid48_fpExpEM1Test_b(DELAY,467)@0
    ld_expX_uid6_fpExpEM1Test_b_to_shiftValuePreSat_uid48_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => ld_expX_uid6_fpExpEM1Test_b_to_shiftValuePreSat_uid48_fpExpEM1Test_b_inputreg_q, xout => ld_expX_uid6_fpExpEM1Test_b_to_shiftValuePreSat_uid48_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--cstBiasPWE_uid13_fpExpEM1Test(CONSTANT,12)
    cstBiasPWE_uid13_fpExpEM1Test_q <= "10000111";

	--shiftValuePreSat_uid48_fpExpEM1Test(SUB,47)@4
    shiftValuePreSat_uid48_fpExpEM1Test_a <= STD_LOGIC_VECTOR("0" & cstBiasPWE_uid13_fpExpEM1Test_q);
    shiftValuePreSat_uid48_fpExpEM1Test_b <= STD_LOGIC_VECTOR("0" & ld_expX_uid6_fpExpEM1Test_b_to_shiftValuePreSat_uid48_fpExpEM1Test_b_q);
            shiftValuePreSat_uid48_fpExpEM1Test_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValuePreSat_uid48_fpExpEM1Test_a) - UNSIGNED(shiftValuePreSat_uid48_fpExpEM1Test_b));
    shiftValuePreSat_uid48_fpExpEM1Test_q <= shiftValuePreSat_uid48_fpExpEM1Test_o(8 downto 0);


	--shiftValuePreSatRed_uid51_fpExpEM1Test(BITSELECT,50)@4
    shiftValuePreSatRed_uid51_fpExpEM1Test_in <= shiftValuePreSat_uid48_fpExpEM1Test_q(5 downto 0);
    shiftValuePreSatRed_uid51_fpExpEM1Test_b <= shiftValuePreSatRed_uid51_fpExpEM1Test_in(5 downto 0);

	--ld_shiftValuePreSatRed_uid51_fpExpEM1Test_b_to_shiftVal_uid52_fpExpEM1Test_c(DELAY,472)@4
    ld_shiftValuePreSatRed_uid51_fpExpEM1Test_b_to_shiftVal_uid52_fpExpEM1Test_c : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => shiftValuePreSatRed_uid51_fpExpEM1Test_b, xout => ld_shiftValuePreSatRed_uid51_fpExpEM1Test_b_to_shiftVal_uid52_fpExpEM1Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_shiftValuePreSat_uid48_fpExpEM1Test_0_to_shiftUdf_uid50_fpExpEM1Test_0(REG,362)@4
    reg_shiftValuePreSat_uid48_fpExpEM1Test_0_to_shiftUdf_uid50_fpExpEM1Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_shiftValuePreSat_uid48_fpExpEM1Test_0_to_shiftUdf_uid50_fpExpEM1Test_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_shiftValuePreSat_uid48_fpExpEM1Test_0_to_shiftUdf_uid50_fpExpEM1Test_0_q <= shiftValuePreSat_uid48_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--shiftUdf_uid50_fpExpEM1Test(COMPARE,49)@5
    shiftUdf_uid50_fpExpEM1Test_cin <= GND_q;
    shiftUdf_uid50_fpExpEM1Test_a <= STD_LOGIC_VECTOR((10 downto 9 => reg_shiftValuePreSat_uid48_fpExpEM1Test_0_to_shiftUdf_uid50_fpExpEM1Test_0_q(8)) & reg_shiftValuePreSat_uid48_fpExpEM1Test_0_to_shiftUdf_uid50_fpExpEM1Test_0_q) & '0';
    shiftUdf_uid50_fpExpEM1Test_b <= STD_LOGIC_VECTOR('0' & "0000" & cstBiasPWE_uid16_fpExpEM1Test_q) & shiftUdf_uid50_fpExpEM1Test_cin(0);
            shiftUdf_uid50_fpExpEM1Test_o <= STD_LOGIC_VECTOR(SIGNED(shiftUdf_uid50_fpExpEM1Test_a) - SIGNED(shiftUdf_uid50_fpExpEM1Test_b));
    shiftUdf_uid50_fpExpEM1Test_n(0) <= not shiftUdf_uid50_fpExpEM1Test_o(11);


	--shiftVal_uid52_fpExpEM1Test(MUX,51)@5
    shiftVal_uid52_fpExpEM1Test_s <= shiftUdf_uid50_fpExpEM1Test_n;
    shiftVal_uid52_fpExpEM1Test: PROCESS (shiftVal_uid52_fpExpEM1Test_s, en, ld_shiftValuePreSatRed_uid51_fpExpEM1Test_b_to_shiftVal_uid52_fpExpEM1Test_c_q, cstBiasPWE_uid16_fpExpEM1Test_q)
    BEGIN
            CASE shiftVal_uid52_fpExpEM1Test_s IS
                  WHEN "0" => shiftVal_uid52_fpExpEM1Test_q <= ld_shiftValuePreSatRed_uid51_fpExpEM1Test_b_to_shiftVal_uid52_fpExpEM1Test_c_q;
                  WHEN "1" => shiftVal_uid52_fpExpEM1Test_q <= cstBiasPWE_uid16_fpExpEM1Test_q;
                  WHEN OTHERS => shiftVal_uid52_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test(BITSELECT,200)@5
    rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_in <= shiftVal_uid52_fpExpEM1Test_q;
    rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_b <= rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_in(5 downto 4);

	--ld_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_1_a(DELAY,838)@5
    ld_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 2 )
    PORT MAP ( xin => rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_b, xout => ld_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_1(REG,379)@7
    reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q <= ld_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test(MUX,250)@8
    rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_s <= reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q;
    rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test: PROCESS (rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_s, en, reg_fxpInPreAlign_uid59_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q, reg_rightShiftStage0Idx1_uid243_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_3_q, reg_rightShiftStage0Idx2_uid247_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_4_q, rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test_q)
    BEGIN
            CASE rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_s IS
                  WHEN "00" => rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= reg_fxpInPreAlign_uid59_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q;
                  WHEN "01" => rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= reg_rightShiftStage0Idx1_uid243_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_3_q;
                  WHEN "10" => rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= reg_rightShiftStage0Idx2_uid247_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_4_q;
                  WHEN "11" => rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage0Idx3_uid249_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
                  WHEN OTHERS => rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage033dto12_uid262_fxpInPostAlign_X_uid64_fpExpEM1Test(BITSELECT,261)@8
    RightShiftStage033dto12_uid262_fxpInPostAlign_X_uid64_fpExpEM1Test_in <= rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
    RightShiftStage033dto12_uid262_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= RightShiftStage033dto12_uid262_fxpInPostAlign_X_uid64_fpExpEM1Test_in(33 downto 12);

	--ld_RightShiftStage033dto12_uid262_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid263_fxpInPostAlign_X_uid64_fpExpEM1Test_a(DELAY,723)@8
    ld_RightShiftStage033dto12_uid262_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid263_fxpInPostAlign_X_uid64_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 22, depth => 1 )
    PORT MAP ( xin => RightShiftStage033dto12_uid262_fxpInPostAlign_X_uid64_fpExpEM1Test_b, xout => ld_RightShiftStage033dto12_uid262_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid263_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid263_fxpInPostAlign_X_uid64_fpExpEM1Test(BITJOIN,262)@9
    rightShiftStage1Idx3_uid263_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage1Idx3Pad12_uid261_fxpInPostAlign_X_uid64_fpExpEM1Test_q & ld_RightShiftStage033dto12_uid262_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid263_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q;

	--rightShiftStage1Idx2Pad8_uid257_fxpInPostAlign_X_uid64_fpExpEM1Test(LOGICAL,256)@8
    rightShiftStage1Idx2Pad8_uid257_fxpInPostAlign_X_uid64_fpExpEM1Test_a <= cstZeroWE_uid11_fpExpEM1Test_q;
    rightShiftStage1Idx2Pad8_uid257_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= STD_LOGIC_VECTOR((7 downto 1 => ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q(0)) & ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q);
    rightShiftStage1Idx2Pad8_uid257_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i <= rightShiftStage1Idx2Pad8_uid257_fxpInPostAlign_X_uid64_fpExpEM1Test_a or rightShiftStage1Idx2Pad8_uid257_fxpInPostAlign_X_uid64_fpExpEM1Test_b;
    rightShiftStage1Idx2Pad8_uid257_fxpInPostAlign_X_uid64_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 8, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx2Pad8_uid257_fxpInPostAlign_X_uid64_fpExpEM1Test_q, xin => rightShiftStage1Idx2Pad8_uid257_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage033dto8_uid258_fxpInPostAlign_X_uid64_fpExpEM1Test(BITSELECT,257)@8
    RightShiftStage033dto8_uid258_fxpInPostAlign_X_uid64_fpExpEM1Test_in <= rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
    RightShiftStage033dto8_uid258_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= RightShiftStage033dto8_uid258_fxpInPostAlign_X_uid64_fpExpEM1Test_in(33 downto 8);

	--ld_RightShiftStage033dto8_uid258_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid259_fxpInPostAlign_X_uid64_fpExpEM1Test_a(DELAY,719)@8
    ld_RightShiftStage033dto8_uid258_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid259_fxpInPostAlign_X_uid64_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => RightShiftStage033dto8_uid258_fxpInPostAlign_X_uid64_fpExpEM1Test_b, xout => ld_RightShiftStage033dto8_uid258_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid259_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid259_fxpInPostAlign_X_uid64_fpExpEM1Test(BITJOIN,258)@9
    rightShiftStage1Idx2_uid259_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage1Idx2Pad8_uid257_fxpInPostAlign_X_uid64_fpExpEM1Test_q & ld_RightShiftStage033dto8_uid258_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid259_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q;

	--z_uid203_fxpInPostAlign_uid53_fpExpEM1Test(CONSTANT,202)
    z_uid203_fxpInPostAlign_uid53_fpExpEM1Test_q <= "0000";

	--rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test(LOGICAL,252)@8
    rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_a <= z_uid203_fxpInPostAlign_uid53_fpExpEM1Test_q;
    rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= STD_LOGIC_VECTOR((3 downto 1 => ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q(0)) & ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q);
    rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i <= rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_a or rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_b;
    rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 4, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_q, xin => rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage033dto4_uid254_fxpInPostAlign_X_uid64_fpExpEM1Test(BITSELECT,253)@8
    RightShiftStage033dto4_uid254_fxpInPostAlign_X_uid64_fpExpEM1Test_in <= rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
    RightShiftStage033dto4_uid254_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= RightShiftStage033dto4_uid254_fxpInPostAlign_X_uid64_fpExpEM1Test_in(33 downto 4);

	--ld_RightShiftStage033dto4_uid254_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid255_fxpInPostAlign_X_uid64_fpExpEM1Test_a(DELAY,715)@8
    ld_RightShiftStage033dto4_uid254_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid255_fxpInPostAlign_X_uid64_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 30, depth => 1 )
    PORT MAP ( xin => RightShiftStage033dto4_uid254_fxpInPostAlign_X_uid64_fpExpEM1Test_b, xout => ld_RightShiftStage033dto4_uid254_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid255_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid255_fxpInPostAlign_X_uid64_fpExpEM1Test(BITJOIN,254)@9
    rightShiftStage1Idx1_uid255_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage1Idx1Pad4_uid253_fxpInPostAlign_X_uid64_fpExpEM1Test_q & ld_RightShiftStage033dto4_uid254_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid255_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q;

	--reg_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_2(REG,384)@8
    reg_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q <= rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test(BITSELECT,214)@5
    rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_in <= shiftVal_uid52_fpExpEM1Test_q(3 downto 0);
    rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_b <= rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_in(3 downto 2);

	--reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_1(REG,383)@5
    reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q <= rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_b(DELAY,725)@6
    ld_reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 3 )
    PORT MAP ( xin => reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q, xout => ld_reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test(MUX,264)@9
    rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_s <= ld_reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q;
    rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test: PROCESS (rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_s, en, reg_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q, rightShiftStage1Idx1_uid255_fxpInPostAlign_X_uid64_fpExpEM1Test_q, rightShiftStage1Idx2_uid259_fxpInPostAlign_X_uid64_fpExpEM1Test_q, rightShiftStage1Idx3_uid263_fxpInPostAlign_X_uid64_fpExpEM1Test_q)
    BEGIN
            CASE rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_s IS
                  WHEN "00" => rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= reg_rightShiftStage0_uid251_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q;
                  WHEN "01" => rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage1Idx1_uid255_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
                  WHEN "10" => rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage1Idx2_uid259_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
                  WHEN "11" => rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage1Idx3_uid263_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
                  WHEN OTHERS => rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage133dto3_uid276_fxpInPostAlign_X_uid64_fpExpEM1Test(BITSELECT,275)@9
    RightShiftStage133dto3_uid276_fxpInPostAlign_X_uid64_fpExpEM1Test_in <= rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
    RightShiftStage133dto3_uid276_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= RightShiftStage133dto3_uid276_fxpInPostAlign_X_uid64_fpExpEM1Test_in(33 downto 3);

	--ld_RightShiftStage133dto3_uid276_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx3_uid277_fxpInPostAlign_X_uid64_fpExpEM1Test_a(DELAY,740)@9
    ld_RightShiftStage133dto3_uid276_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx3_uid277_fxpInPostAlign_X_uid64_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 31, depth => 1 )
    PORT MAP ( xin => RightShiftStage133dto3_uid276_fxpInPostAlign_X_uid64_fpExpEM1Test_b, xout => ld_RightShiftStage133dto3_uid276_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx3_uid277_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx3_uid277_fxpInPostAlign_X_uid64_fpExpEM1Test(BITJOIN,276)@10
    rightShiftStage2Idx3_uid277_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage2Idx3Pad3_uid275_fxpInPostAlign_X_uid64_fpExpEM1Test_q & ld_RightShiftStage133dto3_uid276_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx3_uid277_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q;

	--z_uid221_fxpInPostAlign_uid53_fpExpEM1Test(CONSTANT,220)
    z_uid221_fxpInPostAlign_uid53_fpExpEM1Test_q <= "00";

	--rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test(LOGICAL,270)@9
    rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_a <= z_uid221_fxpInPostAlign_uid53_fpExpEM1Test_q;
    rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= STD_LOGIC_VECTOR((1 downto 1 => ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q(0)) & ld_msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q);
    rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i <= rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_a or rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_b;
    rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 2, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_q, xin => rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage133dto2_uid272_fxpInPostAlign_X_uid64_fpExpEM1Test(BITSELECT,271)@9
    RightShiftStage133dto2_uid272_fxpInPostAlign_X_uid64_fpExpEM1Test_in <= rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
    RightShiftStage133dto2_uid272_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= RightShiftStage133dto2_uid272_fxpInPostAlign_X_uid64_fpExpEM1Test_in(33 downto 2);

	--ld_RightShiftStage133dto2_uid272_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx2_uid273_fxpInPostAlign_X_uid64_fpExpEM1Test_a(DELAY,736)@9
    ld_RightShiftStage133dto2_uid272_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx2_uid273_fxpInPostAlign_X_uid64_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => RightShiftStage133dto2_uid272_fxpInPostAlign_X_uid64_fpExpEM1Test_b, xout => ld_RightShiftStage133dto2_uid272_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx2_uid273_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx2_uid273_fxpInPostAlign_X_uid64_fpExpEM1Test(BITJOIN,272)@10
    rightShiftStage2Idx2_uid273_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage2Idx2Pad2_uid271_fxpInPostAlign_X_uid64_fpExpEM1Test_q & ld_RightShiftStage133dto2_uid272_fxpInPostAlign_X_uid64_fpExpEM1Test_b_to_rightShiftStage2Idx2_uid273_fxpInPostAlign_X_uid64_fpExpEM1Test_a_q;

	--rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test(LOGICAL,266)@7
    rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_a <= GND_q;
    rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= msbx_uid239_fxpInPostAlign_X_uid64_fpExpEM1Test_b;
    rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i <= rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_a or rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_b;
    rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_q, xin => rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_q_to_rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test_b(DELAY,733)@8
    ld_rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_q_to_rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_q, xout => ld_rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_q_to_rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--RightShiftStage133dto1_uid268_fxpInPostAlign_X_uid64_fpExpEM1Test(BITSELECT,267)@9
    RightShiftStage133dto1_uid268_fxpInPostAlign_X_uid64_fpExpEM1Test_in <= rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
    RightShiftStage133dto1_uid268_fxpInPostAlign_X_uid64_fpExpEM1Test_b <= RightShiftStage133dto1_uid268_fxpInPostAlign_X_uid64_fpExpEM1Test_in(33 downto 1);

	--rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test(BITJOIN,268)@9
    rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= ld_rightShiftStage2Idx1Pad1_uid267_fxpInPostAlign_X_uid64_fpExpEM1Test_q_to_rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test_b_q & RightShiftStage133dto1_uid268_fxpInPostAlign_X_uid64_fpExpEM1Test_b;

	--ld_rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test_q_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_d(DELAY,744)@9
    ld_rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test_q_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_d : dspba_delay
    GENERIC MAP ( width => 34, depth => 1 )
    PORT MAP ( xin => rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test_q, xout => ld_rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test_q_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_d_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_2(REG,386)@9
    reg_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q <= rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test(BITSELECT,228)@5
    rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_in <= shiftVal_uid52_fpExpEM1Test_q(1 downto 0);
    rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_b <= rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_in(1 downto 0);

	--ld_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_1_a(DELAY,844)@5
    ld_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 4 )
    PORT MAP ( xin => rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_b, xout => ld_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_1(REG,385)@9
    reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q <= ld_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test(MUX,278)@10
    rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_s <= reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_1_q;
    rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test: PROCESS (rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_s, en, reg_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q, ld_rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test_q_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_d_q, rightShiftStage2Idx2_uid273_fxpInPostAlign_X_uid64_fpExpEM1Test_q, rightShiftStage2Idx3_uid277_fxpInPostAlign_X_uid64_fpExpEM1Test_q)
    BEGIN
            CASE rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_s IS
                  WHEN "00" => rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= reg_rightShiftStage1_uid265_fxpInPostAlign_X_uid64_fpExpEM1Test_0_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_2_q;
                  WHEN "01" => rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= ld_rightShiftStage2Idx1_uid269_fxpInPostAlign_X_uid64_fpExpEM1Test_q_to_rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_d_q;
                  WHEN "10" => rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage2Idx2_uid273_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
                  WHEN "11" => rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= rightShiftStage2Idx3_uid277_fxpInPostAlign_X_uid64_fpExpEM1Test_q;
                  WHEN OTHERS => rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--yBranchClose_uid125_fpExpEM1Test(BITSELECT,124)@10
    yBranchClose_uid125_fpExpEM1Test_in <= rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_q(23 downto 0);
    yBranchClose_uid125_fpExpEM1Test_b <= yBranchClose_uid125_fpExpEM1Test_in(23 downto 0);

	--addrPE2_uid127_fpExpEM1Test(BITSELECT,126)@10
    addrPE2_uid127_fpExpEM1Test_in <= yBranchClose_uid125_fpExpEM1Test_b;
    addrPE2_uid127_fpExpEM1Test_b <= addrPE2_uid127_fpExpEM1Test_in(23 downto 17);

	--addrPE2FusedClose_uid128_fpExpEM1Test(BITJOIN,127)@10
    addrPE2FusedClose_uid128_fpExpEM1Test_q <= ld_signX_uid7_fpExpEM1Test_b_to_addrPE2FusedClose_uid128_fpExpEM1Test_b_q & addrPE2_uid127_fpExpEM1Test_b;

	--reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC2_uid333_expm1PE2TabGen_lutmem_0(REG,419)@10
    reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC2_uid333_expm1PE2TabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC2_uid333_expm1PE2TabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC2_uid333_expm1PE2TabGen_lutmem_0_q <= addrPE2FusedClose_uid128_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid333_expm1PE2TabGen_lutmem(DUALMEM,361)@11
    memoryC2_uid333_expm1PE2TabGen_lutmem_ia <= (others => '0');
    memoryC2_uid333_expm1PE2TabGen_lutmem_aa <= (others => '0');
    memoryC2_uid333_expm1PE2TabGen_lutmem_ab <= reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC2_uid333_expm1PE2TabGen_lutmem_0_q;
    memoryC2_uid333_expm1PE2TabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_expm1_s5_memoryC2_uid333_expm1PE2TabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid333_expm1PE2TabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid333_expm1PE2TabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid333_expm1PE2TabGen_lutmem_iq,
        address_a => memoryC2_uid333_expm1PE2TabGen_lutmem_aa,
        data_a => memoryC2_uid333_expm1PE2TabGen_lutmem_ia
    );
    memoryC2_uid333_expm1PE2TabGen_lutmem_reset0 <= areset;
        memoryC2_uid333_expm1PE2TabGen_lutmem_q <= memoryC2_uid333_expm1PE2TabGen_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid333_expm1PE2TabGen_lutmem_0_to_prodXY_uid354_pT1_uid336_expm1PE2PolyEval_1(REG,421)@13
    reg_memoryC2_uid333_expm1PE2TabGen_lutmem_0_to_prodXY_uid354_pT1_uid336_expm1PE2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid333_expm1PE2TabGen_lutmem_0_to_prodXY_uid354_pT1_uid336_expm1PE2PolyEval_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid333_expm1PE2TabGen_lutmem_0_to_prodXY_uid354_pT1_uid336_expm1PE2PolyEval_1_q <= memoryC2_uid333_expm1PE2TabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yBranchClose_uid125_fpExpEM1Test_b_to_yPPolyEval2_uid129_fpExpEM1Test_a_inputreg(DELAY,944)
    ld_yBranchClose_uid125_fpExpEM1Test_b_to_yPPolyEval2_uid129_fpExpEM1Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => yBranchClose_uid125_fpExpEM1Test_b, xout => ld_yBranchClose_uid125_fpExpEM1Test_b_to_yPPolyEval2_uid129_fpExpEM1Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yBranchClose_uid125_fpExpEM1Test_b_to_yPPolyEval2_uid129_fpExpEM1Test_a(DELAY,556)@10
    ld_yBranchClose_uid125_fpExpEM1Test_b_to_yPPolyEval2_uid129_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => ld_yBranchClose_uid125_fpExpEM1Test_b_to_yPPolyEval2_uid129_fpExpEM1Test_a_inputreg_q, xout => ld_yBranchClose_uid125_fpExpEM1Test_b_to_yPPolyEval2_uid129_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--yPPolyEval2_uid129_fpExpEM1Test(BITSELECT,128)@13
    yPPolyEval2_uid129_fpExpEM1Test_in <= ld_yBranchClose_uid125_fpExpEM1Test_b_to_yPPolyEval2_uid129_fpExpEM1Test_a_q(16 downto 0);
    yPPolyEval2_uid129_fpExpEM1Test_b <= yPPolyEval2_uid129_fpExpEM1Test_in(16 downto 0);

	--yT1_uid335_expm1PE2PolyEval(BITSELECT,334)@13
    yT1_uid335_expm1PE2PolyEval_in <= yPPolyEval2_uid129_fpExpEM1Test_b;
    yT1_uid335_expm1PE2PolyEval_b <= yT1_uid335_expm1PE2PolyEval_in(16 downto 5);

	--reg_yT1_uid335_expm1PE2PolyEval_0_to_prodXY_uid354_pT1_uid336_expm1PE2PolyEval_0(REG,420)@13
    reg_yT1_uid335_expm1PE2PolyEval_0_to_prodXY_uid354_pT1_uid336_expm1PE2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid335_expm1PE2PolyEval_0_to_prodXY_uid354_pT1_uid336_expm1PE2PolyEval_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid335_expm1PE2PolyEval_0_to_prodXY_uid354_pT1_uid336_expm1PE2PolyEval_0_q <= yT1_uid335_expm1PE2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid354_pT1_uid336_expm1PE2PolyEval(MULT,353)@14
    prodXY_uid354_pT1_uid336_expm1PE2PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid354_pT1_uid336_expm1PE2PolyEval_a),13)) * SIGNED(prodXY_uid354_pT1_uid336_expm1PE2PolyEval_b);
    prodXY_uid354_pT1_uid336_expm1PE2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid354_pT1_uid336_expm1PE2PolyEval_a <= (others => '0');
            prodXY_uid354_pT1_uid336_expm1PE2PolyEval_b <= (others => '0');
            prodXY_uid354_pT1_uid336_expm1PE2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid354_pT1_uid336_expm1PE2PolyEval_a <= reg_yT1_uid335_expm1PE2PolyEval_0_to_prodXY_uid354_pT1_uid336_expm1PE2PolyEval_0_q;
                prodXY_uid354_pT1_uid336_expm1PE2PolyEval_b <= reg_memoryC2_uid333_expm1PE2TabGen_lutmem_0_to_prodXY_uid354_pT1_uid336_expm1PE2PolyEval_1_q;
                prodXY_uid354_pT1_uid336_expm1PE2PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid354_pT1_uid336_expm1PE2PolyEval_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid354_pT1_uid336_expm1PE2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid354_pT1_uid336_expm1PE2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid354_pT1_uid336_expm1PE2PolyEval_q <= prodXY_uid354_pT1_uid336_expm1PE2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid355_pT1_uid336_expm1PE2PolyEval(BITSELECT,354)@17
    prodXYTruncFR_uid355_pT1_uid336_expm1PE2PolyEval_in <= prodXY_uid354_pT1_uid336_expm1PE2PolyEval_q;
    prodXYTruncFR_uid355_pT1_uid336_expm1PE2PolyEval_b <= prodXYTruncFR_uid355_pT1_uid336_expm1PE2PolyEval_in(23 downto 11);

	--highBBits_uid338_expm1PE2PolyEval(BITSELECT,337)@17
    highBBits_uid338_expm1PE2PolyEval_in <= prodXYTruncFR_uid355_pT1_uid336_expm1PE2PolyEval_b;
    highBBits_uid338_expm1PE2PolyEval_b <= highBBits_uid338_expm1PE2PolyEval_in(12 downto 1);

	--ld_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC1_uid331_expm1PE2TabGen_lutmem_0_q_to_memoryC1_uid331_expm1PE2TabGen_lutmem_a(DELAY,819)@11
    ld_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC1_uid331_expm1PE2TabGen_lutmem_0_q_to_memoryC1_uid331_expm1PE2TabGen_lutmem_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC2_uid333_expm1PE2TabGen_lutmem_0_q, xout => ld_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC1_uid331_expm1PE2TabGen_lutmem_0_q_to_memoryC1_uid331_expm1PE2TabGen_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid331_expm1PE2TabGen_lutmem(DUALMEM,360)@14
    memoryC1_uid331_expm1PE2TabGen_lutmem_ia <= (others => '0');
    memoryC1_uid331_expm1PE2TabGen_lutmem_aa <= (others => '0');
    memoryC1_uid331_expm1PE2TabGen_lutmem_ab <= ld_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC1_uid331_expm1PE2TabGen_lutmem_0_q_to_memoryC1_uid331_expm1PE2TabGen_lutmem_a_q;
    memoryC1_uid331_expm1PE2TabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 20,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 20,
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
        init_file => "fp_expm1_s5_memoryC1_uid331_expm1PE2TabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid331_expm1PE2TabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid331_expm1PE2TabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid331_expm1PE2TabGen_lutmem_iq,
        address_a => memoryC1_uid331_expm1PE2TabGen_lutmem_aa,
        data_a => memoryC1_uid331_expm1PE2TabGen_lutmem_ia
    );
    memoryC1_uid331_expm1PE2TabGen_lutmem_reset0 <= areset;
        memoryC1_uid331_expm1PE2TabGen_lutmem_q <= memoryC1_uid331_expm1PE2TabGen_lutmem_iq(19 downto 0);

	--reg_memoryC1_uid331_expm1PE2TabGen_lutmem_0_to_sumAHighB_uid339_expm1PE2PolyEval_0(REG,423)@16
    reg_memoryC1_uid331_expm1PE2TabGen_lutmem_0_to_sumAHighB_uid339_expm1PE2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid331_expm1PE2TabGen_lutmem_0_to_sumAHighB_uid339_expm1PE2PolyEval_0_q <= "00000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid331_expm1PE2TabGen_lutmem_0_to_sumAHighB_uid339_expm1PE2PolyEval_0_q <= memoryC1_uid331_expm1PE2TabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid339_expm1PE2PolyEval(ADD,338)@17
    sumAHighB_uid339_expm1PE2PolyEval_a <= STD_LOGIC_VECTOR((20 downto 20 => reg_memoryC1_uid331_expm1PE2TabGen_lutmem_0_to_sumAHighB_uid339_expm1PE2PolyEval_0_q(19)) & reg_memoryC1_uid331_expm1PE2TabGen_lutmem_0_to_sumAHighB_uid339_expm1PE2PolyEval_0_q);
    sumAHighB_uid339_expm1PE2PolyEval_b <= STD_LOGIC_VECTOR((20 downto 12 => highBBits_uid338_expm1PE2PolyEval_b(11)) & highBBits_uid338_expm1PE2PolyEval_b);
            sumAHighB_uid339_expm1PE2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid339_expm1PE2PolyEval_a) + SIGNED(sumAHighB_uid339_expm1PE2PolyEval_b));
    sumAHighB_uid339_expm1PE2PolyEval_q <= sumAHighB_uid339_expm1PE2PolyEval_o(20 downto 0);


	--lowRangeB_uid337_expm1PE2PolyEval(BITSELECT,336)@17
    lowRangeB_uid337_expm1PE2PolyEval_in <= prodXYTruncFR_uid355_pT1_uid336_expm1PE2PolyEval_b(0 downto 0);
    lowRangeB_uid337_expm1PE2PolyEval_b <= lowRangeB_uid337_expm1PE2PolyEval_in(0 downto 0);

	--s1_uid337_uid340_expm1PE2PolyEval(BITJOIN,339)@17
    s1_uid337_uid340_expm1PE2PolyEval_q <= sumAHighB_uid339_expm1PE2PolyEval_q & lowRangeB_uid337_expm1PE2PolyEval_b;

	--reg_s1_uid337_uid340_expm1PE2PolyEval_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_1(REG,425)@17
    reg_s1_uid337_uid340_expm1PE2PolyEval_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid337_uid340_expm1PE2PolyEval_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_1_q <= "0000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid337_uid340_expm1PE2PolyEval_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_1_q <= s1_uid337_uid340_expm1PE2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_nor(LOGICAL,1040)
    ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_nor_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q;
    ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_nor_b <= ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_sticky_ena_q;
    ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_nor_q <= not (ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_nor_a or ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_nor_b);

	--ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_cmpReg(REG,926)
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_sticky_ena(REG,1041)
    ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_nor_q = "1") THEN
                ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_sticky_ena_q <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_enaAnd(LOGICAL,1042)
    ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_enaAnd_a <= ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_sticky_ena_q;
    ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_enaAnd_b <= en;
    ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_enaAnd_q <= ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_enaAnd_a and ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_enaAnd_b;

	--ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_inputreg(DELAY,1032)
    ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => yPPolyEval2_uid129_fpExpEM1Test_b, xout => ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdcnt(COUNTER,922)
    -- every=1, low=0, high=1, step=1, init=1
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdcnt_i <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdcnt_i,1));


	--ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdreg(REG,923)
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdreg_q <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdmux(MUX,924)
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdmux_s <= en;
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdmux: PROCESS (ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdmux_s, ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdreg_q, ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdcnt_q)
    BEGIN
            CASE ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdmux_s IS
                  WHEN "0" => ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdmux_q <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdreg_q;
                  WHEN "1" => ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdmux_q <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem(DUALMEM,1033)
    ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_ia <= ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_inputreg_q;
    ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_aa <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdreg_q;
    ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_ab <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdmux_q;
    ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 17,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 17,
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
        clocken1 => ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_iq,
        address_a => ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_aa,
        data_a => ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_ia
    );
    ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_reset0 <= areset;
        ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_q <= ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_iq(16 downto 0);

	--reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0(REG,424)@17
    reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_q <= ld_yPPolyEval2_uid129_fpExpEM1Test_b_to_reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid357_pT2_uid342_expm1PE2PolyEval(MULT,356)@18
    prodXY_uid357_pT2_uid342_expm1PE2PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid357_pT2_uid342_expm1PE2PolyEval_a),18)) * SIGNED(prodXY_uid357_pT2_uid342_expm1PE2PolyEval_b);
    prodXY_uid357_pT2_uid342_expm1PE2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid357_pT2_uid342_expm1PE2PolyEval_a <= (others => '0');
            prodXY_uid357_pT2_uid342_expm1PE2PolyEval_b <= (others => '0');
            prodXY_uid357_pT2_uid342_expm1PE2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid357_pT2_uid342_expm1PE2PolyEval_a <= reg_yPPolyEval2_uid129_fpExpEM1Test_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_0_q;
                prodXY_uid357_pT2_uid342_expm1PE2PolyEval_b <= reg_s1_uid337_uid340_expm1PE2PolyEval_0_to_prodXY_uid357_pT2_uid342_expm1PE2PolyEval_1_q;
                prodXY_uid357_pT2_uid342_expm1PE2PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid357_pT2_uid342_expm1PE2PolyEval_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid357_pT2_uid342_expm1PE2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid357_pT2_uid342_expm1PE2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid357_pT2_uid342_expm1PE2PolyEval_q <= prodXY_uid357_pT2_uid342_expm1PE2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid358_pT2_uid342_expm1PE2PolyEval(BITSELECT,357)@21
    prodXYTruncFR_uid358_pT2_uid342_expm1PE2PolyEval_in <= prodXY_uid357_pT2_uid342_expm1PE2PolyEval_q;
    prodXYTruncFR_uid358_pT2_uid342_expm1PE2PolyEval_b <= prodXYTruncFR_uid358_pT2_uid342_expm1PE2PolyEval_in(38 downto 16);

	--highBBits_uid344_expm1PE2PolyEval(BITSELECT,343)@21
    highBBits_uid344_expm1PE2PolyEval_in <= prodXYTruncFR_uid358_pT2_uid342_expm1PE2PolyEval_b;
    highBBits_uid344_expm1PE2PolyEval_b <= highBBits_uid344_expm1PE2PolyEval_in(22 downto 2);

	--ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_nor(LOGICAL,1053)
    ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_nor_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q;
    ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_nor_b <= ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_sticky_ena_q;
    ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_nor_q <= not (ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_nor_a or ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_nor_b);

	--ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_mem_top(CONSTANT,1025)
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_mem_top_q <= "0100";

	--ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmp(LOGICAL,1026)
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmp_a <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_mem_top_q;
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdmux_q);
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmp_q <= "1" when ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmp_a = ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmp_b else "0";

	--ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmpReg(REG,1027)
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmpReg_q <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_sticky_ena(REG,1054)
    ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_nor_q = "1") THEN
                ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_sticky_ena_q <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_enaAnd(LOGICAL,1055)
    ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_enaAnd_a <= ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_sticky_ena_q;
    ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_enaAnd_b <= en;
    ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_enaAnd_q <= ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_enaAnd_a and ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_enaAnd_b;

	--ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_inputreg(DELAY,1043)
    ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => addrPE2FusedClose_uid128_fpExpEM1Test_q, xout => ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt(COUNTER,1021)
    -- every=1, low=0, high=4, step=1, init=1
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_i = 3 THEN
                      ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_eq = '1') THEN
                        ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_i <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_i <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_i,3));


	--ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdreg(REG,1022)
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdreg_q <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdmux(MUX,1023)
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdmux_s <= en;
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdmux: PROCESS (ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdmux_s, ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdreg_q, ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdmux_q <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdreg_q;
                  WHEN "1" => ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdmux_q <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem(DUALMEM,1044)
    ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_ia <= ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_inputreg_q;
    ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_aa <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdreg_q;
    ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_ab <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdmux_q;
    ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_iq,
        address_a => ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_aa,
        data_a => ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_ia
    );
    ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_q <= ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0(REG,426)@17
    reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_q <= ld_addrPE2FusedClose_uid128_fpExpEM1Test_q_to_reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid329_expm1PE2TabGen_lutmem(DUALMEM,359)@18
    memoryC0_uid329_expm1PE2TabGen_lutmem_ia <= (others => '0');
    memoryC0_uid329_expm1PE2TabGen_lutmem_aa <= (others => '0');
    memoryC0_uid329_expm1PE2TabGen_lutmem_ab <= reg_addrPE2FusedClose_uid128_fpExpEM1Test_0_to_memoryC0_uid329_expm1PE2TabGen_lutmem_0_q;
    memoryC0_uid329_expm1PE2TabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_expm1_s5_memoryC0_uid329_expm1PE2TabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid329_expm1PE2TabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid329_expm1PE2TabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid329_expm1PE2TabGen_lutmem_iq,
        address_a => memoryC0_uid329_expm1PE2TabGen_lutmem_aa,
        data_a => memoryC0_uid329_expm1PE2TabGen_lutmem_ia
    );
    memoryC0_uid329_expm1PE2TabGen_lutmem_reset0 <= areset;
        memoryC0_uid329_expm1PE2TabGen_lutmem_q <= memoryC0_uid329_expm1PE2TabGen_lutmem_iq(28 downto 0);

	--reg_memoryC0_uid329_expm1PE2TabGen_lutmem_0_to_sumAHighB_uid345_expm1PE2PolyEval_0(REG,427)@20
    reg_memoryC0_uid329_expm1PE2TabGen_lutmem_0_to_sumAHighB_uid345_expm1PE2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid329_expm1PE2TabGen_lutmem_0_to_sumAHighB_uid345_expm1PE2PolyEval_0_q <= "00000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid329_expm1PE2TabGen_lutmem_0_to_sumAHighB_uid345_expm1PE2PolyEval_0_q <= memoryC0_uid329_expm1PE2TabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid345_expm1PE2PolyEval(ADD,344)@21
    sumAHighB_uid345_expm1PE2PolyEval_a <= STD_LOGIC_VECTOR((29 downto 29 => reg_memoryC0_uid329_expm1PE2TabGen_lutmem_0_to_sumAHighB_uid345_expm1PE2PolyEval_0_q(28)) & reg_memoryC0_uid329_expm1PE2TabGen_lutmem_0_to_sumAHighB_uid345_expm1PE2PolyEval_0_q);
    sumAHighB_uid345_expm1PE2PolyEval_b <= STD_LOGIC_VECTOR((29 downto 21 => highBBits_uid344_expm1PE2PolyEval_b(20)) & highBBits_uid344_expm1PE2PolyEval_b);
            sumAHighB_uid345_expm1PE2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid345_expm1PE2PolyEval_a) + SIGNED(sumAHighB_uid345_expm1PE2PolyEval_b));
    sumAHighB_uid345_expm1PE2PolyEval_q <= sumAHighB_uid345_expm1PE2PolyEval_o(29 downto 0);


	--lowRangeB_uid343_expm1PE2PolyEval(BITSELECT,342)@21
    lowRangeB_uid343_expm1PE2PolyEval_in <= prodXYTruncFR_uid358_pT2_uid342_expm1PE2PolyEval_b(1 downto 0);
    lowRangeB_uid343_expm1PE2PolyEval_b <= lowRangeB_uid343_expm1PE2PolyEval_in(1 downto 0);

	--s2_uid343_uid346_expm1PE2PolyEval(BITJOIN,345)@21
    s2_uid343_uid346_expm1PE2PolyEval_q <= sumAHighB_uid345_expm1PE2PolyEval_q & lowRangeB_uid343_expm1PE2PolyEval_b;

	--pe2OR_uid131_fpExpEM1Test(BITSELECT,130)@21
    pe2OR_uid131_fpExpEM1Test_in <= s2_uid343_uid346_expm1PE2PolyEval_q(29 downto 0);
    pe2OR_uid131_fpExpEM1Test_b <= pe2OR_uid131_fpExpEM1Test_in(29 downto 4);

	--reg_pe2OR_uid131_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_1(REG,429)@21
    reg_pe2OR_uid131_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pe2OR_uid131_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pe2OR_uid131_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_1_q <= pe2OR_uid131_fpExpEM1Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_nor(LOGICAL,1066)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_nor_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_nor_b <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_sticky_ena_q;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_nor_q <= not (ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_nor_a or ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_nor_b);

	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_mem_top(CONSTANT,1062)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_mem_top_q <= "010010";

	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmp(LOGICAL,1063)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmp_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_mem_top_q;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdmux_q);
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmp_q <= "1" when ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmp_a = ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmp_b else "0";

	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmpReg(REG,1064)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmpReg_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_sticky_ena(REG,1067)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_nor_q = "1") THEN
                ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_sticky_ena_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_enaAnd(LOGICAL,1068)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_enaAnd_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_sticky_ena_q;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_enaAnd_b <= en;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_enaAnd_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_enaAnd_a and ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_enaAnd_b;

	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt(COUNTER,1058)
    -- every=1, low=0, high=18, step=1, init=1
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_i = 17 THEN
                      ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_eq = '1') THEN
                        ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_i <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_i - 18;
                    ELSE
                        ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_i <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_i,5));


	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdreg(REG,1059)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdreg_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdmux(MUX,1060)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdmux_s <= en;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdmux: PROCESS (ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdmux_s, ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdreg_q, ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdmux_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdreg_q;
                  WHEN "1" => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdmux_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem(DUALMEM,1057)
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_ia <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_inputreg_q;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_aa <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdreg_q;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_ab <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_rdmux_q;
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 5,
        numwords_a => 19,
        width_b => 24,
        widthad_b => 5,
        numwords_b => 19,
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
        clocken1 => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_iq,
        address_a => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_aa,
        data_a => ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_ia
    );
    ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_reset0 <= areset;
        ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_iq(23 downto 0);

	--reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0(REG,428)@21
    reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_q <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prod2_uid132_fpExpEM1Test(MULT,131)@22
    prod2_uid132_fpExpEM1Test_pr <= UNSIGNED(prod2_uid132_fpExpEM1Test_a) * UNSIGNED(prod2_uid132_fpExpEM1Test_b);
    prod2_uid132_fpExpEM1Test_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod2_uid132_fpExpEM1Test_a <= (others => '0');
            prod2_uid132_fpExpEM1Test_b <= (others => '0');
            prod2_uid132_fpExpEM1Test_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod2_uid132_fpExpEM1Test_a <= reg_oFracX_uid34_uid34_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_0_q;
                prod2_uid132_fpExpEM1Test_b <= reg_pe2OR_uid131_fpExpEM1Test_0_to_prod2_uid132_fpExpEM1Test_1_q;
                prod2_uid132_fpExpEM1Test_s1 <= STD_LOGIC_VECTOR(prod2_uid132_fpExpEM1Test_pr);
            END IF;
        END IF;
    END PROCESS;
    prod2_uid132_fpExpEM1Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod2_uid132_fpExpEM1Test_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod2_uid132_fpExpEM1Test_q <= prod2_uid132_fpExpEM1Test_s1;
            END IF;
        END IF;
    END PROCESS;

	--normBit2_uid133_fpExpEM1Test(BITSELECT,132)@25
    normBit2_uid133_fpExpEM1Test_in <= prod2_uid132_fpExpEM1Test_q(48 downto 0);
    normBit2_uid133_fpExpEM1Test_b <= normBit2_uid133_fpExpEM1Test_in(48 downto 48);

	--InvNormBit2_uid140_fpExpEM1Test(LOGICAL,139)@25
    InvNormBit2_uid140_fpExpEM1Test_a <= normBit2_uid133_fpExpEM1Test_b;
    InvNormBit2_uid140_fpExpEM1Test_q <= not InvNormBit2_uid140_fpExpEM1Test_a;

	--ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_nor(LOGICAL,955)
    ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_nor_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q;
    ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_nor_b <= ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_sticky_ena_q;
    ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_nor_q <= not (ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_nor_a or ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_nor_b);

	--ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_mem_top(CONSTANT,937)
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_mem_top_q <= "010110";

	--ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmp(LOGICAL,938)
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmp_a <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_mem_top_q;
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdmux_q);
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmp_q <= "1" when ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmp_a = ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmp_b else "0";

	--ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmpReg(REG,939)
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmpReg_q <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_sticky_ena(REG,956)
    ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_nor_q = "1") THEN
                ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_sticky_ena_q <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_enaAnd(LOGICAL,957)
    ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_enaAnd_a <= ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_sticky_ena_q;
    ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_enaAnd_b <= en;
    ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_enaAnd_q <= ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_enaAnd_a and ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_enaAnd_b;

	--ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt(COUNTER,933)
    -- every=1, low=0, high=22, step=1, init=1
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_i = 21 THEN
                      ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_eq = '1') THEN
                        ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_i <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_i - 22;
                    ELSE
                        ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_i <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_i,5));


	--ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdreg(REG,934)
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdreg_q <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdmux(MUX,935)
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdmux_s <= en;
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdmux: PROCESS (ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdmux_s, ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdreg_q, ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_q)
    BEGIN
            CASE ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdmux_s IS
                  WHEN "0" => ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdmux_q <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdreg_q;
                  WHEN "1" => ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdmux_q <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem(DUALMEM,946)
    ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_ia <= ld_expX_uid6_fpExpEM1Test_b_to_shiftValuePreSat_uid48_fpExpEM1Test_b_inputreg_q;
    ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_aa <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdreg_q;
    ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_ab <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdmux_q;
    ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 23,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 23,
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
        clocken1 => ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_iq,
        address_a => ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_aa,
        data_a => ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_ia
    );
    ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_reset0 <= areset;
        ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_q <= ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_iq(7 downto 0);

	--expBranchCloseNegExt_uid141_fpExpEM1Test(SUB,140)@25
    expBranchCloseNegExt_uid141_fpExpEM1Test_a <= STD_LOGIC_VECTOR("0" & ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_q);
    expBranchCloseNegExt_uid141_fpExpEM1Test_b <= STD_LOGIC_VECTOR("00000000" & InvNormBit2_uid140_fpExpEM1Test_q);
            expBranchCloseNegExt_uid141_fpExpEM1Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expBranchCloseNegExt_uid141_fpExpEM1Test_a) - UNSIGNED(expBranchCloseNegExt_uid141_fpExpEM1Test_b));
    expBranchCloseNegExt_uid141_fpExpEM1Test_q <= expBranchCloseNegExt_uid141_fpExpEM1Test_o(8 downto 0);


	--expBranchCloseNeg_uid142_fpExpEM1Test(BITSELECT,141)@25
    expBranchCloseNeg_uid142_fpExpEM1Test_in <= expBranchCloseNegExt_uid141_fpExpEM1Test_q(7 downto 0);
    expBranchCloseNeg_uid142_fpExpEM1Test_b <= expBranchCloseNeg_uid142_fpExpEM1Test_in(7 downto 0);

	--reg_expBranchCloseNeg_uid142_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_5(REG,433)@25
    reg_expBranchCloseNeg_uid142_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expBranchCloseNeg_uid142_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_5_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expBranchCloseNeg_uid142_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_5_q <= expBranchCloseNeg_uid142_fpExpEM1Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expBranchCloseNeg_uid142_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_5_q_to_expPostBranchSel_uid153_fpExpEM1Test_f(DELAY,591)@26
    ld_reg_expBranchCloseNeg_uid142_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_5_q_to_expPostBranchSel_uid153_fpExpEM1Test_f : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => reg_expBranchCloseNeg_uid142_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_5_q, xout => ld_reg_expBranchCloseNeg_uid142_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_5_q_to_expPostBranchSel_uid153_fpExpEM1Test_f_q, ena => en(0), clk => clk, aclr => areset );

	--expBranchClosePosExt_uid138_fpExpEM1Test(ADD,137)@25
    expBranchClosePosExt_uid138_fpExpEM1Test_a <= STD_LOGIC_VECTOR("0" & ld_expX_uid6_fpExpEM1Test_b_to_expBranchClosePosExt_uid138_fpExpEM1Test_a_replace_mem_q);
    expBranchClosePosExt_uid138_fpExpEM1Test_b <= STD_LOGIC_VECTOR("00000000" & normBit2_uid133_fpExpEM1Test_b);
            expBranchClosePosExt_uid138_fpExpEM1Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expBranchClosePosExt_uid138_fpExpEM1Test_a) + UNSIGNED(expBranchClosePosExt_uid138_fpExpEM1Test_b));
    expBranchClosePosExt_uid138_fpExpEM1Test_q <= expBranchClosePosExt_uid138_fpExpEM1Test_o(8 downto 0);


	--expBranchClosePos_uid139_fpExpEM1Test(BITSELECT,138)@25
    expBranchClosePos_uid139_fpExpEM1Test_in <= expBranchClosePosExt_uid138_fpExpEM1Test_q(7 downto 0);
    expBranchClosePos_uid139_fpExpEM1Test_b <= expBranchClosePos_uid139_fpExpEM1Test_in(7 downto 0);

	--ld_expBranchClosePos_uid139_fpExpEM1Test_b_to_reg_expBranchClosePos_uid139_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_4_a(DELAY,891)@25
    ld_expBranchClosePos_uid139_fpExpEM1Test_b_to_reg_expBranchClosePos_uid139_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_4_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => expBranchClosePos_uid139_fpExpEM1Test_b, xout => ld_expBranchClosePos_uid139_fpExpEM1Test_b_to_reg_expBranchClosePos_uid139_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_4_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expBranchClosePos_uid139_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_4(REG,432)@28
    reg_expBranchClosePos_uid139_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expBranchClosePos_uid139_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_4_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expBranchClosePos_uid139_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_4_q <= ld_expBranchClosePos_uid139_fpExpEM1Test_b_to_reg_expBranchClosePos_uid139_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_4_a_q;
            END IF;
        END IF;
    END PROCESS;


	--cstBias_uid8_fpExpEM1Test(CONSTANT,7)
    cstBias_uid8_fpExpEM1Test_q <= "01111111";

	--cstBiasM1_uid14_fpExpEM1Test(CONSTANT,13)
    cstBiasM1_uid14_fpExpEM1Test_q <= "01111110";

	--RightShiftStage124dto1_uid323_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITSELECT,322)@27
    RightShiftStage124dto1_uid323_shiftedFracForNegBranch_uid117_fpExpEM1Test_in <= rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_q;
    RightShiftStage124dto1_uid323_shiftedFracForNegBranch_uid117_fpExpEM1Test_b <= RightShiftStage124dto1_uid323_shiftedFracForNegBranch_uid117_fpExpEM1Test_in(24 downto 1);

	--rightShiftStage2Idx1_uid325_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITJOIN,324)@27
    rightShiftStage2Idx1_uid325_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= GND_q & RightShiftStage124dto1_uid323_shiftedFracForNegBranch_uid117_fpExpEM1Test_b;

	--rightShiftStage1Idx3Pad6_uid319_shiftedFracForNegBranch_uid117_fpExpEM1Test(CONSTANT,318)
    rightShiftStage1Idx3Pad6_uid319_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= "000000";

	--rightShiftStage0Idx3Pad24_uid308_shiftedFracForNegBranch_uid117_fpExpEM1Test(CONSTANT,307)
    rightShiftStage0Idx3Pad24_uid308_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= "000000000000000000000000";

	--ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_nor(LOGICAL,928)
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_nor_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q;
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_nor_b <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_sticky_ena_q;
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_nor_q <= not (ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_nor_a or ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_nor_b);

	--ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_sticky_ena(REG,929)
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_nor_q = "1") THEN
                ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_sticky_ena_q <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_enaAnd(LOGICAL,930)
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_enaAnd_a <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_sticky_ena_q;
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_enaAnd_b <= en;
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_enaAnd_q <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_enaAnd_a and ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_enaAnd_b;

	--zY_uid68_fpExpEM1Test(CONSTANT,67)
    zY_uid68_fpExpEM1Test_q <= "00000000000000000000000000";

	--reg_oneSComplementOption_uid40_fpExpEM1Test_0_to_fxpInExtX_uid43_fpExpEM1Test_1(REG,363)@0
    reg_oneSComplementOption_uid40_fpExpEM1Test_0_to_fxpInExtX_uid43_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oneSComplementOption_uid40_fpExpEM1Test_0_to_fxpInExtX_uid43_fpExpEM1Test_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oneSComplementOption_uid40_fpExpEM1Test_0_to_fxpInExtX_uid43_fpExpEM1Test_1_q <= oneSComplementOption_uid40_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--oFracX_uid41_fpExpEM1Test(BITJOIN,40)@0
    oFracX_uid41_fpExpEM1Test_q <= GND_q & oFracX_uid34_uid34_fpExpEM1Test_q;

	--onesCmpFxpInX_uid42_fpExpEM1Test(LOGICAL,41)@0
    onesCmpFxpInX_uid42_fpExpEM1Test_a <= oFracX_uid41_fpExpEM1Test_q;
    onesCmpFxpInX_uid42_fpExpEM1Test_b <= STD_LOGIC_VECTOR((24 downto 1 => oneSComplementOption_uid40_fpExpEM1Test_q(0)) & oneSComplementOption_uid40_fpExpEM1Test_q);
    onesCmpFxpInX_uid42_fpExpEM1Test_q_i <= onesCmpFxpInX_uid42_fpExpEM1Test_a xor onesCmpFxpInX_uid42_fpExpEM1Test_b;
    onesCmpFxpInX_uid42_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 25, depth => 1)
    PORT MAP (xout => onesCmpFxpInX_uid42_fpExpEM1Test_q, xin => onesCmpFxpInX_uid42_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--fxpInExtX_uid43_fpExpEM1Test(ADD,42)@1
    fxpInExtX_uid43_fpExpEM1Test_a <= STD_LOGIC_VECTOR((26 downto 25 => onesCmpFxpInX_uid42_fpExpEM1Test_q(24)) & onesCmpFxpInX_uid42_fpExpEM1Test_q);
    fxpInExtX_uid43_fpExpEM1Test_b <= STD_LOGIC_VECTOR('0' & "0000000000000000000000000" & reg_oneSComplementOption_uid40_fpExpEM1Test_0_to_fxpInExtX_uid43_fpExpEM1Test_1_q);
            fxpInExtX_uid43_fpExpEM1Test_o <= STD_LOGIC_VECTOR(SIGNED(fxpInExtX_uid43_fpExpEM1Test_a) + SIGNED(fxpInExtX_uid43_fpExpEM1Test_b));
    fxpInExtX_uid43_fpExpEM1Test_q <= fxpInExtX_uid43_fpExpEM1Test_o(25 downto 0);


	--fxpInPreAlign_uid44_fpExpEM1Test(BITSELECT,43)@1
    fxpInPreAlign_uid44_fpExpEM1Test_in <= fxpInExtX_uid43_fpExpEM1Test_q(24 downto 0);
    fxpInPreAlign_uid44_fpExpEM1Test_b <= fxpInPreAlign_uid44_fpExpEM1Test_in(24 downto 0);

	--xv0_uid174_constMult(BITSELECT,173)@1
    xv0_uid174_constMult_in <= fxpInPreAlign_uid44_fpExpEM1Test_b(5 downto 0);
    xv0_uid174_constMult_b <= xv0_uid174_constMult_in(5 downto 0);

	--reg_xv0_uid174_constMult_0_to_p0_uid183_constMult_0(REG,368)@1
    reg_xv0_uid174_constMult_0_to_p0_uid183_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv0_uid174_constMult_0_to_p0_uid183_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv0_uid174_constMult_0_to_p0_uid183_constMult_0_q <= xv0_uid174_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xv0_uid174_constMult_0_to_p0_uid183_constMult_0_q_to_p0_uid183_constMult_a(DELAY,629)@2
    ld_reg_xv0_uid174_constMult_0_to_p0_uid183_constMult_0_q_to_p0_uid183_constMult_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 3 )
    PORT MAP ( xin => reg_xv0_uid174_constMult_0_to_p0_uid183_constMult_0_q, xout => ld_reg_xv0_uid174_constMult_0_to_p0_uid183_constMult_0_q_to_p0_uid183_constMult_a_q, ena => en(0), clk => clk, aclr => areset );

	--p0_uid183_constMult(LOOKUP,182)@5
    p0_uid183_constMult: PROCESS (ld_reg_xv0_uid174_constMult_0_to_p0_uid183_constMult_0_q_to_p0_uid183_constMult_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_xv0_uid174_constMult_0_to_p0_uid183_constMult_0_q_to_p0_uid183_constMult_a_q) IS
                WHEN "000000" =>  p0_uid183_constMult_q <= "0000000000000";
                WHEN "000001" =>  p0_uid183_constMult_q <= "0000001011100";
                WHEN "000010" =>  p0_uid183_constMult_q <= "0000010111001";
                WHEN "000011" =>  p0_uid183_constMult_q <= "0000100010101";
                WHEN "000100" =>  p0_uid183_constMult_q <= "0000101110001";
                WHEN "000101" =>  p0_uid183_constMult_q <= "0000111001110";
                WHEN "000110" =>  p0_uid183_constMult_q <= "0001000101010";
                WHEN "000111" =>  p0_uid183_constMult_q <= "0001010000110";
                WHEN "001000" =>  p0_uid183_constMult_q <= "0001011100011";
                WHEN "001001" =>  p0_uid183_constMult_q <= "0001100111111";
                WHEN "001010" =>  p0_uid183_constMult_q <= "0001110011011";
                WHEN "001011" =>  p0_uid183_constMult_q <= "0001111111000";
                WHEN "001100" =>  p0_uid183_constMult_q <= "0010001010100";
                WHEN "001101" =>  p0_uid183_constMult_q <= "0010010110000";
                WHEN "001110" =>  p0_uid183_constMult_q <= "0010100001101";
                WHEN "001111" =>  p0_uid183_constMult_q <= "0010101101001";
                WHEN "010000" =>  p0_uid183_constMult_q <= "0010111000101";
                WHEN "010001" =>  p0_uid183_constMult_q <= "0011000100010";
                WHEN "010010" =>  p0_uid183_constMult_q <= "0011001111110";
                WHEN "010011" =>  p0_uid183_constMult_q <= "0011011011010";
                WHEN "010100" =>  p0_uid183_constMult_q <= "0011100110111";
                WHEN "010101" =>  p0_uid183_constMult_q <= "0011110010011";
                WHEN "010110" =>  p0_uid183_constMult_q <= "0011111101111";
                WHEN "010111" =>  p0_uid183_constMult_q <= "0100001001100";
                WHEN "011000" =>  p0_uid183_constMult_q <= "0100010101000";
                WHEN "011001" =>  p0_uid183_constMult_q <= "0100100000100";
                WHEN "011010" =>  p0_uid183_constMult_q <= "0100101100001";
                WHEN "011011" =>  p0_uid183_constMult_q <= "0100110111101";
                WHEN "011100" =>  p0_uid183_constMult_q <= "0101000011001";
                WHEN "011101" =>  p0_uid183_constMult_q <= "0101001110110";
                WHEN "011110" =>  p0_uid183_constMult_q <= "0101011010010";
                WHEN "011111" =>  p0_uid183_constMult_q <= "0101100101110";
                WHEN "100000" =>  p0_uid183_constMult_q <= "0101110001011";
                WHEN "100001" =>  p0_uid183_constMult_q <= "0101111100111";
                WHEN "100010" =>  p0_uid183_constMult_q <= "0110001000011";
                WHEN "100011" =>  p0_uid183_constMult_q <= "0110010100000";
                WHEN "100100" =>  p0_uid183_constMult_q <= "0110011111100";
                WHEN "100101" =>  p0_uid183_constMult_q <= "0110101011000";
                WHEN "100110" =>  p0_uid183_constMult_q <= "0110110110101";
                WHEN "100111" =>  p0_uid183_constMult_q <= "0111000010001";
                WHEN "101000" =>  p0_uid183_constMult_q <= "0111001101101";
                WHEN "101001" =>  p0_uid183_constMult_q <= "0111011001010";
                WHEN "101010" =>  p0_uid183_constMult_q <= "0111100100110";
                WHEN "101011" =>  p0_uid183_constMult_q <= "0111110000010";
                WHEN "101100" =>  p0_uid183_constMult_q <= "0111111011111";
                WHEN "101101" =>  p0_uid183_constMult_q <= "1000000111011";
                WHEN "101110" =>  p0_uid183_constMult_q <= "1000010010111";
                WHEN "101111" =>  p0_uid183_constMult_q <= "1000011110100";
                WHEN "110000" =>  p0_uid183_constMult_q <= "1000101010000";
                WHEN "110001" =>  p0_uid183_constMult_q <= "1000110101100";
                WHEN "110010" =>  p0_uid183_constMult_q <= "1001000001001";
                WHEN "110011" =>  p0_uid183_constMult_q <= "1001001100101";
                WHEN "110100" =>  p0_uid183_constMult_q <= "1001011000001";
                WHEN "110101" =>  p0_uid183_constMult_q <= "1001100011110";
                WHEN "110110" =>  p0_uid183_constMult_q <= "1001101111010";
                WHEN "110111" =>  p0_uid183_constMult_q <= "1001111010110";
                WHEN "111000" =>  p0_uid183_constMult_q <= "1010000110011";
                WHEN "111001" =>  p0_uid183_constMult_q <= "1010010001111";
                WHEN "111010" =>  p0_uid183_constMult_q <= "1010011101011";
                WHEN "111011" =>  p0_uid183_constMult_q <= "1010101001000";
                WHEN "111100" =>  p0_uid183_constMult_q <= "1010110100100";
                WHEN "111101" =>  p0_uid183_constMult_q <= "1011000000000";
                WHEN "111110" =>  p0_uid183_constMult_q <= "1011001011101";
                WHEN "111111" =>  p0_uid183_constMult_q <= "1011010111001";
                WHEN OTHERS =>
                    p0_uid183_constMult_q <= "0000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv1_uid175_constMult(BITSELECT,174)@1
    xv1_uid175_constMult_in <= fxpInPreAlign_uid44_fpExpEM1Test_b(11 downto 0);
    xv1_uid175_constMult_b <= xv1_uid175_constMult_in(11 downto 6);

	--reg_xv1_uid175_constMult_0_to_p1_uid182_constMult_0(REG,367)@1
    reg_xv1_uid175_constMult_0_to_p1_uid182_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv1_uid175_constMult_0_to_p1_uid182_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv1_uid175_constMult_0_to_p1_uid182_constMult_0_q <= xv1_uid175_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xv1_uid175_constMult_0_to_p1_uid182_constMult_0_q_to_p1_uid182_constMult_a(DELAY,628)@2
    ld_reg_xv1_uid175_constMult_0_to_p1_uid182_constMult_0_q_to_p1_uid182_constMult_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 2 )
    PORT MAP ( xin => reg_xv1_uid175_constMult_0_to_p1_uid182_constMult_0_q, xout => ld_reg_xv1_uid175_constMult_0_to_p1_uid182_constMult_0_q_to_p1_uid182_constMult_a_q, ena => en(0), clk => clk, aclr => areset );

	--p1_uid182_constMult(LOOKUP,181)@4
    p1_uid182_constMult: PROCESS (ld_reg_xv1_uid175_constMult_0_to_p1_uid182_constMult_0_q_to_p1_uid182_constMult_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_xv1_uid175_constMult_0_to_p1_uid182_constMult_0_q_to_p1_uid182_constMult_a_q) IS
                WHEN "000000" =>  p1_uid182_constMult_q <= "0000000000000000000";
                WHEN "000001" =>  p1_uid182_constMult_q <= "0000001011100010101";
                WHEN "000010" =>  p1_uid182_constMult_q <= "0000010111000101011";
                WHEN "000011" =>  p1_uid182_constMult_q <= "0000100010101000000";
                WHEN "000100" =>  p1_uid182_constMult_q <= "0000101110001010101";
                WHEN "000101" =>  p1_uid182_constMult_q <= "0000111001101101010";
                WHEN "000110" =>  p1_uid182_constMult_q <= "0001000101010000000";
                WHEN "000111" =>  p1_uid182_constMult_q <= "0001010000110010101";
                WHEN "001000" =>  p1_uid182_constMult_q <= "0001011100010101010";
                WHEN "001001" =>  p1_uid182_constMult_q <= "0001100111111000000";
                WHEN "001010" =>  p1_uid182_constMult_q <= "0001110011011010101";
                WHEN "001011" =>  p1_uid182_constMult_q <= "0001111110111101010";
                WHEN "001100" =>  p1_uid182_constMult_q <= "0010001010011111111";
                WHEN "001101" =>  p1_uid182_constMult_q <= "0010010110000010101";
                WHEN "001110" =>  p1_uid182_constMult_q <= "0010100001100101010";
                WHEN "001111" =>  p1_uid182_constMult_q <= "0010101101000111111";
                WHEN "010000" =>  p1_uid182_constMult_q <= "0010111000101010100";
                WHEN "010001" =>  p1_uid182_constMult_q <= "0011000100001101010";
                WHEN "010010" =>  p1_uid182_constMult_q <= "0011001111101111111";
                WHEN "010011" =>  p1_uid182_constMult_q <= "0011011011010010100";
                WHEN "010100" =>  p1_uid182_constMult_q <= "0011100110110101010";
                WHEN "010101" =>  p1_uid182_constMult_q <= "0011110010010111111";
                WHEN "010110" =>  p1_uid182_constMult_q <= "0011111101111010100";
                WHEN "010111" =>  p1_uid182_constMult_q <= "0100001001011101001";
                WHEN "011000" =>  p1_uid182_constMult_q <= "0100010100111111111";
                WHEN "011001" =>  p1_uid182_constMult_q <= "0100100000100010100";
                WHEN "011010" =>  p1_uid182_constMult_q <= "0100101100000101001";
                WHEN "011011" =>  p1_uid182_constMult_q <= "0100110111100111111";
                WHEN "011100" =>  p1_uid182_constMult_q <= "0101000011001010100";
                WHEN "011101" =>  p1_uid182_constMult_q <= "0101001110101101001";
                WHEN "011110" =>  p1_uid182_constMult_q <= "0101011010001111110";
                WHEN "011111" =>  p1_uid182_constMult_q <= "0101100101110010100";
                WHEN "100000" =>  p1_uid182_constMult_q <= "0101110001010101001";
                WHEN "100001" =>  p1_uid182_constMult_q <= "0101111100110111110";
                WHEN "100010" =>  p1_uid182_constMult_q <= "0110001000011010011";
                WHEN "100011" =>  p1_uid182_constMult_q <= "0110010011111101001";
                WHEN "100100" =>  p1_uid182_constMult_q <= "0110011111011111110";
                WHEN "100101" =>  p1_uid182_constMult_q <= "0110101011000010011";
                WHEN "100110" =>  p1_uid182_constMult_q <= "0110110110100101001";
                WHEN "100111" =>  p1_uid182_constMult_q <= "0111000010000111110";
                WHEN "101000" =>  p1_uid182_constMult_q <= "0111001101101010011";
                WHEN "101001" =>  p1_uid182_constMult_q <= "0111011001001101000";
                WHEN "101010" =>  p1_uid182_constMult_q <= "0111100100101111110";
                WHEN "101011" =>  p1_uid182_constMult_q <= "0111110000010010011";
                WHEN "101100" =>  p1_uid182_constMult_q <= "0111111011110101000";
                WHEN "101101" =>  p1_uid182_constMult_q <= "1000000111010111110";
                WHEN "101110" =>  p1_uid182_constMult_q <= "1000010010111010011";
                WHEN "101111" =>  p1_uid182_constMult_q <= "1000011110011101000";
                WHEN "110000" =>  p1_uid182_constMult_q <= "1000101001111111101";
                WHEN "110001" =>  p1_uid182_constMult_q <= "1000110101100010011";
                WHEN "110010" =>  p1_uid182_constMult_q <= "1001000001000101000";
                WHEN "110011" =>  p1_uid182_constMult_q <= "1001001100100111101";
                WHEN "110100" =>  p1_uid182_constMult_q <= "1001011000001010011";
                WHEN "110101" =>  p1_uid182_constMult_q <= "1001100011101101000";
                WHEN "110110" =>  p1_uid182_constMult_q <= "1001101111001111101";
                WHEN "110111" =>  p1_uid182_constMult_q <= "1001111010110010010";
                WHEN "111000" =>  p1_uid182_constMult_q <= "1010000110010101000";
                WHEN "111001" =>  p1_uid182_constMult_q <= "1010010001110111101";
                WHEN "111010" =>  p1_uid182_constMult_q <= "1010011101011010010";
                WHEN "111011" =>  p1_uid182_constMult_q <= "1010101000111100111";
                WHEN "111100" =>  p1_uid182_constMult_q <= "1010110100011111101";
                WHEN "111101" =>  p1_uid182_constMult_q <= "1011000000000010010";
                WHEN "111110" =>  p1_uid182_constMult_q <= "1011001011100100111";
                WHEN "111111" =>  p1_uid182_constMult_q <= "1011010111000111101";
                WHEN OTHERS =>
                    p1_uid182_constMult_q <= "0000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv2_uid176_constMult(BITSELECT,175)@1
    xv2_uid176_constMult_in <= fxpInPreAlign_uid44_fpExpEM1Test_b(17 downto 0);
    xv2_uid176_constMult_b <= xv2_uid176_constMult_in(17 downto 12);

	--ld_xv2_uid176_constMult_b_to_reg_xv2_uid176_constMult_0_to_p2_uid181_constMult_0_a(DELAY,825)@1
    ld_xv2_uid176_constMult_b_to_reg_xv2_uid176_constMult_0_to_p2_uid181_constMult_0_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => xv2_uid176_constMult_b, xout => ld_xv2_uid176_constMult_b_to_reg_xv2_uid176_constMult_0_to_p2_uid181_constMult_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_xv2_uid176_constMult_0_to_p2_uid181_constMult_0(REG,366)@2
    reg_xv2_uid176_constMult_0_to_p2_uid181_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv2_uid176_constMult_0_to_p2_uid181_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv2_uid176_constMult_0_to_p2_uid181_constMult_0_q <= ld_xv2_uid176_constMult_b_to_reg_xv2_uid176_constMult_0_to_p2_uid181_constMult_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--p2_uid181_constMult(LOOKUP,180)@3
    p2_uid181_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p2_uid181_constMult_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_xv2_uid176_constMult_0_to_p2_uid181_constMult_0_q) IS
                WHEN "000000" =>  p2_uid181_constMult_q <= "0000000000000000000000000";
                WHEN "000001" =>  p2_uid181_constMult_q <= "0000001011100010101010010";
                WHEN "000010" =>  p2_uid181_constMult_q <= "0000010111000101010100100";
                WHEN "000011" =>  p2_uid181_constMult_q <= "0000100010100111111110110";
                WHEN "000100" =>  p2_uid181_constMult_q <= "0000101110001010101000111";
                WHEN "000101" =>  p2_uid181_constMult_q <= "0000111001101101010011001";
                WHEN "000110" =>  p2_uid181_constMult_q <= "0001000101001111111101011";
                WHEN "000111" =>  p2_uid181_constMult_q <= "0001010000110010100111101";
                WHEN "001000" =>  p2_uid181_constMult_q <= "0001011100010101010001111";
                WHEN "001001" =>  p2_uid181_constMult_q <= "0001100111110111111100001";
                WHEN "001010" =>  p2_uid181_constMult_q <= "0001110011011010100110010";
                WHEN "001011" =>  p2_uid181_constMult_q <= "0001111110111101010000100";
                WHEN "001100" =>  p2_uid181_constMult_q <= "0010001010011111111010110";
                WHEN "001101" =>  p2_uid181_constMult_q <= "0010010110000010100101000";
                WHEN "001110" =>  p2_uid181_constMult_q <= "0010100001100101001111010";
                WHEN "001111" =>  p2_uid181_constMult_q <= "0010101101000111111001100";
                WHEN "010000" =>  p2_uid181_constMult_q <= "0010111000101010100011110";
                WHEN "010001" =>  p2_uid181_constMult_q <= "0011000100001101001101111";
                WHEN "010010" =>  p2_uid181_constMult_q <= "0011001111101111111000001";
                WHEN "010011" =>  p2_uid181_constMult_q <= "0011011011010010100010011";
                WHEN "010100" =>  p2_uid181_constMult_q <= "0011100110110101001100101";
                WHEN "010101" =>  p2_uid181_constMult_q <= "0011110010010111110110111";
                WHEN "010110" =>  p2_uid181_constMult_q <= "0011111101111010100001001";
                WHEN "010111" =>  p2_uid181_constMult_q <= "0100001001011101001011011";
                WHEN "011000" =>  p2_uid181_constMult_q <= "0100010100111111110101100";
                WHEN "011001" =>  p2_uid181_constMult_q <= "0100100000100010011111110";
                WHEN "011010" =>  p2_uid181_constMult_q <= "0100101100000101001010000";
                WHEN "011011" =>  p2_uid181_constMult_q <= "0100110111100111110100010";
                WHEN "011100" =>  p2_uid181_constMult_q <= "0101000011001010011110100";
                WHEN "011101" =>  p2_uid181_constMult_q <= "0101001110101101001000110";
                WHEN "011110" =>  p2_uid181_constMult_q <= "0101011010001111110010111";
                WHEN "011111" =>  p2_uid181_constMult_q <= "0101100101110010011101001";
                WHEN "100000" =>  p2_uid181_constMult_q <= "0101110001010101000111011";
                WHEN "100001" =>  p2_uid181_constMult_q <= "0101111100110111110001101";
                WHEN "100010" =>  p2_uid181_constMult_q <= "0110001000011010011011111";
                WHEN "100011" =>  p2_uid181_constMult_q <= "0110010011111101000110001";
                WHEN "100100" =>  p2_uid181_constMult_q <= "0110011111011111110000011";
                WHEN "100101" =>  p2_uid181_constMult_q <= "0110101011000010011010100";
                WHEN "100110" =>  p2_uid181_constMult_q <= "0110110110100101000100110";
                WHEN "100111" =>  p2_uid181_constMult_q <= "0111000010000111101111000";
                WHEN "101000" =>  p2_uid181_constMult_q <= "0111001101101010011001010";
                WHEN "101001" =>  p2_uid181_constMult_q <= "0111011001001101000011100";
                WHEN "101010" =>  p2_uid181_constMult_q <= "0111100100101111101101110";
                WHEN "101011" =>  p2_uid181_constMult_q <= "0111110000010010010111111";
                WHEN "101100" =>  p2_uid181_constMult_q <= "0111111011110101000010001";
                WHEN "101101" =>  p2_uid181_constMult_q <= "1000000111010111101100011";
                WHEN "101110" =>  p2_uid181_constMult_q <= "1000010010111010010110101";
                WHEN "101111" =>  p2_uid181_constMult_q <= "1000011110011101000000111";
                WHEN "110000" =>  p2_uid181_constMult_q <= "1000101001111111101011001";
                WHEN "110001" =>  p2_uid181_constMult_q <= "1000110101100010010101011";
                WHEN "110010" =>  p2_uid181_constMult_q <= "1001000001000100111111100";
                WHEN "110011" =>  p2_uid181_constMult_q <= "1001001100100111101001110";
                WHEN "110100" =>  p2_uid181_constMult_q <= "1001011000001010010100000";
                WHEN "110101" =>  p2_uid181_constMult_q <= "1001100011101100111110010";
                WHEN "110110" =>  p2_uid181_constMult_q <= "1001101111001111101000100";
                WHEN "110111" =>  p2_uid181_constMult_q <= "1001111010110010010010110";
                WHEN "111000" =>  p2_uid181_constMult_q <= "1010000110010100111101000";
                WHEN "111001" =>  p2_uid181_constMult_q <= "1010010001110111100111001";
                WHEN "111010" =>  p2_uid181_constMult_q <= "1010011101011010010001011";
                WHEN "111011" =>  p2_uid181_constMult_q <= "1010101000111100111011101";
                WHEN "111100" =>  p2_uid181_constMult_q <= "1010110100011111100101111";
                WHEN "111101" =>  p2_uid181_constMult_q <= "1011000000000010010000001";
                WHEN "111110" =>  p2_uid181_constMult_q <= "1011001011100100111010011";
                WHEN "111111" =>  p2_uid181_constMult_q <= "1011010111000111100100100";
                WHEN OTHERS =>
                    p2_uid181_constMult_q <= "0000000000000000000000000";
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--lev1_a1_uid185_constMult(ADD,184)@4
    lev1_a1_uid185_constMult_a <= STD_LOGIC_VECTOR("0" & p2_uid181_constMult_q);
    lev1_a1_uid185_constMult_b <= STD_LOGIC_VECTOR("0000000" & p1_uid182_constMult_q);
            lev1_a1_uid185_constMult_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a1_uid185_constMult_a) + UNSIGNED(lev1_a1_uid185_constMult_b));
    lev1_a1_uid185_constMult_q <= lev1_a1_uid185_constMult_o(25 downto 0);


	--xv3_uid177_constMult(BITSELECT,176)@1
    xv3_uid177_constMult_in <= fxpInPreAlign_uid44_fpExpEM1Test_b(23 downto 0);
    xv3_uid177_constMult_b <= xv3_uid177_constMult_in(23 downto 18);

	--reg_xv3_uid177_constMult_0_to_p3_uid180_constMult_0(REG,365)@1
    reg_xv3_uid177_constMult_0_to_p3_uid180_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv3_uid177_constMult_0_to_p3_uid180_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv3_uid177_constMult_0_to_p3_uid180_constMult_0_q <= xv3_uid177_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xv3_uid177_constMult_0_to_p3_uid180_constMult_0_q_to_p3_uid180_constMult_a(DELAY,626)@2
    ld_reg_xv3_uid177_constMult_0_to_p3_uid180_constMult_0_q_to_p3_uid180_constMult_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => reg_xv3_uid177_constMult_0_to_p3_uid180_constMult_0_q, xout => ld_reg_xv3_uid177_constMult_0_to_p3_uid180_constMult_0_q_to_p3_uid180_constMult_a_q, ena => en(0), clk => clk, aclr => areset );

	--p3_uid180_constMult(LOOKUP,179)@3
    p3_uid180_constMult: PROCESS (ld_reg_xv3_uid177_constMult_0_to_p3_uid180_constMult_0_q_to_p3_uid180_constMult_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_xv3_uid177_constMult_0_to_p3_uid180_constMult_0_q_to_p3_uid180_constMult_a_q) IS
                WHEN "000000" =>  p3_uid180_constMult_q <= "0000000000000000000000000000000";
                WHEN "000001" =>  p3_uid180_constMult_q <= "0000001011100010101010001110110";
                WHEN "000010" =>  p3_uid180_constMult_q <= "0000010111000101010100011101101";
                WHEN "000011" =>  p3_uid180_constMult_q <= "0000100010100111111110101100011";
                WHEN "000100" =>  p3_uid180_constMult_q <= "0000101110001010101000111011001";
                WHEN "000101" =>  p3_uid180_constMult_q <= "0000111001101101010011001010000";
                WHEN "000110" =>  p3_uid180_constMult_q <= "0001000101001111111101011000110";
                WHEN "000111" =>  p3_uid180_constMult_q <= "0001010000110010100111100111100";
                WHEN "001000" =>  p3_uid180_constMult_q <= "0001011100010101010001110110010";
                WHEN "001001" =>  p3_uid180_constMult_q <= "0001100111110111111100000101001";
                WHEN "001010" =>  p3_uid180_constMult_q <= "0001110011011010100110010011111";
                WHEN "001011" =>  p3_uid180_constMult_q <= "0001111110111101010000100010101";
                WHEN "001100" =>  p3_uid180_constMult_q <= "0010001010011111111010110001100";
                WHEN "001101" =>  p3_uid180_constMult_q <= "0010010110000010100101000000010";
                WHEN "001110" =>  p3_uid180_constMult_q <= "0010100001100101001111001111000";
                WHEN "001111" =>  p3_uid180_constMult_q <= "0010101101000111111001011101111";
                WHEN "010000" =>  p3_uid180_constMult_q <= "0010111000101010100011101100101";
                WHEN "010001" =>  p3_uid180_constMult_q <= "0011000100001101001101111011011";
                WHEN "010010" =>  p3_uid180_constMult_q <= "0011001111101111111000001010010";
                WHEN "010011" =>  p3_uid180_constMult_q <= "0011011011010010100010011001000";
                WHEN "010100" =>  p3_uid180_constMult_q <= "0011100110110101001100100111110";
                WHEN "010101" =>  p3_uid180_constMult_q <= "0011110010010111110110110110101";
                WHEN "010110" =>  p3_uid180_constMult_q <= "0011111101111010100001000101011";
                WHEN "010111" =>  p3_uid180_constMult_q <= "0100001001011101001011010100001";
                WHEN "011000" =>  p3_uid180_constMult_q <= "0100010100111111110101100011000";
                WHEN "011001" =>  p3_uid180_constMult_q <= "0100100000100010011111110001110";
                WHEN "011010" =>  p3_uid180_constMult_q <= "0100101100000101001010000000100";
                WHEN "011011" =>  p3_uid180_constMult_q <= "0100110111100111110100001111010";
                WHEN "011100" =>  p3_uid180_constMult_q <= "0101000011001010011110011110001";
                WHEN "011101" =>  p3_uid180_constMult_q <= "0101001110101101001000101100111";
                WHEN "011110" =>  p3_uid180_constMult_q <= "0101011010001111110010111011101";
                WHEN "011111" =>  p3_uid180_constMult_q <= "0101100101110010011101001010100";
                WHEN "100000" =>  p3_uid180_constMult_q <= "0101110001010101000111011001010";
                WHEN "100001" =>  p3_uid180_constMult_q <= "0101111100110111110001101000000";
                WHEN "100010" =>  p3_uid180_constMult_q <= "0110001000011010011011110110111";
                WHEN "100011" =>  p3_uid180_constMult_q <= "0110010011111101000110000101101";
                WHEN "100100" =>  p3_uid180_constMult_q <= "0110011111011111110000010100011";
                WHEN "100101" =>  p3_uid180_constMult_q <= "0110101011000010011010100011010";
                WHEN "100110" =>  p3_uid180_constMult_q <= "0110110110100101000100110010000";
                WHEN "100111" =>  p3_uid180_constMult_q <= "0111000010000111101111000000110";
                WHEN "101000" =>  p3_uid180_constMult_q <= "0111001101101010011001001111100";
                WHEN "101001" =>  p3_uid180_constMult_q <= "0111011001001101000011011110011";
                WHEN "101010" =>  p3_uid180_constMult_q <= "0111100100101111101101101101001";
                WHEN "101011" =>  p3_uid180_constMult_q <= "0111110000010010010111111011111";
                WHEN "101100" =>  p3_uid180_constMult_q <= "0111111011110101000010001010110";
                WHEN "101101" =>  p3_uid180_constMult_q <= "1000000111010111101100011001100";
                WHEN "101110" =>  p3_uid180_constMult_q <= "1000010010111010010110101000010";
                WHEN "101111" =>  p3_uid180_constMult_q <= "1000011110011101000000110111001";
                WHEN "110000" =>  p3_uid180_constMult_q <= "1000101001111111101011000101111";
                WHEN "110001" =>  p3_uid180_constMult_q <= "1000110101100010010101010100101";
                WHEN "110010" =>  p3_uid180_constMult_q <= "1001000001000100111111100011100";
                WHEN "110011" =>  p3_uid180_constMult_q <= "1001001100100111101001110010010";
                WHEN "110100" =>  p3_uid180_constMult_q <= "1001011000001010010100000001000";
                WHEN "110101" =>  p3_uid180_constMult_q <= "1001100011101100111110001111111";
                WHEN "110110" =>  p3_uid180_constMult_q <= "1001101111001111101000011110101";
                WHEN "110111" =>  p3_uid180_constMult_q <= "1001111010110010010010101101011";
                WHEN "111000" =>  p3_uid180_constMult_q <= "1010000110010100111100111100010";
                WHEN "111001" =>  p3_uid180_constMult_q <= "1010010001110111100111001011000";
                WHEN "111010" =>  p3_uid180_constMult_q <= "1010011101011010010001011001110";
                WHEN "111011" =>  p3_uid180_constMult_q <= "1010101000111100111011101000100";
                WHEN "111100" =>  p3_uid180_constMult_q <= "1010110100011111100101110111011";
                WHEN "111101" =>  p3_uid180_constMult_q <= "1011000000000010010000000110001";
                WHEN "111110" =>  p3_uid180_constMult_q <= "1011001011100100111010010100111";
                WHEN "111111" =>  p3_uid180_constMult_q <= "1011010111000111100100100011110";
                WHEN OTHERS =>
                    p3_uid180_constMult_q <= "0000000000000000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv4_uid178_constMult(BITSELECT,177)@1
    xv4_uid178_constMult_in <= fxpInPreAlign_uid44_fpExpEM1Test_b;
    xv4_uid178_constMult_b <= xv4_uid178_constMult_in(24 downto 24);

	--reg_xv4_uid178_constMult_0_to_p4_uid179_constMult_0(REG,364)@1
    reg_xv4_uid178_constMult_0_to_p4_uid179_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv4_uid178_constMult_0_to_p4_uid179_constMult_0_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv4_uid178_constMult_0_to_p4_uid179_constMult_0_q <= xv4_uid178_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--p4_uid179_constMult(LOOKUP,178)@2
    p4_uid179_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p4_uid179_constMult_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_xv4_uid178_constMult_0_to_p4_uid179_constMult_0_q) IS
                WHEN "0" =>  p4_uid179_constMult_q <= "00000000000000000000000000000000";
                WHEN "1" =>  p4_uid179_constMult_q <= "10100011101010101110001001101100";
                WHEN OTHERS =>
                    p4_uid179_constMult_q <= "00000000000000000000000000000000";
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--lev1_a0_uid184_constMult(ADD,183)@3
    lev1_a0_uid184_constMult_a <= STD_LOGIC_VECTOR((33 downto 32 => p4_uid179_constMult_q(31)) & p4_uid179_constMult_q);
    lev1_a0_uid184_constMult_b <= STD_LOGIC_VECTOR('0' & "00" & p3_uid180_constMult_q);
    lev1_a0_uid184_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a0_uid184_constMult_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                lev1_a0_uid184_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0_uid184_constMult_a) + SIGNED(lev1_a0_uid184_constMult_b));
            END IF;
        END IF;
    END PROCESS;
    lev1_a0_uid184_constMult_q <= lev1_a0_uid184_constMult_o(32 downto 0);


	--lev2_a0_uid186_constMult(ADD,185)@4
    lev2_a0_uid186_constMult_a <= STD_LOGIC_VECTOR((34 downto 33 => lev1_a0_uid184_constMult_q(32)) & lev1_a0_uid184_constMult_q);
    lev2_a0_uid186_constMult_b <= STD_LOGIC_VECTOR('0' & "00000000" & lev1_a1_uid185_constMult_q);
    lev2_a0_uid186_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev2_a0_uid186_constMult_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                lev2_a0_uid186_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0_uid186_constMult_a) + SIGNED(lev2_a0_uid186_constMult_b));
            END IF;
        END IF;
    END PROCESS;
    lev2_a0_uid186_constMult_q <= lev2_a0_uid186_constMult_o(33 downto 0);


	--lev3_a0_uid187_constMult(ADD,186)@5
    lev3_a0_uid187_constMult_a <= STD_LOGIC_VECTOR((35 downto 34 => lev2_a0_uid186_constMult_q(33)) & lev2_a0_uid186_constMult_q);
    lev3_a0_uid187_constMult_b <= STD_LOGIC_VECTOR('0' & "0000000000000000000000" & p0_uid183_constMult_q);
            lev3_a0_uid187_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev3_a0_uid187_constMult_a) + SIGNED(lev3_a0_uid187_constMult_b));
    lev3_a0_uid187_constMult_q <= lev3_a0_uid187_constMult_o(34 downto 0);


	--sR_uid188_constMult(BITSELECT,187)@5
    sR_uid188_constMult_in <= lev3_a0_uid187_constMult_q(31 downto 0);
    sR_uid188_constMult_b <= sR_uid188_constMult_in(31 downto 3);

	--oFracXZwE_uid47_fpExpEM1Test(BITJOIN,46)@5
    oFracXZwE_uid47_fpExpEM1Test_q <= sR_uid188_constMult_b & cstZeroWE_uid11_fpExpEM1Test_q;

	--msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test(BITSELECT,189)@5
    msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_in <= oFracXZwE_uid47_fpExpEM1Test_q;
    msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b <= msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_in(36 downto 36);

	--ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_b(DELAY,677)@5
    ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b, xout => ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx3Pad3_uid226_fxpInPostAlign_uid53_fpExpEM1Test(LOGICAL,225)@7
    rightShiftStage2Idx3Pad3_uid226_fxpInPostAlign_uid53_fpExpEM1Test_a <= z_uid225_fxpInPostAlign_uid53_fpExpEM1Test_q;
    rightShiftStage2Idx3Pad3_uid226_fxpInPostAlign_uid53_fpExpEM1Test_b <= STD_LOGIC_VECTOR((2 downto 1 => ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_b_q(0)) & ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_b_q);
    rightShiftStage2Idx3Pad3_uid226_fxpInPostAlign_uid53_fpExpEM1Test_q_i <= rightShiftStage2Idx3Pad3_uid226_fxpInPostAlign_uid53_fpExpEM1Test_a or rightShiftStage2Idx3Pad3_uid226_fxpInPostAlign_uid53_fpExpEM1Test_b;
    rightShiftStage2Idx3Pad3_uid226_fxpInPostAlign_uid53_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 3, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx3Pad3_uid226_fxpInPostAlign_uid53_fpExpEM1Test_q, xin => rightShiftStage2Idx3Pad3_uid226_fxpInPostAlign_uid53_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_b(DELAY,655)@5
    ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b, xout => ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3Pad12_uid212_fxpInPostAlign_uid53_fpExpEM1Test(LOGICAL,211)@6
    rightShiftStage1Idx3Pad12_uid212_fxpInPostAlign_uid53_fpExpEM1Test_a <= z_uid211_fxpInPostAlign_uid53_fpExpEM1Test_q;
    rightShiftStage1Idx3Pad12_uid212_fxpInPostAlign_uid53_fpExpEM1Test_b <= STD_LOGIC_VECTOR((11 downto 1 => ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_b_q(0)) & ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_b_q);
    rightShiftStage1Idx3Pad12_uid212_fxpInPostAlign_uid53_fpExpEM1Test_q_i <= rightShiftStage1Idx3Pad12_uid212_fxpInPostAlign_uid53_fpExpEM1Test_a or rightShiftStage1Idx3Pad12_uid212_fxpInPostAlign_uid53_fpExpEM1Test_b;
    rightShiftStage1Idx3Pad12_uid212_fxpInPostAlign_uid53_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 12, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx3Pad12_uid212_fxpInPostAlign_uid53_fpExpEM1Test_q, xin => rightShiftStage1Idx3Pad12_uid212_fxpInPostAlign_uid53_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--rightShiftStage0Idx3_uid199_fxpInPostAlign_uid53_fpExpEM1Test(CONSTANT,198)
    rightShiftStage0Idx3_uid199_fxpInPostAlign_uid53_fpExpEM1Test_q <= "0000000000000000000000000000000000000";

	--rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test(LOGICAL,199)@5
    rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test_a <= rightShiftStage0Idx3_uid199_fxpInPostAlign_uid53_fpExpEM1Test_q;
    rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test_b <= STD_LOGIC_VECTOR((36 downto 1 => msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b(0)) & msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b);
    rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test_q_i <= rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test_a or rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test_b;
    rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 37, depth => 1)
    PORT MAP (xout => rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test_q, xin => rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--rightShiftStage0Idx2Pad32_uid196_fxpInPostAlign_uid53_fpExpEM1Test(LOGICAL,195)@5
    rightShiftStage0Idx2Pad32_uid196_fxpInPostAlign_uid53_fpExpEM1Test_a <= z_uid195_fxpInPostAlign_uid53_fpExpEM1Test_q;
    rightShiftStage0Idx2Pad32_uid196_fxpInPostAlign_uid53_fpExpEM1Test_b <= STD_LOGIC_VECTOR((31 downto 1 => msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b(0)) & msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b);
    rightShiftStage0Idx2Pad32_uid196_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage0Idx2Pad32_uid196_fxpInPostAlign_uid53_fpExpEM1Test_a or rightShiftStage0Idx2Pad32_uid196_fxpInPostAlign_uid53_fpExpEM1Test_b;

	--X36dto32_uid197_fxpInPostAlign_uid53_fpExpEM1Test(BITSELECT,196)@5
    X36dto32_uid197_fxpInPostAlign_uid53_fpExpEM1Test_in <= oFracXZwE_uid47_fpExpEM1Test_q;
    X36dto32_uid197_fxpInPostAlign_uid53_fpExpEM1Test_b <= X36dto32_uid197_fxpInPostAlign_uid53_fpExpEM1Test_in(36 downto 32);

	--rightShiftStage0Idx2_uid198_fxpInPostAlign_uid53_fpExpEM1Test(BITJOIN,197)@5
    rightShiftStage0Idx2_uid198_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage0Idx2Pad32_uid196_fxpInPostAlign_uid53_fpExpEM1Test_q & X36dto32_uid197_fxpInPostAlign_uid53_fpExpEM1Test_b;

	--reg_rightShiftStage0Idx2_uid198_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_4(REG,372)@5
    reg_rightShiftStage0Idx2_uid198_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx2_uid198_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_4_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx2_uid198_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_4_q <= rightShiftStage0Idx2_uid198_fxpInPostAlign_uid53_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0Idx1Pad16_uid192_fxpInPostAlign_uid53_fpExpEM1Test(LOGICAL,191)@5
    rightShiftStage0Idx1Pad16_uid192_fxpInPostAlign_uid53_fpExpEM1Test_a <= z_uid191_fxpInPostAlign_uid53_fpExpEM1Test_q;
    rightShiftStage0Idx1Pad16_uid192_fxpInPostAlign_uid53_fpExpEM1Test_b <= STD_LOGIC_VECTOR((15 downto 1 => msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b(0)) & msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b);
    rightShiftStage0Idx1Pad16_uid192_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage0Idx1Pad16_uid192_fxpInPostAlign_uid53_fpExpEM1Test_a or rightShiftStage0Idx1Pad16_uid192_fxpInPostAlign_uid53_fpExpEM1Test_b;

	--X36dto16_uid193_fxpInPostAlign_uid53_fpExpEM1Test(BITSELECT,192)@5
    X36dto16_uid193_fxpInPostAlign_uid53_fpExpEM1Test_in <= oFracXZwE_uid47_fpExpEM1Test_q;
    X36dto16_uid193_fxpInPostAlign_uid53_fpExpEM1Test_b <= X36dto16_uid193_fxpInPostAlign_uid53_fpExpEM1Test_in(36 downto 16);

	--rightShiftStage0Idx1_uid194_fxpInPostAlign_uid53_fpExpEM1Test(BITJOIN,193)@5
    rightShiftStage0Idx1_uid194_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage0Idx1Pad16_uid192_fxpInPostAlign_uid53_fpExpEM1Test_q & X36dto16_uid193_fxpInPostAlign_uid53_fpExpEM1Test_b;

	--reg_rightShiftStage0Idx1_uid194_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_3(REG,371)@5
    reg_rightShiftStage0Idx1_uid194_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx1_uid194_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_3_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx1_uid194_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_3_q <= rightShiftStage0Idx1_uid194_fxpInPostAlign_uid53_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_oFracXZwE_uid47_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_2(REG,370)@5
    reg_oFracXZwE_uid47_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracXZwE_uid47_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracXZwE_uid47_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_2_q <= oFracXZwE_uid47_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_1(REG,369)@5
    reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_1_q <= rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test(MUX,201)@6
    rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_s <= reg_rightShiftStageSel5Dto4_uid201_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_1_q;
    rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test: PROCESS (rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_s, en, reg_oFracXZwE_uid47_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_2_q, reg_rightShiftStage0Idx1_uid194_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_3_q, reg_rightShiftStage0Idx2_uid198_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_4_q, rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test_q)
    BEGIN
            CASE rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_s IS
                  WHEN "00" => rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_q <= reg_oFracXZwE_uid47_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_2_q;
                  WHEN "01" => rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_q <= reg_rightShiftStage0Idx1_uid194_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_3_q;
                  WHEN "10" => rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_q <= reg_rightShiftStage0Idx2_uid198_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_4_q;
                  WHEN "11" => rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage0Idx3_uid200_fxpInPostAlign_uid53_fpExpEM1Test_q;
                  WHEN OTHERS => rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage036dto12_uid213_fxpInPostAlign_uid53_fpExpEM1Test(BITSELECT,212)@6
    RightShiftStage036dto12_uid213_fxpInPostAlign_uid53_fpExpEM1Test_in <= rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_q;
    RightShiftStage036dto12_uid213_fxpInPostAlign_uid53_fpExpEM1Test_b <= RightShiftStage036dto12_uid213_fxpInPostAlign_uid53_fpExpEM1Test_in(36 downto 12);

	--ld_RightShiftStage036dto12_uid213_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid214_fxpInPostAlign_uid53_fpExpEM1Test_a(DELAY,665)@6
    ld_RightShiftStage036dto12_uid213_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid214_fxpInPostAlign_uid53_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 25, depth => 1 )
    PORT MAP ( xin => RightShiftStage036dto12_uid213_fxpInPostAlign_uid53_fpExpEM1Test_b, xout => ld_RightShiftStage036dto12_uid213_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid214_fxpInPostAlign_uid53_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid214_fxpInPostAlign_uid53_fpExpEM1Test(BITJOIN,213)@7
    rightShiftStage1Idx3_uid214_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage1Idx3Pad12_uid212_fxpInPostAlign_uid53_fpExpEM1Test_q & ld_RightShiftStage036dto12_uid213_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid214_fxpInPostAlign_uid53_fpExpEM1Test_a_q;

	--rightShiftStage1Idx2Pad8_uid208_fxpInPostAlign_uid53_fpExpEM1Test(LOGICAL,207)@6
    rightShiftStage1Idx2Pad8_uid208_fxpInPostAlign_uid53_fpExpEM1Test_a <= cstZeroWE_uid11_fpExpEM1Test_q;
    rightShiftStage1Idx2Pad8_uid208_fxpInPostAlign_uid53_fpExpEM1Test_b <= STD_LOGIC_VECTOR((7 downto 1 => ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_b_q(0)) & ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_b_q);
    rightShiftStage1Idx2Pad8_uid208_fxpInPostAlign_uid53_fpExpEM1Test_q_i <= rightShiftStage1Idx2Pad8_uid208_fxpInPostAlign_uid53_fpExpEM1Test_a or rightShiftStage1Idx2Pad8_uid208_fxpInPostAlign_uid53_fpExpEM1Test_b;
    rightShiftStage1Idx2Pad8_uid208_fxpInPostAlign_uid53_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 8, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx2Pad8_uid208_fxpInPostAlign_uid53_fpExpEM1Test_q, xin => rightShiftStage1Idx2Pad8_uid208_fxpInPostAlign_uid53_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage036dto8_uid209_fxpInPostAlign_uid53_fpExpEM1Test(BITSELECT,208)@6
    RightShiftStage036dto8_uid209_fxpInPostAlign_uid53_fpExpEM1Test_in <= rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_q;
    RightShiftStage036dto8_uid209_fxpInPostAlign_uid53_fpExpEM1Test_b <= RightShiftStage036dto8_uid209_fxpInPostAlign_uid53_fpExpEM1Test_in(36 downto 8);

	--ld_RightShiftStage036dto8_uid209_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid210_fxpInPostAlign_uid53_fpExpEM1Test_a(DELAY,661)@6
    ld_RightShiftStage036dto8_uid209_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid210_fxpInPostAlign_uid53_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 29, depth => 1 )
    PORT MAP ( xin => RightShiftStage036dto8_uid209_fxpInPostAlign_uid53_fpExpEM1Test_b, xout => ld_RightShiftStage036dto8_uid209_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid210_fxpInPostAlign_uid53_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid210_fxpInPostAlign_uid53_fpExpEM1Test(BITJOIN,209)@7
    rightShiftStage1Idx2_uid210_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage1Idx2Pad8_uid208_fxpInPostAlign_uid53_fpExpEM1Test_q & ld_RightShiftStage036dto8_uid209_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid210_fxpInPostAlign_uid53_fpExpEM1Test_a_q;

	--rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test(LOGICAL,203)@6
    rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_a <= z_uid203_fxpInPostAlign_uid53_fpExpEM1Test_q;
    rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_b <= STD_LOGIC_VECTOR((3 downto 1 => ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_b_q(0)) & ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_b_q);
    rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_q_i <= rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_a or rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_b;
    rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 4, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_q, xin => rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage036dto4_uid205_fxpInPostAlign_uid53_fpExpEM1Test(BITSELECT,204)@6
    RightShiftStage036dto4_uid205_fxpInPostAlign_uid53_fpExpEM1Test_in <= rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_q;
    RightShiftStage036dto4_uid205_fxpInPostAlign_uid53_fpExpEM1Test_b <= RightShiftStage036dto4_uid205_fxpInPostAlign_uid53_fpExpEM1Test_in(36 downto 4);

	--ld_RightShiftStage036dto4_uid205_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid206_fxpInPostAlign_uid53_fpExpEM1Test_a(DELAY,657)@6
    ld_RightShiftStage036dto4_uid205_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid206_fxpInPostAlign_uid53_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 33, depth => 1 )
    PORT MAP ( xin => RightShiftStage036dto4_uid205_fxpInPostAlign_uid53_fpExpEM1Test_b, xout => ld_RightShiftStage036dto4_uid205_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid206_fxpInPostAlign_uid53_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid206_fxpInPostAlign_uid53_fpExpEM1Test(BITJOIN,205)@7
    rightShiftStage1Idx1_uid206_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage1Idx1Pad4_uid204_fxpInPostAlign_uid53_fpExpEM1Test_q & ld_RightShiftStage036dto4_uid205_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid206_fxpInPostAlign_uid53_fpExpEM1Test_a_q;

	--reg_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_2(REG,374)@6
    reg_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_2_q <= rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_1_a(DELAY,832)@5
    ld_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_b, xout => ld_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_1(REG,373)@6
    reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_1_q <= ld_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_b_to_reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test(MUX,215)@7
    rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_s <= reg_rightShiftStageSel3Dto2_uid215_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_1_q;
    rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test: PROCESS (rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_s, en, reg_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_2_q, rightShiftStage1Idx1_uid206_fxpInPostAlign_uid53_fpExpEM1Test_q, rightShiftStage1Idx2_uid210_fxpInPostAlign_uid53_fpExpEM1Test_q, rightShiftStage1Idx3_uid214_fxpInPostAlign_uid53_fpExpEM1Test_q)
    BEGIN
            CASE rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_s IS
                  WHEN "00" => rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_q <= reg_rightShiftStage0_uid202_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_2_q;
                  WHEN "01" => rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage1Idx1_uid206_fxpInPostAlign_uid53_fpExpEM1Test_q;
                  WHEN "10" => rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage1Idx2_uid210_fxpInPostAlign_uid53_fpExpEM1Test_q;
                  WHEN "11" => rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage1Idx3_uid214_fxpInPostAlign_uid53_fpExpEM1Test_q;
                  WHEN OTHERS => rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage136dto3_uid227_fxpInPostAlign_uid53_fpExpEM1Test(BITSELECT,226)@7
    RightShiftStage136dto3_uid227_fxpInPostAlign_uid53_fpExpEM1Test_in <= rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_q;
    RightShiftStage136dto3_uid227_fxpInPostAlign_uid53_fpExpEM1Test_b <= RightShiftStage136dto3_uid227_fxpInPostAlign_uid53_fpExpEM1Test_in(36 downto 3);

	--ld_RightShiftStage136dto3_uid227_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx3_uid228_fxpInPostAlign_uid53_fpExpEM1Test_a(DELAY,683)@7
    ld_RightShiftStage136dto3_uid227_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx3_uid228_fxpInPostAlign_uid53_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 34, depth => 1 )
    PORT MAP ( xin => RightShiftStage136dto3_uid227_fxpInPostAlign_uid53_fpExpEM1Test_b, xout => ld_RightShiftStage136dto3_uid227_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx3_uid228_fxpInPostAlign_uid53_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx3_uid228_fxpInPostAlign_uid53_fpExpEM1Test(BITJOIN,227)@8
    rightShiftStage2Idx3_uid228_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage2Idx3Pad3_uid226_fxpInPostAlign_uid53_fpExpEM1Test_q & ld_RightShiftStage136dto3_uid227_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx3_uid228_fxpInPostAlign_uid53_fpExpEM1Test_a_q;

	--rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test(LOGICAL,221)@7
    rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_a <= z_uid221_fxpInPostAlign_uid53_fpExpEM1Test_q;
    rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_b <= STD_LOGIC_VECTOR((1 downto 1 => ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_b_q(0)) & ld_msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_b_q);
    rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_q_i <= rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_a or rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_b;
    rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 2, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_q, xin => rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage136dto2_uid223_fxpInPostAlign_uid53_fpExpEM1Test(BITSELECT,222)@7
    RightShiftStage136dto2_uid223_fxpInPostAlign_uid53_fpExpEM1Test_in <= rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_q;
    RightShiftStage136dto2_uid223_fxpInPostAlign_uid53_fpExpEM1Test_b <= RightShiftStage136dto2_uid223_fxpInPostAlign_uid53_fpExpEM1Test_in(36 downto 2);

	--ld_RightShiftStage136dto2_uid223_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx2_uid224_fxpInPostAlign_uid53_fpExpEM1Test_a(DELAY,679)@7
    ld_RightShiftStage136dto2_uid223_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx2_uid224_fxpInPostAlign_uid53_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 35, depth => 1 )
    PORT MAP ( xin => RightShiftStage136dto2_uid223_fxpInPostAlign_uid53_fpExpEM1Test_b, xout => ld_RightShiftStage136dto2_uid223_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx2_uid224_fxpInPostAlign_uid53_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx2_uid224_fxpInPostAlign_uid53_fpExpEM1Test(BITJOIN,223)@8
    rightShiftStage2Idx2_uid224_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage2Idx2Pad2_uid222_fxpInPostAlign_uid53_fpExpEM1Test_q & ld_RightShiftStage136dto2_uid223_fxpInPostAlign_uid53_fpExpEM1Test_b_to_rightShiftStage2Idx2_uid224_fxpInPostAlign_uid53_fpExpEM1Test_a_q;

	--rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test(LOGICAL,217)@5
    rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_a <= GND_q;
    rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_b <= msbx_uid190_fxpInPostAlign_uid53_fpExpEM1Test_b;
    rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_q_i <= rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_a or rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_b;
    rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_q, xin => rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_q_to_rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test_b(DELAY,676)@6
    ld_rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_q_to_rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_q, xout => ld_rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_q_to_rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--RightShiftStage136dto1_uid219_fxpInPostAlign_uid53_fpExpEM1Test(BITSELECT,218)@7
    RightShiftStage136dto1_uid219_fxpInPostAlign_uid53_fpExpEM1Test_in <= rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_q;
    RightShiftStage136dto1_uid219_fxpInPostAlign_uid53_fpExpEM1Test_b <= RightShiftStage136dto1_uid219_fxpInPostAlign_uid53_fpExpEM1Test_in(36 downto 1);

	--rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test(BITJOIN,219)@7
    rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test_q <= ld_rightShiftStage2Idx1Pad1_uid218_fxpInPostAlign_uid53_fpExpEM1Test_q_to_rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test_b_q & RightShiftStage136dto1_uid219_fxpInPostAlign_uid53_fpExpEM1Test_b;

	--ld_rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test_q_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_d(DELAY,688)@7
    ld_rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test_q_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_d : dspba_delay
    GENERIC MAP ( width => 37, depth => 1 )
    PORT MAP ( xin => rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test_q, xout => ld_rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test_q_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_d_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_2(REG,376)@7
    reg_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_2_q <= rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_1(REG,375)@5
    reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_1_q <= rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_1_q_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_b(DELAY,686)@6
    ld_reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_1_q_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 2 )
    PORT MAP ( xin => reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_1_q, xout => ld_reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_1_q_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test(MUX,229)@8
    rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_s <= ld_reg_rightShiftStageSel1Dto0_uid229_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_1_q_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_b_q;
    rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test: PROCESS (rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_s, en, reg_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_2_q, ld_rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test_q_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_d_q, rightShiftStage2Idx2_uid224_fxpInPostAlign_uid53_fpExpEM1Test_q, rightShiftStage2Idx3_uid228_fxpInPostAlign_uid53_fpExpEM1Test_q)
    BEGIN
            CASE rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_s IS
                  WHEN "00" => rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_q <= reg_rightShiftStage1_uid216_fxpInPostAlign_uid53_fpExpEM1Test_0_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_2_q;
                  WHEN "01" => rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_q <= ld_rightShiftStage2Idx1_uid220_fxpInPostAlign_uid53_fpExpEM1Test_q_to_rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_d_q;
                  WHEN "10" => rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage2Idx2_uid224_fxpInPostAlign_uid53_fpExpEM1Test_q;
                  WHEN "11" => rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_q <= rightShiftStage2Idx3_uid228_fxpInPostAlign_uid53_fpExpEM1Test_q;
                  WHEN OTHERS => rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ePreRnd_uid54_fpExpEM1Test(BITSELECT,53)@8
    ePreRnd_uid54_fpExpEM1Test_in <= rightShiftStage2_uid230_fxpInPostAlign_uid53_fpExpEM1Test_q;
    ePreRnd_uid54_fpExpEM1Test_b <= ePreRnd_uid54_fpExpEM1Test_in(36 downto 26);

	--xv0_uid232_constMult(BITSELECT,231)@8
    xv0_uid232_constMult_in <= ePreRnd_uid54_fpExpEM1Test_b(5 downto 0);
    xv0_uid232_constMult_b <= xv0_uid232_constMult_in(5 downto 0);

	--reg_xv0_uid232_constMult_0_to_p0_uid235_constMult_0(REG,388)@8
    reg_xv0_uid232_constMult_0_to_p0_uid235_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv0_uid232_constMult_0_to_p0_uid235_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv0_uid232_constMult_0_to_p0_uid235_constMult_0_q <= xv0_uid232_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xv0_uid232_constMult_0_to_p0_uid235_constMult_0_q_to_p0_uid235_constMult_a(DELAY,694)@9
    ld_reg_xv0_uid232_constMult_0_to_p0_uid235_constMult_0_q_to_p0_uid235_constMult_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => reg_xv0_uid232_constMult_0_to_p0_uid235_constMult_0_q, xout => ld_reg_xv0_uid232_constMult_0_to_p0_uid235_constMult_0_q_to_p0_uid235_constMult_a_q, ena => en(0), clk => clk, aclr => areset );

	--p0_uid235_constMult(LOOKUP,234)@10
    p0_uid235_constMult: PROCESS (ld_reg_xv0_uid232_constMult_0_to_p0_uid235_constMult_0_q_to_p0_uid235_constMult_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_xv0_uid232_constMult_0_to_p0_uid235_constMult_0_q_to_p0_uid235_constMult_a_q) IS
                WHEN "000000" =>  p0_uid235_constMult_q <= "0000000000000000000000000000000000000000";
                WHEN "000001" =>  p0_uid235_constMult_q <= "0000001011000101110010000101111111011111";
                WHEN "000010" =>  p0_uid235_constMult_q <= "0000010110001011100100001011111110111110";
                WHEN "000011" =>  p0_uid235_constMult_q <= "0000100001010001010110010001111110011101";
                WHEN "000100" =>  p0_uid235_constMult_q <= "0000101100010111001000010111111101111100";
                WHEN "000101" =>  p0_uid235_constMult_q <= "0000110111011100111010011101111101011011";
                WHEN "000110" =>  p0_uid235_constMult_q <= "0001000010100010101100100011111100111010";
                WHEN "000111" =>  p0_uid235_constMult_q <= "0001001101101000011110101001111100011001";
                WHEN "001000" =>  p0_uid235_constMult_q <= "0001011000101110010000101111111011111000";
                WHEN "001001" =>  p0_uid235_constMult_q <= "0001100011110100000010110101111011010111";
                WHEN "001010" =>  p0_uid235_constMult_q <= "0001101110111001110100111011111010110110";
                WHEN "001011" =>  p0_uid235_constMult_q <= "0001111001111111100111000001111010010101";
                WHEN "001100" =>  p0_uid235_constMult_q <= "0010000101000101011001000111111001110100";
                WHEN "001101" =>  p0_uid235_constMult_q <= "0010010000001011001011001101111001010011";
                WHEN "001110" =>  p0_uid235_constMult_q <= "0010011011010000111101010011111000110010";
                WHEN "001111" =>  p0_uid235_constMult_q <= "0010100110010110101111011001111000010001";
                WHEN "010000" =>  p0_uid235_constMult_q <= "0010110001011100100001011111110111110000";
                WHEN "010001" =>  p0_uid235_constMult_q <= "0010111100100010010011100101110111001111";
                WHEN "010010" =>  p0_uid235_constMult_q <= "0011000111101000000101101011110110101110";
                WHEN "010011" =>  p0_uid235_constMult_q <= "0011010010101101110111110001110110001101";
                WHEN "010100" =>  p0_uid235_constMult_q <= "0011011101110011101001110111110101101100";
                WHEN "010101" =>  p0_uid235_constMult_q <= "0011101000111001011011111101110101001011";
                WHEN "010110" =>  p0_uid235_constMult_q <= "0011110011111111001110000011110100101010";
                WHEN "010111" =>  p0_uid235_constMult_q <= "0011111111000101000000001001110100001001";
                WHEN "011000" =>  p0_uid235_constMult_q <= "0100001010001010110010001111110011101000";
                WHEN "011001" =>  p0_uid235_constMult_q <= "0100010101010000100100010101110011000111";
                WHEN "011010" =>  p0_uid235_constMult_q <= "0100100000010110010110011011110010100110";
                WHEN "011011" =>  p0_uid235_constMult_q <= "0100101011011100001000100001110010000101";
                WHEN "011100" =>  p0_uid235_constMult_q <= "0100110110100001111010100111110001100100";
                WHEN "011101" =>  p0_uid235_constMult_q <= "0101000001100111101100101101110001000011";
                WHEN "011110" =>  p0_uid235_constMult_q <= "0101001100101101011110110011110000100010";
                WHEN "011111" =>  p0_uid235_constMult_q <= "0101010111110011010000111001110000000001";
                WHEN "100000" =>  p0_uid235_constMult_q <= "0101100010111001000010111111101111100000";
                WHEN "100001" =>  p0_uid235_constMult_q <= "0101101101111110110101000101101110111111";
                WHEN "100010" =>  p0_uid235_constMult_q <= "0101111001000100100111001011101110011110";
                WHEN "100011" =>  p0_uid235_constMult_q <= "0110000100001010011001010001101101111101";
                WHEN "100100" =>  p0_uid235_constMult_q <= "0110001111010000001011010111101101011100";
                WHEN "100101" =>  p0_uid235_constMult_q <= "0110011010010101111101011101101100111011";
                WHEN "100110" =>  p0_uid235_constMult_q <= "0110100101011011101111100011101100011010";
                WHEN "100111" =>  p0_uid235_constMult_q <= "0110110000100001100001101001101011111001";
                WHEN "101000" =>  p0_uid235_constMult_q <= "0110111011100111010011101111101011011000";
                WHEN "101001" =>  p0_uid235_constMult_q <= "0111000110101101000101110101101010110111";
                WHEN "101010" =>  p0_uid235_constMult_q <= "0111010001110010110111111011101010010110";
                WHEN "101011" =>  p0_uid235_constMult_q <= "0111011100111000101010000001101001110101";
                WHEN "101100" =>  p0_uid235_constMult_q <= "0111100111111110011100000111101001010100";
                WHEN "101101" =>  p0_uid235_constMult_q <= "0111110011000100001110001101101000110011";
                WHEN "101110" =>  p0_uid235_constMult_q <= "0111111110001010000000010011101000010010";
                WHEN "101111" =>  p0_uid235_constMult_q <= "1000001001001111110010011001100111110001";
                WHEN "110000" =>  p0_uid235_constMult_q <= "1000010100010101100100011111100111010000";
                WHEN "110001" =>  p0_uid235_constMult_q <= "1000011111011011010110100101100110101111";
                WHEN "110010" =>  p0_uid235_constMult_q <= "1000101010100001001000101011100110001110";
                WHEN "110011" =>  p0_uid235_constMult_q <= "1000110101100110111010110001100101101101";
                WHEN "110100" =>  p0_uid235_constMult_q <= "1001000000101100101100110111100101001100";
                WHEN "110101" =>  p0_uid235_constMult_q <= "1001001011110010011110111101100100101011";
                WHEN "110110" =>  p0_uid235_constMult_q <= "1001010110111000010001000011100100001010";
                WHEN "110111" =>  p0_uid235_constMult_q <= "1001100001111110000011001001100011101001";
                WHEN "111000" =>  p0_uid235_constMult_q <= "1001101101000011110101001111100011001000";
                WHEN "111001" =>  p0_uid235_constMult_q <= "1001111000001001100111010101100010100111";
                WHEN "111010" =>  p0_uid235_constMult_q <= "1010000011001111011001011011100010000110";
                WHEN "111011" =>  p0_uid235_constMult_q <= "1010001110010101001011100001100001100101";
                WHEN "111100" =>  p0_uid235_constMult_q <= "1010011001011010111101100111100001000100";
                WHEN "111101" =>  p0_uid235_constMult_q <= "1010100100100000101111101101100000100011";
                WHEN "111110" =>  p0_uid235_constMult_q <= "1010101111100110100001110011100000000010";
                WHEN "111111" =>  p0_uid235_constMult_q <= "1010111010101100010011111001011111100001";
                WHEN OTHERS =>
                    p0_uid235_constMult_q <= "0000000000000000000000000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv1_uid233_constMult(BITSELECT,232)@8
    xv1_uid233_constMult_in <= ePreRnd_uid54_fpExpEM1Test_b;
    xv1_uid233_constMult_b <= xv1_uid233_constMult_in(10 downto 6);

	--reg_xv1_uid233_constMult_0_to_p1_uid234_constMult_0(REG,387)@8
    reg_xv1_uid233_constMult_0_to_p1_uid234_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv1_uid233_constMult_0_to_p1_uid234_constMult_0_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv1_uid233_constMult_0_to_p1_uid234_constMult_0_q <= xv1_uid233_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--p1_uid234_constMult(LOOKUP,233)@9
    p1_uid234_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p1_uid234_constMult_q <= "000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_xv1_uid233_constMult_0_to_p1_uid234_constMult_0_q) IS
                WHEN "00000" =>  p1_uid234_constMult_q <= "000000000000000000000000000000000000000000000";
                WHEN "00001" =>  p1_uid234_constMult_q <= "000001011000101110010000101111111011111000000";
                WHEN "00010" =>  p1_uid234_constMult_q <= "000010110001011100100001011111110111110000000";
                WHEN "00011" =>  p1_uid234_constMult_q <= "000100001010001010110010001111110011101000000";
                WHEN "00100" =>  p1_uid234_constMult_q <= "000101100010111001000010111111101111100000000";
                WHEN "00101" =>  p1_uid234_constMult_q <= "000110111011100111010011101111101011011000000";
                WHEN "00110" =>  p1_uid234_constMult_q <= "001000010100010101100100011111100111010000000";
                WHEN "00111" =>  p1_uid234_constMult_q <= "001001101101000011110101001111100011001000000";
                WHEN "01000" =>  p1_uid234_constMult_q <= "001011000101110010000101111111011111000000000";
                WHEN "01001" =>  p1_uid234_constMult_q <= "001100011110100000010110101111011010111000000";
                WHEN "01010" =>  p1_uid234_constMult_q <= "001101110111001110100111011111010110110000000";
                WHEN "01011" =>  p1_uid234_constMult_q <= "001111001111111100111000001111010010101000000";
                WHEN "01100" =>  p1_uid234_constMult_q <= "010000101000101011001000111111001110100000000";
                WHEN "01101" =>  p1_uid234_constMult_q <= "010010000001011001011001101111001010011000000";
                WHEN "01110" =>  p1_uid234_constMult_q <= "010011011010000111101010011111000110010000000";
                WHEN "01111" =>  p1_uid234_constMult_q <= "010100110010110101111011001111000010001000000";
                WHEN "10000" =>  p1_uid234_constMult_q <= "101001110100011011110100000001000010000000000";
                WHEN "10001" =>  p1_uid234_constMult_q <= "101011001101001010000100110000111101111000000";
                WHEN "10010" =>  p1_uid234_constMult_q <= "101100100101111000010101100000111001110000000";
                WHEN "10011" =>  p1_uid234_constMult_q <= "101101111110100110100110010000110101101000000";
                WHEN "10100" =>  p1_uid234_constMult_q <= "101111010111010100110111000000110001100000000";
                WHEN "10101" =>  p1_uid234_constMult_q <= "110000110000000011000111110000101101011000000";
                WHEN "10110" =>  p1_uid234_constMult_q <= "110010001000110001011000100000101001010000000";
                WHEN "10111" =>  p1_uid234_constMult_q <= "110011100001011111101001010000100101001000000";
                WHEN "11000" =>  p1_uid234_constMult_q <= "110100111010001101111010000000100001000000000";
                WHEN "11001" =>  p1_uid234_constMult_q <= "110110010010111100001010110000011100111000000";
                WHEN "11010" =>  p1_uid234_constMult_q <= "110111101011101010011011100000011000110000000";
                WHEN "11011" =>  p1_uid234_constMult_q <= "111001000100011000101100010000010100101000000";
                WHEN "11100" =>  p1_uid234_constMult_q <= "111010011101000110111101000000010000100000000";
                WHEN "11101" =>  p1_uid234_constMult_q <= "111011110101110101001101110000001100011000000";
                WHEN "11110" =>  p1_uid234_constMult_q <= "111101001110100011011110100000001000010000000";
                WHEN "11111" =>  p1_uid234_constMult_q <= "111110100111010001101111010000000100001000000";
                WHEN OTHERS =>
                    p1_uid234_constMult_q <= "000000000000000000000000000000000000000000000";
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--lev1_a0_uid236_constMult(ADD,235)@10
    lev1_a0_uid236_constMult_a <= STD_LOGIC_VECTOR((46 downto 45 => p1_uid234_constMult_q(44)) & p1_uid234_constMult_q);
    lev1_a0_uid236_constMult_b <= STD_LOGIC_VECTOR('0' & "000000" & p0_uid235_constMult_q);
            lev1_a0_uid236_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0_uid236_constMult_a) + SIGNED(lev1_a0_uid236_constMult_b));
    lev1_a0_uid236_constMult_q <= lev1_a0_uid236_constMult_o(45 downto 0);


	--sR_uid237_constMult(BITSELECT,236)@10
    sR_uid237_constMult_in <= lev1_a0_uid236_constMult_q(44 downto 0);
    sR_uid237_constMult_b <= sR_uid237_constMult_in(44 downto 2);

	--reg_sR_uid237_constMult_0_to_yExt_uid65_fpExpEM1Test_1(REG,390)@10
    reg_sR_uid237_constMult_0_to_yExt_uid65_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sR_uid237_constMult_0_to_yExt_uid65_fpExpEM1Test_1_q <= "0000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sR_uid237_constMult_0_to_yExt_uid65_fpExpEM1Test_1_q <= sR_uid237_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--pad_fxpInPostAlignR_X_uid65_uid65_fpExpEM1Test(BITJOIN,64)@10
    pad_fxpInPostAlignR_X_uid65_uid65_fpExpEM1Test_q <= rightShiftStage2_uid279_fxpInPostAlign_X_uid64_fpExpEM1Test_q & STD_LOGIC_VECTOR((7 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_fxpInPostAlignR_X_uid65_uid65_fpExpEM1Test_0_to_yExt_uid65_fpExpEM1Test_0(REG,389)@10
    reg_pad_fxpInPostAlignR_X_uid65_uid65_fpExpEM1Test_0_to_yExt_uid65_fpExpEM1Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_fxpInPostAlignR_X_uid65_uid65_fpExpEM1Test_0_to_yExt_uid65_fpExpEM1Test_0_q <= "000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_fxpInPostAlignR_X_uid65_uid65_fpExpEM1Test_0_to_yExt_uid65_fpExpEM1Test_0_q <= pad_fxpInPostAlignR_X_uid65_uid65_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--yExt_uid65_fpExpEM1Test(SUB,65)@11
    yExt_uid65_fpExpEM1Test_a <= STD_LOGIC_VECTOR((43 downto 42 => reg_pad_fxpInPostAlignR_X_uid65_uid65_fpExpEM1Test_0_to_yExt_uid65_fpExpEM1Test_0_q(41)) & reg_pad_fxpInPostAlignR_X_uid65_uid65_fpExpEM1Test_0_to_yExt_uid65_fpExpEM1Test_0_q);
    yExt_uid65_fpExpEM1Test_b <= STD_LOGIC_VECTOR((43 downto 43 => reg_sR_uid237_constMult_0_to_yExt_uid65_fpExpEM1Test_1_q(42)) & reg_sR_uid237_constMult_0_to_yExt_uid65_fpExpEM1Test_1_q);
            yExt_uid65_fpExpEM1Test_o <= STD_LOGIC_VECTOR(SIGNED(yExt_uid65_fpExpEM1Test_a) - SIGNED(yExt_uid65_fpExpEM1Test_b));
    yExt_uid65_fpExpEM1Test_q <= yExt_uid65_fpExpEM1Test_o(43 downto 0);


	--yRed_uid69_fpExpEM1Test(BITSELECT,68)@11
    yRed_uid69_fpExpEM1Test_in <= yExt_uid65_fpExpEM1Test_q(31 downto 0);
    yRed_uid69_fpExpEM1Test_b <= yRed_uid69_fpExpEM1Test_in(31 downto 6);

	--reg_yRed_uid69_fpExpEM1Test_0_to_yRedPostMux_uid70_fpExpEM1Test_2(REG,392)@11
    reg_yRed_uid69_fpExpEM1Test_0_to_yRedPostMux_uid70_fpExpEM1Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yRed_uid69_fpExpEM1Test_0_to_yRedPostMux_uid70_fpExpEM1Test_2_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yRed_uid69_fpExpEM1Test_0_to_yRedPostMux_uid70_fpExpEM1Test_2_q <= yRed_uid69_fpExpEM1Test_b;
            END IF;
        END IF;
    END PROCESS;


	--YExt43_uid67_fpExpEM1Test(BITSELECT,66)@11
    YExt43_uid67_fpExpEM1Test_in <= yExt_uid65_fpExpEM1Test_q;
    YExt43_uid67_fpExpEM1Test_b <= YExt43_uid67_fpExpEM1Test_in(43 downto 43);

	--reg_YExt43_uid67_fpExpEM1Test_0_to_yRedPostMux_uid70_fpExpEM1Test_1(REG,391)@11
    reg_YExt43_uid67_fpExpEM1Test_0_to_yRedPostMux_uid70_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_YExt43_uid67_fpExpEM1Test_0_to_yRedPostMux_uid70_fpExpEM1Test_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_YExt43_uid67_fpExpEM1Test_0_to_yRedPostMux_uid70_fpExpEM1Test_1_q <= YExt43_uid67_fpExpEM1Test_b;
            END IF;
        END IF;
    END PROCESS;


	--yRedPostMux_uid70_fpExpEM1Test(MUX,69)@12
    yRedPostMux_uid70_fpExpEM1Test_s <= reg_YExt43_uid67_fpExpEM1Test_0_to_yRedPostMux_uid70_fpExpEM1Test_1_q;
    yRedPostMux_uid70_fpExpEM1Test: PROCESS (yRedPostMux_uid70_fpExpEM1Test_s, en, reg_yRed_uid69_fpExpEM1Test_0_to_yRedPostMux_uid70_fpExpEM1Test_2_q, zY_uid68_fpExpEM1Test_q)
    BEGIN
            CASE yRedPostMux_uid70_fpExpEM1Test_s IS
                  WHEN "0" => yRedPostMux_uid70_fpExpEM1Test_q <= reg_yRed_uid69_fpExpEM1Test_0_to_yRedPostMux_uid70_fpExpEM1Test_2_q;
                  WHEN "1" => yRedPostMux_uid70_fpExpEM1Test_q <= zY_uid68_fpExpEM1Test_q;
                  WHEN OTHERS => yRedPostMux_uid70_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--addr_uid72_fpExpEM1Test(BITSELECT,71)@12
    addr_uid72_fpExpEM1Test_in <= yRedPostMux_uid70_fpExpEM1Test_q;
    addr_uid72_fpExpEM1Test_b <= addr_uid72_fpExpEM1Test_in(25 downto 19);

	--reg_addr_uid72_fpExpEM1Test_0_to_memoryC2_uid285_exp10TabGen_0(REG,393)@12
    reg_addr_uid72_fpExpEM1Test_0_to_memoryC2_uid285_exp10TabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid72_fpExpEM1Test_0_to_memoryC2_uid285_exp10TabGen_0_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid72_fpExpEM1Test_0_to_memoryC2_uid285_exp10TabGen_0_q <= addr_uid72_fpExpEM1Test_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid285_exp10TabGen(LOOKUP,284)@13
    memoryC2_uid285_exp10TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC2_uid285_exp10TabGen_q <= "00100000000111";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_addr_uid72_fpExpEM1Test_0_to_memoryC2_uid285_exp10TabGen_0_q) IS
                WHEN "0000000" =>  memoryC2_uid285_exp10TabGen_q <= "00100000000111";
                WHEN "0000001" =>  memoryC2_uid285_exp10TabGen_q <= "00100000011010";
                WHEN "0000010" =>  memoryC2_uid285_exp10TabGen_q <= "00100000101001";
                WHEN "0000011" =>  memoryC2_uid285_exp10TabGen_q <= "00100000111001";
                WHEN "0000100" =>  memoryC2_uid285_exp10TabGen_q <= "00100001001001";
                WHEN "0000101" =>  memoryC2_uid285_exp10TabGen_q <= "00100001011000";
                WHEN "0000110" =>  memoryC2_uid285_exp10TabGen_q <= "00100001101010";
                WHEN "0000111" =>  memoryC2_uid285_exp10TabGen_q <= "00100001111101";
                WHEN "0001000" =>  memoryC2_uid285_exp10TabGen_q <= "00100010001100";
                WHEN "0001001" =>  memoryC2_uid285_exp10TabGen_q <= "00100010011101";
                WHEN "0001010" =>  memoryC2_uid285_exp10TabGen_q <= "00100010101111";
                WHEN "0001011" =>  memoryC2_uid285_exp10TabGen_q <= "00100011000001";
                WHEN "0001100" =>  memoryC2_uid285_exp10TabGen_q <= "00100011010010";
                WHEN "0001101" =>  memoryC2_uid285_exp10TabGen_q <= "00100011100100";
                WHEN "0001110" =>  memoryC2_uid285_exp10TabGen_q <= "00100011110110";
                WHEN "0001111" =>  memoryC2_uid285_exp10TabGen_q <= "00100100000111";
                WHEN "0010000" =>  memoryC2_uid285_exp10TabGen_q <= "00100100011010";
                WHEN "0010001" =>  memoryC2_uid285_exp10TabGen_q <= "00100100101011";
                WHEN "0010010" =>  memoryC2_uid285_exp10TabGen_q <= "00100100111110";
                WHEN "0010011" =>  memoryC2_uid285_exp10TabGen_q <= "00100101010001";
                WHEN "0010100" =>  memoryC2_uid285_exp10TabGen_q <= "00100101100100";
                WHEN "0010101" =>  memoryC2_uid285_exp10TabGen_q <= "00100101110111";
                WHEN "0010110" =>  memoryC2_uid285_exp10TabGen_q <= "00100110001000";
                WHEN "0010111" =>  memoryC2_uid285_exp10TabGen_q <= "00100110011110";
                WHEN "0011000" =>  memoryC2_uid285_exp10TabGen_q <= "00100110101111";
                WHEN "0011001" =>  memoryC2_uid285_exp10TabGen_q <= "00100111000101";
                WHEN "0011010" =>  memoryC2_uid285_exp10TabGen_q <= "00100111011000";
                WHEN "0011011" =>  memoryC2_uid285_exp10TabGen_q <= "00100111101001";
                WHEN "0011100" =>  memoryC2_uid285_exp10TabGen_q <= "00101000000000";
                WHEN "0011101" =>  memoryC2_uid285_exp10TabGen_q <= "00101000010011";
                WHEN "0011110" =>  memoryC2_uid285_exp10TabGen_q <= "00101000101000";
                WHEN "0011111" =>  memoryC2_uid285_exp10TabGen_q <= "00101000111100";
                WHEN "0100000" =>  memoryC2_uid285_exp10TabGen_q <= "00101001001110";
                WHEN "0100001" =>  memoryC2_uid285_exp10TabGen_q <= "00101001100101";
                WHEN "0100010" =>  memoryC2_uid285_exp10TabGen_q <= "00101001111000";
                WHEN "0100011" =>  memoryC2_uid285_exp10TabGen_q <= "00101010001111";
                WHEN "0100100" =>  memoryC2_uid285_exp10TabGen_q <= "00101010100011";
                WHEN "0100101" =>  memoryC2_uid285_exp10TabGen_q <= "00101010111000";
                WHEN "0100110" =>  memoryC2_uid285_exp10TabGen_q <= "00101011001100";
                WHEN "0100111" =>  memoryC2_uid285_exp10TabGen_q <= "00101011100100";
                WHEN "0101000" =>  memoryC2_uid285_exp10TabGen_q <= "00101011111100";
                WHEN "0101001" =>  memoryC2_uid285_exp10TabGen_q <= "00101100001111";
                WHEN "0101010" =>  memoryC2_uid285_exp10TabGen_q <= "00101100100111";
                WHEN "0101011" =>  memoryC2_uid285_exp10TabGen_q <= "00101100111100";
                WHEN "0101100" =>  memoryC2_uid285_exp10TabGen_q <= "00101101010010";
                WHEN "0101101" =>  memoryC2_uid285_exp10TabGen_q <= "00101101101011";
                WHEN "0101110" =>  memoryC2_uid285_exp10TabGen_q <= "00101110000010";
                WHEN "0101111" =>  memoryC2_uid285_exp10TabGen_q <= "00101110011010";
                WHEN "0110000" =>  memoryC2_uid285_exp10TabGen_q <= "00101110101111";
                WHEN "0110001" =>  memoryC2_uid285_exp10TabGen_q <= "00101111000101";
                WHEN "0110010" =>  memoryC2_uid285_exp10TabGen_q <= "00101111100000";
                WHEN "0110011" =>  memoryC2_uid285_exp10TabGen_q <= "00101111111000";
                WHEN "0110100" =>  memoryC2_uid285_exp10TabGen_q <= "00110000001101";
                WHEN "0110101" =>  memoryC2_uid285_exp10TabGen_q <= "00110000101000";
                WHEN "0110110" =>  memoryC2_uid285_exp10TabGen_q <= "00110000111110";
                WHEN "0110111" =>  memoryC2_uid285_exp10TabGen_q <= "00110001011001";
                WHEN "0111000" =>  memoryC2_uid285_exp10TabGen_q <= "00110001110000";
                WHEN "0111001" =>  memoryC2_uid285_exp10TabGen_q <= "00110010001010";
                WHEN "0111010" =>  memoryC2_uid285_exp10TabGen_q <= "00110010100010";
                WHEN "0111011" =>  memoryC2_uid285_exp10TabGen_q <= "00110010111100";
                WHEN "0111100" =>  memoryC2_uid285_exp10TabGen_q <= "00110011010110";
                WHEN "0111101" =>  memoryC2_uid285_exp10TabGen_q <= "00110011110000";
                WHEN "0111110" =>  memoryC2_uid285_exp10TabGen_q <= "00110100000111";
                WHEN "0111111" =>  memoryC2_uid285_exp10TabGen_q <= "00110100100011";
                WHEN "1000000" =>  memoryC2_uid285_exp10TabGen_q <= "00110100111101";
                WHEN "1000001" =>  memoryC2_uid285_exp10TabGen_q <= "00110101011001";
                WHEN "1000010" =>  memoryC2_uid285_exp10TabGen_q <= "00110101110011";
                WHEN "1000011" =>  memoryC2_uid285_exp10TabGen_q <= "00110110001110";
                WHEN "1000100" =>  memoryC2_uid285_exp10TabGen_q <= "00110110101001";
                WHEN "1000101" =>  memoryC2_uid285_exp10TabGen_q <= "00110111000101";
                WHEN "1000110" =>  memoryC2_uid285_exp10TabGen_q <= "00110111100000";
                WHEN "1000111" =>  memoryC2_uid285_exp10TabGen_q <= "00110111111011";
                WHEN "1001000" =>  memoryC2_uid285_exp10TabGen_q <= "00111000011010";
                WHEN "1001001" =>  memoryC2_uid285_exp10TabGen_q <= "00111000110100";
                WHEN "1001010" =>  memoryC2_uid285_exp10TabGen_q <= "00111001010001";
                WHEN "1001011" =>  memoryC2_uid285_exp10TabGen_q <= "00111001101110";
                WHEN "1001100" =>  memoryC2_uid285_exp10TabGen_q <= "00111010001010";
                WHEN "1001101" =>  memoryC2_uid285_exp10TabGen_q <= "00111010100111";
                WHEN "1001110" =>  memoryC2_uid285_exp10TabGen_q <= "00111011000111";
                WHEN "1001111" =>  memoryC2_uid285_exp10TabGen_q <= "00111011100000";
                WHEN "1010000" =>  memoryC2_uid285_exp10TabGen_q <= "00111100000010";
                WHEN "1010001" =>  memoryC2_uid285_exp10TabGen_q <= "00111100011110";
                WHEN "1010010" =>  memoryC2_uid285_exp10TabGen_q <= "00111101000000";
                WHEN "1010011" =>  memoryC2_uid285_exp10TabGen_q <= "00111101011101";
                WHEN "1010100" =>  memoryC2_uid285_exp10TabGen_q <= "00111101111010";
                WHEN "1010101" =>  memoryC2_uid285_exp10TabGen_q <= "00111110011011";
                WHEN "1010110" =>  memoryC2_uid285_exp10TabGen_q <= "00111110111010";
                WHEN "1010111" =>  memoryC2_uid285_exp10TabGen_q <= "00111111011001";
                WHEN "1011000" =>  memoryC2_uid285_exp10TabGen_q <= "00111111111010";
                WHEN "1011001" =>  memoryC2_uid285_exp10TabGen_q <= "01000000010111";
                WHEN "1011010" =>  memoryC2_uid285_exp10TabGen_q <= "01000000111001";
                WHEN "1011011" =>  memoryC2_uid285_exp10TabGen_q <= "01000001011011";
                WHEN "1011100" =>  memoryC2_uid285_exp10TabGen_q <= "01000001111011";
                WHEN "1011101" =>  memoryC2_uid285_exp10TabGen_q <= "01000010011100";
                WHEN "1011110" =>  memoryC2_uid285_exp10TabGen_q <= "01000010111111";
                WHEN "1011111" =>  memoryC2_uid285_exp10TabGen_q <= "01000011011111";
                WHEN "1100000" =>  memoryC2_uid285_exp10TabGen_q <= "01000100000011";
                WHEN "1100001" =>  memoryC2_uid285_exp10TabGen_q <= "01000100100001";
                WHEN "1100010" =>  memoryC2_uid285_exp10TabGen_q <= "01000101000100";
                WHEN "1100011" =>  memoryC2_uid285_exp10TabGen_q <= "01000101101001";
                WHEN "1100100" =>  memoryC2_uid285_exp10TabGen_q <= "01000110001100";
                WHEN "1100101" =>  memoryC2_uid285_exp10TabGen_q <= "01000110101111";
                WHEN "1100110" =>  memoryC2_uid285_exp10TabGen_q <= "01000111010010";
                WHEN "1100111" =>  memoryC2_uid285_exp10TabGen_q <= "01000111110101";
                WHEN "1101000" =>  memoryC2_uid285_exp10TabGen_q <= "01001000011010";
                WHEN "1101001" =>  memoryC2_uid285_exp10TabGen_q <= "01001000111100";
                WHEN "1101010" =>  memoryC2_uid285_exp10TabGen_q <= "01001001100100";
                WHEN "1101011" =>  memoryC2_uid285_exp10TabGen_q <= "01001010000110";
                WHEN "1101100" =>  memoryC2_uid285_exp10TabGen_q <= "01001010101110";
                WHEN "1101101" =>  memoryC2_uid285_exp10TabGen_q <= "01001011010001";
                WHEN "1101110" =>  memoryC2_uid285_exp10TabGen_q <= "01001011111000";
                WHEN "1101111" =>  memoryC2_uid285_exp10TabGen_q <= "01001100011101";
                WHEN "1110000" =>  memoryC2_uid285_exp10TabGen_q <= "01001101000100";
                WHEN "1110001" =>  memoryC2_uid285_exp10TabGen_q <= "01001101101101";
                WHEN "1110010" =>  memoryC2_uid285_exp10TabGen_q <= "01001110010100";
                WHEN "1110011" =>  memoryC2_uid285_exp10TabGen_q <= "01001110111000";
                WHEN "1110100" =>  memoryC2_uid285_exp10TabGen_q <= "01001111100010";
                WHEN "1110101" =>  memoryC2_uid285_exp10TabGen_q <= "01010000000111";
                WHEN "1110110" =>  memoryC2_uid285_exp10TabGen_q <= "01010000110001";
                WHEN "1110111" =>  memoryC2_uid285_exp10TabGen_q <= "01010001011001";
                WHEN "1111000" =>  memoryC2_uid285_exp10TabGen_q <= "01010010000010";
                WHEN "1111001" =>  memoryC2_uid285_exp10TabGen_q <= "01010010101011";
                WHEN "1111010" =>  memoryC2_uid285_exp10TabGen_q <= "01010011010101";
                WHEN "1111011" =>  memoryC2_uid285_exp10TabGen_q <= "01010100000000";
                WHEN "1111100" =>  memoryC2_uid285_exp10TabGen_q <= "01010100101010";
                WHEN "1111101" =>  memoryC2_uid285_exp10TabGen_q <= "01010101010101";
                WHEN "1111110" =>  memoryC2_uid285_exp10TabGen_q <= "01010101111111";
                WHEN "1111111" =>  memoryC2_uid285_exp10TabGen_q <= "01010110101001";
                WHEN OTHERS =>
                    memoryC2_uid285_exp10TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--ld_yRedPostMux_uid70_fpExpEM1Test_q_to_yPPolyEval_uid73_fpExpEM1Test_a(DELAY,488)@12
    ld_yRedPostMux_uid70_fpExpEM1Test_q_to_yPPolyEval_uid73_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => yRedPostMux_uid70_fpExpEM1Test_q, xout => ld_yRedPostMux_uid70_fpExpEM1Test_q_to_yPPolyEval_uid73_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--yPPolyEval_uid73_fpExpEM1Test(BITSELECT,72)@13
    yPPolyEval_uid73_fpExpEM1Test_in <= ld_yRedPostMux_uid70_fpExpEM1Test_q_to_yPPolyEval_uid73_fpExpEM1Test_a_q(18 downto 0);
    yPPolyEval_uid73_fpExpEM1Test_b <= yPPolyEval_uid73_fpExpEM1Test_in(18 downto 0);

	--yT1_uid287_exp10PolyEval(BITSELECT,286)@13
    yT1_uid287_exp10PolyEval_in <= yPPolyEval_uid73_fpExpEM1Test_b;
    yT1_uid287_exp10PolyEval_b <= yT1_uid287_exp10PolyEval_in(18 downto 5);

	--reg_yT1_uid287_exp10PolyEval_0_to_prodXY_uid348_pT1_uid288_exp10PolyEval_0(REG,394)@13
    reg_yT1_uid287_exp10PolyEval_0_to_prodXY_uid348_pT1_uid288_exp10PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid287_exp10PolyEval_0_to_prodXY_uid348_pT1_uid288_exp10PolyEval_0_q <= "00000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid287_exp10PolyEval_0_to_prodXY_uid348_pT1_uid288_exp10PolyEval_0_q <= yT1_uid287_exp10PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid348_pT1_uid288_exp10PolyEval(MULT,347)@14
    prodXY_uid348_pT1_uid288_exp10PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid348_pT1_uid288_exp10PolyEval_a),15)) * SIGNED(prodXY_uid348_pT1_uid288_exp10PolyEval_b);
    prodXY_uid348_pT1_uid288_exp10PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid348_pT1_uid288_exp10PolyEval_a <= (others => '0');
            prodXY_uid348_pT1_uid288_exp10PolyEval_b <= (others => '0');
            prodXY_uid348_pT1_uid288_exp10PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid348_pT1_uid288_exp10PolyEval_a <= reg_yT1_uid287_exp10PolyEval_0_to_prodXY_uid348_pT1_uid288_exp10PolyEval_0_q;
                prodXY_uid348_pT1_uid288_exp10PolyEval_b <= memoryC2_uid285_exp10TabGen_q;
                prodXY_uid348_pT1_uid288_exp10PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid348_pT1_uid288_exp10PolyEval_pr,28));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid348_pT1_uid288_exp10PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid348_pT1_uid288_exp10PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid348_pT1_uid288_exp10PolyEval_q <= prodXY_uid348_pT1_uid288_exp10PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid349_pT1_uid288_exp10PolyEval(BITSELECT,348)@17
    prodXYTruncFR_uid349_pT1_uid288_exp10PolyEval_in <= prodXY_uid348_pT1_uid288_exp10PolyEval_q;
    prodXYTruncFR_uid349_pT1_uid288_exp10PolyEval_b <= prodXYTruncFR_uid349_pT1_uid288_exp10PolyEval_in(27 downto 13);

	--highBBits_uid290_exp10PolyEval(BITSELECT,289)@17
    highBBits_uid290_exp10PolyEval_in <= prodXYTruncFR_uid349_pT1_uid288_exp10PolyEval_b;
    highBBits_uid290_exp10PolyEval_b <= highBBits_uid290_exp10PolyEval_in(14 downto 1);

	--ld_reg_addr_uid72_fpExpEM1Test_0_to_memoryC1_uid283_exp10TabGen_0_q_to_memoryC1_uid283_exp10TabGen_a(DELAY,748)@13
    ld_reg_addr_uid72_fpExpEM1Test_0_to_memoryC1_uid283_exp10TabGen_0_q_to_memoryC1_uid283_exp10TabGen_a : dspba_delay
    GENERIC MAP ( width => 7, depth => 3 )
    PORT MAP ( xin => reg_addr_uid72_fpExpEM1Test_0_to_memoryC2_uid285_exp10TabGen_0_q, xout => ld_reg_addr_uid72_fpExpEM1Test_0_to_memoryC1_uid283_exp10TabGen_0_q_to_memoryC1_uid283_exp10TabGen_a_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid283_exp10TabGen(LOOKUP,282)@16
    memoryC1_uid283_exp10TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC1_uid283_exp10TabGen_q <= "0001111111111111111110";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_addr_uid72_fpExpEM1Test_0_to_memoryC1_uid283_exp10TabGen_0_q_to_memoryC1_uid283_exp10TabGen_a_q) IS
                WHEN "0000000" =>  memoryC1_uid283_exp10TabGen_q <= "0001111111111111111110";
                WHEN "0000001" =>  memoryC1_uid283_exp10TabGen_q <= "0010000001000000001011";
                WHEN "0000010" =>  memoryC1_uid283_exp10TabGen_q <= "0010000010000000111101";
                WHEN "0000011" =>  memoryC1_uid283_exp10TabGen_q <= "0010000011000010001110";
                WHEN "0000100" =>  memoryC1_uid283_exp10TabGen_q <= "0010000100000100000000";
                WHEN "0000101" =>  memoryC1_uid283_exp10TabGen_q <= "0010000101000110010100";
                WHEN "0000110" =>  memoryC1_uid283_exp10TabGen_q <= "0010000110001001000110";
                WHEN "0000111" =>  memoryC1_uid283_exp10TabGen_q <= "0010000111001100011010";
                WHEN "0001000" =>  memoryC1_uid283_exp10TabGen_q <= "0010001000010000010011";
                WHEN "0001001" =>  memoryC1_uid283_exp10TabGen_q <= "0010001001010100101101";
                WHEN "0001010" =>  memoryC1_uid283_exp10TabGen_q <= "0010001010011001101000";
                WHEN "0001011" =>  memoryC1_uid283_exp10TabGen_q <= "0010001011011111000101";
                WHEN "0001100" =>  memoryC1_uid283_exp10TabGen_q <= "0010001100100101000111";
                WHEN "0001101" =>  memoryC1_uid283_exp10TabGen_q <= "0010001101101011101011";
                WHEN "0001110" =>  memoryC1_uid283_exp10TabGen_q <= "0010001110110010110010";
                WHEN "0001111" =>  memoryC1_uid283_exp10TabGen_q <= "0010001111111010011110";
                WHEN "0010000" =>  memoryC1_uid283_exp10TabGen_q <= "0010010001000010101100";
                WHEN "0010001" =>  memoryC1_uid283_exp10TabGen_q <= "0010010010001011100010";
                WHEN "0010010" =>  memoryC1_uid283_exp10TabGen_q <= "0010010011010100111001";
                WHEN "0010011" =>  memoryC1_uid283_exp10TabGen_q <= "0010010100011110110110";
                WHEN "0010100" =>  memoryC1_uid283_exp10TabGen_q <= "0010010101101001010111";
                WHEN "0010101" =>  memoryC1_uid283_exp10TabGen_q <= "0010010110110100011111";
                WHEN "0010110" =>  memoryC1_uid283_exp10TabGen_q <= "0010011000000000001101";
                WHEN "0010111" =>  memoryC1_uid283_exp10TabGen_q <= "0010011001001100011110";
                WHEN "0011000" =>  memoryC1_uid283_exp10TabGen_q <= "0010011010011001011001";
                WHEN "0011001" =>  memoryC1_uid283_exp10TabGen_q <= "0010011011100110110111";
                WHEN "0011010" =>  memoryC1_uid283_exp10TabGen_q <= "0010011100110100111111";
                WHEN "0011011" =>  memoryC1_uid283_exp10TabGen_q <= "0010011110000011101111";
                WHEN "0011100" =>  memoryC1_uid283_exp10TabGen_q <= "0010011111010011000010";
                WHEN "0011101" =>  memoryC1_uid283_exp10TabGen_q <= "0010100000100011000001";
                WHEN "0011110" =>  memoryC1_uid283_exp10TabGen_q <= "0010100001110011100110";
                WHEN "0011111" =>  memoryC1_uid283_exp10TabGen_q <= "0010100011000100110100";
                WHEN "0100000" =>  memoryC1_uid283_exp10TabGen_q <= "0010100100010110101101";
                WHEN "0100001" =>  memoryC1_uid283_exp10TabGen_q <= "0010100101101001001011";
                WHEN "0100010" =>  memoryC1_uid283_exp10TabGen_q <= "0010100110111100010110";
                WHEN "0100011" =>  memoryC1_uid283_exp10TabGen_q <= "0010101000010000000111";
                WHEN "0100100" =>  memoryC1_uid283_exp10TabGen_q <= "0010101001100100100110";
                WHEN "0100101" =>  memoryC1_uid283_exp10TabGen_q <= "0010101010111001101110";
                WHEN "0100110" =>  memoryC1_uid283_exp10TabGen_q <= "0010101100001111100001";
                WHEN "0100111" =>  memoryC1_uid283_exp10TabGen_q <= "0010101101100101111100";
                WHEN "0101000" =>  memoryC1_uid283_exp10TabGen_q <= "0010101110111101000011";
                WHEN "0101001" =>  memoryC1_uid283_exp10TabGen_q <= "0010110000010100111010";
                WHEN "0101010" =>  memoryC1_uid283_exp10TabGen_q <= "0010110001101101011001";
                WHEN "0101011" =>  memoryC1_uid283_exp10TabGen_q <= "0010110011000110101000";
                WHEN "0101100" =>  memoryC1_uid283_exp10TabGen_q <= "0010110100100000100010";
                WHEN "0101101" =>  memoryC1_uid283_exp10TabGen_q <= "0010110101111011000110";
                WHEN "0101110" =>  memoryC1_uid283_exp10TabGen_q <= "0010110111010110011010";
                WHEN "0101111" =>  memoryC1_uid283_exp10TabGen_q <= "0010111000110010011100";
                WHEN "0110000" =>  memoryC1_uid283_exp10TabGen_q <= "0010111010001111001111";
                WHEN "0110001" =>  memoryC1_uid283_exp10TabGen_q <= "0010111011101100101111";
                WHEN "0110010" =>  memoryC1_uid283_exp10TabGen_q <= "0010111101001010111010";
                WHEN "0110011" =>  memoryC1_uid283_exp10TabGen_q <= "0010111110101001110111";
                WHEN "0110100" =>  memoryC1_uid283_exp10TabGen_q <= "0011000000001001100110";
                WHEN "0110101" =>  memoryC1_uid283_exp10TabGen_q <= "0011000001101010000001";
                WHEN "0110110" =>  memoryC1_uid283_exp10TabGen_q <= "0011000011001011010000";
                WHEN "0110111" =>  memoryC1_uid283_exp10TabGen_q <= "0011000100101101001100";
                WHEN "0111000" =>  memoryC1_uid283_exp10TabGen_q <= "0011000110001111111101";
                WHEN "0111001" =>  memoryC1_uid283_exp10TabGen_q <= "0011000111110011011100";
                WHEN "0111010" =>  memoryC1_uid283_exp10TabGen_q <= "0011001001010111110000";
                WHEN "0111011" =>  memoryC1_uid283_exp10TabGen_q <= "0011001010111100110101";
                WHEN "0111100" =>  memoryC1_uid283_exp10TabGen_q <= "0011001100100010101100";
                WHEN "0111101" =>  memoryC1_uid283_exp10TabGen_q <= "0011001110001001010111";
                WHEN "0111110" =>  memoryC1_uid283_exp10TabGen_q <= "0011001111110000111001";
                WHEN "0111111" =>  memoryC1_uid283_exp10TabGen_q <= "0011010001011001001001";
                WHEN "1000000" =>  memoryC1_uid283_exp10TabGen_q <= "0011010011000010010000";
                WHEN "1000001" =>  memoryC1_uid283_exp10TabGen_q <= "0011010100101100001011";
                WHEN "1000010" =>  memoryC1_uid283_exp10TabGen_q <= "0011010110010110111101";
                WHEN "1000011" =>  memoryC1_uid283_exp10TabGen_q <= "0011011000000010100011";
                WHEN "1000100" =>  memoryC1_uid283_exp10TabGen_q <= "0011011001101111000000";
                WHEN "1000101" =>  memoryC1_uid283_exp10TabGen_q <= "0011011011011100010010";
                WHEN "1000110" =>  memoryC1_uid283_exp10TabGen_q <= "0011011101001010011100";
                WHEN "1000111" =>  memoryC1_uid283_exp10TabGen_q <= "0011011110111001011110";
                WHEN "1001000" =>  memoryC1_uid283_exp10TabGen_q <= "0011100000101001010011";
                WHEN "1001001" =>  memoryC1_uid283_exp10TabGen_q <= "0011100010011010000111";
                WHEN "1001010" =>  memoryC1_uid283_exp10TabGen_q <= "0011100100001011110000";
                WHEN "1001011" =>  memoryC1_uid283_exp10TabGen_q <= "0011100101111110010010";
                WHEN "1001100" =>  memoryC1_uid283_exp10TabGen_q <= "0011100111110001101111";
                WHEN "1001101" =>  memoryC1_uid283_exp10TabGen_q <= "0011101001100110000101";
                WHEN "1001110" =>  memoryC1_uid283_exp10TabGen_q <= "0011101011011011010010";
                WHEN "1001111" =>  memoryC1_uid283_exp10TabGen_q <= "0011101101010001100010";
                WHEN "1010000" =>  memoryC1_uid283_exp10TabGen_q <= "0011101111001000100101";
                WHEN "1010001" =>  memoryC1_uid283_exp10TabGen_q <= "0011110001000000101001";
                WHEN "1010010" =>  memoryC1_uid283_exp10TabGen_q <= "0011110010111001100100";
                WHEN "1010011" =>  memoryC1_uid283_exp10TabGen_q <= "0011110100110011100001";
                WHEN "1010100" =>  memoryC1_uid283_exp10TabGen_q <= "0011110110101110011011";
                WHEN "1010101" =>  memoryC1_uid283_exp10TabGen_q <= "0011111000101010001111";
                WHEN "1010110" =>  memoryC1_uid283_exp10TabGen_q <= "0011111010100111000011";
                WHEN "1010111" =>  memoryC1_uid283_exp10TabGen_q <= "0011111100100100110111";
                WHEN "1011000" =>  memoryC1_uid283_exp10TabGen_q <= "0011111110100011101000";
                WHEN "1011001" =>  memoryC1_uid283_exp10TabGen_q <= "0100000000100011011101";
                WHEN "1011010" =>  memoryC1_uid283_exp10TabGen_q <= "0100000010100100001101";
                WHEN "1011011" =>  memoryC1_uid283_exp10TabGen_q <= "0100000100100101111110";
                WHEN "1011100" =>  memoryC1_uid283_exp10TabGen_q <= "0100000110101000110010";
                WHEN "1011101" =>  memoryC1_uid283_exp10TabGen_q <= "0100001000101100101000";
                WHEN "1011110" =>  memoryC1_uid283_exp10TabGen_q <= "0100001010110001011110";
                WHEN "1011111" =>  memoryC1_uid283_exp10TabGen_q <= "0100001100110111011010";
                WHEN "1100000" =>  memoryC1_uid283_exp10TabGen_q <= "0100001110111110010101";
                WHEN "1100001" =>  memoryC1_uid283_exp10TabGen_q <= "0100010001000110011010";
                WHEN "1100010" =>  memoryC1_uid283_exp10TabGen_q <= "0100010011001111011111";
                WHEN "1100011" =>  memoryC1_uid283_exp10TabGen_q <= "0100010101011001100111";
                WHEN "1100100" =>  memoryC1_uid283_exp10TabGen_q <= "0100010111100100110110";
                WHEN "1100101" =>  memoryC1_uid283_exp10TabGen_q <= "0100011001110001001100";
                WHEN "1100110" =>  memoryC1_uid283_exp10TabGen_q <= "0100011011111110101000";
                WHEN "1100111" =>  memoryC1_uid283_exp10TabGen_q <= "0100011110001101001100";
                WHEN "1101000" =>  memoryC1_uid283_exp10TabGen_q <= "0100100000011100110110";
                WHEN "1101001" =>  memoryC1_uid283_exp10TabGen_q <= "0100100010101101101011";
                WHEN "1101010" =>  memoryC1_uid283_exp10TabGen_q <= "0100100100111111100011";
                WHEN "1101011" =>  memoryC1_uid283_exp10TabGen_q <= "0100100111010010101010";
                WHEN "1101100" =>  memoryC1_uid283_exp10TabGen_q <= "0100101001100110110110";
                WHEN "1101101" =>  memoryC1_uid283_exp10TabGen_q <= "0100101011111100010001";
                WHEN "1101110" =>  memoryC1_uid283_exp10TabGen_q <= "0100101110010010110011";
                WHEN "1101111" =>  memoryC1_uid283_exp10TabGen_q <= "0100110000101010100011";
                WHEN "1110000" =>  memoryC1_uid283_exp10TabGen_q <= "0100110011000011011111";
                WHEN "1110001" =>  memoryC1_uid283_exp10TabGen_q <= "0100110101011101100100";
                WHEN "1110010" =>  memoryC1_uid283_exp10TabGen_q <= "0100110111111000111010";
                WHEN "1110011" =>  memoryC1_uid283_exp10TabGen_q <= "0100111010010101100001";
                WHEN "1110100" =>  memoryC1_uid283_exp10TabGen_q <= "0100111100110011010001";
                WHEN "1110101" =>  memoryC1_uid283_exp10TabGen_q <= "0100111111010010010101";
                WHEN "1110110" =>  memoryC1_uid283_exp10TabGen_q <= "0101000001110010100100";
                WHEN "1110111" =>  memoryC1_uid283_exp10TabGen_q <= "0101000100010100000110";
                WHEN "1111000" =>  memoryC1_uid283_exp10TabGen_q <= "0101000110110110111001";
                WHEN "1111001" =>  memoryC1_uid283_exp10TabGen_q <= "0101001001011010111101";
                WHEN "1111010" =>  memoryC1_uid283_exp10TabGen_q <= "0101001100000000010100";
                WHEN "1111011" =>  memoryC1_uid283_exp10TabGen_q <= "0101001110100110111100";
                WHEN "1111100" =>  memoryC1_uid283_exp10TabGen_q <= "0101010001001110111010";
                WHEN "1111101" =>  memoryC1_uid283_exp10TabGen_q <= "0101010011111000001011";
                WHEN "1111110" =>  memoryC1_uid283_exp10TabGen_q <= "0101010110100010110010";
                WHEN "1111111" =>  memoryC1_uid283_exp10TabGen_q <= "0101011001001110110000";
                WHEN OTHERS =>
                    memoryC1_uid283_exp10TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid291_exp10PolyEval(ADD,290)@17
    sumAHighB_uid291_exp10PolyEval_a <= STD_LOGIC_VECTOR((22 downto 22 => memoryC1_uid283_exp10TabGen_q(21)) & memoryC1_uid283_exp10TabGen_q);
    sumAHighB_uid291_exp10PolyEval_b <= STD_LOGIC_VECTOR((22 downto 14 => highBBits_uid290_exp10PolyEval_b(13)) & highBBits_uid290_exp10PolyEval_b);
            sumAHighB_uid291_exp10PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid291_exp10PolyEval_a) + SIGNED(sumAHighB_uid291_exp10PolyEval_b));
    sumAHighB_uid291_exp10PolyEval_q <= sumAHighB_uid291_exp10PolyEval_o(22 downto 0);


	--lowRangeB_uid289_exp10PolyEval(BITSELECT,288)@17
    lowRangeB_uid289_exp10PolyEval_in <= prodXYTruncFR_uid349_pT1_uid288_exp10PolyEval_b(0 downto 0);
    lowRangeB_uid289_exp10PolyEval_b <= lowRangeB_uid289_exp10PolyEval_in(0 downto 0);

	--s1_uid289_uid292_exp10PolyEval(BITJOIN,291)@17
    s1_uid289_uid292_exp10PolyEval_q <= sumAHighB_uid291_exp10PolyEval_q & lowRangeB_uid289_exp10PolyEval_b;

	--reg_s1_uid289_uid292_exp10PolyEval_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_1(REG,397)@17
    reg_s1_uid289_uid292_exp10PolyEval_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid289_uid292_exp10PolyEval_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_1_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid289_uid292_exp10PolyEval_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_1_q <= s1_uid289_uid292_exp10PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_nor(LOGICAL,1016)
    ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_nor_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q;
    ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_nor_b <= ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_sticky_ena_q;
    ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_nor_q <= not (ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_nor_a or ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_nor_b);

	--ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_sticky_ena(REG,1017)
    ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_nor_q = "1") THEN
                ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_sticky_ena_q <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_enaAnd(LOGICAL,1018)
    ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_enaAnd_a <= ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_sticky_ena_q;
    ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_enaAnd_b <= en;
    ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_enaAnd_q <= ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_enaAnd_a and ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_enaAnd_b;

	--ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_inputreg(DELAY,1008)
    ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 19, depth => 1 )
    PORT MAP ( xin => yPPolyEval_uid73_fpExpEM1Test_b, xout => ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem(DUALMEM,1009)
    ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_ia <= ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_inputreg_q;
    ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_aa <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdreg_q;
    ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_ab <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdmux_q;
    ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 19,
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
        clocken1 => ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_iq,
        address_a => ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_aa,
        data_a => ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_ia
    );
    ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_reset0 <= areset;
        ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_q <= ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_iq(18 downto 0);

	--reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0(REG,396)@17
    reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_q <= "0000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_q <= ld_yPPolyEval_uid73_fpExpEM1Test_b_to_reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid351_pT2_uid294_exp10PolyEval(MULT,350)@18
    prodXY_uid351_pT2_uid294_exp10PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid351_pT2_uid294_exp10PolyEval_a),20)) * SIGNED(prodXY_uid351_pT2_uid294_exp10PolyEval_b);
    prodXY_uid351_pT2_uid294_exp10PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid351_pT2_uid294_exp10PolyEval_a <= (others => '0');
            prodXY_uid351_pT2_uid294_exp10PolyEval_b <= (others => '0');
            prodXY_uid351_pT2_uid294_exp10PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid351_pT2_uid294_exp10PolyEval_a <= reg_yPPolyEval_uid73_fpExpEM1Test_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_0_q;
                prodXY_uid351_pT2_uid294_exp10PolyEval_b <= reg_s1_uid289_uid292_exp10PolyEval_0_to_prodXY_uid351_pT2_uid294_exp10PolyEval_1_q;
                prodXY_uid351_pT2_uid294_exp10PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid351_pT2_uid294_exp10PolyEval_pr,43));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid351_pT2_uid294_exp10PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid351_pT2_uid294_exp10PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid351_pT2_uid294_exp10PolyEval_q <= prodXY_uid351_pT2_uid294_exp10PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid352_pT2_uid294_exp10PolyEval(BITSELECT,351)@21
    prodXYTruncFR_uid352_pT2_uid294_exp10PolyEval_in <= prodXY_uid351_pT2_uid294_exp10PolyEval_q;
    prodXYTruncFR_uid352_pT2_uid294_exp10PolyEval_b <= prodXYTruncFR_uid352_pT2_uid294_exp10PolyEval_in(42 downto 18);

	--highBBits_uid296_exp10PolyEval(BITSELECT,295)@21
    highBBits_uid296_exp10PolyEval_in <= prodXYTruncFR_uid352_pT2_uid294_exp10PolyEval_b;
    highBBits_uid296_exp10PolyEval_b <= highBBits_uid296_exp10PolyEval_in(24 downto 2);

	--ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_nor(LOGICAL,1029)
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_nor_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q;
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_nor_b <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_sticky_ena_q;
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_nor_q <= not (ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_nor_a or ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_nor_b);

	--ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_sticky_ena(REG,1030)
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_nor_q = "1") THEN
                ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_sticky_ena_q <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_enaAnd(LOGICAL,1031)
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_enaAnd_a <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_sticky_ena_q;
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_enaAnd_b <= en;
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_enaAnd_q <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_enaAnd_a and ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_enaAnd_b;

	--ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_inputreg(DELAY,1019)
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => addr_uid72_fpExpEM1Test_b, xout => ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem(DUALMEM,1020)
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_ia <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_inputreg_q;
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_aa <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdreg_q;
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_ab <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_rdmux_q;
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_iq,
        address_a => ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_aa,
        data_a => ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_ia
    );
    ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_reset0 <= areset;
        ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_q <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_iq(6 downto 0);

	--reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0(REG,398)@19
    reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_q <= ld_addr_uid72_fpExpEM1Test_b_to_reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid281_exp10TabGen(LOOKUP,280)@20
    memoryC0_uid281_exp10TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC0_uid281_exp10TabGen_q <= "00100000000000000000000000100";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_addr_uid72_fpExpEM1Test_0_to_memoryC0_uid281_exp10TabGen_0_q) IS
                WHEN "0000000" =>  memoryC0_uid281_exp10TabGen_q <= "00100000000000000000000000100";
                WHEN "0000001" =>  memoryC0_uid281_exp10TabGen_q <= "00100000010000000100000001010";
                WHEN "0000010" =>  memoryC0_uid281_exp10TabGen_q <= "00100000100000010000000101111";
                WHEN "0000011" =>  memoryC0_uid281_exp10TabGen_q <= "00100000110000100100010010101";
                WHEN "0000100" =>  memoryC0_uid281_exp10TabGen_q <= "00100001000001000000101011100";
                WHEN "0000101" =>  memoryC0_uid281_exp10TabGen_q <= "00100001010001100101010100101";
                WHEN "0000110" =>  memoryC0_uid281_exp10TabGen_q <= "00100001100010010010010010010";
                WHEN "0000111" =>  memoryC0_uid281_exp10TabGen_q <= "00100001110011000111101000011";
                WHEN "0001000" =>  memoryC0_uid281_exp10TabGen_q <= "00100010000100000101011011010";
                WHEN "0001001" =>  memoryC0_uid281_exp10TabGen_q <= "00100010010101001011101111001";
                WHEN "0001010" =>  memoryC0_uid281_exp10TabGen_q <= "00100010100110011010101000011";
                WHEN "0001011" =>  memoryC0_uid281_exp10TabGen_q <= "00100010110111110010001011010";
                WHEN "0001100" =>  memoryC0_uid281_exp10TabGen_q <= "00100011001001010010011100000";
                WHEN "0001101" =>  memoryC0_uid281_exp10TabGen_q <= "00100011011010111011011111001";
                WHEN "0001110" =>  memoryC0_uid281_exp10TabGen_q <= "00100011101100101101011001000";
                WHEN "0001111" =>  memoryC0_uid281_exp10TabGen_q <= "00100011111110101000001110000";
                WHEN "0010000" =>  memoryC0_uid281_exp10TabGen_q <= "00100100010000101100000010110";
                WHEN "0010001" =>  memoryC0_uid281_exp10TabGen_q <= "00100100100010111000111011100";
                WHEN "0010010" =>  memoryC0_uid281_exp10TabGen_q <= "00100100110101001110111101001";
                WHEN "0010011" =>  memoryC0_uid281_exp10TabGen_q <= "00100101000111101110001100000";
                WHEN "0010100" =>  memoryC0_uid281_exp10TabGen_q <= "00100101011010010110101100111";
                WHEN "0010101" =>  memoryC0_uid281_exp10TabGen_q <= "00100101101101001000100100010";
                WHEN "0010110" =>  memoryC0_uid281_exp10TabGen_q <= "00100110000000000011110111000";
                WHEN "0010111" =>  memoryC0_uid281_exp10TabGen_q <= "00100110010011001000101001110";
                WHEN "0011000" =>  memoryC0_uid281_exp10TabGen_q <= "00100110100110010111000001010";
                WHEN "0011001" =>  memoryC0_uid281_exp10TabGen_q <= "00100110111001101111000010011";
                WHEN "0011010" =>  memoryC0_uid281_exp10TabGen_q <= "00100111001101010000110001111";
                WHEN "0011011" =>  memoryC0_uid281_exp10TabGen_q <= "00100111100000111100010100110";
                WHEN "0011100" =>  memoryC0_uid281_exp10TabGen_q <= "00100111110100110001101111111";
                WHEN "0011101" =>  memoryC0_uid281_exp10TabGen_q <= "00101000001000110001001000001";
                WHEN "0011110" =>  memoryC0_uid281_exp10TabGen_q <= "00101000011100111010100010101";
                WHEN "0011111" =>  memoryC0_uid281_exp10TabGen_q <= "00101000110001001110000100011";
                WHEN "0100000" =>  memoryC0_uid281_exp10TabGen_q <= "00101001000101101011110010011";
                WHEN "0100001" =>  memoryC0_uid281_exp10TabGen_q <= "00101001011010010011110001111";
                WHEN "0100010" =>  memoryC0_uid281_exp10TabGen_q <= "00101001101111000110000111111";
                WHEN "0100011" =>  memoryC0_uid281_exp10TabGen_q <= "00101010000100000010111001110";
                WHEN "0100100" =>  memoryC0_uid281_exp10TabGen_q <= "00101010011001001010001100100";
                WHEN "0100101" =>  memoryC0_uid281_exp10TabGen_q <= "00101010101110011100000101101";
                WHEN "0100110" =>  memoryC0_uid281_exp10TabGen_q <= "00101011000011111000101010011";
                WHEN "0100111" =>  memoryC0_uid281_exp10TabGen_q <= "00101011011001100000000000001";
                WHEN "0101000" =>  memoryC0_uid281_exp10TabGen_q <= "00101011101111010010001100010";
                WHEN "0101001" =>  memoryC0_uid281_exp10TabGen_q <= "00101100000101001111010100001";
                WHEN "0101010" =>  memoryC0_uid281_exp10TabGen_q <= "00101100011011010111011101011";
                WHEN "0101011" =>  memoryC0_uid281_exp10TabGen_q <= "00101100110001101010101101011";
                WHEN "0101100" =>  memoryC0_uid281_exp10TabGen_q <= "00101101001000001001001001111";
                WHEN "0101101" =>  memoryC0_uid281_exp10TabGen_q <= "00101101011110110010111000100";
                WHEN "0101110" =>  memoryC0_uid281_exp10TabGen_q <= "00101101110101100111111110110";
                WHEN "0101111" =>  memoryC0_uid281_exp10TabGen_q <= "00101110001100101000100010011";
                WHEN "0110000" =>  memoryC0_uid281_exp10TabGen_q <= "00101110100011110100101001001";
                WHEN "0110001" =>  memoryC0_uid281_exp10TabGen_q <= "00101110111011001100011000111";
                WHEN "0110010" =>  memoryC0_uid281_exp10TabGen_q <= "00101111010010101111110111100";
                WHEN "0110011" =>  memoryC0_uid281_exp10TabGen_q <= "00101111101010011111001010110";
                WHEN "0110100" =>  memoryC0_uid281_exp10TabGen_q <= "00110000000010011010011000101";
                WHEN "0110101" =>  memoryC0_uid281_exp10TabGen_q <= "00110000011010100001100111001";
                WHEN "0110110" =>  memoryC0_uid281_exp10TabGen_q <= "00110000110010110100111100010";
                WHEN "0110111" =>  memoryC0_uid281_exp10TabGen_q <= "00110001001011010100011110001";
                WHEN "0111000" =>  memoryC0_uid281_exp10TabGen_q <= "00110001100100000000010010110";
                WHEN "0111001" =>  memoryC0_uid281_exp10TabGen_q <= "00110001111100111000100000100";
                WHEN "0111010" =>  memoryC0_uid281_exp10TabGen_q <= "00110010010101111101001101011";
                WHEN "0111011" =>  memoryC0_uid281_exp10TabGen_q <= "00110010101111001110011111110";
                WHEN "0111100" =>  memoryC0_uid281_exp10TabGen_q <= "00110011001000101100011110000";
                WHEN "0111101" =>  memoryC0_uid281_exp10TabGen_q <= "00110011100010010111001110011";
                WHEN "0111110" =>  memoryC0_uid281_exp10TabGen_q <= "00110011111100001110110111010";
                WHEN "0111111" =>  memoryC0_uid281_exp10TabGen_q <= "00110100010110010011011111011";
                WHEN "1000000" =>  memoryC0_uid281_exp10TabGen_q <= "00110100110000100101001101000";
                WHEN "1000001" =>  memoryC0_uid281_exp10TabGen_q <= "00110101001011000100000110110";
                WHEN "1000010" =>  memoryC0_uid281_exp10TabGen_q <= "00110101100101110000010011010";
                WHEN "1000011" =>  memoryC0_uid281_exp10TabGen_q <= "00110110000000101001111001010";
                WHEN "1000100" =>  memoryC0_uid281_exp10TabGen_q <= "00110110011011110000111111011";
                WHEN "1000101" =>  memoryC0_uid281_exp10TabGen_q <= "00110110110111000101101100100";
                WHEN "1000110" =>  memoryC0_uid281_exp10TabGen_q <= "00110111010010101000000111011";
                WHEN "1000111" =>  memoryC0_uid281_exp10TabGen_q <= "00110111101110011000010110111";
                WHEN "1001000" =>  memoryC0_uid281_exp10TabGen_q <= "00111000001010010110100010001";
                WHEN "1001001" =>  memoryC0_uid281_exp10TabGen_q <= "00111000100110100010101111110";
                WHEN "1001010" =>  memoryC0_uid281_exp10TabGen_q <= "00111001000010111101000111001";
                WHEN "1001011" =>  memoryC0_uid281_exp10TabGen_q <= "00111001011111100101101111010";
                WHEN "1001100" =>  memoryC0_uid281_exp10TabGen_q <= "00111001111100011100101111010";
                WHEN "1001101" =>  memoryC0_uid281_exp10TabGen_q <= "00111010011001100010001110011";
                WHEN "1001110" =>  memoryC0_uid281_exp10TabGen_q <= "00111010110110110110010100000";
                WHEN "1001111" =>  memoryC0_uid281_exp10TabGen_q <= "00111011010100011001000111001";
                WHEN "1010000" =>  memoryC0_uid281_exp10TabGen_q <= "00111011110010001010101111100";
                WHEN "1010001" =>  memoryC0_uid281_exp10TabGen_q <= "00111100010000001011010100011";
                WHEN "1010010" =>  memoryC0_uid281_exp10TabGen_q <= "00111100101110011010111101011";
                WHEN "1010011" =>  memoryC0_uid281_exp10TabGen_q <= "00111101001100111001110001111";
                WHEN "1010100" =>  memoryC0_uid281_exp10TabGen_q <= "00111101101011100111111001101";
                WHEN "1010101" =>  memoryC0_uid281_exp10TabGen_q <= "00111110001010100101011100011";
                WHEN "1010110" =>  memoryC0_uid281_exp10TabGen_q <= "00111110101001110010100001110";
                WHEN "1010111" =>  memoryC0_uid281_exp10TabGen_q <= "00111111001001001111010001100";
                WHEN "1011000" =>  memoryC0_uid281_exp10TabGen_q <= "00111111101000111011110011101";
                WHEN "1011001" =>  memoryC0_uid281_exp10TabGen_q <= "01000000001000111000001111111";
                WHEN "1011010" =>  memoryC0_uid281_exp10TabGen_q <= "01000000101001000100101110100";
                WHEN "1011011" =>  memoryC0_uid281_exp10TabGen_q <= "01000001001001100001010111011";
                WHEN "1011100" =>  memoryC0_uid281_exp10TabGen_q <= "01000001101010001110010010101";
                WHEN "1011101" =>  memoryC0_uid281_exp10TabGen_q <= "01000010001011001011101000011";
                WHEN "1011110" =>  memoryC0_uid281_exp10TabGen_q <= "01000010101100011001100001000";
                WHEN "1011111" =>  memoryC0_uid281_exp10TabGen_q <= "01000011001101111000000100101";
                WHEN "1100000" =>  memoryC0_uid281_exp10TabGen_q <= "01000011101111100111011011111";
                WHEN "1100001" =>  memoryC0_uid281_exp10TabGen_q <= "01000100010001100111101110111";
                WHEN "1100010" =>  memoryC0_uid281_exp10TabGen_q <= "01000100110011111001000110011";
                WHEN "1100011" =>  memoryC0_uid281_exp10TabGen_q <= "01000101010110011011101010111";
                WHEN "1100100" =>  memoryC0_uid281_exp10TabGen_q <= "01000101111001001111100101000";
                WHEN "1100101" =>  memoryC0_uid281_exp10TabGen_q <= "01000110011100010100111101011";
                WHEN "1100110" =>  memoryC0_uid281_exp10TabGen_q <= "01000110111111101011111100111";
                WHEN "1100111" =>  memoryC0_uid281_exp10TabGen_q <= "01000111100011010100101100010";
                WHEN "1101000" =>  memoryC0_uid281_exp10TabGen_q <= "01001000000111001111010100100";
                WHEN "1101001" =>  memoryC0_uid281_exp10TabGen_q <= "01001000101011011011111110100";
                WHEN "1101010" =>  memoryC0_uid281_exp10TabGen_q <= "01001001001111111010110011100";
                WHEN "1101011" =>  memoryC0_uid281_exp10TabGen_q <= "01001001110100101011111100011";
                WHEN "1101100" =>  memoryC0_uid281_exp10TabGen_q <= "01001010011001101111100010100";
                WHEN "1101101" =>  memoryC0_uid281_exp10TabGen_q <= "01001010111111000101101111000";
                WHEN "1101110" =>  memoryC0_uid281_exp10TabGen_q <= "01001011100100101110101011011";
                WHEN "1101111" =>  memoryC0_uid281_exp10TabGen_q <= "01001100001010101010100000111";
                WHEN "1110000" =>  memoryC0_uid281_exp10TabGen_q <= "01001100110000111001011001000";
                WHEN "1110001" =>  memoryC0_uid281_exp10TabGen_q <= "01001101010111011011011101100";
                WHEN "1110010" =>  memoryC0_uid281_exp10TabGen_q <= "01001101111110010000110111110";
                WHEN "1110011" =>  memoryC0_uid281_exp10TabGen_q <= "01001110100101011001110001100";
                WHEN "1110100" =>  memoryC0_uid281_exp10TabGen_q <= "01001111001100110110010100110";
                WHEN "1110101" =>  memoryC0_uid281_exp10TabGen_q <= "01001111110100100110101011001";
                WHEN "1110110" =>  memoryC0_uid281_exp10TabGen_q <= "01010000011100101010111110110";
                WHEN "1110111" =>  memoryC0_uid281_exp10TabGen_q <= "01010001000101000011011001100";
                WHEN "1111000" =>  memoryC0_uid281_exp10TabGen_q <= "01010001101101110000000101100";
                WHEN "1111001" =>  memoryC0_uid281_exp10TabGen_q <= "01010010010110110001001101000";
                WHEN "1111010" =>  memoryC0_uid281_exp10TabGen_q <= "01010011000000000110111010001";
                WHEN "1111011" =>  memoryC0_uid281_exp10TabGen_q <= "01010011101001110001010111011";
                WHEN "1111100" =>  memoryC0_uid281_exp10TabGen_q <= "01010100010011110000101111000";
                WHEN "1111101" =>  memoryC0_uid281_exp10TabGen_q <= "01010100111110000101001011101";
                WHEN "1111110" =>  memoryC0_uid281_exp10TabGen_q <= "01010101101000101110110111110";
                WHEN "1111111" =>  memoryC0_uid281_exp10TabGen_q <= "01010110010011101101111110000";
                WHEN OTHERS =>
                    memoryC0_uid281_exp10TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid297_exp10PolyEval(ADD,296)@21
    sumAHighB_uid297_exp10PolyEval_a <= STD_LOGIC_VECTOR((29 downto 29 => memoryC0_uid281_exp10TabGen_q(28)) & memoryC0_uid281_exp10TabGen_q);
    sumAHighB_uid297_exp10PolyEval_b <= STD_LOGIC_VECTOR((29 downto 23 => highBBits_uid296_exp10PolyEval_b(22)) & highBBits_uid296_exp10PolyEval_b);
            sumAHighB_uid297_exp10PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid297_exp10PolyEval_a) + SIGNED(sumAHighB_uid297_exp10PolyEval_b));
    sumAHighB_uid297_exp10PolyEval_q <= sumAHighB_uid297_exp10PolyEval_o(29 downto 0);


	--lowRangeB_uid295_exp10PolyEval(BITSELECT,294)@21
    lowRangeB_uid295_exp10PolyEval_in <= prodXYTruncFR_uid352_pT2_uid294_exp10PolyEval_b(1 downto 0);
    lowRangeB_uid295_exp10PolyEval_b <= lowRangeB_uid295_exp10PolyEval_in(1 downto 0);

	--s2_uid295_uid298_exp10PolyEval(BITJOIN,297)@21
    s2_uid295_uid298_exp10PolyEval_q <= sumAHighB_uid297_exp10PolyEval_q & lowRangeB_uid295_exp10PolyEval_b;

	--peOR_uid75_fpExpEM1Test(BITSELECT,74)@21
    peOR_uid75_fpExpEM1Test_in <= s2_uid295_uid298_exp10PolyEval_q(28 downto 0);
    peOR_uid75_fpExpEM1Test_b <= peOR_uid75_fpExpEM1Test_in(28 downto 5);

	--ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_inputreg(DELAY,920)
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => peOR_uid75_fpExpEM1Test_b, xout => ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem(DUALMEM,921)
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_ia <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_inputreg_q;
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_aa <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdreg_q;
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_ab <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdmux_q;
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_iq,
        address_a => ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_aa,
        data_a => ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_ia
    );
    ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_reset0 <= areset;
        ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_q <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_iq(23 downto 0);

	--fracR_uid79_fpExpEM1Test(BITSELECT,78)@25
    fracR_uid79_fpExpEM1Test_in <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_mem_q(22 downto 0);
    fracR_uid79_fpExpEM1Test_b <= fracR_uid79_fpExpEM1Test_in(22 downto 0);

	--oFracEXZ_uid109_fpExpEM1Test(BITJOIN,108)@25
    oFracEXZ_uid109_fpExpEM1Test_q <= VCC_q & fracR_uid79_fpExpEM1Test_b & GND_q;

	--X24dto24_uid307_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITSELECT,306)@25
    X24dto24_uid307_shiftedFracForNegBranch_uid117_fpExpEM1Test_in <= oFracEXZ_uid109_fpExpEM1Test_q;
    X24dto24_uid307_shiftedFracForNegBranch_uid117_fpExpEM1Test_b <= X24dto24_uid307_shiftedFracForNegBranch_uid117_fpExpEM1Test_in(24 downto 24);

	--rightShiftStage0Idx3_uid309_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITJOIN,308)@25
    rightShiftStage0Idx3_uid309_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= rightShiftStage0Idx3Pad24_uid308_shiftedFracForNegBranch_uid117_fpExpEM1Test_q & X24dto24_uid307_shiftedFracForNegBranch_uid117_fpExpEM1Test_b;

	--reg_rightShiftStage0Idx3_uid309_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_5(REG,414)@25
    reg_rightShiftStage0Idx3_uid309_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx3_uid309_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_5_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx3_uid309_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_5_q <= rightShiftStage0Idx3_uid309_shiftedFracForNegBranch_uid117_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--X24dto16_uid304_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITSELECT,303)@25
    X24dto16_uid304_shiftedFracForNegBranch_uid117_fpExpEM1Test_in <= oFracEXZ_uid109_fpExpEM1Test_q;
    X24dto16_uid304_shiftedFracForNegBranch_uid117_fpExpEM1Test_b <= X24dto16_uid304_shiftedFracForNegBranch_uid117_fpExpEM1Test_in(24 downto 16);

	--rightShiftStage0Idx2_uid306_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITJOIN,305)@25
    rightShiftStage0Idx2_uid306_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= z_uid191_fxpInPostAlign_uid53_fpExpEM1Test_q & X24dto16_uid304_shiftedFracForNegBranch_uid117_fpExpEM1Test_b;

	--reg_rightShiftStage0Idx2_uid306_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_4(REG,413)@25
    reg_rightShiftStage0Idx2_uid306_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx2_uid306_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_4_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx2_uid306_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_4_q <= rightShiftStage0Idx2_uid306_shiftedFracForNegBranch_uid117_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--X24dto8_uid301_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITSELECT,300)@25
    X24dto8_uid301_shiftedFracForNegBranch_uid117_fpExpEM1Test_in <= oFracEXZ_uid109_fpExpEM1Test_q;
    X24dto8_uid301_shiftedFracForNegBranch_uid117_fpExpEM1Test_b <= X24dto8_uid301_shiftedFracForNegBranch_uid117_fpExpEM1Test_in(24 downto 8);

	--rightShiftStage0Idx1_uid303_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITJOIN,302)@25
    rightShiftStage0Idx1_uid303_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= cstZeroWE_uid11_fpExpEM1Test_q & X24dto8_uid301_shiftedFracForNegBranch_uid117_fpExpEM1Test_b;

	--reg_rightShiftStage0Idx1_uid303_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_3(REG,412)@25
    reg_rightShiftStage0Idx1_uid303_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx1_uid303_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_3_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx1_uid303_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_3_q <= rightShiftStage0Idx1_uid303_shiftedFracForNegBranch_uid117_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_oFracEXZ_uid109_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_2(REG,411)@25
    reg_oFracEXZ_uid109_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracEXZ_uid109_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_2_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracEXZ_uid109_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_2_q <= oFracEXZ_uid109_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--cstTabWidth_uid90_fpExpEM1Test(CONSTANT,89)
    cstTabWidth_uid90_fpExpEM1Test_q <= "11001";

	--peORExpInc_uid76_fpExpEM1Test(BITSELECT,75)@21
    peORExpInc_uid76_fpExpEM1Test_in <= s2_uid295_uid298_exp10PolyEval_q(29 downto 0);
    peORExpInc_uid76_fpExpEM1Test_b <= peORExpInc_uid76_fpExpEM1Test_in(29 downto 29);

	--reg_peORExpInc_uid76_fpExpEM1Test_0_to_expRPostBiasPreExc_uid78_fpExpEM1Test_1(REG,399)@21
    reg_peORExpInc_uid76_fpExpEM1Test_0_to_expRPostBiasPreExc_uid78_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_peORExpInc_uid76_fpExpEM1Test_0_to_expRPostBiasPreExc_uid78_fpExpEM1Test_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_peORExpInc_uid76_fpExpEM1Test_0_to_expRPostBiasPreExc_uid78_fpExpEM1Test_1_q <= peORExpInc_uid76_fpExpEM1Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_nor(LOGICAL,917)
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_nor_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q;
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_nor_b <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_sticky_ena_q;
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_nor_q <= not (ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_nor_a or ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_nor_b);

	--ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_mem_top(CONSTANT,913)
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_mem_top_q <= "01001";

	--ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmp(LOGICAL,914)
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmp_a <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_mem_top_q;
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdmux_q);
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmp_q <= "1" when ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmp_a = ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmp_b else "0";

	--ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmpReg(REG,915)
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmpReg_q <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_sticky_ena(REG,918)
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_nor_q = "1") THEN
                ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_sticky_ena_q <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_enaAnd(LOGICAL,919)
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_enaAnd_a <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_sticky_ena_q;
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_enaAnd_b <= en;
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_enaAnd_q <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_enaAnd_a and ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_enaAnd_b;

	--reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0(REG,377)@8
    reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q <= "00000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q <= ePreRnd_uid54_fpExpEM1Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_inputreg(DELAY,907)
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1 )
    PORT MAP ( xin => reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q, xout => ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt(COUNTER,909)
    -- every=1, low=0, high=9, step=1, init=1
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_i = 8 THEN
                      ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_i <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_i - 9;
                    ELSE
                        ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_i <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_i,4));


	--ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdreg(REG,910)
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdreg_q <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdmux(MUX,911)
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdmux_s <= en;
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdmux: PROCESS (ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdmux_s, ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdreg_q, ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdmux_q <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdmux_q <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem(DUALMEM,908)
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_ia <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_inputreg_q;
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_aa <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdreg_q;
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_ab <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_rdmux_q;
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 11,
        widthad_b => 4,
        numwords_b => 10,
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
        clocken1 => ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_iq,
        address_a => ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_aa,
        data_a => ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_ia
    );
    ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_reset0 <= areset;
        ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_q <= ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_iq(10 downto 0);

	--expRPostBiasPreExc0_uid77_fpExpEM1Test(ADD,76)@21
    expRPostBiasPreExc0_uid77_fpExpEM1Test_a <= STD_LOGIC_VECTOR((12 downto 11 => ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_q(10)) & ld_reg_ePreRnd_uid54_fpExpEM1Test_0_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_0_q_to_expRPostBiasPreExc0_uid77_fpExpEM1Test_a_replace_mem_q);
    expRPostBiasPreExc0_uid77_fpExpEM1Test_b <= STD_LOGIC_VECTOR('0' & "0000" & cstBias_uid8_fpExpEM1Test_q);
    expRPostBiasPreExc0_uid77_fpExpEM1Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostBiasPreExc0_uid77_fpExpEM1Test_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expRPostBiasPreExc0_uid77_fpExpEM1Test_o <= STD_LOGIC_VECTOR(SIGNED(expRPostBiasPreExc0_uid77_fpExpEM1Test_a) + SIGNED(expRPostBiasPreExc0_uid77_fpExpEM1Test_b));
            END IF;
        END IF;
    END PROCESS;
    expRPostBiasPreExc0_uid77_fpExpEM1Test_q <= expRPostBiasPreExc0_uid77_fpExpEM1Test_o(11 downto 0);


	--expRPostBiasPreExc_uid78_fpExpEM1Test(ADD,77)@22
    expRPostBiasPreExc_uid78_fpExpEM1Test_a <= STD_LOGIC_VECTOR((13 downto 12 => expRPostBiasPreExc0_uid77_fpExpEM1Test_q(11)) & expRPostBiasPreExc0_uid77_fpExpEM1Test_q);
    expRPostBiasPreExc_uid78_fpExpEM1Test_b <= STD_LOGIC_VECTOR('0' & "000000000000" & reg_peORExpInc_uid76_fpExpEM1Test_0_to_expRPostBiasPreExc_uid78_fpExpEM1Test_1_q);
            expRPostBiasPreExc_uid78_fpExpEM1Test_o <= STD_LOGIC_VECTOR(SIGNED(expRPostBiasPreExc_uid78_fpExpEM1Test_a) + SIGNED(expRPostBiasPreExc_uid78_fpExpEM1Test_b));
    expRPostBiasPreExc_uid78_fpExpEM1Test_q <= expRPostBiasPreExc_uid78_fpExpEM1Test_o(12 downto 0);


	--expR_uid87_fpExpEM1Test(BITSELECT,86)@22
    expR_uid87_fpExpEM1Test_in <= expRPostBiasPreExc_uid78_fpExpEM1Test_q(7 downto 0);
    expR_uid87_fpExpEM1Test_b <= expR_uid87_fpExpEM1Test_in(7 downto 0);

	--ld_expR_uid87_fpExpEM1Test_b_to_reg_expR_uid87_fpExpEM1Test_0_to_expR_uid88_fpExpEM1Test_2_a(DELAY,863)@22
    ld_expR_uid87_fpExpEM1Test_b_to_reg_expR_uid87_fpExpEM1Test_0_to_expR_uid88_fpExpEM1Test_2_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expR_uid87_fpExpEM1Test_b, xout => ld_expR_uid87_fpExpEM1Test_b_to_reg_expR_uid87_fpExpEM1Test_0_to_expR_uid88_fpExpEM1Test_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expR_uid87_fpExpEM1Test_0_to_expR_uid88_fpExpEM1Test_2(REG,404)@23
    reg_expR_uid87_fpExpEM1Test_0_to_expR_uid88_fpExpEM1Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expR_uid87_fpExpEM1Test_0_to_expR_uid88_fpExpEM1Test_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expR_uid87_fpExpEM1Test_0_to_expR_uid88_fpExpEM1Test_2_q <= ld_expR_uid87_fpExpEM1Test_b_to_reg_expR_uid87_fpExpEM1Test_0_to_expR_uid88_fpExpEM1Test_2_a_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signX_uid7_fpExpEM1Test_b_to_expUnderflow_uid83_fpExpEM1Test_c(DELAY,499)@0
    ld_signX_uid7_fpExpEM1Test_b_to_expUnderflow_uid83_fpExpEM1Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => signX_uid7_fpExpEM1Test_b, xout => ld_signX_uid7_fpExpEM1Test_b_to_expUnderflow_uid83_fpExpEM1Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--cstAllZWF_uid18_fpExpEM1Test(CONSTANT,17)
    cstAllZWF_uid18_fpExpEM1Test_q <= "00000000000000000000000";

	--fracXIsZero_uid25_fpExpEM1Test(LOGICAL,24)@0
    fracXIsZero_uid25_fpExpEM1Test_a <= frac_uid24_fpExpEM1Test_b;
    fracXIsZero_uid25_fpExpEM1Test_b <= cstAllZWF_uid18_fpExpEM1Test_q;
    fracXIsZero_uid25_fpExpEM1Test_q <= "1" when fracXIsZero_uid25_fpExpEM1Test_a = fracXIsZero_uid25_fpExpEM1Test_b else "0";

	--InvFracXIsZero_uid27_fpExpEM1Test(LOGICAL,26)@0
    InvFracXIsZero_uid27_fpExpEM1Test_a <= fracXIsZero_uid25_fpExpEM1Test_q;
    InvFracXIsZero_uid27_fpExpEM1Test_q <= not InvFracXIsZero_uid27_fpExpEM1Test_a;

	--ld_InvFracXIsZero_uid27_fpExpEM1Test_q_to_exc_N_uid28_fpExpEM1Test_b(DELAY,445)@0
    ld_InvFracXIsZero_uid27_fpExpEM1Test_q_to_exc_N_uid28_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => InvFracXIsZero_uid27_fpExpEM1Test_q, xout => ld_InvFracXIsZero_uid27_fpExpEM1Test_q_to_exc_N_uid28_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--expXIsMax_uid23_fpExpEM1Test(LOGICAL,22)@0
    expXIsMax_uid23_fpExpEM1Test_a <= expX_uid6_fpExpEM1Test_b;
    expXIsMax_uid23_fpExpEM1Test_b <= cstAllOWE_uid17_fpExpEM1Test_q;
    expXIsMax_uid23_fpExpEM1Test_q <= "1" when expXIsMax_uid23_fpExpEM1Test_a = expXIsMax_uid23_fpExpEM1Test_b else "0";

	--ld_expXIsMax_uid23_fpExpEM1Test_q_to_exc_N_uid28_fpExpEM1Test_a(DELAY,444)@0
    ld_expXIsMax_uid23_fpExpEM1Test_q_to_exc_N_uid28_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => expXIsMax_uid23_fpExpEM1Test_q, xout => ld_expXIsMax_uid23_fpExpEM1Test_q_to_exc_N_uid28_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--exc_N_uid28_fpExpEM1Test(LOGICAL,27)@4
    exc_N_uid28_fpExpEM1Test_a <= ld_expXIsMax_uid23_fpExpEM1Test_q_to_exc_N_uid28_fpExpEM1Test_a_q;
    exc_N_uid28_fpExpEM1Test_b <= ld_InvFracXIsZero_uid27_fpExpEM1Test_q_to_exc_N_uid28_fpExpEM1Test_b_q;
    exc_N_uid28_fpExpEM1Test_q <= exc_N_uid28_fpExpEM1Test_a and exc_N_uid28_fpExpEM1Test_b;

	--InvExc_N_uid29_fpExpEM1Test(LOGICAL,28)@4
    InvExc_N_uid29_fpExpEM1Test_a <= exc_N_uid28_fpExpEM1Test_q;
    InvExc_N_uid29_fpExpEM1Test_q <= not InvExc_N_uid29_fpExpEM1Test_a;

	--exc_I_uid26_fpExpEM1Test(LOGICAL,25)@0
    exc_I_uid26_fpExpEM1Test_a <= expXIsMax_uid23_fpExpEM1Test_q;
    exc_I_uid26_fpExpEM1Test_b <= fracXIsZero_uid25_fpExpEM1Test_q;
    exc_I_uid26_fpExpEM1Test_q <= exc_I_uid26_fpExpEM1Test_a and exc_I_uid26_fpExpEM1Test_b;

	--InvExc_I_uid30_fpExpEM1Test(LOGICAL,29)@0
    InvExc_I_uid30_fpExpEM1Test_a <= exc_I_uid26_fpExpEM1Test_q;
    InvExc_I_uid30_fpExpEM1Test_q <= not InvExc_I_uid30_fpExpEM1Test_a;

	--ld_InvExc_I_uid30_fpExpEM1Test_q_to_exc_R_uid32_fpExpEM1Test_b(DELAY,450)@0
    ld_InvExc_I_uid30_fpExpEM1Test_q_to_exc_R_uid32_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => InvExc_I_uid30_fpExpEM1Test_q, xout => ld_InvExc_I_uid30_fpExpEM1Test_q_to_exc_R_uid32_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--expXIsZero_uid21_fpExpEM1Test(LOGICAL,20)@0
    expXIsZero_uid21_fpExpEM1Test_a <= expX_uid6_fpExpEM1Test_b;
    expXIsZero_uid21_fpExpEM1Test_b <= cstZeroWE_uid11_fpExpEM1Test_q;
    expXIsZero_uid21_fpExpEM1Test_q <= "1" when expXIsZero_uid21_fpExpEM1Test_a = expXIsZero_uid21_fpExpEM1Test_b else "0";

	--InvExpXIsZero_uid31_fpExpEM1Test(LOGICAL,30)@0
    InvExpXIsZero_uid31_fpExpEM1Test_a <= expXIsZero_uid21_fpExpEM1Test_q;
    InvExpXIsZero_uid31_fpExpEM1Test_q <= not InvExpXIsZero_uid31_fpExpEM1Test_a;

	--ld_InvExpXIsZero_uid31_fpExpEM1Test_q_to_exc_R_uid32_fpExpEM1Test_a(DELAY,449)@0
    ld_InvExpXIsZero_uid31_fpExpEM1Test_q_to_exc_R_uid32_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => InvExpXIsZero_uid31_fpExpEM1Test_q, xout => ld_InvExpXIsZero_uid31_fpExpEM1Test_q_to_exc_R_uid32_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--exc_R_uid32_fpExpEM1Test(LOGICAL,31)@4
    exc_R_uid32_fpExpEM1Test_a <= ld_InvExpXIsZero_uid31_fpExpEM1Test_q_to_exc_R_uid32_fpExpEM1Test_a_q;
    exc_R_uid32_fpExpEM1Test_b <= ld_InvExc_I_uid30_fpExpEM1Test_q_to_exc_R_uid32_fpExpEM1Test_b_q;
    exc_R_uid32_fpExpEM1Test_c <= InvExc_N_uid29_fpExpEM1Test_q;
    exc_R_uid32_fpExpEM1Test_q <= exc_R_uid32_fpExpEM1Test_a and exc_R_uid32_fpExpEM1Test_b and exc_R_uid32_fpExpEM1Test_c;

	--expOvfInitial_uid49_fpExpEM1Test(BITSELECT,48)@4
    expOvfInitial_uid49_fpExpEM1Test_in <= shiftValuePreSat_uid48_fpExpEM1Test_q;
    expOvfInitial_uid49_fpExpEM1Test_b <= expOvfInitial_uid49_fpExpEM1Test_in(8 downto 8);

	--expUnderflow_uid83_fpExpEM1Test(LOGICAL,82)@4
    expUnderflow_uid83_fpExpEM1Test_a <= expOvfInitial_uid49_fpExpEM1Test_b;
    expUnderflow_uid83_fpExpEM1Test_b <= exc_R_uid32_fpExpEM1Test_q;
    expUnderflow_uid83_fpExpEM1Test_c <= ld_signX_uid7_fpExpEM1Test_b_to_expUnderflow_uid83_fpExpEM1Test_c_q;
    expUnderflow_uid83_fpExpEM1Test_q_i <= expUnderflow_uid83_fpExpEM1Test_a and expUnderflow_uid83_fpExpEM1Test_b and expUnderflow_uid83_fpExpEM1Test_c;
    expUnderflow_uid83_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => expUnderflow_uid83_fpExpEM1Test_q, xin => expUnderflow_uid83_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_expUnderflow_uid83_fpExpEM1Test_q_to_expUndeflowCondition_uid85_fpExpEM1Test_b(DELAY,503)@5
    ld_expUnderflow_uid83_fpExpEM1Test_q_to_expUndeflowCondition_uid85_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 18 )
    PORT MAP ( xin => expUnderflow_uid83_fpExpEM1Test_q, xout => ld_expUnderflow_uid83_fpExpEM1Test_q_to_expUndeflowCondition_uid85_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--reg_exc_R_uid32_fpExpEM1Test_0_to_regInAndUndeflowExp_uid84_fpExpEM1Test_2(REG,403)@4
    reg_exc_R_uid32_fpExpEM1Test_0_to_regInAndUndeflowExp_uid84_fpExpEM1Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_R_uid32_fpExpEM1Test_0_to_regInAndUndeflowExp_uid84_fpExpEM1Test_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_R_uid32_fpExpEM1Test_0_to_regInAndUndeflowExp_uid84_fpExpEM1Test_2_q <= exc_R_uid32_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_exc_R_uid32_fpExpEM1Test_0_to_regInAndUndeflowExp_uid84_fpExpEM1Test_2_q_to_regInAndUndeflowExp_uid84_fpExpEM1Test_b(DELAY,501)@5
    ld_reg_exc_R_uid32_fpExpEM1Test_0_to_regInAndUndeflowExp_uid84_fpExpEM1Test_2_q_to_regInAndUndeflowExp_uid84_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 18 )
    PORT MAP ( xin => reg_exc_R_uid32_fpExpEM1Test_0_to_regInAndUndeflowExp_uid84_fpExpEM1Test_2_q, xout => ld_reg_exc_R_uid32_fpExpEM1Test_0_to_regInAndUndeflowExp_uid84_fpExpEM1Test_2_q_to_regInAndUndeflowExp_uid84_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expRPostBiasPreExc_uid78_fpExpEM1Test_0_to_expOvf_uid82_fpExpEM1Test_0(REG,400)@22
    reg_expRPostBiasPreExc_uid78_fpExpEM1Test_0_to_expOvf_uid82_fpExpEM1Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPostBiasPreExc_uid78_fpExpEM1Test_0_to_expOvf_uid82_fpExpEM1Test_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPostBiasPreExc_uid78_fpExpEM1Test_0_to_expOvf_uid82_fpExpEM1Test_0_q <= expRPostBiasPreExc_uid78_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--expUdf_uid80_fpExpEM1Test(COMPARE,79)@23
    expUdf_uid80_fpExpEM1Test_cin <= GND_q;
    expUdf_uid80_fpExpEM1Test_a <= STD_LOGIC_VECTOR('0' & "0000000000000" & GND_q) & '0';
    expUdf_uid80_fpExpEM1Test_b <= STD_LOGIC_VECTOR((14 downto 13 => reg_expRPostBiasPreExc_uid78_fpExpEM1Test_0_to_expOvf_uid82_fpExpEM1Test_0_q(12)) & reg_expRPostBiasPreExc_uid78_fpExpEM1Test_0_to_expOvf_uid82_fpExpEM1Test_0_q) & expUdf_uid80_fpExpEM1Test_cin(0);
            expUdf_uid80_fpExpEM1Test_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid80_fpExpEM1Test_a) - SIGNED(expUdf_uid80_fpExpEM1Test_b));
    expUdf_uid80_fpExpEM1Test_n(0) <= not expUdf_uid80_fpExpEM1Test_o(15);


	--regInAndUndeflowExp_uid84_fpExpEM1Test(LOGICAL,83)@23
    regInAndUndeflowExp_uid84_fpExpEM1Test_a <= expUdf_uid80_fpExpEM1Test_n;
    regInAndUndeflowExp_uid84_fpExpEM1Test_b <= ld_reg_exc_R_uid32_fpExpEM1Test_0_to_regInAndUndeflowExp_uid84_fpExpEM1Test_2_q_to_regInAndUndeflowExp_uid84_fpExpEM1Test_b_q;
    regInAndUndeflowExp_uid84_fpExpEM1Test_q <= regInAndUndeflowExp_uid84_fpExpEM1Test_a and regInAndUndeflowExp_uid84_fpExpEM1Test_b;

	--expUndeflowCondition_uid85_fpExpEM1Test(LOGICAL,84)@23
    expUndeflowCondition_uid85_fpExpEM1Test_a <= regInAndUndeflowExp_uid84_fpExpEM1Test_q;
    expUndeflowCondition_uid85_fpExpEM1Test_b <= ld_expUnderflow_uid83_fpExpEM1Test_q_to_expUndeflowCondition_uid85_fpExpEM1Test_b_q;
    expUndeflowCondition_uid85_fpExpEM1Test_q_i <= expUndeflowCondition_uid85_fpExpEM1Test_a or expUndeflowCondition_uid85_fpExpEM1Test_b;
    expUndeflowCondition_uid85_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => expUndeflowCondition_uid85_fpExpEM1Test_q, xin => expUndeflowCondition_uid85_fpExpEM1Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--expR_uid88_fpExpEM1Test(MUX,87)@24
    expR_uid88_fpExpEM1Test_s <= expUndeflowCondition_uid85_fpExpEM1Test_q;
    expR_uid88_fpExpEM1Test: PROCESS (expR_uid88_fpExpEM1Test_s, en, reg_expR_uid87_fpExpEM1Test_0_to_expR_uid88_fpExpEM1Test_2_q, cstZeroWE_uid11_fpExpEM1Test_q)
    BEGIN
            CASE expR_uid88_fpExpEM1Test_s IS
                  WHEN "0" => expR_uid88_fpExpEM1Test_q <= reg_expR_uid87_fpExpEM1Test_0_to_expR_uid88_fpExpEM1Test_2_q;
                  WHEN "1" => expR_uid88_fpExpEM1Test_q <= cstZeroWE_uid11_fpExpEM1Test_q;
                  WHEN OTHERS => expR_uid88_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--shiftAddrPreSaturate_uid110_fpExpEM1Test(SUB,109)@24
    shiftAddrPreSaturate_uid110_fpExpEM1Test_a <= STD_LOGIC_VECTOR("0" & cstBias_uid8_fpExpEM1Test_q);
    shiftAddrPreSaturate_uid110_fpExpEM1Test_b <= STD_LOGIC_VECTOR("0" & expR_uid88_fpExpEM1Test_q);
            shiftAddrPreSaturate_uid110_fpExpEM1Test_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftAddrPreSaturate_uid110_fpExpEM1Test_a) - UNSIGNED(shiftAddrPreSaturate_uid110_fpExpEM1Test_b));
    shiftAddrPreSaturate_uid110_fpExpEM1Test_q <= shiftAddrPreSaturate_uid110_fpExpEM1Test_o(8 downto 0);


	--shiftAddrPreSaturateShort_uid115_fpExpEM1Test(BITSELECT,114)@24
    shiftAddrPreSaturateShort_uid115_fpExpEM1Test_in <= shiftAddrPreSaturate_uid110_fpExpEM1Test_q(4 downto 0);
    shiftAddrPreSaturateShort_uid115_fpExpEM1Test_b <= shiftAddrPreSaturateShort_uid115_fpExpEM1Test_in(4 downto 0);

	--ld_shiftAddrPreSaturateShort_uid115_fpExpEM1Test_b_to_negShiftValAddr_uid116_fpExpEM1Test_c(DELAY,542)@24
    ld_shiftAddrPreSaturateShort_uid115_fpExpEM1Test_b_to_negShiftValAddr_uid116_fpExpEM1Test_c : dspba_delay
    GENERIC MAP ( width => 5, depth => 1 )
    PORT MAP ( xin => shiftAddrPreSaturateShort_uid115_fpExpEM1Test_b, xout => ld_shiftAddrPreSaturateShort_uid115_fpExpEM1Test_b_to_negShiftValAddr_uid116_fpExpEM1Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_shiftAddrPreSaturate_uid110_fpExpEM1Test_0_to_negShiftValueSaturate0_uid112_fpExpEM1Test_0(REG,409)@24
    reg_shiftAddrPreSaturate_uid110_fpExpEM1Test_0_to_negShiftValueSaturate0_uid112_fpExpEM1Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_shiftAddrPreSaturate_uid110_fpExpEM1Test_0_to_negShiftValueSaturate0_uid112_fpExpEM1Test_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_shiftAddrPreSaturate_uid110_fpExpEM1Test_0_to_negShiftValueSaturate0_uid112_fpExpEM1Test_0_q <= shiftAddrPreSaturate_uid110_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--negShiftValueSaturate0_uid112_fpExpEM1Test(COMPARE,111)@25
    negShiftValueSaturate0_uid112_fpExpEM1Test_cin <= GND_q;
    negShiftValueSaturate0_uid112_fpExpEM1Test_a <= STD_LOGIC_VECTOR((10 downto 9 => reg_shiftAddrPreSaturate_uid110_fpExpEM1Test_0_to_negShiftValueSaturate0_uid112_fpExpEM1Test_0_q(8)) & reg_shiftAddrPreSaturate_uid110_fpExpEM1Test_0_to_negShiftValueSaturate0_uid112_fpExpEM1Test_0_q) & '0';
    negShiftValueSaturate0_uid112_fpExpEM1Test_b <= STD_LOGIC_VECTOR('0' & "00000" & cstTabWidth_uid90_fpExpEM1Test_q) & negShiftValueSaturate0_uid112_fpExpEM1Test_cin(0);
            negShiftValueSaturate0_uid112_fpExpEM1Test_o <= STD_LOGIC_VECTOR(SIGNED(negShiftValueSaturate0_uid112_fpExpEM1Test_a) - SIGNED(negShiftValueSaturate0_uid112_fpExpEM1Test_b));
    negShiftValueSaturate0_uid112_fpExpEM1Test_n(0) <= not negShiftValueSaturate0_uid112_fpExpEM1Test_o(11);


	--ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_nor(LOGICAL,941)
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_nor_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q;
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_nor_b <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_sticky_ena_q;
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_nor_q <= not (ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_nor_a or ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_nor_b);

	--ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_sticky_ena(REG,942)
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_nor_q = "1") THEN
                ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_sticky_ena_q <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_enaAnd(LOGICAL,943)
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_enaAnd_a <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_sticky_ena_q;
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_enaAnd_b <= en;
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_enaAnd_q <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_enaAnd_a and ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_enaAnd_b;

	--negInf_uid113_fpExpEM1Test(LOGICAL,112)@0
    negInf_uid113_fpExpEM1Test_a <= exc_I_uid26_fpExpEM1Test_q;
    negInf_uid113_fpExpEM1Test_b <= signX_uid7_fpExpEM1Test_b;
    negInf_uid113_fpExpEM1Test_q <= negInf_uid113_fpExpEM1Test_a and negInf_uid113_fpExpEM1Test_b;

	--ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_inputreg(DELAY,931)
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => negInf_uid113_fpExpEM1Test_q, xout => ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem(DUALMEM,932)
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_ia <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_inputreg_q;
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_aa <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdreg_q;
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_ab <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_rdmux_q;
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 23,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 23,
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
        clocken1 => ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_iq,
        address_a => ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_aa,
        data_a => ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_ia
    );
    ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_reset0 <= areset;
        ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_q <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_iq(0 downto 0);

	--negShiftValueSaturate_uid114_fpExpEM1Test(LOGICAL,113)@25
    negShiftValueSaturate_uid114_fpExpEM1Test_a <= ld_negInf_uid113_fpExpEM1Test_q_to_negShiftValueSaturate_uid114_fpExpEM1Test_a_replace_mem_q;
    negShiftValueSaturate_uid114_fpExpEM1Test_b <= negShiftValueSaturate0_uid112_fpExpEM1Test_n;
    negShiftValueSaturate_uid114_fpExpEM1Test_q <= negShiftValueSaturate_uid114_fpExpEM1Test_a or negShiftValueSaturate_uid114_fpExpEM1Test_b;

	--negShiftValAddr_uid116_fpExpEM1Test(MUX,115)@25
    negShiftValAddr_uid116_fpExpEM1Test_s <= negShiftValueSaturate_uid114_fpExpEM1Test_q;
    negShiftValAddr_uid116_fpExpEM1Test: PROCESS (negShiftValAddr_uid116_fpExpEM1Test_s, en, ld_shiftAddrPreSaturateShort_uid115_fpExpEM1Test_b_to_negShiftValAddr_uid116_fpExpEM1Test_c_q, cstTabWidth_uid90_fpExpEM1Test_q)
    BEGIN
            CASE negShiftValAddr_uid116_fpExpEM1Test_s IS
                  WHEN "0" => negShiftValAddr_uid116_fpExpEM1Test_q <= ld_shiftAddrPreSaturateShort_uid115_fpExpEM1Test_b_to_negShiftValAddr_uid116_fpExpEM1Test_c_q;
                  WHEN "1" => negShiftValAddr_uid116_fpExpEM1Test_q <= cstTabWidth_uid90_fpExpEM1Test_q;
                  WHEN OTHERS => negShiftValAddr_uid116_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel4Dto3_uid310_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITSELECT,309)@25
    rightShiftStageSel4Dto3_uid310_shiftedFracForNegBranch_uid117_fpExpEM1Test_in <= negShiftValAddr_uid116_fpExpEM1Test_q;
    rightShiftStageSel4Dto3_uid310_shiftedFracForNegBranch_uid117_fpExpEM1Test_b <= rightShiftStageSel4Dto3_uid310_shiftedFracForNegBranch_uid117_fpExpEM1Test_in(4 downto 3);

	--reg_rightShiftStageSel4Dto3_uid310_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_1(REG,410)@25
    reg_rightShiftStageSel4Dto3_uid310_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel4Dto3_uid310_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel4Dto3_uid310_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_q <= rightShiftStageSel4Dto3_uid310_shiftedFracForNegBranch_uid117_fpExpEM1Test_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test(MUX,310)@26
    rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_s <= reg_rightShiftStageSel4Dto3_uid310_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_q;
    rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test: PROCESS (rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_s, en, reg_oFracEXZ_uid109_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_2_q, reg_rightShiftStage0Idx1_uid303_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_3_q, reg_rightShiftStage0Idx2_uid306_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_4_q, reg_rightShiftStage0Idx3_uid309_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_5_q)
    BEGIN
            CASE rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_s IS
                  WHEN "00" => rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= reg_oFracEXZ_uid109_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_2_q;
                  WHEN "01" => rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= reg_rightShiftStage0Idx1_uid303_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_3_q;
                  WHEN "10" => rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= reg_rightShiftStage0Idx2_uid306_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_4_q;
                  WHEN "11" => rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= reg_rightShiftStage0Idx3_uid309_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_5_q;
                  WHEN OTHERS => rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage024dto6_uid318_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITSELECT,317)@26
    RightShiftStage024dto6_uid318_shiftedFracForNegBranch_uid117_fpExpEM1Test_in <= rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_q;
    RightShiftStage024dto6_uid318_shiftedFracForNegBranch_uid117_fpExpEM1Test_b <= RightShiftStage024dto6_uid318_shiftedFracForNegBranch_uid117_fpExpEM1Test_in(24 downto 6);

	--ld_RightShiftStage024dto6_uid318_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid320_shiftedFracForNegBranch_uid117_fpExpEM1Test_a(DELAY,780)@26
    ld_RightShiftStage024dto6_uid318_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid320_shiftedFracForNegBranch_uid117_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 19, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto6_uid318_shiftedFracForNegBranch_uid117_fpExpEM1Test_b, xout => ld_RightShiftStage024dto6_uid318_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid320_shiftedFracForNegBranch_uid117_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid320_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITJOIN,319)@27
    rightShiftStage1Idx3_uid320_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= rightShiftStage1Idx3Pad6_uid319_shiftedFracForNegBranch_uid117_fpExpEM1Test_q & ld_RightShiftStage024dto6_uid318_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx3_uid320_shiftedFracForNegBranch_uid117_fpExpEM1Test_a_q;

	--RightShiftStage024dto4_uid315_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITSELECT,314)@26
    RightShiftStage024dto4_uid315_shiftedFracForNegBranch_uid117_fpExpEM1Test_in <= rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_q;
    RightShiftStage024dto4_uid315_shiftedFracForNegBranch_uid117_fpExpEM1Test_b <= RightShiftStage024dto4_uid315_shiftedFracForNegBranch_uid117_fpExpEM1Test_in(24 downto 4);

	--ld_RightShiftStage024dto4_uid315_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid317_shiftedFracForNegBranch_uid117_fpExpEM1Test_a(DELAY,778)@26
    ld_RightShiftStage024dto4_uid315_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid317_shiftedFracForNegBranch_uid117_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 21, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto4_uid315_shiftedFracForNegBranch_uid117_fpExpEM1Test_b, xout => ld_RightShiftStage024dto4_uid315_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid317_shiftedFracForNegBranch_uid117_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid317_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITJOIN,316)@27
    rightShiftStage1Idx2_uid317_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= z_uid203_fxpInPostAlign_uid53_fpExpEM1Test_q & ld_RightShiftStage024dto4_uid315_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx2_uid317_shiftedFracForNegBranch_uid117_fpExpEM1Test_a_q;

	--RightShiftStage024dto2_uid312_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITSELECT,311)@26
    RightShiftStage024dto2_uid312_shiftedFracForNegBranch_uid117_fpExpEM1Test_in <= rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_q;
    RightShiftStage024dto2_uid312_shiftedFracForNegBranch_uid117_fpExpEM1Test_b <= RightShiftStage024dto2_uid312_shiftedFracForNegBranch_uid117_fpExpEM1Test_in(24 downto 2);

	--ld_RightShiftStage024dto2_uid312_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid314_shiftedFracForNegBranch_uid117_fpExpEM1Test_a(DELAY,776)@26
    ld_RightShiftStage024dto2_uid312_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid314_shiftedFracForNegBranch_uid117_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto2_uid312_shiftedFracForNegBranch_uid117_fpExpEM1Test_b, xout => ld_RightShiftStage024dto2_uid312_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid314_shiftedFracForNegBranch_uid117_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid314_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITJOIN,313)@27
    rightShiftStage1Idx1_uid314_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= z_uid221_fxpInPostAlign_uid53_fpExpEM1Test_q & ld_RightShiftStage024dto2_uid312_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_rightShiftStage1Idx1_uid314_shiftedFracForNegBranch_uid117_fpExpEM1Test_a_q;

	--reg_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_2(REG,416)@26
    reg_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_2_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_2_q <= rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITSELECT,320)@25
    rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_in <= negShiftValAddr_uid116_fpExpEM1Test_q(2 downto 0);
    rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_b <= rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_in(2 downto 1);

	--ld_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_reg_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_a(DELAY,874)@25
    ld_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_reg_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_b, xout => ld_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_reg_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_1(REG,415)@26
    reg_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_q <= ld_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_reg_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test(MUX,321)@27
    rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_s <= reg_rightShiftStageSel2Dto1_uid321_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_q;
    rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test: PROCESS (rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_s, en, reg_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_2_q, rightShiftStage1Idx1_uid314_shiftedFracForNegBranch_uid117_fpExpEM1Test_q, rightShiftStage1Idx2_uid317_shiftedFracForNegBranch_uid117_fpExpEM1Test_q, rightShiftStage1Idx3_uid320_shiftedFracForNegBranch_uid117_fpExpEM1Test_q)
    BEGIN
            CASE rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_s IS
                  WHEN "00" => rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= reg_rightShiftStage0_uid311_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_2_q;
                  WHEN "01" => rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= rightShiftStage1Idx1_uid314_shiftedFracForNegBranch_uid117_fpExpEM1Test_q;
                  WHEN "10" => rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= rightShiftStage1Idx2_uid317_shiftedFracForNegBranch_uid117_fpExpEM1Test_q;
                  WHEN "11" => rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= rightShiftStage1Idx3_uid320_shiftedFracForNegBranch_uid117_fpExpEM1Test_q;
                  WHEN OTHERS => rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test(BITSELECT,325)@25
    rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_in <= negShiftValAddr_uid116_fpExpEM1Test_q(0 downto 0);
    rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_b <= rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_in(0 downto 0);

	--ld_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_reg_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_a(DELAY,876)@25
    ld_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_reg_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_b, xout => ld_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_reg_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_1(REG,417)@26
    reg_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_q <= ld_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_b_to_reg_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test(MUX,326)@27
    rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_s <= reg_rightShiftStageSel0Dto0_uid326_shiftedFracForNegBranch_uid117_fpExpEM1Test_0_to_rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_1_q;
    rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_s IS
                      WHEN "0" => rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= rightShiftStage1_uid322_shiftedFracForNegBranch_uid117_fpExpEM1Test_q;
                      WHEN "1" => rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= rightShiftStage2Idx1_uid325_shiftedFracForNegBranch_uid117_fpExpEM1Test_q;
                      WHEN OTHERS => rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--pad_o_uid9_uid118_fpExpEM1Test(BITJOIN,117)@27
    pad_o_uid9_uid118_fpExpEM1Test_q <= VCC_q & STD_LOGIC_VECTOR((23 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_o_uid9_uid118_fpExpEM1Test_0_to_negBranchFracNotNorm_uid118_fpExpEM1Test_0(REG,418)@27
    reg_pad_o_uid9_uid118_fpExpEM1Test_0_to_negBranchFracNotNorm_uid118_fpExpEM1Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_o_uid9_uid118_fpExpEM1Test_0_to_negBranchFracNotNorm_uid118_fpExpEM1Test_0_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_o_uid9_uid118_fpExpEM1Test_0_to_negBranchFracNotNorm_uid118_fpExpEM1Test_0_q <= pad_o_uid9_uid118_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--negBranchFracNotNorm_uid118_fpExpEM1Test(SUB,118)@28
    negBranchFracNotNorm_uid118_fpExpEM1Test_a <= STD_LOGIC_VECTOR("0" & reg_pad_o_uid9_uid118_fpExpEM1Test_0_to_negBranchFracNotNorm_uid118_fpExpEM1Test_0_q);
    negBranchFracNotNorm_uid118_fpExpEM1Test_b <= STD_LOGIC_VECTOR("0" & rightShiftStage2_uid327_shiftedFracForNegBranch_uid117_fpExpEM1Test_q);
            negBranchFracNotNorm_uid118_fpExpEM1Test_o <= STD_LOGIC_VECTOR(UNSIGNED(negBranchFracNotNorm_uid118_fpExpEM1Test_a) - UNSIGNED(negBranchFracNotNorm_uid118_fpExpEM1Test_b));
    negBranchFracNotNorm_uid118_fpExpEM1Test_q <= negBranchFracNotNorm_uid118_fpExpEM1Test_o(25 downto 0);


	--expNegBranchIsZero_uid120_fpExpEM1Test(BITSELECT,119)@28
    expNegBranchIsZero_uid120_fpExpEM1Test_in <= negBranchFracNotNorm_uid118_fpExpEM1Test_q(24 downto 0);
    expNegBranchIsZero_uid120_fpExpEM1Test_b <= expNegBranchIsZero_uid120_fpExpEM1Test_in(24 downto 24);

	--negBranchExp_uid124_fpExpEM1Test(MUX,123)@28
    negBranchExp_uid124_fpExpEM1Test_s <= expNegBranchIsZero_uid120_fpExpEM1Test_b;
    negBranchExp_uid124_fpExpEM1Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            negBranchExp_uid124_fpExpEM1Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE negBranchExp_uid124_fpExpEM1Test_s IS
                      WHEN "0" => negBranchExp_uid124_fpExpEM1Test_q <= cstBiasM1_uid14_fpExpEM1Test_q;
                      WHEN "1" => negBranchExp_uid124_fpExpEM1Test_q <= cstBias_uid8_fpExpEM1Test_q;
                      WHEN OTHERS => negBranchExp_uid124_fpExpEM1Test_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--tableAddrPosExt_uid89_fpExpEM1Test(SUB,88)@24
    tableAddrPosExt_uid89_fpExpEM1Test_a <= STD_LOGIC_VECTOR("0" & expR_uid88_fpExpEM1Test_q);
    tableAddrPosExt_uid89_fpExpEM1Test_b <= STD_LOGIC_VECTOR("0" & cstBias_uid8_fpExpEM1Test_q);
            tableAddrPosExt_uid89_fpExpEM1Test_o <= STD_LOGIC_VECTOR(UNSIGNED(tableAddrPosExt_uid89_fpExpEM1Test_a) - UNSIGNED(tableAddrPosExt_uid89_fpExpEM1Test_b));
    tableAddrPosExt_uid89_fpExpEM1Test_q <= tableAddrPosExt_uid89_fpExpEM1Test_o(8 downto 0);


	--tableAddrPos_uid92_fpExpEM1Test(BITSELECT,91)@24
    tableAddrPos_uid92_fpExpEM1Test_in <= tableAddrPosExt_uid89_fpExpEM1Test_q(4 downto 0);
    tableAddrPos_uid92_fpExpEM1Test_b <= tableAddrPos_uid92_fpExpEM1Test_in(4 downto 0);

	--ld_tableAddrPos_uid92_fpExpEM1Test_b_to_addrDecTable_uid93_fpExpEM1Test_c(DELAY,511)@24
    ld_tableAddrPos_uid92_fpExpEM1Test_b_to_addrDecTable_uid93_fpExpEM1Test_c : dspba_delay
    GENERIC MAP ( width => 5, depth => 1 )
    PORT MAP ( xin => tableAddrPos_uid92_fpExpEM1Test_b, xout => ld_tableAddrPos_uid92_fpExpEM1Test_b_to_addrDecTable_uid93_fpExpEM1Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_tableAddrPosExt_uid89_fpExpEM1Test_0_to_expSatValue_uid91_fpExpEM1Test_0(REG,406)@24
    reg_tableAddrPosExt_uid89_fpExpEM1Test_0_to_expSatValue_uid91_fpExpEM1Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_tableAddrPosExt_uid89_fpExpEM1Test_0_to_expSatValue_uid91_fpExpEM1Test_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_tableAddrPosExt_uid89_fpExpEM1Test_0_to_expSatValue_uid91_fpExpEM1Test_0_q <= tableAddrPosExt_uid89_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--expSatValue_uid91_fpExpEM1Test(COMPARE,90)@25
    expSatValue_uid91_fpExpEM1Test_cin <= GND_q;
    expSatValue_uid91_fpExpEM1Test_a <= STD_LOGIC_VECTOR((10 downto 9 => reg_tableAddrPosExt_uid89_fpExpEM1Test_0_to_expSatValue_uid91_fpExpEM1Test_0_q(8)) & reg_tableAddrPosExt_uid89_fpExpEM1Test_0_to_expSatValue_uid91_fpExpEM1Test_0_q) & '0';
    expSatValue_uid91_fpExpEM1Test_b <= STD_LOGIC_VECTOR('0' & "00000" & cstTabWidth_uid90_fpExpEM1Test_q) & expSatValue_uid91_fpExpEM1Test_cin(0);
            expSatValue_uid91_fpExpEM1Test_o <= STD_LOGIC_VECTOR(SIGNED(expSatValue_uid91_fpExpEM1Test_a) - SIGNED(expSatValue_uid91_fpExpEM1Test_b));
    expSatValue_uid91_fpExpEM1Test_n(0) <= not expSatValue_uid91_fpExpEM1Test_o(11);


	--addrDecTable_uid93_fpExpEM1Test(MUX,92)@25
    addrDecTable_uid93_fpExpEM1Test_s <= expSatValue_uid91_fpExpEM1Test_n;
    addrDecTable_uid93_fpExpEM1Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            addrDecTable_uid93_fpExpEM1Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE addrDecTable_uid93_fpExpEM1Test_s IS
                      WHEN "0" => addrDecTable_uid93_fpExpEM1Test_q <= ld_tableAddrPos_uid92_fpExpEM1Test_b_to_addrDecTable_uid93_fpExpEM1Test_c_q;
                      WHEN "1" => addrDecTable_uid93_fpExpEM1Test_q <= cstTabWidth_uid90_fpExpEM1Test_q;
                      WHEN OTHERS => addrDecTable_uid93_fpExpEM1Test_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--subDecrementMask_uid95_fpExpEM1Test(LOOKUP,94)@26
    subDecrementMask_uid95_fpExpEM1Test: PROCESS (addrDecTable_uid93_fpExpEM1Test_q)
    BEGIN
        -- Begin reserved scope level
            CASE (addrDecTable_uid93_fpExpEM1Test_q) IS
                WHEN "00000" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "10000";
                WHEN "00001" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11000";
                WHEN "00010" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11100";
                WHEN "00011" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11110";
                WHEN "00100" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "00101" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "00110" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "00111" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "01000" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "01001" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "01010" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "01011" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "01100" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "01101" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "01110" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "01111" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "10000" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "10001" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "10010" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "10011" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "10100" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "10101" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "10110" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "10111" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "11000" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "11111";
                WHEN "11001" =>  subDecrementMask_uid95_fpExpEM1Test_q <= "00000";
                WHEN OTHERS =>
                    subDecrementMask_uid95_fpExpEM1Test_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--subDecrementMask_uid94_fpExpEM1Test(LOOKUP,93)@26
    subDecrementMask_uid94_fpExpEM1Test: PROCESS (addrDecTable_uid93_fpExpEM1Test_q)
    BEGIN
        -- Begin reserved scope level
            CASE (addrDecTable_uid93_fpExpEM1Test_q) IS
                WHEN "00000" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "00000000000000000000";
                WHEN "00001" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "00000000000000000000";
                WHEN "00010" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "00000000000000000000";
                WHEN "00011" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "00000000000000000000";
                WHEN "00100" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "00000000000000000000";
                WHEN "00101" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "10000000000000000000";
                WHEN "00110" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11000000000000000000";
                WHEN "00111" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11100000000000000000";
                WHEN "01000" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11110000000000000000";
                WHEN "01001" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111000000000000000";
                WHEN "01010" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111100000000000000";
                WHEN "01011" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111110000000000000";
                WHEN "01100" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111111000000000000";
                WHEN "01101" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111111100000000000";
                WHEN "01110" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111111110000000000";
                WHEN "01111" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111111111000000000";
                WHEN "10000" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111111111100000000";
                WHEN "10001" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111111111110000000";
                WHEN "10010" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111111111111000000";
                WHEN "10011" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111111111111100000";
                WHEN "10100" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111111111111110000";
                WHEN "10101" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111111111111111000";
                WHEN "10110" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111111111111111100";
                WHEN "10111" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111111111111111110";
                WHEN "11000" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "11111111111111111111";
                WHEN "11001" =>  subDecrementMask_uid94_fpExpEM1Test_q <= "00000000000000000000";
                WHEN OTHERS =>
                    subDecrementMask_uid94_fpExpEM1Test_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--os_uid96_fpExpEM1Test(BITJOIN,95)@26
    os_uid96_fpExpEM1Test_q <= subDecrementMask_uid95_fpExpEM1Test_q & subDecrementMask_uid94_fpExpEM1Test_q;

	--highBBits_uid99_fpExpEM1Test(BITSELECT,98)@26
    highBBits_uid99_fpExpEM1Test_in <= os_uid96_fpExpEM1Test_q;
    highBBits_uid99_fpExpEM1Test_b <= highBBits_uid99_fpExpEM1Test_in(24 downto 1);

	--reg_highBBits_uid99_fpExpEM1Test_0_to_sumAHighB_uid100_fpExpEM1Test_1(REG,408)@26
    reg_highBBits_uid99_fpExpEM1Test_0_to_sumAHighB_uid100_fpExpEM1Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_highBBits_uid99_fpExpEM1Test_0_to_sumAHighB_uid100_fpExpEM1Test_1_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_highBBits_uid99_fpExpEM1Test_0_to_sumAHighB_uid100_fpExpEM1Test_1_q <= highBBits_uid99_fpExpEM1Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracR_uid79_fpExpEM1Test_b_to_zOFracRExp_uid97_fpExpEM1Test_a(DELAY,516)@25
    ld_fracR_uid79_fpExpEM1Test_b_to_zOFracRExp_uid97_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracR_uid79_fpExpEM1Test_b, xout => ld_fracR_uid79_fpExpEM1Test_b_to_zOFracRExp_uid97_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--zOFracRExp_uid97_fpExpEM1Test(BITJOIN,96)@26
    zOFracRExp_uid97_fpExpEM1Test_q <= GND_q & VCC_q & ld_fracR_uid79_fpExpEM1Test_b_to_zOFracRExp_uid97_fpExpEM1Test_a_q;

	--reg_zOFracRExp_uid97_fpExpEM1Test_0_to_sumAHighB_uid100_fpExpEM1Test_0(REG,407)@26
    reg_zOFracRExp_uid97_fpExpEM1Test_0_to_sumAHighB_uid100_fpExpEM1Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zOFracRExp_uid97_fpExpEM1Test_0_to_sumAHighB_uid100_fpExpEM1Test_0_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zOFracRExp_uid97_fpExpEM1Test_0_to_sumAHighB_uid100_fpExpEM1Test_0_q <= zOFracRExp_uid97_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid100_fpExpEM1Test(ADD,99)@27
    sumAHighB_uid100_fpExpEM1Test_a <= STD_LOGIC_VECTOR((25 downto 25 => reg_zOFracRExp_uid97_fpExpEM1Test_0_to_sumAHighB_uid100_fpExpEM1Test_0_q(24)) & reg_zOFracRExp_uid97_fpExpEM1Test_0_to_sumAHighB_uid100_fpExpEM1Test_0_q);
    sumAHighB_uid100_fpExpEM1Test_b <= STD_LOGIC_VECTOR((25 downto 24 => reg_highBBits_uid99_fpExpEM1Test_0_to_sumAHighB_uid100_fpExpEM1Test_1_q(23)) & reg_highBBits_uid99_fpExpEM1Test_0_to_sumAHighB_uid100_fpExpEM1Test_1_q);
            sumAHighB_uid100_fpExpEM1Test_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid100_fpExpEM1Test_a) + SIGNED(sumAHighB_uid100_fpExpEM1Test_b));
    sumAHighB_uid100_fpExpEM1Test_q <= sumAHighB_uid100_fpExpEM1Test_o(25 downto 0);


	--lowRangeB_uid98_fpExpEM1Test(BITSELECT,97)@26
    lowRangeB_uid98_fpExpEM1Test_in <= os_uid96_fpExpEM1Test_q(0 downto 0);
    lowRangeB_uid98_fpExpEM1Test_b <= lowRangeB_uid98_fpExpEM1Test_in(0 downto 0);

	--ld_lowRangeB_uid98_fpExpEM1Test_b_to_zoFracRPosPostSub_uid98_uid101_fpExpEM1Test_a(DELAY,521)@26
    ld_lowRangeB_uid98_fpExpEM1Test_b_to_zoFracRPosPostSub_uid98_uid101_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => lowRangeB_uid98_fpExpEM1Test_b, xout => ld_lowRangeB_uid98_fpExpEM1Test_b_to_zoFracRPosPostSub_uid98_uid101_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--zoFracRPosPostSub_uid98_uid101_fpExpEM1Test(BITJOIN,100)@27
    zoFracRPosPostSub_uid98_uid101_fpExpEM1Test_q <= sumAHighB_uid100_fpExpEM1Test_q & ld_lowRangeB_uid98_fpExpEM1Test_b_to_zoFracRPosPostSub_uid98_uid101_fpExpEM1Test_a_q;

	--udfBitSubPos_uid102_fpExpEM1Test(BITSELECT,101)@27
    udfBitSubPos_uid102_fpExpEM1Test_in <= zoFracRPosPostSub_uid98_uid101_fpExpEM1Test_q(24 downto 0);
    udfBitSubPos_uid102_fpExpEM1Test_b <= udfBitSubPos_uid102_fpExpEM1Test_in(24 downto 24);

	--invUdfBitSubPos_uid106_fpExpEM1Test(LOGICAL,105)@27
    invUdfBitSubPos_uid106_fpExpEM1Test_a <= udfBitSubPos_uid102_fpExpEM1Test_b;
    invUdfBitSubPos_uid106_fpExpEM1Test_q_i <= not invUdfBitSubPos_uid106_fpExpEM1Test_a;
    invUdfBitSubPos_uid106_fpExpEM1Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => invUdfBitSubPos_uid106_fpExpEM1Test_q, xin => invUdfBitSubPos_uid106_fpExpEM1Test_q_i, clk => clk, aclr => areset);

	--reg_expR_uid88_fpExpEM1Test_0_to_expRPosPost_uid107_fpExpEM1Test_0(REG,430)@24
    reg_expR_uid88_fpExpEM1Test_0_to_expRPosPost_uid107_fpExpEM1Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expR_uid88_fpExpEM1Test_0_to_expRPosPost_uid107_fpExpEM1Test_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expR_uid88_fpExpEM1Test_0_to_expRPosPost_uid107_fpExpEM1Test_0_q <= expR_uid88_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expR_uid88_fpExpEM1Test_0_to_expRPosPost_uid107_fpExpEM1Test_0_q_to_expRPosPost_uid107_fpExpEM1Test_a(DELAY,530)@25
    ld_reg_expR_uid88_fpExpEM1Test_0_to_expRPosPost_uid107_fpExpEM1Test_0_q_to_expRPosPost_uid107_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => reg_expR_uid88_fpExpEM1Test_0_to_expRPosPost_uid107_fpExpEM1Test_0_q, xout => ld_reg_expR_uid88_fpExpEM1Test_0_to_expRPosPost_uid107_fpExpEM1Test_0_q_to_expRPosPost_uid107_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--expRPosPost_uid107_fpExpEM1Test(SUB,106)@28
    expRPosPost_uid107_fpExpEM1Test_a <= STD_LOGIC_VECTOR("0" & ld_reg_expR_uid88_fpExpEM1Test_0_to_expRPosPost_uid107_fpExpEM1Test_0_q_to_expRPosPost_uid107_fpExpEM1Test_a_q);
    expRPosPost_uid107_fpExpEM1Test_b <= STD_LOGIC_VECTOR("00000000" & invUdfBitSubPos_uid106_fpExpEM1Test_q);
            expRPosPost_uid107_fpExpEM1Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expRPosPost_uid107_fpExpEM1Test_a) - UNSIGNED(expRPosPost_uid107_fpExpEM1Test_b));
    expRPosPost_uid107_fpExpEM1Test_q <= expRPosPost_uid107_fpExpEM1Test_o(8 downto 0);


	--expRPosPostRange_uid108_fpExpEM1Test(BITSELECT,107)@28
    expRPosPostRange_uid108_fpExpEM1Test_in <= expRPosPost_uid107_fpExpEM1Test_q(7 downto 0);
    expRPosPostRange_uid108_fpExpEM1Test_b <= expRPosPostRange_uid108_fpExpEM1Test_in(7 downto 0);

	--reg_expRPosPostRange_uid108_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_2(REG,431)@28
    reg_expRPosPostRange_uid108_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPosPostRange_uid108_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPosPostRange_uid108_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_2_q <= expRPosPostRange_uid108_fpExpEM1Test_b;
            END IF;
        END IF;
    END PROCESS;


	--posCloseBranch0_uid148_fpExpEM1Test(COMPARE,147)@0
    posCloseBranch0_uid148_fpExpEM1Test_cin <= GND_q;
    posCloseBranch0_uid148_fpExpEM1Test_a <= STD_LOGIC_VECTOR("00" & cstBiasM1_uid14_fpExpEM1Test_q) & '0';
    posCloseBranch0_uid148_fpExpEM1Test_b <= STD_LOGIC_VECTOR("00" & expX_uid6_fpExpEM1Test_b) & posCloseBranch0_uid148_fpExpEM1Test_cin(0);
            posCloseBranch0_uid148_fpExpEM1Test_o <= STD_LOGIC_VECTOR(UNSIGNED(posCloseBranch0_uid148_fpExpEM1Test_a) - UNSIGNED(posCloseBranch0_uid148_fpExpEM1Test_b));
    posCloseBranch0_uid148_fpExpEM1Test_n(0) <= not posCloseBranch0_uid148_fpExpEM1Test_o(10);


	--ld_posCloseBranch0_uid148_fpExpEM1Test_n_to_posCloseBranch_uid150_fpExpEM1Test_b(DELAY,582)@0
    ld_posCloseBranch0_uid148_fpExpEM1Test_n_to_posCloseBranch_uid150_fpExpEM1Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => posCloseBranch0_uid148_fpExpEM1Test_n, xout => ld_posCloseBranch0_uid148_fpExpEM1Test_n_to_posCloseBranch_uid150_fpExpEM1Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--InvSignX_uid144_fpExpEM1Test(LOGICAL,143)@4
    InvSignX_uid144_fpExpEM1Test_a <= ld_signX_uid7_fpExpEM1Test_b_to_expUnderflow_uid83_fpExpEM1Test_c_q;
    InvSignX_uid144_fpExpEM1Test_q <= not InvSignX_uid144_fpExpEM1Test_a;

	--posCloseBranch_uid150_fpExpEM1Test(LOGICAL,149)@4
    posCloseBranch_uid150_fpExpEM1Test_a <= InvSignX_uid144_fpExpEM1Test_q;
    posCloseBranch_uid150_fpExpEM1Test_b <= ld_posCloseBranch0_uid148_fpExpEM1Test_n_to_posCloseBranch_uid150_fpExpEM1Test_b_q;
    posCloseBranch_uid150_fpExpEM1Test_q <= posCloseBranch_uid150_fpExpEM1Test_a and posCloseBranch_uid150_fpExpEM1Test_b;

	--ld_posCloseBranch_uid150_fpExpEM1Test_q_to_concBranch_uid151_fpExpEM1Test_c(DELAY,585)@4
    ld_posCloseBranch_uid150_fpExpEM1Test_q_to_concBranch_uid151_fpExpEM1Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 20 )
    PORT MAP ( xin => posCloseBranch_uid150_fpExpEM1Test_q, xout => ld_posCloseBranch_uid150_fpExpEM1Test_q_to_concBranch_uid151_fpExpEM1Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--negFarBranch0_uid146_fpExpEM1Test(COMPARE,145)@24
    negFarBranch0_uid146_fpExpEM1Test_cin <= GND_q;
    negFarBranch0_uid146_fpExpEM1Test_a <= STD_LOGIC_VECTOR("00" & cstBiasM1_uid14_fpExpEM1Test_q) & '0';
    negFarBranch0_uid146_fpExpEM1Test_b <= STD_LOGIC_VECTOR("00" & expR_uid88_fpExpEM1Test_q) & negFarBranch0_uid146_fpExpEM1Test_cin(0);
            negFarBranch0_uid146_fpExpEM1Test_o <= STD_LOGIC_VECTOR(UNSIGNED(negFarBranch0_uid146_fpExpEM1Test_a) - UNSIGNED(negFarBranch0_uid146_fpExpEM1Test_b));
    negFarBranch0_uid146_fpExpEM1Test_n(0) <= not negFarBranch0_uid146_fpExpEM1Test_o(10);


	--ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_nor(LOGICAL,968)
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_nor_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q;
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_nor_b <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_sticky_ena_q;
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_nor_q <= not (ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_nor_a or ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_nor_b);

	--ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_mem_top(CONSTANT,964)
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_mem_top_q <= "010101";

	--ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmp(LOGICAL,965)
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmp_a <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_mem_top_q;
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdmux_q);
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmp_q <= "1" when ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmp_a = ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmp_b else "0";

	--ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmpReg(REG,966)
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmpReg_q <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_sticky_ena(REG,969)
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_nor_q = "1") THEN
                ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_sticky_ena_q <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_enaAnd(LOGICAL,970)
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_enaAnd_a <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_sticky_ena_q;
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_enaAnd_b <= en;
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_enaAnd_q <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_enaAnd_a and ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_enaAnd_b;

	--ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt(COUNTER,960)
    -- every=1, low=0, high=21, step=1, init=1
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_i = 20 THEN
                      ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_eq = '1') THEN
                        ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_i <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_i - 21;
                    ELSE
                        ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_i <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_i,5));


	--ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdreg(REG,961)
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdreg_q <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdmux(MUX,962)
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdmux_s <= en;
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdmux: PROCESS (ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdmux_s, ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdreg_q, ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_q)
    BEGIN
            CASE ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdmux_s IS
                  WHEN "0" => ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdmux_q <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdreg_q;
                  WHEN "1" => ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdmux_q <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem(DUALMEM,959)
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_ia <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_inputreg_q;
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_aa <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdreg_q;
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_ab <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_rdmux_q;
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_iq,
        address_a => ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_aa,
        data_a => ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_ia
    );
    ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_reset0 <= areset;
        ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_q <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_iq(0 downto 0);

	--negFarBranch_uid147_fpExpEM1Test(LOGICAL,146)@24
    negFarBranch_uid147_fpExpEM1Test_a <= ld_signX_uid7_fpExpEM1Test_b_to_negFarBranch_uid147_fpExpEM1Test_a_replace_mem_q;
    negFarBranch_uid147_fpExpEM1Test_b <= negFarBranch0_uid146_fpExpEM1Test_n;
    negFarBranch_uid147_fpExpEM1Test_q <= negFarBranch_uid147_fpExpEM1Test_a and negFarBranch_uid147_fpExpEM1Test_b;

	--cstBiasP1_uid15_fpExpEM1Test(CONSTANT,14)
    cstBiasP1_uid15_fpExpEM1Test_q <= "10000000";

	--posFarBranch0_uid143_fpExpEM1Test(COMPARE,142)@24
    posFarBranch0_uid143_fpExpEM1Test_cin <= GND_q;
    posFarBranch0_uid143_fpExpEM1Test_a <= STD_LOGIC_VECTOR("00" & expR_uid88_fpExpEM1Test_q) & '0';
    posFarBranch0_uid143_fpExpEM1Test_b <= STD_LOGIC_VECTOR("00" & cstBiasP1_uid15_fpExpEM1Test_q) & posFarBranch0_uid143_fpExpEM1Test_cin(0);
            posFarBranch0_uid143_fpExpEM1Test_o <= STD_LOGIC_VECTOR(UNSIGNED(posFarBranch0_uid143_fpExpEM1Test_a) - UNSIGNED(posFarBranch0_uid143_fpExpEM1Test_b));
    posFarBranch0_uid143_fpExpEM1Test_n(0) <= not posFarBranch0_uid143_fpExpEM1Test_o(10);


	--ld_InvSignX_uid144_fpExpEM1Test_q_to_posFarBranch_uid145_fpExpEM1Test_a(DELAY,575)@4
    ld_InvSignX_uid144_fpExpEM1Test_q_to_posFarBranch_uid145_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 20 )
    PORT MAP ( xin => InvSignX_uid144_fpExpEM1Test_q, xout => ld_InvSignX_uid144_fpExpEM1Test_q_to_posFarBranch_uid145_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--posFarBranch_uid145_fpExpEM1Test(LOGICAL,144)@24
    posFarBranch_uid145_fpExpEM1Test_a <= ld_InvSignX_uid144_fpExpEM1Test_q_to_posFarBranch_uid145_fpExpEM1Test_a_q;
    posFarBranch_uid145_fpExpEM1Test_b <= posFarBranch0_uid143_fpExpEM1Test_n;
    posFarBranch_uid145_fpExpEM1Test_q <= posFarBranch_uid145_fpExpEM1Test_a and posFarBranch_uid145_fpExpEM1Test_b;

	--concBranch_uid151_fpExpEM1Test(BITJOIN,150)@24
    concBranch_uid151_fpExpEM1Test_q <= ld_posCloseBranch_uid150_fpExpEM1Test_q_to_concBranch_uid151_fpExpEM1Test_c_q & negFarBranch_uid147_fpExpEM1Test_q & posFarBranch_uid145_fpExpEM1Test_q;

	--ld_concBranch_uid151_fpExpEM1Test_q_to_reg_concBranch_uid151_fpExpEM1Test_0_to_branchSelEnc_uid152_fpExpEM1Test_0_a(DELAY,864)@24
    ld_concBranch_uid151_fpExpEM1Test_q_to_reg_concBranch_uid151_fpExpEM1Test_0_to_branchSelEnc_uid152_fpExpEM1Test_0_a : dspba_delay
    GENERIC MAP ( width => 3, depth => 3 )
    PORT MAP ( xin => concBranch_uid151_fpExpEM1Test_q, xout => ld_concBranch_uid151_fpExpEM1Test_q_to_reg_concBranch_uid151_fpExpEM1Test_0_to_branchSelEnc_uid152_fpExpEM1Test_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_concBranch_uid151_fpExpEM1Test_0_to_branchSelEnc_uid152_fpExpEM1Test_0(REG,405)@27
    reg_concBranch_uid151_fpExpEM1Test_0_to_branchSelEnc_uid152_fpExpEM1Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concBranch_uid151_fpExpEM1Test_0_to_branchSelEnc_uid152_fpExpEM1Test_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concBranch_uid151_fpExpEM1Test_0_to_branchSelEnc_uid152_fpExpEM1Test_0_q <= ld_concBranch_uid151_fpExpEM1Test_q_to_reg_concBranch_uid151_fpExpEM1Test_0_to_branchSelEnc_uid152_fpExpEM1Test_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--branchSelEnc_uid152_fpExpEM1Test(LOOKUP,151)@28
    branchSelEnc_uid152_fpExpEM1Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            branchSelEnc_uid152_fpExpEM1Test_q <= "11";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_concBranch_uid151_fpExpEM1Test_0_to_branchSelEnc_uid152_fpExpEM1Test_0_q) IS
                WHEN "000" =>  branchSelEnc_uid152_fpExpEM1Test_q <= "11";
                WHEN "001" =>  branchSelEnc_uid152_fpExpEM1Test_q <= "00";
                WHEN "010" =>  branchSelEnc_uid152_fpExpEM1Test_q <= "01";
                WHEN "011" =>  branchSelEnc_uid152_fpExpEM1Test_q <= "11";
                WHEN "100" =>  branchSelEnc_uid152_fpExpEM1Test_q <= "10";
                WHEN "101" =>  branchSelEnc_uid152_fpExpEM1Test_q <= "00";
                WHEN "110" =>  branchSelEnc_uid152_fpExpEM1Test_q <= "10";
                WHEN "111" =>  branchSelEnc_uid152_fpExpEM1Test_q <= "10";
                WHEN OTHERS =>
                    branchSelEnc_uid152_fpExpEM1Test_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--expPostBranchSel_uid153_fpExpEM1Test(MUX,152)@29
    expPostBranchSel_uid153_fpExpEM1Test_s <= branchSelEnc_uid152_fpExpEM1Test_q;
    expPostBranchSel_uid153_fpExpEM1Test: PROCESS (expPostBranchSel_uid153_fpExpEM1Test_s, en, reg_expRPosPostRange_uid108_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_2_q, negBranchExp_uid124_fpExpEM1Test_q, reg_expBranchClosePos_uid139_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_4_q, ld_reg_expBranchCloseNeg_uid142_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_5_q_to_expPostBranchSel_uid153_fpExpEM1Test_f_q)
    BEGIN
            CASE expPostBranchSel_uid153_fpExpEM1Test_s IS
                  WHEN "00" => expPostBranchSel_uid153_fpExpEM1Test_q <= reg_expRPosPostRange_uid108_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_2_q;
                  WHEN "01" => expPostBranchSel_uid153_fpExpEM1Test_q <= negBranchExp_uid124_fpExpEM1Test_q;
                  WHEN "10" => expPostBranchSel_uid153_fpExpEM1Test_q <= reg_expBranchClosePos_uid139_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_4_q;
                  WHEN "11" => expPostBranchSel_uid153_fpExpEM1Test_q <= ld_reg_expBranchCloseNeg_uid142_fpExpEM1Test_0_to_expPostBranchSel_uid153_fpExpEM1Test_5_q_to_expPostBranchSel_uid153_fpExpEM1Test_f_q;
                  WHEN OTHERS => expPostBranchSel_uid153_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--cstZeroWE_uid11_fpExpEM1Test(CONSTANT,10)
    cstZeroWE_uid11_fpExpEM1Test_q <= "00000000";

	--ld_exc_N_uid28_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_c(DELAY,611)@4
    ld_exc_N_uid28_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => exc_N_uid28_fpExpEM1Test_q, xout => ld_exc_N_uid28_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--regXAndExpOverflowAndPos_uid156_fpExpEM1Test(LOGICAL,155)@4
    regXAndExpOverflowAndPos_uid156_fpExpEM1Test_a <= exc_R_uid32_fpExpEM1Test_q;
    regXAndExpOverflowAndPos_uid156_fpExpEM1Test_b <= expOvfInitial_uid49_fpExpEM1Test_b;
    regXAndExpOverflowAndPos_uid156_fpExpEM1Test_c <= InvSignX_uid144_fpExpEM1Test_q;
    regXAndExpOverflowAndPos_uid156_fpExpEM1Test_q <= regXAndExpOverflowAndPos_uid156_fpExpEM1Test_a and regXAndExpOverflowAndPos_uid156_fpExpEM1Test_b and regXAndExpOverflowAndPos_uid156_fpExpEM1Test_c;

	--ld_regXAndExpOverflowAndPos_uid156_fpExpEM1Test_q_to_excRInf_uid161_fpExpEM1Test_c(DELAY,608)@4
    ld_regXAndExpOverflowAndPos_uid156_fpExpEM1Test_q_to_excRInf_uid161_fpExpEM1Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => regXAndExpOverflowAndPos_uid156_fpExpEM1Test_q, xout => ld_regXAndExpOverflowAndPos_uid156_fpExpEM1Test_q_to_excRInf_uid161_fpExpEM1Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expOvfInitial_uid49_fpExpEM1Test_b_to_InvExpOvfInitial_uid157_fpExpEM1Test_a(DELAY,600)@4
    ld_expOvfInitial_uid49_fpExpEM1Test_b_to_InvExpOvfInitial_uid157_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => expOvfInitial_uid49_fpExpEM1Test_b, xout => ld_expOvfInitial_uid49_fpExpEM1Test_b_to_InvExpOvfInitial_uid157_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvExpOvfInitial_uid157_fpExpEM1Test(LOGICAL,156)@23
    InvExpOvfInitial_uid157_fpExpEM1Test_a <= ld_expOvfInitial_uid49_fpExpEM1Test_b_to_InvExpOvfInitial_uid157_fpExpEM1Test_a_q;
    InvExpOvfInitial_uid157_fpExpEM1Test_q <= not InvExpOvfInitial_uid157_fpExpEM1Test_a;

	--expOvf_uid82_fpExpEM1Test(COMPARE,81)@23
    expOvf_uid82_fpExpEM1Test_cin <= GND_q;
    expOvf_uid82_fpExpEM1Test_a <= STD_LOGIC_VECTOR((14 downto 13 => reg_expRPostBiasPreExc_uid78_fpExpEM1Test_0_to_expOvf_uid82_fpExpEM1Test_0_q(12)) & reg_expRPostBiasPreExc_uid78_fpExpEM1Test_0_to_expOvf_uid82_fpExpEM1Test_0_q) & '0';
    expOvf_uid82_fpExpEM1Test_b <= STD_LOGIC_VECTOR('0' & "000000" & cstAllOWE_uid17_fpExpEM1Test_q) & expOvf_uid82_fpExpEM1Test_cin(0);
            expOvf_uid82_fpExpEM1Test_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid82_fpExpEM1Test_a) - SIGNED(expOvf_uid82_fpExpEM1Test_b));
    expOvf_uid82_fpExpEM1Test_n(0) <= not expOvf_uid82_fpExpEM1Test_o(15);


	--ld_exc_R_uid32_fpExpEM1Test_q_to_regInAndOvf_uid158_fpExpEM1Test_a(DELAY,601)@4
    ld_exc_R_uid32_fpExpEM1Test_q_to_regInAndOvf_uid158_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => exc_R_uid32_fpExpEM1Test_q, xout => ld_exc_R_uid32_fpExpEM1Test_q_to_regInAndOvf_uid158_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--regInAndOvf_uid158_fpExpEM1Test(LOGICAL,157)@23
    regInAndOvf_uid158_fpExpEM1Test_a <= ld_exc_R_uid32_fpExpEM1Test_q_to_regInAndOvf_uid158_fpExpEM1Test_a_q;
    regInAndOvf_uid158_fpExpEM1Test_b <= expOvf_uid82_fpExpEM1Test_n;
    regInAndOvf_uid158_fpExpEM1Test_c <= InvExpOvfInitial_uid157_fpExpEM1Test_q;
    regInAndOvf_uid158_fpExpEM1Test_q <= regInAndOvf_uid158_fpExpEM1Test_a and regInAndOvf_uid158_fpExpEM1Test_b and regInAndOvf_uid158_fpExpEM1Test_c;

	--ld_exc_I_uid26_fpExpEM1Test_q_to_posInf_uid160_fpExpEM1Test_a(DELAY,604)@0
    ld_exc_I_uid26_fpExpEM1Test_q_to_posInf_uid160_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => exc_I_uid26_fpExpEM1Test_q, xout => ld_exc_I_uid26_fpExpEM1Test_q_to_posInf_uid160_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--posInf_uid160_fpExpEM1Test(LOGICAL,159)@4
    posInf_uid160_fpExpEM1Test_a <= ld_exc_I_uid26_fpExpEM1Test_q_to_posInf_uid160_fpExpEM1Test_a_q;
    posInf_uid160_fpExpEM1Test_b <= InvSignX_uid144_fpExpEM1Test_q;
    posInf_uid160_fpExpEM1Test_q <= posInf_uid160_fpExpEM1Test_a and posInf_uid160_fpExpEM1Test_b;

	--ld_posInf_uid160_fpExpEM1Test_q_to_excRInf_uid161_fpExpEM1Test_a(DELAY,606)@4
    ld_posInf_uid160_fpExpEM1Test_q_to_excRInf_uid161_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => posInf_uid160_fpExpEM1Test_q, xout => ld_posInf_uid160_fpExpEM1Test_q_to_excRInf_uid161_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRInf_uid161_fpExpEM1Test(LOGICAL,160)@23
    excRInf_uid161_fpExpEM1Test_a <= ld_posInf_uid160_fpExpEM1Test_q_to_excRInf_uid161_fpExpEM1Test_a_q;
    excRInf_uid161_fpExpEM1Test_b <= regInAndOvf_uid158_fpExpEM1Test_q;
    excRInf_uid161_fpExpEM1Test_c <= ld_regXAndExpOverflowAndPos_uid156_fpExpEM1Test_q_to_excRInf_uid161_fpExpEM1Test_c_q;
    excRInf_uid161_fpExpEM1Test_q <= excRInf_uid161_fpExpEM1Test_a or excRInf_uid161_fpExpEM1Test_b or excRInf_uid161_fpExpEM1Test_c;

	--ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_nor(LOGICAL,992)
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_nor_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q;
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_nor_b <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_sticky_ena_q;
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_nor_q <= not (ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_nor_a or ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_nor_b);

	--ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_mem_top(CONSTANT,988)
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_mem_top_q <= "010100";

	--ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmp(LOGICAL,989)
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmp_a <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_mem_top_q;
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdmux_q);
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmp_q <= "1" when ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmp_a = ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmp_b else "0";

	--ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmpReg(REG,990)
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmpReg_q <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_sticky_ena(REG,993)
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_nor_q = "1") THEN
                ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_sticky_ena_q <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_enaAnd(LOGICAL,994)
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_enaAnd_a <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_sticky_ena_q;
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_enaAnd_b <= en;
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_enaAnd_q <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_enaAnd_a and ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_enaAnd_b;

	--ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_inputreg(DELAY,982)
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid21_fpExpEM1Test_q, xout => ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt(COUNTER,984)
    -- every=1, low=0, high=20, step=1, init=1
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_i = 19 THEN
                      ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_eq = '1') THEN
                        ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_i <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_i - 20;
                    ELSE
                        ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_i <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_i,5));


	--ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdreg(REG,985)
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdreg_q <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdmux(MUX,986)
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdmux_s <= en;
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdmux: PROCESS (ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdmux_s, ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdreg_q, ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdmux_s IS
                  WHEN "0" => ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdmux_q <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdreg_q;
                  WHEN "1" => ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdmux_q <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem(DUALMEM,983)
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_ia <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_inputreg_q;
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_aa <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdreg_q;
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_ab <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_rdmux_q;
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 21,
        width_b => 1,
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
        clocken1 => ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_iq,
        address_a => ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_aa,
        data_a => ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_ia
    );
    ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_reset0 <= areset;
        ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_q <= ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_iq(0 downto 0);

	--concExc_uid162_fpExpEM1Test(BITJOIN,161)@23
    concExc_uid162_fpExpEM1Test_q <= ld_exc_N_uid28_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_c_q & excRInf_uid161_fpExpEM1Test_q & ld_expXIsZero_uid21_fpExpEM1Test_q_to_concExc_uid162_fpExpEM1Test_a_replace_mem_q;

	--reg_concExc_uid162_fpExpEM1Test_0_to_excREnc_uid163_fpExpEM1Test_0(REG,401)@23
    reg_concExc_uid162_fpExpEM1Test_0_to_excREnc_uid163_fpExpEM1Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid162_fpExpEM1Test_0_to_excREnc_uid163_fpExpEM1Test_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid162_fpExpEM1Test_0_to_excREnc_uid163_fpExpEM1Test_0_q <= concExc_uid162_fpExpEM1Test_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_concExc_uid162_fpExpEM1Test_0_to_excREnc_uid163_fpExpEM1Test_0_q_to_excREnc_uid163_fpExpEM1Test_a(DELAY,612)@24
    ld_reg_concExc_uid162_fpExpEM1Test_0_to_excREnc_uid163_fpExpEM1Test_0_q_to_excREnc_uid163_fpExpEM1Test_a : dspba_delay
    GENERIC MAP ( width => 3, depth => 5 )
    PORT MAP ( xin => reg_concExc_uid162_fpExpEM1Test_0_to_excREnc_uid163_fpExpEM1Test_0_q, xout => ld_reg_concExc_uid162_fpExpEM1Test_0_to_excREnc_uid163_fpExpEM1Test_0_q_to_excREnc_uid163_fpExpEM1Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--excREnc_uid163_fpExpEM1Test(LOOKUP,162)@29
    excREnc_uid163_fpExpEM1Test: PROCESS (ld_reg_concExc_uid162_fpExpEM1Test_0_to_excREnc_uid163_fpExpEM1Test_0_q_to_excREnc_uid163_fpExpEM1Test_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_concExc_uid162_fpExpEM1Test_0_to_excREnc_uid163_fpExpEM1Test_0_q_to_excREnc_uid163_fpExpEM1Test_a_q) IS
                WHEN "000" =>  excREnc_uid163_fpExpEM1Test_q <= "01";
                WHEN "001" =>  excREnc_uid163_fpExpEM1Test_q <= "00";
                WHEN "010" =>  excREnc_uid163_fpExpEM1Test_q <= "10";
                WHEN "011" =>  excREnc_uid163_fpExpEM1Test_q <= "00";
                WHEN "100" =>  excREnc_uid163_fpExpEM1Test_q <= "11";
                WHEN "101" =>  excREnc_uid163_fpExpEM1Test_q <= "00";
                WHEN "110" =>  excREnc_uid163_fpExpEM1Test_q <= "00";
                WHEN "111" =>  excREnc_uid163_fpExpEM1Test_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid163_fpExpEM1Test_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid171_fpExpEM1Test(MUX,170)@29
    expRPostExc_uid171_fpExpEM1Test_s <= excREnc_uid163_fpExpEM1Test_q;
    expRPostExc_uid171_fpExpEM1Test: PROCESS (expRPostExc_uid171_fpExpEM1Test_s, en, cstZeroWE_uid11_fpExpEM1Test_q, expPostBranchSel_uid153_fpExpEM1Test_q, cstAllOWE_uid17_fpExpEM1Test_q, cstAllOWE_uid17_fpExpEM1Test_q)
    BEGIN
            CASE expRPostExc_uid171_fpExpEM1Test_s IS
                  WHEN "00" => expRPostExc_uid171_fpExpEM1Test_q <= cstZeroWE_uid11_fpExpEM1Test_q;
                  WHEN "01" => expRPostExc_uid171_fpExpEM1Test_q <= expPostBranchSel_uid153_fpExpEM1Test_q;
                  WHEN "10" => expRPostExc_uid171_fpExpEM1Test_q <= cstAllOWE_uid17_fpExpEM1Test_q;
                  WHEN "11" => expRPostExc_uid171_fpExpEM1Test_q <= cstAllOWE_uid17_fpExpEM1Test_q;
                  WHEN OTHERS => expRPostExc_uid171_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oneFracRPostExc2_uid164_fpExpEM1Test(CONSTANT,163)
    oneFracRPostExc2_uid164_fpExpEM1Test_q <= "00000000000000000000001";

	--ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_nor(LOGICAL,979)
    ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_nor_a <= ld_oFracX_uid34_uid34_fpExpEM1Test_q_to_oFracXZwE_uid56_fpExpEM1Test_b_notEnable_q;
    ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_nor_b <= ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_sticky_ena_q;
    ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_nor_q <= not (ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_nor_a or ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_nor_b);

	--ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_sticky_ena(REG,980)
    ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_nor_q = "1") THEN
                ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_sticky_ena_q <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_enaAnd(LOGICAL,981)
    ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_enaAnd_a <= ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_sticky_ena_q;
    ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_enaAnd_b <= en;
    ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_enaAnd_q <= ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_enaAnd_a and ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_enaAnd_b;

	--fracBranchClosePosHigh_uid135_fpExpEM1Test(BITSELECT,134)@25
    fracBranchClosePosHigh_uid135_fpExpEM1Test_in <= prod2_uid132_fpExpEM1Test_q(47 downto 0);
    fracBranchClosePosHigh_uid135_fpExpEM1Test_b <= fracBranchClosePosHigh_uid135_fpExpEM1Test_in(47 downto 25);

	--fracBranchClosePosLow_uid136_fpExpEM1Test(BITSELECT,135)@25
    fracBranchClosePosLow_uid136_fpExpEM1Test_in <= prod2_uid132_fpExpEM1Test_q(46 downto 0);
    fracBranchClosePosLow_uid136_fpExpEM1Test_b <= fracBranchClosePosLow_uid136_fpExpEM1Test_in(46 downto 24);

	--fracBranchClosePos_uid137_fpExpEM1Test(MUX,136)@25
    fracBranchClosePos_uid137_fpExpEM1Test_s <= normBit2_uid133_fpExpEM1Test_b;
    fracBranchClosePos_uid137_fpExpEM1Test: PROCESS (fracBranchClosePos_uid137_fpExpEM1Test_s, en, fracBranchClosePosLow_uid136_fpExpEM1Test_b, fracBranchClosePosHigh_uid135_fpExpEM1Test_b)
    BEGIN
            CASE fracBranchClosePos_uid137_fpExpEM1Test_s IS
                  WHEN "0" => fracBranchClosePos_uid137_fpExpEM1Test_q <= fracBranchClosePosLow_uid136_fpExpEM1Test_b;
                  WHEN "1" => fracBranchClosePos_uid137_fpExpEM1Test_q <= fracBranchClosePosHigh_uid135_fpExpEM1Test_b;
                  WHEN OTHERS => fracBranchClosePos_uid137_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_inputreg(DELAY,971)
    ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracBranchClosePos_uid137_fpExpEM1Test_q, xout => ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem(DUALMEM,972)
    ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_ia <= ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_inputreg_q;
    ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_aa <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdreg_q;
    ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_ab <= ld_peOR_uid75_fpExpEM1Test_b_to_fracR_uid79_fpExpEM1Test_a_replace_rdmux_q;
    ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 23,
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
        clocken1 => ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_iq,
        address_a => ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_aa,
        data_a => ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_ia
    );
    ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_reset0 <= areset;
        ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_q <= ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_iq(22 downto 0);

	--negBranchFracNotNormHigh_uid121_fpExpEM1Test(BITSELECT,120)@28
    negBranchFracNotNormHigh_uid121_fpExpEM1Test_in <= negBranchFracNotNorm_uid118_fpExpEM1Test_q(23 downto 0);
    negBranchFracNotNormHigh_uid121_fpExpEM1Test_b <= negBranchFracNotNormHigh_uid121_fpExpEM1Test_in(23 downto 1);

	--negBranchFracNotNormLow_uid122_fpExpEM1Test(BITSELECT,121)@28
    negBranchFracNotNormLow_uid122_fpExpEM1Test_in <= negBranchFracNotNorm_uid118_fpExpEM1Test_q(22 downto 0);
    negBranchFracNotNormLow_uid122_fpExpEM1Test_b <= negBranchFracNotNormLow_uid122_fpExpEM1Test_in(22 downto 0);

	--negBranchFrac_uid123_fpExpEM1Test(MUX,122)@28
    negBranchFrac_uid123_fpExpEM1Test_s <= expNegBranchIsZero_uid120_fpExpEM1Test_b;
    negBranchFrac_uid123_fpExpEM1Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            negBranchFrac_uid123_fpExpEM1Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE negBranchFrac_uid123_fpExpEM1Test_s IS
                      WHEN "0" => negBranchFrac_uid123_fpExpEM1Test_q <= negBranchFracNotNormLow_uid122_fpExpEM1Test_b;
                      WHEN "1" => negBranchFrac_uid123_fpExpEM1Test_q <= negBranchFracNotNormHigh_uid121_fpExpEM1Test_b;
                      WHEN OTHERS => negBranchFrac_uid123_fpExpEM1Test_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--udfBitSubPosHigh_uid103_fpExpEM1Test(BITSELECT,102)@27
    udfBitSubPosHigh_uid103_fpExpEM1Test_in <= zoFracRPosPostSub_uid98_uid101_fpExpEM1Test_q(23 downto 0);
    udfBitSubPosHigh_uid103_fpExpEM1Test_b <= udfBitSubPosHigh_uid103_fpExpEM1Test_in(23 downto 1);

	--udfBitSubPosLow_uid104_fpExpEM1Test(BITSELECT,103)@27
    udfBitSubPosLow_uid104_fpExpEM1Test_in <= zoFracRPosPostSub_uid98_uid101_fpExpEM1Test_q(22 downto 0);
    udfBitSubPosLow_uid104_fpExpEM1Test_b <= udfBitSubPosLow_uid104_fpExpEM1Test_in(22 downto 0);

	--normFracRPosPost_uid105_fpExpEM1Test(MUX,104)@27
    normFracRPosPost_uid105_fpExpEM1Test_s <= udfBitSubPos_uid102_fpExpEM1Test_b;
    normFracRPosPost_uid105_fpExpEM1Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            normFracRPosPost_uid105_fpExpEM1Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE normFracRPosPost_uid105_fpExpEM1Test_s IS
                      WHEN "0" => normFracRPosPost_uid105_fpExpEM1Test_q <= udfBitSubPosLow_uid104_fpExpEM1Test_b;
                      WHEN "1" => normFracRPosPost_uid105_fpExpEM1Test_q <= udfBitSubPosHigh_uid103_fpExpEM1Test_b;
                      WHEN OTHERS => normFracRPosPost_uid105_fpExpEM1Test_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_normFracRPosPost_uid105_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_c(DELAY,593)@28
    ld_normFracRPosPost_uid105_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_c : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => normFracRPosPost_uid105_fpExpEM1Test_q, xout => ld_normFracRPosPost_uid105_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--fracPostBranchSel_uid154_fpExpEM1Test(MUX,153)@29
    fracPostBranchSel_uid154_fpExpEM1Test_s <= branchSelEnc_uid152_fpExpEM1Test_q;
    fracPostBranchSel_uid154_fpExpEM1Test: PROCESS (fracPostBranchSel_uid154_fpExpEM1Test_s, en, ld_normFracRPosPost_uid105_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_c_q, negBranchFrac_uid123_fpExpEM1Test_q, ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_q, ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_q)
    BEGIN
            CASE fracPostBranchSel_uid154_fpExpEM1Test_s IS
                  WHEN "00" => fracPostBranchSel_uid154_fpExpEM1Test_q <= ld_normFracRPosPost_uid105_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_c_q;
                  WHEN "01" => fracPostBranchSel_uid154_fpExpEM1Test_q <= negBranchFrac_uid123_fpExpEM1Test_q;
                  WHEN "10" => fracPostBranchSel_uid154_fpExpEM1Test_q <= ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_q;
                  WHEN "11" => fracPostBranchSel_uid154_fpExpEM1Test_q <= ld_fracBranchClosePos_uid137_fpExpEM1Test_q_to_fracPostBranchSel_uid154_fpExpEM1Test_e_replace_mem_q;
                  WHEN OTHERS => fracPostBranchSel_uid154_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRPostExc_uid167_fpExpEM1Test(MUX,166)@29
    fracRPostExc_uid167_fpExpEM1Test_s <= excREnc_uid163_fpExpEM1Test_q;
    fracRPostExc_uid167_fpExpEM1Test: PROCESS (fracRPostExc_uid167_fpExpEM1Test_s, en, cstAllZWF_uid18_fpExpEM1Test_q, fracPostBranchSel_uid154_fpExpEM1Test_q, cstAllZWF_uid18_fpExpEM1Test_q, oneFracRPostExc2_uid164_fpExpEM1Test_q)
    BEGIN
            CASE fracRPostExc_uid167_fpExpEM1Test_s IS
                  WHEN "00" => fracRPostExc_uid167_fpExpEM1Test_q <= cstAllZWF_uid18_fpExpEM1Test_q;
                  WHEN "01" => fracRPostExc_uid167_fpExpEM1Test_q <= fracPostBranchSel_uid154_fpExpEM1Test_q;
                  WHEN "10" => fracRPostExc_uid167_fpExpEM1Test_q <= cstAllZWF_uid18_fpExpEM1Test_q;
                  WHEN "11" => fracRPostExc_uid167_fpExpEM1Test_q <= oneFracRPostExc2_uid164_fpExpEM1Test_q;
                  WHEN OTHERS => fracRPostExc_uid167_fpExpEM1Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RExpE_uid172_fpExpEM1Test(BITJOIN,171)@29
    RExpE_uid172_fpExpEM1Test_q <= ld_signX_uid7_fpExpEM1Test_b_to_RExpE_uid172_fpExpEM1Test_c_replace_mem_q & expRPostExc_uid171_fpExpEM1Test_q & fracRPostExc_uid167_fpExpEM1Test_q;

	--xOut(GPOUT,4)@29
    q <= RExpE_uid172_fpExpEM1Test_q;


end normal;
