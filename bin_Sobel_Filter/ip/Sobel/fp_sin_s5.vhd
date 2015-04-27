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

-- VHDL created from fp_sin_s5
-- VHDL created on Wed Mar 13 12:44:09 2013


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

entity fp_sin_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_sin_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid6_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid7_fpSinPiTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid8_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal exc_R_uid21_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid21_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid21_fpSinPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid21_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal cstBiasMwShift_uid22_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMwShiftM2_uid23_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMwShiftM2_uid24_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal cstZwShiftP1_uid25_fpSinPiTest_q : std_logic_vector (13 downto 0);
    signal cmpYToOneMinusY_uid45_fpSinPiTest_a : std_logic_vector(70 downto 0);
    signal cmpYToOneMinusY_uid45_fpSinPiTest_b : std_logic_vector(70 downto 0);
    signal cmpYToOneMinusY_uid45_fpSinPiTest_o : std_logic_vector (70 downto 0);
    signal cmpYToOneMinusY_uid45_fpSinPiTest_cin : std_logic_vector (0 downto 0);
    signal cmpYToOneMinusY_uid45_fpSinPiTest_c : std_logic_vector (0 downto 0);
    signal cPi_uid52_fpSinPiTest_q : std_logic_vector (25 downto 0);
    signal p_uid54_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal p_uid54_fpSinPiTest_q : std_logic_vector (25 downto 0);
    signal biasM1_uid55_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal expP_uid59_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal expP_uid59_fpSinPiTest_q : std_logic_vector (8 downto 0);
    signal multSecondOperand_uid66_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal multSecondOperand_uid66_fpSinPiTest_q : std_logic_vector (25 downto 0);
    signal mul2xSinRes_uid67_fpSinPiTest_a : std_logic_vector (25 downto 0);
    signal mul2xSinRes_uid67_fpSinPiTest_b : std_logic_vector (25 downto 0);
    signal mul2xSinRes_uid67_fpSinPiTest_s1 : std_logic_vector (51 downto 0);
    signal mul2xSinRes_uid67_fpSinPiTest_pr : UNSIGNED (51 downto 0);
    signal mul2xSinRes_uid67_fpSinPiTest_q : std_logic_vector (51 downto 0);
    signal fracNaN_uid86_fpSinPiTest_q : std_logic_vector (22 downto 0);
    signal InvSinXIsXRR_uid94_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvSinXIsXRR_uid94_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal xBranch_uid124_rrx_uid28_fpSinPiTest_a : std_logic_vector(10 downto 0);
    signal xBranch_uid124_rrx_uid28_fpSinPiTest_b : std_logic_vector(10 downto 0);
    signal xBranch_uid124_rrx_uid28_fpSinPiTest_o : std_logic_vector (10 downto 0);
    signal xBranch_uid124_rrx_uid28_fpSinPiTest_cin : std_logic_vector (0 downto 0);
    signal xBranch_uid124_rrx_uid28_fpSinPiTest_n : std_logic_vector (0 downto 0);
    signal ZerosGB_uid139_rrx_uid28_fpSinPiTest_q : std_logic_vector (29 downto 0);
    signal leftShiftStage0Idx1Pad4_uid146_fxpX_uid40_fpSinPiTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage0Idx3Pad12_uid152_fxpX_uid40_fpSinPiTest_q : std_logic_vector (11 downto 0);
    signal leftShiftStage1Idx2Pad2_uid160_fxpX_uid40_fpSinPiTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1Idx3Pad3_uid163_fxpX_uid40_fpSinPiTest_q : std_logic_vector (2 downto 0);
    signal zs_uid169_lzcZ_uid50_fpSinPiTest_q : std_logic_vector (63 downto 0);
    signal vCount_uid171_lzcZ_uid50_fpSinPiTest_a : std_logic_vector(63 downto 0);
    signal vCount_uid171_lzcZ_uid50_fpSinPiTest_b : std_logic_vector(63 downto 0);
    signal vCount_uid171_lzcZ_uid50_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal mO_uid172_lzcZ_uid50_fpSinPiTest_q : std_logic_vector (62 downto 0);
    signal zs_uid177_lzcZ_uid50_fpSinPiTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid179_lzcZ_uid50_fpSinPiTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid179_lzcZ_uid50_fpSinPiTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid179_lzcZ_uid50_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal zs_uid183_lzcZ_uid50_fpSinPiTest_q : std_logic_vector (15 downto 0);
    signal vCount_uid197_lzcZ_uid50_fpSinPiTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid197_lzcZ_uid50_fpSinPiTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid197_lzcZ_uid50_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx2_uid216_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx3Pad24_uid226_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (23 downto 0);
    signal leftShiftStage2Idx3Pad6_uid237_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (5 downto 0);
    signal mO_uid270_zCount_uid134_rrx_uid28_fpSinPiTest_q : std_logic_vector (1 downto 0);
    signal vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid289_zCount_uid134_rrx_uid28_fpSinPiTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid289_zCount_uid134_rrx_uid28_fpSinPiTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid289_zCount_uid134_rrx_uid28_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal prodXY_uid327_pT1_uid255_sinPiZPolyEval_a : std_logic_vector (12 downto 0);
    signal prodXY_uid327_pT1_uid255_sinPiZPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXY_uid327_pT1_uid255_sinPiZPolyEval_s1 : std_logic_vector (25 downto 0);
    signal prodXY_uid327_pT1_uid255_sinPiZPolyEval_pr : SIGNED (26 downto 0);
    signal prodXY_uid327_pT1_uid255_sinPiZPolyEval_q : std_logic_vector (25 downto 0);
    signal prodXY_uid330_pT2_uid261_sinPiZPolyEval_a : std_logic_vector (17 downto 0);
    signal prodXY_uid330_pT2_uid261_sinPiZPolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid330_pT2_uid261_sinPiZPolyEval_s1 : std_logic_vector (40 downto 0);
    signal prodXY_uid330_pT2_uid261_sinPiZPolyEval_pr : SIGNED (41 downto 0);
    signal prodXY_uid330_pT2_uid261_sinPiZPolyEval_q : std_logic_vector (40 downto 0);
    signal rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_reset0 : std_logic;
    signal rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_ia : std_logic_vector (39 downto 0);
    signal rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_aa : std_logic_vector (7 downto 0);
    signal rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_ab : std_logic_vector (7 downto 0);
    signal rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_iq : std_logic_vector (39 downto 0);
    signal rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_q : std_logic_vector (39 downto 0);
    signal rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_reset0 : std_logic;
    signal rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_ia : std_logic_vector (37 downto 0);
    signal rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_aa : std_logic_vector (7 downto 0);
    signal rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_ab : std_logic_vector (7 downto 0);
    signal rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_iq : std_logic_vector (37 downto 0);
    signal rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_q : std_logic_vector (37 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_a : std_logic_vector (26 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_b : std_logic_vector (26 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_s1 : std_logic_vector (53 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_pr : UNSIGNED (53 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_q : std_logic_vector (53 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_a : std_logic_vector (26 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_b : std_logic_vector (26 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_s1 : std_logic_vector (53 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_pr : UNSIGNED (53 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_q : std_logic_vector (53 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_a : std_logic_vector (26 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_b : std_logic_vector (26 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_s1 : std_logic_vector (53 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_pr : UNSIGNED (53 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_q : std_logic_vector (53 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0_a : std_logic_vector(81 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0_b : std_logic_vector(81 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0_o : std_logic_vector (81 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0_q : std_logic_vector (81 downto 0);
    signal memoryC0_uid248_sinPiZTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC0_uid248_sinPiZTableGenerator_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid248_sinPiZTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid248_sinPiZTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid248_sinPiZTableGenerator_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid248_sinPiZTableGenerator_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid250_sinPiZTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC1_uid250_sinPiZTableGenerator_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid250_sinPiZTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid250_sinPiZTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid250_sinPiZTableGenerator_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid250_sinPiZTableGenerator_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid252_sinPiZTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC2_uid252_sinPiZTableGenerator_lutmem_ia : std_logic_vector (12 downto 0);
    signal memoryC2_uid252_sinPiZTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid252_sinPiZTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid252_sinPiZTableGenerator_lutmem_iq : std_logic_vector (12 downto 0);
    signal memoryC2_uid252_sinPiZTableGenerator_lutmem_q : std_logic_vector (12 downto 0);
    signal reg_expXTableAddr_uid126_rrx_uid28_fpSinPiTest_0_to_rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_0_to_os_uid129_rrx_uid28_fpSinPiTest_0_q : std_logic_vector (39 downto 0);
    signal reg_rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_0_to_os_uid129_rrx_uid28_fpSinPiTest_1_q : std_logic_vector (37 downto 0);
    signal reg_prod_uid131_rrx_uid28_fpSinPiTest_a_0_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_prod_uid131_rrx_uid28_fpSinPiTest_b_0_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_1_q : std_logic_vector (26 downto 0);
    signal reg_prod_uid131_rrx_uid28_fpSinPiTest_a_1_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_prod_uid131_rrx_uid28_fpSinPiTest_a_2_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_1_q : std_logic_vector (15 downto 0);
    signal reg_cStage_uid272_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_3_q : std_logic_vector (15 downto 0);
    signal reg_rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_2_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid278_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_2_q : std_logic_vector (1 downto 0);
    signal reg_vStage_uid290_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_3_q : std_logic_vector (1 downto 0);
    signal reg_vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_4_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel2Dto1_uid319_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_2_q : std_logic_vector (75 downto 0);
    signal reg_leftShiftStage1Idx1_uid312_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_3_q : std_logic_vector (75 downto 0);
    signal reg_leftShiftStage1Idx2_uid315_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_4_q : std_logic_vector (75 downto 0);
    signal reg_leftShiftStage1Idx3_uid318_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_5_q : std_logic_vector (75 downto 0);
    signal reg_fracCompOut_uid136_rrx_uid28_fpSinPiTest_0_to_finalFrac_uid141_rrx_uid28_fpSinPiTest_2_q : std_logic_vector (52 downto 0);
    signal reg_expCompOut_uid138_rrx_uid28_fpSinPiTest_0_to_finalExp_uid142_rrx_uid28_fpSinPiTest_2_q : std_logic_vector (7 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid155_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_2_q : std_logic_vector (67 downto 0);
    signal reg_pad_one_uid43_fpSinPiTest_0_to_oneMinusY_uid43_fpSinPiTest_0_q : std_logic_vector (66 downto 0);
    signal reg_y_uid42_fpSinPiTest_0_to_oneMinusY_uid43_fpSinPiTest_1_q : std_logic_vector (65 downto 0);
    signal reg_oneMinusY_uid43_fpSinPiTest_0_to_cmpYToOneMinusY_uid45_fpSinPiTest_0_q : std_logic_vector (67 downto 0);
    signal reg_yBottom_uid47_fpSinPiTest_0_to_z_uid48_fpSinPiTest_2_q : std_logic_vector (64 downto 0);
    signal reg_oMyBottom_uid46_fpSinPiTest_0_to_z_uid48_fpSinPiTest_3_q : std_logic_vector (64 downto 0);
    signal reg_rVStage_uid190_lzcZ_uid50_fpSinPiTest_0_to_vCount_uid191_lzcZ_uid50_fpSinPiTest_1_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid192_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid194_lzcZ_uid50_fpSinPiTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid196_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid200_lzcZ_uid50_fpSinPiTest_2_q : std_logic_vector (3 downto 0);
    signal reg_vStage_uid198_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid200_lzcZ_uid50_fpSinPiTest_3_q : std_logic_vector (3 downto 0);
    signal reg_vCount_uid185_lzcZ_uid50_fpSinPiTest_0_to_r_uid210_lzcZ_uid50_fpSinPiTest_4_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel4Dto3_uid229_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_2_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx1_uid222_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_3_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx2_uid225_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_4_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx3_uid228_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_5_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_2_q : std_logic_vector (64 downto 0);
    signal reg_sinXIsXRR_uid35_fpSinPiTest_2_to_p_uid54_fpSinPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_pHigh_uid53_fpSinPiTest_0_to_p_uid54_fpSinPiTest_2_q : std_logic_vector (25 downto 0);
    signal reg_zAddr_uid61_fpSinPiTest_0_to_memoryC2_uid252_sinPiZTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0_q : std_logic_vector (12 downto 0);
    signal reg_memoryC2_uid252_sinPiZTableGenerator_lutmem_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_1_q : std_logic_vector (12 downto 0);
    signal reg_zAddr_uid61_fpSinPiTest_0_to_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid258_sinPiZPolyEval_0_q : std_logic_vector (20 downto 0);
    signal reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q : std_logic_vector (17 downto 0);
    signal reg_s1_uid256_uid259_sinPiZPolyEval_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid264_sinPiZPolyEval_0_q : std_logic_vector (29 downto 0);
    signal reg_r_uid210_lzcZ_uid50_fpSinPiTest_0_to_expHardCase_uid56_fpSinPiTest_1_q : std_logic_vector (6 downto 0);
    signal reg_sinXIsXRR_uid35_fpSinPiTest_2_to_expP_uid59_fpSinPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_sinXIsXRR_uid35_fpSinPiTest_2_to_join_uid73_fpSinPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_expRCompE_uid78_fpSinPiTest_0_to_udf_uid80_fpSinPiTest_1_q : std_logic_vector (8 downto 0);
    signal reg_excSelBits_uid84_fpSinPiTest_0_to_excSel_uid85_fpSinPiTest_0_q : std_logic_vector (2 downto 0);
    signal reg_fracRComp_uid77_fpSinPiTest_0_to_fracRPostExc_uid88_fpSinPiTest_2_q : std_logic_vector (22 downto 0);
    signal reg_expRComp_uid79_fpSinPiTest_0_to_expRPostExc_uid92_fpSinPiTest_2_q : std_logic_vector (7 downto 0);
    signal ld_fracXRR_uid33_fpSinPiTest_b_to_oFracXRR_uid36_uid36_fpSinPiTest_a_q : std_logic_vector (52 downto 0);
    signal ld_y_uid42_fpSinPiTest_b_to_cmpYToOneMinusY_uid45_fpSinPiTest_b_q : std_logic_vector (65 downto 0);
    signal ld_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_p_uid54_fpSinPiTest_1_q_to_p_uid54_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsXRR_uid35_fpSinPiTest_n_to_multSecondOperand_uid66_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_fracRComp_uid77_fpSinPiTest_0_to_fracRPostExc_uid88_fpSinPiTest_2_q_to_fracRPostExc_uid88_fpSinPiTest_c_q : std_logic_vector (22 downto 0);
    signal ld_reg_expRComp_uid79_fpSinPiTest_0_to_expRPostExc_uid92_fpSinPiTest_2_q_to_expRPostExc_uid92_fpSinPiTest_c_q : std_logic_vector (7 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_InvSinXIsX_uid93_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsXRR_uid35_fpSinPiTest_n_to_InvSinXIsXRR_uid94_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid31_fpSinPiTest_b_to_signR_uid96_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid96_fpSinPiTest_q_to_sinXR_uid97_fpSinPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_xBranch_uid124_rrx_uid28_fpSinPiTest_n_to_finalFrac_uid141_rrx_uid28_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_xBranch_uid124_rrx_uid28_fpSinPiTest_n_to_finalExp_uid142_rrx_uid28_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_finalExp_uid142_rrx_uid28_fpSinPiTest_q_to_RRangeRed_uid143_rrx_uid28_fpSinPiTest_b_q : std_logic_vector (7 downto 0);
    signal ld_LeftShiftStage066dto0_uid158_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx1_uid159_fxpX_uid40_fpSinPiTest_b_q : std_logic_vector (66 downto 0);
    signal ld_LeftShiftStage065dto0_uid161_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx2_uid162_fxpX_uid40_fpSinPiTest_b_q : std_logic_vector (65 downto 0);
    signal ld_LeftShiftStage064dto0_uid164_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx3_uid165_fxpX_uid40_fpSinPiTest_b_q : std_logic_vector (64 downto 0);
    signal ld_reg_leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_1_q_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_b_q : std_logic_vector (1 downto 0);
    signal ld_vStage_uid173_lzcZ_uid50_fpSinPiTest_b_to_cStage_uid174_lzcZ_uid50_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_rVStage_uid170_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid176_lzcZ_uid50_fpSinPiTest_c_q : std_logic_vector (63 downto 0);
    signal ld_rVStage_uid178_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid182_lzcZ_uid50_fpSinPiTest_c_q : std_logic_vector (31 downto 0);
    signal ld_vStage_uid180_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid182_lzcZ_uid50_fpSinPiTest_d_q : std_logic_vector (31 downto 0);
    signal ld_vCount_uid191_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_d_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid179_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_f_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid171_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_g_q : std_logic_vector (0 downto 0);
    signal ld_LeftShiftStage162dto0_uid232_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx1_uid233_alignedZ_uid51_fpSinPiTest_b_q : std_logic_vector (62 downto 0);
    signal ld_LeftShiftStage160dto0_uid235_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx2_uid236_alignedZ_uid51_fpSinPiTest_b_q : std_logic_vector (60 downto 0);
    signal ld_LeftShiftStage158dto0_uid238_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx3_uid239_alignedZ_uid51_fpSinPiTest_b_q : std_logic_vector (58 downto 0);
    signal ld_leftShiftStageSel0Dto0_uid245_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_q_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_d_q : std_logic_vector (0 downto 0);
    signal ld_X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest_b_q : std_logic_vector (67 downto 0);
    signal ld_X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest_b_q : std_logic_vector (59 downto 0);
    signal ld_X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest_b_q : std_logic_vector (51 downto 0);
    signal ld_multFracBits_uid132_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_c_q : std_logic_vector (75 downto 0);
    signal ld_leftShiftStageSel0Dto0_uid324_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_q_to_prod_uid131_rrx_uid28_fpSinPiTest_align_2_a_q : std_logic_vector (53 downto 0);
    signal ld_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_q_to_reg_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_4_a_q : std_logic_vector (0 downto 0);
    signal ld_yBottom_uid47_fpSinPiTest_b_to_reg_yBottom_uid47_fpSinPiTest_0_to_z_uid48_fpSinPiTest_2_a_q : std_logic_vector (64 downto 0);
    signal ld_oMyBottom_uid46_fpSinPiTest_b_to_reg_oMyBottom_uid46_fpSinPiTest_0_to_z_uid48_fpSinPiTest_3_a_q : std_logic_vector (64 downto 0);
    signal ld_vCount_uid185_lzcZ_uid50_fpSinPiTest_q_to_reg_vCount_uid185_lzcZ_uid50_fpSinPiTest_0_to_r_uid210_lzcZ_uid50_fpSinPiTest_4_a_q : std_logic_vector (0 downto 0);
    signal ld_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_b_to_reg_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_yT1_uid254_sinPiZPolyEval_b_to_reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0_a_q : std_logic_vector (12 downto 0);
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_sinXIsXRR_uid35_fpSinPiTest_n_to_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_expP_uid59_fpSinPiTest_1_a_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsXRR_uid35_fpSinPiTest_n_to_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_join_uid73_fpSinPiTest_1_a_q : std_logic_vector (0 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_sticky_ena_q : signal is true;
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_reset0 : std_logic;
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_ia : std_logic_vector (25 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_iq : std_logic_vector (25 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_q : std_logic_vector (25 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_eq : std_logic;
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_sticky_ena_q : signal is true;
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_ia : std_logic_vector (25 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_iq : std_logic_vector (25 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_q : std_logic_vector (25 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_sticky_ena_q : signal is true;
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_inputreg_q : std_logic_vector (8 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_ia : std_logic_vector (8 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_iq : std_logic_vector (8 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_q : std_logic_vector (8 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_sticky_ena_q : signal is true;
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_sticky_ena_q : signal is true;
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_eq : std_logic;
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_sticky_ena_q : signal is true;
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_sticky_ena_q : signal is true;
    signal ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_reset0 : std_logic;
    signal ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_sticky_ena_q : signal is true;
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_reset0 : std_logic;
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_eq : std_logic;
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_sticky_ena_q : signal is true;
    signal ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_reset0 : std_logic;
    signal ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_sticky_ena_q : signal is true;
    signal ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_inputreg_q : std_logic_vector (31 downto 0);
    signal ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_sticky_ena_q : signal is true;
    signal ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_sticky_ena_q : signal is true;
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_reset0 : std_logic;
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_eq : std_logic;
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_sticky_ena_q : signal is true;
    signal ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_inputreg_q : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_ia : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_iq : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_q : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_sticky_ena_q : signal is true;
    signal ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_inputreg_q : std_logic_vector (64 downto 0);
    signal ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_reset0 : std_logic;
    signal ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_ia : std_logic_vector (64 downto 0);
    signal ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_iq : std_logic_vector (64 downto 0);
    signal ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_q : std_logic_vector (64 downto 0);
    signal ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_sticky_ena_q : signal is true;
    signal ld_X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg_q : std_logic_vector (67 downto 0);
    signal ld_X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg_q : std_logic_vector (59 downto 0);
    signal ld_X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg_q : std_logic_vector (51 downto 0);
    signal ld_multFracBits_uid132_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_c_inputreg_q : std_logic_vector (75 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_inputreg_q : std_logic_vector (17 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_ia : std_logic_vector (17 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_iq : std_logic_vector (17 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_q : std_logic_vector (17 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_sticky_ena_q : signal is true;
    signal ld_yT1_uid254_sinPiZPolyEval_b_to_reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0_a_inputreg_q : std_logic_vector (12 downto 0);
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_sticky_ena_q : signal is true;
    signal pad_one_uid43_fpSinPiTest_q : std_logic_vector (66 downto 0);
    signal signExtExpXRR_uid57_fpSinPiTest_q : std_logic_vector (8 downto 0);
    signal udf_uid80_fpSinPiTest_a : std_logic_vector(11 downto 0);
    signal udf_uid80_fpSinPiTest_b : std_logic_vector(11 downto 0);
    signal udf_uid80_fpSinPiTest_o : std_logic_vector (11 downto 0);
    signal udf_uid80_fpSinPiTest_cin : std_logic_vector (0 downto 0);
    signal udf_uid80_fpSinPiTest_n : std_logic_vector (0 downto 0);
    signal leftShiftStage1Idx1_uid159_fxpX_uid40_fpSinPiTest_q : std_logic_vector (67 downto 0);
    signal InvSinXIsX_uid93_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvSinXIsX_uid93_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal oFracXRR_uid36_uid36_fpSinPiTest_q : std_logic_vector (53 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal exp_uid9_fpSinPiTest_in : std_logic_vector (30 downto 0);
    signal exp_uid9_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal frac_uid13_fpSinPiTest_in : std_logic_vector (22 downto 0);
    signal frac_uid13_fpSinPiTest_b : std_logic_vector (22 downto 0);
    signal signX_uid31_fpSinPiTest_in : std_logic_vector (31 downto 0);
    signal signX_uid31_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal expFracX_uid99_px_uid27_fpSinPiTest_in : std_logic_vector (30 downto 0);
    signal expFracX_uid99_px_uid27_fpSinPiTest_b : std_logic_vector (30 downto 0);
    signal expXIsZero_uid10_fpSinPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid10_fpSinPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid10_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid12_fpSinPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid12_fpSinPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid12_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid14_fpSinPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid14_fpSinPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid14_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal sinXIsX_uid34_fpSinPiTest_a : std_logic_vector(10 downto 0);
    signal sinXIsX_uid34_fpSinPiTest_b : std_logic_vector(10 downto 0);
    signal sinXIsX_uid34_fpSinPiTest_o : std_logic_vector (10 downto 0);
    signal sinXIsX_uid34_fpSinPiTest_cin : std_logic_vector (0 downto 0);
    signal sinXIsX_uid34_fpSinPiTest_n : std_logic_vector (0 downto 0);
    signal oneMinusY_uid43_fpSinPiTest_a : std_logic_vector(67 downto 0);
    signal oneMinusY_uid43_fpSinPiTest_b : std_logic_vector(67 downto 0);
    signal oneMinusY_uid43_fpSinPiTest_o : std_logic_vector (67 downto 0);
    signal oneMinusY_uid43_fpSinPiTest_q : std_logic_vector (67 downto 0);
    signal z_uid48_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal z_uid48_fpSinPiTest_q : std_logic_vector (64 downto 0);
    signal expHardCase_uid56_fpSinPiTest_a : std_logic_vector(8 downto 0);
    signal expHardCase_uid56_fpSinPiTest_b : std_logic_vector(8 downto 0);
    signal expHardCase_uid56_fpSinPiTest_o : std_logic_vector (8 downto 0);
    signal expHardCase_uid56_fpSinPiTest_q : std_logic_vector (8 downto 0);
    signal xRegAndUdf_uid81_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal xRegAndUdf_uid81_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal xRegAndUdf_uid81_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal excRZero_uid82_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid82_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid82_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal excSel_uid85_fpSinPiTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid88_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid88_fpSinPiTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid92_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid92_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal finalExp_uid142_rrx_uid28_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal finalExp_uid142_rrx_uid28_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid182_lzcZ_uid50_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid182_lzcZ_uid50_fpSinPiTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid191_lzcZ_uid50_fpSinPiTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid191_lzcZ_uid50_fpSinPiTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid191_lzcZ_uid50_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid194_lzcZ_uid50_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid194_lzcZ_uid50_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid200_lzcZ_uid50_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid200_lzcZ_uid50_fpSinPiTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (64 downto 0);
    signal vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_q : std_logic_vector (15 downto 0);
    signal vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_q : std_logic_vector (75 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest_q : std_logic_vector (75 downto 0);
    signal extendedFracX_uid39_fpSinPiTest_q : std_logic_vector (67 downto 0);
    signal normBit_uid68_fpSinPiTest_in : std_logic_vector (51 downto 0);
    signal normBit_uid68_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal highRes_uid69_fpSinPiTest_in : std_logic_vector (50 downto 0);
    signal highRes_uid69_fpSinPiTest_b : std_logic_vector (23 downto 0);
    signal lowRes_uid70_fpSinPiTest_in : std_logic_vector (49 downto 0);
    signal lowRes_uid70_fpSinPiTest_b : std_logic_vector (23 downto 0);
    signal fracXRExt_uid140_rrx_uid28_fpSinPiTest_q : std_logic_vector (52 downto 0);
    signal leftShiftStage2Idx2_uid236_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx2_uid162_fxpX_uid40_fpSinPiTest_q : std_logic_vector (67 downto 0);
    signal leftShiftStage2Idx1_uid233_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx3_uid165_fxpX_uid40_fpSinPiTest_q : std_logic_vector (67 downto 0);
    signal cStage_uid174_lzcZ_uid50_fpSinPiTest_q : std_logic_vector (63 downto 0);
    signal leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage2Idx3_uid239_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (64 downto 0);
    signal prodXYTruncFR_uid328_pT1_uid255_sinPiZPolyEval_in : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid328_pT1_uid255_sinPiZPolyEval_b : std_logic_vector (13 downto 0);
    signal prodXYTruncFR_uid331_pT2_uid261_sinPiZPolyEval_in : std_logic_vector (40 downto 0);
    signal prodXYTruncFR_uid331_pT2_uid261_sinPiZPolyEval_b : std_logic_vector (23 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_align_0_q_int : std_logic_vector (53 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_align_0_q : std_logic_vector (53 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_align_1_q_int : std_logic_vector (80 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_align_1_q : std_logic_vector (80 downto 0);
    signal os_uid129_rrx_uid28_fpSinPiTest_q : std_logic_vector (77 downto 0);
    signal finalFrac_uid141_rrx_uid28_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal finalFrac_uid141_rrx_uid28_fpSinPiTest_q : std_logic_vector (52 downto 0);
    signal leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_q : std_logic_vector (67 downto 0);
    signal leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (64 downto 0);
    signal join_uid73_fpSinPiTest_q : std_logic_vector (1 downto 0);
    signal sinXR_uid97_fpSinPiTest_q : std_logic_vector (31 downto 0);
    signal RRangeRed_uid143_rrx_uid28_fpSinPiTest_q : std_logic_vector (61 downto 0);
    signal vStagei_uid176_lzcZ_uid50_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid176_lzcZ_uid50_fpSinPiTest_q : std_logic_vector (63 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_align_2_q_int : std_logic_vector (107 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_align_2_q : std_logic_vector (107 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmp_a : std_logic_vector(4 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmp_b : std_logic_vector(4 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmp_a : std_logic_vector(6 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmp_b : std_logic_vector(6 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal excSelBits_uid84_fpSinPiTest_q : std_logic_vector (2 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmp_a : std_logic_vector(6 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmp_b : std_logic_vector(6 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_nor_q : std_logic_vector(0 downto 0);
    signal fracX_uid120_rrx_uid28_fpSinPiTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid120_rrx_uid28_fpSinPiTest_b : std_logic_vector (22 downto 0);
    signal ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal oFracXRRSmallXRR_uid65_fpSinPiTest_in : std_logic_vector (53 downto 0);
    signal oFracXRRSmallXRR_uid65_fpSinPiTest_b : std_logic_vector (25 downto 0);
    signal R_uid100_px_uid27_fpSinPiTest_q : std_logic_vector (31 downto 0);
    signal InvExpXIsZero_uid20_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid20_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid16_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid16_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid19_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid19_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal oMyBottom_uid46_fpSinPiTest_in : std_logic_vector (64 downto 0);
    signal oMyBottom_uid46_fpSinPiTest_b : std_logic_vector (64 downto 0);
    signal zAddr_uid61_fpSinPiTest_in : std_logic_vector (64 downto 0);
    signal zAddr_uid61_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal zPPolyEval_uid62_fpSinPiTest_in : std_logic_vector (56 downto 0);
    signal zPPolyEval_uid62_fpSinPiTest_b : std_logic_vector (17 downto 0);
    signal rVStage_uid170_lzcZ_uid50_fpSinPiTest_in : std_logic_vector (64 downto 0);
    signal rVStage_uid170_lzcZ_uid50_fpSinPiTest_b : std_logic_vector (63 downto 0);
    signal vStage_uid173_lzcZ_uid50_fpSinPiTest_in : std_logic_vector (0 downto 0);
    signal vStage_uid173_lzcZ_uid50_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal X32dto0_uid214_alignedZ_uid51_fpSinPiTest_in : std_logic_vector (32 downto 0);
    signal X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b : std_logic_vector (32 downto 0);
    signal rVStage_uid184_lzcZ_uid50_fpSinPiTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid184_lzcZ_uid50_fpSinPiTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid186_lzcZ_uid50_fpSinPiTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid186_lzcZ_uid50_fpSinPiTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid196_lzcZ_uid50_fpSinPiTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid196_lzcZ_uid50_fpSinPiTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid198_lzcZ_uid50_fpSinPiTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid198_lzcZ_uid50_fpSinPiTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid202_lzcZ_uid50_fpSinPiTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid202_lzcZ_uid50_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid204_lzcZ_uid50_fpSinPiTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid204_lzcZ_uid50_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal LeftShiftStage162dto0_uid232_alignedZ_uid51_fpSinPiTest_in : std_logic_vector (62 downto 0);
    signal LeftShiftStage162dto0_uid232_alignedZ_uid51_fpSinPiTest_b : std_logic_vector (62 downto 0);
    signal LeftShiftStage160dto0_uid235_alignedZ_uid51_fpSinPiTest_in : std_logic_vector (60 downto 0);
    signal LeftShiftStage160dto0_uid235_alignedZ_uid51_fpSinPiTest_b : std_logic_vector (60 downto 0);
    signal LeftShiftStage158dto0_uid238_alignedZ_uid51_fpSinPiTest_in : std_logic_vector (58 downto 0);
    signal LeftShiftStage158dto0_uid238_alignedZ_uid51_fpSinPiTest_b : std_logic_vector (58 downto 0);
    signal rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid278_zCount_uid134_rrx_uid28_fpSinPiTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid278_zCount_uid134_rrx_uid28_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid282_zCount_uid134_rrx_uid28_fpSinPiTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid282_zCount_uid134_rrx_uid28_fpSinPiTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid284_zCount_uid134_rrx_uid28_fpSinPiTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid284_zCount_uid134_rrx_uid28_fpSinPiTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid294_zCount_uid134_rrx_uid28_fpSinPiTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid294_zCount_uid134_rrx_uid28_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage174dto0_uid322_normMult_uid135_rrx_uid28_fpSinPiTest_in : std_logic_vector (74 downto 0);
    signal LeftShiftStage174dto0_uid322_normMult_uid135_rrx_uid28_fpSinPiTest_b : std_logic_vector (74 downto 0);
    signal X63dto0_uid147_fxpX_uid40_fpSinPiTest_in : std_logic_vector (63 downto 0);
    signal X63dto0_uid147_fxpX_uid40_fpSinPiTest_b : std_logic_vector (63 downto 0);
    signal X59dto0_uid150_fxpX_uid40_fpSinPiTest_in : std_logic_vector (59 downto 0);
    signal X59dto0_uid150_fxpX_uid40_fpSinPiTest_b : std_logic_vector (59 downto 0);
    signal X55dto0_uid153_fxpX_uid40_fpSinPiTest_in : std_logic_vector (55 downto 0);
    signal X55dto0_uid153_fxpX_uid40_fpSinPiTest_b : std_logic_vector (55 downto 0);
    signal fracRCompPreRnd_uid71_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal fracRCompPreRnd_uid71_fpSinPiTest_q : std_logic_vector (23 downto 0);
    signal lowRangeB_uid256_sinPiZPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid256_sinPiZPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid257_sinPiZPolyEval_in : std_logic_vector (13 downto 0);
    signal highBBits_uid257_sinPiZPolyEval_b : std_logic_vector (12 downto 0);
    signal lowRangeB_uid262_sinPiZPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid262_sinPiZPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid263_sinPiZPolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid263_sinPiZPolyEval_b : std_logic_vector (21 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a_0_in : std_logic_vector (26 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a_0_b : std_logic_vector (26 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a_1_in : std_logic_vector (53 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a_1_b : std_logic_vector (26 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a_2_in : std_logic_vector (80 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_a_2_b : std_logic_vector (26 downto 0);
    signal intXParity_uid41_fpSinPiTest_in : std_logic_vector (67 downto 0);
    signal intXParity_uid41_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal y_uid42_fpSinPiTest_in : std_logic_vector (66 downto 0);
    signal y_uid42_fpSinPiTest_b : std_logic_vector (65 downto 0);
    signal LeftShiftStage263dto0_uid243_alignedZ_uid51_fpSinPiTest_in : std_logic_vector (63 downto 0);
    signal LeftShiftStage263dto0_uid243_alignedZ_uid51_fpSinPiTest_b : std_logic_vector (63 downto 0);
    signal rndOp_uid74_uid75_fpSinPiTest_q : std_logic_vector (25 downto 0);
    signal expXRR_uid32_fpSinPiTest_in : std_logic_vector (60 downto 0);
    signal expXRR_uid32_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal fracXRR_uid33_fpSinPiTest_in : std_logic_vector (52 downto 0);
    signal fracXRR_uid33_fpSinPiTest_b : std_logic_vector (52 downto 0);
    signal rVStage_uid178_lzcZ_uid50_fpSinPiTest_in : std_logic_vector (63 downto 0);
    signal rVStage_uid178_lzcZ_uid50_fpSinPiTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid180_lzcZ_uid50_fpSinPiTest_in : std_logic_vector (31 downto 0);
    signal vStage_uid180_lzcZ_uid50_fpSinPiTest_b : std_logic_vector (31 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_result_add_1_0_a : std_logic_vector(108 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_result_add_1_0_b : std_logic_vector(108 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_result_add_1_0_o : std_logic_vector (108 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_result_add_1_0_q : std_logic_vector (108 downto 0);
    signal oFracX_uid130_uid130_rrx_uid28_fpSinPiTest_q : std_logic_vector (23 downto 0);
    signal expX_uid119_rrx_uid28_fpSinPiTest_in : std_logic_vector (30 downto 0);
    signal expX_uid119_rrx_uid28_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal exc_N_uid17_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid17_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid17_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal yT1_uid254_sinPiZPolyEval_in : std_logic_vector (17 downto 0);
    signal yT1_uid254_sinPiZPolyEval_b : std_logic_vector (12 downto 0);
    signal vCount_uid185_lzcZ_uid50_fpSinPiTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid185_lzcZ_uid50_fpSinPiTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid185_lzcZ_uid50_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid188_lzcZ_uid50_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid188_lzcZ_uid50_fpSinPiTest_q : std_logic_vector (15 downto 0);
    signal vCount_uid203_lzcZ_uid50_fpSinPiTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid203_lzcZ_uid50_fpSinPiTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid203_lzcZ_uid50_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid206_lzcZ_uid50_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid206_lzcZ_uid50_fpSinPiTest_q : std_logic_vector (1 downto 0);
    signal vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid286_zCount_uid134_rrx_uid28_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid286_zCount_uid134_rrx_uid28_fpSinPiTest_q : std_logic_vector (3 downto 0);
    signal vCount_uid295_zCount_uid134_rrx_uid28_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid295_zCount_uid134_rrx_uid28_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid295_zCount_uid134_rrx_uid28_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage2Idx1_uid323_normMult_uid135_rrx_uid28_fpSinPiTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage0Idx1_uid148_fxpX_uid40_fpSinPiTest_q : std_logic_vector (67 downto 0);
    signal leftShiftStage0Idx2_uid151_fxpX_uid40_fpSinPiTest_q : std_logic_vector (67 downto 0);
    signal leftShiftStage0Idx3_uid154_fxpX_uid40_fpSinPiTest_q : std_logic_vector (67 downto 0);
    signal expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_q : std_logic_vector (32 downto 0);
    signal sumAHighB_uid258_sinPiZPolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid258_sinPiZPolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid258_sinPiZPolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid258_sinPiZPolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid264_sinPiZPolyEval_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid264_sinPiZPolyEval_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid264_sinPiZPolyEval_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid264_sinPiZPolyEval_q : std_logic_vector (30 downto 0);
    signal signComp_uid95_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal signComp_uid95_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal signComp_uid95_fpSinPiTest_c : std_logic_vector(0 downto 0);
    signal signComp_uid95_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal yBottom_uid47_fpSinPiTest_in : std_logic_vector (64 downto 0);
    signal yBottom_uid47_fpSinPiTest_b : std_logic_vector (64 downto 0);
    signal leftShiftStage3Idx1_uid244_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (64 downto 0);
    signal expRCompFracRComp_uid76_fpSinPiTest_a : std_logic_vector(34 downto 0);
    signal expRCompFracRComp_uid76_fpSinPiTest_b : std_logic_vector(34 downto 0);
    signal expRCompFracRComp_uid76_fpSinPiTest_o : std_logic_vector (34 downto 0);
    signal expRCompFracRComp_uid76_fpSinPiTest_q : std_logic_vector (33 downto 0);
    signal sinXIsXRR_uid35_fpSinPiTest_a : std_logic_vector(11 downto 0);
    signal sinXIsXRR_uid35_fpSinPiTest_b : std_logic_vector(11 downto 0);
    signal sinXIsXRR_uid35_fpSinPiTest_o : std_logic_vector (11 downto 0);
    signal sinXIsXRR_uid35_fpSinPiTest_cin : std_logic_vector (0 downto 0);
    signal sinXIsXRR_uid35_fpSinPiTest_n : std_logic_vector (0 downto 0);
    signal fxpXShiftValExt_uid37_fpSinPiTest_a : std_logic_vector(10 downto 0);
    signal fxpXShiftValExt_uid37_fpSinPiTest_b : std_logic_vector(10 downto 0);
    signal fxpXShiftValExt_uid37_fpSinPiTest_o : std_logic_vector (10 downto 0);
    signal fxpXShiftValExt_uid37_fpSinPiTest_q : std_logic_vector (9 downto 0);
    signal multFracBits_uid132_rrx_uid28_fpSinPiTest_in : std_logic_vector (75 downto 0);
    signal multFracBits_uid132_rrx_uid28_fpSinPiTest_b : std_logic_vector (75 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_b_0_in : std_logic_vector (26 downto 0);
    signal prod_uid131_rrx_uid28_fpSinPiTest_b_0_b : std_logic_vector (26 downto 0);
    signal expXTableAddrExt_uid125_rrx_uid28_fpSinPiTest_a : std_logic_vector(8 downto 0);
    signal expXTableAddrExt_uid125_rrx_uid28_fpSinPiTest_b : std_logic_vector(8 downto 0);
    signal expXTableAddrExt_uid125_rrx_uid28_fpSinPiTest_o : std_logic_vector (8 downto 0);
    signal expXTableAddrExt_uid125_rrx_uid28_fpSinPiTest_q : std_logic_vector (8 downto 0);
    signal InvExc_N_uid18_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid18_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid83_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid83_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid83_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal rVStage_uid190_lzcZ_uid50_fpSinPiTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid190_lzcZ_uid50_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid192_lzcZ_uid50_fpSinPiTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid192_lzcZ_uid50_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid208_lzcZ_uid50_fpSinPiTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid208_lzcZ_uid50_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid290_zCount_uid134_rrx_uid28_fpSinPiTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid290_zCount_uid134_rrx_uid28_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_q : std_logic_vector (4 downto 0);
    signal leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_q : std_logic_vector (67 downto 0);
    signal s1_uid256_uid259_sinPiZPolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid262_uid265_sinPiZPolyEval_q : std_logic_vector (32 downto 0);
    signal signR_uid96_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal signR_uid96_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal signR_uid96_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (64 downto 0);
    signal fracRComp_uid77_fpSinPiTest_in : std_logic_vector (23 downto 0);
    signal fracRComp_uid77_fpSinPiTest_b : std_logic_vector (22 downto 0);
    signal expRCompE_uid78_fpSinPiTest_in : std_logic_vector (32 downto 0);
    signal expRCompE_uid78_fpSinPiTest_b : std_logic_vector (8 downto 0);
    signal fxpXShiftVal_uid38_fpSinPiTest_in : std_logic_vector (3 downto 0);
    signal fxpXShiftVal_uid38_fpSinPiTest_b : std_logic_vector (3 downto 0);
    signal multFracBitsTop_uid133_rrx_uid28_fpSinPiTest_in : std_logic_vector (75 downto 0);
    signal multFracBitsTop_uid133_rrx_uid28_fpSinPiTest_b : std_logic_vector (29 downto 0);
    signal X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_in : std_logic_vector (67 downto 0);
    signal X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_b : std_logic_vector (67 downto 0);
    signal X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_in : std_logic_vector (59 downto 0);
    signal X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_b : std_logic_vector (59 downto 0);
    signal X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_in : std_logic_vector (51 downto 0);
    signal X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_b : std_logic_vector (51 downto 0);
    signal expXTableAddr_uid126_rrx_uid28_fpSinPiTest_in : std_logic_vector (7 downto 0);
    signal expXTableAddr_uid126_rrx_uid28_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal vCount_uid209_lzcZ_uid50_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid209_lzcZ_uid50_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid209_lzcZ_uid50_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal expCompOutExt_uid137_rrx_uid28_fpSinPiTest_a : std_logic_vector(8 downto 0);
    signal expCompOutExt_uid137_rrx_uid28_fpSinPiTest_b : std_logic_vector(8 downto 0);
    signal expCompOutExt_uid137_rrx_uid28_fpSinPiTest_o : std_logic_vector (8 downto 0);
    signal expCompOutExt_uid137_rrx_uid28_fpSinPiTest_q : std_logic_vector (8 downto 0);
    signal leftShiftStageSel4Dto3_uid308_normMult_uid135_rrx_uid28_fpSinPiTest_in : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto3_uid308_normMult_uid135_rrx_uid28_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel2Dto1_uid319_normMult_uid135_rrx_uid28_fpSinPiTest_in : std_logic_vector (2 downto 0);
    signal leftShiftStageSel2Dto1_uid319_normMult_uid135_rrx_uid28_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel0Dto0_uid324_normMult_uid135_rrx_uid28_fpSinPiTest_in : std_logic_vector (0 downto 0);
    signal leftShiftStageSel0Dto0_uid324_normMult_uid135_rrx_uid28_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal fracCompOut_uid136_rrx_uid28_fpSinPiTest_in : std_logic_vector (74 downto 0);
    signal fracCompOut_uid136_rrx_uid28_fpSinPiTest_b : std_logic_vector (52 downto 0);
    signal LeftShiftStage066dto0_uid158_fxpX_uid40_fpSinPiTest_in : std_logic_vector (66 downto 0);
    signal LeftShiftStage066dto0_uid158_fxpX_uid40_fpSinPiTest_b : std_logic_vector (66 downto 0);
    signal LeftShiftStage065dto0_uid161_fxpX_uid40_fpSinPiTest_in : std_logic_vector (65 downto 0);
    signal LeftShiftStage065dto0_uid161_fxpX_uid40_fpSinPiTest_b : std_logic_vector (65 downto 0);
    signal LeftShiftStage064dto0_uid164_fxpX_uid40_fpSinPiTest_in : std_logic_vector (64 downto 0);
    signal LeftShiftStage064dto0_uid164_fxpX_uid40_fpSinPiTest_b : std_logic_vector (64 downto 0);
    signal fxpSinRes_uid64_fpSinPiTest_in : std_logic_vector (30 downto 0);
    signal fxpSinRes_uid64_fpSinPiTest_b : std_logic_vector (25 downto 0);
    signal pHigh_uid53_fpSinPiTest_in : std_logic_vector (64 downto 0);
    signal pHigh_uid53_fpSinPiTest_b : std_logic_vector (25 downto 0);
    signal expRComp_uid79_fpSinPiTest_in : std_logic_vector (7 downto 0);
    signal expRComp_uid79_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal leftShiftStageSel3Dto2_uid155_fxpX_uid40_fpSinPiTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid155_fxpX_uid40_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest_in : std_logic_vector (29 downto 0);
    signal rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid271_zCount_uid134_rrx_uid28_fpSinPiTest_in : std_logic_vector (13 downto 0);
    signal vStage_uid271_zCount_uid134_rrx_uid28_fpSinPiTest_b : std_logic_vector (13 downto 0);
    signal r_uid210_lzcZ_uid50_fpSinPiTest_q : std_logic_vector (6 downto 0);
    signal expCompOut_uid138_rrx_uid28_fpSinPiTest_in : std_logic_vector (7 downto 0);
    signal expCompOut_uid138_rrx_uid28_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_q : std_logic_vector (75 downto 0);
    signal cStage_uid272_zCount_uid134_rrx_uid28_fpSinPiTest_q : std_logic_vector (15 downto 0);
    signal leftShiftStageSel6Dto5_uid218_alignedZ_uid51_fpSinPiTest_in : std_logic_vector (6 downto 0);
    signal leftShiftStageSel6Dto5_uid218_alignedZ_uid51_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel4Dto3_uid229_alignedZ_uid51_fpSinPiTest_in : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto3_uid229_alignedZ_uid51_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_in : std_logic_vector (2 downto 0);
    signal leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel0Dto0_uid245_alignedZ_uid51_fpSinPiTest_in : std_logic_vector (0 downto 0);
    signal leftShiftStageSel0Dto0_uid245_alignedZ_uid51_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage073dto0_uid311_normMult_uid135_rrx_uid28_fpSinPiTest_in : std_logic_vector (73 downto 0);
    signal LeftShiftStage073dto0_uid311_normMult_uid135_rrx_uid28_fpSinPiTest_b : std_logic_vector (73 downto 0);
    signal LeftShiftStage071dto0_uid314_normMult_uid135_rrx_uid28_fpSinPiTest_in : std_logic_vector (71 downto 0);
    signal LeftShiftStage071dto0_uid314_normMult_uid135_rrx_uid28_fpSinPiTest_b : std_logic_vector (71 downto 0);
    signal LeftShiftStage069dto0_uid317_normMult_uid135_rrx_uid28_fpSinPiTest_in : std_logic_vector (69 downto 0);
    signal LeftShiftStage069dto0_uid317_normMult_uid135_rrx_uid28_fpSinPiTest_b : std_logic_vector (69 downto 0);
    signal leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx1_uid312_normMult_uid135_rrx_uid28_fpSinPiTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage1Idx2_uid315_normMult_uid135_rrx_uid28_fpSinPiTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage1Idx3_uid318_normMult_uid135_rrx_uid28_fpSinPiTest_q : std_logic_vector (75 downto 0);
    signal LeftShiftStage056dto0_uid221_alignedZ_uid51_fpSinPiTest_in : std_logic_vector (56 downto 0);
    signal LeftShiftStage056dto0_uid221_alignedZ_uid51_fpSinPiTest_b : std_logic_vector (56 downto 0);
    signal LeftShiftStage048dto0_uid224_alignedZ_uid51_fpSinPiTest_in : std_logic_vector (48 downto 0);
    signal LeftShiftStage048dto0_uid224_alignedZ_uid51_fpSinPiTest_b : std_logic_vector (48 downto 0);
    signal LeftShiftStage040dto0_uid227_alignedZ_uid51_fpSinPiTest_in : std_logic_vector (40 downto 0);
    signal LeftShiftStage040dto0_uid227_alignedZ_uid51_fpSinPiTest_b : std_logic_vector (40 downto 0);
    signal leftShiftStage1Idx1_uid222_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx2_uid225_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx3_uid228_alignedZ_uid51_fpSinPiTest_q : std_logic_vector (64 downto 0);
begin


	--xIn(GPIN,3)@0

	--X55dto0_uid153_fxpX_uid40_fpSinPiTest(BITSELECT,152)@15
    X55dto0_uid153_fxpX_uid40_fpSinPiTest_in <= extendedFracX_uid39_fpSinPiTest_q(55 downto 0);
    X55dto0_uid153_fxpX_uid40_fpSinPiTest_b <= X55dto0_uid153_fxpX_uid40_fpSinPiTest_in(55 downto 0);

	--leftShiftStage0Idx3Pad12_uid152_fxpX_uid40_fpSinPiTest(CONSTANT,151)
    leftShiftStage0Idx3Pad12_uid152_fxpX_uid40_fpSinPiTest_q <= "000000000000";

	--leftShiftStage0Idx3_uid154_fxpX_uid40_fpSinPiTest(BITJOIN,153)@15
    leftShiftStage0Idx3_uid154_fxpX_uid40_fpSinPiTest_q <= X55dto0_uid153_fxpX_uid40_fpSinPiTest_b & leftShiftStage0Idx3Pad12_uid152_fxpX_uid40_fpSinPiTest_q;

	--X59dto0_uid150_fxpX_uid40_fpSinPiTest(BITSELECT,149)@15
    X59dto0_uid150_fxpX_uid40_fpSinPiTest_in <= extendedFracX_uid39_fpSinPiTest_q(59 downto 0);
    X59dto0_uid150_fxpX_uid40_fpSinPiTest_b <= X59dto0_uid150_fxpX_uid40_fpSinPiTest_in(59 downto 0);

	--cstAllZWE_uid8_fpSinPiTest(CONSTANT,7)
    cstAllZWE_uid8_fpSinPiTest_q <= "00000000";

	--leftShiftStage0Idx2_uid151_fxpX_uid40_fpSinPiTest(BITJOIN,150)@15
    leftShiftStage0Idx2_uid151_fxpX_uid40_fpSinPiTest_q <= X59dto0_uid150_fxpX_uid40_fpSinPiTest_b & cstAllZWE_uid8_fpSinPiTest_q;

	--X63dto0_uid147_fxpX_uid40_fpSinPiTest(BITSELECT,146)@15
    X63dto0_uid147_fxpX_uid40_fpSinPiTest_in <= extendedFracX_uid39_fpSinPiTest_q(63 downto 0);
    X63dto0_uid147_fxpX_uid40_fpSinPiTest_b <= X63dto0_uid147_fxpX_uid40_fpSinPiTest_in(63 downto 0);

	--leftShiftStage0Idx1Pad4_uid146_fxpX_uid40_fpSinPiTest(CONSTANT,145)
    leftShiftStage0Idx1Pad4_uid146_fxpX_uid40_fpSinPiTest_q <= "0000";

	--leftShiftStage0Idx1_uid148_fxpX_uid40_fpSinPiTest(BITJOIN,147)@15
    leftShiftStage0Idx1_uid148_fxpX_uid40_fpSinPiTest_q <= X63dto0_uid147_fxpX_uid40_fpSinPiTest_b & leftShiftStage0Idx1Pad4_uid146_fxpX_uid40_fpSinPiTest_q;

	--cstZwShiftP1_uid25_fpSinPiTest(CONSTANT,24)
    cstZwShiftP1_uid25_fpSinPiTest_q <= "00000000000000";

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--GND(CONSTANT,0)
    GND_q <= "0";

	--ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable(LOGICAL,818)
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_a <= en;
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q <= not ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_a;

	--ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_nor(LOGICAL,971)
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_nor_b <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_sticky_ena_q;
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_nor_q <= not (ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_nor_a or ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_nor_b);

	--ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_mem_top(CONSTANT,967)
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_mem_top_q <= "01010";

	--ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmp(LOGICAL,968)
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmp_a <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_mem_top_q;
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdmux_q);
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmp_q <= "1" when ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmp_a = ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmp_b else "0";

	--ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmpReg(REG,969)
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmpReg_q <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_sticky_ena(REG,972)
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_nor_q = "1") THEN
                ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_sticky_ena_q <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_enaAnd(LOGICAL,973)
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_enaAnd_a <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_sticky_ena_q;
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_enaAnd_b <= en;
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_enaAnd_q <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_enaAnd_a and ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_enaAnd_b;

	--expFracX_uid99_px_uid27_fpSinPiTest(BITSELECT,98)@0
    expFracX_uid99_px_uid27_fpSinPiTest_in <= a(30 downto 0);
    expFracX_uid99_px_uid27_fpSinPiTest_b <= expFracX_uid99_px_uid27_fpSinPiTest_in(30 downto 0);

	--R_uid100_px_uid27_fpSinPiTest(BITJOIN,99)@0
    R_uid100_px_uid27_fpSinPiTest_q <= GND_q & expFracX_uid99_px_uid27_fpSinPiTest_b;

	--expX_uid119_rrx_uid28_fpSinPiTest(BITSELECT,118)@0
    expX_uid119_rrx_uid28_fpSinPiTest_in <= R_uid100_px_uid27_fpSinPiTest_q(30 downto 0);
    expX_uid119_rrx_uid28_fpSinPiTest_b <= expX_uid119_rrx_uid28_fpSinPiTest_in(30 downto 23);

	--ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_inputreg(DELAY,961)
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expX_uid119_rrx_uid28_fpSinPiTest_b, xout => ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt(COUNTER,963)
    -- every=1, low=0, high=10, step=1, init=1
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_i = 9 THEN
                      ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_eq = '1') THEN
                        ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_i <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_i - 10;
                    ELSE
                        ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_i <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_i,4));


	--ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdreg(REG,964)
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdreg_q <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdmux(MUX,965)
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdmux_s <= en;
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdmux: PROCESS (ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdmux_s, ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdreg_q, ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdmux_q <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdreg_q;
                  WHEN "1" => ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdmux_q <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem(DUALMEM,962)
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_ia <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_inputreg_q;
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_aa <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdreg_q;
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_ab <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_rdmux_q;
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 8,
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
        clocken1 => ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_iq,
        address_a => ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_aa,
        data_a => ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_ia
    );
    ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_reset0 <= areset;
        ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_q <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_iq(7 downto 0);

	--zs_uid183_lzcZ_uid50_fpSinPiTest(CONSTANT,182)
    zs_uid183_lzcZ_uid50_fpSinPiTest_q <= "0000000000000000";

	--ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_nor(LOGICAL,945)
    ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_nor_b <= ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_sticky_ena_q;
    ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_nor_q <= not (ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_nor_a or ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_nor_b);

	--ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_cmpReg(REG,841)
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_sticky_ena(REG,946)
    ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_nor_q = "1") THEN
                ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_sticky_ena_q <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_enaAnd(LOGICAL,947)
    ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_enaAnd_a <= ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_sticky_ena_q;
    ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_enaAnd_b <= en;
    ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_enaAnd_q <= ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_enaAnd_a and ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_enaAnd_b;

	--ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_inputreg(DELAY,937)
    ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => R_uid100_px_uid27_fpSinPiTest_q, xout => ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdcnt(COUNTER,837)
    -- every=1, low=0, high=1, step=1, init=1
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdcnt_i <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdcnt_i,1));


	--ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdreg(REG,838)
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdreg_q <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdmux(MUX,839)
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdmux_s <= en;
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdmux: PROCESS (ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdmux_s, ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdreg_q, ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdmux_q <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdmux_q <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem(DUALMEM,938)
    ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_ia <= ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_inputreg_q;
    ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_aa <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdreg_q;
    ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_ab <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdmux_q;
    ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 32,
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
        clocken1 => ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_iq,
        address_a => ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_aa,
        data_a => ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_ia
    );
    ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_reset0 <= areset;
        ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_q <= ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_iq(31 downto 0);

	--fracX_uid120_rrx_uid28_fpSinPiTest(BITSELECT,119)@4
    fracX_uid120_rrx_uid28_fpSinPiTest_in <= ld_R_uid100_px_uid27_fpSinPiTest_q_to_fracX_uid120_rrx_uid28_fpSinPiTest_a_replace_mem_q(22 downto 0);
    fracX_uid120_rrx_uid28_fpSinPiTest_b <= fracX_uid120_rrx_uid28_fpSinPiTest_in(22 downto 0);

	--oFracX_uid130_uid130_rrx_uid28_fpSinPiTest(BITJOIN,129)@4
    oFracX_uid130_uid130_rrx_uid28_fpSinPiTest_q <= VCC_q & fracX_uid120_rrx_uid28_fpSinPiTest_b;

	--prod_uid131_rrx_uid28_fpSinPiTest_b_0(BITSELECT,337)@4
    prod_uid131_rrx_uid28_fpSinPiTest_b_0_in <= STD_LOGIC_VECTOR("000" & oFracX_uid130_uid130_rrx_uid28_fpSinPiTest_q);
    prod_uid131_rrx_uid28_fpSinPiTest_b_0_b <= prod_uid131_rrx_uid28_fpSinPiTest_b_0_in(26 downto 0);

	--reg_prod_uid131_rrx_uid28_fpSinPiTest_b_0_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_1(REG,354)@4
    reg_prod_uid131_rrx_uid28_fpSinPiTest_b_0_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid131_rrx_uid28_fpSinPiTest_b_0_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid131_rrx_uid28_fpSinPiTest_b_0_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_1_q <= prod_uid131_rrx_uid28_fpSinPiTest_b_0_b;
            END IF;
        END IF;
    END PROCESS;


	--cstBiasMwShift_uid22_fpSinPiTest(CONSTANT,21)
    cstBiasMwShift_uid22_fpSinPiTest_q <= "01110011";

	--expXTableAddrExt_uid125_rrx_uid28_fpSinPiTest(SUB,124)@0
    expXTableAddrExt_uid125_rrx_uid28_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & expX_uid119_rrx_uid28_fpSinPiTest_b);
    expXTableAddrExt_uid125_rrx_uid28_fpSinPiTest_b <= STD_LOGIC_VECTOR("0" & cstBiasMwShift_uid22_fpSinPiTest_q);
            expXTableAddrExt_uid125_rrx_uid28_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXTableAddrExt_uid125_rrx_uid28_fpSinPiTest_a) - UNSIGNED(expXTableAddrExt_uid125_rrx_uid28_fpSinPiTest_b));
    expXTableAddrExt_uid125_rrx_uid28_fpSinPiTest_q <= expXTableAddrExt_uid125_rrx_uid28_fpSinPiTest_o(8 downto 0);


	--expXTableAddr_uid126_rrx_uid28_fpSinPiTest(BITSELECT,125)@0
    expXTableAddr_uid126_rrx_uid28_fpSinPiTest_in <= expXTableAddrExt_uid125_rrx_uid28_fpSinPiTest_q(7 downto 0);
    expXTableAddr_uid126_rrx_uid28_fpSinPiTest_b <= expXTableAddr_uid126_rrx_uid28_fpSinPiTest_in(7 downto 0);

	--reg_expXTableAddr_uid126_rrx_uid28_fpSinPiTest_0_to_rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_0(REG,349)@0
    reg_expXTableAddr_uid126_rrx_uid28_fpSinPiTest_0_to_rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXTableAddr_uid126_rrx_uid28_fpSinPiTest_0_to_rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXTableAddr_uid126_rrx_uid28_fpSinPiTest_0_to_rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_0_q <= expXTableAddr_uid126_rrx_uid28_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem(DUALMEM,333)@1
    rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_ia <= (others => '0');
    rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_aa <= (others => '0');
    rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_ab <= reg_expXTableAddr_uid126_rrx_uid28_fpSinPiTest_0_to_rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_0_q;
    rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 38,
        widthad_a => 8,
        numwords_a => 140,
        width_b => 38,
        widthad_b => 8,
        numwords_b => 140,
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
        init_file => "fp_sin_s5_rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_reset0,
        clock0 => clk,
        address_b => rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_iq,
        address_a => rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_aa,
        data_a => rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_ia
    );
    rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_reset0 <= areset;
        rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_q <= rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_iq(37 downto 0);

	--reg_rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_0_to_os_uid129_rrx_uid28_fpSinPiTest_1(REG,352)@3
    reg_rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_0_to_os_uid129_rrx_uid28_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_0_to_os_uid129_rrx_uid28_fpSinPiTest_1_q <= "00000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_0_to_os_uid129_rrx_uid28_fpSinPiTest_1_q <= rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem(DUALMEM,332)@1
    rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_ia <= (others => '0');
    rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_aa <= (others => '0');
    rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_ab <= reg_expXTableAddr_uid126_rrx_uid28_fpSinPiTest_0_to_rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_0_q;
    rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 140,
        width_b => 40,
        widthad_b => 8,
        numwords_b => 140,
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
        init_file => "fp_sin_s5_rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_reset0,
        clock0 => clk,
        address_b => rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_iq,
        address_a => rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_aa,
        data_a => rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_ia
    );
    rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_reset0 <= areset;
        rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_q <= rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_iq(39 downto 0);

	--reg_rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_0_to_os_uid129_rrx_uid28_fpSinPiTest_0(REG,351)@3
    reg_rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_0_to_os_uid129_rrx_uid28_fpSinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_0_to_os_uid129_rrx_uid28_fpSinPiTest_0_q <= "0000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_0_to_os_uid129_rrx_uid28_fpSinPiTest_0_q <= rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid129_rrx_uid28_fpSinPiTest(BITJOIN,128)@4
    os_uid129_rrx_uid28_fpSinPiTest_q <= reg_rrTable_uid128_rrx_uid28_fpSinPiTest_lutmem_0_to_os_uid129_rrx_uid28_fpSinPiTest_1_q & reg_rrTable_uid127_rrx_uid28_fpSinPiTest_lutmem_0_to_os_uid129_rrx_uid28_fpSinPiTest_0_q;

	--prod_uid131_rrx_uid28_fpSinPiTest_a_2(BITSELECT,336)@4
    prod_uid131_rrx_uid28_fpSinPiTest_a_2_in <= STD_LOGIC_VECTOR("000" & os_uid129_rrx_uid28_fpSinPiTest_q);
    prod_uid131_rrx_uid28_fpSinPiTest_a_2_b <= prod_uid131_rrx_uid28_fpSinPiTest_a_2_in(80 downto 54);

	--reg_prod_uid131_rrx_uid28_fpSinPiTest_a_2_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_0(REG,357)@4
    reg_prod_uid131_rrx_uid28_fpSinPiTest_a_2_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid131_rrx_uid28_fpSinPiTest_a_2_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid131_rrx_uid28_fpSinPiTest_a_2_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_0_q <= prod_uid131_rrx_uid28_fpSinPiTest_a_2_b;
            END IF;
        END IF;
    END PROCESS;


	--prod_uid131_rrx_uid28_fpSinPiTest_a2_b0(MULT,340)@5
    prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_pr <= UNSIGNED(prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_a) * UNSIGNED(prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_b);
    prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_a <= (others => '0');
            prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_b <= (others => '0');
            prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_a <= reg_prod_uid131_rrx_uid28_fpSinPiTest_a_2_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_0_q;
                prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_b <= reg_prod_uid131_rrx_uid28_fpSinPiTest_b_0_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_1_q;
                prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_s1 <= STD_LOGIC_VECTOR(prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid131_rrx_uid28_fpSinPiTest_a2_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_q <= prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--ld_prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_q_to_prod_uid131_rrx_uid28_fpSinPiTest_align_2_a(DELAY,736)@8
    ld_prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_q_to_prod_uid131_rrx_uid28_fpSinPiTest_align_2_a : dspba_delay
    GENERIC MAP ( width => 54, depth => 1 )
    PORT MAP ( xin => prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_q, xout => ld_prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_q_to_prod_uid131_rrx_uid28_fpSinPiTest_align_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--prod_uid131_rrx_uid28_fpSinPiTest_align_2(BITSHIFT,343)@9
    prod_uid131_rrx_uid28_fpSinPiTest_align_2_q_int <= ld_prod_uid131_rrx_uid28_fpSinPiTest_a2_b0_q_to_prod_uid131_rrx_uid28_fpSinPiTest_align_2_a_q & "000000000000000000000000000000000000000000000000000000";
    prod_uid131_rrx_uid28_fpSinPiTest_align_2_q <= prod_uid131_rrx_uid28_fpSinPiTest_align_2_q_int(107 downto 0);

	--prod_uid131_rrx_uid28_fpSinPiTest_a_1(BITSELECT,335)@4
    prod_uid131_rrx_uid28_fpSinPiTest_a_1_in <= os_uid129_rrx_uid28_fpSinPiTest_q(53 downto 0);
    prod_uid131_rrx_uid28_fpSinPiTest_a_1_b <= prod_uid131_rrx_uid28_fpSinPiTest_a_1_in(53 downto 27);

	--reg_prod_uid131_rrx_uid28_fpSinPiTest_a_1_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_0(REG,355)@4
    reg_prod_uid131_rrx_uid28_fpSinPiTest_a_1_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid131_rrx_uid28_fpSinPiTest_a_1_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid131_rrx_uid28_fpSinPiTest_a_1_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_0_q <= prod_uid131_rrx_uid28_fpSinPiTest_a_1_b;
            END IF;
        END IF;
    END PROCESS;


	--prod_uid131_rrx_uid28_fpSinPiTest_a1_b0(MULT,339)@5
    prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_pr <= UNSIGNED(prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_a) * UNSIGNED(prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_b);
    prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_a <= (others => '0');
            prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_b <= (others => '0');
            prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_a <= reg_prod_uid131_rrx_uid28_fpSinPiTest_a_1_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_0_q;
                prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_b <= reg_prod_uid131_rrx_uid28_fpSinPiTest_b_0_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_1_q;
                prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_s1 <= STD_LOGIC_VECTOR(prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid131_rrx_uid28_fpSinPiTest_a1_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_q <= prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--prod_uid131_rrx_uid28_fpSinPiTest_align_1(BITSHIFT,342)@8
    prod_uid131_rrx_uid28_fpSinPiTest_align_1_q_int <= prod_uid131_rrx_uid28_fpSinPiTest_a1_b0_q & "000000000000000000000000000";
    prod_uid131_rrx_uid28_fpSinPiTest_align_1_q <= prod_uid131_rrx_uid28_fpSinPiTest_align_1_q_int(80 downto 0);

	--prod_uid131_rrx_uid28_fpSinPiTest_a_0(BITSELECT,334)@4
    prod_uid131_rrx_uid28_fpSinPiTest_a_0_in <= os_uid129_rrx_uid28_fpSinPiTest_q(26 downto 0);
    prod_uid131_rrx_uid28_fpSinPiTest_a_0_b <= prod_uid131_rrx_uid28_fpSinPiTest_a_0_in(26 downto 0);

	--reg_prod_uid131_rrx_uid28_fpSinPiTest_a_0_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_0(REG,353)@4
    reg_prod_uid131_rrx_uid28_fpSinPiTest_a_0_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid131_rrx_uid28_fpSinPiTest_a_0_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid131_rrx_uid28_fpSinPiTest_a_0_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_0_q <= prod_uid131_rrx_uid28_fpSinPiTest_a_0_b;
            END IF;
        END IF;
    END PROCESS;


	--prod_uid131_rrx_uid28_fpSinPiTest_a0_b0(MULT,338)@5
    prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_pr <= UNSIGNED(prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_a) * UNSIGNED(prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_b);
    prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_a <= (others => '0');
            prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_b <= (others => '0');
            prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_a <= reg_prod_uid131_rrx_uid28_fpSinPiTest_a_0_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_0_q;
                prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_b <= reg_prod_uid131_rrx_uid28_fpSinPiTest_b_0_0_to_prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_1_q;
                prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_s1 <= STD_LOGIC_VECTOR(prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid131_rrx_uid28_fpSinPiTest_a0_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_q <= prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--prod_uid131_rrx_uid28_fpSinPiTest_align_0(BITSHIFT,341)@8
    prod_uid131_rrx_uid28_fpSinPiTest_align_0_q_int <= prod_uid131_rrx_uid28_fpSinPiTest_a0_b0_q;
    prod_uid131_rrx_uid28_fpSinPiTest_align_0_q <= prod_uid131_rrx_uid28_fpSinPiTest_align_0_q_int(53 downto 0);

	--prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0(ADD,344)@8
    prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0_a <= STD_LOGIC_VECTOR("0000000000000000000000000000" & prod_uid131_rrx_uid28_fpSinPiTest_align_0_q);
    prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & prod_uid131_rrx_uid28_fpSinPiTest_align_1_q);
    prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0_a) + UNSIGNED(prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0_b));
        END IF;
    END PROCESS;
    prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0_q <= prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0_o(81 downto 0);


	--prod_uid131_rrx_uid28_fpSinPiTest_result_add_1_0(ADD,345)@9
    prod_uid131_rrx_uid28_fpSinPiTest_result_add_1_0_a <= STD_LOGIC_VECTOR("000000000000000000000000000" & prod_uid131_rrx_uid28_fpSinPiTest_result_add_0_0_q);
    prod_uid131_rrx_uid28_fpSinPiTest_result_add_1_0_b <= STD_LOGIC_VECTOR("0" & prod_uid131_rrx_uid28_fpSinPiTest_align_2_q);
            prod_uid131_rrx_uid28_fpSinPiTest_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_uid131_rrx_uid28_fpSinPiTest_result_add_1_0_a) + UNSIGNED(prod_uid131_rrx_uid28_fpSinPiTest_result_add_1_0_b));
    prod_uid131_rrx_uid28_fpSinPiTest_result_add_1_0_q <= prod_uid131_rrx_uid28_fpSinPiTest_result_add_1_0_o(108 downto 0);


	--multFracBits_uid132_rrx_uid28_fpSinPiTest(BITSELECT,131)@9
    multFracBits_uid132_rrx_uid28_fpSinPiTest_in <= prod_uid131_rrx_uid28_fpSinPiTest_result_add_1_0_q(75 downto 0);
    multFracBits_uid132_rrx_uid28_fpSinPiTest_b <= multFracBits_uid132_rrx_uid28_fpSinPiTest_in(75 downto 0);

	--multFracBitsTop_uid133_rrx_uid28_fpSinPiTest(BITSELECT,132)@9
    multFracBitsTop_uid133_rrx_uid28_fpSinPiTest_in <= multFracBits_uid132_rrx_uid28_fpSinPiTest_b;
    multFracBitsTop_uid133_rrx_uid28_fpSinPiTest_b <= multFracBitsTop_uid133_rrx_uid28_fpSinPiTest_in(75 downto 46);

	--rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest(BITSELECT,267)@9
    rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest_in <= multFracBitsTop_uid133_rrx_uid28_fpSinPiTest_b;
    rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest_b <= rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest_in(29 downto 14);

	--reg_rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_1(REG,359)@9
    reg_rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_1_q <= rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest(LOGICAL,268)@10
    vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_a <= reg_rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_1_q;
    vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_b <= zs_uid183_lzcZ_uid50_fpSinPiTest_q;
    vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_q <= "1" when vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_a = vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_b else "0";

	--ld_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_q_to_reg_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_4_a(DELAY,762)@10
    ld_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_q_to_reg_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_4_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_q, xout => ld_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_q_to_reg_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_4_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_4(REG,367)@11
    reg_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_4_q <= ld_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_q_to_reg_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_4_a_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid271_zCount_uid134_rrx_uid28_fpSinPiTest(BITSELECT,270)@9
    vStage_uid271_zCount_uid134_rrx_uid28_fpSinPiTest_in <= multFracBitsTop_uid133_rrx_uid28_fpSinPiTest_b(13 downto 0);
    vStage_uid271_zCount_uid134_rrx_uid28_fpSinPiTest_b <= vStage_uid271_zCount_uid134_rrx_uid28_fpSinPiTest_in(13 downto 0);

	--mO_uid270_zCount_uid134_rrx_uid28_fpSinPiTest(CONSTANT,269)
    mO_uid270_zCount_uid134_rrx_uid28_fpSinPiTest_q <= "11";

	--cStage_uid272_zCount_uid134_rrx_uid28_fpSinPiTest(BITJOIN,271)@9
    cStage_uid272_zCount_uid134_rrx_uid28_fpSinPiTest_q <= vStage_uid271_zCount_uid134_rrx_uid28_fpSinPiTest_b & mO_uid270_zCount_uid134_rrx_uid28_fpSinPiTest_q;

	--reg_cStage_uid272_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_3(REG,361)@9
    reg_cStage_uid272_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid272_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_3_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid272_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_3_q <= cStage_uid272_zCount_uid134_rrx_uid28_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest(MUX,273)@10
    vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_s <= vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_q;
    vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest: PROCESS (vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_s, en, reg_rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_1_q, reg_cStage_uid272_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_3_q)
    BEGIN
            CASE vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_q <= reg_rVStage_uid268_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_1_q;
                  WHEN "1" => vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_q <= reg_cStage_uid272_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_3_q;
                  WHEN OTHERS => vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest(BITSELECT,275)@10
    rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest_in <= vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_q;
    rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest_b <= rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest_in(15 downto 8);

	--vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest(LOGICAL,276)@10
    vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_a <= rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest_b;
    vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_b <= cstAllZWE_uid8_fpSinPiTest_q;
    vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_a = vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_b) THEN
                vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_q <= "1";
            ELSE
                vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--ld_vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_q_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_d(DELAY,684)@11
    ld_vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_q_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_q, xout => ld_vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_q_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid278_zCount_uid134_rrx_uid28_fpSinPiTest(BITSELECT,277)@10
    vStage_uid278_zCount_uid134_rrx_uid28_fpSinPiTest_in <= vStagei_uid274_zCount_uid134_rrx_uid28_fpSinPiTest_q(7 downto 0);
    vStage_uid278_zCount_uid134_rrx_uid28_fpSinPiTest_b <= vStage_uid278_zCount_uid134_rrx_uid28_fpSinPiTest_in(7 downto 0);

	--reg_vStage_uid278_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_3(REG,363)@10
    reg_vStage_uid278_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid278_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid278_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_3_q <= vStage_uid278_zCount_uid134_rrx_uid28_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_2(REG,362)@10
    reg_rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_2_q <= rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest(MUX,279)@11
    vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_s <= vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_q;
    vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest: PROCESS (vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_s, en, reg_rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_2_q, reg_vStage_uid278_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_3_q)
    BEGIN
            CASE vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_q <= reg_rVStage_uid276_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_2_q;
                  WHEN "1" => vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_q <= reg_vStage_uid278_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_3_q;
                  WHEN OTHERS => vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid282_zCount_uid134_rrx_uid28_fpSinPiTest(BITSELECT,281)@11
    rVStage_uid282_zCount_uid134_rrx_uid28_fpSinPiTest_in <= vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_q;
    rVStage_uid282_zCount_uid134_rrx_uid28_fpSinPiTest_b <= rVStage_uid282_zCount_uid134_rrx_uid28_fpSinPiTest_in(7 downto 4);

	--vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest(LOGICAL,282)@11
    vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_a <= rVStage_uid282_zCount_uid134_rrx_uid28_fpSinPiTest_b;
    vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_b <= leftShiftStage0Idx1Pad4_uid146_fxpX_uid40_fpSinPiTest_q;
    vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_q <= "1" when vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_a = vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_b else "0";

	--reg_vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_2(REG,366)@11
    reg_vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_2_q <= vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1Idx2Pad2_uid160_fxpX_uid40_fpSinPiTest(CONSTANT,159)
    leftShiftStage1Idx2Pad2_uid160_fxpX_uid40_fpSinPiTest_q <= "00";

	--vStage_uid284_zCount_uid134_rrx_uid28_fpSinPiTest(BITSELECT,283)@11
    vStage_uid284_zCount_uid134_rrx_uid28_fpSinPiTest_in <= vStagei_uid280_zCount_uid134_rrx_uid28_fpSinPiTest_q(3 downto 0);
    vStage_uid284_zCount_uid134_rrx_uid28_fpSinPiTest_b <= vStage_uid284_zCount_uid134_rrx_uid28_fpSinPiTest_in(3 downto 0);

	--vStagei_uid286_zCount_uid134_rrx_uid28_fpSinPiTest(MUX,285)@11
    vStagei_uid286_zCount_uid134_rrx_uid28_fpSinPiTest_s <= vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_q;
    vStagei_uid286_zCount_uid134_rrx_uid28_fpSinPiTest: PROCESS (vStagei_uid286_zCount_uid134_rrx_uid28_fpSinPiTest_s, en, rVStage_uid282_zCount_uid134_rrx_uid28_fpSinPiTest_b, vStage_uid284_zCount_uid134_rrx_uid28_fpSinPiTest_b)
    BEGIN
            CASE vStagei_uid286_zCount_uid134_rrx_uid28_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid286_zCount_uid134_rrx_uid28_fpSinPiTest_q <= rVStage_uid282_zCount_uid134_rrx_uid28_fpSinPiTest_b;
                  WHEN "1" => vStagei_uid286_zCount_uid134_rrx_uid28_fpSinPiTest_q <= vStage_uid284_zCount_uid134_rrx_uid28_fpSinPiTest_b;
                  WHEN OTHERS => vStagei_uid286_zCount_uid134_rrx_uid28_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest(BITSELECT,287)@11
    rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest_in <= vStagei_uid286_zCount_uid134_rrx_uid28_fpSinPiTest_q;
    rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest_b <= rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest_in(3 downto 2);

	--vCount_uid289_zCount_uid134_rrx_uid28_fpSinPiTest(LOGICAL,288)@11
    vCount_uid289_zCount_uid134_rrx_uid28_fpSinPiTest_a <= rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest_b;
    vCount_uid289_zCount_uid134_rrx_uid28_fpSinPiTest_b <= leftShiftStage1Idx2Pad2_uid160_fxpX_uid40_fpSinPiTest_q;
    vCount_uid289_zCount_uid134_rrx_uid28_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid289_zCount_uid134_rrx_uid28_fpSinPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid289_zCount_uid134_rrx_uid28_fpSinPiTest_a = vCount_uid289_zCount_uid134_rrx_uid28_fpSinPiTest_b) THEN
                vCount_uid289_zCount_uid134_rrx_uid28_fpSinPiTest_q <= "1";
            ELSE
                vCount_uid289_zCount_uid134_rrx_uid28_fpSinPiTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--vStage_uid290_zCount_uid134_rrx_uid28_fpSinPiTest(BITSELECT,289)@11
    vStage_uid290_zCount_uid134_rrx_uid28_fpSinPiTest_in <= vStagei_uid286_zCount_uid134_rrx_uid28_fpSinPiTest_q(1 downto 0);
    vStage_uid290_zCount_uid134_rrx_uid28_fpSinPiTest_b <= vStage_uid290_zCount_uid134_rrx_uid28_fpSinPiTest_in(1 downto 0);

	--reg_vStage_uid290_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_3(REG,365)@11
    reg_vStage_uid290_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid290_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_3_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid290_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_3_q <= vStage_uid290_zCount_uid134_rrx_uid28_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_2(REG,364)@11
    reg_rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_2_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_2_q <= rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest(MUX,291)@12
    vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_s <= vCount_uid289_zCount_uid134_rrx_uid28_fpSinPiTest_q;
    vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest: PROCESS (vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_s, en, reg_rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_2_q, reg_vStage_uid290_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_3_q)
    BEGIN
            CASE vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_q <= reg_rVStage_uid288_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_2_q;
                  WHEN "1" => vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_q <= reg_vStage_uid290_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_3_q;
                  WHEN OTHERS => vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid294_zCount_uid134_rrx_uid28_fpSinPiTest(BITSELECT,293)@12
    rVStage_uid294_zCount_uid134_rrx_uid28_fpSinPiTest_in <= vStagei_uid292_zCount_uid134_rrx_uid28_fpSinPiTest_q;
    rVStage_uid294_zCount_uid134_rrx_uid28_fpSinPiTest_b <= rVStage_uid294_zCount_uid134_rrx_uid28_fpSinPiTest_in(1 downto 1);

	--vCount_uid295_zCount_uid134_rrx_uid28_fpSinPiTest(LOGICAL,294)@12
    vCount_uid295_zCount_uid134_rrx_uid28_fpSinPiTest_a <= rVStage_uid294_zCount_uid134_rrx_uid28_fpSinPiTest_b;
    vCount_uid295_zCount_uid134_rrx_uid28_fpSinPiTest_b <= GND_q;
    vCount_uid295_zCount_uid134_rrx_uid28_fpSinPiTest_q <= "1" when vCount_uid295_zCount_uid134_rrx_uid28_fpSinPiTest_a = vCount_uid295_zCount_uid134_rrx_uid28_fpSinPiTest_b else "0";

	--r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest(BITJOIN,295)@12
    r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_q <= reg_vCount_uid269_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_4_q & ld_vCount_uid277_zCount_uid134_rrx_uid28_fpSinPiTest_q_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_d_q & reg_vCount_uid283_zCount_uid134_rrx_uid28_fpSinPiTest_0_to_r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_2_q & vCount_uid289_zCount_uid134_rrx_uid28_fpSinPiTest_q & vCount_uid295_zCount_uid134_rrx_uid28_fpSinPiTest_q;

	--biasM1_uid55_fpSinPiTest(CONSTANT,54)
    biasM1_uid55_fpSinPiTest_q <= "01111110";

	--expCompOutExt_uid137_rrx_uid28_fpSinPiTest(SUB,136)@12
    expCompOutExt_uid137_rrx_uid28_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & biasM1_uid55_fpSinPiTest_q);
    expCompOutExt_uid137_rrx_uid28_fpSinPiTest_b <= STD_LOGIC_VECTOR("0000" & r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_q);
            expCompOutExt_uid137_rrx_uid28_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expCompOutExt_uid137_rrx_uid28_fpSinPiTest_a) - UNSIGNED(expCompOutExt_uid137_rrx_uid28_fpSinPiTest_b));
    expCompOutExt_uid137_rrx_uid28_fpSinPiTest_q <= expCompOutExt_uid137_rrx_uid28_fpSinPiTest_o(8 downto 0);


	--expCompOut_uid138_rrx_uid28_fpSinPiTest(BITSELECT,137)@12
    expCompOut_uid138_rrx_uid28_fpSinPiTest_in <= expCompOutExt_uid137_rrx_uid28_fpSinPiTest_q(7 downto 0);
    expCompOut_uid138_rrx_uid28_fpSinPiTest_b <= expCompOut_uid138_rrx_uid28_fpSinPiTest_in(7 downto 0);

	--reg_expCompOut_uid138_rrx_uid28_fpSinPiTest_0_to_finalExp_uid142_rrx_uid28_fpSinPiTest_2(REG,374)@12
    reg_expCompOut_uid138_rrx_uid28_fpSinPiTest_0_to_finalExp_uid142_rrx_uid28_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expCompOut_uid138_rrx_uid28_fpSinPiTest_0_to_finalExp_uid142_rrx_uid28_fpSinPiTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expCompOut_uid138_rrx_uid28_fpSinPiTest_0_to_finalExp_uid142_rrx_uid28_fpSinPiTest_2_q <= expCompOut_uid138_rrx_uid28_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--xBranch_uid124_rrx_uid28_fpSinPiTest(COMPARE,123)@0
    xBranch_uid124_rrx_uid28_fpSinPiTest_cin <= GND_q;
    xBranch_uid124_rrx_uid28_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & cstBiasMwShift_uid22_fpSinPiTest_q) & '0';
    xBranch_uid124_rrx_uid28_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & expX_uid119_rrx_uid28_fpSinPiTest_b) & xBranch_uid124_rrx_uid28_fpSinPiTest_cin(0);
    xBranch_uid124_rrx_uid28_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xBranch_uid124_rrx_uid28_fpSinPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                xBranch_uid124_rrx_uid28_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xBranch_uid124_rrx_uid28_fpSinPiTest_a) - UNSIGNED(xBranch_uid124_rrx_uid28_fpSinPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    xBranch_uid124_rrx_uid28_fpSinPiTest_n(0) <= not xBranch_uid124_rrx_uid28_fpSinPiTest_o(10);


	--ld_xBranch_uid124_rrx_uid28_fpSinPiTest_n_to_finalExp_uid142_rrx_uid28_fpSinPiTest_b(DELAY,530)@1
    ld_xBranch_uid124_rrx_uid28_fpSinPiTest_n_to_finalExp_uid142_rrx_uid28_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => xBranch_uid124_rrx_uid28_fpSinPiTest_n, xout => ld_xBranch_uid124_rrx_uid28_fpSinPiTest_n_to_finalExp_uid142_rrx_uid28_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--finalExp_uid142_rrx_uid28_fpSinPiTest(MUX,141)@13
    finalExp_uid142_rrx_uid28_fpSinPiTest_s <= ld_xBranch_uid124_rrx_uid28_fpSinPiTest_n_to_finalExp_uid142_rrx_uid28_fpSinPiTest_b_q;
    finalExp_uid142_rrx_uid28_fpSinPiTest: PROCESS (finalExp_uid142_rrx_uid28_fpSinPiTest_s, en, reg_expCompOut_uid138_rrx_uid28_fpSinPiTest_0_to_finalExp_uid142_rrx_uid28_fpSinPiTest_2_q, ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_q)
    BEGIN
            CASE finalExp_uid142_rrx_uid28_fpSinPiTest_s IS
                  WHEN "0" => finalExp_uid142_rrx_uid28_fpSinPiTest_q <= reg_expCompOut_uid138_rrx_uid28_fpSinPiTest_0_to_finalExp_uid142_rrx_uid28_fpSinPiTest_2_q;
                  WHEN "1" => finalExp_uid142_rrx_uid28_fpSinPiTest_q <= ld_expX_uid119_rrx_uid28_fpSinPiTest_b_to_finalExp_uid142_rrx_uid28_fpSinPiTest_d_replace_mem_q;
                  WHEN OTHERS => finalExp_uid142_rrx_uid28_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_finalExp_uid142_rrx_uid28_fpSinPiTest_q_to_RRangeRed_uid143_rrx_uid28_fpSinPiTest_b(DELAY,534)@13
    ld_finalExp_uid142_rrx_uid28_fpSinPiTest_q_to_RRangeRed_uid143_rrx_uid28_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => finalExp_uid142_rrx_uid28_fpSinPiTest_q, xout => ld_finalExp_uid142_rrx_uid28_fpSinPiTest_q_to_RRangeRed_uid143_rrx_uid28_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_nor(LOGICAL,958)
    ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_nor_b <= ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_sticky_ena_q;
    ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_nor_q <= not (ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_nor_a or ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_nor_b);

	--ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_mem_top(CONSTANT,815)
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_mem_top_q <= "0111";

	--ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmp(LOGICAL,816)
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmp_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_mem_top_q;
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdmux_q);
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmp_q <= "1" when ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmp_a = ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmp_b else "0";

	--ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmpReg(REG,817)
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmpReg_q <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_sticky_ena(REG,959)
    ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_nor_q = "1") THEN
                ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_sticky_ena_q <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_enaAnd(LOGICAL,960)
    ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_enaAnd_a <= ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_sticky_ena_q;
    ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_enaAnd_b <= en;
    ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_enaAnd_q <= ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_enaAnd_a and ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_enaAnd_b;

	--ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_inputreg(DELAY,948)
    ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid120_rrx_uid28_fpSinPiTest_b, xout => ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdcnt(COUNTER,811)
    -- every=1, low=0, high=7, step=1, init=1
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdcnt_i <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdcnt_i,3));


	--ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdreg(REG,812)
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdreg_q <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdmux(MUX,813)
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdmux_s <= en;
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdmux: PROCESS (ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdmux_s, ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdreg_q, ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdmux_q <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdmux_q <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem(DUALMEM,949)
    ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_ia <= ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_inputreg_q;
    ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_aa <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdreg_q;
    ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_ab <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdmux_q;
    ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 23,
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
        clocken1 => ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_iq,
        address_a => ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_aa,
        data_a => ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_ia
    );
    ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_reset0 <= areset;
        ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_q <= ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_iq(22 downto 0);

	--ZerosGB_uid139_rrx_uid28_fpSinPiTest(CONSTANT,138)
    ZerosGB_uid139_rrx_uid28_fpSinPiTest_q <= "000000000000000000000000000000";

	--fracXRExt_uid140_rrx_uid28_fpSinPiTest(BITJOIN,139)@14
    fracXRExt_uid140_rrx_uid28_fpSinPiTest_q <= ld_fracX_uid120_rrx_uid28_fpSinPiTest_b_to_fracXRExt_uid140_rrx_uid28_fpSinPiTest_b_replace_mem_q & ZerosGB_uid139_rrx_uid28_fpSinPiTest_q;

	--LeftShiftStage174dto0_uid322_normMult_uid135_rrx_uid28_fpSinPiTest(BITSELECT,321)@13
    LeftShiftStage174dto0_uid322_normMult_uid135_rrx_uid28_fpSinPiTest_in <= leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_q(74 downto 0);
    LeftShiftStage174dto0_uid322_normMult_uid135_rrx_uid28_fpSinPiTest_b <= LeftShiftStage174dto0_uid322_normMult_uid135_rrx_uid28_fpSinPiTest_in(74 downto 0);

	--leftShiftStage2Idx1_uid323_normMult_uid135_rrx_uid28_fpSinPiTest(BITJOIN,322)@13
    leftShiftStage2Idx1_uid323_normMult_uid135_rrx_uid28_fpSinPiTest_q <= LeftShiftStage174dto0_uid322_normMult_uid135_rrx_uid28_fpSinPiTest_b & GND_q;

	--X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest(BITSELECT,305)@9
    X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_in <= multFracBits_uid132_rrx_uid28_fpSinPiTest_b(51 downto 0);
    X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_b <= X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_in(51 downto 0);

	--ld_X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg(DELAY,998)
    ld_X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1 )
    PORT MAP ( xin => X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_b, xout => ld_X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest_b(DELAY,691)@9
    ld_X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 52, depth => 2 )
    PORT MAP ( xin => ld_X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg_q, xout => ld_X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx3Pad24_uid226_alignedZ_uid51_fpSinPiTest(CONSTANT,225)
    leftShiftStage1Idx3Pad24_uid226_alignedZ_uid51_fpSinPiTest_q <= "000000000000000000000000";

	--leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest(BITJOIN,306)@12
    leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest_q <= ld_X51dto0_uid306_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest_b_q & leftShiftStage1Idx3Pad24_uid226_alignedZ_uid51_fpSinPiTest_q;

	--X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest(BITSELECT,302)@9
    X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_in <= multFracBits_uid132_rrx_uid28_fpSinPiTest_b(59 downto 0);
    X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_b <= X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_in(59 downto 0);

	--ld_X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg(DELAY,997)
    ld_X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 60, depth => 1 )
    PORT MAP ( xin => X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_b, xout => ld_X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest_b(DELAY,689)@9
    ld_X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 60, depth => 2 )
    PORT MAP ( xin => ld_X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg_q, xout => ld_X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest(BITJOIN,303)@12
    leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest_q <= ld_X59dto0_uid303_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest_b_q & zs_uid183_lzcZ_uid50_fpSinPiTest_q;

	--X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest(BITSELECT,299)@9
    X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_in <= multFracBits_uid132_rrx_uid28_fpSinPiTest_b(67 downto 0);
    X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_b <= X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_in(67 downto 0);

	--ld_X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg(DELAY,996)
    ld_X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 68, depth => 1 )
    PORT MAP ( xin => X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_b, xout => ld_X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest_b(DELAY,687)@9
    ld_X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 68, depth => 2 )
    PORT MAP ( xin => ld_X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest_b_inputreg_q, xout => ld_X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest(BITJOIN,300)@12
    leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest_q <= ld_X67dto0_uid300_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest_b_q & cstAllZWE_uid8_fpSinPiTest_q;

	--ld_multFracBits_uid132_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_c_inputreg(DELAY,999)
    ld_multFracBits_uid132_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 76, depth => 1 )
    PORT MAP ( xin => multFracBits_uid132_rrx_uid28_fpSinPiTest_b, xout => ld_multFracBits_uid132_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_multFracBits_uid132_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_c(DELAY,694)@9
    ld_multFracBits_uid132_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 76, depth => 2 )
    PORT MAP ( xin => ld_multFracBits_uid132_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_c_inputreg_q, xout => ld_multFracBits_uid132_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStageSel4Dto3_uid308_normMult_uid135_rrx_uid28_fpSinPiTest(BITSELECT,307)@12
    leftShiftStageSel4Dto3_uid308_normMult_uid135_rrx_uid28_fpSinPiTest_in <= r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_q;
    leftShiftStageSel4Dto3_uid308_normMult_uid135_rrx_uid28_fpSinPiTest_b <= leftShiftStageSel4Dto3_uid308_normMult_uid135_rrx_uid28_fpSinPiTest_in(4 downto 3);

	--leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest(MUX,308)@12
    leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_s <= leftShiftStageSel4Dto3_uid308_normMult_uid135_rrx_uid28_fpSinPiTest_b;
    leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest: PROCESS (leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_s, en, ld_multFracBits_uid132_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_c_q, leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest_q, leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest_q, leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_q <= ld_multFracBits_uid132_rrx_uid28_fpSinPiTest_b_to_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_c_q;
                  WHEN "01" => leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_q <= leftShiftStage0Idx1_uid301_normMult_uid135_rrx_uid28_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_q <= leftShiftStage0Idx2_uid304_normMult_uid135_rrx_uid28_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_q <= leftShiftStage0Idx3_uid307_normMult_uid135_rrx_uid28_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage069dto0_uid317_normMult_uid135_rrx_uid28_fpSinPiTest(BITSELECT,316)@12
    LeftShiftStage069dto0_uid317_normMult_uid135_rrx_uid28_fpSinPiTest_in <= leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_q(69 downto 0);
    LeftShiftStage069dto0_uid317_normMult_uid135_rrx_uid28_fpSinPiTest_b <= LeftShiftStage069dto0_uid317_normMult_uid135_rrx_uid28_fpSinPiTest_in(69 downto 0);

	--leftShiftStage2Idx3Pad6_uid237_alignedZ_uid51_fpSinPiTest(CONSTANT,236)
    leftShiftStage2Idx3Pad6_uid237_alignedZ_uid51_fpSinPiTest_q <= "000000";

	--leftShiftStage1Idx3_uid318_normMult_uid135_rrx_uid28_fpSinPiTest(BITJOIN,317)@12
    leftShiftStage1Idx3_uid318_normMult_uid135_rrx_uid28_fpSinPiTest_q <= LeftShiftStage069dto0_uid317_normMult_uid135_rrx_uid28_fpSinPiTest_b & leftShiftStage2Idx3Pad6_uid237_alignedZ_uid51_fpSinPiTest_q;

	--reg_leftShiftStage1Idx3_uid318_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_5(REG,372)@12
    reg_leftShiftStage1Idx3_uid318_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid318_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_5_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid318_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_5_q <= leftShiftStage1Idx3_uid318_normMult_uid135_rrx_uid28_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage071dto0_uid314_normMult_uid135_rrx_uid28_fpSinPiTest(BITSELECT,313)@12
    LeftShiftStage071dto0_uid314_normMult_uid135_rrx_uid28_fpSinPiTest_in <= leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_q(71 downto 0);
    LeftShiftStage071dto0_uid314_normMult_uid135_rrx_uid28_fpSinPiTest_b <= LeftShiftStage071dto0_uid314_normMult_uid135_rrx_uid28_fpSinPiTest_in(71 downto 0);

	--leftShiftStage1Idx2_uid315_normMult_uid135_rrx_uid28_fpSinPiTest(BITJOIN,314)@12
    leftShiftStage1Idx2_uid315_normMult_uid135_rrx_uid28_fpSinPiTest_q <= LeftShiftStage071dto0_uid314_normMult_uid135_rrx_uid28_fpSinPiTest_b & leftShiftStage0Idx1Pad4_uid146_fxpX_uid40_fpSinPiTest_q;

	--reg_leftShiftStage1Idx2_uid315_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_4(REG,371)@12
    reg_leftShiftStage1Idx2_uid315_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid315_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_4_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid315_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_4_q <= leftShiftStage1Idx2_uid315_normMult_uid135_rrx_uid28_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage073dto0_uid311_normMult_uid135_rrx_uid28_fpSinPiTest(BITSELECT,310)@12
    LeftShiftStage073dto0_uid311_normMult_uid135_rrx_uid28_fpSinPiTest_in <= leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_q(73 downto 0);
    LeftShiftStage073dto0_uid311_normMult_uid135_rrx_uid28_fpSinPiTest_b <= LeftShiftStage073dto0_uid311_normMult_uid135_rrx_uid28_fpSinPiTest_in(73 downto 0);

	--leftShiftStage1Idx1_uid312_normMult_uid135_rrx_uid28_fpSinPiTest(BITJOIN,311)@12
    leftShiftStage1Idx1_uid312_normMult_uid135_rrx_uid28_fpSinPiTest_q <= LeftShiftStage073dto0_uid311_normMult_uid135_rrx_uid28_fpSinPiTest_b & leftShiftStage1Idx2Pad2_uid160_fxpX_uid40_fpSinPiTest_q;

	--reg_leftShiftStage1Idx1_uid312_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_3(REG,370)@12
    reg_leftShiftStage1Idx1_uid312_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid312_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_3_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid312_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_3_q <= leftShiftStage1Idx1_uid312_normMult_uid135_rrx_uid28_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_2(REG,369)@12
    reg_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_2_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_2_q <= leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel2Dto1_uid319_normMult_uid135_rrx_uid28_fpSinPiTest(BITSELECT,318)@12
    leftShiftStageSel2Dto1_uid319_normMult_uid135_rrx_uid28_fpSinPiTest_in <= r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_q(2 downto 0);
    leftShiftStageSel2Dto1_uid319_normMult_uid135_rrx_uid28_fpSinPiTest_b <= leftShiftStageSel2Dto1_uid319_normMult_uid135_rrx_uid28_fpSinPiTest_in(2 downto 1);

	--reg_leftShiftStageSel2Dto1_uid319_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_1(REG,368)@12
    reg_leftShiftStageSel2Dto1_uid319_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel2Dto1_uid319_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel2Dto1_uid319_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_1_q <= leftShiftStageSel2Dto1_uid319_normMult_uid135_rrx_uid28_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest(MUX,319)@13
    leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_s <= reg_leftShiftStageSel2Dto1_uid319_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_1_q;
    leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest: PROCESS (leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_s, en, reg_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_2_q, reg_leftShiftStage1Idx1_uid312_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_3_q, reg_leftShiftStage1Idx2_uid315_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_4_q, reg_leftShiftStage1Idx3_uid318_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_q <= reg_leftShiftStage0_uid309_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_q <= reg_leftShiftStage1Idx1_uid312_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_3_q;
                  WHEN "10" => leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_q <= reg_leftShiftStage1Idx2_uid315_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_4_q;
                  WHEN "11" => leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_q <= reg_leftShiftStage1Idx3_uid318_normMult_uid135_rrx_uid28_fpSinPiTest_0_to_leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel0Dto0_uid324_normMult_uid135_rrx_uid28_fpSinPiTest(BITSELECT,323)@12
    leftShiftStageSel0Dto0_uid324_normMult_uid135_rrx_uid28_fpSinPiTest_in <= r_uid296_zCount_uid134_rrx_uid28_fpSinPiTest_q(0 downto 0);
    leftShiftStageSel0Dto0_uid324_normMult_uid135_rrx_uid28_fpSinPiTest_b <= leftShiftStageSel0Dto0_uid324_normMult_uid135_rrx_uid28_fpSinPiTest_in(0 downto 0);

	--ld_leftShiftStageSel0Dto0_uid324_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest_b(DELAY,713)@12
    ld_leftShiftStageSel0Dto0_uid324_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel0Dto0_uid324_normMult_uid135_rrx_uid28_fpSinPiTest_b, xout => ld_leftShiftStageSel0Dto0_uid324_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest(MUX,324)@13
    leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest_s <= ld_leftShiftStageSel0Dto0_uid324_normMult_uid135_rrx_uid28_fpSinPiTest_b_to_leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest_b_q;
    leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest: PROCESS (leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest_s, en, leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_q, leftShiftStage2Idx1_uid323_normMult_uid135_rrx_uid28_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest_s IS
                  WHEN "0" => leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest_q <= leftShiftStage1_uid320_normMult_uid135_rrx_uid28_fpSinPiTest_q;
                  WHEN "1" => leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest_q <= leftShiftStage2Idx1_uid323_normMult_uid135_rrx_uid28_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracCompOut_uid136_rrx_uid28_fpSinPiTest(BITSELECT,135)@13
    fracCompOut_uid136_rrx_uid28_fpSinPiTest_in <= leftShiftStage2_uid325_normMult_uid135_rrx_uid28_fpSinPiTest_q(74 downto 0);
    fracCompOut_uid136_rrx_uid28_fpSinPiTest_b <= fracCompOut_uid136_rrx_uid28_fpSinPiTest_in(74 downto 22);

	--reg_fracCompOut_uid136_rrx_uid28_fpSinPiTest_0_to_finalFrac_uid141_rrx_uid28_fpSinPiTest_2(REG,373)@13
    reg_fracCompOut_uid136_rrx_uid28_fpSinPiTest_0_to_finalFrac_uid141_rrx_uid28_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracCompOut_uid136_rrx_uid28_fpSinPiTest_0_to_finalFrac_uid141_rrx_uid28_fpSinPiTest_2_q <= "00000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracCompOut_uid136_rrx_uid28_fpSinPiTest_0_to_finalFrac_uid141_rrx_uid28_fpSinPiTest_2_q <= fracCompOut_uid136_rrx_uid28_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBranch_uid124_rrx_uid28_fpSinPiTest_n_to_finalFrac_uid141_rrx_uid28_fpSinPiTest_b(DELAY,527)@1
    ld_xBranch_uid124_rrx_uid28_fpSinPiTest_n_to_finalFrac_uid141_rrx_uid28_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => xBranch_uid124_rrx_uid28_fpSinPiTest_n, xout => ld_xBranch_uid124_rrx_uid28_fpSinPiTest_n_to_finalFrac_uid141_rrx_uid28_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--finalFrac_uid141_rrx_uid28_fpSinPiTest(MUX,140)@14
    finalFrac_uid141_rrx_uid28_fpSinPiTest_s <= ld_xBranch_uid124_rrx_uid28_fpSinPiTest_n_to_finalFrac_uid141_rrx_uid28_fpSinPiTest_b_q;
    finalFrac_uid141_rrx_uid28_fpSinPiTest: PROCESS (finalFrac_uid141_rrx_uid28_fpSinPiTest_s, en, reg_fracCompOut_uid136_rrx_uid28_fpSinPiTest_0_to_finalFrac_uid141_rrx_uid28_fpSinPiTest_2_q, fracXRExt_uid140_rrx_uid28_fpSinPiTest_q)
    BEGIN
            CASE finalFrac_uid141_rrx_uid28_fpSinPiTest_s IS
                  WHEN "0" => finalFrac_uid141_rrx_uid28_fpSinPiTest_q <= reg_fracCompOut_uid136_rrx_uid28_fpSinPiTest_0_to_finalFrac_uid141_rrx_uid28_fpSinPiTest_2_q;
                  WHEN "1" => finalFrac_uid141_rrx_uid28_fpSinPiTest_q <= fracXRExt_uid140_rrx_uid28_fpSinPiTest_q;
                  WHEN OTHERS => finalFrac_uid141_rrx_uid28_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RRangeRed_uid143_rrx_uid28_fpSinPiTest(BITJOIN,142)@14
    RRangeRed_uid143_rrx_uid28_fpSinPiTest_q <= GND_q & ld_finalExp_uid142_rrx_uid28_fpSinPiTest_q_to_RRangeRed_uid143_rrx_uid28_fpSinPiTest_b_q & finalFrac_uid141_rrx_uid28_fpSinPiTest_q;

	--fracXRR_uid33_fpSinPiTest(BITSELECT,32)@14
    fracXRR_uid33_fpSinPiTest_in <= RRangeRed_uid143_rrx_uid28_fpSinPiTest_q(52 downto 0);
    fracXRR_uid33_fpSinPiTest_b <= fracXRR_uid33_fpSinPiTest_in(52 downto 0);

	--ld_fracXRR_uid33_fpSinPiTest_b_to_oFracXRR_uid36_uid36_fpSinPiTest_a(DELAY,436)@14
    ld_fracXRR_uid33_fpSinPiTest_b_to_oFracXRR_uid36_uid36_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 53, depth => 1 )
    PORT MAP ( xin => fracXRR_uid33_fpSinPiTest_b, xout => ld_fracXRR_uid33_fpSinPiTest_b_to_oFracXRR_uid36_uid36_fpSinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--oFracXRR_uid36_uid36_fpSinPiTest(BITJOIN,35)@15
    oFracXRR_uid36_uid36_fpSinPiTest_q <= VCC_q & ld_fracXRR_uid33_fpSinPiTest_b_to_oFracXRR_uid36_uid36_fpSinPiTest_a_q;

	--extendedFracX_uid39_fpSinPiTest(BITJOIN,38)@15
    extendedFracX_uid39_fpSinPiTest_q <= cstZwShiftP1_uid25_fpSinPiTest_q & oFracXRR_uid36_uid36_fpSinPiTest_q;

	--cstBiasMwShiftM2_uid24_fpSinPiTest(CONSTANT,23)
    cstBiasMwShiftM2_uid24_fpSinPiTest_q <= "01110000";

	--expXRR_uid32_fpSinPiTest(BITSELECT,31)@14
    expXRR_uid32_fpSinPiTest_in <= RRangeRed_uid143_rrx_uid28_fpSinPiTest_q(60 downto 0);
    expXRR_uid32_fpSinPiTest_b <= expXRR_uid32_fpSinPiTest_in(60 downto 53);

	--fxpXShiftValExt_uid37_fpSinPiTest(SUB,36)@14
    fxpXShiftValExt_uid37_fpSinPiTest_a <= STD_LOGIC_VECTOR((10 downto 8 => expXRR_uid32_fpSinPiTest_b(7)) & expXRR_uid32_fpSinPiTest_b);
    fxpXShiftValExt_uid37_fpSinPiTest_b <= STD_LOGIC_VECTOR('0' & "00" & cstBiasMwShiftM2_uid24_fpSinPiTest_q);
            fxpXShiftValExt_uid37_fpSinPiTest_o <= STD_LOGIC_VECTOR(SIGNED(fxpXShiftValExt_uid37_fpSinPiTest_a) - SIGNED(fxpXShiftValExt_uid37_fpSinPiTest_b));
    fxpXShiftValExt_uid37_fpSinPiTest_q <= fxpXShiftValExt_uid37_fpSinPiTest_o(9 downto 0);


	--fxpXShiftVal_uid38_fpSinPiTest(BITSELECT,37)@14
    fxpXShiftVal_uid38_fpSinPiTest_in <= fxpXShiftValExt_uid37_fpSinPiTest_q(3 downto 0);
    fxpXShiftVal_uid38_fpSinPiTest_b <= fxpXShiftVal_uid38_fpSinPiTest_in(3 downto 0);

	--leftShiftStageSel3Dto2_uid155_fxpX_uid40_fpSinPiTest(BITSELECT,154)@14
    leftShiftStageSel3Dto2_uid155_fxpX_uid40_fpSinPiTest_in <= fxpXShiftVal_uid38_fpSinPiTest_b;
    leftShiftStageSel3Dto2_uid155_fxpX_uid40_fpSinPiTest_b <= leftShiftStageSel3Dto2_uid155_fxpX_uid40_fpSinPiTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid155_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_1(REG,375)@14
    reg_leftShiftStageSel3Dto2_uid155_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid155_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid155_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_1_q <= leftShiftStageSel3Dto2_uid155_fxpX_uid40_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest(MUX,155)@15
    leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_s <= reg_leftShiftStageSel3Dto2_uid155_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_1_q;
    leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest: PROCESS (leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_s, en, extendedFracX_uid39_fpSinPiTest_q, leftShiftStage0Idx1_uid148_fxpX_uid40_fpSinPiTest_q, leftShiftStage0Idx2_uid151_fxpX_uid40_fpSinPiTest_q, leftShiftStage0Idx3_uid154_fxpX_uid40_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_q <= extendedFracX_uid39_fpSinPiTest_q;
                  WHEN "01" => leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_q <= leftShiftStage0Idx1_uid148_fxpX_uid40_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_q <= leftShiftStage0Idx2_uid151_fxpX_uid40_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_q <= leftShiftStage0Idx3_uid154_fxpX_uid40_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage064dto0_uid164_fxpX_uid40_fpSinPiTest(BITSELECT,163)@15
    LeftShiftStage064dto0_uid164_fxpX_uid40_fpSinPiTest_in <= leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_q(64 downto 0);
    LeftShiftStage064dto0_uid164_fxpX_uid40_fpSinPiTest_b <= LeftShiftStage064dto0_uid164_fxpX_uid40_fpSinPiTest_in(64 downto 0);

	--ld_LeftShiftStage064dto0_uid164_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx3_uid165_fxpX_uid40_fpSinPiTest_b(DELAY,552)@15
    ld_LeftShiftStage064dto0_uid164_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx3_uid165_fxpX_uid40_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 65, depth => 1 )
    PORT MAP ( xin => LeftShiftStage064dto0_uid164_fxpX_uid40_fpSinPiTest_b, xout => ld_LeftShiftStage064dto0_uid164_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx3_uid165_fxpX_uid40_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx3Pad3_uid163_fxpX_uid40_fpSinPiTest(CONSTANT,162)
    leftShiftStage1Idx3Pad3_uid163_fxpX_uid40_fpSinPiTest_q <= "000";

	--leftShiftStage1Idx3_uid165_fxpX_uid40_fpSinPiTest(BITJOIN,164)@16
    leftShiftStage1Idx3_uid165_fxpX_uid40_fpSinPiTest_q <= ld_LeftShiftStage064dto0_uid164_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx3_uid165_fxpX_uid40_fpSinPiTest_b_q & leftShiftStage1Idx3Pad3_uid163_fxpX_uid40_fpSinPiTest_q;

	--LeftShiftStage065dto0_uid161_fxpX_uid40_fpSinPiTest(BITSELECT,160)@15
    LeftShiftStage065dto0_uid161_fxpX_uid40_fpSinPiTest_in <= leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_q(65 downto 0);
    LeftShiftStage065dto0_uid161_fxpX_uid40_fpSinPiTest_b <= LeftShiftStage065dto0_uid161_fxpX_uid40_fpSinPiTest_in(65 downto 0);

	--ld_LeftShiftStage065dto0_uid161_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx2_uid162_fxpX_uid40_fpSinPiTest_b(DELAY,550)@15
    ld_LeftShiftStage065dto0_uid161_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx2_uid162_fxpX_uid40_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 66, depth => 1 )
    PORT MAP ( xin => LeftShiftStage065dto0_uid161_fxpX_uid40_fpSinPiTest_b, xout => ld_LeftShiftStage065dto0_uid161_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx2_uid162_fxpX_uid40_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx2_uid162_fxpX_uid40_fpSinPiTest(BITJOIN,161)@16
    leftShiftStage1Idx2_uid162_fxpX_uid40_fpSinPiTest_q <= ld_LeftShiftStage065dto0_uid161_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx2_uid162_fxpX_uid40_fpSinPiTest_b_q & leftShiftStage1Idx2Pad2_uid160_fxpX_uid40_fpSinPiTest_q;

	--LeftShiftStage066dto0_uid158_fxpX_uid40_fpSinPiTest(BITSELECT,157)@15
    LeftShiftStage066dto0_uid158_fxpX_uid40_fpSinPiTest_in <= leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_q(66 downto 0);
    LeftShiftStage066dto0_uid158_fxpX_uid40_fpSinPiTest_b <= LeftShiftStage066dto0_uid158_fxpX_uid40_fpSinPiTest_in(66 downto 0);

	--ld_LeftShiftStage066dto0_uid158_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx1_uid159_fxpX_uid40_fpSinPiTest_b(DELAY,548)@15
    ld_LeftShiftStage066dto0_uid158_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx1_uid159_fxpX_uid40_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 67, depth => 1 )
    PORT MAP ( xin => LeftShiftStage066dto0_uid158_fxpX_uid40_fpSinPiTest_b, xout => ld_LeftShiftStage066dto0_uid158_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx1_uid159_fxpX_uid40_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx1_uid159_fxpX_uid40_fpSinPiTest(BITJOIN,158)@16
    leftShiftStage1Idx1_uid159_fxpX_uid40_fpSinPiTest_q <= ld_LeftShiftStage066dto0_uid158_fxpX_uid40_fpSinPiTest_b_to_leftShiftStage1Idx1_uid159_fxpX_uid40_fpSinPiTest_b_q & GND_q;

	--reg_leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_2(REG,377)@15
    reg_leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_2_q <= leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest(BITSELECT,165)@14
    leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_in <= fxpXShiftVal_uid38_fpSinPiTest_b(1 downto 0);
    leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_b <= leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_in(1 downto 0);

	--reg_leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_1(REG,376)@14
    reg_leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_1_q <= leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_1_q_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_b(DELAY,554)@15
    ld_reg_leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_1_q_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_1_q, xout => ld_reg_leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_1_q_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest(MUX,166)@16
    leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_s <= ld_reg_leftShiftStageSel1Dto0_uid166_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_1_q_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_b_q;
    leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest: PROCESS (leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_s, en, reg_leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_2_q, leftShiftStage1Idx1_uid159_fxpX_uid40_fpSinPiTest_q, leftShiftStage1Idx2_uid162_fxpX_uid40_fpSinPiTest_q, leftShiftStage1Idx3_uid165_fxpX_uid40_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_q <= reg_leftShiftStage0_uid156_fxpX_uid40_fpSinPiTest_0_to_leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_q <= leftShiftStage1Idx1_uid159_fxpX_uid40_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_q <= leftShiftStage1Idx2_uid162_fxpX_uid40_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_q <= leftShiftStage1Idx3_uid165_fxpX_uid40_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--intXParity_uid41_fpSinPiTest(BITSELECT,40)@16
    intXParity_uid41_fpSinPiTest_in <= leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_q;
    intXParity_uid41_fpSinPiTest_b <= intXParity_uid41_fpSinPiTest_in(67 downto 67);

	--exp_uid9_fpSinPiTest(BITSELECT,8)@0
    exp_uid9_fpSinPiTest_in <= a(30 downto 0);
    exp_uid9_fpSinPiTest_b <= exp_uid9_fpSinPiTest_in(30 downto 23);

	--sinXIsX_uid34_fpSinPiTest(COMPARE,33)@0
    sinXIsX_uid34_fpSinPiTest_cin <= GND_q;
    sinXIsX_uid34_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & cstBiasMwShift_uid22_fpSinPiTest_q) & '0';
    sinXIsX_uid34_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & exp_uid9_fpSinPiTest_b) & sinXIsX_uid34_fpSinPiTest_cin(0);
            sinXIsX_uid34_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(sinXIsX_uid34_fpSinPiTest_a) - UNSIGNED(sinXIsX_uid34_fpSinPiTest_b));
    sinXIsX_uid34_fpSinPiTest_n(0) <= not sinXIsX_uid34_fpSinPiTest_o(10);


	--ld_sinXIsX_uid34_fpSinPiTest_n_to_InvSinXIsX_uid93_fpSinPiTest_a(DELAY,501)@0
    ld_sinXIsX_uid34_fpSinPiTest_n_to_InvSinXIsX_uid93_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => sinXIsX_uid34_fpSinPiTest_n, xout => ld_sinXIsX_uid34_fpSinPiTest_n_to_InvSinXIsX_uid93_fpSinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvSinXIsX_uid93_fpSinPiTest(LOGICAL,92)@16
    InvSinXIsX_uid93_fpSinPiTest_a <= ld_sinXIsX_uid34_fpSinPiTest_n_to_InvSinXIsX_uid93_fpSinPiTest_a_q;
    InvSinXIsX_uid93_fpSinPiTest_q <= not InvSinXIsX_uid93_fpSinPiTest_a;

	--cstBiasMwShiftM2_uid23_fpSinPiTest(CONSTANT,22)
    cstBiasMwShiftM2_uid23_fpSinPiTest_q <= "01110001";

	--sinXIsXRR_uid35_fpSinPiTest(COMPARE,34)@14
    sinXIsXRR_uid35_fpSinPiTest_cin <= GND_q;
    sinXIsXRR_uid35_fpSinPiTest_a <= STD_LOGIC_VECTOR('0' & "00" & cstBiasMwShiftM2_uid23_fpSinPiTest_q) & '0';
    sinXIsXRR_uid35_fpSinPiTest_b <= STD_LOGIC_VECTOR((10 downto 8 => expXRR_uid32_fpSinPiTest_b(7)) & expXRR_uid32_fpSinPiTest_b) & sinXIsXRR_uid35_fpSinPiTest_cin(0);
            sinXIsXRR_uid35_fpSinPiTest_o <= STD_LOGIC_VECTOR(SIGNED(sinXIsXRR_uid35_fpSinPiTest_a) - SIGNED(sinXIsXRR_uid35_fpSinPiTest_b));
    sinXIsXRR_uid35_fpSinPiTest_n(0) <= not sinXIsXRR_uid35_fpSinPiTest_o(11);


	--ld_sinXIsXRR_uid35_fpSinPiTest_n_to_InvSinXIsXRR_uid94_fpSinPiTest_a(DELAY,502)@14
    ld_sinXIsXRR_uid35_fpSinPiTest_n_to_InvSinXIsXRR_uid94_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => sinXIsXRR_uid35_fpSinPiTest_n, xout => ld_sinXIsXRR_uid35_fpSinPiTest_n_to_InvSinXIsXRR_uid94_fpSinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvSinXIsXRR_uid94_fpSinPiTest(LOGICAL,93)@15
    InvSinXIsXRR_uid94_fpSinPiTest_a <= ld_sinXIsXRR_uid35_fpSinPiTest_n_to_InvSinXIsXRR_uid94_fpSinPiTest_a_q;
    InvSinXIsXRR_uid94_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvSinXIsXRR_uid94_fpSinPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvSinXIsXRR_uid94_fpSinPiTest_q <= not InvSinXIsXRR_uid94_fpSinPiTest_a;
        END IF;
    END PROCESS;



	--signComp_uid95_fpSinPiTest(LOGICAL,94)@16
    signComp_uid95_fpSinPiTest_a <= InvSinXIsXRR_uid94_fpSinPiTest_q;
    signComp_uid95_fpSinPiTest_b <= InvSinXIsX_uid93_fpSinPiTest_q;
    signComp_uid95_fpSinPiTest_c <= intXParity_uid41_fpSinPiTest_b;
    signComp_uid95_fpSinPiTest_q <= signComp_uid95_fpSinPiTest_a and signComp_uid95_fpSinPiTest_b and signComp_uid95_fpSinPiTest_c;

	--signX_uid31_fpSinPiTest(BITSELECT,30)@0
    signX_uid31_fpSinPiTest_in <= a;
    signX_uid31_fpSinPiTest_b <= signX_uid31_fpSinPiTest_in(31 downto 31);

	--ld_signX_uid31_fpSinPiTest_b_to_signR_uid96_fpSinPiTest_a(DELAY,506)@0
    ld_signX_uid31_fpSinPiTest_b_to_signR_uid96_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => signX_uid31_fpSinPiTest_b, xout => ld_signX_uid31_fpSinPiTest_b_to_signR_uid96_fpSinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signR_uid96_fpSinPiTest(LOGICAL,95)@16
    signR_uid96_fpSinPiTest_a <= ld_signX_uid31_fpSinPiTest_b_to_signR_uid96_fpSinPiTest_a_q;
    signR_uid96_fpSinPiTest_b <= signComp_uid95_fpSinPiTest_q;
    signR_uid96_fpSinPiTest_q <= signR_uid96_fpSinPiTest_a xor signR_uid96_fpSinPiTest_b;

	--ld_signR_uid96_fpSinPiTest_q_to_sinXR_uid97_fpSinPiTest_c(DELAY,510)@16
    ld_signR_uid96_fpSinPiTest_q_to_sinXR_uid97_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 20 )
    PORT MAP ( xin => signR_uid96_fpSinPiTest_q, xout => ld_signR_uid96_fpSinPiTest_q_to_sinXR_uid97_fpSinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--cstAllOWE_uid6_fpSinPiTest(CONSTANT,5)
    cstAllOWE_uid6_fpSinPiTest_q <= "11111111";

	--ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_nor(LOGICAL,934)
    ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_nor_b <= ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_sticky_ena_q;
    ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_nor_q <= not (ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_nor_a or ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_nor_b);

	--ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_mem_top(CONSTANT,917)
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_mem_top_q <= "0100001";

	--ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmp(LOGICAL,918)
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmp_a <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_mem_top_q;
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdmux_q);
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmp_q <= "1" when ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmp_a = ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmp_b else "0";

	--ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmpReg(REG,919)
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmpReg_q <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_sticky_ena(REG,935)
    ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_nor_q = "1") THEN
                ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_sticky_ena_q <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_enaAnd(LOGICAL,936)
    ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_enaAnd_a <= ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_sticky_ena_q;
    ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_enaAnd_b <= en;
    ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_enaAnd_q <= ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_enaAnd_a and ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_enaAnd_b;

	--ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_inputreg(DELAY,924)
    ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => exp_uid9_fpSinPiTest_b, xout => ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt(COUNTER,913)
    -- every=1, low=0, high=33, step=1, init=1
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_i = 32 THEN
                      ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_eq = '1') THEN
                        ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_i <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_i - 33;
                    ELSE
                        ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_i <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_i,6));


	--ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdreg(REG,914)
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdreg_q <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdmux(MUX,915)
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdmux_s <= en;
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdmux: PROCESS (ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdmux_s, ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdreg_q, ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdmux_q <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdreg_q;
                  WHEN "1" => ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdmux_q <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem(DUALMEM,925)
    ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_ia <= ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_inputreg_q;
    ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_aa <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdreg_q;
    ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_ab <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdmux_q;
    ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 6,
        numwords_a => 34,
        width_b => 8,
        widthad_b => 6,
        numwords_b => 34,
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
        clocken1 => ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_iq,
        address_a => ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_aa,
        data_a => ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_ia
    );
    ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_reset0 <= areset;
        ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_q <= ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_iq(7 downto 0);

	--ld_sinXIsXRR_uid35_fpSinPiTest_n_to_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_join_uid73_fpSinPiTest_1_a(DELAY,804)@14
    ld_sinXIsXRR_uid35_fpSinPiTest_n_to_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_join_uid73_fpSinPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => sinXIsXRR_uid35_fpSinPiTest_n, xout => ld_sinXIsXRR_uid35_fpSinPiTest_n_to_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_join_uid73_fpSinPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_sinXIsXRR_uid35_fpSinPiTest_2_to_join_uid73_fpSinPiTest_1(REG,409)@33
    reg_sinXIsXRR_uid35_fpSinPiTest_2_to_join_uid73_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sinXIsXRR_uid35_fpSinPiTest_2_to_join_uid73_fpSinPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sinXIsXRR_uid35_fpSinPiTest_2_to_join_uid73_fpSinPiTest_1_q <= ld_sinXIsXRR_uid35_fpSinPiTest_n_to_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_join_uid73_fpSinPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_nor(LOGICAL,832)
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_nor_b <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_sticky_ena_q;
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_nor_q <= not (ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_nor_a or ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_nor_b);

	--ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_mem_top(CONSTANT,828)
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_mem_top_q <= "01100";

	--ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmp(LOGICAL,829)
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmp_a <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_mem_top_q;
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdmux_q);
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmp_q <= "1" when ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmp_a = ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmp_b else "0";

	--ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmpReg(REG,830)
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmpReg_q <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_sticky_ena(REG,833)
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_nor_q = "1") THEN
                ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_sticky_ena_q <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_enaAnd(LOGICAL,834)
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_enaAnd_a <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_sticky_ena_q;
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_enaAnd_b <= en;
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_enaAnd_q <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_enaAnd_a and ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_enaAnd_b;

	--oFracXRRSmallXRR_uid65_fpSinPiTest(BITSELECT,64)@15
    oFracXRRSmallXRR_uid65_fpSinPiTest_in <= oFracXRR_uid36_uid36_fpSinPiTest_q;
    oFracXRRSmallXRR_uid65_fpSinPiTest_b <= oFracXRRSmallXRR_uid65_fpSinPiTest_in(53 downto 28);

	--ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_inputreg(DELAY,822)
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => oFracXRRSmallXRR_uid65_fpSinPiTest_b, xout => ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt(COUNTER,824)
    -- every=1, low=0, high=12, step=1, init=1
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_i = 11 THEN
                      ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_eq = '1') THEN
                        ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_i <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_i - 12;
                    ELSE
                        ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_i <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_i,4));


	--ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdreg(REG,825)
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdreg_q <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdmux(MUX,826)
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdmux_s <= en;
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdmux: PROCESS (ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdmux_s, ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdreg_q, ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdmux_q <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdreg_q;
                  WHEN "1" => ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdmux_q <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem(DUALMEM,823)
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_ia <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_inputreg_q;
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_aa <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdreg_q;
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_ab <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_rdmux_q;
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 26,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 26,
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
        clocken1 => ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_iq,
        address_a => ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_aa,
        data_a => ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_ia
    );
    ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_reset0 <= areset;
        ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_q <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_iq(25 downto 0);

	--y_uid42_fpSinPiTest(BITSELECT,41)@16
    y_uid42_fpSinPiTest_in <= leftShiftStage1_uid167_fxpX_uid40_fpSinPiTest_q(66 downto 0);
    y_uid42_fpSinPiTest_b <= y_uid42_fpSinPiTest_in(66 downto 1);

	--reg_y_uid42_fpSinPiTest_0_to_oneMinusY_uid43_fpSinPiTest_1(REG,379)@16
    reg_y_uid42_fpSinPiTest_0_to_oneMinusY_uid43_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_y_uid42_fpSinPiTest_0_to_oneMinusY_uid43_fpSinPiTest_1_q <= "000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_y_uid42_fpSinPiTest_0_to_oneMinusY_uid43_fpSinPiTest_1_q <= y_uid42_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--pad_one_uid43_fpSinPiTest(BITJOIN,42)@16
    pad_one_uid43_fpSinPiTest_q <= VCC_q & STD_LOGIC_VECTOR((65 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_one_uid43_fpSinPiTest_0_to_oneMinusY_uid43_fpSinPiTest_0(REG,378)@16
    reg_pad_one_uid43_fpSinPiTest_0_to_oneMinusY_uid43_fpSinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_one_uid43_fpSinPiTest_0_to_oneMinusY_uid43_fpSinPiTest_0_q <= "0000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_one_uid43_fpSinPiTest_0_to_oneMinusY_uid43_fpSinPiTest_0_q <= pad_one_uid43_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--oneMinusY_uid43_fpSinPiTest(SUB,43)@17
    oneMinusY_uid43_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & reg_pad_one_uid43_fpSinPiTest_0_to_oneMinusY_uid43_fpSinPiTest_0_q);
    oneMinusY_uid43_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & reg_y_uid42_fpSinPiTest_0_to_oneMinusY_uid43_fpSinPiTest_1_q);
            oneMinusY_uid43_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oneMinusY_uid43_fpSinPiTest_a) - UNSIGNED(oneMinusY_uid43_fpSinPiTest_b));
    oneMinusY_uid43_fpSinPiTest_q <= oneMinusY_uid43_fpSinPiTest_o(67 downto 0);


	--oMyBottom_uid46_fpSinPiTest(BITSELECT,45)@17
    oMyBottom_uid46_fpSinPiTest_in <= oneMinusY_uid43_fpSinPiTest_q(64 downto 0);
    oMyBottom_uid46_fpSinPiTest_b <= oMyBottom_uid46_fpSinPiTest_in(64 downto 0);

	--ld_oMyBottom_uid46_fpSinPiTest_b_to_reg_oMyBottom_uid46_fpSinPiTest_0_to_z_uid48_fpSinPiTest_3_a(DELAY,777)@17
    ld_oMyBottom_uid46_fpSinPiTest_b_to_reg_oMyBottom_uid46_fpSinPiTest_0_to_z_uid48_fpSinPiTest_3_a : dspba_delay
    GENERIC MAP ( width => 65, depth => 1 )
    PORT MAP ( xin => oMyBottom_uid46_fpSinPiTest_b, xout => ld_oMyBottom_uid46_fpSinPiTest_b_to_reg_oMyBottom_uid46_fpSinPiTest_0_to_z_uid48_fpSinPiTest_3_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_oMyBottom_uid46_fpSinPiTest_0_to_z_uid48_fpSinPiTest_3(REG,382)@18
    reg_oMyBottom_uid46_fpSinPiTest_0_to_z_uid48_fpSinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oMyBottom_uid46_fpSinPiTest_0_to_z_uid48_fpSinPiTest_3_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oMyBottom_uid46_fpSinPiTest_0_to_z_uid48_fpSinPiTest_3_q <= ld_oMyBottom_uid46_fpSinPiTest_b_to_reg_oMyBottom_uid46_fpSinPiTest_0_to_z_uid48_fpSinPiTest_3_a_q;
            END IF;
        END IF;
    END PROCESS;


	--yBottom_uid47_fpSinPiTest(BITSELECT,46)@16
    yBottom_uid47_fpSinPiTest_in <= y_uid42_fpSinPiTest_b(64 downto 0);
    yBottom_uid47_fpSinPiTest_b <= yBottom_uid47_fpSinPiTest_in(64 downto 0);

	--ld_yBottom_uid47_fpSinPiTest_b_to_reg_yBottom_uid47_fpSinPiTest_0_to_z_uid48_fpSinPiTest_2_a(DELAY,776)@16
    ld_yBottom_uid47_fpSinPiTest_b_to_reg_yBottom_uid47_fpSinPiTest_0_to_z_uid48_fpSinPiTest_2_a : dspba_delay
    GENERIC MAP ( width => 65, depth => 2 )
    PORT MAP ( xin => yBottom_uid47_fpSinPiTest_b, xout => ld_yBottom_uid47_fpSinPiTest_b_to_reg_yBottom_uid47_fpSinPiTest_0_to_z_uid48_fpSinPiTest_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yBottom_uid47_fpSinPiTest_0_to_z_uid48_fpSinPiTest_2(REG,381)@18
    reg_yBottom_uid47_fpSinPiTest_0_to_z_uid48_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yBottom_uid47_fpSinPiTest_0_to_z_uid48_fpSinPiTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yBottom_uid47_fpSinPiTest_0_to_z_uid48_fpSinPiTest_2_q <= ld_yBottom_uid47_fpSinPiTest_b_to_reg_yBottom_uid47_fpSinPiTest_0_to_z_uid48_fpSinPiTest_2_a_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_y_uid42_fpSinPiTest_b_to_cmpYToOneMinusY_uid45_fpSinPiTest_b(DELAY,445)@16
    ld_y_uid42_fpSinPiTest_b_to_cmpYToOneMinusY_uid45_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 66, depth => 2 )
    PORT MAP ( xin => y_uid42_fpSinPiTest_b, xout => ld_y_uid42_fpSinPiTest_b_to_cmpYToOneMinusY_uid45_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--reg_oneMinusY_uid43_fpSinPiTest_0_to_cmpYToOneMinusY_uid45_fpSinPiTest_0(REG,380)@17
    reg_oneMinusY_uid43_fpSinPiTest_0_to_cmpYToOneMinusY_uid45_fpSinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oneMinusY_uid43_fpSinPiTest_0_to_cmpYToOneMinusY_uid45_fpSinPiTest_0_q <= "00000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oneMinusY_uid43_fpSinPiTest_0_to_cmpYToOneMinusY_uid45_fpSinPiTest_0_q <= oneMinusY_uid43_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--cmpYToOneMinusY_uid45_fpSinPiTest(COMPARE,44)@18
    cmpYToOneMinusY_uid45_fpSinPiTest_cin <= GND_q;
    cmpYToOneMinusY_uid45_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & reg_oneMinusY_uid43_fpSinPiTest_0_to_cmpYToOneMinusY_uid45_fpSinPiTest_0_q) & '0';
    cmpYToOneMinusY_uid45_fpSinPiTest_b <= STD_LOGIC_VECTOR("0000" & ld_y_uid42_fpSinPiTest_b_to_cmpYToOneMinusY_uid45_fpSinPiTest_b_q) & cmpYToOneMinusY_uid45_fpSinPiTest_cin(0);
    cmpYToOneMinusY_uid45_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            cmpYToOneMinusY_uid45_fpSinPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                cmpYToOneMinusY_uid45_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(cmpYToOneMinusY_uid45_fpSinPiTest_a) - UNSIGNED(cmpYToOneMinusY_uid45_fpSinPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    cmpYToOneMinusY_uid45_fpSinPiTest_c(0) <= cmpYToOneMinusY_uid45_fpSinPiTest_o(70);


	--z_uid48_fpSinPiTest(MUX,47)@19
    z_uid48_fpSinPiTest_s <= cmpYToOneMinusY_uid45_fpSinPiTest_c;
    z_uid48_fpSinPiTest: PROCESS (z_uid48_fpSinPiTest_s, en, reg_yBottom_uid47_fpSinPiTest_0_to_z_uid48_fpSinPiTest_2_q, reg_oMyBottom_uid46_fpSinPiTest_0_to_z_uid48_fpSinPiTest_3_q)
    BEGIN
            CASE z_uid48_fpSinPiTest_s IS
                  WHEN "0" => z_uid48_fpSinPiTest_q <= reg_yBottom_uid47_fpSinPiTest_0_to_z_uid48_fpSinPiTest_2_q;
                  WHEN "1" => z_uid48_fpSinPiTest_q <= reg_oMyBottom_uid46_fpSinPiTest_0_to_z_uid48_fpSinPiTest_3_q;
                  WHEN OTHERS => z_uid48_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--zAddr_uid61_fpSinPiTest(BITSELECT,60)@19
    zAddr_uid61_fpSinPiTest_in <= z_uid48_fpSinPiTest_q;
    zAddr_uid61_fpSinPiTest_b <= zAddr_uid61_fpSinPiTest_in(64 downto 57);

	--reg_zAddr_uid61_fpSinPiTest_0_to_memoryC2_uid252_sinPiZTableGenerator_lutmem_0(REG,398)@19
    reg_zAddr_uid61_fpSinPiTest_0_to_memoryC2_uid252_sinPiZTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid61_fpSinPiTest_0_to_memoryC2_uid252_sinPiZTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zAddr_uid61_fpSinPiTest_0_to_memoryC2_uid252_sinPiZTableGenerator_lutmem_0_q <= zAddr_uid61_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid252_sinPiZTableGenerator_lutmem(DUALMEM,348)@20
    memoryC2_uid252_sinPiZTableGenerator_lutmem_ia <= (others => '0');
    memoryC2_uid252_sinPiZTableGenerator_lutmem_aa <= (others => '0');
    memoryC2_uid252_sinPiZTableGenerator_lutmem_ab <= reg_zAddr_uid61_fpSinPiTest_0_to_memoryC2_uid252_sinPiZTableGenerator_lutmem_0_q;
    memoryC2_uid252_sinPiZTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_sin_s5_memoryC2_uid252_sinPiZTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid252_sinPiZTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid252_sinPiZTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid252_sinPiZTableGenerator_lutmem_iq,
        address_a => memoryC2_uid252_sinPiZTableGenerator_lutmem_aa,
        data_a => memoryC2_uid252_sinPiZTableGenerator_lutmem_ia
    );
    memoryC2_uid252_sinPiZTableGenerator_lutmem_reset0 <= areset;
        memoryC2_uid252_sinPiZTableGenerator_lutmem_q <= memoryC2_uid252_sinPiZTableGenerator_lutmem_iq(12 downto 0);

	--reg_memoryC2_uid252_sinPiZTableGenerator_lutmem_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_1(REG,400)@22
    reg_memoryC2_uid252_sinPiZTableGenerator_lutmem_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid252_sinPiZTableGenerator_lutmem_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_1_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid252_sinPiZTableGenerator_lutmem_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_1_q <= memoryC2_uid252_sinPiZTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--zPPolyEval_uid62_fpSinPiTest(BITSELECT,61)@19
    zPPolyEval_uid62_fpSinPiTest_in <= z_uid48_fpSinPiTest_q(56 downto 0);
    zPPolyEval_uid62_fpSinPiTest_b <= zPPolyEval_uid62_fpSinPiTest_in(56 downto 39);

	--yT1_uid254_sinPiZPolyEval(BITSELECT,253)@19
    yT1_uid254_sinPiZPolyEval_in <= zPPolyEval_uid62_fpSinPiTest_b;
    yT1_uid254_sinPiZPolyEval_b <= yT1_uid254_sinPiZPolyEval_in(17 downto 5);

	--ld_yT1_uid254_sinPiZPolyEval_b_to_reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0_a_inputreg(DELAY,1013)
    ld_yT1_uid254_sinPiZPolyEval_b_to_reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 13, depth => 1 )
    PORT MAP ( xin => yT1_uid254_sinPiZPolyEval_b, xout => ld_yT1_uid254_sinPiZPolyEval_b_to_reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yT1_uid254_sinPiZPolyEval_b_to_reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0_a(DELAY,794)@19
    ld_yT1_uid254_sinPiZPolyEval_b_to_reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0_a : dspba_delay
    GENERIC MAP ( width => 13, depth => 2 )
    PORT MAP ( xin => ld_yT1_uid254_sinPiZPolyEval_b_to_reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0_a_inputreg_q, xout => ld_yT1_uid254_sinPiZPolyEval_b_to_reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0(REG,399)@22
    reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0_q <= ld_yT1_uid254_sinPiZPolyEval_b_to_reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid327_pT1_uid255_sinPiZPolyEval(MULT,326)@23
    prodXY_uid327_pT1_uid255_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid327_pT1_uid255_sinPiZPolyEval_a),14)) * SIGNED(prodXY_uid327_pT1_uid255_sinPiZPolyEval_b);
    prodXY_uid327_pT1_uid255_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid327_pT1_uid255_sinPiZPolyEval_a <= (others => '0');
            prodXY_uid327_pT1_uid255_sinPiZPolyEval_b <= (others => '0');
            prodXY_uid327_pT1_uid255_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid327_pT1_uid255_sinPiZPolyEval_a <= reg_yT1_uid254_sinPiZPolyEval_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_0_q;
                prodXY_uid327_pT1_uid255_sinPiZPolyEval_b <= reg_memoryC2_uid252_sinPiZTableGenerator_lutmem_0_to_prodXY_uid327_pT1_uid255_sinPiZPolyEval_1_q;
                prodXY_uid327_pT1_uid255_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid327_pT1_uid255_sinPiZPolyEval_pr,26));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid327_pT1_uid255_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid327_pT1_uid255_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid327_pT1_uid255_sinPiZPolyEval_q <= prodXY_uid327_pT1_uid255_sinPiZPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid328_pT1_uid255_sinPiZPolyEval(BITSELECT,327)@26
    prodXYTruncFR_uid328_pT1_uid255_sinPiZPolyEval_in <= prodXY_uid327_pT1_uid255_sinPiZPolyEval_q;
    prodXYTruncFR_uid328_pT1_uid255_sinPiZPolyEval_b <= prodXYTruncFR_uid328_pT1_uid255_sinPiZPolyEval_in(25 downto 12);

	--highBBits_uid257_sinPiZPolyEval(BITSELECT,256)@26
    highBBits_uid257_sinPiZPolyEval_in <= prodXYTruncFR_uid328_pT1_uid255_sinPiZPolyEval_b;
    highBBits_uid257_sinPiZPolyEval_b <= highBBits_uid257_sinPiZPolyEval_in(13 downto 1);

	--ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_a(DELAY,796)@19
    ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => zAddr_uid61_fpSinPiTest_b, xout => ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_zAddr_uid61_fpSinPiTest_0_to_memoryC1_uid250_sinPiZTableGenerator_lutmem_0(REG,401)@22
    reg_zAddr_uid61_fpSinPiTest_0_to_memoryC1_uid250_sinPiZTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid61_fpSinPiTest_0_to_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zAddr_uid61_fpSinPiTest_0_to_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_q <= ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid250_sinPiZTableGenerator_lutmem(DUALMEM,347)@23
    memoryC1_uid250_sinPiZTableGenerator_lutmem_ia <= (others => '0');
    memoryC1_uid250_sinPiZTableGenerator_lutmem_aa <= (others => '0');
    memoryC1_uid250_sinPiZTableGenerator_lutmem_ab <= reg_zAddr_uid61_fpSinPiTest_0_to_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_q;
    memoryC1_uid250_sinPiZTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_sin_s5_memoryC1_uid250_sinPiZTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid250_sinPiZTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid250_sinPiZTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid250_sinPiZTableGenerator_lutmem_iq,
        address_a => memoryC1_uid250_sinPiZTableGenerator_lutmem_aa,
        data_a => memoryC1_uid250_sinPiZTableGenerator_lutmem_ia
    );
    memoryC1_uid250_sinPiZTableGenerator_lutmem_reset0 <= areset;
        memoryC1_uid250_sinPiZTableGenerator_lutmem_q <= memoryC1_uid250_sinPiZTableGenerator_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid258_sinPiZPolyEval_0(REG,402)@25
    reg_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid258_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid258_sinPiZPolyEval_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid258_sinPiZPolyEval_0_q <= memoryC1_uid250_sinPiZTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid258_sinPiZPolyEval(ADD,257)@26
    sumAHighB_uid258_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid258_sinPiZPolyEval_0_q(20)) & reg_memoryC1_uid250_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid258_sinPiZPolyEval_0_q);
    sumAHighB_uid258_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid257_sinPiZPolyEval_b(12)) & highBBits_uid257_sinPiZPolyEval_b);
            sumAHighB_uid258_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid258_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid258_sinPiZPolyEval_b));
    sumAHighB_uid258_sinPiZPolyEval_q <= sumAHighB_uid258_sinPiZPolyEval_o(21 downto 0);


	--lowRangeB_uid256_sinPiZPolyEval(BITSELECT,255)@26
    lowRangeB_uid256_sinPiZPolyEval_in <= prodXYTruncFR_uid328_pT1_uid255_sinPiZPolyEval_b(0 downto 0);
    lowRangeB_uid256_sinPiZPolyEval_b <= lowRangeB_uid256_sinPiZPolyEval_in(0 downto 0);

	--s1_uid256_uid259_sinPiZPolyEval(BITJOIN,258)@26
    s1_uid256_uid259_sinPiZPolyEval_q <= sumAHighB_uid258_sinPiZPolyEval_q & lowRangeB_uid256_sinPiZPolyEval_b;

	--reg_s1_uid256_uid259_sinPiZPolyEval_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_1(REG,404)@26
    reg_s1_uid256_uid259_sinPiZPolyEval_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid256_uid259_sinPiZPolyEval_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid256_uid259_sinPiZPolyEval_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_1_q <= s1_uid256_uid259_sinPiZPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_nor(LOGICAL,1010)
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_nor_b <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_sticky_ena_q;
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_nor_q <= not (ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_nor_a or ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_nor_b);

	--ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_mem_top(CONSTANT,1006)
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_mem_top_q <= "0100";

	--ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmp(LOGICAL,1007)
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmp_a <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_mem_top_q;
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdmux_q);
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmp_q <= "1" when ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmp_a = ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmp_b else "0";

	--ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmpReg(REG,1008)
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmpReg_q <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_sticky_ena(REG,1011)
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_nor_q = "1") THEN
                ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_sticky_ena_q <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_enaAnd(LOGICAL,1012)
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_enaAnd_a <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_sticky_ena_q;
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_enaAnd_b <= en;
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_enaAnd_q <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_enaAnd_a and ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_enaAnd_b;

	--reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0(REG,403)@19
    reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q <= zPPolyEval_uid62_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_inputreg(DELAY,1000)
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q, xout => ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt(COUNTER,1002)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_i = 3 THEN
                      ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_i <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_i <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_i,3));


	--ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdreg(REG,1003)
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdreg_q <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdmux(MUX,1004)
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdmux_s <= en;
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdmux: PROCESS (ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdmux_s, ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdreg_q, ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdmux_q <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdmux_q <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem(DUALMEM,1001)
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_ia <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_inputreg_q;
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_aa <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdreg_q;
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_ab <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdmux_q;
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_iq,
        address_a => ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_aa,
        data_a => ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_ia
    );
    ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_reset0 <= areset;
        ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_q <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_iq(17 downto 0);

	--prodXY_uid330_pT2_uid261_sinPiZPolyEval(MULT,329)@27
    prodXY_uid330_pT2_uid261_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid330_pT2_uid261_sinPiZPolyEval_a),19)) * SIGNED(prodXY_uid330_pT2_uid261_sinPiZPolyEval_b);
    prodXY_uid330_pT2_uid261_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid330_pT2_uid261_sinPiZPolyEval_a <= (others => '0');
            prodXY_uid330_pT2_uid261_sinPiZPolyEval_b <= (others => '0');
            prodXY_uid330_pT2_uid261_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid330_pT2_uid261_sinPiZPolyEval_a <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_mem_q;
                prodXY_uid330_pT2_uid261_sinPiZPolyEval_b <= reg_s1_uid256_uid259_sinPiZPolyEval_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_1_q;
                prodXY_uid330_pT2_uid261_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid330_pT2_uid261_sinPiZPolyEval_pr,41));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid330_pT2_uid261_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid330_pT2_uid261_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid330_pT2_uid261_sinPiZPolyEval_q <= prodXY_uid330_pT2_uid261_sinPiZPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid331_pT2_uid261_sinPiZPolyEval(BITSELECT,330)@30
    prodXYTruncFR_uid331_pT2_uid261_sinPiZPolyEval_in <= prodXY_uid330_pT2_uid261_sinPiZPolyEval_q;
    prodXYTruncFR_uid331_pT2_uid261_sinPiZPolyEval_b <= prodXYTruncFR_uid331_pT2_uid261_sinPiZPolyEval_in(40 downto 17);

	--highBBits_uid263_sinPiZPolyEval(BITSELECT,262)@30
    highBBits_uid263_sinPiZPolyEval_in <= prodXYTruncFR_uid331_pT2_uid261_sinPiZPolyEval_b;
    highBBits_uid263_sinPiZPolyEval_b <= highBBits_uid263_sinPiZPolyEval_in(23 downto 2);

	--ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_nor(LOGICAL,1024)
    ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_nor_b <= ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_nor_q <= not (ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_nor_a or ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_nor_b);

	--ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_sticky_ena(REG,1025)
    ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_nor_q = "1") THEN
                ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_sticky_ena_q <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_enaAnd(LOGICAL,1026)
    ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_enaAnd_a <= ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_enaAnd_b <= en;
    ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_enaAnd_q <= ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_enaAnd_a and ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_enaAnd_b;

	--ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_inputreg(DELAY,1014)
    ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => zAddr_uid61_fpSinPiTest_b, xout => ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem(DUALMEM,1015)
    ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_ia <= ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_inputreg_q;
    ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_aa <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdreg_q;
    ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_ab <= ld_reg_zPPolyEval_uid62_fpSinPiTest_0_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_0_q_to_prodXY_uid330_pT2_uid261_sinPiZPolyEval_a_replace_rdmux_q;
    ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_iq,
        address_a => ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_aa,
        data_a => ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_ia
    );
    ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_q <= ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0(REG,405)@26
    reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_q <= ld_zAddr_uid61_fpSinPiTest_b_to_reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid248_sinPiZTableGenerator_lutmem(DUALMEM,346)@27
    memoryC0_uid248_sinPiZTableGenerator_lutmem_ia <= (others => '0');
    memoryC0_uid248_sinPiZTableGenerator_lutmem_aa <= (others => '0');
    memoryC0_uid248_sinPiZTableGenerator_lutmem_ab <= reg_zAddr_uid61_fpSinPiTest_0_to_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_q;
    memoryC0_uid248_sinPiZTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_sin_s5_memoryC0_uid248_sinPiZTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid248_sinPiZTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid248_sinPiZTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid248_sinPiZTableGenerator_lutmem_iq,
        address_a => memoryC0_uid248_sinPiZTableGenerator_lutmem_aa,
        data_a => memoryC0_uid248_sinPiZTableGenerator_lutmem_ia
    );
    memoryC0_uid248_sinPiZTableGenerator_lutmem_reset0 <= areset;
        memoryC0_uid248_sinPiZTableGenerator_lutmem_q <= memoryC0_uid248_sinPiZTableGenerator_lutmem_iq(29 downto 0);

	--reg_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid264_sinPiZPolyEval_0(REG,406)@29
    reg_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid264_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid264_sinPiZPolyEval_0_q <= "000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid264_sinPiZPolyEval_0_q <= memoryC0_uid248_sinPiZTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid264_sinPiZPolyEval(ADD,263)@30
    sumAHighB_uid264_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((30 downto 30 => reg_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid264_sinPiZPolyEval_0_q(29)) & reg_memoryC0_uid248_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid264_sinPiZPolyEval_0_q);
    sumAHighB_uid264_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((30 downto 22 => highBBits_uid263_sinPiZPolyEval_b(21)) & highBBits_uid263_sinPiZPolyEval_b);
            sumAHighB_uid264_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid264_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid264_sinPiZPolyEval_b));
    sumAHighB_uid264_sinPiZPolyEval_q <= sumAHighB_uid264_sinPiZPolyEval_o(30 downto 0);


	--lowRangeB_uid262_sinPiZPolyEval(BITSELECT,261)@30
    lowRangeB_uid262_sinPiZPolyEval_in <= prodXYTruncFR_uid331_pT2_uid261_sinPiZPolyEval_b(1 downto 0);
    lowRangeB_uid262_sinPiZPolyEval_b <= lowRangeB_uid262_sinPiZPolyEval_in(1 downto 0);

	--s2_uid262_uid265_sinPiZPolyEval(BITJOIN,264)@30
    s2_uid262_uid265_sinPiZPolyEval_q <= sumAHighB_uid264_sinPiZPolyEval_q & lowRangeB_uid262_sinPiZPolyEval_b;

	--fxpSinRes_uid64_fpSinPiTest(BITSELECT,63)@30
    fxpSinRes_uid64_fpSinPiTest_in <= s2_uid262_uid265_sinPiZPolyEval_q(30 downto 0);
    fxpSinRes_uid64_fpSinPiTest_b <= fxpSinRes_uid64_fpSinPiTest_in(30 downto 5);

	--ld_sinXIsXRR_uid35_fpSinPiTest_n_to_multSecondOperand_uid66_fpSinPiTest_b(DELAY,463)@14
    ld_sinXIsXRR_uid35_fpSinPiTest_n_to_multSecondOperand_uid66_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => sinXIsXRR_uid35_fpSinPiTest_n, xout => ld_sinXIsXRR_uid35_fpSinPiTest_n_to_multSecondOperand_uid66_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--multSecondOperand_uid66_fpSinPiTest(MUX,65)@30
    multSecondOperand_uid66_fpSinPiTest_s <= ld_sinXIsXRR_uid35_fpSinPiTest_n_to_multSecondOperand_uid66_fpSinPiTest_b_q;
    multSecondOperand_uid66_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSecondOperand_uid66_fpSinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE multSecondOperand_uid66_fpSinPiTest_s IS
                      WHEN "0" => multSecondOperand_uid66_fpSinPiTest_q <= fxpSinRes_uid64_fpSinPiTest_b;
                      WHEN "1" => multSecondOperand_uid66_fpSinPiTest_q <= ld_oFracXRRSmallXRR_uid65_fpSinPiTest_b_to_multSecondOperand_uid66_fpSinPiTest_d_replace_mem_q;
                      WHEN OTHERS => multSecondOperand_uid66_fpSinPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_nor(LOGICAL,843)
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_nor_b <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_sticky_ena_q;
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_nor_q <= not (ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_nor_a or ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_nor_b);

	--ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_sticky_ena(REG,844)
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_nor_q = "1") THEN
                ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_sticky_ena_q <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_enaAnd(LOGICAL,845)
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_enaAnd_a <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_sticky_ena_q;
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_enaAnd_b <= en;
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_enaAnd_q <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_enaAnd_a and ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_enaAnd_b;

	--cPi_uid52_fpSinPiTest(CONSTANT,51)
    cPi_uid52_fpSinPiTest_q <= "11001001000011111101101011";

	--LeftShiftStage263dto0_uid243_alignedZ_uid51_fpSinPiTest(BITSELECT,242)@25
    LeftShiftStage263dto0_uid243_alignedZ_uid51_fpSinPiTest_in <= leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_q(63 downto 0);
    LeftShiftStage263dto0_uid243_alignedZ_uid51_fpSinPiTest_b <= LeftShiftStage263dto0_uid243_alignedZ_uid51_fpSinPiTest_in(63 downto 0);

	--leftShiftStage3Idx1_uid244_alignedZ_uid51_fpSinPiTest(BITJOIN,243)@25
    leftShiftStage3Idx1_uid244_alignedZ_uid51_fpSinPiTest_q <= LeftShiftStage263dto0_uid243_alignedZ_uid51_fpSinPiTest_b & GND_q;

	--leftShiftStage0Idx2_uid216_alignedZ_uid51_fpSinPiTest(CONSTANT,215)
    leftShiftStage0Idx2_uid216_alignedZ_uid51_fpSinPiTest_q <= "00000000000000000000000000000000000000000000000000000000000000000";

	--ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_nor(LOGICAL,982)
    ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_nor_b <= ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_sticky_ena_q;
    ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_nor_q <= not (ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_nor_a or ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_nor_b);

	--ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_sticky_ena(REG,983)
    ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_nor_q = "1") THEN
                ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_sticky_ena_q <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_enaAnd(LOGICAL,984)
    ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_enaAnd_a <= ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_sticky_ena_q;
    ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_enaAnd_b <= en;
    ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_enaAnd_q <= ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_enaAnd_a and ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_enaAnd_b;

	--X32dto0_uid214_alignedZ_uid51_fpSinPiTest(BITSELECT,213)@19
    X32dto0_uid214_alignedZ_uid51_fpSinPiTest_in <= z_uid48_fpSinPiTest_q(32 downto 0);
    X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b <= X32dto0_uid214_alignedZ_uid51_fpSinPiTest_in(32 downto 0);

	--ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_inputreg(DELAY,974)
    ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 33, depth => 1 )
    PORT MAP ( xin => X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b, xout => ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem(DUALMEM,975)
    ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_ia <= ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_inputreg_q;
    ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_aa <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdreg_q;
    ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_ab <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdmux_q;
    ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 33,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 33,
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
        clocken1 => ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_iq,
        address_a => ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_aa,
        data_a => ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_ia
    );
    ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_reset0 <= areset;
        ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_q <= ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_iq(32 downto 0);

	--zs_uid177_lzcZ_uid50_fpSinPiTest(CONSTANT,176)
    zs_uid177_lzcZ_uid50_fpSinPiTest_q <= "00000000000000000000000000000000";

	--leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest(BITJOIN,214)@23
    leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_q <= ld_X32dto0_uid214_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_b_replace_mem_q & zs_uid177_lzcZ_uid50_fpSinPiTest_q;

	--ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_nor(LOGICAL,993)
    ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_nor_b <= ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_sticky_ena_q;
    ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_nor_q <= not (ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_nor_a or ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_nor_b);

	--ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_sticky_ena(REG,994)
    ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_nor_q = "1") THEN
                ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_sticky_ena_q <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_enaAnd(LOGICAL,995)
    ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_enaAnd_a <= ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_sticky_ena_q;
    ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_enaAnd_b <= en;
    ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_enaAnd_q <= ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_enaAnd_a and ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_enaAnd_b;

	--ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_inputreg(DELAY,985)
    ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 65, depth => 1 )
    PORT MAP ( xin => z_uid48_fpSinPiTest_q, xout => ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem(DUALMEM,986)
    ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_ia <= ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_inputreg_q;
    ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_aa <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdreg_q;
    ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_ab <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdmux_q;
    ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 65,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 65,
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
        clocken1 => ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_iq,
        address_a => ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_aa,
        data_a => ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_ia
    );
    ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_reset0 <= areset;
        ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_q <= ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_iq(64 downto 0);

	--zs_uid169_lzcZ_uid50_fpSinPiTest(CONSTANT,168)
    zs_uid169_lzcZ_uid50_fpSinPiTest_q <= "0000000000000000000000000000000000000000000000000000000000000000";

	--rVStage_uid170_lzcZ_uid50_fpSinPiTest(BITSELECT,169)@19
    rVStage_uid170_lzcZ_uid50_fpSinPiTest_in <= z_uid48_fpSinPiTest_q;
    rVStage_uid170_lzcZ_uid50_fpSinPiTest_b <= rVStage_uid170_lzcZ_uid50_fpSinPiTest_in(64 downto 1);

	--vCount_uid171_lzcZ_uid50_fpSinPiTest(LOGICAL,170)@19
    vCount_uid171_lzcZ_uid50_fpSinPiTest_a <= rVStage_uid170_lzcZ_uid50_fpSinPiTest_b;
    vCount_uid171_lzcZ_uid50_fpSinPiTest_b <= zs_uid169_lzcZ_uid50_fpSinPiTest_q;
    vCount_uid171_lzcZ_uid50_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid171_lzcZ_uid50_fpSinPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid171_lzcZ_uid50_fpSinPiTest_a = vCount_uid171_lzcZ_uid50_fpSinPiTest_b) THEN
                vCount_uid171_lzcZ_uid50_fpSinPiTest_q <= "1";
            ELSE
                vCount_uid171_lzcZ_uid50_fpSinPiTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--ld_vCount_uid171_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_g(DELAY,604)@20
    ld_vCount_uid171_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_g : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => vCount_uid171_lzcZ_uid50_fpSinPiTest_q, xout => ld_vCount_uid171_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_g_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid173_lzcZ_uid50_fpSinPiTest(BITSELECT,172)@19
    vStage_uid173_lzcZ_uid50_fpSinPiTest_in <= z_uid48_fpSinPiTest_q(0 downto 0);
    vStage_uid173_lzcZ_uid50_fpSinPiTest_b <= vStage_uid173_lzcZ_uid50_fpSinPiTest_in(0 downto 0);

	--ld_vStage_uid173_lzcZ_uid50_fpSinPiTest_b_to_cStage_uid174_lzcZ_uid50_fpSinPiTest_b(DELAY,562)@19
    ld_vStage_uid173_lzcZ_uid50_fpSinPiTest_b_to_cStage_uid174_lzcZ_uid50_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vStage_uid173_lzcZ_uid50_fpSinPiTest_b, xout => ld_vStage_uid173_lzcZ_uid50_fpSinPiTest_b_to_cStage_uid174_lzcZ_uid50_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--mO_uid172_lzcZ_uid50_fpSinPiTest(CONSTANT,171)
    mO_uid172_lzcZ_uid50_fpSinPiTest_q <= "111111111111111111111111111111111111111111111111111111111111111";

	--cStage_uid174_lzcZ_uid50_fpSinPiTest(BITJOIN,173)@20
    cStage_uid174_lzcZ_uid50_fpSinPiTest_q <= ld_vStage_uid173_lzcZ_uid50_fpSinPiTest_b_to_cStage_uid174_lzcZ_uid50_fpSinPiTest_b_q & mO_uid172_lzcZ_uid50_fpSinPiTest_q;

	--ld_rVStage_uid170_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid176_lzcZ_uid50_fpSinPiTest_c(DELAY,564)@19
    ld_rVStage_uid170_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid176_lzcZ_uid50_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 64, depth => 1 )
    PORT MAP ( xin => rVStage_uid170_lzcZ_uid50_fpSinPiTest_b, xout => ld_rVStage_uid170_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid176_lzcZ_uid50_fpSinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid176_lzcZ_uid50_fpSinPiTest(MUX,175)@20
    vStagei_uid176_lzcZ_uid50_fpSinPiTest_s <= vCount_uid171_lzcZ_uid50_fpSinPiTest_q;
    vStagei_uid176_lzcZ_uid50_fpSinPiTest: PROCESS (vStagei_uid176_lzcZ_uid50_fpSinPiTest_s, en, ld_rVStage_uid170_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid176_lzcZ_uid50_fpSinPiTest_c_q, cStage_uid174_lzcZ_uid50_fpSinPiTest_q)
    BEGIN
            CASE vStagei_uid176_lzcZ_uid50_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid176_lzcZ_uid50_fpSinPiTest_q <= ld_rVStage_uid170_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid176_lzcZ_uid50_fpSinPiTest_c_q;
                  WHEN "1" => vStagei_uid176_lzcZ_uid50_fpSinPiTest_q <= cStage_uid174_lzcZ_uid50_fpSinPiTest_q;
                  WHEN OTHERS => vStagei_uid176_lzcZ_uid50_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid178_lzcZ_uid50_fpSinPiTest(BITSELECT,177)@20
    rVStage_uid178_lzcZ_uid50_fpSinPiTest_in <= vStagei_uid176_lzcZ_uid50_fpSinPiTest_q;
    rVStage_uid178_lzcZ_uid50_fpSinPiTest_b <= rVStage_uid178_lzcZ_uid50_fpSinPiTest_in(63 downto 32);

	--vCount_uid179_lzcZ_uid50_fpSinPiTest(LOGICAL,178)@20
    vCount_uid179_lzcZ_uid50_fpSinPiTest_a <= rVStage_uid178_lzcZ_uid50_fpSinPiTest_b;
    vCount_uid179_lzcZ_uid50_fpSinPiTest_b <= zs_uid177_lzcZ_uid50_fpSinPiTest_q;
    vCount_uid179_lzcZ_uid50_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid179_lzcZ_uid50_fpSinPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid179_lzcZ_uid50_fpSinPiTest_a = vCount_uid179_lzcZ_uid50_fpSinPiTest_b) THEN
                vCount_uid179_lzcZ_uid50_fpSinPiTest_q <= "1";
            ELSE
                vCount_uid179_lzcZ_uid50_fpSinPiTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--ld_vCount_uid179_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_f(DELAY,603)@21
    ld_vCount_uid179_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid179_lzcZ_uid50_fpSinPiTest_q, xout => ld_vCount_uid179_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid180_lzcZ_uid50_fpSinPiTest(BITSELECT,179)@20
    vStage_uid180_lzcZ_uid50_fpSinPiTest_in <= vStagei_uid176_lzcZ_uid50_fpSinPiTest_q(31 downto 0);
    vStage_uid180_lzcZ_uid50_fpSinPiTest_b <= vStage_uid180_lzcZ_uid50_fpSinPiTest_in(31 downto 0);

	--ld_vStage_uid180_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid182_lzcZ_uid50_fpSinPiTest_d(DELAY,571)@20
    ld_vStage_uid180_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid182_lzcZ_uid50_fpSinPiTest_d : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => vStage_uid180_lzcZ_uid50_fpSinPiTest_b, xout => ld_vStage_uid180_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid182_lzcZ_uid50_fpSinPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--ld_rVStage_uid178_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid182_lzcZ_uid50_fpSinPiTest_c(DELAY,570)@20
    ld_rVStage_uid178_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid182_lzcZ_uid50_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => rVStage_uid178_lzcZ_uid50_fpSinPiTest_b, xout => ld_rVStage_uid178_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid182_lzcZ_uid50_fpSinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid182_lzcZ_uid50_fpSinPiTest(MUX,181)@21
    vStagei_uid182_lzcZ_uid50_fpSinPiTest_s <= vCount_uid179_lzcZ_uid50_fpSinPiTest_q;
    vStagei_uid182_lzcZ_uid50_fpSinPiTest: PROCESS (vStagei_uid182_lzcZ_uid50_fpSinPiTest_s, en, ld_rVStage_uid178_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid182_lzcZ_uid50_fpSinPiTest_c_q, ld_vStage_uid180_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid182_lzcZ_uid50_fpSinPiTest_d_q)
    BEGIN
            CASE vStagei_uid182_lzcZ_uid50_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid182_lzcZ_uid50_fpSinPiTest_q <= ld_rVStage_uid178_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid182_lzcZ_uid50_fpSinPiTest_c_q;
                  WHEN "1" => vStagei_uid182_lzcZ_uid50_fpSinPiTest_q <= ld_vStage_uid180_lzcZ_uid50_fpSinPiTest_b_to_vStagei_uid182_lzcZ_uid50_fpSinPiTest_d_q;
                  WHEN OTHERS => vStagei_uid182_lzcZ_uid50_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid184_lzcZ_uid50_fpSinPiTest(BITSELECT,183)@21
    rVStage_uid184_lzcZ_uid50_fpSinPiTest_in <= vStagei_uid182_lzcZ_uid50_fpSinPiTest_q;
    rVStage_uid184_lzcZ_uid50_fpSinPiTest_b <= rVStage_uid184_lzcZ_uid50_fpSinPiTest_in(31 downto 16);

	--vCount_uid185_lzcZ_uid50_fpSinPiTest(LOGICAL,184)@21
    vCount_uid185_lzcZ_uid50_fpSinPiTest_a <= rVStage_uid184_lzcZ_uid50_fpSinPiTest_b;
    vCount_uid185_lzcZ_uid50_fpSinPiTest_b <= zs_uid183_lzcZ_uid50_fpSinPiTest_q;
    vCount_uid185_lzcZ_uid50_fpSinPiTest_q <= "1" when vCount_uid185_lzcZ_uid50_fpSinPiTest_a = vCount_uid185_lzcZ_uid50_fpSinPiTest_b else "0";

	--ld_vCount_uid185_lzcZ_uid50_fpSinPiTest_q_to_reg_vCount_uid185_lzcZ_uid50_fpSinPiTest_0_to_r_uid210_lzcZ_uid50_fpSinPiTest_4_a(DELAY,783)@21
    ld_vCount_uid185_lzcZ_uid50_fpSinPiTest_q_to_reg_vCount_uid185_lzcZ_uid50_fpSinPiTest_0_to_r_uid210_lzcZ_uid50_fpSinPiTest_4_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid185_lzcZ_uid50_fpSinPiTest_q, xout => ld_vCount_uid185_lzcZ_uid50_fpSinPiTest_q_to_reg_vCount_uid185_lzcZ_uid50_fpSinPiTest_0_to_r_uid210_lzcZ_uid50_fpSinPiTest_4_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid185_lzcZ_uid50_fpSinPiTest_0_to_r_uid210_lzcZ_uid50_fpSinPiTest_4(REG,388)@22
    reg_vCount_uid185_lzcZ_uid50_fpSinPiTest_0_to_r_uid210_lzcZ_uid50_fpSinPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid185_lzcZ_uid50_fpSinPiTest_0_to_r_uid210_lzcZ_uid50_fpSinPiTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid185_lzcZ_uid50_fpSinPiTest_0_to_r_uid210_lzcZ_uid50_fpSinPiTest_4_q <= ld_vCount_uid185_lzcZ_uid50_fpSinPiTest_q_to_reg_vCount_uid185_lzcZ_uid50_fpSinPiTest_0_to_r_uid210_lzcZ_uid50_fpSinPiTest_4_a_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid186_lzcZ_uid50_fpSinPiTest(BITSELECT,185)@21
    vStage_uid186_lzcZ_uid50_fpSinPiTest_in <= vStagei_uid182_lzcZ_uid50_fpSinPiTest_q(15 downto 0);
    vStage_uid186_lzcZ_uid50_fpSinPiTest_b <= vStage_uid186_lzcZ_uid50_fpSinPiTest_in(15 downto 0);

	--vStagei_uid188_lzcZ_uid50_fpSinPiTest(MUX,187)@21
    vStagei_uid188_lzcZ_uid50_fpSinPiTest_s <= vCount_uid185_lzcZ_uid50_fpSinPiTest_q;
    vStagei_uid188_lzcZ_uid50_fpSinPiTest: PROCESS (vStagei_uid188_lzcZ_uid50_fpSinPiTest_s, en, rVStage_uid184_lzcZ_uid50_fpSinPiTest_b, vStage_uid186_lzcZ_uid50_fpSinPiTest_b)
    BEGIN
            CASE vStagei_uid188_lzcZ_uid50_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid188_lzcZ_uid50_fpSinPiTest_q <= rVStage_uid184_lzcZ_uid50_fpSinPiTest_b;
                  WHEN "1" => vStagei_uid188_lzcZ_uid50_fpSinPiTest_q <= vStage_uid186_lzcZ_uid50_fpSinPiTest_b;
                  WHEN OTHERS => vStagei_uid188_lzcZ_uid50_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid190_lzcZ_uid50_fpSinPiTest(BITSELECT,189)@21
    rVStage_uid190_lzcZ_uid50_fpSinPiTest_in <= vStagei_uid188_lzcZ_uid50_fpSinPiTest_q;
    rVStage_uid190_lzcZ_uid50_fpSinPiTest_b <= rVStage_uid190_lzcZ_uid50_fpSinPiTest_in(15 downto 8);

	--reg_rVStage_uid190_lzcZ_uid50_fpSinPiTest_0_to_vCount_uid191_lzcZ_uid50_fpSinPiTest_1(REG,383)@21
    reg_rVStage_uid190_lzcZ_uid50_fpSinPiTest_0_to_vCount_uid191_lzcZ_uid50_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid190_lzcZ_uid50_fpSinPiTest_0_to_vCount_uid191_lzcZ_uid50_fpSinPiTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid190_lzcZ_uid50_fpSinPiTest_0_to_vCount_uid191_lzcZ_uid50_fpSinPiTest_1_q <= rVStage_uid190_lzcZ_uid50_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid191_lzcZ_uid50_fpSinPiTest(LOGICAL,190)@22
    vCount_uid191_lzcZ_uid50_fpSinPiTest_a <= reg_rVStage_uid190_lzcZ_uid50_fpSinPiTest_0_to_vCount_uid191_lzcZ_uid50_fpSinPiTest_1_q;
    vCount_uid191_lzcZ_uid50_fpSinPiTest_b <= cstAllZWE_uid8_fpSinPiTest_q;
    vCount_uid191_lzcZ_uid50_fpSinPiTest_q <= "1" when vCount_uid191_lzcZ_uid50_fpSinPiTest_a = vCount_uid191_lzcZ_uid50_fpSinPiTest_b else "0";

	--ld_vCount_uid191_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_d(DELAY,601)@22
    ld_vCount_uid191_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid191_lzcZ_uid50_fpSinPiTest_q, xout => ld_vCount_uid191_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid192_lzcZ_uid50_fpSinPiTest(BITSELECT,191)@21
    vStage_uid192_lzcZ_uid50_fpSinPiTest_in <= vStagei_uid188_lzcZ_uid50_fpSinPiTest_q(7 downto 0);
    vStage_uid192_lzcZ_uid50_fpSinPiTest_b <= vStage_uid192_lzcZ_uid50_fpSinPiTest_in(7 downto 0);

	--reg_vStage_uid192_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid194_lzcZ_uid50_fpSinPiTest_3(REG,385)@21
    reg_vStage_uid192_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid194_lzcZ_uid50_fpSinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid192_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid194_lzcZ_uid50_fpSinPiTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid192_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid194_lzcZ_uid50_fpSinPiTest_3_q <= vStage_uid192_lzcZ_uid50_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid194_lzcZ_uid50_fpSinPiTest(MUX,193)@22
    vStagei_uid194_lzcZ_uid50_fpSinPiTest_s <= vCount_uid191_lzcZ_uid50_fpSinPiTest_q;
    vStagei_uid194_lzcZ_uid50_fpSinPiTest: PROCESS (vStagei_uid194_lzcZ_uid50_fpSinPiTest_s, en, reg_rVStage_uid190_lzcZ_uid50_fpSinPiTest_0_to_vCount_uid191_lzcZ_uid50_fpSinPiTest_1_q, reg_vStage_uid192_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid194_lzcZ_uid50_fpSinPiTest_3_q)
    BEGIN
            CASE vStagei_uid194_lzcZ_uid50_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid194_lzcZ_uid50_fpSinPiTest_q <= reg_rVStage_uid190_lzcZ_uid50_fpSinPiTest_0_to_vCount_uid191_lzcZ_uid50_fpSinPiTest_1_q;
                  WHEN "1" => vStagei_uid194_lzcZ_uid50_fpSinPiTest_q <= reg_vStage_uid192_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid194_lzcZ_uid50_fpSinPiTest_3_q;
                  WHEN OTHERS => vStagei_uid194_lzcZ_uid50_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid196_lzcZ_uid50_fpSinPiTest(BITSELECT,195)@22
    rVStage_uid196_lzcZ_uid50_fpSinPiTest_in <= vStagei_uid194_lzcZ_uid50_fpSinPiTest_q;
    rVStage_uid196_lzcZ_uid50_fpSinPiTest_b <= rVStage_uid196_lzcZ_uid50_fpSinPiTest_in(7 downto 4);

	--vCount_uid197_lzcZ_uid50_fpSinPiTest(LOGICAL,196)@22
    vCount_uid197_lzcZ_uid50_fpSinPiTest_a <= rVStage_uid196_lzcZ_uid50_fpSinPiTest_b;
    vCount_uid197_lzcZ_uid50_fpSinPiTest_b <= leftShiftStage0Idx1Pad4_uid146_fxpX_uid40_fpSinPiTest_q;
    vCount_uid197_lzcZ_uid50_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid197_lzcZ_uid50_fpSinPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid197_lzcZ_uid50_fpSinPiTest_a = vCount_uid197_lzcZ_uid50_fpSinPiTest_b) THEN
                vCount_uid197_lzcZ_uid50_fpSinPiTest_q <= "1";
            ELSE
                vCount_uid197_lzcZ_uid50_fpSinPiTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--vStage_uid198_lzcZ_uid50_fpSinPiTest(BITSELECT,197)@22
    vStage_uid198_lzcZ_uid50_fpSinPiTest_in <= vStagei_uid194_lzcZ_uid50_fpSinPiTest_q(3 downto 0);
    vStage_uid198_lzcZ_uid50_fpSinPiTest_b <= vStage_uid198_lzcZ_uid50_fpSinPiTest_in(3 downto 0);

	--reg_vStage_uid198_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid200_lzcZ_uid50_fpSinPiTest_3(REG,387)@22
    reg_vStage_uid198_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid200_lzcZ_uid50_fpSinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid198_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid200_lzcZ_uid50_fpSinPiTest_3_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid198_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid200_lzcZ_uid50_fpSinPiTest_3_q <= vStage_uid198_lzcZ_uid50_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid196_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid200_lzcZ_uid50_fpSinPiTest_2(REG,386)@22
    reg_rVStage_uid196_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid200_lzcZ_uid50_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid196_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid200_lzcZ_uid50_fpSinPiTest_2_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid196_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid200_lzcZ_uid50_fpSinPiTest_2_q <= rVStage_uid196_lzcZ_uid50_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid200_lzcZ_uid50_fpSinPiTest(MUX,199)@23
    vStagei_uid200_lzcZ_uid50_fpSinPiTest_s <= vCount_uid197_lzcZ_uid50_fpSinPiTest_q;
    vStagei_uid200_lzcZ_uid50_fpSinPiTest: PROCESS (vStagei_uid200_lzcZ_uid50_fpSinPiTest_s, en, reg_rVStage_uid196_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid200_lzcZ_uid50_fpSinPiTest_2_q, reg_vStage_uid198_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid200_lzcZ_uid50_fpSinPiTest_3_q)
    BEGIN
            CASE vStagei_uid200_lzcZ_uid50_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid200_lzcZ_uid50_fpSinPiTest_q <= reg_rVStage_uid196_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid200_lzcZ_uid50_fpSinPiTest_2_q;
                  WHEN "1" => vStagei_uid200_lzcZ_uid50_fpSinPiTest_q <= reg_vStage_uid198_lzcZ_uid50_fpSinPiTest_0_to_vStagei_uid200_lzcZ_uid50_fpSinPiTest_3_q;
                  WHEN OTHERS => vStagei_uid200_lzcZ_uid50_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid202_lzcZ_uid50_fpSinPiTest(BITSELECT,201)@23
    rVStage_uid202_lzcZ_uid50_fpSinPiTest_in <= vStagei_uid200_lzcZ_uid50_fpSinPiTest_q;
    rVStage_uid202_lzcZ_uid50_fpSinPiTest_b <= rVStage_uid202_lzcZ_uid50_fpSinPiTest_in(3 downto 2);

	--vCount_uid203_lzcZ_uid50_fpSinPiTest(LOGICAL,202)@23
    vCount_uid203_lzcZ_uid50_fpSinPiTest_a <= rVStage_uid202_lzcZ_uid50_fpSinPiTest_b;
    vCount_uid203_lzcZ_uid50_fpSinPiTest_b <= leftShiftStage1Idx2Pad2_uid160_fxpX_uid40_fpSinPiTest_q;
    vCount_uid203_lzcZ_uid50_fpSinPiTest_q <= "1" when vCount_uid203_lzcZ_uid50_fpSinPiTest_a = vCount_uid203_lzcZ_uid50_fpSinPiTest_b else "0";

	--vStage_uid204_lzcZ_uid50_fpSinPiTest(BITSELECT,203)@23
    vStage_uid204_lzcZ_uid50_fpSinPiTest_in <= vStagei_uid200_lzcZ_uid50_fpSinPiTest_q(1 downto 0);
    vStage_uid204_lzcZ_uid50_fpSinPiTest_b <= vStage_uid204_lzcZ_uid50_fpSinPiTest_in(1 downto 0);

	--vStagei_uid206_lzcZ_uid50_fpSinPiTest(MUX,205)@23
    vStagei_uid206_lzcZ_uid50_fpSinPiTest_s <= vCount_uid203_lzcZ_uid50_fpSinPiTest_q;
    vStagei_uid206_lzcZ_uid50_fpSinPiTest: PROCESS (vStagei_uid206_lzcZ_uid50_fpSinPiTest_s, en, rVStage_uid202_lzcZ_uid50_fpSinPiTest_b, vStage_uid204_lzcZ_uid50_fpSinPiTest_b)
    BEGIN
            CASE vStagei_uid206_lzcZ_uid50_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid206_lzcZ_uid50_fpSinPiTest_q <= rVStage_uid202_lzcZ_uid50_fpSinPiTest_b;
                  WHEN "1" => vStagei_uid206_lzcZ_uid50_fpSinPiTest_q <= vStage_uid204_lzcZ_uid50_fpSinPiTest_b;
                  WHEN OTHERS => vStagei_uid206_lzcZ_uid50_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid208_lzcZ_uid50_fpSinPiTest(BITSELECT,207)@23
    rVStage_uid208_lzcZ_uid50_fpSinPiTest_in <= vStagei_uid206_lzcZ_uid50_fpSinPiTest_q;
    rVStage_uid208_lzcZ_uid50_fpSinPiTest_b <= rVStage_uid208_lzcZ_uid50_fpSinPiTest_in(1 downto 1);

	--vCount_uid209_lzcZ_uid50_fpSinPiTest(LOGICAL,208)@23
    vCount_uid209_lzcZ_uid50_fpSinPiTest_a <= rVStage_uid208_lzcZ_uid50_fpSinPiTest_b;
    vCount_uid209_lzcZ_uid50_fpSinPiTest_b <= GND_q;
    vCount_uid209_lzcZ_uid50_fpSinPiTest_q <= "1" when vCount_uid209_lzcZ_uid50_fpSinPiTest_a = vCount_uid209_lzcZ_uid50_fpSinPiTest_b else "0";

	--r_uid210_lzcZ_uid50_fpSinPiTest(BITJOIN,209)@23
    r_uid210_lzcZ_uid50_fpSinPiTest_q <= ld_vCount_uid171_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_g_q & ld_vCount_uid179_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_f_q & reg_vCount_uid185_lzcZ_uid50_fpSinPiTest_0_to_r_uid210_lzcZ_uid50_fpSinPiTest_4_q & ld_vCount_uid191_lzcZ_uid50_fpSinPiTest_q_to_r_uid210_lzcZ_uid50_fpSinPiTest_d_q & vCount_uid197_lzcZ_uid50_fpSinPiTest_q & vCount_uid203_lzcZ_uid50_fpSinPiTest_q & vCount_uid209_lzcZ_uid50_fpSinPiTest_q;

	--leftShiftStageSel6Dto5_uid218_alignedZ_uid51_fpSinPiTest(BITSELECT,217)@23
    leftShiftStageSel6Dto5_uid218_alignedZ_uid51_fpSinPiTest_in <= r_uid210_lzcZ_uid50_fpSinPiTest_q;
    leftShiftStageSel6Dto5_uid218_alignedZ_uid51_fpSinPiTest_b <= leftShiftStageSel6Dto5_uid218_alignedZ_uid51_fpSinPiTest_in(6 downto 5);

	--leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest(MUX,218)@23
    leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_s <= leftShiftStageSel6Dto5_uid218_alignedZ_uid51_fpSinPiTest_b;
    leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest: PROCESS (leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_s, en, ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_q, leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_q, leftShiftStage0Idx2_uid216_alignedZ_uid51_fpSinPiTest_q, leftShiftStage0Idx2_uid216_alignedZ_uid51_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_q <= ld_z_uid48_fpSinPiTest_q_to_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_c_replace_mem_q;
                  WHEN "01" => leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_q <= leftShiftStage0Idx1_uid215_alignedZ_uid51_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_q <= leftShiftStage0Idx2_uid216_alignedZ_uid51_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_q <= leftShiftStage0Idx2_uid216_alignedZ_uid51_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage040dto0_uid227_alignedZ_uid51_fpSinPiTest(BITSELECT,226)@23
    LeftShiftStage040dto0_uid227_alignedZ_uid51_fpSinPiTest_in <= leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_q(40 downto 0);
    LeftShiftStage040dto0_uid227_alignedZ_uid51_fpSinPiTest_b <= LeftShiftStage040dto0_uid227_alignedZ_uid51_fpSinPiTest_in(40 downto 0);

	--leftShiftStage1Idx3_uid228_alignedZ_uid51_fpSinPiTest(BITJOIN,227)@23
    leftShiftStage1Idx3_uid228_alignedZ_uid51_fpSinPiTest_q <= LeftShiftStage040dto0_uid227_alignedZ_uid51_fpSinPiTest_b & leftShiftStage1Idx3Pad24_uid226_alignedZ_uid51_fpSinPiTest_q;

	--reg_leftShiftStage1Idx3_uid228_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_5(REG,393)@23
    reg_leftShiftStage1Idx3_uid228_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid228_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_5_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid228_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_5_q <= leftShiftStage1Idx3_uid228_alignedZ_uid51_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage048dto0_uid224_alignedZ_uid51_fpSinPiTest(BITSELECT,223)@23
    LeftShiftStage048dto0_uid224_alignedZ_uid51_fpSinPiTest_in <= leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_q(48 downto 0);
    LeftShiftStage048dto0_uid224_alignedZ_uid51_fpSinPiTest_b <= LeftShiftStage048dto0_uid224_alignedZ_uid51_fpSinPiTest_in(48 downto 0);

	--leftShiftStage1Idx2_uid225_alignedZ_uid51_fpSinPiTest(BITJOIN,224)@23
    leftShiftStage1Idx2_uid225_alignedZ_uid51_fpSinPiTest_q <= LeftShiftStage048dto0_uid224_alignedZ_uid51_fpSinPiTest_b & zs_uid183_lzcZ_uid50_fpSinPiTest_q;

	--reg_leftShiftStage1Idx2_uid225_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_4(REG,392)@23
    reg_leftShiftStage1Idx2_uid225_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid225_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_4_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid225_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_4_q <= leftShiftStage1Idx2_uid225_alignedZ_uid51_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage056dto0_uid221_alignedZ_uid51_fpSinPiTest(BITSELECT,220)@23
    LeftShiftStage056dto0_uid221_alignedZ_uid51_fpSinPiTest_in <= leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_q(56 downto 0);
    LeftShiftStage056dto0_uid221_alignedZ_uid51_fpSinPiTest_b <= LeftShiftStage056dto0_uid221_alignedZ_uid51_fpSinPiTest_in(56 downto 0);

	--leftShiftStage1Idx1_uid222_alignedZ_uid51_fpSinPiTest(BITJOIN,221)@23
    leftShiftStage1Idx1_uid222_alignedZ_uid51_fpSinPiTest_q <= LeftShiftStage056dto0_uid221_alignedZ_uid51_fpSinPiTest_b & cstAllZWE_uid8_fpSinPiTest_q;

	--reg_leftShiftStage1Idx1_uid222_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_3(REG,391)@23
    reg_leftShiftStage1Idx1_uid222_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid222_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_3_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid222_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_3_q <= leftShiftStage1Idx1_uid222_alignedZ_uid51_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_2(REG,390)@23
    reg_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_2_q <= leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel4Dto3_uid229_alignedZ_uid51_fpSinPiTest(BITSELECT,228)@23
    leftShiftStageSel4Dto3_uid229_alignedZ_uid51_fpSinPiTest_in <= r_uid210_lzcZ_uid50_fpSinPiTest_q(4 downto 0);
    leftShiftStageSel4Dto3_uid229_alignedZ_uid51_fpSinPiTest_b <= leftShiftStageSel4Dto3_uid229_alignedZ_uid51_fpSinPiTest_in(4 downto 3);

	--reg_leftShiftStageSel4Dto3_uid229_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_1(REG,389)@23
    reg_leftShiftStageSel4Dto3_uid229_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel4Dto3_uid229_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel4Dto3_uid229_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_1_q <= leftShiftStageSel4Dto3_uid229_alignedZ_uid51_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest(MUX,229)@24
    leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_s <= reg_leftShiftStageSel4Dto3_uid229_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_1_q;
    leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest: PROCESS (leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_s, en, reg_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_2_q, reg_leftShiftStage1Idx1_uid222_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_3_q, reg_leftShiftStage1Idx2_uid225_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_4_q, reg_leftShiftStage1Idx3_uid228_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_q <= reg_leftShiftStage0_uid219_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_q <= reg_leftShiftStage1Idx1_uid222_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_3_q;
                  WHEN "10" => leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_q <= reg_leftShiftStage1Idx2_uid225_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_4_q;
                  WHEN "11" => leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_q <= reg_leftShiftStage1Idx3_uid228_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage158dto0_uid238_alignedZ_uid51_fpSinPiTest(BITSELECT,237)@24
    LeftShiftStage158dto0_uid238_alignedZ_uid51_fpSinPiTest_in <= leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_q(58 downto 0);
    LeftShiftStage158dto0_uid238_alignedZ_uid51_fpSinPiTest_b <= LeftShiftStage158dto0_uid238_alignedZ_uid51_fpSinPiTest_in(58 downto 0);

	--ld_LeftShiftStage158dto0_uid238_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx3_uid239_alignedZ_uid51_fpSinPiTest_b(DELAY,628)@24
    ld_LeftShiftStage158dto0_uid238_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx3_uid239_alignedZ_uid51_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 59, depth => 1 )
    PORT MAP ( xin => LeftShiftStage158dto0_uid238_alignedZ_uid51_fpSinPiTest_b, xout => ld_LeftShiftStage158dto0_uid238_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx3_uid239_alignedZ_uid51_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx3_uid239_alignedZ_uid51_fpSinPiTest(BITJOIN,238)@25
    leftShiftStage2Idx3_uid239_alignedZ_uid51_fpSinPiTest_q <= ld_LeftShiftStage158dto0_uid238_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx3_uid239_alignedZ_uid51_fpSinPiTest_b_q & leftShiftStage2Idx3Pad6_uid237_alignedZ_uid51_fpSinPiTest_q;

	--LeftShiftStage160dto0_uid235_alignedZ_uid51_fpSinPiTest(BITSELECT,234)@24
    LeftShiftStage160dto0_uid235_alignedZ_uid51_fpSinPiTest_in <= leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_q(60 downto 0);
    LeftShiftStage160dto0_uid235_alignedZ_uid51_fpSinPiTest_b <= LeftShiftStage160dto0_uid235_alignedZ_uid51_fpSinPiTest_in(60 downto 0);

	--ld_LeftShiftStage160dto0_uid235_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx2_uid236_alignedZ_uid51_fpSinPiTest_b(DELAY,626)@24
    ld_LeftShiftStage160dto0_uid235_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx2_uid236_alignedZ_uid51_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 61, depth => 1 )
    PORT MAP ( xin => LeftShiftStage160dto0_uid235_alignedZ_uid51_fpSinPiTest_b, xout => ld_LeftShiftStage160dto0_uid235_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx2_uid236_alignedZ_uid51_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx2_uid236_alignedZ_uid51_fpSinPiTest(BITJOIN,235)@25
    leftShiftStage2Idx2_uid236_alignedZ_uid51_fpSinPiTest_q <= ld_LeftShiftStage160dto0_uid235_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx2_uid236_alignedZ_uid51_fpSinPiTest_b_q & leftShiftStage0Idx1Pad4_uid146_fxpX_uid40_fpSinPiTest_q;

	--LeftShiftStage162dto0_uid232_alignedZ_uid51_fpSinPiTest(BITSELECT,231)@24
    LeftShiftStage162dto0_uid232_alignedZ_uid51_fpSinPiTest_in <= leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_q(62 downto 0);
    LeftShiftStage162dto0_uid232_alignedZ_uid51_fpSinPiTest_b <= LeftShiftStage162dto0_uid232_alignedZ_uid51_fpSinPiTest_in(62 downto 0);

	--ld_LeftShiftStage162dto0_uid232_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx1_uid233_alignedZ_uid51_fpSinPiTest_b(DELAY,624)@24
    ld_LeftShiftStage162dto0_uid232_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx1_uid233_alignedZ_uid51_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 63, depth => 1 )
    PORT MAP ( xin => LeftShiftStage162dto0_uid232_alignedZ_uid51_fpSinPiTest_b, xout => ld_LeftShiftStage162dto0_uid232_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx1_uid233_alignedZ_uid51_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx1_uid233_alignedZ_uid51_fpSinPiTest(BITJOIN,232)@25
    leftShiftStage2Idx1_uid233_alignedZ_uid51_fpSinPiTest_q <= ld_LeftShiftStage162dto0_uid232_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage2Idx1_uid233_alignedZ_uid51_fpSinPiTest_b_q & leftShiftStage1Idx2Pad2_uid160_fxpX_uid40_fpSinPiTest_q;

	--reg_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_2(REG,395)@24
    reg_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_2_q <= leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest(BITSELECT,239)@23
    leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_in <= r_uid210_lzcZ_uid50_fpSinPiTest_q(2 downto 0);
    leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_b <= leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_in(2 downto 1);

	--ld_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_b_to_reg_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_1_a(DELAY,789)@23
    ld_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_b_to_reg_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_b, xout => ld_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_b_to_reg_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_1(REG,394)@24
    reg_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_1_q <= ld_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_b_to_reg_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest(MUX,240)@25
    leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_s <= reg_leftShiftStageSel2Dto1_uid240_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_1_q;
    leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest: PROCESS (leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_s, en, reg_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_2_q, leftShiftStage2Idx1_uid233_alignedZ_uid51_fpSinPiTest_q, leftShiftStage2Idx2_uid236_alignedZ_uid51_fpSinPiTest_q, leftShiftStage2Idx3_uid239_alignedZ_uid51_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_q <= reg_leftShiftStage1_uid230_alignedZ_uid51_fpSinPiTest_0_to_leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_2_q;
                  WHEN "01" => leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_q <= leftShiftStage2Idx1_uid233_alignedZ_uid51_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_q <= leftShiftStage2Idx2_uid236_alignedZ_uid51_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_q <= leftShiftStage2Idx3_uid239_alignedZ_uid51_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel0Dto0_uid245_alignedZ_uid51_fpSinPiTest(BITSELECT,244)@23
    leftShiftStageSel0Dto0_uid245_alignedZ_uid51_fpSinPiTest_in <= r_uid210_lzcZ_uid50_fpSinPiTest_q(0 downto 0);
    leftShiftStageSel0Dto0_uid245_alignedZ_uid51_fpSinPiTest_b <= leftShiftStageSel0Dto0_uid245_alignedZ_uid51_fpSinPiTest_in(0 downto 0);

	--ld_leftShiftStageSel0Dto0_uid245_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest_b(DELAY,638)@23
    ld_leftShiftStageSel0Dto0_uid245_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => leftShiftStageSel0Dto0_uid245_alignedZ_uid51_fpSinPiTest_b, xout => ld_leftShiftStageSel0Dto0_uid245_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest(MUX,245)@25
    leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest_s <= ld_leftShiftStageSel0Dto0_uid245_alignedZ_uid51_fpSinPiTest_b_to_leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest_b_q;
    leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest: PROCESS (leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest_s, en, leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_q, leftShiftStage3Idx1_uid244_alignedZ_uid51_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest_s IS
                  WHEN "0" => leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest_q <= leftShiftStage2_uid241_alignedZ_uid51_fpSinPiTest_q;
                  WHEN "1" => leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest_q <= leftShiftStage3Idx1_uid244_alignedZ_uid51_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--pHigh_uid53_fpSinPiTest(BITSELECT,52)@25
    pHigh_uid53_fpSinPiTest_in <= leftShiftStage3_uid246_alignedZ_uid51_fpSinPiTest_q;
    pHigh_uid53_fpSinPiTest_b <= pHigh_uid53_fpSinPiTest_in(64 downto 39);

	--reg_pHigh_uid53_fpSinPiTest_0_to_p_uid54_fpSinPiTest_2(REG,397)@25
    reg_pHigh_uid53_fpSinPiTest_0_to_p_uid54_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pHigh_uid53_fpSinPiTest_0_to_p_uid54_fpSinPiTest_2_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pHigh_uid53_fpSinPiTest_0_to_p_uid54_fpSinPiTest_2_q <= pHigh_uid53_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_sinXIsXRR_uid35_fpSinPiTest_2_to_p_uid54_fpSinPiTest_1(REG,396)@14
    reg_sinXIsXRR_uid35_fpSinPiTest_2_to_p_uid54_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sinXIsXRR_uid35_fpSinPiTest_2_to_p_uid54_fpSinPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sinXIsXRR_uid35_fpSinPiTest_2_to_p_uid54_fpSinPiTest_1_q <= sinXIsXRR_uid35_fpSinPiTest_n;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_p_uid54_fpSinPiTest_1_q_to_p_uid54_fpSinPiTest_b(DELAY,452)@15
    ld_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_p_uid54_fpSinPiTest_1_q_to_p_uid54_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 11 )
    PORT MAP ( xin => reg_sinXIsXRR_uid35_fpSinPiTest_2_to_p_uid54_fpSinPiTest_1_q, xout => ld_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_p_uid54_fpSinPiTest_1_q_to_p_uid54_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--p_uid54_fpSinPiTest(MUX,53)@26
    p_uid54_fpSinPiTest_s <= ld_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_p_uid54_fpSinPiTest_1_q_to_p_uid54_fpSinPiTest_b_q;
    p_uid54_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p_uid54_fpSinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE p_uid54_fpSinPiTest_s IS
                      WHEN "0" => p_uid54_fpSinPiTest_q <= reg_pHigh_uid53_fpSinPiTest_0_to_p_uid54_fpSinPiTest_2_q;
                      WHEN "1" => p_uid54_fpSinPiTest_q <= cPi_uid52_fpSinPiTest_q;
                      WHEN OTHERS => p_uid54_fpSinPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_inputreg(DELAY,835)
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => p_uid54_fpSinPiTest_q, xout => ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem(DUALMEM,836)
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_ia <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_inputreg_q;
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_aa <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdreg_q;
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_ab <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_rdmux_q;
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 26,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 26,
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
        clocken1 => ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_iq,
        address_a => ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_aa,
        data_a => ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_ia
    );
    ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_reset0 <= areset;
        ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_q <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_iq(25 downto 0);

	--mul2xSinRes_uid67_fpSinPiTest(MULT,66)@31
    mul2xSinRes_uid67_fpSinPiTest_pr <= UNSIGNED(mul2xSinRes_uid67_fpSinPiTest_a) * UNSIGNED(mul2xSinRes_uid67_fpSinPiTest_b);
    mul2xSinRes_uid67_fpSinPiTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid67_fpSinPiTest_a <= (others => '0');
            mul2xSinRes_uid67_fpSinPiTest_b <= (others => '0');
            mul2xSinRes_uid67_fpSinPiTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mul2xSinRes_uid67_fpSinPiTest_a <= ld_p_uid54_fpSinPiTest_q_to_mul2xSinRes_uid67_fpSinPiTest_a_replace_mem_q;
                mul2xSinRes_uid67_fpSinPiTest_b <= multSecondOperand_uid66_fpSinPiTest_q;
                mul2xSinRes_uid67_fpSinPiTest_s1 <= STD_LOGIC_VECTOR(mul2xSinRes_uid67_fpSinPiTest_pr);
            END IF;
        END IF;
    END PROCESS;
    mul2xSinRes_uid67_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid67_fpSinPiTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mul2xSinRes_uid67_fpSinPiTest_q <= mul2xSinRes_uid67_fpSinPiTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normBit_uid68_fpSinPiTest(BITSELECT,67)@34
    normBit_uid68_fpSinPiTest_in <= mul2xSinRes_uid67_fpSinPiTest_q;
    normBit_uid68_fpSinPiTest_b <= normBit_uid68_fpSinPiTest_in(51 downto 51);

	--join_uid73_fpSinPiTest(BITJOIN,72)@34
    join_uid73_fpSinPiTest_q <= reg_sinXIsXRR_uid35_fpSinPiTest_2_to_join_uid73_fpSinPiTest_1_q & normBit_uid68_fpSinPiTest_b;

	--cstAllZWF_uid7_fpSinPiTest(CONSTANT,6)
    cstAllZWF_uid7_fpSinPiTest_q <= "00000000000000000000000";

	--rndOp_uid74_uid75_fpSinPiTest(BITJOIN,74)@34
    rndOp_uid74_uid75_fpSinPiTest_q <= join_uid73_fpSinPiTest_q & cstAllZWF_uid7_fpSinPiTest_q & VCC_q;

	--ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_nor(LOGICAL,856)
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_nor_b <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_sticky_ena_q;
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_nor_q <= not (ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_nor_a or ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_nor_b);

	--ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_mem_top(CONSTANT,852)
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_mem_top_q <= "0110";

	--ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmp(LOGICAL,853)
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmp_a <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_mem_top_q;
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdmux_q);
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmp_q <= "1" when ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmp_a = ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmp_b else "0";

	--ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmpReg(REG,854)
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmpReg_q <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_sticky_ena(REG,857)
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_nor_q = "1") THEN
                ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_sticky_ena_q <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_enaAnd(LOGICAL,858)
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_enaAnd_a <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_sticky_ena_q;
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_enaAnd_b <= en;
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_enaAnd_q <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_enaAnd_a and ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_enaAnd_b;

	--ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_nor(LOGICAL,819)
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_nor_b <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_sticky_ena_q;
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_nor_q <= not (ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_nor_a or ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_nor_b);

	--ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_sticky_ena(REG,820)
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_nor_q = "1") THEN
                ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_sticky_ena_q <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_enaAnd(LOGICAL,821)
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_enaAnd_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_sticky_ena_q;
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_enaAnd_b <= en;
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_enaAnd_q <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_enaAnd_a and ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_enaAnd_b;

	--ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_inputreg(DELAY,809)
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expXRR_uid32_fpSinPiTest_b, xout => ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem(DUALMEM,810)
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_ia <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_inputreg_q;
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_aa <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdreg_q;
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_ab <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_rdmux_q;
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 8,
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
        clocken1 => ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_iq,
        address_a => ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_aa,
        data_a => ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_ia
    );
    ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_reset0 <= areset;
        ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_q <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_iq(7 downto 0);

	--signExtExpXRR_uid57_fpSinPiTest(BITJOIN,56)@24
    signExtExpXRR_uid57_fpSinPiTest_q <= GND_q & ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_replace_mem_q;

	--reg_r_uid210_lzcZ_uid50_fpSinPiTest_0_to_expHardCase_uid56_fpSinPiTest_1(REG,407)@23
    reg_r_uid210_lzcZ_uid50_fpSinPiTest_0_to_expHardCase_uid56_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_r_uid210_lzcZ_uid50_fpSinPiTest_0_to_expHardCase_uid56_fpSinPiTest_1_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_r_uid210_lzcZ_uid50_fpSinPiTest_0_to_expHardCase_uid56_fpSinPiTest_1_q <= r_uid210_lzcZ_uid50_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expHardCase_uid56_fpSinPiTest(SUB,55)@24
    expHardCase_uid56_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & biasM1_uid55_fpSinPiTest_q);
    expHardCase_uid56_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & reg_r_uid210_lzcZ_uid50_fpSinPiTest_0_to_expHardCase_uid56_fpSinPiTest_1_q);
            expHardCase_uid56_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expHardCase_uid56_fpSinPiTest_a) - UNSIGNED(expHardCase_uid56_fpSinPiTest_b));
    expHardCase_uid56_fpSinPiTest_q <= expHardCase_uid56_fpSinPiTest_o(8 downto 0);


	--ld_sinXIsXRR_uid35_fpSinPiTest_n_to_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_expP_uid59_fpSinPiTest_1_a(DELAY,803)@14
    ld_sinXIsXRR_uid35_fpSinPiTest_n_to_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_expP_uid59_fpSinPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 9 )
    PORT MAP ( xin => sinXIsXRR_uid35_fpSinPiTest_n, xout => ld_sinXIsXRR_uid35_fpSinPiTest_n_to_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_expP_uid59_fpSinPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_sinXIsXRR_uid35_fpSinPiTest_2_to_expP_uid59_fpSinPiTest_1(REG,408)@23
    reg_sinXIsXRR_uid35_fpSinPiTest_2_to_expP_uid59_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sinXIsXRR_uid35_fpSinPiTest_2_to_expP_uid59_fpSinPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sinXIsXRR_uid35_fpSinPiTest_2_to_expP_uid59_fpSinPiTest_1_q <= ld_sinXIsXRR_uid35_fpSinPiTest_n_to_reg_sinXIsXRR_uid35_fpSinPiTest_2_to_expP_uid59_fpSinPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--expP_uid59_fpSinPiTest(MUX,58)@24
    expP_uid59_fpSinPiTest_s <= reg_sinXIsXRR_uid35_fpSinPiTest_2_to_expP_uid59_fpSinPiTest_1_q;
    expP_uid59_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expP_uid59_fpSinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expP_uid59_fpSinPiTest_s IS
                      WHEN "0" => expP_uid59_fpSinPiTest_q <= expHardCase_uid56_fpSinPiTest_q;
                      WHEN "1" => expP_uid59_fpSinPiTest_q <= signExtExpXRR_uid57_fpSinPiTest_q;
                      WHEN OTHERS => expP_uid59_fpSinPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_inputreg(DELAY,846)
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => expP_uid59_fpSinPiTest_q, xout => ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt(COUNTER,848)
    -- every=1, low=0, high=6, step=1, init=1
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_i = 5 THEN
                      ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_eq = '1') THEN
                        ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_i <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_i - 6;
                    ELSE
                        ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_i <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_i,3));


	--ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdreg(REG,849)
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdreg_q <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdmux(MUX,850)
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdmux_s <= en;
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdmux: PROCESS (ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdmux_s, ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdreg_q, ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdmux_q <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdmux_q <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem(DUALMEM,847)
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_ia <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_inputreg_q;
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_aa <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdreg_q;
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_ab <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_rdmux_q;
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 9,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 9,
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
        clocken1 => ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_iq,
        address_a => ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_aa,
        data_a => ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_ia
    );
    ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_reset0 <= areset;
        ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_q <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_iq(8 downto 0);

	--highRes_uid69_fpSinPiTest(BITSELECT,68)@34
    highRes_uid69_fpSinPiTest_in <= mul2xSinRes_uid67_fpSinPiTest_q(50 downto 0);
    highRes_uid69_fpSinPiTest_b <= highRes_uid69_fpSinPiTest_in(50 downto 27);

	--lowRes_uid70_fpSinPiTest(BITSELECT,69)@34
    lowRes_uid70_fpSinPiTest_in <= mul2xSinRes_uid67_fpSinPiTest_q(49 downto 0);
    lowRes_uid70_fpSinPiTest_b <= lowRes_uid70_fpSinPiTest_in(49 downto 26);

	--fracRCompPreRnd_uid71_fpSinPiTest(MUX,70)@34
    fracRCompPreRnd_uid71_fpSinPiTest_s <= normBit_uid68_fpSinPiTest_b;
    fracRCompPreRnd_uid71_fpSinPiTest: PROCESS (fracRCompPreRnd_uid71_fpSinPiTest_s, en, lowRes_uid70_fpSinPiTest_b, highRes_uid69_fpSinPiTest_b)
    BEGIN
            CASE fracRCompPreRnd_uid71_fpSinPiTest_s IS
                  WHEN "0" => fracRCompPreRnd_uid71_fpSinPiTest_q <= lowRes_uid70_fpSinPiTest_b;
                  WHEN "1" => fracRCompPreRnd_uid71_fpSinPiTest_q <= highRes_uid69_fpSinPiTest_b;
                  WHEN OTHERS => fracRCompPreRnd_uid71_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest(BITJOIN,71)@34
    expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_q <= ld_expP_uid59_fpSinPiTest_q_to_expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_b_replace_mem_q & fracRCompPreRnd_uid71_fpSinPiTest_q;

	--expRCompFracRComp_uid76_fpSinPiTest(ADD,75)@34
    expRCompFracRComp_uid76_fpSinPiTest_a <= STD_LOGIC_VECTOR((34 downto 33 => expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_q(32)) & expRCompFracRCompPreRnd_uid72_uid72_fpSinPiTest_q);
    expRCompFracRComp_uid76_fpSinPiTest_b <= STD_LOGIC_VECTOR('0' & "00000000" & rndOp_uid74_uid75_fpSinPiTest_q);
            expRCompFracRComp_uid76_fpSinPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expRCompFracRComp_uid76_fpSinPiTest_a) + SIGNED(expRCompFracRComp_uid76_fpSinPiTest_b));
    expRCompFracRComp_uid76_fpSinPiTest_q <= expRCompFracRComp_uid76_fpSinPiTest_o(33 downto 0);


	--expRCompE_uid78_fpSinPiTest(BITSELECT,77)@34
    expRCompE_uid78_fpSinPiTest_in <= expRCompFracRComp_uid76_fpSinPiTest_q(32 downto 0);
    expRCompE_uid78_fpSinPiTest_b <= expRCompE_uid78_fpSinPiTest_in(32 downto 24);

	--expRComp_uid79_fpSinPiTest(BITSELECT,78)@34
    expRComp_uid79_fpSinPiTest_in <= expRCompE_uid78_fpSinPiTest_b(7 downto 0);
    expRComp_uid79_fpSinPiTest_b <= expRComp_uid79_fpSinPiTest_in(7 downto 0);

	--reg_expRComp_uid79_fpSinPiTest_0_to_expRPostExc_uid92_fpSinPiTest_2(REG,413)@34
    reg_expRComp_uid79_fpSinPiTest_0_to_expRPostExc_uid92_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRComp_uid79_fpSinPiTest_0_to_expRPostExc_uid92_fpSinPiTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRComp_uid79_fpSinPiTest_0_to_expRPostExc_uid92_fpSinPiTest_2_q <= expRComp_uid79_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expRComp_uid79_fpSinPiTest_0_to_expRPostExc_uid92_fpSinPiTest_2_q_to_expRPostExc_uid92_fpSinPiTest_c(DELAY,499)@35
    ld_reg_expRComp_uid79_fpSinPiTest_0_to_expRPostExc_uid92_fpSinPiTest_2_q_to_expRPostExc_uid92_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => reg_expRComp_uid79_fpSinPiTest_0_to_expRPostExc_uid92_fpSinPiTest_2_q, xout => ld_reg_expRComp_uid79_fpSinPiTest_0_to_expRPostExc_uid92_fpSinPiTest_2_q_to_expRPostExc_uid92_fpSinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_nor(LOGICAL,908)
    ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_nor_b <= ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_sticky_ena_q;
    ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_nor_q <= not (ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_nor_a or ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_nor_b);

	--ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_mem_top(CONSTANT,878)
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_mem_top_q <= "0100000";

	--ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmp(LOGICAL,879)
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmp_a <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_mem_top_q;
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdmux_q);
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmp_q <= "1" when ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmp_a = ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmp_b else "0";

	--ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmpReg(REG,880)
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmpReg_q <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_sticky_ena(REG,909)
    ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_nor_q = "1") THEN
                ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_sticky_ena_q <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_enaAnd(LOGICAL,910)
    ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_enaAnd_a <= ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_sticky_ena_q;
    ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_enaAnd_b <= en;
    ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_enaAnd_q <= ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_enaAnd_a and ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_enaAnd_b;

	--frac_uid13_fpSinPiTest(BITSELECT,12)@0
    frac_uid13_fpSinPiTest_in <= a(22 downto 0);
    frac_uid13_fpSinPiTest_b <= frac_uid13_fpSinPiTest_in(22 downto 0);

	--fracXIsZero_uid14_fpSinPiTest(LOGICAL,13)@0
    fracXIsZero_uid14_fpSinPiTest_a <= frac_uid13_fpSinPiTest_b;
    fracXIsZero_uid14_fpSinPiTest_b <= cstAllZWF_uid7_fpSinPiTest_q;
    fracXIsZero_uid14_fpSinPiTest_q <= "1" when fracXIsZero_uid14_fpSinPiTest_a = fracXIsZero_uid14_fpSinPiTest_b else "0";

	--expXIsMax_uid12_fpSinPiTest(LOGICAL,11)@0
    expXIsMax_uid12_fpSinPiTest_a <= exp_uid9_fpSinPiTest_b;
    expXIsMax_uid12_fpSinPiTest_b <= cstAllOWE_uid6_fpSinPiTest_q;
    expXIsMax_uid12_fpSinPiTest_q <= "1" when expXIsMax_uid12_fpSinPiTest_a = expXIsMax_uid12_fpSinPiTest_b else "0";

	--exc_I_uid15_fpSinPiTest(LOGICAL,14)@0
    exc_I_uid15_fpSinPiTest_a <= expXIsMax_uid12_fpSinPiTest_q;
    exc_I_uid15_fpSinPiTest_b <= fracXIsZero_uid14_fpSinPiTest_q;
    exc_I_uid15_fpSinPiTest_q <= exc_I_uid15_fpSinPiTest_a and exc_I_uid15_fpSinPiTest_b;

	--InvFracXIsZero_uid16_fpSinPiTest(LOGICAL,15)@0
    InvFracXIsZero_uid16_fpSinPiTest_a <= fracXIsZero_uid14_fpSinPiTest_q;
    InvFracXIsZero_uid16_fpSinPiTest_q <= not InvFracXIsZero_uid16_fpSinPiTest_a;

	--exc_N_uid17_fpSinPiTest(LOGICAL,16)@0
    exc_N_uid17_fpSinPiTest_a <= expXIsMax_uid12_fpSinPiTest_q;
    exc_N_uid17_fpSinPiTest_b <= InvFracXIsZero_uid16_fpSinPiTest_q;
    exc_N_uid17_fpSinPiTest_q <= exc_N_uid17_fpSinPiTest_a and exc_N_uid17_fpSinPiTest_b;

	--excRNaN_uid83_fpSinPiTest(LOGICAL,82)@0
    excRNaN_uid83_fpSinPiTest_a <= exc_N_uid17_fpSinPiTest_q;
    excRNaN_uid83_fpSinPiTest_b <= exc_I_uid15_fpSinPiTest_q;
    excRNaN_uid83_fpSinPiTest_q <= excRNaN_uid83_fpSinPiTest_a or excRNaN_uid83_fpSinPiTest_b;

	--ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_inputreg(DELAY,898)
    ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => excRNaN_uid83_fpSinPiTest_q, xout => ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt(COUNTER,874)
    -- every=1, low=0, high=32, step=1, init=1
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_i = 31 THEN
                      ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_eq = '1') THEN
                        ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_i <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_i - 32;
                    ELSE
                        ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_i <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_i,6));


	--ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdreg(REG,875)
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdreg_q <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdmux(MUX,876)
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdmux_s <= en;
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdmux: PROCESS (ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdmux_s, ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdreg_q, ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdmux_q <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdmux_q <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem(DUALMEM,899)
    ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_ia <= ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_inputreg_q;
    ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_aa <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdreg_q;
    ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_ab <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdmux_q;
    ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 33,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 33,
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
        clocken1 => ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_iq,
        address_a => ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_aa,
        data_a => ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_ia
    );
    ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_reset0 <= areset;
        ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_q <= ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_iq(0 downto 0);

	--reg_expRCompE_uid78_fpSinPiTest_0_to_udf_uid80_fpSinPiTest_1(REG,410)@34
    reg_expRCompE_uid78_fpSinPiTest_0_to_udf_uid80_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRCompE_uid78_fpSinPiTest_0_to_udf_uid80_fpSinPiTest_1_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRCompE_uid78_fpSinPiTest_0_to_udf_uid80_fpSinPiTest_1_q <= expRCompE_uid78_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--udf_uid80_fpSinPiTest(COMPARE,79)@35
    udf_uid80_fpSinPiTest_cin <= GND_q;
    udf_uid80_fpSinPiTest_a <= STD_LOGIC_VECTOR('0' & "000000000" & GND_q) & '0';
    udf_uid80_fpSinPiTest_b <= STD_LOGIC_VECTOR((10 downto 9 => reg_expRCompE_uid78_fpSinPiTest_0_to_udf_uid80_fpSinPiTest_1_q(8)) & reg_expRCompE_uid78_fpSinPiTest_0_to_udf_uid80_fpSinPiTest_1_q) & udf_uid80_fpSinPiTest_cin(0);
            udf_uid80_fpSinPiTest_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid80_fpSinPiTest_a) - SIGNED(udf_uid80_fpSinPiTest_b));
    udf_uid80_fpSinPiTest_n(0) <= not udf_uid80_fpSinPiTest_o(11);


	--ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_nor(LOGICAL,869)
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_nor_b <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_sticky_ena_q;
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_nor_q <= not (ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_nor_a or ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_nor_b);

	--ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_mem_top(CONSTANT,865)
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_mem_top_q <= "011111";

	--ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmp(LOGICAL,866)
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmp_a <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_mem_top_q;
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdmux_q);
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmp_q <= "1" when ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmp_a = ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmp_b else "0";

	--ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmpReg(REG,867)
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmpReg_q <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_sticky_ena(REG,870)
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_nor_q = "1") THEN
                ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_sticky_ena_q <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_enaAnd(LOGICAL,871)
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_enaAnd_a <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_sticky_ena_q;
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_enaAnd_b <= en;
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_enaAnd_q <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_enaAnd_a and ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_enaAnd_b;

	--InvExc_N_uid18_fpSinPiTest(LOGICAL,17)@0
    InvExc_N_uid18_fpSinPiTest_a <= exc_N_uid17_fpSinPiTest_q;
    InvExc_N_uid18_fpSinPiTest_q <= not InvExc_N_uid18_fpSinPiTest_a;

	--InvExc_I_uid19_fpSinPiTest(LOGICAL,18)@0
    InvExc_I_uid19_fpSinPiTest_a <= exc_I_uid15_fpSinPiTest_q;
    InvExc_I_uid19_fpSinPiTest_q <= not InvExc_I_uid19_fpSinPiTest_a;

	--expXIsZero_uid10_fpSinPiTest(LOGICAL,9)@0
    expXIsZero_uid10_fpSinPiTest_a <= exp_uid9_fpSinPiTest_b;
    expXIsZero_uid10_fpSinPiTest_b <= cstAllZWE_uid8_fpSinPiTest_q;
    expXIsZero_uid10_fpSinPiTest_q <= "1" when expXIsZero_uid10_fpSinPiTest_a = expXIsZero_uid10_fpSinPiTest_b else "0";

	--InvExpXIsZero_uid20_fpSinPiTest(LOGICAL,19)@0
    InvExpXIsZero_uid20_fpSinPiTest_a <= expXIsZero_uid10_fpSinPiTest_q;
    InvExpXIsZero_uid20_fpSinPiTest_q <= not InvExpXIsZero_uid20_fpSinPiTest_a;

	--exc_R_uid21_fpSinPiTest(LOGICAL,20)@0
    exc_R_uid21_fpSinPiTest_a <= InvExpXIsZero_uid20_fpSinPiTest_q;
    exc_R_uid21_fpSinPiTest_b <= InvExc_I_uid19_fpSinPiTest_q;
    exc_R_uid21_fpSinPiTest_c <= InvExc_N_uid18_fpSinPiTest_q;
    exc_R_uid21_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            exc_R_uid21_fpSinPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            exc_R_uid21_fpSinPiTest_q <= exc_R_uid21_fpSinPiTest_a and exc_R_uid21_fpSinPiTest_b and exc_R_uid21_fpSinPiTest_c;
        END IF;
        END IF;
    END PROCESS;



	--ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_inputreg(DELAY,859)
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_R_uid21_fpSinPiTest_q, xout => ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdcnt(COUNTER,861)
    -- every=1, low=0, high=31, step=1, init=1
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdcnt_i <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdcnt_i,5));


	--ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdreg(REG,862)
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdreg_q <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdmux(MUX,863)
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdmux_s <= en;
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdmux: PROCESS (ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdmux_s, ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdreg_q, ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdmux_q <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdmux_q <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem(DUALMEM,860)
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_ia <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_inputreg_q;
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_aa <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdreg_q;
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_ab <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_rdmux_q;
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_iq,
        address_a => ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_aa,
        data_a => ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_ia
    );
    ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_reset0 <= areset;
        ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_q <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_iq(0 downto 0);

	--xRegAndUdf_uid81_fpSinPiTest(LOGICAL,80)@35
    xRegAndUdf_uid81_fpSinPiTest_a <= ld_exc_R_uid21_fpSinPiTest_q_to_xRegAndUdf_uid81_fpSinPiTest_a_replace_mem_q;
    xRegAndUdf_uid81_fpSinPiTest_b <= udf_uid80_fpSinPiTest_n;
    xRegAndUdf_uid81_fpSinPiTest_q <= xRegAndUdf_uid81_fpSinPiTest_a and xRegAndUdf_uid81_fpSinPiTest_b;

	--ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_nor(LOGICAL,882)
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_nor_b <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_sticky_ena_q;
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_nor_q <= not (ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_nor_a or ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_nor_b);

	--ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_sticky_ena(REG,883)
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_nor_q = "1") THEN
                ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_sticky_ena_q <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_enaAnd(LOGICAL,884)
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_enaAnd_a <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_sticky_ena_q;
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_enaAnd_b <= en;
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_enaAnd_q <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_enaAnd_a and ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_enaAnd_b;

	--ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_inputreg(DELAY,872)
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid10_fpSinPiTest_q, xout => ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem(DUALMEM,873)
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_ia <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_inputreg_q;
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_aa <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdreg_q;
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_ab <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdmux_q;
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 33,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 33,
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
        clocken1 => ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_iq,
        address_a => ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_aa,
        data_a => ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_ia
    );
    ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_reset0 <= areset;
        ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_q <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_iq(0 downto 0);

	--excRZero_uid82_fpSinPiTest(LOGICAL,81)@35
    excRZero_uid82_fpSinPiTest_a <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_mem_q;
    excRZero_uid82_fpSinPiTest_b <= xRegAndUdf_uid81_fpSinPiTest_q;
    excRZero_uid82_fpSinPiTest_q <= excRZero_uid82_fpSinPiTest_a or excRZero_uid82_fpSinPiTest_b;

	--ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_nor(LOGICAL,895)
    ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_nor_b <= ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_sticky_ena_q;
    ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_nor_q <= not (ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_nor_a or ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_nor_b);

	--ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_sticky_ena(REG,896)
    ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_nor_q = "1") THEN
                ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_sticky_ena_q <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_enaAnd(LOGICAL,897)
    ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_enaAnd_a <= ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_sticky_ena_q;
    ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_enaAnd_b <= en;
    ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_enaAnd_q <= ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_enaAnd_a and ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_enaAnd_b;

	--ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_inputreg(DELAY,885)
    ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => sinXIsX_uid34_fpSinPiTest_n, xout => ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem(DUALMEM,886)
    ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_ia <= ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_inputreg_q;
    ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_aa <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdreg_q;
    ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_ab <= ld_expXIsZero_uid10_fpSinPiTest_q_to_excRZero_uid82_fpSinPiTest_a_replace_rdmux_q;
    ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 33,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 33,
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
        clocken1 => ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_iq,
        address_a => ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_aa,
        data_a => ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_ia
    );
    ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_reset0 <= areset;
        ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_q <= ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_iq(0 downto 0);

	--excSelBits_uid84_fpSinPiTest(BITJOIN,83)@35
    excSelBits_uid84_fpSinPiTest_q <= ld_excRNaN_uid83_fpSinPiTest_q_to_excSelBits_uid84_fpSinPiTest_c_replace_mem_q & excRZero_uid82_fpSinPiTest_q & ld_sinXIsX_uid34_fpSinPiTest_n_to_excSelBits_uid84_fpSinPiTest_a_replace_mem_q;

	--reg_excSelBits_uid84_fpSinPiTest_0_to_excSel_uid85_fpSinPiTest_0(REG,411)@35
    reg_excSelBits_uid84_fpSinPiTest_0_to_excSel_uid85_fpSinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excSelBits_uid84_fpSinPiTest_0_to_excSel_uid85_fpSinPiTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excSelBits_uid84_fpSinPiTest_0_to_excSel_uid85_fpSinPiTest_0_q <= excSelBits_uid84_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excSel_uid85_fpSinPiTest(LOOKUP,84)@36
    excSel_uid85_fpSinPiTest: PROCESS (reg_excSelBits_uid84_fpSinPiTest_0_to_excSel_uid85_fpSinPiTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_excSelBits_uid84_fpSinPiTest_0_to_excSel_uid85_fpSinPiTest_0_q) IS
                WHEN "000" =>  excSel_uid85_fpSinPiTest_q <= "00";
                WHEN "001" =>  excSel_uid85_fpSinPiTest_q <= "01";
                WHEN "010" =>  excSel_uid85_fpSinPiTest_q <= "10";
                WHEN "011" =>  excSel_uid85_fpSinPiTest_q <= "10";
                WHEN "100" =>  excSel_uid85_fpSinPiTest_q <= "11";
                WHEN "101" =>  excSel_uid85_fpSinPiTest_q <= "11";
                WHEN "110" =>  excSel_uid85_fpSinPiTest_q <= "00";
                WHEN "111" =>  excSel_uid85_fpSinPiTest_q <= "00";
                WHEN OTHERS =>
                    excSel_uid85_fpSinPiTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid92_fpSinPiTest(MUX,91)@36
    expRPostExc_uid92_fpSinPiTest_s <= excSel_uid85_fpSinPiTest_q;
    expRPostExc_uid92_fpSinPiTest: PROCESS (expRPostExc_uid92_fpSinPiTest_s, en, ld_reg_expRComp_uid79_fpSinPiTest_0_to_expRPostExc_uid92_fpSinPiTest_2_q_to_expRPostExc_uid92_fpSinPiTest_c_q, ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_q, cstAllZWE_uid8_fpSinPiTest_q, cstAllOWE_uid6_fpSinPiTest_q)
    BEGIN
            CASE expRPostExc_uid92_fpSinPiTest_s IS
                  WHEN "00" => expRPostExc_uid92_fpSinPiTest_q <= ld_reg_expRComp_uid79_fpSinPiTest_0_to_expRPostExc_uid92_fpSinPiTest_2_q_to_expRPostExc_uid92_fpSinPiTest_c_q;
                  WHEN "01" => expRPostExc_uid92_fpSinPiTest_q <= ld_exp_uid9_fpSinPiTest_b_to_expRPostExc_uid92_fpSinPiTest_d_replace_mem_q;
                  WHEN "10" => expRPostExc_uid92_fpSinPiTest_q <= cstAllZWE_uid8_fpSinPiTest_q;
                  WHEN "11" => expRPostExc_uid92_fpSinPiTest_q <= cstAllOWE_uid6_fpSinPiTest_q;
                  WHEN OTHERS => expRPostExc_uid92_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracNaN_uid86_fpSinPiTest(CONSTANT,85)
    fracNaN_uid86_fpSinPiTest_q <= "00000000000000000000001";

	--ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_nor(LOGICAL,921)
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_nor_a <= ld_expXRR_uid32_fpSinPiTest_b_to_signExtExpXRR_uid57_fpSinPiTest_a_notEnable_q;
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_nor_b <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_sticky_ena_q;
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_nor_q <= not (ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_nor_a or ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_nor_b);

	--ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_sticky_ena(REG,922)
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_nor_q = "1") THEN
                ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_sticky_ena_q <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_enaAnd(LOGICAL,923)
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_enaAnd_a <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_sticky_ena_q;
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_enaAnd_b <= en;
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_enaAnd_q <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_enaAnd_a and ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_enaAnd_b;

	--ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_inputreg(DELAY,911)
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => frac_uid13_fpSinPiTest_b, xout => ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem(DUALMEM,912)
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_ia <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_inputreg_q;
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_aa <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdreg_q;
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_ab <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_rdmux_q;
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 6,
        numwords_a => 34,
        width_b => 23,
        widthad_b => 6,
        numwords_b => 34,
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
        clocken1 => ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_iq,
        address_a => ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_aa,
        data_a => ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_ia
    );
    ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_reset0 <= areset;
        ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_q <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_iq(22 downto 0);

	--fracRComp_uid77_fpSinPiTest(BITSELECT,76)@34
    fracRComp_uid77_fpSinPiTest_in <= expRCompFracRComp_uid76_fpSinPiTest_q(23 downto 0);
    fracRComp_uid77_fpSinPiTest_b <= fracRComp_uid77_fpSinPiTest_in(23 downto 1);

	--reg_fracRComp_uid77_fpSinPiTest_0_to_fracRPostExc_uid88_fpSinPiTest_2(REG,412)@34
    reg_fracRComp_uid77_fpSinPiTest_0_to_fracRPostExc_uid88_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRComp_uid77_fpSinPiTest_0_to_fracRPostExc_uid88_fpSinPiTest_2_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRComp_uid77_fpSinPiTest_0_to_fracRPostExc_uid88_fpSinPiTest_2_q <= fracRComp_uid77_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracRComp_uid77_fpSinPiTest_0_to_fracRPostExc_uid88_fpSinPiTest_2_q_to_fracRPostExc_uid88_fpSinPiTest_c(DELAY,496)@35
    ld_reg_fracRComp_uid77_fpSinPiTest_0_to_fracRPostExc_uid88_fpSinPiTest_2_q_to_fracRPostExc_uid88_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => reg_fracRComp_uid77_fpSinPiTest_0_to_fracRPostExc_uid88_fpSinPiTest_2_q, xout => ld_reg_fracRComp_uid77_fpSinPiTest_0_to_fracRPostExc_uid88_fpSinPiTest_2_q_to_fracRPostExc_uid88_fpSinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid88_fpSinPiTest(MUX,87)@36
    fracRPostExc_uid88_fpSinPiTest_s <= excSel_uid85_fpSinPiTest_q;
    fracRPostExc_uid88_fpSinPiTest: PROCESS (fracRPostExc_uid88_fpSinPiTest_s, en, ld_reg_fracRComp_uid77_fpSinPiTest_0_to_fracRPostExc_uid88_fpSinPiTest_2_q_to_fracRPostExc_uid88_fpSinPiTest_c_q, ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_q, cstAllZWF_uid7_fpSinPiTest_q, fracNaN_uid86_fpSinPiTest_q)
    BEGIN
            CASE fracRPostExc_uid88_fpSinPiTest_s IS
                  WHEN "00" => fracRPostExc_uid88_fpSinPiTest_q <= ld_reg_fracRComp_uid77_fpSinPiTest_0_to_fracRPostExc_uid88_fpSinPiTest_2_q_to_fracRPostExc_uid88_fpSinPiTest_c_q;
                  WHEN "01" => fracRPostExc_uid88_fpSinPiTest_q <= ld_frac_uid13_fpSinPiTest_b_to_fracRPostExc_uid88_fpSinPiTest_d_replace_mem_q;
                  WHEN "10" => fracRPostExc_uid88_fpSinPiTest_q <= cstAllZWF_uid7_fpSinPiTest_q;
                  WHEN "11" => fracRPostExc_uid88_fpSinPiTest_q <= fracNaN_uid86_fpSinPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid88_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sinXR_uid97_fpSinPiTest(BITJOIN,96)@36
    sinXR_uid97_fpSinPiTest_q <= ld_signR_uid96_fpSinPiTest_q_to_sinXR_uid97_fpSinPiTest_c_q & expRPostExc_uid92_fpSinPiTest_q & fracRPostExc_uid88_fpSinPiTest_q;

	--xOut(GPOUT,4)@36
    q <= sinXR_uid97_fpSinPiTest_q;


end normal;
