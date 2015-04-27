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

-- VHDL created from fp_atan_s5
-- VHDL created on Tue Mar 12 11:23:14 2013


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

entity fp_atan_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_atan_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid9_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid10_fpArctanXTest_q : std_logic_vector (22 downto 0);
    signal cstNaNWF_uid11_fpArctanXTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid12_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal cstBias_uid13_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal cstBiasM1_uid14_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMWF_uid15_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal cstWFP2_uid16_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal piO2_uid37_fpArctanXTest_q : std_logic_vector (25 downto 0);
    signal piO4_uid38_fpArctanXTest_q : std_logic_vector (23 downto 0);
    signal arctanIsConst_uid46_fpArctanXTest_a : std_logic_vector(0 downto 0);
    signal arctanIsConst_uid46_fpArctanXTest_b : std_logic_vector(0 downto 0);
    signal arctanIsConst_uid46_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal biasMwShift_uid53_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal shiftBias_uid55_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal zS_uid58_fpArctanXTest_q : std_logic_vector (8 downto 0);
    signal cst01pWShift_uid60_fpArctanXTest_q : std_logic_vector (12 downto 0);
    signal mulXAtanXOXRes_uid70_fpArctanXTest_a : std_logic_vector (23 downto 0);
    signal mulXAtanXOXRes_uid70_fpArctanXTest_b : std_logic_vector (26 downto 0);
    signal mulXAtanXOXRes_uid70_fpArctanXTest_s1 : std_logic_vector (50 downto 0);
    signal mulXAtanXOXRes_uid70_fpArctanXTest_pr : UNSIGNED (50 downto 0);
    signal mulXAtanXOXRes_uid70_fpArctanXTest_q : std_logic_vector (50 downto 0);
    signal fracOutMuxSelEnc_uid100_fpArctanXTest_q : std_logic_vector(1 downto 0);
    signal cst2BiasM1_uid120_z_uid48_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal cst2Bias_uid121_z_uid48_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal fracRCalc_uid153_z_uid48_fpArctanXTest_s : std_logic_vector (0 downto 0);
    signal fracRCalc_uid153_z_uid48_fpArctanXTest_q : std_logic_vector (22 downto 0);
    signal expRCalc_uid154_z_uid48_fpArctanXTest_s : std_logic_vector (0 downto 0);
    signal expRCalc_uid154_z_uid48_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal expRPostExc_uid160_z_uid48_fpArctanXTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid160_z_uid48_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal leftShiftStage0Idx1Pad4_uid166_fxpU_uid63_fpArctanXTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage0Idx3Pad12_uid172_fxpU_uid63_fpArctanXTest_q : std_logic_vector (11 downto 0);
    signal leftShiftStage1Idx2Pad2_uid180_fxpU_uid63_fpArctanXTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1Idx3Pad3_uid183_fxpU_uid63_fpArctanXTest_q : std_logic_vector (2 downto 0);
    signal rightShiftStage0Idx2Pad16_uid210_fxpOp2Path2_uid87_fpArctanXTest_q : std_logic_vector (15 downto 0);
    signal rightShiftStage0Idx3Pad24_uid213_fxpOp2Path2_uid87_fpArctanXTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx3Pad6_uid224_fxpOp2Path2_uid87_fpArctanXTest_q : std_logic_vector (5 downto 0);
    signal prodXY_uid250_pT1_uid193_atanXOXPolyEval_a : std_logic_vector (12 downto 0);
    signal prodXY_uid250_pT1_uid193_atanXOXPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXY_uid250_pT1_uid193_atanXOXPolyEval_s1 : std_logic_vector (25 downto 0);
    signal prodXY_uid250_pT1_uid193_atanXOXPolyEval_pr : SIGNED (26 downto 0);
    signal prodXY_uid250_pT1_uid193_atanXOXPolyEval_q : std_logic_vector (25 downto 0);
    signal prodXY_uid253_pT2_uid199_atanXOXPolyEval_a : std_logic_vector (17 downto 0);
    signal prodXY_uid253_pT2_uid199_atanXOXPolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid253_pT2_uid199_atanXOXPolyEval_s1 : std_logic_vector (40 downto 0);
    signal prodXY_uid253_pT2_uid199_atanXOXPolyEval_pr : SIGNED (41 downto 0);
    signal prodXY_uid253_pT2_uid199_atanXOXPolyEval_q : std_logic_vector (40 downto 0);
    signal prodXY_uid256_pT1_uid238_invPolyEval_a : std_logic_vector (11 downto 0);
    signal prodXY_uid256_pT1_uid238_invPolyEval_b : std_logic_vector (11 downto 0);
    signal prodXY_uid256_pT1_uid238_invPolyEval_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid256_pT1_uid238_invPolyEval_pr : SIGNED (24 downto 0);
    signal prodXY_uid256_pT1_uid238_invPolyEval_q : std_logic_vector (23 downto 0);
    signal prodXY_uid259_pT2_uid244_invPolyEval_a : std_logic_vector (14 downto 0);
    signal prodXY_uid259_pT2_uid244_invPolyEval_b : std_logic_vector (21 downto 0);
    signal prodXY_uid259_pT2_uid244_invPolyEval_s1 : std_logic_vector (36 downto 0);
    signal prodXY_uid259_pT2_uid244_invPolyEval_pr : SIGNED (37 downto 0);
    signal prodXY_uid259_pT2_uid244_invPolyEval_q : std_logic_vector (36 downto 0);
    signal memoryC0_uid189_atanXOXTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid189_atanXOXTabGen_lutmem_ia : std_logic_vector (30 downto 0);
    signal memoryC0_uid189_atanXOXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid189_atanXOXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid189_atanXOXTabGen_lutmem_iq : std_logic_vector (30 downto 0);
    signal memoryC0_uid189_atanXOXTabGen_lutmem_q : std_logic_vector (30 downto 0);
    signal memoryC1_uid190_atanXOXTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid190_atanXOXTabGen_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid190_atanXOXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid190_atanXOXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid190_atanXOXTabGen_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid190_atanXOXTabGen_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid191_atanXOXTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid191_atanXOXTabGen_lutmem_ia : std_logic_vector (12 downto 0);
    signal memoryC2_uid191_atanXOXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid191_atanXOXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid191_atanXOXTabGen_lutmem_iq : std_logic_vector (12 downto 0);
    signal memoryC2_uid191_atanXOXTabGen_lutmem_q : std_logic_vector (12 downto 0);
    signal memoryC0_uid234_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid234_invTabGen_lutmem_ia : std_logic_vector (28 downto 0);
    signal memoryC0_uid234_invTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid234_invTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid234_invTabGen_lutmem_iq : std_logic_vector (28 downto 0);
    signal memoryC0_uid234_invTabGen_lutmem_q : std_logic_vector (28 downto 0);
    signal memoryC1_uid235_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid235_invTabGen_lutmem_ia : std_logic_vector (19 downto 0);
    signal memoryC1_uid235_invTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid235_invTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid235_invTabGen_lutmem_iq : std_logic_vector (19 downto 0);
    signal memoryC1_uid235_invTabGen_lutmem_q : std_logic_vector (19 downto 0);
    signal memoryC2_uid236_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid236_invTabGen_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid236_invTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid236_invTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid236_invTabGen_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid236_invTabGen_lutmem_q : std_logic_vector (11 downto 0);
    signal reg_excSelBits_uid105_fpArctanXTest_0_to_outMuxSelEnc_uid106_fpArctanXTest_0_q : std_logic_vector (2 downto 0);
    signal reg_excSelBits_uid157_z_uid48_fpArctanXTest_0_to_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_q : std_logic_vector (2 downto 0);
    signal reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC2_uid236_invTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid237_invPolyEval_0_to_prodXY_uid256_pT1_uid238_invPolyEval_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid236_invTabGen_lutmem_0_to_prodXY_uid256_pT1_uid238_invPolyEval_1_q : std_logic_vector (11 downto 0);
    signal reg_memoryC1_uid235_invTabGen_lutmem_0_to_sumAHighB_uid241_invPolyEval_0_q : std_logic_vector (19 downto 0);
    signal reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q : std_logic_vector (14 downto 0);
    signal reg_s1_uid239_uid242_invPolyEval_0_to_prodXY_uid259_pT2_uid244_invPolyEval_1_q : std_logic_vector (21 downto 0);
    signal reg_memoryC0_uid234_invTabGen_lutmem_0_to_sumAHighB_uid247_invPolyEval_0_q : std_logic_vector (28 downto 0);
    signal reg_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_signR_uid110_fpArctanXTest_0_to_R_uid163_z_uid48_fpArctanXTest_2_q : std_logic_vector (0 downto 0);
    signal reg_path2_uid47_fpArctanXTest_2_to_u_uid49_fpArctanXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_expU_uid50_fpArctanXTest_0_to_atanUIsU_uid54_fpArctanXTest_1_q : std_logic_vector (7 downto 0);
    signal reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_q : std_logic_vector (2 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid175_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_oFracUExt_uid61_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_2_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage0Idx1_uid168_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_3_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage0Idx2_uid171_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_4_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage0Idx3_uid174_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_5_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_2_q : std_logic_vector (36 downto 0);
    signal reg_yAddr_uid66_fpArctanXTest_0_to_memoryC2_uid191_atanXOXTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0_q : std_logic_vector (12 downto 0);
    signal reg_memoryC2_uid191_atanXOXTabGen_lutmem_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_1_q : std_logic_vector (12 downto 0);
    signal reg_memoryC1_uid190_atanXOXTabGen_lutmem_0_to_sumAHighB_uid196_atanXOXPolyEval_0_q : std_logic_vector (20 downto 0);
    signal reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q : std_logic_vector (17 downto 0);
    signal reg_s1_uid194_uid197_atanXOXPolyEval_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC0_uid189_atanXOXTabGen_lutmem_0_to_sumAHighB_uid202_atanXOXPolyEval_0_q : std_logic_vector (30 downto 0);
    signal reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q : std_logic_vector (23 downto 0);
    signal reg_fxpAtanXOXRes_uid69_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_1_q : std_logic_vector (26 downto 0);
    signal reg_expRPath3Ext_uid76_fpArctanXTest_0_to_shiftValPath2PreSub_uid81_fpArctanXTest_1_q : std_logic_vector (8 downto 0);
    signal reg_rightShiftStageSel4Dto3_uid215_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_2_q : std_logic_vector (24 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_pad_fxpOp2Path2_uid87_uid88_fpArctanXTest_0_to_path2Diff_uid88_fpArctanXTest_1_q : std_logic_vector (25 downto 0);
    signal reg_expFracConc_uid95_uid95_fpArctanXTest_0_to_expFracRPath2PostRnd_uid96_fpArctanXTest_0_q : std_logic_vector (31 downto 0);
    signal reg_expFracPreRnd_uid77_fpArctanXTest_0_to_expfracRPath3PostRnd_uid78_fpArctanXTest_0_q : std_logic_vector (32 downto 0);
    signal reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_q : std_logic_vector (22 downto 0);
    signal reg_fracRPath2_uid97_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_3_q : std_logic_vector (22 downto 0);
    signal reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_q : std_logic_vector (22 downto 0);
    signal reg_fracOutCst_uid101_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_5_q : std_logic_vector (22 downto 0);
    signal reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_q : std_logic_vector (7 downto 0);
    signal reg_expRPath2_uid98_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_3_q : std_logic_vector (7 downto 0);
    signal reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_q : std_logic_vector (7 downto 0);
    signal reg_expOutCst_uid103_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_5_q : std_logic_vector (7 downto 0);
    signal ld_reg_path2_uid47_fpArctanXTest_2_to_u_uid49_fpArctanXTest_1_q_to_u_uid49_fpArctanXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_fracU_uid51_fpArctanXTest_b_to_oFracU_uid52_uid52_fpArctanXTest_a_q : std_logic_vector (22 downto 0);
    signal ld_shiftOut_uid82_fpArctanXTest_c_to_sValPostSOut_uid84_fpArctanXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_fracRPath3Pre_uid74_fpArctanXTest_q_to_oFracRPath2_uid85_uid85_fpArctanXTest_a_q : std_logic_vector (23 downto 0);
    signal ld_path2_uid47_fpArctanXTest_n_to_pathSelBits_uid99_fpArctanXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_arctanIsConst_uid46_fpArctanXTest_q_to_pathSelBits_uid99_fpArctanXTest_c_q : std_logic_vector (0 downto 0);
    signal ld_y_uid141_z_uid48_fpArctanXTest_b_to_yPPolyEval_uid144_z_uid48_fpArctanXTest_a_q : std_logic_vector (22 downto 0);
    signal ld_fracXIsZero_uid140_z_uid48_fpArctanXTest_q_to_fracRCalc_uid153_z_uid48_fpArctanXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_1_q_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_b_q : std_logic_vector (1 downto 0);
    signal ld_LeftShiftStage035dto0_uid178_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx1_uid179_fxpU_uid63_fpArctanXTest_b_q : std_logic_vector (35 downto 0);
    signal ld_LeftShiftStage034dto0_uid181_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx2_uid182_fxpU_uid63_fpArctanXTest_b_q : std_logic_vector (34 downto 0);
    signal ld_LeftShiftStage033dto0_uid184_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx3_uid185_fxpU_uid63_fpArctanXTest_b_q : std_logic_vector (33 downto 0);
    signal ld_reg_leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_1_q_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_b_q : std_logic_vector (1 downto 0);
    signal ld_RightShiftStage024dto2_uid217_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx1_uid219_fxpOp2Path2_uid87_fpArctanXTest_a_q : std_logic_vector (22 downto 0);
    signal ld_RightShiftStage024dto4_uid220_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx2_uid222_fxpOp2Path2_uid87_fpArctanXTest_a_q : std_logic_vector (20 downto 0);
    signal ld_RightShiftStage024dto6_uid223_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx3_uid225_fxpOp2Path2_uid87_fpArctanXTest_a_q : std_logic_vector (18 downto 0);
    signal ld_reg_rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_1_q_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_b_q : std_logic_vector (1 downto 0);
    signal ld_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC1_uid190_atanXOXTabGen_lutmem_0_q_to_memoryC1_uid190_atanXOXTabGen_lutmem_a_q : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC1_uid235_invTabGen_lutmem_0_q_to_memoryC1_uid235_invTabGen_lutmem_a_q : std_logic_vector (7 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_reg_signR_uid110_fpArctanXTest_0_to_R_uid163_z_uid48_fpArctanXTest_2_a_q : std_logic_vector (0 downto 0);
    signal ld_yT1_uid192_atanXOXPolyEval_b_to_reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0_a_q : std_logic_vector (12 downto 0);
    signal ld_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_b_to_reg_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_1_a_q : std_logic_vector (0 downto 0);
    signal ld_expRPath3_uid80_fpArctanXTest_b_to_reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_a_q : std_logic_vector (7 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_reset0 : std_logic;
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_eq : std_logic;
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_sticky_ena_q : signal is true;
    signal ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_reset0 : std_logic;
    signal ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_sticky_ena_q : signal is true;
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_inputreg_q : std_logic_vector (31 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_reset0 : std_logic;
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_eq : std_logic;
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_xIn_a_to_u_uid49_fpArctanXTest_c_sticky_ena_q : signal is true;
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_reset0 : std_logic;
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_sticky_ena_q : signal is true;
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_reset0 : std_logic;
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_sticky_ena_q : signal is true;
    signal ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_reset0 : std_logic;
    signal ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_sticky_ena_q : signal is true;
    signal ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_reset0 : std_logic;
    signal ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_sticky_ena_q : signal is true;
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_reset0 : std_logic;
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_eq : std_logic;
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_sticky_ena_q : signal is true;
    signal ld_y_uid141_z_uid48_fpArctanXTest_b_to_yPPolyEval_uid144_z_uid48_fpArctanXTest_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_reset0 : std_logic;
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_sticky_ena_q : signal is true;
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_inputreg_q : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_ia : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_iq : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_q : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_sticky_ena_q : signal is true;
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_inputreg_q : std_logic_vector (14 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_sticky_ena_q : signal is true;
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_sticky_ena_q : signal is true;
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_reset0 : std_logic;
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_eq : std_logic;
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_sticky_ena_q : signal is true;
    signal ld_yT1_uid192_atanXOXPolyEval_b_to_reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0_a_inputreg_q : std_logic_vector (12 downto 0);
    signal ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_reset0 : std_logic;
    signal ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_sticky_ena_q : signal is true;
    signal ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_reset0 : std_logic;
    signal ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_sticky_ena_q : signal is true;
    signal ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_reset0 : std_logic;
    signal ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_sticky_ena_q : signal is true;
    signal ld_expRPath3_uid80_fpArctanXTest_b_to_reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_a_inputreg_q : std_logic_vector (7 downto 0);
    signal atanUIsU_uid54_fpArctanXTest_a : std_logic_vector(10 downto 0);
    signal atanUIsU_uid54_fpArctanXTest_b : std_logic_vector(10 downto 0);
    signal atanUIsU_uid54_fpArctanXTest_o : std_logic_vector (10 downto 0);
    signal atanUIsU_uid54_fpArctanXTest_cin : std_logic_vector (0 downto 0);
    signal atanUIsU_uid54_fpArctanXTest_n : std_logic_vector (0 downto 0);
    signal shiftOut_uid82_fpArctanXTest_a : std_logic_vector(10 downto 0);
    signal shiftOut_uid82_fpArctanXTest_b : std_logic_vector(10 downto 0);
    signal shiftOut_uid82_fpArctanXTest_o : std_logic_vector (10 downto 0);
    signal shiftOut_uid82_fpArctanXTest_cin : std_logic_vector (0 downto 0);
    signal shiftOut_uid82_fpArctanXTest_c : std_logic_vector (0 downto 0);
    signal excSelBits_uid105_fpArctanXTest_q : std_logic_vector (2 downto 0);
    signal leftShiftStage1Idx1_uid179_fxpU_uid63_fpArctanXTest_q : std_logic_vector (36 downto 0);
    signal expfracRPath3PostRnd_uid78_fpArctanXTest_a : std_logic_vector(33 downto 0);
    signal expfracRPath3PostRnd_uid78_fpArctanXTest_b : std_logic_vector(33 downto 0);
    signal expfracRPath3PostRnd_uid78_fpArctanXTest_o : std_logic_vector (33 downto 0);
    signal expfracRPath3PostRnd_uid78_fpArctanXTest_q : std_logic_vector (33 downto 0);
    signal expFracRPath2PostRnd_uid96_fpArctanXTest_a : std_logic_vector(32 downto 0);
    signal expFracRPath2PostRnd_uid96_fpArctanXTest_b : std_logic_vector(32 downto 0);
    signal expFracRPath2PostRnd_uid96_fpArctanXTest_o : std_logic_vector (32 downto 0);
    signal expFracRPath2PostRnd_uid96_fpArctanXTest_q : std_logic_vector (32 downto 0);
    signal oFracU_uid52_uid52_fpArctanXTest_q : std_logic_vector (23 downto 0);
    signal oFracRPath2_uid85_uid85_fpArctanXTest_q : std_logic_vector (24 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal expX_uid6_fpArctanXTest_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpArctanXTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid7_fpArctanXTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid7_fpArctanXTest_b : std_logic_vector (22 downto 0);
    signal singX_uid8_fpArctanXTest_in : std_logic_vector (31 downto 0);
    signal singX_uid8_fpArctanXTest_b : std_logic_vector (0 downto 0);
    signal expXIsZero_uid22_fpArctanXTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid22_fpArctanXTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid22_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid24_fpArctanXTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid24_fpArctanXTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid24_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid26_fpArctanXTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid26_fpArctanXTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid26_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid27_fpArctanXTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid27_fpArctanXTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid27_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal expXIsBias_uid35_fpArctanXTest_a : std_logic_vector(7 downto 0);
    signal expXIsBias_uid35_fpArctanXTest_b : std_logic_vector(7 downto 0);
    signal expXIsBias_uid35_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal inIsOne_uid36_fpArctanXTest_a : std_logic_vector(0 downto 0);
    signal inIsOne_uid36_fpArctanXTest_b : std_logic_vector(0 downto 0);
    signal inIsOne_uid36_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal path2_uid47_fpArctanXTest_a : std_logic_vector(10 downto 0);
    signal path2_uid47_fpArctanXTest_b : std_logic_vector(10 downto 0);
    signal path2_uid47_fpArctanXTest_o : std_logic_vector (10 downto 0);
    signal path2_uid47_fpArctanXTest_cin : std_logic_vector (0 downto 0);
    signal path2_uid47_fpArctanXTest_n : std_logic_vector (0 downto 0);
    signal shiftValue_uid56_fpArctanXTest_a : std_logic_vector(8 downto 0);
    signal shiftValue_uid56_fpArctanXTest_b : std_logic_vector(8 downto 0);
    signal shiftValue_uid56_fpArctanXTest_o : std_logic_vector (8 downto 0);
    signal shiftValue_uid56_fpArctanXTest_q : std_logic_vector (8 downto 0);
    signal shiftValPath2PreSub_uid81_fpArctanXTest_a : std_logic_vector(10 downto 0);
    signal shiftValPath2PreSub_uid81_fpArctanXTest_b : std_logic_vector(10 downto 0);
    signal shiftValPath2PreSub_uid81_fpArctanXTest_o : std_logic_vector (10 downto 0);
    signal shiftValPath2PreSub_uid81_fpArctanXTest_q : std_logic_vector (9 downto 0);
    signal path2Diff_uid88_fpArctanXTest_a : std_logic_vector(26 downto 0);
    signal path2Diff_uid88_fpArctanXTest_b : std_logic_vector(26 downto 0);
    signal path2Diff_uid88_fpArctanXTest_o : std_logic_vector (26 downto 0);
    signal path2Diff_uid88_fpArctanXTest_q : std_logic_vector (26 downto 0);
    signal fracRCalc_uid102_fpArctanXTest_s : std_logic_vector (1 downto 0);
    signal fracRCalc_uid102_fpArctanXTest_q : std_logic_vector (22 downto 0);
    signal expRCalc_uid104_fpArctanXTest_s : std_logic_vector (1 downto 0);
    signal expRCalc_uid104_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal outMuxSelEnc_uid106_fpArctanXTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid107_fpArctanXTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid107_fpArctanXTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid108_fpArctanXTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid108_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal fracXIsZero_uid140_z_uid48_fpArctanXTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid140_z_uid48_fpArctanXTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid140_z_uid48_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal expRCompExt_uid147_z_uid48_fpArctanXTest_a : std_logic_vector(8 downto 0);
    signal expRCompExt_uid147_z_uid48_fpArctanXTest_b : std_logic_vector(8 downto 0);
    signal expRCompExt_uid147_z_uid48_fpArctanXTest_o : std_logic_vector (8 downto 0);
    signal expRCompExt_uid147_z_uid48_fpArctanXTest_q : std_logic_vector (8 downto 0);
    signal expRCompYIsOneExt_uid150_z_uid48_fpArctanXTest_a : std_logic_vector(8 downto 0);
    signal expRCompYIsOneExt_uid150_z_uid48_fpArctanXTest_b : std_logic_vector(8 downto 0);
    signal expRCompYIsOneExt_uid150_z_uid48_fpArctanXTest_o : std_logic_vector (8 downto 0);
    signal expRCompYIsOneExt_uid150_z_uid48_fpArctanXTest_q : std_logic_vector (8 downto 0);
    signal outMuxSelEnc_uid158_z_uid48_fpArctanXTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid159_z_uid48_fpArctanXTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid159_z_uid48_fpArctanXTest_q : std_logic_vector (22 downto 0);
    signal leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_q : std_logic_vector (36 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal cstPiO2_uid39_fpArctanXTest_in : std_logic_vector (24 downto 0);
    signal cstPiO2_uid39_fpArctanXTest_b : std_logic_vector (22 downto 0);
    signal cstPiO4_uid42_fpArctanXTest_in : std_logic_vector (22 downto 0);
    signal cstPiO4_uid42_fpArctanXTest_b : std_logic_vector (22 downto 0);
    signal oFracUExt_uid61_fpArctanXTest_q : std_logic_vector (36 downto 0);
    signal normBit_uid71_fpArctanXTest_in : std_logic_vector (49 downto 0);
    signal normBit_uid71_fpArctanXTest_b : std_logic_vector (0 downto 0);
    signal fracRPath3High_uid72_fpArctanXTest_in : std_logic_vector (48 downto 0);
    signal fracRPath3High_uid72_fpArctanXTest_b : std_logic_vector (23 downto 0);
    signal fracRPath3Low_uid73_fpArctanXTest_in : std_logic_vector (47 downto 0);
    signal fracRPath3Low_uid73_fpArctanXTest_b : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx2_uid222_fxpOp2Path2_uid87_fpArctanXTest_q : std_logic_vector (24 downto 0);
    signal leftShiftStage1Idx2_uid182_fxpU_uid63_fpArctanXTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx1_uid219_fxpOp2Path2_uid87_fpArctanXTest_q : std_logic_vector (24 downto 0);
    signal leftShiftStage1Idx3_uid185_fxpU_uid63_fpArctanXTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx3_uid225_fxpOp2Path2_uid87_fpArctanXTest_q : std_logic_vector (24 downto 0);
    signal prodXYTruncFR_uid251_pT1_uid193_atanXOXPolyEval_in : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid251_pT1_uid193_atanXOXPolyEval_b : std_logic_vector (13 downto 0);
    signal prodXYTruncFR_uid254_pT2_uid199_atanXOXPolyEval_in : std_logic_vector (40 downto 0);
    signal prodXYTruncFR_uid254_pT2_uid199_atanXOXPolyEval_b : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid257_pT1_uid238_invPolyEval_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid257_pT1_uid238_invPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid260_pT2_uid244_invPolyEval_in : std_logic_vector (36 downto 0);
    signal prodXYTruncFR_uid260_pT2_uid244_invPolyEval_b : std_logic_vector (22 downto 0);
    signal R_uid163_z_uid48_fpArctanXTest_q : std_logic_vector (31 downto 0);
    signal leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_q : std_logic_vector (24 downto 0);
    signal u_uid49_fpArctanXTest_s : std_logic_vector (0 downto 0);
    signal u_uid49_fpArctanXTest_q : std_logic_vector (31 downto 0);
    signal pathSelBits_uid99_fpArctanXTest_q : std_logic_vector (2 downto 0);
    signal yPPolyEval_uid144_z_uid48_fpArctanXTest_in : std_logic_vector (14 downto 0);
    signal yPPolyEval_uid144_z_uid48_fpArctanXTest_b : std_logic_vector (14 downto 0);
    signal fpPiO2C_uid40_fpArctanXTest_q : std_logic_vector (31 downto 0);
    signal fpPiO4C_uid43_fpArctanXTest_q : std_logic_vector (31 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmp_a : std_logic_vector(6 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmp_b : std_logic_vector(6 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_nor_q : std_logic_vector(0 downto 0);
    signal constOut_uid45_fpArctanXTest_s : std_logic_vector (0 downto 0);
    signal constOut_uid45_fpArctanXTest_q : std_logic_vector (31 downto 0);
    signal ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmp_a : std_logic_vector(4 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmp_b : std_logic_vector(4 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid49_fpArctanXTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_nor_q : std_logic_vector(0 downto 0);
    signal R_uid111_fpArctanXTest_q : std_logic_vector (31 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmp_a : std_logic_vector(6 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmp_b : std_logic_vector(6 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_nor_q : std_logic_vector(0 downto 0);
    signal fracRPath3_uid79_fpArctanXTest_in : std_logic_vector (23 downto 0);
    signal fracRPath3_uid79_fpArctanXTest_b : std_logic_vector (22 downto 0);
    signal expRPath3_uid80_fpArctanXTest_in : std_logic_vector (31 downto 0);
    signal expRPath3_uid80_fpArctanXTest_b : std_logic_vector (7 downto 0);
    signal fracRPath2_uid97_fpArctanXTest_in : std_logic_vector (23 downto 0);
    signal fracRPath2_uid97_fpArctanXTest_b : std_logic_vector (22 downto 0);
    signal expRPath2_uid98_fpArctanXTest_in : std_logic_vector (31 downto 0);
    signal expRPath2_uid98_fpArctanXTest_b : std_logic_vector (7 downto 0);
    signal X24dto8_uid206_fxpOp2Path2_uid87_fpArctanXTest_in : std_logic_vector (24 downto 0);
    signal X24dto8_uid206_fxpOp2Path2_uid87_fpArctanXTest_b : std_logic_vector (16 downto 0);
    signal X24dto16_uid209_fxpOp2Path2_uid87_fpArctanXTest_in : std_logic_vector (24 downto 0);
    signal X24dto16_uid209_fxpOp2Path2_uid87_fpArctanXTest_b : std_logic_vector (8 downto 0);
    signal X24dto24_uid212_fxpOp2Path2_uid87_fpArctanXTest_in : std_logic_vector (24 downto 0);
    signal X24dto24_uid212_fxpOp2Path2_uid87_fpArctanXTest_b : std_logic_vector (0 downto 0);
    signal oFracX_uid139_uid139_z_uid48_fpArctanXTest_q : std_logic_vector (23 downto 0);
    signal InvExpXIsZero_uid137_z_uid48_fpArctanXTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid137_z_uid48_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid28_fpArctanXTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid28_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid136_z_uid48_fpArctanXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid136_z_uid48_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal ShiftValue8_uid57_fpArctanXTest_in : std_logic_vector (8 downto 0);
    signal ShiftValue8_uid57_fpArctanXTest_b : std_logic_vector (0 downto 0);
    signal shiftValuePostNeg_uid59_fpArctanXTest_s : std_logic_vector (0 downto 0);
    signal shiftValuePostNeg_uid59_fpArctanXTest_q : std_logic_vector (8 downto 0);
    signal shiftValPath2PreSubR_uid83_fpArctanXTest_in : std_logic_vector (7 downto 0);
    signal shiftValPath2PreSubR_uid83_fpArctanXTest_b : std_logic_vector (7 downto 0);
    signal normBitPath2Diff_uid90_fpArctanXTest_in : std_logic_vector (25 downto 0);
    signal normBitPath2Diff_uid90_fpArctanXTest_b : std_logic_vector (0 downto 0);
    signal path2DiffHigh_uid91_fpArctanXTest_in : std_logic_vector (24 downto 0);
    signal path2DiffHigh_uid91_fpArctanXTest_b : std_logic_vector (23 downto 0);
    signal path2DiffLow_uid92_fpArctanXTest_in : std_logic_vector (23 downto 0);
    signal path2DiffLow_uid92_fpArctanXTest_b : std_logic_vector (23 downto 0);
    signal expRComp_uid148_z_uid48_fpArctanXTest_in : std_logic_vector (7 downto 0);
    signal expRComp_uid148_z_uid48_fpArctanXTest_b : std_logic_vector (7 downto 0);
    signal udf_uid149_z_uid48_fpArctanXTest_in : std_logic_vector (9 downto 0);
    signal udf_uid149_z_uid48_fpArctanXTest_b : std_logic_vector (0 downto 0);
    signal expRCompYIsOne_uid151_z_uid48_fpArctanXTest_in : std_logic_vector (7 downto 0);
    signal expRCompYIsOne_uid151_z_uid48_fpArctanXTest_b : std_logic_vector (7 downto 0);
    signal LeftShiftStage035dto0_uid178_fxpU_uid63_fpArctanXTest_in : std_logic_vector (35 downto 0);
    signal LeftShiftStage035dto0_uid178_fxpU_uid63_fpArctanXTest_b : std_logic_vector (35 downto 0);
    signal LeftShiftStage034dto0_uid181_fxpU_uid63_fpArctanXTest_in : std_logic_vector (34 downto 0);
    signal LeftShiftStage034dto0_uid181_fxpU_uid63_fpArctanXTest_b : std_logic_vector (34 downto 0);
    signal LeftShiftStage033dto0_uid184_fxpU_uid63_fpArctanXTest_in : std_logic_vector (33 downto 0);
    signal LeftShiftStage033dto0_uid184_fxpU_uid63_fpArctanXTest_b : std_logic_vector (33 downto 0);
    signal X32dto0_uid167_fxpU_uid63_fpArctanXTest_in : std_logic_vector (32 downto 0);
    signal X32dto0_uid167_fxpU_uid63_fpArctanXTest_b : std_logic_vector (32 downto 0);
    signal X28dto0_uid170_fxpU_uid63_fpArctanXTest_in : std_logic_vector (28 downto 0);
    signal X28dto0_uid170_fxpU_uid63_fpArctanXTest_b : std_logic_vector (28 downto 0);
    signal X24dto0_uid173_fxpU_uid63_fpArctanXTest_in : std_logic_vector (24 downto 0);
    signal X24dto0_uid173_fxpU_uid63_fpArctanXTest_b : std_logic_vector (24 downto 0);
    signal fracRPath3Pre_uid74_fpArctanXTest_s : std_logic_vector (0 downto 0);
    signal fracRPath3Pre_uid74_fpArctanXTest_q : std_logic_vector (23 downto 0);
    signal InvNormBit_uid75_fpArctanXTest_a : std_logic_vector(0 downto 0);
    signal InvNormBit_uid75_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal lowRangeB_uid194_atanXOXPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid194_atanXOXPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid195_atanXOXPolyEval_in : std_logic_vector (13 downto 0);
    signal highBBits_uid195_atanXOXPolyEval_b : std_logic_vector (12 downto 0);
    signal lowRangeB_uid200_atanXOXPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid200_atanXOXPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid201_atanXOXPolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid201_atanXOXPolyEval_b : std_logic_vector (21 downto 0);
    signal lowRangeB_uid239_invPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid239_invPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid240_invPolyEval_in : std_logic_vector (12 downto 0);
    signal highBBits_uid240_invPolyEval_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid245_invPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid245_invPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid246_invPolyEval_in : std_logic_vector (22 downto 0);
    signal highBBits_uid246_invPolyEval_b : std_logic_vector (20 downto 0);
    signal y_uid64_fpArctanXTest_in : std_logic_vector (35 downto 0);
    signal y_uid64_fpArctanXTest_b : std_logic_vector (34 downto 0);
    signal RightShiftStage124dto1_uid228_fxpOp2Path2_uid87_fpArctanXTest_in : std_logic_vector (24 downto 0);
    signal RightShiftStage124dto1_uid228_fxpOp2Path2_uid87_fpArctanXTest_b : std_logic_vector (23 downto 0);
    signal expU_uid50_fpArctanXTest_in : std_logic_vector (30 downto 0);
    signal expU_uid50_fpArctanXTest_b : std_logic_vector (7 downto 0);
    signal fracU_uid51_fpArctanXTest_in : std_logic_vector (22 downto 0);
    signal fracU_uid51_fpArctanXTest_b : std_logic_vector (22 downto 0);
    signal yT1_uid237_invPolyEval_in : std_logic_vector (14 downto 0);
    signal yT1_uid237_invPolyEval_b : std_logic_vector (11 downto 0);
    signal fracOutCst_uid101_fpArctanXTest_in : std_logic_vector (22 downto 0);
    signal fracOutCst_uid101_fpArctanXTest_b : std_logic_vector (22 downto 0);
    signal expOutCst_uid103_fpArctanXTest_in : std_logic_vector (30 downto 0);
    signal expOutCst_uid103_fpArctanXTest_b : std_logic_vector (7 downto 0);
    signal rightShiftStage0Idx1_uid208_fxpOp2Path2_uid87_fpArctanXTest_q : std_logic_vector (24 downto 0);
    signal rightShiftStage0Idx2_uid211_fxpOp2Path2_uid87_fpArctanXTest_q : std_logic_vector (24 downto 0);
    signal rightShiftStage0Idx3_uid214_fxpOp2Path2_uid87_fpArctanXTest_q : std_logic_vector (24 downto 0);
    signal y_uid141_z_uid48_fpArctanXTest_in : std_logic_vector (22 downto 0);
    signal y_uid141_z_uid48_fpArctanXTest_b : std_logic_vector (22 downto 0);
    signal exc_N_uid29_fpArctanXTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid29_fpArctanXTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid29_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal fxpShifterBits_uid62_fpArctanXTest_in : std_logic_vector (3 downto 0);
    signal fxpShifterBits_uid62_fpArctanXTest_b : std_logic_vector (3 downto 0);
    signal sValPostSOut_uid84_fpArctanXTest_s : std_logic_vector (0 downto 0);
    signal sValPostSOut_uid84_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal fracRPath2_uid93_fpArctanXTest_s : std_logic_vector (0 downto 0);
    signal fracRPath2_uid93_fpArctanXTest_q : std_logic_vector (23 downto 0);
    signal expRPath2_uid94_fpArctanXTest_s : std_logic_vector (0 downto 0);
    signal expRPath2_uid94_fpArctanXTest_q : std_logic_vector (7 downto 0);
    signal leftShiftStage0Idx1_uid168_fxpU_uid63_fpArctanXTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0Idx2_uid171_fxpU_uid63_fpArctanXTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0Idx3_uid174_fxpU_uid63_fpArctanXTest_q : std_logic_vector (36 downto 0);
    signal expRPath3Ext_uid76_fpArctanXTest_a : std_logic_vector(8 downto 0);
    signal expRPath3Ext_uid76_fpArctanXTest_b : std_logic_vector(8 downto 0);
    signal expRPath3Ext_uid76_fpArctanXTest_o : std_logic_vector (8 downto 0);
    signal expRPath3Ext_uid76_fpArctanXTest_q : std_logic_vector (8 downto 0);
    signal sumAHighB_uid196_atanXOXPolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid196_atanXOXPolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid196_atanXOXPolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid196_atanXOXPolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid202_atanXOXPolyEval_a : std_logic_vector(31 downto 0);
    signal sumAHighB_uid202_atanXOXPolyEval_b : std_logic_vector(31 downto 0);
    signal sumAHighB_uid202_atanXOXPolyEval_o : std_logic_vector (31 downto 0);
    signal sumAHighB_uid202_atanXOXPolyEval_q : std_logic_vector (31 downto 0);
    signal sumAHighB_uid241_invPolyEval_a : std_logic_vector(20 downto 0);
    signal sumAHighB_uid241_invPolyEval_b : std_logic_vector(20 downto 0);
    signal sumAHighB_uid241_invPolyEval_o : std_logic_vector (20 downto 0);
    signal sumAHighB_uid241_invPolyEval_q : std_logic_vector (20 downto 0);
    signal sumAHighB_uid247_invPolyEval_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid247_invPolyEval_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid247_invPolyEval_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid247_invPolyEval_q : std_logic_vector (29 downto 0);
    signal yAddr_uid66_fpArctanXTest_in : std_logic_vector (34 downto 0);
    signal yAddr_uid66_fpArctanXTest_b : std_logic_vector (7 downto 0);
    signal yPPolyEval_uid67_fpArctanXTest_in : std_logic_vector (26 downto 0);
    signal yPPolyEval_uid67_fpArctanXTest_b : std_logic_vector (17 downto 0);
    signal rightShiftStage2Idx1_uid230_fxpOp2Path2_uid87_fpArctanXTest_q : std_logic_vector (24 downto 0);
    signal rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_q : std_logic_vector (24 downto 0);
    signal yAddr_uid143_z_uid48_fpArctanXTest_in : std_logic_vector (22 downto 0);
    signal yAddr_uid143_z_uid48_fpArctanXTest_b : std_logic_vector (7 downto 0);
    signal InvExc_N_uid109_fpArctanXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid109_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStageSel3Dto2_uid175_fxpU_uid63_fpArctanXTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid175_fxpU_uid63_fpArctanXTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_b : std_logic_vector (1 downto 0);
    signal sValPostSOutR_uid86_fpArctanXTest_in : std_logic_vector (4 downto 0);
    signal sValPostSOutR_uid86_fpArctanXTest_b : std_logic_vector (4 downto 0);
    signal expFracConc_uid95_uid95_fpArctanXTest_q : std_logic_vector (31 downto 0);
    signal expFracPreRnd_uid77_fpArctanXTest_q : std_logic_vector (32 downto 0);
    signal s1_uid194_uid197_atanXOXPolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid200_uid203_atanXOXPolyEval_q : std_logic_vector (33 downto 0);
    signal s1_uid239_uid242_invPolyEval_q : std_logic_vector (21 downto 0);
    signal s2_uid245_uid248_invPolyEval_q : std_logic_vector (31 downto 0);
    signal yT1_uid192_atanXOXPolyEval_in : std_logic_vector (17 downto 0);
    signal yT1_uid192_atanXOXPolyEval_b : std_logic_vector (12 downto 0);
    signal rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_s : std_logic_vector (0 downto 0);
    signal rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_q : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto2_uid217_fxpOp2Path2_uid87_fpArctanXTest_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto2_uid217_fxpOp2Path2_uid87_fpArctanXTest_b : std_logic_vector (22 downto 0);
    signal RightShiftStage024dto4_uid220_fxpOp2Path2_uid87_fpArctanXTest_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto4_uid220_fxpOp2Path2_uid87_fpArctanXTest_b : std_logic_vector (20 downto 0);
    signal RightShiftStage024dto6_uid223_fxpOp2Path2_uid87_fpArctanXTest_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto6_uid223_fxpOp2Path2_uid87_fpArctanXTest_b : std_logic_vector (18 downto 0);
    signal signR_uid110_fpArctanXTest_a : std_logic_vector(0 downto 0);
    signal signR_uid110_fpArctanXTest_b : std_logic_vector(0 downto 0);
    signal signR_uid110_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal exc_R_uid138_z_uid48_fpArctanXTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid138_z_uid48_fpArctanXTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid138_z_uid48_fpArctanXTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid138_z_uid48_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStageSel4Dto3_uid215_fxpOp2Path2_uid87_fpArctanXTest_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid215_fxpOp2Path2_uid87_fpArctanXTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_b : std_logic_vector (0 downto 0);
    signal fxpAtanXOXRes_uid69_fpArctanXTest_in : std_logic_vector (31 downto 0);
    signal fxpAtanXOXRes_uid69_fpArctanXTest_b : std_logic_vector (26 downto 0);
    signal fxpInverseRes_uid146_z_uid48_fpArctanXTest_in : std_logic_vector (28 downto 0);
    signal fxpInverseRes_uid146_z_uid48_fpArctanXTest_b : std_logic_vector (23 downto 0);
    signal pad_fxpOp2Path2_uid87_uid88_fpArctanXTest_q : std_logic_vector (25 downto 0);
    signal xRegAndUdf_uid155_z_uid48_fpArctanXTest_a : std_logic_vector(0 downto 0);
    signal xRegAndUdf_uid155_z_uid48_fpArctanXTest_b : std_logic_vector(0 downto 0);
    signal xRegAndUdf_uid155_z_uid48_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal fxpInverseResFrac_uid152_z_uid48_fpArctanXTest_in : std_logic_vector (22 downto 0);
    signal fxpInverseResFrac_uid152_z_uid48_fpArctanXTest_b : std_logic_vector (22 downto 0);
    signal xIOrXRUdf_uid156_z_uid48_fpArctanXTest_a : std_logic_vector(0 downto 0);
    signal xIOrXRUdf_uid156_z_uid48_fpArctanXTest_b : std_logic_vector(0 downto 0);
    signal xIOrXRUdf_uid156_z_uid48_fpArctanXTest_q : std_logic_vector(0 downto 0);
    signal excSelBits_uid157_z_uid48_fpArctanXTest_q : std_logic_vector (2 downto 0);
begin


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable(LOGICAL,623)
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_a <= en;
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q <= not ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_a;

	--ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_nor(LOGICAL,715)
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_nor_b <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_sticky_ena_q;
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_nor_q <= not (ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_nor_a or ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_nor_b);

	--ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_mem_top(CONSTANT,711)
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_mem_top_q <= "0100001";

	--ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmp(LOGICAL,712)
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmp_a <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_mem_top_q;
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdmux_q);
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmp_q <= "1" when ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmp_a = ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmp_b else "0";

	--ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmpReg(REG,713)
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmpReg_q <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_sticky_ena(REG,716)
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_nor_q = "1") THEN
                ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_sticky_ena_q <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_enaAnd(LOGICAL,717)
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_enaAnd_a <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_sticky_ena_q;
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_enaAnd_b <= en;
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_enaAnd_q <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_enaAnd_a and ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_enaAnd_b;

	--cstAllZWF_uid10_fpArctanXTest(CONSTANT,9)
    cstAllZWF_uid10_fpArctanXTest_q <= "00000000000000000000000";

	--fracX_uid7_fpArctanXTest(BITSELECT,6)@0
    fracX_uid7_fpArctanXTest_in <= a(22 downto 0);
    fracX_uid7_fpArctanXTest_b <= fracX_uid7_fpArctanXTest_in(22 downto 0);

	--fracXIsZero_uid26_fpArctanXTest(LOGICAL,25)@0
    fracXIsZero_uid26_fpArctanXTest_a <= fracX_uid7_fpArctanXTest_b;
    fracXIsZero_uid26_fpArctanXTest_b <= cstAllZWF_uid10_fpArctanXTest_q;
    fracXIsZero_uid26_fpArctanXTest_q <= "1" when fracXIsZero_uid26_fpArctanXTest_a = fracXIsZero_uid26_fpArctanXTest_b else "0";

	--InvFracXIsZero_uid28_fpArctanXTest(LOGICAL,27)@0
    InvFracXIsZero_uid28_fpArctanXTest_a <= fracXIsZero_uid26_fpArctanXTest_q;
    InvFracXIsZero_uid28_fpArctanXTest_q <= not InvFracXIsZero_uid28_fpArctanXTest_a;

	--cstAllOWE_uid9_fpArctanXTest(CONSTANT,8)
    cstAllOWE_uid9_fpArctanXTest_q <= "11111111";

	--expX_uid6_fpArctanXTest(BITSELECT,5)@0
    expX_uid6_fpArctanXTest_in <= a(30 downto 0);
    expX_uid6_fpArctanXTest_b <= expX_uid6_fpArctanXTest_in(30 downto 23);

	--expXIsMax_uid24_fpArctanXTest(LOGICAL,23)@0
    expXIsMax_uid24_fpArctanXTest_a <= expX_uid6_fpArctanXTest_b;
    expXIsMax_uid24_fpArctanXTest_b <= cstAllOWE_uid9_fpArctanXTest_q;
    expXIsMax_uid24_fpArctanXTest_q <= "1" when expXIsMax_uid24_fpArctanXTest_a = expXIsMax_uid24_fpArctanXTest_b else "0";

	--exc_N_uid29_fpArctanXTest(LOGICAL,28)@0
    exc_N_uid29_fpArctanXTest_a <= expXIsMax_uid24_fpArctanXTest_q;
    exc_N_uid29_fpArctanXTest_b <= InvFracXIsZero_uid28_fpArctanXTest_q;
    exc_N_uid29_fpArctanXTest_q <= exc_N_uid29_fpArctanXTest_a and exc_N_uid29_fpArctanXTest_b;

	--InvExc_N_uid109_fpArctanXTest(LOGICAL,108)@0
    InvExc_N_uid109_fpArctanXTest_a <= exc_N_uid29_fpArctanXTest_q;
    InvExc_N_uid109_fpArctanXTest_q <= not InvExc_N_uid109_fpArctanXTest_a;

	--singX_uid8_fpArctanXTest(BITSELECT,7)@0
    singX_uid8_fpArctanXTest_in <= a;
    singX_uid8_fpArctanXTest_b <= singX_uid8_fpArctanXTest_in(31 downto 31);

	--signR_uid110_fpArctanXTest(LOGICAL,109)@0
    signR_uid110_fpArctanXTest_a <= singX_uid8_fpArctanXTest_b;
    signR_uid110_fpArctanXTest_b <= InvExc_N_uid109_fpArctanXTest_q;
    signR_uid110_fpArctanXTest_q <= signR_uid110_fpArctanXTest_a and signR_uid110_fpArctanXTest_b;

	--ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_inputreg(DELAY,705)
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signR_uid110_fpArctanXTest_q, xout => ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt(COUNTER,707)
    -- every=1, low=0, high=33, step=1, init=1
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_i = 32 THEN
                      ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_eq = '1') THEN
                        ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_i <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_i - 33;
                    ELSE
                        ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_i <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_i,6));


	--ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdreg(REG,708)
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdreg_q <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--xIn(GPIN,3)@0

	--ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdmux(MUX,709)
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdmux_s <= en;
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdmux: PROCESS (ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdmux_s, ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdreg_q, ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_q)
    BEGIN
            CASE ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdmux_s IS
                  WHEN "0" => ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdmux_q <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdreg_q;
                  WHEN "1" => ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdmux_q <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem(DUALMEM,706)
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_ia <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_inputreg_q;
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_aa <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdreg_q;
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_ab <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_rdmux_q;
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 34,
        width_b => 1,
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
        clocken1 => ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_iq,
        address_a => ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_aa,
        data_a => ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_ia
    );
    ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_reset0 <= areset;
        ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_q <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_iq(0 downto 0);

	--ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_nor(LOGICAL,624)
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_nor_b <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_sticky_ena_q;
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_nor_q <= not (ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_nor_a or ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_nor_b);

	--ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_mem_top(CONSTANT,620)
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_mem_top_q <= "0100000";

	--ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmp(LOGICAL,621)
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmp_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_mem_top_q;
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_q);
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmp_q <= "1" when ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmp_a = ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmp_b else "0";

	--ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmpReg(REG,622)
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmpReg_q <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_sticky_ena(REG,625)
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_nor_q = "1") THEN
                ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_sticky_ena_q <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_enaAnd(LOGICAL,626)
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_enaAnd_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_sticky_ena_q;
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_enaAnd_b <= en;
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_enaAnd_q <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_enaAnd_a and ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_enaAnd_b;

	--ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_inputreg(DELAY,614)
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => singX_uid8_fpArctanXTest_b, xout => ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt(COUNTER,616)
    -- every=1, low=0, high=32, step=1, init=1
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_i = 31 THEN
                      ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_eq = '1') THEN
                        ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_i <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_i - 32;
                    ELSE
                        ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_i <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_i,6));


	--ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdreg(REG,617)
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdreg_q <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux(MUX,618)
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_s <= en;
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux: PROCESS (ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_s, ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdreg_q, ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_q)
    BEGIN
            CASE ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_s IS
                  WHEN "0" => ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_q <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdreg_q;
                  WHEN "1" => ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_q <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem(DUALMEM,615)
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_ia <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_inputreg_q;
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_aa <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdreg_q;
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_ab <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_q;
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_dmem : altsyncram
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
        clocken1 => ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_iq,
        address_a => ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_aa,
        data_a => ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_ia
    );
    ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_reset0 <= areset;
        ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_q <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_iq(0 downto 0);

	--cstBias_uid13_fpArctanXTest(CONSTANT,12)
    cstBias_uid13_fpArctanXTest_q <= "01111111";

	--piO2_uid37_fpArctanXTest(CONSTANT,36)
    piO2_uid37_fpArctanXTest_q <= "11001001000011111101101011";

	--cstPiO2_uid39_fpArctanXTest(BITSELECT,38)@35
    cstPiO2_uid39_fpArctanXTest_in <= piO2_uid37_fpArctanXTest_q(24 downto 0);
    cstPiO2_uid39_fpArctanXTest_b <= cstPiO2_uid39_fpArctanXTest_in(24 downto 2);

	--fpPiO2C_uid40_fpArctanXTest(BITJOIN,39)@35
    fpPiO2C_uid40_fpArctanXTest_q <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_q & cstBias_uid13_fpArctanXTest_q & cstPiO2_uid39_fpArctanXTest_b;

	--cstBiasM1_uid14_fpArctanXTest(CONSTANT,13)
    cstBiasM1_uid14_fpArctanXTest_q <= "01111110";

	--piO4_uid38_fpArctanXTest(CONSTANT,37)
    piO4_uid38_fpArctanXTest_q <= "110010010000111111011011";

	--cstPiO4_uid42_fpArctanXTest(BITSELECT,41)@35
    cstPiO4_uid42_fpArctanXTest_in <= piO4_uid38_fpArctanXTest_q(22 downto 0);
    cstPiO4_uid42_fpArctanXTest_b <= cstPiO4_uid42_fpArctanXTest_in(22 downto 0);

	--fpPiO4C_uid43_fpArctanXTest(BITJOIN,42)@35
    fpPiO4C_uid43_fpArctanXTest_q <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_mem_q & cstBiasM1_uid14_fpArctanXTest_q & cstPiO4_uid42_fpArctanXTest_b;

	--ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_nor(LOGICAL,637)
    ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_nor_b <= ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_sticky_ena_q;
    ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_nor_q <= not (ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_nor_a or ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_nor_b);

	--ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_sticky_ena(REG,638)
    ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_nor_q = "1") THEN
                ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_sticky_ena_q <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_enaAnd(LOGICAL,639)
    ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_enaAnd_a <= ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_sticky_ena_q;
    ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_enaAnd_b <= en;
    ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_enaAnd_q <= ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_enaAnd_a and ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_enaAnd_b;

	--exc_I_uid27_fpArctanXTest(LOGICAL,26)@0
    exc_I_uid27_fpArctanXTest_a <= expXIsMax_uid24_fpArctanXTest_q;
    exc_I_uid27_fpArctanXTest_b <= fracXIsZero_uid26_fpArctanXTest_q;
    exc_I_uid27_fpArctanXTest_q <= exc_I_uid27_fpArctanXTest_a and exc_I_uid27_fpArctanXTest_b;

	--ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_inputreg(DELAY,627)
    ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_I_uid27_fpArctanXTest_q, xout => ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem(DUALMEM,628)
    ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_ia <= ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_inputreg_q;
    ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_aa <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdreg_q;
    ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_ab <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_q;
    ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_iq,
        address_a => ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_aa,
        data_a => ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_ia
    );
    ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_reset0 <= areset;
        ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_q <= ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_iq(0 downto 0);

	--constOut_uid45_fpArctanXTest(MUX,44)@35
    constOut_uid45_fpArctanXTest_s <= ld_exc_I_uid27_fpArctanXTest_q_to_constOut_uid45_fpArctanXTest_b_replace_mem_q;
    constOut_uid45_fpArctanXTest: PROCESS (constOut_uid45_fpArctanXTest_s, en, fpPiO4C_uid43_fpArctanXTest_q, fpPiO2C_uid40_fpArctanXTest_q)
    BEGIN
            CASE constOut_uid45_fpArctanXTest_s IS
                  WHEN "0" => constOut_uid45_fpArctanXTest_q <= fpPiO4C_uid43_fpArctanXTest_q;
                  WHEN "1" => constOut_uid45_fpArctanXTest_q <= fpPiO2C_uid40_fpArctanXTest_q;
                  WHEN OTHERS => constOut_uid45_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expOutCst_uid103_fpArctanXTest(BITSELECT,102)@35
    expOutCst_uid103_fpArctanXTest_in <= constOut_uid45_fpArctanXTest_q(30 downto 0);
    expOutCst_uid103_fpArctanXTest_b <= expOutCst_uid103_fpArctanXTest_in(30 downto 23);

	--reg_expOutCst_uid103_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_5(REG,318)@35
    reg_expOutCst_uid103_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expOutCst_uid103_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_5_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expOutCst_uid103_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_5_q <= expOutCst_uid103_fpArctanXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--cst01pWShift_uid60_fpArctanXTest(CONSTANT,59)
    cst01pWShift_uid60_fpArctanXTest_q <= "0000000000000";

	--ld_signR_uid110_fpArctanXTest_q_to_reg_signR_uid110_fpArctanXTest_0_to_R_uid163_z_uid48_fpArctanXTest_2_a(DELAY,574)@0
    ld_signR_uid110_fpArctanXTest_q_to_reg_signR_uid110_fpArctanXTest_0_to_R_uid163_z_uid48_fpArctanXTest_2_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 11 )
    PORT MAP ( xin => signR_uid110_fpArctanXTest_q, xout => ld_signR_uid110_fpArctanXTest_q_to_reg_signR_uid110_fpArctanXTest_0_to_R_uid163_z_uid48_fpArctanXTest_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_signR_uid110_fpArctanXTest_0_to_R_uid163_z_uid48_fpArctanXTest_2(REG,279)@11
    reg_signR_uid110_fpArctanXTest_0_to_R_uid163_z_uid48_fpArctanXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_signR_uid110_fpArctanXTest_0_to_R_uid163_z_uid48_fpArctanXTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_signR_uid110_fpArctanXTest_0_to_R_uid163_z_uid48_fpArctanXTest_2_q <= ld_signR_uid110_fpArctanXTest_q_to_reg_signR_uid110_fpArctanXTest_0_to_R_uid163_z_uid48_fpArctanXTest_2_a_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_nor(LOGICAL,729)
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_nor_b <= ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_sticky_ena_q;
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_nor_q <= not (ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_nor_a or ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_nor_b);

	--ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_mem_top(CONSTANT,725)
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_mem_top_q <= "0111";

	--ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmp(LOGICAL,726)
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmp_a <= ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_mem_top_q;
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdmux_q);
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmp_q <= "1" when ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmp_a = ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmp_b else "0";

	--ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmpReg(REG,727)
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmpReg_q <= ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_sticky_ena(REG,730)
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_nor_q = "1") THEN
                ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_sticky_ena_q <= ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_enaAnd(LOGICAL,731)
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_enaAnd_a <= ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_sticky_ena_q;
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_enaAnd_b <= en;
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_enaAnd_q <= ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_enaAnd_a and ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_enaAnd_b;

	--cst2Bias_uid121_z_uid48_fpArctanXTest(CONSTANT,120)
    cst2Bias_uid121_z_uid48_fpArctanXTest_q <= "11111110";

	--expRCompYIsOneExt_uid150_z_uid48_fpArctanXTest(SUB,149)@0
    expRCompYIsOneExt_uid150_z_uid48_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & cst2Bias_uid121_z_uid48_fpArctanXTest_q);
    expRCompYIsOneExt_uid150_z_uid48_fpArctanXTest_b <= STD_LOGIC_VECTOR("0" & expX_uid6_fpArctanXTest_b);
            expRCompYIsOneExt_uid150_z_uid48_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompYIsOneExt_uid150_z_uid48_fpArctanXTest_a) - UNSIGNED(expRCompYIsOneExt_uid150_z_uid48_fpArctanXTest_b));
    expRCompYIsOneExt_uid150_z_uid48_fpArctanXTest_q <= expRCompYIsOneExt_uid150_z_uid48_fpArctanXTest_o(8 downto 0);


	--expRCompYIsOne_uid151_z_uid48_fpArctanXTest(BITSELECT,150)@0
    expRCompYIsOne_uid151_z_uid48_fpArctanXTest_in <= expRCompYIsOneExt_uid150_z_uid48_fpArctanXTest_q(7 downto 0);
    expRCompYIsOne_uid151_z_uid48_fpArctanXTest_b <= expRCompYIsOne_uid151_z_uid48_fpArctanXTest_in(7 downto 0);

	--cst2BiasM1_uid120_z_uid48_fpArctanXTest(CONSTANT,119)
    cst2BiasM1_uid120_z_uid48_fpArctanXTest_q <= "11111101";

	--expRCompExt_uid147_z_uid48_fpArctanXTest(SUB,146)@0
    expRCompExt_uid147_z_uid48_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & cst2BiasM1_uid120_z_uid48_fpArctanXTest_q);
    expRCompExt_uid147_z_uid48_fpArctanXTest_b <= STD_LOGIC_VECTOR("0" & expX_uid6_fpArctanXTest_b);
            expRCompExt_uid147_z_uid48_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompExt_uid147_z_uid48_fpArctanXTest_a) - UNSIGNED(expRCompExt_uid147_z_uid48_fpArctanXTest_b));
    expRCompExt_uid147_z_uid48_fpArctanXTest_q <= expRCompExt_uid147_z_uid48_fpArctanXTest_o(8 downto 0);


	--expRComp_uid148_z_uid48_fpArctanXTest(BITSELECT,147)@0
    expRComp_uid148_z_uid48_fpArctanXTest_in <= expRCompExt_uid147_z_uid48_fpArctanXTest_q(7 downto 0);
    expRComp_uid148_z_uid48_fpArctanXTest_b <= expRComp_uid148_z_uid48_fpArctanXTest_in(7 downto 0);

	--GND(CONSTANT,0)
    GND_q <= "0";

	--fracXIsZero_uid140_z_uid48_fpArctanXTest(LOGICAL,139)@0
    fracXIsZero_uid140_z_uid48_fpArctanXTest_a <= fracX_uid7_fpArctanXTest_b;
    fracXIsZero_uid140_z_uid48_fpArctanXTest_b <= STD_LOGIC_VECTOR("0000000000000000000000" & GND_q);
    fracXIsZero_uid140_z_uid48_fpArctanXTest_q <= "1" when fracXIsZero_uid140_z_uid48_fpArctanXTest_a = fracXIsZero_uid140_z_uid48_fpArctanXTest_b else "0";

	--expRCalc_uid154_z_uid48_fpArctanXTest(MUX,153)@0
    expRCalc_uid154_z_uid48_fpArctanXTest_s <= fracXIsZero_uid140_z_uid48_fpArctanXTest_q;
    expRCalc_uid154_z_uid48_fpArctanXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRCalc_uid154_z_uid48_fpArctanXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRCalc_uid154_z_uid48_fpArctanXTest_s IS
                      WHEN "0" => expRCalc_uid154_z_uid48_fpArctanXTest_q <= expRComp_uid148_z_uid48_fpArctanXTest_b;
                      WHEN "1" => expRCalc_uid154_z_uid48_fpArctanXTest_q <= expRCompYIsOne_uid151_z_uid48_fpArctanXTest_b;
                      WHEN OTHERS => expRCalc_uid154_z_uid48_fpArctanXTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--expXIsZero_uid22_fpArctanXTest(LOGICAL,21)@0
    expXIsZero_uid22_fpArctanXTest_a <= expX_uid6_fpArctanXTest_b;
    expXIsZero_uid22_fpArctanXTest_b <= cstAllZWE_uid12_fpArctanXTest_q;
    expXIsZero_uid22_fpArctanXTest_q <= "1" when expXIsZero_uid22_fpArctanXTest_a = expXIsZero_uid22_fpArctanXTest_b else "0";

	--udf_uid149_z_uid48_fpArctanXTest(BITSELECT,148)@0
    udf_uid149_z_uid48_fpArctanXTest_in <= STD_LOGIC_VECTOR((9 downto 9 => expRCompExt_uid147_z_uid48_fpArctanXTest_q(8)) & expRCompExt_uid147_z_uid48_fpArctanXTest_q);
    udf_uid149_z_uid48_fpArctanXTest_b <= udf_uid149_z_uid48_fpArctanXTest_in(9 downto 9);

	--InvExc_I_uid136_z_uid48_fpArctanXTest(LOGICAL,135)@0
    InvExc_I_uid136_z_uid48_fpArctanXTest_a <= exc_I_uid27_fpArctanXTest_q;
    InvExc_I_uid136_z_uid48_fpArctanXTest_q <= not InvExc_I_uid136_z_uid48_fpArctanXTest_a;

	--InvExpXIsZero_uid137_z_uid48_fpArctanXTest(LOGICAL,136)@0
    InvExpXIsZero_uid137_z_uid48_fpArctanXTest_a <= expXIsZero_uid22_fpArctanXTest_q;
    InvExpXIsZero_uid137_z_uid48_fpArctanXTest_q <= not InvExpXIsZero_uid137_z_uid48_fpArctanXTest_a;

	--exc_R_uid138_z_uid48_fpArctanXTest(LOGICAL,137)@0
    exc_R_uid138_z_uid48_fpArctanXTest_a <= InvExpXIsZero_uid137_z_uid48_fpArctanXTest_q;
    exc_R_uid138_z_uid48_fpArctanXTest_b <= InvExc_I_uid136_z_uid48_fpArctanXTest_q;
    exc_R_uid138_z_uid48_fpArctanXTest_c <= InvExc_N_uid109_fpArctanXTest_q;
    exc_R_uid138_z_uid48_fpArctanXTest_q <= exc_R_uid138_z_uid48_fpArctanXTest_a and exc_R_uid138_z_uid48_fpArctanXTest_b and exc_R_uid138_z_uid48_fpArctanXTest_c;

	--xRegAndUdf_uid155_z_uid48_fpArctanXTest(LOGICAL,154)@0
    xRegAndUdf_uid155_z_uid48_fpArctanXTest_a <= exc_R_uid138_z_uid48_fpArctanXTest_q;
    xRegAndUdf_uid155_z_uid48_fpArctanXTest_b <= udf_uid149_z_uid48_fpArctanXTest_b;
    xRegAndUdf_uid155_z_uid48_fpArctanXTest_q <= xRegAndUdf_uid155_z_uid48_fpArctanXTest_a and xRegAndUdf_uid155_z_uid48_fpArctanXTest_b;

	--xIOrXRUdf_uid156_z_uid48_fpArctanXTest(LOGICAL,155)@0
    xIOrXRUdf_uid156_z_uid48_fpArctanXTest_a <= exc_I_uid27_fpArctanXTest_q;
    xIOrXRUdf_uid156_z_uid48_fpArctanXTest_b <= xRegAndUdf_uid155_z_uid48_fpArctanXTest_q;
    xIOrXRUdf_uid156_z_uid48_fpArctanXTest_q <= xIOrXRUdf_uid156_z_uid48_fpArctanXTest_a or xIOrXRUdf_uid156_z_uid48_fpArctanXTest_b;

	--excSelBits_uid157_z_uid48_fpArctanXTest(BITJOIN,156)@0
    excSelBits_uid157_z_uid48_fpArctanXTest_q <= exc_N_uid29_fpArctanXTest_q & expXIsZero_uid22_fpArctanXTest_q & xIOrXRUdf_uid156_z_uid48_fpArctanXTest_q;

	--reg_excSelBits_uid157_z_uid48_fpArctanXTest_0_to_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0(REG,268)@0
    reg_excSelBits_uid157_z_uid48_fpArctanXTest_0_to_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excSelBits_uid157_z_uid48_fpArctanXTest_0_to_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excSelBits_uid157_z_uid48_fpArctanXTest_0_to_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_q <= excSelBits_uid157_z_uid48_fpArctanXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--outMuxSelEnc_uid158_z_uid48_fpArctanXTest(LOOKUP,157)@1
    outMuxSelEnc_uid158_z_uid48_fpArctanXTest: PROCESS (reg_excSelBits_uid157_z_uid48_fpArctanXTest_0_to_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_excSelBits_uid157_z_uid48_fpArctanXTest_0_to_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_q) IS
                WHEN "000" =>  outMuxSelEnc_uid158_z_uid48_fpArctanXTest_q <= "01";
                WHEN "001" =>  outMuxSelEnc_uid158_z_uid48_fpArctanXTest_q <= "00";
                WHEN "010" =>  outMuxSelEnc_uid158_z_uid48_fpArctanXTest_q <= "10";
                WHEN "011" =>  outMuxSelEnc_uid158_z_uid48_fpArctanXTest_q <= "01";
                WHEN "100" =>  outMuxSelEnc_uid158_z_uid48_fpArctanXTest_q <= "11";
                WHEN "101" =>  outMuxSelEnc_uid158_z_uid48_fpArctanXTest_q <= "01";
                WHEN "110" =>  outMuxSelEnc_uid158_z_uid48_fpArctanXTest_q <= "01";
                WHEN "111" =>  outMuxSelEnc_uid158_z_uid48_fpArctanXTest_q <= "01";
                WHEN OTHERS =>
                    outMuxSelEnc_uid158_z_uid48_fpArctanXTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid160_z_uid48_fpArctanXTest(MUX,159)@1
    expRPostExc_uid160_z_uid48_fpArctanXTest_s <= outMuxSelEnc_uid158_z_uid48_fpArctanXTest_q;
    expRPostExc_uid160_z_uid48_fpArctanXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostExc_uid160_z_uid48_fpArctanXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRPostExc_uid160_z_uid48_fpArctanXTest_s IS
                      WHEN "00" => expRPostExc_uid160_z_uid48_fpArctanXTest_q <= cstAllZWE_uid12_fpArctanXTest_q;
                      WHEN "01" => expRPostExc_uid160_z_uid48_fpArctanXTest_q <= expRCalc_uid154_z_uid48_fpArctanXTest_q;
                      WHEN "10" => expRPostExc_uid160_z_uid48_fpArctanXTest_q <= cstAllOWE_uid9_fpArctanXTest_q;
                      WHEN "11" => expRPostExc_uid160_z_uid48_fpArctanXTest_q <= cstAllOWE_uid9_fpArctanXTest_q;
                      WHEN OTHERS => expRPostExc_uid160_z_uid48_fpArctanXTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_inputreg(DELAY,719)
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPostExc_uid160_z_uid48_fpArctanXTest_q, xout => ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdcnt(COUNTER,721)
    -- every=1, low=0, high=7, step=1, init=1
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdcnt_i <= ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdcnt_i,3));


	--ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdreg(REG,722)
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdreg_q <= ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdmux(MUX,723)
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdmux_s <= en;
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdmux: PROCESS (ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdmux_s, ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdreg_q, ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdmux_q <= ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdmux_q <= ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem(DUALMEM,720)
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_ia <= ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_inputreg_q;
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_aa <= ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdreg_q;
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_ab <= ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_rdmux_q;
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_iq,
        address_a => ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_aa,
        data_a => ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_ia
    );
    ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_reset0 <= areset;
        ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_q <= ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_iq(7 downto 0);

	--cstNaNWF_uid11_fpArctanXTest(CONSTANT,10)
    cstNaNWF_uid11_fpArctanXTest_q <= "00000000000000000000001";

	--oFracX_uid139_uid139_z_uid48_fpArctanXTest(BITJOIN,138)@0
    oFracX_uid139_uid139_z_uid48_fpArctanXTest_q <= VCC_q & fracX_uid7_fpArctanXTest_b;

	--y_uid141_z_uid48_fpArctanXTest(BITSELECT,140)@0
    y_uid141_z_uid48_fpArctanXTest_in <= oFracX_uid139_uid139_z_uid48_fpArctanXTest_q(22 downto 0);
    y_uid141_z_uid48_fpArctanXTest_b <= y_uid141_z_uid48_fpArctanXTest_in(22 downto 0);

	--yAddr_uid143_z_uid48_fpArctanXTest(BITSELECT,142)@0
    yAddr_uid143_z_uid48_fpArctanXTest_in <= y_uid141_z_uid48_fpArctanXTest_b;
    yAddr_uid143_z_uid48_fpArctanXTest_b <= yAddr_uid143_z_uid48_fpArctanXTest_in(22 downto 15);

	--reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC2_uid236_invTabGen_lutmem_0(REG,269)@0
    reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC2_uid236_invTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC2_uid236_invTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC2_uid236_invTabGen_lutmem_0_q <= yAddr_uid143_z_uid48_fpArctanXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid236_invTabGen_lutmem(DUALMEM,266)@1
    memoryC2_uid236_invTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid236_invTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid236_invTabGen_lutmem_ab <= reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC2_uid236_invTabGen_lutmem_0_q;
    memoryC2_uid236_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atan_s5_memoryC2_uid236_invTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid236_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid236_invTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid236_invTabGen_lutmem_iq,
        address_a => memoryC2_uid236_invTabGen_lutmem_aa,
        data_a => memoryC2_uid236_invTabGen_lutmem_ia
    );
    memoryC2_uid236_invTabGen_lutmem_reset0 <= areset;
        memoryC2_uid236_invTabGen_lutmem_q <= memoryC2_uid236_invTabGen_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid236_invTabGen_lutmem_0_to_prodXY_uid256_pT1_uid238_invPolyEval_1(REG,271)@3
    reg_memoryC2_uid236_invTabGen_lutmem_0_to_prodXY_uid256_pT1_uid238_invPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid236_invTabGen_lutmem_0_to_prodXY_uid256_pT1_uid238_invPolyEval_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid236_invTabGen_lutmem_0_to_prodXY_uid256_pT1_uid238_invPolyEval_1_q <= memoryC2_uid236_invTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_y_uid141_z_uid48_fpArctanXTest_b_to_yPPolyEval_uid144_z_uid48_fpArctanXTest_a_inputreg(DELAY,718)
    ld_y_uid141_z_uid48_fpArctanXTest_b_to_yPPolyEval_uid144_z_uid48_fpArctanXTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => y_uid141_z_uid48_fpArctanXTest_b, xout => ld_y_uid141_z_uid48_fpArctanXTest_b_to_yPPolyEval_uid144_z_uid48_fpArctanXTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_y_uid141_z_uid48_fpArctanXTest_b_to_yPPolyEval_uid144_z_uid48_fpArctanXTest_a(DELAY,436)@0
    ld_y_uid141_z_uid48_fpArctanXTest_b_to_yPPolyEval_uid144_z_uid48_fpArctanXTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => ld_y_uid141_z_uid48_fpArctanXTest_b_to_yPPolyEval_uid144_z_uid48_fpArctanXTest_a_inputreg_q, xout => ld_y_uid141_z_uid48_fpArctanXTest_b_to_yPPolyEval_uid144_z_uid48_fpArctanXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--yPPolyEval_uid144_z_uid48_fpArctanXTest(BITSELECT,143)@3
    yPPolyEval_uid144_z_uid48_fpArctanXTest_in <= ld_y_uid141_z_uid48_fpArctanXTest_b_to_yPPolyEval_uid144_z_uid48_fpArctanXTest_a_q(14 downto 0);
    yPPolyEval_uid144_z_uid48_fpArctanXTest_b <= yPPolyEval_uid144_z_uid48_fpArctanXTest_in(14 downto 0);

	--yT1_uid237_invPolyEval(BITSELECT,236)@3
    yT1_uid237_invPolyEval_in <= yPPolyEval_uid144_z_uid48_fpArctanXTest_b;
    yT1_uid237_invPolyEval_b <= yT1_uid237_invPolyEval_in(14 downto 3);

	--reg_yT1_uid237_invPolyEval_0_to_prodXY_uid256_pT1_uid238_invPolyEval_0(REG,270)@3
    reg_yT1_uid237_invPolyEval_0_to_prodXY_uid256_pT1_uid238_invPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid237_invPolyEval_0_to_prodXY_uid256_pT1_uid238_invPolyEval_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid237_invPolyEval_0_to_prodXY_uid256_pT1_uid238_invPolyEval_0_q <= yT1_uid237_invPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid256_pT1_uid238_invPolyEval(MULT,255)@4
    prodXY_uid256_pT1_uid238_invPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid256_pT1_uid238_invPolyEval_a),13)) * SIGNED(prodXY_uid256_pT1_uid238_invPolyEval_b);
    prodXY_uid256_pT1_uid238_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid256_pT1_uid238_invPolyEval_a <= (others => '0');
            prodXY_uid256_pT1_uid238_invPolyEval_b <= (others => '0');
            prodXY_uid256_pT1_uid238_invPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid256_pT1_uid238_invPolyEval_a <= reg_yT1_uid237_invPolyEval_0_to_prodXY_uid256_pT1_uid238_invPolyEval_0_q;
                prodXY_uid256_pT1_uid238_invPolyEval_b <= reg_memoryC2_uid236_invTabGen_lutmem_0_to_prodXY_uid256_pT1_uid238_invPolyEval_1_q;
                prodXY_uid256_pT1_uid238_invPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid256_pT1_uid238_invPolyEval_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid256_pT1_uid238_invPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid256_pT1_uid238_invPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid256_pT1_uid238_invPolyEval_q <= prodXY_uid256_pT1_uid238_invPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid257_pT1_uid238_invPolyEval(BITSELECT,256)@7
    prodXYTruncFR_uid257_pT1_uid238_invPolyEval_in <= prodXY_uid256_pT1_uid238_invPolyEval_q;
    prodXYTruncFR_uid257_pT1_uid238_invPolyEval_b <= prodXYTruncFR_uid257_pT1_uid238_invPolyEval_in(23 downto 11);

	--highBBits_uid240_invPolyEval(BITSELECT,239)@7
    highBBits_uid240_invPolyEval_in <= prodXYTruncFR_uid257_pT1_uid238_invPolyEval_b;
    highBBits_uid240_invPolyEval_b <= highBBits_uid240_invPolyEval_in(12 downto 1);

	--ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC1_uid235_invTabGen_lutmem_0_q_to_memoryC1_uid235_invTabGen_lutmem_a(DELAY,560)@1
    ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC1_uid235_invTabGen_lutmem_0_q_to_memoryC1_uid235_invTabGen_lutmem_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC2_uid236_invTabGen_lutmem_0_q, xout => ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC1_uid235_invTabGen_lutmem_0_q_to_memoryC1_uid235_invTabGen_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid235_invTabGen_lutmem(DUALMEM,265)@4
    memoryC1_uid235_invTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid235_invTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid235_invTabGen_lutmem_ab <= ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC1_uid235_invTabGen_lutmem_0_q_to_memoryC1_uid235_invTabGen_lutmem_a_q;
    memoryC1_uid235_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atan_s5_memoryC1_uid235_invTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid235_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid235_invTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid235_invTabGen_lutmem_iq,
        address_a => memoryC1_uid235_invTabGen_lutmem_aa,
        data_a => memoryC1_uid235_invTabGen_lutmem_ia
    );
    memoryC1_uid235_invTabGen_lutmem_reset0 <= areset;
        memoryC1_uid235_invTabGen_lutmem_q <= memoryC1_uid235_invTabGen_lutmem_iq(19 downto 0);

	--reg_memoryC1_uid235_invTabGen_lutmem_0_to_sumAHighB_uid241_invPolyEval_0(REG,273)@6
    reg_memoryC1_uid235_invTabGen_lutmem_0_to_sumAHighB_uid241_invPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid235_invTabGen_lutmem_0_to_sumAHighB_uid241_invPolyEval_0_q <= "00000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid235_invTabGen_lutmem_0_to_sumAHighB_uid241_invPolyEval_0_q <= memoryC1_uid235_invTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid241_invPolyEval(ADD,240)@7
    sumAHighB_uid241_invPolyEval_a <= STD_LOGIC_VECTOR((20 downto 20 => reg_memoryC1_uid235_invTabGen_lutmem_0_to_sumAHighB_uid241_invPolyEval_0_q(19)) & reg_memoryC1_uid235_invTabGen_lutmem_0_to_sumAHighB_uid241_invPolyEval_0_q);
    sumAHighB_uid241_invPolyEval_b <= STD_LOGIC_VECTOR((20 downto 12 => highBBits_uid240_invPolyEval_b(11)) & highBBits_uid240_invPolyEval_b);
            sumAHighB_uid241_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid241_invPolyEval_a) + SIGNED(sumAHighB_uid241_invPolyEval_b));
    sumAHighB_uid241_invPolyEval_q <= sumAHighB_uid241_invPolyEval_o(20 downto 0);


	--lowRangeB_uid239_invPolyEval(BITSELECT,238)@7
    lowRangeB_uid239_invPolyEval_in <= prodXYTruncFR_uid257_pT1_uid238_invPolyEval_b(0 downto 0);
    lowRangeB_uid239_invPolyEval_b <= lowRangeB_uid239_invPolyEval_in(0 downto 0);

	--s1_uid239_uid242_invPolyEval(BITJOIN,241)@7
    s1_uid239_uid242_invPolyEval_q <= sumAHighB_uid241_invPolyEval_q & lowRangeB_uid239_invPolyEval_b;

	--reg_s1_uid239_uid242_invPolyEval_0_to_prodXY_uid259_pT2_uid244_invPolyEval_1(REG,275)@7
    reg_s1_uid239_uid242_invPolyEval_0_to_prodXY_uid259_pT2_uid244_invPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid239_uid242_invPolyEval_0_to_prodXY_uid259_pT2_uid244_invPolyEval_1_q <= "0000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid239_uid242_invPolyEval_0_to_prodXY_uid259_pT2_uid244_invPolyEval_1_q <= s1_uid239_uid242_invPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_nor(LOGICAL,753)
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_nor_b <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_nor_q <= not (ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_nor_a or ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_nor_b);

	--ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_cmpReg(REG,751)
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_sticky_ena(REG,754)
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_nor_q = "1") THEN
                ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_sticky_ena_q <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_enaAnd(LOGICAL,755)
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_enaAnd_a <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_enaAnd_b <= en;
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_enaAnd_q <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_enaAnd_a and ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_enaAnd_b;

	--reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0(REG,274)@3
    reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q <= "000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q <= yPPolyEval_uid144_z_uid48_fpArctanXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_inputreg(DELAY,745)
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q, xout => ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdcnt(COUNTER,747)
    -- every=1, low=0, high=1, step=1, init=1
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdcnt_i <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdcnt_i,1));


	--ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdreg(REG,748)
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdreg_q <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdmux(MUX,749)
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdmux_s <= en;
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdmux: PROCESS (ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdmux_s, ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdreg_q, ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdmux_q <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdmux_q <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem(DUALMEM,746)
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_ia <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_inputreg_q;
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_aa <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdreg_q;
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_ab <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdmux_q;
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_iq,
        address_a => ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_aa,
        data_a => ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_ia
    );
    ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_reset0 <= areset;
        ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_q <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_iq(14 downto 0);

	--prodXY_uid259_pT2_uid244_invPolyEval(MULT,258)@8
    prodXY_uid259_pT2_uid244_invPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid259_pT2_uid244_invPolyEval_a),16)) * SIGNED(prodXY_uid259_pT2_uid244_invPolyEval_b);
    prodXY_uid259_pT2_uid244_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid259_pT2_uid244_invPolyEval_a <= (others => '0');
            prodXY_uid259_pT2_uid244_invPolyEval_b <= (others => '0');
            prodXY_uid259_pT2_uid244_invPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid259_pT2_uid244_invPolyEval_a <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_mem_q;
                prodXY_uid259_pT2_uid244_invPolyEval_b <= reg_s1_uid239_uid242_invPolyEval_0_to_prodXY_uid259_pT2_uid244_invPolyEval_1_q;
                prodXY_uid259_pT2_uid244_invPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid259_pT2_uid244_invPolyEval_pr,37));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid259_pT2_uid244_invPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid259_pT2_uid244_invPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid259_pT2_uid244_invPolyEval_q <= prodXY_uid259_pT2_uid244_invPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid260_pT2_uid244_invPolyEval(BITSELECT,259)@11
    prodXYTruncFR_uid260_pT2_uid244_invPolyEval_in <= prodXY_uid259_pT2_uid244_invPolyEval_q;
    prodXYTruncFR_uid260_pT2_uid244_invPolyEval_b <= prodXYTruncFR_uid260_pT2_uid244_invPolyEval_in(36 downto 14);

	--highBBits_uid246_invPolyEval(BITSELECT,245)@11
    highBBits_uid246_invPolyEval_in <= prodXYTruncFR_uid260_pT2_uid244_invPolyEval_b;
    highBBits_uid246_invPolyEval_b <= highBBits_uid246_invPolyEval_in(22 downto 2);

	--ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_nor(LOGICAL,766)
    ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_nor_b <= ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_sticky_ena_q;
    ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_nor_q <= not (ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_nor_a or ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_nor_b);

	--ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_mem_top(CONSTANT,738)
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_mem_top_q <= "0100";

	--ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmp(LOGICAL,739)
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmp_a <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_mem_top_q;
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdmux_q);
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmp_q <= "1" when ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmp_a = ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmp_b else "0";

	--ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmpReg(REG,740)
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmpReg_q <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_sticky_ena(REG,767)
    ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_nor_q = "1") THEN
                ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_sticky_ena_q <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_enaAnd(LOGICAL,768)
    ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_enaAnd_a <= ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_sticky_ena_q;
    ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_enaAnd_b <= en;
    ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_enaAnd_q <= ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_enaAnd_a and ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_enaAnd_b;

	--ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_inputreg(DELAY,756)
    ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC2_uid236_invTabGen_lutmem_0_q, xout => ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt(COUNTER,734)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_i = 3 THEN
                      ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_i <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_i <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_i,3));


	--ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdreg(REG,735)
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdreg_q <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdmux(MUX,736)
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdmux_s <= en;
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdmux: PROCESS (ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdmux_s, ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdreg_q, ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdmux_q <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdmux_q <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem(DUALMEM,757)
    ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_ia <= ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_inputreg_q;
    ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_aa <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdreg_q;
    ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_ab <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdmux_q;
    ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_iq,
        address_a => ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_aa,
        data_a => ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_ia
    );
    ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_reset0 <= areset;
        ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_q <= ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_iq(7 downto 0);

	--memoryC0_uid234_invTabGen_lutmem(DUALMEM,264)@8
    memoryC0_uid234_invTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid234_invTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid234_invTabGen_lutmem_ab <= ld_reg_yAddr_uid143_z_uid48_fpArctanXTest_0_to_memoryC0_uid234_invTabGen_lutmem_0_q_to_memoryC0_uid234_invTabGen_lutmem_a_replace_mem_q;
    memoryC0_uid234_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atan_s5_memoryC0_uid234_invTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid234_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid234_invTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid234_invTabGen_lutmem_iq,
        address_a => memoryC0_uid234_invTabGen_lutmem_aa,
        data_a => memoryC0_uid234_invTabGen_lutmem_ia
    );
    memoryC0_uid234_invTabGen_lutmem_reset0 <= areset;
        memoryC0_uid234_invTabGen_lutmem_q <= memoryC0_uid234_invTabGen_lutmem_iq(28 downto 0);

	--reg_memoryC0_uid234_invTabGen_lutmem_0_to_sumAHighB_uid247_invPolyEval_0(REG,277)@10
    reg_memoryC0_uid234_invTabGen_lutmem_0_to_sumAHighB_uid247_invPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid234_invTabGen_lutmem_0_to_sumAHighB_uid247_invPolyEval_0_q <= "00000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid234_invTabGen_lutmem_0_to_sumAHighB_uid247_invPolyEval_0_q <= memoryC0_uid234_invTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid247_invPolyEval(ADD,246)@11
    sumAHighB_uid247_invPolyEval_a <= STD_LOGIC_VECTOR((29 downto 29 => reg_memoryC0_uid234_invTabGen_lutmem_0_to_sumAHighB_uid247_invPolyEval_0_q(28)) & reg_memoryC0_uid234_invTabGen_lutmem_0_to_sumAHighB_uid247_invPolyEval_0_q);
    sumAHighB_uid247_invPolyEval_b <= STD_LOGIC_VECTOR((29 downto 21 => highBBits_uid246_invPolyEval_b(20)) & highBBits_uid246_invPolyEval_b);
            sumAHighB_uid247_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid247_invPolyEval_a) + SIGNED(sumAHighB_uid247_invPolyEval_b));
    sumAHighB_uid247_invPolyEval_q <= sumAHighB_uid247_invPolyEval_o(29 downto 0);


	--lowRangeB_uid245_invPolyEval(BITSELECT,244)@11
    lowRangeB_uid245_invPolyEval_in <= prodXYTruncFR_uid260_pT2_uid244_invPolyEval_b(1 downto 0);
    lowRangeB_uid245_invPolyEval_b <= lowRangeB_uid245_invPolyEval_in(1 downto 0);

	--s2_uid245_uid248_invPolyEval(BITJOIN,247)@11
    s2_uid245_uid248_invPolyEval_q <= sumAHighB_uid247_invPolyEval_q & lowRangeB_uid245_invPolyEval_b;

	--fxpInverseRes_uid146_z_uid48_fpArctanXTest(BITSELECT,145)@11
    fxpInverseRes_uid146_z_uid48_fpArctanXTest_in <= s2_uid245_uid248_invPolyEval_q(28 downto 0);
    fxpInverseRes_uid146_z_uid48_fpArctanXTest_b <= fxpInverseRes_uid146_z_uid48_fpArctanXTest_in(28 downto 5);

	--fxpInverseResFrac_uid152_z_uid48_fpArctanXTest(BITSELECT,151)@11
    fxpInverseResFrac_uid152_z_uid48_fpArctanXTest_in <= fxpInverseRes_uid146_z_uid48_fpArctanXTest_b(22 downto 0);
    fxpInverseResFrac_uid152_z_uid48_fpArctanXTest_b <= fxpInverseResFrac_uid152_z_uid48_fpArctanXTest_in(22 downto 0);

	--ld_fracXIsZero_uid140_z_uid48_fpArctanXTest_q_to_fracRCalc_uid153_z_uid48_fpArctanXTest_b(DELAY,444)@0
    ld_fracXIsZero_uid140_z_uid48_fpArctanXTest_q_to_fracRCalc_uid153_z_uid48_fpArctanXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 11 )
    PORT MAP ( xin => fracXIsZero_uid140_z_uid48_fpArctanXTest_q, xout => ld_fracXIsZero_uid140_z_uid48_fpArctanXTest_q_to_fracRCalc_uid153_z_uid48_fpArctanXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRCalc_uid153_z_uid48_fpArctanXTest(MUX,152)@11
    fracRCalc_uid153_z_uid48_fpArctanXTest_s <= ld_fracXIsZero_uid140_z_uid48_fpArctanXTest_q_to_fracRCalc_uid153_z_uid48_fpArctanXTest_b_q;
    fracRCalc_uid153_z_uid48_fpArctanXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRCalc_uid153_z_uid48_fpArctanXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE fracRCalc_uid153_z_uid48_fpArctanXTest_s IS
                      WHEN "0" => fracRCalc_uid153_z_uid48_fpArctanXTest_q <= fxpInverseResFrac_uid152_z_uid48_fpArctanXTest_b;
                      WHEN "1" => fracRCalc_uid153_z_uid48_fpArctanXTest_q <= cstAllZWF_uid10_fpArctanXTest_q;
                      WHEN OTHERS => fracRCalc_uid153_z_uid48_fpArctanXTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--reg_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_1(REG,278)@1
    reg_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_1_q <= outMuxSelEnc_uid158_z_uid48_fpArctanXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_1_q_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_b(DELAY,457)@2
    ld_reg_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_1_q_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 10 )
    PORT MAP ( xin => reg_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_1_q, xout => ld_reg_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_1_q_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid159_z_uid48_fpArctanXTest(MUX,158)@12
    fracRPostExc_uid159_z_uid48_fpArctanXTest_s <= ld_reg_outMuxSelEnc_uid158_z_uid48_fpArctanXTest_0_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_1_q_to_fracRPostExc_uid159_z_uid48_fpArctanXTest_b_q;
    fracRPostExc_uid159_z_uid48_fpArctanXTest: PROCESS (fracRPostExc_uid159_z_uid48_fpArctanXTest_s, en, cstAllZWF_uid10_fpArctanXTest_q, fracRCalc_uid153_z_uid48_fpArctanXTest_q, cstAllZWF_uid10_fpArctanXTest_q, cstNaNWF_uid11_fpArctanXTest_q)
    BEGIN
            CASE fracRPostExc_uid159_z_uid48_fpArctanXTest_s IS
                  WHEN "00" => fracRPostExc_uid159_z_uid48_fpArctanXTest_q <= cstAllZWF_uid10_fpArctanXTest_q;
                  WHEN "01" => fracRPostExc_uid159_z_uid48_fpArctanXTest_q <= fracRCalc_uid153_z_uid48_fpArctanXTest_q;
                  WHEN "10" => fracRPostExc_uid159_z_uid48_fpArctanXTest_q <= cstAllZWF_uid10_fpArctanXTest_q;
                  WHEN "11" => fracRPostExc_uid159_z_uid48_fpArctanXTest_q <= cstNaNWF_uid11_fpArctanXTest_q;
                  WHEN OTHERS => fracRPostExc_uid159_z_uid48_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid163_z_uid48_fpArctanXTest(BITJOIN,162)@12
    R_uid163_z_uid48_fpArctanXTest_q <= reg_signR_uid110_fpArctanXTest_0_to_R_uid163_z_uid48_fpArctanXTest_2_q & ld_expRPostExc_uid160_z_uid48_fpArctanXTest_q_to_R_uid163_z_uid48_fpArctanXTest_b_replace_mem_q & fracRPostExc_uid159_z_uid48_fpArctanXTest_q;

	--ld_xIn_a_to_u_uid49_fpArctanXTest_c_nor(LOGICAL,650)
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_nor_b <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_sticky_ena_q;
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_nor_q <= not (ld_xIn_a_to_u_uid49_fpArctanXTest_c_nor_a or ld_xIn_a_to_u_uid49_fpArctanXTest_c_nor_b);

	--ld_xIn_a_to_u_uid49_fpArctanXTest_c_mem_top(CONSTANT,646)
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_mem_top_q <= "01001";

	--ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmp(LOGICAL,647)
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmp_a <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_mem_top_q;
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdmux_q);
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmp_q <= "1" when ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmp_a = ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmp_b else "0";

	--ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmpReg(REG,648)
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmpReg_q <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xIn_a_to_u_uid49_fpArctanXTest_c_sticky_ena(REG,651)
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_a_to_u_uid49_fpArctanXTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_xIn_a_to_u_uid49_fpArctanXTest_c_nor_q = "1") THEN
                ld_xIn_a_to_u_uid49_fpArctanXTest_c_sticky_ena_q <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xIn_a_to_u_uid49_fpArctanXTest_c_enaAnd(LOGICAL,652)
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_enaAnd_a <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_sticky_ena_q;
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_enaAnd_b <= en;
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_enaAnd_q <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_enaAnd_a and ld_xIn_a_to_u_uid49_fpArctanXTest_c_enaAnd_b;

	--ld_xIn_a_to_u_uid49_fpArctanXTest_c_inputreg(DELAY,640)
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => a, xout => ld_xIn_a_to_u_uid49_fpArctanXTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt(COUNTER,642)
    -- every=1, low=0, high=9, step=1, init=1
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_i = 8 THEN
                      ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_eq = '1') THEN
                        ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_i <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_i - 9;
                    ELSE
                        ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_i <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_i,4));


	--ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdreg(REG,643)
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdreg_q <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdmux(MUX,644)
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdmux_s <= en;
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdmux: PROCESS (ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdmux_s, ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdreg_q, ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_q)
    BEGIN
            CASE ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdmux_s IS
                  WHEN "0" => ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdmux_q <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdreg_q;
                  WHEN "1" => ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdmux_q <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem(DUALMEM,641)
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_ia <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_inputreg_q;
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_aa <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdreg_q;
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_ab <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_rdmux_q;
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 32,
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
        clocken1 => ld_xIn_a_to_u_uid49_fpArctanXTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_iq,
        address_a => ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_aa,
        data_a => ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_ia
    );
    ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_reset0 <= areset;
        ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_q <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_iq(31 downto 0);

	--path2_uid47_fpArctanXTest(COMPARE,46)@0
    path2_uid47_fpArctanXTest_cin <= GND_q;
    path2_uid47_fpArctanXTest_a <= STD_LOGIC_VECTOR("00" & expX_uid6_fpArctanXTest_b) & '0';
    path2_uid47_fpArctanXTest_b <= STD_LOGIC_VECTOR("00" & cstBias_uid13_fpArctanXTest_q) & path2_uid47_fpArctanXTest_cin(0);
            path2_uid47_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path2_uid47_fpArctanXTest_a) - UNSIGNED(path2_uid47_fpArctanXTest_b));
    path2_uid47_fpArctanXTest_n(0) <= not path2_uid47_fpArctanXTest_o(10);


	--reg_path2_uid47_fpArctanXTest_2_to_u_uid49_fpArctanXTest_1(REG,280)@0
    reg_path2_uid47_fpArctanXTest_2_to_u_uid49_fpArctanXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_path2_uid47_fpArctanXTest_2_to_u_uid49_fpArctanXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_path2_uid47_fpArctanXTest_2_to_u_uid49_fpArctanXTest_1_q <= path2_uid47_fpArctanXTest_n;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_path2_uid47_fpArctanXTest_2_to_u_uid49_fpArctanXTest_1_q_to_u_uid49_fpArctanXTest_b(DELAY,344)@1
    ld_reg_path2_uid47_fpArctanXTest_2_to_u_uid49_fpArctanXTest_1_q_to_u_uid49_fpArctanXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 11 )
    PORT MAP ( xin => reg_path2_uid47_fpArctanXTest_2_to_u_uid49_fpArctanXTest_1_q, xout => ld_reg_path2_uid47_fpArctanXTest_2_to_u_uid49_fpArctanXTest_1_q_to_u_uid49_fpArctanXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--u_uid49_fpArctanXTest(MUX,48)@12
    u_uid49_fpArctanXTest_s <= ld_reg_path2_uid47_fpArctanXTest_2_to_u_uid49_fpArctanXTest_1_q_to_u_uid49_fpArctanXTest_b_q;
    u_uid49_fpArctanXTest: PROCESS (u_uid49_fpArctanXTest_s, en, ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_q, R_uid163_z_uid48_fpArctanXTest_q)
    BEGIN
            CASE u_uid49_fpArctanXTest_s IS
                  WHEN "0" => u_uid49_fpArctanXTest_q <= ld_xIn_a_to_u_uid49_fpArctanXTest_c_replace_mem_q;
                  WHEN "1" => u_uid49_fpArctanXTest_q <= R_uid163_z_uid48_fpArctanXTest_q;
                  WHEN OTHERS => u_uid49_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracU_uid51_fpArctanXTest(BITSELECT,50)@12
    fracU_uid51_fpArctanXTest_in <= u_uid49_fpArctanXTest_q(22 downto 0);
    fracU_uid51_fpArctanXTest_b <= fracU_uid51_fpArctanXTest_in(22 downto 0);

	--ld_fracU_uid51_fpArctanXTest_b_to_oFracU_uid52_uid52_fpArctanXTest_a(DELAY,349)@12
    ld_fracU_uid51_fpArctanXTest_b_to_oFracU_uid52_uid52_fpArctanXTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracU_uid51_fpArctanXTest_b, xout => ld_fracU_uid51_fpArctanXTest_b_to_oFracU_uid52_uid52_fpArctanXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--oFracU_uid52_uid52_fpArctanXTest(BITJOIN,51)@13
    oFracU_uid52_uid52_fpArctanXTest_q <= VCC_q & ld_fracU_uid51_fpArctanXTest_b_to_oFracU_uid52_uid52_fpArctanXTest_a_q;

	--oFracUExt_uid61_fpArctanXTest(BITJOIN,60)@13
    oFracUExt_uid61_fpArctanXTest_q <= cst01pWShift_uid60_fpArctanXTest_q & oFracU_uid52_uid52_fpArctanXTest_q;

	--X24dto0_uid173_fxpU_uid63_fpArctanXTest(BITSELECT,172)@13
    X24dto0_uid173_fxpU_uid63_fpArctanXTest_in <= oFracUExt_uid61_fpArctanXTest_q(24 downto 0);
    X24dto0_uid173_fxpU_uid63_fpArctanXTest_b <= X24dto0_uid173_fxpU_uid63_fpArctanXTest_in(24 downto 0);

	--leftShiftStage0Idx3Pad12_uid172_fxpU_uid63_fpArctanXTest(CONSTANT,171)
    leftShiftStage0Idx3Pad12_uid172_fxpU_uid63_fpArctanXTest_q <= "000000000000";

	--leftShiftStage0Idx3_uid174_fxpU_uid63_fpArctanXTest(BITJOIN,173)@13
    leftShiftStage0Idx3_uid174_fxpU_uid63_fpArctanXTest_q <= X24dto0_uid173_fxpU_uid63_fpArctanXTest_b & leftShiftStage0Idx3Pad12_uid172_fxpU_uid63_fpArctanXTest_q;

	--reg_leftShiftStage0Idx3_uid174_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_5(REG,289)@13
    reg_leftShiftStage0Idx3_uid174_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx3_uid174_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_5_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx3_uid174_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_5_q <= leftShiftStage0Idx3_uid174_fxpU_uid63_fpArctanXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--X28dto0_uid170_fxpU_uid63_fpArctanXTest(BITSELECT,169)@13
    X28dto0_uid170_fxpU_uid63_fpArctanXTest_in <= oFracUExt_uid61_fpArctanXTest_q(28 downto 0);
    X28dto0_uid170_fxpU_uid63_fpArctanXTest_b <= X28dto0_uid170_fxpU_uid63_fpArctanXTest_in(28 downto 0);

	--leftShiftStage0Idx2_uid171_fxpU_uid63_fpArctanXTest(BITJOIN,170)@13
    leftShiftStage0Idx2_uid171_fxpU_uid63_fpArctanXTest_q <= X28dto0_uid170_fxpU_uid63_fpArctanXTest_b & cstAllZWE_uid12_fpArctanXTest_q;

	--reg_leftShiftStage0Idx2_uid171_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_4(REG,288)@13
    reg_leftShiftStage0Idx2_uid171_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx2_uid171_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_4_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx2_uid171_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_4_q <= leftShiftStage0Idx2_uid171_fxpU_uid63_fpArctanXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--X32dto0_uid167_fxpU_uid63_fpArctanXTest(BITSELECT,166)@13
    X32dto0_uid167_fxpU_uid63_fpArctanXTest_in <= oFracUExt_uid61_fpArctanXTest_q(32 downto 0);
    X32dto0_uid167_fxpU_uid63_fpArctanXTest_b <= X32dto0_uid167_fxpU_uid63_fpArctanXTest_in(32 downto 0);

	--leftShiftStage0Idx1Pad4_uid166_fxpU_uid63_fpArctanXTest(CONSTANT,165)
    leftShiftStage0Idx1Pad4_uid166_fxpU_uid63_fpArctanXTest_q <= "0000";

	--leftShiftStage0Idx1_uid168_fxpU_uid63_fpArctanXTest(BITJOIN,167)@13
    leftShiftStage0Idx1_uid168_fxpU_uid63_fpArctanXTest_q <= X32dto0_uid167_fxpU_uid63_fpArctanXTest_b & leftShiftStage0Idx1Pad4_uid166_fxpU_uid63_fpArctanXTest_q;

	--reg_leftShiftStage0Idx1_uid168_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_3(REG,287)@13
    reg_leftShiftStage0Idx1_uid168_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx1_uid168_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_3_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx1_uid168_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_3_q <= leftShiftStage0Idx1_uid168_fxpU_uid63_fpArctanXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_oFracUExt_uid61_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_2(REG,286)@13
    reg_oFracUExt_uid61_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracUExt_uid61_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracUExt_uid61_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_2_q <= oFracUExt_uid61_fpArctanXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--zS_uid58_fpArctanXTest(CONSTANT,57)
    zS_uid58_fpArctanXTest_q <= "000000000";

	--shiftBias_uid55_fpArctanXTest(CONSTANT,54)
    shiftBias_uid55_fpArctanXTest_q <= "01110010";

	--expU_uid50_fpArctanXTest(BITSELECT,49)@12
    expU_uid50_fpArctanXTest_in <= u_uid49_fpArctanXTest_q(30 downto 0);
    expU_uid50_fpArctanXTest_b <= expU_uid50_fpArctanXTest_in(30 downto 23);

	--reg_expU_uid50_fpArctanXTest_0_to_atanUIsU_uid54_fpArctanXTest_1(REG,281)@12
    reg_expU_uid50_fpArctanXTest_0_to_atanUIsU_uid54_fpArctanXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expU_uid50_fpArctanXTest_0_to_atanUIsU_uid54_fpArctanXTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expU_uid50_fpArctanXTest_0_to_atanUIsU_uid54_fpArctanXTest_1_q <= expU_uid50_fpArctanXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--shiftValue_uid56_fpArctanXTest(SUB,55)@13
    shiftValue_uid56_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & reg_expU_uid50_fpArctanXTest_0_to_atanUIsU_uid54_fpArctanXTest_1_q);
    shiftValue_uid56_fpArctanXTest_b <= STD_LOGIC_VECTOR("0" & shiftBias_uid55_fpArctanXTest_q);
            shiftValue_uid56_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValue_uid56_fpArctanXTest_a) - UNSIGNED(shiftValue_uid56_fpArctanXTest_b));
    shiftValue_uid56_fpArctanXTest_q <= shiftValue_uid56_fpArctanXTest_o(8 downto 0);


	--ShiftValue8_uid57_fpArctanXTest(BITSELECT,56)@13
    ShiftValue8_uid57_fpArctanXTest_in <= shiftValue_uid56_fpArctanXTest_q;
    ShiftValue8_uid57_fpArctanXTest_b <= ShiftValue8_uid57_fpArctanXTest_in(8 downto 8);

	--shiftValuePostNeg_uid59_fpArctanXTest(MUX,58)@13
    shiftValuePostNeg_uid59_fpArctanXTest_s <= ShiftValue8_uid57_fpArctanXTest_b;
    shiftValuePostNeg_uid59_fpArctanXTest: PROCESS (shiftValuePostNeg_uid59_fpArctanXTest_s, en, shiftValue_uid56_fpArctanXTest_q, zS_uid58_fpArctanXTest_q)
    BEGIN
            CASE shiftValuePostNeg_uid59_fpArctanXTest_s IS
                  WHEN "0" => shiftValuePostNeg_uid59_fpArctanXTest_q <= shiftValue_uid56_fpArctanXTest_q;
                  WHEN "1" => shiftValuePostNeg_uid59_fpArctanXTest_q <= zS_uid58_fpArctanXTest_q;
                  WHEN OTHERS => shiftValuePostNeg_uid59_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fxpShifterBits_uid62_fpArctanXTest(BITSELECT,61)@13
    fxpShifterBits_uid62_fpArctanXTest_in <= shiftValuePostNeg_uid59_fpArctanXTest_q(3 downto 0);
    fxpShifterBits_uid62_fpArctanXTest_b <= fxpShifterBits_uid62_fpArctanXTest_in(3 downto 0);

	--leftShiftStageSel3Dto2_uid175_fxpU_uid63_fpArctanXTest(BITSELECT,174)@13
    leftShiftStageSel3Dto2_uid175_fxpU_uid63_fpArctanXTest_in <= fxpShifterBits_uid62_fpArctanXTest_b;
    leftShiftStageSel3Dto2_uid175_fxpU_uid63_fpArctanXTest_b <= leftShiftStageSel3Dto2_uid175_fxpU_uid63_fpArctanXTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid175_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_1(REG,285)@13
    reg_leftShiftStageSel3Dto2_uid175_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid175_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid175_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_1_q <= leftShiftStageSel3Dto2_uid175_fxpU_uid63_fpArctanXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest(MUX,175)@14
    leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_s <= reg_leftShiftStageSel3Dto2_uid175_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_1_q;
    leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest: PROCESS (leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_s, en, reg_oFracUExt_uid61_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_2_q, reg_leftShiftStage0Idx1_uid168_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_3_q, reg_leftShiftStage0Idx2_uid171_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_4_q, reg_leftShiftStage0Idx3_uid174_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_5_q)
    BEGIN
            CASE leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_s IS
                  WHEN "00" => leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_q <= reg_oFracUExt_uid61_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_2_q;
                  WHEN "01" => leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_q <= reg_leftShiftStage0Idx1_uid168_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_3_q;
                  WHEN "10" => leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_q <= reg_leftShiftStage0Idx2_uid171_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_4_q;
                  WHEN "11" => leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_q <= reg_leftShiftStage0Idx3_uid174_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_5_q;
                  WHEN OTHERS => leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage033dto0_uid184_fxpU_uid63_fpArctanXTest(BITSELECT,183)@14
    LeftShiftStage033dto0_uid184_fxpU_uid63_fpArctanXTest_in <= leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_q(33 downto 0);
    LeftShiftStage033dto0_uid184_fxpU_uid63_fpArctanXTest_b <= LeftShiftStage033dto0_uid184_fxpU_uid63_fpArctanXTest_in(33 downto 0);

	--ld_LeftShiftStage033dto0_uid184_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx3_uid185_fxpU_uid63_fpArctanXTest_b(DELAY,481)@14
    ld_LeftShiftStage033dto0_uid184_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx3_uid185_fxpU_uid63_fpArctanXTest_b : dspba_delay
    GENERIC MAP ( width => 34, depth => 1 )
    PORT MAP ( xin => LeftShiftStage033dto0_uid184_fxpU_uid63_fpArctanXTest_b, xout => ld_LeftShiftStage033dto0_uid184_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx3_uid185_fxpU_uid63_fpArctanXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx3Pad3_uid183_fxpU_uid63_fpArctanXTest(CONSTANT,182)
    leftShiftStage1Idx3Pad3_uid183_fxpU_uid63_fpArctanXTest_q <= "000";

	--leftShiftStage1Idx3_uid185_fxpU_uid63_fpArctanXTest(BITJOIN,184)@15
    leftShiftStage1Idx3_uid185_fxpU_uid63_fpArctanXTest_q <= ld_LeftShiftStage033dto0_uid184_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx3_uid185_fxpU_uid63_fpArctanXTest_b_q & leftShiftStage1Idx3Pad3_uid183_fxpU_uid63_fpArctanXTest_q;

	--LeftShiftStage034dto0_uid181_fxpU_uid63_fpArctanXTest(BITSELECT,180)@14
    LeftShiftStage034dto0_uid181_fxpU_uid63_fpArctanXTest_in <= leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_q(34 downto 0);
    LeftShiftStage034dto0_uid181_fxpU_uid63_fpArctanXTest_b <= LeftShiftStage034dto0_uid181_fxpU_uid63_fpArctanXTest_in(34 downto 0);

	--ld_LeftShiftStage034dto0_uid181_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx2_uid182_fxpU_uid63_fpArctanXTest_b(DELAY,479)@14
    ld_LeftShiftStage034dto0_uid181_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx2_uid182_fxpU_uid63_fpArctanXTest_b : dspba_delay
    GENERIC MAP ( width => 35, depth => 1 )
    PORT MAP ( xin => LeftShiftStage034dto0_uid181_fxpU_uid63_fpArctanXTest_b, xout => ld_LeftShiftStage034dto0_uid181_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx2_uid182_fxpU_uid63_fpArctanXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx2Pad2_uid180_fxpU_uid63_fpArctanXTest(CONSTANT,179)
    leftShiftStage1Idx2Pad2_uid180_fxpU_uid63_fpArctanXTest_q <= "00";

	--leftShiftStage1Idx2_uid182_fxpU_uid63_fpArctanXTest(BITJOIN,181)@15
    leftShiftStage1Idx2_uid182_fxpU_uid63_fpArctanXTest_q <= ld_LeftShiftStage034dto0_uid181_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx2_uid182_fxpU_uid63_fpArctanXTest_b_q & leftShiftStage1Idx2Pad2_uid180_fxpU_uid63_fpArctanXTest_q;

	--LeftShiftStage035dto0_uid178_fxpU_uid63_fpArctanXTest(BITSELECT,177)@14
    LeftShiftStage035dto0_uid178_fxpU_uid63_fpArctanXTest_in <= leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_q(35 downto 0);
    LeftShiftStage035dto0_uid178_fxpU_uid63_fpArctanXTest_b <= LeftShiftStage035dto0_uid178_fxpU_uid63_fpArctanXTest_in(35 downto 0);

	--ld_LeftShiftStage035dto0_uid178_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx1_uid179_fxpU_uid63_fpArctanXTest_b(DELAY,477)@14
    ld_LeftShiftStage035dto0_uid178_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx1_uid179_fxpU_uid63_fpArctanXTest_b : dspba_delay
    GENERIC MAP ( width => 36, depth => 1 )
    PORT MAP ( xin => LeftShiftStage035dto0_uid178_fxpU_uid63_fpArctanXTest_b, xout => ld_LeftShiftStage035dto0_uid178_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx1_uid179_fxpU_uid63_fpArctanXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx1_uid179_fxpU_uid63_fpArctanXTest(BITJOIN,178)@15
    leftShiftStage1Idx1_uid179_fxpU_uid63_fpArctanXTest_q <= ld_LeftShiftStage035dto0_uid178_fxpU_uid63_fpArctanXTest_b_to_leftShiftStage1Idx1_uid179_fxpU_uid63_fpArctanXTest_b_q & GND_q;

	--reg_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_2(REG,291)@14
    reg_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_2_q <= leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest(BITSELECT,185)@13
    leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_in <= fxpShifterBits_uid62_fpArctanXTest_b(1 downto 0);
    leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_b <= leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_in(1 downto 0);

	--reg_leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_1(REG,290)@13
    reg_leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_1_q <= leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_1_q_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_b(DELAY,483)@14
    ld_reg_leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_1_q_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_1_q, xout => ld_reg_leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_1_q_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest(MUX,186)@15
    leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_s <= ld_reg_leftShiftStageSel1Dto0_uid186_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_1_q_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_b_q;
    leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest: PROCESS (leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_s, en, reg_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_2_q, leftShiftStage1Idx1_uid179_fxpU_uid63_fpArctanXTest_q, leftShiftStage1Idx2_uid182_fxpU_uid63_fpArctanXTest_q, leftShiftStage1Idx3_uid185_fxpU_uid63_fpArctanXTest_q)
    BEGIN
            CASE leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_s IS
                  WHEN "00" => leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_q <= reg_leftShiftStage0_uid176_fxpU_uid63_fpArctanXTest_0_to_leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_2_q;
                  WHEN "01" => leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_q <= leftShiftStage1Idx1_uid179_fxpU_uid63_fpArctanXTest_q;
                  WHEN "10" => leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_q <= leftShiftStage1Idx2_uid182_fxpU_uid63_fpArctanXTest_q;
                  WHEN "11" => leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_q <= leftShiftStage1Idx3_uid185_fxpU_uid63_fpArctanXTest_q;
                  WHEN OTHERS => leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--y_uid64_fpArctanXTest(BITSELECT,63)@15
    y_uid64_fpArctanXTest_in <= leftShiftStage1_uid187_fxpU_uid63_fpArctanXTest_q(35 downto 0);
    y_uid64_fpArctanXTest_b <= y_uid64_fpArctanXTest_in(35 downto 1);

	--yAddr_uid66_fpArctanXTest(BITSELECT,65)@15
    yAddr_uid66_fpArctanXTest_in <= y_uid64_fpArctanXTest_b;
    yAddr_uid66_fpArctanXTest_b <= yAddr_uid66_fpArctanXTest_in(34 downto 27);

	--reg_yAddr_uid66_fpArctanXTest_0_to_memoryC2_uid191_atanXOXTabGen_lutmem_0(REG,292)@15
    reg_yAddr_uid66_fpArctanXTest_0_to_memoryC2_uid191_atanXOXTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid66_fpArctanXTest_0_to_memoryC2_uid191_atanXOXTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid66_fpArctanXTest_0_to_memoryC2_uid191_atanXOXTabGen_lutmem_0_q <= yAddr_uid66_fpArctanXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid191_atanXOXTabGen_lutmem(DUALMEM,263)@16
    memoryC2_uid191_atanXOXTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid191_atanXOXTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid191_atanXOXTabGen_lutmem_ab <= reg_yAddr_uid66_fpArctanXTest_0_to_memoryC2_uid191_atanXOXTabGen_lutmem_0_q;
    memoryC2_uid191_atanXOXTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atan_s5_memoryC2_uid191_atanXOXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid191_atanXOXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid191_atanXOXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid191_atanXOXTabGen_lutmem_iq,
        address_a => memoryC2_uid191_atanXOXTabGen_lutmem_aa,
        data_a => memoryC2_uid191_atanXOXTabGen_lutmem_ia
    );
    memoryC2_uid191_atanXOXTabGen_lutmem_reset0 <= areset;
        memoryC2_uid191_atanXOXTabGen_lutmem_q <= memoryC2_uid191_atanXOXTabGen_lutmem_iq(12 downto 0);

	--reg_memoryC2_uid191_atanXOXTabGen_lutmem_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_1(REG,294)@18
    reg_memoryC2_uid191_atanXOXTabGen_lutmem_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid191_atanXOXTabGen_lutmem_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_1_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid191_atanXOXTabGen_lutmem_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_1_q <= memoryC2_uid191_atanXOXTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--yPPolyEval_uid67_fpArctanXTest(BITSELECT,66)@15
    yPPolyEval_uid67_fpArctanXTest_in <= y_uid64_fpArctanXTest_b(26 downto 0);
    yPPolyEval_uid67_fpArctanXTest_b <= yPPolyEval_uid67_fpArctanXTest_in(26 downto 9);

	--yT1_uid192_atanXOXPolyEval(BITSELECT,191)@15
    yT1_uid192_atanXOXPolyEval_in <= yPPolyEval_uid67_fpArctanXTest_b;
    yT1_uid192_atanXOXPolyEval_b <= yT1_uid192_atanXOXPolyEval_in(17 downto 5);

	--ld_yT1_uid192_atanXOXPolyEval_b_to_reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0_a_inputreg(DELAY,782)
    ld_yT1_uid192_atanXOXPolyEval_b_to_reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 13, depth => 1 )
    PORT MAP ( xin => yT1_uid192_atanXOXPolyEval_b, xout => ld_yT1_uid192_atanXOXPolyEval_b_to_reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yT1_uid192_atanXOXPolyEval_b_to_reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0_a(DELAY,588)@15
    ld_yT1_uid192_atanXOXPolyEval_b_to_reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0_a : dspba_delay
    GENERIC MAP ( width => 13, depth => 2 )
    PORT MAP ( xin => ld_yT1_uid192_atanXOXPolyEval_b_to_reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0_a_inputreg_q, xout => ld_yT1_uid192_atanXOXPolyEval_b_to_reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0(REG,293)@18
    reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0_q <= ld_yT1_uid192_atanXOXPolyEval_b_to_reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid250_pT1_uid193_atanXOXPolyEval(MULT,249)@19
    prodXY_uid250_pT1_uid193_atanXOXPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid250_pT1_uid193_atanXOXPolyEval_a),14)) * SIGNED(prodXY_uid250_pT1_uid193_atanXOXPolyEval_b);
    prodXY_uid250_pT1_uid193_atanXOXPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid250_pT1_uid193_atanXOXPolyEval_a <= (others => '0');
            prodXY_uid250_pT1_uid193_atanXOXPolyEval_b <= (others => '0');
            prodXY_uid250_pT1_uid193_atanXOXPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid250_pT1_uid193_atanXOXPolyEval_a <= reg_yT1_uid192_atanXOXPolyEval_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_0_q;
                prodXY_uid250_pT1_uid193_atanXOXPolyEval_b <= reg_memoryC2_uid191_atanXOXTabGen_lutmem_0_to_prodXY_uid250_pT1_uid193_atanXOXPolyEval_1_q;
                prodXY_uid250_pT1_uid193_atanXOXPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid250_pT1_uid193_atanXOXPolyEval_pr,26));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid250_pT1_uid193_atanXOXPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid250_pT1_uid193_atanXOXPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid250_pT1_uid193_atanXOXPolyEval_q <= prodXY_uid250_pT1_uid193_atanXOXPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid251_pT1_uid193_atanXOXPolyEval(BITSELECT,250)@22
    prodXYTruncFR_uid251_pT1_uid193_atanXOXPolyEval_in <= prodXY_uid250_pT1_uid193_atanXOXPolyEval_q;
    prodXYTruncFR_uid251_pT1_uid193_atanXOXPolyEval_b <= prodXYTruncFR_uid251_pT1_uid193_atanXOXPolyEval_in(25 downto 12);

	--highBBits_uid195_atanXOXPolyEval(BITSELECT,194)@22
    highBBits_uid195_atanXOXPolyEval_in <= prodXYTruncFR_uid251_pT1_uid193_atanXOXPolyEval_b;
    highBBits_uid195_atanXOXPolyEval_b <= highBBits_uid195_atanXOXPolyEval_in(13 downto 1);

	--ld_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC1_uid190_atanXOXTabGen_lutmem_0_q_to_memoryC1_uid190_atanXOXTabGen_lutmem_a(DELAY,557)@16
    ld_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC1_uid190_atanXOXTabGen_lutmem_0_q_to_memoryC1_uid190_atanXOXTabGen_lutmem_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => reg_yAddr_uid66_fpArctanXTest_0_to_memoryC2_uid191_atanXOXTabGen_lutmem_0_q, xout => ld_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC1_uid190_atanXOXTabGen_lutmem_0_q_to_memoryC1_uid190_atanXOXTabGen_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid190_atanXOXTabGen_lutmem(DUALMEM,262)@19
    memoryC1_uid190_atanXOXTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid190_atanXOXTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid190_atanXOXTabGen_lutmem_ab <= ld_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC1_uid190_atanXOXTabGen_lutmem_0_q_to_memoryC1_uid190_atanXOXTabGen_lutmem_a_q;
    memoryC1_uid190_atanXOXTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atan_s5_memoryC1_uid190_atanXOXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid190_atanXOXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid190_atanXOXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid190_atanXOXTabGen_lutmem_iq,
        address_a => memoryC1_uid190_atanXOXTabGen_lutmem_aa,
        data_a => memoryC1_uid190_atanXOXTabGen_lutmem_ia
    );
    memoryC1_uid190_atanXOXTabGen_lutmem_reset0 <= areset;
        memoryC1_uid190_atanXOXTabGen_lutmem_q <= memoryC1_uid190_atanXOXTabGen_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid190_atanXOXTabGen_lutmem_0_to_sumAHighB_uid196_atanXOXPolyEval_0(REG,296)@21
    reg_memoryC1_uid190_atanXOXTabGen_lutmem_0_to_sumAHighB_uid196_atanXOXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid190_atanXOXTabGen_lutmem_0_to_sumAHighB_uid196_atanXOXPolyEval_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid190_atanXOXTabGen_lutmem_0_to_sumAHighB_uid196_atanXOXPolyEval_0_q <= memoryC1_uid190_atanXOXTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid196_atanXOXPolyEval(ADD,195)@22
    sumAHighB_uid196_atanXOXPolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid190_atanXOXTabGen_lutmem_0_to_sumAHighB_uid196_atanXOXPolyEval_0_q(20)) & reg_memoryC1_uid190_atanXOXTabGen_lutmem_0_to_sumAHighB_uid196_atanXOXPolyEval_0_q);
    sumAHighB_uid196_atanXOXPolyEval_b <= STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid195_atanXOXPolyEval_b(12)) & highBBits_uid195_atanXOXPolyEval_b);
            sumAHighB_uid196_atanXOXPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid196_atanXOXPolyEval_a) + SIGNED(sumAHighB_uid196_atanXOXPolyEval_b));
    sumAHighB_uid196_atanXOXPolyEval_q <= sumAHighB_uid196_atanXOXPolyEval_o(21 downto 0);


	--lowRangeB_uid194_atanXOXPolyEval(BITSELECT,193)@22
    lowRangeB_uid194_atanXOXPolyEval_in <= prodXYTruncFR_uid251_pT1_uid193_atanXOXPolyEval_b(0 downto 0);
    lowRangeB_uid194_atanXOXPolyEval_b <= lowRangeB_uid194_atanXOXPolyEval_in(0 downto 0);

	--s1_uid194_uid197_atanXOXPolyEval(BITJOIN,196)@22
    s1_uid194_uid197_atanXOXPolyEval_q <= sumAHighB_uid196_atanXOXPolyEval_q & lowRangeB_uid194_atanXOXPolyEval_b;

	--reg_s1_uid194_uid197_atanXOXPolyEval_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_1(REG,298)@22
    reg_s1_uid194_uid197_atanXOXPolyEval_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid194_uid197_atanXOXPolyEval_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid194_uid197_atanXOXPolyEval_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_1_q <= s1_uid194_uid197_atanXOXPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_nor(LOGICAL,742)
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_nor_b <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_nor_q <= not (ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_nor_a or ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_nor_b);

	--ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_sticky_ena(REG,743)
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_nor_q = "1") THEN
                ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_sticky_ena_q <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_enaAnd(LOGICAL,744)
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_enaAnd_a <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_enaAnd_b <= en;
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_enaAnd_q <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_enaAnd_a and ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_enaAnd_b;

	--reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0(REG,297)@15
    reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q <= yPPolyEval_uid67_fpArctanXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_inputreg(DELAY,732)
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q, xout => ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem(DUALMEM,733)
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_ia <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_inputreg_q;
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_aa <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdreg_q;
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_ab <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdmux_q;
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_iq,
        address_a => ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_aa,
        data_a => ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_ia
    );
    ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_reset0 <= areset;
        ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_q <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_iq(17 downto 0);

	--prodXY_uid253_pT2_uid199_atanXOXPolyEval(MULT,252)@23
    prodXY_uid253_pT2_uid199_atanXOXPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid253_pT2_uid199_atanXOXPolyEval_a),19)) * SIGNED(prodXY_uid253_pT2_uid199_atanXOXPolyEval_b);
    prodXY_uid253_pT2_uid199_atanXOXPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid253_pT2_uid199_atanXOXPolyEval_a <= (others => '0');
            prodXY_uid253_pT2_uid199_atanXOXPolyEval_b <= (others => '0');
            prodXY_uid253_pT2_uid199_atanXOXPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid253_pT2_uid199_atanXOXPolyEval_a <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_mem_q;
                prodXY_uid253_pT2_uid199_atanXOXPolyEval_b <= reg_s1_uid194_uid197_atanXOXPolyEval_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_1_q;
                prodXY_uid253_pT2_uid199_atanXOXPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid253_pT2_uid199_atanXOXPolyEval_pr,41));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid253_pT2_uid199_atanXOXPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid253_pT2_uid199_atanXOXPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid253_pT2_uid199_atanXOXPolyEval_q <= prodXY_uid253_pT2_uid199_atanXOXPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid254_pT2_uid199_atanXOXPolyEval(BITSELECT,253)@26
    prodXYTruncFR_uid254_pT2_uid199_atanXOXPolyEval_in <= prodXY_uid253_pT2_uid199_atanXOXPolyEval_q;
    prodXYTruncFR_uid254_pT2_uid199_atanXOXPolyEval_b <= prodXYTruncFR_uid254_pT2_uid199_atanXOXPolyEval_in(40 downto 17);

	--highBBits_uid201_atanXOXPolyEval(BITSELECT,200)@26
    highBBits_uid201_atanXOXPolyEval_in <= prodXYTruncFR_uid254_pT2_uid199_atanXOXPolyEval_b;
    highBBits_uid201_atanXOXPolyEval_b <= highBBits_uid201_atanXOXPolyEval_in(23 downto 2);

	--ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_nor(LOGICAL,793)
    ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_nor_b <= ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_sticky_ena_q;
    ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_nor_q <= not (ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_nor_a or ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_nor_b);

	--ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_sticky_ena(REG,794)
    ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_nor_q = "1") THEN
                ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_sticky_ena_q <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_enaAnd(LOGICAL,795)
    ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_enaAnd_a <= ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_sticky_ena_q;
    ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_enaAnd_b <= en;
    ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_enaAnd_q <= ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_enaAnd_a and ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_enaAnd_b;

	--ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_inputreg(DELAY,783)
    ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => yAddr_uid66_fpArctanXTest_b, xout => ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem(DUALMEM,784)
    ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_ia <= ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_inputreg_q;
    ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_aa <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdreg_q;
    ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_ab <= ld_reg_yPPolyEval_uid67_fpArctanXTest_0_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_0_q_to_prodXY_uid253_pT2_uid199_atanXOXPolyEval_a_replace_rdmux_q;
    ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_iq,
        address_a => ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_aa,
        data_a => ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_ia
    );
    ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_q <= ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0(REG,299)@22
    reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_q <= ld_yAddr_uid66_fpArctanXTest_b_to_reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid189_atanXOXTabGen_lutmem(DUALMEM,261)@23
    memoryC0_uid189_atanXOXTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid189_atanXOXTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid189_atanXOXTabGen_lutmem_ab <= reg_yAddr_uid66_fpArctanXTest_0_to_memoryC0_uid189_atanXOXTabGen_lutmem_0_q;
    memoryC0_uid189_atanXOXTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 31,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 31,
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
        init_file => "fp_atan_s5_memoryC0_uid189_atanXOXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid189_atanXOXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid189_atanXOXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid189_atanXOXTabGen_lutmem_iq,
        address_a => memoryC0_uid189_atanXOXTabGen_lutmem_aa,
        data_a => memoryC0_uid189_atanXOXTabGen_lutmem_ia
    );
    memoryC0_uid189_atanXOXTabGen_lutmem_reset0 <= areset;
        memoryC0_uid189_atanXOXTabGen_lutmem_q <= memoryC0_uid189_atanXOXTabGen_lutmem_iq(30 downto 0);

	--reg_memoryC0_uid189_atanXOXTabGen_lutmem_0_to_sumAHighB_uid202_atanXOXPolyEval_0(REG,300)@25
    reg_memoryC0_uid189_atanXOXTabGen_lutmem_0_to_sumAHighB_uid202_atanXOXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid189_atanXOXTabGen_lutmem_0_to_sumAHighB_uid202_atanXOXPolyEval_0_q <= "0000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid189_atanXOXTabGen_lutmem_0_to_sumAHighB_uid202_atanXOXPolyEval_0_q <= memoryC0_uid189_atanXOXTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid202_atanXOXPolyEval(ADD,201)@26
    sumAHighB_uid202_atanXOXPolyEval_a <= STD_LOGIC_VECTOR((31 downto 31 => reg_memoryC0_uid189_atanXOXTabGen_lutmem_0_to_sumAHighB_uid202_atanXOXPolyEval_0_q(30)) & reg_memoryC0_uid189_atanXOXTabGen_lutmem_0_to_sumAHighB_uid202_atanXOXPolyEval_0_q);
    sumAHighB_uid202_atanXOXPolyEval_b <= STD_LOGIC_VECTOR((31 downto 22 => highBBits_uid201_atanXOXPolyEval_b(21)) & highBBits_uid201_atanXOXPolyEval_b);
            sumAHighB_uid202_atanXOXPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid202_atanXOXPolyEval_a) + SIGNED(sumAHighB_uid202_atanXOXPolyEval_b));
    sumAHighB_uid202_atanXOXPolyEval_q <= sumAHighB_uid202_atanXOXPolyEval_o(31 downto 0);


	--lowRangeB_uid200_atanXOXPolyEval(BITSELECT,199)@26
    lowRangeB_uid200_atanXOXPolyEval_in <= prodXYTruncFR_uid254_pT2_uid199_atanXOXPolyEval_b(1 downto 0);
    lowRangeB_uid200_atanXOXPolyEval_b <= lowRangeB_uid200_atanXOXPolyEval_in(1 downto 0);

	--s2_uid200_uid203_atanXOXPolyEval(BITJOIN,202)@26
    s2_uid200_uid203_atanXOXPolyEval_q <= sumAHighB_uid202_atanXOXPolyEval_q & lowRangeB_uid200_atanXOXPolyEval_b;

	--fxpAtanXOXRes_uid69_fpArctanXTest(BITSELECT,68)@26
    fxpAtanXOXRes_uid69_fpArctanXTest_in <= s2_uid200_uid203_atanXOXPolyEval_q(31 downto 0);
    fxpAtanXOXRes_uid69_fpArctanXTest_b <= fxpAtanXOXRes_uid69_fpArctanXTest_in(31 downto 5);

	--reg_fxpAtanXOXRes_uid69_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_1(REG,302)@26
    reg_fxpAtanXOXRes_uid69_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpAtanXOXRes_uid69_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpAtanXOXRes_uid69_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_1_q <= fxpAtanXOXRes_uid69_fpArctanXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_nor(LOGICAL,663)
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_nor_b <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_sticky_ena_q;
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_nor_q <= not (ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_nor_a or ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_nor_b);

	--ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_mem_top(CONSTANT,659)
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_mem_top_q <= "01010";

	--ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmp(LOGICAL,660)
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmp_a <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_mem_top_q;
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdmux_q);
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmp_q <= "1" when ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmp_a = ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmp_b else "0";

	--ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmpReg(REG,661)
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmpReg_q <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_sticky_ena(REG,664)
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_nor_q = "1") THEN
                ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_sticky_ena_q <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_enaAnd(LOGICAL,665)
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_enaAnd_a <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_sticky_ena_q;
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_enaAnd_b <= en;
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_enaAnd_q <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_enaAnd_a and ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_enaAnd_b;

	--reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0(REG,301)@13
    reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q <= oFracU_uid52_uid52_fpArctanXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_inputreg(DELAY,653)
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q, xout => ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt(COUNTER,655)
    -- every=1, low=0, high=10, step=1, init=1
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_i = 9 THEN
                      ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_i <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_i - 10;
                    ELSE
                        ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_i <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_i,4));


	--ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdreg(REG,656)
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdreg_q <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdmux(MUX,657)
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdmux_s <= en;
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdmux: PROCESS (ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdmux_s, ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdreg_q, ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdmux_q <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdmux_q <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem(DUALMEM,654)
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_ia <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_inputreg_q;
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_aa <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdreg_q;
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_ab <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_rdmux_q;
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_iq,
        address_a => ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_aa,
        data_a => ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_ia
    );
    ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_reset0 <= areset;
        ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_q <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_iq(23 downto 0);

	--mulXAtanXOXRes_uid70_fpArctanXTest(MULT,69)@27
    mulXAtanXOXRes_uid70_fpArctanXTest_pr <= UNSIGNED(mulXAtanXOXRes_uid70_fpArctanXTest_a) * UNSIGNED(mulXAtanXOXRes_uid70_fpArctanXTest_b);
    mulXAtanXOXRes_uid70_fpArctanXTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid70_fpArctanXTest_a <= (others => '0');
            mulXAtanXOXRes_uid70_fpArctanXTest_b <= (others => '0');
            mulXAtanXOXRes_uid70_fpArctanXTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mulXAtanXOXRes_uid70_fpArctanXTest_a <= ld_reg_oFracU_uid52_uid52_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_0_q_to_mulXAtanXOXRes_uid70_fpArctanXTest_a_replace_mem_q;
                mulXAtanXOXRes_uid70_fpArctanXTest_b <= reg_fxpAtanXOXRes_uid69_fpArctanXTest_0_to_mulXAtanXOXRes_uid70_fpArctanXTest_1_q;
                mulXAtanXOXRes_uid70_fpArctanXTest_s1 <= STD_LOGIC_VECTOR(mulXAtanXOXRes_uid70_fpArctanXTest_pr);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid70_fpArctanXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid70_fpArctanXTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mulXAtanXOXRes_uid70_fpArctanXTest_q <= mulXAtanXOXRes_uid70_fpArctanXTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normBit_uid71_fpArctanXTest(BITSELECT,70)@30
    normBit_uid71_fpArctanXTest_in <= mulXAtanXOXRes_uid70_fpArctanXTest_q(49 downto 0);
    normBit_uid71_fpArctanXTest_b <= normBit_uid71_fpArctanXTest_in(49 downto 49);

	--InvNormBit_uid75_fpArctanXTest(LOGICAL,74)@30
    InvNormBit_uid75_fpArctanXTest_a <= normBit_uid71_fpArctanXTest_b;
    InvNormBit_uid75_fpArctanXTest_q <= not InvNormBit_uid75_fpArctanXTest_a;

	--ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_nor(LOGICAL,676)
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_nor_b <= ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_sticky_ena_q;
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_nor_q <= not (ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_nor_a or ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_nor_b);

	--ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_mem_top(CONSTANT,672)
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_mem_top_q <= "01111";

	--ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmp(LOGICAL,673)
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmp_a <= ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_mem_top_q;
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdmux_q);
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmp_q <= "1" when ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmp_a = ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmp_b else "0";

	--ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmpReg(REG,674)
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmpReg_q <= ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_sticky_ena(REG,677)
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_nor_q = "1") THEN
                ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_sticky_ena_q <= ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_enaAnd(LOGICAL,678)
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_enaAnd_a <= ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_sticky_ena_q;
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_enaAnd_b <= en;
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_enaAnd_q <= ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_enaAnd_a and ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_enaAnd_b;

	--ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_inputreg(DELAY,666)
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expU_uid50_fpArctanXTest_b, xout => ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdcnt(COUNTER,668)
    -- every=1, low=0, high=15, step=1, init=1
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdcnt_i <= ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdcnt_i,4));


	--ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdreg(REG,669)
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdreg_q <= ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdmux(MUX,670)
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdmux_s <= en;
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdmux: PROCESS (ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdmux_s, ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdreg_q, ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdmux_q <= ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdreg_q;
                  WHEN "1" => ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdmux_q <= ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem(DUALMEM,667)
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_ia <= ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_inputreg_q;
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_aa <= ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdreg_q;
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_ab <= ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_rdmux_q;
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 8,
        widthad_b => 4,
        numwords_b => 16,
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
        clocken1 => ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_iq,
        address_a => ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_aa,
        data_a => ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_ia
    );
    ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_reset0 <= areset;
        ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_q <= ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_iq(7 downto 0);

	--expRPath3Ext_uid76_fpArctanXTest(SUB,75)@30
    expRPath3Ext_uid76_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & ld_expU_uid50_fpArctanXTest_b_to_expRPath3Ext_uid76_fpArctanXTest_a_replace_mem_q);
    expRPath3Ext_uid76_fpArctanXTest_b <= STD_LOGIC_VECTOR("00000000" & InvNormBit_uid75_fpArctanXTest_q);
            expRPath3Ext_uid76_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRPath3Ext_uid76_fpArctanXTest_a) - UNSIGNED(expRPath3Ext_uid76_fpArctanXTest_b));
    expRPath3Ext_uid76_fpArctanXTest_q <= expRPath3Ext_uid76_fpArctanXTest_o(8 downto 0);


	--fracRPath3High_uid72_fpArctanXTest(BITSELECT,71)@30
    fracRPath3High_uid72_fpArctanXTest_in <= mulXAtanXOXRes_uid70_fpArctanXTest_q(48 downto 0);
    fracRPath3High_uid72_fpArctanXTest_b <= fracRPath3High_uid72_fpArctanXTest_in(48 downto 25);

	--fracRPath3Low_uid73_fpArctanXTest(BITSELECT,72)@30
    fracRPath3Low_uid73_fpArctanXTest_in <= mulXAtanXOXRes_uid70_fpArctanXTest_q(47 downto 0);
    fracRPath3Low_uid73_fpArctanXTest_b <= fracRPath3Low_uid73_fpArctanXTest_in(47 downto 24);

	--fracRPath3Pre_uid74_fpArctanXTest(MUX,73)@30
    fracRPath3Pre_uid74_fpArctanXTest_s <= normBit_uid71_fpArctanXTest_b;
    fracRPath3Pre_uid74_fpArctanXTest: PROCESS (fracRPath3Pre_uid74_fpArctanXTest_s, en, fracRPath3Low_uid73_fpArctanXTest_b, fracRPath3High_uid72_fpArctanXTest_b)
    BEGIN
            CASE fracRPath3Pre_uid74_fpArctanXTest_s IS
                  WHEN "0" => fracRPath3Pre_uid74_fpArctanXTest_q <= fracRPath3Low_uid73_fpArctanXTest_b;
                  WHEN "1" => fracRPath3Pre_uid74_fpArctanXTest_q <= fracRPath3High_uid72_fpArctanXTest_b;
                  WHEN OTHERS => fracRPath3Pre_uid74_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracPreRnd_uid77_fpArctanXTest(BITJOIN,76)@30
    expFracPreRnd_uid77_fpArctanXTest_q <= expRPath3Ext_uid76_fpArctanXTest_q & fracRPath3Pre_uid74_fpArctanXTest_q;

	--reg_expFracPreRnd_uid77_fpArctanXTest_0_to_expfracRPath3PostRnd_uid78_fpArctanXTest_0(REG,310)@30
    reg_expFracPreRnd_uid77_fpArctanXTest_0_to_expfracRPath3PostRnd_uid78_fpArctanXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracPreRnd_uid77_fpArctanXTest_0_to_expfracRPath3PostRnd_uid78_fpArctanXTest_0_q <= "000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracPreRnd_uid77_fpArctanXTest_0_to_expfracRPath3PostRnd_uid78_fpArctanXTest_0_q <= expFracPreRnd_uid77_fpArctanXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expfracRPath3PostRnd_uid78_fpArctanXTest(ADD,77)@31
    expfracRPath3PostRnd_uid78_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & reg_expFracPreRnd_uid77_fpArctanXTest_0_to_expfracRPath3PostRnd_uid78_fpArctanXTest_0_q);
    expfracRPath3PostRnd_uid78_fpArctanXTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000" & VCC_q);
            expfracRPath3PostRnd_uid78_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expfracRPath3PostRnd_uid78_fpArctanXTest_a) + UNSIGNED(expfracRPath3PostRnd_uid78_fpArctanXTest_b));
    expfracRPath3PostRnd_uid78_fpArctanXTest_q <= expfracRPath3PostRnd_uid78_fpArctanXTest_o(33 downto 0);


	--expRPath3_uid80_fpArctanXTest(BITSELECT,79)@31
    expRPath3_uid80_fpArctanXTest_in <= expfracRPath3PostRnd_uid78_fpArctanXTest_q(31 downto 0);
    expRPath3_uid80_fpArctanXTest_b <= expRPath3_uid80_fpArctanXTest_in(31 downto 24);

	--ld_expRPath3_uid80_fpArctanXTest_b_to_reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_a_inputreg(DELAY,833)
    ld_expRPath3_uid80_fpArctanXTest_b_to_reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPath3_uid80_fpArctanXTest_b, xout => ld_expRPath3_uid80_fpArctanXTest_b_to_reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPath3_uid80_fpArctanXTest_b_to_reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_a(DELAY,612)@31
    ld_expRPath3_uid80_fpArctanXTest_b_to_reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => ld_expRPath3_uid80_fpArctanXTest_b_to_reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_a_inputreg_q, xout => ld_expRPath3_uid80_fpArctanXTest_b_to_reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4(REG,317)@35
    reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_q <= ld_expRPath3_uid80_fpArctanXTest_b_to_reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_a_q;
            END IF;
        END IF;
    END PROCESS;


	--RightShiftStage124dto1_uid228_fxpOp2Path2_uid87_fpArctanXTest(BITSELECT,227)@33
    RightShiftStage124dto1_uid228_fxpOp2Path2_uid87_fpArctanXTest_in <= rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_q;
    RightShiftStage124dto1_uid228_fxpOp2Path2_uid87_fpArctanXTest_b <= RightShiftStage124dto1_uid228_fxpOp2Path2_uid87_fpArctanXTest_in(24 downto 1);

	--rightShiftStage2Idx1_uid230_fxpOp2Path2_uid87_fpArctanXTest(BITJOIN,229)@33
    rightShiftStage2Idx1_uid230_fxpOp2Path2_uid87_fpArctanXTest_q <= GND_q & RightShiftStage124dto1_uid228_fxpOp2Path2_uid87_fpArctanXTest_b;

	--rightShiftStage1Idx3Pad6_uid224_fxpOp2Path2_uid87_fpArctanXTest(CONSTANT,223)
    rightShiftStage1Idx3Pad6_uid224_fxpOp2Path2_uid87_fpArctanXTest_q <= "000000";

	--rightShiftStage0Idx3Pad24_uid213_fxpOp2Path2_uid87_fpArctanXTest(CONSTANT,212)
    rightShiftStage0Idx3Pad24_uid213_fxpOp2Path2_uid87_fpArctanXTest_q <= "000000000000000000000000";

	--X24dto24_uid212_fxpOp2Path2_uid87_fpArctanXTest(BITSELECT,211)@32
    X24dto24_uid212_fxpOp2Path2_uid87_fpArctanXTest_in <= oFracRPath2_uid85_uid85_fpArctanXTest_q;
    X24dto24_uid212_fxpOp2Path2_uid87_fpArctanXTest_b <= X24dto24_uid212_fxpOp2Path2_uid87_fpArctanXTest_in(24 downto 24);

	--rightShiftStage0Idx3_uid214_fxpOp2Path2_uid87_fpArctanXTest(BITJOIN,213)@32
    rightShiftStage0Idx3_uid214_fxpOp2Path2_uid87_fpArctanXTest_q <= rightShiftStage0Idx3Pad24_uid213_fxpOp2Path2_uid87_fpArctanXTest_q & X24dto24_uid212_fxpOp2Path2_uid87_fpArctanXTest_b;

	--rightShiftStage0Idx2Pad16_uid210_fxpOp2Path2_uid87_fpArctanXTest(CONSTANT,209)
    rightShiftStage0Idx2Pad16_uid210_fxpOp2Path2_uid87_fpArctanXTest_q <= "0000000000000000";

	--X24dto16_uid209_fxpOp2Path2_uid87_fpArctanXTest(BITSELECT,208)@32
    X24dto16_uid209_fxpOp2Path2_uid87_fpArctanXTest_in <= oFracRPath2_uid85_uid85_fpArctanXTest_q;
    X24dto16_uid209_fxpOp2Path2_uid87_fpArctanXTest_b <= X24dto16_uid209_fxpOp2Path2_uid87_fpArctanXTest_in(24 downto 16);

	--rightShiftStage0Idx2_uid211_fxpOp2Path2_uid87_fpArctanXTest(BITJOIN,210)@32
    rightShiftStage0Idx2_uid211_fxpOp2Path2_uid87_fpArctanXTest_q <= rightShiftStage0Idx2Pad16_uid210_fxpOp2Path2_uid87_fpArctanXTest_q & X24dto16_uid209_fxpOp2Path2_uid87_fpArctanXTest_b;

	--X24dto8_uid206_fxpOp2Path2_uid87_fpArctanXTest(BITSELECT,205)@32
    X24dto8_uid206_fxpOp2Path2_uid87_fpArctanXTest_in <= oFracRPath2_uid85_uid85_fpArctanXTest_q;
    X24dto8_uid206_fxpOp2Path2_uid87_fpArctanXTest_b <= X24dto8_uid206_fxpOp2Path2_uid87_fpArctanXTest_in(24 downto 8);

	--rightShiftStage0Idx1_uid208_fxpOp2Path2_uid87_fpArctanXTest(BITJOIN,207)@32
    rightShiftStage0Idx1_uid208_fxpOp2Path2_uid87_fpArctanXTest_q <= cstAllZWE_uid12_fpArctanXTest_q & X24dto8_uid206_fxpOp2Path2_uid87_fpArctanXTest_b;

	--ld_fracRPath3Pre_uid74_fpArctanXTest_q_to_oFracRPath2_uid85_uid85_fpArctanXTest_a(DELAY,382)@30
    ld_fracRPath3Pre_uid74_fpArctanXTest_q_to_oFracRPath2_uid85_uid85_fpArctanXTest_a : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => fracRPath3Pre_uid74_fpArctanXTest_q, xout => ld_fracRPath3Pre_uid74_fpArctanXTest_q_to_oFracRPath2_uid85_uid85_fpArctanXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--oFracRPath2_uid85_uid85_fpArctanXTest(BITJOIN,84)@32
    oFracRPath2_uid85_uid85_fpArctanXTest_q <= VCC_q & ld_fracRPath3Pre_uid74_fpArctanXTest_q_to_oFracRPath2_uid85_uid85_fpArctanXTest_a_q;

	--cstWFP2_uid16_fpArctanXTest(CONSTANT,15)
    cstWFP2_uid16_fpArctanXTest_q <= "00011001";

	--reg_expRPath3Ext_uid76_fpArctanXTest_0_to_shiftValPath2PreSub_uid81_fpArctanXTest_1(REG,303)@30
    reg_expRPath3Ext_uid76_fpArctanXTest_0_to_shiftValPath2PreSub_uid81_fpArctanXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPath3Ext_uid76_fpArctanXTest_0_to_shiftValPath2PreSub_uid81_fpArctanXTest_1_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPath3Ext_uid76_fpArctanXTest_0_to_shiftValPath2PreSub_uid81_fpArctanXTest_1_q <= expRPath3Ext_uid76_fpArctanXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--shiftValPath2PreSub_uid81_fpArctanXTest(SUB,80)@31
    shiftValPath2PreSub_uid81_fpArctanXTest_a <= STD_LOGIC_VECTOR('0' & "00" & cstBias_uid13_fpArctanXTest_q);
    shiftValPath2PreSub_uid81_fpArctanXTest_b <= STD_LOGIC_VECTOR((10 downto 9 => reg_expRPath3Ext_uid76_fpArctanXTest_0_to_shiftValPath2PreSub_uid81_fpArctanXTest_1_q(8)) & reg_expRPath3Ext_uid76_fpArctanXTest_0_to_shiftValPath2PreSub_uid81_fpArctanXTest_1_q);
            shiftValPath2PreSub_uid81_fpArctanXTest_o <= STD_LOGIC_VECTOR(SIGNED(shiftValPath2PreSub_uid81_fpArctanXTest_a) - SIGNED(shiftValPath2PreSub_uid81_fpArctanXTest_b));
    shiftValPath2PreSub_uid81_fpArctanXTest_q <= shiftValPath2PreSub_uid81_fpArctanXTest_o(9 downto 0);


	--shiftValPath2PreSubR_uid83_fpArctanXTest(BITSELECT,82)@31
    shiftValPath2PreSubR_uid83_fpArctanXTest_in <= shiftValPath2PreSub_uid81_fpArctanXTest_q(7 downto 0);
    shiftValPath2PreSubR_uid83_fpArctanXTest_b <= shiftValPath2PreSubR_uid83_fpArctanXTest_in(7 downto 0);

	--cstBiasMWF_uid15_fpArctanXTest(CONSTANT,14)
    cstBiasMWF_uid15_fpArctanXTest_q <= "01101000";

	--shiftOut_uid82_fpArctanXTest(COMPARE,81)@13
    shiftOut_uid82_fpArctanXTest_cin <= GND_q;
    shiftOut_uid82_fpArctanXTest_a <= STD_LOGIC_VECTOR("00" & reg_expU_uid50_fpArctanXTest_0_to_atanUIsU_uid54_fpArctanXTest_1_q) & '0';
    shiftOut_uid82_fpArctanXTest_b <= STD_LOGIC_VECTOR("00" & cstBiasMWF_uid15_fpArctanXTest_q) & shiftOut_uid82_fpArctanXTest_cin(0);
            shiftOut_uid82_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftOut_uid82_fpArctanXTest_a) - UNSIGNED(shiftOut_uid82_fpArctanXTest_b));
    shiftOut_uid82_fpArctanXTest_c(0) <= shiftOut_uid82_fpArctanXTest_o(10);


	--ld_shiftOut_uid82_fpArctanXTest_c_to_sValPostSOut_uid84_fpArctanXTest_b(DELAY,380)@13
    ld_shiftOut_uid82_fpArctanXTest_c_to_sValPostSOut_uid84_fpArctanXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 18 )
    PORT MAP ( xin => shiftOut_uid82_fpArctanXTest_c, xout => ld_shiftOut_uid82_fpArctanXTest_c_to_sValPostSOut_uid84_fpArctanXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--sValPostSOut_uid84_fpArctanXTest(MUX,83)@31
    sValPostSOut_uid84_fpArctanXTest_s <= ld_shiftOut_uid82_fpArctanXTest_c_to_sValPostSOut_uid84_fpArctanXTest_b_q;
    sValPostSOut_uid84_fpArctanXTest: PROCESS (sValPostSOut_uid84_fpArctanXTest_s, en, shiftValPath2PreSubR_uid83_fpArctanXTest_b, cstWFP2_uid16_fpArctanXTest_q)
    BEGIN
            CASE sValPostSOut_uid84_fpArctanXTest_s IS
                  WHEN "0" => sValPostSOut_uid84_fpArctanXTest_q <= shiftValPath2PreSubR_uid83_fpArctanXTest_b;
                  WHEN "1" => sValPostSOut_uid84_fpArctanXTest_q <= cstWFP2_uid16_fpArctanXTest_q;
                  WHEN OTHERS => sValPostSOut_uid84_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sValPostSOutR_uid86_fpArctanXTest(BITSELECT,85)@31
    sValPostSOutR_uid86_fpArctanXTest_in <= sValPostSOut_uid84_fpArctanXTest_q(4 downto 0);
    sValPostSOutR_uid86_fpArctanXTest_b <= sValPostSOutR_uid86_fpArctanXTest_in(4 downto 0);

	--rightShiftStageSel4Dto3_uid215_fxpOp2Path2_uid87_fpArctanXTest(BITSELECT,214)@31
    rightShiftStageSel4Dto3_uid215_fxpOp2Path2_uid87_fpArctanXTest_in <= sValPostSOutR_uid86_fpArctanXTest_b;
    rightShiftStageSel4Dto3_uid215_fxpOp2Path2_uid87_fpArctanXTest_b <= rightShiftStageSel4Dto3_uid215_fxpOp2Path2_uid87_fpArctanXTest_in(4 downto 3);

	--reg_rightShiftStageSel4Dto3_uid215_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_1(REG,304)@31
    reg_rightShiftStageSel4Dto3_uid215_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel4Dto3_uid215_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel4Dto3_uid215_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_1_q <= rightShiftStageSel4Dto3_uid215_fxpOp2Path2_uid87_fpArctanXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest(MUX,215)@32
    rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_s <= reg_rightShiftStageSel4Dto3_uid215_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_1_q;
    rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest: PROCESS (rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_s, en, oFracRPath2_uid85_uid85_fpArctanXTest_q, rightShiftStage0Idx1_uid208_fxpOp2Path2_uid87_fpArctanXTest_q, rightShiftStage0Idx2_uid211_fxpOp2Path2_uid87_fpArctanXTest_q, rightShiftStage0Idx3_uid214_fxpOp2Path2_uid87_fpArctanXTest_q)
    BEGIN
            CASE rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_s IS
                  WHEN "00" => rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_q <= oFracRPath2_uid85_uid85_fpArctanXTest_q;
                  WHEN "01" => rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_q <= rightShiftStage0Idx1_uid208_fxpOp2Path2_uid87_fpArctanXTest_q;
                  WHEN "10" => rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_q <= rightShiftStage0Idx2_uid211_fxpOp2Path2_uid87_fpArctanXTest_q;
                  WHEN "11" => rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_q <= rightShiftStage0Idx3_uid214_fxpOp2Path2_uid87_fpArctanXTest_q;
                  WHEN OTHERS => rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage024dto6_uid223_fxpOp2Path2_uid87_fpArctanXTest(BITSELECT,222)@32
    RightShiftStage024dto6_uid223_fxpOp2Path2_uid87_fpArctanXTest_in <= rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_q;
    RightShiftStage024dto6_uid223_fxpOp2Path2_uid87_fpArctanXTest_b <= RightShiftStage024dto6_uid223_fxpOp2Path2_uid87_fpArctanXTest_in(24 downto 6);

	--ld_RightShiftStage024dto6_uid223_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx3_uid225_fxpOp2Path2_uid87_fpArctanXTest_a(DELAY,518)@32
    ld_RightShiftStage024dto6_uid223_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx3_uid225_fxpOp2Path2_uid87_fpArctanXTest_a : dspba_delay
    GENERIC MAP ( width => 19, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto6_uid223_fxpOp2Path2_uid87_fpArctanXTest_b, xout => ld_RightShiftStage024dto6_uid223_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx3_uid225_fxpOp2Path2_uid87_fpArctanXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid225_fxpOp2Path2_uid87_fpArctanXTest(BITJOIN,224)@33
    rightShiftStage1Idx3_uid225_fxpOp2Path2_uid87_fpArctanXTest_q <= rightShiftStage1Idx3Pad6_uid224_fxpOp2Path2_uid87_fpArctanXTest_q & ld_RightShiftStage024dto6_uid223_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx3_uid225_fxpOp2Path2_uid87_fpArctanXTest_a_q;

	--RightShiftStage024dto4_uid220_fxpOp2Path2_uid87_fpArctanXTest(BITSELECT,219)@32
    RightShiftStage024dto4_uid220_fxpOp2Path2_uid87_fpArctanXTest_in <= rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_q;
    RightShiftStage024dto4_uid220_fxpOp2Path2_uid87_fpArctanXTest_b <= RightShiftStage024dto4_uid220_fxpOp2Path2_uid87_fpArctanXTest_in(24 downto 4);

	--ld_RightShiftStage024dto4_uid220_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx2_uid222_fxpOp2Path2_uid87_fpArctanXTest_a(DELAY,516)@32
    ld_RightShiftStage024dto4_uid220_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx2_uid222_fxpOp2Path2_uid87_fpArctanXTest_a : dspba_delay
    GENERIC MAP ( width => 21, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto4_uid220_fxpOp2Path2_uid87_fpArctanXTest_b, xout => ld_RightShiftStage024dto4_uid220_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx2_uid222_fxpOp2Path2_uid87_fpArctanXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid222_fxpOp2Path2_uid87_fpArctanXTest(BITJOIN,221)@33
    rightShiftStage1Idx2_uid222_fxpOp2Path2_uid87_fpArctanXTest_q <= leftShiftStage0Idx1Pad4_uid166_fxpU_uid63_fpArctanXTest_q & ld_RightShiftStage024dto4_uid220_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx2_uid222_fxpOp2Path2_uid87_fpArctanXTest_a_q;

	--RightShiftStage024dto2_uid217_fxpOp2Path2_uid87_fpArctanXTest(BITSELECT,216)@32
    RightShiftStage024dto2_uid217_fxpOp2Path2_uid87_fpArctanXTest_in <= rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_q;
    RightShiftStage024dto2_uid217_fxpOp2Path2_uid87_fpArctanXTest_b <= RightShiftStage024dto2_uid217_fxpOp2Path2_uid87_fpArctanXTest_in(24 downto 2);

	--ld_RightShiftStage024dto2_uid217_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx1_uid219_fxpOp2Path2_uid87_fpArctanXTest_a(DELAY,514)@32
    ld_RightShiftStage024dto2_uid217_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx1_uid219_fxpOp2Path2_uid87_fpArctanXTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto2_uid217_fxpOp2Path2_uid87_fpArctanXTest_b, xout => ld_RightShiftStage024dto2_uid217_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx1_uid219_fxpOp2Path2_uid87_fpArctanXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid219_fxpOp2Path2_uid87_fpArctanXTest(BITJOIN,218)@33
    rightShiftStage1Idx1_uid219_fxpOp2Path2_uid87_fpArctanXTest_q <= leftShiftStage1Idx2Pad2_uid180_fxpU_uid63_fpArctanXTest_q & ld_RightShiftStage024dto2_uid217_fxpOp2Path2_uid87_fpArctanXTest_b_to_rightShiftStage1Idx1_uid219_fxpOp2Path2_uid87_fpArctanXTest_a_q;

	--reg_rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_2(REG,306)@32
    reg_rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_2_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_2_q <= rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest(BITSELECT,225)@31
    rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_in <= sValPostSOutR_uid86_fpArctanXTest_b(2 downto 0);
    rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_b <= rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_in(2 downto 1);

	--reg_rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_1(REG,305)@31
    reg_rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_1_q <= rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_1_q_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_b(DELAY,520)@32
    ld_reg_rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_1_q_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_1_q, xout => ld_reg_rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_1_q_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest(MUX,226)@33
    rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_s <= ld_reg_rightShiftStageSel2Dto1_uid226_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_1_q_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_b_q;
    rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest: PROCESS (rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_s, en, reg_rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_2_q, rightShiftStage1Idx1_uid219_fxpOp2Path2_uid87_fpArctanXTest_q, rightShiftStage1Idx2_uid222_fxpOp2Path2_uid87_fpArctanXTest_q, rightShiftStage1Idx3_uid225_fxpOp2Path2_uid87_fpArctanXTest_q)
    BEGIN
            CASE rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_s IS
                  WHEN "00" => rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_q <= reg_rightShiftStage0_uid216_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_2_q;
                  WHEN "01" => rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_q <= rightShiftStage1Idx1_uid219_fxpOp2Path2_uid87_fpArctanXTest_q;
                  WHEN "10" => rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_q <= rightShiftStage1Idx2_uid222_fxpOp2Path2_uid87_fpArctanXTest_q;
                  WHEN "11" => rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_q <= rightShiftStage1Idx3_uid225_fxpOp2Path2_uid87_fpArctanXTest_q;
                  WHEN OTHERS => rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest(BITSELECT,230)@31
    rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_in <= sValPostSOutR_uid86_fpArctanXTest_b(0 downto 0);
    rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_b <= rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_in(0 downto 0);

	--ld_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_b_to_reg_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_1_a(DELAY,602)@31
    ld_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_b_to_reg_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_b, xout => ld_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_b_to_reg_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_1(REG,307)@32
    reg_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_1_q <= ld_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_b_to_reg_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest(MUX,231)@33
    rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_s <= reg_rightShiftStageSel0Dto0_uid231_fxpOp2Path2_uid87_fpArctanXTest_0_to_rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_1_q;
    rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest: PROCESS (rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_s, en, rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_q, rightShiftStage2Idx1_uid230_fxpOp2Path2_uid87_fpArctanXTest_q)
    BEGIN
            CASE rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_s IS
                  WHEN "0" => rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_q <= rightShiftStage1_uid227_fxpOp2Path2_uid87_fpArctanXTest_q;
                  WHEN "1" => rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_q <= rightShiftStage2Idx1_uid230_fxpOp2Path2_uid87_fpArctanXTest_q;
                  WHEN OTHERS => rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--pad_fxpOp2Path2_uid87_uid88_fpArctanXTest(BITJOIN,87)@33
    pad_fxpOp2Path2_uid87_uid88_fpArctanXTest_q <= rightShiftStage2_uid232_fxpOp2Path2_uid87_fpArctanXTest_q & GND_q;

	--reg_pad_fxpOp2Path2_uid87_uid88_fpArctanXTest_0_to_path2Diff_uid88_fpArctanXTest_1(REG,308)@33
    reg_pad_fxpOp2Path2_uid87_uid88_fpArctanXTest_0_to_path2Diff_uid88_fpArctanXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_fxpOp2Path2_uid87_uid88_fpArctanXTest_0_to_path2Diff_uid88_fpArctanXTest_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_fxpOp2Path2_uid87_uid88_fpArctanXTest_0_to_path2Diff_uid88_fpArctanXTest_1_q <= pad_fxpOp2Path2_uid87_uid88_fpArctanXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--path2Diff_uid88_fpArctanXTest(SUB,88)@34
    path2Diff_uid88_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & piO2_uid37_fpArctanXTest_q);
    path2Diff_uid88_fpArctanXTest_b <= STD_LOGIC_VECTOR("0" & reg_pad_fxpOp2Path2_uid87_uid88_fpArctanXTest_0_to_path2Diff_uid88_fpArctanXTest_1_q);
            path2Diff_uid88_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path2Diff_uid88_fpArctanXTest_a) - UNSIGNED(path2Diff_uid88_fpArctanXTest_b));
    path2Diff_uid88_fpArctanXTest_q <= path2Diff_uid88_fpArctanXTest_o(26 downto 0);


	--normBitPath2Diff_uid90_fpArctanXTest(BITSELECT,89)@34
    normBitPath2Diff_uid90_fpArctanXTest_in <= path2Diff_uid88_fpArctanXTest_q(25 downto 0);
    normBitPath2Diff_uid90_fpArctanXTest_b <= normBitPath2Diff_uid90_fpArctanXTest_in(25 downto 25);

	--expRPath2_uid94_fpArctanXTest(MUX,93)@34
    expRPath2_uid94_fpArctanXTest_s <= normBitPath2Diff_uid90_fpArctanXTest_b;
    expRPath2_uid94_fpArctanXTest: PROCESS (expRPath2_uid94_fpArctanXTest_s, en, cstBiasM1_uid14_fpArctanXTest_q, cstBias_uid13_fpArctanXTest_q)
    BEGIN
            CASE expRPath2_uid94_fpArctanXTest_s IS
                  WHEN "0" => expRPath2_uid94_fpArctanXTest_q <= cstBiasM1_uid14_fpArctanXTest_q;
                  WHEN "1" => expRPath2_uid94_fpArctanXTest_q <= cstBias_uid13_fpArctanXTest_q;
                  WHEN OTHERS => expRPath2_uid94_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--path2DiffHigh_uid91_fpArctanXTest(BITSELECT,90)@34
    path2DiffHigh_uid91_fpArctanXTest_in <= path2Diff_uid88_fpArctanXTest_q(24 downto 0);
    path2DiffHigh_uid91_fpArctanXTest_b <= path2DiffHigh_uid91_fpArctanXTest_in(24 downto 1);

	--path2DiffLow_uid92_fpArctanXTest(BITSELECT,91)@34
    path2DiffLow_uid92_fpArctanXTest_in <= path2Diff_uid88_fpArctanXTest_q(23 downto 0);
    path2DiffLow_uid92_fpArctanXTest_b <= path2DiffLow_uid92_fpArctanXTest_in(23 downto 0);

	--fracRPath2_uid93_fpArctanXTest(MUX,92)@34
    fracRPath2_uid93_fpArctanXTest_s <= normBitPath2Diff_uid90_fpArctanXTest_b;
    fracRPath2_uid93_fpArctanXTest: PROCESS (fracRPath2_uid93_fpArctanXTest_s, en, path2DiffLow_uid92_fpArctanXTest_b, path2DiffHigh_uid91_fpArctanXTest_b)
    BEGIN
            CASE fracRPath2_uid93_fpArctanXTest_s IS
                  WHEN "0" => fracRPath2_uid93_fpArctanXTest_q <= path2DiffLow_uid92_fpArctanXTest_b;
                  WHEN "1" => fracRPath2_uid93_fpArctanXTest_q <= path2DiffHigh_uid91_fpArctanXTest_b;
                  WHEN OTHERS => fracRPath2_uid93_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracConc_uid95_uid95_fpArctanXTest(BITJOIN,94)@34
    expFracConc_uid95_uid95_fpArctanXTest_q <= expRPath2_uid94_fpArctanXTest_q & fracRPath2_uid93_fpArctanXTest_q;

	--reg_expFracConc_uid95_uid95_fpArctanXTest_0_to_expFracRPath2PostRnd_uid96_fpArctanXTest_0(REG,309)@34
    reg_expFracConc_uid95_uid95_fpArctanXTest_0_to_expFracRPath2PostRnd_uid96_fpArctanXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracConc_uid95_uid95_fpArctanXTest_0_to_expFracRPath2PostRnd_uid96_fpArctanXTest_0_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracConc_uid95_uid95_fpArctanXTest_0_to_expFracRPath2PostRnd_uid96_fpArctanXTest_0_q <= expFracConc_uid95_uid95_fpArctanXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracRPath2PostRnd_uid96_fpArctanXTest(ADD,95)@35
    expFracRPath2PostRnd_uid96_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & reg_expFracConc_uid95_uid95_fpArctanXTest_0_to_expFracRPath2PostRnd_uid96_fpArctanXTest_0_q);
    expFracRPath2PostRnd_uid96_fpArctanXTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & VCC_q);
            expFracRPath2PostRnd_uid96_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPath2PostRnd_uid96_fpArctanXTest_a) + UNSIGNED(expFracRPath2PostRnd_uid96_fpArctanXTest_b));
    expFracRPath2PostRnd_uid96_fpArctanXTest_q <= expFracRPath2PostRnd_uid96_fpArctanXTest_o(32 downto 0);


	--expRPath2_uid98_fpArctanXTest(BITSELECT,97)@35
    expRPath2_uid98_fpArctanXTest_in <= expFracRPath2PostRnd_uid96_fpArctanXTest_q(31 downto 0);
    expRPath2_uid98_fpArctanXTest_b <= expRPath2_uid98_fpArctanXTest_in(31 downto 24);

	--reg_expRPath2_uid98_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_3(REG,316)@35
    reg_expRPath2_uid98_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPath2_uid98_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPath2_uid98_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_3_q <= expRPath2_uid98_fpArctanXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_nor(LOGICAL,830)
    ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_nor_b <= ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_sticky_ena_q;
    ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_nor_q <= not (ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_nor_a or ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_nor_b);

	--ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_sticky_ena(REG,831)
    ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_nor_q = "1") THEN
                ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_sticky_ena_q <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_enaAnd(LOGICAL,832)
    ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_enaAnd_a <= ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_sticky_ena_q;
    ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_enaAnd_b <= en;
    ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_enaAnd_q <= ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_enaAnd_a and ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_enaAnd_b;

	--ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_inputreg(DELAY,820)
    ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expX_uid6_fpArctanXTest_b, xout => ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem(DUALMEM,821)
    ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_ia <= ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_inputreg_q;
    ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_aa <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdreg_q;
    ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_ab <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_q;
    ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 6,
        numwords_a => 33,
        width_b => 8,
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
        clocken1 => ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_iq,
        address_a => ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_aa,
        data_a => ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_ia
    );
    ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_reset0 <= areset;
        ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_q <= ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_iq(7 downto 0);

	--reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2(REG,315)@35
    reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_q <= ld_expX_uid6_fpArctanXTest_b_to_reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_nor(LOGICAL,779)
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_nor_b <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_sticky_ena_q;
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_nor_q <= not (ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_nor_a or ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_nor_b);

	--ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_mem_top(CONSTANT,775)
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_mem_top_q <= "010010";

	--ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmp(LOGICAL,776)
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmp_a <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_mem_top_q;
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdmux_q);
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmp_q <= "1" when ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmp_a = ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmp_b else "0";

	--ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmpReg(REG,777)
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmpReg_q <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_sticky_ena(REG,780)
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_nor_q = "1") THEN
                ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_sticky_ena_q <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_enaAnd(LOGICAL,781)
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_enaAnd_a <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_sticky_ena_q;
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_enaAnd_b <= en;
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_enaAnd_q <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_enaAnd_a and ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_enaAnd_b;

	--expXIsBias_uid35_fpArctanXTest(LOGICAL,34)@0
    expXIsBias_uid35_fpArctanXTest_a <= expX_uid6_fpArctanXTest_b;
    expXIsBias_uid35_fpArctanXTest_b <= cstBias_uid13_fpArctanXTest_q;
    expXIsBias_uid35_fpArctanXTest_q <= "1" when expXIsBias_uid35_fpArctanXTest_a = expXIsBias_uid35_fpArctanXTest_b else "0";

	--inIsOne_uid36_fpArctanXTest(LOGICAL,35)@0
    inIsOne_uid36_fpArctanXTest_a <= fracXIsZero_uid26_fpArctanXTest_q;
    inIsOne_uid36_fpArctanXTest_b <= expXIsBias_uid35_fpArctanXTest_q;
    inIsOne_uid36_fpArctanXTest_q <= inIsOne_uid36_fpArctanXTest_a and inIsOne_uid36_fpArctanXTest_b;

	--arctanIsConst_uid46_fpArctanXTest(LOGICAL,45)@0
    arctanIsConst_uid46_fpArctanXTest_a <= exc_I_uid27_fpArctanXTest_q;
    arctanIsConst_uid46_fpArctanXTest_b <= inIsOne_uid36_fpArctanXTest_q;
    arctanIsConst_uid46_fpArctanXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            arctanIsConst_uid46_fpArctanXTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            arctanIsConst_uid46_fpArctanXTest_q <= arctanIsConst_uid46_fpArctanXTest_a or arctanIsConst_uid46_fpArctanXTest_b;
        END IF;
        END IF;
    END PROCESS;



	--ld_arctanIsConst_uid46_fpArctanXTest_q_to_pathSelBits_uid99_fpArctanXTest_c(DELAY,400)@1
    ld_arctanIsConst_uid46_fpArctanXTest_q_to_pathSelBits_uid99_fpArctanXTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => arctanIsConst_uid46_fpArctanXTest_q, xout => ld_arctanIsConst_uid46_fpArctanXTest_q_to_pathSelBits_uid99_fpArctanXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--biasMwShift_uid53_fpArctanXTest(CONSTANT,52)
    biasMwShift_uid53_fpArctanXTest_q <= "01110011";

	--atanUIsU_uid54_fpArctanXTest(COMPARE,53)@13
    atanUIsU_uid54_fpArctanXTest_cin <= GND_q;
    atanUIsU_uid54_fpArctanXTest_a <= STD_LOGIC_VECTOR("00" & biasMwShift_uid53_fpArctanXTest_q) & '0';
    atanUIsU_uid54_fpArctanXTest_b <= STD_LOGIC_VECTOR("00" & reg_expU_uid50_fpArctanXTest_0_to_atanUIsU_uid54_fpArctanXTest_1_q) & atanUIsU_uid54_fpArctanXTest_cin(0);
            atanUIsU_uid54_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(atanUIsU_uid54_fpArctanXTest_a) - UNSIGNED(atanUIsU_uid54_fpArctanXTest_b));
    atanUIsU_uid54_fpArctanXTest_n(0) <= not atanUIsU_uid54_fpArctanXTest_o(10);


	--ld_path2_uid47_fpArctanXTest_n_to_pathSelBits_uid99_fpArctanXTest_a(DELAY,398)@0
    ld_path2_uid47_fpArctanXTest_n_to_pathSelBits_uid99_fpArctanXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => path2_uid47_fpArctanXTest_n, xout => ld_path2_uid47_fpArctanXTest_n_to_pathSelBits_uid99_fpArctanXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--pathSelBits_uid99_fpArctanXTest(BITJOIN,98)@13
    pathSelBits_uid99_fpArctanXTest_q <= ld_arctanIsConst_uid46_fpArctanXTest_q_to_pathSelBits_uid99_fpArctanXTest_c_q & atanUIsU_uid54_fpArctanXTest_n & ld_path2_uid47_fpArctanXTest_n_to_pathSelBits_uid99_fpArctanXTest_a_q;

	--ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_inputreg(DELAY,769)
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => pathSelBits_uid99_fpArctanXTest_q, xout => ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt(COUNTER,771)
    -- every=1, low=0, high=18, step=1, init=1
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_i = 17 THEN
                      ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_eq = '1') THEN
                        ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_i <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_i - 18;
                    ELSE
                        ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_i <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_i,5));


	--ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdreg(REG,772)
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdreg_q <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdmux(MUX,773)
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdmux_s <= en;
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdmux: PROCESS (ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdmux_s, ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdreg_q, ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdmux_q <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdreg_q;
                  WHEN "1" => ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdmux_q <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem(DUALMEM,770)
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_ia <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_inputreg_q;
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_aa <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdreg_q;
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_ab <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_rdmux_q;
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 5,
        numwords_a => 19,
        width_b => 3,
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
        clocken1 => ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_iq,
        address_a => ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_aa,
        data_a => ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_ia
    );
    ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_reset0 <= areset;
        ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_q <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_iq(2 downto 0);

	--reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0(REG,282)@34
    reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_q <= ld_pathSelBits_uid99_fpArctanXTest_q_to_reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--fracOutMuxSelEnc_uid100_fpArctanXTest(LOOKUP,99)@35
    fracOutMuxSelEnc_uid100_fpArctanXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracOutMuxSelEnc_uid100_fpArctanXTest_q <= "10";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_pathSelBits_uid99_fpArctanXTest_0_to_fracOutMuxSelEnc_uid100_fpArctanXTest_0_q) IS
                WHEN "000" =>  fracOutMuxSelEnc_uid100_fpArctanXTest_q <= "10";
                WHEN "001" =>  fracOutMuxSelEnc_uid100_fpArctanXTest_q <= "01";
                WHEN "010" =>  fracOutMuxSelEnc_uid100_fpArctanXTest_q <= "00";
                WHEN "011" =>  fracOutMuxSelEnc_uid100_fpArctanXTest_q <= "01";
                WHEN "100" =>  fracOutMuxSelEnc_uid100_fpArctanXTest_q <= "11";
                WHEN "101" =>  fracOutMuxSelEnc_uid100_fpArctanXTest_q <= "11";
                WHEN "110" =>  fracOutMuxSelEnc_uid100_fpArctanXTest_q <= "11";
                WHEN "111" =>  fracOutMuxSelEnc_uid100_fpArctanXTest_q <= "11";
                WHEN OTHERS =>
                    fracOutMuxSelEnc_uid100_fpArctanXTest_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--expRCalc_uid104_fpArctanXTest(MUX,103)@36
    expRCalc_uid104_fpArctanXTest_s <= fracOutMuxSelEnc_uid100_fpArctanXTest_q;
    expRCalc_uid104_fpArctanXTest: PROCESS (expRCalc_uid104_fpArctanXTest_s, en, reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_q, reg_expRPath2_uid98_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_3_q, reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_q, reg_expOutCst_uid103_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_5_q)
    BEGIN
            CASE expRCalc_uid104_fpArctanXTest_s IS
                  WHEN "00" => expRCalc_uid104_fpArctanXTest_q <= reg_expX_uid6_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_2_q;
                  WHEN "01" => expRCalc_uid104_fpArctanXTest_q <= reg_expRPath2_uid98_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_3_q;
                  WHEN "10" => expRCalc_uid104_fpArctanXTest_q <= reg_expRPath3_uid80_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_4_q;
                  WHEN "11" => expRCalc_uid104_fpArctanXTest_q <= reg_expOutCst_uid103_fpArctanXTest_0_to_expRCalc_uid104_fpArctanXTest_5_q;
                  WHEN OTHERS => expRCalc_uid104_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--cstAllZWE_uid12_fpArctanXTest(CONSTANT,11)
    cstAllZWE_uid12_fpArctanXTest_q <= "00000000";

	--ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_nor(LOGICAL,702)
    ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_nor_b <= ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_sticky_ena_q;
    ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_nor_q <= not (ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_nor_a or ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_nor_b);

	--ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_sticky_ena(REG,703)
    ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_nor_q = "1") THEN
                ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_sticky_ena_q <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_enaAnd(LOGICAL,704)
    ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_enaAnd_a <= ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_sticky_ena_q;
    ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_enaAnd_b <= en;
    ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_enaAnd_q <= ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_enaAnd_a and ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_enaAnd_b;

	--ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_inputreg(DELAY,692)
    ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_N_uid29_fpArctanXTest_q, xout => ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem(DUALMEM,693)
    ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_ia <= ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_inputreg_q;
    ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_aa <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdreg_q;
    ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_ab <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_q;
    ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_dmem : altsyncram
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
        clocken1 => ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_iq,
        address_a => ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_aa,
        data_a => ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_ia
    );
    ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_reset0 <= areset;
        ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_q <= ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_iq(0 downto 0);

	--ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_nor(LOGICAL,689)
    ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_nor_b <= ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_sticky_ena_q;
    ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_nor_q <= not (ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_nor_a or ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_nor_b);

	--ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_sticky_ena(REG,690)
    ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_nor_q = "1") THEN
                ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_sticky_ena_q <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_enaAnd(LOGICAL,691)
    ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_enaAnd_a <= ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_sticky_ena_q;
    ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_enaAnd_b <= en;
    ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_enaAnd_q <= ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_enaAnd_a and ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_enaAnd_b;

	--ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_inputreg(DELAY,679)
    ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid22_fpArctanXTest_q, xout => ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem(DUALMEM,680)
    ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_ia <= ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_inputreg_q;
    ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_aa <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdreg_q;
    ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_ab <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_q;
    ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_iq,
        address_a => ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_aa,
        data_a => ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_ia
    );
    ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_reset0 <= areset;
        ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_q <= ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_iq(0 downto 0);

	--excSelBits_uid105_fpArctanXTest(BITJOIN,104)@35
    excSelBits_uid105_fpArctanXTest_q <= ld_exc_N_uid29_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_c_replace_mem_q & GND_q & ld_expXIsZero_uid22_fpArctanXTest_q_to_excSelBits_uid105_fpArctanXTest_a_replace_mem_q;

	--reg_excSelBits_uid105_fpArctanXTest_0_to_outMuxSelEnc_uid106_fpArctanXTest_0(REG,267)@35
    reg_excSelBits_uid105_fpArctanXTest_0_to_outMuxSelEnc_uid106_fpArctanXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excSelBits_uid105_fpArctanXTest_0_to_outMuxSelEnc_uid106_fpArctanXTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excSelBits_uid105_fpArctanXTest_0_to_outMuxSelEnc_uid106_fpArctanXTest_0_q <= excSelBits_uid105_fpArctanXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--outMuxSelEnc_uid106_fpArctanXTest(LOOKUP,105)@36
    outMuxSelEnc_uid106_fpArctanXTest: PROCESS (reg_excSelBits_uid105_fpArctanXTest_0_to_outMuxSelEnc_uid106_fpArctanXTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_excSelBits_uid105_fpArctanXTest_0_to_outMuxSelEnc_uid106_fpArctanXTest_0_q) IS
                WHEN "000" =>  outMuxSelEnc_uid106_fpArctanXTest_q <= "01";
                WHEN "001" =>  outMuxSelEnc_uid106_fpArctanXTest_q <= "00";
                WHEN "010" =>  outMuxSelEnc_uid106_fpArctanXTest_q <= "10";
                WHEN "011" =>  outMuxSelEnc_uid106_fpArctanXTest_q <= "01";
                WHEN "100" =>  outMuxSelEnc_uid106_fpArctanXTest_q <= "11";
                WHEN "101" =>  outMuxSelEnc_uid106_fpArctanXTest_q <= "01";
                WHEN "110" =>  outMuxSelEnc_uid106_fpArctanXTest_q <= "01";
                WHEN "111" =>  outMuxSelEnc_uid106_fpArctanXTest_q <= "01";
                WHEN OTHERS =>
                    outMuxSelEnc_uid106_fpArctanXTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid108_fpArctanXTest(MUX,107)@36
    expRPostExc_uid108_fpArctanXTest_s <= outMuxSelEnc_uid106_fpArctanXTest_q;
    expRPostExc_uid108_fpArctanXTest: PROCESS (expRPostExc_uid108_fpArctanXTest_s, en, cstAllZWE_uid12_fpArctanXTest_q, expRCalc_uid104_fpArctanXTest_q, cstAllOWE_uid9_fpArctanXTest_q, cstAllOWE_uid9_fpArctanXTest_q)
    BEGIN
            CASE expRPostExc_uid108_fpArctanXTest_s IS
                  WHEN "00" => expRPostExc_uid108_fpArctanXTest_q <= cstAllZWE_uid12_fpArctanXTest_q;
                  WHEN "01" => expRPostExc_uid108_fpArctanXTest_q <= expRCalc_uid104_fpArctanXTest_q;
                  WHEN "10" => expRPostExc_uid108_fpArctanXTest_q <= cstAllOWE_uid9_fpArctanXTest_q;
                  WHEN "11" => expRPostExc_uid108_fpArctanXTest_q <= cstAllOWE_uid9_fpArctanXTest_q;
                  WHEN OTHERS => expRPostExc_uid108_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracOutCst_uid101_fpArctanXTest(BITSELECT,100)@35
    fracOutCst_uid101_fpArctanXTest_in <= constOut_uid45_fpArctanXTest_q(22 downto 0);
    fracOutCst_uid101_fpArctanXTest_b <= fracOutCst_uid101_fpArctanXTest_in(22 downto 0);

	--reg_fracOutCst_uid101_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_5(REG,314)@35
    reg_fracOutCst_uid101_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracOutCst_uid101_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_5_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracOutCst_uid101_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_5_q <= fracOutCst_uid101_fpArctanXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_nor(LOGICAL,817)
    ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_nor_b <= ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_sticky_ena_q;
    ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_nor_q <= not (ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_nor_a or ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_nor_b);

	--ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_sticky_ena(REG,818)
    ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_nor_q = "1") THEN
                ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_sticky_ena_q <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_enaAnd(LOGICAL,819)
    ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_enaAnd_a <= ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_sticky_ena_q;
    ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_enaAnd_b <= en;
    ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_enaAnd_q <= ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_enaAnd_a and ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_enaAnd_b;

	--fracRPath3_uid79_fpArctanXTest(BITSELECT,78)@31
    fracRPath3_uid79_fpArctanXTest_in <= expfracRPath3PostRnd_uid78_fpArctanXTest_q(23 downto 0);
    fracRPath3_uid79_fpArctanXTest_b <= fracRPath3_uid79_fpArctanXTest_in(23 downto 1);

	--ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_inputreg(DELAY,809)
    ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracRPath3_uid79_fpArctanXTest_b, xout => ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem(DUALMEM,810)
    ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_ia <= ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_inputreg_q;
    ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_aa <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdreg_q;
    ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_ab <= ld_reg_yPPolyEval_uid144_z_uid48_fpArctanXTest_0_to_prodXY_uid259_pT2_uid244_invPolyEval_0_q_to_prodXY_uid259_pT2_uid244_invPolyEval_a_replace_rdmux_q;
    ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_iq,
        address_a => ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_aa,
        data_a => ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_ia
    );
    ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_reset0 <= areset;
        ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_q <= ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_iq(22 downto 0);

	--reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4(REG,313)@35
    reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_q <= ld_fracRPath3_uid79_fpArctanXTest_b_to_reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--fracRPath2_uid97_fpArctanXTest(BITSELECT,96)@35
    fracRPath2_uid97_fpArctanXTest_in <= expFracRPath2PostRnd_uid96_fpArctanXTest_q(23 downto 0);
    fracRPath2_uid97_fpArctanXTest_b <= fracRPath2_uid97_fpArctanXTest_in(23 downto 1);

	--reg_fracRPath2_uid97_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_3(REG,312)@35
    reg_fracRPath2_uid97_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRPath2_uid97_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_3_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRPath2_uid97_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_3_q <= fracRPath2_uid97_fpArctanXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_nor(LOGICAL,806)
    ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_nor_a <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_notEnable_q;
    ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_nor_b <= ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_sticky_ena_q;
    ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_nor_q <= not (ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_nor_a or ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_nor_b);

	--ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_sticky_ena(REG,807)
    ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_nor_q = "1") THEN
                ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_sticky_ena_q <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_enaAnd(LOGICAL,808)
    ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_enaAnd_a <= ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_sticky_ena_q;
    ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_enaAnd_b <= en;
    ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_enaAnd_q <= ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_enaAnd_a and ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_enaAnd_b;

	--ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_inputreg(DELAY,796)
    ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid7_fpArctanXTest_b, xout => ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem(DUALMEM,797)
    ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_ia <= ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_inputreg_q;
    ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_aa <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdreg_q;
    ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_ab <= ld_singX_uid8_fpArctanXTest_b_to_fpPiO2C_uid40_fpArctanXTest_c_replace_rdmux_q;
    ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 6,
        numwords_a => 33,
        width_b => 23,
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
        clocken1 => ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_iq,
        address_a => ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_aa,
        data_a => ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_ia
    );
    ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_reset0 <= areset;
        ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_q <= ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_iq(22 downto 0);

	--reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2(REG,311)@35
    reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_q <= ld_fracX_uid7_fpArctanXTest_b_to_reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--fracRCalc_uid102_fpArctanXTest(MUX,101)@36
    fracRCalc_uid102_fpArctanXTest_s <= fracOutMuxSelEnc_uid100_fpArctanXTest_q;
    fracRCalc_uid102_fpArctanXTest: PROCESS (fracRCalc_uid102_fpArctanXTest_s, en, reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_q, reg_fracRPath2_uid97_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_3_q, reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_q, reg_fracOutCst_uid101_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_5_q)
    BEGIN
            CASE fracRCalc_uid102_fpArctanXTest_s IS
                  WHEN "00" => fracRCalc_uid102_fpArctanXTest_q <= reg_fracX_uid7_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_2_q;
                  WHEN "01" => fracRCalc_uid102_fpArctanXTest_q <= reg_fracRPath2_uid97_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_3_q;
                  WHEN "10" => fracRCalc_uid102_fpArctanXTest_q <= reg_fracRPath3_uid79_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_4_q;
                  WHEN "11" => fracRCalc_uid102_fpArctanXTest_q <= reg_fracOutCst_uid101_fpArctanXTest_0_to_fracRCalc_uid102_fpArctanXTest_5_q;
                  WHEN OTHERS => fracRCalc_uid102_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRPostExc_uid107_fpArctanXTest(MUX,106)@36
    fracRPostExc_uid107_fpArctanXTest_s <= outMuxSelEnc_uid106_fpArctanXTest_q;
    fracRPostExc_uid107_fpArctanXTest: PROCESS (fracRPostExc_uid107_fpArctanXTest_s, en, cstAllZWF_uid10_fpArctanXTest_q, fracRCalc_uid102_fpArctanXTest_q, cstAllZWF_uid10_fpArctanXTest_q, cstNaNWF_uid11_fpArctanXTest_q)
    BEGIN
            CASE fracRPostExc_uid107_fpArctanXTest_s IS
                  WHEN "00" => fracRPostExc_uid107_fpArctanXTest_q <= cstAllZWF_uid10_fpArctanXTest_q;
                  WHEN "01" => fracRPostExc_uid107_fpArctanXTest_q <= fracRCalc_uid102_fpArctanXTest_q;
                  WHEN "10" => fracRPostExc_uid107_fpArctanXTest_q <= cstAllZWF_uid10_fpArctanXTest_q;
                  WHEN "11" => fracRPostExc_uid107_fpArctanXTest_q <= cstNaNWF_uid11_fpArctanXTest_q;
                  WHEN OTHERS => fracRPostExc_uid107_fpArctanXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid111_fpArctanXTest(BITJOIN,110)@36
    R_uid111_fpArctanXTest_q <= ld_signR_uid110_fpArctanXTest_q_to_R_uid111_fpArctanXTest_c_replace_mem_q & expRPostExc_uid108_fpArctanXTest_q & fracRPostExc_uid107_fpArctanXTest_q;

	--xOut(GPOUT,4)@36
    q <= R_uid111_fpArctanXTest_q;


end normal;
