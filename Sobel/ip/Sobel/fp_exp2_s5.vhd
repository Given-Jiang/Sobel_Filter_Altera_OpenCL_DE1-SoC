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

-- VHDL created from fp_exp2_s5
-- VHDL created on Fri Apr  5 13:35:21 2013


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

entity fp_exp2_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_exp2_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstBias_uid9_fpExp2Test_q : std_logic_vector (7 downto 0);
    signal cstZeroWE_uid13_fpExp2Test_q : std_logic_vector (7 downto 0);
    signal cstBiasPWE_uid14_fpExp2Test_q : std_logic_vector (7 downto 0);
    signal cstBiasPWE_uid15_fpExp2Test_q : std_logic_vector (5 downto 0);
    signal cstAllOWE_uid16_fpExp2Test_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid17_fpExp2Test_q : std_logic_vector (22 downto 0);
    signal oneFracRPostExc2_uid71_fpExp2Test_q : std_logic_vector (22 downto 0);
    signal z_uid82_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (15 downto 0);
    signal z_uid86_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (31 downto 0);
    signal rightShiftStage0Idx3_uid90_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (32 downto 0);
    signal rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(32 downto 0);
    signal rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(32 downto 0);
    signal rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(32 downto 0);
    signal rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(32 downto 0);
    signal z_uid94_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(3 downto 0);
    signal rightShiftStage1Idx2Pad8_uid99_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid99_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid99_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx2Pad8_uid99_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(7 downto 0);
    signal z_uid102_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid103_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid103_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid103_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(11 downto 0);
    signal rightShiftStage1Idx3Pad12_uid103_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(11 downto 0);
    signal rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(0 downto 0);
    signal rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal z_uid112_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(1 downto 0);
    signal z_uid116_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid117_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid117_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid117_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(2 downto 0);
    signal rightShiftStage2Idx3Pad3_uid117_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(2 downto 0);
    signal memoryC0_uid123_exp2TabGen_q : std_logic_vector(27 downto 0);
    signal memoryC1_uid125_exp2TabGen_q : std_logic_vector(20 downto 0);
    signal memoryC2_uid127_exp2TabGen_q : std_logic_vector(11 downto 0);
    signal prodXY_uid142_pT1_uid130_exp2PolyEval_a : std_logic_vector (11 downto 0);
    signal prodXY_uid142_pT1_uid130_exp2PolyEval_b : std_logic_vector (11 downto 0);
    signal prodXY_uid142_pT1_uid130_exp2PolyEval_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid142_pT1_uid130_exp2PolyEval_pr : SIGNED (24 downto 0);
    signal prodXY_uid142_pT1_uid130_exp2PolyEval_q : std_logic_vector (23 downto 0);
    signal prodXY_uid145_pT2_uid136_exp2PolyEval_a : std_logic_vector (15 downto 0);
    signal prodXY_uid145_pT2_uid136_exp2PolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid145_pT2_uid136_exp2PolyEval_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid145_pT2_uid136_exp2PolyEval_pr : SIGNED (39 downto 0);
    signal prodXY_uid145_pT2_uid136_exp2PolyEval_q : std_logic_vector (38 downto 0);
    signal reg_shiftValuePreSat_uid38_fpExp2Test_0_to_shiftUdf_uid40_fpExp2Test_0_q : std_logic_vector (8 downto 0);
    signal reg_rightShiftStageSel5Dto4_uid92_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_1_q : std_logic_vector (1 downto 0);
    signal reg_fxpInPreAlign_uid37_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_2_q : std_logic_vector (32 downto 0);
    signal reg_rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_3_q : std_logic_vector (32 downto 0);
    signal reg_rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_4_q : std_logic_vector (32 downto 0);
    signal reg_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_2_q : std_logic_vector (32 downto 0);
    signal reg_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_2_q : std_logic_vector (32 downto 0);
    signal reg_ePre_uid44_fpExp2Test_0_to_expRPostBiasPreExc_uid51_fpExp2Test_0_q : std_logic_vector (9 downto 0);
    signal reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1_q : std_logic_vector (10 downto 0);
    signal reg_concExc_uid69_fpExp2Test_0_to_excREnc_uid70_fpExp2Test_0_q : std_logic_vector (2 downto 0);
    signal reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid127_exp2TabGen_0_q : std_logic_vector (6 downto 0);
    signal reg_yT1_uid129_exp2PolyEval_0_to_prodXY_uid142_pT1_uid130_exp2PolyEval_0_q : std_logic_vector (11 downto 0);
    signal reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q : std_logic_vector (15 downto 0);
    signal reg_s1_uid131_uid134_exp2PolyEval_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_q : std_logic_vector (6 downto 0);
    signal ld_frac_uid23_fpExp2Test_b_to_oFracX_uid33_uid33_fpExp2Test_a_q : std_logic_vector (22 downto 0);
    signal ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_shiftValuePreSatRed_uid41_fpExp2Test_b_to_shiftVal_uid42_fpExp2Test_c_q : std_logic_vector (5 downto 0);
    signal ld_y_uid45_fpExp2Test_b_to_yPPolyEval_uid48_fpExp2Test_a_q : std_logic_vector (22 downto 0);
    signal ld_expOvfInitial_uid39_fpExp2Test_b_to_InvExpOvfInitial_uid59_fpExp2Test_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid31_fpExp2Test_q_to_regXAndUdf_uid60_fpExp2Test_a_q : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid58_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_negInf_uid57_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_posInf_uid67_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_a_q : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid63_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid27_fpExp2Test_q_to_concExc_uid69_fpExp2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_excREnc_uid70_fpExp2Test_q_to_fracRPostExc_uid74_fpExp2Test_b_q : std_logic_vector (1 downto 0);
    signal ld_expR_uid56_fpExp2Test_b_to_expRPostExc_uid78_fpExp2Test_d_q : std_logic_vector (7 downto 0);
    signal ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage032dto4_uid96_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_a_q : std_logic_vector (28 downto 0);
    signal ld_RightShiftStage032dto8_uid100_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_a_q : std_logic_vector (24 downto 0);
    signal ld_RightShiftStage032dto12_uid104_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_a_q : std_logic_vector (20 downto 0);
    signal ld_rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_q_to_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage132dto2_uid114_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_a_q : std_logic_vector (30 downto 0);
    signal ld_RightShiftStage132dto3_uid118_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_a_q : std_logic_vector (29 downto 0);
    signal ld_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_q_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_d_q : std_logic_vector (32 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid125_exp2TabGen_0_q_to_memoryC1_uid125_exp2TabGen_a_q : std_logic_vector (6 downto 0);
    signal ld_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_b_to_reg_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_a_q : std_logic_vector (1 downto 0);
    signal ld_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_b_to_reg_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_a_q : std_logic_vector (1 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_reset0 : std_logic;
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena_q : signal is true;
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_inputreg_q : std_logic_vector (15 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_ia : std_logic_vector (15 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_iq : std_logic_vector (15 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_q : std_logic_vector (15 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_sticky_ena_q : signal is true;
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_inputreg_q : std_logic_vector (6 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_reset0 : std_logic;
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_eq : std_logic;
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_sticky_ena_q : signal is true;
    signal shiftUdf_uid40_fpExp2Test_a : std_logic_vector(11 downto 0);
    signal shiftUdf_uid40_fpExp2Test_b : std_logic_vector(11 downto 0);
    signal shiftUdf_uid40_fpExp2Test_o : std_logic_vector (11 downto 0);
    signal shiftUdf_uid40_fpExp2Test_cin : std_logic_vector (0 downto 0);
    signal shiftUdf_uid40_fpExp2Test_n : std_logic_vector (0 downto 0);
    signal expUdf_uid53_fpExp2Test_a : std_logic_vector(13 downto 0);
    signal expUdf_uid53_fpExp2Test_b : std_logic_vector(13 downto 0);
    signal expUdf_uid53_fpExp2Test_o : std_logic_vector (13 downto 0);
    signal expUdf_uid53_fpExp2Test_cin : std_logic_vector (0 downto 0);
    signal expUdf_uid53_fpExp2Test_n : std_logic_vector (0 downto 0);
    signal expOvf_uid55_fpExp2Test_a : std_logic_vector(13 downto 0);
    signal expOvf_uid55_fpExp2Test_b : std_logic_vector(13 downto 0);
    signal expOvf_uid55_fpExp2Test_o : std_logic_vector (13 downto 0);
    signal expOvf_uid55_fpExp2Test_cin : std_logic_vector (0 downto 0);
    signal expOvf_uid55_fpExp2Test_n : std_logic_vector (0 downto 0);
    signal InvExpOvfInitial_uid59_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal InvExpOvfInitial_uid59_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal oFracX_uid33_uid33_fpExp2Test_q : std_logic_vector (23 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal expX_uid6_fpExp2Test_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpExp2Test_b : std_logic_vector (7 downto 0);
    signal signX_uid7_fpExp2Test_in : std_logic_vector (31 downto 0);
    signal signX_uid7_fpExp2Test_b : std_logic_vector (0 downto 0);
    signal frac_uid23_fpExp2Test_in : std_logic_vector (22 downto 0);
    signal frac_uid23_fpExp2Test_b : std_logic_vector (22 downto 0);
    signal expXIsZero_uid20_fpExp2Test_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid20_fpExp2Test_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid20_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid22_fpExp2Test_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid22_fpExp2Test_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid22_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid24_fpExp2Test_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid24_fpExp2Test_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid24_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal exc_I_uid25_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal exc_I_uid25_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal exc_I_uid25_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal shiftValuePreSat_uid38_fpExp2Test_a : std_logic_vector(8 downto 0);
    signal shiftValuePreSat_uid38_fpExp2Test_b : std_logic_vector(8 downto 0);
    signal shiftValuePreSat_uid38_fpExp2Test_o : std_logic_vector (8 downto 0);
    signal shiftValuePreSat_uid38_fpExp2Test_q : std_logic_vector (8 downto 0);
    signal shiftVal_uid42_fpExp2Test_s : std_logic_vector (0 downto 0);
    signal shiftVal_uid42_fpExp2Test_q : std_logic_vector (5 downto 0);
    signal expRPostBiasPreExc_uid51_fpExp2Test_a : std_logic_vector(11 downto 0);
    signal expRPostBiasPreExc_uid51_fpExp2Test_b : std_logic_vector(11 downto 0);
    signal expRPostBiasPreExc_uid51_fpExp2Test_o : std_logic_vector (11 downto 0);
    signal expRPostBiasPreExc_uid51_fpExp2Test_q : std_logic_vector (10 downto 0);
    signal negInf_uid57_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal negInf_uid57_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal negInf_uid57_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid60_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid60_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid60_fpExp2Test_c : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid60_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal excRZero_uid61_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal excRZero_uid61_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal excRZero_uid61_fpExp2Test_c : std_logic_vector(0 downto 0);
    signal excRZero_uid61_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid65_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid65_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid65_fpExp2Test_c : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid65_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal excRInf_uid68_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal excRInf_uid68_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal excRInf_uid68_fpExp2Test_c : std_logic_vector(0 downto 0);
    signal excRInf_uid68_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal excREnc_uid70_fpExp2Test_q : std_logic_vector(1 downto 0);
    signal expRPostExc_uid78_fpExp2Test_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid78_fpExp2Test_q : std_logic_vector (7 downto 0);
    signal rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (32 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal oFracXZwE_uid34_fpExp2Test_q : std_logic_vector (32 downto 0);
    signal rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (32 downto 0);
    signal rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (32 downto 0);
    signal rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (32 downto 0);
    signal rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (32 downto 0);
    signal rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (32 downto 0);
    signal prodXYTruncFR_uid143_pT1_uid130_exp2PolyEval_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid143_pT1_uid130_exp2PolyEval_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid146_pT2_uid136_exp2PolyEval_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid146_pT2_uid136_exp2PolyEval_b : std_logic_vector (23 downto 0);
    signal rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (32 downto 0);
    signal rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (32 downto 0);
    signal onesCmpFxpIn_uid35_fpExp2Test_a : std_logic_vector(32 downto 0);
    signal onesCmpFxpIn_uid35_fpExp2Test_b : std_logic_vector(32 downto 0);
    signal onesCmpFxpIn_uid35_fpExp2Test_q : std_logic_vector(32 downto 0);
    signal fxpInExt_uid36_fpExp2Test_a : std_logic_vector(34 downto 0);
    signal fxpInExt_uid36_fpExp2Test_b : std_logic_vector(34 downto 0);
    signal fxpInExt_uid36_fpExp2Test_o : std_logic_vector (34 downto 0);
    signal fxpInExt_uid36_fpExp2Test_q : std_logic_vector (33 downto 0);
    signal yPPolyEval_uid48_fpExp2Test_in : std_logic_vector (15 downto 0);
    signal yPPolyEval_uid48_fpExp2Test_b : std_logic_vector (15 downto 0);
    signal concExc_uid69_fpExp2Test_q : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmp_a : std_logic_vector(2 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmp_b : std_logic_vector(2 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_nor_q : std_logic_vector(0 downto 0);
    signal InvSignX_uid62_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid62_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid30_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid30_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid26_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid26_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid29_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid29_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal posInf_uid67_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal posInf_uid67_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal posInf_uid67_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal expOvfInitial_uid39_fpExp2Test_in : std_logic_vector (8 downto 0);
    signal expOvfInitial_uid39_fpExp2Test_b : std_logic_vector (0 downto 0);
    signal shiftValuePreSatRed_uid41_fpExp2Test_in : std_logic_vector (5 downto 0);
    signal shiftValuePreSatRed_uid41_fpExp2Test_b : std_logic_vector (5 downto 0);
    signal rightShiftStageSel5Dto4_uid92_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (5 downto 0);
    signal rightShiftStageSel5Dto4_uid92_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (3 downto 0);
    signal rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (1 downto 0);
    signal rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (1 downto 0);
    signal expR_uid56_fpExp2Test_in : std_logic_vector (7 downto 0);
    signal expR_uid56_fpExp2Test_b : std_logic_vector (7 downto 0);
    signal RightShiftStage032dto4_uid96_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (32 downto 0);
    signal RightShiftStage032dto4_uid96_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (28 downto 0);
    signal RightShiftStage032dto8_uid100_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (32 downto 0);
    signal RightShiftStage032dto8_uid100_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (24 downto 0);
    signal RightShiftStage032dto12_uid104_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (32 downto 0);
    signal RightShiftStage032dto12_uid104_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (20 downto 0);
    signal lowRangeB_uid131_exp2PolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid131_exp2PolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid132_exp2PolyEval_in : std_logic_vector (12 downto 0);
    signal highBBits_uid132_exp2PolyEval_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid137_exp2PolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid137_exp2PolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid138_exp2PolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid138_exp2PolyEval_b : std_logic_vector (21 downto 0);
    signal RightShiftStage132dto1_uid110_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (32 downto 0);
    signal RightShiftStage132dto1_uid110_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (31 downto 0);
    signal RightShiftStage132dto2_uid114_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (32 downto 0);
    signal RightShiftStage132dto2_uid114_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (30 downto 0);
    signal RightShiftStage132dto3_uid118_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (32 downto 0);
    signal RightShiftStage132dto3_uid118_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (29 downto 0);
    signal ePre_uid44_fpExp2Test_in : std_logic_vector (32 downto 0);
    signal ePre_uid44_fpExp2Test_b : std_logic_vector (9 downto 0);
    signal y_uid45_fpExp2Test_in : std_logic_vector (22 downto 0);
    signal y_uid45_fpExp2Test_b : std_logic_vector (22 downto 0);
    signal fxpInPreAlign_uid37_fpExp2Test_in : std_logic_vector (32 downto 0);
    signal fxpInPreAlign_uid37_fpExp2Test_b : std_logic_vector (32 downto 0);
    signal yT1_uid129_exp2PolyEval_in : std_logic_vector (15 downto 0);
    signal yT1_uid129_exp2PolyEval_b : std_logic_vector (11 downto 0);
    signal exc_N_uid27_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal exc_N_uid27_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal exc_N_uid27_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal sumAHighB_uid133_exp2PolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid133_exp2PolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid133_exp2PolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid133_exp2PolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid139_exp2PolyEval_a : std_logic_vector(28 downto 0);
    signal sumAHighB_uid139_exp2PolyEval_b : std_logic_vector(28 downto 0);
    signal sumAHighB_uid139_exp2PolyEval_o : std_logic_vector (28 downto 0);
    signal sumAHighB_uid139_exp2PolyEval_q : std_logic_vector (28 downto 0);
    signal rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (32 downto 0);
    signal addr_uid47_fpExp2Test_in : std_logic_vector (22 downto 0);
    signal addr_uid47_fpExp2Test_b : std_logic_vector (6 downto 0);
    signal msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (32 downto 0);
    signal msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (0 downto 0);
    signal X32dto16_uid84_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (32 downto 0);
    signal X32dto16_uid84_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (16 downto 0);
    signal InvExc_N_uid28_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid28_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal s1_uid131_uid134_exp2PolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid137_uid140_exp2PolyEval_q : std_logic_vector (30 downto 0);
    signal rightShiftStage0Idx1Pad16_uid83_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx1Pad16_uid83_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx1Pad16_uid83_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx2Pad32_uid87_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx2Pad32_uid87_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx2Pad32_uid87_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (32 downto 0);
    signal rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (32 downto 0);
    signal exc_R_uid31_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal exc_R_uid31_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal exc_R_uid31_fpExp2Test_c : std_logic_vector(0 downto 0);
    signal exc_R_uid31_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal peOR_uid50_fpExp2Test_in : std_logic_vector (28 downto 0);
    signal peOR_uid50_fpExp2Test_b : std_logic_vector (23 downto 0);
    signal regXAndExpOverflowAndNeg_uid58_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndNeg_uid58_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndNeg_uid58_fpExp2Test_c : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndNeg_uid58_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid63_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid63_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid63_fpExp2Test_c : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid63_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal fracR_uid52_fpExp2Test_in : std_logic_vector (22 downto 0);
    signal fracR_uid52_fpExp2Test_b : std_logic_vector (22 downto 0);
    signal fracRPostExc_uid74_fpExp2Test_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid74_fpExp2Test_q : std_logic_vector (22 downto 0);
    signal RExp2_uid79_fpExp2Test_q : std_logic_vector (31 downto 0);
begin


	--GND(CONSTANT,0)
    GND_q <= "0";

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_notEnable(LOGICAL,342)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_notEnable_a <= en;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_notEnable_q <= not ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_notEnable_a;

	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor(LOGICAL,343)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_a <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_notEnable_q;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_b <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena_q;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_q <= not (ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_a or ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_b);

	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_mem_top(CONSTANT,339)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_mem_top_q <= "011";

	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmp(LOGICAL,340)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmp_a <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_mem_top_q;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdmux_q);
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmp_q <= "1" when ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmp_a = ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmp_b else "0";

	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmpReg(REG,341)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmpReg_q <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena(REG,344)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_q = "1") THEN
                ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena_q <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd(LOGICAL,345)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_a <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena_q;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_b <= en;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_q <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_a and ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_b;

	--cstAllOWE_uid16_fpExp2Test(CONSTANT,15)
    cstAllOWE_uid16_fpExp2Test_q <= "11111111";

	--cstBias_uid9_fpExp2Test(CONSTANT,8)
    cstBias_uid9_fpExp2Test_q <= "01111111";

	--signX_uid7_fpExp2Test(BITSELECT,6)@0
    signX_uid7_fpExp2Test_in <= a;
    signX_uid7_fpExp2Test_b <= signX_uid7_fpExp2Test_in(31 downto 31);

	--ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b(DELAY,187)@0
    ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signX_uid7_fpExp2Test_b, xout => ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--frac_uid23_fpExp2Test(BITSELECT,22)@0
    frac_uid23_fpExp2Test_in <= a(22 downto 0);
    frac_uid23_fpExp2Test_b <= frac_uid23_fpExp2Test_in(22 downto 0);

	--ld_frac_uid23_fpExp2Test_b_to_oFracX_uid33_uid33_fpExp2Test_a(DELAY,184)@0
    ld_frac_uid23_fpExp2Test_b_to_oFracX_uid33_uid33_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => frac_uid23_fpExp2Test_b, xout => ld_frac_uid23_fpExp2Test_b_to_oFracX_uid33_uid33_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--oFracX_uid33_uid33_fpExp2Test(BITJOIN,32)@1
    oFracX_uid33_uid33_fpExp2Test_q <= VCC_q & ld_frac_uid23_fpExp2Test_b_to_oFracX_uid33_uid33_fpExp2Test_a_q;

	--oFracXZwE_uid34_fpExp2Test(BITJOIN,33)@1
    oFracXZwE_uid34_fpExp2Test_q <= GND_q & oFracX_uid33_uid33_fpExp2Test_q & cstZeroWE_uid13_fpExp2Test_q;

	--onesCmpFxpIn_uid35_fpExp2Test(LOGICAL,34)@1
    onesCmpFxpIn_uid35_fpExp2Test_a <= oFracXZwE_uid34_fpExp2Test_q;
    onesCmpFxpIn_uid35_fpExp2Test_b <= STD_LOGIC_VECTOR((32 downto 1 => ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b_q(0)) & ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b_q);
    onesCmpFxpIn_uid35_fpExp2Test_q <= onesCmpFxpIn_uid35_fpExp2Test_a xor onesCmpFxpIn_uid35_fpExp2Test_b;

	--fxpInExt_uid36_fpExp2Test(ADD,35)@1
    fxpInExt_uid36_fpExp2Test_a <= STD_LOGIC_VECTOR((34 downto 33 => onesCmpFxpIn_uid35_fpExp2Test_q(32)) & onesCmpFxpIn_uid35_fpExp2Test_q);
    fxpInExt_uid36_fpExp2Test_b <= STD_LOGIC_VECTOR('0' & "000000000000000000000000000000000" & ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b_q);
            fxpInExt_uid36_fpExp2Test_o <= STD_LOGIC_VECTOR(SIGNED(fxpInExt_uid36_fpExp2Test_a) + SIGNED(fxpInExt_uid36_fpExp2Test_b));
    fxpInExt_uid36_fpExp2Test_q <= fxpInExt_uid36_fpExp2Test_o(33 downto 0);


	--fxpInPreAlign_uid37_fpExp2Test(BITSELECT,36)@1
    fxpInPreAlign_uid37_fpExp2Test_in <= fxpInExt_uid36_fpExp2Test_q(32 downto 0);
    fxpInPreAlign_uid37_fpExp2Test_b <= fxpInPreAlign_uid37_fpExp2Test_in(32 downto 0);

	--msbx_uid81_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,80)@1
    msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_in <= fxpInPreAlign_uid37_fpExp2Test_b;
    msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b <= msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_in(32 downto 32);

	--ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_b(DELAY,278)@1
    ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--z_uid116_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,115)
    z_uid116_fxpInPostAlign_uid43_fpExp2Test_q <= "000";

	--rightShiftStage2Idx3Pad3_uid117_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,116)@3
    rightShiftStage2Idx3Pad3_uid117_fxpInPostAlign_uid43_fpExp2Test_a <= z_uid116_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage2Idx3Pad3_uid117_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((2 downto 1 => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_b_q(0)) & ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_b_q);
    rightShiftStage2Idx3Pad3_uid117_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage2Idx3Pad3_uid117_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage2Idx3Pad3_uid117_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage2Idx3Pad3_uid117_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 3, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx3Pad3_uid117_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage2Idx3Pad3_uid117_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_b(DELAY,256)@1
    ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--z_uid102_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,101)
    z_uid102_fxpInPostAlign_uid43_fpExp2Test_q <= "000000000000";

	--rightShiftStage1Idx3Pad12_uid103_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,102)@2
    rightShiftStage1Idx3Pad12_uid103_fxpInPostAlign_uid43_fpExp2Test_a <= z_uid102_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage1Idx3Pad12_uid103_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((11 downto 1 => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q(0)) & ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q);
    rightShiftStage1Idx3Pad12_uid103_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage1Idx3Pad12_uid103_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage1Idx3Pad12_uid103_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage1Idx3Pad12_uid103_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 12, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx3Pad12_uid103_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage1Idx3Pad12_uid103_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--rightShiftStage0Idx3_uid90_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,89)
    rightShiftStage0Idx3_uid90_fxpInPostAlign_uid43_fpExp2Test_q <= "000000000000000000000000000000000";

	--rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,90)@1
    rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_a <= rightShiftStage0Idx3_uid90_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((32 downto 1 => msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b(0)) & msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b);
    rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 33, depth => 1)
    PORT MAP (xout => rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--z_uid86_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,85)
    z_uid86_fxpInPostAlign_uid43_fpExp2Test_q <= "00000000000000000000000000000000";

	--rightShiftStage0Idx2Pad32_uid87_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,86)@1
    rightShiftStage0Idx2Pad32_uid87_fxpInPostAlign_uid43_fpExp2Test_a <= z_uid86_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage0Idx2Pad32_uid87_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((31 downto 1 => msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b(0)) & msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b);
    rightShiftStage0Idx2Pad32_uid87_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage0Idx2Pad32_uid87_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage0Idx2Pad32_uid87_fxpInPostAlign_uid43_fpExp2Test_b;

	--rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,88)@1
    rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage0Idx2Pad32_uid87_fxpInPostAlign_uid43_fpExp2Test_q & msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b;

	--reg_rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_4(REG,151)@1
    reg_rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_4_q <= "000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_4_q <= rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--z_uid82_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,81)
    z_uid82_fxpInPostAlign_uid43_fpExp2Test_q <= "0000000000000000";

	--rightShiftStage0Idx1Pad16_uid83_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,82)@1
    rightShiftStage0Idx1Pad16_uid83_fxpInPostAlign_uid43_fpExp2Test_a <= z_uid82_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage0Idx1Pad16_uid83_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((15 downto 1 => msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b(0)) & msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b);
    rightShiftStage0Idx1Pad16_uid83_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage0Idx1Pad16_uid83_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage0Idx1Pad16_uid83_fxpInPostAlign_uid43_fpExp2Test_b;

	--X32dto16_uid84_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,83)@1
    X32dto16_uid84_fxpInPostAlign_uid43_fpExp2Test_in <= fxpInPreAlign_uid37_fpExp2Test_b;
    X32dto16_uid84_fxpInPostAlign_uid43_fpExp2Test_b <= X32dto16_uid84_fxpInPostAlign_uid43_fpExp2Test_in(32 downto 16);

	--rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,84)@1
    rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage0Idx1Pad16_uid83_fxpInPostAlign_uid43_fpExp2Test_q & X32dto16_uid84_fxpInPostAlign_uid43_fpExp2Test_b;

	--reg_rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_3(REG,150)@1
    reg_rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_3_q <= "000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_3_q <= rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_fxpInPreAlign_uid37_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_2(REG,149)@1
    reg_fxpInPreAlign_uid37_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpInPreAlign_uid37_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_2_q <= "000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpInPreAlign_uid37_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_2_q <= fxpInPreAlign_uid37_fpExp2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--cstBiasPWE_uid15_fpExp2Test(CONSTANT,14)
    cstBiasPWE_uid15_fpExp2Test_q <= "100001";

	--expX_uid6_fpExp2Test(BITSELECT,5)@0
    expX_uid6_fpExp2Test_in <= a(30 downto 0);
    expX_uid6_fpExp2Test_b <= expX_uid6_fpExp2Test_in(30 downto 23);

	--cstBiasPWE_uid14_fpExp2Test(CONSTANT,13)
    cstBiasPWE_uid14_fpExp2Test_q <= "10000111";

	--shiftValuePreSat_uid38_fpExp2Test(SUB,37)@0
    shiftValuePreSat_uid38_fpExp2Test_a <= STD_LOGIC_VECTOR("0" & cstBiasPWE_uid14_fpExp2Test_q);
    shiftValuePreSat_uid38_fpExp2Test_b <= STD_LOGIC_VECTOR("0" & expX_uid6_fpExp2Test_b);
            shiftValuePreSat_uid38_fpExp2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValuePreSat_uid38_fpExp2Test_a) - UNSIGNED(shiftValuePreSat_uid38_fpExp2Test_b));
    shiftValuePreSat_uid38_fpExp2Test_q <= shiftValuePreSat_uid38_fpExp2Test_o(8 downto 0);


	--shiftValuePreSatRed_uid41_fpExp2Test(BITSELECT,40)@0
    shiftValuePreSatRed_uid41_fpExp2Test_in <= shiftValuePreSat_uid38_fpExp2Test_q(5 downto 0);
    shiftValuePreSatRed_uid41_fpExp2Test_b <= shiftValuePreSatRed_uid41_fpExp2Test_in(5 downto 0);

	--ld_shiftValuePreSatRed_uid41_fpExp2Test_b_to_shiftVal_uid42_fpExp2Test_c(DELAY,196)@0
    ld_shiftValuePreSatRed_uid41_fpExp2Test_b_to_shiftVal_uid42_fpExp2Test_c : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => shiftValuePreSatRed_uid41_fpExp2Test_b, xout => ld_shiftValuePreSatRed_uid41_fpExp2Test_b_to_shiftVal_uid42_fpExp2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_shiftValuePreSat_uid38_fpExp2Test_0_to_shiftUdf_uid40_fpExp2Test_0(REG,147)@0
    reg_shiftValuePreSat_uid38_fpExp2Test_0_to_shiftUdf_uid40_fpExp2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_shiftValuePreSat_uid38_fpExp2Test_0_to_shiftUdf_uid40_fpExp2Test_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_shiftValuePreSat_uid38_fpExp2Test_0_to_shiftUdf_uid40_fpExp2Test_0_q <= shiftValuePreSat_uid38_fpExp2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--shiftUdf_uid40_fpExp2Test(COMPARE,39)@1
    shiftUdf_uid40_fpExp2Test_cin <= GND_q;
    shiftUdf_uid40_fpExp2Test_a <= STD_LOGIC_VECTOR((10 downto 9 => reg_shiftValuePreSat_uid38_fpExp2Test_0_to_shiftUdf_uid40_fpExp2Test_0_q(8)) & reg_shiftValuePreSat_uid38_fpExp2Test_0_to_shiftUdf_uid40_fpExp2Test_0_q) & '0';
    shiftUdf_uid40_fpExp2Test_b <= STD_LOGIC_VECTOR('0' & "0000" & cstBiasPWE_uid15_fpExp2Test_q) & shiftUdf_uid40_fpExp2Test_cin(0);
            shiftUdf_uid40_fpExp2Test_o <= STD_LOGIC_VECTOR(SIGNED(shiftUdf_uid40_fpExp2Test_a) - SIGNED(shiftUdf_uid40_fpExp2Test_b));
    shiftUdf_uid40_fpExp2Test_n(0) <= not shiftUdf_uid40_fpExp2Test_o(11);


	--shiftVal_uid42_fpExp2Test(MUX,41)@1
    shiftVal_uid42_fpExp2Test_s <= shiftUdf_uid40_fpExp2Test_n;
    shiftVal_uid42_fpExp2Test: PROCESS (shiftVal_uid42_fpExp2Test_s, en, ld_shiftValuePreSatRed_uid41_fpExp2Test_b_to_shiftVal_uid42_fpExp2Test_c_q, cstBiasPWE_uid15_fpExp2Test_q)
    BEGIN
            CASE shiftVal_uid42_fpExp2Test_s IS
                  WHEN "0" => shiftVal_uid42_fpExp2Test_q <= ld_shiftValuePreSatRed_uid41_fpExp2Test_b_to_shiftVal_uid42_fpExp2Test_c_q;
                  WHEN "1" => shiftVal_uid42_fpExp2Test_q <= cstBiasPWE_uid15_fpExp2Test_q;
                  WHEN OTHERS => shiftVal_uid42_fpExp2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel5Dto4_uid92_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,91)@1
    rightShiftStageSel5Dto4_uid92_fxpInPostAlign_uid43_fpExp2Test_in <= shiftVal_uid42_fpExp2Test_q;
    rightShiftStageSel5Dto4_uid92_fxpInPostAlign_uid43_fpExp2Test_b <= rightShiftStageSel5Dto4_uid92_fxpInPostAlign_uid43_fpExp2Test_in(5 downto 4);

	--reg_rightShiftStageSel5Dto4_uid92_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_1(REG,148)@1
    reg_rightShiftStageSel5Dto4_uid92_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel5Dto4_uid92_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel5Dto4_uid92_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_1_q <= rightShiftStageSel5Dto4_uid92_fxpInPostAlign_uid43_fpExp2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test(MUX,92)@2
    rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_s <= reg_rightShiftStageSel5Dto4_uid92_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_1_q;
    rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test: PROCESS (rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_s, en, reg_fxpInPreAlign_uid37_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_2_q, reg_rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_3_q, reg_rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_4_q, rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_q)
    BEGIN
            CASE rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_s IS
                  WHEN "00" => rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q <= reg_fxpInPreAlign_uid37_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_2_q;
                  WHEN "01" => rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q <= reg_rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_3_q;
                  WHEN "10" => rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q <= reg_rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_4_q;
                  WHEN "11" => rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_q;
                  WHEN OTHERS => rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage032dto12_uid104_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,103)@2
    RightShiftStage032dto12_uid104_fxpInPostAlign_uid43_fpExp2Test_in <= rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q;
    RightShiftStage032dto12_uid104_fxpInPostAlign_uid43_fpExp2Test_b <= RightShiftStage032dto12_uid104_fxpInPostAlign_uid43_fpExp2Test_in(32 downto 12);

	--ld_RightShiftStage032dto12_uid104_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_a(DELAY,266)@2
    ld_RightShiftStage032dto12_uid104_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 21, depth => 1 )
    PORT MAP ( xin => RightShiftStage032dto12_uid104_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_RightShiftStage032dto12_uid104_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,104)@3
    rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage1Idx3Pad12_uid103_fxpInPostAlign_uid43_fpExp2Test_q & ld_RightShiftStage032dto12_uid104_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_a_q;

	--rightShiftStage1Idx2Pad8_uid99_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,98)@2
    rightShiftStage1Idx2Pad8_uid99_fxpInPostAlign_uid43_fpExp2Test_a <= cstZeroWE_uid13_fpExp2Test_q;
    rightShiftStage1Idx2Pad8_uid99_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((7 downto 1 => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q(0)) & ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q);
    rightShiftStage1Idx2Pad8_uid99_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage1Idx2Pad8_uid99_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage1Idx2Pad8_uid99_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage1Idx2Pad8_uid99_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 8, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx2Pad8_uid99_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage1Idx2Pad8_uid99_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage032dto8_uid100_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,99)@2
    RightShiftStage032dto8_uid100_fxpInPostAlign_uid43_fpExp2Test_in <= rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q;
    RightShiftStage032dto8_uid100_fxpInPostAlign_uid43_fpExp2Test_b <= RightShiftStage032dto8_uid100_fxpInPostAlign_uid43_fpExp2Test_in(32 downto 8);

	--ld_RightShiftStage032dto8_uid100_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_a(DELAY,262)@2
    ld_RightShiftStage032dto8_uid100_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 25, depth => 1 )
    PORT MAP ( xin => RightShiftStage032dto8_uid100_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_RightShiftStage032dto8_uid100_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,100)@3
    rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage1Idx2Pad8_uid99_fxpInPostAlign_uid43_fpExp2Test_q & ld_RightShiftStage032dto8_uid100_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_a_q;

	--z_uid94_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,93)
    z_uid94_fxpInPostAlign_uid43_fpExp2Test_q <= "0000";

	--rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,94)@2
    rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_a <= z_uid94_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((3 downto 1 => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q(0)) & ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q);
    rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 4, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage032dto4_uid96_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,95)@2
    RightShiftStage032dto4_uid96_fxpInPostAlign_uid43_fpExp2Test_in <= rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q;
    RightShiftStage032dto4_uid96_fxpInPostAlign_uid43_fpExp2Test_b <= RightShiftStage032dto4_uid96_fxpInPostAlign_uid43_fpExp2Test_in(32 downto 4);

	--ld_RightShiftStage032dto4_uid96_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_a(DELAY,258)@2
    ld_RightShiftStage032dto4_uid96_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 29, depth => 1 )
    PORT MAP ( xin => RightShiftStage032dto4_uid96_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_RightShiftStage032dto4_uid96_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,96)@3
    rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage1Idx1Pad4_uid95_fxpInPostAlign_uid43_fpExp2Test_q & ld_RightShiftStage032dto4_uid96_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_a_q;

	--reg_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_2(REG,153)@2
    reg_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_2_q <= "000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_2_q <= rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,105)@1
    rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_in <= shiftVal_uid42_fpExp2Test_q(3 downto 0);
    rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_b <= rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_in(3 downto 2);

	--ld_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_b_to_reg_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_a(DELAY,319)@1
    ld_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_b_to_reg_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_b_to_reg_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1(REG,152)@2
    reg_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_q <= ld_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_b_to_reg_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test(MUX,106)@3
    rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_s <= reg_rightShiftStageSel3Dto2_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_q;
    rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test: PROCESS (rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_s, en, reg_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_2_q, rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_q, rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_q, rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_q)
    BEGIN
            CASE rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_s IS
                  WHEN "00" => rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q <= reg_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_2_q;
                  WHEN "01" => rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_q;
                  WHEN "10" => rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_q;
                  WHEN "11" => rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_q;
                  WHEN OTHERS => rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage132dto3_uid118_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,117)@3
    RightShiftStage132dto3_uid118_fxpInPostAlign_uid43_fpExp2Test_in <= rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q;
    RightShiftStage132dto3_uid118_fxpInPostAlign_uid43_fpExp2Test_b <= RightShiftStage132dto3_uid118_fxpInPostAlign_uid43_fpExp2Test_in(32 downto 3);

	--ld_RightShiftStage132dto3_uid118_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_a(DELAY,284)@3
    ld_RightShiftStage132dto3_uid118_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 30, depth => 1 )
    PORT MAP ( xin => RightShiftStage132dto3_uid118_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_RightShiftStage132dto3_uid118_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,118)@4
    rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage2Idx3Pad3_uid117_fxpInPostAlign_uid43_fpExp2Test_q & ld_RightShiftStage132dto3_uid118_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_a_q;

	--z_uid112_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,111)
    z_uid112_fxpInPostAlign_uid43_fpExp2Test_q <= "00";

	--rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,112)@3
    rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_a <= z_uid112_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((1 downto 1 => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_b_q(0)) & ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_b_q);
    rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 2, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage132dto2_uid114_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,113)@3
    RightShiftStage132dto2_uid114_fxpInPostAlign_uid43_fpExp2Test_in <= rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q;
    RightShiftStage132dto2_uid114_fxpInPostAlign_uid43_fpExp2Test_b <= RightShiftStage132dto2_uid114_fxpInPostAlign_uid43_fpExp2Test_in(32 downto 2);

	--ld_RightShiftStage132dto2_uid114_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_a(DELAY,280)@3
    ld_RightShiftStage132dto2_uid114_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 31, depth => 1 )
    PORT MAP ( xin => RightShiftStage132dto2_uid114_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_RightShiftStage132dto2_uid114_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,114)@4
    rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage2Idx2Pad2_uid113_fxpInPostAlign_uid43_fpExp2Test_q & ld_RightShiftStage132dto2_uid114_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_a_q;

	--rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,108)@1
    rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_a <= GND_q;
    rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_b <= msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_q_to_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_b(DELAY,277)@2
    ld_rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_q_to_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_q, xout => ld_rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_q_to_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--RightShiftStage132dto1_uid110_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,109)@3
    RightShiftStage132dto1_uid110_fxpInPostAlign_uid43_fpExp2Test_in <= rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q;
    RightShiftStage132dto1_uid110_fxpInPostAlign_uid43_fpExp2Test_b <= RightShiftStage132dto1_uid110_fxpInPostAlign_uid43_fpExp2Test_in(32 downto 1);

	--rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,110)@3
    rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_q <= ld_rightShiftStage2Idx1Pad1_uid109_fxpInPostAlign_uid43_fpExp2Test_q_to_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_b_q & RightShiftStage132dto1_uid110_fxpInPostAlign_uid43_fpExp2Test_b;

	--ld_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_q_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_d(DELAY,289)@3
    ld_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_q_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_d : dspba_delay
    GENERIC MAP ( width => 33, depth => 1 )
    PORT MAP ( xin => rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_q, xout => ld_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_q_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_d_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_2(REG,155)@3
    reg_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_2_q <= "000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_2_q <= rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,119)@1
    rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_in <= shiftVal_uid42_fpExp2Test_q(1 downto 0);
    rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_b <= rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_in(1 downto 0);

	--ld_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_b_to_reg_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_a(DELAY,321)@1
    ld_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_b_to_reg_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 2 )
    PORT MAP ( xin => rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_b_to_reg_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1(REG,154)@3
    reg_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_q <= ld_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_b_to_reg_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test(MUX,120)@4
    rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_s <= reg_rightShiftStageSel1Dto0_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_q;
    rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test: PROCESS (rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_s, en, reg_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_2_q, ld_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_q_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_d_q, rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_q, rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_q)
    BEGIN
            CASE rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_s IS
                  WHEN "00" => rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q <= reg_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_2_q;
                  WHEN "01" => rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q <= ld_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_q_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_d_q;
                  WHEN "10" => rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_q;
                  WHEN "11" => rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_q;
                  WHEN OTHERS => rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ePre_uid44_fpExp2Test(BITSELECT,43)@4
    ePre_uid44_fpExp2Test_in <= rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q;
    ePre_uid44_fpExp2Test_b <= ePre_uid44_fpExp2Test_in(32 downto 23);

	--reg_ePre_uid44_fpExp2Test_0_to_expRPostBiasPreExc_uid51_fpExp2Test_0(REG,156)@4
    reg_ePre_uid44_fpExp2Test_0_to_expRPostBiasPreExc_uid51_fpExp2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_ePre_uid44_fpExp2Test_0_to_expRPostBiasPreExc_uid51_fpExp2Test_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_ePre_uid44_fpExp2Test_0_to_expRPostBiasPreExc_uid51_fpExp2Test_0_q <= ePre_uid44_fpExp2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--expRPostBiasPreExc_uid51_fpExp2Test(ADD,50)@5
    expRPostBiasPreExc_uid51_fpExp2Test_a <= STD_LOGIC_VECTOR((11 downto 10 => reg_ePre_uid44_fpExp2Test_0_to_expRPostBiasPreExc_uid51_fpExp2Test_0_q(9)) & reg_ePre_uid44_fpExp2Test_0_to_expRPostBiasPreExc_uid51_fpExp2Test_0_q);
    expRPostBiasPreExc_uid51_fpExp2Test_b <= STD_LOGIC_VECTOR('0' & "000" & cstBias_uid9_fpExp2Test_q);
            expRPostBiasPreExc_uid51_fpExp2Test_o <= STD_LOGIC_VECTOR(SIGNED(expRPostBiasPreExc_uid51_fpExp2Test_a) + SIGNED(expRPostBiasPreExc_uid51_fpExp2Test_b));
    expRPostBiasPreExc_uid51_fpExp2Test_q <= expRPostBiasPreExc_uid51_fpExp2Test_o(10 downto 0);


	--expR_uid56_fpExp2Test(BITSELECT,55)@5
    expR_uid56_fpExp2Test_in <= expRPostBiasPreExc_uid51_fpExp2Test_q(7 downto 0);
    expR_uid56_fpExp2Test_b <= expR_uid56_fpExp2Test_in(7 downto 0);

	--ld_expR_uid56_fpExp2Test_b_to_expRPostExc_uid78_fpExp2Test_d(DELAY,238)@5
    ld_expR_uid56_fpExp2Test_b_to_expRPostExc_uid78_fpExp2Test_d : dspba_delay
    GENERIC MAP ( width => 8, depth => 2 )
    PORT MAP ( xin => expR_uid56_fpExp2Test_b, xout => ld_expR_uid56_fpExp2Test_b_to_expRPostExc_uid78_fpExp2Test_d_q, ena => en(0), clk => clk, aclr => areset );

	--cstZeroWE_uid13_fpExp2Test(CONSTANT,12)
    cstZeroWE_uid13_fpExp2Test_q <= "00000000";

	--cstAllZWF_uid17_fpExp2Test(CONSTANT,16)
    cstAllZWF_uid17_fpExp2Test_q <= "00000000000000000000000";

	--fracXIsZero_uid24_fpExp2Test(LOGICAL,23)@0
    fracXIsZero_uid24_fpExp2Test_a <= frac_uid23_fpExp2Test_b;
    fracXIsZero_uid24_fpExp2Test_b <= cstAllZWF_uid17_fpExp2Test_q;
    fracXIsZero_uid24_fpExp2Test_q <= "1" when fracXIsZero_uid24_fpExp2Test_a = fracXIsZero_uid24_fpExp2Test_b else "0";

	--InvFracXIsZero_uid26_fpExp2Test(LOGICAL,25)@0
    InvFracXIsZero_uid26_fpExp2Test_a <= fracXIsZero_uid24_fpExp2Test_q;
    InvFracXIsZero_uid26_fpExp2Test_q <= not InvFracXIsZero_uid26_fpExp2Test_a;

	--expXIsMax_uid22_fpExp2Test(LOGICAL,21)@0
    expXIsMax_uid22_fpExp2Test_a <= expX_uid6_fpExp2Test_b;
    expXIsMax_uid22_fpExp2Test_b <= cstAllOWE_uid16_fpExp2Test_q;
    expXIsMax_uid22_fpExp2Test_q <= "1" when expXIsMax_uid22_fpExp2Test_a = expXIsMax_uid22_fpExp2Test_b else "0";

	--exc_N_uid27_fpExp2Test(LOGICAL,26)@0
    exc_N_uid27_fpExp2Test_a <= expXIsMax_uid22_fpExp2Test_q;
    exc_N_uid27_fpExp2Test_b <= InvFracXIsZero_uid26_fpExp2Test_q;
    exc_N_uid27_fpExp2Test_q <= exc_N_uid27_fpExp2Test_a and exc_N_uid27_fpExp2Test_b;

	--ld_exc_N_uid27_fpExp2Test_q_to_concExc_uid69_fpExp2Test_c(DELAY,233)@0
    ld_exc_N_uid27_fpExp2Test_q_to_concExc_uid69_fpExp2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => exc_N_uid27_fpExp2Test_q, xout => ld_exc_N_uid27_fpExp2Test_q_to_concExc_uid69_fpExp2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--InvSignX_uid62_fpExp2Test(LOGICAL,61)@0
    InvSignX_uid62_fpExp2Test_a <= signX_uid7_fpExp2Test_b;
    InvSignX_uid62_fpExp2Test_q <= not InvSignX_uid62_fpExp2Test_a;

	--expOvfInitial_uid39_fpExp2Test(BITSELECT,38)@0
    expOvfInitial_uid39_fpExp2Test_in <= shiftValuePreSat_uid38_fpExp2Test_q;
    expOvfInitial_uid39_fpExp2Test_b <= expOvfInitial_uid39_fpExp2Test_in(8 downto 8);

	--InvExc_N_uid28_fpExp2Test(LOGICAL,27)@0
    InvExc_N_uid28_fpExp2Test_a <= exc_N_uid27_fpExp2Test_q;
    InvExc_N_uid28_fpExp2Test_q <= not InvExc_N_uid28_fpExp2Test_a;

	--exc_I_uid25_fpExp2Test(LOGICAL,24)@0
    exc_I_uid25_fpExp2Test_a <= expXIsMax_uid22_fpExp2Test_q;
    exc_I_uid25_fpExp2Test_b <= fracXIsZero_uid24_fpExp2Test_q;
    exc_I_uid25_fpExp2Test_q <= exc_I_uid25_fpExp2Test_a and exc_I_uid25_fpExp2Test_b;

	--InvExc_I_uid29_fpExp2Test(LOGICAL,28)@0
    InvExc_I_uid29_fpExp2Test_a <= exc_I_uid25_fpExp2Test_q;
    InvExc_I_uid29_fpExp2Test_q <= not InvExc_I_uid29_fpExp2Test_a;

	--expXIsZero_uid20_fpExp2Test(LOGICAL,19)@0
    expXIsZero_uid20_fpExp2Test_a <= expX_uid6_fpExp2Test_b;
    expXIsZero_uid20_fpExp2Test_b <= cstZeroWE_uid13_fpExp2Test_q;
    expXIsZero_uid20_fpExp2Test_q <= "1" when expXIsZero_uid20_fpExp2Test_a = expXIsZero_uid20_fpExp2Test_b else "0";

	--InvExpXIsZero_uid30_fpExp2Test(LOGICAL,29)@0
    InvExpXIsZero_uid30_fpExp2Test_a <= expXIsZero_uid20_fpExp2Test_q;
    InvExpXIsZero_uid30_fpExp2Test_q <= not InvExpXIsZero_uid30_fpExp2Test_a;

	--exc_R_uid31_fpExp2Test(LOGICAL,30)@0
    exc_R_uid31_fpExp2Test_a <= InvExpXIsZero_uid30_fpExp2Test_q;
    exc_R_uid31_fpExp2Test_b <= InvExc_I_uid29_fpExp2Test_q;
    exc_R_uid31_fpExp2Test_c <= InvExc_N_uid28_fpExp2Test_q;
    exc_R_uid31_fpExp2Test_q <= exc_R_uid31_fpExp2Test_a and exc_R_uid31_fpExp2Test_b and exc_R_uid31_fpExp2Test_c;

	--regXAndExpOverflowAndPos_uid63_fpExp2Test(LOGICAL,62)@0
    regXAndExpOverflowAndPos_uid63_fpExp2Test_a <= exc_R_uid31_fpExp2Test_q;
    regXAndExpOverflowAndPos_uid63_fpExp2Test_b <= expOvfInitial_uid39_fpExp2Test_b;
    regXAndExpOverflowAndPos_uid63_fpExp2Test_c <= InvSignX_uid62_fpExp2Test_q;
    regXAndExpOverflowAndPos_uid63_fpExp2Test_q <= regXAndExpOverflowAndPos_uid63_fpExp2Test_a and regXAndExpOverflowAndPos_uid63_fpExp2Test_b and regXAndExpOverflowAndPos_uid63_fpExp2Test_c;

	--ld_regXAndExpOverflowAndPos_uid63_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_c(DELAY,230)@0
    ld_regXAndExpOverflowAndPos_uid63_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => regXAndExpOverflowAndPos_uid63_fpExp2Test_q, xout => ld_regXAndExpOverflowAndPos_uid63_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expOvfInitial_uid39_fpExp2Test_b_to_InvExpOvfInitial_uid59_fpExp2Test_a(DELAY,212)@0
    ld_expOvfInitial_uid39_fpExp2Test_b_to_InvExpOvfInitial_uid59_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => expOvfInitial_uid39_fpExp2Test_b, xout => ld_expOvfInitial_uid39_fpExp2Test_b_to_InvExpOvfInitial_uid59_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvExpOvfInitial_uid59_fpExp2Test(LOGICAL,58)@6
    InvExpOvfInitial_uid59_fpExp2Test_a <= ld_expOvfInitial_uid39_fpExp2Test_b_to_InvExpOvfInitial_uid59_fpExp2Test_a_q;
    InvExpOvfInitial_uid59_fpExp2Test_q <= not InvExpOvfInitial_uid59_fpExp2Test_a;

	--reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1(REG,157)@5
    reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1_q <= "00000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1_q <= expRPostBiasPreExc_uid51_fpExp2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--expOvf_uid55_fpExp2Test(COMPARE,54)@6
    expOvf_uid55_fpExp2Test_cin <= GND_q;
    expOvf_uid55_fpExp2Test_a <= STD_LOGIC_VECTOR((12 downto 11 => reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1_q(10)) & reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1_q) & '0';
    expOvf_uid55_fpExp2Test_b <= STD_LOGIC_VECTOR('0' & "0000" & cstAllOWE_uid16_fpExp2Test_q) & expOvf_uid55_fpExp2Test_cin(0);
            expOvf_uid55_fpExp2Test_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid55_fpExp2Test_a) - SIGNED(expOvf_uid55_fpExp2Test_b));
    expOvf_uid55_fpExp2Test_n(0) <= not expOvf_uid55_fpExp2Test_o(13);


	--ld_exc_R_uid31_fpExp2Test_q_to_regXAndUdf_uid60_fpExp2Test_a(DELAY,213)@0
    ld_exc_R_uid31_fpExp2Test_q_to_regXAndUdf_uid60_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => exc_R_uid31_fpExp2Test_q, xout => ld_exc_R_uid31_fpExp2Test_q_to_regXAndUdf_uid60_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--regInAndOvf_uid65_fpExp2Test(LOGICAL,64)@6
    regInAndOvf_uid65_fpExp2Test_a <= ld_exc_R_uid31_fpExp2Test_q_to_regXAndUdf_uid60_fpExp2Test_a_q;
    regInAndOvf_uid65_fpExp2Test_b <= expOvf_uid55_fpExp2Test_n;
    regInAndOvf_uid65_fpExp2Test_c <= InvExpOvfInitial_uid59_fpExp2Test_q;
    regInAndOvf_uid65_fpExp2Test_q <= regInAndOvf_uid65_fpExp2Test_a and regInAndOvf_uid65_fpExp2Test_b and regInAndOvf_uid65_fpExp2Test_c;

	--posInf_uid67_fpExp2Test(LOGICAL,66)@0
    posInf_uid67_fpExp2Test_a <= exc_I_uid25_fpExp2Test_q;
    posInf_uid67_fpExp2Test_b <= InvSignX_uid62_fpExp2Test_q;
    posInf_uid67_fpExp2Test_q <= posInf_uid67_fpExp2Test_a and posInf_uid67_fpExp2Test_b;

	--ld_posInf_uid67_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_a(DELAY,228)@0
    ld_posInf_uid67_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => posInf_uid67_fpExp2Test_q, xout => ld_posInf_uid67_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRInf_uid68_fpExp2Test(LOGICAL,67)@6
    excRInf_uid68_fpExp2Test_a <= ld_posInf_uid67_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_a_q;
    excRInf_uid68_fpExp2Test_b <= regInAndOvf_uid65_fpExp2Test_q;
    excRInf_uid68_fpExp2Test_c <= ld_regXAndExpOverflowAndPos_uid63_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_c_q;
    excRInf_uid68_fpExp2Test_q <= excRInf_uid68_fpExp2Test_a or excRInf_uid68_fpExp2Test_b or excRInf_uid68_fpExp2Test_c;

	--negInf_uid57_fpExp2Test(LOGICAL,56)@0
    negInf_uid57_fpExp2Test_a <= exc_I_uid25_fpExp2Test_q;
    negInf_uid57_fpExp2Test_b <= signX_uid7_fpExp2Test_b;
    negInf_uid57_fpExp2Test_q <= negInf_uid57_fpExp2Test_a and negInf_uid57_fpExp2Test_b;

	--ld_negInf_uid57_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_c(DELAY,218)@0
    ld_negInf_uid57_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => negInf_uid57_fpExp2Test_q, xout => ld_negInf_uid57_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--regXAndExpOverflowAndNeg_uid58_fpExp2Test(LOGICAL,57)@0
    regXAndExpOverflowAndNeg_uid58_fpExp2Test_a <= exc_R_uid31_fpExp2Test_q;
    regXAndExpOverflowAndNeg_uid58_fpExp2Test_b <= expOvfInitial_uid39_fpExp2Test_b;
    regXAndExpOverflowAndNeg_uid58_fpExp2Test_c <= signX_uid7_fpExp2Test_b;
    regXAndExpOverflowAndNeg_uid58_fpExp2Test_q <= regXAndExpOverflowAndNeg_uid58_fpExp2Test_a and regXAndExpOverflowAndNeg_uid58_fpExp2Test_b and regXAndExpOverflowAndNeg_uid58_fpExp2Test_c;

	--ld_regXAndExpOverflowAndNeg_uid58_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_b(DELAY,217)@0
    ld_regXAndExpOverflowAndNeg_uid58_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => regXAndExpOverflowAndNeg_uid58_fpExp2Test_q, xout => ld_regXAndExpOverflowAndNeg_uid58_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--expUdf_uid53_fpExp2Test(COMPARE,52)@6
    expUdf_uid53_fpExp2Test_cin <= GND_q;
    expUdf_uid53_fpExp2Test_a <= STD_LOGIC_VECTOR('0' & "00000000000" & GND_q) & '0';
    expUdf_uid53_fpExp2Test_b <= STD_LOGIC_VECTOR((12 downto 11 => reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1_q(10)) & reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1_q) & expUdf_uid53_fpExp2Test_cin(0);
            expUdf_uid53_fpExp2Test_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid53_fpExp2Test_a) - SIGNED(expUdf_uid53_fpExp2Test_b));
    expUdf_uid53_fpExp2Test_n(0) <= not expUdf_uid53_fpExp2Test_o(13);


	--regXAndUdf_uid60_fpExp2Test(LOGICAL,59)@6
    regXAndUdf_uid60_fpExp2Test_a <= ld_exc_R_uid31_fpExp2Test_q_to_regXAndUdf_uid60_fpExp2Test_a_q;
    regXAndUdf_uid60_fpExp2Test_b <= expUdf_uid53_fpExp2Test_n;
    regXAndUdf_uid60_fpExp2Test_c <= InvExpOvfInitial_uid59_fpExp2Test_q;
    regXAndUdf_uid60_fpExp2Test_q <= regXAndUdf_uid60_fpExp2Test_a and regXAndUdf_uid60_fpExp2Test_b and regXAndUdf_uid60_fpExp2Test_c;

	--excRZero_uid61_fpExp2Test(LOGICAL,60)@6
    excRZero_uid61_fpExp2Test_a <= regXAndUdf_uid60_fpExp2Test_q;
    excRZero_uid61_fpExp2Test_b <= ld_regXAndExpOverflowAndNeg_uid58_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_b_q;
    excRZero_uid61_fpExp2Test_c <= ld_negInf_uid57_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_c_q;
    excRZero_uid61_fpExp2Test_q <= excRZero_uid61_fpExp2Test_a or excRZero_uid61_fpExp2Test_b or excRZero_uid61_fpExp2Test_c;

	--concExc_uid69_fpExp2Test(BITJOIN,68)@6
    concExc_uid69_fpExp2Test_q <= ld_exc_N_uid27_fpExp2Test_q_to_concExc_uid69_fpExp2Test_c_q & excRInf_uid68_fpExp2Test_q & excRZero_uid61_fpExp2Test_q;

	--reg_concExc_uid69_fpExp2Test_0_to_excREnc_uid70_fpExp2Test_0(REG,159)@6
    reg_concExc_uid69_fpExp2Test_0_to_excREnc_uid70_fpExp2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid69_fpExp2Test_0_to_excREnc_uid70_fpExp2Test_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid69_fpExp2Test_0_to_excREnc_uid70_fpExp2Test_0_q <= concExc_uid69_fpExp2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--excREnc_uid70_fpExp2Test(LOOKUP,69)@7
    excREnc_uid70_fpExp2Test: PROCESS (reg_concExc_uid69_fpExp2Test_0_to_excREnc_uid70_fpExp2Test_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_concExc_uid69_fpExp2Test_0_to_excREnc_uid70_fpExp2Test_0_q) IS
                WHEN "000" =>  excREnc_uid70_fpExp2Test_q <= "01";
                WHEN "001" =>  excREnc_uid70_fpExp2Test_q <= "00";
                WHEN "010" =>  excREnc_uid70_fpExp2Test_q <= "10";
                WHEN "011" =>  excREnc_uid70_fpExp2Test_q <= "00";
                WHEN "100" =>  excREnc_uid70_fpExp2Test_q <= "11";
                WHEN "101" =>  excREnc_uid70_fpExp2Test_q <= "00";
                WHEN "110" =>  excREnc_uid70_fpExp2Test_q <= "00";
                WHEN "111" =>  excREnc_uid70_fpExp2Test_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid70_fpExp2Test_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid78_fpExp2Test(MUX,77)@7
    expRPostExc_uid78_fpExp2Test_s <= excREnc_uid70_fpExp2Test_q;
    expRPostExc_uid78_fpExp2Test: PROCESS (expRPostExc_uid78_fpExp2Test_s, en, cstZeroWE_uid13_fpExp2Test_q, ld_expR_uid56_fpExp2Test_b_to_expRPostExc_uid78_fpExp2Test_d_q, cstAllOWE_uid16_fpExp2Test_q, cstAllOWE_uid16_fpExp2Test_q)
    BEGIN
            CASE expRPostExc_uid78_fpExp2Test_s IS
                  WHEN "00" => expRPostExc_uid78_fpExp2Test_q <= cstZeroWE_uid13_fpExp2Test_q;
                  WHEN "01" => expRPostExc_uid78_fpExp2Test_q <= ld_expR_uid56_fpExp2Test_b_to_expRPostExc_uid78_fpExp2Test_d_q;
                  WHEN "10" => expRPostExc_uid78_fpExp2Test_q <= cstAllOWE_uid16_fpExp2Test_q;
                  WHEN "11" => expRPostExc_uid78_fpExp2Test_q <= cstAllOWE_uid16_fpExp2Test_q;
                  WHEN OTHERS => expRPostExc_uid78_fpExp2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_inputreg(DELAY,333)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPostExc_uid78_fpExp2Test_q, xout => ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdcnt(COUNTER,335)
    -- every=1, low=0, high=3, step=1, init=1
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdcnt_i <= TO_UNSIGNED(1,2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdcnt_i <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdcnt_i,2));


	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdreg(REG,336)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdreg_q <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--xIn(GPIN,3)@0

	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdmux(MUX,337)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdmux_s <= en;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdmux: PROCESS (ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdmux_s, ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdreg_q, ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdmux_s IS
                  WHEN "0" => ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdmux_q <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdreg_q;
                  WHEN "1" => ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdmux_q <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem(DUALMEM,334)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_ia <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_inputreg_q;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_aa <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdreg_q;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_ab <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_rdmux_q;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 8,
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
        clocken1 => ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_iq,
        address_a => ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_aa,
        data_a => ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_ia
    );
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_reset0 <= areset;
        ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_q <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_iq(7 downto 0);

	--oneFracRPostExc2_uid71_fpExp2Test(CONSTANT,70)
    oneFracRPostExc2_uid71_fpExp2Test_q <= "00000000000000000000001";

	--y_uid45_fpExp2Test(BITSELECT,44)@4
    y_uid45_fpExp2Test_in <= rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q(22 downto 0);
    y_uid45_fpExp2Test_b <= y_uid45_fpExp2Test_in(22 downto 0);

	--addr_uid47_fpExp2Test(BITSELECT,46)@4
    addr_uid47_fpExp2Test_in <= y_uid45_fpExp2Test_b;
    addr_uid47_fpExp2Test_b <= addr_uid47_fpExp2Test_in(22 downto 16);

	--reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid127_exp2TabGen_0(REG,160)@4
    reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid127_exp2TabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid127_exp2TabGen_0_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid127_exp2TabGen_0_q <= addr_uid47_fpExp2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid127_exp2TabGen(LOOKUP,126)@5
    memoryC2_uid127_exp2TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC2_uid127_exp2TabGen_q <= "001111011001";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid127_exp2TabGen_0_q) IS
                WHEN "0000000" =>  memoryC2_uid127_exp2TabGen_q <= "001111011001";
                WHEN "0000001" =>  memoryC2_uid127_exp2TabGen_q <= "001111100010";
                WHEN "0000010" =>  memoryC2_uid127_exp2TabGen_q <= "001111100110";
                WHEN "0000011" =>  memoryC2_uid127_exp2TabGen_q <= "001111101011";
                WHEN "0000100" =>  memoryC2_uid127_exp2TabGen_q <= "001111110000";
                WHEN "0000101" =>  memoryC2_uid127_exp2TabGen_q <= "001111110111";
                WHEN "0000110" =>  memoryC2_uid127_exp2TabGen_q <= "001111111100";
                WHEN "0000111" =>  memoryC2_uid127_exp2TabGen_q <= "010000000001";
                WHEN "0001000" =>  memoryC2_uid127_exp2TabGen_q <= "010000000110";
                WHEN "0001001" =>  memoryC2_uid127_exp2TabGen_q <= "010000001101";
                WHEN "0001010" =>  memoryC2_uid127_exp2TabGen_q <= "010000010010";
                WHEN "0001011" =>  memoryC2_uid127_exp2TabGen_q <= "010000010111";
                WHEN "0001100" =>  memoryC2_uid127_exp2TabGen_q <= "010000011101";
                WHEN "0001101" =>  memoryC2_uid127_exp2TabGen_q <= "010000100011";
                WHEN "0001110" =>  memoryC2_uid127_exp2TabGen_q <= "010000101001";
                WHEN "0001111" =>  memoryC2_uid127_exp2TabGen_q <= "010000101101";
                WHEN "0010000" =>  memoryC2_uid127_exp2TabGen_q <= "010000110011";
                WHEN "0010001" =>  memoryC2_uid127_exp2TabGen_q <= "010000111010";
                WHEN "0010010" =>  memoryC2_uid127_exp2TabGen_q <= "010001000000";
                WHEN "0010011" =>  memoryC2_uid127_exp2TabGen_q <= "010001000101";
                WHEN "0010100" =>  memoryC2_uid127_exp2TabGen_q <= "010001001011";
                WHEN "0010101" =>  memoryC2_uid127_exp2TabGen_q <= "010001010010";
                WHEN "0010110" =>  memoryC2_uid127_exp2TabGen_q <= "010001010110";
                WHEN "0010111" =>  memoryC2_uid127_exp2TabGen_q <= "010001011011";
                WHEN "0011000" =>  memoryC2_uid127_exp2TabGen_q <= "010001100101";
                WHEN "0011001" =>  memoryC2_uid127_exp2TabGen_q <= "010001101001";
                WHEN "0011010" =>  memoryC2_uid127_exp2TabGen_q <= "010001110011";
                WHEN "0011011" =>  memoryC2_uid127_exp2TabGen_q <= "010001110111";
                WHEN "0011100" =>  memoryC2_uid127_exp2TabGen_q <= "010001111011";
                WHEN "0011101" =>  memoryC2_uid127_exp2TabGen_q <= "010010000011";
                WHEN "0011110" =>  memoryC2_uid127_exp2TabGen_q <= "010010001001";
                WHEN "0011111" =>  memoryC2_uid127_exp2TabGen_q <= "010010001101";
                WHEN "0100000" =>  memoryC2_uid127_exp2TabGen_q <= "010010010110";
                WHEN "0100001" =>  memoryC2_uid127_exp2TabGen_q <= "010010011101";
                WHEN "0100010" =>  memoryC2_uid127_exp2TabGen_q <= "010010100011";
                WHEN "0100011" =>  memoryC2_uid127_exp2TabGen_q <= "010010101001";
                WHEN "0100100" =>  memoryC2_uid127_exp2TabGen_q <= "010010101111";
                WHEN "0100101" =>  memoryC2_uid127_exp2TabGen_q <= "010010110100";
                WHEN "0100110" =>  memoryC2_uid127_exp2TabGen_q <= "010010111100";
                WHEN "0100111" =>  memoryC2_uid127_exp2TabGen_q <= "010011000011";
                WHEN "0101000" =>  memoryC2_uid127_exp2TabGen_q <= "010011001001";
                WHEN "0101001" =>  memoryC2_uid127_exp2TabGen_q <= "010011001110";
                WHEN "0101010" =>  memoryC2_uid127_exp2TabGen_q <= "010011010111";
                WHEN "0101011" =>  memoryC2_uid127_exp2TabGen_q <= "010011011100";
                WHEN "0101100" =>  memoryC2_uid127_exp2TabGen_q <= "010011100011";
                WHEN "0101101" =>  memoryC2_uid127_exp2TabGen_q <= "010011101001";
                WHEN "0101110" =>  memoryC2_uid127_exp2TabGen_q <= "010011110011";
                WHEN "0101111" =>  memoryC2_uid127_exp2TabGen_q <= "010011110111";
                WHEN "0110000" =>  memoryC2_uid127_exp2TabGen_q <= "010011111101";
                WHEN "0110001" =>  memoryC2_uid127_exp2TabGen_q <= "010100001001";
                WHEN "0110010" =>  memoryC2_uid127_exp2TabGen_q <= "010100001111";
                WHEN "0110011" =>  memoryC2_uid127_exp2TabGen_q <= "010100010110";
                WHEN "0110100" =>  memoryC2_uid127_exp2TabGen_q <= "010100011110";
                WHEN "0110101" =>  memoryC2_uid127_exp2TabGen_q <= "010100100101";
                WHEN "0110110" =>  memoryC2_uid127_exp2TabGen_q <= "010100101010";
                WHEN "0110111" =>  memoryC2_uid127_exp2TabGen_q <= "010100110000";
                WHEN "0111000" =>  memoryC2_uid127_exp2TabGen_q <= "010100110110";
                WHEN "0111001" =>  memoryC2_uid127_exp2TabGen_q <= "010100111111";
                WHEN "0111010" =>  memoryC2_uid127_exp2TabGen_q <= "010101000101";
                WHEN "0111011" =>  memoryC2_uid127_exp2TabGen_q <= "010101001101";
                WHEN "0111100" =>  memoryC2_uid127_exp2TabGen_q <= "010101010101";
                WHEN "0111101" =>  memoryC2_uid127_exp2TabGen_q <= "010101011011";
                WHEN "0111110" =>  memoryC2_uid127_exp2TabGen_q <= "010101100101";
                WHEN "0111111" =>  memoryC2_uid127_exp2TabGen_q <= "010101101101";
                WHEN "1000000" =>  memoryC2_uid127_exp2TabGen_q <= "010101110100";
                WHEN "1000001" =>  memoryC2_uid127_exp2TabGen_q <= "010101111010";
                WHEN "1000010" =>  memoryC2_uid127_exp2TabGen_q <= "010110000001";
                WHEN "1000011" =>  memoryC2_uid127_exp2TabGen_q <= "010110001001";
                WHEN "1000100" =>  memoryC2_uid127_exp2TabGen_q <= "010110010001";
                WHEN "1000101" =>  memoryC2_uid127_exp2TabGen_q <= "010110011000";
                WHEN "1000110" =>  memoryC2_uid127_exp2TabGen_q <= "010110100011";
                WHEN "1000111" =>  memoryC2_uid127_exp2TabGen_q <= "010110101001";
                WHEN "1001000" =>  memoryC2_uid127_exp2TabGen_q <= "010110110000";
                WHEN "1001001" =>  memoryC2_uid127_exp2TabGen_q <= "010110111001";
                WHEN "1001010" =>  memoryC2_uid127_exp2TabGen_q <= "010111000010";
                WHEN "1001011" =>  memoryC2_uid127_exp2TabGen_q <= "010111001000";
                WHEN "1001100" =>  memoryC2_uid127_exp2TabGen_q <= "010111001111";
                WHEN "1001101" =>  memoryC2_uid127_exp2TabGen_q <= "010111011011";
                WHEN "1001110" =>  memoryC2_uid127_exp2TabGen_q <= "010111100001";
                WHEN "1001111" =>  memoryC2_uid127_exp2TabGen_q <= "010111100111";
                WHEN "1010000" =>  memoryC2_uid127_exp2TabGen_q <= "010111110100";
                WHEN "1010001" =>  memoryC2_uid127_exp2TabGen_q <= "010111111010";
                WHEN "1010010" =>  memoryC2_uid127_exp2TabGen_q <= "011000000010";
                WHEN "1010011" =>  memoryC2_uid127_exp2TabGen_q <= "011000001010";
                WHEN "1010100" =>  memoryC2_uid127_exp2TabGen_q <= "011000010011";
                WHEN "1010101" =>  memoryC2_uid127_exp2TabGen_q <= "011000011100";
                WHEN "1010110" =>  memoryC2_uid127_exp2TabGen_q <= "011000100011";
                WHEN "1010111" =>  memoryC2_uid127_exp2TabGen_q <= "011000101101";
                WHEN "1011000" =>  memoryC2_uid127_exp2TabGen_q <= "011000110101";
                WHEN "1011001" =>  memoryC2_uid127_exp2TabGen_q <= "011000111111";
                WHEN "1011010" =>  memoryC2_uid127_exp2TabGen_q <= "011001000110";
                WHEN "1011011" =>  memoryC2_uid127_exp2TabGen_q <= "011001001101";
                WHEN "1011100" =>  memoryC2_uid127_exp2TabGen_q <= "011001011001";
                WHEN "1011101" =>  memoryC2_uid127_exp2TabGen_q <= "011001100000";
                WHEN "1011110" =>  memoryC2_uid127_exp2TabGen_q <= "011001101001";
                WHEN "1011111" =>  memoryC2_uid127_exp2TabGen_q <= "011001110010";
                WHEN "1100000" =>  memoryC2_uid127_exp2TabGen_q <= "011001111001";
                WHEN "1100001" =>  memoryC2_uid127_exp2TabGen_q <= "011010000011";
                WHEN "1100010" =>  memoryC2_uid127_exp2TabGen_q <= "011010001100";
                WHEN "1100011" =>  memoryC2_uid127_exp2TabGen_q <= "011010011001";
                WHEN "1100100" =>  memoryC2_uid127_exp2TabGen_q <= "011010100000";
                WHEN "1100101" =>  memoryC2_uid127_exp2TabGen_q <= "011010101000";
                WHEN "1100110" =>  memoryC2_uid127_exp2TabGen_q <= "011010110010";
                WHEN "1100111" =>  memoryC2_uid127_exp2TabGen_q <= "011010111011";
                WHEN "1101000" =>  memoryC2_uid127_exp2TabGen_q <= "011011000100";
                WHEN "1101001" =>  memoryC2_uid127_exp2TabGen_q <= "011011001101";
                WHEN "1101010" =>  memoryC2_uid127_exp2TabGen_q <= "011011011001";
                WHEN "1101011" =>  memoryC2_uid127_exp2TabGen_q <= "011011100001";
                WHEN "1101100" =>  memoryC2_uid127_exp2TabGen_q <= "011011101001";
                WHEN "1101101" =>  memoryC2_uid127_exp2TabGen_q <= "011011110010";
                WHEN "1101110" =>  memoryC2_uid127_exp2TabGen_q <= "011011111111";
                WHEN "1101111" =>  memoryC2_uid127_exp2TabGen_q <= "011100000111";
                WHEN "1110000" =>  memoryC2_uid127_exp2TabGen_q <= "011100010010";
                WHEN "1110001" =>  memoryC2_uid127_exp2TabGen_q <= "011100011100";
                WHEN "1110010" =>  memoryC2_uid127_exp2TabGen_q <= "011100100110";
                WHEN "1110011" =>  memoryC2_uid127_exp2TabGen_q <= "011100110000";
                WHEN "1110100" =>  memoryC2_uid127_exp2TabGen_q <= "011100111001";
                WHEN "1110101" =>  memoryC2_uid127_exp2TabGen_q <= "011101000011";
                WHEN "1110110" =>  memoryC2_uid127_exp2TabGen_q <= "011101001110";
                WHEN "1110111" =>  memoryC2_uid127_exp2TabGen_q <= "011101011000";
                WHEN "1111000" =>  memoryC2_uid127_exp2TabGen_q <= "011101100001";
                WHEN "1111001" =>  memoryC2_uid127_exp2TabGen_q <= "011101101001";
                WHEN "1111010" =>  memoryC2_uid127_exp2TabGen_q <= "011101111000";
                WHEN "1111011" =>  memoryC2_uid127_exp2TabGen_q <= "011110000001";
                WHEN "1111100" =>  memoryC2_uid127_exp2TabGen_q <= "011110001010";
                WHEN "1111101" =>  memoryC2_uid127_exp2TabGen_q <= "011110010110";
                WHEN "1111110" =>  memoryC2_uid127_exp2TabGen_q <= "011110100010";
                WHEN "1111111" =>  memoryC2_uid127_exp2TabGen_q <= "011110101011";
                WHEN OTHERS =>
                    memoryC2_uid127_exp2TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--ld_y_uid45_fpExp2Test_b_to_yPPolyEval_uid48_fpExp2Test_a(DELAY,200)@4
    ld_y_uid45_fpExp2Test_b_to_yPPolyEval_uid48_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => y_uid45_fpExp2Test_b, xout => ld_y_uid45_fpExp2Test_b_to_yPPolyEval_uid48_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--yPPolyEval_uid48_fpExp2Test(BITSELECT,47)@5
    yPPolyEval_uid48_fpExp2Test_in <= ld_y_uid45_fpExp2Test_b_to_yPPolyEval_uid48_fpExp2Test_a_q(15 downto 0);
    yPPolyEval_uid48_fpExp2Test_b <= yPPolyEval_uid48_fpExp2Test_in(15 downto 0);

	--yT1_uid129_exp2PolyEval(BITSELECT,128)@5
    yT1_uid129_exp2PolyEval_in <= yPPolyEval_uid48_fpExp2Test_b;
    yT1_uid129_exp2PolyEval_b <= yT1_uid129_exp2PolyEval_in(15 downto 4);

	--reg_yT1_uid129_exp2PolyEval_0_to_prodXY_uid142_pT1_uid130_exp2PolyEval_0(REG,161)@5
    reg_yT1_uid129_exp2PolyEval_0_to_prodXY_uid142_pT1_uid130_exp2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid129_exp2PolyEval_0_to_prodXY_uid142_pT1_uid130_exp2PolyEval_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid129_exp2PolyEval_0_to_prodXY_uid142_pT1_uid130_exp2PolyEval_0_q <= yT1_uid129_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid142_pT1_uid130_exp2PolyEval(MULT,141)@6
    prodXY_uid142_pT1_uid130_exp2PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid142_pT1_uid130_exp2PolyEval_a),13)) * SIGNED(prodXY_uid142_pT1_uid130_exp2PolyEval_b);
    prodXY_uid142_pT1_uid130_exp2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid142_pT1_uid130_exp2PolyEval_a <= (others => '0');
            prodXY_uid142_pT1_uid130_exp2PolyEval_b <= (others => '0');
            prodXY_uid142_pT1_uid130_exp2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid142_pT1_uid130_exp2PolyEval_a <= reg_yT1_uid129_exp2PolyEval_0_to_prodXY_uid142_pT1_uid130_exp2PolyEval_0_q;
                prodXY_uid142_pT1_uid130_exp2PolyEval_b <= memoryC2_uid127_exp2TabGen_q;
                prodXY_uid142_pT1_uid130_exp2PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid142_pT1_uid130_exp2PolyEval_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid142_pT1_uid130_exp2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid142_pT1_uid130_exp2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid142_pT1_uid130_exp2PolyEval_q <= prodXY_uid142_pT1_uid130_exp2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid143_pT1_uid130_exp2PolyEval(BITSELECT,142)@9
    prodXYTruncFR_uid143_pT1_uid130_exp2PolyEval_in <= prodXY_uid142_pT1_uid130_exp2PolyEval_q;
    prodXYTruncFR_uid143_pT1_uid130_exp2PolyEval_b <= prodXYTruncFR_uid143_pT1_uid130_exp2PolyEval_in(23 downto 11);

	--highBBits_uid132_exp2PolyEval(BITSELECT,131)@9
    highBBits_uid132_exp2PolyEval_in <= prodXYTruncFR_uid143_pT1_uid130_exp2PolyEval_b;
    highBBits_uid132_exp2PolyEval_b <= highBBits_uid132_exp2PolyEval_in(12 downto 1);

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid125_exp2TabGen_0_q_to_memoryC1_uid125_exp2TabGen_a(DELAY,293)@5
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid125_exp2TabGen_0_q_to_memoryC1_uid125_exp2TabGen_a : dspba_delay
    GENERIC MAP ( width => 7, depth => 3 )
    PORT MAP ( xin => reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid127_exp2TabGen_0_q, xout => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid125_exp2TabGen_0_q_to_memoryC1_uid125_exp2TabGen_a_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid125_exp2TabGen(LOOKUP,124)@8
    memoryC1_uid125_exp2TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC1_uid125_exp2TabGen_q <= "001011000101110010001";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid125_exp2TabGen_0_q_to_memoryC1_uid125_exp2TabGen_a_q) IS
                WHEN "0000000" =>  memoryC1_uid125_exp2TabGen_q <= "001011000101110010001";
                WHEN "0000001" =>  memoryC1_uid125_exp2TabGen_q <= "001011001001101000011";
                WHEN "0000010" =>  memoryC1_uid125_exp2TabGen_q <= "001011001101100000100";
                WHEN "0000011" =>  memoryC1_uid125_exp2TabGen_q <= "001011010001011010000";
                WHEN "0000100" =>  memoryC1_uid125_exp2TabGen_q <= "001011010101010100101";
                WHEN "0000101" =>  memoryC1_uid125_exp2TabGen_q <= "001011011001010000100";
                WHEN "0000110" =>  memoryC1_uid125_exp2TabGen_q <= "001011011101001110001";
                WHEN "0000111" =>  memoryC1_uid125_exp2TabGen_q <= "001011100001001100111";
                WHEN "0001000" =>  memoryC1_uid125_exp2TabGen_q <= "001011100101001101010";
                WHEN "0001001" =>  memoryC1_uid125_exp2TabGen_q <= "001011101001001110101";
                WHEN "0001010" =>  memoryC1_uid125_exp2TabGen_q <= "001011101101010001101";
                WHEN "0001011" =>  memoryC1_uid125_exp2TabGen_q <= "001011110001010110001";
                WHEN "0001100" =>  memoryC1_uid125_exp2TabGen_q <= "001011110101011011111";
                WHEN "0001101" =>  memoryC1_uid125_exp2TabGen_q <= "001011111001100011001";
                WHEN "0001110" =>  memoryC1_uid125_exp2TabGen_q <= "001011111101101011101";
                WHEN "0001111" =>  memoryC1_uid125_exp2TabGen_q <= "001100000001110110000";
                WHEN "0010000" =>  memoryC1_uid125_exp2TabGen_q <= "001100000110000001100";
                WHEN "0010001" =>  memoryC1_uid125_exp2TabGen_q <= "001100001010001110011";
                WHEN "0010010" =>  memoryC1_uid125_exp2TabGen_q <= "001100001110011100110";
                WHEN "0010011" =>  memoryC1_uid125_exp2TabGen_q <= "001100010010101100110";
                WHEN "0010100" =>  memoryC1_uid125_exp2TabGen_q <= "001100010110111110010";
                WHEN "0010101" =>  memoryC1_uid125_exp2TabGen_q <= "001100011011010000111";
                WHEN "0010110" =>  memoryC1_uid125_exp2TabGen_q <= "001100011111100101100";
                WHEN "0010111" =>  memoryC1_uid125_exp2TabGen_q <= "001100100011111011100";
                WHEN "0011000" =>  memoryC1_uid125_exp2TabGen_q <= "001100101000010010011";
                WHEN "0011001" =>  memoryC1_uid125_exp2TabGen_q <= "001100101100101011100";
                WHEN "0011010" =>  memoryC1_uid125_exp2TabGen_q <= "001100110001000101100";
                WHEN "0011011" =>  memoryC1_uid125_exp2TabGen_q <= "001100110101100001101";
                WHEN "0011100" =>  memoryC1_uid125_exp2TabGen_q <= "001100111001111111100";
                WHEN "0011101" =>  memoryC1_uid125_exp2TabGen_q <= "001100111110011110011";
                WHEN "0011110" =>  memoryC1_uid125_exp2TabGen_q <= "001101000010111110111";
                WHEN "0011111" =>  memoryC1_uid125_exp2TabGen_q <= "001101000111100001011";
                WHEN "0100000" =>  memoryC1_uid125_exp2TabGen_q <= "001101001100000100110";
                WHEN "0100001" =>  memoryC1_uid125_exp2TabGen_q <= "001101010000101010001";
                WHEN "0100010" =>  memoryC1_uid125_exp2TabGen_q <= "001101010101010001000";
                WHEN "0100011" =>  memoryC1_uid125_exp2TabGen_q <= "001101011001111001101";
                WHEN "0100100" =>  memoryC1_uid125_exp2TabGen_q <= "001101011110100011110";
                WHEN "0100101" =>  memoryC1_uid125_exp2TabGen_q <= "001101100011001111110";
                WHEN "0100110" =>  memoryC1_uid125_exp2TabGen_q <= "001101100111111101000";
                WHEN "0100111" =>  memoryC1_uid125_exp2TabGen_q <= "001101101100101011111";
                WHEN "0101000" =>  memoryC1_uid125_exp2TabGen_q <= "001101110001011100101";
                WHEN "0101001" =>  memoryC1_uid125_exp2TabGen_q <= "001101110110001111001";
                WHEN "0101010" =>  memoryC1_uid125_exp2TabGen_q <= "001101111011000010110";
                WHEN "0101011" =>  memoryC1_uid125_exp2TabGen_q <= "001101111111111000110";
                WHEN "0101100" =>  memoryC1_uid125_exp2TabGen_q <= "001110000100110000000";
                WHEN "0101101" =>  memoryC1_uid125_exp2TabGen_q <= "001110001001101001001";
                WHEN "0101110" =>  memoryC1_uid125_exp2TabGen_q <= "001110001110100011011";
                WHEN "0101111" =>  memoryC1_uid125_exp2TabGen_q <= "001110010011100000010";
                WHEN "0110000" =>  memoryC1_uid125_exp2TabGen_q <= "001110011000011110100";
                WHEN "0110001" =>  memoryC1_uid125_exp2TabGen_q <= "001110011101011101110";
                WHEN "0110010" =>  memoryC1_uid125_exp2TabGen_q <= "001110100010011111100";
                WHEN "0110011" =>  memoryC1_uid125_exp2TabGen_q <= "001110100111100010111";
                WHEN "0110100" =>  memoryC1_uid125_exp2TabGen_q <= "001110101100100111111";
                WHEN "0110101" =>  memoryC1_uid125_exp2TabGen_q <= "001110110001101110110";
                WHEN "0110110" =>  memoryC1_uid125_exp2TabGen_q <= "001110110110110111101";
                WHEN "0110111" =>  memoryC1_uid125_exp2TabGen_q <= "001110111100000010010";
                WHEN "0111000" =>  memoryC1_uid125_exp2TabGen_q <= "001111000001001110101";
                WHEN "0111001" =>  memoryC1_uid125_exp2TabGen_q <= "001111000110011100011";
                WHEN "0111010" =>  memoryC1_uid125_exp2TabGen_q <= "001111001011101100100";
                WHEN "0111011" =>  memoryC1_uid125_exp2TabGen_q <= "001111010000111110001";
                WHEN "0111100" =>  memoryC1_uid125_exp2TabGen_q <= "001111010110010001100";
                WHEN "0111101" =>  memoryC1_uid125_exp2TabGen_q <= "001111011011100111000";
                WHEN "0111110" =>  memoryC1_uid125_exp2TabGen_q <= "001111100000111101111";
                WHEN "0111111" =>  memoryC1_uid125_exp2TabGen_q <= "001111100110010111000";
                WHEN "1000000" =>  memoryC1_uid125_exp2TabGen_q <= "001111101011110001111";
                WHEN "1000001" =>  memoryC1_uid125_exp2TabGen_q <= "001111110001001111000";
                WHEN "1000010" =>  memoryC1_uid125_exp2TabGen_q <= "001111110110101101110";
                WHEN "1000011" =>  memoryC1_uid125_exp2TabGen_q <= "001111111100001110011";
                WHEN "1000100" =>  memoryC1_uid125_exp2TabGen_q <= "010000000001110000111";
                WHEN "1000101" =>  memoryC1_uid125_exp2TabGen_q <= "010000000111010101011";
                WHEN "1000110" =>  memoryC1_uid125_exp2TabGen_q <= "010000001100111011011";
                WHEN "1000111" =>  memoryC1_uid125_exp2TabGen_q <= "010000010010100100000";
                WHEN "1001000" =>  memoryC1_uid125_exp2TabGen_q <= "010000011000001110011";
                WHEN "1001001" =>  memoryC1_uid125_exp2TabGen_q <= "010000011101111010101";
                WHEN "1001010" =>  memoryC1_uid125_exp2TabGen_q <= "010000100011101000101";
                WHEN "1001011" =>  memoryC1_uid125_exp2TabGen_q <= "010000101001011001001";
                WHEN "1001100" =>  memoryC1_uid125_exp2TabGen_q <= "010000101111001011100";
                WHEN "1001101" =>  memoryC1_uid125_exp2TabGen_q <= "010000110100111111010";
                WHEN "1001110" =>  memoryC1_uid125_exp2TabGen_q <= "010000111010110101110";
                WHEN "1001111" =>  memoryC1_uid125_exp2TabGen_q <= "010001000000101110011";
                WHEN "1010000" =>  memoryC1_uid125_exp2TabGen_q <= "010001000110101000001";
                WHEN "1010001" =>  memoryC1_uid125_exp2TabGen_q <= "010001001100100100110";
                WHEN "1010010" =>  memoryC1_uid125_exp2TabGen_q <= "010001010010100011011";
                WHEN "1010011" =>  memoryC1_uid125_exp2TabGen_q <= "010001011000100011111";
                WHEN "1010100" =>  memoryC1_uid125_exp2TabGen_q <= "010001011110100110100";
                WHEN "1010101" =>  memoryC1_uid125_exp2TabGen_q <= "010001100100101011001";
                WHEN "1010110" =>  memoryC1_uid125_exp2TabGen_q <= "010001101010110010001";
                WHEN "1010111" =>  memoryC1_uid125_exp2TabGen_q <= "010001110000111011000";
                WHEN "1011000" =>  memoryC1_uid125_exp2TabGen_q <= "010001110111000110000";
                WHEN "1011001" =>  memoryC1_uid125_exp2TabGen_q <= "010001111101010011001";
                WHEN "1011010" =>  memoryC1_uid125_exp2TabGen_q <= "010010000011100010110";
                WHEN "1011011" =>  memoryC1_uid125_exp2TabGen_q <= "010010001001110100100";
                WHEN "1011100" =>  memoryC1_uid125_exp2TabGen_q <= "010010010000000111111";
                WHEN "1011101" =>  memoryC1_uid125_exp2TabGen_q <= "010010010110011110000";
                WHEN "1011110" =>  memoryC1_uid125_exp2TabGen_q <= "010010011100110110010";
                WHEN "1011111" =>  memoryC1_uid125_exp2TabGen_q <= "010010100011010000100";
                WHEN "1100000" =>  memoryC1_uid125_exp2TabGen_q <= "010010101001101101011";
                WHEN "1100001" =>  memoryC1_uid125_exp2TabGen_q <= "010010110000001100001";
                WHEN "1100010" =>  memoryC1_uid125_exp2TabGen_q <= "010010110110101101001";
                WHEN "1100011" =>  memoryC1_uid125_exp2TabGen_q <= "010010111101010000000";
                WHEN "1100100" =>  memoryC1_uid125_exp2TabGen_q <= "010011000011110101111";
                WHEN "1100101" =>  memoryC1_uid125_exp2TabGen_q <= "010011001010011110000";
                WHEN "1100110" =>  memoryC1_uid125_exp2TabGen_q <= "010011010001001000001";
                WHEN "1100111" =>  memoryC1_uid125_exp2TabGen_q <= "010011010111110100101";
                WHEN "1101000" =>  memoryC1_uid125_exp2TabGen_q <= "010011011110100011101";
                WHEN "1101001" =>  memoryC1_uid125_exp2TabGen_q <= "010011100101010100110";
                WHEN "1101010" =>  memoryC1_uid125_exp2TabGen_q <= "010011101100001000000";
                WHEN "1101011" =>  memoryC1_uid125_exp2TabGen_q <= "010011110010111110001";
                WHEN "1101100" =>  memoryC1_uid125_exp2TabGen_q <= "010011111001110110101";
                WHEN "1101101" =>  memoryC1_uid125_exp2TabGen_q <= "010100000000110001011";
                WHEN "1101110" =>  memoryC1_uid125_exp2TabGen_q <= "010100000111101110000";
                WHEN "1101111" =>  memoryC1_uid125_exp2TabGen_q <= "010100001110101101110";
                WHEN "1110000" =>  memoryC1_uid125_exp2TabGen_q <= "010100010101101111101";
                WHEN "1110001" =>  memoryC1_uid125_exp2TabGen_q <= "010100011100110011111";
                WHEN "1110010" =>  memoryC1_uid125_exp2TabGen_q <= "010100100011111010110";
                WHEN "1110011" =>  memoryC1_uid125_exp2TabGen_q <= "010100101011000100000";
                WHEN "1110100" =>  memoryC1_uid125_exp2TabGen_q <= "010100110010001111111";
                WHEN "1110101" =>  memoryC1_uid125_exp2TabGen_q <= "010100111001011110010";
                WHEN "1110110" =>  memoryC1_uid125_exp2TabGen_q <= "010101000000101110111";
                WHEN "1110111" =>  memoryC1_uid125_exp2TabGen_q <= "010101001000000010010";
                WHEN "1111000" =>  memoryC1_uid125_exp2TabGen_q <= "010101001111011000001";
                WHEN "1111001" =>  memoryC1_uid125_exp2TabGen_q <= "010101010110110000111";
                WHEN "1111010" =>  memoryC1_uid125_exp2TabGen_q <= "010101011110001011010";
                WHEN "1111011" =>  memoryC1_uid125_exp2TabGen_q <= "010101100101101001000";
                WHEN "1111100" =>  memoryC1_uid125_exp2TabGen_q <= "010101101101001001010";
                WHEN "1111101" =>  memoryC1_uid125_exp2TabGen_q <= "010101110100101011110";
                WHEN "1111110" =>  memoryC1_uid125_exp2TabGen_q <= "010101111100010001000";
                WHEN "1111111" =>  memoryC1_uid125_exp2TabGen_q <= "010110000011111001010";
                WHEN OTHERS =>
                    memoryC1_uid125_exp2TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid133_exp2PolyEval(ADD,132)@9
    sumAHighB_uid133_exp2PolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid125_exp2TabGen_q(20)) & memoryC1_uid125_exp2TabGen_q);
    sumAHighB_uid133_exp2PolyEval_b <= STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid132_exp2PolyEval_b(11)) & highBBits_uid132_exp2PolyEval_b);
            sumAHighB_uid133_exp2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid133_exp2PolyEval_a) + SIGNED(sumAHighB_uid133_exp2PolyEval_b));
    sumAHighB_uid133_exp2PolyEval_q <= sumAHighB_uid133_exp2PolyEval_o(21 downto 0);


	--lowRangeB_uid131_exp2PolyEval(BITSELECT,130)@9
    lowRangeB_uid131_exp2PolyEval_in <= prodXYTruncFR_uid143_pT1_uid130_exp2PolyEval_b(0 downto 0);
    lowRangeB_uid131_exp2PolyEval_b <= lowRangeB_uid131_exp2PolyEval_in(0 downto 0);

	--s1_uid131_uid134_exp2PolyEval(BITJOIN,133)@9
    s1_uid131_uid134_exp2PolyEval_q <= sumAHighB_uid133_exp2PolyEval_q & lowRangeB_uid131_exp2PolyEval_b;

	--reg_s1_uid131_uid134_exp2PolyEval_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_1(REG,164)@9
    reg_s1_uid131_uid134_exp2PolyEval_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid131_uid134_exp2PolyEval_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid131_uid134_exp2PolyEval_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_1_q <= s1_uid131_uid134_exp2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_nor(LOGICAL,354)
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_nor_a <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_notEnable_q;
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_nor_b <= ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_nor_q <= not (ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_nor_a or ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_nor_b);

	--ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_cmpReg(REG,352)
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_sticky_ena(REG,355)
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_nor_q = "1") THEN
                ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_sticky_ena_q <= ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_enaAnd(LOGICAL,356)
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_enaAnd_a <= ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_enaAnd_b <= en;
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_enaAnd_q <= ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_enaAnd_a and ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_enaAnd_b;

	--reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0(REG,163)@5
    reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q <= yPPolyEval_uid48_fpExp2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_inputreg(DELAY,346)
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q, xout => ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdcnt(COUNTER,348)
    -- every=1, low=0, high=1, step=1, init=1
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdcnt_i <= ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdcnt_i,1));


	--ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdreg(REG,349)
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdreg_q <= ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdmux(MUX,350)
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdmux_s <= en;
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdmux: PROCESS (ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdmux_s, ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdreg_q, ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdmux_q <= ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdmux_q <= ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem(DUALMEM,347)
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_ia <= ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_inputreg_q;
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_aa <= ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdreg_q;
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_ab <= ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_rdmux_q;
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_iq,
        address_a => ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_aa,
        data_a => ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_ia
    );
    ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_reset0 <= areset;
        ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_q <= ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_iq(15 downto 0);

	--prodXY_uid145_pT2_uid136_exp2PolyEval(MULT,144)@10
    prodXY_uid145_pT2_uid136_exp2PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid145_pT2_uid136_exp2PolyEval_a),17)) * SIGNED(prodXY_uid145_pT2_uid136_exp2PolyEval_b);
    prodXY_uid145_pT2_uid136_exp2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid145_pT2_uid136_exp2PolyEval_a <= (others => '0');
            prodXY_uid145_pT2_uid136_exp2PolyEval_b <= (others => '0');
            prodXY_uid145_pT2_uid136_exp2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid145_pT2_uid136_exp2PolyEval_a <= ld_reg_yPPolyEval_uid48_fpExp2Test_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_0_q_to_prodXY_uid145_pT2_uid136_exp2PolyEval_a_replace_mem_q;
                prodXY_uid145_pT2_uid136_exp2PolyEval_b <= reg_s1_uid131_uid134_exp2PolyEval_0_to_prodXY_uid145_pT2_uid136_exp2PolyEval_1_q;
                prodXY_uid145_pT2_uid136_exp2PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid145_pT2_uid136_exp2PolyEval_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid145_pT2_uid136_exp2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid145_pT2_uid136_exp2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid145_pT2_uid136_exp2PolyEval_q <= prodXY_uid145_pT2_uid136_exp2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid146_pT2_uid136_exp2PolyEval(BITSELECT,145)@13
    prodXYTruncFR_uid146_pT2_uid136_exp2PolyEval_in <= prodXY_uid145_pT2_uid136_exp2PolyEval_q;
    prodXYTruncFR_uid146_pT2_uid136_exp2PolyEval_b <= prodXYTruncFR_uid146_pT2_uid136_exp2PolyEval_in(38 downto 15);

	--highBBits_uid138_exp2PolyEval(BITSELECT,137)@13
    highBBits_uid138_exp2PolyEval_in <= prodXYTruncFR_uid146_pT2_uid136_exp2PolyEval_b;
    highBBits_uid138_exp2PolyEval_b <= highBBits_uid138_exp2PolyEval_in(23 downto 2);

	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_nor(LOGICAL,367)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_nor_a <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_notEnable_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_nor_b <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_sticky_ena_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_nor_q <= not (ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_nor_a or ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_nor_b);

	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_mem_top(CONSTANT,363)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_mem_top_q <= "0100";

	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmp(LOGICAL,364)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmp_a <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_mem_top_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdmux_q);
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmp_q <= "1" when ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmp_a = ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmp_b else "0";

	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmpReg(REG,365)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmpReg_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_sticky_ena(REG,368)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_nor_q = "1") THEN
                ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_sticky_ena_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_enaAnd(LOGICAL,369)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_enaAnd_a <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_sticky_ena_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_enaAnd_b <= en;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_enaAnd_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_enaAnd_a and ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_enaAnd_b;

	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_inputreg(DELAY,357)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => addr_uid47_fpExp2Test_b, xout => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt(COUNTER,359)
    -- every=1, low=0, high=4, step=1, init=1
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_i = 3 THEN
                      ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_eq = '1') THEN
                        ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_i <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_i <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_i,3));


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdreg(REG,360)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdreg_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdmux(MUX,361)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdmux_s <= en;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdmux: PROCESS (ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdmux_s, ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdreg_q, ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdmux_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdreg_q;
                  WHEN "1" => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdmux_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem(DUALMEM,358)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_ia <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_inputreg_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_aa <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdreg_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_ab <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_rdmux_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_iq,
        address_a => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_aa,
        data_a => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_ia
    );
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_reset0 <= areset;
        ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_iq(6 downto 0);

	--reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0(REG,165)@11
    reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid123_exp2TabGen(LOOKUP,122)@12
    memoryC0_uid123_exp2TabGen: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC0_uid123_exp2TabGen_q <= "0100000000000000000000000100";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid123_exp2TabGen_0_q) IS
                WHEN "0000000" =>  memoryC0_uid123_exp2TabGen_q <= "0100000000000000000000000100";
                WHEN "0000001" =>  memoryC0_uid123_exp2TabGen_q <= "0100000001011000111101101111";
                WHEN "0000010" =>  memoryC0_uid123_exp2TabGen_q <= "0100000010110010011010010100";
                WHEN "0000011" =>  memoryC0_uid123_exp2TabGen_q <= "0100000100001100010101111110";
                WHEN "0000100" =>  memoryC0_uid123_exp2TabGen_q <= "0100000101100110110000111001";
                WHEN "0000101" =>  memoryC0_uid123_exp2TabGen_q <= "0100000111000001101011001111";
                WHEN "0000110" =>  memoryC0_uid123_exp2TabGen_q <= "0100001000011101000101001010";
                WHEN "0000111" =>  memoryC0_uid123_exp2TabGen_q <= "0100001001111000111110110111";
                WHEN "0001000" =>  memoryC0_uid123_exp2TabGen_q <= "0100001011010101011000011111";
                WHEN "0001001" =>  memoryC0_uid123_exp2TabGen_q <= "0100001100110010010010001111";
                WHEN "0001010" =>  memoryC0_uid123_exp2TabGen_q <= "0100001110001111101100010001";
                WHEN "0001011" =>  memoryC0_uid123_exp2TabGen_q <= "0100001111101101100110110000";
                WHEN "0001100" =>  memoryC0_uid123_exp2TabGen_q <= "0100010001001100000001111000";
                WHEN "0001101" =>  memoryC0_uid123_exp2TabGen_q <= "0100010010101010111101110100";
                WHEN "0001110" =>  memoryC0_uid123_exp2TabGen_q <= "0100010100001010011010110000";
                WHEN "0001111" =>  memoryC0_uid123_exp2TabGen_q <= "0100010101101010011000110110";
                WHEN "0010000" =>  memoryC0_uid123_exp2TabGen_q <= "0100010111001010111000010011";
                WHEN "0010001" =>  memoryC0_uid123_exp2TabGen_q <= "0100011000101011111001010010";
                WHEN "0010010" =>  memoryC0_uid123_exp2TabGen_q <= "0100011010001101011011111111";
                WHEN "0010011" =>  memoryC0_uid123_exp2TabGen_q <= "0100011011101111100000100101";
                WHEN "0010100" =>  memoryC0_uid123_exp2TabGen_q <= "0100011101010010000111010000";
                WHEN "0010101" =>  memoryC0_uid123_exp2TabGen_q <= "0100011110110101010000001101";
                WHEN "0010110" =>  memoryC0_uid123_exp2TabGen_q <= "0100100000011000111011100110";
                WHEN "0010111" =>  memoryC0_uid123_exp2TabGen_q <= "0100100001111101001001101000";
                WHEN "0011000" =>  memoryC0_uid123_exp2TabGen_q <= "0100100011100001111010100000";
                WHEN "0011001" =>  memoryC0_uid123_exp2TabGen_q <= "0100100101000111001110011000";
                WHEN "0011010" =>  memoryC0_uid123_exp2TabGen_q <= "0100100110101101000101011110";
                WHEN "0011011" =>  memoryC0_uid123_exp2TabGen_q <= "0100101000010011011111111101";
                WHEN "0011100" =>  memoryC0_uid123_exp2TabGen_q <= "0100101001111010011110000001";
                WHEN "0011101" =>  memoryC0_uid123_exp2TabGen_q <= "0100101011100001111111111000";
                WHEN "0011110" =>  memoryC0_uid123_exp2TabGen_q <= "0100101101001010000101101110";
                WHEN "0011111" =>  memoryC0_uid123_exp2TabGen_q <= "0100101110110010101111101110";
                WHEN "0100000" =>  memoryC0_uid123_exp2TabGen_q <= "0100110000011011111110000111";
                WHEN "0100001" =>  memoryC0_uid123_exp2TabGen_q <= "0100110010000101110001000011";
                WHEN "0100010" =>  memoryC0_uid123_exp2TabGen_q <= "0100110011110000001000110001";
                WHEN "0100011" =>  memoryC0_uid123_exp2TabGen_q <= "0100110101011011000101011100";
                WHEN "0100100" =>  memoryC0_uid123_exp2TabGen_q <= "0100110111000110100111010010";
                WHEN "0100101" =>  memoryC0_uid123_exp2TabGen_q <= "0100111000110010101110011111";
                WHEN "0100110" =>  memoryC0_uid123_exp2TabGen_q <= "0100111010011111011011010001";
                WHEN "0100111" =>  memoryC0_uid123_exp2TabGen_q <= "0100111100001100101101110101";
                WHEN "0101000" =>  memoryC0_uid123_exp2TabGen_q <= "0100111101111010100110010111";
                WHEN "0101001" =>  memoryC0_uid123_exp2TabGen_q <= "0100111111101001000101000101";
                WHEN "0101010" =>  memoryC0_uid123_exp2TabGen_q <= "0101000001011000001010001101";
                WHEN "0101011" =>  memoryC0_uid123_exp2TabGen_q <= "0101000011000111110101111010";
                WHEN "0101100" =>  memoryC0_uid123_exp2TabGen_q <= "0101000100111000001000011100";
                WHEN "0101101" =>  memoryC0_uid123_exp2TabGen_q <= "0101000110101001000001111111";
                WHEN "0101110" =>  memoryC0_uid123_exp2TabGen_q <= "0101001000011010100010110010";
                WHEN "0101111" =>  memoryC0_uid123_exp2TabGen_q <= "0101001010001100101011000000";
                WHEN "0110000" =>  memoryC0_uid123_exp2TabGen_q <= "0101001011111111011010111001";
                WHEN "0110001" =>  memoryC0_uid123_exp2TabGen_q <= "0101001101110010110010101011";
                WHEN "0110010" =>  memoryC0_uid123_exp2TabGen_q <= "0101001111100110110010100010";
                WHEN "0110011" =>  memoryC0_uid123_exp2TabGen_q <= "0101010001011011011010101101";
                WHEN "0110100" =>  memoryC0_uid123_exp2TabGen_q <= "0101010011010000101011011010";
                WHEN "0110101" =>  memoryC0_uid123_exp2TabGen_q <= "0101010101000110100100110111";
                WHEN "0110110" =>  memoryC0_uid123_exp2TabGen_q <= "0101010110111101000111010010";
                WHEN "0110111" =>  memoryC0_uid123_exp2TabGen_q <= "0101011000110100010010111001";
                WHEN "0111000" =>  memoryC0_uid123_exp2TabGen_q <= "0101011010101100000111111011";
                WHEN "0111001" =>  memoryC0_uid123_exp2TabGen_q <= "0101011100100100100110100111";
                WHEN "0111010" =>  memoryC0_uid123_exp2TabGen_q <= "0101011110011101101111001001";
                WHEN "0111011" =>  memoryC0_uid123_exp2TabGen_q <= "0101100000010111100001110010";
                WHEN "0111100" =>  memoryC0_uid123_exp2TabGen_q <= "0101100010010001111110110000";
                WHEN "0111101" =>  memoryC0_uid123_exp2TabGen_q <= "0101100100001101000110010001";
                WHEN "0111110" =>  memoryC0_uid123_exp2TabGen_q <= "0101100110001000111000100101";
                WHEN "0111111" =>  memoryC0_uid123_exp2TabGen_q <= "0101101000000101010101111001";
                WHEN "1000000" =>  memoryC0_uid123_exp2TabGen_q <= "0101101010000010011110011110";
                WHEN "1000001" =>  memoryC0_uid123_exp2TabGen_q <= "0101101100000000010010100001";
                WHEN "1000010" =>  memoryC0_uid123_exp2TabGen_q <= "0101101101111110110010010011";
                WHEN "1000011" =>  memoryC0_uid123_exp2TabGen_q <= "0101101111111101111110000010";
                WHEN "1000100" =>  memoryC0_uid123_exp2TabGen_q <= "0101110001111101110101111110";
                WHEN "1000101" =>  memoryC0_uid123_exp2TabGen_q <= "0101110011111110011010010110";
                WHEN "1000110" =>  memoryC0_uid123_exp2TabGen_q <= "0101110101111111101011011010";
                WHEN "1000111" =>  memoryC0_uid123_exp2TabGen_q <= "0101111000000001101001011000";
                WHEN "1001000" =>  memoryC0_uid123_exp2TabGen_q <= "0101111010000100010100100001";
                WHEN "1001001" =>  memoryC0_uid123_exp2TabGen_q <= "0101111100000111101101000100";
                WHEN "1001010" =>  memoryC0_uid123_exp2TabGen_q <= "0101111110001011110011010010";
                WHEN "1001011" =>  memoryC0_uid123_exp2TabGen_q <= "0110000000010000100111011001";
                WHEN "1001100" =>  memoryC0_uid123_exp2TabGen_q <= "0110000010010110001001101010";
                WHEN "1001101" =>  memoryC0_uid123_exp2TabGen_q <= "0110000100011100011010010110";
                WHEN "1001110" =>  memoryC0_uid123_exp2TabGen_q <= "0110000110100011011001101011";
                WHEN "1001111" =>  memoryC0_uid123_exp2TabGen_q <= "0110001000101011000111111010";
                WHEN "1010000" =>  memoryC0_uid123_exp2TabGen_q <= "0110001010110011100101010101";
                WHEN "1010001" =>  memoryC0_uid123_exp2TabGen_q <= "0110001100111100110010001010";
                WHEN "1010010" =>  memoryC0_uid123_exp2TabGen_q <= "0110001111000110101110101010";
                WHEN "1010011" =>  memoryC0_uid123_exp2TabGen_q <= "0110010001010001011011000111";
                WHEN "1010100" =>  memoryC0_uid123_exp2TabGen_q <= "0110010011011100110111110000";
                WHEN "1010101" =>  memoryC0_uid123_exp2TabGen_q <= "0110010101101001000100110111";
                WHEN "1010110" =>  memoryC0_uid123_exp2TabGen_q <= "0110010111110110000010101100";
                WHEN "1010111" =>  memoryC0_uid123_exp2TabGen_q <= "0110011010000011110001100000";
                WHEN "1011000" =>  memoryC0_uid123_exp2TabGen_q <= "0110011100010010010001100101";
                WHEN "1011001" =>  memoryC0_uid123_exp2TabGen_q <= "0110011110100001100011001011";
                WHEN "1011010" =>  memoryC0_uid123_exp2TabGen_q <= "0110100000110001100110100011";
                WHEN "1011011" =>  memoryC0_uid123_exp2TabGen_q <= "0110100011000010011011111111";
                WHEN "1011100" =>  memoryC0_uid123_exp2TabGen_q <= "0110100101010100000011110001";
                WHEN "1011101" =>  memoryC0_uid123_exp2TabGen_q <= "0110100111100110011110001001";
                WHEN "1011110" =>  memoryC0_uid123_exp2TabGen_q <= "0110101001111001101011011001";
                WHEN "1011111" =>  memoryC0_uid123_exp2TabGen_q <= "0110101100001101101011110100";
                WHEN "1100000" =>  memoryC0_uid123_exp2TabGen_q <= "0110101110100010011111101010";
                WHEN "1100001" =>  memoryC0_uid123_exp2TabGen_q <= "0110110000111000000111001110";
                WHEN "1100010" =>  memoryC0_uid123_exp2TabGen_q <= "0110110011001110100010110010";
                WHEN "1100011" =>  memoryC0_uid123_exp2TabGen_q <= "0110110101100101110010101000";
                WHEN "1100100" =>  memoryC0_uid123_exp2TabGen_q <= "0110110111111101110111000001";
                WHEN "1100101" =>  memoryC0_uid123_exp2TabGen_q <= "0110111010010110110000010000";
                WHEN "1100110" =>  memoryC0_uid123_exp2TabGen_q <= "0110111100110000011110101000";
                WHEN "1100111" =>  memoryC0_uid123_exp2TabGen_q <= "0110111111001011000010011011";
                WHEN "1101000" =>  memoryC0_uid123_exp2TabGen_q <= "0111000001100110011011111011";
                WHEN "1101001" =>  memoryC0_uid123_exp2TabGen_q <= "0111000100000010101011011100";
                WHEN "1101010" =>  memoryC0_uid123_exp2TabGen_q <= "0111000110011111110001010000";
                WHEN "1101011" =>  memoryC0_uid123_exp2TabGen_q <= "0111001000111101101101101001";
                WHEN "1101100" =>  memoryC0_uid123_exp2TabGen_q <= "0111001011011100100000111011";
                WHEN "1101101" =>  memoryC0_uid123_exp2TabGen_q <= "0111001101111100001011011001";
                WHEN "1101110" =>  memoryC0_uid123_exp2TabGen_q <= "0111010000011100101101010111";
                WHEN "1101111" =>  memoryC0_uid123_exp2TabGen_q <= "0111010010111110000111000110";
                WHEN "1110000" =>  memoryC0_uid123_exp2TabGen_q <= "0111010101100000011000111011";
                WHEN "1110001" =>  memoryC0_uid123_exp2TabGen_q <= "0111011000000011100011001010";
                WHEN "1110010" =>  memoryC0_uid123_exp2TabGen_q <= "0111011010100111100110000101";
                WHEN "1110011" =>  memoryC0_uid123_exp2TabGen_q <= "0111011101001100100010000001";
                WHEN "1110100" =>  memoryC0_uid123_exp2TabGen_q <= "0111011111110010010111010001";
                WHEN "1110101" =>  memoryC0_uid123_exp2TabGen_q <= "0111100010011001000110001001";
                WHEN "1110110" =>  memoryC0_uid123_exp2TabGen_q <= "0111100101000000101110111110";
                WHEN "1110111" =>  memoryC0_uid123_exp2TabGen_q <= "0111100111101001010010000011";
                WHEN "1111000" =>  memoryC0_uid123_exp2TabGen_q <= "0111101010010010101111101101";
                WHEN "1111001" =>  memoryC0_uid123_exp2TabGen_q <= "0111101100111101001000001111";
                WHEN "1111010" =>  memoryC0_uid123_exp2TabGen_q <= "0111101111101000011100000000";
                WHEN "1111011" =>  memoryC0_uid123_exp2TabGen_q <= "0111110010010100101011010010";
                WHEN "1111100" =>  memoryC0_uid123_exp2TabGen_q <= "0111110101000001110110011011";
                WHEN "1111101" =>  memoryC0_uid123_exp2TabGen_q <= "0111110111101111111101110000";
                WHEN "1111110" =>  memoryC0_uid123_exp2TabGen_q <= "0111111010011111000001100101";
                WHEN "1111111" =>  memoryC0_uid123_exp2TabGen_q <= "0111111101001111000010001111";
                WHEN OTHERS =>
                    memoryC0_uid123_exp2TabGen_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid139_exp2PolyEval(ADD,138)@13
    sumAHighB_uid139_exp2PolyEval_a <= STD_LOGIC_VECTOR((28 downto 28 => memoryC0_uid123_exp2TabGen_q(27)) & memoryC0_uid123_exp2TabGen_q);
    sumAHighB_uid139_exp2PolyEval_b <= STD_LOGIC_VECTOR((28 downto 22 => highBBits_uid138_exp2PolyEval_b(21)) & highBBits_uid138_exp2PolyEval_b);
            sumAHighB_uid139_exp2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid139_exp2PolyEval_a) + SIGNED(sumAHighB_uid139_exp2PolyEval_b));
    sumAHighB_uid139_exp2PolyEval_q <= sumAHighB_uid139_exp2PolyEval_o(28 downto 0);


	--lowRangeB_uid137_exp2PolyEval(BITSELECT,136)@13
    lowRangeB_uid137_exp2PolyEval_in <= prodXYTruncFR_uid146_pT2_uid136_exp2PolyEval_b(1 downto 0);
    lowRangeB_uid137_exp2PolyEval_b <= lowRangeB_uid137_exp2PolyEval_in(1 downto 0);

	--s2_uid137_uid140_exp2PolyEval(BITJOIN,139)@13
    s2_uid137_uid140_exp2PolyEval_q <= sumAHighB_uid139_exp2PolyEval_q & lowRangeB_uid137_exp2PolyEval_b;

	--peOR_uid50_fpExp2Test(BITSELECT,49)@13
    peOR_uid50_fpExp2Test_in <= s2_uid137_uid140_exp2PolyEval_q(28 downto 0);
    peOR_uid50_fpExp2Test_b <= peOR_uid50_fpExp2Test_in(28 downto 5);

	--fracR_uid52_fpExp2Test(BITSELECT,51)@13
    fracR_uid52_fpExp2Test_in <= peOR_uid50_fpExp2Test_b(22 downto 0);
    fracR_uid52_fpExp2Test_b <= fracR_uid52_fpExp2Test_in(22 downto 0);

	--ld_excREnc_uid70_fpExp2Test_q_to_fracRPostExc_uid74_fpExp2Test_b(DELAY,235)@7
    ld_excREnc_uid70_fpExp2Test_q_to_fracRPostExc_uid74_fpExp2Test_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 6 )
    PORT MAP ( xin => excREnc_uid70_fpExp2Test_q, xout => ld_excREnc_uid70_fpExp2Test_q_to_fracRPostExc_uid74_fpExp2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid74_fpExp2Test(MUX,73)@13
    fracRPostExc_uid74_fpExp2Test_s <= ld_excREnc_uid70_fpExp2Test_q_to_fracRPostExc_uid74_fpExp2Test_b_q;
    fracRPostExc_uid74_fpExp2Test: PROCESS (fracRPostExc_uid74_fpExp2Test_s, en, cstAllZWF_uid17_fpExp2Test_q, fracR_uid52_fpExp2Test_b, cstAllZWF_uid17_fpExp2Test_q, oneFracRPostExc2_uid71_fpExp2Test_q)
    BEGIN
            CASE fracRPostExc_uid74_fpExp2Test_s IS
                  WHEN "00" => fracRPostExc_uid74_fpExp2Test_q <= cstAllZWF_uid17_fpExp2Test_q;
                  WHEN "01" => fracRPostExc_uid74_fpExp2Test_q <= fracR_uid52_fpExp2Test_b;
                  WHEN "10" => fracRPostExc_uid74_fpExp2Test_q <= cstAllZWF_uid17_fpExp2Test_q;
                  WHEN "11" => fracRPostExc_uid74_fpExp2Test_q <= oneFracRPostExc2_uid71_fpExp2Test_q;
                  WHEN OTHERS => fracRPostExc_uid74_fpExp2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RExp2_uid79_fpExp2Test(BITJOIN,78)@13
    RExp2_uid79_fpExp2Test_q <= GND_q & ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_q & fracRPostExc_uid74_fpExp2Test_q;

	--xOut(GPOUT,4)@13
    q <= RExp2_uid79_fpExp2Test_q;


end normal;
