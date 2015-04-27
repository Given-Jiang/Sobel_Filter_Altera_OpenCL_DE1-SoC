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

-- VHDL created from fp_cospi_s5
-- VHDL created on Wed Feb 27 15:22:33 2013


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

entity fp_cospi_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_cospi_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid8_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid9_fpCosPiTest_q : std_logic_vector (22 downto 0);
    signal cstBias_uid10_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal cstBiasM1_uid11_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal cstBiasPwF_uid12_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal biasMwShiftMO_uid13_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal cst01pWShift_uid14_fpCosPiTest_q : std_logic_vector (12 downto 0);
    signal cstZwSwF_uid15_fpCosPiTest_q : std_logic_vector (34 downto 0);
    signal cstAllZWE_uid21_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal rangeReducedFxPX_uid51_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal rangeReducedFxPX_uid51_fpCosPiTest_q : std_logic_vector (35 downto 0);
    signal fracRPostExc1_uid86_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPostExc1_uid86_fpCosPiTest_q : std_logic_vector (22 downto 0);
    signal oneFracRPostExc2_uid87_fpCosPiTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc1_uid91_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal expRPostExc1_uid91_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal signRComp_uid99_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal signRComp_uid99_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal signRComp_uid99_fpCosPiTest_c : std_logic_vector(0 downto 0);
    signal signRComp_uid99_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal signR_uid101_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal signR_uid101_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal signR_uid101_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx1Pad16_uid105_fxpX_uid41_fpCosPiTest_q : std_logic_vector (15 downto 0);
    signal leftShiftStage0Idx2Pad32_uid108_fxpX_uid41_fpCosPiTest_q : std_logic_vector (31 downto 0);
    signal leftShiftStage0Idx3_uid111_fxpX_uid41_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage1Idx1Pad4_uid114_fxpX_uid41_fpCosPiTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage1Idx3Pad12_uid120_fxpX_uid41_fpCosPiTest_q : std_logic_vector (11 downto 0);
    signal leftShiftStage2Idx2Pad2_uid128_fxpX_uid41_fpCosPiTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage2Idx3Pad3_uid131_fxpX_uid41_fpCosPiTest_q : std_logic_vector (2 downto 0);
    signal mO_uid140_lzcZ_uid56_fpCosPiTest_q : std_logic_vector (28 downto 0);
    signal memoryC2_uid209_sinPiZTableGenerator_q : std_logic_vector(13 downto 0);
    signal prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_a : std_logic_vector (23 downto 0);
    signal prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_b : std_logic_vector (24 downto 0);
    signal prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_s1 : std_logic_vector (48 downto 0);
    signal prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_pr : UNSIGNED (48 downto 0);
    signal prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_q : std_logic_vector (48 downto 0);
    signal prodXY_uid226_pT1_uid211_sinPiZPolyEval_a : std_logic_vector (13 downto 0);
    signal prodXY_uid226_pT1_uid211_sinPiZPolyEval_b : std_logic_vector (13 downto 0);
    signal prodXY_uid226_pT1_uid211_sinPiZPolyEval_s1 : std_logic_vector (27 downto 0);
    signal prodXY_uid226_pT1_uid211_sinPiZPolyEval_pr : SIGNED (28 downto 0);
    signal prodXY_uid226_pT1_uid211_sinPiZPolyEval_q : std_logic_vector (27 downto 0);
    signal prodXY_uid229_pT2_uid217_sinPiZPolyEval_a : std_logic_vector (15 downto 0);
    signal prodXY_uid229_pT2_uid217_sinPiZPolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid229_pT2_uid217_sinPiZPolyEval_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid229_pT2_uid217_sinPiZPolyEval_pr : SIGNED (39 downto 0);
    signal prodXY_uid229_pT2_uid217_sinPiZPolyEval_q : std_logic_vector (38 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid123_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_2_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage1Idx1_uid116_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_3_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage1Idx2_uid119_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_4_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage1Idx3_uid122_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_5_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid134_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_fxpXFrac_uid43_fpCosPiTest_0_to_fxpXFracZero_uid45_fpCosPiTest_1_q : std_logic_vector (35 downto 0);
    signal reg_cosXIsOne_uid36_fpCosPiTest_1_to_bigCond_uid85_fpCosPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_xIsInt_uid80_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_fxpXFracHalf_uid46_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_3_q : std_logic_vector (0 downto 0);
    signal reg_expXIsZero_uid23_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_4_q : std_logic_vector (0 downto 0);
    signal reg_xIsHalf_uid83_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_5_q : std_logic_vector (0 downto 0);
    signal reg_pad_o_uid16_uid47_fpCosPiTest_0_to_oMFxpXFrac_uid47_fpCosPiTest_0_q : std_logic_vector (36 downto 0);
    signal reg_pad_half_uid17_uid52_fpCosPiTest_0_to_z_halfMRRFxPXE_uid52_fpCosPiTest_0_q : std_logic_vector (35 downto 0);
    signal reg_rVStage_uid138_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid139_lzcZ_uid56_fpCosPiTest_1_q : std_logic_vector (31 downto 0);
    signal reg_cStage_uid142_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid144_lzcZ_uid56_fpCosPiTest_3_q : std_logic_vector (31 downto 0);
    signal reg_rVStage_uid146_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid147_lzcZ_uid56_fpCosPiTest_1_q : std_logic_vector (15 downto 0);
    signal reg_vStage_uid148_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid150_lzcZ_uid56_fpCosPiTest_3_q : std_logic_vector (15 downto 0);
    signal reg_rVStage_uid158_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid159_lzcZ_uid56_fpCosPiTest_1_q : std_logic_vector (3 downto 0);
    signal reg_vStage_uid160_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid162_lzcZ_uid56_fpCosPiTest_3_q : std_logic_vector (3 downto 0);
    signal reg_vCount_uid153_lzcZ_uid56_fpCosPiTest_0_to_r_uid172_lzcZ_uid56_fpCosPiTest_3_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid193_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_2_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStage1Idx1_uid186_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_3_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStage1Idx2_uid189_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_4_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStage1Idx3_uid192_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_5_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid204_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_zAddr_uid62_fpCosPiTest_0_to_memoryC2_uid209_sinPiZTableGenerator_0_q : std_logic_vector (6 downto 0);
    signal reg_yT1_uid210_sinPiZPolyEval_0_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_0_q : std_logic_vector (13 downto 0);
    signal reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_q : std_logic_vector (15 downto 0);
    signal reg_s1_uid212_uid215_sinPiZPolyEval_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_q : std_logic_vector (23 downto 0);
    signal reg_fxpSinRes_uid65_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_1_q : std_logic_vector (24 downto 0);
    signal reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q : std_logic_vector (5 downto 0);
    signal reg_expP_uid60_fpCosPiTest_0_to_expFracPreRnd_uid71_uid71_fpCosPiTest_1_q : std_logic_vector (7 downto 0);
    signal reg_excRNaN_uid84_fpCosPiTest_0_to_fracRPostExc_uid88_fpCosPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q : std_logic_vector (1 downto 0);
    signal ld_FxpXFrac35_uid44_fpCosPiTest_b_to_rangeReducedFxPX_uid51_fpCosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_fxpXFrac_uid43_fpCosPiTest_b_to_rangeReducedFxPX_uid51_fpCosPiTest_c_q : std_logic_vector (35 downto 0);
    signal ld_cosXIsOne_uid36_fpCosPiTest_c_to_InvCosXIsOne_uid77_fpCosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_xEvenInt_uid35_fpCosPiTest_c_to_evenIntCosNotOneFZ_uid79_fpCosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid34_fpCosPiTest_q_to_xIsInt_uid80_fpCosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_reg_cosXIsOne_uid36_fpCosPiTest_1_to_bigCond_uid85_fpCosPiTest_1_q_to_bigCond_uid85_fpCosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_bigCond_uid85_fpCosPiTest_q_to_fracRPostExc1_uid86_fpCosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_excRNaN_uid84_fpCosPiTest_0_to_fracRPostExc_uid88_fpCosPiTest_1_q_to_fracRPostExc_uid88_fpCosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_xIsHalf_uid83_fpCosPiTest_q_to_expRPostExc1_uid91_fpCosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid23_fpCosPiTest_q_to_xIntOrXZOrCosOne_uid93_fpCosPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_rInfOrNaN_uid92_fpCosPiTest_q_to_join_uid94_fpCosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_xParityXorHalfParity_uid96_fpCosPiTest_q_to_signRComp_uid99_fpCosPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_fxpXFracHalf_uid46_fpCosPiTest_q_to_InvFxpXFracHalf_uid100_fpCosPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid101_fpCosPiTest_q_to_R_uid102_fpCosPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid147_lzcZ_uid56_fpCosPiTest_q_to_r_uid172_lzcZ_uid56_fpCosPiTest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid139_lzcZ_uid56_fpCosPiTest_q_to_r_uid172_lzcZ_uid56_fpCosPiTest_f_q : std_logic_vector (0 downto 0);
    signal ld_X18dto0_uid176_alignedZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest_b_q : std_logic_vector (18 downto 0);
    signal ld_vStage_uid141_lzcZ_uid56_fpCosPiTest_b_to_leftShiftStage0Idx2_uid180_alignedZ_uid57_fpCosPiTest_b_q : std_logic_vector (2 downto 0);
    signal ld_z_uid54_fpCosPiTest_b_to_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_c_q : std_logic_vector (34 downto 0);
    signal ld_reg_yT1_uid210_sinPiZPolyEval_0_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_0_q_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_a_q : std_logic_vector (13 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_ia : std_logic_vector (5 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_iq : std_logic_vector (5 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_q : std_logic_vector (5 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_sticky_ena_q : signal is true;
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_q : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_sticky_ena_q : signal is true;
    signal ld_X18dto0_uid176_alignedZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest_b_inputreg_q : std_logic_vector (18 downto 0);
    signal ld_z_uid54_fpCosPiTest_b_to_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_c_inputreg_q : std_logic_vector (34 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_reset0 : std_logic;
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_sticky_ena_q : signal is true;
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_reset0 : std_logic;
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_sticky_ena_q : signal is true;
    signal ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_inputreg_q : std_logic_vector (15 downto 0);
    signal ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_ia : std_logic_vector (15 downto 0);
    signal ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_iq : std_logic_vector (15 downto 0);
    signal ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_q : std_logic_vector (15 downto 0);
    signal ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_sticky_ena_q : signal is true;
    signal ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_reset0 : std_logic;
    signal ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_sticky_ena_q : signal is true;
    signal pad_o_uid16_uid47_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal pad_half_uid17_uid52_fpCosPiTest_q : std_logic_vector (35 downto 0);
    signal bigCond_uid85_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal bigCond_uid85_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal bigCond_uid85_fpCosPiTest_c : std_logic_vector(0 downto 0);
    signal bigCond_uid85_fpCosPiTest_d : std_logic_vector(0 downto 0);
    signal bigCond_uid85_fpCosPiTest_f : std_logic_vector(0 downto 0);
    signal bigCond_uid85_fpCosPiTest_g : std_logic_vector(0 downto 0);
    signal bigCond_uid85_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal InvCosXIsOne_uid77_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvCosXIsOne_uid77_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal InvXEvenInt_uid81_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvXEvenInt_uid81_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal InvFxpXFracHalf_uid100_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvFxpXFracHalf_uid100_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal cstHalfwSwFP1_uid18_fpCosPiTest_q : std_logic_vector (35 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal expX_uid6_fpCosPiTest_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid7_fpCosPiTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid7_fpCosPiTest_b : std_logic_vector (22 downto 0);
    signal expXIsZero_uid23_fpCosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid23_fpCosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid23_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid25_fpCosPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid25_fpCosPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid25_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid27_fpCosPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid27_fpCosPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid27_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid28_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid28_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid28_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal xEvenInt_uid35_fpCosPiTest_a : std_logic_vector(10 downto 0);
    signal xEvenInt_uid35_fpCosPiTest_b : std_logic_vector(10 downto 0);
    signal xEvenInt_uid35_fpCosPiTest_o : std_logic_vector (10 downto 0);
    signal xEvenInt_uid35_fpCosPiTest_cin : std_logic_vector (0 downto 0);
    signal xEvenInt_uid35_fpCosPiTest_c : std_logic_vector (0 downto 0);
    signal cosXIsOne_uid36_fpCosPiTest_a : std_logic_vector(10 downto 0);
    signal cosXIsOne_uid36_fpCosPiTest_b : std_logic_vector(10 downto 0);
    signal cosXIsOne_uid36_fpCosPiTest_o : std_logic_vector (10 downto 0);
    signal cosXIsOne_uid36_fpCosPiTest_cin : std_logic_vector (0 downto 0);
    signal cosXIsOne_uid36_fpCosPiTest_c : std_logic_vector (0 downto 0);
    signal shiftValFxPX_uid38_fpCosPiTest_a : std_logic_vector(8 downto 0);
    signal shiftValFxPX_uid38_fpCosPiTest_b : std_logic_vector(8 downto 0);
    signal shiftValFxPX_uid38_fpCosPiTest_o : std_logic_vector (8 downto 0);
    signal shiftValFxPX_uid38_fpCosPiTest_q : std_logic_vector (8 downto 0);
    signal fxpXFracZero_uid45_fpCosPiTest_a : std_logic_vector(35 downto 0);
    signal fxpXFracZero_uid45_fpCosPiTest_b : std_logic_vector(35 downto 0);
    signal fxpXFracZero_uid45_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal fxpXFracHalf_uid46_fpCosPiTest_a : std_logic_vector(35 downto 0);
    signal fxpXFracHalf_uid46_fpCosPiTest_b : std_logic_vector(35 downto 0);
    signal fxpXFracHalf_uid46_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal oMFxpXFrac_uid47_fpCosPiTest_a : std_logic_vector(37 downto 0);
    signal oMFxpXFrac_uid47_fpCosPiTest_b : std_logic_vector(37 downto 0);
    signal oMFxpXFrac_uid47_fpCosPiTest_o : std_logic_vector (37 downto 0);
    signal oMFxpXFrac_uid47_fpCosPiTest_q : std_logic_vector (37 downto 0);
    signal z_halfMRRFxPXE_uid52_fpCosPiTest_a : std_logic_vector(36 downto 0);
    signal z_halfMRRFxPXE_uid52_fpCosPiTest_b : std_logic_vector(36 downto 0);
    signal z_halfMRRFxPXE_uid52_fpCosPiTest_o : std_logic_vector (36 downto 0);
    signal z_halfMRRFxPXE_uid52_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal expHardCase_uid59_fpCosPiTest_a : std_logic_vector(8 downto 0);
    signal expHardCase_uid59_fpCosPiTest_b : std_logic_vector(8 downto 0);
    signal expHardCase_uid59_fpCosPiTest_o : std_logic_vector (8 downto 0);
    signal expHardCase_uid59_fpCosPiTest_q : std_logic_vector (8 downto 0);
    signal fracZCosNotOne_uid78_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal fracZCosNotOne_uid78_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal fracZCosNotOne_uid78_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal evenIntCosNotOneFZ_uid79_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal evenIntCosNotOneFZ_uid79_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal evenIntCosNotOneFZ_uid79_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal xIsInt_uid80_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal xIsInt_uid80_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal xIsInt_uid80_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal xIsHalf_uid83_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal xIsHalf_uid83_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal xIsHalf_uid83_fpCosPiTest_c : std_logic_vector(0 downto 0);
    signal xIsHalf_uid83_fpCosPiTest_d : std_logic_vector(0 downto 0);
    signal xIsHalf_uid83_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExc_uid88_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPostExc_uid88_fpCosPiTest_q : std_logic_vector (22 downto 0);
    signal xIntOrXZOrCosOne_uid93_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal xIntOrXZOrCosOne_uid93_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal xIntOrXZOrCosOne_uid93_fpCosPiTest_c : std_logic_vector(0 downto 0);
    signal xIntOrXZOrCosOne_uid93_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal expRPostExc_uid95_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid95_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal vCount_uid139_lzcZ_uid56_fpCosPiTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid139_lzcZ_uid56_fpCosPiTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid139_lzcZ_uid56_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid144_lzcZ_uid56_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid144_lzcZ_uid56_fpCosPiTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid147_lzcZ_uid56_fpCosPiTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid147_lzcZ_uid56_fpCosPiTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid147_lzcZ_uid56_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid150_lzcZ_uid56_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid150_lzcZ_uid56_fpCosPiTest_q : std_logic_vector (15 downto 0);
    signal vCount_uid159_lzcZ_uid56_fpCosPiTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid159_lzcZ_uid56_fpCosPiTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid159_lzcZ_uid56_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid162_lzcZ_uid56_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid162_lzcZ_uid56_fpCosPiTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_q : std_logic_vector (34 downto 0);
    signal memoryC0_uid207_sinPiZTableGenerator_q : std_logic_vector(28 downto 0);
    signal memoryC1_uid208_sinPiZTableGenerator_q : std_logic_vector(20 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage0Idx2_uid180_alignedZ_uid57_fpCosPiTest_q : std_logic_vector (34 downto 0);
    signal prodXYTruncFR_uid224_mul2xSinRes_uid66_fpCosPiTest_in : std_logic_vector (48 downto 0);
    signal prodXYTruncFR_uid224_mul2xSinRes_uid66_fpCosPiTest_b : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid227_pT1_uid211_sinPiZPolyEval_in : std_logic_vector (27 downto 0);
    signal prodXYTruncFR_uid227_pT1_uid211_sinPiZPolyEval_b : std_logic_vector (14 downto 0);
    signal prodXYTruncFR_uid230_pT2_uid217_sinPiZPolyEval_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid230_pT2_uid217_sinPiZPolyEval_b : std_logic_vector (23 downto 0);
    signal join_uid94_fpCosPiTest_q : std_logic_vector (1 downto 0);
    signal R_uid102_fpCosPiTest_q : std_logic_vector (31 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmp_a : std_logic_vector(4 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmp_b : std_logic_vector(4 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmp_a : std_logic_vector(2 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmp_b : std_logic_vector(2 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_nor_q : std_logic_vector(0 downto 0);
    signal oFracX_uid37_uid37_fpCosPiTest_q : std_logic_vector (23 downto 0);
    signal InvExpXIsZero_uid33_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid33_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid29_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid29_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid32_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid32_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal fxpShifterBits_uid40_fpCosPiTest_in : std_logic_vector (5 downto 0);
    signal fxpShifterBits_uid40_fpCosPiTest_b : std_logic_vector (5 downto 0);
    signal oMFxpXFrac_uid49_fpCosPiTest_in : std_logic_vector (35 downto 0);
    signal oMFxpXFrac_uid49_fpCosPiTest_b : std_logic_vector (35 downto 0);
    signal z_uid54_fpCosPiTest_in : std_logic_vector (34 downto 0);
    signal z_uid54_fpCosPiTest_b : std_logic_vector (34 downto 0);
    signal expP_uid60_fpCosPiTest_in : std_logic_vector (7 downto 0);
    signal expP_uid60_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal LeftShiftStage135dto0_uid126_fxpX_uid41_fpCosPiTest_in : std_logic_vector (35 downto 0);
    signal LeftShiftStage135dto0_uid126_fxpX_uid41_fpCosPiTest_b : std_logic_vector (35 downto 0);
    signal LeftShiftStage134dto0_uid129_fxpX_uid41_fpCosPiTest_in : std_logic_vector (34 downto 0);
    signal LeftShiftStage134dto0_uid129_fxpX_uid41_fpCosPiTest_b : std_logic_vector (34 downto 0);
    signal LeftShiftStage133dto0_uid132_fxpX_uid41_fpCosPiTest_in : std_logic_vector (33 downto 0);
    signal LeftShiftStage133dto0_uid132_fxpX_uid41_fpCosPiTest_b : std_logic_vector (33 downto 0);
    signal rVStage_uid146_lzcZ_uid56_fpCosPiTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid146_lzcZ_uid56_fpCosPiTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid148_lzcZ_uid56_fpCosPiTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid148_lzcZ_uid56_fpCosPiTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid152_lzcZ_uid56_fpCosPiTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid152_lzcZ_uid56_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid154_lzcZ_uid56_fpCosPiTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid154_lzcZ_uid56_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid164_lzcZ_uid56_fpCosPiTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid164_lzcZ_uid56_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid166_lzcZ_uid56_fpCosPiTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid166_lzcZ_uid56_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal LeftShiftStage133dto0_uid196_alignedZ_uid57_fpCosPiTest_in : std_logic_vector (33 downto 0);
    signal LeftShiftStage133dto0_uid196_alignedZ_uid57_fpCosPiTest_b : std_logic_vector (33 downto 0);
    signal LeftShiftStage132dto0_uid199_alignedZ_uid57_fpCosPiTest_in : std_logic_vector (32 downto 0);
    signal LeftShiftStage132dto0_uid199_alignedZ_uid57_fpCosPiTest_b : std_logic_vector (32 downto 0);
    signal LeftShiftStage131dto0_uid202_alignedZ_uid57_fpCosPiTest_in : std_logic_vector (31 downto 0);
    signal LeftShiftStage131dto0_uid202_alignedZ_uid57_fpCosPiTest_b : std_logic_vector (31 downto 0);
    signal normBit_uid67_fpCosPiTest_in : std_logic_vector (25 downto 0);
    signal normBit_uid67_fpCosPiTest_b : std_logic_vector (0 downto 0);
    signal highRes_uid68_fpCosPiTest_in : std_logic_vector (24 downto 0);
    signal highRes_uid68_fpCosPiTest_b : std_logic_vector (23 downto 0);
    signal lowRes_uid69_fpCosPiTest_in : std_logic_vector (23 downto 0);
    signal lowRes_uid69_fpCosPiTest_b : std_logic_vector (23 downto 0);
    signal lowRangeB_uid212_sinPiZPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid212_sinPiZPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid213_sinPiZPolyEval_in : std_logic_vector (14 downto 0);
    signal highBBits_uid213_sinPiZPolyEval_b : std_logic_vector (13 downto 0);
    signal lowRangeB_uid218_sinPiZPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid218_sinPiZPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid219_sinPiZPolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid219_sinPiZPolyEval_b : std_logic_vector (21 downto 0);
    signal oFracXExt_uid39_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal exc_N_uid30_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid30_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid30_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStageSel5Dto4_uid112_fxpX_uid41_fpCosPiTest_in : std_logic_vector (5 downto 0);
    signal leftShiftStageSel5Dto4_uid112_fxpX_uid41_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel3Dto2_uid123_fxpX_uid41_fpCosPiTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid123_fxpX_uid41_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid134_fxpX_uid41_fpCosPiTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid134_fxpX_uid41_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal zAddr_uid62_fpCosPiTest_in : std_logic_vector (34 downto 0);
    signal zAddr_uid62_fpCosPiTest_b : std_logic_vector (6 downto 0);
    signal zPPolyEval_uid63_fpCosPiTest_in : std_logic_vector (27 downto 0);
    signal zPPolyEval_uid63_fpCosPiTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid138_lzcZ_uid56_fpCosPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid138_lzcZ_uid56_fpCosPiTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid141_lzcZ_uid56_fpCosPiTest_in : std_logic_vector (2 downto 0);
    signal vStage_uid141_lzcZ_uid56_fpCosPiTest_b : std_logic_vector (2 downto 0);
    signal X18dto0_uid176_alignedZ_uid57_fpCosPiTest_in : std_logic_vector (18 downto 0);
    signal X18dto0_uid176_alignedZ_uid57_fpCosPiTest_b : std_logic_vector (18 downto 0);
    signal leftShiftStage2Idx1_uid127_fxpX_uid41_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage2Idx2_uid130_fxpX_uid41_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage2Idx3_uid133_fxpX_uid41_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal vCount_uid153_lzcZ_uid56_fpCosPiTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid153_lzcZ_uid56_fpCosPiTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid153_lzcZ_uid56_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid156_lzcZ_uid56_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid156_lzcZ_uid56_fpCosPiTest_q : std_logic_vector (7 downto 0);
    signal vCount_uid165_lzcZ_uid56_fpCosPiTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid165_lzcZ_uid56_fpCosPiTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid165_lzcZ_uid56_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid168_lzcZ_uid56_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid168_lzcZ_uid56_fpCosPiTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage2Idx1_uid197_alignedZ_uid57_fpCosPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage2Idx2_uid200_alignedZ_uid57_fpCosPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage2Idx3_uid203_alignedZ_uid57_fpCosPiTest_q : std_logic_vector (34 downto 0);
    signal fracRCompPreRnd_uid70_fpCosPiTest_s : std_logic_vector (0 downto 0);
    signal fracRCompPreRnd_uid70_fpCosPiTest_q : std_logic_vector (23 downto 0);
    signal rndExpUpdate_uid72_uid73_fpCosPiTest_q : std_logic_vector (24 downto 0);
    signal sumAHighB_uid214_sinPiZPolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid214_sinPiZPolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid214_sinPiZPolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid214_sinPiZPolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid220_sinPiZPolyEval_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid220_sinPiZPolyEval_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid220_sinPiZPolyEval_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid220_sinPiZPolyEval_q : std_logic_vector (29 downto 0);
    signal X20dto0_uid106_fxpX_uid41_fpCosPiTest_in : std_logic_vector (20 downto 0);
    signal X20dto0_uid106_fxpX_uid41_fpCosPiTest_b : std_logic_vector (20 downto 0);
    signal X4dto0_uid109_fxpX_uid41_fpCosPiTest_in : std_logic_vector (4 downto 0);
    signal X4dto0_uid109_fxpX_uid41_fpCosPiTest_b : std_logic_vector (4 downto 0);
    signal InvExc_N_uid31_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid31_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid84_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid84_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid84_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal yT1_uid210_sinPiZPolyEval_in : std_logic_vector (15 downto 0);
    signal yT1_uid210_sinPiZPolyEval_b : std_logic_vector (13 downto 0);
    signal cStage_uid142_lzcZ_uid56_fpCosPiTest_q : std_logic_vector (31 downto 0);
    signal leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal rVStage_uid158_lzcZ_uid56_fpCosPiTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid158_lzcZ_uid56_fpCosPiTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid160_lzcZ_uid56_fpCosPiTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid160_lzcZ_uid56_fpCosPiTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid170_lzcZ_uid56_fpCosPiTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid170_lzcZ_uid56_fpCosPiTest_b : std_logic_vector (0 downto 0);
    signal leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_q : std_logic_vector (34 downto 0);
    signal expFracPreRnd_uid71_uid71_fpCosPiTest_q : std_logic_vector (31 downto 0);
    signal expFracComp_uid74_fpCosPiTest_a : std_logic_vector(32 downto 0);
    signal expFracComp_uid74_fpCosPiTest_b : std_logic_vector(32 downto 0);
    signal expFracComp_uid74_fpCosPiTest_o : std_logic_vector (32 downto 0);
    signal expFracComp_uid74_fpCosPiTest_q : std_logic_vector (32 downto 0);
    signal s1_uid212_uid215_sinPiZPolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid218_uid221_sinPiZPolyEval_q : std_logic_vector (31 downto 0);
    signal leftShiftStage0Idx1_uid107_fxpX_uid41_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0Idx2_uid110_fxpX_uid41_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal exc_R_uid34_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid34_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid34_fpCosPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid34_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal rInfOrNaN_uid92_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal rInfOrNaN_uid92_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal rInfOrNaN_uid92_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal FxpX36_uid42_fpCosPiTest_in : std_logic_vector (36 downto 0);
    signal FxpX36_uid42_fpCosPiTest_b : std_logic_vector (0 downto 0);
    signal fxpXFrac_uid43_fpCosPiTest_in : std_logic_vector (35 downto 0);
    signal fxpXFrac_uid43_fpCosPiTest_b : std_logic_vector (35 downto 0);
    signal vCount_uid171_lzcZ_uid56_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid171_lzcZ_uid56_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid171_lzcZ_uid56_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal alignedZLow_uid58_fpCosPiTest_in : std_logic_vector (34 downto 0);
    signal alignedZLow_uid58_fpCosPiTest_b : std_logic_vector (23 downto 0);
    signal fracRComp_uid75_fpCosPiTest_in : std_logic_vector (23 downto 0);
    signal fracRComp_uid75_fpCosPiTest_b : std_logic_vector (22 downto 0);
    signal expRComp_uid76_fpCosPiTest_in : std_logic_vector (31 downto 0);
    signal expRComp_uid76_fpCosPiTest_b : std_logic_vector (7 downto 0);
    signal fxpSinRes_uid65_fpCosPiTest_in : std_logic_vector (29 downto 0);
    signal fxpSinRes_uid65_fpCosPiTest_b : std_logic_vector (24 downto 0);
    signal leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal FxpXFrac35_uid44_fpCosPiTest_in : std_logic_vector (35 downto 0);
    signal FxpXFrac35_uid44_fpCosPiTest_b : std_logic_vector (0 downto 0);
    signal r_uid172_lzcZ_uid56_fpCosPiTest_q : std_logic_vector (5 downto 0);
    signal LeftShiftStage032dto0_uid115_fxpX_uid41_fpCosPiTest_in : std_logic_vector (32 downto 0);
    signal LeftShiftStage032dto0_uid115_fxpX_uid41_fpCosPiTest_b : std_logic_vector (32 downto 0);
    signal LeftShiftStage028dto0_uid118_fxpX_uid41_fpCosPiTest_in : std_logic_vector (28 downto 0);
    signal LeftShiftStage028dto0_uid118_fxpX_uid41_fpCosPiTest_b : std_logic_vector (28 downto 0);
    signal LeftShiftStage024dto0_uid121_fxpX_uid41_fpCosPiTest_in : std_logic_vector (24 downto 0);
    signal LeftShiftStage024dto0_uid121_fxpX_uid41_fpCosPiTest_b : std_logic_vector (24 downto 0);
    signal xParityXorHalfParity_uid96_fpCosPiTest_a : std_logic_vector(0 downto 0);
    signal xParityXorHalfParity_uid96_fpCosPiTest_b : std_logic_vector(0 downto 0);
    signal xParityXorHalfParity_uid96_fpCosPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStageSel5Dto4_uid182_alignedZ_uid57_fpCosPiTest_in : std_logic_vector (5 downto 0);
    signal leftShiftStageSel5Dto4_uid182_alignedZ_uid57_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel3Dto2_uid193_alignedZ_uid57_fpCosPiTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid193_alignedZ_uid57_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid204_alignedZ_uid57_fpCosPiTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid204_alignedZ_uid57_fpCosPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStage1Idx1_uid116_fxpX_uid41_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage1Idx2_uid119_fxpX_uid41_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage1Idx3_uid122_fxpX_uid41_fpCosPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_q : std_logic_vector (34 downto 0);
    signal LeftShiftStage030dto0_uid185_alignedZ_uid57_fpCosPiTest_in : std_logic_vector (30 downto 0);
    signal LeftShiftStage030dto0_uid185_alignedZ_uid57_fpCosPiTest_b : std_logic_vector (30 downto 0);
    signal LeftShiftStage026dto0_uid188_alignedZ_uid57_fpCosPiTest_in : std_logic_vector (26 downto 0);
    signal LeftShiftStage026dto0_uid188_alignedZ_uid57_fpCosPiTest_b : std_logic_vector (26 downto 0);
    signal LeftShiftStage022dto0_uid191_alignedZ_uid57_fpCosPiTest_in : std_logic_vector (22 downto 0);
    signal LeftShiftStage022dto0_uid191_alignedZ_uid57_fpCosPiTest_b : std_logic_vector (22 downto 0);
    signal leftShiftStage1Idx1_uid186_alignedZ_uid57_fpCosPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage1Idx2_uid189_alignedZ_uid57_fpCosPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage1Idx3_uid192_alignedZ_uid57_fpCosPiTest_q : std_logic_vector (34 downto 0);
begin


	--xIn(GPIN,3)@0

	--LeftShiftStage133dto0_uid132_fxpX_uid41_fpCosPiTest(BITSELECT,131)@1
    LeftShiftStage133dto0_uid132_fxpX_uid41_fpCosPiTest_in <= leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_q(33 downto 0);
    LeftShiftStage133dto0_uid132_fxpX_uid41_fpCosPiTest_b <= LeftShiftStage133dto0_uid132_fxpX_uid41_fpCosPiTest_in(33 downto 0);

	--leftShiftStage2Idx3Pad3_uid131_fxpX_uid41_fpCosPiTest(CONSTANT,130)
    leftShiftStage2Idx3Pad3_uid131_fxpX_uid41_fpCosPiTest_q <= "000";

	--leftShiftStage2Idx3_uid133_fxpX_uid41_fpCosPiTest(BITJOIN,132)@1
    leftShiftStage2Idx3_uid133_fxpX_uid41_fpCosPiTest_q <= LeftShiftStage133dto0_uid132_fxpX_uid41_fpCosPiTest_b & leftShiftStage2Idx3Pad3_uid131_fxpX_uid41_fpCosPiTest_q;

	--LeftShiftStage134dto0_uid129_fxpX_uid41_fpCosPiTest(BITSELECT,128)@1
    LeftShiftStage134dto0_uid129_fxpX_uid41_fpCosPiTest_in <= leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_q(34 downto 0);
    LeftShiftStage134dto0_uid129_fxpX_uid41_fpCosPiTest_b <= LeftShiftStage134dto0_uid129_fxpX_uid41_fpCosPiTest_in(34 downto 0);

	--leftShiftStage2Idx2Pad2_uid128_fxpX_uid41_fpCosPiTest(CONSTANT,127)
    leftShiftStage2Idx2Pad2_uid128_fxpX_uid41_fpCosPiTest_q <= "00";

	--leftShiftStage2Idx2_uid130_fxpX_uid41_fpCosPiTest(BITJOIN,129)@1
    leftShiftStage2Idx2_uid130_fxpX_uid41_fpCosPiTest_q <= LeftShiftStage134dto0_uid129_fxpX_uid41_fpCosPiTest_b & leftShiftStage2Idx2Pad2_uid128_fxpX_uid41_fpCosPiTest_q;

	--LeftShiftStage135dto0_uid126_fxpX_uid41_fpCosPiTest(BITSELECT,125)@1
    LeftShiftStage135dto0_uid126_fxpX_uid41_fpCosPiTest_in <= leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_q(35 downto 0);
    LeftShiftStage135dto0_uid126_fxpX_uid41_fpCosPiTest_b <= LeftShiftStage135dto0_uid126_fxpX_uid41_fpCosPiTest_in(35 downto 0);

	--GND(CONSTANT,0)
    GND_q <= "0";

	--leftShiftStage2Idx1_uid127_fxpX_uid41_fpCosPiTest(BITJOIN,126)@1
    leftShiftStage2Idx1_uid127_fxpX_uid41_fpCosPiTest_q <= LeftShiftStage135dto0_uid126_fxpX_uid41_fpCosPiTest_b & GND_q;

	--leftShiftStage0Idx3_uid111_fxpX_uid41_fpCosPiTest(CONSTANT,110)
    leftShiftStage0Idx3_uid111_fxpX_uid41_fpCosPiTest_q <= "0000000000000000000000000000000000000";

	--X4dto0_uid109_fxpX_uid41_fpCosPiTest(BITSELECT,108)@0
    X4dto0_uid109_fxpX_uid41_fpCosPiTest_in <= oFracXExt_uid39_fpCosPiTest_q(4 downto 0);
    X4dto0_uid109_fxpX_uid41_fpCosPiTest_b <= X4dto0_uid109_fxpX_uid41_fpCosPiTest_in(4 downto 0);

	--leftShiftStage0Idx2Pad32_uid108_fxpX_uid41_fpCosPiTest(CONSTANT,107)
    leftShiftStage0Idx2Pad32_uid108_fxpX_uid41_fpCosPiTest_q <= "00000000000000000000000000000000";

	--leftShiftStage0Idx2_uid110_fxpX_uid41_fpCosPiTest(BITJOIN,109)@0
    leftShiftStage0Idx2_uid110_fxpX_uid41_fpCosPiTest_q <= X4dto0_uid109_fxpX_uid41_fpCosPiTest_b & leftShiftStage0Idx2Pad32_uid108_fxpX_uid41_fpCosPiTest_q;

	--X20dto0_uid106_fxpX_uid41_fpCosPiTest(BITSELECT,105)@0
    X20dto0_uid106_fxpX_uid41_fpCosPiTest_in <= oFracXExt_uid39_fpCosPiTest_q(20 downto 0);
    X20dto0_uid106_fxpX_uid41_fpCosPiTest_b <= X20dto0_uid106_fxpX_uid41_fpCosPiTest_in(20 downto 0);

	--leftShiftStage0Idx1Pad16_uid105_fxpX_uid41_fpCosPiTest(CONSTANT,104)
    leftShiftStage0Idx1Pad16_uid105_fxpX_uid41_fpCosPiTest_q <= "0000000000000000";

	--leftShiftStage0Idx1_uid107_fxpX_uid41_fpCosPiTest(BITJOIN,106)@0
    leftShiftStage0Idx1_uid107_fxpX_uid41_fpCosPiTest_q <= X20dto0_uid106_fxpX_uid41_fpCosPiTest_b & leftShiftStage0Idx1Pad16_uid105_fxpX_uid41_fpCosPiTest_q;

	--cst01pWShift_uid14_fpCosPiTest(CONSTANT,13)
    cst01pWShift_uid14_fpCosPiTest_q <= "0000000000000";

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--fracX_uid7_fpCosPiTest(BITSELECT,6)@0
    fracX_uid7_fpCosPiTest_in <= a(22 downto 0);
    fracX_uid7_fpCosPiTest_b <= fracX_uid7_fpCosPiTest_in(22 downto 0);

	--oFracX_uid37_uid37_fpCosPiTest(BITJOIN,36)@0
    oFracX_uid37_uid37_fpCosPiTest_q <= VCC_q & fracX_uid7_fpCosPiTest_b;

	--oFracXExt_uid39_fpCosPiTest(BITJOIN,38)@0
    oFracXExt_uid39_fpCosPiTest_q <= cst01pWShift_uid14_fpCosPiTest_q & oFracX_uid37_uid37_fpCosPiTest_q;

	--biasMwShiftMO_uid13_fpCosPiTest(CONSTANT,12)
    biasMwShiftMO_uid13_fpCosPiTest_q <= "01110010";

	--expX_uid6_fpCosPiTest(BITSELECT,5)@0
    expX_uid6_fpCosPiTest_in <= a(30 downto 0);
    expX_uid6_fpCosPiTest_b <= expX_uid6_fpCosPiTest_in(30 downto 23);

	--shiftValFxPX_uid38_fpCosPiTest(SUB,37)@0
    shiftValFxPX_uid38_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpCosPiTest_b);
    shiftValFxPX_uid38_fpCosPiTest_b <= STD_LOGIC_VECTOR("0" & biasMwShiftMO_uid13_fpCosPiTest_q);
            shiftValFxPX_uid38_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValFxPX_uid38_fpCosPiTest_a) - UNSIGNED(shiftValFxPX_uid38_fpCosPiTest_b));
    shiftValFxPX_uid38_fpCosPiTest_q <= shiftValFxPX_uid38_fpCosPiTest_o(8 downto 0);


	--fxpShifterBits_uid40_fpCosPiTest(BITSELECT,39)@0
    fxpShifterBits_uid40_fpCosPiTest_in <= shiftValFxPX_uid38_fpCosPiTest_q(5 downto 0);
    fxpShifterBits_uid40_fpCosPiTest_b <= fxpShifterBits_uid40_fpCosPiTest_in(5 downto 0);

	--leftShiftStageSel5Dto4_uid112_fxpX_uid41_fpCosPiTest(BITSELECT,111)@0
    leftShiftStageSel5Dto4_uid112_fxpX_uid41_fpCosPiTest_in <= fxpShifterBits_uid40_fpCosPiTest_b;
    leftShiftStageSel5Dto4_uid112_fxpX_uid41_fpCosPiTest_b <= leftShiftStageSel5Dto4_uid112_fxpX_uid41_fpCosPiTest_in(5 downto 4);

	--leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest(MUX,112)@0
    leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_s <= leftShiftStageSel5Dto4_uid112_fxpX_uid41_fpCosPiTest_b;
    leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest: PROCESS (leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_s, en, oFracXExt_uid39_fpCosPiTest_q, leftShiftStage0Idx1_uid107_fxpX_uid41_fpCosPiTest_q, leftShiftStage0Idx2_uid110_fxpX_uid41_fpCosPiTest_q, leftShiftStage0Idx3_uid111_fxpX_uid41_fpCosPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_q <= oFracXExt_uid39_fpCosPiTest_q;
                  WHEN "01" => leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_q <= leftShiftStage0Idx1_uid107_fxpX_uid41_fpCosPiTest_q;
                  WHEN "10" => leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_q <= leftShiftStage0Idx2_uid110_fxpX_uid41_fpCosPiTest_q;
                  WHEN "11" => leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_q <= leftShiftStage0Idx3_uid111_fxpX_uid41_fpCosPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage024dto0_uid121_fxpX_uid41_fpCosPiTest(BITSELECT,120)@0
    LeftShiftStage024dto0_uid121_fxpX_uid41_fpCosPiTest_in <= leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_q(24 downto 0);
    LeftShiftStage024dto0_uid121_fxpX_uid41_fpCosPiTest_b <= LeftShiftStage024dto0_uid121_fxpX_uid41_fpCosPiTest_in(24 downto 0);

	--leftShiftStage1Idx3Pad12_uid120_fxpX_uid41_fpCosPiTest(CONSTANT,119)
    leftShiftStage1Idx3Pad12_uid120_fxpX_uid41_fpCosPiTest_q <= "000000000000";

	--leftShiftStage1Idx3_uid122_fxpX_uid41_fpCosPiTest(BITJOIN,121)@0
    leftShiftStage1Idx3_uid122_fxpX_uid41_fpCosPiTest_q <= LeftShiftStage024dto0_uid121_fxpX_uid41_fpCosPiTest_b & leftShiftStage1Idx3Pad12_uid120_fxpX_uid41_fpCosPiTest_q;

	--reg_leftShiftStage1Idx3_uid122_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_5(REG,235)@0
    reg_leftShiftStage1Idx3_uid122_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid122_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_5_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid122_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_5_q <= leftShiftStage1Idx3_uid122_fxpX_uid41_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage028dto0_uid118_fxpX_uid41_fpCosPiTest(BITSELECT,117)@0
    LeftShiftStage028dto0_uid118_fxpX_uid41_fpCosPiTest_in <= leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_q(28 downto 0);
    LeftShiftStage028dto0_uid118_fxpX_uid41_fpCosPiTest_b <= LeftShiftStage028dto0_uid118_fxpX_uid41_fpCosPiTest_in(28 downto 0);

	--cstAllZWE_uid21_fpCosPiTest(CONSTANT,20)
    cstAllZWE_uid21_fpCosPiTest_q <= "00000000";

	--leftShiftStage1Idx2_uid119_fxpX_uid41_fpCosPiTest(BITJOIN,118)@0
    leftShiftStage1Idx2_uid119_fxpX_uid41_fpCosPiTest_q <= LeftShiftStage028dto0_uid118_fxpX_uid41_fpCosPiTest_b & cstAllZWE_uid21_fpCosPiTest_q;

	--reg_leftShiftStage1Idx2_uid119_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_4(REG,234)@0
    reg_leftShiftStage1Idx2_uid119_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid119_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_4_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid119_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_4_q <= leftShiftStage1Idx2_uid119_fxpX_uid41_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage032dto0_uid115_fxpX_uid41_fpCosPiTest(BITSELECT,114)@0
    LeftShiftStage032dto0_uid115_fxpX_uid41_fpCosPiTest_in <= leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_q(32 downto 0);
    LeftShiftStage032dto0_uid115_fxpX_uid41_fpCosPiTest_b <= LeftShiftStage032dto0_uid115_fxpX_uid41_fpCosPiTest_in(32 downto 0);

	--leftShiftStage1Idx1Pad4_uid114_fxpX_uid41_fpCosPiTest(CONSTANT,113)
    leftShiftStage1Idx1Pad4_uid114_fxpX_uid41_fpCosPiTest_q <= "0000";

	--leftShiftStage1Idx1_uid116_fxpX_uid41_fpCosPiTest(BITJOIN,115)@0
    leftShiftStage1Idx1_uid116_fxpX_uid41_fpCosPiTest_q <= LeftShiftStage032dto0_uid115_fxpX_uid41_fpCosPiTest_b & leftShiftStage1Idx1Pad4_uid114_fxpX_uid41_fpCosPiTest_q;

	--reg_leftShiftStage1Idx1_uid116_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_3(REG,233)@0
    reg_leftShiftStage1Idx1_uid116_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid116_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_3_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid116_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_3_q <= leftShiftStage1Idx1_uid116_fxpX_uid41_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_2(REG,232)@0
    reg_leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_2_q <= leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel3Dto2_uid123_fxpX_uid41_fpCosPiTest(BITSELECT,122)@0
    leftShiftStageSel3Dto2_uid123_fxpX_uid41_fpCosPiTest_in <= fxpShifterBits_uid40_fpCosPiTest_b(3 downto 0);
    leftShiftStageSel3Dto2_uid123_fxpX_uid41_fpCosPiTest_b <= leftShiftStageSel3Dto2_uid123_fxpX_uid41_fpCosPiTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid123_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_1(REG,231)@0
    reg_leftShiftStageSel3Dto2_uid123_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid123_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid123_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_1_q <= leftShiftStageSel3Dto2_uid123_fxpX_uid41_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest(MUX,123)@1
    leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_s <= reg_leftShiftStageSel3Dto2_uid123_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_1_q;
    leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest: PROCESS (leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_s, en, reg_leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_2_q, reg_leftShiftStage1Idx1_uid116_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_3_q, reg_leftShiftStage1Idx2_uid119_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_4_q, reg_leftShiftStage1Idx3_uid122_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_q <= reg_leftShiftStage0_uid113_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_q <= reg_leftShiftStage1Idx1_uid116_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_3_q;
                  WHEN "10" => leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_q <= reg_leftShiftStage1Idx2_uid119_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_4_q;
                  WHEN "11" => leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_q <= reg_leftShiftStage1Idx3_uid122_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid134_fxpX_uid41_fpCosPiTest(BITSELECT,133)@0
    leftShiftStageSel1Dto0_uid134_fxpX_uid41_fpCosPiTest_in <= fxpShifterBits_uid40_fpCosPiTest_b(1 downto 0);
    leftShiftStageSel1Dto0_uid134_fxpX_uid41_fpCosPiTest_b <= leftShiftStageSel1Dto0_uid134_fxpX_uid41_fpCosPiTest_in(1 downto 0);

	--reg_leftShiftStageSel1Dto0_uid134_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_1(REG,236)@0
    reg_leftShiftStageSel1Dto0_uid134_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid134_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid134_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_1_q <= leftShiftStageSel1Dto0_uid134_fxpX_uid41_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest(MUX,134)@1
    leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_s <= reg_leftShiftStageSel1Dto0_uid134_fxpX_uid41_fpCosPiTest_0_to_leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_1_q;
    leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest: PROCESS (leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_s, en, leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_q, leftShiftStage2Idx1_uid127_fxpX_uid41_fpCosPiTest_q, leftShiftStage2Idx2_uid130_fxpX_uid41_fpCosPiTest_q, leftShiftStage2Idx3_uid133_fxpX_uid41_fpCosPiTest_q)
    BEGIN
            CASE leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_s IS
                  WHEN "00" => leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_q <= leftShiftStage1_uid124_fxpX_uid41_fpCosPiTest_q;
                  WHEN "01" => leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_q <= leftShiftStage2Idx1_uid127_fxpX_uid41_fpCosPiTest_q;
                  WHEN "10" => leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_q <= leftShiftStage2Idx2_uid130_fxpX_uid41_fpCosPiTest_q;
                  WHEN "11" => leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_q <= leftShiftStage2Idx3_uid133_fxpX_uid41_fpCosPiTest_q;
                  WHEN OTHERS => leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fxpXFrac_uid43_fpCosPiTest(BITSELECT,42)@1
    fxpXFrac_uid43_fpCosPiTest_in <= leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_q(35 downto 0);
    fxpXFrac_uid43_fpCosPiTest_b <= fxpXFrac_uid43_fpCosPiTest_in(35 downto 0);

	--FxpXFrac35_uid44_fpCosPiTest(BITSELECT,43)@1
    FxpXFrac35_uid44_fpCosPiTest_in <= fxpXFrac_uid43_fpCosPiTest_b;
    FxpXFrac35_uid44_fpCosPiTest_b <= FxpXFrac35_uid44_fpCosPiTest_in(35 downto 35);

	--FxpX36_uid42_fpCosPiTest(BITSELECT,41)@1
    FxpX36_uid42_fpCosPiTest_in <= leftShiftStage2_uid135_fxpX_uid41_fpCosPiTest_q;
    FxpX36_uid42_fpCosPiTest_b <= FxpX36_uid42_fpCosPiTest_in(36 downto 36);

	--xParityXorHalfParity_uid96_fpCosPiTest(LOGICAL,95)@1
    xParityXorHalfParity_uid96_fpCosPiTest_a <= FxpX36_uid42_fpCosPiTest_b;
    xParityXorHalfParity_uid96_fpCosPiTest_b <= FxpXFrac35_uid44_fpCosPiTest_b;
    xParityXorHalfParity_uid96_fpCosPiTest_q <= xParityXorHalfParity_uid96_fpCosPiTest_a xor xParityXorHalfParity_uid96_fpCosPiTest_b;

	--ld_xParityXorHalfParity_uid96_fpCosPiTest_q_to_signRComp_uid99_fpCosPiTest_c(DELAY,369)@1
    ld_xParityXorHalfParity_uid96_fpCosPiTest_q_to_signRComp_uid99_fpCosPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xParityXorHalfParity_uid96_fpCosPiTest_q, xout => ld_xParityXorHalfParity_uid96_fpCosPiTest_q_to_signRComp_uid99_fpCosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--cstBiasPwF_uid12_fpCosPiTest(CONSTANT,11)
    cstBiasPwF_uid12_fpCosPiTest_q <= "10010110";

	--xEvenInt_uid35_fpCosPiTest(COMPARE,34)@0
    xEvenInt_uid35_fpCosPiTest_cin <= GND_q;
    xEvenInt_uid35_fpCosPiTest_a <= STD_LOGIC_VECTOR("00" & cstBiasPwF_uid12_fpCosPiTest_q) & '0';
    xEvenInt_uid35_fpCosPiTest_b <= STD_LOGIC_VECTOR("00" & expX_uid6_fpCosPiTest_b) & xEvenInt_uid35_fpCosPiTest_cin(0);
            xEvenInt_uid35_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xEvenInt_uid35_fpCosPiTest_a) - UNSIGNED(xEvenInt_uid35_fpCosPiTest_b));
    xEvenInt_uid35_fpCosPiTest_c(0) <= xEvenInt_uid35_fpCosPiTest_o(10);


	--ld_xEvenInt_uid35_fpCosPiTest_c_to_evenIntCosNotOneFZ_uid79_fpCosPiTest_a(DELAY,335)@0
    ld_xEvenInt_uid35_fpCosPiTest_c_to_evenIntCosNotOneFZ_uid79_fpCosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => xEvenInt_uid35_fpCosPiTest_c, xout => ld_xEvenInt_uid35_fpCosPiTest_c_to_evenIntCosNotOneFZ_uid79_fpCosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvXEvenInt_uid81_fpCosPiTest(LOGICAL,80)@2
    InvXEvenInt_uid81_fpCosPiTest_a <= ld_xEvenInt_uid35_fpCosPiTest_c_to_evenIntCosNotOneFZ_uid79_fpCosPiTest_a_q;
    InvXEvenInt_uid81_fpCosPiTest_q <= not InvXEvenInt_uid81_fpCosPiTest_a;

	--cosXIsOne_uid36_fpCosPiTest(COMPARE,35)@0
    cosXIsOne_uid36_fpCosPiTest_cin <= GND_q;
    cosXIsOne_uid36_fpCosPiTest_a <= STD_LOGIC_VECTOR("00" & expX_uid6_fpCosPiTest_b) & '0';
    cosXIsOne_uid36_fpCosPiTest_b <= STD_LOGIC_VECTOR("00" & biasMwShiftMO_uid13_fpCosPiTest_q) & cosXIsOne_uid36_fpCosPiTest_cin(0);
            cosXIsOne_uid36_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(cosXIsOne_uid36_fpCosPiTest_a) - UNSIGNED(cosXIsOne_uid36_fpCosPiTest_b));
    cosXIsOne_uid36_fpCosPiTest_c(0) <= cosXIsOne_uid36_fpCosPiTest_o(10);


	--ld_cosXIsOne_uid36_fpCosPiTest_c_to_InvCosXIsOne_uid77_fpCosPiTest_a(DELAY,332)@0
    ld_cosXIsOne_uid36_fpCosPiTest_c_to_InvCosXIsOne_uid77_fpCosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => cosXIsOne_uid36_fpCosPiTest_c, xout => ld_cosXIsOne_uid36_fpCosPiTest_c_to_InvCosXIsOne_uid77_fpCosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvCosXIsOne_uid77_fpCosPiTest(LOGICAL,76)@2
    InvCosXIsOne_uid77_fpCosPiTest_a <= ld_cosXIsOne_uid36_fpCosPiTest_c_to_InvCosXIsOne_uid77_fpCosPiTest_a_q;
    InvCosXIsOne_uid77_fpCosPiTest_q <= not InvCosXIsOne_uid77_fpCosPiTest_a;

	--signRComp_uid99_fpCosPiTest(LOGICAL,98)@2
    signRComp_uid99_fpCosPiTest_a <= InvCosXIsOne_uid77_fpCosPiTest_q;
    signRComp_uid99_fpCosPiTest_b <= InvXEvenInt_uid81_fpCosPiTest_q;
    signRComp_uid99_fpCosPiTest_c <= ld_xParityXorHalfParity_uid96_fpCosPiTest_q_to_signRComp_uid99_fpCosPiTest_c_q;
    signRComp_uid99_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signRComp_uid99_fpCosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            signRComp_uid99_fpCosPiTest_q <= signRComp_uid99_fpCosPiTest_a and signRComp_uid99_fpCosPiTest_b and signRComp_uid99_fpCosPiTest_c;
        END IF;
    END PROCESS;



	--cstZwSwF_uid15_fpCosPiTest(CONSTANT,14)
    cstZwSwF_uid15_fpCosPiTest_q <= "00000000000000000000000000000000000";

	--cstHalfwSwFP1_uid18_fpCosPiTest(BITJOIN,17)@2
    cstHalfwSwFP1_uid18_fpCosPiTest_q <= VCC_q & cstZwSwF_uid15_fpCosPiTest_q;

	--reg_fxpXFrac_uid43_fpCosPiTest_0_to_fxpXFracZero_uid45_fpCosPiTest_1(REG,237)@1
    reg_fxpXFrac_uid43_fpCosPiTest_0_to_fxpXFracZero_uid45_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpXFrac_uid43_fpCosPiTest_0_to_fxpXFracZero_uid45_fpCosPiTest_1_q <= "000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpXFrac_uid43_fpCosPiTest_0_to_fxpXFracZero_uid45_fpCosPiTest_1_q <= fxpXFrac_uid43_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fxpXFracHalf_uid46_fpCosPiTest(LOGICAL,45)@2
    fxpXFracHalf_uid46_fpCosPiTest_a <= reg_fxpXFrac_uid43_fpCosPiTest_0_to_fxpXFracZero_uid45_fpCosPiTest_1_q;
    fxpXFracHalf_uid46_fpCosPiTest_b <= cstHalfwSwFP1_uid18_fpCosPiTest_q;
    fxpXFracHalf_uid46_fpCosPiTest_q <= "1" when fxpXFracHalf_uid46_fpCosPiTest_a = fxpXFracHalf_uid46_fpCosPiTest_b else "0";

	--ld_fxpXFracHalf_uid46_fpCosPiTest_q_to_InvFxpXFracHalf_uid100_fpCosPiTest_a(DELAY,370)@2
    ld_fxpXFracHalf_uid46_fpCosPiTest_q_to_InvFxpXFracHalf_uid100_fpCosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => fxpXFracHalf_uid46_fpCosPiTest_q, xout => ld_fxpXFracHalf_uid46_fpCosPiTest_q_to_InvFxpXFracHalf_uid100_fpCosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvFxpXFracHalf_uid100_fpCosPiTest(LOGICAL,99)@3
    InvFxpXFracHalf_uid100_fpCosPiTest_a <= ld_fxpXFracHalf_uid46_fpCosPiTest_q_to_InvFxpXFracHalf_uid100_fpCosPiTest_a_q;
    InvFxpXFracHalf_uid100_fpCosPiTest_q <= not InvFxpXFracHalf_uid100_fpCosPiTest_a;

	--signR_uid101_fpCosPiTest(LOGICAL,100)@3
    signR_uid101_fpCosPiTest_a <= InvFxpXFracHalf_uid100_fpCosPiTest_q;
    signR_uid101_fpCosPiTest_b <= signRComp_uid99_fpCosPiTest_q;
    signR_uid101_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signR_uid101_fpCosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            signR_uid101_fpCosPiTest_q <= signR_uid101_fpCosPiTest_a and signR_uid101_fpCosPiTest_b;
        END IF;
    END PROCESS;



	--ld_signR_uid101_fpCosPiTest_q_to_R_uid102_fpCosPiTest_c(DELAY,375)@4
    ld_signR_uid101_fpCosPiTest_q_to_R_uid102_fpCosPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => signR_uid101_fpCosPiTest_q, xout => ld_signR_uid101_fpCosPiTest_q_to_R_uid102_fpCosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--cstBias_uid10_fpCosPiTest(CONSTANT,9)
    cstBias_uid10_fpCosPiTest_q <= "01111111";

	--cstAllOWE_uid8_fpCosPiTest(CONSTANT,7)
    cstAllOWE_uid8_fpCosPiTest_q <= "11111111";

	--pad_o_uid16_uid47_fpCosPiTest(BITJOIN,46)@1
    pad_o_uid16_uid47_fpCosPiTest_q <= VCC_q & STD_LOGIC_VECTOR((35 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_o_uid16_uid47_fpCosPiTest_0_to_oMFxpXFrac_uid47_fpCosPiTest_0(REG,244)@1
    reg_pad_o_uid16_uid47_fpCosPiTest_0_to_oMFxpXFrac_uid47_fpCosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_o_uid16_uid47_fpCosPiTest_0_to_oMFxpXFrac_uid47_fpCosPiTest_0_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_o_uid16_uid47_fpCosPiTest_0_to_oMFxpXFrac_uid47_fpCosPiTest_0_q <= pad_o_uid16_uid47_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--oMFxpXFrac_uid47_fpCosPiTest(SUB,47)@2
    oMFxpXFrac_uid47_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & reg_pad_o_uid16_uid47_fpCosPiTest_0_to_oMFxpXFrac_uid47_fpCosPiTest_0_q);
    oMFxpXFrac_uid47_fpCosPiTest_b <= STD_LOGIC_VECTOR("00" & reg_fxpXFrac_uid43_fpCosPiTest_0_to_fxpXFracZero_uid45_fpCosPiTest_1_q);
            oMFxpXFrac_uid47_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMFxpXFrac_uid47_fpCosPiTest_a) - UNSIGNED(oMFxpXFrac_uid47_fpCosPiTest_b));
    oMFxpXFrac_uid47_fpCosPiTest_q <= oMFxpXFrac_uid47_fpCosPiTest_o(37 downto 0);


	--oMFxpXFrac_uid49_fpCosPiTest(BITSELECT,48)@2
    oMFxpXFrac_uid49_fpCosPiTest_in <= oMFxpXFrac_uid47_fpCosPiTest_q(35 downto 0);
    oMFxpXFrac_uid49_fpCosPiTest_b <= oMFxpXFrac_uid49_fpCosPiTest_in(35 downto 0);

	--ld_fxpXFrac_uid43_fpCosPiTest_b_to_rangeReducedFxPX_uid51_fpCosPiTest_c(DELAY,308)@1
    ld_fxpXFrac_uid43_fpCosPiTest_b_to_rangeReducedFxPX_uid51_fpCosPiTest_c : dspba_delay
    GENERIC MAP ( width => 36, depth => 1 )
    PORT MAP ( xin => fxpXFrac_uid43_fpCosPiTest_b, xout => ld_fxpXFrac_uid43_fpCosPiTest_b_to_rangeReducedFxPX_uid51_fpCosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_FxpXFrac35_uid44_fpCosPiTest_b_to_rangeReducedFxPX_uid51_fpCosPiTest_b(DELAY,307)@1
    ld_FxpXFrac35_uid44_fpCosPiTest_b_to_rangeReducedFxPX_uid51_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => FxpXFrac35_uid44_fpCosPiTest_b, xout => ld_FxpXFrac35_uid44_fpCosPiTest_b_to_rangeReducedFxPX_uid51_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rangeReducedFxPX_uid51_fpCosPiTest(MUX,50)@2
    rangeReducedFxPX_uid51_fpCosPiTest_s <= ld_FxpXFrac35_uid44_fpCosPiTest_b_to_rangeReducedFxPX_uid51_fpCosPiTest_b_q;
    rangeReducedFxPX_uid51_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rangeReducedFxPX_uid51_fpCosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE rangeReducedFxPX_uid51_fpCosPiTest_s IS
                      WHEN "0" => rangeReducedFxPX_uid51_fpCosPiTest_q <= ld_fxpXFrac_uid43_fpCosPiTest_b_to_rangeReducedFxPX_uid51_fpCosPiTest_c_q;
                      WHEN "1" => rangeReducedFxPX_uid51_fpCosPiTest_q <= oMFxpXFrac_uid49_fpCosPiTest_b;
                      WHEN OTHERS => rangeReducedFxPX_uid51_fpCosPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--pad_half_uid17_uid52_fpCosPiTest(BITJOIN,51)@2
    pad_half_uid17_uid52_fpCosPiTest_q <= VCC_q & STD_LOGIC_VECTOR((34 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_half_uid17_uid52_fpCosPiTest_0_to_z_halfMRRFxPXE_uid52_fpCosPiTest_0(REG,246)@2
    reg_pad_half_uid17_uid52_fpCosPiTest_0_to_z_halfMRRFxPXE_uid52_fpCosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_half_uid17_uid52_fpCosPiTest_0_to_z_halfMRRFxPXE_uid52_fpCosPiTest_0_q <= "000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_half_uid17_uid52_fpCosPiTest_0_to_z_halfMRRFxPXE_uid52_fpCosPiTest_0_q <= pad_half_uid17_uid52_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--z_halfMRRFxPXE_uid52_fpCosPiTest(SUB,52)@3
    z_halfMRRFxPXE_uid52_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & reg_pad_half_uid17_uid52_fpCosPiTest_0_to_z_halfMRRFxPXE_uid52_fpCosPiTest_0_q);
    z_halfMRRFxPXE_uid52_fpCosPiTest_b <= STD_LOGIC_VECTOR("0" & rangeReducedFxPX_uid51_fpCosPiTest_q);
            z_halfMRRFxPXE_uid52_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(z_halfMRRFxPXE_uid52_fpCosPiTest_a) - UNSIGNED(z_halfMRRFxPXE_uid52_fpCosPiTest_b));
    z_halfMRRFxPXE_uid52_fpCosPiTest_q <= z_halfMRRFxPXE_uid52_fpCosPiTest_o(36 downto 0);


	--z_uid54_fpCosPiTest(BITSELECT,53)@3
    z_uid54_fpCosPiTest_in <= z_halfMRRFxPXE_uid52_fpCosPiTest_q(34 downto 0);
    z_uid54_fpCosPiTest_b <= z_uid54_fpCosPiTest_in(34 downto 0);

	--zAddr_uid62_fpCosPiTest(BITSELECT,61)@3
    zAddr_uid62_fpCosPiTest_in <= z_uid54_fpCosPiTest_b;
    zAddr_uid62_fpCosPiTest_b <= zAddr_uid62_fpCosPiTest_in(34 downto 28);

	--reg_zAddr_uid62_fpCosPiTest_0_to_memoryC2_uid209_sinPiZTableGenerator_0(REG,263)@3
    reg_zAddr_uid62_fpCosPiTest_0_to_memoryC2_uid209_sinPiZTableGenerator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid62_fpCosPiTest_0_to_memoryC2_uid209_sinPiZTableGenerator_0_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zAddr_uid62_fpCosPiTest_0_to_memoryC2_uid209_sinPiZTableGenerator_0_q <= zAddr_uid62_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid209_sinPiZTableGenerator(LOOKUP,208)@4
    memoryC2_uid209_sinPiZTableGenerator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC2_uid209_sinPiZTableGenerator_q <= "10101101010011";
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            CASE (reg_zAddr_uid62_fpCosPiTest_0_to_memoryC2_uid209_sinPiZTableGenerator_0_q) IS
                WHEN "0000000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101101010011";
                WHEN "0000001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101101010100";
                WHEN "0000010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101101010111";
                WHEN "0000011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101101011001";
                WHEN "0000100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101101011011";
                WHEN "0000101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101101011100";
                WHEN "0000110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101101011111";
                WHEN "0000111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101101100010";
                WHEN "0001000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101101100110";
                WHEN "0001001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101101101011";
                WHEN "0001010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101101110000";
                WHEN "0001011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101101110101";
                WHEN "0001100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101101111011";
                WHEN "0001101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101110000000";
                WHEN "0001110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101110000111";
                WHEN "0001111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101110001110";
                WHEN "0010000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101110010011";
                WHEN "0010001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101110011110";
                WHEN "0010010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101110100110";
                WHEN "0010011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101110101111";
                WHEN "0010100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101110111000";
                WHEN "0010101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101111000011";
                WHEN "0010110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101111001100";
                WHEN "0010111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101111010111";
                WHEN "0011000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101111100011";
                WHEN "0011001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101111101110";
                WHEN "0011010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10101111111011";
                WHEN "0011011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110000001001";
                WHEN "0011100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110000010101";
                WHEN "0011101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110000100000";
                WHEN "0011110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110000110001";
                WHEN "0011111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110001000000";
                WHEN "0100000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110001001101";
                WHEN "0100001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110001011110";
                WHEN "0100010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110001101100";
                WHEN "0100011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110001111111";
                WHEN "0100100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110010001111";
                WHEN "0100101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110010100001";
                WHEN "0100110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110010110011";
                WHEN "0100111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110011000101";
                WHEN "0101000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110011010110";
                WHEN "0101001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110011101011";
                WHEN "0101010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110011111111";
                WHEN "0101011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110100010010";
                WHEN "0101100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110100100101";
                WHEN "0101101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110100111011";
                WHEN "0101110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110101001110";
                WHEN "0101111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110101100111";
                WHEN "0110000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110101111100";
                WHEN "0110001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110110010010";
                WHEN "0110010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110110100110";
                WHEN "0110011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110111000000";
                WHEN "0110100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110111010101";
                WHEN "0110101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10110111110000";
                WHEN "0110110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111000000110";
                WHEN "0110111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111000100010";
                WHEN "0111000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111000111001";
                WHEN "0111001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111001010100";
                WHEN "0111010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111001101111";
                WHEN "0111011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111010001001";
                WHEN "0111100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111010100011";
                WHEN "0111101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111010111100";
                WHEN "0111110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111011011001";
                WHEN "0111111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111011110111";
                WHEN "1000000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111100010100";
                WHEN "1000001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111100110001";
                WHEN "1000010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111101001101";
                WHEN "1000011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111101101010";
                WHEN "1000100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111110001000";
                WHEN "1000101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111110100101";
                WHEN "1000110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111111000101";
                WHEN "1000111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "10111111100011";
                WHEN "1001000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000000000011";
                WHEN "1001001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000000100011";
                WHEN "1001010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000001000100";
                WHEN "1001011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000001100010";
                WHEN "1001100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000010000100";
                WHEN "1001101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000010100010";
                WHEN "1001110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000011000110";
                WHEN "1001111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000011101000";
                WHEN "1010000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000100001010";
                WHEN "1010001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000100101101";
                WHEN "1010010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000101010001";
                WHEN "1010011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000101110010";
                WHEN "1010100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000110010100";
                WHEN "1010101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000110111011";
                WHEN "1010110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11000111011010";
                WHEN "1010111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11001000000001";
                WHEN "1011000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11001000100110";
                WHEN "1011001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11001001001011";
                WHEN "1011010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11001001101101";
                WHEN "1011011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11001010010101";
                WHEN "1011100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11001010111100";
                WHEN "1011101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11001011100000";
                WHEN "1011110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11001100000101";
                WHEN "1011111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11001100101110";
                WHEN "1100000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11001101010100";
                WHEN "1100001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11001101111010";
                WHEN "1100010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11001110100010";
                WHEN "1100011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11001111001001";
                WHEN "1100100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11001111110001";
                WHEN "1100101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11010000010110";
                WHEN "1100110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11010000111111";
                WHEN "1100111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11010001101001";
                WHEN "1101000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11010010010010";
                WHEN "1101001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11010010111101";
                WHEN "1101010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11010011100001";
                WHEN "1101011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11010100001100";
                WHEN "1101100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11010100110111";
                WHEN "1101101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11010101100001";
                WHEN "1101110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11010110001011";
                WHEN "1101111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11010110110011";
                WHEN "1110000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11010111011111";
                WHEN "1110001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11011000001010";
                WHEN "1110010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11011000110100";
                WHEN "1110011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11011001011111";
                WHEN "1110100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11011010001010";
                WHEN "1110101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11011010110110";
                WHEN "1110110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11011011100011";
                WHEN "1110111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11011100001111";
                WHEN "1111000" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11011100111001";
                WHEN "1111001" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11011101100011";
                WHEN "1111010" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11011110010001";
                WHEN "1111011" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11011110111011";
                WHEN "1111100" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11011111101000";
                WHEN "1111101" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11100000010101";
                WHEN "1111110" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11100001000010";
                WHEN "1111111" =>  memoryC2_uid209_sinPiZTableGenerator_q <= "11100001110000";
                WHEN OTHERS =>
                    memoryC2_uid209_sinPiZTableGenerator_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--zPPolyEval_uid63_fpCosPiTest(BITSELECT,62)@3
    zPPolyEval_uid63_fpCosPiTest_in <= z_uid54_fpCosPiTest_b(27 downto 0);
    zPPolyEval_uid63_fpCosPiTest_b <= zPPolyEval_uid63_fpCosPiTest_in(27 downto 12);

	--yT1_uid210_sinPiZPolyEval(BITSELECT,209)@3
    yT1_uid210_sinPiZPolyEval_in <= zPPolyEval_uid63_fpCosPiTest_b;
    yT1_uid210_sinPiZPolyEval_b <= yT1_uid210_sinPiZPolyEval_in(15 downto 2);

	--reg_yT1_uid210_sinPiZPolyEval_0_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_0(REG,264)@3
    reg_yT1_uid210_sinPiZPolyEval_0_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid210_sinPiZPolyEval_0_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_0_q <= "00000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid210_sinPiZPolyEval_0_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_0_q <= yT1_uid210_sinPiZPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid210_sinPiZPolyEval_0_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_0_q_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_a(DELAY,499)@4
    ld_reg_yT1_uid210_sinPiZPolyEval_0_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_0_q_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_a : dspba_delay
    GENERIC MAP ( width => 14, depth => 1 )
    PORT MAP ( xin => reg_yT1_uid210_sinPiZPolyEval_0_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_0_q, xout => ld_reg_yT1_uid210_sinPiZPolyEval_0_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_0_q_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_a_q, ena => en(0), clk => clk, aclr => areset );

	--prodXY_uid226_pT1_uid211_sinPiZPolyEval(MULT,225)@5
    prodXY_uid226_pT1_uid211_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid226_pT1_uid211_sinPiZPolyEval_a),15)) * SIGNED(prodXY_uid226_pT1_uid211_sinPiZPolyEval_b);
    prodXY_uid226_pT1_uid211_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid226_pT1_uid211_sinPiZPolyEval_a <= (others => '0');
            prodXY_uid226_pT1_uid211_sinPiZPolyEval_b <= (others => '0');
            prodXY_uid226_pT1_uid211_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid226_pT1_uid211_sinPiZPolyEval_a <= ld_reg_yT1_uid210_sinPiZPolyEval_0_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_0_q_to_prodXY_uid226_pT1_uid211_sinPiZPolyEval_a_q;
                prodXY_uid226_pT1_uid211_sinPiZPolyEval_b <= memoryC2_uid209_sinPiZTableGenerator_q;
                prodXY_uid226_pT1_uid211_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid226_pT1_uid211_sinPiZPolyEval_pr,28));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid226_pT1_uid211_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid226_pT1_uid211_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid226_pT1_uid211_sinPiZPolyEval_q <= prodXY_uid226_pT1_uid211_sinPiZPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid227_pT1_uid211_sinPiZPolyEval(BITSELECT,226)@8
    prodXYTruncFR_uid227_pT1_uid211_sinPiZPolyEval_in <= prodXY_uid226_pT1_uid211_sinPiZPolyEval_q;
    prodXYTruncFR_uid227_pT1_uid211_sinPiZPolyEval_b <= prodXYTruncFR_uid227_pT1_uid211_sinPiZPolyEval_in(27 downto 13);

	--highBBits_uid213_sinPiZPolyEval(BITSELECT,212)@8
    highBBits_uid213_sinPiZPolyEval_in <= prodXYTruncFR_uid227_pT1_uid211_sinPiZPolyEval_b;
    highBBits_uid213_sinPiZPolyEval_b <= highBBits_uid213_sinPiZPolyEval_in(14 downto 1);

	--ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_notEnable(LOGICAL,557)
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_notEnable_a <= en;
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_notEnable_q <= not ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_notEnable_a;

	--ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_nor(LOGICAL,596)
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_nor_a <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_notEnable_q;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_nor_b <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_sticky_ena_q;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_nor_q <= not (ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_nor_a or ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_nor_b);

	--ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_mem_top(CONSTANT,592)
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_mem_top_q <= "010";

	--ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmp(LOGICAL,593)
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmp_a <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_mem_top_q;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdmux_q);
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmp_q <= "1" when ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmp_a = ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmp_b else "0";

	--ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmpReg(REG,594)
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmpReg_q <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_sticky_ena(REG,597)
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_nor_q = "1") THEN
                ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_sticky_ena_q <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_enaAnd(LOGICAL,598)
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_enaAnd_a <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_sticky_ena_q;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_enaAnd_b <= en;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_enaAnd_q <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_enaAnd_a and ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_enaAnd_b;

	--ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt(COUNTER,588)
    -- every=1, low=0, high=2, step=1, init=1
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_i = 1 THEN
                      ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_i <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_i - 2;
                    ELSE
                        ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_i <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_i,2));


	--ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdreg(REG,589)
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdreg_q <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdmux(MUX,590)
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdmux_s <= en;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdmux: PROCESS (ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdmux_s, ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdreg_q, ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdmux_q <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdmux_q <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem(DUALMEM,587)
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_reset0 <= areset;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_ia <= reg_zAddr_uid62_fpCosPiTest_0_to_memoryC2_uid209_sinPiZTableGenerator_0_q;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_aa <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdreg_q;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_ab <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdmux_q;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_iq,
        address_a => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_aa,
        data_a => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_ia
    );
        ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_q <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_iq(6 downto 0);

	--memoryC1_uid208_sinPiZTableGenerator(LOOKUP,207)@8
    memoryC1_uid208_sinPiZTableGenerator: PROCESS (ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_mem_q) IS
                WHEN "0000000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "000000000000000000001";
                WHEN "0000001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111111101011010101010";
                WHEN "0000010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111111010110101010001";
                WHEN "0000011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111111000001111111100";
                WHEN "0000100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111110101101010101010";
                WHEN "0000101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111110011000101011101";
                WHEN "0000110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111110000100000010101";
                WHEN "0000111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111101101111011010001";
                WHEN "0001000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111101011010110010101";
                WHEN "0001001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111101000110001011111";
                WHEN "0001010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111100110001100110010";
                WHEN "0001011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111100011101000010000";
                WHEN "0001100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111100001000011110111";
                WHEN "0001101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111011110011111101011";
                WHEN "0001110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111011011111011101011";
                WHEN "0001111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111011001010111110111";
                WHEN "0010000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111010110110100010101";
                WHEN "0010001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111010100010000111100";
                WHEN "0010010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111010001101101111000";
                WHEN "0010011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111001111001011000011";
                WHEN "0010100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111001100101000100010";
                WHEN "0010101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111001010000110010001";
                WHEN "0010110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111000111100100010111";
                WHEN "0010111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111000101000010110001";
                WHEN "0011000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111000010100001011111";
                WHEN "0011001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "111000000000000100110";
                WHEN "0011010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110111101100000000011";
                WHEN "0011011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110111010111111111000";
                WHEN "0011100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110111000100000001000";
                WHEN "0011101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110110110000000110101";
                WHEN "0011110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110110011100001110111";
                WHEN "0011111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110110001000011011000";
                WHEN "0100000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110101110100101011010";
                WHEN "0100001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110101100000111110101";
                WHEN "0100010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110101001101010110010";
                WHEN "0100011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110100111001110001011";
                WHEN "0100100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110100100110010001001";
                WHEN "0100101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110100010010110100110";
                WHEN "0100110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110011111111011100110";
                WHEN "0100111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110011101100001001010";
                WHEN "0101000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110011011000111010011";
                WHEN "0101001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110011000101101111111";
                WHEN "0101010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110010110010101010010";
                WHEN "0101011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110010011111101001101";
                WHEN "0101100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110010001100101110000";
                WHEN "0101101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110001111001110111001";
                WHEN "0101110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110001100111000110000";
                WHEN "0101111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110001010100011001011";
                WHEN "0110000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110001000001110010110";
                WHEN "0110001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110000101111010001100";
                WHEN "0110010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110000011100110110001";
                WHEN "0110011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "110000001010011111111";
                WHEN "0110100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101111111000010000000";
                WHEN "0110101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101111100110000101100";
                WHEN "0110110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101111010100000001100";
                WHEN "0110111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101111000010000011001";
                WHEN "0111000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101110110000001011100";
                WHEN "0111001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101110011110011001110";
                WHEN "0111010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101110001100101110101";
                WHEN "0111011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101101111011001010001";
                WHEN "0111100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101101101001101100010";
                WHEN "0111101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101101011000010101010";
                WHEN "0111110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101101000111000100101";
                WHEN "0111111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101100110101111010111";
                WHEN "1000000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101100100100111000010";
                WHEN "1000001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101100010011111100111";
                WHEN "1000010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101100000011001000111";
                WHEN "1000011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101011110010011100000";
                WHEN "1000100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101011100001110110100";
                WHEN "1000101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101011010001011000100";
                WHEN "1000110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101011000001000001110";
                WHEN "1000111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101010110000110011000";
                WHEN "1001000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101010100000101011111";
                WHEN "1001001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101010010000101100100";
                WHEN "1001010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101010000000110101001";
                WHEN "1001011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101001110001000110000";
                WHEN "1001100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101001100001011110101";
                WHEN "1001101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101001010001111111111";
                WHEN "1001110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101001000010101000110";
                WHEN "1001111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101000110011011010001";
                WHEN "1010000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101000100100010100001";
                WHEN "1010001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101000010101010110100";
                WHEN "1010010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "101000000110100001011";
                WHEN "1010011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100111110111110101011";
                WHEN "1010100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100111101001010010000";
                WHEN "1010101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100111011010110110110";
                WHEN "1010110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100111001100100101100";
                WHEN "1010111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100110111110011100011";
                WHEN "1011000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100110110000011100011";
                WHEN "1011001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100110100010100101110";
                WHEN "1011010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100110010100111000101";
                WHEN "1011011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100110000111010100001";
                WHEN "1011100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100101111001111001000";
                WHEN "1011101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100101101100100111111";
                WHEN "1011110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100101011111100000000";
                WHEN "1011111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100101010010100001001";
                WHEN "1100000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100101000101101100011";
                WHEN "1100001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100100111001000001011";
                WHEN "1100010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100100101100011111111";
                WHEN "1100011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100100100000001000010";
                WHEN "1100100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100100010011111010101";
                WHEN "1100101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100100000111110111001";
                WHEN "1100110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100011111011111101010";
                WHEN "1100111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100011110000001101010";
                WHEN "1101000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100011100100100111101";
                WHEN "1101001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100011011001001011111";
                WHEN "1101010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100011001101111011010";
                WHEN "1101011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100011000010110100001";
                WHEN "1101100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100010110111110111010";
                WHEN "1101101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100010101101000101000";
                WHEN "1101110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100010100010011101001";
                WHEN "1101111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100010011000000000001";
                WHEN "1110000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100010001101101101010";
                WHEN "1110001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100010000011100100111";
                WHEN "1110010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100001111001100111100";
                WHEN "1110011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100001101111110100101";
                WHEN "1110100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100001100110001100100";
                WHEN "1110101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100001011100101111001";
                WHEN "1110110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100001010011011100011";
                WHEN "1110111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100001001010010100101";
                WHEN "1111000" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100001000001011000000";
                WHEN "1111001" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100000111000100110100";
                WHEN "1111010" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100000101111111111100";
                WHEN "1111011" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100000100111100011111";
                WHEN "1111100" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100000011111010011000";
                WHEN "1111101" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100000010111001101010";
                WHEN "1111110" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100000001111010010101";
                WHEN "1111111" =>  memoryC1_uid208_sinPiZTableGenerator_q <= "100000000111100011001";
                WHEN OTHERS =>
                    memoryC1_uid208_sinPiZTableGenerator_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--sumAHighB_uid214_sinPiZPolyEval(ADD,213)@8
    sumAHighB_uid214_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid208_sinPiZTableGenerator_q(20)) & memoryC1_uid208_sinPiZTableGenerator_q);
    sumAHighB_uid214_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((21 downto 14 => highBBits_uid213_sinPiZPolyEval_b(13)) & highBBits_uid213_sinPiZPolyEval_b);
            sumAHighB_uid214_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid214_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid214_sinPiZPolyEval_b));
    sumAHighB_uid214_sinPiZPolyEval_q <= sumAHighB_uid214_sinPiZPolyEval_o(21 downto 0);


	--lowRangeB_uid212_sinPiZPolyEval(BITSELECT,211)@8
    lowRangeB_uid212_sinPiZPolyEval_in <= prodXYTruncFR_uid227_pT1_uid211_sinPiZPolyEval_b(0 downto 0);
    lowRangeB_uid212_sinPiZPolyEval_b <= lowRangeB_uid212_sinPiZPolyEval_in(0 downto 0);

	--s1_uid212_uid215_sinPiZPolyEval(BITJOIN,214)@8
    s1_uid212_uid215_sinPiZPolyEval_q <= sumAHighB_uid214_sinPiZPolyEval_q & lowRangeB_uid212_sinPiZPolyEval_b;

	--reg_s1_uid212_uid215_sinPiZPolyEval_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_1(REG,267)@8
    reg_s1_uid212_uid215_sinPiZPolyEval_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid212_uid215_sinPiZPolyEval_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid212_uid215_sinPiZPolyEval_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_1_q <= s1_uid212_uid215_sinPiZPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_nor(LOGICAL,609)
    ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_nor_a <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_notEnable_q;
    ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_nor_b <= ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_sticky_ena_q;
    ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_nor_q <= not (ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_nor_a or ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_nor_b);

	--ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_sticky_ena(REG,610)
    ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_nor_q = "1") THEN
                ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_sticky_ena_q <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_enaAnd(LOGICAL,611)
    ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_enaAnd_a <= ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_sticky_ena_q;
    ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_enaAnd_b <= en;
    ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_enaAnd_q <= ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_enaAnd_a and ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_enaAnd_b;

	--ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_inputreg(DELAY,599)
    ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => zPPolyEval_uid63_fpCosPiTest_b, xout => ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem(DUALMEM,600)
    ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_reset0 <= areset;
    ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_ia <= ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_inputreg_q;
    ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_aa <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdreg_q;
    ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_ab <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdmux_q;
    ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_iq,
        address_a => ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_aa,
        data_a => ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_ia
    );
        ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_q <= ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_iq(15 downto 0);

	--reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0(REG,266)@8
    reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_q <= ld_zPPolyEval_uid63_fpCosPiTest_b_to_reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid229_pT2_uid217_sinPiZPolyEval(MULT,228)@9
    prodXY_uid229_pT2_uid217_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid229_pT2_uid217_sinPiZPolyEval_a),17)) * SIGNED(prodXY_uid229_pT2_uid217_sinPiZPolyEval_b);
    prodXY_uid229_pT2_uid217_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid229_pT2_uid217_sinPiZPolyEval_a <= (others => '0');
            prodXY_uid229_pT2_uid217_sinPiZPolyEval_b <= (others => '0');
            prodXY_uid229_pT2_uid217_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid229_pT2_uid217_sinPiZPolyEval_a <= reg_zPPolyEval_uid63_fpCosPiTest_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_0_q;
                prodXY_uid229_pT2_uid217_sinPiZPolyEval_b <= reg_s1_uid212_uid215_sinPiZPolyEval_0_to_prodXY_uid229_pT2_uid217_sinPiZPolyEval_1_q;
                prodXY_uid229_pT2_uid217_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid229_pT2_uid217_sinPiZPolyEval_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid229_pT2_uid217_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid229_pT2_uid217_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid229_pT2_uid217_sinPiZPolyEval_q <= prodXY_uid229_pT2_uid217_sinPiZPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid230_pT2_uid217_sinPiZPolyEval(BITSELECT,229)@12
    prodXYTruncFR_uid230_pT2_uid217_sinPiZPolyEval_in <= prodXY_uid229_pT2_uid217_sinPiZPolyEval_q;
    prodXYTruncFR_uid230_pT2_uid217_sinPiZPolyEval_b <= prodXYTruncFR_uid230_pT2_uid217_sinPiZPolyEval_in(38 downto 15);

	--highBBits_uid219_sinPiZPolyEval(BITSELECT,218)@12
    highBBits_uid219_sinPiZPolyEval_in <= prodXYTruncFR_uid230_pT2_uid217_sinPiZPolyEval_b;
    highBBits_uid219_sinPiZPolyEval_b <= highBBits_uid219_sinPiZPolyEval_in(23 downto 2);

	--ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_nor(LOGICAL,584)
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_nor_a <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_notEnable_q;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_nor_b <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_sticky_ena_q;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_nor_q <= not (ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_nor_a or ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_nor_b);

	--ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_mem_top(CONSTANT,554)
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_mem_top_q <= "0110";

	--ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmp(LOGICAL,555)
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmp_a <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_mem_top_q;
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdmux_q);
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmp_q <= "1" when ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmp_a = ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmp_b else "0";

	--ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmpReg(REG,556)
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmpReg_q <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_sticky_ena(REG,585)
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_nor_q = "1") THEN
                ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_sticky_ena_q <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_enaAnd(LOGICAL,586)
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_enaAnd_a <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_sticky_ena_q;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_enaAnd_b <= en;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_enaAnd_q <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_enaAnd_a and ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_enaAnd_b;

	--ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt(COUNTER,550)
    -- every=1, low=0, high=6, step=1, init=1
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_i = 5 THEN
                      ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_eq = '1') THEN
                        ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_i <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_i - 6;
                    ELSE
                        ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_i <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_i,3));


	--ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdreg(REG,551)
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdreg_q <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdmux(MUX,552)
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdmux_s <= en;
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdmux: PROCESS (ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdmux_s, ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdreg_q, ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdmux_q <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdmux_q <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem(DUALMEM,575)
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_reset0 <= areset;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_ia <= reg_zAddr_uid62_fpCosPiTest_0_to_memoryC2_uid209_sinPiZTableGenerator_0_q;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_aa <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdreg_q;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_ab <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdmux_q;
    ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 7,
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
        clocken1 => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_iq,
        address_a => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_aa,
        data_a => ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_ia
    );
        ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_q <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_iq(6 downto 0);

	--memoryC0_uid207_sinPiZTableGenerator(LOOKUP,206)@12
    memoryC0_uid207_sinPiZTableGenerator: PROCESS (ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC0_uid207_sinPiZTableGenerator_0_q_to_memoryC0_uid207_sinPiZTableGenerator_a_replace_mem_q) IS
                WHEN "0000000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100100001111110110101110";
                WHEN "0000001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100100001110100100000010";
                WHEN "0000010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100100001010101100000000";
                WHEN "0000011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100100000100001110101000";
                WHEN "0000100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100011111011001011111101";
                WHEN "0000101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100011101111100100000010";
                WHEN "0000110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100011100001010110111011";
                WHEN "0000111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100011010000100100101111";
                WHEN "0001000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100010111101001101100010";
                WHEN "0001001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100010100111010001011101";
                WHEN "0001010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100010001110110000100111";
                WHEN "0001011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100001110011101011001001";
                WHEN "0001100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100001010110000001001110";
                WHEN "0001101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100000110101110011000000";
                WHEN "0001110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100100000010011000000101011";
                WHEN "0001111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100011111101101101010011101";
                WHEN "0010000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100011111000101110000100010";
                WHEN "0010001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100011110011011010011001011";
                WHEN "0010010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100011101101110010010100101";
                WHEN "0010011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100011100111110101111000011";
                WHEN "0010100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100011100001100101000110101";
                WHEN "0010101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100011011011000000000001111";
                WHEN "0010110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100011010100000110101100011";
                WHEN "0010111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100011001100111001001000110";
                WHEN "0011000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100011000101010111011001110";
                WHEN "0011001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100010111101100001100010000";
                WHEN "0011010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100010110101010111100100100";
                WHEN "0011011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100010101100111001100100010";
                WHEN "0011100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100010100100000111100100011";
                WHEN "0011101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100010011011000001101000000";
                WHEN "0011110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100010010001100111110010110";
                WHEN "0011111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100010000111111010000111111";
                WHEN "0100000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100001111101111000101010111";
                WHEN "0100001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100001110011100011011111110";
                WHEN "0100010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100001101000111010101010001";
                WHEN "0100011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100001011101111110001110000";
                WHEN "0100100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100001010010101110001111010";
                WHEN "0100101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100001000111001010110010010";
                WHEN "0100110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100000111011010011111011001";
                WHEN "0100111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100000101111001001101110010";
                WHEN "0101000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100000100010101100010000001";
                WHEN "0101001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100000010101111011100101011";
                WHEN "0101010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01100000001000110111110010101";
                WHEN "0101011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011111111011100000111100110";
                WHEN "0101100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011111101101110111001000101";
                WHEN "0101101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011111011111111010011011011";
                WHEN "0101110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011111010001101010111001111";
                WHEN "0101111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011111000011001000101001110";
                WHEN "0110000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011110110100010011110000000";
                WHEN "0110001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011110100101001100010010010";
                WHEN "0110010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011110010101110010010110000";
                WHEN "0110011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011110000110000110000001000";
                WHEN "0110100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011101110110000111011000111";
                WHEN "0110101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011101100101110110100011101";
                WHEN "0110110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011101010101010011100111001";
                WHEN "0110111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011101000100011110101001100";
                WHEN "0111000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011100110011010111110000111";
                WHEN "0111001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011100100001111111000011101";
                WHEN "0111010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011100010000010100101000000";
                WHEN "0111011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011011111110011000100100100";
                WHEN "0111100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011011101100001010111111110";
                WHEN "0111101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011011011001101100000000011";
                WHEN "0111110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011011000110111011101101010";
                WHEN "0111111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011010110011111010001101001";
                WHEN "1000000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011010100000100111100111000";
                WHEN "1000001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011010001101000100000001111";
                WHEN "1000010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011001111001001111100100111";
                WHEN "1000011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011001100101001010010111011";
                WHEN "1000100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011001010000110100100000101";
                WHEN "1000101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011000111100001110001000001";
                WHEN "1000110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011000100111010111010101011";
                WHEN "1000111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01011000010010010000001111111";
                WHEN "1001000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010111111100111000111111011";
                WHEN "1001001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010111100111010001101011110";
                WHEN "1001010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010111010001011010011100110";
                WHEN "1001011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010110111011010011011010011";
                WHEN "1001100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010110100100111100101100110";
                WHEN "1001101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010110001110010110011011111";
                WHEN "1001110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010101110111100000110000001";
                WHEN "1001111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010101100000011011110001110";
                WHEN "1010000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010101001001000111101001000";
                WHEN "1010001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010100110001100100011110100";
                WHEN "1010010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010100011001110010011010110";
                WHEN "1010011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010100000001110001100110010";
                WHEN "1010100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010011101001100010001001111";
                WHEN "1010101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010011010001000100001110100";
                WHEN "1010110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010010111000010111111100101";
                WHEN "1010111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010010011111011101011101100";
                WHEN "1011000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010010000110010100111010001";
                WHEN "1011001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010001101100111110011011011";
                WHEN "1011010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010001010011011010001010100";
                WHEN "1011011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010000111001101000010000111";
                WHEN "1011100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010000011111101000110111110";
                WHEN "1011101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01010000000101011100001000010";
                WHEN "1011110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001111101011000010001100001";
                WHEN "1011111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001111010000011011001100111";
                WHEN "1100000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001110110101100111010011111";
                WHEN "1100001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001110011010100110101010111";
                WHEN "1100010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001101111111011001011011101";
                WHEN "1100011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001101100011111111101111111";
                WHEN "1100100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001101001000011001110001011";
                WHEN "1100101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001100101100100111101010001";
                WHEN "1100110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001100010000101001100100001";
                WHEN "1100111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001011110100011111101001011";
                WHEN "1101000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001011011000001010000011111";
                WHEN "1101001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001010111011101000111101111";
                WHEN "1101010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001010011110111100100001011";
                WHEN "1101011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001010000010000100111000111";
                WHEN "1101100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001001100101000010001110101";
                WHEN "1101101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001001000111110100101100111";
                WHEN "1101110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001000101010011100011110001";
                WHEN "1101111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01001000001100111001101100110";
                WHEN "1110000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000111101111001100100011011";
                WHEN "1110001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000111010001010101001100101";
                WHEN "1110010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000110110011010011110010111";
                WHEN "1110011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000110010101001000100001000";
                WHEN "1110100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000101110110110011100001101";
                WHEN "1110101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000101011000010100111111100";
                WHEN "1110110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000100111001101101000101100";
                WHEN "1110111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000100011010111011111110011";
                WHEN "1111000" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000011111100000001110101000";
                WHEN "1111001" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000011011100111110110100010";
                WHEN "1111010" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000010111101110011000111010";
                WHEN "1111011" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000010011110011110111000111";
                WHEN "1111100" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000001111111000010010100010";
                WHEN "1111101" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000001011111011101100100011";
                WHEN "1111110" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000000111111110000110100011";
                WHEN "1111111" =>  memoryC0_uid207_sinPiZTableGenerator_q <= "01000000011111111100001111011";
                WHEN OTHERS =>
                    memoryC0_uid207_sinPiZTableGenerator_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--sumAHighB_uid220_sinPiZPolyEval(ADD,219)@12
    sumAHighB_uid220_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((29 downto 29 => memoryC0_uid207_sinPiZTableGenerator_q(28)) & memoryC0_uid207_sinPiZTableGenerator_q);
    sumAHighB_uid220_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid219_sinPiZPolyEval_b(21)) & highBBits_uid219_sinPiZPolyEval_b);
            sumAHighB_uid220_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid220_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid220_sinPiZPolyEval_b));
    sumAHighB_uid220_sinPiZPolyEval_q <= sumAHighB_uid220_sinPiZPolyEval_o(29 downto 0);


	--lowRangeB_uid218_sinPiZPolyEval(BITSELECT,217)@12
    lowRangeB_uid218_sinPiZPolyEval_in <= prodXYTruncFR_uid230_pT2_uid217_sinPiZPolyEval_b(1 downto 0);
    lowRangeB_uid218_sinPiZPolyEval_b <= lowRangeB_uid218_sinPiZPolyEval_in(1 downto 0);

	--s2_uid218_uid221_sinPiZPolyEval(BITJOIN,220)@12
    s2_uid218_uid221_sinPiZPolyEval_q <= sumAHighB_uid220_sinPiZPolyEval_q & lowRangeB_uid218_sinPiZPolyEval_b;

	--fxpSinRes_uid65_fpCosPiTest(BITSELECT,64)@12
    fxpSinRes_uid65_fpCosPiTest_in <= s2_uid218_uid221_sinPiZPolyEval_q(29 downto 0);
    fxpSinRes_uid65_fpCosPiTest_b <= fxpSinRes_uid65_fpCosPiTest_in(29 downto 5);

	--reg_fxpSinRes_uid65_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_1(REG,270)@12
    reg_fxpSinRes_uid65_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpSinRes_uid65_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_1_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpSinRes_uid65_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_1_q <= fxpSinRes_uid65_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_nor(LOGICAL,622)
    ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_nor_a <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_notEnable_q;
    ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_nor_b <= ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_sticky_ena_q;
    ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_nor_q <= not (ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_nor_a or ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_nor_b);

	--ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_sticky_ena(REG,623)
    ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_nor_q = "1") THEN
                ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_sticky_ena_q <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_enaAnd(LOGICAL,624)
    ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_enaAnd_a <= ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_sticky_ena_q;
    ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_enaAnd_b <= en;
    ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_enaAnd_q <= ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_enaAnd_a and ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_enaAnd_b;

	--LeftShiftStage131dto0_uid202_alignedZ_uid57_fpCosPiTest(BITSELECT,201)@7
    LeftShiftStage131dto0_uid202_alignedZ_uid57_fpCosPiTest_in <= leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_q(31 downto 0);
    LeftShiftStage131dto0_uid202_alignedZ_uid57_fpCosPiTest_b <= LeftShiftStage131dto0_uid202_alignedZ_uid57_fpCosPiTest_in(31 downto 0);

	--leftShiftStage2Idx3_uid203_alignedZ_uid57_fpCosPiTest(BITJOIN,202)@7
    leftShiftStage2Idx3_uid203_alignedZ_uid57_fpCosPiTest_q <= LeftShiftStage131dto0_uid202_alignedZ_uid57_fpCosPiTest_b & leftShiftStage2Idx3Pad3_uid131_fxpX_uid41_fpCosPiTest_q;

	--LeftShiftStage132dto0_uid199_alignedZ_uid57_fpCosPiTest(BITSELECT,198)@7
    LeftShiftStage132dto0_uid199_alignedZ_uid57_fpCosPiTest_in <= leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_q(32 downto 0);
    LeftShiftStage132dto0_uid199_alignedZ_uid57_fpCosPiTest_b <= LeftShiftStage132dto0_uid199_alignedZ_uid57_fpCosPiTest_in(32 downto 0);

	--leftShiftStage2Idx2_uid200_alignedZ_uid57_fpCosPiTest(BITJOIN,199)@7
    leftShiftStage2Idx2_uid200_alignedZ_uid57_fpCosPiTest_q <= LeftShiftStage132dto0_uid199_alignedZ_uid57_fpCosPiTest_b & leftShiftStage2Idx2Pad2_uid128_fxpX_uid41_fpCosPiTest_q;

	--LeftShiftStage133dto0_uid196_alignedZ_uid57_fpCosPiTest(BITSELECT,195)@7
    LeftShiftStage133dto0_uid196_alignedZ_uid57_fpCosPiTest_in <= leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_q(33 downto 0);
    LeftShiftStage133dto0_uid196_alignedZ_uid57_fpCosPiTest_b <= LeftShiftStage133dto0_uid196_alignedZ_uid57_fpCosPiTest_in(33 downto 0);

	--leftShiftStage2Idx1_uid197_alignedZ_uid57_fpCosPiTest(BITJOIN,196)@7
    leftShiftStage2Idx1_uid197_alignedZ_uid57_fpCosPiTest_q <= LeftShiftStage133dto0_uid196_alignedZ_uid57_fpCosPiTest_b & GND_q;

	--vStage_uid141_lzcZ_uid56_fpCosPiTest(BITSELECT,140)@3
    vStage_uid141_lzcZ_uid56_fpCosPiTest_in <= z_uid54_fpCosPiTest_b(2 downto 0);
    vStage_uid141_lzcZ_uid56_fpCosPiTest_b <= vStage_uid141_lzcZ_uid56_fpCosPiTest_in(2 downto 0);

	--ld_vStage_uid141_lzcZ_uid56_fpCosPiTest_b_to_leftShiftStage0Idx2_uid180_alignedZ_uid57_fpCosPiTest_b(DELAY,450)@3
    ld_vStage_uid141_lzcZ_uid56_fpCosPiTest_b_to_leftShiftStage0Idx2_uid180_alignedZ_uid57_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 3, depth => 3 )
    PORT MAP ( xin => vStage_uid141_lzcZ_uid56_fpCosPiTest_b, xout => ld_vStage_uid141_lzcZ_uid56_fpCosPiTest_b_to_leftShiftStage0Idx2_uid180_alignedZ_uid57_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx2_uid180_alignedZ_uid57_fpCosPiTest(BITJOIN,179)@6
    leftShiftStage0Idx2_uid180_alignedZ_uid57_fpCosPiTest_q <= ld_vStage_uid141_lzcZ_uid56_fpCosPiTest_b_to_leftShiftStage0Idx2_uid180_alignedZ_uid57_fpCosPiTest_b_q & leftShiftStage0Idx2Pad32_uid108_fxpX_uid41_fpCosPiTest_q;

	--X18dto0_uid176_alignedZ_uid57_fpCosPiTest(BITSELECT,175)@3
    X18dto0_uid176_alignedZ_uid57_fpCosPiTest_in <= z_uid54_fpCosPiTest_b(18 downto 0);
    X18dto0_uid176_alignedZ_uid57_fpCosPiTest_b <= X18dto0_uid176_alignedZ_uid57_fpCosPiTest_in(18 downto 0);

	--ld_X18dto0_uid176_alignedZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest_b_inputreg(DELAY,573)
    ld_X18dto0_uid176_alignedZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 19, depth => 1 )
    PORT MAP ( xin => X18dto0_uid176_alignedZ_uid57_fpCosPiTest_b, xout => ld_X18dto0_uid176_alignedZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X18dto0_uid176_alignedZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest_b(DELAY,449)@3
    ld_X18dto0_uid176_alignedZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 19, depth => 2 )
    PORT MAP ( xin => ld_X18dto0_uid176_alignedZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest_b_inputreg_q, xout => ld_X18dto0_uid176_alignedZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest(BITJOIN,176)@6
    leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest_q <= ld_X18dto0_uid176_alignedZ_uid57_fpCosPiTest_b_to_leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest_b_q & leftShiftStage0Idx1Pad16_uid105_fxpX_uid41_fpCosPiTest_q;

	--ld_z_uid54_fpCosPiTest_b_to_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_c_inputreg(DELAY,574)
    ld_z_uid54_fpCosPiTest_b_to_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 35, depth => 1 )
    PORT MAP ( xin => z_uid54_fpCosPiTest_b, xout => ld_z_uid54_fpCosPiTest_b_to_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_z_uid54_fpCosPiTest_b_to_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_c(DELAY,453)@3
    ld_z_uid54_fpCosPiTest_b_to_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_c : dspba_delay
    GENERIC MAP ( width => 35, depth => 2 )
    PORT MAP ( xin => ld_z_uid54_fpCosPiTest_b_to_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_c_inputreg_q, xout => ld_z_uid54_fpCosPiTest_b_to_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--rVStage_uid138_lzcZ_uid56_fpCosPiTest(BITSELECT,137)@3
    rVStage_uid138_lzcZ_uid56_fpCosPiTest_in <= z_uid54_fpCosPiTest_b;
    rVStage_uid138_lzcZ_uid56_fpCosPiTest_b <= rVStage_uid138_lzcZ_uid56_fpCosPiTest_in(34 downto 3);

	--reg_rVStage_uid138_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid139_lzcZ_uid56_fpCosPiTest_1(REG,247)@3
    reg_rVStage_uid138_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid139_lzcZ_uid56_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid138_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid139_lzcZ_uid56_fpCosPiTest_1_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid138_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid139_lzcZ_uid56_fpCosPiTest_1_q <= rVStage_uid138_lzcZ_uid56_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid139_lzcZ_uid56_fpCosPiTest(LOGICAL,138)@4
    vCount_uid139_lzcZ_uid56_fpCosPiTest_a <= reg_rVStage_uid138_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid139_lzcZ_uid56_fpCosPiTest_1_q;
    vCount_uid139_lzcZ_uid56_fpCosPiTest_b <= leftShiftStage0Idx2Pad32_uid108_fxpX_uid41_fpCosPiTest_q;
    vCount_uid139_lzcZ_uid56_fpCosPiTest_q <= "1" when vCount_uid139_lzcZ_uid56_fpCosPiTest_a = vCount_uid139_lzcZ_uid56_fpCosPiTest_b else "0";

	--ld_vCount_uid139_lzcZ_uid56_fpCosPiTest_q_to_r_uid172_lzcZ_uid56_fpCosPiTest_f(DELAY,447)@4
    ld_vCount_uid139_lzcZ_uid56_fpCosPiTest_q_to_r_uid172_lzcZ_uid56_fpCosPiTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid139_lzcZ_uid56_fpCosPiTest_q, xout => ld_vCount_uid139_lzcZ_uid56_fpCosPiTest_q_to_r_uid172_lzcZ_uid56_fpCosPiTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--mO_uid140_lzcZ_uid56_fpCosPiTest(CONSTANT,139)
    mO_uid140_lzcZ_uid56_fpCosPiTest_q <= "11111111111111111111111111111";

	--cStage_uid142_lzcZ_uid56_fpCosPiTest(BITJOIN,141)@3
    cStage_uid142_lzcZ_uid56_fpCosPiTest_q <= vStage_uid141_lzcZ_uid56_fpCosPiTest_b & mO_uid140_lzcZ_uid56_fpCosPiTest_q;

	--reg_cStage_uid142_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid144_lzcZ_uid56_fpCosPiTest_3(REG,249)@3
    reg_cStage_uid142_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid144_lzcZ_uid56_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid142_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid144_lzcZ_uid56_fpCosPiTest_3_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid142_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid144_lzcZ_uid56_fpCosPiTest_3_q <= cStage_uid142_lzcZ_uid56_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid144_lzcZ_uid56_fpCosPiTest(MUX,143)@4
    vStagei_uid144_lzcZ_uid56_fpCosPiTest_s <= vCount_uid139_lzcZ_uid56_fpCosPiTest_q;
    vStagei_uid144_lzcZ_uid56_fpCosPiTest: PROCESS (vStagei_uid144_lzcZ_uid56_fpCosPiTest_s, en, reg_rVStage_uid138_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid139_lzcZ_uid56_fpCosPiTest_1_q, reg_cStage_uid142_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid144_lzcZ_uid56_fpCosPiTest_3_q)
    BEGIN
            CASE vStagei_uid144_lzcZ_uid56_fpCosPiTest_s IS
                  WHEN "0" => vStagei_uid144_lzcZ_uid56_fpCosPiTest_q <= reg_rVStage_uid138_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid139_lzcZ_uid56_fpCosPiTest_1_q;
                  WHEN "1" => vStagei_uid144_lzcZ_uid56_fpCosPiTest_q <= reg_cStage_uid142_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid144_lzcZ_uid56_fpCosPiTest_3_q;
                  WHEN OTHERS => vStagei_uid144_lzcZ_uid56_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid146_lzcZ_uid56_fpCosPiTest(BITSELECT,145)@4
    rVStage_uid146_lzcZ_uid56_fpCosPiTest_in <= vStagei_uid144_lzcZ_uid56_fpCosPiTest_q;
    rVStage_uid146_lzcZ_uid56_fpCosPiTest_b <= rVStage_uid146_lzcZ_uid56_fpCosPiTest_in(31 downto 16);

	--reg_rVStage_uid146_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid147_lzcZ_uid56_fpCosPiTest_1(REG,250)@4
    reg_rVStage_uid146_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid147_lzcZ_uid56_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid146_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid147_lzcZ_uid56_fpCosPiTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid146_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid147_lzcZ_uid56_fpCosPiTest_1_q <= rVStage_uid146_lzcZ_uid56_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid147_lzcZ_uid56_fpCosPiTest(LOGICAL,146)@5
    vCount_uid147_lzcZ_uid56_fpCosPiTest_a <= reg_rVStage_uid146_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid147_lzcZ_uid56_fpCosPiTest_1_q;
    vCount_uid147_lzcZ_uid56_fpCosPiTest_b <= leftShiftStage0Idx1Pad16_uid105_fxpX_uid41_fpCosPiTest_q;
    vCount_uid147_lzcZ_uid56_fpCosPiTest_q <= "1" when vCount_uid147_lzcZ_uid56_fpCosPiTest_a = vCount_uid147_lzcZ_uid56_fpCosPiTest_b else "0";

	--ld_vCount_uid147_lzcZ_uid56_fpCosPiTest_q_to_r_uid172_lzcZ_uid56_fpCosPiTest_e(DELAY,446)@5
    ld_vCount_uid147_lzcZ_uid56_fpCosPiTest_q_to_r_uid172_lzcZ_uid56_fpCosPiTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid147_lzcZ_uid56_fpCosPiTest_q, xout => ld_vCount_uid147_lzcZ_uid56_fpCosPiTest_q_to_r_uid172_lzcZ_uid56_fpCosPiTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid148_lzcZ_uid56_fpCosPiTest(BITSELECT,147)@4
    vStage_uid148_lzcZ_uid56_fpCosPiTest_in <= vStagei_uid144_lzcZ_uid56_fpCosPiTest_q(15 downto 0);
    vStage_uid148_lzcZ_uid56_fpCosPiTest_b <= vStage_uid148_lzcZ_uid56_fpCosPiTest_in(15 downto 0);

	--reg_vStage_uid148_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid150_lzcZ_uid56_fpCosPiTest_3(REG,252)@4
    reg_vStage_uid148_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid150_lzcZ_uid56_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid148_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid150_lzcZ_uid56_fpCosPiTest_3_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid148_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid150_lzcZ_uid56_fpCosPiTest_3_q <= vStage_uid148_lzcZ_uid56_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid150_lzcZ_uid56_fpCosPiTest(MUX,149)@5
    vStagei_uid150_lzcZ_uid56_fpCosPiTest_s <= vCount_uid147_lzcZ_uid56_fpCosPiTest_q;
    vStagei_uid150_lzcZ_uid56_fpCosPiTest: PROCESS (vStagei_uid150_lzcZ_uid56_fpCosPiTest_s, en, reg_rVStage_uid146_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid147_lzcZ_uid56_fpCosPiTest_1_q, reg_vStage_uid148_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid150_lzcZ_uid56_fpCosPiTest_3_q)
    BEGIN
            CASE vStagei_uid150_lzcZ_uid56_fpCosPiTest_s IS
                  WHEN "0" => vStagei_uid150_lzcZ_uid56_fpCosPiTest_q <= reg_rVStage_uid146_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid147_lzcZ_uid56_fpCosPiTest_1_q;
                  WHEN "1" => vStagei_uid150_lzcZ_uid56_fpCosPiTest_q <= reg_vStage_uid148_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid150_lzcZ_uid56_fpCosPiTest_3_q;
                  WHEN OTHERS => vStagei_uid150_lzcZ_uid56_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid152_lzcZ_uid56_fpCosPiTest(BITSELECT,151)@5
    rVStage_uid152_lzcZ_uid56_fpCosPiTest_in <= vStagei_uid150_lzcZ_uid56_fpCosPiTest_q;
    rVStage_uid152_lzcZ_uid56_fpCosPiTest_b <= rVStage_uid152_lzcZ_uid56_fpCosPiTest_in(15 downto 8);

	--vCount_uid153_lzcZ_uid56_fpCosPiTest(LOGICAL,152)@5
    vCount_uid153_lzcZ_uid56_fpCosPiTest_a <= rVStage_uid152_lzcZ_uid56_fpCosPiTest_b;
    vCount_uid153_lzcZ_uid56_fpCosPiTest_b <= cstAllZWE_uid21_fpCosPiTest_q;
    vCount_uid153_lzcZ_uid56_fpCosPiTest_q <= "1" when vCount_uid153_lzcZ_uid56_fpCosPiTest_a = vCount_uid153_lzcZ_uid56_fpCosPiTest_b else "0";

	--reg_vCount_uid153_lzcZ_uid56_fpCosPiTest_0_to_r_uid172_lzcZ_uid56_fpCosPiTest_3(REG,256)@5
    reg_vCount_uid153_lzcZ_uid56_fpCosPiTest_0_to_r_uid172_lzcZ_uid56_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid153_lzcZ_uid56_fpCosPiTest_0_to_r_uid172_lzcZ_uid56_fpCosPiTest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid153_lzcZ_uid56_fpCosPiTest_0_to_r_uid172_lzcZ_uid56_fpCosPiTest_3_q <= vCount_uid153_lzcZ_uid56_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid154_lzcZ_uid56_fpCosPiTest(BITSELECT,153)@5
    vStage_uid154_lzcZ_uid56_fpCosPiTest_in <= vStagei_uid150_lzcZ_uid56_fpCosPiTest_q(7 downto 0);
    vStage_uid154_lzcZ_uid56_fpCosPiTest_b <= vStage_uid154_lzcZ_uid56_fpCosPiTest_in(7 downto 0);

	--vStagei_uid156_lzcZ_uid56_fpCosPiTest(MUX,155)@5
    vStagei_uid156_lzcZ_uid56_fpCosPiTest_s <= vCount_uid153_lzcZ_uid56_fpCosPiTest_q;
    vStagei_uid156_lzcZ_uid56_fpCosPiTest: PROCESS (vStagei_uid156_lzcZ_uid56_fpCosPiTest_s, en, rVStage_uid152_lzcZ_uid56_fpCosPiTest_b, vStage_uid154_lzcZ_uid56_fpCosPiTest_b)
    BEGIN
            CASE vStagei_uid156_lzcZ_uid56_fpCosPiTest_s IS
                  WHEN "0" => vStagei_uid156_lzcZ_uid56_fpCosPiTest_q <= rVStage_uid152_lzcZ_uid56_fpCosPiTest_b;
                  WHEN "1" => vStagei_uid156_lzcZ_uid56_fpCosPiTest_q <= vStage_uid154_lzcZ_uid56_fpCosPiTest_b;
                  WHEN OTHERS => vStagei_uid156_lzcZ_uid56_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid158_lzcZ_uid56_fpCosPiTest(BITSELECT,157)@5
    rVStage_uid158_lzcZ_uid56_fpCosPiTest_in <= vStagei_uid156_lzcZ_uid56_fpCosPiTest_q;
    rVStage_uid158_lzcZ_uid56_fpCosPiTest_b <= rVStage_uid158_lzcZ_uid56_fpCosPiTest_in(7 downto 4);

	--reg_rVStage_uid158_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid159_lzcZ_uid56_fpCosPiTest_1(REG,253)@5
    reg_rVStage_uid158_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid159_lzcZ_uid56_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid158_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid159_lzcZ_uid56_fpCosPiTest_1_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid158_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid159_lzcZ_uid56_fpCosPiTest_1_q <= rVStage_uid158_lzcZ_uid56_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid159_lzcZ_uid56_fpCosPiTest(LOGICAL,158)@6
    vCount_uid159_lzcZ_uid56_fpCosPiTest_a <= reg_rVStage_uid158_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid159_lzcZ_uid56_fpCosPiTest_1_q;
    vCount_uid159_lzcZ_uid56_fpCosPiTest_b <= leftShiftStage1Idx1Pad4_uid114_fxpX_uid41_fpCosPiTest_q;
    vCount_uid159_lzcZ_uid56_fpCosPiTest_q <= "1" when vCount_uid159_lzcZ_uid56_fpCosPiTest_a = vCount_uid159_lzcZ_uid56_fpCosPiTest_b else "0";

	--vStage_uid160_lzcZ_uid56_fpCosPiTest(BITSELECT,159)@5
    vStage_uid160_lzcZ_uid56_fpCosPiTest_in <= vStagei_uid156_lzcZ_uid56_fpCosPiTest_q(3 downto 0);
    vStage_uid160_lzcZ_uid56_fpCosPiTest_b <= vStage_uid160_lzcZ_uid56_fpCosPiTest_in(3 downto 0);

	--reg_vStage_uid160_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid162_lzcZ_uid56_fpCosPiTest_3(REG,255)@5
    reg_vStage_uid160_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid162_lzcZ_uid56_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid160_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid162_lzcZ_uid56_fpCosPiTest_3_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid160_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid162_lzcZ_uid56_fpCosPiTest_3_q <= vStage_uid160_lzcZ_uid56_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid162_lzcZ_uid56_fpCosPiTest(MUX,161)@6
    vStagei_uid162_lzcZ_uid56_fpCosPiTest_s <= vCount_uid159_lzcZ_uid56_fpCosPiTest_q;
    vStagei_uid162_lzcZ_uid56_fpCosPiTest: PROCESS (vStagei_uid162_lzcZ_uid56_fpCosPiTest_s, en, reg_rVStage_uid158_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid159_lzcZ_uid56_fpCosPiTest_1_q, reg_vStage_uid160_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid162_lzcZ_uid56_fpCosPiTest_3_q)
    BEGIN
            CASE vStagei_uid162_lzcZ_uid56_fpCosPiTest_s IS
                  WHEN "0" => vStagei_uid162_lzcZ_uid56_fpCosPiTest_q <= reg_rVStage_uid158_lzcZ_uid56_fpCosPiTest_0_to_vCount_uid159_lzcZ_uid56_fpCosPiTest_1_q;
                  WHEN "1" => vStagei_uid162_lzcZ_uid56_fpCosPiTest_q <= reg_vStage_uid160_lzcZ_uid56_fpCosPiTest_0_to_vStagei_uid162_lzcZ_uid56_fpCosPiTest_3_q;
                  WHEN OTHERS => vStagei_uid162_lzcZ_uid56_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid164_lzcZ_uid56_fpCosPiTest(BITSELECT,163)@6
    rVStage_uid164_lzcZ_uid56_fpCosPiTest_in <= vStagei_uid162_lzcZ_uid56_fpCosPiTest_q;
    rVStage_uid164_lzcZ_uid56_fpCosPiTest_b <= rVStage_uid164_lzcZ_uid56_fpCosPiTest_in(3 downto 2);

	--vCount_uid165_lzcZ_uid56_fpCosPiTest(LOGICAL,164)@6
    vCount_uid165_lzcZ_uid56_fpCosPiTest_a <= rVStage_uid164_lzcZ_uid56_fpCosPiTest_b;
    vCount_uid165_lzcZ_uid56_fpCosPiTest_b <= leftShiftStage2Idx2Pad2_uid128_fxpX_uid41_fpCosPiTest_q;
    vCount_uid165_lzcZ_uid56_fpCosPiTest_q <= "1" when vCount_uid165_lzcZ_uid56_fpCosPiTest_a = vCount_uid165_lzcZ_uid56_fpCosPiTest_b else "0";

	--vStage_uid166_lzcZ_uid56_fpCosPiTest(BITSELECT,165)@6
    vStage_uid166_lzcZ_uid56_fpCosPiTest_in <= vStagei_uid162_lzcZ_uid56_fpCosPiTest_q(1 downto 0);
    vStage_uid166_lzcZ_uid56_fpCosPiTest_b <= vStage_uid166_lzcZ_uid56_fpCosPiTest_in(1 downto 0);

	--vStagei_uid168_lzcZ_uid56_fpCosPiTest(MUX,167)@6
    vStagei_uid168_lzcZ_uid56_fpCosPiTest_s <= vCount_uid165_lzcZ_uid56_fpCosPiTest_q;
    vStagei_uid168_lzcZ_uid56_fpCosPiTest: PROCESS (vStagei_uid168_lzcZ_uid56_fpCosPiTest_s, en, rVStage_uid164_lzcZ_uid56_fpCosPiTest_b, vStage_uid166_lzcZ_uid56_fpCosPiTest_b)
    BEGIN
            CASE vStagei_uid168_lzcZ_uid56_fpCosPiTest_s IS
                  WHEN "0" => vStagei_uid168_lzcZ_uid56_fpCosPiTest_q <= rVStage_uid164_lzcZ_uid56_fpCosPiTest_b;
                  WHEN "1" => vStagei_uid168_lzcZ_uid56_fpCosPiTest_q <= vStage_uid166_lzcZ_uid56_fpCosPiTest_b;
                  WHEN OTHERS => vStagei_uid168_lzcZ_uid56_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid170_lzcZ_uid56_fpCosPiTest(BITSELECT,169)@6
    rVStage_uid170_lzcZ_uid56_fpCosPiTest_in <= vStagei_uid168_lzcZ_uid56_fpCosPiTest_q;
    rVStage_uid170_lzcZ_uid56_fpCosPiTest_b <= rVStage_uid170_lzcZ_uid56_fpCosPiTest_in(1 downto 1);

	--vCount_uid171_lzcZ_uid56_fpCosPiTest(LOGICAL,170)@6
    vCount_uid171_lzcZ_uid56_fpCosPiTest_a <= rVStage_uid170_lzcZ_uid56_fpCosPiTest_b;
    vCount_uid171_lzcZ_uid56_fpCosPiTest_b <= GND_q;
    vCount_uid171_lzcZ_uid56_fpCosPiTest_q <= "1" when vCount_uid171_lzcZ_uid56_fpCosPiTest_a = vCount_uid171_lzcZ_uid56_fpCosPiTest_b else "0";

	--r_uid172_lzcZ_uid56_fpCosPiTest(BITJOIN,171)@6
    r_uid172_lzcZ_uid56_fpCosPiTest_q <= ld_vCount_uid139_lzcZ_uid56_fpCosPiTest_q_to_r_uid172_lzcZ_uid56_fpCosPiTest_f_q & ld_vCount_uid147_lzcZ_uid56_fpCosPiTest_q_to_r_uid172_lzcZ_uid56_fpCosPiTest_e_q & reg_vCount_uid153_lzcZ_uid56_fpCosPiTest_0_to_r_uid172_lzcZ_uid56_fpCosPiTest_3_q & vCount_uid159_lzcZ_uid56_fpCosPiTest_q & vCount_uid165_lzcZ_uid56_fpCosPiTest_q & vCount_uid171_lzcZ_uid56_fpCosPiTest_q;

	--leftShiftStageSel5Dto4_uid182_alignedZ_uid57_fpCosPiTest(BITSELECT,181)@6
    leftShiftStageSel5Dto4_uid182_alignedZ_uid57_fpCosPiTest_in <= r_uid172_lzcZ_uid56_fpCosPiTest_q;
    leftShiftStageSel5Dto4_uid182_alignedZ_uid57_fpCosPiTest_b <= leftShiftStageSel5Dto4_uid182_alignedZ_uid57_fpCosPiTest_in(5 downto 4);

	--leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest(MUX,182)@6
    leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_s <= leftShiftStageSel5Dto4_uid182_alignedZ_uid57_fpCosPiTest_b;
    leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest: PROCESS (leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_s, en, ld_z_uid54_fpCosPiTest_b_to_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_c_q, leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest_q, leftShiftStage0Idx2_uid180_alignedZ_uid57_fpCosPiTest_q, cstZwSwF_uid15_fpCosPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_q <= ld_z_uid54_fpCosPiTest_b_to_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_c_q;
                  WHEN "01" => leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_q <= leftShiftStage0Idx1_uid177_alignedZ_uid57_fpCosPiTest_q;
                  WHEN "10" => leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_q <= leftShiftStage0Idx2_uid180_alignedZ_uid57_fpCosPiTest_q;
                  WHEN "11" => leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_q <= cstZwSwF_uid15_fpCosPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage022dto0_uid191_alignedZ_uid57_fpCosPiTest(BITSELECT,190)@6
    LeftShiftStage022dto0_uid191_alignedZ_uid57_fpCosPiTest_in <= leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_q(22 downto 0);
    LeftShiftStage022dto0_uid191_alignedZ_uid57_fpCosPiTest_b <= LeftShiftStage022dto0_uid191_alignedZ_uid57_fpCosPiTest_in(22 downto 0);

	--leftShiftStage1Idx3_uid192_alignedZ_uid57_fpCosPiTest(BITJOIN,191)@6
    leftShiftStage1Idx3_uid192_alignedZ_uid57_fpCosPiTest_q <= LeftShiftStage022dto0_uid191_alignedZ_uid57_fpCosPiTest_b & leftShiftStage1Idx3Pad12_uid120_fxpX_uid41_fpCosPiTest_q;

	--reg_leftShiftStage1Idx3_uid192_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_5(REG,261)@6
    reg_leftShiftStage1Idx3_uid192_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid192_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_5_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid192_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_5_q <= leftShiftStage1Idx3_uid192_alignedZ_uid57_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage026dto0_uid188_alignedZ_uid57_fpCosPiTest(BITSELECT,187)@6
    LeftShiftStage026dto0_uid188_alignedZ_uid57_fpCosPiTest_in <= leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_q(26 downto 0);
    LeftShiftStage026dto0_uid188_alignedZ_uid57_fpCosPiTest_b <= LeftShiftStage026dto0_uid188_alignedZ_uid57_fpCosPiTest_in(26 downto 0);

	--leftShiftStage1Idx2_uid189_alignedZ_uid57_fpCosPiTest(BITJOIN,188)@6
    leftShiftStage1Idx2_uid189_alignedZ_uid57_fpCosPiTest_q <= LeftShiftStage026dto0_uid188_alignedZ_uid57_fpCosPiTest_b & cstAllZWE_uid21_fpCosPiTest_q;

	--reg_leftShiftStage1Idx2_uid189_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_4(REG,260)@6
    reg_leftShiftStage1Idx2_uid189_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid189_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_4_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid189_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_4_q <= leftShiftStage1Idx2_uid189_alignedZ_uid57_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage030dto0_uid185_alignedZ_uid57_fpCosPiTest(BITSELECT,184)@6
    LeftShiftStage030dto0_uid185_alignedZ_uid57_fpCosPiTest_in <= leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_q(30 downto 0);
    LeftShiftStage030dto0_uid185_alignedZ_uid57_fpCosPiTest_b <= LeftShiftStage030dto0_uid185_alignedZ_uid57_fpCosPiTest_in(30 downto 0);

	--leftShiftStage1Idx1_uid186_alignedZ_uid57_fpCosPiTest(BITJOIN,185)@6
    leftShiftStage1Idx1_uid186_alignedZ_uid57_fpCosPiTest_q <= LeftShiftStage030dto0_uid185_alignedZ_uid57_fpCosPiTest_b & leftShiftStage1Idx1Pad4_uid114_fxpX_uid41_fpCosPiTest_q;

	--reg_leftShiftStage1Idx1_uid186_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_3(REG,259)@6
    reg_leftShiftStage1Idx1_uid186_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid186_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid186_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_3_q <= leftShiftStage1Idx1_uid186_alignedZ_uid57_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_2(REG,258)@6
    reg_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_2_q <= leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel3Dto2_uid193_alignedZ_uid57_fpCosPiTest(BITSELECT,192)@6
    leftShiftStageSel3Dto2_uid193_alignedZ_uid57_fpCosPiTest_in <= r_uid172_lzcZ_uid56_fpCosPiTest_q(3 downto 0);
    leftShiftStageSel3Dto2_uid193_alignedZ_uid57_fpCosPiTest_b <= leftShiftStageSel3Dto2_uid193_alignedZ_uid57_fpCosPiTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid193_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_1(REG,257)@6
    reg_leftShiftStageSel3Dto2_uid193_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid193_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid193_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_1_q <= leftShiftStageSel3Dto2_uid193_alignedZ_uid57_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest(MUX,193)@7
    leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_s <= reg_leftShiftStageSel3Dto2_uid193_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_1_q;
    leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest: PROCESS (leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_s, en, reg_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_2_q, reg_leftShiftStage1Idx1_uid186_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_3_q, reg_leftShiftStage1Idx2_uid189_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_4_q, reg_leftShiftStage1Idx3_uid192_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_q <= reg_leftShiftStage0_uid183_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_q <= reg_leftShiftStage1Idx1_uid186_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_3_q;
                  WHEN "10" => leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_q <= reg_leftShiftStage1Idx2_uid189_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_4_q;
                  WHEN "11" => leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_q <= reg_leftShiftStage1Idx3_uid192_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid204_alignedZ_uid57_fpCosPiTest(BITSELECT,203)@6
    leftShiftStageSel1Dto0_uid204_alignedZ_uid57_fpCosPiTest_in <= r_uid172_lzcZ_uid56_fpCosPiTest_q(1 downto 0);
    leftShiftStageSel1Dto0_uid204_alignedZ_uid57_fpCosPiTest_b <= leftShiftStageSel1Dto0_uid204_alignedZ_uid57_fpCosPiTest_in(1 downto 0);

	--reg_leftShiftStageSel1Dto0_uid204_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_1(REG,262)@6
    reg_leftShiftStageSel1Dto0_uid204_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid204_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid204_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_1_q <= leftShiftStageSel1Dto0_uid204_alignedZ_uid57_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest(MUX,204)@7
    leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_s <= reg_leftShiftStageSel1Dto0_uid204_alignedZ_uid57_fpCosPiTest_0_to_leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_1_q;
    leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest: PROCESS (leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_s, en, leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_q, leftShiftStage2Idx1_uid197_alignedZ_uid57_fpCosPiTest_q, leftShiftStage2Idx2_uid200_alignedZ_uid57_fpCosPiTest_q, leftShiftStage2Idx3_uid203_alignedZ_uid57_fpCosPiTest_q)
    BEGIN
            CASE leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_s IS
                  WHEN "00" => leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_q <= leftShiftStage1_uid194_alignedZ_uid57_fpCosPiTest_q;
                  WHEN "01" => leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_q <= leftShiftStage2Idx1_uid197_alignedZ_uid57_fpCosPiTest_q;
                  WHEN "10" => leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_q <= leftShiftStage2Idx2_uid200_alignedZ_uid57_fpCosPiTest_q;
                  WHEN "11" => leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_q <= leftShiftStage2Idx3_uid203_alignedZ_uid57_fpCosPiTest_q;
                  WHEN OTHERS => leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--alignedZLow_uid58_fpCosPiTest(BITSELECT,57)@7
    alignedZLow_uid58_fpCosPiTest_in <= leftShiftStage2_uid205_alignedZ_uid57_fpCosPiTest_q;
    alignedZLow_uid58_fpCosPiTest_b <= alignedZLow_uid58_fpCosPiTest_in(34 downto 11);

	--ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_inputreg(DELAY,612)
    ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => alignedZLow_uid58_fpCosPiTest_b, xout => ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem(DUALMEM,613)
    ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_reset0 <= areset;
    ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_ia <= ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_inputreg_q;
    ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_aa <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdreg_q;
    ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_ab <= ld_reg_zAddr_uid62_fpCosPiTest_0_to_memoryC1_uid208_sinPiZTableGenerator_0_q_to_memoryC1_uid208_sinPiZTableGenerator_a_replace_rdmux_q;
    ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 24,
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
        clocken1 => ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_iq,
        address_a => ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_aa,
        data_a => ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_ia
    );
        ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_q <= ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_iq(23 downto 0);

	--reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0(REG,269)@12
    reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_q <= ld_alignedZLow_uid58_fpCosPiTest_b_to_reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest(MULT,222)@13
    prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_pr <= UNSIGNED(prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_a) * UNSIGNED(prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_b);
    prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_a <= (others => '0');
            prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_b <= (others => '0');
            prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_a <= reg_alignedZLow_uid58_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_0_q;
                prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_b <= reg_fxpSinRes_uid65_fpCosPiTest_0_to_prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_1_q;
                prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_s1 <= STD_LOGIC_VECTOR(prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_pr);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_q <= prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid224_mul2xSinRes_uid66_fpCosPiTest(BITSELECT,223)@16
    prodXYTruncFR_uid224_mul2xSinRes_uid66_fpCosPiTest_in <= prodXY_uid223_mul2xSinRes_uid66_fpCosPiTest_q;
    prodXYTruncFR_uid224_mul2xSinRes_uid66_fpCosPiTest_b <= prodXYTruncFR_uid224_mul2xSinRes_uid66_fpCosPiTest_in(48 downto 23);

	--normBit_uid67_fpCosPiTest(BITSELECT,66)@16
    normBit_uid67_fpCosPiTest_in <= prodXYTruncFR_uid224_mul2xSinRes_uid66_fpCosPiTest_b;
    normBit_uid67_fpCosPiTest_b <= normBit_uid67_fpCosPiTest_in(25 downto 25);

	--cstAllZWF_uid9_fpCosPiTest(CONSTANT,8)
    cstAllZWF_uid9_fpCosPiTest_q <= "00000000000000000000000";

	--rndExpUpdate_uid72_uid73_fpCosPiTest(BITJOIN,72)@16
    rndExpUpdate_uid72_uid73_fpCosPiTest_q <= normBit_uid67_fpCosPiTest_b & cstAllZWF_uid9_fpCosPiTest_q & VCC_q;

	--ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_nor(LOGICAL,558)
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_nor_a <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_notEnable_q;
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_nor_b <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_sticky_ena_q;
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_nor_q <= not (ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_nor_a or ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_nor_b);

	--ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_sticky_ena(REG,559)
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_nor_q = "1") THEN
                ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_sticky_ena_q <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_enaAnd(LOGICAL,560)
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_enaAnd_a <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_sticky_ena_q;
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_enaAnd_b <= en;
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_enaAnd_q <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_enaAnd_a and ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_enaAnd_b;

	--reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1(REG,271)@6
    reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q <= r_uid172_lzcZ_uid56_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem(DUALMEM,549)
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_reset0 <= areset;
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_ia <= reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q;
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_aa <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdreg_q;
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_ab <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_rdmux_q;
    ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 6,
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
        clocken1 => ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_iq,
        address_a => ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_aa,
        data_a => ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_ia
    );
        ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_q <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_iq(5 downto 0);

	--cstBiasM1_uid11_fpCosPiTest(CONSTANT,10)
    cstBiasM1_uid11_fpCosPiTest_q <= "01111110";

	--expHardCase_uid59_fpCosPiTest(SUB,58)@15
    expHardCase_uid59_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid11_fpCosPiTest_q);
    expHardCase_uid59_fpCosPiTest_b <= STD_LOGIC_VECTOR("000" & ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_replace_mem_q);
            expHardCase_uid59_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expHardCase_uid59_fpCosPiTest_a) - UNSIGNED(expHardCase_uid59_fpCosPiTest_b));
    expHardCase_uid59_fpCosPiTest_q <= expHardCase_uid59_fpCosPiTest_o(8 downto 0);


	--expP_uid60_fpCosPiTest(BITSELECT,59)@15
    expP_uid60_fpCosPiTest_in <= expHardCase_uid59_fpCosPiTest_q(7 downto 0);
    expP_uid60_fpCosPiTest_b <= expP_uid60_fpCosPiTest_in(7 downto 0);

	--reg_expP_uid60_fpCosPiTest_0_to_expFracPreRnd_uid71_uid71_fpCosPiTest_1(REG,272)@15
    reg_expP_uid60_fpCosPiTest_0_to_expFracPreRnd_uid71_uid71_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expP_uid60_fpCosPiTest_0_to_expFracPreRnd_uid71_uid71_fpCosPiTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expP_uid60_fpCosPiTest_0_to_expFracPreRnd_uid71_uid71_fpCosPiTest_1_q <= expP_uid60_fpCosPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--highRes_uid68_fpCosPiTest(BITSELECT,67)@16
    highRes_uid68_fpCosPiTest_in <= prodXYTruncFR_uid224_mul2xSinRes_uid66_fpCosPiTest_b(24 downto 0);
    highRes_uid68_fpCosPiTest_b <= highRes_uid68_fpCosPiTest_in(24 downto 1);

	--lowRes_uid69_fpCosPiTest(BITSELECT,68)@16
    lowRes_uid69_fpCosPiTest_in <= prodXYTruncFR_uid224_mul2xSinRes_uid66_fpCosPiTest_b(23 downto 0);
    lowRes_uid69_fpCosPiTest_b <= lowRes_uid69_fpCosPiTest_in(23 downto 0);

	--fracRCompPreRnd_uid70_fpCosPiTest(MUX,69)@16
    fracRCompPreRnd_uid70_fpCosPiTest_s <= normBit_uid67_fpCosPiTest_b;
    fracRCompPreRnd_uid70_fpCosPiTest: PROCESS (fracRCompPreRnd_uid70_fpCosPiTest_s, en, lowRes_uid69_fpCosPiTest_b, highRes_uid68_fpCosPiTest_b)
    BEGIN
            CASE fracRCompPreRnd_uid70_fpCosPiTest_s IS
                  WHEN "0" => fracRCompPreRnd_uid70_fpCosPiTest_q <= lowRes_uid69_fpCosPiTest_b;
                  WHEN "1" => fracRCompPreRnd_uid70_fpCosPiTest_q <= highRes_uid68_fpCosPiTest_b;
                  WHEN OTHERS => fracRCompPreRnd_uid70_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracPreRnd_uid71_uid71_fpCosPiTest(BITJOIN,70)@16
    expFracPreRnd_uid71_uid71_fpCosPiTest_q <= reg_expP_uid60_fpCosPiTest_0_to_expFracPreRnd_uid71_uid71_fpCosPiTest_1_q & fracRCompPreRnd_uid70_fpCosPiTest_q;

	--expFracComp_uid74_fpCosPiTest(ADD,73)@16
    expFracComp_uid74_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & expFracPreRnd_uid71_uid71_fpCosPiTest_q);
    expFracComp_uid74_fpCosPiTest_b <= STD_LOGIC_VECTOR("00000000" & rndExpUpdate_uid72_uid73_fpCosPiTest_q);
            expFracComp_uid74_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracComp_uid74_fpCosPiTest_a) + UNSIGNED(expFracComp_uid74_fpCosPiTest_b));
    expFracComp_uid74_fpCosPiTest_q <= expFracComp_uid74_fpCosPiTest_o(32 downto 0);


	--expRComp_uid76_fpCosPiTest(BITSELECT,75)@16
    expRComp_uid76_fpCosPiTest_in <= expFracComp_uid74_fpCosPiTest_q(31 downto 0);
    expRComp_uid76_fpCosPiTest_b <= expRComp_uid76_fpCosPiTest_in(31 downto 24);

	--fracXIsZero_uid27_fpCosPiTest(LOGICAL,26)@0
    fracXIsZero_uid27_fpCosPiTest_a <= fracX_uid7_fpCosPiTest_b;
    fracXIsZero_uid27_fpCosPiTest_b <= cstAllZWF_uid9_fpCosPiTest_q;
    fracXIsZero_uid27_fpCosPiTest_q <= "1" when fracXIsZero_uid27_fpCosPiTest_a = fracXIsZero_uid27_fpCosPiTest_b else "0";

	--InvFracXIsZero_uid29_fpCosPiTest(LOGICAL,28)@0
    InvFracXIsZero_uid29_fpCosPiTest_a <= fracXIsZero_uid27_fpCosPiTest_q;
    InvFracXIsZero_uid29_fpCosPiTest_q <= not InvFracXIsZero_uid29_fpCosPiTest_a;

	--expXIsMax_uid25_fpCosPiTest(LOGICAL,24)@0
    expXIsMax_uid25_fpCosPiTest_a <= expX_uid6_fpCosPiTest_b;
    expXIsMax_uid25_fpCosPiTest_b <= cstAllOWE_uid8_fpCosPiTest_q;
    expXIsMax_uid25_fpCosPiTest_q <= "1" when expXIsMax_uid25_fpCosPiTest_a = expXIsMax_uid25_fpCosPiTest_b else "0";

	--exc_N_uid30_fpCosPiTest(LOGICAL,29)@0
    exc_N_uid30_fpCosPiTest_a <= expXIsMax_uid25_fpCosPiTest_q;
    exc_N_uid30_fpCosPiTest_b <= InvFracXIsZero_uid29_fpCosPiTest_q;
    exc_N_uid30_fpCosPiTest_q <= exc_N_uid30_fpCosPiTest_a and exc_N_uid30_fpCosPiTest_b;

	--InvExc_N_uid31_fpCosPiTest(LOGICAL,30)@0
    InvExc_N_uid31_fpCosPiTest_a <= exc_N_uid30_fpCosPiTest_q;
    InvExc_N_uid31_fpCosPiTest_q <= not InvExc_N_uid31_fpCosPiTest_a;

	--exc_I_uid28_fpCosPiTest(LOGICAL,27)@0
    exc_I_uid28_fpCosPiTest_a <= expXIsMax_uid25_fpCosPiTest_q;
    exc_I_uid28_fpCosPiTest_b <= fracXIsZero_uid27_fpCosPiTest_q;
    exc_I_uid28_fpCosPiTest_q <= exc_I_uid28_fpCosPiTest_a and exc_I_uid28_fpCosPiTest_b;

	--InvExc_I_uid32_fpCosPiTest(LOGICAL,31)@0
    InvExc_I_uid32_fpCosPiTest_a <= exc_I_uid28_fpCosPiTest_q;
    InvExc_I_uid32_fpCosPiTest_q <= not InvExc_I_uid32_fpCosPiTest_a;

	--expXIsZero_uid23_fpCosPiTest(LOGICAL,22)@0
    expXIsZero_uid23_fpCosPiTest_a <= expX_uid6_fpCosPiTest_b;
    expXIsZero_uid23_fpCosPiTest_b <= cstAllZWE_uid21_fpCosPiTest_q;
    expXIsZero_uid23_fpCosPiTest_q <= "1" when expXIsZero_uid23_fpCosPiTest_a = expXIsZero_uid23_fpCosPiTest_b else "0";

	--InvExpXIsZero_uid33_fpCosPiTest(LOGICAL,32)@0
    InvExpXIsZero_uid33_fpCosPiTest_a <= expXIsZero_uid23_fpCosPiTest_q;
    InvExpXIsZero_uid33_fpCosPiTest_q <= not InvExpXIsZero_uid33_fpCosPiTest_a;

	--exc_R_uid34_fpCosPiTest(LOGICAL,33)@0
    exc_R_uid34_fpCosPiTest_a <= InvExpXIsZero_uid33_fpCosPiTest_q;
    exc_R_uid34_fpCosPiTest_b <= InvExc_I_uid32_fpCosPiTest_q;
    exc_R_uid34_fpCosPiTest_c <= InvExc_N_uid31_fpCosPiTest_q;
    exc_R_uid34_fpCosPiTest_q <= exc_R_uid34_fpCosPiTest_a and exc_R_uid34_fpCosPiTest_b and exc_R_uid34_fpCosPiTest_c;

	--ld_exc_R_uid34_fpCosPiTest_q_to_xIsInt_uid80_fpCosPiTest_a(DELAY,337)@0
    ld_exc_R_uid34_fpCosPiTest_q_to_xIsInt_uid80_fpCosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => exc_R_uid34_fpCosPiTest_q, xout => ld_exc_R_uid34_fpCosPiTest_q_to_xIsInt_uid80_fpCosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--xIsHalf_uid83_fpCosPiTest(LOGICAL,82)@2
    xIsHalf_uid83_fpCosPiTest_a <= ld_exc_R_uid34_fpCosPiTest_q_to_xIsInt_uid80_fpCosPiTest_a_q;
    xIsHalf_uid83_fpCosPiTest_b <= fxpXFracHalf_uid46_fpCosPiTest_q;
    xIsHalf_uid83_fpCosPiTest_c <= InvCosXIsOne_uid77_fpCosPiTest_q;
    xIsHalf_uid83_fpCosPiTest_d <= InvXEvenInt_uid81_fpCosPiTest_q;
    xIsHalf_uid83_fpCosPiTest_q <= xIsHalf_uid83_fpCosPiTest_a and xIsHalf_uid83_fpCosPiTest_b and xIsHalf_uid83_fpCosPiTest_c and xIsHalf_uid83_fpCosPiTest_d;

	--ld_xIsHalf_uid83_fpCosPiTest_q_to_expRPostExc1_uid91_fpCosPiTest_b(DELAY,355)@2
    ld_xIsHalf_uid83_fpCosPiTest_q_to_expRPostExc1_uid91_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => xIsHalf_uid83_fpCosPiTest_q, xout => ld_xIsHalf_uid83_fpCosPiTest_q_to_expRPostExc1_uid91_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expRPostExc1_uid91_fpCosPiTest(MUX,90)@16
    expRPostExc1_uid91_fpCosPiTest_s <= ld_xIsHalf_uid83_fpCosPiTest_q_to_expRPostExc1_uid91_fpCosPiTest_b_q;
    expRPostExc1_uid91_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostExc1_uid91_fpCosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRPostExc1_uid91_fpCosPiTest_s IS
                      WHEN "0" => expRPostExc1_uid91_fpCosPiTest_q <= expRComp_uid76_fpCosPiTest_b;
                      WHEN "1" => expRPostExc1_uid91_fpCosPiTest_q <= cstAllZWE_uid21_fpCosPiTest_q;
                      WHEN OTHERS => expRPostExc1_uid91_fpCosPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_nor(LOGICAL,570)
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_nor_a <= ld_reg_r_uid172_lzcZ_uid56_fpCosPiTest_0_to_expHardCase_uid59_fpCosPiTest_1_q_to_expHardCase_uid59_fpCosPiTest_b_notEnable_q;
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_nor_b <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_sticky_ena_q;
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_nor_q <= not (ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_nor_a or ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_nor_b);

	--ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_mem_top(CONSTANT,566)
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_mem_top_q <= "01100";

	--ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmp(LOGICAL,567)
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmp_a <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_mem_top_q;
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdmux_q);
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmp_q <= "1" when ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmp_a = ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmp_b else "0";

	--ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmpReg(REG,568)
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmpReg_q <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_sticky_ena(REG,571)
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_nor_q = "1") THEN
                ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_sticky_ena_q <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_enaAnd(LOGICAL,572)
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_enaAnd_a <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_sticky_ena_q;
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_enaAnd_b <= en;
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_enaAnd_q <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_enaAnd_a and ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_enaAnd_b;

	--ld_expXIsZero_uid23_fpCosPiTest_q_to_xIntOrXZOrCosOne_uid93_fpCosPiTest_b(DELAY,359)@0
    ld_expXIsZero_uid23_fpCosPiTest_q_to_xIntOrXZOrCosOne_uid93_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => expXIsZero_uid23_fpCosPiTest_q, xout => ld_expXIsZero_uid23_fpCosPiTest_q_to_xIntOrXZOrCosOne_uid93_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fxpXFracZero_uid45_fpCosPiTest(LOGICAL,44)@2
    fxpXFracZero_uid45_fpCosPiTest_a <= reg_fxpXFrac_uid43_fpCosPiTest_0_to_fxpXFracZero_uid45_fpCosPiTest_1_q;
    fxpXFracZero_uid45_fpCosPiTest_b <= STD_LOGIC_VECTOR("0" & cstZwSwF_uid15_fpCosPiTest_q);
    fxpXFracZero_uid45_fpCosPiTest_q <= "1" when fxpXFracZero_uid45_fpCosPiTest_a = fxpXFracZero_uid45_fpCosPiTest_b else "0";

	--fracZCosNotOne_uid78_fpCosPiTest(LOGICAL,77)@2
    fracZCosNotOne_uid78_fpCosPiTest_a <= fxpXFracZero_uid45_fpCosPiTest_q;
    fracZCosNotOne_uid78_fpCosPiTest_b <= InvCosXIsOne_uid77_fpCosPiTest_q;
    fracZCosNotOne_uid78_fpCosPiTest_q <= fracZCosNotOne_uid78_fpCosPiTest_a and fracZCosNotOne_uid78_fpCosPiTest_b;

	--evenIntCosNotOneFZ_uid79_fpCosPiTest(LOGICAL,78)@2
    evenIntCosNotOneFZ_uid79_fpCosPiTest_a <= ld_xEvenInt_uid35_fpCosPiTest_c_to_evenIntCosNotOneFZ_uid79_fpCosPiTest_a_q;
    evenIntCosNotOneFZ_uid79_fpCosPiTest_b <= fracZCosNotOne_uid78_fpCosPiTest_q;
    evenIntCosNotOneFZ_uid79_fpCosPiTest_q <= evenIntCosNotOneFZ_uid79_fpCosPiTest_a or evenIntCosNotOneFZ_uid79_fpCosPiTest_b;

	--xIsInt_uid80_fpCosPiTest(LOGICAL,79)@2
    xIsInt_uid80_fpCosPiTest_a <= ld_exc_R_uid34_fpCosPiTest_q_to_xIsInt_uid80_fpCosPiTest_a_q;
    xIsInt_uid80_fpCosPiTest_b <= evenIntCosNotOneFZ_uid79_fpCosPiTest_q;
    xIsInt_uid80_fpCosPiTest_q <= xIsInt_uid80_fpCosPiTest_a and xIsInt_uid80_fpCosPiTest_b;

	--xIntOrXZOrCosOne_uid93_fpCosPiTest(LOGICAL,92)@2
    xIntOrXZOrCosOne_uid93_fpCosPiTest_a <= xIsInt_uid80_fpCosPiTest_q;
    xIntOrXZOrCosOne_uid93_fpCosPiTest_b <= ld_expXIsZero_uid23_fpCosPiTest_q_to_xIntOrXZOrCosOne_uid93_fpCosPiTest_b_q;
    xIntOrXZOrCosOne_uid93_fpCosPiTest_c <= ld_cosXIsOne_uid36_fpCosPiTest_c_to_InvCosXIsOne_uid77_fpCosPiTest_a_q;
    xIntOrXZOrCosOne_uid93_fpCosPiTest_q <= xIntOrXZOrCosOne_uid93_fpCosPiTest_a or xIntOrXZOrCosOne_uid93_fpCosPiTest_b or xIntOrXZOrCosOne_uid93_fpCosPiTest_c;

	--excRNaN_uid84_fpCosPiTest(LOGICAL,83)@0
    excRNaN_uid84_fpCosPiTest_a <= exc_N_uid30_fpCosPiTest_q;
    excRNaN_uid84_fpCosPiTest_b <= exc_I_uid28_fpCosPiTest_q;
    excRNaN_uid84_fpCosPiTest_q <= excRNaN_uid84_fpCosPiTest_a or excRNaN_uid84_fpCosPiTest_b;

	--rInfOrNaN_uid92_fpCosPiTest(LOGICAL,91)@0
    rInfOrNaN_uid92_fpCosPiTest_a <= GND_q;
    rInfOrNaN_uid92_fpCosPiTest_b <= excRNaN_uid84_fpCosPiTest_q;
    rInfOrNaN_uid92_fpCosPiTest_q <= rInfOrNaN_uid92_fpCosPiTest_a or rInfOrNaN_uid92_fpCosPiTest_b;

	--ld_rInfOrNaN_uid92_fpCosPiTest_q_to_join_uid94_fpCosPiTest_a(DELAY,361)@0
    ld_rInfOrNaN_uid92_fpCosPiTest_q_to_join_uid94_fpCosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => rInfOrNaN_uid92_fpCosPiTest_q, xout => ld_rInfOrNaN_uid92_fpCosPiTest_q_to_join_uid94_fpCosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--join_uid94_fpCosPiTest(BITJOIN,93)@2
    join_uid94_fpCosPiTest_q <= xIntOrXZOrCosOne_uid93_fpCosPiTest_q & ld_rInfOrNaN_uid92_fpCosPiTest_q_to_join_uid94_fpCosPiTest_a_q;

	--reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1(REG,274)@2
    reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q <= join_uid94_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt(COUNTER,562)
    -- every=1, low=0, high=12, step=1, init=1
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_i = 11 THEN
                      ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_eq = '1') THEN
                        ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_i <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_i - 12;
                    ELSE
                        ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_i <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_i,4));


	--ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdreg(REG,563)
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdreg_q <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdmux(MUX,564)
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdmux_s <= en;
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdmux: PROCESS (ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdmux_s, ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdreg_q, ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdmux_q <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdmux_q <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem(DUALMEM,561)
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_reset0 <= areset;
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_ia <= reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q;
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_aa <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdreg_q;
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_ab <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_rdmux_q;
    ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 2,
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
        clocken1 => ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_iq,
        address_a => ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_aa,
        data_a => ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_ia
    );
        ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_q <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_iq(1 downto 0);

	--expRPostExc_uid95_fpCosPiTest(MUX,94)@17
    expRPostExc_uid95_fpCosPiTest_s <= ld_reg_join_uid94_fpCosPiTest_0_to_expRPostExc_uid95_fpCosPiTest_1_q_to_expRPostExc_uid95_fpCosPiTest_b_replace_mem_q;
    expRPostExc_uid95_fpCosPiTest: PROCESS (expRPostExc_uid95_fpCosPiTest_s, en, expRPostExc1_uid91_fpCosPiTest_q, cstAllOWE_uid8_fpCosPiTest_q, cstBias_uid10_fpCosPiTest_q, cstBias_uid10_fpCosPiTest_q)
    BEGIN
            CASE expRPostExc_uid95_fpCosPiTest_s IS
                  WHEN "00" => expRPostExc_uid95_fpCosPiTest_q <= expRPostExc1_uid91_fpCosPiTest_q;
                  WHEN "01" => expRPostExc_uid95_fpCosPiTest_q <= cstAllOWE_uid8_fpCosPiTest_q;
                  WHEN "10" => expRPostExc_uid95_fpCosPiTest_q <= cstBias_uid10_fpCosPiTest_q;
                  WHEN "11" => expRPostExc_uid95_fpCosPiTest_q <= cstBias_uid10_fpCosPiTest_q;
                  WHEN OTHERS => expRPostExc_uid95_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oneFracRPostExc2_uid87_fpCosPiTest(CONSTANT,86)
    oneFracRPostExc2_uid87_fpCosPiTest_q <= "00000000000000000000001";

	--fracRComp_uid75_fpCosPiTest(BITSELECT,74)@16
    fracRComp_uid75_fpCosPiTest_in <= expFracComp_uid74_fpCosPiTest_q(23 downto 0);
    fracRComp_uid75_fpCosPiTest_b <= fracRComp_uid75_fpCosPiTest_in(23 downto 1);

	--reg_xIsHalf_uid83_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_5(REG,243)@2
    reg_xIsHalf_uid83_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xIsHalf_uid83_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_5_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xIsHalf_uid83_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_5_q <= xIsHalf_uid83_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_expXIsZero_uid23_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_4(REG,242)@2
    reg_expXIsZero_uid23_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXIsZero_uid23_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXIsZero_uid23_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_4_q <= ld_expXIsZero_uid23_fpCosPiTest_q_to_xIntOrXZOrCosOne_uid93_fpCosPiTest_b_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_fxpXFracHalf_uid46_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_3(REG,241)@2
    reg_fxpXFracHalf_uid46_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpXFracHalf_uid46_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpXFracHalf_uid46_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_3_q <= fxpXFracHalf_uid46_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_xIsInt_uid80_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_2(REG,240)@2
    reg_xIsInt_uid80_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xIsInt_uid80_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xIsInt_uid80_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_2_q <= xIsInt_uid80_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_cosXIsOne_uid36_fpCosPiTest_1_to_bigCond_uid85_fpCosPiTest_1(REG,239)@0
    reg_cosXIsOne_uid36_fpCosPiTest_1_to_bigCond_uid85_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cosXIsOne_uid36_fpCosPiTest_1_to_bigCond_uid85_fpCosPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cosXIsOne_uid36_fpCosPiTest_1_to_bigCond_uid85_fpCosPiTest_1_q <= cosXIsOne_uid36_fpCosPiTest_c;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_cosXIsOne_uid36_fpCosPiTest_1_to_bigCond_uid85_fpCosPiTest_1_q_to_bigCond_uid85_fpCosPiTest_a(DELAY,346)@1
    ld_reg_cosXIsOne_uid36_fpCosPiTest_1_to_bigCond_uid85_fpCosPiTest_1_q_to_bigCond_uid85_fpCosPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => reg_cosXIsOne_uid36_fpCosPiTest_1_to_bigCond_uid85_fpCosPiTest_1_q, xout => ld_reg_cosXIsOne_uid36_fpCosPiTest_1_to_bigCond_uid85_fpCosPiTest_1_q_to_bigCond_uid85_fpCosPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--bigCond_uid85_fpCosPiTest(LOGICAL,84)@3
    bigCond_uid85_fpCosPiTest_a <= ld_reg_cosXIsOne_uid36_fpCosPiTest_1_to_bigCond_uid85_fpCosPiTest_1_q_to_bigCond_uid85_fpCosPiTest_a_q;
    bigCond_uid85_fpCosPiTest_b <= reg_xIsInt_uid80_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_2_q;
    bigCond_uid85_fpCosPiTest_c <= reg_fxpXFracHalf_uid46_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_3_q;
    bigCond_uid85_fpCosPiTest_d <= reg_expXIsZero_uid23_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_4_q;
    bigCond_uid85_fpCosPiTest_f <= reg_xIsHalf_uid83_fpCosPiTest_0_to_bigCond_uid85_fpCosPiTest_5_q;
    bigCond_uid85_fpCosPiTest_g <= GND_q;
    bigCond_uid85_fpCosPiTest_q <= bigCond_uid85_fpCosPiTest_a or bigCond_uid85_fpCosPiTest_b or bigCond_uid85_fpCosPiTest_c or bigCond_uid85_fpCosPiTest_d or bigCond_uid85_fpCosPiTest_f or bigCond_uid85_fpCosPiTest_g;

	--ld_bigCond_uid85_fpCosPiTest_q_to_fracRPostExc1_uid86_fpCosPiTest_b(DELAY,351)@3
    ld_bigCond_uid85_fpCosPiTest_q_to_fracRPostExc1_uid86_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => bigCond_uid85_fpCosPiTest_q, xout => ld_bigCond_uid85_fpCosPiTest_q_to_fracRPostExc1_uid86_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc1_uid86_fpCosPiTest(MUX,85)@16
    fracRPostExc1_uid86_fpCosPiTest_s <= ld_bigCond_uid85_fpCosPiTest_q_to_fracRPostExc1_uid86_fpCosPiTest_b_q;
    fracRPostExc1_uid86_fpCosPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostExc1_uid86_fpCosPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE fracRPostExc1_uid86_fpCosPiTest_s IS
                      WHEN "0" => fracRPostExc1_uid86_fpCosPiTest_q <= fracRComp_uid75_fpCosPiTest_b;
                      WHEN "1" => fracRPostExc1_uid86_fpCosPiTest_q <= cstAllZWF_uid9_fpCosPiTest_q;
                      WHEN OTHERS => fracRPostExc1_uid86_fpCosPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--reg_excRNaN_uid84_fpCosPiTest_0_to_fracRPostExc_uid88_fpCosPiTest_1(REG,273)@0
    reg_excRNaN_uid84_fpCosPiTest_0_to_fracRPostExc_uid88_fpCosPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excRNaN_uid84_fpCosPiTest_0_to_fracRPostExc_uid88_fpCosPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excRNaN_uid84_fpCosPiTest_0_to_fracRPostExc_uid88_fpCosPiTest_1_q <= excRNaN_uid84_fpCosPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_excRNaN_uid84_fpCosPiTest_0_to_fracRPostExc_uid88_fpCosPiTest_1_q_to_fracRPostExc_uid88_fpCosPiTest_b(DELAY,353)@1
    ld_reg_excRNaN_uid84_fpCosPiTest_0_to_fracRPostExc_uid88_fpCosPiTest_1_q_to_fracRPostExc_uid88_fpCosPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => reg_excRNaN_uid84_fpCosPiTest_0_to_fracRPostExc_uid88_fpCosPiTest_1_q, xout => ld_reg_excRNaN_uid84_fpCosPiTest_0_to_fracRPostExc_uid88_fpCosPiTest_1_q_to_fracRPostExc_uid88_fpCosPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid88_fpCosPiTest(MUX,87)@17
    fracRPostExc_uid88_fpCosPiTest_s <= ld_reg_excRNaN_uid84_fpCosPiTest_0_to_fracRPostExc_uid88_fpCosPiTest_1_q_to_fracRPostExc_uid88_fpCosPiTest_b_q;
    fracRPostExc_uid88_fpCosPiTest: PROCESS (fracRPostExc_uid88_fpCosPiTest_s, en, fracRPostExc1_uid86_fpCosPiTest_q, oneFracRPostExc2_uid87_fpCosPiTest_q)
    BEGIN
            CASE fracRPostExc_uid88_fpCosPiTest_s IS
                  WHEN "0" => fracRPostExc_uid88_fpCosPiTest_q <= fracRPostExc1_uid86_fpCosPiTest_q;
                  WHEN "1" => fracRPostExc_uid88_fpCosPiTest_q <= oneFracRPostExc2_uid87_fpCosPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid88_fpCosPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid102_fpCosPiTest(BITJOIN,101)@17
    R_uid102_fpCosPiTest_q <= ld_signR_uid101_fpCosPiTest_q_to_R_uid102_fpCosPiTest_c_q & expRPostExc_uid95_fpCosPiTest_q & fracRPostExc_uid88_fpCosPiTest_q;

	--xOut(GPOUT,4)@17
    q <= R_uid102_fpCosPiTest_q;


end normal;
