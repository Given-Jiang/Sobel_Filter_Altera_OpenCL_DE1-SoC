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

-- VHDL created from fp_hypot_s5
-- VHDL created on Tue Mar 12 11:24:00 2013


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

entity fp_hypot_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        b : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_hypot_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid10_fpHypotTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid11_fpHypotTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid12_fpHypotTest_q : std_logic_vector (7 downto 0);
    signal oFracXSqr_uid45_fpHypotTest_a : std_logic_vector (23 downto 0);
    signal oFracXSqr_uid45_fpHypotTest_b : std_logic_vector (23 downto 0);
    signal oFracXSqr_uid45_fpHypotTest_s1 : std_logic_vector (47 downto 0);
    signal oFracXSqr_uid45_fpHypotTest_pr : UNSIGNED (47 downto 0);
    signal oFracXSqr_uid45_fpHypotTest_q : std_logic_vector (47 downto 0);
    signal oFracYSqr_uid46_fpHypotTest_a : std_logic_vector (23 downto 0);
    signal oFracYSqr_uid46_fpHypotTest_b : std_logic_vector (23 downto 0);
    signal oFracYSqr_uid46_fpHypotTest_s1 : std_logic_vector (47 downto 0);
    signal oFracYSqr_uid46_fpHypotTest_pr : UNSIGNED (47 downto 0);
    signal oFracYSqr_uid46_fpHypotTest_q : std_logic_vector (47 downto 0);
    signal bias_uid47_fpHypotTest_q : std_logic_vector (6 downto 0);
    signal cWFP2_uid66_fpHypotTest_q : std_logic_vector (4 downto 0);
    signal oFracA_uid68_fpHypotTest_s : std_logic_vector (0 downto 0);
    signal oFracA_uid68_fpHypotTest_q : std_logic_vector (23 downto 0);
    signal z_uid71_fpHypotTest_q : std_logic_vector (4 downto 0);
    signal excAZero_uid74_fpHypotTest_s : std_logic_vector (0 downto 0);
    signal excAZero_uid74_fpHypotTest_q : std_logic_vector (0 downto 0);
    signal excBZero_uid75_fpHypotTest_s : std_logic_vector (0 downto 0);
    signal excBZero_uid75_fpHypotTest_q : std_logic_vector (0 downto 0);
    signal zerosWFp1_uid77_fpHypotTest_q : std_logic_vector (23 downto 0);
    signal oFracAPostExc_uid79_fpHypotTest_s : std_logic_vector (0 downto 0);
    signal oFracAPostExc_uid79_fpHypotTest_q : std_logic_vector (23 downto 0);
    signal biasP1Signal_uid99_fpHypotTest_q : std_logic_vector (6 downto 0);
    signal expRMux_uid104_fpHypotTest_s : std_logic_vector (0 downto 0);
    signal expRMux_uid104_fpHypotTest_q : std_logic_vector (9 downto 0);
    signal xRegOrZero_uid121_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal xRegOrZero_uid121_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal xRegOrZero_uid121_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal yRegOrZero_uid123_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal yRegOrZero_uid123_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal yRegOrZero_uid123_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal NaNFracRPostExc_uid133_fpHypotTest_q : std_logic_vector (22 downto 0);
    signal rightShiftStage0Idx2Pad16_uid149_alignShift_uid81_fpHypotTest_q : std_logic_vector (15 downto 0);
    signal rightShiftStage1Idx1Pad2_uid157_alignShift_uid81_fpHypotTest_q : std_logic_vector (1 downto 0);
    signal rightShiftStage1Idx2Pad4_uid160_alignShift_uid81_fpHypotTest_q : std_logic_vector (3 downto 0);
    signal rightShiftStage1Idx3Pad6_uid163_alignShift_uid81_fpHypotTest_q : std_logic_vector (5 downto 0);
    signal prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_a : std_logic_vector (11 downto 0);
    signal prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_pr : SIGNED (24 downto 0);
    signal prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_q : std_logic_vector (23 downto 0);
    signal prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a : std_logic_vector (15 downto 0);
    signal prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_b : std_logic_vector (22 downto 0);
    signal prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_pr : SIGNED (39 downto 0);
    signal prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_q : std_logic_vector (38 downto 0);
    signal memoryC0_uid173_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC0_uid173_sqrtTableGenerator_lutmem_ia : std_logic_vector (28 downto 0);
    signal memoryC0_uid173_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid173_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid173_sqrtTableGenerator_lutmem_iq : std_logic_vector (28 downto 0);
    signal memoryC0_uid173_sqrtTableGenerator_lutmem_q : std_logic_vector (28 downto 0);
    signal memoryC1_uid174_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC1_uid174_sqrtTableGenerator_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid174_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid174_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid174_sqrtTableGenerator_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid174_sqrtTableGenerator_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid175_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC2_uid175_sqrtTableGenerator_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid175_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid175_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid175_sqrtTableGenerator_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid175_sqrtTableGenerator_lutmem_q : std_logic_vector (11 downto 0);
    signal reg_oFracX_uid43_uid43_fpHypotTest_0_to_oFracXSqr_uid45_fpHypotTest_0_q : std_logic_vector (23 downto 0);
    signal reg_oFracY_uid44_uid44_fpHypotTest_0_to_oFracYSqr_uid46_fpHypotTest_0_q : std_logic_vector (23 downto 0);
    signal reg_expP_uid52_fpHypotTest_0_to_pGTEq_uid60_fpHypotTest_0_q : std_logic_vector (9 downto 0);
    signal reg_expQ_uid53_fpHypotTest_0_to_expDiffQP_uid63_fpHypotTest_0_q : std_logic_vector (9 downto 0);
    signal reg_expDiff_uid65_fpHypotTest_0_to_shiftedOut_uid67_fpHypotTest_0_q : std_logic_vector (9 downto 0);
    signal reg_expDiffShiftRange_uid72_fpHypotTest_0_to_shiftValue_uid73_fpHypotTest_2_q : std_logic_vector (4 downto 0);
    signal reg_rightShiftStageSel4Dto3_uid154_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_1_q : std_logic_vector (1 downto 0);
    signal reg_oFracBPostExcG_uid80_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_2_q : std_logic_vector (24 downto 0);
    signal reg_rightShiftStage0Idx1_uid147_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_3_q : std_logic_vector (24 downto 0);
    signal reg_rightShiftStage0Idx2_uid150_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_4_q : std_logic_vector (24 downto 0);
    signal reg_rightShiftStage0Idx3_uid153_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_5_q : std_logic_vector (24 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_2_q : std_logic_vector (24 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_0_to_rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_1_q : std_logic_vector (0 downto 0);
    signal reg_highBBits_uid83_fpHypotTest_0_to_sumAHighB_uid84_fpHypotTest_1_q : std_logic_vector (23 downto 0);
    signal reg_lowRangeB_uid82_fpHypotTest_0_to_soSPreNorm_uid82_uid85_fpHypotTest_0_q : std_logic_vector (0 downto 0);
    signal reg_expCatRndBit_uid91_uid92_fpHypotTest_0_to_expFracPostNorm_uid94_fpHypotTest_0_q : std_logic_vector (33 downto 0);
    signal reg_normCatFracSoS_uid93_uid93_fpHypotTest_0_to_expFracPostNorm_uid94_fpHypotTest_1_q : std_logic_vector (24 downto 0);
    signal reg_expRPreSqrt_uid96_fpHypotTest_0_to_expSumOfSquaresUnbiased_uid97_fpHypotTest_0_q : std_logic_vector (9 downto 0);
    signal reg_addrTable_uid107_fpHypotTest_0_to_memoryC2_uid175_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid176_sqrtPolynomialEvaluator_0_to_prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid175_sqrtTableGenerator_lutmem_0_to_prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_1_q : std_logic_vector (11 downto 0);
    signal reg_addrTable_uid107_fpHypotTest_0_to_memoryC1_uid174_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC1_uid174_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid180_sqrtPolynomialEvaluator_0_q : std_logic_vector (20 downto 0);
    signal reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q : std_logic_vector (15 downto 0);
    signal reg_s1_uid178_uid181_sqrtPolynomialEvaluator_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_1_q : std_logic_vector (22 downto 0);
    signal reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC0_uid173_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid186_sqrtPolynomialEvaluator_0_q : std_logic_vector (28 downto 0);
    signal reg_fracRPreInc_uid110_fpHypotTest_0_to_fracRPostInc_uid111_fpHypotTest_0_q : std_logic_vector (24 downto 0);
    signal reg_fracRPostIncMSBU_uid113_fpHypotTest_0_to_expRPostInc_uid114_fpHypotTest_1_q : std_logic_vector (0 downto 0);
    signal reg_expRPostInc_uid114_fpHypotTest_0_to_sqrtUnderflow_uid115_fpHypotTest_1_q : std_logic_vector (10 downto 0);
    signal reg_excSelBits_uid131_fpHypotTest_0_to_outMuxSelEnc_uid132_fpHypotTest_0_q : std_logic_vector (2 downto 0);
    signal ld_expX_uid6_fpHypotTest_b_to_expXTimes2_uid50_fpHypotTest_b_q : std_logic_vector (7 downto 0);
    signal ld_expY_uid7_fpHypotTest_b_to_expYTimes2_uid51_fpHypotTest_b_q : std_logic_vector (7 downto 0);
    signal ld_expQ_uid53_fpHypotTest_q_to_pGTEq_uid60_fpHypotTest_b_q : std_logic_vector (9 downto 0);
    signal ld_expXIsZero_uid30_fpHypotTest_q_to_expCmpGtePQ_uid61_fpHypotTest_b_q : std_logic_vector (0 downto 0);
    signal ld_expP_uid52_fpHypotTest_q_to_expDiffQP_uid63_fpHypotTest_b_q : std_logic_vector (9 downto 0);
    signal ld_ofracQ_uid59_fpHypotTest_q_to_oFracA_uid68_fpHypotTest_c_q : std_logic_vector (23 downto 0);
    signal ld_ofracP_uid56_fpHypotTest_q_to_oFracA_uid68_fpHypotTest_d_q : std_logic_vector (23 downto 0);
    signal ld_expXIsZero_uid14_fpHypotTest_q_to_excAZero_uid74_fpHypotTest_d_q : std_logic_vector (0 downto 0);
    signal ld_oFracB_uid69_fpHypotTest_q_to_oFracBPostExc_uid78_fpHypotTest_c_q : std_logic_vector (23 downto 0);
    signal ld_oFracAPostExc_uid79_fpHypotTest_q_to_sumAHighB_uid84_fpHypotTest_a_q : std_logic_vector (23 downto 0);
    signal ld_expOddSelect_uid103_fpHypotTest_q_to_expRMux_uid104_fpHypotTest_b_q : std_logic_vector (0 downto 0);
    signal ld_fracRPreSqrt_uid95_fpHypotTest_b_to_FracRPreSqrt15dto0_uid108_fpHypotTest_a_q : std_logic_vector (22 downto 0);
    signal ld_fracR_uid112_fpHypotTest_b_to_fracRPostExc_uid136_fpHypotTest_d_q : std_logic_vector (22 downto 0);
    signal ld_expRPreExc_uid139_fpHypotTest_b_to_expRPostExc_uid141_fpHypotTest_d_q : std_logic_vector (7 downto 0);
    signal ld_RightShiftStage024dto2_uid156_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx1_uid158_alignShift_uid81_fpHypotTest_a_q : std_logic_vector (22 downto 0);
    signal ld_RightShiftStage024dto4_uid159_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx2_uid161_alignShift_uid81_fpHypotTest_a_q : std_logic_vector (20 downto 0);
    signal ld_RightShiftStage024dto6_uid162_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx3_uid164_alignShift_uid81_fpHypotTest_a_q : std_logic_vector (18 downto 0);
    signal ld_reg_rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_1_q_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_b_q : std_logic_vector (1 downto 0);
    signal ld_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_b_to_reg_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_0_to_rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_1_a_q : std_logic_vector (0 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC1_uid174_sqrtTableGenerator_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpHypotTest_b_to_expXTimes2_uid50_fpHypotTest_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expY_uid7_fpHypotTest_b_to_expYTimes2_uid51_fpHypotTest_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_inputreg_q : std_logic_vector (9 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_reset0 : std_logic;
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_ia : std_logic_vector (9 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_iq : std_logic_vector (9 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_q : std_logic_vector (9 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_sticky_ena_q : signal is true;
    signal ld_fracRPreSqrt_uid95_fpHypotTest_b_to_FracRPreSqrt15dto0_uid108_fpHypotTest_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_inputreg_q : std_logic_vector (9 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_reset0 : std_logic;
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_ia : std_logic_vector (9 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_iq : std_logic_vector (9 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_q : std_logic_vector (9 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_eq : std_logic;
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_sticky_ena_q : signal is true;
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_reset0 : std_logic;
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_eq : std_logic;
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_sticky_ena_q : signal is true;
    signal ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_reset0 : std_logic;
    signal ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_sticky_ena_q : signal is true;
    signal ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_reset0 : std_logic;
    signal ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_sticky_ena_q : signal is true;
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_reset0 : std_logic;
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_eq : std_logic;
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_sticky_ena_q : signal is true;
    signal ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_reset0 : std_logic;
    signal ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_sticky_ena_q : signal is true;
    signal ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_reset0 : std_logic;
    signal ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_sticky_ena_q : signal is true;
    signal ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_reset0 : std_logic;
    signal ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_sticky_ena_q : signal is true;
    signal ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_reset0 : std_logic;
    signal ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_sticky_ena_q : signal is true;
    signal ld_fracR_uid112_fpHypotTest_b_to_fracRPostExc_uid136_fpHypotTest_d_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_inputreg_q : std_logic_vector (15 downto 0);
    signal ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_reset0 : std_logic;
    signal ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_ia : std_logic_vector (15 downto 0);
    signal ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_iq : std_logic_vector (15 downto 0);
    signal ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_q : std_logic_vector (15 downto 0);
    signal ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_sticky_ena_q : signal is true;
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq : std_logic;
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_sticky_ena_q : signal is true;
    signal pGTEq_uid60_fpHypotTest_a : std_logic_vector(12 downto 0);
    signal pGTEq_uid60_fpHypotTest_b : std_logic_vector(12 downto 0);
    signal pGTEq_uid60_fpHypotTest_o : std_logic_vector (12 downto 0);
    signal pGTEq_uid60_fpHypotTest_cin : std_logic_vector (0 downto 0);
    signal pGTEq_uid60_fpHypotTest_n : std_logic_vector (0 downto 0);
    signal shiftedOut_uid67_fpHypotTest_a : std_logic_vector(12 downto 0);
    signal shiftedOut_uid67_fpHypotTest_b : std_logic_vector(12 downto 0);
    signal shiftedOut_uid67_fpHypotTest_o : std_logic_vector (12 downto 0);
    signal shiftedOut_uid67_fpHypotTest_cin : std_logic_vector (0 downto 0);
    signal shiftedOut_uid67_fpHypotTest_n : std_logic_vector (0 downto 0);
    signal sqrtUnderflow_uid115_fpHypotTest_a : std_logic_vector(13 downto 0);
    signal sqrtUnderflow_uid115_fpHypotTest_b : std_logic_vector(13 downto 0);
    signal sqrtUnderflow_uid115_fpHypotTest_o : std_logic_vector (13 downto 0);
    signal sqrtUnderflow_uid115_fpHypotTest_cin : std_logic_vector (0 downto 0);
    signal sqrtUnderflow_uid115_fpHypotTest_n : std_logic_vector (0 downto 0);
    signal sqrtOverflow_uid117_fpHypotTest_a : std_logic_vector(13 downto 0);
    signal sqrtOverflow_uid117_fpHypotTest_b : std_logic_vector(13 downto 0);
    signal sqrtOverflow_uid117_fpHypotTest_o : std_logic_vector (13 downto 0);
    signal sqrtOverflow_uid117_fpHypotTest_cin : std_logic_vector (0 downto 0);
    signal sqrtOverflow_uid117_fpHypotTest_n : std_logic_vector (0 downto 0);
    signal fracRPostInc_uid111_fpHypotTest_a : std_logic_vector(25 downto 0);
    signal fracRPostInc_uid111_fpHypotTest_b : std_logic_vector(25 downto 0);
    signal fracRPostInc_uid111_fpHypotTest_o : std_logic_vector (25 downto 0);
    signal fracRPostInc_uid111_fpHypotTest_q : std_logic_vector (25 downto 0);
    signal expCatRndBit_uid91_uid92_fpHypotTest_q : std_logic_vector (33 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal expX_uid6_fpHypotTest_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpHypotTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid8_fpHypotTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid8_fpHypotTest_b : std_logic_vector (22 downto 0);
    signal expY_uid7_fpHypotTest_in : std_logic_vector (30 downto 0);
    signal expY_uid7_fpHypotTest_b : std_logic_vector (7 downto 0);
    signal fracY_uid9_fpHypotTest_in : std_logic_vector (22 downto 0);
    signal fracY_uid9_fpHypotTest_b : std_logic_vector (22 downto 0);
    signal expXIsZero_uid14_fpHypotTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid14_fpHypotTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid14_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid16_fpHypotTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid16_fpHypotTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid16_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid18_fpHypotTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid18_fpHypotTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid18_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid19_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid19_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid19_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid30_fpHypotTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid30_fpHypotTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid30_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid32_fpHypotTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid32_fpHypotTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid32_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid34_fpHypotTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid34_fpHypotTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid34_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid35_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid35_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid35_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal expCmpGtePQ_uid61_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal expCmpGtePQ_uid61_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal expCmpGtePQ_uid61_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal expDiffPQ_uid62_fpHypotTest_a : std_logic_vector(10 downto 0);
    signal expDiffPQ_uid62_fpHypotTest_b : std_logic_vector(10 downto 0);
    signal expDiffPQ_uid62_fpHypotTest_o : std_logic_vector (10 downto 0);
    signal expDiffPQ_uid62_fpHypotTest_q : std_logic_vector (10 downto 0);
    signal expDiffQP_uid63_fpHypotTest_a : std_logic_vector(10 downto 0);
    signal expDiffQP_uid63_fpHypotTest_b : std_logic_vector(10 downto 0);
    signal expDiffQP_uid63_fpHypotTest_o : std_logic_vector (10 downto 0);
    signal expDiffQP_uid63_fpHypotTest_q : std_logic_vector (10 downto 0);
    signal mux_uid64_fpHypotTest_s : std_logic_vector (0 downto 0);
    signal mux_uid64_fpHypotTest_q : std_logic_vector (10 downto 0);
    signal oFracB_uid69_fpHypotTest_s : std_logic_vector (0 downto 0);
    signal oFracB_uid69_fpHypotTest_q : std_logic_vector (23 downto 0);
    signal expA_uid70_fpHypotTest_s : std_logic_vector (0 downto 0);
    signal expA_uid70_fpHypotTest_q : std_logic_vector (9 downto 0);
    signal shiftValue_uid73_fpHypotTest_s : std_logic_vector (0 downto 0);
    signal shiftValue_uid73_fpHypotTest_q : std_logic_vector (4 downto 0);
    signal oFracBFlushToZero_uid76_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal oFracBFlushToZero_uid76_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal oFracBFlushToZero_uid76_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal oFracBPostExc_uid78_fpHypotTest_s : std_logic_vector (0 downto 0);
    signal oFracBPostExc_uid78_fpHypotTest_q : std_logic_vector (23 downto 0);
    signal sumAHighB_uid84_fpHypotTest_a : std_logic_vector(24 downto 0);
    signal sumAHighB_uid84_fpHypotTest_b : std_logic_vector(24 downto 0);
    signal sumAHighB_uid84_fpHypotTest_o : std_logic_vector (24 downto 0);
    signal sumAHighB_uid84_fpHypotTest_q : std_logic_vector (24 downto 0);
    signal expFracPostNorm_uid94_fpHypotTest_a : std_logic_vector(35 downto 0);
    signal expFracPostNorm_uid94_fpHypotTest_b : std_logic_vector(35 downto 0);
    signal expFracPostNorm_uid94_fpHypotTest_o : std_logic_vector (35 downto 0);
    signal expFracPostNorm_uid94_fpHypotTest_q : std_logic_vector (34 downto 0);
    signal expSumOfSquaresUnbiased_uid97_fpHypotTest_a : std_logic_vector(11 downto 0);
    signal expSumOfSquaresUnbiased_uid97_fpHypotTest_b : std_logic_vector(11 downto 0);
    signal expSumOfSquaresUnbiased_uid97_fpHypotTest_o : std_logic_vector (11 downto 0);
    signal expSumOfSquaresUnbiased_uid97_fpHypotTest_q : std_logic_vector (10 downto 0);
    signal expOddSig_uid100_fpHypotTest_a : std_logic_vector(11 downto 0);
    signal expOddSig_uid100_fpHypotTest_b : std_logic_vector(11 downto 0);
    signal expOddSig_uid100_fpHypotTest_o : std_logic_vector (11 downto 0);
    signal expOddSig_uid100_fpHypotTest_q : std_logic_vector (10 downto 0);
    signal expRPostInc_uid114_fpHypotTest_a : std_logic_vector(11 downto 0);
    signal expRPostInc_uid114_fpHypotTest_b : std_logic_vector(11 downto 0);
    signal expRPostInc_uid114_fpHypotTest_o : std_logic_vector (11 downto 0);
    signal expRPostInc_uid114_fpHypotTest_q : std_logic_vector (10 downto 0);
    signal excXYZ_uid118_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal excXYZ_uid118_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal excXYZ_uid118_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal excXYRUdf_uid119_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal excXYRUdf_uid119_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal excXYRUdf_uid119_fpHypotTest_c : std_logic_vector(0 downto 0);
    signal excXYRUdf_uid119_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal excRZero_uid120_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid120_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid120_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal xRegOrZeroYRegOvf_uid122_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal xRegOrZeroYRegOvf_uid122_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal xRegOrZeroYRegOvf_uid122_fpHypotTest_c : std_logic_vector(0 downto 0);
    signal xRegOrZeroYRegOvf_uid122_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal yRegOrZeroXRegOvf_uid124_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal yRegOrZeroXRegOvf_uid124_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal yRegOrZeroXRegOvf_uid124_fpHypotTest_c : std_logic_vector(0 downto 0);
    signal yRegOrZeroXRegOvf_uid124_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal excRInf_uid125_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal excRInf_uid125_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal excRInf_uid125_fpHypotTest_c : std_logic_vector(0 downto 0);
    signal excRInf_uid125_fpHypotTest_d : std_logic_vector(0 downto 0);
    signal excRInf_uid125_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal outMuxSelEnc_uid132_fpHypotTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid136_fpHypotTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid136_fpHypotTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid141_fpHypotTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid141_fpHypotTest_q : std_logic_vector (7 downto 0);
    signal rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_q : std_logic_vector (24 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal normBitXSqr_uid48_fpHypotTest_in : std_logic_vector (47 downto 0);
    signal normBitXSqr_uid48_fpHypotTest_b : std_logic_vector (0 downto 0);
    signal normFracXSqrHigh_uid54_fpHypotTest_in : std_logic_vector (47 downto 0);
    signal normFracXSqrHigh_uid54_fpHypotTest_b : std_logic_vector (23 downto 0);
    signal normFracXSqrLow_uid55_fpHypotTest_in : std_logic_vector (46 downto 0);
    signal normFracXSqrLow_uid55_fpHypotTest_b : std_logic_vector (23 downto 0);
    signal normBitYSqr_uid49_fpHypotTest_in : std_logic_vector (47 downto 0);
    signal normBitYSqr_uid49_fpHypotTest_b : std_logic_vector (0 downto 0);
    signal normFracYSqrHigh_uid57_fpHypotTest_in : std_logic_vector (47 downto 0);
    signal normFracYSqrHigh_uid57_fpHypotTest_b : std_logic_vector (23 downto 0);
    signal normFracYSqrLow_uid58_fpHypotTest_in : std_logic_vector (46 downto 0);
    signal normFracYSqrLow_uid58_fpHypotTest_b : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx1_uid158_alignShift_uid81_fpHypotTest_q : std_logic_vector (24 downto 0);
    signal rightShiftStage1Idx2_uid161_alignShift_uid81_fpHypotTest_q : std_logic_vector (24 downto 0);
    signal rightShiftStage1Idx3_uid164_alignShift_uid81_fpHypotTest_q : std_logic_vector (24 downto 0);
    signal prodXYTruncFR_uid190_pT1_uid177_sqrtPolynomialEvaluator_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid190_pT1_uid177_sqrtPolynomialEvaluator_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid193_pT2_uid183_sqrtPolynomialEvaluator_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid193_pT2_uid183_sqrtPolynomialEvaluator_b : std_logic_vector (23 downto 0);
    signal rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_q : std_logic_vector (24 downto 0);
    signal soSPreNorm_uid82_uid85_fpHypotTest_q : std_logic_vector (25 downto 0);
    signal expXTimes2_uid50_fpHypotTest_q : std_logic_vector (8 downto 0);
    signal expYTimes2_uid51_fpHypotTest_q : std_logic_vector (8 downto 0);
    signal FracRPreSqrt15dto0_uid108_fpHypotTest_in : std_logic_vector (15 downto 0);
    signal FracRPreSqrt15dto0_uid108_fpHypotTest_b : std_logic_vector (15 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_nor_q : std_logic_vector(0 downto 0);
    signal excSelBits_uid131_fpHypotTest_q : std_logic_vector (2 downto 0);
    signal ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal fracR_uid112_fpHypotTest_in : std_logic_vector (23 downto 0);
    signal fracR_uid112_fpHypotTest_b : std_logic_vector (22 downto 0);
    signal fracRPostIncMSBU_uid113_fpHypotTest_in : std_logic_vector (25 downto 0);
    signal fracRPostIncMSBU_uid113_fpHypotTest_b : std_logic_vector (0 downto 0);
    signal oFracX_uid43_uid43_fpHypotTest_q : std_logic_vector (23 downto 0);
    signal oFracY_uid44_uid44_fpHypotTest_q : std_logic_vector (23 downto 0);
    signal InvExpXIsZero_uid24_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid24_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid20_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid20_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid23_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid23_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid40_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid40_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid36_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid36_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid39_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid39_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal expDiff_uid65_fpHypotTest_in : std_logic_vector (9 downto 0);
    signal expDiff_uid65_fpHypotTest_b : std_logic_vector (9 downto 0);
    signal rightShiftStageSel4Dto3_uid154_alignShift_uid81_fpHypotTest_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid154_alignShift_uid81_fpHypotTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_b : std_logic_vector (0 downto 0);
    signal oFracBPostExcG_uid80_fpHypotTest_q : std_logic_vector (24 downto 0);
    signal fracRPreSqrt_uid95_fpHypotTest_in : std_logic_vector (23 downto 0);
    signal fracRPreSqrt_uid95_fpHypotTest_b : std_logic_vector (22 downto 0);
    signal expRPreSqrt_uid96_fpHypotTest_in : std_logic_vector (33 downto 0);
    signal expRPreSqrt_uid96_fpHypotTest_b : std_logic_vector (9 downto 0);
    signal expREven_uid98_fpHypotTest_in : std_logic_vector (10 downto 0);
    signal expREven_uid98_fpHypotTest_b : std_logic_vector (9 downto 0);
    signal expROdd_uid101_fpHypotTest_in : std_logic_vector (10 downto 0);
    signal expROdd_uid101_fpHypotTest_b : std_logic_vector (9 downto 0);
    signal expRPreExc_uid139_fpHypotTest_in : std_logic_vector (7 downto 0);
    signal expRPreExc_uid139_fpHypotTest_b : std_logic_vector (7 downto 0);
    signal RHypot_uid142_fpHypotTest_q : std_logic_vector (31 downto 0);
    signal RightShiftStage024dto2_uid156_alignShift_uid81_fpHypotTest_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto2_uid156_alignShift_uid81_fpHypotTest_b : std_logic_vector (22 downto 0);
    signal RightShiftStage024dto4_uid159_alignShift_uid81_fpHypotTest_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto4_uid159_alignShift_uid81_fpHypotTest_b : std_logic_vector (20 downto 0);
    signal RightShiftStage024dto6_uid162_alignShift_uid81_fpHypotTest_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto6_uid162_alignShift_uid81_fpHypotTest_b : std_logic_vector (18 downto 0);
    signal ofracP_uid56_fpHypotTest_s : std_logic_vector (0 downto 0);
    signal ofracP_uid56_fpHypotTest_q : std_logic_vector (23 downto 0);
    signal ofracQ_uid59_fpHypotTest_s : std_logic_vector (0 downto 0);
    signal ofracQ_uid59_fpHypotTest_q : std_logic_vector (23 downto 0);
    signal lowRangeB_uid178_sqrtPolynomialEvaluator_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid178_sqrtPolynomialEvaluator_b : std_logic_vector (0 downto 0);
    signal highBBits_uid179_sqrtPolynomialEvaluator_in : std_logic_vector (12 downto 0);
    signal highBBits_uid179_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid184_sqrtPolynomialEvaluator_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid184_sqrtPolynomialEvaluator_b : std_logic_vector (1 downto 0);
    signal highBBits_uid185_sqrtPolynomialEvaluator_in : std_logic_vector (23 downto 0);
    signal highBBits_uid185_sqrtPolynomialEvaluator_b : std_logic_vector (21 downto 0);
    signal RightShiftStage124dto1_uid167_alignShift_uid81_fpHypotTest_in : std_logic_vector (24 downto 0);
    signal RightShiftStage124dto1_uid167_alignShift_uid81_fpHypotTest_b : std_logic_vector (23 downto 0);
    signal FullSumAB25_uid86_fpHypotTest_in : std_logic_vector (25 downto 0);
    signal FullSumAB25_uid86_fpHypotTest_b : std_logic_vector (0 downto 0);
    signal soSRangeHigh_uid87_fpHypotTest_in : std_logic_vector (24 downto 0);
    signal soSRangeHigh_uid87_fpHypotTest_b : std_logic_vector (23 downto 0);
    signal soSRangeLow_uid88_fpHypotTest_in : std_logic_vector (23 downto 0);
    signal soSRangeLow_uid88_fpHypotTest_b : std_logic_vector (23 downto 0);
    signal expP_uid52_fpHypotTest_a : std_logic_vector(9 downto 0);
    signal expP_uid52_fpHypotTest_b : std_logic_vector(9 downto 0);
    signal expP_uid52_fpHypotTest_o : std_logic_vector (9 downto 0);
    signal expP_uid52_fpHypotTest_q : std_logic_vector (9 downto 0);
    signal expQ_uid53_fpHypotTest_a : std_logic_vector(9 downto 0);
    signal expQ_uid53_fpHypotTest_b : std_logic_vector(9 downto 0);
    signal expQ_uid53_fpHypotTest_o : std_logic_vector (9 downto 0);
    signal expQ_uid53_fpHypotTest_q : std_logic_vector (9 downto 0);
    signal yT1_uid176_sqrtPolynomialEvaluator_in : std_logic_vector (15 downto 0);
    signal yT1_uid176_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal exc_N_uid21_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid21_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid21_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid37_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid37_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid37_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal xNaNyNonInf_uid129_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal xNaNyNonInf_uid129_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal xNaNyNonInf_uid129_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal expDiffShiftRange_uid72_fpHypotTest_in : std_logic_vector (4 downto 0);
    signal expDiffShiftRange_uid72_fpHypotTest_b : std_logic_vector (4 downto 0);
    signal X24dto8_uid145_alignShift_uid81_fpHypotTest_in : std_logic_vector (24 downto 0);
    signal X24dto8_uid145_alignShift_uid81_fpHypotTest_b : std_logic_vector (16 downto 0);
    signal X24dto16_uid148_alignShift_uid81_fpHypotTest_in : std_logic_vector (24 downto 0);
    signal X24dto16_uid148_alignShift_uid81_fpHypotTest_b : std_logic_vector (8 downto 0);
    signal X24dto24_uid151_alignShift_uid81_fpHypotTest_in : std_logic_vector (24 downto 0);
    signal X24dto24_uid151_alignShift_uid81_fpHypotTest_b : std_logic_vector (0 downto 0);
    signal fracXAddr_uid106_fpHypotTest_in : std_logic_vector (22 downto 0);
    signal fracXAddr_uid106_fpHypotTest_b : std_logic_vector (6 downto 0);
    signal ExpRPreSqrt0_uid102_fpHypotTest_in : std_logic_vector (0 downto 0);
    signal ExpRPreSqrt0_uid102_fpHypotTest_b : std_logic_vector (0 downto 0);
    signal sumAHighB_uid180_sqrtPolynomialEvaluator_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid180_sqrtPolynomialEvaluator_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid180_sqrtPolynomialEvaluator_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid180_sqrtPolynomialEvaluator_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid186_sqrtPolynomialEvaluator_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid186_sqrtPolynomialEvaluator_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid186_sqrtPolynomialEvaluator_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid186_sqrtPolynomialEvaluator_q : std_logic_vector (29 downto 0);
    signal rightShiftStage2Idx1_uid169_alignShift_uid81_fpHypotTest_q : std_logic_vector (24 downto 0);
    signal resFracNorm_uid89_fpHypotTest_s : std_logic_vector (0 downto 0);
    signal resFracNorm_uid89_fpHypotTest_q : std_logic_vector (23 downto 0);
    signal normCatFracSoS_uid93_uid93_fpHypotTest_q : std_logic_vector (24 downto 0);
    signal InvExc_N_uid22_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid22_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid38_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid38_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal yNaNxNonInf_uid127_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal yNaNxNonInf_uid127_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal yNaNxNonInf_uid127_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid130_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid130_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid130_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0Idx1_uid147_alignShift_uid81_fpHypotTest_q : std_logic_vector (24 downto 0);
    signal rightShiftStage0Idx2_uid150_alignShift_uid81_fpHypotTest_q : std_logic_vector (24 downto 0);
    signal rightShiftStage0Idx3_uid153_alignShift_uid81_fpHypotTest_q : std_logic_vector (24 downto 0);
    signal expOddSelect_uid103_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal expOddSelect_uid103_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal s1_uid178_uid181_sqrtPolynomialEvaluator_q : std_logic_vector (22 downto 0);
    signal s2_uid184_uid187_sqrtPolynomialEvaluator_q : std_logic_vector (31 downto 0);
    signal rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_s : std_logic_vector (0 downto 0);
    signal rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_q : std_logic_vector (24 downto 0);
    signal exc_R_uid25_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid25_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid25_fpHypotTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid25_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal exc_R_uid41_fpHypotTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid41_fpHypotTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid41_fpHypotTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid41_fpHypotTest_q : std_logic_vector(0 downto 0);
    signal addrTable_uid107_fpHypotTest_q : std_logic_vector (7 downto 0);
    signal fracRPreInc_uid110_fpHypotTest_in : std_logic_vector (29 downto 0);
    signal fracRPreInc_uid110_fpHypotTest_b : std_logic_vector (24 downto 0);
    signal lowRangeB_uid82_fpHypotTest_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid82_fpHypotTest_b : std_logic_vector (0 downto 0);
    signal highBBits_uid83_fpHypotTest_in : std_logic_vector (24 downto 0);
    signal highBBits_uid83_fpHypotTest_b : std_logic_vector (23 downto 0);
begin


	--GND(CONSTANT,0)
    GND_q <= "0";

	--cstAllOWE_uid10_fpHypotTest(CONSTANT,9)
    cstAllOWE_uid10_fpHypotTest_q <= "11111111";

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--RightShiftStage124dto1_uid167_alignShift_uid81_fpHypotTest(BITSELECT,166)@8
    RightShiftStage124dto1_uid167_alignShift_uid81_fpHypotTest_in <= rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_q;
    RightShiftStage124dto1_uid167_alignShift_uid81_fpHypotTest_b <= RightShiftStage124dto1_uid167_alignShift_uid81_fpHypotTest_in(24 downto 1);

	--rightShiftStage2Idx1_uid169_alignShift_uid81_fpHypotTest(BITJOIN,168)@8
    rightShiftStage2Idx1_uid169_alignShift_uid81_fpHypotTest_q <= GND_q & RightShiftStage124dto1_uid167_alignShift_uid81_fpHypotTest_b;

	--rightShiftStage1Idx3Pad6_uid163_alignShift_uid81_fpHypotTest(CONSTANT,162)
    rightShiftStage1Idx3Pad6_uid163_alignShift_uid81_fpHypotTest_q <= "000000";

	--zerosWFp1_uid77_fpHypotTest(CONSTANT,76)
    zerosWFp1_uid77_fpHypotTest_q <= "000000000000000000000000";

	--fracY_uid9_fpHypotTest(BITSELECT,8)@0
    fracY_uid9_fpHypotTest_in <= b(22 downto 0);
    fracY_uid9_fpHypotTest_b <= fracY_uid9_fpHypotTest_in(22 downto 0);

	--oFracY_uid44_uid44_fpHypotTest(BITJOIN,43)@0
    oFracY_uid44_uid44_fpHypotTest_q <= VCC_q & fracY_uid9_fpHypotTest_b;

	--reg_oFracY_uid44_uid44_fpHypotTest_0_to_oFracYSqr_uid46_fpHypotTest_0(REG,199)@0
    reg_oFracY_uid44_uid44_fpHypotTest_0_to_oFracYSqr_uid46_fpHypotTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracY_uid44_uid44_fpHypotTest_0_to_oFracYSqr_uid46_fpHypotTest_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracY_uid44_uid44_fpHypotTest_0_to_oFracYSqr_uid46_fpHypotTest_0_q <= oFracY_uid44_uid44_fpHypotTest_q;
            END IF;
        END IF;
    END PROCESS;


	--oFracYSqr_uid46_fpHypotTest(MULT,45)@1
    oFracYSqr_uid46_fpHypotTest_pr <= UNSIGNED(oFracYSqr_uid46_fpHypotTest_a) * UNSIGNED(oFracYSqr_uid46_fpHypotTest_b);
    oFracYSqr_uid46_fpHypotTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracYSqr_uid46_fpHypotTest_a <= (others => '0');
            oFracYSqr_uid46_fpHypotTest_b <= (others => '0');
            oFracYSqr_uid46_fpHypotTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                oFracYSqr_uid46_fpHypotTest_a <= reg_oFracY_uid44_uid44_fpHypotTest_0_to_oFracYSqr_uid46_fpHypotTest_0_q;
                oFracYSqr_uid46_fpHypotTest_b <= reg_oFracY_uid44_uid44_fpHypotTest_0_to_oFracYSqr_uid46_fpHypotTest_0_q;
                oFracYSqr_uid46_fpHypotTest_s1 <= STD_LOGIC_VECTOR(oFracYSqr_uid46_fpHypotTest_pr);
            END IF;
        END IF;
    END PROCESS;
    oFracYSqr_uid46_fpHypotTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracYSqr_uid46_fpHypotTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                oFracYSqr_uid46_fpHypotTest_q <= oFracYSqr_uid46_fpHypotTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normFracYSqrHigh_uid57_fpHypotTest(BITSELECT,56)@4
    normFracYSqrHigh_uid57_fpHypotTest_in <= oFracYSqr_uid46_fpHypotTest_q;
    normFracYSqrHigh_uid57_fpHypotTest_b <= normFracYSqrHigh_uid57_fpHypotTest_in(47 downto 24);

	--normFracYSqrLow_uid58_fpHypotTest(BITSELECT,57)@4
    normFracYSqrLow_uid58_fpHypotTest_in <= oFracYSqr_uid46_fpHypotTest_q(46 downto 0);
    normFracYSqrLow_uid58_fpHypotTest_b <= normFracYSqrLow_uid58_fpHypotTest_in(46 downto 23);

	--normBitYSqr_uid49_fpHypotTest(BITSELECT,48)@4
    normBitYSqr_uid49_fpHypotTest_in <= oFracYSqr_uid46_fpHypotTest_q;
    normBitYSqr_uid49_fpHypotTest_b <= normBitYSqr_uid49_fpHypotTest_in(47 downto 47);

	--ofracQ_uid59_fpHypotTest(MUX,58)@4
    ofracQ_uid59_fpHypotTest_s <= normBitYSqr_uid49_fpHypotTest_b;
    ofracQ_uid59_fpHypotTest: PROCESS (ofracQ_uid59_fpHypotTest_s, en, normFracYSqrLow_uid58_fpHypotTest_b, normFracYSqrHigh_uid57_fpHypotTest_b)
    BEGIN
            CASE ofracQ_uid59_fpHypotTest_s IS
                  WHEN "0" => ofracQ_uid59_fpHypotTest_q <= normFracYSqrLow_uid58_fpHypotTest_b;
                  WHEN "1" => ofracQ_uid59_fpHypotTest_q <= normFracYSqrHigh_uid57_fpHypotTest_b;
                  WHEN OTHERS => ofracQ_uid59_fpHypotTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_ofracQ_uid59_fpHypotTest_q_to_oFracA_uid68_fpHypotTest_c(DELAY,305)@4
    ld_ofracQ_uid59_fpHypotTest_q_to_oFracA_uid68_fpHypotTest_c : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => ofracQ_uid59_fpHypotTest_q, xout => ld_ofracQ_uid59_fpHypotTest_q_to_oFracA_uid68_fpHypotTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--fracX_uid8_fpHypotTest(BITSELECT,7)@0
    fracX_uid8_fpHypotTest_in <= a(22 downto 0);
    fracX_uid8_fpHypotTest_b <= fracX_uid8_fpHypotTest_in(22 downto 0);

	--oFracX_uid43_uid43_fpHypotTest(BITJOIN,42)@0
    oFracX_uid43_uid43_fpHypotTest_q <= VCC_q & fracX_uid8_fpHypotTest_b;

	--reg_oFracX_uid43_uid43_fpHypotTest_0_to_oFracXSqr_uid45_fpHypotTest_0(REG,197)@0
    reg_oFracX_uid43_uid43_fpHypotTest_0_to_oFracXSqr_uid45_fpHypotTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracX_uid43_uid43_fpHypotTest_0_to_oFracXSqr_uid45_fpHypotTest_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracX_uid43_uid43_fpHypotTest_0_to_oFracXSqr_uid45_fpHypotTest_0_q <= oFracX_uid43_uid43_fpHypotTest_q;
            END IF;
        END IF;
    END PROCESS;


	--oFracXSqr_uid45_fpHypotTest(MULT,44)@1
    oFracXSqr_uid45_fpHypotTest_pr <= UNSIGNED(oFracXSqr_uid45_fpHypotTest_a) * UNSIGNED(oFracXSqr_uid45_fpHypotTest_b);
    oFracXSqr_uid45_fpHypotTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracXSqr_uid45_fpHypotTest_a <= (others => '0');
            oFracXSqr_uid45_fpHypotTest_b <= (others => '0');
            oFracXSqr_uid45_fpHypotTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                oFracXSqr_uid45_fpHypotTest_a <= reg_oFracX_uid43_uid43_fpHypotTest_0_to_oFracXSqr_uid45_fpHypotTest_0_q;
                oFracXSqr_uid45_fpHypotTest_b <= reg_oFracX_uid43_uid43_fpHypotTest_0_to_oFracXSqr_uid45_fpHypotTest_0_q;
                oFracXSqr_uid45_fpHypotTest_s1 <= STD_LOGIC_VECTOR(oFracXSqr_uid45_fpHypotTest_pr);
            END IF;
        END IF;
    END PROCESS;
    oFracXSqr_uid45_fpHypotTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracXSqr_uid45_fpHypotTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                oFracXSqr_uid45_fpHypotTest_q <= oFracXSqr_uid45_fpHypotTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normFracXSqrHigh_uid54_fpHypotTest(BITSELECT,53)@4
    normFracXSqrHigh_uid54_fpHypotTest_in <= oFracXSqr_uid45_fpHypotTest_q;
    normFracXSqrHigh_uid54_fpHypotTest_b <= normFracXSqrHigh_uid54_fpHypotTest_in(47 downto 24);

	--normFracXSqrLow_uid55_fpHypotTest(BITSELECT,54)@4
    normFracXSqrLow_uid55_fpHypotTest_in <= oFracXSqr_uid45_fpHypotTest_q(46 downto 0);
    normFracXSqrLow_uid55_fpHypotTest_b <= normFracXSqrLow_uid55_fpHypotTest_in(46 downto 23);

	--normBitXSqr_uid48_fpHypotTest(BITSELECT,47)@4
    normBitXSqr_uid48_fpHypotTest_in <= oFracXSqr_uid45_fpHypotTest_q;
    normBitXSqr_uid48_fpHypotTest_b <= normBitXSqr_uid48_fpHypotTest_in(47 downto 47);

	--ofracP_uid56_fpHypotTest(MUX,55)@4
    ofracP_uid56_fpHypotTest_s <= normBitXSqr_uid48_fpHypotTest_b;
    ofracP_uid56_fpHypotTest: PROCESS (ofracP_uid56_fpHypotTest_s, en, normFracXSqrLow_uid55_fpHypotTest_b, normFracXSqrHigh_uid54_fpHypotTest_b)
    BEGIN
            CASE ofracP_uid56_fpHypotTest_s IS
                  WHEN "0" => ofracP_uid56_fpHypotTest_q <= normFracXSqrLow_uid55_fpHypotTest_b;
                  WHEN "1" => ofracP_uid56_fpHypotTest_q <= normFracXSqrHigh_uid54_fpHypotTest_b;
                  WHEN OTHERS => ofracP_uid56_fpHypotTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_ofracP_uid56_fpHypotTest_q_to_oFracA_uid68_fpHypotTest_d(DELAY,306)@4
    ld_ofracP_uid56_fpHypotTest_q_to_oFracA_uid68_fpHypotTest_d : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => ofracP_uid56_fpHypotTest_q, xout => ld_ofracP_uid56_fpHypotTest_q_to_oFracA_uid68_fpHypotTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--expY_uid7_fpHypotTest(BITSELECT,6)@0
    expY_uid7_fpHypotTest_in <= b(30 downto 0);
    expY_uid7_fpHypotTest_b <= expY_uid7_fpHypotTest_in(30 downto 23);

	--expXIsZero_uid30_fpHypotTest(LOGICAL,29)@0
    expXIsZero_uid30_fpHypotTest_a <= expY_uid7_fpHypotTest_b;
    expXIsZero_uid30_fpHypotTest_b <= cstAllZWE_uid12_fpHypotTest_q;
    expXIsZero_uid30_fpHypotTest_q <= "1" when expXIsZero_uid30_fpHypotTest_a = expXIsZero_uid30_fpHypotTest_b else "0";

	--ld_expXIsZero_uid30_fpHypotTest_q_to_expCmpGtePQ_uid61_fpHypotTest_b(DELAY,294)@0
    ld_expXIsZero_uid30_fpHypotTest_q_to_expCmpGtePQ_uid61_fpHypotTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => expXIsZero_uid30_fpHypotTest_q, xout => ld_expXIsZero_uid30_fpHypotTest_q_to_expCmpGtePQ_uid61_fpHypotTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--bias_uid47_fpHypotTest(CONSTANT,46)
    bias_uid47_fpHypotTest_q <= "1111111";

	--ld_expY_uid7_fpHypotTest_b_to_expYTimes2_uid51_fpHypotTest_b_inputreg(DELAY,497)
    ld_expY_uid7_fpHypotTest_b_to_expYTimes2_uid51_fpHypotTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expY_uid7_fpHypotTest_b, xout => ld_expY_uid7_fpHypotTest_b_to_expYTimes2_uid51_fpHypotTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expY_uid7_fpHypotTest_b_to_expYTimes2_uid51_fpHypotTest_b(DELAY,278)@0
    ld_expY_uid7_fpHypotTest_b_to_expYTimes2_uid51_fpHypotTest_b : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => ld_expY_uid7_fpHypotTest_b_to_expYTimes2_uid51_fpHypotTest_b_inputreg_q, xout => ld_expY_uid7_fpHypotTest_b_to_expYTimes2_uid51_fpHypotTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expYTimes2_uid51_fpHypotTest(BITJOIN,50)@4
    expYTimes2_uid51_fpHypotTest_q <= ld_expY_uid7_fpHypotTest_b_to_expYTimes2_uid51_fpHypotTest_b_q & normBitYSqr_uid49_fpHypotTest_b;

	--expQ_uid53_fpHypotTest(SUB,52)@4
    expQ_uid53_fpHypotTest_a <= STD_LOGIC_VECTOR("0" & expYTimes2_uid51_fpHypotTest_q);
    expQ_uid53_fpHypotTest_b <= STD_LOGIC_VECTOR("000" & bias_uid47_fpHypotTest_q);
            expQ_uid53_fpHypotTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expQ_uid53_fpHypotTest_a) - UNSIGNED(expQ_uid53_fpHypotTest_b));
    expQ_uid53_fpHypotTest_q <= expQ_uid53_fpHypotTest_o(9 downto 0);


	--ld_expQ_uid53_fpHypotTest_q_to_pGTEq_uid60_fpHypotTest_b(DELAY,292)@4
    ld_expQ_uid53_fpHypotTest_q_to_pGTEq_uid60_fpHypotTest_b : dspba_delay
    GENERIC MAP ( width => 10, depth => 1 )
    PORT MAP ( xin => expQ_uid53_fpHypotTest_q, xout => ld_expQ_uid53_fpHypotTest_q_to_pGTEq_uid60_fpHypotTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expX_uid6_fpHypotTest(BITSELECT,5)@0
    expX_uid6_fpHypotTest_in <= a(30 downto 0);
    expX_uid6_fpHypotTest_b <= expX_uid6_fpHypotTest_in(30 downto 23);

	--ld_expX_uid6_fpHypotTest_b_to_expXTimes2_uid50_fpHypotTest_b_inputreg(DELAY,496)
    ld_expX_uid6_fpHypotTest_b_to_expXTimes2_uid50_fpHypotTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expX_uid6_fpHypotTest_b, xout => ld_expX_uid6_fpHypotTest_b_to_expXTimes2_uid50_fpHypotTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expX_uid6_fpHypotTest_b_to_expXTimes2_uid50_fpHypotTest_b(DELAY,276)@0
    ld_expX_uid6_fpHypotTest_b_to_expXTimes2_uid50_fpHypotTest_b : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => ld_expX_uid6_fpHypotTest_b_to_expXTimes2_uid50_fpHypotTest_b_inputreg_q, xout => ld_expX_uid6_fpHypotTest_b_to_expXTimes2_uid50_fpHypotTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expXTimes2_uid50_fpHypotTest(BITJOIN,49)@4
    expXTimes2_uid50_fpHypotTest_q <= ld_expX_uid6_fpHypotTest_b_to_expXTimes2_uid50_fpHypotTest_b_q & normBitXSqr_uid48_fpHypotTest_b;

	--expP_uid52_fpHypotTest(SUB,51)@4
    expP_uid52_fpHypotTest_a <= STD_LOGIC_VECTOR("0" & expXTimes2_uid50_fpHypotTest_q);
    expP_uid52_fpHypotTest_b <= STD_LOGIC_VECTOR("000" & bias_uid47_fpHypotTest_q);
            expP_uid52_fpHypotTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expP_uid52_fpHypotTest_a) - UNSIGNED(expP_uid52_fpHypotTest_b));
    expP_uid52_fpHypotTest_q <= expP_uid52_fpHypotTest_o(9 downto 0);


	--reg_expP_uid52_fpHypotTest_0_to_pGTEq_uid60_fpHypotTest_0(REG,201)@4
    reg_expP_uid52_fpHypotTest_0_to_pGTEq_uid60_fpHypotTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expP_uid52_fpHypotTest_0_to_pGTEq_uid60_fpHypotTest_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expP_uid52_fpHypotTest_0_to_pGTEq_uid60_fpHypotTest_0_q <= expP_uid52_fpHypotTest_q;
            END IF;
        END IF;
    END PROCESS;


	--pGTEq_uid60_fpHypotTest(COMPARE,59)@5
    pGTEq_uid60_fpHypotTest_cin <= GND_q;
    pGTEq_uid60_fpHypotTest_a <= STD_LOGIC_VECTOR((11 downto 10 => reg_expP_uid52_fpHypotTest_0_to_pGTEq_uid60_fpHypotTest_0_q(9)) & reg_expP_uid52_fpHypotTest_0_to_pGTEq_uid60_fpHypotTest_0_q) & '0';
    pGTEq_uid60_fpHypotTest_b <= STD_LOGIC_VECTOR((11 downto 10 => ld_expQ_uid53_fpHypotTest_q_to_pGTEq_uid60_fpHypotTest_b_q(9)) & ld_expQ_uid53_fpHypotTest_q_to_pGTEq_uid60_fpHypotTest_b_q) & pGTEq_uid60_fpHypotTest_cin(0);
            pGTEq_uid60_fpHypotTest_o <= STD_LOGIC_VECTOR(SIGNED(pGTEq_uid60_fpHypotTest_a) - SIGNED(pGTEq_uid60_fpHypotTest_b));
    pGTEq_uid60_fpHypotTest_n(0) <= not pGTEq_uid60_fpHypotTest_o(12);


	--expCmpGtePQ_uid61_fpHypotTest(LOGICAL,60)@5
    expCmpGtePQ_uid61_fpHypotTest_a <= pGTEq_uid60_fpHypotTest_n;
    expCmpGtePQ_uid61_fpHypotTest_b <= ld_expXIsZero_uid30_fpHypotTest_q_to_expCmpGtePQ_uid61_fpHypotTest_b_q;
    expCmpGtePQ_uid61_fpHypotTest_q <= expCmpGtePQ_uid61_fpHypotTest_a or expCmpGtePQ_uid61_fpHypotTest_b;

	--oFracB_uid69_fpHypotTest(MUX,68)@5
    oFracB_uid69_fpHypotTest_s <= expCmpGtePQ_uid61_fpHypotTest_q;
    oFracB_uid69_fpHypotTest: PROCESS (oFracB_uid69_fpHypotTest_s, en, ld_ofracP_uid56_fpHypotTest_q_to_oFracA_uid68_fpHypotTest_d_q, ld_ofracQ_uid59_fpHypotTest_q_to_oFracA_uid68_fpHypotTest_c_q)
    BEGIN
            CASE oFracB_uid69_fpHypotTest_s IS
                  WHEN "0" => oFracB_uid69_fpHypotTest_q <= ld_ofracP_uid56_fpHypotTest_q_to_oFracA_uid68_fpHypotTest_d_q;
                  WHEN "1" => oFracB_uid69_fpHypotTest_q <= ld_ofracQ_uid59_fpHypotTest_q_to_oFracA_uid68_fpHypotTest_c_q;
                  WHEN OTHERS => oFracB_uid69_fpHypotTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_oFracB_uid69_fpHypotTest_q_to_oFracBPostExc_uid78_fpHypotTest_c(DELAY,325)@5
    ld_oFracB_uid69_fpHypotTest_q_to_oFracBPostExc_uid78_fpHypotTest_c : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => oFracB_uid69_fpHypotTest_q, xout => ld_oFracB_uid69_fpHypotTest_q_to_oFracBPostExc_uid78_fpHypotTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--cWFP2_uid66_fpHypotTest(CONSTANT,65)
    cWFP2_uid66_fpHypotTest_q <= "11001";

	--expDiffPQ_uid62_fpHypotTest(SUB,61)@5
    expDiffPQ_uid62_fpHypotTest_a <= STD_LOGIC_VECTOR((10 downto 10 => reg_expP_uid52_fpHypotTest_0_to_pGTEq_uid60_fpHypotTest_0_q(9)) & reg_expP_uid52_fpHypotTest_0_to_pGTEq_uid60_fpHypotTest_0_q);
    expDiffPQ_uid62_fpHypotTest_b <= STD_LOGIC_VECTOR((10 downto 10 => ld_expQ_uid53_fpHypotTest_q_to_pGTEq_uid60_fpHypotTest_b_q(9)) & ld_expQ_uid53_fpHypotTest_q_to_pGTEq_uid60_fpHypotTest_b_q);
            expDiffPQ_uid62_fpHypotTest_o <= STD_LOGIC_VECTOR(SIGNED(expDiffPQ_uid62_fpHypotTest_a) - SIGNED(expDiffPQ_uid62_fpHypotTest_b));
    expDiffPQ_uid62_fpHypotTest_q <= expDiffPQ_uid62_fpHypotTest_o(10 downto 0);


	--ld_expP_uid52_fpHypotTest_q_to_expDiffQP_uid63_fpHypotTest_b(DELAY,298)@4
    ld_expP_uid52_fpHypotTest_q_to_expDiffQP_uid63_fpHypotTest_b : dspba_delay
    GENERIC MAP ( width => 10, depth => 1 )
    PORT MAP ( xin => expP_uid52_fpHypotTest_q, xout => ld_expP_uid52_fpHypotTest_q_to_expDiffQP_uid63_fpHypotTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expQ_uid53_fpHypotTest_0_to_expDiffQP_uid63_fpHypotTest_0(REG,202)@4
    reg_expQ_uid53_fpHypotTest_0_to_expDiffQP_uid63_fpHypotTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expQ_uid53_fpHypotTest_0_to_expDiffQP_uid63_fpHypotTest_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expQ_uid53_fpHypotTest_0_to_expDiffQP_uid63_fpHypotTest_0_q <= expQ_uid53_fpHypotTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expDiffQP_uid63_fpHypotTest(SUB,62)@5
    expDiffQP_uid63_fpHypotTest_a <= STD_LOGIC_VECTOR((10 downto 10 => reg_expQ_uid53_fpHypotTest_0_to_expDiffQP_uid63_fpHypotTest_0_q(9)) & reg_expQ_uid53_fpHypotTest_0_to_expDiffQP_uid63_fpHypotTest_0_q);
    expDiffQP_uid63_fpHypotTest_b <= STD_LOGIC_VECTOR((10 downto 10 => ld_expP_uid52_fpHypotTest_q_to_expDiffQP_uid63_fpHypotTest_b_q(9)) & ld_expP_uid52_fpHypotTest_q_to_expDiffQP_uid63_fpHypotTest_b_q);
            expDiffQP_uid63_fpHypotTest_o <= STD_LOGIC_VECTOR(SIGNED(expDiffQP_uid63_fpHypotTest_a) - SIGNED(expDiffQP_uid63_fpHypotTest_b));
    expDiffQP_uid63_fpHypotTest_q <= expDiffQP_uid63_fpHypotTest_o(10 downto 0);


	--mux_uid64_fpHypotTest(MUX,63)@5
    mux_uid64_fpHypotTest_s <= expCmpGtePQ_uid61_fpHypotTest_q;
    mux_uid64_fpHypotTest: PROCESS (mux_uid64_fpHypotTest_s, en, expDiffQP_uid63_fpHypotTest_q, expDiffPQ_uid62_fpHypotTest_q)
    BEGIN
            CASE mux_uid64_fpHypotTest_s IS
                  WHEN "0" => mux_uid64_fpHypotTest_q <= expDiffQP_uid63_fpHypotTest_q;
                  WHEN "1" => mux_uid64_fpHypotTest_q <= expDiffPQ_uid62_fpHypotTest_q;
                  WHEN OTHERS => mux_uid64_fpHypotTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expDiff_uid65_fpHypotTest(BITSELECT,64)@5
    expDiff_uid65_fpHypotTest_in <= mux_uid64_fpHypotTest_q(9 downto 0);
    expDiff_uid65_fpHypotTest_b <= expDiff_uid65_fpHypotTest_in(9 downto 0);

	--reg_expDiff_uid65_fpHypotTest_0_to_shiftedOut_uid67_fpHypotTest_0(REG,204)@5
    reg_expDiff_uid65_fpHypotTest_0_to_shiftedOut_uid67_fpHypotTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expDiff_uid65_fpHypotTest_0_to_shiftedOut_uid67_fpHypotTest_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expDiff_uid65_fpHypotTest_0_to_shiftedOut_uid67_fpHypotTest_0_q <= expDiff_uid65_fpHypotTest_b;
            END IF;
        END IF;
    END PROCESS;


	--shiftedOut_uid67_fpHypotTest(COMPARE,66)@6
    shiftedOut_uid67_fpHypotTest_cin <= GND_q;
    shiftedOut_uid67_fpHypotTest_a <= STD_LOGIC_VECTOR("00" & reg_expDiff_uid65_fpHypotTest_0_to_shiftedOut_uid67_fpHypotTest_0_q) & '0';
    shiftedOut_uid67_fpHypotTest_b <= STD_LOGIC_VECTOR("0000000" & cWFP2_uid66_fpHypotTest_q) & shiftedOut_uid67_fpHypotTest_cin(0);
            shiftedOut_uid67_fpHypotTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid67_fpHypotTest_a) - UNSIGNED(shiftedOut_uid67_fpHypotTest_b));
    shiftedOut_uid67_fpHypotTest_n(0) <= not shiftedOut_uid67_fpHypotTest_o(12);


	--expXIsZero_uid14_fpHypotTest(LOGICAL,13)@0
    expXIsZero_uid14_fpHypotTest_a <= expX_uid6_fpHypotTest_b;
    expXIsZero_uid14_fpHypotTest_b <= cstAllZWE_uid12_fpHypotTest_q;
    expXIsZero_uid14_fpHypotTest_q <= "1" when expXIsZero_uid14_fpHypotTest_a = expXIsZero_uid14_fpHypotTest_b else "0";

	--ld_expXIsZero_uid14_fpHypotTest_q_to_excAZero_uid74_fpHypotTest_d(DELAY,318)@0
    ld_expXIsZero_uid14_fpHypotTest_q_to_excAZero_uid74_fpHypotTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => expXIsZero_uid14_fpHypotTest_q, xout => ld_expXIsZero_uid14_fpHypotTest_q_to_excAZero_uid74_fpHypotTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--excBZero_uid75_fpHypotTest(MUX,74)@5
    excBZero_uid75_fpHypotTest_s <= expCmpGtePQ_uid61_fpHypotTest_q;
    excBZero_uid75_fpHypotTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excBZero_uid75_fpHypotTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE excBZero_uid75_fpHypotTest_s IS
                      WHEN "0" => excBZero_uid75_fpHypotTest_q <= ld_expXIsZero_uid14_fpHypotTest_q_to_excAZero_uid74_fpHypotTest_d_q;
                      WHEN "1" => excBZero_uid75_fpHypotTest_q <= ld_expXIsZero_uid30_fpHypotTest_q_to_expCmpGtePQ_uid61_fpHypotTest_b_q;
                      WHEN OTHERS => excBZero_uid75_fpHypotTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--oFracBFlushToZero_uid76_fpHypotTest(LOGICAL,75)@6
    oFracBFlushToZero_uid76_fpHypotTest_a <= excBZero_uid75_fpHypotTest_q;
    oFracBFlushToZero_uid76_fpHypotTest_b <= shiftedOut_uid67_fpHypotTest_n;
    oFracBFlushToZero_uid76_fpHypotTest_q <= oFracBFlushToZero_uid76_fpHypotTest_a or oFracBFlushToZero_uid76_fpHypotTest_b;

	--oFracBPostExc_uid78_fpHypotTest(MUX,77)@6
    oFracBPostExc_uid78_fpHypotTest_s <= oFracBFlushToZero_uid76_fpHypotTest_q;
    oFracBPostExc_uid78_fpHypotTest: PROCESS (oFracBPostExc_uid78_fpHypotTest_s, en, ld_oFracB_uid69_fpHypotTest_q_to_oFracBPostExc_uid78_fpHypotTest_c_q, zerosWFp1_uid77_fpHypotTest_q)
    BEGIN
            CASE oFracBPostExc_uid78_fpHypotTest_s IS
                  WHEN "0" => oFracBPostExc_uid78_fpHypotTest_q <= ld_oFracB_uid69_fpHypotTest_q_to_oFracBPostExc_uid78_fpHypotTest_c_q;
                  WHEN "1" => oFracBPostExc_uid78_fpHypotTest_q <= zerosWFp1_uid77_fpHypotTest_q;
                  WHEN OTHERS => oFracBPostExc_uid78_fpHypotTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oFracBPostExcG_uid80_fpHypotTest(BITJOIN,79)@6
    oFracBPostExcG_uid80_fpHypotTest_q <= oFracBPostExc_uid78_fpHypotTest_q & GND_q;

	--X24dto24_uid151_alignShift_uid81_fpHypotTest(BITSELECT,150)@6
    X24dto24_uid151_alignShift_uid81_fpHypotTest_in <= oFracBPostExcG_uid80_fpHypotTest_q;
    X24dto24_uid151_alignShift_uid81_fpHypotTest_b <= X24dto24_uid151_alignShift_uid81_fpHypotTest_in(24 downto 24);

	--rightShiftStage0Idx3_uid153_alignShift_uid81_fpHypotTest(BITJOIN,152)@6
    rightShiftStage0Idx3_uid153_alignShift_uid81_fpHypotTest_q <= zerosWFp1_uid77_fpHypotTest_q & X24dto24_uid151_alignShift_uid81_fpHypotTest_b;

	--reg_rightShiftStage0Idx3_uid153_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_5(REG,210)@6
    reg_rightShiftStage0Idx3_uid153_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx3_uid153_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_5_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx3_uid153_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_5_q <= rightShiftStage0Idx3_uid153_alignShift_uid81_fpHypotTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0Idx2Pad16_uid149_alignShift_uid81_fpHypotTest(CONSTANT,148)
    rightShiftStage0Idx2Pad16_uid149_alignShift_uid81_fpHypotTest_q <= "0000000000000000";

	--X24dto16_uid148_alignShift_uid81_fpHypotTest(BITSELECT,147)@6
    X24dto16_uid148_alignShift_uid81_fpHypotTest_in <= oFracBPostExcG_uid80_fpHypotTest_q;
    X24dto16_uid148_alignShift_uid81_fpHypotTest_b <= X24dto16_uid148_alignShift_uid81_fpHypotTest_in(24 downto 16);

	--rightShiftStage0Idx2_uid150_alignShift_uid81_fpHypotTest(BITJOIN,149)@6
    rightShiftStage0Idx2_uid150_alignShift_uid81_fpHypotTest_q <= rightShiftStage0Idx2Pad16_uid149_alignShift_uid81_fpHypotTest_q & X24dto16_uid148_alignShift_uid81_fpHypotTest_b;

	--reg_rightShiftStage0Idx2_uid150_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_4(REG,209)@6
    reg_rightShiftStage0Idx2_uid150_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx2_uid150_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_4_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx2_uid150_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_4_q <= rightShiftStage0Idx2_uid150_alignShift_uid81_fpHypotTest_q;
            END IF;
        END IF;
    END PROCESS;


	--X24dto8_uid145_alignShift_uid81_fpHypotTest(BITSELECT,144)@6
    X24dto8_uid145_alignShift_uid81_fpHypotTest_in <= oFracBPostExcG_uid80_fpHypotTest_q;
    X24dto8_uid145_alignShift_uid81_fpHypotTest_b <= X24dto8_uid145_alignShift_uid81_fpHypotTest_in(24 downto 8);

	--rightShiftStage0Idx1_uid147_alignShift_uid81_fpHypotTest(BITJOIN,146)@6
    rightShiftStage0Idx1_uid147_alignShift_uid81_fpHypotTest_q <= cstAllZWE_uid12_fpHypotTest_q & X24dto8_uid145_alignShift_uid81_fpHypotTest_b;

	--reg_rightShiftStage0Idx1_uid147_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_3(REG,208)@6
    reg_rightShiftStage0Idx1_uid147_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx1_uid147_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_3_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx1_uid147_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_3_q <= rightShiftStage0Idx1_uid147_alignShift_uid81_fpHypotTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_oFracBPostExcG_uid80_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_2(REG,207)@6
    reg_oFracBPostExcG_uid80_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracBPostExcG_uid80_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_2_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracBPostExcG_uid80_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_2_q <= oFracBPostExcG_uid80_fpHypotTest_q;
            END IF;
        END IF;
    END PROCESS;


	--z_uid71_fpHypotTest(CONSTANT,70)
    z_uid71_fpHypotTest_q <= "00000";

	--expDiffShiftRange_uid72_fpHypotTest(BITSELECT,71)@5
    expDiffShiftRange_uid72_fpHypotTest_in <= expDiff_uid65_fpHypotTest_b(4 downto 0);
    expDiffShiftRange_uid72_fpHypotTest_b <= expDiffShiftRange_uid72_fpHypotTest_in(4 downto 0);

	--reg_expDiffShiftRange_uid72_fpHypotTest_0_to_shiftValue_uid73_fpHypotTest_2(REG,205)@5
    reg_expDiffShiftRange_uid72_fpHypotTest_0_to_shiftValue_uid73_fpHypotTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expDiffShiftRange_uid72_fpHypotTest_0_to_shiftValue_uid73_fpHypotTest_2_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expDiffShiftRange_uid72_fpHypotTest_0_to_shiftValue_uid73_fpHypotTest_2_q <= expDiffShiftRange_uid72_fpHypotTest_b;
            END IF;
        END IF;
    END PROCESS;


	--shiftValue_uid73_fpHypotTest(MUX,72)@6
    shiftValue_uid73_fpHypotTest_s <= shiftedOut_uid67_fpHypotTest_n;
    shiftValue_uid73_fpHypotTest: PROCESS (shiftValue_uid73_fpHypotTest_s, en, reg_expDiffShiftRange_uid72_fpHypotTest_0_to_shiftValue_uid73_fpHypotTest_2_q, z_uid71_fpHypotTest_q)
    BEGIN
            CASE shiftValue_uid73_fpHypotTest_s IS
                  WHEN "0" => shiftValue_uid73_fpHypotTest_q <= reg_expDiffShiftRange_uid72_fpHypotTest_0_to_shiftValue_uid73_fpHypotTest_2_q;
                  WHEN "1" => shiftValue_uid73_fpHypotTest_q <= z_uid71_fpHypotTest_q;
                  WHEN OTHERS => shiftValue_uid73_fpHypotTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel4Dto3_uid154_alignShift_uid81_fpHypotTest(BITSELECT,153)@6
    rightShiftStageSel4Dto3_uid154_alignShift_uid81_fpHypotTest_in <= shiftValue_uid73_fpHypotTest_q;
    rightShiftStageSel4Dto3_uid154_alignShift_uid81_fpHypotTest_b <= rightShiftStageSel4Dto3_uid154_alignShift_uid81_fpHypotTest_in(4 downto 3);

	--reg_rightShiftStageSel4Dto3_uid154_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_1(REG,206)@6
    reg_rightShiftStageSel4Dto3_uid154_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel4Dto3_uid154_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel4Dto3_uid154_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_1_q <= rightShiftStageSel4Dto3_uid154_alignShift_uid81_fpHypotTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid155_alignShift_uid81_fpHypotTest(MUX,154)@7
    rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_s <= reg_rightShiftStageSel4Dto3_uid154_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_1_q;
    rightShiftStage0_uid155_alignShift_uid81_fpHypotTest: PROCESS (rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_s, en, reg_oFracBPostExcG_uid80_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_2_q, reg_rightShiftStage0Idx1_uid147_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_3_q, reg_rightShiftStage0Idx2_uid150_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_4_q, reg_rightShiftStage0Idx3_uid153_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_5_q)
    BEGIN
            CASE rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_s IS
                  WHEN "00" => rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_q <= reg_oFracBPostExcG_uid80_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_2_q;
                  WHEN "01" => rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_q <= reg_rightShiftStage0Idx1_uid147_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_3_q;
                  WHEN "10" => rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_q <= reg_rightShiftStage0Idx2_uid150_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_4_q;
                  WHEN "11" => rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_q <= reg_rightShiftStage0Idx3_uid153_alignShift_uid81_fpHypotTest_0_to_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_5_q;
                  WHEN OTHERS => rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage024dto6_uid162_alignShift_uid81_fpHypotTest(BITSELECT,161)@7
    RightShiftStage024dto6_uid162_alignShift_uid81_fpHypotTest_in <= rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_q;
    RightShiftStage024dto6_uid162_alignShift_uid81_fpHypotTest_b <= RightShiftStage024dto6_uid162_alignShift_uid81_fpHypotTest_in(24 downto 6);

	--ld_RightShiftStage024dto6_uid162_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx3_uid164_alignShift_uid81_fpHypotTest_a(DELAY,424)@7
    ld_RightShiftStage024dto6_uid162_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx3_uid164_alignShift_uid81_fpHypotTest_a : dspba_delay
    GENERIC MAP ( width => 19, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto6_uid162_alignShift_uid81_fpHypotTest_b, xout => ld_RightShiftStage024dto6_uid162_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx3_uid164_alignShift_uid81_fpHypotTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid164_alignShift_uid81_fpHypotTest(BITJOIN,163)@8
    rightShiftStage1Idx3_uid164_alignShift_uid81_fpHypotTest_q <= rightShiftStage1Idx3Pad6_uid163_alignShift_uid81_fpHypotTest_q & ld_RightShiftStage024dto6_uid162_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx3_uid164_alignShift_uid81_fpHypotTest_a_q;

	--rightShiftStage1Idx2Pad4_uid160_alignShift_uid81_fpHypotTest(CONSTANT,159)
    rightShiftStage1Idx2Pad4_uid160_alignShift_uid81_fpHypotTest_q <= "0000";

	--RightShiftStage024dto4_uid159_alignShift_uid81_fpHypotTest(BITSELECT,158)@7
    RightShiftStage024dto4_uid159_alignShift_uid81_fpHypotTest_in <= rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_q;
    RightShiftStage024dto4_uid159_alignShift_uid81_fpHypotTest_b <= RightShiftStage024dto4_uid159_alignShift_uid81_fpHypotTest_in(24 downto 4);

	--ld_RightShiftStage024dto4_uid159_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx2_uid161_alignShift_uid81_fpHypotTest_a(DELAY,422)@7
    ld_RightShiftStage024dto4_uid159_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx2_uid161_alignShift_uid81_fpHypotTest_a : dspba_delay
    GENERIC MAP ( width => 21, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto4_uid159_alignShift_uid81_fpHypotTest_b, xout => ld_RightShiftStage024dto4_uid159_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx2_uid161_alignShift_uid81_fpHypotTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid161_alignShift_uid81_fpHypotTest(BITJOIN,160)@8
    rightShiftStage1Idx2_uid161_alignShift_uid81_fpHypotTest_q <= rightShiftStage1Idx2Pad4_uid160_alignShift_uid81_fpHypotTest_q & ld_RightShiftStage024dto4_uid159_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx2_uid161_alignShift_uid81_fpHypotTest_a_q;

	--rightShiftStage1Idx1Pad2_uid157_alignShift_uid81_fpHypotTest(CONSTANT,156)
    rightShiftStage1Idx1Pad2_uid157_alignShift_uid81_fpHypotTest_q <= "00";

	--RightShiftStage024dto2_uid156_alignShift_uid81_fpHypotTest(BITSELECT,155)@7
    RightShiftStage024dto2_uid156_alignShift_uid81_fpHypotTest_in <= rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_q;
    RightShiftStage024dto2_uid156_alignShift_uid81_fpHypotTest_b <= RightShiftStage024dto2_uid156_alignShift_uid81_fpHypotTest_in(24 downto 2);

	--ld_RightShiftStage024dto2_uid156_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx1_uid158_alignShift_uid81_fpHypotTest_a(DELAY,420)@7
    ld_RightShiftStage024dto2_uid156_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx1_uid158_alignShift_uid81_fpHypotTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto2_uid156_alignShift_uid81_fpHypotTest_b, xout => ld_RightShiftStage024dto2_uid156_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx1_uid158_alignShift_uid81_fpHypotTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid158_alignShift_uid81_fpHypotTest(BITJOIN,157)@8
    rightShiftStage1Idx1_uid158_alignShift_uid81_fpHypotTest_q <= rightShiftStage1Idx1Pad2_uid157_alignShift_uid81_fpHypotTest_q & ld_RightShiftStage024dto2_uid156_alignShift_uid81_fpHypotTest_b_to_rightShiftStage1Idx1_uid158_alignShift_uid81_fpHypotTest_a_q;

	--reg_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_2(REG,212)@7
    reg_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_2_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_2_q <= rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest(BITSELECT,164)@6
    rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_in <= shiftValue_uid73_fpHypotTest_q(2 downto 0);
    rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_b <= rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_in(2 downto 1);

	--reg_rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_1(REG,211)@6
    reg_rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_1_q <= rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_1_q_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_b(DELAY,426)@7
    ld_reg_rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_1_q_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_1_q, xout => ld_reg_rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_1_q_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1_uid166_alignShift_uid81_fpHypotTest(MUX,165)@8
    rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_s <= ld_reg_rightShiftStageSel2Dto1_uid165_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_1_q_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_b_q;
    rightShiftStage1_uid166_alignShift_uid81_fpHypotTest: PROCESS (rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_s, en, reg_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_2_q, rightShiftStage1Idx1_uid158_alignShift_uid81_fpHypotTest_q, rightShiftStage1Idx2_uid161_alignShift_uid81_fpHypotTest_q, rightShiftStage1Idx3_uid164_alignShift_uid81_fpHypotTest_q)
    BEGIN
            CASE rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_s IS
                  WHEN "00" => rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_q <= reg_rightShiftStage0_uid155_alignShift_uid81_fpHypotTest_0_to_rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_2_q;
                  WHEN "01" => rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_q <= rightShiftStage1Idx1_uid158_alignShift_uid81_fpHypotTest_q;
                  WHEN "10" => rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_q <= rightShiftStage1Idx2_uid161_alignShift_uid81_fpHypotTest_q;
                  WHEN "11" => rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_q <= rightShiftStage1Idx3_uid164_alignShift_uid81_fpHypotTest_q;
                  WHEN OTHERS => rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest(BITSELECT,169)@6
    rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_in <= shiftValue_uid73_fpHypotTest_q(0 downto 0);
    rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_b <= rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_in(0 downto 0);

	--ld_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_b_to_reg_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_0_to_rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_1_a(DELAY,475)@6
    ld_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_b_to_reg_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_0_to_rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_b, xout => ld_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_b_to_reg_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_0_to_rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_0_to_rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_1(REG,213)@7
    reg_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_0_to_rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_0_to_rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_0_to_rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_1_q <= ld_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_b_to_reg_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_0_to_rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid171_alignShift_uid81_fpHypotTest(MUX,170)@8
    rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_s <= reg_rightShiftStageSel0Dto0_uid170_alignShift_uid81_fpHypotTest_0_to_rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_1_q;
    rightShiftStage2_uid171_alignShift_uid81_fpHypotTest: PROCESS (rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_s, en, rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_q, rightShiftStage2Idx1_uid169_alignShift_uid81_fpHypotTest_q)
    BEGIN
            CASE rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_s IS
                  WHEN "0" => rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_q <= rightShiftStage1_uid166_alignShift_uid81_fpHypotTest_q;
                  WHEN "1" => rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_q <= rightShiftStage2Idx1_uid169_alignShift_uid81_fpHypotTest_q;
                  WHEN OTHERS => rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--highBBits_uid83_fpHypotTest(BITSELECT,82)@8
    highBBits_uid83_fpHypotTest_in <= rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_q;
    highBBits_uid83_fpHypotTest_b <= highBBits_uid83_fpHypotTest_in(24 downto 1);

	--reg_highBBits_uid83_fpHypotTest_0_to_sumAHighB_uid84_fpHypotTest_1(REG,214)@8
    reg_highBBits_uid83_fpHypotTest_0_to_sumAHighB_uid84_fpHypotTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_highBBits_uid83_fpHypotTest_0_to_sumAHighB_uid84_fpHypotTest_1_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_highBBits_uid83_fpHypotTest_0_to_sumAHighB_uid84_fpHypotTest_1_q <= highBBits_uid83_fpHypotTest_b;
            END IF;
        END IF;
    END PROCESS;


	--oFracA_uid68_fpHypotTest(MUX,67)@5
    oFracA_uid68_fpHypotTest_s <= expCmpGtePQ_uid61_fpHypotTest_q;
    oFracA_uid68_fpHypotTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracA_uid68_fpHypotTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE oFracA_uid68_fpHypotTest_s IS
                      WHEN "0" => oFracA_uid68_fpHypotTest_q <= ld_ofracQ_uid59_fpHypotTest_q_to_oFracA_uid68_fpHypotTest_c_q;
                      WHEN "1" => oFracA_uid68_fpHypotTest_q <= ld_ofracP_uid56_fpHypotTest_q_to_oFracA_uid68_fpHypotTest_d_q;
                      WHEN OTHERS => oFracA_uid68_fpHypotTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--excAZero_uid74_fpHypotTest(MUX,73)@5
    excAZero_uid74_fpHypotTest_s <= expCmpGtePQ_uid61_fpHypotTest_q;
    excAZero_uid74_fpHypotTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excAZero_uid74_fpHypotTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE excAZero_uid74_fpHypotTest_s IS
                      WHEN "0" => excAZero_uid74_fpHypotTest_q <= ld_expXIsZero_uid30_fpHypotTest_q_to_expCmpGtePQ_uid61_fpHypotTest_b_q;
                      WHEN "1" => excAZero_uid74_fpHypotTest_q <= ld_expXIsZero_uid14_fpHypotTest_q_to_excAZero_uid74_fpHypotTest_d_q;
                      WHEN OTHERS => excAZero_uid74_fpHypotTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--oFracAPostExc_uid79_fpHypotTest(MUX,78)@6
    oFracAPostExc_uid79_fpHypotTest_s <= excAZero_uid74_fpHypotTest_q;
    oFracAPostExc_uid79_fpHypotTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracAPostExc_uid79_fpHypotTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE oFracAPostExc_uid79_fpHypotTest_s IS
                      WHEN "0" => oFracAPostExc_uid79_fpHypotTest_q <= oFracA_uid68_fpHypotTest_q;
                      WHEN "1" => oFracAPostExc_uid79_fpHypotTest_q <= zerosWFp1_uid77_fpHypotTest_q;
                      WHEN OTHERS => oFracAPostExc_uid79_fpHypotTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracAPostExc_uid79_fpHypotTest_q_to_sumAHighB_uid84_fpHypotTest_a(DELAY,331)@7
    ld_oFracAPostExc_uid79_fpHypotTest_q_to_sumAHighB_uid84_fpHypotTest_a : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => oFracAPostExc_uid79_fpHypotTest_q, xout => ld_oFracAPostExc_uid79_fpHypotTest_q_to_sumAHighB_uid84_fpHypotTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--sumAHighB_uid84_fpHypotTest(ADD,83)@9
    sumAHighB_uid84_fpHypotTest_a <= STD_LOGIC_VECTOR("0" & ld_oFracAPostExc_uid79_fpHypotTest_q_to_sumAHighB_uid84_fpHypotTest_a_q);
    sumAHighB_uid84_fpHypotTest_b <= STD_LOGIC_VECTOR("0" & reg_highBBits_uid83_fpHypotTest_0_to_sumAHighB_uid84_fpHypotTest_1_q);
            sumAHighB_uid84_fpHypotTest_o <= STD_LOGIC_VECTOR(UNSIGNED(sumAHighB_uid84_fpHypotTest_a) + UNSIGNED(sumAHighB_uid84_fpHypotTest_b));
    sumAHighB_uid84_fpHypotTest_q <= sumAHighB_uid84_fpHypotTest_o(24 downto 0);


	--lowRangeB_uid82_fpHypotTest(BITSELECT,81)@8
    lowRangeB_uid82_fpHypotTest_in <= rightShiftStage2_uid171_alignShift_uid81_fpHypotTest_q(0 downto 0);
    lowRangeB_uid82_fpHypotTest_b <= lowRangeB_uid82_fpHypotTest_in(0 downto 0);

	--reg_lowRangeB_uid82_fpHypotTest_0_to_soSPreNorm_uid82_uid85_fpHypotTest_0(REG,215)@8
    reg_lowRangeB_uid82_fpHypotTest_0_to_soSPreNorm_uid82_uid85_fpHypotTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_lowRangeB_uid82_fpHypotTest_0_to_soSPreNorm_uid82_uid85_fpHypotTest_0_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_lowRangeB_uid82_fpHypotTest_0_to_soSPreNorm_uid82_uid85_fpHypotTest_0_q <= lowRangeB_uid82_fpHypotTest_b;
            END IF;
        END IF;
    END PROCESS;


	--soSPreNorm_uid82_uid85_fpHypotTest(BITJOIN,84)@9
    soSPreNorm_uid82_uid85_fpHypotTest_q <= sumAHighB_uid84_fpHypotTest_q & reg_lowRangeB_uid82_fpHypotTest_0_to_soSPreNorm_uid82_uid85_fpHypotTest_0_q;

	--FullSumAB25_uid86_fpHypotTest(BITSELECT,85)@9
    FullSumAB25_uid86_fpHypotTest_in <= soSPreNorm_uid82_uid85_fpHypotTest_q;
    FullSumAB25_uid86_fpHypotTest_b <= FullSumAB25_uid86_fpHypotTest_in(25 downto 25);

	--soSRangeHigh_uid87_fpHypotTest(BITSELECT,86)@9
    soSRangeHigh_uid87_fpHypotTest_in <= soSPreNorm_uid82_uid85_fpHypotTest_q(24 downto 0);
    soSRangeHigh_uid87_fpHypotTest_b <= soSRangeHigh_uid87_fpHypotTest_in(24 downto 1);

	--soSRangeLow_uid88_fpHypotTest(BITSELECT,87)@9
    soSRangeLow_uid88_fpHypotTest_in <= soSPreNorm_uid82_uid85_fpHypotTest_q(23 downto 0);
    soSRangeLow_uid88_fpHypotTest_b <= soSRangeLow_uid88_fpHypotTest_in(23 downto 0);

	--resFracNorm_uid89_fpHypotTest(MUX,88)@9
    resFracNorm_uid89_fpHypotTest_s <= FullSumAB25_uid86_fpHypotTest_b;
    resFracNorm_uid89_fpHypotTest: PROCESS (resFracNorm_uid89_fpHypotTest_s, en, soSRangeLow_uid88_fpHypotTest_b, soSRangeHigh_uid87_fpHypotTest_b)
    BEGIN
            CASE resFracNorm_uid89_fpHypotTest_s IS
                  WHEN "0" => resFracNorm_uid89_fpHypotTest_q <= soSRangeLow_uid88_fpHypotTest_b;
                  WHEN "1" => resFracNorm_uid89_fpHypotTest_q <= soSRangeHigh_uid87_fpHypotTest_b;
                  WHEN OTHERS => resFracNorm_uid89_fpHypotTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--normCatFracSoS_uid93_uid93_fpHypotTest(BITJOIN,92)@9
    normCatFracSoS_uid93_uid93_fpHypotTest_q <= FullSumAB25_uid86_fpHypotTest_b & resFracNorm_uid89_fpHypotTest_q;

	--reg_normCatFracSoS_uid93_uid93_fpHypotTest_0_to_expFracPostNorm_uid94_fpHypotTest_1(REG,217)@9
    reg_normCatFracSoS_uid93_uid93_fpHypotTest_0_to_expFracPostNorm_uid94_fpHypotTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_normCatFracSoS_uid93_uid93_fpHypotTest_0_to_expFracPostNorm_uid94_fpHypotTest_1_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_normCatFracSoS_uid93_uid93_fpHypotTest_0_to_expFracPostNorm_uid94_fpHypotTest_1_q <= normCatFracSoS_uid93_uid93_fpHypotTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable(LOGICAL,505)
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_a <= en;
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_q <= not ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_a;

	--ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_nor(LOGICAL,506)
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_nor_a <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_q;
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_nor_b <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_sticky_ena_q;
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_nor_q <= not (ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_nor_a or ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_nor_b);

	--ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_cmpReg(REG,504)
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_sticky_ena(REG,507)
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_nor_q = "1") THEN
                ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_sticky_ena_q <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_enaAnd(LOGICAL,508)
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_enaAnd_a <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_sticky_ena_q;
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_enaAnd_b <= en;
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_enaAnd_q <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_enaAnd_a and ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_enaAnd_b;

	--expA_uid70_fpHypotTest(MUX,69)@5
    expA_uid70_fpHypotTest_s <= expCmpGtePQ_uid61_fpHypotTest_q;
    expA_uid70_fpHypotTest: PROCESS (expA_uid70_fpHypotTest_s, en, ld_expQ_uid53_fpHypotTest_q_to_pGTEq_uid60_fpHypotTest_b_q, ld_expP_uid52_fpHypotTest_q_to_expDiffQP_uid63_fpHypotTest_b_q)
    BEGIN
            CASE expA_uid70_fpHypotTest_s IS
                  WHEN "0" => expA_uid70_fpHypotTest_q <= ld_expQ_uid53_fpHypotTest_q_to_pGTEq_uid60_fpHypotTest_b_q;
                  WHEN "1" => expA_uid70_fpHypotTest_q <= ld_expP_uid52_fpHypotTest_q_to_expDiffQP_uid63_fpHypotTest_b_q;
                  WHEN OTHERS => expA_uid70_fpHypotTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_inputreg(DELAY,498)
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 10, depth => 1 )
    PORT MAP ( xin => expA_uid70_fpHypotTest_q, xout => ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdcnt(COUNTER,500)
    -- every=1, low=0, high=1, step=1, init=1
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdcnt_i <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdcnt_i,1));


	--ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdreg(REG,501)
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdreg_q <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdmux(MUX,502)
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdmux_s <= en;
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdmux: PROCESS (ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdmux_s, ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdreg_q, ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdcnt_q)
    BEGIN
            CASE ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdmux_s IS
                  WHEN "0" => ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdmux_q <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdreg_q;
                  WHEN "1" => ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdmux_q <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem(DUALMEM,499)
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_ia <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_inputreg_q;
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_aa <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdreg_q;
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_ab <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdmux_q;
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 10,
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
        clocken1 => ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_iq,
        address_a => ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_aa,
        data_a => ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_ia
    );
    ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_reset0 <= areset;
        ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_q <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_iq(9 downto 0);

	--cstAllZWF_uid11_fpHypotTest(CONSTANT,10)
    cstAllZWF_uid11_fpHypotTest_q <= "00000000000000000000000";

	--expCatRndBit_uid91_uid92_fpHypotTest(BITJOIN,91)@9
    expCatRndBit_uid91_uid92_fpHypotTest_q <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_mem_q & cstAllZWF_uid11_fpHypotTest_q & VCC_q;

	--reg_expCatRndBit_uid91_uid92_fpHypotTest_0_to_expFracPostNorm_uid94_fpHypotTest_0(REG,216)@9
    reg_expCatRndBit_uid91_uid92_fpHypotTest_0_to_expFracPostNorm_uid94_fpHypotTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expCatRndBit_uid91_uid92_fpHypotTest_0_to_expFracPostNorm_uid94_fpHypotTest_0_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expCatRndBit_uid91_uid92_fpHypotTest_0_to_expFracPostNorm_uid94_fpHypotTest_0_q <= expCatRndBit_uid91_uid92_fpHypotTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracPostNorm_uid94_fpHypotTest(ADD,93)@10
    expFracPostNorm_uid94_fpHypotTest_a <= STD_LOGIC_VECTOR((35 downto 34 => reg_expCatRndBit_uid91_uid92_fpHypotTest_0_to_expFracPostNorm_uid94_fpHypotTest_0_q(33)) & reg_expCatRndBit_uid91_uid92_fpHypotTest_0_to_expFracPostNorm_uid94_fpHypotTest_0_q);
    expFracPostNorm_uid94_fpHypotTest_b <= STD_LOGIC_VECTOR('0' & "0000000000" & reg_normCatFracSoS_uid93_uid93_fpHypotTest_0_to_expFracPostNorm_uid94_fpHypotTest_1_q);
            expFracPostNorm_uid94_fpHypotTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostNorm_uid94_fpHypotTest_a) + SIGNED(expFracPostNorm_uid94_fpHypotTest_b));
    expFracPostNorm_uid94_fpHypotTest_q <= expFracPostNorm_uid94_fpHypotTest_o(34 downto 0);


	--expRPreSqrt_uid96_fpHypotTest(BITSELECT,95)@10
    expRPreSqrt_uid96_fpHypotTest_in <= expFracPostNorm_uid94_fpHypotTest_q(33 downto 0);
    expRPreSqrt_uid96_fpHypotTest_b <= expRPreSqrt_uid96_fpHypotTest_in(33 downto 24);

	--ExpRPreSqrt0_uid102_fpHypotTest(BITSELECT,101)@10
    ExpRPreSqrt0_uid102_fpHypotTest_in <= expRPreSqrt_uid96_fpHypotTest_b(0 downto 0);
    ExpRPreSqrt0_uid102_fpHypotTest_b <= ExpRPreSqrt0_uid102_fpHypotTest_in(0 downto 0);

	--expOddSelect_uid103_fpHypotTest(LOGICAL,102)@10
    expOddSelect_uid103_fpHypotTest_a <= ExpRPreSqrt0_uid102_fpHypotTest_b;
    expOddSelect_uid103_fpHypotTest_q <= not expOddSelect_uid103_fpHypotTest_a;

	--fracRPreSqrt_uid95_fpHypotTest(BITSELECT,94)@10
    fracRPreSqrt_uid95_fpHypotTest_in <= expFracPostNorm_uid94_fpHypotTest_q(23 downto 0);
    fracRPreSqrt_uid95_fpHypotTest_b <= fracRPreSqrt_uid95_fpHypotTest_in(23 downto 1);

	--fracXAddr_uid106_fpHypotTest(BITSELECT,105)@10
    fracXAddr_uid106_fpHypotTest_in <= fracRPreSqrt_uid95_fpHypotTest_b;
    fracXAddr_uid106_fpHypotTest_b <= fracXAddr_uid106_fpHypotTest_in(22 downto 16);

	--addrTable_uid107_fpHypotTest(BITJOIN,106)@10
    addrTable_uid107_fpHypotTest_q <= expOddSelect_uid103_fpHypotTest_q & fracXAddr_uid106_fpHypotTest_b;

	--reg_addrTable_uid107_fpHypotTest_0_to_memoryC2_uid175_sqrtTableGenerator_lutmem_0(REG,220)@10
    reg_addrTable_uid107_fpHypotTest_0_to_memoryC2_uid175_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid107_fpHypotTest_0_to_memoryC2_uid175_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid107_fpHypotTest_0_to_memoryC2_uid175_sqrtTableGenerator_lutmem_0_q <= addrTable_uid107_fpHypotTest_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid175_sqrtTableGenerator_lutmem(DUALMEM,196)@11
    memoryC2_uid175_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC2_uid175_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC2_uid175_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid107_fpHypotTest_0_to_memoryC2_uid175_sqrtTableGenerator_lutmem_0_q;
    memoryC2_uid175_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_hypot_s5_memoryC2_uid175_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid175_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid175_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid175_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC2_uid175_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC2_uid175_sqrtTableGenerator_lutmem_ia
    );
    memoryC2_uid175_sqrtTableGenerator_lutmem_reset0 <= areset;
        memoryC2_uid175_sqrtTableGenerator_lutmem_q <= memoryC2_uid175_sqrtTableGenerator_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid175_sqrtTableGenerator_lutmem_0_to_prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_1(REG,222)@13
    reg_memoryC2_uid175_sqrtTableGenerator_lutmem_0_to_prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid175_sqrtTableGenerator_lutmem_0_to_prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid175_sqrtTableGenerator_lutmem_0_to_prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_1_q <= memoryC2_uid175_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracRPreSqrt_uid95_fpHypotTest_b_to_FracRPreSqrt15dto0_uid108_fpHypotTest_a_inputreg(DELAY,509)
    ld_fracRPreSqrt_uid95_fpHypotTest_b_to_FracRPreSqrt15dto0_uid108_fpHypotTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracRPreSqrt_uid95_fpHypotTest_b, xout => ld_fracRPreSqrt_uid95_fpHypotTest_b_to_FracRPreSqrt15dto0_uid108_fpHypotTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracRPreSqrt_uid95_fpHypotTest_b_to_FracRPreSqrt15dto0_uid108_fpHypotTest_a(DELAY,360)@10
    ld_fracRPreSqrt_uid95_fpHypotTest_b_to_FracRPreSqrt15dto0_uid108_fpHypotTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => ld_fracRPreSqrt_uid95_fpHypotTest_b_to_FracRPreSqrt15dto0_uid108_fpHypotTest_a_inputreg_q, xout => ld_fracRPreSqrt_uid95_fpHypotTest_b_to_FracRPreSqrt15dto0_uid108_fpHypotTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--FracRPreSqrt15dto0_uid108_fpHypotTest(BITSELECT,107)@13
    FracRPreSqrt15dto0_uid108_fpHypotTest_in <= ld_fracRPreSqrt_uid95_fpHypotTest_b_to_FracRPreSqrt15dto0_uid108_fpHypotTest_a_q(15 downto 0);
    FracRPreSqrt15dto0_uid108_fpHypotTest_b <= FracRPreSqrt15dto0_uid108_fpHypotTest_in(15 downto 0);

	--yT1_uid176_sqrtPolynomialEvaluator(BITSELECT,175)@13
    yT1_uid176_sqrtPolynomialEvaluator_in <= FracRPreSqrt15dto0_uid108_fpHypotTest_b;
    yT1_uid176_sqrtPolynomialEvaluator_b <= yT1_uid176_sqrtPolynomialEvaluator_in(15 downto 4);

	--reg_yT1_uid176_sqrtPolynomialEvaluator_0_to_prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_0(REG,221)@13
    reg_yT1_uid176_sqrtPolynomialEvaluator_0_to_prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid176_sqrtPolynomialEvaluator_0_to_prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid176_sqrtPolynomialEvaluator_0_to_prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_0_q <= yT1_uid176_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator(MULT,188)@14
    prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_a),13)) * SIGNED(prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_b);
    prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_a <= reg_yT1_uid176_sqrtPolynomialEvaluator_0_to_prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_0_q;
                prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_b <= reg_memoryC2_uid175_sqrtTableGenerator_lutmem_0_to_prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_1_q;
                prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_q <= prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid190_pT1_uid177_sqrtPolynomialEvaluator(BITSELECT,189)@17
    prodXYTruncFR_uid190_pT1_uid177_sqrtPolynomialEvaluator_in <= prodXY_uid189_pT1_uid177_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid190_pT1_uid177_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid190_pT1_uid177_sqrtPolynomialEvaluator_in(23 downto 11);

	--highBBits_uid179_sqrtPolynomialEvaluator(BITSELECT,178)@17
    highBBits_uid179_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid190_pT1_uid177_sqrtPolynomialEvaluator_b;
    highBBits_uid179_sqrtPolynomialEvaluator_b <= highBBits_uid179_sqrtPolynomialEvaluator_in(12 downto 1);

	--ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC1_uid174_sqrtTableGenerator_lutmem_0_a(DELAY,485)@10
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC1_uid174_sqrtTableGenerator_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => addrTable_uid107_fpHypotTest_q, xout => ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC1_uid174_sqrtTableGenerator_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_addrTable_uid107_fpHypotTest_0_to_memoryC1_uid174_sqrtTableGenerator_lutmem_0(REG,223)@13
    reg_addrTable_uid107_fpHypotTest_0_to_memoryC1_uid174_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid107_fpHypotTest_0_to_memoryC1_uid174_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid107_fpHypotTest_0_to_memoryC1_uid174_sqrtTableGenerator_lutmem_0_q <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC1_uid174_sqrtTableGenerator_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid174_sqrtTableGenerator_lutmem(DUALMEM,195)@14
    memoryC1_uid174_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC1_uid174_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC1_uid174_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid107_fpHypotTest_0_to_memoryC1_uid174_sqrtTableGenerator_lutmem_0_q;
    memoryC1_uid174_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_hypot_s5_memoryC1_uid174_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid174_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid174_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid174_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC1_uid174_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC1_uid174_sqrtTableGenerator_lutmem_ia
    );
    memoryC1_uid174_sqrtTableGenerator_lutmem_reset0 <= areset;
        memoryC1_uid174_sqrtTableGenerator_lutmem_q <= memoryC1_uid174_sqrtTableGenerator_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid174_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid180_sqrtPolynomialEvaluator_0(REG,224)@16
    reg_memoryC1_uid174_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid180_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid174_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid180_sqrtPolynomialEvaluator_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid174_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid180_sqrtPolynomialEvaluator_0_q <= memoryC1_uid174_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid180_sqrtPolynomialEvaluator(ADD,179)@17
    sumAHighB_uid180_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid174_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid180_sqrtPolynomialEvaluator_0_q(20)) & reg_memoryC1_uid174_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid180_sqrtPolynomialEvaluator_0_q);
    sumAHighB_uid180_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid179_sqrtPolynomialEvaluator_b(11)) & highBBits_uid179_sqrtPolynomialEvaluator_b);
            sumAHighB_uid180_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid180_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid180_sqrtPolynomialEvaluator_b));
    sumAHighB_uid180_sqrtPolynomialEvaluator_q <= sumAHighB_uid180_sqrtPolynomialEvaluator_o(21 downto 0);


	--lowRangeB_uid178_sqrtPolynomialEvaluator(BITSELECT,177)@17
    lowRangeB_uid178_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid190_pT1_uid177_sqrtPolynomialEvaluator_b(0 downto 0);
    lowRangeB_uid178_sqrtPolynomialEvaluator_b <= lowRangeB_uid178_sqrtPolynomialEvaluator_in(0 downto 0);

	--s1_uid178_uid181_sqrtPolynomialEvaluator(BITJOIN,180)@17
    s1_uid178_uid181_sqrtPolynomialEvaluator_q <= sumAHighB_uid180_sqrtPolynomialEvaluator_q & lowRangeB_uid178_sqrtPolynomialEvaluator_b;

	--reg_s1_uid178_uid181_sqrtPolynomialEvaluator_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_1(REG,226)@17
    reg_s1_uid178_uid181_sqrtPolynomialEvaluator_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid178_uid181_sqrtPolynomialEvaluator_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid178_uid181_sqrtPolynomialEvaluator_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_1_q <= s1_uid178_uid181_sqrtPolynomialEvaluator_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_nor(LOGICAL,636)
    ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_nor_a <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_q;
    ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_nor_b <= ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_sticky_ena_q;
    ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_nor_q <= not (ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_nor_a or ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_nor_b);

	--ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_sticky_ena(REG,637)
    ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_nor_q = "1") THEN
                ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_sticky_ena_q <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_enaAnd(LOGICAL,638)
    ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_enaAnd_a <= ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_sticky_ena_q;
    ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_enaAnd_b <= en;
    ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_enaAnd_q <= ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_enaAnd_a and ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_enaAnd_b;

	--reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0(REG,225)@13
    reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q <= FracRPreSqrt15dto0_uid108_fpHypotTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_inputreg(DELAY,628)
    ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q, xout => ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem(DUALMEM,629)
    ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_ia <= ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_inputreg_q;
    ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_aa <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdreg_q;
    ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_ab <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_replace_rdmux_q;
    ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_iq,
        address_a => ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_aa,
        data_a => ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_ia
    );
    ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_reset0 <= areset;
        ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_q <= ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_iq(15 downto 0);

	--prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator(MULT,191)@18
    prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a),17)) * SIGNED(prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_b);
    prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a <= ld_reg_FracRPreSqrt15dto0_uid108_fpHypotTest_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_0_q_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_a_replace_mem_q;
                prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_b <= reg_s1_uid178_uid181_sqrtPolynomialEvaluator_0_to_prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_1_q;
                prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_q <= prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid193_pT2_uid183_sqrtPolynomialEvaluator(BITSELECT,192)@21
    prodXYTruncFR_uid193_pT2_uid183_sqrtPolynomialEvaluator_in <= prodXY_uid192_pT2_uid183_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid193_pT2_uid183_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid193_pT2_uid183_sqrtPolynomialEvaluator_in(38 downto 15);

	--highBBits_uid185_sqrtPolynomialEvaluator(BITSELECT,184)@21
    highBBits_uid185_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid193_pT2_uid183_sqrtPolynomialEvaluator_b;
    highBBits_uid185_sqrtPolynomialEvaluator_b <= highBBits_uid185_sqrtPolynomialEvaluator_in(23 downto 2);

	--ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_nor(LOGICAL,649)
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_nor_a <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_q;
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_nor_b <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_nor_q <= not (ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_nor_a or ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_nor_b);

	--ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_mem_top(CONSTANT,645)
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_mem_top_q <= "0100";

	--ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmp(LOGICAL,646)
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmp_a <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_mem_top_q;
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q);
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmp_q <= "1" when ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmp_a = ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmp_b else "0";

	--ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmpReg(REG,647)
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmpReg_q <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_sticky_ena(REG,650)
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_nor_q = "1") THEN
                ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_sticky_ena_q <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_enaAnd(LOGICAL,651)
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_enaAnd_a <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_enaAnd_b <= en;
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_enaAnd_q <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_enaAnd_a and ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_enaAnd_b;

	--ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_inputreg(DELAY,639)
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => addrTable_uid107_fpHypotTest_q, xout => ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt(COUNTER,641)
    -- every=1, low=0, high=4, step=1, init=1
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i = 3 THEN
                      ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq = '1') THEN
                        ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i,3));


	--ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdreg(REG,642)
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdmux(MUX,643)
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s <= en;
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdmux: PROCESS (ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s, ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q, ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q;
                  WHEN "1" => ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem(DUALMEM,640)
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_ia <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_inputreg_q;
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_aa <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q;
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_ab <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q;
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_iq,
        address_a => ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_aa,
        data_a => ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_ia
    );
    ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_q <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0(REG,227)@17
    reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_q <= ld_addrTable_uid107_fpHypotTest_q_to_reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid173_sqrtTableGenerator_lutmem(DUALMEM,194)@18
    memoryC0_uid173_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC0_uid173_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC0_uid173_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid107_fpHypotTest_0_to_memoryC0_uid173_sqrtTableGenerator_lutmem_0_q;
    memoryC0_uid173_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_hypot_s5_memoryC0_uid173_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid173_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid173_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid173_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC0_uid173_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC0_uid173_sqrtTableGenerator_lutmem_ia
    );
    memoryC0_uid173_sqrtTableGenerator_lutmem_reset0 <= areset;
        memoryC0_uid173_sqrtTableGenerator_lutmem_q <= memoryC0_uid173_sqrtTableGenerator_lutmem_iq(28 downto 0);

	--reg_memoryC0_uid173_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid186_sqrtPolynomialEvaluator_0(REG,228)@20
    reg_memoryC0_uid173_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid186_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid173_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid186_sqrtPolynomialEvaluator_0_q <= "00000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid173_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid186_sqrtPolynomialEvaluator_0_q <= memoryC0_uid173_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid186_sqrtPolynomialEvaluator(ADD,185)@21
    sumAHighB_uid186_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((29 downto 29 => reg_memoryC0_uid173_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid186_sqrtPolynomialEvaluator_0_q(28)) & reg_memoryC0_uid173_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid186_sqrtPolynomialEvaluator_0_q);
    sumAHighB_uid186_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid185_sqrtPolynomialEvaluator_b(21)) & highBBits_uid185_sqrtPolynomialEvaluator_b);
            sumAHighB_uid186_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid186_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid186_sqrtPolynomialEvaluator_b));
    sumAHighB_uid186_sqrtPolynomialEvaluator_q <= sumAHighB_uid186_sqrtPolynomialEvaluator_o(29 downto 0);


	--lowRangeB_uid184_sqrtPolynomialEvaluator(BITSELECT,183)@21
    lowRangeB_uid184_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid193_pT2_uid183_sqrtPolynomialEvaluator_b(1 downto 0);
    lowRangeB_uid184_sqrtPolynomialEvaluator_b <= lowRangeB_uid184_sqrtPolynomialEvaluator_in(1 downto 0);

	--s2_uid184_uid187_sqrtPolynomialEvaluator(BITJOIN,186)@21
    s2_uid184_uid187_sqrtPolynomialEvaluator_q <= sumAHighB_uid186_sqrtPolynomialEvaluator_q & lowRangeB_uid184_sqrtPolynomialEvaluator_b;

	--fracRPreInc_uid110_fpHypotTest(BITSELECT,109)@21
    fracRPreInc_uid110_fpHypotTest_in <= s2_uid184_uid187_sqrtPolynomialEvaluator_q(29 downto 0);
    fracRPreInc_uid110_fpHypotTest_b <= fracRPreInc_uid110_fpHypotTest_in(29 downto 5);

	--reg_fracRPreInc_uid110_fpHypotTest_0_to_fracRPostInc_uid111_fpHypotTest_0(REG,229)@21
    reg_fracRPreInc_uid110_fpHypotTest_0_to_fracRPostInc_uid111_fpHypotTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRPreInc_uid110_fpHypotTest_0_to_fracRPostInc_uid111_fpHypotTest_0_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRPreInc_uid110_fpHypotTest_0_to_fracRPostInc_uid111_fpHypotTest_0_q <= fracRPreInc_uid110_fpHypotTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracRPostInc_uid111_fpHypotTest(ADD,110)@22
    fracRPostInc_uid111_fpHypotTest_a <= STD_LOGIC_VECTOR("0" & reg_fracRPreInc_uid110_fpHypotTest_0_to_fracRPostInc_uid111_fpHypotTest_0_q);
    fracRPostInc_uid111_fpHypotTest_b <= STD_LOGIC_VECTOR("0000000000000000000000000" & VCC_q);
            fracRPostInc_uid111_fpHypotTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracRPostInc_uid111_fpHypotTest_a) + UNSIGNED(fracRPostInc_uid111_fpHypotTest_b));
    fracRPostInc_uid111_fpHypotTest_q <= fracRPostInc_uid111_fpHypotTest_o(25 downto 0);


	--fracRPostIncMSBU_uid113_fpHypotTest(BITSELECT,112)@22
    fracRPostIncMSBU_uid113_fpHypotTest_in <= fracRPostInc_uid111_fpHypotTest_q;
    fracRPostIncMSBU_uid113_fpHypotTest_b <= fracRPostIncMSBU_uid113_fpHypotTest_in(25 downto 25);

	--reg_fracRPostIncMSBU_uid113_fpHypotTest_0_to_expRPostInc_uid114_fpHypotTest_1(REG,230)@22
    reg_fracRPostIncMSBU_uid113_fpHypotTest_0_to_expRPostInc_uid114_fpHypotTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRPostIncMSBU_uid113_fpHypotTest_0_to_expRPostInc_uid114_fpHypotTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRPostIncMSBU_uid113_fpHypotTest_0_to_expRPostInc_uid114_fpHypotTest_1_q <= fracRPostIncMSBU_uid113_fpHypotTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_nor(LOGICAL,520)
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_nor_a <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_q;
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_nor_b <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_sticky_ena_q;
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_nor_q <= not (ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_nor_a or ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_nor_b);

	--ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_mem_top(CONSTANT,516)
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_mem_top_q <= "01000";

	--ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmp(LOGICAL,517)
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmp_a <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_mem_top_q;
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdmux_q);
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmp_q <= "1" when ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmp_a = ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmp_b else "0";

	--ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmpReg(REG,518)
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmpReg_q <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_sticky_ena(REG,521)
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_nor_q = "1") THEN
                ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_sticky_ena_q <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_enaAnd(LOGICAL,522)
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_enaAnd_a <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_sticky_ena_q;
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_enaAnd_b <= en;
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_enaAnd_q <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_enaAnd_a and ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_enaAnd_b;

	--biasP1Signal_uid99_fpHypotTest(CONSTANT,98)
    biasP1Signal_uid99_fpHypotTest_q <= "1111110";

	--reg_expRPreSqrt_uid96_fpHypotTest_0_to_expSumOfSquaresUnbiased_uid97_fpHypotTest_0(REG,218)@10
    reg_expRPreSqrt_uid96_fpHypotTest_0_to_expSumOfSquaresUnbiased_uid97_fpHypotTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPreSqrt_uid96_fpHypotTest_0_to_expSumOfSquaresUnbiased_uid97_fpHypotTest_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPreSqrt_uid96_fpHypotTest_0_to_expSumOfSquaresUnbiased_uid97_fpHypotTest_0_q <= expRPreSqrt_uid96_fpHypotTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expOddSig_uid100_fpHypotTest(ADD,99)@11
    expOddSig_uid100_fpHypotTest_a <= STD_LOGIC_VECTOR((11 downto 10 => reg_expRPreSqrt_uid96_fpHypotTest_0_to_expSumOfSquaresUnbiased_uid97_fpHypotTest_0_q(9)) & reg_expRPreSqrt_uid96_fpHypotTest_0_to_expSumOfSquaresUnbiased_uid97_fpHypotTest_0_q);
    expOddSig_uid100_fpHypotTest_b <= STD_LOGIC_VECTOR('0' & "0000" & biasP1Signal_uid99_fpHypotTest_q);
            expOddSig_uid100_fpHypotTest_o <= STD_LOGIC_VECTOR(SIGNED(expOddSig_uid100_fpHypotTest_a) + SIGNED(expOddSig_uid100_fpHypotTest_b));
    expOddSig_uid100_fpHypotTest_q <= expOddSig_uid100_fpHypotTest_o(10 downto 0);


	--expROdd_uid101_fpHypotTest(BITSELECT,100)@11
    expROdd_uid101_fpHypotTest_in <= expOddSig_uid100_fpHypotTest_q;
    expROdd_uid101_fpHypotTest_b <= expROdd_uid101_fpHypotTest_in(10 downto 1);

	--expSumOfSquaresUnbiased_uid97_fpHypotTest(ADD,96)@11
    expSumOfSquaresUnbiased_uid97_fpHypotTest_a <= STD_LOGIC_VECTOR((11 downto 10 => reg_expRPreSqrt_uid96_fpHypotTest_0_to_expSumOfSquaresUnbiased_uid97_fpHypotTest_0_q(9)) & reg_expRPreSqrt_uid96_fpHypotTest_0_to_expSumOfSquaresUnbiased_uid97_fpHypotTest_0_q);
    expSumOfSquaresUnbiased_uid97_fpHypotTest_b <= STD_LOGIC_VECTOR('0' & "0000" & bias_uid47_fpHypotTest_q);
            expSumOfSquaresUnbiased_uid97_fpHypotTest_o <= STD_LOGIC_VECTOR(SIGNED(expSumOfSquaresUnbiased_uid97_fpHypotTest_a) + SIGNED(expSumOfSquaresUnbiased_uid97_fpHypotTest_b));
    expSumOfSquaresUnbiased_uid97_fpHypotTest_q <= expSumOfSquaresUnbiased_uid97_fpHypotTest_o(10 downto 0);


	--expREven_uid98_fpHypotTest(BITSELECT,97)@11
    expREven_uid98_fpHypotTest_in <= expSumOfSquaresUnbiased_uid97_fpHypotTest_q;
    expREven_uid98_fpHypotTest_b <= expREven_uid98_fpHypotTest_in(10 downto 1);

	--ld_expOddSelect_uid103_fpHypotTest_q_to_expRMux_uid104_fpHypotTest_b(DELAY,354)@10
    ld_expOddSelect_uid103_fpHypotTest_q_to_expRMux_uid104_fpHypotTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expOddSelect_uid103_fpHypotTest_q, xout => ld_expOddSelect_uid103_fpHypotTest_q_to_expRMux_uid104_fpHypotTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expRMux_uid104_fpHypotTest(MUX,103)@11
    expRMux_uid104_fpHypotTest_s <= ld_expOddSelect_uid103_fpHypotTest_q_to_expRMux_uid104_fpHypotTest_b_q;
    expRMux_uid104_fpHypotTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRMux_uid104_fpHypotTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRMux_uid104_fpHypotTest_s IS
                      WHEN "0" => expRMux_uid104_fpHypotTest_q <= expREven_uid98_fpHypotTest_b;
                      WHEN "1" => expRMux_uid104_fpHypotTest_q <= expROdd_uid101_fpHypotTest_b;
                      WHEN OTHERS => expRMux_uid104_fpHypotTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_inputreg(DELAY,510)
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 10, depth => 1 )
    PORT MAP ( xin => expRMux_uid104_fpHypotTest_q, xout => ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt(COUNTER,512)
    -- every=1, low=0, high=8, step=1, init=1
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_i = 7 THEN
                      ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_eq = '1') THEN
                        ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_i <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_i - 8;
                    ELSE
                        ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_i <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_i,4));


	--ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdreg(REG,513)
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdreg_q <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdmux(MUX,514)
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdmux_s <= en;
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdmux: PROCESS (ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdmux_s, ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdreg_q, ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdmux_q <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdreg_q;
                  WHEN "1" => ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdmux_q <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem(DUALMEM,511)
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_ia <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_inputreg_q;
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_aa <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdreg_q;
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_ab <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_rdmux_q;
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 10,
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
        clocken1 => ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_iq,
        address_a => ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_aa,
        data_a => ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_ia
    );
    ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_reset0 <= areset;
        ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_q <= ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_iq(9 downto 0);

	--expRPostInc_uid114_fpHypotTest(ADD,113)@23
    expRPostInc_uid114_fpHypotTest_a <= STD_LOGIC_VECTOR((11 downto 10 => ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_q(9)) & ld_expRMux_uid104_fpHypotTest_q_to_expRPostInc_uid114_fpHypotTest_a_replace_mem_q);
    expRPostInc_uid114_fpHypotTest_b <= STD_LOGIC_VECTOR('0' & "0000000000" & reg_fracRPostIncMSBU_uid113_fpHypotTest_0_to_expRPostInc_uid114_fpHypotTest_1_q);
            expRPostInc_uid114_fpHypotTest_o <= STD_LOGIC_VECTOR(SIGNED(expRPostInc_uid114_fpHypotTest_a) + SIGNED(expRPostInc_uid114_fpHypotTest_b));
    expRPostInc_uid114_fpHypotTest_q <= expRPostInc_uid114_fpHypotTest_o(10 downto 0);


	--expRPreExc_uid139_fpHypotTest(BITSELECT,138)@23
    expRPreExc_uid139_fpHypotTest_in <= expRPostInc_uid114_fpHypotTest_q(7 downto 0);
    expRPreExc_uid139_fpHypotTest_b <= expRPreExc_uid139_fpHypotTest_in(7 downto 0);

	--ld_expRPreExc_uid139_fpHypotTest_b_to_expRPostExc_uid141_fpHypotTest_d(DELAY,404)@23
    ld_expRPreExc_uid139_fpHypotTest_b_to_expRPostExc_uid141_fpHypotTest_d : dspba_delay
    GENERIC MAP ( width => 8, depth => 2 )
    PORT MAP ( xin => expRPreExc_uid139_fpHypotTest_b, xout => ld_expRPreExc_uid139_fpHypotTest_b_to_expRPostExc_uid141_fpHypotTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--cstAllZWE_uid12_fpHypotTest(CONSTANT,11)
    cstAllZWE_uid12_fpHypotTest_q <= "00000000";

	--ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_nor(LOGICAL,624)
    ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_nor_a <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_q;
    ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_nor_b <= ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_sticky_ena_q;
    ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_nor_q <= not (ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_nor_a or ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_nor_b);

	--ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_mem_top(CONSTANT,529)
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_mem_top_q <= "010101";

	--ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmp(LOGICAL,530)
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmp_a <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_mem_top_q;
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_q);
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmp_q <= "1" when ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmp_a = ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmp_b else "0";

	--ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmpReg(REG,531)
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmpReg_q <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_sticky_ena(REG,625)
    ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_nor_q = "1") THEN
                ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_sticky_ena_q <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_enaAnd(LOGICAL,626)
    ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_enaAnd_a <= ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_sticky_ena_q;
    ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_enaAnd_b <= en;
    ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_enaAnd_q <= ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_enaAnd_a and ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_enaAnd_b;

	--fracXIsZero_uid18_fpHypotTest(LOGICAL,17)@0
    fracXIsZero_uid18_fpHypotTest_a <= fracX_uid8_fpHypotTest_b;
    fracXIsZero_uid18_fpHypotTest_b <= cstAllZWF_uid11_fpHypotTest_q;
    fracXIsZero_uid18_fpHypotTest_q <= "1" when fracXIsZero_uid18_fpHypotTest_a = fracXIsZero_uid18_fpHypotTest_b else "0";

	--expXIsMax_uid16_fpHypotTest(LOGICAL,15)@0
    expXIsMax_uid16_fpHypotTest_a <= expX_uid6_fpHypotTest_b;
    expXIsMax_uid16_fpHypotTest_b <= cstAllOWE_uid10_fpHypotTest_q;
    expXIsMax_uid16_fpHypotTest_q <= "1" when expXIsMax_uid16_fpHypotTest_a = expXIsMax_uid16_fpHypotTest_b else "0";

	--exc_I_uid19_fpHypotTest(LOGICAL,18)@0
    exc_I_uid19_fpHypotTest_a <= expXIsMax_uid16_fpHypotTest_q;
    exc_I_uid19_fpHypotTest_b <= fracXIsZero_uid18_fpHypotTest_q;
    exc_I_uid19_fpHypotTest_q <= exc_I_uid19_fpHypotTest_a and exc_I_uid19_fpHypotTest_b;

	--InvExc_I_uid23_fpHypotTest(LOGICAL,22)@0
    InvExc_I_uid23_fpHypotTest_a <= exc_I_uid19_fpHypotTest_q;
    InvExc_I_uid23_fpHypotTest_q <= not InvExc_I_uid23_fpHypotTest_a;

	--fracXIsZero_uid34_fpHypotTest(LOGICAL,33)@0
    fracXIsZero_uid34_fpHypotTest_a <= fracY_uid9_fpHypotTest_b;
    fracXIsZero_uid34_fpHypotTest_b <= cstAllZWF_uid11_fpHypotTest_q;
    fracXIsZero_uid34_fpHypotTest_q <= "1" when fracXIsZero_uid34_fpHypotTest_a = fracXIsZero_uid34_fpHypotTest_b else "0";

	--InvFracXIsZero_uid36_fpHypotTest(LOGICAL,35)@0
    InvFracXIsZero_uid36_fpHypotTest_a <= fracXIsZero_uid34_fpHypotTest_q;
    InvFracXIsZero_uid36_fpHypotTest_q <= not InvFracXIsZero_uid36_fpHypotTest_a;

	--expXIsMax_uid32_fpHypotTest(LOGICAL,31)@0
    expXIsMax_uid32_fpHypotTest_a <= expY_uid7_fpHypotTest_b;
    expXIsMax_uid32_fpHypotTest_b <= cstAllOWE_uid10_fpHypotTest_q;
    expXIsMax_uid32_fpHypotTest_q <= "1" when expXIsMax_uid32_fpHypotTest_a = expXIsMax_uid32_fpHypotTest_b else "0";

	--exc_N_uid37_fpHypotTest(LOGICAL,36)@0
    exc_N_uid37_fpHypotTest_a <= expXIsMax_uid32_fpHypotTest_q;
    exc_N_uid37_fpHypotTest_b <= InvFracXIsZero_uid36_fpHypotTest_q;
    exc_N_uid37_fpHypotTest_q <= exc_N_uid37_fpHypotTest_a and exc_N_uid37_fpHypotTest_b;

	--yNaNxNonInf_uid127_fpHypotTest(LOGICAL,126)@0
    yNaNxNonInf_uid127_fpHypotTest_a <= exc_N_uid37_fpHypotTest_q;
    yNaNxNonInf_uid127_fpHypotTest_b <= InvExc_I_uid23_fpHypotTest_q;
    yNaNxNonInf_uid127_fpHypotTest_q <= yNaNxNonInf_uid127_fpHypotTest_a and yNaNxNonInf_uid127_fpHypotTest_b;

	--exc_I_uid35_fpHypotTest(LOGICAL,34)@0
    exc_I_uid35_fpHypotTest_a <= expXIsMax_uid32_fpHypotTest_q;
    exc_I_uid35_fpHypotTest_b <= fracXIsZero_uid34_fpHypotTest_q;
    exc_I_uid35_fpHypotTest_q <= exc_I_uid35_fpHypotTest_a and exc_I_uid35_fpHypotTest_b;

	--InvExc_I_uid39_fpHypotTest(LOGICAL,38)@0
    InvExc_I_uid39_fpHypotTest_a <= exc_I_uid35_fpHypotTest_q;
    InvExc_I_uid39_fpHypotTest_q <= not InvExc_I_uid39_fpHypotTest_a;

	--InvFracXIsZero_uid20_fpHypotTest(LOGICAL,19)@0
    InvFracXIsZero_uid20_fpHypotTest_a <= fracXIsZero_uid18_fpHypotTest_q;
    InvFracXIsZero_uid20_fpHypotTest_q <= not InvFracXIsZero_uid20_fpHypotTest_a;

	--exc_N_uid21_fpHypotTest(LOGICAL,20)@0
    exc_N_uid21_fpHypotTest_a <= expXIsMax_uid16_fpHypotTest_q;
    exc_N_uid21_fpHypotTest_b <= InvFracXIsZero_uid20_fpHypotTest_q;
    exc_N_uid21_fpHypotTest_q <= exc_N_uid21_fpHypotTest_a and exc_N_uid21_fpHypotTest_b;

	--xNaNyNonInf_uid129_fpHypotTest(LOGICAL,128)@0
    xNaNyNonInf_uid129_fpHypotTest_a <= exc_N_uid21_fpHypotTest_q;
    xNaNyNonInf_uid129_fpHypotTest_b <= InvExc_I_uid39_fpHypotTest_q;
    xNaNyNonInf_uid129_fpHypotTest_q <= xNaNyNonInf_uid129_fpHypotTest_a and xNaNyNonInf_uid129_fpHypotTest_b;

	--excRNaN_uid130_fpHypotTest(LOGICAL,129)@0
    excRNaN_uid130_fpHypotTest_a <= xNaNyNonInf_uid129_fpHypotTest_q;
    excRNaN_uid130_fpHypotTest_b <= yNaNxNonInf_uid127_fpHypotTest_q;
    excRNaN_uid130_fpHypotTest_q <= excRNaN_uid130_fpHypotTest_a or excRNaN_uid130_fpHypotTest_b;

	--ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_inputreg(DELAY,614)
    ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => excRNaN_uid130_fpHypotTest_q, xout => ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt(COUNTER,525)
    -- every=1, low=0, high=21, step=1, init=1
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_i = 20 THEN
                      ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_eq = '1') THEN
                        ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_i <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_i - 21;
                    ELSE
                        ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_i <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_i,5));


	--ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdreg(REG,526)
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdreg_q <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux(MUX,527)
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_s <= en;
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux: PROCESS (ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_s, ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdreg_q, ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_q <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdreg_q;
                  WHEN "1" => ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_q <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem(DUALMEM,615)
    ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_ia <= ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_inputreg_q;
    ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_aa <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdreg_q;
    ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_ab <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_q;
    ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_dmem : altsyncram
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
        clocken1 => ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_iq,
        address_a => ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_aa,
        data_a => ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_ia
    );
    ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_reset0 <= areset;
        ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_q <= ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_iq(0 downto 0);

	--reg_expRPostInc_uid114_fpHypotTest_0_to_sqrtUnderflow_uid115_fpHypotTest_1(REG,231)@23
    reg_expRPostInc_uid114_fpHypotTest_0_to_sqrtUnderflow_uid115_fpHypotTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPostInc_uid114_fpHypotTest_0_to_sqrtUnderflow_uid115_fpHypotTest_1_q <= "00000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPostInc_uid114_fpHypotTest_0_to_sqrtUnderflow_uid115_fpHypotTest_1_q <= expRPostInc_uid114_fpHypotTest_q;
            END IF;
        END IF;
    END PROCESS;


	--sqrtOverflow_uid117_fpHypotTest(COMPARE,116)@24
    sqrtOverflow_uid117_fpHypotTest_cin <= GND_q;
    sqrtOverflow_uid117_fpHypotTest_a <= STD_LOGIC_VECTOR((12 downto 11 => reg_expRPostInc_uid114_fpHypotTest_0_to_sqrtUnderflow_uid115_fpHypotTest_1_q(10)) & reg_expRPostInc_uid114_fpHypotTest_0_to_sqrtUnderflow_uid115_fpHypotTest_1_q) & '0';
    sqrtOverflow_uid117_fpHypotTest_b <= STD_LOGIC_VECTOR('0' & "0000" & cstAllOWE_uid10_fpHypotTest_q) & sqrtOverflow_uid117_fpHypotTest_cin(0);
            sqrtOverflow_uid117_fpHypotTest_o <= STD_LOGIC_VECTOR(SIGNED(sqrtOverflow_uid117_fpHypotTest_a) - SIGNED(sqrtOverflow_uid117_fpHypotTest_b));
    sqrtOverflow_uid117_fpHypotTest_n(0) <= not sqrtOverflow_uid117_fpHypotTest_o(13);


	--ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_nor(LOGICAL,533)
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_nor_a <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_q;
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_nor_b <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_sticky_ena_q;
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_nor_q <= not (ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_nor_a or ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_nor_b);

	--ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_sticky_ena(REG,534)
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_nor_q = "1") THEN
                ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_sticky_ena_q <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_enaAnd(LOGICAL,535)
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_enaAnd_a <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_sticky_ena_q;
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_enaAnd_b <= en;
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_enaAnd_q <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_enaAnd_a and ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_enaAnd_b;

	--InvExc_N_uid22_fpHypotTest(LOGICAL,21)@0
    InvExc_N_uid22_fpHypotTest_a <= exc_N_uid21_fpHypotTest_q;
    InvExc_N_uid22_fpHypotTest_q <= not InvExc_N_uid22_fpHypotTest_a;

	--InvExpXIsZero_uid24_fpHypotTest(LOGICAL,23)@0
    InvExpXIsZero_uid24_fpHypotTest_a <= expXIsZero_uid14_fpHypotTest_q;
    InvExpXIsZero_uid24_fpHypotTest_q <= not InvExpXIsZero_uid24_fpHypotTest_a;

	--exc_R_uid25_fpHypotTest(LOGICAL,24)@0
    exc_R_uid25_fpHypotTest_a <= InvExpXIsZero_uid24_fpHypotTest_q;
    exc_R_uid25_fpHypotTest_b <= InvExc_I_uid23_fpHypotTest_q;
    exc_R_uid25_fpHypotTest_c <= InvExc_N_uid22_fpHypotTest_q;
    exc_R_uid25_fpHypotTest_q <= exc_R_uid25_fpHypotTest_a and exc_R_uid25_fpHypotTest_b and exc_R_uid25_fpHypotTest_c;

	--ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_inputreg(DELAY,523)
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_R_uid25_fpHypotTest_q, xout => ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem(DUALMEM,524)
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_ia <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_inputreg_q;
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_aa <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdreg_q;
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_ab <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_q;
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_iq,
        address_a => ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_aa,
        data_a => ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_ia
    );
    ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_reset0 <= areset;
        ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_q <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_iq(0 downto 0);

	--ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_nor(LOGICAL,585)
    ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_nor_a <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_q;
    ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_nor_b <= ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_sticky_ena_q;
    ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_nor_q <= not (ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_nor_a or ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_nor_b);

	--ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_mem_top(CONSTANT,568)
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_mem_top_q <= "010100";

	--ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmp(LOGICAL,569)
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmp_a <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_mem_top_q;
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdmux_q);
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmp_q <= "1" when ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmp_a = ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmp_b else "0";

	--ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmpReg(REG,570)
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmpReg_q <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_sticky_ena(REG,586)
    ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_nor_q = "1") THEN
                ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_sticky_ena_q <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_enaAnd(LOGICAL,587)
    ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_enaAnd_a <= ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_sticky_ena_q;
    ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_enaAnd_b <= en;
    ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_enaAnd_q <= ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_enaAnd_a and ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_enaAnd_b;

	--InvExc_N_uid38_fpHypotTest(LOGICAL,37)@0
    InvExc_N_uid38_fpHypotTest_a <= exc_N_uid37_fpHypotTest_q;
    InvExc_N_uid38_fpHypotTest_q <= not InvExc_N_uid38_fpHypotTest_a;

	--InvExpXIsZero_uid40_fpHypotTest(LOGICAL,39)@0
    InvExpXIsZero_uid40_fpHypotTest_a <= expXIsZero_uid30_fpHypotTest_q;
    InvExpXIsZero_uid40_fpHypotTest_q <= not InvExpXIsZero_uid40_fpHypotTest_a;

	--exc_R_uid41_fpHypotTest(LOGICAL,40)@0
    exc_R_uid41_fpHypotTest_a <= InvExpXIsZero_uid40_fpHypotTest_q;
    exc_R_uid41_fpHypotTest_b <= InvExc_I_uid39_fpHypotTest_q;
    exc_R_uid41_fpHypotTest_c <= InvExc_N_uid38_fpHypotTest_q;
    exc_R_uid41_fpHypotTest_q <= exc_R_uid41_fpHypotTest_a and exc_R_uid41_fpHypotTest_b and exc_R_uid41_fpHypotTest_c;

	--yRegOrZero_uid123_fpHypotTest(LOGICAL,122)@0
    yRegOrZero_uid123_fpHypotTest_a <= exc_R_uid41_fpHypotTest_q;
    yRegOrZero_uid123_fpHypotTest_b <= expXIsZero_uid30_fpHypotTest_q;
    yRegOrZero_uid123_fpHypotTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            yRegOrZero_uid123_fpHypotTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            yRegOrZero_uid123_fpHypotTest_q <= yRegOrZero_uid123_fpHypotTest_a or yRegOrZero_uid123_fpHypotTest_b;
        END IF;
        END IF;
    END PROCESS;



	--ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_inputreg(DELAY,575)
    ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => yRegOrZero_uid123_fpHypotTest_q, xout => ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt(COUNTER,564)
    -- every=1, low=0, high=20, step=1, init=1
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_i = 19 THEN
                      ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_eq = '1') THEN
                        ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_i <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_i - 20;
                    ELSE
                        ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_i <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_i,5));


	--ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdreg(REG,565)
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdreg_q <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdmux(MUX,566)
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdmux_s <= en;
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdmux: PROCESS (ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdmux_s, ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdreg_q, ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdmux_q <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdreg_q;
                  WHEN "1" => ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdmux_q <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem(DUALMEM,576)
    ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_ia <= ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_inputreg_q;
    ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_aa <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdreg_q;
    ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_ab <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdmux_q;
    ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_iq,
        address_a => ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_aa,
        data_a => ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_ia
    );
    ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_reset0 <= areset;
        ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_q <= ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_iq(0 downto 0);

	--yRegOrZeroXRegOvf_uid124_fpHypotTest(LOGICAL,123)@24
    yRegOrZeroXRegOvf_uid124_fpHypotTest_a <= ld_yRegOrZero_uid123_fpHypotTest_q_to_yRegOrZeroXRegOvf_uid124_fpHypotTest_a_replace_mem_q;
    yRegOrZeroXRegOvf_uid124_fpHypotTest_b <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_q;
    yRegOrZeroXRegOvf_uid124_fpHypotTest_c <= sqrtOverflow_uid117_fpHypotTest_n;
    yRegOrZeroXRegOvf_uid124_fpHypotTest_q <= yRegOrZeroXRegOvf_uid124_fpHypotTest_a and yRegOrZeroXRegOvf_uid124_fpHypotTest_b and yRegOrZeroXRegOvf_uid124_fpHypotTest_c;

	--ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_nor(LOGICAL,546)
    ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_nor_a <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_q;
    ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_nor_b <= ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_sticky_ena_q;
    ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_nor_q <= not (ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_nor_a or ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_nor_b);

	--ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_sticky_ena(REG,547)
    ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_nor_q = "1") THEN
                ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_sticky_ena_q <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_enaAnd(LOGICAL,548)
    ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_enaAnd_a <= ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_sticky_ena_q;
    ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_enaAnd_b <= en;
    ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_enaAnd_q <= ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_enaAnd_a and ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_enaAnd_b;

	--ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_inputreg(DELAY,536)
    ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_R_uid41_fpHypotTest_q, xout => ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem(DUALMEM,537)
    ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_ia <= ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_inputreg_q;
    ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_aa <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdreg_q;
    ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_ab <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_q;
    ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_dmem : altsyncram
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
        clocken1 => ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_iq,
        address_a => ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_aa,
        data_a => ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_ia
    );
    ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_reset0 <= areset;
        ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_q <= ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_iq(0 downto 0);

	--ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_nor(LOGICAL,572)
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_nor_a <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_q;
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_nor_b <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_sticky_ena_q;
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_nor_q <= not (ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_nor_a or ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_nor_b);

	--ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_sticky_ena(REG,573)
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_nor_q = "1") THEN
                ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_sticky_ena_q <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_enaAnd(LOGICAL,574)
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_enaAnd_a <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_sticky_ena_q;
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_enaAnd_b <= en;
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_enaAnd_q <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_enaAnd_a and ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_enaAnd_b;

	--xRegOrZero_uid121_fpHypotTest(LOGICAL,120)@0
    xRegOrZero_uid121_fpHypotTest_a <= exc_R_uid25_fpHypotTest_q;
    xRegOrZero_uid121_fpHypotTest_b <= expXIsZero_uid14_fpHypotTest_q;
    xRegOrZero_uid121_fpHypotTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xRegOrZero_uid121_fpHypotTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            xRegOrZero_uid121_fpHypotTest_q <= xRegOrZero_uid121_fpHypotTest_a or xRegOrZero_uid121_fpHypotTest_b;
        END IF;
        END IF;
    END PROCESS;



	--ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_inputreg(DELAY,562)
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xRegOrZero_uid121_fpHypotTest_q, xout => ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem(DUALMEM,563)
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_ia <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_inputreg_q;
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_aa <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdreg_q;
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_ab <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_rdmux_q;
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_iq,
        address_a => ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_aa,
        data_a => ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_ia
    );
    ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_reset0 <= areset;
        ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_q <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_iq(0 downto 0);

	--xRegOrZeroYRegOvf_uid122_fpHypotTest(LOGICAL,121)@24
    xRegOrZeroYRegOvf_uid122_fpHypotTest_a <= ld_xRegOrZero_uid121_fpHypotTest_q_to_xRegOrZeroYRegOvf_uid122_fpHypotTest_a_replace_mem_q;
    xRegOrZeroYRegOvf_uid122_fpHypotTest_b <= ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_q;
    xRegOrZeroYRegOvf_uid122_fpHypotTest_c <= sqrtOverflow_uid117_fpHypotTest_n;
    xRegOrZeroYRegOvf_uid122_fpHypotTest_q <= xRegOrZeroYRegOvf_uid122_fpHypotTest_a and xRegOrZeroYRegOvf_uid122_fpHypotTest_b and xRegOrZeroYRegOvf_uid122_fpHypotTest_c;

	--ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_nor(LOGICAL,611)
    ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_nor_a <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_q;
    ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_nor_b <= ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_sticky_ena_q;
    ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_nor_q <= not (ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_nor_a or ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_nor_b);

	--ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_sticky_ena(REG,612)
    ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_nor_q = "1") THEN
                ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_sticky_ena_q <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_enaAnd(LOGICAL,613)
    ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_enaAnd_a <= ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_sticky_ena_q;
    ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_enaAnd_b <= en;
    ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_enaAnd_q <= ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_enaAnd_a and ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_enaAnd_b;

	--ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_inputreg(DELAY,601)
    ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_I_uid35_fpHypotTest_q, xout => ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem(DUALMEM,602)
    ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_ia <= ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_inputreg_q;
    ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_aa <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdreg_q;
    ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_ab <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_q;
    ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_iq,
        address_a => ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_aa,
        data_a => ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_ia
    );
    ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_reset0 <= areset;
        ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_q <= ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_iq(0 downto 0);

	--ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_nor(LOGICAL,598)
    ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_nor_a <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_q;
    ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_nor_b <= ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_sticky_ena_q;
    ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_nor_q <= not (ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_nor_a or ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_nor_b);

	--ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_sticky_ena(REG,599)
    ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_nor_q = "1") THEN
                ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_sticky_ena_q <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_enaAnd(LOGICAL,600)
    ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_enaAnd_a <= ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_sticky_ena_q;
    ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_enaAnd_b <= en;
    ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_enaAnd_q <= ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_enaAnd_a and ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_enaAnd_b;

	--ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_inputreg(DELAY,588)
    ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_I_uid19_fpHypotTest_q, xout => ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem(DUALMEM,589)
    ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_ia <= ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_inputreg_q;
    ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_aa <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdreg_q;
    ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_ab <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_q;
    ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_iq,
        address_a => ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_aa,
        data_a => ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_ia
    );
    ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_reset0 <= areset;
        ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_q <= ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_iq(0 downto 0);

	--excRInf_uid125_fpHypotTest(LOGICAL,124)@24
    excRInf_uid125_fpHypotTest_a <= ld_exc_I_uid19_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_a_replace_mem_q;
    excRInf_uid125_fpHypotTest_b <= ld_exc_I_uid35_fpHypotTest_q_to_excRInf_uid125_fpHypotTest_b_replace_mem_q;
    excRInf_uid125_fpHypotTest_c <= xRegOrZeroYRegOvf_uid122_fpHypotTest_q;
    excRInf_uid125_fpHypotTest_d <= yRegOrZeroXRegOvf_uid124_fpHypotTest_q;
    excRInf_uid125_fpHypotTest_q <= excRInf_uid125_fpHypotTest_a or excRInf_uid125_fpHypotTest_b or excRInf_uid125_fpHypotTest_c or excRInf_uid125_fpHypotTest_d;

	--sqrtUnderflow_uid115_fpHypotTest(COMPARE,114)@24
    sqrtUnderflow_uid115_fpHypotTest_cin <= GND_q;
    sqrtUnderflow_uid115_fpHypotTest_a <= STD_LOGIC_VECTOR('0' & "00000000000" & GND_q) & '0';
    sqrtUnderflow_uid115_fpHypotTest_b <= STD_LOGIC_VECTOR((12 downto 11 => reg_expRPostInc_uid114_fpHypotTest_0_to_sqrtUnderflow_uid115_fpHypotTest_1_q(10)) & reg_expRPostInc_uid114_fpHypotTest_0_to_sqrtUnderflow_uid115_fpHypotTest_1_q) & sqrtUnderflow_uid115_fpHypotTest_cin(0);
            sqrtUnderflow_uid115_fpHypotTest_o <= STD_LOGIC_VECTOR(SIGNED(sqrtUnderflow_uid115_fpHypotTest_a) - SIGNED(sqrtUnderflow_uid115_fpHypotTest_b));
    sqrtUnderflow_uid115_fpHypotTest_n(0) <= not sqrtUnderflow_uid115_fpHypotTest_o(13);


	--excXYRUdf_uid119_fpHypotTest(LOGICAL,118)@24
    excXYRUdf_uid119_fpHypotTest_a <= sqrtUnderflow_uid115_fpHypotTest_n;
    excXYRUdf_uid119_fpHypotTest_b <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_mem_q;
    excXYRUdf_uid119_fpHypotTest_c <= ld_exc_R_uid41_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_c_replace_mem_q;
    excXYRUdf_uid119_fpHypotTest_q <= excXYRUdf_uid119_fpHypotTest_a and excXYRUdf_uid119_fpHypotTest_b and excXYRUdf_uid119_fpHypotTest_c;

	--ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_nor(LOGICAL,559)
    ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_nor_a <= ld_expA_uid70_fpHypotTest_q_to_expCatRndBit_uid91_uid92_fpHypotTest_c_notEnable_q;
    ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_nor_b <= ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_sticky_ena_q;
    ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_nor_q <= not (ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_nor_a or ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_nor_b);

	--ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_sticky_ena(REG,560)
    ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_nor_q = "1") THEN
                ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_sticky_ena_q <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_enaAnd(LOGICAL,561)
    ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_enaAnd_a <= ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_sticky_ena_q;
    ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_enaAnd_b <= en;
    ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_enaAnd_q <= ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_enaAnd_a and ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_enaAnd_b;

	--excXYZ_uid118_fpHypotTest(LOGICAL,117)@0
    excXYZ_uid118_fpHypotTest_a <= expXIsZero_uid14_fpHypotTest_q;
    excXYZ_uid118_fpHypotTest_b <= expXIsZero_uid30_fpHypotTest_q;
    excXYZ_uid118_fpHypotTest_q <= excXYZ_uid118_fpHypotTest_a and excXYZ_uid118_fpHypotTest_b;

	--ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_inputreg(DELAY,549)
    ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => excXYZ_uid118_fpHypotTest_q, xout => ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem(DUALMEM,550)
    ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_ia <= ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_inputreg_q;
    ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_aa <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdreg_q;
    ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_ab <= ld_exc_R_uid25_fpHypotTest_q_to_excXYRUdf_uid119_fpHypotTest_b_replace_rdmux_q;
    ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_iq,
        address_a => ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_aa,
        data_a => ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_ia
    );
    ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_reset0 <= areset;
        ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_q <= ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_iq(0 downto 0);

	--excRZero_uid120_fpHypotTest(LOGICAL,119)@24
    excRZero_uid120_fpHypotTest_a <= ld_excXYZ_uid118_fpHypotTest_q_to_excRZero_uid120_fpHypotTest_a_replace_mem_q;
    excRZero_uid120_fpHypotTest_b <= excXYRUdf_uid119_fpHypotTest_q;
    excRZero_uid120_fpHypotTest_q <= excRZero_uid120_fpHypotTest_a or excRZero_uid120_fpHypotTest_b;

	--excSelBits_uid131_fpHypotTest(BITJOIN,130)@24
    excSelBits_uid131_fpHypotTest_q <= ld_excRNaN_uid130_fpHypotTest_q_to_excSelBits_uid131_fpHypotTest_c_replace_mem_q & excRInf_uid125_fpHypotTest_q & excRZero_uid120_fpHypotTest_q;

	--reg_excSelBits_uid131_fpHypotTest_0_to_outMuxSelEnc_uid132_fpHypotTest_0(REG,233)@24
    reg_excSelBits_uid131_fpHypotTest_0_to_outMuxSelEnc_uid132_fpHypotTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excSelBits_uid131_fpHypotTest_0_to_outMuxSelEnc_uid132_fpHypotTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excSelBits_uid131_fpHypotTest_0_to_outMuxSelEnc_uid132_fpHypotTest_0_q <= excSelBits_uid131_fpHypotTest_q;
            END IF;
        END IF;
    END PROCESS;


	--outMuxSelEnc_uid132_fpHypotTest(LOOKUP,131)@25
    outMuxSelEnc_uid132_fpHypotTest: PROCESS (reg_excSelBits_uid131_fpHypotTest_0_to_outMuxSelEnc_uid132_fpHypotTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_excSelBits_uid131_fpHypotTest_0_to_outMuxSelEnc_uid132_fpHypotTest_0_q) IS
                WHEN "000" =>  outMuxSelEnc_uid132_fpHypotTest_q <= "01";
                WHEN "001" =>  outMuxSelEnc_uid132_fpHypotTest_q <= "00";
                WHEN "010" =>  outMuxSelEnc_uid132_fpHypotTest_q <= "10";
                WHEN "011" =>  outMuxSelEnc_uid132_fpHypotTest_q <= "01";
                WHEN "100" =>  outMuxSelEnc_uid132_fpHypotTest_q <= "11";
                WHEN "101" =>  outMuxSelEnc_uid132_fpHypotTest_q <= "01";
                WHEN "110" =>  outMuxSelEnc_uid132_fpHypotTest_q <= "01";
                WHEN "111" =>  outMuxSelEnc_uid132_fpHypotTest_q <= "01";
                WHEN OTHERS =>
                    outMuxSelEnc_uid132_fpHypotTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xIn(GPIN,3)@0

	--expRPostExc_uid141_fpHypotTest(MUX,140)@25
    expRPostExc_uid141_fpHypotTest_s <= outMuxSelEnc_uid132_fpHypotTest_q;
    expRPostExc_uid141_fpHypotTest: PROCESS (expRPostExc_uid141_fpHypotTest_s, en, cstAllZWE_uid12_fpHypotTest_q, ld_expRPreExc_uid139_fpHypotTest_b_to_expRPostExc_uid141_fpHypotTest_d_q, cstAllOWE_uid10_fpHypotTest_q, cstAllOWE_uid10_fpHypotTest_q)
    BEGIN
            CASE expRPostExc_uid141_fpHypotTest_s IS
                  WHEN "00" => expRPostExc_uid141_fpHypotTest_q <= cstAllZWE_uid12_fpHypotTest_q;
                  WHEN "01" => expRPostExc_uid141_fpHypotTest_q <= ld_expRPreExc_uid139_fpHypotTest_b_to_expRPostExc_uid141_fpHypotTest_d_q;
                  WHEN "10" => expRPostExc_uid141_fpHypotTest_q <= cstAllOWE_uid10_fpHypotTest_q;
                  WHEN "11" => expRPostExc_uid141_fpHypotTest_q <= cstAllOWE_uid10_fpHypotTest_q;
                  WHEN OTHERS => expRPostExc_uid141_fpHypotTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--NaNFracRPostExc_uid133_fpHypotTest(CONSTANT,132)
    NaNFracRPostExc_uid133_fpHypotTest_q <= "00000000000000000000001";

	--fracR_uid112_fpHypotTest(BITSELECT,111)@22
    fracR_uid112_fpHypotTest_in <= fracRPostInc_uid111_fpHypotTest_q(23 downto 0);
    fracR_uid112_fpHypotTest_b <= fracR_uid112_fpHypotTest_in(23 downto 1);

	--ld_fracR_uid112_fpHypotTest_b_to_fracRPostExc_uid136_fpHypotTest_d_inputreg(DELAY,627)
    ld_fracR_uid112_fpHypotTest_b_to_fracRPostExc_uid136_fpHypotTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracR_uid112_fpHypotTest_b, xout => ld_fracR_uid112_fpHypotTest_b_to_fracRPostExc_uid136_fpHypotTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracR_uid112_fpHypotTest_b_to_fracRPostExc_uid136_fpHypotTest_d(DELAY,401)@22
    ld_fracR_uid112_fpHypotTest_b_to_fracRPostExc_uid136_fpHypotTest_d : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => ld_fracR_uid112_fpHypotTest_b_to_fracRPostExc_uid136_fpHypotTest_d_inputreg_q, xout => ld_fracR_uid112_fpHypotTest_b_to_fracRPostExc_uid136_fpHypotTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid136_fpHypotTest(MUX,135)@25
    fracRPostExc_uid136_fpHypotTest_s <= outMuxSelEnc_uid132_fpHypotTest_q;
    fracRPostExc_uid136_fpHypotTest: PROCESS (fracRPostExc_uid136_fpHypotTest_s, en, cstAllZWF_uid11_fpHypotTest_q, ld_fracR_uid112_fpHypotTest_b_to_fracRPostExc_uid136_fpHypotTest_d_q, cstAllZWF_uid11_fpHypotTest_q, NaNFracRPostExc_uid133_fpHypotTest_q)
    BEGIN
            CASE fracRPostExc_uid136_fpHypotTest_s IS
                  WHEN "00" => fracRPostExc_uid136_fpHypotTest_q <= cstAllZWF_uid11_fpHypotTest_q;
                  WHEN "01" => fracRPostExc_uid136_fpHypotTest_q <= ld_fracR_uid112_fpHypotTest_b_to_fracRPostExc_uid136_fpHypotTest_d_q;
                  WHEN "10" => fracRPostExc_uid136_fpHypotTest_q <= cstAllZWF_uid11_fpHypotTest_q;
                  WHEN "11" => fracRPostExc_uid136_fpHypotTest_q <= NaNFracRPostExc_uid133_fpHypotTest_q;
                  WHEN OTHERS => fracRPostExc_uid136_fpHypotTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RHypot_uid142_fpHypotTest(BITJOIN,141)@25
    RHypot_uid142_fpHypotTest_q <= GND_q & expRPostExc_uid141_fpHypotTest_q & fracRPostExc_uid136_fpHypotTest_q;

	--xOut(GPOUT,4)@25
    q <= RHypot_uid142_fpHypotTest_q;


end normal;
