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

-- VHDL created from fp_cos_s5
-- VHDL created on Tue Mar 12 15:57:58 2013


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

entity fp_cos_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_cos_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid6_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid7_fpCosPiTest_q : std_logic_vector (22 downto 0);
    signal cstBias_uid22_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMwShift_uid23_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMwShiftM2_uid24_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal cstZwShiftP1_uid25_fpCosPiTest_q : std_logic_vector (13 downto 0);
    signal cstAllZwE_uid28_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal cstNaNwF_uid30_fpCosPiTest_q : std_logic_vector (22 downto 0);
    signal cstZmwFRRPwSM1_uid46_fpCosPiTest_q : std_logic_vector (61 downto 0);
    signal biasM1_uid60_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal mul2xSinRes_uid68_fpCosPiTest_a : std_logic_vector (25 downto 0);
    signal mul2xSinRes_uid68_fpCosPiTest_b : std_logic_vector (25 downto 0);
    signal mul2xSinRes_uid68_fpCosPiTest_s1 : std_logic_vector (51 downto 0);
    signal mul2xSinRes_uid68_fpCosPiTest_pr : UNSIGNED (51 downto 0);
    signal mul2xSinRes_uid68_fpCosPiTest_q : std_logic_vector (51 downto 0);
    signal InvCosXIsOneXRR_uid79_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvCosXIsOneXRR_uid79_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal expSelector_uid88_fpCosPiTest_q : std_logic_vector(1 downto 0);
    signal InvCosXOne_uid92_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvCosXOne_uid92_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal signRCond2_uid95_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal signRCond2_uid95_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal signRCond2_uid95_fpCosPiTest_c : std_logic_vector(0 downto 0);
    signal signRCond2_uid95_fpCosPiTest_d : std_logic_vector(0 downto 0);
    signal signRCond2_uid95_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal signRCond1_uid100_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal signRCond1_uid100_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal signRCond1_uid100_fpCosPiTest_c : std_logic_vector(0 downto 0);
    signal signRCond1_uid100_fpCosPiTest_d : std_logic_vector(0 downto 0);
    signal signRCond1_uid100_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid102_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid102_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid103_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid103_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal xBranch_uid132_rrx_uid32_fpCosPiTest_a : std_logic_vector(10 downto 0);
    signal xBranch_uid132_rrx_uid32_fpCosPiTest_b : std_logic_vector(10 downto 0);
    signal xBranch_uid132_rrx_uid32_fpCosPiTest_o : std_logic_vector (10 downto 0);
    signal xBranch_uid132_rrx_uid32_fpCosPiTest_cin : std_logic_vector (0 downto 0);
    signal xBranch_uid132_rrx_uid32_fpCosPiTest_n : std_logic_vector (0 downto 0);
    signal ZerosGB_uid147_rrx_uid32_fpCosPiTest_q : std_logic_vector (26 downto 0);
    signal leftShiftStage0Idx1Pad4_uid154_fxpX_uid42_fpCosPiTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage0Idx3Pad12_uid160_fxpX_uid42_fpCosPiTest_q : std_logic_vector (11 downto 0);
    signal leftShiftStage1Idx2Pad2_uid168_fxpX_uid42_fpCosPiTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1Idx3Pad3_uid171_fxpX_uid42_fpCosPiTest_q : std_logic_vector (2 downto 0);
    signal zs_uid177_lzcZ_uid57_fpCosPiTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid179_lzcZ_uid57_fpCosPiTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid179_lzcZ_uid57_fpCosPiTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid179_lzcZ_uid57_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal mO_uid180_lzcZ_uid57_fpCosPiTest_q : std_logic_vector (1 downto 0);
    signal zs_uid185_lzcZ_uid57_fpCosPiTest_q : std_logic_vector (15 downto 0);
    signal vCount_uid199_lzcZ_uid57_fpCosPiTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid199_lzcZ_uid57_fpCosPiTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid199_lzcZ_uid57_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx3Pad48_uid221_alignedZ_uid58_fpCosPiTest_q : std_logic_vector (47 downto 0);
    signal vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid290_zCount_uid142_rrx_uid32_fpCosPiTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid290_zCount_uid142_rrx_uid32_fpCosPiTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid290_zCount_uid142_rrx_uid32_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx3Pad24_uid306_normMult_uid143_rrx_uid32_fpCosPiTest_q : std_logic_vector (23 downto 0);
    signal leftShiftStage1Idx3Pad6_uid317_normMult_uid143_rrx_uid32_fpCosPiTest_q : std_logic_vector (5 downto 0);
    signal prodXY_uid328_pT1_uid256_sinPiZPolyEval_a : std_logic_vector (12 downto 0);
    signal prodXY_uid328_pT1_uid256_sinPiZPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXY_uid328_pT1_uid256_sinPiZPolyEval_s1 : std_logic_vector (25 downto 0);
    signal prodXY_uid328_pT1_uid256_sinPiZPolyEval_pr : SIGNED (26 downto 0);
    signal prodXY_uid328_pT1_uid256_sinPiZPolyEval_q : std_logic_vector (25 downto 0);
    signal prodXY_uid331_pT2_uid262_sinPiZPolyEval_a : std_logic_vector (17 downto 0);
    signal prodXY_uid331_pT2_uid262_sinPiZPolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid331_pT2_uid262_sinPiZPolyEval_s1 : std_logic_vector (40 downto 0);
    signal prodXY_uid331_pT2_uid262_sinPiZPolyEval_pr : SIGNED (41 downto 0);
    signal prodXY_uid331_pT2_uid262_sinPiZPolyEval_q : std_logic_vector (40 downto 0);
    signal rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_reset0 : std_logic;
    signal rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_ia : std_logic_vector (39 downto 0);
    signal rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_aa : std_logic_vector (7 downto 0);
    signal rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_ab : std_logic_vector (7 downto 0);
    signal rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_iq : std_logic_vector (39 downto 0);
    signal rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_q : std_logic_vector (39 downto 0);
    signal rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_reset0 : std_logic;
    signal rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_ia : std_logic_vector (37 downto 0);
    signal rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_aa : std_logic_vector (7 downto 0);
    signal rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_ab : std_logic_vector (7 downto 0);
    signal rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_iq : std_logic_vector (37 downto 0);
    signal rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_q : std_logic_vector (37 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_a : std_logic_vector (26 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_b : std_logic_vector (26 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_s1 : std_logic_vector (53 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_pr : UNSIGNED (53 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_q : std_logic_vector (53 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_a : std_logic_vector (26 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_b : std_logic_vector (26 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_s1 : std_logic_vector (53 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_pr : UNSIGNED (53 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_q : std_logic_vector (53 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_a : std_logic_vector (26 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_b : std_logic_vector (26 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_s1 : std_logic_vector (53 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_pr : UNSIGNED (53 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_q : std_logic_vector (53 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0_a : std_logic_vector(81 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0_b : std_logic_vector(81 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0_o : std_logic_vector (81 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0_q : std_logic_vector (81 downto 0);
    signal memoryC0_uid249_sinPiZTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC0_uid249_sinPiZTableGenerator_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid249_sinPiZTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid249_sinPiZTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid249_sinPiZTableGenerator_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid249_sinPiZTableGenerator_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid251_sinPiZTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC1_uid251_sinPiZTableGenerator_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid251_sinPiZTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid251_sinPiZTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid251_sinPiZTableGenerator_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid251_sinPiZTableGenerator_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid253_sinPiZTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC2_uid253_sinPiZTableGenerator_lutmem_ia : std_logic_vector (12 downto 0);
    signal memoryC2_uid253_sinPiZTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid253_sinPiZTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid253_sinPiZTableGenerator_lutmem_iq : std_logic_vector (12 downto 0);
    signal memoryC2_uid253_sinPiZTableGenerator_lutmem_q : std_logic_vector (12 downto 0);
    signal reg_expXTableAddr_uid134_rrx_uid32_fpCosPiTest_0_to_rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_0_to_os_uid137_rrx_uid32_fpCosPiTest_0_q : std_logic_vector (39 downto 0);
    signal reg_rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_0_to_os_uid137_rrx_uid32_fpCosPiTest_1_q : std_logic_vector (37 downto 0);
    signal reg_prod_uid139_rrx_uid32_fpCosPiTest_a_0_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_prod_uid139_rrx_uid32_fpCosPiTest_b_0_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_1_q : std_logic_vector (26 downto 0);
    signal reg_prod_uid139_rrx_uid32_fpCosPiTest_a_1_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_prod_uid139_rrx_uid32_fpCosPiTest_a_2_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_1_q : std_logic_vector (15 downto 0);
    signal reg_cStage_uid273_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_3_q : std_logic_vector (15 downto 0);
    signal reg_rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_2_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid279_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_2_q : std_logic_vector (1 downto 0);
    signal reg_vStage_uid291_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_3_q : std_logic_vector (1 downto 0);
    signal reg_vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_4_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel2Dto1_uid320_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_2_q : std_logic_vector (75 downto 0);
    signal reg_leftShiftStage1Idx1_uid313_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_3_q : std_logic_vector (75 downto 0);
    signal reg_leftShiftStage1Idx2_uid316_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_4_q : std_logic_vector (75 downto 0);
    signal reg_leftShiftStage1Idx3_uid319_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_5_q : std_logic_vector (75 downto 0);
    signal reg_fracCompOut_uid144_rrx_uid32_fpCosPiTest_0_to_finalFrac_uid149_rrx_uid32_fpCosPiTest_2_q : std_logic_vector (49 downto 0);
    signal reg_expCompOut_uid146_rrx_uid32_fpCosPiTest_0_to_finalExp_uid150_rrx_uid32_fpCosPiTest_2_q : std_logic_vector (7 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid163_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_2_q : std_logic_vector (64 downto 0);
    signal reg_y_uid44_fpCosPiTest_0_to_yIsHalf_uid48_fpCosPiTest_1_q : std_logic_vector (62 downto 0);
    signal reg_yHalfCosNotOne_uid81_fpCosPiTest_0_to_excZOrCosOne_uid83_fpCosPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_cosXIsOne_uid36_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_3_q : std_logic_vector (0 downto 0);
    signal reg_excRNaN_uid82_fpCosPiTest_0_to_join_uid84_fpCosPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_pad_one_uid49_fpCosPiTest_0_to_oneMinusY_uid49_fpCosPiTest_0_q : std_logic_vector (63 downto 0);
    signal reg_oneMinusY_uid49_fpCosPiTest_0_to_cmpYToOneMinusY_uid51_fpCosPiTest_0_q : std_logic_vector (64 downto 0);
    signal reg_InvCmpYToOneMinusY_uid52_fpCosPiTest_0_to_z_uid55_fpCosPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_yBottom_uid54_fpCosPiTest_0_to_z_uid55_fpCosPiTest_2_q : std_logic_vector (61 downto 0);
    signal reg_oMyBottom_uid53_fpCosPiTest_0_to_z_uid55_fpCosPiTest_3_q : std_logic_vector (61 downto 0);
    signal reg_rVStage_uid192_lzcZ_uid57_fpCosPiTest_0_to_vCount_uid193_lzcZ_uid57_fpCosPiTest_1_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid194_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid196_lzcZ_uid57_fpCosPiTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid198_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid202_lzcZ_uid57_fpCosPiTest_2_q : std_logic_vector (3 downto 0);
    signal reg_vStage_uid200_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid202_lzcZ_uid57_fpCosPiTest_3_q : std_logic_vector (3 downto 0);
    signal reg_vCount_uid187_lzcZ_uid57_fpCosPiTest_0_to_r_uid212_lzcZ_uid57_fpCosPiTest_4_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel5Dto4_uid224_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_2_q : std_logic_vector (61 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_2_q : std_logic_vector (61 downto 0);
    signal reg_zAddr_uid64_fpCosPiTest_0_to_memoryC2_uid253_sinPiZTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0_q : std_logic_vector (12 downto 0);
    signal reg_memoryC2_uid253_sinPiZTableGenerator_lutmem_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_1_q : std_logic_vector (12 downto 0);
    signal reg_memoryC1_uid251_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid259_sinPiZPolyEval_0_q : std_logic_vector (20 downto 0);
    signal reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q : std_logic_vector (17 downto 0);
    signal reg_s1_uid257_uid260_sinPiZPolyEval_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid265_sinPiZPolyEval_0_q : std_logic_vector (29 downto 0);
    signal reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_q : std_logic_vector (25 downto 0);
    signal reg_fxpSinRes_uid67_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_1_q : std_logic_vector (25 downto 0);
    signal reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q : std_logic_vector (5 downto 0);
    signal reg_expP_uid62_fpCosPiTest_0_to_expRCompFracRCompPreRnd_uid73_uid73_fpCosPiTest_1_q : std_logic_vector (7 downto 0);
    signal reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_fracRComp_uid77_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_2_q : std_logic_vector (22 downto 0);
    signal reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_join_uid86_fpCosPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_expSelBits_uid87_fpCosPiTest_0_to_expSelector_uid88_fpCosPiTest_0_q : std_logic_vector (3 downto 0);
    signal reg_expRComp_uid78_fpCosPiTest_0_to_expRPostExc_uid90_fpCosPiTest_2_q : std_logic_vector (7 downto 0);
    signal ld_fracXRR_uid35_fpCosPiTest_b_to_oFracXRR_uid38_uid38_fpCosPiTest_a_q : std_logic_vector (49 downto 0);
    signal ld_y_uid44_fpCosPiTest_b_to_cmpYToOneMinusY_uid51_fpCosPiTest_b_q : std_logic_vector (62 downto 0);
    signal ld_reg_yBottom_uid54_fpCosPiTest_0_to_z_uid55_fpCosPiTest_2_q_to_z_uid55_fpCosPiTest_c_q : std_logic_vector (61 downto 0);
    signal ld_reg_oMyBottom_uid53_fpCosPiTest_0_to_z_uid55_fpCosPiTest_3_q_to_z_uid55_fpCosPiTest_d_q : std_logic_vector (61 downto 0);
    signal ld_cosXIsOneXRR_uid37_fpCosPiTest_n_to_InvCosXIsOneXRR_uid79_fpCosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_InvCosXIsOne_uid80_fpCosPiTest_q_to_yHalfCosNotOne_uid81_fpCosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_3_q_to_excZOrCosOne_uid83_fpCosPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid82_fpCosPiTest_q_to_join_uid86_fpCosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_cosXIsOne_uid36_fpCosPiTest_n_to_expSelBits_uid87_fpCosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_cosXIsOne_uid36_fpCosPiTest_n_to_cosXOne_uid91_fpCosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_cosXOne_uid91_fpCosPiTest_q_to_InvCosXOne_uid92_fpCosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_yIsZero_uid45_fpCosPiTest_q_to_InvYIsZero_uid94_fpCosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_intXParity_uid43_fpCosPiTest_b_to_signRCond2_uid95_fpCosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid15_fpCosPiTest_q_to_InvExc_I_uid102_fpCosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_InvExc_N_uid103_fpCosPiTest_q_to_signRNotNaNOrInf_uid104_fpCosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signRNotNaNOrInf_uid104_fpCosPiTest_q_to_cosXR_uid105_fpCosPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_xBranch_uid132_rrx_uid32_fpCosPiTest_n_to_finalFrac_uid149_rrx_uid32_fpCosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_xBranch_uid132_rrx_uid32_fpCosPiTest_n_to_finalExp_uid150_rrx_uid32_fpCosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_finalExp_uid150_rrx_uid32_fpCosPiTest_q_to_RRangeRed_uid151_rrx_uid32_fpCosPiTest_b_q : std_logic_vector (7 downto 0);
    signal ld_LeftShiftStage063dto0_uid166_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx1_uid167_fxpX_uid42_fpCosPiTest_b_q : std_logic_vector (63 downto 0);
    signal ld_LeftShiftStage062dto0_uid169_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx2_uid170_fxpX_uid42_fpCosPiTest_b_q : std_logic_vector (62 downto 0);
    signal ld_LeftShiftStage061dto0_uid172_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx3_uid173_fxpX_uid42_fpCosPiTest_b_q : std_logic_vector (61 downto 0);
    signal ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_cStage_uid182_lzcZ_uid57_fpCosPiTest_b_q : std_logic_vector (29 downto 0);
    signal ld_rVStage_uid178_lzcZ_uid57_fpCosPiTest_b_to_vStagei_uid184_lzcZ_uid57_fpCosPiTest_c_q : std_logic_vector (31 downto 0);
    signal ld_vCount_uid193_lzcZ_uid57_fpCosPiTest_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_d_q : std_logic_vector (0 downto 0);
    signal ld_reg_vCount_uid187_lzcZ_uid57_fpCosPiTest_0_to_r_uid212_lzcZ_uid57_fpCosPiTest_4_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid179_lzcZ_uid57_fpCosPiTest_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_f_q : std_logic_vector (0 downto 0);
    signal ld_LeftShiftStage057dto0_uid227_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx1_uid228_alignedZ_uid58_fpCosPiTest_b_q : std_logic_vector (57 downto 0);
    signal ld_LeftShiftStage053dto0_uid230_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx2_uid231_alignedZ_uid58_fpCosPiTest_b_q : std_logic_vector (53 downto 0);
    signal ld_LeftShiftStage049dto0_uid233_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx3_uid234_alignedZ_uid58_fpCosPiTest_b_q : std_logic_vector (49 downto 0);
    signal ld_LeftShiftStage160dto0_uid238_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx1_uid239_alignedZ_uid58_fpCosPiTest_b_q : std_logic_vector (60 downto 0);
    signal ld_LeftShiftStage159dto0_uid241_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx2_uid242_alignedZ_uid58_fpCosPiTest_b_q : std_logic_vector (59 downto 0);
    signal ld_LeftShiftStage158dto0_uid244_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx3_uid245_alignedZ_uid58_fpCosPiTest_b_q : std_logic_vector (58 downto 0);
    signal ld_vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_q_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_d_q : std_logic_vector (0 downto 0);
    signal ld_X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest_b_q : std_logic_vector (67 downto 0);
    signal ld_X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest_b_q : std_logic_vector (59 downto 0);
    signal ld_X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest_b_q : std_logic_vector (51 downto 0);
    signal ld_multFracBits_uid140_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_c_q : std_logic_vector (75 downto 0);
    signal ld_leftShiftStageSel0Dto0_uid325_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0_q_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_a_q : std_logic_vector (12 downto 0);
    signal ld_prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_q_to_prod_uid139_rrx_uid32_fpCosPiTest_align_2_a_q : std_logic_vector (53 downto 0);
    signal ld_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC1_uid251_sinPiZTableGenerator_lutmem_0_q_to_memoryC1_uid251_sinPiZTableGenerator_lutmem_a_q : std_logic_vector (7 downto 0);
    signal ld_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_q_to_reg_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_4_a_q : std_logic_vector (0 downto 0);
    signal ld_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_b_to_reg_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_b_to_reg_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_b_to_reg_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_inputreg_q : std_logic_vector (5 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_ia : std_logic_vector (5 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_iq : std_logic_vector (5 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_q : std_logic_vector (5 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_sticky_ena_q : signal is true;
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_inputreg_q : std_logic_vector (1 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_q : std_logic_vector (1 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_sticky_ena_q : signal is true;
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_inputreg_q : std_logic_vector (31 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_sticky_ena_q : signal is true;
    signal ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_sticky_ena_q : signal is true;
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_reset0 : std_logic;
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_eq : std_logic;
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_sticky_ena_q : signal is true;
    signal ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_inputreg_q : std_logic_vector (45 downto 0);
    signal ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_ia : std_logic_vector (45 downto 0);
    signal ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_iq : std_logic_vector (45 downto 0);
    signal ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_q : std_logic_vector (45 downto 0);
    signal ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q : signal is true;
    signal ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_ia : std_logic_vector (29 downto 0);
    signal ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_iq : std_logic_vector (29 downto 0);
    signal ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_q : std_logic_vector (29 downto 0);
    signal ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q : signal is true;
    signal ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_inputreg_q : std_logic_vector (13 downto 0);
    signal ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_ia : std_logic_vector (13 downto 0);
    signal ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_iq : std_logic_vector (13 downto 0);
    signal ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_q : std_logic_vector (13 downto 0);
    signal ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q : signal is true;
    signal ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_inputreg_q : std_logic_vector (61 downto 0);
    signal ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_reset0 : std_logic;
    signal ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_ia : std_logic_vector (61 downto 0);
    signal ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_iq : std_logic_vector (61 downto 0);
    signal ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_q : std_logic_vector (61 downto 0);
    signal ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_sticky_ena_q : signal is true;
    signal ld_X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg_q : std_logic_vector (67 downto 0);
    signal ld_X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg_q : std_logic_vector (59 downto 0);
    signal ld_X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg_q : std_logic_vector (51 downto 0);
    signal ld_multFracBits_uid140_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_c_inputreg_q : std_logic_vector (75 downto 0);
    signal ld_reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0_q_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_a_inputreg_q : std_logic_vector (12 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_inputreg_q : std_logic_vector (17 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_ia : std_logic_vector (17 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_iq : std_logic_vector (17 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_q : std_logic_vector (17 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_sticky_ena_q : signal is true;
    signal ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_reset0 : std_logic;
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_ia : std_logic_vector (25 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_iq : std_logic_vector (25 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_q : std_logic_vector (25 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_eq : std_logic;
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_sticky_ena_q : signal is true;
    signal ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_inputreg_q : std_logic_vector (1 downto 0);
    signal ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_reset0 : std_logic;
    signal ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_q : std_logic_vector (1 downto 0);
    signal ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_sticky_ena_q : signal is true;
    signal yIsZero_uid45_fpCosPiTest_a : std_logic_vector(62 downto 0);
    signal yIsZero_uid45_fpCosPiTest_b : std_logic_vector(62 downto 0);
    signal yIsZero_uid45_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal pad_one_uid49_fpCosPiTest_q : std_logic_vector (63 downto 0);
    signal cmpYToOneMinusY_uid51_fpCosPiTest_a : std_logic_vector(67 downto 0);
    signal cmpYToOneMinusY_uid51_fpCosPiTest_b : std_logic_vector(67 downto 0);
    signal cmpYToOneMinusY_uid51_fpCosPiTest_o : std_logic_vector (67 downto 0);
    signal cmpYToOneMinusY_uid51_fpCosPiTest_cin : std_logic_vector (0 downto 0);
    signal cmpYToOneMinusY_uid51_fpCosPiTest_c : std_logic_vector (0 downto 0);
    signal leftShiftStage1Idx1_uid167_fxpX_uid42_fpCosPiTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage2Idx1_uid239_alignedZ_uid58_fpCosPiTest_q : std_logic_vector (61 downto 0);
    signal InvCmpYToOneMinusY_uid52_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvCmpYToOneMinusY_uid52_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal InvYIsZero_uid94_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvYIsZero_uid94_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal InvIntXParity_uid98_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvIntXParity_uid98_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal oFracXRR_uid38_uid38_fpCosPiTest_q : std_logic_vector (50 downto 0);
    signal half_uid47_fpCosPiTest_q : std_logic_vector (62 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal exp_uid11_fpCosPiTest_in : std_logic_vector (30 downto 0);
    signal exp_uid11_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal frac_uid13_fpCosPiTest_in : std_logic_vector (22 downto 0);
    signal frac_uid13_fpCosPiTest_b : std_logic_vector (22 downto 0);
    signal expFracX_uid107_px_uid31_fpCosPiTest_in : std_logic_vector (30 downto 0);
    signal expFracX_uid107_px_uid31_fpCosPiTest_b : std_logic_vector (30 downto 0);
    signal expXIsMax_uid12_fpCosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid12_fpCosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid12_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid14_fpCosPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid14_fpCosPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid14_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal cosXIsOne_uid36_fpCosPiTest_a : std_logic_vector(10 downto 0);
    signal cosXIsOne_uid36_fpCosPiTest_b : std_logic_vector(10 downto 0);
    signal cosXIsOne_uid36_fpCosPiTest_o : std_logic_vector (10 downto 0);
    signal cosXIsOne_uid36_fpCosPiTest_cin : std_logic_vector (0 downto 0);
    signal cosXIsOne_uid36_fpCosPiTest_n : std_logic_vector (0 downto 0);
    signal yIsHalf_uid48_fpCosPiTest_a : std_logic_vector(62 downto 0);
    signal yIsHalf_uid48_fpCosPiTest_b : std_logic_vector(62 downto 0);
    signal yIsHalf_uid48_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal oneMinusY_uid49_fpCosPiTest_a : std_logic_vector(64 downto 0);
    signal oneMinusY_uid49_fpCosPiTest_b : std_logic_vector(64 downto 0);
    signal oneMinusY_uid49_fpCosPiTest_o : std_logic_vector (64 downto 0);
    signal oneMinusY_uid49_fpCosPiTest_q : std_logic_vector (64 downto 0);
    signal z_uid55_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal z_uid55_fpCosPiTest_q : std_logic_vector (61 downto 0);
    signal expHardCase_uid61_fpCosPiTest_a : std_logic_vector(8 downto 0);
    signal expHardCase_uid61_fpCosPiTest_b : std_logic_vector(8 downto 0);
    signal expHardCase_uid61_fpCosPiTest_o : std_logic_vector (8 downto 0);
    signal expHardCase_uid61_fpCosPiTest_q : std_logic_vector (8 downto 0);
    signal yHalfCosNotOne_uid81_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal yHalfCosNotOne_uid81_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal yHalfCosNotOne_uid81_fpCosPiTest_c : std_logic_vector(0 downto 0);
    signal yHalfCosNotOne_uid81_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal excZOrCosOne_uid83_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal excZOrCosOne_uid83_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal excZOrCosOne_uid83_fpCosPiTest_c : std_logic_vector(0 downto 0);
    signal excZOrCosOne_uid83_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExc_uid85_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid85_fpCosPiTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid90_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid90_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal signR_uid101_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal signR_uid101_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal signR_uid101_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal signRNotNaNOrInf_uid104_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal signRNotNaNOrInf_uid104_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal signRNotNaNOrInf_uid104_fpCosPiTest_c : std_logic_vector(0 downto 0);
    signal signRNotNaNOrInf_uid104_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal finalExp_uid150_rrx_uid32_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal finalExp_uid150_rrx_uid32_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal vCount_uid193_lzcZ_uid57_fpCosPiTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid193_lzcZ_uid57_fpCosPiTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid193_lzcZ_uid57_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid196_lzcZ_uid57_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid196_lzcZ_uid57_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid202_lzcZ_uid57_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid202_lzcZ_uid57_fpCosPiTest_q : std_logic_vector (3 downto 0);
    signal vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_q : std_logic_vector (15 downto 0);
    signal vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_q : std_logic_vector (75 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal extendedFracX_uid41_fpCosPiTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx2_uid231_alignedZ_uid58_fpCosPiTest_q : std_logic_vector (61 downto 0);
    signal leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest_q : std_logic_vector (75 downto 0);
    signal normBit_uid69_fpCosPiTest_in : std_logic_vector (51 downto 0);
    signal normBit_uid69_fpCosPiTest_b : std_logic_vector (0 downto 0);
    signal highRes_uid70_fpCosPiTest_in : std_logic_vector (50 downto 0);
    signal highRes_uid70_fpCosPiTest_b : std_logic_vector (23 downto 0);
    signal lowRes_uid71_fpCosPiTest_in : std_logic_vector (49 downto 0);
    signal lowRes_uid71_fpCosPiTest_b : std_logic_vector (23 downto 0);
    signal fracXRExt_uid148_rrx_uid32_fpCosPiTest_q : std_logic_vector (49 downto 0);
    signal leftShiftStage1Idx1_uid228_alignedZ_uid58_fpCosPiTest_q : std_logic_vector (61 downto 0);
    signal leftShiftStage1Idx3_uid234_alignedZ_uid58_fpCosPiTest_q : std_logic_vector (61 downto 0);
    signal leftShiftStage1Idx2_uid170_fxpX_uid42_fpCosPiTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage2Idx2_uid242_alignedZ_uid58_fpCosPiTest_q : std_logic_vector (61 downto 0);
    signal leftShiftStage1Idx3_uid173_fxpX_uid42_fpCosPiTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage2Idx3_uid245_alignedZ_uid58_fpCosPiTest_q : std_logic_vector (61 downto 0);
    signal leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_q : std_logic_vector (61 downto 0);
    signal cStage_uid182_lzcZ_uid57_fpCosPiTest_q : std_logic_vector (31 downto 0);
    signal leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_q : std_logic_vector (61 downto 0);
    signal leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_q : std_logic_vector (61 downto 0);
    signal leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest_q : std_logic_vector (75 downto 0);
    signal prodXYTruncFR_uid329_pT1_uid256_sinPiZPolyEval_in : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid329_pT1_uid256_sinPiZPolyEval_b : std_logic_vector (13 downto 0);
    signal prodXYTruncFR_uid332_pT2_uid262_sinPiZPolyEval_in : std_logic_vector (40 downto 0);
    signal prodXYTruncFR_uid332_pT2_uid262_sinPiZPolyEval_b : std_logic_vector (23 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_align_0_q_int : std_logic_vector (53 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_align_0_q : std_logic_vector (53 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_align_1_q_int : std_logic_vector (80 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_align_1_q : std_logic_vector (80 downto 0);
    signal os_uid137_rrx_uid32_fpCosPiTest_q : std_logic_vector (77 downto 0);
    signal finalFrac_uid149_rrx_uid32_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal finalFrac_uid149_rrx_uid32_fpCosPiTest_q : std_logic_vector (49 downto 0);
    signal leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_q : std_logic_vector (64 downto 0);
    signal join_uid84_fpCosPiTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_q : std_logic_vector (61 downto 0);
    signal leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_q : std_logic_vector (61 downto 0);
    signal leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_q : std_logic_vector (61 downto 0);
    signal join_uid86_fpCosPiTest_q : std_logic_vector (2 downto 0);
    signal expSelBits_uid87_fpCosPiTest_q : std_logic_vector (3 downto 0);
    signal cosXR_uid105_fpCosPiTest_q : std_logic_vector (31 downto 0);
    signal RRangeRed_uid151_rrx_uid32_fpCosPiTest_q : std_logic_vector (58 downto 0);
    signal vStagei_uid184_lzcZ_uid57_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid184_lzcZ_uid57_fpCosPiTest_q : std_logic_vector (31 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_align_2_q_int : std_logic_vector (107 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_align_2_q : std_logic_vector (107 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal fracX_uid128_rrx_uid32_fpCosPiTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid128_rrx_uid32_fpCosPiTest_b : std_logic_vector (22 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmp_a : std_logic_vector(2 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmp_b : std_logic_vector(2 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_nor_q : std_logic_vector(0 downto 0);
    signal R_uid108_px_uid31_fpCosPiTest_q : std_logic_vector (31 downto 0);
    signal InvFracXIsZero_uid16_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid16_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal InvCosXIsOne_uid80_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvCosXIsOne_uid80_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal oMyBottom_uid53_fpCosPiTest_in : std_logic_vector (61 downto 0);
    signal oMyBottom_uid53_fpCosPiTest_b : std_logic_vector (61 downto 0);
    signal zAddr_uid64_fpCosPiTest_in : std_logic_vector (61 downto 0);
    signal zAddr_uid64_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal zPPolyEval_uid65_fpCosPiTest_in : std_logic_vector (53 downto 0);
    signal zPPolyEval_uid65_fpCosPiTest_b : std_logic_vector (17 downto 0);
    signal rVStage_uid178_lzcZ_uid57_fpCosPiTest_in : std_logic_vector (61 downto 0);
    signal rVStage_uid178_lzcZ_uid57_fpCosPiTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid181_lzcZ_uid57_fpCosPiTest_in : std_logic_vector (29 downto 0);
    signal vStage_uid181_lzcZ_uid57_fpCosPiTest_b : std_logic_vector (29 downto 0);
    signal X45dto0_uid216_alignedZ_uid58_fpCosPiTest_in : std_logic_vector (45 downto 0);
    signal X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b : std_logic_vector (45 downto 0);
    signal X13dto0_uid222_alignedZ_uid58_fpCosPiTest_in : std_logic_vector (13 downto 0);
    signal X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b : std_logic_vector (13 downto 0);
    signal expP_uid62_fpCosPiTest_in : std_logic_vector (7 downto 0);
    signal expP_uid62_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid198_lzcZ_uid57_fpCosPiTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid198_lzcZ_uid57_fpCosPiTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid200_lzcZ_uid57_fpCosPiTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid200_lzcZ_uid57_fpCosPiTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid204_lzcZ_uid57_fpCosPiTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid204_lzcZ_uid57_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid206_lzcZ_uid57_fpCosPiTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid206_lzcZ_uid57_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid279_zCount_uid142_rrx_uid32_fpCosPiTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid279_zCount_uid142_rrx_uid32_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid283_zCount_uid142_rrx_uid32_fpCosPiTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid283_zCount_uid142_rrx_uid32_fpCosPiTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid285_zCount_uid142_rrx_uid32_fpCosPiTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid285_zCount_uid142_rrx_uid32_fpCosPiTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid295_zCount_uid142_rrx_uid32_fpCosPiTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid295_zCount_uid142_rrx_uid32_fpCosPiTest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage174dto0_uid323_normMult_uid143_rrx_uid32_fpCosPiTest_in : std_logic_vector (74 downto 0);
    signal LeftShiftStage174dto0_uid323_normMult_uid143_rrx_uid32_fpCosPiTest_b : std_logic_vector (74 downto 0);
    signal X60dto0_uid155_fxpX_uid42_fpCosPiTest_in : std_logic_vector (60 downto 0);
    signal X60dto0_uid155_fxpX_uid42_fpCosPiTest_b : std_logic_vector (60 downto 0);
    signal X56dto0_uid158_fxpX_uid42_fpCosPiTest_in : std_logic_vector (56 downto 0);
    signal X56dto0_uid158_fxpX_uid42_fpCosPiTest_b : std_logic_vector (56 downto 0);
    signal X52dto0_uid161_fxpX_uid42_fpCosPiTest_in : std_logic_vector (52 downto 0);
    signal X52dto0_uid161_fxpX_uid42_fpCosPiTest_b : std_logic_vector (52 downto 0);
    signal fracRCompPreRnd_uid72_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal fracRCompPreRnd_uid72_fpCosPiTest_q : std_logic_vector (23 downto 0);
    signal rndOp_uid74_uid75_fpCosPiTest_q : std_logic_vector (24 downto 0);
    signal lowRangeB_uid257_sinPiZPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid257_sinPiZPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid258_sinPiZPolyEval_in : std_logic_vector (13 downto 0);
    signal highBBits_uid258_sinPiZPolyEval_b : std_logic_vector (12 downto 0);
    signal lowRangeB_uid263_sinPiZPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid263_sinPiZPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid264_sinPiZPolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid264_sinPiZPolyEval_b : std_logic_vector (21 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a_0_in : std_logic_vector (26 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a_0_b : std_logic_vector (26 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a_1_in : std_logic_vector (53 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a_1_b : std_logic_vector (26 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a_2_in : std_logic_vector (80 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_a_2_b : std_logic_vector (26 downto 0);
    signal intXParity_uid43_fpCosPiTest_in : std_logic_vector (64 downto 0);
    signal intXParity_uid43_fpCosPiTest_b : std_logic_vector (0 downto 0);
    signal y_uid44_fpCosPiTest_in : std_logic_vector (63 downto 0);
    signal y_uid44_fpCosPiTest_b : std_logic_vector (62 downto 0);
    signal LeftShiftStage057dto0_uid227_alignedZ_uid58_fpCosPiTest_in : std_logic_vector (57 downto 0);
    signal LeftShiftStage057dto0_uid227_alignedZ_uid58_fpCosPiTest_b : std_logic_vector (57 downto 0);
    signal LeftShiftStage053dto0_uid230_alignedZ_uid58_fpCosPiTest_in : std_logic_vector (53 downto 0);
    signal LeftShiftStage053dto0_uid230_alignedZ_uid58_fpCosPiTest_b : std_logic_vector (53 downto 0);
    signal LeftShiftStage049dto0_uid233_alignedZ_uid58_fpCosPiTest_in : std_logic_vector (49 downto 0);
    signal LeftShiftStage049dto0_uid233_alignedZ_uid58_fpCosPiTest_b : std_logic_vector (49 downto 0);
    signal LeftShiftStage160dto0_uid238_alignedZ_uid58_fpCosPiTest_in : std_logic_vector (60 downto 0);
    signal LeftShiftStage160dto0_uid238_alignedZ_uid58_fpCosPiTest_b : std_logic_vector (60 downto 0);
    signal LeftShiftStage159dto0_uid241_alignedZ_uid58_fpCosPiTest_in : std_logic_vector (59 downto 0);
    signal LeftShiftStage159dto0_uid241_alignedZ_uid58_fpCosPiTest_b : std_logic_vector (59 downto 0);
    signal LeftShiftStage158dto0_uid244_alignedZ_uid58_fpCosPiTest_in : std_logic_vector (58 downto 0);
    signal LeftShiftStage158dto0_uid244_alignedZ_uid58_fpCosPiTest_b : std_logic_vector (58 downto 0);
    signal p_uid59_fpCosPiTest_in : std_logic_vector (61 downto 0);
    signal p_uid59_fpCosPiTest_b : std_logic_vector (25 downto 0);
    signal expXRR_uid34_fpCosPiTest_in : std_logic_vector (57 downto 0);
    signal expXRR_uid34_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal fracXRR_uid35_fpCosPiTest_in : std_logic_vector (49 downto 0);
    signal fracXRR_uid35_fpCosPiTest_b : std_logic_vector (49 downto 0);
    signal rVStage_uid186_lzcZ_uid57_fpCosPiTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid186_lzcZ_uid57_fpCosPiTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid188_lzcZ_uid57_fpCosPiTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid188_lzcZ_uid57_fpCosPiTest_b : std_logic_vector (15 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_result_add_1_0_a : std_logic_vector(108 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_result_add_1_0_b : std_logic_vector(108 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_result_add_1_0_o : std_logic_vector (108 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_result_add_1_0_q : std_logic_vector (108 downto 0);
    signal oFracX_uid138_uid138_rrx_uid32_fpCosPiTest_q : std_logic_vector (23 downto 0);
    signal expX_uid127_rrx_uid32_fpCosPiTest_in : std_logic_vector (30 downto 0);
    signal expX_uid127_rrx_uid32_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal exc_N_uid17_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid17_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid17_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal yT1_uid255_sinPiZPolyEval_in : std_logic_vector (17 downto 0);
    signal yT1_uid255_sinPiZPolyEval_b : std_logic_vector (12 downto 0);
    signal vCount_uid205_lzcZ_uid57_fpCosPiTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid205_lzcZ_uid57_fpCosPiTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid205_lzcZ_uid57_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid208_lzcZ_uid57_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid208_lzcZ_uid57_fpCosPiTest_q : std_logic_vector (1 downto 0);
    signal vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid287_zCount_uid142_rrx_uid32_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid287_zCount_uid142_rrx_uid32_fpCosPiTest_q : std_logic_vector (3 downto 0);
    signal vCount_uid296_zCount_uid142_rrx_uid32_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid296_zCount_uid142_rrx_uid32_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid296_zCount_uid142_rrx_uid32_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage2Idx1_uid324_normMult_uid143_rrx_uid32_fpCosPiTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage0Idx1_uid156_fxpX_uid42_fpCosPiTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage0Idx2_uid159_fxpX_uid42_fpCosPiTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage0Idx3_uid162_fxpX_uid42_fpCosPiTest_q : std_logic_vector (64 downto 0);
    signal expRCompFracRCompPreRnd_uid73_uid73_fpCosPiTest_q : std_logic_vector (31 downto 0);
    signal expRCompFracRComp_uid76_fpCosPiTest_a : std_logic_vector(32 downto 0);
    signal expRCompFracRComp_uid76_fpCosPiTest_b : std_logic_vector(32 downto 0);
    signal expRCompFracRComp_uid76_fpCosPiTest_o : std_logic_vector (32 downto 0);
    signal expRCompFracRComp_uid76_fpCosPiTest_q : std_logic_vector (32 downto 0);
    signal sumAHighB_uid259_sinPiZPolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid259_sinPiZPolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid259_sinPiZPolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid259_sinPiZPolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid265_sinPiZPolyEval_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid265_sinPiZPolyEval_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid265_sinPiZPolyEval_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid265_sinPiZPolyEval_q : std_logic_vector (30 downto 0);
    signal yBottom_uid54_fpCosPiTest_in : std_logic_vector (61 downto 0);
    signal yBottom_uid54_fpCosPiTest_b : std_logic_vector (61 downto 0);
    signal cosXIsOneXRR_uid37_fpCosPiTest_a : std_logic_vector(11 downto 0);
    signal cosXIsOneXRR_uid37_fpCosPiTest_b : std_logic_vector(11 downto 0);
    signal cosXIsOneXRR_uid37_fpCosPiTest_o : std_logic_vector (11 downto 0);
    signal cosXIsOneXRR_uid37_fpCosPiTest_cin : std_logic_vector (0 downto 0);
    signal cosXIsOneXRR_uid37_fpCosPiTest_n : std_logic_vector (0 downto 0);
    signal fxpXShiftValExt_uid39_fpCosPiTest_a : std_logic_vector(10 downto 0);
    signal fxpXShiftValExt_uid39_fpCosPiTest_b : std_logic_vector(10 downto 0);
    signal fxpXShiftValExt_uid39_fpCosPiTest_o : std_logic_vector (10 downto 0);
    signal fxpXShiftValExt_uid39_fpCosPiTest_q : std_logic_vector (9 downto 0);
    signal vCount_uid187_lzcZ_uid57_fpCosPiTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid187_lzcZ_uid57_fpCosPiTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid187_lzcZ_uid57_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid190_lzcZ_uid57_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid190_lzcZ_uid57_fpCosPiTest_q : std_logic_vector (15 downto 0);
    signal multFracBits_uid140_rrx_uid32_fpCosPiTest_in : std_logic_vector (75 downto 0);
    signal multFracBits_uid140_rrx_uid32_fpCosPiTest_b : std_logic_vector (75 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_b_0_in : std_logic_vector (26 downto 0);
    signal prod_uid139_rrx_uid32_fpCosPiTest_b_0_b : std_logic_vector (26 downto 0);
    signal expXTableAddrExt_uid133_rrx_uid32_fpCosPiTest_a : std_logic_vector(8 downto 0);
    signal expXTableAddrExt_uid133_rrx_uid32_fpCosPiTest_b : std_logic_vector(8 downto 0);
    signal expXTableAddrExt_uid133_rrx_uid32_fpCosPiTest_o : std_logic_vector (8 downto 0);
    signal expXTableAddrExt_uid133_rrx_uid32_fpCosPiTest_q : std_logic_vector (8 downto 0);
    signal excRNaN_uid82_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid82_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid82_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal rVStage_uid210_lzcZ_uid57_fpCosPiTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid210_lzcZ_uid57_fpCosPiTest_b : std_logic_vector (0 downto 0);
    signal rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid291_zCount_uid142_rrx_uid32_fpCosPiTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid291_zCount_uid142_rrx_uid32_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_q : std_logic_vector (4 downto 0);
    signal leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_q : std_logic_vector (64 downto 0);
    signal fracRComp_uid77_fpCosPiTest_in : std_logic_vector (23 downto 0);
    signal fracRComp_uid77_fpCosPiTest_b : std_logic_vector (22 downto 0);
    signal expRComp_uid78_fpCosPiTest_in : std_logic_vector (31 downto 0);
    signal expRComp_uid78_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal s1_uid257_uid260_sinPiZPolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid263_uid266_sinPiZPolyEval_q : std_logic_vector (32 downto 0);
    signal cosXOne_uid91_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal cosXOne_uid91_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal cosXOne_uid91_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal fxpXShiftVal_uid40_fpCosPiTest_in : std_logic_vector (3 downto 0);
    signal fxpXShiftVal_uid40_fpCosPiTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid192_lzcZ_uid57_fpCosPiTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid192_lzcZ_uid57_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid194_lzcZ_uid57_fpCosPiTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid194_lzcZ_uid57_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal multFracBitsTop_uid141_rrx_uid32_fpCosPiTest_in : std_logic_vector (75 downto 0);
    signal multFracBitsTop_uid141_rrx_uid32_fpCosPiTest_b : std_logic_vector (29 downto 0);
    signal X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_in : std_logic_vector (67 downto 0);
    signal X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_b : std_logic_vector (67 downto 0);
    signal X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_in : std_logic_vector (59 downto 0);
    signal X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_b : std_logic_vector (59 downto 0);
    signal X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_in : std_logic_vector (51 downto 0);
    signal X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_b : std_logic_vector (51 downto 0);
    signal expXTableAddr_uid134_rrx_uid32_fpCosPiTest_in : std_logic_vector (7 downto 0);
    signal expXTableAddr_uid134_rrx_uid32_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal vCount_uid211_lzcZ_uid57_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid211_lzcZ_uid57_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid211_lzcZ_uid57_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal expCompOutExt_uid145_rrx_uid32_fpCosPiTest_a : std_logic_vector(8 downto 0);
    signal expCompOutExt_uid145_rrx_uid32_fpCosPiTest_b : std_logic_vector(8 downto 0);
    signal expCompOutExt_uid145_rrx_uid32_fpCosPiTest_o : std_logic_vector (8 downto 0);
    signal expCompOutExt_uid145_rrx_uid32_fpCosPiTest_q : std_logic_vector (8 downto 0);
    signal leftShiftStageSel4Dto3_uid309_normMult_uid143_rrx_uid32_fpCosPiTest_in : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto3_uid309_normMult_uid143_rrx_uid32_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel2Dto1_uid320_normMult_uid143_rrx_uid32_fpCosPiTest_in : std_logic_vector (2 downto 0);
    signal leftShiftStageSel2Dto1_uid320_normMult_uid143_rrx_uid32_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel0Dto0_uid325_normMult_uid143_rrx_uid32_fpCosPiTest_in : std_logic_vector (0 downto 0);
    signal leftShiftStageSel0Dto0_uid325_normMult_uid143_rrx_uid32_fpCosPiTest_b : std_logic_vector (0 downto 0);
    signal fracCompOut_uid144_rrx_uid32_fpCosPiTest_in : std_logic_vector (74 downto 0);
    signal fracCompOut_uid144_rrx_uid32_fpCosPiTest_b : std_logic_vector (49 downto 0);
    signal LeftShiftStage063dto0_uid166_fxpX_uid42_fpCosPiTest_in : std_logic_vector (63 downto 0);
    signal LeftShiftStage063dto0_uid166_fxpX_uid42_fpCosPiTest_b : std_logic_vector (63 downto 0);
    signal LeftShiftStage062dto0_uid169_fxpX_uid42_fpCosPiTest_in : std_logic_vector (62 downto 0);
    signal LeftShiftStage062dto0_uid169_fxpX_uid42_fpCosPiTest_b : std_logic_vector (62 downto 0);
    signal LeftShiftStage061dto0_uid172_fxpX_uid42_fpCosPiTest_in : std_logic_vector (61 downto 0);
    signal LeftShiftStage061dto0_uid172_fxpX_uid42_fpCosPiTest_b : std_logic_vector (61 downto 0);
    signal fxpSinRes_uid67_fpCosPiTest_in : std_logic_vector (30 downto 0);
    signal fxpSinRes_uid67_fpCosPiTest_b : std_logic_vector (25 downto 0);
    signal leftShiftStageSel3Dto2_uid163_fxpX_uid42_fpCosPiTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid163_fxpX_uid42_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest_in : std_logic_vector (29 downto 0);
    signal rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid272_zCount_uid142_rrx_uid32_fpCosPiTest_in : std_logic_vector (13 downto 0);
    signal vStage_uid272_zCount_uid142_rrx_uid32_fpCosPiTest_b : std_logic_vector (13 downto 0);
    signal r_uid212_lzcZ_uid57_fpCosPiTest_q : std_logic_vector (5 downto 0);
    signal expCompOut_uid146_rrx_uid32_fpCosPiTest_in : std_logic_vector (7 downto 0);
    signal expCompOut_uid146_rrx_uid32_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_q : std_logic_vector (75 downto 0);
    signal cStage_uid273_zCount_uid142_rrx_uid32_fpCosPiTest_q : std_logic_vector (15 downto 0);
    signal leftShiftStageSel5Dto4_uid224_alignedZ_uid58_fpCosPiTest_in : std_logic_vector (5 downto 0);
    signal leftShiftStageSel5Dto4_uid224_alignedZ_uid58_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal LeftShiftStage073dto0_uid312_normMult_uid143_rrx_uid32_fpCosPiTest_in : std_logic_vector (73 downto 0);
    signal LeftShiftStage073dto0_uid312_normMult_uid143_rrx_uid32_fpCosPiTest_b : std_logic_vector (73 downto 0);
    signal LeftShiftStage071dto0_uid315_normMult_uid143_rrx_uid32_fpCosPiTest_in : std_logic_vector (71 downto 0);
    signal LeftShiftStage071dto0_uid315_normMult_uid143_rrx_uid32_fpCosPiTest_b : std_logic_vector (71 downto 0);
    signal LeftShiftStage069dto0_uid318_normMult_uid143_rrx_uid32_fpCosPiTest_in : std_logic_vector (69 downto 0);
    signal LeftShiftStage069dto0_uid318_normMult_uid143_rrx_uid32_fpCosPiTest_b : std_logic_vector (69 downto 0);
    signal leftShiftStage1Idx1_uid313_normMult_uid143_rrx_uid32_fpCosPiTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage1Idx2_uid316_normMult_uid143_rrx_uid32_fpCosPiTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage1Idx3_uid319_normMult_uid143_rrx_uid32_fpCosPiTest_q : std_logic_vector (75 downto 0);
begin


	--xIn(GPIN,3)@0

	--GND(CONSTANT,0)
    GND_q <= "0";

	--ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable(LOGICAL,823)
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_a <= en;
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q <= not ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_a;

	--ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_nor(LOGICAL,874)
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_nor_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q;
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_nor_b <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_sticky_ena_q;
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_nor_q <= not (ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_nor_a or ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_nor_b);

	--ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_mem_top(CONSTANT,870)
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_mem_top_q <= "01010";

	--ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmp(LOGICAL,871)
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmp_a <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_mem_top_q;
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdmux_q);
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmp_q <= "1" when ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmp_a = ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmp_b else "0";

	--ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmpReg(REG,872)
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmpReg_q <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_sticky_ena(REG,875)
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_nor_q = "1") THEN
                ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_sticky_ena_q <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_enaAnd(LOGICAL,876)
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_enaAnd_a <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_sticky_ena_q;
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_enaAnd_b <= en;
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_enaAnd_q <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_enaAnd_a and ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_enaAnd_b;

	--expFracX_uid107_px_uid31_fpCosPiTest(BITSELECT,106)@0
    expFracX_uid107_px_uid31_fpCosPiTest_in <= a(30 downto 0);
    expFracX_uid107_px_uid31_fpCosPiTest_b <= expFracX_uid107_px_uid31_fpCosPiTest_in(30 downto 0);

	--R_uid108_px_uid31_fpCosPiTest(BITJOIN,107)@0
    R_uid108_px_uid31_fpCosPiTest_q <= GND_q & expFracX_uid107_px_uid31_fpCosPiTest_b;

	--expX_uid127_rrx_uid32_fpCosPiTest(BITSELECT,126)@0
    expX_uid127_rrx_uid32_fpCosPiTest_in <= R_uid108_px_uid31_fpCosPiTest_q(30 downto 0);
    expX_uid127_rrx_uid32_fpCosPiTest_b <= expX_uid127_rrx_uid32_fpCosPiTest_in(30 downto 23);

	--ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_inputreg(DELAY,864)
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expX_uid127_rrx_uid32_fpCosPiTest_b, xout => ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt(COUNTER,866)
    -- every=1, low=0, high=10, step=1, init=1
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_i = 9 THEN
                      ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_eq = '1') THEN
                        ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_i <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_i - 10;
                    ELSE
                        ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_i <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_i,4));


	--ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdreg(REG,867)
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdreg_q <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdmux(MUX,868)
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdmux_s <= en;
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdmux: PROCESS (ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdmux_s, ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdreg_q, ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdmux_q <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdreg_q;
                  WHEN "1" => ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdmux_q <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem(DUALMEM,865)
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_ia <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_inputreg_q;
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_aa <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdreg_q;
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_ab <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_rdmux_q;
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_iq,
        address_a => ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_aa,
        data_a => ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_ia
    );
    ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_reset0 <= areset;
        ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_q <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_iq(7 downto 0);

	--zs_uid185_lzcZ_uid57_fpCosPiTest(CONSTANT,184)
    zs_uid185_lzcZ_uid57_fpCosPiTest_q <= "0000000000000000";

	--ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_nor(LOGICAL,848)
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_nor_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q;
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_nor_b <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_sticky_ena_q;
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_nor_q <= not (ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_nor_a or ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_nor_b);

	--ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_cmpReg(REG,846)
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_sticky_ena(REG,849)
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_nor_q = "1") THEN
                ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_sticky_ena_q <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_enaAnd(LOGICAL,850)
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_enaAnd_a <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_sticky_ena_q;
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_enaAnd_b <= en;
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_enaAnd_q <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_enaAnd_a and ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_enaAnd_b;

	--ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_inputreg(DELAY,840)
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => R_uid108_px_uid31_fpCosPiTest_q, xout => ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdcnt(COUNTER,842)
    -- every=1, low=0, high=1, step=1, init=1
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdcnt_i <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdcnt_i,1));


	--ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdreg(REG,843)
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdreg_q <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux(MUX,844)
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux_s <= en;
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux: PROCESS (ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux_s, ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdreg_q, ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux_q <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux_q <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem(DUALMEM,841)
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_ia <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_inputreg_q;
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_aa <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdreg_q;
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_ab <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux_q;
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_iq,
        address_a => ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_aa,
        data_a => ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_ia
    );
    ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_reset0 <= areset;
        ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_q <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_iq(31 downto 0);

	--fracX_uid128_rrx_uid32_fpCosPiTest(BITSELECT,127)@4
    fracX_uid128_rrx_uid32_fpCosPiTest_in <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_mem_q(22 downto 0);
    fracX_uid128_rrx_uid32_fpCosPiTest_b <= fracX_uid128_rrx_uid32_fpCosPiTest_in(22 downto 0);

	--oFracX_uid138_uid138_rrx_uid32_fpCosPiTest(BITJOIN,137)@4
    oFracX_uid138_uid138_rrx_uid32_fpCosPiTest_q <= VCC_q & fracX_uid128_rrx_uid32_fpCosPiTest_b;

	--prod_uid139_rrx_uid32_fpCosPiTest_b_0(BITSELECT,338)@4
    prod_uid139_rrx_uid32_fpCosPiTest_b_0_in <= STD_LOGIC_VECTOR("000" & oFracX_uid138_uid138_rrx_uid32_fpCosPiTest_q);
    prod_uid139_rrx_uid32_fpCosPiTest_b_0_b <= prod_uid139_rrx_uid32_fpCosPiTest_b_0_in(26 downto 0);

	--reg_prod_uid139_rrx_uid32_fpCosPiTest_b_0_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_1(REG,355)@4
    reg_prod_uid139_rrx_uid32_fpCosPiTest_b_0_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid139_rrx_uid32_fpCosPiTest_b_0_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid139_rrx_uid32_fpCosPiTest_b_0_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_1_q <= prod_uid139_rrx_uid32_fpCosPiTest_b_0_b;
            END IF;
        END IF;
    END PROCESS;


	--cstBiasMwShift_uid23_fpCosPiTest(CONSTANT,22)
    cstBiasMwShift_uid23_fpCosPiTest_q <= "01110011";

	--expXTableAddrExt_uid133_rrx_uid32_fpCosPiTest(SUB,132)@0
    expXTableAddrExt_uid133_rrx_uid32_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & expX_uid127_rrx_uid32_fpCosPiTest_b);
    expXTableAddrExt_uid133_rrx_uid32_fpCosPiTest_b <= STD_LOGIC_VECTOR("0" & cstBiasMwShift_uid23_fpCosPiTest_q);
            expXTableAddrExt_uid133_rrx_uid32_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXTableAddrExt_uid133_rrx_uid32_fpCosPiTest_a) - UNSIGNED(expXTableAddrExt_uid133_rrx_uid32_fpCosPiTest_b));
    expXTableAddrExt_uid133_rrx_uid32_fpCosPiTest_q <= expXTableAddrExt_uid133_rrx_uid32_fpCosPiTest_o(8 downto 0);


	--expXTableAddr_uid134_rrx_uid32_fpCosPiTest(BITSELECT,133)@0
    expXTableAddr_uid134_rrx_uid32_fpCosPiTest_in <= expXTableAddrExt_uid133_rrx_uid32_fpCosPiTest_q(7 downto 0);
    expXTableAddr_uid134_rrx_uid32_fpCosPiTest_b <= expXTableAddr_uid134_rrx_uid32_fpCosPiTest_in(7 downto 0);

	--reg_expXTableAddr_uid134_rrx_uid32_fpCosPiTest_0_to_rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_0(REG,350)@0
    reg_expXTableAddr_uid134_rrx_uid32_fpCosPiTest_0_to_rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXTableAddr_uid134_rrx_uid32_fpCosPiTest_0_to_rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXTableAddr_uid134_rrx_uid32_fpCosPiTest_0_to_rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_0_q <= expXTableAddr_uid134_rrx_uid32_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem(DUALMEM,334)@1
    rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_ia <= (others => '0');
    rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_aa <= (others => '0');
    rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_ab <= reg_expXTableAddr_uid134_rrx_uid32_fpCosPiTest_0_to_rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_0_q;
    rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_dmem : altsyncram
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
        init_file => "fp_cos_s5_rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_reset0,
        clock0 => clk,
        address_b => rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_iq,
        address_a => rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_aa,
        data_a => rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_ia
    );
    rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_reset0 <= areset;
        rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_q <= rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_iq(37 downto 0);

	--reg_rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_0_to_os_uid137_rrx_uid32_fpCosPiTest_1(REG,353)@3
    reg_rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_0_to_os_uid137_rrx_uid32_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_0_to_os_uid137_rrx_uid32_fpCosPiTest_1_q <= "00000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_0_to_os_uid137_rrx_uid32_fpCosPiTest_1_q <= rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem(DUALMEM,333)@1
    rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_ia <= (others => '0');
    rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_aa <= (others => '0');
    rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_ab <= reg_expXTableAddr_uid134_rrx_uid32_fpCosPiTest_0_to_rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_0_q;
    rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_dmem : altsyncram
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
        init_file => "fp_cos_s5_rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_reset0,
        clock0 => clk,
        address_b => rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_iq,
        address_a => rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_aa,
        data_a => rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_ia
    );
    rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_reset0 <= areset;
        rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_q <= rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_iq(39 downto 0);

	--reg_rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_0_to_os_uid137_rrx_uid32_fpCosPiTest_0(REG,352)@3
    reg_rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_0_to_os_uid137_rrx_uid32_fpCosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_0_to_os_uid137_rrx_uid32_fpCosPiTest_0_q <= "0000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_0_to_os_uid137_rrx_uid32_fpCosPiTest_0_q <= rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid137_rrx_uid32_fpCosPiTest(BITJOIN,136)@4
    os_uid137_rrx_uid32_fpCosPiTest_q <= reg_rrTable_uid136_rrx_uid32_fpCosPiTest_lutmem_0_to_os_uid137_rrx_uid32_fpCosPiTest_1_q & reg_rrTable_uid135_rrx_uid32_fpCosPiTest_lutmem_0_to_os_uid137_rrx_uid32_fpCosPiTest_0_q;

	--prod_uid139_rrx_uid32_fpCosPiTest_a_2(BITSELECT,337)@4
    prod_uid139_rrx_uid32_fpCosPiTest_a_2_in <= STD_LOGIC_VECTOR("000" & os_uid137_rrx_uid32_fpCosPiTest_q);
    prod_uid139_rrx_uid32_fpCosPiTest_a_2_b <= prod_uid139_rrx_uid32_fpCosPiTest_a_2_in(80 downto 54);

	--reg_prod_uid139_rrx_uid32_fpCosPiTest_a_2_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_0(REG,358)@4
    reg_prod_uid139_rrx_uid32_fpCosPiTest_a_2_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid139_rrx_uid32_fpCosPiTest_a_2_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid139_rrx_uid32_fpCosPiTest_a_2_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_0_q <= prod_uid139_rrx_uid32_fpCosPiTest_a_2_b;
            END IF;
        END IF;
    END PROCESS;


	--prod_uid139_rrx_uid32_fpCosPiTest_a2_b0(MULT,341)@5
    prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_pr <= UNSIGNED(prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_a) * UNSIGNED(prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_b);
    prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_a <= (others => '0');
            prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_b <= (others => '0');
            prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_a <= reg_prod_uid139_rrx_uid32_fpCosPiTest_a_2_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_0_q;
                prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_b <= reg_prod_uid139_rrx_uid32_fpCosPiTest_b_0_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_1_q;
                prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_s1 <= STD_LOGIC_VECTOR(prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid139_rrx_uid32_fpCosPiTest_a2_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_q <= prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--ld_prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_q_to_prod_uid139_rrx_uid32_fpCosPiTest_align_2_a(DELAY,736)@8
    ld_prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_q_to_prod_uid139_rrx_uid32_fpCosPiTest_align_2_a : dspba_delay
    GENERIC MAP ( width => 54, depth => 1 )
    PORT MAP ( xin => prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_q, xout => ld_prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_q_to_prod_uid139_rrx_uid32_fpCosPiTest_align_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--prod_uid139_rrx_uid32_fpCosPiTest_align_2(BITSHIFT,344)@9
    prod_uid139_rrx_uid32_fpCosPiTest_align_2_q_int <= ld_prod_uid139_rrx_uid32_fpCosPiTest_a2_b0_q_to_prod_uid139_rrx_uid32_fpCosPiTest_align_2_a_q & "000000000000000000000000000000000000000000000000000000";
    prod_uid139_rrx_uid32_fpCosPiTest_align_2_q <= prod_uid139_rrx_uid32_fpCosPiTest_align_2_q_int(107 downto 0);

	--prod_uid139_rrx_uid32_fpCosPiTest_a_1(BITSELECT,336)@4
    prod_uid139_rrx_uid32_fpCosPiTest_a_1_in <= os_uid137_rrx_uid32_fpCosPiTest_q(53 downto 0);
    prod_uid139_rrx_uid32_fpCosPiTest_a_1_b <= prod_uid139_rrx_uid32_fpCosPiTest_a_1_in(53 downto 27);

	--reg_prod_uid139_rrx_uid32_fpCosPiTest_a_1_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_0(REG,356)@4
    reg_prod_uid139_rrx_uid32_fpCosPiTest_a_1_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid139_rrx_uid32_fpCosPiTest_a_1_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid139_rrx_uid32_fpCosPiTest_a_1_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_0_q <= prod_uid139_rrx_uid32_fpCosPiTest_a_1_b;
            END IF;
        END IF;
    END PROCESS;


	--prod_uid139_rrx_uid32_fpCosPiTest_a1_b0(MULT,340)@5
    prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_pr <= UNSIGNED(prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_a) * UNSIGNED(prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_b);
    prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_a <= (others => '0');
            prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_b <= (others => '0');
            prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_a <= reg_prod_uid139_rrx_uid32_fpCosPiTest_a_1_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_0_q;
                prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_b <= reg_prod_uid139_rrx_uid32_fpCosPiTest_b_0_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_1_q;
                prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_s1 <= STD_LOGIC_VECTOR(prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid139_rrx_uid32_fpCosPiTest_a1_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_q <= prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--prod_uid139_rrx_uid32_fpCosPiTest_align_1(BITSHIFT,343)@8
    prod_uid139_rrx_uid32_fpCosPiTest_align_1_q_int <= prod_uid139_rrx_uid32_fpCosPiTest_a1_b0_q & "000000000000000000000000000";
    prod_uid139_rrx_uid32_fpCosPiTest_align_1_q <= prod_uid139_rrx_uid32_fpCosPiTest_align_1_q_int(80 downto 0);

	--prod_uid139_rrx_uid32_fpCosPiTest_a_0(BITSELECT,335)@4
    prod_uid139_rrx_uid32_fpCosPiTest_a_0_in <= os_uid137_rrx_uid32_fpCosPiTest_q(26 downto 0);
    prod_uid139_rrx_uid32_fpCosPiTest_a_0_b <= prod_uid139_rrx_uid32_fpCosPiTest_a_0_in(26 downto 0);

	--reg_prod_uid139_rrx_uid32_fpCosPiTest_a_0_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_0(REG,354)@4
    reg_prod_uid139_rrx_uid32_fpCosPiTest_a_0_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid139_rrx_uid32_fpCosPiTest_a_0_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid139_rrx_uid32_fpCosPiTest_a_0_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_0_q <= prod_uid139_rrx_uid32_fpCosPiTest_a_0_b;
            END IF;
        END IF;
    END PROCESS;


	--prod_uid139_rrx_uid32_fpCosPiTest_a0_b0(MULT,339)@5
    prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_pr <= UNSIGNED(prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_a) * UNSIGNED(prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_b);
    prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_a <= (others => '0');
            prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_b <= (others => '0');
            prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_a <= reg_prod_uid139_rrx_uid32_fpCosPiTest_a_0_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_0_q;
                prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_b <= reg_prod_uid139_rrx_uid32_fpCosPiTest_b_0_0_to_prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_1_q;
                prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_s1 <= STD_LOGIC_VECTOR(prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid139_rrx_uid32_fpCosPiTest_a0_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_q <= prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--prod_uid139_rrx_uid32_fpCosPiTest_align_0(BITSHIFT,342)@8
    prod_uid139_rrx_uid32_fpCosPiTest_align_0_q_int <= prod_uid139_rrx_uid32_fpCosPiTest_a0_b0_q;
    prod_uid139_rrx_uid32_fpCosPiTest_align_0_q <= prod_uid139_rrx_uid32_fpCosPiTest_align_0_q_int(53 downto 0);

	--prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0(ADD,345)@8
    prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0_a <= STD_LOGIC_VECTOR("0000000000000000000000000000" & prod_uid139_rrx_uid32_fpCosPiTest_align_0_q);
    prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & prod_uid139_rrx_uid32_fpCosPiTest_align_1_q);
    prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0_a) + UNSIGNED(prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0_b));
        END IF;
    END PROCESS;
    prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0_q <= prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0_o(81 downto 0);


	--prod_uid139_rrx_uid32_fpCosPiTest_result_add_1_0(ADD,346)@9
    prod_uid139_rrx_uid32_fpCosPiTest_result_add_1_0_a <= STD_LOGIC_VECTOR("000000000000000000000000000" & prod_uid139_rrx_uid32_fpCosPiTest_result_add_0_0_q);
    prod_uid139_rrx_uid32_fpCosPiTest_result_add_1_0_b <= STD_LOGIC_VECTOR("0" & prod_uid139_rrx_uid32_fpCosPiTest_align_2_q);
            prod_uid139_rrx_uid32_fpCosPiTest_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_uid139_rrx_uid32_fpCosPiTest_result_add_1_0_a) + UNSIGNED(prod_uid139_rrx_uid32_fpCosPiTest_result_add_1_0_b));
    prod_uid139_rrx_uid32_fpCosPiTest_result_add_1_0_q <= prod_uid139_rrx_uid32_fpCosPiTest_result_add_1_0_o(108 downto 0);


	--multFracBits_uid140_rrx_uid32_fpCosPiTest(BITSELECT,139)@9
    multFracBits_uid140_rrx_uid32_fpCosPiTest_in <= prod_uid139_rrx_uid32_fpCosPiTest_result_add_1_0_q(75 downto 0);
    multFracBits_uid140_rrx_uid32_fpCosPiTest_b <= multFracBits_uid140_rrx_uid32_fpCosPiTest_in(75 downto 0);

	--multFracBitsTop_uid141_rrx_uid32_fpCosPiTest(BITSELECT,140)@9
    multFracBitsTop_uid141_rrx_uid32_fpCosPiTest_in <= multFracBits_uid140_rrx_uid32_fpCosPiTest_b;
    multFracBitsTop_uid141_rrx_uid32_fpCosPiTest_b <= multFracBitsTop_uid141_rrx_uid32_fpCosPiTest_in(75 downto 46);

	--rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest(BITSELECT,268)@9
    rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest_in <= multFracBitsTop_uid141_rrx_uid32_fpCosPiTest_b;
    rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest_b <= rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest_in(29 downto 14);

	--reg_rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_1(REG,360)@9
    reg_rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_1_q <= rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest(LOGICAL,269)@10
    vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_a <= reg_rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_1_q;
    vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_b <= zs_uid185_lzcZ_uid57_fpCosPiTest_q;
    vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_q <= "1" when vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_a = vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_b else "0";

	--ld_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_q_to_reg_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_4_a(DELAY,762)@10
    ld_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_q_to_reg_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_4_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_q, xout => ld_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_q_to_reg_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_4_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_4(REG,368)@11
    reg_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_4_q <= ld_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_q_to_reg_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_4_a_q;
            END IF;
        END IF;
    END PROCESS;


	--cstAllZwE_uid28_fpCosPiTest(CONSTANT,27)
    cstAllZwE_uid28_fpCosPiTest_q <= "00000000";

	--vStage_uid272_zCount_uid142_rrx_uid32_fpCosPiTest(BITSELECT,271)@9
    vStage_uid272_zCount_uid142_rrx_uid32_fpCosPiTest_in <= multFracBitsTop_uid141_rrx_uid32_fpCosPiTest_b(13 downto 0);
    vStage_uid272_zCount_uid142_rrx_uid32_fpCosPiTest_b <= vStage_uid272_zCount_uid142_rrx_uid32_fpCosPiTest_in(13 downto 0);

	--mO_uid180_lzcZ_uid57_fpCosPiTest(CONSTANT,179)
    mO_uid180_lzcZ_uid57_fpCosPiTest_q <= "11";

	--cStage_uid273_zCount_uid142_rrx_uid32_fpCosPiTest(BITJOIN,272)@9
    cStage_uid273_zCount_uid142_rrx_uid32_fpCosPiTest_q <= vStage_uid272_zCount_uid142_rrx_uid32_fpCosPiTest_b & mO_uid180_lzcZ_uid57_fpCosPiTest_q;

	--reg_cStage_uid273_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_3(REG,362)@9
    reg_cStage_uid273_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid273_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_3_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid273_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_3_q <= cStage_uid273_zCount_uid142_rrx_uid32_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest(MUX,274)@10
    vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_s <= vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_q;
    vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest: PROCESS (vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_s, en, reg_rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_1_q, reg_cStage_uid273_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_3_q)
    BEGIN
            CASE vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_s IS
                  WHEN "0" => vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_q <= reg_rVStage_uid269_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_1_q;
                  WHEN "1" => vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_q <= reg_cStage_uid273_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_3_q;
                  WHEN OTHERS => vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest(BITSELECT,276)@10
    rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest_in <= vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_q;
    rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest_b <= rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest_in(15 downto 8);

	--vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest(LOGICAL,277)@10
    vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_a <= rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest_b;
    vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_b <= cstAllZwE_uid28_fpCosPiTest_q;
    vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_a = vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_b) THEN
                vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_q <= "1";
            ELSE
                vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--ld_vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_q_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_d(DELAY,684)@11
    ld_vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_q_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_q, xout => ld_vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_q_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx1Pad4_uid154_fxpX_uid42_fpCosPiTest(CONSTANT,153)
    leftShiftStage0Idx1Pad4_uid154_fxpX_uid42_fpCosPiTest_q <= "0000";

	--vStage_uid279_zCount_uid142_rrx_uid32_fpCosPiTest(BITSELECT,278)@10
    vStage_uid279_zCount_uid142_rrx_uid32_fpCosPiTest_in <= vStagei_uid275_zCount_uid142_rrx_uid32_fpCosPiTest_q(7 downto 0);
    vStage_uid279_zCount_uid142_rrx_uid32_fpCosPiTest_b <= vStage_uid279_zCount_uid142_rrx_uid32_fpCosPiTest_in(7 downto 0);

	--reg_vStage_uid279_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_3(REG,364)@10
    reg_vStage_uid279_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid279_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid279_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_3_q <= vStage_uid279_zCount_uid142_rrx_uid32_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_2(REG,363)@10
    reg_rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_2_q <= rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest(MUX,280)@11
    vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_s <= vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_q;
    vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest: PROCESS (vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_s, en, reg_rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_2_q, reg_vStage_uid279_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_3_q)
    BEGIN
            CASE vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_s IS
                  WHEN "0" => vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_q <= reg_rVStage_uid277_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_2_q;
                  WHEN "1" => vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_q <= reg_vStage_uid279_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_3_q;
                  WHEN OTHERS => vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid283_zCount_uid142_rrx_uid32_fpCosPiTest(BITSELECT,282)@11
    rVStage_uid283_zCount_uid142_rrx_uid32_fpCosPiTest_in <= vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_q;
    rVStage_uid283_zCount_uid142_rrx_uid32_fpCosPiTest_b <= rVStage_uid283_zCount_uid142_rrx_uid32_fpCosPiTest_in(7 downto 4);

	--vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest(LOGICAL,283)@11
    vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_a <= rVStage_uid283_zCount_uid142_rrx_uid32_fpCosPiTest_b;
    vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_b <= leftShiftStage0Idx1Pad4_uid154_fxpX_uid42_fpCosPiTest_q;
    vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_q <= "1" when vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_a = vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_b else "0";

	--reg_vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_2(REG,367)@11
    reg_vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_2_q <= vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1Idx2Pad2_uid168_fxpX_uid42_fpCosPiTest(CONSTANT,167)
    leftShiftStage1Idx2Pad2_uid168_fxpX_uid42_fpCosPiTest_q <= "00";

	--vStage_uid285_zCount_uid142_rrx_uid32_fpCosPiTest(BITSELECT,284)@11
    vStage_uid285_zCount_uid142_rrx_uid32_fpCosPiTest_in <= vStagei_uid281_zCount_uid142_rrx_uid32_fpCosPiTest_q(3 downto 0);
    vStage_uid285_zCount_uid142_rrx_uid32_fpCosPiTest_b <= vStage_uid285_zCount_uid142_rrx_uid32_fpCosPiTest_in(3 downto 0);

	--vStagei_uid287_zCount_uid142_rrx_uid32_fpCosPiTest(MUX,286)@11
    vStagei_uid287_zCount_uid142_rrx_uid32_fpCosPiTest_s <= vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_q;
    vStagei_uid287_zCount_uid142_rrx_uid32_fpCosPiTest: PROCESS (vStagei_uid287_zCount_uid142_rrx_uid32_fpCosPiTest_s, en, rVStage_uid283_zCount_uid142_rrx_uid32_fpCosPiTest_b, vStage_uid285_zCount_uid142_rrx_uid32_fpCosPiTest_b)
    BEGIN
            CASE vStagei_uid287_zCount_uid142_rrx_uid32_fpCosPiTest_s IS
                  WHEN "0" => vStagei_uid287_zCount_uid142_rrx_uid32_fpCosPiTest_q <= rVStage_uid283_zCount_uid142_rrx_uid32_fpCosPiTest_b;
                  WHEN "1" => vStagei_uid287_zCount_uid142_rrx_uid32_fpCosPiTest_q <= vStage_uid285_zCount_uid142_rrx_uid32_fpCosPiTest_b;
                  WHEN OTHERS => vStagei_uid287_zCount_uid142_rrx_uid32_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest(BITSELECT,288)@11
    rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest_in <= vStagei_uid287_zCount_uid142_rrx_uid32_fpCosPiTest_q;
    rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest_b <= rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest_in(3 downto 2);

	--vCount_uid290_zCount_uid142_rrx_uid32_fpCosPiTest(LOGICAL,289)@11
    vCount_uid290_zCount_uid142_rrx_uid32_fpCosPiTest_a <= rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest_b;
    vCount_uid290_zCount_uid142_rrx_uid32_fpCosPiTest_b <= leftShiftStage1Idx2Pad2_uid168_fxpX_uid42_fpCosPiTest_q;
    vCount_uid290_zCount_uid142_rrx_uid32_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid290_zCount_uid142_rrx_uid32_fpCosPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid290_zCount_uid142_rrx_uid32_fpCosPiTest_a = vCount_uid290_zCount_uid142_rrx_uid32_fpCosPiTest_b) THEN
                vCount_uid290_zCount_uid142_rrx_uid32_fpCosPiTest_q <= "1";
            ELSE
                vCount_uid290_zCount_uid142_rrx_uid32_fpCosPiTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--vStage_uid291_zCount_uid142_rrx_uid32_fpCosPiTest(BITSELECT,290)@11
    vStage_uid291_zCount_uid142_rrx_uid32_fpCosPiTest_in <= vStagei_uid287_zCount_uid142_rrx_uid32_fpCosPiTest_q(1 downto 0);
    vStage_uid291_zCount_uid142_rrx_uid32_fpCosPiTest_b <= vStage_uid291_zCount_uid142_rrx_uid32_fpCosPiTest_in(1 downto 0);

	--reg_vStage_uid291_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_3(REG,366)@11
    reg_vStage_uid291_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid291_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_3_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid291_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_3_q <= vStage_uid291_zCount_uid142_rrx_uid32_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_2(REG,365)@11
    reg_rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_2_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_2_q <= rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest(MUX,292)@12
    vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_s <= vCount_uid290_zCount_uid142_rrx_uid32_fpCosPiTest_q;
    vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest: PROCESS (vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_s, en, reg_rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_2_q, reg_vStage_uid291_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_3_q)
    BEGIN
            CASE vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_s IS
                  WHEN "0" => vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_q <= reg_rVStage_uid289_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_2_q;
                  WHEN "1" => vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_q <= reg_vStage_uid291_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_3_q;
                  WHEN OTHERS => vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid295_zCount_uid142_rrx_uid32_fpCosPiTest(BITSELECT,294)@12
    rVStage_uid295_zCount_uid142_rrx_uid32_fpCosPiTest_in <= vStagei_uid293_zCount_uid142_rrx_uid32_fpCosPiTest_q;
    rVStage_uid295_zCount_uid142_rrx_uid32_fpCosPiTest_b <= rVStage_uid295_zCount_uid142_rrx_uid32_fpCosPiTest_in(1 downto 1);

	--vCount_uid296_zCount_uid142_rrx_uid32_fpCosPiTest(LOGICAL,295)@12
    vCount_uid296_zCount_uid142_rrx_uid32_fpCosPiTest_a <= rVStage_uid295_zCount_uid142_rrx_uid32_fpCosPiTest_b;
    vCount_uid296_zCount_uid142_rrx_uid32_fpCosPiTest_b <= GND_q;
    vCount_uid296_zCount_uid142_rrx_uid32_fpCosPiTest_q <= "1" when vCount_uid296_zCount_uid142_rrx_uid32_fpCosPiTest_a = vCount_uid296_zCount_uid142_rrx_uid32_fpCosPiTest_b else "0";

	--r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest(BITJOIN,296)@12
    r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_q <= reg_vCount_uid270_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_4_q & ld_vCount_uid278_zCount_uid142_rrx_uid32_fpCosPiTest_q_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_d_q & reg_vCount_uid284_zCount_uid142_rrx_uid32_fpCosPiTest_0_to_r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_2_q & vCount_uid290_zCount_uid142_rrx_uid32_fpCosPiTest_q & vCount_uid296_zCount_uid142_rrx_uid32_fpCosPiTest_q;

	--biasM1_uid60_fpCosPiTest(CONSTANT,59)
    biasM1_uid60_fpCosPiTest_q <= "01111110";

	--expCompOutExt_uid145_rrx_uid32_fpCosPiTest(SUB,144)@12
    expCompOutExt_uid145_rrx_uid32_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & biasM1_uid60_fpCosPiTest_q);
    expCompOutExt_uid145_rrx_uid32_fpCosPiTest_b <= STD_LOGIC_VECTOR("0000" & r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_q);
            expCompOutExt_uid145_rrx_uid32_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expCompOutExt_uid145_rrx_uid32_fpCosPiTest_a) - UNSIGNED(expCompOutExt_uid145_rrx_uid32_fpCosPiTest_b));
    expCompOutExt_uid145_rrx_uid32_fpCosPiTest_q <= expCompOutExt_uid145_rrx_uid32_fpCosPiTest_o(8 downto 0);


	--expCompOut_uid146_rrx_uid32_fpCosPiTest(BITSELECT,145)@12
    expCompOut_uid146_rrx_uid32_fpCosPiTest_in <= expCompOutExt_uid145_rrx_uid32_fpCosPiTest_q(7 downto 0);
    expCompOut_uid146_rrx_uid32_fpCosPiTest_b <= expCompOut_uid146_rrx_uid32_fpCosPiTest_in(7 downto 0);

	--reg_expCompOut_uid146_rrx_uid32_fpCosPiTest_0_to_finalExp_uid150_rrx_uid32_fpCosPiTest_2(REG,375)@12
    reg_expCompOut_uid146_rrx_uid32_fpCosPiTest_0_to_finalExp_uid150_rrx_uid32_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expCompOut_uid146_rrx_uid32_fpCosPiTest_0_to_finalExp_uid150_rrx_uid32_fpCosPiTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expCompOut_uid146_rrx_uid32_fpCosPiTest_0_to_finalExp_uid150_rrx_uid32_fpCosPiTest_2_q <= expCompOut_uid146_rrx_uid32_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--xBranch_uid132_rrx_uid32_fpCosPiTest(COMPARE,131)@0
    xBranch_uid132_rrx_uid32_fpCosPiTest_cin <= GND_q;
    xBranch_uid132_rrx_uid32_fpCosPiTest_a <= STD_LOGIC_VECTOR("00" & cstBiasMwShift_uid23_fpCosPiTest_q) & '0';
    xBranch_uid132_rrx_uid32_fpCosPiTest_b <= STD_LOGIC_VECTOR("00" & expX_uid127_rrx_uid32_fpCosPiTest_b) & xBranch_uid132_rrx_uid32_fpCosPiTest_cin(0);
    xBranch_uid132_rrx_uid32_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xBranch_uid132_rrx_uid32_fpCosPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                xBranch_uid132_rrx_uid32_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xBranch_uid132_rrx_uid32_fpCosPiTest_a) - UNSIGNED(xBranch_uid132_rrx_uid32_fpCosPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    xBranch_uid132_rrx_uid32_fpCosPiTest_n(0) <= not xBranch_uid132_rrx_uid32_fpCosPiTest_o(10);


	--ld_xBranch_uid132_rrx_uid32_fpCosPiTest_n_to_finalExp_uid150_rrx_uid32_fpCosPiTest_b(DELAY,538)@1
    ld_xBranch_uid132_rrx_uid32_fpCosPiTest_n_to_finalExp_uid150_rrx_uid32_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => xBranch_uid132_rrx_uid32_fpCosPiTest_n, xout => ld_xBranch_uid132_rrx_uid32_fpCosPiTest_n_to_finalExp_uid150_rrx_uid32_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--finalExp_uid150_rrx_uid32_fpCosPiTest(MUX,149)@13
    finalExp_uid150_rrx_uid32_fpCosPiTest_s <= ld_xBranch_uid132_rrx_uid32_fpCosPiTest_n_to_finalExp_uid150_rrx_uid32_fpCosPiTest_b_q;
    finalExp_uid150_rrx_uid32_fpCosPiTest: PROCESS (finalExp_uid150_rrx_uid32_fpCosPiTest_s, en, reg_expCompOut_uid146_rrx_uid32_fpCosPiTest_0_to_finalExp_uid150_rrx_uid32_fpCosPiTest_2_q, ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_q)
    BEGIN
            CASE finalExp_uid150_rrx_uid32_fpCosPiTest_s IS
                  WHEN "0" => finalExp_uid150_rrx_uid32_fpCosPiTest_q <= reg_expCompOut_uid146_rrx_uid32_fpCosPiTest_0_to_finalExp_uid150_rrx_uid32_fpCosPiTest_2_q;
                  WHEN "1" => finalExp_uid150_rrx_uid32_fpCosPiTest_q <= ld_expX_uid127_rrx_uid32_fpCosPiTest_b_to_finalExp_uid150_rrx_uid32_fpCosPiTest_d_replace_mem_q;
                  WHEN OTHERS => finalExp_uid150_rrx_uid32_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_finalExp_uid150_rrx_uid32_fpCosPiTest_q_to_RRangeRed_uid151_rrx_uid32_fpCosPiTest_b(DELAY,542)@13
    ld_finalExp_uid150_rrx_uid32_fpCosPiTest_q_to_RRangeRed_uid151_rrx_uid32_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => finalExp_uid150_rrx_uid32_fpCosPiTest_q, xout => ld_finalExp_uid150_rrx_uid32_fpCosPiTest_q_to_RRangeRed_uid151_rrx_uid32_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_nor(LOGICAL,861)
    ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_nor_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q;
    ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_nor_b <= ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_sticky_ena_q;
    ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_nor_q <= not (ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_nor_a or ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_nor_b);

	--ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_mem_top(CONSTANT,820)
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_mem_top_q <= "0111";

	--ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmp(LOGICAL,821)
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmp_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_mem_top_q;
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdmux_q);
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmp_q <= "1" when ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmp_a = ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmp_b else "0";

	--ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmpReg(REG,822)
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmpReg_q <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_sticky_ena(REG,862)
    ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_nor_q = "1") THEN
                ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_sticky_ena_q <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_enaAnd(LOGICAL,863)
    ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_enaAnd_a <= ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_sticky_ena_q;
    ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_enaAnd_b <= en;
    ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_enaAnd_q <= ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_enaAnd_a and ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_enaAnd_b;

	--ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_inputreg(DELAY,851)
    ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid128_rrx_uid32_fpCosPiTest_b, xout => ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdcnt(COUNTER,816)
    -- every=1, low=0, high=7, step=1, init=1
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdcnt_i <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdcnt_i,3));


	--ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdreg(REG,817)
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdreg_q <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdmux(MUX,818)
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdmux_s <= en;
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdmux: PROCESS (ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdmux_s, ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdreg_q, ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdmux_q <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdmux_q <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem(DUALMEM,852)
    ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_ia <= ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_inputreg_q;
    ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_aa <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdreg_q;
    ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_ab <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdmux_q;
    ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_iq,
        address_a => ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_aa,
        data_a => ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_ia
    );
    ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_reset0 <= areset;
        ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_q <= ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_iq(22 downto 0);

	--ZerosGB_uid147_rrx_uid32_fpCosPiTest(CONSTANT,146)
    ZerosGB_uid147_rrx_uid32_fpCosPiTest_q <= "000000000000000000000000000";

	--fracXRExt_uid148_rrx_uid32_fpCosPiTest(BITJOIN,147)@14
    fracXRExt_uid148_rrx_uid32_fpCosPiTest_q <= ld_fracX_uid128_rrx_uid32_fpCosPiTest_b_to_fracXRExt_uid148_rrx_uid32_fpCosPiTest_b_replace_mem_q & ZerosGB_uid147_rrx_uid32_fpCosPiTest_q;

	--LeftShiftStage174dto0_uid323_normMult_uid143_rrx_uid32_fpCosPiTest(BITSELECT,322)@13
    LeftShiftStage174dto0_uid323_normMult_uid143_rrx_uid32_fpCosPiTest_in <= leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_q(74 downto 0);
    LeftShiftStage174dto0_uid323_normMult_uid143_rrx_uid32_fpCosPiTest_b <= LeftShiftStage174dto0_uid323_normMult_uid143_rrx_uid32_fpCosPiTest_in(74 downto 0);

	--leftShiftStage2Idx1_uid324_normMult_uid143_rrx_uid32_fpCosPiTest(BITJOIN,323)@13
    leftShiftStage2Idx1_uid324_normMult_uid143_rrx_uid32_fpCosPiTest_q <= LeftShiftStage174dto0_uid323_normMult_uid143_rrx_uid32_fpCosPiTest_b & GND_q;

	--X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest(BITSELECT,306)@9
    X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_in <= multFracBits_uid140_rrx_uid32_fpCosPiTest_b(51 downto 0);
    X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_b <= X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_in(51 downto 0);

	--ld_X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg(DELAY,923)
    ld_X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1 )
    PORT MAP ( xin => X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_b, xout => ld_X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest_b(DELAY,691)@9
    ld_X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 52, depth => 2 )
    PORT MAP ( xin => ld_X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg_q, xout => ld_X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx3Pad24_uid306_normMult_uid143_rrx_uid32_fpCosPiTest(CONSTANT,305)
    leftShiftStage0Idx3Pad24_uid306_normMult_uid143_rrx_uid32_fpCosPiTest_q <= "000000000000000000000000";

	--leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest(BITJOIN,307)@12
    leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest_q <= ld_X51dto0_uid307_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest_b_q & leftShiftStage0Idx3Pad24_uid306_normMult_uid143_rrx_uid32_fpCosPiTest_q;

	--X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest(BITSELECT,303)@9
    X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_in <= multFracBits_uid140_rrx_uid32_fpCosPiTest_b(59 downto 0);
    X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_b <= X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_in(59 downto 0);

	--ld_X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg(DELAY,922)
    ld_X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 60, depth => 1 )
    PORT MAP ( xin => X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_b, xout => ld_X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest_b(DELAY,689)@9
    ld_X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 60, depth => 2 )
    PORT MAP ( xin => ld_X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg_q, xout => ld_X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest(BITJOIN,304)@12
    leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest_q <= ld_X59dto0_uid304_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest_b_q & zs_uid185_lzcZ_uid57_fpCosPiTest_q;

	--X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest(BITSELECT,300)@9
    X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_in <= multFracBits_uid140_rrx_uid32_fpCosPiTest_b(67 downto 0);
    X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_b <= X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_in(67 downto 0);

	--ld_X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg(DELAY,921)
    ld_X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 68, depth => 1 )
    PORT MAP ( xin => X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_b, xout => ld_X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest_b(DELAY,687)@9
    ld_X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 68, depth => 2 )
    PORT MAP ( xin => ld_X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest_b_inputreg_q, xout => ld_X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest(BITJOIN,301)@12
    leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest_q <= ld_X67dto0_uid301_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest_b_q & cstAllZwE_uid28_fpCosPiTest_q;

	--ld_multFracBits_uid140_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_c_inputreg(DELAY,924)
    ld_multFracBits_uid140_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 76, depth => 1 )
    PORT MAP ( xin => multFracBits_uid140_rrx_uid32_fpCosPiTest_b, xout => ld_multFracBits_uid140_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_multFracBits_uid140_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_c(DELAY,694)@9
    ld_multFracBits_uid140_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_c : dspba_delay
    GENERIC MAP ( width => 76, depth => 2 )
    PORT MAP ( xin => ld_multFracBits_uid140_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_c_inputreg_q, xout => ld_multFracBits_uid140_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStageSel4Dto3_uid309_normMult_uid143_rrx_uid32_fpCosPiTest(BITSELECT,308)@12
    leftShiftStageSel4Dto3_uid309_normMult_uid143_rrx_uid32_fpCosPiTest_in <= r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_q;
    leftShiftStageSel4Dto3_uid309_normMult_uid143_rrx_uid32_fpCosPiTest_b <= leftShiftStageSel4Dto3_uid309_normMult_uid143_rrx_uid32_fpCosPiTest_in(4 downto 3);

	--leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest(MUX,309)@12
    leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_s <= leftShiftStageSel4Dto3_uid309_normMult_uid143_rrx_uid32_fpCosPiTest_b;
    leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest: PROCESS (leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_s, en, ld_multFracBits_uid140_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_c_q, leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest_q, leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest_q, leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_q <= ld_multFracBits_uid140_rrx_uid32_fpCosPiTest_b_to_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_c_q;
                  WHEN "01" => leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_q <= leftShiftStage0Idx1_uid302_normMult_uid143_rrx_uid32_fpCosPiTest_q;
                  WHEN "10" => leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_q <= leftShiftStage0Idx2_uid305_normMult_uid143_rrx_uid32_fpCosPiTest_q;
                  WHEN "11" => leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_q <= leftShiftStage0Idx3_uid308_normMult_uid143_rrx_uid32_fpCosPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage069dto0_uid318_normMult_uid143_rrx_uid32_fpCosPiTest(BITSELECT,317)@12
    LeftShiftStage069dto0_uid318_normMult_uid143_rrx_uid32_fpCosPiTest_in <= leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_q(69 downto 0);
    LeftShiftStage069dto0_uid318_normMult_uid143_rrx_uid32_fpCosPiTest_b <= LeftShiftStage069dto0_uid318_normMult_uid143_rrx_uid32_fpCosPiTest_in(69 downto 0);

	--leftShiftStage1Idx3Pad6_uid317_normMult_uid143_rrx_uid32_fpCosPiTest(CONSTANT,316)
    leftShiftStage1Idx3Pad6_uid317_normMult_uid143_rrx_uid32_fpCosPiTest_q <= "000000";

	--leftShiftStage1Idx3_uid319_normMult_uid143_rrx_uid32_fpCosPiTest(BITJOIN,318)@12
    leftShiftStage1Idx3_uid319_normMult_uid143_rrx_uid32_fpCosPiTest_q <= LeftShiftStage069dto0_uid318_normMult_uid143_rrx_uid32_fpCosPiTest_b & leftShiftStage1Idx3Pad6_uid317_normMult_uid143_rrx_uid32_fpCosPiTest_q;

	--reg_leftShiftStage1Idx3_uid319_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_5(REG,373)@12
    reg_leftShiftStage1Idx3_uid319_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid319_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_5_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid319_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_5_q <= leftShiftStage1Idx3_uid319_normMult_uid143_rrx_uid32_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage071dto0_uid315_normMult_uid143_rrx_uid32_fpCosPiTest(BITSELECT,314)@12
    LeftShiftStage071dto0_uid315_normMult_uid143_rrx_uid32_fpCosPiTest_in <= leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_q(71 downto 0);
    LeftShiftStage071dto0_uid315_normMult_uid143_rrx_uid32_fpCosPiTest_b <= LeftShiftStage071dto0_uid315_normMult_uid143_rrx_uid32_fpCosPiTest_in(71 downto 0);

	--leftShiftStage1Idx2_uid316_normMult_uid143_rrx_uid32_fpCosPiTest(BITJOIN,315)@12
    leftShiftStage1Idx2_uid316_normMult_uid143_rrx_uid32_fpCosPiTest_q <= LeftShiftStage071dto0_uid315_normMult_uid143_rrx_uid32_fpCosPiTest_b & leftShiftStage0Idx1Pad4_uid154_fxpX_uid42_fpCosPiTest_q;

	--reg_leftShiftStage1Idx2_uid316_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_4(REG,372)@12
    reg_leftShiftStage1Idx2_uid316_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid316_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_4_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid316_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_4_q <= leftShiftStage1Idx2_uid316_normMult_uid143_rrx_uid32_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage073dto0_uid312_normMult_uid143_rrx_uid32_fpCosPiTest(BITSELECT,311)@12
    LeftShiftStage073dto0_uid312_normMult_uid143_rrx_uid32_fpCosPiTest_in <= leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_q(73 downto 0);
    LeftShiftStage073dto0_uid312_normMult_uid143_rrx_uid32_fpCosPiTest_b <= LeftShiftStage073dto0_uid312_normMult_uid143_rrx_uid32_fpCosPiTest_in(73 downto 0);

	--leftShiftStage1Idx1_uid313_normMult_uid143_rrx_uid32_fpCosPiTest(BITJOIN,312)@12
    leftShiftStage1Idx1_uid313_normMult_uid143_rrx_uid32_fpCosPiTest_q <= LeftShiftStage073dto0_uid312_normMult_uid143_rrx_uid32_fpCosPiTest_b & leftShiftStage1Idx2Pad2_uid168_fxpX_uid42_fpCosPiTest_q;

	--reg_leftShiftStage1Idx1_uid313_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_3(REG,371)@12
    reg_leftShiftStage1Idx1_uid313_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid313_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_3_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid313_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_3_q <= leftShiftStage1Idx1_uid313_normMult_uid143_rrx_uid32_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_2(REG,370)@12
    reg_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_2_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_2_q <= leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel2Dto1_uid320_normMult_uid143_rrx_uid32_fpCosPiTest(BITSELECT,319)@12
    leftShiftStageSel2Dto1_uid320_normMult_uid143_rrx_uid32_fpCosPiTest_in <= r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_q(2 downto 0);
    leftShiftStageSel2Dto1_uid320_normMult_uid143_rrx_uid32_fpCosPiTest_b <= leftShiftStageSel2Dto1_uid320_normMult_uid143_rrx_uid32_fpCosPiTest_in(2 downto 1);

	--reg_leftShiftStageSel2Dto1_uid320_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_1(REG,369)@12
    reg_leftShiftStageSel2Dto1_uid320_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel2Dto1_uid320_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel2Dto1_uid320_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_1_q <= leftShiftStageSel2Dto1_uid320_normMult_uid143_rrx_uid32_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest(MUX,320)@13
    leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_s <= reg_leftShiftStageSel2Dto1_uid320_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_1_q;
    leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest: PROCESS (leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_s, en, reg_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_2_q, reg_leftShiftStage1Idx1_uid313_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_3_q, reg_leftShiftStage1Idx2_uid316_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_4_q, reg_leftShiftStage1Idx3_uid319_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_q <= reg_leftShiftStage0_uid310_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_q <= reg_leftShiftStage1Idx1_uid313_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_3_q;
                  WHEN "10" => leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_q <= reg_leftShiftStage1Idx2_uid316_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_4_q;
                  WHEN "11" => leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_q <= reg_leftShiftStage1Idx3_uid319_normMult_uid143_rrx_uid32_fpCosPiTest_0_to_leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel0Dto0_uid325_normMult_uid143_rrx_uid32_fpCosPiTest(BITSELECT,324)@12
    leftShiftStageSel0Dto0_uid325_normMult_uid143_rrx_uid32_fpCosPiTest_in <= r_uid297_zCount_uid142_rrx_uid32_fpCosPiTest_q(0 downto 0);
    leftShiftStageSel0Dto0_uid325_normMult_uid143_rrx_uid32_fpCosPiTest_b <= leftShiftStageSel0Dto0_uid325_normMult_uid143_rrx_uid32_fpCosPiTest_in(0 downto 0);

	--ld_leftShiftStageSel0Dto0_uid325_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest_b(DELAY,713)@12
    ld_leftShiftStageSel0Dto0_uid325_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel0Dto0_uid325_normMult_uid143_rrx_uid32_fpCosPiTest_b, xout => ld_leftShiftStageSel0Dto0_uid325_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest(MUX,325)@13
    leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest_s <= ld_leftShiftStageSel0Dto0_uid325_normMult_uid143_rrx_uid32_fpCosPiTest_b_to_leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest_b_q;
    leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest: PROCESS (leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest_s, en, leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_q, leftShiftStage2Idx1_uid324_normMult_uid143_rrx_uid32_fpCosPiTest_q)
    BEGIN
            CASE leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest_s IS
                  WHEN "0" => leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest_q <= leftShiftStage1_uid321_normMult_uid143_rrx_uid32_fpCosPiTest_q;
                  WHEN "1" => leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest_q <= leftShiftStage2Idx1_uid324_normMult_uid143_rrx_uid32_fpCosPiTest_q;
                  WHEN OTHERS => leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracCompOut_uid144_rrx_uid32_fpCosPiTest(BITSELECT,143)@13
    fracCompOut_uid144_rrx_uid32_fpCosPiTest_in <= leftShiftStage2_uid326_normMult_uid143_rrx_uid32_fpCosPiTest_q(74 downto 0);
    fracCompOut_uid144_rrx_uid32_fpCosPiTest_b <= fracCompOut_uid144_rrx_uid32_fpCosPiTest_in(74 downto 25);

	--reg_fracCompOut_uid144_rrx_uid32_fpCosPiTest_0_to_finalFrac_uid149_rrx_uid32_fpCosPiTest_2(REG,374)@13
    reg_fracCompOut_uid144_rrx_uid32_fpCosPiTest_0_to_finalFrac_uid149_rrx_uid32_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracCompOut_uid144_rrx_uid32_fpCosPiTest_0_to_finalFrac_uid149_rrx_uid32_fpCosPiTest_2_q <= "00000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracCompOut_uid144_rrx_uid32_fpCosPiTest_0_to_finalFrac_uid149_rrx_uid32_fpCosPiTest_2_q <= fracCompOut_uid144_rrx_uid32_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBranch_uid132_rrx_uid32_fpCosPiTest_n_to_finalFrac_uid149_rrx_uid32_fpCosPiTest_b(DELAY,535)@1
    ld_xBranch_uid132_rrx_uid32_fpCosPiTest_n_to_finalFrac_uid149_rrx_uid32_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => xBranch_uid132_rrx_uid32_fpCosPiTest_n, xout => ld_xBranch_uid132_rrx_uid32_fpCosPiTest_n_to_finalFrac_uid149_rrx_uid32_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--finalFrac_uid149_rrx_uid32_fpCosPiTest(MUX,148)@14
    finalFrac_uid149_rrx_uid32_fpCosPiTest_s <= ld_xBranch_uid132_rrx_uid32_fpCosPiTest_n_to_finalFrac_uid149_rrx_uid32_fpCosPiTest_b_q;
    finalFrac_uid149_rrx_uid32_fpCosPiTest: PROCESS (finalFrac_uid149_rrx_uid32_fpCosPiTest_s, en, reg_fracCompOut_uid144_rrx_uid32_fpCosPiTest_0_to_finalFrac_uid149_rrx_uid32_fpCosPiTest_2_q, fracXRExt_uid148_rrx_uid32_fpCosPiTest_q)
    BEGIN
            CASE finalFrac_uid149_rrx_uid32_fpCosPiTest_s IS
                  WHEN "0" => finalFrac_uid149_rrx_uid32_fpCosPiTest_q <= reg_fracCompOut_uid144_rrx_uid32_fpCosPiTest_0_to_finalFrac_uid149_rrx_uid32_fpCosPiTest_2_q;
                  WHEN "1" => finalFrac_uid149_rrx_uid32_fpCosPiTest_q <= fracXRExt_uid148_rrx_uid32_fpCosPiTest_q;
                  WHEN OTHERS => finalFrac_uid149_rrx_uid32_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RRangeRed_uid151_rrx_uid32_fpCosPiTest(BITJOIN,150)@14
    RRangeRed_uid151_rrx_uid32_fpCosPiTest_q <= GND_q & ld_finalExp_uid150_rrx_uid32_fpCosPiTest_q_to_RRangeRed_uid151_rrx_uid32_fpCosPiTest_b_q & finalFrac_uid149_rrx_uid32_fpCosPiTest_q;

	--expXRR_uid34_fpCosPiTest(BITSELECT,33)@14
    expXRR_uid34_fpCosPiTest_in <= RRangeRed_uid151_rrx_uid32_fpCosPiTest_q(57 downto 0);
    expXRR_uid34_fpCosPiTest_b <= expXRR_uid34_fpCosPiTest_in(57 downto 50);

	--cstBiasMwShiftM2_uid24_fpCosPiTest(CONSTANT,23)
    cstBiasMwShiftM2_uid24_fpCosPiTest_q <= "01110000";

	--cosXIsOneXRR_uid37_fpCosPiTest(COMPARE,36)@14
    cosXIsOneXRR_uid37_fpCosPiTest_cin <= GND_q;
    cosXIsOneXRR_uid37_fpCosPiTest_a <= STD_LOGIC_VECTOR('0' & "00" & cstBiasMwShiftM2_uid24_fpCosPiTest_q) & '0';
    cosXIsOneXRR_uid37_fpCosPiTest_b <= STD_LOGIC_VECTOR((10 downto 8 => expXRR_uid34_fpCosPiTest_b(7)) & expXRR_uid34_fpCosPiTest_b) & cosXIsOneXRR_uid37_fpCosPiTest_cin(0);
            cosXIsOneXRR_uid37_fpCosPiTest_o <= STD_LOGIC_VECTOR(SIGNED(cosXIsOneXRR_uid37_fpCosPiTest_a) - SIGNED(cosXIsOneXRR_uid37_fpCosPiTest_b));
    cosXIsOneXRR_uid37_fpCosPiTest_n(0) <= not cosXIsOneXRR_uid37_fpCosPiTest_o(11);


	--exp_uid11_fpCosPiTest(BITSELECT,10)@0
    exp_uid11_fpCosPiTest_in <= a(30 downto 0);
    exp_uid11_fpCosPiTest_b <= exp_uid11_fpCosPiTest_in(30 downto 23);

	--cosXIsOne_uid36_fpCosPiTest(COMPARE,35)@0
    cosXIsOne_uid36_fpCosPiTest_cin <= GND_q;
    cosXIsOne_uid36_fpCosPiTest_a <= STD_LOGIC_VECTOR("00" & cstBiasMwShift_uid23_fpCosPiTest_q) & '0';
    cosXIsOne_uid36_fpCosPiTest_b <= STD_LOGIC_VECTOR("00" & exp_uid11_fpCosPiTest_b) & cosXIsOne_uid36_fpCosPiTest_cin(0);
            cosXIsOne_uid36_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(cosXIsOne_uid36_fpCosPiTest_a) - UNSIGNED(cosXIsOne_uid36_fpCosPiTest_b));
    cosXIsOne_uid36_fpCosPiTest_n(0) <= not cosXIsOne_uid36_fpCosPiTest_o(10);


	--ld_cosXIsOne_uid36_fpCosPiTest_n_to_cosXOne_uid91_fpCosPiTest_a(DELAY,496)@0
    ld_cosXIsOne_uid36_fpCosPiTest_n_to_cosXOne_uid91_fpCosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => cosXIsOne_uid36_fpCosPiTest_n, xout => ld_cosXIsOne_uid36_fpCosPiTest_n_to_cosXOne_uid91_fpCosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--cosXOne_uid91_fpCosPiTest(LOGICAL,90)@14
    cosXOne_uid91_fpCosPiTest_a <= ld_cosXIsOne_uid36_fpCosPiTest_n_to_cosXOne_uid91_fpCosPiTest_a_q;
    cosXOne_uid91_fpCosPiTest_b <= cosXIsOneXRR_uid37_fpCosPiTest_n;
    cosXOne_uid91_fpCosPiTest_q <= cosXOne_uid91_fpCosPiTest_a or cosXOne_uid91_fpCosPiTest_b;

	--ld_cosXOne_uid91_fpCosPiTest_q_to_InvCosXOne_uid92_fpCosPiTest_a(DELAY,498)@14
    ld_cosXOne_uid91_fpCosPiTest_q_to_InvCosXOne_uid92_fpCosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => cosXOne_uid91_fpCosPiTest_q, xout => ld_cosXOne_uid91_fpCosPiTest_q_to_InvCosXOne_uid92_fpCosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--InvCosXOne_uid92_fpCosPiTest(LOGICAL,91)@17
    InvCosXOne_uid92_fpCosPiTest_a <= ld_cosXOne_uid91_fpCosPiTest_q_to_InvCosXOne_uid92_fpCosPiTest_a_q;
    InvCosXOne_uid92_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvCosXOne_uid92_fpCosPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvCosXOne_uid92_fpCosPiTest_q <= not InvCosXOne_uid92_fpCosPiTest_a;
        END IF;
    END PROCESS;



	--X52dto0_uid161_fxpX_uid42_fpCosPiTest(BITSELECT,160)@15
    X52dto0_uid161_fxpX_uid42_fpCosPiTest_in <= extendedFracX_uid41_fpCosPiTest_q(52 downto 0);
    X52dto0_uid161_fxpX_uid42_fpCosPiTest_b <= X52dto0_uid161_fxpX_uid42_fpCosPiTest_in(52 downto 0);

	--leftShiftStage0Idx3Pad12_uid160_fxpX_uid42_fpCosPiTest(CONSTANT,159)
    leftShiftStage0Idx3Pad12_uid160_fxpX_uid42_fpCosPiTest_q <= "000000000000";

	--leftShiftStage0Idx3_uid162_fxpX_uid42_fpCosPiTest(BITJOIN,161)@15
    leftShiftStage0Idx3_uid162_fxpX_uid42_fpCosPiTest_q <= X52dto0_uid161_fxpX_uid42_fpCosPiTest_b & leftShiftStage0Idx3Pad12_uid160_fxpX_uid42_fpCosPiTest_q;

	--X56dto0_uid158_fxpX_uid42_fpCosPiTest(BITSELECT,157)@15
    X56dto0_uid158_fxpX_uid42_fpCosPiTest_in <= extendedFracX_uid41_fpCosPiTest_q(56 downto 0);
    X56dto0_uid158_fxpX_uid42_fpCosPiTest_b <= X56dto0_uid158_fxpX_uid42_fpCosPiTest_in(56 downto 0);

	--leftShiftStage0Idx2_uid159_fxpX_uid42_fpCosPiTest(BITJOIN,158)@15
    leftShiftStage0Idx2_uid159_fxpX_uid42_fpCosPiTest_q <= X56dto0_uid158_fxpX_uid42_fpCosPiTest_b & cstAllZwE_uid28_fpCosPiTest_q;

	--X60dto0_uid155_fxpX_uid42_fpCosPiTest(BITSELECT,154)@15
    X60dto0_uid155_fxpX_uid42_fpCosPiTest_in <= extendedFracX_uid41_fpCosPiTest_q(60 downto 0);
    X60dto0_uid155_fxpX_uid42_fpCosPiTest_b <= X60dto0_uid155_fxpX_uid42_fpCosPiTest_in(60 downto 0);

	--leftShiftStage0Idx1_uid156_fxpX_uid42_fpCosPiTest(BITJOIN,155)@15
    leftShiftStage0Idx1_uid156_fxpX_uid42_fpCosPiTest_q <= X60dto0_uid155_fxpX_uid42_fpCosPiTest_b & leftShiftStage0Idx1Pad4_uid154_fxpX_uid42_fpCosPiTest_q;

	--cstZwShiftP1_uid25_fpCosPiTest(CONSTANT,24)
    cstZwShiftP1_uid25_fpCosPiTest_q <= "00000000000000";

	--fracXRR_uid35_fpCosPiTest(BITSELECT,34)@14
    fracXRR_uid35_fpCosPiTest_in <= RRangeRed_uid151_rrx_uid32_fpCosPiTest_q(49 downto 0);
    fracXRR_uid35_fpCosPiTest_b <= fracXRR_uid35_fpCosPiTest_in(49 downto 0);

	--ld_fracXRR_uid35_fpCosPiTest_b_to_oFracXRR_uid38_uid38_fpCosPiTest_a(DELAY,434)@14
    ld_fracXRR_uid35_fpCosPiTest_b_to_oFracXRR_uid38_uid38_fpCosPiTest_a : dspba_delay
    GENERIC MAP ( width => 50, depth => 1 )
    PORT MAP ( xin => fracXRR_uid35_fpCosPiTest_b, xout => ld_fracXRR_uid35_fpCosPiTest_b_to_oFracXRR_uid38_uid38_fpCosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--oFracXRR_uid38_uid38_fpCosPiTest(BITJOIN,37)@15
    oFracXRR_uid38_uid38_fpCosPiTest_q <= VCC_q & ld_fracXRR_uid35_fpCosPiTest_b_to_oFracXRR_uid38_uid38_fpCosPiTest_a_q;

	--extendedFracX_uid41_fpCosPiTest(BITJOIN,40)@15
    extendedFracX_uid41_fpCosPiTest_q <= cstZwShiftP1_uid25_fpCosPiTest_q & oFracXRR_uid38_uid38_fpCosPiTest_q;

	--fxpXShiftValExt_uid39_fpCosPiTest(SUB,38)@14
    fxpXShiftValExt_uid39_fpCosPiTest_a <= STD_LOGIC_VECTOR((10 downto 8 => expXRR_uid34_fpCosPiTest_b(7)) & expXRR_uid34_fpCosPiTest_b);
    fxpXShiftValExt_uid39_fpCosPiTest_b <= STD_LOGIC_VECTOR('0' & "00" & cstBiasMwShiftM2_uid24_fpCosPiTest_q);
            fxpXShiftValExt_uid39_fpCosPiTest_o <= STD_LOGIC_VECTOR(SIGNED(fxpXShiftValExt_uid39_fpCosPiTest_a) - SIGNED(fxpXShiftValExt_uid39_fpCosPiTest_b));
    fxpXShiftValExt_uid39_fpCosPiTest_q <= fxpXShiftValExt_uid39_fpCosPiTest_o(9 downto 0);


	--fxpXShiftVal_uid40_fpCosPiTest(BITSELECT,39)@14
    fxpXShiftVal_uid40_fpCosPiTest_in <= fxpXShiftValExt_uid39_fpCosPiTest_q(3 downto 0);
    fxpXShiftVal_uid40_fpCosPiTest_b <= fxpXShiftVal_uid40_fpCosPiTest_in(3 downto 0);

	--leftShiftStageSel3Dto2_uid163_fxpX_uid42_fpCosPiTest(BITSELECT,162)@14
    leftShiftStageSel3Dto2_uid163_fxpX_uid42_fpCosPiTest_in <= fxpXShiftVal_uid40_fpCosPiTest_b;
    leftShiftStageSel3Dto2_uid163_fxpX_uid42_fpCosPiTest_b <= leftShiftStageSel3Dto2_uid163_fxpX_uid42_fpCosPiTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid163_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_1(REG,376)@14
    reg_leftShiftStageSel3Dto2_uid163_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid163_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid163_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_1_q <= leftShiftStageSel3Dto2_uid163_fxpX_uid42_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest(MUX,163)@15
    leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_s <= reg_leftShiftStageSel3Dto2_uid163_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_1_q;
    leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest: PROCESS (leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_s, en, extendedFracX_uid41_fpCosPiTest_q, leftShiftStage0Idx1_uid156_fxpX_uid42_fpCosPiTest_q, leftShiftStage0Idx2_uid159_fxpX_uid42_fpCosPiTest_q, leftShiftStage0Idx3_uid162_fxpX_uid42_fpCosPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_q <= extendedFracX_uid41_fpCosPiTest_q;
                  WHEN "01" => leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_q <= leftShiftStage0Idx1_uid156_fxpX_uid42_fpCosPiTest_q;
                  WHEN "10" => leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_q <= leftShiftStage0Idx2_uid159_fxpX_uid42_fpCosPiTest_q;
                  WHEN "11" => leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_q <= leftShiftStage0Idx3_uid162_fxpX_uid42_fpCosPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage061dto0_uid172_fxpX_uid42_fpCosPiTest(BITSELECT,171)@15
    LeftShiftStage061dto0_uid172_fxpX_uid42_fpCosPiTest_in <= leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_q(61 downto 0);
    LeftShiftStage061dto0_uid172_fxpX_uid42_fpCosPiTest_b <= LeftShiftStage061dto0_uid172_fxpX_uid42_fpCosPiTest_in(61 downto 0);

	--ld_LeftShiftStage061dto0_uid172_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx3_uid173_fxpX_uid42_fpCosPiTest_b(DELAY,560)@15
    ld_LeftShiftStage061dto0_uid172_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx3_uid173_fxpX_uid42_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 62, depth => 1 )
    PORT MAP ( xin => LeftShiftStage061dto0_uid172_fxpX_uid42_fpCosPiTest_b, xout => ld_LeftShiftStage061dto0_uid172_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx3_uid173_fxpX_uid42_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx3Pad3_uid171_fxpX_uid42_fpCosPiTest(CONSTANT,170)
    leftShiftStage1Idx3Pad3_uid171_fxpX_uid42_fpCosPiTest_q <= "000";

	--leftShiftStage1Idx3_uid173_fxpX_uid42_fpCosPiTest(BITJOIN,172)@16
    leftShiftStage1Idx3_uid173_fxpX_uid42_fpCosPiTest_q <= ld_LeftShiftStage061dto0_uid172_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx3_uid173_fxpX_uid42_fpCosPiTest_b_q & leftShiftStage1Idx3Pad3_uid171_fxpX_uid42_fpCosPiTest_q;

	--LeftShiftStage062dto0_uid169_fxpX_uid42_fpCosPiTest(BITSELECT,168)@15
    LeftShiftStage062dto0_uid169_fxpX_uid42_fpCosPiTest_in <= leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_q(62 downto 0);
    LeftShiftStage062dto0_uid169_fxpX_uid42_fpCosPiTest_b <= LeftShiftStage062dto0_uid169_fxpX_uid42_fpCosPiTest_in(62 downto 0);

	--ld_LeftShiftStage062dto0_uid169_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx2_uid170_fxpX_uid42_fpCosPiTest_b(DELAY,558)@15
    ld_LeftShiftStage062dto0_uid169_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx2_uid170_fxpX_uid42_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 63, depth => 1 )
    PORT MAP ( xin => LeftShiftStage062dto0_uid169_fxpX_uid42_fpCosPiTest_b, xout => ld_LeftShiftStage062dto0_uid169_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx2_uid170_fxpX_uid42_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx2_uid170_fxpX_uid42_fpCosPiTest(BITJOIN,169)@16
    leftShiftStage1Idx2_uid170_fxpX_uid42_fpCosPiTest_q <= ld_LeftShiftStage062dto0_uid169_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx2_uid170_fxpX_uid42_fpCosPiTest_b_q & leftShiftStage1Idx2Pad2_uid168_fxpX_uid42_fpCosPiTest_q;

	--LeftShiftStage063dto0_uid166_fxpX_uid42_fpCosPiTest(BITSELECT,165)@15
    LeftShiftStage063dto0_uid166_fxpX_uid42_fpCosPiTest_in <= leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_q(63 downto 0);
    LeftShiftStage063dto0_uid166_fxpX_uid42_fpCosPiTest_b <= LeftShiftStage063dto0_uid166_fxpX_uid42_fpCosPiTest_in(63 downto 0);

	--ld_LeftShiftStage063dto0_uid166_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx1_uid167_fxpX_uid42_fpCosPiTest_b(DELAY,556)@15
    ld_LeftShiftStage063dto0_uid166_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx1_uid167_fxpX_uid42_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 64, depth => 1 )
    PORT MAP ( xin => LeftShiftStage063dto0_uid166_fxpX_uid42_fpCosPiTest_b, xout => ld_LeftShiftStage063dto0_uid166_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx1_uid167_fxpX_uid42_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx1_uid167_fxpX_uid42_fpCosPiTest(BITJOIN,166)@16
    leftShiftStage1Idx1_uid167_fxpX_uid42_fpCosPiTest_q <= ld_LeftShiftStage063dto0_uid166_fxpX_uid42_fpCosPiTest_b_to_leftShiftStage1Idx1_uid167_fxpX_uid42_fpCosPiTest_b_q & GND_q;

	--reg_leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_2(REG,378)@15
    reg_leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_2_q <= leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest(BITSELECT,173)@14
    leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_in <= fxpXShiftVal_uid40_fpCosPiTest_b(1 downto 0);
    leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_b <= leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_in(1 downto 0);

	--ld_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_b_to_reg_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_1_a(DELAY,771)@14
    ld_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_b_to_reg_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_b, xout => ld_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_b_to_reg_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_1(REG,377)@15
    reg_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_1_q <= ld_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_b_to_reg_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest(MUX,174)@16
    leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_s <= reg_leftShiftStageSel1Dto0_uid174_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_1_q;
    leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest: PROCESS (leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_s, en, reg_leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_2_q, leftShiftStage1Idx1_uid167_fxpX_uid42_fpCosPiTest_q, leftShiftStage1Idx2_uid170_fxpX_uid42_fpCosPiTest_q, leftShiftStage1Idx3_uid173_fxpX_uid42_fpCosPiTest_q)
    BEGIN
            CASE leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_q <= reg_leftShiftStage0_uid164_fxpX_uid42_fpCosPiTest_0_to_leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_q <= leftShiftStage1Idx1_uid167_fxpX_uid42_fpCosPiTest_q;
                  WHEN "10" => leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_q <= leftShiftStage1Idx2_uid170_fxpX_uid42_fpCosPiTest_q;
                  WHEN "11" => leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_q <= leftShiftStage1Idx3_uid173_fxpX_uid42_fpCosPiTest_q;
                  WHEN OTHERS => leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--y_uid44_fpCosPiTest(BITSELECT,43)@16
    y_uid44_fpCosPiTest_in <= leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_q(63 downto 0);
    y_uid44_fpCosPiTest_b <= y_uid44_fpCosPiTest_in(63 downto 1);

	--ld_y_uid44_fpCosPiTest_b_to_cmpYToOneMinusY_uid51_fpCosPiTest_b(DELAY,446)@16
    ld_y_uid44_fpCosPiTest_b_to_cmpYToOneMinusY_uid51_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 63, depth => 2 )
    PORT MAP ( xin => y_uid44_fpCosPiTest_b, xout => ld_y_uid44_fpCosPiTest_b_to_cmpYToOneMinusY_uid51_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--reg_y_uid44_fpCosPiTest_0_to_yIsHalf_uid48_fpCosPiTest_1(REG,379)@16
    reg_y_uid44_fpCosPiTest_0_to_yIsHalf_uid48_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_y_uid44_fpCosPiTest_0_to_yIsHalf_uid48_fpCosPiTest_1_q <= "000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_y_uid44_fpCosPiTest_0_to_yIsHalf_uid48_fpCosPiTest_1_q <= y_uid44_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--pad_one_uid49_fpCosPiTest(BITJOIN,48)@16
    pad_one_uid49_fpCosPiTest_q <= VCC_q & STD_LOGIC_VECTOR((62 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_one_uid49_fpCosPiTest_0_to_oneMinusY_uid49_fpCosPiTest_0(REG,384)@16
    reg_pad_one_uid49_fpCosPiTest_0_to_oneMinusY_uid49_fpCosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_one_uid49_fpCosPiTest_0_to_oneMinusY_uid49_fpCosPiTest_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_one_uid49_fpCosPiTest_0_to_oneMinusY_uid49_fpCosPiTest_0_q <= pad_one_uid49_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--oneMinusY_uid49_fpCosPiTest(SUB,49)@17
    oneMinusY_uid49_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & reg_pad_one_uid49_fpCosPiTest_0_to_oneMinusY_uid49_fpCosPiTest_0_q);
    oneMinusY_uid49_fpCosPiTest_b <= STD_LOGIC_VECTOR("00" & reg_y_uid44_fpCosPiTest_0_to_yIsHalf_uid48_fpCosPiTest_1_q);
            oneMinusY_uid49_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oneMinusY_uid49_fpCosPiTest_a) - UNSIGNED(oneMinusY_uid49_fpCosPiTest_b));
    oneMinusY_uid49_fpCosPiTest_q <= oneMinusY_uid49_fpCosPiTest_o(64 downto 0);


	--reg_oneMinusY_uid49_fpCosPiTest_0_to_cmpYToOneMinusY_uid51_fpCosPiTest_0(REG,386)@17
    reg_oneMinusY_uid49_fpCosPiTest_0_to_cmpYToOneMinusY_uid51_fpCosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oneMinusY_uid49_fpCosPiTest_0_to_cmpYToOneMinusY_uid51_fpCosPiTest_0_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oneMinusY_uid49_fpCosPiTest_0_to_cmpYToOneMinusY_uid51_fpCosPiTest_0_q <= oneMinusY_uid49_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--cmpYToOneMinusY_uid51_fpCosPiTest(COMPARE,50)@18
    cmpYToOneMinusY_uid51_fpCosPiTest_cin <= GND_q;
    cmpYToOneMinusY_uid51_fpCosPiTest_a <= STD_LOGIC_VECTOR("00" & reg_oneMinusY_uid49_fpCosPiTest_0_to_cmpYToOneMinusY_uid51_fpCosPiTest_0_q) & '0';
    cmpYToOneMinusY_uid51_fpCosPiTest_b <= STD_LOGIC_VECTOR("0000" & ld_y_uid44_fpCosPiTest_b_to_cmpYToOneMinusY_uid51_fpCosPiTest_b_q) & cmpYToOneMinusY_uid51_fpCosPiTest_cin(0);
            cmpYToOneMinusY_uid51_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(cmpYToOneMinusY_uid51_fpCosPiTest_a) - UNSIGNED(cmpYToOneMinusY_uid51_fpCosPiTest_b));
    cmpYToOneMinusY_uid51_fpCosPiTest_c(0) <= cmpYToOneMinusY_uid51_fpCosPiTest_o(67);


	--InvCmpYToOneMinusY_uid52_fpCosPiTest(LOGICAL,51)@18
    InvCmpYToOneMinusY_uid52_fpCosPiTest_a <= cmpYToOneMinusY_uid51_fpCosPiTest_c;
    InvCmpYToOneMinusY_uid52_fpCosPiTest_q <= not InvCmpYToOneMinusY_uid52_fpCosPiTest_a;

	--intXParity_uid43_fpCosPiTest(BITSELECT,42)@16
    intXParity_uid43_fpCosPiTest_in <= leftShiftStage1_uid175_fxpX_uid42_fpCosPiTest_q;
    intXParity_uid43_fpCosPiTest_b <= intXParity_uid43_fpCosPiTest_in(64 downto 64);

	--ld_intXParity_uid43_fpCosPiTest_b_to_signRCond2_uid95_fpCosPiTest_b(DELAY,501)@16
    ld_intXParity_uid43_fpCosPiTest_b_to_signRCond2_uid95_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => intXParity_uid43_fpCosPiTest_b, xout => ld_intXParity_uid43_fpCosPiTest_b_to_signRCond2_uid95_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--yIsZero_uid45_fpCosPiTest(LOGICAL,44)@17
    yIsZero_uid45_fpCosPiTest_a <= reg_y_uid44_fpCosPiTest_0_to_yIsHalf_uid48_fpCosPiTest_1_q;
    yIsZero_uid45_fpCosPiTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000000000000000000000000000000000" & GND_q);
    yIsZero_uid45_fpCosPiTest_q <= "1" when yIsZero_uid45_fpCosPiTest_a = yIsZero_uid45_fpCosPiTest_b else "0";

	--ld_yIsZero_uid45_fpCosPiTest_q_to_InvYIsZero_uid94_fpCosPiTest_a(DELAY,499)@17
    ld_yIsZero_uid45_fpCosPiTest_q_to_InvYIsZero_uid94_fpCosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => yIsZero_uid45_fpCosPiTest_q, xout => ld_yIsZero_uid45_fpCosPiTest_q_to_InvYIsZero_uid94_fpCosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvYIsZero_uid94_fpCosPiTest(LOGICAL,93)@18
    InvYIsZero_uid94_fpCosPiTest_a <= ld_yIsZero_uid45_fpCosPiTest_q_to_InvYIsZero_uid94_fpCosPiTest_a_q;
    InvYIsZero_uid94_fpCosPiTest_q <= not InvYIsZero_uid94_fpCosPiTest_a;

	--signRCond2_uid95_fpCosPiTest(LOGICAL,94)@18
    signRCond2_uid95_fpCosPiTest_a <= InvYIsZero_uid94_fpCosPiTest_q;
    signRCond2_uid95_fpCosPiTest_b <= ld_intXParity_uid43_fpCosPiTest_b_to_signRCond2_uid95_fpCosPiTest_b_q;
    signRCond2_uid95_fpCosPiTest_c <= InvCmpYToOneMinusY_uid52_fpCosPiTest_q;
    signRCond2_uid95_fpCosPiTest_d <= InvCosXOne_uid92_fpCosPiTest_q;
    signRCond2_uid95_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signRCond2_uid95_fpCosPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            signRCond2_uid95_fpCosPiTest_q <= signRCond2_uid95_fpCosPiTest_a and signRCond2_uid95_fpCosPiTest_b and signRCond2_uid95_fpCosPiTest_c and signRCond2_uid95_fpCosPiTest_d;
        END IF;
        END IF;
    END PROCESS;



	--InvIntXParity_uid98_fpCosPiTest(LOGICAL,97)@18
    InvIntXParity_uid98_fpCosPiTest_a <= ld_intXParity_uid43_fpCosPiTest_b_to_signRCond2_uid95_fpCosPiTest_b_q;
    InvIntXParity_uid98_fpCosPiTest_q <= not InvIntXParity_uid98_fpCosPiTest_a;

	--signRCond1_uid100_fpCosPiTest(LOGICAL,99)@18
    signRCond1_uid100_fpCosPiTest_a <= InvYIsZero_uid94_fpCosPiTest_q;
    signRCond1_uid100_fpCosPiTest_b <= InvIntXParity_uid98_fpCosPiTest_q;
    signRCond1_uid100_fpCosPiTest_c <= cmpYToOneMinusY_uid51_fpCosPiTest_c;
    signRCond1_uid100_fpCosPiTest_d <= InvCosXOne_uid92_fpCosPiTest_q;
    signRCond1_uid100_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signRCond1_uid100_fpCosPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            signRCond1_uid100_fpCosPiTest_q <= signRCond1_uid100_fpCosPiTest_a and signRCond1_uid100_fpCosPiTest_b and signRCond1_uid100_fpCosPiTest_c and signRCond1_uid100_fpCosPiTest_d;
        END IF;
        END IF;
    END PROCESS;



	--signR_uid101_fpCosPiTest(LOGICAL,100)@19
    signR_uid101_fpCosPiTest_a <= signRCond1_uid100_fpCosPiTest_q;
    signR_uid101_fpCosPiTest_b <= signRCond2_uid95_fpCosPiTest_q;
    signR_uid101_fpCosPiTest_q <= signR_uid101_fpCosPiTest_a or signR_uid101_fpCosPiTest_b;

	--cstAllZWF_uid7_fpCosPiTest(CONSTANT,6)
    cstAllZWF_uid7_fpCosPiTest_q <= "00000000000000000000000";

	--frac_uid13_fpCosPiTest(BITSELECT,12)@0
    frac_uid13_fpCosPiTest_in <= a(22 downto 0);
    frac_uid13_fpCosPiTest_b <= frac_uid13_fpCosPiTest_in(22 downto 0);

	--fracXIsZero_uid14_fpCosPiTest(LOGICAL,13)@0
    fracXIsZero_uid14_fpCosPiTest_a <= frac_uid13_fpCosPiTest_b;
    fracXIsZero_uid14_fpCosPiTest_b <= cstAllZWF_uid7_fpCosPiTest_q;
    fracXIsZero_uid14_fpCosPiTest_q <= "1" when fracXIsZero_uid14_fpCosPiTest_a = fracXIsZero_uid14_fpCosPiTest_b else "0";

	--cstAllOWE_uid6_fpCosPiTest(CONSTANT,5)
    cstAllOWE_uid6_fpCosPiTest_q <= "11111111";

	--expXIsMax_uid12_fpCosPiTest(LOGICAL,11)@0
    expXIsMax_uid12_fpCosPiTest_a <= exp_uid11_fpCosPiTest_b;
    expXIsMax_uid12_fpCosPiTest_b <= cstAllOWE_uid6_fpCosPiTest_q;
    expXIsMax_uid12_fpCosPiTest_q <= "1" when expXIsMax_uid12_fpCosPiTest_a = expXIsMax_uid12_fpCosPiTest_b else "0";

	--exc_I_uid15_fpCosPiTest(LOGICAL,14)@0
    exc_I_uid15_fpCosPiTest_a <= expXIsMax_uid12_fpCosPiTest_q;
    exc_I_uid15_fpCosPiTest_b <= fracXIsZero_uid14_fpCosPiTest_q;
    exc_I_uid15_fpCosPiTest_q <= exc_I_uid15_fpCosPiTest_a and exc_I_uid15_fpCosPiTest_b;

	--ld_exc_I_uid15_fpCosPiTest_q_to_InvExc_I_uid102_fpCosPiTest_a(DELAY,511)@0
    ld_exc_I_uid15_fpCosPiTest_q_to_InvExc_I_uid102_fpCosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 18 )
    PORT MAP ( xin => exc_I_uid15_fpCosPiTest_q, xout => ld_exc_I_uid15_fpCosPiTest_q_to_InvExc_I_uid102_fpCosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_I_uid102_fpCosPiTest(LOGICAL,101)@18
    InvExc_I_uid102_fpCosPiTest_a <= ld_exc_I_uid15_fpCosPiTest_q_to_InvExc_I_uid102_fpCosPiTest_a_q;
    InvExc_I_uid102_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExc_I_uid102_fpCosPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvExc_I_uid102_fpCosPiTest_q <= not InvExc_I_uid102_fpCosPiTest_a;
        END IF;
    END PROCESS;



	--InvFracXIsZero_uid16_fpCosPiTest(LOGICAL,15)@0
    InvFracXIsZero_uid16_fpCosPiTest_a <= fracXIsZero_uid14_fpCosPiTest_q;
    InvFracXIsZero_uid16_fpCosPiTest_q <= not InvFracXIsZero_uid16_fpCosPiTest_a;

	--exc_N_uid17_fpCosPiTest(LOGICAL,16)@0
    exc_N_uid17_fpCosPiTest_a <= expXIsMax_uid12_fpCosPiTest_q;
    exc_N_uid17_fpCosPiTest_b <= InvFracXIsZero_uid16_fpCosPiTest_q;
    exc_N_uid17_fpCosPiTest_q <= exc_N_uid17_fpCosPiTest_a and exc_N_uid17_fpCosPiTest_b;

	--InvExc_N_uid103_fpCosPiTest(LOGICAL,102)@0
    InvExc_N_uid103_fpCosPiTest_a <= exc_N_uid17_fpCosPiTest_q;
    InvExc_N_uid103_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExc_N_uid103_fpCosPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvExc_N_uid103_fpCosPiTest_q <= not InvExc_N_uid103_fpCosPiTest_a;
        END IF;
    END PROCESS;



	--ld_InvExc_N_uid103_fpCosPiTest_q_to_signRNotNaNOrInf_uid104_fpCosPiTest_a(DELAY,513)@1
    ld_InvExc_N_uid103_fpCosPiTest_q_to_signRNotNaNOrInf_uid104_fpCosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 18 )
    PORT MAP ( xin => InvExc_N_uid103_fpCosPiTest_q, xout => ld_InvExc_N_uid103_fpCosPiTest_q_to_signRNotNaNOrInf_uid104_fpCosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signRNotNaNOrInf_uid104_fpCosPiTest(LOGICAL,103)@19
    signRNotNaNOrInf_uid104_fpCosPiTest_a <= ld_InvExc_N_uid103_fpCosPiTest_q_to_signRNotNaNOrInf_uid104_fpCosPiTest_a_q;
    signRNotNaNOrInf_uid104_fpCosPiTest_b <= InvExc_I_uid102_fpCosPiTest_q;
    signRNotNaNOrInf_uid104_fpCosPiTest_c <= signR_uid101_fpCosPiTest_q;
    signRNotNaNOrInf_uid104_fpCosPiTest_q <= signRNotNaNOrInf_uid104_fpCosPiTest_a and signRNotNaNOrInf_uid104_fpCosPiTest_b and signRNotNaNOrInf_uid104_fpCosPiTest_c;

	--ld_signRNotNaNOrInf_uid104_fpCosPiTest_q_to_cosXR_uid105_fpCosPiTest_c(DELAY,518)@19
    ld_signRNotNaNOrInf_uid104_fpCosPiTest_q_to_cosXR_uid105_fpCosPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => signRNotNaNOrInf_uid104_fpCosPiTest_q, xout => ld_signRNotNaNOrInf_uid104_fpCosPiTest_q_to_cosXR_uid105_fpCosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--cstBias_uid22_fpCosPiTest(CONSTANT,21)
    cstBias_uid22_fpCosPiTest_q <= "01111111";

	--oMyBottom_uid53_fpCosPiTest(BITSELECT,52)@17
    oMyBottom_uid53_fpCosPiTest_in <= oneMinusY_uid49_fpCosPiTest_q(61 downto 0);
    oMyBottom_uid53_fpCosPiTest_b <= oMyBottom_uid53_fpCosPiTest_in(61 downto 0);

	--reg_oMyBottom_uid53_fpCosPiTest_0_to_z_uid55_fpCosPiTest_3(REG,389)@17
    reg_oMyBottom_uid53_fpCosPiTest_0_to_z_uid55_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oMyBottom_uid53_fpCosPiTest_0_to_z_uid55_fpCosPiTest_3_q <= "00000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oMyBottom_uid53_fpCosPiTest_0_to_z_uid55_fpCosPiTest_3_q <= oMyBottom_uid53_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oMyBottom_uid53_fpCosPiTest_0_to_z_uid55_fpCosPiTest_3_q_to_z_uid55_fpCosPiTest_d(DELAY,452)@18
    ld_reg_oMyBottom_uid53_fpCosPiTest_0_to_z_uid55_fpCosPiTest_3_q_to_z_uid55_fpCosPiTest_d : dspba_delay
    GENERIC MAP ( width => 62, depth => 1 )
    PORT MAP ( xin => reg_oMyBottom_uid53_fpCosPiTest_0_to_z_uid55_fpCosPiTest_3_q, xout => ld_reg_oMyBottom_uid53_fpCosPiTest_0_to_z_uid55_fpCosPiTest_3_q_to_z_uid55_fpCosPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--yBottom_uid54_fpCosPiTest(BITSELECT,53)@16
    yBottom_uid54_fpCosPiTest_in <= y_uid44_fpCosPiTest_b(61 downto 0);
    yBottom_uid54_fpCosPiTest_b <= yBottom_uid54_fpCosPiTest_in(61 downto 0);

	--reg_yBottom_uid54_fpCosPiTest_0_to_z_uid55_fpCosPiTest_2(REG,388)@16
    reg_yBottom_uid54_fpCosPiTest_0_to_z_uid55_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yBottom_uid54_fpCosPiTest_0_to_z_uid55_fpCosPiTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yBottom_uid54_fpCosPiTest_0_to_z_uid55_fpCosPiTest_2_q <= yBottom_uid54_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yBottom_uid54_fpCosPiTest_0_to_z_uid55_fpCosPiTest_2_q_to_z_uid55_fpCosPiTest_c(DELAY,451)@17
    ld_reg_yBottom_uid54_fpCosPiTest_0_to_z_uid55_fpCosPiTest_2_q_to_z_uid55_fpCosPiTest_c : dspba_delay
    GENERIC MAP ( width => 62, depth => 2 )
    PORT MAP ( xin => reg_yBottom_uid54_fpCosPiTest_0_to_z_uid55_fpCosPiTest_2_q, xout => ld_reg_yBottom_uid54_fpCosPiTest_0_to_z_uid55_fpCosPiTest_2_q_to_z_uid55_fpCosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_InvCmpYToOneMinusY_uid52_fpCosPiTest_0_to_z_uid55_fpCosPiTest_1(REG,387)@18
    reg_InvCmpYToOneMinusY_uid52_fpCosPiTest_0_to_z_uid55_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_InvCmpYToOneMinusY_uid52_fpCosPiTest_0_to_z_uid55_fpCosPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_InvCmpYToOneMinusY_uid52_fpCosPiTest_0_to_z_uid55_fpCosPiTest_1_q <= InvCmpYToOneMinusY_uid52_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--z_uid55_fpCosPiTest(MUX,54)@19
    z_uid55_fpCosPiTest_s <= reg_InvCmpYToOneMinusY_uid52_fpCosPiTest_0_to_z_uid55_fpCosPiTest_1_q;
    z_uid55_fpCosPiTest: PROCESS (z_uid55_fpCosPiTest_s, en, ld_reg_yBottom_uid54_fpCosPiTest_0_to_z_uid55_fpCosPiTest_2_q_to_z_uid55_fpCosPiTest_c_q, ld_reg_oMyBottom_uid53_fpCosPiTest_0_to_z_uid55_fpCosPiTest_3_q_to_z_uid55_fpCosPiTest_d_q)
    BEGIN
            CASE z_uid55_fpCosPiTest_s IS
                  WHEN "0" => z_uid55_fpCosPiTest_q <= ld_reg_yBottom_uid54_fpCosPiTest_0_to_z_uid55_fpCosPiTest_2_q_to_z_uid55_fpCosPiTest_c_q;
                  WHEN "1" => z_uid55_fpCosPiTest_q <= ld_reg_oMyBottom_uid53_fpCosPiTest_0_to_z_uid55_fpCosPiTest_3_q_to_z_uid55_fpCosPiTest_d_q;
                  WHEN OTHERS => z_uid55_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--zAddr_uid64_fpCosPiTest(BITSELECT,63)@19
    zAddr_uid64_fpCosPiTest_in <= z_uid55_fpCosPiTest_q;
    zAddr_uid64_fpCosPiTest_b <= zAddr_uid64_fpCosPiTest_in(61 downto 54);

	--reg_zAddr_uid64_fpCosPiTest_0_to_memoryC2_uid253_sinPiZTableGenerator_lutmem_0(REG,401)@19
    reg_zAddr_uid64_fpCosPiTest_0_to_memoryC2_uid253_sinPiZTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid64_fpCosPiTest_0_to_memoryC2_uid253_sinPiZTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zAddr_uid64_fpCosPiTest_0_to_memoryC2_uid253_sinPiZTableGenerator_lutmem_0_q <= zAddr_uid64_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid253_sinPiZTableGenerator_lutmem(DUALMEM,349)@20
    memoryC2_uid253_sinPiZTableGenerator_lutmem_ia <= (others => '0');
    memoryC2_uid253_sinPiZTableGenerator_lutmem_aa <= (others => '0');
    memoryC2_uid253_sinPiZTableGenerator_lutmem_ab <= reg_zAddr_uid64_fpCosPiTest_0_to_memoryC2_uid253_sinPiZTableGenerator_lutmem_0_q;
    memoryC2_uid253_sinPiZTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_cos_s5_memoryC2_uid253_sinPiZTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid253_sinPiZTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid253_sinPiZTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid253_sinPiZTableGenerator_lutmem_iq,
        address_a => memoryC2_uid253_sinPiZTableGenerator_lutmem_aa,
        data_a => memoryC2_uid253_sinPiZTableGenerator_lutmem_ia
    );
    memoryC2_uid253_sinPiZTableGenerator_lutmem_reset0 <= areset;
        memoryC2_uid253_sinPiZTableGenerator_lutmem_q <= memoryC2_uid253_sinPiZTableGenerator_lutmem_iq(12 downto 0);

	--reg_memoryC2_uid253_sinPiZTableGenerator_lutmem_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_1(REG,403)@22
    reg_memoryC2_uid253_sinPiZTableGenerator_lutmem_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid253_sinPiZTableGenerator_lutmem_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_1_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid253_sinPiZTableGenerator_lutmem_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_1_q <= memoryC2_uid253_sinPiZTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--zPPolyEval_uid65_fpCosPiTest(BITSELECT,64)@19
    zPPolyEval_uid65_fpCosPiTest_in <= z_uid55_fpCosPiTest_q(53 downto 0);
    zPPolyEval_uid65_fpCosPiTest_b <= zPPolyEval_uid65_fpCosPiTest_in(53 downto 36);

	--yT1_uid255_sinPiZPolyEval(BITSELECT,254)@19
    yT1_uid255_sinPiZPolyEval_in <= zPPolyEval_uid65_fpCosPiTest_b;
    yT1_uid255_sinPiZPolyEval_b <= yT1_uid255_sinPiZPolyEval_in(17 downto 5);

	--reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0(REG,402)@19
    reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0_q <= yT1_uid255_sinPiZPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0_q_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_a_inputreg(DELAY,925)
    ld_reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0_q_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 13, depth => 1 )
    PORT MAP ( xin => reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0_q, xout => ld_reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0_q_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0_q_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_a(DELAY,716)@20
    ld_reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0_q_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_a : dspba_delay
    GENERIC MAP ( width => 13, depth => 2 )
    PORT MAP ( xin => ld_reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0_q_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_a_inputreg_q, xout => ld_reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0_q_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_a_q, ena => en(0), clk => clk, aclr => areset );

	--prodXY_uid328_pT1_uid256_sinPiZPolyEval(MULT,327)@23
    prodXY_uid328_pT1_uid256_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid328_pT1_uid256_sinPiZPolyEval_a),14)) * SIGNED(prodXY_uid328_pT1_uid256_sinPiZPolyEval_b);
    prodXY_uid328_pT1_uid256_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid328_pT1_uid256_sinPiZPolyEval_a <= (others => '0');
            prodXY_uid328_pT1_uid256_sinPiZPolyEval_b <= (others => '0');
            prodXY_uid328_pT1_uid256_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid328_pT1_uid256_sinPiZPolyEval_a <= ld_reg_yT1_uid255_sinPiZPolyEval_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_0_q_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_a_q;
                prodXY_uid328_pT1_uid256_sinPiZPolyEval_b <= reg_memoryC2_uid253_sinPiZTableGenerator_lutmem_0_to_prodXY_uid328_pT1_uid256_sinPiZPolyEval_1_q;
                prodXY_uid328_pT1_uid256_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid328_pT1_uid256_sinPiZPolyEval_pr,26));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid328_pT1_uid256_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid328_pT1_uid256_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid328_pT1_uid256_sinPiZPolyEval_q <= prodXY_uid328_pT1_uid256_sinPiZPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid329_pT1_uid256_sinPiZPolyEval(BITSELECT,328)@26
    prodXYTruncFR_uid329_pT1_uid256_sinPiZPolyEval_in <= prodXY_uid328_pT1_uid256_sinPiZPolyEval_q;
    prodXYTruncFR_uid329_pT1_uid256_sinPiZPolyEval_b <= prodXYTruncFR_uid329_pT1_uid256_sinPiZPolyEval_in(25 downto 12);

	--highBBits_uid258_sinPiZPolyEval(BITSELECT,257)@26
    highBBits_uid258_sinPiZPolyEval_in <= prodXYTruncFR_uid329_pT1_uid256_sinPiZPolyEval_b;
    highBBits_uid258_sinPiZPolyEval_b <= highBBits_uid258_sinPiZPolyEval_in(13 downto 1);

	--ld_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC1_uid251_sinPiZTableGenerator_lutmem_0_q_to_memoryC1_uid251_sinPiZTableGenerator_lutmem_a(DELAY,742)@20
    ld_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC1_uid251_sinPiZTableGenerator_lutmem_0_q_to_memoryC1_uid251_sinPiZTableGenerator_lutmem_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => reg_zAddr_uid64_fpCosPiTest_0_to_memoryC2_uid253_sinPiZTableGenerator_lutmem_0_q, xout => ld_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC1_uid251_sinPiZTableGenerator_lutmem_0_q_to_memoryC1_uid251_sinPiZTableGenerator_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid251_sinPiZTableGenerator_lutmem(DUALMEM,348)@23
    memoryC1_uid251_sinPiZTableGenerator_lutmem_ia <= (others => '0');
    memoryC1_uid251_sinPiZTableGenerator_lutmem_aa <= (others => '0');
    memoryC1_uid251_sinPiZTableGenerator_lutmem_ab <= ld_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC1_uid251_sinPiZTableGenerator_lutmem_0_q_to_memoryC1_uid251_sinPiZTableGenerator_lutmem_a_q;
    memoryC1_uid251_sinPiZTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_cos_s5_memoryC1_uid251_sinPiZTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid251_sinPiZTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid251_sinPiZTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid251_sinPiZTableGenerator_lutmem_iq,
        address_a => memoryC1_uid251_sinPiZTableGenerator_lutmem_aa,
        data_a => memoryC1_uid251_sinPiZTableGenerator_lutmem_ia
    );
    memoryC1_uid251_sinPiZTableGenerator_lutmem_reset0 <= areset;
        memoryC1_uid251_sinPiZTableGenerator_lutmem_q <= memoryC1_uid251_sinPiZTableGenerator_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid251_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid259_sinPiZPolyEval_0(REG,405)@25
    reg_memoryC1_uid251_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid259_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid251_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid259_sinPiZPolyEval_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid251_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid259_sinPiZPolyEval_0_q <= memoryC1_uid251_sinPiZTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid259_sinPiZPolyEval(ADD,258)@26
    sumAHighB_uid259_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid251_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid259_sinPiZPolyEval_0_q(20)) & reg_memoryC1_uid251_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid259_sinPiZPolyEval_0_q);
    sumAHighB_uid259_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid258_sinPiZPolyEval_b(12)) & highBBits_uid258_sinPiZPolyEval_b);
            sumAHighB_uid259_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid259_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid259_sinPiZPolyEval_b));
    sumAHighB_uid259_sinPiZPolyEval_q <= sumAHighB_uid259_sinPiZPolyEval_o(21 downto 0);


	--lowRangeB_uid257_sinPiZPolyEval(BITSELECT,256)@26
    lowRangeB_uid257_sinPiZPolyEval_in <= prodXYTruncFR_uid329_pT1_uid256_sinPiZPolyEval_b(0 downto 0);
    lowRangeB_uid257_sinPiZPolyEval_b <= lowRangeB_uid257_sinPiZPolyEval_in(0 downto 0);

	--s1_uid257_uid260_sinPiZPolyEval(BITJOIN,259)@26
    s1_uid257_uid260_sinPiZPolyEval_q <= sumAHighB_uid259_sinPiZPolyEval_q & lowRangeB_uid257_sinPiZPolyEval_b;

	--reg_s1_uid257_uid260_sinPiZPolyEval_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_1(REG,407)@26
    reg_s1_uid257_uid260_sinPiZPolyEval_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid257_uid260_sinPiZPolyEval_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid257_uid260_sinPiZPolyEval_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_1_q <= s1_uid257_uid260_sinPiZPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_nor(LOGICAL,936)
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_nor_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q;
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_nor_b <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_sticky_ena_q;
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_nor_q <= not (ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_nor_a or ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_nor_b);

	--ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_mem_top(CONSTANT,932)
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_mem_top_q <= "0100";

	--ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmp(LOGICAL,933)
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmp_a <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_mem_top_q;
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdmux_q);
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmp_q <= "1" when ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmp_a = ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmp_b else "0";

	--ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmpReg(REG,934)
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmpReg_q <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_sticky_ena(REG,937)
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_nor_q = "1") THEN
                ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_sticky_ena_q <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_enaAnd(LOGICAL,938)
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_enaAnd_a <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_sticky_ena_q;
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_enaAnd_b <= en;
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_enaAnd_q <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_enaAnd_a and ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_enaAnd_b;

	--reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0(REG,406)@19
    reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q <= zPPolyEval_uid65_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_inputreg(DELAY,926)
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q, xout => ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt(COUNTER,928)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_i = 3 THEN
                      ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_i <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_i <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_i,3));


	--ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdreg(REG,929)
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdreg_q <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdmux(MUX,930)
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdmux_s <= en;
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdmux: PROCESS (ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdmux_s, ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdreg_q, ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdmux_q <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdmux_q <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem(DUALMEM,927)
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_ia <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_inputreg_q;
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_aa <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdreg_q;
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_ab <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdmux_q;
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_iq,
        address_a => ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_aa,
        data_a => ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_ia
    );
    ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_reset0 <= areset;
        ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_q <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_iq(17 downto 0);

	--prodXY_uid331_pT2_uid262_sinPiZPolyEval(MULT,330)@27
    prodXY_uid331_pT2_uid262_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid331_pT2_uid262_sinPiZPolyEval_a),19)) * SIGNED(prodXY_uid331_pT2_uid262_sinPiZPolyEval_b);
    prodXY_uid331_pT2_uid262_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid331_pT2_uid262_sinPiZPolyEval_a <= (others => '0');
            prodXY_uid331_pT2_uid262_sinPiZPolyEval_b <= (others => '0');
            prodXY_uid331_pT2_uid262_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid331_pT2_uid262_sinPiZPolyEval_a <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_mem_q;
                prodXY_uid331_pT2_uid262_sinPiZPolyEval_b <= reg_s1_uid257_uid260_sinPiZPolyEval_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_1_q;
                prodXY_uid331_pT2_uid262_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid331_pT2_uid262_sinPiZPolyEval_pr,41));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid331_pT2_uid262_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid331_pT2_uid262_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid331_pT2_uid262_sinPiZPolyEval_q <= prodXY_uid331_pT2_uid262_sinPiZPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid332_pT2_uid262_sinPiZPolyEval(BITSELECT,331)@30
    prodXYTruncFR_uid332_pT2_uid262_sinPiZPolyEval_in <= prodXY_uid331_pT2_uid262_sinPiZPolyEval_q;
    prodXYTruncFR_uid332_pT2_uid262_sinPiZPolyEval_b <= prodXYTruncFR_uid332_pT2_uid262_sinPiZPolyEval_in(40 downto 17);

	--highBBits_uid264_sinPiZPolyEval(BITSELECT,263)@30
    highBBits_uid264_sinPiZPolyEval_in <= prodXYTruncFR_uid332_pT2_uid262_sinPiZPolyEval_b;
    highBBits_uid264_sinPiZPolyEval_b <= highBBits_uid264_sinPiZPolyEval_in(23 downto 2);

	--ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_nor(LOGICAL,949)
    ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_nor_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q;
    ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_nor_b <= ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_nor_q <= not (ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_nor_a or ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_nor_b);

	--ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_sticky_ena(REG,950)
    ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_nor_q = "1") THEN
                ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_sticky_ena_q <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_enaAnd(LOGICAL,951)
    ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_enaAnd_a <= ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_enaAnd_b <= en;
    ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_enaAnd_q <= ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_enaAnd_a and ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_enaAnd_b;

	--ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_inputreg(DELAY,939)
    ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => zAddr_uid64_fpCosPiTest_b, xout => ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem(DUALMEM,940)
    ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_ia <= ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_inputreg_q;
    ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_aa <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdreg_q;
    ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_ab <= ld_reg_zPPolyEval_uid65_fpCosPiTest_0_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_0_q_to_prodXY_uid331_pT2_uid262_sinPiZPolyEval_a_replace_rdmux_q;
    ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_iq,
        address_a => ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_aa,
        data_a => ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_ia
    );
    ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_q <= ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0(REG,408)@26
    reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_q <= ld_zAddr_uid64_fpCosPiTest_b_to_reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid249_sinPiZTableGenerator_lutmem(DUALMEM,347)@27
    memoryC0_uid249_sinPiZTableGenerator_lutmem_ia <= (others => '0');
    memoryC0_uid249_sinPiZTableGenerator_lutmem_aa <= (others => '0');
    memoryC0_uid249_sinPiZTableGenerator_lutmem_ab <= reg_zAddr_uid64_fpCosPiTest_0_to_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_q;
    memoryC0_uid249_sinPiZTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_cos_s5_memoryC0_uid249_sinPiZTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid249_sinPiZTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid249_sinPiZTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid249_sinPiZTableGenerator_lutmem_iq,
        address_a => memoryC0_uid249_sinPiZTableGenerator_lutmem_aa,
        data_a => memoryC0_uid249_sinPiZTableGenerator_lutmem_ia
    );
    memoryC0_uid249_sinPiZTableGenerator_lutmem_reset0 <= areset;
        memoryC0_uid249_sinPiZTableGenerator_lutmem_q <= memoryC0_uid249_sinPiZTableGenerator_lutmem_iq(29 downto 0);

	--reg_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid265_sinPiZPolyEval_0(REG,409)@29
    reg_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid265_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid265_sinPiZPolyEval_0_q <= "000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid265_sinPiZPolyEval_0_q <= memoryC0_uid249_sinPiZTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid265_sinPiZPolyEval(ADD,264)@30
    sumAHighB_uid265_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((30 downto 30 => reg_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid265_sinPiZPolyEval_0_q(29)) & reg_memoryC0_uid249_sinPiZTableGenerator_lutmem_0_to_sumAHighB_uid265_sinPiZPolyEval_0_q);
    sumAHighB_uid265_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((30 downto 22 => highBBits_uid264_sinPiZPolyEval_b(21)) & highBBits_uid264_sinPiZPolyEval_b);
            sumAHighB_uid265_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid265_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid265_sinPiZPolyEval_b));
    sumAHighB_uid265_sinPiZPolyEval_q <= sumAHighB_uid265_sinPiZPolyEval_o(30 downto 0);


	--lowRangeB_uid263_sinPiZPolyEval(BITSELECT,262)@30
    lowRangeB_uid263_sinPiZPolyEval_in <= prodXYTruncFR_uid332_pT2_uid262_sinPiZPolyEval_b(1 downto 0);
    lowRangeB_uid263_sinPiZPolyEval_b <= lowRangeB_uid263_sinPiZPolyEval_in(1 downto 0);

	--s2_uid263_uid266_sinPiZPolyEval(BITJOIN,265)@30
    s2_uid263_uid266_sinPiZPolyEval_q <= sumAHighB_uid265_sinPiZPolyEval_q & lowRangeB_uid263_sinPiZPolyEval_b;

	--fxpSinRes_uid67_fpCosPiTest(BITSELECT,66)@30
    fxpSinRes_uid67_fpCosPiTest_in <= s2_uid263_uid266_sinPiZPolyEval_q(30 downto 0);
    fxpSinRes_uid67_fpCosPiTest_b <= fxpSinRes_uid67_fpCosPiTest_in(30 downto 5);

	--reg_fxpSinRes_uid67_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_1(REG,411)@30
    reg_fxpSinRes_uid67_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpSinRes_uid67_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpSinRes_uid67_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_1_q <= fxpSinRes_uid67_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_nor(LOGICAL,962)
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_nor_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q;
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_nor_b <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_sticky_ena_q;
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_nor_q <= not (ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_nor_a or ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_nor_b);

	--ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_mem_top(CONSTANT,958)
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_mem_top_q <= "010";

	--ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmp(LOGICAL,959)
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmp_a <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_mem_top_q;
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdmux_q);
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmp_q <= "1" when ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmp_a = ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmp_b else "0";

	--ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmpReg(REG,960)
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmpReg_q <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_sticky_ena(REG,963)
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_nor_q = "1") THEN
                ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_sticky_ena_q <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_enaAnd(LOGICAL,964)
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_enaAnd_a <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_sticky_ena_q;
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_enaAnd_b <= en;
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_enaAnd_q <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_enaAnd_a and ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_enaAnd_b;

	--ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_nor(LOGICAL,907)
    ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_nor_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q;
    ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_nor_b <= ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q;
    ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_nor_q <= not (ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_nor_a or ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_nor_b);

	--ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_sticky_ena(REG,908)
    ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_nor_q = "1") THEN
                ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_enaAnd(LOGICAL,909)
    ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_enaAnd_a <= ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q;
    ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_enaAnd_b <= en;
    ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_enaAnd_q <= ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_enaAnd_a and ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_enaAnd_b;

	--X13dto0_uid222_alignedZ_uid58_fpCosPiTest(BITSELECT,221)@19
    X13dto0_uid222_alignedZ_uid58_fpCosPiTest_in <= z_uid55_fpCosPiTest_q(13 downto 0);
    X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b <= X13dto0_uid222_alignedZ_uid58_fpCosPiTest_in(13 downto 0);

	--ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_inputreg(DELAY,899)
    ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 14, depth => 1 )
    PORT MAP ( xin => X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b, xout => ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem(DUALMEM,900)
    ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_ia <= ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_inputreg_q;
    ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_aa <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdreg_q;
    ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_ab <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux_q;
    ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 14,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 14,
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
        clocken1 => ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_iq,
        address_a => ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_aa,
        data_a => ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_ia
    );
    ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_reset0 <= areset;
        ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_q <= ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_iq(13 downto 0);

	--leftShiftStage0Idx3Pad48_uid221_alignedZ_uid58_fpCosPiTest(CONSTANT,220)
    leftShiftStage0Idx3Pad48_uid221_alignedZ_uid58_fpCosPiTest_q <= "000000000000000000000000000000000000000000000000";

	--leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest(BITJOIN,222)@23
    leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_q <= ld_X13dto0_uid222_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_b_replace_mem_q & leftShiftStage0Idx3Pad48_uid221_alignedZ_uid58_fpCosPiTest_q;

	--ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_nor(LOGICAL,896)
    ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_nor_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q;
    ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_nor_b <= ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q;
    ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_nor_q <= not (ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_nor_a or ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_nor_b);

	--ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_sticky_ena(REG,897)
    ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_nor_q = "1") THEN
                ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_enaAnd(LOGICAL,898)
    ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_enaAnd_a <= ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q;
    ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_enaAnd_b <= en;
    ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_enaAnd_q <= ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_enaAnd_a and ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_enaAnd_b;

	--vStage_uid181_lzcZ_uid57_fpCosPiTest(BITSELECT,180)@19
    vStage_uid181_lzcZ_uid57_fpCosPiTest_in <= z_uid55_fpCosPiTest_q(29 downto 0);
    vStage_uid181_lzcZ_uid57_fpCosPiTest_b <= vStage_uid181_lzcZ_uid57_fpCosPiTest_in(29 downto 0);

	--ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_cStage_uid182_lzcZ_uid57_fpCosPiTest_b(DELAY,570)@19
    ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_cStage_uid182_lzcZ_uid57_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 30, depth => 1 )
    PORT MAP ( xin => vStage_uid181_lzcZ_uid57_fpCosPiTest_b, xout => ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_cStage_uid182_lzcZ_uid57_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem(DUALMEM,889)
    ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_ia <= ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_cStage_uid182_lzcZ_uid57_fpCosPiTest_b_q;
    ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_aa <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdreg_q;
    ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_ab <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux_q;
    ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 30,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 30,
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
        clocken1 => ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_iq,
        address_a => ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_aa,
        data_a => ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_ia
    );
    ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_reset0 <= areset;
        ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_q <= ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_iq(29 downto 0);

	--zs_uid177_lzcZ_uid57_fpCosPiTest(CONSTANT,176)
    zs_uid177_lzcZ_uid57_fpCosPiTest_q <= "00000000000000000000000000000000";

	--leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest(BITJOIN,219)@23
    leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_q <= ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_b_replace_mem_q & zs_uid177_lzcZ_uid57_fpCosPiTest_q;

	--ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_nor(LOGICAL,885)
    ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_nor_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q;
    ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_nor_b <= ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q;
    ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_nor_q <= not (ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_nor_a or ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_nor_b);

	--ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_sticky_ena(REG,886)
    ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_nor_q = "1") THEN
                ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_enaAnd(LOGICAL,887)
    ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_enaAnd_a <= ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_sticky_ena_q;
    ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_enaAnd_b <= en;
    ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_enaAnd_q <= ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_enaAnd_a and ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_enaAnd_b;

	--X45dto0_uid216_alignedZ_uid58_fpCosPiTest(BITSELECT,215)@19
    X45dto0_uid216_alignedZ_uid58_fpCosPiTest_in <= z_uid55_fpCosPiTest_q(45 downto 0);
    X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b <= X45dto0_uid216_alignedZ_uid58_fpCosPiTest_in(45 downto 0);

	--ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_inputreg(DELAY,877)
    ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 46, depth => 1 )
    PORT MAP ( xin => X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b, xout => ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem(DUALMEM,878)
    ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_ia <= ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_inputreg_q;
    ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_aa <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdreg_q;
    ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_ab <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux_q;
    ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 46,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 46,
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
        clocken1 => ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_iq,
        address_a => ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_aa,
        data_a => ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_ia
    );
    ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_reset0 <= areset;
        ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_q <= ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_iq(45 downto 0);

	--leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest(BITJOIN,216)@23
    leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_q <= ld_X45dto0_uid216_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_b_replace_mem_q & zs_uid185_lzcZ_uid57_fpCosPiTest_q;

	--ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_nor(LOGICAL,918)
    ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_nor_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q;
    ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_nor_b <= ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_sticky_ena_q;
    ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_nor_q <= not (ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_nor_a or ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_nor_b);

	--ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_sticky_ena(REG,919)
    ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_nor_q = "1") THEN
                ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_sticky_ena_q <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_enaAnd(LOGICAL,920)
    ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_enaAnd_a <= ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_sticky_ena_q;
    ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_enaAnd_b <= en;
    ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_enaAnd_q <= ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_enaAnd_a and ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_enaAnd_b;

	--ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_inputreg(DELAY,910)
    ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 62, depth => 1 )
    PORT MAP ( xin => z_uid55_fpCosPiTest_q, xout => ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem(DUALMEM,911)
    ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_ia <= ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_inputreg_q;
    ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_aa <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdreg_q;
    ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_ab <= ld_R_uid108_px_uid31_fpCosPiTest_q_to_fracX_uid128_rrx_uid32_fpCosPiTest_a_replace_rdmux_q;
    ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 62,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 62,
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
        clocken1 => ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_iq,
        address_a => ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_aa,
        data_a => ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_ia
    );
    ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_reset0 <= areset;
        ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_q <= ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_iq(61 downto 0);

	--rVStage_uid178_lzcZ_uid57_fpCosPiTest(BITSELECT,177)@19
    rVStage_uid178_lzcZ_uid57_fpCosPiTest_in <= z_uid55_fpCosPiTest_q;
    rVStage_uid178_lzcZ_uid57_fpCosPiTest_b <= rVStage_uid178_lzcZ_uid57_fpCosPiTest_in(61 downto 30);

	--vCount_uid179_lzcZ_uid57_fpCosPiTest(LOGICAL,178)@19
    vCount_uid179_lzcZ_uid57_fpCosPiTest_a <= rVStage_uid178_lzcZ_uid57_fpCosPiTest_b;
    vCount_uid179_lzcZ_uid57_fpCosPiTest_b <= zs_uid177_lzcZ_uid57_fpCosPiTest_q;
    vCount_uid179_lzcZ_uid57_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid179_lzcZ_uid57_fpCosPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid179_lzcZ_uid57_fpCosPiTest_a = vCount_uid179_lzcZ_uid57_fpCosPiTest_b) THEN
                vCount_uid179_lzcZ_uid57_fpCosPiTest_q <= "1";
            ELSE
                vCount_uid179_lzcZ_uid57_fpCosPiTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--ld_vCount_uid179_lzcZ_uid57_fpCosPiTest_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_f(DELAY,605)@20
    ld_vCount_uid179_lzcZ_uid57_fpCosPiTest_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid179_lzcZ_uid57_fpCosPiTest_q, xout => ld_vCount_uid179_lzcZ_uid57_fpCosPiTest_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--cStage_uid182_lzcZ_uid57_fpCosPiTest(BITJOIN,181)@20
    cStage_uid182_lzcZ_uid57_fpCosPiTest_q <= ld_vStage_uid181_lzcZ_uid57_fpCosPiTest_b_to_cStage_uid182_lzcZ_uid57_fpCosPiTest_b_q & mO_uid180_lzcZ_uid57_fpCosPiTest_q;

	--ld_rVStage_uid178_lzcZ_uid57_fpCosPiTest_b_to_vStagei_uid184_lzcZ_uid57_fpCosPiTest_c(DELAY,572)@19
    ld_rVStage_uid178_lzcZ_uid57_fpCosPiTest_b_to_vStagei_uid184_lzcZ_uid57_fpCosPiTest_c : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => rVStage_uid178_lzcZ_uid57_fpCosPiTest_b, xout => ld_rVStage_uid178_lzcZ_uid57_fpCosPiTest_b_to_vStagei_uid184_lzcZ_uid57_fpCosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid184_lzcZ_uid57_fpCosPiTest(MUX,183)@20
    vStagei_uid184_lzcZ_uid57_fpCosPiTest_s <= vCount_uid179_lzcZ_uid57_fpCosPiTest_q;
    vStagei_uid184_lzcZ_uid57_fpCosPiTest: PROCESS (vStagei_uid184_lzcZ_uid57_fpCosPiTest_s, en, ld_rVStage_uid178_lzcZ_uid57_fpCosPiTest_b_to_vStagei_uid184_lzcZ_uid57_fpCosPiTest_c_q, cStage_uid182_lzcZ_uid57_fpCosPiTest_q)
    BEGIN
            CASE vStagei_uid184_lzcZ_uid57_fpCosPiTest_s IS
                  WHEN "0" => vStagei_uid184_lzcZ_uid57_fpCosPiTest_q <= ld_rVStage_uid178_lzcZ_uid57_fpCosPiTest_b_to_vStagei_uid184_lzcZ_uid57_fpCosPiTest_c_q;
                  WHEN "1" => vStagei_uid184_lzcZ_uid57_fpCosPiTest_q <= cStage_uid182_lzcZ_uid57_fpCosPiTest_q;
                  WHEN OTHERS => vStagei_uid184_lzcZ_uid57_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid186_lzcZ_uid57_fpCosPiTest(BITSELECT,185)@20
    rVStage_uid186_lzcZ_uid57_fpCosPiTest_in <= vStagei_uid184_lzcZ_uid57_fpCosPiTest_q;
    rVStage_uid186_lzcZ_uid57_fpCosPiTest_b <= rVStage_uid186_lzcZ_uid57_fpCosPiTest_in(31 downto 16);

	--vCount_uid187_lzcZ_uid57_fpCosPiTest(LOGICAL,186)@20
    vCount_uid187_lzcZ_uid57_fpCosPiTest_a <= rVStage_uid186_lzcZ_uid57_fpCosPiTest_b;
    vCount_uid187_lzcZ_uid57_fpCosPiTest_b <= zs_uid185_lzcZ_uid57_fpCosPiTest_q;
    vCount_uid187_lzcZ_uid57_fpCosPiTest_q <= "1" when vCount_uid187_lzcZ_uid57_fpCosPiTest_a = vCount_uid187_lzcZ_uid57_fpCosPiTest_b else "0";

	--reg_vCount_uid187_lzcZ_uid57_fpCosPiTest_0_to_r_uid212_lzcZ_uid57_fpCosPiTest_4(REG,395)@20
    reg_vCount_uid187_lzcZ_uid57_fpCosPiTest_0_to_r_uid212_lzcZ_uid57_fpCosPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid187_lzcZ_uid57_fpCosPiTest_0_to_r_uid212_lzcZ_uid57_fpCosPiTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid187_lzcZ_uid57_fpCosPiTest_0_to_r_uid212_lzcZ_uid57_fpCosPiTest_4_q <= vCount_uid187_lzcZ_uid57_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_vCount_uid187_lzcZ_uid57_fpCosPiTest_0_to_r_uid212_lzcZ_uid57_fpCosPiTest_4_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_e(DELAY,604)@21
    ld_reg_vCount_uid187_lzcZ_uid57_fpCosPiTest_0_to_r_uid212_lzcZ_uid57_fpCosPiTest_4_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_vCount_uid187_lzcZ_uid57_fpCosPiTest_0_to_r_uid212_lzcZ_uid57_fpCosPiTest_4_q, xout => ld_reg_vCount_uid187_lzcZ_uid57_fpCosPiTest_0_to_r_uid212_lzcZ_uid57_fpCosPiTest_4_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid188_lzcZ_uid57_fpCosPiTest(BITSELECT,187)@20
    vStage_uid188_lzcZ_uid57_fpCosPiTest_in <= vStagei_uid184_lzcZ_uid57_fpCosPiTest_q(15 downto 0);
    vStage_uid188_lzcZ_uid57_fpCosPiTest_b <= vStage_uid188_lzcZ_uid57_fpCosPiTest_in(15 downto 0);

	--vStagei_uid190_lzcZ_uid57_fpCosPiTest(MUX,189)@20
    vStagei_uid190_lzcZ_uid57_fpCosPiTest_s <= vCount_uid187_lzcZ_uid57_fpCosPiTest_q;
    vStagei_uid190_lzcZ_uid57_fpCosPiTest: PROCESS (vStagei_uid190_lzcZ_uid57_fpCosPiTest_s, en, rVStage_uid186_lzcZ_uid57_fpCosPiTest_b, vStage_uid188_lzcZ_uid57_fpCosPiTest_b)
    BEGIN
            CASE vStagei_uid190_lzcZ_uid57_fpCosPiTest_s IS
                  WHEN "0" => vStagei_uid190_lzcZ_uid57_fpCosPiTest_q <= rVStage_uid186_lzcZ_uid57_fpCosPiTest_b;
                  WHEN "1" => vStagei_uid190_lzcZ_uid57_fpCosPiTest_q <= vStage_uid188_lzcZ_uid57_fpCosPiTest_b;
                  WHEN OTHERS => vStagei_uid190_lzcZ_uid57_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid192_lzcZ_uid57_fpCosPiTest(BITSELECT,191)@20
    rVStage_uid192_lzcZ_uid57_fpCosPiTest_in <= vStagei_uid190_lzcZ_uid57_fpCosPiTest_q;
    rVStage_uid192_lzcZ_uid57_fpCosPiTest_b <= rVStage_uid192_lzcZ_uid57_fpCosPiTest_in(15 downto 8);

	--reg_rVStage_uid192_lzcZ_uid57_fpCosPiTest_0_to_vCount_uid193_lzcZ_uid57_fpCosPiTest_1(REG,390)@20
    reg_rVStage_uid192_lzcZ_uid57_fpCosPiTest_0_to_vCount_uid193_lzcZ_uid57_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid192_lzcZ_uid57_fpCosPiTest_0_to_vCount_uid193_lzcZ_uid57_fpCosPiTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid192_lzcZ_uid57_fpCosPiTest_0_to_vCount_uid193_lzcZ_uid57_fpCosPiTest_1_q <= rVStage_uid192_lzcZ_uid57_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid193_lzcZ_uid57_fpCosPiTest(LOGICAL,192)@21
    vCount_uid193_lzcZ_uid57_fpCosPiTest_a <= reg_rVStage_uid192_lzcZ_uid57_fpCosPiTest_0_to_vCount_uid193_lzcZ_uid57_fpCosPiTest_1_q;
    vCount_uid193_lzcZ_uid57_fpCosPiTest_b <= cstAllZwE_uid28_fpCosPiTest_q;
    vCount_uid193_lzcZ_uid57_fpCosPiTest_q <= "1" when vCount_uid193_lzcZ_uid57_fpCosPiTest_a = vCount_uid193_lzcZ_uid57_fpCosPiTest_b else "0";

	--ld_vCount_uid193_lzcZ_uid57_fpCosPiTest_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_d(DELAY,603)@21
    ld_vCount_uid193_lzcZ_uid57_fpCosPiTest_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid193_lzcZ_uid57_fpCosPiTest_q, xout => ld_vCount_uid193_lzcZ_uid57_fpCosPiTest_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid194_lzcZ_uid57_fpCosPiTest(BITSELECT,193)@20
    vStage_uid194_lzcZ_uid57_fpCosPiTest_in <= vStagei_uid190_lzcZ_uid57_fpCosPiTest_q(7 downto 0);
    vStage_uid194_lzcZ_uid57_fpCosPiTest_b <= vStage_uid194_lzcZ_uid57_fpCosPiTest_in(7 downto 0);

	--reg_vStage_uid194_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid196_lzcZ_uid57_fpCosPiTest_3(REG,392)@20
    reg_vStage_uid194_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid196_lzcZ_uid57_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid194_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid196_lzcZ_uid57_fpCosPiTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid194_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid196_lzcZ_uid57_fpCosPiTest_3_q <= vStage_uid194_lzcZ_uid57_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid196_lzcZ_uid57_fpCosPiTest(MUX,195)@21
    vStagei_uid196_lzcZ_uid57_fpCosPiTest_s <= vCount_uid193_lzcZ_uid57_fpCosPiTest_q;
    vStagei_uid196_lzcZ_uid57_fpCosPiTest: PROCESS (vStagei_uid196_lzcZ_uid57_fpCosPiTest_s, en, reg_rVStage_uid192_lzcZ_uid57_fpCosPiTest_0_to_vCount_uid193_lzcZ_uid57_fpCosPiTest_1_q, reg_vStage_uid194_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid196_lzcZ_uid57_fpCosPiTest_3_q)
    BEGIN
            CASE vStagei_uid196_lzcZ_uid57_fpCosPiTest_s IS
                  WHEN "0" => vStagei_uid196_lzcZ_uid57_fpCosPiTest_q <= reg_rVStage_uid192_lzcZ_uid57_fpCosPiTest_0_to_vCount_uid193_lzcZ_uid57_fpCosPiTest_1_q;
                  WHEN "1" => vStagei_uid196_lzcZ_uid57_fpCosPiTest_q <= reg_vStage_uid194_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid196_lzcZ_uid57_fpCosPiTest_3_q;
                  WHEN OTHERS => vStagei_uid196_lzcZ_uid57_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid198_lzcZ_uid57_fpCosPiTest(BITSELECT,197)@21
    rVStage_uid198_lzcZ_uid57_fpCosPiTest_in <= vStagei_uid196_lzcZ_uid57_fpCosPiTest_q;
    rVStage_uid198_lzcZ_uid57_fpCosPiTest_b <= rVStage_uid198_lzcZ_uid57_fpCosPiTest_in(7 downto 4);

	--vCount_uid199_lzcZ_uid57_fpCosPiTest(LOGICAL,198)@21
    vCount_uid199_lzcZ_uid57_fpCosPiTest_a <= rVStage_uid198_lzcZ_uid57_fpCosPiTest_b;
    vCount_uid199_lzcZ_uid57_fpCosPiTest_b <= leftShiftStage0Idx1Pad4_uid154_fxpX_uid42_fpCosPiTest_q;
    vCount_uid199_lzcZ_uid57_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid199_lzcZ_uid57_fpCosPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid199_lzcZ_uid57_fpCosPiTest_a = vCount_uid199_lzcZ_uid57_fpCosPiTest_b) THEN
                vCount_uid199_lzcZ_uid57_fpCosPiTest_q <= "1";
            ELSE
                vCount_uid199_lzcZ_uid57_fpCosPiTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--vStage_uid200_lzcZ_uid57_fpCosPiTest(BITSELECT,199)@21
    vStage_uid200_lzcZ_uid57_fpCosPiTest_in <= vStagei_uid196_lzcZ_uid57_fpCosPiTest_q(3 downto 0);
    vStage_uid200_lzcZ_uid57_fpCosPiTest_b <= vStage_uid200_lzcZ_uid57_fpCosPiTest_in(3 downto 0);

	--reg_vStage_uid200_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid202_lzcZ_uid57_fpCosPiTest_3(REG,394)@21
    reg_vStage_uid200_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid202_lzcZ_uid57_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid200_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid202_lzcZ_uid57_fpCosPiTest_3_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid200_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid202_lzcZ_uid57_fpCosPiTest_3_q <= vStage_uid200_lzcZ_uid57_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid198_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid202_lzcZ_uid57_fpCosPiTest_2(REG,393)@21
    reg_rVStage_uid198_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid202_lzcZ_uid57_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid198_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid202_lzcZ_uid57_fpCosPiTest_2_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid198_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid202_lzcZ_uid57_fpCosPiTest_2_q <= rVStage_uid198_lzcZ_uid57_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid202_lzcZ_uid57_fpCosPiTest(MUX,201)@22
    vStagei_uid202_lzcZ_uid57_fpCosPiTest_s <= vCount_uid199_lzcZ_uid57_fpCosPiTest_q;
    vStagei_uid202_lzcZ_uid57_fpCosPiTest: PROCESS (vStagei_uid202_lzcZ_uid57_fpCosPiTest_s, en, reg_rVStage_uid198_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid202_lzcZ_uid57_fpCosPiTest_2_q, reg_vStage_uid200_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid202_lzcZ_uid57_fpCosPiTest_3_q)
    BEGIN
            CASE vStagei_uid202_lzcZ_uid57_fpCosPiTest_s IS
                  WHEN "0" => vStagei_uid202_lzcZ_uid57_fpCosPiTest_q <= reg_rVStage_uid198_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid202_lzcZ_uid57_fpCosPiTest_2_q;
                  WHEN "1" => vStagei_uid202_lzcZ_uid57_fpCosPiTest_q <= reg_vStage_uid200_lzcZ_uid57_fpCosPiTest_0_to_vStagei_uid202_lzcZ_uid57_fpCosPiTest_3_q;
                  WHEN OTHERS => vStagei_uid202_lzcZ_uid57_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid204_lzcZ_uid57_fpCosPiTest(BITSELECT,203)@22
    rVStage_uid204_lzcZ_uid57_fpCosPiTest_in <= vStagei_uid202_lzcZ_uid57_fpCosPiTest_q;
    rVStage_uid204_lzcZ_uid57_fpCosPiTest_b <= rVStage_uid204_lzcZ_uid57_fpCosPiTest_in(3 downto 2);

	--vCount_uid205_lzcZ_uid57_fpCosPiTest(LOGICAL,204)@22
    vCount_uid205_lzcZ_uid57_fpCosPiTest_a <= rVStage_uid204_lzcZ_uid57_fpCosPiTest_b;
    vCount_uid205_lzcZ_uid57_fpCosPiTest_b <= leftShiftStage1Idx2Pad2_uid168_fxpX_uid42_fpCosPiTest_q;
    vCount_uid205_lzcZ_uid57_fpCosPiTest_q <= "1" when vCount_uid205_lzcZ_uid57_fpCosPiTest_a = vCount_uid205_lzcZ_uid57_fpCosPiTest_b else "0";

	--vStage_uid206_lzcZ_uid57_fpCosPiTest(BITSELECT,205)@22
    vStage_uid206_lzcZ_uid57_fpCosPiTest_in <= vStagei_uid202_lzcZ_uid57_fpCosPiTest_q(1 downto 0);
    vStage_uid206_lzcZ_uid57_fpCosPiTest_b <= vStage_uid206_lzcZ_uid57_fpCosPiTest_in(1 downto 0);

	--vStagei_uid208_lzcZ_uid57_fpCosPiTest(MUX,207)@22
    vStagei_uid208_lzcZ_uid57_fpCosPiTest_s <= vCount_uid205_lzcZ_uid57_fpCosPiTest_q;
    vStagei_uid208_lzcZ_uid57_fpCosPiTest: PROCESS (vStagei_uid208_lzcZ_uid57_fpCosPiTest_s, en, rVStage_uid204_lzcZ_uid57_fpCosPiTest_b, vStage_uid206_lzcZ_uid57_fpCosPiTest_b)
    BEGIN
            CASE vStagei_uid208_lzcZ_uid57_fpCosPiTest_s IS
                  WHEN "0" => vStagei_uid208_lzcZ_uid57_fpCosPiTest_q <= rVStage_uid204_lzcZ_uid57_fpCosPiTest_b;
                  WHEN "1" => vStagei_uid208_lzcZ_uid57_fpCosPiTest_q <= vStage_uid206_lzcZ_uid57_fpCosPiTest_b;
                  WHEN OTHERS => vStagei_uid208_lzcZ_uid57_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid210_lzcZ_uid57_fpCosPiTest(BITSELECT,209)@22
    rVStage_uid210_lzcZ_uid57_fpCosPiTest_in <= vStagei_uid208_lzcZ_uid57_fpCosPiTest_q;
    rVStage_uid210_lzcZ_uid57_fpCosPiTest_b <= rVStage_uid210_lzcZ_uid57_fpCosPiTest_in(1 downto 1);

	--vCount_uid211_lzcZ_uid57_fpCosPiTest(LOGICAL,210)@22
    vCount_uid211_lzcZ_uid57_fpCosPiTest_a <= rVStage_uid210_lzcZ_uid57_fpCosPiTest_b;
    vCount_uid211_lzcZ_uid57_fpCosPiTest_b <= GND_q;
    vCount_uid211_lzcZ_uid57_fpCosPiTest_q <= "1" when vCount_uid211_lzcZ_uid57_fpCosPiTest_a = vCount_uid211_lzcZ_uid57_fpCosPiTest_b else "0";

	--r_uid212_lzcZ_uid57_fpCosPiTest(BITJOIN,211)@22
    r_uid212_lzcZ_uid57_fpCosPiTest_q <= ld_vCount_uid179_lzcZ_uid57_fpCosPiTest_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_f_q & ld_reg_vCount_uid187_lzcZ_uid57_fpCosPiTest_0_to_r_uid212_lzcZ_uid57_fpCosPiTest_4_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_e_q & ld_vCount_uid193_lzcZ_uid57_fpCosPiTest_q_to_r_uid212_lzcZ_uid57_fpCosPiTest_d_q & vCount_uid199_lzcZ_uid57_fpCosPiTest_q & vCount_uid205_lzcZ_uid57_fpCosPiTest_q & vCount_uid211_lzcZ_uid57_fpCosPiTest_q;

	--leftShiftStageSel5Dto4_uid224_alignedZ_uid58_fpCosPiTest(BITSELECT,223)@22
    leftShiftStageSel5Dto4_uid224_alignedZ_uid58_fpCosPiTest_in <= r_uid212_lzcZ_uid57_fpCosPiTest_q;
    leftShiftStageSel5Dto4_uid224_alignedZ_uid58_fpCosPiTest_b <= leftShiftStageSel5Dto4_uid224_alignedZ_uid58_fpCosPiTest_in(5 downto 4);

	--reg_leftShiftStageSel5Dto4_uid224_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_1(REG,396)@22
    reg_leftShiftStageSel5Dto4_uid224_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel5Dto4_uid224_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel5Dto4_uid224_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_1_q <= leftShiftStageSel5Dto4_uid224_alignedZ_uid58_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest(MUX,224)@23
    leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_s <= reg_leftShiftStageSel5Dto4_uid224_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_1_q;
    leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest: PROCESS (leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_s, en, ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_q, leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_q, leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_q, leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_q <= ld_z_uid55_fpCosPiTest_q_to_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_c_replace_mem_q;
                  WHEN "01" => leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_q <= leftShiftStage0Idx1_uid217_alignedZ_uid58_fpCosPiTest_q;
                  WHEN "10" => leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_q <= leftShiftStage0Idx2_uid220_alignedZ_uid58_fpCosPiTest_q;
                  WHEN "11" => leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_q <= leftShiftStage0Idx3_uid223_alignedZ_uid58_fpCosPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage049dto0_uid233_alignedZ_uid58_fpCosPiTest(BITSELECT,232)@23
    LeftShiftStage049dto0_uid233_alignedZ_uid58_fpCosPiTest_in <= leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_q(49 downto 0);
    LeftShiftStage049dto0_uid233_alignedZ_uid58_fpCosPiTest_b <= LeftShiftStage049dto0_uid233_alignedZ_uid58_fpCosPiTest_in(49 downto 0);

	--ld_LeftShiftStage049dto0_uid233_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx3_uid234_alignedZ_uid58_fpCosPiTest_b(DELAY,622)@23
    ld_LeftShiftStage049dto0_uid233_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx3_uid234_alignedZ_uid58_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 50, depth => 1 )
    PORT MAP ( xin => LeftShiftStage049dto0_uid233_alignedZ_uid58_fpCosPiTest_b, xout => ld_LeftShiftStage049dto0_uid233_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx3_uid234_alignedZ_uid58_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx3_uid234_alignedZ_uid58_fpCosPiTest(BITJOIN,233)@24
    leftShiftStage1Idx3_uid234_alignedZ_uid58_fpCosPiTest_q <= ld_LeftShiftStage049dto0_uid233_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx3_uid234_alignedZ_uid58_fpCosPiTest_b_q & leftShiftStage0Idx3Pad12_uid160_fxpX_uid42_fpCosPiTest_q;

	--LeftShiftStage053dto0_uid230_alignedZ_uid58_fpCosPiTest(BITSELECT,229)@23
    LeftShiftStage053dto0_uid230_alignedZ_uid58_fpCosPiTest_in <= leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_q(53 downto 0);
    LeftShiftStage053dto0_uid230_alignedZ_uid58_fpCosPiTest_b <= LeftShiftStage053dto0_uid230_alignedZ_uid58_fpCosPiTest_in(53 downto 0);

	--ld_LeftShiftStage053dto0_uid230_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx2_uid231_alignedZ_uid58_fpCosPiTest_b(DELAY,620)@23
    ld_LeftShiftStage053dto0_uid230_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx2_uid231_alignedZ_uid58_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 54, depth => 1 )
    PORT MAP ( xin => LeftShiftStage053dto0_uid230_alignedZ_uid58_fpCosPiTest_b, xout => ld_LeftShiftStage053dto0_uid230_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx2_uid231_alignedZ_uid58_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx2_uid231_alignedZ_uid58_fpCosPiTest(BITJOIN,230)@24
    leftShiftStage1Idx2_uid231_alignedZ_uid58_fpCosPiTest_q <= ld_LeftShiftStage053dto0_uid230_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx2_uid231_alignedZ_uid58_fpCosPiTest_b_q & cstAllZwE_uid28_fpCosPiTest_q;

	--LeftShiftStage057dto0_uid227_alignedZ_uid58_fpCosPiTest(BITSELECT,226)@23
    LeftShiftStage057dto0_uid227_alignedZ_uid58_fpCosPiTest_in <= leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_q(57 downto 0);
    LeftShiftStage057dto0_uid227_alignedZ_uid58_fpCosPiTest_b <= LeftShiftStage057dto0_uid227_alignedZ_uid58_fpCosPiTest_in(57 downto 0);

	--ld_LeftShiftStage057dto0_uid227_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx1_uid228_alignedZ_uid58_fpCosPiTest_b(DELAY,618)@23
    ld_LeftShiftStage057dto0_uid227_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx1_uid228_alignedZ_uid58_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 58, depth => 1 )
    PORT MAP ( xin => LeftShiftStage057dto0_uid227_alignedZ_uid58_fpCosPiTest_b, xout => ld_LeftShiftStage057dto0_uid227_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx1_uid228_alignedZ_uid58_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx1_uid228_alignedZ_uid58_fpCosPiTest(BITJOIN,227)@24
    leftShiftStage1Idx1_uid228_alignedZ_uid58_fpCosPiTest_q <= ld_LeftShiftStage057dto0_uid227_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage1Idx1_uid228_alignedZ_uid58_fpCosPiTest_b_q & leftShiftStage0Idx1Pad4_uid154_fxpX_uid42_fpCosPiTest_q;

	--reg_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_2(REG,398)@23
    reg_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_2_q <= leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest(BITSELECT,234)@22
    leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_in <= r_uid212_lzcZ_uid57_fpCosPiTest_q(3 downto 0);
    leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_b <= leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_in(3 downto 2);

	--ld_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_b_to_reg_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_1_a(DELAY,791)@22
    ld_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_b_to_reg_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_b, xout => ld_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_b_to_reg_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_1(REG,397)@23
    reg_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_1_q <= ld_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_b_to_reg_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest(MUX,235)@24
    leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_s <= reg_leftShiftStageSel3Dto2_uid235_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_1_q;
    leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest: PROCESS (leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_s, en, reg_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_2_q, leftShiftStage1Idx1_uid228_alignedZ_uid58_fpCosPiTest_q, leftShiftStage1Idx2_uid231_alignedZ_uid58_fpCosPiTest_q, leftShiftStage1Idx3_uid234_alignedZ_uid58_fpCosPiTest_q)
    BEGIN
            CASE leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_q <= reg_leftShiftStage0_uid225_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_q <= leftShiftStage1Idx1_uid228_alignedZ_uid58_fpCosPiTest_q;
                  WHEN "10" => leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_q <= leftShiftStage1Idx2_uid231_alignedZ_uid58_fpCosPiTest_q;
                  WHEN "11" => leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_q <= leftShiftStage1Idx3_uid234_alignedZ_uid58_fpCosPiTest_q;
                  WHEN OTHERS => leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage158dto0_uid244_alignedZ_uid58_fpCosPiTest(BITSELECT,243)@24
    LeftShiftStage158dto0_uid244_alignedZ_uid58_fpCosPiTest_in <= leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_q(58 downto 0);
    LeftShiftStage158dto0_uid244_alignedZ_uid58_fpCosPiTest_b <= LeftShiftStage158dto0_uid244_alignedZ_uid58_fpCosPiTest_in(58 downto 0);

	--ld_LeftShiftStage158dto0_uid244_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx3_uid245_alignedZ_uid58_fpCosPiTest_b(DELAY,634)@24
    ld_LeftShiftStage158dto0_uid244_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx3_uid245_alignedZ_uid58_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 59, depth => 1 )
    PORT MAP ( xin => LeftShiftStage158dto0_uid244_alignedZ_uid58_fpCosPiTest_b, xout => ld_LeftShiftStage158dto0_uid244_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx3_uid245_alignedZ_uid58_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx3_uid245_alignedZ_uid58_fpCosPiTest(BITJOIN,244)@25
    leftShiftStage2Idx3_uid245_alignedZ_uid58_fpCosPiTest_q <= ld_LeftShiftStage158dto0_uid244_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx3_uid245_alignedZ_uid58_fpCosPiTest_b_q & leftShiftStage1Idx3Pad3_uid171_fxpX_uid42_fpCosPiTest_q;

	--LeftShiftStage159dto0_uid241_alignedZ_uid58_fpCosPiTest(BITSELECT,240)@24
    LeftShiftStage159dto0_uid241_alignedZ_uid58_fpCosPiTest_in <= leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_q(59 downto 0);
    LeftShiftStage159dto0_uid241_alignedZ_uid58_fpCosPiTest_b <= LeftShiftStage159dto0_uid241_alignedZ_uid58_fpCosPiTest_in(59 downto 0);

	--ld_LeftShiftStage159dto0_uid241_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx2_uid242_alignedZ_uid58_fpCosPiTest_b(DELAY,632)@24
    ld_LeftShiftStage159dto0_uid241_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx2_uid242_alignedZ_uid58_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 60, depth => 1 )
    PORT MAP ( xin => LeftShiftStage159dto0_uid241_alignedZ_uid58_fpCosPiTest_b, xout => ld_LeftShiftStage159dto0_uid241_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx2_uid242_alignedZ_uid58_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx2_uid242_alignedZ_uid58_fpCosPiTest(BITJOIN,241)@25
    leftShiftStage2Idx2_uid242_alignedZ_uid58_fpCosPiTest_q <= ld_LeftShiftStage159dto0_uid241_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx2_uid242_alignedZ_uid58_fpCosPiTest_b_q & leftShiftStage1Idx2Pad2_uid168_fxpX_uid42_fpCosPiTest_q;

	--LeftShiftStage160dto0_uid238_alignedZ_uid58_fpCosPiTest(BITSELECT,237)@24
    LeftShiftStage160dto0_uid238_alignedZ_uid58_fpCosPiTest_in <= leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_q(60 downto 0);
    LeftShiftStage160dto0_uid238_alignedZ_uid58_fpCosPiTest_b <= LeftShiftStage160dto0_uid238_alignedZ_uid58_fpCosPiTest_in(60 downto 0);

	--ld_LeftShiftStage160dto0_uid238_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx1_uid239_alignedZ_uid58_fpCosPiTest_b(DELAY,630)@24
    ld_LeftShiftStage160dto0_uid238_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx1_uid239_alignedZ_uid58_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 61, depth => 1 )
    PORT MAP ( xin => LeftShiftStage160dto0_uid238_alignedZ_uid58_fpCosPiTest_b, xout => ld_LeftShiftStage160dto0_uid238_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx1_uid239_alignedZ_uid58_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx1_uid239_alignedZ_uid58_fpCosPiTest(BITJOIN,238)@25
    leftShiftStage2Idx1_uid239_alignedZ_uid58_fpCosPiTest_q <= ld_LeftShiftStage160dto0_uid238_alignedZ_uid58_fpCosPiTest_b_to_leftShiftStage2Idx1_uid239_alignedZ_uid58_fpCosPiTest_b_q & GND_q;

	--reg_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_2(REG,400)@24
    reg_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_2_q <= leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest(BITSELECT,245)@22
    leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_in <= r_uid212_lzcZ_uid57_fpCosPiTest_q(1 downto 0);
    leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_b <= leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_in(1 downto 0);

	--ld_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_b_to_reg_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_1_a(DELAY,793)@22
    ld_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_b_to_reg_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 2 )
    PORT MAP ( xin => leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_b, xout => ld_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_b_to_reg_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_1(REG,399)@24
    reg_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_1_q <= ld_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_b_to_reg_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest(MUX,246)@25
    leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_s <= reg_leftShiftStageSel1Dto0_uid246_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_1_q;
    leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest: PROCESS (leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_s, en, reg_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_2_q, leftShiftStage2Idx1_uid239_alignedZ_uid58_fpCosPiTest_q, leftShiftStage2Idx2_uid242_alignedZ_uid58_fpCosPiTest_q, leftShiftStage2Idx3_uid245_alignedZ_uid58_fpCosPiTest_q)
    BEGIN
            CASE leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_s IS
                  WHEN "00" => leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_q <= reg_leftShiftStage1_uid236_alignedZ_uid58_fpCosPiTest_0_to_leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_2_q;
                  WHEN "01" => leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_q <= leftShiftStage2Idx1_uid239_alignedZ_uid58_fpCosPiTest_q;
                  WHEN "10" => leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_q <= leftShiftStage2Idx2_uid242_alignedZ_uid58_fpCosPiTest_q;
                  WHEN "11" => leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_q <= leftShiftStage2Idx3_uid245_alignedZ_uid58_fpCosPiTest_q;
                  WHEN OTHERS => leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--p_uid59_fpCosPiTest(BITSELECT,58)@25
    p_uid59_fpCosPiTest_in <= leftShiftStage2_uid247_alignedZ_uid58_fpCosPiTest_q;
    p_uid59_fpCosPiTest_b <= p_uid59_fpCosPiTest_in(61 downto 36);

	--ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_inputreg(DELAY,952)
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => p_uid59_fpCosPiTest_b, xout => ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt(COUNTER,954)
    -- every=1, low=0, high=2, step=1, init=1
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_i = 1 THEN
                      ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_eq = '1') THEN
                        ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_i <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_i - 2;
                    ELSE
                        ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_i <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_i,2));


	--ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdreg(REG,955)
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdreg_q <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdmux(MUX,956)
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdmux_s <= en;
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdmux: PROCESS (ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdmux_s, ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdreg_q, ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdmux_q <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdreg_q;
                  WHEN "1" => ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdmux_q <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem(DUALMEM,953)
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_ia <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_inputreg_q;
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_aa <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdreg_q;
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_ab <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_rdmux_q;
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 26,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 26,
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
        clocken1 => ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_iq,
        address_a => ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_aa,
        data_a => ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_ia
    );
    ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_reset0 <= areset;
        ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_q <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_iq(25 downto 0);

	--reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0(REG,410)@30
    reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_q <= ld_p_uid59_fpCosPiTest_b_to_reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--mul2xSinRes_uid68_fpCosPiTest(MULT,67)@31
    mul2xSinRes_uid68_fpCosPiTest_pr <= UNSIGNED(mul2xSinRes_uid68_fpCosPiTest_a) * UNSIGNED(mul2xSinRes_uid68_fpCosPiTest_b);
    mul2xSinRes_uid68_fpCosPiTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid68_fpCosPiTest_a <= (others => '0');
            mul2xSinRes_uid68_fpCosPiTest_b <= (others => '0');
            mul2xSinRes_uid68_fpCosPiTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mul2xSinRes_uid68_fpCosPiTest_a <= reg_p_uid59_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_0_q;
                mul2xSinRes_uid68_fpCosPiTest_b <= reg_fxpSinRes_uid67_fpCosPiTest_0_to_mul2xSinRes_uid68_fpCosPiTest_1_q;
                mul2xSinRes_uid68_fpCosPiTest_s1 <= STD_LOGIC_VECTOR(mul2xSinRes_uid68_fpCosPiTest_pr);
            END IF;
        END IF;
    END PROCESS;
    mul2xSinRes_uid68_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid68_fpCosPiTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mul2xSinRes_uid68_fpCosPiTest_q <= mul2xSinRes_uid68_fpCosPiTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normBit_uid69_fpCosPiTest(BITSELECT,68)@34
    normBit_uid69_fpCosPiTest_in <= mul2xSinRes_uid68_fpCosPiTest_q;
    normBit_uid69_fpCosPiTest_b <= normBit_uid69_fpCosPiTest_in(51 downto 51);

	--rndOp_uid74_uid75_fpCosPiTest(BITJOIN,74)@34
    rndOp_uid74_uid75_fpCosPiTest_q <= normBit_uid69_fpCosPiTest_b & cstAllZWF_uid7_fpCosPiTest_q & VCC_q;

	--ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_nor(LOGICAL,824)
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_nor_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q;
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_nor_b <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_sticky_ena_q;
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_nor_q <= not (ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_nor_a or ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_nor_b);

	--ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_sticky_ena(REG,825)
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_nor_q = "1") THEN
                ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_sticky_ena_q <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_enaAnd(LOGICAL,826)
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_enaAnd_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_sticky_ena_q;
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_enaAnd_b <= en;
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_enaAnd_q <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_enaAnd_a and ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_enaAnd_b;

	--reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1(REG,412)@22
    reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q <= r_uid212_lzcZ_uid57_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_inputreg(DELAY,814)
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q, xout => ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem(DUALMEM,815)
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_ia <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_inputreg_q;
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_aa <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdreg_q;
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_ab <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_rdmux_q;
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_iq,
        address_a => ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_aa,
        data_a => ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_ia
    );
    ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_reset0 <= areset;
        ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_q <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_iq(5 downto 0);

	--expHardCase_uid61_fpCosPiTest(SUB,60)@33
    expHardCase_uid61_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & biasM1_uid60_fpCosPiTest_q);
    expHardCase_uid61_fpCosPiTest_b <= STD_LOGIC_VECTOR("000" & ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_replace_mem_q);
            expHardCase_uid61_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expHardCase_uid61_fpCosPiTest_a) - UNSIGNED(expHardCase_uid61_fpCosPiTest_b));
    expHardCase_uid61_fpCosPiTest_q <= expHardCase_uid61_fpCosPiTest_o(8 downto 0);


	--expP_uid62_fpCosPiTest(BITSELECT,61)@33
    expP_uid62_fpCosPiTest_in <= expHardCase_uid61_fpCosPiTest_q(7 downto 0);
    expP_uid62_fpCosPiTest_b <= expP_uid62_fpCosPiTest_in(7 downto 0);

	--reg_expP_uid62_fpCosPiTest_0_to_expRCompFracRCompPreRnd_uid73_uid73_fpCosPiTest_1(REG,413)@33
    reg_expP_uid62_fpCosPiTest_0_to_expRCompFracRCompPreRnd_uid73_uid73_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expP_uid62_fpCosPiTest_0_to_expRCompFracRCompPreRnd_uid73_uid73_fpCosPiTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expP_uid62_fpCosPiTest_0_to_expRCompFracRCompPreRnd_uid73_uid73_fpCosPiTest_1_q <= expP_uid62_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--highRes_uid70_fpCosPiTest(BITSELECT,69)@34
    highRes_uid70_fpCosPiTest_in <= mul2xSinRes_uid68_fpCosPiTest_q(50 downto 0);
    highRes_uid70_fpCosPiTest_b <= highRes_uid70_fpCosPiTest_in(50 downto 27);

	--lowRes_uid71_fpCosPiTest(BITSELECT,70)@34
    lowRes_uid71_fpCosPiTest_in <= mul2xSinRes_uid68_fpCosPiTest_q(49 downto 0);
    lowRes_uid71_fpCosPiTest_b <= lowRes_uid71_fpCosPiTest_in(49 downto 26);

	--fracRCompPreRnd_uid72_fpCosPiTest(MUX,71)@34
    fracRCompPreRnd_uid72_fpCosPiTest_s <= normBit_uid69_fpCosPiTest_b;
    fracRCompPreRnd_uid72_fpCosPiTest: PROCESS (fracRCompPreRnd_uid72_fpCosPiTest_s, en, lowRes_uid71_fpCosPiTest_b, highRes_uid70_fpCosPiTest_b)
    BEGIN
            CASE fracRCompPreRnd_uid72_fpCosPiTest_s IS
                  WHEN "0" => fracRCompPreRnd_uid72_fpCosPiTest_q <= lowRes_uid71_fpCosPiTest_b;
                  WHEN "1" => fracRCompPreRnd_uid72_fpCosPiTest_q <= highRes_uid70_fpCosPiTest_b;
                  WHEN OTHERS => fracRCompPreRnd_uid72_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expRCompFracRCompPreRnd_uid73_uid73_fpCosPiTest(BITJOIN,72)@34
    expRCompFracRCompPreRnd_uid73_uid73_fpCosPiTest_q <= reg_expP_uid62_fpCosPiTest_0_to_expRCompFracRCompPreRnd_uid73_uid73_fpCosPiTest_1_q & fracRCompPreRnd_uid72_fpCosPiTest_q;

	--expRCompFracRComp_uid76_fpCosPiTest(ADD,75)@34
    expRCompFracRComp_uid76_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & expRCompFracRCompPreRnd_uid73_uid73_fpCosPiTest_q);
    expRCompFracRComp_uid76_fpCosPiTest_b <= STD_LOGIC_VECTOR("00000000" & rndOp_uid74_uid75_fpCosPiTest_q);
            expRCompFracRComp_uid76_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompFracRComp_uid76_fpCosPiTest_a) + UNSIGNED(expRCompFracRComp_uid76_fpCosPiTest_b));
    expRCompFracRComp_uid76_fpCosPiTest_q <= expRCompFracRComp_uid76_fpCosPiTest_o(32 downto 0);


	--expRComp_uid78_fpCosPiTest(BITSELECT,77)@34
    expRComp_uid78_fpCosPiTest_in <= expRCompFracRComp_uid76_fpCosPiTest_q(31 downto 0);
    expRComp_uid78_fpCosPiTest_b <= expRComp_uid78_fpCosPiTest_in(31 downto 24);

	--reg_expRComp_uid78_fpCosPiTest_0_to_expRPostExc_uid90_fpCosPiTest_2(REG,418)@34
    reg_expRComp_uid78_fpCosPiTest_0_to_expRPostExc_uid90_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRComp_uid78_fpCosPiTest_0_to_expRPostExc_uid90_fpCosPiTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRComp_uid78_fpCosPiTest_0_to_expRPostExc_uid90_fpCosPiTest_2_q <= expRComp_uid78_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_nor(LOGICAL,837)
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_nor_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q;
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_nor_b <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_sticky_ena_q;
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_nor_q <= not (ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_nor_a or ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_nor_b);

	--ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_mem_top(CONSTANT,833)
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_mem_top_q <= "01101";

	--ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmp(LOGICAL,834)
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmp_a <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_mem_top_q;
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdmux_q);
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmp_q <= "1" when ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmp_a = ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmp_b else "0";

	--ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmpReg(REG,835)
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmpReg_q <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_sticky_ena(REG,838)
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_nor_q = "1") THEN
                ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_sticky_ena_q <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_enaAnd(LOGICAL,839)
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_enaAnd_a <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_sticky_ena_q;
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_enaAnd_b <= en;
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_enaAnd_q <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_enaAnd_a and ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_enaAnd_b;

	--ld_cosXIsOne_uid36_fpCosPiTest_n_to_expSelBits_uid87_fpCosPiTest_b(DELAY,492)@0
    ld_cosXIsOne_uid36_fpCosPiTest_n_to_expSelBits_uid87_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => cosXIsOne_uid36_fpCosPiTest_n, xout => ld_cosXIsOne_uid36_fpCosPiTest_n_to_expSelBits_uid87_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--ld_cosXIsOneXRR_uid37_fpCosPiTest_n_to_InvCosXIsOneXRR_uid79_fpCosPiTest_a(DELAY,474)@14
    ld_cosXIsOneXRR_uid37_fpCosPiTest_n_to_InvCosXIsOneXRR_uid79_fpCosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => cosXIsOneXRR_uid37_fpCosPiTest_n, xout => ld_cosXIsOneXRR_uid37_fpCosPiTest_n_to_InvCosXIsOneXRR_uid79_fpCosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_join_uid86_fpCosPiTest_2(REG,416)@16
    reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_join_uid86_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_join_uid86_fpCosPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_join_uid86_fpCosPiTest_2_q <= ld_cosXIsOneXRR_uid37_fpCosPiTest_n_to_InvCosXIsOneXRR_uid79_fpCosPiTest_a_q;
            END IF;
        END IF;
    END PROCESS;


	--InvCosXIsOneXRR_uid79_fpCosPiTest(LOGICAL,78)@16
    InvCosXIsOneXRR_uid79_fpCosPiTest_a <= ld_cosXIsOneXRR_uid37_fpCosPiTest_n_to_InvCosXIsOneXRR_uid79_fpCosPiTest_a_q;
    InvCosXIsOneXRR_uid79_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvCosXIsOneXRR_uid79_fpCosPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvCosXIsOneXRR_uid79_fpCosPiTest_q <= not InvCosXIsOneXRR_uid79_fpCosPiTest_a;
        END IF;
    END PROCESS;



	--InvCosXIsOne_uid80_fpCosPiTest(LOGICAL,79)@0
    InvCosXIsOne_uid80_fpCosPiTest_a <= cosXIsOne_uid36_fpCosPiTest_n;
    InvCosXIsOne_uid80_fpCosPiTest_q <= not InvCosXIsOne_uid80_fpCosPiTest_a;

	--ld_InvCosXIsOne_uid80_fpCosPiTest_q_to_yHalfCosNotOne_uid81_fpCosPiTest_b(DELAY,477)@0
    ld_InvCosXIsOne_uid80_fpCosPiTest_q_to_yHalfCosNotOne_uid81_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => InvCosXIsOne_uid80_fpCosPiTest_q, xout => ld_InvCosXIsOne_uid80_fpCosPiTest_q_to_yHalfCosNotOne_uid81_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--cstZmwFRRPwSM1_uid46_fpCosPiTest(CONSTANT,45)
    cstZmwFRRPwSM1_uid46_fpCosPiTest_q <= "00000000000000000000000000000000000000000000000000000000000000";

	--half_uid47_fpCosPiTest(BITJOIN,46)@17
    half_uid47_fpCosPiTest_q <= VCC_q & cstZmwFRRPwSM1_uid46_fpCosPiTest_q;

	--yIsHalf_uid48_fpCosPiTest(LOGICAL,47)@17
    yIsHalf_uid48_fpCosPiTest_a <= reg_y_uid44_fpCosPiTest_0_to_yIsHalf_uid48_fpCosPiTest_1_q;
    yIsHalf_uid48_fpCosPiTest_b <= half_uid47_fpCosPiTest_q;
    yIsHalf_uid48_fpCosPiTest_q <= "1" when yIsHalf_uid48_fpCosPiTest_a = yIsHalf_uid48_fpCosPiTest_b else "0";

	--yHalfCosNotOne_uid81_fpCosPiTest(LOGICAL,80)@17
    yHalfCosNotOne_uid81_fpCosPiTest_a <= yIsHalf_uid48_fpCosPiTest_q;
    yHalfCosNotOne_uid81_fpCosPiTest_b <= ld_InvCosXIsOne_uid80_fpCosPiTest_q_to_yHalfCosNotOne_uid81_fpCosPiTest_b_q;
    yHalfCosNotOne_uid81_fpCosPiTest_c <= InvCosXIsOneXRR_uid79_fpCosPiTest_q;
    yHalfCosNotOne_uid81_fpCosPiTest_q <= yHalfCosNotOne_uid81_fpCosPiTest_a and yHalfCosNotOne_uid81_fpCosPiTest_b and yHalfCosNotOne_uid81_fpCosPiTest_c;

	--excRNaN_uid82_fpCosPiTest(LOGICAL,81)@0
    excRNaN_uid82_fpCosPiTest_a <= exc_N_uid17_fpCosPiTest_q;
    excRNaN_uid82_fpCosPiTest_b <= exc_I_uid15_fpCosPiTest_q;
    excRNaN_uid82_fpCosPiTest_q <= excRNaN_uid82_fpCosPiTest_a or excRNaN_uid82_fpCosPiTest_b;

	--ld_excRNaN_uid82_fpCosPiTest_q_to_join_uid86_fpCosPiTest_a(DELAY,488)@0
    ld_excRNaN_uid82_fpCosPiTest_q_to_join_uid86_fpCosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => excRNaN_uid82_fpCosPiTest_q, xout => ld_excRNaN_uid82_fpCosPiTest_q_to_join_uid86_fpCosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--join_uid86_fpCosPiTest(BITJOIN,85)@17
    join_uid86_fpCosPiTest_q <= reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_join_uid86_fpCosPiTest_2_q & yHalfCosNotOne_uid81_fpCosPiTest_q & ld_excRNaN_uid82_fpCosPiTest_q_to_join_uid86_fpCosPiTest_a_q;

	--expSelBits_uid87_fpCosPiTest(BITJOIN,86)@17
    expSelBits_uid87_fpCosPiTest_q <= ld_cosXIsOne_uid36_fpCosPiTest_n_to_expSelBits_uid87_fpCosPiTest_b_q & join_uid86_fpCosPiTest_q;

	--reg_expSelBits_uid87_fpCosPiTest_0_to_expSelector_uid88_fpCosPiTest_0(REG,417)@17
    reg_expSelBits_uid87_fpCosPiTest_0_to_expSelector_uid88_fpCosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expSelBits_uid87_fpCosPiTest_0_to_expSelector_uid88_fpCosPiTest_0_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expSelBits_uid87_fpCosPiTest_0_to_expSelector_uid88_fpCosPiTest_0_q <= expSelBits_uid87_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expSelector_uid88_fpCosPiTest(LOOKUP,87)@18
    expSelector_uid88_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSelector_uid88_fpCosPiTest_q <= "00";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_expSelBits_uid87_fpCosPiTest_0_to_expSelector_uid88_fpCosPiTest_0_q) IS
                WHEN "0000" =>  expSelector_uid88_fpCosPiTest_q <= "00";
                WHEN "0001" =>  expSelector_uid88_fpCosPiTest_q <= "11";
                WHEN "0010" =>  expSelector_uid88_fpCosPiTest_q <= "10";
                WHEN "0011" =>  expSelector_uid88_fpCosPiTest_q <= "00";
                WHEN "0100" =>  expSelector_uid88_fpCosPiTest_q <= "01";
                WHEN "0101" =>  expSelector_uid88_fpCosPiTest_q <= "11";
                WHEN "0110" =>  expSelector_uid88_fpCosPiTest_q <= "10";
                WHEN "0111" =>  expSelector_uid88_fpCosPiTest_q <= "00";
                WHEN "1000" =>  expSelector_uid88_fpCosPiTest_q <= "01";
                WHEN "1001" =>  expSelector_uid88_fpCosPiTest_q <= "11";
                WHEN "1010" =>  expSelector_uid88_fpCosPiTest_q <= "10";
                WHEN "1011" =>  expSelector_uid88_fpCosPiTest_q <= "00";
                WHEN "1100" =>  expSelector_uid88_fpCosPiTest_q <= "01";
                WHEN "1101" =>  expSelector_uid88_fpCosPiTest_q <= "11";
                WHEN "1110" =>  expSelector_uid88_fpCosPiTest_q <= "10";
                WHEN "1111" =>  expSelector_uid88_fpCosPiTest_q <= "00";
                WHEN OTHERS =>
                    expSelector_uid88_fpCosPiTest_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_inputreg(DELAY,827)
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => expSelector_uid88_fpCosPiTest_q, xout => ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt(COUNTER,829)
    -- every=1, low=0, high=13, step=1, init=1
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_i = 12 THEN
                      ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_eq = '1') THEN
                        ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_i <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_i - 13;
                    ELSE
                        ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_i <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_i,4));


	--ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdreg(REG,830)
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdreg_q <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdmux(MUX,831)
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdmux_s <= en;
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdmux: PROCESS (ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdmux_s, ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdreg_q, ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdmux_q <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdmux_q <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem(DUALMEM,828)
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_ia <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_inputreg_q;
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_aa <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdreg_q;
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_ab <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdmux_q;
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 4,
        numwords_a => 14,
        width_b => 2,
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
        clocken1 => ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_iq,
        address_a => ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_aa,
        data_a => ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_ia
    );
    ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_reset0 <= areset;
        ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_q <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_iq(1 downto 0);

	--expRPostExc_uid90_fpCosPiTest(MUX,89)@35
    expRPostExc_uid90_fpCosPiTest_s <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_mem_q;
    expRPostExc_uid90_fpCosPiTest: PROCESS (expRPostExc_uid90_fpCosPiTest_s, en, reg_expRComp_uid78_fpCosPiTest_0_to_expRPostExc_uid90_fpCosPiTest_2_q, cstBias_uid22_fpCosPiTest_q, cstAllZwE_uid28_fpCosPiTest_q, cstAllOWE_uid6_fpCosPiTest_q)
    BEGIN
            CASE expRPostExc_uid90_fpCosPiTest_s IS
                  WHEN "00" => expRPostExc_uid90_fpCosPiTest_q <= reg_expRComp_uid78_fpCosPiTest_0_to_expRPostExc_uid90_fpCosPiTest_2_q;
                  WHEN "01" => expRPostExc_uid90_fpCosPiTest_q <= cstBias_uid22_fpCosPiTest_q;
                  WHEN "10" => expRPostExc_uid90_fpCosPiTest_q <= cstAllZwE_uid28_fpCosPiTest_q;
                  WHEN "11" => expRPostExc_uid90_fpCosPiTest_q <= cstAllOWE_uid6_fpCosPiTest_q;
                  WHEN OTHERS => expRPostExc_uid90_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--cstNaNwF_uid30_fpCosPiTest(CONSTANT,29)
    cstNaNwF_uid30_fpCosPiTest_q <= "00000000000000000000001";

	--fracRComp_uid77_fpCosPiTest(BITSELECT,76)@34
    fracRComp_uid77_fpCosPiTest_in <= expRCompFracRComp_uid76_fpCosPiTest_q(23 downto 0);
    fracRComp_uid77_fpCosPiTest_b <= fracRComp_uid77_fpCosPiTest_in(23 downto 1);

	--reg_fracRComp_uid77_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_2(REG,415)@34
    reg_fracRComp_uid77_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRComp_uid77_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_2_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRComp_uid77_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_2_q <= fracRComp_uid77_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_nor(LOGICAL,975)
    ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_nor_a <= ld_reg_r_uid212_lzcZ_uid57_fpCosPiTest_0_to_expHardCase_uid61_fpCosPiTest_1_q_to_expHardCase_uid61_fpCosPiTest_b_notEnable_q;
    ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_nor_b <= ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_sticky_ena_q;
    ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_nor_q <= not (ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_nor_a or ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_nor_b);

	--ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_sticky_ena(REG,976)
    ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_nor_q = "1") THEN
                ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_sticky_ena_q <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_enaAnd(LOGICAL,977)
    ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_enaAnd_a <= ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_sticky_ena_q;
    ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_enaAnd_b <= en;
    ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_enaAnd_q <= ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_enaAnd_a and ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_enaAnd_b;

	--reg_excRNaN_uid82_fpCosPiTest_0_to_join_uid84_fpCosPiTest_1(REG,383)@17
    reg_excRNaN_uid82_fpCosPiTest_0_to_join_uid84_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excRNaN_uid82_fpCosPiTest_0_to_join_uid84_fpCosPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excRNaN_uid82_fpCosPiTest_0_to_join_uid84_fpCosPiTest_1_q <= ld_excRNaN_uid82_fpCosPiTest_q_to_join_uid86_fpCosPiTest_a_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_3(REG,382)@14
    reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_3_q <= cosXIsOneXRR_uid37_fpCosPiTest_n;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_3_q_to_excZOrCosOne_uid83_fpCosPiTest_c(DELAY,483)@15
    ld_reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_3_q_to_excZOrCosOne_uid83_fpCosPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_3_q, xout => ld_reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_3_q_to_excZOrCosOne_uid83_fpCosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_cosXIsOne_uid36_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_2(REG,381)@17
    reg_cosXIsOne_uid36_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cosXIsOne_uid36_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cosXIsOne_uid36_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_2_q <= ld_cosXIsOne_uid36_fpCosPiTest_n_to_expSelBits_uid87_fpCosPiTest_b_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_yHalfCosNotOne_uid81_fpCosPiTest_0_to_excZOrCosOne_uid83_fpCosPiTest_1(REG,380)@17
    reg_yHalfCosNotOne_uid81_fpCosPiTest_0_to_excZOrCosOne_uid83_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yHalfCosNotOne_uid81_fpCosPiTest_0_to_excZOrCosOne_uid83_fpCosPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yHalfCosNotOne_uid81_fpCosPiTest_0_to_excZOrCosOne_uid83_fpCosPiTest_1_q <= yHalfCosNotOne_uid81_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excZOrCosOne_uid83_fpCosPiTest(LOGICAL,82)@18
    excZOrCosOne_uid83_fpCosPiTest_a <= reg_yHalfCosNotOne_uid81_fpCosPiTest_0_to_excZOrCosOne_uid83_fpCosPiTest_1_q;
    excZOrCosOne_uid83_fpCosPiTest_b <= reg_cosXIsOne_uid36_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_2_q;
    excZOrCosOne_uid83_fpCosPiTest_c <= ld_reg_cosXIsOneXRR_uid37_fpCosPiTest_2_to_excZOrCosOne_uid83_fpCosPiTest_3_q_to_excZOrCosOne_uid83_fpCosPiTest_c_q;
    excZOrCosOne_uid83_fpCosPiTest_q <= excZOrCosOne_uid83_fpCosPiTest_a or excZOrCosOne_uid83_fpCosPiTest_b or excZOrCosOne_uid83_fpCosPiTest_c;

	--join_uid84_fpCosPiTest(BITJOIN,83)@18
    join_uid84_fpCosPiTest_q <= reg_excRNaN_uid82_fpCosPiTest_0_to_join_uid84_fpCosPiTest_1_q & excZOrCosOne_uid83_fpCosPiTest_q;

	--ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_inputreg(DELAY,965)
    ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_inputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => join_uid84_fpCosPiTest_q, xout => ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem(DUALMEM,966)
    ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_ia <= ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_inputreg_q;
    ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_aa <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdreg_q;
    ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_ab <= ld_expSelector_uid88_fpCosPiTest_q_to_expRPostExc_uid90_fpCosPiTest_b_replace_rdmux_q;
    ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 4,
        numwords_a => 14,
        width_b => 2,
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
        clocken1 => ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_iq,
        address_a => ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_aa,
        data_a => ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_ia
    );
    ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_reset0 <= areset;
        ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_q <= ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_iq(1 downto 0);

	--reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1(REG,414)@34
    reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_q <= ld_join_uid84_fpCosPiTest_q_to_reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--fracRPostExc_uid85_fpCosPiTest(MUX,84)@35
    fracRPostExc_uid85_fpCosPiTest_s <= reg_join_uid84_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_1_q;
    fracRPostExc_uid85_fpCosPiTest: PROCESS (fracRPostExc_uid85_fpCosPiTest_s, en, reg_fracRComp_uid77_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_2_q, cstAllZWF_uid7_fpCosPiTest_q, cstNaNwF_uid30_fpCosPiTest_q, cstNaNwF_uid30_fpCosPiTest_q)
    BEGIN
            CASE fracRPostExc_uid85_fpCosPiTest_s IS
                  WHEN "00" => fracRPostExc_uid85_fpCosPiTest_q <= reg_fracRComp_uid77_fpCosPiTest_0_to_fracRPostExc_uid85_fpCosPiTest_2_q;
                  WHEN "01" => fracRPostExc_uid85_fpCosPiTest_q <= cstAllZWF_uid7_fpCosPiTest_q;
                  WHEN "10" => fracRPostExc_uid85_fpCosPiTest_q <= cstNaNwF_uid30_fpCosPiTest_q;
                  WHEN "11" => fracRPostExc_uid85_fpCosPiTest_q <= cstNaNwF_uid30_fpCosPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid85_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--cosXR_uid105_fpCosPiTest(BITJOIN,104)@35
    cosXR_uid105_fpCosPiTest_q <= ld_signRNotNaNOrInf_uid104_fpCosPiTest_q_to_cosXR_uid105_fpCosPiTest_c_q & expRPostExc_uid90_fpCosPiTest_q & fracRPostExc_uid85_fpCosPiTest_q;

	--xOut(GPOUT,4)@35
    q <= cosXR_uid105_fpCosPiTest_q;


end normal;
