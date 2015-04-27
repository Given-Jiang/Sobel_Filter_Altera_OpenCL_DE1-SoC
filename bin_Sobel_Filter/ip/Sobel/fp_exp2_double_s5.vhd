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

-- VHDL created from fp_exp2_double_s5
-- VHDL created on Mon Apr  8 15:27:49 2013


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

entity fp_exp2_double_s5 is
    port (
        a : in std_logic_vector(63 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(63 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_exp2_double_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstBias_uid9_fpExp2Test_q : std_logic_vector (10 downto 0);
    signal cstZeroWE_uid13_fpExp2Test_q : std_logic_vector (10 downto 0);
    signal cstBiasPWE_uid14_fpExp2Test_q : std_logic_vector (10 downto 0);
    signal cstBiasPWE_uid15_fpExp2Test_q : std_logic_vector (6 downto 0);
    signal cstAllOWE_uid16_fpExp2Test_q : std_logic_vector (10 downto 0);
    signal cstAllZWF_uid17_fpExp2Test_q : std_logic_vector (51 downto 0);
    signal exc_R_uid31_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal exc_R_uid31_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal exc_R_uid31_fpExp2Test_c : std_logic_vector(0 downto 0);
    signal exc_R_uid31_fpExp2Test_q_i : std_logic_vector(0 downto 0);
    signal exc_R_uid31_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal oneFracRPostExc2_uid71_fpExp2Test_q : std_logic_vector (51 downto 0);
    signal expRPostExc_uid78_fpExp2Test_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid78_fpExp2Test_q : std_logic_vector (10 downto 0);
    signal z_uid82_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (31 downto 0);
    signal z_uid86_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (63 downto 0);
    signal rightShiftStage0Idx3_uid90_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(64 downto 0);
    signal rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(64 downto 0);
    signal rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(64 downto 0);
    signal rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(64 downto 0);
    signal z_uid94_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (7 downto 0);
    signal rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(7 downto 0);
    signal rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(7 downto 0);
    signal z_uid98_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (15 downto 0);
    signal rightShiftStage1Idx2Pad16_uid99_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(15 downto 0);
    signal rightShiftStage1Idx2Pad16_uid99_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(15 downto 0);
    signal rightShiftStage1Idx2Pad16_uid99_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(15 downto 0);
    signal rightShiftStage1Idx2Pad16_uid99_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(15 downto 0);
    signal z_uid102_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx3Pad24_uid103_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(23 downto 0);
    signal rightShiftStage1Idx3Pad24_uid103_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(23 downto 0);
    signal rightShiftStage1Idx3Pad24_uid103_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(23 downto 0);
    signal rightShiftStage1Idx3Pad24_uid103_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(23 downto 0);
    signal z_uid108_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (1 downto 0);
    signal rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(1 downto 0);
    signal rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(1 downto 0);
    signal z_uid112_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (3 downto 0);
    signal rightShiftStage2Idx2Pad4_uid113_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(3 downto 0);
    signal rightShiftStage2Idx2Pad4_uid113_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(3 downto 0);
    signal rightShiftStage2Idx2Pad4_uid113_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(3 downto 0);
    signal rightShiftStage2Idx2Pad4_uid113_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(3 downto 0);
    signal z_uid116_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (5 downto 0);
    signal rightShiftStage2Idx3Pad6_uid117_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(5 downto 0);
    signal rightShiftStage2Idx3Pad6_uid117_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(5 downto 0);
    signal rightShiftStage2Idx3Pad6_uid117_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(5 downto 0);
    signal rightShiftStage2Idx3Pad6_uid117_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(5 downto 0);
    signal rightShiftStage3Idx1Pad1_uid123_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal rightShiftStage3Idx1Pad1_uid123_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal rightShiftStage3Idx1Pad1_uid123_fxpInPostAlign_uid43_fpExp2Test_q_i : std_logic_vector(0 downto 0);
    signal rightShiftStage3Idx1Pad1_uid123_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal rndBit_uid169_exp2PolyEval_q : std_logic_vector (1 downto 0);
    signal rndBit_uid187_exp2PolyEval_q : std_logic_vector (2 downto 0);
    signal prodXY_uid192_pT1_uid162_exp2PolyEval_a : std_logic_vector (17 downto 0);
    signal prodXY_uid192_pT1_uid162_exp2PolyEval_b : std_logic_vector (17 downto 0);
    signal prodXY_uid192_pT1_uid162_exp2PolyEval_s1 : std_logic_vector (35 downto 0);
    signal prodXY_uid192_pT1_uid162_exp2PolyEval_pr : SIGNED (36 downto 0);
    signal prodXY_uid192_pT1_uid162_exp2PolyEval_q : std_logic_vector (35 downto 0);
    signal topProd_uid197_pT2_uid168_exp2PolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid197_pT2_uid168_exp2PolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid197_pT2_uid168_exp2PolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid197_pT2_uid168_exp2PolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid197_pT2_uid168_exp2PolyEval_q : std_logic_vector (53 downto 0);
    signal sm0_uid200_pT2_uid168_exp2PolyEval_a : std_logic_vector (1 downto 0);
    signal sm0_uid200_pT2_uid168_exp2PolyEval_b : std_logic_vector (4 downto 0);
    signal sm0_uid200_pT2_uid168_exp2PolyEval_s1 : std_logic_vector (6 downto 0);
    signal sm0_uid200_pT2_uid168_exp2PolyEval_pr : UNSIGNED (6 downto 0);
    attribute multstyle : string;
    attribute multstyle of sm0_uid200_pT2_uid168_exp2PolyEval_pr: signal is "logic";
    signal sm0_uid200_pT2_uid168_exp2PolyEval_q : std_logic_vector (6 downto 0);
    signal topProd_uid208_pT3_uid174_exp2PolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid208_pT3_uid174_exp2PolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid208_pT3_uid174_exp2PolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid208_pT3_uid174_exp2PolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid208_pT3_uid174_exp2PolyEval_q : std_logic_vector (53 downto 0);
    signal topProd_uid225_pT4_uid180_exp2PolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid225_pT4_uid180_exp2PolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid225_pT4_uid180_exp2PolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid225_pT4_uid180_exp2PolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid225_pT4_uid180_exp2PolyEval_q : std_logic_vector (53 downto 0);
    signal topProd_uid240_pT5_uid186_exp2PolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid240_pT5_uid186_exp2PolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid240_pT5_uid186_exp2PolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid240_pT5_uid186_exp2PolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid240_pT5_uid186_exp2PolyEval_q : std_logic_vector (53 downto 0);
    signal sm0_uid252_pT5_uid186_exp2PolyEval_a : std_logic_vector (2 downto 0);
    signal sm0_uid252_pT5_uid186_exp2PolyEval_b : std_logic_vector (2 downto 0);
    signal sm0_uid252_pT5_uid186_exp2PolyEval_s1 : std_logic_vector (5 downto 0);
    signal sm0_uid252_pT5_uid186_exp2PolyEval_pr : UNSIGNED (5 downto 0);
    attribute multstyle of sm0_uid252_pT5_uid186_exp2PolyEval_pr: signal is "logic";
    signal sm0_uid252_pT5_uid186_exp2PolyEval_q : std_logic_vector (5 downto 0);
    type multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_a_type is array(0 to 1) of UNSIGNED(17 downto 0);
    signal multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_a : multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_a_type;
    attribute preserve : boolean;
    attribute preserve of multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_a : signal is true;
    type multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_c_type is array(0 to 1) of SIGNED(17 downto 0);
    signal multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_c : multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_c_type;
    attribute preserve of multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_c : signal is true;
    type multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_l_type is array(0 to 1) of SIGNED(18 downto 0);
    signal multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_l : multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_l_type;
    type multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_p_type is array(0 to 1) of SIGNED(36 downto 0);
    signal multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_p : multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_p_type;
    type multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_w_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_w : multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_w_type;
    type multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_x_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_x : multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_x_type;
    type multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_y_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_y : multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_y_type;
    type multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_s_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_s : multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_s_type;
    signal multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_s0 : std_logic_vector(36 downto 0);
    signal multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_q : std_logic_vector (36 downto 0);
    type multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_a_type is array(0 to 1) of UNSIGNED(26 downto 0);
    signal multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_a : multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_a_type;
    attribute preserve of multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_a : signal is true;
    type multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_c_type is array(0 to 1) of SIGNED(26 downto 0);
    signal multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_c : multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_c_type;
    attribute preserve of multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_c : signal is true;
    type multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_l_type is array(0 to 1) of SIGNED(27 downto 0);
    signal multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_l : multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_l_type;
    type multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_p_type is array(0 to 1) of SIGNED(54 downto 0);
    signal multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_p : multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_p_type;
    type multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_w_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_w : multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_w_type;
    type multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_x_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_x : multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_x_type;
    type multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_y_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_y : multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_y_type;
    type multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_s_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_s : multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_s_type;
    signal multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_s0 : std_logic_vector(54 downto 0);
    signal multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_q : std_logic_vector (54 downto 0);
    type multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_a_type is array(0 to 1) of UNSIGNED(26 downto 0);
    signal multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_a : multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_a_type;
    attribute preserve of multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_a : signal is true;
    type multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_c_type is array(0 to 1) of SIGNED(26 downto 0);
    signal multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_c : multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_c_type;
    attribute preserve of multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_c : signal is true;
    type multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_l_type is array(0 to 1) of SIGNED(27 downto 0);
    signal multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_l : multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_l_type;
    type multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_p_type is array(0 to 1) of SIGNED(54 downto 0);
    signal multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_p : multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_p_type;
    type multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_w_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_w : multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_w_type;
    type multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_x_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_x : multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_x_type;
    type multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_y_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_y : multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_y_type;
    type multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_s_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_s : multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_s_type;
    signal multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_s0 : std_logic_vector(54 downto 0);
    signal multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_q : std_logic_vector (54 downto 0);
    signal reg_shiftValuePreSat_uid38_fpExp2Test_0_to_shiftUdf_uid40_fpExp2Test_0_q : std_logic_vector (11 downto 0);
    signal reg_rightShiftStageSel6Dto5_uid92_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_1_q : std_logic_vector (1 downto 0);
    signal reg_fxpInPreAlign_uid37_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_2_q : std_logic_vector (64 downto 0);
    signal reg_rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_3_q : std_logic_vector (64 downto 0);
    signal reg_rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_4_q : std_logic_vector (64 downto 0);
    signal reg_rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_2_q : std_logic_vector (64 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_2_q : std_logic_vector (64 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_1_q : std_logic_vector (0 downto 0);
    signal reg_ePre_uid44_fpExp2Test_0_to_expRPostBiasPreExc_uid51_fpExp2Test_0_q : std_logic_vector (12 downto 0);
    signal reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1_q : std_logic_vector (13 downto 0);
    signal reg_expOvfInitial_uid39_fpExp2Test_0_to_regXAndExpOverflowAndNeg_uid58_fpExp2Test_2_q : std_logic_vector (0 downto 0);
    signal reg_concExc_uid69_fpExp2Test_0_to_excREnc_uid70_fpExp2Test_0_q : std_logic_vector (2 downto 0);
    signal reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_q : std_logic_vector (5 downto 0);
    signal reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q : std_logic_vector (5 downto 0);
    signal reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_q : std_logic_vector (5 downto 0);
    signal reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_q : std_logic_vector (5 downto 0);
    signal reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_q : std_logic_vector (5 downto 0);
    signal reg_yT1_uid161_exp2PolyEval_0_to_prodXY_uid192_pT1_uid162_exp2PolyEval_0_q : std_logic_vector (17 downto 0);
    signal reg_os_uid160_exp2TabGen_0_to_prodXY_uid192_pT1_uid162_exp2PolyEval_1_q : std_logic_vector (17 downto 0);
    signal reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid156_exp2TabGen_0_q : std_logic_vector (5 downto 0);
    signal reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid197_pT2_uid168_exp2PolyEval_0_q : std_logic_vector (26 downto 0);
    signal reg_yTop27Bits_uid196_pT2_uid168_exp2PolyEval_0_to_topProd_uid197_pT2_uid168_exp2PolyEval_1_q : std_logic_vector (26 downto 0);
    signal reg_sSM0H_uid198_pT2_uid168_exp2PolyEval_0_to_sm0_uid200_pT2_uid168_exp2PolyEval_0_q : std_logic_vector (1 downto 0);
    signal reg_sSM0W_uid199_pT2_uid168_exp2PolyEval_0_to_sm0_uid200_pT2_uid168_exp2PolyEval_1_q : std_logic_vector (4 downto 0);
    signal reg_cIncludingRoundingBit_uid170_exp2PolyEval_0_to_ts2_uid171_exp2PolyEval_0_q : std_logic_vector (37 downto 0);
    signal reg_R_uid205_pT2_uid168_exp2PolyEval_0_to_ts2_uid171_exp2PolyEval_1_q : std_logic_vector (30 downto 0);
    signal reg_xTop18Bits_uid209_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_4_q : std_logic_vector (17 downto 0);
    signal reg_pad_yBottomBits_uid210_uid215_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_6_q : std_logic_vector (17 downto 0);
    signal reg_pad_xBottomBits_uid211_uid214_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_7_q : std_logic_vector (16 downto 0);
    signal reg_yTop18Bits_uid212_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_9_q : std_logic_vector (17 downto 0);
    signal reg_xTop27Bits_uid206_pT3_uid174_exp2PolyEval_0_to_topProd_uid208_pT3_uid174_exp2PolyEval_0_q : std_logic_vector (26 downto 0);
    signal reg_yTop27Bits_uid207_pT3_uid174_exp2PolyEval_0_to_topProd_uid208_pT3_uid174_exp2PolyEval_1_q : std_logic_vector (26 downto 0);
    signal reg_cIncludingRoundingBit_uid176_exp2PolyEval_0_to_ts3_uid177_exp2PolyEval_0_q : std_logic_vector (44 downto 0);
    signal reg_R_uid222_pT3_uid174_exp2PolyEval_0_to_ts3_uid177_exp2PolyEval_1_q : std_logic_vector (37 downto 0);
    signal reg_xTop27Bits_uid223_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_4_q : std_logic_vector (26 downto 0);
    signal reg_pad_yBottomBits_uid226_uid230_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_6_q : std_logic_vector (26 downto 0);
    signal reg_pad_xBottomBits_uid227_uid229_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_7_q : std_logic_vector (25 downto 0);
    signal reg_yTop27Bits_uid224_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_9_q : std_logic_vector (26 downto 0);
    signal reg_cIncludingRoundingBit_uid182_exp2PolyEval_0_to_ts4_uid183_exp2PolyEval_0_q : std_logic_vector (52 downto 0);
    signal reg_R_uid237_pT4_uid180_exp2PolyEval_0_to_ts4_uid183_exp2PolyEval_1_q : std_logic_vector (45 downto 0);
    signal reg_pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_4_q : std_logic_vector (26 downto 0);
    signal reg_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_6_q : std_logic_vector (26 downto 0);
    signal reg_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_7_q : std_logic_vector (25 downto 0);
    signal reg_yTop27Bits_uid239_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_9_q : std_logic_vector (26 downto 0);
    signal reg_sSM0H_uid250_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_0_q : std_logic_vector (2 downto 0);
    signal reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_q : std_logic_vector (2 downto 0);
    signal reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_q : std_logic_vector (26 downto 0);
    signal reg_cIncludingRoundingBit_uid188_exp2PolyEval_0_to_ts5_uid189_exp2PolyEval_0_q : std_logic_vector (59 downto 0);
    signal reg_R_uid258_pT5_uid186_exp2PolyEval_0_to_ts5_uid189_exp2PolyEval_1_q : std_logic_vector (54 downto 0);
    signal reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q : std_logic_vector (1 downto 0);
    signal reg_fracR_uid52_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_3_q : std_logic_vector (51 downto 0);
    signal ld_frac_uid23_fpExp2Test_b_to_oFracX_uid33_uid33_fpExp2Test_a_q : std_logic_vector (51 downto 0);
    signal ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_shiftValuePreSatRed_uid41_fpExp2Test_b_to_shiftVal_uid42_fpExp2Test_c_q : std_logic_vector (6 downto 0);
    signal ld_y_uid45_fpExp2Test_b_to_yPPolyEval_uid48_fpExp2Test_a_q : std_logic_vector (51 downto 0);
    signal ld_expOvfInitial_uid39_fpExp2Test_b_to_InvExpOvfInitial_uid59_fpExp2Test_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid31_fpExp2Test_q_to_regXAndUdf_uid60_fpExp2Test_a_q : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndNeg_uid58_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_negInf_uid57_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid25_fpExp2Test_q_to_posInf_uid67_fpExp2Test_a_q : std_logic_vector (0 downto 0);
    signal ld_posInf_uid67_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_a_q : std_logic_vector (0 downto 0);
    signal ld_regXAndExpOverflowAndPos_uid63_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid27_fpExp2Test_q_to_concExc_uid69_fpExp2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_expR_uid56_fpExp2Test_b_to_expRPostExc_uid78_fpExp2Test_d_q : std_logic_vector (10 downto 0);
    signal ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage064dto8_uid96_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_a_q : std_logic_vector (56 downto 0);
    signal ld_RightShiftStage064dto16_uid100_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_a_q : std_logic_vector (48 downto 0);
    signal ld_RightShiftStage064dto24_uid104_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_a_q : std_logic_vector (40 downto 0);
    signal ld_reg_rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_b_q : std_logic_vector (1 downto 0);
    signal ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage164dto2_uid110_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_a_q : std_logic_vector (62 downto 0);
    signal ld_RightShiftStage164dto4_uid114_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_a_q : std_logic_vector (60 downto 0);
    signal ld_RightShiftStage164dto6_uid118_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_a_q : std_logic_vector (58 downto 0);
    signal ld_reg_rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_b_q : std_logic_vector (1 downto 0);
    signal ld_reg_rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid154_exp2TabGen_0_q_to_memoryC4_uid154_exp2TabGen_a_q : std_logic_vector (5 downto 0);
    signal ld_yT4_uid179_exp2PolyEval_b_to_xTop27Bits_uid223_pT4_uid180_exp2PolyEval_a_q : std_logic_vector (42 downto 0);
    signal ld_reg_yTop27Bits_uid224_pT4_uid180_exp2PolyEval_0_to_topProd_uid225_pT4_uid180_exp2PolyEval_1_q_to_topProd_uid225_pT4_uid180_exp2PolyEval_b_q : std_logic_vector (26 downto 0);
    signal ld_yBottomBits_uid226_pT4_uid180_exp2PolyEval_b_to_spad_yBottomBits_uid226_uid228_pT4_uid180_exp2PolyEval_a_q : std_logic_vector (17 downto 0);
    signal ld_yBottomBits_uid241_pT5_uid186_exp2PolyEval_b_to_pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval_b_q : std_logic_vector (25 downto 0);
    signal ld_TtopProdConcSoftProd_uid253_pT5_uid186_exp2PolyEval_q_to_sumAHighB_uid256_pT5_uid186_exp2PolyEval_a_q : std_logic_vector (59 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid156_exp2TabGen_0_a_q : std_logic_vector (5 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_inputreg_q : std_logic_vector (1 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_reset0 : std_logic;
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_q : std_logic_vector (1 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_eq : std_logic;
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_sticky_ena_q : signal is true;
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_inputreg_q : std_logic_vector (10 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_reset0 : std_logic;
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_ia : std_logic_vector (10 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_iq : std_logic_vector (10 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_q : std_logic_vector (10 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena_q : signal is true;
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_inputreg_q : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_reset0 : std_logic;
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_ia : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_iq : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_q : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_sticky_ena_q : signal is true;
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_reset0 : std_logic;
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_ia : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_iq : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_q : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_sticky_ena_q : signal is true;
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_reset0 : std_logic;
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_ia : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_iq : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_q : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_sticky_ena_q : signal is true;
    signal ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_reset0 : std_logic;
    signal ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_sticky_ena_q : signal is true;
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_reset0 : std_logic;
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_ia : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_iq : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_q : std_logic_vector (5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_sticky_ena_q : signal is true;
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_inputreg_q : std_logic_vector (45 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_ia : std_logic_vector (45 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_iq : std_logic_vector (45 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_q : std_logic_vector (45 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_sticky_ena_q : signal is true;
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_ia : std_logic_vector (45 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_iq : std_logic_vector (45 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_q : std_logic_vector (45 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_sticky_ena_q : signal is true;
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_ia : std_logic_vector (45 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_iq : std_logic_vector (45 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_q : std_logic_vector (45 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_sticky_ena_q : signal is true;
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_ia : std_logic_vector (25 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_iq : std_logic_vector (25 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_q : std_logic_vector (25 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_sticky_ena_q : signal is true;
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_inputreg_q : std_logic_vector (18 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_reset0 : std_logic;
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_ia : std_logic_vector (18 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_iq : std_logic_vector (18 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_q : std_logic_vector (18 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_eq : std_logic;
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_sticky_ena_q : signal is true;
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_inputreg_q : std_logic_vector (5 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_reset0 : std_logic;
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_ia : std_logic_vector (5 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_iq : std_logic_vector (5 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_q : std_logic_vector (5 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_sticky_ena_q : signal is true;
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_reset0 : std_logic;
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_ia : std_logic_vector (5 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_iq : std_logic_vector (5 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_q : std_logic_vector (5 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_sticky_ena_q : signal is true;
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_reset0 : std_logic;
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_ia : std_logic_vector (5 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_iq : std_logic_vector (5 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_q : std_logic_vector (5 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_sticky_ena_q : signal is true;
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_reset0 : std_logic;
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_ia : std_logic_vector (5 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_iq : std_logic_vector (5 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_q : std_logic_vector (5 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_sticky_ena_q : signal is true;
    signal ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_reset0 : std_logic;
    signal ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_sticky_ena_q : signal is true;
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_inputreg_q : std_logic_vector (26 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_ia : std_logic_vector (26 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_iq : std_logic_vector (26 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_q : std_logic_vector (26 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_eq : std_logic;
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_sticky_ena_q : signal is true;
    signal shiftUdf_uid40_fpExp2Test_a : std_logic_vector(14 downto 0);
    signal shiftUdf_uid40_fpExp2Test_b : std_logic_vector(14 downto 0);
    signal shiftUdf_uid40_fpExp2Test_o : std_logic_vector (14 downto 0);
    signal shiftUdf_uid40_fpExp2Test_cin : std_logic_vector (0 downto 0);
    signal shiftUdf_uid40_fpExp2Test_n : std_logic_vector (0 downto 0);
    signal expUdf_uid53_fpExp2Test_a : std_logic_vector(16 downto 0);
    signal expUdf_uid53_fpExp2Test_b : std_logic_vector(16 downto 0);
    signal expUdf_uid53_fpExp2Test_o : std_logic_vector (16 downto 0);
    signal expUdf_uid53_fpExp2Test_cin : std_logic_vector (0 downto 0);
    signal expUdf_uid53_fpExp2Test_n : std_logic_vector (0 downto 0);
    signal expOvf_uid55_fpExp2Test_a : std_logic_vector(16 downto 0);
    signal expOvf_uid55_fpExp2Test_b : std_logic_vector(16 downto 0);
    signal expOvf_uid55_fpExp2Test_o : std_logic_vector (16 downto 0);
    signal expOvf_uid55_fpExp2Test_cin : std_logic_vector (0 downto 0);
    signal expOvf_uid55_fpExp2Test_n : std_logic_vector (0 downto 0);
    signal spad_yBottomBits_uid226_uid228_pT4_uid180_exp2PolyEval_q : std_logic_vector (18 downto 0);
    signal pad_yBottomBits_uid226_uid230_pT4_uid180_exp2PolyEval_q : std_logic_vector (26 downto 0);
    signal spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_q : std_logic_vector (26 downto 0);
    signal pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_q : std_logic_vector (25 downto 0);
    signal pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval_q : std_logic_vector (26 downto 0);
    signal InvExpOvfInitial_uid59_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal InvExpOvfInitial_uid59_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal InvSignX_uid62_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid62_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal oFracX_uid33_uid33_fpExp2Test_q : std_logic_vector (52 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal expX_uid6_fpExp2Test_in : std_logic_vector (62 downto 0);
    signal expX_uid6_fpExp2Test_b : std_logic_vector (10 downto 0);
    signal signX_uid7_fpExp2Test_in : std_logic_vector (63 downto 0);
    signal signX_uid7_fpExp2Test_b : std_logic_vector (0 downto 0);
    signal frac_uid23_fpExp2Test_in : std_logic_vector (51 downto 0);
    signal frac_uid23_fpExp2Test_b : std_logic_vector (51 downto 0);
    signal expXIsZero_uid20_fpExp2Test_a : std_logic_vector(10 downto 0);
    signal expXIsZero_uid20_fpExp2Test_b : std_logic_vector(10 downto 0);
    signal expXIsZero_uid20_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid22_fpExp2Test_a : std_logic_vector(10 downto 0);
    signal expXIsMax_uid22_fpExp2Test_b : std_logic_vector(10 downto 0);
    signal expXIsMax_uid22_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid24_fpExp2Test_a : std_logic_vector(51 downto 0);
    signal fracXIsZero_uid24_fpExp2Test_b : std_logic_vector(51 downto 0);
    signal fracXIsZero_uid24_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal exc_I_uid25_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal exc_I_uid25_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal exc_I_uid25_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal shiftValuePreSat_uid38_fpExp2Test_a : std_logic_vector(11 downto 0);
    signal shiftValuePreSat_uid38_fpExp2Test_b : std_logic_vector(11 downto 0);
    signal shiftValuePreSat_uid38_fpExp2Test_o : std_logic_vector (11 downto 0);
    signal shiftValuePreSat_uid38_fpExp2Test_q : std_logic_vector (11 downto 0);
    signal shiftVal_uid42_fpExp2Test_s : std_logic_vector (0 downto 0);
    signal shiftVal_uid42_fpExp2Test_q : std_logic_vector (6 downto 0);
    signal expRPostBiasPreExc_uid51_fpExp2Test_a : std_logic_vector(14 downto 0);
    signal expRPostBiasPreExc_uid51_fpExp2Test_b : std_logic_vector(14 downto 0);
    signal expRPostBiasPreExc_uid51_fpExp2Test_o : std_logic_vector (14 downto 0);
    signal expRPostBiasPreExc_uid51_fpExp2Test_q : std_logic_vector (13 downto 0);
    signal negInf_uid57_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal negInf_uid57_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal negInf_uid57_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndNeg_uid58_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndNeg_uid58_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndNeg_uid58_fpExp2Test_c : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndNeg_uid58_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid60_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid60_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid60_fpExp2Test_c : std_logic_vector(0 downto 0);
    signal regXAndUdf_uid60_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal excRZero_uid61_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal excRZero_uid61_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal excRZero_uid61_fpExp2Test_c : std_logic_vector(0 downto 0);
    signal excRZero_uid61_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid63_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid63_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid63_fpExp2Test_c : std_logic_vector(0 downto 0);
    signal regXAndExpOverflowAndPos_uid63_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid65_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid65_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid65_fpExp2Test_c : std_logic_vector(0 downto 0);
    signal regInAndOvf_uid65_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal posInf_uid67_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal posInf_uid67_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal posInf_uid67_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal excRInf_uid68_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal excRInf_uid68_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal excRInf_uid68_fpExp2Test_c : std_logic_vector(0 downto 0);
    signal excRInf_uid68_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal excREnc_uid70_fpExp2Test_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid74_fpExp2Test_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid74_fpExp2Test_q : std_logic_vector (51 downto 0);
    signal rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal memoryC0_uid129_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC0_uid130_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC0_uid131_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC0_uid132_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC0_uid133_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC0_uid134_exp2TabGen_q : std_logic_vector(6 downto 0);
    signal memoryC1_uid136_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC1_uid137_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC1_uid138_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC1_uid139_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC1_uid140_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC2_uid143_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC2_uid144_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC2_uid145_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC2_uid146_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC2_uid147_exp2TabGen_q : std_logic_vector(2 downto 0);
    signal memoryC3_uid149_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC3_uid150_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC3_uid151_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC3_uid152_exp2TabGen_q : std_logic_vector(5 downto 0);
    signal memoryC4_uid154_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC4_uid155_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC4_uid156_exp2TabGen_q : std_logic_vector(6 downto 0);
    signal memoryC5_uid158_exp2TabGen_q : std_logic_vector(9 downto 0);
    signal memoryC5_uid159_exp2TabGen_q : std_logic_vector(7 downto 0);
    signal ts2_uid171_exp2PolyEval_a : std_logic_vector(38 downto 0);
    signal ts2_uid171_exp2PolyEval_b : std_logic_vector(38 downto 0);
    signal ts2_uid171_exp2PolyEval_o : std_logic_vector (38 downto 0);
    signal ts2_uid171_exp2PolyEval_q : std_logic_vector (38 downto 0);
    signal ts3_uid177_exp2PolyEval_a : std_logic_vector(45 downto 0);
    signal ts3_uid177_exp2PolyEval_b : std_logic_vector(45 downto 0);
    signal ts3_uid177_exp2PolyEval_o : std_logic_vector (45 downto 0);
    signal ts3_uid177_exp2PolyEval_q : std_logic_vector (45 downto 0);
    signal ts4_uid183_exp2PolyEval_a : std_logic_vector(53 downto 0);
    signal ts4_uid183_exp2PolyEval_b : std_logic_vector(53 downto 0);
    signal ts4_uid183_exp2PolyEval_o : std_logic_vector (53 downto 0);
    signal ts4_uid183_exp2PolyEval_q : std_logic_vector (53 downto 0);
    signal ts5_uid189_exp2PolyEval_a : std_logic_vector(60 downto 0);
    signal ts5_uid189_exp2PolyEval_b : std_logic_vector(60 downto 0);
    signal ts5_uid189_exp2PolyEval_o : std_logic_vector (60 downto 0);
    signal ts5_uid189_exp2PolyEval_q : std_logic_vector (60 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal oFracXZwE_uid34_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal prodXYTruncFR_uid193_pT1_uid162_exp2PolyEval_in : std_logic_vector (35 downto 0);
    signal prodXYTruncFR_uid193_pT1_uid162_exp2PolyEval_b : std_logic_vector (18 downto 0);
    signal lowRangeA_uid201_pT2_uid168_exp2PolyEval_in : std_logic_vector (19 downto 0);
    signal lowRangeA_uid201_pT2_uid168_exp2PolyEval_b : std_logic_vector (19 downto 0);
    signal highABits_uid202_pT2_uid168_exp2PolyEval_in : std_logic_vector (53 downto 0);
    signal highABits_uid202_pT2_uid168_exp2PolyEval_b : std_logic_vector (33 downto 0);
    signal sumHighA_B_uid203_pT2_uid168_exp2PolyEval_a : std_logic_vector(35 downto 0);
    signal sumHighA_B_uid203_pT2_uid168_exp2PolyEval_b : std_logic_vector(35 downto 0);
    signal sumHighA_B_uid203_pT2_uid168_exp2PolyEval_o : std_logic_vector (35 downto 0);
    signal sumHighA_B_uid203_pT2_uid168_exp2PolyEval_q : std_logic_vector (34 downto 0);
    signal TtopProdConcSoftProd_uid253_pT5_uid186_exp2PolyEval_q : std_logic_vector (59 downto 0);
    signal multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_in : std_logic_vector (36 downto 0);
    signal multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_b : std_logic_vector (30 downto 0);
    signal multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_in : std_logic_vector (54 downto 0);
    signal multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_b : std_logic_vector (46 downto 0);
    signal multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_in : std_logic_vector (54 downto 0);
    signal multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_b : std_logic_vector (53 downto 0);
    signal rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal onesCmpFxpIn_uid35_fpExp2Test_a : std_logic_vector(64 downto 0);
    signal onesCmpFxpIn_uid35_fpExp2Test_b : std_logic_vector(64 downto 0);
    signal onesCmpFxpIn_uid35_fpExp2Test_q : std_logic_vector(64 downto 0);
    signal fxpInExt_uid36_fpExp2Test_a : std_logic_vector(66 downto 0);
    signal fxpInExt_uid36_fpExp2Test_b : std_logic_vector(66 downto 0);
    signal fxpInExt_uid36_fpExp2Test_o : std_logic_vector (66 downto 0);
    signal fxpInExt_uid36_fpExp2Test_q : std_logic_vector (65 downto 0);
    signal yPPolyEval_uid48_fpExp2Test_in : std_logic_vector (45 downto 0);
    signal yPPolyEval_uid48_fpExp2Test_b : std_logic_vector (45 downto 0);
    signal concExc_uid69_fpExp2Test_q : std_logic_vector (2 downto 0);
    signal xTop27Bits_uid223_pT4_uid180_exp2PolyEval_in : std_logic_vector (42 downto 0);
    signal xTop27Bits_uid223_pT4_uid180_exp2PolyEval_b : std_logic_vector (26 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_nor_q : std_logic_vector(0 downto 0);
    signal RExp2_uid79_fpExp2Test_q : std_logic_vector (63 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_nor_q : std_logic_vector(0 downto 0);
    signal os_uid148_exp2TabGen_q : std_logic_vector (42 downto 0);
    signal ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_nor_a : std_logic_vector(0 downto 0);
    signal ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_nor_b : std_logic_vector(0 downto 0);
    signal ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_nor_q : std_logic_vector(0 downto 0);
    signal yT2_uid167_exp2PolyEval_in : std_logic_vector (45 downto 0);
    signal yT2_uid167_exp2PolyEval_b : std_logic_vector (26 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal yT3_uid173_exp2PolyEval_in : std_logic_vector (45 downto 0);
    signal yT3_uid173_exp2PolyEval_b : std_logic_vector (35 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal yT4_uid179_exp2PolyEval_in : std_logic_vector (45 downto 0);
    signal yT4_uid179_exp2PolyEval_b : std_logic_vector (42 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid30_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid30_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid26_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid26_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid29_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid29_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal expOvfInitial_uid39_fpExp2Test_in : std_logic_vector (11 downto 0);
    signal expOvfInitial_uid39_fpExp2Test_b : std_logic_vector (0 downto 0);
    signal shiftValuePreSatRed_uid41_fpExp2Test_in : std_logic_vector (6 downto 0);
    signal shiftValuePreSatRed_uid41_fpExp2Test_b : std_logic_vector (6 downto 0);
    signal rightShiftStageSel6Dto5_uid92_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (6 downto 0);
    signal rightShiftStageSel6Dto5_uid92_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (0 downto 0);
    signal expR_uid56_fpExp2Test_in : std_logic_vector (10 downto 0);
    signal expR_uid56_fpExp2Test_b : std_logic_vector (10 downto 0);
    signal RightShiftStage064dto8_uid96_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (64 downto 0);
    signal RightShiftStage064dto8_uid96_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (56 downto 0);
    signal RightShiftStage064dto16_uid100_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (64 downto 0);
    signal RightShiftStage064dto16_uid100_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (48 downto 0);
    signal RightShiftStage064dto24_uid104_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (64 downto 0);
    signal RightShiftStage064dto24_uid104_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (40 downto 0);
    signal os_uid135_exp2TabGen_q : std_logic_vector (56 downto 0);
    signal os_uid142_exp2TabGen_q : std_logic_vector (50 downto 0);
    signal os_uid153_exp2TabGen_q : std_logic_vector (35 downto 0);
    signal os_uid157_exp2TabGen_q : std_logic_vector (26 downto 0);
    signal os_uid160_exp2TabGen_q : std_logic_vector (17 downto 0);
    signal s2_uid172_exp2PolyEval_in : std_logic_vector (38 downto 0);
    signal s2_uid172_exp2PolyEval_b : std_logic_vector (37 downto 0);
    signal s3_uid178_exp2PolyEval_in : std_logic_vector (45 downto 0);
    signal s3_uid178_exp2PolyEval_b : std_logic_vector (44 downto 0);
    signal s4_uid184_exp2PolyEval_in : std_logic_vector (53 downto 0);
    signal s4_uid184_exp2PolyEval_b : std_logic_vector (52 downto 0);
    signal s5_uid190_exp2PolyEval_in : std_logic_vector (60 downto 0);
    signal s5_uid190_exp2PolyEval_b : std_logic_vector (59 downto 0);
    signal lowRangeB_uid163_exp2PolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid163_exp2PolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid164_exp2PolyEval_in : std_logic_vector (18 downto 0);
    signal highBBits_uid164_exp2PolyEval_b : std_logic_vector (17 downto 0);
    signal add0_uid201_uid204_pT2_uid168_exp2PolyEval_q : std_logic_vector (54 downto 0);
    signal lowRangeB_uid218_pT3_uid174_exp2PolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid218_pT3_uid174_exp2PolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid219_pT3_uid174_exp2PolyEval_in : std_logic_vector (30 downto 0);
    signal highBBits_uid219_pT3_uid174_exp2PolyEval_b : std_logic_vector (28 downto 0);
    signal lowRangeB_uid233_pT4_uid180_exp2PolyEval_in : std_logic_vector (17 downto 0);
    signal lowRangeB_uid233_pT4_uid180_exp2PolyEval_b : std_logic_vector (17 downto 0);
    signal highBBits_uid234_pT4_uid180_exp2PolyEval_in : std_logic_vector (46 downto 0);
    signal highBBits_uid234_pT4_uid180_exp2PolyEval_b : std_logic_vector (28 downto 0);
    signal lowRangeB_uid254_pT5_uid186_exp2PolyEval_in : std_logic_vector (18 downto 0);
    signal lowRangeB_uid254_pT5_uid186_exp2PolyEval_b : std_logic_vector (18 downto 0);
    signal highBBits_uid255_pT5_uid186_exp2PolyEval_in : std_logic_vector (53 downto 0);
    signal highBBits_uid255_pT5_uid186_exp2PolyEval_b : std_logic_vector (34 downto 0);
    signal RightShiftStage164dto2_uid110_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (64 downto 0);
    signal RightShiftStage164dto2_uid110_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (62 downto 0);
    signal RightShiftStage164dto4_uid114_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (64 downto 0);
    signal RightShiftStage164dto4_uid114_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (60 downto 0);
    signal RightShiftStage164dto6_uid118_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (64 downto 0);
    signal RightShiftStage164dto6_uid118_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (58 downto 0);
    signal RightShiftStage264dto1_uid124_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (64 downto 0);
    signal RightShiftStage264dto1_uid124_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (63 downto 0);
    signal fxpInPreAlign_uid37_fpExp2Test_in : std_logic_vector (64 downto 0);
    signal fxpInPreAlign_uid37_fpExp2Test_b : std_logic_vector (64 downto 0);
    signal yT1_uid161_exp2PolyEval_in : std_logic_vector (45 downto 0);
    signal yT1_uid161_exp2PolyEval_b : std_logic_vector (17 downto 0);
    signal xBottomBits_uid242_pT5_uid186_exp2PolyEval_in : std_logic_vector (18 downto 0);
    signal xBottomBits_uid242_pT5_uid186_exp2PolyEval_b : std_logic_vector (18 downto 0);
    signal xTop26Bits_uid243_pT5_uid186_exp2PolyEval_in : std_logic_vector (45 downto 0);
    signal xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b : std_logic_vector (25 downto 0);
    signal sSM0W_uid251_pT5_uid186_exp2PolyEval_in : std_logic_vector (18 downto 0);
    signal sSM0W_uid251_pT5_uid186_exp2PolyEval_b : std_logic_vector (2 downto 0);
    signal cIncludingRoundingBit_uid176_exp2PolyEval_q : std_logic_vector (44 downto 0);
    signal sSM0W_uid199_pT2_uid168_exp2PolyEval_in : std_logic_vector (26 downto 0);
    signal sSM0W_uid199_pT2_uid168_exp2PolyEval_b : std_logic_vector (4 downto 0);
    signal xTop27Bits_uid206_pT3_uid174_exp2PolyEval_in : std_logic_vector (35 downto 0);
    signal xTop27Bits_uid206_pT3_uid174_exp2PolyEval_b : std_logic_vector (26 downto 0);
    signal xTop18Bits_uid209_pT3_uid174_exp2PolyEval_in : std_logic_vector (35 downto 0);
    signal xTop18Bits_uid209_pT3_uid174_exp2PolyEval_b : std_logic_vector (17 downto 0);
    signal xBottomBits_uid211_pT3_uid174_exp2PolyEval_in : std_logic_vector (8 downto 0);
    signal xBottomBits_uid211_pT3_uid174_exp2PolyEval_b : std_logic_vector (8 downto 0);
    signal xBottomBits_uid227_pT4_uid180_exp2PolyEval_in : std_logic_vector (15 downto 0);
    signal xBottomBits_uid227_pT4_uid180_exp2PolyEval_b : std_logic_vector (15 downto 0);
    signal exc_N_uid27_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal exc_N_uid27_fpExp2Test_b : std_logic_vector(0 downto 0);
    signal exc_N_uid27_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal cIncludingRoundingBit_uid188_exp2PolyEval_q : std_logic_vector (59 downto 0);
    signal cIncludingRoundingBit_uid182_exp2PolyEval_q : std_logic_vector (52 downto 0);
    signal cIncludingRoundingBit_uid170_exp2PolyEval_q : std_logic_vector (37 downto 0);
    signal sumAHighB_uid165_exp2PolyEval_a : std_logic_vector(27 downto 0);
    signal sumAHighB_uid165_exp2PolyEval_b : std_logic_vector(27 downto 0);
    signal sumAHighB_uid165_exp2PolyEval_o : std_logic_vector (27 downto 0);
    signal sumAHighB_uid165_exp2PolyEval_q : std_logic_vector (27 downto 0);
    signal yTop27Bits_uid207_pT3_uid174_exp2PolyEval_in : std_logic_vector (37 downto 0);
    signal yTop27Bits_uid207_pT3_uid174_exp2PolyEval_b : std_logic_vector (26 downto 0);
    signal yBottomBits_uid210_pT3_uid174_exp2PolyEval_in : std_logic_vector (10 downto 0);
    signal yBottomBits_uid210_pT3_uid174_exp2PolyEval_b : std_logic_vector (10 downto 0);
    signal yTop18Bits_uid212_pT3_uid174_exp2PolyEval_in : std_logic_vector (37 downto 0);
    signal yTop18Bits_uid212_pT3_uid174_exp2PolyEval_b : std_logic_vector (17 downto 0);
    signal yTop27Bits_uid224_pT4_uid180_exp2PolyEval_in : std_logic_vector (44 downto 0);
    signal yTop27Bits_uid224_pT4_uid180_exp2PolyEval_b : std_logic_vector (26 downto 0);
    signal yBottomBits_uid226_pT4_uid180_exp2PolyEval_in : std_logic_vector (17 downto 0);
    signal yBottomBits_uid226_pT4_uid180_exp2PolyEval_b : std_logic_vector (17 downto 0);
    signal yTop27Bits_uid239_pT5_uid186_exp2PolyEval_in : std_logic_vector (52 downto 0);
    signal yTop27Bits_uid239_pT5_uid186_exp2PolyEval_b : std_logic_vector (26 downto 0);
    signal yBottomBits_uid241_pT5_uid186_exp2PolyEval_in : std_logic_vector (25 downto 0);
    signal yBottomBits_uid241_pT5_uid186_exp2PolyEval_b : std_logic_vector (25 downto 0);
    signal sSM0H_uid250_pT5_uid186_exp2PolyEval_in : std_logic_vector (25 downto 0);
    signal sSM0H_uid250_pT5_uid186_exp2PolyEval_b : std_logic_vector (2 downto 0);
    signal peOR_uid50_fpExp2Test_in : std_logic_vector (57 downto 0);
    signal peOR_uid50_fpExp2Test_b : std_logic_vector (52 downto 0);
    signal s1_uid163_uid166_exp2PolyEval_q : std_logic_vector (28 downto 0);
    signal R_uid205_pT2_uid168_exp2PolyEval_in : std_logic_vector (53 downto 0);
    signal R_uid205_pT2_uid168_exp2PolyEval_b : std_logic_vector (30 downto 0);
    signal sumAHighB_uid220_pT3_uid174_exp2PolyEval_a : std_logic_vector(54 downto 0);
    signal sumAHighB_uid220_pT3_uid174_exp2PolyEval_b : std_logic_vector(54 downto 0);
    signal sumAHighB_uid220_pT3_uid174_exp2PolyEval_o : std_logic_vector (54 downto 0);
    signal sumAHighB_uid220_pT3_uid174_exp2PolyEval_q : std_logic_vector (54 downto 0);
    signal sumAHighB_uid235_pT4_uid180_exp2PolyEval_a : std_logic_vector(54 downto 0);
    signal sumAHighB_uid235_pT4_uid180_exp2PolyEval_b : std_logic_vector(54 downto 0);
    signal sumAHighB_uid235_pT4_uid180_exp2PolyEval_o : std_logic_vector (54 downto 0);
    signal sumAHighB_uid235_pT4_uid180_exp2PolyEval_q : std_logic_vector (54 downto 0);
    signal sumAHighB_uid256_pT5_uid186_exp2PolyEval_a : std_logic_vector(60 downto 0);
    signal sumAHighB_uid256_pT5_uid186_exp2PolyEval_b : std_logic_vector(60 downto 0);
    signal sumAHighB_uid256_pT5_uid186_exp2PolyEval_o : std_logic_vector (60 downto 0);
    signal sumAHighB_uid256_pT5_uid186_exp2PolyEval_q : std_logic_vector (60 downto 0);
    signal rightShiftStage3Idx1_uid125_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (64 downto 0);
    signal msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (0 downto 0);
    signal X64dto32_uid84_fxpInPostAlign_uid43_fpExp2Test_in : std_logic_vector (64 downto 0);
    signal X64dto32_uid84_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector (32 downto 0);
    signal pad_xBottomBits_uid211_uid214_pT3_uid174_exp2PolyEval_q : std_logic_vector (16 downto 0);
    signal pad_xBottomBits_uid227_uid229_pT4_uid180_exp2PolyEval_q : std_logic_vector (25 downto 0);
    signal InvExc_N_uid28_fpExp2Test_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid28_fpExp2Test_q : std_logic_vector(0 downto 0);
    signal spad_yBottomBits_uid210_uid213_pT3_uid174_exp2PolyEval_q : std_logic_vector (11 downto 0);
    signal fracR_uid52_fpExp2Test_in : std_logic_vector (51 downto 0);
    signal fracR_uid52_fpExp2Test_b : std_logic_vector (51 downto 0);
    signal yTop27Bits_uid196_pT2_uid168_exp2PolyEval_in : std_logic_vector (28 downto 0);
    signal yTop27Bits_uid196_pT2_uid168_exp2PolyEval_b : std_logic_vector (26 downto 0);
    signal sSM0H_uid198_pT2_uid168_exp2PolyEval_in : std_logic_vector (1 downto 0);
    signal sSM0H_uid198_pT2_uid168_exp2PolyEval_b : std_logic_vector (1 downto 0);
    signal add0_uid218_uid221_pT3_uid174_exp2PolyEval_q : std_logic_vector (56 downto 0);
    signal add0_uid233_uid236_pT4_uid180_exp2PolyEval_q : std_logic_vector (72 downto 0);
    signal add0_uid254_uid257_pT5_uid186_exp2PolyEval_q : std_logic_vector (79 downto 0);
    signal rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_s : std_logic_vector (0 downto 0);
    signal rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal rightShiftStage0Idx1Pad32_uid83_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx1Pad32_uid83_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx1Pad32_uid83_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(31 downto 0);
    signal rightShiftStage0Idx2Pad64_uid87_fxpInPostAlign_uid43_fpExp2Test_a : std_logic_vector(63 downto 0);
    signal rightShiftStage0Idx2Pad64_uid87_fxpInPostAlign_uid43_fpExp2Test_b : std_logic_vector(63 downto 0);
    signal rightShiftStage0Idx2Pad64_uid87_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector(63 downto 0);
    signal rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_q : std_logic_vector (64 downto 0);
    signal pad_yBottomBits_uid210_uid215_pT3_uid174_exp2PolyEval_q : std_logic_vector (17 downto 0);
    signal R_uid222_pT3_uid174_exp2PolyEval_in : std_logic_vector (55 downto 0);
    signal R_uid222_pT3_uid174_exp2PolyEval_b : std_logic_vector (37 downto 0);
    signal R_uid237_pT4_uid180_exp2PolyEval_in : std_logic_vector (71 downto 0);
    signal R_uid237_pT4_uid180_exp2PolyEval_b : std_logic_vector (45 downto 0);
    signal R_uid258_pT5_uid186_exp2PolyEval_in : std_logic_vector (78 downto 0);
    signal R_uid258_pT5_uid186_exp2PolyEval_b : std_logic_vector (54 downto 0);
    signal ePre_uid44_fpExp2Test_in : std_logic_vector (64 downto 0);
    signal ePre_uid44_fpExp2Test_b : std_logic_vector (12 downto 0);
    signal y_uid45_fpExp2Test_in : std_logic_vector (51 downto 0);
    signal y_uid45_fpExp2Test_b : std_logic_vector (51 downto 0);
    signal addr_uid47_fpExp2Test_in : std_logic_vector (51 downto 0);
    signal addr_uid47_fpExp2Test_b : std_logic_vector (5 downto 0);
begin


	--GND(CONSTANT,0)
    GND_q <= "0";

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable(LOGICAL,723)
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_a <= en;
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q <= not ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_a;

	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor(LOGICAL,737)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_b <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena_q;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_q <= not (ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_a or ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_b);

	--ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_mem_top(CONSTANT,720)
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_mem_top_q <= "010101";

	--ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmp(LOGICAL,721)
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmp_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_mem_top_q;
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdmux_q);
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmp_q <= "1" when ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmp_a = ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmp_b else "0";

	--ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmpReg(REG,722)
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmpReg_q <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena(REG,738)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_nor_q = "1") THEN
                ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena_q <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd(LOGICAL,739)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_a <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_sticky_ena_q;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_b <= en;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_q <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_a and ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_enaAnd_b;

	--cstAllOWE_uid16_fpExp2Test(CONSTANT,15)
    cstAllOWE_uid16_fpExp2Test_q <= "11111111111";

	--cstBias_uid9_fpExp2Test(CONSTANT,8)
    cstBias_uid9_fpExp2Test_q <= "01111111111";

	--signX_uid7_fpExp2Test(BITSELECT,6)@0
    signX_uid7_fpExp2Test_in <= a;
    signX_uid7_fpExp2Test_b <= signX_uid7_fpExp2Test_in(63 downto 63);

	--ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b(DELAY,360)@0
    ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signX_uid7_fpExp2Test_b, xout => ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--frac_uid23_fpExp2Test(BITSELECT,22)@0
    frac_uid23_fpExp2Test_in <= a(51 downto 0);
    frac_uid23_fpExp2Test_b <= frac_uid23_fpExp2Test_in(51 downto 0);

	--ld_frac_uid23_fpExp2Test_b_to_oFracX_uid33_uid33_fpExp2Test_a(DELAY,357)@0
    ld_frac_uid23_fpExp2Test_b_to_oFracX_uid33_uid33_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 52, depth => 1 )
    PORT MAP ( xin => frac_uid23_fpExp2Test_b, xout => ld_frac_uid23_fpExp2Test_b_to_oFracX_uid33_uid33_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--oFracX_uid33_uid33_fpExp2Test(BITJOIN,32)@1
    oFracX_uid33_uid33_fpExp2Test_q <= VCC_q & ld_frac_uid23_fpExp2Test_b_to_oFracX_uid33_uid33_fpExp2Test_a_q;

	--oFracXZwE_uid34_fpExp2Test(BITJOIN,33)@1
    oFracXZwE_uid34_fpExp2Test_q <= GND_q & oFracX_uid33_uid33_fpExp2Test_q & cstZeroWE_uid13_fpExp2Test_q;

	--onesCmpFxpIn_uid35_fpExp2Test(LOGICAL,34)@1
    onesCmpFxpIn_uid35_fpExp2Test_a <= oFracXZwE_uid34_fpExp2Test_q;
    onesCmpFxpIn_uid35_fpExp2Test_b <= STD_LOGIC_VECTOR((64 downto 1 => ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b_q(0)) & ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b_q);
    onesCmpFxpIn_uid35_fpExp2Test_q <= onesCmpFxpIn_uid35_fpExp2Test_a xor onesCmpFxpIn_uid35_fpExp2Test_b;

	--fxpInExt_uid36_fpExp2Test(ADD,35)@1
    fxpInExt_uid36_fpExp2Test_a <= STD_LOGIC_VECTOR((66 downto 65 => onesCmpFxpIn_uid35_fpExp2Test_q(64)) & onesCmpFxpIn_uid35_fpExp2Test_q);
    fxpInExt_uid36_fpExp2Test_b <= STD_LOGIC_VECTOR('0' & "00000000000000000000000000000000000000000000000000000000000000000" & ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b_q);
            fxpInExt_uid36_fpExp2Test_o <= STD_LOGIC_VECTOR(SIGNED(fxpInExt_uid36_fpExp2Test_a) + SIGNED(fxpInExt_uid36_fpExp2Test_b));
    fxpInExt_uid36_fpExp2Test_q <= fxpInExt_uid36_fpExp2Test_o(65 downto 0);


	--fxpInPreAlign_uid37_fpExp2Test(BITSELECT,36)@1
    fxpInPreAlign_uid37_fpExp2Test_in <= fxpInExt_uid36_fpExp2Test_q(64 downto 0);
    fxpInPreAlign_uid37_fpExp2Test_b <= fxpInPreAlign_uid37_fpExp2Test_in(64 downto 0);

	--msbx_uid81_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,80)@1
    msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_in <= fxpInPreAlign_uid37_fpExp2Test_b;
    msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b <= msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_in(64 downto 64);

	--ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_b(DELAY,447)@1
    ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage3Idx1Pad1_uid123_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,122)@3
    rightShiftStage3Idx1Pad1_uid123_fxpInPostAlign_uid43_fpExp2Test_a <= GND_q;
    rightShiftStage3Idx1Pad1_uid123_fxpInPostAlign_uid43_fpExp2Test_b <= ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_b_q;
    rightShiftStage3Idx1Pad1_uid123_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage3Idx1Pad1_uid123_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage3Idx1Pad1_uid123_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage3Idx1Pad1_uid123_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => rightShiftStage3Idx1Pad1_uid123_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage3Idx1Pad1_uid123_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage264dto1_uid124_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,123)@4
    RightShiftStage264dto1_uid124_fxpInPostAlign_uid43_fpExp2Test_in <= rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q;
    RightShiftStage264dto1_uid124_fxpInPostAlign_uid43_fpExp2Test_b <= RightShiftStage264dto1_uid124_fxpInPostAlign_uid43_fpExp2Test_in(64 downto 1);

	--rightShiftStage3Idx1_uid125_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,124)@4
    rightShiftStage3Idx1_uid125_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage3Idx1Pad1_uid123_fxpInPostAlign_uid43_fpExp2Test_q & RightShiftStage264dto1_uid124_fxpInPostAlign_uid43_fpExp2Test_b;

	--z_uid116_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,115)
    z_uid116_fxpInPostAlign_uid43_fpExp2Test_q <= "000000";

	--rightShiftStage2Idx3Pad6_uid117_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,116)@3
    rightShiftStage2Idx3Pad6_uid117_fxpInPostAlign_uid43_fpExp2Test_a <= z_uid116_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage2Idx3Pad6_uid117_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((5 downto 1 => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_b_q(0)) & ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_b_q);
    rightShiftStage2Idx3Pad6_uid117_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage2Idx3Pad6_uid117_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage2Idx3Pad6_uid117_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage2Idx3Pad6_uid117_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 6, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx3Pad6_uid117_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage2Idx3Pad6_uid117_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_b(DELAY,429)@1
    ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--z_uid102_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,101)
    z_uid102_fxpInPostAlign_uid43_fpExp2Test_q <= "000000000000000000000000";

	--rightShiftStage1Idx3Pad24_uid103_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,102)@2
    rightShiftStage1Idx3Pad24_uid103_fxpInPostAlign_uid43_fpExp2Test_a <= z_uid102_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage1Idx3Pad24_uid103_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((23 downto 1 => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q(0)) & ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q);
    rightShiftStage1Idx3Pad24_uid103_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage1Idx3Pad24_uid103_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage1Idx3Pad24_uid103_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage1Idx3Pad24_uid103_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 24, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx3Pad24_uid103_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage1Idx3Pad24_uid103_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--rightShiftStage0Idx3_uid90_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,89)
    rightShiftStage0Idx3_uid90_fxpInPostAlign_uid43_fpExp2Test_q <= "00000000000000000000000000000000000000000000000000000000000000000";

	--rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,90)@1
    rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_a <= rightShiftStage0Idx3_uid90_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((64 downto 1 => msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b(0)) & msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b);
    rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 65, depth => 1)
    PORT MAP (xout => rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage0Idx3_uid91_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--z_uid86_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,85)
    z_uid86_fxpInPostAlign_uid43_fpExp2Test_q <= "0000000000000000000000000000000000000000000000000000000000000000";

	--rightShiftStage0Idx2Pad64_uid87_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,86)@1
    rightShiftStage0Idx2Pad64_uid87_fxpInPostAlign_uid43_fpExp2Test_a <= z_uid86_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage0Idx2Pad64_uid87_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((63 downto 1 => msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b(0)) & msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b);
    rightShiftStage0Idx2Pad64_uid87_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage0Idx2Pad64_uid87_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage0Idx2Pad64_uid87_fxpInPostAlign_uid43_fpExp2Test_b;

	--rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,88)@1
    rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage0Idx2Pad64_uid87_fxpInPostAlign_uid43_fpExp2Test_q & msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b;

	--reg_rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_4(REG,266)@1
    reg_rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_4_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_4_q <= rightShiftStage0Idx2_uid89_fxpInPostAlign_uid43_fpExp2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--z_uid82_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,81)
    z_uid82_fxpInPostAlign_uid43_fpExp2Test_q <= "00000000000000000000000000000000";

	--rightShiftStage0Idx1Pad32_uid83_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,82)@1
    rightShiftStage0Idx1Pad32_uid83_fxpInPostAlign_uid43_fpExp2Test_a <= z_uid82_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage0Idx1Pad32_uid83_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((31 downto 1 => msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b(0)) & msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b);
    rightShiftStage0Idx1Pad32_uid83_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage0Idx1Pad32_uid83_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage0Idx1Pad32_uid83_fxpInPostAlign_uid43_fpExp2Test_b;

	--X64dto32_uid84_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,83)@1
    X64dto32_uid84_fxpInPostAlign_uid43_fpExp2Test_in <= fxpInPreAlign_uid37_fpExp2Test_b;
    X64dto32_uid84_fxpInPostAlign_uid43_fpExp2Test_b <= X64dto32_uid84_fxpInPostAlign_uid43_fpExp2Test_in(64 downto 32);

	--rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,84)@1
    rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage0Idx1Pad32_uid83_fxpInPostAlign_uid43_fpExp2Test_q & X64dto32_uid84_fxpInPostAlign_uid43_fpExp2Test_b;

	--reg_rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_3(REG,265)@1
    reg_rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_3_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_3_q <= rightShiftStage0Idx1_uid85_fxpInPostAlign_uid43_fpExp2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_fxpInPreAlign_uid37_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_2(REG,264)@1
    reg_fxpInPreAlign_uid37_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpInPreAlign_uid37_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpInPreAlign_uid37_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_2_q <= fxpInPreAlign_uid37_fpExp2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--cstBiasPWE_uid15_fpExp2Test(CONSTANT,14)
    cstBiasPWE_uid15_fpExp2Test_q <= "1000001";

	--expX_uid6_fpExp2Test(BITSELECT,5)@0
    expX_uid6_fpExp2Test_in <= a(62 downto 0);
    expX_uid6_fpExp2Test_b <= expX_uid6_fpExp2Test_in(62 downto 52);

	--cstBiasPWE_uid14_fpExp2Test(CONSTANT,13)
    cstBiasPWE_uid14_fpExp2Test_q <= "10000001010";

	--shiftValuePreSat_uid38_fpExp2Test(SUB,37)@0
    shiftValuePreSat_uid38_fpExp2Test_a <= STD_LOGIC_VECTOR("0" & cstBiasPWE_uid14_fpExp2Test_q);
    shiftValuePreSat_uid38_fpExp2Test_b <= STD_LOGIC_VECTOR("0" & expX_uid6_fpExp2Test_b);
            shiftValuePreSat_uid38_fpExp2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValuePreSat_uid38_fpExp2Test_a) - UNSIGNED(shiftValuePreSat_uid38_fpExp2Test_b));
    shiftValuePreSat_uid38_fpExp2Test_q <= shiftValuePreSat_uid38_fpExp2Test_o(11 downto 0);


	--shiftValuePreSatRed_uid41_fpExp2Test(BITSELECT,40)@0
    shiftValuePreSatRed_uid41_fpExp2Test_in <= shiftValuePreSat_uid38_fpExp2Test_q(6 downto 0);
    shiftValuePreSatRed_uid41_fpExp2Test_b <= shiftValuePreSatRed_uid41_fpExp2Test_in(6 downto 0);

	--ld_shiftValuePreSatRed_uid41_fpExp2Test_b_to_shiftVal_uid42_fpExp2Test_c(DELAY,369)@0
    ld_shiftValuePreSatRed_uid41_fpExp2Test_b_to_shiftVal_uid42_fpExp2Test_c : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => shiftValuePreSatRed_uid41_fpExp2Test_b, xout => ld_shiftValuePreSatRed_uid41_fpExp2Test_b_to_shiftVal_uid42_fpExp2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_shiftValuePreSat_uid38_fpExp2Test_0_to_shiftUdf_uid40_fpExp2Test_0(REG,262)@0
    reg_shiftValuePreSat_uid38_fpExp2Test_0_to_shiftUdf_uid40_fpExp2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_shiftValuePreSat_uid38_fpExp2Test_0_to_shiftUdf_uid40_fpExp2Test_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_shiftValuePreSat_uid38_fpExp2Test_0_to_shiftUdf_uid40_fpExp2Test_0_q <= shiftValuePreSat_uid38_fpExp2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--shiftUdf_uid40_fpExp2Test(COMPARE,39)@1
    shiftUdf_uid40_fpExp2Test_cin <= GND_q;
    shiftUdf_uid40_fpExp2Test_a <= STD_LOGIC_VECTOR((13 downto 12 => reg_shiftValuePreSat_uid38_fpExp2Test_0_to_shiftUdf_uid40_fpExp2Test_0_q(11)) & reg_shiftValuePreSat_uid38_fpExp2Test_0_to_shiftUdf_uid40_fpExp2Test_0_q) & '0';
    shiftUdf_uid40_fpExp2Test_b <= STD_LOGIC_VECTOR('0' & "000000" & cstBiasPWE_uid15_fpExp2Test_q) & shiftUdf_uid40_fpExp2Test_cin(0);
            shiftUdf_uid40_fpExp2Test_o <= STD_LOGIC_VECTOR(SIGNED(shiftUdf_uid40_fpExp2Test_a) - SIGNED(shiftUdf_uid40_fpExp2Test_b));
    shiftUdf_uid40_fpExp2Test_n(0) <= not shiftUdf_uid40_fpExp2Test_o(14);


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


	--rightShiftStageSel6Dto5_uid92_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,91)@1
    rightShiftStageSel6Dto5_uid92_fxpInPostAlign_uid43_fpExp2Test_in <= shiftVal_uid42_fpExp2Test_q;
    rightShiftStageSel6Dto5_uid92_fxpInPostAlign_uid43_fpExp2Test_b <= rightShiftStageSel6Dto5_uid92_fxpInPostAlign_uid43_fpExp2Test_in(6 downto 5);

	--reg_rightShiftStageSel6Dto5_uid92_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_1(REG,263)@1
    reg_rightShiftStageSel6Dto5_uid92_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel6Dto5_uid92_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel6Dto5_uid92_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_1_q <= rightShiftStageSel6Dto5_uid92_fxpInPostAlign_uid43_fpExp2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test(MUX,92)@2
    rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_s <= reg_rightShiftStageSel6Dto5_uid92_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_1_q;
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


	--RightShiftStage064dto24_uid104_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,103)@2
    RightShiftStage064dto24_uid104_fxpInPostAlign_uid43_fpExp2Test_in <= rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q;
    RightShiftStage064dto24_uid104_fxpInPostAlign_uid43_fpExp2Test_b <= RightShiftStage064dto24_uid104_fxpInPostAlign_uid43_fpExp2Test_in(64 downto 24);

	--ld_RightShiftStage064dto24_uid104_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_a(DELAY,439)@2
    ld_RightShiftStage064dto24_uid104_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 41, depth => 1 )
    PORT MAP ( xin => RightShiftStage064dto24_uid104_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_RightShiftStage064dto24_uid104_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,104)@3
    rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage1Idx3Pad24_uid103_fxpInPostAlign_uid43_fpExp2Test_q & ld_RightShiftStage064dto24_uid104_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx3_uid105_fxpInPostAlign_uid43_fpExp2Test_a_q;

	--z_uid98_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,97)
    z_uid98_fxpInPostAlign_uid43_fpExp2Test_q <= "0000000000000000";

	--rightShiftStage1Idx2Pad16_uid99_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,98)@2
    rightShiftStage1Idx2Pad16_uid99_fxpInPostAlign_uid43_fpExp2Test_a <= z_uid98_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage1Idx2Pad16_uid99_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((15 downto 1 => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q(0)) & ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q);
    rightShiftStage1Idx2Pad16_uid99_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage1Idx2Pad16_uid99_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage1Idx2Pad16_uid99_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage1Idx2Pad16_uid99_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 16, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx2Pad16_uid99_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage1Idx2Pad16_uid99_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage064dto16_uid100_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,99)@2
    RightShiftStage064dto16_uid100_fxpInPostAlign_uid43_fpExp2Test_in <= rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q;
    RightShiftStage064dto16_uid100_fxpInPostAlign_uid43_fpExp2Test_b <= RightShiftStage064dto16_uid100_fxpInPostAlign_uid43_fpExp2Test_in(64 downto 16);

	--ld_RightShiftStage064dto16_uid100_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_a(DELAY,435)@2
    ld_RightShiftStage064dto16_uid100_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 49, depth => 1 )
    PORT MAP ( xin => RightShiftStage064dto16_uid100_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_RightShiftStage064dto16_uid100_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,100)@3
    rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage1Idx2Pad16_uid99_fxpInPostAlign_uid43_fpExp2Test_q & ld_RightShiftStage064dto16_uid100_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx2_uid101_fxpInPostAlign_uid43_fpExp2Test_a_q;

	--z_uid94_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,93)
    z_uid94_fxpInPostAlign_uid43_fpExp2Test_q <= "00000000";

	--rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,94)@2
    rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_a <= z_uid94_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((7 downto 1 => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q(0)) & ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_b_q);
    rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 8, depth => 1)
    PORT MAP (xout => rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage064dto8_uid96_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,95)@2
    RightShiftStage064dto8_uid96_fxpInPostAlign_uid43_fpExp2Test_in <= rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q;
    RightShiftStage064dto8_uid96_fxpInPostAlign_uid43_fpExp2Test_b <= RightShiftStage064dto8_uid96_fxpInPostAlign_uid43_fpExp2Test_in(64 downto 8);

	--ld_RightShiftStage064dto8_uid96_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_a(DELAY,431)@2
    ld_RightShiftStage064dto8_uid96_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 57, depth => 1 )
    PORT MAP ( xin => RightShiftStage064dto8_uid96_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_RightShiftStage064dto8_uid96_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,96)@3
    rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage1Idx1Pad8_uid95_fxpInPostAlign_uid43_fpExp2Test_q & ld_RightShiftStage064dto8_uid96_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage1Idx1_uid97_fxpInPostAlign_uid43_fpExp2Test_a_q;

	--reg_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_2(REG,268)@2
    reg_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_2_q <= rightShiftStage0_uid93_fxpInPostAlign_uid43_fpExp2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,105)@1
    rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_in <= shiftVal_uid42_fpExp2Test_q(4 downto 0);
    rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_b <= rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_in(4 downto 3);

	--reg_rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1(REG,267)@1
    reg_rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_q <= rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_b(DELAY,442)@2
    ld_reg_rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_q, xout => ld_reg_rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test(MUX,106)@3
    rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_s <= ld_reg_rightShiftStageSel4Dto3_uid106_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_b_q;
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


	--RightShiftStage164dto6_uid118_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,117)@3
    RightShiftStage164dto6_uid118_fxpInPostAlign_uid43_fpExp2Test_in <= rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q;
    RightShiftStage164dto6_uid118_fxpInPostAlign_uid43_fpExp2Test_b <= RightShiftStage164dto6_uid118_fxpInPostAlign_uid43_fpExp2Test_in(64 downto 6);

	--ld_RightShiftStage164dto6_uid118_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_a(DELAY,457)@3
    ld_RightShiftStage164dto6_uid118_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 59, depth => 1 )
    PORT MAP ( xin => RightShiftStage164dto6_uid118_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_RightShiftStage164dto6_uid118_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,118)@4
    rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage2Idx3Pad6_uid117_fxpInPostAlign_uid43_fpExp2Test_q & ld_RightShiftStage164dto6_uid118_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_a_q;

	--z_uid112_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,111)
    z_uid112_fxpInPostAlign_uid43_fpExp2Test_q <= "0000";

	--rightShiftStage2Idx2Pad4_uid113_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,112)@3
    rightShiftStage2Idx2Pad4_uid113_fxpInPostAlign_uid43_fpExp2Test_a <= z_uid112_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage2Idx2Pad4_uid113_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((3 downto 1 => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_b_q(0)) & ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_b_q);
    rightShiftStage2Idx2Pad4_uid113_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage2Idx2Pad4_uid113_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage2Idx2Pad4_uid113_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage2Idx2Pad4_uid113_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 4, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx2Pad4_uid113_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage2Idx2Pad4_uid113_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage164dto4_uid114_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,113)@3
    RightShiftStage164dto4_uid114_fxpInPostAlign_uid43_fpExp2Test_in <= rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q;
    RightShiftStage164dto4_uid114_fxpInPostAlign_uid43_fpExp2Test_b <= RightShiftStage164dto4_uid114_fxpInPostAlign_uid43_fpExp2Test_in(64 downto 4);

	--ld_RightShiftStage164dto4_uid114_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_a(DELAY,453)@3
    ld_RightShiftStage164dto4_uid114_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 61, depth => 1 )
    PORT MAP ( xin => RightShiftStage164dto4_uid114_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_RightShiftStage164dto4_uid114_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,114)@4
    rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage2Idx2Pad4_uid113_fxpInPostAlign_uid43_fpExp2Test_q & ld_RightShiftStage164dto4_uid114_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_a_q;

	--z_uid108_fxpInPostAlign_uid43_fpExp2Test(CONSTANT,107)
    z_uid108_fxpInPostAlign_uid43_fpExp2Test_q <= "00";

	--rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test(LOGICAL,108)@3
    rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_a <= z_uid108_fxpInPostAlign_uid43_fpExp2Test_q;
    rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_b <= STD_LOGIC_VECTOR((1 downto 1 => ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_b_q(0)) & ld_msbx_uid81_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_b_q);
    rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_q_i <= rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_a or rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_b;
    rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 2, depth => 1)
    PORT MAP (xout => rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_q, xin => rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--RightShiftStage164dto2_uid110_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,109)@3
    RightShiftStage164dto2_uid110_fxpInPostAlign_uid43_fpExp2Test_in <= rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q;
    RightShiftStage164dto2_uid110_fxpInPostAlign_uid43_fpExp2Test_b <= RightShiftStage164dto2_uid110_fxpInPostAlign_uid43_fpExp2Test_in(64 downto 2);

	--ld_RightShiftStage164dto2_uid110_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_a(DELAY,449)@3
    ld_RightShiftStage164dto2_uid110_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 63, depth => 1 )
    PORT MAP ( xin => RightShiftStage164dto2_uid110_fxpInPostAlign_uid43_fpExp2Test_b, xout => ld_RightShiftStage164dto2_uid110_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test(BITJOIN,110)@4
    rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage2Idx1Pad2_uid109_fxpInPostAlign_uid43_fpExp2Test_q & ld_RightShiftStage164dto2_uid110_fxpInPostAlign_uid43_fpExp2Test_b_to_rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_a_q;

	--reg_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_2(REG,270)@3
    reg_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_2_q <= rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,119)@1
    rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_in <= shiftVal_uid42_fpExp2Test_q(2 downto 0);
    rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_b <= rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_in(2 downto 1);

	--reg_rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1(REG,269)@1
    reg_rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_q <= rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_b(DELAY,460)@2
    ld_reg_rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 2 )
    PORT MAP ( xin => reg_rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_q, xout => ld_reg_rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test(MUX,120)@4
    rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_s <= ld_reg_rightShiftStageSel2Dto1_uid120_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_b_q;
    rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test: PROCESS (rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_s, en, reg_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_2_q, rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_q, rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_q, rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_q)
    BEGIN
            CASE rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_s IS
                  WHEN "00" => rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q <= reg_rightShiftStage1_uid107_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_2_q;
                  WHEN "01" => rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage2Idx1_uid111_fxpInPostAlign_uid43_fpExp2Test_q;
                  WHEN "10" => rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage2Idx2_uid115_fxpInPostAlign_uid43_fpExp2Test_q;
                  WHEN "11" => rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage2Idx3_uid119_fxpInPostAlign_uid43_fpExp2Test_q;
                  WHEN OTHERS => rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test(BITSELECT,125)@1
    rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_in <= shiftVal_uid42_fpExp2Test_q(0 downto 0);
    rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_b <= rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_in(0 downto 0);

	--reg_rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_1(REG,271)@1
    reg_rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_1_q <= rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_b(DELAY,470)@2
    ld_reg_rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => reg_rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_1_q, xout => ld_reg_rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test(MUX,126)@4
    rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_s <= ld_reg_rightShiftStageSel0Dto0_uid126_fxpInPostAlign_uid43_fpExp2Test_0_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_1_q_to_rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_b_q;
    rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test: PROCESS (rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_s, en, rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q, rightShiftStage3Idx1_uid125_fxpInPostAlign_uid43_fpExp2Test_q)
    BEGIN
            CASE rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_s IS
                  WHEN "0" => rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage2_uid121_fxpInPostAlign_uid43_fpExp2Test_q;
                  WHEN "1" => rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_q <= rightShiftStage3Idx1_uid125_fxpInPostAlign_uid43_fpExp2Test_q;
                  WHEN OTHERS => rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ePre_uid44_fpExp2Test(BITSELECT,43)@4
    ePre_uid44_fpExp2Test_in <= rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_q;
    ePre_uid44_fpExp2Test_b <= ePre_uid44_fpExp2Test_in(64 downto 52);

	--reg_ePre_uid44_fpExp2Test_0_to_expRPostBiasPreExc_uid51_fpExp2Test_0(REG,272)@4
    reg_ePre_uid44_fpExp2Test_0_to_expRPostBiasPreExc_uid51_fpExp2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_ePre_uid44_fpExp2Test_0_to_expRPostBiasPreExc_uid51_fpExp2Test_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_ePre_uid44_fpExp2Test_0_to_expRPostBiasPreExc_uid51_fpExp2Test_0_q <= ePre_uid44_fpExp2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--expRPostBiasPreExc_uid51_fpExp2Test(ADD,50)@5
    expRPostBiasPreExc_uid51_fpExp2Test_a <= STD_LOGIC_VECTOR((14 downto 13 => reg_ePre_uid44_fpExp2Test_0_to_expRPostBiasPreExc_uid51_fpExp2Test_0_q(12)) & reg_ePre_uid44_fpExp2Test_0_to_expRPostBiasPreExc_uid51_fpExp2Test_0_q);
    expRPostBiasPreExc_uid51_fpExp2Test_b <= STD_LOGIC_VECTOR('0' & "000" & cstBias_uid9_fpExp2Test_q);
            expRPostBiasPreExc_uid51_fpExp2Test_o <= STD_LOGIC_VECTOR(SIGNED(expRPostBiasPreExc_uid51_fpExp2Test_a) + SIGNED(expRPostBiasPreExc_uid51_fpExp2Test_b));
    expRPostBiasPreExc_uid51_fpExp2Test_q <= expRPostBiasPreExc_uid51_fpExp2Test_o(13 downto 0);


	--expR_uid56_fpExp2Test(BITSELECT,55)@5
    expR_uid56_fpExp2Test_in <= expRPostBiasPreExc_uid51_fpExp2Test_q(10 downto 0);
    expR_uid56_fpExp2Test_b <= expR_uid56_fpExp2Test_in(10 downto 0);

	--ld_expR_uid56_fpExp2Test_b_to_expRPostExc_uid78_fpExp2Test_d(DELAY,411)@5
    ld_expR_uid56_fpExp2Test_b_to_expRPostExc_uid78_fpExp2Test_d : dspba_delay
    GENERIC MAP ( width => 11, depth => 2 )
    PORT MAP ( xin => expR_uid56_fpExp2Test_b, xout => ld_expR_uid56_fpExp2Test_b_to_expRPostExc_uid78_fpExp2Test_d_q, ena => en(0), clk => clk, aclr => areset );

	--cstZeroWE_uid13_fpExp2Test(CONSTANT,12)
    cstZeroWE_uid13_fpExp2Test_q <= "00000000000";

	--cstAllZWF_uid17_fpExp2Test(CONSTANT,16)
    cstAllZWF_uid17_fpExp2Test_q <= "0000000000000000000000000000000000000000000000000000";

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

	--ld_exc_N_uid27_fpExp2Test_q_to_concExc_uid69_fpExp2Test_c(DELAY,406)@0
    ld_exc_N_uid27_fpExp2Test_q_to_concExc_uid69_fpExp2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => exc_N_uid27_fpExp2Test_q, xout => ld_exc_N_uid27_fpExp2Test_q_to_concExc_uid69_fpExp2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--InvSignX_uid62_fpExp2Test(LOGICAL,61)@1
    InvSignX_uid62_fpExp2Test_a <= ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b_q;
    InvSignX_uid62_fpExp2Test_q <= not InvSignX_uid62_fpExp2Test_a;

	--expOvfInitial_uid39_fpExp2Test(BITSELECT,38)@0
    expOvfInitial_uid39_fpExp2Test_in <= shiftValuePreSat_uid38_fpExp2Test_q;
    expOvfInitial_uid39_fpExp2Test_b <= expOvfInitial_uid39_fpExp2Test_in(11 downto 11);

	--reg_expOvfInitial_uid39_fpExp2Test_0_to_regXAndExpOverflowAndNeg_uid58_fpExp2Test_2(REG,274)@0
    reg_expOvfInitial_uid39_fpExp2Test_0_to_regXAndExpOverflowAndNeg_uid58_fpExp2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expOvfInitial_uid39_fpExp2Test_0_to_regXAndExpOverflowAndNeg_uid58_fpExp2Test_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expOvfInitial_uid39_fpExp2Test_0_to_regXAndExpOverflowAndNeg_uid58_fpExp2Test_2_q <= expOvfInitial_uid39_fpExp2Test_b;
            END IF;
        END IF;
    END PROCESS;


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
    exc_R_uid31_fpExp2Test_q_i <= exc_R_uid31_fpExp2Test_a and exc_R_uid31_fpExp2Test_b and exc_R_uid31_fpExp2Test_c;
    exc_R_uid31_fpExp2Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => exc_R_uid31_fpExp2Test_q, xin => exc_R_uid31_fpExp2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--regXAndExpOverflowAndPos_uid63_fpExp2Test(LOGICAL,62)@1
    regXAndExpOverflowAndPos_uid63_fpExp2Test_a <= exc_R_uid31_fpExp2Test_q;
    regXAndExpOverflowAndPos_uid63_fpExp2Test_b <= reg_expOvfInitial_uid39_fpExp2Test_0_to_regXAndExpOverflowAndNeg_uid58_fpExp2Test_2_q;
    regXAndExpOverflowAndPos_uid63_fpExp2Test_c <= InvSignX_uid62_fpExp2Test_q;
    regXAndExpOverflowAndPos_uid63_fpExp2Test_q <= regXAndExpOverflowAndPos_uid63_fpExp2Test_a and regXAndExpOverflowAndPos_uid63_fpExp2Test_b and regXAndExpOverflowAndPos_uid63_fpExp2Test_c;

	--ld_regXAndExpOverflowAndPos_uid63_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_c(DELAY,403)@1
    ld_regXAndExpOverflowAndPos_uid63_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => regXAndExpOverflowAndPos_uid63_fpExp2Test_q, xout => ld_regXAndExpOverflowAndPos_uid63_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expOvfInitial_uid39_fpExp2Test_b_to_InvExpOvfInitial_uid59_fpExp2Test_a(DELAY,385)@0
    ld_expOvfInitial_uid39_fpExp2Test_b_to_InvExpOvfInitial_uid59_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => expOvfInitial_uid39_fpExp2Test_b, xout => ld_expOvfInitial_uid39_fpExp2Test_b_to_InvExpOvfInitial_uid59_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvExpOvfInitial_uid59_fpExp2Test(LOGICAL,58)@6
    InvExpOvfInitial_uid59_fpExp2Test_a <= ld_expOvfInitial_uid39_fpExp2Test_b_to_InvExpOvfInitial_uid59_fpExp2Test_a_q;
    InvExpOvfInitial_uid59_fpExp2Test_q <= not InvExpOvfInitial_uid59_fpExp2Test_a;

	--reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1(REG,273)@5
    reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1_q <= "00000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1_q <= expRPostBiasPreExc_uid51_fpExp2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--expOvf_uid55_fpExp2Test(COMPARE,54)@6
    expOvf_uid55_fpExp2Test_cin <= GND_q;
    expOvf_uid55_fpExp2Test_a <= STD_LOGIC_VECTOR((15 downto 14 => reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1_q(13)) & reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1_q) & '0';
    expOvf_uid55_fpExp2Test_b <= STD_LOGIC_VECTOR('0' & "0000" & cstAllOWE_uid16_fpExp2Test_q) & expOvf_uid55_fpExp2Test_cin(0);
            expOvf_uid55_fpExp2Test_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid55_fpExp2Test_a) - SIGNED(expOvf_uid55_fpExp2Test_b));
    expOvf_uid55_fpExp2Test_n(0) <= not expOvf_uid55_fpExp2Test_o(16);


	--ld_exc_R_uid31_fpExp2Test_q_to_regXAndUdf_uid60_fpExp2Test_a(DELAY,386)@1
    ld_exc_R_uid31_fpExp2Test_q_to_regXAndUdf_uid60_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => exc_R_uid31_fpExp2Test_q, xout => ld_exc_R_uid31_fpExp2Test_q_to_regXAndUdf_uid60_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--regInAndOvf_uid65_fpExp2Test(LOGICAL,64)@6
    regInAndOvf_uid65_fpExp2Test_a <= ld_exc_R_uid31_fpExp2Test_q_to_regXAndUdf_uid60_fpExp2Test_a_q;
    regInAndOvf_uid65_fpExp2Test_b <= expOvf_uid55_fpExp2Test_n;
    regInAndOvf_uid65_fpExp2Test_c <= InvExpOvfInitial_uid59_fpExp2Test_q;
    regInAndOvf_uid65_fpExp2Test_q <= regInAndOvf_uid65_fpExp2Test_a and regInAndOvf_uid65_fpExp2Test_b and regInAndOvf_uid65_fpExp2Test_c;

	--ld_exc_I_uid25_fpExp2Test_q_to_posInf_uid67_fpExp2Test_a(DELAY,399)@0
    ld_exc_I_uid25_fpExp2Test_q_to_posInf_uid67_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_I_uid25_fpExp2Test_q, xout => ld_exc_I_uid25_fpExp2Test_q_to_posInf_uid67_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--posInf_uid67_fpExp2Test(LOGICAL,66)@1
    posInf_uid67_fpExp2Test_a <= ld_exc_I_uid25_fpExp2Test_q_to_posInf_uid67_fpExp2Test_a_q;
    posInf_uid67_fpExp2Test_b <= InvSignX_uid62_fpExp2Test_q;
    posInf_uid67_fpExp2Test_q <= posInf_uid67_fpExp2Test_a and posInf_uid67_fpExp2Test_b;

	--ld_posInf_uid67_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_a(DELAY,401)@1
    ld_posInf_uid67_fpExp2Test_q_to_excRInf_uid68_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
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

	--ld_negInf_uid57_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_c(DELAY,391)@0
    ld_negInf_uid57_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => negInf_uid57_fpExp2Test_q, xout => ld_negInf_uid57_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--regXAndExpOverflowAndNeg_uid58_fpExp2Test(LOGICAL,57)@1
    regXAndExpOverflowAndNeg_uid58_fpExp2Test_a <= exc_R_uid31_fpExp2Test_q;
    regXAndExpOverflowAndNeg_uid58_fpExp2Test_b <= reg_expOvfInitial_uid39_fpExp2Test_0_to_regXAndExpOverflowAndNeg_uid58_fpExp2Test_2_q;
    regXAndExpOverflowAndNeg_uid58_fpExp2Test_c <= ld_signX_uid7_fpExp2Test_b_to_onesCmpFxpIn_uid35_fpExp2Test_b_q;
    regXAndExpOverflowAndNeg_uid58_fpExp2Test_q <= regXAndExpOverflowAndNeg_uid58_fpExp2Test_a and regXAndExpOverflowAndNeg_uid58_fpExp2Test_b and regXAndExpOverflowAndNeg_uid58_fpExp2Test_c;

	--ld_regXAndExpOverflowAndNeg_uid58_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_b(DELAY,390)@1
    ld_regXAndExpOverflowAndNeg_uid58_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => regXAndExpOverflowAndNeg_uid58_fpExp2Test_q, xout => ld_regXAndExpOverflowAndNeg_uid58_fpExp2Test_q_to_excRZero_uid61_fpExp2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--expUdf_uid53_fpExp2Test(COMPARE,52)@6
    expUdf_uid53_fpExp2Test_cin <= GND_q;
    expUdf_uid53_fpExp2Test_a <= STD_LOGIC_VECTOR('0' & "00000000000000" & GND_q) & '0';
    expUdf_uid53_fpExp2Test_b <= STD_LOGIC_VECTOR((15 downto 14 => reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1_q(13)) & reg_expRPostBiasPreExc_uid51_fpExp2Test_0_to_expUdf_uid53_fpExp2Test_1_q) & expUdf_uid53_fpExp2Test_cin(0);
            expUdf_uid53_fpExp2Test_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid53_fpExp2Test_a) - SIGNED(expUdf_uid53_fpExp2Test_b));
    expUdf_uid53_fpExp2Test_n(0) <= not expUdf_uid53_fpExp2Test_o(16);


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

	--reg_concExc_uid69_fpExp2Test_0_to_excREnc_uid70_fpExp2Test_0(REG,277)@6
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
    expRPostExc_uid78_fpExp2Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostExc_uid78_fpExp2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRPostExc_uid78_fpExp2Test_s IS
                      WHEN "00" => expRPostExc_uid78_fpExp2Test_q <= cstZeroWE_uid13_fpExp2Test_q;
                      WHEN "01" => expRPostExc_uid78_fpExp2Test_q <= ld_expR_uid56_fpExp2Test_b_to_expRPostExc_uid78_fpExp2Test_d_q;
                      WHEN "10" => expRPostExc_uid78_fpExp2Test_q <= cstAllOWE_uid16_fpExp2Test_q;
                      WHEN "11" => expRPostExc_uid78_fpExp2Test_q <= cstAllOWE_uid16_fpExp2Test_q;
                      WHEN OTHERS => expRPostExc_uid78_fpExp2Test_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_inputreg(DELAY,727)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_inputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1 )
    PORT MAP ( xin => expRPostExc_uid78_fpExp2Test_q, xout => ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt(COUNTER,716)
    -- every=1, low=0, high=21, step=1, init=1
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_i = 20 THEN
                      ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_eq = '1') THEN
                        ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_i <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_i - 21;
                    ELSE
                        ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_i <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_i,5));


	--ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdreg(REG,717)
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdreg_q <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--xIn(GPIN,3)@0

	--ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdmux(MUX,718)
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdmux_s <= en;
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdmux: PROCESS (ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdmux_s, ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdreg_q, ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdmux_s IS
                  WHEN "0" => ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdmux_q <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdreg_q;
                  WHEN "1" => ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdmux_q <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem(DUALMEM,728)
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_ia <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_inputreg_q;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_aa <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdreg_q;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_ab <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdmux_q;
    ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 11,
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
        ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_q <= ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_iq(10 downto 0);

	--oneFracRPostExc2_uid71_fpExp2Test(CONSTANT,70)
    oneFracRPostExc2_uid71_fpExp2Test_q <= "0000000000000000000000000000000000000000000000000001";

	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_nor(LOGICAL,813)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_nor_b <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_sticky_ena_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_nor_q <= not (ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_nor_a or ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_nor_b);

	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_cmpReg(REG,811)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_sticky_ena(REG,814)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_nor_q = "1") THEN
                ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_sticky_ena_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_enaAnd(LOGICAL,815)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_enaAnd_a <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_sticky_ena_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_enaAnd_b <= en;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_enaAnd_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_enaAnd_a and ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_enaAnd_b;

	--y_uid45_fpExp2Test(BITSELECT,44)@4
    y_uid45_fpExp2Test_in <= rightShiftStage3_uid127_fxpInPostAlign_uid43_fpExp2Test_q(51 downto 0);
    y_uid45_fpExp2Test_b <= y_uid45_fpExp2Test_in(51 downto 0);

	--ld_y_uid45_fpExp2Test_b_to_yPPolyEval_uid48_fpExp2Test_a(DELAY,373)@4
    ld_y_uid45_fpExp2Test_b_to_yPPolyEval_uid48_fpExp2Test_a : dspba_delay
    GENERIC MAP ( width => 52, depth => 1 )
    PORT MAP ( xin => y_uid45_fpExp2Test_b, xout => ld_y_uid45_fpExp2Test_b_to_yPPolyEval_uid48_fpExp2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--yPPolyEval_uid48_fpExp2Test(BITSELECT,47)@5
    yPPolyEval_uid48_fpExp2Test_in <= ld_y_uid45_fpExp2Test_b_to_yPPolyEval_uid48_fpExp2Test_a_q(45 downto 0);
    yPPolyEval_uid48_fpExp2Test_b <= yPPolyEval_uid48_fpExp2Test_in(45 downto 0);

	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_inputreg(DELAY,805)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 46, depth => 1 )
    PORT MAP ( xin => yPPolyEval_uid48_fpExp2Test_b, xout => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdcnt(COUNTER,807)
    -- every=1, low=0, high=1, step=1, init=1
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdcnt_i <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdcnt_i,1));


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdreg(REG,808)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdreg_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdmux(MUX,809)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdmux_s <= en;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdmux: PROCESS (ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdmux_s, ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdreg_q, ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdmux_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdmux_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem(DUALMEM,806)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_ia <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_inputreg_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_aa <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdreg_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_ab <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_rdmux_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_iq,
        address_a => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_aa,
        data_a => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_ia
    );
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_reset0 <= areset;
        ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_iq(45 downto 0);

	--yT2_uid167_exp2PolyEval(BITSELECT,166)@9
    yT2_uid167_exp2PolyEval_in <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_replace_mem_q;
    yT2_uid167_exp2PolyEval_b <= yT2_uid167_exp2PolyEval_in(45 downto 19);

	--sSM0W_uid199_pT2_uid168_exp2PolyEval(BITSELECT,198)@9
    sSM0W_uid199_pT2_uid168_exp2PolyEval_in <= yT2_uid167_exp2PolyEval_b;
    sSM0W_uid199_pT2_uid168_exp2PolyEval_b <= sSM0W_uid199_pT2_uid168_exp2PolyEval_in(26 downto 22);

	--reg_sSM0W_uid199_pT2_uid168_exp2PolyEval_0_to_sm0_uid200_pT2_uid168_exp2PolyEval_1(REG,308)@9
    reg_sSM0W_uid199_pT2_uid168_exp2PolyEval_0_to_sm0_uid200_pT2_uid168_exp2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sSM0W_uid199_pT2_uid168_exp2PolyEval_0_to_sm0_uid200_pT2_uid168_exp2PolyEval_1_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sSM0W_uid199_pT2_uid168_exp2PolyEval_0_to_sm0_uid200_pT2_uid168_exp2PolyEval_1_q <= sSM0W_uid199_pT2_uid168_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--addr_uid47_fpExp2Test(BITSELECT,46)@4
    addr_uid47_fpExp2Test_in <= y_uid45_fpExp2Test_b;
    addr_uid47_fpExp2Test_b <= addr_uid47_fpExp2Test_in(51 downto 46);

	--reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0(REG,280)@4
    reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q <= addr_uid47_fpExp2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC5_uid159_exp2TabGen(LOOKUP,158)@5
    memoryC5_uid159_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC5_uid159_exp2TabGen_q <= "00101011";
                WHEN "000001" =>  memoryC5_uid159_exp2TabGen_q <= "00101100";
                WHEN "000010" =>  memoryC5_uid159_exp2TabGen_q <= "00101100";
                WHEN "000011" =>  memoryC5_uid159_exp2TabGen_q <= "00101101";
                WHEN "000100" =>  memoryC5_uid159_exp2TabGen_q <= "00101101";
                WHEN "000101" =>  memoryC5_uid159_exp2TabGen_q <= "00101110";
                WHEN "000110" =>  memoryC5_uid159_exp2TabGen_q <= "00101110";
                WHEN "000111" =>  memoryC5_uid159_exp2TabGen_q <= "00101111";
                WHEN "001000" =>  memoryC5_uid159_exp2TabGen_q <= "00101111";
                WHEN "001001" =>  memoryC5_uid159_exp2TabGen_q <= "00110000";
                WHEN "001010" =>  memoryC5_uid159_exp2TabGen_q <= "00110000";
                WHEN "001011" =>  memoryC5_uid159_exp2TabGen_q <= "00110001";
                WHEN "001100" =>  memoryC5_uid159_exp2TabGen_q <= "00110010";
                WHEN "001101" =>  memoryC5_uid159_exp2TabGen_q <= "00110010";
                WHEN "001110" =>  memoryC5_uid159_exp2TabGen_q <= "00110011";
                WHEN "001111" =>  memoryC5_uid159_exp2TabGen_q <= "00110011";
                WHEN "010000" =>  memoryC5_uid159_exp2TabGen_q <= "00110100";
                WHEN "010001" =>  memoryC5_uid159_exp2TabGen_q <= "00110100";
                WHEN "010010" =>  memoryC5_uid159_exp2TabGen_q <= "00110101";
                WHEN "010011" =>  memoryC5_uid159_exp2TabGen_q <= "00110101";
                WHEN "010100" =>  memoryC5_uid159_exp2TabGen_q <= "00110110";
                WHEN "010101" =>  memoryC5_uid159_exp2TabGen_q <= "00110111";
                WHEN "010110" =>  memoryC5_uid159_exp2TabGen_q <= "00110111";
                WHEN "010111" =>  memoryC5_uid159_exp2TabGen_q <= "00111000";
                WHEN "011000" =>  memoryC5_uid159_exp2TabGen_q <= "00111000";
                WHEN "011001" =>  memoryC5_uid159_exp2TabGen_q <= "00111001";
                WHEN "011010" =>  memoryC5_uid159_exp2TabGen_q <= "00111010";
                WHEN "011011" =>  memoryC5_uid159_exp2TabGen_q <= "00111010";
                WHEN "011100" =>  memoryC5_uid159_exp2TabGen_q <= "00111011";
                WHEN "011101" =>  memoryC5_uid159_exp2TabGen_q <= "00111100";
                WHEN "011110" =>  memoryC5_uid159_exp2TabGen_q <= "00111100";
                WHEN "011111" =>  memoryC5_uid159_exp2TabGen_q <= "00111101";
                WHEN "100000" =>  memoryC5_uid159_exp2TabGen_q <= "00111110";
                WHEN "100001" =>  memoryC5_uid159_exp2TabGen_q <= "00111110";
                WHEN "100010" =>  memoryC5_uid159_exp2TabGen_q <= "00111111";
                WHEN "100011" =>  memoryC5_uid159_exp2TabGen_q <= "01000000";
                WHEN "100100" =>  memoryC5_uid159_exp2TabGen_q <= "01000000";
                WHEN "100101" =>  memoryC5_uid159_exp2TabGen_q <= "01000001";
                WHEN "100110" =>  memoryC5_uid159_exp2TabGen_q <= "01000010";
                WHEN "100111" =>  memoryC5_uid159_exp2TabGen_q <= "01000011";
                WHEN "101000" =>  memoryC5_uid159_exp2TabGen_q <= "01000011";
                WHEN "101001" =>  memoryC5_uid159_exp2TabGen_q <= "01000100";
                WHEN "101010" =>  memoryC5_uid159_exp2TabGen_q <= "01000101";
                WHEN "101011" =>  memoryC5_uid159_exp2TabGen_q <= "01000110";
                WHEN "101100" =>  memoryC5_uid159_exp2TabGen_q <= "01000110";
                WHEN "101101" =>  memoryC5_uid159_exp2TabGen_q <= "01000111";
                WHEN "101110" =>  memoryC5_uid159_exp2TabGen_q <= "01001000";
                WHEN "101111" =>  memoryC5_uid159_exp2TabGen_q <= "01001001";
                WHEN "110000" =>  memoryC5_uid159_exp2TabGen_q <= "01001001";
                WHEN "110001" =>  memoryC5_uid159_exp2TabGen_q <= "01001010";
                WHEN "110010" =>  memoryC5_uid159_exp2TabGen_q <= "01001011";
                WHEN "110011" =>  memoryC5_uid159_exp2TabGen_q <= "01001100";
                WHEN "110100" =>  memoryC5_uid159_exp2TabGen_q <= "01001101";
                WHEN "110101" =>  memoryC5_uid159_exp2TabGen_q <= "01001110";
                WHEN "110110" =>  memoryC5_uid159_exp2TabGen_q <= "01001110";
                WHEN "110111" =>  memoryC5_uid159_exp2TabGen_q <= "01001111";
                WHEN "111000" =>  memoryC5_uid159_exp2TabGen_q <= "01010000";
                WHEN "111001" =>  memoryC5_uid159_exp2TabGen_q <= "01010001";
                WHEN "111010" =>  memoryC5_uid159_exp2TabGen_q <= "01010010";
                WHEN "111011" =>  memoryC5_uid159_exp2TabGen_q <= "01010011";
                WHEN "111100" =>  memoryC5_uid159_exp2TabGen_q <= "01010100";
                WHEN "111101" =>  memoryC5_uid159_exp2TabGen_q <= "01010101";
                WHEN "111110" =>  memoryC5_uid159_exp2TabGen_q <= "01010101";
                WHEN "111111" =>  memoryC5_uid159_exp2TabGen_q <= "01010110";
                WHEN OTHERS =>
                    memoryC5_uid159_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--memoryC5_uid158_exp2TabGen(LOOKUP,157)@5
    memoryC5_uid158_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC5_uid158_exp2TabGen_q <= "1110111001";
                WHEN "000001" =>  memoryC5_uid158_exp2TabGen_q <= "0111011010";
                WHEN "000010" =>  memoryC5_uid158_exp2TabGen_q <= "1101101110";
                WHEN "000011" =>  memoryC5_uid158_exp2TabGen_q <= "0110010100";
                WHEN "000100" =>  memoryC5_uid158_exp2TabGen_q <= "1101111010";
                WHEN "000101" =>  memoryC5_uid158_exp2TabGen_q <= "0101110101";
                WHEN "000110" =>  memoryC5_uid158_exp2TabGen_q <= "1110000101";
                WHEN "000111" =>  memoryC5_uid158_exp2TabGen_q <= "0101110000";
                WHEN "001000" =>  memoryC5_uid158_exp2TabGen_q <= "1110011110";
                WHEN "001001" =>  memoryC5_uid158_exp2TabGen_q <= "0110010110";
                WHEN "001010" =>  memoryC5_uid158_exp2TabGen_q <= "1111000101";
                WHEN "001011" =>  memoryC5_uid158_exp2TabGen_q <= "0111010100";
                WHEN "001100" =>  memoryC5_uid158_exp2TabGen_q <= "0000100010";
                WHEN "001101" =>  memoryC5_uid158_exp2TabGen_q <= "1001100001";
                WHEN "001110" =>  memoryC5_uid158_exp2TabGen_q <= "0010011111";
                WHEN "001111" =>  memoryC5_uid158_exp2TabGen_q <= "1010111011";
                WHEN "010000" =>  memoryC5_uid158_exp2TabGen_q <= "0100100100";
                WHEN "010001" =>  memoryC5_uid158_exp2TabGen_q <= "1101001001";
                WHEN "010010" =>  memoryC5_uid158_exp2TabGen_q <= "0110101100";
                WHEN "010011" =>  memoryC5_uid158_exp2TabGen_q <= "1111101110";
                WHEN "010100" =>  memoryC5_uid158_exp2TabGen_q <= "0111111111";
                WHEN "010101" =>  memoryC5_uid158_exp2TabGen_q <= "0001111010";
                WHEN "010110" =>  memoryC5_uid158_exp2TabGen_q <= "1011111100";
                WHEN "010111" =>  memoryC5_uid158_exp2TabGen_q <= "0101010101";
                WHEN "011000" =>  memoryC5_uid158_exp2TabGen_q <= "1111100000";
                WHEN "011001" =>  memoryC5_uid158_exp2TabGen_q <= "1010000000";
                WHEN "011010" =>  memoryC5_uid158_exp2TabGen_q <= "0011000111";
                WHEN "011011" =>  memoryC5_uid158_exp2TabGen_q <= "1101100000";
                WHEN "011100" =>  memoryC5_uid158_exp2TabGen_q <= "0111101101";
                WHEN "011101" =>  memoryC5_uid158_exp2TabGen_q <= "0010110001";
                WHEN "011110" =>  memoryC5_uid158_exp2TabGen_q <= "1011111101";
                WHEN "011111" =>  memoryC5_uid158_exp2TabGen_q <= "0111111100";
                WHEN "100000" =>  memoryC5_uid158_exp2TabGen_q <= "0010100100";
                WHEN "100001" =>  memoryC5_uid158_exp2TabGen_q <= "1100010111";
                WHEN "100010" =>  memoryC5_uid158_exp2TabGen_q <= "0111100110";
                WHEN "100011" =>  memoryC5_uid158_exp2TabGen_q <= "0010100001";
                WHEN "100100" =>  memoryC5_uid158_exp2TabGen_q <= "1101101101";
                WHEN "100101" =>  memoryC5_uid158_exp2TabGen_q <= "1010001111";
                WHEN "100110" =>  memoryC5_uid158_exp2TabGen_q <= "0101001110";
                WHEN "100111" =>  memoryC5_uid158_exp2TabGen_q <= "0000100001";
                WHEN "101000" =>  memoryC5_uid158_exp2TabGen_q <= "1011111010";
                WHEN "101001" =>  memoryC5_uid158_exp2TabGen_q <= "1000000100";
                WHEN "101010" =>  memoryC5_uid158_exp2TabGen_q <= "0011011100";
                WHEN "101011" =>  memoryC5_uid158_exp2TabGen_q <= "0000010100";
                WHEN "101100" =>  memoryC5_uid158_exp2TabGen_q <= "1011110001";
                WHEN "101101" =>  memoryC5_uid158_exp2TabGen_q <= "0111010100";
                WHEN "101110" =>  memoryC5_uid158_exp2TabGen_q <= "0101000110";
                WHEN "101111" =>  memoryC5_uid158_exp2TabGen_q <= "0001100111";
                WHEN "110000" =>  memoryC5_uid158_exp2TabGen_q <= "1101101011";
                WHEN "110001" =>  memoryC5_uid158_exp2TabGen_q <= "1010000101";
                WHEN "110010" =>  memoryC5_uid158_exp2TabGen_q <= "1000001111";
                WHEN "110011" =>  memoryC5_uid158_exp2TabGen_q <= "0101001100";
                WHEN "110100" =>  memoryC5_uid158_exp2TabGen_q <= "0010000110";
                WHEN "110101" =>  memoryC5_uid158_exp2TabGen_q <= "0000001011";
                WHEN "110110" =>  memoryC5_uid158_exp2TabGen_q <= "1101000111";
                WHEN "110111" =>  memoryC5_uid158_exp2TabGen_q <= "1011011011";
                WHEN "111000" =>  memoryC5_uid158_exp2TabGen_q <= "1001010010";
                WHEN "111001" =>  memoryC5_uid158_exp2TabGen_q <= "1000000101";
                WHEN "111010" =>  memoryC5_uid158_exp2TabGen_q <= "0100101100";
                WHEN "111011" =>  memoryC5_uid158_exp2TabGen_q <= "0011100111";
                WHEN "111100" =>  memoryC5_uid158_exp2TabGen_q <= "0010000100";
                WHEN "111101" =>  memoryC5_uid158_exp2TabGen_q <= "0000000110";
                WHEN "111110" =>  memoryC5_uid158_exp2TabGen_q <= "1111111111";
                WHEN "111111" =>  memoryC5_uid158_exp2TabGen_q <= "1111001001";
                WHEN OTHERS =>
                    memoryC5_uid158_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--os_uid160_exp2TabGen(BITJOIN,159)@5
    os_uid160_exp2TabGen_q <= memoryC5_uid159_exp2TabGen_q & memoryC5_uid158_exp2TabGen_q;

	--reg_os_uid160_exp2TabGen_0_to_prodXY_uid192_pT1_uid162_exp2PolyEval_1(REG,301)@5
    reg_os_uid160_exp2TabGen_0_to_prodXY_uid192_pT1_uid162_exp2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_os_uid160_exp2TabGen_0_to_prodXY_uid192_pT1_uid162_exp2PolyEval_1_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_os_uid160_exp2TabGen_0_to_prodXY_uid192_pT1_uid162_exp2PolyEval_1_q <= os_uid160_exp2TabGen_q;
            END IF;
        END IF;
    END PROCESS;


	--yT1_uid161_exp2PolyEval(BITSELECT,160)@5
    yT1_uid161_exp2PolyEval_in <= yPPolyEval_uid48_fpExp2Test_b;
    yT1_uid161_exp2PolyEval_b <= yT1_uid161_exp2PolyEval_in(45 downto 28);

	--reg_yT1_uid161_exp2PolyEval_0_to_prodXY_uid192_pT1_uid162_exp2PolyEval_0(REG,300)@5
    reg_yT1_uid161_exp2PolyEval_0_to_prodXY_uid192_pT1_uid162_exp2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid161_exp2PolyEval_0_to_prodXY_uid192_pT1_uid162_exp2PolyEval_0_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid161_exp2PolyEval_0_to_prodXY_uid192_pT1_uid162_exp2PolyEval_0_q <= yT1_uid161_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid192_pT1_uid162_exp2PolyEval(MULT,191)@6
    prodXY_uid192_pT1_uid162_exp2PolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid192_pT1_uid162_exp2PolyEval_a),19)) * SIGNED(prodXY_uid192_pT1_uid162_exp2PolyEval_b);
    prodXY_uid192_pT1_uid162_exp2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid192_pT1_uid162_exp2PolyEval_a <= (others => '0');
            prodXY_uid192_pT1_uid162_exp2PolyEval_b <= (others => '0');
            prodXY_uid192_pT1_uid162_exp2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid192_pT1_uid162_exp2PolyEval_a <= reg_yT1_uid161_exp2PolyEval_0_to_prodXY_uid192_pT1_uid162_exp2PolyEval_0_q;
                prodXY_uid192_pT1_uid162_exp2PolyEval_b <= reg_os_uid160_exp2TabGen_0_to_prodXY_uid192_pT1_uid162_exp2PolyEval_1_q;
                prodXY_uid192_pT1_uid162_exp2PolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid192_pT1_uid162_exp2PolyEval_pr,36));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid192_pT1_uid162_exp2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid192_pT1_uid162_exp2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid192_pT1_uid162_exp2PolyEval_q <= prodXY_uid192_pT1_uid162_exp2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid193_pT1_uid162_exp2PolyEval(BITSELECT,192)@9
    prodXYTruncFR_uid193_pT1_uid162_exp2PolyEval_in <= prodXY_uid192_pT1_uid162_exp2PolyEval_q;
    prodXYTruncFR_uid193_pT1_uid162_exp2PolyEval_b <= prodXYTruncFR_uid193_pT1_uid162_exp2PolyEval_in(35 downto 17);

	--highBBits_uid164_exp2PolyEval(BITSELECT,163)@9
    highBBits_uid164_exp2PolyEval_in <= prodXYTruncFR_uid193_pT1_uid162_exp2PolyEval_b;
    highBBits_uid164_exp2PolyEval_b <= highBBits_uid164_exp2PolyEval_in(18 downto 1);

	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid156_exp2TabGen_0_a(DELAY,679)@4
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid156_exp2TabGen_0_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 4 )
    PORT MAP ( xin => addr_uid47_fpExp2Test_b, xout => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid156_exp2TabGen_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid156_exp2TabGen_0(REG,304)@8
    reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid156_exp2TabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid156_exp2TabGen_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid156_exp2TabGen_0_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid156_exp2TabGen_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC4_uid156_exp2TabGen(LOOKUP,155)@9
    memoryC4_uid156_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid156_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid156_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC4_uid156_exp2TabGen_q <= "0010011";
                WHEN "000001" =>  memoryC4_uid156_exp2TabGen_q <= "0010011";
                WHEN "000010" =>  memoryC4_uid156_exp2TabGen_q <= "0010100";
                WHEN "000011" =>  memoryC4_uid156_exp2TabGen_q <= "0010100";
                WHEN "000100" =>  memoryC4_uid156_exp2TabGen_q <= "0010100";
                WHEN "000101" =>  memoryC4_uid156_exp2TabGen_q <= "0010100";
                WHEN "000110" =>  memoryC4_uid156_exp2TabGen_q <= "0010101";
                WHEN "000111" =>  memoryC4_uid156_exp2TabGen_q <= "0010101";
                WHEN "001000" =>  memoryC4_uid156_exp2TabGen_q <= "0010101";
                WHEN "001001" =>  memoryC4_uid156_exp2TabGen_q <= "0010101";
                WHEN "001010" =>  memoryC4_uid156_exp2TabGen_q <= "0010101";
                WHEN "001011" =>  memoryC4_uid156_exp2TabGen_q <= "0010110";
                WHEN "001100" =>  memoryC4_uid156_exp2TabGen_q <= "0010110";
                WHEN "001101" =>  memoryC4_uid156_exp2TabGen_q <= "0010110";
                WHEN "001110" =>  memoryC4_uid156_exp2TabGen_q <= "0010110";
                WHEN "001111" =>  memoryC4_uid156_exp2TabGen_q <= "0010111";
                WHEN "010000" =>  memoryC4_uid156_exp2TabGen_q <= "0010111";
                WHEN "010001" =>  memoryC4_uid156_exp2TabGen_q <= "0010111";
                WHEN "010010" =>  memoryC4_uid156_exp2TabGen_q <= "0010111";
                WHEN "010011" =>  memoryC4_uid156_exp2TabGen_q <= "0011000";
                WHEN "010100" =>  memoryC4_uid156_exp2TabGen_q <= "0011000";
                WHEN "010101" =>  memoryC4_uid156_exp2TabGen_q <= "0011000";
                WHEN "010110" =>  memoryC4_uid156_exp2TabGen_q <= "0011000";
                WHEN "010111" =>  memoryC4_uid156_exp2TabGen_q <= "0011001";
                WHEN "011000" =>  memoryC4_uid156_exp2TabGen_q <= "0011001";
                WHEN "011001" =>  memoryC4_uid156_exp2TabGen_q <= "0011001";
                WHEN "011010" =>  memoryC4_uid156_exp2TabGen_q <= "0011010";
                WHEN "011011" =>  memoryC4_uid156_exp2TabGen_q <= "0011010";
                WHEN "011100" =>  memoryC4_uid156_exp2TabGen_q <= "0011010";
                WHEN "011101" =>  memoryC4_uid156_exp2TabGen_q <= "0011010";
                WHEN "011110" =>  memoryC4_uid156_exp2TabGen_q <= "0011011";
                WHEN "011111" =>  memoryC4_uid156_exp2TabGen_q <= "0011011";
                WHEN "100000" =>  memoryC4_uid156_exp2TabGen_q <= "0011011";
                WHEN "100001" =>  memoryC4_uid156_exp2TabGen_q <= "0011100";
                WHEN "100010" =>  memoryC4_uid156_exp2TabGen_q <= "0011100";
                WHEN "100011" =>  memoryC4_uid156_exp2TabGen_q <= "0011100";
                WHEN "100100" =>  memoryC4_uid156_exp2TabGen_q <= "0011101";
                WHEN "100101" =>  memoryC4_uid156_exp2TabGen_q <= "0011101";
                WHEN "100110" =>  memoryC4_uid156_exp2TabGen_q <= "0011101";
                WHEN "100111" =>  memoryC4_uid156_exp2TabGen_q <= "0011110";
                WHEN "101000" =>  memoryC4_uid156_exp2TabGen_q <= "0011110";
                WHEN "101001" =>  memoryC4_uid156_exp2TabGen_q <= "0011110";
                WHEN "101010" =>  memoryC4_uid156_exp2TabGen_q <= "0011111";
                WHEN "101011" =>  memoryC4_uid156_exp2TabGen_q <= "0011111";
                WHEN "101100" =>  memoryC4_uid156_exp2TabGen_q <= "0011111";
                WHEN "101101" =>  memoryC4_uid156_exp2TabGen_q <= "0100000";
                WHEN "101110" =>  memoryC4_uid156_exp2TabGen_q <= "0100000";
                WHEN "101111" =>  memoryC4_uid156_exp2TabGen_q <= "0100000";
                WHEN "110000" =>  memoryC4_uid156_exp2TabGen_q <= "0100001";
                WHEN "110001" =>  memoryC4_uid156_exp2TabGen_q <= "0100001";
                WHEN "110010" =>  memoryC4_uid156_exp2TabGen_q <= "0100001";
                WHEN "110011" =>  memoryC4_uid156_exp2TabGen_q <= "0100010";
                WHEN "110100" =>  memoryC4_uid156_exp2TabGen_q <= "0100010";
                WHEN "110101" =>  memoryC4_uid156_exp2TabGen_q <= "0100010";
                WHEN "110110" =>  memoryC4_uid156_exp2TabGen_q <= "0100011";
                WHEN "110111" =>  memoryC4_uid156_exp2TabGen_q <= "0100011";
                WHEN "111000" =>  memoryC4_uid156_exp2TabGen_q <= "0100100";
                WHEN "111001" =>  memoryC4_uid156_exp2TabGen_q <= "0100100";
                WHEN "111010" =>  memoryC4_uid156_exp2TabGen_q <= "0100100";
                WHEN "111011" =>  memoryC4_uid156_exp2TabGen_q <= "0100101";
                WHEN "111100" =>  memoryC4_uid156_exp2TabGen_q <= "0100101";
                WHEN "111101" =>  memoryC4_uid156_exp2TabGen_q <= "0100110";
                WHEN "111110" =>  memoryC4_uid156_exp2TabGen_q <= "0100110";
                WHEN "111111" =>  memoryC4_uid156_exp2TabGen_q <= "0100110";
                WHEN OTHERS =>
                    memoryC4_uid156_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid154_exp2TabGen_0_q_to_memoryC4_uid154_exp2TabGen_a(DELAY,513)@5
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid154_exp2TabGen_0_q_to_memoryC4_uid154_exp2TabGen_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 4 )
    PORT MAP ( xin => reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q, xout => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid154_exp2TabGen_0_q_to_memoryC4_uid154_exp2TabGen_a_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC4_uid155_exp2TabGen(LOOKUP,154)@9
    memoryC4_uid155_exp2TabGen: PROCESS (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid154_exp2TabGen_0_q_to_memoryC4_uid154_exp2TabGen_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid154_exp2TabGen_0_q_to_memoryC4_uid154_exp2TabGen_a_q) IS
                WHEN "000000" =>  memoryC4_uid155_exp2TabGen_q <= "1011001010";
                WHEN "000001" =>  memoryC4_uid155_exp2TabGen_q <= "1110100101";
                WHEN "000010" =>  memoryC4_uid155_exp2TabGen_q <= "0010000100";
                WHEN "000011" =>  memoryC4_uid155_exp2TabGen_q <= "0101100100";
                WHEN "000100" =>  memoryC4_uid155_exp2TabGen_q <= "1001000111";
                WHEN "000101" =>  memoryC4_uid155_exp2TabGen_q <= "1100101100";
                WHEN "000110" =>  memoryC4_uid155_exp2TabGen_q <= "0000010100";
                WHEN "000111" =>  memoryC4_uid155_exp2TabGen_q <= "0011111111";
                WHEN "001000" =>  memoryC4_uid155_exp2TabGen_q <= "0111101011";
                WHEN "001001" =>  memoryC4_uid155_exp2TabGen_q <= "1011011011";
                WHEN "001010" =>  memoryC4_uid155_exp2TabGen_q <= "1111001101";
                WHEN "001011" =>  memoryC4_uid155_exp2TabGen_q <= "0011000010";
                WHEN "001100" =>  memoryC4_uid155_exp2TabGen_q <= "0110111001";
                WHEN "001101" =>  memoryC4_uid155_exp2TabGen_q <= "1010110011";
                WHEN "001110" =>  memoryC4_uid155_exp2TabGen_q <= "1110110000";
                WHEN "001111" =>  memoryC4_uid155_exp2TabGen_q <= "0010110000";
                WHEN "010000" =>  memoryC4_uid155_exp2TabGen_q <= "0110110010";
                WHEN "010001" =>  memoryC4_uid155_exp2TabGen_q <= "1010110111";
                WHEN "010010" =>  memoryC4_uid155_exp2TabGen_q <= "1110111111";
                WHEN "010011" =>  memoryC4_uid155_exp2TabGen_q <= "0011001010";
                WHEN "010100" =>  memoryC4_uid155_exp2TabGen_q <= "0111011000";
                WHEN "010101" =>  memoryC4_uid155_exp2TabGen_q <= "1011101001";
                WHEN "010110" =>  memoryC4_uid155_exp2TabGen_q <= "1111111101";
                WHEN "010111" =>  memoryC4_uid155_exp2TabGen_q <= "0100010100";
                WHEN "011000" =>  memoryC4_uid155_exp2TabGen_q <= "1000101101";
                WHEN "011001" =>  memoryC4_uid155_exp2TabGen_q <= "1101001010";
                WHEN "011010" =>  memoryC4_uid155_exp2TabGen_q <= "0001101010";
                WHEN "011011" =>  memoryC4_uid155_exp2TabGen_q <= "0110001101";
                WHEN "011100" =>  memoryC4_uid155_exp2TabGen_q <= "1010110011";
                WHEN "011101" =>  memoryC4_uid155_exp2TabGen_q <= "1111011101";
                WHEN "011110" =>  memoryC4_uid155_exp2TabGen_q <= "0100001010";
                WHEN "011111" =>  memoryC4_uid155_exp2TabGen_q <= "1000111001";
                WHEN "100000" =>  memoryC4_uid155_exp2TabGen_q <= "1101101101";
                WHEN "100001" =>  memoryC4_uid155_exp2TabGen_q <= "0010100011";
                WHEN "100010" =>  memoryC4_uid155_exp2TabGen_q <= "0111011101";
                WHEN "100011" =>  memoryC4_uid155_exp2TabGen_q <= "1100011011";
                WHEN "100100" =>  memoryC4_uid155_exp2TabGen_q <= "0001011100";
                WHEN "100101" =>  memoryC4_uid155_exp2TabGen_q <= "0110100000";
                WHEN "100110" =>  memoryC4_uid155_exp2TabGen_q <= "1011101000";
                WHEN "100111" =>  memoryC4_uid155_exp2TabGen_q <= "0000110011";
                WHEN "101000" =>  memoryC4_uid155_exp2TabGen_q <= "0110000011";
                WHEN "101001" =>  memoryC4_uid155_exp2TabGen_q <= "1011010101";
                WHEN "101010" =>  memoryC4_uid155_exp2TabGen_q <= "0000101100";
                WHEN "101011" =>  memoryC4_uid155_exp2TabGen_q <= "0110000110";
                WHEN "101100" =>  memoryC4_uid155_exp2TabGen_q <= "1011100100";
                WHEN "101101" =>  memoryC4_uid155_exp2TabGen_q <= "0001000110";
                WHEN "101110" =>  memoryC4_uid155_exp2TabGen_q <= "0110101011";
                WHEN "101111" =>  memoryC4_uid155_exp2TabGen_q <= "1100010100";
                WHEN "110000" =>  memoryC4_uid155_exp2TabGen_q <= "0010000010";
                WHEN "110001" =>  memoryC4_uid155_exp2TabGen_q <= "0111110011";
                WHEN "110010" =>  memoryC4_uid155_exp2TabGen_q <= "1101101001";
                WHEN "110011" =>  memoryC4_uid155_exp2TabGen_q <= "0011100010";
                WHEN "110100" =>  memoryC4_uid155_exp2TabGen_q <= "1001100000";
                WHEN "110101" =>  memoryC4_uid155_exp2TabGen_q <= "1111100010";
                WHEN "110110" =>  memoryC4_uid155_exp2TabGen_q <= "0101101000";
                WHEN "110111" =>  memoryC4_uid155_exp2TabGen_q <= "1011110010";
                WHEN "111000" =>  memoryC4_uid155_exp2TabGen_q <= "0010000000";
                WHEN "111001" =>  memoryC4_uid155_exp2TabGen_q <= "1000010011";
                WHEN "111010" =>  memoryC4_uid155_exp2TabGen_q <= "1110101010";
                WHEN "111011" =>  memoryC4_uid155_exp2TabGen_q <= "0101000110";
                WHEN "111100" =>  memoryC4_uid155_exp2TabGen_q <= "1011100110";
                WHEN "111101" =>  memoryC4_uid155_exp2TabGen_q <= "0010001011";
                WHEN "111110" =>  memoryC4_uid155_exp2TabGen_q <= "1000110100";
                WHEN "111111" =>  memoryC4_uid155_exp2TabGen_q <= "1111100010";
                WHEN OTHERS =>
                    memoryC4_uid155_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--memoryC4_uid154_exp2TabGen(LOOKUP,153)@9
    memoryC4_uid154_exp2TabGen: PROCESS (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid154_exp2TabGen_0_q_to_memoryC4_uid154_exp2TabGen_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC4_uid154_exp2TabGen_0_q_to_memoryC4_uid154_exp2TabGen_a_q) IS
                WHEN "000000" =>  memoryC4_uid154_exp2TabGen_q <= "0110100100";
                WHEN "000001" =>  memoryC4_uid154_exp2TabGen_q <= "1110100010";
                WHEN "000010" =>  memoryC4_uid154_exp2TabGen_q <= "0010101101";
                WHEN "000011" =>  memoryC4_uid154_exp2TabGen_q <= "0111111001";
                WHEN "000100" =>  memoryC4_uid154_exp2TabGen_q <= "0111000100";
                WHEN "000101" =>  memoryC4_uid154_exp2TabGen_q <= "1101000011";
                WHEN "000110" =>  memoryC4_uid154_exp2TabGen_q <= "1010011101";
                WHEN "000111" =>  memoryC4_uid154_exp2TabGen_q <= "0010001100";
                WHEN "001000" =>  memoryC4_uid154_exp2TabGen_q <= "1111111110";
                WHEN "001001" =>  memoryC4_uid154_exp2TabGen_q <= "1001010110";
                WHEN "001010" =>  memoryC4_uid154_exp2TabGen_q <= "1010110111";
                WHEN "001011" =>  memoryC4_uid154_exp2TabGen_q <= "0111101001";
                WHEN "001100" =>  memoryC4_uid154_exp2TabGen_q <= "1100111100";
                WHEN "001101" =>  memoryC4_uid154_exp2TabGen_q <= "1110011011";
                WHEN "001110" =>  memoryC4_uid154_exp2TabGen_q <= "1011011110";
                WHEN "001111" =>  memoryC4_uid154_exp2TabGen_q <= "0110011011";
                WHEN "010000" =>  memoryC4_uid154_exp2TabGen_q <= "1010110110";
                WHEN "010001" =>  memoryC4_uid154_exp2TabGen_q <= "1111010000";
                WHEN "010010" =>  memoryC4_uid154_exp2TabGen_q <= "1111010101";
                WHEN "010011" =>  memoryC4_uid154_exp2TabGen_q <= "1110100000";
                WHEN "010100" =>  memoryC4_uid154_exp2TabGen_q <= "1110110001";
                WHEN "010101" =>  memoryC4_uid154_exp2TabGen_q <= "1001111100";
                WHEN "010110" =>  memoryC4_uid154_exp2TabGen_q <= "0100100001";
                WHEN "010111" =>  memoryC4_uid154_exp2TabGen_q <= "0001010111";
                WHEN "011000" =>  memoryC4_uid154_exp2TabGen_q <= "1100101100";
                WHEN "011001" =>  memoryC4_uid154_exp2TabGen_q <= "1000011111";
                WHEN "011010" =>  memoryC4_uid154_exp2TabGen_q <= "1001111100";
                WHEN "011011" =>  memoryC4_uid154_exp2TabGen_q <= "1010011100";
                WHEN "011100" =>  memoryC4_uid154_exp2TabGen_q <= "1110110011";
                WHEN "011101" =>  memoryC4_uid154_exp2TabGen_q <= "0011111011";
                WHEN "011110" =>  memoryC4_uid154_exp2TabGen_q <= "0010100100";
                WHEN "011111" =>  memoryC4_uid154_exp2TabGen_q <= "1110000111";
                WHEN "100000" =>  memoryC4_uid154_exp2TabGen_q <= "0010101110";
                WHEN "100001" =>  memoryC4_uid154_exp2TabGen_q <= "1111101000";
                WHEN "100010" =>  memoryC4_uid154_exp2TabGen_q <= "1110110001";
                WHEN "100011" =>  memoryC4_uid154_exp2TabGen_q <= "0101101110";
                WHEN "100100" =>  memoryC4_uid154_exp2TabGen_q <= "0011111100";
                WHEN "100101" =>  memoryC4_uid154_exp2TabGen_q <= "0110100101";
                WHEN "100110" =>  memoryC4_uid154_exp2TabGen_q <= "0110001011";
                WHEN "100111" =>  memoryC4_uid154_exp2TabGen_q <= "1110100100";
                WHEN "101000" =>  memoryC4_uid154_exp2TabGen_q <= "0000101101";
                WHEN "101001" =>  memoryC4_uid154_exp2TabGen_q <= "1011010010";
                WHEN "101010" =>  memoryC4_uid154_exp2TabGen_q <= "0011110100";
                WHEN "101011" =>  memoryC4_uid154_exp2TabGen_q <= "0011111000";
                WHEN "101100" =>  memoryC4_uid154_exp2TabGen_q <= "0100100100";
                WHEN "101101" =>  memoryC4_uid154_exp2TabGen_q <= "0010001110";
                WHEN "101110" =>  memoryC4_uid154_exp2TabGen_q <= "1000000001";
                WHEN "101111" =>  memoryC4_uid154_exp2TabGen_q <= "1111111110";
                WHEN "110000" =>  memoryC4_uid154_exp2TabGen_q <= "1000001111";
                WHEN "110001" =>  memoryC4_uid154_exp2TabGen_q <= "1111101110";
                WHEN "110010" =>  memoryC4_uid154_exp2TabGen_q <= "0011010011";
                WHEN "110011" =>  memoryC4_uid154_exp2TabGen_q <= "1011100101";
                WHEN "110100" =>  memoryC4_uid154_exp2TabGen_q <= "0101111010";
                WHEN "110101" =>  memoryC4_uid154_exp2TabGen_q <= "0000001111";
                WHEN "110110" =>  memoryC4_uid154_exp2TabGen_q <= "0001011000";
                WHEN "110111" =>  memoryC4_uid154_exp2TabGen_q <= "0010100100";
                WHEN "111000" =>  memoryC4_uid154_exp2TabGen_q <= "1010100101";
                WHEN "111001" =>  memoryC4_uid154_exp2TabGen_q <= "0101110100";
                WHEN "111010" =>  memoryC4_uid154_exp2TabGen_q <= "1101010000";
                WHEN "111011" =>  memoryC4_uid154_exp2TabGen_q <= "0101111101";
                WHEN "111100" =>  memoryC4_uid154_exp2TabGen_q <= "1000001001";
                WHEN "111101" =>  memoryC4_uid154_exp2TabGen_q <= "0100011010";
                WHEN "111110" =>  memoryC4_uid154_exp2TabGen_q <= "0101011101";
                WHEN "111111" =>  memoryC4_uid154_exp2TabGen_q <= "0010110101";
                WHEN OTHERS =>
                    memoryC4_uid154_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--os_uid157_exp2TabGen(BITJOIN,156)@9
    os_uid157_exp2TabGen_q <= memoryC4_uid156_exp2TabGen_q & memoryC4_uid155_exp2TabGen_q & memoryC4_uid154_exp2TabGen_q;

	--sumAHighB_uid165_exp2PolyEval(ADD,164)@9
    sumAHighB_uid165_exp2PolyEval_a <= STD_LOGIC_VECTOR((27 downto 27 => os_uid157_exp2TabGen_q(26)) & os_uid157_exp2TabGen_q);
    sumAHighB_uid165_exp2PolyEval_b <= STD_LOGIC_VECTOR((27 downto 18 => highBBits_uid164_exp2PolyEval_b(17)) & highBBits_uid164_exp2PolyEval_b);
            sumAHighB_uid165_exp2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid165_exp2PolyEval_a) + SIGNED(sumAHighB_uid165_exp2PolyEval_b));
    sumAHighB_uid165_exp2PolyEval_q <= sumAHighB_uid165_exp2PolyEval_o(27 downto 0);


	--lowRangeB_uid163_exp2PolyEval(BITSELECT,162)@9
    lowRangeB_uid163_exp2PolyEval_in <= prodXYTruncFR_uid193_pT1_uid162_exp2PolyEval_b(0 downto 0);
    lowRangeB_uid163_exp2PolyEval_b <= lowRangeB_uid163_exp2PolyEval_in(0 downto 0);

	--s1_uid163_uid166_exp2PolyEval(BITJOIN,165)@9
    s1_uid163_uid166_exp2PolyEval_q <= sumAHighB_uid165_exp2PolyEval_q & lowRangeB_uid163_exp2PolyEval_b;

	--sSM0H_uid198_pT2_uid168_exp2PolyEval(BITSELECT,197)@9
    sSM0H_uid198_pT2_uid168_exp2PolyEval_in <= s1_uid163_uid166_exp2PolyEval_q(1 downto 0);
    sSM0H_uid198_pT2_uid168_exp2PolyEval_b <= sSM0H_uid198_pT2_uid168_exp2PolyEval_in(1 downto 0);

	--reg_sSM0H_uid198_pT2_uid168_exp2PolyEval_0_to_sm0_uid200_pT2_uid168_exp2PolyEval_0(REG,307)@9
    reg_sSM0H_uid198_pT2_uid168_exp2PolyEval_0_to_sm0_uid200_pT2_uid168_exp2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sSM0H_uid198_pT2_uid168_exp2PolyEval_0_to_sm0_uid200_pT2_uid168_exp2PolyEval_0_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sSM0H_uid198_pT2_uid168_exp2PolyEval_0_to_sm0_uid200_pT2_uid168_exp2PolyEval_0_q <= sSM0H_uid198_pT2_uid168_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--sm0_uid200_pT2_uid168_exp2PolyEval(MULT,199)@10
    sm0_uid200_pT2_uid168_exp2PolyEval_pr <= UNSIGNED(sm0_uid200_pT2_uid168_exp2PolyEval_a) * UNSIGNED(sm0_uid200_pT2_uid168_exp2PolyEval_b);
    sm0_uid200_pT2_uid168_exp2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid200_pT2_uid168_exp2PolyEval_a <= (others => '0');
            sm0_uid200_pT2_uid168_exp2PolyEval_b <= (others => '0');
            sm0_uid200_pT2_uid168_exp2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm0_uid200_pT2_uid168_exp2PolyEval_a <= reg_sSM0H_uid198_pT2_uid168_exp2PolyEval_0_to_sm0_uid200_pT2_uid168_exp2PolyEval_0_q;
                sm0_uid200_pT2_uid168_exp2PolyEval_b <= reg_sSM0W_uid199_pT2_uid168_exp2PolyEval_0_to_sm0_uid200_pT2_uid168_exp2PolyEval_1_q;
                sm0_uid200_pT2_uid168_exp2PolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid200_pT2_uid168_exp2PolyEval_pr);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid200_pT2_uid168_exp2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid200_pT2_uid168_exp2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm0_uid200_pT2_uid168_exp2PolyEval_q <= sm0_uid200_pT2_uid168_exp2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--yTop27Bits_uid196_pT2_uid168_exp2PolyEval(BITSELECT,195)@9
    yTop27Bits_uid196_pT2_uid168_exp2PolyEval_in <= s1_uid163_uid166_exp2PolyEval_q;
    yTop27Bits_uid196_pT2_uid168_exp2PolyEval_b <= yTop27Bits_uid196_pT2_uid168_exp2PolyEval_in(28 downto 2);

	--reg_yTop27Bits_uid196_pT2_uid168_exp2PolyEval_0_to_topProd_uid197_pT2_uid168_exp2PolyEval_1(REG,306)@9
    reg_yTop27Bits_uid196_pT2_uid168_exp2PolyEval_0_to_topProd_uid197_pT2_uid168_exp2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid196_pT2_uid168_exp2PolyEval_0_to_topProd_uid197_pT2_uid168_exp2PolyEval_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid196_pT2_uid168_exp2PolyEval_0_to_topProd_uid197_pT2_uid168_exp2PolyEval_1_q <= yTop27Bits_uid196_pT2_uid168_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid197_pT2_uid168_exp2PolyEval_0(REG,305)@9
    reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid197_pT2_uid168_exp2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid197_pT2_uid168_exp2PolyEval_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid197_pT2_uid168_exp2PolyEval_0_q <= yT2_uid167_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--topProd_uid197_pT2_uid168_exp2PolyEval(MULT,196)@10
    topProd_uid197_pT2_uid168_exp2PolyEval_pr <= signed(resize(UNSIGNED(topProd_uid197_pT2_uid168_exp2PolyEval_a),28)) * SIGNED(topProd_uid197_pT2_uid168_exp2PolyEval_b);
    topProd_uid197_pT2_uid168_exp2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid197_pT2_uid168_exp2PolyEval_a <= (others => '0');
            topProd_uid197_pT2_uid168_exp2PolyEval_b <= (others => '0');
            topProd_uid197_pT2_uid168_exp2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid197_pT2_uid168_exp2PolyEval_a <= reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid197_pT2_uid168_exp2PolyEval_0_q;
                topProd_uid197_pT2_uid168_exp2PolyEval_b <= reg_yTop27Bits_uid196_pT2_uid168_exp2PolyEval_0_to_topProd_uid197_pT2_uid168_exp2PolyEval_1_q;
                topProd_uid197_pT2_uid168_exp2PolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid197_pT2_uid168_exp2PolyEval_pr,54));
            END IF;
        END IF;
    END PROCESS;
    topProd_uid197_pT2_uid168_exp2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid197_pT2_uid168_exp2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid197_pT2_uid168_exp2PolyEval_q <= topProd_uid197_pT2_uid168_exp2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--highABits_uid202_pT2_uid168_exp2PolyEval(BITSELECT,201)@13
    highABits_uid202_pT2_uid168_exp2PolyEval_in <= topProd_uid197_pT2_uid168_exp2PolyEval_q;
    highABits_uid202_pT2_uid168_exp2PolyEval_b <= highABits_uid202_pT2_uid168_exp2PolyEval_in(53 downto 20);

	--sumHighA_B_uid203_pT2_uid168_exp2PolyEval(ADD,202)@13
    sumHighA_B_uid203_pT2_uid168_exp2PolyEval_a <= STD_LOGIC_VECTOR((35 downto 34 => highABits_uid202_pT2_uid168_exp2PolyEval_b(33)) & highABits_uid202_pT2_uid168_exp2PolyEval_b);
    sumHighA_B_uid203_pT2_uid168_exp2PolyEval_b <= STD_LOGIC_VECTOR('0' & "0000000000000000000000000000" & sm0_uid200_pT2_uid168_exp2PolyEval_q);
            sumHighA_B_uid203_pT2_uid168_exp2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumHighA_B_uid203_pT2_uid168_exp2PolyEval_a) + SIGNED(sumHighA_B_uid203_pT2_uid168_exp2PolyEval_b));
    sumHighA_B_uid203_pT2_uid168_exp2PolyEval_q <= sumHighA_B_uid203_pT2_uid168_exp2PolyEval_o(34 downto 0);


	--lowRangeA_uid201_pT2_uid168_exp2PolyEval(BITSELECT,200)@13
    lowRangeA_uid201_pT2_uid168_exp2PolyEval_in <= topProd_uid197_pT2_uid168_exp2PolyEval_q(19 downto 0);
    lowRangeA_uid201_pT2_uid168_exp2PolyEval_b <= lowRangeA_uid201_pT2_uid168_exp2PolyEval_in(19 downto 0);

	--add0_uid201_uid204_pT2_uid168_exp2PolyEval(BITJOIN,203)@13
    add0_uid201_uid204_pT2_uid168_exp2PolyEval_q <= sumHighA_B_uid203_pT2_uid168_exp2PolyEval_q & lowRangeA_uid201_pT2_uid168_exp2PolyEval_b;

	--R_uid205_pT2_uid168_exp2PolyEval(BITSELECT,204)@13
    R_uid205_pT2_uid168_exp2PolyEval_in <= add0_uid201_uid204_pT2_uid168_exp2PolyEval_q(53 downto 0);
    R_uid205_pT2_uid168_exp2PolyEval_b <= R_uid205_pT2_uid168_exp2PolyEval_in(53 downto 23);

	--reg_R_uid205_pT2_uid168_exp2PolyEval_0_to_ts2_uid171_exp2PolyEval_1(REG,310)@13
    reg_R_uid205_pT2_uid168_exp2PolyEval_0_to_ts2_uid171_exp2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid205_pT2_uid168_exp2PolyEval_0_to_ts2_uid171_exp2PolyEval_1_q <= "0000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_R_uid205_pT2_uid168_exp2PolyEval_0_to_ts2_uid171_exp2PolyEval_1_q <= R_uid205_pT2_uid168_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_nor(LOGICAL,917)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_nor_b <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_sticky_ena_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_nor_q <= not (ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_nor_a or ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_nor_b);

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_mem_top(CONSTANT,798)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_mem_top_q <= "0101";

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmp(LOGICAL,799)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmp_a <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_mem_top_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdmux_q);
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmp_q <= "1" when ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmp_a = ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmp_b else "0";

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmpReg(REG,800)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmpReg_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_sticky_ena(REG,918)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_nor_q = "1") THEN
                ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_sticky_ena_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_enaAnd(LOGICAL,919)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_enaAnd_a <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_sticky_ena_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_enaAnd_b <= en;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_enaAnd_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_enaAnd_a and ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_enaAnd_b;

	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_inputreg(DELAY,868)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => addr_uid47_fpExp2Test_b, xout => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt(COUNTER,794)
    -- every=1, low=0, high=5, step=1, init=1
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_i = 4 THEN
                      ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_i <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_i - 5;
                    ELSE
                        ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_i <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_i,3));


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdreg(REG,795)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdreg_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdmux(MUX,796)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdmux_s <= en;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdmux: PROCESS (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdmux_s, ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdreg_q, ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdmux_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdmux_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem(DUALMEM,908)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_ia <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_inputreg_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_aa <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdreg_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_ab <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdmux_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 6,
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
        clocken1 => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_iq,
        address_a => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_aa,
        data_a => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_ia
    );
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_reset0 <= areset;
        ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_iq(5 downto 0);

	--reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0(REG,294)@12
    reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC3_uid152_exp2TabGen(LOOKUP,151)@13
    memoryC3_uid152_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC3_uid152_exp2TabGen_q <= "001110";
                WHEN "000001" =>  memoryC3_uid152_exp2TabGen_q <= "001110";
                WHEN "000010" =>  memoryC3_uid152_exp2TabGen_q <= "001110";
                WHEN "000011" =>  memoryC3_uid152_exp2TabGen_q <= "001110";
                WHEN "000100" =>  memoryC3_uid152_exp2TabGen_q <= "001110";
                WHEN "000101" =>  memoryC3_uid152_exp2TabGen_q <= "001110";
                WHEN "000110" =>  memoryC3_uid152_exp2TabGen_q <= "001111";
                WHEN "000111" =>  memoryC3_uid152_exp2TabGen_q <= "001111";
                WHEN "001000" =>  memoryC3_uid152_exp2TabGen_q <= "001111";
                WHEN "001001" =>  memoryC3_uid152_exp2TabGen_q <= "001111";
                WHEN "001010" =>  memoryC3_uid152_exp2TabGen_q <= "001111";
                WHEN "001011" =>  memoryC3_uid152_exp2TabGen_q <= "010000";
                WHEN "001100" =>  memoryC3_uid152_exp2TabGen_q <= "010000";
                WHEN "001101" =>  memoryC3_uid152_exp2TabGen_q <= "010000";
                WHEN "001110" =>  memoryC3_uid152_exp2TabGen_q <= "010000";
                WHEN "001111" =>  memoryC3_uid152_exp2TabGen_q <= "010000";
                WHEN "010000" =>  memoryC3_uid152_exp2TabGen_q <= "010000";
                WHEN "010001" =>  memoryC3_uid152_exp2TabGen_q <= "010001";
                WHEN "010010" =>  memoryC3_uid152_exp2TabGen_q <= "010001";
                WHEN "010011" =>  memoryC3_uid152_exp2TabGen_q <= "010001";
                WHEN "010100" =>  memoryC3_uid152_exp2TabGen_q <= "010001";
                WHEN "010101" =>  memoryC3_uid152_exp2TabGen_q <= "010001";
                WHEN "010110" =>  memoryC3_uid152_exp2TabGen_q <= "010010";
                WHEN "010111" =>  memoryC3_uid152_exp2TabGen_q <= "010010";
                WHEN "011000" =>  memoryC3_uid152_exp2TabGen_q <= "010010";
                WHEN "011001" =>  memoryC3_uid152_exp2TabGen_q <= "010010";
                WHEN "011010" =>  memoryC3_uid152_exp2TabGen_q <= "010010";
                WHEN "011011" =>  memoryC3_uid152_exp2TabGen_q <= "010011";
                WHEN "011100" =>  memoryC3_uid152_exp2TabGen_q <= "010011";
                WHEN "011101" =>  memoryC3_uid152_exp2TabGen_q <= "010011";
                WHEN "011110" =>  memoryC3_uid152_exp2TabGen_q <= "010011";
                WHEN "011111" =>  memoryC3_uid152_exp2TabGen_q <= "010011";
                WHEN "100000" =>  memoryC3_uid152_exp2TabGen_q <= "010100";
                WHEN "100001" =>  memoryC3_uid152_exp2TabGen_q <= "010100";
                WHEN "100010" =>  memoryC3_uid152_exp2TabGen_q <= "010100";
                WHEN "100011" =>  memoryC3_uid152_exp2TabGen_q <= "010100";
                WHEN "100100" =>  memoryC3_uid152_exp2TabGen_q <= "010100";
                WHEN "100101" =>  memoryC3_uid152_exp2TabGen_q <= "010101";
                WHEN "100110" =>  memoryC3_uid152_exp2TabGen_q <= "010101";
                WHEN "100111" =>  memoryC3_uid152_exp2TabGen_q <= "010101";
                WHEN "101000" =>  memoryC3_uid152_exp2TabGen_q <= "010101";
                WHEN "101001" =>  memoryC3_uid152_exp2TabGen_q <= "010110";
                WHEN "101010" =>  memoryC3_uid152_exp2TabGen_q <= "010110";
                WHEN "101011" =>  memoryC3_uid152_exp2TabGen_q <= "010110";
                WHEN "101100" =>  memoryC3_uid152_exp2TabGen_q <= "010110";
                WHEN "101101" =>  memoryC3_uid152_exp2TabGen_q <= "010111";
                WHEN "101110" =>  memoryC3_uid152_exp2TabGen_q <= "010111";
                WHEN "101111" =>  memoryC3_uid152_exp2TabGen_q <= "010111";
                WHEN "110000" =>  memoryC3_uid152_exp2TabGen_q <= "010111";
                WHEN "110001" =>  memoryC3_uid152_exp2TabGen_q <= "011000";
                WHEN "110010" =>  memoryC3_uid152_exp2TabGen_q <= "011000";
                WHEN "110011" =>  memoryC3_uid152_exp2TabGen_q <= "011000";
                WHEN "110100" =>  memoryC3_uid152_exp2TabGen_q <= "011000";
                WHEN "110101" =>  memoryC3_uid152_exp2TabGen_q <= "011001";
                WHEN "110110" =>  memoryC3_uid152_exp2TabGen_q <= "011001";
                WHEN "110111" =>  memoryC3_uid152_exp2TabGen_q <= "011001";
                WHEN "111000" =>  memoryC3_uid152_exp2TabGen_q <= "011010";
                WHEN "111001" =>  memoryC3_uid152_exp2TabGen_q <= "011010";
                WHEN "111010" =>  memoryC3_uid152_exp2TabGen_q <= "011010";
                WHEN "111011" =>  memoryC3_uid152_exp2TabGen_q <= "011010";
                WHEN "111100" =>  memoryC3_uid152_exp2TabGen_q <= "011011";
                WHEN "111101" =>  memoryC3_uid152_exp2TabGen_q <= "011011";
                WHEN "111110" =>  memoryC3_uid152_exp2TabGen_q <= "011011";
                WHEN "111111" =>  memoryC3_uid152_exp2TabGen_q <= "011100";
                WHEN OTHERS =>
                    memoryC3_uid152_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--memoryC3_uid151_exp2TabGen(LOOKUP,150)@13
    memoryC3_uid151_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC3_uid151_exp2TabGen_q <= "0011010110";
                WHEN "000001" =>  memoryC3_uid151_exp2TabGen_q <= "0101110100";
                WHEN "000010" =>  memoryC3_uid151_exp2TabGen_q <= "1000010100";
                WHEN "000011" =>  memoryC3_uid151_exp2TabGen_q <= "1010110110";
                WHEN "000100" =>  memoryC3_uid151_exp2TabGen_q <= "1101011010";
                WHEN "000101" =>  memoryC3_uid151_exp2TabGen_q <= "1111111111";
                WHEN "000110" =>  memoryC3_uid151_exp2TabGen_q <= "0010100110";
                WHEN "000111" =>  memoryC3_uid151_exp2TabGen_q <= "0101010000";
                WHEN "001000" =>  memoryC3_uid151_exp2TabGen_q <= "0111111010";
                WHEN "001001" =>  memoryC3_uid151_exp2TabGen_q <= "1010100111";
                WHEN "001010" =>  memoryC3_uid151_exp2TabGen_q <= "1101010110";
                WHEN "001011" =>  memoryC3_uid151_exp2TabGen_q <= "0000000110";
                WHEN "001100" =>  memoryC3_uid151_exp2TabGen_q <= "0010111001";
                WHEN "001101" =>  memoryC3_uid151_exp2TabGen_q <= "0101101101";
                WHEN "001110" =>  memoryC3_uid151_exp2TabGen_q <= "1000100100";
                WHEN "001111" =>  memoryC3_uid151_exp2TabGen_q <= "1011011100";
                WHEN "010000" =>  memoryC3_uid151_exp2TabGen_q <= "1110010111";
                WHEN "010001" =>  memoryC3_uid151_exp2TabGen_q <= "0001010011";
                WHEN "010010" =>  memoryC3_uid151_exp2TabGen_q <= "0100010001";
                WHEN "010011" =>  memoryC3_uid151_exp2TabGen_q <= "0111010010";
                WHEN "010100" =>  memoryC3_uid151_exp2TabGen_q <= "1010010101";
                WHEN "010101" =>  memoryC3_uid151_exp2TabGen_q <= "1101011001";
                WHEN "010110" =>  memoryC3_uid151_exp2TabGen_q <= "0000100000";
                WHEN "010111" =>  memoryC3_uid151_exp2TabGen_q <= "0011101001";
                WHEN "011000" =>  memoryC3_uid151_exp2TabGen_q <= "0110110101";
                WHEN "011001" =>  memoryC3_uid151_exp2TabGen_q <= "1010000010";
                WHEN "011010" =>  memoryC3_uid151_exp2TabGen_q <= "1101010010";
                WHEN "011011" =>  memoryC3_uid151_exp2TabGen_q <= "0000100100";
                WHEN "011100" =>  memoryC3_uid151_exp2TabGen_q <= "0011111000";
                WHEN "011101" =>  memoryC3_uid151_exp2TabGen_q <= "0111001111";
                WHEN "011110" =>  memoryC3_uid151_exp2TabGen_q <= "1010100111";
                WHEN "011111" =>  memoryC3_uid151_exp2TabGen_q <= "1110000011";
                WHEN "100000" =>  memoryC3_uid151_exp2TabGen_q <= "0001100000";
                WHEN "100001" =>  memoryC3_uid151_exp2TabGen_q <= "0101000000";
                WHEN "100010" =>  memoryC3_uid151_exp2TabGen_q <= "1000100011";
                WHEN "100011" =>  memoryC3_uid151_exp2TabGen_q <= "1100001000";
                WHEN "100100" =>  memoryC3_uid151_exp2TabGen_q <= "1111101111";
                WHEN "100101" =>  memoryC3_uid151_exp2TabGen_q <= "0011011001";
                WHEN "100110" =>  memoryC3_uid151_exp2TabGen_q <= "0111000110";
                WHEN "100111" =>  memoryC3_uid151_exp2TabGen_q <= "1010110101";
                WHEN "101000" =>  memoryC3_uid151_exp2TabGen_q <= "1110100111";
                WHEN "101001" =>  memoryC3_uid151_exp2TabGen_q <= "0010011011";
                WHEN "101010" =>  memoryC3_uid151_exp2TabGen_q <= "0110010010";
                WHEN "101011" =>  memoryC3_uid151_exp2TabGen_q <= "1010001100";
                WHEN "101100" =>  memoryC3_uid151_exp2TabGen_q <= "1110001000";
                WHEN "101101" =>  memoryC3_uid151_exp2TabGen_q <= "0010000111";
                WHEN "101110" =>  memoryC3_uid151_exp2TabGen_q <= "0110001001";
                WHEN "101111" =>  memoryC3_uid151_exp2TabGen_q <= "1010001110";
                WHEN "110000" =>  memoryC3_uid151_exp2TabGen_q <= "1110010110";
                WHEN "110001" =>  memoryC3_uid151_exp2TabGen_q <= "0010100000";
                WHEN "110010" =>  memoryC3_uid151_exp2TabGen_q <= "0110101110";
                WHEN "110011" =>  memoryC3_uid151_exp2TabGen_q <= "1010111110";
                WHEN "110100" =>  memoryC3_uid151_exp2TabGen_q <= "1111010001";
                WHEN "110101" =>  memoryC3_uid151_exp2TabGen_q <= "0011100111";
                WHEN "110110" =>  memoryC3_uid151_exp2TabGen_q <= "1000000001";
                WHEN "110111" =>  memoryC3_uid151_exp2TabGen_q <= "1100011101";
                WHEN "111000" =>  memoryC3_uid151_exp2TabGen_q <= "0000111100";
                WHEN "111001" =>  memoryC3_uid151_exp2TabGen_q <= "0101011111";
                WHEN "111010" =>  memoryC3_uid151_exp2TabGen_q <= "1010000101";
                WHEN "111011" =>  memoryC3_uid151_exp2TabGen_q <= "1110101110";
                WHEN "111100" =>  memoryC3_uid151_exp2TabGen_q <= "0011011010";
                WHEN "111101" =>  memoryC3_uid151_exp2TabGen_q <= "1000001001";
                WHEN "111110" =>  memoryC3_uid151_exp2TabGen_q <= "1100111100";
                WHEN "111111" =>  memoryC3_uid151_exp2TabGen_q <= "0001110010";
                WHEN OTHERS =>
                    memoryC3_uid151_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_nor(LOGICAL,802)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_nor_b <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_sticky_ena_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_nor_q <= not (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_nor_a or ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_nor_b);

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_sticky_ena(REG,803)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_nor_q = "1") THEN
                ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_sticky_ena_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_enaAnd(LOGICAL,804)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_enaAnd_a <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_sticky_ena_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_enaAnd_b <= en;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_enaAnd_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_enaAnd_a and ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_enaAnd_b;

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_inputreg(DELAY,740)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_inputreg : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q, xout => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem(DUALMEM,793)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_ia <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_inputreg_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_aa <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdreg_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_ab <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_rdmux_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 6,
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
        clocken1 => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_iq,
        address_a => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_aa,
        data_a => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_ia
    );
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_reset0 <= areset;
        ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_iq(5 downto 0);

	--memoryC3_uid150_exp2TabGen(LOOKUP,149)@13
    memoryC3_uid150_exp2TabGen: PROCESS (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid150_exp2TabGen_0_q_to_memoryC3_uid150_exp2TabGen_a_replace_mem_q) IS
                WHEN "000000" =>  memoryC3_uid150_exp2TabGen_q <= "0001000110";
                WHEN "000001" =>  memoryC3_uid150_exp2TabGen_q <= "1000001001";
                WHEN "000010" =>  memoryC3_uid150_exp2TabGen_q <= "1010110010";
                WHEN "000011" =>  memoryC3_uid150_exp2TabGen_q <= "1001010101";
                WHEN "000100" =>  memoryC3_uid150_exp2TabGen_q <= "0100000110";
                WHEN "000101" =>  memoryC3_uid150_exp2TabGen_q <= "1011010111";
                WHEN "000110" =>  memoryC3_uid150_exp2TabGen_q <= "1111011110";
                WHEN "000111" =>  memoryC3_uid150_exp2TabGen_q <= "0000101101";
                WHEN "001000" =>  memoryC3_uid150_exp2TabGen_q <= "1111011010";
                WHEN "001001" =>  memoryC3_uid150_exp2TabGen_q <= "1011111000";
                WHEN "001010" =>  memoryC3_uid150_exp2TabGen_q <= "0110011101";
                WHEN "001011" =>  memoryC3_uid150_exp2TabGen_q <= "1111011110";
                WHEN "001100" =>  memoryC3_uid150_exp2TabGen_q <= "0111010000";
                WHEN "001101" =>  memoryC3_uid150_exp2TabGen_q <= "1110001000";
                WHEN "001110" =>  memoryC3_uid150_exp2TabGen_q <= "0100011100";
                WHEN "001111" =>  memoryC3_uid150_exp2TabGen_q <= "1010100001";
                WHEN "010000" =>  memoryC3_uid150_exp2TabGen_q <= "0000101111";
                WHEN "010001" =>  memoryC3_uid150_exp2TabGen_q <= "0111011011";
                WHEN "010010" =>  memoryC3_uid150_exp2TabGen_q <= "1110111011";
                WHEN "010011" =>  memoryC3_uid150_exp2TabGen_q <= "0111101000";
                WHEN "010100" =>  memoryC3_uid150_exp2TabGen_q <= "0001110111";
                WHEN "010101" =>  memoryC3_uid150_exp2TabGen_q <= "1110000001";
                WHEN "010110" =>  memoryC3_uid150_exp2TabGen_q <= "1100011110";
                WHEN "010111" =>  memoryC3_uid150_exp2TabGen_q <= "1101100011";
                WHEN "011000" =>  memoryC3_uid150_exp2TabGen_q <= "0001101011";
                WHEN "011001" =>  memoryC3_uid150_exp2TabGen_q <= "1001001110";
                WHEN "011010" =>  memoryC3_uid150_exp2TabGen_q <= "0100100011";
                WHEN "011011" =>  memoryC3_uid150_exp2TabGen_q <= "0100000101";
                WHEN "011100" =>  memoryC3_uid150_exp2TabGen_q <= "1000001100";
                WHEN "011101" =>  memoryC3_uid150_exp2TabGen_q <= "0001010010";
                WHEN "011110" =>  memoryC3_uid150_exp2TabGen_q <= "1111110000";
                WHEN "011111" =>  memoryC3_uid150_exp2TabGen_q <= "0100000001";
                WHEN "100000" =>  memoryC3_uid150_exp2TabGen_q <= "1110011111";
                WHEN "100001" =>  memoryC3_uid150_exp2TabGen_q <= "1111100100";
                WHEN "100010" =>  memoryC3_uid150_exp2TabGen_q <= "0111101100";
                WHEN "100011" =>  memoryC3_uid150_exp2TabGen_q <= "0111010010";
                WHEN "100100" =>  memoryC3_uid150_exp2TabGen_q <= "1110110000";
                WHEN "100101" =>  memoryC3_uid150_exp2TabGen_q <= "1110100101";
                WHEN "100110" =>  memoryC3_uid150_exp2TabGen_q <= "0111001001";
                WHEN "100111" =>  memoryC3_uid150_exp2TabGen_q <= "1000111100";
                WHEN "101000" =>  memoryC3_uid150_exp2TabGen_q <= "0100011000";
                WHEN "101001" =>  memoryC3_uid150_exp2TabGen_q <= "1001111101";
                WHEN "101010" =>  memoryC3_uid150_exp2TabGen_q <= "1010000101";
                WHEN "101011" =>  memoryC3_uid150_exp2TabGen_q <= "0101010000";
                WHEN "101100" =>  memoryC3_uid150_exp2TabGen_q <= "1011111011";
                WHEN "101101" =>  memoryC3_uid150_exp2TabGen_q <= "1110100101";
                WHEN "101110" =>  memoryC3_uid150_exp2TabGen_q <= "1101101100";
                WHEN "101111" =>  memoryC3_uid150_exp2TabGen_q <= "1001110000";
                WHEN "110000" =>  memoryC3_uid150_exp2TabGen_q <= "0011001111";
                WHEN "110001" =>  memoryC3_uid150_exp2TabGen_q <= "1010101001";
                WHEN "110010" =>  memoryC3_uid150_exp2TabGen_q <= "0000011110";
                WHEN "110011" =>  memoryC3_uid150_exp2TabGen_q <= "0101001111";
                WHEN "110100" =>  memoryC3_uid150_exp2TabGen_q <= "1001011100";
                WHEN "110101" =>  memoryC3_uid150_exp2TabGen_q <= "1101100111";
                WHEN "110110" =>  memoryC3_uid150_exp2TabGen_q <= "0010010000";
                WHEN "110111" =>  memoryC3_uid150_exp2TabGen_q <= "0111111010";
                WHEN "111000" =>  memoryC3_uid150_exp2TabGen_q <= "1111000111";
                WHEN "111001" =>  memoryC3_uid150_exp2TabGen_q <= "1000011001";
                WHEN "111010" =>  memoryC3_uid150_exp2TabGen_q <= "0100010011";
                WHEN "111011" =>  memoryC3_uid150_exp2TabGen_q <= "0011011000";
                WHEN "111100" =>  memoryC3_uid150_exp2TabGen_q <= "0110001101";
                WHEN "111101" =>  memoryC3_uid150_exp2TabGen_q <= "1101010101";
                WHEN "111110" =>  memoryC3_uid150_exp2TabGen_q <= "1001010100";
                WHEN "111111" =>  memoryC3_uid150_exp2TabGen_q <= "1010110000";
                WHEN OTHERS =>
                    memoryC3_uid150_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--memoryC3_uid149_exp2TabGen(LOOKUP,148)@13
    memoryC3_uid149_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC3_uid149_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC3_uid149_exp2TabGen_q <= "1111110111";
                WHEN "000001" =>  memoryC3_uid149_exp2TabGen_q <= "1011000100";
                WHEN "000010" =>  memoryC3_uid149_exp2TabGen_q <= "0110011000";
                WHEN "000011" =>  memoryC3_uid149_exp2TabGen_q <= "1011011000";
                WHEN "000100" =>  memoryC3_uid149_exp2TabGen_q <= "0001000100";
                WHEN "000101" =>  memoryC3_uid149_exp2TabGen_q <= "1001000100";
                WHEN "000110" =>  memoryC3_uid149_exp2TabGen_q <= "0000101011";
                WHEN "000111" =>  memoryC3_uid149_exp2TabGen_q <= "0100011100";
                WHEN "001000" =>  memoryC3_uid149_exp2TabGen_q <= "0011001110";
                WHEN "001001" =>  memoryC3_uid149_exp2TabGen_q <= "1011100001";
                WHEN "001010" =>  memoryC3_uid149_exp2TabGen_q <= "1111101000";
                WHEN "001011" =>  memoryC3_uid149_exp2TabGen_q <= "1100000000";
                WHEN "001100" =>  memoryC3_uid149_exp2TabGen_q <= "1000101010";
                WHEN "001101" =>  memoryC3_uid149_exp2TabGen_q <= "0110100001";
                WHEN "001110" =>  memoryC3_uid149_exp2TabGen_q <= "0011011110";
                WHEN "001111" =>  memoryC3_uid149_exp2TabGen_q <= "1001011101";
                WHEN "010000" =>  memoryC3_uid149_exp2TabGen_q <= "0100111011";
                WHEN "010001" =>  memoryC3_uid149_exp2TabGen_q <= "0000011100";
                WHEN "010010" =>  memoryC3_uid149_exp2TabGen_q <= "1110001001";
                WHEN "010011" =>  memoryC3_uid149_exp2TabGen_q <= "1000100011";
                WHEN "010100" =>  memoryC3_uid149_exp2TabGen_q <= "1101001001";
                WHEN "010101" =>  memoryC3_uid149_exp2TabGen_q <= "1111010110";
                WHEN "010110" =>  memoryC3_uid149_exp2TabGen_q <= "0001111011";
                WHEN "010111" =>  memoryC3_uid149_exp2TabGen_q <= "1101111000";
                WHEN "011000" =>  memoryC3_uid149_exp2TabGen_q <= "1111000011";
                WHEN "011001" =>  memoryC3_uid149_exp2TabGen_q <= "1000101110";
                WHEN "011010" =>  memoryC3_uid149_exp2TabGen_q <= "1100101000";
                WHEN "011011" =>  memoryC3_uid149_exp2TabGen_q <= "0111110111";
                WHEN "011100" =>  memoryC3_uid149_exp2TabGen_q <= "0100111101";
                WHEN "011101" =>  memoryC3_uid149_exp2TabGen_q <= "0100101101";
                WHEN "011110" =>  memoryC3_uid149_exp2TabGen_q <= "0001101111";
                WHEN "011111" =>  memoryC3_uid149_exp2TabGen_q <= "0111110111";
                WHEN "100000" =>  memoryC3_uid149_exp2TabGen_q <= "0101000011";
                WHEN "100001" =>  memoryC3_uid149_exp2TabGen_q <= "0101101110";
                WHEN "100010" =>  memoryC3_uid149_exp2TabGen_q <= "0110101000";
                WHEN "100011" =>  memoryC3_uid149_exp2TabGen_q <= "0000101111";
                WHEN "100100" =>  memoryC3_uid149_exp2TabGen_q <= "1101100001";
                WHEN "100101" =>  memoryC3_uid149_exp2TabGen_q <= "0001101011";
                WHEN "100110" =>  memoryC3_uid149_exp2TabGen_q <= "1111000110";
                WHEN "100111" =>  memoryC3_uid149_exp2TabGen_q <= "0101010000";
                WHEN "101000" =>  memoryC3_uid149_exp2TabGen_q <= "1111100011";
                WHEN "101001" =>  memoryC3_uid149_exp2TabGen_q <= "0010100101";
                WHEN "101010" =>  memoryC3_uid149_exp2TabGen_q <= "1000111101";
                WHEN "101011" =>  memoryC3_uid149_exp2TabGen_q <= "1101001000";
                WHEN "101100" =>  memoryC3_uid149_exp2TabGen_q <= "1101001101";
                WHEN "101101" =>  memoryC3_uid149_exp2TabGen_q <= "0111010010";
                WHEN "101110" =>  memoryC3_uid149_exp2TabGen_q <= "1111111100";
                WHEN "101111" =>  memoryC3_uid149_exp2TabGen_q <= "0100110000";
                WHEN "110000" =>  memoryC3_uid149_exp2TabGen_q <= "0000100001";
                WHEN "110001" =>  memoryC3_uid149_exp2TabGen_q <= "0000100000";
                WHEN "110010" =>  memoryC3_uid149_exp2TabGen_q <= "1100011000";
                WHEN "110011" =>  memoryC3_uid149_exp2TabGen_q <= "1010011100";
                WHEN "110100" =>  memoryC3_uid149_exp2TabGen_q <= "1101000110";
                WHEN "110101" =>  memoryC3_uid149_exp2TabGen_q <= "1001101101";
                WHEN "110110" =>  memoryC3_uid149_exp2TabGen_q <= "1011011101";
                WHEN "110111" =>  memoryC3_uid149_exp2TabGen_q <= "1111000100";
                WHEN "111000" =>  memoryC3_uid149_exp2TabGen_q <= "1000111001";
                WHEN "111001" =>  memoryC3_uid149_exp2TabGen_q <= "1011001100";
                WHEN "111010" =>  memoryC3_uid149_exp2TabGen_q <= "0100101100";
                WHEN "111011" =>  memoryC3_uid149_exp2TabGen_q <= "1111111110";
                WHEN "111100" =>  memoryC3_uid149_exp2TabGen_q <= "1001001101";
                WHEN "111101" =>  memoryC3_uid149_exp2TabGen_q <= "0001110100";
                WHEN "111110" =>  memoryC3_uid149_exp2TabGen_q <= "1100110001";
                WHEN "111111" =>  memoryC3_uid149_exp2TabGen_q <= "1010111000";
                WHEN OTHERS =>
                    memoryC3_uid149_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--os_uid153_exp2TabGen(BITJOIN,152)@13
    os_uid153_exp2TabGen_q <= memoryC3_uid152_exp2TabGen_q & memoryC3_uid151_exp2TabGen_q & memoryC3_uid150_exp2TabGen_q & memoryC3_uid149_exp2TabGen_q;

	--rndBit_uid169_exp2PolyEval(CONSTANT,168)
    rndBit_uid169_exp2PolyEval_q <= "01";

	--cIncludingRoundingBit_uid170_exp2PolyEval(BITJOIN,169)@13
    cIncludingRoundingBit_uid170_exp2PolyEval_q <= os_uid153_exp2TabGen_q & rndBit_uid169_exp2PolyEval_q;

	--reg_cIncludingRoundingBit_uid170_exp2PolyEval_0_to_ts2_uid171_exp2PolyEval_0(REG,309)@13
    reg_cIncludingRoundingBit_uid170_exp2PolyEval_0_to_ts2_uid171_exp2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid170_exp2PolyEval_0_to_ts2_uid171_exp2PolyEval_0_q <= "00000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cIncludingRoundingBit_uid170_exp2PolyEval_0_to_ts2_uid171_exp2PolyEval_0_q <= cIncludingRoundingBit_uid170_exp2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ts2_uid171_exp2PolyEval(ADD,170)@14
    ts2_uid171_exp2PolyEval_a <= STD_LOGIC_VECTOR((38 downto 38 => reg_cIncludingRoundingBit_uid170_exp2PolyEval_0_to_ts2_uid171_exp2PolyEval_0_q(37)) & reg_cIncludingRoundingBit_uid170_exp2PolyEval_0_to_ts2_uid171_exp2PolyEval_0_q);
    ts2_uid171_exp2PolyEval_b <= STD_LOGIC_VECTOR((38 downto 31 => reg_R_uid205_pT2_uid168_exp2PolyEval_0_to_ts2_uid171_exp2PolyEval_1_q(30)) & reg_R_uid205_pT2_uid168_exp2PolyEval_0_to_ts2_uid171_exp2PolyEval_1_q);
            ts2_uid171_exp2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid171_exp2PolyEval_a) + SIGNED(ts2_uid171_exp2PolyEval_b));
    ts2_uid171_exp2PolyEval_q <= ts2_uid171_exp2PolyEval_o(38 downto 0);


	--s2_uid172_exp2PolyEval(BITSELECT,171)@14
    s2_uid172_exp2PolyEval_in <= ts2_uid171_exp2PolyEval_q;
    s2_uid172_exp2PolyEval_b <= s2_uid172_exp2PolyEval_in(38 downto 1);

	--yTop18Bits_uid212_pT3_uid174_exp2PolyEval(BITSELECT,211)@14
    yTop18Bits_uid212_pT3_uid174_exp2PolyEval_in <= s2_uid172_exp2PolyEval_b;
    yTop18Bits_uid212_pT3_uid174_exp2PolyEval_b <= yTop18Bits_uid212_pT3_uid174_exp2PolyEval_in(37 downto 20);

	--reg_yTop18Bits_uid212_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_9(REG,314)@14
    reg_yTop18Bits_uid212_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop18Bits_uid212_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_9_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop18Bits_uid212_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_9_q <= yTop18Bits_uid212_pT3_uid174_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_nor(LOGICAL,826)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_nor_b <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_sticky_ena_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_nor_q <= not (ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_nor_a or ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_nor_b);

	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_mem_top(CONSTANT,822)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_mem_top_q <= "0110";

	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmp(LOGICAL,823)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmp_a <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_mem_top_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdmux_q);
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmp_q <= "1" when ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmp_a = ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmp_b else "0";

	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmpReg(REG,824)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmpReg_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_sticky_ena(REG,827)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_nor_q = "1") THEN
                ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_sticky_ena_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_enaAnd(LOGICAL,828)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_enaAnd_a <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_sticky_ena_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_enaAnd_b <= en;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_enaAnd_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_enaAnd_a and ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_enaAnd_b;

	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt(COUNTER,818)
    -- every=1, low=0, high=6, step=1, init=1
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_i = 5 THEN
                      ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_i <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_i - 6;
                    ELSE
                        ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_i <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_i,3));


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdreg(REG,819)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdreg_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdmux(MUX,820)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdmux_s <= en;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdmux: PROCESS (ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdmux_s, ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdreg_q, ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdmux_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdmux_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem(DUALMEM,817)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_ia <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_inputreg_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_aa <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdreg_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_ab <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_rdmux_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 46,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 46,
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
        clocken1 => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_iq,
        address_a => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_aa,
        data_a => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_ia
    );
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_reset0 <= areset;
        ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_iq(45 downto 0);

	--yT3_uid173_exp2PolyEval(BITSELECT,172)@14
    yT3_uid173_exp2PolyEval_in <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT3_uid173_exp2PolyEval_a_replace_mem_q;
    yT3_uid173_exp2PolyEval_b <= yT3_uid173_exp2PolyEval_in(45 downto 10);

	--xBottomBits_uid211_pT3_uid174_exp2PolyEval(BITSELECT,210)@14
    xBottomBits_uid211_pT3_uid174_exp2PolyEval_in <= yT3_uid173_exp2PolyEval_b(8 downto 0);
    xBottomBits_uid211_pT3_uid174_exp2PolyEval_b <= xBottomBits_uid211_pT3_uid174_exp2PolyEval_in(8 downto 0);

	--pad_xBottomBits_uid211_uid214_pT3_uid174_exp2PolyEval(BITJOIN,213)@14
    pad_xBottomBits_uid211_uid214_pT3_uid174_exp2PolyEval_q <= xBottomBits_uid211_pT3_uid174_exp2PolyEval_b & STD_LOGIC_VECTOR((7 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_xBottomBits_uid211_uid214_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_7(REG,313)@14
    reg_pad_xBottomBits_uid211_uid214_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_xBottomBits_uid211_uid214_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_7_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_xBottomBits_uid211_uid214_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_7_q <= pad_xBottomBits_uid211_uid214_pT3_uid174_exp2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--yBottomBits_uid210_pT3_uid174_exp2PolyEval(BITSELECT,209)@14
    yBottomBits_uid210_pT3_uid174_exp2PolyEval_in <= s2_uid172_exp2PolyEval_b(10 downto 0);
    yBottomBits_uid210_pT3_uid174_exp2PolyEval_b <= yBottomBits_uid210_pT3_uid174_exp2PolyEval_in(10 downto 0);

	--spad_yBottomBits_uid210_uid213_pT3_uid174_exp2PolyEval(BITJOIN,212)@14
    spad_yBottomBits_uid210_uid213_pT3_uid174_exp2PolyEval_q <= GND_q & yBottomBits_uid210_pT3_uid174_exp2PolyEval_b;

	--pad_yBottomBits_uid210_uid215_pT3_uid174_exp2PolyEval(BITJOIN,214)@14
    pad_yBottomBits_uid210_uid215_pT3_uid174_exp2PolyEval_q <= spad_yBottomBits_uid210_uid213_pT3_uid174_exp2PolyEval_q & STD_LOGIC_VECTOR((5 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_yBottomBits_uid210_uid215_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_6(REG,312)@14
    reg_pad_yBottomBits_uid210_uid215_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_yBottomBits_uid210_uid215_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_6_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_yBottomBits_uid210_uid215_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_6_q <= pad_yBottomBits_uid210_uid215_pT3_uid174_exp2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--xTop18Bits_uid209_pT3_uid174_exp2PolyEval(BITSELECT,208)@14
    xTop18Bits_uid209_pT3_uid174_exp2PolyEval_in <= yT3_uid173_exp2PolyEval_b;
    xTop18Bits_uid209_pT3_uid174_exp2PolyEval_b <= xTop18Bits_uid209_pT3_uid174_exp2PolyEval_in(35 downto 18);

	--reg_xTop18Bits_uid209_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_4(REG,311)@14
    reg_xTop18Bits_uid209_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop18Bits_uid209_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_4_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop18Bits_uid209_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_4_q <= xTop18Bits_uid209_pT3_uid174_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma(CHAINMULTADD,259)@15
    multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_a(0),19));
    multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_a(1),19));
    multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_p(0) <= multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_l(0) * multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_c(0);
    multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_p(1) <= multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_l(1) * multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_c(1);
    multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_w(0) <= RESIZE(multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_p(0),38) + RESIZE(multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_p(1),38);
    multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_x(0) <= multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_w(0);
    multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_y(0) <= multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_x(0);
    multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_a <= (others => (others => '0'));
            multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_c <= (others => (others => '0'));
            multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_a(0) <= RESIZE(UNSIGNED(reg_xTop18Bits_uid209_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_4_q),18);
            multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_a(1) <= RESIZE(UNSIGNED(reg_pad_xBottomBits_uid211_uid214_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_7_q),18);
            multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_c(0) <= RESIZE(SIGNED(reg_pad_yBottomBits_uid210_uid215_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_6_q),18);
            multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_c(1) <= RESIZE(SIGNED(reg_yTop18Bits_uid212_pT3_uid174_exp2PolyEval_0_to_multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_9_q),18);
            IF (en = "1") THEN
                multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_s(0) <= multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_delay : dspba_delay
    GENERIC MAP (width => 37, depth => 1)
    PORT MAP (xin => STD_LOGIC_VECTOR(multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_q, clk => clk, aclr => areset);

	--multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval(BITSELECT,216)@18
    multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_in <= multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_cma_q;
    multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_b <= multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_in(36 downto 6);

	--highBBits_uid219_pT3_uid174_exp2PolyEval(BITSELECT,218)@18
    highBBits_uid219_pT3_uid174_exp2PolyEval_in <= multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_b;
    highBBits_uid219_pT3_uid174_exp2PolyEval_b <= highBBits_uid219_pT3_uid174_exp2PolyEval_in(30 downto 2);

	--yTop27Bits_uid207_pT3_uid174_exp2PolyEval(BITSELECT,206)@14
    yTop27Bits_uid207_pT3_uid174_exp2PolyEval_in <= s2_uid172_exp2PolyEval_b;
    yTop27Bits_uid207_pT3_uid174_exp2PolyEval_b <= yTop27Bits_uid207_pT3_uid174_exp2PolyEval_in(37 downto 11);

	--reg_yTop27Bits_uid207_pT3_uid174_exp2PolyEval_0_to_topProd_uid208_pT3_uid174_exp2PolyEval_1(REG,316)@14
    reg_yTop27Bits_uid207_pT3_uid174_exp2PolyEval_0_to_topProd_uid208_pT3_uid174_exp2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid207_pT3_uid174_exp2PolyEval_0_to_topProd_uid208_pT3_uid174_exp2PolyEval_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid207_pT3_uid174_exp2PolyEval_0_to_topProd_uid208_pT3_uid174_exp2PolyEval_1_q <= yTop27Bits_uid207_pT3_uid174_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--xTop27Bits_uid206_pT3_uid174_exp2PolyEval(BITSELECT,205)@14
    xTop27Bits_uid206_pT3_uid174_exp2PolyEval_in <= yT3_uid173_exp2PolyEval_b;
    xTop27Bits_uid206_pT3_uid174_exp2PolyEval_b <= xTop27Bits_uid206_pT3_uid174_exp2PolyEval_in(35 downto 9);

	--reg_xTop27Bits_uid206_pT3_uid174_exp2PolyEval_0_to_topProd_uid208_pT3_uid174_exp2PolyEval_0(REG,315)@14
    reg_xTop27Bits_uid206_pT3_uid174_exp2PolyEval_0_to_topProd_uid208_pT3_uid174_exp2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid206_pT3_uid174_exp2PolyEval_0_to_topProd_uid208_pT3_uid174_exp2PolyEval_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop27Bits_uid206_pT3_uid174_exp2PolyEval_0_to_topProd_uid208_pT3_uid174_exp2PolyEval_0_q <= xTop27Bits_uid206_pT3_uid174_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--topProd_uid208_pT3_uid174_exp2PolyEval(MULT,207)@15
    topProd_uid208_pT3_uid174_exp2PolyEval_pr <= signed(resize(UNSIGNED(topProd_uid208_pT3_uid174_exp2PolyEval_a),28)) * SIGNED(topProd_uid208_pT3_uid174_exp2PolyEval_b);
    topProd_uid208_pT3_uid174_exp2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid208_pT3_uid174_exp2PolyEval_a <= (others => '0');
            topProd_uid208_pT3_uid174_exp2PolyEval_b <= (others => '0');
            topProd_uid208_pT3_uid174_exp2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid208_pT3_uid174_exp2PolyEval_a <= reg_xTop27Bits_uid206_pT3_uid174_exp2PolyEval_0_to_topProd_uid208_pT3_uid174_exp2PolyEval_0_q;
                topProd_uid208_pT3_uid174_exp2PolyEval_b <= reg_yTop27Bits_uid207_pT3_uid174_exp2PolyEval_0_to_topProd_uid208_pT3_uid174_exp2PolyEval_1_q;
                topProd_uid208_pT3_uid174_exp2PolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid208_pT3_uid174_exp2PolyEval_pr,54));
            END IF;
        END IF;
    END PROCESS;
    topProd_uid208_pT3_uid174_exp2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid208_pT3_uid174_exp2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid208_pT3_uid174_exp2PolyEval_q <= topProd_uid208_pT3_uid174_exp2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--sumAHighB_uid220_pT3_uid174_exp2PolyEval(ADD,219)@18
    sumAHighB_uid220_pT3_uid174_exp2PolyEval_a <= STD_LOGIC_VECTOR((54 downto 54 => topProd_uid208_pT3_uid174_exp2PolyEval_q(53)) & topProd_uid208_pT3_uid174_exp2PolyEval_q);
    sumAHighB_uid220_pT3_uid174_exp2PolyEval_b <= STD_LOGIC_VECTOR((54 downto 29 => highBBits_uid219_pT3_uid174_exp2PolyEval_b(28)) & highBBits_uid219_pT3_uid174_exp2PolyEval_b);
            sumAHighB_uid220_pT3_uid174_exp2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid220_pT3_uid174_exp2PolyEval_a) + SIGNED(sumAHighB_uid220_pT3_uid174_exp2PolyEval_b));
    sumAHighB_uid220_pT3_uid174_exp2PolyEval_q <= sumAHighB_uid220_pT3_uid174_exp2PolyEval_o(54 downto 0);


	--lowRangeB_uid218_pT3_uid174_exp2PolyEval(BITSELECT,217)@18
    lowRangeB_uid218_pT3_uid174_exp2PolyEval_in <= multSumOfTwo18_uid213_pT3_uid174_exp2PolyEval_b(1 downto 0);
    lowRangeB_uid218_pT3_uid174_exp2PolyEval_b <= lowRangeB_uid218_pT3_uid174_exp2PolyEval_in(1 downto 0);

	--add0_uid218_uid221_pT3_uid174_exp2PolyEval(BITJOIN,220)@18
    add0_uid218_uid221_pT3_uid174_exp2PolyEval_q <= sumAHighB_uid220_pT3_uid174_exp2PolyEval_q & lowRangeB_uid218_pT3_uid174_exp2PolyEval_b;

	--R_uid222_pT3_uid174_exp2PolyEval(BITSELECT,221)@18
    R_uid222_pT3_uid174_exp2PolyEval_in <= add0_uid218_uid221_pT3_uid174_exp2PolyEval_q(55 downto 0);
    R_uid222_pT3_uid174_exp2PolyEval_b <= R_uid222_pT3_uid174_exp2PolyEval_in(55 downto 18);

	--reg_R_uid222_pT3_uid174_exp2PolyEval_0_to_ts3_uid177_exp2PolyEval_1(REG,318)@18
    reg_R_uid222_pT3_uid174_exp2PolyEval_0_to_ts3_uid177_exp2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid222_pT3_uid174_exp2PolyEval_0_to_ts3_uid177_exp2PolyEval_1_q <= "00000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_R_uid222_pT3_uid174_exp2PolyEval_0_to_ts3_uid177_exp2PolyEval_1_q <= R_uid222_pT3_uid174_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_nor(LOGICAL,789)
    ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_nor_b <= ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_sticky_ena_q;
    ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_nor_q <= not (ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_nor_a or ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_nor_b);

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_mem_top(CONSTANT,772)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_mem_top_q <= "01010";

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmp(LOGICAL,773)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmp_a <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_mem_top_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdmux_q);
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmp_q <= "1" when ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmp_a = ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmp_b else "0";

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmpReg(REG,774)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmpReg_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_sticky_ena(REG,790)
    ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_nor_q = "1") THEN
                ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_sticky_ena_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_enaAnd(LOGICAL,791)
    ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_enaAnd_a <= ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_sticky_ena_q;
    ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_enaAnd_b <= en;
    ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_enaAnd_q <= ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_enaAnd_a and ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_enaAnd_b;

	--memoryC2_uid147_exp2TabGen(LOOKUP,146)@5
    memoryC2_uid147_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC2_uid147_exp2TabGen_q <= "001";
                WHEN "000001" =>  memoryC2_uid147_exp2TabGen_q <= "001";
                WHEN "000010" =>  memoryC2_uid147_exp2TabGen_q <= "001";
                WHEN "000011" =>  memoryC2_uid147_exp2TabGen_q <= "001";
                WHEN "000100" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "000101" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "000110" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "000111" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "001000" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "001001" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "001010" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "001011" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "001100" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "001101" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "001110" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "001111" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "010000" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "010001" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "010010" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "010011" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "010100" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "010101" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "010110" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "010111" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "011000" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "011001" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "011010" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "011011" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "011100" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "011101" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "011110" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "011111" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "100000" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "100001" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "100010" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "100011" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "100100" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "100101" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "100110" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "100111" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "101000" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "101001" =>  memoryC2_uid147_exp2TabGen_q <= "010";
                WHEN "101010" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "101011" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "101100" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "101101" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "101110" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "101111" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "110000" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "110001" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "110010" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "110011" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "110100" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "110101" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "110110" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "110111" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "111000" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "111001" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "111010" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "111011" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "111100" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "111101" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "111110" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN "111111" =>  memoryC2_uid147_exp2TabGen_q <= "011";
                WHEN OTHERS =>
                    memoryC2_uid147_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_inputreg(DELAY,779)
    ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => memoryC2_uid147_exp2TabGen_q, xout => ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt(COUNTER,768)
    -- every=1, low=0, high=10, step=1, init=1
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_i = 9 THEN
                      ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_i <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_i - 10;
                    ELSE
                        ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_i <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_i,4));


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdreg(REG,769)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdreg_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdmux(MUX,770)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdmux_s <= en;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdmux: PROCESS (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdmux_s, ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdreg_q, ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdmux_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdmux_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem(DUALMEM,780)
    ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_ia <= ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_inputreg_q;
    ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_aa <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdreg_q;
    ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_ab <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdmux_q;
    ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 3,
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
        clocken1 => ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_iq,
        address_a => ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_aa,
        data_a => ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_ia
    );
    ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_reset0 <= areset;
        ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_q <= ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_iq(2 downto 0);

	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_nor(LOGICAL,904)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_nor_b <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_sticky_ena_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_nor_q <= not (ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_nor_a or ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_nor_b);

	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_sticky_ena(REG,905)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_nor_q = "1") THEN
                ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_sticky_ena_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_enaAnd(LOGICAL,906)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_enaAnd_a <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_sticky_ena_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_enaAnd_b <= en;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_enaAnd_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_enaAnd_a and ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_enaAnd_b;

	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem(DUALMEM,895)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_ia <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_inputreg_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_aa <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdreg_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_ab <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdmux_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 6,
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
        clocken1 => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_iq,
        address_a => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_aa,
        data_a => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_ia
    );
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_reset0 <= areset;
        ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_iq(5 downto 0);

	--reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0(REG,292)@17
    reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid146_exp2TabGen(LOOKUP,145)@18
    memoryC2_uid146_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid146_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC2_uid146_exp2TabGen_q <= "1110101111";
                WHEN "000001" =>  memoryC2_uid146_exp2TabGen_q <= "1111000101";
                WHEN "000010" =>  memoryC2_uid146_exp2TabGen_q <= "1111011011";
                WHEN "000011" =>  memoryC2_uid146_exp2TabGen_q <= "1111110000";
                WHEN "000100" =>  memoryC2_uid146_exp2TabGen_q <= "0000000111";
                WHEN "000101" =>  memoryC2_uid146_exp2TabGen_q <= "0000011101";
                WHEN "000110" =>  memoryC2_uid146_exp2TabGen_q <= "0000110100";
                WHEN "000111" =>  memoryC2_uid146_exp2TabGen_q <= "0001001010";
                WHEN "001000" =>  memoryC2_uid146_exp2TabGen_q <= "0001100010";
                WHEN "001001" =>  memoryC2_uid146_exp2TabGen_q <= "0001111001";
                WHEN "001010" =>  memoryC2_uid146_exp2TabGen_q <= "0010010001";
                WHEN "001011" =>  memoryC2_uid146_exp2TabGen_q <= "0010101000";
                WHEN "001100" =>  memoryC2_uid146_exp2TabGen_q <= "0011000001";
                WHEN "001101" =>  memoryC2_uid146_exp2TabGen_q <= "0011011001";
                WHEN "001110" =>  memoryC2_uid146_exp2TabGen_q <= "0011110010";
                WHEN "001111" =>  memoryC2_uid146_exp2TabGen_q <= "0100001011";
                WHEN "010000" =>  memoryC2_uid146_exp2TabGen_q <= "0100100100";
                WHEN "010001" =>  memoryC2_uid146_exp2TabGen_q <= "0100111101";
                WHEN "010010" =>  memoryC2_uid146_exp2TabGen_q <= "0101010111";
                WHEN "010011" =>  memoryC2_uid146_exp2TabGen_q <= "0101110001";
                WHEN "010100" =>  memoryC2_uid146_exp2TabGen_q <= "0110001011";
                WHEN "010101" =>  memoryC2_uid146_exp2TabGen_q <= "0110100110";
                WHEN "010110" =>  memoryC2_uid146_exp2TabGen_q <= "0111000001";
                WHEN "010111" =>  memoryC2_uid146_exp2TabGen_q <= "0111011100";
                WHEN "011000" =>  memoryC2_uid146_exp2TabGen_q <= "0111111000";
                WHEN "011001" =>  memoryC2_uid146_exp2TabGen_q <= "1000010011";
                WHEN "011010" =>  memoryC2_uid146_exp2TabGen_q <= "1000101111";
                WHEN "011011" =>  memoryC2_uid146_exp2TabGen_q <= "1001001100";
                WHEN "011100" =>  memoryC2_uid146_exp2TabGen_q <= "1001101001";
                WHEN "011101" =>  memoryC2_uid146_exp2TabGen_q <= "1010000110";
                WHEN "011110" =>  memoryC2_uid146_exp2TabGen_q <= "1010100011";
                WHEN "011111" =>  memoryC2_uid146_exp2TabGen_q <= "1011000001";
                WHEN "100000" =>  memoryC2_uid146_exp2TabGen_q <= "1011011111";
                WHEN "100001" =>  memoryC2_uid146_exp2TabGen_q <= "1011111101";
                WHEN "100010" =>  memoryC2_uid146_exp2TabGen_q <= "1100011100";
                WHEN "100011" =>  memoryC2_uid146_exp2TabGen_q <= "1100111010";
                WHEN "100100" =>  memoryC2_uid146_exp2TabGen_q <= "1101011010";
                WHEN "100101" =>  memoryC2_uid146_exp2TabGen_q <= "1101111001";
                WHEN "100110" =>  memoryC2_uid146_exp2TabGen_q <= "1110011001";
                WHEN "100111" =>  memoryC2_uid146_exp2TabGen_q <= "1110111010";
                WHEN "101000" =>  memoryC2_uid146_exp2TabGen_q <= "1111011010";
                WHEN "101001" =>  memoryC2_uid146_exp2TabGen_q <= "1111111100";
                WHEN "101010" =>  memoryC2_uid146_exp2TabGen_q <= "0000011101";
                WHEN "101011" =>  memoryC2_uid146_exp2TabGen_q <= "0000111111";
                WHEN "101100" =>  memoryC2_uid146_exp2TabGen_q <= "0001100001";
                WHEN "101101" =>  memoryC2_uid146_exp2TabGen_q <= "0010000011";
                WHEN "101110" =>  memoryC2_uid146_exp2TabGen_q <= "0010100110";
                WHEN "101111" =>  memoryC2_uid146_exp2TabGen_q <= "0011001010";
                WHEN "110000" =>  memoryC2_uid146_exp2TabGen_q <= "0011101101";
                WHEN "110001" =>  memoryC2_uid146_exp2TabGen_q <= "0100010001";
                WHEN "110010" =>  memoryC2_uid146_exp2TabGen_q <= "0100110110";
                WHEN "110011" =>  memoryC2_uid146_exp2TabGen_q <= "0101011010";
                WHEN "110100" =>  memoryC2_uid146_exp2TabGen_q <= "0110000000";
                WHEN "110101" =>  memoryC2_uid146_exp2TabGen_q <= "0110100101";
                WHEN "110110" =>  memoryC2_uid146_exp2TabGen_q <= "0111001011";
                WHEN "110111" =>  memoryC2_uid146_exp2TabGen_q <= "0111110010";
                WHEN "111000" =>  memoryC2_uid146_exp2TabGen_q <= "1000011001";
                WHEN "111001" =>  memoryC2_uid146_exp2TabGen_q <= "1001000000";
                WHEN "111010" =>  memoryC2_uid146_exp2TabGen_q <= "1001101000";
                WHEN "111011" =>  memoryC2_uid146_exp2TabGen_q <= "1010010000";
                WHEN "111100" =>  memoryC2_uid146_exp2TabGen_q <= "1010111001";
                WHEN "111101" =>  memoryC2_uid146_exp2TabGen_q <= "1011100010";
                WHEN "111110" =>  memoryC2_uid146_exp2TabGen_q <= "1100001011";
                WHEN "111111" =>  memoryC2_uid146_exp2TabGen_q <= "1100110101";
                WHEN OTHERS =>
                    memoryC2_uid146_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_nor(LOGICAL,776)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_nor_b <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_sticky_ena_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_nor_q <= not (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_nor_a or ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_nor_b);

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_sticky_ena(REG,777)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_nor_q = "1") THEN
                ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_sticky_ena_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_enaAnd(LOGICAL,778)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_enaAnd_a <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_sticky_ena_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_enaAnd_b <= en;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_enaAnd_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_enaAnd_a and ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_enaAnd_b;

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem(DUALMEM,767)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_ia <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_inputreg_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_aa <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdreg_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_ab <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_rdmux_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 6,
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
        clocken1 => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_iq,
        address_a => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_aa,
        data_a => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_ia
    );
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_reset0 <= areset;
        ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_iq(5 downto 0);

	--memoryC2_uid145_exp2TabGen(LOOKUP,144)@18
    memoryC2_uid145_exp2TabGen: PROCESS (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_q) IS
                WHEN "000000" =>  memoryC2_uid145_exp2TabGen_q <= "1110111101";
                WHEN "000001" =>  memoryC2_uid145_exp2TabGen_q <= "0101110101";
                WHEN "000010" =>  memoryC2_uid145_exp2TabGen_q <= "0000011100";
                WHEN "000011" =>  memoryC2_uid145_exp2TabGen_q <= "1110110100";
                WHEN "000100" =>  memoryC2_uid145_exp2TabGen_q <= "0001000001";
                WHEN "000101" =>  memoryC2_uid145_exp2TabGen_q <= "0111000100";
                WHEN "000110" =>  memoryC2_uid145_exp2TabGen_q <= "0001000001";
                WHEN "000111" =>  memoryC2_uid145_exp2TabGen_q <= "1110111010";
                WHEN "001000" =>  memoryC2_uid145_exp2TabGen_q <= "0000110010";
                WHEN "001001" =>  memoryC2_uid145_exp2TabGen_q <= "0110101011";
                WHEN "001010" =>  memoryC2_uid145_exp2TabGen_q <= "0000101010";
                WHEN "001011" =>  memoryC2_uid145_exp2TabGen_q <= "1110110000";
                WHEN "001100" =>  memoryC2_uid145_exp2TabGen_q <= "0001000000";
                WHEN "001101" =>  memoryC2_uid145_exp2TabGen_q <= "0111011101";
                WHEN "001110" =>  memoryC2_uid145_exp2TabGen_q <= "0010001010";
                WHEN "001111" =>  memoryC2_uid145_exp2TabGen_q <= "0001001011";
                WHEN "010000" =>  memoryC2_uid145_exp2TabGen_q <= "0100100001";
                WHEN "010001" =>  memoryC2_uid145_exp2TabGen_q <= "1100010001";
                WHEN "010010" =>  memoryC2_uid145_exp2TabGen_q <= "1000011101";
                WHEN "010011" =>  memoryC2_uid145_exp2TabGen_q <= "1001001000";
                WHEN "010100" =>  memoryC2_uid145_exp2TabGen_q <= "1110010101";
                WHEN "010101" =>  memoryC2_uid145_exp2TabGen_q <= "1000001000";
                WHEN "010110" =>  memoryC2_uid145_exp2TabGen_q <= "0110100100";
                WHEN "010111" =>  memoryC2_uid145_exp2TabGen_q <= "1001101100";
                WHEN "011000" =>  memoryC2_uid145_exp2TabGen_q <= "0001100010";
                WHEN "011001" =>  memoryC2_uid145_exp2TabGen_q <= "1110001100";
                WHEN "011010" =>  memoryC2_uid145_exp2TabGen_q <= "1111101011";
                WHEN "011011" =>  memoryC2_uid145_exp2TabGen_q <= "0110000100";
                WHEN "011100" =>  memoryC2_uid145_exp2TabGen_q <= "0001011001";
                WHEN "011101" =>  memoryC2_uid145_exp2TabGen_q <= "0001101111";
                WHEN "011110" =>  memoryC2_uid145_exp2TabGen_q <= "0111001000";
                WHEN "011111" =>  memoryC2_uid145_exp2TabGen_q <= "0001101000";
                WHEN "100000" =>  memoryC2_uid145_exp2TabGen_q <= "0001010011";
                WHEN "100001" =>  memoryC2_uid145_exp2TabGen_q <= "0110001100";
                WHEN "100010" =>  memoryC2_uid145_exp2TabGen_q <= "0000010111";
                WHEN "100011" =>  memoryC2_uid145_exp2TabGen_q <= "1111110111";
                WHEN "100100" =>  memoryC2_uid145_exp2TabGen_q <= "0100110001";
                WHEN "100101" =>  memoryC2_uid145_exp2TabGen_q <= "1111001000";
                WHEN "100110" =>  memoryC2_uid145_exp2TabGen_q <= "1111000000";
                WHEN "100111" =>  memoryC2_uid145_exp2TabGen_q <= "0100011101";
                WHEN "101000" =>  memoryC2_uid145_exp2TabGen_q <= "1111100010";
                WHEN "101001" =>  memoryC2_uid145_exp2TabGen_q <= "0000010100";
                WHEN "101010" =>  memoryC2_uid145_exp2TabGen_q <= "0110110111";
                WHEN "101011" =>  memoryC2_uid145_exp2TabGen_q <= "0011001101";
                WHEN "101100" =>  memoryC2_uid145_exp2TabGen_q <= "0101011101";
                WHEN "101101" =>  memoryC2_uid145_exp2TabGen_q <= "1101101001";
                WHEN "101110" =>  memoryC2_uid145_exp2TabGen_q <= "1011110110";
                WHEN "101111" =>  memoryC2_uid145_exp2TabGen_q <= "0000001000";
                WHEN "110000" =>  memoryC2_uid145_exp2TabGen_q <= "1010100011";
                WHEN "110001" =>  memoryC2_uid145_exp2TabGen_q <= "1011001100";
                WHEN "110010" =>  memoryC2_uid145_exp2TabGen_q <= "0010000111";
                WHEN "110011" =>  memoryC2_uid145_exp2TabGen_q <= "1111011000";
                WHEN "110100" =>  memoryC2_uid145_exp2TabGen_q <= "0011000011";
                WHEN "110101" =>  memoryC2_uid145_exp2TabGen_q <= "1101001110";
                WHEN "110110" =>  memoryC2_uid145_exp2TabGen_q <= "1101111100";
                WHEN "110111" =>  memoryC2_uid145_exp2TabGen_q <= "0101010011";
                WHEN "111000" =>  memoryC2_uid145_exp2TabGen_q <= "0011010110";
                WHEN "111001" =>  memoryC2_uid145_exp2TabGen_q <= "1000001011";
                WHEN "111010" =>  memoryC2_uid145_exp2TabGen_q <= "0011110110";
                WHEN "111011" =>  memoryC2_uid145_exp2TabGen_q <= "0110011101";
                WHEN "111100" =>  memoryC2_uid145_exp2TabGen_q <= "0000000011";
                WHEN "111101" =>  memoryC2_uid145_exp2TabGen_q <= "0000101101";
                WHEN "111110" =>  memoryC2_uid145_exp2TabGen_q <= "1000100010";
                WHEN "111111" =>  memoryC2_uid145_exp2TabGen_q <= "0111100101";
                WHEN OTHERS =>
                    memoryC2_uid145_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--memoryC2_uid144_exp2TabGen(LOOKUP,143)@18
    memoryC2_uid144_exp2TabGen: PROCESS (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_q) IS
                WHEN "000000" =>  memoryC2_uid144_exp2TabGen_q <= "1111111110";
                WHEN "000001" =>  memoryC2_uid144_exp2TabGen_q <= "1011011110";
                WHEN "000010" =>  memoryC2_uid144_exp2TabGen_q <= "0110001100";
                WHEN "000011" =>  memoryC2_uid144_exp2TabGen_q <= "1001110010";
                WHEN "000100" =>  memoryC2_uid144_exp2TabGen_q <= "0000010011";
                WHEN "000101" =>  memoryC2_uid144_exp2TabGen_q <= "0100010011";
                WHEN "000110" =>  memoryC2_uid144_exp2TabGen_q <= "0000110011";
                WHEN "000111" =>  memoryC2_uid144_exp2TabGen_q <= "0001010001";
                WHEN "001000" =>  memoryC2_uid144_exp2TabGen_q <= "0001101001";
                WHEN "001001" =>  memoryC2_uid144_exp2TabGen_q <= "1110011000";
                WHEN "001010" =>  memoryC2_uid144_exp2TabGen_q <= "0100010110";
                WHEN "001011" =>  memoryC2_uid144_exp2TabGen_q <= "0000111111";
                WHEN "001100" =>  memoryC2_uid144_exp2TabGen_q <= "0010001010";
                WHEN "001101" =>  memoryC2_uid144_exp2TabGen_q <= "0110010010";
                WHEN "001110" =>  memoryC2_uid144_exp2TabGen_q <= "1100010000";
                WHEN "001111" =>  memoryC2_uid144_exp2TabGen_q <= "0011011111";
                WHEN "010000" =>  memoryC2_uid144_exp2TabGen_q <= "1011111000";
                WHEN "010001" =>  memoryC2_uid144_exp2TabGen_q <= "0101111010";
                WHEN "010010" =>  memoryC2_uid144_exp2TabGen_q <= "0010100010";
                WHEN "010011" =>  memoryC2_uid144_exp2TabGen_q <= "0011010010";
                WHEN "010100" =>  memoryC2_uid144_exp2TabGen_q <= "1010001100";
                WHEN "010101" =>  memoryC2_uid144_exp2TabGen_q <= "1001110110";
                WHEN "010110" =>  memoryC2_uid144_exp2TabGen_q <= "0101011010";
                WHEN "010111" =>  memoryC2_uid144_exp2TabGen_q <= "0000100101";
                WHEN "011000" =>  memoryC2_uid144_exp2TabGen_q <= "1111100110";
                WHEN "011001" =>  memoryC2_uid144_exp2TabGen_q <= "0111010101";
                WHEN "011010" =>  memoryC2_uid144_exp2TabGen_q <= "1101001010";
                WHEN "011011" =>  memoryC2_uid144_exp2TabGen_q <= "0111000101";
                WHEN "011100" =>  memoryC2_uid144_exp2TabGen_q <= "1011101100";
                WHEN "011101" =>  memoryC2_uid144_exp2TabGen_q <= "0010001001";
                WHEN "011110" =>  memoryC2_uid144_exp2TabGen_q <= "0010001101";
                WHEN "011111" =>  memoryC2_uid144_exp2TabGen_q <= "0100010010";
                WHEN "100000" =>  memoryC2_uid144_exp2TabGen_q <= "0001010110";
                WHEN "100001" =>  memoryC2_uid144_exp2TabGen_q <= "0011000010";
                WHEN "100010" =>  memoryC2_uid144_exp2TabGen_q <= "0011100100";
                WHEN "100011" =>  memoryC2_uid144_exp2TabGen_q <= "1101110101";
                WHEN "100100" =>  memoryC2_uid144_exp2TabGen_q <= "1101010110";
                WHEN "100101" =>  memoryC2_uid144_exp2TabGen_q <= "1110010001";
                WHEN "100110" =>  memoryC2_uid144_exp2TabGen_q <= "1101011100";
                WHEN "100111" =>  memoryC2_uid144_exp2TabGen_q <= "1000010100";
                WHEN "101000" =>  memoryC2_uid144_exp2TabGen_q <= "1101000100";
                WHEN "101001" =>  memoryC2_uid144_exp2TabGen_q <= "1010100001";
                WHEN "101010" =>  memoryC2_uid144_exp2TabGen_q <= "0000001100";
                WHEN "101011" =>  memoryC2_uid144_exp2TabGen_q <= "1110010010";
                WHEN "101100" =>  memoryC2_uid144_exp2TabGen_q <= "0101101101";
                WHEN "101101" =>  memoryC2_uid144_exp2TabGen_q <= "1000000100";
                WHEN "101110" =>  memoryC2_uid144_exp2TabGen_q <= "0111101100";
                WHEN "101111" =>  memoryC2_uid144_exp2TabGen_q <= "0111100111";
                WHEN "110000" =>  memoryC2_uid144_exp2TabGen_q <= "1011101001";
                WHEN "110001" =>  memoryC2_uid144_exp2TabGen_q <= "1000010001";
                WHEN "110010" =>  memoryC2_uid144_exp2TabGen_q <= "0010110001";
                WHEN "110011" =>  memoryC2_uid144_exp2TabGen_q <= "0001001001";
                WHEN "110100" =>  memoryC2_uid144_exp2TabGen_q <= "1010001100";
                WHEN "110101" =>  memoryC2_uid144_exp2TabGen_q <= "0101011101";
                WHEN "110110" =>  memoryC2_uid144_exp2TabGen_q <= "1011010001";
                WHEN "110111" =>  memoryC2_uid144_exp2TabGen_q <= "0100101111";
                WHEN "111000" =>  memoryC2_uid144_exp2TabGen_q <= "1011110001";
                WHEN "111001" =>  memoryC2_uid144_exp2TabGen_q <= "1011000110";
                WHEN "111010" =>  memoryC2_uid144_exp2TabGen_q <= "1110010000";
                WHEN "111011" =>  memoryC2_uid144_exp2TabGen_q <= "0001100101";
                WHEN "111100" =>  memoryC2_uid144_exp2TabGen_q <= "0010010001";
                WHEN "111101" =>  memoryC2_uid144_exp2TabGen_q <= "1110010101";
                WHEN "111110" =>  memoryC2_uid144_exp2TabGen_q <= "0100101011";
                WHEN "111111" =>  memoryC2_uid144_exp2TabGen_q <= "0101000000";
                WHEN OTHERS =>
                    memoryC2_uid144_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--memoryC2_uid143_exp2TabGen(LOOKUP,142)@18
    memoryC2_uid143_exp2TabGen: PROCESS (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC2_uid143_exp2TabGen_0_q_to_memoryC2_uid143_exp2TabGen_a_replace_mem_q) IS
                WHEN "000000" =>  memoryC2_uid143_exp2TabGen_q <= "0000001110";
                WHEN "000001" =>  memoryC2_uid143_exp2TabGen_q <= "0011010011";
                WHEN "000010" =>  memoryC2_uid143_exp2TabGen_q <= "1100111100";
                WHEN "000011" =>  memoryC2_uid143_exp2TabGen_q <= "0000000010";
                WHEN "000100" =>  memoryC2_uid143_exp2TabGen_q <= "0111011111";
                WHEN "000101" =>  memoryC2_uid143_exp2TabGen_q <= "1110101000";
                WHEN "000110" =>  memoryC2_uid143_exp2TabGen_q <= "1100111001";
                WHEN "000111" =>  memoryC2_uid143_exp2TabGen_q <= "1010001001";
                WHEN "001000" =>  memoryC2_uid143_exp2TabGen_q <= "1111101011";
                WHEN "001001" =>  memoryC2_uid143_exp2TabGen_q <= "0101001111";
                WHEN "001010" =>  memoryC2_uid143_exp2TabGen_q <= "1110110101";
                WHEN "001011" =>  memoryC2_uid143_exp2TabGen_q <= "0110100000";
                WHEN "001100" =>  memoryC2_uid143_exp2TabGen_q <= "1111101001";
                WHEN "001101" =>  memoryC2_uid143_exp2TabGen_q <= "1111010100";
                WHEN "001110" =>  memoryC2_uid143_exp2TabGen_q <= "1101110001";
                WHEN "001111" =>  memoryC2_uid143_exp2TabGen_q <= "0000010001";
                WHEN "010000" =>  memoryC2_uid143_exp2TabGen_q <= "1001010010";
                WHEN "010001" =>  memoryC2_uid143_exp2TabGen_q <= "0110011011";
                WHEN "010010" =>  memoryC2_uid143_exp2TabGen_q <= "1101101010";
                WHEN "010011" =>  memoryC2_uid143_exp2TabGen_q <= "1000110000";
                WHEN "010100" =>  memoryC2_uid143_exp2TabGen_q <= "1010100100";
                WHEN "010101" =>  memoryC2_uid143_exp2TabGen_q <= "1111110110";
                WHEN "010110" =>  memoryC2_uid143_exp2TabGen_q <= "1101110100";
                WHEN "010111" =>  memoryC2_uid143_exp2TabGen_q <= "0011110101";
                WHEN "011000" =>  memoryC2_uid143_exp2TabGen_q <= "1110001101";
                WHEN "011001" =>  memoryC2_uid143_exp2TabGen_q <= "0011000111";
                WHEN "011010" =>  memoryC2_uid143_exp2TabGen_q <= "0110111111";
                WHEN "011011" =>  memoryC2_uid143_exp2TabGen_q <= "1100111000";
                WHEN "011100" =>  memoryC2_uid143_exp2TabGen_q <= "0110111001";
                WHEN "011101" =>  memoryC2_uid143_exp2TabGen_q <= "0011010110";
                WHEN "011110" =>  memoryC2_uid143_exp2TabGen_q <= "1110001111";
                WHEN "011111" =>  memoryC2_uid143_exp2TabGen_q <= "0111010010";
                WHEN "100000" =>  memoryC2_uid143_exp2TabGen_q <= "1110000011";
                WHEN "100001" =>  memoryC2_uid143_exp2TabGen_q <= "1000000000";
                WHEN "100010" =>  memoryC2_uid143_exp2TabGen_q <= "1010001111";
                WHEN "100011" =>  memoryC2_uid143_exp2TabGen_q <= "1000111011";
                WHEN "100100" =>  memoryC2_uid143_exp2TabGen_q <= "0110010001";
                WHEN "100101" =>  memoryC2_uid143_exp2TabGen_q <= "1010010101";
                WHEN "100110" =>  memoryC2_uid143_exp2TabGen_q <= "0001011100";
                WHEN "100111" =>  memoryC2_uid143_exp2TabGen_q <= "1000111000";
                WHEN "101000" =>  memoryC2_uid143_exp2TabGen_q <= "1101001101";
                WHEN "101001" =>  memoryC2_uid143_exp2TabGen_q <= "1111001101";
                WHEN "101010" =>  memoryC2_uid143_exp2TabGen_q <= "1111110110";
                WHEN "101011" =>  memoryC2_uid143_exp2TabGen_q <= "1101110101";
                WHEN "101100" =>  memoryC2_uid143_exp2TabGen_q <= "1011101101";
                WHEN "101101" =>  memoryC2_uid143_exp2TabGen_q <= "1001100101";
                WHEN "101110" =>  memoryC2_uid143_exp2TabGen_q <= "0011001100";
                WHEN "101111" =>  memoryC2_uid143_exp2TabGen_q <= "1101110000";
                WHEN "110000" =>  memoryC2_uid143_exp2TabGen_q <= "0100110111";
                WHEN "110001" =>  memoryC2_uid143_exp2TabGen_q <= "1000111010";
                WHEN "110010" =>  memoryC2_uid143_exp2TabGen_q <= "0101000000";
                WHEN "110011" =>  memoryC2_uid143_exp2TabGen_q <= "1101011111";
                WHEN "110100" =>  memoryC2_uid143_exp2TabGen_q <= "1110100011";
                WHEN "110101" =>  memoryC2_uid143_exp2TabGen_q <= "1010100010";
                WHEN "110110" =>  memoryC2_uid143_exp2TabGen_q <= "0100101101";
                WHEN "110111" =>  memoryC2_uid143_exp2TabGen_q <= "0000101100";
                WHEN "111000" =>  memoryC2_uid143_exp2TabGen_q <= "1000101100";
                WHEN "111001" =>  memoryC2_uid143_exp2TabGen_q <= "1001001011";
                WHEN "111010" =>  memoryC2_uid143_exp2TabGen_q <= "0101011010";
                WHEN "111011" =>  memoryC2_uid143_exp2TabGen_q <= "0011000110";
                WHEN "111100" =>  memoryC2_uid143_exp2TabGen_q <= "0010111100";
                WHEN "111101" =>  memoryC2_uid143_exp2TabGen_q <= "1111000100";
                WHEN "111110" =>  memoryC2_uid143_exp2TabGen_q <= "0101010010";
                WHEN "111111" =>  memoryC2_uid143_exp2TabGen_q <= "1000000001";
                WHEN OTHERS =>
                    memoryC2_uid143_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--os_uid148_exp2TabGen(BITJOIN,147)@18
    os_uid148_exp2TabGen_q <= ld_memoryC2_uid147_exp2TabGen_q_to_os_uid148_exp2TabGen_e_replace_mem_q & memoryC2_uid146_exp2TabGen_q & memoryC2_uid145_exp2TabGen_q & memoryC2_uid144_exp2TabGen_q & memoryC2_uid143_exp2TabGen_q;

	--cIncludingRoundingBit_uid176_exp2PolyEval(BITJOIN,175)@18
    cIncludingRoundingBit_uid176_exp2PolyEval_q <= os_uid148_exp2TabGen_q & rndBit_uid169_exp2PolyEval_q;

	--reg_cIncludingRoundingBit_uid176_exp2PolyEval_0_to_ts3_uid177_exp2PolyEval_0(REG,317)@18
    reg_cIncludingRoundingBit_uid176_exp2PolyEval_0_to_ts3_uid177_exp2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid176_exp2PolyEval_0_to_ts3_uid177_exp2PolyEval_0_q <= "000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cIncludingRoundingBit_uid176_exp2PolyEval_0_to_ts3_uid177_exp2PolyEval_0_q <= cIncludingRoundingBit_uid176_exp2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ts3_uid177_exp2PolyEval(ADD,176)@19
    ts3_uid177_exp2PolyEval_a <= STD_LOGIC_VECTOR((45 downto 45 => reg_cIncludingRoundingBit_uid176_exp2PolyEval_0_to_ts3_uid177_exp2PolyEval_0_q(44)) & reg_cIncludingRoundingBit_uid176_exp2PolyEval_0_to_ts3_uid177_exp2PolyEval_0_q);
    ts3_uid177_exp2PolyEval_b <= STD_LOGIC_VECTOR((45 downto 38 => reg_R_uid222_pT3_uid174_exp2PolyEval_0_to_ts3_uid177_exp2PolyEval_1_q(37)) & reg_R_uid222_pT3_uid174_exp2PolyEval_0_to_ts3_uid177_exp2PolyEval_1_q);
            ts3_uid177_exp2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts3_uid177_exp2PolyEval_a) + SIGNED(ts3_uid177_exp2PolyEval_b));
    ts3_uid177_exp2PolyEval_q <= ts3_uid177_exp2PolyEval_o(45 downto 0);


	--s3_uid178_exp2PolyEval(BITSELECT,177)@19
    s3_uid178_exp2PolyEval_in <= ts3_uid177_exp2PolyEval_q;
    s3_uid178_exp2PolyEval_b <= s3_uid178_exp2PolyEval_in(45 downto 1);

	--yTop27Bits_uid224_pT4_uid180_exp2PolyEval(BITSELECT,223)@19
    yTop27Bits_uid224_pT4_uid180_exp2PolyEval_in <= s3_uid178_exp2PolyEval_b;
    yTop27Bits_uid224_pT4_uid180_exp2PolyEval_b <= yTop27Bits_uid224_pT4_uid180_exp2PolyEval_in(44 downto 18);

	--reg_yTop27Bits_uid224_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_9(REG,322)@19
    reg_yTop27Bits_uid224_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid224_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_9_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid224_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_9_q <= yTop27Bits_uid224_pT4_uid180_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_nor(LOGICAL,839)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_nor_b <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_sticky_ena_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_nor_q <= not (ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_nor_a or ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_nor_b);

	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_mem_top(CONSTANT,835)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_mem_top_q <= "01011";

	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmp(LOGICAL,836)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmp_a <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_mem_top_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdmux_q);
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmp_q <= "1" when ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmp_a = ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmp_b else "0";

	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmpReg(REG,837)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmpReg_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_sticky_ena(REG,840)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_nor_q = "1") THEN
                ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_sticky_ena_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_enaAnd(LOGICAL,841)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_enaAnd_a <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_sticky_ena_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_enaAnd_b <= en;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_enaAnd_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_enaAnd_a and ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_enaAnd_b;

	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt(COUNTER,831)
    -- every=1, low=0, high=11, step=1, init=1
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_i = 10 THEN
                      ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_i <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_i - 11;
                    ELSE
                        ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_i <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_i,4));


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdreg(REG,832)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdreg_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdmux(MUX,833)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdmux_s <= en;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdmux: PROCESS (ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdmux_s, ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdreg_q, ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdmux_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdmux_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem(DUALMEM,830)
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_ia <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT2_uid167_exp2PolyEval_a_inputreg_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_aa <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdreg_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_ab <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_rdmux_q;
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 46,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 46,
        widthad_b => 4,
        numwords_b => 12,
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
        clocken1 => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_iq,
        address_a => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_aa,
        data_a => ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_ia
    );
    ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_reset0 <= areset;
        ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_q <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_iq(45 downto 0);

	--yT4_uid179_exp2PolyEval(BITSELECT,178)@19
    yT4_uid179_exp2PolyEval_in <= ld_yPPolyEval_uid48_fpExp2Test_b_to_yT4_uid179_exp2PolyEval_a_replace_mem_q;
    yT4_uid179_exp2PolyEval_b <= yT4_uid179_exp2PolyEval_in(45 downto 3);

	--xBottomBits_uid227_pT4_uid180_exp2PolyEval(BITSELECT,226)@19
    xBottomBits_uid227_pT4_uid180_exp2PolyEval_in <= yT4_uid179_exp2PolyEval_b(15 downto 0);
    xBottomBits_uid227_pT4_uid180_exp2PolyEval_b <= xBottomBits_uid227_pT4_uid180_exp2PolyEval_in(15 downto 0);

	--pad_xBottomBits_uid227_uid229_pT4_uid180_exp2PolyEval(BITJOIN,228)@19
    pad_xBottomBits_uid227_uid229_pT4_uid180_exp2PolyEval_q <= xBottomBits_uid227_pT4_uid180_exp2PolyEval_b & STD_LOGIC_VECTOR((9 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_xBottomBits_uid227_uid229_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_7(REG,321)@19
    reg_pad_xBottomBits_uid227_uid229_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_xBottomBits_uid227_uid229_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_7_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_xBottomBits_uid227_uid229_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_7_q <= pad_xBottomBits_uid227_uid229_pT4_uid180_exp2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--yBottomBits_uid226_pT4_uid180_exp2PolyEval(BITSELECT,225)@19
    yBottomBits_uid226_pT4_uid180_exp2PolyEval_in <= s3_uid178_exp2PolyEval_b(17 downto 0);
    yBottomBits_uid226_pT4_uid180_exp2PolyEval_b <= yBottomBits_uid226_pT4_uid180_exp2PolyEval_in(17 downto 0);

	--ld_yBottomBits_uid226_pT4_uid180_exp2PolyEval_b_to_spad_yBottomBits_uid226_uid228_pT4_uid180_exp2PolyEval_a(DELAY,591)@19
    ld_yBottomBits_uid226_pT4_uid180_exp2PolyEval_b_to_spad_yBottomBits_uid226_uid228_pT4_uid180_exp2PolyEval_a : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => yBottomBits_uid226_pT4_uid180_exp2PolyEval_b, xout => ld_yBottomBits_uid226_pT4_uid180_exp2PolyEval_b_to_spad_yBottomBits_uid226_uid228_pT4_uid180_exp2PolyEval_a_q, ena => en(0), clk => clk, aclr => areset );

	--spad_yBottomBits_uid226_uid228_pT4_uid180_exp2PolyEval(BITJOIN,227)@20
    spad_yBottomBits_uid226_uid228_pT4_uid180_exp2PolyEval_q <= GND_q & ld_yBottomBits_uid226_pT4_uid180_exp2PolyEval_b_to_spad_yBottomBits_uid226_uid228_pT4_uid180_exp2PolyEval_a_q;

	--pad_yBottomBits_uid226_uid230_pT4_uid180_exp2PolyEval(BITJOIN,229)@20
    pad_yBottomBits_uid226_uid230_pT4_uid180_exp2PolyEval_q <= spad_yBottomBits_uid226_uid228_pT4_uid180_exp2PolyEval_q & STD_LOGIC_VECTOR((7 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_yBottomBits_uid226_uid230_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_6(REG,320)@20
    reg_pad_yBottomBits_uid226_uid230_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_yBottomBits_uid226_uid230_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_6_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_yBottomBits_uid226_uid230_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_6_q <= pad_yBottomBits_uid226_uid230_pT4_uid180_exp2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yT4_uid179_exp2PolyEval_b_to_xTop27Bits_uid223_pT4_uid180_exp2PolyEval_a(DELAY,585)@19
    ld_yT4_uid179_exp2PolyEval_b_to_xTop27Bits_uid223_pT4_uid180_exp2PolyEval_a : dspba_delay
    GENERIC MAP ( width => 43, depth => 1 )
    PORT MAP ( xin => yT4_uid179_exp2PolyEval_b, xout => ld_yT4_uid179_exp2PolyEval_b_to_xTop27Bits_uid223_pT4_uid180_exp2PolyEval_a_q, ena => en(0), clk => clk, aclr => areset );

	--xTop27Bits_uid223_pT4_uid180_exp2PolyEval(BITSELECT,222)@20
    xTop27Bits_uid223_pT4_uid180_exp2PolyEval_in <= ld_yT4_uid179_exp2PolyEval_b_to_xTop27Bits_uid223_pT4_uid180_exp2PolyEval_a_q;
    xTop27Bits_uid223_pT4_uid180_exp2PolyEval_b <= xTop27Bits_uid223_pT4_uid180_exp2PolyEval_in(42 downto 16);

	--reg_xTop27Bits_uid223_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_4(REG,319)@20
    reg_xTop27Bits_uid223_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid223_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_4_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop27Bits_uid223_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_4_q <= xTop27Bits_uid223_pT4_uid180_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma(CHAINMULTADD,260)@21
    multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_a(0),28));
    multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_a(1),28));
    multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_p(0) <= multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_l(0) * multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_c(0);
    multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_p(1) <= multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_l(1) * multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_c(1);
    multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_w(0) <= RESIZE(multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_p(0),56);
    multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_w(1) <= RESIZE(multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_p(1),56);
    multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_x(0) <= multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_w(0);
    multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_x(1) <= multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_w(1);
    multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_y(0) <= multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_s(1) + multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_x(0);
    multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_y(1) <= multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_x(1);
    multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_a <= (others => (others => '0'));
            multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_c <= (others => (others => '0'));
            multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_a(0) <= RESIZE(UNSIGNED(reg_xTop27Bits_uid223_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_4_q),27);
            multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_a(1) <= RESIZE(UNSIGNED(reg_pad_xBottomBits_uid227_uid229_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_7_q),27);
            multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_c(0) <= RESIZE(SIGNED(reg_pad_yBottomBits_uid226_uid230_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_6_q),27);
            multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_c(1) <= RESIZE(SIGNED(reg_yTop27Bits_uid224_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_9_q),27);
            IF (en = "1") THEN
                multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_s(0) <= multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_y(0);
                multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_s(1) <= multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_y(1);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_delay : dspba_delay
    GENERIC MAP (width => 55, depth => 1)
    PORT MAP (xin => STD_LOGIC_VECTOR(multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_s(0)(54 downto 0)), xout => multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_q, clk => clk, aclr => areset);

	--multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval(BITSELECT,231)@24
    multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_in <= multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_q;
    multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_b <= multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_in(54 downto 8);

	--highBBits_uid234_pT4_uid180_exp2PolyEval(BITSELECT,233)@24
    highBBits_uid234_pT4_uid180_exp2PolyEval_in <= multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_b;
    highBBits_uid234_pT4_uid180_exp2PolyEval_b <= highBBits_uid234_pT4_uid180_exp2PolyEval_in(46 downto 18);

	--ld_reg_yTop27Bits_uid224_pT4_uid180_exp2PolyEval_0_to_topProd_uid225_pT4_uid180_exp2PolyEval_1_q_to_topProd_uid225_pT4_uid180_exp2PolyEval_b(DELAY,588)@20
    ld_reg_yTop27Bits_uid224_pT4_uid180_exp2PolyEval_0_to_topProd_uid225_pT4_uid180_exp2PolyEval_1_q_to_topProd_uid225_pT4_uid180_exp2PolyEval_b : dspba_delay
    GENERIC MAP ( width => 27, depth => 1 )
    PORT MAP ( xin => reg_yTop27Bits_uid224_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_9_q, xout => ld_reg_yTop27Bits_uid224_pT4_uid180_exp2PolyEval_0_to_topProd_uid225_pT4_uid180_exp2PolyEval_1_q_to_topProd_uid225_pT4_uid180_exp2PolyEval_b_q, ena => en(0), clk => clk, aclr => areset );

	--topProd_uid225_pT4_uid180_exp2PolyEval(MULT,224)@21
    topProd_uid225_pT4_uid180_exp2PolyEval_pr <= signed(resize(UNSIGNED(topProd_uid225_pT4_uid180_exp2PolyEval_a),28)) * SIGNED(topProd_uid225_pT4_uid180_exp2PolyEval_b);
    topProd_uid225_pT4_uid180_exp2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid225_pT4_uid180_exp2PolyEval_a <= (others => '0');
            topProd_uid225_pT4_uid180_exp2PolyEval_b <= (others => '0');
            topProd_uid225_pT4_uid180_exp2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid225_pT4_uid180_exp2PolyEval_a <= reg_xTop27Bits_uid223_pT4_uid180_exp2PolyEval_0_to_multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_cma_4_q;
                topProd_uid225_pT4_uid180_exp2PolyEval_b <= ld_reg_yTop27Bits_uid224_pT4_uid180_exp2PolyEval_0_to_topProd_uid225_pT4_uid180_exp2PolyEval_1_q_to_topProd_uid225_pT4_uid180_exp2PolyEval_b_q;
                topProd_uid225_pT4_uid180_exp2PolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid225_pT4_uid180_exp2PolyEval_pr,54));
            END IF;
        END IF;
    END PROCESS;
    topProd_uid225_pT4_uid180_exp2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid225_pT4_uid180_exp2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid225_pT4_uid180_exp2PolyEval_q <= topProd_uid225_pT4_uid180_exp2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--sumAHighB_uid235_pT4_uid180_exp2PolyEval(ADD,234)@24
    sumAHighB_uid235_pT4_uid180_exp2PolyEval_a <= STD_LOGIC_VECTOR((54 downto 54 => topProd_uid225_pT4_uid180_exp2PolyEval_q(53)) & topProd_uid225_pT4_uid180_exp2PolyEval_q);
    sumAHighB_uid235_pT4_uid180_exp2PolyEval_b <= STD_LOGIC_VECTOR((54 downto 29 => highBBits_uid234_pT4_uid180_exp2PolyEval_b(28)) & highBBits_uid234_pT4_uid180_exp2PolyEval_b);
            sumAHighB_uid235_pT4_uid180_exp2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid235_pT4_uid180_exp2PolyEval_a) + SIGNED(sumAHighB_uid235_pT4_uid180_exp2PolyEval_b));
    sumAHighB_uid235_pT4_uid180_exp2PolyEval_q <= sumAHighB_uid235_pT4_uid180_exp2PolyEval_o(54 downto 0);


	--lowRangeB_uid233_pT4_uid180_exp2PolyEval(BITSELECT,232)@24
    lowRangeB_uid233_pT4_uid180_exp2PolyEval_in <= multSumOfTwo27_uid228_pT4_uid180_exp2PolyEval_b(17 downto 0);
    lowRangeB_uid233_pT4_uid180_exp2PolyEval_b <= lowRangeB_uid233_pT4_uid180_exp2PolyEval_in(17 downto 0);

	--add0_uid233_uid236_pT4_uid180_exp2PolyEval(BITJOIN,235)@24
    add0_uid233_uid236_pT4_uid180_exp2PolyEval_q <= sumAHighB_uid235_pT4_uid180_exp2PolyEval_q & lowRangeB_uid233_pT4_uid180_exp2PolyEval_b;

	--R_uid237_pT4_uid180_exp2PolyEval(BITSELECT,236)@24
    R_uid237_pT4_uid180_exp2PolyEval_in <= add0_uid233_uid236_pT4_uid180_exp2PolyEval_q(71 downto 0);
    R_uid237_pT4_uid180_exp2PolyEval_b <= R_uid237_pT4_uid180_exp2PolyEval_in(71 downto 26);

	--reg_R_uid237_pT4_uid180_exp2PolyEval_0_to_ts4_uid183_exp2PolyEval_1(REG,326)@24
    reg_R_uid237_pT4_uid180_exp2PolyEval_0_to_ts4_uid183_exp2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid237_pT4_uid180_exp2PolyEval_0_to_ts4_uid183_exp2PolyEval_1_q <= "0000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_R_uid237_pT4_uid180_exp2PolyEval_0_to_ts4_uid183_exp2PolyEval_1_q <= R_uid237_pT4_uid180_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_nor(LOGICAL,891)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_nor_b <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_sticky_ena_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_nor_q <= not (ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_nor_a or ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_nor_b);

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_mem_top(CONSTANT,759)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_mem_top_q <= "010000";

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmp(LOGICAL,760)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmp_a <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_mem_top_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdmux_q);
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmp_q <= "1" when ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmp_a = ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmp_b else "0";

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmpReg(REG,761)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmpReg_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_sticky_ena(REG,892)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_nor_q = "1") THEN
                ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_sticky_ena_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_enaAnd(LOGICAL,893)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_enaAnd_a <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_sticky_ena_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_enaAnd_b <= en;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_enaAnd_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_enaAnd_a and ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_enaAnd_b;

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt(COUNTER,755)
    -- every=1, low=0, high=16, step=1, init=1
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_i = 15 THEN
                      ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_i <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_i - 16;
                    ELSE
                        ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_i <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_i,5));


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdreg(REG,756)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdreg_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdmux(MUX,757)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdmux_s <= en;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdmux: PROCESS (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdmux_s, ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdreg_q, ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdmux_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdmux_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem(DUALMEM,882)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_ia <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_inputreg_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_aa <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdreg_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_ab <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdmux_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 5,
        numwords_a => 17,
        width_b => 6,
        widthad_b => 5,
        numwords_b => 17,
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
        clocken1 => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_iq,
        address_a => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_aa,
        data_a => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_ia
    );
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_reset0 <= areset;
        ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_iq(5 downto 0);

	--reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0(REG,284)@23
    reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid140_exp2TabGen(LOOKUP,139)@24
    memoryC1_uid140_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC1_uid140_exp2TabGen_q <= "0101100010";
                WHEN "000001" =>  memoryC1_uid140_exp2TabGen_q <= "0101100110";
                WHEN "000010" =>  memoryC1_uid140_exp2TabGen_q <= "0101101010";
                WHEN "000011" =>  memoryC1_uid140_exp2TabGen_q <= "0101101110";
                WHEN "000100" =>  memoryC1_uid140_exp2TabGen_q <= "0101110010";
                WHEN "000101" =>  memoryC1_uid140_exp2TabGen_q <= "0101110110";
                WHEN "000110" =>  memoryC1_uid140_exp2TabGen_q <= "0101111010";
                WHEN "000111" =>  memoryC1_uid140_exp2TabGen_q <= "0101111110";
                WHEN "001000" =>  memoryC1_uid140_exp2TabGen_q <= "0110000011";
                WHEN "001001" =>  memoryC1_uid140_exp2TabGen_q <= "0110000111";
                WHEN "001010" =>  memoryC1_uid140_exp2TabGen_q <= "0110001011";
                WHEN "001011" =>  memoryC1_uid140_exp2TabGen_q <= "0110001111";
                WHEN "001100" =>  memoryC1_uid140_exp2TabGen_q <= "0110010100";
                WHEN "001101" =>  memoryC1_uid140_exp2TabGen_q <= "0110011000";
                WHEN "001110" =>  memoryC1_uid140_exp2TabGen_q <= "0110011100";
                WHEN "001111" =>  memoryC1_uid140_exp2TabGen_q <= "0110100001";
                WHEN "010000" =>  memoryC1_uid140_exp2TabGen_q <= "0110100110";
                WHEN "010001" =>  memoryC1_uid140_exp2TabGen_q <= "0110101010";
                WHEN "010010" =>  memoryC1_uid140_exp2TabGen_q <= "0110101111";
                WHEN "010011" =>  memoryC1_uid140_exp2TabGen_q <= "0110110011";
                WHEN "010100" =>  memoryC1_uid140_exp2TabGen_q <= "0110111000";
                WHEN "010101" =>  memoryC1_uid140_exp2TabGen_q <= "0110111101";
                WHEN "010110" =>  memoryC1_uid140_exp2TabGen_q <= "0111000010";
                WHEN "010111" =>  memoryC1_uid140_exp2TabGen_q <= "0111000111";
                WHEN "011000" =>  memoryC1_uid140_exp2TabGen_q <= "0111001100";
                WHEN "011001" =>  memoryC1_uid140_exp2TabGen_q <= "0111010001";
                WHEN "011010" =>  memoryC1_uid140_exp2TabGen_q <= "0111010110";
                WHEN "011011" =>  memoryC1_uid140_exp2TabGen_q <= "0111011011";
                WHEN "011100" =>  memoryC1_uid140_exp2TabGen_q <= "0111100000";
                WHEN "011101" =>  memoryC1_uid140_exp2TabGen_q <= "0111100101";
                WHEN "011110" =>  memoryC1_uid140_exp2TabGen_q <= "0111101011";
                WHEN "011111" =>  memoryC1_uid140_exp2TabGen_q <= "0111110000";
                WHEN "100000" =>  memoryC1_uid140_exp2TabGen_q <= "0111110101";
                WHEN "100001" =>  memoryC1_uid140_exp2TabGen_q <= "0111111011";
                WHEN "100010" =>  memoryC1_uid140_exp2TabGen_q <= "1000000000";
                WHEN "100011" =>  memoryC1_uid140_exp2TabGen_q <= "1000000110";
                WHEN "100100" =>  memoryC1_uid140_exp2TabGen_q <= "1000001100";
                WHEN "100101" =>  memoryC1_uid140_exp2TabGen_q <= "1000010001";
                WHEN "100110" =>  memoryC1_uid140_exp2TabGen_q <= "1000010111";
                WHEN "100111" =>  memoryC1_uid140_exp2TabGen_q <= "1000011101";
                WHEN "101000" =>  memoryC1_uid140_exp2TabGen_q <= "1000100011";
                WHEN "101001" =>  memoryC1_uid140_exp2TabGen_q <= "1000101001";
                WHEN "101010" =>  memoryC1_uid140_exp2TabGen_q <= "1000101111";
                WHEN "101011" =>  memoryC1_uid140_exp2TabGen_q <= "1000110101";
                WHEN "101100" =>  memoryC1_uid140_exp2TabGen_q <= "1000111011";
                WHEN "101101" =>  memoryC1_uid140_exp2TabGen_q <= "1001000001";
                WHEN "101110" =>  memoryC1_uid140_exp2TabGen_q <= "1001001000";
                WHEN "101111" =>  memoryC1_uid140_exp2TabGen_q <= "1001001110";
                WHEN "110000" =>  memoryC1_uid140_exp2TabGen_q <= "1001010100";
                WHEN "110001" =>  memoryC1_uid140_exp2TabGen_q <= "1001011011";
                WHEN "110010" =>  memoryC1_uid140_exp2TabGen_q <= "1001100001";
                WHEN "110011" =>  memoryC1_uid140_exp2TabGen_q <= "1001101000";
                WHEN "110100" =>  memoryC1_uid140_exp2TabGen_q <= "1001101111";
                WHEN "110101" =>  memoryC1_uid140_exp2TabGen_q <= "1001110110";
                WHEN "110110" =>  memoryC1_uid140_exp2TabGen_q <= "1001111100";
                WHEN "110111" =>  memoryC1_uid140_exp2TabGen_q <= "1010000011";
                WHEN "111000" =>  memoryC1_uid140_exp2TabGen_q <= "1010001010";
                WHEN "111001" =>  memoryC1_uid140_exp2TabGen_q <= "1010010001";
                WHEN "111010" =>  memoryC1_uid140_exp2TabGen_q <= "1010011001";
                WHEN "111011" =>  memoryC1_uid140_exp2TabGen_q <= "1010100000";
                WHEN "111100" =>  memoryC1_uid140_exp2TabGen_q <= "1010100111";
                WHEN "111101" =>  memoryC1_uid140_exp2TabGen_q <= "1010101111";
                WHEN "111110" =>  memoryC1_uid140_exp2TabGen_q <= "1010110110";
                WHEN "111111" =>  memoryC1_uid140_exp2TabGen_q <= "1010111110";
                WHEN OTHERS =>
                    memoryC1_uid140_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_nor(LOGICAL,763)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_nor_b <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_sticky_ena_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_nor_q <= not (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_nor_a or ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_nor_b);

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_sticky_ena(REG,764)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_nor_q = "1") THEN
                ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_sticky_ena_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_enaAnd(LOGICAL,765)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_enaAnd_a <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_sticky_ena_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_enaAnd_b <= en;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_enaAnd_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_enaAnd_a and ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_enaAnd_b;

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem(DUALMEM,754)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_ia <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_inputreg_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_aa <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdreg_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_ab <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_rdmux_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 5,
        numwords_a => 17,
        width_b => 6,
        widthad_b => 5,
        numwords_b => 17,
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
        clocken1 => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_iq,
        address_a => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_aa,
        data_a => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_ia
    );
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_reset0 <= areset;
        ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_iq(5 downto 0);

	--memoryC1_uid139_exp2TabGen(LOOKUP,138)@24
    memoryC1_uid139_exp2TabGen: PROCESS (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_q) IS
                WHEN "000000" =>  memoryC1_uid139_exp2TabGen_q <= "1110010000";
                WHEN "000001" =>  memoryC1_uid139_exp2TabGen_q <= "1100000110";
                WHEN "000010" =>  memoryC1_uid139_exp2TabGen_q <= "1010100110";
                WHEN "000011" =>  memoryC1_uid139_exp2TabGen_q <= "1001110010";
                WHEN "000100" =>  memoryC1_uid139_exp2TabGen_q <= "1001101010";
                WHEN "000101" =>  memoryC1_uid139_exp2TabGen_q <= "1010001110";
                WHEN "000110" =>  memoryC1_uid139_exp2TabGen_q <= "1011100000";
                WHEN "000111" =>  memoryC1_uid139_exp2TabGen_q <= "1101011111";
                WHEN "001000" =>  memoryC1_uid139_exp2TabGen_q <= "0000001100";
                WHEN "001001" =>  memoryC1_uid139_exp2TabGen_q <= "0011100111";
                WHEN "001010" =>  memoryC1_uid139_exp2TabGen_q <= "0111110001";
                WHEN "001011" =>  memoryC1_uid139_exp2TabGen_q <= "1100101011";
                WHEN "001100" =>  memoryC1_uid139_exp2TabGen_q <= "0010010101";
                WHEN "001101" =>  memoryC1_uid139_exp2TabGen_q <= "1000110000";
                WHEN "001110" =>  memoryC1_uid139_exp2TabGen_q <= "1111111011";
                WHEN "001111" =>  memoryC1_uid139_exp2TabGen_q <= "0111111000";
                WHEN "010000" =>  memoryC1_uid139_exp2TabGen_q <= "0000101000";
                WHEN "010001" =>  memoryC1_uid139_exp2TabGen_q <= "1010001010";
                WHEN "010010" =>  memoryC1_uid139_exp2TabGen_q <= "0100011111";
                WHEN "010011" =>  memoryC1_uid139_exp2TabGen_q <= "1111101000";
                WHEN "010100" =>  memoryC1_uid139_exp2TabGen_q <= "1011100101";
                WHEN "010101" =>  memoryC1_uid139_exp2TabGen_q <= "1000011000";
                WHEN "010110" =>  memoryC1_uid139_exp2TabGen_q <= "0110000000";
                WHEN "010111" =>  memoryC1_uid139_exp2TabGen_q <= "0100011110";
                WHEN "011000" =>  memoryC1_uid139_exp2TabGen_q <= "0011110010";
                WHEN "011001" =>  memoryC1_uid139_exp2TabGen_q <= "0011111110";
                WHEN "011010" =>  memoryC1_uid139_exp2TabGen_q <= "0101000010";
                WHEN "011011" =>  memoryC1_uid139_exp2TabGen_q <= "0110111110";
                WHEN "011100" =>  memoryC1_uid139_exp2TabGen_q <= "1001110100";
                WHEN "011101" =>  memoryC1_uid139_exp2TabGen_q <= "1101100011";
                WHEN "011110" =>  memoryC1_uid139_exp2TabGen_q <= "0010001100";
                WHEN "011111" =>  memoryC1_uid139_exp2TabGen_q <= "0111110001";
                WHEN "100000" =>  memoryC1_uid139_exp2TabGen_q <= "1110010001";
                WHEN "100001" =>  memoryC1_uid139_exp2TabGen_q <= "0101101101";
                WHEN "100010" =>  memoryC1_uid139_exp2TabGen_q <= "1110000111";
                WHEN "100011" =>  memoryC1_uid139_exp2TabGen_q <= "0111011110";
                WHEN "100100" =>  memoryC1_uid139_exp2TabGen_q <= "0001110011";
                WHEN "100101" =>  memoryC1_uid139_exp2TabGen_q <= "1101000111";
                WHEN "100110" =>  memoryC1_uid139_exp2TabGen_q <= "1001011011";
                WHEN "100111" =>  memoryC1_uid139_exp2TabGen_q <= "0110101111";
                WHEN "101000" =>  memoryC1_uid139_exp2TabGen_q <= "0101000100";
                WHEN "101001" =>  memoryC1_uid139_exp2TabGen_q <= "0100011011";
                WHEN "101010" =>  memoryC1_uid139_exp2TabGen_q <= "0100110101";
                WHEN "101011" =>  memoryC1_uid139_exp2TabGen_q <= "0110010001";
                WHEN "101100" =>  memoryC1_uid139_exp2TabGen_q <= "1000110010";
                WHEN "101101" =>  memoryC1_uid139_exp2TabGen_q <= "1100010111";
                WHEN "101110" =>  memoryC1_uid139_exp2TabGen_q <= "0001000001";
                WHEN "101111" =>  memoryC1_uid139_exp2TabGen_q <= "0110110010";
                WHEN "110000" =>  memoryC1_uid139_exp2TabGen_q <= "1101101010";
                WHEN "110001" =>  memoryC1_uid139_exp2TabGen_q <= "0101101001";
                WHEN "110010" =>  memoryC1_uid139_exp2TabGen_q <= "1110110001";
                WHEN "110011" =>  memoryC1_uid139_exp2TabGen_q <= "1001000010";
                WHEN "110100" =>  memoryC1_uid139_exp2TabGen_q <= "0100011101";
                WHEN "110101" =>  memoryC1_uid139_exp2TabGen_q <= "0001000011";
                WHEN "110110" =>  memoryC1_uid139_exp2TabGen_q <= "1110110100";
                WHEN "110111" =>  memoryC1_uid139_exp2TabGen_q <= "1101110011";
                WHEN "111000" =>  memoryC1_uid139_exp2TabGen_q <= "1101111110";
                WHEN "111001" =>  memoryC1_uid139_exp2TabGen_q <= "1111011000";
                WHEN "111010" =>  memoryC1_uid139_exp2TabGen_q <= "0010000000";
                WHEN "111011" =>  memoryC1_uid139_exp2TabGen_q <= "0101111001";
                WHEN "111100" =>  memoryC1_uid139_exp2TabGen_q <= "1011000010";
                WHEN "111101" =>  memoryC1_uid139_exp2TabGen_q <= "0001011101";
                WHEN "111110" =>  memoryC1_uid139_exp2TabGen_q <= "1001001011";
                WHEN "111111" =>  memoryC1_uid139_exp2TabGen_q <= "0010001100";
                WHEN OTHERS =>
                    memoryC1_uid139_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--memoryC1_uid138_exp2TabGen(LOOKUP,137)@24
    memoryC1_uid138_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC1_uid138_exp2TabGen_q <= "1011111110";
                WHEN "000001" =>  memoryC1_uid138_exp2TabGen_q <= "0000001011";
                WHEN "000010" =>  memoryC1_uid138_exp2TabGen_q <= "0101110101";
                WHEN "000011" =>  memoryC1_uid138_exp2TabGen_q <= "0100011101";
                WHEN "000100" =>  memoryC1_uid138_exp2TabGen_q <= "0011101010";
                WHEN "000101" =>  memoryC1_uid138_exp2TabGen_q <= "1011000110";
                WHEN "000110" =>  memoryC1_uid138_exp2TabGen_q <= "0010100001";
                WHEN "000111" =>  memoryC1_uid138_exp2TabGen_q <= "0001110010";
                WHEN "001000" =>  memoryC1_uid138_exp2TabGen_q <= "0000110100";
                WHEN "001001" =>  memoryC1_uid138_exp2TabGen_q <= "0111100110";
                WHEN "001010" =>  memoryC1_uid138_exp2TabGen_q <= "1110010001";
                WHEN "001011" =>  memoryC1_uid138_exp2TabGen_q <= "1100111111";
                WHEN "001100" =>  memoryC1_uid138_exp2TabGen_q <= "1100000011";
                WHEN "001101" =>  memoryC1_uid138_exp2TabGen_q <= "0011110011";
                WHEN "001110" =>  memoryC1_uid138_exp2TabGen_q <= "1100101110";
                WHEN "001111" =>  memoryC1_uid138_exp2TabGen_q <= "1111010110";
                WHEN "010000" =>  memoryC1_uid138_exp2TabGen_q <= "0100010100";
                WHEN "010001" =>  memoryC1_uid138_exp2TabGen_q <= "0100011000";
                WHEN "010010" =>  memoryC1_uid138_exp2TabGen_q <= "1000010111";
                WHEN "010011" =>  memoryC1_uid138_exp2TabGen_q <= "1001001100";
                WHEN "010100" =>  memoryC1_uid138_exp2TabGen_q <= "1111111001";
                WHEN "010101" =>  memoryC1_uid138_exp2TabGen_q <= "0101100110";
                WHEN "010110" =>  memoryC1_uid138_exp2TabGen_q <= "0011100010";
                WHEN "010111" =>  memoryC1_uid138_exp2TabGen_q <= "0011000000";
                WHEN "011000" =>  memoryC1_uid138_exp2TabGen_q <= "1101011100";
                WHEN "011001" =>  memoryC1_uid138_exp2TabGen_q <= "1100011000";
                WHEN "011010" =>  memoryC1_uid138_exp2TabGen_q <= "1001011100";
                WHEN "011011" =>  memoryC1_uid138_exp2TabGen_q <= "1110011000";
                WHEN "011100" =>  memoryC1_uid138_exp2TabGen_q <= "0101000001";
                WHEN "011101" =>  memoryC1_uid138_exp2TabGen_q <= "0111010100";
                WHEN "011110" =>  memoryC1_uid138_exp2TabGen_q <= "1111010101";
                WHEN "011111" =>  memoryC1_uid138_exp2TabGen_q <= "0111001111";
                WHEN "100000" =>  memoryC1_uid138_exp2TabGen_q <= "1001010011";
                WHEN "100001" =>  memoryC1_uid138_exp2TabGen_q <= "1111111010";
                WHEN "100010" =>  memoryC1_uid138_exp2TabGen_q <= "0101100101";
                WHEN "100011" =>  memoryC1_uid138_exp2TabGen_q <= "0100111011";
                WHEN "100100" =>  memoryC1_uid138_exp2TabGen_q <= "1000101011";
                WHEN "100101" =>  memoryC1_uid138_exp2TabGen_q <= "1011101011";
                WHEN "100110" =>  memoryC1_uid138_exp2TabGen_q <= "1000111010";
                WHEN "100111" =>  memoryC1_uid138_exp2TabGen_q <= "1011011100";
                WHEN "101000" =>  memoryC1_uid138_exp2TabGen_q <= "1110100000";
                WHEN "101001" =>  memoryC1_uid138_exp2TabGen_q <= "1101011010";
                WHEN "101010" =>  memoryC1_uid138_exp2TabGen_q <= "0011101000";
                WHEN "101011" =>  memoryC1_uid138_exp2TabGen_q <= "1100101111";
                WHEN "101100" =>  memoryC1_uid138_exp2TabGen_q <= "0100011011";
                WHEN "101101" =>  memoryC1_uid138_exp2TabGen_q <= "0110100010";
                WHEN "101110" =>  memoryC1_uid138_exp2TabGen_q <= "1111000010";
                WHEN "101111" =>  memoryC1_uid138_exp2TabGen_q <= "1001111111";
                WHEN "110000" =>  memoryC1_uid138_exp2TabGen_q <= "0011101010";
                WHEN "110001" =>  memoryC1_uid138_exp2TabGen_q <= "1000010111";
                WHEN "110010" =>  memoryC1_uid138_exp2TabGen_q <= "0100101000";
                WHEN "110011" =>  memoryC1_uid138_exp2TabGen_q <= "0101000011";
                WHEN "110100" =>  memoryC1_uid138_exp2TabGen_q <= "0110011010";
                WHEN "110101" =>  memoryC1_uid138_exp2TabGen_q <= "0101100110";
                WHEN "110110" =>  memoryC1_uid138_exp2TabGen_q <= "1111101011";
                WHEN "110111" =>  memoryC1_uid138_exp2TabGen_q <= "0001110100";
                WHEN "111000" =>  memoryC1_uid138_exp2TabGen_q <= "1001010110";
                WHEN "111001" =>  memoryC1_uid138_exp2TabGen_q <= "0011110000";
                WHEN "111010" =>  memoryC1_uid138_exp2TabGen_q <= "1110101001";
                WHEN "111011" =>  memoryC1_uid138_exp2TabGen_q <= "0111110011";
                WHEN "111100" =>  memoryC1_uid138_exp2TabGen_q <= "1101001000";
                WHEN "111101" =>  memoryC1_uid138_exp2TabGen_q <= "1100101101";
                WHEN "111110" =>  memoryC1_uid138_exp2TabGen_q <= "0100110000";
                WHEN "111111" =>  memoryC1_uid138_exp2TabGen_q <= "0011101011";
                WHEN OTHERS =>
                    memoryC1_uid138_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--memoryC1_uid137_exp2TabGen(LOOKUP,136)@24
    memoryC1_uid137_exp2TabGen: PROCESS (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid137_exp2TabGen_0_q_to_memoryC1_uid137_exp2TabGen_a_replace_mem_q) IS
                WHEN "000000" =>  memoryC1_uid137_exp2TabGen_q <= "1111101000";
                WHEN "000001" =>  memoryC1_uid137_exp2TabGen_q <= "0001010100";
                WHEN "000010" =>  memoryC1_uid137_exp2TabGen_q <= "0010010101";
                WHEN "000011" =>  memoryC1_uid137_exp2TabGen_q <= "1010101011";
                WHEN "000100" =>  memoryC1_uid137_exp2TabGen_q <= "0110000101";
                WHEN "000101" =>  memoryC1_uid137_exp2TabGen_q <= "0100111000";
                WHEN "000110" =>  memoryC1_uid137_exp2TabGen_q <= "1100111110";
                WHEN "000111" =>  memoryC1_uid137_exp2TabGen_q <= "1010110000";
                WHEN "001000" =>  memoryC1_uid137_exp2TabGen_q <= "0010000000";
                WHEN "001001" =>  memoryC1_uid137_exp2TabGen_q <= "1110111011";
                WHEN "001010" =>  memoryC1_uid137_exp2TabGen_q <= "0111000001";
                WHEN "001011" =>  memoryC1_uid137_exp2TabGen_q <= "1010001000";
                WHEN "001100" =>  memoryC1_uid137_exp2TabGen_q <= "0011010110";
                WHEN "001101" =>  memoryC1_uid137_exp2TabGen_q <= "1010000110";
                WHEN "001110" =>  memoryC1_uid137_exp2TabGen_q <= "0011000101";
                WHEN "001111" =>  memoryC1_uid137_exp2TabGen_q <= "0001010100";
                WHEN "010000" =>  memoryC1_uid137_exp2TabGen_q <= "0111001000";
                WHEN "010001" =>  memoryC1_uid137_exp2TabGen_q <= "0111010000";
                WHEN "010010" =>  memoryC1_uid137_exp2TabGen_q <= "0101110110";
                WHEN "010011" =>  memoryC1_uid137_exp2TabGen_q <= "1001100000";
                WHEN "010100" =>  memoryC1_uid137_exp2TabGen_q <= "1100011100";
                WHEN "010101" =>  memoryC1_uid137_exp2TabGen_q <= "1101011101";
                WHEN "010110" =>  memoryC1_uid137_exp2TabGen_q <= "0001001000";
                WHEN "010111" =>  memoryC1_uid137_exp2TabGen_q <= "0010110111";
                WHEN "011000" =>  memoryC1_uid137_exp2TabGen_q <= "0110000001";
                WHEN "011001" =>  memoryC1_uid137_exp2TabGen_q <= "0111000101";
                WHEN "011010" =>  memoryC1_uid137_exp2TabGen_q <= "1100101111";
                WHEN "011011" =>  memoryC1_uid137_exp2TabGen_q <= "1001000111";
                WHEN "011100" =>  memoryC1_uid137_exp2TabGen_q <= "1010111000";
                WHEN "011101" =>  memoryC1_uid137_exp2TabGen_q <= "1110011100";
                WHEN "011110" =>  memoryC1_uid137_exp2TabGen_q <= "1111001100";
                WHEN "011111" =>  memoryC1_uid137_exp2TabGen_q <= "1000101000";
                WHEN "100000" =>  memoryC1_uid137_exp2TabGen_q <= "0111101010";
                WHEN "100001" =>  memoryC1_uid137_exp2TabGen_q <= "1011110011";
                WHEN "100010" =>  memoryC1_uid137_exp2TabGen_q <= "1000011000";
                WHEN "100011" =>  memoryC1_uid137_exp2TabGen_q <= "0101111001";
                WHEN "100100" =>  memoryC1_uid137_exp2TabGen_q <= "0011001101";
                WHEN "100101" =>  memoryC1_uid137_exp2TabGen_q <= "0110111001";
                WHEN "100110" =>  memoryC1_uid137_exp2TabGen_q <= "0000011101";
                WHEN "100111" =>  memoryC1_uid137_exp2TabGen_q <= "1001110010";
                WHEN "101000" =>  memoryC1_uid137_exp2TabGen_q <= "1000010100";
                WHEN "101001" =>  memoryC1_uid137_exp2TabGen_q <= "1110100010";
                WHEN "101010" =>  memoryC1_uid137_exp2TabGen_q <= "1101001111";
                WHEN "101011" =>  memoryC1_uid137_exp2TabGen_q <= "0100111100";
                WHEN "101100" =>  memoryC1_uid137_exp2TabGen_q <= "0111010010";
                WHEN "101101" =>  memoryC1_uid137_exp2TabGen_q <= "1000011011";
                WHEN "101110" =>  memoryC1_uid137_exp2TabGen_q <= "0000011010";
                WHEN "101111" =>  memoryC1_uid137_exp2TabGen_q <= "1100101101";
                WHEN "110000" =>  memoryC1_uid137_exp2TabGen_q <= "0001100111";
                WHEN "110001" =>  memoryC1_uid137_exp2TabGen_q <= "1011101011";
                WHEN "110010" =>  memoryC1_uid137_exp2TabGen_q <= "0001010001";
                WHEN "110011" =>  memoryC1_uid137_exp2TabGen_q <= "0100000000";
                WHEN "110100" =>  memoryC1_uid137_exp2TabGen_q <= "0010010100";
                WHEN "110101" =>  memoryC1_uid137_exp2TabGen_q <= "1000111100";
                WHEN "110110" =>  memoryC1_uid137_exp2TabGen_q <= "0100100001";
                WHEN "110111" =>  memoryC1_uid137_exp2TabGen_q <= "0011000111";
                WHEN "111000" =>  memoryC1_uid137_exp2TabGen_q <= "0101110101";
                WHEN "111001" =>  memoryC1_uid137_exp2TabGen_q <= "0010011001";
                WHEN "111010" =>  memoryC1_uid137_exp2TabGen_q <= "0100110010";
                WHEN "111011" =>  memoryC1_uid137_exp2TabGen_q <= "0000110110";
                WHEN "111100" =>  memoryC1_uid137_exp2TabGen_q <= "0100000000";
                WHEN "111101" =>  memoryC1_uid137_exp2TabGen_q <= "0110110101";
                WHEN "111110" =>  memoryC1_uid137_exp2TabGen_q <= "1110110111";
                WHEN "111111" =>  memoryC1_uid137_exp2TabGen_q <= "0000001100";
                WHEN OTHERS =>
                    memoryC1_uid137_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--memoryC1_uid136_exp2TabGen(LOOKUP,135)@24
    memoryC1_uid136_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC1_uid136_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC1_uid136_exp2TabGen_q <= "1110100001";
                WHEN "000001" =>  memoryC1_uid136_exp2TabGen_q <= "1011101010";
                WHEN "000010" =>  memoryC1_uid136_exp2TabGen_q <= "1001111011";
                WHEN "000011" =>  memoryC1_uid136_exp2TabGen_q <= "1101000000";
                WHEN "000100" =>  memoryC1_uid136_exp2TabGen_q <= "0101010110";
                WHEN "000101" =>  memoryC1_uid136_exp2TabGen_q <= "0111110011";
                WHEN "000110" =>  memoryC1_uid136_exp2TabGen_q <= "1100001000";
                WHEN "000111" =>  memoryC1_uid136_exp2TabGen_q <= "0111000110";
                WHEN "001000" =>  memoryC1_uid136_exp2TabGen_q <= "1111100101";
                WHEN "001001" =>  memoryC1_uid136_exp2TabGen_q <= "1011111110";
                WHEN "001010" =>  memoryC1_uid136_exp2TabGen_q <= "1100111001";
                WHEN "001011" =>  memoryC1_uid136_exp2TabGen_q <= "0000110100";
                WHEN "001100" =>  memoryC1_uid136_exp2TabGen_q <= "0011001010";
                WHEN "001101" =>  memoryC1_uid136_exp2TabGen_q <= "0110000000";
                WHEN "001110" =>  memoryC1_uid136_exp2TabGen_q <= "0111110100";
                WHEN "001111" =>  memoryC1_uid136_exp2TabGen_q <= "0010111010";
                WHEN "010000" =>  memoryC1_uid136_exp2TabGen_q <= "1010001000";
                WHEN "010001" =>  memoryC1_uid136_exp2TabGen_q <= "1110011001";
                WHEN "010010" =>  memoryC1_uid136_exp2TabGen_q <= "0010110011";
                WHEN "010011" =>  memoryC1_uid136_exp2TabGen_q <= "1010001011";
                WHEN "010100" =>  memoryC1_uid136_exp2TabGen_q <= "0001000101";
                WHEN "010101" =>  memoryC1_uid136_exp2TabGen_q <= "0101000001";
                WHEN "010110" =>  memoryC1_uid136_exp2TabGen_q <= "0101001010";
                WHEN "010111" =>  memoryC1_uid136_exp2TabGen_q <= "0001011011";
                WHEN "011000" =>  memoryC1_uid136_exp2TabGen_q <= "0110000010";
                WHEN "011001" =>  memoryC1_uid136_exp2TabGen_q <= "0001011101";
                WHEN "011010" =>  memoryC1_uid136_exp2TabGen_q <= "1000101110";
                WHEN "011011" =>  memoryC1_uid136_exp2TabGen_q <= "1001001000";
                WHEN "011100" =>  memoryC1_uid136_exp2TabGen_q <= "0100000001";
                WHEN "011101" =>  memoryC1_uid136_exp2TabGen_q <= "1011001010";
                WHEN "011110" =>  memoryC1_uid136_exp2TabGen_q <= "0110010111";
                WHEN "011111" =>  memoryC1_uid136_exp2TabGen_q <= "1011110000";
                WHEN "100000" =>  memoryC1_uid136_exp2TabGen_q <= "1110011101";
                WHEN "100001" =>  memoryC1_uid136_exp2TabGen_q <= "0001110001";
                WHEN "100010" =>  memoryC1_uid136_exp2TabGen_q <= "0110101101";
                WHEN "100011" =>  memoryC1_uid136_exp2TabGen_q <= "0110001111";
                WHEN "100100" =>  memoryC1_uid136_exp2TabGen_q <= "1100101111";
                WHEN "100101" =>  memoryC1_uid136_exp2TabGen_q <= "0010000110";
                WHEN "100110" =>  memoryC1_uid136_exp2TabGen_q <= "1110111000";
                WHEN "100111" =>  memoryC1_uid136_exp2TabGen_q <= "0011010010";
                WHEN "101000" =>  memoryC1_uid136_exp2TabGen_q <= "1001110001";
                WHEN "101001" =>  memoryC1_uid136_exp2TabGen_q <= "1010000001";
                WHEN "101010" =>  memoryC1_uid136_exp2TabGen_q <= "1001110000";
                WHEN "101011" =>  memoryC1_uid136_exp2TabGen_q <= "1111100000";
                WHEN "101100" =>  memoryC1_uid136_exp2TabGen_q <= "1111111100";
                WHEN "101101" =>  memoryC1_uid136_exp2TabGen_q <= "0000001110";
                WHEN "101110" =>  memoryC1_uid136_exp2TabGen_q <= "0100000101";
                WHEN "101111" =>  memoryC1_uid136_exp2TabGen_q <= "1100000100";
                WHEN "110000" =>  memoryC1_uid136_exp2TabGen_q <= "0110101011";
                WHEN "110001" =>  memoryC1_uid136_exp2TabGen_q <= "1110100010";
                WHEN "110010" =>  memoryC1_uid136_exp2TabGen_q <= "1010101100";
                WHEN "110011" =>  memoryC1_uid136_exp2TabGen_q <= "1101110010";
                WHEN "110100" =>  memoryC1_uid136_exp2TabGen_q <= "1000110011";
                WHEN "110101" =>  memoryC1_uid136_exp2TabGen_q <= "1011111100";
                WHEN "110110" =>  memoryC1_uid136_exp2TabGen_q <= "1001011001";
                WHEN "110111" =>  memoryC1_uid136_exp2TabGen_q <= "1011010000";
                WHEN "111000" =>  memoryC1_uid136_exp2TabGen_q <= "0110110011";
                WHEN "111001" =>  memoryC1_uid136_exp2TabGen_q <= "0110100001";
                WHEN "111010" =>  memoryC1_uid136_exp2TabGen_q <= "0001001111";
                WHEN "111011" =>  memoryC1_uid136_exp2TabGen_q <= "0111110010";
                WHEN "111100" =>  memoryC1_uid136_exp2TabGen_q <= "0000000000";
                WHEN "111101" =>  memoryC1_uid136_exp2TabGen_q <= "0110101001";
                WHEN "111110" =>  memoryC1_uid136_exp2TabGen_q <= "0001111000";
                WHEN "111111" =>  memoryC1_uid136_exp2TabGen_q <= "0101100100";
                WHEN OTHERS =>
                    memoryC1_uid136_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--os_uid142_exp2TabGen(BITJOIN,141)@24
    os_uid142_exp2TabGen_q <= GND_q & memoryC1_uid140_exp2TabGen_q & memoryC1_uid139_exp2TabGen_q & memoryC1_uid138_exp2TabGen_q & memoryC1_uid137_exp2TabGen_q & memoryC1_uid136_exp2TabGen_q;

	--cIncludingRoundingBit_uid182_exp2PolyEval(BITJOIN,181)@24
    cIncludingRoundingBit_uid182_exp2PolyEval_q <= os_uid142_exp2TabGen_q & rndBit_uid169_exp2PolyEval_q;

	--reg_cIncludingRoundingBit_uid182_exp2PolyEval_0_to_ts4_uid183_exp2PolyEval_0(REG,325)@24
    reg_cIncludingRoundingBit_uid182_exp2PolyEval_0_to_ts4_uid183_exp2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid182_exp2PolyEval_0_to_ts4_uid183_exp2PolyEval_0_q <= "00000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cIncludingRoundingBit_uid182_exp2PolyEval_0_to_ts4_uid183_exp2PolyEval_0_q <= cIncludingRoundingBit_uid182_exp2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ts4_uid183_exp2PolyEval(ADD,182)@25
    ts4_uid183_exp2PolyEval_a <= STD_LOGIC_VECTOR((53 downto 53 => reg_cIncludingRoundingBit_uid182_exp2PolyEval_0_to_ts4_uid183_exp2PolyEval_0_q(52)) & reg_cIncludingRoundingBit_uid182_exp2PolyEval_0_to_ts4_uid183_exp2PolyEval_0_q);
    ts4_uid183_exp2PolyEval_b <= STD_LOGIC_VECTOR((53 downto 46 => reg_R_uid237_pT4_uid180_exp2PolyEval_0_to_ts4_uid183_exp2PolyEval_1_q(45)) & reg_R_uid237_pT4_uid180_exp2PolyEval_0_to_ts4_uid183_exp2PolyEval_1_q);
            ts4_uid183_exp2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts4_uid183_exp2PolyEval_a) + SIGNED(ts4_uid183_exp2PolyEval_b));
    ts4_uid183_exp2PolyEval_q <= ts4_uid183_exp2PolyEval_o(53 downto 0);


	--s4_uid184_exp2PolyEval(BITSELECT,183)@25
    s4_uid184_exp2PolyEval_in <= ts4_uid183_exp2PolyEval_q;
    s4_uid184_exp2PolyEval_b <= s4_uid184_exp2PolyEval_in(53 downto 1);

	--yTop27Bits_uid239_pT5_uid186_exp2PolyEval(BITSELECT,238)@25
    yTop27Bits_uid239_pT5_uid186_exp2PolyEval_in <= s4_uid184_exp2PolyEval_b;
    yTop27Bits_uid239_pT5_uid186_exp2PolyEval_b <= yTop27Bits_uid239_pT5_uid186_exp2PolyEval_in(52 downto 26);

	--reg_yTop27Bits_uid239_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_9(REG,330)@25
    reg_yTop27Bits_uid239_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid239_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_9_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid239_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_9_q <= yTop27Bits_uid239_pT5_uid186_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_nor(LOGICAL,865)
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_nor_b <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_sticky_ena_q;
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_nor_q <= not (ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_nor_a or ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_nor_b);

	--ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_mem_top(CONSTANT,861)
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_mem_top_q <= "010001";

	--ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmp(LOGICAL,862)
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmp_a <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_mem_top_q;
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdmux_q);
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmp_q <= "1" when ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmp_a = ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmp_b else "0";

	--ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmpReg(REG,863)
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmpReg_q <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_sticky_ena(REG,866)
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_nor_q = "1") THEN
                ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_sticky_ena_q <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_enaAnd(LOGICAL,867)
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_enaAnd_a <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_sticky_ena_q;
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_enaAnd_b <= en;
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_enaAnd_q <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_enaAnd_a and ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_enaAnd_b;

	--xBottomBits_uid242_pT5_uid186_exp2PolyEval(BITSELECT,241)@5
    xBottomBits_uid242_pT5_uid186_exp2PolyEval_in <= yPPolyEval_uid48_fpExp2Test_b(18 downto 0);
    xBottomBits_uid242_pT5_uid186_exp2PolyEval_b <= xBottomBits_uid242_pT5_uid186_exp2PolyEval_in(18 downto 0);

	--ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_inputreg(DELAY,855)
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_inputreg : dspba_delay
    GENERIC MAP ( width => 19, depth => 1 )
    PORT MAP ( xin => xBottomBits_uid242_pT5_uid186_exp2PolyEval_b, xout => ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt(COUNTER,857)
    -- every=1, low=0, high=17, step=1, init=1
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_i = 16 THEN
                      ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_eq = '1') THEN
                        ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_i <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_i - 17;
                    ELSE
                        ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_i <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_i,5));


	--ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdreg(REG,858)
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdreg_q <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdmux(MUX,859)
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdmux_s <= en;
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdmux: PROCESS (ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdmux_s, ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdreg_q, ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_q)
    BEGIN
            CASE ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdmux_s IS
                  WHEN "0" => ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdmux_q <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdreg_q;
                  WHEN "1" => ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdmux_q <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem(DUALMEM,856)
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_ia <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_inputreg_q;
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_aa <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdreg_q;
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_ab <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdmux_q;
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 5,
        numwords_a => 18,
        width_b => 19,
        widthad_b => 5,
        numwords_b => 18,
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
        clocken1 => ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_iq,
        address_a => ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_aa,
        data_a => ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_ia
    );
    ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_reset0 <= areset;
        ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_q <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_iq(18 downto 0);

	--pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval(BITJOIN,245)@25
    pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_q <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_mem_q & STD_LOGIC_VECTOR((6 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_7(REG,329)@25
    reg_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_7_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_7_q <= pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_nor(LOGICAL,852)
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_nor_b <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_sticky_ena_q;
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_nor_q <= not (ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_nor_a or ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_nor_b);

	--ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_mem_top(CONSTANT,848)
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_mem_top_q <= "010010";

	--ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmp(LOGICAL,849)
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmp_a <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_mem_top_q;
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdmux_q);
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmp_q <= "1" when ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmp_a = ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmp_b else "0";

	--ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmpReg(REG,850)
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmpReg_q <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_sticky_ena(REG,853)
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_nor_q = "1") THEN
                ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_sticky_ena_q <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_enaAnd(LOGICAL,854)
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_enaAnd_a <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_sticky_ena_q;
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_enaAnd_b <= en;
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_enaAnd_q <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_enaAnd_a and ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_enaAnd_b;

	--xTop26Bits_uid243_pT5_uid186_exp2PolyEval(BITSELECT,242)@5
    xTop26Bits_uid243_pT5_uid186_exp2PolyEval_in <= yPPolyEval_uid48_fpExp2Test_b;
    xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b <= xTop26Bits_uid243_pT5_uid186_exp2PolyEval_in(45 downto 20);

	--ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_inputreg(DELAY,842)
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b, xout => ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt(COUNTER,844)
    -- every=1, low=0, high=18, step=1, init=1
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_i = 17 THEN
                      ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_i <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_i - 18;
                    ELSE
                        ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_i <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_i,5));


	--ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdreg(REG,845)
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdreg_q <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdmux(MUX,846)
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdmux_s <= en;
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdmux: PROCESS (ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdmux_s, ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdreg_q, ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdmux_q <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdmux_q <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem(DUALMEM,843)
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_ia <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_inputreg_q;
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_aa <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdreg_q;
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_ab <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_rdmux_q;
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 26,
        widthad_a => 5,
        numwords_a => 19,
        width_b => 26,
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
        clocken1 => ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_iq,
        address_a => ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_aa,
        data_a => ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_ia
    );
    ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_reset0 <= areset;
        ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_q <= ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_iq(25 downto 0);

	--spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval(BITJOIN,244)@26
    spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_q <= GND_q & ld_xTop26Bits_uid243_pT5_uid186_exp2PolyEval_b_to_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_a_replace_mem_q;

	--reg_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_6(REG,328)@26
    reg_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_6_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_6_q <= spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--yBottomBits_uid241_pT5_uid186_exp2PolyEval(BITSELECT,240)@25
    yBottomBits_uid241_pT5_uid186_exp2PolyEval_in <= s4_uid184_exp2PolyEval_b(25 downto 0);
    yBottomBits_uid241_pT5_uid186_exp2PolyEval_b <= yBottomBits_uid241_pT5_uid186_exp2PolyEval_in(25 downto 0);

	--ld_yBottomBits_uid241_pT5_uid186_exp2PolyEval_b_to_pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval_b(DELAY,610)@25
    ld_yBottomBits_uid241_pT5_uid186_exp2PolyEval_b_to_pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval_b : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => yBottomBits_uid241_pT5_uid186_exp2PolyEval_b, xout => ld_yBottomBits_uid241_pT5_uid186_exp2PolyEval_b_to_pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval_b_q, ena => en(0), clk => clk, aclr => areset );

	--pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval(BITJOIN,246)@26
    pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval_q <= ld_yBottomBits_uid241_pT5_uid186_exp2PolyEval_b_to_pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval_b_q & GND_q;

	--reg_pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_4(REG,327)@26
    reg_pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_4_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_4_q <= pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma(CHAINMULTADD,261)@27
    multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_a(0),28));
    multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_a(1),28));
    multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_p(0) <= multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_l(0) * multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_c(0);
    multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_p(1) <= multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_l(1) * multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_c(1);
    multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_w(0) <= RESIZE(multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_p(0),56);
    multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_w(1) <= RESIZE(multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_p(1),56);
    multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_x(0) <= multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_w(0);
    multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_x(1) <= multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_w(1);
    multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_y(0) <= multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_s(1) + multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_x(0);
    multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_y(1) <= multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_x(1);
    multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_a <= (others => (others => '0'));
            multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_c <= (others => (others => '0'));
            multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_a(0) <= RESIZE(UNSIGNED(reg_pad_yBottomBits_uid241_uid247_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_4_q),27);
            multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_a(1) <= RESIZE(UNSIGNED(reg_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_7_q),27);
            multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_c(0) <= RESIZE(SIGNED(reg_spad_xTop26Bits_uid243_uid245_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_6_q),27);
            multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_c(1) <= RESIZE(SIGNED(reg_yTop27Bits_uid239_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_9_q),27);
            IF (en = "1") THEN
                multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_s(0) <= multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_y(0);
                multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_s(1) <= multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_y(1);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_delay : dspba_delay
    GENERIC MAP (width => 55, depth => 1)
    PORT MAP (xin => STD_LOGIC_VECTOR(multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_s(0)(54 downto 0)), xout => multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_q, clk => clk, aclr => areset);

	--multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval(BITSELECT,248)@30
    multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_in <= multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_q;
    multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_b <= multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_in(54 downto 1);

	--highBBits_uid255_pT5_uid186_exp2PolyEval(BITSELECT,254)@30
    highBBits_uid255_pT5_uid186_exp2PolyEval_in <= multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_b;
    highBBits_uid255_pT5_uid186_exp2PolyEval_b <= highBBits_uid255_pT5_uid186_exp2PolyEval_in(53 downto 19);

	--ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_nor(LOGICAL,943)
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_nor_b <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_sticky_ena_q;
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_nor_q <= not (ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_nor_a or ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_nor_b);

	--ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_mem_top(CONSTANT,939)
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_mem_top_q <= "01101";

	--ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmp(LOGICAL,940)
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmp_a <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_mem_top_q;
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdmux_q);
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmp_q <= "1" when ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmp_a = ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmp_b else "0";

	--ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmpReg(REG,941)
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmpReg_q <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_sticky_ena(REG,944)
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_nor_q = "1") THEN
                ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_sticky_ena_q <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_enaAnd(LOGICAL,945)
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_enaAnd_a <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_sticky_ena_q;
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_enaAnd_b <= en;
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_enaAnd_q <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_enaAnd_a and ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_enaAnd_b;

	--ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_inputreg(DELAY,933)
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 27, depth => 1 )
    PORT MAP ( xin => yT2_uid167_exp2PolyEval_b, xout => ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt(COUNTER,935)
    -- every=1, low=0, high=13, step=1, init=1
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_i = 12 THEN
                      ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_eq = '1') THEN
                        ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_i <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_i - 13;
                    ELSE
                        ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_i <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_i,4));


	--ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdreg(REG,936)
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdreg_q <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdmux(MUX,937)
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdmux_s <= en;
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdmux: PROCESS (ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdmux_s, ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdreg_q, ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdmux_q <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdreg_q;
                  WHEN "1" => ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdmux_q <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem(DUALMEM,934)
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_ia <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_inputreg_q;
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_aa <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdreg_q;
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_ab <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_rdmux_q;
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 27,
        widthad_a => 4,
        numwords_a => 14,
        width_b => 27,
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
        clocken1 => ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_iq,
        address_a => ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_aa,
        data_a => ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_ia
    );
    ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_reset0 <= areset;
        ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_q <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_iq(26 downto 0);

	--reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0(REG,333)@25
    reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_q <= ld_yT2_uid167_exp2PolyEval_b_to_reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--topProd_uid240_pT5_uid186_exp2PolyEval(MULT,239)@26
    topProd_uid240_pT5_uid186_exp2PolyEval_pr <= signed(resize(UNSIGNED(topProd_uid240_pT5_uid186_exp2PolyEval_a),28)) * SIGNED(topProd_uid240_pT5_uid186_exp2PolyEval_b);
    topProd_uid240_pT5_uid186_exp2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid240_pT5_uid186_exp2PolyEval_a <= (others => '0');
            topProd_uid240_pT5_uid186_exp2PolyEval_b <= (others => '0');
            topProd_uid240_pT5_uid186_exp2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid240_pT5_uid186_exp2PolyEval_a <= reg_yT2_uid167_exp2PolyEval_0_to_topProd_uid240_pT5_uid186_exp2PolyEval_0_q;
                topProd_uid240_pT5_uid186_exp2PolyEval_b <= reg_yTop27Bits_uid239_pT5_uid186_exp2PolyEval_0_to_multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_cma_9_q;
                topProd_uid240_pT5_uid186_exp2PolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid240_pT5_uid186_exp2PolyEval_pr,54));
            END IF;
        END IF;
    END PROCESS;
    topProd_uid240_pT5_uid186_exp2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid240_pT5_uid186_exp2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid240_pT5_uid186_exp2PolyEval_q <= topProd_uid240_pT5_uid186_exp2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_nor(LOGICAL,930)
    ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_nor_b <= ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_sticky_ena_q;
    ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_nor_q <= not (ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_nor_a or ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_nor_b);

	--ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_sticky_ena(REG,931)
    ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_nor_q = "1") THEN
                ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_sticky_ena_q <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_enaAnd(LOGICAL,932)
    ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_enaAnd_a <= ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_sticky_ena_q;
    ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_enaAnd_b <= en;
    ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_enaAnd_q <= ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_enaAnd_a and ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_enaAnd_b;

	--sSM0W_uid251_pT5_uid186_exp2PolyEval(BITSELECT,250)@5
    sSM0W_uid251_pT5_uid186_exp2PolyEval_in <= yPPolyEval_uid48_fpExp2Test_b(18 downto 0);
    sSM0W_uid251_pT5_uid186_exp2PolyEval_b <= sSM0W_uid251_pT5_uid186_exp2PolyEval_in(18 downto 16);

	--ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_inputreg(DELAY,920)
    ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => sSM0W_uid251_pT5_uid186_exp2PolyEval_b, xout => ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem(DUALMEM,921)
    ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_ia <= ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_inputreg_q;
    ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_aa <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdreg_q;
    ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_ab <= ld_xBottomBits_uid242_pT5_uid186_exp2PolyEval_b_to_pad_xBottomBits_uid242_uid246_pT5_uid186_exp2PolyEval_b_replace_rdmux_q;
    ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 5,
        numwords_a => 18,
        width_b => 3,
        widthad_b => 5,
        numwords_b => 18,
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
        clocken1 => ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_iq,
        address_a => ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_aa,
        data_a => ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_ia
    );
    ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_reset0 <= areset;
        ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_q <= ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_iq(2 downto 0);

	--reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1(REG,332)@25
    reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_q <= ld_sSM0W_uid251_pT5_uid186_exp2PolyEval_b_to_reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--sSM0H_uid250_pT5_uid186_exp2PolyEval(BITSELECT,249)@25
    sSM0H_uid250_pT5_uid186_exp2PolyEval_in <= s4_uid184_exp2PolyEval_b(25 downto 0);
    sSM0H_uid250_pT5_uid186_exp2PolyEval_b <= sSM0H_uid250_pT5_uid186_exp2PolyEval_in(25 downto 23);

	--reg_sSM0H_uid250_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_0(REG,331)@25
    reg_sSM0H_uid250_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sSM0H_uid250_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sSM0H_uid250_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_0_q <= sSM0H_uid250_pT5_uid186_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--sm0_uid252_pT5_uid186_exp2PolyEval(MULT,251)@26
    sm0_uid252_pT5_uid186_exp2PolyEval_pr <= UNSIGNED(sm0_uid252_pT5_uid186_exp2PolyEval_a) * UNSIGNED(sm0_uid252_pT5_uid186_exp2PolyEval_b);
    sm0_uid252_pT5_uid186_exp2PolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid252_pT5_uid186_exp2PolyEval_a <= (others => '0');
            sm0_uid252_pT5_uid186_exp2PolyEval_b <= (others => '0');
            sm0_uid252_pT5_uid186_exp2PolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm0_uid252_pT5_uid186_exp2PolyEval_a <= reg_sSM0H_uid250_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_0_q;
                sm0_uid252_pT5_uid186_exp2PolyEval_b <= reg_sSM0W_uid251_pT5_uid186_exp2PolyEval_0_to_sm0_uid252_pT5_uid186_exp2PolyEval_1_q;
                sm0_uid252_pT5_uid186_exp2PolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid252_pT5_uid186_exp2PolyEval_pr);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid252_pT5_uid186_exp2PolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid252_pT5_uid186_exp2PolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm0_uid252_pT5_uid186_exp2PolyEval_q <= sm0_uid252_pT5_uid186_exp2PolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--TtopProdConcSoftProd_uid253_pT5_uid186_exp2PolyEval(BITJOIN,252)@29
    TtopProdConcSoftProd_uid253_pT5_uid186_exp2PolyEval_q <= topProd_uid240_pT5_uid186_exp2PolyEval_q & sm0_uid252_pT5_uid186_exp2PolyEval_q;

	--ld_TtopProdConcSoftProd_uid253_pT5_uid186_exp2PolyEval_q_to_sumAHighB_uid256_pT5_uid186_exp2PolyEval_a(DELAY,620)@29
    ld_TtopProdConcSoftProd_uid253_pT5_uid186_exp2PolyEval_q_to_sumAHighB_uid256_pT5_uid186_exp2PolyEval_a : dspba_delay
    GENERIC MAP ( width => 60, depth => 1 )
    PORT MAP ( xin => TtopProdConcSoftProd_uid253_pT5_uid186_exp2PolyEval_q, xout => ld_TtopProdConcSoftProd_uid253_pT5_uid186_exp2PolyEval_q_to_sumAHighB_uid256_pT5_uid186_exp2PolyEval_a_q, ena => en(0), clk => clk, aclr => areset );

	--sumAHighB_uid256_pT5_uid186_exp2PolyEval(ADD,255)@30
    sumAHighB_uid256_pT5_uid186_exp2PolyEval_a <= STD_LOGIC_VECTOR((60 downto 60 => ld_TtopProdConcSoftProd_uid253_pT5_uid186_exp2PolyEval_q_to_sumAHighB_uid256_pT5_uid186_exp2PolyEval_a_q(59)) & ld_TtopProdConcSoftProd_uid253_pT5_uid186_exp2PolyEval_q_to_sumAHighB_uid256_pT5_uid186_exp2PolyEval_a_q);
    sumAHighB_uid256_pT5_uid186_exp2PolyEval_b <= STD_LOGIC_VECTOR((60 downto 35 => highBBits_uid255_pT5_uid186_exp2PolyEval_b(34)) & highBBits_uid255_pT5_uid186_exp2PolyEval_b);
            sumAHighB_uid256_pT5_uid186_exp2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid256_pT5_uid186_exp2PolyEval_a) + SIGNED(sumAHighB_uid256_pT5_uid186_exp2PolyEval_b));
    sumAHighB_uid256_pT5_uid186_exp2PolyEval_q <= sumAHighB_uid256_pT5_uid186_exp2PolyEval_o(60 downto 0);


	--lowRangeB_uid254_pT5_uid186_exp2PolyEval(BITSELECT,253)@30
    lowRangeB_uid254_pT5_uid186_exp2PolyEval_in <= multSumOfTwo27_uid245_pT5_uid186_exp2PolyEval_b(18 downto 0);
    lowRangeB_uid254_pT5_uid186_exp2PolyEval_b <= lowRangeB_uid254_pT5_uid186_exp2PolyEval_in(18 downto 0);

	--add0_uid254_uid257_pT5_uid186_exp2PolyEval(BITJOIN,256)@30
    add0_uid254_uid257_pT5_uid186_exp2PolyEval_q <= sumAHighB_uid256_pT5_uid186_exp2PolyEval_q & lowRangeB_uid254_pT5_uid186_exp2PolyEval_b;

	--R_uid258_pT5_uid186_exp2PolyEval(BITSELECT,257)@30
    R_uid258_pT5_uid186_exp2PolyEval_in <= add0_uid254_uid257_pT5_uid186_exp2PolyEval_q(78 downto 0);
    R_uid258_pT5_uid186_exp2PolyEval_b <= R_uid258_pT5_uid186_exp2PolyEval_in(78 downto 24);

	--reg_R_uid258_pT5_uid186_exp2PolyEval_0_to_ts5_uid189_exp2PolyEval_1(REG,336)@30
    reg_R_uid258_pT5_uid186_exp2PolyEval_0_to_ts5_uid189_exp2PolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid258_pT5_uid186_exp2PolyEval_0_to_ts5_uid189_exp2PolyEval_1_q <= "0000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_R_uid258_pT5_uid186_exp2PolyEval_0_to_ts5_uid189_exp2PolyEval_1_q <= R_uid258_pT5_uid186_exp2PolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_nor(LOGICAL,750)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_nor_b <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_sticky_ena_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_nor_q <= not (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_nor_a or ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_nor_b);

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_mem_top(CONSTANT,746)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_mem_top_q <= "010110";

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmp(LOGICAL,747)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmp_a <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_mem_top_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdmux_q);
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmp_q <= "1" when ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmp_a = ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmp_b else "0";

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmpReg(REG,748)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmpReg_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_sticky_ena(REG,751)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_nor_q = "1") THEN
                ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_sticky_ena_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_enaAnd(LOGICAL,752)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_enaAnd_a <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_sticky_ena_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_enaAnd_b <= en;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_enaAnd_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_enaAnd_a and ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_enaAnd_b;

	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt(COUNTER,742)
    -- every=1, low=0, high=22, step=1, init=1
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_i = 21 THEN
                      ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_i <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_i - 22;
                    ELSE
                        ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_i <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_i,5));


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdreg(REG,743)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdreg_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdmux(MUX,744)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdmux_s <= en;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdmux: PROCESS (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdmux_s, ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdreg_q, ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdmux_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdmux_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem(DUALMEM,741)
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_ia <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_inputreg_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_aa <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdreg_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_ab <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdmux_q;
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 5,
        numwords_a => 23,
        width_b => 6,
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
        clocken1 => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_iq,
        address_a => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_aa,
        data_a => ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_ia
    );
    ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_reset0 <= areset;
        ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_iq(5 downto 0);

	--memoryC0_uid134_exp2TabGen(LOOKUP,133)@30
    memoryC0_uid134_exp2TabGen: PROCESS (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_q) IS
                WHEN "000000" =>  memoryC0_uid134_exp2TabGen_q <= "0100000";
                WHEN "000001" =>  memoryC0_uid134_exp2TabGen_q <= "0100000";
                WHEN "000010" =>  memoryC0_uid134_exp2TabGen_q <= "0100000";
                WHEN "000011" =>  memoryC0_uid134_exp2TabGen_q <= "0100001";
                WHEN "000100" =>  memoryC0_uid134_exp2TabGen_q <= "0100001";
                WHEN "000101" =>  memoryC0_uid134_exp2TabGen_q <= "0100001";
                WHEN "000110" =>  memoryC0_uid134_exp2TabGen_q <= "0100010";
                WHEN "000111" =>  memoryC0_uid134_exp2TabGen_q <= "0100010";
                WHEN "001000" =>  memoryC0_uid134_exp2TabGen_q <= "0100010";
                WHEN "001001" =>  memoryC0_uid134_exp2TabGen_q <= "0100011";
                WHEN "001010" =>  memoryC0_uid134_exp2TabGen_q <= "0100011";
                WHEN "001011" =>  memoryC0_uid134_exp2TabGen_q <= "0100100";
                WHEN "001100" =>  memoryC0_uid134_exp2TabGen_q <= "0100100";
                WHEN "001101" =>  memoryC0_uid134_exp2TabGen_q <= "0100100";
                WHEN "001110" =>  memoryC0_uid134_exp2TabGen_q <= "0100101";
                WHEN "001111" =>  memoryC0_uid134_exp2TabGen_q <= "0100101";
                WHEN "010000" =>  memoryC0_uid134_exp2TabGen_q <= "0100110";
                WHEN "010001" =>  memoryC0_uid134_exp2TabGen_q <= "0100110";
                WHEN "010010" =>  memoryC0_uid134_exp2TabGen_q <= "0100110";
                WHEN "010011" =>  memoryC0_uid134_exp2TabGen_q <= "0100111";
                WHEN "010100" =>  memoryC0_uid134_exp2TabGen_q <= "0100111";
                WHEN "010101" =>  memoryC0_uid134_exp2TabGen_q <= "0101000";
                WHEN "010110" =>  memoryC0_uid134_exp2TabGen_q <= "0101000";
                WHEN "010111" =>  memoryC0_uid134_exp2TabGen_q <= "0101001";
                WHEN "011000" =>  memoryC0_uid134_exp2TabGen_q <= "0101001";
                WHEN "011001" =>  memoryC0_uid134_exp2TabGen_q <= "0101001";
                WHEN "011010" =>  memoryC0_uid134_exp2TabGen_q <= "0101010";
                WHEN "011011" =>  memoryC0_uid134_exp2TabGen_q <= "0101010";
                WHEN "011100" =>  memoryC0_uid134_exp2TabGen_q <= "0101011";
                WHEN "011101" =>  memoryC0_uid134_exp2TabGen_q <= "0101011";
                WHEN "011110" =>  memoryC0_uid134_exp2TabGen_q <= "0101100";
                WHEN "011111" =>  memoryC0_uid134_exp2TabGen_q <= "0101100";
                WHEN "100000" =>  memoryC0_uid134_exp2TabGen_q <= "0101101";
                WHEN "100001" =>  memoryC0_uid134_exp2TabGen_q <= "0101101";
                WHEN "100010" =>  memoryC0_uid134_exp2TabGen_q <= "0101110";
                WHEN "100011" =>  memoryC0_uid134_exp2TabGen_q <= "0101110";
                WHEN "100100" =>  memoryC0_uid134_exp2TabGen_q <= "0101111";
                WHEN "100101" =>  memoryC0_uid134_exp2TabGen_q <= "0101111";
                WHEN "100110" =>  memoryC0_uid134_exp2TabGen_q <= "0110000";
                WHEN "100111" =>  memoryC0_uid134_exp2TabGen_q <= "0110000";
                WHEN "101000" =>  memoryC0_uid134_exp2TabGen_q <= "0110001";
                WHEN "101001" =>  memoryC0_uid134_exp2TabGen_q <= "0110001";
                WHEN "101010" =>  memoryC0_uid134_exp2TabGen_q <= "0110010";
                WHEN "101011" =>  memoryC0_uid134_exp2TabGen_q <= "0110010";
                WHEN "101100" =>  memoryC0_uid134_exp2TabGen_q <= "0110011";
                WHEN "101101" =>  memoryC0_uid134_exp2TabGen_q <= "0110100";
                WHEN "101110" =>  memoryC0_uid134_exp2TabGen_q <= "0110100";
                WHEN "101111" =>  memoryC0_uid134_exp2TabGen_q <= "0110101";
                WHEN "110000" =>  memoryC0_uid134_exp2TabGen_q <= "0110101";
                WHEN "110001" =>  memoryC0_uid134_exp2TabGen_q <= "0110110";
                WHEN "110010" =>  memoryC0_uid134_exp2TabGen_q <= "0110110";
                WHEN "110011" =>  memoryC0_uid134_exp2TabGen_q <= "0110111";
                WHEN "110100" =>  memoryC0_uid134_exp2TabGen_q <= "0111000";
                WHEN "110101" =>  memoryC0_uid134_exp2TabGen_q <= "0111000";
                WHEN "110110" =>  memoryC0_uid134_exp2TabGen_q <= "0111001";
                WHEN "110111" =>  memoryC0_uid134_exp2TabGen_q <= "0111010";
                WHEN "111000" =>  memoryC0_uid134_exp2TabGen_q <= "0111010";
                WHEN "111001" =>  memoryC0_uid134_exp2TabGen_q <= "0111011";
                WHEN "111010" =>  memoryC0_uid134_exp2TabGen_q <= "0111011";
                WHEN "111011" =>  memoryC0_uid134_exp2TabGen_q <= "0111100";
                WHEN "111100" =>  memoryC0_uid134_exp2TabGen_q <= "0111101";
                WHEN "111101" =>  memoryC0_uid134_exp2TabGen_q <= "0111101";
                WHEN "111110" =>  memoryC0_uid134_exp2TabGen_q <= "0111110";
                WHEN "111111" =>  memoryC0_uid134_exp2TabGen_q <= "0111111";
                WHEN OTHERS =>
                    memoryC0_uid134_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_nor(LOGICAL,878)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_nor_b <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_sticky_ena_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_nor_q <= not (ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_nor_a or ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_nor_b);

	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_sticky_ena(REG,879)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_nor_q = "1") THEN
                ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_sticky_ena_q <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_enaAnd(LOGICAL,880)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_enaAnd_a <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_sticky_ena_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_enaAnd_b <= en;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_enaAnd_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_enaAnd_a and ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_enaAnd_b;

	--ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem(DUALMEM,869)
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_ia <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_inputreg_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_aa <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdreg_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_ab <= ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_rdmux_q;
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 5,
        numwords_a => 23,
        width_b => 6,
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
        clocken1 => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_iq,
        address_a => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_aa,
        data_a => ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_ia
    );
    ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_reset0 <= areset;
        ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_iq(5 downto 0);

	--reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0(REG,278)@29
    reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_q <= ld_addr_uid47_fpExp2Test_b_to_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid133_exp2TabGen(LOOKUP,132)@30
    memoryC0_uid133_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC0_uid133_exp2TabGen_q <= "0000000000";
                WHEN "000001" =>  memoryC0_uid133_exp2TabGen_q <= "0101100100";
                WHEN "000010" =>  memoryC0_uid133_exp2TabGen_q <= "1011001101";
                WHEN "000011" =>  memoryC0_uid133_exp2TabGen_q <= "0000111010";
                WHEN "000100" =>  memoryC0_uid133_exp2TabGen_q <= "0110101010";
                WHEN "000101" =>  memoryC0_uid133_exp2TabGen_q <= "1100011111";
                WHEN "000110" =>  memoryC0_uid133_exp2TabGen_q <= "0010011000";
                WHEN "000111" =>  memoryC0_uid133_exp2TabGen_q <= "1000010100";
                WHEN "001000" =>  memoryC0_uid133_exp2TabGen_q <= "1110010101";
                WHEN "001001" =>  memoryC0_uid133_exp2TabGen_q <= "0100011010";
                WHEN "001010" =>  memoryC0_uid133_exp2TabGen_q <= "1010100100";
                WHEN "001011" =>  memoryC0_uid133_exp2TabGen_q <= "0000110001";
                WHEN "001100" =>  memoryC0_uid133_exp2TabGen_q <= "0111000011";
                WHEN "001101" =>  memoryC0_uid133_exp2TabGen_q <= "1101011010";
                WHEN "001110" =>  memoryC0_uid133_exp2TabGen_q <= "0011110100";
                WHEN "001111" =>  memoryC0_uid133_exp2TabGen_q <= "1010010100";
                WHEN "010000" =>  memoryC0_uid133_exp2TabGen_q <= "0000110111";
                WHEN "010001" =>  memoryC0_uid133_exp2TabGen_q <= "0111100000";
                WHEN "010010" =>  memoryC0_uid133_exp2TabGen_q <= "1110001101";
                WHEN "010011" =>  memoryC0_uid133_exp2TabGen_q <= "0100111110";
                WHEN "010100" =>  memoryC0_uid133_exp2TabGen_q <= "1011110101";
                WHEN "010101" =>  memoryC0_uid133_exp2TabGen_q <= "0010110000";
                WHEN "010110" =>  memoryC0_uid133_exp2TabGen_q <= "1001110000";
                WHEN "010111" =>  memoryC0_uid133_exp2TabGen_q <= "0000110101";
                WHEN "011000" =>  memoryC0_uid133_exp2TabGen_q <= "0111111110";
                WHEN "011001" =>  memoryC0_uid133_exp2TabGen_q <= "1111001101";
                WHEN "011010" =>  memoryC0_uid133_exp2TabGen_q <= "0110100001";
                WHEN "011011" =>  memoryC0_uid133_exp2TabGen_q <= "1101111010";
                WHEN "011100" =>  memoryC0_uid133_exp2TabGen_q <= "0101011000";
                WHEN "011101" =>  memoryC0_uid133_exp2TabGen_q <= "1100111011";
                WHEN "011110" =>  memoryC0_uid133_exp2TabGen_q <= "0100100011";
                WHEN "011111" =>  memoryC0_uid133_exp2TabGen_q <= "1100010001";
                WHEN "100000" =>  memoryC0_uid133_exp2TabGen_q <= "0100000100";
                WHEN "100001" =>  memoryC0_uid133_exp2TabGen_q <= "1011111101";
                WHEN "100010" =>  memoryC0_uid133_exp2TabGen_q <= "0011111011";
                WHEN "100011" =>  memoryC0_uid133_exp2TabGen_q <= "1011111111";
                WHEN "100100" =>  memoryC0_uid133_exp2TabGen_q <= "0100001000";
                WHEN "100101" =>  memoryC0_uid133_exp2TabGen_q <= "1100010111";
                WHEN "100110" =>  memoryC0_uid133_exp2TabGen_q <= "0100101100";
                WHEN "100111" =>  memoryC0_uid133_exp2TabGen_q <= "1101000110";
                WHEN "101000" =>  memoryC0_uid133_exp2TabGen_q <= "0101100111";
                WHEN "101001" =>  memoryC0_uid133_exp2TabGen_q <= "1110001101";
                WHEN "101010" =>  memoryC0_uid133_exp2TabGen_q <= "0110111001";
                WHEN "101011" =>  memoryC0_uid133_exp2TabGen_q <= "1111101100";
                WHEN "101100" =>  memoryC0_uid133_exp2TabGen_q <= "1000100100";
                WHEN "101101" =>  memoryC0_uid133_exp2TabGen_q <= "0001100011";
                WHEN "101110" =>  memoryC0_uid133_exp2TabGen_q <= "1010101000";
                WHEN "101111" =>  memoryC0_uid133_exp2TabGen_q <= "0011110011";
                WHEN "110000" =>  memoryC0_uid133_exp2TabGen_q <= "1101000100";
                WHEN "110001" =>  memoryC0_uid133_exp2TabGen_q <= "0110011101";
                WHEN "110010" =>  memoryC0_uid133_exp2TabGen_q <= "1111111011";
                WHEN "110011" =>  memoryC0_uid133_exp2TabGen_q <= "1001100000";
                WHEN "110100" =>  memoryC0_uid133_exp2TabGen_q <= "0011001100";
                WHEN "110101" =>  memoryC0_uid133_exp2TabGen_q <= "1100111111";
                WHEN "110110" =>  memoryC0_uid133_exp2TabGen_q <= "0110111001";
                WHEN "110111" =>  memoryC0_uid133_exp2TabGen_q <= "0000111001";
                WHEN "111000" =>  memoryC0_uid133_exp2TabGen_q <= "1011000000";
                WHEN "111001" =>  memoryC0_uid133_exp2TabGen_q <= "0101001111";
                WHEN "111010" =>  memoryC0_uid133_exp2TabGen_q <= "1111100100";
                WHEN "111011" =>  memoryC0_uid133_exp2TabGen_q <= "1010000001";
                WHEN "111100" =>  memoryC0_uid133_exp2TabGen_q <= "0100100101";
                WHEN "111101" =>  memoryC0_uid133_exp2TabGen_q <= "1111010000";
                WHEN "111110" =>  memoryC0_uid133_exp2TabGen_q <= "1010000011";
                WHEN "111111" =>  memoryC0_uid133_exp2TabGen_q <= "0100111110";
                WHEN OTHERS =>
                    memoryC0_uid133_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--memoryC0_uid132_exp2TabGen(LOOKUP,131)@30
    memoryC0_uid132_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC0_uid132_exp2TabGen_q <= "0000000000";
                WHEN "000001" =>  memoryC0_uid132_exp2TabGen_q <= "1101000111";
                WHEN "000010" =>  memoryC0_uid132_exp2TabGen_q <= "1000011010";
                WHEN "000011" =>  memoryC0_uid132_exp2TabGen_q <= "0010100011";
                WHEN "000100" =>  memoryC0_uid132_exp2TabGen_q <= "1100001101";
                WHEN "000101" =>  memoryC0_uid132_exp2TabGen_q <= "0110000110";
                WHEN "000110" =>  memoryC0_uid132_exp2TabGen_q <= "0000111010";
                WHEN "000111" =>  memoryC0_uid132_exp2TabGen_q <= "1101010101";
                WHEN "001000" =>  memoryC0_uid132_exp2TabGen_q <= "1100000111";
                WHEN "001001" =>  memoryC0_uid132_exp2TabGen_q <= "1101111101";
                WHEN "001010" =>  memoryC0_uid132_exp2TabGen_q <= "0011100110";
                WHEN "001011" =>  memoryC0_uid132_exp2TabGen_q <= "1101110001";
                WHEN "001100" =>  memoryC0_uid132_exp2TabGen_q <= "1101001101";
                WHEN "001101" =>  memoryC0_uid132_exp2TabGen_q <= "0010101100";
                WHEN "001110" =>  memoryC0_uid132_exp2TabGen_q <= "1110111110";
                WHEN "001111" =>  memoryC0_uid132_exp2TabGen_q <= "0010110100";
                WHEN "010000" =>  memoryC0_uid132_exp2TabGen_q <= "1111000001";
                WHEN "010001" =>  memoryC0_uid132_exp2TabGen_q <= "0100010110";
                WHEN "010010" =>  memoryC0_uid132_exp2TabGen_q <= "0011100110";
                WHEN "010011" =>  memoryC0_uid132_exp2TabGen_q <= "1101100110";
                WHEN "010100" =>  memoryC0_uid132_exp2TabGen_q <= "0011001001";
                WHEN "010101" =>  memoryC0_uid132_exp2TabGen_q <= "0101000100";
                WHEN "010110" =>  memoryC0_uid132_exp2TabGen_q <= "0100001100";
                WHEN "010111" =>  memoryC0_uid132_exp2TabGen_q <= "0001010110";
                WHEN "011000" =>  memoryC0_uid132_exp2TabGen_q <= "1101011010";
                WHEN "011001" =>  memoryC0_uid132_exp2TabGen_q <= "1001001110";
                WHEN "011010" =>  memoryC0_uid132_exp2TabGen_q <= "0101101010";
                WHEN "011011" =>  memoryC0_uid132_exp2TabGen_q <= "0011100110";
                WHEN "011100" =>  memoryC0_uid132_exp2TabGen_q <= "0011111011";
                WHEN "011101" =>  memoryC0_uid132_exp2TabGen_q <= "0111100010";
                WHEN "011110" =>  memoryC0_uid132_exp2TabGen_q <= "1111010110";
                WHEN "011111" =>  memoryC0_uid132_exp2TabGen_q <= "1100010000";
                WHEN "100000" =>  memoryC0_uid132_exp2TabGen_q <= "1111001100";
                WHEN "100001" =>  memoryC0_uid132_exp2TabGen_q <= "1001000111";
                WHEN "100010" =>  memoryC0_uid132_exp2TabGen_q <= "1010111101";
                WHEN "100011" =>  memoryC0_uid132_exp2TabGen_q <= "0101101010";
                WHEN "100100" =>  memoryC0_uid132_exp2TabGen_q <= "1010001110";
                WHEN "100101" =>  memoryC0_uid132_exp2TabGen_q <= "1001100110";
                WHEN "100110" =>  memoryC0_uid132_exp2TabGen_q <= "0100110011";
                WHEN "100111" =>  memoryC0_uid132_exp2TabGen_q <= "1100110011";
                WHEN "101000" =>  memoryC0_uid132_exp2TabGen_q <= "0010101000";
                WHEN "101001" =>  memoryC0_uid132_exp2TabGen_q <= "0111010011";
                WHEN "101010" =>  memoryC0_uid132_exp2TabGen_q <= "1011110110";
                WHEN "101011" =>  memoryC0_uid132_exp2TabGen_q <= "0001010011";
                WHEN "101100" =>  memoryC0_uid132_exp2TabGen_q <= "1000110000";
                WHEN "101101" =>  memoryC0_uid132_exp2TabGen_q <= "0011001111";
                WHEN "101110" =>  memoryC0_uid132_exp2TabGen_q <= "0001110110";
                WHEN "101111" =>  memoryC0_uid132_exp2TabGen_q <= "0101101010";
                WHEN "110000" =>  memoryC0_uid132_exp2TabGen_q <= "1111110011";
                WHEN "110001" =>  memoryC0_uid132_exp2TabGen_q <= "0001010111";
                WHEN "110010" =>  memoryC0_uid132_exp2TabGen_q <= "1011011110";
                WHEN "110011" =>  memoryC0_uid132_exp2TabGen_q <= "1111010010";
                WHEN "110100" =>  memoryC0_uid132_exp2TabGen_q <= "1101111011";
                WHEN "110101" =>  memoryC0_uid132_exp2TabGen_q <= "1000100101";
                WHEN "110110" =>  memoryC0_uid132_exp2TabGen_q <= "0000011011";
                WHEN "110111" =>  memoryC0_uid132_exp2TabGen_q <= "0110101001";
                WHEN "111000" =>  memoryC0_uid132_exp2TabGen_q <= "1100011011";
                WHEN "111001" =>  memoryC0_uid132_exp2TabGen_q <= "0011000000";
                WHEN "111010" =>  memoryC0_uid132_exp2TabGen_q <= "1011100110";
                WHEN "111011" =>  memoryC0_uid132_exp2TabGen_q <= "0111011100";
                WHEN "111100" =>  memoryC0_uid132_exp2TabGen_q <= "0111110100";
                WHEN "111101" =>  memoryC0_uid132_exp2TabGen_q <= "1101111101";
                WHEN "111110" =>  memoryC0_uid132_exp2TabGen_q <= "1011001011";
                WHEN "111111" =>  memoryC0_uid132_exp2TabGen_q <= "0000110000";
                WHEN OTHERS =>
                    memoryC0_uid132_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--memoryC0_uid131_exp2TabGen(LOOKUP,130)@30
    memoryC0_uid131_exp2TabGen: PROCESS (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid131_exp2TabGen_0_q_to_memoryC0_uid131_exp2TabGen_a_replace_mem_q) IS
                WHEN "000000" =>  memoryC0_uid131_exp2TabGen_q <= "0000000000";
                WHEN "000001" =>  memoryC0_uid131_exp2TabGen_q <= "1100111011";
                WHEN "000010" =>  memoryC0_uid131_exp2TabGen_q <= "0110001010";
                WHEN "000011" =>  memoryC0_uid131_exp2TabGen_q <= "0000111010";
                WHEN "000100" =>  memoryC0_uid131_exp2TabGen_q <= "1001111100";
                WHEN "000101" =>  memoryC0_uid131_exp2TabGen_q <= "0101101001";
                WHEN "000110" =>  memoryC0_uid131_exp2TabGen_q <= "0000001001";
                WHEN "000111" =>  memoryC0_uid131_exp2TabGen_q <= "1101010100";
                WHEN "001000" =>  memoryC0_uid131_exp2TabGen_q <= "1000111110";
                WHEN "001001" =>  memoryC0_uid131_exp2TabGen_q <= "0110110111";
                WHEN "001010" =>  memoryC0_uid131_exp2TabGen_q <= "0010110100";
                WHEN "001011" =>  memoryC0_uid131_exp2TabGen_q <= "0000110001";
                WHEN "001100" =>  memoryC0_uid131_exp2TabGen_q <= "1100111010";
                WHEN "001101" =>  memoryC0_uid131_exp2TabGen_q <= "1011110001";
                WHEN "001110" =>  memoryC0_uid131_exp2TabGen_q <= "1010001111";
                WHEN "001111" =>  memoryC0_uid131_exp2TabGen_q <= "1101110010";
                WHEN "010000" =>  memoryC0_uid131_exp2TabGen_q <= "0100011000";
                WHEN "010001" =>  memoryC0_uid131_exp2TabGen_q <= "0100110010";
                WHEN "010010" =>  memoryC0_uid131_exp2TabGen_q <= "1110011101";
                WHEN "010011" =>  memoryC0_uid131_exp2TabGen_q <= "1001110010";
                WHEN "010100" =>  memoryC0_uid131_exp2TabGen_q <= "1000001001";
                WHEN "010101" =>  memoryC0_uid131_exp2TabGen_q <= "0011111011";
                WHEN "010110" =>  memoryC0_uid131_exp2TabGen_q <= "0000110000";
                WHEN "010111" =>  memoryC0_uid131_exp2TabGen_q <= "1011100000";
                WHEN "011000" =>  memoryC0_uid131_exp2TabGen_q <= "1010011011";
                WHEN "011001" =>  memoryC0_uid131_exp2TabGen_q <= "1101001110";
                WHEN "011010" =>  memoryC0_uid131_exp2TabGen_q <= "1101001110";
                WHEN "011011" =>  memoryC0_uid131_exp2TabGen_q <= "1101011010";
                WHEN "011100" =>  memoryC0_uid131_exp2TabGen_q <= "1010100100";
                WHEN "011101" =>  memoryC0_uid131_exp2TabGen_q <= "1011010110";
                WHEN "011110" =>  memoryC0_uid131_exp2TabGen_q <= "0000011101";
                WHEN "011111" =>  memoryC0_uid131_exp2TabGen_q <= "0100101010";
                WHEN "100000" =>  memoryC0_uid131_exp2TabGen_q <= "1100111111";
                WHEN "100001" =>  memoryC0_uid131_exp2TabGen_q <= "1000110010";
                WHEN "100010" =>  memoryC0_uid131_exp2TabGen_q <= "0001110110";
                WHEN "100011" =>  memoryC0_uid131_exp2TabGen_q <= "1100100001";
                WHEN "100100" =>  memoryC0_uid131_exp2TabGen_q <= "0111110101";
                WHEN "100101" =>  memoryC0_uid131_exp2TabGen_q <= "1101100111";
                WHEN "100110" =>  memoryC0_uid131_exp2TabGen_q <= "0010100110";
                WHEN "100111" =>  memoryC0_uid131_exp2TabGen_q <= "0110100010";
                WHEN "101000" =>  memoryC0_uid131_exp2TabGen_q <= "0100010101";
                WHEN "101001" =>  memoryC0_uid131_exp2TabGen_q <= "0010001010";
                WHEN "101010" =>  memoryC0_uid131_exp2TabGen_q <= "0001100110";
                WHEN "101011" =>  memoryC0_uid131_exp2TabGen_q <= "1111101111";
                WHEN "101100" =>  memoryC0_uid131_exp2TabGen_q <= "0101010001";
                WHEN "101101" =>  memoryC0_uid131_exp2TabGen_q <= "0110101110";
                WHEN "101110" =>  memoryC0_uid131_exp2TabGen_q <= "0100011111";
                WHEN "101111" =>  memoryC0_uid131_exp2TabGen_q <= "1010111100";
                WHEN "110000" =>  memoryC0_uid131_exp2TabGen_q <= "0010101101";
                WHEN "110001" =>  memoryC0_uid131_exp2TabGen_q <= "0000100111";
                WHEN "110010" =>  memoryC0_uid131_exp2TabGen_q <= "0101111101";
                WHEN "110011" =>  memoryC0_uid131_exp2TabGen_q <= "0000100101";
                WHEN "110100" =>  memoryC0_uid131_exp2TabGen_q <= "1011000010";
                WHEN "110101" =>  memoryC0_uid131_exp2TabGen_q <= "1100101011";
                WHEN "110110" =>  memoryC0_uid131_exp2TabGen_q <= "1001110111";
                WHEN "110111" =>  memoryC0_uid131_exp2TabGen_q <= "0100000011";
                WHEN "111000" =>  memoryC0_uid131_exp2TabGen_q <= "1001111101";
                WHEN "111001" =>  memoryC0_uid131_exp2TabGen_q <= "0111101101";
                WHEN "111010" =>  memoryC0_uid131_exp2TabGen_q <= "0110111101";
                WHEN "111011" =>  memoryC0_uid131_exp2TabGen_q <= "1111000101";
                WHEN "111100" =>  memoryC0_uid131_exp2TabGen_q <= "0101010010";
                WHEN "111101" =>  memoryC0_uid131_exp2TabGen_q <= "1100110000";
                WHEN "111110" =>  memoryC0_uid131_exp2TabGen_q <= "0110110111";
                WHEN "111111" =>  memoryC0_uid131_exp2TabGen_q <= "0011001111";
                WHEN OTHERS =>
                    memoryC0_uid131_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--memoryC0_uid130_exp2TabGen(LOOKUP,129)@30
    memoryC0_uid130_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC0_uid130_exp2TabGen_q <= "0000000000";
                WHEN "000001" =>  memoryC0_uid130_exp2TabGen_q <= "1100000000";
                WHEN "000010" =>  memoryC0_uid130_exp2TabGen_q <= "1100001010";
                WHEN "000011" =>  memoryC0_uid130_exp2TabGen_q <= "1100110111";
                WHEN "000100" =>  memoryC0_uid130_exp2TabGen_q <= "1100010010";
                WHEN "000101" =>  memoryC0_uid130_exp2TabGen_q <= "1110100011";
                WHEN "000110" =>  memoryC0_uid130_exp2TabGen_q <= "0010110110";
                WHEN "000111" =>  memoryC0_uid130_exp2TabGen_q <= "1001011011";
                WHEN "001000" =>  memoryC0_uid130_exp2TabGen_q <= "1010100010";
                WHEN "001001" =>  memoryC0_uid130_exp2TabGen_q <= "1110010110";
                WHEN "001010" =>  memoryC0_uid130_exp2TabGen_q <= "0101110011";
                WHEN "001011" =>  memoryC0_uid130_exp2TabGen_q <= "0100011001";
                WHEN "001100" =>  memoryC0_uid130_exp2TabGen_q <= "1011000100";
                WHEN "001101" =>  memoryC0_uid130_exp2TabGen_q <= "0011111001";
                WHEN "001110" =>  memoryC0_uid130_exp2TabGen_q <= "1110111101";
                WHEN "001111" =>  memoryC0_uid130_exp2TabGen_q <= "0000000110";
                WHEN "010000" =>  memoryC0_uid130_exp2TabGen_q <= "1101101110";
                WHEN "010001" =>  memoryC0_uid130_exp2TabGen_q <= "0000101101";
                WHEN "010010" =>  memoryC0_uid130_exp2TabGen_q <= "0101010011";
                WHEN "010011" =>  memoryC0_uid130_exp2TabGen_q <= "1100111111";
                WHEN "010100" =>  memoryC0_uid130_exp2TabGen_q <= "0001101000";
                WHEN "010101" =>  memoryC0_uid130_exp2TabGen_q <= "1001011100";
                WHEN "010110" =>  memoryC0_uid130_exp2TabGen_q <= "1100010010";
                WHEN "010111" =>  memoryC0_uid130_exp2TabGen_q <= "1001111001";
                WHEN "011000" =>  memoryC0_uid130_exp2TabGen_q <= "0001010100";
                WHEN "011001" =>  memoryC0_uid130_exp2TabGen_q <= "1001011001";
                WHEN "011010" =>  memoryC0_uid130_exp2TabGen_q <= "1010011111";
                WHEN "011011" =>  memoryC0_uid130_exp2TabGen_q <= "1001001111";
                WHEN "011100" =>  memoryC0_uid130_exp2TabGen_q <= "0010101000";
                WHEN "011101" =>  memoryC0_uid130_exp2TabGen_q <= "1001000010";
                WHEN "011110" =>  memoryC0_uid130_exp2TabGen_q <= "0010101011";
                WHEN "011111" =>  memoryC0_uid130_exp2TabGen_q <= "1001000100";
                WHEN "100000" =>  memoryC0_uid130_exp2TabGen_q <= "1001110111";
                WHEN "100001" =>  memoryC0_uid130_exp2TabGen_q <= "1000110100";
                WHEN "100010" =>  memoryC0_uid130_exp2TabGen_q <= "0010111110";
                WHEN "100011" =>  memoryC0_uid130_exp2TabGen_q <= "0011001111";
                WHEN "100100" =>  memoryC0_uid130_exp2TabGen_q <= "1000000011";
                WHEN "100101" =>  memoryC0_uid130_exp2TabGen_q <= "1010011100";
                WHEN "100110" =>  memoryC0_uid130_exp2TabGen_q <= "0110011100";
                WHEN "100111" =>  memoryC0_uid130_exp2TabGen_q <= "0100100101";
                WHEN "101000" =>  memoryC0_uid130_exp2TabGen_q <= "0101000001";
                WHEN "101001" =>  memoryC0_uid130_exp2TabGen_q <= "1011101110";
                WHEN "101010" =>  memoryC0_uid130_exp2TabGen_q <= "1110001011";
                WHEN "101011" =>  memoryC0_uid130_exp2TabGen_q <= "0010011100";
                WHEN "101100" =>  memoryC0_uid130_exp2TabGen_q <= "1111100001";
                WHEN "101101" =>  memoryC0_uid130_exp2TabGen_q <= "1111001010";
                WHEN "101110" =>  memoryC0_uid130_exp2TabGen_q <= "0001001010";
                WHEN "101111" =>  memoryC0_uid130_exp2TabGen_q <= "1111111011";
                WHEN "110000" =>  memoryC0_uid130_exp2TabGen_q <= "0110100111";
                WHEN "110001" =>  memoryC0_uid130_exp2TabGen_q <= "1000101011";
                WHEN "110010" =>  memoryC0_uid130_exp2TabGen_q <= "1010111100";
                WHEN "110011" =>  memoryC0_uid130_exp2TabGen_q <= "1110000011";
                WHEN "110100" =>  memoryC0_uid130_exp2TabGen_q <= "1010100101";
                WHEN "110101" =>  memoryC0_uid130_exp2TabGen_q <= "1110100010";
                WHEN "110110" =>  memoryC0_uid130_exp2TabGen_q <= "1100100000";
                WHEN "110111" =>  memoryC0_uid130_exp2TabGen_q <= "1100010010";
                WHEN "111000" =>  memoryC0_uid130_exp2TabGen_q <= "1101001001";
                WHEN "111001" =>  memoryC0_uid130_exp2TabGen_q <= "1001100101";
                WHEN "111010" =>  memoryC0_uid130_exp2TabGen_q <= "1100110110";
                WHEN "111011" =>  memoryC0_uid130_exp2TabGen_q <= "1001111111";
                WHEN "111100" =>  memoryC0_uid130_exp2TabGen_q <= "0100100001";
                WHEN "111101" =>  memoryC0_uid130_exp2TabGen_q <= "1010110100";
                WHEN "111110" =>  memoryC0_uid130_exp2TabGen_q <= "0010001010";
                WHEN "111111" =>  memoryC0_uid130_exp2TabGen_q <= "0100100001";
                WHEN OTHERS =>
                    memoryC0_uid130_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--memoryC0_uid129_exp2TabGen(LOOKUP,128)@30
    memoryC0_uid129_exp2TabGen: PROCESS (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_addr_uid47_fpExp2Test_0_to_memoryC0_uid129_exp2TabGen_0_q) IS
                WHEN "000000" =>  memoryC0_uid129_exp2TabGen_q <= "0000000100";
                WHEN "000001" =>  memoryC0_uid129_exp2TabGen_q <= "1100001011";
                WHEN "000010" =>  memoryC0_uid129_exp2TabGen_q <= "1110100110";
                WHEN "000011" =>  memoryC0_uid129_exp2TabGen_q <= "1001000100";
                WHEN "000100" =>  memoryC0_uid129_exp2TabGen_q <= "0001111111";
                WHEN "000101" =>  memoryC0_uid129_exp2TabGen_q <= "0100010100";
                WHEN "000110" =>  memoryC0_uid129_exp2TabGen_q <= "1010001001";
                WHEN "000111" =>  memoryC0_uid129_exp2TabGen_q <= "1100000010";
                WHEN "001000" =>  memoryC0_uid129_exp2TabGen_q <= "1111011011";
                WHEN "001001" =>  memoryC0_uid129_exp2TabGen_q <= "1110101110";
                WHEN "001010" =>  memoryC0_uid129_exp2TabGen_q <= "0101011000";
                WHEN "001011" =>  memoryC0_uid129_exp2TabGen_q <= "1010110110";
                WHEN "001100" =>  memoryC0_uid129_exp2TabGen_q <= "0111000111";
                WHEN "001101" =>  memoryC0_uid129_exp2TabGen_q <= "1011101101";
                WHEN "001110" =>  memoryC0_uid129_exp2TabGen_q <= "1100001101";
                WHEN "001111" =>  memoryC0_uid129_exp2TabGen_q <= "0001011110";
                WHEN "010000" =>  memoryC0_uid129_exp2TabGen_q <= "0010101101";
                WHEN "010001" =>  memoryC0_uid129_exp2TabGen_q <= "1111111110";
                WHEN "010010" =>  memoryC0_uid129_exp2TabGen_q <= "1001011001";
                WHEN "010011" =>  memoryC0_uid129_exp2TabGen_q <= "1110111011";
                WHEN "010100" =>  memoryC0_uid129_exp2TabGen_q <= "0100010110";
                WHEN "010101" =>  memoryC0_uid129_exp2TabGen_q <= "0101010100";
                WHEN "010110" =>  memoryC0_uid129_exp2TabGen_q <= "0101101100";
                WHEN "010111" =>  memoryC0_uid129_exp2TabGen_q <= "1010000101";
                WHEN "011000" =>  memoryC0_uid129_exp2TabGen_q <= "0100111101";
                WHEN "011001" =>  memoryC0_uid129_exp2TabGen_q <= "0100111001";
                WHEN "011010" =>  memoryC0_uid129_exp2TabGen_q <= "0000010011";
                WHEN "011011" =>  memoryC0_uid129_exp2TabGen_q <= "1011010111";
                WHEN "011100" =>  memoryC0_uid129_exp2TabGen_q <= "0101001111";
                WHEN "011101" =>  memoryC0_uid129_exp2TabGen_q <= "1001000111";
                WHEN "011110" =>  memoryC0_uid129_exp2TabGen_q <= "0000101010";
                WHEN "011111" =>  memoryC0_uid129_exp2TabGen_q <= "0100101000";
                WHEN "100000" =>  memoryC0_uid129_exp2TabGen_q <= "1001101000";
                WHEN "100001" =>  memoryC0_uid129_exp2TabGen_q <= "0101111100";
                WHEN "100010" =>  memoryC0_uid129_exp2TabGen_q <= "1110100011";
                WHEN "100011" =>  memoryC0_uid129_exp2TabGen_q <= "1001001010";
                WHEN "100100" =>  memoryC0_uid129_exp2TabGen_q <= "0000111011";
                WHEN "100101" =>  memoryC0_uid129_exp2TabGen_q <= "1100010100";
                WHEN "100110" =>  memoryC0_uid129_exp2TabGen_q <= "0010011000";
                WHEN "100111" =>  memoryC0_uid129_exp2TabGen_q <= "1101101000";
                WHEN "101000" =>  memoryC0_uid129_exp2TabGen_q <= "1011011111";
                WHEN "101001" =>  memoryC0_uid129_exp2TabGen_q <= "0110110101";
                WHEN "101010" =>  memoryC0_uid129_exp2TabGen_q <= "1100101100";
                WHEN "101011" =>  memoryC0_uid129_exp2TabGen_q <= "1010000000";
                WHEN "101100" =>  memoryC0_uid129_exp2TabGen_q <= "0010000101";
                WHEN "101101" =>  memoryC0_uid129_exp2TabGen_q <= "1100101010";
                WHEN "101110" =>  memoryC0_uid129_exp2TabGen_q <= "1011101000";
                WHEN "101111" =>  memoryC0_uid129_exp2TabGen_q <= "0111111110";
                WHEN "110000" =>  memoryC0_uid129_exp2TabGen_q <= "0101101111";
                WHEN "110001" =>  memoryC0_uid129_exp2TabGen_q <= "1111011100";
                WHEN "110010" =>  memoryC0_uid129_exp2TabGen_q <= "1000111011";
                WHEN "110011" =>  memoryC0_uid129_exp2TabGen_q <= "1010010101";
                WHEN "110100" =>  memoryC0_uid129_exp2TabGen_q <= "0011100101";
                WHEN "110101" =>  memoryC0_uid129_exp2TabGen_q <= "1001011110";
                WHEN "110110" =>  memoryC0_uid129_exp2TabGen_q <= "1101001101";
                WHEN "110111" =>  memoryC0_uid129_exp2TabGen_q <= "1111100000";
                WHEN "111000" =>  memoryC0_uid129_exp2TabGen_q <= "0000111101";
                WHEN "111001" =>  memoryC0_uid129_exp2TabGen_q <= "0000101111";
                WHEN "111010" =>  memoryC0_uid129_exp2TabGen_q <= "1011111010";
                WHEN "111011" =>  memoryC0_uid129_exp2TabGen_q <= "1110110101";
                WHEN "111100" =>  memoryC0_uid129_exp2TabGen_q <= "1011010000";
                WHEN "111101" =>  memoryC0_uid129_exp2TabGen_q <= "0101000000";
                WHEN "111110" =>  memoryC0_uid129_exp2TabGen_q <= "1000000111";
                WHEN "111111" =>  memoryC0_uid129_exp2TabGen_q <= "1011000101";
                WHEN OTHERS =>
                    memoryC0_uid129_exp2TabGen_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--os_uid135_exp2TabGen(BITJOIN,134)@30
    os_uid135_exp2TabGen_q <= memoryC0_uid134_exp2TabGen_q & memoryC0_uid133_exp2TabGen_q & memoryC0_uid132_exp2TabGen_q & memoryC0_uid131_exp2TabGen_q & memoryC0_uid130_exp2TabGen_q & memoryC0_uid129_exp2TabGen_q;

	--rndBit_uid187_exp2PolyEval(CONSTANT,186)
    rndBit_uid187_exp2PolyEval_q <= "001";

	--cIncludingRoundingBit_uid188_exp2PolyEval(BITJOIN,187)@30
    cIncludingRoundingBit_uid188_exp2PolyEval_q <= os_uid135_exp2TabGen_q & rndBit_uid187_exp2PolyEval_q;

	--reg_cIncludingRoundingBit_uid188_exp2PolyEval_0_to_ts5_uid189_exp2PolyEval_0(REG,335)@30
    reg_cIncludingRoundingBit_uid188_exp2PolyEval_0_to_ts5_uid189_exp2PolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid188_exp2PolyEval_0_to_ts5_uid189_exp2PolyEval_0_q <= "000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cIncludingRoundingBit_uid188_exp2PolyEval_0_to_ts5_uid189_exp2PolyEval_0_q <= cIncludingRoundingBit_uid188_exp2PolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ts5_uid189_exp2PolyEval(ADD,188)@31
    ts5_uid189_exp2PolyEval_a <= STD_LOGIC_VECTOR((60 downto 60 => reg_cIncludingRoundingBit_uid188_exp2PolyEval_0_to_ts5_uid189_exp2PolyEval_0_q(59)) & reg_cIncludingRoundingBit_uid188_exp2PolyEval_0_to_ts5_uid189_exp2PolyEval_0_q);
    ts5_uid189_exp2PolyEval_b <= STD_LOGIC_VECTOR((60 downto 55 => reg_R_uid258_pT5_uid186_exp2PolyEval_0_to_ts5_uid189_exp2PolyEval_1_q(54)) & reg_R_uid258_pT5_uid186_exp2PolyEval_0_to_ts5_uid189_exp2PolyEval_1_q);
            ts5_uid189_exp2PolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts5_uid189_exp2PolyEval_a) + SIGNED(ts5_uid189_exp2PolyEval_b));
    ts5_uid189_exp2PolyEval_q <= ts5_uid189_exp2PolyEval_o(60 downto 0);


	--s5_uid190_exp2PolyEval(BITSELECT,189)@31
    s5_uid190_exp2PolyEval_in <= ts5_uid189_exp2PolyEval_q;
    s5_uid190_exp2PolyEval_b <= s5_uid190_exp2PolyEval_in(60 downto 1);

	--peOR_uid50_fpExp2Test(BITSELECT,49)@31
    peOR_uid50_fpExp2Test_in <= s5_uid190_exp2PolyEval_b(57 downto 0);
    peOR_uid50_fpExp2Test_b <= peOR_uid50_fpExp2Test_in(57 downto 5);

	--fracR_uid52_fpExp2Test(BITSELECT,51)@31
    fracR_uid52_fpExp2Test_in <= peOR_uid50_fpExp2Test_b(51 downto 0);
    fracR_uid52_fpExp2Test_b <= fracR_uid52_fpExp2Test_in(51 downto 0);

	--reg_fracR_uid52_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_3(REG,338)@31
    reg_fracR_uid52_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracR_uid52_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_3_q <= "0000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracR_uid52_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_3_q <= fracR_uid52_fpExp2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_nor(LOGICAL,724)
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_nor_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_notEnable_q;
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_nor_b <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_sticky_ena_q;
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_nor_q <= not (ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_nor_a or ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_nor_b);

	--ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_sticky_ena(REG,725)
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_nor_q = "1") THEN
                ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_sticky_ena_q <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_enaAnd(LOGICAL,726)
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_enaAnd_a <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_sticky_ena_q;
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_enaAnd_b <= en;
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_enaAnd_q <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_enaAnd_a and ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_enaAnd_b;

	--reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1(REG,337)@7
    reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q <= excREnc_uid70_fpExp2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_inputreg(DELAY,714)
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_inputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q, xout => ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem(DUALMEM,715)
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_ia <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_inputreg_q;
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_aa <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdreg_q;
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_ab <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_rdmux_q;
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 2,
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
        clocken1 => ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_iq,
        address_a => ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_aa,
        data_a => ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_ia
    );
    ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_reset0 <= areset;
        ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_q <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_iq(1 downto 0);

	--fracRPostExc_uid74_fpExp2Test(MUX,73)@32
    fracRPostExc_uid74_fpExp2Test_s <= ld_reg_excREnc_uid70_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_1_q_to_fracRPostExc_uid74_fpExp2Test_b_replace_mem_q;
    fracRPostExc_uid74_fpExp2Test: PROCESS (fracRPostExc_uid74_fpExp2Test_s, en, cstAllZWF_uid17_fpExp2Test_q, reg_fracR_uid52_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_3_q, cstAllZWF_uid17_fpExp2Test_q, oneFracRPostExc2_uid71_fpExp2Test_q)
    BEGIN
            CASE fracRPostExc_uid74_fpExp2Test_s IS
                  WHEN "00" => fracRPostExc_uid74_fpExp2Test_q <= cstAllZWF_uid17_fpExp2Test_q;
                  WHEN "01" => fracRPostExc_uid74_fpExp2Test_q <= reg_fracR_uid52_fpExp2Test_0_to_fracRPostExc_uid74_fpExp2Test_3_q;
                  WHEN "10" => fracRPostExc_uid74_fpExp2Test_q <= cstAllZWF_uid17_fpExp2Test_q;
                  WHEN "11" => fracRPostExc_uid74_fpExp2Test_q <= oneFracRPostExc2_uid71_fpExp2Test_q;
                  WHEN OTHERS => fracRPostExc_uid74_fpExp2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RExp2_uid79_fpExp2Test(BITJOIN,78)@32
    RExp2_uid79_fpExp2Test_q <= GND_q & ld_expRPostExc_uid78_fpExp2Test_q_to_RExp2_uid79_fpExp2Test_b_replace_mem_q & fracRPostExc_uid74_fpExp2Test_q;

	--xOut(GPOUT,4)@32
    q <= RExp2_uid79_fpExp2Test_q;


end normal;
