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

-- VHDL created from fp_sinpi_s5
-- VHDL created on Mon Mar 11 13:59:03 2013


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

entity fp_sinpi_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_sinpi_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid9_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid10_fpSinPiTest_q : std_logic_vector (22 downto 0);
    signal cstBias_uid11_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal cstBiasPwF_uid12_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWE_uid16_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal biasM1_uid31_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal biasMwShift_uid33_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal shiftBias_uid36_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal cst01pWShift_uid38_fpSinPiTest_q : std_logic_vector (12 downto 0);
    signal ozz_uid45_fpSinPiTest_q : std_logic_vector (34 downto 0);
    signal cOne_uid48_fpSinPiTest_q : std_logic_vector (36 downto 0);
    signal cmpYToOneMinusY_uid50_fpSinPiTest_a : std_logic_vector(40 downto 0);
    signal cmpYToOneMinusY_uid50_fpSinPiTest_b : std_logic_vector(40 downto 0);
    signal cmpYToOneMinusY_uid50_fpSinPiTest_o : std_logic_vector (40 downto 0);
    signal cmpYToOneMinusY_uid50_fpSinPiTest_cin : std_logic_vector (0 downto 0);
    signal cmpYToOneMinusY_uid50_fpSinPiTest_c : std_logic_vector (0 downto 0);
    signal p_uid59_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal p_uid59_fpSinPiTest_q : std_logic_vector (23 downto 0);
    signal expP_uid65_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal expP_uid65_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal piwFP2_uid71_fpSinPiTest_q : std_logic_vector (24 downto 0);
    signal multRightOp_uid72_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal multRightOp_uid72_fpSinPiTest_q : std_logic_vector (24 downto 0);
    signal mul2xSinRes_uid73_fpSinPiTest_a : std_logic_vector (23 downto 0);
    signal mul2xSinRes_uid73_fpSinPiTest_b : std_logic_vector (24 downto 0);
    signal mul2xSinRes_uid73_fpSinPiTest_s1 : std_logic_vector (48 downto 0);
    signal mul2xSinRes_uid73_fpSinPiTest_pr : UNSIGNED (48 downto 0);
    signal mul2xSinRes_uid73_fpSinPiTest_q : std_logic_vector (48 downto 0);
    signal regXAndInt_uid91_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal regXAndInt_uid91_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal regXAndInt_uid91_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal xHalfRZI_uid94_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal xHalfRZI_uid94_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal xHalfRZI_uid94_fpSinPiTest_c : std_logic_vector(0 downto 0);
    signal xHalfRZI_uid94_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal oneFracRPostExc2_uid96_fpSinPiTest_q : std_logic_vector (22 downto 0);
    signal rZOrXInt_uid98_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal rZOrXInt_uid98_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal rZOrXInt_uid98_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal signComp_uid107_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal signComp_uid107_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal signComp_uid107_fpSinPiTest_c : std_logic_vector(0 downto 0);
    signal signComp_uid107_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal InvYIsZero_uid108_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvYIsZero_uid108_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx1Pad16_uid114_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (15 downto 0);
    signal leftShiftStage0Idx2Pad32_uid117_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (31 downto 0);
    signal leftShiftStage0Idx3_uid120_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage1Idx1Pad4_uid123_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage1Idx3Pad12_uid129_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (11 downto 0);
    signal leftShiftStage2Idx2Pad2_uid137_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage2Idx3Pad3_uid140_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (2 downto 0);
    signal vCount_uid148_lzcZ_uid55_fpSinPiTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid148_lzcZ_uid55_fpSinPiTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid148_lzcZ_uid55_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal mO_uid149_lzcZ_uid55_fpSinPiTest_q : std_logic_vector (28 downto 0);
    signal vCount_uid168_lzcZ_uid55_fpSinPiTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid168_lzcZ_uid55_fpSinPiTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid168_lzcZ_uid55_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal memoryC0_uid216_sinPiZTableGenerator_q : std_logic_vector(28 downto 0);
    signal memoryC1_uid217_sinPiZTableGenerator_q : std_logic_vector(20 downto 0);
    signal memoryC2_uid218_sinPiZTableGenerator_q : std_logic_vector(13 downto 0);
    signal prodXY_uid232_pT1_uid220_sinPiZPolyEval_a : std_logic_vector (13 downto 0);
    signal prodXY_uid232_pT1_uid220_sinPiZPolyEval_b : std_logic_vector (13 downto 0);
    signal prodXY_uid232_pT1_uid220_sinPiZPolyEval_s1 : std_logic_vector (27 downto 0);
    signal prodXY_uid232_pT1_uid220_sinPiZPolyEval_pr : SIGNED (28 downto 0);
    signal prodXY_uid232_pT1_uid220_sinPiZPolyEval_q : std_logic_vector (27 downto 0);
    signal prodXY_uid235_pT2_uid226_sinPiZPolyEval_a : std_logic_vector (15 downto 0);
    signal prodXY_uid235_pT2_uid226_sinPiZPolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid235_pT2_uid226_sinPiZPolyEval_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid235_pT2_uid226_sinPiZPolyEval_pr : SIGNED (39 downto 0);
    signal prodXY_uid235_pT2_uid226_sinPiZPolyEval_q : std_logic_vector (38 downto 0);
    signal reg_leftShiftStageSel5Dto4_uid121_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_2_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_2_q : std_logic_vector (36 downto 0);
    signal reg_y_uid43_fpSinPiTest_0_to_yIsZero_uid47_fpSinPiTest_1_q : std_logic_vector (35 downto 0);
    signal reg_expXIsZero_uid18_fpSinPiTest_0_to_excRZero_uid92_fpSinPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_xRyHalf_uid90_fpSinPiTest_0_to_xHalfRZI_uid94_fpSinPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_oneMinusY_uid49_fpSinPiTest_0_to_cmpYToOneMinusY_uid50_fpSinPiTest_0_q : std_logic_vector (37 downto 0);
    signal reg_yBottom_uid52_fpSinPiTest_0_to_z_uid53_fpSinPiTest_2_q : std_logic_vector (34 downto 0);
    signal reg_oMyBottom_uid51_fpSinPiTest_0_to_z_uid53_fpSinPiTest_3_q : std_logic_vector (34 downto 0);
    signal reg_rVStage_uid161_lzcZ_uid55_fpSinPiTest_0_to_vCount_uid162_lzcZ_uid55_fpSinPiTest_1_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid163_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid165_lzcZ_uid55_fpSinPiTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid167_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid171_lzcZ_uid55_fpSinPiTest_2_q : std_logic_vector (3 downto 0);
    signal reg_vStage_uid169_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid171_lzcZ_uid55_fpSinPiTest_3_q : std_logic_vector (3 downto 0);
    signal reg_vCount_uid156_lzcZ_uid55_fpSinPiTest_0_to_r_uid181_lzcZ_uid55_fpSinPiTest_4_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel5Dto4_uid191_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_2_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_2_q : std_logic_vector (34 downto 0);
    signal reg_zAddr_uid67_fpSinPiTest_0_to_memoryC2_uid218_sinPiZTableGenerator_0_q : std_logic_vector (6 downto 0);
    signal reg_yT1_uid219_sinPiZPolyEval_0_to_prodXY_uid232_pT1_uid220_sinPiZPolyEval_0_q : std_logic_vector (13 downto 0);
    signal reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q : std_logic_vector (15 downto 0);
    signal reg_s1_uid221_uid224_sinPiZPolyEval_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_r_uid181_lzcZ_uid55_fpSinPiTest_0_to_expHardCase_uid61_fpSinPiTest_1_q : std_logic_vector (5 downto 0);
    signal reg_fracRComp_uid82_fpSinPiTest_0_to_fracRPostExc1_uid95_fpSinPiTest_2_q : std_logic_vector (22 downto 0);
    signal reg_excRNaN_uid93_fpSinPiTest_0_to_fracRPostExc_uid97_fpSinPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_xIsInt_uid87_fpSinPiTest_0_to_rZOrXInt_uid98_fpSinPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_expRComp_uid83_fpSinPiTest_0_to_expRPostExc1_uid101_fpSinPiTest_2_q : std_logic_vector (7 downto 0);
    signal reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal ld_fracX_uid7_fpSinPiTest_b_to_oFracX_uid35_uid35_fpSinPiTest_a_q : std_logic_vector (22 downto 0);
    signal ld_y_uid43_fpSinPiTest_b_to_cmpYToOneMinusY_uid50_fpSinPiTest_b_q : std_logic_vector (35 downto 0);
    signal ld_reg_oMyBottom_uid51_fpSinPiTest_0_to_z_uid53_fpSinPiTest_3_q_to_z_uid53_fpSinPiTest_d_q : std_logic_vector (34 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_c_to_p_uid59_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_c_to_expP_uid65_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_c_to_multRightOp_uid72_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_p_uid59_fpSinPiTest_q_to_mul2xSinRes_uid73_fpSinPiTest_a_q : std_logic_vector (23 downto 0);
    signal ld_sinXIsX_uid34_fpSinPiTest_c_to_InvSinXIsX_uid84_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_xIntExp_uid30_fpSinPiTest_c_to_xIntYz_uid86_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid29_fpSinPiTest_q_to_xIsInt_uid87_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_reg_expXIsZero_uid18_fpSinPiTest_0_to_excRZero_uid92_fpSinPiTest_2_q_to_excRZero_uid92_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_xHalfRZI_uid94_fpSinPiTest_q_to_fracRPostExc1_uid95_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_rZOrXInt_uid98_fpSinPiTest_q_to_expRPostExc1_uid101_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid93_fpSinPiTest_q_to_excRIoN_uid102_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_xFrac_uid32_fpSinPiTest_n_to_InvXFrac_uid105_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_intXParity_uid42_fpSinPiTest_b_to_signComp_uid107_fpSinPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid8_fpSinPiTest_b_to_signR_uid110_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid110_fpSinPiTest_q_to_R_uid111_fpSinPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_LeftShiftStage032dto0_uid124_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx1_uid125_fixedPointX_uid41_fpSinPiTest_b_q : std_logic_vector (32 downto 0);
    signal ld_LeftShiftStage028dto0_uid127_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx2_uid128_fixedPointX_uid41_fpSinPiTest_b_q : std_logic_vector (28 downto 0);
    signal ld_LeftShiftStage024dto0_uid130_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx3_uid131_fixedPointX_uid41_fpSinPiTest_b_q : std_logic_vector (24 downto 0);
    signal ld_LeftShiftStage135dto0_uid135_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx1_uid136_fixedPointX_uid41_fpSinPiTest_b_q : std_logic_vector (35 downto 0);
    signal ld_LeftShiftStage134dto0_uid138_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx2_uid139_fixedPointX_uid41_fpSinPiTest_b_q : std_logic_vector (34 downto 0);
    signal ld_LeftShiftStage133dto0_uid141_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx3_uid142_fixedPointX_uid41_fpSinPiTest_b_q : std_logic_vector (33 downto 0);
    signal ld_vStage_uid150_lzcZ_uid55_fpSinPiTest_b_to_cStage_uid151_lzcZ_uid55_fpSinPiTest_b_q : std_logic_vector (2 downto 0);
    signal ld_rVStage_uid147_lzcZ_uid55_fpSinPiTest_b_to_vStagei_uid153_lzcZ_uid55_fpSinPiTest_c_q : std_logic_vector (31 downto 0);
    signal ld_vCount_uid162_lzcZ_uid55_fpSinPiTest_q_to_r_uid181_lzcZ_uid55_fpSinPiTest_d_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid148_lzcZ_uid55_fpSinPiTest_q_to_r_uid181_lzcZ_uid55_fpSinPiTest_f_q : std_logic_vector (0 downto 0);
    signal ld_vStage_uid150_lzcZ_uid55_fpSinPiTest_b_to_leftShiftStage0Idx2_uid189_alignedZ_uid56_fpSinPiTest_b_q : std_logic_vector (2 downto 0);
    signal ld_LeftShiftStage030dto0_uid194_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx1_uid195_alignedZ_uid56_fpSinPiTest_b_q : std_logic_vector (30 downto 0);
    signal ld_LeftShiftStage026dto0_uid197_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx2_uid198_alignedZ_uid56_fpSinPiTest_b_q : std_logic_vector (26 downto 0);
    signal ld_LeftShiftStage022dto0_uid200_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx3_uid201_alignedZ_uid56_fpSinPiTest_b_q : std_logic_vector (22 downto 0);
    signal ld_reg_leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_1_q_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_b_q : std_logic_vector (1 downto 0);
    signal ld_LeftShiftStage133dto0_uid205_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx1_uid206_alignedZ_uid56_fpSinPiTest_b_q : std_logic_vector (33 downto 0);
    signal ld_LeftShiftStage132dto0_uid208_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx2_uid209_alignedZ_uid56_fpSinPiTest_b_q : std_logic_vector (32 downto 0);
    signal ld_LeftShiftStage131dto0_uid211_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx3_uid212_alignedZ_uid56_fpSinPiTest_b_q : std_logic_vector (31 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC1_uid217_sinPiZTableGenerator_0_q_to_memoryC1_uid217_sinPiZTableGenerator_a_q : std_logic_vector (6 downto 0);
    signal ld_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_b_to_reg_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_b_to_reg_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_yBottom_uid52_fpSinPiTest_b_to_reg_yBottom_uid52_fpSinPiTest_0_to_z_uid53_fpSinPiTest_2_a_q : std_logic_vector (34 downto 0);
    signal ld_vCount_uid156_lzcZ_uid55_fpSinPiTest_q_to_reg_vCount_uid156_lzcZ_uid55_fpSinPiTest_0_to_r_uid181_lzcZ_uid55_fpSinPiTest_4_a_q : std_logic_vector (0 downto 0);
    signal ld_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_b_to_reg_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_yT1_uid219_sinPiZPolyEval_b_to_reg_yT1_uid219_sinPiZPolyEval_0_to_prodXY_uid232_pT1_uid220_sinPiZPolyEval_0_a_q : std_logic_vector (13 downto 0);
    signal ld_excRNaN_uid93_fpSinPiTest_q_to_reg_excRNaN_uid93_fpSinPiTest_0_to_fracRPostExc_uid97_fpSinPiTest_1_a_q : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_reset0 : std_logic;
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_eq : std_logic;
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_sticky_ena_q : signal is true;
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_sticky_ena_q : signal is true;
    signal ld_p_uid59_fpSinPiTest_q_to_mul2xSinRes_uid73_fpSinPiTest_a_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_sticky_ena_q : signal is true;
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_inputreg_q : std_logic_vector (18 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_ia : std_logic_vector (18 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_iq : std_logic_vector (18 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_q : std_logic_vector (18 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_sticky_ena_q : signal is true;
    signal ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_inputreg_q : std_logic_vector (34 downto 0);
    signal ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_reset0 : std_logic;
    signal ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_ia : std_logic_vector (34 downto 0);
    signal ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_iq : std_logic_vector (34 downto 0);
    signal ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_q : std_logic_vector (34 downto 0);
    signal ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_sticky_ena_q : signal is true;
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_inputreg_q : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_reset0 : std_logic;
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_sticky_ena_q : signal is true;
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_inputreg_q : std_logic_vector (15 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_ia : std_logic_vector (15 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_iq : std_logic_vector (15 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_q : std_logic_vector (15 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_sticky_ena_q : signal is true;
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_inputreg_q : std_logic_vector (1 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_reset0 : std_logic;
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_q : std_logic_vector (1 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_eq : std_logic;
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_sticky_ena_q : signal is true;
    signal yIsZero_uid44_fpSinPiTest_a : std_logic_vector(35 downto 0);
    signal yIsZero_uid44_fpSinPiTest_b : std_logic_vector(35 downto 0);
    signal yIsZero_uid44_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal excRIoN_uid102_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal excRIoN_uid102_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal excRIoN_uid102_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage2Idx1_uid136_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage2Idx1_uid206_alignedZ_uid56_fpSinPiTest_q : std_logic_vector (34 downto 0);
    signal expXP1_uid62_fpSinPiTest_a : std_logic_vector(8 downto 0);
    signal expXP1_uid62_fpSinPiTest_b : std_logic_vector(8 downto 0);
    signal expXP1_uid62_fpSinPiTest_o : std_logic_vector (8 downto 0);
    signal expXP1_uid62_fpSinPiTest_q : std_logic_vector (8 downto 0);
    signal InvSinXIsX_uid84_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvSinXIsX_uid84_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal InvXIntExp_uid88_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvXIntExp_uid88_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal InvXFrac_uid105_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvXFrac_uid105_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal oFracX_uid35_uid35_fpSinPiTest_q : std_logic_vector (23 downto 0);
    signal join_uid46_fpSinPiTest_q : std_logic_vector (35 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal expX_uid6_fpSinPiTest_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid7_fpSinPiTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid7_fpSinPiTest_b : std_logic_vector (22 downto 0);
    signal signX_uid8_fpSinPiTest_in : std_logic_vector (31 downto 0);
    signal signX_uid8_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal expXIsZero_uid18_fpSinPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid18_fpSinPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid18_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid20_fpSinPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid20_fpSinPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid20_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid22_fpSinPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid22_fpSinPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid22_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid23_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid23_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid23_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal xIntExp_uid30_fpSinPiTest_a : std_logic_vector(10 downto 0);
    signal xIntExp_uid30_fpSinPiTest_b : std_logic_vector(10 downto 0);
    signal xIntExp_uid30_fpSinPiTest_o : std_logic_vector (10 downto 0);
    signal xIntExp_uid30_fpSinPiTest_cin : std_logic_vector (0 downto 0);
    signal xIntExp_uid30_fpSinPiTest_c : std_logic_vector (0 downto 0);
    signal xFrac_uid32_fpSinPiTest_a : std_logic_vector(10 downto 0);
    signal xFrac_uid32_fpSinPiTest_b : std_logic_vector(10 downto 0);
    signal xFrac_uid32_fpSinPiTest_o : std_logic_vector (10 downto 0);
    signal xFrac_uid32_fpSinPiTest_cin : std_logic_vector (0 downto 0);
    signal xFrac_uid32_fpSinPiTest_n : std_logic_vector (0 downto 0);
    signal sinXIsX_uid34_fpSinPiTest_a : std_logic_vector(10 downto 0);
    signal sinXIsX_uid34_fpSinPiTest_b : std_logic_vector(10 downto 0);
    signal sinXIsX_uid34_fpSinPiTest_o : std_logic_vector (10 downto 0);
    signal sinXIsX_uid34_fpSinPiTest_cin : std_logic_vector (0 downto 0);
    signal sinXIsX_uid34_fpSinPiTest_c : std_logic_vector (0 downto 0);
    signal shiftValue_uid37_fpSinPiTest_a : std_logic_vector(8 downto 0);
    signal shiftValue_uid37_fpSinPiTest_b : std_logic_vector(8 downto 0);
    signal shiftValue_uid37_fpSinPiTest_o : std_logic_vector (8 downto 0);
    signal shiftValue_uid37_fpSinPiTest_q : std_logic_vector (8 downto 0);
    signal yIsZero_uid47_fpSinPiTest_a : std_logic_vector(35 downto 0);
    signal yIsZero_uid47_fpSinPiTest_b : std_logic_vector(35 downto 0);
    signal yIsZero_uid47_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal oneMinusY_uid49_fpSinPiTest_a : std_logic_vector(37 downto 0);
    signal oneMinusY_uid49_fpSinPiTest_b : std_logic_vector(37 downto 0);
    signal oneMinusY_uid49_fpSinPiTest_o : std_logic_vector (37 downto 0);
    signal oneMinusY_uid49_fpSinPiTest_q : std_logic_vector (37 downto 0);
    signal z_uid53_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal z_uid53_fpSinPiTest_q : std_logic_vector (34 downto 0);
    signal expHardCase_uid61_fpSinPiTest_a : std_logic_vector(8 downto 0);
    signal expHardCase_uid61_fpSinPiTest_b : std_logic_vector(8 downto 0);
    signal expHardCase_uid61_fpSinPiTest_o : std_logic_vector (8 downto 0);
    signal expHardCase_uid61_fpSinPiTest_q : std_logic_vector (8 downto 0);
    signal yZSinXNX_uid85_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal yZSinXNX_uid85_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal yZSinXNX_uid85_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal xIntYz_uid86_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal xIntYz_uid86_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal xIntYz_uid86_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal xIsInt_uid87_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal xIsInt_uid87_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal xIsInt_uid87_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal xRyHalf_uid90_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal xRyHalf_uid90_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal xRyHalf_uid90_fpSinPiTest_c : std_logic_vector(0 downto 0);
    signal xRyHalf_uid90_fpSinPiTest_d : std_logic_vector(0 downto 0);
    signal xRyHalf_uid90_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal excRZero_uid92_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid92_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid92_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExc1_uid95_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPostExc1_uid95_fpSinPiTest_q : std_logic_vector (22 downto 0);
    signal fracRPostExc_uid97_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPostExc_uid97_fpSinPiTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc1_uid101_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal expRPostExc1_uid101_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal expRPostExc_uid104_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid104_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal yZSC_uid109_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal yZSC_uid109_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal yZSC_uid109_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal signR_uid110_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal signR_uid110_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal signR_uid110_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid162_lzcZ_uid55_fpSinPiTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid162_lzcZ_uid55_fpSinPiTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid162_lzcZ_uid55_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid165_lzcZ_uid55_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid165_lzcZ_uid55_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid171_lzcZ_uid55_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid171_lzcZ_uid55_fpSinPiTest_q : std_logic_vector (3 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal leftShiftStage1Idx2_uid128_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage1Idx2_uid198_alignedZ_uid56_fpSinPiTest_q : std_logic_vector (34 downto 0);
    signal extendedFracX_uid39_fpSinPiTest_q : std_logic_vector (36 downto 0);
    signal normBit_uid74_fpSinPiTest_in : std_logic_vector (48 downto 0);
    signal normBit_uid74_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal highRes_uid75_fpSinPiTest_in : std_logic_vector (47 downto 0);
    signal highRes_uid75_fpSinPiTest_b : std_logic_vector (23 downto 0);
    signal lowRes_uid76_fpSinPiTest_in : std_logic_vector (46 downto 0);
    signal lowRes_uid76_fpSinPiTest_b : std_logic_vector (23 downto 0);
    signal leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage0Idx2_uid189_alignedZ_uid56_fpSinPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage1Idx1_uid125_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage1Idx1_uid195_alignedZ_uid56_fpSinPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage1Idx3_uid131_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage1Idx3_uid201_alignedZ_uid56_fpSinPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage2Idx2_uid139_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage2Idx2_uid209_alignedZ_uid56_fpSinPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage2Idx3_uid142_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage2Idx3_uid212_alignedZ_uid56_fpSinPiTest_q : std_logic_vector (34 downto 0);
    signal cStage_uid151_lzcZ_uid55_fpSinPiTest_q : std_logic_vector (31 downto 0);
    signal prodXYTruncFR_uid233_pT1_uid220_sinPiZPolyEval_in : std_logic_vector (27 downto 0);
    signal prodXYTruncFR_uid233_pT1_uid220_sinPiZPolyEval_b : std_logic_vector (14 downto 0);
    signal prodXYTruncFR_uid236_pT2_uid226_sinPiZPolyEval_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid236_pT2_uid226_sinPiZPolyEval_b : std_logic_vector (23 downto 0);
    signal leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_q : std_logic_vector (34 downto 0);
    signal R_uid111_fpSinPiTest_q : std_logic_vector (31 downto 0);
    signal vStagei_uid153_lzcZ_uid55_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid153_lzcZ_uid55_fpSinPiTest_q : std_logic_vector (31 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmp_a : std_logic_vector(4 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmp_b : std_logic_vector(4 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmp_a : std_logic_vector(2 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmp_b : std_logic_vector(2 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_nor_q : std_logic_vector(0 downto 0);
    signal join_uid103_fpSinPiTest_q : std_logic_vector (1 downto 0);
    signal expXP1R_uid63_fpSinPiTest_in : std_logic_vector (7 downto 0);
    signal expXP1R_uid63_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal InvExpXIsZero_uid28_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid28_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid24_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid24_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid27_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid27_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal fxpShifterBits_uid40_fpSinPiTest_in : std_logic_vector (5 downto 0);
    signal fxpShifterBits_uid40_fpSinPiTest_b : std_logic_vector (5 downto 0);
    signal oMyBottom_uid51_fpSinPiTest_in : std_logic_vector (34 downto 0);
    signal oMyBottom_uid51_fpSinPiTest_b : std_logic_vector (34 downto 0);
    signal zAddr_uid67_fpSinPiTest_in : std_logic_vector (34 downto 0);
    signal zAddr_uid67_fpSinPiTest_b : std_logic_vector (6 downto 0);
    signal zPPolyEval_uid68_fpSinPiTest_in : std_logic_vector (27 downto 0);
    signal zPPolyEval_uid68_fpSinPiTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid147_lzcZ_uid55_fpSinPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid147_lzcZ_uid55_fpSinPiTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid150_lzcZ_uid55_fpSinPiTest_in : std_logic_vector (2 downto 0);
    signal vStage_uid150_lzcZ_uid55_fpSinPiTest_b : std_logic_vector (2 downto 0);
    signal X18dto0_uid185_alignedZ_uid56_fpSinPiTest_in : std_logic_vector (18 downto 0);
    signal X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b : std_logic_vector (18 downto 0);
    signal expHardCaseR_uid64_fpSinPiTest_in : std_logic_vector (7 downto 0);
    signal expHardCaseR_uid64_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal InvXIsInt_uid106_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvXIsInt_uid106_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal rVStage_uid167_lzcZ_uid55_fpSinPiTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid167_lzcZ_uid55_fpSinPiTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid169_lzcZ_uid55_fpSinPiTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid169_lzcZ_uid55_fpSinPiTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid173_lzcZ_uid55_fpSinPiTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid173_lzcZ_uid55_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid175_lzcZ_uid55_fpSinPiTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid175_lzcZ_uid55_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal X20dto0_uid115_fixedPointX_uid41_fpSinPiTest_in : std_logic_vector (20 downto 0);
    signal X20dto0_uid115_fixedPointX_uid41_fpSinPiTest_b : std_logic_vector (20 downto 0);
    signal X4dto0_uid118_fixedPointX_uid41_fpSinPiTest_in : std_logic_vector (4 downto 0);
    signal X4dto0_uid118_fixedPointX_uid41_fpSinPiTest_b : std_logic_vector (4 downto 0);
    signal fracRCompPreRnd_uid77_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal fracRCompPreRnd_uid77_fpSinPiTest_q : std_logic_vector (23 downto 0);
    signal rndExpUpdate_uid79_uid80_fpSinPiTest_q : std_logic_vector (24 downto 0);
    signal lowRangeB_uid221_sinPiZPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid221_sinPiZPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid222_sinPiZPolyEval_in : std_logic_vector (14 downto 0);
    signal highBBits_uid222_sinPiZPolyEval_b : std_logic_vector (13 downto 0);
    signal lowRangeB_uid227_sinPiZPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid227_sinPiZPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid228_sinPiZPolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid228_sinPiZPolyEval_b : std_logic_vector (21 downto 0);
    signal LeftShiftStage135dto0_uid135_fixedPointX_uid41_fpSinPiTest_in : std_logic_vector (35 downto 0);
    signal LeftShiftStage135dto0_uid135_fixedPointX_uid41_fpSinPiTest_b : std_logic_vector (35 downto 0);
    signal LeftShiftStage134dto0_uid138_fixedPointX_uid41_fpSinPiTest_in : std_logic_vector (34 downto 0);
    signal LeftShiftStage134dto0_uid138_fixedPointX_uid41_fpSinPiTest_b : std_logic_vector (34 downto 0);
    signal LeftShiftStage133dto0_uid141_fixedPointX_uid41_fpSinPiTest_in : std_logic_vector (33 downto 0);
    signal LeftShiftStage133dto0_uid141_fixedPointX_uid41_fpSinPiTest_b : std_logic_vector (33 downto 0);
    signal intXParity_uid42_fpSinPiTest_in : std_logic_vector (36 downto 0);
    signal intXParity_uid42_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal y_uid43_fpSinPiTest_in : std_logic_vector (35 downto 0);
    signal y_uid43_fpSinPiTest_b : std_logic_vector (35 downto 0);
    signal LeftShiftStage030dto0_uid194_alignedZ_uid56_fpSinPiTest_in : std_logic_vector (30 downto 0);
    signal LeftShiftStage030dto0_uid194_alignedZ_uid56_fpSinPiTest_b : std_logic_vector (30 downto 0);
    signal LeftShiftStage026dto0_uid197_alignedZ_uid56_fpSinPiTest_in : std_logic_vector (26 downto 0);
    signal LeftShiftStage026dto0_uid197_alignedZ_uid56_fpSinPiTest_b : std_logic_vector (26 downto 0);
    signal LeftShiftStage022dto0_uid200_alignedZ_uid56_fpSinPiTest_in : std_logic_vector (22 downto 0);
    signal LeftShiftStage022dto0_uid200_alignedZ_uid56_fpSinPiTest_b : std_logic_vector (22 downto 0);
    signal LeftShiftStage133dto0_uid205_alignedZ_uid56_fpSinPiTest_in : std_logic_vector (33 downto 0);
    signal LeftShiftStage133dto0_uid205_alignedZ_uid56_fpSinPiTest_b : std_logic_vector (33 downto 0);
    signal LeftShiftStage132dto0_uid208_alignedZ_uid56_fpSinPiTest_in : std_logic_vector (32 downto 0);
    signal LeftShiftStage132dto0_uid208_alignedZ_uid56_fpSinPiTest_b : std_logic_vector (32 downto 0);
    signal LeftShiftStage131dto0_uid211_alignedZ_uid56_fpSinPiTest_in : std_logic_vector (31 downto 0);
    signal LeftShiftStage131dto0_uid211_alignedZ_uid56_fpSinPiTest_b : std_logic_vector (31 downto 0);
    signal alignedZLow_uid57_fpSinPiTest_in : std_logic_vector (34 downto 0);
    signal alignedZLow_uid57_fpSinPiTest_b : std_logic_vector (22 downto 0);
    signal rVStage_uid155_lzcZ_uid55_fpSinPiTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid155_lzcZ_uid55_fpSinPiTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid157_lzcZ_uid55_fpSinPiTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid157_lzcZ_uid55_fpSinPiTest_b : std_logic_vector (15 downto 0);
    signal exc_N_uid25_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid25_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid25_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStageSel5Dto4_uid121_fixedPointX_uid41_fpSinPiTest_in : std_logic_vector (5 downto 0);
    signal leftShiftStageSel5Dto4_uid121_fixedPointX_uid41_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal yT1_uid219_sinPiZPolyEval_in : std_logic_vector (15 downto 0);
    signal yT1_uid219_sinPiZPolyEval_b : std_logic_vector (13 downto 0);
    signal vCount_uid174_lzcZ_uid55_fpSinPiTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid174_lzcZ_uid55_fpSinPiTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid174_lzcZ_uid55_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid177_lzcZ_uid55_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid177_lzcZ_uid55_fpSinPiTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage0Idx1_uid116_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0Idx2_uid119_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (36 downto 0);
    signal expFracPreRnd_uid78_uid78_fpSinPiTest_q : std_logic_vector (31 downto 0);
    signal expFracComp_uid81_fpSinPiTest_a : std_logic_vector(32 downto 0);
    signal expFracComp_uid81_fpSinPiTest_b : std_logic_vector(32 downto 0);
    signal expFracComp_uid81_fpSinPiTest_o : std_logic_vector (32 downto 0);
    signal expFracComp_uid81_fpSinPiTest_q : std_logic_vector (32 downto 0);
    signal sumAHighB_uid223_sinPiZPolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid223_sinPiZPolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid223_sinPiZPolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid223_sinPiZPolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid229_sinPiZPolyEval_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid229_sinPiZPolyEval_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid229_sinPiZPolyEval_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid229_sinPiZPolyEval_q : std_logic_vector (29 downto 0);
    signal yBottom_uid52_fpSinPiTest_in : std_logic_vector (34 downto 0);
    signal yBottom_uid52_fpSinPiTest_b : std_logic_vector (34 downto 0);
    signal pHardCase_uid58_fpSinPiTest_q : std_logic_vector (23 downto 0);
    signal vCount_uid156_lzcZ_uid55_fpSinPiTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid156_lzcZ_uid55_fpSinPiTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid156_lzcZ_uid55_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid159_lzcZ_uid55_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid159_lzcZ_uid55_fpSinPiTest_q : std_logic_vector (15 downto 0);
    signal InvExc_N_uid26_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid26_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid93_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid93_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid93_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal rVStage_uid179_lzcZ_uid55_fpSinPiTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid179_lzcZ_uid55_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_q : std_logic_vector (36 downto 0);
    signal fracRComp_uid82_fpSinPiTest_in : std_logic_vector (23 downto 0);
    signal fracRComp_uid82_fpSinPiTest_b : std_logic_vector (22 downto 0);
    signal expRComp_uid83_fpSinPiTest_in : std_logic_vector (31 downto 0);
    signal expRComp_uid83_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal s1_uid221_uid224_sinPiZPolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid227_uid230_sinPiZPolyEval_q : std_logic_vector (31 downto 0);
    signal rVStage_uid161_lzcZ_uid55_fpSinPiTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid161_lzcZ_uid55_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid163_lzcZ_uid55_fpSinPiTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid163_lzcZ_uid55_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal exc_R_uid29_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid29_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid29_fpSinPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid29_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid180_lzcZ_uid55_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid180_lzcZ_uid55_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid180_lzcZ_uid55_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal LeftShiftStage032dto0_uid124_fixedPointX_uid41_fpSinPiTest_in : std_logic_vector (32 downto 0);
    signal LeftShiftStage032dto0_uid124_fixedPointX_uid41_fpSinPiTest_b : std_logic_vector (32 downto 0);
    signal LeftShiftStage028dto0_uid127_fixedPointX_uid41_fpSinPiTest_in : std_logic_vector (28 downto 0);
    signal LeftShiftStage028dto0_uid127_fixedPointX_uid41_fpSinPiTest_b : std_logic_vector (28 downto 0);
    signal LeftShiftStage024dto0_uid130_fixedPointX_uid41_fpSinPiTest_in : std_logic_vector (24 downto 0);
    signal LeftShiftStage024dto0_uid130_fixedPointX_uid41_fpSinPiTest_b : std_logic_vector (24 downto 0);
    signal fxpSinRes_uid70_fpSinPiTest_in : std_logic_vector (29 downto 0);
    signal fxpSinRes_uid70_fpSinPiTest_b : std_logic_vector (24 downto 0);
    signal r_uid181_lzcZ_uid55_fpSinPiTest_q : std_logic_vector (5 downto 0);
    signal leftShiftStageSel5Dto4_uid191_alignedZ_uid56_fpSinPiTest_in : std_logic_vector (5 downto 0);
    signal leftShiftStageSel5Dto4_uid191_alignedZ_uid56_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_b : std_logic_vector (1 downto 0);
begin


	--xIn(GPIN,3)@0

	--leftShiftStage0Idx3_uid120_fixedPointX_uid41_fpSinPiTest(CONSTANT,119)
    leftShiftStage0Idx3_uid120_fixedPointX_uid41_fpSinPiTest_q <= "0000000000000000000000000000000000000";

	--X4dto0_uid118_fixedPointX_uid41_fpSinPiTest(BITSELECT,117)@1
    X4dto0_uid118_fixedPointX_uid41_fpSinPiTest_in <= extendedFracX_uid39_fpSinPiTest_q(4 downto 0);
    X4dto0_uid118_fixedPointX_uid41_fpSinPiTest_b <= X4dto0_uid118_fixedPointX_uid41_fpSinPiTest_in(4 downto 0);

	--leftShiftStage0Idx2Pad32_uid117_fixedPointX_uid41_fpSinPiTest(CONSTANT,116)
    leftShiftStage0Idx2Pad32_uid117_fixedPointX_uid41_fpSinPiTest_q <= "00000000000000000000000000000000";

	--leftShiftStage0Idx2_uid119_fixedPointX_uid41_fpSinPiTest(BITJOIN,118)@1
    leftShiftStage0Idx2_uid119_fixedPointX_uid41_fpSinPiTest_q <= X4dto0_uid118_fixedPointX_uid41_fpSinPiTest_b & leftShiftStage0Idx2Pad32_uid117_fixedPointX_uid41_fpSinPiTest_q;

	--X20dto0_uid115_fixedPointX_uid41_fpSinPiTest(BITSELECT,114)@1
    X20dto0_uid115_fixedPointX_uid41_fpSinPiTest_in <= extendedFracX_uid39_fpSinPiTest_q(20 downto 0);
    X20dto0_uid115_fixedPointX_uid41_fpSinPiTest_b <= X20dto0_uid115_fixedPointX_uid41_fpSinPiTest_in(20 downto 0);

	--leftShiftStage0Idx1Pad16_uid114_fixedPointX_uid41_fpSinPiTest(CONSTANT,113)
    leftShiftStage0Idx1Pad16_uid114_fixedPointX_uid41_fpSinPiTest_q <= "0000000000000000";

	--leftShiftStage0Idx1_uid116_fixedPointX_uid41_fpSinPiTest(BITJOIN,115)@1
    leftShiftStage0Idx1_uid116_fixedPointX_uid41_fpSinPiTest_q <= X20dto0_uid115_fixedPointX_uid41_fpSinPiTest_b & leftShiftStage0Idx1Pad16_uid114_fixedPointX_uid41_fpSinPiTest_q;

	--cst01pWShift_uid38_fpSinPiTest(CONSTANT,37)
    cst01pWShift_uid38_fpSinPiTest_q <= "0000000000000";

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--fracX_uid7_fpSinPiTest(BITSELECT,6)@0
    fracX_uid7_fpSinPiTest_in <= a(22 downto 0);
    fracX_uid7_fpSinPiTest_b <= fracX_uid7_fpSinPiTest_in(22 downto 0);

	--ld_fracX_uid7_fpSinPiTest_b_to_oFracX_uid35_uid35_fpSinPiTest_a(DELAY,294)@0
    ld_fracX_uid7_fpSinPiTest_b_to_oFracX_uid35_uid35_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid7_fpSinPiTest_b, xout => ld_fracX_uid7_fpSinPiTest_b_to_oFracX_uid35_uid35_fpSinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--oFracX_uid35_uid35_fpSinPiTest(BITJOIN,34)@1
    oFracX_uid35_uid35_fpSinPiTest_q <= VCC_q & ld_fracX_uid7_fpSinPiTest_b_to_oFracX_uid35_uid35_fpSinPiTest_a_q;

	--extendedFracX_uid39_fpSinPiTest(BITJOIN,38)@1
    extendedFracX_uid39_fpSinPiTest_q <= cst01pWShift_uid38_fpSinPiTest_q & oFracX_uid35_uid35_fpSinPiTest_q;

	--shiftBias_uid36_fpSinPiTest(CONSTANT,35)
    shiftBias_uid36_fpSinPiTest_q <= "01110010";

	--expX_uid6_fpSinPiTest(BITSELECT,5)@0
    expX_uid6_fpSinPiTest_in <= a(30 downto 0);
    expX_uid6_fpSinPiTest_b <= expX_uid6_fpSinPiTest_in(30 downto 23);

	--shiftValue_uid37_fpSinPiTest(SUB,36)@0
    shiftValue_uid37_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpSinPiTest_b);
    shiftValue_uid37_fpSinPiTest_b <= STD_LOGIC_VECTOR("0" & shiftBias_uid36_fpSinPiTest_q);
            shiftValue_uid37_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValue_uid37_fpSinPiTest_a) - UNSIGNED(shiftValue_uid37_fpSinPiTest_b));
    shiftValue_uid37_fpSinPiTest_q <= shiftValue_uid37_fpSinPiTest_o(8 downto 0);


	--fxpShifterBits_uid40_fpSinPiTest(BITSELECT,39)@0
    fxpShifterBits_uid40_fpSinPiTest_in <= shiftValue_uid37_fpSinPiTest_q(5 downto 0);
    fxpShifterBits_uid40_fpSinPiTest_b <= fxpShifterBits_uid40_fpSinPiTest_in(5 downto 0);

	--leftShiftStageSel5Dto4_uid121_fixedPointX_uid41_fpSinPiTest(BITSELECT,120)@0
    leftShiftStageSel5Dto4_uid121_fixedPointX_uid41_fpSinPiTest_in <= fxpShifterBits_uid40_fpSinPiTest_b;
    leftShiftStageSel5Dto4_uid121_fixedPointX_uid41_fpSinPiTest_b <= leftShiftStageSel5Dto4_uid121_fixedPointX_uid41_fpSinPiTest_in(5 downto 4);

	--reg_leftShiftStageSel5Dto4_uid121_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_1(REG,237)@0
    reg_leftShiftStageSel5Dto4_uid121_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel5Dto4_uid121_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel5Dto4_uid121_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_1_q <= leftShiftStageSel5Dto4_uid121_fixedPointX_uid41_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest(MUX,121)@1
    leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_s <= reg_leftShiftStageSel5Dto4_uid121_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_1_q;
    leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest: PROCESS (leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_s, en, extendedFracX_uid39_fpSinPiTest_q, leftShiftStage0Idx1_uid116_fixedPointX_uid41_fpSinPiTest_q, leftShiftStage0Idx2_uid119_fixedPointX_uid41_fpSinPiTest_q, leftShiftStage0Idx3_uid120_fixedPointX_uid41_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_q <= extendedFracX_uid39_fpSinPiTest_q;
                  WHEN "01" => leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_q <= leftShiftStage0Idx1_uid116_fixedPointX_uid41_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_q <= leftShiftStage0Idx2_uid119_fixedPointX_uid41_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_q <= leftShiftStage0Idx3_uid120_fixedPointX_uid41_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage024dto0_uid130_fixedPointX_uid41_fpSinPiTest(BITSELECT,129)@1
    LeftShiftStage024dto0_uid130_fixedPointX_uid41_fpSinPiTest_in <= leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_q(24 downto 0);
    LeftShiftStage024dto0_uid130_fixedPointX_uid41_fpSinPiTest_b <= LeftShiftStage024dto0_uid130_fixedPointX_uid41_fpSinPiTest_in(24 downto 0);

	--ld_LeftShiftStage024dto0_uid130_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx3_uid131_fixedPointX_uid41_fpSinPiTest_b(DELAY,403)@1
    ld_LeftShiftStage024dto0_uid130_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx3_uid131_fixedPointX_uid41_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 25, depth => 1 )
    PORT MAP ( xin => LeftShiftStage024dto0_uid130_fixedPointX_uid41_fpSinPiTest_b, xout => ld_LeftShiftStage024dto0_uid130_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx3_uid131_fixedPointX_uid41_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx3Pad12_uid129_fixedPointX_uid41_fpSinPiTest(CONSTANT,128)
    leftShiftStage1Idx3Pad12_uid129_fixedPointX_uid41_fpSinPiTest_q <= "000000000000";

	--leftShiftStage1Idx3_uid131_fixedPointX_uid41_fpSinPiTest(BITJOIN,130)@2
    leftShiftStage1Idx3_uid131_fixedPointX_uid41_fpSinPiTest_q <= ld_LeftShiftStage024dto0_uid130_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx3_uid131_fixedPointX_uid41_fpSinPiTest_b_q & leftShiftStage1Idx3Pad12_uid129_fixedPointX_uid41_fpSinPiTest_q;

	--LeftShiftStage028dto0_uid127_fixedPointX_uid41_fpSinPiTest(BITSELECT,126)@1
    LeftShiftStage028dto0_uid127_fixedPointX_uid41_fpSinPiTest_in <= leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_q(28 downto 0);
    LeftShiftStage028dto0_uid127_fixedPointX_uid41_fpSinPiTest_b <= LeftShiftStage028dto0_uid127_fixedPointX_uid41_fpSinPiTest_in(28 downto 0);

	--ld_LeftShiftStage028dto0_uid127_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx2_uid128_fixedPointX_uid41_fpSinPiTest_b(DELAY,401)@1
    ld_LeftShiftStage028dto0_uid127_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx2_uid128_fixedPointX_uid41_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 29, depth => 1 )
    PORT MAP ( xin => LeftShiftStage028dto0_uid127_fixedPointX_uid41_fpSinPiTest_b, xout => ld_LeftShiftStage028dto0_uid127_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx2_uid128_fixedPointX_uid41_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--cstAllZWE_uid16_fpSinPiTest(CONSTANT,15)
    cstAllZWE_uid16_fpSinPiTest_q <= "00000000";

	--leftShiftStage1Idx2_uid128_fixedPointX_uid41_fpSinPiTest(BITJOIN,127)@2
    leftShiftStage1Idx2_uid128_fixedPointX_uid41_fpSinPiTest_q <= ld_LeftShiftStage028dto0_uid127_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx2_uid128_fixedPointX_uid41_fpSinPiTest_b_q & cstAllZWE_uid16_fpSinPiTest_q;

	--LeftShiftStage032dto0_uid124_fixedPointX_uid41_fpSinPiTest(BITSELECT,123)@1
    LeftShiftStage032dto0_uid124_fixedPointX_uid41_fpSinPiTest_in <= leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_q(32 downto 0);
    LeftShiftStage032dto0_uid124_fixedPointX_uid41_fpSinPiTest_b <= LeftShiftStage032dto0_uid124_fixedPointX_uid41_fpSinPiTest_in(32 downto 0);

	--ld_LeftShiftStage032dto0_uid124_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx1_uid125_fixedPointX_uid41_fpSinPiTest_b(DELAY,399)@1
    ld_LeftShiftStage032dto0_uid124_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx1_uid125_fixedPointX_uid41_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 33, depth => 1 )
    PORT MAP ( xin => LeftShiftStage032dto0_uid124_fixedPointX_uid41_fpSinPiTest_b, xout => ld_LeftShiftStage032dto0_uid124_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx1_uid125_fixedPointX_uid41_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx1Pad4_uid123_fixedPointX_uid41_fpSinPiTest(CONSTANT,122)
    leftShiftStage1Idx1Pad4_uid123_fixedPointX_uid41_fpSinPiTest_q <= "0000";

	--leftShiftStage1Idx1_uid125_fixedPointX_uid41_fpSinPiTest(BITJOIN,124)@2
    leftShiftStage1Idx1_uid125_fixedPointX_uid41_fpSinPiTest_q <= ld_LeftShiftStage032dto0_uid124_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage1Idx1_uid125_fixedPointX_uid41_fpSinPiTest_b_q & leftShiftStage1Idx1Pad4_uid123_fixedPointX_uid41_fpSinPiTest_q;

	--reg_leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_2(REG,239)@1
    reg_leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_2_q <= leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest(BITSELECT,131)@0
    leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_in <= fxpShifterBits_uid40_fpSinPiTest_b(3 downto 0);
    leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_b <= leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_in(3 downto 2);

	--ld_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_b_to_reg_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_1_a(DELAY,516)@0
    ld_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_b_to_reg_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_b, xout => ld_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_b_to_reg_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_1(REG,238)@1
    reg_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_1_q <= ld_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_b_to_reg_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest(MUX,132)@2
    leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_s <= reg_leftShiftStageSel3Dto2_uid132_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_1_q;
    leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest: PROCESS (leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_s, en, reg_leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_2_q, leftShiftStage1Idx1_uid125_fixedPointX_uid41_fpSinPiTest_q, leftShiftStage1Idx2_uid128_fixedPointX_uid41_fpSinPiTest_q, leftShiftStage1Idx3_uid131_fixedPointX_uid41_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_q <= reg_leftShiftStage0_uid122_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_q <= leftShiftStage1Idx1_uid125_fixedPointX_uid41_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_q <= leftShiftStage1Idx2_uid128_fixedPointX_uid41_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_q <= leftShiftStage1Idx3_uid131_fixedPointX_uid41_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage133dto0_uid141_fixedPointX_uid41_fpSinPiTest(BITSELECT,140)@2
    LeftShiftStage133dto0_uid141_fixedPointX_uid41_fpSinPiTest_in <= leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_q(33 downto 0);
    LeftShiftStage133dto0_uid141_fixedPointX_uid41_fpSinPiTest_b <= LeftShiftStage133dto0_uid141_fixedPointX_uid41_fpSinPiTest_in(33 downto 0);

	--ld_LeftShiftStage133dto0_uid141_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx3_uid142_fixedPointX_uid41_fpSinPiTest_b(DELAY,415)@2
    ld_LeftShiftStage133dto0_uid141_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx3_uid142_fixedPointX_uid41_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 34, depth => 1 )
    PORT MAP ( xin => LeftShiftStage133dto0_uid141_fixedPointX_uid41_fpSinPiTest_b, xout => ld_LeftShiftStage133dto0_uid141_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx3_uid142_fixedPointX_uid41_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx3Pad3_uid140_fixedPointX_uid41_fpSinPiTest(CONSTANT,139)
    leftShiftStage2Idx3Pad3_uid140_fixedPointX_uid41_fpSinPiTest_q <= "000";

	--leftShiftStage2Idx3_uid142_fixedPointX_uid41_fpSinPiTest(BITJOIN,141)@3
    leftShiftStage2Idx3_uid142_fixedPointX_uid41_fpSinPiTest_q <= ld_LeftShiftStage133dto0_uid141_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx3_uid142_fixedPointX_uid41_fpSinPiTest_b_q & leftShiftStage2Idx3Pad3_uid140_fixedPointX_uid41_fpSinPiTest_q;

	--LeftShiftStage134dto0_uid138_fixedPointX_uid41_fpSinPiTest(BITSELECT,137)@2
    LeftShiftStage134dto0_uid138_fixedPointX_uid41_fpSinPiTest_in <= leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_q(34 downto 0);
    LeftShiftStage134dto0_uid138_fixedPointX_uid41_fpSinPiTest_b <= LeftShiftStage134dto0_uid138_fixedPointX_uid41_fpSinPiTest_in(34 downto 0);

	--ld_LeftShiftStage134dto0_uid138_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx2_uid139_fixedPointX_uid41_fpSinPiTest_b(DELAY,413)@2
    ld_LeftShiftStage134dto0_uid138_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx2_uid139_fixedPointX_uid41_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 35, depth => 1 )
    PORT MAP ( xin => LeftShiftStage134dto0_uid138_fixedPointX_uid41_fpSinPiTest_b, xout => ld_LeftShiftStage134dto0_uid138_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx2_uid139_fixedPointX_uid41_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx2Pad2_uid137_fixedPointX_uid41_fpSinPiTest(CONSTANT,136)
    leftShiftStage2Idx2Pad2_uid137_fixedPointX_uid41_fpSinPiTest_q <= "00";

	--leftShiftStage2Idx2_uid139_fixedPointX_uid41_fpSinPiTest(BITJOIN,138)@3
    leftShiftStage2Idx2_uid139_fixedPointX_uid41_fpSinPiTest_q <= ld_LeftShiftStage134dto0_uid138_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx2_uid139_fixedPointX_uid41_fpSinPiTest_b_q & leftShiftStage2Idx2Pad2_uid137_fixedPointX_uid41_fpSinPiTest_q;

	--LeftShiftStage135dto0_uid135_fixedPointX_uid41_fpSinPiTest(BITSELECT,134)@2
    LeftShiftStage135dto0_uid135_fixedPointX_uid41_fpSinPiTest_in <= leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_q(35 downto 0);
    LeftShiftStage135dto0_uid135_fixedPointX_uid41_fpSinPiTest_b <= LeftShiftStage135dto0_uid135_fixedPointX_uid41_fpSinPiTest_in(35 downto 0);

	--ld_LeftShiftStage135dto0_uid135_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx1_uid136_fixedPointX_uid41_fpSinPiTest_b(DELAY,411)@2
    ld_LeftShiftStage135dto0_uid135_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx1_uid136_fixedPointX_uid41_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 36, depth => 1 )
    PORT MAP ( xin => LeftShiftStage135dto0_uid135_fixedPointX_uid41_fpSinPiTest_b, xout => ld_LeftShiftStage135dto0_uid135_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx1_uid136_fixedPointX_uid41_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--GND(CONSTANT,0)
    GND_q <= "0";

	--leftShiftStage2Idx1_uid136_fixedPointX_uid41_fpSinPiTest(BITJOIN,135)@3
    leftShiftStage2Idx1_uid136_fixedPointX_uid41_fpSinPiTest_q <= ld_LeftShiftStage135dto0_uid135_fixedPointX_uid41_fpSinPiTest_b_to_leftShiftStage2Idx1_uid136_fixedPointX_uid41_fpSinPiTest_b_q & GND_q;

	--reg_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_2(REG,241)@2
    reg_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_2_q <= leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest(BITSELECT,142)@0
    leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_in <= fxpShifterBits_uid40_fpSinPiTest_b(1 downto 0);
    leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_b <= leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_in(1 downto 0);

	--ld_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_b_to_reg_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_1_a(DELAY,518)@0
    ld_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_b_to_reg_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 2 )
    PORT MAP ( xin => leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_b, xout => ld_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_b_to_reg_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_1(REG,240)@2
    reg_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_1_q <= ld_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_b_to_reg_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest(MUX,143)@3
    leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_s <= reg_leftShiftStageSel1Dto0_uid143_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_1_q;
    leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest: PROCESS (leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_s, en, reg_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_2_q, leftShiftStage2Idx1_uid136_fixedPointX_uid41_fpSinPiTest_q, leftShiftStage2Idx2_uid139_fixedPointX_uid41_fpSinPiTest_q, leftShiftStage2Idx3_uid142_fixedPointX_uid41_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_q <= reg_leftShiftStage1_uid133_fixedPointX_uid41_fpSinPiTest_0_to_leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_2_q;
                  WHEN "01" => leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_q <= leftShiftStage2Idx1_uid136_fixedPointX_uid41_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_q <= leftShiftStage2Idx2_uid139_fixedPointX_uid41_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_q <= leftShiftStage2Idx3_uid142_fixedPointX_uid41_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--intXParity_uid42_fpSinPiTest(BITSELECT,41)@3
    intXParity_uid42_fpSinPiTest_in <= leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_q;
    intXParity_uid42_fpSinPiTest_b <= intXParity_uid42_fpSinPiTest_in(36 downto 36);

	--ld_intXParity_uid42_fpSinPiTest_b_to_signComp_uid107_fpSinPiTest_c(DELAY,380)@3
    ld_intXParity_uid42_fpSinPiTest_b_to_signComp_uid107_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => intXParity_uid42_fpSinPiTest_b, xout => ld_intXParity_uid42_fpSinPiTest_b_to_signComp_uid107_fpSinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--biasM1_uid31_fpSinPiTest(CONSTANT,30)
    biasM1_uid31_fpSinPiTest_q <= "01111110";

	--xFrac_uid32_fpSinPiTest(COMPARE,31)@0
    xFrac_uid32_fpSinPiTest_cin <= GND_q;
    xFrac_uid32_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & biasM1_uid31_fpSinPiTest_q) & '0';
    xFrac_uid32_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & expX_uid6_fpSinPiTest_b) & xFrac_uid32_fpSinPiTest_cin(0);
            xFrac_uid32_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xFrac_uid32_fpSinPiTest_a) - UNSIGNED(xFrac_uid32_fpSinPiTest_b));
    xFrac_uid32_fpSinPiTest_n(0) <= not xFrac_uid32_fpSinPiTest_o(10);


	--ld_xFrac_uid32_fpSinPiTest_n_to_InvXFrac_uid105_fpSinPiTest_a(DELAY,376)@0
    ld_xFrac_uid32_fpSinPiTest_n_to_InvXFrac_uid105_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => xFrac_uid32_fpSinPiTest_n, xout => ld_xFrac_uid32_fpSinPiTest_n_to_InvXFrac_uid105_fpSinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvXFrac_uid105_fpSinPiTest(LOGICAL,104)@4
    InvXFrac_uid105_fpSinPiTest_a <= ld_xFrac_uid32_fpSinPiTest_n_to_InvXFrac_uid105_fpSinPiTest_a_q;
    InvXFrac_uid105_fpSinPiTest_q <= not InvXFrac_uid105_fpSinPiTest_a;

	--biasMwShift_uid33_fpSinPiTest(CONSTANT,32)
    biasMwShift_uid33_fpSinPiTest_q <= "01110011";

	--sinXIsX_uid34_fpSinPiTest(COMPARE,33)@0
    sinXIsX_uid34_fpSinPiTest_cin <= GND_q;
    sinXIsX_uid34_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & expX_uid6_fpSinPiTest_b) & '0';
    sinXIsX_uid34_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & biasMwShift_uid33_fpSinPiTest_q) & sinXIsX_uid34_fpSinPiTest_cin(0);
            sinXIsX_uid34_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(sinXIsX_uid34_fpSinPiTest_a) - UNSIGNED(sinXIsX_uid34_fpSinPiTest_b));
    sinXIsX_uid34_fpSinPiTest_c(0) <= sinXIsX_uid34_fpSinPiTest_o(10);


	--ld_sinXIsX_uid34_fpSinPiTest_c_to_InvSinXIsX_uid84_fpSinPiTest_a(DELAY,343)@0
    ld_sinXIsX_uid34_fpSinPiTest_c_to_InvSinXIsX_uid84_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => sinXIsX_uid34_fpSinPiTest_c, xout => ld_sinXIsX_uid34_fpSinPiTest_c_to_InvSinXIsX_uid84_fpSinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvSinXIsX_uid84_fpSinPiTest(LOGICAL,83)@4
    InvSinXIsX_uid84_fpSinPiTest_a <= ld_sinXIsX_uid34_fpSinPiTest_c_to_InvSinXIsX_uid84_fpSinPiTest_a_q;
    InvSinXIsX_uid84_fpSinPiTest_q <= not InvSinXIsX_uid84_fpSinPiTest_a;

	--y_uid43_fpSinPiTest(BITSELECT,42)@3
    y_uid43_fpSinPiTest_in <= leftShiftStage2_uid144_fixedPointX_uid41_fpSinPiTest_q(35 downto 0);
    y_uid43_fpSinPiTest_b <= y_uid43_fpSinPiTest_in(35 downto 0);

	--reg_y_uid43_fpSinPiTest_0_to_yIsZero_uid47_fpSinPiTest_1(REG,242)@3
    reg_y_uid43_fpSinPiTest_0_to_yIsZero_uid47_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_y_uid43_fpSinPiTest_0_to_yIsZero_uid47_fpSinPiTest_1_q <= "000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_y_uid43_fpSinPiTest_0_to_yIsZero_uid47_fpSinPiTest_1_q <= y_uid43_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--yIsZero_uid44_fpSinPiTest(LOGICAL,43)@4
    yIsZero_uid44_fpSinPiTest_a <= reg_y_uid43_fpSinPiTest_0_to_yIsZero_uid47_fpSinPiTest_1_q;
    yIsZero_uid44_fpSinPiTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000000" & GND_q);
    yIsZero_uid44_fpSinPiTest_q <= "1" when yIsZero_uid44_fpSinPiTest_a = yIsZero_uid44_fpSinPiTest_b else "0";

	--yZSinXNX_uid85_fpSinPiTest(LOGICAL,84)@4
    yZSinXNX_uid85_fpSinPiTest_a <= yIsZero_uid44_fpSinPiTest_q;
    yZSinXNX_uid85_fpSinPiTest_b <= InvSinXIsX_uid84_fpSinPiTest_q;
    yZSinXNX_uid85_fpSinPiTest_q <= yZSinXNX_uid85_fpSinPiTest_a and yZSinXNX_uid85_fpSinPiTest_b;

	--cstBiasPwF_uid12_fpSinPiTest(CONSTANT,11)
    cstBiasPwF_uid12_fpSinPiTest_q <= "10010110";

	--xIntExp_uid30_fpSinPiTest(COMPARE,29)@0
    xIntExp_uid30_fpSinPiTest_cin <= GND_q;
    xIntExp_uid30_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & cstBiasPwF_uid12_fpSinPiTest_q) & '0';
    xIntExp_uid30_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & expX_uid6_fpSinPiTest_b) & xIntExp_uid30_fpSinPiTest_cin(0);
            xIntExp_uid30_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xIntExp_uid30_fpSinPiTest_a) - UNSIGNED(xIntExp_uid30_fpSinPiTest_b));
    xIntExp_uid30_fpSinPiTest_c(0) <= xIntExp_uid30_fpSinPiTest_o(10);


	--ld_xIntExp_uid30_fpSinPiTest_c_to_xIntYz_uid86_fpSinPiTest_a(DELAY,346)@0
    ld_xIntExp_uid30_fpSinPiTest_c_to_xIntYz_uid86_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => xIntExp_uid30_fpSinPiTest_c, xout => ld_xIntExp_uid30_fpSinPiTest_c_to_xIntYz_uid86_fpSinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--xIntYz_uid86_fpSinPiTest(LOGICAL,85)@4
    xIntYz_uid86_fpSinPiTest_a <= ld_xIntExp_uid30_fpSinPiTest_c_to_xIntYz_uid86_fpSinPiTest_a_q;
    xIntYz_uid86_fpSinPiTest_b <= yZSinXNX_uid85_fpSinPiTest_q;
    xIntYz_uid86_fpSinPiTest_q <= xIntYz_uid86_fpSinPiTest_a or xIntYz_uid86_fpSinPiTest_b;

	--cstAllZWF_uid10_fpSinPiTest(CONSTANT,9)
    cstAllZWF_uid10_fpSinPiTest_q <= "00000000000000000000000";

	--fracXIsZero_uid22_fpSinPiTest(LOGICAL,21)@0
    fracXIsZero_uid22_fpSinPiTest_a <= fracX_uid7_fpSinPiTest_b;
    fracXIsZero_uid22_fpSinPiTest_b <= cstAllZWF_uid10_fpSinPiTest_q;
    fracXIsZero_uid22_fpSinPiTest_q <= "1" when fracXIsZero_uid22_fpSinPiTest_a = fracXIsZero_uid22_fpSinPiTest_b else "0";

	--InvFracXIsZero_uid24_fpSinPiTest(LOGICAL,23)@0
    InvFracXIsZero_uid24_fpSinPiTest_a <= fracXIsZero_uid22_fpSinPiTest_q;
    InvFracXIsZero_uid24_fpSinPiTest_q <= not InvFracXIsZero_uid24_fpSinPiTest_a;

	--cstAllOWE_uid9_fpSinPiTest(CONSTANT,8)
    cstAllOWE_uid9_fpSinPiTest_q <= "11111111";

	--expXIsMax_uid20_fpSinPiTest(LOGICAL,19)@0
    expXIsMax_uid20_fpSinPiTest_a <= expX_uid6_fpSinPiTest_b;
    expXIsMax_uid20_fpSinPiTest_b <= cstAllOWE_uid9_fpSinPiTest_q;
    expXIsMax_uid20_fpSinPiTest_q <= "1" when expXIsMax_uid20_fpSinPiTest_a = expXIsMax_uid20_fpSinPiTest_b else "0";

	--exc_N_uid25_fpSinPiTest(LOGICAL,24)@0
    exc_N_uid25_fpSinPiTest_a <= expXIsMax_uid20_fpSinPiTest_q;
    exc_N_uid25_fpSinPiTest_b <= InvFracXIsZero_uid24_fpSinPiTest_q;
    exc_N_uid25_fpSinPiTest_q <= exc_N_uid25_fpSinPiTest_a and exc_N_uid25_fpSinPiTest_b;

	--InvExc_N_uid26_fpSinPiTest(LOGICAL,25)@0
    InvExc_N_uid26_fpSinPiTest_a <= exc_N_uid25_fpSinPiTest_q;
    InvExc_N_uid26_fpSinPiTest_q <= not InvExc_N_uid26_fpSinPiTest_a;

	--exc_I_uid23_fpSinPiTest(LOGICAL,22)@0
    exc_I_uid23_fpSinPiTest_a <= expXIsMax_uid20_fpSinPiTest_q;
    exc_I_uid23_fpSinPiTest_b <= fracXIsZero_uid22_fpSinPiTest_q;
    exc_I_uid23_fpSinPiTest_q <= exc_I_uid23_fpSinPiTest_a and exc_I_uid23_fpSinPiTest_b;

	--InvExc_I_uid27_fpSinPiTest(LOGICAL,26)@0
    InvExc_I_uid27_fpSinPiTest_a <= exc_I_uid23_fpSinPiTest_q;
    InvExc_I_uid27_fpSinPiTest_q <= not InvExc_I_uid27_fpSinPiTest_a;

	--expXIsZero_uid18_fpSinPiTest(LOGICAL,17)@0
    expXIsZero_uid18_fpSinPiTest_a <= expX_uid6_fpSinPiTest_b;
    expXIsZero_uid18_fpSinPiTest_b <= cstAllZWE_uid16_fpSinPiTest_q;
    expXIsZero_uid18_fpSinPiTest_q <= "1" when expXIsZero_uid18_fpSinPiTest_a = expXIsZero_uid18_fpSinPiTest_b else "0";

	--InvExpXIsZero_uid28_fpSinPiTest(LOGICAL,27)@0
    InvExpXIsZero_uid28_fpSinPiTest_a <= expXIsZero_uid18_fpSinPiTest_q;
    InvExpXIsZero_uid28_fpSinPiTest_q <= not InvExpXIsZero_uid28_fpSinPiTest_a;

	--exc_R_uid29_fpSinPiTest(LOGICAL,28)@0
    exc_R_uid29_fpSinPiTest_a <= InvExpXIsZero_uid28_fpSinPiTest_q;
    exc_R_uid29_fpSinPiTest_b <= InvExc_I_uid27_fpSinPiTest_q;
    exc_R_uid29_fpSinPiTest_c <= InvExc_N_uid26_fpSinPiTest_q;
    exc_R_uid29_fpSinPiTest_q <= exc_R_uid29_fpSinPiTest_a and exc_R_uid29_fpSinPiTest_b and exc_R_uid29_fpSinPiTest_c;

	--ld_exc_R_uid29_fpSinPiTest_q_to_xIsInt_uid87_fpSinPiTest_a(DELAY,348)@0
    ld_exc_R_uid29_fpSinPiTest_q_to_xIsInt_uid87_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => exc_R_uid29_fpSinPiTest_q, xout => ld_exc_R_uid29_fpSinPiTest_q_to_xIsInt_uid87_fpSinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--xIsInt_uid87_fpSinPiTest(LOGICAL,86)@4
    xIsInt_uid87_fpSinPiTest_a <= ld_exc_R_uid29_fpSinPiTest_q_to_xIsInt_uid87_fpSinPiTest_a_q;
    xIsInt_uid87_fpSinPiTest_b <= xIntYz_uid86_fpSinPiTest_q;
    xIsInt_uid87_fpSinPiTest_q <= xIsInt_uid87_fpSinPiTest_a and xIsInt_uid87_fpSinPiTest_b;

	--InvXIsInt_uid106_fpSinPiTest(LOGICAL,105)@4
    InvXIsInt_uid106_fpSinPiTest_a <= xIsInt_uid87_fpSinPiTest_q;
    InvXIsInt_uid106_fpSinPiTest_q <= not InvXIsInt_uid106_fpSinPiTest_a;

	--signComp_uid107_fpSinPiTest(LOGICAL,106)@4
    signComp_uid107_fpSinPiTest_a <= InvXIsInt_uid106_fpSinPiTest_q;
    signComp_uid107_fpSinPiTest_b <= InvXFrac_uid105_fpSinPiTest_q;
    signComp_uid107_fpSinPiTest_c <= ld_intXParity_uid42_fpSinPiTest_b_to_signComp_uid107_fpSinPiTest_c_q;
    signComp_uid107_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signComp_uid107_fpSinPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            signComp_uid107_fpSinPiTest_q <= signComp_uid107_fpSinPiTest_a and signComp_uid107_fpSinPiTest_b and signComp_uid107_fpSinPiTest_c;
        END IF;
        END IF;
    END PROCESS;



	--InvYIsZero_uid108_fpSinPiTest(LOGICAL,107)@4
    InvYIsZero_uid108_fpSinPiTest_a <= yIsZero_uid44_fpSinPiTest_q;
    InvYIsZero_uid108_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvYIsZero_uid108_fpSinPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvYIsZero_uid108_fpSinPiTest_q <= not InvYIsZero_uid108_fpSinPiTest_a;
        END IF;
    END PROCESS;



	--yZSC_uid109_fpSinPiTest(LOGICAL,108)@5
    yZSC_uid109_fpSinPiTest_a <= InvYIsZero_uid108_fpSinPiTest_q;
    yZSC_uid109_fpSinPiTest_b <= signComp_uid107_fpSinPiTest_q;
    yZSC_uid109_fpSinPiTest_q <= yZSC_uid109_fpSinPiTest_a and yZSC_uid109_fpSinPiTest_b;

	--signX_uid8_fpSinPiTest(BITSELECT,7)@0
    signX_uid8_fpSinPiTest_in <= a;
    signX_uid8_fpSinPiTest_b <= signX_uid8_fpSinPiTest_in(31 downto 31);

	--ld_signX_uid8_fpSinPiTest_b_to_signR_uid110_fpSinPiTest_a(DELAY,384)@0
    ld_signX_uid8_fpSinPiTest_b_to_signR_uid110_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => signX_uid8_fpSinPiTest_b, xout => ld_signX_uid8_fpSinPiTest_b_to_signR_uid110_fpSinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signR_uid110_fpSinPiTest(LOGICAL,109)@5
    signR_uid110_fpSinPiTest_a <= ld_signX_uid8_fpSinPiTest_b_to_signR_uid110_fpSinPiTest_a_q;
    signR_uid110_fpSinPiTest_b <= yZSC_uid109_fpSinPiTest_q;
    signR_uid110_fpSinPiTest_q <= signR_uid110_fpSinPiTest_a xor signR_uid110_fpSinPiTest_b;

	--ld_signR_uid110_fpSinPiTest_q_to_R_uid111_fpSinPiTest_c(DELAY,388)@5
    ld_signR_uid110_fpSinPiTest_q_to_R_uid111_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 15 )
    PORT MAP ( xin => signR_uid110_fpSinPiTest_q, xout => ld_signR_uid110_fpSinPiTest_q_to_R_uid111_fpSinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--cstBias_uid11_fpSinPiTest(CONSTANT,10)
    cstBias_uid11_fpSinPiTest_q <= "01111111";

	--piwFP2_uid71_fpSinPiTest(CONSTANT,70)
    piwFP2_uid71_fpSinPiTest_q <= "1100100100001111110110101";

	--cOne_uid48_fpSinPiTest(CONSTANT,47)
    cOne_uid48_fpSinPiTest_q <= "1000000000000000000000000000000000000";

	--oneMinusY_uid49_fpSinPiTest(SUB,48)@4
    oneMinusY_uid49_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & cOne_uid48_fpSinPiTest_q);
    oneMinusY_uid49_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & reg_y_uid43_fpSinPiTest_0_to_yIsZero_uid47_fpSinPiTest_1_q);
            oneMinusY_uid49_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oneMinusY_uid49_fpSinPiTest_a) - UNSIGNED(oneMinusY_uid49_fpSinPiTest_b));
    oneMinusY_uid49_fpSinPiTest_q <= oneMinusY_uid49_fpSinPiTest_o(37 downto 0);


	--oMyBottom_uid51_fpSinPiTest(BITSELECT,50)@4
    oMyBottom_uid51_fpSinPiTest_in <= oneMinusY_uid49_fpSinPiTest_q(34 downto 0);
    oMyBottom_uid51_fpSinPiTest_b <= oMyBottom_uid51_fpSinPiTest_in(34 downto 0);

	--reg_oMyBottom_uid51_fpSinPiTest_0_to_z_uid53_fpSinPiTest_3(REG,249)@4
    reg_oMyBottom_uid51_fpSinPiTest_0_to_z_uid53_fpSinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oMyBottom_uid51_fpSinPiTest_0_to_z_uid53_fpSinPiTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oMyBottom_uid51_fpSinPiTest_0_to_z_uid53_fpSinPiTest_3_q <= oMyBottom_uid51_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oMyBottom_uid51_fpSinPiTest_0_to_z_uid53_fpSinPiTest_3_q_to_z_uid53_fpSinPiTest_d(DELAY,310)@5
    ld_reg_oMyBottom_uid51_fpSinPiTest_0_to_z_uid53_fpSinPiTest_3_q_to_z_uid53_fpSinPiTest_d : dspba_delay
    GENERIC MAP ( width => 35, depth => 1 )
    PORT MAP ( xin => reg_oMyBottom_uid51_fpSinPiTest_0_to_z_uid53_fpSinPiTest_3_q, xout => ld_reg_oMyBottom_uid51_fpSinPiTest_0_to_z_uid53_fpSinPiTest_3_q_to_z_uid53_fpSinPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--yBottom_uid52_fpSinPiTest(BITSELECT,51)@3
    yBottom_uid52_fpSinPiTest_in <= y_uid43_fpSinPiTest_b(34 downto 0);
    yBottom_uid52_fpSinPiTest_b <= yBottom_uid52_fpSinPiTest_in(34 downto 0);

	--ld_yBottom_uid52_fpSinPiTest_b_to_reg_yBottom_uid52_fpSinPiTest_0_to_z_uid53_fpSinPiTest_2_a(DELAY,526)@3
    ld_yBottom_uid52_fpSinPiTest_b_to_reg_yBottom_uid52_fpSinPiTest_0_to_z_uid53_fpSinPiTest_2_a : dspba_delay
    GENERIC MAP ( width => 35, depth => 2 )
    PORT MAP ( xin => yBottom_uid52_fpSinPiTest_b, xout => ld_yBottom_uid52_fpSinPiTest_b_to_reg_yBottom_uid52_fpSinPiTest_0_to_z_uid53_fpSinPiTest_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yBottom_uid52_fpSinPiTest_0_to_z_uid53_fpSinPiTest_2(REG,248)@5
    reg_yBottom_uid52_fpSinPiTest_0_to_z_uid53_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yBottom_uid52_fpSinPiTest_0_to_z_uid53_fpSinPiTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yBottom_uid52_fpSinPiTest_0_to_z_uid53_fpSinPiTest_2_q <= ld_yBottom_uid52_fpSinPiTest_b_to_reg_yBottom_uid52_fpSinPiTest_0_to_z_uid53_fpSinPiTest_2_a_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_y_uid43_fpSinPiTest_b_to_cmpYToOneMinusY_uid50_fpSinPiTest_b(DELAY,305)@3
    ld_y_uid43_fpSinPiTest_b_to_cmpYToOneMinusY_uid50_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 36, depth => 2 )
    PORT MAP ( xin => y_uid43_fpSinPiTest_b, xout => ld_y_uid43_fpSinPiTest_b_to_cmpYToOneMinusY_uid50_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--reg_oneMinusY_uid49_fpSinPiTest_0_to_cmpYToOneMinusY_uid50_fpSinPiTest_0(REG,247)@4
    reg_oneMinusY_uid49_fpSinPiTest_0_to_cmpYToOneMinusY_uid50_fpSinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oneMinusY_uid49_fpSinPiTest_0_to_cmpYToOneMinusY_uid50_fpSinPiTest_0_q <= "00000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oneMinusY_uid49_fpSinPiTest_0_to_cmpYToOneMinusY_uid50_fpSinPiTest_0_q <= oneMinusY_uid49_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--cmpYToOneMinusY_uid50_fpSinPiTest(COMPARE,49)@5
    cmpYToOneMinusY_uid50_fpSinPiTest_cin <= GND_q;
    cmpYToOneMinusY_uid50_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & reg_oneMinusY_uid49_fpSinPiTest_0_to_cmpYToOneMinusY_uid50_fpSinPiTest_0_q) & '0';
    cmpYToOneMinusY_uid50_fpSinPiTest_b <= STD_LOGIC_VECTOR("0000" & ld_y_uid43_fpSinPiTest_b_to_cmpYToOneMinusY_uid50_fpSinPiTest_b_q) & cmpYToOneMinusY_uid50_fpSinPiTest_cin(0);
    cmpYToOneMinusY_uid50_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            cmpYToOneMinusY_uid50_fpSinPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                cmpYToOneMinusY_uid50_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(cmpYToOneMinusY_uid50_fpSinPiTest_a) - UNSIGNED(cmpYToOneMinusY_uid50_fpSinPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    cmpYToOneMinusY_uid50_fpSinPiTest_c(0) <= cmpYToOneMinusY_uid50_fpSinPiTest_o(40);


	--z_uid53_fpSinPiTest(MUX,52)@6
    z_uid53_fpSinPiTest_s <= cmpYToOneMinusY_uid50_fpSinPiTest_c;
    z_uid53_fpSinPiTest: PROCESS (z_uid53_fpSinPiTest_s, en, reg_yBottom_uid52_fpSinPiTest_0_to_z_uid53_fpSinPiTest_2_q, ld_reg_oMyBottom_uid51_fpSinPiTest_0_to_z_uid53_fpSinPiTest_3_q_to_z_uid53_fpSinPiTest_d_q)
    BEGIN
            CASE z_uid53_fpSinPiTest_s IS
                  WHEN "0" => z_uid53_fpSinPiTest_q <= reg_yBottom_uid52_fpSinPiTest_0_to_z_uid53_fpSinPiTest_2_q;
                  WHEN "1" => z_uid53_fpSinPiTest_q <= ld_reg_oMyBottom_uid51_fpSinPiTest_0_to_z_uid53_fpSinPiTest_3_q_to_z_uid53_fpSinPiTest_d_q;
                  WHEN OTHERS => z_uid53_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--zAddr_uid67_fpSinPiTest(BITSELECT,66)@6
    zAddr_uid67_fpSinPiTest_in <= z_uid53_fpSinPiTest_q;
    zAddr_uid67_fpSinPiTest_b <= zAddr_uid67_fpSinPiTest_in(34 downto 28);

	--reg_zAddr_uid67_fpSinPiTest_0_to_memoryC2_uid218_sinPiZTableGenerator_0(REG,261)@6
    reg_zAddr_uid67_fpSinPiTest_0_to_memoryC2_uid218_sinPiZTableGenerator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid67_fpSinPiTest_0_to_memoryC2_uid218_sinPiZTableGenerator_0_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zAddr_uid67_fpSinPiTest_0_to_memoryC2_uid218_sinPiZTableGenerator_0_q <= zAddr_uid67_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid218_sinPiZTableGenerator(LOOKUP,217)@7
    memoryC2_uid218_sinPiZTableGenerator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC2_uid218_sinPiZTableGenerator_q <= "10101101010011";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_zAddr_uid67_fpSinPiTest_0_to_memoryC2_uid218_sinPiZTableGenerator_0_q) IS
                WHEN "0000000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101101010011";
                WHEN "0000001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101101010100";
                WHEN "0000010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101101010111";
                WHEN "0000011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101101011001";
                WHEN "0000100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101101011011";
                WHEN "0000101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101101011100";
                WHEN "0000110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101101011111";
                WHEN "0000111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101101100010";
                WHEN "0001000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101101100110";
                WHEN "0001001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101101101011";
                WHEN "0001010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101101110000";
                WHEN "0001011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101101110101";
                WHEN "0001100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101101111011";
                WHEN "0001101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101110000000";
                WHEN "0001110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101110000111";
                WHEN "0001111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101110001110";
                WHEN "0010000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101110010011";
                WHEN "0010001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101110011110";
                WHEN "0010010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101110100110";
                WHEN "0010011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101110101111";
                WHEN "0010100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101110111000";
                WHEN "0010101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101111000011";
                WHEN "0010110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101111001100";
                WHEN "0010111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101111010111";
                WHEN "0011000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101111100011";
                WHEN "0011001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101111101110";
                WHEN "0011010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10101111111011";
                WHEN "0011011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110000001001";
                WHEN "0011100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110000010101";
                WHEN "0011101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110000100000";
                WHEN "0011110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110000110001";
                WHEN "0011111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110001000000";
                WHEN "0100000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110001001101";
                WHEN "0100001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110001011110";
                WHEN "0100010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110001101100";
                WHEN "0100011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110001111111";
                WHEN "0100100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110010001111";
                WHEN "0100101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110010100001";
                WHEN "0100110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110010110011";
                WHEN "0100111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110011000101";
                WHEN "0101000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110011010110";
                WHEN "0101001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110011101011";
                WHEN "0101010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110011111111";
                WHEN "0101011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110100010010";
                WHEN "0101100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110100100101";
                WHEN "0101101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110100111011";
                WHEN "0101110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110101001110";
                WHEN "0101111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110101100111";
                WHEN "0110000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110101111100";
                WHEN "0110001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110110010010";
                WHEN "0110010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110110100110";
                WHEN "0110011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110111000000";
                WHEN "0110100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110111010101";
                WHEN "0110101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10110111110000";
                WHEN "0110110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111000000110";
                WHEN "0110111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111000100010";
                WHEN "0111000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111000111001";
                WHEN "0111001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111001010100";
                WHEN "0111010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111001101111";
                WHEN "0111011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111010001001";
                WHEN "0111100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111010100011";
                WHEN "0111101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111010111100";
                WHEN "0111110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111011011001";
                WHEN "0111111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111011110111";
                WHEN "1000000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111100010100";
                WHEN "1000001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111100110001";
                WHEN "1000010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111101001101";
                WHEN "1000011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111101101010";
                WHEN "1000100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111110001000";
                WHEN "1000101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111110100101";
                WHEN "1000110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111111000101";
                WHEN "1000111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "10111111100011";
                WHEN "1001000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000000000011";
                WHEN "1001001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000000100011";
                WHEN "1001010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000001000100";
                WHEN "1001011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000001100010";
                WHEN "1001100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000010000100";
                WHEN "1001101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000010100010";
                WHEN "1001110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000011000110";
                WHEN "1001111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000011101000";
                WHEN "1010000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000100001010";
                WHEN "1010001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000100101101";
                WHEN "1010010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000101010001";
                WHEN "1010011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000101110010";
                WHEN "1010100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000110010100";
                WHEN "1010101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000110111011";
                WHEN "1010110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11000111011010";
                WHEN "1010111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11001000000001";
                WHEN "1011000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11001000100110";
                WHEN "1011001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11001001001011";
                WHEN "1011010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11001001101101";
                WHEN "1011011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11001010010101";
                WHEN "1011100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11001010111100";
                WHEN "1011101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11001011100000";
                WHEN "1011110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11001100000101";
                WHEN "1011111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11001100101110";
                WHEN "1100000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11001101010100";
                WHEN "1100001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11001101111010";
                WHEN "1100010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11001110100010";
                WHEN "1100011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11001111001001";
                WHEN "1100100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11001111110001";
                WHEN "1100101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11010000010110";
                WHEN "1100110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11010000111111";
                WHEN "1100111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11010001101001";
                WHEN "1101000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11010010010010";
                WHEN "1101001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11010010111101";
                WHEN "1101010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11010011100001";
                WHEN "1101011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11010100001100";
                WHEN "1101100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11010100110111";
                WHEN "1101101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11010101100001";
                WHEN "1101110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11010110001011";
                WHEN "1101111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11010110110011";
                WHEN "1110000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11010111011111";
                WHEN "1110001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11011000001010";
                WHEN "1110010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11011000110100";
                WHEN "1110011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11011001011111";
                WHEN "1110100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11011010001010";
                WHEN "1110101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11011010110110";
                WHEN "1110110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11011011100011";
                WHEN "1110111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11011100001111";
                WHEN "1111000" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11011100111001";
                WHEN "1111001" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11011101100011";
                WHEN "1111010" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11011110010001";
                WHEN "1111011" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11011110111011";
                WHEN "1111100" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11011111101000";
                WHEN "1111101" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11100000010101";
                WHEN "1111110" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11100001000010";
                WHEN "1111111" =>  memoryC2_uid218_sinPiZTableGenerator_q <= "11100001110000";
                WHEN OTHERS =>
                    memoryC2_uid218_sinPiZTableGenerator_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--zPPolyEval_uid68_fpSinPiTest(BITSELECT,67)@6
    zPPolyEval_uid68_fpSinPiTest_in <= z_uid53_fpSinPiTest_q(27 downto 0);
    zPPolyEval_uid68_fpSinPiTest_b <= zPPolyEval_uid68_fpSinPiTest_in(27 downto 12);

	--yT1_uid219_sinPiZPolyEval(BITSELECT,218)@6
    yT1_uid219_sinPiZPolyEval_in <= zPPolyEval_uid68_fpSinPiTest_b;
    yT1_uid219_sinPiZPolyEval_b <= yT1_uid219_sinPiZPolyEval_in(15 downto 2);

	--ld_yT1_uid219_sinPiZPolyEval_b_to_reg_yT1_uid219_sinPiZPolyEval_0_to_prodXY_uid232_pT1_uid220_sinPiZPolyEval_0_a(DELAY,540)@6
    ld_yT1_uid219_sinPiZPolyEval_b_to_reg_yT1_uid219_sinPiZPolyEval_0_to_prodXY_uid232_pT1_uid220_sinPiZPolyEval_0_a : dspba_delay
    GENERIC MAP ( width => 14, depth => 1 )
    PORT MAP ( xin => yT1_uid219_sinPiZPolyEval_b, xout => ld_yT1_uid219_sinPiZPolyEval_b_to_reg_yT1_uid219_sinPiZPolyEval_0_to_prodXY_uid232_pT1_uid220_sinPiZPolyEval_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yT1_uid219_sinPiZPolyEval_0_to_prodXY_uid232_pT1_uid220_sinPiZPolyEval_0(REG,262)@7
    reg_yT1_uid219_sinPiZPolyEval_0_to_prodXY_uid232_pT1_uid220_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid219_sinPiZPolyEval_0_to_prodXY_uid232_pT1_uid220_sinPiZPolyEval_0_q <= "00000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid219_sinPiZPolyEval_0_to_prodXY_uid232_pT1_uid220_sinPiZPolyEval_0_q <= ld_yT1_uid219_sinPiZPolyEval_b_to_reg_yT1_uid219_sinPiZPolyEval_0_to_prodXY_uid232_pT1_uid220_sinPiZPolyEval_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid232_pT1_uid220_sinPiZPolyEval(MULT,231)@8
    prodXY_uid232_pT1_uid220_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid232_pT1_uid220_sinPiZPolyEval_a),15)) * SIGNED(prodXY_uid232_pT1_uid220_sinPiZPolyEval_b);
    prodXY_uid232_pT1_uid220_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid232_pT1_uid220_sinPiZPolyEval_a <= (others => '0');
            prodXY_uid232_pT1_uid220_sinPiZPolyEval_b <= (others => '0');
            prodXY_uid232_pT1_uid220_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid232_pT1_uid220_sinPiZPolyEval_a <= reg_yT1_uid219_sinPiZPolyEval_0_to_prodXY_uid232_pT1_uid220_sinPiZPolyEval_0_q;
                prodXY_uid232_pT1_uid220_sinPiZPolyEval_b <= memoryC2_uid218_sinPiZTableGenerator_q;
                prodXY_uid232_pT1_uid220_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid232_pT1_uid220_sinPiZPolyEval_pr,28));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid232_pT1_uid220_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid232_pT1_uid220_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid232_pT1_uid220_sinPiZPolyEval_q <= prodXY_uid232_pT1_uid220_sinPiZPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid233_pT1_uid220_sinPiZPolyEval(BITSELECT,232)@11
    prodXYTruncFR_uid233_pT1_uid220_sinPiZPolyEval_in <= prodXY_uid232_pT1_uid220_sinPiZPolyEval_q;
    prodXYTruncFR_uid233_pT1_uid220_sinPiZPolyEval_b <= prodXYTruncFR_uid233_pT1_uid220_sinPiZPolyEval_in(27 downto 13);

	--highBBits_uid222_sinPiZPolyEval(BITSELECT,221)@11
    highBBits_uid222_sinPiZPolyEval_in <= prodXYTruncFR_uid233_pT1_uid220_sinPiZPolyEval_b;
    highBBits_uid222_sinPiZPolyEval_b <= highBBits_uid222_sinPiZPolyEval_in(14 downto 1);

	--ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC1_uid217_sinPiZTableGenerator_0_q_to_memoryC1_uid217_sinPiZTableGenerator_a(DELAY,494)@7
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC1_uid217_sinPiZTableGenerator_0_q_to_memoryC1_uid217_sinPiZTableGenerator_a : dspba_delay
    GENERIC MAP ( width => 7, depth => 3 )
    PORT MAP ( xin => reg_zAddr_uid67_fpSinPiTest_0_to_memoryC2_uid218_sinPiZTableGenerator_0_q, xout => ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC1_uid217_sinPiZTableGenerator_0_q_to_memoryC1_uid217_sinPiZTableGenerator_a_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid217_sinPiZTableGenerator(LOOKUP,216)@10
    memoryC1_uid217_sinPiZTableGenerator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC1_uid217_sinPiZTableGenerator_q <= "000000000000000000001";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC1_uid217_sinPiZTableGenerator_0_q_to_memoryC1_uid217_sinPiZTableGenerator_a_q) IS
                WHEN "0000000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "000000000000000000001";
                WHEN "0000001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111111101011010101010";
                WHEN "0000010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111111010110101010001";
                WHEN "0000011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111111000001111111100";
                WHEN "0000100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111110101101010101010";
                WHEN "0000101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111110011000101011101";
                WHEN "0000110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111110000100000010101";
                WHEN "0000111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111101101111011010001";
                WHEN "0001000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111101011010110010101";
                WHEN "0001001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111101000110001011111";
                WHEN "0001010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111100110001100110010";
                WHEN "0001011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111100011101000010000";
                WHEN "0001100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111100001000011110111";
                WHEN "0001101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111011110011111101011";
                WHEN "0001110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111011011111011101011";
                WHEN "0001111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111011001010111110111";
                WHEN "0010000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111010110110100010101";
                WHEN "0010001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111010100010000111100";
                WHEN "0010010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111010001101101111000";
                WHEN "0010011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111001111001011000011";
                WHEN "0010100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111001100101000100010";
                WHEN "0010101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111001010000110010001";
                WHEN "0010110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111000111100100010111";
                WHEN "0010111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111000101000010110001";
                WHEN "0011000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111000010100001011111";
                WHEN "0011001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "111000000000000100110";
                WHEN "0011010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110111101100000000011";
                WHEN "0011011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110111010111111111000";
                WHEN "0011100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110111000100000001000";
                WHEN "0011101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110110110000000110101";
                WHEN "0011110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110110011100001110111";
                WHEN "0011111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110110001000011011000";
                WHEN "0100000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110101110100101011010";
                WHEN "0100001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110101100000111110101";
                WHEN "0100010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110101001101010110010";
                WHEN "0100011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110100111001110001011";
                WHEN "0100100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110100100110010001001";
                WHEN "0100101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110100010010110100110";
                WHEN "0100110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110011111111011100110";
                WHEN "0100111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110011101100001001010";
                WHEN "0101000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110011011000111010011";
                WHEN "0101001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110011000101101111111";
                WHEN "0101010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110010110010101010010";
                WHEN "0101011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110010011111101001101";
                WHEN "0101100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110010001100101110000";
                WHEN "0101101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110001111001110111001";
                WHEN "0101110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110001100111000110000";
                WHEN "0101111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110001010100011001011";
                WHEN "0110000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110001000001110010110";
                WHEN "0110001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110000101111010001100";
                WHEN "0110010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110000011100110110001";
                WHEN "0110011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "110000001010011111111";
                WHEN "0110100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101111111000010000000";
                WHEN "0110101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101111100110000101100";
                WHEN "0110110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101111010100000001100";
                WHEN "0110111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101111000010000011001";
                WHEN "0111000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101110110000001011100";
                WHEN "0111001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101110011110011001110";
                WHEN "0111010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101110001100101110101";
                WHEN "0111011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101101111011001010001";
                WHEN "0111100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101101101001101100010";
                WHEN "0111101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101101011000010101010";
                WHEN "0111110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101101000111000100101";
                WHEN "0111111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101100110101111010111";
                WHEN "1000000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101100100100111000010";
                WHEN "1000001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101100010011111100111";
                WHEN "1000010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101100000011001000111";
                WHEN "1000011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101011110010011100000";
                WHEN "1000100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101011100001110110100";
                WHEN "1000101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101011010001011000100";
                WHEN "1000110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101011000001000001110";
                WHEN "1000111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101010110000110011000";
                WHEN "1001000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101010100000101011111";
                WHEN "1001001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101010010000101100100";
                WHEN "1001010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101010000000110101001";
                WHEN "1001011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101001110001000110000";
                WHEN "1001100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101001100001011110101";
                WHEN "1001101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101001010001111111111";
                WHEN "1001110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101001000010101000110";
                WHEN "1001111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101000110011011010001";
                WHEN "1010000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101000100100010100001";
                WHEN "1010001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101000010101010110100";
                WHEN "1010010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "101000000110100001011";
                WHEN "1010011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100111110111110101011";
                WHEN "1010100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100111101001010010000";
                WHEN "1010101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100111011010110110110";
                WHEN "1010110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100111001100100101100";
                WHEN "1010111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100110111110011100011";
                WHEN "1011000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100110110000011100011";
                WHEN "1011001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100110100010100101110";
                WHEN "1011010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100110010100111000101";
                WHEN "1011011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100110000111010100001";
                WHEN "1011100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100101111001111001000";
                WHEN "1011101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100101101100100111111";
                WHEN "1011110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100101011111100000000";
                WHEN "1011111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100101010010100001001";
                WHEN "1100000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100101000101101100011";
                WHEN "1100001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100100111001000001011";
                WHEN "1100010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100100101100011111111";
                WHEN "1100011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100100100000001000010";
                WHEN "1100100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100100010011111010101";
                WHEN "1100101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100100000111110111001";
                WHEN "1100110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100011111011111101010";
                WHEN "1100111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100011110000001101010";
                WHEN "1101000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100011100100100111101";
                WHEN "1101001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100011011001001011111";
                WHEN "1101010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100011001101111011010";
                WHEN "1101011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100011000010110100001";
                WHEN "1101100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100010110111110111010";
                WHEN "1101101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100010101101000101000";
                WHEN "1101110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100010100010011101001";
                WHEN "1101111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100010011000000000001";
                WHEN "1110000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100010001101101101010";
                WHEN "1110001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100010000011100100111";
                WHEN "1110010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100001111001100111100";
                WHEN "1110011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100001101111110100101";
                WHEN "1110100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100001100110001100100";
                WHEN "1110101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100001011100101111001";
                WHEN "1110110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100001010011011100011";
                WHEN "1110111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100001001010010100101";
                WHEN "1111000" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100001000001011000000";
                WHEN "1111001" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100000111000100110100";
                WHEN "1111010" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100000101111111111100";
                WHEN "1111011" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100000100111100011111";
                WHEN "1111100" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100000011111010011000";
                WHEN "1111101" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100000010111001101010";
                WHEN "1111110" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100000001111010010101";
                WHEN "1111111" =>  memoryC1_uid217_sinPiZTableGenerator_q <= "100000000111100011001";
                WHEN OTHERS =>
                    memoryC1_uid217_sinPiZTableGenerator_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid223_sinPiZPolyEval(ADD,222)@11
    sumAHighB_uid223_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid217_sinPiZTableGenerator_q(20)) & memoryC1_uid217_sinPiZTableGenerator_q);
    sumAHighB_uid223_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((21 downto 14 => highBBits_uid222_sinPiZPolyEval_b(13)) & highBBits_uid222_sinPiZPolyEval_b);
            sumAHighB_uid223_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid223_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid223_sinPiZPolyEval_b));
    sumAHighB_uid223_sinPiZPolyEval_q <= sumAHighB_uid223_sinPiZPolyEval_o(21 downto 0);


	--lowRangeB_uid221_sinPiZPolyEval(BITSELECT,220)@11
    lowRangeB_uid221_sinPiZPolyEval_in <= prodXYTruncFR_uid233_pT1_uid220_sinPiZPolyEval_b(0 downto 0);
    lowRangeB_uid221_sinPiZPolyEval_b <= lowRangeB_uid221_sinPiZPolyEval_in(0 downto 0);

	--s1_uid221_uid224_sinPiZPolyEval(BITJOIN,223)@11
    s1_uid221_uid224_sinPiZPolyEval_q <= sumAHighB_uid223_sinPiZPolyEval_q & lowRangeB_uid221_sinPiZPolyEval_b;

	--reg_s1_uid221_uid224_sinPiZPolyEval_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_1(REG,265)@11
    reg_s1_uid221_uid224_sinPiZPolyEval_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid221_uid224_sinPiZPolyEval_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid221_uid224_sinPiZPolyEval_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_1_q <= s1_uid221_uid224_sinPiZPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_notEnable(LOGICAL,560)
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_notEnable_a <= en;
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_notEnable_q <= not ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_notEnable_a;

	--ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_nor(LOGICAL,636)
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_nor_a <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_notEnable_q;
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_nor_b <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_sticky_ena_q;
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_nor_q <= not (ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_nor_a or ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_nor_b);

	--ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_mem_top(CONSTANT,632)
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_mem_top_q <= "010";

	--ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmp(LOGICAL,633)
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmp_a <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_mem_top_q;
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdmux_q);
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmp_q <= "1" when ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmp_a = ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmp_b else "0";

	--ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmpReg(REG,634)
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmpReg_q <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_sticky_ena(REG,637)
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_nor_q = "1") THEN
                ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_sticky_ena_q <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_enaAnd(LOGICAL,638)
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_enaAnd_a <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_sticky_ena_q;
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_enaAnd_b <= en;
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_enaAnd_q <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_enaAnd_a and ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_enaAnd_b;

	--reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0(REG,264)@6
    reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q <= zPPolyEval_uid68_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_inputreg(DELAY,626)
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q, xout => ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt(COUNTER,628)
    -- every=1, low=0, high=2, step=1, init=1
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_i = 1 THEN
                      ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_i <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_i - 2;
                    ELSE
                        ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_i <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_i,2));


	--ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdreg(REG,629)
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdreg_q <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdmux(MUX,630)
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdmux_s <= en;
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdmux: PROCESS (ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdmux_s, ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdreg_q, ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdmux_q <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdmux_q <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem(DUALMEM,627)
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_ia <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_inputreg_q;
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_aa <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdreg_q;
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_ab <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_rdmux_q;
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_iq,
        address_a => ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_aa,
        data_a => ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_ia
    );
    ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_reset0 <= areset;
        ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_q <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_iq(15 downto 0);

	--prodXY_uid235_pT2_uid226_sinPiZPolyEval(MULT,234)@12
    prodXY_uid235_pT2_uid226_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid235_pT2_uid226_sinPiZPolyEval_a),17)) * SIGNED(prodXY_uid235_pT2_uid226_sinPiZPolyEval_b);
    prodXY_uid235_pT2_uid226_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid235_pT2_uid226_sinPiZPolyEval_a <= (others => '0');
            prodXY_uid235_pT2_uid226_sinPiZPolyEval_b <= (others => '0');
            prodXY_uid235_pT2_uid226_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid235_pT2_uid226_sinPiZPolyEval_a <= ld_reg_zPPolyEval_uid68_fpSinPiTest_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_0_q_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_a_replace_mem_q;
                prodXY_uid235_pT2_uid226_sinPiZPolyEval_b <= reg_s1_uid221_uid224_sinPiZPolyEval_0_to_prodXY_uid235_pT2_uid226_sinPiZPolyEval_1_q;
                prodXY_uid235_pT2_uid226_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid235_pT2_uid226_sinPiZPolyEval_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid235_pT2_uid226_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid235_pT2_uid226_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid235_pT2_uid226_sinPiZPolyEval_q <= prodXY_uid235_pT2_uid226_sinPiZPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid236_pT2_uid226_sinPiZPolyEval(BITSELECT,235)@15
    prodXYTruncFR_uid236_pT2_uid226_sinPiZPolyEval_in <= prodXY_uid235_pT2_uid226_sinPiZPolyEval_q;
    prodXYTruncFR_uid236_pT2_uid226_sinPiZPolyEval_b <= prodXYTruncFR_uid236_pT2_uid226_sinPiZPolyEval_in(38 downto 15);

	--highBBits_uid228_sinPiZPolyEval(BITSELECT,227)@15
    highBBits_uid228_sinPiZPolyEval_in <= prodXYTruncFR_uid236_pT2_uid226_sinPiZPolyEval_b;
    highBBits_uid228_sinPiZPolyEval_b <= highBBits_uid228_sinPiZPolyEval_in(23 downto 2);

	--ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_nor(LOGICAL,623)
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_nor_a <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_notEnable_q;
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_nor_b <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_sticky_ena_q;
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_nor_q <= not (ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_nor_a or ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_nor_b);

	--ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_mem_top(CONSTANT,619)
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_mem_top_q <= "0100";

	--ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmp(LOGICAL,620)
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmp_a <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_mem_top_q;
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdmux_q);
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmp_q <= "1" when ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmp_a = ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmp_b else "0";

	--ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmpReg(REG,621)
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmpReg_q <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_sticky_ena(REG,624)
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_nor_q = "1") THEN
                ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_sticky_ena_q <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_enaAnd(LOGICAL,625)
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_enaAnd_a <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_sticky_ena_q;
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_enaAnd_b <= en;
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_enaAnd_q <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_enaAnd_a and ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_enaAnd_b;

	--ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_inputreg(DELAY,613)
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_inputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => reg_zAddr_uid67_fpSinPiTest_0_to_memoryC2_uid218_sinPiZTableGenerator_0_q, xout => ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt(COUNTER,615)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_i = 3 THEN
                      ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_i <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_i <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_i,3));


	--ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdreg(REG,616)
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdreg_q <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdmux(MUX,617)
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdmux_s <= en;
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdmux: PROCESS (ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdmux_s, ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdreg_q, ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdmux_q <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdmux_q <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem(DUALMEM,614)
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_ia <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_inputreg_q;
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_aa <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdreg_q;
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_ab <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_rdmux_q;
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_iq,
        address_a => ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_aa,
        data_a => ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_ia
    );
    ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_reset0 <= areset;
        ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_q <= ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_iq(6 downto 0);

	--memoryC0_uid216_sinPiZTableGenerator(LOOKUP,215)@14
    memoryC0_uid216_sinPiZTableGenerator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC0_uid216_sinPiZTableGenerator_q <= "01100100100001111110110101110";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_zAddr_uid67_fpSinPiTest_0_to_memoryC0_uid216_sinPiZTableGenerator_0_q_to_memoryC0_uid216_sinPiZTableGenerator_a_replace_mem_q) IS
                WHEN "0000000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100100001111110110101110";
                WHEN "0000001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100100001110100100000010";
                WHEN "0000010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100100001010101100000000";
                WHEN "0000011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100100000100001110101000";
                WHEN "0000100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100011111011001011111101";
                WHEN "0000101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100011101111100100000010";
                WHEN "0000110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100011100001010110111011";
                WHEN "0000111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100011010000100100101111";
                WHEN "0001000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100010111101001101100010";
                WHEN "0001001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100010100111010001011101";
                WHEN "0001010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100010001110110000100111";
                WHEN "0001011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100001110011101011001001";
                WHEN "0001100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100001010110000001001110";
                WHEN "0001101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100000110101110011000000";
                WHEN "0001110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100100000010011000000101011";
                WHEN "0001111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100011111101101101010011101";
                WHEN "0010000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100011111000101110000100010";
                WHEN "0010001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100011110011011010011001011";
                WHEN "0010010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100011101101110010010100101";
                WHEN "0010011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100011100111110101111000011";
                WHEN "0010100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100011100001100101000110101";
                WHEN "0010101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100011011011000000000001111";
                WHEN "0010110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100011010100000110101100011";
                WHEN "0010111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100011001100111001001000110";
                WHEN "0011000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100011000101010111011001110";
                WHEN "0011001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100010111101100001100010000";
                WHEN "0011010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100010110101010111100100100";
                WHEN "0011011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100010101100111001100100010";
                WHEN "0011100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100010100100000111100100011";
                WHEN "0011101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100010011011000001101000000";
                WHEN "0011110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100010010001100111110010110";
                WHEN "0011111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100010000111111010000111111";
                WHEN "0100000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100001111101111000101010111";
                WHEN "0100001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100001110011100011011111110";
                WHEN "0100010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100001101000111010101010001";
                WHEN "0100011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100001011101111110001110000";
                WHEN "0100100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100001010010101110001111010";
                WHEN "0100101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100001000111001010110010010";
                WHEN "0100110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100000111011010011111011001";
                WHEN "0100111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100000101111001001101110010";
                WHEN "0101000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100000100010101100010000001";
                WHEN "0101001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100000010101111011100101011";
                WHEN "0101010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01100000001000110111110010101";
                WHEN "0101011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011111111011100000111100110";
                WHEN "0101100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011111101101110111001000101";
                WHEN "0101101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011111011111111010011011011";
                WHEN "0101110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011111010001101010111001111";
                WHEN "0101111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011111000011001000101001110";
                WHEN "0110000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011110110100010011110000000";
                WHEN "0110001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011110100101001100010010010";
                WHEN "0110010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011110010101110010010110000";
                WHEN "0110011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011110000110000110000001000";
                WHEN "0110100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011101110110000111011000111";
                WHEN "0110101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011101100101110110100011101";
                WHEN "0110110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011101010101010011100111001";
                WHEN "0110111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011101000100011110101001100";
                WHEN "0111000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011100110011010111110000111";
                WHEN "0111001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011100100001111111000011101";
                WHEN "0111010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011100010000010100101000000";
                WHEN "0111011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011011111110011000100100100";
                WHEN "0111100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011011101100001010111111110";
                WHEN "0111101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011011011001101100000000011";
                WHEN "0111110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011011000110111011101101010";
                WHEN "0111111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011010110011111010001101001";
                WHEN "1000000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011010100000100111100111000";
                WHEN "1000001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011010001101000100000001111";
                WHEN "1000010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011001111001001111100100111";
                WHEN "1000011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011001100101001010010111011";
                WHEN "1000100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011001010000110100100000101";
                WHEN "1000101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011000111100001110001000001";
                WHEN "1000110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011000100111010111010101011";
                WHEN "1000111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01011000010010010000001111111";
                WHEN "1001000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010111111100111000111111011";
                WHEN "1001001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010111100111010001101011110";
                WHEN "1001010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010111010001011010011100110";
                WHEN "1001011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010110111011010011011010011";
                WHEN "1001100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010110100100111100101100110";
                WHEN "1001101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010110001110010110011011111";
                WHEN "1001110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010101110111100000110000001";
                WHEN "1001111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010101100000011011110001110";
                WHEN "1010000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010101001001000111101001000";
                WHEN "1010001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010100110001100100011110100";
                WHEN "1010010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010100011001110010011010110";
                WHEN "1010011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010100000001110001100110010";
                WHEN "1010100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010011101001100010001001111";
                WHEN "1010101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010011010001000100001110100";
                WHEN "1010110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010010111000010111111100101";
                WHEN "1010111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010010011111011101011101100";
                WHEN "1011000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010010000110010100111010001";
                WHEN "1011001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010001101100111110011011011";
                WHEN "1011010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010001010011011010001010100";
                WHEN "1011011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010000111001101000010000111";
                WHEN "1011100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010000011111101000110111110";
                WHEN "1011101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01010000000101011100001000010";
                WHEN "1011110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001111101011000010001100001";
                WHEN "1011111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001111010000011011001100111";
                WHEN "1100000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001110110101100111010011111";
                WHEN "1100001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001110011010100110101010111";
                WHEN "1100010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001101111111011001011011101";
                WHEN "1100011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001101100011111111101111111";
                WHEN "1100100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001101001000011001110001011";
                WHEN "1100101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001100101100100111101010001";
                WHEN "1100110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001100010000101001100100001";
                WHEN "1100111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001011110100011111101001011";
                WHEN "1101000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001011011000001010000011111";
                WHEN "1101001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001010111011101000111101111";
                WHEN "1101010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001010011110111100100001011";
                WHEN "1101011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001010000010000100111000111";
                WHEN "1101100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001001100101000010001110101";
                WHEN "1101101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001001000111110100101100111";
                WHEN "1101110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001000101010011100011110001";
                WHEN "1101111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01001000001100111001101100110";
                WHEN "1110000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000111101111001100100011011";
                WHEN "1110001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000111010001010101001100101";
                WHEN "1110010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000110110011010011110010111";
                WHEN "1110011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000110010101001000100001000";
                WHEN "1110100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000101110110110011100001101";
                WHEN "1110101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000101011000010100111111100";
                WHEN "1110110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000100111001101101000101100";
                WHEN "1110111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000100011010111011111110011";
                WHEN "1111000" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000011111100000001110101000";
                WHEN "1111001" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000011011100111110110100010";
                WHEN "1111010" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000010111101110011000111010";
                WHEN "1111011" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000010011110011110111000111";
                WHEN "1111100" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000001111111000010010100010";
                WHEN "1111101" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000001011111011101100100011";
                WHEN "1111110" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000000111111110000110100011";
                WHEN "1111111" =>  memoryC0_uid216_sinPiZTableGenerator_q <= "01000000011111111100001111011";
                WHEN OTHERS =>
                    memoryC0_uid216_sinPiZTableGenerator_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid229_sinPiZPolyEval(ADD,228)@15
    sumAHighB_uid229_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((29 downto 29 => memoryC0_uid216_sinPiZTableGenerator_q(28)) & memoryC0_uid216_sinPiZTableGenerator_q);
    sumAHighB_uid229_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid228_sinPiZPolyEval_b(21)) & highBBits_uid228_sinPiZPolyEval_b);
            sumAHighB_uid229_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid229_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid229_sinPiZPolyEval_b));
    sumAHighB_uid229_sinPiZPolyEval_q <= sumAHighB_uid229_sinPiZPolyEval_o(29 downto 0);


	--lowRangeB_uid227_sinPiZPolyEval(BITSELECT,226)@15
    lowRangeB_uid227_sinPiZPolyEval_in <= prodXYTruncFR_uid236_pT2_uid226_sinPiZPolyEval_b(1 downto 0);
    lowRangeB_uid227_sinPiZPolyEval_b <= lowRangeB_uid227_sinPiZPolyEval_in(1 downto 0);

	--s2_uid227_uid230_sinPiZPolyEval(BITJOIN,229)@15
    s2_uid227_uid230_sinPiZPolyEval_q <= sumAHighB_uid229_sinPiZPolyEval_q & lowRangeB_uid227_sinPiZPolyEval_b;

	--fxpSinRes_uid70_fpSinPiTest(BITSELECT,69)@15
    fxpSinRes_uid70_fpSinPiTest_in <= s2_uid227_uid230_sinPiZPolyEval_q(29 downto 0);
    fxpSinRes_uid70_fpSinPiTest_b <= fxpSinRes_uid70_fpSinPiTest_in(29 downto 5);

	--ld_sinXIsX_uid34_fpSinPiTest_c_to_multRightOp_uid72_fpSinPiTest_b(DELAY,326)@0
    ld_sinXIsX_uid34_fpSinPiTest_c_to_multRightOp_uid72_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 15 )
    PORT MAP ( xin => sinXIsX_uid34_fpSinPiTest_c, xout => ld_sinXIsX_uid34_fpSinPiTest_c_to_multRightOp_uid72_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--multRightOp_uid72_fpSinPiTest(MUX,71)@15
    multRightOp_uid72_fpSinPiTest_s <= ld_sinXIsX_uid34_fpSinPiTest_c_to_multRightOp_uid72_fpSinPiTest_b_q;
    multRightOp_uid72_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multRightOp_uid72_fpSinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE multRightOp_uid72_fpSinPiTest_s IS
                      WHEN "0" => multRightOp_uid72_fpSinPiTest_q <= fxpSinRes_uid70_fpSinPiTest_b;
                      WHEN "1" => multRightOp_uid72_fpSinPiTest_q <= piwFP2_uid71_fpSinPiTest_q;
                      WHEN OTHERS => multRightOp_uid72_fpSinPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_nor(LOGICAL,561)
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_nor_a <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_notEnable_q;
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_nor_b <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_sticky_ena_q;
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_nor_q <= not (ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_nor_a or ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_nor_b);

	--ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_mem_top(CONSTANT,557)
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_mem_top_q <= "01000";

	--ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmp(LOGICAL,558)
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmp_a <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_mem_top_q;
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdmux_q);
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmp_q <= "1" when ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmp_a = ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmp_b else "0";

	--ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmpReg(REG,559)
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmpReg_q <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_sticky_ena(REG,562)
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_nor_q = "1") THEN
                ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_sticky_ena_q <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_enaAnd(LOGICAL,563)
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_enaAnd_a <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_sticky_ena_q;
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_enaAnd_b <= en;
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_enaAnd_q <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_enaAnd_a and ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_enaAnd_b;

	--ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_inputreg(DELAY,551)
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => oFracX_uid35_uid35_fpSinPiTest_q, xout => ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt(COUNTER,553)
    -- every=1, low=0, high=8, step=1, init=1
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_i = 7 THEN
                      ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_eq = '1') THEN
                        ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_i <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_i - 8;
                    ELSE
                        ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_i <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_i,4));


	--ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdreg(REG,554)
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdreg_q <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdmux(MUX,555)
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdmux_s <= en;
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdmux: PROCESS (ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdmux_s, ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdreg_q, ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdmux_q <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdreg_q;
                  WHEN "1" => ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdmux_q <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem(DUALMEM,552)
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_ia <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_inputreg_q;
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_aa <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdreg_q;
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_ab <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_rdmux_q;
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 24,
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
        clocken1 => ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_iq,
        address_a => ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_aa,
        data_a => ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_ia
    );
    ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_reset0 <= areset;
        ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_q <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_iq(23 downto 0);

	--ozz_uid45_fpSinPiTest(CONSTANT,44)
    ozz_uid45_fpSinPiTest_q <= "00000000000000000000000000000000000";

	--vStage_uid150_lzcZ_uid55_fpSinPiTest(BITSELECT,149)@6
    vStage_uid150_lzcZ_uid55_fpSinPiTest_in <= z_uid53_fpSinPiTest_q(2 downto 0);
    vStage_uid150_lzcZ_uid55_fpSinPiTest_b <= vStage_uid150_lzcZ_uid55_fpSinPiTest_in(2 downto 0);

	--ld_vStage_uid150_lzcZ_uid55_fpSinPiTest_b_to_leftShiftStage0Idx2_uid189_alignedZ_uid56_fpSinPiTest_b(DELAY,463)@6
    ld_vStage_uid150_lzcZ_uid55_fpSinPiTest_b_to_leftShiftStage0Idx2_uid189_alignedZ_uid56_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 3, depth => 4 )
    PORT MAP ( xin => vStage_uid150_lzcZ_uid55_fpSinPiTest_b, xout => ld_vStage_uid150_lzcZ_uid55_fpSinPiTest_b_to_leftShiftStage0Idx2_uid189_alignedZ_uid56_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx2_uid189_alignedZ_uid56_fpSinPiTest(BITJOIN,188)@10
    leftShiftStage0Idx2_uid189_alignedZ_uid56_fpSinPiTest_q <= ld_vStage_uid150_lzcZ_uid55_fpSinPiTest_b_to_leftShiftStage0Idx2_uid189_alignedZ_uid56_fpSinPiTest_b_q & leftShiftStage0Idx2Pad32_uid117_fixedPointX_uid41_fpSinPiTest_q;

	--ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_nor(LOGICAL,599)
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_nor_a <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_notEnable_q;
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_nor_b <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_sticky_ena_q;
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_nor_q <= not (ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_nor_a or ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_nor_b);

	--ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_cmpReg(REG,597)
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_sticky_ena(REG,600)
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_nor_q = "1") THEN
                ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_sticky_ena_q <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_enaAnd(LOGICAL,601)
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_enaAnd_a <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_sticky_ena_q;
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_enaAnd_b <= en;
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_enaAnd_q <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_enaAnd_a and ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_enaAnd_b;

	--X18dto0_uid185_alignedZ_uid56_fpSinPiTest(BITSELECT,184)@6
    X18dto0_uid185_alignedZ_uid56_fpSinPiTest_in <= z_uid53_fpSinPiTest_q(18 downto 0);
    X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b <= X18dto0_uid185_alignedZ_uid56_fpSinPiTest_in(18 downto 0);

	--ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_inputreg(DELAY,591)
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 19, depth => 1 )
    PORT MAP ( xin => X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b, xout => ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdcnt(COUNTER,593)
    -- every=1, low=0, high=1, step=1, init=1
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdcnt_i <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdcnt_i,1));


	--ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdreg(REG,594)
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdreg_q <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdmux(MUX,595)
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdmux_s <= en;
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdmux: PROCESS (ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdmux_s, ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdreg_q, ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdmux_q <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdmux_q <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem(DUALMEM,592)
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_ia <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_inputreg_q;
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_aa <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdreg_q;
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_ab <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdmux_q;
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_iq,
        address_a => ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_aa,
        data_a => ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_ia
    );
    ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_reset0 <= areset;
        ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_q <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_iq(18 downto 0);

	--leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest(BITJOIN,185)@10
    leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_q <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_mem_q & leftShiftStage0Idx1Pad16_uid114_fixedPointX_uid41_fpSinPiTest_q;

	--ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_nor(LOGICAL,610)
    ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_nor_a <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_notEnable_q;
    ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_nor_b <= ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_sticky_ena_q;
    ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_nor_q <= not (ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_nor_a or ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_nor_b);

	--ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_sticky_ena(REG,611)
    ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_nor_q = "1") THEN
                ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_sticky_ena_q <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_enaAnd(LOGICAL,612)
    ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_enaAnd_a <= ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_sticky_ena_q;
    ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_enaAnd_b <= en;
    ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_enaAnd_q <= ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_enaAnd_a and ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_enaAnd_b;

	--ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_inputreg(DELAY,602)
    ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 35, depth => 1 )
    PORT MAP ( xin => z_uid53_fpSinPiTest_q, xout => ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem(DUALMEM,603)
    ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_ia <= ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_inputreg_q;
    ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_aa <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdreg_q;
    ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_ab <= ld_X18dto0_uid185_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_b_replace_rdmux_q;
    ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 35,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 35,
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
        clocken1 => ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_iq,
        address_a => ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_aa,
        data_a => ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_ia
    );
    ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_reset0 <= areset;
        ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_q <= ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_iq(34 downto 0);

	--rVStage_uid147_lzcZ_uid55_fpSinPiTest(BITSELECT,146)@6
    rVStage_uid147_lzcZ_uid55_fpSinPiTest_in <= z_uid53_fpSinPiTest_q;
    rVStage_uid147_lzcZ_uid55_fpSinPiTest_b <= rVStage_uid147_lzcZ_uid55_fpSinPiTest_in(34 downto 3);

	--vCount_uid148_lzcZ_uid55_fpSinPiTest(LOGICAL,147)@6
    vCount_uid148_lzcZ_uid55_fpSinPiTest_a <= rVStage_uid147_lzcZ_uid55_fpSinPiTest_b;
    vCount_uid148_lzcZ_uid55_fpSinPiTest_b <= leftShiftStage0Idx2Pad32_uid117_fixedPointX_uid41_fpSinPiTest_q;
    vCount_uid148_lzcZ_uid55_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid148_lzcZ_uid55_fpSinPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid148_lzcZ_uid55_fpSinPiTest_a = vCount_uid148_lzcZ_uid55_fpSinPiTest_b) THEN
                vCount_uid148_lzcZ_uid55_fpSinPiTest_q <= "1";
            ELSE
                vCount_uid148_lzcZ_uid55_fpSinPiTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--ld_vCount_uid148_lzcZ_uid55_fpSinPiTest_q_to_r_uid181_lzcZ_uid55_fpSinPiTest_f(DELAY,460)@7
    ld_vCount_uid148_lzcZ_uid55_fpSinPiTest_q_to_r_uid181_lzcZ_uid55_fpSinPiTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid148_lzcZ_uid55_fpSinPiTest_q, xout => ld_vCount_uid148_lzcZ_uid55_fpSinPiTest_q_to_r_uid181_lzcZ_uid55_fpSinPiTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--ld_vStage_uid150_lzcZ_uid55_fpSinPiTest_b_to_cStage_uid151_lzcZ_uid55_fpSinPiTest_b(DELAY,425)@6
    ld_vStage_uid150_lzcZ_uid55_fpSinPiTest_b_to_cStage_uid151_lzcZ_uid55_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => vStage_uid150_lzcZ_uid55_fpSinPiTest_b, xout => ld_vStage_uid150_lzcZ_uid55_fpSinPiTest_b_to_cStage_uid151_lzcZ_uid55_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--mO_uid149_lzcZ_uid55_fpSinPiTest(CONSTANT,148)
    mO_uid149_lzcZ_uid55_fpSinPiTest_q <= "11111111111111111111111111111";

	--cStage_uid151_lzcZ_uid55_fpSinPiTest(BITJOIN,150)@7
    cStage_uid151_lzcZ_uid55_fpSinPiTest_q <= ld_vStage_uid150_lzcZ_uid55_fpSinPiTest_b_to_cStage_uid151_lzcZ_uid55_fpSinPiTest_b_q & mO_uid149_lzcZ_uid55_fpSinPiTest_q;

	--ld_rVStage_uid147_lzcZ_uid55_fpSinPiTest_b_to_vStagei_uid153_lzcZ_uid55_fpSinPiTest_c(DELAY,427)@6
    ld_rVStage_uid147_lzcZ_uid55_fpSinPiTest_b_to_vStagei_uid153_lzcZ_uid55_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => rVStage_uid147_lzcZ_uid55_fpSinPiTest_b, xout => ld_rVStage_uid147_lzcZ_uid55_fpSinPiTest_b_to_vStagei_uid153_lzcZ_uid55_fpSinPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid153_lzcZ_uid55_fpSinPiTest(MUX,152)@7
    vStagei_uid153_lzcZ_uid55_fpSinPiTest_s <= vCount_uid148_lzcZ_uid55_fpSinPiTest_q;
    vStagei_uid153_lzcZ_uid55_fpSinPiTest: PROCESS (vStagei_uid153_lzcZ_uid55_fpSinPiTest_s, en, ld_rVStage_uid147_lzcZ_uid55_fpSinPiTest_b_to_vStagei_uid153_lzcZ_uid55_fpSinPiTest_c_q, cStage_uid151_lzcZ_uid55_fpSinPiTest_q)
    BEGIN
            CASE vStagei_uid153_lzcZ_uid55_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid153_lzcZ_uid55_fpSinPiTest_q <= ld_rVStage_uid147_lzcZ_uid55_fpSinPiTest_b_to_vStagei_uid153_lzcZ_uid55_fpSinPiTest_c_q;
                  WHEN "1" => vStagei_uid153_lzcZ_uid55_fpSinPiTest_q <= cStage_uid151_lzcZ_uid55_fpSinPiTest_q;
                  WHEN OTHERS => vStagei_uid153_lzcZ_uid55_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid155_lzcZ_uid55_fpSinPiTest(BITSELECT,154)@7
    rVStage_uid155_lzcZ_uid55_fpSinPiTest_in <= vStagei_uid153_lzcZ_uid55_fpSinPiTest_q;
    rVStage_uid155_lzcZ_uid55_fpSinPiTest_b <= rVStage_uid155_lzcZ_uid55_fpSinPiTest_in(31 downto 16);

	--vCount_uid156_lzcZ_uid55_fpSinPiTest(LOGICAL,155)@7
    vCount_uid156_lzcZ_uid55_fpSinPiTest_a <= rVStage_uid155_lzcZ_uid55_fpSinPiTest_b;
    vCount_uid156_lzcZ_uid55_fpSinPiTest_b <= leftShiftStage0Idx1Pad16_uid114_fixedPointX_uid41_fpSinPiTest_q;
    vCount_uid156_lzcZ_uid55_fpSinPiTest_q <= "1" when vCount_uid156_lzcZ_uid55_fpSinPiTest_a = vCount_uid156_lzcZ_uid55_fpSinPiTest_b else "0";

	--ld_vCount_uid156_lzcZ_uid55_fpSinPiTest_q_to_reg_vCount_uid156_lzcZ_uid55_fpSinPiTest_0_to_r_uid181_lzcZ_uid55_fpSinPiTest_4_a(DELAY,533)@7
    ld_vCount_uid156_lzcZ_uid55_fpSinPiTest_q_to_reg_vCount_uid156_lzcZ_uid55_fpSinPiTest_0_to_r_uid181_lzcZ_uid55_fpSinPiTest_4_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid156_lzcZ_uid55_fpSinPiTest_q, xout => ld_vCount_uid156_lzcZ_uid55_fpSinPiTest_q_to_reg_vCount_uid156_lzcZ_uid55_fpSinPiTest_0_to_r_uid181_lzcZ_uid55_fpSinPiTest_4_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid156_lzcZ_uid55_fpSinPiTest_0_to_r_uid181_lzcZ_uid55_fpSinPiTest_4(REG,255)@8
    reg_vCount_uid156_lzcZ_uid55_fpSinPiTest_0_to_r_uid181_lzcZ_uid55_fpSinPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid156_lzcZ_uid55_fpSinPiTest_0_to_r_uid181_lzcZ_uid55_fpSinPiTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid156_lzcZ_uid55_fpSinPiTest_0_to_r_uid181_lzcZ_uid55_fpSinPiTest_4_q <= ld_vCount_uid156_lzcZ_uid55_fpSinPiTest_q_to_reg_vCount_uid156_lzcZ_uid55_fpSinPiTest_0_to_r_uid181_lzcZ_uid55_fpSinPiTest_4_a_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid157_lzcZ_uid55_fpSinPiTest(BITSELECT,156)@7
    vStage_uid157_lzcZ_uid55_fpSinPiTest_in <= vStagei_uid153_lzcZ_uid55_fpSinPiTest_q(15 downto 0);
    vStage_uid157_lzcZ_uid55_fpSinPiTest_b <= vStage_uid157_lzcZ_uid55_fpSinPiTest_in(15 downto 0);

	--vStagei_uid159_lzcZ_uid55_fpSinPiTest(MUX,158)@7
    vStagei_uid159_lzcZ_uid55_fpSinPiTest_s <= vCount_uid156_lzcZ_uid55_fpSinPiTest_q;
    vStagei_uid159_lzcZ_uid55_fpSinPiTest: PROCESS (vStagei_uid159_lzcZ_uid55_fpSinPiTest_s, en, rVStage_uid155_lzcZ_uid55_fpSinPiTest_b, vStage_uid157_lzcZ_uid55_fpSinPiTest_b)
    BEGIN
            CASE vStagei_uid159_lzcZ_uid55_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid159_lzcZ_uid55_fpSinPiTest_q <= rVStage_uid155_lzcZ_uid55_fpSinPiTest_b;
                  WHEN "1" => vStagei_uid159_lzcZ_uid55_fpSinPiTest_q <= vStage_uid157_lzcZ_uid55_fpSinPiTest_b;
                  WHEN OTHERS => vStagei_uid159_lzcZ_uid55_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid161_lzcZ_uid55_fpSinPiTest(BITSELECT,160)@7
    rVStage_uid161_lzcZ_uid55_fpSinPiTest_in <= vStagei_uid159_lzcZ_uid55_fpSinPiTest_q;
    rVStage_uid161_lzcZ_uid55_fpSinPiTest_b <= rVStage_uid161_lzcZ_uid55_fpSinPiTest_in(15 downto 8);

	--reg_rVStage_uid161_lzcZ_uid55_fpSinPiTest_0_to_vCount_uid162_lzcZ_uid55_fpSinPiTest_1(REG,250)@7
    reg_rVStage_uid161_lzcZ_uid55_fpSinPiTest_0_to_vCount_uid162_lzcZ_uid55_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid161_lzcZ_uid55_fpSinPiTest_0_to_vCount_uid162_lzcZ_uid55_fpSinPiTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid161_lzcZ_uid55_fpSinPiTest_0_to_vCount_uid162_lzcZ_uid55_fpSinPiTest_1_q <= rVStage_uid161_lzcZ_uid55_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid162_lzcZ_uid55_fpSinPiTest(LOGICAL,161)@8
    vCount_uid162_lzcZ_uid55_fpSinPiTest_a <= reg_rVStage_uid161_lzcZ_uid55_fpSinPiTest_0_to_vCount_uid162_lzcZ_uid55_fpSinPiTest_1_q;
    vCount_uid162_lzcZ_uid55_fpSinPiTest_b <= cstAllZWE_uid16_fpSinPiTest_q;
    vCount_uid162_lzcZ_uid55_fpSinPiTest_q <= "1" when vCount_uid162_lzcZ_uid55_fpSinPiTest_a = vCount_uid162_lzcZ_uid55_fpSinPiTest_b else "0";

	--ld_vCount_uid162_lzcZ_uid55_fpSinPiTest_q_to_r_uid181_lzcZ_uid55_fpSinPiTest_d(DELAY,458)@8
    ld_vCount_uid162_lzcZ_uid55_fpSinPiTest_q_to_r_uid181_lzcZ_uid55_fpSinPiTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid162_lzcZ_uid55_fpSinPiTest_q, xout => ld_vCount_uid162_lzcZ_uid55_fpSinPiTest_q_to_r_uid181_lzcZ_uid55_fpSinPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid163_lzcZ_uid55_fpSinPiTest(BITSELECT,162)@7
    vStage_uid163_lzcZ_uid55_fpSinPiTest_in <= vStagei_uid159_lzcZ_uid55_fpSinPiTest_q(7 downto 0);
    vStage_uid163_lzcZ_uid55_fpSinPiTest_b <= vStage_uid163_lzcZ_uid55_fpSinPiTest_in(7 downto 0);

	--reg_vStage_uid163_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid165_lzcZ_uid55_fpSinPiTest_3(REG,252)@7
    reg_vStage_uid163_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid165_lzcZ_uid55_fpSinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid163_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid165_lzcZ_uid55_fpSinPiTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid163_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid165_lzcZ_uid55_fpSinPiTest_3_q <= vStage_uid163_lzcZ_uid55_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid165_lzcZ_uid55_fpSinPiTest(MUX,164)@8
    vStagei_uid165_lzcZ_uid55_fpSinPiTest_s <= vCount_uid162_lzcZ_uid55_fpSinPiTest_q;
    vStagei_uid165_lzcZ_uid55_fpSinPiTest: PROCESS (vStagei_uid165_lzcZ_uid55_fpSinPiTest_s, en, reg_rVStage_uid161_lzcZ_uid55_fpSinPiTest_0_to_vCount_uid162_lzcZ_uid55_fpSinPiTest_1_q, reg_vStage_uid163_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid165_lzcZ_uid55_fpSinPiTest_3_q)
    BEGIN
            CASE vStagei_uid165_lzcZ_uid55_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid165_lzcZ_uid55_fpSinPiTest_q <= reg_rVStage_uid161_lzcZ_uid55_fpSinPiTest_0_to_vCount_uid162_lzcZ_uid55_fpSinPiTest_1_q;
                  WHEN "1" => vStagei_uid165_lzcZ_uid55_fpSinPiTest_q <= reg_vStage_uid163_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid165_lzcZ_uid55_fpSinPiTest_3_q;
                  WHEN OTHERS => vStagei_uid165_lzcZ_uid55_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid167_lzcZ_uid55_fpSinPiTest(BITSELECT,166)@8
    rVStage_uid167_lzcZ_uid55_fpSinPiTest_in <= vStagei_uid165_lzcZ_uid55_fpSinPiTest_q;
    rVStage_uid167_lzcZ_uid55_fpSinPiTest_b <= rVStage_uid167_lzcZ_uid55_fpSinPiTest_in(7 downto 4);

	--vCount_uid168_lzcZ_uid55_fpSinPiTest(LOGICAL,167)@8
    vCount_uid168_lzcZ_uid55_fpSinPiTest_a <= rVStage_uid167_lzcZ_uid55_fpSinPiTest_b;
    vCount_uid168_lzcZ_uid55_fpSinPiTest_b <= leftShiftStage1Idx1Pad4_uid123_fixedPointX_uid41_fpSinPiTest_q;
    vCount_uid168_lzcZ_uid55_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid168_lzcZ_uid55_fpSinPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid168_lzcZ_uid55_fpSinPiTest_a = vCount_uid168_lzcZ_uid55_fpSinPiTest_b) THEN
                vCount_uid168_lzcZ_uid55_fpSinPiTest_q <= "1";
            ELSE
                vCount_uid168_lzcZ_uid55_fpSinPiTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--vStage_uid169_lzcZ_uid55_fpSinPiTest(BITSELECT,168)@8
    vStage_uid169_lzcZ_uid55_fpSinPiTest_in <= vStagei_uid165_lzcZ_uid55_fpSinPiTest_q(3 downto 0);
    vStage_uid169_lzcZ_uid55_fpSinPiTest_b <= vStage_uid169_lzcZ_uid55_fpSinPiTest_in(3 downto 0);

	--reg_vStage_uid169_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid171_lzcZ_uid55_fpSinPiTest_3(REG,254)@8
    reg_vStage_uid169_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid171_lzcZ_uid55_fpSinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid169_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid171_lzcZ_uid55_fpSinPiTest_3_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid169_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid171_lzcZ_uid55_fpSinPiTest_3_q <= vStage_uid169_lzcZ_uid55_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid167_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid171_lzcZ_uid55_fpSinPiTest_2(REG,253)@8
    reg_rVStage_uid167_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid171_lzcZ_uid55_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid167_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid171_lzcZ_uid55_fpSinPiTest_2_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid167_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid171_lzcZ_uid55_fpSinPiTest_2_q <= rVStage_uid167_lzcZ_uid55_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid171_lzcZ_uid55_fpSinPiTest(MUX,170)@9
    vStagei_uid171_lzcZ_uid55_fpSinPiTest_s <= vCount_uid168_lzcZ_uid55_fpSinPiTest_q;
    vStagei_uid171_lzcZ_uid55_fpSinPiTest: PROCESS (vStagei_uid171_lzcZ_uid55_fpSinPiTest_s, en, reg_rVStage_uid167_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid171_lzcZ_uid55_fpSinPiTest_2_q, reg_vStage_uid169_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid171_lzcZ_uid55_fpSinPiTest_3_q)
    BEGIN
            CASE vStagei_uid171_lzcZ_uid55_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid171_lzcZ_uid55_fpSinPiTest_q <= reg_rVStage_uid167_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid171_lzcZ_uid55_fpSinPiTest_2_q;
                  WHEN "1" => vStagei_uid171_lzcZ_uid55_fpSinPiTest_q <= reg_vStage_uid169_lzcZ_uid55_fpSinPiTest_0_to_vStagei_uid171_lzcZ_uid55_fpSinPiTest_3_q;
                  WHEN OTHERS => vStagei_uid171_lzcZ_uid55_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid173_lzcZ_uid55_fpSinPiTest(BITSELECT,172)@9
    rVStage_uid173_lzcZ_uid55_fpSinPiTest_in <= vStagei_uid171_lzcZ_uid55_fpSinPiTest_q;
    rVStage_uid173_lzcZ_uid55_fpSinPiTest_b <= rVStage_uid173_lzcZ_uid55_fpSinPiTest_in(3 downto 2);

	--vCount_uid174_lzcZ_uid55_fpSinPiTest(LOGICAL,173)@9
    vCount_uid174_lzcZ_uid55_fpSinPiTest_a <= rVStage_uid173_lzcZ_uid55_fpSinPiTest_b;
    vCount_uid174_lzcZ_uid55_fpSinPiTest_b <= leftShiftStage2Idx2Pad2_uid137_fixedPointX_uid41_fpSinPiTest_q;
    vCount_uid174_lzcZ_uid55_fpSinPiTest_q <= "1" when vCount_uid174_lzcZ_uid55_fpSinPiTest_a = vCount_uid174_lzcZ_uid55_fpSinPiTest_b else "0";

	--vStage_uid175_lzcZ_uid55_fpSinPiTest(BITSELECT,174)@9
    vStage_uid175_lzcZ_uid55_fpSinPiTest_in <= vStagei_uid171_lzcZ_uid55_fpSinPiTest_q(1 downto 0);
    vStage_uid175_lzcZ_uid55_fpSinPiTest_b <= vStage_uid175_lzcZ_uid55_fpSinPiTest_in(1 downto 0);

	--vStagei_uid177_lzcZ_uid55_fpSinPiTest(MUX,176)@9
    vStagei_uid177_lzcZ_uid55_fpSinPiTest_s <= vCount_uid174_lzcZ_uid55_fpSinPiTest_q;
    vStagei_uid177_lzcZ_uid55_fpSinPiTest: PROCESS (vStagei_uid177_lzcZ_uid55_fpSinPiTest_s, en, rVStage_uid173_lzcZ_uid55_fpSinPiTest_b, vStage_uid175_lzcZ_uid55_fpSinPiTest_b)
    BEGIN
            CASE vStagei_uid177_lzcZ_uid55_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid177_lzcZ_uid55_fpSinPiTest_q <= rVStage_uid173_lzcZ_uid55_fpSinPiTest_b;
                  WHEN "1" => vStagei_uid177_lzcZ_uid55_fpSinPiTest_q <= vStage_uid175_lzcZ_uid55_fpSinPiTest_b;
                  WHEN OTHERS => vStagei_uid177_lzcZ_uid55_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid179_lzcZ_uid55_fpSinPiTest(BITSELECT,178)@9
    rVStage_uid179_lzcZ_uid55_fpSinPiTest_in <= vStagei_uid177_lzcZ_uid55_fpSinPiTest_q;
    rVStage_uid179_lzcZ_uid55_fpSinPiTest_b <= rVStage_uid179_lzcZ_uid55_fpSinPiTest_in(1 downto 1);

	--vCount_uid180_lzcZ_uid55_fpSinPiTest(LOGICAL,179)@9
    vCount_uid180_lzcZ_uid55_fpSinPiTest_a <= rVStage_uid179_lzcZ_uid55_fpSinPiTest_b;
    vCount_uid180_lzcZ_uid55_fpSinPiTest_b <= GND_q;
    vCount_uid180_lzcZ_uid55_fpSinPiTest_q <= "1" when vCount_uid180_lzcZ_uid55_fpSinPiTest_a = vCount_uid180_lzcZ_uid55_fpSinPiTest_b else "0";

	--r_uid181_lzcZ_uid55_fpSinPiTest(BITJOIN,180)@9
    r_uid181_lzcZ_uid55_fpSinPiTest_q <= ld_vCount_uid148_lzcZ_uid55_fpSinPiTest_q_to_r_uid181_lzcZ_uid55_fpSinPiTest_f_q & reg_vCount_uid156_lzcZ_uid55_fpSinPiTest_0_to_r_uid181_lzcZ_uid55_fpSinPiTest_4_q & ld_vCount_uid162_lzcZ_uid55_fpSinPiTest_q_to_r_uid181_lzcZ_uid55_fpSinPiTest_d_q & vCount_uid168_lzcZ_uid55_fpSinPiTest_q & vCount_uid174_lzcZ_uid55_fpSinPiTest_q & vCount_uid180_lzcZ_uid55_fpSinPiTest_q;

	--leftShiftStageSel5Dto4_uid191_alignedZ_uid56_fpSinPiTest(BITSELECT,190)@9
    leftShiftStageSel5Dto4_uid191_alignedZ_uid56_fpSinPiTest_in <= r_uid181_lzcZ_uid55_fpSinPiTest_q;
    leftShiftStageSel5Dto4_uid191_alignedZ_uid56_fpSinPiTest_b <= leftShiftStageSel5Dto4_uid191_alignedZ_uid56_fpSinPiTest_in(5 downto 4);

	--reg_leftShiftStageSel5Dto4_uid191_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_1(REG,256)@9
    reg_leftShiftStageSel5Dto4_uid191_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel5Dto4_uid191_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel5Dto4_uid191_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_1_q <= leftShiftStageSel5Dto4_uid191_alignedZ_uid56_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest(MUX,191)@10
    leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_s <= reg_leftShiftStageSel5Dto4_uid191_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_1_q;
    leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest: PROCESS (leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_s, en, ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_q, leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_q, leftShiftStage0Idx2_uid189_alignedZ_uid56_fpSinPiTest_q, ozz_uid45_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_q <= ld_z_uid53_fpSinPiTest_q_to_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_c_replace_mem_q;
                  WHEN "01" => leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_q <= leftShiftStage0Idx1_uid186_alignedZ_uid56_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_q <= leftShiftStage0Idx2_uid189_alignedZ_uid56_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_q <= ozz_uid45_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage022dto0_uid200_alignedZ_uid56_fpSinPiTest(BITSELECT,199)@10
    LeftShiftStage022dto0_uid200_alignedZ_uid56_fpSinPiTest_in <= leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_q(22 downto 0);
    LeftShiftStage022dto0_uid200_alignedZ_uid56_fpSinPiTest_b <= LeftShiftStage022dto0_uid200_alignedZ_uid56_fpSinPiTest_in(22 downto 0);

	--ld_LeftShiftStage022dto0_uid200_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx3_uid201_alignedZ_uid56_fpSinPiTest_b(DELAY,474)@10
    ld_LeftShiftStage022dto0_uid200_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx3_uid201_alignedZ_uid56_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => LeftShiftStage022dto0_uid200_alignedZ_uid56_fpSinPiTest_b, xout => ld_LeftShiftStage022dto0_uid200_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx3_uid201_alignedZ_uid56_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx3_uid201_alignedZ_uid56_fpSinPiTest(BITJOIN,200)@11
    leftShiftStage1Idx3_uid201_alignedZ_uid56_fpSinPiTest_q <= ld_LeftShiftStage022dto0_uid200_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx3_uid201_alignedZ_uid56_fpSinPiTest_b_q & leftShiftStage1Idx3Pad12_uid129_fixedPointX_uid41_fpSinPiTest_q;

	--LeftShiftStage026dto0_uid197_alignedZ_uid56_fpSinPiTest(BITSELECT,196)@10
    LeftShiftStage026dto0_uid197_alignedZ_uid56_fpSinPiTest_in <= leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_q(26 downto 0);
    LeftShiftStage026dto0_uid197_alignedZ_uid56_fpSinPiTest_b <= LeftShiftStage026dto0_uid197_alignedZ_uid56_fpSinPiTest_in(26 downto 0);

	--ld_LeftShiftStage026dto0_uid197_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx2_uid198_alignedZ_uid56_fpSinPiTest_b(DELAY,472)@10
    ld_LeftShiftStage026dto0_uid197_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx2_uid198_alignedZ_uid56_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 27, depth => 1 )
    PORT MAP ( xin => LeftShiftStage026dto0_uid197_alignedZ_uid56_fpSinPiTest_b, xout => ld_LeftShiftStage026dto0_uid197_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx2_uid198_alignedZ_uid56_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx2_uid198_alignedZ_uid56_fpSinPiTest(BITJOIN,197)@11
    leftShiftStage1Idx2_uid198_alignedZ_uid56_fpSinPiTest_q <= ld_LeftShiftStage026dto0_uid197_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx2_uid198_alignedZ_uid56_fpSinPiTest_b_q & cstAllZWE_uid16_fpSinPiTest_q;

	--LeftShiftStage030dto0_uid194_alignedZ_uid56_fpSinPiTest(BITSELECT,193)@10
    LeftShiftStage030dto0_uid194_alignedZ_uid56_fpSinPiTest_in <= leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_q(30 downto 0);
    LeftShiftStage030dto0_uid194_alignedZ_uid56_fpSinPiTest_b <= LeftShiftStage030dto0_uid194_alignedZ_uid56_fpSinPiTest_in(30 downto 0);

	--ld_LeftShiftStage030dto0_uid194_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx1_uid195_alignedZ_uid56_fpSinPiTest_b(DELAY,470)@10
    ld_LeftShiftStage030dto0_uid194_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx1_uid195_alignedZ_uid56_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 31, depth => 1 )
    PORT MAP ( xin => LeftShiftStage030dto0_uid194_alignedZ_uid56_fpSinPiTest_b, xout => ld_LeftShiftStage030dto0_uid194_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx1_uid195_alignedZ_uid56_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx1_uid195_alignedZ_uid56_fpSinPiTest(BITJOIN,194)@11
    leftShiftStage1Idx1_uid195_alignedZ_uid56_fpSinPiTest_q <= ld_LeftShiftStage030dto0_uid194_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage1Idx1_uid195_alignedZ_uid56_fpSinPiTest_b_q & leftShiftStage1Idx1Pad4_uid123_fixedPointX_uid41_fpSinPiTest_q;

	--reg_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_2(REG,258)@10
    reg_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_2_q <= leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest(BITSELECT,201)@9
    leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_in <= r_uid181_lzcZ_uid55_fpSinPiTest_q(3 downto 0);
    leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_b <= leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_1(REG,257)@9
    reg_leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_1_q <= leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_1_q_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_b(DELAY,476)@10
    ld_reg_leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_1_q_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_1_q, xout => ld_reg_leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_1_q_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest(MUX,202)@11
    leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_s <= ld_reg_leftShiftStageSel3Dto2_uid202_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_1_q_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_b_q;
    leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest: PROCESS (leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_s, en, reg_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_2_q, leftShiftStage1Idx1_uid195_alignedZ_uid56_fpSinPiTest_q, leftShiftStage1Idx2_uid198_alignedZ_uid56_fpSinPiTest_q, leftShiftStage1Idx3_uid201_alignedZ_uid56_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_q <= reg_leftShiftStage0_uid192_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_q <= leftShiftStage1Idx1_uid195_alignedZ_uid56_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_q <= leftShiftStage1Idx2_uid198_alignedZ_uid56_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_q <= leftShiftStage1Idx3_uid201_alignedZ_uid56_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage131dto0_uid211_alignedZ_uid56_fpSinPiTest(BITSELECT,210)@11
    LeftShiftStage131dto0_uid211_alignedZ_uid56_fpSinPiTest_in <= leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_q(31 downto 0);
    LeftShiftStage131dto0_uid211_alignedZ_uid56_fpSinPiTest_b <= LeftShiftStage131dto0_uid211_alignedZ_uid56_fpSinPiTest_in(31 downto 0);

	--ld_LeftShiftStage131dto0_uid211_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx3_uid212_alignedZ_uid56_fpSinPiTest_b(DELAY,486)@11
    ld_LeftShiftStage131dto0_uid211_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx3_uid212_alignedZ_uid56_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => LeftShiftStage131dto0_uid211_alignedZ_uid56_fpSinPiTest_b, xout => ld_LeftShiftStage131dto0_uid211_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx3_uid212_alignedZ_uid56_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx3_uid212_alignedZ_uid56_fpSinPiTest(BITJOIN,211)@12
    leftShiftStage2Idx3_uid212_alignedZ_uid56_fpSinPiTest_q <= ld_LeftShiftStage131dto0_uid211_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx3_uid212_alignedZ_uid56_fpSinPiTest_b_q & leftShiftStage2Idx3Pad3_uid140_fixedPointX_uid41_fpSinPiTest_q;

	--LeftShiftStage132dto0_uid208_alignedZ_uid56_fpSinPiTest(BITSELECT,207)@11
    LeftShiftStage132dto0_uid208_alignedZ_uid56_fpSinPiTest_in <= leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_q(32 downto 0);
    LeftShiftStage132dto0_uid208_alignedZ_uid56_fpSinPiTest_b <= LeftShiftStage132dto0_uid208_alignedZ_uid56_fpSinPiTest_in(32 downto 0);

	--ld_LeftShiftStage132dto0_uid208_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx2_uid209_alignedZ_uid56_fpSinPiTest_b(DELAY,484)@11
    ld_LeftShiftStage132dto0_uid208_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx2_uid209_alignedZ_uid56_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 33, depth => 1 )
    PORT MAP ( xin => LeftShiftStage132dto0_uid208_alignedZ_uid56_fpSinPiTest_b, xout => ld_LeftShiftStage132dto0_uid208_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx2_uid209_alignedZ_uid56_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx2_uid209_alignedZ_uid56_fpSinPiTest(BITJOIN,208)@12
    leftShiftStage2Idx2_uid209_alignedZ_uid56_fpSinPiTest_q <= ld_LeftShiftStage132dto0_uid208_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx2_uid209_alignedZ_uid56_fpSinPiTest_b_q & leftShiftStage2Idx2Pad2_uid137_fixedPointX_uid41_fpSinPiTest_q;

	--LeftShiftStage133dto0_uid205_alignedZ_uid56_fpSinPiTest(BITSELECT,204)@11
    LeftShiftStage133dto0_uid205_alignedZ_uid56_fpSinPiTest_in <= leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_q(33 downto 0);
    LeftShiftStage133dto0_uid205_alignedZ_uid56_fpSinPiTest_b <= LeftShiftStage133dto0_uid205_alignedZ_uid56_fpSinPiTest_in(33 downto 0);

	--ld_LeftShiftStage133dto0_uid205_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx1_uid206_alignedZ_uid56_fpSinPiTest_b(DELAY,482)@11
    ld_LeftShiftStage133dto0_uid205_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx1_uid206_alignedZ_uid56_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 34, depth => 1 )
    PORT MAP ( xin => LeftShiftStage133dto0_uid205_alignedZ_uid56_fpSinPiTest_b, xout => ld_LeftShiftStage133dto0_uid205_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx1_uid206_alignedZ_uid56_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx1_uid206_alignedZ_uid56_fpSinPiTest(BITJOIN,205)@12
    leftShiftStage2Idx1_uid206_alignedZ_uid56_fpSinPiTest_q <= ld_LeftShiftStage133dto0_uid205_alignedZ_uid56_fpSinPiTest_b_to_leftShiftStage2Idx1_uid206_alignedZ_uid56_fpSinPiTest_b_q & GND_q;

	--reg_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_2(REG,260)@11
    reg_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_2_q <= leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest(BITSELECT,212)@9
    leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_in <= r_uid181_lzcZ_uid55_fpSinPiTest_q(1 downto 0);
    leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_b <= leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_in(1 downto 0);

	--ld_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_b_to_reg_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_1_a(DELAY,537)@9
    ld_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_b_to_reg_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 2 )
    PORT MAP ( xin => leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_b, xout => ld_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_b_to_reg_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_1(REG,259)@11
    reg_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_1_q <= ld_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_b_to_reg_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest(MUX,213)@12
    leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_s <= reg_leftShiftStageSel1Dto0_uid213_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_1_q;
    leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest: PROCESS (leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_s, en, reg_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_2_q, leftShiftStage2Idx1_uid206_alignedZ_uid56_fpSinPiTest_q, leftShiftStage2Idx2_uid209_alignedZ_uid56_fpSinPiTest_q, leftShiftStage2Idx3_uid212_alignedZ_uid56_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_q <= reg_leftShiftStage1_uid203_alignedZ_uid56_fpSinPiTest_0_to_leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_2_q;
                  WHEN "01" => leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_q <= leftShiftStage2Idx1_uid206_alignedZ_uid56_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_q <= leftShiftStage2Idx2_uid209_alignedZ_uid56_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_q <= leftShiftStage2Idx3_uid212_alignedZ_uid56_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--alignedZLow_uid57_fpSinPiTest(BITSELECT,56)@12
    alignedZLow_uid57_fpSinPiTest_in <= leftShiftStage2_uid214_alignedZ_uid56_fpSinPiTest_q;
    alignedZLow_uid57_fpSinPiTest_b <= alignedZLow_uid57_fpSinPiTest_in(34 downto 12);

	--pHardCase_uid58_fpSinPiTest(BITJOIN,57)@12
    pHardCase_uid58_fpSinPiTest_q <= alignedZLow_uid57_fpSinPiTest_b & GND_q;

	--ld_sinXIsX_uid34_fpSinPiTest_c_to_p_uid59_fpSinPiTest_b(DELAY,313)@0
    ld_sinXIsX_uid34_fpSinPiTest_c_to_p_uid59_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => sinXIsX_uid34_fpSinPiTest_c, xout => ld_sinXIsX_uid34_fpSinPiTest_c_to_p_uid59_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--p_uid59_fpSinPiTest(MUX,58)@12
    p_uid59_fpSinPiTest_s <= ld_sinXIsX_uid34_fpSinPiTest_c_to_p_uid59_fpSinPiTest_b_q;
    p_uid59_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p_uid59_fpSinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE p_uid59_fpSinPiTest_s IS
                      WHEN "0" => p_uid59_fpSinPiTest_q <= pHardCase_uid58_fpSinPiTest_q;
                      WHEN "1" => p_uid59_fpSinPiTest_q <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_replace_mem_q;
                      WHEN OTHERS => p_uid59_fpSinPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid59_fpSinPiTest_q_to_mul2xSinRes_uid73_fpSinPiTest_a_inputreg(DELAY,577)
    ld_p_uid59_fpSinPiTest_q_to_mul2xSinRes_uid73_fpSinPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => p_uid59_fpSinPiTest_q, xout => ld_p_uid59_fpSinPiTest_q_to_mul2xSinRes_uid73_fpSinPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_p_uid59_fpSinPiTest_q_to_mul2xSinRes_uid73_fpSinPiTest_a(DELAY,328)@13
    ld_p_uid59_fpSinPiTest_q_to_mul2xSinRes_uid73_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => ld_p_uid59_fpSinPiTest_q_to_mul2xSinRes_uid73_fpSinPiTest_a_inputreg_q, xout => ld_p_uid59_fpSinPiTest_q_to_mul2xSinRes_uid73_fpSinPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--mul2xSinRes_uid73_fpSinPiTest(MULT,72)@16
    mul2xSinRes_uid73_fpSinPiTest_pr <= UNSIGNED(mul2xSinRes_uid73_fpSinPiTest_a) * UNSIGNED(mul2xSinRes_uid73_fpSinPiTest_b);
    mul2xSinRes_uid73_fpSinPiTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid73_fpSinPiTest_a <= (others => '0');
            mul2xSinRes_uid73_fpSinPiTest_b <= (others => '0');
            mul2xSinRes_uid73_fpSinPiTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mul2xSinRes_uid73_fpSinPiTest_a <= ld_p_uid59_fpSinPiTest_q_to_mul2xSinRes_uid73_fpSinPiTest_a_q;
                mul2xSinRes_uid73_fpSinPiTest_b <= multRightOp_uid72_fpSinPiTest_q;
                mul2xSinRes_uid73_fpSinPiTest_s1 <= STD_LOGIC_VECTOR(mul2xSinRes_uid73_fpSinPiTest_pr);
            END IF;
        END IF;
    END PROCESS;
    mul2xSinRes_uid73_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid73_fpSinPiTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mul2xSinRes_uid73_fpSinPiTest_q <= mul2xSinRes_uid73_fpSinPiTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normBit_uid74_fpSinPiTest(BITSELECT,73)@19
    normBit_uid74_fpSinPiTest_in <= mul2xSinRes_uid73_fpSinPiTest_q;
    normBit_uid74_fpSinPiTest_b <= normBit_uid74_fpSinPiTest_in(48 downto 48);

	--rndExpUpdate_uid79_uid80_fpSinPiTest(BITJOIN,79)@19
    rndExpUpdate_uid79_uid80_fpSinPiTest_q <= normBit_uid74_fpSinPiTest_b & cstAllZWF_uid10_fpSinPiTest_q & VCC_q;

	--ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_nor(LOGICAL,588)
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_nor_a <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_notEnable_q;
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_nor_b <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_sticky_ena_q;
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_nor_q <= not (ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_nor_a or ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_nor_b);

	--ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_mem_top(CONSTANT,584)
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_mem_top_q <= "0101";

	--ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmp(LOGICAL,585)
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmp_a <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_mem_top_q;
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdmux_q);
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmp_q <= "1" when ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmp_a = ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmp_b else "0";

	--ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmpReg(REG,586)
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmpReg_q <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_sticky_ena(REG,589)
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_nor_q = "1") THEN
                ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_sticky_ena_q <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_enaAnd(LOGICAL,590)
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_enaAnd_a <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_sticky_ena_q;
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_enaAnd_b <= en;
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_enaAnd_q <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_enaAnd_a and ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_enaAnd_b;

	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_nor(LOGICAL,574)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_nor_a <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_notEnable_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_nor_b <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_sticky_ena_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_nor_q <= not (ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_nor_a or ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_nor_b);

	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_mem_top(CONSTANT,570)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_mem_top_q <= "0111";

	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmp(LOGICAL,571)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmp_a <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_mem_top_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdmux_q);
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmp_q <= "1" when ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmp_a = ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmp_b else "0";

	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmpReg(REG,572)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmpReg_q <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_sticky_ena(REG,575)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_nor_q = "1") THEN
                ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_sticky_ena_q <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_enaAnd(LOGICAL,576)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_enaAnd_a <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_sticky_ena_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_enaAnd_b <= en;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_enaAnd_q <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_enaAnd_a and ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_enaAnd_b;

	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_inputreg(DELAY,564)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expX_uid6_fpSinPiTest_b, xout => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdcnt(COUNTER,566)
    -- every=1, low=0, high=7, step=1, init=1
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdcnt_i <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdcnt_i,3));


	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdreg(REG,567)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdreg_q <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdmux(MUX,568)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdmux_s <= en;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdmux: PROCESS (ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdmux_s, ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdreg_q, ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdmux_q <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdmux_q <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem(DUALMEM,565)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_ia <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_inputreg_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_aa <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdreg_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_ab <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_rdmux_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_iq,
        address_a => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_aa,
        data_a => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_ia
    );
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_reset0 <= areset;
        ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_q <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_iq(7 downto 0);

	--expXP1_uid62_fpSinPiTest(ADD,61)@10
    expXP1_uid62_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid62_fpSinPiTest_a_replace_mem_q);
    expXP1_uid62_fpSinPiTest_b <= STD_LOGIC_VECTOR("00000000" & VCC_q);
            expXP1_uid62_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXP1_uid62_fpSinPiTest_a) + UNSIGNED(expXP1_uid62_fpSinPiTest_b));
    expXP1_uid62_fpSinPiTest_q <= expXP1_uid62_fpSinPiTest_o(8 downto 0);


	--expXP1R_uid63_fpSinPiTest(BITSELECT,62)@10
    expXP1R_uid63_fpSinPiTest_in <= expXP1_uid62_fpSinPiTest_q(7 downto 0);
    expXP1R_uid63_fpSinPiTest_b <= expXP1R_uid63_fpSinPiTest_in(7 downto 0);

	--reg_r_uid181_lzcZ_uid55_fpSinPiTest_0_to_expHardCase_uid61_fpSinPiTest_1(REG,267)@9
    reg_r_uid181_lzcZ_uid55_fpSinPiTest_0_to_expHardCase_uid61_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_r_uid181_lzcZ_uid55_fpSinPiTest_0_to_expHardCase_uid61_fpSinPiTest_1_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_r_uid181_lzcZ_uid55_fpSinPiTest_0_to_expHardCase_uid61_fpSinPiTest_1_q <= r_uid181_lzcZ_uid55_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expHardCase_uid61_fpSinPiTest(SUB,60)@10
    expHardCase_uid61_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & biasM1_uid31_fpSinPiTest_q);
    expHardCase_uid61_fpSinPiTest_b <= STD_LOGIC_VECTOR("000" & reg_r_uid181_lzcZ_uid55_fpSinPiTest_0_to_expHardCase_uid61_fpSinPiTest_1_q);
            expHardCase_uid61_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expHardCase_uid61_fpSinPiTest_a) - UNSIGNED(expHardCase_uid61_fpSinPiTest_b));
    expHardCase_uid61_fpSinPiTest_q <= expHardCase_uid61_fpSinPiTest_o(8 downto 0);


	--expHardCaseR_uid64_fpSinPiTest(BITSELECT,63)@10
    expHardCaseR_uid64_fpSinPiTest_in <= expHardCase_uid61_fpSinPiTest_q(7 downto 0);
    expHardCaseR_uid64_fpSinPiTest_b <= expHardCaseR_uid64_fpSinPiTest_in(7 downto 0);

	--ld_sinXIsX_uid34_fpSinPiTest_c_to_expP_uid65_fpSinPiTest_b(DELAY,320)@0
    ld_sinXIsX_uid34_fpSinPiTest_c_to_expP_uid65_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 10 )
    PORT MAP ( xin => sinXIsX_uid34_fpSinPiTest_c, xout => ld_sinXIsX_uid34_fpSinPiTest_c_to_expP_uid65_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expP_uid65_fpSinPiTest(MUX,64)@10
    expP_uid65_fpSinPiTest_s <= ld_sinXIsX_uid34_fpSinPiTest_c_to_expP_uid65_fpSinPiTest_b_q;
    expP_uid65_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expP_uid65_fpSinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expP_uid65_fpSinPiTest_s IS
                      WHEN "0" => expP_uid65_fpSinPiTest_q <= expHardCaseR_uid64_fpSinPiTest_b;
                      WHEN "1" => expP_uid65_fpSinPiTest_q <= expXP1R_uid63_fpSinPiTest_b;
                      WHEN OTHERS => expP_uid65_fpSinPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_inputreg(DELAY,578)
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expP_uid65_fpSinPiTest_q, xout => ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt(COUNTER,580)
    -- every=1, low=0, high=5, step=1, init=1
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_i = 4 THEN
                      ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_eq = '1') THEN
                        ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_i <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_i - 5;
                    ELSE
                        ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_i <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_i,3));


	--ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdreg(REG,581)
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdreg_q <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdmux(MUX,582)
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdmux_s <= en;
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdmux: PROCESS (ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdmux_s, ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdreg_q, ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdmux_q <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdmux_q <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem(DUALMEM,579)
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_ia <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_inputreg_q;
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_aa <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdreg_q;
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_ab <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_rdmux_q;
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_iq,
        address_a => ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_aa,
        data_a => ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_ia
    );
    ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_reset0 <= areset;
        ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_q <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_iq(7 downto 0);

	--highRes_uid75_fpSinPiTest(BITSELECT,74)@19
    highRes_uid75_fpSinPiTest_in <= mul2xSinRes_uid73_fpSinPiTest_q(47 downto 0);
    highRes_uid75_fpSinPiTest_b <= highRes_uid75_fpSinPiTest_in(47 downto 24);

	--lowRes_uid76_fpSinPiTest(BITSELECT,75)@19
    lowRes_uid76_fpSinPiTest_in <= mul2xSinRes_uid73_fpSinPiTest_q(46 downto 0);
    lowRes_uid76_fpSinPiTest_b <= lowRes_uid76_fpSinPiTest_in(46 downto 23);

	--fracRCompPreRnd_uid77_fpSinPiTest(MUX,76)@19
    fracRCompPreRnd_uid77_fpSinPiTest_s <= normBit_uid74_fpSinPiTest_b;
    fracRCompPreRnd_uid77_fpSinPiTest: PROCESS (fracRCompPreRnd_uid77_fpSinPiTest_s, en, lowRes_uid76_fpSinPiTest_b, highRes_uid75_fpSinPiTest_b)
    BEGIN
            CASE fracRCompPreRnd_uid77_fpSinPiTest_s IS
                  WHEN "0" => fracRCompPreRnd_uid77_fpSinPiTest_q <= lowRes_uid76_fpSinPiTest_b;
                  WHEN "1" => fracRCompPreRnd_uid77_fpSinPiTest_q <= highRes_uid75_fpSinPiTest_b;
                  WHEN OTHERS => fracRCompPreRnd_uid77_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracPreRnd_uid78_uid78_fpSinPiTest(BITJOIN,77)@19
    expFracPreRnd_uid78_uid78_fpSinPiTest_q <= ld_expP_uid65_fpSinPiTest_q_to_expFracPreRnd_uid78_uid78_fpSinPiTest_b_replace_mem_q & fracRCompPreRnd_uid77_fpSinPiTest_q;

	--expFracComp_uid81_fpSinPiTest(ADD,80)@19
    expFracComp_uid81_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & expFracPreRnd_uid78_uid78_fpSinPiTest_q);
    expFracComp_uid81_fpSinPiTest_b <= STD_LOGIC_VECTOR("00000000" & rndExpUpdate_uid79_uid80_fpSinPiTest_q);
            expFracComp_uid81_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracComp_uid81_fpSinPiTest_a) + UNSIGNED(expFracComp_uid81_fpSinPiTest_b));
    expFracComp_uid81_fpSinPiTest_q <= expFracComp_uid81_fpSinPiTest_o(32 downto 0);


	--expRComp_uid83_fpSinPiTest(BITSELECT,82)@19
    expRComp_uid83_fpSinPiTest_in <= expFracComp_uid81_fpSinPiTest_q(31 downto 0);
    expRComp_uid83_fpSinPiTest_b <= expRComp_uid83_fpSinPiTest_in(31 downto 24);

	--reg_expRComp_uid83_fpSinPiTest_0_to_expRPostExc1_uid101_fpSinPiTest_2(REG,271)@19
    reg_expRComp_uid83_fpSinPiTest_0_to_expRPostExc1_uid101_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRComp_uid83_fpSinPiTest_0_to_expRPostExc1_uid101_fpSinPiTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRComp_uid83_fpSinPiTest_0_to_expRPostExc1_uid101_fpSinPiTest_2_q <= expRComp_uid83_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_xIsInt_uid87_fpSinPiTest_0_to_rZOrXInt_uid98_fpSinPiTest_2(REG,270)@4
    reg_xIsInt_uid87_fpSinPiTest_0_to_rZOrXInt_uid98_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xIsInt_uid87_fpSinPiTest_0_to_rZOrXInt_uid98_fpSinPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xIsInt_uid87_fpSinPiTest_0_to_rZOrXInt_uid98_fpSinPiTest_2_q <= xIsInt_uid87_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_expXIsZero_uid18_fpSinPiTest_0_to_excRZero_uid92_fpSinPiTest_2(REG,244)@0
    reg_expXIsZero_uid18_fpSinPiTest_0_to_excRZero_uid92_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXIsZero_uid18_fpSinPiTest_0_to_excRZero_uid92_fpSinPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXIsZero_uid18_fpSinPiTest_0_to_excRZero_uid92_fpSinPiTest_2_q <= expXIsZero_uid18_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expXIsZero_uid18_fpSinPiTest_0_to_excRZero_uid92_fpSinPiTest_2_q_to_excRZero_uid92_fpSinPiTest_b(DELAY,358)@1
    ld_reg_expXIsZero_uid18_fpSinPiTest_0_to_excRZero_uid92_fpSinPiTest_2_q_to_excRZero_uid92_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => reg_expXIsZero_uid18_fpSinPiTest_0_to_excRZero_uid92_fpSinPiTest_2_q, xout => ld_reg_expXIsZero_uid18_fpSinPiTest_0_to_excRZero_uid92_fpSinPiTest_2_q_to_excRZero_uid92_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--regXAndInt_uid91_fpSinPiTest(LOGICAL,90)@4
    regXAndInt_uid91_fpSinPiTest_a <= xIsInt_uid87_fpSinPiTest_q;
    regXAndInt_uid91_fpSinPiTest_b <= ld_exc_R_uid29_fpSinPiTest_q_to_xIsInt_uid87_fpSinPiTest_a_q;
    regXAndInt_uid91_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            regXAndInt_uid91_fpSinPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            regXAndInt_uid91_fpSinPiTest_q <= regXAndInt_uid91_fpSinPiTest_a and regXAndInt_uid91_fpSinPiTest_b;
        END IF;
        END IF;
    END PROCESS;



	--excRZero_uid92_fpSinPiTest(LOGICAL,91)@5
    excRZero_uid92_fpSinPiTest_a <= regXAndInt_uid91_fpSinPiTest_q;
    excRZero_uid92_fpSinPiTest_b <= ld_reg_expXIsZero_uid18_fpSinPiTest_0_to_excRZero_uid92_fpSinPiTest_2_q_to_excRZero_uid92_fpSinPiTest_b_q;
    excRZero_uid92_fpSinPiTest_q <= excRZero_uid92_fpSinPiTest_a or excRZero_uid92_fpSinPiTest_b;

	--rZOrXInt_uid98_fpSinPiTest(LOGICAL,97)@5
    rZOrXInt_uid98_fpSinPiTest_a <= excRZero_uid92_fpSinPiTest_q;
    rZOrXInt_uid98_fpSinPiTest_b <= reg_xIsInt_uid87_fpSinPiTest_0_to_rZOrXInt_uid98_fpSinPiTest_2_q;
    rZOrXInt_uid98_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rZOrXInt_uid98_fpSinPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            rZOrXInt_uid98_fpSinPiTest_q <= rZOrXInt_uid98_fpSinPiTest_a or rZOrXInt_uid98_fpSinPiTest_b;
        END IF;
        END IF;
    END PROCESS;



	--ld_rZOrXInt_uid98_fpSinPiTest_q_to_expRPostExc1_uid101_fpSinPiTest_b(DELAY,369)@6
    ld_rZOrXInt_uid98_fpSinPiTest_q_to_expRPostExc1_uid101_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => rZOrXInt_uid98_fpSinPiTest_q, xout => ld_rZOrXInt_uid98_fpSinPiTest_q_to_expRPostExc1_uid101_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expRPostExc1_uid101_fpSinPiTest(MUX,100)@20
    expRPostExc1_uid101_fpSinPiTest_s <= ld_rZOrXInt_uid98_fpSinPiTest_q_to_expRPostExc1_uid101_fpSinPiTest_b_q;
    expRPostExc1_uid101_fpSinPiTest: PROCESS (expRPostExc1_uid101_fpSinPiTest_s, en, reg_expRComp_uid83_fpSinPiTest_0_to_expRPostExc1_uid101_fpSinPiTest_2_q, cstAllZWE_uid16_fpSinPiTest_q)
    BEGIN
            CASE expRPostExc1_uid101_fpSinPiTest_s IS
                  WHEN "0" => expRPostExc1_uid101_fpSinPiTest_q <= reg_expRComp_uid83_fpSinPiTest_0_to_expRPostExc1_uid101_fpSinPiTest_2_q;
                  WHEN "1" => expRPostExc1_uid101_fpSinPiTest_q <= cstAllZWE_uid16_fpSinPiTest_q;
                  WHEN OTHERS => expRPostExc1_uid101_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_nor(LOGICAL,649)
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_nor_a <= ld_oFracX_uid35_uid35_fpSinPiTest_q_to_p_uid59_fpSinPiTest_d_notEnable_q;
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_nor_b <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_sticky_ena_q;
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_nor_q <= not (ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_nor_a or ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_nor_b);

	--ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_mem_top(CONSTANT,645)
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_mem_top_q <= "01100";

	--ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmp(LOGICAL,646)
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmp_a <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_mem_top_q;
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdmux_q);
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmp_q <= "1" when ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmp_a = ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmp_b else "0";

	--ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmpReg(REG,647)
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmpReg_q <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_sticky_ena(REG,650)
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_nor_q = "1") THEN
                ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_sticky_ena_q <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_enaAnd(LOGICAL,651)
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_enaAnd_a <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_sticky_ena_q;
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_enaAnd_b <= en;
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_enaAnd_q <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_enaAnd_a and ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_enaAnd_b;

	--InvXIntExp_uid88_fpSinPiTest(LOGICAL,87)@4
    InvXIntExp_uid88_fpSinPiTest_a <= ld_xIntExp_uid30_fpSinPiTest_c_to_xIntYz_uid86_fpSinPiTest_a_q;
    InvXIntExp_uid88_fpSinPiTest_q <= not InvXIntExp_uid88_fpSinPiTest_a;

	--join_uid46_fpSinPiTest(BITJOIN,45)@4
    join_uid46_fpSinPiTest_q <= VCC_q & ozz_uid45_fpSinPiTest_q;

	--yIsZero_uid47_fpSinPiTest(LOGICAL,46)@4
    yIsZero_uid47_fpSinPiTest_a <= reg_y_uid43_fpSinPiTest_0_to_yIsZero_uid47_fpSinPiTest_1_q;
    yIsZero_uid47_fpSinPiTest_b <= join_uid46_fpSinPiTest_q;
    yIsZero_uid47_fpSinPiTest_q <= "1" when yIsZero_uid47_fpSinPiTest_a = yIsZero_uid47_fpSinPiTest_b else "0";

	--xRyHalf_uid90_fpSinPiTest(LOGICAL,89)@4
    xRyHalf_uid90_fpSinPiTest_a <= ld_exc_R_uid29_fpSinPiTest_q_to_xIsInt_uid87_fpSinPiTest_a_q;
    xRyHalf_uid90_fpSinPiTest_b <= yIsZero_uid47_fpSinPiTest_q;
    xRyHalf_uid90_fpSinPiTest_c <= InvSinXIsX_uid84_fpSinPiTest_q;
    xRyHalf_uid90_fpSinPiTest_d <= InvXIntExp_uid88_fpSinPiTest_q;
    xRyHalf_uid90_fpSinPiTest_q <= xRyHalf_uid90_fpSinPiTest_a and xRyHalf_uid90_fpSinPiTest_b and xRyHalf_uid90_fpSinPiTest_c and xRyHalf_uid90_fpSinPiTest_d;

	--excRNaN_uid93_fpSinPiTest(LOGICAL,92)@0
    excRNaN_uid93_fpSinPiTest_a <= exc_N_uid25_fpSinPiTest_q;
    excRNaN_uid93_fpSinPiTest_b <= exc_I_uid23_fpSinPiTest_q;
    excRNaN_uid93_fpSinPiTest_q <= excRNaN_uid93_fpSinPiTest_a or excRNaN_uid93_fpSinPiTest_b;

	--ld_excRNaN_uid93_fpSinPiTest_q_to_excRIoN_uid102_fpSinPiTest_b(DELAY,371)@0
    ld_excRNaN_uid93_fpSinPiTest_q_to_excRIoN_uid102_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => excRNaN_uid93_fpSinPiTest_q, xout => ld_excRNaN_uid93_fpSinPiTest_q_to_excRIoN_uid102_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--excRIoN_uid102_fpSinPiTest(LOGICAL,101)@4
    excRIoN_uid102_fpSinPiTest_a <= GND_q;
    excRIoN_uid102_fpSinPiTest_b <= ld_excRNaN_uid93_fpSinPiTest_q_to_excRIoN_uid102_fpSinPiTest_b_q;
    excRIoN_uid102_fpSinPiTest_q <= excRIoN_uid102_fpSinPiTest_a or excRIoN_uid102_fpSinPiTest_b;

	--join_uid103_fpSinPiTest(BITJOIN,102)@4
    join_uid103_fpSinPiTest_q <= xRyHalf_uid90_fpSinPiTest_q & excRIoN_uid102_fpSinPiTest_q;

	--ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_inputreg(DELAY,639)
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_inputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => join_uid103_fpSinPiTest_q, xout => ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt(COUNTER,641)
    -- every=1, low=0, high=12, step=1, init=1
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_i = 11 THEN
                      ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_eq = '1') THEN
                        ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_i <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_i - 12;
                    ELSE
                        ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_i <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_i,4));


	--ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdreg(REG,642)
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdreg_q <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdmux(MUX,643)
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdmux_s <= en;
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdmux: PROCESS (ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdmux_s, ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdreg_q, ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_q)
    BEGIN
            CASE ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdmux_s IS
                  WHEN "0" => ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdmux_q <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdreg_q;
                  WHEN "1" => ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdmux_q <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem(DUALMEM,640)
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_ia <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_inputreg_q;
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_aa <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdreg_q;
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_ab <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_rdmux_q;
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_iq,
        address_a => ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_aa,
        data_a => ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_ia
    );
    ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_reset0 <= areset;
        ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_q <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_iq(1 downto 0);

	--reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1(REG,272)@19
    reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_q <= ld_join_uid103_fpSinPiTest_q_to_reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--expRPostExc_uid104_fpSinPiTest(MUX,103)@20
    expRPostExc_uid104_fpSinPiTest_s <= reg_join_uid103_fpSinPiTest_0_to_expRPostExc_uid104_fpSinPiTest_1_q;
    expRPostExc_uid104_fpSinPiTest: PROCESS (expRPostExc_uid104_fpSinPiTest_s, en, expRPostExc1_uid101_fpSinPiTest_q, cstAllOWE_uid9_fpSinPiTest_q, cstBias_uid11_fpSinPiTest_q, cstBias_uid11_fpSinPiTest_q)
    BEGIN
            CASE expRPostExc_uid104_fpSinPiTest_s IS
                  WHEN "00" => expRPostExc_uid104_fpSinPiTest_q <= expRPostExc1_uid101_fpSinPiTest_q;
                  WHEN "01" => expRPostExc_uid104_fpSinPiTest_q <= cstAllOWE_uid9_fpSinPiTest_q;
                  WHEN "10" => expRPostExc_uid104_fpSinPiTest_q <= cstBias_uid11_fpSinPiTest_q;
                  WHEN "11" => expRPostExc_uid104_fpSinPiTest_q <= cstBias_uid11_fpSinPiTest_q;
                  WHEN OTHERS => expRPostExc_uid104_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oneFracRPostExc2_uid96_fpSinPiTest(CONSTANT,95)
    oneFracRPostExc2_uid96_fpSinPiTest_q <= "00000000000000000000001";

	--fracRComp_uid82_fpSinPiTest(BITSELECT,81)@19
    fracRComp_uid82_fpSinPiTest_in <= expFracComp_uid81_fpSinPiTest_q(23 downto 0);
    fracRComp_uid82_fpSinPiTest_b <= fracRComp_uid82_fpSinPiTest_in(23 downto 1);

	--reg_fracRComp_uid82_fpSinPiTest_0_to_fracRPostExc1_uid95_fpSinPiTest_2(REG,268)@19
    reg_fracRComp_uid82_fpSinPiTest_0_to_fracRPostExc1_uid95_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRComp_uid82_fpSinPiTest_0_to_fracRPostExc1_uid95_fpSinPiTest_2_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRComp_uid82_fpSinPiTest_0_to_fracRPostExc1_uid95_fpSinPiTest_2_q <= fracRComp_uid82_fpSinPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_xRyHalf_uid90_fpSinPiTest_0_to_xHalfRZI_uid94_fpSinPiTest_1(REG,245)@4
    reg_xRyHalf_uid90_fpSinPiTest_0_to_xHalfRZI_uid94_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xRyHalf_uid90_fpSinPiTest_0_to_xHalfRZI_uid94_fpSinPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xRyHalf_uid90_fpSinPiTest_0_to_xHalfRZI_uid94_fpSinPiTest_1_q <= xRyHalf_uid90_fpSinPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--xHalfRZI_uid94_fpSinPiTest(LOGICAL,93)@5
    xHalfRZI_uid94_fpSinPiTest_a <= reg_xRyHalf_uid90_fpSinPiTest_0_to_xHalfRZI_uid94_fpSinPiTest_1_q;
    xHalfRZI_uid94_fpSinPiTest_b <= excRZero_uid92_fpSinPiTest_q;
    xHalfRZI_uid94_fpSinPiTest_c <= GND_q;
    xHalfRZI_uid94_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xHalfRZI_uid94_fpSinPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            xHalfRZI_uid94_fpSinPiTest_q <= xHalfRZI_uid94_fpSinPiTest_a or xHalfRZI_uid94_fpSinPiTest_b or xHalfRZI_uid94_fpSinPiTest_c;
        END IF;
        END IF;
    END PROCESS;



	--ld_xHalfRZI_uid94_fpSinPiTest_q_to_fracRPostExc1_uid95_fpSinPiTest_b(DELAY,363)@6
    ld_xHalfRZI_uid94_fpSinPiTest_q_to_fracRPostExc1_uid95_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => xHalfRZI_uid94_fpSinPiTest_q, xout => ld_xHalfRZI_uid94_fpSinPiTest_q_to_fracRPostExc1_uid95_fpSinPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc1_uid95_fpSinPiTest(MUX,94)@20
    fracRPostExc1_uid95_fpSinPiTest_s <= ld_xHalfRZI_uid94_fpSinPiTest_q_to_fracRPostExc1_uid95_fpSinPiTest_b_q;
    fracRPostExc1_uid95_fpSinPiTest: PROCESS (fracRPostExc1_uid95_fpSinPiTest_s, en, reg_fracRComp_uid82_fpSinPiTest_0_to_fracRPostExc1_uid95_fpSinPiTest_2_q, cstAllZWF_uid10_fpSinPiTest_q)
    BEGIN
            CASE fracRPostExc1_uid95_fpSinPiTest_s IS
                  WHEN "0" => fracRPostExc1_uid95_fpSinPiTest_q <= reg_fracRComp_uid82_fpSinPiTest_0_to_fracRPostExc1_uid95_fpSinPiTest_2_q;
                  WHEN "1" => fracRPostExc1_uid95_fpSinPiTest_q <= cstAllZWF_uid10_fpSinPiTest_q;
                  WHEN OTHERS => fracRPostExc1_uid95_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_excRNaN_uid93_fpSinPiTest_q_to_reg_excRNaN_uid93_fpSinPiTest_0_to_fracRPostExc_uid97_fpSinPiTest_1_a(DELAY,547)@0
    ld_excRNaN_uid93_fpSinPiTest_q_to_reg_excRNaN_uid93_fpSinPiTest_0_to_fracRPostExc_uid97_fpSinPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => excRNaN_uid93_fpSinPiTest_q, xout => ld_excRNaN_uid93_fpSinPiTest_q_to_reg_excRNaN_uid93_fpSinPiTest_0_to_fracRPostExc_uid97_fpSinPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_excRNaN_uid93_fpSinPiTest_0_to_fracRPostExc_uid97_fpSinPiTest_1(REG,269)@19
    reg_excRNaN_uid93_fpSinPiTest_0_to_fracRPostExc_uid97_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excRNaN_uid93_fpSinPiTest_0_to_fracRPostExc_uid97_fpSinPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excRNaN_uid93_fpSinPiTest_0_to_fracRPostExc_uid97_fpSinPiTest_1_q <= ld_excRNaN_uid93_fpSinPiTest_q_to_reg_excRNaN_uid93_fpSinPiTest_0_to_fracRPostExc_uid97_fpSinPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--fracRPostExc_uid97_fpSinPiTest(MUX,96)@20
    fracRPostExc_uid97_fpSinPiTest_s <= reg_excRNaN_uid93_fpSinPiTest_0_to_fracRPostExc_uid97_fpSinPiTest_1_q;
    fracRPostExc_uid97_fpSinPiTest: PROCESS (fracRPostExc_uid97_fpSinPiTest_s, en, fracRPostExc1_uid95_fpSinPiTest_q, oneFracRPostExc2_uid96_fpSinPiTest_q)
    BEGIN
            CASE fracRPostExc_uid97_fpSinPiTest_s IS
                  WHEN "0" => fracRPostExc_uid97_fpSinPiTest_q <= fracRPostExc1_uid95_fpSinPiTest_q;
                  WHEN "1" => fracRPostExc_uid97_fpSinPiTest_q <= oneFracRPostExc2_uid96_fpSinPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid97_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid111_fpSinPiTest(BITJOIN,110)@20
    R_uid111_fpSinPiTest_q <= ld_signR_uid110_fpSinPiTest_q_to_R_uid111_fpSinPiTest_c_q & expRPostExc_uid104_fpSinPiTest_q & fracRPostExc_uid97_fpSinPiTest_q;

	--xOut(GPOUT,4)@20
    q <= R_uid111_fpSinPiTest_q;


end normal;
