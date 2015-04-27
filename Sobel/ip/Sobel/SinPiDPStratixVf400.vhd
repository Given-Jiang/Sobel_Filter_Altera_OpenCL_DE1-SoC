----------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Debug Version 12.0
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2012 Altera Corporation.  All rights reserved.    
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

-- VHDL created from SinPiDPStratixVf400
-- VHDL created on Wed Sep 05 17:55:57 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;
USE work.SinPiDPStratixVf400_safe_path.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from d:/qshell64/p4/ip/aion/src/mip_common/hw_model.cpp:1240
entity SinPiDPStratixVf400 is
    port (
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_0 : in std_logic_vector(63 downto 0);
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        xOut_0 : out std_logic_vector(63 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        h_areset : in std_logic
        );
end;

architecture normal of SinPiDPStratixVf400 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid9_fpSinPiTest_q : std_logic_vector (10 downto 0);
    signal cstAllZWF_uid10_fpSinPiTest_q : std_logic_vector (51 downto 0);
    signal cstAllZWE_uid11_fpSinPiTest_q : std_logic_vector (10 downto 0);
    signal cstBias_uid12_fpSinPiTest_q : std_logic_vector (10 downto 0);
    signal cstBiasPwF_uid13_fpSinPiTest_q : std_logic_vector (10 downto 0);
    signal And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal biasM1_uid27_fpSinPiTest_q : std_logic_vector (10 downto 0);
    signal biasMwShift_uid29_fpSinPiTest_q : std_logic_vector (10 downto 0);
    signal shiftBias_uid32_fpSinPiTest_q : std_logic_vector (10 downto 0);
    signal cst01pWShift_uid34_fpSinPiTest_q : std_logic_vector (27 downto 0);
    signal ozz_uid41_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal cOne_uid44_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal oneMinusY_uid45_fpSinPiTest_a : std_logic_vector(81 downto 0);
    signal oneMinusY_uid45_fpSinPiTest_b : std_logic_vector(81 downto 0);
    signal oneMinusY_uid45_fpSinPiTest_o : std_logic_vector (81 downto 0);
    signal oneMinusY_uid45_fpSinPiTest_q : std_logic_vector (81 downto 0);
    signal cmpYToOneMinusY_uid46_fpSinPiTest_a : std_logic_vector(84 downto 0);
    signal cmpYToOneMinusY_uid46_fpSinPiTest_b : std_logic_vector(84 downto 0);
    signal cmpYToOneMinusY_uid46_fpSinPiTest_o : std_logic_vector (84 downto 0);
    signal cmpYToOneMinusY_uid46_fpSinPiTest_cin : std_logic_vector (0 downto 0);
    signal cmpYToOneMinusY_uid46_fpSinPiTest_c : std_logic_vector (0 downto 0);
    signal piwFP2_uid67_fpSinPiTest_q : std_logic_vector (53 downto 0);
    signal or_uid88_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal or_uid88_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal or_uid88_fpSinPiTest_c : std_logic_vector(0 downto 0);
    signal or_uid88_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExc1_uid89_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPostExc1_uid89_fpSinPiTest_q : std_logic_vector (51 downto 0);
    signal oneFracRPostExc2_uid90_fpSinPiTest_q : std_logic_vector (51 downto 0);
    signal Or2ExcRZeroXIsInt_uid92_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal Or2ExcRZeroXIsInt_uid92_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal expRPostExc1_uid95_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal expRPostExc1_uid95_fpSinPiTest_q : std_logic_vector (10 downto 0);
    signal InvXIsInt_uid100_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvXIsInt_uid100_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx1Pad32_uid108_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (31 downto 0);
    signal leftShiftStage0Idx2Pad64_uid111_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (63 downto 0);
    signal leftShiftStage0Idx3_uid114_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal leftShiftStage1Idx1Pad8_uid117_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal leftShiftStage1Idx2Pad16_uid120_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (15 downto 0);
    signal leftShiftStage1Idx3Pad24_uid123_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (23 downto 0);
    signal leftShiftStage2Idx1Pad2_uid128_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage2Idx2Pad4_uid131_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage2Idx3Pad6_uid134_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (5 downto 0);
    signal mO_uid148_lzcZ_uid51_fpSinPiTest_q : std_logic_vector (48 downto 0);
    signal memoryC3_uid229_sinPiZTableGenerator_q : std_logic_vector(34 downto 0);
    signal memoryC4_uid230_sinPiZTableGenerator_q : std_logic_vector(25 downto 0);
    signal memoryC5_uid231_sinPiZTableGenerator_q : std_logic_vector(16 downto 0);
    signal rndBit_uid246_sinPiZPolyEval_q : std_logic_vector (1 downto 0);
    signal rndBit_uid258_sinPiZPolyEval_q : std_logic_vector (2 downto 0);
    signal prodXY_uid263_pT1_uid233_sinPiZPolyEval_a : std_logic_vector (16 downto 0);
    signal prodXY_uid263_pT1_uid233_sinPiZPolyEval_b : std_logic_vector (16 downto 0);
    signal prodXY_uid263_pT1_uid233_sinPiZPolyEval_s1 : std_logic_vector (33 downto 0);
    signal prodXY_uid263_pT1_uid233_sinPiZPolyEval_pr : SIGNED (34 downto 0);
    signal prodXY_uid263_pT1_uid233_sinPiZPolyEval_q : std_logic_vector (33 downto 0);
    signal prodXY_uid266_pT2_uid239_sinPiZPolyEval_a : std_logic_vector (25 downto 0);
    signal prodXY_uid266_pT2_uid239_sinPiZPolyEval_b : std_logic_vector (27 downto 0);
    signal prodXY_uid266_pT2_uid239_sinPiZPolyEval_s1 : std_logic_vector (53 downto 0);
    signal prodXY_uid266_pT2_uid239_sinPiZPolyEval_pr : SIGNED (54 downto 0);
    signal prodXY_uid266_pT2_uid239_sinPiZPolyEval_q : std_logic_vector (53 downto 0);
    signal topProd_uid271_pT3_uid245_sinPiZPolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid271_pT3_uid245_sinPiZPolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid271_pT3_uid245_sinPiZPolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid271_pT3_uid245_sinPiZPolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid271_pT3_uid245_sinPiZPolyEval_q : std_logic_vector (53 downto 0);
    signal topProd_uid288_pT4_uid251_sinPiZPolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid288_pT4_uid251_sinPiZPolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid288_pT4_uid251_sinPiZPolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid288_pT4_uid251_sinPiZPolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid288_pT4_uid251_sinPiZPolyEval_q : std_logic_vector (53 downto 0);
    signal topProd_uid303_pT5_uid257_sinPiZPolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid303_pT5_uid257_sinPiZPolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid303_pT5_uid257_sinPiZPolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid303_pT5_uid257_sinPiZPolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid303_pT5_uid257_sinPiZPolyEval_q : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a0_b0_a : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a0_b0_b : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a0_b0_s1 : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a0_b0_pr : UNSIGNED (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a0_b0_q : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a1_b0_a : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a1_b0_b : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a1_b0_s1 : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a1_b0_pr : UNSIGNED (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a1_b0_q : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a0_b1_a : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a0_b1_b : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a0_b1_s1 : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a0_b1_pr : UNSIGNED (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a0_b1_q : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a1_b1_a : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a1_b1_b : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a1_b1_s1 : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a1_b1_pr : UNSIGNED (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a1_b1_q : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_zero_36_q : std_logic_vector (26 downto 0);
    type multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_a_type is array(0 to 1) of SIGNED(18 downto 0);
    signal multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_a : multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_a_type;
    type multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_c_type is array(0 to 1) of SIGNED(17 downto 0);
    signal multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_c : multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_c_type;
    type multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_p_type is array(0 to 1) of SIGNED(36 downto 0);
    signal multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_p : multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_p_type;
    type multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_w_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_w : multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_w_type;
    type multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_x_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_x : multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_x_type;
    type multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_y_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_y : multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_y_type;
    type multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_s_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_s : multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_s_type;
    signal multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_s0 : std_logic_vector(36 downto 0);
    signal multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_q : std_logic_vector (36 downto 0);
    type multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_a_type is array(0 to 1) of SIGNED(27 downto 0);
    signal multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_a : multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_a_type;
    type multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_c_type is array(0 to 1) of SIGNED(26 downto 0);
    signal multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_c : multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_c_type;
    type multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_p_type is array(0 to 1) of SIGNED(54 downto 0);
    signal multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_p : multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_p_type;
    type multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_w_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_w : multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_w_type;
    type multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_x_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_x : multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_x_type;
    type multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_y_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_y : multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_y_type;
    type multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_s_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_s : multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_s_type;
    signal multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_s0 : std_logic_vector(54 downto 0);
    signal multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_q : std_logic_vector (54 downto 0);
    type multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_a_type is array(0 to 1) of SIGNED(27 downto 0);
    signal multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_a : multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_a_type;
    type multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_c_type is array(0 to 1) of SIGNED(26 downto 0);
    signal multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_c : multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_c_type;
    type multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_p_type is array(0 to 1) of SIGNED(54 downto 0);
    signal multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_p : multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_p_type;
    type multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_w_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_w : multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_w_type;
    type multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_x_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_x : multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_x_type;
    type multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_y_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_y : multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_y_type;
    type multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_s_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_s : multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_s_type;
    signal multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_s0 : std_logic_vector(54 downto 0);
    signal multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_q : std_logic_vector (54 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_a : std_logic_vector(90 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_b : std_logic_vector(90 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_o : std_logic_vector (90 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_cin : std_logic_vector (0 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_c : std_logic_vector (0 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_q : std_logic_vector (88 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_a : std_logic_vector(21 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_b : std_logic_vector(21 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_o : std_logic_vector (21 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_cin : std_logic_vector (0 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_q : std_logic_vector (19 downto 0);
    signal reg_leftShiftStage3Idx1_uid141_fixedPointX_uid37_fpSinPiTest_0_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_3_q : std_logic_vector (80 downto 0);
    signal reg_leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_0_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_2_q : std_logic_vector (80 downto 0);
    signal reg_y_uid39_fpSinPiTest_0_to_yIsZero_uid43_fpSinPiTest_0_q : std_logic_vector (79 downto 0);
    signal reg_y_uid39_fpSinPiTest_0_to_yIsZero_uid40_fpSinPiTest_0_q : std_logic_vector (79 downto 0);
    signal reg_xIsInt_uid83_fpSinPiTest_0_to_excRZero_uid87_fpSinPiTest_0_q : std_logic_vector (0 downto 0);
    signal reg_excRZero_uid87_fpSinPiTest_0_to_or_uid88_fpSinPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_y_uid39_fpSinPiTest_0_to_oneMinusY_uid45_fpSinPiTest_1_q : std_logic_vector (79 downto 0);
    signal reg_y_uid39_fpSinPiTest_0_to_cmpYToOneMinusY_uid46_fpSinPiTest_1_q : std_logic_vector (79 downto 0);
    signal reg_rVStage_uid146_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid147_lzcZ_uid51_fpSinPiTest_0_q : std_logic_vector (63 downto 0);
    signal reg_rVStage_uid154_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid155_lzcZ_uid51_fpSinPiTest_0_q : std_logic_vector (31 downto 0);
    signal reg_rVStage_uid160_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid161_lzcZ_uid51_fpSinPiTest_0_q : std_logic_vector (15 downto 0);
    signal reg_rVStage_uid166_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid167_lzcZ_uid51_fpSinPiTest_0_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid168_lzcZ_uid51_fpSinPiTest_0_to_vStagei_uid170_lzcZ_uid51_fpSinPiTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid166_lzcZ_uid51_fpSinPiTest_0_to_vStagei_uid170_lzcZ_uid51_fpSinPiTest_2_q : std_logic_vector (7 downto 0);
    signal reg_leftShiftStageSel6Dto5_uid196_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStageSel4Dto3_uid207_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage2Idx3_uid217_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_5_q : std_logic_vector (78 downto 0);
    signal reg_leftShiftStage2Idx2_uid214_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_4_q : std_logic_vector (78 downto 0);
    signal reg_leftShiftStage2Idx1_uid211_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_3_q : std_logic_vector (78 downto 0);
    signal reg_leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_2_q : std_logic_vector (78 downto 0);
    signal reg_leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_q : std_logic_vector (6 downto 0);
    signal reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_q : std_logic_vector (6 downto 0);
    signal reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_q : std_logic_vector (6 downto 0);
    signal reg_zAddr_uid63_fpSinPiTest_0_to_memoryC5_uid231_sinPiZTableGenerator_0_q : std_logic_vector (6 downto 0);
    signal reg_yT1_uid232_sinPiZPolyEval_0_to_prodXY_uid263_pT1_uid233_sinPiZPolyEval_0_q : std_logic_vector (16 downto 0);
    signal reg_zAddr_uid63_fpSinPiTest_0_to_memoryC4_uid230_sinPiZTableGenerator_0_q : std_logic_vector (6 downto 0);
    signal reg_s1_uid234_uid237_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_1_q : std_logic_vector (27 downto 0);
    signal reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_q : std_logic_vector (25 downto 0);
    signal reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_q : std_logic_vector (6 downto 0);
    signal reg_highBBits_uid241_sinPiZPolyEval_0_to_sumAHighB_uid242_sinPiZPolyEval_1_q : std_logic_vector (27 downto 0);
    signal reg_yTop18Bits_uid275_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_9_q : std_logic_vector (17 downto 0);
    signal reg_pad_yBottomBits_uid273_uid278_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_6_q : std_logic_vector (17 downto 0);
    signal reg_pad_xBottomBits_uid274_uid277_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_7_q : std_logic_vector (16 downto 0);
    signal reg_xTop18Bits_uid272_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_4_q : std_logic_vector (17 downto 0);
    signal reg_yTop27Bits_uid270_pT3_uid245_sinPiZPolyEval_0_to_topProd_uid271_pT3_uid245_sinPiZPolyEval_1_q : std_logic_vector (26 downto 0);
    signal reg_xTop27Bits_uid269_pT3_uid245_sinPiZPolyEval_0_to_topProd_uid271_pT3_uid245_sinPiZPolyEval_0_q : std_logic_vector (26 downto 0);
    signal reg_highBBits_uid282_pT3_uid245_sinPiZPolyEval_0_to_sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_1_q : std_logic_vector (28 downto 0);
    signal reg_topProd_uid271_pT3_uid245_sinPiZPolyEval_0_to_sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_0_q : std_logic_vector (53 downto 0);
    signal reg_R_uid285_pT3_uid245_sinPiZPolyEval_0_to_ts3_uid248_sinPiZPolyEval_1_q : std_logic_vector (36 downto 0);
    signal reg_cIncludingRoundingBit_uid247_sinPiZPolyEval_0_to_ts3_uid248_sinPiZPolyEval_0_q : std_logic_vector (44 downto 0);
    signal reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_9_q : std_logic_vector (26 downto 0);
    signal reg_pad_yBottomBits_uid289_uid293_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_6_q : std_logic_vector (26 downto 0);
    signal reg_pad_xBottomBits_uid290_uid292_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_7_q : std_logic_vector (25 downto 0);
    signal reg_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_4_q : std_logic_vector (26 downto 0);
    signal reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_1_q : std_logic_vector (26 downto 0);
    signal reg_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_0_q : std_logic_vector (26 downto 0);
    signal reg_highBBits_uid297_pT4_uid251_sinPiZPolyEval_0_to_sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_1_q : std_logic_vector (28 downto 0);
    signal reg_topProd_uid288_pT4_uid251_sinPiZPolyEval_0_to_sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_0_q : std_logic_vector (53 downto 0);
    signal reg_R_uid300_pT4_uid251_sinPiZPolyEval_0_to_ts4_uid254_sinPiZPolyEval_1_q : std_logic_vector (45 downto 0);
    signal reg_cIncludingRoundingBit_uid253_sinPiZPolyEval_0_to_ts4_uid254_sinPiZPolyEval_0_q : std_logic_vector (51 downto 0);
    signal reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_9_q : std_logic_vector (26 downto 0);
    signal reg_pad_yBottomBits_uid304_uid308_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_6_q : std_logic_vector (26 downto 0);
    signal reg_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_7_q : std_logic_vector (25 downto 0);
    signal reg_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_4_q : std_logic_vector (26 downto 0);
    signal reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_1_q : std_logic_vector (26 downto 0);
    signal reg_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_0_q : std_logic_vector (26 downto 0);
    signal reg_highBBits_uid312_pT5_uid257_sinPiZPolyEval_0_to_sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_1_q : std_logic_vector (28 downto 0);
    signal reg_topProd_uid303_pT5_uid257_sinPiZPolyEval_0_to_sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_0_q : std_logic_vector (53 downto 0);
    signal reg_R_uid315_pT5_uid257_sinPiZPolyEval_0_to_ts5_uid260_sinPiZPolyEval_1_q : std_logic_vector (53 downto 0);
    signal reg_cIncludingRoundingBit_uid259_sinPiZPolyEval_0_to_ts5_uid260_sinPiZPolyEval_0_q : std_logic_vector (60 downto 0);
    signal reg_mul2xSinRes_uid69_fpSinPiTest_b_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b0_1_q : std_logic_vector (26 downto 0);
    signal reg_mul2xSinRes_uid69_fpSinPiTest_a_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_mul2xSinRes_uid69_fpSinPiTest_b_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b0_1_q : std_logic_vector (26 downto 0);
    signal reg_mul2xSinRes_uid69_fpSinPiTest_a_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_mul2xSinRes_uid69_fpSinPiTest_b_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b1_1_q : std_logic_vector (26 downto 0);
    signal reg_mul2xSinRes_uid69_fpSinPiTest_a_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b1_0_q : std_logic_vector (26 downto 0);
    signal reg_mul2xSinRes_uid69_fpSinPiTest_b_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b1_1_q : std_logic_vector (26 downto 0);
    signal reg_mul2xSinRes_uid69_fpSinPiTest_a_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b1_0_q : std_logic_vector (26 downto 0);
    signal reg_r_uid186_lzcZ_uid51_fpSinPiTest_0_to_expHardCase_uid57_fpSinPiTest_1_q : std_logic_vector (6 downto 0);
    signal reg_expFracPreRnd_uid74_uid74_fpSinPiTest_0_to_expFracComp_uid77_fpSinPiTest_0_q : std_logic_vector (63 downto 0);
    signal reg_xIsInt_uid83_fpSinPiTest_0_to_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_q : std_logic_vector (1 downto 0);
    signal ld_fracXIsZero_uid17_fpSinPiTest_q_to_InvFracXIsZero_uid19_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsMax_uid16_fpSinPiTest_q_to_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest_q_to_And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_yBottom_uid48_fpSinPiTest_b_to_z_uid49_fpSinPiTest_c_q : std_logic_vector (78 downto 0);
    signal ld_oMyBottom_uid47_fpSinPiTest_b_to_z_uid49_fpSinPiTest_d_q : std_logic_vector (78 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_p_uid55_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_expP_uid61_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_zPPolyEval_uid64_fpSinPiTest_a_q : std_logic_vector (78 downto 0);
    signal ld_normBit_uid70_fpSinPiTest_b_to_rndExpUpdate_uid75_uid76_fpSinPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_InvSinXIsX_uid80_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_xIntExp_uid26_fpSinPiTest_c_to_Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid15_fpSinPiTest_q_to_excRZero_uid87_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_q_to_excRZero_uid87_fpSinPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_q_to_or_uid88_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest_q_to_join_uid97_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_xFrac_uid28_fpSinPiTest_n_to_InvXFrac_uid99_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_intXParity_uid38_fpSinPiTest_b_to_signComp_uid101_fpSinPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_yIsZero_uid40_fpSinPiTest_q_to_InvYIsZero_uid102_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid8_fpSinPiTest_b_to_signR_uid104_fpSinPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_leftShiftStageSel0Dto0_uid142_fixedPointX_uid37_fpSinPiTest_b_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_cStage_uid150_lzcZ_uid51_fpSinPiTest_b_q : std_logic_vector (14 downto 0);
    signal ld_rVStage_uid146_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid152_lzcZ_uid51_fpSinPiTest_c_q : std_logic_vector (63 downto 0);
    signal ld_rVStage_uid154_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid158_lzcZ_uid51_fpSinPiTest_c_q : std_logic_vector (31 downto 0);
    signal ld_vStage_uid156_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid158_lzcZ_uid51_fpSinPiTest_d_q : std_logic_vector (31 downto 0);
    signal ld_rVStage_uid160_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid164_lzcZ_uid51_fpSinPiTest_c_q : std_logic_vector (15 downto 0);
    signal ld_vStage_uid162_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid164_lzcZ_uid51_fpSinPiTest_d_q : std_logic_vector (15 downto 0);
    signal ld_vCount_uid161_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid155_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_f_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid147_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_g_q : std_logic_vector (0 downto 0);
    signal ld_reg_leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_1_q_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_b_q : std_logic_vector (1 downto 0);
    signal ld_reg_leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_1_q_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_lowRangeB_uid240_sinPiZPolyEval_b_to_s2_uid240_uid243_sinPiZPolyEval_a_q : std_logic_vector (0 downto 0);
    signal ld_lowRangeB_uid281_pT3_uid245_sinPiZPolyEval_b_to_add0_uid281_uid284_pT3_uid245_sinPiZPolyEval_a_q : std_logic_vector (0 downto 0);
    signal ld_yT4_uid250_sinPiZPolyEval_b_to_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_a_q : std_logic_vector (42 downto 0);
    signal ld_reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_1_q_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_b_q : std_logic_vector (26 downto 0);
    signal ld_yBottomBits_uid289_pT4_uid251_sinPiZPolyEval_b_to_spad_yBottomBits_uid289_uid291_pT4_uid251_sinPiZPolyEval_a_q : std_logic_vector (17 downto 0);
    signal ld_lowRangeB_uid296_pT4_uid251_sinPiZPolyEval_b_to_add0_uid296_uid299_pT4_uid251_sinPiZPolyEval_a_q : std_logic_vector (17 downto 0);
    signal ld_reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_1_q_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_b_q : std_logic_vector (26 downto 0);
    signal ld_yBottomBits_uid304_pT5_uid257_sinPiZPolyEval_b_to_spad_yBottomBits_uid304_uid306_pT5_uid257_sinPiZPolyEval_a_q : std_logic_vector (24 downto 0);
    signal ld_lowRangeB_uid311_pT5_uid257_sinPiZPolyEval_b_to_add0_uid311_uid314_pT5_uid257_sinPiZPolyEval_a_q : std_logic_vector (24 downto 0);
    signal ld_mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_c_to_mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_a_q : std_logic_vector (19 downto 0);
    signal ld_mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_c_to_mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_b_q : std_logic_vector (19 downto 0);
    signal ld_mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_q_to_mul2xSinRes_uid69_fpSinPiTest_ADD_BitJoin_for_q_a_q : std_logic_vector (88 downto 0);
    signal ld_y_uid39_fpSinPiTest_b_to_reg_y_uid39_fpSinPiTest_0_to_cmpYToOneMinusY_uid46_fpSinPiTest_1_a_q : std_logic_vector (79 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC4_uid230_sinPiZTableGenerator_0_a_q : std_logic_vector (6 downto 0);
    signal ld_xIn_v_to_xOut_v_outputreg_q : std_logic_vector (0 downto 0);
    signal ld_xIn_v_to_xOut_v_replace_mem_reset0 : std_logic;
    signal ld_xIn_v_to_xOut_v_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_xIn_v_to_xOut_v_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_xIn_v_to_xOut_v_replace_mem_ir : std_logic_vector (0 downto 0);
    signal ld_xIn_v_to_xOut_v_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_xIn_v_to_xOut_v_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_xIn_v_to_xOut_v_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_xIn_v_to_xOut_v_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_xIn_v_to_xOut_v_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_xIn_v_to_xOut_v_replace_rdcnt_eq : std_logic;
    signal ld_xIn_v_to_xOut_v_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_xIn_v_to_xOut_v_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_xIn_v_to_xOut_v_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_xIn_v_to_xOut_v_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_xIn_c_to_xOut_c_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_xIn_c_to_xOut_c_replace_mem_reset0 : std_logic;
    signal ld_xIn_c_to_xOut_c_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_xIn_c_to_xOut_c_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_xIn_c_to_xOut_c_replace_mem_ir : std_logic_vector (7 downto 0);
    signal ld_xIn_c_to_xOut_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_xIn_c_to_xOut_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_xIn_c_to_xOut_c_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_yBottom_uid48_fpSinPiTest_b_to_z_uid49_fpSinPiTest_c_outputreg_q : std_logic_vector (78 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_outputreg_q : std_logic_vector (52 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_reset0 : std_logic;
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_iq : std_logic_vector (52 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_ia : std_logic_vector (52 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_ir : std_logic_vector (52 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_q : std_logic_vector (52 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_outputreg_q : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_iq : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_ia : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_ir : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_q : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_eq : std_logic;
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_outputreg_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_ir : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_outputreg_q : std_logic_vector (10 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_iq : std_logic_vector (10 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_ia : std_logic_vector (10 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_ir : std_logic_vector (10 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_q : std_logic_vector (10 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_outputreg_q : std_logic_vector (0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_ir : std_logic_vector (0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_ir : std_logic_vector (0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_outputreg_q : std_logic_vector (0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_ir : std_logic_vector (0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_outputreg_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_reset0 : std_logic;
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_ir : std_logic_vector (0 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_eq : std_logic;
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_iq : std_logic_vector (46 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_ia : std_logic_vector (46 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_ir : std_logic_vector (46 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_q : std_logic_vector (46 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_ir : std_logic_vector (14 downto 0);
    signal ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_outputreg_q : std_logic_vector (78 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_reset0 : std_logic;
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_iq : std_logic_vector (78 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_ia : std_logic_vector (78 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_ir : std_logic_vector (78 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_q : std_logic_vector (78 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_eq : std_logic;
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_outputreg_q : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_iq : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_ia : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_ir : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_q : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_outputreg_q : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_iq : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_ia : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_ir : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_q : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_outputreg_q : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_iq : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_ia : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_ir : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_q : std_logic_vector (44 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_outputreg_q : std_logic_vector (17 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_reset0 : std_logic;
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_iq : std_logic_vector (17 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_ia : std_logic_vector (17 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_ir : std_logic_vector (17 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_q : std_logic_vector (17 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_eq : std_logic;
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_reset0 : std_logic;
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_iq : std_logic_vector (52 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_ia : std_logic_vector (52 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_ir : std_logic_vector (52 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_q : std_logic_vector (52 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_eq : std_logic;
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_outputreg_q : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_reset0 : std_logic;
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_ir : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_eq : std_logic;
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_outputreg_q : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_reset0 : std_logic;
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_ir : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_eq : std_logic;
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_outputreg_q : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_reset0 : std_logic;
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_ir : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_eq : std_logic;
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_outputreg_q : std_logic_vector (25 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_iq : std_logic_vector (25 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_ia : std_logic_vector (25 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_ir : std_logic_vector (25 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_q : std_logic_vector (25 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_outputreg_q : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_reset0 : std_logic;
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_ir : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_eq : std_logic;
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_inputreg_q : std_logic_vector (1 downto 0);
    signal ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_reset0 : std_logic;
    signal ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_ir : std_logic_vector (1 downto 0);
    signal ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_q : std_logic_vector (1 downto 0);
    signal yIsZero_uid40_fpSinPiTest_a : std_logic_vector(79 downto 0);
    signal yIsZero_uid40_fpSinPiTest_b : std_logic_vector(79 downto 0);
    signal yIsZero_uid40_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal spad_yBottomBits_uid289_uid291_pT4_uid251_sinPiZPolyEval_q : std_logic_vector (18 downto 0);
    signal pad_yBottomBits_uid289_uid293_pT4_uid251_sinPiZPolyEval_q : std_logic_vector (26 downto 0);
    signal spad_yBottomBits_uid304_uid306_pT5_uid257_sinPiZPolyEval_q : std_logic_vector (25 downto 0);
    signal pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_q : std_logic_vector (25 downto 0);
    signal pad_yBottomBits_uid304_uid308_pT5_uid257_sinPiZPolyEval_q : std_logic_vector (26 downto 0);
    signal z_uid49_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal z_uid49_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal expHardCase_uid57_fpSinPiTest_a : std_logic_vector(11 downto 0);
    signal expHardCase_uid57_fpSinPiTest_b : std_logic_vector(11 downto 0);
    signal expHardCase_uid57_fpSinPiTest_o : std_logic_vector (11 downto 0);
    signal expHardCase_uid57_fpSinPiTest_q : std_logic_vector (11 downto 0);
    signal expXP1_uid58_fpSinPiTest_a : std_logic_vector(11 downto 0);
    signal expXP1_uid58_fpSinPiTest_b : std_logic_vector(11 downto 0);
    signal expXP1_uid58_fpSinPiTest_o : std_logic_vector (11 downto 0);
    signal expXP1_uid58_fpSinPiTest_q : std_logic_vector (11 downto 0);
    signal rndExpUpdate_uid75_uid76_fpSinPiTest_q : std_logic_vector (53 downto 0);
    signal expFracComp_uid77_fpSinPiTest_a : std_logic_vector(64 downto 0);
    signal expFracComp_uid77_fpSinPiTest_b : std_logic_vector(64 downto 0);
    signal expFracComp_uid77_fpSinPiTest_o : std_logic_vector (64 downto 0);
    signal expFracComp_uid77_fpSinPiTest_q : std_logic_vector (64 downto 0);
    signal fracRPostExc_uid91_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPostExc_uid91_fpSinPiTest_q : std_logic_vector (51 downto 0);
    signal expRPostExc_uid98_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid98_fpSinPiTest_q : std_logic_vector (10 downto 0);
    signal leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal memoryC0_uid226_sinPiZTableGenerator_q : std_logic_vector(57 downto 0);
    signal memoryC1_uid227_sinPiZTableGenerator_q : std_logic_vector(49 downto 0);
    signal memoryC2_uid228_sinPiZTableGenerator_q : std_logic_vector(42 downto 0);
    signal sumAHighB_uid242_sinPiZPolyEval_a : std_logic_vector(35 downto 0);
    signal sumAHighB_uid242_sinPiZPolyEval_b : std_logic_vector(35 downto 0);
    signal sumAHighB_uid242_sinPiZPolyEval_o : std_logic_vector (35 downto 0);
    signal sumAHighB_uid242_sinPiZPolyEval_q : std_logic_vector (35 downto 0);
    signal ts3_uid248_sinPiZPolyEval_a : std_logic_vector(45 downto 0);
    signal ts3_uid248_sinPiZPolyEval_b : std_logic_vector(45 downto 0);
    signal ts3_uid248_sinPiZPolyEval_o : std_logic_vector (45 downto 0);
    signal ts3_uid248_sinPiZPolyEval_q : std_logic_vector (45 downto 0);
    signal ts4_uid254_sinPiZPolyEval_a : std_logic_vector(52 downto 0);
    signal ts4_uid254_sinPiZPolyEval_b : std_logic_vector(52 downto 0);
    signal ts4_uid254_sinPiZPolyEval_o : std_logic_vector (52 downto 0);
    signal ts4_uid254_sinPiZPolyEval_q : std_logic_vector (52 downto 0);
    signal ts5_uid260_sinPiZPolyEval_a : std_logic_vector(61 downto 0);
    signal ts5_uid260_sinPiZPolyEval_b : std_logic_vector(61 downto 0);
    signal ts5_uid260_sinPiZPolyEval_o : std_logic_vector (61 downto 0);
    signal ts5_uid260_sinPiZPolyEval_q : std_logic_vector (61 downto 0);
    signal sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_a : std_logic_vector(54 downto 0);
    signal sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_b : std_logic_vector(54 downto 0);
    signal sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_o : std_logic_vector (54 downto 0);
    signal sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_q : std_logic_vector (54 downto 0);
    signal sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_a : std_logic_vector(54 downto 0);
    signal sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_b : std_logic_vector(54 downto 0);
    signal sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_o : std_logic_vector (54 downto 0);
    signal sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_q : std_logic_vector (54 downto 0);
    signal sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_a : std_logic_vector(54 downto 0);
    signal sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_b : std_logic_vector(54 downto 0);
    signal sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_o : std_logic_vector (54 downto 0);
    signal sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_q : std_logic_vector (54 downto 0);
    signal join_uid42_fpSinPiTest_q : std_logic_vector (79 downto 0);
    signal ld_xIn_v_to_xOut_v_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_xIn_v_to_xOut_v_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_xIn_v_to_xOut_v_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_xIn_v_to_xOut_v_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_xIn_v_to_xOut_v_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xIn_v_to_xOut_v_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xIn_v_to_xOut_v_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal expX_uid6_fpSinPiTest_in : std_logic_vector (62 downto 0);
    signal expX_uid6_fpSinPiTest_b : std_logic_vector (10 downto 0);
    signal fracX_uid7_fpSinPiTest_in : std_logic_vector (51 downto 0);
    signal fracX_uid7_fpSinPiTest_b : std_logic_vector (51 downto 0);
    signal signX_uid8_fpSinPiTest_in : std_logic_vector (63 downto 0);
    signal signX_uid8_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal expXIsMax_uid16_fpSinPiTest_a : std_logic_vector(10 downto 0);
    signal expXIsMax_uid16_fpSinPiTest_b : std_logic_vector(10 downto 0);
    signal expXIsMax_uid16_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid17_fpSinPiTest_a : std_logic_vector(51 downto 0);
    signal fracXIsZero_uid17_fpSinPiTest_b : std_logic_vector(51 downto 0);
    signal fracXIsZero_uid17_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid15_fpSinPiTest_a : std_logic_vector(10 downto 0);
    signal expXIsZero_uid15_fpSinPiTest_b : std_logic_vector(10 downto 0);
    signal expXIsZero_uid15_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal xIntExp_uid26_fpSinPiTest_a : std_logic_vector(13 downto 0);
    signal xIntExp_uid26_fpSinPiTest_b : std_logic_vector(13 downto 0);
    signal xIntExp_uid26_fpSinPiTest_o : std_logic_vector (13 downto 0);
    signal xIntExp_uid26_fpSinPiTest_cin : std_logic_vector (0 downto 0);
    signal xIntExp_uid26_fpSinPiTest_c : std_logic_vector (0 downto 0);
    signal xFrac_uid28_fpSinPiTest_a : std_logic_vector(13 downto 0);
    signal xFrac_uid28_fpSinPiTest_b : std_logic_vector(13 downto 0);
    signal xFrac_uid28_fpSinPiTest_o : std_logic_vector (13 downto 0);
    signal xFrac_uid28_fpSinPiTest_cin : std_logic_vector (0 downto 0);
    signal xFrac_uid28_fpSinPiTest_n : std_logic_vector (0 downto 0);
    signal sinXIsX_uid30_fpSinPiTest_a : std_logic_vector(13 downto 0);
    signal sinXIsX_uid30_fpSinPiTest_b : std_logic_vector(13 downto 0);
    signal sinXIsX_uid30_fpSinPiTest_o : std_logic_vector (13 downto 0);
    signal sinXIsX_uid30_fpSinPiTest_cin : std_logic_vector (0 downto 0);
    signal sinXIsX_uid30_fpSinPiTest_c : std_logic_vector (0 downto 0);
    signal shiftValue_uid33_fpSinPiTest_a : std_logic_vector(11 downto 0);
    signal shiftValue_uid33_fpSinPiTest_b : std_logic_vector(11 downto 0);
    signal shiftValue_uid33_fpSinPiTest_o : std_logic_vector (11 downto 0);
    signal shiftValue_uid33_fpSinPiTest_q : std_logic_vector (11 downto 0);
    signal oMyBottom_uid47_fpSinPiTest_in : std_logic_vector (78 downto 0);
    signal oMyBottom_uid47_fpSinPiTest_b : std_logic_vector (78 downto 0);
    signal vCount_uid155_lzcZ_uid51_fpSinPiTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid155_lzcZ_uid51_fpSinPiTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid155_lzcZ_uid51_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal vCount_uid147_lzcZ_uid51_fpSinPiTest_a : std_logic_vector(63 downto 0);
    signal vCount_uid147_lzcZ_uid51_fpSinPiTest_b : std_logic_vector(63 downto 0);
    signal vCount_uid147_lzcZ_uid51_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal vCount_uid167_lzcZ_uid51_fpSinPiTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid167_lzcZ_uid51_fpSinPiTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid167_lzcZ_uid51_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid161_lzcZ_uid51_fpSinPiTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid161_lzcZ_uid51_fpSinPiTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid161_lzcZ_uid51_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid150_lzcZ_uid51_fpSinPiTest_q : std_logic_vector (63 downto 0);
    signal cIncludingRoundingBit_uid247_sinPiZPolyEval_q : std_logic_vector (44 downto 0);
    signal cIncludingRoundingBit_uid253_sinPiZPolyEval_q : std_logic_vector (51 downto 0);
    signal cIncludingRoundingBit_uid259_sinPiZPolyEval_q : std_logic_vector (60 downto 0);
    signal prodXYTruncFR_uid264_pT1_uid233_sinPiZPolyEval_in : std_logic_vector (33 downto 0);
    signal prodXYTruncFR_uid264_pT1_uid233_sinPiZPolyEval_b : std_logic_vector (17 downto 0);
    signal prodXYTruncFR_uid267_pT2_uid239_sinPiZPolyEval_in : std_logic_vector (53 downto 0);
    signal prodXYTruncFR_uid267_pT2_uid239_sinPiZPolyEval_b : std_logic_vector (28 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_LSB_a0_b0_in : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_LSB_a0_b0_b : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_MSB_a0_b0_in : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_MSB_a0_b0_b : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_LSB_a1_b0_in : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_LSB_a1_b0_b : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_MSB_a1_b0_in : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_MSB_a1_b0_b : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_LSB_a0_b1_in : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_LSB_a0_b1_b : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_MSB_a0_b1_in : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_MSB_a0_b1_b : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_LSB_a1_b1_in : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_LSB_a1_b1_b : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_MSB_a1_b1_in : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_MSB_a1_b1_b : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_joined_BJ_1_q : std_logic_vector (107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_joined_BJ_2_q : std_logic_vector (107 downto 0);
    signal multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_in : std_logic_vector (36 downto 0);
    signal multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_b : std_logic_vector (29 downto 0);
    signal multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_in : std_logic_vector (54 downto 0);
    signal multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_b : std_logic_vector (46 downto 0);
    signal multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_in : std_logic_vector (54 downto 0);
    signal multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_b : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_BitJoin_for_q_q : std_logic_vector (108 downto 0);
    signal yIsZero_uid43_fpSinPiTest_a : std_logic_vector(79 downto 0);
    signal yIsZero_uid43_fpSinPiTest_b : std_logic_vector(79 downto 0);
    signal yIsZero_uid43_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal excRZero_uid87_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid87_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid87_fpSinPiTest_c : std_logic_vector(0 downto 0);
    signal excRZero_uid87_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid170_lzcZ_uid51_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid170_lzcZ_uid51_fpSinPiTest_q : std_logic_vector (7 downto 0);
    signal leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal InvFracXIsZero_uid19_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid19_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal zPPolyEval_uid64_fpSinPiTest_in : std_logic_vector (71 downto 0);
    signal zPPolyEval_uid64_fpSinPiTest_b : std_logic_vector (44 downto 0);
    signal InvSinXIsX_uid80_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvSinXIsX_uid80_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal InvXIntExp_uid84_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvXIntExp_uid84_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal InvXFrac_uid99_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvXFrac_uid99_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal signComp_uid101_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal signComp_uid101_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal signComp_uid101_fpSinPiTest_c : std_logic_vector(0 downto 0);
    signal signComp_uid101_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal InvYIsZero_uid102_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvYIsZero_uid102_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid152_lzcZ_uid51_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid152_lzcZ_uid51_fpSinPiTest_q : std_logic_vector (63 downto 0);
    signal vStagei_uid158_lzcZ_uid51_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid158_lzcZ_uid51_fpSinPiTest_q : std_logic_vector (31 downto 0);
    signal vStagei_uid164_lzcZ_uid51_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid164_lzcZ_uid51_fpSinPiTest_q : std_logic_vector (15 downto 0);
    signal s2_uid240_uid243_sinPiZPolyEval_q : std_logic_vector (36 downto 0);
    signal add0_uid281_uid284_pT3_uid245_sinPiZPolyEval_q : std_logic_vector (55 downto 0);
    signal xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_in : std_logic_vector (42 downto 0);
    signal xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_b : std_logic_vector (26 downto 0);
    signal add0_uid296_uid299_pT4_uid251_sinPiZPolyEval_q : std_logic_vector (72 downto 0);
    signal add0_uid311_uid314_pT5_uid257_sinPiZPolyEval_q : std_logic_vector (79 downto 0);
    signal ld_xIn_v_to_xOut_v_cmp_a : std_logic_vector(6 downto 0);
    signal ld_xIn_v_to_xOut_v_cmp_b : std_logic_vector(6 downto 0);
    signal ld_xIn_v_to_xOut_v_cmp_q : std_logic_vector(0 downto 0);
    signal ld_xIn_v_to_xOut_v_nor_a : std_logic_vector(0 downto 0);
    signal ld_xIn_v_to_xOut_v_nor_b : std_logic_vector(0 downto 0);
    signal ld_xIn_v_to_xOut_v_nor_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmp_a : std_logic_vector(3 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmp_b : std_logic_vector(3 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmp_a : std_logic_vector(6 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmp_b : std_logic_vector(6 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmp_a : std_logic_vector(6 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmp_b : std_logic_vector(6 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmp_a : std_logic_vector(6 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmp_b : std_logic_vector(6 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal R_uid105_fpSinPiTest_q : std_logic_vector (63 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmp_a : std_logic_vector(6 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmp_b : std_logic_vector(6 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmp_a : std_logic_vector(2 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmp_b : std_logic_vector(2 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmp_a : std_logic_vector(2 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmp_b : std_logic_vector(2 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_nor_q : std_logic_vector(0 downto 0);
    signal yT3_uid244_sinPiZPolyEval_in : std_logic_vector (44 downto 0);
    signal yT3_uid244_sinPiZPolyEval_b : std_logic_vector (34 downto 0);
    signal yT4_uid250_sinPiZPolyEval_in : std_logic_vector (44 downto 0);
    signal yT4_uid250_sinPiZPolyEval_b : std_logic_vector (42 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_in : std_logic_vector (44 downto 0);
    signal xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_b : std_logic_vector (26 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_nor_q : std_logic_vector(0 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a_0_in : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a_0_b : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a_1_in : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_a_1_b : std_logic_vector (26 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_nor_q : std_logic_vector(0 downto 0);
    signal And2YIsZeroInvSinXIsX_uid81_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal And2YIsZeroInvSinXIsX_uid81_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal And2YIsZeroInvSinXIsX_uid81_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal zAddr_uid63_fpSinPiTest_in : std_logic_vector (78 downto 0);
    signal zAddr_uid63_fpSinPiTest_b : std_logic_vector (6 downto 0);
    signal rVStage_uid146_lzcZ_uid51_fpSinPiTest_in : std_logic_vector (78 downto 0);
    signal rVStage_uid146_lzcZ_uid51_fpSinPiTest_b : std_logic_vector (63 downto 0);
    signal vStage_uid149_lzcZ_uid51_fpSinPiTest_in : std_logic_vector (14 downto 0);
    signal vStage_uid149_lzcZ_uid51_fpSinPiTest_b : std_logic_vector (14 downto 0);
    signal X46dto0_uid190_alignedZ_uid52_fpSinPiTest_in : std_logic_vector (46 downto 0);
    signal X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b : std_logic_vector (46 downto 0);
    signal expHardCaseR_uid60_fpSinPiTest_in : std_logic_vector (10 downto 0);
    signal expHardCaseR_uid60_fpSinPiTest_b : std_logic_vector (10 downto 0);
    signal expXP1R_uid59_fpSinPiTest_in : std_logic_vector (10 downto 0);
    signal expXP1R_uid59_fpSinPiTest_b : std_logic_vector (10 downto 0);
    signal fracRComp_uid78_fpSinPiTest_in : std_logic_vector (52 downto 0);
    signal fracRComp_uid78_fpSinPiTest_b : std_logic_vector (51 downto 0);
    signal expRComp_uid79_fpSinPiTest_in : std_logic_vector (63 downto 0);
    signal expRComp_uid79_fpSinPiTest_b : std_logic_vector (10 downto 0);
    signal intXParity_uid38_fpSinPiTest_in : std_logic_vector (80 downto 0);
    signal intXParity_uid38_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal y_uid39_fpSinPiTest_in : std_logic_vector (79 downto 0);
    signal y_uid39_fpSinPiTest_b : std_logic_vector (79 downto 0);
    signal LeftShiftStage277dto0_uid221_alignedZ_uid52_fpSinPiTest_in : std_logic_vector (77 downto 0);
    signal LeftShiftStage277dto0_uid221_alignedZ_uid52_fpSinPiTest_b : std_logic_vector (77 downto 0);
    signal s3_uid249_sinPiZPolyEval_in : std_logic_vector (45 downto 0);
    signal s3_uid249_sinPiZPolyEval_b : std_logic_vector (44 downto 0);
    signal s4_uid255_sinPiZPolyEval_in : std_logic_vector (52 downto 0);
    signal s4_uid255_sinPiZPolyEval_b : std_logic_vector (51 downto 0);
    signal s5_uid261_sinPiZPolyEval_in : std_logic_vector (61 downto 0);
    signal s5_uid261_sinPiZPolyEval_b : std_logic_vector (60 downto 0);
    signal oFracX_uid31_uid31_fpSinPiTest_q : std_logic_vector (52 downto 0);
    signal And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid23_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid23_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal fxpShifterBits_uid36_fpSinPiTest_in : std_logic_vector (6 downto 0);
    signal fxpShifterBits_uid36_fpSinPiTest_b : std_logic_vector (6 downto 0);
    signal lowRangeB_uid234_sinPiZPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid234_sinPiZPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid235_sinPiZPolyEval_in : std_logic_vector (17 downto 0);
    signal highBBits_uid235_sinPiZPolyEval_b : std_logic_vector (16 downto 0);
    signal lowRangeB_uid240_sinPiZPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid240_sinPiZPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid241_sinPiZPolyEval_in : std_logic_vector (28 downto 0);
    signal highBBits_uid241_sinPiZPolyEval_b : std_logic_vector (27 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_joined_BJ_0_q : std_logic_vector (107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_xorOne_a : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_xorOne_b : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_xorOne_c : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_xorOne_q : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAB_a : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAB_b : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAB_q : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_andBC_a : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_andBC_b : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_andBC_q : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAC_a : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAC_b : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAC_q : std_logic_vector(107 downto 0);
    signal lowRangeB_uid281_pT3_uid245_sinPiZPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid281_pT3_uid245_sinPiZPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid282_pT3_uid245_sinPiZPolyEval_in : std_logic_vector (29 downto 0);
    signal highBBits_uid282_pT3_uid245_sinPiZPolyEval_b : std_logic_vector (28 downto 0);
    signal lowRangeB_uid296_pT4_uid251_sinPiZPolyEval_in : std_logic_vector (17 downto 0);
    signal lowRangeB_uid296_pT4_uid251_sinPiZPolyEval_b : std_logic_vector (17 downto 0);
    signal highBBits_uid297_pT4_uid251_sinPiZPolyEval_in : std_logic_vector (46 downto 0);
    signal highBBits_uid297_pT4_uid251_sinPiZPolyEval_b : std_logic_vector (28 downto 0);
    signal lowRangeB_uid311_pT5_uid257_sinPiZPolyEval_in : std_logic_vector (24 downto 0);
    signal lowRangeB_uid311_pT5_uid257_sinPiZPolyEval_b : std_logic_vector (24 downto 0);
    signal highBBits_uid312_pT5_uid257_sinPiZPolyEval_in : std_logic_vector (53 downto 0);
    signal highBBits_uid312_pT5_uid257_sinPiZPolyEval_b : std_logic_vector (28 downto 0);
    signal normBit_uid70_fpSinPiTest_in : std_logic_vector (106 downto 0);
    signal normBit_uid70_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal highRes_uid71_fpSinPiTest_in : std_logic_vector (105 downto 0);
    signal highRes_uid71_fpSinPiTest_b : std_logic_vector (52 downto 0);
    signal lowRes_uid72_fpSinPiTest_in : std_logic_vector (104 downto 0);
    signal lowRes_uid72_fpSinPiTest_b : std_logic_vector (52 downto 0);
    signal And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_c : std_logic_vector(0 downto 0);
    signal And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_d : std_logic_vector(0 downto 0);
    signal And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal rVStage_uid172_lzcZ_uid51_fpSinPiTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid172_lzcZ_uid51_fpSinPiTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid174_lzcZ_uid51_fpSinPiTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid174_lzcZ_uid51_fpSinPiTest_b : std_logic_vector (3 downto 0);
    signal LeftShiftStage070dto0_uid199_alignedZ_uid52_fpSinPiTest_in : std_logic_vector (70 downto 0);
    signal LeftShiftStage070dto0_uid199_alignedZ_uid52_fpSinPiTest_b : std_logic_vector (70 downto 0);
    signal LeftShiftStage062dto0_uid202_alignedZ_uid52_fpSinPiTest_in : std_logic_vector (62 downto 0);
    signal LeftShiftStage062dto0_uid202_alignedZ_uid52_fpSinPiTest_b : std_logic_vector (62 downto 0);
    signal LeftShiftStage054dto0_uid205_alignedZ_uid52_fpSinPiTest_in : std_logic_vector (54 downto 0);
    signal LeftShiftStage054dto0_uid205_alignedZ_uid52_fpSinPiTest_b : std_logic_vector (54 downto 0);
    signal InvAnd2ExpXIsMaxInvFracXIsZero_uid21_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvAnd2ExpXIsMaxInvFracXIsZero_uid21_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal yT1_uid232_sinPiZPolyEval_in : std_logic_vector (44 downto 0);
    signal yT1_uid232_sinPiZPolyEval_b : std_logic_vector (16 downto 0);
    signal yT2_uid238_sinPiZPolyEval_in : std_logic_vector (44 downto 0);
    signal yT2_uid238_sinPiZPolyEval_b : std_logic_vector (25 downto 0);
    signal xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_in : std_logic_vector (17 downto 0);
    signal xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b : std_logic_vector (17 downto 0);
    signal And2InvYIsZeroSignComp_uid103_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal And2InvYIsZeroSignComp_uid103_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal And2InvYIsZeroSignComp_uid103_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal rVStage_uid154_lzcZ_uid51_fpSinPiTest_in : std_logic_vector (63 downto 0);
    signal rVStage_uid154_lzcZ_uid51_fpSinPiTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid156_lzcZ_uid51_fpSinPiTest_in : std_logic_vector (31 downto 0);
    signal vStage_uid156_lzcZ_uid51_fpSinPiTest_b : std_logic_vector (31 downto 0);
    signal rVStage_uid160_lzcZ_uid51_fpSinPiTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid160_lzcZ_uid51_fpSinPiTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid162_lzcZ_uid51_fpSinPiTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid162_lzcZ_uid51_fpSinPiTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid166_lzcZ_uid51_fpSinPiTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid166_lzcZ_uid51_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid168_lzcZ_uid51_fpSinPiTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid168_lzcZ_uid51_fpSinPiTest_b : std_logic_vector (7 downto 0);
    signal yTop27Bits_uid270_pT3_uid245_sinPiZPolyEval_in : std_logic_vector (36 downto 0);
    signal yTop27Bits_uid270_pT3_uid245_sinPiZPolyEval_b : std_logic_vector (26 downto 0);
    signal yBottomBits_uid273_pT3_uid245_sinPiZPolyEval_in : std_logic_vector (9 downto 0);
    signal yBottomBits_uid273_pT3_uid245_sinPiZPolyEval_b : std_logic_vector (9 downto 0);
    signal yTop18Bits_uid275_pT3_uid245_sinPiZPolyEval_in : std_logic_vector (36 downto 0);
    signal yTop18Bits_uid275_pT3_uid245_sinPiZPolyEval_b : std_logic_vector (17 downto 0);
    signal R_uid285_pT3_uid245_sinPiZPolyEval_in : std_logic_vector (54 downto 0);
    signal R_uid285_pT3_uid245_sinPiZPolyEval_b : std_logic_vector (36 downto 0);
    signal R_uid300_pT4_uid251_sinPiZPolyEval_in : std_logic_vector (71 downto 0);
    signal R_uid300_pT4_uid251_sinPiZPolyEval_b : std_logic_vector (45 downto 0);
    signal R_uid315_pT5_uid257_sinPiZPolyEval_in : std_logic_vector (78 downto 0);
    signal R_uid315_pT5_uid257_sinPiZPolyEval_b : std_logic_vector (53 downto 0);
    signal xTop27Bits_uid269_pT3_uid245_sinPiZPolyEval_in : std_logic_vector (34 downto 0);
    signal xTop27Bits_uid269_pT3_uid245_sinPiZPolyEval_b : std_logic_vector (26 downto 0);
    signal xTop18Bits_uid272_pT3_uid245_sinPiZPolyEval_in : std_logic_vector (34 downto 0);
    signal xTop18Bits_uid272_pT3_uid245_sinPiZPolyEval_b : std_logic_vector (17 downto 0);
    signal xBottomBits_uid274_pT3_uid245_sinPiZPolyEval_in : std_logic_vector (7 downto 0);
    signal xBottomBits_uid274_pT3_uid245_sinPiZPolyEval_b : std_logic_vector (7 downto 0);
    signal xBottomBits_uid290_pT4_uid251_sinPiZPolyEval_in : std_logic_vector (15 downto 0);
    signal xBottomBits_uid290_pT4_uid251_sinPiZPolyEval_b : std_logic_vector (15 downto 0);
    signal Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal expP_uid61_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal expP_uid61_fpSinPiTest_q : std_logic_vector (10 downto 0);
    signal yBottom_uid48_fpSinPiTest_in : std_logic_vector (78 downto 0);
    signal yBottom_uid48_fpSinPiTest_b : std_logic_vector (78 downto 0);
    signal leftShiftStage3Idx1_uid222_alignedZ_uid52_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_in : std_logic_vector (44 downto 0);
    signal yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_b : std_logic_vector (26 downto 0);
    signal yBottomBits_uid289_pT4_uid251_sinPiZPolyEval_in : std_logic_vector (17 downto 0);
    signal yBottomBits_uid289_pT4_uid251_sinPiZPolyEval_b : std_logic_vector (17 downto 0);
    signal yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_in : std_logic_vector (51 downto 0);
    signal yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_b : std_logic_vector (26 downto 0);
    signal yBottomBits_uid304_pT5_uid257_sinPiZPolyEval_in : std_logic_vector (24 downto 0);
    signal yBottomBits_uid304_pT5_uid257_sinPiZPolyEval_b : std_logic_vector (24 downto 0);
    signal fxpSinRes_uid66_fpSinPiTest_in : std_logic_vector (58 downto 0);
    signal fxpSinRes_uid66_fpSinPiTest_b : std_logic_vector (53 downto 0);
    signal extendedFracX_uid35_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal InvAnd2ExpXIsMaxFracXIsZero_uid22_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal InvAnd2ExpXIsMaxFracXIsZero_uid22_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStageSel6Dto5_uid115_fixedPointX_uid37_fpSinPiTest_in : std_logic_vector (6 downto 0);
    signal leftShiftStageSel6Dto5_uid115_fixedPointX_uid37_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel4Dto3_uid126_fixedPointX_uid37_fpSinPiTest_in : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto3_uid126_fixedPointX_uid37_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel2Dto1_uid137_fixedPointX_uid37_fpSinPiTest_in : std_logic_vector (2 downto 0);
    signal leftShiftStageSel2Dto1_uid137_fixedPointX_uid37_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel0Dto0_uid142_fixedPointX_uid37_fpSinPiTest_in : std_logic_vector (0 downto 0);
    signal leftShiftStageSel0Dto0_uid142_fixedPointX_uid37_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal sumAHighB_uid236_sinPiZPolyEval_a : std_logic_vector(26 downto 0);
    signal sumAHighB_uid236_sinPiZPolyEval_b : std_logic_vector(26 downto 0);
    signal sumAHighB_uid236_sinPiZPolyEval_o : std_logic_vector (26 downto 0);
    signal sumAHighB_uid236_sinPiZPolyEval_q : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_BitExpansion_for_a_q : std_logic_vector (108 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_orOne_a : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_orOne_b : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_orOne_c : std_logic_vector(107 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_32COMP0_orOne_q : std_logic_vector(107 downto 0);
    signal fracRCompPreRnd_uid73_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal fracRCompPreRnd_uid73_fpSinPiTest_q : std_logic_vector (52 downto 0);
    signal join_uid97_fpSinPiTest_q : std_logic_vector (1 downto 0);
    signal vCount_uid173_lzcZ_uid51_fpSinPiTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid173_lzcZ_uid51_fpSinPiTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid173_lzcZ_uid51_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid176_lzcZ_uid51_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid176_lzcZ_uid51_fpSinPiTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage1Idx1_uid200_alignedZ_uid52_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal leftShiftStage1Idx2_uid203_alignedZ_uid52_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal leftShiftStage1Idx3_uid206_alignedZ_uid52_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal signR_uid104_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal signR_uid104_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal signR_uid104_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal spad_yBottomBits_uid273_uid276_pT3_uid245_sinPiZPolyEval_q : std_logic_vector (10 downto 0);
    signal pad_xBottomBits_uid274_uid277_pT3_uid245_sinPiZPolyEval_q : std_logic_vector (16 downto 0);
    signal pad_xBottomBits_uid290_uid292_pT4_uid251_sinPiZPolyEval_q : std_logic_vector (25 downto 0);
    signal xIsInt_uid83_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal xIsInt_uid83_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal xIsInt_uid83_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal multRightOp_uid68_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal multRightOp_uid68_fpSinPiTest_q : std_logic_vector (53 downto 0);
    signal X48dto0_uid109_fixedPointX_uid37_fpSinPiTest_in : std_logic_vector (48 downto 0);
    signal X48dto0_uid109_fixedPointX_uid37_fpSinPiTest_b : std_logic_vector (48 downto 0);
    signal X16dto0_uid112_fixedPointX_uid37_fpSinPiTest_in : std_logic_vector (16 downto 0);
    signal X16dto0_uid112_fixedPointX_uid37_fpSinPiTest_b : std_logic_vector (16 downto 0);
    signal s1_uid234_uid237_sinPiZPolyEval_q : std_logic_vector (27 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_in : std_logic_vector (108 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_b : std_logic_vector (88 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_c : std_logic_vector (19 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_comp_0_out1_lsb_BS_in : std_logic_vector (106 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_comp_0_out1_lsb_BS_b : std_logic_vector (106 downto 0);
    signal expFracPreRnd_uid74_uid74_fpSinPiTest_q : std_logic_vector (63 downto 0);
    signal rVStage_uid178_lzcZ_uid51_fpSinPiTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid178_lzcZ_uid51_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid180_lzcZ_uid51_fpSinPiTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid180_lzcZ_uid51_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal pad_yBottomBits_uid273_uid278_pT3_uid245_sinPiZPolyEval_q : std_logic_vector (17 downto 0);
    signal alignedZLow_uid53_fpSinPiTest_in : std_logic_vector (78 downto 0);
    signal alignedZLow_uid53_fpSinPiTest_b : std_logic_vector (51 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_b_0_in : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_b_0_b : std_logic_vector (26 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_b_1_in : std_logic_vector (53 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_b_1_b : std_logic_vector (26 downto 0);
    signal leftShiftStage0Idx1_uid110_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal leftShiftStage0Idx2_uid113_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_comp_0_out1_BJ_q : std_logic_vector (107 downto 0);
    signal vCount_uid179_lzcZ_uid51_fpSinPiTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid179_lzcZ_uid51_fpSinPiTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid179_lzcZ_uid51_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid182_lzcZ_uid51_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid182_lzcZ_uid51_fpSinPiTest_q : std_logic_vector (1 downto 0);
    signal LeftShiftStage176dto0_uid210_alignedZ_uid52_fpSinPiTest_in : std_logic_vector (76 downto 0);
    signal LeftShiftStage176dto0_uid210_alignedZ_uid52_fpSinPiTest_b : std_logic_vector (76 downto 0);
    signal LeftShiftStage174dto0_uid213_alignedZ_uid52_fpSinPiTest_in : std_logic_vector (74 downto 0);
    signal LeftShiftStage174dto0_uid213_alignedZ_uid52_fpSinPiTest_b : std_logic_vector (74 downto 0);
    signal LeftShiftStage172dto0_uid216_alignedZ_uid52_fpSinPiTest_in : std_logic_vector (72 downto 0);
    signal LeftShiftStage172dto0_uid216_alignedZ_uid52_fpSinPiTest_b : std_logic_vector (72 downto 0);
    signal pHardCase_uid54_fpSinPiTest_q : std_logic_vector (52 downto 0);
    signal leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_BitExpansion_for_b_q : std_logic_vector (108 downto 0);
    signal rVStage_uid184_lzcZ_uid51_fpSinPiTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid184_lzcZ_uid51_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal leftShiftStage2Idx1_uid211_alignedZ_uid52_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal leftShiftStage2Idx2_uid214_alignedZ_uid52_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal leftShiftStage2Idx3_uid217_alignedZ_uid52_fpSinPiTest_q : std_logic_vector (78 downto 0);
    signal p_uid55_fpSinPiTest_s : std_logic_vector (0 downto 0);
    signal p_uid55_fpSinPiTest_q : std_logic_vector (52 downto 0);
    signal LeftShiftStage072dto0_uid118_fixedPointX_uid37_fpSinPiTest_in : std_logic_vector (72 downto 0);
    signal LeftShiftStage072dto0_uid118_fixedPointX_uid37_fpSinPiTest_b : std_logic_vector (72 downto 0);
    signal LeftShiftStage064dto0_uid121_fixedPointX_uid37_fpSinPiTest_in : std_logic_vector (64 downto 0);
    signal LeftShiftStage064dto0_uid121_fixedPointX_uid37_fpSinPiTest_b : std_logic_vector (64 downto 0);
    signal LeftShiftStage056dto0_uid124_fixedPointX_uid37_fpSinPiTest_in : std_logic_vector (56 downto 0);
    signal LeftShiftStage056dto0_uid124_fixedPointX_uid37_fpSinPiTest_b : std_logic_vector (56 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_in : std_logic_vector (108 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_b : std_logic_vector (88 downto 0);
    signal mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_c : std_logic_vector (19 downto 0);
    signal vCount_uid185_lzcZ_uid51_fpSinPiTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid185_lzcZ_uid51_fpSinPiTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid185_lzcZ_uid51_fpSinPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage1Idx1_uid119_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal leftShiftStage1Idx2_uid122_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal leftShiftStage1Idx3_uid125_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal r_uid186_lzcZ_uid51_fpSinPiTest_q : std_logic_vector (6 downto 0);
    signal leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal leftShiftStageSel6Dto5_uid196_alignedZ_uid52_fpSinPiTest_in : std_logic_vector (6 downto 0);
    signal leftShiftStageSel6Dto5_uid196_alignedZ_uid52_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel4Dto3_uid207_alignedZ_uid52_fpSinPiTest_in : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto3_uid207_alignedZ_uid52_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_in : std_logic_vector (2 downto 0);
    signal leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_in : std_logic_vector (0 downto 0);
    signal leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage178dto0_uid129_fixedPointX_uid37_fpSinPiTest_in : std_logic_vector (78 downto 0);
    signal LeftShiftStage178dto0_uid129_fixedPointX_uid37_fpSinPiTest_b : std_logic_vector (78 downto 0);
    signal LeftShiftStage176dto0_uid132_fixedPointX_uid37_fpSinPiTest_in : std_logic_vector (76 downto 0);
    signal LeftShiftStage176dto0_uid132_fixedPointX_uid37_fpSinPiTest_b : std_logic_vector (76 downto 0);
    signal LeftShiftStage174dto0_uid135_fixedPointX_uid37_fpSinPiTest_in : std_logic_vector (74 downto 0);
    signal LeftShiftStage174dto0_uid135_fixedPointX_uid37_fpSinPiTest_b : std_logic_vector (74 downto 0);
    signal leftShiftStage2Idx1_uid130_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal leftShiftStage2Idx2_uid133_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal leftShiftStage2Idx3_uid136_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (80 downto 0);
    signal LeftShiftStage279dto0_uid140_fixedPointX_uid37_fpSinPiTest_in : std_logic_vector (79 downto 0);
    signal LeftShiftStage279dto0_uid140_fixedPointX_uid37_fpSinPiTest_b : std_logic_vector (79 downto 0);
    signal leftShiftStage3Idx1_uid141_fixedPointX_uid37_fpSinPiTest_q : std_logic_vector (80 downto 0);
begin


	--ld_xIn_v_to_xOut_v_notEnable(LOGICAL,909)
    ld_xIn_v_to_xOut_v_notEnable_a <= VCC_q;
    ld_xIn_v_to_xOut_v_notEnable_q <= not ld_xIn_v_to_xOut_v_notEnable_a;

	--ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_nor(LOGICAL,1028)
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_nor_b <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_sticky_ena_q;
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_nor_q <= not (ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_nor_a or ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_nor_b);

	--ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_mem_top(CONSTANT,1024)
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_mem_top_q <= "0100100";

	--ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmp(LOGICAL,1025)
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmp_a <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_mem_top_q;
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdmux_q);
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmp_q <= "1" when ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmp_a = ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmp_b else "0";

	--ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmpReg(REG,1026)
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmpReg_q <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmp_q;
        END IF;
    END PROCESS;


	--ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_sticky_ena(REG,1029)
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_nor_q = "1") THEN
                ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_sticky_ena_q <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_enaAnd(LOGICAL,1030)
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_enaAnd_a <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_sticky_ena_q;
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_enaAnd_b <= VCC_q;
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_enaAnd_q <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_enaAnd_a and ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_enaAnd_b;

	--LeftShiftStage174dto0_uid135_fixedPointX_uid37_fpSinPiTest(BITSELECT,134)@0
    LeftShiftStage174dto0_uid135_fixedPointX_uid37_fpSinPiTest_in <= leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_q(74 downto 0);
    LeftShiftStage174dto0_uid135_fixedPointX_uid37_fpSinPiTest_b <= LeftShiftStage174dto0_uid135_fixedPointX_uid37_fpSinPiTest_in(74 downto 0);

	--leftShiftStage2Idx3Pad6_uid134_fixedPointX_uid37_fpSinPiTest(CONSTANT,133)
    leftShiftStage2Idx3Pad6_uid134_fixedPointX_uid37_fpSinPiTest_q <= "000000";

	--leftShiftStage2Idx3_uid136_fixedPointX_uid37_fpSinPiTest(BITJOIN,135)@0
    leftShiftStage2Idx3_uid136_fixedPointX_uid37_fpSinPiTest_q <= LeftShiftStage174dto0_uid135_fixedPointX_uid37_fpSinPiTest_b & leftShiftStage2Idx3Pad6_uid134_fixedPointX_uid37_fpSinPiTest_q;

	--LeftShiftStage176dto0_uid132_fixedPointX_uid37_fpSinPiTest(BITSELECT,131)@0
    LeftShiftStage176dto0_uid132_fixedPointX_uid37_fpSinPiTest_in <= leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_q(76 downto 0);
    LeftShiftStage176dto0_uid132_fixedPointX_uid37_fpSinPiTest_b <= LeftShiftStage176dto0_uid132_fixedPointX_uid37_fpSinPiTest_in(76 downto 0);

	--leftShiftStage2Idx2Pad4_uid131_fixedPointX_uid37_fpSinPiTest(CONSTANT,130)
    leftShiftStage2Idx2Pad4_uid131_fixedPointX_uid37_fpSinPiTest_q <= "0000";

	--leftShiftStage2Idx2_uid133_fixedPointX_uid37_fpSinPiTest(BITJOIN,132)@0
    leftShiftStage2Idx2_uid133_fixedPointX_uid37_fpSinPiTest_q <= LeftShiftStage176dto0_uid132_fixedPointX_uid37_fpSinPiTest_b & leftShiftStage2Idx2Pad4_uid131_fixedPointX_uid37_fpSinPiTest_q;

	--LeftShiftStage178dto0_uid129_fixedPointX_uid37_fpSinPiTest(BITSELECT,128)@0
    LeftShiftStage178dto0_uid129_fixedPointX_uid37_fpSinPiTest_in <= leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_q(78 downto 0);
    LeftShiftStage178dto0_uid129_fixedPointX_uid37_fpSinPiTest_b <= LeftShiftStage178dto0_uid129_fixedPointX_uid37_fpSinPiTest_in(78 downto 0);

	--leftShiftStage2Idx1Pad2_uid128_fixedPointX_uid37_fpSinPiTest(CONSTANT,127)
    leftShiftStage2Idx1Pad2_uid128_fixedPointX_uid37_fpSinPiTest_q <= "00";

	--leftShiftStage2Idx1_uid130_fixedPointX_uid37_fpSinPiTest(BITJOIN,129)@0
    leftShiftStage2Idx1_uid130_fixedPointX_uid37_fpSinPiTest_q <= LeftShiftStage178dto0_uid129_fixedPointX_uid37_fpSinPiTest_b & leftShiftStage2Idx1Pad2_uid128_fixedPointX_uid37_fpSinPiTest_q;

	--LeftShiftStage056dto0_uid124_fixedPointX_uid37_fpSinPiTest(BITSELECT,123)@0
    LeftShiftStage056dto0_uid124_fixedPointX_uid37_fpSinPiTest_in <= leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_q(56 downto 0);
    LeftShiftStage056dto0_uid124_fixedPointX_uid37_fpSinPiTest_b <= LeftShiftStage056dto0_uid124_fixedPointX_uid37_fpSinPiTest_in(56 downto 0);

	--leftShiftStage1Idx3Pad24_uid123_fixedPointX_uid37_fpSinPiTest(CONSTANT,122)
    leftShiftStage1Idx3Pad24_uid123_fixedPointX_uid37_fpSinPiTest_q <= "000000000000000000000000";

	--leftShiftStage1Idx3_uid125_fixedPointX_uid37_fpSinPiTest(BITJOIN,124)@0
    leftShiftStage1Idx3_uid125_fixedPointX_uid37_fpSinPiTest_q <= LeftShiftStage056dto0_uid124_fixedPointX_uid37_fpSinPiTest_b & leftShiftStage1Idx3Pad24_uid123_fixedPointX_uid37_fpSinPiTest_q;

	--LeftShiftStage064dto0_uid121_fixedPointX_uid37_fpSinPiTest(BITSELECT,120)@0
    LeftShiftStage064dto0_uid121_fixedPointX_uid37_fpSinPiTest_in <= leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_q(64 downto 0);
    LeftShiftStage064dto0_uid121_fixedPointX_uid37_fpSinPiTest_b <= LeftShiftStage064dto0_uid121_fixedPointX_uid37_fpSinPiTest_in(64 downto 0);

	--leftShiftStage1Idx2Pad16_uid120_fixedPointX_uid37_fpSinPiTest(CONSTANT,119)
    leftShiftStage1Idx2Pad16_uid120_fixedPointX_uid37_fpSinPiTest_q <= "0000000000000000";

	--leftShiftStage1Idx2_uid122_fixedPointX_uid37_fpSinPiTest(BITJOIN,121)@0
    leftShiftStage1Idx2_uid122_fixedPointX_uid37_fpSinPiTest_q <= LeftShiftStage064dto0_uid121_fixedPointX_uid37_fpSinPiTest_b & leftShiftStage1Idx2Pad16_uid120_fixedPointX_uid37_fpSinPiTest_q;

	--LeftShiftStage072dto0_uid118_fixedPointX_uid37_fpSinPiTest(BITSELECT,117)@0
    LeftShiftStage072dto0_uid118_fixedPointX_uid37_fpSinPiTest_in <= leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_q(72 downto 0);
    LeftShiftStage072dto0_uid118_fixedPointX_uid37_fpSinPiTest_b <= LeftShiftStage072dto0_uid118_fixedPointX_uid37_fpSinPiTest_in(72 downto 0);

	--leftShiftStage1Idx1Pad8_uid117_fixedPointX_uid37_fpSinPiTest(CONSTANT,116)
    leftShiftStage1Idx1Pad8_uid117_fixedPointX_uid37_fpSinPiTest_q <= "00000000";

	--leftShiftStage1Idx1_uid119_fixedPointX_uid37_fpSinPiTest(BITJOIN,118)@0
    leftShiftStage1Idx1_uid119_fixedPointX_uid37_fpSinPiTest_q <= LeftShiftStage072dto0_uid118_fixedPointX_uid37_fpSinPiTest_b & leftShiftStage1Idx1Pad8_uid117_fixedPointX_uid37_fpSinPiTest_q;

	--leftShiftStage0Idx3_uid114_fixedPointX_uid37_fpSinPiTest(CONSTANT,113)
    leftShiftStage0Idx3_uid114_fixedPointX_uid37_fpSinPiTest_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000";

	--X16dto0_uid112_fixedPointX_uid37_fpSinPiTest(BITSELECT,111)@0
    X16dto0_uid112_fixedPointX_uid37_fpSinPiTest_in <= extendedFracX_uid35_fpSinPiTest_q(16 downto 0);
    X16dto0_uid112_fixedPointX_uid37_fpSinPiTest_b <= X16dto0_uid112_fixedPointX_uid37_fpSinPiTest_in(16 downto 0);

	--leftShiftStage0Idx2Pad64_uid111_fixedPointX_uid37_fpSinPiTest(CONSTANT,110)
    leftShiftStage0Idx2Pad64_uid111_fixedPointX_uid37_fpSinPiTest_q <= "0000000000000000000000000000000000000000000000000000000000000000";

	--leftShiftStage0Idx2_uid113_fixedPointX_uid37_fpSinPiTest(BITJOIN,112)@0
    leftShiftStage0Idx2_uid113_fixedPointX_uid37_fpSinPiTest_q <= X16dto0_uid112_fixedPointX_uid37_fpSinPiTest_b & leftShiftStage0Idx2Pad64_uid111_fixedPointX_uid37_fpSinPiTest_q;

	--X48dto0_uid109_fixedPointX_uid37_fpSinPiTest(BITSELECT,108)@0
    X48dto0_uid109_fixedPointX_uid37_fpSinPiTest_in <= extendedFracX_uid35_fpSinPiTest_q(48 downto 0);
    X48dto0_uid109_fixedPointX_uid37_fpSinPiTest_b <= X48dto0_uid109_fixedPointX_uid37_fpSinPiTest_in(48 downto 0);

	--leftShiftStage0Idx1Pad32_uid108_fixedPointX_uid37_fpSinPiTest(CONSTANT,107)
    leftShiftStage0Idx1Pad32_uid108_fixedPointX_uid37_fpSinPiTest_q <= "00000000000000000000000000000000";

	--leftShiftStage0Idx1_uid110_fixedPointX_uid37_fpSinPiTest(BITJOIN,109)@0
    leftShiftStage0Idx1_uid110_fixedPointX_uid37_fpSinPiTest_q <= X48dto0_uid109_fixedPointX_uid37_fpSinPiTest_b & leftShiftStage0Idx1Pad32_uid108_fixedPointX_uid37_fpSinPiTest_q;

	--cst01pWShift_uid34_fpSinPiTest(CONSTANT,33)
    cst01pWShift_uid34_fpSinPiTest_q <= "0000000000000000000000000000";

	--xIn(PORTIN,3)@0

	--fracX_uid7_fpSinPiTest(BITSELECT,6)@0
    fracX_uid7_fpSinPiTest_in <= xIn_0(51 downto 0);
    fracX_uid7_fpSinPiTest_b <= fracX_uid7_fpSinPiTest_in(51 downto 0);

	--oFracX_uid31_uid31_fpSinPiTest(BITJOIN,30)@0
    oFracX_uid31_uid31_fpSinPiTest_q <= VCC_q & fracX_uid7_fpSinPiTest_b;

	--extendedFracX_uid35_fpSinPiTest(BITJOIN,34)@0
    extendedFracX_uid35_fpSinPiTest_q <= cst01pWShift_uid34_fpSinPiTest_q & oFracX_uid31_uid31_fpSinPiTest_q;

	--shiftBias_uid32_fpSinPiTest(CONSTANT,31)
    shiftBias_uid32_fpSinPiTest_q <= "01111100011";

	--expX_uid6_fpSinPiTest(BITSELECT,5)@0
    expX_uid6_fpSinPiTest_in <= xIn_0(62 downto 0);
    expX_uid6_fpSinPiTest_b <= expX_uid6_fpSinPiTest_in(62 downto 52);

	--shiftValue_uid33_fpSinPiTest(SUB,32)@0
    shiftValue_uid33_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpSinPiTest_b);
    shiftValue_uid33_fpSinPiTest_b <= STD_LOGIC_VECTOR("0" & shiftBias_uid32_fpSinPiTest_q);
            shiftValue_uid33_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValue_uid33_fpSinPiTest_a) - UNSIGNED(shiftValue_uid33_fpSinPiTest_b));
    shiftValue_uid33_fpSinPiTest_q <= shiftValue_uid33_fpSinPiTest_o(11 downto 0);


	--fxpShifterBits_uid36_fpSinPiTest(BITSELECT,35)@0
    fxpShifterBits_uid36_fpSinPiTest_in <= shiftValue_uid33_fpSinPiTest_q(6 downto 0);
    fxpShifterBits_uid36_fpSinPiTest_b <= fxpShifterBits_uid36_fpSinPiTest_in(6 downto 0);

	--leftShiftStageSel6Dto5_uid115_fixedPointX_uid37_fpSinPiTest(BITSELECT,114)@0
    leftShiftStageSel6Dto5_uid115_fixedPointX_uid37_fpSinPiTest_in <= fxpShifterBits_uid36_fpSinPiTest_b;
    leftShiftStageSel6Dto5_uid115_fixedPointX_uid37_fpSinPiTest_b <= leftShiftStageSel6Dto5_uid115_fixedPointX_uid37_fpSinPiTest_in(6 downto 5);

	--leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest(MUX,115)@0
    leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_s <= leftShiftStageSel6Dto5_uid115_fixedPointX_uid37_fpSinPiTest_b;
    leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest: PROCESS (leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_s, extendedFracX_uid35_fpSinPiTest_q, leftShiftStage0Idx1_uid110_fixedPointX_uid37_fpSinPiTest_q, leftShiftStage0Idx2_uid113_fixedPointX_uid37_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_q <= extendedFracX_uid35_fpSinPiTest_q;
                  WHEN "01" => leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_q <= leftShiftStage0Idx1_uid110_fixedPointX_uid37_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_q <= leftShiftStage0Idx2_uid113_fixedPointX_uid37_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_q <= leftShiftStage0Idx3_uid114_fixedPointX_uid37_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel4Dto3_uid126_fixedPointX_uid37_fpSinPiTest(BITSELECT,125)@0
    leftShiftStageSel4Dto3_uid126_fixedPointX_uid37_fpSinPiTest_in <= fxpShifterBits_uid36_fpSinPiTest_b(4 downto 0);
    leftShiftStageSel4Dto3_uid126_fixedPointX_uid37_fpSinPiTest_b <= leftShiftStageSel4Dto3_uid126_fixedPointX_uid37_fpSinPiTest_in(4 downto 3);

	--leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest(MUX,126)@0
    leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_s <= leftShiftStageSel4Dto3_uid126_fixedPointX_uid37_fpSinPiTest_b;
    leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest: PROCESS (leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_s, leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_q, leftShiftStage1Idx1_uid119_fixedPointX_uid37_fpSinPiTest_q, leftShiftStage1Idx2_uid122_fixedPointX_uid37_fpSinPiTest_q, leftShiftStage1Idx3_uid125_fixedPointX_uid37_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_q <= leftShiftStage0_uid116_fixedPointX_uid37_fpSinPiTest_q;
                  WHEN "01" => leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_q <= leftShiftStage1Idx1_uid119_fixedPointX_uid37_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_q <= leftShiftStage1Idx2_uid122_fixedPointX_uid37_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_q <= leftShiftStage1Idx3_uid125_fixedPointX_uid37_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel2Dto1_uid137_fixedPointX_uid37_fpSinPiTest(BITSELECT,136)@0
    leftShiftStageSel2Dto1_uid137_fixedPointX_uid37_fpSinPiTest_in <= fxpShifterBits_uid36_fpSinPiTest_b(2 downto 0);
    leftShiftStageSel2Dto1_uid137_fixedPointX_uid37_fpSinPiTest_b <= leftShiftStageSel2Dto1_uid137_fixedPointX_uid37_fpSinPiTest_in(2 downto 1);

	--leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest(MUX,137)@0
    leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_s <= leftShiftStageSel2Dto1_uid137_fixedPointX_uid37_fpSinPiTest_b;
    leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest: PROCESS (leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_s, leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_q, leftShiftStage2Idx1_uid130_fixedPointX_uid37_fpSinPiTest_q, leftShiftStage2Idx2_uid133_fixedPointX_uid37_fpSinPiTest_q, leftShiftStage2Idx3_uid136_fixedPointX_uid37_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_q <= leftShiftStage1_uid127_fixedPointX_uid37_fpSinPiTest_q;
                  WHEN "01" => leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_q <= leftShiftStage2Idx1_uid130_fixedPointX_uid37_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_q <= leftShiftStage2Idx2_uid133_fixedPointX_uid37_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_q <= leftShiftStage2Idx3_uid136_fixedPointX_uid37_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage279dto0_uid140_fixedPointX_uid37_fpSinPiTest(BITSELECT,139)@0
    LeftShiftStage279dto0_uid140_fixedPointX_uid37_fpSinPiTest_in <= leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_q(79 downto 0);
    LeftShiftStage279dto0_uid140_fixedPointX_uid37_fpSinPiTest_b <= LeftShiftStage279dto0_uid140_fixedPointX_uid37_fpSinPiTest_in(79 downto 0);

	--GND(CONSTANT,0)
    GND_q <= "0";

	--leftShiftStage3Idx1_uid141_fixedPointX_uid37_fpSinPiTest(BITJOIN,140)@0
    leftShiftStage3Idx1_uid141_fixedPointX_uid37_fpSinPiTest_q <= LeftShiftStage279dto0_uid140_fixedPointX_uid37_fpSinPiTest_b & GND_q;

	--reg_leftShiftStage3Idx1_uid141_fixedPointX_uid37_fpSinPiTest_0_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_3(REG,357)@0
    reg_leftShiftStage3Idx1_uid141_fixedPointX_uid37_fpSinPiTest_0_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage3Idx1_uid141_fixedPointX_uid37_fpSinPiTest_0_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_3_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_leftShiftStage3Idx1_uid141_fixedPointX_uid37_fpSinPiTest_0_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_3_q <= leftShiftStage3Idx1_uid141_fixedPointX_uid37_fpSinPiTest_q;
        END IF;
    END PROCESS;


	--reg_leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_0_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_2(REG,358)@0
    reg_leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_0_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_0_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_2_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_0_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_2_q <= leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_q;
        END IF;
    END PROCESS;


	--leftShiftStageSel0Dto0_uid142_fixedPointX_uid37_fpSinPiTest(BITSELECT,141)@0
    leftShiftStageSel0Dto0_uid142_fixedPointX_uid37_fpSinPiTest_in <= fxpShifterBits_uid36_fpSinPiTest_b(0 downto 0);
    leftShiftStageSel0Dto0_uid142_fixedPointX_uid37_fpSinPiTest_b <= leftShiftStageSel0Dto0_uid142_fixedPointX_uid37_fpSinPiTest_in(0 downto 0);

	--ld_leftShiftStageSel0Dto0_uid142_fixedPointX_uid37_fpSinPiTest_b_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_b(DELAY,581)@0
    ld_leftShiftStageSel0Dto0_uid142_fixedPointX_uid37_fpSinPiTest_b_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel0Dto0_uid142_fixedPointX_uid37_fpSinPiTest_b, xout => ld_leftShiftStageSel0Dto0_uid142_fixedPointX_uid37_fpSinPiTest_b_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_b_q, clk => clk, aclr => areset );

	--leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest(MUX,142)@1
    leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_s <= ld_leftShiftStageSel0Dto0_uid142_fixedPointX_uid37_fpSinPiTest_b_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_b_q;
    leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest: PROCESS (leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_s, reg_leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_0_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_2_q, reg_leftShiftStage3Idx1_uid141_fixedPointX_uid37_fpSinPiTest_0_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_3_q)
    BEGIN
            CASE leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_s IS
                  WHEN "0" => leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_q <= reg_leftShiftStage2_uid138_fixedPointX_uid37_fpSinPiTest_0_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_2_q;
                  WHEN "1" => leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_q <= reg_leftShiftStage3Idx1_uid141_fixedPointX_uid37_fpSinPiTest_0_to_leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_3_q;
                  WHEN OTHERS => leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--intXParity_uid38_fpSinPiTest(BITSELECT,37)@1
    intXParity_uid38_fpSinPiTest_in <= leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_q;
    intXParity_uid38_fpSinPiTest_b <= intXParity_uid38_fpSinPiTest_in(80 downto 80);

	--ld_intXParity_uid38_fpSinPiTest_b_to_signComp_uid101_fpSinPiTest_c(DELAY,536)@1
    ld_intXParity_uid38_fpSinPiTest_b_to_signComp_uid101_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => intXParity_uid38_fpSinPiTest_b, xout => ld_intXParity_uid38_fpSinPiTest_b_to_signComp_uid101_fpSinPiTest_c_q, clk => clk, aclr => areset );

	--biasM1_uid27_fpSinPiTest(CONSTANT,26)
    biasM1_uid27_fpSinPiTest_q <= "01111111110";

	--xFrac_uid28_fpSinPiTest(COMPARE,27)@0
    xFrac_uid28_fpSinPiTest_cin <= GND_q;
    xFrac_uid28_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & biasM1_uid27_fpSinPiTest_q) & '0';
    xFrac_uid28_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & expX_uid6_fpSinPiTest_b) & xFrac_uid28_fpSinPiTest_cin(0);
            xFrac_uid28_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xFrac_uid28_fpSinPiTest_a) - UNSIGNED(xFrac_uid28_fpSinPiTest_b));
    xFrac_uid28_fpSinPiTest_n(0) <= not xFrac_uid28_fpSinPiTest_o(13);


	--ld_xFrac_uid28_fpSinPiTest_n_to_InvXFrac_uid99_fpSinPiTest_a(DELAY,532)@0
    ld_xFrac_uid28_fpSinPiTest_n_to_InvXFrac_uid99_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => xFrac_uid28_fpSinPiTest_n, xout => ld_xFrac_uid28_fpSinPiTest_n_to_InvXFrac_uid99_fpSinPiTest_a_q, clk => clk, aclr => areset );

	--InvXFrac_uid99_fpSinPiTest(LOGICAL,98)@3
    InvXFrac_uid99_fpSinPiTest_a <= ld_xFrac_uid28_fpSinPiTest_n_to_InvXFrac_uid99_fpSinPiTest_a_q;
    InvXFrac_uid99_fpSinPiTest_q <= not InvXFrac_uid99_fpSinPiTest_a;

	--biasMwShift_uid29_fpSinPiTest(CONSTANT,28)
    biasMwShift_uid29_fpSinPiTest_q <= "01111100100";

	--sinXIsX_uid30_fpSinPiTest(COMPARE,29)@0
    sinXIsX_uid30_fpSinPiTest_cin <= GND_q;
    sinXIsX_uid30_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & expX_uid6_fpSinPiTest_b) & '0';
    sinXIsX_uid30_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & biasMwShift_uid29_fpSinPiTest_q) & sinXIsX_uid30_fpSinPiTest_cin(0);
            sinXIsX_uid30_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(sinXIsX_uid30_fpSinPiTest_a) - UNSIGNED(sinXIsX_uid30_fpSinPiTest_b));
    sinXIsX_uid30_fpSinPiTest_c(0) <= sinXIsX_uid30_fpSinPiTest_o(13);


	--ld_sinXIsX_uid30_fpSinPiTest_c_to_InvSinXIsX_uid80_fpSinPiTest_a(DELAY,502)@0
    ld_sinXIsX_uid30_fpSinPiTest_c_to_InvSinXIsX_uid80_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => sinXIsX_uid30_fpSinPiTest_c, xout => ld_sinXIsX_uid30_fpSinPiTest_c_to_InvSinXIsX_uid80_fpSinPiTest_a_q, clk => clk, aclr => areset );

	--InvSinXIsX_uid80_fpSinPiTest(LOGICAL,79)@2
    InvSinXIsX_uid80_fpSinPiTest_a <= ld_sinXIsX_uid30_fpSinPiTest_c_to_InvSinXIsX_uid80_fpSinPiTest_a_q;
    InvSinXIsX_uid80_fpSinPiTest_q <= not InvSinXIsX_uid80_fpSinPiTest_a;

	--y_uid39_fpSinPiTest(BITSELECT,38)@1
    y_uid39_fpSinPiTest_in <= leftShiftStage3_uid143_fixedPointX_uid37_fpSinPiTest_q(79 downto 0);
    y_uid39_fpSinPiTest_b <= y_uid39_fpSinPiTest_in(79 downto 0);

	--reg_y_uid39_fpSinPiTest_0_to_yIsZero_uid40_fpSinPiTest_0(REG,360)@1
    reg_y_uid39_fpSinPiTest_0_to_yIsZero_uid40_fpSinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_y_uid39_fpSinPiTest_0_to_yIsZero_uid40_fpSinPiTest_0_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_y_uid39_fpSinPiTest_0_to_yIsZero_uid40_fpSinPiTest_0_q <= y_uid39_fpSinPiTest_b;
        END IF;
    END PROCESS;


	--yIsZero_uid40_fpSinPiTest(LOGICAL,39)@2
    yIsZero_uid40_fpSinPiTest_a <= reg_y_uid39_fpSinPiTest_0_to_yIsZero_uid40_fpSinPiTest_0_q;
    yIsZero_uid40_fpSinPiTest_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000000000000000000000000000000000000000000000000" & GND_q);
    yIsZero_uid40_fpSinPiTest_q <= "1" when yIsZero_uid40_fpSinPiTest_a = yIsZero_uid40_fpSinPiTest_b else "0";

	--And2YIsZeroInvSinXIsX_uid81_fpSinPiTest(LOGICAL,80)@2
    And2YIsZeroInvSinXIsX_uid81_fpSinPiTest_a <= yIsZero_uid40_fpSinPiTest_q;
    And2YIsZeroInvSinXIsX_uid81_fpSinPiTest_b <= InvSinXIsX_uid80_fpSinPiTest_q;
    And2YIsZeroInvSinXIsX_uid81_fpSinPiTest_q <= And2YIsZeroInvSinXIsX_uid81_fpSinPiTest_a and And2YIsZeroInvSinXIsX_uid81_fpSinPiTest_b;

	--cstBiasPwF_uid13_fpSinPiTest(CONSTANT,12)
    cstBiasPwF_uid13_fpSinPiTest_q <= "10000110011";

	--xIntExp_uid26_fpSinPiTest(COMPARE,25)@0
    xIntExp_uid26_fpSinPiTest_cin <= GND_q;
    xIntExp_uid26_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & cstBiasPwF_uid13_fpSinPiTest_q) & '0';
    xIntExp_uid26_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & expX_uid6_fpSinPiTest_b) & xIntExp_uid26_fpSinPiTest_cin(0);
            xIntExp_uid26_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xIntExp_uid26_fpSinPiTest_a) - UNSIGNED(xIntExp_uid26_fpSinPiTest_b));
    xIntExp_uid26_fpSinPiTest_c(0) <= xIntExp_uid26_fpSinPiTest_o(13);


	--ld_xIntExp_uid26_fpSinPiTest_c_to_Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_a(DELAY,505)@0
    ld_xIntExp_uid26_fpSinPiTest_c_to_Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => xIntExp_uid26_fpSinPiTest_c, xout => ld_xIntExp_uid26_fpSinPiTest_c_to_Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_a_q, clk => clk, aclr => areset );

	--Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest(LOGICAL,81)@2
    Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_a <= ld_xIntExp_uid26_fpSinPiTest_c_to_Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_a_q;
    Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_b <= And2YIsZeroInvSinXIsX_uid81_fpSinPiTest_q;
    Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_q <= Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_a or Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_b;

	--cstAllZWF_uid10_fpSinPiTest(CONSTANT,9)
    cstAllZWF_uid10_fpSinPiTest_q <= "0000000000000000000000000000000000000000000000000000";

	--fracXIsZero_uid17_fpSinPiTest(LOGICAL,16)@0
    fracXIsZero_uid17_fpSinPiTest_a <= fracX_uid7_fpSinPiTest_b;
    fracXIsZero_uid17_fpSinPiTest_b <= cstAllZWF_uid10_fpSinPiTest_q;
    fracXIsZero_uid17_fpSinPiTest_q <= "1" when fracXIsZero_uid17_fpSinPiTest_a = fracXIsZero_uid17_fpSinPiTest_b else "0";

	--ld_fracXIsZero_uid17_fpSinPiTest_q_to_InvFracXIsZero_uid19_fpSinPiTest_a(DELAY,442)@0
    ld_fracXIsZero_uid17_fpSinPiTest_q_to_InvFracXIsZero_uid19_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => fracXIsZero_uid17_fpSinPiTest_q, xout => ld_fracXIsZero_uid17_fpSinPiTest_q_to_InvFracXIsZero_uid19_fpSinPiTest_a_q, clk => clk, aclr => areset );

	--InvFracXIsZero_uid19_fpSinPiTest(LOGICAL,18)@1
    InvFracXIsZero_uid19_fpSinPiTest_a <= ld_fracXIsZero_uid17_fpSinPiTest_q_to_InvFracXIsZero_uid19_fpSinPiTest_a_q;
    InvFracXIsZero_uid19_fpSinPiTest_q <= not InvFracXIsZero_uid19_fpSinPiTest_a;

	--cstAllOWE_uid9_fpSinPiTest(CONSTANT,8)
    cstAllOWE_uid9_fpSinPiTest_q <= "11111111111";

	--expXIsMax_uid16_fpSinPiTest(LOGICAL,15)@0
    expXIsMax_uid16_fpSinPiTest_a <= expX_uid6_fpSinPiTest_b;
    expXIsMax_uid16_fpSinPiTest_b <= cstAllOWE_uid9_fpSinPiTest_q;
    expXIsMax_uid16_fpSinPiTest_q <= "1" when expXIsMax_uid16_fpSinPiTest_a = expXIsMax_uid16_fpSinPiTest_b else "0";

	--ld_expXIsMax_uid16_fpSinPiTest_q_to_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_a(DELAY,443)@0
    ld_expXIsMax_uid16_fpSinPiTest_q_to_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsMax_uid16_fpSinPiTest_q, xout => ld_expXIsMax_uid16_fpSinPiTest_q_to_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_a_q, clk => clk, aclr => areset );

	--And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest(LOGICAL,19)@1
    And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_a <= ld_expXIsMax_uid16_fpSinPiTest_q_to_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_a_q;
    And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_b <= InvFracXIsZero_uid19_fpSinPiTest_q;
    And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q <= And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_a and And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_b;

	--InvAnd2ExpXIsMaxInvFracXIsZero_uid21_fpSinPiTest(LOGICAL,20)@1
    InvAnd2ExpXIsMaxInvFracXIsZero_uid21_fpSinPiTest_a <= And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q;
    InvAnd2ExpXIsMaxInvFracXIsZero_uid21_fpSinPiTest_q <= not InvAnd2ExpXIsMaxInvFracXIsZero_uid21_fpSinPiTest_a;

	--And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest(LOGICAL,17)@0
    And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_a <= expXIsMax_uid16_fpSinPiTest_q;
    And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_b <= fracXIsZero_uid17_fpSinPiTest_q;
    And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_q <= And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_a and And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_b;

	--InvAnd2ExpXIsMaxFracXIsZero_uid22_fpSinPiTest(LOGICAL,21)@0
    InvAnd2ExpXIsMaxFracXIsZero_uid22_fpSinPiTest_a <= And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_q;
    InvAnd2ExpXIsMaxFracXIsZero_uid22_fpSinPiTest_q <= not InvAnd2ExpXIsMaxFracXIsZero_uid22_fpSinPiTest_a;

	--cstAllZWE_uid11_fpSinPiTest(CONSTANT,10)
    cstAllZWE_uid11_fpSinPiTest_q <= "00000000000";

	--expXIsZero_uid15_fpSinPiTest(LOGICAL,14)@0
    expXIsZero_uid15_fpSinPiTest_a <= expX_uid6_fpSinPiTest_b;
    expXIsZero_uid15_fpSinPiTest_b <= cstAllZWE_uid11_fpSinPiTest_q;
    expXIsZero_uid15_fpSinPiTest_q <= "1" when expXIsZero_uid15_fpSinPiTest_a = expXIsZero_uid15_fpSinPiTest_b else "0";

	--InvExpXIsZero_uid23_fpSinPiTest(LOGICAL,22)@0
    InvExpXIsZero_uid23_fpSinPiTest_a <= expXIsZero_uid15_fpSinPiTest_q;
    InvExpXIsZero_uid23_fpSinPiTest_q <= not InvExpXIsZero_uid23_fpSinPiTest_a;

	--And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest(LOGICAL,23)@0
    And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest_a <= InvExpXIsZero_uid23_fpSinPiTest_q;
    And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest_b <= InvAnd2ExpXIsMaxFracXIsZero_uid22_fpSinPiTest_q;
    And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest_q <= And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest_a and And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest_b;

	--ld_And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest_q_to_And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_a(DELAY,450)@0
    ld_And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest_q_to_And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest_q, xout => ld_And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest_q_to_And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_a_q, clk => clk, aclr => areset );

	--And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest(LOGICAL,24)@1
    And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_a <= ld_And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZero_uid24_fpSinPiTest_q_to_And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_a_q;
    And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_b <= InvAnd2ExpXIsMaxInvFracXIsZero_uid21_fpSinPiTest_q;
    And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_q <= And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_a and And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_b;
        END IF;
    END PROCESS;



	--xIsInt_uid83_fpSinPiTest(LOGICAL,82)@2
    xIsInt_uid83_fpSinPiTest_a <= And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_q;
    xIsInt_uid83_fpSinPiTest_b <= Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_q;
    xIsInt_uid83_fpSinPiTest_q <= xIsInt_uid83_fpSinPiTest_a and xIsInt_uid83_fpSinPiTest_b;

	--InvXIsInt_uid100_fpSinPiTest(LOGICAL,99)@2
    InvXIsInt_uid100_fpSinPiTest_a <= xIsInt_uid83_fpSinPiTest_q;
    InvXIsInt_uid100_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvXIsInt_uid100_fpSinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            InvXIsInt_uid100_fpSinPiTest_q <= not InvXIsInt_uid100_fpSinPiTest_a;
        END IF;
    END PROCESS;



	--signComp_uid101_fpSinPiTest(LOGICAL,100)@3
    signComp_uid101_fpSinPiTest_a <= InvXIsInt_uid100_fpSinPiTest_q;
    signComp_uid101_fpSinPiTest_b <= InvXFrac_uid99_fpSinPiTest_q;
    signComp_uid101_fpSinPiTest_c <= ld_intXParity_uid38_fpSinPiTest_b_to_signComp_uid101_fpSinPiTest_c_q;
    signComp_uid101_fpSinPiTest_q <= signComp_uid101_fpSinPiTest_a and signComp_uid101_fpSinPiTest_b and signComp_uid101_fpSinPiTest_c;

	--ld_yIsZero_uid40_fpSinPiTest_q_to_InvYIsZero_uid102_fpSinPiTest_a(DELAY,537)@2
    ld_yIsZero_uid40_fpSinPiTest_q_to_InvYIsZero_uid102_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => yIsZero_uid40_fpSinPiTest_q, xout => ld_yIsZero_uid40_fpSinPiTest_q_to_InvYIsZero_uid102_fpSinPiTest_a_q, clk => clk, aclr => areset );

	--InvYIsZero_uid102_fpSinPiTest(LOGICAL,101)@3
    InvYIsZero_uid102_fpSinPiTest_a <= ld_yIsZero_uid40_fpSinPiTest_q_to_InvYIsZero_uid102_fpSinPiTest_a_q;
    InvYIsZero_uid102_fpSinPiTest_q <= not InvYIsZero_uid102_fpSinPiTest_a;

	--And2InvYIsZeroSignComp_uid103_fpSinPiTest(LOGICAL,102)@3
    And2InvYIsZeroSignComp_uid103_fpSinPiTest_a <= InvYIsZero_uid102_fpSinPiTest_q;
    And2InvYIsZeroSignComp_uid103_fpSinPiTest_b <= signComp_uid101_fpSinPiTest_q;
    And2InvYIsZeroSignComp_uid103_fpSinPiTest_q <= And2InvYIsZeroSignComp_uid103_fpSinPiTest_a and And2InvYIsZeroSignComp_uid103_fpSinPiTest_b;

	--signX_uid8_fpSinPiTest(BITSELECT,7)@0
    signX_uid8_fpSinPiTest_in <= xIn_0;
    signX_uid8_fpSinPiTest_b <= signX_uid8_fpSinPiTest_in(63 downto 63);

	--ld_signX_uid8_fpSinPiTest_b_to_signR_uid104_fpSinPiTest_a(DELAY,540)@0
    ld_signX_uid8_fpSinPiTest_b_to_signR_uid104_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => signX_uid8_fpSinPiTest_b, xout => ld_signX_uid8_fpSinPiTest_b_to_signR_uid104_fpSinPiTest_a_q, clk => clk, aclr => areset );

	--signR_uid104_fpSinPiTest(LOGICAL,103)@3
    signR_uid104_fpSinPiTest_a <= ld_signX_uid8_fpSinPiTest_b_to_signR_uid104_fpSinPiTest_a_q;
    signR_uid104_fpSinPiTest_b <= And2InvYIsZeroSignComp_uid103_fpSinPiTest_q;
    signR_uid104_fpSinPiTest_q <= signR_uid104_fpSinPiTest_a xor signR_uid104_fpSinPiTest_b;

	--ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt(COUNTER,1020)
    -- every=1, low=0, high=36, step=1, init=1
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_i = 35 THEN
                  ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_eq <= '1';
                ELSE
                  ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_eq = '1') THEN
                    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_i <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_i - 36;
                ELSE
                    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_i <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_i,6));


	--ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdreg(REG,1021)
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdreg_q <= "000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdreg_q <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdmux(MUX,1022)
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdmux_s <= VCC_q;
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdmux: PROCESS (ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdmux_s, ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdreg_q, ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_q)
    BEGIN
            CASE ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdmux_s IS
                  WHEN "0" => ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdmux_q <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdreg_q;
                  WHEN "1" => ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdmux_q <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem(DUALMEM,1019)
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_reset0 <= areset;
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_ia <= signR_uid104_fpSinPiTest_q;
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_aa <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdreg_q;
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_ab <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdmux_q;
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 37,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 37,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_iq,
        address_a => ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_aa,
        data_a => ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_ia
    );
        ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_q <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_iq(0 downto 0);

	--ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_outputreg(DELAY,1018)
    ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_outputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_mem_q, xout => ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_outputreg_q, clk => clk, aclr => areset );

	--cstBias_uid12_fpSinPiTest(CONSTANT,11)
    cstBias_uid12_fpSinPiTest_q <= "01111111111";

	--piwFP2_uid67_fpSinPiTest(CONSTANT,66)
    piwFP2_uid67_fpSinPiTest_q <= "110010010000111111011010101000100010000101101000110001";

	--reg_y_uid39_fpSinPiTest_0_to_oneMinusY_uid45_fpSinPiTest_1(REG,363)@1
    reg_y_uid39_fpSinPiTest_0_to_oneMinusY_uid45_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_y_uid39_fpSinPiTest_0_to_oneMinusY_uid45_fpSinPiTest_1_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_y_uid39_fpSinPiTest_0_to_oneMinusY_uid45_fpSinPiTest_1_q <= y_uid39_fpSinPiTest_b;
        END IF;
    END PROCESS;


	--cOne_uid44_fpSinPiTest(CONSTANT,43)
    cOne_uid44_fpSinPiTest_q <= "100000000000000000000000000000000000000000000000000000000000000000000000000000000";

	--oneMinusY_uid45_fpSinPiTest(SUB,44)@2
    oneMinusY_uid45_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & cOne_uid44_fpSinPiTest_q);
    oneMinusY_uid45_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & reg_y_uid39_fpSinPiTest_0_to_oneMinusY_uid45_fpSinPiTest_1_q);
    oneMinusY_uid45_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oneMinusY_uid45_fpSinPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            oneMinusY_uid45_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oneMinusY_uid45_fpSinPiTest_a) - UNSIGNED(oneMinusY_uid45_fpSinPiTest_b));
        END IF;
    END PROCESS;
    oneMinusY_uid45_fpSinPiTest_q <= oneMinusY_uid45_fpSinPiTest_o(81 downto 0);


	--oMyBottom_uid47_fpSinPiTest(BITSELECT,46)@3
    oMyBottom_uid47_fpSinPiTest_in <= oneMinusY_uid45_fpSinPiTest_q(78 downto 0);
    oMyBottom_uid47_fpSinPiTest_b <= oMyBottom_uid47_fpSinPiTest_in(78 downto 0);

	--ld_oMyBottom_uid47_fpSinPiTest_b_to_z_uid49_fpSinPiTest_d(DELAY,471)@3
    ld_oMyBottom_uid47_fpSinPiTest_b_to_z_uid49_fpSinPiTest_d : dspba_delay
    GENERIC MAP ( width => 79, depth => 1 )
    PORT MAP ( xin => oMyBottom_uid47_fpSinPiTest_b, xout => ld_oMyBottom_uid47_fpSinPiTest_b_to_z_uid49_fpSinPiTest_d_q, clk => clk, aclr => areset );

	--yBottom_uid48_fpSinPiTest(BITSELECT,47)@1
    yBottom_uid48_fpSinPiTest_in <= y_uid39_fpSinPiTest_b(78 downto 0);
    yBottom_uid48_fpSinPiTest_b <= yBottom_uid48_fpSinPiTest_in(78 downto 0);

	--ld_yBottom_uid48_fpSinPiTest_b_to_z_uid49_fpSinPiTest_c(DELAY,470)@1
    ld_yBottom_uid48_fpSinPiTest_b_to_z_uid49_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 79, depth => 2 )
    PORT MAP ( xin => yBottom_uid48_fpSinPiTest_b, xout => ld_yBottom_uid48_fpSinPiTest_b_to_z_uid49_fpSinPiTest_c_q, clk => clk, aclr => areset );

	--ld_yBottom_uid48_fpSinPiTest_b_to_z_uid49_fpSinPiTest_c_outputreg(DELAY,926)
    ld_yBottom_uid48_fpSinPiTest_b_to_z_uid49_fpSinPiTest_c_outputreg : dspba_delay
    GENERIC MAP ( width => 79, depth => 1 )
    PORT MAP ( xin => ld_yBottom_uid48_fpSinPiTest_b_to_z_uid49_fpSinPiTest_c_q, xout => ld_yBottom_uid48_fpSinPiTest_b_to_z_uid49_fpSinPiTest_c_outputreg_q, clk => clk, aclr => areset );

	--ld_y_uid39_fpSinPiTest_b_to_reg_y_uid39_fpSinPiTest_0_to_cmpYToOneMinusY_uid46_fpSinPiTest_1_a(DELAY,833)@1
    ld_y_uid39_fpSinPiTest_b_to_reg_y_uid39_fpSinPiTest_0_to_cmpYToOneMinusY_uid46_fpSinPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 80, depth => 1 )
    PORT MAP ( xin => y_uid39_fpSinPiTest_b, xout => ld_y_uid39_fpSinPiTest_b_to_reg_y_uid39_fpSinPiTest_0_to_cmpYToOneMinusY_uid46_fpSinPiTest_1_a_q, clk => clk, aclr => areset );

	--reg_y_uid39_fpSinPiTest_0_to_cmpYToOneMinusY_uid46_fpSinPiTest_1(REG,364)@2
    reg_y_uid39_fpSinPiTest_0_to_cmpYToOneMinusY_uid46_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_y_uid39_fpSinPiTest_0_to_cmpYToOneMinusY_uid46_fpSinPiTest_1_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_y_uid39_fpSinPiTest_0_to_cmpYToOneMinusY_uid46_fpSinPiTest_1_q <= ld_y_uid39_fpSinPiTest_b_to_reg_y_uid39_fpSinPiTest_0_to_cmpYToOneMinusY_uid46_fpSinPiTest_1_a_q;
        END IF;
    END PROCESS;


	--cmpYToOneMinusY_uid46_fpSinPiTest(COMPARE,45)@3
    cmpYToOneMinusY_uid46_fpSinPiTest_cin <= GND_q;
    cmpYToOneMinusY_uid46_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & oneMinusY_uid45_fpSinPiTest_q) & '0';
    cmpYToOneMinusY_uid46_fpSinPiTest_b <= STD_LOGIC_VECTOR("0000" & reg_y_uid39_fpSinPiTest_0_to_cmpYToOneMinusY_uid46_fpSinPiTest_1_q) & cmpYToOneMinusY_uid46_fpSinPiTest_cin(0);
    cmpYToOneMinusY_uid46_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            cmpYToOneMinusY_uid46_fpSinPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            cmpYToOneMinusY_uid46_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(cmpYToOneMinusY_uid46_fpSinPiTest_a) - UNSIGNED(cmpYToOneMinusY_uid46_fpSinPiTest_b));
        END IF;
    END PROCESS;
    cmpYToOneMinusY_uid46_fpSinPiTest_c(0) <= cmpYToOneMinusY_uid46_fpSinPiTest_o(84);


	--z_uid49_fpSinPiTest(MUX,48)@4
    z_uid49_fpSinPiTest_s <= cmpYToOneMinusY_uid46_fpSinPiTest_c;
    z_uid49_fpSinPiTest: PROCESS (z_uid49_fpSinPiTest_s, ld_yBottom_uid48_fpSinPiTest_b_to_z_uid49_fpSinPiTest_c_outputreg_q, ld_oMyBottom_uid47_fpSinPiTest_b_to_z_uid49_fpSinPiTest_d_q)
    BEGIN
            CASE z_uid49_fpSinPiTest_s IS
                  WHEN "0" => z_uid49_fpSinPiTest_q <= ld_yBottom_uid48_fpSinPiTest_b_to_z_uid49_fpSinPiTest_c_outputreg_q;
                  WHEN "1" => z_uid49_fpSinPiTest_q <= ld_oMyBottom_uid47_fpSinPiTest_b_to_z_uid49_fpSinPiTest_d_q;
                  WHEN OTHERS => z_uid49_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--zAddr_uid63_fpSinPiTest(BITSELECT,62)@4
    zAddr_uid63_fpSinPiTest_in <= z_uid49_fpSinPiTest_q;
    zAddr_uid63_fpSinPiTest_b <= zAddr_uid63_fpSinPiTest_in(78 downto 72);

	--reg_zAddr_uid63_fpSinPiTest_0_to_memoryC5_uid231_sinPiZTableGenerator_0(REG,382)@4
    reg_zAddr_uid63_fpSinPiTest_0_to_memoryC5_uid231_sinPiZTableGenerator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid63_fpSinPiTest_0_to_memoryC5_uid231_sinPiZTableGenerator_0_q <= "0000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_zAddr_uid63_fpSinPiTest_0_to_memoryC5_uid231_sinPiZTableGenerator_0_q <= zAddr_uid63_fpSinPiTest_b;
        END IF;
    END PROCESS;


	--memoryC5_uid231_sinPiZTableGenerator(LOOKUP,230)@5
    memoryC5_uid231_sinPiZTableGenerator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC5_uid231_sinPiZTableGenerator_q <= "11111111101000001";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (reg_zAddr_uid63_fpSinPiTest_0_to_memoryC5_uid231_sinPiZTableGenerator_0_q) IS
                WHEN "0000000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11111111101000001";
                WHEN "0000001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11111110101101000";
                WHEN "0000010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11111101101011101";
                WHEN "0000011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11111100110001110";
                WHEN "0000100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11111100000000010";
                WHEN "0000101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11111011000000000";
                WHEN "0000110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11111010001101101";
                WHEN "0000111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11111001010010111";
                WHEN "0001000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11111000010110010";
                WHEN "0001001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11110111100010100";
                WHEN "0001010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11110110100011111";
                WHEN "0001011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11110101100101101";
                WHEN "0001100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11110100101101011";
                WHEN "0001101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11110011111011101";
                WHEN "0001110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11110010111001010";
                WHEN "0001111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11110010001011011";
                WHEN "0010000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11110001010101011";
                WHEN "0010001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11110000011011001";
                WHEN "0010010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11101111011000001";
                WHEN "0010011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11101110101001010";
                WHEN "0010100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11101101110100110";
                WHEN "0010101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11101100111100011";
                WHEN "0010110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11101011111111111";
                WHEN "0010111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11101011001001010";
                WHEN "0011000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11101010010100110";
                WHEN "0011001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11101001010011011";
                WHEN "0011010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11101000100011100";
                WHEN "0011011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11100111101010110";
                WHEN "0011100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11100110110111000";
                WHEN "0011101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11100101111110010";
                WHEN "0011110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11100100111110010";
                WHEN "0011111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11100100001010101";
                WHEN "0100000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11100011011011111";
                WHEN "0100001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11100010011110111";
                WHEN "0100010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11100001110001010";
                WHEN "0100011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11100000111000100";
                WHEN "0100100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11011111111110101";
                WHEN "0100101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11011111001010110";
                WHEN "0100110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11011110011000111";
                WHEN "0100111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11011101101000000";
                WHEN "0101000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11011100110000011";
                WHEN "0101001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11011011111111001";
                WHEN "0101010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11011011000100110";
                WHEN "0101011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11011010010101100";
                WHEN "0101100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11011001100010010";
                WHEN "0101101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11011000101010111";
                WHEN "0101110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11010111111101010";
                WHEN "0101111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11010111001010000";
                WHEN "0110000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11010110011010011";
                WHEN "0110001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11010101100101011";
                WHEN "0110010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11010100110111110";
                WHEN "0110011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11010011111111000";
                WHEN "0110100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11010011010110010";
                WHEN "0110101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11010010101001110";
                WHEN "0110110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11010001110010011";
                WHEN "0110111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11010001000111011";
                WHEN "0111000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11010000001111011";
                WHEN "0111001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11001111011111110";
                WHEN "0111010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11001110111001010";
                WHEN "0111011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11001110001110111";
                WHEN "0111100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11001101011000100";
                WHEN "0111101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11001100101010010";
                WHEN "0111110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11001100000011111";
                WHEN "0111111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11001011010001010";
                WHEN "1000000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11001010100111110";
                WHEN "1000001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11001001110110010";
                WHEN "1000010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11001001010111000";
                WHEN "1000011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11001000100111111";
                WHEN "1000100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11000111111001100";
                WHEN "1000101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11000111010001001";
                WHEN "1000110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11000110101010110";
                WHEN "1000111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11000110000011101";
                WHEN "1001000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11000101001110100";
                WHEN "1001001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11000100101111001";
                WHEN "1001010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11000011111111010";
                WHEN "1001011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11000011011110110";
                WHEN "1001100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11000010110001100";
                WHEN "1001101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11000010001001000";
                WHEN "1001110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11000001101111001";
                WHEN "1001111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11000001000000111";
                WHEN "1010000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "11000000010111001";
                WHEN "1010001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111111110110110";
                WHEN "1010010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111111001111111";
                WHEN "1010011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111110110010100";
                WHEN "1010100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111110001011000";
                WHEN "1010101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111101100010111";
                WHEN "1010110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111101000010010";
                WHEN "1010111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111100100010000";
                WHEN "1011000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111100000111100";
                WHEN "1011001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111011011111111";
                WHEN "1011010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111010111100000";
                WHEN "1011011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111010011110100";
                WHEN "1011100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111010000011100";
                WHEN "1011101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111001011011110";
                WHEN "1011110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111000111111101";
                WHEN "1011111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111000100101011";
                WHEN "1100000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10111000001100100";
                WHEN "1100001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110111101101110";
                WHEN "1100010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110111010011000";
                WHEN "1100011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110110110110000";
                WHEN "1100100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110110010011010";
                WHEN "1100101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110110000011110";
                WHEN "1100110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110101100101100";
                WHEN "1100111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110101000101110";
                WHEN "1101000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110100110100000";
                WHEN "1101001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110100100010001";
                WHEN "1101010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110100001000000";
                WHEN "1101011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110011101101110";
                WHEN "1101100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110011011011111";
                WHEN "1101101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110010111000100";
                WHEN "1101110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110010101110011";
                WHEN "1101111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110010001111100";
                WHEN "1110000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110010000001111";
                WHEN "1110001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110001110011001";
                WHEN "1110010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110001010100010";
                WHEN "1110011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110000111111000";
                WHEN "1110100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110000101110110";
                WHEN "1110101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110000101000100";
                WHEN "1110110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10110000010100010";
                WHEN "1110111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10101111111110011";
                WHEN "1111000" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10101111110010000";
                WHEN "1111001" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10101111100110111";
                WHEN "1111010" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10101111010111000";
                WHEN "1111011" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10101111000101000";
                WHEN "1111100" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10101110110110100";
                WHEN "1111101" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10101110101011010";
                WHEN "1111110" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10101110100000011";
                WHEN "1111111" =>  memoryC5_uid231_sinPiZTableGenerator_q <= "10101110010001011";
                WHEN OTHERS =>
                    memoryC5_uid231_sinPiZTableGenerator_q <= "11111111101000001";
            END CASE;
        END IF;
    END PROCESS;


	--ld_z_uid49_fpSinPiTest_q_to_zPPolyEval_uid64_fpSinPiTest_a(DELAY,485)@4
    ld_z_uid49_fpSinPiTest_q_to_zPPolyEval_uid64_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 79, depth => 1 )
    PORT MAP ( xin => z_uid49_fpSinPiTest_q, xout => ld_z_uid49_fpSinPiTest_q_to_zPPolyEval_uid64_fpSinPiTest_a_q, clk => clk, aclr => areset );

	--zPPolyEval_uid64_fpSinPiTest(BITSELECT,63)@5
    zPPolyEval_uid64_fpSinPiTest_in <= ld_z_uid49_fpSinPiTest_q_to_zPPolyEval_uid64_fpSinPiTest_a_q(71 downto 0);
    zPPolyEval_uid64_fpSinPiTest_b <= zPPolyEval_uid64_fpSinPiTest_in(71 downto 27);

	--yT1_uid232_sinPiZPolyEval(BITSELECT,231)@5
    yT1_uid232_sinPiZPolyEval_in <= zPPolyEval_uid64_fpSinPiTest_b;
    yT1_uid232_sinPiZPolyEval_b <= yT1_uid232_sinPiZPolyEval_in(44 downto 28);

	--reg_yT1_uid232_sinPiZPolyEval_0_to_prodXY_uid263_pT1_uid233_sinPiZPolyEval_0(REG,383)@5
    reg_yT1_uid232_sinPiZPolyEval_0_to_prodXY_uid263_pT1_uid233_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid232_sinPiZPolyEval_0_to_prodXY_uid263_pT1_uid233_sinPiZPolyEval_0_q <= "00000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_yT1_uid232_sinPiZPolyEval_0_to_prodXY_uid263_pT1_uid233_sinPiZPolyEval_0_q <= yT1_uid232_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--prodXY_uid263_pT1_uid233_sinPiZPolyEval(MULT,262)@6
    prodXY_uid263_pT1_uid233_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid263_pT1_uid233_sinPiZPolyEval_a),18)) * SIGNED(prodXY_uid263_pT1_uid233_sinPiZPolyEval_b);
    prodXY_uid263_pT1_uid233_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid263_pT1_uid233_sinPiZPolyEval_a <= (others => '0');
            prodXY_uid263_pT1_uid233_sinPiZPolyEval_b <= (others => '0');
            prodXY_uid263_pT1_uid233_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            prodXY_uid263_pT1_uid233_sinPiZPolyEval_a <= reg_yT1_uid232_sinPiZPolyEval_0_to_prodXY_uid263_pT1_uid233_sinPiZPolyEval_0_q;
            prodXY_uid263_pT1_uid233_sinPiZPolyEval_b <= memoryC5_uid231_sinPiZTableGenerator_q;
            prodXY_uid263_pT1_uid233_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid263_pT1_uid233_sinPiZPolyEval_pr,34));
        END IF;
    END PROCESS;
    prodXY_uid263_pT1_uid233_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid263_pT1_uid233_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            prodXY_uid263_pT1_uid233_sinPiZPolyEval_q <= prodXY_uid263_pT1_uid233_sinPiZPolyEval_s1;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid264_pT1_uid233_sinPiZPolyEval(BITSELECT,263)@9
    prodXYTruncFR_uid264_pT1_uid233_sinPiZPolyEval_in <= prodXY_uid263_pT1_uid233_sinPiZPolyEval_q;
    prodXYTruncFR_uid264_pT1_uid233_sinPiZPolyEval_b <= prodXYTruncFR_uid264_pT1_uid233_sinPiZPolyEval_in(33 downto 16);

	--highBBits_uid235_sinPiZPolyEval(BITSELECT,234)@9
    highBBits_uid235_sinPiZPolyEval_in <= prodXYTruncFR_uid264_pT1_uid233_sinPiZPolyEval_b;
    highBBits_uid235_sinPiZPolyEval_b <= highBBits_uid235_sinPiZPolyEval_in(17 downto 1);

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC4_uid230_sinPiZTableGenerator_0_a(DELAY,853)@4
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC4_uid230_sinPiZTableGenerator_0_a : dspba_delay
    GENERIC MAP ( width => 7, depth => 3 )
    PORT MAP ( xin => zAddr_uid63_fpSinPiTest_b, xout => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC4_uid230_sinPiZTableGenerator_0_a_q, clk => clk, aclr => areset );

	--reg_zAddr_uid63_fpSinPiTest_0_to_memoryC4_uid230_sinPiZTableGenerator_0(REG,384)@7
    reg_zAddr_uid63_fpSinPiTest_0_to_memoryC4_uid230_sinPiZTableGenerator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid63_fpSinPiTest_0_to_memoryC4_uid230_sinPiZTableGenerator_0_q <= "0000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_zAddr_uid63_fpSinPiTest_0_to_memoryC4_uid230_sinPiZTableGenerator_0_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC4_uid230_sinPiZTableGenerator_0_a_q;
        END IF;
    END PROCESS;


	--memoryC4_uid230_sinPiZTableGenerator(LOOKUP,229)@8
    memoryC4_uid230_sinPiZTableGenerator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC4_uid230_sinPiZTableGenerator_q <= "01010001100110110001011110";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (reg_zAddr_uid63_fpSinPiTest_0_to_memoryC4_uid230_sinPiZTableGenerator_0_q) IS
                WHEN "0000000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010001100110110001011110";
                WHEN "0000001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010001100110011111111100";
                WHEN "0000010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010001100101101100110011";
                WHEN "0000011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010001100100010011000101";
                WHEN "0000100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010001100010010010010110";
                WHEN "0000101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010001011111110011000100";
                WHEN "0000110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010001011100101011001100";
                WHEN "0000111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010001011001000001111000";
                WHEN "0001000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010001010100110101100100";
                WHEN "0001001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010001010000000010110001";
                WHEN "0001010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010001001010101111100100";
                WHEN "0001011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010001000100111000100010";
                WHEN "0001100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010000111110011011110101";
                WHEN "0001101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010000110111011001010101";
                WHEN "0001110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010000101111111000110001";
                WHEN "0001111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010000100111101101111110";
                WHEN "0010000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010000011111000010010110";
                WHEN "0010001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010000010101110100101111";
                WHEN "0010010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010000001100000110110101";
                WHEN "0010011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01010000000001101111000000";
                WHEN "0010100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001111110110110101110011";
                WHEN "0010101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001111101011011010111001";
                WHEN "0010110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001111011111011110000110";
                WHEN "0010111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001111010010111100110100";
                WHEN "0011000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001111000101110111111001";
                WHEN "0011001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001110111000010100011101";
                WHEN "0011010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001110101010001000110011";
                WHEN "0011011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001110011011011101100111";
                WHEN "0011100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001110001100001110001111";
                WHEN "0011101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001101111100011110001010";
                WHEN "0011110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001101101100001110100101";
                WHEN "0011111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001101011011011000110110";
                WHEN "0100000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001101001001111111101110";
                WHEN "0100001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001100111000001001001111";
                WHEN "0100010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001100100101101100011001";
                WHEN "0100011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001100010010110001110000";
                WHEN "0100100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001011111111010101110110";
                WHEN "0100101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001011101011010111000111";
                WHEN "0100110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001011010110110110011110";
                WHEN "0100111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001011000001110100011110";
                WHEN "0101000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001010101100010100010011";
                WHEN "0101001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001010010110010001000111";
                WHEN "0101010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001001111111110001000100";
                WHEN "0101011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001001101000101100110110";
                WHEN "0101100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001001010001001001111011";
                WHEN "0101101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001000111001001000001110";
                WHEN "0101110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001000100000100011110110";
                WHEN "0101111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01001000000111100001111001";
                WHEN "0110000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000111101101111111011111";
                WHEN "0110001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000111010011111111100110";
                WHEN "0110010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000110111001011110100100";
                WHEN "0110011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000110011110100010000111";
                WHEN "0110100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000110000011000010001001";
                WHEN "0110101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000101100111000101000011";
                WHEN "0110110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000101001010101101011111";
                WHEN "0110111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000100101101110011101110";
                WHEN "0111000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000100010000100000111110";
                WHEN "0111001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000011110010101101110100";
                WHEN "0111010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000011010100011010011110";
                WHEN "0111011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000010110101101011010111";
                WHEN "0111100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000010010110100011011101";
                WHEN "0111101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000001110110111100001001";
                WHEN "0111110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000001010110110110010000";
                WHEN "0111111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000000110110011000001101";
                WHEN "1000000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "01000000010101011011011001";
                WHEN "1000001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00111111110100000101110010";
                WHEN "1000010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00111111010010001110101001";
                WHEN "1000011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00111110110000000001101011";
                WHEN "1000100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00111110001101011001110011";
                WHEN "1000101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00111101101010010101011101";
                WHEN "1000110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00111101000110110101111111";
                WHEN "1000111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00111100100010111100111100";
                WHEN "1001000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00111011111110101110100100";
                WHEN "1001001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00111011011001111111110100";
                WHEN "1001010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00111010110100111101000111";
                WHEN "1001011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00111010001111011100101001";
                WHEN "1001100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00111001101001100111100001";
                WHEN "1001101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00111001000011011000101011";
                WHEN "1001110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00111000011100101100110010";
                WHEN "1001111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00110111110101110000000011";
                WHEN "1010000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00110111001110011001111101";
                WHEN "1010001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00110110100110101001110001";
                WHEN "1010010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00110101111110100101001011";
                WHEN "1010011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00110101010110000110010110";
                WHEN "1010100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00110100101101010100111010";
                WHEN "1010101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00110100000100001101101101";
                WHEN "1010110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00110011011010101110011000";
                WHEN "1010111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00110010110000111001010011";
                WHEN "1011000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00110010000110101101010010";
                WHEN "1011001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00110001011100010001000010";
                WHEN "1011010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00110000110001011111001110";
                WHEN "1011011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00110000000110010110110100";
                WHEN "1011100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00101111011010111010001000";
                WHEN "1011101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00101110101111001110001011";
                WHEN "1011110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00101110000011001011001100";
                WHEN "1011111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00101101010110110100111111";
                WHEN "1100000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00101100101010001011011001";
                WHEN "1100001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00101011111101010010000000";
                WHEN "1100010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00101011010000000101001000";
                WHEN "1100011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00101010100010100111110111";
                WHEN "1100100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00101001110100111011010110";
                WHEN "1100101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00101001000110110111101100";
                WHEN "1100110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00101000011000101000001000";
                WHEN "1100111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00100111101010001001010101";
                WHEN "1101000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00100110111011010110000011";
                WHEN "1101001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00100110001100010011011010";
                WHEN "1101010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00100101011101000100011001";
                WHEN "1101011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00100100101101100110100111";
                WHEN "1101100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00100011111101110111111010";
                WHEN "1101101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00100011001110000000101100";
                WHEN "1101110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00100010011101110011110101";
                WHEN "1101111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00100001101101100000010000";
                WHEN "1110000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00100000111100111010001011";
                WHEN "1110001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00100000001100000111111010";
                WHEN "1110010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00011111011011001110101000";
                WHEN "1110011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00011110101010000110010111";
                WHEN "1110100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00011101111000110001000001";
                WHEN "1110101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00011101000111001101001001";
                WHEN "1110110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00011100010101100011001010";
                WHEN "1110111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00011011100011101111010110";
                WHEN "1111000" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00011010110001101110011110";
                WHEN "1111001" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00011001111111100011010111";
                WHEN "1111010" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00011001001101010000100101";
                WHEN "1111011" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00011000011010110101101110";
                WHEN "1111100" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00010111101000010001000000";
                WHEN "1111101" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00010110110101100011000101";
                WHEN "1111110" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00010110000010101101010111";
                WHEN "1111111" =>  memoryC4_uid230_sinPiZTableGenerator_q <= "00010101001111110001011010";
                WHEN OTHERS =>
                    memoryC4_uid230_sinPiZTableGenerator_q <= "01010001100110110001011110";
            END CASE;
        END IF;
    END PROCESS;


	--sumAHighB_uid236_sinPiZPolyEval(ADD,235)@9
    sumAHighB_uid236_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((26 downto 26 => memoryC4_uid230_sinPiZTableGenerator_q(25)) & memoryC4_uid230_sinPiZTableGenerator_q);
    sumAHighB_uid236_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((26 downto 17 => highBBits_uid235_sinPiZPolyEval_b(16)) & highBBits_uid235_sinPiZPolyEval_b);
            sumAHighB_uid236_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid236_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid236_sinPiZPolyEval_b));
    sumAHighB_uid236_sinPiZPolyEval_q <= sumAHighB_uid236_sinPiZPolyEval_o(26 downto 0);


	--lowRangeB_uid234_sinPiZPolyEval(BITSELECT,233)@9
    lowRangeB_uid234_sinPiZPolyEval_in <= prodXYTruncFR_uid264_pT1_uid233_sinPiZPolyEval_b(0 downto 0);
    lowRangeB_uid234_sinPiZPolyEval_b <= lowRangeB_uid234_sinPiZPolyEval_in(0 downto 0);

	--s1_uid234_uid237_sinPiZPolyEval(BITJOIN,236)@9
    s1_uid234_uid237_sinPiZPolyEval_q <= sumAHighB_uid236_sinPiZPolyEval_q & lowRangeB_uid234_sinPiZPolyEval_b;

	--reg_s1_uid234_uid237_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_1(REG,385)@9
    reg_s1_uid234_uid237_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid234_uid237_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_1_q <= "0000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_s1_uid234_uid237_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_1_q <= s1_uid234_uid237_sinPiZPolyEval_q;
        END IF;
    END PROCESS;


	--ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_nor(LOGICAL,1179)
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_nor_b <= ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_sticky_ena_q;
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_nor_q <= not (ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_nor_a or ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_nor_b);

	--ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_cmpReg(REG,1177)
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_cmpReg_q <= VCC_q;
        END IF;
    END PROCESS;


	--ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_sticky_ena(REG,1180)
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_nor_q = "1") THEN
                ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_sticky_ena_q <= ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_enaAnd(LOGICAL,1181)
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_enaAnd_a <= ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_sticky_ena_q;
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_enaAnd_b <= VCC_q;
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_enaAnd_q <= ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_enaAnd_a and ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_enaAnd_b;

	--yT2_uid238_sinPiZPolyEval(BITSELECT,237)@5
    yT2_uid238_sinPiZPolyEval_in <= zPPolyEval_uid64_fpSinPiTest_b;
    yT2_uid238_sinPiZPolyEval_b <= yT2_uid238_sinPiZPolyEval_in(44 downto 19);

	--ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdcnt(COUNTER,1173)
    -- every=1, low=0, high=1, step=1, init=1
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
                ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdcnt_i <= ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdcnt_i + 1;
        END IF;
    END PROCESS;
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdcnt_i,1));


	--ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdreg(REG,1174)
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdreg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdreg_q <= ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdmux(MUX,1175)
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdmux_s <= VCC_q;
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdmux: PROCESS (ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdmux_s, ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdreg_q, ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdmux_q <= ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdreg_q;
                  WHEN "1" => ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdmux_q <= ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem(DUALMEM,1172)
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_reset0 <= areset;
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_ia <= yT2_uid238_sinPiZPolyEval_b;
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_aa <= ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdreg_q;
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_ab <= ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_rdmux_q;
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_dmem : altsyncram
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
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_iq,
        address_a => ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_aa,
        data_a => ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_ia
    );
        ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_q <= ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_iq(25 downto 0);

	--ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_outputreg(DELAY,1171)
    ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_outputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_replace_mem_q, xout => ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_outputreg_q, clk => clk, aclr => areset );

	--reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0(REG,386)@9
    reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_q <= "00000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_q <= ld_yT2_uid238_sinPiZPolyEval_b_to_reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_a_outputreg_q;
        END IF;
    END PROCESS;


	--prodXY_uid266_pT2_uid239_sinPiZPolyEval(MULT,265)@10
    prodXY_uid266_pT2_uid239_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid266_pT2_uid239_sinPiZPolyEval_a),27)) * SIGNED(prodXY_uid266_pT2_uid239_sinPiZPolyEval_b);
    prodXY_uid266_pT2_uid239_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid266_pT2_uid239_sinPiZPolyEval_a <= (others => '0');
            prodXY_uid266_pT2_uid239_sinPiZPolyEval_b <= (others => '0');
            prodXY_uid266_pT2_uid239_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            prodXY_uid266_pT2_uid239_sinPiZPolyEval_a <= reg_yT2_uid238_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_0_q;
            prodXY_uid266_pT2_uid239_sinPiZPolyEval_b <= reg_s1_uid234_uid237_sinPiZPolyEval_0_to_prodXY_uid266_pT2_uid239_sinPiZPolyEval_1_q;
            prodXY_uid266_pT2_uid239_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid266_pT2_uid239_sinPiZPolyEval_pr,54));
        END IF;
    END PROCESS;
    prodXY_uid266_pT2_uid239_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid266_pT2_uid239_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            prodXY_uid266_pT2_uid239_sinPiZPolyEval_q <= prodXY_uid266_pT2_uid239_sinPiZPolyEval_s1;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid267_pT2_uid239_sinPiZPolyEval(BITSELECT,266)@13
    prodXYTruncFR_uid267_pT2_uid239_sinPiZPolyEval_in <= prodXY_uid266_pT2_uid239_sinPiZPolyEval_q;
    prodXYTruncFR_uid267_pT2_uid239_sinPiZPolyEval_b <= prodXYTruncFR_uid267_pT2_uid239_sinPiZPolyEval_in(53 downto 25);

	--highBBits_uid241_sinPiZPolyEval(BITSELECT,240)@13
    highBBits_uid241_sinPiZPolyEval_in <= prodXYTruncFR_uid267_pT2_uid239_sinPiZPolyEval_b;
    highBBits_uid241_sinPiZPolyEval_b <= highBBits_uid241_sinPiZPolyEval_in(28 downto 1);

	--reg_highBBits_uid241_sinPiZPolyEval_0_to_sumAHighB_uid242_sinPiZPolyEval_1(REG,388)@13
    reg_highBBits_uid241_sinPiZPolyEval_0_to_sumAHighB_uid242_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_highBBits_uid241_sinPiZPolyEval_0_to_sumAHighB_uid242_sinPiZPolyEval_1_q <= "0000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_highBBits_uid241_sinPiZPolyEval_0_to_sumAHighB_uid242_sinPiZPolyEval_1_q <= highBBits_uid241_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_nor(LOGICAL,1192)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_nor_b <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_sticky_ena_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_nor_q <= not (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_nor_a or ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_nor_b);

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_mem_top(CONSTANT,1188)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_mem_top_q <= "0101";

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmp(LOGICAL,1189)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmp_a <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_mem_top_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdmux_q);
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmp_q <= "1" when ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmp_a = ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmp_b else "0";

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmpReg(REG,1190)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmpReg_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmp_q;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_sticky_ena(REG,1193)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_nor_q = "1") THEN
                ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_sticky_ena_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_enaAnd(LOGICAL,1194)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_enaAnd_a <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_sticky_ena_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_enaAnd_b <= VCC_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_enaAnd_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_enaAnd_a and ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_enaAnd_b;

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt(COUNTER,1184)
    -- every=1, low=0, high=5, step=1, init=1
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_i = 4 THEN
                  ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_eq <= '1';
                ELSE
                  ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_eq = '1') THEN
                    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_i <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_i - 5;
                ELSE
                    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_i <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_i,3));


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdreg(REG,1185)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdreg_q <= "000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdreg_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdmux(MUX,1186)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdmux_s <= VCC_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdmux: PROCESS (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdmux_s, ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdreg_q, ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdmux_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdreg_q;
                  WHEN "1" => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdmux_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem(DUALMEM,1183)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_reset0 <= areset;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_ia <= zAddr_uid63_fpSinPiTest_b;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_aa <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdreg_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_ab <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_rdmux_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 7,
        widthad_b => 3,
        numwords_b => 6,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_iq,
        address_a => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_aa,
        data_a => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_ia
    );
        ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_iq(6 downto 0);

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_outputreg(DELAY,1182)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_outputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_replace_mem_q, xout => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_outputreg_q, clk => clk, aclr => areset );

	--reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0(REG,387)@12
    reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_q <= "0000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_a_outputreg_q;
        END IF;
    END PROCESS;


	--memoryC3_uid229_sinPiZTableGenerator(LOOKUP,228)@13
    memoryC3_uid229_sinPiZTableGenerator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC3_uid229_sinPiZTableGenerator_q <= "11111111111111111111111111111001011";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (reg_zAddr_uid63_fpSinPiTest_0_to_memoryC3_uid229_sinPiZTableGenerator_0_q) IS
                WHEN "0000000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "11111111111111111111111111111001011";
                WHEN "0000001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00000001010001100110101000111010101";
                WHEN "0000010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00000010100011001100101101010110011";
                WHEN "0000011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00000011110100110001101010100011011";
                WHEN "0000100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00000101000110010100111100101110011";
                WHEN "0000101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00000110010111110101111101101101000";
                WHEN "0000110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00000111101001010100001100001001101";
                WHEN "0000111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00001000111010101111000010100001000";
                WHEN "0001000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00001010001100000101111101001011010";
                WHEN "0001001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00001011011101011000011001000111110";
                WHEN "0001010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00001100101110100101110001001110101";
                WHEN "0001011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00001101111111101101100010100000001";
                WHEN "0001100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00001111010000101111001001101010110";
                WHEN "0001101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00010000100001101010000011000110101";
                WHEN "0001110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00010001110010011101101001010101000";
                WHEN "0001111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00010011000011001001011011101011111";
                WHEN "0010000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00010100010011101100110100011101011";
                WHEN "0010001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00010101100100000111010000011110001";
                WHEN "0010010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00010110110100011000001011111010110";
                WHEN "0010011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00011000000100011111000101110110101";
                WHEN "0010100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00011001010100011011011001000001011";
                WHEN "0010101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00011010100100001100100010010100101";
                WHEN "0010110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00011011110011110001111110110101010";
                WHEN "0010111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00011101000011001011001100000011011";
                WHEN "0011000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00011110010010010111100111000010100";
                WHEN "0011001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00011111100001010110101011110000110";
                WHEN "0011010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00100000110000000111111001110100010";
                WHEN "0011011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00100001111110101010101100100101101";
                WHEN "0011100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00100011001100111110100010110001111";
                WHEN "0011101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00100100011011000010111001001011111";
                WHEN "0011110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00100101101000110111001101001101001";
                WHEN "0011111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00100110110110011010111110011001100";
                WHEN "0100000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00101000000011101101101010000100110";
                WHEN "0100001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00101001010000101110101101000010110";
                WHEN "0100010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00101010011101011101100111100100100";
                WHEN "0100011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00101011101001111001110110000110010";
                WHEN "0100100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00101100110110000010111000000110011";
                WHEN "0100101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00101110000001111000001100011110100";
                WHEN "0100110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00101111001101011001010010000000001";
                WHEN "0100111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00110000011000100101100111100001110";
                WHEN "0101000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00110001100011011100101011010100101";
                WHEN "0101001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00110010101101111101111110000010101";
                WHEN "0101010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00110011111000001000111101011101100";
                WHEN "0101011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00110101000001111101001011001100010";
                WHEN "0101100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00110110001011011010000101101010010";
                WHEN "0101101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00110111010100011111001100111101100";
                WHEN "0101110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00111000011101001100000010000100010";
                WHEN "0101111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00111001100101100000000100001010000";
                WHEN "0110000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00111010101101011010110100011101100";
                WHEN "0110001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00111011110100111011110011000011110";
                WHEN "0110010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00111100111100000010100001101010000";
                WHEN "0110011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00111110000010101110100000001010000";
                WHEN "0110100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "00111111001000111111010001101010001";
                WHEN "0110101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01000000001110110100010110001111010";
                WHEN "0110110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01000001010100001101001110111110101";
                WHEN "0110111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01000010011001001001011111110000001";
                WHEN "0111000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01000011011101101000101000010101111";
                WHEN "0111001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01000100100001101010001101000100100";
                WHEN "0111010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01000101100101001101110000011010101";
                WHEN "0111011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01000110101000010010110100001011010";
                WHEN "0111100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01000111101010111000111010101011110";
                WHEN "0111101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01001000101100111111101000110111000";
                WHEN "0111110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01001001101110100110100001111001100";
                WHEN "0111111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01001010101111101101001000001001010";
                WHEN "1000000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01001011110000010011000001001000011";
                WHEN "1000001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01001100110000010111101111101010011";
                WHEN "1000010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01001101101111111010111010011001111";
                WHEN "1000011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01001110101110111100000011010000110";
                WHEN "1000100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01001111101101011010110000011010010";
                WHEN "1000101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01010000101011010110100111100000101";
                WHEN "1000110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01010001101000101111001101110100011";
                WHEN "1000111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01010010100101100100001000101010010";
                WHEN "1001000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01010011100001110100111101001010100";
                WHEN "1001001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01010100011101100001010100001011100";
                WHEN "1001010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01010101011000101000110001011100100";
                WHEN "1001011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01010110010011001010111110000100100";
                WHEN "1001100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01010111001101000111011111001000111";
                WHEN "1001101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01011000000110011101111101001011111";
                WHEN "1001110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01011000111111001110000000110011110";
                WHEN "1001111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01011001110111010111001110111111110";
                WHEN "1010000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01011010101110111001010010001110110";
                WHEN "1010001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01011011100101110011110011000111101";
                WHEN "1010010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01011100011100000110011001001001001";
                WHEN "1010011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01011101010001110000101111000101100";
                WHEN "1010100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01011110000110110010011100011000111";
                WHEN "1010101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01011110111011001011001011101010011";
                WHEN "1010110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01011111101110111010100111100011100";
                WHEN "1010111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01100000100010000000011001111101101";
                WHEN "1011000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01100001010100011100001101110011100";
                WHEN "1011001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01100010000110001101101100011100011";
                WHEN "1011010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01100010110111010100100010100000100";
                WHEN "1011011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01100011100111110000011100000001010";
                WHEN "1011100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01100100010111100001000100001101001";
                WHEN "1011101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01100101000110100110000110001111011";
                WHEN "1011110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01100101110100111111010000100111001";
                WHEN "1011111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01100110100010101100001111010001101";
                WHEN "1100000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01100111001111101100101111101110000";
                WHEN "1100001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01100111111100000000011110011100101";
                WHEN "1100010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01101000100111100111001010011110100";
                WHEN "1100011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01101001010010100000100001001001101";
                WHEN "1100100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01101001111100101100010000111001000";
                WHEN "1100101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01101010100110001010001010100001101";
                WHEN "1100110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01101011001110111001111010101110101";
                WHEN "1100111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01101011110110111011010001101111010";
                WHEN "1101000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01101100011110001110000000111001111";
                WHEN "1101001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01101101000100110001110111010010001";
                WHEN "1101010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01101101101010100110100100110101101";
                WHEN "1101011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01101110001111101011111011001010101";
                WHEN "1101100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01101110110100000001101100000100000";
                WHEN "1101101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01101111010111100111100111010111000";
                WHEN "1101110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01101111111010011101100010000110110";
                WHEN "1101111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110000011100100011001011010100000";
                WHEN "1110000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110000111101111000011000011110011";
                WHEN "1110001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110001011110011100111011010000000";
                WHEN "1110010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110001111110010000100101111100001";
                WHEN "1110011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110010011101010011001110010000111";
                WHEN "1110100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110010111011100100100111111111001";
                WHEN "1110101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110011011001000100101000000101011";
                WHEN "1110110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110011110101110011000001011101010";
                WHEN "1110111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110100010001101111101010010100010";
                WHEN "1111000" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110100101100111010011001000110011";
                WHEN "1111001" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110101000111010011000011010000011";
                WHEN "1111010" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110101100000111001011110100010010";
                WHEN "1111011" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110101111001101101100001110011100";
                WHEN "1111100" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110110010001101111000100101110110";
                WHEN "1111101" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110110101000111101111110101001010";
                WHEN "1111110" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110110111111011010000111000110000";
                WHEN "1111111" =>  memoryC3_uid229_sinPiZTableGenerator_q <= "01110111010101000011010110000100000";
                WHEN OTHERS =>
                    memoryC3_uid229_sinPiZTableGenerator_q <= "11111111111111111111111111111001011";
            END CASE;
        END IF;
    END PROCESS;


	--sumAHighB_uid242_sinPiZPolyEval(ADD,241)@14
    sumAHighB_uid242_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((35 downto 35 => memoryC3_uid229_sinPiZTableGenerator_q(34)) & memoryC3_uid229_sinPiZTableGenerator_q);
    sumAHighB_uid242_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((35 downto 28 => reg_highBBits_uid241_sinPiZPolyEval_0_to_sumAHighB_uid242_sinPiZPolyEval_1_q(27)) & reg_highBBits_uid241_sinPiZPolyEval_0_to_sumAHighB_uid242_sinPiZPolyEval_1_q);
            sumAHighB_uid242_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid242_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid242_sinPiZPolyEval_b));
    sumAHighB_uid242_sinPiZPolyEval_q <= sumAHighB_uid242_sinPiZPolyEval_o(35 downto 0);


	--lowRangeB_uid240_sinPiZPolyEval(BITSELECT,239)@13
    lowRangeB_uid240_sinPiZPolyEval_in <= prodXYTruncFR_uid267_pT2_uid239_sinPiZPolyEval_b(0 downto 0);
    lowRangeB_uid240_sinPiZPolyEval_b <= lowRangeB_uid240_sinPiZPolyEval_in(0 downto 0);

	--ld_lowRangeB_uid240_sinPiZPolyEval_b_to_s2_uid240_uid243_sinPiZPolyEval_a(DELAY,686)@13
    ld_lowRangeB_uid240_sinPiZPolyEval_b_to_s2_uid240_uid243_sinPiZPolyEval_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => lowRangeB_uid240_sinPiZPolyEval_b, xout => ld_lowRangeB_uid240_sinPiZPolyEval_b_to_s2_uid240_uid243_sinPiZPolyEval_a_q, clk => clk, aclr => areset );

	--s2_uid240_uid243_sinPiZPolyEval(BITJOIN,242)@14
    s2_uid240_uid243_sinPiZPolyEval_q <= sumAHighB_uid242_sinPiZPolyEval_q & ld_lowRangeB_uid240_sinPiZPolyEval_b_to_s2_uid240_uid243_sinPiZPolyEval_a_q;

	--yTop18Bits_uid275_pT3_uid245_sinPiZPolyEval(BITSELECT,274)@14
    yTop18Bits_uid275_pT3_uid245_sinPiZPolyEval_in <= s2_uid240_uid243_sinPiZPolyEval_q;
    yTop18Bits_uid275_pT3_uid245_sinPiZPolyEval_b <= yTop18Bits_uid275_pT3_uid245_sinPiZPolyEval_in(36 downto 19);

	--reg_yTop18Bits_uid275_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_9(REG,389)@14
    reg_yTop18Bits_uid275_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop18Bits_uid275_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_9_q <= "000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_yTop18Bits_uid275_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_9_q <= yTop18Bits_uid275_pT3_uid245_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_nor(LOGICAL,950)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_nor_b <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_sticky_ena_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_nor_q <= not (ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_nor_a or ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_nor_b);

	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_mem_top(CONSTANT,946)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_mem_top_q <= "0110";

	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmp(LOGICAL,947)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmp_a <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_mem_top_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdmux_q);
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmp_q <= "1" when ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmp_a = ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmp_b else "0";

	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmpReg(REG,948)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmpReg_q <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmp_q;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_sticky_ena(REG,951)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_nor_q = "1") THEN
                ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_sticky_ena_q <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_enaAnd(LOGICAL,952)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_enaAnd_a <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_sticky_ena_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_enaAnd_b <= VCC_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_enaAnd_q <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_enaAnd_a and ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_enaAnd_b;

	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt(COUNTER,942)
    -- every=1, low=0, high=6, step=1, init=1
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_i = 5 THEN
                  ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_eq <= '1';
                ELSE
                  ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_eq = '1') THEN
                    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_i <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_i - 6;
                ELSE
                    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_i <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_i,3));


	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdreg(REG,943)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdreg_q <= "000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdreg_q <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdmux(MUX,944)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdmux_s <= VCC_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdmux: PROCESS (ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdmux_s, ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdreg_q, ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdmux_q <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdmux_q <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem(DUALMEM,1069)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_reset0 <= areset;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_ia <= zPPolyEval_uid64_fpSinPiTest_b;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_aa <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdreg_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_ab <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdmux_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 45,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 45,
        widthad_b => 3,
        numwords_b => 7,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_iq,
        address_a => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_aa,
        data_a => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_ia
    );
        ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_iq(44 downto 0);

	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_outputreg(DELAY,1068)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_outputreg : dspba_delay
    GENERIC MAP ( width => 45, depth => 1 )
    PORT MAP ( xin => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_replace_mem_q, xout => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_outputreg_q, clk => clk, aclr => areset );

	--yT3_uid244_sinPiZPolyEval(BITSELECT,243)@14
    yT3_uid244_sinPiZPolyEval_in <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT3_uid244_sinPiZPolyEval_a_outputreg_q;
    yT3_uid244_sinPiZPolyEval_b <= yT3_uid244_sinPiZPolyEval_in(44 downto 10);

	--xBottomBits_uid274_pT3_uid245_sinPiZPolyEval(BITSELECT,273)@14
    xBottomBits_uid274_pT3_uid245_sinPiZPolyEval_in <= yT3_uid244_sinPiZPolyEval_b(7 downto 0);
    xBottomBits_uid274_pT3_uid245_sinPiZPolyEval_b <= xBottomBits_uid274_pT3_uid245_sinPiZPolyEval_in(7 downto 0);

	--pad_xBottomBits_uid274_uid277_pT3_uid245_sinPiZPolyEval(BITJOIN,276)@14
    pad_xBottomBits_uid274_uid277_pT3_uid245_sinPiZPolyEval_q <= xBottomBits_uid274_pT3_uid245_sinPiZPolyEval_b & STD_LOGIC_VECTOR((8 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_xBottomBits_uid274_uid277_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_7(REG,391)@14
    reg_pad_xBottomBits_uid274_uid277_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_xBottomBits_uid274_uid277_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_7_q <= "00000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_pad_xBottomBits_uid274_uid277_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_7_q <= pad_xBottomBits_uid274_uid277_pT3_uid245_sinPiZPolyEval_q;
        END IF;
    END PROCESS;


	--yBottomBits_uid273_pT3_uid245_sinPiZPolyEval(BITSELECT,272)@14
    yBottomBits_uid273_pT3_uid245_sinPiZPolyEval_in <= s2_uid240_uid243_sinPiZPolyEval_q(9 downto 0);
    yBottomBits_uid273_pT3_uid245_sinPiZPolyEval_b <= yBottomBits_uid273_pT3_uid245_sinPiZPolyEval_in(9 downto 0);

	--spad_yBottomBits_uid273_uid276_pT3_uid245_sinPiZPolyEval(BITJOIN,275)@14
    spad_yBottomBits_uid273_uid276_pT3_uid245_sinPiZPolyEval_q <= GND_q & yBottomBits_uid273_pT3_uid245_sinPiZPolyEval_b;

	--pad_yBottomBits_uid273_uid278_pT3_uid245_sinPiZPolyEval(BITJOIN,277)@14
    pad_yBottomBits_uid273_uid278_pT3_uid245_sinPiZPolyEval_q <= spad_yBottomBits_uid273_uid276_pT3_uid245_sinPiZPolyEval_q & STD_LOGIC_VECTOR((6 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_yBottomBits_uid273_uid278_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_6(REG,390)@14
    reg_pad_yBottomBits_uid273_uid278_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_yBottomBits_uid273_uid278_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_6_q <= "000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_pad_yBottomBits_uid273_uid278_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_6_q <= pad_yBottomBits_uid273_uid278_pT3_uid245_sinPiZPolyEval_q;
        END IF;
    END PROCESS;


	--xTop18Bits_uid272_pT3_uid245_sinPiZPolyEval(BITSELECT,271)@14
    xTop18Bits_uid272_pT3_uid245_sinPiZPolyEval_in <= yT3_uid244_sinPiZPolyEval_b;
    xTop18Bits_uid272_pT3_uid245_sinPiZPolyEval_b <= xTop18Bits_uid272_pT3_uid245_sinPiZPolyEval_in(34 downto 17);

	--reg_xTop18Bits_uid272_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_4(REG,392)@14
    reg_xTop18Bits_uid272_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop18Bits_uid272_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_4_q <= "000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_xTop18Bits_uid272_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_4_q <= xTop18Bits_uid272_pT3_uid245_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma(CHAINMULTADD,345)@15
    multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_p(0) <= multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_a(0) * multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_c(0);
    multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_p(1) <= multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_a(1) * multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_c(1);
    multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_w(0) <= RESIZE(multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_p(0),38) + RESIZE(multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_p(1),38);
    multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_x(0) <= multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_w(0);
    multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_y(0) <= multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_x(0);
    multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_a <= (others => (others => '0'));
            multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_c <= (others => (others => '0'));
            multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_a(0) <= SIGNED(RESIZE(UNSIGNED(reg_xTop18Bits_uid272_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_4_q),19));
            multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_a(1) <= SIGNED(RESIZE(UNSIGNED(reg_pad_xBottomBits_uid274_uid277_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_7_q),19));
            multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_c(0) <= SIGNED(RESIZE(SIGNED(reg_pad_yBottomBits_uid273_uid278_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_6_q),18));
            multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_c(1) <= SIGNED(RESIZE(SIGNED(reg_yTop18Bits_uid275_pT3_uid245_sinPiZPolyEval_0_to_multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_9_q),18));
            multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_s(0) <= multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_y(0);
        END IF;
    END PROCESS;
    multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_s(0),37));
    multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_q <= multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_s0;
        END IF;
    END PROCESS;

	--multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval(BITSELECT,279)@18
    multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_in <= multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_cma_q;
    multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_b <= multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_in(36 downto 7);

	--highBBits_uid282_pT3_uid245_sinPiZPolyEval(BITSELECT,281)@18
    highBBits_uid282_pT3_uid245_sinPiZPolyEval_in <= multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_b;
    highBBits_uid282_pT3_uid245_sinPiZPolyEval_b <= highBBits_uid282_pT3_uid245_sinPiZPolyEval_in(29 downto 1);

	--reg_highBBits_uid282_pT3_uid245_sinPiZPolyEval_0_to_sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_1(REG,395)@18
    reg_highBBits_uid282_pT3_uid245_sinPiZPolyEval_0_to_sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_highBBits_uid282_pT3_uid245_sinPiZPolyEval_0_to_sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_1_q <= "00000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_highBBits_uid282_pT3_uid245_sinPiZPolyEval_0_to_sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_1_q <= highBBits_uid282_pT3_uid245_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--yTop27Bits_uid270_pT3_uid245_sinPiZPolyEval(BITSELECT,269)@14
    yTop27Bits_uid270_pT3_uid245_sinPiZPolyEval_in <= s2_uid240_uid243_sinPiZPolyEval_q;
    yTop27Bits_uid270_pT3_uid245_sinPiZPolyEval_b <= yTop27Bits_uid270_pT3_uid245_sinPiZPolyEval_in(36 downto 10);

	--reg_yTop27Bits_uid270_pT3_uid245_sinPiZPolyEval_0_to_topProd_uid271_pT3_uid245_sinPiZPolyEval_1(REG,393)@14
    reg_yTop27Bits_uid270_pT3_uid245_sinPiZPolyEval_0_to_topProd_uid271_pT3_uid245_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid270_pT3_uid245_sinPiZPolyEval_0_to_topProd_uid271_pT3_uid245_sinPiZPolyEval_1_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_yTop27Bits_uid270_pT3_uid245_sinPiZPolyEval_0_to_topProd_uid271_pT3_uid245_sinPiZPolyEval_1_q <= yTop27Bits_uid270_pT3_uid245_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--xTop27Bits_uid269_pT3_uid245_sinPiZPolyEval(BITSELECT,268)@14
    xTop27Bits_uid269_pT3_uid245_sinPiZPolyEval_in <= yT3_uid244_sinPiZPolyEval_b;
    xTop27Bits_uid269_pT3_uid245_sinPiZPolyEval_b <= xTop27Bits_uid269_pT3_uid245_sinPiZPolyEval_in(34 downto 8);

	--reg_xTop27Bits_uid269_pT3_uid245_sinPiZPolyEval_0_to_topProd_uid271_pT3_uid245_sinPiZPolyEval_0(REG,394)@14
    reg_xTop27Bits_uid269_pT3_uid245_sinPiZPolyEval_0_to_topProd_uid271_pT3_uid245_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid269_pT3_uid245_sinPiZPolyEval_0_to_topProd_uid271_pT3_uid245_sinPiZPolyEval_0_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_xTop27Bits_uid269_pT3_uid245_sinPiZPolyEval_0_to_topProd_uid271_pT3_uid245_sinPiZPolyEval_0_q <= xTop27Bits_uid269_pT3_uid245_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--topProd_uid271_pT3_uid245_sinPiZPolyEval(MULT,270)@15
    topProd_uid271_pT3_uid245_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(topProd_uid271_pT3_uid245_sinPiZPolyEval_a),28)) * SIGNED(topProd_uid271_pT3_uid245_sinPiZPolyEval_b);
    topProd_uid271_pT3_uid245_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid271_pT3_uid245_sinPiZPolyEval_a <= (others => '0');
            topProd_uid271_pT3_uid245_sinPiZPolyEval_b <= (others => '0');
            topProd_uid271_pT3_uid245_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            topProd_uid271_pT3_uid245_sinPiZPolyEval_a <= reg_xTop27Bits_uid269_pT3_uid245_sinPiZPolyEval_0_to_topProd_uid271_pT3_uid245_sinPiZPolyEval_0_q;
            topProd_uid271_pT3_uid245_sinPiZPolyEval_b <= reg_yTop27Bits_uid270_pT3_uid245_sinPiZPolyEval_0_to_topProd_uid271_pT3_uid245_sinPiZPolyEval_1_q;
            topProd_uid271_pT3_uid245_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid271_pT3_uid245_sinPiZPolyEval_pr,54));
        END IF;
    END PROCESS;
    topProd_uid271_pT3_uid245_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid271_pT3_uid245_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            topProd_uid271_pT3_uid245_sinPiZPolyEval_q <= topProd_uid271_pT3_uid245_sinPiZPolyEval_s1;
        END IF;
    END PROCESS;

	--reg_topProd_uid271_pT3_uid245_sinPiZPolyEval_0_to_sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_0(REG,396)@18
    reg_topProd_uid271_pT3_uid245_sinPiZPolyEval_0_to_sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_topProd_uid271_pT3_uid245_sinPiZPolyEval_0_to_sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_0_q <= "000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_topProd_uid271_pT3_uid245_sinPiZPolyEval_0_to_sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_0_q <= topProd_uid271_pT3_uid245_sinPiZPolyEval_q;
        END IF;
    END PROCESS;


	--sumAHighB_uid283_pT3_uid245_sinPiZPolyEval(ADD,282)@19
    sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((54 downto 54 => reg_topProd_uid271_pT3_uid245_sinPiZPolyEval_0_to_sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_0_q(53)) & reg_topProd_uid271_pT3_uid245_sinPiZPolyEval_0_to_sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_0_q);
    sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((54 downto 29 => reg_highBBits_uid282_pT3_uid245_sinPiZPolyEval_0_to_sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_1_q(28)) & reg_highBBits_uid282_pT3_uid245_sinPiZPolyEval_0_to_sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_1_q);
            sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_b));
    sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_q <= sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_o(54 downto 0);


	--lowRangeB_uid281_pT3_uid245_sinPiZPolyEval(BITSELECT,280)@18
    lowRangeB_uid281_pT3_uid245_sinPiZPolyEval_in <= multSumOfTwo18_uid276_pT3_uid245_sinPiZPolyEval_b(0 downto 0);
    lowRangeB_uid281_pT3_uid245_sinPiZPolyEval_b <= lowRangeB_uid281_pT3_uid245_sinPiZPolyEval_in(0 downto 0);

	--ld_lowRangeB_uid281_pT3_uid245_sinPiZPolyEval_b_to_add0_uid281_uid284_pT3_uid245_sinPiZPolyEval_a(DELAY,724)@18
    ld_lowRangeB_uid281_pT3_uid245_sinPiZPolyEval_b_to_add0_uid281_uid284_pT3_uid245_sinPiZPolyEval_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => lowRangeB_uid281_pT3_uid245_sinPiZPolyEval_b, xout => ld_lowRangeB_uid281_pT3_uid245_sinPiZPolyEval_b_to_add0_uid281_uid284_pT3_uid245_sinPiZPolyEval_a_q, clk => clk, aclr => areset );

	--add0_uid281_uid284_pT3_uid245_sinPiZPolyEval(BITJOIN,283)@19
    add0_uid281_uid284_pT3_uid245_sinPiZPolyEval_q <= sumAHighB_uid283_pT3_uid245_sinPiZPolyEval_q & ld_lowRangeB_uid281_pT3_uid245_sinPiZPolyEval_b_to_add0_uid281_uid284_pT3_uid245_sinPiZPolyEval_a_q;

	--R_uid285_pT3_uid245_sinPiZPolyEval(BITSELECT,284)@19
    R_uid285_pT3_uid245_sinPiZPolyEval_in <= add0_uid281_uid284_pT3_uid245_sinPiZPolyEval_q(54 downto 0);
    R_uid285_pT3_uid245_sinPiZPolyEval_b <= R_uid285_pT3_uid245_sinPiZPolyEval_in(54 downto 18);

	--reg_R_uid285_pT3_uid245_sinPiZPolyEval_0_to_ts3_uid248_sinPiZPolyEval_1(REG,397)@19
    reg_R_uid285_pT3_uid245_sinPiZPolyEval_0_to_ts3_uid248_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid285_pT3_uid245_sinPiZPolyEval_0_to_ts3_uid248_sinPiZPolyEval_1_q <= "0000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_R_uid285_pT3_uid245_sinPiZPolyEval_0_to_ts3_uid248_sinPiZPolyEval_1_q <= R_uid285_pT3_uid245_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_nor(LOGICAL,1168)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_nor_b <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_sticky_ena_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_nor_q <= not (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_nor_a or ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_nor_b);

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_mem_top(CONSTANT,1164)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_mem_top_q <= "01011";

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmp(LOGICAL,1165)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmp_a <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_mem_top_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdmux_q);
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmp_q <= "1" when ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmp_a = ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmp_b else "0";

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmpReg(REG,1166)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmpReg_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmp_q;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_sticky_ena(REG,1169)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_nor_q = "1") THEN
                ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_sticky_ena_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_enaAnd(LOGICAL,1170)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_enaAnd_a <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_sticky_ena_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_enaAnd_b <= VCC_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_enaAnd_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_enaAnd_a and ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_enaAnd_b;

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt(COUNTER,1160)
    -- every=1, low=0, high=11, step=1, init=1
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_i = 10 THEN
                  ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_eq <= '1';
                ELSE
                  ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_eq = '1') THEN
                    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_i <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_i - 11;
                ELSE
                    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_i <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_i,4));


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdreg(REG,1161)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdreg_q <= "0000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdreg_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdmux(MUX,1162)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdmux_s <= VCC_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdmux: PROCESS (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdmux_s, ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdreg_q, ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdmux_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdreg_q;
                  WHEN "1" => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdmux_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem(DUALMEM,1159)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_reset0 <= areset;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_ia <= zAddr_uid63_fpSinPiTest_b;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_aa <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdreg_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_ab <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_rdmux_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 7,
        widthad_b => 4,
        numwords_b => 12,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_iq,
        address_a => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_aa,
        data_a => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_ia
    );
        ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_iq(6 downto 0);

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_outputreg(DELAY,1158)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_outputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_replace_mem_q, xout => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_outputreg_q, clk => clk, aclr => areset );

	--reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0(REG,381)@18
    reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_q <= "0000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_a_outputreg_q;
        END IF;
    END PROCESS;


	--memoryC2_uid228_sinPiZTableGenerator(LOOKUP,227)@19
    memoryC2_uid228_sinPiZTableGenerator: PROCESS (reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_zAddr_uid63_fpSinPiTest_0_to_memoryC2_uid228_sinPiZTableGenerator_0_q) IS
                WHEN "0000000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010110101010001000011000110011101100111000";
                WHEN "0000001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010110101010010000000010011011110101101000";
                WHEN "0000010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010110101010100110111111010000111001000101";
                WHEN "0000011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010110101011001101001111001000101101101011";
                WHEN "0000100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010110101100000010110001110010011100100110";
                WHEN "0000101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010110101101000111100110110110100100001100";
                WHEN "0000110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010110101110011011101101110110101011000001";
                WHEN "0000111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010110101111111111000110001101110000001000";
                WHEN "0001000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010110110001110001101111010000000001001001";
                WHEN "0001001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010110110011110011101000001010111100010011";
                WHEN "0001010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010110110110000100110000000101010101010010";
                WHEN "0001011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010110111000100101000101111111001111001110";
                WHEN "0001100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010110111011010100101000110010000000110000";
                WHEN "0001101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010110111110010011010111010000010100101101";
                WHEN "0001110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010111000001100001010000000110001101010110";
                WHEN "0001111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010111000100111110010001111000111001110001";
                WHEN "0010000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010111001000101010011011000111000110111111";
                WHEN "0010001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010111001100100101101010001000110100001110";
                WHEN "0010010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010111010000101111111101001111011000110110";
                WHEN "0010011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010111010101001001010010100101011111010000";
                WHEN "0010100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010111011001110001101000001111010001111100";
                WHEN "0010101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010111011110101000111100001010010001101000";
                WHEN "0010110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010111100011101111001100001101011001010011";
                WHEN "0010111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010111101001000100010110001000111111011001";
                WHEN "0011000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010111101110101000010111100110110111011101";
                WHEN "0011001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010111110100011011001110001010010101001001";
                WHEN "0011010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1010111111010011100110111010000000101010000";
                WHEN "0011011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011000000000101101010000001110011011110111";
                WHEN "0011100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011000000111001100010110010101001001001010";
                WHEN "0011101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011000001101111010000110101101100011101100";
                WHEN "0011110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011000010100110110011110011010100101011100";
                WHEN "0011111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011000011100000001011010011000101010010101";
                WHEN "0100000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011000100011011010110111011101111001100010";
                WHEN "0100001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011000101011000010110010011010000011100100";
                WHEN "0100010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011000110010111001000111110110011110000010";
                WHEN "0100011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011000111010111101110100010110010000011111";
                WHEN "0100100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011001000011010000110100010110001010111111";
                WHEN "0100101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011001001011110010000100001100101110011011";
                WHEN "0100110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011001010100100001100000001010001100011000";
                WHEN "0100111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011001011101011111000100011000101001100001";
                WHEN "0101000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011001100110101010101100111100000000011011";
                WHEN "0101001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011001110000000100010101110001111101110010";
                WHEN "0101010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011001111001101011111010110010001100011010";
                WHEN "0101011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011010000011100001010111101110001010011110";
                WHEN "0101100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011010001101100100101000010001011000100111";
                WHEN "0101101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011010010111110101101000000001010011000010";
                WHEN "0101110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011010100010010100010010011101010101101010";
                WHEN "0101111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011010101101000000100010111111000010000011";
                WHEN "0110000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011010110111111010010100111001111011100110";
                WHEN "0110001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011011000011000001100011011011101110111001";
                WHEN "0110010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011011001110010110001001101100001111110101";
                WHEN "0110011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011011011001111000000010101101100000111100";
                WHEN "0110100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011011100101100111001001011011101110011000";
                WHEN "0110101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011011110001100011011000101101011001110101";
                WHEN "0110110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011011111101101100101011010011010110110001";
                WHEN "0110111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011100001010000010111011111000101001101100";
                WHEN "0111000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011100010110100110000101000010110110110100";
                WHEN "0111001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011100100011010110000001010001110101000110";
                WHEN "0111010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011100110000010010101010111111111100101100";
                WHEN "0111011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011100111101011011111100100010000110111111";
                WHEN "0111100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011101001010110001110000000111101111100101";
                WHEN "0111101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011101011000010011111111111010110011011100";
                WHEN "0111110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011101100110000010100101111111111011010100";
                WHEN "0111111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011101110011111101011100010110011100010110";
                WHEN "1000000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011110000010000100011100111000010100111110";
                WHEN "1000001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011110010000010111100001011010011001010101";
                WHEN "1000010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011110011110110110100011101100001011001000";
                WHEN "1000011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011110101101100001011101011000001011011001";
                WHEN "1000100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011110111100011000001000000011101110001111";
                WHEN "1000101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011111001011011010011101001111000101110001";
                WHEN "1000110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011111011010101000010110010101100101000110";
                WHEN "1000111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011111101010000001101100101101100010111111";
                WHEN "1001000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1011111111001100110011001101000011100111011";
                WHEN "1001001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100000001001010110010110010010110100011100";
                WHEN "1001010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100000011001010001011011110100100000011000";
                WHEN "1001011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100000101001010111100011010000011111011101";
                WHEN "1001100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100000111001101000100101100101001010011111";
                WHEN "1001101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100001001010000100011011101100001100000010";
                WHEN "1001110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100001011010101010111110011010101000110000";
                WHEN "1001111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100001101011011100000110100001001001100100";
                WHEN "1010000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100001111100010111101100101011101111001100";
                WHEN "1010001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100010001101011101101001100010000010111010";
                WHEN "1010010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100010011110101101110101100111011000000101";
                WHEN "1010011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100010110000001000001001011010101000000100";
                WHEN "1010100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100011000001101100011101010110100010000110";
                WHEN "1010101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100011010011011010101001110001100010110011";
                WHEN "1010110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100011100101010010100110111101111101101001";
                WHEN "1010111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100011110111010100001101001010000001101110";
                WHEN "1011000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100100001001011111010100011111111010110111";
                WHEN "1011001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100100011011110011110101000101111001011001";
                WHEN "1011010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100100101110010001100110111110001101101110";
                WHEN "1011011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100101000000111000100010000111010010100101";
                WHEN "1011100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100101010011101000011110011011110001111001";
                WHEN "1011101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100101100110100001010011110010100110010101";
                WHEN "1011110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100101111001100010111001111110111010001011";
                WHEN "1011111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100110001100101101001000110000010101000001";
                WHEN "1100000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100110011111111111110111110010111000010010";
                WHEN "1100001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100110110011011010111110101111001000100111";
                WHEN "1100010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100111000110111110010101001010001010011010";
                WHEN "1100011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100111011010101001110010100101101110010111";
                WHEN "1100100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1100111101110011101001110100000001111101010";
                WHEN "1100101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101000000010011000100000010100110110100000";
                WHEN "1100110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101000010110011011011111011011100110110011";
                WHEN "1100111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101000101010100110000011001001011000000001";
                WHEN "1101000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101000111110111000000010101111111100010101";
                WHEN "1101001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101001010011010001010101011110001011010100";
                WHEN "1101010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101001100111110001110010100000000000010111";
                WHEN "1101011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101001111100011001010000111110011101110000";
                WHEN "1101100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101010010001000111100111111111110011011101";
                WHEN "1101101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101010100101111100101110100111100110010101";
                WHEN "1101110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101010111010111000011011110110101001010101";
                WHEN "1101111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101011001111111010100110101011010011011011";
                WHEN "1110000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101011100101000011000110000001010000000100";
                WHEN "1110001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101011111010010001110000110001110011111011";
                WHEN "1110010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101100001111100110011101110011111001111111";
                WHEN "1110011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101100100101000001000011111100000011011011";
                WHEN "1110100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101100111010100001011001111100100100101001";
                WHEN "1110101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101101010000000111010110100101100100010111";
                WHEN "1110110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101101100101110010110000100101000101101101";
                WHEN "1110111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101101111011100011011110100111000011010111";
                WHEN "1111000" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101110010001011001010111010101011001010001";
                WHEN "1111001" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101110100111010100010001011000001010110100";
                WHEN "1111010" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101110111101010100000011010101100101100011";
                WHEN "1111011" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101111010011011000100011110010000011111011";
                WHEN "1111100" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101111101001100001101001010000010010001011";
                WHEN "1111101" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1101111111111101111001010010001010101000011";
                WHEN "1111110" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1110000010110000000111101010100101101001001";
                WHEN "1111111" =>  memoryC2_uid228_sinPiZTableGenerator_q <= "1110000101100010110111000111000011010110101";
                WHEN OTHERS =>
                    memoryC2_uid228_sinPiZTableGenerator_q <= "1010110101010001000011000110011101100111000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--rndBit_uid246_sinPiZPolyEval(CONSTANT,245)
    rndBit_uid246_sinPiZPolyEval_q <= "01";

	--cIncludingRoundingBit_uid247_sinPiZPolyEval(BITJOIN,246)@19
    cIncludingRoundingBit_uid247_sinPiZPolyEval_q <= memoryC2_uid228_sinPiZTableGenerator_q & rndBit_uid246_sinPiZPolyEval_q;

	--reg_cIncludingRoundingBit_uid247_sinPiZPolyEval_0_to_ts3_uid248_sinPiZPolyEval_0(REG,398)@19
    reg_cIncludingRoundingBit_uid247_sinPiZPolyEval_0_to_ts3_uid248_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid247_sinPiZPolyEval_0_to_ts3_uid248_sinPiZPolyEval_0_q <= "000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_cIncludingRoundingBit_uid247_sinPiZPolyEval_0_to_ts3_uid248_sinPiZPolyEval_0_q <= cIncludingRoundingBit_uid247_sinPiZPolyEval_q;
        END IF;
    END PROCESS;


	--ts3_uid248_sinPiZPolyEval(ADD,247)@20
    ts3_uid248_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((45 downto 45 => reg_cIncludingRoundingBit_uid247_sinPiZPolyEval_0_to_ts3_uid248_sinPiZPolyEval_0_q(44)) & reg_cIncludingRoundingBit_uid247_sinPiZPolyEval_0_to_ts3_uid248_sinPiZPolyEval_0_q);
    ts3_uid248_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((45 downto 37 => reg_R_uid285_pT3_uid245_sinPiZPolyEval_0_to_ts3_uid248_sinPiZPolyEval_1_q(36)) & reg_R_uid285_pT3_uid245_sinPiZPolyEval_0_to_ts3_uid248_sinPiZPolyEval_1_q);
            ts3_uid248_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts3_uid248_sinPiZPolyEval_a) + SIGNED(ts3_uid248_sinPiZPolyEval_b));
    ts3_uid248_sinPiZPolyEval_q <= ts3_uid248_sinPiZPolyEval_o(45 downto 0);


	--s3_uid249_sinPiZPolyEval(BITSELECT,248)@20
    s3_uid249_sinPiZPolyEval_in <= ts3_uid248_sinPiZPolyEval_q;
    s3_uid249_sinPiZPolyEval_b <= s3_uid249_sinPiZPolyEval_in(45 downto 1);

	--yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval(BITSELECT,286)@20
    yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_in <= s3_uid249_sinPiZPolyEval_b;
    yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_b <= yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_in(44 downto 18);

	--reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_9(REG,399)@20
    reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_9_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_9_q <= yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_nor(LOGICAL,1091)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_nor_b <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_sticky_ena_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_nor_q <= not (ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_nor_a or ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_nor_b);

	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_mem_top(CONSTANT,1087)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_mem_top_q <= "01100";

	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmp(LOGICAL,1088)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmp_a <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_mem_top_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdmux_q);
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmp_q <= "1" when ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmp_a = ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmp_b else "0";

	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmpReg(REG,1089)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmpReg_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmp_q;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_sticky_ena(REG,1092)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_nor_q = "1") THEN
                ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_sticky_ena_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_enaAnd(LOGICAL,1093)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_enaAnd_a <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_sticky_ena_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_enaAnd_b <= VCC_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_enaAnd_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_enaAnd_a and ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_enaAnd_b;

	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt(COUNTER,1083)
    -- every=1, low=0, high=12, step=1, init=1
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_i = 11 THEN
                  ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_eq <= '1';
                ELSE
                  ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_eq = '1') THEN
                    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_i <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_i - 12;
                ELSE
                    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_i <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_i,4));


	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdreg(REG,1084)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdreg_q <= "0000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdreg_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdmux(MUX,1085)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdmux_s <= VCC_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdmux: PROCESS (ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdmux_s, ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdreg_q, ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdmux_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdmux_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem(DUALMEM,1082)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_reset0 <= areset;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_ia <= zPPolyEval_uid64_fpSinPiTest_b;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_aa <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdreg_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_ab <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_rdmux_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 45,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 45,
        widthad_b => 4,
        numwords_b => 13,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_iq,
        address_a => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_aa,
        data_a => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_ia
    );
        ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_iq(44 downto 0);

	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_outputreg(DELAY,1081)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_outputreg : dspba_delay
    GENERIC MAP ( width => 45, depth => 1 )
    PORT MAP ( xin => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_replace_mem_q, xout => ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_outputreg_q, clk => clk, aclr => areset );

	--yT4_uid250_sinPiZPolyEval(BITSELECT,249)@20
    yT4_uid250_sinPiZPolyEval_in <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_yT4_uid250_sinPiZPolyEval_a_outputreg_q;
    yT4_uid250_sinPiZPolyEval_b <= yT4_uid250_sinPiZPolyEval_in(44 downto 2);

	--xBottomBits_uid290_pT4_uid251_sinPiZPolyEval(BITSELECT,289)@20
    xBottomBits_uid290_pT4_uid251_sinPiZPolyEval_in <= yT4_uid250_sinPiZPolyEval_b(15 downto 0);
    xBottomBits_uid290_pT4_uid251_sinPiZPolyEval_b <= xBottomBits_uid290_pT4_uid251_sinPiZPolyEval_in(15 downto 0);

	--pad_xBottomBits_uid290_uid292_pT4_uid251_sinPiZPolyEval(BITJOIN,291)@20
    pad_xBottomBits_uid290_uid292_pT4_uid251_sinPiZPolyEval_q <= xBottomBits_uid290_pT4_uid251_sinPiZPolyEval_b & STD_LOGIC_VECTOR((9 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_xBottomBits_uid290_uid292_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_7(REG,401)@20
    reg_pad_xBottomBits_uid290_uid292_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_xBottomBits_uid290_uid292_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_7_q <= "00000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_pad_xBottomBits_uid290_uid292_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_7_q <= pad_xBottomBits_uid290_uid292_pT4_uid251_sinPiZPolyEval_q;
        END IF;
    END PROCESS;


	--yBottomBits_uid289_pT4_uid251_sinPiZPolyEval(BITSELECT,288)@20
    yBottomBits_uid289_pT4_uid251_sinPiZPolyEval_in <= s3_uid249_sinPiZPolyEval_b(17 downto 0);
    yBottomBits_uid289_pT4_uid251_sinPiZPolyEval_b <= yBottomBits_uid289_pT4_uid251_sinPiZPolyEval_in(17 downto 0);

	--ld_yBottomBits_uid289_pT4_uid251_sinPiZPolyEval_b_to_spad_yBottomBits_uid289_uid291_pT4_uid251_sinPiZPolyEval_a(DELAY,733)@20
    ld_yBottomBits_uid289_pT4_uid251_sinPiZPolyEval_b_to_spad_yBottomBits_uid289_uid291_pT4_uid251_sinPiZPolyEval_a : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => yBottomBits_uid289_pT4_uid251_sinPiZPolyEval_b, xout => ld_yBottomBits_uid289_pT4_uid251_sinPiZPolyEval_b_to_spad_yBottomBits_uid289_uid291_pT4_uid251_sinPiZPolyEval_a_q, clk => clk, aclr => areset );

	--spad_yBottomBits_uid289_uid291_pT4_uid251_sinPiZPolyEval(BITJOIN,290)@21
    spad_yBottomBits_uid289_uid291_pT4_uid251_sinPiZPolyEval_q <= GND_q & ld_yBottomBits_uid289_pT4_uid251_sinPiZPolyEval_b_to_spad_yBottomBits_uid289_uid291_pT4_uid251_sinPiZPolyEval_a_q;

	--pad_yBottomBits_uid289_uid293_pT4_uid251_sinPiZPolyEval(BITJOIN,292)@21
    pad_yBottomBits_uid289_uid293_pT4_uid251_sinPiZPolyEval_q <= spad_yBottomBits_uid289_uid291_pT4_uid251_sinPiZPolyEval_q & STD_LOGIC_VECTOR((7 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_yBottomBits_uid289_uid293_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_6(REG,400)@21
    reg_pad_yBottomBits_uid289_uid293_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_yBottomBits_uid289_uid293_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_6_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_pad_yBottomBits_uid289_uid293_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_6_q <= pad_yBottomBits_uid289_uid293_pT4_uid251_sinPiZPolyEval_q;
        END IF;
    END PROCESS;


	--ld_yT4_uid250_sinPiZPolyEval_b_to_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_a(DELAY,727)@20
    ld_yT4_uid250_sinPiZPolyEval_b_to_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_a : dspba_delay
    GENERIC MAP ( width => 43, depth => 1 )
    PORT MAP ( xin => yT4_uid250_sinPiZPolyEval_b, xout => ld_yT4_uid250_sinPiZPolyEval_b_to_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_a_q, clk => clk, aclr => areset );

	--xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval(BITSELECT,285)@21
    xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_in <= ld_yT4_uid250_sinPiZPolyEval_b_to_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_a_q;
    xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_b <= xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_in(42 downto 16);

	--reg_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_4(REG,402)@21
    reg_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_4_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_4_q <= xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma(CHAINMULTADD,346)@22
    multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_p(0) <= multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_a(0) * multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_c(0);
    multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_p(1) <= multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_a(1) * multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_c(1);
    multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_w(0) <= RESIZE(multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_p(0),56);
    multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_w(1) <= RESIZE(multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_p(1),56);
    multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_x(0) <= multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_w(0);
    multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_x(1) <= multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_w(1);
    multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_y(0) <= multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_s(1) + multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_x(0);
    multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_y(1) <= multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_x(1);
    multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_a <= (others => (others => '0'));
            multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_c <= (others => (others => '0'));
            multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_a(0) <= SIGNED(RESIZE(UNSIGNED(reg_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_4_q),28));
            multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_a(1) <= SIGNED(RESIZE(UNSIGNED(reg_pad_xBottomBits_uid290_uid292_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_7_q),28));
            multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_c(0) <= SIGNED(RESIZE(SIGNED(reg_pad_yBottomBits_uid289_uid293_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_6_q),27));
            multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_c(1) <= SIGNED(RESIZE(SIGNED(reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_9_q),27));
            multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_s(0) <= multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_y(0);
            multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_s(1) <= multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_y(1);
        END IF;
    END PROCESS;
    multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_s(0),55));
    multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_q <= multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_s0;
        END IF;
    END PROCESS;

	--multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval(BITSELECT,294)@25
    multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_in <= multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_cma_q;
    multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_b <= multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_in(54 downto 8);

	--highBBits_uid297_pT4_uid251_sinPiZPolyEval(BITSELECT,296)@25
    highBBits_uid297_pT4_uid251_sinPiZPolyEval_in <= multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_b;
    highBBits_uid297_pT4_uid251_sinPiZPolyEval_b <= highBBits_uid297_pT4_uid251_sinPiZPolyEval_in(46 downto 18);

	--reg_highBBits_uid297_pT4_uid251_sinPiZPolyEval_0_to_sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_1(REG,405)@25
    reg_highBBits_uid297_pT4_uid251_sinPiZPolyEval_0_to_sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_highBBits_uid297_pT4_uid251_sinPiZPolyEval_0_to_sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_1_q <= "00000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_highBBits_uid297_pT4_uid251_sinPiZPolyEval_0_to_sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_1_q <= highBBits_uid297_pT4_uid251_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_1(REG,403)@20
    reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_1_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_1_q <= yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--ld_reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_1_q_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_b(DELAY,730)@21
    ld_reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_1_q_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_b : dspba_delay
    GENERIC MAP ( width => 27, depth => 1 )
    PORT MAP ( xin => reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_1_q, xout => ld_reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_1_q_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_b_q, clk => clk, aclr => areset );

	--reg_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_0(REG,404)@21
    reg_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_0_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_0_q <= xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--topProd_uid288_pT4_uid251_sinPiZPolyEval(MULT,287)@22
    topProd_uid288_pT4_uid251_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(topProd_uid288_pT4_uid251_sinPiZPolyEval_a),28)) * SIGNED(topProd_uid288_pT4_uid251_sinPiZPolyEval_b);
    topProd_uid288_pT4_uid251_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid288_pT4_uid251_sinPiZPolyEval_a <= (others => '0');
            topProd_uid288_pT4_uid251_sinPiZPolyEval_b <= (others => '0');
            topProd_uid288_pT4_uid251_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            topProd_uid288_pT4_uid251_sinPiZPolyEval_a <= reg_xTop27Bits_uid286_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_0_q;
            topProd_uid288_pT4_uid251_sinPiZPolyEval_b <= ld_reg_yTop27Bits_uid287_pT4_uid251_sinPiZPolyEval_0_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_1_q_to_topProd_uid288_pT4_uid251_sinPiZPolyEval_b_q;
            topProd_uid288_pT4_uid251_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid288_pT4_uid251_sinPiZPolyEval_pr,54));
        END IF;
    END PROCESS;
    topProd_uid288_pT4_uid251_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid288_pT4_uid251_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            topProd_uid288_pT4_uid251_sinPiZPolyEval_q <= topProd_uid288_pT4_uid251_sinPiZPolyEval_s1;
        END IF;
    END PROCESS;

	--reg_topProd_uid288_pT4_uid251_sinPiZPolyEval_0_to_sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_0(REG,406)@25
    reg_topProd_uid288_pT4_uid251_sinPiZPolyEval_0_to_sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_topProd_uid288_pT4_uid251_sinPiZPolyEval_0_to_sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_0_q <= "000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_topProd_uid288_pT4_uid251_sinPiZPolyEval_0_to_sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_0_q <= topProd_uid288_pT4_uid251_sinPiZPolyEval_q;
        END IF;
    END PROCESS;


	--sumAHighB_uid298_pT4_uid251_sinPiZPolyEval(ADD,297)@26
    sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((54 downto 54 => reg_topProd_uid288_pT4_uid251_sinPiZPolyEval_0_to_sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_0_q(53)) & reg_topProd_uid288_pT4_uid251_sinPiZPolyEval_0_to_sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_0_q);
    sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((54 downto 29 => reg_highBBits_uid297_pT4_uid251_sinPiZPolyEval_0_to_sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_1_q(28)) & reg_highBBits_uid297_pT4_uid251_sinPiZPolyEval_0_to_sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_1_q);
            sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_b));
    sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_q <= sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_o(54 downto 0);


	--lowRangeB_uid296_pT4_uid251_sinPiZPolyEval(BITSELECT,295)@25
    lowRangeB_uid296_pT4_uid251_sinPiZPolyEval_in <= multSumOfTwo27_uid291_pT4_uid251_sinPiZPolyEval_b(17 downto 0);
    lowRangeB_uid296_pT4_uid251_sinPiZPolyEval_b <= lowRangeB_uid296_pT4_uid251_sinPiZPolyEval_in(17 downto 0);

	--ld_lowRangeB_uid296_pT4_uid251_sinPiZPolyEval_b_to_add0_uid296_uid299_pT4_uid251_sinPiZPolyEval_a(DELAY,741)@25
    ld_lowRangeB_uid296_pT4_uid251_sinPiZPolyEval_b_to_add0_uid296_uid299_pT4_uid251_sinPiZPolyEval_a : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => lowRangeB_uid296_pT4_uid251_sinPiZPolyEval_b, xout => ld_lowRangeB_uid296_pT4_uid251_sinPiZPolyEval_b_to_add0_uid296_uid299_pT4_uid251_sinPiZPolyEval_a_q, clk => clk, aclr => areset );

	--add0_uid296_uid299_pT4_uid251_sinPiZPolyEval(BITJOIN,298)@26
    add0_uid296_uid299_pT4_uid251_sinPiZPolyEval_q <= sumAHighB_uid298_pT4_uid251_sinPiZPolyEval_q & ld_lowRangeB_uid296_pT4_uid251_sinPiZPolyEval_b_to_add0_uid296_uid299_pT4_uid251_sinPiZPolyEval_a_q;

	--R_uid300_pT4_uid251_sinPiZPolyEval(BITSELECT,299)@26
    R_uid300_pT4_uid251_sinPiZPolyEval_in <= add0_uid296_uid299_pT4_uid251_sinPiZPolyEval_q(71 downto 0);
    R_uid300_pT4_uid251_sinPiZPolyEval_b <= R_uid300_pT4_uid251_sinPiZPolyEval_in(71 downto 26);

	--reg_R_uid300_pT4_uid251_sinPiZPolyEval_0_to_ts4_uid254_sinPiZPolyEval_1(REG,407)@26
    reg_R_uid300_pT4_uid251_sinPiZPolyEval_0_to_ts4_uid254_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid300_pT4_uid251_sinPiZPolyEval_0_to_ts4_uid254_sinPiZPolyEval_1_q <= "0000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_R_uid300_pT4_uid251_sinPiZPolyEval_0_to_ts4_uid254_sinPiZPolyEval_1_q <= R_uid300_pT4_uid251_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_nor(LOGICAL,1155)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_nor_b <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_sticky_ena_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_nor_q <= not (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_nor_a or ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_nor_b);

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_mem_top(CONSTANT,1151)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_mem_top_q <= "010010";

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmp(LOGICAL,1152)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmp_a <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_mem_top_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdmux_q);
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmp_q <= "1" when ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmp_a = ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmp_b else "0";

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmpReg(REG,1153)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmpReg_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmp_q;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_sticky_ena(REG,1156)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_nor_q = "1") THEN
                ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_sticky_ena_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_enaAnd(LOGICAL,1157)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_enaAnd_a <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_sticky_ena_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_enaAnd_b <= VCC_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_enaAnd_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_enaAnd_a and ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_enaAnd_b;

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt(COUNTER,1147)
    -- every=1, low=0, high=18, step=1, init=1
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_i = 17 THEN
                  ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_eq <= '1';
                ELSE
                  ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_eq = '1') THEN
                    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_i <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_i - 18;
                ELSE
                    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_i <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_i,5));


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdreg(REG,1148)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdreg_q <= "00000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdreg_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdmux(MUX,1149)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdmux_s <= VCC_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdmux: PROCESS (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdmux_s, ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdreg_q, ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdmux_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdreg_q;
                  WHEN "1" => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdmux_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem(DUALMEM,1146)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_reset0 <= areset;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_ia <= zAddr_uid63_fpSinPiTest_b;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_aa <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdreg_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_ab <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_rdmux_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 5,
        numwords_a => 19,
        width_b => 7,
        widthad_b => 5,
        numwords_b => 19,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_iq,
        address_a => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_aa,
        data_a => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_ia
    );
        ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_iq(6 downto 0);

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_outputreg(DELAY,1145)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_outputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_replace_mem_q, xout => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_outputreg_q, clk => clk, aclr => areset );

	--reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0(REG,380)@25
    reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_q <= "0000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_a_outputreg_q;
        END IF;
    END PROCESS;


	--memoryC1_uid227_sinPiZTableGenerator(LOOKUP,226)@26
    memoryC1_uid227_sinPiZTableGenerator: PROCESS (reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_zAddr_uid63_fpSinPiTest_0_to_memoryC1_uid227_sinPiZTableGenerator_0_q) IS
                WHEN "0000000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "00000000000000000000000000000000000000000000000110";
                WHEN "0000001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11111110101101010100010101111000000010001111100011";
                WHEN "0000010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11111101011010101001001010010110100010110001011110";
                WHEN "0000011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11111100000111111110111100000001110010011010000110";
                WHEN "0000100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11111010110101010110001001011111100110111111100011";
                WHEN "0000101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11111001100010101111010001010101001101111010110100";
                WHEN "0000110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11111000010000001010110010000110111110101011111000";
                WHEN "0000111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11110110111101101001001010011000001101011000111010";
                WHEN "0001000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11110101101011001010111000101010111101010010100111";
                WHEN "0001001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11110100011000110000011011011111110011010111001110";
                WHEN "0001010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11110011000110011010010001010101101000110101101101";
                WHEN "0001011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11110001110100001000111000101001011101110011011101";
                WHEN "0001100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11110000100001111100101111110110001011110001011001";
                WHEN "0001101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11101111001111110110010101010100011000010010100110";
                WHEN "0001110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11101101111101110110000111011010000111100011100100";
                WHEN "0001111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11101100101011111100100100011010101111000101000111";
                WHEN "0010000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11101011011010001010001010100110101000010011111000";
                WHEN "0010001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11101010001000011111011000001011000011010110000100";
                WHEN "0010010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11101000110110111100101011010001111001100111110010";
                WHEN "0010011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11100111100101100010100010000001100000101010111010";
                WHEN "0010100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11100110010100010001011010011100011100110101011100";
                WHEN "0010101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11100101000011001001110010100001010100000101101100";
                WHEN "0010110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11100011110010001100001000001010100000110110000000";
                WHEN "0010111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11100010100001011000111001001110000100110010111000";
                WHEN "0011000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11100001010000110000100011011101011011110011010110";
                WHEN "0011001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11100000000000010011100100100101001110110011000010";
                WHEN "0011010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11011110110000000010011010001101000110110000011100";
                WHEN "0011011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11011101011111111101100001110111011111101010000000";
                WHEN "0011100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11011100010000000101011001000001011011100001111010";
                WHEN "0011101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11011011000000011010011101000010010101100000110110";
                WHEN "0011110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11011001110000111101001011001011110100111101110010";
                WHEN "0011111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11011000100001101110000000101001100000101000010010";
                WHEN "0100000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11010111010010101101011010100000110001110011110001";
                WHEN "0100001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11010110000011111011110101110000100111100111110101";
                WHEN "0100010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11010100110101011001101111010001011010010011110011";
                WHEN "0100011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11010011100111000111100011110100101110100010111000";
                WHEN "0100100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11010010011001000101110000000101001000110111000111";
                WHEN "0100101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11010001001011010100110000100110000001000100101001";
                WHEN "0100110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11001111111101110101000001110011010101110010001110";
                WHEN "0100111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11001110110000100111000000000001011111111100011001";
                WHEN "0101000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11001101100011101011000111011101000110011100100000";
                WHEN "0101001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11001100010111000001110100001010110001110100101001";
                WHEN "0101010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11001011001010101011100010000110111111111100011001";
                WHEN "0101011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11001001111110101000101101000101110111110101110110";
                WHEN "0101100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11001000110010111001110000110010111101100001101110";
                WHEN "0101101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11000111100111011111001000110001000101111011110000";
                WHEN "0101110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11000110011100011001010000011010001010111001000100";
                WHEN "0101111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11000101010001101000100010111110111111001010110011";
                WHEN "0110000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11000100000111001101011011100111000010100110100100";
                WHEN "0110001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11000010111101001000010101010000010110010001100101";
                WHEN "0110010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11000001110011011001101010101111010000110001110001";
                WHEN "0110011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "11000000101010000001110110101110010010100010001010";
                WHEN "0110100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10111111100001000001010011101101111010001101110100";
                WHEN "0110101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10111110011000011000011100000100011001001100111111";
                WHEN "0110110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10111101010000000111101001111101101000001001100111";
                WHEN "0110111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10111100001000001111010111011010111011101000011000";
                WHEN "0111000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10111011000000101111111110010010111000110100000100";
                WHEN "0111001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10111001111001101001111000010001001010010011000111";
                WHEN "0111010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10111000110010111101011110110110010100111101001111";
                WHEN "0111011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10110111101100101011001011010111101100111001001111";
                WHEN "0111100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10110110100110110011010110111111001010011111110011";
                WHEN "0111101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10110101100001010110011010101010111111100100001011";
                WHEN "0111110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10110100011100010100101111001101101100100000011010";
                WHEN "0111111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10110011010111101110101101001101110101101001000101";
                WHEN "1000000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10110010010011100100101101000101111000100111000101";
                WHEN "1000001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10110001001111110111000111000100000001110100110010";
                WHEN "1000010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10110000001100100110010011001010000010000100100001";
                WHEN "1000011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10101111001001110010101001001101000100001000011111";
                WHEN "1000100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10101110000111011100100000110101100010100101111011";
                WHEN "1000101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10101101000101100100010001011110111101101010011001";
                WHEN "1000110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10101100000100001010010010010111110001001000100100";
                WHEN "1000111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10101011000011001110111010100001001010011011010001";
                WHEN "1001000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10101010000010110010100000101110111110101110111011";
                WHEN "1001001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10101001000010110101011011100111100001010010001010";
                WHEN "1001010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10101000000011011000000001100011011001101001101101";
                WHEN "1001011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10100111000100011010101000101101011010001111110100";
                WHEN "1001100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10100110000101111101100111000010010110110101001010";
                WHEN "1001101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10100101001000000001010010010000111011001100101001";
                WHEN "1001110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10100100001010100101111111111001100001111011011000";
                WHEN "1001111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10100011001101101100000101001110001011001110111100";
                WHEN "1010000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10100010010001010011110111010010010011111110100100";
                WHEN "1010001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10100001010101011101101010111010101100101110000010";
                WHEN "1010010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10100000011010001001110100101101010000111010011101";
                WHEN "1010011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10011111011111011000101001000000111110001110111111";
                WHEN "1010100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10011110100101001010011011111101101011111101000010";
                WHEN "1010101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10011101101011011111100001011100000010100000001101";
                WHEN "1010110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10011100110010011000001101000101010011000110001101";
                WHEN "1010111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10011011111001110100110010010011001111011110111011";
                WHEN "1011000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10011011000001110101100100010000000001110100011101";
                WHEN "1011001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10011010001010011010110101110110000100101001100010";
                WHEN "1011010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10011001010011100100111001101111111011000001100001";
                WHEN "1011011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10011000011101010100000010011000001000101101011001";
                WHEN "1011100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10010111100111101000100001111001001010100001001100";
                WHEN "1011101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10010110110010100010101010001101001110110001111011";
                WHEN "1011110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10010101111110000010101100111110001101111011011100";
                WHEN "1011111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10010101001010001000111011100101100011001011100101";
                WHEN "1100000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10010100010110110101100111001100000101011000010000";
                WHEN "1100001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10010011100100001001000000101001111111111010110011";
                WHEN "1100010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10010010110010000011011000100110101011110110000011";
                WHEN "1100011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10010010000000100100111111011000101001000001000001";
                WHEN "1100100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10010001001111101110000101000101010111011100100101";
                WHEN "1100101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10010000011111011110111001100001010000110000001000";
                WHEN "1100110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10001111101111110111101100001111100001101100011111";
                WHEN "1100111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10001111000000111000101100100010000011111010101010";
                WHEN "1101000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10001110010010100010001001011001010111110000100010";
                WHEN "1101001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10001101100100110100010001100100011110001100110110";
                WHEN "1101010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10001100110111101111010011100000110010111101110011";
                WHEN "1101011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10001100001011010011011101011010000110101111000110";
                WHEN "1101100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10001011011111100000111101001010011001011111101101";
                WHEN "1101101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10001010110100011000000000011001110101000000001010";
                WHEN "1101110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10001010001001111000110100011110100111011011010110";
                WHEN "1101111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10001001100000000011100110011100111110000011010110";
                WHEN "1110000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10001000110110111000100011000111000000001100101100";
                WHEN "1110001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10001000001110010111110110111100101010001100011100";
                WHEN "1110010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10000111100110100001101110001011101000100010101000";
                WHEN "1110011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10000110111111010110010100101111010011001100111001";
                WHEN "1110100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10000110011000110101110110010000101000111111101001";
                WHEN "1110101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10000101110011000000011110000110001011001010001101";
                WHEN "1110110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10000101001101110110010111010011111001000001110011";
                WHEN "1110111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10000100101001010111101100101011001011110111111001";
                WHEN "1111000" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10000100000101100100101000101010110010110110110011";
                WHEN "1111001" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10000011100010011101010101011110101111000111101111";
                WHEN "1111010" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10000011000000000001111101000000010000000010001101";
                WHEN "1111011" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10000010011110010010101000110101101111100100010110";
                WHEN "1111100" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10000001111101001111100010010010101110110011110010";
                WHEN "1111101" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10000001011100111000110010010111110010100110111110";
                WHEN "1111110" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10000000111101001110100001110010100000011000001001";
                WHEN "1111111" =>  memoryC1_uid227_sinPiZTableGenerator_q <= "10000000011110010000111000111101011011000001000111";
                WHEN OTHERS =>
                    memoryC1_uid227_sinPiZTableGenerator_q <= "00000000000000000000000000000000000000000000000110";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--cIncludingRoundingBit_uid253_sinPiZPolyEval(BITJOIN,252)@26
    cIncludingRoundingBit_uid253_sinPiZPolyEval_q <= memoryC1_uid227_sinPiZTableGenerator_q & rndBit_uid246_sinPiZPolyEval_q;

	--reg_cIncludingRoundingBit_uid253_sinPiZPolyEval_0_to_ts4_uid254_sinPiZPolyEval_0(REG,408)@26
    reg_cIncludingRoundingBit_uid253_sinPiZPolyEval_0_to_ts4_uid254_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid253_sinPiZPolyEval_0_to_ts4_uid254_sinPiZPolyEval_0_q <= "0000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_cIncludingRoundingBit_uid253_sinPiZPolyEval_0_to_ts4_uid254_sinPiZPolyEval_0_q <= cIncludingRoundingBit_uid253_sinPiZPolyEval_q;
        END IF;
    END PROCESS;


	--ts4_uid254_sinPiZPolyEval(ADD,253)@27
    ts4_uid254_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((52 downto 52 => reg_cIncludingRoundingBit_uid253_sinPiZPolyEval_0_to_ts4_uid254_sinPiZPolyEval_0_q(51)) & reg_cIncludingRoundingBit_uid253_sinPiZPolyEval_0_to_ts4_uid254_sinPiZPolyEval_0_q);
    ts4_uid254_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((52 downto 46 => reg_R_uid300_pT4_uid251_sinPiZPolyEval_0_to_ts4_uid254_sinPiZPolyEval_1_q(45)) & reg_R_uid300_pT4_uid251_sinPiZPolyEval_0_to_ts4_uid254_sinPiZPolyEval_1_q);
            ts4_uid254_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts4_uid254_sinPiZPolyEval_a) + SIGNED(ts4_uid254_sinPiZPolyEval_b));
    ts4_uid254_sinPiZPolyEval_q <= ts4_uid254_sinPiZPolyEval_o(52 downto 0);


	--s4_uid255_sinPiZPolyEval(BITSELECT,254)@27
    s4_uid255_sinPiZPolyEval_in <= ts4_uid254_sinPiZPolyEval_q;
    s4_uid255_sinPiZPolyEval_b <= s4_uid255_sinPiZPolyEval_in(52 downto 1);

	--yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval(BITSELECT,301)@27
    yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_in <= s4_uid255_sinPiZPolyEval_b;
    yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_b <= yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_in(51 downto 25);

	--reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_9(REG,409)@27
    reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_9_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_9_q <= yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_nor(LOGICAL,1117)
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_nor_b <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_sticky_ena_q;
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_nor_q <= not (ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_nor_a or ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_nor_b);

	--ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_mem_top(CONSTANT,1113)
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_mem_top_q <= "010011";

	--ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmp(LOGICAL,1114)
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmp_a <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_mem_top_q;
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdmux_q);
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmp_q <= "1" when ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmp_a = ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmp_b else "0";

	--ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmpReg(REG,1115)
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmpReg_q <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmp_q;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_sticky_ena(REG,1118)
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_nor_q = "1") THEN
                ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_sticky_ena_q <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_enaAnd(LOGICAL,1119)
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_enaAnd_a <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_sticky_ena_q;
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_enaAnd_b <= VCC_q;
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_enaAnd_q <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_enaAnd_a and ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_enaAnd_b;

	--xBottomBits_uid305_pT5_uid257_sinPiZPolyEval(BITSELECT,304)@5
    xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_in <= zPPolyEval_uid64_fpSinPiTest_b(17 downto 0);
    xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b <= xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_in(17 downto 0);

	--ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt(COUNTER,1109)
    -- every=1, low=0, high=19, step=1, init=1
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_i = 18 THEN
                  ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_eq <= '1';
                ELSE
                  ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_eq = '1') THEN
                    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_i <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_i - 19;
                ELSE
                    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_i <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_i,5));


	--ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdreg(REG,1110)
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdreg_q <= "00000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdreg_q <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdmux(MUX,1111)
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdmux_s <= VCC_q;
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdmux: PROCESS (ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdmux_s, ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdreg_q, ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_q)
    BEGIN
            CASE ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdmux_s IS
                  WHEN "0" => ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdmux_q <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdreg_q;
                  WHEN "1" => ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdmux_q <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem(DUALMEM,1108)
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_reset0 <= areset;
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_ia <= xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b;
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_aa <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdreg_q;
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_ab <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_rdmux_q;
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 18,
        widthad_a => 5,
        numwords_a => 20,
        width_b => 18,
        widthad_b => 5,
        numwords_b => 20,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_iq,
        address_a => ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_aa,
        data_a => ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_ia
    );
        ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_q <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_iq(17 downto 0);

	--ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_outputreg(DELAY,1107)
    ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_outputreg : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_replace_mem_q, xout => ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_outputreg_q, clk => clk, aclr => areset );

	--pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval(BITJOIN,306)@27
    pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_q <= ld_xBottomBits_uid305_pT5_uid257_sinPiZPolyEval_b_to_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_b_outputreg_q & STD_LOGIC_VECTOR((7 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_7(REG,411)@27
    reg_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_7_q <= "00000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_7_q <= pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_q;
        END IF;
    END PROCESS;


	--yBottomBits_uid304_pT5_uid257_sinPiZPolyEval(BITSELECT,303)@27
    yBottomBits_uid304_pT5_uid257_sinPiZPolyEval_in <= s4_uid255_sinPiZPolyEval_b(24 downto 0);
    yBottomBits_uid304_pT5_uid257_sinPiZPolyEval_b <= yBottomBits_uid304_pT5_uid257_sinPiZPolyEval_in(24 downto 0);

	--ld_yBottomBits_uid304_pT5_uid257_sinPiZPolyEval_b_to_spad_yBottomBits_uid304_uid306_pT5_uid257_sinPiZPolyEval_a(DELAY,750)@27
    ld_yBottomBits_uid304_pT5_uid257_sinPiZPolyEval_b_to_spad_yBottomBits_uid304_uid306_pT5_uid257_sinPiZPolyEval_a : dspba_delay
    GENERIC MAP ( width => 25, depth => 1 )
    PORT MAP ( xin => yBottomBits_uid304_pT5_uid257_sinPiZPolyEval_b, xout => ld_yBottomBits_uid304_pT5_uid257_sinPiZPolyEval_b_to_spad_yBottomBits_uid304_uid306_pT5_uid257_sinPiZPolyEval_a_q, clk => clk, aclr => areset );

	--spad_yBottomBits_uid304_uid306_pT5_uid257_sinPiZPolyEval(BITJOIN,305)@28
    spad_yBottomBits_uid304_uid306_pT5_uid257_sinPiZPolyEval_q <= GND_q & ld_yBottomBits_uid304_pT5_uid257_sinPiZPolyEval_b_to_spad_yBottomBits_uid304_uid306_pT5_uid257_sinPiZPolyEval_a_q;

	--pad_yBottomBits_uid304_uid308_pT5_uid257_sinPiZPolyEval(BITJOIN,307)@28
    pad_yBottomBits_uid304_uid308_pT5_uid257_sinPiZPolyEval_q <= spad_yBottomBits_uid304_uid306_pT5_uid257_sinPiZPolyEval_q & GND_q;

	--reg_pad_yBottomBits_uid304_uid308_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_6(REG,410)@28
    reg_pad_yBottomBits_uid304_uid308_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_yBottomBits_uid304_uid308_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_6_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_pad_yBottomBits_uid304_uid308_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_6_q <= pad_yBottomBits_uid304_uid308_pT5_uid257_sinPiZPolyEval_q;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_nor(LOGICAL,1104)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_nor_b <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_sticky_ena_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_nor_q <= not (ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_nor_a or ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_nor_b);

	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_mem_top(CONSTANT,1100)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_mem_top_q <= "010100";

	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmp(LOGICAL,1101)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmp_a <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_mem_top_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdmux_q);
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmp_q <= "1" when ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmp_a = ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmp_b else "0";

	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmpReg(REG,1102)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmpReg_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmp_q;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_sticky_ena(REG,1105)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_nor_q = "1") THEN
                ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_sticky_ena_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_enaAnd(LOGICAL,1106)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_enaAnd_a <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_sticky_ena_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_enaAnd_b <= VCC_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_enaAnd_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_enaAnd_a and ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_enaAnd_b;

	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt(COUNTER,1096)
    -- every=1, low=0, high=20, step=1, init=1
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_i = 19 THEN
                  ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_eq <= '1';
                ELSE
                  ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_eq = '1') THEN
                    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_i <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_i - 20;
                ELSE
                    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_i <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_i,5));


	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdreg(REG,1097)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdreg_q <= "00000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdreg_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdmux(MUX,1098)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdmux_s <= VCC_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdmux: PROCESS (ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdmux_s, ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdreg_q, ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdmux_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdmux_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem(DUALMEM,1095)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_reset0 <= areset;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_ia <= zPPolyEval_uid64_fpSinPiTest_b;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_aa <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdreg_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_ab <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_rdmux_q;
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 45,
        widthad_a => 5,
        numwords_a => 21,
        width_b => 45,
        widthad_b => 5,
        numwords_b => 21,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_iq,
        address_a => ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_aa,
        data_a => ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_ia
    );
        ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_q <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_iq(44 downto 0);

	--ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_outputreg(DELAY,1094)
    ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_outputreg : dspba_delay
    GENERIC MAP ( width => 45, depth => 1 )
    PORT MAP ( xin => ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_replace_mem_q, xout => ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_outputreg_q, clk => clk, aclr => areset );

	--xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval(BITSELECT,300)@28
    xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_in <= ld_zPPolyEval_uid64_fpSinPiTest_b_to_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_a_outputreg_q;
    xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_b <= xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_in(44 downto 18);

	--reg_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_4(REG,412)@28
    reg_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_4_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_4_q <= xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma(CHAINMULTADD,347)@29
    multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_p(0) <= multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_a(0) * multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_c(0);
    multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_p(1) <= multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_a(1) * multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_c(1);
    multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_w(0) <= RESIZE(multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_p(0),56);
    multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_w(1) <= RESIZE(multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_p(1),56);
    multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_x(0) <= multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_w(0);
    multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_x(1) <= multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_w(1);
    multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_y(0) <= multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_s(1) + multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_x(0);
    multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_y(1) <= multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_x(1);
    multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_a <= (others => (others => '0'));
            multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_c <= (others => (others => '0'));
            multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_a(0) <= SIGNED(RESIZE(UNSIGNED(reg_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_4_q),28));
            multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_a(1) <= SIGNED(RESIZE(UNSIGNED(reg_pad_xBottomBits_uid305_uid307_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_7_q),28));
            multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_c(0) <= SIGNED(RESIZE(SIGNED(reg_pad_yBottomBits_uid304_uid308_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_6_q),27));
            multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_c(1) <= SIGNED(RESIZE(SIGNED(reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_9_q),27));
            multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_s(0) <= multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_y(0);
            multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_s(1) <= multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_y(1);
        END IF;
    END PROCESS;
    multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_s(0),55));
    multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_q <= multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_s0;
        END IF;
    END PROCESS;

	--multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval(BITSELECT,309)@32
    multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_in <= multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_cma_q;
    multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_b <= multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_in(54 downto 1);

	--highBBits_uid312_pT5_uid257_sinPiZPolyEval(BITSELECT,311)@32
    highBBits_uid312_pT5_uid257_sinPiZPolyEval_in <= multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_b;
    highBBits_uid312_pT5_uid257_sinPiZPolyEval_b <= highBBits_uid312_pT5_uid257_sinPiZPolyEval_in(53 downto 25);

	--reg_highBBits_uid312_pT5_uid257_sinPiZPolyEval_0_to_sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_1(REG,415)@32
    reg_highBBits_uid312_pT5_uid257_sinPiZPolyEval_0_to_sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_highBBits_uid312_pT5_uid257_sinPiZPolyEval_0_to_sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_1_q <= "00000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_highBBits_uid312_pT5_uid257_sinPiZPolyEval_0_to_sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_1_q <= highBBits_uid312_pT5_uid257_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_1(REG,413)@27
    reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_1_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_1_q <= yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--ld_reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_1_q_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_b(DELAY,747)@28
    ld_reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_1_q_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_b : dspba_delay
    GENERIC MAP ( width => 27, depth => 1 )
    PORT MAP ( xin => reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_1_q, xout => ld_reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_1_q_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_b_q, clk => clk, aclr => areset );

	--reg_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_0(REG,414)@28
    reg_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_0_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_0_q <= xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--topProd_uid303_pT5_uid257_sinPiZPolyEval(MULT,302)@29
    topProd_uid303_pT5_uid257_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(topProd_uid303_pT5_uid257_sinPiZPolyEval_a),28)) * SIGNED(topProd_uid303_pT5_uid257_sinPiZPolyEval_b);
    topProd_uid303_pT5_uid257_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid303_pT5_uid257_sinPiZPolyEval_a <= (others => '0');
            topProd_uid303_pT5_uid257_sinPiZPolyEval_b <= (others => '0');
            topProd_uid303_pT5_uid257_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            topProd_uid303_pT5_uid257_sinPiZPolyEval_a <= reg_xTop27Bits_uid301_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_0_q;
            topProd_uid303_pT5_uid257_sinPiZPolyEval_b <= ld_reg_yTop27Bits_uid302_pT5_uid257_sinPiZPolyEval_0_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_1_q_to_topProd_uid303_pT5_uid257_sinPiZPolyEval_b_q;
            topProd_uid303_pT5_uid257_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid303_pT5_uid257_sinPiZPolyEval_pr,54));
        END IF;
    END PROCESS;
    topProd_uid303_pT5_uid257_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid303_pT5_uid257_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            topProd_uid303_pT5_uid257_sinPiZPolyEval_q <= topProd_uid303_pT5_uid257_sinPiZPolyEval_s1;
        END IF;
    END PROCESS;

	--reg_topProd_uid303_pT5_uid257_sinPiZPolyEval_0_to_sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_0(REG,416)@32
    reg_topProd_uid303_pT5_uid257_sinPiZPolyEval_0_to_sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_topProd_uid303_pT5_uid257_sinPiZPolyEval_0_to_sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_0_q <= "000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_topProd_uid303_pT5_uid257_sinPiZPolyEval_0_to_sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_0_q <= topProd_uid303_pT5_uid257_sinPiZPolyEval_q;
        END IF;
    END PROCESS;


	--sumAHighB_uid313_pT5_uid257_sinPiZPolyEval(ADD,312)@33
    sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((54 downto 54 => reg_topProd_uid303_pT5_uid257_sinPiZPolyEval_0_to_sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_0_q(53)) & reg_topProd_uid303_pT5_uid257_sinPiZPolyEval_0_to_sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_0_q);
    sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((54 downto 29 => reg_highBBits_uid312_pT5_uid257_sinPiZPolyEval_0_to_sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_1_q(28)) & reg_highBBits_uid312_pT5_uid257_sinPiZPolyEval_0_to_sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_1_q);
            sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_b));
    sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_q <= sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_o(54 downto 0);


	--lowRangeB_uid311_pT5_uid257_sinPiZPolyEval(BITSELECT,310)@32
    lowRangeB_uid311_pT5_uid257_sinPiZPolyEval_in <= multSumOfTwo27_uid306_pT5_uid257_sinPiZPolyEval_b(24 downto 0);
    lowRangeB_uid311_pT5_uid257_sinPiZPolyEval_b <= lowRangeB_uid311_pT5_uid257_sinPiZPolyEval_in(24 downto 0);

	--ld_lowRangeB_uid311_pT5_uid257_sinPiZPolyEval_b_to_add0_uid311_uid314_pT5_uid257_sinPiZPolyEval_a(DELAY,758)@32
    ld_lowRangeB_uid311_pT5_uid257_sinPiZPolyEval_b_to_add0_uid311_uid314_pT5_uid257_sinPiZPolyEval_a : dspba_delay
    GENERIC MAP ( width => 25, depth => 1 )
    PORT MAP ( xin => lowRangeB_uid311_pT5_uid257_sinPiZPolyEval_b, xout => ld_lowRangeB_uid311_pT5_uid257_sinPiZPolyEval_b_to_add0_uid311_uid314_pT5_uid257_sinPiZPolyEval_a_q, clk => clk, aclr => areset );

	--add0_uid311_uid314_pT5_uid257_sinPiZPolyEval(BITJOIN,313)@33
    add0_uid311_uid314_pT5_uid257_sinPiZPolyEval_q <= sumAHighB_uid313_pT5_uid257_sinPiZPolyEval_q & ld_lowRangeB_uid311_pT5_uid257_sinPiZPolyEval_b_to_add0_uid311_uid314_pT5_uid257_sinPiZPolyEval_a_q;

	--R_uid315_pT5_uid257_sinPiZPolyEval(BITSELECT,314)@33
    R_uid315_pT5_uid257_sinPiZPolyEval_in <= add0_uid311_uid314_pT5_uid257_sinPiZPolyEval_q(78 downto 0);
    R_uid315_pT5_uid257_sinPiZPolyEval_b <= R_uid315_pT5_uid257_sinPiZPolyEval_in(78 downto 25);

	--reg_R_uid315_pT5_uid257_sinPiZPolyEval_0_to_ts5_uid260_sinPiZPolyEval_1(REG,417)@33
    reg_R_uid315_pT5_uid257_sinPiZPolyEval_0_to_ts5_uid260_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid315_pT5_uid257_sinPiZPolyEval_0_to_ts5_uid260_sinPiZPolyEval_1_q <= "000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_R_uid315_pT5_uid257_sinPiZPolyEval_0_to_ts5_uid260_sinPiZPolyEval_1_q <= R_uid315_pT5_uid257_sinPiZPolyEval_b;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_nor(LOGICAL,1142)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_nor_b <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_sticky_ena_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_nor_q <= not (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_nor_a or ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_nor_b);

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_mem_top(CONSTANT,1138)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_mem_top_q <= "011001";

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmp(LOGICAL,1139)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmp_a <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_mem_top_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdmux_q);
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmp_q <= "1" when ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmp_a = ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmp_b else "0";

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmpReg(REG,1140)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmpReg_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmp_q;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_sticky_ena(REG,1143)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_nor_q = "1") THEN
                ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_sticky_ena_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_enaAnd(LOGICAL,1144)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_enaAnd_a <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_sticky_ena_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_enaAnd_b <= VCC_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_enaAnd_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_enaAnd_a and ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_enaAnd_b;

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt(COUNTER,1134)
    -- every=1, low=0, high=25, step=1, init=1
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_i = 24 THEN
                  ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_eq <= '1';
                ELSE
                  ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_eq = '1') THEN
                    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_i <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_i - 25;
                ELSE
                    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_i <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_i,5));


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdreg(REG,1135)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdreg_q <= "00000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdreg_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdmux(MUX,1136)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdmux_s <= VCC_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdmux: PROCESS (ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdmux_s, ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdreg_q, ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdmux_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdreg_q;
                  WHEN "1" => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdmux_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem(DUALMEM,1133)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_reset0 <= areset;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_ia <= zAddr_uid63_fpSinPiTest_b;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_aa <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdreg_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_ab <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_rdmux_q;
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 5,
        numwords_a => 26,
        width_b => 7,
        widthad_b => 5,
        numwords_b => 26,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_iq,
        address_a => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_aa,
        data_a => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_ia
    );
        ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_iq(6 downto 0);

	--ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_outputreg(DELAY,1132)
    ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_outputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_replace_mem_q, xout => ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_outputreg_q, clk => clk, aclr => areset );

	--reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0(REG,379)@32
    reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_q <= "0000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_q <= ld_zAddr_uid63_fpSinPiTest_b_to_reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_a_outputreg_q;
        END IF;
    END PROCESS;


	--memoryC0_uid226_sinPiZTableGenerator(LOOKUP,225)@33
    memoryC0_uid226_sinPiZTableGenerator: PROCESS (reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_zAddr_uid63_fpSinPiTest_0_to_memoryC0_uid226_sinPiZTableGenerator_0_q) IS
                WHEN "0000000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010010000111111011010101000100010000101101000110001000";
                WHEN "0000001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010010000111010001111111001101111011000111100001001010";
                WHEN "0000010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010010000101010101111101111010001101100110011111100100";
                WHEN "0000011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010010000010000111010001110111000001110010011001110001";
                WHEN "0000100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010001111101100101111100010000110111011000000101000010";
                WHEN "0000101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010001110111110001111110110010110011100111000110011101";
                WHEN "0000110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010001110000101011011011100110100000100010100111010101";
                WHEN "0000111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010001101000010010010101010100001100000100101011101101";
                WHEN "0001000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010001011110100110101111000010100110110100001011000010";
                WHEN "0001001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010001010011101000101100010111000010101101001011110101";
                WHEN "0001010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010001000111011000010001010101010001011100000010111010";
                WHEN "0001011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010000111001110101100010011111100010101010110110110111";
                WHEN "0001100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010000101011000000100100110110100010000001101000110010";
                WHEN "0001101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010000011010111001011101111001010100111001000011000110";
                WHEN "0001110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110010000001001100000010011100101010111111111101111100110";
                WHEN "0001111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001111110110110101001100010110011100110010010101101111";
                WHEN "0010000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001111100010111000001111000110100110100110000010101111";
                WHEN "0010001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001111001101101001100011001110000111100101111100011100";
                WHEN "0010010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001110110111001001010000100011011101100011000000101111";
                WHEN "0010011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001110011111010111011111011011001110010110110010111000";
                WHEN "0010100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001110000110010100011000101000000100011000111000100110";
                WHEN "0010101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001101101100000000000101011010101010100111001000011100";
                WHEN "0010110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001101010000011010101111100001101000100000101011011110";
                WHEN "0010111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001100110011100100100001001001011101110011110100001011";
                WHEN "0011000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001100010101011101100100111100011101111110101100100111";
                WHEN "0011001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001011110110000110000110000010101011100010111110000011";
                WHEN "0011010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001011010101011110010000000001110011001100010100001001";
                WHEN "0011011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001010110011100110001110111101000110101001111110010101";
                WHEN "0011100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001010010000011110001111010101010111011011010001011111";
                WHEN "0011101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001001101100000110011110001000110001001111001100110001";
                WHEN "0011110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001001000110011111001000110010110100010111000011111111";
                WHEN "0011111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110001000011111101000011101001100001111101100010010011001";
                WHEN "0100000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110000111110111100010101001101010111010101001011000110001";
                WHEN "0100001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110000111001110001101111101000001101110110110001001100100";
                WHEN "0100010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110000110100011101010100110100000100001100111000110001110";
                WHEN "0100011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110000101110111111000110101110011111101010000010000111000";
                WHEN "0100100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110000101001010111000111011000101011010001011010101011100";
                WHEN "0100101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110000100011100101011000110111010110111110001001101100111";
                WHEN "0100110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110000011101101001111101010010110110101000111000011000010";
                WHEN "0100111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110000010111100100110110110111000001001011110110011001101";
                WHEN "0101000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110000010001010110000111110011001111100101011011000101100";
                WHEN "0101001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110000001010111101110010011010011011111001000011101001111";
                WHEN "0101010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0110000000100011011111001000011000000001110101111000110101";
                WHEN "0101011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101111111101110000011110000110110101110000111000001001000";
                WHEN "0101100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101111110110111011100100000011010011101000101101101101111";
                WHEN "0101101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101111101111111101001101011001001101111001001010100111010";
                WHEN "0101110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101111101000110101011100101100110100011000001100101000111";
                WHEN "0101111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101111100001100100010100100101110001100110101011111100110";
                WHEN "0110000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101111011010001001110111101111001001100110110011000001101";
                WHEN "0110001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101111010010100110001000110111011000110000110111110111111";
                WHEN "0110010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101111001010111001001010110000010010100110110110111111101";
                WHEN "0110011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101111000011000011000000001111000000100110010000101101101";
                WHEN "0110100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101110111011000011101100001100000000111000101001011011010";
                WHEN "0110101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101110110010111011010001100011000101000010101101011001001";
                WHEN "0110110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101110101010101001110011010011010000110001111000101001011";
                WHEN "0110111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101110100010001111010100011110111000101000100011101001111";
                WHEN "0111000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101110011001101011111000001011100000101000110101010111101";
                WHEN "0111001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101110010000111111100001100001111010111101111011010000110";
                WHEN "0111010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101110001000001010010011101110000110100100001000000010111";
                WHEN "0111011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101101111111001100010001111111001101101111011001101100100";
                WHEN "0111100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101101110110000101011111100111100100110000100111011101101";
                WHEN "0111101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101101101100110101111111111100101000011001011000100010101";
                WHEN "0111110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101101100011011101110110010110111100011110100100000110011";
                WHEN "0111111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101101011001111101000110010010001010011001011011010110110";
                WHEN "1000000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101101010000010011110011001100111111100111011110011001101";
                WHEN "1000001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101101000110100010000000101001001100001000111100100001001";
                WHEN "1000010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101100111100100111110010001011100000111110000000101011101";
                WHEN "1000011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101100110010100101001011011011101110100010101011000001110";
                WHEN "1000100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101100101000011010010000000100100011001001010111111110011";
                WHEN "1000101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101100011110000111000011110011101001010100010101110100101";
                WHEN "1000110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101100010011101011101010011001100110001101101001100010111";
                WHEN "1000111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101100001001001000000111101001110111111110000011100100111";
                WHEN "1001000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101011111110011100011111011010110100000010100101010111001";
                WHEN "1001001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101011110011101000110101100101100101100000111000011110001";
                WHEN "1001010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101011101000101101001110000110001011011010011000000110010";
                WHEN "1001011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101011011101101001101100111011010110111110001101101101010";
                WHEN "1001100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101011010010011110010110000110101001111010000001101101100";
                WHEN "1001101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101011000111001011001101101100010100101001100000111100110";
                WHEN "1001110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101010111011110000010111110011010100100100110111110110011";
                WHEN "1001111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101010110000001101111000100101010010001110000100000110101";
                WHEN "1010000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101010100100100011110100001110011111011100111101101011110";
                WHEN "1010001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101010011000110010001110111101110101101010011000000111111";
                WHEN "1010010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101010001100111001001101000100110011111001111100111000001";
                WHEN "1010011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101010000000111000110010110111011101000010111111101010001";
                WHEN "1010100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101001110100110001000100101100010101111000001101101010100";
                WHEN "1010101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101001101000100010000110111100100011001110011000100010010";
                WHEN "1010110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101001011100001011111110000011101000000001111110000000000";
                WHEN "1010111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101001001111101110101110011111100011011011101101000101110";
                WHEN "1011000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101001000011001010011100110000101110110100001001110110000";
                WHEN "1011001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101000110110011111001101011001111011110110010000011100000";
                WHEN "1011010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101000101001101101000101000000010010100000111000101001110";
                WHEN "1011011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101000011100110100001000001011001111000111011010101001101";
                WHEN "1011100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101000001111110100011011100100100000010001010101111111000";
                WHEN "1011101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0101000000010101110000011111000000100111000111011110010110";
                WHEN "1011110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100111110101100001000101110100001010001000111101001001101";
                WHEN "1011111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100111101000001101100110001001001001011001011110100011010";
                WHEN "1100000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100111011010110011101001101001100110001011110001011110000";
                WHEN "1100001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100111001101010011010101001010001100000101010101000000111";
                WHEN "1100010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100110111111101100101101100001101100101001111110101000001";
                WHEN "1100011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100110110001111111110111101000111101010101001011110111000";
                WHEN "1100100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100110100100001100111000011010110101010010011110001011110";
                WHEN "1100101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100110010110010011110100110100001011010101000001111000001";
                WHEN "1100110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100110001000010100110001110011110011101110100000111111001";
                WHEN "1100111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100101111010001111110100011010011110000101000011010111010";
                WHEN "1101000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100101101100000101000001101010110011001000011100110100101";
                WHEN "1101001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100101011101110100011110101001010010100110101010011100110";
                WHEN "1101010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100101001111011110010000011100010000111111100000000100011";
                WHEN "1101011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100101000001000010011100001011110101010111100110111011100";
                WHEN "1101100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100100110010100001000111000001110111001010101110101010001";
                WHEN "1101101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100100100011111010010110001001111011111101010001100000100";
                WHEN "1101110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100100010101001110001110110001010101001101001100111101111";
                WHEN "1101111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100100000110011100110110000110111110000010001111110011101";
                WHEN "1110000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100011110111100110010001011011011000111101011110100101010";
                WHEN "1110001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100011101000101010100110000000101101101000001111101101101";
                WHEN "1110010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100011011001101001111001001010100110100010100000001010111";
                WHEN "1110011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100011001010100100010000001110001110110000100001110111001";
                WHEN "1110100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100010111011011001110000100010001111101000000100110100000";
                WHEN "1110101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100010101100001010011111011110101110011100111100001100101";
                WHEN "1110110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100010011100110110100010011101001010001101000000010101011";
                WHEN "1110111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100010001101011101111110111000011001001011101110101101100";
                WHEN "1111000" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100001111110000000111010001100100110101101001001001010110";
                WHEN "1111001" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100001101110011111011001110111010000110000010101010100001";
                WHEN "1111010" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100001011110111001100011010111000101101001011101010010011";
                WHEN "1111011" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100001001111001111011100001100000001101011010010111101001";
                WHEN "1111100" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100000111111100001001001110111001100110000010110101011110";
                WHEN "1111101" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100000101111101110110001111010111000000011100010110001010";
                WHEN "1111110" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100000011111111000011001111010011011101000011100101001111";
                WHEN "1111111" =>  memoryC0_uid226_sinPiZTableGenerator_q <= "0100000001111111110000111011010010100000011001101000010011";
                WHEN OTHERS =>
                    memoryC0_uid226_sinPiZTableGenerator_q <= "0110010010000111111011010101000100010000101101000110001000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--rndBit_uid258_sinPiZPolyEval(CONSTANT,257)
    rndBit_uid258_sinPiZPolyEval_q <= "001";

	--cIncludingRoundingBit_uid259_sinPiZPolyEval(BITJOIN,258)@33
    cIncludingRoundingBit_uid259_sinPiZPolyEval_q <= memoryC0_uid226_sinPiZTableGenerator_q & rndBit_uid258_sinPiZPolyEval_q;

	--reg_cIncludingRoundingBit_uid259_sinPiZPolyEval_0_to_ts5_uid260_sinPiZPolyEval_0(REG,418)@33
    reg_cIncludingRoundingBit_uid259_sinPiZPolyEval_0_to_ts5_uid260_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid259_sinPiZPolyEval_0_to_ts5_uid260_sinPiZPolyEval_0_q <= "0000000000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_cIncludingRoundingBit_uid259_sinPiZPolyEval_0_to_ts5_uid260_sinPiZPolyEval_0_q <= cIncludingRoundingBit_uid259_sinPiZPolyEval_q;
        END IF;
    END PROCESS;


	--ts5_uid260_sinPiZPolyEval(ADD,259)@34
    ts5_uid260_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((61 downto 61 => reg_cIncludingRoundingBit_uid259_sinPiZPolyEval_0_to_ts5_uid260_sinPiZPolyEval_0_q(60)) & reg_cIncludingRoundingBit_uid259_sinPiZPolyEval_0_to_ts5_uid260_sinPiZPolyEval_0_q);
    ts5_uid260_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((61 downto 54 => reg_R_uid315_pT5_uid257_sinPiZPolyEval_0_to_ts5_uid260_sinPiZPolyEval_1_q(53)) & reg_R_uid315_pT5_uid257_sinPiZPolyEval_0_to_ts5_uid260_sinPiZPolyEval_1_q);
            ts5_uid260_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts5_uid260_sinPiZPolyEval_a) + SIGNED(ts5_uid260_sinPiZPolyEval_b));
    ts5_uid260_sinPiZPolyEval_q <= ts5_uid260_sinPiZPolyEval_o(61 downto 0);


	--s5_uid261_sinPiZPolyEval(BITSELECT,260)@34
    s5_uid261_sinPiZPolyEval_in <= ts5_uid260_sinPiZPolyEval_q;
    s5_uid261_sinPiZPolyEval_b <= s5_uid261_sinPiZPolyEval_in(61 downto 1);

	--fxpSinRes_uid66_fpSinPiTest(BITSELECT,65)@34
    fxpSinRes_uid66_fpSinPiTest_in <= s5_uid261_sinPiZPolyEval_b(58 downto 0);
    fxpSinRes_uid66_fpSinPiTest_b <= fxpSinRes_uid66_fpSinPiTest_in(58 downto 5);

	--ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_nor(LOGICAL,963)
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_nor_b <= ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_sticky_ena_q;
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_nor_q <= not (ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_nor_a or ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_nor_b);

	--ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_mem_top(CONSTANT,959)
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_mem_top_q <= "011111";

	--ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmp(LOGICAL,960)
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmp_a <= ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_mem_top_q;
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdmux_q);
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmp_q <= "1" when ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmp_a = ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmp_b else "0";

	--ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmpReg(REG,961)
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmpReg_q <= ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmp_q;
        END IF;
    END PROCESS;


	--ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_sticky_ena(REG,964)
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_nor_q = "1") THEN
                ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_sticky_ena_q <= ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_enaAnd(LOGICAL,965)
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_enaAnd_a <= ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_sticky_ena_q;
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_enaAnd_b <= VCC_q;
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_enaAnd_q <= ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_enaAnd_a and ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_enaAnd_b;

	--ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdcnt(COUNTER,955)
    -- every=1, low=0, high=31, step=1, init=1
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
        ELSIF (clk'EVENT AND clk = '1') THEN
                ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdcnt_i <= ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdcnt_i + 1;
        END IF;
    END PROCESS;
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdcnt_i,5));


	--ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdreg(REG,956)
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdreg_q <= "00000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdreg_q <= ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdmux(MUX,957)
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdmux_s <= VCC_q;
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdmux: PROCESS (ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdmux_s, ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdreg_q, ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdmux_q <= ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdmux_q <= ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem(DUALMEM,954)
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_reset0 <= areset;
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_ia <= sinXIsX_uid30_fpSinPiTest_c;
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_aa <= ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdreg_q;
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_ab <= ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_rdmux_q;
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_dmem : altsyncram
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
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_iq,
        address_a => ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_aa,
        data_a => ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_ia
    );
        ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_q <= ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_iq(0 downto 0);

	--ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_outputreg(DELAY,953)
    ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_outputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_replace_mem_q, xout => ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_outputreg_q, clk => clk, aclr => areset );

	--multRightOp_uid68_fpSinPiTest(MUX,67)@34
    multRightOp_uid68_fpSinPiTest_s <= ld_sinXIsX_uid30_fpSinPiTest_c_to_multRightOp_uid68_fpSinPiTest_b_outputreg_q;
    multRightOp_uid68_fpSinPiTest: PROCESS (multRightOp_uid68_fpSinPiTest_s, fxpSinRes_uid66_fpSinPiTest_b)
    BEGIN
            CASE multRightOp_uid68_fpSinPiTest_s IS
                  WHEN "0" => multRightOp_uid68_fpSinPiTest_q <= fxpSinRes_uid66_fpSinPiTest_b;
                  WHEN "1" => multRightOp_uid68_fpSinPiTest_q <= piwFP2_uid67_fpSinPiTest_q;
                  WHEN OTHERS => multRightOp_uid68_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--mul2xSinRes_uid69_fpSinPiTest_b_1(BITSELECT,318)@34
    mul2xSinRes_uid69_fpSinPiTest_b_1_in <= multRightOp_uid68_fpSinPiTest_q;
    mul2xSinRes_uid69_fpSinPiTest_b_1_b <= mul2xSinRes_uid69_fpSinPiTest_b_1_in(53 downto 27);

	--reg_mul2xSinRes_uid69_fpSinPiTest_b_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b1_1(REG,423)@34
    reg_mul2xSinRes_uid69_fpSinPiTest_b_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_b_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b1_1_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_b_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b1_1_q <= mul2xSinRes_uid69_fpSinPiTest_b_1_b;
        END IF;
    END PROCESS;


	--ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_nor(LOGICAL,1129)
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_nor_b <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_sticky_ena_q;
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_nor_q <= not (ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_nor_a or ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_nor_b);

	--ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_mem_top(CONSTANT,1125)
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_mem_top_q <= "010110";

	--ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmp(LOGICAL,1126)
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmp_a <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_mem_top_q;
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdmux_q);
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmp_q <= "1" when ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmp_a = ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmp_b else "0";

	--ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmpReg(REG,1127)
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmpReg_q <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmp_q;
        END IF;
    END PROCESS;


	--ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_sticky_ena(REG,1130)
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_nor_q = "1") THEN
                ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_sticky_ena_q <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_enaAnd(LOGICAL,1131)
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_enaAnd_a <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_sticky_ena_q;
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_enaAnd_b <= VCC_q;
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_enaAnd_q <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_enaAnd_a and ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_enaAnd_b;

	--ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_nor(LOGICAL,937)
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_nor_b <= ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_sticky_ena_q;
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_nor_q <= not (ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_nor_a or ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_nor_b);

	--ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_mem_top(CONSTANT,933)
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_mem_top_q <= "0111";

	--ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmp(LOGICAL,934)
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmp_a <= ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_mem_top_q;
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdmux_q);
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmp_q <= "1" when ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmp_a = ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmp_b else "0";

	--ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmpReg(REG,935)
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmpReg_q <= ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmp_q;
        END IF;
    END PROCESS;


	--ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_sticky_ena(REG,938)
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_nor_q = "1") THEN
                ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_sticky_ena_q <= ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_enaAnd(LOGICAL,939)
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_enaAnd_a <= ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_sticky_ena_q;
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_enaAnd_b <= VCC_q;
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_enaAnd_q <= ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_enaAnd_a and ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_enaAnd_b;

	--ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdcnt(COUNTER,929)
    -- every=1, low=0, high=7, step=1, init=1
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,3);
        ELSIF (clk'EVENT AND clk = '1') THEN
                ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdcnt_i <= ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdcnt_i + 1;
        END IF;
    END PROCESS;
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdcnt_i,3));


	--ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdreg(REG,930)
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdreg_q <= "000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdreg_q <= ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdmux(MUX,931)
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdmux_s <= VCC_q;
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdmux: PROCESS (ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdmux_s, ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdreg_q, ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdmux_q <= ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdreg_q;
                  WHEN "1" => ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdmux_q <= ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem(DUALMEM,928)
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_reset0 <= areset;
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_ia <= oFracX_uid31_uid31_fpSinPiTest_q;
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_aa <= ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdreg_q;
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_ab <= ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_rdmux_q;
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 53,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 53,
        widthad_b => 3,
        numwords_b => 8,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_iq,
        address_a => ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_aa,
        data_a => ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_ia
    );
        ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_q <= ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_iq(52 downto 0);

	--ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_outputreg(DELAY,927)
    ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_outputreg : dspba_delay
    GENERIC MAP ( width => 53, depth => 1 )
    PORT MAP ( xin => ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_replace_mem_q, xout => ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_outputreg_q, clk => clk, aclr => areset );

	--LeftShiftStage277dto0_uid221_alignedZ_uid52_fpSinPiTest(BITSELECT,220)@10
    LeftShiftStage277dto0_uid221_alignedZ_uid52_fpSinPiTest_in <= leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_q(77 downto 0);
    LeftShiftStage277dto0_uid221_alignedZ_uid52_fpSinPiTest_b <= LeftShiftStage277dto0_uid221_alignedZ_uid52_fpSinPiTest_in(77 downto 0);

	--leftShiftStage3Idx1_uid222_alignedZ_uid52_fpSinPiTest(BITJOIN,221)@10
    leftShiftStage3Idx1_uid222_alignedZ_uid52_fpSinPiTest_q <= LeftShiftStage277dto0_uid221_alignedZ_uid52_fpSinPiTest_b & GND_q;

	--LeftShiftStage054dto0_uid205_alignedZ_uid52_fpSinPiTest(BITSELECT,204)@9
    LeftShiftStage054dto0_uid205_alignedZ_uid52_fpSinPiTest_in <= leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_q(54 downto 0);
    LeftShiftStage054dto0_uid205_alignedZ_uid52_fpSinPiTest_b <= LeftShiftStage054dto0_uid205_alignedZ_uid52_fpSinPiTest_in(54 downto 0);

	--leftShiftStage1Idx3_uid206_alignedZ_uid52_fpSinPiTest(BITJOIN,205)@9
    leftShiftStage1Idx3_uid206_alignedZ_uid52_fpSinPiTest_q <= LeftShiftStage054dto0_uid205_alignedZ_uid52_fpSinPiTest_b & leftShiftStage1Idx3Pad24_uid123_fixedPointX_uid37_fpSinPiTest_q;

	--LeftShiftStage062dto0_uid202_alignedZ_uid52_fpSinPiTest(BITSELECT,201)@9
    LeftShiftStage062dto0_uid202_alignedZ_uid52_fpSinPiTest_in <= leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_q(62 downto 0);
    LeftShiftStage062dto0_uid202_alignedZ_uid52_fpSinPiTest_b <= LeftShiftStage062dto0_uid202_alignedZ_uid52_fpSinPiTest_in(62 downto 0);

	--leftShiftStage1Idx2_uid203_alignedZ_uid52_fpSinPiTest(BITJOIN,202)@9
    leftShiftStage1Idx2_uid203_alignedZ_uid52_fpSinPiTest_q <= LeftShiftStage062dto0_uid202_alignedZ_uid52_fpSinPiTest_b & leftShiftStage1Idx2Pad16_uid120_fixedPointX_uid37_fpSinPiTest_q;

	--LeftShiftStage070dto0_uid199_alignedZ_uid52_fpSinPiTest(BITSELECT,198)@9
    LeftShiftStage070dto0_uid199_alignedZ_uid52_fpSinPiTest_in <= leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_q(70 downto 0);
    LeftShiftStage070dto0_uid199_alignedZ_uid52_fpSinPiTest_b <= LeftShiftStage070dto0_uid199_alignedZ_uid52_fpSinPiTest_in(70 downto 0);

	--leftShiftStage1Idx1_uid200_alignedZ_uid52_fpSinPiTest(BITJOIN,199)@9
    leftShiftStage1Idx1_uid200_alignedZ_uid52_fpSinPiTest_q <= LeftShiftStage070dto0_uid199_alignedZ_uid52_fpSinPiTest_b & leftShiftStage1Idx1Pad8_uid117_fixedPointX_uid37_fpSinPiTest_q;

	--ozz_uid41_fpSinPiTest(CONSTANT,40)
    ozz_uid41_fpSinPiTest_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000";

	--ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_nor(LOGICAL,1040)
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_nor_b <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_sticky_ena_q;
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_nor_q <= not (ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_nor_a or ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_nor_b);

	--ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_mem_top(CONSTANT,1036)
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_mem_top_q <= "011";

	--ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmp(LOGICAL,1037)
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmp_a <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_mem_top_q;
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdmux_q);
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmp_q <= "1" when ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmp_a = ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmp_b else "0";

	--ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmpReg(REG,1038)
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmpReg_q <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmp_q;
        END IF;
    END PROCESS;


	--ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_sticky_ena(REG,1041)
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_nor_q = "1") THEN
                ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_sticky_ena_q <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_enaAnd(LOGICAL,1042)
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_enaAnd_a <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_sticky_ena_q;
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_enaAnd_b <= VCC_q;
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_enaAnd_q <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_enaAnd_a and ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_enaAnd_b;

	--vStage_uid149_lzcZ_uid51_fpSinPiTest(BITSELECT,148)@4
    vStage_uid149_lzcZ_uid51_fpSinPiTest_in <= z_uid49_fpSinPiTest_q(14 downto 0);
    vStage_uid149_lzcZ_uid51_fpSinPiTest_b <= vStage_uid149_lzcZ_uid51_fpSinPiTest_in(14 downto 0);

	--ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdcnt(COUNTER,1032)
    -- every=1, low=0, high=3, step=1, init=1
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,2);
        ELSIF (clk'EVENT AND clk = '1') THEN
                ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdcnt_i <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdcnt_i + 1;
        END IF;
    END PROCESS;
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdcnt_i,2));


	--ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdreg(REG,1033)
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdreg_q <= "00";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdreg_q <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdmux(MUX,1034)
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdmux_s <= VCC_q;
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdmux: PROCESS (ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdmux_s, ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdreg_q, ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdmux_q <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdmux_q <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem(DUALMEM,1043)
    ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_reset0 <= areset;
    ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_ia <= vStage_uid149_lzcZ_uid51_fpSinPiTest_b;
    ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_aa <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdreg_q;
    ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_ab <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdmux_q;
    ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 15,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 15,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_iq,
        address_a => ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_aa,
        data_a => ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_ia
    );
        ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_q <= ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_iq(14 downto 0);

	--leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest(BITJOIN,193)@9
    leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_q <= ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_b_replace_mem_q & leftShiftStage0Idx2Pad64_uid111_fixedPointX_uid37_fpSinPiTest_q;

	--X46dto0_uid190_alignedZ_uid52_fpSinPiTest(BITSELECT,189)@4
    X46dto0_uid190_alignedZ_uid52_fpSinPiTest_in <= z_uid49_fpSinPiTest_q(46 downto 0);
    X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b <= X46dto0_uid190_alignedZ_uid52_fpSinPiTest_in(46 downto 0);

	--ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem(DUALMEM,1031)
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_reset0 <= areset;
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_ia <= X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b;
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_aa <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdreg_q;
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_ab <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_rdmux_q;
    ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 47,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 47,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_iq,
        address_a => ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_aa,
        data_a => ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_ia
    );
        ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_q <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_iq(46 downto 0);

	--leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest(BITJOIN,190)@9
    leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_q <= ld_X46dto0_uid190_alignedZ_uid52_fpSinPiTest_b_to_leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_b_replace_mem_q & leftShiftStage0Idx1Pad32_uid108_fixedPointX_uid37_fpSinPiTest_q;

	--ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_nor(LOGICAL,1065)
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_nor_b <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_sticky_ena_q;
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_nor_q <= not (ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_nor_a or ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_nor_b);

	--ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_mem_top(CONSTANT,1061)
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_mem_top_q <= "010";

	--ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmp(LOGICAL,1062)
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmp_a <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_mem_top_q;
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdmux_q);
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmp_q <= "1" when ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmp_a = ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmp_b else "0";

	--ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmpReg(REG,1063)
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmpReg_q <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmp_q;
        END IF;
    END PROCESS;


	--ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_sticky_ena(REG,1066)
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_nor_q = "1") THEN
                ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_sticky_ena_q <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_enaAnd(LOGICAL,1067)
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_enaAnd_a <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_sticky_ena_q;
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_enaAnd_b <= VCC_q;
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_enaAnd_q <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_enaAnd_a and ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_enaAnd_b;

	--ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt(COUNTER,1057)
    -- every=1, low=0, high=2, step=1, init=1
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_i = 1 THEN
                  ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_eq <= '1';
                ELSE
                  ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_eq = '1') THEN
                    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_i <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_i - 2;
                ELSE
                    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_i <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_i,2));


	--ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdreg(REG,1058)
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdreg_q <= "00";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdreg_q <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdmux(MUX,1059)
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdmux_s <= VCC_q;
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdmux: PROCESS (ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdmux_s, ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdreg_q, ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_q)
    BEGIN
            CASE ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdmux_s IS
                  WHEN "0" => ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdmux_q <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdreg_q;
                  WHEN "1" => ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdmux_q <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem(DUALMEM,1056)
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_reset0 <= areset;
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_ia <= z_uid49_fpSinPiTest_q;
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_aa <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdreg_q;
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_ab <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_rdmux_q;
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 79,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 79,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_iq,
        address_a => ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_aa,
        data_a => ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_ia
    );
        ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_q <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_iq(78 downto 0);

	--ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_outputreg(DELAY,1055)
    ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_outputreg : dspba_delay
    GENERIC MAP ( width => 79, depth => 1 )
    PORT MAP ( xin => ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_replace_mem_q, xout => ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_outputreg_q, clk => clk, aclr => areset );

	--rVStage_uid146_lzcZ_uid51_fpSinPiTest(BITSELECT,145)@4
    rVStage_uid146_lzcZ_uid51_fpSinPiTest_in <= z_uid49_fpSinPiTest_q;
    rVStage_uid146_lzcZ_uid51_fpSinPiTest_b <= rVStage_uid146_lzcZ_uid51_fpSinPiTest_in(78 downto 15);

	--reg_rVStage_uid146_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid147_lzcZ_uid51_fpSinPiTest_0(REG,365)@4
    reg_rVStage_uid146_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid147_lzcZ_uid51_fpSinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid146_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid147_lzcZ_uid51_fpSinPiTest_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_rVStage_uid146_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid147_lzcZ_uid51_fpSinPiTest_0_q <= rVStage_uid146_lzcZ_uid51_fpSinPiTest_b;
        END IF;
    END PROCESS;


	--vCount_uid147_lzcZ_uid51_fpSinPiTest(LOGICAL,146)@5
    vCount_uid147_lzcZ_uid51_fpSinPiTest_a <= reg_rVStage_uid146_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid147_lzcZ_uid51_fpSinPiTest_0_q;
    vCount_uid147_lzcZ_uid51_fpSinPiTest_b <= leftShiftStage0Idx2Pad64_uid111_fixedPointX_uid37_fpSinPiTest_q;
    vCount_uid147_lzcZ_uid51_fpSinPiTest_q <= "1" when vCount_uid147_lzcZ_uid51_fpSinPiTest_a = vCount_uid147_lzcZ_uid51_fpSinPiTest_b else "0";

	--ld_vCount_uid147_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_g(DELAY,629)@5
    ld_vCount_uid147_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_g : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => vCount_uid147_lzcZ_uid51_fpSinPiTest_q, xout => ld_vCount_uid147_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_g_q, clk => clk, aclr => areset );

	--ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_cStage_uid150_lzcZ_uid51_fpSinPiTest_b(DELAY,587)@4
    ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_cStage_uid150_lzcZ_uid51_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => vStage_uid149_lzcZ_uid51_fpSinPiTest_b, xout => ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_cStage_uid150_lzcZ_uid51_fpSinPiTest_b_q, clk => clk, aclr => areset );

	--mO_uid148_lzcZ_uid51_fpSinPiTest(CONSTANT,147)
    mO_uid148_lzcZ_uid51_fpSinPiTest_q <= "1111111111111111111111111111111111111111111111111";

	--cStage_uid150_lzcZ_uid51_fpSinPiTest(BITJOIN,149)@5
    cStage_uid150_lzcZ_uid51_fpSinPiTest_q <= ld_vStage_uid149_lzcZ_uid51_fpSinPiTest_b_to_cStage_uid150_lzcZ_uid51_fpSinPiTest_b_q & mO_uid148_lzcZ_uid51_fpSinPiTest_q;

	--ld_rVStage_uid146_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid152_lzcZ_uid51_fpSinPiTest_c(DELAY,589)@4
    ld_rVStage_uid146_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid152_lzcZ_uid51_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 64, depth => 1 )
    PORT MAP ( xin => rVStage_uid146_lzcZ_uid51_fpSinPiTest_b, xout => ld_rVStage_uid146_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid152_lzcZ_uid51_fpSinPiTest_c_q, clk => clk, aclr => areset );

	--vStagei_uid152_lzcZ_uid51_fpSinPiTest(MUX,151)@5
    vStagei_uid152_lzcZ_uid51_fpSinPiTest_s <= vCount_uid147_lzcZ_uid51_fpSinPiTest_q;
    vStagei_uid152_lzcZ_uid51_fpSinPiTest: PROCESS (vStagei_uid152_lzcZ_uid51_fpSinPiTest_s, ld_rVStage_uid146_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid152_lzcZ_uid51_fpSinPiTest_c_q, cStage_uid150_lzcZ_uid51_fpSinPiTest_q)
    BEGIN
            CASE vStagei_uid152_lzcZ_uid51_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid152_lzcZ_uid51_fpSinPiTest_q <= ld_rVStage_uid146_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid152_lzcZ_uid51_fpSinPiTest_c_q;
                  WHEN "1" => vStagei_uid152_lzcZ_uid51_fpSinPiTest_q <= cStage_uid150_lzcZ_uid51_fpSinPiTest_q;
                  WHEN OTHERS => vStagei_uid152_lzcZ_uid51_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid154_lzcZ_uid51_fpSinPiTest(BITSELECT,153)@5
    rVStage_uid154_lzcZ_uid51_fpSinPiTest_in <= vStagei_uid152_lzcZ_uid51_fpSinPiTest_q;
    rVStage_uid154_lzcZ_uid51_fpSinPiTest_b <= rVStage_uid154_lzcZ_uid51_fpSinPiTest_in(63 downto 32);

	--reg_rVStage_uid154_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid155_lzcZ_uid51_fpSinPiTest_0(REG,366)@5
    reg_rVStage_uid154_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid155_lzcZ_uid51_fpSinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid154_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid155_lzcZ_uid51_fpSinPiTest_0_q <= "00000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_rVStage_uid154_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid155_lzcZ_uid51_fpSinPiTest_0_q <= rVStage_uid154_lzcZ_uid51_fpSinPiTest_b;
        END IF;
    END PROCESS;


	--vCount_uid155_lzcZ_uid51_fpSinPiTest(LOGICAL,154)@6
    vCount_uid155_lzcZ_uid51_fpSinPiTest_a <= reg_rVStage_uid154_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid155_lzcZ_uid51_fpSinPiTest_0_q;
    vCount_uid155_lzcZ_uid51_fpSinPiTest_b <= leftShiftStage0Idx1Pad32_uid108_fixedPointX_uid37_fpSinPiTest_q;
    vCount_uid155_lzcZ_uid51_fpSinPiTest_q <= "1" when vCount_uid155_lzcZ_uid51_fpSinPiTest_a = vCount_uid155_lzcZ_uid51_fpSinPiTest_b else "0";

	--ld_vCount_uid155_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_f(DELAY,628)@6
    ld_vCount_uid155_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid155_lzcZ_uid51_fpSinPiTest_q, xout => ld_vCount_uid155_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_f_q, clk => clk, aclr => areset );

	--vStage_uid156_lzcZ_uid51_fpSinPiTest(BITSELECT,155)@5
    vStage_uid156_lzcZ_uid51_fpSinPiTest_in <= vStagei_uid152_lzcZ_uid51_fpSinPiTest_q(31 downto 0);
    vStage_uid156_lzcZ_uid51_fpSinPiTest_b <= vStage_uid156_lzcZ_uid51_fpSinPiTest_in(31 downto 0);

	--ld_vStage_uid156_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid158_lzcZ_uid51_fpSinPiTest_d(DELAY,596)@5
    ld_vStage_uid156_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid158_lzcZ_uid51_fpSinPiTest_d : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => vStage_uid156_lzcZ_uid51_fpSinPiTest_b, xout => ld_vStage_uid156_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid158_lzcZ_uid51_fpSinPiTest_d_q, clk => clk, aclr => areset );

	--ld_rVStage_uid154_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid158_lzcZ_uid51_fpSinPiTest_c(DELAY,595)@5
    ld_rVStage_uid154_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid158_lzcZ_uid51_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => rVStage_uid154_lzcZ_uid51_fpSinPiTest_b, xout => ld_rVStage_uid154_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid158_lzcZ_uid51_fpSinPiTest_c_q, clk => clk, aclr => areset );

	--vStagei_uid158_lzcZ_uid51_fpSinPiTest(MUX,157)@6
    vStagei_uid158_lzcZ_uid51_fpSinPiTest_s <= vCount_uid155_lzcZ_uid51_fpSinPiTest_q;
    vStagei_uid158_lzcZ_uid51_fpSinPiTest: PROCESS (vStagei_uid158_lzcZ_uid51_fpSinPiTest_s, ld_rVStage_uid154_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid158_lzcZ_uid51_fpSinPiTest_c_q, ld_vStage_uid156_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid158_lzcZ_uid51_fpSinPiTest_d_q)
    BEGIN
            CASE vStagei_uid158_lzcZ_uid51_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid158_lzcZ_uid51_fpSinPiTest_q <= ld_rVStage_uid154_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid158_lzcZ_uid51_fpSinPiTest_c_q;
                  WHEN "1" => vStagei_uid158_lzcZ_uid51_fpSinPiTest_q <= ld_vStage_uid156_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid158_lzcZ_uid51_fpSinPiTest_d_q;
                  WHEN OTHERS => vStagei_uid158_lzcZ_uid51_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid160_lzcZ_uid51_fpSinPiTest(BITSELECT,159)@6
    rVStage_uid160_lzcZ_uid51_fpSinPiTest_in <= vStagei_uid158_lzcZ_uid51_fpSinPiTest_q;
    rVStage_uid160_lzcZ_uid51_fpSinPiTest_b <= rVStage_uid160_lzcZ_uid51_fpSinPiTest_in(31 downto 16);

	--reg_rVStage_uid160_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid161_lzcZ_uid51_fpSinPiTest_0(REG,367)@6
    reg_rVStage_uid160_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid161_lzcZ_uid51_fpSinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid160_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid161_lzcZ_uid51_fpSinPiTest_0_q <= "0000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_rVStage_uid160_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid161_lzcZ_uid51_fpSinPiTest_0_q <= rVStage_uid160_lzcZ_uid51_fpSinPiTest_b;
        END IF;
    END PROCESS;


	--vCount_uid161_lzcZ_uid51_fpSinPiTest(LOGICAL,160)@7
    vCount_uid161_lzcZ_uid51_fpSinPiTest_a <= reg_rVStage_uid160_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid161_lzcZ_uid51_fpSinPiTest_0_q;
    vCount_uid161_lzcZ_uid51_fpSinPiTest_b <= leftShiftStage1Idx2Pad16_uid120_fixedPointX_uid37_fpSinPiTest_q;
    vCount_uid161_lzcZ_uid51_fpSinPiTest_q <= "1" when vCount_uid161_lzcZ_uid51_fpSinPiTest_a = vCount_uid161_lzcZ_uid51_fpSinPiTest_b else "0";

	--ld_vCount_uid161_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_e(DELAY,627)@7
    ld_vCount_uid161_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid161_lzcZ_uid51_fpSinPiTest_q, xout => ld_vCount_uid161_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_e_q, clk => clk, aclr => areset );

	--vStage_uid162_lzcZ_uid51_fpSinPiTest(BITSELECT,161)@6
    vStage_uid162_lzcZ_uid51_fpSinPiTest_in <= vStagei_uid158_lzcZ_uid51_fpSinPiTest_q(15 downto 0);
    vStage_uid162_lzcZ_uid51_fpSinPiTest_b <= vStage_uid162_lzcZ_uid51_fpSinPiTest_in(15 downto 0);

	--ld_vStage_uid162_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid164_lzcZ_uid51_fpSinPiTest_d(DELAY,602)@6
    ld_vStage_uid162_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid164_lzcZ_uid51_fpSinPiTest_d : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => vStage_uid162_lzcZ_uid51_fpSinPiTest_b, xout => ld_vStage_uid162_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid164_lzcZ_uid51_fpSinPiTest_d_q, clk => clk, aclr => areset );

	--ld_rVStage_uid160_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid164_lzcZ_uid51_fpSinPiTest_c(DELAY,601)@6
    ld_rVStage_uid160_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid164_lzcZ_uid51_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => rVStage_uid160_lzcZ_uid51_fpSinPiTest_b, xout => ld_rVStage_uid160_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid164_lzcZ_uid51_fpSinPiTest_c_q, clk => clk, aclr => areset );

	--vStagei_uid164_lzcZ_uid51_fpSinPiTest(MUX,163)@7
    vStagei_uid164_lzcZ_uid51_fpSinPiTest_s <= vCount_uid161_lzcZ_uid51_fpSinPiTest_q;
    vStagei_uid164_lzcZ_uid51_fpSinPiTest: PROCESS (vStagei_uid164_lzcZ_uid51_fpSinPiTest_s, ld_rVStage_uid160_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid164_lzcZ_uid51_fpSinPiTest_c_q, ld_vStage_uid162_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid164_lzcZ_uid51_fpSinPiTest_d_q)
    BEGIN
            CASE vStagei_uid164_lzcZ_uid51_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid164_lzcZ_uid51_fpSinPiTest_q <= ld_rVStage_uid160_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid164_lzcZ_uid51_fpSinPiTest_c_q;
                  WHEN "1" => vStagei_uid164_lzcZ_uid51_fpSinPiTest_q <= ld_vStage_uid162_lzcZ_uid51_fpSinPiTest_b_to_vStagei_uid164_lzcZ_uid51_fpSinPiTest_d_q;
                  WHEN OTHERS => vStagei_uid164_lzcZ_uid51_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid166_lzcZ_uid51_fpSinPiTest(BITSELECT,165)@7
    rVStage_uid166_lzcZ_uid51_fpSinPiTest_in <= vStagei_uid164_lzcZ_uid51_fpSinPiTest_q;
    rVStage_uid166_lzcZ_uid51_fpSinPiTest_b <= rVStage_uid166_lzcZ_uid51_fpSinPiTest_in(15 downto 8);

	--reg_rVStage_uid166_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid167_lzcZ_uid51_fpSinPiTest_0(REG,368)@7
    reg_rVStage_uid166_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid167_lzcZ_uid51_fpSinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid166_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid167_lzcZ_uid51_fpSinPiTest_0_q <= "00000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_rVStage_uid166_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid167_lzcZ_uid51_fpSinPiTest_0_q <= rVStage_uid166_lzcZ_uid51_fpSinPiTest_b;
        END IF;
    END PROCESS;


	--vCount_uid167_lzcZ_uid51_fpSinPiTest(LOGICAL,166)@8
    vCount_uid167_lzcZ_uid51_fpSinPiTest_a <= reg_rVStage_uid166_lzcZ_uid51_fpSinPiTest_0_to_vCount_uid167_lzcZ_uid51_fpSinPiTest_0_q;
    vCount_uid167_lzcZ_uid51_fpSinPiTest_b <= leftShiftStage1Idx1Pad8_uid117_fixedPointX_uid37_fpSinPiTest_q;
    vCount_uid167_lzcZ_uid51_fpSinPiTest_q <= "1" when vCount_uid167_lzcZ_uid51_fpSinPiTest_a = vCount_uid167_lzcZ_uid51_fpSinPiTest_b else "0";

	--vStage_uid168_lzcZ_uid51_fpSinPiTest(BITSELECT,167)@7
    vStage_uid168_lzcZ_uid51_fpSinPiTest_in <= vStagei_uid164_lzcZ_uid51_fpSinPiTest_q(7 downto 0);
    vStage_uid168_lzcZ_uid51_fpSinPiTest_b <= vStage_uid168_lzcZ_uid51_fpSinPiTest_in(7 downto 0);

	--reg_vStage_uid168_lzcZ_uid51_fpSinPiTest_0_to_vStagei_uid170_lzcZ_uid51_fpSinPiTest_3(REG,369)@7
    reg_vStage_uid168_lzcZ_uid51_fpSinPiTest_0_to_vStagei_uid170_lzcZ_uid51_fpSinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid168_lzcZ_uid51_fpSinPiTest_0_to_vStagei_uid170_lzcZ_uid51_fpSinPiTest_3_q <= "00000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_vStage_uid168_lzcZ_uid51_fpSinPiTest_0_to_vStagei_uid170_lzcZ_uid51_fpSinPiTest_3_q <= vStage_uid168_lzcZ_uid51_fpSinPiTest_b;
        END IF;
    END PROCESS;


	--reg_rVStage_uid166_lzcZ_uid51_fpSinPiTest_0_to_vStagei_uid170_lzcZ_uid51_fpSinPiTest_2(REG,370)@7
    reg_rVStage_uid166_lzcZ_uid51_fpSinPiTest_0_to_vStagei_uid170_lzcZ_uid51_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid166_lzcZ_uid51_fpSinPiTest_0_to_vStagei_uid170_lzcZ_uid51_fpSinPiTest_2_q <= "00000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_rVStage_uid166_lzcZ_uid51_fpSinPiTest_0_to_vStagei_uid170_lzcZ_uid51_fpSinPiTest_2_q <= rVStage_uid166_lzcZ_uid51_fpSinPiTest_b;
        END IF;
    END PROCESS;


	--vStagei_uid170_lzcZ_uid51_fpSinPiTest(MUX,169)@8
    vStagei_uid170_lzcZ_uid51_fpSinPiTest_s <= vCount_uid167_lzcZ_uid51_fpSinPiTest_q;
    vStagei_uid170_lzcZ_uid51_fpSinPiTest: PROCESS (vStagei_uid170_lzcZ_uid51_fpSinPiTest_s, reg_rVStage_uid166_lzcZ_uid51_fpSinPiTest_0_to_vStagei_uid170_lzcZ_uid51_fpSinPiTest_2_q, reg_vStage_uid168_lzcZ_uid51_fpSinPiTest_0_to_vStagei_uid170_lzcZ_uid51_fpSinPiTest_3_q)
    BEGIN
            CASE vStagei_uid170_lzcZ_uid51_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid170_lzcZ_uid51_fpSinPiTest_q <= reg_rVStage_uid166_lzcZ_uid51_fpSinPiTest_0_to_vStagei_uid170_lzcZ_uid51_fpSinPiTest_2_q;
                  WHEN "1" => vStagei_uid170_lzcZ_uid51_fpSinPiTest_q <= reg_vStage_uid168_lzcZ_uid51_fpSinPiTest_0_to_vStagei_uid170_lzcZ_uid51_fpSinPiTest_3_q;
                  WHEN OTHERS => vStagei_uid170_lzcZ_uid51_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid172_lzcZ_uid51_fpSinPiTest(BITSELECT,171)@8
    rVStage_uid172_lzcZ_uid51_fpSinPiTest_in <= vStagei_uid170_lzcZ_uid51_fpSinPiTest_q;
    rVStage_uid172_lzcZ_uid51_fpSinPiTest_b <= rVStage_uid172_lzcZ_uid51_fpSinPiTest_in(7 downto 4);

	--vCount_uid173_lzcZ_uid51_fpSinPiTest(LOGICAL,172)@8
    vCount_uid173_lzcZ_uid51_fpSinPiTest_a <= rVStage_uid172_lzcZ_uid51_fpSinPiTest_b;
    vCount_uid173_lzcZ_uid51_fpSinPiTest_b <= leftShiftStage2Idx2Pad4_uid131_fixedPointX_uid37_fpSinPiTest_q;
    vCount_uid173_lzcZ_uid51_fpSinPiTest_q <= "1" when vCount_uid173_lzcZ_uid51_fpSinPiTest_a = vCount_uid173_lzcZ_uid51_fpSinPiTest_b else "0";

	--vStage_uid174_lzcZ_uid51_fpSinPiTest(BITSELECT,173)@8
    vStage_uid174_lzcZ_uid51_fpSinPiTest_in <= vStagei_uid170_lzcZ_uid51_fpSinPiTest_q(3 downto 0);
    vStage_uid174_lzcZ_uid51_fpSinPiTest_b <= vStage_uid174_lzcZ_uid51_fpSinPiTest_in(3 downto 0);

	--vStagei_uid176_lzcZ_uid51_fpSinPiTest(MUX,175)@8
    vStagei_uid176_lzcZ_uid51_fpSinPiTest_s <= vCount_uid173_lzcZ_uid51_fpSinPiTest_q;
    vStagei_uid176_lzcZ_uid51_fpSinPiTest: PROCESS (vStagei_uid176_lzcZ_uid51_fpSinPiTest_s, rVStage_uid172_lzcZ_uid51_fpSinPiTest_b, vStage_uid174_lzcZ_uid51_fpSinPiTest_b)
    BEGIN
            CASE vStagei_uid176_lzcZ_uid51_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid176_lzcZ_uid51_fpSinPiTest_q <= rVStage_uid172_lzcZ_uid51_fpSinPiTest_b;
                  WHEN "1" => vStagei_uid176_lzcZ_uid51_fpSinPiTest_q <= vStage_uid174_lzcZ_uid51_fpSinPiTest_b;
                  WHEN OTHERS => vStagei_uid176_lzcZ_uid51_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid178_lzcZ_uid51_fpSinPiTest(BITSELECT,177)@8
    rVStage_uid178_lzcZ_uid51_fpSinPiTest_in <= vStagei_uid176_lzcZ_uid51_fpSinPiTest_q;
    rVStage_uid178_lzcZ_uid51_fpSinPiTest_b <= rVStage_uid178_lzcZ_uid51_fpSinPiTest_in(3 downto 2);

	--vCount_uid179_lzcZ_uid51_fpSinPiTest(LOGICAL,178)@8
    vCount_uid179_lzcZ_uid51_fpSinPiTest_a <= rVStage_uid178_lzcZ_uid51_fpSinPiTest_b;
    vCount_uid179_lzcZ_uid51_fpSinPiTest_b <= leftShiftStage2Idx1Pad2_uid128_fixedPointX_uid37_fpSinPiTest_q;
    vCount_uid179_lzcZ_uid51_fpSinPiTest_q <= "1" when vCount_uid179_lzcZ_uid51_fpSinPiTest_a = vCount_uid179_lzcZ_uid51_fpSinPiTest_b else "0";

	--vStage_uid180_lzcZ_uid51_fpSinPiTest(BITSELECT,179)@8
    vStage_uid180_lzcZ_uid51_fpSinPiTest_in <= vStagei_uid176_lzcZ_uid51_fpSinPiTest_q(1 downto 0);
    vStage_uid180_lzcZ_uid51_fpSinPiTest_b <= vStage_uid180_lzcZ_uid51_fpSinPiTest_in(1 downto 0);

	--vStagei_uid182_lzcZ_uid51_fpSinPiTest(MUX,181)@8
    vStagei_uid182_lzcZ_uid51_fpSinPiTest_s <= vCount_uid179_lzcZ_uid51_fpSinPiTest_q;
    vStagei_uid182_lzcZ_uid51_fpSinPiTest: PROCESS (vStagei_uid182_lzcZ_uid51_fpSinPiTest_s, rVStage_uid178_lzcZ_uid51_fpSinPiTest_b, vStage_uid180_lzcZ_uid51_fpSinPiTest_b)
    BEGIN
            CASE vStagei_uid182_lzcZ_uid51_fpSinPiTest_s IS
                  WHEN "0" => vStagei_uid182_lzcZ_uid51_fpSinPiTest_q <= rVStage_uid178_lzcZ_uid51_fpSinPiTest_b;
                  WHEN "1" => vStagei_uid182_lzcZ_uid51_fpSinPiTest_q <= vStage_uid180_lzcZ_uid51_fpSinPiTest_b;
                  WHEN OTHERS => vStagei_uid182_lzcZ_uid51_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid184_lzcZ_uid51_fpSinPiTest(BITSELECT,183)@8
    rVStage_uid184_lzcZ_uid51_fpSinPiTest_in <= vStagei_uid182_lzcZ_uid51_fpSinPiTest_q;
    rVStage_uid184_lzcZ_uid51_fpSinPiTest_b <= rVStage_uid184_lzcZ_uid51_fpSinPiTest_in(1 downto 1);

	--vCount_uid185_lzcZ_uid51_fpSinPiTest(LOGICAL,184)@8
    vCount_uid185_lzcZ_uid51_fpSinPiTest_a <= rVStage_uid184_lzcZ_uid51_fpSinPiTest_b;
    vCount_uid185_lzcZ_uid51_fpSinPiTest_b <= GND_q;
    vCount_uid185_lzcZ_uid51_fpSinPiTest_q <= "1" when vCount_uid185_lzcZ_uid51_fpSinPiTest_a = vCount_uid185_lzcZ_uid51_fpSinPiTest_b else "0";

	--r_uid186_lzcZ_uid51_fpSinPiTest(BITJOIN,185)@8
    r_uid186_lzcZ_uid51_fpSinPiTest_q <= ld_vCount_uid147_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_g_q & ld_vCount_uid155_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_f_q & ld_vCount_uid161_lzcZ_uid51_fpSinPiTest_q_to_r_uid186_lzcZ_uid51_fpSinPiTest_e_q & vCount_uid167_lzcZ_uid51_fpSinPiTest_q & vCount_uid173_lzcZ_uid51_fpSinPiTest_q & vCount_uid179_lzcZ_uid51_fpSinPiTest_q & vCount_uid185_lzcZ_uid51_fpSinPiTest_q;

	--leftShiftStageSel6Dto5_uid196_alignedZ_uid52_fpSinPiTest(BITSELECT,195)@8
    leftShiftStageSel6Dto5_uid196_alignedZ_uid52_fpSinPiTest_in <= r_uid186_lzcZ_uid51_fpSinPiTest_q;
    leftShiftStageSel6Dto5_uid196_alignedZ_uid52_fpSinPiTest_b <= leftShiftStageSel6Dto5_uid196_alignedZ_uid52_fpSinPiTest_in(6 downto 5);

	--reg_leftShiftStageSel6Dto5_uid196_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_1(REG,371)@8
    reg_leftShiftStageSel6Dto5_uid196_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel6Dto5_uid196_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_1_q <= "00";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_leftShiftStageSel6Dto5_uid196_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_1_q <= leftShiftStageSel6Dto5_uid196_alignedZ_uid52_fpSinPiTest_b;
        END IF;
    END PROCESS;


	--leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest(MUX,196)@9
    leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_s <= reg_leftShiftStageSel6Dto5_uid196_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_1_q;
    leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest: PROCESS (leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_s, ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_outputreg_q, leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_q, leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_q <= ld_z_uid49_fpSinPiTest_q_to_leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_c_outputreg_q;
                  WHEN "01" => leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_q <= leftShiftStage0Idx1_uid191_alignedZ_uid52_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_q <= leftShiftStage0Idx2_uid194_alignedZ_uid52_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_q <= ozz_uid41_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel4Dto3_uid207_alignedZ_uid52_fpSinPiTest(BITSELECT,206)@8
    leftShiftStageSel4Dto3_uid207_alignedZ_uid52_fpSinPiTest_in <= r_uid186_lzcZ_uid51_fpSinPiTest_q(4 downto 0);
    leftShiftStageSel4Dto3_uid207_alignedZ_uid52_fpSinPiTest_b <= leftShiftStageSel4Dto3_uid207_alignedZ_uid52_fpSinPiTest_in(4 downto 3);

	--reg_leftShiftStageSel4Dto3_uid207_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_1(REG,372)@8
    reg_leftShiftStageSel4Dto3_uid207_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel4Dto3_uid207_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_1_q <= "00";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_leftShiftStageSel4Dto3_uid207_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_1_q <= leftShiftStageSel4Dto3_uid207_alignedZ_uid52_fpSinPiTest_b;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest(MUX,207)@9
    leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_s <= reg_leftShiftStageSel4Dto3_uid207_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_1_q;
    leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest: PROCESS (leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_s, leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_q, leftShiftStage1Idx1_uid200_alignedZ_uid52_fpSinPiTest_q, leftShiftStage1Idx2_uid203_alignedZ_uid52_fpSinPiTest_q, leftShiftStage1Idx3_uid206_alignedZ_uid52_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_q <= leftShiftStage0_uid197_alignedZ_uid52_fpSinPiTest_q;
                  WHEN "01" => leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_q <= leftShiftStage1Idx1_uid200_alignedZ_uid52_fpSinPiTest_q;
                  WHEN "10" => leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_q <= leftShiftStage1Idx2_uid203_alignedZ_uid52_fpSinPiTest_q;
                  WHEN "11" => leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_q <= leftShiftStage1Idx3_uid206_alignedZ_uid52_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage172dto0_uid216_alignedZ_uid52_fpSinPiTest(BITSELECT,215)@9
    LeftShiftStage172dto0_uid216_alignedZ_uid52_fpSinPiTest_in <= leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_q(72 downto 0);
    LeftShiftStage172dto0_uid216_alignedZ_uid52_fpSinPiTest_b <= LeftShiftStage172dto0_uid216_alignedZ_uid52_fpSinPiTest_in(72 downto 0);

	--leftShiftStage2Idx3_uid217_alignedZ_uid52_fpSinPiTest(BITJOIN,216)@9
    leftShiftStage2Idx3_uid217_alignedZ_uid52_fpSinPiTest_q <= LeftShiftStage172dto0_uid216_alignedZ_uid52_fpSinPiTest_b & leftShiftStage2Idx3Pad6_uid134_fixedPointX_uid37_fpSinPiTest_q;

	--reg_leftShiftStage2Idx3_uid217_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_5(REG,374)@9
    reg_leftShiftStage2Idx3_uid217_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage2Idx3_uid217_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_5_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_leftShiftStage2Idx3_uid217_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_5_q <= leftShiftStage2Idx3_uid217_alignedZ_uid52_fpSinPiTest_q;
        END IF;
    END PROCESS;


	--LeftShiftStage174dto0_uid213_alignedZ_uid52_fpSinPiTest(BITSELECT,212)@9
    LeftShiftStage174dto0_uid213_alignedZ_uid52_fpSinPiTest_in <= leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_q(74 downto 0);
    LeftShiftStage174dto0_uid213_alignedZ_uid52_fpSinPiTest_b <= LeftShiftStage174dto0_uid213_alignedZ_uid52_fpSinPiTest_in(74 downto 0);

	--leftShiftStage2Idx2_uid214_alignedZ_uid52_fpSinPiTest(BITJOIN,213)@9
    leftShiftStage2Idx2_uid214_alignedZ_uid52_fpSinPiTest_q <= LeftShiftStage174dto0_uid213_alignedZ_uid52_fpSinPiTest_b & leftShiftStage2Idx2Pad4_uid131_fixedPointX_uid37_fpSinPiTest_q;

	--reg_leftShiftStage2Idx2_uid214_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_4(REG,375)@9
    reg_leftShiftStage2Idx2_uid214_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage2Idx2_uid214_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_4_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_leftShiftStage2Idx2_uid214_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_4_q <= leftShiftStage2Idx2_uid214_alignedZ_uid52_fpSinPiTest_q;
        END IF;
    END PROCESS;


	--LeftShiftStage176dto0_uid210_alignedZ_uid52_fpSinPiTest(BITSELECT,209)@9
    LeftShiftStage176dto0_uid210_alignedZ_uid52_fpSinPiTest_in <= leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_q(76 downto 0);
    LeftShiftStage176dto0_uid210_alignedZ_uid52_fpSinPiTest_b <= LeftShiftStage176dto0_uid210_alignedZ_uid52_fpSinPiTest_in(76 downto 0);

	--leftShiftStage2Idx1_uid211_alignedZ_uid52_fpSinPiTest(BITJOIN,210)@9
    leftShiftStage2Idx1_uid211_alignedZ_uid52_fpSinPiTest_q <= LeftShiftStage176dto0_uid210_alignedZ_uid52_fpSinPiTest_b & leftShiftStage2Idx1Pad2_uid128_fixedPointX_uid37_fpSinPiTest_q;

	--reg_leftShiftStage2Idx1_uid211_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_3(REG,376)@9
    reg_leftShiftStage2Idx1_uid211_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage2Idx1_uid211_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_3_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_leftShiftStage2Idx1_uid211_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_3_q <= leftShiftStage2Idx1_uid211_alignedZ_uid52_fpSinPiTest_q;
        END IF;
    END PROCESS;


	--reg_leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_2(REG,377)@9
    reg_leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_2_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_2_q <= leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_q;
        END IF;
    END PROCESS;


	--leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest(BITSELECT,217)@8
    leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_in <= r_uid186_lzcZ_uid51_fpSinPiTest_q(2 downto 0);
    leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_b <= leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_in(2 downto 1);

	--reg_leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_1(REG,373)@8
    reg_leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_1_q <= "00";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_1_q <= leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_b;
        END IF;
    END PROCESS;


	--ld_reg_leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_1_q_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_b(DELAY,657)@9
    ld_reg_leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_1_q_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_1_q, xout => ld_reg_leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_1_q_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_b_q, clk => clk, aclr => areset );

	--leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest(MUX,218)@10
    leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_s <= ld_reg_leftShiftStageSel2Dto1_uid218_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_1_q_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_b_q;
    leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest: PROCESS (leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_s, reg_leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_2_q, reg_leftShiftStage2Idx1_uid211_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_3_q, reg_leftShiftStage2Idx2_uid214_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_4_q, reg_leftShiftStage2Idx3_uid217_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_5_q)
    BEGIN
            CASE leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_s IS
                  WHEN "00" => leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_q <= reg_leftShiftStage1_uid208_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_2_q;
                  WHEN "01" => leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_q <= reg_leftShiftStage2Idx1_uid211_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_3_q;
                  WHEN "10" => leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_q <= reg_leftShiftStage2Idx2_uid214_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_4_q;
                  WHEN "11" => leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_q <= reg_leftShiftStage2Idx3_uid217_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_5_q;
                  WHEN OTHERS => leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest(BITSELECT,222)@8
    leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_in <= r_uid186_lzcZ_uid51_fpSinPiTest_q(0 downto 0);
    leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_b <= leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_in(0 downto 0);

	--reg_leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_1(REG,378)@8
    reg_leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_1_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_1_q <= leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_b;
        END IF;
    END PROCESS;


	--ld_reg_leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_1_q_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_b(DELAY,665)@9
    ld_reg_leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_1_q_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_1_q, xout => ld_reg_leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_1_q_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_b_q, clk => clk, aclr => areset );

	--leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest(MUX,223)@10
    leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_s <= ld_reg_leftShiftStageSel0Dto0_uid223_alignedZ_uid52_fpSinPiTest_0_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_1_q_to_leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_b_q;
    leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest: PROCESS (leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_s, leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_q, leftShiftStage3Idx1_uid222_alignedZ_uid52_fpSinPiTest_q)
    BEGIN
            CASE leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_s IS
                  WHEN "0" => leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_q <= leftShiftStage2_uid219_alignedZ_uid52_fpSinPiTest_q;
                  WHEN "1" => leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_q <= leftShiftStage3Idx1_uid222_alignedZ_uid52_fpSinPiTest_q;
                  WHEN OTHERS => leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--alignedZLow_uid53_fpSinPiTest(BITSELECT,52)@10
    alignedZLow_uid53_fpSinPiTest_in <= leftShiftStage3_uid224_alignedZ_uid52_fpSinPiTest_q;
    alignedZLow_uid53_fpSinPiTest_b <= alignedZLow_uid53_fpSinPiTest_in(78 downto 27);

	--pHardCase_uid54_fpSinPiTest(BITJOIN,53)@10
    pHardCase_uid54_fpSinPiTest_q <= alignedZLow_uid53_fpSinPiTest_b & GND_q;

	--ld_sinXIsX_uid30_fpSinPiTest_c_to_p_uid55_fpSinPiTest_b(DELAY,474)@0
    ld_sinXIsX_uid30_fpSinPiTest_c_to_p_uid55_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 10 )
    PORT MAP ( xin => sinXIsX_uid30_fpSinPiTest_c, xout => ld_sinXIsX_uid30_fpSinPiTest_c_to_p_uid55_fpSinPiTest_b_q, clk => clk, aclr => areset );

	--p_uid55_fpSinPiTest(MUX,54)@10
    p_uid55_fpSinPiTest_s <= ld_sinXIsX_uid30_fpSinPiTest_c_to_p_uid55_fpSinPiTest_b_q;
    p_uid55_fpSinPiTest: PROCESS (p_uid55_fpSinPiTest_s, pHardCase_uid54_fpSinPiTest_q, ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_outputreg_q)
    BEGIN
            CASE p_uid55_fpSinPiTest_s IS
                  WHEN "0" => p_uid55_fpSinPiTest_q <= pHardCase_uid54_fpSinPiTest_q;
                  WHEN "1" => p_uid55_fpSinPiTest_q <= ld_oFracX_uid31_uid31_fpSinPiTest_q_to_p_uid55_fpSinPiTest_d_outputreg_q;
                  WHEN OTHERS => p_uid55_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt(COUNTER,1121)
    -- every=1, low=0, high=22, step=1, init=1
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_i = 21 THEN
                  ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_eq <= '1';
                ELSE
                  ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_eq = '1') THEN
                    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_i <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_i - 22;
                ELSE
                    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_i <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_i,5));


	--ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdreg(REG,1122)
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdreg_q <= "00000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdreg_q <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdmux(MUX,1123)
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdmux_s <= VCC_q;
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdmux: PROCESS (ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdmux_s, ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdreg_q, ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdmux_q <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdreg_q;
                  WHEN "1" => ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdmux_q <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem(DUALMEM,1120)
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_reset0 <= areset;
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_ia <= p_uid55_fpSinPiTest_q;
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_aa <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdreg_q;
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_ab <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_rdmux_q;
    ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 53,
        widthad_a => 5,
        numwords_a => 23,
        width_b => 53,
        widthad_b => 5,
        numwords_b => 23,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_iq,
        address_a => ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_aa,
        data_a => ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_ia
    );
        ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_q <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_iq(52 downto 0);

	--mul2xSinRes_uid69_fpSinPiTest_a_1(BITSELECT,316)@34
    mul2xSinRes_uid69_fpSinPiTest_a_1_in <= STD_LOGIC_VECTOR("0" & ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_q);
    mul2xSinRes_uid69_fpSinPiTest_a_1_b <= mul2xSinRes_uid69_fpSinPiTest_a_1_in(53 downto 27);

	--reg_mul2xSinRes_uid69_fpSinPiTest_a_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b1_0(REG,424)@34
    reg_mul2xSinRes_uid69_fpSinPiTest_a_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_a_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b1_0_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_a_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b1_0_q <= mul2xSinRes_uid69_fpSinPiTest_a_1_b;
        END IF;
    END PROCESS;


	--mul2xSinRes_uid69_fpSinPiTest_a1_b1(MULT,322)@35
    mul2xSinRes_uid69_fpSinPiTest_a1_b1_pr <= UNSIGNED(mul2xSinRes_uid69_fpSinPiTest_a1_b1_a) * UNSIGNED(mul2xSinRes_uid69_fpSinPiTest_a1_b1_b);
    mul2xSinRes_uid69_fpSinPiTest_a1_b1_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a1_b1_a <= (others => '0');
            mul2xSinRes_uid69_fpSinPiTest_a1_b1_b <= (others => '0');
            mul2xSinRes_uid69_fpSinPiTest_a1_b1_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a1_b1_a <= reg_mul2xSinRes_uid69_fpSinPiTest_a_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b1_0_q;
            mul2xSinRes_uid69_fpSinPiTest_a1_b1_b <= reg_mul2xSinRes_uid69_fpSinPiTest_b_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b1_1_q;
            mul2xSinRes_uid69_fpSinPiTest_a1_b1_s1 <= STD_LOGIC_VECTOR(mul2xSinRes_uid69_fpSinPiTest_a1_b1_pr);
        END IF;
    END PROCESS;
    mul2xSinRes_uid69_fpSinPiTest_a1_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a1_b1_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a1_b1_q <= mul2xSinRes_uid69_fpSinPiTest_a1_b1_s1;
        END IF;
    END PROCESS;

	--mul2xSinRes_uid69_fpSinPiTest_LSB_a1_b1(BITSELECT,329)@38
    mul2xSinRes_uid69_fpSinPiTest_LSB_a1_b1_in <= mul2xSinRes_uid69_fpSinPiTest_a1_b1_q(26 downto 0);
    mul2xSinRes_uid69_fpSinPiTest_LSB_a1_b1_b <= mul2xSinRes_uid69_fpSinPiTest_LSB_a1_b1_in(26 downto 0);

	--reg_mul2xSinRes_uid69_fpSinPiTest_b_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b1_1(REG,425)@34
    reg_mul2xSinRes_uid69_fpSinPiTest_b_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_b_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b1_1_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_b_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b1_1_q <= mul2xSinRes_uid69_fpSinPiTest_b_1_b;
        END IF;
    END PROCESS;


	--mul2xSinRes_uid69_fpSinPiTest_a_0(BITSELECT,315)@34
    mul2xSinRes_uid69_fpSinPiTest_a_0_in <= ld_p_uid55_fpSinPiTest_q_to_mul2xSinRes_uid69_fpSinPiTest_a_0_a_replace_mem_q(26 downto 0);
    mul2xSinRes_uid69_fpSinPiTest_a_0_b <= mul2xSinRes_uid69_fpSinPiTest_a_0_in(26 downto 0);

	--reg_mul2xSinRes_uid69_fpSinPiTest_a_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b1_0(REG,426)@34
    reg_mul2xSinRes_uid69_fpSinPiTest_a_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_a_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b1_0_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_a_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b1_0_q <= mul2xSinRes_uid69_fpSinPiTest_a_0_b;
        END IF;
    END PROCESS;


	--mul2xSinRes_uid69_fpSinPiTest_a0_b1(MULT,321)@35
    mul2xSinRes_uid69_fpSinPiTest_a0_b1_pr <= UNSIGNED(mul2xSinRes_uid69_fpSinPiTest_a0_b1_a) * UNSIGNED(mul2xSinRes_uid69_fpSinPiTest_a0_b1_b);
    mul2xSinRes_uid69_fpSinPiTest_a0_b1_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a0_b1_a <= (others => '0');
            mul2xSinRes_uid69_fpSinPiTest_a0_b1_b <= (others => '0');
            mul2xSinRes_uid69_fpSinPiTest_a0_b1_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a0_b1_a <= reg_mul2xSinRes_uid69_fpSinPiTest_a_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b1_0_q;
            mul2xSinRes_uid69_fpSinPiTest_a0_b1_b <= reg_mul2xSinRes_uid69_fpSinPiTest_b_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b1_1_q;
            mul2xSinRes_uid69_fpSinPiTest_a0_b1_s1 <= STD_LOGIC_VECTOR(mul2xSinRes_uid69_fpSinPiTest_a0_b1_pr);
        END IF;
    END PROCESS;
    mul2xSinRes_uid69_fpSinPiTest_a0_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a0_b1_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a0_b1_q <= mul2xSinRes_uid69_fpSinPiTest_a0_b1_s1;
        END IF;
    END PROCESS;

	--mul2xSinRes_uid69_fpSinPiTest_LSB_a0_b1(BITSELECT,327)@38
    mul2xSinRes_uid69_fpSinPiTest_LSB_a0_b1_in <= mul2xSinRes_uid69_fpSinPiTest_a0_b1_q(26 downto 0);
    mul2xSinRes_uid69_fpSinPiTest_LSB_a0_b1_b <= mul2xSinRes_uid69_fpSinPiTest_LSB_a0_b1_in(26 downto 0);

	--mul2xSinRes_uid69_fpSinPiTest_zero_36(CONSTANT,332)
    mul2xSinRes_uid69_fpSinPiTest_zero_36_q <= "000000000000000000000000000";

	--mul2xSinRes_uid69_fpSinPiTest_joined_BJ_2(BITJOIN,336)@38
    mul2xSinRes_uid69_fpSinPiTest_joined_BJ_2_q <= mul2xSinRes_uid69_fpSinPiTest_zero_36_q & mul2xSinRes_uid69_fpSinPiTest_LSB_a1_b1_b & mul2xSinRes_uid69_fpSinPiTest_LSB_a0_b1_b & mul2xSinRes_uid69_fpSinPiTest_zero_36_q;

	--mul2xSinRes_uid69_fpSinPiTest_MSB_a0_b1(BITSELECT,328)@38
    mul2xSinRes_uid69_fpSinPiTest_MSB_a0_b1_in <= mul2xSinRes_uid69_fpSinPiTest_a0_b1_q;
    mul2xSinRes_uid69_fpSinPiTest_MSB_a0_b1_b <= mul2xSinRes_uid69_fpSinPiTest_MSB_a0_b1_in(53 downto 27);

	--mul2xSinRes_uid69_fpSinPiTest_b_0(BITSELECT,317)@34
    mul2xSinRes_uid69_fpSinPiTest_b_0_in <= multRightOp_uid68_fpSinPiTest_q(26 downto 0);
    mul2xSinRes_uid69_fpSinPiTest_b_0_b <= mul2xSinRes_uid69_fpSinPiTest_b_0_in(26 downto 0);

	--reg_mul2xSinRes_uid69_fpSinPiTest_b_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b0_1(REG,421)@34
    reg_mul2xSinRes_uid69_fpSinPiTest_b_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_b_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b0_1_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_b_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b0_1_q <= mul2xSinRes_uid69_fpSinPiTest_b_0_b;
        END IF;
    END PROCESS;


	--reg_mul2xSinRes_uid69_fpSinPiTest_a_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b0_0(REG,422)@34
    reg_mul2xSinRes_uid69_fpSinPiTest_a_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_a_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b0_0_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_a_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b0_0_q <= mul2xSinRes_uid69_fpSinPiTest_a_1_b;
        END IF;
    END PROCESS;


	--mul2xSinRes_uid69_fpSinPiTest_a1_b0(MULT,320)@35
    mul2xSinRes_uid69_fpSinPiTest_a1_b0_pr <= UNSIGNED(mul2xSinRes_uid69_fpSinPiTest_a1_b0_a) * UNSIGNED(mul2xSinRes_uid69_fpSinPiTest_a1_b0_b);
    mul2xSinRes_uid69_fpSinPiTest_a1_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a1_b0_a <= (others => '0');
            mul2xSinRes_uid69_fpSinPiTest_a1_b0_b <= (others => '0');
            mul2xSinRes_uid69_fpSinPiTest_a1_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a1_b0_a <= reg_mul2xSinRes_uid69_fpSinPiTest_a_1_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b0_0_q;
            mul2xSinRes_uid69_fpSinPiTest_a1_b0_b <= reg_mul2xSinRes_uid69_fpSinPiTest_b_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a1_b0_1_q;
            mul2xSinRes_uid69_fpSinPiTest_a1_b0_s1 <= STD_LOGIC_VECTOR(mul2xSinRes_uid69_fpSinPiTest_a1_b0_pr);
        END IF;
    END PROCESS;
    mul2xSinRes_uid69_fpSinPiTest_a1_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a1_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a1_b0_q <= mul2xSinRes_uid69_fpSinPiTest_a1_b0_s1;
        END IF;
    END PROCESS;

	--mul2xSinRes_uid69_fpSinPiTest_LSB_a1_b0(BITSELECT,325)@38
    mul2xSinRes_uid69_fpSinPiTest_LSB_a1_b0_in <= mul2xSinRes_uid69_fpSinPiTest_a1_b0_q(26 downto 0);
    mul2xSinRes_uid69_fpSinPiTest_LSB_a1_b0_b <= mul2xSinRes_uid69_fpSinPiTest_LSB_a1_b0_in(26 downto 0);

	--mul2xSinRes_uid69_fpSinPiTest_joined_BJ_1(BITJOIN,335)@38
    mul2xSinRes_uid69_fpSinPiTest_joined_BJ_1_q <= mul2xSinRes_uid69_fpSinPiTest_zero_36_q & mul2xSinRes_uid69_fpSinPiTest_MSB_a0_b1_b & mul2xSinRes_uid69_fpSinPiTest_LSB_a1_b0_b & mul2xSinRes_uid69_fpSinPiTest_zero_36_q;

	--mul2xSinRes_uid69_fpSinPiTest_32COMP0_andBC(LOGICAL,340)@38
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_andBC_a <= mul2xSinRes_uid69_fpSinPiTest_joined_BJ_1_q;
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_andBC_b <= mul2xSinRes_uid69_fpSinPiTest_joined_BJ_2_q;
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_andBC_q <= mul2xSinRes_uid69_fpSinPiTest_32COMP0_andBC_a and mul2xSinRes_uid69_fpSinPiTest_32COMP0_andBC_b;

	--mul2xSinRes_uid69_fpSinPiTest_MSB_a1_b1(BITSELECT,330)@38
    mul2xSinRes_uid69_fpSinPiTest_MSB_a1_b1_in <= mul2xSinRes_uid69_fpSinPiTest_a1_b1_q;
    mul2xSinRes_uid69_fpSinPiTest_MSB_a1_b1_b <= mul2xSinRes_uid69_fpSinPiTest_MSB_a1_b1_in(53 downto 27);

	--mul2xSinRes_uid69_fpSinPiTest_MSB_a1_b0(BITSELECT,326)@38
    mul2xSinRes_uid69_fpSinPiTest_MSB_a1_b0_in <= mul2xSinRes_uid69_fpSinPiTest_a1_b0_q;
    mul2xSinRes_uid69_fpSinPiTest_MSB_a1_b0_b <= mul2xSinRes_uid69_fpSinPiTest_MSB_a1_b0_in(53 downto 27);

	--reg_mul2xSinRes_uid69_fpSinPiTest_b_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b0_1(REG,419)@34
    reg_mul2xSinRes_uid69_fpSinPiTest_b_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_b_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b0_1_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_b_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b0_1_q <= mul2xSinRes_uid69_fpSinPiTest_b_0_b;
        END IF;
    END PROCESS;


	--reg_mul2xSinRes_uid69_fpSinPiTest_a_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b0_0(REG,420)@34
    reg_mul2xSinRes_uid69_fpSinPiTest_a_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_a_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b0_0_q <= "000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_mul2xSinRes_uid69_fpSinPiTest_a_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b0_0_q <= mul2xSinRes_uid69_fpSinPiTest_a_0_b;
        END IF;
    END PROCESS;


	--mul2xSinRes_uid69_fpSinPiTest_a0_b0(MULT,319)@35
    mul2xSinRes_uid69_fpSinPiTest_a0_b0_pr <= UNSIGNED(mul2xSinRes_uid69_fpSinPiTest_a0_b0_a) * UNSIGNED(mul2xSinRes_uid69_fpSinPiTest_a0_b0_b);
    mul2xSinRes_uid69_fpSinPiTest_a0_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a0_b0_a <= (others => '0');
            mul2xSinRes_uid69_fpSinPiTest_a0_b0_b <= (others => '0');
            mul2xSinRes_uid69_fpSinPiTest_a0_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a0_b0_a <= reg_mul2xSinRes_uid69_fpSinPiTest_a_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b0_0_q;
            mul2xSinRes_uid69_fpSinPiTest_a0_b0_b <= reg_mul2xSinRes_uid69_fpSinPiTest_b_0_0_to_mul2xSinRes_uid69_fpSinPiTest_a0_b0_1_q;
            mul2xSinRes_uid69_fpSinPiTest_a0_b0_s1 <= STD_LOGIC_VECTOR(mul2xSinRes_uid69_fpSinPiTest_a0_b0_pr);
        END IF;
    END PROCESS;
    mul2xSinRes_uid69_fpSinPiTest_a0_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a0_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_a0_b0_q <= mul2xSinRes_uid69_fpSinPiTest_a0_b0_s1;
        END IF;
    END PROCESS;

	--mul2xSinRes_uid69_fpSinPiTest_MSB_a0_b0(BITSELECT,324)@38
    mul2xSinRes_uid69_fpSinPiTest_MSB_a0_b0_in <= mul2xSinRes_uid69_fpSinPiTest_a0_b0_q;
    mul2xSinRes_uid69_fpSinPiTest_MSB_a0_b0_b <= mul2xSinRes_uid69_fpSinPiTest_MSB_a0_b0_in(53 downto 27);

	--mul2xSinRes_uid69_fpSinPiTest_LSB_a0_b0(BITSELECT,323)@38
    mul2xSinRes_uid69_fpSinPiTest_LSB_a0_b0_in <= mul2xSinRes_uid69_fpSinPiTest_a0_b0_q(26 downto 0);
    mul2xSinRes_uid69_fpSinPiTest_LSB_a0_b0_b <= mul2xSinRes_uid69_fpSinPiTest_LSB_a0_b0_in(26 downto 0);

	--mul2xSinRes_uid69_fpSinPiTest_joined_BJ_0(BITJOIN,334)@38
    mul2xSinRes_uid69_fpSinPiTest_joined_BJ_0_q <= mul2xSinRes_uid69_fpSinPiTest_MSB_a1_b1_b & mul2xSinRes_uid69_fpSinPiTest_MSB_a1_b0_b & mul2xSinRes_uid69_fpSinPiTest_MSB_a0_b0_b & mul2xSinRes_uid69_fpSinPiTest_LSB_a0_b0_b;

	--mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAC(LOGICAL,339)@38
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAC_a <= mul2xSinRes_uid69_fpSinPiTest_joined_BJ_0_q;
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAC_b <= mul2xSinRes_uid69_fpSinPiTest_joined_BJ_2_q;
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAC_q <= mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAC_a and mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAC_b;

	--mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAB(LOGICAL,338)@38
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAB_a <= mul2xSinRes_uid69_fpSinPiTest_joined_BJ_0_q;
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAB_b <= mul2xSinRes_uid69_fpSinPiTest_joined_BJ_1_q;
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAB_q <= mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAB_a and mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAB_b;

	--mul2xSinRes_uid69_fpSinPiTest_32COMP0_orOne(LOGICAL,341)@38
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_orOne_a <= mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAB_q;
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_orOne_b <= mul2xSinRes_uid69_fpSinPiTest_32COMP0_andAC_q;
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_orOne_c <= mul2xSinRes_uid69_fpSinPiTest_32COMP0_andBC_q;
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_orOne_q <= mul2xSinRes_uid69_fpSinPiTest_32COMP0_orOne_a or mul2xSinRes_uid69_fpSinPiTest_32COMP0_orOne_b or mul2xSinRes_uid69_fpSinPiTest_32COMP0_orOne_c;

	--mul2xSinRes_uid69_fpSinPiTest_comp_0_out1_lsb_BS(BITSELECT,342)@38
    mul2xSinRes_uid69_fpSinPiTest_comp_0_out1_lsb_BS_in <= mul2xSinRes_uid69_fpSinPiTest_32COMP0_orOne_q(106 downto 0);
    mul2xSinRes_uid69_fpSinPiTest_comp_0_out1_lsb_BS_b <= mul2xSinRes_uid69_fpSinPiTest_comp_0_out1_lsb_BS_in(106 downto 0);

	--mul2xSinRes_uid69_fpSinPiTest_comp_0_out1_BJ(BITJOIN,343)@38
    mul2xSinRes_uid69_fpSinPiTest_comp_0_out1_BJ_q <= mul2xSinRes_uid69_fpSinPiTest_comp_0_out1_lsb_BS_b & GND_q;

	--mul2xSinRes_uid69_fpSinPiTest_ADD_BitExpansion_for_b(BITJOIN,350)@38
    mul2xSinRes_uid69_fpSinPiTest_ADD_BitExpansion_for_b_q <= GND_q & mul2xSinRes_uid69_fpSinPiTest_comp_0_out1_BJ_q;

	--mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b(BITSELECT,353)@38
    mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_in <= mul2xSinRes_uid69_fpSinPiTest_ADD_BitExpansion_for_b_q;
    mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_b <= mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_in(88 downto 0);
    mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_c <= mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_in(108 downto 89);

	--mul2xSinRes_uid69_fpSinPiTest_32COMP0_xorOne(LOGICAL,337)@38
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_xorOne_a <= mul2xSinRes_uid69_fpSinPiTest_joined_BJ_0_q;
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_xorOne_b <= mul2xSinRes_uid69_fpSinPiTest_joined_BJ_1_q;
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_xorOne_c <= mul2xSinRes_uid69_fpSinPiTest_joined_BJ_2_q;
    mul2xSinRes_uid69_fpSinPiTest_32COMP0_xorOne_q <= mul2xSinRes_uid69_fpSinPiTest_32COMP0_xorOne_a xor mul2xSinRes_uid69_fpSinPiTest_32COMP0_xorOne_b xor mul2xSinRes_uid69_fpSinPiTest_32COMP0_xorOne_c;

	--mul2xSinRes_uid69_fpSinPiTest_ADD_BitExpansion_for_a(BITJOIN,348)@38
    mul2xSinRes_uid69_fpSinPiTest_ADD_BitExpansion_for_a_q <= GND_q & mul2xSinRes_uid69_fpSinPiTest_32COMP0_xorOne_q;

	--mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a(BITSELECT,352)@38
    mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_in <= mul2xSinRes_uid69_fpSinPiTest_ADD_BitExpansion_for_a_q;
    mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_b <= mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_in(88 downto 0);
    mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_c <= mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_in(108 downto 89);

	--mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2(ADD,354)@38
    mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_cin <= GND_q;
    mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_a <= STD_LOGIC_VECTOR("0" & mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_b) & '1';
    mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_b <= STD_LOGIC_VECTOR("0" & mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_b) & mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_cin(0);
    mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_a) + UNSIGNED(mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_b));
        END IF;
    END PROCESS;
    mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_c(0) <= mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_o(90);
    mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_q <= mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_o(89 downto 1);


	--ld_mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_c_to_mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_b(DELAY,822)@38
    ld_mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_c_to_mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_b : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_c, xout => ld_mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_c_to_mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_b_q, clk => clk, aclr => areset );

	--ld_mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_c_to_mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_a(DELAY,821)@38
    ld_mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_c_to_mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_a : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_c, xout => ld_mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_c_to_mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_a_q, clk => clk, aclr => areset );

	--mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2(ADD,355)@39
    mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_cin <= mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_c;
    mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_a <= STD_LOGIC_VECTOR("0" & ld_mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_a_c_to_mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_a_q) & '1';
    mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_b <= STD_LOGIC_VECTOR("0" & ld_mul2xSinRes_uid69_fpSinPiTest_ADD_BitSelect_for_b_c_to_mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_b_q) & mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_cin(0);
    mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_a) + UNSIGNED(mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_b));
        END IF;
    END PROCESS;
    mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_q <= mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_o(20 downto 1);


	--ld_mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_q_to_mul2xSinRes_uid69_fpSinPiTest_ADD_BitJoin_for_q_a(DELAY,824)@39
    ld_mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_q_to_mul2xSinRes_uid69_fpSinPiTest_ADD_BitJoin_for_q_a : dspba_delay
    GENERIC MAP ( width => 89, depth => 1 )
    PORT MAP ( xin => mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_q, xout => ld_mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_q_to_mul2xSinRes_uid69_fpSinPiTest_ADD_BitJoin_for_q_a_q, clk => clk, aclr => areset );

	--mul2xSinRes_uid69_fpSinPiTest_ADD_BitJoin_for_q(BITJOIN,356)@40
    mul2xSinRes_uid69_fpSinPiTest_ADD_BitJoin_for_q_q <= mul2xSinRes_uid69_fpSinPiTest_ADD_p2_of_2_q & ld_mul2xSinRes_uid69_fpSinPiTest_ADD_p1_of_2_q_to_mul2xSinRes_uid69_fpSinPiTest_ADD_BitJoin_for_q_a_q;

	--normBit_uid70_fpSinPiTest(BITSELECT,69)@40
    normBit_uid70_fpSinPiTest_in <= mul2xSinRes_uid69_fpSinPiTest_ADD_BitJoin_for_q_q(106 downto 0);
    normBit_uid70_fpSinPiTest_b <= normBit_uid70_fpSinPiTest_in(106 downto 106);

	--ld_normBit_uid70_fpSinPiTest_b_to_rndExpUpdate_uid75_uid76_fpSinPiTest_c(DELAY,497)@40
    ld_normBit_uid70_fpSinPiTest_b_to_rndExpUpdate_uid75_uid76_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => normBit_uid70_fpSinPiTest_b, xout => ld_normBit_uid70_fpSinPiTest_b_to_rndExpUpdate_uid75_uid76_fpSinPiTest_c_q, clk => clk, aclr => areset );

	--rndExpUpdate_uid75_uid76_fpSinPiTest(BITJOIN,75)@41
    rndExpUpdate_uid75_uid76_fpSinPiTest_q <= ld_normBit_uid70_fpSinPiTest_b_to_rndExpUpdate_uid75_uid76_fpSinPiTest_c_q & cstAllZWF_uid10_fpSinPiTest_q & VCC_q;

	--ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_nor(LOGICAL,976)
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_nor_b <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_sticky_ena_q;
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_nor_q <= not (ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_nor_a or ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_nor_b);

	--ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_mem_top(CONSTANT,972)
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_mem_top_q <= "011100";

	--ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmp(LOGICAL,973)
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmp_a <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_mem_top_q;
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdmux_q);
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmp_q <= "1" when ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmp_a = ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmp_b else "0";

	--ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmpReg(REG,974)
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmpReg_q <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmp_q;
        END IF;
    END PROCESS;


	--ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_sticky_ena(REG,977)
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_nor_q = "1") THEN
                ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_sticky_ena_q <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_enaAnd(LOGICAL,978)
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_enaAnd_a <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_sticky_ena_q;
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_enaAnd_b <= VCC_q;
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_enaAnd_q <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_enaAnd_a and ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_enaAnd_b;

	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem(DUALMEM,941)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_reset0 <= areset;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_ia <= expX_uid6_fpSinPiTest_b;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_aa <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdreg_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_ab <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_rdmux_q;
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 11,
        widthad_b => 3,
        numwords_b => 7,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_iq,
        address_a => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_aa,
        data_a => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_ia
    );
        ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_q <= ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_iq(10 downto 0);

	--ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_outputreg(DELAY,940)
    ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_outputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1 )
    PORT MAP ( xin => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_replace_mem_q, xout => ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_outputreg_q, clk => clk, aclr => areset );

	--expXP1_uid58_fpSinPiTest(ADD,57)@9
    expXP1_uid58_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & ld_expX_uid6_fpSinPiTest_b_to_expXP1_uid58_fpSinPiTest_a_outputreg_q);
    expXP1_uid58_fpSinPiTest_b <= STD_LOGIC_VECTOR("00000000000" & VCC_q);
            expXP1_uid58_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXP1_uid58_fpSinPiTest_a) + UNSIGNED(expXP1_uid58_fpSinPiTest_b));
    expXP1_uid58_fpSinPiTest_q <= expXP1_uid58_fpSinPiTest_o(11 downto 0);


	--expXP1R_uid59_fpSinPiTest(BITSELECT,58)@9
    expXP1R_uid59_fpSinPiTest_in <= expXP1_uid58_fpSinPiTest_q(10 downto 0);
    expXP1R_uid59_fpSinPiTest_b <= expXP1R_uid59_fpSinPiTest_in(10 downto 0);

	--reg_r_uid186_lzcZ_uid51_fpSinPiTest_0_to_expHardCase_uid57_fpSinPiTest_1(REG,427)@8
    reg_r_uid186_lzcZ_uid51_fpSinPiTest_0_to_expHardCase_uid57_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_r_uid186_lzcZ_uid51_fpSinPiTest_0_to_expHardCase_uid57_fpSinPiTest_1_q <= "0000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_r_uid186_lzcZ_uid51_fpSinPiTest_0_to_expHardCase_uid57_fpSinPiTest_1_q <= r_uid186_lzcZ_uid51_fpSinPiTest_q;
        END IF;
    END PROCESS;


	--expHardCase_uid57_fpSinPiTest(SUB,56)@9
    expHardCase_uid57_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & biasM1_uid27_fpSinPiTest_q);
    expHardCase_uid57_fpSinPiTest_b <= STD_LOGIC_VECTOR("00000" & reg_r_uid186_lzcZ_uid51_fpSinPiTest_0_to_expHardCase_uid57_fpSinPiTest_1_q);
            expHardCase_uid57_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expHardCase_uid57_fpSinPiTest_a) - UNSIGNED(expHardCase_uid57_fpSinPiTest_b));
    expHardCase_uid57_fpSinPiTest_q <= expHardCase_uid57_fpSinPiTest_o(11 downto 0);


	--expHardCaseR_uid60_fpSinPiTest(BITSELECT,59)@9
    expHardCaseR_uid60_fpSinPiTest_in <= expHardCase_uid57_fpSinPiTest_q(10 downto 0);
    expHardCaseR_uid60_fpSinPiTest_b <= expHardCaseR_uid60_fpSinPiTest_in(10 downto 0);

	--ld_sinXIsX_uid30_fpSinPiTest_c_to_expP_uid61_fpSinPiTest_b(DELAY,481)@0
    ld_sinXIsX_uid30_fpSinPiTest_c_to_expP_uid61_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 9 )
    PORT MAP ( xin => sinXIsX_uid30_fpSinPiTest_c, xout => ld_sinXIsX_uid30_fpSinPiTest_c_to_expP_uid61_fpSinPiTest_b_q, clk => clk, aclr => areset );

	--expP_uid61_fpSinPiTest(MUX,60)@9
    expP_uid61_fpSinPiTest_s <= ld_sinXIsX_uid30_fpSinPiTest_c_to_expP_uid61_fpSinPiTest_b_q;
    expP_uid61_fpSinPiTest: PROCESS (expP_uid61_fpSinPiTest_s, expHardCaseR_uid60_fpSinPiTest_b, expXP1R_uid59_fpSinPiTest_b)
    BEGIN
            CASE expP_uid61_fpSinPiTest_s IS
                  WHEN "0" => expP_uid61_fpSinPiTest_q <= expHardCaseR_uid60_fpSinPiTest_b;
                  WHEN "1" => expP_uid61_fpSinPiTest_q <= expXP1R_uid59_fpSinPiTest_b;
                  WHEN OTHERS => expP_uid61_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt(COUNTER,968)
    -- every=1, low=0, high=28, step=1, init=1
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_i = 27 THEN
                  ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_eq <= '1';
                ELSE
                  ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_eq = '1') THEN
                    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_i <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_i - 28;
                ELSE
                    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_i <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_i,5));


	--ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdreg(REG,969)
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdreg_q <= "00000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdreg_q <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdmux(MUX,970)
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdmux_s <= VCC_q;
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdmux: PROCESS (ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdmux_s, ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdreg_q, ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdmux_q <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdmux_q <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem(DUALMEM,967)
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_reset0 <= areset;
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_ia <= expP_uid61_fpSinPiTest_q;
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_aa <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdreg_q;
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_ab <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_rdmux_q;
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 5,
        numwords_a => 29,
        width_b => 11,
        widthad_b => 5,
        numwords_b => 29,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_iq,
        address_a => ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_aa,
        data_a => ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_ia
    );
        ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_q <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_iq(10 downto 0);

	--ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_outputreg(DELAY,966)
    ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_outputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1 )
    PORT MAP ( xin => ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_replace_mem_q, xout => ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_outputreg_q, clk => clk, aclr => areset );

	--highRes_uid71_fpSinPiTest(BITSELECT,70)@40
    highRes_uid71_fpSinPiTest_in <= mul2xSinRes_uid69_fpSinPiTest_ADD_BitJoin_for_q_q(105 downto 0);
    highRes_uid71_fpSinPiTest_b <= highRes_uid71_fpSinPiTest_in(105 downto 53);

	--lowRes_uid72_fpSinPiTest(BITSELECT,71)@40
    lowRes_uid72_fpSinPiTest_in <= mul2xSinRes_uid69_fpSinPiTest_ADD_BitJoin_for_q_q(104 downto 0);
    lowRes_uid72_fpSinPiTest_b <= lowRes_uid72_fpSinPiTest_in(104 downto 52);

	--fracRCompPreRnd_uid73_fpSinPiTest(MUX,72)@40
    fracRCompPreRnd_uid73_fpSinPiTest_s <= normBit_uid70_fpSinPiTest_b;
    fracRCompPreRnd_uid73_fpSinPiTest: PROCESS (fracRCompPreRnd_uid73_fpSinPiTest_s, lowRes_uid72_fpSinPiTest_b, highRes_uid71_fpSinPiTest_b)
    BEGIN
            CASE fracRCompPreRnd_uid73_fpSinPiTest_s IS
                  WHEN "0" => fracRCompPreRnd_uid73_fpSinPiTest_q <= lowRes_uid72_fpSinPiTest_b;
                  WHEN "1" => fracRCompPreRnd_uid73_fpSinPiTest_q <= highRes_uid71_fpSinPiTest_b;
                  WHEN OTHERS => fracRCompPreRnd_uid73_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracPreRnd_uid74_uid74_fpSinPiTest(BITJOIN,73)@40
    expFracPreRnd_uid74_uid74_fpSinPiTest_q <= ld_expP_uid61_fpSinPiTest_q_to_expFracPreRnd_uid74_uid74_fpSinPiTest_b_outputreg_q & fracRCompPreRnd_uid73_fpSinPiTest_q;

	--reg_expFracPreRnd_uid74_uid74_fpSinPiTest_0_to_expFracComp_uid77_fpSinPiTest_0(REG,428)@40
    reg_expFracPreRnd_uid74_uid74_fpSinPiTest_0_to_expFracComp_uid77_fpSinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracPreRnd_uid74_uid74_fpSinPiTest_0_to_expFracComp_uid77_fpSinPiTest_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_expFracPreRnd_uid74_uid74_fpSinPiTest_0_to_expFracComp_uid77_fpSinPiTest_0_q <= expFracPreRnd_uid74_uid74_fpSinPiTest_q;
        END IF;
    END PROCESS;


	--expFracComp_uid77_fpSinPiTest(ADD,76)@41
    expFracComp_uid77_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & reg_expFracPreRnd_uid74_uid74_fpSinPiTest_0_to_expFracComp_uid77_fpSinPiTest_0_q);
    expFracComp_uid77_fpSinPiTest_b <= STD_LOGIC_VECTOR("00000000000" & rndExpUpdate_uid75_uid76_fpSinPiTest_q);
            expFracComp_uid77_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracComp_uid77_fpSinPiTest_a) + UNSIGNED(expFracComp_uid77_fpSinPiTest_b));
    expFracComp_uid77_fpSinPiTest_q <= expFracComp_uid77_fpSinPiTest_o(64 downto 0);


	--expRComp_uid79_fpSinPiTest(BITSELECT,78)@41
    expRComp_uid79_fpSinPiTest_in <= expFracComp_uid77_fpSinPiTest_q(63 downto 0);
    expRComp_uid79_fpSinPiTest_b <= expRComp_uid79_fpSinPiTest_in(63 downto 53);

	--ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_nor(LOGICAL,1015)
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_nor_b <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_sticky_ena_q;
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_nor_q <= not (ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_nor_a or ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_nor_b);

	--ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_mem_top(CONSTANT,1011)
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_mem_top_q <= "0100010";

	--ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmp(LOGICAL,1012)
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmp_a <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_mem_top_q;
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdmux_q);
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmp_q <= "1" when ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmp_a = ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmp_b else "0";

	--ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmpReg(REG,1013)
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmpReg_q <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmp_q;
        END IF;
    END PROCESS;


	--ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_sticky_ena(REG,1016)
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_nor_q = "1") THEN
                ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_sticky_ena_q <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_enaAnd(LOGICAL,1017)
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_enaAnd_a <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_sticky_ena_q;
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_enaAnd_b <= VCC_q;
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_enaAnd_q <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_enaAnd_a and ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_enaAnd_b;

	--reg_xIsInt_uid83_fpSinPiTest_0_to_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_1(REG,429)@2
    reg_xIsInt_uid83_fpSinPiTest_0_to_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xIsInt_uid83_fpSinPiTest_0_to_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_1_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_xIsInt_uid83_fpSinPiTest_0_to_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_1_q <= xIsInt_uid83_fpSinPiTest_q;
        END IF;
    END PROCESS;


	--ld_And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_q_to_excRZero_uid87_fpSinPiTest_c(DELAY,516)@0
    ld_And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_q_to_excRZero_uid87_fpSinPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_q, xout => ld_And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_q_to_excRZero_uid87_fpSinPiTest_c_q, clk => clk, aclr => areset );

	--ld_expXIsZero_uid15_fpSinPiTest_q_to_excRZero_uid87_fpSinPiTest_b(DELAY,515)@0
    ld_expXIsZero_uid15_fpSinPiTest_q_to_excRZero_uid87_fpSinPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => expXIsZero_uid15_fpSinPiTest_q, xout => ld_expXIsZero_uid15_fpSinPiTest_q_to_excRZero_uid87_fpSinPiTest_b_q, clk => clk, aclr => areset );

	--reg_xIsInt_uid83_fpSinPiTest_0_to_excRZero_uid87_fpSinPiTest_0(REG,361)@2
    reg_xIsInt_uid83_fpSinPiTest_0_to_excRZero_uid87_fpSinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xIsInt_uid83_fpSinPiTest_0_to_excRZero_uid87_fpSinPiTest_0_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_xIsInt_uid83_fpSinPiTest_0_to_excRZero_uid87_fpSinPiTest_0_q <= xIsInt_uid83_fpSinPiTest_q;
        END IF;
    END PROCESS;


	--excRZero_uid87_fpSinPiTest(LOGICAL,86)@3
    excRZero_uid87_fpSinPiTest_a <= reg_xIsInt_uid83_fpSinPiTest_0_to_excRZero_uid87_fpSinPiTest_0_q;
    excRZero_uid87_fpSinPiTest_b <= ld_expXIsZero_uid15_fpSinPiTest_q_to_excRZero_uid87_fpSinPiTest_b_q;
    excRZero_uid87_fpSinPiTest_c <= ld_And2ExpXIsMaxFracXIsZero_uid18_fpSinPiTest_q_to_excRZero_uid87_fpSinPiTest_c_q;
    excRZero_uid87_fpSinPiTest_q <= excRZero_uid87_fpSinPiTest_a or excRZero_uid87_fpSinPiTest_b or excRZero_uid87_fpSinPiTest_c;

	--Or2ExcRZeroXIsInt_uid92_fpSinPiTest(LOGICAL,91)@3
    Or2ExcRZeroXIsInt_uid92_fpSinPiTest_a <= excRZero_uid87_fpSinPiTest_q;
    Or2ExcRZeroXIsInt_uid92_fpSinPiTest_b <= reg_xIsInt_uid83_fpSinPiTest_0_to_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_1_q;
    Or2ExcRZeroXIsInt_uid92_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q <= Or2ExcRZeroXIsInt_uid92_fpSinPiTest_a or Or2ExcRZeroXIsInt_uid92_fpSinPiTest_b;
        END IF;
    END PROCESS;



	--ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt(COUNTER,1007)
    -- every=1, low=0, high=34, step=1, init=1
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_i = 33 THEN
                  ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_eq <= '1';
                ELSE
                  ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_eq = '1') THEN
                    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_i <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_i - 34;
                ELSE
                    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_i <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_i,6));


	--ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdreg(REG,1008)
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdreg_q <= "000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdreg_q <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdmux(MUX,1009)
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdmux_s <= VCC_q;
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdmux: PROCESS (ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdmux_s, ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdreg_q, ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdmux_q <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdmux_q <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem(DUALMEM,1006)
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_reset0 <= areset;
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_ia <= Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q;
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_aa <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdreg_q;
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_ab <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_rdmux_q;
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 35,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 35,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_iq,
        address_a => ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_aa,
        data_a => ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_ia
    );
        ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_q <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_iq(0 downto 0);

	--ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_outputreg(DELAY,1005)
    ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_outputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_replace_mem_q, xout => ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_outputreg_q, clk => clk, aclr => areset );

	--expRPostExc1_uid95_fpSinPiTest(MUX,94)@41
    expRPostExc1_uid95_fpSinPiTest_s <= ld_Or2ExcRZeroXIsInt_uid92_fpSinPiTest_q_to_expRPostExc1_uid95_fpSinPiTest_b_outputreg_q;
    expRPostExc1_uid95_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostExc1_uid95_fpSinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE expRPostExc1_uid95_fpSinPiTest_s IS
                      WHEN "0" => expRPostExc1_uid95_fpSinPiTest_q <= expRComp_uid79_fpSinPiTest_b;
                      WHEN "1" => expRPostExc1_uid95_fpSinPiTest_q <= cstAllZWE_uid11_fpSinPiTest_q;
                      WHEN OTHERS => expRPostExc1_uid95_fpSinPiTest_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--InvXIntExp_uid84_fpSinPiTest(LOGICAL,83)@2
    InvXIntExp_uid84_fpSinPiTest_a <= ld_xIntExp_uid26_fpSinPiTest_c_to_Or2XIntExpAnd2YIsZeroInvSinXIsX_uid82_fpSinPiTest_a_q;
    InvXIntExp_uid84_fpSinPiTest_q <= not InvXIntExp_uid84_fpSinPiTest_a;

	--join_uid42_fpSinPiTest(BITJOIN,41)@2
    join_uid42_fpSinPiTest_q <= VCC_q & ozz_uid41_fpSinPiTest_q;

	--reg_y_uid39_fpSinPiTest_0_to_yIsZero_uid43_fpSinPiTest_0(REG,359)@1
    reg_y_uid39_fpSinPiTest_0_to_yIsZero_uid43_fpSinPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_y_uid39_fpSinPiTest_0_to_yIsZero_uid43_fpSinPiTest_0_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_y_uid39_fpSinPiTest_0_to_yIsZero_uid43_fpSinPiTest_0_q <= y_uid39_fpSinPiTest_b;
        END IF;
    END PROCESS;


	--yIsZero_uid43_fpSinPiTest(LOGICAL,42)@2
    yIsZero_uid43_fpSinPiTest_a <= reg_y_uid39_fpSinPiTest_0_to_yIsZero_uid43_fpSinPiTest_0_q;
    yIsZero_uid43_fpSinPiTest_b <= join_uid42_fpSinPiTest_q;
    yIsZero_uid43_fpSinPiTest_q <= "1" when yIsZero_uid43_fpSinPiTest_a = yIsZero_uid43_fpSinPiTest_b else "0";

	--And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest(LOGICAL,85)@2
    And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_a <= And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXIsMax_uid25_fpSinPiTest_q;
    And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_b <= yIsZero_uid43_fpSinPiTest_q;
    And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_c <= InvSinXIsX_uid80_fpSinPiTest_q;
    And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_d <= InvXIntExp_uid84_fpSinPiTest_q;
    And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_q <= And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_a and And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_b and And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_c and And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_d;

	--Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest(LOGICAL,95)@1
    Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest_a <= GND_q;
    Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest_b <= And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q;
    Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest_q <= Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest_a or Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest_b;

	--ld_Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest_q_to_join_uid97_fpSinPiTest_a(DELAY,528)@1
    ld_Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest_q_to_join_uid97_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest_q, xout => ld_Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest_q_to_join_uid97_fpSinPiTest_a_q, clk => clk, aclr => areset );

	--join_uid97_fpSinPiTest(BITJOIN,96)@2
    join_uid97_fpSinPiTest_q <= And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_q & ld_Or2ZeroAnd2ExpXIsMaxInvFracXIsZero_uid96_fpSinPiTest_q_to_join_uid97_fpSinPiTest_a_q;

	--ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_inputreg(DELAY,1195)
    ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_inputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => join_uid97_fpSinPiTest_q, xout => ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_inputreg_q, clk => clk, aclr => areset );

	--ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem(DUALMEM,1196)
    ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_reset0 <= areset;
    ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_ia <= ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_inputreg_q;
    ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_aa <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdreg_q;
    ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_ab <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_replace_rdmux_q;
    ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 6,
        numwords_a => 37,
        width_b => 2,
        widthad_b => 6,
        numwords_b => 37,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_iq,
        address_a => ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_aa,
        data_a => ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_ia
    );
        ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_q <= ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_iq(1 downto 0);

	--reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1(REG,430)@41
    reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_q <= "00";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_q <= ld_join_uid97_fpSinPiTest_q_to_reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_a_replace_mem_q;
        END IF;
    END PROCESS;


	--expRPostExc_uid98_fpSinPiTest(MUX,97)@42
    expRPostExc_uid98_fpSinPiTest_s <= reg_join_uid97_fpSinPiTest_0_to_expRPostExc_uid98_fpSinPiTest_1_q;
    expRPostExc_uid98_fpSinPiTest: PROCESS (expRPostExc_uid98_fpSinPiTest_s, expRPostExc1_uid95_fpSinPiTest_q)
    BEGIN
            CASE expRPostExc_uid98_fpSinPiTest_s IS
                  WHEN "00" => expRPostExc_uid98_fpSinPiTest_q <= expRPostExc1_uid95_fpSinPiTest_q;
                  WHEN "01" => expRPostExc_uid98_fpSinPiTest_q <= cstAllOWE_uid9_fpSinPiTest_q;
                  WHEN "10" => expRPostExc_uid98_fpSinPiTest_q <= cstBias_uid12_fpSinPiTest_q;
                  WHEN "11" => expRPostExc_uid98_fpSinPiTest_q <= cstBias_uid12_fpSinPiTest_q;
                  WHEN OTHERS => expRPostExc_uid98_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oneFracRPostExc2_uid90_fpSinPiTest(CONSTANT,89)
    oneFracRPostExc2_uid90_fpSinPiTest_q <= "0000000000000000000000000000000000000000000000000001";

	--fracRComp_uid78_fpSinPiTest(BITSELECT,77)@41
    fracRComp_uid78_fpSinPiTest_in <= expFracComp_uid77_fpSinPiTest_q(52 downto 0);
    fracRComp_uid78_fpSinPiTest_b <= fracRComp_uid78_fpSinPiTest_in(52 downto 1);

	--ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_nor(LOGICAL,989)
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_nor_b <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_sticky_ena_q;
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_nor_q <= not (ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_nor_a or ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_nor_b);

	--ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_mem_top(CONSTANT,985)
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_mem_top_q <= "0100001";

	--ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmp(LOGICAL,986)
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmp_a <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_mem_top_q;
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdmux_q);
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmp_q <= "1" when ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmp_a = ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmp_b else "0";

	--ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmpReg(REG,987)
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmpReg_q <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmp_q;
        END IF;
    END PROCESS;


	--ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_sticky_ena(REG,990)
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_nor_q = "1") THEN
                ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_sticky_ena_q <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_enaAnd(LOGICAL,991)
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_enaAnd_a <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_sticky_ena_q;
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_enaAnd_b <= VCC_q;
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_enaAnd_q <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_enaAnd_a and ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_enaAnd_b;

	--reg_excRZero_uid87_fpSinPiTest_0_to_or_uid88_fpSinPiTest_1(REG,362)@3
    reg_excRZero_uid87_fpSinPiTest_0_to_or_uid88_fpSinPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excRZero_uid87_fpSinPiTest_0_to_or_uid88_fpSinPiTest_1_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_excRZero_uid87_fpSinPiTest_0_to_or_uid88_fpSinPiTest_1_q <= excRZero_uid87_fpSinPiTest_q;
        END IF;
    END PROCESS;


	--ld_And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_q_to_or_uid88_fpSinPiTest_a(DELAY,517)@2
    ld_And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_q_to_or_uid88_fpSinPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_q, xout => ld_And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_q_to_or_uid88_fpSinPiTest_a_q, clk => clk, aclr => areset );

	--or_uid88_fpSinPiTest(LOGICAL,87)@4
    or_uid88_fpSinPiTest_a <= ld_And4And2And2InvExpXIsZeroInvAnd2ExpXIsMaxFracXIsZeroInvAnd2ExpXI_uid86_fpSinPiTest_q_to_or_uid88_fpSinPiTest_a_q;
    or_uid88_fpSinPiTest_b <= reg_excRZero_uid87_fpSinPiTest_0_to_or_uid88_fpSinPiTest_1_q;
    or_uid88_fpSinPiTest_c <= GND_q;
    or_uid88_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            or_uid88_fpSinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            or_uid88_fpSinPiTest_q <= or_uid88_fpSinPiTest_a or or_uid88_fpSinPiTest_b or or_uid88_fpSinPiTest_c;
        END IF;
    END PROCESS;



	--ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt(COUNTER,981)
    -- every=1, low=0, high=33, step=1, init=1
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_i = 32 THEN
                  ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_eq <= '1';
                ELSE
                  ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_eq = '1') THEN
                    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_i <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_i - 33;
                ELSE
                    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_i <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_i,6));


	--ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdreg(REG,982)
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdreg_q <= "000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdreg_q <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdmux(MUX,983)
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdmux_s <= VCC_q;
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdmux: PROCESS (ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdmux_s, ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdreg_q, ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdmux_q <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdmux_q <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem(DUALMEM,980)
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_reset0 <= areset;
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_ia <= or_uid88_fpSinPiTest_q;
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_aa <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdreg_q;
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_ab <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_rdmux_q;
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_dmem : altsyncram
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
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_iq,
        address_a => ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_aa,
        data_a => ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_ia
    );
        ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_q <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_iq(0 downto 0);

	--ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_outputreg(DELAY,979)
    ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_outputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_replace_mem_q, xout => ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_outputreg_q, clk => clk, aclr => areset );

	--fracRPostExc1_uid89_fpSinPiTest(MUX,88)@41
    fracRPostExc1_uid89_fpSinPiTest_s <= ld_or_uid88_fpSinPiTest_q_to_fracRPostExc1_uid89_fpSinPiTest_b_outputreg_q;
    fracRPostExc1_uid89_fpSinPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostExc1_uid89_fpSinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE fracRPostExc1_uid89_fpSinPiTest_s IS
                      WHEN "0" => fracRPostExc1_uid89_fpSinPiTest_q <= fracRComp_uid78_fpSinPiTest_b;
                      WHEN "1" => fracRPostExc1_uid89_fpSinPiTest_q <= cstAllZWF_uid10_fpSinPiTest_q;
                      WHEN OTHERS => fracRPostExc1_uid89_fpSinPiTest_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_nor(LOGICAL,1002)
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_nor_b <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_sticky_ena_q;
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_nor_q <= not (ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_nor_a or ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_nor_b);

	--ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_mem_top(CONSTANT,998)
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_mem_top_q <= "0100110";

	--ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmp(LOGICAL,999)
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmp_a <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_mem_top_q;
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdmux_q);
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmp_q <= "1" when ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmp_a = ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmp_b else "0";

	--ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmpReg(REG,1000)
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmpReg_q <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmp_q;
        END IF;
    END PROCESS;


	--ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_sticky_ena(REG,1003)
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_nor_q = "1") THEN
                ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_sticky_ena_q <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_enaAnd(LOGICAL,1004)
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_enaAnd_a <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_sticky_ena_q;
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_enaAnd_b <= VCC_q;
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_enaAnd_q <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_enaAnd_a and ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_enaAnd_b;

	--ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_inputreg(DELAY,992)
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q, xout => ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_inputreg_q, clk => clk, aclr => areset );

	--ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt(COUNTER,994)
    -- every=1, low=0, high=38, step=1, init=1
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_i = 37 THEN
                  ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_eq <= '1';
                ELSE
                  ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_eq = '1') THEN
                    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_i <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_i - 38;
                ELSE
                    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_i <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_i,6));


	--ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdreg(REG,995)
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdreg_q <= "000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdreg_q <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdmux(MUX,996)
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdmux_s <= VCC_q;
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdmux: PROCESS (ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdmux_s, ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdreg_q, ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdmux_q <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdmux_q <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem(DUALMEM,993)
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_reset0 <= areset;
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_ia <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_inputreg_q;
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_aa <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdreg_q;
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_ab <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_rdmux_q;
    ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 39,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 39,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_iq,
        address_a => ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_aa,
        data_a => ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_ia
    );
        ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_q <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_iq(0 downto 0);

	--fracRPostExc_uid91_fpSinPiTest(MUX,90)@42
    fracRPostExc_uid91_fpSinPiTest_s <= ld_And2ExpXIsMaxInvFracXIsZero_uid20_fpSinPiTest_q_to_fracRPostExc_uid91_fpSinPiTest_b_replace_mem_q;
    fracRPostExc_uid91_fpSinPiTest: PROCESS (fracRPostExc_uid91_fpSinPiTest_s, fracRPostExc1_uid89_fpSinPiTest_q)
    BEGIN
            CASE fracRPostExc_uid91_fpSinPiTest_s IS
                  WHEN "0" => fracRPostExc_uid91_fpSinPiTest_q <= fracRPostExc1_uid89_fpSinPiTest_q;
                  WHEN "1" => fracRPostExc_uid91_fpSinPiTest_q <= oneFracRPostExc2_uid90_fpSinPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid91_fpSinPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid105_fpSinPiTest(BITJOIN,104)@42
    R_uid105_fpSinPiTest_q <= ld_signR_uid104_fpSinPiTest_q_to_R_uid105_fpSinPiTest_c_outputreg_q & expRPostExc_uid98_fpSinPiTest_q & fracRPostExc_uid91_fpSinPiTest_q;

	--ld_xIn_v_to_xOut_v_nor(LOGICAL,910)
    ld_xIn_v_to_xOut_v_nor_a <= ld_xIn_v_to_xOut_v_notEnable_q;
    ld_xIn_v_to_xOut_v_nor_b <= ld_xIn_v_to_xOut_v_sticky_ena_q;
    ld_xIn_v_to_xOut_v_nor_q <= not (ld_xIn_v_to_xOut_v_nor_a or ld_xIn_v_to_xOut_v_nor_b);

	--ld_xIn_v_to_xOut_v_mem_top(CONSTANT,906)
    ld_xIn_v_to_xOut_v_mem_top_q <= "0100111";

	--ld_xIn_v_to_xOut_v_cmp(LOGICAL,907)
    ld_xIn_v_to_xOut_v_cmp_a <= ld_xIn_v_to_xOut_v_mem_top_q;
    ld_xIn_v_to_xOut_v_cmp_b <= STD_LOGIC_VECTOR("0" & ld_xIn_v_to_xOut_v_replace_rdmux_q);
    ld_xIn_v_to_xOut_v_cmp_q <= "1" when ld_xIn_v_to_xOut_v_cmp_a = ld_xIn_v_to_xOut_v_cmp_b else "0";

	--ld_xIn_v_to_xOut_v_cmpReg(REG,908)
    ld_xIn_v_to_xOut_v_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_v_to_xOut_v_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_xIn_v_to_xOut_v_cmpReg_q <= ld_xIn_v_to_xOut_v_cmp_q;
        END IF;
    END PROCESS;


	--ld_xIn_v_to_xOut_v_sticky_ena(REG,911)
    ld_xIn_v_to_xOut_v_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_v_to_xOut_v_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_xOut_v_nor_q = "1") THEN
                ld_xIn_v_to_xOut_v_sticky_ena_q <= ld_xIn_v_to_xOut_v_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xIn_v_to_xOut_v_enaAnd(LOGICAL,912)
    ld_xIn_v_to_xOut_v_enaAnd_a <= ld_xIn_v_to_xOut_v_sticky_ena_q;
    ld_xIn_v_to_xOut_v_enaAnd_b <= VCC_q;
    ld_xIn_v_to_xOut_v_enaAnd_q <= ld_xIn_v_to_xOut_v_enaAnd_a and ld_xIn_v_to_xOut_v_enaAnd_b;

	--ld_xIn_v_to_xOut_v_replace_rdcnt(COUNTER,902)
    -- every=1, low=0, high=39, step=1, init=1
    ld_xIn_v_to_xOut_v_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_v_to_xOut_v_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_xIn_v_to_xOut_v_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_xIn_v_to_xOut_v_replace_rdcnt_i = 38 THEN
                  ld_xIn_v_to_xOut_v_replace_rdcnt_eq <= '1';
                ELSE
                  ld_xIn_v_to_xOut_v_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_xIn_v_to_xOut_v_replace_rdcnt_eq = '1') THEN
                    ld_xIn_v_to_xOut_v_replace_rdcnt_i <= ld_xIn_v_to_xOut_v_replace_rdcnt_i - 39;
                ELSE
                    ld_xIn_v_to_xOut_v_replace_rdcnt_i <= ld_xIn_v_to_xOut_v_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_xIn_v_to_xOut_v_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_xIn_v_to_xOut_v_replace_rdcnt_i,6));


	--ld_xIn_v_to_xOut_v_replace_rdreg(REG,903)
    ld_xIn_v_to_xOut_v_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_v_to_xOut_v_replace_rdreg_q <= "000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_xIn_v_to_xOut_v_replace_rdreg_q <= ld_xIn_v_to_xOut_v_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_xIn_v_to_xOut_v_replace_rdmux(MUX,904)
    ld_xIn_v_to_xOut_v_replace_rdmux_s <= VCC_q;
    ld_xIn_v_to_xOut_v_replace_rdmux: PROCESS (ld_xIn_v_to_xOut_v_replace_rdmux_s, ld_xIn_v_to_xOut_v_replace_rdreg_q, ld_xIn_v_to_xOut_v_replace_rdcnt_q)
    BEGIN
            CASE ld_xIn_v_to_xOut_v_replace_rdmux_s IS
                  WHEN "0" => ld_xIn_v_to_xOut_v_replace_rdmux_q <= ld_xIn_v_to_xOut_v_replace_rdreg_q;
                  WHEN "1" => ld_xIn_v_to_xOut_v_replace_rdmux_q <= ld_xIn_v_to_xOut_v_replace_rdcnt_q;
                  WHEN OTHERS => ld_xIn_v_to_xOut_v_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_xIn_c_to_xOut_c_replace_mem(DUALMEM,914)
    ld_xIn_c_to_xOut_c_replace_mem_reset0 <= areset;
    ld_xIn_c_to_xOut_c_replace_mem_ia <= xIn_c;
    ld_xIn_c_to_xOut_c_replace_mem_aa <= ld_xIn_v_to_xOut_v_replace_rdreg_q;
    ld_xIn_c_to_xOut_c_replace_mem_ab <= ld_xIn_v_to_xOut_v_replace_rdmux_q;
    ld_xIn_c_to_xOut_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 6,
        numwords_a => 40,
        width_b => 8,
        widthad_b => 6,
        numwords_b => 40,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_xIn_v_to_xOut_v_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_xIn_c_to_xOut_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xIn_c_to_xOut_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xIn_c_to_xOut_c_replace_mem_iq,
        address_a => ld_xIn_c_to_xOut_c_replace_mem_aa,
        data_a => ld_xIn_c_to_xOut_c_replace_mem_ia
    );
        ld_xIn_c_to_xOut_c_replace_mem_q <= ld_xIn_c_to_xOut_c_replace_mem_iq(7 downto 0);

	--ld_xIn_c_to_xOut_c_outputreg(DELAY,913)
    ld_xIn_c_to_xOut_c_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_xIn_c_to_xOut_c_replace_mem_q, xout => ld_xIn_c_to_xOut_c_outputreg_q, clk => clk, aclr => areset );

	--ld_xIn_v_to_xOut_v_replace_mem(DUALMEM,901)
    ld_xIn_v_to_xOut_v_replace_mem_reset0 <= areset;
    ld_xIn_v_to_xOut_v_replace_mem_ia <= xIn_v;
    ld_xIn_v_to_xOut_v_replace_mem_aa <= ld_xIn_v_to_xOut_v_replace_rdreg_q;
    ld_xIn_v_to_xOut_v_replace_mem_ab <= ld_xIn_v_to_xOut_v_replace_rdmux_q;
    ld_xIn_v_to_xOut_v_replace_mem_dmem : altsyncram
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
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => ld_xIn_v_to_xOut_v_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_xIn_v_to_xOut_v_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xIn_v_to_xOut_v_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xIn_v_to_xOut_v_replace_mem_iq,
        address_a => ld_xIn_v_to_xOut_v_replace_mem_aa,
        data_a => ld_xIn_v_to_xOut_v_replace_mem_ia
    );
        ld_xIn_v_to_xOut_v_replace_mem_q <= ld_xIn_v_to_xOut_v_replace_mem_iq(0 downto 0);

	--ld_xIn_v_to_xOut_v_outputreg(DELAY,900)
    ld_xIn_v_to_xOut_v_outputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => ld_xIn_v_to_xOut_v_replace_mem_q, xout => ld_xIn_v_to_xOut_v_outputreg_q, clk => clk, aclr => areset );

	--xOut(PORTOUT,4)@42
    xOut_v <= ld_xIn_v_to_xOut_v_outputreg_q;
    xOut_c <= ld_xIn_c_to_xOut_c_outputreg_q;
    xOut_0 <= R_uid105_fpSinPiTest_q;


end normal;
